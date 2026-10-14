import 'dart:async';
import 'dart:io';

import '../../models/network/sacn_packet.dart';
import '../../models/network/dmx_universe.dart';
import 'multicast_helper.dart';

/// Service d'écoute sACN / E1.31 (port UDP 5568), unicast + multicast.
///
/// Multicast : un univers n'arrive que si on a rejoint son groupe
/// 239.255.{u>>8}.{u&0xFF}. On rejoint donc :
///   • les univers 1-10 au démarrage,
///   • le groupe Universe Discovery (239.255.250.214) : les sources E1.31-2016
///     y annoncent toutes les 10 s la liste de leurs univers → on s'y abonne
///     automatiquement (indispensable pour voir l'univers 37 ou 512…),
///   • tout univers demandé explicitement via [watchUniverse].
///
/// Plusieurs sources sur un même univers : on garde la source de plus haute
/// priorité (à priorité égale, la source en cours tant qu'elle émet), au lieu
/// d'alterner entre les deux à chaque paquet.
class SacnService {
  static const int kPort = 5568;
  static const String kDiscoveryGroup = '239.255.250.214';
  static const _kSourceTimeout = Duration(milliseconds: 2500);
  static const _kEmitInterval = Duration(milliseconds: 66); // ~15 Hz UI

  /// Socket principal (lecture). Les sockets suivants ne servent qu'à porter
  /// des inscriptions multicast supplémentaires (Android limite à 20 / socket).
  final List<RawDatagramSocket> _sockets = [];
  RawDatagramSocket? get _socket => _sockets.isEmpty ? null : _sockets.first;

  bool _running = false;
  bool get isRunning => _running;

  final Map<int, DmxUniverse> _universes = {};
  Map<int, DmxUniverse> get universes => Map.unmodifiable(_universes);

  final Set<String> _joinedGroups = {};
  Set<String> get joinedGroups => Set.unmodifiable(_joinedGroups);

  final Map<int, List<DateTime>> _timestamps = {};

  final _controller = StreamController<Map<int, DmxUniverse>>.broadcast();
  Stream<Map<int, DmxUniverse>> get stream => _controller.stream;

  Timer? _emitTimer;
  bool _dirty = false;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> start() async {
    if (_running) return;
    _errorMessage = null;
    _universes.clear();
    _timestamps.clear();
    _joinedGroups.clear();

    await MulticastHelper.acquire();
    await MulticastHelper.refreshInterfaces();

    try {
      final socket = await _bindSocket();
      _sockets.add(socket);
      _running = true;

      socket.listen(
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

      await _join(kDiscoveryGroup);
      for (var u = 1; u <= 10; u++) {
        await watchUniverse(u);
      }
      if (_joinedGroups.isEmpty) {
        _errorMessage = 'Multicast indisponible : seul le sACN unicast '
            'sera reçu (permission réseau local / entitlement iOS ?)';
      }

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

  Future<RawDatagramSocket> _bindSocket() async {
    final s = await RawDatagramSocket.bind(
      InternetAddress.anyIPv4,
      kPort,
      reuseAddress: true,
      reusePort: !Platform.isWindows,
    );
    s.multicastLoopback = false;
    return s;
  }

  /// S'abonne au multicast d'un univers (sans effet s'il l'est déjà).
  Future<void> watchUniverse(int universe) async {
    if (universe < 1 || universe > 63999) return;
    await _join(multicastAddressForUniverse(universe));
  }

  Future<void> _join(String group) async {
    if (!_running || _joinedGroups.contains(group)) return;
    if (MulticastHelper.joinOnAllInterfaces(_sockets.last, group)) {
      _joinedGroups.add(group);
      return;
    }
    // Limite d'inscriptions atteinte sur ce socket → socket porteur supplémentaire.
    // (Linux/Android : IP_MULTICAST_ALL fait arriver le trafic sur le socket
    // principal ; le porteur ne sert qu'à maintenir l'inscription IGMP.)
    if (_sockets.length >= 32) return;
    try {
      final holder = await _bindSocket();
      holder.readEventsEnabled = false;
      _sockets.add(holder);
      if (MulticastHelper.joinOnAllInterfaces(holder, group)) {
        _joinedGroups.add(group);
      }
    } catch (_) {}
  }

  void stop() {
    if (_running || _sockets.isNotEmpty) MulticastHelper.release();
    _running = false;
    _emitTimer?.cancel();
    _emitTimer = null;
    for (final s in _sockets) {
      s.close();
    }
    _sockets.clear();
    _joinedGroups.clear();
  }

  void dispose() {
    stop();
    _controller.close();
  }

  static String multicastAddressForUniverse(int universe) {
    final high = (universe >> 8) & 0xFF;
    final low = universe & 0xFF;
    return '239.255.$high.$low';
  }

  // ─── Traitement ────────────────────────────────────────────────────────────

  void _handleDatagram(Datagram datagram) {
    if (!_running) return;

    final discovered = SacnPacket.parseUniverseDiscovery(datagram.data);
    if (discovered != null) {
      for (final u in discovered) {
        watchUniverse(u);
      }
      return;
    }

    final packet = SacnPacket.parse(datagram.data, datagram.address.address);
    if (packet == null) return;

    // Univers reçu en unicast : on rejoint aussi son groupe au cas où la
    // source bascule en multicast.
    watchUniverse(packet.universe);

    if (_acceptSource(packet)) {
      _updateUniverse(packet);
      _dirty = true;
    }
  }

  bool _acceptSource(SacnPacket p) {
    final cur = _universes[p.universe];
    if (cur == null || cur.cid == p.cid) return true;
    final stale =
        DateTime.now().difference(cur.lastUpdate) > _kSourceTimeout;
    if (stale) return true;
    return p.priority > (cur.priority ?? 0);
  }

  void _updateUniverse(SacnPacket packet) {
    final now = DateTime.now();
    final u = packet.universe;
    final existing = _universes[u];
    final sameSource = existing?.cid == packet.cid;

    final times = _timestamps.putIfAbsent(u, () => []);
    if (!sameSource) times.clear();
    times.add(now);
    times.removeWhere((t) => now.difference(t).inMilliseconds > 2000);
    final fps = times.length / 2.0;

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
