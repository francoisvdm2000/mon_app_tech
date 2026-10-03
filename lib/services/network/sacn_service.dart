import 'dart:async';
import 'dart:io';

import '../../models/network/sacn_packet.dart';
import '../../models/network/dmx_universe.dart';

/// Service d'écoute sACN / E1.31 (port UDP 5568).
///
/// Supporte unicast et multicast.
/// Pour le multicast : rejoint les groupes 239.255.x.y au fur et à mesure
/// que de nouveaux univers sont détectés.
///
/// Architecture prévue pour :
/// - Gestion IGMP snooping (future)
/// - Priorités multi-sources par univers (future)
/// - Alarmes réseau (future)
/// - Export snapshot (future)
/// - Luminex monitoring (future)
/// - MA-Net detection (future)
class SacnService {
  static const int kPort = 5568;

  RawDatagramSocket? _socket;
  bool _running = false;
  bool get isRunning => _running;

  /// Map univers → état courant
  final Map<int, DmxUniverse> _universes = {};
  Map<int, DmxUniverse> get universes => Map.unmodifiable(_universes);

  // Groupes multicast rejoints (pour éviter les doublons)
  final Set<String> _joinedGroups = {};

  // Pour calcul FPS par univers
  final Map<int, List<DateTime>> _timestamps = {};

  final _controller = StreamController<Map<int, DmxUniverse>>.broadcast();
  Stream<Map<int, DmxUniverse>> get stream => _controller.stream;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  /// Démarre l'écoute sACN.
  /// Sur iOS 14+, l'app doit avoir NSLocalNetworkUsageDescription dans Info.plist
  /// pour que le multicast fonctionne.
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
      _socket!.multicastHops = 1;

      // Rejoindre les univers sACN les plus communs (1-10) au démarrage
      for (int u = 1; u <= 10; u++) {
        _joinMulticastForUniverse(u);
      }

      _running = true;
      _universes.clear();
      _timestamps.clear();
      _joinedGroups.clear();

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
    _joinedGroups.clear();
  }

  void dispose() {
    stop();
    _controller.close();
  }

  // ─── Multicast ─────────────────────────────────────────────────────────────

  /// Adresse multicast sACN pour un univers : 239.255.{u>>8}.{u&0xFF}
  static String multicastAddressForUniverse(int universe) {
    final high = (universe >> 8) & 0xFF;
    final low = universe & 0xFF;
    return '239.255.$high.$low';
  }

  void _joinMulticastForUniverse(int universe) {
    final addr = multicastAddressForUniverse(universe);
    if (_joinedGroups.contains(addr)) return;
    try {
      _socket?.joinMulticast(InternetAddress(addr));
      _joinedGroups.add(addr);
    } catch (_) {
      // Multicast non disponible (iOS sans entitlement, etc.) → unicast uniquement
    }
  }

  // ─── Traitement des datagrams ──────────────────────────────────────────────

  void _handleDatagram(Datagram datagram) {
    if (!_running) return;

    final sourceIp = datagram.address.address;
    final packet = SacnPacket.parse(datagram.data, sourceIp);
    if (packet == null) return;

    // Rejoindre le groupe multicast pour cet univers si pas encore fait
    _joinMulticastForUniverse(packet.universe);

    _updateUniverse(packet);
    _controller.add(Map.unmodifiable(_universes));
  }

  void _updateUniverse(SacnPacket packet) {
    final now = DateTime.now();
    final u = packet.universe;

    // Calcul FPS
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
      sourceName: packet.sourceName,
      priority: packet.priority,
      cid: packet.cid,
    );
  }
}
