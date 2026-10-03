import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';

import 'network_target_config.dart';

/// Protocole d'émission choisi par l'utilisateur.
///
/// Alias historique : ces réglages vivent désormais dans
/// [NetworkTargetConfig] (partagés avec d'autres outils réseau, ex. RDM à
/// venir). Les alias gardent le code existant (console virtuelle) inchangé.
typedef DmxProtocol = NetworkOutputProtocol;

/// Comment on choisit l'adresse IP destination.
typedef DmxTargetMode = NetworkTargetMode;

/// Service d'ÉMISSION Art-Net / sACN (E1.31) en UDP.
///
/// C'est l'inverse des services `ArtNetService` / `SacnService` (qui eux
/// écoutent). Ici on tient un buffer de 512 canaux en mémoire et on
/// l'envoie en boucle (~30 fps) vers un node du réseau WiFi, pour tester
/// des machines depuis une "console virtuelle".
///
/// Les réglages "vers qui on parle" (protocole, univers, cible) ne sont plus
/// propres à ce service : ils vivent dans [networkTargetConfig], partagé
/// avec les autres outils réseau. Ce service ne garde que ce qui est
/// spécifique à l'émission DMX : le buffer de canaux et la boucle d'envoi.
///
/// Singleton simple (même pattern que `patchStore`) : une seule session
/// d'émission active à la fois, ce qui garde l'outil simple à utiliser.
class DmxSenderService extends ChangeNotifier {
  DmxSenderService._() {
    _cid = _randomCid();
  }

  static final DmxSenderService instance = DmxSenderService._();

  static const int kArtNetPort = 6454;
  static const int kSacnPort = 5568;
  static const int kChannelCount = 512;

  RawDatagramSocket? _socket;
  Timer? _timer;
  bool _running = false;
  bool get isRunning => _running;

  String? lastError;

  // ── Réglages (délégués à NetworkTargetConfig, partagé) ──────────────────

  NetworkOutputProtocol get protocol => networkTargetConfig.protocol;
  set protocol(NetworkOutputProtocol p) => networkTargetConfig.protocol = p;

  int get universe => networkTargetConfig.universe;
  set universe(int u) => networkTargetConfig.universe = u;

  int get universeCount => networkTargetConfig.universeCount;
  set universeCount(int c) => networkTargetConfig.universeCount = c;

  /// Univers effectivement émis (plage [universe, universe+universeCount-1]).
  List<int> get universes => networkTargetConfig.universes;

  NetworkTargetMode get targetMode => networkTargetConfig.targetMode;
  set targetMode(NetworkTargetMode m) => networkTargetConfig.targetMode = m;

  String get manualIp => networkTargetConfig.manualIp;
  set manualIp(String ip) => networkTargetConfig.manualIp = ip;

  String? get resolvedTargetLabel => networkTargetConfig.resolvedTargetLabel;

  /// Buffers DMX par univers (index 0 = canal 1 de cet univers). Valeurs
  /// 0-255. Un buffer est créé à la demande pour chaque univers utilisé —
  /// ça permet de piloter en une fois un groupe de machines qui s'étale sur
  /// plusieurs univers (import MVR), chaque fixture gardant son propre
  /// univers plutôt que d'être ramenée de force sur un univers unique.
  final Map<int, Uint8List> _channelsByUniverse = {};

  Uint8List _bufferFor(int universe) =>
      _channelsByUniverse.putIfAbsent(universe, () => Uint8List(kChannelCount));

  final Map<int, int> _artnetSeqByUniverse = {};
  final Map<int, int> _sacnSeqByUniverse = {};
  late final Uint8List _cid; // 16 octets, générés une fois par session app
  final String sourceName = 'ShowTech Tools';

  int _frameCounter = 0;
  DateTime _fpsWindowStart = DateTime.now();
  double fps = 0;

  // ── Cycle de vie ────────────────────────────────────────────────────────

  Future<void> start() async {
    if (_running) return;
    lastError = null;

    try {
      _socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
      _socket!.broadcastEnabled = true;

      await networkTargetConfig.refreshTarget();

      _running = true;
      _frameCounter = 0;
      _fpsWindowStart = DateTime.now();

      // Première frame immédiate, puis boucle ~30 fps.
      _sendFrame();
      _timer = Timer.periodic(const Duration(milliseconds: 33), (_) => _sendFrame());

      notifyListeners();
    } catch (e) {
      lastError = e.toString();
      _running = false;
      _socket?.close();
      _socket = null;
      notifyListeners();
      rethrow;
    }
  }

  void stop() {
    if (!_running && _socket == null && _timer == null) return;
    _running = false;
    _timer?.cancel();
    _timer = null;
    _socket?.close();
    _socket = null;
    notifyListeners();
  }

  @override
  void dispose() {
    stop();
    super.dispose();
  }

  // ── Réglages dynamiques ─────────────────────────────────────────────────

  /// À appeler après avoir changé `targetMode` / `manualIp` pendant que
  /// l'émission tourne, pour recalculer immédiatement la cible.
  Future<void> applyTargetChange() async {
    await networkTargetConfig.refreshTarget();
    notifyListeners();
  }

  // ── Contrôle des canaux ──────────────────────────────────────────────────

  void setChannel(int universe, int channel1Based, int value) {
    if (channel1Based < 1 || channel1Based > kChannelCount) return;
    _bufferFor(universe)[channel1Based - 1] = value.clamp(0, 255);
    if (_running) _sendFrame();
  }

  int getChannel(int universe, int channel1Based) {
    if (channel1Based < 1 || channel1Based > kChannelCount) return 0;
    return _bufferFor(universe)[channel1Based - 1];
  }

  /// Blackout des univers actuellement ciblés (`networkTargetConfig.universes`).
  void blackout() {
    for (final u in networkTargetConfig.universes) {
      _bufferFor(u).fillRange(0, kChannelCount, 0);
    }
    if (_running) _sendFrame();
  }

  /// Full des univers actuellement ciblés (`networkTargetConfig.universes`).
  void allFull() {
    for (final u in networkTargetConfig.universes) {
      _bufferFor(u).fillRange(0, kChannelCount, 255);
    }
    if (_running) _sendFrame();
  }

  // ── Envoi des paquets ────────────────────────────────────────────────────

  /// Envoie une frame pour chaque univers de la plage ciblée. Un groupe MVR
  /// qui s'étale sur plusieurs univers déclenche donc un paquet par univers
  /// à chaque tick, plutôt que de forcer tout le monde sur un seul univers.
  void _sendFrame() {
    final socket = _socket;
    final target = networkTargetConfig.resolvedTarget;
    if (socket == null || target == null) return;

    for (final u in networkTargetConfig.universes) {
      try {
        if (protocol == DmxProtocol.artnet) {
          socket.send(_buildArtDmxPacket(u), target, kArtNetPort);
        } else {
          socket.send(_buildSacnPacket(u), target, kSacnPort);
        }
      } catch (e) {
        lastError = e.toString();
      }
    }

    _frameCounter++;
    final elapsed = DateTime.now().difference(_fpsWindowStart);
    if (elapsed.inMilliseconds >= 1000) {
      fps = _frameCounter * 1000 / elapsed.inMilliseconds;
      _frameCounter = 0;
      _fpsWindowStart = DateTime.now();
      notifyListeners();
    }
  }

  /// Construit un paquet ArtDMX (Art-Net 4, OpCode 0x5000) pour un univers.
  List<int> _buildArtDmxPacket(int universe) {
    final nextSeq = (_artnetSeqByUniverse[universe] ?? 0) >= 255
        ? 1
        : (_artnetSeqByUniverse[universe] ?? 0) + 1;
    _artnetSeqByUniverse[universe] = nextSeq;

    final u = universe.clamp(0, 32767);
    final net = (u >> 8) & 0x7F;
    final subUni = u & 0xFF;

    final packet = BytesBuilder();
    packet.add('Art-Net'.codeUnits);
    packet.addByte(0x00); // terminateur de la chaîne "Art-Net\0"
    packet.add([0x00, 0x50]); // OpCode ArtDMX (0x5000), low byte transmis en premier
    packet.add([0x00, 14]); // ProtVerHi, ProtVerLo
    packet.addByte(nextSeq); // Sequence
    packet.addByte(0); // Physical
    packet.addByte(subUni); // SubUni
    packet.addByte(net); // Net
    packet.addByte((kChannelCount >> 8) & 0xFF); // LengthHi
    packet.addByte(kChannelCount & 0xFF); // LengthLo
    packet.add(_bufferFor(universe));

    return packet.toBytes();
  }

  /// Construit un paquet sACN / E1.31 complet (root + framing + DMP layer),
  /// 638 octets pour 512 canaux + start code DMX null, pour un univers.
  List<int> _buildSacnPacket(int universe) {
    final sacnSeq = ((_sacnSeqByUniverse[universe] ?? 0) + 1) & 0xFF;
    _sacnSeqByUniverse[universe] = sacnSeq;

    const int totalLength = 638;
    const int rootLayerLength = totalLength - 16; // à partir du champ Flags/Length du root
    const int framingLayerLength = totalLength - 38;
    const int dmpLayerLength = totalLength - 115;
    const int propertyValueCount = kChannelCount + 1; // + start code

    final packet = BytesBuilder();

    // ── Root Layer ──
    packet.add([0x00, 0x10]); // Preamble Size
    packet.add([0x00, 0x00]); // Post-amble Size
    packet.add(const [
      0x41, 0x53, 0x43, 0x2d, 0x45, 0x31, 0x2e, 0x31, 0x37, 0x00, 0x00, 0x00,
    ]); // ACN Packet Identifier "ASC-E1.17"
    packet.add(_flagsAndLength(rootLayerLength));
    packet.add([0x00, 0x00, 0x00, 0x04]); // Vector: VECTOR_ROOT_E131_DATA
    packet.add(_cid); // CID (16 octets)

    // ── Framing Layer ──
    packet.add(_flagsAndLength(framingLayerLength));
    packet.add([0x00, 0x00, 0x00, 0x02]); // Vector: VECTOR_E131_DATA_PACKET
    packet.add(_paddedSourceName()); // Source Name (64 octets)
    packet.addByte(100); // Priority (défaut 100)
    packet.add([0x00, 0x00]); // Synchronization Address (désactivé)
    packet.addByte(sacnSeq); // Sequence Number
    packet.addByte(0x00); // Options
    final u = universe.clamp(1, 63999);
    packet.addByte((u >> 8) & 0xFF); // Universe Hi
    packet.addByte(u & 0xFF); // Universe Lo

    // ── DMP Layer ──
    packet.add(_flagsAndLength(dmpLayerLength));
    packet.addByte(0x02); // Vector: VECTOR_DMP_SET_PROPERTY
    packet.addByte(0xa1); // Address Type & Data Type
    packet.add([0x00, 0x00]); // First Property Address
    packet.add([0x00, 0x01]); // Address Increment
    packet.addByte((propertyValueCount >> 8) & 0xFF); // Property value count Hi
    packet.addByte(propertyValueCount & 0xFF); // Property value count Lo
    packet.addByte(0x00); // DMX Start Code
    packet.add(_bufferFor(universe)); // 512 canaux

    return packet.toBytes();
  }

  List<int> _flagsAndLength(int length) {
    final v = 0x7000 | (length & 0x0FFF);
    return [(v >> 8) & 0xFF, v & 0xFF];
  }

  Uint8List _paddedSourceName() {
    final bytes = Uint8List(64);
    final nameBytes = sourceName.codeUnits;
    for (var i = 0; i < nameBytes.length && i < 64; i++) {
      bytes[i] = nameBytes[i];
    }
    return bytes;
  }

  Uint8List _randomCid() {
    final rnd = Random.secure();
    return Uint8List.fromList(List<int>.generate(16, (_) => rnd.nextInt(256)));
  }
}

/// Accès global, même convention que `patchStore`.
final DmxSenderService dmxSenderService = DmxSenderService.instance;
