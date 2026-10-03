import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../models/network/network_dashboard_state.dart';
import '../../models/network/network_device.dart';
import '../../models/network/network_diagnostic_alert.dart';
import '../../models/network/network_live_alert.dart';
import '../../models/network/network_snapshot.dart';
import '../../models/network/ndi_source.dart';
import '../../services/network/network_dashboard_service.dart';
import 'artnet_viewer_page.dart';
import 'ndi_discovery_page.dart';
import 'network_diagnostic_page.dart';
import 'network_scan_page.dart';
import 'sacn_viewer_page.dart';
import '../about/about_favorites.dart';
import 'snapshot_list_page.dart';

const _kAccent = Color(0xFF00E5FF); // Cyan réseau

class NetworkDashboardPage extends StatefulWidget {
  const NetworkDashboardPage({super.key});

  @override
  State<NetworkDashboardPage> createState() => _NetworkDashboardPageState();
}

class _NetworkDashboardPageState extends State<NetworkDashboardPage> {
  late final NetworkDashboardService _service;
  NetworkDashboardState _state = const NetworkDashboardState();

  @override
  void initState() {
    super.initState();
    _service = NetworkDashboardService();
    _service.stream.listen((s) {
      if (mounted) setState(() => _state = s);
    });
    _service.start();
  }

  @override
  void dispose() {
    _service.dispose();
    super.dispose();
  }

  // ─── Actions ────────────────────────────────────────────────────────────────

  void _rescan() => _service.rescan();
  void _refreshNdi() => _service.refreshNdi();

  // ─── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          loc.dashboardPageTitle,
          style: const TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2),
        ),
        actions: [
          const AboutPinButton(pageId: 'tool:network_dashboard', sectionId: 'main'),
          IconButton(
            tooltip: loc.dashboardNdiRefreshButton,
            icon: Icon(
              Icons.videocam_rounded,
              color: _state.ndiScanning
                  ? _kAccent
                  : Colors.white.withValues(alpha: 0.55),
            ),
            onPressed: _refreshNdi,
          ),
          IconButton(
            tooltip: loc.dashboardRescanButton,
            icon: Icon(
              Icons.radar_rounded,
              color: _state.scanStatus == DashboardScanStatus.scanning
                  ? _kAccent
                  : Colors.white.withValues(alpha: 0.55),
            ),
            onPressed: _state.scanStatus == DashboardScanStatus.scanning
                ? null
                : _rescan,
          ),
          const SizedBox(width: 4),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(
              height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(16, 12, 16, 24 + bottom),
        children: [
          _StatusBanner(state: _state, loc: loc),
          const SizedBox(height: 16),
          _KpiGrid(state: _state, loc: loc),
          const SizedBox(height: 20),
          _AlertsSection(state: _state, loc: loc),
          const SizedBox(height: 20),
          _SnapshotSection(state: _state, loc: loc),
          const SizedBox(height: 20),
          _QuickAccessSection(loc: loc),
        ],
      ),
    );
  }
}

// ─── Bannière de statut ────────────────────────────────────────────────────────

class _StatusBanner extends StatelessWidget {
  final NetworkDashboardState state;
  final AppLocalizations loc;
  const _StatusBanner({required this.state, required this.loc});

  @override
  Widget build(BuildContext context) {
    final (icon, label, color) = switch (state.scanStatus) {
      DashboardScanStatus.scanning => (
          Icons.radar_rounded,
          loc.dashboardStatusScanning,
          _kAccent,
        ),
      DashboardScanStatus.completed => (
          Icons.check_circle_rounded,
          loc.dashboardStatusCompleted,
          const Color(0xFF00E676),
        ),
      DashboardScanStatus.error => (
          Icons.error_rounded,
          loc.dashboardStatusError,
          Colors.redAccent,
        ),
      DashboardScanStatus.idle => (
          Icons.circle_outlined,
          loc.dashboardStatusIdle,
          Colors.white38,
        ),
    };

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.22)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Icône de statut
              Icon(icon, color: color, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ),
              // Indicateurs listening
              if (state.artnetListening)
                _StatusPill(
                    label: loc.dashboardArtnetActive,
                    color: const Color(0xFFFFB703)),
              if (state.sacnListening) ...[
                const SizedBox(width: 6),
                _StatusPill(
                    label: loc.dashboardSacnActive,
                    color: const Color(0xFF7C4DFF)),
              ],
              if (state.ndiScanning) ...[
                const SizedBox(width: 6),
                _StatusPill(label: loc.dashboardNdiScanning, color: _kAccent),
              ],
            ],
          ),
          // Barre de progression du scan
          if (state.scanStatus == DashboardScanStatus.scanning) ...[
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: state.scanProgress / 100.0,
                backgroundColor: color.withValues(alpha: 0.15),
                valueColor: AlwaysStoppedAnimation(color),
                minHeight: 4,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              loc.dashboardScanProgress(state.scanProgress),
              style:
                  TextStyle(color: color.withValues(alpha: 0.70), fontSize: 11),
            ),
          ],
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  final String label;
  final Color color;
  const _StatusPill({required this.label, required this.color});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.14),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.30)),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w800,
            color: color,
            letterSpacing: 0.4,
          ),
        ),
      );
}

// ─── Bottom sheets KPI ────────────────────────────────────────────────────────

void _showDevicesSheet(
  BuildContext context,
  NetworkDashboardState state,
  AppLocalizations loc,
) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => _DevicesSheet(devices: state.devices, loc: loc),
  );
}

void _showNdiSheet(
  BuildContext context,
  NetworkDashboardState state,
  AppLocalizations loc,
) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => _NdiSourcesSheet(sources: state.ndiSources, loc: loc),
  );
}

// ─── Grille KPI ────────────────────────────────────────────────────────────────

class _KpiGrid extends StatelessWidget {
  final NetworkDashboardState state;
  final AppLocalizations loc;
  const _KpiGrid({required this.state, required this.loc});

  @override
  Widget build(BuildContext context) {
    final score = state.diagnosticScore;
    final scoreColor = score == null
        ? Colors.white38
        : score >= 80
            ? const Color(0xFF00E676)
            : score >= 50
                ? const Color(0xFFFFB703)
                : Colors.redAccent;

    return Column(
      children: [
        // Ligne 1 : Appareils / Art-Net / sACN
        Row(
          children: [
            Expanded(
              child: _KpiCard(
                icon: Icons.devices_rounded,
                color: _kAccent,
                value: '${state.devices.length}',
                label: loc.dashboardKpiDevices,
                onTap: state.devices.isEmpty
                    ? null
                    : () => _showDevicesSheet(context, state, loc),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _KpiCard(
                icon: Icons.broadcast_on_personal_rounded,
                color: const Color(0xFFFFB703),
                value: '${state.artnetUniverses.length}',
                label: loc.dashboardKpiArtnet,
                onTap: state.artnetUniverses.isEmpty
                    ? null
                    : () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ArtNetViewerPage()),
                        ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _KpiCard(
                icon: Icons.hub_rounded,
                color: const Color(0xFF7C4DFF),
                value: '${state.sacnUniverses.length}',
                label: loc.dashboardKpiSacn,
                onTap: state.sacnUniverses.isEmpty
                    ? null
                    : () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SacnViewerPage()),
                        ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Ligne 2 : NDI / Score / (vide)
        Row(
          children: [
            Expanded(
              child: _KpiCard(
                icon: Icons.videocam_rounded,
                color: const Color(0xFF00BCD4),
                value: '${state.ndiSources.length}',
                label: loc.dashboardKpiNdi,
                onTap: state.ndiSources.isEmpty
                    ? null
                    : () => _showNdiSheet(context, state, loc),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _KpiCard(
                icon: Icons.monitor_heart_rounded,
                color: scoreColor,
                value: score != null ? '$score' : loc.dashboardNoScore,
                label: loc.dashboardKpiScore,
              ),
            ),
            const SizedBox(width: 8),
            // Cellule vide (équilibrage)
            const Expanded(child: SizedBox()),
          ],
        ),
      ],
    );
  }
}

class _KpiCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String value;
  final String label;
  final VoidCallback? onTap;

  const _KpiCard({
    required this.icon,
    required this.color,
    required this.value,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withValues(alpha: onTap != null ? 0.28 : 0.18),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.45),
                  fontSize: 10.5,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                ),
              ),
              if (onTap != null) ...[
                const SizedBox(width: 2),
                Icon(
                  Icons.chevron_right_rounded,
                  size: 12,
                  color: color.withValues(alpha: 0.50),
                ),
              ],
            ],
          ),
        ],
      ),
    );

    if (onTap == null) return card;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        splashColor: color.withValues(alpha: 0.10),
        highlightColor: color.withValues(alpha: 0.04),
        child: card,
      ),
    );
  }
}

// ─── Section alertes ────────────────────────────────────────────────────────────

class _AlertsSection extends StatelessWidget {
  final NetworkDashboardState state;
  final AppLocalizations loc;
  const _AlertsSection({required this.state, required this.loc});

  @override
  Widget build(BuildContext context) {
    final alerts = state.liveAlerts;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionLabel(label: loc.dashboardSectionAlerts),
        const SizedBox(height: 8),
        if (alerts.isEmpty)
          _EmptyCard(
            icon: Icons.check_circle_outline_rounded,
            text: loc.dashboardNoAlerts,
            color: const Color(0xFF00E676),
          )
        else
          ...alerts.take(10).map(
                (a) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: _LiveAlertTile(alert: a, loc: loc),
                ),
              ),
      ],
    );
  }
}

class _LiveAlertTile extends StatelessWidget {
  final NetworkLiveAlert alert;
  final AppLocalizations loc;
  const _LiveAlertTile({required this.alert, required this.loc});

  @override
  Widget build(BuildContext context) {
    final color = switch (alert.severity) {
      DiagnosticSeverity.critical => Colors.redAccent,
      DiagnosticSeverity.warning => Colors.orangeAccent,
      DiagnosticSeverity.info => _kAccent,
    };
    final icon = switch (alert.severity) {
      DiagnosticSeverity.critical => Icons.error_rounded,
      DiagnosticSeverity.warning => Icons.warning_amber_rounded,
      DiagnosticSeverity.info => Icons.info_outline_rounded,
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.20)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              _message(),
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.85),
                fontSize: 12.5,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            _timeLabel(),
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.30),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  String _message() {
    final p = alert.params;
    return switch (alert.type) {
      NetworkLiveAlertType.newDevice =>
        loc.dashboardAlertNewDevice(p['ip'] as String),
      NetworkLiveAlertType.lostDevice =>
        loc.dashboardAlertLostDevice(p['ip'] as String),
      NetworkLiveAlertType.newArtnetUniverse =>
        loc.dashboardAlertNewArtnetUniverse(p['universe'] as int),
      NetworkLiveAlertType.lostArtnetUniverse =>
        loc.dashboardAlertLostArtnetUniverse(p['universe'] as int),
      NetworkLiveAlertType.newSacnUniverse =>
        loc.dashboardAlertNewSacnUniverse(p['universe'] as int),
      NetworkLiveAlertType.lostSacnUniverse =>
        loc.dashboardAlertLostSacnUniverse(p['universe'] as int),
      NetworkLiveAlertType.newNdiSource =>
        loc.dashboardAlertNewNdiSource(p['name'] as String),
      NetworkLiveAlertType.lostNdiSource =>
        loc.dashboardAlertLostNdiSource(p['name'] as String),
      NetworkLiveAlertType.artnetLowFps =>
        loc.dashboardAlertArtnetLowFps(
            p['universe'] as int, p['fps'] as String),
      NetworkLiveAlertType.sacnLowFps =>
        loc.dashboardAlertSacnLowFps(
            p['universe'] as int, p['fps'] as String),
      NetworkLiveAlertType.sacnDuplicateSource =>
        loc.dashboardAlertSacnDuplicate(
            p['universe'] as int, p['count'] as int),
      NetworkLiveAlertType.sacnPriorityConflict =>
        loc.dashboardAlertSacnPriority(p['universe'] as int),
    };
  }

  String _timeLabel() {
    final diff = DateTime.now().difference(alert.timestamp);
    if (diff.inSeconds < 60) return '${diff.inSeconds}s';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m';
    return '${diff.inHours}h';
  }
}

// ─── Section snapshot ──────────────────────────────────────────────────────────

class _SnapshotSection extends StatelessWidget {
  final NetworkDashboardState state;
  final AppLocalizations loc;
  const _SnapshotSection({required this.state, required this.loc});

  @override
  Widget build(BuildContext context) {
    final snap = state.lastSnapshot;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionLabel(label: loc.dashboardSectionSnapshot),
        const SizedBox(height: 8),
        snap == null
            ? _EmptyCard(
                icon: Icons.photo_library_outlined,
                text: loc.dashboardNoSnapshot,
                color: Colors.white38,
              )
            : _SnapshotCard(snapshot: snap, loc: loc),
      ],
    );
  }
}

class _SnapshotCard extends StatelessWidget {
  final NetworkSnapshot snapshot;
  final AppLocalizations loc;
  const _SnapshotCard({required this.snapshot, required this.loc});

  @override
  Widget build(BuildContext context) {
    final score = snapshot.diagnostic?.score;
    final scoreColor = score == null
        ? Colors.white38
        : score >= 80
            ? const Color(0xFF00E676)
            : score >= 50
                ? const Color(0xFFFFB703)
                : Colors.redAccent;

    final d = snapshot.createdAt.toLocal();
    final dateStr =
        '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year} '
        '${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dateStr,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 14),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 12,
            runSpacing: 6,
            children: [
              _SnapChip(
                  icon: Icons.devices_rounded,
                  label: '${snapshot.devices.length}',
                  color: _kAccent),
              if (snapshot.artnetUniverses.isNotEmpty)
                _SnapChip(
                    icon: Icons.broadcast_on_personal_rounded,
                    label: '${snapshot.artnetUniverses.length}',
                    color: const Color(0xFFFFB703)),
              if (snapshot.sacnUniverses.isNotEmpty)
                _SnapChip(
                    icon: Icons.hub_rounded,
                    label: '${snapshot.sacnUniverses.length}',
                    color: const Color(0xFF7C4DFF)),
              if (snapshot.ndiSources.isNotEmpty)
                _SnapChip(
                    icon: Icons.videocam_rounded,
                    label: '${snapshot.ndiSources.length}',
                    color: const Color(0xFF00BCD4)),
              if (score != null)
                _SnapChip(
                    icon: Icons.monitor_heart_rounded,
                    label: '$score',
                    color: scoreColor),
            ],
          ),
        ],
      ),
    );
  }
}

class _SnapChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _SnapChip(
      {required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: color.withValues(alpha: 0.80)),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color.withValues(alpha: 0.80),
            ),
          ),
        ],
      );
}

// ─── Section accès rapide ──────────────────────────────────────────────────────

class _QuickAccessSection extends StatelessWidget {
  final AppLocalizations loc;
  const _QuickAccessSection({required this.loc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionLabel(label: loc.dashboardSectionQuickAccess),
        const SizedBox(height: 8),
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1.15,
          children: [
            _QuickBtn(
              icon: Icons.radar_rounded,
              label: loc.networkScanCardTitle,
              color: _kAccent,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NetworkScanPage()),
              ),
            ),
            _QuickBtn(
              icon: Icons.broadcast_on_personal_rounded,
              label: loc.networkArtNetCardTitle,
              color: const Color(0xFFFFB703),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ArtNetViewerPage()),
              ),
            ),
            _QuickBtn(
              icon: Icons.hub_rounded,
              label: loc.networkSacnCardTitle,
              color: const Color(0xFF7C4DFF),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SacnViewerPage()),
              ),
            ),
            _QuickBtn(
              icon: Icons.videocam_rounded,
              label: loc.ndiCardTitle,
              color: const Color(0xFF00BCD4),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NdiDiscoveryPage()),
              ),
            ),
            _QuickBtn(
              icon: Icons.monitor_heart_rounded,
              label: loc.diagCardTitle,
              color: const Color(0xFF00E676),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const NetworkDiagnosticPage()),
              ),
            ),
            _QuickBtn(
              icon: Icons.compare_arrows_rounded,
              label: loc.snapshotCardTitle,
              color: const Color(0xFF64FFDA),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SnapshotListPage()),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _QuickBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickBtn({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: color.withValues(alpha: 0.12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withValues(alpha: 0.20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.70),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Widgets utilitaires ───────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
              color: Colors.white.withValues(alpha: 0.10), height: 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            label.toUpperCase(),
            style: const TextStyle(
              color: _kAccent,
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
    );
  }
}

class _EmptyCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  const _EmptyCard(
      {required this.icon, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(color: color, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

// ─── Bottom sheet : liste des appareils ────────────────────────────────────────

class _DevicesSheet extends StatelessWidget {
  final List<NetworkDevice> devices;
  final AppLocalizations loc;
  const _DevicesSheet({required this.devices, required this.loc});

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF161622),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Poignée
          const SizedBox(height: 12),
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.20),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          // En-tête
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Icon(Icons.devices_rounded,
                    color: _kAccent, size: 20),
                const SizedBox(width: 10),
                Text(
                  loc.dashboardKpiDevices,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: _kAccent.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${devices.length}',
                    style: const TextStyle(
                      color: _kAccent,
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Divider(
              height: 1, color: Colors.white.withValues(alpha: 0.08)),
          // Liste (max ~60% écran)
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height * 0.55,
            ),
            child: ListView.separated(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 16 + bottom),
              shrinkWrap: true,
              itemCount: devices.length,
              separatorBuilder: (_, __) => Divider(
                height: 1,
                color: Colors.white.withValues(alpha: 0.06),
              ),
              itemBuilder: (_, i) => _DeviceRow(
                device: devices[i],
                loc: loc,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DeviceRow extends StatelessWidget {
  final NetworkDevice device;
  final AppLocalizations loc;
  const _DeviceRow({required this.device, required this.loc});

  @override
  Widget build(BuildContext context) {
    final hasName = device.hostname != null && device.hostname!.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: _kAccent.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.computer_rounded,
                color: _kAccent, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  device.ip,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                if (hasName) ...[
                  const SizedBox(height: 2),
                  Text(
                    device.hostname!,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.45),
                      fontSize: 12,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                loc.networkScanStatusOnline,
                style: const TextStyle(
                  color: Color(0xFF00E676),
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (device.responseTimeMs != null) ...[
                const SizedBox(height: 2),
                Text(
                  loc.networkScanResponseMs(device.responseTimeMs!),
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.35),
                    fontSize: 11,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Bottom sheet : sources NDI ────────────────────────────────────────────────

class _NdiSourcesSheet extends StatelessWidget {
  final List<NdiSource> sources;
  final AppLocalizations loc;
  const _NdiSourcesSheet({required this.sources, required this.loc});

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    const ndiColor = Color(0xFF00BCD4);

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF161622),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.20),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Icon(Icons.videocam_rounded,
                    color: ndiColor, size: 20),
                const SizedBox(width: 10),
                Text(
                  loc.dashboardKpiNdi,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: ndiColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${sources.length}',
                    style: const TextStyle(
                      color: ndiColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Divider(
              height: 1, color: Colors.white.withValues(alpha: 0.08)),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height * 0.55,
            ),
            child: ListView.separated(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 16 + bottom),
              shrinkWrap: true,
              itemCount: sources.length,
              separatorBuilder: (_, __) => Divider(
                height: 1,
                color: Colors.white.withValues(alpha: 0.06),
              ),
              itemBuilder: (_, i) =>
                  _NdiSourceRow(source: sources[i], loc: loc),
            ),
          ),
        ],
      ),
    );
  }
}

class _NdiSourceRow extends StatelessWidget {
  final NdiSource source;
  final AppLocalizations loc;
  const _NdiSourceRow({required this.source, required this.loc});

  @override
  Widget build(BuildContext context) {
    const ndiColor = Color(0xFF00BCD4);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: ndiColor.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.videocam_rounded,
                color: ndiColor, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  source.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${source.ip}:${source.port}',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.45),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          if (source.host != null)
            Text(
              source.host!,
              style: TextStyle(
                color: ndiColor.withValues(alpha: 0.65),
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }
}
