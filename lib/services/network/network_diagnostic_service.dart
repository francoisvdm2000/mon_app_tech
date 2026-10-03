import '../../../models/network/dmx_universe.dart';
import '../../../models/network/ndi_source.dart';
import '../../../models/network/network_device.dart';
import '../../../models/network/network_diagnostic_alert.dart';
import '../../../models/network/network_diagnostic_result.dart';

/// Service d'analyse réseau statique.
///
/// Reçoit un snapshot des données collectées (scan, Art-Net, sACN) et
/// retourne un [NetworkDiagnosticResult] avec score et liste d'alertes.
///
/// Architecture : service stateless, aucune dépendance Flutter.
/// Luminex et MA-Net : architecture prévue, non implémentée.
class NetworkDiagnosticService {
  static const double _lowFpsThreshold = 10.0;
  static const int _unknownDevicesRatioThreshold = 60; // % sans hostname

  /// Points déduits par niveau de sévérité.
  static const int _criticalPenalty = 25;
  static const int _warningPenalty = 10;
  static const int _infoPenalty = 5;

  NetworkDiagnosticService._();

  static NetworkDiagnosticResult analyze({
    required List<NetworkDevice> devices,
    required Map<int, DmxUniverse> artnetUniverses,
    required Map<int, DmxUniverse> sacnUniverses,
    List<NdiSource> ndiSources = const [],
    String? localIp,
  }) {
    final alerts = <NetworkDiagnosticAlert>[];

    // ── CRITIQUE ────────────────────────────────────────────────────────────

    // Pas d'IP locale valide
    if (localIp == null ||
        localIp.isEmpty ||
        localIp == '0.0.0.0' ||
        localIp == 'null') {
      alerts.add(const NetworkDiagnosticAlert(
        severity: DiagnosticSeverity.critical,
        code: 'diagNoLocalIp',
      ));
    }

    // ── AVERTISSEMENTS ───────────────────────────────────────────────────────

    // IPs dupliquées dans le scan
    if (devices.isNotEmpty) {
      final seen = <String>{};
      final duplicates = <String>{};
      for (final d in devices) {
        if (!seen.add(d.ip)) duplicates.add(d.ip);
      }
      for (final ip in duplicates) {
        alerts.add(NetworkDiagnosticAlert(
          severity: DiagnosticSeverity.warning,
          code: 'diagDuplicateIp',
          params: {'ip': ip},
        ));
      }
    }

    // Art-Net : FPS faible ou univers tout à zéro
    for (final uni in artnetUniverses.values) {
      if (uni.fps > 0 && uni.fps < _lowFpsThreshold) {
        alerts.add(NetworkDiagnosticAlert(
          severity: DiagnosticSeverity.warning,
          code: 'diagArtNetLowFps',
          params: {
            'universe': uni.universe,
            'fps': uni.fps.toStringAsFixed(1),
          },
        ));
      }
      if (uni.fps > 0 && uni.activeChannels == 0) {
        alerts.add(NetworkDiagnosticAlert(
          severity: DiagnosticSeverity.warning,
          code: 'diagZeroDmxChannels',
          params: {'protocol': 'Art-Net', 'universe': uni.universe},
        ));
      }
    }

    // sACN : FPS faible ou univers tout à zéro
    for (final uni in sacnUniverses.values) {
      if (uni.fps > 0 && uni.fps < _lowFpsThreshold) {
        alerts.add(NetworkDiagnosticAlert(
          severity: DiagnosticSeverity.warning,
          code: 'diagSacnLowFps',
          params: {
            'universe': uni.universe,
            'fps': uni.fps.toStringAsFixed(1),
          },
        ));
      }
      if (uni.fps > 0 && uni.activeChannels == 0) {
        alerts.add(NetworkDiagnosticAlert(
          severity: DiagnosticSeverity.warning,
          code: 'diagZeroDmxChannels',
          params: {'protocol': 'sACN', 'universe': uni.universe},
        ));
      }
    }

    // ── INFO ─────────────────────────────────────────────────────────────────

    // Aucun appareil détecté
    if (devices.isEmpty) {
      alerts.add(const NetworkDiagnosticAlert(
        severity: DiagnosticSeverity.info,
        code: 'diagNoDevices',
      ));
    }

    // Aucun flux Art-Net
    if (artnetUniverses.isEmpty) {
      alerts.add(const NetworkDiagnosticAlert(
        severity: DiagnosticSeverity.info,
        code: 'diagNoArtNet',
      ));
    }

    // Aucun flux sACN
    if (sacnUniverses.isEmpty) {
      alerts.add(const NetworkDiagnosticAlert(
        severity: DiagnosticSeverity.info,
        code: 'diagNoSacn',
      ));
    }

    // Trop d'appareils sans hostname
    if (devices.length >= 3) {
      final unnamed = devices
          .where((d) => d.hostname == null || d.hostname!.isEmpty)
          .length;
      final ratio = (unnamed * 100) ~/ devices.length;
      if (ratio > _unknownDevicesRatioThreshold) {
        alerts.add(NetworkDiagnosticAlert(
          severity: DiagnosticSeverity.info,
          code: 'diagManyUnknownDevices',
          params: {'count': unnamed},
        ));
      }
    }

    // ── Score ────────────────────────────────────────────────────────────────

    int score = 100;
    for (final alert in alerts) {
      switch (alert.severity) {
        case DiagnosticSeverity.critical:
          score -= _criticalPenalty;
        case DiagnosticSeverity.warning:
          score -= _warningPenalty;
        case DiagnosticSeverity.info:
          score -= _infoPenalty;
      }
    }
    if (score < 0) score = 0;

    // Trier : critical > warning > info
    alerts.sort((a, b) => b.severity.index.compareTo(a.severity.index));

    return NetworkDiagnosticResult(
      score: score,
      alerts: alerts,
      analyzedAt: DateTime.now(),
    );
  }
}
