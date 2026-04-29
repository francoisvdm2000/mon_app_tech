import 'package:flutter/material.dart';

import '../app/ui/widgets.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../services/subscription_service.dart';
import 'subscription_page.dart';

import 'lumiere/dipswitch_page.dart';
import 'lumiere/fixtures/fixture_catalog_page.dart';
import 'lumiere/photometry_page.dart';
import 'lumiere/projection_page.dart';
import 'lumiere/patch/patch_home_page.dart';
import 'lumiere/filter_led_page.dart';

class PageLumiere extends StatelessWidget {
  const PageLumiere({super.key});

  static const double _kActionSpacing = 12;

  void _open(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
  }

  /// Ouvre la page si abonnement Lumière (ou Pro), sinon affiche le paywall.
  Future<void> _openOrSubscribe(BuildContext context, Widget page) async {
    final hasAccess =
        await SubscriptionService.hasAccess(SubscriptionCategory.lumiere);
    if (!context.mounted) return;
    if (hasAccess) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (_) =>
            const SubscriptionPage(category: SubscriptionCategory.lumiere),
      ));
    }
  }

  Widget _actionCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required String description,
    required VoidCallback onTap,
    bool isPro = false,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: SectionCard(
        title: title,
        icon: icon,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isPro)
              Container(
                margin: const EdgeInsets.only(right: 6),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(4),
                  border:
                      Border.all(color: Colors.amber.withValues(alpha: 0.5)),
                ),
                child: const Text(
                  'PRO',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            const Icon(Icons.chevron_right, color: Colors.white70),
          ],
        ),
        child: Text(description, style: const TextStyle(color: Colors.white70)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(loc.homeLightTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          // GRATUIT
          _actionCard(
            context: context,
            title: loc.lightProjectionTitle,
            icon: Icons.zoom_out_map,
            description: loc.lightProjectionDescription,
            onTap: () => _open(context, const ProjectionPage()),
          ),
          const SizedBox(height: _kActionSpacing),
          _actionCard(
            context: context,
            title: loc.lightDmxSwitchTitle,
            icon: Icons.settings_input_component,
            description: loc.lightDmxSwitchDescription,
            onTap: () => _open(context, const DipSwitchPage()),
          ),

          // Séparateur
          const SizedBox(height: _kActionSpacing + 4),
          _sectionLabel('Abonnement Lumière'),
          const SizedBox(height: _kActionSpacing),

          // ABONNEMENT LUMIÈRE
          _actionCard(
            context: context,
            title: loc.lightPhotometryTitle,
            icon: Icons.brightness_high,
            description: loc.lightPhotometryDescription,
            isPro: true,
            onTap: () => _openOrSubscribe(context, const PhotometryPage()),
          ),
          const SizedBox(height: _kActionSpacing),
          _actionCard(
            context: context,
            title: loc.lightFilterLedTitle,
            icon: Icons.palette,
            description: loc.lightFilterLedDescription,
            isPro: true,
            onTap: () => _openOrSubscribe(context, const FilterLedPage()),
          ),
          const SizedBox(height: _kActionSpacing),
          _actionCard(
            context: context,
            title: loc.lightCatalogTitle,
            icon: Icons.list_alt,
            description: loc.lightCatalogDescription,
            isPro: true,
            onTap: () => _openOrSubscribe(context, const FixtureCatalogPage()),
          ),
          const SizedBox(height: _kActionSpacing),
          _actionCard(
            context: context,
            title: loc.lightPatchTitle,
            icon: Icons.account_tree,
            description: loc.lightPatchDescription,
            isPro: true,
            onTap: () => _openOrSubscribe(context, const PatchHomePage()),
          ),

          const SizedBox(height: 18),
          Text(
            loc.lightDisclaimerShort,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white38, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
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
}
