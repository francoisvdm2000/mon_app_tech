import 'package:flutter/foundation.dart';

enum MaNetProtocol { maNet2, maNet3, unknown }

/// Classe d'équipement annoncée dans les paquets MA-Net3 (octets 12-13).
/// Codes observés sur le terrain : 0x0001 = console, 0x0003 = processing unit.
enum MaDeviceClass { console, processingUnit, unknown }

@immutable
class MaNetNode {
  final String ip;
  final String? mac;
  final String? name;
  final String? nodeType;
  final String? firmwareVersion;
  final String? sessionName;
  final MaDeviceClass deviceClass;
  final MaNetProtocol protocol;
  final DateTime lastSeen;
  final bool isOnline;

  const MaNetNode({
    required this.ip,
    this.mac,
    this.name,
    this.nodeType,
    this.firmwareVersion,
    this.sessionName,
    this.deviceClass = MaDeviceClass.unknown,
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
    String? sessionName,
    MaDeviceClass? deviceClass,
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
        sessionName: sessionName ?? this.sessionName,
        deviceClass: deviceClass ?? this.deviceClass,
        protocol: protocol ?? this.protocol,
        lastSeen: lastSeen ?? this.lastSeen,
        isOnline: isOnline ?? this.isOnline,
      );

  @override
  bool operator ==(Object other) => other is MaNetNode && other.ip == ip;

  @override
  int get hashCode => ip.hashCode;
}
