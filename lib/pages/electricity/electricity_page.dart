// lib/pages/electricity/electricity_page.dart
import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../services/subscription_service.dart';
import '../subscription_page.dart';
import 'electricity_cable_section_page.dart';
import 'electricity_phase_power_page.dart';
import 'electricity_power_current_page.dart';
import 'electricity_ups_autonomy_page.dart';
import 'load_balancer/load_balancer_page.dart';
import 'electricity_generator_page.dart';
import 'electricity_power_factor_page.dart';
import 'widgets/electricity_tool_tile.dart';
import '../shared/app_grid_tile.dart';

class ElectricityPage extends StatefulWidget {
  const ElectricityPage({super.key});
  @override
  State<ElectricityPage> createState() => _ElectricityPageState();
}

class _ElectricityPageState extends State<ElectricityPage> {
  bool _isPro = false;

  @override
  void initState() {
    super.initState();
    _checkAccess();
  }

  Future<void> _checkAccess() async {
    final ok = await SubscriptionService.hasAccess(SubscriptionCategory.electricity);
    if (!mounted) return;
    setState(() => _isPro = ok);
  }

  Future<void> _openOrSubscribe(BuildContext context, Widget page) async {
    if (_isPro) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      return;
    }
    final ok = await SubscriptionService.hasAccess(SubscriptionCategory.electricity);
    if (!context.mounted) return;
    if (ok) {
      setState(() => _isPro = true);
      Navigator.push(context, MaterialPageRoute(builder: (_) => page));
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const SubscriptionPage(category: SubscriptionCategory.electricity),
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
                color: Color(0xFFFF9F1C),
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
      appBar: AppBar(title: Text(loc.electricityTitle)),
      body: SafeArea(
        // Encoches / bords arrondis (paysage) : marges latérales sûres.
        top: false,
        bottom: false,
        child: ListView(
        padding: EdgeInsets.fromLTRB(
            16, 16, 16, 24 + MediaQuery.paddingOf(context).bottom),
        children: [
          // ── GRATUIT ──────────────────────────────────
          _sectionLabel(context, loc.electricityFreeSection),

          const SizedBox(height: 8),

          AppGridView(
            children: [
              ElectricityToolTile(
                imageAsset: 'assets/tool_icons/icone_cables_brochages.png',
                title: loc.electricityToolCableSectionTitle,
                subtitle: loc.electricityToolCableSectionSubtitle,
                isFree: true,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ElectricityCableSectionPage(),
                  ),
                ),
              ),
              ElectricityToolTile(
                icon: Icons.battery_charging_full,
                title: loc.electricityToolUpsTitle,
                subtitle: loc.electricityToolUpsSubtitle,
                isFree: true,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ElectricityUpsAutonomyPage(),
                  ),
                ),
              ),
            ],
          ),

          // ── ABONNEMENT ───────────────────────────────
          const SizedBox(height: 20),
          _sectionLabel(context, loc.electricityProSection),
          const SizedBox(height: 8),

          AppGridView(
            children: [
              ElectricityToolTile(
                icon: Icons.bolt,
                title: loc.electricityToolPowerCurrentTitle,
                subtitle: loc.electricityToolPowerCurrentSubtitle,
                isPro: true,
                locked: !_isPro,
                onTap: () => _openOrSubscribe(context, const ElectricityPowerCurrentPage()),
              ),
              ElectricityToolTile(
                icon: Icons.electrical_services,
                title: loc.electricityToolPhasePowerTitle,
                subtitle: loc.electricityToolPhasePowerSubtitle,
                isPro: true,
                locked: !_isPro,
                onTap: () => _openOrSubscribe(context, const ElectricityPhasePowerPage()),
              ),
              ElectricityToolTile(
                icon: Icons.account_tree_outlined,
                title: loc.electricityToolLoadBalancerTitle,
                subtitle: loc.electricityToolLoadBalancerSubtitle,
                isPro: true,
                locked: !_isPro,
                onTap: () => _openOrSubscribe(context, const ElectricityLoadBalancerPage()),
              ),
              ElectricityToolTile(
                icon: Icons.electric_bolt,
                title: loc.electricityToolGeneratorTitle,
                subtitle: loc.electricityToolGeneratorSubtitle,
                isPro: true,
                locked: !_isPro,
                onTap: () => _openOrSubscribe(context, const ElectricityGeneratorPage()),
              ),
              ElectricityToolTile(
                icon: Icons.sync_alt_rounded,
                title: loc.electricityPowerFactorToolTitle,
                subtitle: loc.electricityToolPowerFactorSubtitle,
                isPro: true,
                locked: !_isPro,
                onTap: () => _openOrSubscribe(context, const ElectricityPowerFactorPage()),
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}
