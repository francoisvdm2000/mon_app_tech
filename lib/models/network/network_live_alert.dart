import 'network_diagnostic_alert.dart';

/// Types d'alertes live du tableau de bord réseau.
enum NetworkLiveAlertType {
  newDevice,
  lostDevice,
  newArtnetUniverse,
  lostArtnetUniverse,
  newSacnUniverse,
  lostSacnUniverse,
  newNdiSource,
  lostNdiSource,
  artnetLowFps,
  sacnLowFps,
  sacnDuplicateSource,
  sacnPriorityConflict,
}

/// Alerte live générée par [NetworkDashboardService].
class NetworkLiveAlert {
  final NetworkLiveAlertType type;
  final DiagnosticSeverity severity;
  final Map<String, dynamic> params;
  final DateTime timestamp;

  const NetworkLiveAlert({
    required this.type,
    required this.severity,
    this.params = const {},
    required this.timestamp,
  });

  /// Clé unique pour dédoublonnage (même type + même cible).
  String get dedupeKey {
    final p = params;
    return switch (type) {
      NetworkLiveAlertType.newDevice ||
      NetworkLiveAlertType.lostDevice =>
        '${type.name}_${p['ip']}',
      NetworkLiveAlertType.newArtnetUniverse ||
      NetworkLiveAlertType.lostArtnetUniverse ||
      NetworkLiveAlertType.artnetLowFps =>
        '${type.name}_artnet_${p['universe']}',
      NetworkLiveAlertType.newSacnUniverse ||
      NetworkLiveAlertType.lostSacnUniverse ||
      NetworkLiveAlertType.sacnLowFps ||
      NetworkLiveAlertType.sacnDuplicateSource ||
      NetworkLiveAlertType.sacnPriorityConflict =>
        '${type.name}_sacn_${p['universe']}',
      NetworkLiveAlertType.newNdiSource ||
      NetworkLiveAlertType.lostNdiSource =>
        '${type.name}_${p['name']}',
    };
  }
}
