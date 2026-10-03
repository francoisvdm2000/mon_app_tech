import 'dart:async';
import 'dart:io';

import '../../models/network/artnet_packet.dart';
import '../../models/network/dmx_universe.dart';

/// Service d'écoute Art-Net (port UDP 6454).
///
/// Écoute les paquets ArtDMX et maintient un état par univers :
/// - Valeurs DMX (512 canaux)
/// - IP source
/// - Compteur de paquets
/// - FPS approximatif
///
/// Architecture prévue pour :
/// - ArtPoll / ArtPollReply (future)
/// - RDM over Art-Net (future)
/// - Alarmes par univers (future)
/// - Export snapshot (future)
class ArtNetService {
  static const int kPort = 6454;

  RawDatagramSocket? _socket;
  bool _running = false;
  bool get isRunning => _running;

  /// Map univers → état courant
  final Map<int, DmxUniverse> _universes = {};
  Map<int, DmxUniverse> get universes => Map.unmodifiable(_universes);

  // Pour calcul FPS par univers
  final Map<int, List<DateTime>> _timestamps = {};

  final _controller = StreamController<Map<int, DmxUniverse>>.broadcast();
  Stream<Map<int, DmxUniverse>> get stream => _controller.stream;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  /// Démarre l'écoute sur le port Art-Net.
  Future<void> start() async {
    if (_running) return;
    _errorMessage = null;

    try {
      _socket = await RawDatagramSocket.bind(
        InternetAddress.anyIPv4,
        kPort,
        reuseAddress: true,
        reusePort: true,
      );

      _running = true;
      _universes.clear();
      _timestamps.clear();

      _socket!.listen(
        (event) {
          if (event == RawSocketEvent.read) {
            final datagram = _socket?.receive();
            if (datagram != null) {
              _handleDatagram(datagram);
            }
          }
        },
        onDone: () => _running = false,
        onError: (_) => _running = false,
        cancelOnError: false,
      );
    } catch (e) {
      _running = false;
      _errorMessage = e.toString();
      rethrow;
    }
  }

  /// Arrête l'écoute et libère le socket.
  void stop() {
    _running = false;
    _socket?.close();
    _socket = null;
  }

  void dispose() {
    stop();
    _controller.close();
  }

  // ─── Traitement des datagrams ──────────────────────────────────────────────

  void _handleDatagram(Datagram datagram) {
    if (!_running) return;

    final sourceIp = datagram.address.address;
    final packet = ArtNetPacket.parse(datagram.data, sourceIp);
    if (packet == null) return;

    _updateUniverse(packet);
    _controller.add(Map.unmodifiable(_universes));
  }

  void _updateUniverse(ArtNetPacket packet) {
    final now = DateTime.now();
    final u = packet.universe;

    // Calcul FPS : on garde les timestamps des 2 dernières secondes
    final times = _timestamps.putIfAbsent(u, () => []);
    times.add(now);
    times.removeWhere((t) => now.difference(t).inMilliseconds > 2000);
    final fps = times.length / 2.0;

    final existing = _universes[u];
    _universes[u] = DmxUniverse(
      universe: u,
      channels: List<int>.from(packet.dmxData),
      sourceIp: packet.sourceIp,
      packetCount: (existing?.packetCount ?? 0) + 1,
      fps: fps,
      lastUpdate: now,
    );
  }
}
