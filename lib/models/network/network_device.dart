/// Représente un appareil découvert sur le réseau local lors d'un scan.
class NetworkDevice {
  final String ip;
  final String? hostname;
  final String? mac; // Non accessible depuis Flutter sans root/entitlements
  final String? manufacturer; // Non accessible sans base OUI embarquée
  final int? responseTimeMs;
  final bool isOnline;
  final DateTime discoveredAt;

  const NetworkDevice({
    required this.ip,
    this.hostname,
    this.mac,
    this.manufacturer,
    this.responseTimeMs,
    required this.isOnline,
    required this.discoveredAt,
  });

  Map<String, dynamic> toJson() => {
        'ip': ip,
        'hostname': hostname,
        'mac': mac,
        'manufacturer': manufacturer,
        'responseTimeMs': responseTimeMs,
        'isOnline': isOnline,
        'discoveredAt': discoveredAt.toIso8601String(),
      };

  factory NetworkDevice.fromJson(Map<String, dynamic> json) => NetworkDevice(
        ip: json['ip'] as String,
        hostname: json['hostname'] as String?,
        mac: json['mac'] as String?,
        manufacturer: json['manufacturer'] as String?,
        responseTimeMs: json['responseTimeMs'] as int?,
        isOnline: json['isOnline'] as bool,
        discoveredAt: DateTime.parse(json['discoveredAt'] as String),
      );

  NetworkDevice copyWith({
    String? hostname,
    String? mac,
    String? manufacturer,
    int? responseTimeMs,
    bool? isOnline,
  }) {
    return NetworkDevice(
      ip: ip,
      hostname: hostname ?? this.hostname,
      mac: mac ?? this.mac,
      manufacturer: manufacturer ?? this.manufacturer,
      responseTimeMs: responseTimeMs ?? this.responseTimeMs,
      isOnline: isOnline ?? this.isOnline,
      discoveredAt: discoveredAt,
    );
  }
}
