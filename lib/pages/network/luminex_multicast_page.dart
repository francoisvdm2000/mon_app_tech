import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../models/network/luminex_device.dart';
import '../../models/network/luminex_group.dart';
import '../../models/network/luminex_multicast.dart';
import '../../services/network/luminex_service.dart';

const _kAccent = Color(0xFF00E5FF);

/// Libellé d'un groupe multicast (univers sACN, MA-Net, SSDP…).
String luminexMulticastLabel(LuminexMulticastGroup g, AppLocalizations loc) =>
    switch (g.kind) {
      LuminexMulticastKind.manetAdmin => loc.luminexMulticastManetAdmin,
      LuminexMulticastKind.manetSession => loc.luminexMulticastManetSession,
      LuminexMulticastKind.sacn => loc.luminexMulticastUniverse(g.universe ?? 0),
      LuminexMulticastKind.sacnDiscovery => loc.luminexMulticastSacnDiscovery,
      LuminexMulticastKind.ssdp => 'SSDP / UPnP',
      LuminexMulticastKind.mdns => 'mDNS',
      LuminexMulticastKind.ptp => 'PTP',
      LuminexMulticastKind.sap => 'SAP (AES67)',
      LuminexMulticastKind.other => g.groupIp,
    };

/// « 1-10, 101-126, 131 » : liste d'univers compactée en plages.
String compactUniverseList(List<int> universes) {
  if (universes.isEmpty) return '';
  final sorted = universes.toSet().toList()..sort();
  final parts = <String>[];
  var start = sorted.first;
  var prev = start;
  for (final u in sorted.skip(1)) {
    if (u == prev + 1) {
      prev = u;
      continue;
    }
    parts.add(start == prev ? '$start' : '$start-$prev');
    start = prev = u;
  }
  parts.add(start == prev ? '$start' : '$start-$prev');
  return parts.join(', ');
}

// ─── Carte résumé (page Luminex) ──────────────────────────────────────────────

/// Résumé par VLAN, cliquable vers [LuminexMulticastPage].
class LuminexMulticastSummaryCard extends StatelessWidget {
  final List<LuminexMulticastVlan> vlans;
  final AppLocalizations loc;
  final VoidCallback onTap;

  const LuminexMulticastSummaryCard({
    super.key,
    required this.vlans,
    required this.loc,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          splashColor: _kAccent.withValues(alpha: 0.08),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 10, 8),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (final v in vlans)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: _VlanHeader(vlan: v, loc: loc, compact: true),
                        ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: _kAccent.withValues(alpha: 0.55),
                  size: 22,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _VlanHeader extends StatelessWidget {
  final LuminexMulticastVlan vlan;
  final AppLocalizations loc;
  final bool compact;

  const _VlanHeader({
    required this.vlan,
    required this.loc,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorValue = parseLuminexColor(vlan.colorHex);
    final color = colorValue != null ? Color(colorValue) : _kAccent;
    final universes = vlan.sacnUniverses;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${vlan.name}  ·  VLAN ${vlan.vid}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: compact ? 13.5 : 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                loc.luminexMulticastSummary(
                    vlan.groups.length, vlan.listenerCount),
                style: TextStyle(
                  fontSize: 11.5,
                  color: Colors.white.withValues(alpha: 0.45),
                ),
              ),
              if (universes.isNotEmpty) ...[
                const SizedBox(height: 2),
                Text(
                  loc.luminexMulticastSacnUniverses(
                      compactUniverseList(universes)),
                  maxLines: compact ? 1 : 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11.5,
                    color: color.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Page détail ──────────────────────────────────────────────────────────────

class LuminexMulticastPage extends StatefulWidget {
  final LuminexService service;

  const LuminexMulticastPage({super.key, required this.service});

  @override
  State<LuminexMulticastPage> createState() => _LuminexMulticastPageState();
}

class _LuminexMulticastPageState extends State<LuminexMulticastPage> {
  late List<LuminexDevice> _devices;
  StreamSubscription<List<LuminexDevice>>? _subscription;

  @override
  void initState() {
    super.initState();
    _devices = widget.service.devices;
    _subscription = widget.service.stream.listen((devices) {
      if (mounted) setState(() => _devices = devices);
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final vlans = LuminexMulticastVlan.compute(_devices);
    final polling = _devices.any((d) => d.isPolling);

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          loc.luminexSectionMulticast,
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
            icon: polling
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
            onPressed: polling ? null : () => widget.service.forceRefresh(),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
            16, 12, 16, 24 + MediaQuery.paddingOf(context).bottom),
        children: [
          Text(
            loc.luminexMulticastHint,
            style: TextStyle(
              fontSize: 12,
              height: 1.4,
              color: Colors.white.withValues(alpha: 0.45),
            ),
          ),
          const SizedBox(height: 14),
          for (final v in vlans) ...[
            _VlanCard(vlan: v, loc: loc),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}

class _VlanCard extends StatelessWidget {
  final LuminexMulticastVlan vlan;
  final AppLocalizations loc;

  const _VlanCard({required this.vlan, required this.loc});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 8),
            child: _VlanHeader(vlan: vlan, loc: loc),
          ),
          for (final g in vlan.groups) _GroupTile(group: g, loc: loc),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}

class _GroupTile extends StatelessWidget {
  final LuminexMulticastGroup group;
  final AppLocalizations loc;

  const _GroupTile({required this.group, required this.loc});

  @override
  Widget build(BuildContext context) {
    final label = luminexMulticastLabel(group, loc);
    final showIp = group.kind != LuminexMulticastKind.other;

    return Theme(
      // Pas de séparateurs automatiques de l'ExpansionTile.
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 14),
        childrenPadding: const EdgeInsets.fromLTRB(14, 0, 14, 8),
        iconColor: _kAccent,
        collapsedIconColor: Colors.white.withValues(alpha: 0.35),
        title: Text(
          label,
          style: TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w600,
            color: Colors.white.withValues(alpha: 0.90),
          ),
        ),
        subtitle: Text(
          [
            if (showIp) group.groupIp,
            loc.luminexMulticastListeners(group.listeners.length),
          ].join('  ·  '),
          style: TextStyle(
            fontSize: 11.5,
            color: Colors.white.withValues(alpha: 0.40),
          ),
        ),
        children: [
          for (final l in group.listeners) _ListenerRow(listener: l, loc: loc),
        ],
      ),
    );
  }
}

class _ListenerRow extends StatelessWidget {
  final LuminexMulticastListener listener;
  final AppLocalizations loc;

  const _ListenerRow({required this.listener, required this.loc});

  @override
  Widget build(BuildContext context) {
    final portNr = listener.portNr;
    final where = listener.isLocated && portNr != null
        ? [
            listener.switchName,
            loc.luminexMulticastPort(portNr),
            if (listener.portName != null) '(${listener.portName})',
          ].join(' ')
        : loc.luminexMulticastViaIsl;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              listener.ip,
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'monospace',
                color: Colors.white.withValues(alpha: 0.85),
              ),
            ),
          ),
          Expanded(
            child: Text(
              where,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withValues(
                    alpha: listener.isLocated ? 0.55 : 0.30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
