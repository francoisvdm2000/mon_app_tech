import 'package:flutter/material.dart';

import '../app/ui/widgets.dart';
import '../l10n/app_localizations.dart';

import 'lumiere/dipswitch_page.dart';
import 'lumiere/fixtures/fixture_catalog_page.dart';
import 'lumiere/photometry_page.dart';
import 'lumiere/projection_page.dart';
import 'lumiere/patch/patch_home_page.dart';

class PageLumiere extends StatelessWidget {
  const PageLumiere({super.key});

  static const double _kActionSpacing = 12;

  void _open(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
  }

  Widget _actionCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required String description,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: SectionCard(
        title: title,
        icon: icon,
        trailing: const Icon(Icons.chevron_right, color: Colors.white70),
        child: Text(
          description,
          style: const TextStyle(color: Colors.white70),
        ),
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
          const SizedBox(height: _kActionSpacing),
          _actionCard(
            context: context,
            title: loc.lightPhotometryTitle,
            icon: Icons.brightness_high,
            description: loc.lightPhotometryDescription,
            onTap: () => _open(context, const PhotometryPage()),
          ),
          const SizedBox(height: _kActionSpacing),
          _actionCard(
            context: context,
            title: loc.lightCatalogTitle,
            icon: Icons.list_alt,
            description: loc.lightCatalogDescription,
            onTap: () => _open(context, const FixtureCatalogPage()),
          ),
          const SizedBox(height: _kActionSpacing),
          _actionCard(
            context: context,
            title: loc.lightPatchTitle,
            icon: Icons.account_tree,
            description: loc.lightPatchDescription,
            onTap: () => _open(context, const PatchHomePage()),
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
}
