import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

import 'about/about_dmx_page.dart';
import 'about/about_artnet_page.dart';
import 'about/about_sacn_page.dart';
import 'about/about_ip_basics_page.dart';
import 'about/about_network_page.dart';
import 'about/about_video_page.dart';
import 'about/about_electricite_page.dart';
import 'about/about_informatique_page.dart';
import 'about/about_reseau_page.dart';

class PageAbout extends StatelessWidget {
  const PageAbout({super.key});

  void _open(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(loc.homeReferencesTitle)),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: LayoutBuilder(
            builder: (context, c) {
              final isWide = c.maxWidth >= 900;
              final tileW = isWide ? (c.maxWidth - 12) / 2 : c.maxWidth;

              Widget sized(Widget child) =>
                  SizedBox(width: tileW, child: child);

              return Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  sized(
                    _NavTile(
                      title: loc.aboutDmxTitle,
                      subtitle: loc.aboutDmxSubtitle,
                      icon: Icons.cable,
                      onTap: () => _open(context, const AboutDmxPage()),
                    ),
                  ),
                  sized(
                    _NavTile(
                      title: loc.aboutArtNetTitle,
                      subtitle: loc.aboutArtNetSubtitle,
                      icon: Icons.router,
                      onTap: () => _open(context, const AboutArtNetPage()),
                    ),
                  ),
                  sized(
                    _NavTile(
                      title: loc.aboutSacnTitle,
                      subtitle: loc.aboutSacnSubtitle,
                      icon: Icons.wifi_tethering,
                      onTap: () => _open(context, const AboutSacnPage()),
                    ),
                  ),
                  sized(
                    _NavTile(
                      title: loc.aboutIpBasicsTitle,
                      subtitle: loc.aboutIpBasicsSubtitle,
                      icon: Icons.language,
                      onTap: () => _open(context, const AboutIpBasicsPage()),
                    ),
                  ),
                  sized(
                    _NavTile(
                      title: loc.aboutLightNetworkTitle,
                      subtitle: loc.aboutLightNetworkSubtitle,
                      icon: Icons.lan,
                      onTap: () => _open(context, const AboutNetworkPage()),
                    ),
                  ),
                  sized(
                    _NavTile(
                      title: loc.aboutCablingFiberTitle,
                      subtitle: loc.aboutCablingFiberSubtitle,
                      icon: Icons.cable,
                      onTap: () => _open(context, const AboutReseauPage()),
                    ),
                  ),
                  sized(
                    _NavTile(
                      title: loc.aboutVideoTitle,
                      subtitle: loc.aboutVideoSubtitle,
                      icon: Icons.connected_tv,
                      onTap: () => _open(context, const AboutVideoPage()),
                    ),
                  ),
                  sized(
                    _NavTile(
                      title: loc.aboutElectricityTitle,
                      subtitle: loc.aboutElectricitySubtitle,
                      icon: Icons.electrical_services,
                      onTap: () => _open(context, const AboutElectricitePage()),
                    ),
                  ),
                  sized(
                    _NavTile(
                      title: loc.aboutComputingTitle,
                      subtitle: loc.aboutComputingSubtitle,
                      icon: Icons.usb,
                      onTap: () =>
                          _open(context, const AboutInformatiquePage()),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _NavTile extends StatelessWidget {
  const _NavTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: Colors.white, size: 22),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.75),
                        height: 1.25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.chevron_right,
                  color: Colors.white.withValues(alpha: 0.55)),
            ],
          ),
        ),
      ),
    );
  }
}
