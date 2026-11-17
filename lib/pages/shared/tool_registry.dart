import 'package:flutter/material.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../audio/audio_wavelength_page.dart';
import '../audio/audio_spl_distance_page.dart';
import '../audio/audio_sub_cardioid_page.dart';
import '../audio/audio_electroacoustic_page.dart';
import '../audio/audio_spl_sum_page.dart';
import '../audio/audio_amp_load_page.dart';
import '../audio/sound_catalog_page.dart';
import '../laser/laser_catalog_page.dart';
import '../audio/audio_delay_distance_page.dart';
import '../audio/audio_levels_page.dart';
import '../audio/audio_noise_dose_page.dart';
import '../audio/audio_input_list_page.dart';
import '../audio/audio_impedance_page.dart';
import '../audio/audio_crossover_page.dart';
import '../audio/audio_rt60_page.dart';
import '../audio/audio_spl_meter_page.dart';
import '../audio/audio_delay_time_page.dart';
import '../rf/rf_uhf_bands_page.dart';
import '../rf/rf_antenna_page.dart';
import '../rf/rf_splitter_page.dart';
import '../rf/rf_cable_antenna_page.dart';
import '../rf/rf_planner_page.dart';
import '../rf/rf_im3_page.dart';
import '../rf/rf_wifi_24_page.dart';
import '../rf/rf_wifi_5_page.dart';
import '../rf/rf_coexistence_page.dart';
import '../rf/rf_wifi_scan_page.dart';
import '../rf/rf_scan_log_page.dart';
import '../timecode/timecode_converter_page.dart';
import '../timecode/timecode_math_page.dart';
import '../timecode/timecode_delay_page.dart';
import '../timecode/timecode_countdown_page.dart';
import '../rigging/rigging_wll_check_page.dart';
import '../rigging/rigging_angle_factor_page.dart';
import '../rigging/rigging_bridle_2_points_page.dart';
import '../rigging/rigging_multi_point_page.dart';
import '../rigging/rigging_truss_load_page.dart';
import '../rigging/rigging_hoist_selector_page.dart';
import '../electricity/electricity_cable_section_page.dart';
import '../electricity/electricity_ups_autonomy_page.dart';
import '../electricity/electricity_power_current_page.dart';
import '../electricity/electricity_phase_power_page.dart';
import '../electricity/load_balancer/load_balancer_page.dart';
import '../electricity/electricity_generator_page.dart';
import '../electricity/electricity_power_factor_page.dart';
import '../electricity/power_plan/power_plan_page.dart';
import '../laser_page.dart';
import '../laser/laser_beam_size_page.dart';
import '../console/virtual_console_page.dart';
import '../console/ma3_params/ma3_param_calculator_page.dart';
import '../cinema/cinema_tools_page_full.dart';
import '../conversions/conversions_page.dart';
import '../tools/bpm_page.dart';
import '../video/video_lens_measure_page.dart';
import '../video/video_brightness_page.dart';
import '../video/video_camera_exposure_page.dart';
import '../video/video_multiprojecteur_page.dart';
import '../video/video_led_page.dart';
import '../video/mire_ecran_video_page.dart';
import '../video/mire_ecran_led_page.dart';
import '../network/network_scan_page.dart';
import '../network/network_poe_budget_page.dart';
import '../network/network_fiber_budget_page.dart';
import '../network/network_subnet_calculator_page.dart';
import '../network/ping_page.dart';
import '../network/my_ip_page.dart';
import '../network/network_dashboard_page.dart';
import '../network/sacn_viewer_page.dart';
import '../network/luminex_monitor_page.dart';
import '../network/snapshot_list_page.dart';
import '../network/ndi_discovery_page.dart';
import '../network/network_diagnostic_page.dart';
import '../network/broadcast_bandwidth_page.dart';
import '../network/snmp_ports_page.dart';
import '../network/artnet_viewer_page.dart';
import '../network/network_artnet_addressing_page.dart';
import '../network/manet_monitor_page.dart';
import '../network/rdm_page.dart';
import '../lumiere/projection_page.dart';
import '../lumiere/dipswitch_page.dart';
import '../lumiere/filter_correspondence_page.dart';
import '../lumiere/photometry_page.dart';
import '../lumiere/light_exposure_meter_page.dart';
import '../lumiere/filter_led_page.dart';
import '../lumiere/color_temperature_filter_page.dart';
import '../lumiere/fixtures/fixture_catalog_page.dart';
import '../lumiere/fixtures/fixture_compare_page.dart';
import '../lumiere/diaph/diaph_page.dart';
import '../lumiere/patch/patch_mvr_import_page.dart';
import '../lumiere/patch/gdtf_builder_simple_page.dart';
import '../community/plugin_community_page.dart';

/// Registre générique des outils/calculateurs "épinglables".
///
/// Miroir de `AboutRegistry` (pages/about/about_registry.dart) mais pour les
/// outils eux-mêmes plutôt que pour les pages de référence. Chaque outil
/// épinglable est identifié par un `pageId` unique de la forme
/// `tool:<identifiant>` et un `sectionId` constant `'main'` (un outil = une
/// seule "section" pinnable), afin de réutiliser tel quel le mécanisme
/// existant [AboutFavoritesStore] / [AboutPinButton] (déjà générique, stocké
/// sous forme de simples chaînes pageId/sectionId).
///
/// Extensible : pour ajouter un nouvel outil épinglable, il suffit d'ajouter
/// une entrée ici (avec son pageId unique) et un `AboutPinButton` dans
/// l'AppBar de la page concernée — voir les outils Audio/RF/Timecode
/// ci-dessous comme modèle.
class ToolRegistry {
  static List<ToolRefEntry> entries(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return [
      // ── Audio ──────────────────────────────────────────────────────────
      ToolRefEntry(
        pageId: 'tool:audio_sub_cardioid',
        sectionId: 'main',
        categoryTitle: loc.audioHomeTitle,
        toolTitle: loc.audioSubCardioidTitle,
        icon: Icons.speaker_group_rounded,
        builder: (_) => const AudioSubCardioidPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:audio_spl_distance',
        sectionId: 'main',
        categoryTitle: loc.audioHomeTitle,
        toolTitle: loc.audioSplDistanceTitle,
        icon: Icons.social_distance_rounded,
        builder: (_) => const AudioSplDistancePage(),
      ),
      ToolRefEntry(
        pageId: 'tool:audio_spl_sum',
        sectionId: 'main',
        categoryTitle: loc.audioHomeTitle,
        toolTitle: loc.audioSplSumTitle,
        icon: Icons.add_chart_rounded,
        builder: (_) => const AudioSplSumPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:audio_electroacoustic',
        sectionId: 'main',
        categoryTitle: loc.audioHomeTitle,
        toolTitle: loc.audioElectroacousticTitle,
        icon: Icons.speaker_rounded,
        builder: (_) => const AudioElectroacousticPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:audio_wavelength',
        sectionId: 'main',
        categoryTitle: loc.audioHomeTitle,
        toolTitle: loc.audioWavelengthTitle,
        icon: Icons.waves_rounded,
        builder: (_) => const AudioWavelengthPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:audio_rt60',
        sectionId: 'main',
        categoryTitle: loc.audioHomeTitle,
        toolTitle: loc.audioRt60Title,
        icon: Icons.meeting_room_rounded,
        builder: (_) => const AudioRt60Page(),
      ),
      ToolRefEntry(
        pageId: 'tool:audio_spl_meter',
        sectionId: 'main',
        categoryTitle: loc.audioHomeTitle,
        toolTitle: loc.audioSplMeterTitle,
        icon: Icons.mic_rounded,
        builder: (_) => const AudioSplMeterPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:audio_delay_time',
        sectionId: 'main',
        categoryTitle: loc.audioHomeTitle,
        toolTitle: loc.audioDelayTimeTitle,
        icon: Icons.speed_rounded,
        builder: (_) => const AudioDelayTimePage(),
      ),
      ToolRefEntry(
        pageId: 'tool:audio_amp_load',
        sectionId: 'main',
        categoryTitle: loc.audioHomeTitle,
        toolTitle: loc.audioAmpLoadTitle,
        icon: Icons.electrical_services_rounded,
        builder: (_) => const AudioAmpLoadPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:audio_sound_catalog',
        sectionId: 'main',
        categoryTitle: loc.audioHomeTitle,
        toolTitle: loc.soundCatalogTitle,
        icon: Icons.menu_book_rounded,
        builder: (_) => const SoundCatalogPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:audio_levels',
        sectionId: 'main',
        categoryTitle: loc.audioHomeTitle,
        toolTitle: loc.audioLevelsTitle,
        icon: Icons.cable_rounded,
        builder: (_) => const AudioLevelsPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:audio_delay_distance',
        sectionId: 'main',
        categoryTitle: loc.audioHomeTitle,
        toolTitle: loc.audioDelayDistanceTitle,
        icon: Icons.timer_outlined,
        builder: (_) => const AudioDelayDistancePage(),
      ),
      ToolRefEntry(
        pageId: 'tool:audio_noise_dose',
        sectionId: 'main',
        categoryTitle: loc.audioHomeTitle,
        toolTitle: loc.audioNoiseDoseTitle,
        icon: Icons.hearing_rounded,
        builder: (_) => const AudioNoiseDosePage(),
      ),
      ToolRefEntry(
        pageId: 'tool:audio_input_list',
        sectionId: 'main',
        categoryTitle: loc.audioHomeTitle,
        toolTitle: loc.audioInputListTitle,
        icon: Icons.list_alt_rounded,
        builder: (_) => const AudioInputListPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:audio_impedance',
        sectionId: 'main',
        categoryTitle: loc.audioHomeTitle,
        toolTitle: loc.audioImpedanceTitle,
        icon: Icons.speaker_rounded,
        builder: (_) => const AudioImpedancePage(),
      ),
      ToolRefEntry(
        pageId: 'tool:audio_crossover',
        sectionId: 'main',
        categoryTitle: loc.audioHomeTitle,
        toolTitle: loc.audioCrossoverTitle,
        icon: Icons.graphic_eq_rounded,
        builder: (_) => const AudioCrossoverPage(),
      ),

      // ── RF / Wi-Fi ─────────────────────────────────────────────────────
      ToolRefEntry(
        pageId: 'tool:rf_uhf_bands',
        sectionId: 'main',
        categoryTitle: loc.rfPageTitle,
        toolTitle: loc.rfUhfBandsTitle,
        icon: Icons.settings_input_antenna_rounded,
        builder: (_) => const RfUhfBandsPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:rf_antenna',
        sectionId: 'main',
        categoryTitle: loc.rfPageTitle,
        toolTitle: loc.rfAntennaTitle,
        icon: Icons.radio_rounded,
        builder: (_) => const RfAntennaPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:rf_splitter',
        sectionId: 'main',
        categoryTitle: loc.rfPageTitle,
        toolTitle: loc.rfSplitterTitle,
        icon: Icons.call_split_rounded,
        builder: (_) => const RfSplitterPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:rf_cable_antenna',
        sectionId: 'main',
        categoryTitle: loc.rfPageTitle,
        toolTitle: loc.rfCableAntennaTitle,
        icon: Icons.cable_rounded,
        builder: (_) => const RfCableAntennaPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:rf_im3',
        sectionId: 'main',
        categoryTitle: loc.rfPageTitle,
        toolTitle: loc.rfIm3PageTitle,
        icon: Icons.scatter_plot_rounded,
        builder: (_) => const RfIm3Page(),
      ),
      ToolRefEntry(
        pageId: 'tool:rf_planner',
        sectionId: 'main',
        categoryTitle: loc.rfPageTitle,
        toolTitle: loc.rfPlannerTitle,
        icon: Icons.grid_view_rounded,
        builder: (_) => const RfPlannerPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:rf_wifi_24',
        sectionId: 'main',
        categoryTitle: loc.rfPageTitle,
        toolTitle: loc.rfWifi24PageTitle,
        icon: Icons.wifi_rounded,
        builder: (_) => const RfWifi24Page(),
      ),
      ToolRefEntry(
        pageId: 'tool:rf_wifi_5',
        sectionId: 'main',
        categoryTitle: loc.rfPageTitle,
        toolTitle: loc.rfWifi5PageTitle,
        icon: Icons.wifi_find_rounded,
        builder: (_) => const RfWifi5Page(),
      ),
      ToolRefEntry(
        pageId: 'tool:rf_coexistence',
        sectionId: 'main',
        categoryTitle: loc.rfPageTitle,
        toolTitle: loc.rfCoexTitle,
        icon: Icons.signal_cellular_alt_rounded,
        builder: (_) => const RfCoexistencePage(),
      ),
      ToolRefEntry(
        pageId: 'tool:rf_wifi_scan',
        sectionId: 'main',
        categoryTitle: loc.rfPageTitle,
        toolTitle: loc.rfWifiScanTitle,
        icon: Icons.wifi_find_rounded,
        builder: (_) => const RfWifiScanPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:rf_scan_log',
        sectionId: 'main',
        categoryTitle: loc.rfPageTitle,
        toolTitle: loc.rfScanLogTitle,
        icon: Icons.radar_rounded,
        builder: (_) => const RfScanLogPage(),
      ),

      // ── Timecode ───────────────────────────────────────────────────────
      ToolRefEntry(
        pageId: 'tool:timecode_converter',
        sectionId: 'main',
        categoryTitle: loc.timecodeHubTitle,
        toolTitle: loc.timecodeConverterTitle,
        icon: Icons.swap_horiz_rounded,
        builder: (_) => const TimecodeConverterPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:timecode_math',
        sectionId: 'main',
        categoryTitle: loc.timecodeHubTitle,
        toolTitle: loc.timecodeMathTitle,
        icon: Icons.calculate_outlined,
        builder: (_) => const TimecodeMathPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:timecode_delay',
        sectionId: 'main',
        categoryTitle: loc.timecodeHubTitle,
        toolTitle: loc.timecodeDelayTitle,
        icon: Icons.compare_arrows_rounded,
        builder: (_) => const TimecodeDelayPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:timecode_countdown',
        sectionId: 'main',
        categoryTitle: loc.timecodeHubTitle,
        toolTitle: loc.timecodeCountdownTitle,
        icon: Icons.hourglass_bottom_rounded,
        builder: (_) => const TimecodeCountdownPage(),
      ),

      // ── Rigging ────────────────────────────────────────────────────────
      ToolRefEntry(
        pageId: 'tool:rigging_wll_check',
        sectionId: 'main',
        categoryTitle: loc.riggingTitle,
        toolTitle: loc.riggingToolWllTitle,
        icon: Icons.verified_outlined,
        builder: (_) => const RiggingWllCheckPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:rigging_angle_factor',
        sectionId: 'main',
        categoryTitle: loc.riggingTitle,
        toolTitle: loc.riggingToolAngleFactorTitle,
        icon: Icons.call_split_outlined,
        builder: (_) => const RiggingAngleFactorPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:rigging_bridle_2points',
        sectionId: 'main',
        categoryTitle: loc.riggingTitle,
        toolTitle: loc.riggingToolBridleTitle,
        icon: Icons.account_tree_outlined,
        builder: (_) => const RiggingBridle2PointsPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:rigging_multi_point',
        sectionId: 'main',
        categoryTitle: loc.riggingTitle,
        toolTitle: loc.riggingToolMultiPointTitle,
        icon: Icons.share_outlined,
        builder: (_) => const RiggingMultiPointPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:rigging_hoist_selector',
        sectionId: 'main',
        categoryTitle: loc.riggingTitle,
        toolTitle: loc.riggingToolHoistTitle,
        icon: Icons.build_circle_outlined,
        builder: (_) => const RiggingHoistSelectorPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:rigging_truss_load',
        sectionId: 'main',
        categoryTitle: loc.riggingTitle,
        toolTitle: loc.riggingToolTrussLoadTitle,
        icon: Icons.linear_scale,
        builder: (_) => const RiggingTrussLoadPage(),
      ),

      // ── Électricité ────────────────────────────────────────────────────
      ToolRefEntry(
        pageId: 'tool:electricity_cable_section',
        sectionId: 'main',
        categoryTitle: loc.electricityTitle,
        toolTitle: loc.electricityToolCableSectionTitle,
        icon: Icons.power_input,
        builder: (_) => const ElectricityCableSectionPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:electricity_ups_autonomy',
        sectionId: 'main',
        categoryTitle: loc.electricityTitle,
        toolTitle: loc.electricityToolUpsTitle,
        icon: Icons.battery_charging_full,
        builder: (_) => const ElectricityUpsAutonomyPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:electricity_power_current',
        sectionId: 'main',
        categoryTitle: loc.electricityTitle,
        toolTitle: loc.electricityToolPowerCurrentTitle,
        icon: Icons.bolt,
        builder: (_) => const ElectricityPowerCurrentPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:electricity_phase_power',
        sectionId: 'main',
        categoryTitle: loc.electricityTitle,
        toolTitle: loc.electricityToolPhasePowerTitle,
        icon: Icons.electrical_services,
        builder: (_) => const ElectricityPhasePowerPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:electricity_load_balancer',
        sectionId: 'main',
        categoryTitle: loc.electricityTitle,
        toolTitle: loc.electricityToolLoadBalancerTitle,
        icon: Icons.account_tree_outlined,
        builder: (_) => const ElectricityLoadBalancerPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:electricity_generator',
        sectionId: 'main',
        categoryTitle: loc.electricityTitle,
        toolTitle: loc.electricityToolGeneratorTitle,
        icon: Icons.electric_bolt,
        builder: (_) => const ElectricityGeneratorPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:electricity_power_factor',
        sectionId: 'main',
        categoryTitle: loc.electricityTitle,
        toolTitle: loc.electricityPowerFactorToolTitle,
        icon: Icons.sync_alt_rounded,
        builder: (_) => const ElectricityPowerFactorPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:electricity_power_plan',
        sectionId: 'main',
        categoryTitle: loc.electricityTitle,
        toolTitle: loc.electricityToolPowerPlanTitle,
        icon: Icons.schema_rounded,
        builder: (_) => const ElectricityPowerPlanPage(),
      ),

      // ── Laser ──────────────────────────────────────────────────────────
      ToolRefEntry(
        pageId: 'tool:laser_safety_zones',
        sectionId: 'main',
        categoryTitle: loc.homeLaserTitle,
        toolTitle: loc.homeLaserTitle,
        icon: Icons.shield_outlined,
        builder: (_) => const LaserPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:laser_beam_size',
        sectionId: 'main',
        categoryTitle: loc.homeLaserTitle,
        toolTitle: loc.laserBeamSizeTitle,
        icon: Icons.straighten,
        builder: (_) => const LaserBeamSizePage(),
      ),
      ToolRefEntry(
        pageId: 'tool:laser_catalog',
        sectionId: 'main',
        categoryTitle: loc.homeLaserTitle,
        toolTitle: loc.laserCatalogTitle,
        icon: Icons.menu_book_rounded,
        builder: (_) => const LaserCatalogPage(),
      ),

      // ── Console ────────────────────────────────────────────────────────
      ToolRefEntry(
        pageId: 'tool:console_virtual',
        sectionId: 'main',
        categoryTitle: loc.consoleTitle,
        toolTitle: loc.vconsoleTitle,
        icon: Icons.equalizer_rounded,
        builder: (_) => const VirtualConsolePage(),
      ),
      ToolRefEntry(
        pageId: 'tool:console_plugin_community',
        sectionId: 'main',
        categoryTitle: loc.consoleTitle,
        toolTitle: loc.pluginCommunity,
        icon: Icons.people_alt_rounded,
        builder: (_) => const PluginCommunityPage(),
      ),

      // ── Cinéma ─────────────────────────────────────────────────────────
      ToolRefEntry(
        pageId: 'tool:cinema_field_of_view',
        sectionId: 'main',
        categoryTitle: loc.cinemaTitle,
        toolTitle: loc.cinemaFieldOfViewTitle,
        icon: Icons.camera_alt_outlined,
        builder: (_) => const FieldOfViewPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:cinema_subject_distance',
        sectionId: 'main',
        categoryTitle: loc.cinemaTitle,
        toolTitle: loc.cinemaSubjectDistanceTitle,
        icon: Icons.person_pin_circle_outlined,
        builder: (_) => const SubjectDistancePage(),
      ),
      ToolRefEntry(
        pageId: 'tool:cinema_depth_of_field',
        sectionId: 'main',
        categoryTitle: loc.cinemaTitle,
        toolTitle: loc.cinemaDepthOfFieldTitle,
        icon: Icons.blur_on_outlined,
        builder: (_) => const DepthOfFieldPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:cinema_lens_equivalence',
        sectionId: 'main',
        categoryTitle: loc.cinemaTitle,
        toolTitle: loc.cinemaLensEquivalenceTitle,
        icon: Icons.aspect_ratio_outlined,
        builder: (_) => const LensEquivalencePage(),
      ),
      ToolRefEntry(
        pageId: 'tool:cinema_anamorphic',
        sectionId: 'main',
        categoryTitle: loc.cinemaTitle,
        toolTitle: loc.cinemaAnamorphicTitle,
        icon: Icons.crop_16_9_outlined,
        builder: (_) => const AnamorphicPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:cinema_shutter',
        sectionId: 'main',
        categoryTitle: loc.cinemaTitle,
        toolTitle: loc.cinemaShutterTitle,
        icon: Icons.shutter_speed_outlined,
        builder: (_) => const ShutterPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:cinema_flicker_free',
        sectionId: 'main',
        categoryTitle: loc.cinemaTitle,
        toolTitle: loc.cinemaFlickerTitle,
        icon: Icons.flash_on_outlined,
        builder: (_) => const FlickerFreePage(),
      ),
      ToolRefEntry(
        pageId: 'tool:cinema_nd_exposure',
        sectionId: 'main',
        categoryTitle: loc.cinemaTitle,
        toolTitle: loc.cinemaNdExposureTitle,
        icon: Icons.filter_b_and_w_outlined,
        builder: (_) => const NdExposurePage(),
      ),
      ToolRefEntry(
        pageId: 'tool:cinema_recording_storage',
        sectionId: 'main',
        categoryTitle: loc.cinemaTitle,
        toolTitle: loc.cinemaRecordingStorageTitle,
        icon: Icons.sd_storage_outlined,
        builder: (_) => const RecordingStoragePage(),
      ),
      ToolRefEntry(
        pageId: 'tool:cinema_timecode',
        sectionId: 'main',
        categoryTitle: loc.cinemaTitle,
        toolTitle: loc.cinemaTimecodeTitle,
        icon: Icons.timer_outlined,
        builder: (_) => const TimecodePage(),
      ),
      ToolRefEntry(
        pageId: 'tool:cinema_slow_motion',
        sectionId: 'main',
        categoryTitle: loc.cinemaTitle,
        toolTitle: loc.cinemaSlowMotionTitle,
        icon: Icons.slow_motion_video_outlined,
        builder: (_) => const SlowMotionPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:cinema_projection',
        sectionId: 'main',
        categoryTitle: loc.cinemaTitle,
        toolTitle: loc.cinemaProjectionTitle,
        icon: Icons.theaters_outlined,
        builder: (_) => const CinemaProjectionPage(),
      ),

      // ── Conversions ────────────────────────────────────────────────────
      ToolRefEntry(
        pageId: 'tool:conversions',
        sectionId: 'main',
        categoryTitle: loc.homeConversionsTitle,
        toolTitle: loc.conversionsTitle,
        icon: Icons.swap_horiz_rounded,
        builder: (_) => const ConversionsPage(),
      ),

      // ── BPM ────────────────────────────────────────────────────────────
      ToolRefEntry(
        pageId: 'tool:bpm',
        sectionId: 'main',
        categoryTitle: loc.homeBpmTitle,
        toolTitle: loc.bpmTitle,
        icon: Icons.speed_rounded,
        builder: (_) => const BpmPage(),
      ),

      // ── Vidéo ──────────────────────────────────────────────────────────
      ToolRefEntry(
        pageId: 'tool:video_lens_measure',
        sectionId: 'main',
        categoryTitle: loc.videoTitle,
        toolTitle: loc.videoLensMeasureTitle,
        icon: Icons.straighten,
        builder: (_) => const VideoLensMeasurePage(),
      ),
      ToolRefEntry(
        pageId: 'tool:video_brightness',
        sectionId: 'main',
        categoryTitle: loc.videoTitle,
        toolTitle: loc.videoBrightnessTitle,
        icon: Icons.brightness_6,
        builder: (_) => const VideoBrightnessPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:video_camera_exposure',
        sectionId: 'main',
        categoryTitle: loc.videoTitle,
        toolTitle: loc.videoCameraExposureTitle,
        icon: Icons.videocam,
        builder: (_) => const VideoCameraExposurePage(),
      ),
      ToolRefEntry(
        pageId: 'tool:video_multiprojecteur',
        sectionId: 'main',
        categoryTitle: loc.videoTitle,
        toolTitle: loc.videoMultiprojectorTitle,
        icon: Icons.grid_on,
        builder: (_) => const VideoMultiprojecteurPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:video_led',
        sectionId: 'main',
        categoryTitle: loc.videoTitle,
        toolTitle: loc.videoLedTitle,
        icon: Icons.view_quilt,
        builder: (_) => const VideoLedPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:video_mire_ecran_video',
        sectionId: 'main',
        categoryTitle: loc.videoTitle,
        toolTitle: loc.videoMireScreenVideoTitle,
        icon: Icons.videocam,
        builder: (_) => const MireEcranVideoPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:video_mire_ecran_led',
        sectionId: 'main',
        categoryTitle: loc.videoTitle,
        toolTitle: loc.videoMireScreenLedTitle,
        icon: Icons.view_quilt,
        builder: (_) => const MireEcranLedPage(),
      ),

      // ── Réseau ─────────────────────────────────────────────────────────
      ToolRefEntry(
        pageId: 'tool:network_scan',
        sectionId: 'main',
        categoryTitle: loc.networkPageTitle,
        toolTitle: loc.networkScanTitle,
        icon: Icons.radar_rounded,
        builder: (_) => const NetworkScanPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:network_ping',
        sectionId: 'main',
        categoryTitle: loc.networkPageTitle,
        toolTitle: loc.pingTitle,
        icon: Icons.network_ping,
        builder: (_) => const PingPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:network_my_ip',
        sectionId: 'main',
        categoryTitle: loc.networkPageTitle,
        toolTitle: loc.myIpTitle,
        icon: Icons.perm_device_information_rounded,
        builder: (_) => const MyIpPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:network_poe_budget',
        sectionId: 'main',
        categoryTitle: loc.networkPageTitle,
        toolTitle: loc.networkPoeTitle,
        icon: Icons.power_rounded,
        builder: (_) => const NetworkPoeBudgetPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:network_fiber_budget',
        sectionId: 'main',
        categoryTitle: loc.networkPageTitle,
        toolTitle: loc.networkFiberTitle,
        icon: Icons.cable_rounded,
        builder: (_) => const NetworkFiberBudgetPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:network_subnet',
        sectionId: 'main',
        categoryTitle: loc.networkPageTitle,
        toolTitle: loc.networkSubnetTitle,
        icon: Icons.lan_rounded,
        builder: (_) => const NetworkSubnetCalculatorPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:network_dashboard',
        sectionId: 'main',
        categoryTitle: loc.networkPageTitle,
        toolTitle: loc.dashboardPageTitle,
        icon: Icons.dashboard_rounded,
        builder: (_) => const NetworkDashboardPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:network_artnet_viewer',
        sectionId: 'main',
        categoryTitle: loc.networkPageTitle,
        toolTitle: loc.artnetTitle,
        icon: Icons.broadcast_on_personal_rounded,
        builder: (_) => const ArtNetViewerPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:network_artnet_addressing',
        sectionId: 'main',
        categoryTitle: loc.networkPageTitle,
        toolTitle: loc.networkArtNetAddressingTitle,
        icon: Icons.pin_rounded,
        builder: (_) => const NetworkArtNetAddressingPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:network_sacn_viewer',
        sectionId: 'main',
        categoryTitle: loc.networkPageTitle,
        toolTitle: loc.sacnTitle,
        icon: Icons.hub_rounded,
        builder: (_) => const SacnViewerPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:network_ndi_discovery',
        sectionId: 'main',
        categoryTitle: loc.networkPageTitle,
        toolTitle: loc.ndiPageTitle,
        icon: Icons.videocam_rounded,
        builder: (_) => const NdiDiscoveryPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:network_diagnostic',
        sectionId: 'main',
        categoryTitle: loc.networkPageTitle,
        toolTitle: loc.diagPageTitle,
        icon: Icons.monitor_heart_rounded,
        builder: (_) => const NetworkDiagnosticPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:network_snapshot_list',
        sectionId: 'main',
        categoryTitle: loc.networkPageTitle,
        toolTitle: loc.snapshotPageTitle,
        icon: Icons.compare_arrows_rounded,
        builder: (_) => const SnapshotListPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:network_luminex_monitor',
        sectionId: 'main',
        categoryTitle: loc.networkPageTitle,
        toolTitle: loc.luminexPageTitle,
        icon: Icons.router_rounded,
        builder: (_) => const LuminexMonitorPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:network_manet_monitor',
        sectionId: 'main',
        categoryTitle: loc.networkPageTitle,
        toolTitle: loc.manetPageTitle,
        icon: Icons.wifi_tethering_rounded,
        builder: (_) => const MaNetMonitorPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:network_broadcast_bandwidth',
        sectionId: 'main',
        categoryTitle: loc.networkPageTitle,
        toolTitle: loc.bwBroadcastPageTitle,
        icon: Icons.radio_button_checked_rounded,
        builder: (_) => const BroadcastBandwidthPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:network_snmp_ports',
        sectionId: 'main',
        categoryTitle: loc.networkPageTitle,
        toolTitle: loc.bwSnmpPageTitle,
        icon: Icons.device_hub_rounded,
        builder: (_) => const SnmpPortsPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:network_rdm',
        sectionId: 'main',
        categoryTitle: loc.networkPageTitle,
        toolTitle: loc.rdmPageTitle,
        icon: Icons.settings_remote_rounded,
        builder: (_) => const RdmPage(),
      ),

      // ── Lumière ────────────────────────────────────────────────────────
      ToolRefEntry(
        pageId: 'tool:lumiere_projection',
        sectionId: 'main',
        categoryTitle: loc.homeLightTitle,
        toolTitle: loc.lightProjectionTitle,
        icon: Icons.zoom_out_map,
        builder: (_) => const ProjectionPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:lumiere_dipswitch',
        sectionId: 'main',
        categoryTitle: loc.homeLightTitle,
        toolTitle: loc.lightDmxSwitchTitle,
        icon: Icons.dialpad,
        builder: (_) => const DipSwitchPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:lumiere_filter_correspondence',
        sectionId: 'main',
        categoryTitle: loc.homeLightTitle,
        toolTitle: loc.filterCorrespondenceTitle,
        icon: Icons.compare_arrows,
        builder: (_) => const FilterCorrespondencePage(),
      ),
      ToolRefEntry(
        pageId: 'tool:lumiere_photometry',
        sectionId: 'main',
        categoryTitle: loc.homeLightTitle,
        toolTitle: loc.lightPhotometryTitle,
        icon: Icons.brightness_high,
        builder: (_) => const PhotometryPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:lumiere_light_exposure_meter',
        sectionId: 'main',
        categoryTitle: loc.homeLightTitle,
        toolTitle: loc.lightExposureMeterTitle,
        icon: Icons.wb_sunny_rounded,
        builder: (_) => const LightExposureMeterPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:lumiere_filter_led',
        sectionId: 'main',
        categoryTitle: loc.homeLightTitle,
        toolTitle: loc.lightFilterLedTitle,
        icon: Icons.palette,
        builder: (_) => const FilterLedPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:lumiere_cct_filter',
        sectionId: 'main',
        categoryTitle: loc.homeLightTitle,
        toolTitle: loc.cctFilterTitle,
        icon: Icons.thermostat,
        builder: (_) => const ColorTemperatureFilterPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:lumiere_fixture_catalog',
        sectionId: 'main',
        categoryTitle: loc.homeLightTitle,
        toolTitle: loc.lightCatalogTitle,
        icon: Icons.list_alt,
        builder: (_) => const FixtureCatalogPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:lumiere_fixture_compare',
        sectionId: 'main',
        categoryTitle: loc.homeLightTitle,
        toolTitle: loc.fxCmpTitle,
        icon: Icons.compare_rounded,
        builder: (_) => const FixtureComparePage(),
      ),
      ToolRefEntry(
        pageId: 'tool:lumiere_diaph',
        sectionId: 'main',
        categoryTitle: loc.homeLightTitle,
        toolTitle: loc.diaphTitle,
        icon: Icons.camera_rounded,
        builder: (_) => const DiaphPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:lumiere_patch_mvr_import',
        sectionId: 'main',
        categoryTitle: loc.homeLightTitle,
        toolTitle: loc.patchMvrTitle,
        icon: Icons.upload_file,
        builder: (_) => const PatchMvrImportPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:console_ma3_params',
        sectionId: 'main',
        categoryTitle: loc.consoleTitle,
        toolTitle: loc.ma3CalcTitle,
        icon: Icons.calculate_rounded,
        builder: (_) => const Ma3ParamCalculatorPage(),
      ),
      ToolRefEntry(
        pageId: 'tool:lumiere_gdtf_builder',
        sectionId: 'main',
        categoryTitle: loc.homeLightTitle,
        toolTitle: loc.consoleGdtfTitle,
        icon: Icons.construction,
        builder: (_) => const GdtfBuilderSimplePage(),
      ),
    ];
  }
}

class ToolRefEntry {
  const ToolRefEntry({
    required this.pageId,
    required this.sectionId,
    required this.categoryTitle,
    required this.toolTitle,
    required this.icon,
    required this.builder,
  });

  final String pageId;
  final String sectionId;
  final String categoryTitle;
  final String toolTitle;
  final IconData icon;
  final WidgetBuilder builder;
}
