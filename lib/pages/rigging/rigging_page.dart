import 'package:flutter/material.dart';

import '../../l10n_gen/app_localizations.dart';
import '../../services/subscription_service.dart';
import '../subscription_page.dart';
import 'rigging_angle_factor_page.dart';
import 'rigging_bridle_2_points_page.dart';
import 'rigging_wll_check_page.dart';
import 'widgets/rigging_tool_tile.dart';

class RiggingPage extends StatelessWidget {
  const RiggingPage({super.key});

  /// Ouvre la page si abonnement Rigging (ou Pro), sinon paywall.
  Future<void> _openOrSubscribe(BuildContext context, Widget page) async {
    final ok =
        await SubscriptionService.hasAccess(SubscriptionCategory.rigging);
    if (!context.mounted) return;
    if (ok) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => page));
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const SubscriptionPage(
            category: SubscriptionCategory.rigging,
          ),
        ),
      );
    }
  }

  Widget _sectionLabel(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 4),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          color: Colors.white38,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(loc.riggingTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── GRATUIT ──────────────────────────────────
          _sectionLabel(context, loc.riggingFreeSection),

          const SizedBox(height: 8),

          RiggingToolTile(
            icon: Icons.verified_outlined,
            title: loc.riggingToolWllTitle,
            subtitle: loc.riggingToolWllSubtitle,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const RiggingWllCheckPage(),
              ),
            ),
          ),

          // ── ABONNEMENT ───────────────────────────────
          const SizedBox(height: 20),
          _sectionLabel(context, loc.riggingProSection),
          const SizedBox(height: 8),

          RiggingToolTile(
            icon: Icons.account_tree_outlined,
            title: loc.riggingToolBridleTitle,
            subtitle: loc.riggingToolBridleSubtitle,
            isPro: true,
            onTap: () => _openOrSubscribe(
              context,
              const RiggingBridle2PointsPage(),
            ),
          ),

          const SizedBox(height: 12),

          RiggingToolTile(
            icon: Icons.call_split_outlined,
            title: loc.riggingToolAngleFactorTitle,
            subtitle: loc.riggingToolAngleFactorSubtitle,
            isPro: true,
            onTap: () => _openOrSubscribe(
              context,
              const RiggingAngleFactorPage(),
            ),
          ),
        ],
      ),
    );
  }
}
