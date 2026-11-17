import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../shared/app_grid_tile.dart';
import 'bandwidth_hub_page.dart';
import 'network_category_page.dart';
import 'luminex_monitor_page.dart';
import 'manet_monitor_page.dart';
import 'network_dashboard_page.dart';
import 'network_help_page.dart';
import 'network_scan_page.dart';
import 'network_poe_budget_page.dart';
import 'network_fiber_budget_page.dart';
import 'network_subnet_calculator_page.dart';
import 'ping_page.dart';
import 'my_ip_page.dart';
import 'artnet_viewer_page.dart';
import 'network_artnet_addressing_page.dart';
import 'sacn_viewer_page.dart';
import 'network_diagnostic_page.dart';
import 'ndi_discovery_page.dart';
import 'snapshot_list_page.dart';
import 'rdm_page.dart';

const _kAccent = Color(0xFF00E5FF); // Cyan réseau

class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  void _open(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  void _openCategory({
    required String title,
    required String description,
    required IconData icon,
    required List<NetworkToolEntry> tools,
  }) {
    _open(NetworkCategoryPage(
      title: title,
      description: description,
      icon: icon,
      tools: tools,
    ));
  }

  // ─── Contenu des rubriques ─────────────────────────────────────────────────

  List<NetworkToolEntry> _whoTools(AppLocalizations loc) => [
        NetworkToolEntry(
          icon: Icons.router_rounded,
          title: loc.luminexMonitorCardTitle,
          subtitle: loc.luminexMonitorCardSubtitle,
          pro: true,
          builder: () => const LuminexMonitorPage(),
        ),
        NetworkToolEntry(
          icon: Icons.wifi_tethering_rounded,
          title: loc.manetMonitorCardTitle,
          subtitle: loc.manetMonitorCardSubtitle,
          pro: true,
          builder: () => const MaNetMonitorPage(),
        ),
        NetworkToolEntry(
          icon: Icons.videocam_rounded,
          title: loc.ndiCardTitle,
          subtitle: loc.ndiCardSubtitle,
          pro: true,
          builder: () => const NdiDiscoveryPage(),
        ),
      ];

  List<NetworkToolEntry> _flowTools(AppLocalizations loc) => [
        NetworkToolEntry(
          icon: Icons.hub_rounded,
          title: loc.networkSacnCardTitle,
          subtitle: loc.networkSacnCardSubtitle,
          pro: true,
          builder: () => const SacnViewerPage(),
        ),
        NetworkToolEntry(
          icon: Icons.broadcast_on_personal_rounded,
          title: loc.networkArtNetCardTitle,
          subtitle: loc.networkArtNetCardSubtitle,
          pro: true,
          builder: () => const ArtNetViewerPage(),
        ),
        NetworkToolEntry(
          icon: Icons.settings_remote_rounded,
          title: loc.rdmPageTitle,
          subtitle: loc.rdmPageSubtitle,
          pro: true,
          builder: () => const RdmPage(),
        ),
        NetworkToolEntry(
          icon: Icons.stacked_line_chart_rounded,
          title: loc.bwCardTitle,
          subtitle: loc.bwCardSubtitle,
          pro: true,
          builder: () => const BandwidthHubPage(),
        ),
      ];

  List<NetworkToolEntry> _healthTools(AppLocalizations loc) => [
        NetworkToolEntry(
          icon: Icons.monitor_heart_rounded,
          title: loc.diagCardTitle,
          subtitle: loc.diagCardSubtitle,
          pro: true,
          builder: () => const NetworkDiagnosticPage(),
        ),
        NetworkToolEntry(
          icon: Icons.dashboard_rounded,
          title: loc.dashboardCardTitle,
          subtitle: loc.dashboardCardSubtitle,
          pro: true,
          builder: () => const NetworkDashboardPage(),
        ),
        NetworkToolEntry(
          icon: Icons.compare_arrows_rounded,
          title: loc.snapshotCardTitle,
          subtitle: loc.snapshotCardSubtitle,
          pro: true,
          builder: () => const SnapshotListPage(),
        ),
      ];

  List<NetworkToolEntry> _calcTools(AppLocalizations loc) => [
        NetworkToolEntry(
          icon: Icons.lan_rounded,
          title: loc.networkSubnetTitle,
          subtitle: loc.networkSubnetSubtitle,
          pro: false,
          builder: () => const NetworkSubnetCalculatorPage(),
        ),
        NetworkToolEntry(
          icon: Icons.power_rounded,
          title: loc.networkPoeTitle,
          subtitle: loc.networkPoeSubtitle,
          pro: false,
          builder: () => const NetworkPoeBudgetPage(),
        ),
        NetworkToolEntry(
          icon: Icons.cable_rounded,
          title: loc.networkFiberTitle,
          subtitle: loc.networkFiberSubtitle,
          pro: false,
          builder: () => const NetworkFiberBudgetPage(),
        ),
        NetworkToolEntry(
          icon: Icons.pin_rounded,
          title: loc.networkArtNetAddressingTitle,
          subtitle: loc.networkArtNetAddressingSubtitle,
          pro: true,
          builder: () => const NetworkArtNetAddressingPage(),
        ),
      ];

  // ─── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    final categories = [
      (
        icon: Icons.travel_explore_rounded,
        title: loc.netSecWhoTitle,
        description: loc.netSecWhoDesc,
        tools: _whoTools(loc),
      ),
      (
        icon: Icons.podcasts_rounded,
        title: loc.netSecFlowTitle,
        description: loc.netSecFlowDesc,
        tools: _flowTools(loc),
      ),
      (
        icon: Icons.monitor_heart_rounded,
        title: loc.netSecHealthTitle,
        description: loc.netSecHealthDesc,
        tools: _healthTools(loc),
      ),
      (
        icon: Icons.calculate_rounded,
        title: loc.netSecToolsTitle,
        description: loc.netSecToolsDesc,
        tools: _calcTools(loc),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          loc.networkPageTitle,
          style: const TextStyle(
              fontWeight: FontWeight.w800, letterSpacing: 0.2),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.info_outline_rounded,
              size: 20,
              color: Colors.white.withValues(alpha: 0.45),
            ),
            tooltip: loc.helpPageTitle,
            onPressed: () => _open(const NetworkHelpPage()),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(
              height: 1, color: Colors.white.withValues(alpha: 0.08)),
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
            // ── Par où commencer ───────────────────────────────────────────
            _StartTip(text: loc.netStartTip),
            const SizedBox(height: 14),

            // ── Rubriques ──────────────────────────────────────────────────
            for (final c in categories)
              _CategoryCard(
                icon: c.icon,
                title: c.title,
                description: c.description,
                toolCount: c.tools.length,
                freeCount: c.tools.where((t) => !t.pro).length,
                onTap: () => _openCategory(
                  title: c.title,
                  description: c.description,
                  icon: c.icon,
                  tools: c.tools,
                ),
              ),

            // ── Accès rapide (gratuit) ─────────────────────────────────────
            _Section(title: loc.netQuickTitle, description: loc.netQuickDesc),
            AppGridView(
              children: [
                _NetworkToolTile(
                  icon: Icons.radar_rounded,
                  title: loc.networkScanCardTitle,
                  subtitle: loc.networkScanCardSubtitle,
                  free: true,
                  onTap: () => _open(const NetworkScanPage()),
                ),
                _NetworkToolTile(
                  icon: Icons.network_ping,
                  title: loc.pingCardTitle,
                  subtitle: loc.pingCardSubtitle,
                  free: true,
                  onTap: () => _open(const PingPage()),
                ),
                _NetworkToolTile(
                  icon: Icons.perm_device_information_rounded,
                  title: loc.myIpCardTitle,
                  subtitle: loc.myIpCardSubtitle,
                  free: true,
                  onTap: () => _open(const MyIpPage()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Carte de rubrique ────────────────────────────────────────────────────────

class _CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final int toolCount;
  final int freeCount;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.toolCount,
    required this.freeCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          splashColor: _kAccent.withValues(alpha: 0.08),
          child: Container(
            padding: const EdgeInsets.fromLTRB(14, 14, 10, 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: _kAccent.withValues(alpha: 0.13),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(icon, color: _kAccent, size: 26),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15.5,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.35,
                          color: Colors.white.withValues(alpha: 0.50),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Wrap(
                        spacing: 6,
                        runSpacing: 4,
                        children: [
                          _Chip(
                            text: loc.netCatTools(toolCount),
                            color: _kAccent,
                          ),
                          if (freeCount > 0)
                            _Chip(
                              text: loc.netCatFree(freeCount),
                              color: const Color(0xFF00C853),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right_rounded,
                    color: _kAccent.withValues(alpha: 0.55)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String text;
  final Color color;
  const _Chip({required this.text, required this.color});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 10.5,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
}

// ─── En-tête de rubrique ──────────────────────────────────────────────────────

class _Section extends StatelessWidget {
  final String title;
  final String description;

  const _Section({required this.title, required this.description});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(2, 22, 2, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 4,
                  height: 16,
                  decoration: BoxDecoration(
                    color: _kAccent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: TextStyle(
                fontSize: 12.5,
                height: 1.4,
                color: Colors.white.withValues(alpha: 0.50),
              ),
            ),
          ],
        ),
      );
}

/// Conseil « par où commencer » en tête de page.
class _StartTip extends StatelessWidget {
  final String text;
  const _StartTip({required this.text});

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: _kAccent.withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _kAccent.withValues(alpha: 0.22)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.tips_and_updates_rounded,
                color: _kAccent.withValues(alpha: 0.9), size: 18),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 12.5,
                  height: 1.4,
                  color: Colors.white.withValues(alpha: 0.75),
                ),
              ),
            ),
          ],
        ),
      );
}

// ─── Tile outil réseau ────────────────────────────────────────────────────────

class _NetworkToolTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final bool free;

  const _NetworkToolTile({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
    this.free = false,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return AppGridTile(
      icon: icon,
      label: title,
      subtitle: subtitle,
      accentColor: _kAccent,
      badge: free ? loc.rfFreeLabel : null,
      onTap: onTap,
    );
  }
}
