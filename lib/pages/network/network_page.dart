import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../services/subscription_service.dart';
import '../subscription_page.dart';
import '../shared/app_grid_tile.dart';
import 'bandwidth_hub_page.dart';
import 'luminex_monitor_page.dart';
import 'manet_monitor_page.dart';
import 'network_dashboard_page.dart';
import 'network_help_page.dart';
import 'network_scan_page.dart';
import 'network_poe_budget_page.dart';
import 'network_fiber_budget_page.dart';
import 'network_subnet_calculator_page.dart';
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
  bool _hasPremium = false;

  @override
  void initState() {
    super.initState();
    _checkAccess();
  }

  Future<void> _checkAccess() async {
    final ok =
        await SubscriptionService.hasAccess(SubscriptionCategory.network);
    if (!mounted) return;
    setState(() => _hasPremium = ok);
  }

  Future<void> _goToSubscription() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const SubscriptionPage(category: SubscriptionCategory.network),
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
                color: Colors.white.withValues(alpha: 0.10), height: 1),
          ),
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
                color: Colors.white.withValues(alpha: 0.10), height: 1),
          ),
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
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => const NetworkHelpPage()),
            ),
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
          // ── Gratuit ──────────────────────────────────────────────────────
          _sectionLabel(loc.rfFreeLabel),
          AppGridView(
            children: [
              _NetworkToolTile(
                icon: Icons.radar_rounded,
                title: loc.networkScanCardTitle,
                subtitle: loc.networkScanCardSubtitle,
                free: true,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NetworkScanPage()),
                ),
              ),
              _NetworkToolTile(
                icon: Icons.power_rounded,
                title: loc.networkPoeTitle,
                subtitle: loc.networkPoeSubtitle,
                free: true,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NetworkPoeBudgetPage()),
                ),
              ),
              _NetworkToolTile(
                icon: Icons.cable_rounded,
                title: loc.networkFiberTitle,
                subtitle: loc.networkFiberSubtitle,
                free: true,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NetworkFiberBudgetPage()),
                ),
              ),
              _NetworkToolTile(
                icon: Icons.lan_rounded,
                title: loc.networkSubnetTitle,
                subtitle: loc.networkSubnetSubtitle,
                free: true,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const NetworkSubnetCalculatorPage()),
                ),
              ),
            ],
          ),

          // ── Réseau Pro ───────────────────────────────────────────────────
          _sectionLabel(loc.subscriptionCategoryNetworkTitle),
          AppGridView(
            children: [
              _NetworkToolTile(
                icon: Icons.dashboard_rounded,
                title: loc.dashboardCardTitle,
                subtitle: loc.dashboardCardSubtitle,
                pro: true,
                locked: !_hasPremium,
                onTap: _hasPremium
                    ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const NetworkDashboardPage()),
                        )
                    : _goToSubscription,
              ),
              _NetworkToolTile(
                icon: Icons.broadcast_on_personal_rounded,
                title: loc.networkArtNetCardTitle,
                subtitle: loc.networkArtNetCardSubtitle,
                pro: true,
                locked: !_hasPremium,
                onTap: _hasPremium
                    ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ArtNetViewerPage()),
                        )
                    : _goToSubscription,
              ),
              _NetworkToolTile(
                icon: Icons.pin_rounded,
                title: loc.networkArtNetAddressingTitle,
                subtitle: loc.networkArtNetAddressingSubtitle,
                pro: true,
                locked: !_hasPremium,
                onTap: _hasPremium
                    ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const NetworkArtNetAddressingPage()),
                        )
                    : _goToSubscription,
              ),
              _NetworkToolTile(
                icon: Icons.hub_rounded,
                title: loc.networkSacnCardTitle,
                subtitle: loc.networkSacnCardSubtitle,
                pro: true,
                locked: !_hasPremium,
                onTap: _hasPremium
                    ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SacnViewerPage()),
                        )
                    : _goToSubscription,
              ),
              _NetworkToolTile(
                icon: Icons.videocam_rounded,
                title: loc.ndiCardTitle,
                subtitle: loc.ndiCardSubtitle,
                pro: true,
                locked: !_hasPremium,
                onTap: _hasPremium
                    ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const NdiDiscoveryPage()),
                        )
                    : _goToSubscription,
              ),
              _NetworkToolTile(
                icon: Icons.monitor_heart_rounded,
                title: loc.diagCardTitle,
                subtitle: loc.diagCardSubtitle,
                pro: true,
                locked: !_hasPremium,
                onTap: _hasPremium
                    ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const NetworkDiagnosticPage()),
                        )
                    : _goToSubscription,
              ),
              _NetworkToolTile(
                icon: Icons.compare_arrows_rounded,
                title: loc.snapshotCardTitle,
                subtitle: loc.snapshotCardSubtitle,
                pro: true,
                locked: !_hasPremium,
                onTap: _hasPremium
                    ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SnapshotListPage()),
                        )
                    : _goToSubscription,
              ),
              _NetworkToolTile(
                icon: Icons.router_rounded,
                title: loc.luminexMonitorCardTitle,
                subtitle: loc.luminexMonitorCardSubtitle,
                pro: true,
                locked: !_hasPremium,
                onTap: _hasPremium
                    ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const LuminexMonitorPage()),
                        )
                    : _goToSubscription,
              ),
              _NetworkToolTile(
                icon: Icons.wifi_tethering_rounded,
                title: loc.manetMonitorCardTitle,
                subtitle: loc.manetMonitorCardSubtitle,
                pro: true,
                locked: !_hasPremium,
                onTap: _hasPremium
                    ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const MaNetMonitorPage()),
                        )
                    : _goToSubscription,
              ),
              _NetworkToolTile(
                icon: Icons.stacked_line_chart_rounded,
                title: loc.bwCardTitle,
                subtitle: loc.bwCardSubtitle,
                pro: true,
                locked: !_hasPremium,
                onTap: _hasPremium
                    ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const BandwidthHubPage()),
                        )
                    : _goToSubscription,
              ),
              _NetworkToolTile(
                icon: Icons.settings_remote_rounded,
                title: loc.rdmPageTitle,
                subtitle: loc.rdmPageSubtitle,
                pro: true,
                locked: !_hasPremium,
                onTap: _hasPremium
                    ? () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const RdmPage()),
                        )
                    : _goToSubscription,
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}

// ─── Tile outil réseau ────────────────────────────────────────────────────────

class _NetworkToolTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final bool locked;
  final bool free;
  final bool pro;

  const _NetworkToolTile({
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
    final loc = AppLocalizations.of(context);

    return AppGridTile(
      icon: icon,
      label: title,
      subtitle: subtitle,
      accentColor: _kAccent,
      locked: locked,
      badge: free
          ? loc.rfFreeLabel
          : (pro ? loc.subscriptionProShort : null),
      onTap: onTap,
    );
  }
}
