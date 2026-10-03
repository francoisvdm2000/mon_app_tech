import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:network_info_plus/network_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/network/luminex_alarm.dart';
import '../../models/network/luminex_device.dart';
import '../../models/network/luminex_port.dart';
import '../../models/network/network_diagnostic_alert.dart';

/// Service de supervision en lecture seule des switches Luminex GigaCore.
///
/// Fonctionnalités :
/// - Gestion des IPs manuelles (SharedPreferences)
/// - Découverte automatique sur le sous-réseau local (/24)
/// - Détection Gen1 (texte pipe-délimité) / Gen2 (JSON REST)
/// - Interrogation HTTP périodique (toutes les [_kPollInterval])
/// - Génération d'alarmes basée sur l'état courant
///
/// LECTURE SEULE — aucune modification de configuration.
class LuminexService {
  // ─── Constantes ────────────────────────────────────────────────────────────

  static const _kPollInterval = Duration(seconds: 30);
  static const _kHttpTimeout = Duration(seconds: 5);
  static const _kScanTimeout = Duration(seconds: 2);
  static const _kScanConcurrency = 25;
  static const _kPrefsKey = 'luminex_manual_ips_v1';
  static const _kHighTempCelsius = 70.0;
  static const _kErrorDeltaThreshold = 100;

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

  /// Compteurs d'erreurs du poll précédent : ip → (portNr → [rxErr, txErr])
  final _prevErrors = <String, Map<int, List<int>>>{};

  /// IPs pour lesquelles c'est le premier poll réussi (pour éviter fausses alarmes)
  final _firstSuccessfulPoll = <String>{};

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

    // Essayer Gen2 d'abord (timeout court)
    final dev = await _tryGen2(ip, isManual: false, timeout: _kScanTimeout) ??
        await _tryGen1(ip, isManual: false, timeout: _kScanTimeout);
    if (dev != null && _running) {
      _devices[ip] = _withAlarms(dev, null);
      _firstSuccessfulPoll.add(ip);
    }
  }

  // ─── Polling ───────────────────────────────────────────────────────────────

  Future<void> forceRefresh() async {
    if (!_running) return;
    await _pollAll();
  }

  Future<void> _pollAll() async {
    final ips = <String>{};
    ips.addAll(_manualIps);
    ips.addAll(_devices.keys);

    // Marquer tous les devices comme "polling"
    for (final ip in ips) {
      if (_devices.containsKey(ip)) {
        _devices[ip] = _devices[ip]!.copyWith(isPolling: true);
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
    final prev = _devices[ip];

    // Essayer Gen2 (JSON REST) puis Gen1 (texte)
    LuminexDevice? fetched =
        await _tryGen2(ip, isManual: isManual, timeout: _kHttpTimeout) ??
            await _tryGen1(ip, isManual: isManual, timeout: _kHttpTimeout);

    if (fetched != null) {
      final isFirst = !_firstSuccessfulPoll.contains(ip);
      final updated = _withAlarms(
        fetched,
        isFirst ? null : prev,
      );
      if (isFirst) _firstSuccessfulPoll.add(ip);

      // Mémoriser les compteurs d'erreurs pour le prochain delta
      _prevErrors[ip] = {
        for (final p in fetched.ports)
          p.portNr: [p.rxErrors, p.txErrors],
      };

      _devices[ip] = updated;
    } else {
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
        isReachable: false,
        isManual: isManual,
        isPolling: false,
        lastFetch: DateTime.now(),
        alarms: alarms,
        apiGen: prev?.apiGen ?? LuminexApiGen.unknown,
      );
    }
  }

  // ─── Génération d'alarmes ──────────────────────────────────────────────────

  /// Génère les alarmes en comparant [newDev] avec [prevDev].
  ///
  /// [prevDev] est null lors du premier poll réussi (pas d'alarme de delta).
  LuminexDevice _withAlarms(LuminexDevice newDev, LuminexDevice? prevDev) {
    final alarms = <String, LuminexAlarm>{}; // dedupeKey → alarm
    final now = DateTime.now();
    final prevErrors = _prevErrors[newDev.ip] ?? {};

    // ── Alarmes par port ──────────────────────────────────────────────────────

    for (final port in newDev.ports) {
      final prevPort = prevDev?.ports
          .where((p) => p.portNr == port.portNr)
          .firstOrNull;

      // Port hors ligne
      if (port.linkUp == false) {
        _set(alarms, LuminexAlarm(
          type: LuminexAlarmType.portDown,
          severity: DiagnosticSeverity.warning,
          portNr: port.portNr,
          timestamp: prevPort?.linkUp == false
              ? (prevDev?.alarms
                      .where((a) => a.dedupeKey ==
                          '${LuminexAlarmType.portDown.name}_${port.portNr}')
                      .firstOrNull
                      ?.timestamp ??
                  now)
              : now,
        ));
      }

      // Vitesse dégradée (lien actif, vitesse < 1 Gb/s)
      if (port.linkUp == true &&
          port.speedMbps != null &&
          port.speedMbps! < 1000) {
        _set(alarms, LuminexAlarm(
          type: LuminexAlarmType.speedDegraded,
          severity: DiagnosticSeverity.warning,
          portNr: port.portNr,
          params: {'speed': port.speedMbps!},
          timestamp: now,
        ));
      }

      // Erreurs RX (delta)
      if (prevDev != null) {
        final prevRx = prevErrors[port.portNr]?.elementAtOrNull(0) ?? 0;
        final rxDelta = port.rxErrors - prevRx;
        if (rxDelta > _kErrorDeltaThreshold) {
          _set(alarms, LuminexAlarm(
            type: LuminexAlarmType.highRxErrors,
            severity: DiagnosticSeverity.warning,
            portNr: port.portNr,
            params: {'count': rxDelta},
            timestamp: now,
          ));
        }

        final prevTx = prevErrors[port.portNr]?.elementAtOrNull(1) ?? 0;
        final txDelta = port.txErrors - prevTx;
        if (txDelta > _kErrorDeltaThreshold) {
          _set(alarms, LuminexAlarm(
            type: LuminexAlarmType.highTxErrors,
            severity: DiagnosticSeverity.warning,
            portNr: port.portNr,
            params: {'count': txDelta},
            timestamp: now,
          ));
        }
      }

      // Défaut PoE
      if (port.poeFault == true) {
        _set(alarms, LuminexAlarm(
          type: LuminexAlarmType.poeFault,
          severity: DiagnosticSeverity.warning,
          portNr: port.portNr,
          timestamp: now,
        ));
      }
    }

    // ── Alarmes niveau switch ─────────────────────────────────────────────────

    // Température élevée
    if (newDev.temperatureCelsius != null &&
        newDev.temperatureCelsius! > _kHighTempCelsius) {
      _set(alarms, LuminexAlarm(
        type: LuminexAlarmType.highTemp,
        severity: DiagnosticSeverity.critical,
        params: {'temp': newDev.temperatureCelsius!.toStringAsFixed(1)},
        timestamp: now,
      ));
    }

    // Alimentation absente
    if (newDev.psuOk == false) {
      _set(alarms, LuminexAlarm(
        type: LuminexAlarmType.psuAbsent,
        severity: DiagnosticSeverity.critical,
        timestamp: now,
      ));
    }

    return newDev.copyWith(
      isPolling: false,
      alarms: alarms.values.toList(),
    );
  }

  void _set(Map<String, LuminexAlarm> map, LuminexAlarm alarm) {
    map[alarm.dedupeKey] = alarm;
  }

  // ─── Gen2 : JSON REST ──────────────────────────────────────────────────────

  Future<LuminexDevice?> _tryGen2(
    String ip, {
    required bool isManual,
    required Duration timeout,
  }) async {
    try {
      final sysResp = await _get('http://$ip/api/v1/system', timeout: timeout);
      if (sysResp == null) return null;

      final decoded = _tryDecodeJson(sysResp);
      if (decoded is! Map<String, dynamic>) return null;
      final sysData = decoded;

      // Récupérer les ports (best-effort)
      List<LuminexPort> ports = [];
      final portsResp =
          await _get('http://$ip/api/v1/ports', timeout: timeout);
      if (portsResp != null) {
        final portsData = _tryDecodeJson(portsResp);
        if (portsData is List) {
          ports = _parseGen2Ports(portsData);
        }
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
        psuOk: _parsePsuOk(sysData['psu'] ?? sysData['powerSupply']),
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

  List<LuminexPort> _parseGen2Ports(List<dynamic> data) {
    final result = <LuminexPort>[];
    for (final item in data) {
      if (item is! Map<String, dynamic>) continue;
      try {
        final poeMap = item['poe'] as Map<String, dynamic>?;
        final statsMap =
            item['stats'] as Map<String, dynamic>? ?? item;

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

  bool? _parsePsuOk(dynamic psuData) {
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
      final portsBody =
          await _get('http://$ip/stat/ports', timeout: timeout);
      if (portsBody == null || !portsBody.contains('|')) return null;

      final ports = _parseGen1Ports(portsBody);

      // Infos système (best-effort)
      String? name;
      int? uptimeSeconds;
      final sysBody =
          await _get('http://$ip/stat/switch', timeout: timeout);
      if (sysBody != null) {
        final sysParts = sysBody.split('|');
        if (sysParts.isNotEmpty) name = sysParts[0].trim();
        if (sysParts.length > 1) {
          uptimeSeconds = int.tryParse(sysParts[1].trim());
        }
      }

      // PoE (best-effort)
      final poeBody =
          await _get('http://$ip/confg/poe_confg', timeout: timeout);
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

  // ─── HTTP helpers ──────────────────────────────────────────────────────────

  Future<String?> _get(String url, {required Duration timeout}) async {
    try {
      // Auth Basic admin / (mot de passe vide = défaut Luminex)
      final credentials = base64Encode(utf8.encode('admin:'));
      final response = await _client
          .get(
            Uri.parse(url),
            headers: {'Authorization': 'Basic $credentials'},
          )
          .timeout(timeout);
      if (response.statusCode == 200) return response.body;
      // 401 → essayer sans auth
      if (response.statusCode == 401) {
        final r2 = await _client
            .get(Uri.parse(url))
            .timeout(timeout);
        if (r2.statusCode == 200) return r2.body;
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

  dynamic _tryDecodeJson(String body) {
    try {
      return jsonDecode(body);
    } catch (_) {
      return null;
    }
  }

  // ─── Émission ──────────────────────────────────────────────────────────────

  void _emit() {
    if (_controller.isClosed) return;
    _controller.add(List.unmodifiable(_devices.values));
  }
}
