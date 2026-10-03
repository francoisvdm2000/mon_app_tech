import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import 'about_artnet_page.dart';
import 'about_audio_page.dart';
import 'about_cinema_page.dart';
import 'about_console_page.dart';
import 'about_conversions_page.dart';
import 'about_dmx_page.dart';
import 'about_electricite_page.dart';
import 'about_informatique_page.dart';
import 'about_ip_basics_page.dart';
import 'about_laser_page.dart';
import 'about_network_page.dart';
import 'about_reseau_page.dart';
import 'about_rf_page.dart';
import 'about_rigging_page.dart';
import 'about_sacn_page.dart';
import 'about_sun_times_page.dart';
import 'about_timecode_page.dart';
import 'about_universe_to_artnet_table_page.dart';
import 'about_video_page.dart';
import 'about_vesa_screens_page.dart';

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
      AboutTile(
        pageId: 'vesa_screens',
        title: loc.aboutVesaTitle,
        subtitle: loc.aboutVesaSubtitle,
        icon: Icons.aspect_ratio,
      ),
      AboutTile(
        pageId: 'audio_about',
        title: loc.aboutAudioTitle,
        subtitle: loc.aboutAudioSubtitle,
        icon: Icons.graphic_eq,
      ),
      AboutTile(
        pageId: 'rf_about',
        title: loc.aboutRfTitle,
        subtitle: loc.aboutRfSubtitle,
        icon: Icons.settings_input_antenna,
      ),
      AboutTile(
        pageId: 'laser_about',
        title: loc.aboutLaserTitle,
        subtitle: loc.aboutLaserSubtitle,
        icon: Icons.bolt,
      ),
      AboutTile(
        pageId: 'rigging_about',
        title: loc.aboutRiggingTitle,
        subtitle: loc.aboutRiggingSubtitle,
        icon: Icons.hardware_rounded,
      ),
      AboutTile(
        pageId: 'console_about',
        title: loc.aboutConsoleTitle,
        subtitle: loc.aboutConsoleSubtitle,
        icon: Icons.dashboard_customize_outlined,
      ),
      AboutTile(
        pageId: 'cinema_about',
        title: loc.aboutCinemaTitle,
        subtitle: loc.aboutCinemaSubtitle,
        icon: Icons.videocam_outlined,
      ),
      AboutTile(
        pageId: 'timecode_about',
        title: loc.aboutTimecodeTitle,
        subtitle: loc.aboutTimecodeSubtitle,
        icon: Icons.timer_outlined,
      ),
      AboutTile(
        pageId: 'conversions_about',
        title: loc.aboutConversionsTitle,
        subtitle: loc.aboutConversionsSubtitle,
        icon: Icons.swap_horiz,
      ),
    ];
  }

  /// Tiles grouped by theme for a more readable overview page.
  static List<AboutCategoryGroup> groupedTiles(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final byId = {for (final t in tiles(context)) t.pageId: t};

    List<AboutTile> pick(List<String> ids) =>
        ids.map((id) => byId[id]).whereType<AboutTile>().toList();

    return [
      AboutCategoryGroup(
        title: loc.aboutCategoryNetworkTitle,
        tiles: pick(['dmx', 'artnet', 'sacn', 'ip_basics', 'light_network', 'cabling_fiber']),
      ),
      AboutCategoryGroup(
        title: loc.aboutCategoryAudioRfTitle,
        tiles: pick(['audio_about', 'rf_about']),
      ),
      AboutCategoryGroup(
        title: loc.aboutCategoryVideoCinemaTitle,
        tiles: pick(['video_about', 'cinema_about', 'timecode_about']),
      ),
      AboutCategoryGroup(
        title: loc.aboutCategoryLightingTitle,
        tiles: pick(['laser_about', 'console_about']),
      ),
      AboutCategoryGroup(
        title: loc.aboutCategoryRiggingElecTitle,
        tiles: pick(['rigging_about', 'electricity']),
      ),
      AboutCategoryGroup(
        title: loc.aboutCategoryToolsTitle,
        tiles: pick(['computing', 'sun_times', 'vesa_screens', 'conversions_about']),
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
      case 'vesa_screens':
        return const AboutVesaScreensPage();
      case 'audio_about':
        return const AboutAudioPage();
      case 'rf_about':
        return const AboutRfPage();
      case 'laser_about':
        return const AboutLaserPage();
      case 'rigging_about':
        return const AboutRiggingPage();
      case 'console_about':
        return const AboutConsolePage();
      case 'cinema_about':
        return const AboutCinemaPage();
      case 'timecode_about':
        return const AboutTimecodePage();
      case 'conversions_about':
        return const AboutConversionsPage();
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
      AboutSearchEntry(pageId: 'vesa_screens', sectionId: 'page', pageTitle: loc.aboutVesaTitle, sectionTitle: loc.aboutVesaTitle, subtitle: loc.aboutVesaSubtitle, icon: Icons.aspect_ratio),
      AboutSearchEntry(pageId: 'audio_about', sectionId: 'basics', pageTitle: loc.aboutAudioTitle, sectionTitle: loc.audioRefSection1Title, subtitle: loc.aboutAudioSubtitle, icon: Icons.graphic_eq),
      AboutSearchEntry(pageId: 'audio_about', sectionId: 'spl_distance', pageTitle: loc.aboutAudioTitle, sectionTitle: loc.audioRefSection2Title, subtitle: loc.aboutAudioSubtitle, icon: Icons.graphic_eq),
      AboutSearchEntry(pageId: 'audio_about', sectionId: 'delay_alignment', pageTitle: loc.aboutAudioTitle, sectionTitle: loc.audioRefSection3Title, subtitle: loc.aboutAudioSubtitle, icon: Icons.graphic_eq),
      AboutSearchEntry(pageId: 'audio_about', sectionId: 'subs_directivity', pageTitle: loc.aboutAudioTitle, sectionTitle: loc.audioRefSection4Title, subtitle: loc.aboutAudioSubtitle, icon: Icons.graphic_eq),
      AboutSearchEntry(pageId: 'audio_about', sectionId: 'cabling', pageTitle: loc.aboutAudioTitle, sectionTitle: loc.audioRefSection5Title, subtitle: loc.aboutAudioSubtitle, icon: Icons.graphic_eq),
      AboutSearchEntry(pageId: 'audio_about', sectionId: 'safety', pageTitle: loc.aboutAudioTitle, sectionTitle: loc.audioRefSection6Title, subtitle: loc.aboutAudioSubtitle, icon: Icons.graphic_eq),
      AboutSearchEntry(pageId: 'audio_about', sectionId: 'checklist', pageTitle: loc.aboutAudioTitle, sectionTitle: loc.audioRefSection7Title, subtitle: loc.aboutAudioSubtitle, icon: Icons.graphic_eq),
      AboutSearchEntry(pageId: 'rf_about', sectionId: 'basics', pageTitle: loc.aboutRfTitle, sectionTitle: loc.rfRefSection1Title, subtitle: loc.aboutRfSubtitle, icon: Icons.settings_input_antenna),
      AboutSearchEntry(pageId: 'rf_about', sectionId: 'uhf_bands', pageTitle: loc.aboutRfTitle, sectionTitle: loc.rfRefSection2Title, subtitle: loc.aboutRfSubtitle, icon: Icons.settings_input_antenna),
      AboutSearchEntry(pageId: 'rf_about', sectionId: 'wifi', pageTitle: loc.aboutRfTitle, sectionTitle: loc.rfRefSection3Title, subtitle: loc.aboutRfSubtitle, icon: Icons.settings_input_antenna),
      AboutSearchEntry(pageId: 'rf_about', sectionId: 'coexistence', pageTitle: loc.aboutRfTitle, sectionTitle: loc.rfRefSection4Title, subtitle: loc.aboutRfSubtitle, icon: Icons.settings_input_antenna),
      AboutSearchEntry(pageId: 'rf_about', sectionId: 'antennas', pageTitle: loc.aboutRfTitle, sectionTitle: loc.rfRefSection5Title, subtitle: loc.aboutRfSubtitle, icon: Icons.settings_input_antenna),
      AboutSearchEntry(pageId: 'rf_about', sectionId: 'scan_prep', pageTitle: loc.aboutRfTitle, sectionTitle: loc.rfRefSection6Title, subtitle: loc.aboutRfSubtitle, icon: Icons.settings_input_antenna),
      AboutSearchEntry(pageId: 'rf_about', sectionId: 'checklist', pageTitle: loc.aboutRfTitle, sectionTitle: loc.rfRefSection7Title, subtitle: loc.aboutRfSubtitle, icon: Icons.settings_input_antenna),
      AboutSearchEntry(pageId: 'laser_about', sectionId: 'basics', pageTitle: loc.aboutLaserTitle, sectionTitle: loc.laserRefSection1Title, subtitle: loc.aboutLaserSubtitle, icon: Icons.bolt),
      AboutSearchEntry(pageId: 'laser_about', sectionId: 'drawing', pageTitle: loc.aboutLaserTitle, sectionTitle: loc.laserRefSection2Title, subtitle: loc.aboutLaserSubtitle, icon: Icons.bolt),
      AboutSearchEntry(pageId: 'laser_about', sectionId: 'classes', pageTitle: loc.aboutLaserTitle, sectionTitle: loc.laserRefSection3Title, subtitle: loc.aboutLaserSubtitle, icon: Icons.bolt),
      AboutSearchEntry(pageId: 'laser_about', sectionId: 'safety', pageTitle: loc.aboutLaserTitle, sectionTitle: loc.laserRefSection4Title, subtitle: loc.aboutLaserSubtitle, icon: Icons.bolt),
      AboutSearchEntry(pageId: 'laser_about', sectionId: 'zones', pageTitle: loc.aboutLaserTitle, sectionTitle: loc.laserRefSection5Title, subtitle: loc.aboutLaserSubtitle, icon: Icons.bolt),
      AboutSearchEntry(pageId: 'laser_about', sectionId: 'checklist', pageTitle: loc.aboutLaserTitle, sectionTitle: loc.laserRefSection6Title, subtitle: loc.aboutLaserSubtitle, icon: Icons.bolt),
      AboutSearchEntry(pageId: 'rigging_about', sectionId: 'basics', pageTitle: loc.aboutRiggingTitle, sectionTitle: loc.riggingRefSection1Title, subtitle: loc.aboutRiggingSubtitle, icon: Icons.hardware_rounded),
      AboutSearchEntry(pageId: 'rigging_about', sectionId: 'bridle', pageTitle: loc.aboutRiggingTitle, sectionTitle: loc.riggingRefSection2Title, subtitle: loc.aboutRiggingSubtitle, icon: Icons.hardware_rounded),
      AboutSearchEntry(pageId: 'rigging_about', sectionId: 'angle_factor', pageTitle: loc.aboutRiggingTitle, sectionTitle: loc.riggingRefSection3Title, subtitle: loc.aboutRiggingSubtitle, icon: Icons.hardware_rounded),
      AboutSearchEntry(pageId: 'rigging_about', sectionId: 'checklist', pageTitle: loc.aboutRiggingTitle, sectionTitle: loc.riggingRefSection4Title, subtitle: loc.aboutRiggingSubtitle, icon: Icons.hardware_rounded),
      AboutSearchEntry(pageId: 'console_about', sectionId: 'wireless', pageTitle: loc.aboutConsoleTitle, sectionTitle: loc.consoleRefSection1Title, subtitle: loc.aboutConsoleSubtitle, icon: Icons.dashboard_customize_outlined),
      AboutSearchEntry(pageId: 'console_about', sectionId: 'gdtf', pageTitle: loc.aboutConsoleTitle, sectionTitle: loc.consoleRefSection2Title, subtitle: loc.aboutConsoleSubtitle, icon: Icons.dashboard_customize_outlined),
      AboutSearchEntry(pageId: 'console_about', sectionId: 'patch', pageTitle: loc.aboutConsoleTitle, sectionTitle: loc.consoleRefSection3Title, subtitle: loc.aboutConsoleSubtitle, icon: Icons.dashboard_customize_outlined),
      AboutSearchEntry(pageId: 'console_about', sectionId: 'checklist', pageTitle: loc.aboutConsoleTitle, sectionTitle: loc.consoleRefSection4Title, subtitle: loc.aboutConsoleSubtitle, icon: Icons.dashboard_customize_outlined),
      AboutSearchEntry(pageId: 'cinema_about', sectionId: 'camera', pageTitle: loc.aboutCinemaTitle, sectionTitle: loc.cinemaRefSection1Title, subtitle: loc.aboutCinemaSubtitle, icon: Icons.videocam_outlined),
      AboutSearchEntry(pageId: 'cinema_about', sectionId: 'depth', pageTitle: loc.aboutCinemaTitle, sectionTitle: loc.cinemaRefSection2Title, subtitle: loc.aboutCinemaSubtitle, icon: Icons.videocam_outlined),
      AboutSearchEntry(pageId: 'cinema_about', sectionId: 'shutter', pageTitle: loc.aboutCinemaTitle, sectionTitle: loc.cinemaRefSection3Title, subtitle: loc.aboutCinemaSubtitle, icon: Icons.videocam_outlined),
      AboutSearchEntry(pageId: 'cinema_about', sectionId: 'checklist', pageTitle: loc.aboutCinemaTitle, sectionTitle: loc.cinemaRefSection4Title, subtitle: loc.aboutCinemaSubtitle, icon: Icons.videocam_outlined),
      AboutSearchEntry(pageId: 'timecode_about', sectionId: 'basics', pageTitle: loc.aboutTimecodeTitle, sectionTitle: loc.timecodeRefSection1Title, subtitle: loc.aboutTimecodeSubtitle, icon: Icons.timer_outlined),
      AboutSearchEntry(pageId: 'timecode_about', sectionId: 'drop_frame', pageTitle: loc.aboutTimecodeTitle, sectionTitle: loc.timecodeRefSection2Title, subtitle: loc.aboutTimecodeSubtitle, icon: Icons.timer_outlined),
      AboutSearchEntry(pageId: 'timecode_about', sectionId: 'rates', pageTitle: loc.aboutTimecodeTitle, sectionTitle: loc.timecodeRefSection3Title, subtitle: loc.aboutTimecodeSubtitle, icon: Icons.timer_outlined),
      AboutSearchEntry(pageId: 'timecode_about', sectionId: 'checklist', pageTitle: loc.aboutTimecodeTitle, sectionTitle: loc.timecodeRefSection4Title, subtitle: loc.aboutTimecodeSubtitle, icon: Icons.timer_outlined),
      AboutSearchEntry(pageId: 'conversions_about', sectionId: 'why', pageTitle: loc.aboutConversionsTitle, sectionTitle: loc.conversionsRefSection1Title, subtitle: loc.aboutConversionsSubtitle, icon: Icons.swap_horiz),
      AboutSearchEntry(pageId: 'conversions_about', sectionId: 'bpm', pageTitle: loc.aboutConversionsTitle, sectionTitle: loc.conversionsRefSection2Title, subtitle: loc.aboutConversionsSubtitle, icon: Icons.swap_horiz),
      AboutSearchEntry(pageId: 'conversions_about', sectionId: 'dmx', pageTitle: loc.aboutConversionsTitle, sectionTitle: loc.conversionsRefSection3Title, subtitle: loc.aboutConversionsSubtitle, icon: Icons.swap_horiz),
      AboutSearchEntry(pageId: 'conversions_about', sectionId: 'checklist', pageTitle: loc.aboutConversionsTitle, sectionTitle: loc.conversionsRefSection4Title, subtitle: loc.aboutConversionsSubtitle, icon: Icons.swap_horiz),
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

class AboutCategoryGroup {
  const AboutCategoryGroup({
    required this.title,
    required this.tiles,
  });

  final String title;
  final List<AboutTile> tiles;
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
