import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import 'about_artnet_page.dart';
import 'about_dmx_page.dart';
import 'about_electricite_page.dart';
import 'about_informatique_page.dart';
import 'about_ip_basics_page.dart';
import 'about_network_page.dart';
import 'about_reseau_page.dart';
import 'about_sacn_page.dart';
import 'about_sun_times_page.dart';
import 'about_universe_to_artnet_table_page.dart';
import 'about_video_page.dart';

class AboutRegistry {
  static List<AboutTile> tiles(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return [
      AboutTile(
        pageId: 'dmx',
        title: loc.aboutDmxTitle,
        subtitle: loc.aboutDmxSubtitle,
        icon: Icons.cable,
      ),
      AboutTile(
        pageId: 'artnet',
        title: loc.aboutArtNetTitle,
        subtitle: loc.aboutArtNetSubtitle,
        icon: Icons.router,
      ),
      AboutTile(
        pageId: 'sacn',
        title: loc.aboutSacnTitle,
        subtitle: loc.aboutSacnSubtitle,
        icon: Icons.wifi_tethering,
      ),
      AboutTile(
        pageId: 'ip_basics',
        title: loc.aboutIpBasicsTitle,
        subtitle: loc.aboutIpBasicsSubtitle,
        icon: Icons.language,
      ),
      AboutTile(
        pageId: 'light_network',
        title: loc.aboutLightNetworkTitle,
        subtitle: loc.aboutLightNetworkSubtitle,
        icon: Icons.lan,
      ),
      AboutTile(
        pageId: 'cabling_fiber',
        title: loc.aboutCablingFiberTitle,
        subtitle: loc.aboutCablingFiberSubtitle,
        icon: Icons.cable,
      ),
      AboutTile(
        pageId: 'video_about',
        title: loc.aboutVideoTitle,
        subtitle: loc.aboutVideoSubtitle,
        icon: Icons.connected_tv,
      ),
      AboutTile(
        pageId: 'electricity',
        title: loc.aboutElectricityTitle,
        subtitle: loc.aboutElectricitySubtitle,
        icon: Icons.electrical_services,
      ),
      AboutTile(
        pageId: 'computing',
        title: loc.aboutComputingTitle,
        subtitle: loc.aboutComputingSubtitle,
        icon: Icons.usb,
      ),
      AboutTile(
        pageId: 'sun_times',
        title: loc.aboutSunTimesTitle,
        subtitle: loc.aboutSunTimesSubtitle,
        icon: Icons.wb_sunny,
      ),
    ];
  }

  static Widget buildPage(String pageId, {String? sectionId}) {
    switch (pageId) {
      case 'dmx':
        return AboutDmxPage(initialSectionId: sectionId);
      case 'artnet':
        return const AboutArtNetPage();
      case 'artnet_table':
        return const AboutUniverseToArtNetTablePage();
      case 'sacn':
        return const AboutSacnPage();
      case 'ip_basics':
        return const AboutIpBasicsPage();
      case 'light_network':
        return const AboutNetworkPage();
      case 'cabling_fiber':
        return const AboutReseauPage();
      case 'video_about':
        return const AboutVideoPage();
      case 'electricity':
        return const AboutElectricitePage();
      case 'computing':
        return const AboutInformatiquePage();
      case 'sun_times':
        return const AboutSunTimesPage();
      default:
        return const AboutDmxPage();
    }
  }

  static List<AboutSearchEntry> searchEntries(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return [
      AboutSearchEntry(pageId: 'dmx', sectionId: 'basics', pageTitle: loc.aboutDmxTitle, sectionTitle: loc.aboutDmxToc1, subtitle: loc.aboutDmxSubtitle, icon: Icons.cable),
      AboutSearchEntry(pageId: 'dmx', sectionId: 'frame', pageTitle: loc.aboutDmxTitle, sectionTitle: loc.aboutDmxToc2, subtitle: loc.aboutDmxSubtitle, icon: Icons.cable),
      AboutSearchEntry(pageId: 'dmx', sectionId: 'cabling', pageTitle: loc.aboutDmxTitle, sectionTitle: loc.aboutDmxToc3, subtitle: loc.aboutDmxSubtitle, icon: Icons.cable),
      AboutSearchEntry(pageId: 'dmx', sectionId: 'termination', pageTitle: loc.aboutDmxTitle, sectionTitle: loc.aboutDmxToc4, subtitle: loc.aboutDmxSubtitle, icon: Icons.cable),
      AboutSearchEntry(pageId: 'dmx', sectionId: 'rdm', pageTitle: loc.aboutDmxTitle, sectionTitle: loc.aboutDmxToc4bis, subtitle: loc.aboutDmxSubtitle, icon: Icons.cable),
      AboutSearchEntry(pageId: 'dmx', sectionId: 'troubleshooting', pageTitle: loc.aboutDmxTitle, sectionTitle: loc.aboutDmxToc5, subtitle: loc.aboutDmxSubtitle, icon: Icons.cable),
      AboutSearchEntry(pageId: 'dmx', sectionId: 'artnet', pageTitle: loc.aboutDmxTitle, sectionTitle: loc.aboutDmxToc6, subtitle: loc.aboutDmxSubtitle, icon: Icons.cable),
      AboutSearchEntry(pageId: 'dmx', sectionId: 'sacn', pageTitle: loc.aboutDmxTitle, sectionTitle: loc.aboutDmxToc7, subtitle: loc.aboutDmxSubtitle, icon: Icons.cable),
      AboutSearchEntry(pageId: 'dmx', sectionId: 'compare', pageTitle: loc.aboutDmxTitle, sectionTitle: loc.aboutDmxToc8, subtitle: loc.aboutDmxSubtitle, icon: Icons.cable),
      AboutSearchEntry(pageId: 'dmx', sectionId: 'diagrams', pageTitle: loc.aboutDmxTitle, sectionTitle: loc.aboutDmxToc9, subtitle: loc.aboutDmxSubtitle, icon: Icons.cable),
      AboutSearchEntry(pageId: 'dmx', sectionId: 'checklist', pageTitle: loc.aboutDmxTitle, sectionTitle: loc.aboutDmxToc10, subtitle: loc.aboutDmxSubtitle, icon: Icons.cable),
      AboutSearchEntry(pageId: 'artnet', sectionId: 'basics', pageTitle: loc.aboutArtNetTitle, sectionTitle: loc.aboutArtnetSection1Title, subtitle: loc.aboutArtNetSubtitle, icon: Icons.router),
      AboutSearchEntry(pageId: 'artnet', sectionId: 'addressing', pageTitle: loc.aboutArtNetTitle, sectionTitle: loc.aboutArtnetSection2Title, subtitle: loc.aboutArtNetSubtitle, icon: Icons.router),
      AboutSearchEntry(pageId: 'artnet', sectionId: 'limits', pageTitle: loc.aboutArtNetTitle, sectionTitle: loc.aboutArtnetSection3Title, subtitle: loc.aboutArtNetSubtitle, icon: Icons.router),
      AboutSearchEntry(pageId: 'artnet', sectionId: 'nodes_rdm', pageTitle: loc.aboutArtNetTitle, sectionTitle: loc.aboutArtnetSection4Title, subtitle: loc.aboutArtNetSubtitle, icon: Icons.router),
      AboutSearchEntry(pageId: 'artnet', sectionId: 'troubleshooting', pageTitle: loc.aboutArtNetTitle, sectionTitle: loc.aboutArtnetSection5Title, subtitle: loc.aboutArtNetSubtitle, icon: Icons.router),
      AboutSearchEntry(pageId: 'artnet', sectionId: 'diagrams', pageTitle: loc.aboutArtNetTitle, sectionTitle: loc.aboutArtnetSection6Title, subtitle: loc.aboutArtNetSubtitle, icon: Icons.router),
      AboutSearchEntry(pageId: 'artnet', sectionId: 'assets', pageTitle: loc.aboutArtNetTitle, sectionTitle: loc.aboutArtnetSection6bTitle, subtitle: loc.aboutArtNetSubtitle, icon: Icons.router),
      AboutSearchEntry(pageId: 'artnet', sectionId: 'checklist', pageTitle: loc.aboutArtNetTitle, sectionTitle: loc.aboutArtnetSection7Title, subtitle: loc.aboutArtNetSubtitle, icon: Icons.router),
      AboutSearchEntry(pageId: 'artnet_table', sectionId: 'table', pageTitle: loc.aboutArtNetTitle, sectionTitle: loc.aboutArtnetConversionTablesTitle, subtitle: loc.aboutArtNetSubtitle, icon: Icons.table_chart),
      AboutSearchEntry(pageId: 'sacn', sectionId: 'basics', pageTitle: loc.aboutSacnTitle, sectionTitle: loc.aboutSacnToc1, subtitle: loc.aboutSacnSubtitle, icon: Icons.wifi_tethering),
      AboutSearchEntry(pageId: 'sacn', sectionId: 'universe', pageTitle: loc.aboutSacnTitle, sectionTitle: loc.aboutSacnToc2, subtitle: loc.aboutSacnSubtitle, icon: Icons.wifi_tethering),
      AboutSearchEntry(pageId: 'sacn', sectionId: 'multicast', pageTitle: loc.aboutSacnTitle, sectionTitle: loc.aboutSacnToc3, subtitle: loc.aboutSacnSubtitle, icon: Icons.wifi_tethering),
      AboutSearchEntry(pageId: 'sacn', sectionId: 'priorities', pageTitle: loc.aboutSacnTitle, sectionTitle: loc.aboutSacnToc4, subtitle: loc.aboutSacnSubtitle, icon: Icons.wifi_tethering),
      AboutSearchEntry(pageId: 'sacn', sectionId: 'perf', pageTitle: loc.aboutSacnTitle, sectionTitle: loc.aboutSacnToc5, subtitle: loc.aboutSacnSubtitle, icon: Icons.wifi_tethering),
      AboutSearchEntry(pageId: 'sacn', sectionId: 'sync', pageTitle: loc.aboutSacnTitle, sectionTitle: loc.aboutSacnToc6, subtitle: loc.aboutSacnSubtitle, icon: Icons.wifi_tethering),
      AboutSearchEntry(pageId: 'sacn', sectionId: 'troubleshooting', pageTitle: loc.aboutSacnTitle, sectionTitle: loc.aboutSacnToc7, subtitle: loc.aboutSacnSubtitle, icon: Icons.wifi_tethering),
      AboutSearchEntry(pageId: 'sacn', sectionId: 'checklist', pageTitle: loc.aboutSacnTitle, sectionTitle: loc.aboutSacnToc8, subtitle: loc.aboutSacnSubtitle, icon: Icons.wifi_tethering),
      AboutSearchEntry(pageId: 'ip_basics', sectionId: 'what_is_ip', pageTitle: loc.aboutIpBasicsTitle, sectionTitle: loc.ipBasicsToc1, subtitle: loc.aboutIpBasicsSubtitle, icon: Icons.language),
      AboutSearchEntry(pageId: 'ip_basics', sectionId: 'private_ranges', pageTitle: loc.aboutIpBasicsTitle, sectionTitle: loc.ipBasicsToc2, subtitle: loc.aboutIpBasicsSubtitle, icon: Icons.language),
      AboutSearchEntry(pageId: 'ip_basics', sectionId: 'mask_subnet', pageTitle: loc.aboutIpBasicsTitle, sectionTitle: loc.ipBasicsToc3, subtitle: loc.aboutIpBasicsSubtitle, icon: Icons.language),
      AboutSearchEntry(pageId: 'ip_basics', sectionId: 'gateway_dns_dhcp', pageTitle: loc.aboutIpBasicsTitle, sectionTitle: loc.ipBasicsToc4, subtitle: loc.aboutIpBasicsSubtitle, icon: Icons.language),
      AboutSearchEntry(pageId: 'ip_basics', sectionId: 'how_devices_talk', pageTitle: loc.aboutIpBasicsTitle, sectionTitle: loc.ipBasicsToc5, subtitle: loc.aboutIpBasicsSubtitle, icon: Icons.language),
      AboutSearchEntry(pageId: 'ip_basics', sectionId: 'common_show_plans', pageTitle: loc.aboutIpBasicsTitle, sectionTitle: loc.ipBasicsToc6, subtitle: loc.aboutIpBasicsSubtitle, icon: Icons.language),
      AboutSearchEntry(pageId: 'ip_basics', sectionId: 'troubleshooting', pageTitle: loc.aboutIpBasicsTitle, sectionTitle: loc.ipBasicsToc7, subtitle: loc.aboutIpBasicsSubtitle, icon: Icons.language),
      AboutSearchEntry(pageId: 'ip_basics', sectionId: 'mini_exercises', pageTitle: loc.aboutIpBasicsTitle, sectionTitle: loc.ipBasicsToc8, subtitle: loc.aboutIpBasicsSubtitle, icon: Icons.language),
      AboutSearchEntry(pageId: 'ip_basics', sectionId: 'checklist', pageTitle: loc.aboutIpBasicsTitle, sectionTitle: loc.ipBasicsToc9, subtitle: loc.aboutIpBasicsSubtitle, icon: Icons.language),
      AboutSearchEntry(pageId: 'light_network', sectionId: 'basics', pageTitle: loc.aboutLightNetworkTitle, sectionTitle: loc.aboutNetworkToc1, subtitle: loc.aboutLightNetworkSubtitle, icon: Icons.lan),
      AboutSearchEntry(pageId: 'light_network', sectionId: 'plan_ip', pageTitle: loc.aboutLightNetworkTitle, sectionTitle: loc.aboutNetworkToc2, subtitle: loc.aboutLightNetworkSubtitle, icon: Icons.lan),
      AboutSearchEntry(pageId: 'light_network', sectionId: 'vlan', pageTitle: loc.aboutLightNetworkTitle, sectionTitle: loc.aboutNetworkToc3, subtitle: loc.aboutLightNetworkSubtitle, icon: Icons.lan),
      AboutSearchEntry(pageId: 'light_network', sectionId: 'igmp', pageTitle: loc.aboutLightNetworkTitle, sectionTitle: loc.aboutNetworkToc4, subtitle: loc.aboutLightNetworkSubtitle, icon: Icons.lan),
      AboutSearchEntry(pageId: 'light_network', sectionId: 'wifi', pageTitle: loc.aboutLightNetworkTitle, sectionTitle: loc.aboutNetworkToc5, subtitle: loc.aboutLightNetworkSubtitle, icon: Icons.lan),
      AboutSearchEntry(pageId: 'light_network', sectionId: 'switch', pageTitle: loc.aboutLightNetworkTitle, sectionTitle: loc.aboutNetworkToc6, subtitle: loc.aboutLightNetworkSubtitle, icon: Icons.lan),
      AboutSearchEntry(pageId: 'light_network', sectionId: 'diagrams', pageTitle: loc.aboutLightNetworkTitle, sectionTitle: loc.aboutNetworkToc7, subtitle: loc.aboutLightNetworkSubtitle, icon: Icons.lan),
      AboutSearchEntry(pageId: 'light_network', sectionId: 'checklist', pageTitle: loc.aboutLightNetworkTitle, sectionTitle: loc.aboutNetworkToc8, subtitle: loc.aboutLightNetworkSubtitle, icon: Icons.lan),
      AboutSearchEntry(pageId: 'cabling_fiber', sectionId: 'basics', pageTitle: loc.aboutCablingFiberTitle, sectionTitle: loc.aboutReseauToc1, subtitle: loc.aboutCablingFiberSubtitle, icon: Icons.cable),
      AboutSearchEntry(pageId: 'cabling_fiber', sectionId: 'rj45', pageTitle: loc.aboutCablingFiberTitle, sectionTitle: loc.aboutReseauToc2, subtitle: loc.aboutCablingFiberSubtitle, icon: Icons.cable),
      AboutSearchEntry(pageId: 'cabling_fiber', sectionId: 'poe', pageTitle: loc.aboutCablingFiberTitle, sectionTitle: loc.aboutReseauToc3, subtitle: loc.aboutCablingFiberSubtitle, icon: Icons.cable),
      AboutSearchEntry(pageId: 'cabling_fiber', sectionId: 'fiber', pageTitle: loc.aboutCablingFiberTitle, sectionTitle: loc.aboutReseauToc4, subtitle: loc.aboutCablingFiberSubtitle, icon: Icons.cable),
      AboutSearchEntry(pageId: 'cabling_fiber', sectionId: 'sfp', pageTitle: loc.aboutCablingFiberTitle, sectionTitle: loc.aboutReseauToc5, subtitle: loc.aboutCablingFiberSubtitle, icon: Icons.cable),
      AboutSearchEntry(pageId: 'cabling_fiber', sectionId: 'switch', pageTitle: loc.aboutCablingFiberTitle, sectionTitle: loc.aboutReseauToc6, subtitle: loc.aboutCablingFiberSubtitle, icon: Icons.cable),
      AboutSearchEntry(pageId: 'cabling_fiber', sectionId: 'artnet_sacn', pageTitle: loc.aboutCablingFiberTitle, sectionTitle: loc.aboutReseauToc7, subtitle: loc.aboutCablingFiberSubtitle, icon: Icons.cable),
      AboutSearchEntry(pageId: 'cabling_fiber', sectionId: 'checklist', pageTitle: loc.aboutCablingFiberTitle, sectionTitle: loc.aboutReseauToc8, subtitle: loc.aboutCablingFiberSubtitle, icon: Icons.cable),
      AboutSearchEntry(pageId: 'video_about', sectionId: 'basics', pageTitle: loc.aboutVideoTitle, sectionTitle: loc.aboutVideoToc1, subtitle: loc.aboutVideoSubtitle, icon: Icons.connected_tv),
      AboutSearchEntry(pageId: 'video_about', sectionId: 'res_fps', pageTitle: loc.aboutVideoTitle, sectionTitle: loc.aboutVideoToc2, subtitle: loc.aboutVideoSubtitle, icon: Icons.connected_tv),
      AboutSearchEntry(pageId: 'video_about', sectionId: 'color', pageTitle: loc.aboutVideoTitle, sectionTitle: loc.aboutVideoToc3, subtitle: loc.aboutVideoSubtitle, icon: Icons.connected_tv),
      AboutSearchEntry(pageId: 'video_about', sectionId: 'sync', pageTitle: loc.aboutVideoTitle, sectionTitle: loc.aboutVideoToc4, subtitle: loc.aboutVideoSubtitle, icon: Icons.connected_tv),
      AboutSearchEntry(pageId: 'video_about', sectionId: 'cables', pageTitle: loc.aboutVideoTitle, sectionTitle: loc.aboutVideoToc5, subtitle: loc.aboutVideoSubtitle, icon: Icons.connected_tv),
      AboutSearchEntry(pageId: 'video_about', sectionId: 'sdi', pageTitle: loc.aboutVideoTitle, sectionTitle: loc.aboutVideoToc6, subtitle: loc.aboutVideoSubtitle, icon: Icons.connected_tv),
      AboutSearchEntry(pageId: 'video_about', sectionId: 'hdmi', pageTitle: loc.aboutVideoTitle, sectionTitle: loc.aboutVideoToc7, subtitle: loc.aboutVideoSubtitle, icon: Icons.connected_tv),
      AboutSearchEntry(pageId: 'video_about', sectionId: 'ndi', pageTitle: loc.aboutVideoTitle, sectionTitle: loc.aboutVideoToc8, subtitle: loc.aboutVideoSubtitle, icon: Icons.connected_tv),
      AboutSearchEntry(pageId: 'video_about', sectionId: 'mapping_led', pageTitle: loc.aboutVideoTitle, sectionTitle: loc.aboutVideoToc9, subtitle: loc.aboutVideoSubtitle, icon: Icons.connected_tv),
      AboutSearchEntry(pageId: 'video_about', sectionId: 'checklist', pageTitle: loc.aboutVideoTitle, sectionTitle: loc.aboutVideoToc10, subtitle: loc.aboutVideoSubtitle, icon: Icons.connected_tv),
      AboutSearchEntry(pageId: 'electricity', sectionId: 'basics', pageTitle: loc.aboutElectricityTitle, sectionTitle: loc.elecSection1Title, subtitle: loc.aboutElectricitySubtitle, icon: Icons.electrical_services),
      AboutSearchEntry(pageId: 'electricity', sectionId: 'connectors', pageTitle: loc.aboutElectricityTitle, sectionTitle: loc.elecSection2Title, subtitle: loc.aboutElectricitySubtitle, icon: Icons.electrical_services),
      AboutSearchEntry(pageId: 'electricity', sectionId: 'mono_tri', pageTitle: loc.aboutElectricityTitle, sectionTitle: loc.elecSection3Title, subtitle: loc.aboutElectricitySubtitle, icon: Icons.electrical_services),
      AboutSearchEntry(pageId: 'electricity', sectionId: 'power_table', pageTitle: loc.aboutElectricityTitle, sectionTitle: loc.elecSection4Title, subtitle: loc.aboutElectricitySubtitle, icon: Icons.electrical_services),
      AboutSearchEntry(pageId: 'electricity', sectionId: 'kva_conversion', pageTitle: loc.aboutElectricityTitle, sectionTitle: loc.elecKvaTitle, subtitle: loc.aboutElectricitySubtitle, icon: Icons.electrical_services),
      AboutSearchEntry(pageId: 'electricity', sectionId: 'safety', pageTitle: loc.aboutElectricityTitle, sectionTitle: loc.elecSection5Title, subtitle: loc.aboutElectricitySubtitle, icon: Icons.electrical_services),
      AboutSearchEntry(pageId: 'electricity', sectionId: 'checklist', pageTitle: loc.aboutElectricityTitle, sectionTitle: loc.elecSection6Title, subtitle: loc.aboutElectricitySubtitle, icon: Icons.electrical_services),
      AboutSearchEntry(pageId: 'computing', sectionId: 'usb', pageTitle: loc.aboutComputingTitle, sectionTitle: loc.infoUsbTitle, subtitle: loc.aboutComputingSubtitle, icon: Icons.usb),
      AboutSearchEntry(pageId: 'computing', sectionId: 'storage', pageTitle: loc.aboutComputingTitle, sectionTitle: loc.infoStorageTitle, subtitle: loc.aboutComputingSubtitle, icon: Icons.usb),
      AboutSearchEntry(pageId: 'computing', sectionId: 'video_links', pageTitle: loc.aboutComputingTitle, sectionTitle: loc.infoVideoLinksTitle, subtitle: loc.aboutComputingSubtitle, icon: Icons.usb),
      AboutSearchEntry(pageId: 'computing', sectionId: 'pcie_gpu', pageTitle: loc.aboutComputingTitle, sectionTitle: loc.infoPcieGpuTitle, subtitle: loc.aboutComputingSubtitle, icon: Icons.usb),
      AboutSearchEntry(pageId: 'computing', sectionId: 'checklist', pageTitle: loc.aboutComputingTitle, sectionTitle: loc.infoChecklistTitle, subtitle: loc.aboutComputingSubtitle, icon: Icons.usb),
      AboutSearchEntry(pageId: 'sun_times', sectionId: 'page', pageTitle: loc.aboutSunTimesTitle, sectionTitle: loc.aboutSunTimesTitle, subtitle: loc.aboutSunTimesSubtitle, icon: Icons.wb_sunny),
    ];
  }
}

class AboutTile {
  const AboutTile({
    required this.pageId,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String pageId;
  final String title;
  final String subtitle;
  final IconData icon;
}

class AboutSearchEntry {
  const AboutSearchEntry({
    required this.pageId,
    required this.sectionId,
    required this.pageTitle,
    required this.sectionTitle,
    required this.subtitle,
    required this.icon,
  });

  final String pageId;
  final String sectionId;
  final String pageTitle;
  final String sectionTitle;
  final String subtitle;
  final IconData icon;
}
