import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../about/about_favorites.dart';

const _kAccent = Color(0xFF9C27B0);

class _Band {
  final String name;
  final String freqRange;
  final String usage;
  final bool dfsRequired;
  final bool indoorOnly;
  final bool availableFR;
  final List<_Ch5> channels;
  final Color color;

  const _Band({
    required this.name,
    required this.freqRange,
    required this.usage,
    required this.dfsRequired,
    required this.indoorOnly,
    required this.availableFR,
    required this.channels,
    required this.color,
  });
}

class _Ch5 {
  final int number;
  final int centerMhz;
  const _Ch5(this.number, this.centerMhz);
}

final _bands = [
  _Band(
    name: 'UNII-1',
    freqRange: '5150–5250 MHz',
    usage: 'Indoor uniquement, pas de DFS requis. Maximum 200 mW PIRE.',
    dfsRequired: false,
    indoorOnly: true,
    availableFR: true,
    color: Colors.greenAccent,
    channels: const [
      _Ch5(36, 5180), _Ch5(40, 5200), _Ch5(44, 5220), _Ch5(48, 5240),
    ],
  ),
  _Band(
    name: 'UNII-2A',
    freqRange: '5250–5350 MHz',
    usage: 'DFS obligatoire (radar). Indoor principalement. 200 mW PIRE.',
    dfsRequired: true,
    indoorOnly: true,
    availableFR: true,
    color: Colors.orangeAccent,
    channels: const [
      _Ch5(52, 5260), _Ch5(56, 5280), _Ch5(60, 5300), _Ch5(64, 5320),
    ],
  ),
  _Band(
    name: 'UNII-2C',
    freqRange: '5470–5725 MHz',
    usage: 'DFS obligatoire. Indoor + outdoor possible. 1 W PIRE.',
    dfsRequired: true,
    indoorOnly: false,
    availableFR: true,
    color: Colors.blueAccent,
    channels: const [
      _Ch5(100, 5500), _Ch5(104, 5520), _Ch5(108, 5540), _Ch5(112, 5560),
      _Ch5(116, 5580), _Ch5(120, 5600), _Ch5(124, 5620), _Ch5(128, 5640),
      _Ch5(132, 5660), _Ch5(136, 5680), _Ch5(140, 5700),
    ],
  ),
  _Band(
    name: 'UNII-3',
    freqRange: '5725–5850 MHz',
    usage: 'Non autorisé pour WiFi en France et dans l\'UE.',
    dfsRequired: false,
    indoorOnly: false,
    availableFR: false,
    color: Colors.redAccent,
    channels: const [
      _Ch5(149, 5745), _Ch5(153, 5765), _Ch5(157, 5785),
      _Ch5(161, 5805), _Ch5(165, 5825),
    ],
  ),
];

class RfWifi5Page extends StatefulWidget {
  const RfWifi5Page({super.key});

  @override
  State<RfWifi5Page> createState() => _RfWifi5PageState();
}

class _RfWifi5PageState extends State<RfWifi5Page> {
  int _expandedBand = 0;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.rfWifi5PageTitle,
            style: const TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: const [
          AboutPinButton(pageId: 'tool:rf_wifi_5', sectionId: 'main'),
          SizedBox(width: 4),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      body: SafeArea(
        bottom: true,
        child: ListView(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 24 + bottom),
          children: [
            // ── Résumé ────────────────────────────────────────────────────────
            _Card(
              icon: Icons.info_outline_rounded,
              title: loc.rfWifi5RegulationTitle,
              child: Column(
                children: [
                  _InfoRow(
                    label: loc.rfWifi5BandsAvailable,
                    value: '3 / 4',
                    accent: Colors.greenAccent,
                  ),
                  const SizedBox(height: 8),
                  _InfoRow(
                    label: loc.rfWifi5Unii3Forbidden,
                    value: loc.rfWifi5ForbiddenLabel,
                    accent: Colors.redAccent,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent.withValues(alpha: 0.07),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.orangeAccent.withValues(alpha: 0.25)),
                    ),
                    child: Text(
                      loc.rfWifi5DfsNote,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.65),
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ��─ Largeurs de canal ─────────────────────────────────────────────
            _Card(
              icon: Icons.open_in_full_rounded,
              title: loc.rfWifi5ChannelWidthsTitle,
              child: Column(
                children: [
                  _BwRow(bw: '20 MHz', comment: loc.rfWifi5Bw20),
                  _BwRow(bw: '40 MHz', comment: loc.rfWifi5Bw40),
                  _BwRow(bw: '80 MHz', comment: loc.rfWifi5Bw80),
                  _BwRow(bw: '160 MHz', comment: loc.rfWifi5Bw160),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Bandes détaillées ─────────────────────────────────────────────
            ..._bands.asMap().entries.map((entry) {
              final i = entry.key;
              final band = entry.value;
              final expanded = _expandedBand == i;

              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _BandCard(
                  band: band,
                  expanded: expanded,
                  onTap: () => setState(
                      () => _expandedBand = expanded ? -1 : i),
                ),
              );
            }),
            const SizedBox(height: 4),

            // ── Non-overlapping 80 MHz ────────────────────────────���───────────
            _Card(
              icon: Icons.check_circle_outline_rounded,
              title: loc.rfWifi5NonOverlapTitle,
              child: Column(
                children: [
                  Text(
                    loc.rfWifi5NonOverlapFor3,
                    style: TextStyle(
                        fontSize: 12.5,
                        color: Colors.white.withValues(alpha: 0.60)),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _ChanChip(label: '36–48', color: Colors.greenAccent),
                      const SizedBox(width: 8),
                      _ChanChip(label: '52–64', color: Colors.orangeAccent),
                      const SizedBox(width: 8),
                      _ChanChip(label: '100–112', color: Colors.blueAccent),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    loc.rfWifi5MaxNetworks,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.45),
                        height: 1.4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BandCard extends StatelessWidget {
  final _Band band;
  final bool expanded;
  final VoidCallback onTap;

  const _BandCard(
      {required this.band, required this.expanded, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final color = band.availableFR ? band.color : Colors.redAccent;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: expanded ? color.withValues(alpha: 0.35) : Colors.white.withValues(alpha: 0.07),
          width: expanded ? 1.5 : 1,
        ),
      ),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 36,
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.70),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              band.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                                color: color,
                              ),
                            ),
                            const SizedBox(width: 8),
                            if (!band.availableFR)
                              _SmallBadge(label: AppLocalizations.of(context).rfWifi5ForbiddenFR, color: Colors.redAccent),
                            if (band.dfsRequired)
                              const _SmallBadge(label: 'DFS', color: Colors.orangeAccent),
                            if (band.indoorOnly)
                              _SmallBadge(label: AppLocalizations.of(context).rfWifi5Indoor, color: Colors.white38),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          band.freqRange,
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 12,
                            color: Colors.white.withValues(alpha: 0.55),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    expanded ? Icons.expand_less_rounded : Icons.expand_more_rounded,
                    color: Colors.white38,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          if (expanded) ...[
            Divider(height: 1, color: Colors.white.withValues(alpha: 0.07)),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    band.usage,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withValues(alpha: 0.65),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppLocalizations.of(context).rfWifi5ChannelsMhz,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withValues(alpha: 0.40),
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: band.channels.map((ch) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: band.availableFR
                              ? color.withValues(alpha: 0.12)
                              : Colors.redAccent.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: band.availableFR
                                ? color.withValues(alpha: 0.35)
                                : Colors.redAccent.withValues(alpha: 0.25),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Ch ${ch.number}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color: band.availableFR ? color : Colors.redAccent,
                              ),
                            ),
                            Text(
                              '${ch.centerMhz}',
                              style: TextStyle(
                                fontFamily: 'monospace',
                                fontSize: 10,
                                color: Colors.white.withValues(alpha: 0.45),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
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

class _SmallBadge extends StatelessWidget {
  final String label;
  final Color color;
  const _SmallBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Text(label,
          style: TextStyle(
              fontSize: 9, fontWeight: FontWeight.w700, color: color)),
    );
  }
}

class _ChanChip extends StatelessWidget {
  final String label;
  final Color color;
  const _ChanChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Text(label,
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w800, color: color)),
    );
  }
}

class _BwRow extends StatelessWidget {
  final String bw;
  final String comment;
  const _BwRow({required this.bw, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 60,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: _kAccent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: _kAccent.withValues(alpha: 0.30)),
            ),
            alignment: Alignment.center,
            child: Text(bw,
                style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: _kAccent)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(comment,
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white.withValues(alpha: 0.65))),
          ),
        ],
      ),
    );
  }
}

// ─── Widgets partagés ─────────────────────────────────────────────────────────
class _Card extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;

  const _Card({required this.icon, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(children: [
            Icon(icon, color: Colors.white70, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(title,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.1)),
            ),
          ]),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color accent;

  const _InfoRow(
      {required this.label, required this.value, required this.accent});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF0E0E18),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(label,
                style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.65),
                    fontWeight: FontWeight.w600,
                    fontSize: 13.5)),
          ),
          Text(value,
              style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: accent)),
        ],
      ),
    );
  }
}
