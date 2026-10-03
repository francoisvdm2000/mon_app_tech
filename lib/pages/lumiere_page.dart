import 'package:flutter/material.dart';


import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../services/subscription_service.dart';
import 'subscription_page.dart';
import 'shared/app_grid_tile.dart';

import 'lumiere/dipswitch_page.dart';
import 'lumiere/fixtures/fixture_catalog_page.dart';
import 'lumiere/photometry_page.dart';
import 'lumiere/projection_page.dart';
import 'lumiere/patch/patch_home_page.dart';
import 'console/virtual_console_page.dart';
import 'console/ma3_params/ma3_param_calculator_page.dart';
import 'lumiere/filter_led_page.dart';
import 'lumiere/filter_correspondence_page.dart';
import 'lumiere/light_exposure_meter_page.dart';
import 'lumiere/color_temperature_filter_page.dart';

class PageLumiere extends StatefulWidget {
  const PageLumiere({super.key});
  @override
  State<PageLumiere> createState() => _PageLumiereState();
}

class _PageLumiereState extends State<PageLumiere> {
  bool _isPro = false;

  static const _kAccent = Color(0xFFFFB703); // ambre lumière

  @override
  void initState() {
    super.initState();
    _checkAccess();
  }

  Future<void> _checkAccess() async {
    final ok = await SubscriptionService.hasAccess(SubscriptionCategory.lumiere);
    if (!mounted) return;
    setState(() => _isPro = ok);
  }

  void _open(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
  }

  Future<void> _openOrSubscribe(BuildContext context, Widget page) async {
    if (_isPro) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
      return;
    }
    final ok = await SubscriptionService.hasAccess(SubscriptionCategory.lumiere);
    if (!context.mounted) return;
    if (ok) {
      setState(() => _isPro = true);
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => const SubscriptionPage(category: SubscriptionCategory.lumiere),
      ));
    }
  }

  Widget _actionCard({
    required BuildContext context,
    required String title,
    IconData? icon,
    String? imageAsset,
    required String description,
    required VoidCallback onTap,
    bool isPro = false,
    bool isFree = false,
    bool locked = false,
  }) {
    return AppGridTile(
      icon: icon,
      imageAsset: imageAsset,
      label: title,
      subtitle: description,
      accentColor: _kAccent,
      onTap: onTap,
      locked: locked,
      badge: isFree
          ? AppLocalizations.of(context).free
          : (isPro ? AppLocalizations.of(context).pro : null),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(loc.homeLightTitle)),
      body: SafeArea(
        // Encoches / bords arrondis (paysage) : marges latérales sûres.
        top: false,
        bottom: false,
        child: ListView(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 24 + MediaQuery.paddingOf(context).bottom),
        children: [
          AppSectionLabel(text: loc.lumiereFreeSection, color: _kAccent),
          AppGridView(
            children: [
              _actionCard(
                context: context,
                title: loc.lightProjectionTitle,
                icon: Icons.zoom_out_map,
                description: loc.lightProjectionDescription,
                isFree: true,
                onTap: () => _open(context, const ProjectionPage()),
              ),
              _actionCard(
                context: context,
                title: loc.lightDmxSwitchTitle,
                imageAsset: 'assets/tool_icons/icone_dmx.png',
                description: loc.lightDmxSwitchDescription,
                isFree: true,
                onTap: () => _open(context, const DipSwitchPage()),
              ),
              _actionCard(
                context: context,
                title: loc.filterCorrespondenceTitle,
                imageAsset: 'assets/tool_icons/icone_poursuite.png',
                description: loc.lumiereFilterEquivDescription,
                isFree: true,
                onTap: () => _open(context, const FilterCorrespondencePage()),
              ),
              _actionCard(
                context: context,
                title: loc.lightExposureMeterTitle,
                icon: Icons.wb_sunny_rounded,
                description: loc.lightExposureMeterDescription,
                isFree: true,
                onTap: () => _open(context, const LightExposureMeterPage()),
              ),
            ],
          ),

          const SizedBox(height: 20),
          AppSectionLabel(text: loc.lumiereProSection, color: _kAccent),
          AppGridView(
            children: [
              _actionCard(
                context: context,
                title: loc.lightPhotometryTitle,
                icon: Icons.brightness_high,
                description: loc.lightPhotometryDescription,
                isPro: true,
                locked: !_isPro,
                onTap: () => _openOrSubscribe(context, const PhotometryPage()),
              ),
              _actionCard(
                context: context,
                title: loc.lightFilterLedTitle,
                icon: Icons.palette,
                description: loc.lightFilterLedDescription,
                isPro: true,
                locked: !_isPro,
                onTap: () => _openOrSubscribe(context, const FilterLedPage()),
              ),
              _actionCard(
                context: context,
                title: loc.cctFilterTitle,
                icon: Icons.thermostat,
                description: loc.cctFilterTileDescription,
                isPro: true,
                locked: !_isPro,
                onTap: () =>
                    _openOrSubscribe(context, const ColorTemperatureFilterPage()),
              ),
              _actionCard(
                context: context,
                title: loc.lightCatalogTitle,
                icon: Icons.list_alt,
                description: loc.lightCatalogDescription,
                isPro: true,
                locked: !_isPro,
                onTap: () => _openOrSubscribe(context, const FixtureCatalogPage()),
              ),
              _actionCard(
                context: context,
                title: loc.lightPatchTitle,
                icon: Icons.account_tree,
                description: loc.lightPatchDescription,
                isPro: true,
                locked: !_isPro,
                onTap: () => _openOrSubscribe(context, const PatchHomePage()),
              ),
              _actionCard(
                context: context,
                title: loc.ma3CalcTitle,
                icon: Icons.calculate_rounded,
                description: loc.ma3CalcTileDescription,
                isPro: true,
                locked: !_isPro,
                onTap: () => _openOrSubscribe(
                    context, const Ma3ParamCalculatorPage(accent: _kAccent)),
              ),
              _actionCard(
                context: context,
                title: loc.vconsoleTitle,
                icon: Icons.equalizer_rounded,
                description: loc.vconsoleTileDescription,
                isPro: true,
                locked: !_isPro,
                onTap: () => _openOrSubscribe(context, const VirtualConsolePage()),
              ),
            ],
          ),

          const SizedBox(height: 18),
          Text(
            loc.lightDisclaimerShort,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white38, fontSize: 12),
          ),
        ],
      ),
      ),
    );
  }
}
