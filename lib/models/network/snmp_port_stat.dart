import 'dart:math';
import 'package:flutter/foundation.dart';

/// Statistiques d'un port de switch lues via SNMP v2c.
@immutable
class SnmpPortStat {
  final int index;
  final String name;      // ifDescr
  final bool isUp;        // ifOperStatus == 1
  final int speedMbps;    // ifHighSpeed (Mbps)
  final int inOctets;     // ifHCInOctets (64-bit)
  final int outOctets;    // ifHCOutOctets (64-bit)
  final double? inBps;    // calculé : octets/s entrants
  final double? outBps;   // calculé : octets/s sortants
  final DateTime sampledAt;

  const SnmpPortStat({
    required this.index,
    required this.name,
    required this.isUp,
    required this.speedMbps,
    required this.inOctets,
    required this.outOctets,
    this.inBps,
    this.outBps,
    required this.sampledAt,
  });

  int get speedBps => speedMbps * 1000000;

  double get utilizationIn =>
      speedBps > 0 && inBps != null ? (inBps! * 8) / speedBps : 0.0;

  double get utilizationOut =>
      speedBps > 0 && outBps != null ? (outBps! * 8) / speedBps : 0.0;

  double get utilizationMax => max(utilizationIn, utilizationOut);

  double get inKbps => (inBps ?? 0) * 8 / 1000;
  double get outKbps => (outBps ?? 0) * 8 / 1000;
  double get inMbps => inKbps / 1000;
  double get outMbps => outKbps / 1000;
}
