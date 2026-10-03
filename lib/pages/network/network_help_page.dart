import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

const _kBg = Color(0xFF0D0D14);
const _kCard = Color(0xFF161622);
const _kAccent = Color(0xFF00E5FF);
const _kGreen = Color(0xFF00C853);
const _kPurple = Color(0xFF7C4DFF);
const _kAmber = Color(0xFFFFAB40);

class NetworkHelpPage extends StatelessWidget {
  const NetworkHelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    // Définition des 9 outils
    final tools = [
      _ToolDef(
        icon: Icons.radar_rounded,
        titleKey: loc.networkScanCardTitle,
        color: _kGreen,
        isFree: true,
        does: loc.helpToolScanDoes,
        delay: loc.helpToolScanDelay,
        limits: loc.helpToolScanLimits,
        tip: loc.helpToolScanTip,
      ),
      _ToolDef(
        icon: Icons.dashboard_rounded,
        titleKey: loc.dashboardCardTitle,
        color: _kAccent,
        does: loc.helpToolDashboardDoes,
        delay: loc.helpToolDashboardDelay,
        limits: loc.helpToolDashboardLimits,
        tip: loc.helpToolDashboardTip,
      ),
      _ToolDef(
        icon: Icons.broadcast_on_personal_rounded,
        titleKey: loc.networkArtNetCardTitle,
        color: _kAccent,
        does: loc.helpToolArtNetDoes,
        delay: loc.helpToolArtNetDelay,
        limits: loc.helpToolArtNetLimits,
        tip: loc.helpToolArtNetTip,
      ),
      _ToolDef(
        icon: Icons.hub_rounded,
        titleKey: loc.networkSacnCardTitle,
        color: _kAccent,
        does: loc.helpToolSacnDoes,
        delay: loc.helpToolSacnDelay,
        limits: loc.helpToolSacnLimits,
        tip: loc.helpToolSacnTip,
      ),
      _ToolDef(
        icon: Icons.videocam_rounded,
        titleKey: loc.ndiCardTitle,
        color: _kAccent,
        does: loc.helpToolNdiDoes,
        delay: loc.helpToolNdiDelay,
        limits: loc.helpToolNdiLimits,
        tip: loc.helpToolNdiTip,
      ),
      _ToolDef(
        icon: Icons.monitor_heart_rounded,
        titleKey: loc.diagCardTitle,
        color: _kAccent,
        does: loc.helpToolDiagDoes,
        delay: loc.helpToolDiagDelay,
        limits: loc.helpToolDiagLimits,
        tip: loc.helpToolDiagTip,
      ),
      _ToolDef(
        icon: Icons.compare_arrows_rounded,
        titleKey: loc.snapshotCardTitle,
        color: _kAccent,
        does: loc.helpToolSnapshotDoes,
        delay: loc.helpToolSnapshotDelay,
        limits: loc.helpToolSnapshotLimits,
        tip: loc.helpToolSnapshotTip,
      ),
      _ToolDef(
        icon: Icons.router_rounded,
        titleKey: loc.luminexMonitorCardTitle,
        color: _kAccent,
        does: loc.helpToolLuminexDoes,
        delay: loc.helpToolLuminexDelay,
        limits: loc.helpToolLuminexLimits,
        tip: loc.helpToolLuminexTip,
      ),
      _ToolDef(
        icon: Icons.wifi_tethering_rounded,
        titleKey: loc.manetMonitorCardTitle,
        color: _kAccent,
        does: loc.helpToolManetDoes,
        delay: loc.helpToolManetDelay,
        limits: loc.helpToolManetLimits,
        tip: loc.helpToolManetTip,
      ),
    ];

    return Scaffold(
      backgroundColor: _kBg,
      appBar: AppBar(
        backgroundColor: _kBg,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          loc.helpPageTitle,
          style: const TextStyle(
              fontWeight: FontWeight.w800, letterSpacing: 0.2),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child:
              Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
            16, 12, 16, 32 + MediaQuery.paddingOf(context).bottom),
        children: [
          // ── Intro ───────────────────────────────────────────────────────
          _IntroCard(loc: loc),
          const SizedBox(height: 10),

          // ── Conseils généraux ────────────────────────────────────────────
          _GeneralTipsCard(loc: loc),
          const SizedBox(height: 20),

          // ── Outil par outil ──────────────────────────────────────────────
          ...tools.map((tool) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _ToolCard(tool: tool, loc: loc),
              )),
        ],
      ),
    );
  }
}

// ─── Modèle de données ────────────────────────────────────────────────────────

class _ToolDef {
  final IconData icon;
  final String titleKey;
  final Color color;
  final bool isFree;
  final String does;
  final String delay;
  final String limits;
  final String tip;

  const _ToolDef({
    required this.icon,
    required this.titleKey,
    required this.color,
    this.isFree = false,
    required this.does,
    required this.delay,
    required this.limits,
    required this.tip,
  });
}

// ─── Intro ───────────────────────────────────────────────────────────────────

class _IntroCard extends StatelessWidget {
  final AppLocalizations loc;
  const _IntroCard({required this.loc});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: _kAccent.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _kAccent.withValues(alpha: 0.15)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.info_outline_rounded,
                color: _kAccent.withValues(alpha: 0.7), size: 18),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                loc.helpIntro,
                style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.65),
                    fontSize: 13,
                    height: 1.5),
              ),
            ),
          ],
        ),
      );
}

// ─── Conseils généraux ───────────────────────────────────────────────────────

class _GeneralTipsCard extends StatelessWidget {
  final AppLocalizations loc;
  const _GeneralTipsCard({required this.loc});

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: _kCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 8),
              child: Row(
                children: [
                  Icon(Icons.lightbulb_outline_rounded,
                      color: _kAmber.withValues(alpha: 0.8), size: 16),
                  const SizedBox(width: 8),
                  Text(
                    loc.helpGeneralTitle.toUpperCase(),
                    style: TextStyle(
                      color: _kAmber,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.white.withValues(alpha: 0.06)),
            _GeneralTip(
              icon: Icons.lan_rounded,
              text: loc.helpGeneralSubnet,
            ),
            Divider(
                height: 1,
                indent: 42,
                color: Colors.white.withValues(alpha: 0.05)),
            _GeneralTip(
              icon: Icons.security_rounded,
              text: loc.helpGeneralFirewall,
            ),
            Divider(
                height: 1,
                indent: 42,
                color: Colors.white.withValues(alpha: 0.05)),
            _GeneralTip(
              icon: Icons.wifi_rounded,
              text: loc.helpGeneralWifi,
              isLast: true,
            ),
          ],
        ),
      );
}

class _GeneralTip extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isLast;
  const _GeneralTip(
      {required this.icon, required this.text, this.isLast = false});

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.fromLTRB(14, 10, 14, isLast ? 14 : 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 15, color: _kAmber.withValues(alpha: 0.5)),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.55),
                    fontSize: 12.5,
                    height: 1.45),
              ),
            ),
          ],
        ),
      );
}

// ─── Carte outil ─────────────────────────────────────────────────────────────

class _ToolCard extends StatefulWidget {
  final _ToolDef tool;
  final AppLocalizations loc;
  const _ToolCard({required this.tool, required this.loc});

  @override
  State<_ToolCard> createState() => _ToolCardState();
}

class _ToolCardState extends State<_ToolCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final tool = widget.tool;
    final loc = widget.loc;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: _kCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _expanded
              ? tool.color.withValues(alpha: 0.20)
              : Colors.white.withValues(alpha: 0.07),
        ),
      ),
      child: Column(
        children: [
          // ── Header (toujours visible) ─────────────────────────────────
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            borderRadius: BorderRadius.circular(16),
            splashColor: tool.color.withValues(alpha: 0.08),
            highlightColor: tool.color.withValues(alpha: 0.04),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: tool.color.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(tool.icon, color: tool.color, size: 18),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tool.titleKey,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        if (!_expanded)
                          Text(
                            tool.does,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.35),
                                fontSize: 12,
                                height: 1.3),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  _Badge(
                    label: tool.isFree ? loc.rfFreeLabel : loc.subscriptionProShort,
                    color: tool.isFree ? _kGreen : _kPurple,
                  ),
                  const SizedBox(width: 8),
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.white.withValues(alpha: 0.3),
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Corps expandable ─────────────────────────────────────────
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            crossFadeState: _expanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: const SizedBox.shrink(),
            secondChild: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                    height: 1,
                    color: Colors.white.withValues(alpha: 0.07)),
                _Section(
                  icon: Icons.check_circle_outline_rounded,
                  color: _kGreen,
                  label: loc.helpSectionDoes,
                  text: tool.does,
                ),
                _Section(
                  icon: Icons.timer_outlined,
                  color: _kAccent,
                  label: loc.helpSectionDelay,
                  text: tool.delay,
                ),
                _Section(
                  icon: Icons.block_rounded,
                  color: Colors.redAccent,
                  label: loc.helpSectionLimits,
                  text: tool.limits,
                ),
                _TipSection(label: loc.helpSectionTip, text: tool.tip),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Sections de détail ───────────────────────────────────────────────────────

class _Section extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final String text;
  const _Section({
    required this.icon,
    required this.color,
    required this.label,
    required this.text,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 14, color: color.withValues(alpha: 0.7)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label.toUpperCase(),
                    style: TextStyle(
                      color: color.withValues(alpha: 0.7),
                      fontSize: 9.5,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.8,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    text,
                    style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.62),
                        fontSize: 13,
                        height: 1.45),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class _TipSection extends StatelessWidget {
  final String label;
  final String text;
  const _TipSection({required this.label, required this.text});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
        child: Container(
          padding: const EdgeInsets.all(11),
          decoration: BoxDecoration(
            color: _kAmber.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: _kAmber.withValues(alpha: 0.15)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.lightbulb_outline_rounded,
                  size: 14, color: _kAmber.withValues(alpha: 0.7)),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label.toUpperCase(),
                      style: TextStyle(
                        color: _kAmber.withValues(alpha: 0.7),
                        fontSize: 9.5,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.8,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      text,
                      style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.62),
                          fontSize: 13,
                          height: 1.45),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

// ─── Badge ────────────────────────────────────────────────────────────────────

class _Badge extends StatelessWidget {
  final String label;
  final Color color;
  const _Badge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: color.withValues(alpha: 0.28)),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w800,
            color: color,
            letterSpacing: 0.7,
          ),
        ),
      );
}
