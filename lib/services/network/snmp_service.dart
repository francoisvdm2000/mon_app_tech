import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import '../../models/network/snmp_port_stat.dart';

/// Service SNMP v2c — implémentation BER pure Dart, sans dépendance externe.
///
/// OIDs MIB-II utilisés :
///   ifDescr       1.3.6.1.2.1.2.2.1.2    — nom du port
///   ifOperStatus  1.3.6.1.2.1.2.2.1.8    — 1=up, 2=down
///   ifHighSpeed   1.3.6.1.2.1.31.1.1.1.15 — vitesse en Mbps
///   ifHCInOctets  1.3.6.1.2.1.31.1.1.1.6  — compteur 64-bit entrant
///   ifHCOutOctets 1.3.6.1.2.1.31.1.1.1.10 — compteur 64-bit sortant
class SnmpService {
  static const _udpPort = 161;
  static const _timeout = Duration(seconds: 3);
  static const _pollInterval = Duration(seconds: 2);
  static const _maxReps = 64;

  static const _oidDescr = '1.3.6.1.2.1.2.2.1.2';
  static const _oidStatus = '1.3.6.1.2.1.2.2.1.8';
  static const _oidSpeed = '1.3.6.1.2.1.31.1.1.1.15';
  static const _oidInOcts = '1.3.6.1.2.1.31.1.1.1.6';
  static const _oidOutOcts = '1.3.6.1.2.1.31.1.1.1.10';

  final _rng = Random();
  bool _active = false;
  StreamController<List<SnmpPortStat>>? _ctrl;

  // ─── API publique ─────────────────────────────────────────────────────────

  Stream<List<SnmpPortStat>> monitor(String host, String community) {
    _active = false;
    _ctrl?.close();
    _ctrl = StreamController<List<SnmpPortStat>>.broadcast();
    _active = true;
    _pollLoop(host, community);
    return _ctrl!.stream;
  }

  void dispose() {
    _active = false;
    _ctrl?.close();
    _ctrl = null;
  }

  // ─── Boucle de polling ────────────────────────────────────────────────────

  Future<void> _pollLoop(String host, String community) async {
    Map<int, int>? prevIn;
    Map<int, int>? prevOut;
    DateTime? prevTime;

    while (_active) {
      try {
        final descr = await _walk(host, community, _oidDescr);
        final status = await _walk(host, community, _oidStatus);
        final speed = await _walk(host, community, _oidSpeed);
        final inOcts = await _walk(host, community, _oidInOcts);
        final outOcts = await _walk(host, community, _oidOutOcts);
        final now = DateTime.now();

        final ports = <SnmpPortStat>[];
        for (final idx in descr.keys) {
          final name = (descr[idx] as String?) ?? 'Port $idx';
          final lo = name.toLowerCase();
          if (lo.startsWith('lo') || lo.contains('loopback')) continue;

          double? inBps, outBps;
          if (prevIn != null && prevTime != null) {
            final dt = now.difference(prevTime).inMilliseconds / 1000.0;
            if (dt > 0 && inOcts.containsKey(idx) && outOcts.containsKey(idx)) {
              final ci = (inOcts[idx] as int?) ?? 0;
              final co = (outOcts[idx] as int?) ?? 0;
              final pi = prevIn[idx] ?? 0;
              final po = prevOut![idx] ?? 0;
              inBps = (ci >= pi ? ci - pi : ci) / dt;
              outBps = (co >= po ? co - po : co) / dt;
            }
          }

          ports.add(SnmpPortStat(
            index: idx,
            name: name,
            isUp: (status[idx] as int?) == 1,
            speedMbps: (speed[idx] as int?) ?? 1000,
            inOctets: (inOcts[idx] as int?) ?? 0,
            outOctets: (outOcts[idx] as int?) ?? 0,
            inBps: inBps,
            outBps: outBps,
            sampledAt: now,
          ));
        }

        prevIn = {
          for (final e in inOcts.entries) e.key: (e.value as int?) ?? 0
        };
        prevOut = {
          for (final e in outOcts.entries) e.key: (e.value as int?) ?? 0
        };
        prevTime = now;

        ports.sort((a, b) => a.index.compareTo(b.index));
        final c = _ctrl;
        if (_active && c != null && !c.isClosed) c.add(ports);
      } catch (e) {
        final c = _ctrl;
        if (_active && c != null && !c.isClosed) c.addError(e);
        break;
      }
      await Future.delayed(_pollInterval);
    }
  }

  // ─── Walk d'une table OID via GETBULK ────────────────────────────────────

  Future<Map<int, dynamic>> _walk(
      String host, String community, String baseOid) async {
    final reqId = _rng.nextInt(0x7FFFFFFF);
    final packet = _buildGetBulk(community, reqId, [baseOid], _maxReps);
    final resp = await _sendUdp(host, packet);
    if (resp == null) throw SnmpTimeoutException(host);

    final varbinds = _parseResponse(resp, reqId);
    final result = <int, dynamic>{};
    for (final (oid, value) in varbinds) {
      if (!oid.startsWith('$baseOid.')) break;
      final suffix = oid.substring(baseOid.length + 1);
      if (!suffix.contains('.')) {
        final idx = int.tryParse(suffix);
        if (idx != null) result[idx] = value;
      }
    }
    return result;
  }

  // ─── Transport UDP ────────────────────────────────────────────────────────

  Future<Uint8List?> _sendUdp(String host, Uint8List packet) async {
    RawDatagramSocket? sock;
    try {
      final addr = (await InternetAddress.lookup(host)).first;
      sock = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
      sock.send(packet, addr, _udpPort);

      final completer = Completer<Uint8List?>();
      late StreamSubscription<RawSocketEvent> sub;
      sub = sock.listen((event) {
        if (event == RawSocketEvent.read) {
          final dg = sock!.receive();
          if (dg != null && !completer.isCompleted) {
            completer.complete(Uint8List.fromList(dg.data));
          }
          sub.cancel();
        }
      });
      return await completer.future.timeout(_timeout, onTimeout: () => null);
    } catch (_) {
      return null;
    } finally {
      sock?.close();
    }
  }

  // ─── Encodeur BER ─────────────────────────────────────────────────────────

  static Uint8List _len(int n) {
    if (n < 128) return Uint8List.fromList([n]);
    if (n < 256) return Uint8List.fromList([0x81, n]);
    return Uint8List.fromList([0x82, n >> 8, n & 0xff]);
  }

  static Uint8List _tlv(int tag, List<int> value) =>
      Uint8List.fromList([tag, ..._len(value.length), ...value]);

  static List<int> _encInt(int n) {
    if (n == 0) return _tlv(0x02, [0x00]);
    final bytes = <int>[];
    var v = n;
    while (v > 0) {
      bytes.insert(0, v & 0xff);
      v >>= 8;
    }
    if (bytes[0] & 0x80 != 0) bytes.insert(0, 0x00);
    return _tlv(0x02, bytes);
  }

  static List<int> _encStr(String s) => _tlv(0x04, s.codeUnits);

  static List<int> _encOid(String oid) {
    final parts = oid.split('.').map(int.parse).toList();
    final bytes = <int>[40 * parts[0] + parts[1]];
    for (var i = 2; i < parts.length; i++) {
      var v = parts[i];
      if (v < 128) {
        bytes.add(v);
      } else {
        final sub = <int>[];
        sub.add(v & 0x7f);
        v >>= 7;
        while (v > 0) {
          sub.insert(0, (v & 0x7f) | 0x80);
          v >>= 7;
        }
        bytes.addAll(sub);
      }
    }
    return _tlv(0x06, bytes);
  }

  static Uint8List _buildGetBulk(
      String community, int requestId, List<String> oids, int maxReps) {
    final varbinds = <int>[];
    for (final oid in oids) {
      varbinds.addAll(_tlv(0x30, [..._encOid(oid), 0x05, 0x00]));
    }
    final vbl = _tlv(0x30, varbinds);
    final pdu = _tlv(0xA5, [
      ..._encInt(requestId),
      ..._encInt(0),
      ..._encInt(maxReps),
      ...vbl,
    ]);
    return Uint8List.fromList(_tlv(0x30, [
      ..._encInt(1),
      ..._encStr(community),
      ...pdu,
    ]));
  }

  // ─── Décodeur BER ─────────────────────────────────────────────────────────

  static List<(String, dynamic)> _parseResponse(
      Uint8List data, int expectedId) {
    try {
      final p = _BerParser(data);
      p.enter(0x30); // SEQUENCE message
      p.readInt(); // version
      p.readString(); // community
      if (p.peekTag() != 0xA2) return [];
      p.enter(0xA2); // GetResponse-PDU
      if (p.readInt() != expectedId) return [];
      p.readInt();
      p.readInt(); // error-status, error-index
      final vblEnd = p.enter(0x30); // VarBindList
      final result = <(String, dynamic)>[];
      while (p.pos < vblEnd) {
        final vbEnd = p.enter(0x30);
        final oid = p.readOid();
        final value = p.readValue();
        if (value != null) result.add((oid, value));
        p.seekTo(vbEnd);
      }
      return result;
    } catch (_) {
      return [];
    }
  }
}

// ─── Parseur BER ─────────────────────────────────────────────────────────────

class _BerParser {
  final Uint8List _d;
  int _p = 0;

  _BerParser(this._d);

  int get pos => _p;
  void seekTo(int pos) => _p = pos;
  int peekTag() => _p < _d.length ? _d[_p] : -1;

  void _assertTag(int expected) {
    final got = _d[_p++];
    if (got != expected) {
      throw FormatException('BER: expected 0x${expected.toRadixString(16)}, '
          'got 0x${got.toRadixString(16)} at ${_p - 1}');
    }
  }

  int _readLen() {
    final first = _d[_p++];
    if (first & 0x80 == 0) return first;
    final nb = first & 0x7f;
    var len = 0;
    for (var i = 0; i < nb; i++) {
      len = (len << 8) | _d[_p++];
    }
    return len;
  }

  /// Lit tag + longueur, positionne le curseur sur le premier octet du contenu.
  /// Retourne la position de fin du contenu.
  int enter(int tag) {
    _assertTag(tag);
    final len = _readLen();
    return _p + len;
  }

  int readInt() {
    final end = enter(0x02);
    var v = 0;
    while (_p < end) {
      v = (v << 8) | _d[_p++];
    }
    return v;
  }

  String readString() {
    final end = enter(0x04);
    final s = String.fromCharCodes(_d.sublist(_p, end));
    _p = end;
    return s;
  }

  String readOid() {
    final end = enter(0x06);
    final c = <int>[];
    final first = _d[_p++];
    c.add(first ~/ 40);
    c.add(first % 40);
    while (_p < end) {
      var v = 0;
      while (_d[_p] & 0x80 != 0) {
        v = (v << 7) | (_d[_p++] & 0x7f);
      }
      v = (v << 7) | _d[_p++];
      c.add(v);
    }
    return c.join('.');
  }

  int _readUnsigned(int len) {
    var v = 0;
    for (var i = 0; i < len; i++) {
      v = (v << 8) | _d[_p++];
    }
    return v;
  }

  dynamic readValue() {
    if (_p >= _d.length) return null;
    final tag = _d[_p];
    switch (tag) {
      case 0x02:
        return readInt();
      case 0x04:
        return readString();
      case 0x06:
        return readOid();
      case 0x05: // NULL
        _p++;
        _p += _readLen();
        return null;
      case 0x40: // IpAddress
      case 0x41: // Counter32
      case 0x42: // Gauge32
      case 0x43: // TimeTicks
      case 0x46: // Counter64
        _p++;
        return _readUnsigned(_readLen());
      default:
        _p++;
        _p += _readLen();
        return null;
    }
  }
}

// ─── Exception ───────────────────────────────────────────────────────────────

class SnmpTimeoutException implements Exception {
  final String host;
  const SnmpTimeoutException(this.host);
  @override
  String toString() => 'SNMP timeout — $host ne répond pas';
}
