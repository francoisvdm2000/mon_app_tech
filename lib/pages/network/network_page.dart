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

  void _open(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  /// Tuile d'un outil Pro : ouvre l'outil, ou l'abonnement s'il est verrouillé.
  Widget _pro({
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget Function() page,
  }) =>
      _NetworkToolTile(
        icon: icon,
        title: title,
        subtitle: subtitle,
        pro: true,
        locked: !_hasPremium,
        onTap: _hasPremium ? () => _open(page()) : _goToSubscription,
      );

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
          // ── Par où commencer ─────────────────────────────────────────────
          _StartTip(text: loc.netStartTip),

          // ── 1. Qui est sur le réseau ─────────────────────────────────────
          _Section(title: loc.netSecWhoTitle, description: loc.netSecWhoDesc),
          AppGridView(
            children: [
              _pro(
                icon: Icons.router_rounded,
                title: loc.luminexMonitorCardTitle,
                subtitle: loc.luminexMonitorCardSubtitle,
                page: () => const LuminexMonitorPage(),
              ),
              _NetworkToolTile(
                icon: Icons.radar_rounded,
                title: loc.networkScanCardTitle,
                subtitle: loc.networkScanCardSubtitle,
                free: true,
                onTap: () => _open(const NetworkScanPage()),
              ),
              _pro(
                icon: Icons.wifi_tethering_rounded,
                title: loc.manetMonitorCardTitle,
                subtitle: loc.manetMonitorCardSubtitle,
                page: () => const MaNetMonitorPage(),
              ),
              _pro(
                icon: Icons.videocam_rounded,
                title: loc.ndiCardTitle,
                subtitle: loc.ndiCardSubtitle,
                page: () => const NdiDiscoveryPage(),
              ),
            ],
          ),

          // ── 2. Flux lumière et vidéo ─────────────────────────────────────
          _Section(title: loc.netSecFlowTitle, description: loc.netSecFlowDesc),
          AppGridView(
            children: [
              _pro(
                icon: Icons.hub_rounded,
                title: loc.networkSacnCardTitle,
                subtitle: loc.networkSacnCardSubtitle,
                page: () => const SacnViewerPage(),
              ),
              _pro(
                icon: Icons.broadcast_on_personal_rounded,
                title: loc.networkArtNetCardTitle,
                subtitle: loc.networkArtNetCardSubtitle,
                page: () => const ArtNetViewerPage(),
              ),
              _pro(
                icon: Icons.settings_remote_rounded,
                title: loc.rdmPageTitle,
                subtitle: loc.rdmPageSubtitle,
                page: () => const RdmPage(),
              ),
              _pro(
                icon: Icons.stacked_line_chart_rounded,
                title: loc.bwCardTitle,
                subtitle: loc.bwCardSubtitle,
                page: () => const BandwidthHubPage(),
              ),
            ],
          ),

          // ── 3. Santé du réseau ───────────────────────────────────────────
          _Section(
              title: loc.netSecHealthTitle, description: loc.netSecHealthDesc),
          AppGridView(
            children: [
              _pro(
                icon: Icons.monitor_heart_rounded,
                title: loc.diagCardTitle,
                subtitle: loc.diagCardSubtitle,
                page: () => const NetworkDiagnosticPage(),
              ),
              _pro(
                icon: Icons.dashboard_rounded,
                title: loc.dashboardCardTitle,
                subtitle: loc.dashboardCardSubtitle,
                page: () => const NetworkDashboardPage(),
              ),
              _pro(
                icon: Icons.compare_arrows_rounded,
                title: loc.snapshotCardTitle,
                subtitle: loc.snapshotCardSubtitle,
                page: () => const SnapshotListPage(),
              ),
            ],
          ),

          // ── 4. Outils et calculs ─────────────────────────────────────────
          _Section(
              title: loc.netSecToolsTitle, description: loc.netSecToolsDesc),
          AppGridView(
            children: [
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
              _NetworkToolTile(
                icon: Icons.lan_rounded,
                title: loc.networkSubnetTitle,
                subtitle: loc.networkSubnetSubtitle,
                free: true,
                onTap: () => _open(const NetworkSubnetCalculatorPage()),
              ),
              _pro(
                icon: Icons.pin_rounded,
                title: loc.networkArtNetAddressingTitle,
                subtitle: loc.networkArtNetAddressingSubtitle,
                page: () => const NetworkArtNetAddressingPage(),
              ),
              _NetworkToolTile(
                icon: Icons.power_rounded,
                title: loc.networkPoeTitle,
                subtitle: loc.networkPoeSubtitle,
                free: true,
                onTap: () => _open(const NetworkPoeBudgetPage()),
              ),
              _NetworkToolTile(
                icon: Icons.cable_rounded,
                title: loc.networkFiberTitle,
                subtitle: loc.networkFiberSubtitle,
                free: true,
                onTap: () => _open(const NetworkFiberBudgetPage()),
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
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
