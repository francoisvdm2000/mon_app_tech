import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../models/network/luminex_alarm.dart';
import '../../models/network/luminex_device.dart';
import '../../models/network/network_diagnostic_alert.dart';
import '../../services/network/luminex_service.dart';
import 'luminex_device_detail_page.dart';
import '../about/about_favorites.dart';

const _kAccent = Color(0xFF00E5FF);

class LuminexMonitorPage extends StatefulWidget {
  const LuminexMonitorPage({super.key});

  @override
  State<LuminexMonitorPage> createState() => _LuminexMonitorPageState();
}

class _LuminexMonitorPageState extends State<LuminexMonitorPage> {
  late final LuminexService _service;
  List<LuminexDevice> _devices = [];

  @override
  void initState() {
    super.initState();
    _service = LuminexService();
    _service.stream.listen((devices) {
      if (mounted) setState(() => _devices = devices);
    });
    _service.start();
  }

  @override
  void dispose() {
    _service.dispose();
    super.dispose();
  }

  // ─── Dialogue ajout IP ─────────────────────────────────────────────────────

  Future<void> _showAddDialog() async {
    final loc = AppLocalizations.of(context);
    final controller = TextEditingController();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A2E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          loc.luminexAddDeviceTitle,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        content: TextField(
          controller: controller,
          autofocus: true,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: loc.luminexAddDeviceHint,
            hintStyle:
                TextStyle(color: Colors.white.withValues(alpha: 0.35)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  BorderSide(color: Colors.white.withValues(alpha: 0.15)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: _kAccent),
            ),
            filled: true,
            fillColor: Colors.white.withValues(alpha: 0.05),
          ),
          onSubmitted: (_) => Navigator.of(ctx).pop(true),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(loc.luminexAddDeviceCancel,
                style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.55))),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(loc.luminexAddDeviceConfirm,
                style: const TextStyle(
                    color: _kAccent, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );

    if (confirmed == true && controller.text.trim().isNotEmpty) {
      await _service.addManualIp(controller.text.trim());
    }
  }

  // ─── Build ─────────────────────────────────────────────────────────────────

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
          loc.luminexPageTitle,
          style: const TextStyle(
              fontWeight: FontWeight.w800, letterSpacing: 0.2),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(
              height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
        actions: [
          const AboutPinButton(pageId: 'tool:network_luminex_monitor', sectionId: 'main'),
          // Bouton "scan réseau"
          IconButton(
            icon: _service.isScanningSubnet
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: _kAccent.withValues(alpha: 0.7),
                    ),
                  )
                : Icon(Icons.radar_rounded,
                    color: _kAccent.withValues(alpha: 0.8)),
            tooltip: loc.luminexScanForDevices,
            onPressed: _service.isScanningSubnet
                ? null
                : () => _service.discoverOnSubnet(),
          ),
          // Bouton "actualiser"
          IconButton(
            icon: Icon(Icons.refresh_rounded,
                color: _kAccent.withValues(alpha: 0.8)),
            tooltip: loc.luminexRefreshAll,
            onPressed: () => _service.forceRefresh(),
          ),
          const SizedBox(width: 4),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddDialog,
        backgroundColor: _kAccent,
        foregroundColor: const Color(0xFF0D0D14),
        icon: const Icon(Icons.add_rounded),
        label: Text(
          loc.luminexAddDevice,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: _devices.isEmpty
          ? _EmptyState(loc: loc, onAdd: _showAddDialog)
          : ListView.separated(
              padding: EdgeInsets.fromLTRB(
                  16,
                  12,
                  16,
                  80 + MediaQuery.paddingOf(context).bottom),
              itemCount: _devices.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (_, i) => _DeviceCard(
                device: _devices[i],
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LuminexDeviceDetailPage(
                      device: _devices[i],
                      service: _service,
                    ),
                  ),
                ),
                onRemove: _devices[i].isManual
                    ? () => _service.removeManualIp(_devices[i].ip)
                    : null,
                loc: loc,
              ),
            ),
    );
  }
}

// ─── État vide ────────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  final AppLocalizations loc;
  final VoidCallback onAdd;
  const _EmptyState({required this.loc, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.router_rounded,
                size: 64, color: _kAccent.withValues(alpha: 0.25)),
            const SizedBox(height: 20),
            Text(
              loc.luminexNoDevices,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              loc.luminexNoDevicesHint,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.40),
                fontSize: 13.5,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Carte device ─────────────────────────────────────────────────────────────

class _DeviceCard extends StatelessWidget {
  final LuminexDevice device;
  final VoidCallback onTap;
  final VoidCallback? onRemove;
  final AppLocalizations loc;

  const _DeviceCard({
    required this.device,
    required this.onTap,
    required this.onRemove,
    required this.loc,
  });

  @override
  Widget build(BuildContext context) {
    final hasAlarms = device.alarmCount > 0;
    final alarmColor = _alarmColor(device.maxSeverity);

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: hasAlarms
              ? alarmColor.withValues(alpha: 0.35)
              : Colors.white.withValues(alpha: 0.07),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          splashColor: _kAccent.withValues(alpha: 0.08),
          highlightColor: _kAccent.withValues(alpha: 0.04),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                // Icône switch
                _DeviceIcon(device: device),
                const SizedBox(width: 14),
                // Infos
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              device.displayName,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white.withValues(
                                    alpha: device.isReachable ? 1.0 : 0.45),
                              ),
                            ),
                          ),
                          if (device.isPolling)
                            SizedBox(
                              width: 14,
                              height: 14,
                              child: CircularProgressIndicator(
                                strokeWidth: 1.5,
                                color: _kAccent.withValues(alpha: 0.6),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(
                        device.ip,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withValues(alpha: 0.40),
                          fontFamily: 'monospace',
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          _StatusDot(reachable: device.isReachable),
                          const SizedBox(width: 5),
                          Text(
                            device.isReachable
                                ? loc.luminexReachable
                                : loc.luminexUnreachable,
                            style: TextStyle(
                              fontSize: 11.5,
                              color: device.isReachable
                                  ? const Color(0xFF00C853)
                                  : const Color(0xFFFF5252),
                            ),
                          ),
                          if (device.model != null) ...[
                            Text(
                              '  ·  ',
                              style: TextStyle(
                                  color:
                                      Colors.white.withValues(alpha: 0.25)),
                            ),
                            Text(
                              device.model!,
                              style: TextStyle(
                                fontSize: 11.5,
                                color:
                                    Colors.white.withValues(alpha: 0.45),
                              ),
                            ),
                          ],
                          const Spacer(),
                          if (device.isManual)
                            _SourceBadge(label: loc.luminexDetectedManual),
                          if (!device.isManual)
                            _SourceBadge(label: loc.luminexDetectedScan),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                // Badge alarmes + chevron
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (hasAlarms)
                      _AlarmBadge(count: device.alarmCount, color: alarmColor)
                    else
                      const SizedBox(height: 20),
                    const SizedBox(height: 4),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: _kAccent.withValues(alpha: 0.55),
                      size: 20,
                    ),
                  ],
                ),
                // Bouton retirer (swipe via menu contextuel = non, on fait un bouton discret)
                if (onRemove != null) ...[
                  const SizedBox(width: 4),
                  IconButton(
                    icon: Icon(Icons.close_rounded,
                        size: 18,
                        color: Colors.white.withValues(alpha: 0.22)),
                    onPressed: onRemove,
                    tooltip: loc.luminexRemoveDevice,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                        minWidth: 28, minHeight: 28),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Icône device ──────────────────────────────────────────────────────────────

class _DeviceIcon extends StatelessWidget {
  final LuminexDevice device;
  const _DeviceIcon({required this.device});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: _kAccent.withValues(alpha: device.isReachable ? 0.14 : 0.06),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            Icons.router_rounded,
            color: _kAccent.withValues(alpha: device.isReachable ? 1.0 : 0.30),
            size: 26,
          ),
        ),
        if (device.alarmCount > 0)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                color: _alarmColor(device.maxSeverity),
                shape: BoxShape.circle,
                border: Border.all(
                    color: const Color(0xFF161622), width: 1.5),
              ),
            ),
          ),
      ],
    );
  }
}

// ─── Dot statut ───────────────────────────────────────────────────────────────

class _StatusDot extends StatelessWidget {
  final bool reachable;
  const _StatusDot({required this.reachable});

  @override
  Widget build(BuildContext context) => Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(
          color: reachable
              ? const Color(0xFF00C853)
              : const Color(0xFFFF5252),
          shape: BoxShape.circle,
        ),
      );
}

// ─── Badge alarmes ────────────────────────────────────────────────────────────

class _AlarmBadge extends StatelessWidget {
  final int count;
  final Color color;
  const _AlarmBadge({required this.count, required this.color});

  @override
  Widget build(BuildContext context) => Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.35)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.warning_rounded, size: 11, color: color),
            const SizedBox(width: 3),
            Text(
              '$count',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
          ],
        ),
      );
}

// ─── Badge source ─────────────────────────────────────────────────────────────

class _SourceBadge extends StatelessWidget {
  final String label;
  const _SourceBadge({required this.label});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 9.5,
            color: Colors.white.withValues(alpha: 0.35),
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}

// ─── Utilitaire couleur alarme ────────────────────────────────────────────────

Color _alarmColor(DiagnosticSeverity severity) => switch (severity) {
      DiagnosticSeverity.critical => const Color(0xFFFF5252),
      DiagnosticSeverity.warning => const Color(0xFFFFB300),
      DiagnosticSeverity.info => const Color(0xFF00E5FF),
    };

String _alarmLabel(LuminexAlarm alarm, AppLocalizations loc) =>
    switch (alarm.type) {
      LuminexAlarmType.inaccessible => loc.luminexAlarmInaccessible,
      LuminexAlarmType.portDown =>
        loc.luminexAlarmPortDown(alarm.portNr ?? 0),
      LuminexAlarmType.speedDegraded => loc.luminexAlarmSpeedDegraded(
          alarm.portNr ?? 0,
          (alarm.params['speed'] as int?) ?? 0,
        ),
      LuminexAlarmType.highRxErrors => loc.luminexAlarmHighRxErrors(
          alarm.portNr ?? 0,
          (alarm.params['count'] as int?) ?? 0,
        ),
      LuminexAlarmType.highTxErrors => loc.luminexAlarmHighTxErrors(
          alarm.portNr ?? 0,
          (alarm.params['count'] as int?) ?? 0,
        ),
      LuminexAlarmType.poeFault =>
        loc.luminexAlarmPoeFault(alarm.portNr ?? 0),
      LuminexAlarmType.highTemp =>
        loc.luminexAlarmHighTemp(alarm.params['temp'] as String? ?? '?'),
      LuminexAlarmType.psuAbsent => loc.luminexAlarmPsuAbsent,
    };

// Export du helper pour la page détail
String luminexAlarmLabel(LuminexAlarm alarm, AppLocalizations loc) =>
    _alarmLabel(alarm, loc);
