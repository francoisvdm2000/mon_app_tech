/// Source NDI découverte via mDNS (_ndi._tcp).
class NdiSource {
  final String name;        // Nom de la source, e.g. "CAMERA1 (NDI HX)"
  final String? host;       // Hostname / nom de machine, e.g. "CAMERA1.local"
  final String ip;          // IP résolue
  final int port;           // Port du service
  final String serviceName; // Nom complet du service mDNS

  const NdiSource({
    required this.name,
    this.host,
    required this.ip,
    required this.port,
    required this.serviceName,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'host': host,
        'ip': ip,
        'port': port,
        'serviceName': serviceName,
      };

  factory NdiSource.fromJson(Map<String, dynamic> json) => NdiSource(
        name: json['name'] as String,
        host: json['host'] as String?,
        ip: json['ip'] as String,
        port: json['port'] as int,
        serviceName: json['serviceName'] as String,
      );

  @override
  String toString() => 'NdiSource($name @ $ip:$port)';
}
