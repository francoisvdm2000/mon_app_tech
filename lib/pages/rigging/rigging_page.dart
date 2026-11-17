import 'package:flutter/material.dart';

import '../../l10n_gen/app_localizations.dart';
import '../../services/subscription_service.dart';
import '../subscription_page.dart';
import 'rigging_angle_factor_page.dart';
import 'rigging_bridle_2_points_page.dart';
import 'rigging_wll_check_page.dart';
import 'rigging_multi_point_page.dart';
import 'rigging_hoist_selector_page.dart';
import 'rigging_truss_load_page.dart';
import 'widgets/rigging_tool_tile.dart';
import '../shared/app_grid_tile.dart';

class RiggingPage extends StatefulWidget {
  const RiggingPage({super.key});
  @override
  State<RiggingPage> createState() => _RiggingPageState();
}

class _RiggingPageState extends State<RiggingPage> {
  bool _isPro = false;

  @override
  void initState() {
    super.initState();
    _checkAccess();
  }

  Future<void> _checkAccess() async {
    final ok = await SubscriptionService.hasAccess(SubscriptionCategory.rigging);
    if (!mounted) return;
    setState(() => _isPro = ok);
  }

  /// Ouvre la page si abonnement Rigging (ou Pro), sinon paywall.
  Future<void> _openOrSubscribe(BuildContext context, Widget page) async {
    if (_isPro) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      return;
    }
    final ok = await SubscriptionService.hasAccess(SubscriptionCategory.rigging);
    if (!context.mounted) return;
    if (ok) {
      setState(() => _isPro = true);
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
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 6),
      child: Row(
        children: [
          Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.10), height: 1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              text.toUpperCase(),
              style: const TextStyle(
                color: Color(0xFF2DC653),
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5,
              ),
            ),
          ),
          Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.10), height: 1)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(loc.riggingTitle)),
      body: SafeArea(
        // Encoches / bords arrondis (paysage) : marges latérales sûres.
        top: false,
        bottom: false,
        child: ListView(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 24 + MediaQuery.paddingOf(context).bottom),
        children: [
          // ── GRATUIT ──────────────────────────────────
          _sectionLabel(context, loc.riggingFreeSection),

          const SizedBox(height: 8),

          AppGridView(
            children: [
              RiggingToolTile(
                icon: Icons.verified_outlined,
                title: loc.riggingToolWllTitle,
                subtitle: loc.riggingToolWllSubtitle,
                isFree: true,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RiggingWllCheckPage()),
                ),
              ),
            ],
          ),

          // ── ABONNEMENT ───────────────────────────────
          const SizedBox(height: 20),
          _sectionLabel(context, loc.riggingProSection),
          const SizedBox(height: 8),

          AppGridView(
            children: [
              RiggingToolTile(
                icon: Icons.account_tree_outlined,
                title: loc.riggingToolBridleTitle,
                subtitle: loc.riggingToolBridleSubtitle,
                isPro: true,
                locked: !_isPro,
                onTap: () => _openOrSubscribe(context, const RiggingBridle2PointsPage()),
              ),
              RiggingToolTile(
                icon: Icons.call_split_outlined,
                title: loc.riggingToolAngleFactorTitle,
                subtitle: loc.riggingToolAngleFactorSubtitle,
                isPro: true,
                locked: !_isPro,
                onTap: () => _openOrSubscribe(context, const RiggingAngleFactorPage()),
              ),
              RiggingToolTile(
                icon: Icons.share_outlined,
                title: loc.riggingToolMultiPointTitle,
                subtitle: loc.riggingToolMultiPointSubtitle,
                isPro: true,
                locked: !_isPro,
                onTap: () => _openOrSubscribe(context, const RiggingMultiPointPage()),
              ),
              RiggingToolTile(
                icon: Icons.build_circle_outlined,
                title: loc.riggingToolHoistTitle,
                subtitle: loc.riggingToolHoistSubtitle,
                isPro: true,
                locked: !_isPro,
                onTap: () => _openOrSubscribe(context, const RiggingHoistSelectorPage()),
              ),
              RiggingToolTile(
                icon: Icons.linear_scale,
                title: loc.riggingToolTrussLoadTitle,
                subtitle: loc.riggingToolTrussLoadSubtitle,
                isPro: true,
                locked: !_isPro,
                onTap: () => _openOrSubscribe(context, const RiggingTrussLoadPage()),
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}
