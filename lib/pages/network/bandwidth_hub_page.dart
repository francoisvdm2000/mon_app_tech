import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import 'broadcast_bandwidth_page.dart';
import 'snmp_ports_page.dart';

const _kBg     = Color(0xFF0D0D14);
const _kCard   = Color(0xFF161622);
const _kAccent = Color(0xFF00E5FF);

class BandwidthHubPage extends StatelessWidget {
  const BandwidthHubPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: _kBg,
      appBar: AppBar(
        backgroundColor: _kBg,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.bwHubTitle,
            style: const TextStyle(fontWeight: FontWeight.w800)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child:
              Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
            16, 16, 16, 24 + MediaQuery.paddingOf(context).bottom),
        children: [
          // ── Intro ──────────────────────────────────────────────────────────
          Container(
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
                    loc.bwHubSubtitle,
                    style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.60),
                        fontSize: 13,
                        height: 1.45),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // ── Option 1 : Broadcast ───────────────────────────────────────────
          _HubCard(
            icon: Icons.radio_button_checked_rounded,
            title: loc.bwHubCardBroadcastTitle,
            subtitle: loc.bwHubCardBroadcastSubtitle,
            tag: loc.bwHubTagFree,
            tagColor: const Color(0xFF00C853),
            note: loc.bwHubCardBroadcastLimit,
            noteIcon: Icons.warning_amber_rounded,
            noteColor: const Color(0xFFFFB300),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(
                    builder: (_) => const BroadcastBandwidthPage())),
          ),

          const SizedBox(height: 14),

          // ── Option 2 : SNMP ────────────────────────────────────────────────
          _HubCard(
            icon: Icons.device_hub_rounded,
            title: loc.bwHubCardSnmpTitle,
            subtitle: loc.bwHubCardSnmpSubtitle,
            tag: 'PRO',
            tagColor: _kAccent,
            note: loc.bwHubCardSnmpRequires,
            noteIcon: Icons.settings_ethernet_rounded,
            noteColor: _kAccent,
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SnmpPortsPage())),
          ),
        ],
      ),
    );
  }
}

// ─── Carte option ─────────────────────────────────────────────────────────────

class _HubCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String tag;
  final Color tagColor;
  final String note;
  final IconData noteIcon;
  final Color noteColor;
  final VoidCallback onTap;

  const _HubCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.tagColor,
    required this.note,
    required this.noteIcon,
    required this.noteColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: _kCard,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: onTap,
            splashColor: _kAccent.withValues(alpha: 0.08),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: tagColor.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Icon(icon, color: tagColor, size: 24),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(title,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white)),
                                const SizedBox(width: 8),
                                _Tag(label: tag, color: tagColor),
                              ],
                            ),
                            const SizedBox(height: 3),
                            Text(subtitle,
                                style: TextStyle(
                                    fontSize: 13,
                                    color:
                                        Colors.white.withValues(alpha: 0.45))),
                          ],
                        ),
                      ),
                      Icon(Icons.chevron_right_rounded,
                          color: _kAccent.withValues(alpha: 0.50), size: 22),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: noteColor.withValues(alpha: 0.06),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: noteColor.withValues(alpha: 0.15)),
                    ),
                    child: Row(
                      children: [
                        Icon(noteIcon,
                            size: 14,
                            color: noteColor.withValues(alpha: 0.75)),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(note,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: noteColor.withValues(alpha: 0.80),
                                  height: 1.35)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class _Tag extends StatelessWidget {
  final String label;
  final Color color;
  const _Tag({required this.label, required this.color});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: color.withValues(alpha: 0.28)),
        ),
        child: Text(label,
            style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w800,
                color: color,
                letterSpacing: 0.6)),
      );
}
