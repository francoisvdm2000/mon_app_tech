// lib/pages/about/about_registry.dart
import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

// Pages (pour tuiles classiques)
import 'about_dmx_page.dart';
import 'about_artnet_page.dart';
import 'about_sacn_page.dart';
import 'about_ip_basics_page.dart';
import 'about_reseau_page.dart';
import 'about_network_page.dart';
import 'about_video_page.dart';
import 'about_electricite_page.dart';
import 'about_informatique_page.dart';

class AboutRegistry {
  static List<AboutTile> tiles(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return [
      AboutTile(
        title: loc.aboutRegistryDmxTitle,
        subtitle: loc.aboutRegistryDmxSubtitle,
        icon: Icons.cable,
        pageBuilder: AboutDmxPage.new,
      ),
      AboutTile(
        title: loc.aboutRegistryArtnetTitle,
        subtitle: loc.aboutRegistryArtnetSubtitle,
        icon: Icons.router,
        pageBuilder: AboutArtNetPage.new,
      ),
      AboutTile(
        title: loc.aboutRegistrySacnTitle,
        subtitle: loc.aboutRegistrySacnSubtitle,
        icon: Icons.wifi_tethering,
        pageBuilder: AboutSacnPage.new,
      ),
      AboutTile(
        title: loc.aboutRegistryIpBasicsTitle,
        subtitle: loc.aboutRegistryIpBasicsSubtitle,
        icon: Icons.language,
        pageBuilder: AboutIpBasicsPage.new,
      ),
      AboutTile(
        title: loc.aboutRegistryReseauTitle,
        subtitle: loc.aboutRegistryReseauSubtitle,
        icon: Icons.cable,
        pageBuilder: AboutReseauPage.new,
      ),
      AboutTile(
        title: loc.aboutRegistryNetworkTitle,
        subtitle: loc.aboutRegistryNetworkSubtitle,
        icon: Icons.lan,
        pageBuilder: AboutNetworkPage.new,
      ),
      AboutTile(
        title: loc.aboutRegistryVideoTitle,
        subtitle: loc.aboutRegistryVideoSubtitle,
        icon: Icons.connected_tv,
        pageBuilder: AboutVideoPage.new,
      ),
      AboutTile(
        title: loc.aboutRegistryElectriciteTitle,
        subtitle: loc.aboutRegistryElectriciteSubtitle,
        icon: Icons.electrical_services,
        pageBuilder: AboutElectricitePage.new,
      ),
      AboutTile(
        title: loc.aboutRegistryInformatiqueTitle,
        subtitle: loc.aboutRegistryInformatiqueSubtitle,
        icon: Icons.usb,
        pageBuilder: AboutInformatiquePage.new,
      ),
    ];
  }
}

class AboutTile {
  const AboutTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.pageBuilder,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Widget Function() pageBuilder;
}
