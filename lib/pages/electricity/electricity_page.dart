// lib/pages/electricity/electricity_page.dart
import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../services/subscription_service.dart';
import '../subscription_page.dart';
import 'electricity_cable_section_page.dart';
import 'electricity_phase_power_page.dart';
import 'electricity_power_current_page.dart';
import 'electricity_ups_autonomy_page.dart';
import 'widgets/electricity_tool_tile.dart';

class ElectricityPage extends StatelessWidget {
  const ElectricityPage({super.key});

  /// Ouvre la page si abonnement Electricity (ou Pro), sinon paywall.
  Future<void> _openOrSubscribe(BuildContext context, Widget page) async {
    final ok =
        await SubscriptionService.hasAccess(SubscriptionCategory.electricity);
    if (!context.mounted) return;
    if (ok) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => page));
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const SubscriptionPage(
            category: SubscriptionCategory.electricity,
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
      appBar: AppBar(title: Text(loc.electricityTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── GRATUIT ──────────────────────────────────
          _sectionLabel(context, loc.electricityFreeSection),

          const SizedBox(height: 8),

          ElectricityToolTile(
            icon: Icons.cable,
            title: loc.electricityToolCableSectionTitle,
            subtitle: loc.electricityToolCableSectionSubtitle,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ElectricityCableSectionPage(),
              ),
            ),
          ),

          const SizedBox(height: 12),

          ElectricityToolTile(
            icon: Icons.battery_charging_full,
            title: loc.electricityToolUpsTitle,
            subtitle: loc.electricityToolUpsSubtitle,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ElectricityUpsAutonomyPage(),
              ),
            ),
          ),

          // ── ABONNEMENT ───────────────────────────────
          const SizedBox(height: 20),
          _sectionLabel(context, loc.electricityProSection),
          const SizedBox(height: 8),

          ElectricityToolTile(
            icon: Icons.bolt,
            title: loc.electricityToolPowerCurrentTitle,
            subtitle: loc.electricityToolPowerCurrentSubtitle,
            isPro: true,
            onTap: () => _openOrSubscribe(
              context,
              const ElectricityPowerCurrentPage(),
            ),
          ),

          const SizedBox(height: 12),

          ElectricityToolTile(
            icon: Icons.electrical_services,
            title: loc.electricityToolPhasePowerTitle,
            subtitle: loc.electricityToolPhasePowerSubtitle,
            isPro: true,
            onTap: () => _openOrSubscribe(
              context,
              const ElectricityPhasePowerPage(),
            ),
          ),
        ],
      ),
    );
  }
}
