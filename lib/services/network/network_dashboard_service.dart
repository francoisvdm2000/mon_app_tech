import 'dart:async';

import '../../models/network/dmx_universe.dart';
import '../../models/network/network_dashboard_state.dart';
import '../../models/network/network_diagnostic_alert.dart';
import '../../models/network/network_live_alert.dart';
import 'artnet_service.dart';
import 'ndi_discovery_service.dart';
import 'network_scan_service.dart';
import 'network_snapshot_service.dart';
import 'sacn_service.dart';

/// Service central du tableau de bord réseau.
///
/// Agrège en temps réel :
/// - Scan réseau (NetworkScanService)
/// - Écoute Art-Net (ArtNetService)
/// - Écoute sACN (SacnService)
/// - Découverte NDI périodique (NdiDiscoveryService)
///
/// Génère des alertes live pour chaque changement détecté.
class NetworkDashboardService {
  // ─── Services ──────────────────────────────────────────────────────────────

  final _artnet = ArtNetService();
  final _sacn = SacnService();
  final _scanService = NetworkScanService();
  final _snapshotService = NetworkSnapshotService();

  // ─── État ──────────────────────────────────────────────────────────────────

  NetworkDashboardState _state = const NetworkDashboardState();
  NetworkDashboardState get state => _state;

  final _controller =
      StreamController<NetworkDashboardState>.broadcast();
  Stream<NetworkDashboardState> get stream => _controller.stream;

  // ─── Subscriptions & Timers ────────────────────────────────────────────────

  StreamSubscription<Map<int, DmxUniverse>>? _artnetSub;
  StreamSubscription<Map<int, DmxUniverse>>? _sacnSub;
  StreamSubscription<NetworkScanEvent>? _scanSub;
  Timer? _ndiTimer;
  Timer? _watchdogTimer;

  // ─── Suivi de changements ──────────────────────────────────────────────────

  var _prevDeviceIps = <String>{};
  var _prevArtnetKeys = <int>{};
  var _prevSacnKeys = <int>{};
  var _prevNdiNames = <String>{};

  bool _firstArtnetUpdate = true;
  bool _firstSacnUpdate = true;
  bool _firstNdiDiscovery = true;
  bool _firstScan = true;

  /// sACN multi-source : univers → {sourceIp: priorité}
  final _sacnSources = <int, Map<String, int>>{};

  // ─── Alertes ───────────────────────────────────────────────────────────────

  final _eventAlerts = <NetworkLiveAlert>[];

  /// Clés des conditions d'alerte actives (pour éviter le flood).
  final _activeConditionKeys = <String>{};

  static const _kMaxAlerts = 30;
  static const _kFpsThreshold = 10.0;
  static const _kUniverseTimeoutSec = 6;
  static const _kNdiIntervalSec = 15;

  bool _running = false;

  // ─── Cycle de vie ──────────────────────────────────────────────────────────

  Future<void> start() async {
    if (_running) return;
    _running = true;

    // Dernier snapshot → score diagnostic initial
    try {
      final snapshots = await _snapshotService.loadAll();
      if (snapshots.isNotEmpty) {
        _emit(_state.copyWith(
          lastSnapshot: snapshots.first,
          diagnosticScore: snapshots.first.diagnostic?.score,
        ));
      }
    } catch (_) {}

    // Art-Net
    try {
      await _artnet.start();
      _artnetSub = _artnet.stream.listen(_onArtnetUpdate);
      _emit(_state.copyWith(artnetListening: true));
    } catch (_) {
      _emit(_state.copyWith(artnetListening: false));
    }

    // sACN
    try {
      await _sacn.start();
      _sacnSub = _sacn.stream.listen(_onSacnUpdate);
      _emit(_state.copyWith(sacnListening: true));
    } catch (_) {
      _emit(_state.copyWith(sacnListening: false));
    }

    // Scan réseau initial
    _startScan();

    // Découverte NDI initiale + périodique
    _runNdiDiscovery();
    _ndiTimer = Timer.periodic(
      const Duration(seconds: _kNdiIntervalSec),
      (_) => _runNdiDiscovery(),
    );

    // Watchdog : timeouts + alertes de condition
    _watchdogTimer = Timer.periodic(
      const Duration(seconds: 3),
      (_) => _checkConditions(),
    );
  }

  /// Relance un scan réseau manuellement.
  Future<void> rescan() async {
    if (!_running) return;
    _scanService.stopScan();
    await Future.delayed(const Duration(milliseconds: 150));
    _startScan();
  }

  /// Relance la découverte NDI manuellement.
  Future<void> refreshNdi() => _runNdiDiscovery();

  void stop() {
    if (!_running) return;
    _running = false;
    _artnetSub?.cancel();
    _sacnSub?.cancel();
    _scanSub?.cancel();
    _ndiTimer?.cancel();
    _watchdogTimer?.cancel();
    _artnet.stop();
    _sacn.stop();
    _scanService.stopScan();
  }

  void dispose() {
    stop();
    _artnet.dispose();
    _sacn.dispose();
    _scanService.dispose();
    if (!_controller.isClosed) _controller.close();
  }

  // ─── Émission d'état ───────────────────────────────────────────────────────

  void _emit(NetworkDashboardState newState) {
    if (_controller.isClosed || !_running) return;
    _state = newState;
    _controller.add(_state);
  }

  // ─── Handlers Art-Net ──────────────────────────────────────────────────────

  void _onArtnetUpdate(Map<int, DmxUniverse> universes) {
    final newKeys = universes.keys.toSet();

    if (!_firstArtnetUpdate) {
      for (final u in newKeys.difference(_prevArtnetKeys)) {
        _addEventAlert(NetworkLiveAlert(
          type: NetworkLiveAlertType.newArtnetUniverse,
          severity: DiagnosticSeverity.info,
          params: {'universe': u},
          timestamp: DateTime.now(),
        ));
      }
    }

    _firstArtnetUpdate = false;
    _prevArtnetKeys = newKeys;

    _emit(_state.copyWith(
      artnetUniverses: Map.from(universes),
      liveAlerts: List.from(_eventAlerts),
    ));
  }

  // ─── Handlers sACN ─────────────────────────────────────────────────────────

  void _onSacnUpdate(Map<int, DmxUniverse> universes) {
    final newKeys = universes.keys.toSet();

    if (!_firstSacnUpdate) {
      for (final u in newKeys.difference(_prevSacnKeys)) {
        _addEventAlert(NetworkLiveAlert(
          type: NetworkLiveAlertType.newSacnUniverse,
          severity: DiagnosticSeverity.info,
          params: {'universe': u},
          timestamp: DateTime.now(),
        ));
      }
    }

    _firstSacnUpdate = false;
    _prevSacnKeys = newKeys;

    // Suivi multi-source
    for (final entry in universes.entries) {
      _sacnSources
          .putIfAbsent(entry.key, () => {})[entry.value.sourceIp] =
          entry.value.priority ?? 100;
    }
    _sacnSources.removeWhere((u, _) => !newKeys.contains(u));

    _emit(_state.copyWith(
      sacnUniverses: Map.from(universes),
      liveAlerts: List.from(_eventAlerts),
    ));
  }

  // ─── Scan réseau ───────────────────────────────────────────────────────────

  void _startScan() {
    _scanSub?.cancel();
    _emit(_state.copyWith(
      scanStatus: DashboardScanStatus.scanning,
      scanProgress: 0,
    ));

    _scanSub = _scanService.events.listen((event) {
      if (!_running) return;

      if (event is NetworkScanProgressEvent) {
        final pct =
            event.total > 0 ? (event.done * 100 ~/ event.total) : 0;
        _emit(_state.copyWith(
          scanStatus: DashboardScanStatus.scanning,
          scanProgress: pct,
        ));
      } else if (event is NetworkScanCompletedEvent) {
        final newIps = event.devices.map((d) => d.ip).toSet();

        if (!_firstScan) {
          _detectDeviceChanges(_prevDeviceIps, newIps);
        }
        _firstScan = false;
        _prevDeviceIps = newIps;

        _emit(_state.copyWith(
          scanStatus: DashboardScanStatus.completed,
          scanProgress: 100,
          devices: event.devices,
          liveAlerts: List.from(_eventAlerts),
        ));
      } else if (event is NetworkScanErrorEvent) {
        _emit(_state.copyWith(
          scanStatus: DashboardScanStatus.error,
          scanError: event.code,
        ));
      }
    });

    _scanService.startScan().catchError((_) {
      if (_running) {
        _emit(_state.copyWith(scanStatus: DashboardScanStatus.error));
      }
    });
  }

  void _detectDeviceChanges(Set<String> prev, Set<String> next) {
    for (final ip in next.difference(prev)) {
      _addEventAlert(NetworkLiveAlert(
        type: NetworkLiveAlertType.newDevice,
        severity: DiagnosticSeverity.info,
        params: {'ip': ip},
        timestamp: DateTime.now(),
      ));
    }
    for (final ip in prev.difference(next)) {
      _addEventAlert(NetworkLiveAlert(
        type: NetworkLiveAlertType.lostDevice,
        severity: DiagnosticSeverity.warning,
        params: {'ip': ip},
        timestamp: DateTime.now(),
      ));
    }
  }

  // ─── Découverte NDI ────────────────────────────────────────────────────────

  Future<void> _runNdiDiscovery() async {
    if (!_running) return;
    _emit(_state.copyWith(ndiScanning: true));
    try {
      final sources = await NdiDiscoveryService.discover();
      if (!_running || _controller.isClosed) return;

      final newNames = sources.map((s) => s.name).toSet();

      if (!_firstNdiDiscovery) {
        for (final name in newNames.difference(_prevNdiNames)) {
          _addEventAlert(NetworkLiveAlert(
            type: NetworkLiveAlertType.newNdiSource,
            severity: DiagnosticSeverity.info,
            params: {'name': name},
            timestamp: DateTime.now(),
          ));
        }
        for (final name in _prevNdiNames.difference(newNames)) {
          _addEventAlert(NetworkLiveAlert(
            type: NetworkLiveAlertType.lostNdiSource,
            severity: DiagnosticSeverity.warning,
            params: {'name': name},
            timestamp: DateTime.now(),
          ));
        }
      }
      _firstNdiDiscovery = false;
      _prevNdiNames = newNames;

      _emit(_state.copyWith(
        ndiSources: sources,
        ndiScanning: false,
        liveAlerts: List.from(_eventAlerts),
      ));
    } catch (_) {
      if (_running) _emit(_state.copyWith(ndiScanning: false));
    }
  }

  // ─── Watchdog : timeouts + conditions ─────────────────────────────────────

  void _checkConditions() {
    if (!_running || _controller.isClosed) return;

    final now = DateTime.now();
    final newConditionKeys = <String>{};
    bool stateChanged = false;

    // ── Art-Net : timeouts + FPS faible ────────────────────────────────────

    final artnet = Map<int, DmxUniverse>.from(_state.artnetUniverses);
    final timedOutArtnet = <int>[];

    for (final entry in artnet.entries) {
      final age = now.difference(entry.value.lastUpdate).inSeconds;
      if (age > _kUniverseTimeoutSec) {
        timedOutArtnet.add(entry.key);
      } else if (entry.value.fps > 0 &&
          entry.value.fps < _kFpsThreshold) {
        final key =
            '${NetworkLiveAlertType.artnetLowFps.name}_${entry.key}';
        newConditionKeys.add(key);
        if (!_activeConditionKeys.contains(key)) {
          _addEventAlert(NetworkLiveAlert(
            type: NetworkLiveAlertType.artnetLowFps,
            severity: DiagnosticSeverity.warning,
            params: {
              'universe': entry.key,
              'fps': entry.value.fps.toStringAsFixed(1),
            },
            timestamp: now,
          ));
        }
      }
    }

    for (final u in timedOutArtnet) {
      artnet.remove(u);
      if (!_firstArtnetUpdate && _prevArtnetKeys.contains(u)) {
        _addEventAlert(NetworkLiveAlert(
          type: NetworkLiveAlertType.lostArtnetUniverse,
          severity: DiagnosticSeverity.warning,
          params: {'universe': u},
          timestamp: now,
        ));
      }
      _prevArtnetKeys.remove(u);
      stateChanged = true;
    }

    // ── sACN : timeouts + FPS faible + multi-source ─────────────────────────

    final sacn = Map<int, DmxUniverse>.from(_state.sacnUniverses);
    final timedOutSacn = <int>[];

    for (final entry in sacn.entries) {
      final age = now.difference(entry.value.lastUpdate).inSeconds;
      if (age > _kUniverseTimeoutSec) {
        timedOutSacn.add(entry.key);
      } else {
        if (entry.value.fps > 0 &&
            entry.value.fps < _kFpsThreshold) {
          final key =
              '${NetworkLiveAlertType.sacnLowFps.name}_${entry.key}';
          newConditionKeys.add(key);
          if (!_activeConditionKeys.contains(key)) {
            _addEventAlert(NetworkLiveAlert(
              type: NetworkLiveAlertType.sacnLowFps,
              severity: DiagnosticSeverity.warning,
              params: {
                'universe': entry.key,
                'fps': entry.value.fps.toStringAsFixed(1),
              },
              timestamp: now,
            ));
          }
        }
      }
    }

    for (final u in timedOutSacn) {
      sacn.remove(u);
      _sacnSources.remove(u);
      if (!_firstSacnUpdate && _prevSacnKeys.contains(u)) {
        _addEventAlert(NetworkLiveAlert(
          type: NetworkLiveAlertType.lostSacnUniverse,
          severity: DiagnosticSeverity.warning,
          params: {'universe': u},
          timestamp: now,
        ));
      }
      _prevSacnKeys.remove(u);
      stateChanged = true;
    }

    // Multi-source sACN
    for (final entry in _sacnSources.entries) {
      final u = entry.key;
      final sources = entry.value;

      if (sources.length > 1) {
        final dupKey =
            '${NetworkLiveAlertType.sacnDuplicateSource.name}_$u';
        newConditionKeys.add(dupKey);
        if (!_activeConditionKeys.contains(dupKey)) {
          _addEventAlert(NetworkLiveAlert(
            type: NetworkLiveAlertType.sacnDuplicateSource,
            severity: DiagnosticSeverity.critical,
            params: {'universe': u, 'count': sources.length},
            timestamp: now,
          ));
        }

        final priorities = sources.values.toSet();
        if (priorities.length > 1) {
          final prioKey =
              '${NetworkLiveAlertType.sacnPriorityConflict.name}_$u';
          newConditionKeys.add(prioKey);
          if (!_activeConditionKeys.contains(prioKey)) {
            _addEventAlert(NetworkLiveAlert(
              type: NetworkLiveAlertType.sacnPriorityConflict,
              severity: DiagnosticSeverity.critical,
              params: {'universe': u},
              timestamp: now,
            ));
          }
        }
      }
    }

    _activeConditionKeys
      ..clear()
      ..addAll(newConditionKeys);

    if (stateChanged) {
      _emit(_state.copyWith(
        artnetUniverses: artnet,
        sacnUniverses: sacn,
        liveAlerts: List.from(_eventAlerts),
      ));
    } else if (_eventAlerts.length != _state.liveAlerts.length) {
      _emit(_state.copyWith(liveAlerts: List.from(_eventAlerts)));
    }
  }

  // ─── Gestion des alertes ───────────────────────────────────────────────────

  void _addEventAlert(NetworkLiveAlert alert) {
    // Remplace les alertes avec la même clé de dédup
    _eventAlerts.removeWhere((a) => a.dedupeKey == alert.dedupeKey);
    _eventAlerts.insert(0, alert);
    if (_eventAlerts.length > _kMaxAlerts) {
      _eventAlerts.removeRange(_kMaxAlerts, _eventAlerts.length);
    }
  }
}
