import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../about/about_favorites.dart';

const _kAccent = Color(0xFF9C27B0);

class _UhfBand {
  final String name;
  final String freqRange;
  final String status;
  final Color statusColor;
  final String description;
  final String? examples;
  final bool isFreePR; // libre sans autorisation

  const _UhfBand({
    required this.name,
    required this.freqRange,
    required this.status,
    required this.statusColor,
    required this.description,
    this.examples,
    this.isFreePR = false,
  });
}

List<_UhfBand> _bands(AppLocalizations loc) => [
  _UhfBand(
    name: loc.rfUhfBand1Name,
    freqRange: '174–230 MHz',
    status: loc.rfUhfBand1Status,
    statusColor: Colors.orangeAccent,
    description: loc.rfUhfBand1Desc,
    examples: loc.rfUhfBand1Examples,
  ),
  _UhfBand(
    name: loc.rfUhfBand2Name,
    freqRange: '470–694 MHz',
    status: loc.rfUhfBand2Status,
    statusColor: const Color(0xFF9C27B0),
    description: loc.rfUhfBand2Desc,
    examples: loc.rfUhfBand2Examples,
  ),
  _UhfBand(
    name: loc.rfUhfBand3Name,
    freqRange: '694–790 MHz',
    status: loc.rfUhfBand3Status,
    statusColor: Colors.redAccent,
    description: loc.rfUhfBand3Desc,
    examples: null,
  ),
  _UhfBand(
    name: loc.rfUhfBand4Name,
    freqRange: '863–865 MHz',
    status: loc.rfUhfBand4Status,
    statusColor: Colors.greenAccent,
    description: loc.rfUhfBand4Desc,
    examples: loc.rfUhfBand4Examples,
    isFreePR: true,
  ),
  _UhfBand(
    name: loc.rfUhfBand5Name,
    freqRange: '1880–1900 MHz',
    status: loc.rfUhfBand5Status,
    statusColor: Colors.greenAccent,
    description: loc.rfUhfBand5Desc,
    examples: loc.rfUhfBand5Examples,
    isFreePR: true,
  ),
  _UhfBand(
    name: loc.rfUhfBand6Name,
    freqRange: '2400–2484 MHz',
    status: loc.rfUhfBand6Status,
    statusColor: Colors.blueAccent,
    description: loc.rfUhfBand6Desc,
    examples: loc.rfUhfBand6Examples,
    isFreePR: true,
  ),
  _UhfBand(
    name: loc.rfUhfBand7Name,
    freqRange: '5725–5850 MHz',
    status: loc.rfUhfBand7Status,
    statusColor: Colors.orangeAccent,
    description: loc.rfUhfBand7Desc,
    examples: loc.rfUhfBand7Examples,
  ),
];

class RfUhfBandsPage extends StatelessWidget {
  const RfUhfBandsPage({super.key});

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
        title: Text(loc.rfUhfBandsTitle,
            style: const TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: const [
          AboutPinButton(pageId: 'tool:rf_uhf_bands', sectionId: 'main'),
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
            // ── Vue d'ensemble ────────────────────────────────────────────────
            _Card(
              icon: Icons.bar_chart_rounded,
              title: loc.rfUhfBandsOverview,
              child: Column(
                children: [
                  _OverviewBar(
                    label: '174–470 MHz',
                    sublabel: loc.rfUhfOverviewSublabel1,
                    color: Colors.white30,
                    widthFactor: 0.15,
                  ),
                  const SizedBox(height: 6),
                  _OverviewBar(
                    label: '470–694 MHz',
                    sublabel: loc.rfUhfOverviewSublabel2,
                    color: _kAccent,
                    widthFactor: 0.55,
                  ),
                  const SizedBox(height: 6),
                  _OverviewBar(
                    label: '694–790 MHz',
                    sublabel: loc.rfUhfOverviewSublabel3,
                    color: Colors.redAccent,
                    widthFactor: 0.25,
                  ),
                  const SizedBox(height: 6),
                  _OverviewBar(
                    label: '863–865 MHz',
                    sublabel: loc.rfUhfOverviewSublabel4,
                    color: Colors.greenAccent,
                    widthFactor: 0.08,
                  ),
                  const SizedBox(height: 6),
                  _OverviewBar(
                    label: '1880–1900 MHz',
                    sublabel: loc.rfUhfOverviewSublabel5,
                    color: Colors.greenAccent,
                    widthFactor: 0.10,
                  ),
                  const SizedBox(height: 6),
                  _OverviewBar(
                    label: '2.4 GHz',
                    sublabel: loc.rfUhfOverviewSublabel6,
                    color: Colors.blueAccent,
                    widthFactor: 0.40,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _Legend(color: _kAccent, label: loc.rfLegendPro),
                      const SizedBox(width: 12),
                      _Legend(color: Colors.greenAccent, label: loc.rfLegendFree),
                      const SizedBox(width: 12),
                      _Legend(color: Colors.redAccent, label: loc.rfLegendForbidden),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Bandes détaillées ─────────────────────────────────────────────
            ..._bands(loc).map((band) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _BandTile(band: band),
                )),

            const SizedBox(height: 4),

            // ── Recommandations ───────────────────────────────────────────────
            _Card(
              icon: Icons.tips_and_updates_rounded,
              title: loc.rfUhfBandsTips,
              child: Column(
                children: [
                  _TipRow(
                    icon: Icons.star_rounded,
                    color: _kAccent,
                    text: loc.rfUhfTip1,
                  ),
                  _TipRow(
                    icon: Icons.warning_amber_rounded,
                    color: Colors.redAccent,
                    text: loc.rfUhfTip2,
                  ),
                  _TipRow(
                    icon: Icons.mic_rounded,
                    color: Colors.greenAccent,
                    text: loc.rfUhfTip3,
                  ),
                  _TipRow(
                    icon: Icons.info_outline_rounded,
                    color: Colors.blueAccent,
                    text: loc.rfUhfTip4,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Text(
              loc.rfUhfBandsSource,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                color: Colors.white.withValues(alpha: 0.28),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OverviewBar extends StatelessWidget {
  final String label;
  final String sublabel;
  final Color color;
  final double widthFactor;

  const _OverviewBar({
    required this.label,
    required this.sublabel,
    required this.color,
    required this.widthFactor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 10,
              color: Colors.white.withValues(alpha: 0.55),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FractionallySizedBox(
                widthFactor: widthFactor.clamp(0.04, 1.0),
                child: Container(
                  height: 12,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.30),
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(color: color.withValues(alpha: 0.70)),
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                sublabel,
                style: TextStyle(
                  fontSize: 10,
                  color: color.withValues(alpha: 0.80),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BandTile extends StatelessWidget {
  final _UhfBand band;
  const _BandTile({required this.band});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 4,
            height: 60,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: band.statusColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            band.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            band.freqRange,
                            style: TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 11,
                              color: Colors.white.withValues(alpha: 0.50),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: band.statusColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                            color: band.statusColor.withValues(alpha: 0.40)),
                      ),
                      child: Text(
                        band.status,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: band.statusColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  band.description,
                  style: TextStyle(
                    fontSize: 12.5,
                    color: Colors.white.withValues(alpha: 0.60),
                    height: 1.4,
                  ),
                ),
                if (band.examples != null) ...[
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.devices_rounded,
                          color: Colors.white.withValues(alpha: 0.35), size: 14),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          band.examples!,
                          style: TextStyle(
                            fontSize: 11.5,
                            color: Colors.white.withValues(alpha: 0.40),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  final Color color;
  final String label;
  const _Legend({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(2))),
        const SizedBox(width: 5),
        Text(label,
            style: TextStyle(
                fontSize: 11, color: Colors.white.withValues(alpha: 0.55))),
      ],
    );
  }
}

class _TipRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  const _TipRow({required this.icon, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text,
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white.withValues(alpha: 0.70),
                    height: 1.4)),
          ),
        ],
      ),
    );
  }
}

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
