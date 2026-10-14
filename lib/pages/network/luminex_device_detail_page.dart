import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../models/network/luminex_alarm.dart';
import '../../models/network/luminex_device.dart';
import '../../models/network/luminex_group.dart';
import '../../models/network/luminex_port.dart';
import '../../models/network/network_diagnostic_alert.dart';
import '../../services/network/luminex_service.dart';
import 'luminex_backup_page.dart';
import 'luminex_config_actions.dart';
import 'luminex_group_traffic_card.dart';
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
  StreamSubscription<List<LuminexDevice>>? _subscription;

  /// Mode configuration : désactivé par défaut, pour éviter toute
  /// modification accidentelle pendant un show.
  bool _configMode = false;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _device = widget.device;
    _subscription = widget.service.stream.listen((devices) {
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
    final traffic = LuminexGroupTraffic.compute([_device]);

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
            icon: Icon(
              _configMode ? Icons.lock_open_rounded : Icons.lock_rounded,
              color: _configMode
                  ? const Color(0xFFFFB300)
                  : Colors.white.withValues(alpha: 0.45),
            ),
            tooltip: loc.luminexCfgMode,
            onPressed: () => setState(() => _configMode = !_configMode),
          ),
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
          // ── Mode configuration ────────────────────────────────────────────
          if (_configMode) ...[
            _ConfigBanner(text: loc.luminexCfgModeBanner),
            const SizedBox(height: 12),
          ],

          // ── Infos système ─────────────────────────────────────────────────
          _sectionLabel(loc.luminexSectionSystem),
          _InfoCard(device: _device, loc: loc, formatUptime: _formatUptime),
          const SizedBox(height: 10),
          _ToolsRow(
            children: [
              _ToolButton(
                icon: Icons.highlight_rounded,
                label: loc.luminexCfgIdentifySwitch,
                onTap: _device.isReachable
                    ? () => identifyLuminexSwitch(
                        context, widget.service, _device, loc)
                    : null,
              ),
              _ToolButton(
                icon: Icons.inventory_2_rounded,
                label: loc.luminexBackupTitle,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LuminexBackupPage(
                      service: widget.service,
                      ip: _device.ip,
                    ),
                  ),
                ),
              ),
              if (_configMode)
                _ToolButton(
                  icon: Icons.edit_rounded,
                  label: loc.luminexCfgRenameSwitch,
                  onTap: _device.isReachable
                      ? () => renameLuminexSwitch(
                          context, widget.service, _device, loc)
                      : null,
                ),
            ],
          ),
          const SizedBox(height: 16),

          // ── Alarmes ───────────────────────────────────────────────────────
          _sectionLabel(loc.luminexSectionAlarms),
          _AlarmsSection(device: _device, loc: loc),
          const SizedBox(height: 16),

          // ── Trafic par groupe ─────────────────────────────────────────────
          if (traffic.isNotEmpty) ...[
            _sectionLabel(loc.luminexSectionGroupTraffic),
            LuminexGroupTrafficCard(traffic: traffic, loc: loc),
            const SizedBox(height: 16),
          ],

          // ── Ports ─────────────────────────────────────────────────────────
          if (_device.ports.isNotEmpty) ...[
            _sectionLabel(loc.luminexSectionPorts),
            _PortsSection(
              device: _device,
              loc: loc,
              onPortTap: _configMode && _device.isReachable
                  ? (port) => showLuminexPortActions(
                        context,
                        service: widget.service,
                        device: _device,
                        port: port,
                        loc: loc,
                      )
                  : null,
            ),
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
          highlight: device.isTemperatureHigh,
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

  /// Mode configuration : appui sur un port → actions. Null = lecture seule.
  final void Function(LuminexPort port)? onPortTap;

  const _PortsSection({
    required this.device,
    required this.loc,
    this.onPortTap,
  });

  @override
  Widget build(BuildContext context) {
    final ports = [...device.ports]
      ..sort((a, b) => a.portNr.compareTo(b.portNr));
    final sep = luminexDecimalSeparator(context);

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          for (var i = 0; i < ports.length; i++)
            _PortRow(
              port: ports[i],
              loc: loc,
              device: device,
              decimalSeparator: sep,
              showDivider: i > 0,
              onTap: onPortTap == null ? null : () => onPortTap!(ports[i]),
            ),
        ],
      ),
    );
  }
}

class _PortRow extends StatelessWidget {
  final LuminexPort port;
  final AppLocalizations loc;
  final LuminexDevice device;
  final String decimalSeparator;
  final bool showDivider;
  final VoidCallback? onTap;

  const _PortRow({
    required this.port,
    required this.loc,
    required this.device,
    required this.decimalSeparator,
    required this.showDivider,
    this.onTap,
  });

  String _speedLabel(int mbps) {
    if (mbps < 1000) return loc.luminexPortSpeed(mbps);
    final gbps = mbps / 1000;
    final text = gbps == gbps.roundToDouble()
        ? gbps.toInt().toString()
        : gbps.toStringAsFixed(1).replaceAll('.', decimalSeparator);
    return '$text Gb/s';
  }

  @override
  Widget build(BuildContext context) {
    final hasPortAlarm = device.alarms.any((a) => a.portNr == port.portNr);
    final group = device.groupById(port.groupId);
    final trunkId = port.trunkId;
    final trunkName =
        trunkId != null ? (device.trunkNames[trunkId] ?? 'ISL') : null;

    final groupColorValue = group?.colorValue;
    final tagColor = groupColorValue != null
        ? Color(groupColorValue)
        : trunkName != null
            ? const Color(0xFF999999)
            : _kAccent;

    final linkUp = port.linkUp;
    final linkColor = linkUp == true
        ? const Color(0xFF00C853)
        : linkUp == false
            ? const Color(0xFFFF5252)
            : Colors.white.withValues(alpha: 0.35);
    final linkLabel = linkUp == true
        ? loc.luminexPortUp
        : linkUp == false
            ? loc.luminexPortDown
            : loc.luminexPortUnknown;

    // Titre : légende du port, sinon l'appareil vu en LLDP.
    final legend = port.name;
    final neighbor = port.neighborName ?? port.neighborIp;
    final title = legend ?? neighbor ?? '—';

    // Sous-titre : vitesse · groupe/trunk · voisin · SFP
    final speed = port.speedMbps;
    final details = <String>[
      if (linkUp == true && speed != null) _speedLabel(speed) else linkLabel,
      if (group != null) group.name else if (trunkName != null) trunkName,
      if (legend != null && neighbor != null) '→ $neighbor',
      if (port.isSfp) 'SFP',
      if (port.enabled == false) loc.luminexOff,
    ];

    // PoE (seulement s'il se passe quelque chose sur le port)
    String? poeLabel;
    Color poeColor = const Color(0xFFFFB300);
    if (port.poeSupported && port.poeFault == true) {
      poeLabel = loc.luminexPortPoeFault;
      poeColor = const Color(0xFFFF5252);
    } else if (port.poeSupported && port.poeActive == true) {
      final mw = port.poePowerMw;
      poeLabel = mw != null && mw > 0
          ? '${loc.luminexPortPoeActive} · '
              '${(mw / 1000).toStringAsFixed(1).replaceAll('.', decimalSeparator)} W'
          : loc.luminexPortPoeActive;
    }

    final hasErrors = port.rxErrors > 0 || port.txErrors > 0;
    final rxBps = port.rxBps;
    final txBps = port.txBps;
    final showRates = linkUp == true && (rxBps != null || txBps != null);
    final dimmed = linkUp == false;

    final row = Container(
      decoration: BoxDecoration(
        color: hasPortAlarm
            ? Colors.amber.withValues(alpha: 0.05)
            : Colors.transparent,
        border: showDivider
            ? Border(
                top: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
              )
            : null,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      child: Opacity(
        opacity: dimmed ? 0.55 : 1.0,
        child: Row(
          children: [
            // Numéro, teinté de la couleur du groupe
            Container(
              width: 34,
              height: 34,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: tagColor.withValues(alpha: 0.16),
                borderRadius: BorderRadius.circular(9),
                border: Border.all(color: tagColor.withValues(alpha: 0.55)),
              ),
              child: Text(
                '${port.portNr}',
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Légende + détails
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withValues(alpha: 0.92),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    details.join('  ·  '),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11.5,
                      color: Colors.white.withValues(alpha: 0.45),
                    ),
                  ),
                  if (poeLabel != null || hasErrors) ...[
                    const SizedBox(height: 2),
                    Text(
                      [
                        if (poeLabel != null) poeLabel,
                        if (hasErrors) ...[
                          loc.luminexPortRxErrors(port.rxErrors),
                          loc.luminexPortTxErrors(port.txErrors),
                        ],
                      ].join('  ·  '),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: poeLabel != null && !hasErrors
                            ? poeColor
                            : const Color(0xFFFFB300),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Débits ou état du lien
            if (showRates)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _PortRate(
                    icon: Icons.arrow_upward_rounded,
                    value: formatBitRate(rxBps ?? 0,
                        decimalSeparator: decimalSeparator),
                  ),
                  const SizedBox(height: 2),
                  _PortRate(
                    icon: Icons.arrow_downward_rounded,
                    value: formatBitRate(txBps ?? 0,
                        decimalSeparator: decimalSeparator),
                  ),
                ],
              )
            else
              Text(
                linkLabel,
                style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  color: linkColor,
                ),
              ),
          ],
        ),
      ),
    );

    final tap = onTap;
    if (tap == null) return row;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: tap,
        splashColor: _kAccent.withValues(alpha: 0.08),
        child: row,
      ),
    );
  }
}

/// Débit d'un port. ↑ = envoyé par l'appareil branché (RX du switch),
/// ↓ = délivré à l'appareil (TX du switch), comme dans « Trafic par groupe ».
class _PortRate extends StatelessWidget {
  final IconData icon;
  final String value;
  const _PortRate({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 11, color: Colors.white.withValues(alpha: 0.40)),
          const SizedBox(width: 3),
          Text(
            value,
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
              color: Colors.white.withValues(alpha: 0.80),
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        ],
      );
}

// ─── Mode configuration ───────────────────────────────────────────────────────

class _ConfigBanner extends StatelessWidget {
  final String text;
  const _ConfigBanner({required this.text});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFFFB300).withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
              color: const Color(0xFFFFB300).withValues(alpha: 0.45)),
        ),
        child: Row(
          children: [
            const Icon(Icons.lock_open_rounded,
                color: Color(0xFFFFB300), size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Color(0xFFFFB300),
                  fontSize: 12.5,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      );
}

class _ToolsRow extends StatelessWidget {
  final List<Widget> children;
  const _ToolsRow({required this.children});

  @override
  Widget build(BuildContext context) =>
      Wrap(spacing: 8, runSpacing: 8, children: children);
}

class _ToolButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _ToolButton({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) => OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          foregroundColor: _kAccent,
          disabledForegroundColor: Colors.white.withValues(alpha: 0.25),
          side: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        ),
        onPressed: onTap,
        icon: Icon(icon, size: 18),
        label: Text(label, style: const TextStyle(fontSize: 12.5)),
      );
}
