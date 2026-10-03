import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import '../../models/network/manet_node.dart';

/// Service d'écoute passive MA-Net (lecture seule).
///
/// Écoute le port UDP 6549 et détecte automatiquement les nœuds
/// MA-Net2 et MA-Net3 qui broadcastent sur le réseau local.
/// Aucune configuration n'est envoyée aux équipements.
class MaNetService {
  static const _kPort = 6549;
  static const _kOfflineAfter = Duration(seconds: 90);

  final _controller = StreamController<List<MaNetNode>>.broadcast();
  final _nodes = <String, MaNetNode>{};
  RawDatagramSocket? _socket;
  Timer? _gcTimer;

  Stream<List<MaNetNode>> get stream => _controller.stream;
  List<MaNetNode> get nodes => List.unmodifiable(_nodes.values.toList());

  Future<void> start() async {
    try {
      _socket = await RawDatagramSocket.bind(
        InternetAddress.anyIPv4,
        _kPort,
        reuseAddress: true,
        reusePort: true,
      );
      _socket!.broadcastEnabled = true;
      _socket!.listen(_onEvent);
      _gcTimer =
          Timer.periodic(const Duration(seconds: 30), (_) => _gcOffline());
    } catch (_) {
      // Port déjà utilisé ou permission réseau refusée — écoute silencieusement
    }
  }

  void dispose() {
    _gcTimer?.cancel();
    _socket?.close();
    _controller.close();
  }

  void _onEvent(RawSocketEvent event) {
    if (event != RawSocketEvent.read) return;
    final dg = _socket?.receive();
    if (dg == null) return;
    final ip = dg.address.address;
    final node = _parse(ip, dg.data);
    if (node == null) return;
    _nodes[ip] = node;
    _controller.add(_sortedNodes());
  }

  /// Marque les nœuds silencieux depuis plus de [_kOfflineAfter] comme hors ligne.
  void _gcOffline() {
    final cutoff = DateTime.now().subtract(_kOfflineAfter);
    bool changed = false;
    for (final entry in _nodes.entries) {
      final node = entry.value;
      if (node.lastSeen.isBefore(cutoff) && node.isOnline) {
        _nodes[entry.key] = node.copyWith(isOnline: false);
        changed = true;
      }
    }
    if (changed) _controller.add(_sortedNodes());
  }

  List<MaNetNode> _sortedNodes() {
    final list = _nodes.values.toList();
    list.sort((a, b) {
      if (a.isOnline != b.isOnline) return a.isOnline ? -1 : 1;
      return a.displayName.compareTo(b.displayName);
    });
    return list;
  }

  // ─── Parsing des paquets UDP ───────────────────────────────────────────────

  MaNetNode? _parse(String ip, Uint8List data) {
    if (data.length < 6) return null;

    MaNetProtocol protocol = MaNetProtocol.unknown;

    // Détection du protocole via magic bytes
    // MA-Net2 : byte[0]==0x00 && byte[1]==0x80
    // MA-Net3 : byte[0]==0x00 && byte[1]==0x81
    if (data.length >= 2 && data[0] == 0x00) {
      if (data[1] == 0x80) {
        protocol = MaNetProtocol.maNet2;
      } else if (data[1] == 0x81) {
        protocol = MaNetProtocol.maNet3;
      }
    }

    String? mac;
    String? firmware;
    String? name;
    String? nodeType;

    if (protocol == MaNetProtocol.maNet2 || protocol == MaNetProtocol.maNet3) {
      // Parse structuré :
      // Bytes 8-13 : MAC source
      // Bytes 15-17 : version major.minor.patch
      // Bytes 18-49 : nom du nœud (null-terminated, 32 octets)
      // Bytes 50-81 : type du nœud (null-terminated, 32 octets)
      if (data.length >= 14) {
        mac = _extractMac(data, offset: 8);
      }
      if (data.length >= 18) {
        final maj = data[15];
        final min = data[16];
        final pat = data[17];
        if (maj > 0 || min > 0 || pat > 0) {
          firmware = '$maj.$min.$pat';
        }
      }
      if (data.length > 18) {
        name = _nullTermString(data, offset: 18, maxLen: 32);
      }
      if (data.length > 50) {
        nodeType = _nullTermString(data, offset: 50, maxLen: 32);
      }

      // Fallback : extraction de strings si le parse structuré échoue
      if (name == null || name.isEmpty) {
        final strings =
            _extractStrings(data, startOffset: 14, minLen: 2, maxStrings: 3);
        if (strings.isNotEmpty) name = strings[0];
        if (strings.length > 1) nodeType = strings[1];
      }
    } else {
      // Protocole inconnu : extraction heuristique de strings
      // (accepte uniquement si on trouve au moins une string de 3+ chars)
      final strings =
          _extractStrings(data, startOffset: 0, minLen: 3, maxStrings: 3);
      if (strings.isEmpty) return null;
      name = strings[0];
      if (strings.length > 1) nodeType = strings[1];
    }

    return MaNetNode(
      ip: ip,
      mac: mac,
      name: (name != null && name.isNotEmpty) ? name : null,
      nodeType: (nodeType != null && nodeType.isNotEmpty) ? nodeType : null,
      firmwareVersion: firmware,
      protocol: protocol,
      lastSeen: DateTime.now(),
      isOnline: true,
    );
  }

  /// Extrait une adresse MAC à partir d'un offset dans le paquet.
  String? _extractMac(Uint8List data, {required int offset}) {
    if (data.length < offset + 6) return null;
    bool allZero = true;
    for (int i = offset; i < offset + 6; i++) {
      if (data[i] != 0) {
        allZero = false;
        break;
      }
    }
    if (allZero) return null;
    return List.generate(
      6,
      (i) => data[offset + i].toRadixString(16).padLeft(2, '0'),
    ).join(':');
  }

  /// Lit une chaîne null-terminée à un offset donné.
  String? _nullTermString(Uint8List data,
      {required int offset, required int maxLen}) {
    if (offset >= data.length) return null;
    final end = (offset + maxLen).clamp(0, data.length);
    final buf = StringBuffer();
    for (int i = offset; i < end; i++) {
      final b = data[i];
      if (b == 0) break;
      if (b >= 0x20 && b < 0x7F) buf.writeCharCode(b);
    }
    final s = buf.toString().trim();
    return s.isEmpty ? null : s;
  }

  /// Extraction heuristique de strings ASCII null-terminées dans le paquet.
  List<String> _extractStrings(
    Uint8List data, {
    required int startOffset,
    int minLen = 2,
    int maxStrings = 4,
  }) {
    final result = <String>[];
    final buf = StringBuffer();
    for (int i = startOffset; i < data.length && result.length < maxStrings; i++) {
      final b = data[i];
      if (b == 0) {
        final s = buf.toString().trim();
        if (s.length >= minLen) result.add(s);
        buf.clear();
      } else if (b >= 0x20 && b < 0x7F) {
        buf.writeCharCode(b);
      } else {
        buf.clear();
      }
    }
    final s = buf.toString().trim();
    if (s.length >= minLen && result.length < maxStrings) result.add(s);
    return result;
  }
}
