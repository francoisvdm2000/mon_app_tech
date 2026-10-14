import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../models/network/manet_node.dart';
import '../../services/network/manet_service.dart';
import '../about/about_favorites.dart';
import 'widgets/network_limits_card.dart';

const _kAccent = Color(0xFF00E5FF);
const _kBg = Color(0xFF0D0D14);
const _kCard = Color(0xFF161622);
const _kGreen = Color(0xFF00E676);
const _kPurple = Color(0xFF7C4DFF);

class MaNetMonitorPage extends StatefulWidget {
  const MaNetMonitorPage({super.key});

  @override
  State<MaNetMonitorPage> createState() => _MaNetMonitorPageState();
}

class _MaNetMonitorPageState extends State<MaNetMonitorPage> {
  late final MaNetService _service;
  List<MaNetNode> _nodes = [];

  @override
  void initState() {
    super.initState();
    _service = MaNetService();
    _service.start();
    _service.stream.listen((nodes) {
      if (mounted) setState(() => _nodes = nodes);
    });
  }

  @override
  void dispose() {
    _service.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final onlineCount = _nodes.where((n) => n.isOnline).length;

    return Scaffold(
      backgroundColor: _kBg,
      appBar: AppBar(
        backgroundColor: _kBg,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          loc.manetPageTitle,
          style: const TextStyle(
              fontWeight: FontWeight.w800, letterSpacing: 0.2),
        ),
        actions: const [
          AboutPinButton(pageId: 'tool:network_manet_monitor', sectionId: 'main'),
          SizedBox(width: 4),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child:
              Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      body: Column(
        children: [
          _StatusBar(onlineCount: onlineCount, loc: loc),
          Expanded(
            child: _nodes.isEmpty
                ? _EmptyState(loc: loc)
                : ListView.separated(
                    padding: EdgeInsets.fromLTRB(
                        16,
                        12,
                        16,
                        24 + MediaQuery.paddingOf(context).bottom),
                    itemCount: _nodes.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (_, i) =>
                        _NodeCard(node: _nodes[i], loc: loc),
                  ),
          ),
        ],
      ),
    );
  }
}

// ─── Barre de statut ─────────────────────────────────────────────────────────

class _StatusBar extends StatelessWidget {
  final int onlineCount;
  final AppLocalizations loc;
  const _StatusBar({required this.onlineCount, required this.loc});

  @override
  Widget build(BuildContext context) => Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.white.withValues(alpha: 0.07))),
        ),
        child: Row(
          children: [
            const _PulseDot(),
            const SizedBox(width: 10),
            Text(
              loc.manetListening,
              style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.50),
                  fontSize: 13),
            ),
            const Spacer(),
            if (onlineCount > 0)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: _kAccent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: _kAccent.withValues(alpha: 0.25)),
                ),
                child: Text(
                  loc.manetNodeCount(onlineCount),
                  style: TextStyle(
                      color: _kAccent,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
              ),
          ],
        ),
      );
}

// ─── Dot animé ───────────────────────────────────────────────────────────────

class _PulseDot extends StatefulWidget {
  const _PulseDot();

  @override
  State<_PulseDot> createState() => _PulseDotState();
}

class _PulseDotState extends State<_PulseDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _anim,
        builder: (_, __) => Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _kAccent.withValues(alpha: 0.5 + _anim.value * 0.5),
            boxShadow: [
              BoxShadow(
                color: _kAccent.withValues(alpha: _anim.value * 0.45),
                blurRadius: 6,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
      );
}

// ─── Empty state ─────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  final AppLocalizations loc;
  const _EmptyState({required this.loc});

  @override
  Widget build(BuildContext context) => Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.wifi_tethering_rounded,
                  size: 64,
                  color: Colors.white.withValues(alpha: 0.10)),
              const SizedBox(height: 20),
              Text(
                loc.manetNoNodes,
                style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.55),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                loc.manetEmptyHint,
                style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.28),
                    fontSize: 13,
                    height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: Colors.white.withValues(alpha: 0.08)),
                ),
                child: Text(
                  loc.manetPortListening(MaNetService.kPort),
                  style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.28),
                      fontSize: 11,
                      fontFamily: 'monospace'),
                ),
              ),
              const SizedBox(height: 24),
              const NetworkLimitsCard(
                protocol: NetworkListenProtocol.manet,
                initiallyExpanded: true,
              ),
            ],
          ),
        ),
      );
}

// ─── Carte nœud ──────────────────────────────────────────────────────────────

class _NodeCard extends StatelessWidget {
  final MaNetNode node;
  final AppLocalizations loc;
  const _NodeCard({required this.node, required this.loc});

  @override
  Widget build(BuildContext context) {
    final iconColor = node.isOnline
        ? _kAccent
        : Colors.white.withValues(alpha: 0.22);

    return Container(
      decoration: BoxDecoration(
        color: _kCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: node.isOnline
              ? _kAccent.withValues(alpha: 0.13)
              : Colors.white.withValues(alpha: 0.06),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ───────────────────────────────────────────────
            Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: iconColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                      switch (node.deviceClass) {
                        MaDeviceClass.console => Icons.tune_rounded,
                        MaDeviceClass.processingUnit => Icons.dns_rounded,
                        MaDeviceClass.unknown => Icons.table_chart_rounded,
                      },
                      color: iconColor,
                      size: 19),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        node.displayName,
                        style: TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.white.withValues(
                              alpha: node.isOnline ? 1.0 : 0.40),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        node.ip,
                        style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.32),
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                _ProtocolBadge(protocol: node.protocol, loc: loc),
                const SizedBox(width: 8),
                _StatusDot(online: node.isOnline),
              ],
            ),

            // ── Détails ──────────────────────────────────────────────
            if (_hasDetails(node)) ...[
              const SizedBox(height: 10),
              Divider(
                  height: 1,
                  color: Colors.white.withValues(alpha: 0.06)),
              const SizedBox(height: 10),
              _DetailGrid(node: node, loc: loc),
            ],
          ],
        ),
      ),
    );
  }

  bool _hasDetails(MaNetNode n) =>
      n.nodeType != null ||
      n.sessionName != null ||
      n.firmwareVersion != null ||
      n.mac != null;
}

// ─── Grille de détails ───────────────────────────────────────────────────────

class _DetailGrid extends StatelessWidget {
  final MaNetNode node;
  final AppLocalizations loc;
  const _DetailGrid({required this.node, required this.loc});

  @override
  Widget build(BuildContext context) => Wrap(
        spacing: 20,
        runSpacing: 10,
        children: [
          if (node.nodeType != null)
            _InfoChip(label: loc.manetNodeType, value: node.nodeType!),
          if (node.sessionName != null)
            _InfoChip(label: loc.manetSession, value: node.sessionName!),
          if (node.firmwareVersion != null)
            _InfoChip(
                label: loc.manetFirmware, value: node.firmwareVersion!),
          if (node.mac != null)
            _InfoChip(label: loc.manetMac, value: node.mac!),
          _InfoChip(
              label: loc.manetLastSeen,
              value: _relativeTime(node.lastSeen)),
        ],
      );

  String _relativeTime(DateTime t) {
    final diff = DateTime.now().difference(t);
    if (diff.inSeconds < 10) return '< 10s';
    if (diff.inSeconds < 60) return '${diff.inSeconds}s';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m';
    return '${diff.inHours}h';
  }
}

class _InfoChip extends StatelessWidget {
  final String label;
  final String value;
  const _InfoChip({required this.label, required this.value});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label.toUpperCase(),
            style: TextStyle(
                color: Colors.white.withValues(alpha: 0.28),
                fontSize: 9.5,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
                color: Colors.white.withValues(alpha: 0.72),
                fontSize: 12.5,
                fontWeight: FontWeight.w500),
          ),
        ],
      );
}

// ─── Badge protocole ─────────────────────────────────────────────────────────

class _ProtocolBadge extends StatelessWidget {
  final MaNetProtocol protocol;
  final AppLocalizations loc;
  const _ProtocolBadge({required this.protocol, required this.loc});

  @override
  Widget build(BuildContext context) {
    final label = switch (protocol) {
      MaNetProtocol.maNet2 => loc.manetProtocolMaNet2,
      MaNetProtocol.maNet3 => loc.manetProtocolMaNet3,
      MaNetProtocol.unknown => loc.manetProtocol,
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: _kPurple.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: _kPurple.withValues(alpha: 0.25)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w800,
          color: _kPurple,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

// ─── Dot de statut ───────────────────────────────────────────────────────────

class _StatusDot extends StatelessWidget {
  final bool online;
  const _StatusDot({required this.online});

  @override
  Widget build(BuildContext context) => Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: online
              ? _kGreen
              : Colors.white.withValues(alpha: 0.20),
          boxShadow: online
              ? [
                  BoxShadow(
                      color: _kGreen.withValues(alpha: 0.45),
                      blurRadius: 5)
                ]
              : null,
        ),
      );
}
