import 'network_diagnostic_alert.dart';

/// Statut global d'un diagnostic réseau.
enum DiagnosticStatus { ok, warning, critical }

/// Résultat complet d'une analyse produite par [NetworkDiagnosticService].
class NetworkDiagnosticResult {
  final int score; // 0-100
  final List<NetworkDiagnosticAlert> alerts;
  final DateTime analyzedAt;

  const NetworkDiagnosticResult({
    required this.score,
    required this.alerts,
    required this.analyzedAt,
  });

  int get infoCount =>
      alerts.where((a) => a.severity == DiagnosticSeverity.info).length;

  int get warningCount =>
      alerts.where((a) => a.severity == DiagnosticSeverity.warning).length;

  int get criticalCount =>
      alerts.where((a) => a.severity == DiagnosticSeverity.critical).length;

  DiagnosticStatus get status {
    if (criticalCount > 0) return DiagnosticStatus.critical;
    if (warningCount > 0) return DiagnosticStatus.warning;
    return DiagnosticStatus.ok;
  }

  Map<String, dynamic> toJson() => {
        'score': score,
        'alerts': alerts.map((a) => a.toJson()).toList(),
        'analyzedAt': analyzedAt.toIso8601String(),
      };

  factory NetworkDiagnosticResult.fromJson(Map<String, dynamic> json) =>
      NetworkDiagnosticResult(
        score: json['score'] as int,
        alerts: (json['alerts'] as List)
            .map((e) =>
                NetworkDiagnosticAlert.fromJson(e as Map<String, dynamic>))
            .toList(),
        analyzedAt: DateTime.parse(json['analyzedAt'] as String),
      );
}
