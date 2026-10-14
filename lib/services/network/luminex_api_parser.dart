import '../../models/network/luminex_device.dart';
import '../../models/network/luminex_group.dart';
import '../../models/network/luminex_multicast.dart';
import '../../models/network/luminex_port.dart';

/// Lecture des réponses de l'API REST des GigaCore (firmware 1.x, api 1.5).
///
/// Endpoints utilisés (tous en GET, sans authentification) :
/// `/api/device`, `/api/system`, `/api/ports`, `/api/groups`, `/api/trunks`,
/// `/api/temperatures`, `/api/power`, `/api/fans`, `/api/lldp`, `/api/poe`,
/// `/api/status_message`, `/api/snooping`.
///
/// Fonctions pures, sans réseau, pour pouvoir être testées sur des réponses
/// réelles enregistrées.
class LuminexApiParser {
  LuminexApiParser._();

  /// true si [deviceJson] (réponse de `/api/device`) décrit un GigaCore.
  static bool looksLikeGigaCore(Object? deviceJson) {
    if (deviceJson is! Map) return false;
    final model = _str(deviceJson['model'])?.toLowerCase() ?? '';
    final serial = _str(deviceJson['serial'])?.toUpperCase() ?? '';
    final mac = (_str(deviceJson['mac_address']) ?? '')
        .toUpperCase()
        .replaceAll('-', ':');
    return model.contains('gigacore') ||
        serial.startsWith('LUM') ||
        mac.startsWith('D0:69:9E');
  }

  /// Construit un [LuminexDevice] à partir des réponses JSON décodées.
  ///
  /// Seul [device] est obligatoire ; chaque autre réponse peut être null
  /// (endpoint absent ou en erreur) et l'information correspondante reste
  /// alors inconnue.
  static LuminexDevice parse({
    required String ip,
    required bool isManual,
    required Map<String, dynamic> device,
    Object? system,
    Object? ports,
    Object? groups,
    Object? trunks,
    Object? temperatures,
    Object? power,
    Object? fans,
    Object? lldp,
    Object? poe,
    Object? statusMessage,
    Object? snooping,
    DateTime? now,
  }) {
    final sys = _map(system);
    final temps = parseTemperatures(temperatures, system: sys);
    final powerMap = _map(power);

    final notices = <LuminexDeviceNotice>[
      ...parsePowerNotices(powerMap),
      ...parseStatusMessage(statusMessage),
    ];

    return LuminexDevice(
      ip: ip,
      name: _str(device['name']) ?? _str(device['hostname']),
      model: _str(device['model']),
      firmware: _firmware(device['firmware']),
      serial: _str(device['serial']),
      mac: _str(device['mac_address']),
      uptimeSeconds: _int(sys?['uptime']),
      temperatureCelsius: temps.celsius,
      temperatureAlarm: temps.alarm,
      psuOk: parsePsuOk(powerMap),
      fansOk: parseFansOk(fans, power: powerMap),
      ports: parsePorts(ports, lldp: lldp, poe: poe),
      groups: parseGroups(groups),
      trunkNames: parseTrunkNames(trunks),
      notices: notices,
      multicast: parseSnooping(snooping),
      apiGen: LuminexApiGen.gen2,
      isReachable: true,
      isManual: isManual,
      lastFetch: now ?? DateTime.now(),
    );
  }

  // ─── Ports ─────────────────────────────────────────────────────────────────

  /// `/api/ports` → `{ "port": [ … ] }`, enrichi par `/api/lldp` et `/api/poe`.
  static List<LuminexPort> parsePorts(
    Object? portsJson, {
    Object? lldp,
    Object? poe,
  }) {
    final neighbors = _parseLldp(lldp);
    final poePorts = _parsePoe(poe);

    final result = <LuminexPort>[];
    for (final item in _list(_map(portsJson)?['port'])) {
      final p = _map(item);
      if (p == null) continue;
      final portNr = _int(p['port_number']);
      if (portNr == null) continue;

      final link = parseLinkState(_str(p['link_state']));
      final member = _map(p['member_of']);
      final memberType = _str(member?['type'])?.toLowerCase();
      final memberId = _int(member?['id']);
      final counters = _map(p['counters']);
      final neighbor = neighbors[portNr];
      final poePort = poePorts[portNr];

      result.add(LuminexPort(
        portNr: portNr,
        name: _str(p['legend']),
        linkUp: link.up,
        speedMbps: link.speedMbps,
        fullDuplex: link.fullDuplex,
        isSfp: (_str(p['type'])?.toLowerCase() ?? '').startsWith('sfp'),
        enabled: p['enabled'] is bool ? p['enabled'] as bool : null,
        groupId: memberType == 'group' ? memberId : null,
        trunkId: memberType == 'trunk' ? memberId : null,
        neighborName: neighbor?.name,
        neighborIp: neighbor?.ip,
        poeSupported: poePort != null,
        poeMode: poePort?.mode,
        poeActive: poePort?.active,
        poeFault: poePort?.fault,
        poePowerMw: poePort?.powerMw,
        rxErrors: _int(counters?['in_discards']) ?? 0,
        txErrors: _int(counters?['out_discards']) ?? 0,
        rxBps: _int(counters?['rx_bit_rate']),
        txBps: _int(counters?['tx_bit_rate']),
      ));
    }
    result.sort((a, b) => a.portNr.compareTo(b.portNr));
    return result;
  }

  /// Interprète `link_state` : « 1gbps fdx », « 100mbps hdx », « 10gbps fdx »,
  /// « 2.5gbps fdx », « down ».
  static ({bool? up, int? speedMbps, bool? fullDuplex}) parseLinkState(
      String? raw) {
    if (raw == null) return (up: null, speedMbps: null, fullDuplex: null);
    final s = raw.toLowerCase().trim();
    if (s.isEmpty || s.contains('down')) {
      return (up: false, speedMbps: null, fullDuplex: null);
    }
    int? speed;
    final m = RegExp(r'(\d+(?:\.\d+)?)\s*([kmg])bps').firstMatch(s);
    if (m != null) {
      final value = double.parse(m.group(1)!);
      final mbps = switch (m.group(2)) {
        'g' => value * 1000,
        'k' => value / 1000,
        _ => value,
      };
      speed = mbps.round();
    }
    final full = s.contains('fdx')
        ? true
        : s.contains('hdx')
            ? false
            : null;
    return (up: true, speedMbps: speed, fullDuplex: full);
  }

  static Map<int, ({String? name, String? ip})> _parseLldp(Object? lldp) {
    final out = <int, ({String? name, String? ip})>{};
    for (final item in _list(_map(lldp)?['neighbor'])) {
      final n = _map(item);
      if (n == null) continue;
      final portNr = _int(n['port_number']);
      if (portNr == null) continue;
      final name = _str(n['sys_name']);
      final ip = _str(n['mgmt_address']);
      if (name == null && ip == null) continue;
      // Plusieurs voisins sur un port : on garde le premier qui a un nom.
      final existing = out[portNr];
      if (existing != null && existing.name != null) continue;
      out[portNr] = (name: name, ip: ip);
    }
    return out;
  }

  static Map<int, ({String mode, bool active, bool fault, int? powerMw})>
      _parsePoe(Object? poe) {
    final out =
        <int, ({String mode, bool active, bool fault, int? powerMw})>{};
    final poeMap = _map(poe);
    if (poeMap == null || poeMap['capable'] != true) return out;
    for (final item in _list(poeMap['ports'])) {
      final p = _map(item);
      if (p == null) continue;
      final portNr = _int(p['port_number']);
      if (portNr == null) continue;
      final powerMw = _int(p['power_output']);
      final error = _str(p['error'])?.toLowerCase();
      out[portNr] = (
        mode: p['enabled'] == false ? 'off' : 'auto',
        active: _str(p['indication'])?.toLowerCase() == 'sourcing' ||
            (powerMw ?? 0) > 0,
        fault: error != null && error != 'none',
        powerMw: powerMw,
      );
    }
    return out;
  }

  // ─── Groupes / trunks ──────────────────────────────────────────────────────

  /// `/api/groups` → `{ "group": [ … ] }`.
  static List<LuminexGroup> parseGroups(Object? groupsJson) {
    final result = <LuminexGroup>[];
    for (final item in _list(_map(groupsJson)?['group'])) {
      final g = _map(item);
      if (g == null) continue;
      final id = _int(g['group_id']);
      final vid = _int(g['vid']);
      if (id == null || vid == null) continue;
      result.add(LuminexGroup(
        id: id,
        vid: vid,
        name: _str(g['name']) ?? 'VLAN $vid',
        colorHex: _str(g['color']),
      ));
    }
    return result;
  }

  /// `/api/trunks` → `{ "trunk": [ … ] }`.
  static Map<int, String> parseTrunkNames(Object? trunksJson) {
    final out = <int, String>{};
    for (final item in _list(_map(trunksJson)?['trunk'])) {
      final t = _map(item);
      final id = _int(t?['trunk_id']);
      final name = _str(t?['name']);
      if (id != null && name != null) out[id] = name;
    }
    return out;
  }

  // ─── Multicast (IGMP snooping) ─────────────────────────────────────────────

  /// `/api/snooping` → `{ "vlan": [ { "vid", "mc_groups": [ { "group_ip",
  /// "family", "ports": [ { "port_number", "source_entries": [ { "source_ip"
  /// } ] } ] } ] } ] }`. Seuls les groupes IGMP (IPv4) sont gardés.
  static List<LuminexMulticastEntry> parseSnooping(Object? snoopingJson) {
    final result = <LuminexMulticastEntry>[];
    for (final v in _list(_map(snoopingJson)?['vlan'])) {
      final vlan = _map(v);
      final vid = _int(vlan?['vid']);
      if (vlan == null || vid == null) continue;
      for (final g in _list(vlan['mc_groups'])) {
        final group = _map(g);
        final groupIp = _str(group?['group_ip']);
        if (group == null || groupIp == null) continue;
        final family = _str(group['family'])?.toUpperCase();
        if (family != null && family != 'IGMP') continue;
        if (groupIp.contains(':')) continue; // IPv6
        final byPort = <int, List<String>>{};
        for (final p in _list(group['ports'])) {
          final port = _map(p);
          final portNr = _int(port?['port_number']);
          if (port == null || portNr == null) continue;
          final ips = <String>[
            for (final e in _list(port['source_entries']))
              if (_str(_map(e)?['source_ip']) case final ip?) ip,
          ];
          byPort.putIfAbsent(portNr, () => []).addAll(ips);
        }
        if (byPort.isEmpty) continue;
        result.add(LuminexMulticastEntry(
          vid: vid,
          groupIp: groupIp,
          listenersByPort: byPort,
        ));
      }
    }
    return result;
  }

  // ─── Santé ─────────────────────────────────────────────────────────────────

  /// `/api/temperatures` (capteurs avec seuils), repli sur `/api/system`.
  ///
  /// Température affichée : capteur « case » (boîtier) s'il existe, sinon la
  /// plus élevée. Alarme : un capteur hors état « good » ou au-delà de son
  /// `max_allowed`.
  static ({double? celsius, bool? alarm}) parseTemperatures(
    Object? temperaturesJson, {
    Map<String, dynamic>? system,
  }) {
    double? caseTemp;
    double? maxTemp;
    var hasThresholds = false;
    var alarm = false;

    for (final item in _list(_map(temperaturesJson)?['temperature'])) {
      final s = _map(item);
      if (s == null) continue;
      final current = _double(s['current']);
      if (current == null) continue;
      if (maxTemp == null || current > maxTemp) maxTemp = current;
      if (_str(s['sensor_name'])?.toLowerCase() == 'case') {
        caseTemp = current;
      }
      final state = _str(s['state'])?.toLowerCase();
      final maxAllowed = _double(s['max_allowed']);
      if (state != null || maxAllowed != null) hasThresholds = true;
      if ((state != null && state != 'good') ||
          (maxAllowed != null && current > maxAllowed)) {
        alarm = true;
      }
    }

    if (maxTemp != null) {
      return (celsius: caseTemp ?? maxTemp, alarm: hasThresholds ? alarm : null);
    }

    // Repli : /api/system → "temperature": {"current": 71, "max": 79}
    final t = system?['temperature'];
    final fallback = t is Map ? _double(t['current']) : _double(t);
    return (celsius: fallback, alarm: null);
  }

  /// `/api/power` → true si tous les blocs présents sont « good ».
  static bool? parsePsuOk(Map<String, dynamic>? power) {
    if (power == null) return null;
    final psus = _list(power['psus']).map(_map).whereType<Map>().toList();
    if (psus.isEmpty) return null;
    for (final psu in psus) {
      for (final key in const ['state', 'power_status']) {
        final v = _str(psu[key])?.toLowerCase();
        if (v != null && v != 'good') return false;
      }
    }
    return true;
  }

  /// `/api/fans` (+ ventilateurs des blocs d'alim) → true si tous « good ».
  static bool? parseFansOk(Object? fansJson, {Map<String, dynamic>? power}) {
    final states = <String>[];
    for (final item in _list(_map(fansJson)?['fan'])) {
      final s = _str(_map(item)?['state']);
      if (s != null) states.add(s.toLowerCase());
    }
    for (final psu in _list(power?['psus'])) {
      for (final fan in _list(_map(psu)?['fans'])) {
        final s = _str(_map(fan)?['state']);
        if (s != null) states.add(s.toLowerCase());
      }
    }
    if (states.isEmpty) return null;
    return states.every((s) => s == 'good');
  }

  /// Messages de `/api/power` (ex. « No redundancy because only 1 PSU is
  /// powered »).
  static List<LuminexDeviceNotice> parsePowerNotices(
      Map<String, dynamic>? power) {
    final out = <LuminexDeviceNotice>[];
    for (final item in _list(power?['messages'])) {
      final m = _map(item);
      final text = _str(m?['reason']) ?? _str(m?['message']);
      if (text == null) continue;
      out.add(LuminexDeviceNotice(
        level: _str(m?['level'])?.toLowerCase() ?? 'info',
        text: text,
      ));
    }
    return out;
  }

  /// `/api/status_message` : ignoré quand le message est vide (cas normal).
  static List<LuminexDeviceNotice> parseStatusMessage(Object? json) {
    final m = _map(json);
    final text = _str(m?['message']);
    if (text == null) return const [];
    return [
      LuminexDeviceNotice(
        level: _str(m?['level'])?.toLowerCase() ?? 'info',
        text: text,
      ),
    ];
  }

  // ─── Helpers ───────────────────────────────────────────────────────────────

  static String? _firmware(Object? raw) {
    if (raw is Map) return _str(raw['active']);
    return _str(raw);
  }

  static Map<String, dynamic>? _map(Object? v) {
    if (v is Map<String, dynamic>) return v;
    if (v is Map) return v.map((k, val) => MapEntry(k.toString(), val));
    return null;
  }

  static List<dynamic> _list(Object? v) => v is List ? v : const [];

  static String? _str(Object? v) {
    if (v == null) return null;
    final s = v.toString().trim();
    return s.isEmpty ? null : s;
  }

  static int? _int(Object? v) {
    if (v is int) return v;
    if (v is num) return v.round();
    if (v is String) {
      final s = v.trim();
      return int.tryParse(s) ?? double.tryParse(s)?.round();
    }
    return null;
  }

  static double? _double(Object? v) {
    if (v is num) return v.toDouble();
    if (v is String) return double.tryParse(v.trim());
    return null;
  }
}
