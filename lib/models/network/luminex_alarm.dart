import 'network_diagnostic_alert.dart';

/// Types d'alarmes générées par [LuminexService].
enum LuminexAlarmType {
  /// Switch inaccessible (aucune réponse HTTP)
  inaccessible,

  /// Port physiquement hors ligne (link down)
  portDown,

  /// Vitesse du port dégradée (ex. : 1 Gb/s → 100 Mb/s)
  speedDegraded,

  /// Taux d'erreurs RX élevé sur un port
  highRxErrors,

  /// Taux d'erreurs TX élevé sur un port
  highTxErrors,

  /// Défaut d'alimentation PoE sur un port
  poeFault,

  /// Température interne élevée (> seuil)
  highTemp,

  /// Bloc d'alimentation absent ou en défaut
  psuAbsent,
}

/// Alarme produite par le service Luminex.
///
/// [portNr] est null pour les alarmes au niveau du switch
/// (inaccessible, highTemp, psuAbsent).
class LuminexAlarm {
  final LuminexAlarmType type;
  final DiagnosticSeverity severity;
  final int? portNr;
  final Map<String, dynamic> params;
  final DateTime timestamp;

  const LuminexAlarm({
    required this.type,
    required this.severity,
    this.portNr,
    this.params = const {},
    required this.timestamp,
  });

  /// Clé de dédoublonnage : même type + même port (ou niveau switch).
  String get dedupeKey => switch (type) {
        LuminexAlarmType.portDown ||
        LuminexAlarmType.speedDegraded ||
        LuminexAlarmType.highRxErrors ||
        LuminexAlarmType.highTxErrors ||
        LuminexAlarmType.poeFault =>
          '${type.name}_${portNr ?? 0}',
        _ => type.name,
      };
}
