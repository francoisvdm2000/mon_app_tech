import 'package:flutter/material.dart';
import '../../l10n_gen/app_localizations.dart';

import '../../services/subscription_service.dart';
import '../subscription_page.dart';
import '../lumiere/patch/patch_home_page.dart';
import '../lumiere/patch/gdtf_builder_simple_page.dart';
import 'virtual_console_page.dart';
import 'ma3_params/ma3_param_calculator_page.dart';
import '../lumiere/filter_led_page.dart';
import '../lumiere/filter_correspondence_page.dart';
import '../lumiere/color_temperature_filter_page.dart';
import '../lumiere/fixtures/fixture_catalog_page.dart';
import '../community/plugin_community_page.dart';
import '../shared/app_grid_tile.dart';

class ConsolePage extends StatefulWidget {
  const ConsolePage({super.key});
  @override
  State<ConsolePage> createState() => _ConsolePageState();
}

class _ConsolePageState extends State<ConsolePage> {
  bool _isPro = false;

  static const _kAccent = Color(0xFF4CC9F0); // bleu console DMX

  @override
  void initState() {
    super.initState();
    _checkAccess();
  }

  Future<void> _checkAccess() async {
    final ok = await SubscriptionService.hasAccess(SubscriptionCategory.console);
    if (!mounted) return;
    setState(() => _isPro = ok);
  }

  Future<void> _openOrSubscribe(BuildContext context, Widget page) async {
    if (_isPro) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
      return;
    }
    final ok = await SubscriptionService.hasAccess(SubscriptionCategory.console);
    if (!context.mounted) return;
    if (ok) {
      setState(() => _isPro = true);
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => const SubscriptionPage(category: SubscriptionCategory.console),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final locked = !_isPro;

    return Scaffold(
      appBar: AppBar(title: Text(loc.consoleTitle)),
      body: SafeArea(
        // Encoches / bords arrondis (paysage) : marges latérales sûres.
        top: false,
        bottom: false,
        child: ListView(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 24 + MediaQuery.paddingOf(context).bottom),
        children: [
          AppSectionLabel(text: loc.consoleFreeSection, color: _kAccent),
          AppGridView(
            children: [
              _freeTile(context,
                imageAsset: 'assets/tool_icons/icone_poursuite.png',
                title: loc.filterCorrespondenceTitle,
                subtitle: loc.filterCorrespondenceSubtitle,
                page: const FilterCorrespondencePage(),
              ),
              _communityTile(context),
            ],
          ),

          const SizedBox(height: 20),
          AppSectionLabel(text: loc.consoleProSection, color: _kAccent),
          AppGridView(
            children: [
              _tile(context, locked: locked,
                icon: Icons.grid_view,
                title: loc.consolePatchTitle,
                subtitle: loc.consolePatchSubtitle,
                page: const PatchHomePage(),
              ),
              _tile(context, locked: locked,
                icon: Icons.equalizer_rounded,
                title: loc.vconsoleTitle,
                subtitle: loc.vconsoleTileDescription,
                page: const VirtualConsolePage(),
              ),
              _tile(context, locked: locked,
                icon: Icons.calculate_rounded,
                title: loc.ma3CalcTitle,
                subtitle: loc.ma3CalcTileDescription,
                page: const Ma3ParamCalculatorPage(accent: _kAccent),
              ),
              _tile(context, locked: locked,
                imageAsset: 'assets/tool_icons/icone_gdtf.png',
                title: loc.consoleGdtfTitle,
                subtitle: loc.consoleGdtfSubtitle,
                page: const GdtfBuilderSimplePage(),
              ),
              _tile(context, locked: locked,
                icon: Icons.palette,
                title: loc.lightFilterLedTitle,
                subtitle: loc.lightFilterLedDescription,
                page: const FilterLedPage(),
              ),
              _tile(context, locked: locked,
                icon: Icons.thermostat,
                title: loc.cctFilterTitle,
                subtitle: loc.cctFilterTileDescription,
                page: const ColorTemperatureFilterPage(),
              ),
              _tile(context, locked: locked,
                icon: Icons.list_alt,
                title: loc.lightCatalogTitle,
                subtitle: loc.lightCatalogDescription,
                page: const FixtureCatalogPage(),
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }

  // ── Tuile PRO avec dimming/cadenas ──────────────────────────────────────────

  Widget _tile(
    BuildContext context, {
    IconData? icon,
    String? imageAsset,
    required String title,
    String? subtitle,
    required Widget page,
    bool locked = false,
  }) {
    return AppGridTile(
      icon: icon,
      imageAsset: imageAsset,
      label: title,
      subtitle: subtitle,
      accentColor: _kAccent,
      locked: locked,
      badge: AppLocalizations.of(context).pro,
      onTap: () => _openOrSubscribe(context, page),
    );
  }

  // ── Tuile GRATUIT ───────────────────────────────────────────────────────────

  Widget _freeTile(
    BuildContext context, {
    IconData? icon,
    String? imageAsset,
    required String title,
    String? subtitle,
    required Widget page,
  }) {
    return AppGridTile(
      icon: icon,
      imageAsset: imageAsset,
      label: title,
      subtitle: subtitle,
      accentColor: _kAccent,
      badge: AppLocalizations.of(context).timecodeBadgeFree,
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => page)),
    );
  }

  // ── Tuile Communauté ────────────────────────────────────────────────────────

  Widget _communityTile(BuildContext context) {
    return AppGridTile(
      icon: Icons.people_alt_rounded,
      label: AppLocalizations.of(context).pluginCommunity,
      subtitle: AppLocalizations.of(context).pluginCommunitySubtitle,
      accentColor: _kAccent,
      badge: AppLocalizations.of(context).free,
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const PluginCommunityPage()),
      ),
    );
  }
}
