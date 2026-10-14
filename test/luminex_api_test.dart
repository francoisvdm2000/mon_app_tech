// Tests du support Luminex GigaCore, sur des réponses réelles relevées le
// 14/10/2026 (GigaCore30i et GigaCore20t, firmware v1.9.2, api 1.5.0).
// Les listes (ports, groupes…) sont raccourcies, les valeurs sont d'origine.

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mon_app_tech/models/network/luminex_alarm.dart';
import 'package:mon_app_tech/models/network/luminex_backup.dart';
import 'package:mon_app_tech/models/network/luminex_device.dart';
import 'package:mon_app_tech/models/network/luminex_group.dart';
import 'package:mon_app_tech/models/network/luminex_inventory.dart';
import 'package:mon_app_tech/models/network/luminex_multicast.dart';
import 'package:mon_app_tech/pages/network/luminex_multicast_page.dart';
import 'package:mon_app_tech/models/network/network_diagnostic_alert.dart';
import 'package:mon_app_tech/services/network/luminex_api_parser.dart';
import 'package:mon_app_tech/services/network/network_diagnostic_service.dart';
import 'package:mon_app_tech/services/network/luminex_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ─── Réponses GigaCore30i « SW Dimcity » (192.168.0.1) ───────────────────────

const _device30i = '''
{"name":"SW Dimcity","hostname":"LUM077003772","description":"","system_id":1,
 "model":"GigaCore30i","mac_address":"D0:69:9E:10:3B:60","serial":"LUM077003772",
 "firmware":{"active":"v1.9.2","alternate":"v1.8.3","upgrade_in_progress":false},
 "api_version":"1.5.0",
 "actual_ip":{"ip_address":"192.168.0.1","default_gateway":"0.0.0.0","prefix_length":24}}
''';

const _system30i = '''
{"uptime":463550,"cpu_load":77,"cpu_load_long":29,
 "temperature":{"current":71,"max":79},
 "stats":{"total_uptime":833,"reboot_count":38}}
''';

String _port(
  int nr,
  String legend,
  String type,
  String link,
  String memberType,
  int memberId,
  int rx,
  int tx, {
  int inDiscards = 0,
}) =>
    '{"port_number":$nr,"legend":"$legend","type":"$type","protected":false,'
    '"available":true,"enabled":true,'
    '"link_speed":{"mode":"auto","speed":["all"]},'
    '"link_state":"$link","member_of":{"type":"$memberType","id":$memberId},'
    '"vlan":{"mode":"${memberType == 'trunk' ? 'trunk' : 'access'}",'
    '"allowed":[1],"untagged":1,"pvid":1},"rlinkx":{"enabled":true},'
    '"counters":{"in_discards":$inDiscards,"out_discards":0,'
    '"link_down_counter":0,"link_flaps":0,"rx_bit_rate":$rx,'
    '"tx_bit_rate":$tx,"rx_frame_rate":3,"tx_frame_rate":90,'
    '"rx_frames":82656679,"tx_frames":{"total":136451479,"queue0":48496865}}}';

String _ports30i({String port3Link = '1gbps fdx', int port3Discards = 0}) =>
    '{"port":[${[
      _port(1, '', 'rj45', '1gbps fdx', 'trunk', 1, 2136, 105528),
      _port(3, 'MA3 M', 'rj45', port3Link, 'group', 6, 15877616, 1284464,
          inDiscards: port3Discards),
      _port(5, 'PU 1', 'rj45', '1gbps fdx', 'group', 6, 87064, 15480256),
      _port(13, '', 'rj45', 'down', 'group', 1, 0, 0),
      _port(14, 'ELC', 'rj45', '1gbps fdx', 'group', 2, 0, 161840),
      _port(17, 'MA3 M', 'rj45', '1gbps fdx', 'group', 2, 8014200, 304),
      _port(21, 'Resolume', 'rj45', '1gbps fdx', 'group', 4, 6397024, 39648),
      _port(24, 'Config Luminex', 'rj45', '1gbps fdx', 'group', 1, 22520,
          636440),
      _port(25, 'To Roof', 'sfp', '10gbps fdx', 'trunk', 1, 468248, 7742408),
      _port(26, 'To Roof', 'sfp', 'down', 'trunk', 1, 0, 0),
    ].join(',')}]}';

const _groups = '''
{"group":[
 {"group_id":1,"predefined":true,"name":"Management","color":"#325197","vid":1,
  "igmp":{"snooping":true,"querier":true,"unknown_flooding":false}},
 {"group_id":2,"name":"s-ACN","color":"#E80000","vid":200},
 {"group_id":4,"name":"Art-Net","color":"#00E8E8","vid":400},
 {"group_id":6,"name":"MA-NET","color":"#FF8200","vid":600},
 {"group_id":7,"name":"Group07","color":"#E8E800","vid":700}]}
''';

const _trunks = '''
{"trunk":[{"trunk_id":1,"name":"ISL","description":"","color":"#999999",
 "predefined":true,"groups":[1,2,3,4,5,6],"untagged_group":1,
 "multilinkx":{"enabled":false}}]}
''';

const _temperatures30i = '''
{"temperature":[
 {"sensor_name":"case","current":49,"min_allowed":0,"max_allowed":64,"state":"good"},
 {"sensor_name":"cpu","current":70,"min_allowed":-40,"max_allowed":85,"state":"good"}]}
''';

const _power30i = '''
{"total_power_max":100000,"total_power_usage":12328,"max_num_psus":2,
 "detect_status":"ok","coupling":{"mode":"none","state":"good"},"messages":[],
 "psus":[{"name":"psu1","type":"internal","model":"LU_70_00639","slot":1,
  "poe_capable":false,"max_power":100000,"temperature":31,
  "temperature_state":"good","power_usage":12328,"power_usage_state":"good",
  "fans":[{"id":1,"fan_speed":3660,"state":"good"}],"power_status":"good",
  "state":"good","operating_status":"main"}]}
''';

const _fans30i = '''
{"automatic_control":true,"fan_mode":"silent","fan":[
 {"id":1,"speed":2561,"pwm":72,"stall_pwm":50,"state":"good"},
 {"id":2,"speed":2549,"pwm":72,"stall_pwm":50,"state":"good"},
 {"id":3,"speed":2539,"pwm":72,"stall_pwm":50,"state":"good"}]}
''';

const _lldp30i = '''
{"neighbor":[
 {"port_number":1,"chassis_id":"D0:69:9E:11:19:DC","sys_name":"GigaCore 20t",
  "sys_description":"GigaCore20t, v1.9.2","remote_port":"0/1",
  "mgmt_address":"192.168.0.2"},
 {"port_number":4,"chassis_id":"PRG-201969646","sys_name":"",
  "remote_port":"68:1D:EF:4C:9D:48","mgmt_address":""},
 {"port_number":25,"chassis_id":"D0:69:9E:10:3B:54","sys_name":"Sw Dak SR",
  "sys_description":"GigaCore30i, v1.9.2","remote_port":"0/25",
  "mgmt_address":"192.168.0.12"}]}
''';

const _poe30i = '''
{"capable":false,"power_budget":"reserved","ports":[],"psu_mode":"redundant",
 "total_power":0,"threshold_power":0,"consumed_power":0,"reserved_power":0,
 "pse_status":"unknown"}
''';

const _status = '{"level":"error","kind":"","message":"","format":[]}';

// ─── Réponses GigaCore20t (192.168.0.2) ──────────────────────────────────────

const _power20t = '''
{"coupling":{"mode":"redundant","state":"warning"},"detect_status":"ok",
 "max_num_psus":2,
 "messages":[{"format":[],"id":4,"level":"warning",
  "reason":"No redundancy because only 1 PSU is powered",
  "reason_id":"278f5a22-03f5-488a-a66b-a8c6fc906b72"}],
 "psus":[{"fans":[],"max_power":550000,"model":"LU_70_00643","name":"psu1",
  "operating_status":"shared","poe_capable":true,"power_status":"good",
  "power_usage":16437,"power_usage_state":"good","slot":1,"state":"good",
  "temperature":35,"temperature_state":"good","type":"internal"}],
 "total_power_max":550000,"total_power_usage":16437}
''';

const _poe20t = '''
{"capable":true,"power_budget":"reserved","ports":[
 {"enabled":true,"priority":"low","port_number":1,"capable_mode":"poe++",
  "indication":"enabled","detection_result":"short_circuit","error":"none",
  "pd_class":"unknown","reserved_power":0,"power_output":0},
 {"enabled":true,"priority":"low","port_number":2,"capable_mode":"poe++",
  "indication":"sourcing","detection_result":"","error":"none",
  "pd_class":"class4","reserved_power":31200,"power_output":7000}]}
''';

// /api/snooping (extrait réel : VLAN 1, s-ACN 200, MA-NET 600)
const _snooping = '''
{"query_interval":125,"querier_igmp_version":"IGMPv2","vlan":[
 {"vid":1,"snooping_enabled":true,"igmp_querier_state":"querier",
  "active_querier_ip":"10.148.0.1","router_ports":[],"mc_groups":[
  {"group_ip":"239.192.243.243","group_mac":"01:00:5e:40:f3:f3","family":"IGMP",
   "version":"IGMPv2","ports":[
   {"port_number":25,"source_entries":[
    {"source_mac":"d0:69:9e:10:3b:54","source_ip":"192.168.100.2"},
    {"source_mac":"d0:69:9e:11:19:dc","source_ip":"192.168.0.2"}]},
   {"port_number":24,"source_entries":[
    {"source_mac":"9c:69:d3:b8:af:c7","source_ip":"192.168.0.254"}]}]},
  {"group_ip":"::","group_mac":"33:33:00:00:00:00","family":"MLD",
   "version":"MLDv2","ports":[{"port_number":1,"source_entries":[
    {"source_mac":"24:5a:4c:73:1a:31","source_ip":"::"}]}]}]},
 {"vid":200,"snooping_enabled":true,"mc_groups":[
  {"group_ip":"239.255.0.1","family":"IGMP","ports":[
   {"port_number":14,"source_entries":[{"source_ip":"192.168.0.2"}]}]},
  {"group_ip":"239.255.0.2","family":"IGMP","ports":[
   {"port_number":14,"source_entries":[{"source_ip":"192.168.0.2"}]}]},
  {"group_ip":"239.255.0.3","family":"IGMP","ports":[
   {"port_number":14,"source_entries":[{"source_ip":"192.168.0.2"}]}]},
  {"group_ip":"239.255.0.101","family":"IGMP","ports":[
   {"port_number":25,"source_entries":[{"source_ip":"2.81.245.79"}]}]},
  {"group_ip":"239.255.250.214","family":"IGMP","ports":[
   {"port_number":17,"source_entries":[{"source_ip":"2.0.201.3"}]}]}]},
 {"vid":600,"snooping_enabled":true,"mc_groups":[
  {"group_ip":"236.4.1.1","family":"IGMP","ports":[
   {"port_number":5,"source_entries":[{"source_ip":"192.168.201.11"}]},
   {"port_number":3,"source_entries":[{"source_ip":"192.168.201.3"}]}]},
  {"group_ip":"236.4.1.0","family":"IGMP","ports":[
   {"port_number":3,"source_entries":[{"source_ip":"192.168.201.3"}]},
   {"port_number":5,"source_entries":[{"source_ip":"192.168.201.11"}]}]},
  {"group_ip":"239.255.255.250","family":"IGMP","ports":[
   {"port_number":4,"source_entries":[{"source_ip":"192.168.201.2"}]}]}]},
 {"vid":300,"snooping_enabled":true,"mc_groups":[]}]}
''';

Map<String, dynamic> _j(String s) => jsonDecode(s) as Map<String, dynamic>;

LuminexDevice _parse30i() => LuminexApiParser.parse(
      ip: '192.168.0.1',
      isManual: true,
      device: _j(_device30i),
      system: _j(_system30i),
      ports: _j(_ports30i()),
      groups: _j(_groups),
      trunks: _j(_trunks),
      temperatures: _j(_temperatures30i),
      power: _j(_power30i),
      fans: _j(_fans30i),
      lldp: _j(_lldp30i),
      poe: _j(_poe30i),
      statusMessage: _j(_status),
      snooping: _j(_snooping),
    );

// Page web renvoyée par le GigaCore pour toute URL inconnue (en 200).
const _html = '<!DOCTYPE html><html lang=en><head><title>gigacore</title>'
    '</head><body></body></html>';

void main() {
  group('LuminexApiParser', () {
    test('reconnaît un GigaCore', () {
      expect(LuminexApiParser.looksLikeGigaCore(_j(_device30i)), isTrue);
      expect(LuminexApiParser.looksLikeGigaCore({'name': 'Routeur'}), isFalse);
      expect(LuminexApiParser.looksLikeGigaCore('texte'), isFalse);
      expect(LuminexApiParser.looksLikeGigaCore(null), isFalse);
    });

    test('lit les infos du switch', () {
      final d = _parse30i();
      expect(d.name, 'SW Dimcity');
      expect(d.model, 'GigaCore30i');
      expect(d.firmware, 'v1.9.2');
      expect(d.serial, 'LUM077003772');
      expect(d.uptimeSeconds, 463550);
      expect(d.apiGen, LuminexApiGen.gen2);
      expect(d.isReachable, isTrue);
    });

    test('température : boîtier affiché, seuils du switch respectés', () {
      final d = _parse30i();
      expect(d.temperatureCelsius, 49);
      expect(d.temperatureAlarm, isFalse);
      // CPU à 71 °C mais dans sa plage : pas d'alarme.
      expect(d.isTemperatureHigh, isFalse);

      final hot = LuminexApiParser.parseTemperatures(_j(
          '{"temperature":[{"sensor_name":"case","current":66,'
          '"max_allowed":64,"state":"good"}]}'));
      expect(hot.alarm, isTrue);

      final warn = LuminexApiParser.parseTemperatures(_j(
          '{"temperature":[{"sensor_name":"cpu","current":80,'
          '"max_allowed":85,"state":"warning"}]}'));
      expect(warn.alarm, isTrue);

      // Sans /api/temperatures : repli sur /api/system, sans seuil.
      final fallback =
          LuminexApiParser.parseTemperatures(null, system: _j(_system30i));
      expect(fallback.celsius, 71);
      expect(fallback.alarm, isNull);
    });

    test('alimentation et ventilateurs', () {
      final d = _parse30i();
      expect(d.psuOk, isTrue);
      expect(d.fansOk, isTrue);
      expect(d.notices, isEmpty);

      final bad = LuminexApiParser.parseFansOk(_j(
          '{"fan":[{"id":1,"state":"good"},{"id":2,"state":"stalled"}]}'));
      expect(bad, isFalse);
      expect(
        LuminexApiParser.parsePsuOk(_j(
            '{"psus":[{"state":"good","power_status":"failed"}]}')),
        isFalse,
      );
      expect(LuminexApiParser.parsePsuOk(_j('{"psus":[]}')), isNull);
    });

    test('message du switch (alim non redondante sur le 20t)', () {
      final notices = LuminexApiParser.parsePowerNotices(_j(_power20t));
      expect(notices, hasLength(1));
      expect(notices.single.level, 'warning');
      expect(notices.single.text,
          'No redundancy because only 1 PSU is powered');
      expect(LuminexApiParser.parsePsuOk(_j(_power20t)), isTrue);
    });

    test('ports : lien, vitesse, groupe, trunk, voisin LLDP', () {
      final ports = _parse30i().ports;
      expect(ports.map((p) => p.portNr),
          [1, 3, 5, 13, 14, 17, 21, 24, 25, 26]);

      final p3 = ports.firstWhere((p) => p.portNr == 3);
      expect(p3.name, 'MA3 M');
      expect(p3.linkUp, isTrue);
      expect(p3.speedMbps, 1000);
      expect(p3.fullDuplex, isTrue);
      expect(p3.groupId, 6);
      expect(p3.trunkId, isNull);
      expect(p3.rxBps, 15877616);
      expect(p3.txBps, 1284464);

      final p1 = ports.firstWhere((p) => p.portNr == 1);
      expect(p1.name, isNull); // légende vide
      expect(p1.isTrunk, isTrue);
      expect(p1.neighborName, 'GigaCore 20t');
      expect(p1.neighborIp, '192.168.0.2');

      final p25 = ports.firstWhere((p) => p.portNr == 25);
      expect(p25.isSfp, isTrue);
      expect(p25.speedMbps, 10000);
      expect(p25.neighborName, 'Sw Dak SR');

      final p13 = ports.firstWhere((p) => p.portNr == 13);
      expect(p13.linkUp, isFalse);
      expect(p13.speedMbps, isNull);
    });

    test('link_state', () {
      final cases = {
        '1gbps fdx': (true, 1000, true),
        '100mbps fdx': (true, 100, true),
        '10mbps hdx': (true, 10, false),
        '10gbps fdx': (true, 10000, true),
        '2.5gbps fdx': (true, 2500, true),
        'down': (false, null, null),
      };
      cases.forEach((raw, expected) {
        final r = LuminexApiParser.parseLinkState(raw);
        expect((r.up, r.speedMbps, r.fullDuplex), expected, reason: raw);
      });
      expect(LuminexApiParser.parseLinkState(null).up, isNull);
    });

    test('PoE (GigaCore20t)', () {
      final ports = LuminexApiParser.parsePorts(
        _j('{"port":[${_port(1, 'Link', 'rj45', '1gbps fdx', 'trunk', 1, 0, 0)},'
            '${_port(2, 'Wireless', 'rj45', '1gbps fdx', 'group', 6, 0, 0)}]}'),
        poe: _j(_poe20t),
      );
      final p1 = ports.firstWhere((p) => p.portNr == 1);
      final p2 = ports.firstWhere((p) => p.portNr == 2);
      expect(p1.poeSupported, isTrue);
      expect(p1.poeActive, isFalse);
      // « short_circuit » en détection n'est pas une erreur PoE.
      expect(p1.poeFault, isFalse);
      expect(p2.poeActive, isTrue);
      expect(p2.poePowerMw, 7000);

      // Switch sans PoE : aucun port PoE.
      final noPoe = _parse30i().ports;
      expect(noPoe.any((p) => p.poeSupported), isFalse);
    });

    test('groupes et trunks', () {
      final d = _parse30i();
      expect(d.groups.map((g) => g.vid), [1, 200, 400, 600, 700]);
      expect(d.groupById(6)?.name, 'MA-NET');
      expect(d.groupById(6)?.colorValue, 0xFFFF8200);
      expect(d.trunkNames, {1: 'ISL'});
    });
  });

  group('LuminexGroupTraffic', () {
    test('somme les ports d\'accès, ignore les trunks et ports éteints', () {
      final traffic = LuminexGroupTraffic.compute([_parse30i()]);
      final byVid = {for (final t in traffic) t.vid: t};

      // Group07 n'a aucun port actif → absent.
      expect(byVid.keys.toSet(), {1, 200, 400, 600});

      final manet = byVid[600]!;
      expect(manet.name, 'MA-NET');
      expect(manet.sentBps, 15877616 + 87064);
      expect(manet.receivedBps, 1284464 + 15480256);
      expect(manet.activePorts, 2);
      expect(manet.totalPorts, 2);

      final mgmt = byVid[1]!;
      // Port 13 (éteint) compté dans le total mais pas dans le débit.
      expect(mgmt.activePorts, 1);
      expect(mgmt.totalPorts, 2);
      expect(mgmt.sentBps, 22520);

      // Le plus chargé en premier.
      expect(traffic.first.vid, 600);
    });

    test('fusionne les switches par VLAN', () {
      final a = _parse30i();
      final b = LuminexApiParser.parse(
        ip: '192.168.0.12',
        isManual: false,
        device: _j(_device30i.replaceAll('SW Dimcity', 'Sw Dak SR')),
        ports: _j(_ports30i()),
        groups: _j(_groups),
      );
      final traffic = LuminexGroupTraffic.compute([a, b]);
      final manet = traffic.firstWhere((t) => t.vid == 600);
      expect(manet.sentBps, 2 * (15877616 + 87064));
      expect(manet.activePorts, 4);
    });

    test('formatBitRate', () {
      expect(formatBitRate(850), '850 b/s');
      expect(formatBitRate(108008), '108 kb/s');
      expect(formatBitRate(15877616), '15,9 Mb/s');
      expect(formatBitRate(7742408, decimalSeparator: '.'), '7.7 Mb/s');
      expect(formatBitRate(2500000000), '2,5 Gb/s');
    });
  });

  group('Multicast (IGMP snooping)', () {
    test('lit les abonnements IGMP, ignore MLD', () {
      final entries = _parse30i().multicast;
      expect(entries.map((e) => e.groupIp), isNot(contains('::')));
      final ssdp = entries.firstWhere(
          (e) => e.vid == 600 && e.groupIp == '239.255.255.250');
      expect(ssdp.listenersByPort, {
        4: ['192.168.201.2'],
      });
    });

    test('liste d\'univers compactée', () {
      expect(compactUniverseList([3, 1, 2, 101, 5, 102, 2]), '1-3, 5, 101-102');
      expect(compactUniverseList([]), '');
    });

    test('classe les groupes', () {
      expect(classifyMulticast('239.255.0.1').kind, LuminexMulticastKind.sacn);
      expect(classifyMulticast('239.255.0.1').universe, 1);
      expect(classifyMulticast('239.255.1.0').universe, 256);
      expect(classifyMulticast('239.255.250.214').kind,
          LuminexMulticastKind.sacnDiscovery);
      expect(classifyMulticast('236.4.1.0').kind,
          LuminexMulticastKind.manetAdmin);
      expect(classifyMulticast('236.4.1.3').kind,
          LuminexMulticastKind.manetSession);
      expect(classifyMulticast('239.255.255.250').kind,
          LuminexMulticastKind.ssdp);
      expect(classifyMulticast('224.0.0.251').kind, LuminexMulticastKind.mdns);
      expect(classifyMulticast('239.192.243.243').kind,
          LuminexMulticastKind.other);
      expect(classifyMulticast('pas une ip').kind, LuminexMulticastKind.other);
    });

    test('vue réseau : localise les abonnés sur leur port d\'accès', () {
      final vlans = LuminexMulticastVlan.compute([_parse30i()]);
      expect(vlans.map((v) => v.vid), [1, 200, 600]); // VLAN 300 vide omis

      final sacn = vlans.firstWhere((v) => v.vid == 200);
      expect(sacn.name, 's-ACN');
      expect(sacn.sacnUniverses, [1, 2, 3, 101]);

      final u1 = sacn.groups.firstWhere((g) => g.universe == 1);
      final l = u1.listeners.single;
      expect(l.ip, '192.168.0.2');
      expect(l.switchName, 'SW Dimcity');
      expect(l.portNr, 14);
      expect(l.portName, 'ELC');

      // Abonné vu uniquement à travers l'ISL (port 25) : non localisé.
      final u101 = sacn.groups.firstWhere((g) => g.universe == 101);
      expect(u101.listeners.single.isLocated, isFalse);

      final manet = vlans.firstWhere((v) => v.vid == 600);
      // MA-Net d'abord, administration avant session.
      expect(manet.groups.first.kind, LuminexMulticastKind.manetAdmin);
      expect(manet.groups[1].kind, LuminexMulticastKind.manetSession);
      expect(manet.listenerCount, 3);
      final console = manet.groups.first.listeners
          .firstWhere((x) => x.ip == '192.168.201.3');
      expect(console.portName, 'MA3 M');
    });

    test('un abonné vu sur deux switches est localisé sur son port d\'accès',
        () {
      // Sur le 2e switch, 192.168.0.2 arrive par le trunk (port 1).
      final other = LuminexApiParser.parse(
        ip: '192.168.0.12',
        isManual: false,
        device: _j(_device30i.replaceAll('SW Dimcity', 'Sw Dak SR')),
        ports: _j(_ports30i()),
        groups: _j(_groups),
        snooping: _j('{"vlan":[{"vid":200,"mc_groups":[{"group_ip":'
            '"239.255.0.1","family":"IGMP","ports":[{"port_number":1,'
            '"source_entries":[{"source_ip":"192.168.0.2"}]}]}]}]}'),
      );
      for (final order in [
        [other, _parse30i()],
        [_parse30i(), other],
      ]) {
        final u1 = LuminexMulticastVlan.compute(order)
            .firstWhere((v) => v.vid == 200)
            .groups
            .firstWhere((g) => g.universe == 1);
        expect(u1.listeners, hasLength(1));
        expect(u1.listeners.single.switchName, 'SW Dimcity');
        expect(u1.listeners.single.portNr, 14);
      }
    });
  });

  group('LuminexService (HTTP simulé)', () {
    late String port3Link;
    late int port3Discards;
    late int requestCount;

    MockClient buildClient() => MockClient((request) async {
          requestCount++;
          final path = request.url.path;
          const json = {'content-type': 'application/json'};
          final body = switch (path) {
            '/api/device' => _device30i,
            '/api/system' => _system30i,
            '/api/ports' => _ports30i(
                port3Link: port3Link, port3Discards: port3Discards),
            '/api/groups' => _groups,
            '/api/trunks' => _trunks,
            '/api/temperatures' => _temperatures30i,
            '/api/power' => _power30i,
            '/api/fans' => _fans30i,
            '/api/lldp' => _lldp30i,
            '/api/poe' => _poe30i,
            '/api/status_message' => _status,
            '/api/snooping' => _snooping,
            _ => null,
          };
          if (body == null) {
            if (path.startsWith('/api/')) {
              return http.Response(
                  '{"reason":"not found","code":"ResourceNotFound"}', 404,
                  headers: json);
            }
            return http.Response(_html, 200,
                headers: {'content-type': 'text/html'});
          }
          return http.Response(body, 200, headers: json);
        });

    setUp(() {
      SharedPreferences.setMockInitialValues({});
      port3Link = '1gbps fdx';
      port3Discards = 0;
      requestCount = 0;
    });

    test('lit le switch, puis signale un port qui tombe', () async {
      final service = LuminexService(client: buildClient());
      await service.start();
      await service.addManualIp('192.168.0.1');

      var dev = service.devices.single;
      expect(dev.isReachable, isTrue);
      expect(dev.apiGen, LuminexApiGen.gen2);
      expect(dev.name, 'SW Dimcity');
      expect(dev.ports, hasLength(10));
      expect(dev.groups, isNotEmpty);
      // Ports jamais branchés (13, 26) : pas d'alarme. CPU à 71 °C : normal.
      expect(dev.alarms, isEmpty);

      // Le port 3 (console) tombe, avec des rejets qui grimpent.
      port3Link = 'down';
      port3Discards = 500;
      await service.forceRefresh();
      dev = service.devices.single;
      final types = dev.alarms.map((a) => '${a.type.name}:${a.portNr}');
      expect(types, contains('${LuminexAlarmType.portDown.name}:3'));
      expect(types, contains('${LuminexAlarmType.highRxErrors.name}:3'));

      // Le port revient : alarme « hors ligne » levée.
      port3Link = '1gbps fdx';
      await service.forceRefresh();
      dev = service.devices.single;
      expect(
        dev.alarms.where((a) => a.type == LuminexAlarmType.portDown),
        isEmpty,
      );

      service.dispose();
    });

    test('nombre de requêtes HTTP par relevé complet', () async {
      final service = LuminexService(client: buildClient());
      await service.start();
      await service.addManualIp('192.168.0.1');
      // 1 (device) + 2 (system, ports) + 9 (données lentes)
      expect(requestCount, 12);

      requestCount = 0;
      await service.forceRefresh(); // manuel : relit tout
      expect(requestCount, 12);

      service.dispose();
    });

    test('une page HTML n\'est pas prise pour un switch', () async {
      final client = MockClient((request) async => http.Response(
          _html, 200,
          headers: {'content-type': 'text/html'}));
      final service = LuminexService(client: client);
      await service.start();
      await service.addManualIp('192.168.0.50');

      final dev = service.devices.single;
      expect(dev.isReachable, isFalse);
      expect(dev.ports, isEmpty);

      service.dispose();
    });
  });

  group('Configuration (écriture)', () {
    // Petit « switch » simulé : port 13 modifiable, port 1 = trunk.
    late Map<String, dynamic> port13;
    late List<String> calls;
    late List<String> profileSlots;
    late bool failDownload;

    MockClient buildWriteClient() => MockClient((request) async {
          final path = request.url.path;
          calls.add('${request.method} $path');
          const json = {'content-type': 'application/json'};
          if (request.method == 'GET') {
            if (path == '/api/ports/port/13') {
              return http.Response(jsonEncode(port13), 200, headers: json);
            }
            if (path == '/api/ports/port/1') {
              return http.Response(
                  jsonEncode({
                    'port_number': 1,
                    'legend': '',
                    'enabled': true,
                    'protected': false,
                    'member_of': {'type': 'trunk', 'id': 1},
                  }),
                  200,
                  headers: json);
            }
            if (path == '/api/device') {
              return http.Response(_device30i, 200, headers: json);
            }
            if (path == '/api/ports') {
              return http.Response(_ports30i(), 200, headers: json);
            }
            if (path == '/api/config/profiles') {
              return http.Response(
                  jsonEncode([
                    for (var i = 0; i < profileSlots.length; i++)
                      {'slot': i, 'name': profileSlots[i], 'protected': false},
                  ]),
                  200,
                  headers: json);
            }
            final m = RegExp(r'^/api/config/profiles/(\d+)(/download)?$')
                .firstMatch(path);
            if (m != null) {
              final slot = int.parse(m.group(1)!);
              if (m.group(2) != null) {
                if (failDownload) return http.Response('', 500);
                return http.Response.bytes(
                    [0x1f, 0x8b, 8, 0, 1, 2, 3], 200,
                    headers: {'content-type': 'application/octet-stream'});
              }
              return http.Response(
                  jsonEncode({
                    'slot': slot,
                    'name': profileSlots[slot],
                    'model': 'GigaCore30i',
                    'content': {
                      'device': {'name': 'SW Dimcity'},
                      'ip_settings': {'ip_address': '192.168.0.1'},
                      'ports': {
                        'port': [
                          {
                            'port_number': 13,
                            'enabled': true,
                            'member_of': {'type': 'group', 'id': 1},
                          },
                        ],
                      },
                      'groups': {'group': []},
                      'trunks': {'trunk': []},
                    },
                  }),
                  200,
                  headers: json);
            }
            return http.Response('{}', 404, headers: json);
          }

          // Écritures
          final body = jsonDecode(utf8.decode(request.bodyBytes));
          if (path == '/api/ports/port') {
            for (final change in body as List) {
              final c = change as Map<String, dynamic>;
              if (c['port_number'] == 13) port13.addAll(c);
            }
            return http.Response('[]', 200, headers: json);
          }
          final save = RegExp(r'^/api/config/profiles/(\d+)/save$')
              .firstMatch(path);
          if (save != null) {
            profileSlots[int.parse(save.group(1)!)] =
                (body as Map)['name'] as String;
            return http.Response('{}', 200, headers: json);
          }
          final clear = RegExp(r'^/api/config/profiles/(\d+)/clear$')
              .firstMatch(path);
          if (clear != null) {
            profileSlots[int.parse(clear.group(1)!)] = '__empty__';
            return http.Response('{}', 200, headers: json);
          }
          if (path == '/api/port_identify' || path == '/api/identify') {
            return http.Response('{}', 200, headers: json);
          }
          return http.Response(
              '{"reason":"Not allowed","code":"NotAllowed"}', 405,
              headers: json);
        });

    setUp(() {
      SharedPreferences.setMockInitialValues({});
      port13 = {
        'port_number': 13,
        'legend': '',
        'enabled': true,
        'protected': false,
        'member_of': {'type': 'group', 'id': 1},
      };
      calls = [];
      profileSlots = ['__empty__', 'Show A', '__empty__', '__empty__'];
      failDownload = false;
    });

    test('renomme un port, vérifie, puis annule', () async {
      final service = LuminexService(client: buildWriteClient());
      final r = await service.setPortLegend('192.168.0.1', 13, ' Node jardin ');
      expect(r.ok, isTrue);
      expect(port13['legend'], 'Node jardin');
      // Seul le champ modifié est envoyé.
      expect(calls, contains('PUT /api/ports/port'));

      final undo = await service.restorePort('192.168.0.1', r.undo!);
      expect(undo.ok, isTrue);
      expect(port13['legend'], '');
      expect(port13['enabled'], isTrue);
      expect(port13['member_of'], {'type': 'group', 'id': 1});
      service.dispose();
    });

    test('change le groupe et désactive un port d\'accès', () async {
      final service = LuminexService(client: buildWriteClient());
      final g = await service.setPortGroup('192.168.0.1', 13, 7);
      expect(g.ok, isTrue);
      expect(port13['member_of'], {'type': 'group', 'id': 7});
      final e = await service.setPortEnabled('192.168.0.1', 13, false);
      expect(e.ok, isTrue);
      expect(port13['enabled'], isFalse);
      service.dispose();
    });

    test('refuse de toucher au groupe ou à l\'activation d\'un port ISL',
        () async {
      final service = LuminexService(client: buildWriteClient());
      final g = await service.setPortGroup('192.168.0.1', 1, 6);
      final e = await service.setPortEnabled('192.168.0.1', 1, false);
      expect(g.error, LuminexWriteError.trunkPort);
      expect(e.error, LuminexWriteError.trunkPort);
      expect(calls.where((c) => c.startsWith('PUT')), isEmpty);
      service.dispose();
    });

    test('remonte le refus du switch', () async {
      final service = LuminexService(client: buildWriteClient());
      final r = await service.setSwitchName('192.168.0.1', 'Nouveau');
      expect(r.ok, isFalse);
      expect(r.error, LuminexWriteError.rejected);
      expect(r.reason, 'Not allowed');
      service.dispose();
    });

    test('sauvegarde : emplacement libre le plus haut, puis libéré', () async {
      final service = LuminexService(client: buildWriteClient());
      final r = await service.createBackup('192.168.0.1');
      expect(r.backup, isNotNull);
      // Emplacement 3 (le plus haut libre), jamais le 0, ni « Show A ».
      expect(calls, contains('PUT /api/config/profiles/3/save'));
      expect(calls, contains('PUT /api/config/profiles/3/clear'));
      expect(profileSlots, ['__empty__', 'Show A', '__empty__', '__empty__']);

      final b = r.backup!;
      expect(b.switchName, 'SW Dimcity');
      expect(b.model, 'GigaCore30i');
      expect(b.profileFileBytes.take(2), [0x1f, 0x8b]);
      expect(b.legends[3], 'MA3 M');
      expect(b.legends[13], '');

      // Aller-retour fichier.
      final again = LuminexBackup.tryParse(b.toJsonString());
      expect(again, isNotNull);
      expect(again!.legends, b.legends);
      expect(again.profileFileBase64, b.profileFileBase64);
      expect(LuminexBackup.tryParse('{"format":"autre"}'), isNull);
      expect(LuminexBackup.tryParse('pas du json'), isNull);
      service.dispose();
    });

    test('sauvegarde ratée : l\'emplacement est quand même libéré', () async {
      failDownload = true;
      final service = LuminexService(client: buildWriteClient());
      final r = await service.createBackup('192.168.0.1');
      expect(r.backup, isNull);
      expect(calls, contains('PUT /api/config/profiles/3/clear'));
      expect(profileSlots[3], '__empty__');
      service.dispose();
    });
  });

  group('Comparaison avec une sauvegarde', () {
    LuminexBackup backupWith({
      required List<Map<String, dynamic>> ports,
      Map<int, String> legends = const {},
      String model = 'GigaCore30i',
    }) =>
        LuminexBackup(
          createdAt: DateTime(2026, 10, 14, 17, 55),
          sourceIp: '192.168.0.1',
          switchName: 'SW Dimcity',
          model: model,
          profileContent: {
            'device': {'name': 'SW Dimcity'},
            'ip_settings': {'ip_address': '192.168.0.1'},
            'ports': {'port': ports},
            'groups': {
              'group': [
                {'group_id': 2, 'name': 's-ACN'},
                {'group_id': 6, 'name': 'MA-NET'},
              ],
            },
          },
          profileFileBase64: base64Encode([0x1f, 0x8b]),
          legends: legends,
        );

    test('liste les différences et prépare la remise des ports', () {
      final live = _parse30i();
      final b = backupWith(
        ports: [
          // Port 3 : MA-NET en vrai, s-ACN dans la sauvegarde.
          {
            'port_number': 3,
            'enabled': true,
            'member_of': {'type': 'group', 'id': 2},
          },
          // Port 13 : désactivé dans la sauvegarde.
          {
            'port_number': 13,
            'enabled': false,
            'member_of': {'type': 'group', 'id': 1},
          },
          // Port 1 : trunk des deux côtés, identique.
          {
            'port_number': 1,
            'enabled': true,
            'member_of': {'type': 'trunk', 'id': 1},
          },
        ],
        legends: {5: 'PU X', 14: 'ELC'},
      );

      final diffs = b.diff(live);
      final kinds = diffs.map((d) => '${d.kind.name}:${d.portNr}').toList();
      expect(kinds, [
        'portGroup:3',
        'portEnabled:13',
        'portLegend:5',
      ]);
      expect(diffs.first.backupValue, 's-ACN');
      expect(diffs.first.liveValue, 'MA-NET');

      expect(b.portRestorePayload(live), [
        {
          'port_number': 3,
          'member_of': {'type': 'group', 'id': 2},
        },
        {'port_number': 5, 'legend': 'PU X'},
        {'port_number': 13, 'enabled': false},
      ]);
    });

    test('signale un modèle différent', () {
      final b = backupWith(ports: const [], model: 'GigaCore16t');
      expect(b.diff(_parse30i()).single.kind, LuminexBackupDiffKind.model);
    });

    test('nom de fichier proposé', () {
      expect(backupWith(ports: const []).suggestedFileName,
          'GigaCore SW Dimcity 2026-10-14 1755.json');
    });
  });

  group('Inventaire', () {
    test('ports actifs, IP, univers et MA-Net', () {
      final inv = LuminexInventoryEntry.compute([_parse30i()]);
      // Ports actifs du fixture : 1, 3, 5, 14, 17, 21, 24, 25 (13 et 26 down).
      expect(inv.map((e) => e.portNr), [1, 3, 5, 14, 17, 21, 24, 25]);

      final elc = inv.firstWhere((e) => e.portNr == 14);
      expect(elc.portName, 'ELC');
      expect(elc.groupName, 's-ACN');
      expect(elc.ips, ['192.168.0.2']);
      expect(elc.sacnUniverses, [1, 2, 3]);
      expect(elc.issues, isEmpty);

      final console = inv.firstWhere((e) => e.portNr == 3);
      expect(console.manet, isTrue);
      expect(console.ips, ['192.168.201.3']);

      final isl = inv.firstWhere((e) => e.portNr == 25);
      expect(isl.isTrunk, isTrue);
      expect(isl.trunkName, 'ISL');
      expect(isl.neighborName, 'Sw Dak SR');
      // Les abonnés vus à travers l'ISL ne sont pas comptés sur ce port.
      expect(isl.ips, isEmpty);
    });

    test('signale un appareil sans IP et une IP en double', () {
      final dev = LuminexApiParser.parse(
        ip: '192.168.0.12',
        isManual: false,
        device: _j(_device30i),
        ports: _j(_ports30i()),
        groups: _j(_groups),
        snooping: _j('{"vlan":[{"vid":200,"mc_groups":['
            '{"group_ip":"239.255.0.111","family":"IGMP","ports":['
            '{"port_number":14,"source_entries":[{"source_ip":"0.0.0.0"}]},'
            '{"port_number":17,"source_entries":[{"source_ip":"2.0.0.9"}]},'
            '{"port_number":24,"source_entries":[{"source_ip":"2.0.0.9"}]}'
            ']}]}]}'),
      );
      final inv = LuminexInventoryEntry.compute([dev]);
      final p14 = inv.firstWhere((e) => e.portNr == 14);
      expect(p14.issues, [LuminexInventoryIssue.noIpAddress]);
      expect(p14.ips, isEmpty);
      expect(p14.sacnUniverses, [111]);

      for (final nr in [17, 24]) {
        final e = inv.firstWhere((e) => e.portNr == nr);
        expect(e.issues, [LuminexInventoryIssue.duplicateIp], reason: '$nr');
        expect(e.duplicateIps, ['2.0.0.9']);
      }
    });

    test('recherche et export CSV', () {
      final inv = LuminexInventoryEntry.compute([_parse30i()]);
      final elc = inv.firstWhere((e) => e.portNr == 14);
      expect(elc.searchText, contains('u2'));
      expect(elc.searchText, contains('192.168.0.2'));
      final csv = LuminexInventoryEntry.toCsv(inv).split('\n');
      expect(csv, hasLength(inv.length + 1));
      expect(csv.first, startsWith('Switch;Switch IP;Port'));
      expect(csv.firstWhere((l) => l.contains(';14;ELC;')),
          contains(';s-ACN;200;'));
    });
  });

  group('Bilan de santé avec GigaCore', () {
    test('sACN vu dans un autre VLAN au lieu de « aucun sACN »', () {
      final r = NetworkDiagnosticService.analyze(
        devices: const [],
        artnetUniverses: const {},
        sacnUniverses: const {},
        localIp: '192.168.0.102',
        luminexDevices: [_parse30i()],
      );
      final codes = r.alerts.map((a) => a.code).toList();
      expect(codes, contains('diagSacnOtherVlan'));
      expect(codes, isNot(contains('diagNoSacn')));
      final other = r.alerts.firstWhere((a) => a.code == 'diagSacnOtherVlan');
      expect(other.params['count'], 3); // univers 1, 2, 3 du fixture
    });

    test('switch injoignable et appareil sans IP', () {
      final noIp = LuminexApiParser.parse(
        ip: '192.168.0.12',
        isManual: false,
        device: _j(_device30i),
        ports: _j(_ports30i()),
        groups: _j(_groups),
        snooping: _j('{"vlan":[{"vid":200,"mc_groups":[{"group_ip":'
            '"239.255.0.111","family":"IGMP","ports":[{"port_number":14,'
            '"source_entries":[{"source_ip":"0.0.0.0"}]}]}]}]}'),
      );
      const down = LuminexDevice(ip: '192.168.0.11');
      final r = NetworkDiagnosticService.analyze(
        devices: const [],
        artnetUniverses: const {},
        sacnUniverses: const {},
        localIp: '192.168.0.102',
        luminexDevices: [noIp, down],
      );
      final unreachable =
          r.alerts.firstWhere((a) => a.code == 'diagLuminexUnreachable');
      expect(unreachable.severity, DiagnosticSeverity.critical);
      expect(unreachable.params['ip'], '192.168.0.11');
      final missing = r.alerts.firstWhere((a) => a.code == 'diagLuminexNoIp');
      expect(missing.params['port'], 14);
      expect(missing.params['name'], 'ELC');
    });
  });
}
