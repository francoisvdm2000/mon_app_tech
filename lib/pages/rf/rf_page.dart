import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../services/subscription_service.dart';
import '../subscription_page.dart';
import '../shared/app_grid_tile.dart';
import 'rf_wifi_24_page.dart';
import 'rf_wifi_5_page.dart';
import 'rf_coexistence_page.dart';
import 'rf_antenna_page.dart';
import 'rf_splitter_page.dart';
import 'rf_cable_antenna_page.dart';
import 'rf_uhf_bands_page.dart';
import 'rf_im3_page.dart';
import 'rf_planner_page.dart';
import 'rf_wifi_scan_page.dart';
import 'rf_scan_log_page.dart';

const _kAccent = Color(0xFF9C27B0);

// Outils gratuits : Bandes UHF/VHF, Calculateur d'Antenne
// Outils Pro     : tous les autres

class RfPage extends StatefulWidget {
  const RfPage({super.key});
  @override
  State<RfPage> createState() => _RfPageState();
}

class _RfPageState extends State<RfPage> {
  bool _isPro = false;

  @override
  void initState() {
    super.initState();
    _checkAccess();
  }

  Future<void> _checkAccess() async {
    final ok = await SubscriptionService.hasAccess(SubscriptionCategory.sonRf);
    if (!mounted) return;
    setState(() => _isPro = ok);
  }

  Future<void> _goToSubscription() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const SubscriptionPage(category: SubscriptionCategory.sonRf),
      ),
    );
    _checkAccess();
  }

  Widget _sectionLabel(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
      child: Row(
        children: [
          Expanded(
              child: Divider(
                  color: Colors.white.withValues(alpha: 0.10), height: 1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              text.toUpperCase(),
              style: const TextStyle(
                color: _kAccent,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5,
              ),
            ),
          ),
          Expanded(
              child: Divider(
                  color: Colors.white.withValues(alpha: 0.10), height: 1)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.rfPageTitle,
            style: const TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2)),
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
            16, 8, 16, 24 + MediaQuery.paddingOf(context).bottom),
        children: [
          // ── Micros HF & Antennes ──────────────────────────────────────────
          _sectionLabel(loc.rfSectionMicrosHf),
          AppGridView(
            children: [
              _RfToolTile(
                icon: Icons.settings_input_antenna_rounded,
                title: loc.rfToolUhfBandsTitle,
                subtitle: loc.rfToolUhfBandsSubtitle,
                free: true,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const RfUhfBandsPage())),
              ),
              _RfToolTile(
                icon: Icons.radio_rounded,
                title: loc.rfToolAntennaTitle,
                subtitle: loc.rfToolAntennaSubtitle,
                free: true,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const RfAntennaPage())),
              ),
              _RfToolTile(
                icon: Icons.call_split_rounded,
                title: loc.rfSplitterTitle,
                subtitle: loc.rfSplitterSubtitle,
                free: true,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const RfSplitterPage())),
              ),
              _RfToolTile(
                icon: Icons.cable_rounded,
                title: loc.rfCableAntennaTitle,
                subtitle: loc.rfCableAntennaSubtitle,
                pro: true,
                locked: !_isPro,
                onTap: _isPro
                    ? () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const RfCableAntennaPage()))
                    : _goToSubscription,
              ),
            ],
          ),
          // ── Calculs HF ────────────────────────────────────────────────────
          _sectionLabel(loc.rfSectionCalcHf),
          AppGridView(
            children: [
              _RfToolTile(
                icon: Icons.scatter_plot_rounded,
                title: loc.rfToolIm3Title,
                subtitle: loc.rfToolIm3Subtitle,
                pro: true,
                locked: !_isPro,
                onTap: _isPro
                    ? () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const RfIm3Page()))
                    : _goToSubscription,
              ),
              _RfToolTile(
                icon: Icons.grid_view_rounded,
                title: loc.rfPlannerTitle,
                subtitle: loc.rfPlannerSubtitle,
                pro: true,
                locked: !_isPro,
                onTap: _isPro
                    ? () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const RfPlannerPage()))
                    : _goToSubscription,
              ),
            ],
          ),
          // ── WiFi ──────────────────────────────────────────────────────────
          _sectionLabel(loc.rfSectionWifi),
          AppGridView(
            children: [
              _RfToolTile(
                icon: Icons.wifi_rounded,
                title: loc.rfToolWifi24Title,
                subtitle: loc.rfToolWifi24Subtitle,
                pro: true,
                locked: !_isPro,
                onTap: _isPro
                    ? () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const RfWifi24Page()))
                    : _goToSubscription,
              ),
              _RfToolTile(
                icon: Icons.wifi_find_rounded,
                title: loc.rfToolWifi5Title,
                subtitle: loc.rfToolWifi5Subtitle,
                pro: true,
                locked: !_isPro,
                onTap: _isPro
                    ? () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const RfWifi5Page()))
                    : _goToSubscription,
              ),
            ],
          ),
          // ── Coexistence ───────────────────────────────────────────────────
          _sectionLabel(loc.rfSectionCoexistence),
          AppGridView(
            children: [
              _RfToolTile(
                icon: Icons.signal_cellular_alt_rounded,
                title: loc.rfToolCoexTitle,
                subtitle: loc.rfToolCoexSubtitle,
                pro: true,
                locked: !_isPro,
                onTap: _isPro
                    ? () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const RfCoexistencePage()))
                    : _goToSubscription,
              ),
            ],
          ),
          // ── Scan & Terrain ────────────────────────────────────────────────
          _sectionLabel(loc.rfSectionScanTerrain),
          AppGridView(
            children: [
              _RfToolTile(
                icon: Icons.wifi_find_rounded,
                title: loc.rfToolScanWifiTitle,
                subtitle: loc.rfToolScanWifiSubtitle,
                free: true,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const RfWifiScanPage())),
              ),
              _RfToolTile(
                icon: Icons.radar_rounded,
                title: loc.rfToolScanLogTitle,
                subtitle: loc.rfToolScanLogSubtitle,
                free: true,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const RfScanLogPage())),
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}

// ── Tile ──────────────────────────────────────────────────────────────────────

class _RfToolTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final bool locked;
  final bool free;
  final bool pro;

  const _RfToolTile({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
    this.locked = false,
    this.free = false,
    this.pro = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppGridTile(
      icon: icon,
      label: title,
      subtitle: subtitle,
      accentColor: _kAccent,
      locked: locked,
      badge: free
          ? AppLocalizations.of(context).rfFreeLabel
          : (pro ? AppLocalizations.of(context).subscriptionProShort : null),
      onTap: onTap,
    );
  }
}
