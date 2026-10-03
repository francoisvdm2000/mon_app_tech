import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../models/network/luminex_alarm.dart';
import '../../models/network/luminex_device.dart';
import '../../models/network/luminex_port.dart';
import '../../models/network/network_diagnostic_alert.dart';
import '../../services/network/luminex_service.dart';
import 'luminex_monitor_page.dart' show luminexAlarmLabel;

const _kAccent = Color(0xFF00E5FF);

class LuminexDeviceDetailPage extends StatefulWidget {
  final LuminexDevice device;
  final LuminexService service;

  const LuminexDeviceDetailPage({
    super.key,
    required this.device,
    required this.service,
  });

  @override
  State<LuminexDeviceDetailPage> createState() =>
      _LuminexDeviceDetailPageState();
}

class _LuminexDeviceDetailPageState extends State<LuminexDeviceDetailPage> {
  late LuminexDevice _device;

  @override
  void initState() {
    super.initState();
    _device = widget.device;
    widget.service.stream.listen((devices) {
      if (!mounted) return;
      final updated =
          devices.where((d) => d.ip == _device.ip).firstOrNull;
      if (updated != null) setState(() => _device = updated);
    });
  }

  // ─── Formatage uptime ──────────────────────────────────────────────────────

  String _formatUptime(int? seconds) {
    if (seconds == null) return '—';
    final d = seconds ~/ 86400;
    final h = (seconds % 86400) ~/ 3600;
    final m = (seconds % 3600) ~/ 60;
    if (d > 0) return '${d}j ${h}h ${m}m';
    if (h > 0) return '${h}h ${m}m';
    return '${m}m';
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
          _device.displayName,
          style: const TextStyle(
              fontWeight: FontWeight.w800, letterSpacing: 0.2),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(
              height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
        actions: [
          IconButton(
            icon: _device.isPolling
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: _kAccent.withValues(alpha: 0.7),
                    ),
                  )
                : Icon(Icons.refresh_rounded,
                    color: _kAccent.withValues(alpha: 0.8)),
            tooltip: loc.luminexRefreshAll,
            onPressed:
                _device.isPolling ? null : () => widget.service.forceRefresh(),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
            16, 12, 16, 24 + MediaQuery.paddingOf(context).bottom),
        children: [
          // ── Infos système ─────────────────────────────────────────────────
          _sectionLabel(loc.luminexSectionSystem),
          _InfoCard(device: _device, loc: loc, formatUptime: _formatUptime),
          const SizedBox(height: 16),

          // ── Alarmes ───────────────────────────────────────────────────────
          _sectionLabel(loc.luminexSectionAlarms),
          _AlarmsSection(device: _device, loc: loc),
          const SizedBox(height: 16),

          // ── Ports ─────────────────────────────────────────────────────────
          if (_device.ports.isNotEmpty) ...[
            _sectionLabel(loc.luminexSectionPorts),
            _PortsSection(device: _device, loc: loc),
          ],
        ],
      ),
    );
  }

  Widget _sectionLabel(String text) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 10),
        child: Row(
          children: [
            Expanded(
              child: Divider(
                  color: Colors.white.withValues(alpha: 0.10), height: 1),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                text.toUpperCase(),
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
        ),
      );
}

// ─── Carte infos système ──────────────────────────────────────────────────────

class _InfoCard extends StatelessWidget {
  final LuminexDevice device;
  final AppLocalizations loc;
  final String Function(int?) formatUptime;

  const _InfoCard({
    required this.device,
    required this.loc,
    required this.formatUptime,
  });

  @override
  Widget build(BuildContext context) {
    final rows = <_InfoRow>[
      _InfoRow(label: device.ip, value: null, isIp: true),
      if (device.model != null)
        _InfoRow(label: loc.luminexLabelModel, value: device.model!),
      if (device.firmware != null)
        _InfoRow(label: loc.luminexLabelFirmware, value: device.firmware!),
      _InfoRow(
          label: loc.luminexLabelUptime,
          value: formatUptime(device.uptimeSeconds)),
      if (device.temperatureCelsius != null)
        _InfoRow(
          label: loc.luminexLabelTemperature,
          value: '${device.temperatureCelsius!.toStringAsFixed(1)}°C',
          highlight: device.temperatureCelsius! > 70.0,
          highlightColor: const Color(0xFFFF5252),
        ),
      if (device.psuOk != null)
        _InfoRow(
          label: loc.luminexLabelPsu,
          value: device.psuOk! ? loc.luminexPsuOk : loc.luminexPsuAbsent,
          highlight: device.psuOk == false,
          highlightColor: const Color(0xFFFF5252),
        ),
      _InfoRow(
        label: loc.luminexLabelApi,
        value: switch (device.apiGen) {
          LuminexApiGen.gen1 => loc.luminexGen1,
          LuminexApiGen.gen2 => loc.luminexGen2,
          LuminexApiGen.unknown => loc.luminexGenUnknown,
        },
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        children: [
          // Statut en tête
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: _kAccent.withValues(
                        alpha: device.isReachable ? 0.14 : 0.06),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.router_rounded,
                    color: _kAccent.withValues(
                        alpha: device.isReachable ? 1.0 : 0.30),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      device.displayName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Container(
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                            color: device.isReachable
                                ? const Color(0xFF00C853)
                                : const Color(0xFFFF5252),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          device.isReachable
                              ? loc.luminexReachable
                              : loc.luminexUnreachable,
                          style: TextStyle(
                            fontSize: 12,
                            color: device.isReachable
                                ? const Color(0xFF00C853)
                                : const Color(0xFFFF5252),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
              height: 1, color: Colors.white.withValues(alpha: 0.07)),
          ...rows
              .skip(1) // skip IP row (already shown)
              .map(
                (r) => _InfoRowWidget(row: r),
              ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}

class _InfoRow {
  final String label;
  final String? value;
  final bool isIp;
  final bool highlight;
  final Color highlightColor;

  const _InfoRow({
    required this.label,
    required this.value,
    this.isIp = false,
    this.highlight = false,
    this.highlightColor = Colors.white,
  });
}

class _InfoRowWidget extends StatelessWidget {
  final _InfoRow row;
  const _InfoRowWidget({required this.row});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: Row(
          children: [
            Text(
              row.label,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.50),
                fontSize: 13,
              ),
            ),
            const Spacer(),
            Text(
              row.value ?? '—',
              style: TextStyle(
                color: row.highlight
                    ? row.highlightColor
                    : Colors.white.withValues(alpha: 0.85),
                fontSize: 13,
                fontWeight: row.highlight ? FontWeight.w700 : FontWeight.w500,
                fontFamily: row.isIp ? 'monospace' : null,
              ),
            ),
          ],
        ),
      );
}

// ─── Section alarmes ──────────────────────────────────────────────────────────

class _AlarmsSection extends StatelessWidget {
  final LuminexDevice device;
  final AppLocalizations loc;
  const _AlarmsSection({required this.device, required this.loc});

  @override
  Widget build(BuildContext context) {
    if (device.alarms.isEmpty) {
      return Container(
        decoration: BoxDecoration(
          color: const Color(0xFF161622),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(Icons.check_circle_outline_rounded,
                size: 18, color: const Color(0xFF00C853).withValues(alpha: 0.8)),
            const SizedBox(width: 10),
            Text(
              loc.luminexNoAlarms,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.55),
                fontSize: 13.5,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: Column(
        children: device.alarms
            .map(
              (alarm) => _AlarmTile(alarm: alarm, loc: loc),
            )
            .toList(),
      ),
    );
  }
}

class _AlarmTile extends StatelessWidget {
  final LuminexAlarm alarm;
  final AppLocalizations loc;
  const _AlarmTile({required this.alarm, required this.loc});

  @override
  Widget build(BuildContext context) {
    final color = switch (alarm.severity) {
      DiagnosticSeverity.critical => const Color(0xFFFF5252),
      DiagnosticSeverity.warning => const Color(0xFFFFB300),
      DiagnosticSeverity.info => const Color(0xFF00E5FF),
    };
    final icon = switch (alarm.severity) {
      DiagnosticSeverity.critical => Icons.error_rounded,
      DiagnosticSeverity.warning => Icons.warning_rounded,
      DiagnosticSeverity.info => Icons.info_rounded,
    };

    return ListTile(
      leading: Icon(icon, color: color, size: 20),
      title: Text(
        luminexAlarmLabel(alarm, loc),
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.88),
          fontSize: 13.5,
        ),
      ),
      subtitle: Text(
        _formatTime(alarm.timestamp),
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.35),
          fontSize: 11.5,
        ),
      ),
      dense: true,
    );
  }

  String _formatTime(DateTime dt) {
    final now = DateTime.now();
    final diff = now.difference(dt);
    if (diff.inMinutes < 1) return '< 1 min';
    if (diff.inHours < 1) return '${diff.inMinutes} min';
    if (diff.inDays < 1) return '${diff.inHours}h';
    return '${diff.inDays}j';
  }
}

// ─── Section ports ────────────────────────────────────────────────────────────

class _PortsSection extends StatelessWidget {
  final LuminexDevice device;
  final AppLocalizations loc;
  const _PortsSection({required this.device, required this.loc});

  @override
  Widget build(BuildContext context) {
    final ports = [...device.ports]..sort((a, b) => a.portNr.compareTo(b.portNr));

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: Column(
        children: [
          // En-tête
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              children: [
                _ColHeader('#', flex: 1),
                _ColHeader(loc.luminexSectionPorts, flex: 2),
                _ColHeader('${loc.luminexPortUp}/${loc.luminexPortDown}',
                    flex: 2, center: true),
                _ColHeader('PoE', flex: 2, center: true),
                _ColHeader('RX/TX err.', flex: 3, right: true),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.white.withValues(alpha: 0.07)),
          ...ports.map(
            (port) => _PortRow(port: port, loc: loc, device: device),
          ),
        ],
      ),
    );
  }
}

class _ColHeader extends StatelessWidget {
  final String text;
  final int flex;
  final bool center;
  final bool right;
  const _ColHeader(this.text,
      {required this.flex, this.center = false, this.right = false});

  @override
  Widget build(BuildContext context) => Expanded(
        flex: flex,
        child: Text(
          text,
          textAlign: right
              ? TextAlign.right
              : (center ? TextAlign.center : TextAlign.left),
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: Colors.white.withValues(alpha: 0.30),
            letterSpacing: 0.5,
          ),
        ),
      );
}

class _PortRow extends StatelessWidget {
  final LuminexPort port;
  final AppLocalizations loc;
  final LuminexDevice device;
  const _PortRow(
      {required this.port, required this.loc, required this.device});

  @override
  Widget build(BuildContext context) {
    final hasPortAlarm = device.alarms
        .any((a) => a.portNr == port.portNr);

    final linkColor = port.linkUp == true
        ? const Color(0xFF00C853)
        : port.linkUp == false
            ? const Color(0xFFFF5252)
            : Colors.white.withValues(alpha: 0.35);

    final linkLabel = port.linkUp == true
        ? loc.luminexPortUp
        : port.linkUp == false
            ? loc.luminexPortDown
            : loc.luminexPortUnknown;

    String poeLabel;
    Color poeColor;
    if (!port.poeSupported) {
      poeLabel = loc.luminexPortNoPoe;
      poeColor = Colors.white.withValues(alpha: 0.22);
    } else if (port.poeFault == true) {
      poeLabel = loc.luminexPortPoeFault;
      poeColor = const Color(0xFFFF5252);
    } else if (port.poeActive == true) {
      poeLabel = loc.luminexPortPoeActive;
      poeColor = const Color(0xFFFFB300);
    } else {
      poeLabel = loc.luminexPortPoeOff;
      poeColor = Colors.white.withValues(alpha: 0.35);
    }

    return Container(
      decoration: BoxDecoration(
        color: hasPortAlarm
            ? Colors.amber.withValues(alpha: 0.04)
            : Colors.transparent,
        border: Border(
          top: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          // Numéro
          Expanded(
            flex: 1,
            child: Text(
              '${port.portNr}',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.white.withValues(alpha: 0.65),
              ),
            ),
          ),
          // Vitesse
          Expanded(
            flex: 2,
            child: port.speedMbps != null
                ? Text(
                    loc.luminexPortSpeed(port.speedMbps!),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withValues(alpha: 0.65),
                    ),
                  )
                : Text(
                    loc.luminexNotAvailable,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withValues(alpha: 0.22),
                    ),
                  ),
          ),
          // Statut lien
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                linkLabel,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  color: linkColor,
                ),
              ),
            ),
          ),
          // PoE
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                poeLabel,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w600,
                  color: poeColor,
                ),
              ),
            ),
          ),
          // Erreurs RX/TX
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  loc.luminexPortRxErrors(port.rxErrors),
                  style: TextStyle(
                    fontSize: 10.5,
                    color: port.rxErrors > 0
                        ? const Color(0xFFFFB300).withValues(alpha: 0.85)
                        : Colors.white.withValues(alpha: 0.25),
                  ),
                ),
                Text(
                  loc.luminexPortTxErrors(port.txErrors),
                  style: TextStyle(
                    fontSize: 10.5,
                    color: port.txErrors > 0
                        ? const Color(0xFFFFB300).withValues(alpha: 0.85)
                        : Colors.white.withValues(alpha: 0.25),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
