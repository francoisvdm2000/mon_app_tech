import 'network_device.dart';
import 'dmx_universe.dart';
import 'ndi_source.dart';
import 'network_diagnostic_result.dart';

/// Snapshot de l'état réseau à un instant donné.
class NetworkSnapshot {
  final String id;
  final DateTime createdAt;
  final String? localIp;
  final List<NetworkDevice> devices;
  final Map<int, DmxUniverse> artnetUniverses;
  final Map<int, DmxUniverse> sacnUniverses;
  final List<NdiSource> ndiSources;
  final NetworkDiagnosticResult? diagnostic;

  const NetworkSnapshot({
    required this.id,
    required this.createdAt,
    this.localIp,
    required this.devices,
    required this.artnetUniverses,
    required this.sacnUniverses,
    this.ndiSources = const [],
    this.diagnostic,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'createdAt': createdAt.toIso8601String(),
        'localIp': localIp,
        'devices': devices.map((d) => d.toJson()).toList(),
        'artnetUniverses':
            artnetUniverses.map((k, v) => MapEntry(k.toString(), v.toJson())),
        'sacnUniverses':
            sacnUniverses.map((k, v) => MapEntry(k.toString(), v.toJson())),
        'ndiSources': ndiSources.map((s) => s.toJson()).toList(),
        'diagnostic': diagnostic?.toJson(),
      };

  factory NetworkSnapshot.fromJson(Map<String, dynamic> json) =>
      NetworkSnapshot(
        id: json['id'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
        localIp: json['localIp'] as String?,
        devices: (json['devices'] as List)
            .map((e) => NetworkDevice.fromJson(e as Map<String, dynamic>))
            .toList(),
        artnetUniverses:
            (json['artnetUniverses'] as Map<String, dynamic>).map(
          (k, v) => MapEntry(
              int.parse(k), DmxUniverse.fromJson(v as Map<String, dynamic>)),
        ),
        sacnUniverses:
            (json['sacnUniverses'] as Map<String, dynamic>).map(
          (k, v) => MapEntry(
              int.parse(k), DmxUniverse.fromJson(v as Map<String, dynamic>)),
        ),
        ndiSources: json.containsKey('ndiSources')
            ? (json['ndiSources'] as List)
                .map((e) => NdiSource.fromJson(e as Map<String, dynamic>))
                .toList()
            : const [],
        diagnostic: json['diagnostic'] != null
            ? NetworkDiagnosticResult.fromJson(
                json['diagnostic'] as Map<String, dynamic>)
            : null,
      );
}
