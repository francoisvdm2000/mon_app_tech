/// Niveau de sévérité d'une alerte de diagnostic réseau.
enum DiagnosticSeverity { info, warning, critical }

/// Une alerte produite par [NetworkDiagnosticService].
///
/// [code] identifie le type d'alerte (clé L10n côté UI).
/// [params] contient les valeurs paramétrisées pour le message.
class NetworkDiagnosticAlert {
  final DiagnosticSeverity severity;
  final String code;
  final Map<String, dynamic> params;

  const NetworkDiagnosticAlert({
    required this.severity,
    required this.code,
    this.params = const {},
  });

  Map<String, dynamic> toJson() => {
        'severity': severity.name,
        'code': code,
        'params': params,
      };

  factory NetworkDiagnosticAlert.fromJson(Map<String, dynamic> json) =>
      NetworkDiagnosticAlert(
        severity: DiagnosticSeverity.values.firstWhere(
          (s) => s.name == json['severity'],
          orElse: () => DiagnosticSeverity.info,
        ),
        code: json['code'] as String,
        params: Map<String, dynamic>.from(
            (json['params'] as Map?)?.cast<String, dynamic>() ?? {}),
      );
}
