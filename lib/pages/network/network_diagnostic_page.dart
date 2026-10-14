import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../models/network/dmx_universe.dart';
import '../../models/network/luminex_alarm.dart';
import '../../models/network/ndi_source.dart';
import '../../models/network/network_device.dart';
import '../../models/network/network_diagnostic_alert.dart';
import '../../models/network/network_diagnostic_result.dart';
import '../../models/network/network_snapshot.dart';
import '../../services/network/artnet_service.dart';
import '../../services/network/luminex_service.dart';
import '../../services/network/ndi_discovery_service.dart';
import '../../services/network/network_diagnostic_service.dart';
import '../../services/network/network_scan_service.dart';
import '../../services/network/network_snapshot_service.dart';
import '../about/about_favorites.dart';
import 'luminex_monitor_page.dart' show luminexAlarmLabel;
import '../../services/network/sacn_service.dart';

const _kAccentDiag = Color(0xFF00E5FF);

class NetworkDiagnosticPage extends StatefulWidget {
  const NetworkDiagnosticPage({super.key});

  @override
  State<NetworkDiagnosticPage> createState() => _NetworkDiagnosticPageState();
}

class _NetworkDiagnosticPageState extends State<NetworkDiagnosticPage> {
  // ── Services ───────────────────────────────────────────────────────────────
  final _scanService = NetworkScanService();
  final _artnetService = ArtNetService();
  final _sacnService = SacnService();
  final _snapshotService = NetworkSnapshotService();

  /// Switches GigaCore : IP enregistrées dans l'outil Luminex + découverte
  /// sur le sous-réseau. Ils apportent la vue de tous les VLAN.
  final _luminexService = LuminexService();

  StreamSubscription<NetworkScanEvent>? _scanSub;
  StreamSubscription<Map<int, DmxUniverse>>? _artnetSub;
  StreamSubscription<Map<int, DmxUniverse>>? _sacnSub;
  Timer? _collectTimer;
  Timer? _timeoutTimer;

  // ── State ──────────────────────────────────────────────────────────────────
  bool _analyzing = false;
  _AnalysisPhase _phase = _AnalysisPhase.idle;
  int _scanDone = 0;
  int _scanTotal = 0;

  String? _localIp;
  List<NetworkDevice> _scanDevices = [];
  Map<int, DmxUniverse> _artnetUniverses = {};
  Map<int, DmxUniverse> _sacnUniverses = {};
  List<NdiSource> _ndiSources = [];

  NetworkDiagnosticResult? _result;

  @override
  void dispose() {
    _stopAll();
    _scanService.dispose();
    _artnetService.dispose();
    _sacnService.dispose();
    _luminexService.dispose();
    super.dispose();
  }

  void _stopAll() {
    _collectTimer?.cancel();
    _timeoutTimer?.cancel();
    _scanSub?.cancel();
    _artnetSub?.cancel();
    _sacnSub?.cancel();
    _scanService.stopScan();
    _artnetService.stop();
    _sacnService.stop();
    _luminexService.stop();
  }

  // ── Analyse ────────────────────────────────────────────────────────────────

  Future<void> _startAnalysis() async {
    _stopAll();
    setState(() {
      _analyzing = true;
      _phase = _AnalysisPhase.scanning;
      _result = null;
      _scanDevices = [];
      _artnetUniverses = {};
      _sacnUniverses = {};
      _ndiSources = [];
      _scanDone = 0;
      _scanTotal = 0;
      _localIp = null;
    });

    // GigaCore : relevé des switches connus, puis recherche sur le
    // sous-réseau (en parallèle du reste).
    unawaited(_luminexService
        .start()
        .then((_) => _luminexService.discoverOnSubnet())
        .catchError((_) {}));

    // Démarrer Art-Net + sACN en parallèle du scan
    try {
      await _artnetService.start();
      _artnetSub = _artnetService.stream.listen((universes) {
        _artnetUniverses = Map.from(universes);
      });
    } catch (_) {}

    try {
      await _sacnService.start();
      _sacnSub = _sacnService.stream.listen((universes) {
        _sacnUniverses = Map.from(universes);
      });
    } catch (_) {}

    // Scan réseau
    _scanSub = _scanService.events.listen(_onScanEvent);
    try {
      await _scanService.startScan();
    } catch (_) {
      _finishAfterDelay();
    }

    // Timeout global 45s
    _timeoutTimer = Timer(const Duration(seconds: 45), _runDiagnostic);
  }

  void _onScanEvent(NetworkScanEvent event) {
    if (!mounted) return;
    setState(() {
      switch (event) {
        case NetworkScanStartedEvent e:
          _localIp = e.localIp;
          _scanTotal = e.totalHosts;
          _scanDone = 0;
        case NetworkScanProgressEvent e:
          _scanDone = e.done;
          _scanTotal = e.total;
        case NetworkScanDeviceFoundEvent e:
          _scanDevices = [..._scanDevices, e.device];
        case NetworkScanCompletedEvent _:
          _phase = _AnalysisPhase.collecting;
          _finishAfterDelay();
        case NetworkScanErrorEvent e:
          _localIp ??= (e.code == 'no_network') ? null : _localIp;
          _finishAfterDelay();
      }
    });
  }

  void _finishAfterDelay() {
    _timeoutTimer?.cancel();
    _collectTimer?.cancel();
    setState(() => _phase = _AnalysisPhase.collecting);
    // Laisser 3s de collecte Art-Net/sACN + NDI après le scan
    _collectTimer = Timer(const Duration(seconds: 3), _runDiagnostic);
    // Lancer la découverte NDI en parallèle (durée max 5s)
    NdiDiscoveryService.discover().then((sources) {
      if (mounted) _ndiSources = sources;
    });
  }

  void _runDiagnostic() {
    _collectTimer?.cancel();
    _timeoutTimer?.cancel();
    _artnetSub?.cancel();
    _sacnSub?.cancel();
    _artnetService.stop();
    _sacnService.stop();

    // Switches GigaCore : les injoignables ne comptent que si au moins un
    // GigaCore répond (sinon ce sont des IP d'une autre installation).
    final gigacores = _luminexService.devices;
    final anyReachable = gigacores.any((d) => d.isReachable);
    _luminexService.stop();

    final result = NetworkDiagnosticService.analyze(
      devices: _scanDevices,
      artnetUniverses: _artnetUniverses,
      sacnUniverses: _sacnUniverses,
      ndiSources: _ndiSources,
      localIp: _localIp,
      luminexDevices: anyReachable ? gigacores : const [],
    );

    if (!mounted) return;
    setState(() {
      _analyzing = false;
      _phase = _AnalysisPhase.idle;
      _result = result;
    });
  }

  void _clearResult() {
    _stopAll();
    setState(() {
      _result = null;
      _analyzing = false;
      _phase = _AnalysisPhase.idle;
    });
  }

  Future<void> _createSnapshot() async {
    if (_result == null) return;
    final snapshot = NetworkSnapshot(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      createdAt: DateTime.now(),
      localIp: _localIp,
      devices: List.from(_scanDevices),
      artnetUniverses: Map.from(_artnetUniverses),
      sacnUniverses: Map.from(_sacnUniverses),
      ndiSources: List.from(_ndiSources),
      diagnostic: _result,
    );
    await _snapshotService.save(snapshot);
    if (!mounted) return;
    final loc = AppLocalizations.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(loc.diagSnapshotSaved),
        backgroundColor: Colors.greenAccent.withValues(alpha: 0.85),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          loc.diagPageTitle,
          style: const TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2),
        ),
        actions: const [
          AboutPinButton(pageId: 'tool:network_diagnostic', sectionId: 'main'),
          SizedBox(width: 4),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          16, 16, 16, 24 + MediaQuery.paddingOf(context).bottom,
        ),
        children: [
          // ── Info ─────────────────────────────────────────────────────────
          _InfoBanner(text: loc.diagPlatformInfo),
          const SizedBox(height: 16),

          // ── Boutons ───────────────────────────────────────────────────────
          _ActionRow(
            analyzing: _analyzing,
            hasResult: _result != null,
            onAnalyse: _startAnalysis,
            onClear: _clearResult,
            onSnapshot: _result != null ? _createSnapshot : null,
            loc: loc,
          ),
          const SizedBox(height: 16),

          // ── Phase en cours ────────────────────────────────────────────────
          if (_analyzing) ...[
            _PhaseIndicator(
              phase: _phase,
              done: _scanDone,
              total: _scanTotal,
              loc: loc,
            ),
            const SizedBox(height: 20),
          ],

          // ── Résultat ──────────────────────────────────────────────────────
          if (_result != null) ...[
            _ScoreCard(result: _result!, loc: loc),
            const SizedBox(height: 16),
            _AlertCountRow(result: _result!, loc: loc),
            const SizedBox(height: 16),
            _AlertList(result: _result!, loc: loc),
          ] else if (!_analyzing) ...[
            const SizedBox(height: 40),
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.monitor_heart_outlined,
                    size: 56,
                    color: Colors.white.withValues(alpha: 0.12),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    loc.diagNoResultYet,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withValues(alpha: 0.30),
                      height: 1.45,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ─── Phase enum ───────────────────────────────────────────────────────────────

enum _AnalysisPhase { idle, scanning, collecting }

// ─── Widgets ──────────────────────────────────────────────────────────────────

class _InfoBanner extends StatelessWidget {
  final String text;
  const _InfoBanner({required this.text});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: _kAccentDiag.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _kAccentDiag.withValues(alpha: 0.20)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.info_outline_rounded,
                color: _kAccentDiag.withValues(alpha: 0.70), size: 18),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withValues(alpha: 0.55),
                  height: 1.35,
                ),
              ),
            ),
          ],
        ),
      );
}

class _ActionRow extends StatelessWidget {
  final bool analyzing;
  final bool hasResult;
  final VoidCallback onAnalyse;
  final VoidCallback onClear;
  final VoidCallback? onSnapshot;
  final AppLocalizations loc;

  const _ActionRow({
    required this.analyzing,
    required this.hasResult,
    required this.onAnalyse,
    required this.onClear,
    required this.onSnapshot,
    required this.loc,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Bouton principal Analyser / Annuler
        Expanded(
          child: _ActionButton(
            label: analyzing ? loc.diagCancelButton : loc.diagAnalyseButton,
            icon: analyzing ? Icons.cancel_outlined : Icons.search_rounded,
            color: analyzing ? Colors.orangeAccent : _kAccentDiag,
            onTap: analyzing ? onClear : onAnalyse,
          ),
        ),
        if (hasResult && !analyzing) ...[
          const SizedBox(width: 10),
          _ActionButton(
            label: loc.diagClearButton,
            icon: Icons.delete_outline_rounded,
            color: Colors.white38,
            onTap: onClear,
            compact: true,
          ),
          const SizedBox(width: 10),
          _ActionButton(
            label: loc.diagSnapshotButton,
            icon: Icons.camera_alt_outlined,
            color: Colors.greenAccent,
            onTap: onSnapshot ?? () {},
            compact: true,
          ),
        ],
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final bool compact;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        padding: EdgeInsets.symmetric(horizontal: compact ? 12 : 16),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withValues(alpha: 0.35)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 20),
            if (!compact) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _PhaseIndicator extends StatelessWidget {
  final _AnalysisPhase phase;
  final int done;
  final int total;
  final AppLocalizations loc;

  const _PhaseIndicator({
    required this.phase,
    required this.done,
    required this.total,
    required this.loc,
  });

  @override
  Widget build(BuildContext context) {
    final label = switch (phase) {
      _AnalysisPhase.scanning => total > 0
          ? loc.diagScanProgress(done, total)
          : loc.diagScanningNetwork,
      _AnalysisPhase.collecting => loc.diagCollectingFlux,
      _AnalysisPhase.idle => loc.diagAnalyzing,
    };

    final pct = total > 0 && phase == _AnalysisPhase.scanning
        ? done / total
        : null;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _kAccentDiag.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _kAccentDiag.withValues(alpha: 0.20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: _kAccentDiag,
                  value: pct,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: _kAccentDiag,
                  ),
                ),
              ),
            ],
          ),
          if (pct != null) ...[
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: pct,
                backgroundColor: Colors.white.withValues(alpha: 0.08),
                valueColor: const AlwaysStoppedAnimation(_kAccentDiag),
                minHeight: 4,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ── Score card ────────────────────────────────────────────────────────────────

class _ScoreCard extends StatelessWidget {
  final NetworkDiagnosticResult result;
  final AppLocalizations loc;

  const _ScoreCard({required this.result, required this.loc});

  @override
  Widget build(BuildContext context) {
    final statusColor = _statusColor(result.status);
    final statusLabel = switch (result.status) {
      DiagnosticStatus.ok => loc.diagStatusOk,
      DiagnosticStatus.warning => loc.diagStatusWarning,
      DiagnosticStatus.critical => loc.diagStatusCritical,
    };
    final statusIcon = switch (result.status) {
      DiagnosticStatus.ok => Icons.check_circle_rounded,
      DiagnosticStatus.warning => Icons.warning_amber_rounded,
      DiagnosticStatus.critical => Icons.error_rounded,
    };

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: statusColor.withValues(alpha: 0.30)),
      ),
      child: Row(
        children: [
          // Jauge circulaire
          _ScoreGauge(score: result.score),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  loc.diagScoreLabel,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withValues(alpha: 0.45),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(statusIcon, color: statusColor, size: 20),
                    const SizedBox(width: 6),
                    Text(
                      statusLabel,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: statusColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  loc.diagAnalysisDate(_formatDate(result.analyzedAt)),
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white.withValues(alpha: 0.30),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return '${dt.day}/${dt.month}/${dt.year} $h:$m';
  }

  Color _statusColor(DiagnosticStatus status) {
    return switch (status) {
      DiagnosticStatus.ok => Colors.greenAccent,
      DiagnosticStatus.warning => Colors.orangeAccent,
      DiagnosticStatus.critical => Colors.redAccent,
    };
  }
}

class _ScoreGauge extends StatelessWidget {
  final int score;
  const _ScoreGauge({required this.score});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ScoreGaugePainter(score: score),
      child: SizedBox(
        width: 100,
        height: 100,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$score',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: _gaugeColor(score),
                ),
              ),
              Text(
                '/100',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white.withValues(alpha: 0.35),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _gaugeColor(int s) {
    if (s >= 80) return Colors.greenAccent;
    if (s >= 50) return Colors.orangeAccent;
    return Colors.redAccent;
  }
}

class _ScoreGaugePainter extends CustomPainter {
  final int score;
  const _ScoreGaugePainter({required this.score});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 7;
    const startAngle = pi * 0.75;
    const sweepAngle = pi * 1.5;

    final bgPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.08)
      ..strokeWidth = 7
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      bgPaint,
    );

    final fgPaint = Paint()
      ..color = _gaugeColor(score)
      ..strokeWidth = 7
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final fill = (score.clamp(0, 100) / 100.0) * sweepAngle;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      fill,
      false,
      fgPaint,
    );
  }

  Color _gaugeColor(int s) {
    if (s >= 80) return Colors.greenAccent;
    if (s >= 50) return Colors.orangeAccent;
    return Colors.redAccent;
  }

  @override
  bool shouldRepaint(covariant _ScoreGaugePainter old) => old.score != score;
}

// ── Compteurs ─────────────────────────────────────────────────────────────────

class _AlertCountRow extends StatelessWidget {
  final NetworkDiagnosticResult result;
  final AppLocalizations loc;

  const _AlertCountRow({required this.result, required this.loc});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _CountChip(
          count: result.criticalCount,
          label: loc.diagSeverityCritical,
          color: Colors.redAccent,
        ),
        const SizedBox(width: 10),
        _CountChip(
          count: result.warningCount,
          label: loc.diagSeverityWarning,
          color: Colors.orangeAccent,
        ),
        const SizedBox(width: 10),
        _CountChip(
          count: result.infoCount,
          label: loc.diagSeverityInfo,
          color: Colors.blueAccent,
        ),
      ],
    );
  }
}

class _CountChip extends StatelessWidget {
  final int count;
  final String label;
  final Color color;

  const _CountChip({
    required this.count,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: count > 0
              ? color.withValues(alpha: 0.10)
              : Colors.white.withValues(alpha: 0.04),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: count > 0
                ? color.withValues(alpha: 0.30)
                : Colors.white.withValues(alpha: 0.08),
          ),
        ),
        child: Column(
          children: [
            Text(
              '$count',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: count > 0 ? color : Colors.white38,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: count > 0 ? color.withValues(alpha: 0.80) : Colors.white24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Liste d'alertes ───────────────────────────────────────────────────────────

class _AlertList extends StatelessWidget {
  final NetworkDiagnosticResult result;
  final AppLocalizations loc;

  const _AlertList({required this.result, required this.loc});

  @override
  Widget build(BuildContext context) {
    if (result.alerts.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.greenAccent.withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.greenAccent.withValues(alpha: 0.20)),
        ),
        child: Row(
          children: [
            const Icon(Icons.check_circle_rounded,
                color: Colors.greenAccent, size: 20),
            const SizedBox(width: 10),
            Text(
              loc.diagNoAlerts,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.greenAccent,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: Divider(
                    color: Colors.white.withValues(alpha: 0.10), height: 1),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  loc.diagAlertsTitle.toUpperCase(),
                  style: const TextStyle(
                    color: _kAccentDiag,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                    color: Colors.white.withValues(alpha: 0.10), height: 1),
              ),
            ],
          ),
        ),
        ...result.alerts.map(
          (alert) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _AlertTile(alert: alert, message: _alertMessage(alert)),
          ),
        ),
      ],
    );
  }

  String _alertMessage(NetworkDiagnosticAlert alert) {
    final p = alert.params;
    return switch (alert.code) {
      'diagNoLocalIp' => loc.diagNoLocalIp,
      'diagNoDevices' => loc.diagNoDevices,
      'diagNoArtNet' => loc.diagNoArtNet,
      'diagNoSacn' => loc.diagNoSacn,
      'diagDuplicateIp' => loc.diagDuplicateIp('${p['ip']}'),
      'diagArtNetLowFps' => loc.diagArtNetLowFps(
          p['universe'] as int,
          '${p['fps']}',
        ),
      'diagSacnLowFps' => loc.diagSacnLowFps(
          p['universe'] as int,
          '${p['fps']}',
        ),
      'diagZeroDmxChannels' => loc.diagZeroDmxChannels(
          '${p['protocol']}',
          p['universe'] as int,
        ),
      'diagManyUnknownDevices' =>
        loc.diagManyUnknownDevices(p['count'] as int),
      'diagSacnOtherVlan' => loc.diagSacnOtherVlan(p['count'] as int),
      'diagLuminexUnreachable' =>
        loc.diagLuminexUnreachable('${p['switch']}', '${p['ip']}'),
      'diagLuminexAlarm' =>
        loc.diagLuminexAlarm('${p['switch']}', _luminexAlarmText(p)),
      'diagLuminexNoIp' => loc.diagLuminexNoIp(
          '${p['switch']}',
          (p['port'] as num?)?.toInt() ?? 0,
          '${p['name']}',
        ),
      'diagLuminexDuplicateIp' => loc.diagLuminexDuplicateIp(
          '${p['switch']}',
          (p['port'] as num?)?.toInt() ?? 0,
          '${p['ips']}',
        ),
      _ => alert.code,
    };
  }

  /// Texte d'une alarme GigaCore enregistrée dans un diagnostic.
  String _luminexAlarmText(Map<String, dynamic> p) {
    final type = LuminexAlarmType.values
        .where((t) => t.name == p['type'])
        .firstOrNull;
    if (type == null) return '${p['type']}';
    final params = Map<String, dynamic>.from(p)
      ..remove('switch')
      ..remove('type')
      ..remove('port');
    return luminexAlarmLabel(
      LuminexAlarm(
        type: type,
        severity: DiagnosticSeverity.warning,
        portNr: (p['port'] as num?)?.toInt(),
        params: params,
        timestamp: DateTime.now(),
      ),
      loc,
    );
  }
}

class _AlertTile extends StatelessWidget {
  final NetworkDiagnosticAlert alert;
  final String message;

  const _AlertTile({required this.alert, required this.message});

  @override
  Widget build(BuildContext context) {
    final color = switch (alert.severity) {
      DiagnosticSeverity.critical => Colors.redAccent,
      DiagnosticSeverity.warning => Colors.orangeAccent,
      DiagnosticSeverity.info => Colors.blueAccent,
    };
    final icon = switch (alert.severity) {
      DiagnosticSeverity.critical => Icons.error_rounded,
      DiagnosticSeverity.warning => Icons.warning_amber_rounded,
      DiagnosticSeverity.info => Icons.info_rounded,
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.22)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                fontSize: 13,
                color: Colors.white.withValues(alpha: 0.80),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
