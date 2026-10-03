import 'package:flutter/material.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../shared/app_grid_tile.dart';
import 'timecode_converter_page.dart';
import 'timecode_math_page.dart';
import 'timecode_delay_page.dart';
import 'timecode_countdown_page.dart';

const kTimecodeAccent = Color(0xFF5E60CE);

/// Hub des outils Timecode : convertisseur de débit, addition/soustraction,
/// frame <-> ms, et compte à rebours live. Tous gratuits.
///
/// Nommé `TimecodeHubPage` (et non `TimecodePage`) car ce nom est déjà pris
/// par le petit calculateur de durée dans les outils Cinéma
/// (cinema_tools_page_full.dart) — à ne pas confondre, ce hub est plus
/// complet (débits multiples, Drop-Frame, live).
class TimecodeHubPage extends StatelessWidget {
  const TimecodeHubPage({super.key});

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
          loc.timecodeHubTitle,
          style: const TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child:
              Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      body: SafeArea(
        // Encoches / bords arrondis (paysage) : marges latérales sûres.
        top: false,
        bottom: false,
        child: ListView(
        padding: EdgeInsets.fromLTRB(
            16, 16, 16, 24 + MediaQuery.paddingOf(context).bottom),
        children: [
          AppGridView(
            children: [
              AppGridTile(
                icon: Icons.swap_horiz_rounded,
                label: loc.timecodeToolConverterLabel,
                subtitle: loc.timecodeToolConverterSubtitle,
                accentColor: kTimecodeAccent,
                badge: loc.timecodeBadgeFree,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const TimecodeConverterPage()),
                ),
              ),
              AppGridTile(
                icon: Icons.calculate_outlined,
                label: loc.timecodeToolMathLabel,
                subtitle: loc.timecodeToolMathSubtitle,
                accentColor: kTimecodeAccent,
                badge: loc.timecodeBadgeFree,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TimecodeMathPage()),
                ),
              ),
              AppGridTile(
                icon: Icons.compare_arrows_rounded,
                label: loc.timecodeToolDelayLabel,
                subtitle: loc.timecodeToolDelaySubtitle,
                accentColor: kTimecodeAccent,
                badge: loc.timecodeBadgeFree,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const TimecodeDelayPage()),
                ),
              ),
              AppGridTile(
                icon: Icons.hourglass_bottom_rounded,
                label: loc.timecodeToolCountdownLabel,
                subtitle: loc.timecodeToolCountdownSubtitle,
                accentColor: kTimecodeAccent,
                badge: loc.timecodeBadgeNew,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const TimecodeCountdownPage()),
                ),
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}
