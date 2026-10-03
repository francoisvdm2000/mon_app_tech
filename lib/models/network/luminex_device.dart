import 'luminex_alarm.dart';
import 'luminex_port.dart';
import 'network_diagnostic_alert.dart';

/// Génération de l'API Luminex GigaCore détectée.
enum LuminexApiGen {
  /// API texte pipe-délimitée (anciennes versions)
  gen1,

  /// API JSON REST (versions récentes)
  gen2,

  /// Non encore déterminée
  unknown,
}

/// Représente un switch Luminex GigaCore supervisé.
///
/// Lecture seule — aucune modification de configuration.
class LuminexDevice {
  final String ip;
  final String? name;
  final String? model;
  final String? firmware;

  /// Uptime en secondes, null si non disponible.
  final int? uptimeSeconds;

  /// Température interne en °C, null si non disponible (Gen1 limité).
  final double? temperatureCelsius;

  /// Alimentation principale OK, null si information indisponible.
  final bool? psuOk;

  final List<LuminexPort> ports;
  final LuminexApiGen apiGen;

  /// true = switch répond aux requêtes HTTP.
  final bool isReachable;

  /// true = IP ajoutée manuellement (vs. découverte auto par scan).
  final bool isManual;

  /// true = interrogation HTTP en cours.
  final bool isPolling;

  final DateTime? lastFetch;
  final List<LuminexAlarm> alarms;

  const LuminexDevice({
    required this.ip,
    this.name,
    this.model,
    this.firmware,
    this.uptimeSeconds,
    this.temperatureCelsius,
    this.psuOk,
    this.ports = const [],
    this.apiGen = LuminexApiGen.unknown,
    this.isReachable = false,
    this.isManual = false,
    this.isPolling = false,
    this.lastFetch,
    this.alarms = const [],
  });

  // ─── Accesseurs utilitaires ────────────────────────────────────────────────

  int get alarmCount => alarms.length;

  String get displayName => name ?? ip;

  DiagnosticSeverity get maxSeverity {
    if (alarms.isEmpty) return DiagnosticSeverity.info;
    final order = DiagnosticSeverity.values;
    return alarms
        .map((a) => a.severity)
        .reduce((a, b) => order.indexOf(a) > order.indexOf(b) ? a : b);
  }

  // ─── copyWith ──────────────────────────────────────────────────────────────

  LuminexDevice copyWith({
    String? name,
    String? model,
    String? firmware,
    int? uptimeSeconds,
    double? temperatureCelsius,
    bool? psuOk,
    List<LuminexPort>? ports,
    LuminexApiGen? apiGen,
    bool? isReachable,
    bool? isPolling,
    DateTime? lastFetch,
    List<LuminexAlarm>? alarms,
  }) {
    return LuminexDevice(
      ip: ip,
      name: name ?? this.name,
      model: model ?? this.model,
      firmware: firmware ?? this.firmware,
      uptimeSeconds: uptimeSeconds ?? this.uptimeSeconds,
      temperatureCelsius: temperatureCelsius ?? this.temperatureCelsius,
      psuOk: psuOk ?? this.psuOk,
      ports: ports ?? this.ports,
      apiGen: apiGen ?? this.apiGen,
      isReachable: isReachable ?? this.isReachable,
      isManual: isManual,
      isPolling: isPolling ?? this.isPolling,
      lastFetch: lastFetch ?? this.lastFetch,
      alarms: alarms ?? this.alarms,
    );
  }
}
