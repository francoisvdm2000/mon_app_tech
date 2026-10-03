import 'package:flutter/foundation.dart';

enum MaNetProtocol { maNet2, maNet3, unknown }

@immutable
class MaNetNode {
  final String ip;
  final String? mac;
  final String? name;
  final String? nodeType;
  final String? firmwareVersion;
  final MaNetProtocol protocol;
  final DateTime lastSeen;
  final bool isOnline;

  const MaNetNode({
    required this.ip,
    this.mac,
    this.name,
    this.nodeType,
    this.firmwareVersion,
    required this.protocol,
    required this.lastSeen,
    this.isOnline = true,
  });

  String get displayName =>
      (name != null && name!.isNotEmpty) ? name! : ip;

  MaNetNode copyWith({
    String? ip,
    String? mac,
    String? name,
    String? nodeType,
    String? firmwareVersion,
    MaNetProtocol? protocol,
    DateTime? lastSeen,
    bool? isOnline,
  }) =>
      MaNetNode(
        ip: ip ?? this.ip,
        mac: mac ?? this.mac,
        name: name ?? this.name,
        nodeType: nodeType ?? this.nodeType,
        firmwareVersion: firmwareVersion ?? this.firmwareVersion,
        protocol: protocol ?? this.protocol,
        lastSeen: lastSeen ?? this.lastSeen,
        isOnline: isOnline ?? this.isOnline,
      );

  @override
  bool operator ==(Object other) => other is MaNetNode && other.ip == ip;

  @override
  int get hashCode => ip.hashCode;
}
