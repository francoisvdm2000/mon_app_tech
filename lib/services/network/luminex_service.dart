import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:http/http.dart' as http;
import 'package:network_info_plus/network_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/network/luminex_alarm.dart';
import '../../models/network/luminex_backup.dart';
import '../../models/network/luminex_device.dart';
import '../../models/network/luminex_port.dart';
import '../../models/network/network_diagnostic_alert.dart';
import 'luminex_api_parser.dart';

/// Service de supervision en lecture seule des switches Luminex GigaCore.
///
/// Fonctionnalités :
/// - Gestion des IPs manuelles (SharedPreferences)
/// - Découverte automatique sur le sous-réseau local (/24)
/// - API REST GigaCore (`/api/...`, firmware 1.x), avec repli sur l'ancienne
///   API JSON (`/api/v1/...`) et l'API texte Gen1 (`/stat/...`)
/// - Interrogation HTTP périodique (toutes les [_kPollInterval])
/// - Génération d'alarmes basée sur l'état courant
///
/// LECTURE SEULE — aucune modification de configuration.
class LuminexService {
  // ─── Constantes ────────────────────────────────────────────────────────────

  static const _kPollInterval = Duration(seconds: 10);
  static const _kHttpTimeout = Duration(seconds: 4);
  static const _kScanTimeout = Duration(seconds: 2);
  static const _kWriteTimeout = Duration(seconds: 10);
  static const _kScanConcurrency = 25;
  static const _kPrefsKey = 'luminex_manual_ips_v1';
  static const _kErrorDeltaThreshold = 100;

  /// Groupes, trunks, LLDP, PoE, alimentation… changent peu : on ne les
  /// relit que toutes les [_kSlowRefresh] pour ménager le CPU des switches.
  static const _kSlowRefresh = Duration(seconds: 60);

  // ─── État ──────────────────────────────────────────────────────────────────

  final http.Client _client;
  final _controller = StreamController<List<LuminexDevice>>.broadcast();
  Stream<List<LuminexDevice>> get stream => _controller.stream;

  /// Devices connus : ip → LuminexDevice
  final _devices = <String, LuminexDevice>{};
  List<LuminexDevice> get devices => List.unmodifiable(_devices.values);

  /// IPs ajoutées manuellement
  final _manualIps = <String>{};

  Timer? _pollTimer;
  bool _running = false;
  bool _isScanningSubnet = false;
  bool get isScanningSubnet => _isScanningSubnet;

  /// Poll en cours (évite deux polls simultanés si le réseau est lent).
  Future<void>? _pollInFlight;

  /// Réponses lentes en cache : ip → données.
  final _slowCache = <String, _SlowData>{};

  // ── Mémoire de session pour les alarmes ────────────────────────────────────

  /// Compteurs d'erreurs du poll précédent : ip → (portNr → [rxErr, txErr])
  final _prevErrors = <String, Map<int, List<int>>>{};

  /// Ports vus actifs au moins une fois : ip → {portNr}
  final _seenUp = <String, Set<int>>{};

  /// Vitesse maximale vue par port : ip → (portNr → Mb/s)
  final _maxSpeed = <String, Map<int, int>>{};

  /// Début de chaque alarme active : ip → (dedupeKey → date)
  final _alarmSince = <String, Map<String, DateTime>>{};

  // ─── Constructeur ──────────────────────────────────────────────────────────

  LuminexService({http.Client? client}) : _client = client ?? http.Client();

  // ─── Cycle de vie ──────────────────────────────────────────────────────────

  Future<void> start() async {
    if (_running) return;
    _running = true;

    await _loadManualIps();
    await _pollAll();

    _pollTimer = Timer.periodic(_kPollInterval, (_) {
      if (_running) _pollAll();
    });
  }

  void stop() {
    _running = false;
    _pollTimer?.cancel();
    _pollTimer = null;
  }

  void dispose() {
    stop();
    _client.close();
    if (!_controller.isClosed) _controller.close();
  }

  // ─── Gestion des IPs manuelles ─────────────────────────────────────────────

  Future<void> addManualIp(String ip) async {
    final trimmed = ip.trim();
    if (trimmed.isEmpty || _manualIps.contains(trimmed)) return;
    _manualIps.add(trimmed);
    await _saveManualIps();

    // Créer un placeholder "polling" immédiatement
    if (!_devices.containsKey(trimmed)) {
      _devices[trimmed] = LuminexDevice(
        ip: trimmed,
        isManual: true,
        isPolling: true,
      );
      _emit();
    }

    // Interroger immédiatement
    await _pollIp(trimmed, isManual: true);
    _emit();
  }

  Future<void> removeManualIp(String ip) async {
    _manualIps.remove(ip);
    await _saveManualIps();
    // On ne retire du _devices que si ce n'est pas aussi une découverte auto
    final dev = _devices[ip];
    if (dev != null && dev.isManual) {
      _devices.remove(ip);
      _forget(ip);
    }
    _emit();
  }

  Future<void> _loadManualIps() async {
    final prefs = await SharedPreferences.getInstance();
    _manualIps.addAll(prefs.getStringList(_kPrefsKey) ?? []);
  }

  Future<void> _saveManualIps() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_kPrefsKey, _manualIps.toList());
  }

  void _forget(String ip) {
    _slowCache.remove(ip);
    _prevErrors.remove(ip);
    _seenUp.remove(ip);
    _maxSpeed.remove(ip);
    _alarmSince.remove(ip);
  }

  // ─── Découverte subnet ─────────────────────────────────────────────────────

  /// Probe le sous-réseau /24 local pour détecter des switches Luminex.
  ///
  /// Essaie 25 IPs en parallèle avec un timeout court.
  Future<void> discoverOnSubnet() async {
    if (_isScanningSubnet) return;
    _isScanningSubnet = true;
    _emit();

    try {
      final info = NetworkInfo();
      String? localIp;
      try {
        localIp = await info.getWifiIP();
      } catch (_) {}
      if (localIp == null || localIp.isEmpty) return;

      final parts = localIp.split('.');
      if (parts.length != 4) return;
      final prefix = '${parts[0]}.${parts[1]}.${parts[2]}';
      final ips = List.generate(254, (i) => '$prefix.${i + 1}');

      // Probe par batches de _kScanConcurrency
      for (var i = 0; i < ips.length; i += _kScanConcurrency) {
        if (!_running) break;
        final batch = ips.skip(i).take(_kScanConcurrency).toList();
        await Future.wait(batch.map((ip) => _probeLuminex(ip)));
      }
      _emit();
    } finally {
      _isScanningSubnet = false;
      _emit();
    }
  }

  /// Essaie de contacter un seul IP en tant que Luminex (timeout court).
  Future<void> _probeLuminex(String ip) async {
    if (_devices.containsKey(ip) || !_running) return;

    // Pas d'ancienne API /api/v1 au scan : trop peu spécifique, n'importe
    // quel appareil répondant du JSON serait pris pour un switch.
    final dev = await _fetch(
      ip,
      isManual: false,
      timeout: _kScanTimeout,
      includeLegacyV1: false,
    );
    if (dev != null && _running && !_devices.containsKey(ip)) {
      _devices[ip] = _withAlarms(dev);
    }
  }

  // ─── Polling ───────────────────────────────────────────────────────────────

  Future<void> forceRefresh() async {
    if (!_running) return;
    // Un rafraîchissement manuel relit aussi les données lentes (le cache
    // reste disponible comme repli si une requête échoue).
    _slowCache.updateAll((_, data) => data.expired());
    await _pollAll();
  }

  Future<void> _pollAll() {
    final inFlight = _pollInFlight;
    if (inFlight != null) return inFlight;
    final future = _doPollAll().whenComplete(() => _pollInFlight = null);
    _pollInFlight = future;
    return future;
  }

  Future<void> _doPollAll() async {
    final ips = <String>{};
    ips.addAll(_manualIps);
    ips.addAll(_devices.keys);
    if (ips.isEmpty) return;

    // Marquer tous les devices comme "polling"
    for (final ip in ips) {
      final existing = _devices[ip];
      if (existing != null) {
        _devices[ip] = existing.copyWith(isPolling: true);
      } else {
        _devices[ip] = LuminexDevice(
          ip: ip,
          isManual: _manualIps.contains(ip),
          isPolling: true,
        );
      }
    }
    _emit();

    await Future.wait(
      ips.map((ip) => _pollIp(ip, isManual: _manualIps.contains(ip))),
    );
    _emit();
  }

  Future<void> _pollIp(String ip, {required bool isManual}) async {
    final fetched = await _fetch(ip, isManual: isManual, timeout: _kHttpTimeout);

    // IP retirée pendant la requête : ne pas la recréer.
    if (!_devices.containsKey(ip) && !_manualIps.contains(ip)) return;

    final prev = _devices[ip];

    if (fetched != null) {
      _devices[ip] = _withAlarms(fetched);
      return;
    }

    // Device injoignable
    final alarms = <LuminexAlarm>[...?prev?.alarms];
    if (prev?.isReachable == true) {
      // Le switch est devenu inaccessible → alarme critique
      final key = LuminexAlarmType.inaccessible.name;
      alarms.removeWhere((a) => a.dedupeKey == key);
      alarms.insert(
        0,
        LuminexAlarm(
          type: LuminexAlarmType.inaccessible,
          severity: DiagnosticSeverity.critical,
          timestamp: DateTime.now(),
        ),
      );
    }

    _devices[ip] = LuminexDevice(
      ip: ip,
      name: prev?.name,
      model: prev?.model,
      firmware: prev?.firmware,
      serial: prev?.serial,
      mac: prev?.mac,
      isReachable: false,
      isManual: isManual,
      isPolling: false,
      lastFetch: DateTime.now(),
      alarms: alarms,
      apiGen: prev?.apiGen ?? LuminexApiGen.unknown,
    );
  }

  /// Interroge [ip] : API GigaCore actuelle, puis ancienne API JSON, puis Gen1.
  Future<LuminexDevice?> _fetch(
    String ip, {
    required bool isManual,
    required Duration timeout,
    bool includeLegacyV1 = true,
  }) async {
    final rest = await _tryRest(ip, isManual: isManual, timeout: timeout);
    if (rest != null) return rest;
    if (includeLegacyV1) {
      final legacy =
          await _tryLegacyV1(ip, isManual: isManual, timeout: timeout);
      if (legacy != null) return legacy;
    }
    return _tryGen1(ip, isManual: isManual, timeout: timeout);
  }

  // ─── Génération d'alarmes ──────────────────────────────────────────────────

  /// Génère les alarmes de [dev] à partir de son état et de la mémoire de
  /// session (ports déjà vus actifs, vitesses, compteurs précédents).
  ///
  /// - Port hors ligne : seulement s'il a été vu actif pendant la session
  ///   (les ports jamais branchés ne déclenchent rien).
  /// - Vitesse dégradée : vitesse inférieure à la meilleure vue sur ce port.
  /// - Erreurs : delta entre deux polls, jamais sur le premier relevé.
  LuminexDevice _withAlarms(LuminexDevice dev) {
    final ip = dev.ip;
    final alarms = <String, LuminexAlarm>{}; // dedupeKey → alarm
    final now = DateTime.now();
    final prevErrors = _prevErrors[ip];
    final seenUp = _seenUp.putIfAbsent(ip, () => <int>{});
    final maxSpeed = _maxSpeed.putIfAbsent(ip, () => <int, int>{});

    void add(
      LuminexAlarmType type,
      DiagnosticSeverity severity, {
      int? portNr,
      Map<String, dynamic> params = const {},
    }) {
      final alarm = LuminexAlarm(
        type: type,
        severity: severity,
        portNr: portNr,
        params: params,
        timestamp: now,
      );
      alarms[alarm.dedupeKey] = alarm;
    }

    // ── Alarmes par port ──────────────────────────────────────────────────────

    for (final port in dev.ports) {
      final nr = port.portNr;

      if (port.linkUp == true) seenUp.add(nr);

      // Port hors ligne (alors qu'il était actif)
      if (port.linkUp == false && seenUp.contains(nr)) {
        add(LuminexAlarmType.portDown, DiagnosticSeverity.warning, portNr: nr);
      }

      // Vitesse dégradée
      final speed = port.speedMbps;
      if (port.linkUp == true && speed != null) {
        final best = maxSpeed[nr];
        if (best != null && speed < best) {
          add(
            LuminexAlarmType.speedDegraded,
            DiagnosticSeverity.warning,
            portNr: nr,
            params: {'speed': speed},
          );
        }
        maxSpeed[nr] = math.max(best ?? 0, speed);
      }

      // Erreurs RX / TX (delta depuis le poll précédent)
      final prev = prevErrors?[nr];
      if (prev != null && prev.length >= 2) {
        final rxDelta = port.rxErrors - prev[0];
        if (rxDelta > _kErrorDeltaThreshold) {
          add(
            LuminexAlarmType.highRxErrors,
            DiagnosticSeverity.warning,
            portNr: nr,
            params: {'count': rxDelta},
          );
        }
        final txDelta = port.txErrors - prev[1];
        if (txDelta > _kErrorDeltaThreshold) {
          add(
            LuminexAlarmType.highTxErrors,
            DiagnosticSeverity.warning,
            portNr: nr,
            params: {'count': txDelta},
          );
        }
      }

      // Défaut PoE
      if (port.poeFault == true) {
        add(LuminexAlarmType.poeFault, DiagnosticSeverity.warning, portNr: nr);
      }
    }

    _prevErrors[ip] = {
      for (final p in dev.ports) p.portNr: [p.rxErrors, p.txErrors],
    };

    // ── Alarmes niveau switch ─────────────────────────────────────────────────

    if (dev.isTemperatureHigh) {
      add(
        LuminexAlarmType.highTemp,
        DiagnosticSeverity.critical,
        params: {'temp': dev.temperatureCelsius?.toStringAsFixed(1) ?? '?'},
      );
    }

    if (dev.psuOk == false) {
      add(LuminexAlarmType.psuAbsent, DiagnosticSeverity.critical);
    }

    if (dev.fansOk == false) {
      add(LuminexAlarmType.fanFault, DiagnosticSeverity.warning);
    }

    for (final notice in dev.notices) {
      final severity = switch (notice.level) {
        'error' || 'critical' => DiagnosticSeverity.critical,
        'warning' => DiagnosticSeverity.warning,
        _ => null,
      };
      if (severity == null) continue;
      add(
        LuminexAlarmType.deviceNotice,
        severity,
        params: {'text': notice.text},
      );
    }

    // ── Horodatage : conserver le début des alarmes toujours actives ─────────

    final since = _alarmSince.putIfAbsent(ip, () => <String, DateTime>{});
    since.removeWhere((key, _) => !alarms.containsKey(key));
    final timed = <LuminexAlarm>[
      for (final entry in alarms.entries)
        LuminexAlarm(
          type: entry.value.type,
          severity: entry.value.severity,
          portNr: entry.value.portNr,
          params: entry.value.params,
          timestamp: since.putIfAbsent(entry.key, () => now),
        ),
    ];

    // Les plus graves d'abord, puis par port.
    final order = DiagnosticSeverity.values;
    timed.sort((a, b) {
      final bySeverity =
          order.indexOf(b.severity).compareTo(order.indexOf(a.severity));
      if (bySeverity != 0) return bySeverity;
      return (a.portNr ?? 0).compareTo(b.portNr ?? 0);
    });

    return dev.copyWith(isPolling: false, alarms: timed);
  }

  // ─── API REST GigaCore (firmware 1.x : /api/...) ───────────────────────────

  Future<LuminexDevice?> _tryRest(
    String ip, {
    required bool isManual,
    required Duration timeout,
  }) async {
    try {
      final device = await _getJson('http://$ip/api/device', timeout: timeout);
      if (device is! Map<String, dynamic> ||
          !LuminexApiParser.looksLikeGigaCore(device)) {
        return null;
      }

      final cached = _slowCache[ip];
      final Future<_SlowData> slowFuture;
      if (cached != null &&
          DateTime.now().difference(cached.fetchedAt) <= _kSlowRefresh) {
        slowFuture = Future.value(cached);
      } else {
        slowFuture = _fetchSlow(ip, timeout: timeout, previous: cached)
            .then((data) => _slowCache[ip] = data);
      }

      final fast = await Future.wait([
        _getJson('http://$ip/api/system', timeout: timeout),
        _getJson('http://$ip/api/ports', timeout: timeout),
      ]);
      final slow = await slowFuture;

      final parsed = LuminexApiParser.parse(
        ip: ip,
        isManual: isManual,
        device: device,
        system: fast[0],
        ports: fast[1],
        groups: slow.groups,
        trunks: slow.trunks,
        temperatures: slow.temperatures,
        power: slow.power,
        fans: slow.fans,
        lldp: slow.lldp,
        poe: slow.poe,
        statusMessage: slow.statusMessage,
        snooping: slow.snooping,
      );

      // Liste des ports momentanément indisponible : garder la précédente
      // plutôt que d'afficher un switch vide.
      final previousPorts = _devices[ip]?.ports ?? const <LuminexPort>[];
      if (fast[1] == null && previousPorts.isNotEmpty) {
        return parsed.copyWith(ports: previousPorts);
      }
      return parsed;
    } catch (_) {
      return null;
    }
  }

  /// Relit les données lentes. Une réponse en échec reprend la valeur
  /// précédente ([previous]) pour éviter qu'une info disparaisse une minute.
  Future<_SlowData> _fetchSlow(
    String ip, {
    required Duration timeout,
    _SlowData? previous,
  }) async {
    const paths = [
      'groups',
      'trunks',
      'temperatures',
      'power',
      'fans',
      'lldp',
      'poe',
      'status_message',
      'snooping',
    ];
    final r = await Future.wait(
      paths.map((p) => _getJson('http://$ip/api/$p', timeout: timeout)),
    );
    return _SlowData(
      groups: r[0] ?? previous?.groups,
      trunks: r[1] ?? previous?.trunks,
      temperatures: r[2] ?? previous?.temperatures,
      power: r[3] ?? previous?.power,
      fans: r[4] ?? previous?.fans,
      lldp: r[5] ?? previous?.lldp,
      poe: r[6] ?? previous?.poe,
      statusMessage: r[7] ?? previous?.statusMessage,
      snooping: r[8] ?? previous?.snooping,
      fetchedAt: DateTime.now(),
    );
  }

  // ─── Ancienne API JSON (/api/v1/...) ───────────────────────────────────────

  Future<LuminexDevice?> _tryLegacyV1(
    String ip, {
    required bool isManual,
    required Duration timeout,
  }) async {
    try {
      final decoded =
          await _getJson('http://$ip/api/v1/system', timeout: timeout);
      if (decoded is! Map<String, dynamic>) return null;
      final sysData = decoded;

      // Récupérer les ports (best-effort)
      List<LuminexPort> ports = [];
      final portsData =
          await _getJson('http://$ip/api/v1/ports', timeout: timeout);
      if (portsData is List) {
        ports = _parseLegacyV1Ports(portsData);
      }

      return LuminexDevice(
        ip: ip,
        name: sysData['name'] as String? ??
            sysData['hostname'] as String? ??
            sysData['deviceName'] as String?,
        model: sysData['model'] as String? ??
            sysData['type'] as String? ??
            sysData['productName'] as String?,
        firmware: sysData['firmware'] as String? ??
            sysData['firmwareVersion'] as String? ??
            sysData['version'] as String?,
        uptimeSeconds: (sysData['uptime'] as num?)?.toInt() ??
            (sysData['uptimeSeconds'] as num?)?.toInt(),
        temperatureCelsius: (sysData['temperature'] as num?)?.toDouble() ??
            (sysData['temp'] as num?)?.toDouble(),
        psuOk: _parseLegacyPsuOk(sysData['psu'] ?? sysData['powerSupply']),
        ports: ports,
        apiGen: LuminexApiGen.gen2,
        isReachable: true,
        isManual: isManual,
        lastFetch: DateTime.now(),
      );
    } catch (_) {
      return null;
    }
  }

  List<LuminexPort> _parseLegacyV1Ports(List<dynamic> data) {
    final result = <LuminexPort>[];
    for (final item in data) {
      if (item is! Map<String, dynamic>) continue;
      try {
        final poeMap = item['poe'] as Map<String, dynamic>?;
        final statsMap = item['stats'] as Map<String, dynamic>? ?? item;

        final port = LuminexPort(
          portNr: (item['portNr'] as num?)?.toInt() ??
              (item['port'] as num?)?.toInt() ??
              (item['id'] as num?)?.toInt() ??
              result.length + 1,
          name: item['name'] as String? ?? item['label'] as String?,
          linkUp: item['link'] as bool? ??
              item['linkUp'] as bool? ??
              (item['status'] == 'up'),
          speedMbps: (item['speed'] as num?)?.toInt(),
          fullDuplex: item['duplex'] == 'full' ||
              (item['fullDuplex'] as bool?) == true,
          poeSupported: poeMap != null,
          poeMode: poeMap?['mode'] as String?,
          poeActive: poeMap?['active'] as bool?,
          poeFault: poeMap?['fault'] as bool? ?? poeMap?['error'] as bool?,
          rxErrors: (statsMap['rxErrors'] as num?)?.toInt() ??
              (statsMap['rx_errors'] as num?)?.toInt() ??
              (statsMap['inErr'] as num?)?.toInt() ??
              0,
          txErrors: (statsMap['txErrors'] as num?)?.toInt() ??
              (statsMap['tx_errors'] as num?)?.toInt() ??
              (statsMap['outErr'] as num?)?.toInt() ??
              0,
          rxOctets: (statsMap['rxBytes'] as num?)?.toInt() ??
              (statsMap['rxOctets'] as num?)?.toInt() ??
              (statsMap['rx_bytes'] as num?)?.toInt() ??
              0,
          txOctets: (statsMap['txBytes'] as num?)?.toInt() ??
              (statsMap['txOctets'] as num?)?.toInt() ??
              (statsMap['tx_bytes'] as num?)?.toInt() ??
              0,
        );
        result.add(port);
      } catch (_) {
        // Port malformé ignoré
      }
    }
    return result;
  }

  bool? _parseLegacyPsuOk(dynamic psuData) {
    if (psuData == null) return null;
    if (psuData is bool) return psuData;
    if (psuData is Map<String, dynamic>) {
      // Ex. : {"psu1": true, "psu2": false}
      final values = psuData.values.whereType<bool>();
      if (values.isEmpty) return null;
      return values.every((v) => v);
    }
    if (psuData is List) {
      // Ex. : [{"id":1,"present":true},{"id":2,"present":false}]
      final bools = psuData
          .whereType<Map<String, dynamic>>()
          .map((m) => m['present'] as bool? ?? m['ok'] as bool? ?? true)
          .toList();
      if (bools.isEmpty) return null;
      return bools.every((v) => v);
    }
    return null;
  }

  // ─── Gen1 : texte pipe-délimité ───────────────────────────────────────────

  Future<LuminexDevice?> _tryGen1(
    String ip, {
    required bool isManual,
    required Duration timeout,
  }) async {
    try {
      final portsBody = await _getText('http://$ip/stat/ports', timeout: timeout);
      if (portsBody == null || !portsBody.contains('|')) return null;

      final ports = _parseGen1Ports(portsBody);
      if (ports.isEmpty) return null;

      // Infos système (best-effort)
      String? name;
      int? uptimeSeconds;
      final sysBody =
          await _getText('http://$ip/stat/switch', timeout: timeout);
      if (sysBody != null) {
        final sysParts = sysBody.split('|');
        if (sysParts.isNotEmpty) {
          final n = sysParts[0].trim();
          if (n.isNotEmpty) name = n;
        }
        if (sysParts.length > 1) {
          uptimeSeconds = int.tryParse(sysParts[1].trim());
        }
      }

      // PoE (best-effort)
      final poeBody =
          await _getText('http://$ip/confg/poe_confg', timeout: timeout);
      if (poeBody != null) {
        _applyGen1Poe(ports, poeBody);
      }

      return LuminexDevice(
        ip: ip,
        name: name,
        uptimeSeconds: uptimeSeconds,
        ports: ports,
        apiGen: LuminexApiGen.gen1,
        isReachable: true,
        isManual: isManual,
        lastFetch: DateTime.now(),
      );
    } catch (_) {
      return null;
    }
  }

  /// Parse la réponse de `/stat/ports` Gen1.
  ///
  /// Format : `Tick|portNr/rxPkts/txPkts/rxOct/txOct/inErr/outErr/rxDrops/txDrops/discards|...`
  List<LuminexPort> _parseGen1Ports(String body) {
    final result = <LuminexPort>[];
    final segments = body.split('|');
    // Le premier segment est "Tick", on l'ignore
    for (final seg in segments.skip(1)) {
      final fields = seg.trim().split('/');
      if (fields.length < 7) continue;
      try {
        final portNr = int.parse(fields[0]);
        // fields: portNr / rxPkts / txPkts / rxOct / txOct / inErr / outErr / ...
        final rxOct = int.tryParse(fields[3]) ?? 0;
        final txOct = int.tryParse(fields[4]) ?? 0;
        final inErr = int.tryParse(fields[5]) ?? 0;
        final outErr = int.tryParse(fields[6]) ?? 0;

        result.add(LuminexPort(
          portNr: portNr,
          rxErrors: inErr,
          txErrors: outErr,
          rxOctets: rxOct,
          txOctets: txOct,
          // Gen1 : pas d'info link/speed sans endpoint dédié
        ));
      } catch (_) {
        // Segment malformé ignoré
      }
    }
    return result;
  }

  /// Applique les infos PoE Gen1 à la liste de ports.
  ///
  /// Format `/confg/poe_confg` :
  /// `poeCapable|pmMode|...|portNr/priority/maxPower/poeMode/poeSupported,...`
  void _applyGen1Poe(List<LuminexPort> ports, String body) {
    try {
      final segments = body.split('|');
      if (segments.length < 4) return;
      final portConfigs = segments.last.split(',');
      for (final cfg in portConfigs) {
        final fields = cfg.trim().split('/');
        if (fields.length < 5) continue;
        final portNr = int.tryParse(fields[0]);
        final poeSupported = fields[4].trim() == '1';
        final poeMode = _gen1PoeMode(fields[3].trim());
        if (portNr == null) continue;
        final idx = ports.indexWhere((p) => p.portNr == portNr);
        if (idx < 0) continue;
        ports[idx] = ports[idx].copyWith(
          poeSupported: poeSupported,
          poeMode: poeMode,
        );
      }
    } catch (_) {}
  }

  String? _gen1PoeMode(String raw) => switch (raw) {
        '0' => 'off',
        '1' => 'auto',
        '2' => 'force',
        _ => null,
      };

  // ─── Configuration (écriture) ──────────────────────────────────────────────
  //
  // Commandes relevées dans l'interface web GigaCore (firmware 1.9) et
  // validées sur un switch en service, le 14/10/2026 :
  // - PUT /api/ports/port   [ {port_number, legend | enabled | member_of} ]
  //   (liste partielle acceptée : seuls les ports listés sont modifiés)
  // - PUT /api/port_identify {port_numbers: [n]}
  // - PUT /api/identify {}
  // - PUT /api/device {name}
  // - PUT /api/poe/ports/{n} {objet PoE du port}
  //
  // Chaque modification de port :
  // 1. relit le port (état de référence, pour « Annuler ») ;
  // 2. refuse les ports trunk / protégés quand le changement est risqué ;
  // 3. envoie uniquement le champ modifié ;
  // 4. relit le port pour vérifier que le switch a bien pris la valeur ;
  // 5. relance un relevé du switch.

  /// Renomme un port (légende).
  Future<LuminexWriteResult> setPortLegend(
    String ip,
    int portNr,
    String legend,
  ) =>
      _changePort(
        ip,
        portNr,
        {'legend': legend.trim()},
        check: (p) => p['legend'] == legend.trim(),
      );

  /// Change le groupe (VLAN) d'un port d'accès.
  Future<LuminexWriteResult> setPortGroup(
    String ip,
    int portNr,
    int groupId,
  ) {
    final device = _devices[ip];
    if (device != null &&
        device.groups.isNotEmpty &&
        device.groupById(groupId) == null) {
      return Future.value(
          const LuminexWriteResult.failure(LuminexWriteError.unknownGroup));
    }
    return _changePort(
      ip,
      portNr,
      {
        'member_of': {'type': 'group', 'id': groupId},
      },
      lockTrunk: true,
      check: (p) {
        final m = p['member_of'];
        return m is Map && m['type'] == 'group' && m['id'] == groupId;
      },
    );
  }

  /// Active ou désactive un port d'accès.
  Future<LuminexWriteResult> setPortEnabled(
    String ip,
    int portNr,
    bool enabled,
  ) =>
      _changePort(
        ip,
        portNr,
        {'enabled': enabled},
        lockTrunk: true,
        check: (p) => p['enabled'] == enabled,
      );

  /// Remet un port exactement dans l'état [snapshot] (légende, activation,
  /// groupe) : c'est le « Annuler » après une modification.
  Future<LuminexWriteResult> restorePort(
    String ip,
    LuminexPortSnapshot snapshot,
  ) async {
    final body = <String, dynamic>{
      'port_number': snapshot.portNr,
      'legend': snapshot.legend,
      'enabled': snapshot.enabled,
      if (snapshot.memberType == 'group' && snapshot.memberId != null)
        'member_of': {'type': 'group', 'id': snapshot.memberId},
    };
    final put = await _send('PUT', 'http://$ip/api/ports/port', [body]);
    if (!put.ok) return LuminexWriteResult.failure(put.error!, put.reason);
    final after = await _readPort(ip, snapshot.portNr);
    final ok = after != null &&
        LuminexPortSnapshot.fromJson(after).sameSettingsAs(snapshot);
    await _refreshAfterWrite(ip);
    return ok
        ? const LuminexWriteResult.success()
        : const LuminexWriteResult.failure(LuminexWriteError.notApplied);
  }

  /// Fait clignoter la LED d'un port (aucun effet sur le trafic).
  Future<LuminexWriteResult> identifyPort(String ip, int portNr) async {
    final r = await _send('PUT', 'http://$ip/api/port_identify', {
      'port_numbers': [portNr],
    });
    return r.ok
        ? const LuminexWriteResult.success()
        : LuminexWriteResult.failure(r.error!, r.reason);
  }

  /// Fait clignoter les LED du switch (aucun effet sur le trafic).
  Future<LuminexWriteResult> identifySwitch(String ip) async {
    final r = await _send('PUT', 'http://$ip/api/identify', <String, dynamic>{});
    return r.ok
        ? const LuminexWriteResult.success()
        : LuminexWriteResult.failure(r.error!, r.reason);
  }

  /// Renomme le switch.
  Future<LuminexWriteResult> setSwitchName(String ip, String name) async {
    final trimmed = name.trim();
    if (trimmed.isEmpty) {
      return const LuminexWriteResult.failure(LuminexWriteError.rejected);
    }
    final r = await _send('PUT', 'http://$ip/api/device', {'name': trimmed});
    if (!r.ok) return LuminexWriteResult.failure(r.error!, r.reason);
    final after = await _getJson('http://$ip/api/device', timeout: _kHttpTimeout);
    await _refreshAfterWrite(ip);
    return after is Map && after['name'] == trimmed
        ? const LuminexWriteResult.success()
        : const LuminexWriteResult.failure(LuminexWriteError.notApplied);
  }

  /// Coupe ou rétablit l'alimentation PoE d'un port.
  Future<LuminexWriteResult> setPoeEnabled(
    String ip,
    int portNr,
    bool enabled,
  ) async {
    final current = await _readPoePort(ip, portNr);
    if (current == null) {
      return const LuminexWriteResult.failure(LuminexWriteError.noPoe);
    }
    final body = Map<String, dynamic>.from(current)..['enabled'] = enabled;
    final r = await _send('PUT', 'http://$ip/api/poe/ports/$portNr', body);
    if (!r.ok) return LuminexWriteResult.failure(r.error!, r.reason);
    final after = await _readPoePort(ip, portNr);
    await _refreshAfterWrite(ip);
    return after != null && after['enabled'] == enabled
        ? const LuminexWriteResult.success()
        : const LuminexWriteResult.failure(LuminexWriteError.notApplied);
  }

  /// Redémarre l'appareil alimenté : coupe le PoE, attend [offTime], le
  /// rétablit. Le PoE est rétabli même si la coupure n'a pas été confirmée.
  Future<LuminexWriteResult> cyclePoe(
    String ip,
    int portNr, {
    Duration offTime = const Duration(seconds: 5),
  }) async {
    final current = await _readPoePort(ip, portNr);
    if (current == null) {
      return const LuminexWriteResult.failure(LuminexWriteError.noPoe);
    }
    if (current['enabled'] == false) {
      // Déjà coupé : on se contente de le rétablir.
      return setPoeEnabled(ip, portNr, true);
    }
    final off = await setPoeEnabled(ip, portNr, false);
    if (!off.ok && off.error != LuminexWriteError.notApplied) return off;
    await Future<void>.delayed(offTime);
    return setPoeEnabled(ip, portNr, true);
  }

  Future<LuminexWriteResult> _changePort(
    String ip,
    int portNr,
    Map<String, dynamic> change, {
    required bool Function(Map<String, dynamic> port) check,
    bool lockTrunk = false,
  }) async {
    final before = await _readPort(ip, portNr);
    if (before == null) {
      return const LuminexWriteResult.failure(LuminexWriteError.unreachable);
    }
    final snapshot = LuminexPortSnapshot.fromJson(before);
    if (lockTrunk && snapshot.memberType == 'trunk') {
      return const LuminexWriteResult.failure(LuminexWriteError.trunkPort);
    }
    if (lockTrunk && before['protected'] == true) {
      return const LuminexWriteResult.failure(LuminexWriteError.protectedPort);
    }

    final put = await _send('PUT', 'http://$ip/api/ports/port', [
      {'port_number': portNr, ...change},
    ]);
    if (!put.ok) return LuminexWriteResult.failure(put.error!, put.reason);

    final after = await _readPort(ip, portNr);
    await _refreshAfterWrite(ip);
    if (after == null || !check(after)) {
      return LuminexWriteResult.failure(
        LuminexWriteError.notApplied,
        null,
        snapshot,
      );
    }
    return LuminexWriteResult.success(snapshot);
  }

  Future<Map<String, dynamic>?> _readPort(String ip, int portNr) async {
    final json = await _getJson('http://$ip/api/ports/port/$portNr',
        timeout: _kHttpTimeout);
    if (json is Map<String, dynamic> && json['port_number'] == portNr) {
      return json;
    }
    return null;
  }

  Future<Map<String, dynamic>?> _readPoePort(String ip, int portNr) async {
    final json = await _getJson('http://$ip/api/poe', timeout: _kHttpTimeout);
    if (json is! Map || json['capable'] != true) return null;
    final ports = json['ports'];
    if (ports is! List) return null;
    for (final p in ports) {
      if (p is Map<String, dynamic> && p['port_number'] == portNr) return p;
    }
    return null;
  }

  /// Relit le switch tout de suite (données lentes comprises) après une
  /// écriture, pour que l'écran montre le nouvel état.
  Future<void> _refreshAfterWrite(String ip) async {
    final cached = _slowCache[ip];
    if (cached != null) _slowCache[ip] = cached.expired();
    if (!_devices.containsKey(ip)) return;
    await _pollIp(ip, isManual: _manualIps.contains(ip));
    _emit();
  }

  /// Envoie une requête d'écriture JSON. Renvoie l'erreur de l'API
  /// (`reason`) si le switch refuse.
  Future<({bool ok, LuminexWriteError? error, String? reason})> _send(
    String method,
    String url,
    Object body,
  ) =>
      _sendRaw(method, url, utf8.encode(jsonEncode(body)), 'application/json');

  Future<({bool ok, LuminexWriteError? error, String? reason})> _sendRaw(
    String method,
    String url,
    List<int> bytes,
    String contentType,
  ) async {
    try {
      final request = http.Request(method, Uri.parse(url))
        ..headers['Content-Type'] = contentType
        ..headers['Authorization'] =
            'Basic ${base64Encode(utf8.encode('admin:'))}'
        ..bodyBytes = bytes;
      final streamed = await _client.send(request).timeout(_kWriteTimeout);
      final response =
          await http.Response.fromStream(streamed).timeout(_kWriteTimeout);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return (ok: true, error: null, reason: null);
      }
      String? reason;
      try {
        final decoded = jsonDecode(_decodeBody(response));
        if (decoded is Map && decoded['reason'] is String) {
          reason = decoded['reason'] as String;
        }
      } catch (_) {}
      final error = response.statusCode == 401 || response.statusCode == 403
          ? LuminexWriteError.unauthorized
          : LuminexWriteError.rejected;
      return (ok: false, error: error, reason: reason);
    } catch (_) {
      return (ok: false, error: LuminexWriteError.unreachable, reason: null);
    }
  }

  // ─── Sauvegarde / restauration (profils Luminex) ───────────────────────────
  //
  // Validé sur un GigaCore30i v1.9.2 le 14/10/2026 (emplacement 39) :
  // - PUT /api/config/profiles/{slot}/save {name}  → config courante en profil
  // - GET /api/config/profiles/{slot}              → contenu JSON lisible
  // - GET /api/config/profiles/{slot}/download     → fichier gzip (≈ 4,5 Ko)
  // - PUT /api/config/profiles/{slot}/upload       → réimporte le fichier
  // - PUT /api/config/profiles/{slot}/clear {}     → libère l'emplacement
  // - PUT /api/config/profiles/{slot}/recall {keep_ip} → applique le profil
  //   (commande de l'interface web ; non testée en direct : elle reconfigure
  //   tout le switch)
  //
  // L'app n'utilise qu'un emplacement vide, le temps de l'opération, et le
  // libère ensuite : les profils de l'utilisateur ne sont jamais touchés.

  /// Sauvegarde la configuration du switch [ip].
  Future<({LuminexBackup? backup, LuminexWriteError? error, String? reason})>
      createBackup(String ip) async {
    final device = await _getJson('http://$ip/api/device', timeout: _kHttpTimeout);
    if (device is! Map<String, dynamic> ||
        !LuminexApiParser.looksLikeGigaCore(device)) {
      return (backup: null, error: LuminexWriteError.unreachable, reason: null);
    }
    final slot = await _findFreeProfileSlot(ip);
    if (slot == null) {
      return (backup: null, error: LuminexWriteError.noFreeSlot, reason: null);
    }

    try {
      final save = await _send(
        'PUT',
        'http://$ip/api/config/profiles/$slot/save',
        {'name': 'ShowTech backup'},
      );
      if (!save.ok) {
        return (backup: null, error: save.error, reason: save.reason);
      }

      final profile = await _getJson(
          'http://$ip/api/config/profiles/$slot', timeout: _kHttpTimeout);
      final content = profile is Map ? profile['content'] : null;
      final file = await _getBytes(
          'http://$ip/api/config/profiles/$slot/download');
      if (content is! Map || file == null || !_isGzip(file)) {
        return (
          backup: null,
          error: LuminexWriteError.notApplied,
          reason: null,
        );
      }

      final portsJson =
          await _getJson('http://$ip/api/ports', timeout: _kHttpTimeout);
      final legends = <int, String>{
        for (final p in LuminexApiParser.parsePorts(portsJson))
          p.portNr: p.name ?? '',
      };

      final parsed = LuminexApiParser.parse(
        ip: ip,
        isManual: false,
        device: device,
      );
      return (
        backup: LuminexBackup(
          createdAt: DateTime.now(),
          sourceIp: ip,
          switchName: parsed.name,
          model: parsed.model,
          serial: parsed.serial,
          firmware: parsed.firmware,
          profileContent: Map<String, dynamic>.from(content),
          profileFileBase64: base64Encode(file),
          legends: legends,
        ),
        error: null,
        reason: null,
      );
    } finally {
      // Toujours libérer l'emplacement utilisé.
      await _send(
          'PUT', 'http://$ip/api/config/profiles/$slot/clear', <String, dynamic>{});
    }
  }

  /// Remet les ports comme dans la sauvegarde (groupe, activation, légende),
  /// sans toucher aux groupes, trunks ni à l'IP. Rapide et ciblé.
  Future<LuminexWriteResult> restorePortsFromBackup(
    String ip,
    LuminexBackup backup,
  ) async {
    await _refreshAfterWrite(ip);
    final live = _devices[ip];
    if (live == null || !live.isReachable) {
      return const LuminexWriteResult.failure(LuminexWriteError.unreachable);
    }
    final payload = backup.portRestorePayload(live);
    if (payload.isEmpty) return const LuminexWriteResult.success();

    final put = await _send('PUT', 'http://$ip/api/ports/port', payload);
    if (!put.ok) return LuminexWriteResult.failure(put.error!, put.reason);

    await _refreshAfterWrite(ip);
    final after = _devices[ip];
    final remaining = after == null
        ? payload
        : backup.portRestorePayload(after);
    return remaining.isEmpty
        ? const LuminexWriteResult.success()
        : const LuminexWriteResult.failure(LuminexWriteError.notApplied);
  }

  /// Restauration complète : importe le profil de la sauvegarde sur le switch
  /// [ip] et l'applique (groupes, trunks, ports, nom…), puis remet les
  /// légendes. [keepIp] = garder l'adresse actuelle ; false = reprendre celle
  /// de la sauvegarde (remplacement de matériel).
  ///
  /// Reconfigure tout le switch : le trafic peut être coupé quelques
  /// secondes. À ne pas faire pendant un show.
  Future<LuminexWriteResult> restoreFullBackup(
    String ip,
    LuminexBackup backup, {
    bool keepIp = true,
  }) async {
    final slot = await _findFreeProfileSlot(ip);
    if (slot == null) {
      return const LuminexWriteResult.failure(LuminexWriteError.noFreeSlot);
    }

    final upload = await _sendBytes(
      'PUT',
      'http://$ip/api/config/profiles/$slot/upload',
      backup.profileFileBytes,
    );
    if (!upload.ok) {
      return LuminexWriteResult.failure(upload.error!, upload.reason);
    }
    final uploaded = await _getJson(
        'http://$ip/api/config/profiles/$slot', timeout: _kHttpTimeout);
    if (uploaded is! Map || uploaded['name'] == '__empty__') {
      return const LuminexWriteResult.failure(LuminexWriteError.notApplied);
    }

    final recall = await _send(
      'PUT',
      'http://$ip/api/config/profiles/$slot/recall',
      {'keep_ip': keepIp},
    );

    // Adresse du switch après rappel.
    final backupIp = backup.profileIp;
    final targetIp =
        !keepIp && backupIp != null && backupIp.isNotEmpty ? backupIp : ip;

    if (!recall.ok && recall.error != LuminexWriteError.unreachable) {
      await _send('PUT', 'http://$ip/api/config/profiles/$slot/clear',
          <String, dynamic>{});
      return LuminexWriteResult.failure(recall.error!, recall.reason);
    }

    // Attendre que le switch réponde de nouveau (jusqu'à 2 minutes).
    final back = await _waitForSwitch(targetIp);
    if (!back) {
      return const LuminexWriteResult.failure(LuminexWriteError.unreachable);
    }

    await _send('PUT', 'http://$targetIp/api/config/profiles/$slot/clear',
        <String, dynamic>{});

    if (targetIp != ip) {
      await addManualIp(targetIp);
    }

    // Légendes (absentes des profils Luminex).
    final legends = [
      for (final e in backup.legends.entries)
        {'port_number': e.key, 'legend': e.value},
    ];
    if (legends.isNotEmpty) {
      final put = await _send('PUT', 'http://$targetIp/api/ports/port', legends);
      if (!put.ok) return LuminexWriteResult.failure(put.error!, put.reason);
    }

    _slowCache.remove(targetIp);
    await _refreshAfterWrite(targetIp);
    final live = _devices[targetIp];
    if (live == null || !live.isReachable) {
      return const LuminexWriteResult.failure(LuminexWriteError.unreachable);
    }
    final remaining = backup
        .diff(live)
        .where((d) => d.kind != LuminexBackupDiffKind.model)
        .toList();
    return remaining.isEmpty
        ? const LuminexWriteResult.success()
        : const LuminexWriteResult.failure(LuminexWriteError.notApplied);
  }

  Future<bool> _waitForSwitch(String ip) async {
    final deadline = DateTime.now().add(const Duration(minutes: 2));
    await Future<void>.delayed(const Duration(seconds: 3));
    while (DateTime.now().isBefore(deadline)) {
      final device =
          await _getJson('http://$ip/api/device', timeout: _kHttpTimeout);
      if (device is Map && LuminexApiParser.looksLikeGigaCore(device)) {
        return true;
      }
      await Future<void>.delayed(const Duration(seconds: 3));
    }
    return false;
  }

  /// Emplacement de profil libre (le plus haut, jamais le 0 qui peut servir
  /// de profil par défaut), ou null.
  Future<int?> _findFreeProfileSlot(String ip) async {
    final profiles =
        await _getJson('http://$ip/api/config/profiles', timeout: _kHttpTimeout);
    if (profiles is! List) return null;
    int? best;
    for (final p in profiles) {
      if (p is! Map) continue;
      final slot = (p['slot'] as num?)?.toInt();
      if (slot == null || slot == 0) continue;
      if (p['name'] != '__empty__' || p['protected'] == true) continue;
      if (best == null || slot > best) best = slot;
    }
    return best;
  }

  static bool _isGzip(List<int> bytes) =>
      bytes.length > 2 && bytes[0] == 0x1f && bytes[1] == 0x8b;

  Future<List<int>?> _getBytes(String url) async {
    final response = await _get(url, timeout: _kHttpTimeout);
    return response?.bodyBytes;
  }

  Future<({bool ok, LuminexWriteError? error, String? reason})> _sendBytes(
    String method,
    String url,
    List<int> bytes,
  ) =>
      _sendRaw(method, url, bytes, 'application/octet-stream');

  // ─── HTTP helpers ──────────────────────────────────────────────────────────

  Future<http.Response?> _get(String url, {required Duration timeout}) async {
    try {
      // Auth Basic admin / (mot de passe vide = défaut Luminex)
      final credentials = base64Encode(utf8.encode('admin:'));
      final response = await _client
          .get(
            Uri.parse(url),
            headers: {'Authorization': 'Basic $credentials'},
          )
          .timeout(timeout);
      if (response.statusCode == 200) return response;
      // 401 → essayer sans auth
      if (response.statusCode == 401) {
        final r2 = await _client.get(Uri.parse(url)).timeout(timeout);
        if (r2.statusCode == 200) return r2;
      }
      return null;
    } on TimeoutException {
      return null;
    } on SocketException {
      return null;
    } on http.ClientException {
      return null;
    } catch (_) {
      return null;
    }
  }

  /// GET JSON : renvoie une Map ou une List décodée, sinon null
  /// (erreur HTTP, page HTML de l'interface web, JSON invalide…).
  Future<Object?> _getJson(String url, {required Duration timeout}) async {
    final response = await _get(url, timeout: timeout);
    if (response == null) return null;
    final body = _decodeBody(response).trimLeft();
    if (!body.startsWith('{') && !body.startsWith('[')) return null;
    try {
      final decoded = jsonDecode(body);
      return decoded is Map || decoded is List ? decoded : null;
    } catch (_) {
      return null;
    }
  }

  /// GET texte brut : refuse les pages HTML (les GigaCore récents renvoient
  /// leur interface web, en 200, pour toute URL inconnue).
  Future<String?> _getText(String url, {required Duration timeout}) async {
    final response = await _get(url, timeout: timeout);
    if (response == null) return null;
    final contentType = response.headers['content-type']?.toLowerCase() ?? '';
    final body = _decodeBody(response);
    if (contentType.contains('html') || body.trimLeft().startsWith('<')) {
      return null;
    }
    return body;
  }

  /// Décode le corps en UTF-8 (les GigaCore n'indiquent pas toujours le
  /// charset, et `http` retomberait alors sur Latin-1).
  String _decodeBody(http.Response response) {
    try {
      return utf8.decode(response.bodyBytes);
    } catch (_) {
      return response.body;
    }
  }

  // ─── Émission ──────────────────────────────────────────────────────────────

  void _emit() {
    if (_controller.isClosed) return;
    _controller.add(List.unmodifiable(_devices.values));
  }
}

/// Réponses relues toutes les [LuminexService._kSlowRefresh].
class _SlowData {
  final Object? groups;
  final Object? trunks;
  final Object? temperatures;
  final Object? power;
  final Object? fans;
  final Object? lldp;
  final Object? poe;
  final Object? statusMessage;
  final Object? snooping;
  final DateTime fetchedAt;

  const _SlowData({
    required this.groups,
    required this.trunks,
    required this.temperatures,
    required this.power,
    required this.fans,
    required this.lldp,
    required this.poe,
    required this.statusMessage,
    required this.snooping,
    required this.fetchedAt,
  });

  /// Même contenu, marqué à relire au prochain poll.
  _SlowData expired() => _SlowData(
        groups: groups,
        trunks: trunks,
        temperatures: temperatures,
        power: power,
        fans: fans,
        lldp: lldp,
        poe: poe,
        statusMessage: statusMessage,
        snooping: snooping,
        fetchedAt: DateTime.fromMillisecondsSinceEpoch(0),
      );
}

// ─── Résultats d'écriture ─────────────────────────────────────────────────────

enum LuminexWriteError {
  /// Le switch ne répond pas.
  unreachable,

  /// Le switch demande un mot de passe.
  unauthorized,

  /// Le switch a refusé la commande (voir [LuminexWriteResult.reason]).
  rejected,

  /// Commande acceptée mais la relecture ne montre pas la nouvelle valeur.
  notApplied,

  /// Port trunk (ISL) : groupe et activation verrouillés.
  trunkPort,

  /// Port protégé sur le switch.
  protectedPort,

  /// Groupe inexistant sur ce switch.
  unknownGroup,

  /// Pas de PoE sur ce port.
  noPoe,

  /// Aucun emplacement de profil libre sur le switch.
  noFreeSlot,
}

/// Résultat d'une modification de configuration.
class LuminexWriteResult {
  final bool ok;
  final LuminexWriteError? error;

  /// Message du switch quand il refuse la commande.
  final String? reason;

  /// État du port avant la modification, pour « Annuler ».
  final LuminexPortSnapshot? undo;

  const LuminexWriteResult.success([this.undo])
      : ok = true,
        error = null,
        reason = null;

  const LuminexWriteResult.failure(LuminexWriteError this.error,
      [this.reason, this.undo])
      : ok = false;
}

/// Réglages modifiables d'un port, relevés avant une modification.
class LuminexPortSnapshot {
  final int portNr;
  final String legend;
  final bool enabled;
  final String? memberType;
  final int? memberId;

  const LuminexPortSnapshot({
    required this.portNr,
    required this.legend,
    required this.enabled,
    this.memberType,
    this.memberId,
  });

  factory LuminexPortSnapshot.fromJson(Map<String, dynamic> json) {
    final member = json['member_of'];
    return LuminexPortSnapshot(
      portNr: (json['port_number'] as num).toInt(),
      legend: json['legend'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? true,
      memberType: member is Map ? member['type'] as String? : null,
      memberId: member is Map ? (member['id'] as num?)?.toInt() : null,
    );
  }

  bool sameSettingsAs(LuminexPortSnapshot other) =>
      portNr == other.portNr &&
      legend == other.legend &&
      enabled == other.enabled &&
      memberType == other.memberType &&
      memberId == other.memberId;
}
