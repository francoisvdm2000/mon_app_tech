import 'dart:async';
import 'dart:io';

import '../../models/network/artnet_packet.dart';
import '../../models/network/dmx_universe.dart';
import 'multicast_helper.dart';

/// Service d'écoute Art-Net (port UDP 6454).
///
/// Écoute les paquets ArtDMX et maintient un état par univers :
/// - Valeurs DMX (512 canaux)
/// - IP source
/// - Compteur de paquets
/// - FPS approximatif
///
/// ⚠️ grandMA3 envoie l'Art-Net en UNICAST par défaut (broadcast seulement
/// au-delà de 5 récepteurs par univers). Pour voir un univers ici, il faut
/// soit ajouter l'IP du téléphone en destination dans la console, soit
/// passer l'univers en broadcast. Le broadcast n'est reçu que si le
/// téléphone est dans le même sous-réseau (ex. 2.x.x.x / 255.0.0.0).
///
/// Architecture prévue pour :
/// - ArtPoll / ArtPollReply (future)
/// - RDM over Art-Net (future)
/// - Alarmes par univers (future)
/// - Export snapshot (future)
class ArtNetService {
  static const int kPort = 6454;
  static const _kSourceTimeout = Duration(milliseconds: 2500);
  static const _kEmitInterval = Duration(milliseconds: 66); // ~15 Hz UI

  Timer? _emitTimer;
  bool _dirty = false;

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

    await MulticastHelper.acquire(); // Android : évite le filtrage broadcast Wi-Fi

    try {
      _socket = await RawDatagramSocket.bind(
        InternetAddress.anyIPv4,
        kPort,
        reuseAddress: true,
        reusePort: !Platform.isWindows,
      );
      _socket!.broadcastEnabled = true;

      _running = true;
      _universes.clear();
      _timestamps.clear();

      _socket!.listen(
        (event) {
          if (event != RawSocketEvent.read) return;
          Datagram? dg;
          while ((dg = _socket?.receive()) != null) {
            _handleDatagram(dg!);
          }
        },
        onDone: () => _running = false,
        onError: (_) => _running = false,
        cancelOnError: false,
      );

      _emitTimer = Timer.periodic(_kEmitInterval, (_) {
        if (_dirty && !_controller.isClosed) {
          _dirty = false;
          _controller.add(Map.unmodifiable(_universes));
        }
      });
    } catch (e) {
      _running = false;
      _errorMessage = e.toString();
      await MulticastHelper.release();
      rethrow;
    }
  }

  /// Arrête l'écoute et libère le socket.
  void stop() {
    if (_socket != null) MulticastHelper.release();
    _running = false;
    _emitTimer?.cancel();
    _emitTimer = null;
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

    // Deux sources sur le même univers (ex. console + backup, ou deux
    // consoles) : on reste sur la source en cours tant qu'elle émet,
    // au lieu d'alterner à chaque paquet.
    final cur = _universes[packet.universe];
    if (cur != null &&
        cur.sourceIp != sourceIp &&
        DateTime.now().difference(cur.lastUpdate) < _kSourceTimeout) {
      return;
    }

    _updateUniverse(packet);
    _dirty = true;
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
