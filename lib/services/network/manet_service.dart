import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import '../../models/network/manet_node.dart';
import 'multicast_helper.dart';

/// Service d'écoute passive MA-Net3 (lecture seule).
///
/// grandMA3 (MA-Net3) communique en **multicast UDP sur le port 30020**
/// (doc MA « Network Protocols ») :
///   236.4.1.0          → groupe d'administration (tous les devices/sessions)
///   236.4.1.1 + 4×n…   → données de session (lourdes, on ne s'y abonne pas)
///   239.4.1.x          → même plan si l'option « Alternative » est activée
///
/// On rejoint uniquement les groupes d'administration : c'est là que chaque
/// console / onPC / node / processing unit s'annonce, et le trafic reste léger.
/// Aucune donnée n'est envoyée aux équipements.
class MaNetService {
  static const kPort = 30020;
  static const kAdminGroups = ['236.4.1.0', '239.4.1.0'];
  static const _kOfflineAfter = Duration(seconds: 30);

  final _controller = StreamController<List<MaNetNode>>.broadcast();
  final _nodes = <String, MaNetNode>{};
  RawDatagramSocket? _socket;
  Timer? _gcTimer;

  /// Dernière erreur rencontrée au démarrage (null si tout va bien).
  String? lastError;

  Stream<List<MaNetNode>> get stream => _controller.stream;
  List<MaNetNode> get nodes => List.unmodifiable(_nodes.values.toList());

  Future<void> start() async {
    await MulticastHelper.acquire();
    await MulticastHelper.refreshInterfaces();

    try {
      _socket = await RawDatagramSocket.bind(
        InternetAddress.anyIPv4,
        kPort,
        reuseAddress: true,
        reusePort: !Platform.isWindows,
      );
    } catch (e) {
      lastError = 'bind UDP $kPort : $e';
      return;
    }

    _socket!
      ..broadcastEnabled = true
      ..multicastLoopback = false;

    await _joinAdminGroups();

    _socket!.listen(_onEvent);
    _gcTimer = Timer.periodic(const Duration(seconds: 5), (_) => _gcOffline());
  }

  Future<void> _joinAdminGroups() async {
    var joined = 0;
    for (final group in kAdminGroups) {
      if (MulticastHelper.joinOnAllInterfaces(_socket!, group)) joined++;
    }
    if (joined == 0) {
      lastError = 'Impossible de rejoindre le multicast MA-Net3 '
          '(permission réseau local / entitlement multicast ?)';
    }
  }

  void dispose() {
    _gcTimer?.cancel();
    _socket?.close();
    _controller.close();
    MulticastHelper.release();
  }

  void _onEvent(RawSocketEvent event) {
    if (event != RawSocketEvent.read) return;
    Datagram? dg;
    while ((dg = _socket?.receive()) != null) {
      final ip = dg!.address.address;
      final previous = _nodes[ip];
      final node = _parse(ip, dg.data, previous);
      _nodes[ip] = node;
      if (previous == null ||
          !previous.isOnline ||
          previous.name != node.name ||
          previous.nodeType != node.nodeType ||
          previous.sessionName != node.sessionName) {
        _controller.add(_sortedNodes());
      }
    }
  }

  void _gcOffline() {
    final cutoff = DateTime.now().subtract(_kOfflineAfter);
    var changed = false;
    for (final entry in _nodes.entries.toList()) {
      final node = entry.value;
      if (node.isOnline && node.lastSeen.isBefore(cutoff)) {
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

  // ─── Parsing ───────────────────────────────────────────────────────────────
  //
  // Format MA-Net3 (non documenté, relevé par capture sur grandMA3 v2.x) :
  //   0-1     "BS"                       signature
  //   2-3     type de message            0x08 0x81 = annonce de station (268 o)
  //   8-11    IP de l'émetteur
  //   12-13   classe d'équipement        0x0001 console, 0x0003 processing unit
  //   14      modèle (hypothèse)         0x16 = light, 0x28 = PU M
  //   120-151 nom de la session          (ASCII, 0-terminé)
  //   184-215 nom de la station          (ASCII, 0-terminé)
  //   224-229 adresse MAC                (préfixe MA Lighting e4:4f:29)
  // Les autres types de messages (données de session…) mettent seulement
  // à jour « vu à ». Un émetteur inconnu est quand même affiché par son IP.

  static const _kAnnounceLen = 230;

  MaNetNode _parse(String ip, Uint8List d, MaNetNode? previous) {
    final isAnnounce = d.length >= _kAnnounceLen &&
        d[0] == 0x42 && d[1] == 0x53 && d[2] == 0x08 && d[3] == 0x81;

    if (!isAnnounce) {
      return (previous ??
              MaNetNode(
                ip: ip,
                protocol: MaNetProtocol.maNet3,
                lastSeen: DateTime.now(),
              ))
          .copyWith(lastSeen: DateTime.now(), isOnline: true);
    }

    final classCode = (d[12] << 8) | d[13];
    final deviceClass = switch (classCode) {
      0x0001 => MaDeviceClass.console,
      0x0003 => MaDeviceClass.processingUnit,
      _ => MaDeviceClass.unknown,
    };
    final name = _cString(d, 184, 32);
    final session = _cString(d, 120, 32);
    final mac = List.generate(
        6, (i) => d[224 + i].toRadixString(16).padLeft(2, '0')).join(':');

    return MaNetNode(
      ip: ip,
      mac: mac,
      name: name,
      nodeType: _describe(deviceClass, classCode, d[14], name),
      sessionName: session,
      deviceClass: deviceClass,
      firmwareVersion: previous?.firmwareVersion,
      protocol: MaNetProtocol.maNet3,
      lastSeen: DateTime.now(),
      isOnline: true,
    );
  }

  /// Codes modèle (octet 14) relevés sur du matériel réel.
  /// À compléter quand on croise d'autres modèles (PU L / XL, full-size…).
  static const _kModelCodes = <int, String>{
    0x16: 'grandMA3 light',
    0x28: 'grandMA3 processing unit M',
  };

  /// Libellé produit : code modèle connu, sinon nom d'hôte MA par défaut
  /// (« light-3959 »…), sinon libellé générique de la classe.
  static String _describe(
      MaDeviceClass c, int classCode, int modelCode, String? name) {
    final known = _kModelCodes[modelCode];
    if (known != null) return known;

    final hex = '0x${modelCode.toRadixString(16).padLeft(2, '0')}';
    switch (c) {
      case MaDeviceClass.console:
        final n = (name ?? '').toLowerCase().replaceAll(RegExp(r'[\s_]'), '');
        const models = {
          'light': 'grandMA3 light',
          'fullsize': 'grandMA3 full-size',
          'full-size': 'grandMA3 full-size',
          'compactxt': 'grandMA3 compact XT',
          'compact': 'grandMA3 compact',
          'onpc': 'grandMA3 onPC',
        };
        for (final e in models.entries) {
          if (n.startsWith(e.key)) return e.value;
        }
        return 'grandMA3 console ($hex)';
      case MaDeviceClass.processingUnit:
        return 'grandMA3 processing unit ($hex)';
      case MaDeviceClass.unknown:
        return 'grandMA3 (type 0x${classCode.toRadixString(16).padLeft(4, '0')}/$hex)';
    }
  }

  static String? _cString(Uint8List d, int offset, int maxLen) {
    if (offset >= d.length) return null;
    final end = (offset + maxLen).clamp(0, d.length);
    final buf = StringBuffer();
    for (var i = offset; i < end; i++) {
      final b = d[i];
      if (b == 0) break;
      if (b >= 0x20 && b < 0x7F) buf.writeCharCode(b);
    }
    final s = buf.toString().trim();
    return s.isEmpty ? null : s;
  }
}
