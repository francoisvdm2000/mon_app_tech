// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get aboutArtNetSubtitle =>
      'DMX universe over Ethernet/UDP, nodes, broadcast vs. unicast.\nReal-world limits, network stability, hardware-dependent RDM.';

  @override
  String get aboutArtNetTitle =>
      'Art-Net - DMX over IP (nodes, unicast/broadcast)';

  @override
  String get aboutCablingFiberSubtitle =>
      'Cat5e→Cat8, OM3/OM4/OS2 fiber, LC/SC/MPO, typical distances, show best practices.';

  @override
  String get aboutCablingFiberTitle =>
      'Network - RJ45 / Fiber / speeds & lengths';

  @override
  String get aboutComputingSubtitle =>
      'Useful flow rates, versions, real limits, marketing pitfalls.';

  @override
  String get aboutComputingTitle =>
      'Computers - USB / HDMI / DP / SATA / NVMe...';

  @override
  String get aboutDmxSubtitle =>
      'Universe, addresses, frames, RS-485 wiring, termination, field errors.\nIncludes schematics + checklist.';

  @override
  String get aboutDmxTitle => 'DMX';

  @override
  String get aboutElectricitySubtitle =>
      'Connectors, mono/tri, fast kW panels (16A→400A), field traps.';

  @override
  String get aboutElectricityTitle =>
      'Electrical - Schuko / P17 / power ratings';

  @override
  String get aboutIpBasicsSubtitle =>
      'Understanding IP, mask, gateway, DHCP vs. static.\nConcrete examples (2.x, 10.x, 192.168.x) + checklist.';

  @override
  String get aboutIpBasicsTitle => 'IP bases';

  @override
  String get aboutLightNetworkSubtitle =>
      'Simple and robust architecture for Art-Net/sACN.\nVLAN, IGMP snooping/query, Wi-Fi (jitter), switches, schematics + checklist.';

  @override
  String get aboutLightNetworkTitle =>
      'Light network - VLAN, IGMP, Wi-Fi vs. wired';

  @override
  String get aboutSacnSubtitle =>
      'Pro\" network-oriented DMX-over-IP standard.\nMulticast/unicast, IGMP snooping/query, multi-source priorities.';

  @override
  String get aboutSacnTitle => 'sACN';

  @override
  String get aboutVideoSubtitle =>
      'Choose according to latency, reliability, cabling, LAN vs WAN.\nTables + diagram.';

  @override
  String get aboutVideoTitle => 'Video';

  @override
  String get appTitle => 'My Tech App';

  @override
  String catalogDmxModeItem(Object channels, Object name) {
    return '$name - $channels channels';
  }

  @override
  String catalogDmxModeTitle(Object count) {
    return 'DMX mode ($count)';
  }

  @override
  String get catalogInfoDmxChannels => 'DMX channels';

  @override
  String get catalogInfoLuminousFlux => 'Luminous flux';

  @override
  String get catalogInfoPower => 'Power';

  @override
  String get catalogInfoWeight => 'Weight';

  @override
  String catalogLastUpdate(Object date) {
    return 'Last update : $date';
  }

  @override
  String catalogManufacturerTitle(Object count) {
    return 'Builder ($count)';
  }

  @override
  String catalogModelTitle(Object count) {
    return 'Model ($count)';
  }

  @override
  String get catalogNotProvided => 'No information';

  @override
  String get catalogOpenDmxChart => 'Open DMX table';

  @override
  String get catalogOpenManual => 'Open manual';

  @override
  String get catalogResetTooltip => 'Reset';

  @override
  String catalogSyncError(Object message) {
    return 'Error: $message';
  }

  @override
  String catalogSyncFailed(Object reason) {
    return 'Synchronization failure: $reason';
  }

  @override
  String get catalogSyncFailedUnknown =>
      'Synchronization failure (reason unknown).';

  @override
  String catalogTypeTitle(Object count) {
    return 'Type ($count)';
  }

  @override
  String get catalogUpdateTooltip => 'Update';

  @override
  String get catalogUpdated => 'Updated catalog.';

  @override
  String get commonCalculate => 'Calculate';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonCopyResultTooltip => 'Copy result';

  @override
  String get commonDash => '-';

  @override
  String get commonNone => 'No registration';

  @override
  String get commonOk => 'Okay';

  @override
  String get commonOkWithCheck => 'Okay ✅';

  @override
  String get commonRename => 'Rename';

  @override
  String get commonReset => 'Reset';

  @override
  String get commonSave => 'Register';

  @override
  String get commonSearch => 'Search';

  @override
  String get commonTooLowWithCross => 'Too low ❌';

  @override
  String get commonUnitMeter => 'm';

  @override
  String get consentsReset => 'Consents reset.';

  @override
  String get dipSwitchAddressHint => 'Ex: 1 to 512';

  @override
  String get dipSwitchAddressLabel => 'DMX address';

  @override
  String get dipSwitchChannelUnit => 'channel';

  @override
  String get dipSwitchEndOfUniverseWarning =>
      'Warning: end of DMX universe reached.';

  @override
  String get dipSwitchInputsTitle => 'Inputs';

  @override
  String get dipSwitchIntervalHint => 'Ex : 4 (channels)';

  @override
  String get dipSwitchIntervalLabel => 'Interval';

  @override
  String get dipSwitchModeAddressDirect => 'Direct address';

  @override
  String get dipSwitchModeAddressMinusOne => 'Address - 1';

  @override
  String get dipSwitchNextAddressButton => 'Address';

  @override
  String get dipSwitchOffLabel => 'OFF';

  @override
  String get dipSwitchOnLabel => 'ON';

  @override
  String get dipSwitchResetTooltip => 'Reset';

  @override
  String dipSwitchResultAddressLine(Object address) {
    return 'Address : $address';
  }

  @override
  String get dipSwitchResultAddressNotProvided => 'Address not given';

  @override
  String dipSwitchResultBinaryValueLine(Object binary) {
    return 'Binary : $binary';
  }

  @override
  String get dipSwitchResultHeader => 'Results';

  @override
  String dipSwitchResultIntervalLine(Object end, Object start) {
    return 'Interval: $start → $end';
  }

  @override
  String dipSwitchResultModeLine(Object mode) {
    return 'Mode: $mode';
  }

  @override
  String get dipSwitchScrollHint => 'Scroll to see all the switches.';

  @override
  String get dipSwitchSectionTitle => 'Switches';

  @override
  String get dipSwitchSummaryTitle => 'Summary';

  @override
  String dipSwitchSwitchLabel(Object index) {
    return 'Switch $index';
  }

  @override
  String get dipSwitchUseAddressMinusOneLabel => 'Use Address mode - 1';

  @override
  String get disclaimerAccept => 'I accept';

  @override
  String get disclaimerCertify =>
      'I certify that I have read and accepted these conditions.';

  @override
  String get disclaimerText =>
      'FOR INFORMATION PURPOSES ONLY\n\nThe calculations provided by this application (video, light, laser) are for information purposes only.\nUnder no circumstances do they replace :\n- certified calculations,\n- technical studies,\n- official standards in force,\n- or validation by a qualified professional.\n\nLIABILITY\nThe editor of this application cannot be held responsible for calculation errors, omissions, material damage,\npersonal injury, or any incident arising from the installation, operation or use of the equipment.\n\nVIDEO & PROJECTION\nResults (sizes, ratios, brightness, overlaps, etc.) are based on theoretical models and may vary according to :\noptics, zoom, uniformity, lighting environment, support, settings, etc.\nAlways check with official manufacturer documentation.\n\nLIGHT\nCalculations are indicative and do not take into account all actual conditions (tolerances, optical losses,\nsource degradation, local standards, ambient conditions, etc.).\n\nLASER - SAFETY\nNOHD, SZED and CZED calculations are based on standard assumptions and theoretical thresholds.\nIn particular, they do not take into account\n- optical instruments (binoculars, cameras, telescopes, etc.),\n- atmospheric conditions (fog, rain, dust...),\n- unforeseen reflections, misuse, specific settings.\nThe use of a laser system implies direct responsibility on the part of the operator, and an appropriate risk analysis.\n\nRISK ACCEPTANCE\nBy using this application, the user acknowledges :\n- he/she is aware of the applicable safety regulations,\n- he/she is solely responsible for his/her installations,\n- assume full responsibility for risks associated with the use of equipment (video, light, laser),\n- systematically check data with official manufacturers\' manuals.';

  @override
  String get disclaimerTitle => '⚠️ LEGAL NOTICE & DISCLAIMER';

  @override
  String get homeLaserSubtitle =>
      'Calculations and laser safety (consent required for each entry).';

  @override
  String get homeLaserTitle => 'Laser';

  @override
  String get homeLightSubtitle =>
      'Projection size, DMX dip-switch, photometry, catalog, DMX patch.';

  @override
  String get homeLightTitle => 'Light';

  @override
  String get homeReferencesSubtitle =>
      'DMX / network / video: data sheets & benchmarks in the field.';

  @override
  String get homeReferencesTitle => 'References';

  @override
  String get homeTitle => 'Home';

  @override
  String get homeVideoSubtitle =>
      'Lens & metering, brightness, multi-projector, LED and test patterns.';

  @override
  String get homeVideoTitle => 'Video';

  @override
  String get language => 'Language';

  @override
  String get languageSystem => 'System (automatic)';

  @override
  String get languageSystemCurrent => 'Phone language';

  @override
  String get laserAdviceFullPower => 'Full authorized power (100%)';

  @override
  String laserAdviceMaxRecommended(Object percent) {
    return 'Recommended maximum power : $percent';
  }

  @override
  String get laserConsentCheckboxLabel => 'I accept and understand the risks.';

  @override
  String get laserConsentContinue => 'Continue';

  @override
  String get laserConsentText =>
      'ACCESS TO THE LASER SECTION\n\nThe LASER part of this application concerns safety calculations (e.g. NOHD, SZED, CZED).\nThese calculations are indicative and do not replace :\n- a risk analysis,\n- current standards,\n- operating procedures,\n- nor validation by a qualified person.\n\nIMPORTANT\n- Risk of eye/skin damage in the event of misuse.\n- The calculation may be incorrect if the parameters entered are incomplete or erroneous, or if the actual context differs (optics, atmospheric conditions, reflections, alignment, etc.),\n  atmospheric conditions, reflections, alignment, etc.).\n- The operator is solely responsible for installation, operation and compliance.\n\nBy validating, you confirm that you :\n- understand the risks,\n- comply with applicable safety regulations,\n- assume full responsibility in the event of negligence or misuse.';

  @override
  String get laserConsentTitle => '🔴 LASER CONSENT (MANDATORY)';

  @override
  String get laserDiameterHint => 'eg: 3.0';

  @override
  String get laserDiameterLabel => 'Output diameter (mm)';

  @override
  String get laserDisclaimerShort =>
      'Indicative calculation. Does not replace a laser safety analysis.';

  @override
  String get laserDivergenceHint => 'ex: 1.2';

  @override
  String get laserDivergenceLabel => 'Divergence (mrad)';

  @override
  String get laserInputsTitle => 'Inputs';

  @override
  String get laserInvalidInputs =>
      'Please enter a valid power, divergence and diameter.';

  @override
  String get laserNameUpdated => 'Name updated.';

  @override
  String get laserNormativeParamsBody =>
      'MEP for Nominal Ocular Hazard Distance (NOHD): 25.4 W/m².\n(IEC 60825-1 standard, edition 3.0)\n\nMEP for Sensitive Zone Exposure Distance (SZED): 1 W/m²\n(ANSI Z136.6 standard)\n\nEMI for Critical Zone Exposure Distance (CZED): 0.05 W/m².\n(ANSI Z136.6 standard)';

  @override
  String get laserNormativeParamsTitle => 'Selected safety parameters';

  @override
  String get laserPowerHint => 'ex: 5000';

  @override
  String get laserPowerLabel => 'Power (mW)';

  @override
  String get laserPresetAdded => 'Recording added.';

  @override
  String get laserPresetDeleted => 'Record deleted.';

  @override
  String laserPresetSubtitle(Object diam, Object div, Object p) {
    return 'P: $p mW - Div: $div mrad - Ø: $diam mm';
  }

  @override
  String get laserProjectorNameLabel => 'Projector name';

  @override
  String get laserRenameProjectorTitle => 'Rename projector';

  @override
  String get laserSafetyResultsTitle => 'Safety results';

  @override
  String get laserSaveCurrentProjector => 'Register this projector';

  @override
  String get laserSaveProjectorTitle => 'Registering a projector';

  @override
  String get laserSavedProjectorsTitle => 'Registered projectors';

  @override
  String get laserSearchHint => 'e.g. \"RGB 5W';

  @override
  String get laserTargetDistanceHint => 'e.g.: 10';

  @override
  String get laserTargetDistanceLabel => 'Target distance (m)';

  @override
  String get laserZoneCzedDesc => 'Critical zone';

  @override
  String get laserZoneNohdDesc => 'Eye hazard';

  @override
  String get laserZoneSzedDesc => 'Sensitive area';

  @override
  String get legalNotices => 'Terms of use';

  @override
  String get lightCatalogDescription =>
      'Selection by manufacturer, type and product, with information and manual.';

  @override
  String get lightCatalogTitle => 'Lighting catalogue';

  @override
  String get lightDisclaimerShort =>
      'Indicative tools. Always check the manufacturer\'s documentation.';

  @override
  String get lightDmxSwitchDescription =>
      'Indicative conversion between DMX address and switches, with interval navigation.';

  @override
  String get lightDmxSwitchTitle => 'Dip-switch DMX';

  @override
  String get lightPatchDescription => 'Import and view an MVR file.';

  @override
  String get lightPatchTitle => 'DMX patch';

  @override
  String get lightPhotometryDescription =>
      'Indicative conversions between lux, candela and lumen, with distance and angle.';

  @override
  String get lightPhotometryTitle => 'Photometry';

  @override
  String get lightExposureMeterTitle => 'Exposure meter (lux)';

  @override
  String get lightExposureMeterDescription =>
      'Calculates illuminance in lux from a camera\'s ISO / aperture / shutter settings.';

  @override
  String get lightExposureMeterIsoLabel => 'ISO sensitivity';

  @override
  String get lightExposureMeterApertureLabel => 'Aperture';

  @override
  String get lightExposureMeterShutterLabel => 'Shutter speed';

  @override
  String get lightExposureMeterShutterDenomLabel =>
      'Speed (denominator, 1/x s)';

  @override
  String get lightExposureMeterResultTitle => 'Estimated illuminance';

  @override
  String get lightExposureMeterReferenceTitle => 'Illuminance reference';

  @override
  String get lightExposureMeterRefMoonlight => 'Moonlight';

  @override
  String get lightExposureMeterRefDimStage => 'Dimly lit stage';

  @override
  String get lightExposureMeterRefOffice => 'Office';

  @override
  String get lightExposureMeterRefOvercast => 'Overcast daylight (outdoor)';

  @override
  String get lightExposureMeterRefFollowSpot =>
      'Follow spot / profile on stage';

  @override
  String get lightExposureMeterRefSunlight => 'Direct sunlight';

  @override
  String get lightExposureMeterFormulaNote =>
      'Lux = (N² × 250 × 1/t) / ISO — incident-light meter method. Read the values from the camera (manual mode or EXIF info).';

  @override
  String get lightProjectionDescription =>
      'Indicative spot size calculation based on angle, distance and diameter.';

  @override
  String get lightProjectionTitle => 'Projection size';

  @override
  String get menuTitle => 'Menu';

  @override
  String get homeGreetingMorning => 'Good morning';

  @override
  String get homeGreetingAfternoon => 'Good afternoon';

  @override
  String get homeGreetingEvening => 'Good evening';

  @override
  String get homeGreetingTagline => 'All your show-tech tools, ready to go.';

  @override
  String get mireBlendLabel => 'BLEND';

  @override
  String get mireDash => '-';

  @override
  String get mireErrInvalidOverlap => '❌ Invalid overlap (0 to 99.9).';

  @override
  String get mireErrInvalidProjectors =>
      '❌ Number of projectors invalid (N > 0).';

  @override
  String get mireErrInvalidWHpx => '❌ Invalid width/height (px).';

  @override
  String get mireExportPng => 'Export PNG';

  @override
  String get mireHeightPxHint => 'eg: 1080';

  @override
  String get mireHeightPxHintMapping => 'ex: 2160';

  @override
  String get mireHeightPxLabel => 'Height (px)';

  @override
  String get mireLedErrTileCm => '❌ Enter Tile cm (width/height >0).';

  @override
  String get mireLedErrTilePx => '❌ Informs Tile px (width/height >0).';

  @override
  String get mireLedErrTilesXY => '❌ Enter Tiles X/Y (>0).';

  @override
  String get mireLedParamsTitle => 'LED wall settings';

  @override
  String mireLedPitchComputed(Object pitch) {
    return 'Pitch calculated: $pitch';
  }

  @override
  String get mireLedSubtitleColorBars => 'Bars + ramps + circles';

  @override
  String get mireLedSubtitleGridLabels => 'Grid + markers + circles';

  @override
  String get mireLedSubtitlePixelPerfect => 'Pixel perfect + circles';

  @override
  String get mireLedSubtitleUniformity => 'Uniformity + circles';

  @override
  String get mireLedTileHcmLabel => 'Tile height (cm)';

  @override
  String get mireLedTileHpxLabel => 'Tile height (px)';

  @override
  String get mireLedTileWcmLabel => 'Tile width (cm)';

  @override
  String get mireLedTileWpxLabel => 'Tile width (px)';

  @override
  String get mireLedTilesIdTitle => 'LED / ID TILES';

  @override
  String get mireLedTilesXLabel => 'Horizontal tiles (X)';

  @override
  String get mireLedTilesYLabel => 'Vertical tiles (Y)';

  @override
  String get mireLedTitle => 'LED / MARK';

  @override
  String get mireLedTypeColorBars => 'Bars + ramps + circles';

  @override
  String get mireLedTypeGridLabels => 'Grid + markers + circles';

  @override
  String get mireLedTypePixelPerfect => 'Pixel perfect + circles';

  @override
  String get mireLedTypeTilesId => 'Tiles ID (number + colors)';

  @override
  String get mireLedTypeUniformity => 'Uniformity + circles';

  @override
  String mireLedWallResolution(Object h, Object w) {
    return 'Wall resolution: $w × $h px';
  }

  @override
  String get mireLedWarnPitchOutOfRange =>
      '⚠️ Pitch calculated out of range (0.5-20 mm). Check Tile cm / px.';

  @override
  String get mireLedWarnPitchXNotY =>
      '⚠️ Pitch X ≠ Pitch Y (non-homogeneous tile). Check dimensions cm and px.';

  @override
  String get mireMappingSectionTitle => 'Multi-projector mapping test pattern';

  @override
  String mireMappingSubtitlePattern(Object n, Object orient, Object percent) {
    return 'N=$n - Overlap $percent% - $orient';
  }

  @override
  String get mireMappingTypeBlendRamps => 'Blend ramps';

  @override
  String get mireMappingTypeCombo => 'Combo (zones + overlap + blend)';

  @override
  String get mireMappingTypeLabel => 'Type mapping';

  @override
  String get mireMappingTypeZonesOverlap => 'Zones + overlap';

  @override
  String get mireOrientationHorizontal => 'Horizontal';

  @override
  String get mireOrientationLabel => 'Orientation';

  @override
  String get mireOrientationVertical => 'Vertical';

  @override
  String get mireOverlapHint => 'eg: 10.0';

  @override
  String get mireOverlapLabel => 'Overlap (%)';

  @override
  String mirePitchEqual(Object value) {
    return '$value mm';
  }

  @override
  String mirePitchXY(Object x, Object y) {
    return 'X $x mm - Y $y mm';
  }

  @override
  String mireProjectorLabelPattern(Object index) {
    return 'PROJO $index';
  }

  @override
  String get mireProjectorsNHint => 'ex: 2';

  @override
  String get mireProjectorsNLabel => 'Number of spotlights (N)';

  @override
  String get mireSimpleSectionTitle => 'Single screen test pattern';

  @override
  String get mireSimpleSubtitleCheckerboard => 'Checkerboard + circles';

  @override
  String get mireSimpleSubtitleColorBars => 'Bars + ramps + circles';

  @override
  String get mireSimpleSubtitleComboAll =>
      'Grid + safe + 2 centered bars + circles';

  @override
  String get mireSimpleSubtitleGridSafe => 'Grid + safe + circles';

  @override
  String get mireSimpleSubtitleUniformity => 'Uniformity + circles';

  @override
  String get mireSimpleTypeCheckerboard => 'Checkerboard + circles';

  @override
  String get mireSimpleTypeColorBars => 'Bars + ramps + circles';

  @override
  String get mireSimpleTypeComboAll =>
      'Combo (grid + circles + 2 centered bars)';

  @override
  String get mireSimpleTypeGridSafe => 'Grid + safe + circles';

  @override
  String get mireSimpleTypeUniformity => 'Uniformity + circles';

  @override
  String get mireTileMissingPx => 'Enter Tile (px) for numbering.';

  @override
  String mireTilesSubtitleBase(Object nx, Object ny, Object th, Object tw) {
    return 'Tile ${tw}x$th px - Grille $nx x $ny';
  }

  @override
  String mireTilesSubtitlePitchEq(Object pitch) {
    return 'Pitch ~ $pitch mm';
  }

  @override
  String mireTilesSubtitlePitchXY(Object px, Object py) {
    return 'Pitch X $px - Y $py mm';
  }

  @override
  String mireTilesSubtitleTilePhys(Object hcm, Object wcm) {
    return 'Tile $wcm×$hcm cm';
  }

  @override
  String mireTilesSubtitleWallPhys(Object hm, Object wm) {
    return 'Wall ~ $wm×$hm m';
  }

  @override
  String get mireTypeLabel => 'Sight type';

  @override
  String get mireVideoComboTitle => 'VIDEO / COMBO SIGHT';

  @override
  String get mireVideoMappingSectionTitle =>
      'Multi-projector mapping test pattern';

  @override
  String get mireVideoMappingTitle => 'VIDEO / TEST PATTERN MAPPING';

  @override
  String get mireVideoSimpleSectionTitle => 'Single screen test pattern';

  @override
  String get mireVideoSimpleTitle => 'VIDEO / SINGLE TEST PATTERN';

  @override
  String get mireVideoTypeCheckerboard => 'Checkerboard + circles';

  @override
  String get mireVideoTypeColorBars => 'Bars + ramps + circles';

  @override
  String get mireVideoTypeCombo => 'Combo (grid + circles + 2 centered bars)';

  @override
  String get mireVideoTypeGridSafe => 'Grid + safe + circles';

  @override
  String get mireVideoTypeUniformity => 'Uniformity + circles';

  @override
  String get mireWallNotMultipleOfTiles => 'NON-MULTIPLE TILE WALL';

  @override
  String get mireWidthPxHint => 'e.g.: 1920';

  @override
  String get mireWidthPxHintMapping => 'ex: 3840';

  @override
  String get mireWidthPxLabel => 'Width (px)';

  @override
  String patchAddressLabel(Object address) {
    return 'Address : $address';
  }

  @override
  String patchChannelsUsed(Object count) {
    return 'Channels used : $count / 512';
  }

  @override
  String get patchConflictError => 'Address conflict (overlap).';

  @override
  String get patchConflictShort => 'Conflict';

  @override
  String patchConflicts(Object count) {
    return 'Conflicts : $count';
  }

  @override
  String get patchEditChannelsLabel => 'Channels';

  @override
  String get patchEditHint => 'Checks mode and number of channels.';

  @override
  String get patchEditModeLabel => 'Fashion';

  @override
  String get patchEditTitle => 'Edition';

  @override
  String get patchEmptyUniverse => 'No machines in this universe.';

  @override
  String patchFixturesCount(Object count) {
    return 'Machines: $count';
  }

  @override
  String get patchHomeDisclaimer =>
      'The results are indicative. Always check with the console.';

  @override
  String get patchHomeImportMvrDescription =>
      'Analyze an MVR file and load the patch as a reference.';

  @override
  String get patchHomeImportMvrTitle => 'Import MVR';

  @override
  String get patchHomeTitle => 'DMX patch';

  @override
  String get patchHomeViewPatchDescription => 'List and conflicts by universe.';

  @override
  String get patchHomeViewPatchTitle => 'See the patch';

  @override
  String get patchHubOpenGridButton => 'Open grid';

  @override
  String get patchHubOpenMvrButton => 'Open MVR';

  @override
  String get patchHubStateEmpty => 'No reference loaded.';

  @override
  String patchHubStateLoaded(Object count) {
    return 'Responsible : $count universe';
  }

  @override
  String get patchHubStateTitle => 'Status';

  @override
  String get patchHubTitle => 'Hub Patch';

  @override
  String get patchHubWorksiteBody =>
      'Import an MVR or consult the occupancy grid.';

  @override
  String get patchHubWorksiteTitle => 'Shipyard';

  @override
  String get patchInvalidChannelCount => 'Invalid number of channels.';

  @override
  String get patchIssueInvalidChannelCount =>
      'The number of channels must be greater than or equal to 1.';

  @override
  String get patchIssueInvalidStartAddress =>
      'DMX address must be between 1 and 512.';

  @override
  String get patchIssueInvalidUniverse =>
      'The universe must be greater than or equal to 1.';

  @override
  String get patchIssueRangeExceedsUniverse =>
      'The channel range exceeds 512 in this universe.';

  @override
  String get patchIssueUnknown => 'Unknown error.';

  @override
  String get patchListTitle => 'List';

  @override
  String get patchManualDisabledBody =>
      'The patch is read-only when an MVR reference is loaded.';

  @override
  String get patchManualDisabledTitle => 'Off';

  @override
  String get patchManualTitle => 'Manual patch';

  @override
  String patchModeLabel(Object mode) {
    return 'Mode: $mode';
  }

  @override
  String get patchMvrButtonAnalyzing => 'Analysis...';

  @override
  String get patchMvrButtonLoadAsReference => 'Load as reference';

  @override
  String get patchMvrButtonPickFile => 'Choose a file';

  @override
  String get patchMvrClearTooltip => 'Delete';

  @override
  String get patchMvrColAddress => 'Address';

  @override
  String get patchMvrColChannels => 'Channels';

  @override
  String get patchMvrColId => 'ID';

  @override
  String get patchMvrColName => 'Name';

  @override
  String get patchMvrColUniverse => 'Universe';

  @override
  String get patchMvrColumnsHint =>
      'Columns: ID, Name, Universe, Address, Channels';

  @override
  String get patchMvrFileCardHelp =>
      'Selects an .mvr (ZIP) file for patch analysis.';

  @override
  String get patchMvrFileCardTitle => 'File';

  @override
  String get patchMvrFilterAllUniverses => 'All universes';

  @override
  String get patchMvrFilterUniverseLabel => 'Filter by universe';

  @override
  String get patchMvrModeNotProvided => 'Mode not specified';

  @override
  String get patchMvrOrderAsc => 'Crescent';

  @override
  String get patchMvrOrderDesc => 'Descending';

  @override
  String get patchMvrOrderLabel => 'Order';

  @override
  String get patchMvrSortAddress => 'Address';

  @override
  String get patchMvrSortByLabel => 'Sort by';

  @override
  String get patchMvrSortChannels => 'Channels';

  @override
  String get patchMvrSortId => 'ID';

  @override
  String get patchMvrSortName => 'Name';

  @override
  String get patchMvrSortUniverse => 'Universe';

  @override
  String get patchMvrSortUniverseThenAddress => 'Universe then address';

  @override
  String get patchMvrStatusCleared => 'Reference deleted.';

  @override
  String get patchMvrStatusEmptyBytes => 'Empty file.';

  @override
  String get patchMvrStatusExtractingZip => 'ZIP extraction...';

  @override
  String patchMvrStatusFilePickFailed(Object reason) {
    return 'File selection not possible: $reason';
  }

  @override
  String patchMvrStatusFixturesFound(int count, int resolved) {
    return 'Machines found: $count (multi-channel: $resolved).';
  }

  @override
  String get patchMvrStatusLoadingGdtf => 'Loading GDTF...';

  @override
  String get patchMvrStatusNoContentToLoad => 'No content to load.';

  @override
  String get patchMvrStatusNoFileSelected => 'No files selected.';

  @override
  String get patchMvrStatusNoUsableFixtures => 'No usable machines found.';

  @override
  String patchMvrStatusParseError(Object message) {
    return 'Parsing error: $message';
  }

  @override
  String get patchMvrStatusParsingContent => 'Content analysis...';

  @override
  String patchMvrStatusReferenceLoaded(int count, int skipped, int footprints) {
    return 'Loaded reference: $count machine(s) (ignored: $skipped, GDTF footprints: $footprints).';
  }

  @override
  String patchMvrStatusRestored(Object count) {
    return 'Restoration: $count machines';
  }

  @override
  String get patchMvrStatusSceneXmlNotFound => 'scene.xml not found in MVR.';

  @override
  String get patchMvrStatusSelectingFile => 'File selection...';

  @override
  String patchMvrStatusUnsupportedFile(Object ext) {
    return 'Unsupported file: $ext';
  }

  @override
  String get patchMvrSummaryTitle => 'Summary';

  @override
  String get patchMvrTitle => 'MVR import';

  @override
  String patchMvrUniverseItem(Object universe) {
    return 'Universe $universe';
  }

  @override
  String get patchPageTitle => 'Patch';

  @override
  String get patchSummaryTitle => 'Summary';

  @override
  String get patchUniverseAppBarTitle => 'Patch';

  @override
  String patchUniverseConflictCount(Object count) {
    return 'Conflicts : $count channel(s)';
  }

  @override
  String get patchUniverseGridLimitedByWidth => 'Limited by screen width.';

  @override
  String get patchUniverseGridTitle => 'Occupancy (1 to 512)';

  @override
  String patchUniverseItem(Object universe) {
    return 'Universe $universe';
  }

  @override
  String get patchUniverseLabel => 'Universe';

  @override
  String get patchUniverseLegendConflict => 'Conflict';

  @override
  String get patchUniverseLegendFree => 'Free';

  @override
  String get patchUniverseLegendOccupied => 'Occupied';

  @override
  String patchUniverseOccupantLine(
      Object channels, Object end, Object fixture, Object mode, Object start) {
    return '- $fixture\n  $mode - $channels channel(s)\n  $start → $end';
  }

  @override
  String patchUniverseOccupiedCount(Object count) {
    return 'Occupied : $count / 512';
  }

  @override
  String patchUniversePopupHeader(
      Object address, Object state, Object universe) {
    return 'Universe $universe - Address $address\nState: $state';
  }

  @override
  String get patchUniversePopupManyOccupants =>
      'Several machines occupy this channel.';

  @override
  String patchUniversePopupMore(Object count) {
    return '... and $count other(s).';
  }

  @override
  String get patchUniversePopupTitleConflict => 'Conflict';

  @override
  String get patchUniversePopupTitleFree => 'Free channel';

  @override
  String get patchUniversePopupTitleOccupied => 'Busy channel';

  @override
  String get patchUniverseReferenceNone => 'No reference loaded';

  @override
  String get patchUniverseReferenceReadOnly => 'Read-only (from MVR)';

  @override
  String get patchUniverseReferenceTitle => 'Reference';

  @override
  String get patchUniverseResetConfirm => 'Reset';

  @override
  String get patchUniverseResetContent =>
      'This deletes the patch loaded from the MVR into the application.\nNo data in the file is modified.';

  @override
  String get patchUniverseResetTitle => 'Reset reference?';

  @override
  String get patchUniverseResetTooltip => 'Reset reference';

  @override
  String get patchUniverseSelected => 'Universe selected';

  @override
  String get patchUniverseStateConflict => 'Conflict';

  @override
  String get patchUniverseStateFree => 'Free';

  @override
  String get patchUniverseStateOccupied => 'Occupied';

  @override
  String get patchUniverseTapHint => 'Touch a box to display details.';

  @override
  String get patchUniverseUniverseDropdownLabel => 'DMX Universe';

  @override
  String patchUniverseUniverseItem(Object universe) {
    return 'Universe $universe';
  }

  @override
  String get patchUniverseUniverseTitle => 'Universe';

  @override
  String get patchUniverseZoomIn => 'Enlarge';

  @override
  String get patchUniverseZoomOut => 'Reduce';

  @override
  String get patchUniverseZoomTitle => 'Zoom';

  @override
  String get photometryBeamAngleHint2 => 'In degrees';

  @override
  String get photometryBeamAngleHint3 => 'In degrees';

  @override
  String get photometryBeamAngleLabel => 'Beam angle';

  @override
  String get photometryCandelaHint1 => 'Enter a value in cd';

  @override
  String get photometryCandelaHint2 => 'Enter a value in cd';

  @override
  String get photometryCandelaLabel => 'Candela';

  @override
  String get photometryDisclaimerShort =>
      'Indication only. Check with manufacturer\'s documentation.';

  @override
  String get photometryDistanceHint1 => 'In meters';

  @override
  String get photometryDistanceHint3 => 'In meters';

  @override
  String get photometryDistanceLabel => 'Distance';

  @override
  String get photometryLumensHint2 => 'Enter a value in lm';

  @override
  String get photometryLumensHint3 => 'Enter a value in lm';

  @override
  String get photometryLumensLabel => 'Lumens';

  @override
  String get photometryLuxHint => 'Enter a value in lux';

  @override
  String get photometryLuxLabel => 'Lux';

  @override
  String get photometrySection1Title => 'Lux <> Candela';

  @override
  String get photometrySection2Title => 'Lumens <> Candela';

  @override
  String get photometrySection3Title => 'Lumens < Lux';

  @override
  String photometrySummary1(Object candela, Object distance, Object lux) {
    return 'At $distance m, $candela cd ≈ $lux lux.';
  }

  @override
  String photometrySummary2(Object distance, Object lumens, Object lux) {
    return 'At $distance m, $lumens lm ≈ $lux lux (approx.).';
  }

  @override
  String photometrySummary3(
      String lumens, String distance, String angle, String lux) {
    return 'Lumens : $lumens lm - Distance : $distance m - Angle: $angle° - Lux: $lux lx.';
  }

  @override
  String get projectionAngleHint => 'In degrees';

  @override
  String get projectionAngleLabel => 'Corner';

  @override
  String get projectionAutoHelp => 'Auto: calculates the missing value.';

  @override
  String projectionConeAngle(Object angle) {
    return 'Angle: $angle°';
  }

  @override
  String projectionConeDiameter(Object diameter) {
    return 'Diameter : $diameter m';
  }

  @override
  String projectionConeDistance(Object distance) {
    return 'Distance: $distance m';
  }

  @override
  String projectionDetailAngle(Object angle) {
    return 'Angle: $angle°';
  }

  @override
  String projectionDetailDiameter(Object diameter) {
    return 'Diameter : $diameter m';
  }

  @override
  String projectionDetailDistance(Object distance) {
    return 'Distance: $distance m';
  }

  @override
  String get projectionDiameterHint => 'In meters';

  @override
  String get projectionDiameterLabel => 'Diameter';

  @override
  String get projectionDistanceHint => 'In meters';

  @override
  String get projectionDistanceLabel => 'Distance';

  @override
  String get projectionHeaderAutoActive => 'Auto active';

  @override
  String get projectionHeaderNeedTwoValues => 'Enter at least two values.';

  @override
  String get projectionInputsTitle => 'Inputs';

  @override
  String get projectionResultsTitle => 'Results';

  @override
  String get resetConsents => 'Reset consents';

  @override
  String get settings => 'Parameters';

  @override
  String videoBrightnessResult(
      Object area,
      Object fl,
      Object format,
      Object lux,
      Object luxEq,
      Object minFl,
      Object nits,
      Object presetLabel,
      Object status) {
    return 'Format: $format\nArea: $area m²\nLux (lm/m²): $lux\nLux eq (gain): $luxEq\nLuminance: $nits nits | $fl ft-L\nMinimum threshold ($presetLabel): $minFl ft-L → $status\nNote: indicative estimate (Lambert).';
  }

  @override
  String get videoBrightnessSectionTitle => 'Lux / nits / ft-L + threshold';

  @override
  String get videoBrightnessSubtitle => 'Lux / nits / ft-L + threshold';

  @override
  String get videoBrightnessTitle => 'Brightness';

  @override
  String get videoCalc1ErrMissing => '❌ Missing data: Distance + Width.';

  @override
  String videoCalc1Ok(Object ratio) {
    return '✅ Projection ratio = $ratio';
  }

  @override
  String get videoCalc1Title => 'Ratio (Distance / Width)';

  @override
  String get videoCalc2ErrMissing => '❌ Missing data: Distance + Ratio.';

  @override
  String videoCalc2Ok(Object width) {
    return '✅ Image width = $width m';
  }

  @override
  String get videoCalc2Title => 'Width (Distance / Ratio)';

  @override
  String get videoCalc3ErrMissingWidth => '❌ Missing data: Width.';

  @override
  String videoCalc3Ok(Object format, Object height) {
    return '✅ Height = $height m (format $format)';
  }

  @override
  String get videoCalc3Title => 'Height (Width + Format)';

  @override
  String get videoCalc4ErrGt0 => '❌ Lumens/Gain/Width must be > 0.';

  @override
  String get videoCalc4ErrMissing => '❌ Missing data: Lumens + Gain + Width.';

  @override
  String get videoCalc4ErrMissingSimple =>
      '❌ Missing data: Width + Lumens + Gain.';

  @override
  String videoCalc4Result(
      Object area,
      Object fl,
      Object format,
      Object lux,
      Object luxEq,
      Object minFl,
      Object nits,
      Object presetLabel,
      Object status) {
    return 'Area: $area m² (format $format)\nLux (lm/m²): $lux\nLux eq (gain): $luxEq\nLuminance: $nits nits | $fl ft-L\nMinimum threshold ($presetLabel): $minFl ft-L → $status\nNote: nits/ft-L conversion based on Lambertian assumption (approx).';
  }

  @override
  String get videoCalc4Title => 'Brightness (lux / nits / ft-L + threshold)';

  @override
  String get videoCalc5ErrMissing =>
      '❌ Missing data: Total width + Overlap% + Number of spotlights.';

  @override
  String get videoCalc5ErrNMin2 => '❌ The number of spotlights must be ≥ 2.';

  @override
  String get videoCalc5NHint => 'ex: 2';

  @override
  String get videoCalc5NLabel => 'Number of spotlights (N)';

  @override
  String videoCalc5Result(Object format, Object hTot, Object n, Object overlapM,
      Object overlapPct, Object wPer, Object wTot) {
    return 'Total width: $wTot m\nN: $n | Overlap: $overlapPct% (on projo width)\n\n- Width per projector: $wPer m\n- Overlap between 2 projectors: $overlapM m\n- Total height (format $format): $hTot m';
  }

  @override
  String get videoCalc5Title => 'Overlap (Total width + N)';

  @override
  String get videoCalc6ErrMissingBasics =>
      '❌ Missing data: Total width + Distance + Overlap%.';

  @override
  String get videoCalc6ErrMissingRatio =>
      '❌ Missing data: Ratio min and/or Ratio max.';

  @override
  String get videoCalc6GainHint => 'eg: 1.0';

  @override
  String get videoCalc6GainLabel => 'Gain (calc 6)';

  @override
  String get videoCalc6LumensPerProjectorHint => 'ex: 20000';

  @override
  String get videoCalc6LumensPerProjectorLabel => 'Lumens per spotlight';

  @override
  String get videoCalc6LumiErrGt0 =>
      'Brightness: ❌ Lumens/projo and gain must be > 0.';

  @override
  String videoCalc6LumiForN(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Estimated brightness (N=$n)\nSurface area: $area m²\nLux eq: $lux (lm/m²)\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoCalc6LumiOptional =>
      'Brightness (optional): enters Lumens/projo + Gain for estimation.';

  @override
  String get videoCalc6NoteIndicative =>
      'Note: indicative estimate (actual blend/overlap may reduce a little).';

  @override
  String get videoCalc6RatioMaxHint => 'e.g.: 1.80';

  @override
  String get videoCalc6RatioMaxLabel => 'Max ratio';

  @override
  String get videoCalc6RatioMinHint => 'e.g.: 1.20';

  @override
  String get videoCalc6RatioMinLabel => 'Min ratio';

  @override
  String videoCalc6Result(
      Object area,
      Object covMax,
      Object covMin,
      Object distance,
      Object format,
      Object hTot,
      Object lumiMax,
      Object lumiMin,
      Object nMax,
      Object nMin,
      Object note,
      Object overlapPct,
      Object ratioMax,
      Object ratioMin,
      Object wTot) {
    return 'Total width=$wTot m | Distance=$distance m | Overlap=$overlapPct%\nFormat $format → Total height=$hTot m | Area=$area m²\nRatio min/max: $ratioMin → $ratioMax\n\nCase ratio more open (min) = $nMin projos | coverage ≈ $covMin m\n$lumiMin\n\nTighter case ratio (max) = $nMax projos | coverage ≈ $covMax m\n$lumiMax\n\n$note';
  }

  @override
  String get videoCalc6Title => 'No. of auto spotlights + brightness';

  @override
  String videoCalcLabel(Object n) {
    return 'Calculation $n';
  }

  @override
  String get videoCalculateAll => 'Calculate all';

  @override
  String get videoCalculationsTitle => 'Video calculations';

  @override
  String get videoCommonParamsTitle => 'Common parameters';

  @override
  String videoCommonPillArea(Object value) {
    return 'Area: $value';
  }

  @override
  String videoCommonPillDistance(Object value) {
    return 'Distance: $value';
  }

  @override
  String videoCommonPillFormat(Object format) {
    return 'Format: $format';
  }

  @override
  String videoCommonPillHeight(Object value) {
    return 'Height: $value';
  }

  @override
  String videoCommonPillOverlap(Object value) {
    return 'Overlap: $value';
  }

  @override
  String videoCommonPillRatio(Object value) {
    return 'Ratio $value';
  }

  @override
  String videoCommonPillTotalWidth(Object value) {
    return 'Total width: $value';
  }

  @override
  String videoCommonPillWidth(Object value) {
    return 'Width: $value';
  }

  @override
  String get videoCopyAllTooltip => 'Copy all results';

  @override
  String get videoCopySummaryTooltip => 'Copy summary';

  @override
  String get videoDisclaimerShort =>
      'Indicative calculations. Always check the manufacturer\'s documentation.';

  @override
  String get videoDistanceHint => 'eg: 12.0';

  @override
  String get videoDistanceLabel => 'Projection distance (m)';

  @override
  String get videoErrImpossibleDenom => '❌ Impossible parameters (denom ≤ 0).';

  @override
  String get videoErrOverlapRange => '❌ Overlap% must be between 0 and 99.9.';

  @override
  String get videoErrRatioGt0 => '❌ The ratio must be > 0.';

  @override
  String get videoErrTotalWidthAndDistanceGt0 =>
      '❌ Total width and distance must be > 0.';

  @override
  String get videoErrTotalWidthGt0 => '❌ Total width must be > 0.';

  @override
  String get videoErrWidthGt0 => '❌ Width must be > 0.';

  @override
  String get videoExportPdfTooltip => 'Export PDF';

  @override
  String get videoFormatLabel => 'Format (ratio)';

  @override
  String get videoGainHint => 'eg: 1.0';

  @override
  String get videoGainLabel => 'Gain';

  @override
  String get videoImageWidthHint => 'eg: 6.0';

  @override
  String get videoImageWidthLabel => 'Image width (m)';

  @override
  String get videoLedCalcTitle => 'Calculation - Pixels / tiles';

  @override
  String get videoLedErrAllGt0 => '❌ All values must be > 0.';

  @override
  String get videoLedErrMissingInputs =>
      '❌ Missing data: Tiles X/Y + Tile px + Tile cm.';

  @override
  String videoLedPitchUniform(Object value) {
    return '$value mm';
  }

  @override
  String videoLedPitchXY(Object x, Object y) {
    return 'X $x mm - Y $y mm';
  }

  @override
  String videoLedResult(
      Object pitch,
      Object tileHcm,
      Object tileHpx,
      Object tileWcm,
      Object tileWpx,
      Object wallHm,
      Object wallHpx,
      Object wallWm,
      Object wallWpx) {
    return '✅ Wall resolution: $wallWpx × $wallHpx px\n✅ Wall size: $wallWm × $wallHm m\nTile: $tileWpx×$tileHpx px - $tileWcm×$tileHcm cm\nCalculated pitch: $pitch';
  }

  @override
  String get videoLedSubtitle =>
      'LED wall pixels by size, pitch, tile dimensions.';

  @override
  String get videoLedTileHcmHint => 'e.g.: 33.28';

  @override
  String get videoLedTileHcmLabel => 'Tile height (cm)';

  @override
  String get videoLedTileHpxHint => 'e.g.: 128';

  @override
  String get videoLedTileHpxLabel => 'Tile height (px)';

  @override
  String get videoLedTileWcmHint => 'e.g.: 33.28';

  @override
  String get videoLedTileWcmLabel => 'Tile width (cm)';

  @override
  String get videoLedTileWpxHint => 'e.g.: 128';

  @override
  String get videoLedTileWpxLabel => 'Tile width (px)';

  @override
  String get videoLedTilesXHint => 'ex: 15';

  @override
  String get videoLedTilesXLabel => 'Horizontal tiles (X)';

  @override
  String get videoLedTilesYHint => 'ex: 8';

  @override
  String get videoLedTilesYLabel => 'Vertical tiles (Y)';

  @override
  String get videoLedTitle => 'LED';

  @override
  String get videoLensMeasureSubtitle =>
      'Ratio / width / height (calculations 1 to 3).';

  @override
  String get videoLensMeasureTitle => 'Lens & measurement';

  @override
  String get videoLmCalc1Title => 'Ratio (Distance / Width)';

  @override
  String get videoLmCalc2Title => 'Width (Distance / Ratio)';

  @override
  String get videoLmCalc3Title => 'Height (Width + Format)';

  @override
  String get videoLmDistanceHint => 'eg: 12.0';

  @override
  String get videoLmDistanceLabel => 'Projection distance (m)';

  @override
  String get videoLmErrMissingDistanceRatio =>
      '❌ Missing data: Distance + Ratio.';

  @override
  String get videoLmErrMissingDistanceWidth =>
      '❌ Missing data: Distance + Width.';

  @override
  String get videoLmErrMissingWidthOnly => '❌ Missing data: Width.';

  @override
  String get videoLmErrRatioGt0 => '❌ Ratio must be > 0.';

  @override
  String get videoLmErrWidthGt0 => '❌ Width must be > 0.';

  @override
  String get videoLmFormatLabel => 'Format (ratio)';

  @override
  String get videoLmImageWidthHint => 'eg: 6.0';

  @override
  String get videoLmImageWidthLabel => 'Image width (m)';

  @override
  String videoLmResultHeight(Object format, Object height) {
    return '✅ Height = $height m (format $format)';
  }

  @override
  String videoLmResultRatio(Object ratio) {
    return '✅ Projection ratio = $ratio';
  }

  @override
  String videoLmResultWidth(Object width) {
    return '✅ Image width = $width m';
  }

  @override
  String get videoLmThrowRatioHint => 'e.g.: 1.60';

  @override
  String get videoLmThrowRatioLabel => 'Projection ratio';

  @override
  String get videoLumensHint => 'ex: 20000';

  @override
  String get videoLumensLabel => 'Lumens (ANSI)';

  @override
  String get videoMireHeaderSubtitle =>
      'Indicative test patterns (calibration, focus, geometry, blend, pixel perfect).';

  @override
  String get videoMireHeaderTitle => 'Test pattern generator';

  @override
  String get videoMireScreenLedSubtitle =>
      'WxH px pattern (pixel perfect, uniformity, grid).';

  @override
  String get videoMireScreenLedTitle => 'LED display sight';

  @override
  String get videoMireScreenVideoSubtitle =>
      'Simple (WxH px) + Multi-project mapping (N + overlap).';

  @override
  String get videoMireScreenVideoTitle => 'Video screen test pattern';

  @override
  String get videoMireTitle => 'Sight';

  @override
  String get videoMpCalc5Title => 'Width per spotlight';

  @override
  String get videoMpCalc6Title => 'Number of spotlights (min/max ratio)';

  @override
  String videoMpCaseOpenMin(Object coverage, Object n) {
    return 'Case ratio more open (min) = $n projos | coverage ≈ $coverage m';
  }

  @override
  String videoMpCaseTightMax(Object coverage, Object n) {
    return 'Tighter ratio case (max) = $n projos | coverage ≈ $coverage m';
  }

  @override
  String get videoMpDistanceHint => 'eg: 12.0';

  @override
  String get videoMpDistanceLabel => 'Projection distance (m)';

  @override
  String get videoMpErrImpossibleDenom =>
      '❌ Impossible parameters (denom ≤ 0).';

  @override
  String get videoMpErrInvalidRatio => '❌ Invalid ratio (must be > 0).';

  @override
  String get videoMpErrMissing5 =>
      '❌ Missing data: Total width + Overlap% + N.';

  @override
  String get videoMpErrMissing6Main =>
      '❌ Missing data: Total width + Distance + Overlap%.';

  @override
  String get videoMpErrMissingRatios =>
      '❌ Missing data: Ratio min and/or Ratio max.';

  @override
  String get videoMpErrNGte2 => '❌ N must be ≥ 2.';

  @override
  String get videoMpErrOverlapRange => '❌ Overlap% must be between 0 and 99.9.';

  @override
  String get videoMpErrWidthDistanceGt0 =>
      '❌ Total width and distance must be > 0.';

  @override
  String get videoMpErrWidthGt0 => '❌ Total width must be > 0.';

  @override
  String get videoMpFormatLabel => 'Format (ratio)';

  @override
  String get videoMpGainHint => 'eg: 1.0';

  @override
  String get videoMpGainLabel => 'Gain';

  @override
  String get videoMpLumensPerProjectorHint => 'ex: 20000';

  @override
  String get videoMpLumensPerProjectorLabel => 'Lumens per spotlight';

  @override
  String get videoMpLumiErrLumensGainGt0 =>
      'Brightness: ❌ Lumens/projo and gain must be > 0.';

  @override
  String videoMpLumiEstimated(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Estimated brightness (N=$n)\nSurface area: $area m²\nLux eq: $lux\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoMpLumiOptionalHint =>
      'Brightness (optional): enter Lumens/projo + Gain to estimate.';

  @override
  String get videoMpNoteIndicative => 'Note: indicative estimate.';

  @override
  String get videoMpOptionalLuminanceTitle => 'Optional: brightness';

  @override
  String get videoMpOverlapHint => 'e.g.: 10';

  @override
  String get videoMpOverlapLabel => 'Overlap (%)';

  @override
  String get videoMpProjectorCountHint => 'ex: 2';

  @override
  String get videoMpProjectorCountLabel => 'Number of spotlights (N)';

  @override
  String get videoMpRatioMaxHint => 'e.g.: 1.80';

  @override
  String get videoMpRatioMaxLabel => 'Max ratio';

  @override
  String get videoMpRatioMinHint => 'e.g.: 1.20';

  @override
  String get videoMpRatioMinLabel => 'Min ratio';

  @override
  String get videoMpTotalWidthHint => 'e.g.: 18.0';

  @override
  String get videoMpTotalWidthLabel => 'Total projection width (m)';

  @override
  String get videoMultiprojectorSubtitle =>
      'Overlap + width/projo + number of projos (calculations 5 & 6).';

  @override
  String get videoMultiprojectorTitle => 'Multi-projector';

  @override
  String get videoOptionalBrightnessTitle => 'Optional: brightness';

  @override
  String get videoOverlapHint => 'e.g.: 10';

  @override
  String get videoOverlapLabel => 'Overlap (%)';

  @override
  String get videoPdfCalc1 => 'Calculation 1';

  @override
  String get videoPdfCalc2 => 'Calculation 2';

  @override
  String get videoPdfCalc3 => 'Calculation 3';

  @override
  String get videoPdfCalc4 => 'Calculation 4';

  @override
  String get videoPdfCalc5 => 'Calculation 5';

  @override
  String get videoPdfCalc5N => 'N (calc5)';

  @override
  String get videoPdfCalc6 => 'Calculation 6';

  @override
  String get videoPdfCalc6Gain => 'Gain (calc6)';

  @override
  String get videoPdfCalc6LumensPerProj => 'Lumens/projo (calc6)';

  @override
  String get videoPdfCalc6RatioMax => 'Max ratio (calc6)';

  @override
  String get videoPdfCalc6RatioMin => 'Min ratio (calc6)';

  @override
  String get videoPdfDate => 'Date';

  @override
  String get videoPdfDistance => 'Distance (m)';

  @override
  String get videoPdfFormat => 'Format';

  @override
  String get videoPdfGain => 'Gain';

  @override
  String get videoPdfImageWidth => 'Image width (m)';

  @override
  String get videoPdfLumens => 'Lumens';

  @override
  String get videoPdfOverlap => 'Overlap (%)';

  @override
  String get videoPdfParams => 'Parameters';

  @override
  String get videoPdfRatio => 'Ratio';

  @override
  String get videoPdfResults => 'Results';

  @override
  String get videoPdfScreenPreset => 'Screen preset';

  @override
  String get videoPdfTitle => 'My Technical App - Video Export';

  @override
  String get videoPdfTotalWidth => 'Total width (m)';

  @override
  String get videoPresetFrontGrey => 'Front - gray screen (gain 0.8)';

  @override
  String get videoPresetFrontGreyShort => 'Front - gray screen';

  @override
  String get videoPresetFrontHighGain => 'Front - high gain screen (gain 1.3)';

  @override
  String get videoPresetFrontHighGainShort => 'Front - high-gain screen';

  @override
  String get videoPresetFrontWhite => 'Front - matte white screen (gain 1.0)';

  @override
  String get videoPresetFrontWhiteShort => 'Front - matt white screen';

  @override
  String get videoPresetMappingDarkStone => 'Mapping - dark stone (gain 0.35)';

  @override
  String get videoPresetMappingDarkStoneShort => 'Mapping - dark stone';

  @override
  String get videoPresetMappingGlass => 'Mapping - glass (gain 0.15)';

  @override
  String get videoPresetMappingGlassShort => 'Mapping - glass';

  @override
  String get videoPresetMappingLightStone => 'Mapping - light stone (gain 0.6)';

  @override
  String get videoPresetMappingLightStoneShort => 'Mapping - clear stone';

  @override
  String get videoPresetMappingMatte => 'Mapping - matte paint (gain 0.75)';

  @override
  String get videoPresetMappingMatteShort => 'Mapping - matte paint';

  @override
  String get videoPresetMappingSatin => 'Mapping - satin paint (gain 0.9)';

  @override
  String get videoPresetMappingSatinShort => 'Mapping - satin paint';

  @override
  String get videoPresetRearClear => 'Retro - light canvas (gain 0.9)';

  @override
  String get videoPresetRearClearShort => 'Retro - clear canvas';

  @override
  String get videoPresetRearDiffusion => 'Retro - diffusion canvas (gain 0.7)';

  @override
  String get videoPresetRearDiffusionShort => 'Retro - diffusion canvas';

  @override
  String get videoScreenPresetLabel => 'Display / Support (preset)';

  @override
  String get videoSummaryPillsTitle => 'Summary (tablets)';

  @override
  String get videoTestPatternSubtitle =>
      'Creation of video test patterns for LED screens and walls (to be done later).';

  @override
  String get videoTestPatternTitle => 'Sight';

  @override
  String get videoThrowRatioHint => 'e.g.: 1.60';

  @override
  String get videoThrowRatioLabel => 'Projection ratio';

  @override
  String get videoTitle => 'Video';

  @override
  String get videoToolsTitle => 'Video tools';

  @override
  String get videoTotalWidthHint => 'e.g.: 18.0';

  @override
  String get videoTotalWidthLabel => 'Total projection width (m)';

  @override
  String get aboutArtnetTitle => 'Art-Net';

  @override
  String get aboutArtnetToc01 => '1) Art-Net - what it is and why';

  @override
  String get aboutArtnetToc02 => '2) Addressing & universe - own mapping';

  @override
  String get aboutArtnetToc03 => '3) Limits & perf - what breaks first';

  @override
  String get aboutArtnetToc04 => '4) Nodes, splitters & RDM';

  @override
  String get aboutArtnetToc05 => '5) Troubleshooting - symptoms → causes';

  @override
  String get aboutArtnetToc06 =>
      '6) Schematics (network / unicast vs. broadcast)';

  @override
  String get aboutArtnetToc07 => '6bis) Images (assets) - RJ45/switch/cables';

  @override
  String get aboutArtnetToc08 => '7) Quick checklist';

  @override
  String get aboutDmxToc01 => '1) DMX, universes, addresses - the basics';

  @override
  String get aboutDmxToc02 => '2) DMX frame - break, start code, channels';

  @override
  String get aboutDmxToc03 => '3) RS-485 wiring - topology & cable';

  @override
  String get aboutDmxToc04 =>
      '4) Termination & splitters - avoiding reflections';

  @override
  String get aboutDmxToc05 => '4bis) RDM - limits & compatibilities';

  @override
  String get aboutDmxToc06 => '5) Field troubleshooting - symptoms → causes';

  @override
  String get aboutDmxToc07 => '6) Art-Net - field markers';

  @override
  String get aboutDmxToc08 => '7) sACN / E1.31 - multicast, IGMP, priorities';

  @override
  String get aboutDmxToc09 => '8) DMX vs Art-Net vs sACN - choosing';

  @override
  String get aboutDmxToc10 => '10) Quick checklist';

  @override
  String get aboutDmxToc11 => '10) Quick checklist';

  @override
  String get aboutElectriciteTitle => 'Electricity';

  @override
  String get aboutElectriciteToc01 => '1) Basics (W, A, V, kW)';

  @override
  String get aboutElectriciteToc02 => '2) Connectors (Schuko / P17 / PowerCON)';

  @override
  String get aboutElectriciteToc03 => '3) Mono / Tri (what\'s the difference)';

  @override
  String get aboutElectriciteToc04 => '4) Fast table (16A → 400A)';

  @override
  String get aboutElectriciteToc05 => '5) Safety & pitfalls';

  @override
  String get aboutElectriciteToc06 => '6) Checklist';

  @override
  String get aboutInformatiqueTitle => 'IT';

  @override
  String get aboutInformatiqueToc01 => '1) USB / USB-C / Thunderbolt';

  @override
  String get aboutInformatiqueToc02 => '2) Storage (SATA / NVMe / SSD)';

  @override
  String get aboutInformatiqueToc03 => '3) Video links (DP / HDMI)';

  @override
  String get aboutInformatiqueToc04 => '4) PCIe / GPU (benchmarks)';

  @override
  String get aboutInformatiqueToc05 => '5) Checklist (tray)';

  @override
  String get aboutIpBasicsToc01 => '1) What is an IP and what is it used for?';

  @override
  String get aboutIpBasicsToc02 =>
      '2) Why 192.x / 10.x / 172.x? (private addresses)';

  @override
  String get aboutIpBasicsToc03 =>
      '3) Mask & subnetting: understanding for real';

  @override
  String get aboutIpBasicsToc04 => '4) DHCP, gateway, DNS: who does what?';

  @override
  String get aboutIpBasicsToc05 =>
      '5) How two devices talk to each other (LAN vs. non-LAN)';

  @override
  String get aboutIpBasicsToc06 =>
      '6) Simple IP \"show\" plans (ready-to-copy examples)';

  @override
  String get aboutIpBasicsToc07 =>
      '7) Troubleshooting: symptoms → causes (field method)';

  @override
  String get aboutIpBasicsToc08 =>
      '8) Mini-exercises (quickly check a mask / a network)';

  @override
  String get aboutIpBasicsToc09 => '9) Quick checklist';

  @override
  String get aboutNetworkTitle => 'Network (EN)';

  @override
  String get aboutNetworkToc01 => '1) Objective: stable network';

  @override
  String get aboutNetworkToc02 => '2) IP plan (simple)';

  @override
  String get aboutNetworkToc03 => '3) VLAN (separation)';

  @override
  String get aboutNetworkToc04 => '4) IGMP (sACN multicast)';

  @override
  String get aboutNetworkToc05 => '5) Wi-Fi vs. wired';

  @override
  String get aboutNetworkToc06 => '6) Switch: what you need';

  @override
  String get aboutNetworkToc07 => '7) Schematics';

  @override
  String get aboutNetworkToc08 => '7bis) Images (assets)';

  @override
  String get aboutNetworkToc09 => '8) Checklist';

  @override
  String get aboutReseauTitle => 'Network';

  @override
  String get aboutReseauToc01 => '1) Network basics (LAN / IP / throughput)';

  @override
  String get aboutReseauToc02 => '2) RJ45 & categories (Cat5e/6/6A/...)';

  @override
  String get aboutReseauToc03 => '3) PoE (network power supply)';

  @override
  String get aboutReseauToc04 => '4) Fiber (SM/MM) + connectors (LC/SC)';

  @override
  String get aboutReseauToc05 => '5) SFP / SFP+ / QSFP (modules)';

  @override
  String get aboutReseauToc06 => '6) Switches (VLAN / IGMP / QoS)';

  @override
  String get aboutReseauToc07 => '7) Art-Net / sACN on network (tips)';

  @override
  String get aboutReseauToc08 => '8) Checklist';

  @override
  String get aboutSacnToc01 => '1) What does sACN do?';

  @override
  String get aboutSacnToc02 => '2) Universe (numbering)';

  @override
  String get aboutSacnToc03 => '3) Multicast / Unicast + IGMP';

  @override
  String get aboutSacnToc04 => '4) Priorities (multi-sources)';

  @override
  String get aboutSacnToc05 => '5) Limits / performance';

  @override
  String get aboutSacnToc06 => '6) RDM & sACN (proxy / depending on equipment)';

  @override
  String get aboutSacnToc07 => '7) Schematics';

  @override
  String get aboutSacnToc08 => '7bis) Images (assets)';

  @override
  String get aboutSacnToc09 => '8) Checklist';

  @override
  String get aboutVideoToc01 => '1) Video basics (keywords)';

  @override
  String get aboutVideoToc02 => '2) Resolution & FPS';

  @override
  String get aboutVideoToc03 => '3) Color (4:4:4 / 4:2:2 / 10-bit)';

  @override
  String get aboutVideoToc04 => '4) Sync (Genlock / Timecode)';

  @override
  String get aboutVideoToc05 => '5) Cables & distances';

  @override
  String get aboutVideoToc06 => '6) SDI (3G/6G/12G)';

  @override
  String get aboutVideoToc07 => '7) HDMI - field';

  @override
  String get aboutVideoToc08 => '8) NDI - when / why / limits';

  @override
  String get aboutVideoToc09 => '9) Mapping / LED / multi-project';

  @override
  String get aboutVideoToc10 => '10) Field checklist';

  @override
  String get aboutTileDmxTitle => 'DMX - operation (simple & complete)';

  @override
  String get aboutTileArtnetTitle =>
      'Art-Net - DMX over IP (nodes, unicast/broadcast)';

  @override
  String get aboutTileSacnTitle => 'sACN / E1.31 - multicast, IGMP, priorities';

  @override
  String get aboutTileIpBasicsTitle =>
      'Network - IP bases / mask / DHCP (essential)';

  @override
  String get aboutTileReseauTitle =>
      'Network - RJ45 / Fiber / speeds & lengths';

  @override
  String get aboutTileNetworkTitle =>
      'Light network - VLAN, IGMP, Wi-Fi vs. wired';

  @override
  String get aboutTileVideoTitle => 'Video - SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutTileElectriciteTitle =>
      'Electrical - Schuko / P17 / power ratings';

  @override
  String get aboutTileElectriciteSubtitle =>
      'Connectors, mono/tri, fast kW panels (16A→400A), field traps.';

  @override
  String get aboutTileInformatiqueTitle =>
      'Computers - USB / HDMI / DP / SATA / NVMe...';

  @override
  String get aboutTileInformatiqueSubtitle =>
      'Useful flow rates, versions, real limits, marketing pitfalls.';

  @override
  String get aboutTitle => 'About us';

  @override
  String get homeRiggingTitle => 'Rigging';

  @override
  String get homeRiggingSubtitle => 'Bridles: sling angles & lengths.';

  @override
  String get riggingTitle => 'Rigging';

  @override
  String get riggingAngleLengthTitle => 'Sling angle & length';

  @override
  String get riggingSymmetryNote =>
      'Assumption: symmetrical bridle (2 identical strands). No load calculation.';

  @override
  String get riggingInputsTitle => 'Inputs';

  @override
  String get riggingSpanLabel => 'Centre distance (distance between points)';

  @override
  String get riggingSpanHint => 'Ex: 2.40';

  @override
  String get riggingDropLabel => 'Arrow (vertical drop)';

  @override
  String get riggingDropHint => 'Ex: 0.60';

  @override
  String get riggingUnitMeters => 'm';

  @override
  String get riggingResultsTitle => 'Results';

  @override
  String get riggingNeedPositiveValues => 'Enter values > 0.';

  @override
  String get riggingLegLengthLabel => 'Strand length';

  @override
  String get riggingAngleToHorizontalLabel => 'Angle to horizontal';

  @override
  String get riggingAngleToVerticalLabel => 'Angle from vertical';

  @override
  String get riggingDisclaimerShort =>
      'Indicative results. To be validated according to your context and rigging practices.';

  @override
  String get riggingCalcLegDropTitle => 'Length + deflection → span';

  @override
  String get riggingCalcLegDropHelp =>
      'Symmetrical sling (2 strands): calculates span from sling length and deflection.';

  @override
  String get riggingLegLengthInputLabel => 'Strand length';

  @override
  String get riggingLegLengthInputHint => 'Ex: 2.50';

  @override
  String get riggingInvalidTriangle =>
      'Impossible: the length must be greater than the arrow.';

  @override
  String get riggingCalcLegAngleTitle => 'Length + angle → span + deflection';

  @override
  String get riggingCalcLegAngleHelp =>
      'Symmetrical sling (2 strands): calculates span and deflection from length and angle to the horizontal.';

  @override
  String get riggingAngleHorizontalInputLabel => 'Angle to horizontal';

  @override
  String get riggingAngleHorizontalInputHint => 'Ex: 30';

  @override
  String get riggingInvalidAngle =>
      'Invalid angle: between 0° and 90° (excluded).';

  @override
  String get riggingUnitDegrees => '°';

  @override
  String get riggingCalc1Title =>
      'Center-to-center distance + deflection → length & angles';

  @override
  String get riggingCalc1Subtitle =>
      'Symmetrical bridle (2 identical strands). Weight displayed (info). No load calculation.';

  @override
  String get riggingCalc2Title => 'Center distance + angle(H) → sag & length';

  @override
  String get riggingCalc2Subtitle =>
      'Angle to the horizontal. Symmetrical bridle. No load calculation.';

  @override
  String get riggingCalc3Title =>
      'Center-to-center distance + length → deflection & angles';

  @override
  String get riggingCalc3Subtitle =>
      'Length of one strand known. Symmetrical bridle. No load calculation.';

  @override
  String get riggingLegLengthHint => 'Ex: 4.70';

  @override
  String get riggingAngleHint => 'Ex: 45';

  @override
  String get riggingInvalidGeometry =>
      'Impossible geometry (length too short for center distance).';

  @override
  String get riggingSchemaTitle => 'Diagram';

  @override
  String get riggingSchemaCaption1 =>
      'Inputs: span + deflection. Outputs: sling length + angles.';

  @override
  String get riggingSchemaCaption2 =>
      'Inputs: span + sling length. Outputs: sag + angles.';

  @override
  String get riggingSchemaCaption3 =>
      'Inputs: span + angle (horizontal). Outputs: arrow + length.';

  @override
  String get riggingAngleHInputLabel => 'Angle (relative to horizontal)';

  @override
  String get riggingAngleHInputHint => 'Ex: 45';

  @override
  String get riggingDropResultLabel => 'Drop arrow';

  @override
  String get riggingSchemaLabelSpan => 'Centre-to-centre';

  @override
  String get riggingSchemaLabelDrop => 'Arrow';

  @override
  String get riggingSchemaLabelLeg => 'Strand';

  @override
  String get riggingWeightLabel => 'Weight (info)';

  @override
  String get riggingUnitKg => 'kg';

  @override
  String get riggingImpossibleGeometry =>
      'Impossible geometry: strand length must be > (center distance / 2).';

  @override
  String get riggingDisclaimerNoLoad =>
      'Weight shown for guidance only. No load / tension calculation. Valid according to your rigging context.';

  @override
  String get riggingCalcCommonSubtitle =>
      '2-strand bridle. Weight displayed (info). No load calculation.';

  @override
  String get riggingOffCenterToggle => 'Off-center load';

  @override
  String get riggingOffsetLabel => 'Offset A → load';

  @override
  String get riggingInvalidOffset =>
      'Invalid offset: must be > 0 and < center distance.';

  @override
  String get riggingLegLeftLabel => 'Left strand length';

  @override
  String get riggingLegRightLabel => 'Straight strand length';

  @override
  String get riggingAngleHLeftLabel => 'Angle H (left)';

  @override
  String get riggingAngleHRightLabel => 'Angle H (straight)';

  @override
  String get riggingAngleVLeftLabel => 'Angle V (left)';

  @override
  String get riggingAngleVRightLabel => 'Angle V (straight)';

  @override
  String get riggingBridleAnglesLegend => 'Angles';

  @override
  String get riggingIncludedAngleLabel => 'Angle between strands';

  @override
  String get riggingAngleHLeftInputLabel => 'Angle H (left strand)';

  @override
  String get riggingLegLeftInputLabel => 'Length (left strand)';

  @override
  String get riggingNeedValidValues => 'Enter valid positive values.';

  @override
  String get photometrySection4Title => 'Lux → Lumen';

  @override
  String get photometryAreaLabel => 'Surface area (m²)';

  @override
  String get photometryAreaHint4 => 'Ex: 12.5';

  @override
  String photometrySummary4(Object lumens, Object lux, Object area) {
    return 'E = $lux lx - S = $area m² → Φ = $lumens lm';
  }

  @override
  String get aboutArtnetTocConversionTitle => 'Conversions';

  @override
  String get aboutArtnetConversionIntro =>
      'Useful conversion tools for DMX, Art-Net and hexadecimal values.';

  @override
  String get aboutUniverseToArtnetTitle => 'Universe → Art-Net';

  @override
  String get aboutUniverseToArtnetSubtitle =>
      'Find Subnet + Universe (Net/Port-Address) from a DMX universe.';

  @override
  String get aboutUniverseToHexTitle => 'Universe → Hex';

  @override
  String get aboutUniverseToHexSubtitle =>
      'Convert a universe (1...N) into an index and hexadecimal value.';

  @override
  String get aboutArtnetConversionNote =>
      'Note: Art-Net conventions may vary from console to console (addressing, 0/1 base). Always check your system documentation.';

  @override
  String get elecTocCopyText => 'Copy table of contents';

  @override
  String get elecToc1 => '1) Basics (W, A, V, kW)';

  @override
  String get elecToc2 => '2) Connectors (Schuko / P17 / PowerCON)';

  @override
  String get elecToc3 => '3) Mono / Tri (what\'s the difference)';

  @override
  String get elecToc4 => '4) Fast table (16A → 400A)';

  @override
  String get elecToc5 => 'Conversion kVA → kW / A';

  @override
  String get elecToc6 => '6) Safety & pitfalls';

  @override
  String get elecToc7 => '6) Checklist';

  @override
  String get elecKvaTitle => 'Table kVA → kW (depending on cos φ)';

  @override
  String get elecKvaFormula => 'Formula: kW = kVA × cos φ';

  @override
  String get elecKvaIntro =>
      'This table gives a quick estimate of active power (kW) from apparent power (kVA).';

  @override
  String get elecKvaNote =>
      'Indicative values. Use real values of cos φ when you know them.';

  @override
  String get elecKvaColKva => 'kVA';

  @override
  String get elecKvaColPf08 => 'kW (cos φ = 0.8)';

  @override
  String get elecKvaColPf10 => 'kW (cos φ = 1.0)';

  @override
  String get commonTocTitle => 'Contents';

  @override
  String get commonCopySummaryTooltip => 'Copy table of contents';

  @override
  String get aboutLightReferenceTitle => 'Lighting references';

  @override
  String get refCriTitle => 'IRC / CRI';

  @override
  String get refKelvinTitle => 'Color temperature (K)';

  @override
  String get refBeamFieldTitle => 'Beam/Field';

  @override
  String get refLuxTitle => 'Illuminance levels (lux)';

  @override
  String get refCriContent =>
      'CRI measures color fidelity. The higher it is, the more natural colors appear.';

  @override
  String get refKelvinContent =>
      'Color temperature describes the shade of white (warm to cool).';

  @override
  String get refBeamFieldContent =>
      'The Beam is the angle of the main beam; the Field is the angle where the intensity becomes weak (edge).';

  @override
  String get refBeamLegendBeam => 'beam';

  @override
  String get refBeamLegendField => 'Field';

  @override
  String get refLuxIntro =>
      'Indicative illuminance references according to use.';

  @override
  String get refLuxColUse => 'Use';

  @override
  String get refLuxColLux => 'Lux';

  @override
  String get refLuxUseCorridor => 'Corridor / circulation';

  @override
  String get refLuxUseBackstage => 'Backstage / technical';

  @override
  String get refLuxUseMeeting => 'Meeting room';

  @override
  String get refLuxUseExpo => 'Exhibition / showroom';

  @override
  String get refLuxUseStageGeneral => 'Stage - general';

  @override
  String get refLuxUseStageTv => 'Stage - TV / recording';

  @override
  String get refLuxNote =>
      'These values vary according to standards and constraints (camera, contrast, ambience).';

  @override
  String get refLightDisclaimerShort =>
      'Indicative references - not a standard.';

  @override
  String get refCri90 => 'Excellent (≥90)';

  @override
  String get refCri80 => 'Good (≈ 80)';

  @override
  String get refCriLow => 'Low (< 80)';

  @override
  String get aboutUniverseToArtnetImportantTitle => 'Important';

  @override
  String get aboutUniverseToArtnetImportantBody =>
      'Some consoles use base 0 (Universe 0..15) and others base 1 (Universe 1..16).';

  @override
  String get aboutUniverseToArtnetTableTitle => 'Universe Table → Art-Net';

  @override
  String get aboutUniverseToArtnetTableIntro =>
      'Typical correspondence between DMX universe and Art-Net addressing.';

  @override
  String get aboutUniverseTablesDisclaimer =>
      'Always check your console / node convention.';

  @override
  String get aboutUniverseToArtnetColDmx => 'DMX Universe';

  @override
  String get aboutUniverseToArtnetColUniHex => 'Plain (hex)';

  @override
  String aboutUniverseToArtnetSubnetTitle(
      Object p0, Object p1, Object p2, Object p3) {
    return 'Subnet $p0 $p1 $p2 $p3';
  }

  @override
  String get aboutUniverseToHexPrincipleTitle => 'Principle';

  @override
  String get aboutUniverseToHexPrincipleBody =>
      'A universe (1...N) can be converted into an index (base 0) and then into hexadecimal.';

  @override
  String get aboutUniverseToHexTableTitle => 'Universe → Hex table';

  @override
  String get aboutUniverseToHexTableIntro =>
      'DMX universe conversion table → index / hex.';

  @override
  String aboutUniverseToHexBlockTitle(Object p0, Object p1) {
    return 'Block $p0 $p1';
  }

  @override
  String get aboutUniverseToHexColDmx => 'DMX Universe';

  @override
  String get aboutUniverseToHexColIndex => 'Index';

  @override
  String get aboutArtnetPageTitle =>
      'Art-Net - DMX over IP (simple & complete)';

  @override
  String get aboutArtnetTocTitle => 'Contents';

  @override
  String get aboutArtnetTocCopyTooltip => 'Copy markers';

  @override
  String get aboutArtnetCopyLine1 => 'Art-Net = DMX over Ethernet via UDP.';

  @override
  String get aboutArtnetCopyLine2 =>
      'Scale: many universes via distributed (DMX-out) nodes.';

  @override
  String get aboutArtnetCopyLine3 =>
      'Distribution: broadcast (simple but flood) or unicast (cleaner).';

  @override
  String get aboutArtnetCopyLine4 =>
      'Actual limits: Wi-Fi, basic switch, firmware nodes, universe/mapping settings.';

  @override
  String get aboutArtnetCopyLine5 =>
      'RDM: possible via \"RDM proxy\" depending on nodes (variable support).';

  @override
  String get aboutArtnetSection1Title => '1) Art-Net - what it is and why';

  @override
  String get aboutArtnetSection2Title =>
      '2) Addressing & universe - own mapping';

  @override
  String get aboutArtnetSection3Title => '3) Limits & perf - what breaks first';

  @override
  String get aboutArtnetSection4Title => '4) Nodes, splitters & RDM';

  @override
  String get aboutArtnetSection5Title =>
      '5) Troubleshooting - symptoms → causes';

  @override
  String get aboutArtnetSection6Title =>
      '6) Schematics (network / unicast vs. broadcast)';

  @override
  String get aboutArtnetSection6bTitle =>
      '6bis) Images (assets) - RJ45/switch/cables';

  @override
  String get aboutArtnetSection7Title => '7) Quick checklist';

  @override
  String get aboutArtnetConversionTablesTitle =>
      '8) Conversion / tables (Universe 1..256)';

  @override
  String get aboutArtnetPillUdp => 'UDP';

  @override
  String get aboutArtnetPillUniversIp => 'Universe DMX over IP';

  @override
  String get aboutArtnetPillNodesDmxOut => 'DMX-out nodes';

  @override
  String get aboutArtnetSection1Paragraph =>
      'Art-Net transports DMX universes over an Ethernet (IP) network. Instead of drawing one DMX line per universe, you send \"packets\" over the network, and a node converts them to DMX near the machines.';

  @override
  String get aboutArtnetSection1CalloutTitle => 'Why it\'s useful';

  @override
  String get aboutArtnetSection1Bullet1 =>
      'Scalable: many universes on a single network cable.';

  @override
  String get aboutArtnetSection1Bullet2 =>
      'Distribution: nodes close to projectors/dimmers → fewer long DMX lines.';

  @override
  String get aboutArtnetSection1Bullet3 =>
      'Flexible patch: change a universe or move a node quickly.';

  @override
  String get aboutArtnetSection1Subtitle => 'Two words to remember';

  @override
  String get aboutArtnetSection1SubBullet1 =>
      'Art-Net does not replace DMX: it transports it over IP.';

  @override
  String get aboutArtnetSection1SubBullet2 =>
      'Stability often depends more on the network (switch, Wi-Fi, broadcast) than on the protocol.';

  @override
  String get aboutArtnetSection2PillUniverse => 'Universe';

  @override
  String get aboutArtnetSection2PillNodePort => 'Node/Port';

  @override
  String get aboutArtnetSection2PillMapping => 'Mapping';

  @override
  String get aboutDmxPageTitle => 'DMX - operation (simple & complete)';

  @override
  String get aboutDmxSummaryLine1 =>
      'DMX = RS-485, 512 channels (slots) per universe, values 0-255 (8-bit).';

  @override
  String get aboutDmxSummaryLine2 =>
      'Timing: 250 kbaud, full universe ≈ ~44 Hz (order of magnitude).';

  @override
  String get aboutDmxSummaryLine3 =>
      'Topology: daisy-chain (no passive Y). 120Ω termination on the last one.';

  @override
  String get aboutDmxSummaryLine4 =>
      'RDM = bidirectional DMX (config/monitoring) → check splitter/node compatibility.';

  @override
  String get aboutDmxSummaryLine5 =>
      'Art-Net / sACN = DMX universes transported over Ethernet/IP via nodes.';

  @override
  String get aboutDmxSummaryLine6 =>
      'sACN = multicast + priorities (IGMP snooping recommended).';

  @override
  String get aboutDmxToc1 => '1) DMX, universes, addresses - the basics';

  @override
  String get aboutDmxToc2 => '2) DMX frame - break, start code, channels';

  @override
  String get aboutDmxToc3 => '3) RS-485 wiring - topology & cable';

  @override
  String get aboutDmxToc4 =>
      '4) Termination & splitters - avoiding reflections';

  @override
  String get aboutDmxToc4bis => '4bis) RDM - limits & compatibilities';

  @override
  String get aboutDmxToc5 => '5) Field troubleshooting - symptoms → causes';

  @override
  String get aboutDmxToc6 => '6) Art-Net - field markers';

  @override
  String get aboutDmxToc7 => '7) sACN / E1.31 - multicast, IGMP, priorities';

  @override
  String get aboutDmxToc8 => '8) DMX vs Art-Net vs sACN - choosing';

  @override
  String get aboutDmxToc9 => '9) Field diagrams (DMX / IP / pinout)';

  @override
  String get aboutDmxChecklistCopyTitle => 'DMX - Field checklist';

  @override
  String get aboutDmxChecklistCopyTitle2 => 'Art-Net / sACN - Field checklist';

  @override
  String get aboutDmxChecklistCopyB1 =>
      'Correct device mode (number of channels)';

  @override
  String get aboutDmxChecklistCopyB2 => 'Correct DMX address (no overlap)';

  @override
  String get aboutDmxChecklistCopyB3 => 'Daisy-chain (no passive Y)';

  @override
  String get aboutDmxChecklistCopyB4 => '120Ω termination on last device';

  @override
  String get aboutDmxChecklistCopyB5 =>
      'DMX/RS-485 cable (120Ω twisted pair) if possible';

  @override
  String get aboutDmxChecklistCopyB6 => 'Splitter opto if several branches';

  @override
  String get aboutDmxChecklistCopyB7 =>
      'Keep DMX away from interference sources (power supplies, dimmers) if possible';

  @override
  String get aboutDmxChecklistCopyB8 =>
      'If RDM: check splitter/node compatibility + impeccable wiring';

  @override
  String get aboutDmxChecklistCopyB9 =>
      'Dedicated network if possible (or VLAN)';

  @override
  String get aboutDmxChecklistCopyB10 =>
      'Switch correct; IGMP snooping recommended (sACN multicast)';

  @override
  String get aboutDmxChecklistCopyB11 =>
      'Unicast (often) or controlled multicast (avoid flood)';

  @override
  String get aboutDmxChecklistCopyB12 =>
      'Mapping universe ↔ verified ports/node';

  @override
  String get aboutDmxChecklistCopyB13 =>
      'Clear IP plan (addresses, mask, DHCP vs. static)';

  @override
  String get aboutDmxS1Title => '1) DMX, universes, addresses - the basics';

  @override
  String get aboutDmxS1Pill1 => '1 universe = 512 slots';

  @override
  String get aboutDmxS1Pill2 => '0-255 (8-bit)';

  @override
  String get aboutDmxS1Pill3 => '16-bit = 2 channels';

  @override
  String get aboutDmxS1Intro =>
      'DMX512 is a control protocol widely used in the entertainment industry (lighting, effects, dimmers). It\'s a serial stream (RS-485) that loops a \"frame\" containing up to 512 values. Each value = one channel (0→255).';

  @override
  String get aboutDmxS1RememberTitle => 'To remember';

  @override
  String get aboutDmxS1RememberB1 =>
      '1 DMX universe = 512 channels (slots) numbered 1→512.';

  @override
  String get aboutDmxS1RememberB2 =>
      'A device listens to a start address (e.g. 101) and consumes N channels (depending on its mode).';

  @override
  String get aboutDmxS1RememberB3 =>
      'The controller sends back everything continuously: if you stop transmitting, the devices \"freeze\" (or go into fallback).';

  @override
  String get aboutDmxS4bisTitle => '4bis) RDM - limits & compatibilities';

  @override
  String get aboutDmxS4bisPlaceholder => '... (keep your existing content)';

  @override
  String get aboutDmxS9Title => '9) Field diagrams (DMX / IP / pinout)';

  @override
  String get aboutDmxS9Diagram1 => 'DMX timing (break / MAB / slots)';

  @override
  String get aboutDmxS9Diagram2 => 'DMX topology: daisy-chain';

  @override
  String get aboutDmxS9Diagram3 => '120Ω termination';

  @override
  String get aboutDmxS9Diagram4 => 'sACN multicast: IGMP reminder (network)';

  @override
  String get aboutDmxS9Diagram5 => 'IP → nodes → DMX (Art-Net / sACN)';

  @override
  String get aboutDmxS9Diagram6 => 'Pinout XLR5 (DMX)';

  @override
  String get aboutDmxS10Title => '10) Quick checklist';

  @override
  String get aboutDmxS10CopyTooltip => 'Copy the checklist';

  @override
  String get aboutDmxS10CalloutTitle => 'Before you panic';

  @override
  String get aboutDmxS10B1 => 'Device mode + DMX address (always check).';

  @override
  String get aboutDmxS10B2 =>
      'Short chain with \"known OK\" cable for insulation.';

  @override
  String get aboutDmxS10B3 => 'Daisy-chain (no passive Y).';

  @override
  String get aboutDmxS10B4 => '120Ω termination on last device only.';

  @override
  String get aboutDmxS10B5 => 'Splitter opto if several branches.';

  @override
  String get aboutDmxS10B6 =>
      'If RDM: compat splitter/node + impeccable wiring.';

  @override
  String get aboutDmxS10B7 =>
      'In IP (Art-Net/sACN): correct switch, IGMP for sACN multicast, unicast if in doubt.';

  @override
  String get aboutDmxFooterNote =>
      'Indicative info (field). Exact behavior may vary according to consoles, nodes, switches and firmware.\nThe aim here is to understand and troubleshoot quickly and reliably.';

  @override
  String get aboutDmxPainterBreak => 'BREAK';

  @override
  String get aboutDmxPainterMab => 'MAB';

  @override
  String get aboutDmxPainterStartCode => 'Start\ncode';

  @override
  String get aboutDmxPainterSlots => 'Slots 1...N\n(up to 512)';

  @override
  String get aboutDmxPainterRefresh =>
      'Loop (refresh) - full universe ≈ ~44 Hz (order of magnitude)';

  @override
  String get aboutDmxPainterSourceA => 'SOURCE A\n(priority 100)';

  @override
  String get aboutDmxPainterSourceB => 'SOURCE B\n(prior 90)';

  @override
  String get aboutDmxPainterSwitchIgmp => 'SWITCH\nIGMP snooping';

  @override
  String get aboutDmxPainterMulticastUniverse => 'MULTICAST\nUniverse U';

  @override
  String get aboutDmxPainterRx => 'RX';

  @override
  String get aboutDmxPainterIgmpNote =>
      'Without IGMP: flood\nWith IGMP: subscriber ports only';

  @override
  String get aboutDmxPainterConsole => 'CONSOLE';

  @override
  String get aboutDmxPainterFix1 => 'FIX 1';

  @override
  String get aboutDmxPainterFix2 => 'FIX 2';

  @override
  String get aboutDmxPainterFix3 => 'FIX 3';

  @override
  String get aboutElectricitePageTitle => 'Electrical - field benchmarks';

  @override
  String get elecSection1Title => '1) Basics (W, A, V, kW)';

  @override
  String get elecSection1FormulasTitle => '3 useful formulas';

  @override
  String get elecSection1Formula1 => 'P(W) = U(V) × I(A)';

  @override
  String get elecSection1Formula2 => 'I(A) = P(W)/U(V)';

  @override
  String get elecSection1Formula3 => 'P(kW) = P(W)/1000';

  @override
  String get elecSection1FieldMarksTitle => 'Landmarks';

  @override
  String get elecSection1FieldMark1 =>
      'Mono 230V: 16A ≈ 3.7 kW | 32A ≈ 7.4 kW | 63A ≈ 14.5 kW';

  @override
  String get elecSection1FieldMark2 =>
      'Tri 400V: 16A ≈ 11 kW | 32A ≈ 22 kW | 63A ≈ 44 kW';

  @override
  String get elecSection2Title => '2) Connectors (Schuko / P17 / PowerCON)';

  @override
  String get elecSection2SchukoTitle => 'Schuko (household sockets)';

  @override
  String get elecSection2SchukoBullet1 =>
      'Typically 16A max (≈ 3.7 kW at 230V).';

  @override
  String get elecSection2SchukoBullet2 =>
      'Be careful with power strips and extension cords: they can heat up.';

  @override
  String get elecSection2P17Title => 'P17 / CEE (blue/red)';

  @override
  String get elecSection2P17Bullet1 =>
      'Blue: 230V mono (camping, small distro).';

  @override
  String get elecSection2P17Bullet2 =>
      'Red: 400V three-phase (distro, high-power).';

  @override
  String get elecSection2PowerconTitle => 'PowerCON (audio/lighting)';

  @override
  String get elecSection2PowerconBullet1 =>
      'PowerCON TRUE1 = more \"field\" (locking, IP).';

  @override
  String get elecSection2PowerconBullet2 =>
      'Check cable cross-section and protection.';

  @override
  String get elecSection3Title => '3) Mono / Tri (what\'s the difference)';

  @override
  String get elecSection3Paragraph =>
      'Mono = one phase + neutral (230V). Tri = 3 phases (400V between phases).';

  @override
  String get elecSection3PitfallsTitle => 'Frequent pitfalls';

  @override
  String get elecSection3Pitfall1 => 'Phase imbalance (one phase overloaded).';

  @override
  String get elecSection3Pitfall2 =>
      'Neutral heats up if high harmonics (LEDs, dimmers).';

  @override
  String get elecSection3Pitfall3 => 'Soil absent/doubtful on some sites.';

  @override
  String get elecSection3MethodTitle => 'Simple method';

  @override
  String get elecSection3MethodBullet1 => 'Spread heavy loads over L1/L2/L3.';

  @override
  String get elecSection3MethodBullet2 => 'Monitor neutral if many LEDs.';

  @override
  String get elecSection3MethodBullet3 => 'Clamp measurement if possible.';

  @override
  String get elecSection4Title => '4) Fast table (16A → 400A)';

  @override
  String get elecSection4MonoTitle => 'Mono 230V (≈ U×I)';

  @override
  String get elecSection4MonoCode =>
      '16A ≈ 3.7 kW\n32A ≈ 7.4 kW\n63A ≈ 14.5 kW\n125A ≈ 28.8 kW\n200A ≈ 46 kW\n';

  @override
  String get elecSection4TriTitle => 'Three 400V (≈ √3×U×I)';

  @override
  String get elecSection4TriCode =>
      '16A ≈ 11 kW\n32A ≈ 22 kW\n63A ≈ 44 kW\n125A ≈ 86 kW\n200A ≈ 138 kW\n400A ≈ 277 kW';

  @override
  String get elecSection4ImportantTitle => 'Important';

  @override
  String get elecSection4ImportantBullet1 =>
      'These are orders of magnitude (cosφ, harmonics, losses).';

  @override
  String get elecSection4ImportantBullet2 =>
      'Always validate protections + sections + temperature.';

  @override
  String get elecSection5Title => '6) Safety & pitfalls';

  @override
  String get elecSection5DontDoTitle => 'What not to do';

  @override
  String get elecSection5DontDoBullet1 =>
      'Chain power strips / extension leads in bulk.';

  @override
  String get elecSection5DontDoBullet2 => 'Mixing phases without knowing.';

  @override
  String get elecSection5DontDoBullet3 => '\"Bridger\" a dubious land.';

  @override
  String get elecSection5WarningTitle => 'Warning signs';

  @override
  String get elecSection5WarningBullet1 =>
      'Warm smell, lukewarm grips, repeated triggers.';

  @override
  String get elecSection5WarningBullet2 => 'Voltage drops (brown-out).';

  @override
  String get elecSection5WarningBullet3 =>
      'Tired\" or unsuitable circuit breaker.';

  @override
  String get elecSection6Title => '6) Checklist';

  @override
  String get elecSection6QuickTitle => 'Fast';

  @override
  String get elecSection6Bullet1 =>
      'Power supply type (mono/tri) + rating (A).';

  @override
  String get elecSection6Bullet2 => 'Phase distribution (main loads).';

  @override
  String get elecSection6Bullet3 => 'Protections (diff/disj) and panel status.';

  @override
  String get elecSection6Bullet4 =>
      'Cables: cross-section / length / temperature rise.';

  @override
  String get elecSection6Bullet5 => 'Earth: OK? (tester if possible).';

  @override
  String get elecFooterNote =>
      'Note: this content is a field checklist. On a real site, always comply with standards, local regulations and existing protection.';

  @override
  String get infoPageTitle => 'IT - field benchmarks';

  @override
  String get infoUsbTitle => '1) USB / USB-C / Thunderbolt';

  @override
  String get infoStorageTitle => '2) Storage (SATA / NVMe / SSD)';

  @override
  String get infoVideoLinksTitle => '3) Video links (DP / HDMI)';

  @override
  String get infoPcieGpuTitle => '4) PCIe / GPU (benchmarks)';

  @override
  String get infoChecklistTitle => '5) Checklist (tray)';

  @override
  String get infoSummaryCopy =>
      'INFO - benchmarks in the field\n- USB-C = form, not speed: check the standard.\n- NVMe (M.2) much faster than SATA.\n- DisplayPort/HDMI = standards, but beware of versions/cables.\n- On video servers: storage + GPU + throughput are the basis.';

  @override
  String get infoChecklistCopy =>
      'INFO - Checklist\n☐ Certified USB-C cables (data/video if required)\n☐ Suitable storage (NVMe if large streams)\n☐ Stable GPU drivers (known version)\n☐ Real resolution/FPS test\n☐ Avoid cheap adapters';

  @override
  String get infoUsbCriticalTitle => 'Critical point';

  @override
  String get infoUsbCriticalBullet1 =>
      'USB-C = connector (shape). It doesn\'t say how fast.';

  @override
  String get infoUsbCriticalBullet2 =>
      'A USB-C cable can be \"charge only\" and not pass data/video.';

  @override
  String get infoUsbSpeedTitle => 'Speed benchmarks (order of magnitude)';

  @override
  String get infoUsbSpeedBullet1 =>
      'USB 2.0: slow (keyboards, dongles, small peripherals).';

  @override
  String get infoUsbSpeedBullet2 => 'USB 3.x: much faster (disks, interfaces).';

  @override
  String get infoUsbSpeedBullet3 =>
      'USB4 / Thunderbolt: very high speed (dock, eGPU, video depending on hardware).';

  @override
  String get infoUsbParagraph =>
      'In show: if a device \"disconnects\", suspect the cable (quality/standard) before the device.';

  @override
  String get infoStorageSataNvmeTitle => 'SATA vs. NVMe';

  @override
  String get infoStorageSataNvmeBullet1 =>
      'SATA SSD: good and stable, but limited (old interface).';

  @override
  String get infoStorageSataNvmeBullet2 =>
      'SSD NVMe (M.2): much faster (ideal for media servers, large files).';

  @override
  String get infoStorageFieldTitle => 'Terrain video';

  @override
  String get infoStorageFieldBullet1 =>
      'Playback of large 4K/ProRes files → NVMe recommended.';

  @override
  String get infoStorageFieldBullet2 =>
      'Beware of temperature: an NVMe can throttle (slow down) if it gets too hot.';

  @override
  String get infoStorageFieldBullet3 =>
      'Always test in real-life conditions before the show.';

  @override
  String get infoVideoLinksImportantTitle => 'Important landmark';

  @override
  String get infoVideoLinksImportantBullet1 =>
      'Versions including cable + port + device must be compatible.';

  @override
  String get infoVideoLinksImportantBullet2 =>
      'Long distance = active converters / fiber often required.';

  @override
  String get infoVideoLinksCompareTitle => 'DP vs HDMI (very simplified)';

  @override
  String get infoVideoLinksCompareBullet1 =>
      'HDMI: ubiquitous (TVs, processors), but EDID/HDCP can get in the way.';

  @override
  String get infoVideoLinksCompareBullet2 =>
      'DisplayPort: very common on PCs, often very \"capable\" in terms of throughput.';

  @override
  String get infoPcieGpuParagraph =>
      'For video/mapping servers: GPU + bus + drivers = stability. Typical problems: drivers, cables, conversion, and output limitations.';

  @override
  String get infoPcieGpuFieldTitle => 'Land';

  @override
  String get infoPcieGpuFieldBullet1 =>
      'Block a stable driver version before a big show.';

  @override
  String get infoPcieGpuFieldBullet2 => 'Avoid \"cheap\" adapters.';

  @override
  String get infoPcieGpuFieldBullet3 =>
      'Test at the show\'s actual resolution/FPS.';

  @override
  String get infoChecklistQuickTitle => 'Fast';

  @override
  String get infoChecklistBullet1 => 'Correct cable/standard.';

  @override
  String get infoChecklistBullet2 => 'Storage adapted to the flow.';

  @override
  String get infoChecklistBullet3 => 'Stable drivers.';

  @override
  String get infoChecklistBullet4 => 'Real test before show.';

  @override
  String get infoChecklistBullet5 => 'Avoid cheap adapters.';

  @override
  String get infoFooterNote =>
      'Indicative info (field). Exact capacities vary according to equipment/versions.\nObjective: simple reference points + reliable method.';

  @override
  String get ipBasicsPageTitle =>
      'Network - IP bases / mask / DHCP (essential)';

  @override
  String get ipBasicsCopyMemoTooltip => 'Copy memo';

  @override
  String get ipBasicsCopyChecklistTooltip => 'Copy the checklist';

  @override
  String get ipBasicsMemo1 =>
      'IP = logical address to reach a device on a network.';

  @override
  String get ipBasicsMemo2 =>
      'Private (LAN): 10.x.x.x, 172.16-31.x.x, 192.168.x.x (not routed to the Internet).';

  @override
  String get ipBasicsMemo3 =>
      'Mask / subnet = tells you which part is \"network\" vs. \"machine\".';

  @override
  String get ipBasicsMemo4 =>
      'Same subnet = direct communication. Otherwise → gateway (router).';

  @override
  String get ipBasicsMemo5 =>
      'DHCP assigns IP automatically; static = useful for nodes/console.';

  @override
  String get ipBasicsToc1 => '1) What is an IP and what is it used for?';

  @override
  String get ipBasicsToc2 => '2) Why 192.x / 10.x / 172.x? (private addresses)';

  @override
  String get ipBasicsToc3 => '3) Mask & subnetting: understanding for real';

  @override
  String get ipBasicsToc4 => '4) DHCP, gateway, DNS: who does what?';

  @override
  String get ipBasicsToc5 =>
      '5) How two devices talk to each other (LAN vs. non-LAN)';

  @override
  String get ipBasicsToc6 =>
      '6) Simple IP \"show\" plans (ready-to-copy examples)';

  @override
  String get ipBasicsToc7 =>
      '7) Troubleshooting: symptoms → causes (field method)';

  @override
  String get ipBasicsToc8 =>
      '8) Mini-exercises (quickly check a mask / a network)';

  @override
  String get ipBasicsToc9 => '9) Quick checklist';

  @override
  String get ipBasicsSection1Paragraph =>
      'An IP address (IPv4) is a logical identifier on a network. It is used to say \"send this packet to this device\".\n\nWhen you plug in a console, an Art-Net/sACN node, a PC, a managed switch... everything that talks on a network needs to have a consistent IP so that devices can find each other.';

  @override
  String get ipBasicsSection1CalloutTitle => 'Mental image';

  @override
  String get ipBasicsSection1Bullet1 =>
      'MAC = hardware identifier (network card).';

  @override
  String get ipBasicsSection1Bullet2 =>
      'IP = \"postal\" address on a network (changeable).';

  @override
  String get ipBasicsSection1Bullet3 =>
      'Mask = \"district / zip code\" (defines subnetwork).';

  @override
  String get ipBasicsSection1Bullet4 =>
      'Gateway = \"neighborhood exit\" (router).';

  @override
  String get ipBasicsSection1Subtitle => 'IPv4 in 10 seconds';

  @override
  String get ipBasicsSection1SubBullet1 =>
      'Format: A.B.C.D (4 numbers from 0 to 255).';

  @override
  String get ipBasicsSection1SubBullet2 => 'Ex: 192.168.0.50';

  @override
  String get ipBasicsSection1SubBullet3 =>
      'It\'s not magic: it\'s 32 bits (4 bytes).';

  @override
  String get ipBasicsSection1SubBullet4 =>
      'What counts for you: IP + mask must be consistent between devices.';

  @override
  String get ipBasicsSection2Paragraph =>
      'Some IPv4 address ranges are reserved for private networks (LANs). They are not routed over the Internet. That\'s why they\'re used in shows: you can set up your own local network without \"consuming\" public IPs.';

  @override
  String get ipBasicsSection2CalloutTitle =>
      'The 3 large private beaches (LAN)';

  @override
  String get ipBasicsSection2Bullet1 =>
      '10.0.0.0 → 10.255.255.255 (often written \"10.x.x.x\")';

  @override
  String get ipBasicsSection2Bullet2 =>
      '172.16.0.0 → 172.31.255.255 (often \"172.16-31.x.x\")';

  @override
  String get ipBasicsSection2Bullet3 =>
      '192.168.0.0 → 192.168.255.255 (often \"192.168.x.x\")';

  @override
  String get ipBasicsSection2Subtitle1 => 'Why do we often see 192.168.x.x?';

  @override
  String get ipBasicsSection2SubBullet1 =>
      'Consumer box/routers often use 192.168.0.x or 192.168.1.x.';

  @override
  String get ipBasicsSection2SubBullet2 =>
      'This has become a \"de facto standard\" in small LANs.';

  @override
  String get ipBasicsSection2SubBullet3 =>
      'But in show, 10.x.x.x is handy if you want lots of addresses or several VLANs.';

  @override
  String get ipBasicsSection2Subtitle2 => 'And the famous 2.x.x.x (Art-Net)?';

  @override
  String get ipBasicsSection2SubBullet4 =>
      'Many Art-Net devices leave the factory with an IP 2.x.x.x (closed network).';

  @override
  String get ipBasicsSection2SubBullet5 =>
      'It\'s \"practical\" in plug&play (without DHCP), but surprising if your PC is in 192.168.x.x.';

  @override
  String get ipBasicsSection2SubBullet6 =>
      'Important: there\'s nothing magical about \"2.x\" for broadcast/unicast.';

  @override
  String get ipBasicsSection2SubBullet7 =>
      'What changes the scope of the broadcast is the mask (often /8 = 255.0.0.0 in legacy).';

  @override
  String get ipBasicsSection2SubBullet8 =>
      'Example: network 2.0.0.0/8 → broadcast = 2.255.255.255 (very large).';

  @override
  String get ipBasicsSection2SubBullet9 =>
      'Simple solution: put PC/console in the same range + same mask, or reconfigure the node on a 192/10 plane.';

  @override
  String get ipBasicsSection3Paragraph =>
      'The subnet mask tells you which addresses are \"in the same network\". Without a mask, an IP doesn\'t mean much.\n\nGround rule: if two devices are on the same subnet, they talk directly to each other. Otherwise, they need a gateway (router).';

  @override
  String get ipBasicsSection3Callout1Title => 'Most common masks';

  @override
  String get ipBasicsSection3Bullet1 =>
      '255.0.0.0 ( /8 ) → 10.x.x.x typical \"large\" network';

  @override
  String get ipBasicsSection3Bullet2 =>
      '255.255.0.0 ( /16 ) → 10.10.x.x or 192.168.x.x \"large\" network';

  @override
  String get ipBasicsSection3Bullet3 =>
      '255.255.255.0 ( /24 ) → network 192.168.0.x \"classic\" (254 devices)';

  @override
  String get ipBasicsSection3Callout2Title =>
      'Mask → broadcast address (very useful to understand)';

  @override
  String get ipBasicsSection3Bullet4 =>
      'Broadcast depends on the subnet, i.e. the mask (not \"2 vs 192\").';

  @override
  String get ipBasicsSection3Bullet5 =>
      '192.168.10.0/24 → broadcast = 192.168.10.255 (small network).';

  @override
  String get ipBasicsSection3Bullet6 =>
      '2.0.0.0/8 (255.0.0.0) → broadcast = 2.255.255.255 (huge network).';

  @override
  String get ipBasicsSection3Bullet7 =>
      'The \"bigger\" the network, the more noise a broadcast can make (if you use it often).';

  @override
  String get ipBasicsSection3Subtitle1 => 'Concrete example (most useful): /24';

  @override
  String get ipBasicsSection3SubBullet1 => 'IP: 192.168.0.50';

  @override
  String get ipBasicsSection3SubBullet2 => 'Mask: 255.255.255.0 ( /24 )';

  @override
  String get ipBasicsSection3SubBullet3 => 'Network: 192.168.0.0';

  @override
  String get ipBasicsSection3SubBullet4 =>
      'Devices \"in the same network\": 192.168.0.1 → 192.168.0.254';

  @override
  String get ipBasicsSection3SubBullet5 =>
      'If you switch to 192.168.1.50 → it\'s NOT the same network.';

  @override
  String get ipBasicsSection3Subtitle2 => 'Why subnetwork?';

  @override
  String get ipBasicsSection3SubBullet6 =>
      'Organization: separate \"light\", \"video\", \"intercom\", \"internet\"...';

  @override
  String get ipBasicsSection3SubBullet7 =>
      'Performance: limit noise (broadcast/multicast) to one group.';

  @override
  String get ipBasicsSection3SubBullet8 =>
      'Security: prevent \"guest\" PCs from seeing/disturbing the show network.';

  @override
  String get ipBasicsSection3SubBullet9 =>
      'Diagnostics: easier to know \"where\" a device is.';

  @override
  String get ipBasicsSection3Callout3Title => 'Classic trap';

  @override
  String get ipBasicsSection3Bullet8 =>
      'Same IP \"start\" ≠ same network if mask is not identical.';

  @override
  String get ipBasicsSection3Bullet9 =>
      'Ex: 10.0.0.5/8 and 10.0.0.200/24 → not the same logical perimeter.';

  @override
  String get ipBasicsSection4Subtitle1 => 'DHCP (automatic allocation)';

  @override
  String get ipBasicsSection4SubBullet1 =>
      'A DHCP server \"gives\": IP + mask + gateway + DNS.';

  @override
  String get ipBasicsSection4SubBullet2 =>
      'Practical: you plug it in, it works.';

  @override
  String get ipBasicsSection4SubBullet3 =>
      'Risk show: if DHCP drops/changes/conflicts → weird symptoms.';

  @override
  String get ipBasicsSection4Subtitle2 => 'Static (fixed IP)';

  @override
  String get ipBasicsSection4SubBullet4 =>
      'You define IP + mask (and possibly gateway/DNS).';

  @override
  String get ipBasicsSection4SubBullet5 =>
      'Very useful for: console, nodes, managed switch, AP Wi-Fi show.';

  @override
  String get ipBasicsSection4SubBullet6 =>
      'Risk: duplicate IP if plan unclear (conflict).';

  @override
  String get ipBasicsSection4Callout1Title => 'Gateway';

  @override
  String get ipBasicsSection4Bullet1 =>
      'This is the router\'s address: it\'s used to go \"outside the local network\".';

  @override
  String get ipBasicsSection4Bullet2 =>
      'If you set up an isolated show network (without Internet) → gateway often useless.';

  @override
  String get ipBasicsSection4Bullet3 =>
      'But if you want to exit to another VLAN / Internet → essential.';

  @override
  String get ipBasicsSection4Callout2Title => 'DNS';

  @override
  String get ipBasicsSection4Bullet4 =>
      'DNS = \"directory\": transforms a name (e.g. example.com) into an IP.';

  @override
  String get ipBasicsSection4Bullet5 =>
      'In show (Art-Net/sACN), often useless: you work in direct IP.';

  @override
  String get ipBasicsSection4Bullet6 =>
      'If you use services (upgrades, licenses, time server, streaming) → DNS becomes useful again.';

  @override
  String get ipBasicsSection4Subtitle3 => 'Simple rule (beginner-friendly)';

  @override
  String get ipBasicsSection4SubBullet7 =>
      'Small closed show: static everywhere, no gateway, no DNS.';

  @override
  String get ipBasicsSection4SubBullet8 =>
      'Show with Internet / multiple networks: controlled DHCP + DHCP reservations, or static plan + router.';

  @override
  String get ipBasicsSection5Paragraph =>
      'When A wants to talk to B, it looks at the mask :\n- If B is in the same subnet → A sends directly to the local network.\n- If B is outside the subnet → A sends to the gateway (router), which takes care of the rest.';

  @override
  String get ipBasicsSection5Callout1Title => 'Example (easy)';

  @override
  String get ipBasicsSection5Bullet1 => 'A = 192.168.0.10 /24';

  @override
  String get ipBasicsSection5Bullet2 =>
      'B = 192.168.0.50 /24 → same network → OK direct.';

  @override
  String get ipBasicsSection5Bullet3 =>
      'B = 192.168.1.50 /24 → different network → router/gateway needed.';

  @override
  String get ipBasicsSection5Subtitle => 'Why doesn\'t it ping?';

  @override
  String get ipBasicsSection5SubBullet1 =>
      'Different mask → A thinks B is \"somewhere else\" (or vice versa).';

  @override
  String get ipBasicsSection5SubBullet2 =>
      'No gateway → impossible to exit subnet.';

  @override
  String get ipBasicsSection5SubBullet3 =>
      'PC firewall → ping blocked (Windows very frequent).';

  @override
  String get ipBasicsSection5SubBullet4 =>
      'Cable / switch / VLAN: physically not in the same segment.';

  @override
  String get ipBasicsSection5Callout2Title =>
      'Broadcast vs. unicast (useful bonus)';

  @override
  String get ipBasicsSection5Bullet4 => 'Unicast: to a specific (clean) IP.';

  @override
  String get ipBasicsSection5Bullet5 =>
      'Broadcast: \"to all\" on the subnet (noisy).';

  @override
  String get ipBasicsSection5Bullet6 =>
      'In show: broadcast may work in small, but quickly becomes a source of noise in large networks.';

  @override
  String get ipBasicsSection6Subtitle1 =>
      'Plan A - ultra-simple (single network /24)';

  @override
  String get ipBasicsSection6Code1 =>
      'Network: 192.168.10.0/24 (mask 255.255.255.0)\n\nConsole: 192.168.10.10\nPC (control): 192.168.10.20\nNode 1: 192.168.10.101\nNode 2: 192.168.10.102\nManaged switch: 192.168.10.2\nGateway: (empty) or 192.168.10.1 if router present';

  @override
  String get ipBasicsSection6Callout1Title => 'Why it works';

  @override
  String get ipBasicsSection6Bullet1 =>
      'Everyone in the same subnet → no surprises.';

  @override
  String get ipBasicsSection6Bullet2 =>
      'Easy to explain, easy to troubleshoot.';

  @override
  String get ipBasicsSection6Bullet3 =>
      'Ideal for beginners / small to medium-sized shows.';

  @override
  String get ipBasicsSection6Subtitle2 =>
      'Plan B - \"10.x\" when you want to grow up';

  @override
  String get ipBasicsSection6Code2 =>
      'Network: 10.10.0.0/16 (mask 255.255.0.0)\n\nConsole: 10.10.0.10\nPC: 10.10.0.20\nNodes: 10.10.1.10 → 10.10.1.200\nSwitch: 10.10.0.2';

  @override
  String get ipBasicsSection6Callout2Title => 'When to use it';

  @override
  String get ipBasicsSection6Bullet4 =>
      'When you have a lot of equipment (or several zones).';

  @override
  String get ipBasicsSection6Bullet5 =>
      'When you plan VLAN later (light/video/IT).';

  @override
  String get ipBasicsSection6Subtitle3 =>
      'Plan C - compat Art-Net \"2.x.x.x\" (legacy)';

  @override
  String get ipBasicsSection6Code3 =>
      'Network: 2.0.0.0/8 (mask 255.0.0.0)\n\nPC/console: 2.0.0.10\nNode 1: 2.0.0.100\nNode 2: 2.0.0.101\n\n⚠️ Isolated network, no Internet, no routing.';

  @override
  String get ipBasicsSection6Callout3Title => 'Attention';

  @override
  String get ipBasicsSection6Bullet6 =>
      'This plan is practical for older / default equipment.';

  @override
  String get ipBasicsSection6Bullet7 =>
      'But don\'t mix it up with a \"normal\" LAN (192.168.x.x) without a router.';

  @override
  String get ipBasicsSection7Callout1Title => 'Symptoms → probable causes';

  @override
  String get ipBasicsSection7Bullet1 =>
      '\"I see the node but it\'s not responding\" → different mask / VLAN / firewall.';

  @override
  String get ipBasicsSection7Bullet2 =>
      '\"A device works then disappears\" → DHCP unstable / IP conflict.';

  @override
  String get ipBasicsSection7Bullet3 =>
      '\"Nothing works except on the switch\" → IP not in the same network / wrong cable / VLAN port.';

  @override
  String get ipBasicsSection7Bullet4 =>
      '\"Everything crawls / losses\" → broadcast/multicast too wide / low-end switch / network loop.';

  @override
  String get ipBasicsSection7Bullet5 =>
      '\"It works on wired but not on Wi-Fi\" → jitter / roaming / saturated band / power saving.';

  @override
  String get ipBasicsSection7Subtitle => '5-minute pro method';

  @override
  String get ipBasicsSection7SubBullet1 =>
      '1) Check IP + mask of console/PC and node.';

  @override
  String get ipBasicsSection7SubBullet2 =>
      '2) Check: same subnet (e.g. 192.168.10.x /24)';

  @override
  String get ipBasicsSection7SubBullet3 =>
      '3) Ping (if possible) + test access to node\'s web interface.';

  @override
  String get ipBasicsSection7SubBullet4 =>
      '4) If DHCP: list who has which IP (DHCP table) and check for duplicates.';

  @override
  String get ipBasicsSection7SubBullet5 =>
      '5) If sACN multicast: check IGMP snooping/querier (otherwise flood).';

  @override
  String get ipBasicsSection7Callout2Title => 'Very common trap';

  @override
  String get ipBasicsSection7Bullet6 =>
      'Inherited mask on a PC (255.255.0.0 instead of 255.255.255.0).';

  @override
  String get ipBasicsSection7Bullet7 =>
      'Result: you think you\'re \"in the same network\", but not like the other device.';

  @override
  String get ipBasicsSection8Subtitle1 =>
      'Exercise 1: same network or not (/24)';

  @override
  String get ipBasicsSection8SubBullet1 => 'A = 192.168.10.50 /24';

  @override
  String get ipBasicsSection8SubBullet2 =>
      'B = 192.168.10.200 /24 → ✅ same network';

  @override
  String get ipBasicsSection8SubBullet3 =>
      'B = 192.168.11.200 /24 → ❌ not the same network';

  @override
  String get ipBasicsSection8Subtitle2 => 'Exercise 2: /16 (255.255.0.0)';

  @override
  String get ipBasicsSection8SubBullet4 => 'A = 10.10.5.10 /16';

  @override
  String get ipBasicsSection8SubBullet5 =>
      'B = 10.10.200.20 /16 → ✅ same network (10.10.x.x)';

  @override
  String get ipBasicsSection8SubBullet6 =>
      'B = 10.11.200.20 /16 → ❌ not the same network';

  @override
  String get ipBasicsSection8CalloutTitle => 'Visual tip';

  @override
  String get ipBasicsSection8Bullet1 =>
      '/24 → first 3 identical numbers (A.B.C) = same network.';

  @override
  String get ipBasicsSection8Bullet2 =>
      '/16 → first 2 identical numbers (A.B) = same network.';

  @override
  String get ipBasicsSection8Bullet3 =>
      '/8 → 1st identical number (A) = same network.';

  @override
  String get ipBasicsSection8Subtitle3 => 'Exercise 3: avoiding \"weird\" IPs';

  @override
  String get ipBasicsSection8SubBullet7 =>
      '0.x.x.x: reserved (not a normal host IP).';

  @override
  String get ipBasicsSection8SubBullet8 =>
      '127.x.x.x: loopback (your PC itself).';

  @override
  String get ipBasicsSection8SubBullet9 =>
      '169.254.x.x: auto-IP when DHCP absent (APIPA) → sign of DHCP problem.';

  @override
  String get ipBasicsSection9CalloutTitle =>
      'Before looking for noon at 2 p.m.';

  @override
  String get ipBasicsSection9Bullet1 => 'Same subnet = consistent IP + mask.';

  @override
  String get ipBasicsSection9Bullet2 => 'No duplicate IPs (conflict).';

  @override
  String get ipBasicsSection9Bullet3 =>
      'DHCP: OK if mastered; otherwise clear static plan.';

  @override
  String get ipBasicsSection9Bullet4 =>
      'PC firewall: can block ping / discovery.';

  @override
  String get ipBasicsSection9Bullet5 =>
      'Switch/VLAN: right port, right VLAN, no loop.';

  @override
  String get ipBasicsSection9Bullet6 =>
      'sACN multicast: IGMP snooping/querier recommended.';

  @override
  String get ipBasicsChecklistCopy =>
      'Network - Quick checklist (IP)\n☐ All devices are in the same subnet (consistent IP + mask)\n☐ No duplicate IPs (conflict)\n☐ DHCP: either everyone in DHCP, or clear static plan (avoid fuzzy mix)\n☐ For Art-Net/sACN: dedicated network or VLAN if possible\n☐ Managed switch if multicast/IGMP (sACN)\n☐ Wi-Fi: avoid for critical data show (jitter), prefer wired\n☐ Simple test: ping + check mask/gateway';

  @override
  String get ipBasicsFooterNote =>
      'Objective: to understand enough to wire/configure/troubleshoot quickly on show.\nNetwork details can go deeper, but these basics cover 90% of field failures.';

  @override
  String get aboutDmxPainterTerm120 => 'TERM\n120Ω';

  @override
  String get aboutDmxPainterDaisyChainNote => '✅ Daisy-chain\n❌ No passive Y';

  @override
  String get aboutDmxPainterXlr5Title => 'XLR5 (DMX) - fast marker';

  @override
  String get aboutDmxPainterPin1 => 'Pin 1: Shield / ground';

  @override
  String get aboutDmxPainterPin2 => 'Pin 2: Data-';

  @override
  String get aboutDmxPainterPin3 =>
      'Pin 3: Data++, Data+, Data+, Data+, Data+, Data+, Data+, Data+.';

  @override
  String get aboutDmxPainterPin45 => 'Pin 4/5: \"data 2\" (rare / optional)';

  @override
  String get aboutDmxPainterXlr3Practice =>
      'In practice: XLR3 often used (1/2/3)';

  @override
  String get aboutDmxPainterLastFixture => 'LATEST\nAPPARATUS';

  @override
  String get aboutDmxPainterTerminationLine =>
      'Termination = 120Ω at end of line';

  @override
  String get aboutDmxPainter120Between => '120Ω\nbetween\nData- and Data+';

  @override
  String get aboutDmxPainterOneTermination =>
      '✅ A single ending\n❌ Not in the middle\n❌ Not on each branch';

  @override
  String get aboutDmxPainterConsoleIp => 'CONSOLE\nArt-Net / sACN';

  @override
  String get aboutDmxPainterSwitchSacn => 'SWITCH\n(IGMP for sACN)';

  @override
  String get aboutDmxPainterNode1 => 'NODE 1\nDMX OUT';

  @override
  String get aboutDmxPainterNode2 => 'NODE 2\nDMX OUT';

  @override
  String get aboutDmxPainterFix => 'FIX';

  @override
  String get aboutDmxPainterManyUniverses =>
      '✅ Many universes\n✅ Nodes close to machines';

  @override
  String get aboutArtnetSection2Paragraph =>
      'Your objective: to ensure that each universe emitted by the source arrives at the right node (and DMX port) without ambiguity. Most Art-Net failures = bad universes, bad subnet/net, or broadcast saturation.';

  @override
  String get aboutArtnetSection2CalloutTitle =>
      'Simple method (avoids 80% of errors)';

  @override
  String get aboutArtnetSection2Bullet1 =>
      '1) Write on paper: \"Universe 1 → Node A port 1\", \"Universe 2 → Node A port 2\", etc.';

  @override
  String get aboutArtnetSection2Bullet2 =>
      '2) Set stable IPs (DHCP reserved or static).';

  @override
  String get aboutArtnetSection2Bullet3 =>
      '3) Use unicast if you have more than one node or a shared network.';

  @override
  String get aboutArtnetSection2Subtitle1 => 'Broadcast vs. Unicast';

  @override
  String get aboutArtnetSection2SubBullet1 =>
      'Broadcast: you send to everyone → easy but can \"flood\" a switch.';

  @override
  String get aboutArtnetSection2SubBullet2 =>
      'Unicast: you send to the node\'s IP → cleaner and more predictable.';

  @override
  String get aboutArtnetSection2SubBullet3 => 'En show: if in doubt → unicast.';

  @override
  String get aboutArtnetSection2Subtitle2 => 'Universe: hands-on';

  @override
  String get aboutArtnetSection2SubBullet4 =>
      'Keep numbering simple (e.g. 1...N).';

  @override
  String get aboutArtnetSection2SubBullet5 =>
      'Avoid \"one universe everywhere\": document your mappings.';

  @override
  String get aboutArtnetSection2SubBullet6 =>
      'On some setups, \"Net/Subnet/Universe\" exists: think \"mapping\", not \"magic\".';

  @override
  String get aboutArtnetSection3CalloutTitle =>
      'The \"real\" limits (in order)';

  @override
  String get aboutArtnetSection3Bullet1 =>
      'Wi-Fi: variable latency + losses → flicker or stalls.';

  @override
  String get aboutArtnetSection3Bullet2 =>
      'Broadcast: overloads a LAN (everyone receives everything).';

  @override
  String get aboutArtnetSection3Bullet3 =>
      'Low-end\" switch: limited buffers, mediocre multicast/broadcast management.';

  @override
  String get aboutArtnetSection3Bullet4 =>
      'Nodes: firmware/CPU limit (number of universes, frequency, options).';

  @override
  String get aboutArtnetSection3Bullet5 =>
      'PC/source: driver, CPU load, antivirus, network card, etc.';

  @override
  String get aboutArtnetSection3Subtitle1 => 'Refresh speed';

  @override
  String get aboutArtnetSection3SubBullet1 =>
      'Classic\" DMX is often ~20-44 fps depending on the frame.';

  @override
  String get aboutArtnetSection3SubBullet2 =>
      'On IP, you can send more, but the nodes don\'t always follow (and it\'s not always useful).';

  @override
  String get aboutArtnetSection3SubBullet3 =>
      'Stability > frequency: stable at 30-40 fps is better than \"fast\" but unstable.';

  @override
  String get aboutArtnetSection3Subtitle2 => 'Simple rules';

  @override
  String get aboutArtnetSection3SubBullet4 => 'Dedicated network (or VLAN).';

  @override
  String get aboutArtnetSection3SubBullet5 => 'Unicast if several nodes.';

  @override
  String get aboutArtnetSection3SubBullet6 => 'Wired for critical shows.';

  @override
  String get aboutArtnetSection4Paragraph =>
      'A node = IP → DMX. It can have 1, 2, 4, 8 DMX ports. Stability depends on the node AND the DMX wiring on the output side (termination, topology, splitters).';

  @override
  String get aboutArtnetSection4Subtitle1 => 'Nodes vs Splitters';

  @override
  String get aboutArtnetSection4SubBullet1 =>
      'Node: converts IP→DMX (and sometimes DMX→IP).';

  @override
  String get aboutArtnetSection4SubBullet2 =>
      'DMX splitter: splits a DMX line into branches (opto recommended).';

  @override
  String get aboutArtnetSection4SubBullet3 =>
      'Good design: IP as close as possible, then short, clean DMX.';

  @override
  String get aboutArtnetSection4CalloutTitle =>
      'RDM on Art-Net (variable support)';

  @override
  String get aboutArtnetSection4Bullet1 =>
      'Some nodes support an RDM proxy: the console sees/configures RDM devices via IP.';

  @override
  String get aboutArtnetSection4Bullet2 =>
      'Others don\'t support RDM at all, or only partially.';

  @override
  String get aboutArtnetSection4Bullet3 =>
      'A \"classic\" opto splitter can block the RDM return (depending on the model).';

  @override
  String get aboutArtnetSection4Bullet4 =>
      'Tip: if you want RDM, explicitly choose RDM-compatible hardware.';

  @override
  String get aboutArtnetSection4Subtitle2 => 'Good field reflexes';

  @override
  String get aboutArtnetSection4SubBullet4 =>
      'If DMX unstable: DMX regulation first (termination, cable, passive Y), then IP only.';

  @override
  String get aboutArtnetSection4SubBullet5 =>
      'If RDM unstable: disable RDM to check that pure DMX is stable.';

  @override
  String get aboutArtnetSection5CalloutTitle => 'Symptoms → probable causes';

  @override
  String get aboutArtnetSection5Bullet1 =>
      'Flicker all over the set → Wi-Fi, broadcast flood, switch saturated.';

  @override
  String get aboutArtnetSection5Bullet2 =>
      'One node OK, the other not → universe/mapping, IP, unicast misconfigured.';

  @override
  String get aboutArtnetSection5Bullet3 =>
      'Random dropouts → faulty RJ45 cable, unstable switch, PC dropping packets.';

  @override
  String get aboutArtnetSection5Bullet4 =>
      'Single DMX port of a node KO → DMX cable, termination, device breaks line.';

  @override
  String get aboutArtnetSection5Bullet5 =>
      'RDM discovery impossible → node/splitter not RDM-compatible, DMX wiring \"borderline\".';

  @override
  String get aboutArtnetSection5Subtitle => 'Quick method';

  @override
  String get aboutArtnetSection5SubBullet1 =>
      '1) Unicast to a single node (simple test).';

  @override
  String get aboutArtnetSection5SubBullet2 =>
      '2) Check universe/mapping (paper + node config).';

  @override
  String get aboutArtnetSection5SubBullet3 =>
      '3) Direct wired test (PC → switch → node) with known cable OK.';

  @override
  String get aboutArtnetSection5SubBullet4 =>
      '4) Isolate DMX: node → 1 device + termination.';

  @override
  String get aboutArtnetSection6Subtitle1 =>
      'Own architecture (IP → nodes → short DMX)';

  @override
  String get aboutArtnetSection6Subtitle2 => 'Broadcast vs Unicast (idea)';

  @override
  String get aboutArtnetAssetsCopyTitle => 'Recommended assets (optional)';

  @override
  String get aboutArtnetExampleLabel => 'example';

  @override
  String get aboutArtnetAssetsCopyTooltip => 'Copy asset list';

  @override
  String get aboutArtnetAssetsParagraph =>
      'Section to illustrate the network (RJ45, switch, cables). If the assets don\'t exist, the app displays a clean fallback.';

  @override
  String get aboutArtnetAssetsExamplesTitle => 'Examples';

  @override
  String get aboutArtnetAssetsRj45Label => 'RJ45';

  @override
  String get aboutArtnetAssetsRj45Hint => 'Ethernet connector';

  @override
  String get aboutArtnetAssetsSwitchLabel => 'Switch';

  @override
  String get aboutArtnetAssetsSwitchHint =>
      'Switch (ideally managed if IGMP/VLAN)';

  @override
  String get aboutArtnetAssetsCableLabel => 'Ethernet cable';

  @override
  String get aboutArtnetAssetsCableHint => 'Cat5e/Cat6 = reliable base';

  @override
  String get aboutArtnetChecklistCopyTitle => 'Art-Net - Field checklist';

  @override
  String get aboutArtnetChecklistCopyTooltip => 'Copy the checklist';

  @override
  String get aboutArtnetChecklistTitle => 'Before you panic';

  @override
  String get aboutArtnetChecklistBullet1 => 'Unicast if several nodes.';

  @override
  String get aboutArtnetChecklistBullet2 =>
      'Dedicated network (or VLAN) if possible.';

  @override
  String get aboutArtnetChecklistBullet3 => 'Wired for critical show.';

  @override
  String get aboutArtnetChecklistBullet4 => 'Documented universe/mapping.';

  @override
  String get aboutArtnetChecklistBullet5 =>
      'Simple IP test → 1 node → 1 device + termination.';

  @override
  String get aboutArtnetChecklistBullet6 =>
      'If RDM: RDM proxy node confirmed + stable DMX wiring';

  @override
  String get aboutArtnetFooterNote =>
      'Indicative info (field). Depending on nodes/switch/firmware, behavior may vary.\nThe aim here is to understand and diagnose quickly.';

  @override
  String get aboutArtnetDiagramSourceLabel => 'SOURCE\n(PC/console)';

  @override
  String get aboutArtnetDiagramSwitchLabel => 'SWITCH';

  @override
  String get aboutArtnetDiagramNode1Label => 'NODE 1\nDMX OUT';

  @override
  String get aboutArtnetDiagramNode2Label => 'NODE 2\nDMX OUT';

  @override
  String get aboutArtnetDiagramFixLabel => 'FIX';

  @override
  String get aboutArtnetDiagramInfoLabel => 'IP long / DMX short';

  @override
  String get aboutArtnetDiagramSourceShortLabel => 'SOURCE';

  @override
  String get aboutArtnetDiagramNodeALabel => 'NODE A';

  @override
  String get aboutArtnetDiagramNodeBLabel => 'NODE B';

  @override
  String get aboutArtnetDiagramNodeCLabel => 'NODE C';

  @override
  String get aboutArtnetDiagramUnicastLabel => 'Unicast: packets to a node';

  @override
  String get aboutArtnetDiagramBroadcastLabel => 'Broadcast: everyone receives';

  @override
  String get aboutArtnetMissingAssetLabel => 'Missing asset';

  @override
  String get aboutRegistryDmxTitle => 'DMX - operation (simple & complete)';

  @override
  String get aboutRegistryDmxSubtitle =>
      'Universe, addresses, frames, RS-485 wiring, termination, field errors.\nIncludes schematics + checklist.';

  @override
  String get aboutRegistryArtnetTitle =>
      'Art-Net - DMX over IP (nodes, unicast/broadcast)';

  @override
  String get aboutRegistryArtnetSubtitle =>
      'DMX universe over Ethernet/UDP, nodes, broadcast vs. unicast.\nReal-world limits, network stability, hardware-based RDM, schematics + checklist.';

  @override
  String get aboutRegistrySacnTitle =>
      'sACN / E1.31 - multicast, IGMP, priorities';

  @override
  String get aboutRegistrySacnSubtitle =>
      'Pro network-oriented DMX-over-IP standard.\nMulticast/unicast, IGMP snooping/query, multi-source priorities, schematics + checklist.';

  @override
  String get aboutRegistryIpBasicsTitle =>
      'Network - IP bases / mask / DHCP (essential)';

  @override
  String get aboutRegistryIpBasicsSubtitle =>
      'Understanding IP, mask, gateway, DHCP vs. static.\nConcrete examples (2.x.x.x, 10.x, 192.168.x), quick tests, show traps.';

  @override
  String get aboutRegistryReseauTitle =>
      'Network - RJ45 / Fiber / speeds & lengths';

  @override
  String get aboutRegistryReseauSubtitle =>
      'Cat5e→Cat8, OM3/OM4/OS2 fiber, LC/SC/MPO, typical distances, show best practices.';

  @override
  String get aboutRegistryNetworkTitle =>
      'Light networking - VLAN, IGMP, Wi-Fi vs. wired';

  @override
  String get aboutRegistryNetworkSubtitle =>
      'Simple and robust architecture for Art-Net/sACN.\nVLAN, IGMP snooping/query, Wi-Fi (jitter), switches, schematics + checklist.';

  @override
  String get aboutRegistryVideoTitle => 'Video - SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutRegistryVideoSubtitle =>
      'Choose according to latency, reliability, cabling, LAN vs WAN.\nTables + diagram.';

  @override
  String get aboutRegistryElectriciteTitle =>
      'Electrical - Schuko / P17 / power ratings';

  @override
  String get aboutRegistryElectriciteSubtitle =>
      'Connectors, mono/tri, fast kW panels (16A→400A), field traps.';

  @override
  String get aboutRegistryInformatiqueTitle =>
      'Computers - USB / HDMI / DP / SATA / NVMe...';

  @override
  String get aboutRegistryInformatiqueSubtitle =>
      'Useful flow rates, versions, real limits, marketing pitfalls.';

  @override
  String get aboutUniverseToHexColHex => 'Hex';

  @override
  String get aboutUniverseToHexNote => 'Index = Universe - 1 (base 0).';

  @override
  String get aboutNetworkPageTitle => 'Light networking - VLAN, IGMP, Wi-Fi';

  @override
  String get aboutNetworkCopyTooltip => 'Copy markers';

  @override
  String get aboutNetworkChecklistCopyTooltip => 'Copy';

  @override
  String get aboutNetworkChecklistTitle => 'Before opening Wireshark 😄';

  @override
  String get aboutNetworkFooterNote =>
      'Indicative info (field). Depending on network hardware, IGMP/VLAN may be essential.\nObjective: keep it simple and robust.';

  @override
  String get aboutNetworkCopy1 =>
      'Light network: simple, dedicated, stable aim.';

  @override
  String get aboutNetworkCopy2 => 'VLAN = traffic separation (light vs. rest).';

  @override
  String get aboutNetworkCopy3 =>
      'IGMP = indispensable if large-scale multicast sACN.';

  @override
  String get aboutNetworkCopy4 =>
      'Wi-Fi = ok for troubleshooting, rarely ok for critical production.';

  @override
  String get aboutNetworkChecklistCopy =>
      'Lighting network - Checklist\n☐ Dedicated network or light VLAN\n☐ Clear IP plan (DHCP or static) + mask ok\n☐ Switch correct; loops avoided\n☐ sACN multicast: IGMP snooping ON\n☐ IGMP querier present in VLAN (if infra requires it)\n☐ Unicast troubleshooting (especially Art-Net)\n☐ Wi-Fi: avoid critical prod (jitter/losses)\n☐ Tests: stable ping + progressive load (universe)';

  @override
  String get aboutNetworkToc1 => '1) Objective: stable network';

  @override
  String get aboutNetworkToc2 => '2) IP plan (simple)';

  @override
  String get aboutNetworkToc3 => '3) VLAN (separation)';

  @override
  String get aboutNetworkToc4 => '4) IGMP (sACN multicast)';

  @override
  String get aboutNetworkToc5 => '5) Wi-Fi vs. wired';

  @override
  String get aboutNetworkToc6 => '6) Switch: what you need';

  @override
  String get aboutNetworkToc7 => '7) Schematics';

  @override
  String get aboutNetworkToc8 => '8) Checklist';

  @override
  String get aboutNetworkBasicsPill1 => 'Dedicated/VLAN';

  @override
  String get aboutNetworkBasicsPill2 => 'Wired';

  @override
  String get aboutNetworkBasicsPill3 => 'IGMP if multicast';

  @override
  String get aboutNetworkBasicsParagraph =>
      'A light network must be predictable: low loss, low jitter, simple architecture. When things go wrong, it\'s rarely \"the protocol\" and often the infra (switch, Wi-Fi, loops, flood).';

  @override
  String get aboutNetworkBasicsCalloutTitle => 'Basic rule';

  @override
  String get aboutNetworkBasicsBullet1 =>
      'If you can: wired + correct switch + dedicated network (or VLAN).';

  @override
  String get aboutNetworkBasicsBullet2 =>
      'If you must share: VLAN + clear rules.';

  @override
  String get aboutNetworkBasicsBullet3 =>
      'sACN multicast: IGMP quickly becomes mandatory.';

  @override
  String get aboutNetworkPlanIpParagraph =>
      'Choose a simple, consistent strategy. Two approaches: DHCP (simple) or static (predictable). Worst case scenario: an undocumented mix.';

  @override
  String get aboutNetworkPlanIpCalloutTitle => 'Sample plan (simple)';

  @override
  String get aboutNetworkPlanIpBullet1 => 'VLAN light: 10.10.0.0/24';

  @override
  String get aboutNetworkPlanIpBullet2 => 'Console/PC: 10.10.0.10';

  @override
  String get aboutNetworkPlanIpBullet3 => 'Nodes: 10.10.0.100-150';

  @override
  String get aboutNetworkPlanIpBullet4 => 'Switch mgmt: 10.10.0.2';

  @override
  String get aboutNetworkPlanIpSubtitle => 'Classic errors';

  @override
  String get aboutNetworkPlanIpSubBullet1 =>
      'Different mask (e.g. /24 vs /16) → invisible machines.';

  @override
  String get aboutNetworkPlanIpSubBullet2 =>
      'Two devices same IP → random behavior.';

  @override
  String get aboutNetworkPlanIpSubBullet3 =>
      'DHCP + static on same range without control → conflicts.';

  @override
  String get aboutNetworkVlanParagraph =>
      'A VLAN allows you to isolate the light from the rest (internet, video production, guests...). It avoids network noise and reduces the risk of another service breaking up your show.';

  @override
  String get aboutNetworkVlanCalloutTitle => 'What you earn';

  @override
  String get aboutNetworkVlanBullet1 => 'Less parasitic traffic.';

  @override
  String get aboutNetworkVlanBullet2 =>
      'Less risk (external DHCP, unwanted broadcast).';

  @override
  String get aboutNetworkVlanBullet3 =>
      'Easier debugging (everything in the VLAN = light).';

  @override
  String get aboutNetworkVlanSubtitle => 'Attention';

  @override
  String get aboutNetworkVlanSubBullet1 =>
      'A VLAN = all ports must be properly configured (access/trunk).';

  @override
  String get aboutNetworkVlanSubBullet2 =>
      'If you don\'t master: a dedicated \"physical\" network is often simpler.';

  @override
  String get aboutNetworkIgmpPill1 => 'IGMP snooping';

  @override
  String get aboutNetworkIgmpPill2 => 'IGMP querier';

  @override
  String get aboutNetworkIgmpPill3 => 'Multicast flooding';

  @override
  String get aboutNetworkIgmpParagraph =>
      'IGMP snooping lets the switch know which ports want which multicast. Without it, multicast can be flooded on all ports → saturation.';

  @override
  String get aboutNetworkIgmpCalloutTitle => 'IGMP querier (simple idea)';

  @override
  String get aboutNetworkIgmpBullet1 =>
      'In some networks/VLANs, a querier is required to maintain IGMP subscriptions.';

  @override
  String get aboutNetworkIgmpBullet2 =>
      'No quibble: depending on the switch, subscriptions expire and you see \"glitches\".';

  @override
  String get aboutNetworkIgmpBullet3 =>
      'If you\'re on a small, dedicated network: sometimes everything works, but on a large network: it\'s critical.';

  @override
  String get aboutNetworkIgmpSubtitle => 'Diagram : IGMP (idea)';

  @override
  String get aboutNetworkWifiSubtitle1 => 'Wired';

  @override
  String get aboutNetworkWifiSubtitle2 => 'Wi-Fi';

  @override
  String get aboutNetworkWifiSubBullet1 =>
      '✅ Stable latency, low losses (if clean infrared).';

  @override
  String get aboutNetworkWifiSubBullet2 => '✅ Recommended for prod.';

  @override
  String get aboutNetworkWifiSubBullet3 => '✅ Practical (quick setup, tablet).';

  @override
  String get aboutNetworkWifiSubBullet4 =>
      '❌ Variable latency (jitter), losses, interference.';

  @override
  String get aboutNetworkWifiSubBullet5 =>
      '❌ Multicast sometimes poorly managed according to AP/config.';

  @override
  String get aboutNetworkWifiSubBullet6 =>
      'OK troubleshooting / small, non-critical setups, rarely OK in loaded show.';

  @override
  String get aboutNetworkWifiCalloutTitle => 'Simple rule';

  @override
  String get aboutNetworkWifiBullet1 => 'Critical show = wired.';

  @override
  String get aboutNetworkWifiBullet2 =>
      'Wi-Fi = operator comfort (UI), not main DMX/IP transport if high volume.';

  @override
  String get aboutNetworkSwitchCalloutTitle => 'Minimum recommended';

  @override
  String get aboutNetworkSwitchBullet1 => 'Correct Ethernet switch (not hub).';

  @override
  String get aboutNetworkSwitchBullet2 => 'OK cables (RJ45, connectors).';

  @override
  String get aboutNetworkSwitchBullet3 => 'Avoid loops (or controlled STP).';

  @override
  String get aboutNetworkSwitchBullet4 => 'If sACN multicast: IGMP snooping.';

  @override
  String get aboutNetworkSwitchSubtitle => 'Managed vs unmanaged';

  @override
  String get aboutNetworkSwitchSubBullet1 =>
      'Unmanaged: ok small dedicated network (simple).';

  @override
  String get aboutNetworkSwitchSubBullet2 =>
      'Managed: useful for VLAN/IGMP/diagnostics (large networks).';

  @override
  String get aboutNetworkDiagramsSubtitle1 => 'VLAN: separate light / rest';

  @override
  String get aboutNetworkDiagramsSubtitle2 => 'Wi-Fi vs. wired (idea)';

  @override
  String get aboutNetworkChecklistBullet1 => 'Clear IP plan, consistent mask.';

  @override
  String get aboutNetworkChecklistBullet2 => 'Dedicated network / VLAN light.';

  @override
  String get aboutNetworkChecklistBullet3 => 'Switch OK, no loops.';

  @override
  String get aboutNetworkChecklistBullet4 => 'IGMP for multicast sACN.';

  @override
  String get aboutNetworkChecklistBullet5 => 'Wi-Fi avoided in critical prod.';

  @override
  String get videoCameraExposureTitle => 'Camera exposure';

  @override
  String get videoCameraExposureSubtitle =>
      'Lux → EV, ISO, speed and aperture.';

  @override
  String get videoCamPageTitle => 'Camera exposure';

  @override
  String get videoCamInfoTitle => 'Information';

  @override
  String get videoCamIntro =>
      'Indicative calculations for linking lux, ISO, speed and aperture.';

  @override
  String get videoCamInputsTitle => 'Inputs';

  @override
  String get videoCamLuxLabel => 'Lux';

  @override
  String get videoCamLuxHint => 'Ex: 500';

  @override
  String get videoCamIsoLabel => 'ISO';

  @override
  String get videoCamIsoHint => 'Ex: 800';

  @override
  String get videoCamShutterLabel => 'Speed (s)';

  @override
  String get videoCamShutterHint => 'Ex: 1/50';

  @override
  String get videoCamApertureLabel => 'Aperture (f/)';

  @override
  String get videoCamApertureHint => 'Ex: 2.8';

  @override
  String get videoCamEvEmpty => '-';

  @override
  String get videoCamNote =>
      'Indicative values: calibration depends on sensor, scene and standards.';

  @override
  String videoCamEvValue(Object ev) {
    return 'EV $ev';
  }

  @override
  String videoCamApertureResult(Object aperture) {
    return 'Aperture: f/$aperture';
  }

  @override
  String videoCamShutterResult(Object shutter) {
    return 'Speed : $shutter s';
  }

  @override
  String get aboutDmxS2Title => '2) DMX frame - break, start code, channels';

  @override
  String get aboutDmxS2PillBreak => 'Break';

  @override
  String get aboutDmxS2PillStartCode => 'Start code';

  @override
  String get aboutDmxS2PillSlots512 => '512 slots';

  @override
  String get aboutDmxS2PillRefresh => 'Refresh';

  @override
  String get aboutDmxS2Intro =>
      'A DMX frame is sent in a loop. It begins with a \"break\" (silence), then a start code, then up to 512 values (0-255). Each fixture reads only the channels relevant to it (according to its address and mode).';

  @override
  String get aboutDmxS2HowToReadTitle => 'Read a frame (very simply)';

  @override
  String get aboutDmxS2HowToReadB1 =>
      'Break + MAB: marks the start of the frame (resynchronization).';

  @override
  String get aboutDmxS2HowToReadB2 =>
      'Start code: usually 0x00 (lighting data).';

  @override
  String get aboutDmxS2HowToReadB3 =>
      'Slots 1→512: each slot = 1 channel (0-255).';

  @override
  String get aboutDmxS2HowToReadB4 =>
      'The frame starts again continuously: it\'s normal to \"overwrite\" the old value.';

  @override
  String get aboutDmxS2PracticalTitle => 'In practice';

  @override
  String get aboutDmxS2PracticalB1 =>
      'A 16-bit mode uses 2 channels for the same function (e.g. Pan coarse + Pan fine).';

  @override
  String get aboutDmxS2PracticalB2 =>
      'The more universes you send, the greater the overall load (consoles/nodes/network).';

  @override
  String get aboutDmxS2PracticalB3 =>
      'If you have flicker, think cable/termination/connections first before suspecting the console.';

  @override
  String get aboutDmxS3Title => '3) DMX cabling - RS-485, topology, pinout';

  @override
  String get aboutDmxS3PillRs485 => 'RS-485';

  @override
  String get aboutDmxS3PillDaisyChain => 'Daisy chain';

  @override
  String get aboutDmxS3PillNoY => 'No Y';

  @override
  String get aboutDmxS3Pill120ohm => '120Ω';

  @override
  String get aboutDmxS3Intro =>
      'DMX512 is based on RS-485: a differential bus that likes clean lines. The golden rule: a daisy-chain from the source to the devices, terminated at the end.';

  @override
  String get aboutDmxS3TopologyTitle => 'Recommended topology';

  @override
  String get aboutDmxS3TopologyB1 =>
      'Source → Device 1 → Device 2 → ... → last device.';

  @override
  String get aboutDmxS3TopologyB2 =>
      'Avoid Y-branches: they create reflections (instability).';

  @override
  String get aboutDmxS3TopologyB3 =>
      'If you need to make branches: use an opto-isolated DMX splitter.';

  @override
  String get aboutDmxS3PinoutTitle => 'Connectors (reminder)';

  @override
  String get aboutDmxS3CablesTitle => 'Cables: what really works';

  @override
  String get aboutDmxS3CablesB1 =>
      'Use a DMX cable (impedance ~120 Ω), not a random microphone (except for short troubleshooting).';

  @override
  String get aboutDmxS3CablesB2 =>
      'Keep lengths reasonable and avoid tight windings near power supplies/dimmers.';

  @override
  String get aboutDmxS3CablesB3 =>
      'A bad cable = sometimes \"it works\"... until it doesn\'t (humidity, length, load).';

  @override
  String get aboutDmxS4Title => '4) Termination & splitters - bus stability';

  @override
  String get aboutDmxS4Intro =>
      'On an RS-485 bus, termination prevents reflections at the end of the line. Opto-isolated splitters are used to create clean branches and protect the source.';

  @override
  String get aboutDmxS4TerminatorTitle => 'Termination (120 Ω): when and how';

  @override
  String get aboutDmxS4TerminatorB1 =>
      'Terminate the last device (or XLR plug).';

  @override
  String get aboutDmxS4TerminatorB2 =>
      'Only one termination per line (not everywhere).';

  @override
  String get aboutDmxS4TerminatorB3 =>
      'Indispensable on long lines, heavy loads, noisy environments.';

  @override
  String get aboutDmxS4SplittersTitle => 'Splitters / opto-isolation';

  @override
  String get aboutDmxS4SplittersB1 => 'Makes 2, 4, 8 branches without \"Y\".';

  @override
  String get aboutDmxS4SplittersB2 =>
      'Electrically insulates: limits ground loops and protects the console/node.';

  @override
  String get aboutDmxS4SplittersB3 =>
      'Handy for re-routing a signal over long distances.';

  @override
  String get aboutDmxS5Title =>
      '5) Troubleshooting - simple method (fast and reliable)';

  @override
  String get aboutDmxS5Intro =>
      'When a fixture doesn\'t respond, the key is to isolate: is it the address, the mode, the DMX line, or the fixture? Follow a short checklist before reconfiguring everything.';

  @override
  String get aboutDmxS5QuickChecksTitle => 'Quick checklist';

  @override
  String get aboutDmxS5QuickB1 =>
      'Correct DMX address (and not 001 vs 000 according to the display).';

  @override
  String get aboutDmxS5QuickB2 => 'Right DMX mode (number of channels)?';

  @override
  String get aboutDmxS5QuickB3 =>
      'Good universe / output (console, node, port)?';

  @override
  String get aboutDmxS5QuickB4 =>
      'Test with a known OK cable, then replace one by one.';

  @override
  String get aboutDmxS5QuickB5 =>
      'Add/remove a termination at the end of the line to see the effect.';

  @override
  String get aboutDmxS5IfFlickerTitle => 'If it flickers / picks up';

  @override
  String get aboutDmxS5IfFlickerB1 =>
      'Look for a hidden \"Y\", a mismatched splitter, or a bad XLR adapter.';

  @override
  String get aboutDmxS5IfFlickerB2 =>
      'Keep DMX away from power supplies/dimmers, avoid large cable loops.';

  @override
  String get aboutDmxS5IfFlickerB3 =>
      'Reduce complexity: 1 universe, 1 line, 1 device, then rebuild.';

  @override
  String get aboutDmxS5GoldenRuleTitle => 'Golden rule';

  @override
  String get aboutDmxS5GoldenRuleBody =>
      'You need to be able to operate a single device on a single line. If this basic test fails, the problem isn\'t \"the full patch\": it\'s the addressing, the wiring, or the hardware.';

  @override
  String get aboutDmxS6Title =>
      '6) Art-Net - DMX over IP (vocabulary and pitfalls)';

  @override
  String get aboutDmxS6PillUdp => 'UDP';

  @override
  String get aboutDmxS6PillNodes => 'Nodes';

  @override
  String get aboutDmxS6PillBroadcast => 'broadcast';

  @override
  String get aboutDmxS6PillUnicast => 'Unicast';

  @override
  String get aboutDmxS6Intro =>
      'Art-Net transports DMX universes via Ethernet (UDP). A console/software sends universes over the network, and a node converts them into physical DMX outputs.';

  @override
  String get aboutDmxS6BasicsTitle => 'To remember';

  @override
  String get aboutDmxS6BasicsB1 => 'One node = network ↔ DMX (several ports).';

  @override
  String get aboutDmxS6BasicsB2 =>
      'Broadcast sends to everyone (simple but can saturate).';

  @override
  String get aboutDmxS6BasicsB3 =>
      'Unicast sends only to the target node (often more stable on large rigs).';

  @override
  String get aboutDmxS6BasicsB4 =>
      'Be careful when counting universes: Art-Net often starts at 0 (Universe 1 DMX = 0 Art-Net).';

  @override
  String get aboutDmxS6WhenTitle => 'When should you choose Art-Net?';

  @override
  String get aboutDmxS6WhenB1 =>
      'Small/medium rigs, quick set-ups, lots of compatible hardware.';

  @override
  String get aboutDmxS6WhenB2 =>
      'OK if the network is clean (correct switch, cables, no Wi-Fi).';

  @override
  String get aboutDmxS6WhenB3 =>
      'If saturated: switch to unicast and segment the network (VLAN / dedicated network).';

  @override
  String get aboutDmxS7Title =>
      '7) sACN (E1.31) - multicast, priorities, own network';

  @override
  String get aboutDmxS7PillE131 => 'E1.31';

  @override
  String get aboutDmxS7PillMulticast => 'Multicast';

  @override
  String get aboutDmxS7PillPriority => 'Priority';

  @override
  String get aboutDmxS7PillIgmp => 'IGMP';

  @override
  String get aboutDmxS7Intro =>
      'sACN (ANSI E1.31) is a modern standard for transporting DMX universes over IP. It is widely used in large systems, as it handles multicast and priorities well.';

  @override
  String get aboutDmxS7KeyIdeasTitle => 'Key ideas';

  @override
  String get aboutDmxS7KeyIdeasB1 =>
      'Multicast: a universe is a network \"group\" (nodes subscribe to each other).';

  @override
  String get aboutDmxS7KeyIdeasB2 =>
      'IGMP snooping on switches = indispensable on a large scale (otherwise it floods).';

  @override
  String get aboutDmxS7KeyIdeasB3 =>
      'Priority: several sources possible, the one with the highest priority wins.';

  @override
  String get aboutDmxS7KeyIdeasB4 =>
      'Like Art-Net: clean network + quality cables/switches = stability.';

  @override
  String get aboutDmxS8Title =>
      '8) DMX vs Art-Net vs sACN - summary (what to choose?)';

  @override
  String get aboutDmxS8Intro =>
      'Ultimately, all three do the same thing: control channels. The difference lies in distribution (DMX cable vs. network), scale and robustness.';

  @override
  String get aboutDmxS8QuickTableTitle => '4-line summary';

  @override
  String get aboutDmxS8QuickB1 =>
      'DMX: simple, robust, 1 cable = 1 line (512 channels).';

  @override
  String get aboutDmxS8QuickB2 =>
      'Art-Net: very common, easy to deploy, beware of broadcasting.';

  @override
  String get aboutDmxS8QuickB3 =>
      'sACN: more \"pro large systems\", multicast + priorities, requires a well-configured network.';

  @override
  String get aboutDmxS8QuickB4 =>
      'In all cases: documentation + progressive testing = huge time savings.';

  @override
  String get aboutDmxS8ChooseTitle => 'Quick selection';

  @override
  String get aboutDmxS8ChooseB1 =>
      'Small set-up: DMX direct or Art-Net (simple).';

  @override
  String get aboutDmxS8ChooseB2 =>
      'Many universes: dedicated network + nodes; Art-Net in unicast or sACN.';

  @override
  String get aboutDmxS8ChooseB3 =>
      'Very large rigs / infrastructure: sACN + switches/IGMP well managed.';

  @override
  String get aboutSunTimesTitle => 'Sunrise/sunset';

  @override
  String get aboutSunTimesSubtitle =>
      'Choice of city and date, sunrise/sunset times + thresholds (lux).';

  @override
  String get homeBpmTitle => 'BPM';

  @override
  String get aboutReseauPageTitle => 'The network - field benchmarks';

  @override
  String get aboutReseauSummaryCopy =>
      'NETWORK - field markers\n- RJ45: Cat5e/6/6A → 1G/10G depending on distance.\n- Fiber: long distance + EMI immunity.\n- Switch: IGMP important for multicast sACN.\n- VLAN: separate light/video/IT = stability.';

  @override
  String get aboutReseauChecklistCopy =>
      'NETWORK - Checklist\n☐ Clear IP plan (range / masks)\n☐ Correct switch (IGMP if multicast sACN)\n☐ VLAN if multiple \"worlds\" (light/video/IT)\n☐ Cables tested + tagged\n☐ Fiber: compatible modules + clean connectors\n☐ Avoid loops (STP) + avoid public Wi-Fi on show LAN';

  @override
  String get aboutReseauChecklistCopyTooltip => 'Copy';

  @override
  String get aboutReseauFooterNote =>
      'Indicative info (field). Exact capacities vary according to equipment / cables / modules.\nObjective: simple reference points + reliable method.';

  @override
  String get aboutReseauToc1 => '1) Network basics (LAN / IP / throughput)';

  @override
  String get aboutReseauToc2 => '2) RJ45 & categories (Cat5e/6/6A/...)';

  @override
  String get aboutReseauToc3 => '3) PoE (network power supply)';

  @override
  String get aboutReseauToc4 => '4) Fiber (SM/MM) + connectors (LC/SC)';

  @override
  String get aboutReseauToc5 => '5) SFP / SFP+ / QSFP (modules)';

  @override
  String get aboutReseauToc6 => '6) Switches (VLAN / IGMP / QoS)';

  @override
  String get aboutReseauToc7 => '7) Art-Net / sACN on network (tips)';

  @override
  String get aboutReseauToc8 => '8) Checklist';

  @override
  String get aboutReseauSection1Title => 'The 3 simple ideas';

  @override
  String get aboutReseauSection1Bullet1 => 'IP = address (e.g. 10.0.0.50).';

  @override
  String get aboutReseauSection1Bullet2 =>
      'LAN = local network via switch (not \"internet\").';

  @override
  String get aboutReseauSection1Bullet3 =>
      'Throughput = capacity (1G, 10G...), but stability also depends on the switch.';

  @override
  String get aboutReseauSection1Title2 => 'Topology show (clean)';

  @override
  String get aboutReseauSection1Bullet4 =>
      'Console/PC → central switch → nodes/servers.';

  @override
  String get aboutReseauSection1Bullet5 => 'Avoid random daisy-chain networks.';

  @override
  String get aboutReseauSection1Bullet6 =>
      'If possible: a dedicated show network (not public Wi-Fi).';

  @override
  String get aboutReseauSection2Title => 'Quick reference points';

  @override
  String get aboutReseauSection2Bullet1 =>
      'Cat5e: 1 Gbit/s \"classic\" (up to 100m).';

  @override
  String get aboutReseauSection2Bullet2 =>
      'Cat6: 1G/10G (10G for shorter distances).';

  @override
  String get aboutReseauSection2Bullet3 =>
      'Cat6A: 10G up to 100m (practical benchmark).';

  @override
  String get aboutReseauSection2Bullet4 =>
      'Beyond that: Cat7/8 exist, but Cat6A is often the sweet spot in the field.';

  @override
  String get aboutReseauSection2Title2 => 'Land';

  @override
  String get aboutReseauSection2Bullet5 =>
      'Always test/label cables (especially when renting).';

  @override
  String get aboutReseauSection2Bullet6 =>
      'Avoid damaged connectors: a \"tired\" RJ45 = phantom failures.';

  @override
  String get aboutReseauSection2Bullet7 =>
      'Plan on 10G if you\'re doing heavy IP video.';

  @override
  String get aboutReseauSection3Paragraph =>
      'PoE can be used to power equipment via RJ45 (IP cams, Wi-Fi APs, small nodes, etc.). The critical point: the switch\'s total PoE budget.';

  @override
  String get aboutReseauSection3Title => 'Reference';

  @override
  String get aboutReseauSection3Bullet1 =>
      'PoE (802.3af) ≈ 15W, PoE+ (802.3at) ≈ 30W, PoE++/bt higher.';

  @override
  String get aboutReseauSection3Bullet2 =>
      'The switch has a total \"budget\" (e.g. 120W).';

  @override
  String get aboutReseauSection3Bullet3 =>
      'If you go over budget: some ports no longer light up / reboot.';

  @override
  String get aboutReseauSection4Title => 'Why fiber in the show';

  @override
  String get aboutReseauSection4Bullet1 => 'Very long distances.';

  @override
  String get aboutReseauSection4Bullet2 =>
      'Immunity to interference (EMI), top in busy environments.';

  @override
  String get aboutReseauSection4Bullet3 =>
      'Practical for connecting FOH ↔ set ↔ control room.';

  @override
  String get aboutReseauSection4Title2 =>
      'Multimode vs. singlemode (single marker)';

  @override
  String get aboutReseauSection4Bullet4 =>
      'Multimode (MM): \"medium\" distances (often building/platform).';

  @override
  String get aboutReseauSection4Bullet5 =>
      'Single mode (SM): very long distances.';

  @override
  String get aboutReseauSection4Bullet6 =>
      'SFP modules must match the fiber type.';

  @override
  String get aboutReseauSection4Title3 => 'Connectors';

  @override
  String get aboutReseauSection4Bullet7 => 'LC: small, very common on SFP.';

  @override
  String get aboutReseauSection4Bullet8 =>
      'SC: larger, common in infrastructure.';

  @override
  String get aboutReseauSection4Bullet9 =>
      'Always protect/clean (dust = losses).';

  @override
  String get aboutReseauSection5Title => 'Reference';

  @override
  String get aboutReseauSection5Bullet1 => 'SFP: often 1G.';

  @override
  String get aboutReseauSection5Bullet2 => 'SFP+: often 10G.';

  @override
  String get aboutReseauSection5Bullet3 =>
      'QSFP/QSFP+: 40G (depending on use).';

  @override
  String get aboutReseauSection5Bullet4 =>
      'A module = speed + fiber type + length (everything must be consistent).';

  @override
  String get aboutReseauSection5Paragraph =>
      'In practice: use switch-compatible modules (ideally from the same supplier/model) to avoid surprises.';

  @override
  String get aboutReseauSection6Title => 'Useful show functions';

  @override
  String get aboutReseauSection6Bullet1 => 'VLAN: separate light / video / IT.';

  @override
  String get aboutReseauSection6Bullet2 =>
      'IGMP snooping: indispensable if you use sACN multicast on a large scale.';

  @override
  String get aboutReseauSection6Bullet3 =>
      'QoS: useful if you mix a lot of flows (depending on context).';

  @override
  String get aboutReseauSection6Title2 => 'Common errors';

  @override
  String get aboutReseauSection6Bullet4 =>
      'Cheap switch that floods multicast → network collapses.';

  @override
  String get aboutReseauSection6Bullet5 =>
      'Network loop without STP → broadcast storm.';

  @override
  String get aboutReseauSection6Bullet6 =>
      'Public Wi-Fi on the same LAN as the show → instability.';

  @override
  String get aboutReseauSection7Title => 'Art-Net (field)';

  @override
  String get aboutReseauSection7Bullet1 => 'Often easy to set up.';

  @override
  String get aboutReseauSection7Bullet2 =>
      'Broadcast possible on a small, dedicated LAN, but unicast is cleaner.';

  @override
  String get aboutReseauSection7Bullet3 =>
      'Mapping universes/ports = point number 1 to check.';

  @override
  String get aboutReseauSection7Title2 => 'sACN (land)';

  @override
  String get aboutReseauSection7Bullet4 =>
      'Multicast: efficient, but requires a proper switch (IGMP).';

  @override
  String get aboutReseauSection7Bullet5 =>
      'Priorities: useful if several sources.';

  @override
  String get aboutReseauSection7Bullet6 =>
      'On large shows: sACN + IGMP is often the \"clean\" choice.';

  @override
  String get aboutReseauChecklistTitle => 'Fast';

  @override
  String get aboutReseauChecklistBullet1 => 'Correct switch + clean cables.';

  @override
  String get aboutReseauChecklistBullet2 => 'IGMP if sACN multicast.';

  @override
  String get aboutReseauChecklistBullet3 => 'Separate usage (VLAN).';

  @override
  String get aboutSacnPageTitle => 'sACN / E1.31 - multicast & priorities';

  @override
  String get aboutSacnCopyTooltip => 'Copy markers';

  @override
  String get aboutSacnChecklistCopyTooltip => 'Copy';

  @override
  String get aboutSacnFooterNote =>
      'Indicative info (field). Behavior depends on switches (IGMP), nodes and firmware.\nObjective: understand and stabilize an sACN network.';

  @override
  String get aboutSacnCopy1 =>
      'sACN (E1.31) = DMX over IP (UDP), show standard.';

  @override
  String get aboutSacnCopy2 => 'Universe sACN = 1..63999 (standard range).';

  @override
  String get aboutSacnCopy3 =>
      'Multicast: IGMP snooping recommended, otherwise flood.';

  @override
  String get aboutSacnCopy4 =>
      'Priority: useful with multiple sources (console + backup).';

  @override
  String get aboutSacnChecklistCopy =>
      'sACN (E1.31) - Field checklist\n☐ Switch correct (ideally manageable)\n☐ IGMP snooping enabled if multicast\n☐ (If possible) IGMP querier present in VLAN (otherwise odd behavior possible)\n☐ Unicast if network not mastered / troubleshooting\n☐ Priorities: check multiple sources (console/backup)\n☐ Mapping universe ↔ ports node verified\n☐ Wi-Fi avoided in prod';

  @override
  String get aboutSacnToc1 => '1) What does sACN do?';

  @override
  String get aboutSacnToc2 => '2) Universe (numbering)';

  @override
  String get aboutSacnToc3 => '3) Multicast / Unicast + IGMP';

  @override
  String get aboutSacnToc4 => '4) Priorities (multi-sources)';

  @override
  String get aboutSacnToc5 => '5) Limits / performance';

  @override
  String get aboutSacnToc6 => '6) RDM & sACN (proxy / depending on equipment)';

  @override
  String get aboutSacnToc7 => '7) Schematics';

  @override
  String get aboutSacnToc8 => '8) Checklist';

  @override
  String get aboutSacnSection1Pill1 => 'UDP';

  @override
  String get aboutSacnSection1Pill2 => 'Multicast';

  @override
  String get aboutSacnSection1Pill3 => 'Priority';

  @override
  String get aboutSacnSection1Paragraph =>
      'sACN (E1.31) is a widely used standard for transporting DMX universes over IP. It\'s often the preferred choice for clean network architecture: well-managed multicast, standardized priorities, and more \"pro network\" behavior.';

  @override
  String get aboutSacnSection1Title => 'When it\'s top';

  @override
  String get aboutSacnSection1Bullet1 =>
      'Lots of universes on a well-managed network.';

  @override
  String get aboutSacnSection1Bullet2 =>
      'Installations / large networks with several sources (priorities).';

  @override
  String get aboutSacnSection1Bullet3 =>
      'When you want to avoid \"broadcast everywhere\".';

  @override
  String get aboutSacnSection2Pill1 => 'Universe 1..63999';

  @override
  String get aboutSacnSection2Pill2 => '512 slots/universe';

  @override
  String get aboutSacnSection2Paragraph =>
      'One sACN universe corresponds to one DMX universe: up to 512 slots. The standard sACN numbering is 1..63999. In practice, the important thing is console ↔ node ↔ DMX port mapping.';

  @override
  String get aboutSacnSection2Title => 'Classic mistake';

  @override
  String get aboutSacnSection2Bullet1 =>
      'You change the universe number on the console side, but not on the node side (or vice versa).';

  @override
  String get aboutSacnSection2Bullet2 =>
      'You patch \"Universe 0\" when the hardware expects a base 1.';

  @override
  String get aboutSacnSection2Bullet3 =>
      'You\'re mixing up numbering conventions between tools.';

  @override
  String get aboutSacnSection3Paragraph =>
      'sACN often uses multicast: each universe \"lives\" on a multicast group, and nodes subscribe to the universes they need.';

  @override
  String get aboutSacnSection3Title => 'IGMP snooping (why it\'s important)';

  @override
  String get aboutSacnSection3Bullet1 =>
      'Without IGMP: the switch \"floods\" multicast everywhere → possible overload.';

  @override
  String get aboutSacnSection3Bullet2 =>
      'With IGMP: switch sends only to subscribed ports → stable network.';

  @override
  String get aboutSacnSection3Bullet3 =>
      'On large volumes: IGMP is often THE difference between \"it works\" and \"it\'s hell\".';

  @override
  String get aboutSacnSection3Subtitle => 'Diagram: multicast & IGMP';

  @override
  String get aboutSacnSection3Subtitle2 => 'Unicast (option)';

  @override
  String get aboutSacnSection3SubBullet1 =>
      'Possible depending on consoles/nodes.';

  @override
  String get aboutSacnSection3SubBullet2 =>
      'Useful for troubleshooting or if multicast network is out of control.';

  @override
  String get aboutSacnSection3SubBullet3 =>
      'Less elegant but sometimes simpler.';

  @override
  String get aboutSacnSection4Pill1 => 'Source A prio 100';

  @override
  String get aboutSacnSection4Pill2 => 'Source B prio 90';

  @override
  String get aboutSacnSection4Paragraph =>
      'sACN manages a notion of priority: if several sources send the same universe, the receiver keeps the highest-priority source. Very useful with a main console + a backup console + a media server.';

  @override
  String get aboutSacnSection4Title => 'Traps';

  @override
  String get aboutSacnSection4Bullet1 =>
      'Two unwanted sources on the same universe → \"it fights\".';

  @override
  String get aboutSacnSection4Bullet2 =>
      'Priority set incorrectly → backup takes over.';

  @override
  String get aboutSacnSection4Bullet3 =>
      'Debug: cut a source and check who wins.';

  @override
  String get aboutSacnSection5Pill1 => 'IGMP';

  @override
  String get aboutSacnSection5Pill2 => 'Switch';

  @override
  String get aboutSacnSection5Pill3 => 'Wi-Fi no';

  @override
  String get aboutSacnSection5Pill4 => 'CPU node';

  @override
  String get aboutSacnSection5Title => 'What breaks first';

  @override
  String get aboutSacnSection5Bullet1 => 'Multicast without IGMP → flood.';

  @override
  String get aboutSacnSection5Bullet2 =>
      'Switch not adapted (buffers/CPU) → losses.';

  @override
  String get aboutSacnSection5Bullet3 => 'Wi-Fi → jitter/losses.';

  @override
  String get aboutSacnSection5Bullet4 => 'Limited nodes (ports, firmware).';

  @override
  String get aboutSacnSection5Subtitle => 'Simple rules';

  @override
  String get aboutSacnSection5SubBullet1 =>
      'Managed switch + IGMP snooping if many universes.';

  @override
  String get aboutSacnSection5SubBullet2 => 'Dedicated VLAN light if possible.';

  @override
  String get aboutSacnSection5SubBullet3 => 'Unicast for troubleshooting.';

  @override
  String get aboutSacnSection6Paragraph =>
      'As with Art-Net, RDM \"over IP\" often depends on a proxy mechanism in the nodes. The sACN standard does not automatically imply that your node is doing RDM correctly.';

  @override
  String get aboutSacnSection6Title => 'Check the node documentation';

  @override
  String get aboutSacnSection6Bullet1 => 'RDM proxy / RDM over IP support.';

  @override
  String get aboutSacnSection6Bullet2 =>
      'Limitations (discovery only, partial commands).';

  @override
  String get aboutSacnSection6Bullet3 =>
      'Compatible with splitters/opto on DMX side.';

  @override
  String get aboutSacnSection6Subtitle => 'Field method';

  @override
  String get aboutSacnSection6SubBullet1 => 'Stabilize DMX without RDM.';

  @override
  String get aboutSacnSection6SubBullet2 => 'Test RDM on a simple, clean line.';

  @override
  String get aboutSacnSection6SubBullet3 =>
      'If problems arise: deactivate RDM, then isolate node/splitter.';

  @override
  String get aboutSacnSection7Subtitle1 => 'Multicast + IGMP (idea)';

  @override
  String get aboutSacnSection7Subtitle2 => 'Priorities (2 sources)';

  @override
  String get aboutSacnChecklistTitle => 'Before blaming \"protocol';

  @override
  String get aboutSacnChecklistBullet1 => 'IGMP snooping enabled if multicast.';

  @override
  String get aboutSacnChecklistBullet2 => 'Dedicated VLAN if possible.';

  @override
  String get aboutSacnChecklistBullet3 => 'Unicast for troubleshooting.';

  @override
  String get aboutSacnChecklistBullet4 =>
      'Consistent priorities if multiple sources.';

  @override
  String get aboutSacnChecklistBullet5 => 'Wi-Fi avoided in prod.';

  @override
  String get sunTimesTitle => 'Sunrise / sunset';

  @override
  String get sunTimesSectionSettings => 'Parameters';

  @override
  String get sunTimesSectionResults => 'Results';

  @override
  String get sunTimesSectionTimeline => 'Timeline (30 min steps)';

  @override
  String get sunTimesSectionTwilight => 'What are twilights?';

  @override
  String get sunTimesSectionLux => 'Brightness thresholds (markers)';

  @override
  String get sunTimesIntro =>
      'Choose a city and a date. Times are approximate (rounded).';

  @override
  String get sunTimesLabelCity => 'City';

  @override
  String get sunTimesLabelDate => 'Date';

  @override
  String get sunTimesNoteApprox =>
      'Times are approximate - may vary according to altitude, refraction and weather.';

  @override
  String get sunTimesNoData => '-';

  @override
  String get sunTimesResultSunrise => 'Sunrise';

  @override
  String get sunTimesResultSunset => 'Sunset';

  @override
  String get sunTimesResultCivilDawn => 'Civil dawn';

  @override
  String get sunTimesResultCivilDusk => 'Civil twilight';

  @override
  String get sunTimesResultNauticalDawn => 'Nautical dawn';

  @override
  String get sunTimesResultNauticalDusk => 'Nautical twilight';

  @override
  String get sunTimesResultAstronomicalDawn => 'Astronomical dawn';

  @override
  String get sunTimesResultAstronomicalDusk => 'Astronomical twilight';

  @override
  String get sunTimesTimelineStep30 => 'Pitch: 30 min';

  @override
  String get sunTimesTimelineDay => 'Day';

  @override
  String get sunTimesTimelineCivil => 'Civil';

  @override
  String get sunTimesTimelineNautical => 'Nautical';

  @override
  String get sunTimesTimelineAstronomical => 'Astronomical';

  @override
  String get sunTimesTimelineNight => 'Night';

  @override
  String get sunTimesTwilightIntro =>
      'Twilight is defined by the height of the Sun below the horizon. These definitions are standardized.';

  @override
  String get sunTimesTwilightCivilTitle => 'Civil (≈ 0° to -6°)';

  @override
  String get sunTimesTwilightCivilBody =>
      'End/beginning of the day. The landscape is still clearly visible.';

  @override
  String get sunTimesTwilightNauticalTitle => 'Nautical (≈ -6° to -12°)';

  @override
  String get sunTimesTwilightNauticalBody =>
      'The horizon becomes difficult to distinguish. The sky is noticeably darker.';

  @override
  String get sunTimesTwilightAstronomicalTitle =>
      'Astronomical (≈ -12° to -18°)';

  @override
  String get sunTimesTwilightAstronomicalBody =>
      'The sky is close to complete darkness (little residual light).';

  @override
  String get sunTimesLuxNight => 'Black night';

  @override
  String get sunTimesLuxAstro => 'Astro twilight';

  @override
  String get sunTimesLuxNautical => 'Naut. twilight.';

  @override
  String get sunTimesLuxCivil => 'Civil twilight';

  @override
  String get sunTimesLuxVeryLow => 'Very low';

  @override
  String get sunTimesLuxLow => 'Low';

  @override
  String get sunTimesLuxDay => 'Day';

  @override
  String get sunTimesLuxFullDay => 'Daylight';

  @override
  String get sunTimesLuxNote =>
      'These values are typical benchmarks (weather, season, environment → variations).';

  @override
  String get aboutVideoPageTitle => 'Video - Field benchmarks';

  @override
  String get aboutVideoSummaryCopy =>
      'VIDEO - landmarks\n- Resolution = size (px). FPS = fluidity / latency.\n- 4:2:2 / 4:4:4 + 10-bit = color quality.\n- SDI = robust + long distance.\n- HDMI = fragile + short.\n- NDI = IP (network), depends on LAN.\n- Genlock / Timecode = synchro.';

  @override
  String get aboutVideoChecklistCopy =>
      'VIDEO - Checklist\n☐ Same resolution & FPS everywhere\n☐ HDMI: EDID / HDCP mastered\n☐ SDI: 75Ω cable + good standard\n☐ NDI/IP: clean LAN (switch, speed)\n☐ Genlock / Timecode if synchro required\n☐ Test source → direct screen';

  @override
  String get aboutVideoChecklistCopyTooltip => 'Copy';

  @override
  String get aboutVideoFooterNote =>
      'Indicative information (field). Behavior varies according to equipment.\nObjective: understand quickly and troubleshoot cleanly.';

  @override
  String get aboutVideoToc1 => '1) Video basics (keywords)';

  @override
  String get aboutVideoToc2 => '2) Resolution & FPS';

  @override
  String get aboutVideoToc3 => '3) Color (4:4:4 / 4:2:2 / 10-bit)';

  @override
  String get aboutVideoToc4 => '4) Sync (Genlock / Timecode)';

  @override
  String get aboutVideoToc5 => '5) Cables & distances';

  @override
  String get aboutVideoToc6 => '6) SDI (3G/6G/12G)';

  @override
  String get aboutVideoToc7 => '7) HDMI - field';

  @override
  String get aboutVideoToc8 => '8) NDI - when / why / limits';

  @override
  String get aboutVideoToc9 => '9) Mapping / LED / multi-project';

  @override
  String get aboutVideoSection1Paragraph =>
      'Video is an image (pixels) sent at a rate (FPS), with a color structure (sampling / bit depth), transported by a link (SDI / HDMI / IP) and sometimes synchronized.';

  @override
  String get aboutVideoSection1Title => 'Useful vocabulary';

  @override
  String get aboutVideoSection1Bullet1 => 'Resolution: width×height (px).';

  @override
  String get aboutVideoSection1Bullet2 => 'FPS: fluidity/latency.';

  @override
  String get aboutVideoSection1Bullet3 => 'Progressive (p) vs. interlaced (i).';

  @override
  String get aboutVideoSection1Bullet4 =>
      'Codec: compression (H.264, H.265...).';

  @override
  String get aboutVideoSection1Bullet5 => 'Latency: live review.';

  @override
  String get aboutVideoSection2Title => 'Resolution';

  @override
  String get aboutVideoSection2Bullet1 => '1080p = 1920×1080.';

  @override
  String get aboutVideoSection2Bullet2 => '4K UHD = 3840×2160.';

  @override
  String get aboutVideoSection2Bullet3 => 'DCI 4K = 4096×2160 (cinema).';

  @override
  String get aboutVideoSection2Bullet4 => 'More pixels = more throughput.';

  @override
  String get aboutVideoSection2Title2 => 'FPS';

  @override
  String get aboutVideoSection2Bullet5 => '25/50: European standard.';

  @override
  String get aboutVideoSection2Bullet6 => '30/60: US standard / devices.';

  @override
  String get aboutVideoSection2Bullet7 =>
      'Avoid mixing 50 and 60 without conversion.';

  @override
  String get aboutVideoSection3Title => 'Sampling';

  @override
  String get aboutVideoSection3Bullet1 => '4:4:4: graphics / keying.';

  @override
  String get aboutVideoSection3Bullet2 => '4:2:2: pro courant.';

  @override
  String get aboutVideoSection3Bullet3 => '4:2:0: files / streams.';

  @override
  String get aboutVideoSection3Title2 => 'Bit depth';

  @override
  String get aboutVideoSection3Bullet4 => '8-bit: standard.';

  @override
  String get aboutVideoSection3Bullet5 =>
      '10-bit: better gradation (HDR / LED).';

  @override
  String get aboutVideoSection4Title => 'Genlock';

  @override
  String get aboutVideoSection4Bullet1 => 'Synchronizes frame refresh.';

  @override
  String get aboutVideoSection4Bullet2 =>
      'Useful for multi-cam / LED / broadcast.';

  @override
  String get aboutVideoSection4Title2 => 'Timecode';

  @override
  String get aboutVideoSection4Bullet3 => 'Time synchronization.';

  @override
  String get aboutVideoSection4Bullet4 => 'Does not replace the genlock.';

  @override
  String get aboutVideoSection5Title => 'Simple rules';

  @override
  String get aboutVideoSection5Bullet1 => 'HDMI: fragile, short.';

  @override
  String get aboutVideoSection5Bullet2 => 'SDI: robust, long.';

  @override
  String get aboutVideoSection5Bullet3 => 'Fiber: very long + EMI free.';

  @override
  String get aboutVideoSection6Title => 'Reference';

  @override
  String get aboutVideoSection6Bullet1 => '3G: 1080p60';

  @override
  String get aboutVideoSection6Bullet2 => '6G: 2160p30';

  @override
  String get aboutVideoSection6Bullet3 => '12G: 2160p60';

  @override
  String get aboutVideoSection7Title => 'What to look out for';

  @override
  String get aboutVideoSection7Bullet1 => 'EDID';

  @override
  String get aboutVideoSection7Bullet2 => 'HDCP';

  @override
  String get aboutVideoSection7Bullet3 => 'Lengths';

  @override
  String get aboutVideoSection8Title => 'IP video';

  @override
  String get aboutVideoSection8Bullet1 => 'Flexible.';

  @override
  String get aboutVideoSection8Bullet2 => 'Network load.';

  @override
  String get aboutVideoSection8Bullet3 => 'Clean LAN required.';

  @override
  String get aboutVideoSection9Title => 'Land';

  @override
  String get aboutVideoSection9Bullet1 => 'Same resolution / FPS.';

  @override
  String get aboutVideoSection9Bullet2 => 'Correct mapping.';

  @override
  String get aboutVideoSection9Bullet3 => 'Test with test patterns.';

  @override
  String get aboutVideoChecklistTitle => 'Before you panic';

  @override
  String get aboutVideoChecklistBullet1 => 'Check resolution / FPS.';

  @override
  String get aboutVideoChecklistBullet2 => 'Test source → screen.';

  @override
  String get aboutVideoChecklistBullet3 => 'Simplify the chain.';

  @override
  String get homeBpmSubtitle => 'Tap tempo, BPM conversion ↔ ms, Hz, bar.';

  @override
  String get bpmTitle => 'BPM';

  @override
  String get bpmTapTitle => 'Tap tempo';

  @override
  String get bpmTapButton => 'Type';

  @override
  String get bpmResetTap => 'Reset taps';

  @override
  String get bpmDetectedLabel => 'BPM detected';

  @override
  String get bpmTapHint =>
      'Tap several times (ideally 4 to 8 taps) to obtain a stable average.';

  @override
  String get bpmManualTitle => 'Manual BPM';

  @override
  String get bpmManualLabel => 'BPM';

  @override
  String get bpmManualHint => 'Ex. 128';

  @override
  String get commonAdd => 'Add';

  @override
  String get commonEdit => 'Edit';

  @override
  String get commonDelete => 'Delete';

  @override
  String get commonCopied => 'Copied to clipboard.';

  @override
  String get patchCreateGdtfTitle => 'Create a GDTF (simple)';

  @override
  String get patchCreateGdtfSubtitle =>
      'Manual creation of a device in table format.';

  @override
  String get gdtfSimpleTitle => 'GDTF creator (simple)';

  @override
  String get gdtfDeviceSectionTitle => 'Device';

  @override
  String get gdtfChannelsSectionTitle => 'Channels';

  @override
  String get gdtfImportJsonTitle => 'Import JSON';

  @override
  String get gdtfExportJsonTitle => 'Export JSON';

  @override
  String get gdtfImportJsonHint => 'Paste the JSON here';

  @override
  String get gdtfManufacturerLabel => 'Manufacturer';

  @override
  String get gdtfModelLabel => 'Model';

  @override
  String get gdtfModeNameLabel => 'Mode name';

  @override
  String get gdtfChannelsCountLabel => 'Channels';

  @override
  String get gdtfFootprintLabel => 'Footprint';

  @override
  String get gdtfColIndex => '#';

  @override
  String get gdtfColName => 'Name';

  @override
  String get gdtfColDmx => 'DMX';

  @override
  String get gdtfColType => 'Kind';

  @override
  String get gdtfColRes => '8/16';

  @override
  String get gdtfColDefault => 'Fault';

  @override
  String get gdtfColActions => 'Actions';

  @override
  String get gdtfMoveUp => 'Go up';

  @override
  String get gdtfMoveDown => 'Go down';

  @override
  String get gdtfChannelAddTitle => 'Add a channel';

  @override
  String get gdtfChannelEditTitle => 'Modify channel';

  @override
  String get gdtfFieldName => 'Name';

  @override
  String get gdtfFieldDmx => 'DMX address';

  @override
  String get gdtfFieldType => 'Kind';

  @override
  String get gdtfFieldResolution => 'Resolution';

  @override
  String get gdtfRes8 => '8-bit';

  @override
  String get gdtfRes16 => '16-bit';

  @override
  String get gdtfFieldDefault8 => 'Default value (0-255)';

  @override
  String get gdtfFieldDefault16 => 'Default value (0-65535)';

  @override
  String get gdtfDefaultChannelName => 'Channel';

  @override
  String get gdtfMvpHint =>
      'MVP: JSON export (clipboard). Actual GDTF export (XML+ZIP) will follow.';

  @override
  String get gdtfTypeDimmer => 'Dimmer';

  @override
  String get gdtfTypePan => 'Bang';

  @override
  String get gdtfTypeTilt => 'Tilt';

  @override
  String get gdtfTypeColor => 'Color';

  @override
  String get gdtfTypeGobo => 'Gobo';

  @override
  String get gdtfTypeShutter => 'Shutter';

  @override
  String get gdtfTypePrism => 'Prism';

  @override
  String get gdtfTypeZoom => 'Zoom';

  @override
  String get gdtfTypeFocus => 'Focus';

  @override
  String get gdtfTypeIris => 'Iris';

  @override
  String get gdtfTypeEffect => 'Effect';

  @override
  String get gdtfTypeCustom => 'Personalized';

  @override
  String get gdtfEasyTitle => 'Create a GDTF (simple)';

  @override
  String get gdtfTemplatesTitle => 'Preselections';

  @override
  String get gdtfCreateDefaultPreset => 'Create default preset';

  @override
  String get gdtfTemplatesHint =>
      'Creates a quick base (dimmer, shutter, pan, tilt, RGB, etc.) then fills in DMX addresses and faults.';

  @override
  String get gdtfExportButton => 'Export GDTF';

  @override
  String get gdtfExportHint =>
      'Minimal .gdtf export (description.xml) then share (Mail, WhatsApp, AirDrop, Drive...).';

  @override
  String get gdtfExportNeedDmx => 'Adds at least one DMX address for export.';

  @override
  String get gdtfExportDone => 'GDTF exported.';

  @override
  String get gdtfExportError => 'Unable to export GDTF.';

  @override
  String get gdtfShareSubject => 'GDTF file';

  @override
  String get gdtfShareText => 'Here\'s the exported GDTF file.';

  @override
  String get gdtfFieldRole => 'Parameter';

  @override
  String get gdtfDmxHint => 'Empty or 1-512';

  @override
  String get gdtfFieldDefault => 'Fault';

  @override
  String get gdtfDefaultHint8 => '0-255';

  @override
  String get gdtfDefaultHint16 => '0-65535';

  @override
  String get gdtfChannelDefaultName => 'Channel';

  @override
  String get gdtfRoleEmpty => 'Empty / Unknown';

  @override
  String get gdtfRoleDimmer => 'Dimmer';

  @override
  String get gdtfRoleShutter => 'Shutter';

  @override
  String get gdtfRolePan => 'Bang';

  @override
  String get gdtfRoleTilt => 'Tilt';

  @override
  String get gdtfRoleRed => 'Red (R)';

  @override
  String get gdtfRoleGreen => 'Green (G)';

  @override
  String get gdtfRoleBlue => 'Blue (B)';

  @override
  String get gdtfRoleColor => 'Color';

  @override
  String get gdtfRoleGobo => 'Gobo';

  @override
  String get gdtfRoleZoom => 'Zoom';

  @override
  String get gdtfRoleFocus => 'Focus';

  @override
  String get gdtfRolePrism => 'Prism';

  @override
  String get gdtfRoleEffect => 'Effect';

  @override
  String get gdtfRoleControl => 'Control';

  @override
  String get gdtfRoleCustom => 'Custom';

  @override
  String get gdtfResUnknown => 'Vacuum';

  @override
  String get gdtfPresetDimmer => 'Dimmer';

  @override
  String get gdtfPresetShutter => 'Shutter';

  @override
  String get gdtfPresetPan => 'Bang';

  @override
  String get gdtfPresetTilt => 'Tilt';

  @override
  String get gdtfPresetRed => 'R';

  @override
  String get gdtfPresetGreen => 'G';

  @override
  String get gdtfPresetBlue => 'B';

  @override
  String get gdtfPresetColor1 => 'Color 1';

  @override
  String get gdtfPresetGobo1 => 'Gobo 1';

  @override
  String get gdtfPresetZoom => 'Zoom';

  @override
  String get gdtfPresetFocus => 'Focus';

  @override
  String get gdtfPresetPrism => 'Prism';

  @override
  String get gdtfPresetEffect => 'Effect';

  @override
  String get gdtfPresetControl => 'Control';

  @override
  String get commonApply => 'Apply';

  @override
  String get gdtfPresetLabel => 'Choice';

  @override
  String get gdtfPresetFixtureSimple => 'Single fixture';

  @override
  String get gdtfPresetBarreLed => 'LED bar';

  @override
  String get gdtfTemplatesHintShort =>
      'Choose a preset and apply. You can then adjust DMX, defaults and reorder by drag-and-drop.';

  @override
  String get gdtfExportNeedChannels => 'Adds at least one channel for export.';

  @override
  String get homeDrawerContact => 'Contact the developer';

  @override
  String get homeDrawerSuggestItem => 'Submit an item to the catalog';

  @override
  String get homeErrorOpenEmail => 'Unable to open e-mail application.';

  @override
  String get homeErrorOpenForm => 'Unable to open form.';

  @override
  String get homeContactEmailSubject => 'Question about My App Tech';

  @override
  String get bpmManualHelp =>
      'If a manual BPM is entered, it takes precedence over tap tempo.';

  @override
  String get bpmConversionsTitle => 'Conversions';

  @override
  String get bpmActiveLabel => 'Active BPM';

  @override
  String get bpmMsPerBeat => 'Beat duration';

  @override
  String get bpmHz => 'Frequency';

  @override
  String get bpmSecPerBar44 => 'Measure duration (4/4)';

  @override
  String get bpmDisclaimer =>
      'Approximate indication. Check with the metronome if critical.';

  @override
  String get laserToolsTitle => 'Tools';

  @override
  String get laserBeamSizeTitle => 'Beam size';

  @override
  String get laserBeamSizeSubtitle =>
      'Spot diameter, radius and area at a given distance.';

  @override
  String get laserBeamInputsTitle => 'Parameters';

  @override
  String get laserBeamDistanceLabel => 'Distance';

  @override
  String get laserBeamDistanceHint => 'm (ex. 12)';

  @override
  String get laserBeamFormulaHint =>
      'Calculation: D(z) = D0 + θ - z (θ in rad, full angle).';

  @override
  String get laserBeamResultsTitle => 'Results';

  @override
  String get laserBeamDiameterAtDistance => 'Diameter at distance';

  @override
  String get laserBeamRadiusAtDistance => 'Radius at distance';

  @override
  String get laserBeamAreaAtDistance => 'Spot surface';

  @override
  String get sunTimesPageTitle => 'Sunrise / sunset';

  @override
  String get sunTimesSelectionTitle => 'Parameters';

  @override
  String get sunTimesCityLabel => 'City';

  @override
  String get sunTimesDateLabel => 'Date';

  @override
  String get sunTimesResultsTitle => 'Results';

  @override
  String get sunTimesSunriseLabel => 'Sunrise';

  @override
  String get sunTimesSunsetLabel => 'Sunset';

  @override
  String get sunTimesDayLengthLabel => 'Length of day';

  @override
  String get sunTimesDisclaimer =>
      'Indicative values (astronomical model). Check with an official source if necessary (event, security, filming).';

  @override
  String get sunTimesThresholdTitle => 'Brightness thresholds (markers)';

  @override
  String get sunTimesThresholdIntro =>
      'Orders of magnitude useful for anticipating ambient light (highly variable depending on weather, latitude, season, obstacles, light pollution).';

  @override
  String get sunTimesLuxDaylight => 'Daylight (excluding direct sunlight)';

  @override
  String get sunTimesLuxOvercast => 'Overcast (typical)';

  @override
  String get sunTimesLuxSunrise => 'Rise/set (clear)';

  @override
  String get sunTimesLuxCivilTwilight => 'Civil twilight limit (clear)';

  @override
  String get sunTimesLuxFullMoon => 'Full moon (clear)';

  @override
  String get sunTimesThresholdNote =>
      'Tip: for \"usable without lighting\" spotting, we often aim for > 100-300 lx. For fine work, aim for 500 lx or more.';

  @override
  String get sunTimesParamsTitle => 'Parameters';

  @override
  String get sunTimesPickDate => 'Choose a date';

  @override
  String get sunTimesSunrise => 'Rise';

  @override
  String get sunTimesSunset => 'Bedtime';

  @override
  String get sunTimesDayLength => 'Length of day';

  @override
  String get sunTimesPolarNote =>
      'Note: in areas close to the poles, sunrise/sunset may be absent depending on the season.';

  @override
  String get sunTimesLuxThresholdTitle => 'Brightness thresholds (markers)';

  @override
  String get sunTimesLuxBulletNightDark => 'Dark night: < 1 lux';

  @override
  String get sunTimesLuxBulletNightMoon => 'Night (moon): ~ 0.1-1 lux';

  @override
  String get sunTimesLuxBulletFullMoon => 'Full moon: ~ 0.1-0.3 lux';

  @override
  String get sunTimesLuxBulletCivilTwilight => 'Civil twilight: Sun at -6°.';

  @override
  String get sunTimesLuxBulletUrbanLow => 'Weak urban lighting: ~ 5-20 lux';

  @override
  String get sunTimesLuxBulletOfficeLow => 'Weak office: ~ 100-300 lux';

  @override
  String get sunTimesLuxBulletOfficeStd => 'Standard office: ~ 300-500 lux';

  @override
  String get sunTimesLuxBulletOutdoorDay =>
      'Outdoor daylight: ~ 10,000-25,000 lux';

  @override
  String get sunTimesLuxBulletDirectSun => 'Direct sunlight: ~ 100,000 lux';

  @override
  String get sunTimesLuxDisclaimer =>
      'Reference points: weather/clouds, environment, season and terrain can vary greatly.';

  @override
  String get sunTimesTwilightTitle => 'Twilight: what does it mean?';

  @override
  String get sunTimesTwilightCivil =>
      'Civil (-6°): light still sufficient to distinguish the environment without artificial lighting.';

  @override
  String get sunTimesTwilightNautical =>
      'Nautical (-12°): the horizon becomes difficult to distinguish; stars visible.';

  @override
  String get sunTimesTwilightAstronomical =>
      'Astronomical (-18°): the sky is considered \"black\" (excluding light pollution).';

  @override
  String get sunTimesTwilightAnglesNote =>
      'Angles expressed in degrees below the horizon (negative sun).';

  @override
  String get sunTimesLuxBulletAstronomicalTwilight =>
      'Astronomical twilight: Sun at -18°.';

  @override
  String get sunTimesTimelineTitleStep30 => 'Timeline (step 30 min)';

  @override
  String get sunTimesTimelineColTime => 'Time';

  @override
  String get sunTimesTimelineColElevation => 'Elevation';

  @override
  String get sunTimesTimelineColMarker => 'Reference';

  @override
  String get sunTimesTimelineColLux => 'Lux (order)';

  @override
  String get sunTimesTimelineFootnote =>
      'Indicative benchmarks (weather/clouds, environment, season) - useful for preparing a show.';

  @override
  String get aboutUniverseToArtnetColSubnet => 'Subnet';

  @override
  String appVersionLabel(Object version, Object build) {
    return 'Version $version ($build)';
  }

  @override
  String appVersionLabelNoBuild(Object version) {
    return 'Version $version';
  }

  @override
  String get aboutUniverseToArtnetColUniverse => 'Universe';

  @override
  String get videoLedResultWallResolution => 'Wall resolution';

  @override
  String get videoLedResultWallSize => 'Wall size';

  @override
  String get videoLedResultTile => 'Slab';

  @override
  String get videoLedResultPitch => 'Pitch';

  @override
  String get lightFilterLedTabConvert => 'Conversion';

  @override
  String get lightFilterLedTabProfiles => 'My fixtures';

  @override
  String get lightFilterLedSourceLabel => 'Light source';

  @override
  String get lightFilterLedEngineRgbww => 'RGBWW (warm + cool white)';

  @override
  String get lightFilterLedEngineRgbaw => 'RGBAW';

  @override
  String get lightFilterLedEngineRgbauv => 'RGBAUV';

  @override
  String get lightFilterLedEngineRgbwauv => 'RGBWAUV';

  @override
  String get lightFilterLedEngineRgbrcl => 'RGBRCL (Red, Cyan, Lime)';

  @override
  String get lightFilterLedEngineCmy => 'CMY';

  @override
  String get lightFilterLedSaveProfileTitle => 'Save fixture profile';

  @override
  String get lightFilterLedProfileNameLabel => 'Fixture name';

  @override
  String get patchMvrViewTable => 'Table';

  @override
  String get patchMvrViewVisual => 'Visual';

  @override
  String get consoleTitle => 'Console';

  @override
  String get consoleSubtitle => 'Patch DMX and tools GDTF';

  @override
  String get consolePatchTitle => 'Patch DMX';

  @override
  String get consolePatchSubtitle => 'Import a MVR and analyze the patch';

  @override
  String get consoleGdtfTitle => 'GDTF';

  @override
  String get consoleGdtfSubtitle => 'Create or analyze a GDTF file';

  @override
  String get consoleMa3ForgeTitle => 'MA3 Plugin Forge';

  @override
  String get consoleMa3ForgeSubtitle =>
      'Generate Lua plugins for grandMA3 with AI';

  @override
  String lightFilterLedProfileSaved(String name) {
    return 'Profile \"$name\" saved';
  }

  @override
  String get lightFilterLedNoProfiles => 'No fixture profile saved';

  @override
  String get lightFilterLedNoProfilesHint =>
      'Calibrate channels in the Conversion tab,\nthen save with the 💾 icon.';

  @override
  String get lightFilterLedTitle => 'LED filter matching';

  @override
  String get lightFilterLedDescription =>
      'Conversion of LEE, Rosco... filters to LED motors (RGB, RGBA, RGBW, etc.).';

  @override
  String get lightFilterLedBrandLabel => 'Brand';

  @override
  String get lightFilterLedSearchLabel => 'Search';

  @override
  String get lightFilterLedSearchHint => 'Filter code or name';

  @override
  String get lightFilterLedFilterLabel => 'Filter';

  @override
  String get lightFilterLedEngineLabel => 'LED motor';

  @override
  String get lightFilterLedShowPercentLabel => 'Display in percent';

  @override
  String get lightFilterLedShowPercentHint =>
      'Otherwise, values are displayed in DMX 0-255.';

  @override
  String get lightFilterLedHexLabel => 'Reference color';

  @override
  String get lightFilterLedChromaticityLabel => 'Chromaticity';

  @override
  String get lightFilterLedTransmissionLabel => 'Transmission';

  @override
  String get lightFilterLedResultTitle => 'Results';

  @override
  String get lightFilterLedOriginalPreviewLabel => 'Filter overview';

  @override
  String get lightFilterLedApproximatePreviewLabel =>
      'Approximate LED overview';

  @override
  String get lightFilterLedDisclaimer =>
      'Indicative result only. Actual rendering depends on the projector, its spectrum, calibration, color mode and context of use.';

  @override
  String get lightFilterLedEngineRgb => 'RGB';

  @override
  String get lightFilterLedEngineRgba => 'RGBA';

  @override
  String get lightFilterLedEngineRgbw => 'RGBW';

  @override
  String get lightFilterLedEngineRgbl => 'RGBL';

  @override
  String get lightFilterLedEngineRgbwa => 'RGBWA';

  @override
  String get lightFilterLedEngineRgbal => 'RGBAL';

  @override
  String get aboutSearchHint => 'Search in references';

  @override
  String get aboutSearchNoResults => 'No results found.';

  @override
  String get homePinnedTitle => 'Pins';

  @override
  String get homePinnedSubtitle => 'Quickly find your pinned references.';

  @override
  String get pinnedReferencesTitle => 'Pinned references';

  @override
  String get pinnedReferencesEmpty => 'No references pinned yet.';

  @override
  String get aboutPinAddTooltip => 'Pin this reference';

  @override
  String get aboutPinRemoveTooltip => 'Remove this pin';

  @override
  String get aboutPinAddedMessage => 'Pinned reference.';

  @override
  String get aboutPinRemovedMessage => 'Pin removed.';

  @override
  String get homeDrawerSubscriptions => 'Subscriptions';

  @override
  String get subscriptionPageTitle => 'Subscriptions';

  @override
  String get subscriptionHeadlineAllTitle => 'Choose your plan';

  @override
  String get subscriptionHeadlineAllSubtitle =>
      'See your current purchases and the subscriptions still available here.';

  @override
  String subscriptionHeadlineUnlock(Object module) {
    return 'Unlock $module';
  }

  @override
  String get subscriptionHeadlineVideoSubtitle =>
      'You can buy Video only, or choose Pro to unlock everything.';

  @override
  String get subscriptionHeadlineLightSubtitle =>
      'You can buy Lighting only, or choose Pro to unlock everything.';

  @override
  String get subscriptionHeadlineLaserSubtitle =>
      'You can buy Laser only, or choose Pro to unlock everything.';

  @override
  String get subscriptionHeadlineConsoleSubtitle =>
      'You can buy Console only, or choose Pro to unlock everything.';

  @override
  String get subscriptionHeadlineProSubtitle =>
      'Full access to all advanced sections.';

  @override
  String get subscriptionStoreUnavailable => 'Store currently unavailable.';

  @override
  String get subscriptionLoadError => 'Unable to load subscriptions.';

  @override
  String get subscriptionRestorePurchases => 'Restore my purchases';

  @override
  String get subscriptionPrivacy => 'Privacy';

  @override
  String get subscriptionTerms => 'Terms';

  @override
  String get subscriptionBestValue => 'BEST VALUE';

  @override
  String get subscriptionOwned => 'Owned';

  @override
  String get subscriptionIncludedInPro => 'Included in Pro';

  @override
  String get subscriptionProductUnavailable => 'Product unavailable.';

  @override
  String get subscriptionSubscribeAll => 'Subscribe — Unlock everything';

  @override
  String subscriptionSubscribeModule(Object module) {
    return 'Subscribe — $module';
  }

  @override
  String get subscriptionCategoryVideoTitle => 'Video';

  @override
  String get subscriptionCategoryLightTitle => 'Lighting';

  @override
  String get subscriptionCategoryLaserTitle => 'Laser';

  @override
  String get subscriptionCategoryConsoleTitle => 'Console';

  @override
  String get subscriptionCategoryProTitle => 'ShowTech Tools Pro';

  @override
  String get subscriptionCategoryVideoDescription =>
      'Access to the Video section.';

  @override
  String get subscriptionCategoryLightDescription =>
      'Access to the Lighting section.';

  @override
  String get subscriptionCategoryLaserDescription =>
      'Access to the Laser section.';

  @override
  String get subscriptionCategoryConsoleDescription =>
      'Access to the Console section.';

  @override
  String get subscriptionCategoryProDescription =>
      'Full access to all sections.';

  @override
  String get electricityFreeSection => 'Free';

  @override
  String get electricityProSection => 'Electricity subscription';

  @override
  String get riggingFreeSection => 'Free';

  @override
  String get riggingProSection => 'Rigging subscription';

  @override
  String get videoFreeSection => 'Free';

  @override
  String get videoProSection => 'Video subscription';

  @override
  String get lumiereFreeSection => 'Free';

  @override
  String get lumiereProSection => 'Lighting subscription';

  @override
  String get consoleFreeSection => 'Free';

  @override
  String get consoleProSection => 'Console subscription';

  @override
  String get lumiereFilterEquivDescription =>
      'Equivalences Lee ↔ Roscolux ↔ e-colour+';

  @override
  String get audioSplModeDistance => 'Distance → SPL';

  @override
  String get audioSplModePower => 'Power → SPL';

  @override
  String get homeElectricityTitle => 'Electricity';

  @override
  String get homeElectricitySubtitle =>
      'Power, current, cable sections and UPS autonomy.';

  @override
  String get subscriptionCategoryElectricityTitle => 'Electricity';

  @override
  String get subscriptionCategoryElectricityDescription =>
      'Electrical tools for power, phases, cables and UPS.';

  @override
  String get subscriptionCategoryRiggingTitle => 'Rigging';

  @override
  String get subscriptionCategoryRiggingDescription =>
      'Rigging tools for bridle, angles and verification WLL / CMU.';

  @override
  String get subscriptionHeadlineElectricitySubtitle =>
      'Unlocks all professional power tools.';

  @override
  String get subscriptionHeadlineRiggingSubtitle =>
      'Unlocks all professional rigging tools.';

  @override
  String get electricityTitle => 'Electricity';

  @override
  String get electricityToolPowerCurrentTitle => 'Power / current';

  @override
  String get electricityToolPowerCurrentSubtitle =>
      'Calculate power, current, voltage or energy in single or three phase.';

  @override
  String get electricityToolPhasePowerTitle => 'Power per phase';

  @override
  String get electricityToolPhasePowerSubtitle =>
      'Distribute a total power and read the current per phase.';

  @override
  String get electricityToolLoadBalancerTitle => 'Load distribution';

  @override
  String get electricityToolLoadBalancerSubtitle =>
      'Add fixtures from the catalog, assign them to phases and check your panel amperage.';

  @override
  String get electricityToolGeneratorTitle => 'Generator';

  @override
  String get electricityPowerFactorToolTitle => 'Power Factor (kVA ↔ kW)';

  @override
  String get electricityToolPowerFactorSubtitle =>
      'Converts apparent (kVA) and active (kW) power via cos φ in both directions, with reactive power (kVAR).';

  @override
  String get electricityPowerFactorModeTitle => 'Calculation direction';

  @override
  String get electricityPowerFactorModeKvaToKw => 'kVA → kW';

  @override
  String get electricityPowerFactorModeKwToKva => 'kW → kVA';

  @override
  String get electricityPowerFactorInputsTitle => 'Known values';

  @override
  String get electricityPowerFactorApparentLabel => 'Apparent power';

  @override
  String get electricityPowerFactorApparentHint => 'E.g.: 10';

  @override
  String get electricityPowerFactorActiveLabel => 'Active power';

  @override
  String get electricityPowerFactorActiveHint => 'E.g.: 8';

  @override
  String get electricityPowerFactorCosPhiLabel => 'Power factor (cos φ)';

  @override
  String get electricityPowerFactorCosPhiHint => '0.1 – 1.0, e.g.: 0.8';

  @override
  String get electricityPowerFactorResultsTitle => 'Results';

  @override
  String get electricityPowerFactorReactiveLabel => 'Reactive power';

  @override
  String get electricityPowerFactorAngleLabel => 'Phase angle';

  @override
  String get electricityPowerFactorEnterValues =>
      'Enter values to see the result.';

  @override
  String get electricityPowerFactorFormulaNote =>
      'kW = kVA × cos φ · kVA = kW / cos φ · kVAR = √(kVA² − kW²). cos φ = 1 means a purely resistive load (no reactive power).';

  @override
  String get electricityToolGeneratorSubtitle =>
      'Sizing: active power → kVA, diversity factor, safety margin, recommended standard size.';

  @override
  String get electricityGeneratorInputsTitle => 'Load to Power';

  @override
  String get electricityGeneratorActivePowerLabel => 'Installed Active Power';

  @override
  String get electricityGeneratorActivePowerHint =>
      'Sum of active loads (see load balancer)';

  @override
  String get electricityGeneratorCosPhiLabel => 'Average Power Factor';

  @override
  String get electricityGeneratorCosPhiHint =>
      '0.85–0.95 typical (dimmers, LED, amps)';

  @override
  String get electricityGeneratorDiversityLabel => 'Diversity Factor';

  @override
  String get electricityGeneratorDiversityHint =>
      '% of installed power actually drawn simultaneously';

  @override
  String get electricityGeneratorMarginLabel => 'Safety Margin';

  @override
  String get electricityGeneratorMarginHint =>
      'Recommended headroom for startup surges and peaks';

  @override
  String get electricityGeneratorFuelRateLabel => 'Specific Fuel Consumption';

  @override
  String get electricityGeneratorFuelRateHint =>
      '≈0.25 L/kWh typical for a well-loaded diesel unit';

  @override
  String get electricityGeneratorResultsTitle => 'Recommended Generator';

  @override
  String get electricityGeneratorRecommendedLabel =>
      'Recommended Standard Size';

  @override
  String get electricityGeneratorRecommendedOverMax =>
      '> 800 kVA — custom sizing, consult a rental company';

  @override
  String get electricityGeneratorApparentNeededLabel => 'Apparent Power Needed';

  @override
  String get electricityGeneratorCurrentLabel => 'Estimated Output Current';

  @override
  String get electricityGeneratorFuelPerHourLabel => 'Estimated Consumption';

  @override
  String get electricityGeneratorFuelPerShowLabel => 'Over an 8h Show';

  @override
  String get electricityGeneratorEnterValues =>
      'Enter the active power to calculate';

  @override
  String get electricityGeneratorDisclaimer =>
      'Indicative estimate — always check against the generator supplier/manufacturer\'s recommendations (altitude, temperature, non-linear loads).';

  @override
  String get electricityToolCableSectionTitle => 'Cable section';

  @override
  String get electricityToolCableSectionSubtitle =>
      'Calculate a section according to current or power, length, voltage drop and cable reference.';

  @override
  String get electricityToolUpsTitle => 'UPS autonomy';

  @override
  String get electricityToolUpsSubtitle =>
      'Estimate the autonomy of a battery or a UPS depending on the load.';

  @override
  String get electricityInputsTitle => 'Starters';

  @override
  String get electricityResultsTitle => 'Results';

  @override
  String get electricityEnterValuesToCalculate =>
      'Enters valid values ​​to calculate.';

  @override
  String get electricityTotalPowerLabel => 'Total power';

  @override
  String get electricityTotalPowerHint => 'Ex. 22000';

  @override
  String get electricityPowerPerPhaseLabel => 'Power per phase';

  @override
  String get electricityCurrentPerPhaseLabel => 'Current per phase';

  @override
  String get electricityCurrentLabel => 'Fluent';

  @override
  String get electricityPhaseCountLabel => 'Number of phases';

  @override
  String get electricityConsumptionCurrentLabel =>
      'Consumption / actual current';

  @override
  String get electricityConsumptionCurrentHint => '32';

  @override
  String get electricityBreakerSizeLabel => 'Circuit breaker size';

  @override
  String get electricityBreakerSizeHint => '32';

  @override
  String get electricityCableLengthLabel => 'Cable length';

  @override
  String get electricityCableLengthHint => 'Example 30';

  @override
  String get electricityAllowedVoltageDropLabel => 'Max voltage drop';

  @override
  String get electricityAllowedVoltageDropHint => 'Example 3';

  @override
  String get electricityRecommendedCableSectionLabel => 'Recommended section';

  @override
  String get electricityMaxCurrentForSectionLabel => 'Allowable current';

  @override
  String get electricityVoltageDropLabel => 'Voltage drop';

  @override
  String get electricityBreakerCheckLabel => 'Circuit breaker check';

  @override
  String get electricityStatusOk => 'Okay';

  @override
  String get electricityStatusWarning => 'To be checked';

  @override
  String get electricityImportantNoteTitle => 'Important note';

  @override
  String get electricityCableSectionDisclaimer =>
      'Indicative calculation based on a reference table inspired by IEC 60364-5-52. Always check the RGIE/AREI, the actual installation method, the temperature, the cable grouping and the protection with a qualified electrician.';

  @override
  String get electricityConsumptionInputTypeTitle => 'Known value';

  @override
  String get electricityInputCurrent => 'Current (A)';

  @override
  String get electricityInputPower => 'Power (W)';

  @override
  String get electricityVoltageLabel => 'Voltage (U)';

  @override
  String get electricityVoltageHint => 'Ex. 230 or 400';

  @override
  String get electricityPowerFactorLabel => 'Power factor (cos φ)';

  @override
  String get electricityPowerFactorHint => 'Example 1.0';

  @override
  String get electricityCableReferenceTitle => 'Cable reference';

  @override
  String get electricityCopper => 'Copper';

  @override
  String get electricityAluminium => 'Aluminum';

  @override
  String get electricityInsulationPvc => 'PVC 70°C';

  @override
  String get electricityInsulationXlpe => 'XLPE 90°C';

  @override
  String get electricityInstallConduit => 'Driven';

  @override
  String get electricityInstallFreeAir => 'Free air';

  @override
  String get electricityCalculatedCurrentLabel => 'Calculated current';

  @override
  String get electricityRecommendedBreakerLabel =>
      'Recommended circuit breaker';

  @override
  String get electricityNoStandardBreaker => 'No suitable standard caliber';

  @override
  String get electricityStatusLabel => 'Status';

  @override
  String get electricityCircuitTypeTitle => 'Circuit type';

  @override
  String get electricitySinglePhase => 'Single phase';

  @override
  String get electricityThreePhase => 'Three-phase';

  @override
  String get electricityResultActivePower => 'Active power';

  @override
  String get electricityResultCurrent => 'Fluent';

  @override
  String get electricityResultVoltage => 'Tension';

  @override
  String get electricityResultEnergy => 'Energy';

  @override
  String get electricityInsufficient => 'Insufficient values';

  @override
  String get electricityCalcPower => 'Power';

  @override
  String get electricityCalcCurrent => 'Fluent';

  @override
  String get electricityCalcVoltage => 'Tension';

  @override
  String get electricityCalcEnergy => 'Energy';

  @override
  String get electricityRef16AMono => '16 A mono';

  @override
  String get electricityRef32AMono => '32 A mono';

  @override
  String get electricityRef32ATri => '32 A sort';

  @override
  String get electricityRef63ATri => '63 Sorted';

  @override
  String get electricityRef125ATri => '125 A tri';

  @override
  String get electricityFormulaTri => 'P = √3 × U × I × cos φ';

  @override
  String get electricityFormulaMono => 'P = U × I × cos φ';

  @override
  String get electricityFormulaTriDesc =>
      'Three-phase formula for balanced charging.';

  @override
  String get electricityFormulaMonoDesc => 'Single-phase formula.';

  @override
  String get electricityCircuitType => 'Circuit type';

  @override
  String get electricityMono => 'Mono';

  @override
  String get electricityMonoDesc => 'Single-phase 230 V circuit.';

  @override
  String get electricityThreePhaseDesc => '400 V three-phase circuit.';

  @override
  String get electricityCalcFor => 'Calculate';

  @override
  String get electricityFieldPower => 'Power';

  @override
  String get electricityFieldPowerHint => 'Ex. 3680';

  @override
  String get electricityFieldCurrent => 'Fluent';

  @override
  String get electricityFieldCurrentHint => 'Example 16';

  @override
  String get electricityFieldVoltage => 'Tension';

  @override
  String get electricityFieldVoltageHint => '230';

  @override
  String get electricityFieldDuration => 'Duration';

  @override
  String get electricityFieldDurationHint => 'Example 2';

  @override
  String get electricityFieldPf => 'cos φ';

  @override
  String get electricityFieldPfHint => 'Example 1.0';

  @override
  String get electricityCalculate => 'Calculate';

  @override
  String get electricityRefTitle => 'Quick References';

  @override
  String electricityUpsEnergyAvail(String energy) {
    return '$energy Wh available';
  }

  @override
  String get electricityUpsBatterySection => 'Battery';

  @override
  String get electricityUpsCalculate => 'Calculate autonomy';

  @override
  String get electricityUpsCapacityHint => 'Example 100';

  @override
  String get electricityUpsCapacityLabel => 'Ability';

  @override
  String get electricityUpsCountHint => 'Example 1';

  @override
  String get electricityUpsCountLabel => 'Number of batteries';

  @override
  String get electricityUpsEfficiencyHint => 'Ex. 85';

  @override
  String get electricityUpsEfficiencyLabel => 'Yield';

  @override
  String get electricityUpsLoadDesc => 'Power consumed by the equipment.';

  @override
  String get electricityUpsLoadHint => 'Ex. 500';

  @override
  String get electricityUpsLoadLabel => 'Charge';

  @override
  String get electricityUpsLoadSectionTitle => 'Load to be supplied';

  @override
  String get electricityUpsRef1 => 'Wh available';

  @override
  String get electricityUpsRef1Detail =>
      'Capacity × voltage × number × efficiency.';

  @override
  String get electricityUpsRef2 => 'Autonomy';

  @override
  String get electricityUpsRef2Detail => 'Available energy divided by load.';

  @override
  String get electricityUpsRef3Title => 'Indicative result';

  @override
  String get electricityUpsRef3Value =>
      'The actual value depends on the efficiency, the condition of the batteries and the charge.';

  @override
  String get electricityUpsRefTitle => 'References';

  @override
  String get electricityUpsVoltageHint => 'Example 12';

  @override
  String get electricityUpsVoltageLabel => 'Battery voltage';

  @override
  String get riggingToolBridleTitle => '2 point bridle';

  @override
  String get riggingToolBridleSubtitle =>
      'Complete calculation of a bridle: lengths, angles, tensions and safety status.';

  @override
  String get riggingToolAngleFactorTitle => 'Angle factor';

  @override
  String get riggingToolAngleFactorSubtitle =>
      'Quickly see the effect of angle on tension in the strands.';

  @override
  String get riggingToolMultiPointTitle => 'Multi-Point Bridle';

  @override
  String get riggingToolMultiPointSubtitle =>
      'Leg tension for a symmetric 2-8 point bridle, with WLL check.';

  @override
  String get riggingLegCountLabel => 'Number of Legs';

  @override
  String get riggingWllPerLegLabel => 'WLL per Leg';

  @override
  String get riggingMultiPointSymmetricNote =>
      'Valid for a symmetric bridle: equal-length legs, centered load, evenly shared tension. For an asymmetric or complex setup, use a qualified rigger or certified software.';

  @override
  String get riggingToolHoistTitle => 'Hoist Selector';

  @override
  String get riggingToolHoistSubtitle =>
      'Load to lift → recommended standard hoist size, with safety margin.';

  @override
  String get riggingHoistRecommendedLabel => 'Recommended Hoist';

  @override
  String get riggingHoistOverMaxLabel =>
      '> 10,000 kg — outside standard range, consult a lifting specialist';

  @override
  String get riggingHoistAvailabilityNote =>
      'Indicative standard sizes (0.125 to 10 t) — actual availability depends on the manufacturer and rental company.';

  @override
  String get riggingToolWllTitle => 'Verification WLL / CMU';

  @override
  String get riggingToolWllSubtitle =>
      'Compare an applied load with the capacity of the material.';

  @override
  String get riggingToolLengthTitle => 'Bridle length';

  @override
  String get riggingToolLengthSubtitle =>
      'Calculate lengths and angles without load calculation.';

  @override
  String get riggingKnownDrop => 'Arrow';

  @override
  String get riggingKnownAngle => 'Corner';

  @override
  String get riggingKnownLength => 'Length';

  @override
  String get riggingAngleFromHorizontalLabel => 'Angle from horizontal';

  @override
  String get riggingLegLengthKnownLabel => 'Length of a strand';

  @override
  String get riggingLoadWeightLabel => 'Load weight';

  @override
  String get riggingLoadShortLabel => 'Charge';

  @override
  String get riggingPointALabel => 'HAS';

  @override
  String get riggingPointBLabel => 'B';

  @override
  String get riggingTensionLabel => 'Tension';

  @override
  String get riggingTensionLeftLabel => 'Left tension';

  @override
  String get riggingTensionRightLabel => 'Straight tension';

  @override
  String get riggingTensionPerLegLabel => 'Tension per strand';

  @override
  String get riggingStatusOk => 'Okay';

  @override
  String get riggingStatusWatch => 'To watch';

  @override
  String get riggingStatusHigh => 'Pupil';

  @override
  String get riggingStatusDanger => 'Dangerous';

  @override
  String get riggingStatusOkDescription =>
      'Comfortable angle. The tension remains reasonable.';

  @override
  String get riggingStatusWatchDescription =>
      'Usable angle, but tension starts to increase.';

  @override
  String get riggingStatusHighDescription =>
      'Low angle. The tension increases sharply.';

  @override
  String get riggingStatusDangerDescription =>
      'Very low angle. Configuration to avoid.';

  @override
  String get riggingSafetyDisclaimer =>
      'Indicative result. Always check the actual CMU/WLL, safety factors and applicable rules.';

  @override
  String get riggingInvalidInputsMessage =>
      'Between positive and consistent values.';

  @override
  String get riggingAngleFactorLabel => 'Multiplier factor';

  @override
  String get riggingAngleFactorExplanation =>
      'The smaller the angle relative to the horizontal, the more the tension in each strand increases.';

  @override
  String get riggingWllLabel => 'WLL / CMU of hardware';

  @override
  String get riggingAppliedLoadLabel => 'Applied load';

  @override
  String get riggingSafetyFactorLabel => 'Safety factor';

  @override
  String get riggingRequiredLoadLabel => 'Load to check';

  @override
  String get riggingWllUsageLabel => 'Use WLL';

  @override
  String get riggingMarginLabel => 'Remaining margin';

  @override
  String get riggingWllStatusOkDescription =>
      'The hardware capacity is sufficient for this load.';

  @override
  String get riggingWllStatusWatchDescription =>
      'Capacity is still sufficient, but the margin is low.';

  @override
  String get riggingWllStatusDangerDescription =>
      'The load exceeds the indicated capacity.';

  @override
  String get riggingLengthDifferenceLabel => 'Length difference';

  @override
  String get riggingCalculationModeLabel => 'Calculation type';

  @override
  String get riggingGeometryOnlyLabel => 'Without load';

  @override
  String get riggingWithLoadLabel => 'With load';

  @override
  String get riggingGeometryOnlyDescription =>
      'Geometry mode only: lengths, arrow and angles. No voltage or load calculation.';

  @override
  String get riggingKnownInputLabel => 'I know';

  @override
  String get homeConversionsTitle => 'Conversions';

  @override
  String get homeConversionsSubtitle =>
      'Units, distance, video, audio, DMX and field conversions.';

  @override
  String get conversionsTitle => 'Conversions';

  @override
  String get conversionsDistanceTitle => 'Distance';

  @override
  String get conversionsTemperatureTitle => 'Temperature';

  @override
  String get conversionsAnglesTitle => 'Angles';

  @override
  String get conversionsVideoTitle => 'Video';

  @override
  String get conversionsAudioTitle => 'Audio';

  @override
  String get conversionsDmxTitle => 'DMX';

  @override
  String get conversionsSwap => 'Reverse';

  @override
  String get conversionsDisclaimer =>
      'Indication only. Always check critical values ​​with the manufacturer\'s documentation.';

  @override
  String get conversionMetersFeet => 'Meters <> feet';

  @override
  String get conversionCentimetersInches => 'Centimeters <> inches';

  @override
  String get conversionMetersYards => 'Meters <> yards';

  @override
  String get conversionCelsiusFahrenheit => 'Celsius <> Fahrenheit';

  @override
  String get conversionDegreesRadians => 'Degrees <> radians';

  @override
  String get conversionSlopePercentDegrees => 'Slope % <> degrees';

  @override
  String get conversionNitsFootLambert => 'Nits <> foot-lambert';

  @override
  String get conversionFpsFrameTime => 'FPS <> frame duration';

  @override
  String get conversionBpmMs => 'BPM <> milliseconds';

  @override
  String get conversionDelayDistance => 'Delay <> distance';

  @override
  String get conversionDmxPercent => 'DMX <> %';

  @override
  String get conversionEightBitSixteenBit => '8 bit <> 16 bit';

  @override
  String get subscriptionDurationYear => '1 year subscription';

  @override
  String get conversionAudioLevel => 'dBu/dBV/V';

  @override
  String get conversionDmxAbsolute => 'Universe <> DMX absolute';

  @override
  String get conversionDmxToAbsoluteHint => 'Universe + address → absolute';

  @override
  String get conversionDmxFromAbsoluteHint => 'Absolute → universe + address';

  @override
  String get conversionDmxUniverseLabel => 'Universe';

  @override
  String get conversionDmxAddressLabel => 'Address';

  @override
  String get conversionDmxAbsoluteLabel => 'DMX Absolute';

  @override
  String get gdtfTitle => 'GDTF';

  @override
  String get gdtfSearchTab => 'Research';

  @override
  String get gdtfGenerateFromPdfTab => 'Generate from PDF';

  @override
  String get gdtfSearchHint => 'ex: Martin MAC Aura, Chauvet Rogue…';

  @override
  String get gdtfFixtureNameLabel => 'Fixture name';

  @override
  String get gdtfSearchInfo =>
      'Search in the GDTF Share database (6000+ fixtures).\nIf not found, use the \"Generate from PDF\" tab.';

  @override
  String get gdtfNoFixtureFound => 'No fixtures found';

  @override
  String get gdtfNoFixtureFoundHelp =>
      'You can generate a GDTF from the manual PDF.';

  @override
  String get gdtfGenerateFromPdfTitle => 'Generate a GDTF from a PDF';

  @override
  String get gdtfGenerateFromPdfIntro =>
      'Upload the technical manual for your fixture. The AI extracts the DMX modes — you check and correct before generating the file.\n\n⚠️ Key to success: enter the exact fixture name as it appears in the manual. And if you add modes manually, use the exact DMX mode names — otherwise the AI won\'t find the right data.';

  @override
  String get gdtfManufacturerHint => 'ex: Martin, Chauvet, Robe…';

  @override
  String get gdtfModelHint => 'ex: MAC Aura XIP, Rogue R2X…';

  @override
  String get gdtfSelectManualPdf => 'Select manual PDF';

  @override
  String get gdtfDetectingModes => 'Mode detection…';

  @override
  String get gdtfAnalyzePdf => 'Parse PDF';

  @override
  String get gdtfAnalyzePdfHelp =>
      'The AI ​​detects the DMX modes available in the manual. You then choose which ones to extract before generating the file.';

  @override
  String get gdtfBackToForm => 'Return to form';

  @override
  String gdtfDetectedModesInManual(int count) {
    return '$count mode(s) DMX detected in the manual';
  }

  @override
  String get gdtfSearchModeHint => 'Search for a mode…';

  @override
  String get gdtfSelectAll => 'All';

  @override
  String get gdtfSelectNone => 'None';

  @override
  String gdtfSelectedModesCount(int selected, int total) {
    return '$selected selected on $total';
  }

  @override
  String get gdtfNoModeMatchesSearch => 'No mode matches the search.';

  @override
  String gdtfDmxChannelCount(int count) {
    return '$count channels DMX';
  }

  @override
  String get gdtfExtractionInProgressLong =>
      'Extracting in progress...this can take up to 10 minutes according to the manual. Don\'t close the app.';

  @override
  String get gdtfExtractionMayTakeLong =>
      'Extraction may take up to 10 minutes depending on the size of the manual and the number of modes selected.';

  @override
  String get gdtfExtractingChannels => 'Extraction of channels…';

  @override
  String gdtfExtractModes(int count) {
    return 'Extract $count mode(s)';
  }

  @override
  String get gdtfBackToModeSelection => 'Return to mode selection';

  @override
  String gdtfDetectedModesCount(int count) {
    return '$count mode(s) detected';
  }

  @override
  String gdtfUnextractedModesCount(int count) {
    return '$count mode(s) not extracted';
  }

  @override
  String get gdtfGenerating => 'Generation…';

  @override
  String get gdtfGenerateGdtfFile => 'Generate the .gdtf file';

  @override
  String get gdtfModeNameHint => 'Mode name';

  @override
  String gdtfChannelCount(int count) {
    return '$count channels';
  }

  @override
  String get gdtfChannelShort => 'Ch';

  @override
  String get gdtfBits => 'Bits';

  @override
  String get gdtfName => 'Name';

  @override
  String get gdtfDefaultValueLabel => 'Default value (0-255):';

  @override
  String get gdtfValueRangesLabel => 'Value ranges / Sub-functions:';

  @override
  String get gdtfValueRangesHint =>
      'ex: 0-9=closed, 10-100=slow strobe, 255=open';

  @override
  String get gdtfAddChannel => 'Add a channel';

  @override
  String get gdtfFileGenerated => 'File generated!';

  @override
  String get gdtfShareGdtfFile => 'Share the .gdtf file';

  @override
  String get gdtfGenerateAnotherFile => 'Generate another file';

  @override
  String get gdtfGmailIosTitle => 'Using Gmail on iOS? Read this 👀';

  @override
  String get gdtfGmailIosWarning =>
      'Gmail on iOS often blocks .gdtf attachments (\"can\'t attach file\"). Fix: rename the file to .zip before sending — the recipient renames it back to .gdtf after receiving. WhatsApp, Messenger and AirDrop work without issues.';

  @override
  String get gdtfDownload => 'Download';

  @override
  String gdtfModeFootprint(String name, int count) {
    return '$name (${count}ch)';
  }

  @override
  String gdtfDownloadingFixture(String fixture) {
    return 'Downloading $fixture…';
  }

  @override
  String gdtfErrorStatus(int statusCode) {
    return 'Error $statusCode';
  }

  @override
  String gdtfErrorStatusParentheses(int statusCode) {
    return 'Error ($statusCode)';
  }

  @override
  String gdtfNetworkError(String error) {
    return 'Network error: $error';
  }

  @override
  String gdtfErrorDetails(String error) {
    return 'Error: $error';
  }

  @override
  String get gdtfErrorFillManufacturerAndModel =>
      'Fill in the manufacturer and model.';

  @override
  String get gdtfErrorSelectPdf => 'Selects a PDF file.';

  @override
  String get gdtfErrorCannotExtractDmxPages =>
      'Unable to extract DMX pages from PDF.';

  @override
  String get gdtfUnknownError => 'Unknown error';

  @override
  String get gdtfUnknownErrorLowercase => 'unknown error';

  @override
  String get gdtfNoDmxModeDetected => 'No DMX modes detected in manual.';

  @override
  String get gdtfErrorSelectAtLeastOneMode =>
      'Selects at least one mode to extract.';

  @override
  String get gdtfErrorManualDataLost => 'Manual data lost, restart analysis.';

  @override
  String get mireVideoPageTitle => 'Video screen targets';

  @override
  String get mireVideoWidthPxLabel => 'Width (px)';

  @override
  String get mireVideoHeightPxLabel => 'Height (px)';

  @override
  String get mireVideoProjectorCountLabel => 'Number of projectors (N)';

  @override
  String get mireVideoOverlapPercentLabel => 'Overlap (%)';

  @override
  String get mireVideoHint1920 => 'ex: 1920';

  @override
  String get mireVideoHint1080 => 'eg: 1080';

  @override
  String get mireVideoHint3840 => 'ex: 3840';

  @override
  String get mireVideoHint2160 => 'ex: 2160';

  @override
  String get mireVideoHint2 => 'ex: 2';

  @override
  String get mireVideoHint10Percent => 'eg: 10.0';

  @override
  String get mireVideoTestPatternTypeLabel => 'Type of sight';

  @override
  String get mireVideoSimpleTypeComboAll =>
      'Combo (grid + circles + 2 centered bars)';

  @override
  String get mireVideoSimpleTypeGridSafe => 'Grid + safe + circles';

  @override
  String get mireVideoSimpleTypeColorBars => 'Bars + ramps + circles';

  @override
  String get mireVideoSimpleTypeUniformity => 'Uniformity + circles';

  @override
  String get mireVideoSimpleTypeCheckerboard => 'Checkerboard + circles';

  @override
  String get mireVideoExportPngButton => 'Export PNG';

  @override
  String get mireVideoOrientationLabel => 'Orientation';

  @override
  String get mireVideoOrientationHorizontal => 'Horizontal';

  @override
  String get mireVideoOrientationVertical => 'Vertical';

  @override
  String get mireVideoMappingTypeLabel => 'Type mapping';

  @override
  String get mireVideoMappingTypeCombo => 'Combo (zones + overlap + blend)';

  @override
  String get mireVideoMappingTypeZonesAndOverlap => 'Zones + overlap';

  @override
  String get mireVideoMappingTypeBlendRamps => 'Blend ramps';

  @override
  String get mireVideoErrorInvalidWidthHeight => '❌ Invalid width/height (px).';

  @override
  String get mireVideoErrorInvalidProjectorCount =>
      '❌ Invalid number of projectors (N > 0).';

  @override
  String get mireVideoErrorInvalidOverlap => '❌ Invalid overlap (0 to 99.9).';

  @override
  String get cinemaTitle => 'Cinema / Film';

  @override
  String get cinemaIntroTitle => 'Cinema and filming tools';

  @override
  String get cinemaIntroBody =>
      'Useful calculations for optics, framing, exposure, storage, timecode and cinema projection.';

  @override
  String get cinemaFieldOfViewTitle => 'Field angle';

  @override
  String get cinemaFieldOfViewSubtitle =>
      'Horizontal, vertical and diagonal calculation depending on sensor and focal length.';

  @override
  String get cinemaFieldOfViewDescription =>
      'Calculates the angle of view according to the sensor format and the focal length.';

  @override
  String get cinemaFieldOfViewInfo =>
      'Formula: angle = 2 × atan (sensor size ÷ (2 × focal length)).';

  @override
  String get cinemaSubjectDistanceTitle => 'Camera/subject distance';

  @override
  String get cinemaSubjectDistanceSubtitle =>
      'Estimate the distance needed to frame a subject.';

  @override
  String get cinemaSubjectDistanceDescription =>
      'Estimates the camera distance needed to frame a subject at height.';

  @override
  String get cinemaSubjectDistanceInfo =>
      'Ideal geometric approximation. Actual distance may vary depending on breathing optics, sensor mode and cropping.';

  @override
  String get cinemaDepthOfFieldTitle => 'Depth of field';

  @override
  String get cinemaDepthOfFieldSubtitle =>
      'Sharp zone, near limit, far limit and hyperfocal.';

  @override
  String get cinemaDepthOfFieldDescription =>
      'Calculates the theoretical sharpness zone according to focal length, aperture, distance and circle of confusion.';

  @override
  String get cinemaDepthOfFieldInfo =>
      'Theoretical result. The perception of sharpness also depends on the resolution, display size and viewing distance.';

  @override
  String get cinemaLensEquivalenceTitle => 'Focal length equivalence';

  @override
  String get cinemaLensEquivalenceSubtitle =>
      'Focal length conversion between sensor formats.';

  @override
  String get cinemaLensEquivalenceDescription =>
      'Converts a focal length from one sensor format to another while maintaining a similar diagonal angle of view.';

  @override
  String get cinemaLensEquivalenceInfo =>
      'Diagonal-based conversion. For strictly horizontal or vertical framing, the factor may be slightly different.';

  @override
  String get cinemaAnamorphicTitle => 'Anamorphic';

  @override
  String get cinemaAnamorphicSubtitle =>
      'Desqueeze, final ratio and equivalent horizontal focal length.';

  @override
  String get cinemaAnamorphicDescription =>
      'Calculates the final ratio after desqueezing and the horizontal equivalence of the focal length.';

  @override
  String get cinemaAnamorphicInfo =>
      'An anamorphic lens widens the horizontal field after dequeezing, but retains the vertical behavior of the focal length.';

  @override
  String get cinemaShutterTitle => 'Shutter angle / shutter speed';

  @override
  String get cinemaShutterSubtitle =>
      'Conversion between shutter angle, FPS and speed.';

  @override
  String get cinemaShutterDescription =>
      'Converts a cinema shutter angle to shutter speed.';

  @override
  String get cinemaShutterInfo =>
      'At 180°, the speed is approximately 1 ÷ (2 × fps). Example: 25 fps → 1/50 s.';

  @override
  String get cinemaFlickerTitle => 'Flicker free';

  @override
  String get cinemaFlickerSubtitle =>
      'Safe shutter speeds according to 50 Hz or 60 Hz.';

  @override
  String get cinemaFlickerDescription =>
      'List of generally safe shutter speeds based on AC frequency.';

  @override
  String get cinemaFlickerInfo =>
      'LEDs, screens and dimmed sources can still flicker depending on their electronics, their PWM or their refresh frequency.';

  @override
  String get cinemaNdExposureTitle => 'ND / exhibition';

  @override
  String get cinemaNdExposureSubtitle =>
      'Stops, ND density, ND factor and exposure compensation.';

  @override
  String get cinemaNdExposureDescription =>
      'Converts a correction in stops to ND density and light reduction factor.';

  @override
  String get cinemaNdExposureInfo =>
      'Marks: ND 0.3 = 1 stop, ND 0.6 = 2 stops, ND 0.9 = 3 stops, ND 1.2 = 4 stops.';

  @override
  String get cinemaRecordingStorageTitle => 'Recording time';

  @override
  String get cinemaRecordingStorageSubtitle =>
      'Duration available depending on capacity and bitrate.';

  @override
  String get cinemaRecordingStorageDescription =>
      'Estimates available time based on card/disk capacity and video bitrate.';

  @override
  String get cinemaRecordingStorageInfo =>
      'Simplified decimal calculation: 1 GB = 8000 Mb. Allow room for audio, metadata, file system, and media pool.';

  @override
  String get cinemaTimecodeTitle => 'Timecode';

  @override
  String get cinemaTimecodeSubtitle =>
      'Timecode conversion ↔ frames and duration between two TCs.';

  @override
  String get cinemaTimecodeDescription =>
      'Converts two timecodes into frames and calculates the duration between the two.';

  @override
  String get cinemaTimecodeInfo =>
      'This first version uses full non-drop-frame timecode. The 29.97 drop-frame can then be added separately.';

  @override
  String get cinemaSlowMotionTitle => 'Slow motion / framerate';

  @override
  String get cinemaSlowMotionSubtitle =>
      'Slow motion factor and playback time.';

  @override
  String get cinemaSlowMotionDescription =>
      'Calculates slow motion factor and final playback time.';

  @override
  String get cinemaSlowMotionInfo =>
      'Example: 100 fps shot, 25 fps read = slow motion ×4.';

  @override
  String get cinemaProjectionTitle => 'Cinema screening';

  @override
  String get cinemaProjectionSubtitle =>
      'Screen, ratio, throw, luminance, nits and ft-L.';

  @override
  String get cinemaProjectionDescription =>
      'Calculates screen dimensions, projector distance and approximate luminance.';

  @override
  String get cinemaProjectionInfo =>
      'Approximate luminance: nits ≈ lumens × gain ÷ (π × area). Optical losses, zoom, lamp/laser aging and calibration are not included.';

  @override
  String get cinemaGlobalDisclaimer =>
      'These tools provide indicative technical values. Results may vary depending on camera, optics, codec, image profile, projector, canvas or actual filming conditions.';

  @override
  String get cinemaSensorLabel => 'Sensor';

  @override
  String get cinemaFocalLengthLabel => 'Focal length';

  @override
  String get cinemaHorizontalAngleResult => 'Horizontal angle';

  @override
  String get cinemaVerticalAngleResult => 'Vertical angle';

  @override
  String get cinemaDiagonalAngleResult => 'Diagonal angle';

  @override
  String get cinemaSensorDiagonalResult => 'Diagonal sensor';

  @override
  String get cinemaSubjectHeightLabel => 'Subject Height';

  @override
  String get cinemaFrameFillLabel => 'Occupancy of the height frame';

  @override
  String get cinemaEstimatedDistanceResult => 'Estimated distance';

  @override
  String get cinemaFrameHeightResult => 'Frame height at this distance';

  @override
  String get cinemaApertureLabel => 'Opening';

  @override
  String get cinemaSubjectDistanceInputLabel => 'Subject distance';

  @override
  String get cinemaCocLabel => 'Circle of confusion';

  @override
  String get cinemaCocHelper => 'Example Full Frame: 0.03 mm';

  @override
  String get cinemaHyperfocalResult => 'Hyperfocal';

  @override
  String get cinemaNearLimitResult => 'Near limit';

  @override
  String get cinemaFarLimitResult => 'Far limit';

  @override
  String get cinemaTotalDepthResult => 'Total depth';

  @override
  String get cinemaSourceSensorLabel => 'Source sensor';

  @override
  String get cinemaTargetSensorLabel => 'Target sensor';

  @override
  String get cinemaSourceFocalLengthLabel => 'Source focal length';

  @override
  String get cinemaEquivalentFocalResult => 'Equivalent focal length';

  @override
  String get cinemaAppliedFactorResult => 'Applied factor';

  @override
  String get cinemaSensorRecordingRatioLabel => 'Sensor/recording ratio';

  @override
  String get cinemaSensorRecordingRatioHelper =>
      '16:9 = 1.78, 4:3 = 1.33, 3:2 = 1.50';

  @override
  String get cinemaAnamorphicFactorLabel => 'Anamorphic factor';

  @override
  String get cinemaAnamorphicFactorHelper => '1.33, 1.5, 1.8, 2.0';

  @override
  String get cinemaOpticalFocalLengthLabel => 'Optical focal length';

  @override
  String get cinemaFinalRatioResult => 'Final ratio';

  @override
  String get cinemaHorizontalEquivalentFocalResult =>
      'Equivalent horizontal focal length';

  @override
  String get cinemaVerticalFocalResult => 'Vertical focal length';

  @override
  String get cinemaFramerateLabel => 'Frame rate';

  @override
  String get cinemaShutterAngleLabel => 'Shutter angle';

  @override
  String get cinemaExposureTimeResult => 'Exposure time';

  @override
  String get cinemaEquivalentShutterSpeedResult => 'Equivalent speed';

  @override
  String get cinemaMainsFrequencyLabel => 'Mains frequency';

  @override
  String get cinemaMains50Hz => '50 Hz — Europe';

  @override
  String get cinemaMains60Hz => '60 Hz — USA / others';

  @override
  String get cinemaRecommendedSpeedsResult => 'Recommended speeds';

  @override
  String get cinemaMainsBaseResult => 'Sector basis';

  @override
  String get cinemaReductionLabel => 'Desired reduction';

  @override
  String get cinemaNdDensityResult => 'Density ND';

  @override
  String get cinemaNdFactorResult => 'ND factor';

  @override
  String get cinemaApproxTransmissionResult => 'Transmission approx.';

  @override
  String get cinemaMediaCapacityLabel => 'Media capacity';

  @override
  String get cinemaBitrateLabel => 'Bit rate';

  @override
  String get cinemaBitrateHelper => 'Warning: Mb/s, not MB/s';

  @override
  String get cinemaAvailableDurationResult => 'Duration available';

  @override
  String get cinemaStorageConsumptionResult => 'Consumption';

  @override
  String get cinemaIntegerFramerateLabel => 'Integer framerate';

  @override
  String get cinemaIntegerFramerateHelper => '24, 25, 30, 50, 60…';

  @override
  String get cinemaTcInLabel => 'TC IN';

  @override
  String get cinemaTcOutLabel => 'TC OUT';

  @override
  String get cinemaTimecodeFormatHelper => 'Format HH:MM:SS:FF';

  @override
  String get cinemaTcInFramesResult => 'Frames TC IN';

  @override
  String get cinemaTcOutFramesResult => 'Frames TC OUT';

  @override
  String get cinemaDurationFramesResult => 'Duration in frames';

  @override
  String get cinemaDurationTcResult => 'TC duration';

  @override
  String get cinemaDurationResult => 'Duration';

  @override
  String get cinemaCaptureFramerateLabel => 'Framerate filming';

  @override
  String get cinemaPlaybackFramerateLabel => 'Framerate playback';

  @override
  String get cinemaRealDurationLabel => 'Actual duration filmed';

  @override
  String get cinemaSlowMotionFactorResult => 'Idle factor';

  @override
  String get cinemaPlaybackDurationResult => 'Reading time';

  @override
  String get cinemaScreenWidthLabel => 'Screen width';

  @override
  String get cinemaImageRatioLabel => 'Image ratio';

  @override
  String get cinemaImageRatioHelper => '1.85, 2.39, 1.78…';

  @override
  String get cinemaThrowRatioLabel => 'Throw ratio';

  @override
  String get cinemaProjectorLumensLabel => 'Projector flow';

  @override
  String get cinemaScreenGainLabel => 'Canvas gain';

  @override
  String get cinemaScreenHeightResult => 'Screen height';

  @override
  String get cinemaScreenAreaResult => 'Screen surface';

  @override
  String get cinemaProjectorDistanceResult => 'Projector distance';

  @override
  String get cinemaApproxLuminanceResult => 'Luminance approx.';

  @override
  String get gdtfScannedPdfOcrEnabled =>
      'PDF scanned detected: OCR mode activated. The scan may take an additional 1-2 minutes.';

  @override
  String get gdtfAddModeDialogTitle => 'Add a mode';

  @override
  String get gdtfModeNameExampleHint => 'Ex: Standard, Easy, Pixel Engine…';

  @override
  String get gdtfDmxChannelCountLabel => 'Number of channels DMX';

  @override
  String get gdtfDmxChannelCountHint => 'Ex: 24';

  @override
  String get gdtfCancel => 'Cancel';

  @override
  String get gdtfAdd => 'Add';

  @override
  String get gdtfErrorModeNameRequired => 'Name is required';

  @override
  String get gdtfErrorInvalidChannelCount =>
      'Invalid number of channels (1-1000)';

  @override
  String get gdtfErrorModeAlreadyExists =>
      'A mode with this name already exists';

  @override
  String get gdtfHowToUseThisPageTooltip => 'How to use this page';

  @override
  String get gdtfHowToGetGdtfTitle => 'How to get a GDTF';

  @override
  String get gdtfWorkflowIntro =>
      'For each fixture, follow these 3 steps in order.';

  @override
  String get gdtfWorkflowSearchTitle => 'Research';

  @override
  String get gdtfWorkflowSearchBody =>
      '“Search” tab. Type the name of your fixture (ex: \"Spiider\", \"MAC Viper\", \"Q-10\"). The GDTF Share database contains 6000+ official fixtures validated by manufacturers. It\'s free, instant, and 100% reliable. Use FIRST for 90% of cases.';

  @override
  String get gdtfWorkflowPdfTitle => 'Generate from PDF';

  @override
  String get gdtfWorkflowPdfBody =>
      'If the search yields nothing, go to the \"Generate from PDF\" tab. Upload the PDF manual/datasheet — the AI extracts the DMX modes automatically. ⚠️ Important: enter the exact fixture name (as written in the manual), and if you add modes manually, use the exact DMX mode names — otherwise the AI won\'t find the right data. Works well on clean PDFs (Robe, Martin, etc.) and less well on scanned or Chinese-translated manuals.';

  @override
  String get gdtfWorkflowManualTitle => 'Manual addition/correction';

  @override
  String get gdtfWorkflowManualBody =>
      'When the AI ​​has finished the analysis, you arrive on the mode selection page. The “Add a mode manually” button is ALWAYS available at the top of the list. Use it to: (a) add a mode that the AI ​​forgot, (b) delete a hallucination via trash, (c) correct an incorrect channel count (trash + re-add to the correct number). This is your last line of defense before generating GDTF — always check.';

  @override
  String get gdtfWorkflowTip =>
      'Tip: before extracting a PDF, always check gdtf-share — this saves you from AI extraction (longer and less reliable) when an official GDTF already exists. And remember: fixture name and mode names must be exactly as in the manual — the AI depends on it!';

  @override
  String get gdtfUnderstood => 'Understood';

  @override
  String get gdtfWorkflowSearchShortBody =>
      'Type the fixture name above. GDTF Share database (6000+ official fixtures). It\'s free, instant, manufacturer validated. Solves 90% of cases.';

  @override
  String get gdtfWorkflowPdfShortBody =>
      'Not found? “Generate from PDF” tab. Upload the manual — the AI ​​extracts the DMX modes. Works best on clean PDFs.';

  @override
  String get gdtfWorkflowManualShortBody =>
      'On the modes page, always check what the AI ​​has output. You can: add a forgotten mode, delete an hallucination (trash icon), or correct a false channel count (delete + re-add to the correct value). The AI ​​is fast but not infallible — you remain in control of the final list.';

  @override
  String get gdtfAddModeManually => 'Add a mode manually';

  @override
  String get gdtfNoModeDetectedAutomatically =>
      'No mode detected automatically.';

  @override
  String get gdtfNoModeDetectedHelp =>
      'The PDF is probably scanned or with a complex layout. Add the modes manually with the button above, and the extraction of the channels will then be done on the OCR text / extracted from the manual.';

  @override
  String get gdtfAddMode => 'Add a mode';

  @override
  String get gdtfDeleteModeTooltip => 'Remove this mode';

  @override
  String get audioHomeTitle => 'Sound';

  @override
  String get audioHomeSubtitle =>
      'Cardioid sub, end-fire, delays, SPL and tools for the sound engineer.';

  @override
  String get homeRfTitle => 'RF & Wireless';

  @override
  String get homeRfSubtitle =>
      'WiFi 2.4/5 GHz, coexistence, UHF/VHF bands, antenna calculator.';

  @override
  String get homeCinemaTitle => 'Cinema / Film';

  @override
  String get homeCinemaSubtitle =>
      'Optics, framing, exposure, timecode, storage and cinema projection.';

  @override
  String get audioSectionPlacementDirectivity => 'Placement & Directivity';

  @override
  String get audioSectionAcousticLevels => 'Acoustics & Levels';

  @override
  String get audioSectionAmpCabling => 'Amp & Wiring';

  @override
  String get audioSectionTimingAlignment => 'Timing & Alignment';

  @override
  String get audioSubCardioidTitle => 'Sub Cardioid';

  @override
  String get audioSubCardioidSubtitle =>
      'Delays for cardioid configuration (2 subs) or end-fire (N subs in line). Rear cancellation, front reinforcement.';

  @override
  String get audioSplDistanceTitle => 'SPL & Distance';

  @override
  String get audioSplDistanceSubtitle =>
      'Inverse square law: SPL depending on distance. Calculation from power + speaker sensitivity.';

  @override
  String get audioSplSumTitle => 'Addition of SPL Sources';

  @override
  String get audioSplSumSubtitle =>
      'N incoherent sources: +10·log(N) dB. Or addition of 2 different sources.';

  @override
  String get audioElectroacousticTitle => 'Electroacoustics';

  @override
  String get audioElectroacousticSubtitle =>
      'SPL from speaker sensitivity + power. Distance table. Coherent/inconsistent coupling.';

  @override
  String get audioWavelengthTitle => 'Frequency & Wavelength';

  @override
  String get audioWavelengthSubtitle =>
      'Conversion Hz ↔ λ (m), λ/4, λ/2. Audio spectrum table by bands.';

  @override
  String get audioAmpLoadTitle => 'Load Amp / Speakers';

  @override
  String get audioCrossoverTitle => 'Crossover Frequency';

  @override
  String get audioRt60Title => 'Reverberation Time (RT60)';

  @override
  String get audioRt60LengthLabel => 'Length';

  @override
  String get audioRt60WidthLabel => 'Width';

  @override
  String get audioRt60HeightLabel => 'Height';

  @override
  String get audioRt60AbsorptionLabel => 'Average absorption coefficient (α)';

  @override
  String get audioRt60PresetHard => 'Very reverberant (concrete, glass)';

  @override
  String get audioRt60PresetMedium => 'Average room (offices, wood)';

  @override
  String get audioRt60PresetTreated => 'Treated room (curtains, carpet)';

  @override
  String get audioRt60PresetAbsorbent => 'Very absorbent (treated studio)';

  @override
  String get audioRt60ResultTitle => 'Estimated RT60';

  @override
  String get audioRt60VolumeLabel => 'Room volume';

  @override
  String get audioRt60SurfaceLabel => 'Total surface area';

  @override
  String get audioRt60QualLive => 'Very reverberant';

  @override
  String get audioRt60QualComfortable => 'Comfortable for speech';

  @override
  String get audioRt60QualDry => 'Dry / controlled';

  @override
  String get audioRt60FormulaNote =>
      'RT60 = 0.161 × V / (α × S) — Sabine formula, estimate with uniform average absorption';

  @override
  String get audioSplMeterTitle => 'Sound Level Meter';

  @override
  String get audioDelayTimeTitle => 'Delay Time (BPM)';

  @override
  String get audioDelayTimeBpmLabel => 'BPM';

  @override
  String get audioDelayTimeResultsTitle => 'Times by division';

  @override
  String get audioDelayTimeEmptyState =>
      'Enter a BPM to calculate delay times.';

  @override
  String get audioDelayTimeNormalLabel => 'Straight';

  @override
  String get audioDelayTimeDottedLabel => 'Dotted';

  @override
  String get audioDelayTimeTripletLabel => 'Triplet';

  @override
  String get audioDelayTimeFormulaNote =>
      'Time (ms) = 60000 / BPM × quarter-note fraction. Dotted ×1.5 · Triplet ×2/3.';

  @override
  String get audioSplMeterPermissionTitle => 'Microphone access required';

  @override
  String get audioSplMeterPermissionBody =>
      'The sound level meter uses the phone\'s microphone to estimate the ambient sound level in real time.';

  @override
  String get audioSplMeterAllowMic => 'Allow microphone';

  @override
  String get audioSplMeterOpenSettings => 'Open settings';

  @override
  String get audioSplMeterLiveTitle => 'Live level';

  @override
  String get audioSplMeterStartHint => 'Tap to start';

  @override
  String get audioSplMeterStopHint => 'Tap to stop';

  @override
  String get audioSplMeterStatsTitle => 'Session statistics';

  @override
  String get audioSplMeterStatsEmpty =>
      'Start a measurement to see the min/avg/max statistics.';

  @override
  String get audioSplMeterMinLabel => 'Minimum';

  @override
  String get audioSplMeterAvgLabel => 'Average';

  @override
  String get audioSplMeterMaxLabel => 'Maximum';

  @override
  String get audioSplMeterReferenceTitle => 'Sound level reference';

  @override
  String get audioSplMeterRefQuiet => 'Quiet room';

  @override
  String get audioSplMeterRefConversation => 'Normal conversation';

  @override
  String get audioSplMeterRefTraffic => 'Urban traffic';

  @override
  String get audioSplMeterRefConcert => 'Concert / amplified venue';

  @override
  String get audioSplMeterRefPain => 'Pain threshold';

  @override
  String get audioSplMeterDisclaimer =>
      'Indicative measurement via the phone\'s microphone (uncalibrated) — does not replace an IEC 61672 certified sound level meter.';

  @override
  String get audioCrossoverFreqLabel => 'Crossover frequency';

  @override
  String get audioCrossoverImpedanceLabel => 'Speaker impedance';

  @override
  String get audioCrossoverCapacitorLabel => 'Capacitor (high-pass)';

  @override
  String get audioCrossoverInductorLabel => 'Inductor (low-pass)';

  @override
  String get audioCrossoverOrderNote => '1st order filter (6 dB/octave)';

  @override
  String get audioCrossoverReferenceTitle => 'Typical crossover points';

  @override
  String get audioCrossoverRefSubTop => 'Sub / Top';

  @override
  String get audioCrossoverRef2Way => '2-way (LF/HF)';

  @override
  String get audioCrossoverRef3WayLow => '3-way — LF/MF';

  @override
  String get audioCrossoverRef3WayHigh => '3-way — MF/HF';

  @override
  String get audioCrossoverFormulaNote => 'C = 1 / (2π·f·Z)    L = Z / (2π·f)';

  @override
  String get audioAmpLoadSubtitle =>
      'How many speakers per amp channel. Resulting impedance, power per speaker.';

  @override
  String get audioImpedanceTitle => 'Series / Parallel Impedance';

  @override
  String get audioImpedanceModeLabel => 'Wiring mode';

  @override
  String get audioImpedanceModeSeries => 'Series';

  @override
  String get audioImpedanceModeParallel => 'Parallel';

  @override
  String get audioImpedanceSpeakerLabel => 'Speaker';

  @override
  String get audioImpedanceAddSpeaker => 'Add a speaker';

  @override
  String get audioImpedanceTotalTitle => 'Total impedance';

  @override
  String get audioImpedanceEmptyState =>
      'Enter at least one impedance to calculate the total.';

  @override
  String get audioImpedanceWarningLow =>
      'Low impedance: check that your amp can handle this load (often 2 Ω minimum).';

  @override
  String get audioImpedanceFormulaNote =>
      'Series: Zt = Z1 + Z2 + …    Parallel: 1/Zt = 1/Z1 + 1/Z2 + …';

  @override
  String get audioLevelsTitle => 'Levels & Cables';

  @override
  String get audioLevelsSubtitle =>
      'dBu/dBV/V rms converter. Reference levels −10 dBV, +4 dBu, +18 dBu.';

  @override
  String get audioDelayDistanceTitle => 'Distance Delay';

  @override
  String get audioDelayDistanceSubtitle =>
      'Distance → ms to align delay stacks, fills or distributed diffusion. Multi-point.';

  @override
  String get subscriptionCategorySonRfShort => 'SOUND & RF';

  @override
  String get subscriptionProShort => 'PRO';

  @override
  String get audioConditions => 'Terms';

  @override
  String get audioAmbientTemperature => 'Ambient temperature';

  @override
  String get audioSpeedOfSound => 'Speed ​​of sound';

  @override
  String get audioListeningPoints => 'Listening points';

  @override
  String audioDistancePoint(int index) {
    return 'Point distance $index';
  }

  @override
  String get audioAddPoint => 'Add a point';

  @override
  String get audioCalculatedDelays => 'Calculated deadlines';

  @override
  String get audioTypicalUseCases => 'Typical use cases';

  @override
  String get audioDelayStackFillsTitle => 'Delay stack / fills';

  @override
  String get audioDelayStackFillsText =>
      'Measure the distance between the main system and the delay tower. Apply this delay to the delay tower to align it with the hands.';

  @override
  String get audioDistributedSoundTitle => 'Distributed broadcast';

  @override
  String get audioDistributedSoundText =>
      'For each loudspeaker zone, measure the distance from the reference system and apply the corresponding delay.';

  @override
  String get audioRoomFillTitle => 'Room filling';

  @override
  String get audioRoomFillText =>
      'Speakers close to the audience are delayed relative to the sound on stage to avoid the perception of dual sources.';

  @override
  String get audioDelayNote =>
      'The calculated delay corresponds to acoustic propagation in free air.\nFinely adjust by ear or with a phase analyzer.';

  @override
  String get audioFromSpeakerSensitivity => 'SPL from speaker sensitivity';

  @override
  String get audioSensitivity => 'Sensitivity';

  @override
  String get audioAmpPower => 'Amplifier power';

  @override
  String get audioMeasurementDistance => 'Measuring distance';

  @override
  String get audioTypicalSensitivities => 'Typical Sensitivities';

  @override
  String get audioSourceCoupling => 'Source coupling';

  @override
  String get audioSourceCouplingIntro =>
      'By adding identical sources side by side, the gain depends on the type of coupling:';

  @override
  String audioSourcesCount(int count) {
    return '$count sources';
  }

  @override
  String get audioPracticalRules => 'Practical rules';

  @override
  String get audioRuleDoubleDistance =>
      'Double the distance = −6 dB (free field). In a room, the attenuation is less thanks to reflections.';

  @override
  String get audioRuleDoublePower =>
      'Double the power = +3 dB. Multiply by 10 = +10 dB. It takes ×100 power to gain +20 dB.';

  @override
  String get audioRuleCoupling =>
      'Coherent coupling (sources in phase, back to back): +6 dB per doubling. Inconsistent coupling: +3 dB.';

  @override
  String get audioRuleSafety =>
      'Pain threshold ≈ 120 dB SPL. Hearing risk from 85 dB (8h) according to NIOSH. Every +3 dB divides the exposure time by 2.';

  @override
  String get audioDistance => 'Distance';

  @override
  String get audioSpl => 'SPL';

  @override
  String get audioIncoherent => 'Incoherent';

  @override
  String get audioCoherent => 'Consistent';

  @override
  String get audioIncoherentSubtitle => 'Offbeat sources\nor not synchronized';

  @override
  String get audioCoherentSubtitle => 'In-phase sources\naligned';

  @override
  String get audioLevelConverter => 'Level converter';

  @override
  String get audioReferenceLevels => 'Reference levels';

  @override
  String get audioGainStagingRules => 'Gain staging — practical rules';

  @override
  String get audioAmplifierPerChannel => 'AMPLIFIER — per channel';

  @override
  String get audioMinimumImpedance => 'Z min (Ω)';

  @override
  String get audioPowerW => 'Power (W)';

  @override
  String get audioAtOhm => 'to (Ω)';

  @override
  String get audioSpeaker => 'PREGNANT';

  @override
  String get audioNominalImpedance => 'Z nominal (Ω)';

  @override
  String get audioContinuousPower => 'P continues (W)';

  @override
  String get audioParallelConnection => 'PARALLEL CONNECTION';

  @override
  String get audioLoadImpedance => 'Z load';

  @override
  String get audioPowerPerSpeaker => 'P / enc.';

  @override
  String get audioStatus => 'Status';

  @override
  String audioTooLowImpedance(String diff) {
    return '✗ Z too low (−$diff Ω)';
  }

  @override
  String get audioExceedsContinuousPower => '⚠ Exceeds P continues';

  @override
  String audioNearLimit(int percent) {
    return '⚠ Near limit (>$percent%)';
  }

  @override
  String audioOkContinuousPower(int percent) {
    return '✓ OK ($percent% P cont.)';
  }

  @override
  String get audioAmpLoadNote =>
      'Based on the amplifier’s published power at each impedance (interpolated). The channel’s power is shared between the N speakers in parallel. 1.5× to 2× headroom over RMS/AES power handling is common when a limiter is set. Values come from manufacturer data sheets: always check against the manufacturer’s presets and recommendations.';

  @override
  String get audioConfiguration => 'Configuration';

  @override
  String get audioParameters => 'Settings';

  @override
  String get audioSubDistance => 'Distance between subs';

  @override
  String get audioSubCount => 'Number of subs';

  @override
  String get audioCardioid2Subs => 'Cardioid — 2 subs';

  @override
  String get audioCardioid2SubsDescription =>
      '1 normal sub + 1 sub returned with delay';

  @override
  String get audioEndFireNSubs => 'End-fire — N subs online';

  @override
  String get audioEndFireNSubsDescription =>
      'All front facing, delays shifted by row';

  @override
  String get audioResults => 'Results';

  @override
  String get audioEnterDistanceToCalculate => 'Enter a distance to calculate';

  @override
  String get audioDelayToApply => 'Deadline to apply';

  @override
  String get audioRearSubDelaySublabel => 'on the sub turned over (rear)';

  @override
  String get audioOptimalFrequency => 'Optimal frequency';

  @override
  String get audioFrontSub => 'Front sub';

  @override
  String get audioRearSubReversed => 'Rear sub (flipped)';

  @override
  String get audioNormalPolarity => 'Normal ✓';

  @override
  String get audioInvertedPolarity => 'Reversed 🔄';

  @override
  String get audioDelayBetweenRows => 'Delay between each row';

  @override
  String get audioMaxDelayRearSub => 'Max delay (rear sub)';

  @override
  String get audioFrontReferenceSub => 'Front sub (reference)';

  @override
  String audioSubNumber(int index) {
    return 'Sub $index';
  }

  @override
  String get audioEndFireReferenceNote =>
      '→ Sub 1 (front) is the reference. The following subs have an increasing delay.';

  @override
  String get audioHowTo => 'How to do it?';

  @override
  String get audioCardioidStep1 =>
      'Place sub A facing the audience (normal position).';

  @override
  String get audioCardioidStep2 =>
      'Place the B sub right behind it, physically turned upside down facing the back of the stage.';

  @override
  String get audioCardioidStep3 =>
      'In your processor or console, reverse the polarity of sub B (Ø / Phase button).';

  @override
  String get audioCardioidStep4 =>
      'Apply the calculated delay to sub B. Do not delay sub A.';

  @override
  String get audioCardioidStep5 =>
      'Check rear cancellation with a measurement mic or by walking behind the array.';

  @override
  String get audioCardioidTip =>
      '💡 The ideal distance between the subs corresponds to λ/4 of the central frequency of the sub (e.g. 90 Hz → ~0.95 m at 20 °C). Adjust to find the best compromise between cancellation and power.';

  @override
  String get audioEndFireStep1 =>
      'Line up all the subs in a row, all facing the audience, with the same distance between each.';

  @override
  String get audioEndFireStep2 =>
      'The most forward sub (sub 1) is the reference: delay = 0.';

  @override
  String get audioEndFireStep3 =>
      'Apply an increasing delay to each subsequent rank (sub 2 → 1×delay, sub 3 → 2×delay, etc.).';

  @override
  String get audioEndFireStep4 =>
      'All subs keep the same polarity (no inversion).';

  @override
  String get audioEndFireStep5 =>
      'Measure from the back to check for attenuation.';

  @override
  String get audioEndFireTip =>
      '💡 End-fire offers slightly less directivity gain than classic cardioid, but works with more than 2 subs and does not require physical flipping.';

  @override
  String get audioConversion => 'Conversion';

  @override
  String get audioFrequency => 'Frequency';

  @override
  String get audioWavelength => 'Wavelength';

  @override
  String get audioResult => 'Result';

  @override
  String get audioEnterValueToCalculate => 'Enter a value to calculate';

  @override
  String audioWavelengthAt(String frequency) {
    return 'Wavelength at $frequency';
  }

  @override
  String audioFrequencyForLambda(String lambda) {
    return 'Frequency for λ = $lambda m';
  }

  @override
  String get audioHalfWave => 'λ/2 (half wave)';

  @override
  String get audioQuarterWave => 'λ/4 (quarter wave)';

  @override
  String get audioSpectrumMarkers => 'Audio spectrum — benchmarks';

  @override
  String get audioWavelengthFormula =>
      'Formula: λ = v / f |    v = 331.3 + 0.606 × T (°C)';

  @override
  String get audioHzToLambda => 'Hz → λ (m)';

  @override
  String get audioLambdaToHz => 'λ (m) → Hz';

  @override
  String get audioSubBass => 'Sub-bass';

  @override
  String get audioBass => 'Bass';

  @override
  String get audioLowMid => 'Low-mids';

  @override
  String get audioMid => 'Mediums';

  @override
  String get audioHighMid => 'High-mids';

  @override
  String get audioTreble => 'Treble';

  @override
  String get audioIncoherentSources => 'Inconsistent sources';

  @override
  String get audioIdenticalSources => 'N identical sources';

  @override
  String get audioSingleSourceSpl => 'SPL of a source';

  @override
  String audioTotalSplSources(int count) {
    return 'Total SPL ($count sources)';
  }

  @override
  String get audioTwoDifferentSources => '2 different sources';

  @override
  String get audioSourceA => 'Source A';

  @override
  String get audioSourceB => 'Source B';

  @override
  String get audioTotalSplAB => 'Total SPL (A + B)';

  @override
  String get audioDoublingReference => 'Reference — doubling gain';

  @override
  String get audioIncoherentShort => 'Incoh. :';

  @override
  String get audioCoherentShort => 'Coher. :';

  @override
  String get audioCalculationMode => 'Calculation method';

  @override
  String get audioReferenceSpl => 'Reference SPL';

  @override
  String get audioReferenceDistance => 'Reference distance';

  @override
  String get audioTargetDistance => 'Target distance';

  @override
  String get audioEnterValuesToCalculate => 'Enter the values ​​to calculate';

  @override
  String audioSplAtDistance(String distance) {
    return 'SPL at $distance m';
  }

  @override
  String get audioVariation => 'Variation';

  @override
  String get audioListeningDistance => 'Listening distance';

  @override
  String get audioMaxSplAt1m => 'Max SPL at 1m';

  @override
  String get audioDistanceToSpl => 'Distance → SPL';

  @override
  String get audioPowerToSpl => 'Power → SPL';

  @override
  String get audioSoundLevelReference => 'Sound level reference';

  @override
  String get audioSectionSafety => 'Hearing Safety';

  @override
  String get audioNoiseDoseTitle => 'Noise Dose & Exposure Time';

  @override
  String get audioNoiseDoseIntro =>
      'Every +3 dB halves the allowed exposure time (3 dB exchange rate). Enter the measured or planned sound level to estimate the time before reaching regulatory noise exposure thresholds.';

  @override
  String get audioNoiseDoseLevelCardTitle => 'Measured Level';

  @override
  String get audioNoiseDoseLevelLabel => 'Sound Level';

  @override
  String get audioNoiseDoseAllowedTimeTitle => 'Allowed Time Before Dose';

  @override
  String get audioNoiseDoseVaiLabel => 'Lower Action Value';

  @override
  String get audioNoiseDoseVasLabel => 'Upper Action Value';

  @override
  String get audioNoiseDoseVleLabel => 'Exposure Limit Value';

  @override
  String get audioNoiseDoseUnlimited => '≥ 8 h (no risk over a day)';

  @override
  String get audioNoiseDoseTableTitle => 'Reference — allowed time by level';

  @override
  String get audioNoiseDoseTableLevelHeader => 'Level';

  @override
  String get audioNoiseDoseTableTimeHeader => 'Allowed time (ELV 87 dB)';

  @override
  String get audioNoiseDoseVenueTitle => 'Venue Thresholds (FR Show Decree)';

  @override
  String get audioNoiseDoseVenueText =>
      'French decree 2017-1244 caps the average level (LAeq over 15 min) at 102 dB(A) (occasional venue) or 105 dB(A) (regular venue), with a peak level ≤ 118 or 120 dB(C). These apply continuously to the audience via a limiter — separate from the occupational exposure calculated above.';

  @override
  String get audioNoiseDoseDisclaimer =>
      'Indicative tool based on the 3 dB exchange rate (French labour code, art. R.4431-2). Not a substitute for a certified sound level meter or dosimeter, nor for an on-site regulatory measurement.';

  @override
  String get audioSectionOrganization => 'Organization';

  @override
  String get audioInputListTitle => 'Input List';

  @override
  String get audioInputListIntro =>
      'Build your mic/DI input list for soundcheck or the patch sheet. Row order sets the channel number — drag to reorder.';

  @override
  String get audioInputListEmpty =>
      'No entries yet. Add the first line of your input list.';

  @override
  String get audioInputListAddButton => 'Add Entry';

  @override
  String audioInputListChannel(Object n) {
    return 'Channel $n';
  }

  @override
  String get audioInputListNameLabel => 'Source';

  @override
  String get audioInputListPositionLabel => 'Position';

  @override
  String get audioInputListNotesLabel => 'Notes';

  @override
  String get audioInputListTypeMic => 'Mic';

  @override
  String get audioInputListTypeDi => 'DI';

  @override
  String get audioInputListTypeLine => 'Line';

  @override
  String get audioInputListTypeWireless => 'Wireless';

  @override
  String get audioInputListTypeOther => 'Other';

  @override
  String get audioInputListCopyAction => 'Copy List';

  @override
  String get audioInputListCopiedSnackbar => 'List copied to clipboard';

  @override
  String get audioInputListClearAction => 'Clear All';

  @override
  String get audioInputListClearConfirmTitle => 'Clear the whole list?';

  @override
  String get audioInputListClearConfirmBody =>
      'This removes every entry from the input list. This cannot be undone.';

  @override
  String get pluginCommunity => 'Plugin Community';

  @override
  String get pluginCommunitySubtitle =>
      'Share and discover grandMA3 plugins created by the community';

  @override
  String get pluginCommunitySubtitleAuth =>
      'Share and discover plugins\ncreated by the grandMA3 community.';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get authChoosePseudo => 'Choose your nickname';

  @override
  String get authPseudoHint => 'Your nickname in the community';

  @override
  String get confirm => 'Confirm';

  @override
  String get loginCancelled => 'Login cancelled.';

  @override
  String get anonymous => 'Anonymous';

  @override
  String get share => 'Share';

  @override
  String get searchPluginHint => 'Search for a plugin…';

  @override
  String get allPluginsFilter => '⭐ All';

  @override
  String get loginRequiredLike => 'Sign in to like 👋';

  @override
  String get noPluginsYet => 'No plugins here yet.';

  @override
  String get beFirstToShare => 'Be the first to share!';

  @override
  String get signOut => 'Sign out';

  @override
  String get luaCode => 'Lua Code';

  @override
  String get copied => 'Copied!';

  @override
  String get copyCode => 'Copy code';

  @override
  String get pluginPublished => '🚀 Plugin published!';

  @override
  String get sharePlugin => 'Share a plugin';

  @override
  String get pluginTitle => 'Plugin title';

  @override
  String get pluginTitleHint => 'e.g. RGB color batch — 30 presets';

  @override
  String get pluginTitleRequired => 'Title required';

  @override
  String get category => 'Category';

  @override
  String get optionalDescription => 'Description (optional)';

  @override
  String get pluginDescriptionHint =>
      'What the plugin does, what it asks the user...';

  @override
  String get codeRequired => 'Code required';

  @override
  String get codeMustContainReturnMain =>
      'The code must contain \"return main\"';

  @override
  String get pluginTestedWarning =>
      'Make sure the plugin has been tested in MA3 before sharing it.';

  @override
  String get attachFiles => 'Attach files';

  @override
  String get addFiles => 'Add files (.lua, .xml…)';

  @override
  String filesSelected(Object count) {
    return '$count file(s) selected';
  }

  @override
  String get codeOptional => 'Paste the code (optional)';

  @override
  String get codeOrFileRequired => 'Add at least one file or paste the code';

  @override
  String get downloadFile => 'Download';

  @override
  String get pluginFiles => 'Files';

  @override
  String get uploadingFiles => 'Uploading files…';

  @override
  String get publishPlugin => 'Publish plugin';

  @override
  String get free => 'FREE';

  @override
  String get pro => 'PRO';

  @override
  String get console => 'Console';

  @override
  String pluginError(Object error) {
    return 'Error: $error';
  }

  @override
  String get pluginCategory_all => 'All';

  @override
  String get pluginCategory_color => 'Color';

  @override
  String get pluginCategory_movement => 'Movement';

  @override
  String get pluginCategory_effect => 'Effects';

  @override
  String get pluginCategory_dimmer => 'Intensity';

  @override
  String get pluginCategory_layout => 'Layout';

  @override
  String get pluginCategory_select => 'Selection';

  @override
  String get pluginCategory_macro => 'Macro';

  @override
  String get pluginCategory_utility => 'Utility';

  @override
  String get pluginCategory_custom => 'Custom';

  @override
  String get ma3AppTitlePrefix => 'MA3 Plugin';

  @override
  String get ma3AppTitleAccent => 'Wrought';

  @override
  String get ma3New => '↺ New';

  @override
  String get ma3StepCategory => 'Category';

  @override
  String get ma3StepSettings => 'Settings';

  @override
  String get ma3StepGeneratedCode => 'Generated code';

  @override
  String get ma3ChoosePluginType => 'What type of plugin?';

  @override
  String get ma3ChooseCategorySubtitle => 'Choose a category to start';

  @override
  String get ma3Continue => 'Continue →';

  @override
  String get ma3PluginName => 'Plugin name';

  @override
  String get ma3PluginNameHint => 'My MA3 Plugin';

  @override
  String get ma3PluginSettings => 'Plugin settings';

  @override
  String get ma3AdditionalDetails => '💬 Additional details (optional)';

  @override
  String get ma3AdditionalDetailsHint =>
      'Add details, special cases, constraints...';

  @override
  String get ma3Back => '← Back';

  @override
  String get ma3GeneratePlugin => '⚡ Generate Plugin';

  @override
  String get ma3GeneratedReady => 'Plugin generated — ready to paste into MA3';

  @override
  String get ma3InstallInMa3 => 'Install in MA3: ';

  @override
  String get ma3Menu => 'Menu';

  @override
  String get ma3Plugin => 'Plugin';

  @override
  String get ma3NewPlugin => 'New Plugin';

  @override
  String get ma3PasteSaveAs => ' → paste → save as ';

  @override
  String get ma3Run => 'Run';

  @override
  String get ma3Copied => '✓ Copied!';

  @override
  String get ma3Copy => '⎘ Copy';

  @override
  String get ma3Edit => '← Edit';

  @override
  String get ma3Regenerate => '↺ Regenerate';

  @override
  String get ma3NewPluginButton => '+ New plugin';

  @override
  String get ma3Choose => '— Choose —';

  @override
  String get ma3Add => 'Add...';

  @override
  String get ma3GeneratedPluginFallback => 'Plugin';

  @override
  String get ma3CategoryColor => 'Color';

  @override
  String get ma3CategoryColorDesc => 'RGB layout, palette, color presets';

  @override
  String get ma3CategoryMovement => 'Movement';

  @override
  String get ma3CategoryMovementDesc => 'Pan/Tilt, circle, figure 8, positions';

  @override
  String get ma3CategoryEffect => 'Effects';

  @override
  String get ma3CategoryEffectDesc => 'Strobe, pulse, chase, sequences';

  @override
  String get ma3CategoryDimmer => 'Intensity';

  @override
  String get ma3CategoryDimmerDesc => 'Dimmer, bump, fade, blackout';

  @override
  String get ma3CategoryLayout => 'Layout';

  @override
  String get ma3CategoryLayoutDesc => 'Create/organize MA3 layouts';

  @override
  String get ma3CategorySelect => 'Selection';

  @override
  String get ma3CategorySelectDesc => 'Select groups, fixtures, filters';

  @override
  String get ma3CategoryMacro => 'Macro';

  @override
  String get ma3CategoryMacroDesc => 'Multi-step macros, console sequences';

  @override
  String get ma3CategoryUtility => 'Utility';

  @override
  String get ma3CategoryUtilityDesc => 'Label, store, organize the show file';

  @override
  String get ma3CategoryCustom => 'Custom';

  @override
  String get ma3CategoryCustomDesc => 'Freely describe what you want';

  @override
  String get ma3FieldColorSpace => 'Fixture color space';

  @override
  String get ma3FieldColors => 'Colors to offer as presets';

  @override
  String get ma3FieldGroupSelect => 'The plugin asks for the group at launch';

  @override
  String get ma3YesViaMa3Dialog => 'Yes — through an MA3 dialog';

  @override
  String get ma3NoUseCurrentSelection => 'No — use the current selection';

  @override
  String get ma3FieldMovementType => 'Movement type to create';

  @override
  String get ma3MovePresetPositions =>
      'Position presets (stage, front, sides...)';

  @override
  String get ma3MoveCircle => 'Effect Engine — Circle';

  @override
  String get ma3MoveFigure8 => 'Effect Engine—Figure 8';

  @override
  String get ma3MovePanSweep => 'Effect Engine — Pan sweep';

  @override
  String get ma3MoveTiltSweep => 'Effect Engine — Tilt sweep';

  @override
  String get ma3MoveRandom => 'Effect Engine — Random';

  @override
  String get ma3FieldSpeedSourceEffects => 'Speed source (for effects)';

  @override
  String get ma3SpeedBpmConsole => 'BPM — value entered in the console';

  @override
  String get ma3SpeedExecutorConsole =>
      'Speed executor — number entered in the console';

  @override
  String get ma3SpeedBothConsole => 'Both — choice offered in the console';

  @override
  String get ma3FieldEffectType => 'Effect type to create';

  @override
  String get ma3FieldOutput => 'What the plugin creates';

  @override
  String get ma3OutputEffectPresets => 'Effect presets';

  @override
  String get ma3OutputChaseSequence => 'Chase sequence';

  @override
  String get ma3OutputTriggerMacro => 'Trigger macro';

  @override
  String get ma3FieldSpeedSource => 'Speed source';

  @override
  String get ma3FieldFeatures => 'Features to include';

  @override
  String get ma3OutputIntensityMacros => 'Intensity macros';

  @override
  String get ma3OutputIntensityPresets => 'Intensity presets';

  @override
  String get ma3FieldLayoutSections => 'Sections to include in the layout';

  @override
  String get ma3SectionColors => 'Colors';

  @override
  String get ma3SectionGroups => 'Groups';

  @override
  String get ma3SectionPresets => 'Presets';

  @override
  String get ma3FieldVisualStyle => 'Visual style';

  @override
  String get ma3FieldGroupNameNumber =>
      'The plugin asks for the name/number at launch';

  @override
  String get ma3NoHardcodedGenericName => 'No — hardcoded generic name';

  @override
  String get ma3FieldSelectionCriteria => 'Selection criteria to offer';

  @override
  String get ma3CriteriaEvenOdd => 'Even/Odd';

  @override
  String get ma3CriteriaThirds => '1/3 — 2/3 — 3/3';

  @override
  String get ma3CriteriaPosition => 'By position (front/middle/back)';

  @override
  String get ma3CriteriaAll => 'All';

  @override
  String get ma3CriteriaFirstLast => 'First/Last';

  @override
  String get ma3OutputSelectionMacros => 'Selection macros';

  @override
  String get ma3OutputGroupButtonsLayout => 'Group buttons in a layout';

  @override
  String get ma3FieldMacroSteps => 'Describe the macro steps';

  @override
  String get ma3MacroStepsHint =>
      'e.g.\n1. Select a group (dialog)\n2. Blackout\n3. Wait 1s\n4. Fade In 3s';

  @override
  String get ma3FieldTrigger => 'Trigger';

  @override
  String get ma3TriggerManual => 'Manual';

  @override
  String get ma3FieldTask => 'Task to perform';

  @override
  String get ma3TaskNameFixtures => 'Name patch fixtures';

  @override
  String get ma3TaskCreateGroups => 'Create groups automatically';

  @override
  String get ma3TaskStorePresets => 'Store all presets';

  @override
  String get ma3TaskCleanEmptyObjects => 'Clean empty objects';

  @override
  String get ma3TaskCloneLayout => 'Clone a layout';

  @override
  String get ma3TaskShowReport => 'Show report (fixtures, groups, presets)';

  @override
  String get ma3FieldConfirmEachAction => 'Confirm before each action';

  @override
  String get ma3Yes => 'Yes';

  @override
  String get ma3No => 'No';

  @override
  String get ma3FieldCustomDescription =>
      'Describe what the plugin should do in MA3';

  @override
  String get ma3ColorRed => 'Red';

  @override
  String get ma3ColorGreen => 'Green';

  @override
  String get ma3ColorBlue => 'Blue';

  @override
  String get ma3ColorYellow => 'Yellow';

  @override
  String get ma3ColorOrange => 'Orange';

  @override
  String get ma3ColorPink => 'Pink';

  @override
  String get ma3ColorColdWhite => 'Cold white';

  @override
  String get ma3ColorWarmWhite => 'Warm white';

  @override
  String get ma3EffectStrobe => 'Strobe';

  @override
  String get ma3EffectPulse => 'Pulse';

  @override
  String get ma3EffectChase => 'Chase';

  @override
  String get ma3EffectTwinkle => 'Twinkle';

  @override
  String get ma3EffectFire => 'Fire';

  @override
  String get ma3EffectSawtooth => 'Sawtooth';

  @override
  String get ma3EffectRandom => 'Random';

  @override
  String get ma3Blackout => 'Blackout';

  @override
  String get ma3Full => 'Full';

  @override
  String get ma3Bump => 'Bump';

  @override
  String get ma3FadeIn => 'Fade In';

  @override
  String get ma3FadeOut => 'Fade Out';

  @override
  String get ma3DimmerChase => 'Dimmer Chase';

  @override
  String get ma3Compact => 'Compact';

  @override
  String get ma3Large => 'Wide';

  @override
  String get ma3Tablet => 'Tablet';

  @override
  String get ma3Wing => 'wing';

  @override
  String get ma3Random => 'Random';

  @override
  String get ma3FirstLast => 'First/Last';

  @override
  String ma3Error(Object error) {
    return 'Error: $error';
  }

  @override
  String get ma3Text_RGB => 'RGB';

  @override
  String get ma3Text_CMY => 'CMY';

  @override
  String get ma3Text_HSI => 'HSI';

  @override
  String get ma3Text_RGBW => 'RGBW';

  @override
  String get ma3Text_RGBWW => 'RGBWW';

  @override
  String get ma3Text_RGBA => 'RGBA';

  @override
  String get ma3Text_RGBL => 'RGBL';

  @override
  String get ma3Text_RGBWA => 'RGBWA';

  @override
  String get ma3Text_RGBUV => 'RGBUV';

  @override
  String get ma3Text_Gel_Color => 'Gel Color';

  @override
  String get ma3Text_Cyan => 'Cyan';

  @override
  String get ma3Text_Magenta => 'Magenta';

  @override
  String get ma3Text_Lime => 'Lime';

  @override
  String get ma3Text_UV => 'UV';

  @override
  String get ma3Text_OFF => 'OFF';

  @override
  String get ma3Text_50 => '50%';

  @override
  String get ma3Text_25 => '25%';

  @override
  String get ma3Text_GO_button => 'GO button';

  @override
  String get ma3Text_Timecode => 'Timecode';

  @override
  String get ma3Text_OSC => 'CSO';

  @override
  String get ma3Text_MIDI => 'NOON';

  @override
  String get gdtfShareAsZip => 'Share as .zip';

  @override
  String get gdtfZipShareHelp =>
      '💡 Useful if Gmail or your email provider blocks .gdtf files — rename the file back to .gdtf after receiving it.';

  @override
  String get rfAntennaTitle => 'Antenna Calculator';

  @override
  String get rfSplitterTitle => 'Splitter / Combiner Loss';

  @override
  String get rfCableAntennaTitle => 'RF Cable & Antennas';

  @override
  String get rfCableLossSectionTitle => 'Coaxial Cable Loss';

  @override
  String get rfCableLossCableTypeLabel => 'Cable type';

  @override
  String get rfCableAntennaFrequencyLabel => 'Frequency';

  @override
  String get rfCableLossLengthLabel => 'Cable length';

  @override
  String get rfCableAntennaEmptyState => 'Enter values to see the result.';

  @override
  String get rfCableLossResultLabel => 'Total loss';

  @override
  String get rfCableLossFormulaNote =>
      'Attenuation ≈ k1·√f + k2·f (dB/100 m) — empirical model per cable type, typically within ±5% between 100 MHz and 2.5 GHz. Indicative values: refer to the cable\'s datasheet for a critical link budget.';

  @override
  String get rfDiversitySectionTitle => 'Diversity Antenna Spacing (λ/4)';

  @override
  String get rfDiversityResultLabel => 'Recommended spacing';

  @override
  String get rfDiversityFormulaNote =>
      'λ/4 = 75 / f(MHz) meters — minimum recommended spacing between two diversity antennas to limit multipath fading.';

  @override
  String get rfPlannerTitle => 'HF Frequency Planner';

  @override
  String get rfPlannerBandLabel => 'Frequency band';

  @override
  String get rfPlannerCustomBand => 'Custom';

  @override
  String get rfPlannerMinFreqLabel => 'Min frequency';

  @override
  String get rfPlannerMaxFreqLabel => 'Max frequency';

  @override
  String get rfPlannerChannelCountLabel => 'Desired number of channels';

  @override
  String get rfPlannerMinSpacingLabel => 'Minimum spacing between channels';

  @override
  String get rfPlannerResultTitle => 'Suggested frequencies';

  @override
  String get rfPlannerFoundLabel => 'Channels found';

  @override
  String get rfPlannerNotEnoughWarning =>
      'Couldn\'t find all the requested channels in this band with this spacing — try a wider band or reduce the channel count/minimum spacing.';

  @override
  String get rfPlannerFormulaNote =>
      'Avoids 3rd-order intermodulation products (2fA−fB, fA+fB−fC) between all channels, ±200 kHz tolerance — not an absolute guarantee, verify on site with an RF scan.';

  @override
  String get rfSplitterWaysLabel => 'Number of ways';

  @override
  String get rfSplitterExcessLossLabel => 'Splitter excess loss';

  @override
  String get rfSplitterAdditionalLossLabel => 'Cable & connector losses';

  @override
  String get rfSplitterTotalTitle => 'Total insertion loss';

  @override
  String get rfSplitterTheoreticalLabel => 'Theoretical loss (10·log₁₀N)';

  @override
  String get rfSplitterReferenceTitle => 'Reference by number of ways';

  @override
  String get rfSplitterFormulaNote =>
      'Total loss ≈ theoretical loss + excess loss + cable/connector losses';

  @override
  String get rfFrequency => 'Frequency';

  @override
  String get rfVelocityFactorTitle => 'Velocity Factor (Vf)';

  @override
  String get rfAntennaLengths => 'Antenna Lengths';

  @override
  String get rfEnterFrequencyToCalculate => 'Enter a frequency to calculate';

  @override
  String get rfFullWave => 'Full Wave (λ)';

  @override
  String get rfHalfWave => 'Half Wave (λ/2)';

  @override
  String get rfStandardDipole => 'Standard dipole';

  @override
  String get rfQuarterWave => 'Quarter Wave (λ/4)';

  @override
  String get rfWhipAntenna => 'Whip antenna — most common';

  @override
  String get rfFiveEighthWave => '5/8 Wave (5λ/8)';

  @override
  String get rfFiveEighthWaveDescription => '+3 dB gain vs λ/4';

  @override
  String get rfReferenceFrequencies => 'Reference Frequencies';

  @override
  String get rfFmRadio => 'FM Radio (88MHz)';

  @override
  String get rfVhfLow => 'VHF Low (174 MHz)';

  @override
  String get rfUhf470 => 'UHF 470MHz';

  @override
  String get rfUhf600 => 'UHF 600MHz';

  @override
  String get rfUhf694 => 'UHF 694 MHz (FR limit)';

  @override
  String get rfIsm863 => 'ISM 863MHz';

  @override
  String get rfWifi24 => '2.4GHz WiFi';

  @override
  String get rfWifi5 => 'WiFi 5 GHz (center)';

  @override
  String get rfFormulaExplanation =>
      'λ = c / f × Vf    |    c = 299.792 m/µs\nVf = cable velocity factor (1.00 for free space)';

  @override
  String get rfPresetFreeSpace => 'Free space';

  @override
  String get rfCoexTitle => '2.4 GHz Coexistence';

  @override
  String get rfCoexBandOccupancyTitle => 'Who occupies the 2.4 GHz band?';

  @override
  String get rfCoexAvProtocolsTitle => '⚡ AV protocols on 2.4 GHz';

  @override
  String get rfCoexAllProtocolsTitle => 'All protocols';

  @override
  String get rfCoexFrequentConflictsTitle =>
      'Frequent conflicts in live events';

  @override
  String get rfCoexFieldRecommendationsTitle => 'Field recommendations';

  @override
  String get rfCoexProtocolWifi24Name => '2.4GHz WiFi';

  @override
  String get rfCoexProtocolWifi24Note =>
      'Fixed channels, wide band. High transmit power.';

  @override
  String get rfCoexProtocolBluetoothClassicName => 'Bluetooth Classic';

  @override
  String get rfCoexProtocolBluetoothClassicNote =>
      'Hops between 1600 frequencies/s. Coexists with WiFi via AFH.';

  @override
  String get rfCoexProtocolBluetoothLeName => 'Bluetooth LE';

  @override
  String get rfCoexProtocolBluetoothLeNote =>
      'Channels 37, 38, 39 = advertising channels (fixed). Risk with WiFi ch1.';

  @override
  String get rfCoexProtocolZigbeeName => 'Zigbee (IEEE 802.15.4)';

  @override
  String get rfCoexProtocolZigbeeNote =>
      'Channels 11–26, each 2 MHz wide. Compatible with WiFi ch1/6/11.';

  @override
  String get rfCoexProtocolDigitalMics24Name => '2.4 GHz digital mics';

  @override
  String get rfCoexProtocolDigitalMics24Note =>
      'Shure GLX-D, Line6 XD-V, Sennheiser EW-D 2.4 GHz. Very sensitive to WiFi interference.';

  @override
  String get rfCoexProtocolWirelessDmxName => 'Wireless DMX / RDM';

  @override
  String get rfCoexProtocolWirelessDmxNote =>
      'Lumen Radio CRMX, W-DMX, City Theatrical. FHSS = robust, but it shares the band.';

  @override
  String get rfCoexProtocolWirelessVideoName => 'Wireless video';

  @override
  String get rfCoexProtocolWirelessVideoNote =>
      'Hollyland Mars, DJI O3, Teradek Bolt 4K. Very wide band, major conflicts possible.';

  @override
  String get rfCoexTypeDsssOfdm => 'DSSS/OFDM';

  @override
  String get rfCoexTypeFhss79 => 'FHSS 79 channels';

  @override
  String get rfCoexTypeFhss40 => 'FHSS 40 channels';

  @override
  String get rfCoexTypeDsss16 => 'DSSS 16 channels';

  @override
  String get rfCoexTypeFhssDsss => 'FHSS/DSSS';

  @override
  String get rfCoexTypeFhss => 'FHSS';

  @override
  String get rfCoexTypeOfdm => 'OFDM';

  @override
  String get rfCoexConflictWifiCh6 => 'Wi-Fi ch6';

  @override
  String get rfCoexConflictMic24 => '2.4 GHz mic';

  @override
  String get rfCoexConflictBleAdvertising => 'BLE advertising';

  @override
  String get rfCoexConflictWifiCh1 => 'WiFi ch1';

  @override
  String get rfCoexConflictWirelessVideo => 'Wireless video';

  @override
  String get rfCoexConflictEverythingElse => 'Everything else';

  @override
  String get rfCoexConflictZigbeeCh11 => 'Zigbee ch11';

  @override
  String get rfCoexRiskHigh => 'HIGH';

  @override
  String get rfCoexRiskMedium => 'MEDIUM';

  @override
  String get rfCoexConflictWifiCh6Mic24Desc =>
      'WiFi ch6 directly overlaps the preferred frequencies of digital microphones.';

  @override
  String get rfCoexConflictBleWifiCh1Desc =>
      'BLE channels 37/38/39 are located at 2402, 2426 and 2480 MHz.';

  @override
  String get rfCoexConflictVideoEverythingDesc =>
      'Wireless video links use a wide band and can easily saturate the band.';

  @override
  String get rfCoexConflictZigbeeWifiCh1Desc =>
      'Zigbee channel 11 (2405 MHz) sits directly inside WiFi channel 1.';

  @override
  String get rfCoexTipWifiChannels =>
      'Reserve WiFi for channels 1 and/or 11. Avoid channel 6 if you use 2.4 GHz microphones.';

  @override
  String get rfCoexTipUhfMics =>
      'For wireless mics in dense areas, prefer UHF systems (470–694 MHz) over 2.4 GHz systems.';

  @override
  String get rfCoexTipWirelessVideo5Ghz =>
      'Wireless video links: use the 5 GHz band whenever possible.';

  @override
  String get rfCoexTipWirelessDmxFhss =>
      'Wireless DMX FHSS is the most robust — it automatically hops away from occupied frequencies.';

  @override
  String get rfCoexTipSpectrumScan =>
      'Scan the spectrum before the event with an RF app (WiFi Analyzer, Chanalyzer, etc.).';

  @override
  String get rfPageTitle => 'RF & Wireless';

  @override
  String get rfSectionMicrosHf => 'HF Mics & Antennas';

  @override
  String get rfSectionCalcHf => 'HF Calculations';

  @override
  String get rfSectionWifi => 'Wi-Fi';

  @override
  String get rfSectionCoexistence => 'Coexistence';

  @override
  String get rfSectionScanTerrain => 'Scan & Field';

  @override
  String get rfFreeLabel => 'FREE';

  @override
  String get rfToolUhfBandsTitle => 'UHF / VHF Bands';

  @override
  String get rfToolUhfBandsSubtitle =>
      'Legal bands in France (ANFR), UHF 470–694 MHz, digital dividend, DECT, ISM 863 MHz.';

  @override
  String get rfToolAntennaTitle => 'Antenna Calculator';

  @override
  String get rfToolAntennaSubtitle =>
      'Frequency → λ/4, λ/2, 5λ/8. Velocity factor for coaxial cables. UHF/WiFi references.';

  @override
  String get rfToolIm3Title => 'IM3 Intermodulation';

  @override
  String get rfToolIm3Subtitle =>
      'Calculates 2Fi−Fj for 2 to 16 frequencies. Detects products falling on your channels.';

  @override
  String get rfToolWifi24Title => 'WiFi 2.4 GHz Channels';

  @override
  String get rfToolWifi24Subtitle =>
      '13 channels, visual overlaps, conflict simulator. Non-overlapping channels 1, 6, 11.';

  @override
  String get rfToolWifi5Title => 'WiFi 5 GHz Channels';

  @override
  String get rfToolWifi5Subtitle =>
      'UNII-1/2A/2C bands, DFS, channels available in France. Non-overlapping at 80 MHz.';

  @override
  String get rfToolCoexTitle => '2.4 GHz Coexistence';

  @override
  String get rfToolCoexSubtitle =>
      'Who shares the band: WiFi, Bluetooth, Zigbee, digital mics, wireless DMX, video. Typical conflicts.';

  @override
  String get rfToolScanWifiTitle => 'WiFi Scan';

  @override
  String get rfToolScanWifiSubtitle =>
      'Analyzes nearby WiFi networks: channels, RSSI, 2.4/5 GHz bands. Spectrum usage visualization.';

  @override
  String get rfToolScanLogTitle => 'RF Scan Log';

  @override
  String get rfToolScanLogSubtitle =>
      'Manual frequency log: signal level, status (free/borderline/occupied), field notes.';

  @override
  String get rfIm3PageTitle => 'IM3 Intermodulation';

  @override
  String get rfIm3WhatIs => 'What is IM3?';

  @override
  String get rfIm3WhatIsBody =>
      'When two transmitters F1 and F2 enter an amplifier or receiver, they generate spurious frequencies at 2F1−F2 and 2F2−F1. These 3rd-order intermodulation products fall near the original frequencies and can block a neighboring RF channel.';

  @override
  String get rfIm3QuickMode => 'Quick mode — 2 frequencies';

  @override
  String get rfIm3AdvancedMode => 'Advanced mode — up to 16 frequencies';

  @override
  String rfIm3FrequencyN(int index) {
    return 'Frequency $index';
  }

  @override
  String get rfIm3AddFrequency => 'Add a frequency';

  @override
  String get rfIm3Tips => 'Field tips';

  @override
  String get rfIm3Tip1 =>
      'Space your frequencies irregularly. Regular intervals generate IM3 products that land exactly on your channels.';

  @override
  String get rfIm3Tip2 =>
      'Detection tolerance: ±200 kHz. Adjust based on your system bandwidth (typically 200–400 kHz).';

  @override
  String get rfIm3Tip3 =>
      'Shure Wireless Workbench, Sennheiser WSM, and Audio-Technica Frequency Manager include IM3 calculation for their product lines — use them for final deployment.';

  @override
  String get rfIm3OutOfBand => 'Out of band (< 0 MHz)';

  @override
  String get rfIm3ConflictOnFreq => '⚠ Falls on a used frequency (±200 kHz)';

  @override
  String get rfIm3TableFormula => 'Formula';

  @override
  String get rfIm3TableFreqIm3 => 'IM3 Frequency';

  @override
  String get rfIm3TableStatus => 'Status';

  @override
  String get rfIm3Footnote =>
      'IM3 = 2×Fi − Fj    |    Conflict tolerance: ±200 kHz\nNegative products (out of spectrum) are shown but not conflicting.';

  @override
  String rfIm3Conflicts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 's',
      one: '',
    );
    return '$count conflict$_temp0';
  }

  @override
  String get rfScanLogTitle => 'RF Scan Log';

  @override
  String get rfScanLogClearAll => 'Clear all';

  @override
  String get rfScanLogAdd => 'Add';

  @override
  String get rfScanLogClearConfirmTitle => 'Clear the log?';

  @override
  String get rfScanLogClearConfirmContent => 'All entries will be deleted.';

  @override
  String get rfScanLogCancel => 'Cancel';

  @override
  String get rfScanLogDelete => 'Delete';

  @override
  String get rfScanLogNewEntry => 'New entry';

  @override
  String get rfScanLogFrequency => 'Frequency';

  @override
  String get rfScanLogOptionalLevel => 'Measured level (optional)';

  @override
  String get rfScanLogNote => 'Note';

  @override
  String get rfScanLogNoteHint =>
      'e.g.: channel 36, hall B, TV interference...';

  @override
  String get rfScanLogStatusLabel => 'Status:';

  @override
  String get rfScanLogSave => 'Save';

  @override
  String get rfScanLogEmptyTitle => 'Empty log';

  @override
  String get rfScanLogEmptyBody =>
      'Record your field measurements here: frequency, level measured on the analyzer, status and comment.';

  @override
  String get rfScanLogFirstEntry => 'First entry';

  @override
  String get rfScanLogStatusFree => 'Free';

  @override
  String get rfScanLogStatusOccupied => 'Occupied';

  @override
  String get rfScanLogStatusBorderline => 'Borderline';

  @override
  String get rfScanLogInstant => 'Just now';

  @override
  String rfScanLogMinutesAgo(int n) {
    return '$n min ago';
  }

  @override
  String rfScanLogHoursAgo(int n) {
    return '$n h ago';
  }

  @override
  String get rfScanLogFreePlural => 'Free';

  @override
  String get rfScanLogOccupiedPlural => 'Occupied';

  @override
  String get rfScanLogBorderlinePlural => 'Border.';

  @override
  String get rfScanLogTotal => 'Total';

  @override
  String get rfUhfBandsTitle => 'UHF / VHF Bands';

  @override
  String get rfUhfBandsOverview => 'Overview — France';

  @override
  String get rfUhfBandsTips => 'Band selection tips';

  @override
  String get rfUhfBandsSource =>
      'Source: ANFR / ARCEP — French regulations.\nRules may vary by country.\nAlways verify your equipment\'s compliance.';

  @override
  String get rfUhfBand1Name => 'VHF Low';

  @override
  String get rfUhfBand1Status => 'Limited';

  @override
  String get rfUhfBand1Desc =>
      'Old analog TV band. A few HF systems use this range. Less common in live events.';

  @override
  String get rfUhfBand1Examples => 'Some older Sennheiser, Shure systems';

  @override
  String get rfUhfBand2Name => 'UHF — TV Block';

  @override
  String get rfUhfBand2Status => 'Pro (license required)';

  @override
  String get rfUhfBand2Desc =>
      'Main band for professional wireless mics in France. Shared with DTT. Requires ANFR authorization for commercial use. Free use for audiovisual production under conditions.';

  @override
  String get rfUhfBand2Examples =>
      'Shure Axient, Sennheiser 2000, Sony DWX, Audio-Technica 3000';

  @override
  String get rfUhfBand3Name => 'Digital dividend';

  @override
  String get rfUhfBand3Status => 'FORBIDDEN';

  @override
  String get rfUhfBand3Desc =>
      'Band allocated to 4G/5G mobile networks in France since 2017. Any wireless audio equipment in this band has been illegal since that date.';

  @override
  String get rfUhfBand4Name => 'ISM / SRD 863 MHz';

  @override
  String get rfUhfBand4Status => 'Free (10 mW)';

  @override
  String get rfUhfBand4Desc =>
      'Free band in Europe (SRD — Short Range Device). No authorization required. Power limit: 10 mW ERP, 25 kHz bandwidth.';

  @override
  String get rfUhfBand4Examples => 'Some entry-level systems, remote controls';

  @override
  String get rfUhfBand5Name => 'DECT';

  @override
  String get rfUhfBand5Status => 'Free (250 mW)';

  @override
  String get rfUhfBand5Desc =>
      'Standard dedicated to wireless voice. No interference with WiFi/Bluetooth. Used for conferencing systems, intercom and some wireless mics.';

  @override
  String get rfUhfBand5Examples =>
      'Bosch CCS-800 Ultro, Sennheiser SpeechLine, Beyerdynamic Quinta';

  @override
  String get rfUhfBand6Name => 'Digital mic 2.4 GHz';

  @override
  String get rfUhfBand6Status => 'Free (100 mW)';

  @override
  String get rfUhfBand6Desc =>
      'ISM band, free without authorization. Subject to WiFi and Bluetooth interference. Suitable for small productions, avoid large venues with dense WiFi.';

  @override
  String get rfUhfBand6Examples =>
      'Shure GLX-D, Line6 XD-V, Sennheiser EW-D (2.4G variant)';

  @override
  String get rfUhfBand7Name => 'Wireless 5.8 GHz';

  @override
  String get rfUhfBand7Status => 'Limited (FR)';

  @override
  String get rfUhfBand7Desc =>
      'Not available for WiFi in France, but some proprietary systems use this range. Check ARCEP compliance of each device.';

  @override
  String get rfUhfBand7Examples => 'Some high-end IEM systems';

  @override
  String get rfUhfOverviewSublabel1 => 'VHF / transitional';

  @override
  String get rfUhfOverviewSublabel2 => 'UHF pro (license required)';

  @override
  String get rfUhfOverviewSublabel3 => '4G/5G — FORBIDDEN';

  @override
  String get rfUhfOverviewSublabel4 => 'Free ISM';

  @override
  String get rfUhfOverviewSublabel5 => 'Free DECT';

  @override
  String get rfUhfOverviewSublabel6 => 'ISM (WiFi + digital mics)';

  @override
  String get rfUhfTip1 =>
      '470–694 MHz: optimal for pro productions. Wide frequency choice, good RF behavior. Declare usage to ANFR for professional events.';

  @override
  String get rfUhfTip2 =>
      'Make absolutely sure your equipment is outside the 694–790 MHz band. Old systems not sold post-2017 are illegal on stage.';

  @override
  String get rfUhfTip3 =>
      'DECT (1880–1900 MHz) is ideal for conference systems: dedicated band, no WiFi/BT interference.';

  @override
  String get rfUhfTip4 =>
      '2.4 GHz systems are practical but sensitive to dense WiFi environments. Avoid in large conference halls.';

  @override
  String get rfLegendPro => 'Pro (authorization)';

  @override
  String get rfLegendFree => 'Free';

  @override
  String get rfLegendForbidden => 'Forbidden';

  @override
  String get rfWifi24PageTitle => '2.4GHz WiFi';

  @override
  String get rfWifi24SpectrumTitle => '2.4 GHz spectrum — overlaps';

  @override
  String get rfWifi24SimulateTitle => 'Simulate coexistence';

  @override
  String get rfWifi24SelectChannels =>
      'Select the channels used in your environment:';

  @override
  String get rfWifi24ConflictWarning =>
      '⚠️ The selected channels overlap — risk of mutual interference.';

  @override
  String get rfWifi24ChannelTableTitle => 'Channel table';

  @override
  String get rfWifi24BestPractices => 'Best practices';

  @override
  String get rfWifi24LegendNonOverlap => 'Non-overlapping channel';

  @override
  String get rfWifi24LegendOk => 'Selected OK';

  @override
  String get rfWifi24LegendConflict => 'Conflict';

  @override
  String get rfWifi24HdrChannel => 'Channel';

  @override
  String get rfWifi24HdrCenter => 'Center';

  @override
  String get rfWifi24HdrStart => 'Start';

  @override
  String get rfWifi24HdrEnd => 'End';

  @override
  String get rfWifi24Tip1 =>
      'Always use channels 1, 6 and 11 for 3 non-overlapping WiFi networks.';

  @override
  String get rfWifi24Tip2 =>
      'With 20 MHz channels, channels 1, 5, 9 and 13 are also non-overlapping.';

  @override
  String get rfWifi24Tip3 =>
      'WiFi 2.4 GHz shares the band with Bluetooth, Zigbee and 2.4 GHz digital microphones.';

  @override
  String get rfWifi24Tip4 =>
      'In dense areas, prefer 5 GHz (less congested) for sensitive equipment.';

  @override
  String get rfWifi5PageTitle => '5GHz WiFi';

  @override
  String get rfWifi5RegulationTitle => 'France regulations (ARCEP)';

  @override
  String get rfWifi5BandsAvailable => 'Available bands';

  @override
  String get rfWifi5Unii3Forbidden => 'UNII-3 (5725–5850)';

  @override
  String get rfWifi5ForbiddenLabel => 'Forbidden';

  @override
  String get rfWifi5DfsNote =>
      '⚠️ DFS (Dynamic Frequency Selection): UNII-2A and 2C channels require radar detection. Equipment may automatically change channel if radar is detected.';

  @override
  String get rfWifi5ChannelWidthsTitle => 'Channel widths';

  @override
  String get rfWifi5Bw20 => 'Max compatibility, limited throughput';

  @override
  String get rfWifi5Bw40 => '2 bonded channels — 802.11n';

  @override
  String get rfWifi5Bw80 => '4 bonded channels — 802.11ac/ax';

  @override
  String get rfWifi5Bw160 => '8 bonded channels — 802.11ax only';

  @override
  String get rfWifi5NonOverlapTitle =>
      'Non-overlapping channels at 80 MHz (France)';

  @override
  String get rfWifi5NonOverlapFor3 =>
      'For 3 non-overlapping 80 MHz networks (France):';

  @override
  String get rfWifi5MaxNetworks =>
      '→ Up to 6 x 80 MHz networks available on UNII-2C alone.';

  @override
  String get rfWifi5ChannelsMhz => 'Channels (20 MHz)';

  @override
  String get rfWifi5ForbiddenFR => 'Forbidden FR';

  @override
  String get rfWifi5Indoor => 'Indoor';

  @override
  String get rfWifiScanTitle => 'WiFi Scan';

  @override
  String get rfWifiScanPlatformInfo =>
      'Active scan on Android (location permission required). On iOS, only the connected network is visible.';

  @override
  String get rfWifiScanStart => 'Start scan';

  @override
  String get rfWifiScanInProgress => 'Scanning…';

  @override
  String get rfWifiScanGroupedTooltip => 'List view';

  @override
  String get rfWifiScanFlatTooltip => 'Grouped view';

  @override
  String get rfWifiScanNoResults => 'Start the scan to see nearby networks.';

  @override
  String get rfWifiScanOccupation => '2.4 GHz channel occupation';

  @override
  String get rfWifiScanNonOverlapNote =>
      'Bold channels (1, 6, 11) = non-overlapping';

  @override
  String get rfWifiScanHidden => '(hidden network)';

  @override
  String rfWifiScanNetworks24(int count) {
    return '$count networks';
  }

  @override
  String rfWifiScanNetworks5(int count) {
    return '$count networks';
  }

  @override
  String rfWifiScanTotal(int count) {
    return '$count total';
  }

  @override
  String get rfWifiScanSub24 => '2.4GHz';

  @override
  String get rfWifiScanSub5 => '5GHz';

  @override
  String get rfWifiScanSubTotal => 'networks';

  @override
  String get rfWifiRssiExcellent => 'Excellent';

  @override
  String get rfWifiRssiBon => 'Good';

  @override
  String get rfWifiRssiMoyen => 'Fair';

  @override
  String get rfWifiRssiFaible => 'Weak';

  @override
  String get audioLevelInputDbu => 'Value in dBu';

  @override
  String get audioLevelInputDbv => 'Value in dBV';

  @override
  String get audioLevelInputVrms => 'RMS Voltage';

  @override
  String get audioLevelDbfsNote =>
      '* dBFS relative to +24 dBu = 0 dBFS (typical value — varies by system)';

  @override
  String get audioGainStagingTip1 =>
      'Aim for +4 dBu nominal at each stage. Keep ~18 dB of headroom before clip.';

  @override
  String get audioGainStagingTip2 =>
      'The consumer/pro difference (+4 dBu vs −10 dBV) is ~11.8 dB — compensate gain at each interface.';

  @override
  String get audioGainStagingTip3 =>
      'Balanced line (XLR): +4 dBu. Unbalanced line (Jack TS): −10 dBV. DI box to match impedance and level.';

  @override
  String get audioGainStagingTip4 =>
      'dBu = dB referenced to 0.775 V (600 Ω). dBV = dB referenced to 1 V. dBV = dBu − 2.218.';

  @override
  String get audioDiffTipEqual =>
      'Near-equal sources: gain of ~+3 dB over the stronger.';

  @override
  String audioDiffTipSmall(String diff) {
    return 'Difference of $diff dB: the weaker contributes little.';
  }

  @override
  String audioDiffTipMedium(String diff, String gain) {
    return 'Difference of $diff dB: gain limited to ~$gain dB over the dominant source.';
  }

  @override
  String get audioDiffTipLarge =>
      'Difference > 10 dB: the weak source is negligible. Gain ≈ +0 dB.';

  @override
  String get audioIncoherentShortLabel => 'Incoh.: ';

  @override
  String get audioCoherentShortLabel => 'Coher.: ';

  @override
  String audioAtDistance(String dist) {
    return 'At $dist m';
  }

  @override
  String get rfWifiScanErrLocationRequired =>
      'Location permission required for WiFi scan.';

  @override
  String get rfWifiScanErrLocationDenied =>
      'Location permission denied. Enable it in settings.';

  @override
  String get rfWifiScanErrLocationDisabled =>
      'Location service disabled. Enable it on the device.';

  @override
  String get rfWifiScanErrNotSupported =>
      'WiFi scan not supported on this device or OS version.';

  @override
  String get rfWifiScanErrFailed => 'Unable to start scan.';

  @override
  String get rfWifiScanErrDefault => 'Scan not possible on this device.';

  @override
  String get rfWifiScanErrReadResults => 'Unable to read scan results.';

  @override
  String rfWifiScanErrGeneric(String error) {
    return 'Error during scan: $error';
  }

  @override
  String get homeNetworkTitle => 'Network';

  @override
  String get homeNetworkSubtitle =>
      'Local network scan, Art-Net, sACN / E1.31.';

  @override
  String get networkPageTitle => 'Network';

  @override
  String get networkScanCardTitle => 'Network Scan';

  @override
  String get networkScanCardSubtitle =>
      'Detect active devices on the local network.';

  @override
  String get networkArtNetCardTitle => 'Art-Net Viewer';

  @override
  String get networkArtNetAddressingTitle => 'Art-Net Addressing';

  @override
  String get networkArtNetToPortTitle =>
      'Net / Sub-Net / Universe → Port-Address';

  @override
  String get networkArtNetFromPortTitle =>
      'Port-Address → Net / Sub-Net / Universe';

  @override
  String get networkArtNetNetLabel => 'Net';

  @override
  String get networkArtNetSubNetLabel => 'Sub-Net';

  @override
  String get networkArtNetUniverseLabel => 'Universe';

  @override
  String get networkArtNetPortAddressLabel => 'Port-Address';

  @override
  String get networkArtNetEmptyState => 'Enter valid values to see the result.';

  @override
  String get networkArtNetFormulaNote =>
      'Port-Address (15-bit) = (Net << 8) | (Sub-Net << 4) | Universe — Net 0-127, Sub-Net 0-15, Universe 0-15, Port-Address 0-32767 (Art-Net 4 spec).';

  @override
  String get networkArtNetCardSubtitle =>
      'Listen and analyze ArtDMX packets in real time.';

  @override
  String get networkSacnCardTitle => 'sACN / E1.31 Viewer';

  @override
  String get networkSacnCardSubtitle =>
      'Listen and analyze sACN / E1.31 packets in real time.';

  @override
  String get networkComingSoon => 'Coming soon';

  @override
  String get networkFutureLuminex => 'Luminex monitoring';

  @override
  String get networkFutureMaNet => 'MA-Net detection';

  @override
  String get networkFutureAlarms => 'Network alarms';

  @override
  String get networkFutureSnapshots => 'Network snapshots';

  @override
  String get networkFutureExport => 'PDF / CSV export';

  @override
  String get networkScanTitle => 'Network Scan';

  @override
  String get networkPoeTitle => 'PoE Calculator';

  @override
  String get networkFiberTitle => 'Fiber Link Budget';

  @override
  String get networkSubnetTitle => 'Subnet Calculator';

  @override
  String get networkSubnetIpLabel => 'IP Address';

  @override
  String get networkSubnetPrefixLabel => 'Prefix (CIDR)';

  @override
  String get networkSubnetNetworkLabel => 'Network address';

  @override
  String get networkSubnetBroadcastLabel => 'Broadcast address';

  @override
  String get networkSubnetNetmaskLabel => 'Subnet mask';

  @override
  String get networkSubnetWildcardLabel => 'Wildcard mask';

  @override
  String get networkSubnetFirstHostLabel => 'First usable IP';

  @override
  String get networkSubnetLastHostLabel => 'Last usable IP';

  @override
  String get networkSubnetHostCountLabel => 'Usable hosts';

  @override
  String get networkSubnetInvalidIp =>
      'Invalid IP address (expected format: 192.168.1.0)';

  @override
  String get networkSubnetDivideTitle => 'Split into equal subnets';

  @override
  String get networkSubnetDivideNote =>
      'Choose how many subnets to split this network into.';

  @override
  String get networkFiberTypeLabel => 'Fiber type';

  @override
  String get networkFiberDistanceLabel => 'Distance';

  @override
  String get networkFiberAttenuationLabel => 'Attenuation (per km)';

  @override
  String get networkFiberAdditionalLossLabel => 'Connector & splice losses';

  @override
  String get networkFiberBudgetLabel => 'Transceiver link budget (optional)';

  @override
  String get networkFiberTotalTitle => 'Total link loss';

  @override
  String get networkFiberMarginLabel => 'Remaining margin';

  @override
  String get networkFiberWarningOver =>
      'Margin exceeded: the link may not work reliably over this distance.';

  @override
  String get networkFiberFormulaNote =>
      'Total loss = attenuation × distance + connector/splice losses';

  @override
  String get networkPoeBudgetLabel => 'Injector / switch budget';

  @override
  String get networkPoeDeviceLabel => 'Device';

  @override
  String get networkPoeClassLabel => 'PoE class';

  @override
  String get networkPoeClassManual => 'Manual (custom value)';

  @override
  String get networkPoeClassWord => 'Class';

  @override
  String get networkPoeDevicePowerLabel => 'Power';

  @override
  String get networkPoeAddDevice => 'Add a device';

  @override
  String get networkPoeTotalTitle => 'Total consumption';

  @override
  String get networkPoeRemainingLabel => 'Remaining budget';

  @override
  String get networkPoeEmptyState => 'Add at least one device to calculate.';

  @override
  String get networkPoeWarningOver =>
      'Over budget: remove devices or use a more powerful switch/injector.';

  @override
  String get networkPoeFormulaNote =>
      'Total consumption = sum of devices. Keep a margin of about 10-20% below the total budget.';

  @override
  String get networkScanStartButton => 'Start Scan';

  @override
  String get networkScanStopButton => 'Stop Scan';

  @override
  String get networkScanScanning => 'Scanning…';

  @override
  String networkScanProgress(int done, int total) {
    return '$done / $total IPs scanned';
  }

  @override
  String networkScanDevicesFound(int count) {
    return '$count device(s) found';
  }

  @override
  String get networkScanNoDevicesFound => 'No devices found on this network.';

  @override
  String get networkScanNoNetwork =>
      'No local network (Wi-Fi) detected. Connect to a network.';

  @override
  String get networkScanIosLimitation =>
      'On iOS, MAC addresses and manufacturer info are not accessible by apps (Apple restriction).';

  @override
  String get networkScanLocalIp => 'Local IP';

  @override
  String get networkScanSubnet => 'Subnet';

  @override
  String get networkScanStatusOnline => 'Online';

  @override
  String networkScanResponseMs(int ms) {
    return '$ms ms';
  }

  @override
  String get networkScanPermissionDenied =>
      'Network permission denied. Check app permissions.';

  @override
  String get networkScanErrorGeneric => 'Network error. Check your connection.';

  @override
  String get networkScanHint => 'Press \"Start Scan\" to detect devices.';

  @override
  String get artnetTitle => 'Art-Net Viewer';

  @override
  String get artnetStartButton => 'Start Listening';

  @override
  String get artnetStopButton => 'Stop';

  @override
  String get artnetListening => 'Listening — Port 6454';

  @override
  String get artnetNotListening => 'Inactive';

  @override
  String get artnetNoPackets => 'Waiting for Art-Net packets…';

  @override
  String get artnetUniversesTitle => 'Received Universes';

  @override
  String artnetUniverseTitle(int universe) {
    return 'Universe $universe';
  }

  @override
  String artnetSourceIp(Object ip) {
    return 'Source: $ip';
  }

  @override
  String artnetPackets(int count) {
    return '$count packets';
  }

  @override
  String artnetFps(Object fps) {
    return '$fps fps';
  }

  @override
  String get artnetShowActiveOnly => 'Active channels only';

  @override
  String artnetActiveCount(int count) {
    return '$count active channels';
  }

  @override
  String get artnetPlatformInfo =>
      'Art-Net — UDP port 6454. Must be on the same network as the source.';

  @override
  String get artnetErrorBind =>
      'Unable to open UDP socket. Check network permissions.';

  @override
  String get sacnTitle => 'sACN Viewer';

  @override
  String get sacnStartButton => 'Start Listening';

  @override
  String get sacnStopButton => 'Stop';

  @override
  String get sacnListening => 'Listening — Port 5568';

  @override
  String get sacnNotListening => 'Inactive';

  @override
  String get sacnNoPackets => 'Waiting for sACN packets…';

  @override
  String get sacnUniversesTitle => 'Received Universes';

  @override
  String sacnUniverseTitle(int universe) {
    return 'Universe $universe';
  }

  @override
  String sacnSource(Object name) {
    return 'Source: $name';
  }

  @override
  String sacnPriority(int value) {
    return 'Priority: $value';
  }

  @override
  String sacnCid(Object cid) {
    return 'CID: $cid';
  }

  @override
  String sacnPackets(int count) {
    return '$count packets';
  }

  @override
  String sacnFps(Object fps) {
    return '$fps fps';
  }

  @override
  String get sacnShowActiveOnly => 'Active channels only';

  @override
  String sacnActiveCount(int count) {
    return '$count active channels';
  }

  @override
  String get sacnPlatformInfo =>
      'sACN / E1.31 — UDP port 5568. Multicast 239.255.x.x and unicast supported.';

  @override
  String get sacnErrorBind =>
      'Unable to open UDP socket. Check network permissions.';

  @override
  String get sacnIosMulticastNote =>
      'On iOS 14+, sACN multicast may require local network permission.';

  @override
  String get diagCardTitle => 'Network Diagnostic';

  @override
  String get diagCardSubtitle =>
      'Automatic analysis of your network, Art-Net and sACN.';

  @override
  String get diagPageTitle => 'Network Diagnostic';

  @override
  String get diagPlatformInfo =>
      'Runs a network scan + listens to Art-Net/sACN for a few seconds, then detects potential issues.';

  @override
  String get diagAnalyseButton => 'Analyse';

  @override
  String get diagCancelButton => 'Cancel';

  @override
  String get diagClearButton => 'Clear';

  @override
  String get diagSnapshotButton => 'Snapshot';

  @override
  String get diagScoreLabel => 'Network health score';

  @override
  String get diagStatusOk => 'Network OK';

  @override
  String get diagStatusWarning => 'Warning';

  @override
  String get diagStatusCritical => 'Critical';

  @override
  String diagAnalysisDate(Object date) {
    return 'Analysed on $date';
  }

  @override
  String get diagSeverityInfo => 'Information';

  @override
  String get diagSeverityWarning => 'Warning';

  @override
  String get diagSeverityCritical => 'Critical';

  @override
  String get diagScanningNetwork => 'Scanning network…';

  @override
  String get diagCollectingFlux => 'Collecting Art-Net / sACN streams…';

  @override
  String get diagAnalyzing => 'Analysing…';

  @override
  String diagScanProgress(int done, int total) {
    return '$done / $total IPs scanned';
  }

  @override
  String get diagNoResultYet =>
      'Press \"Analyse\" to run the network diagnostic.';

  @override
  String get diagAlertsTitle => 'Alerts';

  @override
  String get diagNoAlerts => 'No alerts detected — network is healthy.';

  @override
  String get diagSnapshotSaved => 'Snapshot saved.';

  @override
  String get diagNoLocalIp =>
      'No local IP address detected or address is invalid.';

  @override
  String get diagNoDevices => 'No devices detected on the network.';

  @override
  String get diagNoArtNet => 'No Art-Net stream received.';

  @override
  String get diagNoSacn => 'No sACN / E1.31 stream received.';

  @override
  String diagDuplicateIp(Object ip) {
    return 'Duplicate IP address detected: $ip.';
  }

  @override
  String diagArtNetLowFps(int universe, Object fps) {
    return 'Art-Net Universe $universe: low FPS ($fps fps).';
  }

  @override
  String diagSacnLowFps(int universe, Object fps) {
    return 'sACN Universe $universe: low FPS ($fps fps).';
  }

  @override
  String diagZeroDmxChannels(Object protocol, int universe) {
    return '$protocol Universe $universe: active stream but all DMX channels are zero.';
  }

  @override
  String diagManyUnknownDevices(int count) {
    return '$count unnamed device(s) detected on the network.';
  }

  @override
  String get ndiCardTitle => 'NDI Discovery';

  @override
  String get ndiCardSubtitle => 'NDI / NewTek sources on the network via mDNS.';

  @override
  String get ndiPageTitle => 'NDI Discovery';

  @override
  String get ndiStartButton => 'Start';

  @override
  String get ndiStopButton => 'Stop';

  @override
  String get ndiDiscovering => 'Searching…';

  @override
  String get ndiHint =>
      'Tap « Start » to search for NDI sources on the network.';

  @override
  String get ndiNoSources => 'No NDI sources detected on this network.';

  @override
  String get ndiIosNote =>
      'On iOS, mDNS discovery may be limited depending on network configuration.';

  @override
  String ndiSourcesFound(int count) {
    return '$count NDI source(s) found';
  }

  @override
  String get ndiLabelName => 'Source';

  @override
  String get ndiLabelHost => 'Host';

  @override
  String get ndiLabelIp => 'IP';

  @override
  String get ndiLabelPort => 'Port';

  @override
  String get ndiLabelService => 'Service';

  @override
  String get snapshotCardTitle => 'Network Snapshots';

  @override
  String get snapshotCardSubtitle =>
      'Save and compare the network state at different moments.';

  @override
  String get snapshotPageTitle => 'Network Snapshots';

  @override
  String get snapshotEmpty => 'No snapshots saved.';

  @override
  String get snapshotDeleteConfirm => 'Delete this snapshot?';

  @override
  String get snapshotDeleteButton => 'Delete';

  @override
  String get snapshotCompareButton => 'Compare';

  @override
  String get snapshotComparisonTitle => 'Comparison';

  @override
  String get snapshotComparisonSelectTwo => 'Select two snapshots to compare.';

  @override
  String get snapshotSnapshotA => 'Snapshot A';

  @override
  String get snapshotSnapshotB => 'Snapshot B';

  @override
  String get snapshotDevices => 'Devices';

  @override
  String get snapshotArtnetUniverses => 'Art-Net Universes';

  @override
  String get snapshotSacnUniverses => 'sACN Universes';

  @override
  String get snapshotNdiSources => 'NDI Sources';

  @override
  String get snapshotAlerts => 'Alerts';

  @override
  String get snapshotAdded => 'Added';

  @override
  String get snapshotRemoved => 'Removed';

  @override
  String get snapshotNoChanges => 'No differences between the two snapshots.';

  @override
  String get snapshotNoScore => 'Score not available';

  @override
  String get subscriptionCategoryNetworkTitle => 'Network Pro';

  @override
  String get subscriptionCategoryNetworkDescription =>
      'Advanced network tools: Art-Net, sACN, NDI, diagnostics and snapshots.';

  @override
  String get subscriptionHeadlineNetworkSubtitle =>
      'Unlock Art-Net viewer, sACN viewer, NDI, network diagnostics and snapshots.';

  @override
  String get networkPremiumLabel => 'PREMIUM';

  @override
  String get networkPremiumUnlockButton => 'Unlock';

  @override
  String get networkPremiumBannerText =>
      'Art-Net, sACN, NDI, diagnostics and snapshots require a Network Pro subscription.';

  @override
  String get subscriptionCategoryNetworkShort => 'NETWORK';

  @override
  String get dashboardPageTitle => 'Network Dashboard';

  @override
  String get dashboardCardTitle => 'Network Dashboard';

  @override
  String get dashboardCardSubtitle => 'Real-time network view';

  @override
  String get dashboardStatusIdle => 'Idle';

  @override
  String get dashboardStatusScanning => 'Scanning…';

  @override
  String get dashboardStatusCompleted => 'Scan complete';

  @override
  String get dashboardStatusError => 'Network error';

  @override
  String get dashboardStatusListening => 'Listening';

  @override
  String get dashboardKpiDevices => 'Devices';

  @override
  String get dashboardKpiArtnet => 'Art-Net';

  @override
  String get dashboardKpiSacn => 'sACN';

  @override
  String get dashboardKpiNdi => 'NDI';

  @override
  String get dashboardKpiScore => 'Score';

  @override
  String get dashboardNoScore => '–';

  @override
  String get dashboardSectionAlerts => 'Active alerts';

  @override
  String get dashboardNoAlerts => 'No active alerts';

  @override
  String get dashboardSectionSnapshot => 'Last snapshot';

  @override
  String get dashboardNoSnapshot => 'No snapshot saved';

  @override
  String get dashboardSectionQuickAccess => 'Quick access';

  @override
  String get dashboardRescanButton => 'Rescan';

  @override
  String get dashboardNdiRefreshButton => 'Refresh NDI';

  @override
  String get dashboardArtnetActive => 'Art-Net active';

  @override
  String get dashboardSacnActive => 'sACN active';

  @override
  String get dashboardNdiScanning => 'NDI discovery…';

  @override
  String dashboardAlertNewDevice(Object ip) {
    return 'New device: $ip';
  }

  @override
  String dashboardAlertLostDevice(Object ip) {
    return 'Device lost: $ip';
  }

  @override
  String dashboardAlertNewArtnetUniverse(int universe) {
    return 'New Art-Net universe: $universe';
  }

  @override
  String dashboardAlertLostArtnetUniverse(int universe) {
    return 'Art-Net universe lost: $universe';
  }

  @override
  String dashboardAlertNewSacnUniverse(int universe) {
    return 'New sACN universe: $universe';
  }

  @override
  String dashboardAlertLostSacnUniverse(int universe) {
    return 'sACN universe lost: $universe';
  }

  @override
  String dashboardAlertNewNdiSource(Object name) {
    return 'New NDI source: $name';
  }

  @override
  String dashboardAlertLostNdiSource(Object name) {
    return 'NDI source lost: $name';
  }

  @override
  String dashboardAlertArtnetLowFps(int universe, Object fps) {
    return 'Art-Net U$universe: low FPS ($fps)';
  }

  @override
  String dashboardAlertSacnLowFps(int universe, Object fps) {
    return 'sACN U$universe: low FPS ($fps)';
  }

  @override
  String dashboardAlertSacnDuplicate(int universe, int count) {
    return 'sACN U$universe: $count active sources';
  }

  @override
  String dashboardAlertSacnPriority(int universe) {
    return 'sACN U$universe: priority conflict';
  }

  @override
  String dashboardScanProgress(int progress) {
    return 'Network scan: $progress%';
  }

  @override
  String get luminexPageTitle => 'Luminex Monitor';

  @override
  String get luminexMonitorCardTitle => 'Luminex Monitor';

  @override
  String get luminexMonitorCardSubtitle => 'GigaCore switch monitoring';

  @override
  String get luminexAddDevice => 'Add device';

  @override
  String get luminexAddDeviceTitle => 'Switch IP address';

  @override
  String get luminexAddDeviceHint => '192.168.x.x';

  @override
  String get luminexAddDeviceConfirm => 'Add';

  @override
  String get luminexAddDeviceCancel => 'Cancel';

  @override
  String get luminexNoDevices => 'No Luminex switch';

  @override
  String get luminexNoDevicesHint =>
      'Add an IP manually or run a network scan.';

  @override
  String get luminexRefreshAll => 'Refresh all';

  @override
  String get luminexRemoveDevice => 'Remove';

  @override
  String get luminexScanForDevices => 'Scan network';

  @override
  String get luminexReachable => 'Reachable';

  @override
  String get luminexUnreachable => 'Unreachable';

  @override
  String get luminexPolling => 'Polling…';

  @override
  String get luminexNoAlarms => 'No alarms';

  @override
  String get luminexSectionSystem => 'System information';

  @override
  String get luminexSectionPorts => 'Ports';

  @override
  String get luminexSectionAlarms => 'Active alarms';

  @override
  String get luminexLabelName => 'Name';

  @override
  String get luminexLabelModel => 'Model';

  @override
  String get luminexLabelFirmware => 'Firmware';

  @override
  String get luminexLabelUptime => 'Uptime';

  @override
  String get luminexLabelTemperature => 'Temperature';

  @override
  String get luminexLabelPsu => 'Power supply';

  @override
  String get luminexPsuOk => 'Okay';

  @override
  String get luminexPsuAbsent => 'Absent';

  @override
  String get luminexLabelApi => 'API';

  @override
  String get luminexGen1 => 'Gen 1 (text)';

  @override
  String get luminexGen2 => 'Gen 2 (JSON)';

  @override
  String get luminexGenUnknown => 'Unknown';

  @override
  String get luminexPortUp => 'Up';

  @override
  String get luminexPortDown => 'Down';

  @override
  String get luminexPortUnknown => 'Unknown';

  @override
  String get luminexPortPoeActive => 'PoE active';

  @override
  String get luminexPortPoeFault => 'PoE fault';

  @override
  String get luminexPortPoeOff => 'PoE off';

  @override
  String get luminexPortNoPoe => 'No PoE';

  @override
  String get luminexDetectedScan => 'Network scan';

  @override
  String get luminexDetectedManual => 'Manual entry';

  @override
  String get luminexNotAvailable => 'N/A';

  @override
  String get luminexAlarmInaccessible => 'Switch unreachable';

  @override
  String get luminexAlarmPsuAbsent => 'Power supply absent';

  @override
  String luminexAlarmCount(int count) {
    return '$count active alarm(s)';
  }

  @override
  String luminexPortSpeed(int speed) {
    return '$speed Mb/s';
  }

  @override
  String luminexPortRxErrors(int count) {
    return 'RX: $count err.';
  }

  @override
  String luminexPortTxErrors(int count) {
    return 'TX: $count err.';
  }

  @override
  String luminexAlarmPortDown(int port) {
    return 'Port $port down';
  }

  @override
  String luminexAlarmSpeedDegraded(int port, int speed) {
    return 'Port $port: speed degraded ($speed Mb/s)';
  }

  @override
  String luminexAlarmHighRxErrors(int port, int count) {
    return 'Port $port: high RX errors ($count)';
  }

  @override
  String luminexAlarmHighTxErrors(int port, int count) {
    return 'Port $port: high TX errors ($count)';
  }

  @override
  String luminexAlarmPoeFault(int port) {
    return 'Port $port: PoE fault';
  }

  @override
  String luminexAlarmHighTemp(Object temp) {
    return 'High temperature: $temp°C';
  }

  @override
  String get manetPageTitle => 'MA-Net Monitor';

  @override
  String get manetMonitorCardTitle => 'MA-Net Monitor';

  @override
  String get manetMonitorCardSubtitle => 'grandMA2/3 node detection';

  @override
  String get manetNoNodes => 'No MA-Net node detected';

  @override
  String get manetListening => 'Listening…';

  @override
  String get manetNodeType => 'Kind';

  @override
  String get manetFirmware => 'Firmware';

  @override
  String get manetMac => 'MAC address';

  @override
  String get manetLastSeen => 'Last seen';

  @override
  String get manetProtocol => 'MA-Net';

  @override
  String get manetProtocolMaNet2 => 'MA-Net2';

  @override
  String get manetProtocolMaNet3 => 'MA-Net3';

  @override
  String get manetEmptyHint =>
      'Make sure you are on the same network as the MA Lighting devices';

  @override
  String manetNodeCount(int count) {
    return '$count node(s) online';
  }

  @override
  String manetPortListening(int port) {
    return 'UDP:$port';
  }

  @override
  String get helpPageTitle => 'Network Tools Guide';

  @override
  String get helpIntro =>
      'All tools operate in read-only mode on your local network. Tap a tool to see details.';

  @override
  String get helpSectionDoes => 'What it does';

  @override
  String get helpSectionDelay => 'Timing';

  @override
  String get helpSectionLimits => 'What it doesn\'t do';

  @override
  String get helpSectionTip => 'Tip';

  @override
  String get helpGeneralTitle => 'General tips';

  @override
  String get helpGeneralSubnet =>
      'All tools operate on the local /24 subnet. Devices on a different VLAN or behind a router will not be detected.';

  @override
  String get helpGeneralFirewall =>
      'Software firewalls may block certain probes. If devices are missing, check your filtering rules.';

  @override
  String get helpGeneralWifi =>
      'WiFi networks with client isolation block discovery. Prefer a wired connection or a WiFi in bridge mode.';

  @override
  String get helpToolScanDoes =>
      'Scans the /24 subnet in parallel and identifies active devices. Shows IP, hostname, manufacturer (via MAC OUI) and common open ports.';

  @override
  String get helpToolScanDelay =>
      '15 to 30 seconds depending on network size. 50 simultaneous probes.';

  @override
  String get helpToolScanLimits =>
      'Does not cross VLANs or routers. Does not perform full port scans or WAN scanning.';

  @override
  String get helpToolScanTip =>
      'If devices are missing, check that your firewall does not block incoming TCP/ICMP probes.';

  @override
  String get helpToolDashboardDoes =>
      'Shows real-time status of detected devices: availability, latency, active network alerts.';

  @override
  String get helpToolDashboardDelay =>
      'Updates every 30 seconds. First load is immediate after the scan.';

  @override
  String get helpToolDashboardLimits =>
      'Does not retain history between sessions. Requires a prior scan to populate the device list.';

  @override
  String get helpToolDashboardTip =>
      'Run a network scan before opening the dashboard to see all available devices.';

  @override
  String get helpToolArtNetDoes =>
      'Passively listens to Art-Net packets (UDP 6454) and displays active DMX universes with real-time values.';

  @override
  String get helpToolArtNetDelay =>
      'Real-time — data appears in under one second upon packet reception.';

  @override
  String get helpToolArtNetLimits =>
      'No DMX output. Does not configure Art-Net nodes and does not support the RDM protocol.';

  @override
  String get helpToolArtNetTip =>
      'Art-Net does not cross routers. All devices must be on the same L2 network (same switch or same segment).';

  @override
  String get helpToolSacnDoes =>
      'Listens to sACN/E1.31 multicast streams (UDP 5568) and displays active universes, source priorities and DMX values.';

  @override
  String get helpToolSacnDelay => 'Real-time — latency under one second.';

  @override
  String get helpToolSacnLimits =>
      'No DMX output. Does not modify priorities or sACN source configuration.';

  @override
  String get helpToolSacnTip =>
      'sACN multicast requires a managed switch with IGMP snooping enabled to prevent broadcast storms on the network.';

  @override
  String get helpToolNdiDoes =>
      'Detects NDI video sources on the LAN via the NDI discovery protocol. Shows name, IP address and type of each source.';

  @override
  String get helpToolNdiDelay =>
      'Sources appear 5 to 15 seconds after connecting to the network.';

  @override
  String get helpToolNdiLimits =>
      'No video playback or NDI routing. Does not detect NDI|HX sources without active mDNS discovery.';

  @override
  String get helpToolNdiTip =>
      'NDI requires a minimum of 100 Mb/s per stream. Avoid WiFi for production — prefer a Gigabit wired connection.';

  @override
  String get helpToolDiagDoes =>
      'Runs a series of network health tests: connectivity, DNS resolution, latency, packet loss and service availability.';

  @override
  String get helpToolDiagDelay => 'Full diagnostic in 20 to 30 seconds.';

  @override
  String get helpToolDiagLimits =>
      'Diagnostic only — no automatic repair, no configuration changes.';

  @override
  String get helpToolDiagTip =>
      'Run a diagnostic before and after a network change to compare state and quickly isolate regressions.';

  @override
  String get helpToolSnapshotDoes =>
      'Captures the network state at a point in time (devices, services) and lets you compare two snapshots to identify changes.';

  @override
  String get helpToolSnapshotDelay =>
      'Capture in 30 to 45 seconds depending on network size.';

  @override
  String get helpToolSnapshotLimits =>
      'No continuous monitoring or automatic alerts. History is stored on this device only.';

  @override
  String get helpToolSnapshotTip =>
      'Ideal for documenting state before/after an infrastructure change or isolating a regression during troubleshooting.';

  @override
  String get helpToolLuminexDoes =>
      'Queries Luminex GigaCore switches via their HTTP API. Shows port status (link, speed, PoE, errors), temperature, PSUs and triggers alarms.';

  @override
  String get helpToolLuminexDelay =>
      'Polling every 30 seconds. Auto-discovery on the subnet: 15 to 30 seconds.';

  @override
  String get helpToolLuminexLimits =>
      'Read-only. No VLAN, group or port configuration changes. Does not support MA-Net or NDI video.';

  @override
  String get helpToolLuminexTip =>
      'Default credentials: admin / empty password. Gen2 switches expose /api/v1/, Gen1 respond on /stat/ports as plain text.';

  @override
  String get helpToolManetDoes =>
      'Passively listens on UDP port 6549 and detects grandMA2/3 consoles and nodes broadcasting on the network. Shows name, device type, firmware version and MAC address.';

  @override
  String get helpToolManetDelay =>
      'Devices appear on their next network broadcast, typically within 10 seconds.';

  @override
  String get helpToolManetLimits =>
      'Read-only. No show data, no DMX values, no configuration. Does not cross VLANs.';

  @override
  String get helpToolManetTip =>
      'If no devices appear: check that grandMA is configured to broadcast on the LAN and that UDP port 6549 is not blocked by a firewall.';

  @override
  String get bwCardTitle => 'Bandwidth';

  @override
  String get bwCardSubtitle => 'Broadcast + SNMP switch';

  @override
  String get bwHubTitle => 'Bandwidth';

  @override
  String get bwHubSubtitle =>
      'Option 1 — broadcast traffic only (no equipment needed). Option 2 — real per-port bandwidth via SNMP (managed switch required).';

  @override
  String get bwHubTagFree => 'FREE';

  @override
  String get bwHubCardBroadcastTitle => 'Network broadcast';

  @override
  String get bwHubCardBroadcastSubtitle => 'Art-Net · sACN · MA-Net';

  @override
  String get bwHubCardBroadcastLimit =>
      'Unicast traffic not visible (NDI, Dante…)';

  @override
  String get bwHubCardSnmpTitle => 'Switch ports';

  @override
  String get bwHubCardSnmpSubtitle => 'Per-port view, all traffic';

  @override
  String get bwHubCardSnmpRequires => 'Requires SNMP managed switch';

  @override
  String get bwBroadcastPageTitle => 'Network broadcast';

  @override
  String get bwBroadcastWarning =>
      'Broadcast & multicast only. Unicast traffic (NDI, Dante…) is not visible from this device.';

  @override
  String get bwBroadcastListening => 'Listening';

  @override
  String get bwBroadcastTotal => 'Total';

  @override
  String get bwSnmpPageTitle => 'Switch ports';

  @override
  String get bwSnmpConfigTitle => 'SNMP connection';

  @override
  String get bwSnmpHost => 'Switch IP';

  @override
  String get bwSnmpHostHint => '192.168.1.1';

  @override
  String get bwSnmpCommunity => 'Community';

  @override
  String get bwSnmpCommunityHint => 'public';

  @override
  String get bwSnmpConnect => 'Connect';

  @override
  String get bwSnmpDisconnect => 'Disconnect';

  @override
  String get bwSnmpConnecting => 'Connecting…';

  @override
  String get bwSnmpError => 'SNMP error';

  @override
  String get bwSnmpReqTitle => 'Requirements';

  @override
  String get bwSnmpReq1 => 'Managed switch with SNMP v2c enabled';

  @override
  String get bwSnmpReq2 =>
      'Community string (default: \"public\" on Luminex GigaCore)';

  @override
  String get bwSnmpReq3 => 'Switch IP accessible from this device';

  @override
  String get bwSnmpPortUp => 'Active';

  @override
  String get bwSnmpPortDown => 'Inactive';

  @override
  String get bwSnmpNoData => 'Waiting for data…';

  @override
  String bwSnmpPortCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 's',
      one: '',
    );
    return '$count port$_temp0';
  }

  @override
  String get bwUnitKbps => 'kbps';

  @override
  String get bwUnitMbps => 'Mbps';

  @override
  String get bwUnitPkts => 'pkt/s';

  @override
  String get bwLabelIn => '↓ In';

  @override
  String get bwLabelOut => '↑ Out';

  @override
  String get conversionsVolumesTitle => 'Volumes';

  @override
  String get volumeCalcCardTitle => 'Volume — cube, cylinder, sphere…';

  @override
  String get volumeCalcUnitLabel => 'Dimension unit';

  @override
  String get volumeCalcPlaceholder =>
      'Fill in the dimensions to see the volume ✨';

  @override
  String get volumeShapeCube => 'Cube';

  @override
  String get volumeShapeBox => 'Rectangular box';

  @override
  String get volumeShapeCylinder => 'Cylinder';

  @override
  String get volumeShapeSphere => 'Sphere';

  @override
  String get volumeShapeCone => 'Cone';

  @override
  String get volumeShapeSquarePyramid => 'Pyramid (square base)';

  @override
  String get volumeFieldSide => 'Side';

  @override
  String get volumeFieldLength => 'Length';

  @override
  String get volumeFieldWidth => 'Width';

  @override
  String get volumeFieldHeight => 'Height';

  @override
  String get volumeFieldRadius => 'Radius';

  @override
  String get volumeFieldRadiusBase => 'Radius (base)';

  @override
  String get volumeFieldSideBase => 'Side (base)';

  @override
  String get aboutVesaTitle => 'VESA mounts & screen sizes';

  @override
  String get aboutVesaSubtitle =>
      'VESA standards, finder tool and diagonal calculator';

  @override
  String get vesaIntroTitle => 'VESA & screens, at a glance';

  @override
  String get vesaIntroBody =>
      'VESA (Video Electronics Standards Association) standardizes the spacing between the mounting holes on the back of screens, TVs and monitors. The bigger and heavier the screen, the wider the hole spacing. Always check the weight and VESA pattern given by the manufacturer before choosing a mount — this page gives ballpark figures, not guaranteed values.';

  @override
  String get vesaTableTitle => 'Common VESA standards';

  @override
  String get vesaColEntraxe => 'Hole spacing';

  @override
  String get vesaColScreenSize => 'Screen size';

  @override
  String get vesaColMaxWeight => 'Max. weight';

  @override
  String get vesaTableFooterNote =>
      'Indicative ranges: a manufacturer may well offer a wider-than-average VESA pattern for a given screen, especially on pro displays and LED walls. Always check the datasheet.';

  @override
  String get vesaLargeFormat => 'Large formats / LED walls';

  @override
  String get vesaFinderTitle => 'Which VESA pattern did I measure?';

  @override
  String get vesaFinderHint =>
      'Measure the spacing between two holes (horizontal and vertical) on the back of the screen, in millimetres.';

  @override
  String get vesaFieldHorizontal => 'Horizontal spacing (mm)';

  @override
  String get vesaFieldVertical => 'Vertical spacing (mm)';

  @override
  String get vesaFinderPlaceholder =>
      'Enter both spacings to identify the standard.';

  @override
  String vesaFinderExactMatch(Object pattern) {
    return 'VESA standard $pattern 🎯';
  }

  @override
  String vesaFinderNearestMatch(Object pattern, Object delta) {
    return 'No exact match — the closest is $pattern (combined difference of $delta mm). Double-check your measurement.';
  }

  @override
  String get vesaScreenCalcTitle => 'Screen dimensions from its diagonal';

  @override
  String get vesaFieldDiagonal => 'Diagonal (inches)';

  @override
  String get vesaScreenCalcPlaceholder => 'Enter a diagonal in inches.';

  @override
  String get vesaResultDiagonal => 'Diagonal';

  @override
  String get vesaResultWidth => 'Width';

  @override
  String get vesaResultHeight => 'Height';

  @override
  String get vesaResultArea => 'Area';

  @override
  String get vesaTipsTitle => 'Mounting tips';

  @override
  String get vesaTip1 =>
      'Always use all 4 (or more) supplied screws — never just 2 diagonally.';

  @override
  String get vesaTip2 =>
      'Respect the specified tightening torque: over-tightening can crack the chassis.';

  @override
  String get vesaTip3 =>
      'For a high rig or truss mount, plan for a sling or a secondary safety independent of the VESA mount.';

  @override
  String get vesaTip4 =>
      'Under dynamic load (movement, vibration, transport), reduce the allowable load relative to the manufacturer\'s static rating.';

  @override
  String get vesaTip5 =>
      'Check the screw length: if too long, they can damage the screen\'s internal electronics.';

  @override
  String get vesaTip6 =>
      'A VESA adapter (75→100, 100→200…) must be noted on the load sheet — it adds weight and leverage.';

  @override
  String get cctFilterTitle => 'Filter ↔ Color Temperature (K)';

  @override
  String get cctFilterTileDescription =>
      'Which CTO/CTB to pick between two temperatures, in any direction';

  @override
  String get cctFilterIntro =>
      'Instantly find the CTO/CTB filter you need, or check the result of a filter you already have — in any direction ✨';

  @override
  String get cctModeFindFilter => 'Which filter?';

  @override
  String get cctModeSourcePlusFilter => 'K + filter → K?';

  @override
  String get cctModeTargetPlusFilter => 'Target K + filter → starting K?';

  @override
  String get cctFieldSourceK => 'Starting temperature (K)';

  @override
  String get cctFieldTargetK => 'Desired temperature (K)';

  @override
  String get cctFieldTargetKFinal => 'Desired final temperature (K)';

  @override
  String get cctFieldFilter => 'Filter';

  @override
  String get cctDescEighthCtb => 'Cools very slightly';

  @override
  String get cctDescQuarterCtb => 'Cools slightly';

  @override
  String get cctDescHalfCtb => 'Cools moderately';

  @override
  String get cctDescThreeQuarterCtb => 'Cools strongly';

  @override
  String get cctDescFullCtb => 'Tungsten → daylight';

  @override
  String get cctDescEighthCto => 'Warms very slightly';

  @override
  String get cctDescQuarterCto => 'Warms slightly';

  @override
  String get cctDescHalfCto => 'Warms moderately';

  @override
  String get cctDescThreeQuarterCto => 'Warms strongly';

  @override
  String get cctDescFullCto => 'Daylight → tungsten';

  @override
  String get cctFindFilterPlaceholder =>
      'Enter both temperatures to find the right filter.';

  @override
  String get cctRequiredShiftLabel => 'Required shift';

  @override
  String get cctMiredShiftLabel => 'Mired shift';

  @override
  String cctBestChoice(Object name, Object k) {
    return 'Best choice: $name → ≈ $k K';
  }

  @override
  String cctApproxKelvin(Object k) {
    return '≈ $k K';
  }

  @override
  String get cctOtherFiltersNearby => 'Other nearby filters';

  @override
  String get cctDisclaimer =>
      'Standard mired shift values, approximate — check the manufacturer\'s datasheet for critical use.';

  @override
  String get cctSourcePlaceholder => 'Enter the starting temperature.';

  @override
  String get cctTargetPlaceholder => 'Enter the desired final temperature.';

  @override
  String get cctOutOfRange =>
      'Combination out of range (non-physical result) — try another temperature or filter.';

  @override
  String get cctResultObtainedTemp => 'Resulting temperature';

  @override
  String get cctResultAppliedFilter => 'Filter applied';

  @override
  String get cctResultRequiredSource => 'Required source';

  @override
  String get cctResultFilterToApply => 'Filter to apply';

  @override
  String get cctBrandLabel => 'Filter brand';

  @override
  String get cctAllBrands => 'All brands';

  @override
  String get timecodeHubTitle => 'Timecode';

  @override
  String get timecodeToolConverterLabel => 'Frame rate\nconverter';

  @override
  String get timecodeToolMathLabel => 'Duration &\noffset';

  @override
  String get timecodeToolDelayLabel => 'Frame ↔ ms';

  @override
  String get timecodeToolCountdownLabel => 'Countdown';

  @override
  String get timecodeBadgeFree => 'FREE';

  @override
  String get timecodeBadgeNew => 'NEW';

  @override
  String get timecodeConverterTitle => 'Frame rate converter';

  @override
  String get timecodeConverterSourceCardTitle => 'Source timecode';

  @override
  String get timecodeConverterFieldLabel => 'HH:MM:SS:FF';

  @override
  String get timecodeConverterFieldHint => '01:00:00:00';

  @override
  String get timecodeConverterSourceRateLabel => 'Source frame rate';

  @override
  String get timecodeConverterSwapTooltip => 'Swap source / target';

  @override
  String get timecodeConverterTargetCardTitle => 'Target frame rate';

  @override
  String get timecodeConverterTargetRateLabel => 'Target frame rate';

  @override
  String get timecodeConverterButton => 'Convert';

  @override
  String timecodeConverterErrorInvalid(String rateLabel, int frameBase) {
    return '❌ Invalid timecode for $rateLabel (expected: HH:MM:SS:FF, FF < $frameBase).';
  }

  @override
  String timecodeConverterResult(String rateLabel, String tc, String seconds) {
    return 'TC in $rateLabel:\n$tc\n\n(≈ $seconds s elapsed since 00:00:00:00)';
  }

  @override
  String get timecodeMathTitle => 'Duration & offset';

  @override
  String get timecodeMathModeDuration => 'Duration between 2 TC';

  @override
  String get timecodeMathModeOffset => 'Offset a TC';

  @override
  String get timecodeMathRateCardTitle => 'Frame rate';

  @override
  String get timecodeMathDurationCardTitle => 'Timecode In / Out';

  @override
  String get timecodeMathTcInLabel => 'TC In (HH:MM:SS:FF)';

  @override
  String get timecodeMathTcOutLabel => 'TC Out (HH:MM:SS:FF)';

  @override
  String get timecodeMathComputeDurationButton => 'Calculate duration';

  @override
  String timecodeMathErrorDuration(int frameBase) {
    return '❌ Check both timecodes (HH:MM:SS:FF, FF < $frameBase).';
  }

  @override
  String timecodeMathDurationResult(
      String duration, int frames, String rateLabel) {
    return 'Duration: $duration\n($frames frame(s) at $rateLabel)';
  }

  @override
  String get timecodeMathOffsetCardTitle => 'Starting timecode + offset';

  @override
  String get timecodeMathBaseTcLabel => 'Starting TC (HH:MM:SS:FF)';

  @override
  String get timecodeMathAddLabel => '+ Add';

  @override
  String get timecodeMathSubtractLabel => '− Subtract';

  @override
  String get timecodeMathOffsetLabel => 'Offset — duration (HH:MM:SS:FF)';

  @override
  String get timecodeMathComputeOffsetButton => 'Calculate new TC';

  @override
  String timecodeMathErrorOffset(int frameBase) {
    return '❌ Check the starting timecode and the offset (HH:MM:SS:FF, FF < $frameBase).';
  }

  @override
  String timecodeMathOffsetResult(String tc) {
    return 'New timecode:\n$tc';
  }

  @override
  String get timecodeDelayTitle => 'Frame ↔ ms';

  @override
  String get timecodeDelayCardTitle => 'Video / audio delay';

  @override
  String get timecodeDelayIntro =>
      'Handy for fixing a lip-sync mismatch or a video/LED processor delay: enter a value, pick its unit, and get the equivalent.';

  @override
  String get timecodeDelayRateLabel => 'Frame rate';

  @override
  String get timecodeDelayUnitFrames => 'Frames';

  @override
  String get timecodeDelayUnitMs => 'Milliseconds';

  @override
  String get timecodeDelayValueLabelFrames => 'Number of frames';

  @override
  String get timecodeDelayValueLabelMs => 'Milliseconds';

  @override
  String get timecodeDelayButton => 'Convert';

  @override
  String get timecodeDelayErrorInvalid => '❌ Invalid value.';

  @override
  String timecodeDelayResultFromFrames(
      int frames, String rateLabel, String ms, String duration) {
    return '$frames frame(s) at $rateLabel\n= $ms ms\n= $duration';
  }

  @override
  String timecodeDelayResultFromMs(
      String ms, String rateLabel, int frames, String duration) {
    return '$ms ms at $rateLabel\n= $frames frame(s)\n= $duration';
  }

  @override
  String get timecodeCountdownTitle => 'Countdown';

  @override
  String get timecodeCountdownSettingsCardTitle => 'Settings';

  @override
  String get timecodeCountdownRateLabel => 'Frame rate';

  @override
  String get timecodeCountdownCurrentTcLabel => 'Current TC (HH:MM:SS:FF)';

  @override
  String get timecodeCountdownFillNowTooltip => 'Fill with the phone\'s clock';

  @override
  String get timecodeCountdownTargetTcLabel => 'Target TC (HH:MM:SS:FF)';

  @override
  String get timecodeCountdownStartButton => 'Start';

  @override
  String get timecodeCountdownStopButton => 'Stop';

  @override
  String timecodeCountdownErrorInvalid(int frameBase) {
    return '❌ Check both timecodes (HH:MM:SS:FF, FF < $frameBase).';
  }

  @override
  String get timecodeCountdownLiveCardTitle => 'Live';

  @override
  String timecodeCountdownLiveText(String tc, String remaining) {
    return 'Current TC (estimated): $tc\nTime remaining: $remaining';
  }

  @override
  String timecodeCountdownOverdue(String duration) {
    return '−$duration (TC passed)';
  }

  @override
  String get homeTimecodeTitle => 'Timecode';

  @override
  String get homeTimecodeSubtitle => 'Frame rate, duration, offset, delay';

  @override
  String get vconsoleTitle => 'Virtual Console';

  @override
  String get vconsoleTileDescription =>
      'Sends Art-Net/sACN over WiFi to test your fixtures';

  @override
  String get vconsoleSectionConnection => 'Network connection';

  @override
  String get vconsoleUniverseLabel => 'Start universe';

  @override
  String get vconsoleUniverseCountLabel => 'Number of universes';

  @override
  String get rdmPageTitle => 'RDM';

  @override
  String get rdmScanButton => 'Scan network';

  @override
  String get rdmScanningStatus => 'Searching for RDM fixtures…';

  @override
  String get rdmEmptyState => 'No RDM fixtures found. Start a scan.';

  @override
  String rdmDeviceCountLabel(Object count) {
    return '$count fixture(s) found';
  }

  @override
  String get rdmUidLabel => 'UID';

  @override
  String get rdmManufacturerLabel => 'Manufacturer';

  @override
  String get rdmStartAddressLabel => 'DMX address';

  @override
  String get rdmFootprintLabel => 'Footprint (channels)';

  @override
  String get rdmPersonalityLabel => 'Personality (mode)';

  @override
  String get rdmSoftwareVersionLabel => 'Software version';

  @override
  String get rdmIdentifyButton => 'Identify';

  @override
  String get rdmEditTitle => 'Edit fixture';

  @override
  String rdmConfirmSetStartAddress(Object uid, Object value) {
    return 'Change the DMX address of $uid to $value?';
  }

  @override
  String rdmConfirmSetPersonality(Object uid, Object value) {
    return 'Change the personality of $uid to $value?';
  }

  @override
  String rdmConfirmSetLabel(Object uid, Object value) {
    return 'Rename $uid to \"$value\"?';
  }

  @override
  String get rdmConfirmButton => 'Confirm';

  @override
  String get rdmCancelButton => 'Cancel';

  @override
  String get rdmSetSuccess => 'Updated successfully';

  @override
  String get rdmSetFailed => 'Update failed';

  @override
  String get rdmNoResponse => 'No response from the fixture';

  @override
  String get rdmRefreshTooltip => 'Refresh';

  @override
  String get rdmWriteWarning =>
      'Changing a fixture live can disrupt a running show. Use with care.';

  @override
  String get vconsoleTargetBroadcast => 'Broadcast (auto)';

  @override
  String get vconsoleTargetUnicast => 'Specific IP';

  @override
  String get vconsoleManualIpLabel => 'Node IP (e.g. 192.168.1.50)';

  @override
  String get vconsoleStop => 'Stop sending';

  @override
  String get vconsoleStart => 'Start sending';

  @override
  String get vconsoleBlackout => 'Blackout';

  @override
  String vconsoleStatusLive(Object fps) {
    return 'Live • $fps fps';
  }

  @override
  String get vconsoleStatusStopped => 'Stopped';

  @override
  String vconsoleUniversePill(Object universe) {
    return 'Universe $universe';
  }

  @override
  String vconsoleTargetPill(Object target) {
    return '→ $target';
  }

  @override
  String vconsoleErrorLabel(Object message) {
    return 'Error: $message';
  }

  @override
  String vconsoleStartFailed(Object message) {
    return 'Couldn\'t start: $message';
  }

  @override
  String get vconsoleTabFaders => 'Simple faders';

  @override
  String get vconsoleTabGdtf => 'GDTF';

  @override
  String get vconsoleTabPatch => 'My Patch';

  @override
  String get vconsoleChannelCountLabel => 'Number of channels';

  @override
  String get vconsoleAllZero => 'All to 0';

  @override
  String get vconsoleAllFull => 'All to 255';

  @override
  String get vconsoleSearchTitle => 'Search GDTF Share';

  @override
  String get vconsoleSearchHint => 'E.g. MAC Viper, Spiider...';

  @override
  String get vconsoleImportLocal => 'Import a .gdtf file';

  @override
  String vconsoleModeDialogTitleFor(Object fixture) {
    return 'DMX mode — $fixture';
  }

  @override
  String vconsoleModeDialogOption(Object mode, Object count) {
    return '$mode ($count ch)';
  }

  @override
  String get vconsoleModeDialogTitleGeneric => 'DMX mode';

  @override
  String get vconsoleNoModeFound => 'No DMX mode found in this .gdtf file';

  @override
  String vconsolePickFailed(Object message) {
    return 'Couldn\'t select file: $message';
  }

  @override
  String vconsoleDownloadFailed(Object code) {
    return 'Download failed ($code)';
  }

  @override
  String vconsoleSearchResultSubtitle(Object count, Object size) {
    return '$count mode(s) • $size';
  }

  @override
  String get vconsoleChooseFixtureHint => 'Pick a fixture to show its faders.';

  @override
  String get vconsolePatchSectionTitle => 'My Patch (MVR import)';

  @override
  String get vconsolePatchEmpty =>
      'No patched fixtures yet. Import an MVR file from the Patch tool to see them here.';

  @override
  String vconsolePatchEntrySubtitle(
      Object universe, Object start, Object end, Object count) {
    return 'Universe $universe • $start-$end • $count ch';
  }

  @override
  String get vconsoleChoosePatchedFixtureHint =>
      'Pick a patched fixture to show its faders.';

  @override
  String get vconsoleStartAddressLabel => 'Start address';

  @override
  String get vconsoleFixtureFallbackTitle => 'Fixture';

  @override
  String vconsoleUniverseArrow(Object universe) {
    return '→ universe $universe';
  }

  @override
  String vconsoleSearchError(Object code) {
    return 'Error $code';
  }

  @override
  String vconsoleNetworkError(Object message) {
    return 'Network error: $message';
  }

  @override
  String vconsoleChannelShortLabel(Object n) {
    return 'Ch $n';
  }

  @override
  String get vconsoleContinueToSource => 'Choose source';

  @override
  String get vconsoleContinueToSourceHint =>
      'Simple faders, GDTF fixture or an already patched machine (MVR).';

  @override
  String get vconsoleControlGroupTooltip => 'Control the whole group';

  @override
  String vconsoleGroupInfo(Object count, Object universe) {
    return '$count fixture(s) • universe $universe';
  }

  @override
  String vconsoleGroupInfoWithExcluded(
      Object count, Object universe, Object excluded) {
    return '$count fixture(s) • universe $universe • $excluded outside group (other universe)';
  }

  @override
  String vconsoleGroupSubtitle(Object count, Object universes) {
    return '$count fixtures • universe $universes';
  }

  @override
  String get vconsoleOpenFaders => 'Open console';

  @override
  String vconsolePresetsTitleFor(Object channel) {
    return 'Presets — $channel';
  }

  @override
  String get vconsolePresetsTooltip => 'Presets';

  @override
  String get vconsoleSourceStepTitle => 'Choose source';

  @override
  String get vconsoleUnit8Bit => '8-bit';

  @override
  String get vconsoleUnitPercent => '%';

  @override
  String get vconsoleHomeTooltip =>
      'Home position (dimmer 100%, pan/tilt centered, shutter open)';

  @override
  String get vconsoleHomeButton => 'Home';

  @override
  String get filterCorrespondenceTitle => 'Filter Correspondence';

  @override
  String get filterCorrespondenceSearchHint => 'Search (number or name)…';

  @override
  String get filterCorrespondenceColLeeName => 'Lee / Name';

  @override
  String get filterCorrespondenceEmpty => 'No match';

  @override
  String filterCorrespondenceResultsCount(Object count) {
    return '$count match(es)';
  }

  @override
  String filterCorrespondenceFilteredOf(Object total) {
    return ' (filtered from $total)';
  }

  @override
  String get lbResetDialogTitle => 'Reset everything?';

  @override
  String get lbResetDialogBody =>
      'The fixture list will be cleared. The panel configuration will be kept.';

  @override
  String get lbClearAction => 'Clear';

  @override
  String get lbPageTitle => 'Load Balancer';

  @override
  String get lbResetTooltip => 'Reset';

  @override
  String get lbPanelConfigTitle => 'Panel configuration';

  @override
  String get lbVoltageTypeLabel => 'Network type';

  @override
  String get lbPanelSizeLabel => 'Panel size';

  @override
  String get lbCosPhiLabel => 'Power factor (cos φ)';

  @override
  String get lbPhaseGaugesTitle => 'Amperage per phase';

  @override
  String lbFixturesListTitle(Object count, Object totalW) {
    return 'Fixtures — $count lines · $totalW W total';
  }

  @override
  String get lbEmptyTitle => 'No fixtures yet';

  @override
  String get lbEmptyBody => 'Tap + to add\nfrom the catalog.';

  @override
  String get lbAddFixtureButton => 'Add a fixture';

  @override
  String get lbSheetTitleDefault => '⚡ Add a fixture';

  @override
  String get lbPickerSearchHint => 'Search manufacturer or fixture…';

  @override
  String get lbNoResults => 'No results 🤷';

  @override
  String lbProductsWithPowerCount(Object count) {
    return '$count fixture(s) with power data';
  }

  @override
  String get lbUnknownPower => 'unknown power';

  @override
  String get lbFixtureSectionLabel => 'Fixture';

  @override
  String get lbPowerLabel => 'Power (W)';

  @override
  String get lbQuantityLabel => 'Quantity';

  @override
  String get lbPhaseLabel => 'Phase';

  @override
  String get lbPowerHint => 'e.g. 350';

  @override
  String get lbAddToDistribution => 'Add to distribution';

  @override
  String get filterLedFiltreLabel => 'Filter';

  @override
  String get filterLedTransmissionLabel => 'Transmission';

  @override
  String get filterLedSaveProfileTooltip => 'Save profile';

  @override
  String get filterLedColorComparisonTitle => 'Color comparison';

  @override
  String get proHeaderBody =>
      'Unlock all advanced tools for lighting, video and laser technicians.';

  @override
  String get proPerYear => '/ year';

  @override
  String get proSubscribeButton => 'Subscribe';

  @override
  String get proRestorePurchases => 'Restore Purchases';

  @override
  String get proPrivacyPolicy => 'Privacy Policy';

  @override
  String get proTermsOfUse => 'Terms of Use';

  @override
  String get rfIm3ConflictBadge => '⚠ CONFLICT';

  @override
  String get filterLedHideCalibration => 'Hide calibration';

  @override
  String get filterLedShowCalibration => 'Calibrate my fixture';

  @override
  String get aboutAudioTitle => 'Audio — sound & PA';

  @override
  String get aboutAudioSubtitle =>
      'Gain staging, SPL/distance, delays, cardioid subs, cabling.';

  @override
  String get aboutAudioPageTitle => 'Audio — field reference';

  @override
  String get audioRefTocCopyText => 'Copy summary';

  @override
  String get audioRefSection1Title => 'Signal chain & gain staging';

  @override
  String get audioRefSection1FormulasTitle => 'Level reference points';

  @override
  String get audioRefSection1Formula1 =>
      '0 dBu ≈ 0.775 V RMS — pro analog reference';

  @override
  String get audioRefSection1Formula2 =>
      '0 dBFS = maximum digital level before clipping — always keep headroom';

  @override
  String get audioRefSection1Formula3 =>
      'Gain staging: set each stage (source → console → amp) for a good signal-to-noise ratio without clipping';

  @override
  String get audioRefSection1FieldMarksTitle => 'Field tips';

  @override
  String get audioRefSection1FieldMark1 =>
      'Aim for an input level pulsing in the green/yellow, never sitting in the red continuously';

  @override
  String get audioRefSection1FieldMark2 =>
      'A poorly gain-staged system sounds noisy even at low volume: the issue is usually a clipped stage upstream';

  @override
  String get audioRefSection2Title => 'SPL & distance';

  @override
  String get audioRefSection2FormulaTitle => 'Inverse square law';

  @override
  String get audioRefSection2Formula1 =>
      'Every doubling of distance = -6 dB SPL in free field';

  @override
  String get audioRefSection2Formula2 =>
      'SPL(d2) = SPL(d1) - 20 × log10(d2 / d1)';

  @override
  String get audioRefSection2NoteTitle => 'Real-world nuance';

  @override
  String get audioRefSection2Note1 =>
      'Indoors, reflections (walls, ceiling) reduce the actual drop-off compared to theory';

  @override
  String get audioRefSection2Note2 =>
      'A well-designed line array falls off more slowly than a point source along the coverage axis';

  @override
  String get audioRefSection3Title => 'Delay alignment (time alignment)';

  @override
  String get audioRefSection3Paragraph =>
      'A secondary system (delay tower, front fill) must be delayed so its sound arrives at the same time as the main system, perceived as a single source.';

  @override
  String get audioRefSection3FormulaTitle => 'Basic formula';

  @override
  String get audioRefSection3Formula1 =>
      'Delay (ms) = distance between systems (m) / 0.343 m/ms (speed of sound ≈ 343 m/s)';

  @override
  String get audioRefSection3TipsTitle => 'Best practices';

  @override
  String get audioRefSection3Tip1 =>
      'Measure the actual distance between the two sources, not just the distance to the audience';

  @override
  String get audioRefSection3Tip2 =>
      'Add a few extra ms of delay (2-5 ms) to reinforce the precedence effect (Haas effect) and keep the main system as the perceived source';

  @override
  String get audioRefSection3Tip3 =>
      'Check by ear and/or with an analyzer (e.g. phase correlation) after setting';

  @override
  String get audioRefSection4Title => 'Sub directivity (cardioid / end-fire)';

  @override
  String get audioRefSection4Paragraph =>
      'A cardioid or end-fire arrangement reduces the low-end energy sent toward the stage/FOH while reinforcing it toward the audience, by playing with delay and polarity between subs.';

  @override
  String get audioRefSection4TypesTitle => 'Common configurations';

  @override
  String get audioRefSection4Type1 =>
      'End-fire: subs aligned in a row, the front one advanced and electronically delayed';

  @override
  String get audioRefSection4Type2 =>
      '2-sub cardioid: one front sub (normal), one rear sub polarity-inverted and delayed';

  @override
  String get audioRefSection4Type3 =>
      '3-sub cardioid: two front in phase, one rear inverted and delayed — best level/rear-rejection trade-off';

  @override
  String get audioRefSection5Title => 'Cabling & connectors';

  @override
  String get audioRefSection5XlrTitle => 'Balanced XLR';

  @override
  String get audioRefSection5XlrBullet1 =>
      'Always prefer a balanced link (XLR/TRS) over long distances to reject noise';

  @override
  String get audioRefSection5XlrBullet2 =>
      'Beyond ~50-100 m analog, consider a digital link (AES/EBU, Dante, etc.)';

  @override
  String get audioRefSection5SpeakonTitle => 'Speakon (loudspeakers)';

  @override
  String get audioRefSection5SpeakonBullet1 =>
      'Never use XLR for loudspeaker feeds: the power carried can damage equipment meant for line-level signal';

  @override
  String get audioRefSection5SpeakonBullet2 =>
      'Check the cable gauge is suited to the power and distance (voltage drop) before a long run';

  @override
  String get audioRefSection5GroundTitle => 'Ground & hum';

  @override
  String get audioRefSection5GroundBullet1 =>
      'A ground loop between two devices connected to mains through different paths can create 50/60 Hz hum';

  @override
  String get audioRefSection5GroundBullet2 =>
      'A ground lift or a DI box with galvanic isolation can fix this without cutting the safety earth';

  @override
  String get audioRefSection6Title => 'Hearing safety & best practices';

  @override
  String get audioRefSection6DontDoTitle => 'Avoid';

  @override
  String get audioRefSection6DontDoBullet1 =>
      'Exposing the audience or crew to more than 100 dB SPL continuously with no time limit';

  @override
  String get audioRefSection6DontDoBullet2 =>
      'Pushing a system beyond its rated power to compensate for poor placement';

  @override
  String get audioRefSection6WarningTitle => 'Exposure reference points';

  @override
  String get audioRefSection6WarningBullet1 =>
      '85 dB SPL: recommended limit for prolonged exposure (8h) without protection';

  @override
  String get audioRefSection6WarningBullet2 =>
      '100 dB SPL: only a few minutes before risk — most concerts exceed this level';

  @override
  String get audioRefSection6WarningBullet3 =>
      'Always use a system limiter on the output to protect the gear and the audience';

  @override
  String get audioRefSection7Title => 'Quick checklist';

  @override
  String get audioRefSection7QuickTitle => 'Before the show';

  @override
  String get audioRefSection7Bullet1 =>
      'Gain staging checked from source to amp, no clipping';

  @override
  String get audioRefSection7Bullet2 =>
      'Secondary system delays calculated and applied';

  @override
  String get audioRefSection7Bullet3 => 'System limiter active and set';

  @override
  String get audioRefSection7Bullet4 =>
      'Polarity checked between subs and tops (no cancellation)';

  @override
  String get audioRefSection7Bullet5 =>
      'SPL level measured at FOH and at the back of the room';

  @override
  String get audioRefFooterNote =>
      'These are general reference points — always check the manufacturer\'s guidelines and local regulations on sound levels.';

  @override
  String get aboutRfTitle => 'RF — wireless & Wi-Fi';

  @override
  String get aboutRfSubtitle =>
      'UHF bands, Wi-Fi, IM3 coexistence, antennas, RF scanning.';

  @override
  String get aboutRfPageTitle => 'RF — field reference';

  @override
  String get rfRefTocCopyText => 'Copy summary';

  @override
  String get rfRefSection1Title => 'RF spectrum basics';

  @override
  String get rfRefSection1FormulasTitle => 'Frequency / wavelength reference';

  @override
  String get rfRefSection1Formula1 =>
      'λ (m) = 300 / f (MHz) — approximate wavelength';

  @override
  String get rfRefSection1Formula2 =>
      'The higher the frequency, the shorter the wavelength and the shorter the free-space range';

  @override
  String get rfRefSection1FieldMarksTitle => 'Field tips';

  @override
  String get rfRefSection1FieldMark1 =>
      'The human body absorbs and reflects RF waves — the position of a wireless receiver on the body affects reception';

  @override
  String get rfRefSection1FieldMark2 =>
      'Always favor a direct line of sight between transmitter and receiver';

  @override
  String get rfRefSection2Title => 'UHF bands for wireless mics';

  @override
  String get rfRefSection2Paragraph =>
      'Wireless mics and in-ears mainly use the UHF band (470-694 MHz in Europe, depending on the country), shared with TV broadcasting — actual availability depends on local regulations.';

  @override
  String get rfRefSection2NoteTitle => 'Check before every date';

  @override
  String get rfRefSection2Note1 =>
      'Available bands vary by country — check local regulations (ANFR in France, Ofcom in the UK, etc.)';

  @override
  String get rfRefSection2Note2 =>
      'A band free in one place may be occupied by a TV transmitter or another provider elsewhere';

  @override
  String get rfRefSection3Title => 'Wi-Fi 2.4 GHz vs 5 GHz';

  @override
  String get rfRefSection3TableTitle => 'Key differences';

  @override
  String get rfRefSection3Bullet1 =>
      '2.4 GHz: 3 non-overlapping channels (1, 6, 11), better range, more congested (Bluetooth, high-band wireless mics, other networks)';

  @override
  String get rfRefSection3Bullet2 =>
      '5 GHz: many more non-overlapping channels, higher throughput, shorter range, generally less interference';

  @override
  String get rfRefSection3Bullet3 =>
      'For control/monitoring (consoles, visualization), prefer 5 GHz when possible';

  @override
  String get rfRefSection4Title => 'Coexistence & intermodulation (IM3)';

  @override
  String get rfRefSection4Paragraph =>
      'When several wireless transmitters operate together, their frequencies can create intermodulation products (IM3) that land on other used frequencies and cause interference.';

  @override
  String get rfRefSection4FormulaTitle => 'IM3 formula (3rd order)';

  @override
  String get rfRefSection4Formula1 => 'IM3 = 2×f1 − f2 and 2×f2 − f1';

  @override
  String get rfRefSection4Tip1 =>
      'The more wireless channels you add, the higher the risk of an IM3 product landing on a used frequency — hence the value of a frequency plan calculated in advance';

  @override
  String get rfRefSection5Title => 'Antennas & diversity';

  @override
  String get rfRefSection5Bullet1 =>
      'Diversity reception uses two slightly offset antennas to avoid cancellation zones (RF dead spots)';

  @override
  String get rfRefSection5Bullet2 =>
      'Space antennas at least a quarter wavelength apart, without lining them up directly with the transmitter';

  @override
  String get rfRefSection5Bullet3 =>
      'Avoid placing antennas directly on the ground or against a metal structure, which can detune or shield the signal';

  @override
  String get rfRefSection6Title => 'RF scan before a show';

  @override
  String get rfRefSection6Bullet1 =>
      'Always scan the band on site, at show time — the RF environment changes between day and evening (other providers, audience hotspots, etc.)';

  @override
  String get rfRefSection6Bullet2 =>
      'Note the occupied frequencies and document them for the next date at the same venue if possible';

  @override
  String get rfRefSection6Bullet3 =>
      'Keep a margin of free frequencies for a last-minute swap (faulty gear, unexpected interference)';

  @override
  String get rfRefSection7Title => 'Quick checklist';

  @override
  String get rfRefSection7Bullet1 => 'RF scan done at show time';

  @override
  String get rfRefSection7Bullet2 => 'Frequency plan calculated (IM3 checked)';

  @override
  String get rfRefSection7Bullet3 =>
      'Antennas in line of sight, properly spaced';

  @override
  String get rfRefSection7Bullet4 =>
      'UHF bands used comply with local regulations';

  @override
  String get rfRefFooterNote =>
      'RF regulations vary widely by country — always check locally authorized frequencies before a show.';

  @override
  String get aboutLaserTitle => 'Laser — physics & safety';

  @override
  String get aboutLaserSubtitle =>
      'How it works, scanners, classes, standards, NOHD/SZED/CZED.';

  @override
  String get aboutLaserPageTitle => 'Laser — field reference';

  @override
  String get laserRefTocCopyText => 'Copy summary';

  @override
  String get laserRefSection1Title => 'What is a laser?';

  @override
  String get laserRefSection1AcronymTitle => 'The LASER acronym';

  @override
  String get laserRefSection1AcronymBody =>
      'LASER stands for \"Light Amplification by Stimulated Emission of Radiation\".';

  @override
  String get laserRefSection1HowTitle => 'The physical principle';

  @override
  String get laserRefSection1HowBody =>
      'A gain medium (diode, DPSS crystal...) is \"pumped\" electrically or optically, triggering stimulated emission of photons. A resonant cavity (two mirrors, one partially reflective) amplifies this light, which comes out coherent, monochromatic and highly collimated — unlike an ordinary light source.';

  @override
  String get laserRefSection1TypesTitle => 'Common types in show lasers';

  @override
  String get laserRefSection1Type1 =>
      'Direct diode: compact, often used in RGB to mix colours';

  @override
  String get laserRefSection1Type2 =>
      'DPSS (Diode Pumped Solid State): a diode pumps a crystal, historically used for green and other specific wavelengths';

  @override
  String get laserRefSection2Title => 'How the beam draws: scanners and speed';

  @override
  String get laserRefSection2Paragraph =>
      'The beam is steered by two galvanometer mirrors (\"galvos\"), one for the X axis and one for the Y axis, spinning extremely fast. Unlike video (line-by-line raster scan), a laser show draws vector shapes, point by point, tracing the outline of the image.';

  @override
  String get laserRefSection2SpeedTitle => 'Scan speed';

  @override
  String get laserRefSection2Speed1 =>
      'Speed is measured in points per second (pps) or kilopoints per second (kpps)';

  @override
  String get laserRefSection2Speed2 =>
      'ILDA (International Laser Display Association) standardises the connector, the .ild file format, and a test pattern used to objectively benchmark a scanner';

  @override
  String get laserRefSection2FieldTitle => 'Field notes';

  @override
  String get laserRefSection2Field1 =>
      'The more points an image contains, the more pps are needed to avoid flicker — a smooth show typically runs around 20 to 30 kpps';

  @override
  String get laserRefSection2Field2 =>
      'The ILDA test pattern lets you compare two scanners on objective criteria (speed, accuracy, damping)';

  @override
  String get laserRefSection3Title => 'Laser classes & standards';

  @override
  String get laserRefSection3ClassesTitle => 'IEC 60825-1 classes';

  @override
  String get laserRefSection3Class1 =>
      'Class 1: safe under normal use, no special precautions';

  @override
  String get laserRefSection3Class2 =>
      'Class 1M / 2M: safe to the naked eye, but hazardous with optical instruments (binoculars, magnifier)';

  @override
  String get laserRefSection3Class3 =>
      'Class 2: visible, protected by the blink reflex (< 1 mW)';

  @override
  String get laserRefSection3Class4 =>
      'Class 3R: moderate risk, limited direct hazard';

  @override
  String get laserRefSection3Class5 =>
      'Class 3B: hazardous to the eye under direct viewing — most show lasers fall in this class or class 4';

  @override
  String get laserRefSection3Class6 =>
      'Class 4: hazardous to the eye and skin, fire risk — maximum precautions required';

  @override
  String get laserRefSection3StandardsTitle => 'Reference standards';

  @override
  String get laserRefSection3Standard1 =>
      'IEC 60825-1: product safety and laser classification';

  @override
  String get laserRefSection3Standard2 =>
      'IEC 60825-3: specific guidance for laser displays and shows (variable MPE concept depending on exposure duration)';

  @override
  String get laserRefSection3Standard3 =>
      'Local regulations: declaration/authorisation depending on power and country (e.g. FDA/CDRH 21 CFR 1040.10 in the US, with a variance procedure for shows)';

  @override
  String get laserRefSection3FieldNote =>
      'Always check local regulations before a show, especially for audience scanning and near an airport.';

  @override
  String get laserRefSection4Title => 'Safety measures';

  @override
  String get laserRefSection4Bullet1 =>
      'A trained Laser Safety Officer (LSO) is designated and responsible for the show';

  @override
  String get laserRefSection4Bullet2 =>
      'Key switch and emergency stop are easily accessible';

  @override
  String get laserRefSection4Bullet3 =>
      'An interlock cuts emission if a cover or housing is opened';

  @override
  String get laserRefSection4Bullet4 =>
      'Scan-fail detection cuts the beam if the galvos stop moving — essential for audience scanning';

  @override
  String get laserRefSection4Bullet5 =>
      'No static beam pointed at the audience — only audience scanning with dedicated protections and exposure calculations';

  @override
  String get laserRefSection4Bullet6 =>
      'Never aim at airspace, an aircraft, or an uncontrolled reflective surface (glass, mirror, screen)';

  @override
  String get laserRefSection5Title => 'NOHD, SZED, CZED explained';

  @override
  String get laserRefSection5Paragraph =>
      'These safety distances are calculated by the app\'s \"Safety zones\" tool from the beam\'s power, divergence and output diameter.';

  @override
  String get laserRefSection5NohdTitle =>
      'NOHD — Nominal Ocular Hazard Distance';

  @override
  String get laserRefSection5NohdBody =>
      'Nominal ocular hazard distance: beyond this distance, the beam\'s direct irradiance drops below the maximum permissible exposure (MPE) for a brief, accidental exposure. This is the baseline reference defined by IEC 60825-1.';

  @override
  String get laserRefSection5SzedTitle => 'SZED — Show Zone Exposure Distance';

  @override
  String get laserRefSection5SzedBody =>
      'Show zone exposure distance: marks the zone where the audience may be positioned during a show involving beam scanning (audience scanning), using a more cautious MPE threshold than the NOHD.';

  @override
  String get laserRefSection5CzedTitle =>
      'CZED — Controlled Zone Exposure Distance';

  @override
  String get laserRefSection5CzedBody =>
      'Controlled zone exposure distance: the most cautious of the three, reserved for the zone where only trained personnel (operators, technicians) may stand, accounting for potentially longer exposure.';

  @override
  String get laserRefSection5FieldNote =>
      'In the app, the lower the MPE threshold used, the larger the calculated distance — hence the order CZED > SZED > NOHD. These distances remain indicative: they don\'t replace an assessment by a qualified Laser Safety Officer or applicable local regulations.';

  @override
  String get laserRefSection6Title => 'Quick checklist';

  @override
  String get laserRefSection6Bullet1 =>
      'Laser class identified, declared if required';

  @override
  String get laserRefSection6Bullet2 =>
      'LSO designated and present throughout the show';

  @override
  String get laserRefSection6Bullet3 =>
      'NOHD/SZED/CZED zones calculated and marked out';

  @override
  String get laserRefSection6Bullet4 =>
      'Scan-fail detection active if audience scanning';

  @override
  String get laserRefSection6Bullet5 => 'Emergency stop tested and accessible';

  @override
  String get laserRefSection6Bullet6 =>
      'No aiming at airspace or an uncontrolled reflective surface';

  @override
  String get laserRefFooterNote =>
      'This information is general and educational — it does not replace Laser Safety Officer training or local regulations (IEC 60825, FDA/CDRH, aviation authorities...).';

  @override
  String get aboutRiggingTitle => 'Rigging';

  @override
  String get aboutRiggingSubtitle => 'Basics, bridles and angle factor';

  @override
  String get aboutRiggingPageTitle => 'Rigging — quick course';

  @override
  String get riggingRefTocCopyText => 'Copy summary';

  @override
  String get riggingRefSection1Title => 'Rigging basics';

  @override
  String get riggingRefSection2Title => '2-point bridle rigging';

  @override
  String get riggingRefSection3Title => 'Angle factor';

  @override
  String get riggingRefSection4Title => 'Checklist';

  @override
  String get riggingRefSection1Bullet1 =>
      'WLL (Working Load Limit): the maximum rated load for an accessory, as specified by the manufacturer.';

  @override
  String get riggingRefSection1Bullet2 =>
      'Safety factor: the ratio between breaking load and WLL, typically 5:1 or 10:1 depending on the equipment and regulations.';

  @override
  String get riggingRefSection1Bullet3 =>
      'Load chain: every link (hang point, sling, shackle, structure) must be rated for the full load — the weakest link sets the limit for the whole chain.';

  @override
  String get riggingRefSection2Bullet1 =>
      'A 2-point bridle splits the load between two slings forming an angle relative to vertical.';

  @override
  String get riggingRefSection2Bullet2 =>
      'The larger the angle from vertical, the higher the tension in each sling.';

  @override
  String get riggingRefSection2Bullet3 =>
      'Common recommendation: keep the included angle between the two legs under 90° to limit added tension.';

  @override
  String get riggingRefSection3FormulaTitle => 'Formula';

  @override
  String get riggingRefSection3Formula1 =>
      'Tension per sling = (Load / number of slings) × angle factor, where angle factor = 1 / cos(angle from vertical).';

  @override
  String get riggingRefSection3Bullet1 =>
      'Examples: 0° → factor 1.0; 45° → factor about 1.41; 60° → factor 2.0.';

  @override
  String get riggingRefSection3Bullet2 =>
      'The larger the angle from vertical, the faster the factor — and therefore the tension — increases.';

  @override
  String get riggingRefSection4Bullet1 =>
      'Check the WLL of every accessory (sling, shackle, carabiner, structure) before rigging.';

  @override
  String get riggingRefSection4Bullet2 =>
      'Calculate the actual tension per sling using the angle factor, not just the total load divided by the number of legs.';

  @override
  String get riggingRefSection4Bullet3 =>
      'Visually inspect accessories (deformation, corrosion, wear) before every use.';

  @override
  String get riggingRefSection4Bullet4 =>
      'Have the setup checked by a competent person or qualified rigger for heavy loads or complex configurations.';

  @override
  String get riggingRefFooterNote =>
      'This content is a general educational reminder and does not replace local standards, rigger training, or verification by a competent person.';

  @override
  String get aboutConsoleTitle => 'Console & patch';

  @override
  String get aboutConsoleSubtitle => 'Virtual console, GDTF and DMX patch';

  @override
  String get aboutConsolePageTitle => 'Console — quick course';

  @override
  String get consoleRefTocCopyText => 'Copy summary';

  @override
  String get consoleRefSection1Title => 'Virtual console & wireless DMX';

  @override
  String get consoleRefSection2Title => 'GDTF & GDTF Share';

  @override
  String get consoleRefSection3Title => 'Patch & universes';

  @override
  String get consoleRefSection4Title => 'Checklist';

  @override
  String get consoleRefSection1Paragraph =>
      'A virtual console lets you run a show from a tablet or smartphone, sending DMX over the network (Art-Net or sACN) instead of a direct DMX cable.';

  @override
  String get consoleRefSection1Bullet1 =>
      'Wi-Fi adds latency and dropout risk: reserve it for setup work, not for critical live cues without a wired fallback.';

  @override
  String get consoleRefSection1Bullet2 =>
      'Make sure the DMX-over-IP node/interface actually receives the correct Art-Net or sACN universe configured on the virtual console.';

  @override
  String get consoleRefSection1Bullet3 =>
      'Keep a wired backup (direct DMX or Ethernet) ready for critical moments of the show.';

  @override
  String get consoleRefSection2GdtfTitle => 'GDTF (General Device Type Format)';

  @override
  String get consoleRefSection2GdtfBody =>
      'A standardized file format describing a fixture\'s characteristics (DMX modes, color wheels, 3D geometry) for reliable import into any compatible console.';

  @override
  String get consoleRefSection2ShareTitle => 'GDTF Share';

  @override
  String get consoleRefSection2ShareBody =>
      'The official online database where manufacturers publish GDTF files for their fixtures, free to download for patching.';

  @override
  String get consoleRefSection3Bullet1 =>
      'A DMX universe holds 512 channels; each fixture uses one or more channels depending on its selected DMX mode.';

  @override
  String get consoleRefSection3Bullet2 =>
      'Always check the DMX mode actually set on the physical fixture — it must match the one selected in the console\'s patch.';

  @override
  String get consoleRefSection3Bullet3 =>
      'Documenting the patch (addresses, universes, modes) makes troubleshooting and handover to another operator much easier.';

  @override
  String get consoleRefSection4Bullet1 =>
      'Check the network connection (Wi-Fi or wired) between the virtual console and the DMX node before the show.';

  @override
  String get consoleRefSection4Bullet2 =>
      'Confirm every fixture is patched to the right universe and start address.';

  @override
  String get consoleRefSection4Bullet3 =>
      'Use an up-to-date GDTF file from GDTF Share rather than a generic profile.';

  @override
  String get consoleRefSection4Bullet4 =>
      'Plan a fallback in case of network or Wi-Fi dropout during the show.';

  @override
  String get consoleRefFooterNote =>
      'This content is a general reminder; refer to the manufacturer\'s documentation for specific DMX modes and procedures.';

  @override
  String get aboutCinemaTitle => 'Cinema';

  @override
  String get aboutCinemaSubtitle => 'Camera, depth of field and frame rate';

  @override
  String get aboutCinemaPageTitle => 'Cinema — quick course';

  @override
  String get cinemaRefTocCopyText => 'Copy summary';

  @override
  String get cinemaRefSection1Title => 'Camera basics';

  @override
  String get cinemaRefSection2Title => 'Depth of field & focus';

  @override
  String get cinemaRefSection3Title => 'Frame rate & shutter';

  @override
  String get cinemaRefSection4Title => 'Checklist';

  @override
  String get cinemaRefSection1Bullet1 =>
      'Sensor: the light-sensitive surface that captures the image; its size affects field of view and depth of field for a given focal length.';

  @override
  String get cinemaRefSection1Bullet2 =>
      'Focal length: the distance (in mm) that determines the angle of view — a short focal length is wide-angle, a long one is telephoto.';

  @override
  String get cinemaRefSection1Bullet3 =>
      'Aperture (f/): the size of the diaphragm opening, controlling both the amount of light entering and the depth of field.';

  @override
  String get cinemaRefSection2Paragraph =>
      'Depth of field is the zone of acceptable sharpness in front of and behind the subject in focus.';

  @override
  String get cinemaRefSection2Bullet1 =>
      'A wide aperture (f/1.4, f/2) gives shallow depth of field (blurred background).';

  @override
  String get cinemaRefSection2Bullet2 =>
      'A narrow aperture (f/11, f/16) gives extended depth of field (everything in focus).';

  @override
  String get cinemaRefSection3FormulaTitle => 'Shutter angle formula';

  @override
  String get cinemaRefSection3Formula1 =>
      'Shutter speed = 1 / (2 × frame rate in fps) for a 180° shutter angle, the standard reference in filmmaking.';

  @override
  String get cinemaRefSection3Bullet1 =>
      '24 fps is the classic cinema frame rate; 25 or 30 fps are common in broadcast depending on the video standard (PAL/NTSC).';

  @override
  String get cinemaRefSection3Bullet2 =>
      'A narrower shutter angle (90°, 45°) gives a more staccato look, often used for stylized action scenes.';

  @override
  String get cinemaRefSection4Bullet1 =>
      'Check that the camera frame rate matches the frequency of light sources (to avoid flicker).';

  @override
  String get cinemaRefSection4Bullet2 =>
      'Choose aperture based on the desired depth-of-field look, not just exposure.';

  @override
  String get cinemaRefSection4Bullet3 =>
      'Keep a consistent shutter angle throughout the shoot for a uniform motion texture.';

  @override
  String get cinemaRefSection4Bullet4 =>
      'Always test under real set conditions before the final shoot.';

  @override
  String get cinemaRefFooterNote =>
      'This content is a general educational reminder; final settings depend on the equipment and creative intent.';

  @override
  String get aboutTimecodeTitle => 'Timecode';

  @override
  String get aboutTimecodeSubtitle => 'SMPTE, drop-frame and frame rates';

  @override
  String get aboutTimecodePageTitle => 'Timecode — quick course';

  @override
  String get timecodeRefTocCopyText => 'Copy summary';

  @override
  String get timecodeRefSection1Title => 'What is SMPTE timecode';

  @override
  String get timecodeRefSection2Title => 'Drop-frame vs non-drop-frame';

  @override
  String get timecodeRefSection3Title => 'Common frame rates';

  @override
  String get timecodeRefSection4Title => 'Checklist';

  @override
  String get timecodeRefSection1FormatTitle => 'Format';

  @override
  String get timecodeRefSection1FormatBody =>
      'HH:MM:SS:FF — hours, minutes, seconds and frame number, resetting each time a full second\'s worth of frames has elapsed.';

  @override
  String get timecodeRefSection1Bullet1 =>
      'SMPTE timecode synchronizes picture, sound and lighting to a shared time reference.';

  @override
  String get timecodeRefSection1Bullet2 =>
      'Each frame carries a unique address, enabling precise referencing in post-production as well as live show control.';

  @override
  String get timecodeRefSection2Paragraph =>
      'Drop-frame (DF) exists because some frame rates (29.97 fps) are not a whole number of frames per second, which causes the timecode to drift from real time if left uncorrected.';

  @override
  String get timecodeRefSection2Bullet1 =>
      'Non-drop-frame (NDF): counts frames without skipping; simple, but drifts slightly from real time at 29.97 fps.';

  @override
  String get timecodeRefSection2Bullet2 =>
      'Drop-frame (DF): periodically skips frame numbers (not actual frames) to realign the timecode with real time.';

  @override
  String get timecodeRefSection3Bullet1 =>
      '24 fps: the classic cinema frame rate.';

  @override
  String get timecodeRefSection3Bullet2 =>
      '25 fps: the PAL standard (Europe); 30 fps (or 29.97 DF/NDF): the NTSC standard (North America, Japan).';

  @override
  String get timecodeRefSection3Bullet3 =>
      '50 fps and 59.94/60 fps: high frame rates used in broadcast and for slow motion.';

  @override
  String get timecodeRefSection3Bullet4 =>
      'Always check that all sources (camera, sound, lighting, video) use the same reference frame rate.';

  @override
  String get timecodeRefSection4Bullet1 =>
      'Confirm the frame rate and mode (DF/NDF) on all sources before the show or shoot begins.';

  @override
  String get timecodeRefSection4Bullet2 =>
      'Make sure the master timecode source (master clock) is clearly identified and distributed to all devices.';

  @override
  String get timecodeRefSection4Bullet3 =>
      'If drift is suspected, compare the displayed timecode against a reference clock over a long enough period.';

  @override
  String get timecodeRefFooterNote =>
      'This content is a general reminder; refer to the SMPTE specifications and the documentation of the devices in use.';

  @override
  String get aboutConversionsTitle => 'Conversions & BPM';

  @override
  String get aboutConversionsSubtitle => 'Units, BPM and DMX at a glance';

  @override
  String get aboutConversionsPageTitle => 'Conversions & BPM — quick course';

  @override
  String get conversionsRefTocCopyText => 'Copy summary';

  @override
  String get conversionsRefSection1Title => 'Why convert';

  @override
  String get conversionsRefSection2Title => 'BPM ↔ milliseconds';

  @override
  String get conversionsRefSection3Title => 'DMX ↔ percentage / 8-bit ↔ 16-bit';

  @override
  String get conversionsRefSection4Title => 'Checklist';

  @override
  String get conversionsRefSection1Paragraph =>
      'Units often get mixed up at FOH (musical BPM, delay milliseconds, DMX percentages, 8/16-bit values): converting quickly and accurately avoids mismatches between lighting, sound and video cues.';

  @override
  String get conversionsRefSection2FormulaTitle => 'Formula';

  @override
  String get conversionsRefSection2Formula1 =>
      'Beat duration (ms) = 60,000 / BPM.';

  @override
  String get conversionsRefSection2Bullet1 =>
      'Example: at 120 BPM, a beat lasts 500 ms; a sixteenth note (1/4 beat) lasts 125 ms.';

  @override
  String get conversionsRefSection2Bullet2 =>
      'Useful for syncing a lighting effect, an audio delay or a video clip to a track\'s tempo.';

  @override
  String get conversionsRefSection3Bullet1 =>
      'An 8-bit DMX value ranges from 0 to 255; as a percentage, 255 corresponds to 100%.';

  @override
  String get conversionsRefSection3Bullet2 =>
      'In 16-bit, two combined channels (fine/coarse) give a resolution from 0 to 65,535 for finer control (dimmer, pan/tilt).';

  @override
  String get conversionsRefSection3Bullet3 =>
      'Check the mode (8-bit or 16-bit) actually configured on the fixture before patching, otherwise values will be mismatched.';

  @override
  String get conversionsRefSection4Bullet1 =>
      'Always check the displayed unit before entering a value (ms, BPM, %, 8-bit, 16-bit).';

  @override
  String get conversionsRefSection4Bullet2 =>
      'Recalculate rather than round from memory for critical values (sync, safety).';

  @override
  String get conversionsRefSection4Bullet3 =>
      'Document the conversions used in the show\'s tech rider to make handover easier.';

  @override
  String get conversionsRefFooterNote =>
      'This content is a general reminder; refer to the device\'s documentation for its exact resolution modes.';

  @override
  String get aboutCategoryNetworkTitle => 'Network & protocols';

  @override
  String get aboutCategoryAudioRfTitle => 'Audio & RF';

  @override
  String get aboutCategoryVideoCinemaTitle => 'Video & cinema';

  @override
  String get aboutCategoryLightingTitle => 'Lighting, laser & console';

  @override
  String get aboutCategoryRiggingElecTitle => 'Rigging & electricity';

  @override
  String get aboutCategoryToolsTitle => 'Practical tools';

  @override
  String get pinnedItemsTitle => 'My pins';

  @override
  String get homePinnedItemsSubtitle =>
      'Quickly find your pinned tools and references.';

  @override
  String get pinnedItemsEmpty => 'No pinned tools or references yet.';

  @override
  String get fixtureInfoSectionIdentification => 'Identification';

  @override
  String get fixtureInfoLabelName => 'Name';

  @override
  String get fixtureInfoLabelId => 'ID';

  @override
  String get fixtureInfoSectionDmx => 'DMX / Network';

  @override
  String get fixtureInfoLabelUniverse => 'Universe';

  @override
  String get fixtureInfoLabelAddress => 'Address';

  @override
  String get fixtureInfoLabelMode => 'Mode';

  @override
  String get fixtureInfoLabelChannelCount => 'Channels';

  @override
  String get fixtureInfoLabelGdtfSpec => 'GDTF file';

  @override
  String get fixtureInfoSectionPhysical => 'Physical';

  @override
  String get fixtureInfoLabelWeight => 'Weight';

  @override
  String fixtureInfoValueKg(Object kg) {
    return '$kg kg';
  }

  @override
  String get fixtureInfoLabelDimensions => 'Dimensions';

  @override
  String fixtureInfoValueDimensionsCm(
      Object heightCm, Object lengthCm, Object widthCm) {
    return '$lengthCm × $widthCm × $heightCm cm';
  }

  @override
  String get fixtureInfoLabelLegHeight => 'Leg height';

  @override
  String fixtureInfoValueCm(Object cm) {
    return '$cm cm';
  }

  @override
  String get fixtureInfoSectionElectrical => 'Electrical';

  @override
  String get fixtureInfoLabelPower => 'Power';

  @override
  String fixtureInfoValueWatts(Object watts) {
    return '$watts W';
  }

  @override
  String get fixtureInfoSectionEnvironment => 'Environment';

  @override
  String get fixtureInfoLabelOperatingTemp => 'Operating temperature';

  @override
  String fixtureInfoValueTempRange(Object highC, Object lowC) {
    return '$lowC°C – $highC°C';
  }

  @override
  String get fixtureInfoNoGdtfData =>
      'No physical information available (GDTF missing or incomplete).';

  @override
  String get patch3dTitle => '3D viewer';

  @override
  String get patch3dOpenButton => 'View in 3D';

  @override
  String get patch3dResetCameraTooltip => 'Recenter camera';

  @override
  String get patch3dFiltersTooltip => 'Filters and colors';

  @override
  String get patch3dZoomToFitTooltip => 'Fit all';

  @override
  String get patch3dCameraViewsTooltip => 'Camera views';

  @override
  String get patch3dCameraViewFront => 'Front';

  @override
  String get patch3dCameraViewTop => 'Top';

  @override
  String get patch3dCameraViewSide => 'Side';

  @override
  String get patch3dCameraViewIso => 'Isometric';

  @override
  String get patch3dBackgroundColorLabel => 'Background color';

  @override
  String patch3dEntriesWithoutPosition(Object count) {
    return '$count fixture(s) without 3D position (no Matrix in the MVR).';
  }

  @override
  String get patch3dNoPositionedFixtures =>
      'No positioned fixtures to display. Import an MVR containing 3D positions.';

  @override
  String get patch3dMissingModelTitle => 'Missing 3D models';

  @override
  String patch3dMissingModelBody(Object count) {
    return '$count fixture type(s) have no 3D model in their GDTF. A generic cube (30×30×30 cm) is used instead:';
  }

  @override
  String get patch3dColorModeLabel => 'Coloring';

  @override
  String get patch3dColorModeByType => 'By type';

  @override
  String get patch3dColorModeByUniverse => 'By universe';

  @override
  String get patch3dFilterUniverseLabel => 'Universe';

  @override
  String get patch3dFilterTypeLabel => 'Fixture type';

  @override
  String get patch3dFilterShowAll => 'Show all';

  @override
  String get gdtfWizardSuggestionOpen => 'Open';

  @override
  String get gdtfWizardSuggestionClosed => 'Closed';

  @override
  String gdtfWizardSuggestionGoboSlot(int n) {
    return 'Gobo $n';
  }

  @override
  String gdtfWizardSuggestionColorSlot(int n) {
    return 'Color $n';
  }

  @override
  String get gdtfWizardColorWhite => 'White';

  @override
  String get gdtfWizardColorRed => 'Red';

  @override
  String get gdtfWizardColorGreen => 'Green';

  @override
  String get gdtfWizardColorBlue => 'Blue';

  @override
  String get gdtfWizardColorYellow => 'Yellow';

  @override
  String get gdtfWizardColorCyan => 'Cyan';

  @override
  String get gdtfWizardColorMagenta => 'Magenta';

  @override
  String get gdtfWizardColorRainbow => 'Rainbow';

  @override
  String get gdtfWizardStrobeSlowToFast => 'Strobe slow → fast';

  @override
  String get gdtfWizardStrobeRandom => 'Random strobe';

  @override
  String get gdtfWizardAppBarTitle => 'Manual GDTF wizard';

  @override
  String get gdtfWizardStepTitleStyle => 'Fixture style';

  @override
  String get gdtfWizardStepTitleFunction => 'Function';

  @override
  String get gdtfWizardStepTitleChannels => 'Channels';

  @override
  String get gdtfWizardStepTitlePixels => 'Pixels';

  @override
  String get gdtfWizardStepTitleStructure => 'Structure';

  @override
  String gdtfWizardStepHeader(int step, String title) {
    return 'Step $step/5 — $title';
  }

  @override
  String get gdtfWizardErrStyle => 'Choose a fixture style to continue.';

  @override
  String get gdtfWizardErrFunction =>
      'Select at least one function (wash, spot or beam).';

  @override
  String get gdtfWizardErrChannels =>
      'Check at least one channel — the fixture has to control something!';

  @override
  String get gdtfWizardErrPixelCount =>
      'You need at least 2 pixels/instances for a multi-pixel structure.';

  @override
  String get gdtfWizardErrRepeatCount =>
      'Select at least 2 repeatable channels (e.g. Red + Green, or Pan/Tilt) so each pixel is properly recognized as a distinct instance.';

  @override
  String get gdtfWizardErrRowsCols =>
      'Enter a valid number of rows and columns.';

  @override
  String get gdtfWizardErrModeName => 'Give this DMX mode a name.';

  @override
  String get gdtfWizardStyleIntro => 'What type of fixture are you creating?';

  @override
  String get gdtfWizardStyleLyreTitle => 'Moving head';

  @override
  String get gdtfWizardStyleLyreSubtitle =>
      'Motorized head with pan/tilt — spot, wash or beam moving head.';

  @override
  String get gdtfWizardStyleParTitle => 'PAR / Fixed';

  @override
  String get gdtfWizardStyleParSubtitle =>
      'Static fixture, no movement (LED PAR, fixed profile…).';

  @override
  String get gdtfWizardStyleBarreTitle => 'Bar';

  @override
  String get gdtfWizardStyleBarreSubtitle =>
      'Linear bar, often pixel-mapped (LED bar, X4 Bar…).';

  @override
  String get gdtfWizardPanTiltCheckTitle => 'This fixture has a Pan/Tilt motor';

  @override
  String get gdtfWizardPanTiltCheckSubtitle =>
      'Adds the Pan/Tilt channels in 16 bits (GDTF standard).';

  @override
  String get gdtfWizardFunctionIntro =>
      'Which function(s) does this fixture have? (multiple choice)';

  @override
  String get gdtfWizardFunctionWash => 'Wash';

  @override
  String get gdtfWizardFunctionSpot => 'Spot';

  @override
  String get gdtfWizardFunctionBeam => 'Beam';

  @override
  String get gdtfWizardFunctionHint =>
      'This just pre-checks useful channels for the next step (Wash → Frost/Zoom, Spot → Gobo/Focus/Prism, Beam → tight beam). You can adjust everything right after.';

  @override
  String get gdtfWizardChannelsIntro => 'Check the fixture\'s DMX channels.';

  @override
  String get gdtfWizardSectionIntensity => 'INTENSITY';

  @override
  String get gdtfWizardChannelDimmer => 'Dimmer';

  @override
  String get gdtfWizardChannelStrobe => 'Shutter / Strobe';

  @override
  String get gdtfWizardSectionColor => 'COLOR';

  @override
  String get gdtfWizardChannelCto => 'CTO wheel (color temperature)';

  @override
  String get gdtfWizardChannelColorMacro => 'Color macro (presets)';

  @override
  String get gdtfWizardSectionPosition => 'POSITION';

  @override
  String get gdtfWizardPanTiltNote =>
      'Pan/Tilt added automatically (16 bits). For a fixture with several independent moving heads, you\'ll be able to split it per head in the Pixels step.';

  @override
  String get gdtfWizardSectionBeamShaping => 'BEAM';

  @override
  String get gdtfWizardChannelZoom => 'Zoom';

  @override
  String get gdtfWizardChannelFocus => 'Focus';

  @override
  String get gdtfWizardChannelIris => 'Iris';

  @override
  String get gdtfWizardChannelFrost => 'Frost';

  @override
  String get gdtfWizardChannelPrism => 'Prism';

  @override
  String get gdtfWizardChannelPrismRot => 'Prism rotation';

  @override
  String get gdtfWizardSectionGobos => 'GOBOS';

  @override
  String get gdtfWizardChannelGobo1 => 'Gobo wheel 1';

  @override
  String get gdtfWizardChannelGobo1Rot => 'Gobo 1 rotation';

  @override
  String get gdtfWizardChannelGobo2 => 'Gobo wheel 2';

  @override
  String get gdtfWizardChannelGobo2Rot => 'Gobo 2 rotation';

  @override
  String get gdtfWizardSectionEffectsControl => 'EFFECTS & CONTROL';

  @override
  String get gdtfWizardChannelEffects => 'Effects / macros';

  @override
  String get gdtfWizardChannelReset => 'Reset';

  @override
  String get gdtfWizardSlotsHint =>
      'Slots (one per line, optional) — e.g. Open, Gobo 1…';

  @override
  String get gdtfWizardSlotsTooltip => 'Suggestion';

  @override
  String get gdtfWizardChannelPanTiltPerHead => 'Pan/Tilt (per head)';

  @override
  String get gdtfWizardPixelsIntro =>
      'Does this fixture have several separately controllable pixels/cells (LED matrix, pixel bar…)?';

  @override
  String get gdtfWizardMultiplePixelsTitle => 'Multiple pixels / instances';

  @override
  String get gdtfWizardMultiplePixelsSubtitle =>
      'Otherwise, all channels checked in the previous step stay unique (a single output).';

  @override
  String get gdtfWizardSectionPixelCount => 'NUMBER OF PIXELS';

  @override
  String get gdtfWizardSectionPixelContent => 'CONTENTS OF ONE PIXEL';

  @override
  String get gdtfWizardNoRepeatableChannels =>
      'No repeatable channel yet. Go back to the \"Style\" step (Pan/Tilt) or \"Channels\" step (Dimmer, Shutter/Strobe, color…) and check at least one attribute to repeat per head/pixel.';

  @override
  String gdtfWizardRepeatPerPixelSubtitle(String label) {
    return 'One channel per pixel (e.g. $label 1, $label 2…)';
  }

  @override
  String get gdtfWizardRepeatGlobalSubtitle =>
      'Stays a single global channel for the whole fixture';

  @override
  String get gdtfWizardModeNameLabel => 'DMX mode name';

  @override
  String get gdtfWizardModeNameHint => 'e.g. Standard, 16-bit, Pixel Mode…';

  @override
  String get gdtfWizardSingleOutputNote =>
      'Single-output fixture (no multiple pixels): nothing to configure here, each checked channel stays unique.';

  @override
  String get gdtfWizardSectionLayout => 'LAYOUT';

  @override
  String get gdtfWizardArrangementLinearTitle => 'Linear bar';

  @override
  String gdtfWizardArrangementLinearSubtitle(int count) {
    return 'Pixels aligned in a row (e.g. X4 Bar). Numbered 1 to $count.';
  }

  @override
  String get gdtfWizardArrangementMatrixTitle => 'Matrix (grid)';

  @override
  String get gdtfWizardArrangementMatrixSubtitle =>
      'Pixels arranged in rows × columns (e.g. LED wall, JDC1 pixel curve).';

  @override
  String get gdtfWizardArrangementModulesTitle => 'Independent modules';

  @override
  String get gdtfWizardArrangementModulesSubtitle =>
      'Several identical heads/modules on the same chassis (e.g. JDC1).';

  @override
  String get gdtfWizardRowsLabel => 'Rows';

  @override
  String get gdtfWizardColsLabel => 'Columns';

  @override
  String gdtfWizardMatrixTotal(int count) {
    return 'Total: $count pixels (numbered row by row).';
  }

  @override
  String get gdtfWizardModulesNote =>
      'Each module can have its own color/dimmer/strobe AND its own zoom/focus/iris/frost/prism/gobo — go back to the \"Pixels\" step and check, for each relevant beam channel, that it should repeat per module rather than stay shared by all.';

  @override
  String get gdtfWizardCancel => 'Cancel';

  @override
  String get gdtfWizardBack => 'Back';

  @override
  String get gdtfWizardValidateAndEdit => 'Confirm and edit';

  @override
  String get gdtfWizardNext => 'Next';

  @override
  String get gdtfWizardDefaultModeName => 'Manual';

  @override
  String get gdtfWizardOrDivider => 'OR';

  @override
  String get gdtfWizardManualButtonLabel =>
      'Manual wizard (no PDF) — style, channels, pixels…';

  @override
  String get gdtfWizardColorModeNone => 'None';

  @override
  String get gdtfWizardColorModeRgb => 'RGB';

  @override
  String get gdtfWizardColorModeRgbw => 'RGB + White';

  @override
  String get gdtfWizardColorModeRgbwaUv => 'RGB + White + Amber + UV';

  @override
  String get gdtfWizardColorModeCmy => 'CMY (Cyan/Magenta/Yellow)';

  @override
  String get gdtfWizardColorModeWheel => 'Color wheel';

  @override
  String get gdtfWizardColorAmber => 'Amber';

  @override
  String get gdtfWizardColorUv => 'UV';

  @override
  String get gdtfWizardChannelCtoShort => 'CTO';

  @override
  String get gdtfManualTab => 'Manual wizard';

  @override
  String get gdtfWizardManualTabTitle => 'Create a GDTF without a PDF';

  @override
  String get gdtfWizardManualTabIntro =>
      'No PDF manual on hand, or the fixture is too simple for one? Describe your fixture in 5 steps (style, functions, channels, pixels, structure) and the app builds a compliant GDTF directly — no AI, no upload.';

  @override
  String get gdtfWizardSlotsAddButton => 'Add';

  @override
  String get gdtfWizardSlotsRowHint => 'Slot name';

  @override
  String get gdtfWizardSlotsRemoveTooltip => 'Remove';

  @override
  String get gdtfWizardSlotsEmptyHint =>
      'No named slots yet — add one or use a suggestion.';

  @override
  String get ma3CalcTitle => 'MA3 parameters';

  @override
  String get ma3CalcTileDescription =>
      'How many parameters does your show need, and how many PUs?';

  @override
  String get ma3CalcTabMvr => 'From an MVR';

  @override
  String get ma3CalcTabList => 'Fixture list';

  @override
  String get ma3CalcAddFixture => 'Add a fixture';

  @override
  String get ma3CalcAddSheetTitle => 'Which fixture?';

  @override
  String get ma3CalcAddSheetSubtitle =>
      'Search GDTF Share, import a .gdtf or type the value yourself.';

  @override
  String get ma3CalcSearchHint => 'e.g. MAC Aura, Robe Spiider…';

  @override
  String get ma3CalcSearchFailed =>
      'Search unavailable right now. Check your connection.';

  @override
  String get ma3CalcNoResult =>
      'No results. Try another name, or manual entry.';

  @override
  String get ma3CalcImportGdtf => '.gdtf file';

  @override
  String get ma3CalcManualEntry => 'Manual entry';

  @override
  String get ma3CalcManualName => 'Fixture name';

  @override
  String get ma3CalcChooseMode => 'Which DMX mode?';

  @override
  String ma3CalcModeSummary(int params, int channels) {
    return '$params MA3 params · $channels DMX channels';
  }

  @override
  String get ma3CalcModeUnknown => 'Mode with no readable channels';

  @override
  String get ma3CalcHowMany => 'How many fixtures?';

  @override
  String get ma3CalcDownloadFailed => 'Could not download the GDTF.';

  @override
  String get ma3CalcGdtfUnreadable =>
      'This GDTF can\'t be read (damaged file?).';

  @override
  String get ma3CalcGdtfNoMode => 'No DMX mode in this GDTF.';

  @override
  String ma3CalcNotGdtf(String name) {
    return '\"$name\" is not a .gdtf file.';
  }

  @override
  String ma3CalcNotMvr(String name) {
    return '\"$name\" is not an .mvr file.';
  }

  @override
  String get ma3CalcPickFailed => 'Couldn\'t open the file.';

  @override
  String get ma3CalcMvrUnreadable =>
      'This MVR can\'t be read (not a valid archive).';

  @override
  String get ma3CalcMvrNoScene => 'No GeneralSceneDescription.xml in this MVR.';

  @override
  String get ma3CalcMvrNoFixtures => 'No fixtures in this MVR.';

  @override
  String get ma3CalcMvrEmptyTitle => 'Drop in your MVR 🎛️';

  @override
  String get ma3CalcMvrEmptyBody =>
      'Vectorworks, Capture, grandMA3, Depence export… We count the fixtures, read their GDTFs and tell you how many parameters (and PUs) you need.';

  @override
  String get ma3CalcPickMvr => 'Choose an .mvr file';

  @override
  String get ma3CalcChangeFile => 'Change';

  @override
  String get ma3CalcListEmptyTitle => 'Your rig, fixture by fixture';

  @override
  String get ma3CalcListEmptyBody =>
      'Like 6 × MAC Aura, 23 × Studio Color… Add your fixtures, pick the mode and the total shows up on its own.';

  @override
  String get ma3CalcYourSystem => 'Your console';

  @override
  String get ma3CalcSafetyMargin => 'Safety margin';

  @override
  String get ma3CalcNoMargin => 'None';

  @override
  String get ma3CalcTotalParams => 'MA3 parameters';

  @override
  String ma3CalcFixturesAndUniverses(int fixtures, int universes) {
    return '$fixtures fixtures · ≈ $universes DMX universes';
  }

  @override
  String ma3CalcWithMargin(int percent, String value) {
    return 'With $percent% margin: $value';
  }

  @override
  String get ma3CalcCopySummary => 'Copy summary';

  @override
  String ma3CalcVerdictSessionMax(String max) {
    return 'Over $max parameters: that\'s the maximum of a grandMA3 session.';
  }

  @override
  String ma3CalcVerdictOnPcTooSmall(String max) {
    return 'onPC tops out at $max parameters';
  }

  @override
  String get ma3CalcVerdictOnPcTooSmallSub =>
      'You need a grandMA3 console (+ PUs if needed): pick one above to see the setup.';

  @override
  String get ma3CalcVerdictOnPcOk => 'onPC is enough 👌';

  @override
  String ma3CalcVerdictOnPcOkSub(String max) {
    return 'Any onPC hardware (command wing, fader wing, node 4k, rack-unit…) unlocks $max parameters.';
  }

  @override
  String ma3CalcVerdictBaseOk(String console) {
    return 'Your $console is enough, no PU needed 🎉';
  }

  @override
  String ma3CalcVerdictCapacity(String capacity) {
    return 'Total capacity: $capacity parameters.';
  }

  @override
  String ma3CalcVerdictAddPu(String units) {
    return 'Add $units';
  }

  @override
  String ma3CalcVerdictXlOnly(int count) {
    return 'Or, simpler: $count × PU XL.';
  }

  @override
  String ma3CalcUnknownNotCounted(int count) {
    return '$count fixture(s) without data are not counted: fix them below.';
  }

  @override
  String ma3CalcFixtureTypes(int count) {
    return 'Fixture types ($count)';
  }

  @override
  String ma3CalcMvrCounts(int fixtures, int unpatched) {
    return '$fixtures fixtures · $unpatched unpatched';
  }

  @override
  String ma3CalcMultipatchNote(int count) {
    return 'Including $count multipatch, counted to be safe.';
  }

  @override
  String ma3CalcPerUnit(int params) {
    return '$params params per fixture';
  }

  @override
  String get ma3CalcUnknownParams => 'Unknown parameters';

  @override
  String get ma3CalcTapToFix => 'Tap to enter the value yourself →';

  @override
  String get ma3CalcSwipeHint =>
      'Swipe a row left to delete it · tap it to fix its parameters.';

  @override
  String get ma3CalcClear => 'Clear';

  @override
  String get ma3CalcClearListTitle => 'Clear the list?';

  @override
  String get ma3CalcClearListBody =>
      'All fixtures in the list will be removed.';

  @override
  String get ma3CalcCancel => 'Cancel';

  @override
  String get ma3CalcOk => 'OK';

  @override
  String get ma3CalcParamsPerUnitTitle => 'Parameters per fixture';

  @override
  String get ma3CalcParamsUnit => 'params';

  @override
  String ma3CalcGdtfValue(int value) {
    return 'Value computed from the GDTF: $value';
  }

  @override
  String get ma3CalcParamsHelp =>
      'Tip: 1 parameter = 1 DMX channel, 16-bit \"fine\" channels don\'t count.';

  @override
  String get ma3CalcBackToGdtf => 'Use GDTF value';

  @override
  String get ma3CalcReliabilityOkTitle => 'GDTFs look complete ✅';

  @override
  String get ma3CalcReliabilityOkBody =>
      'All modes were found and are consistent. The result is still only as good as these GDTFs.';

  @override
  String ma3CalcReliabilityWarnTitle(int count) {
    return '$count fixture type(s) to check';
  }

  @override
  String get ma3CalcReliabilityWarnBody =>
      'Some GDTFs look incomplete or inconsistent: the total may be wrong. Details under each fixture.';

  @override
  String ma3CalcReliabilityBadTitle(int count) {
    return '$count fixture type(s) without data';
  }

  @override
  String get ma3CalcReliabilityBadBody =>
      'Missing GDTF or mode not found: these fixtures aren\'t counted, so the total is too low. Tap them to enter the value.';

  @override
  String get ma3CalcDisclaimer =>
      'The result is based on the GDTFs. If a GDTF is incomplete or wrong, so is the result. Always double-check in grandMA3 (System Information window or Patch › DMX Universes, Coarse Params column).';

  @override
  String get ma3CalcDisclaimerShort =>
      'Based on the GDTFs: double-check in grandMA3.';

  @override
  String get ma3CalcHowTitle => 'How is it calculated?';

  @override
  String get ma3CalcHowBody =>
      'For grandMA3, 1 parameter = 1 controlled attribute = 1 \"coarse\" DMX channel. Fine channels (16/24-bit) are free and virtual channels (virtual dimmer…) don\'t count towards the licence. Multi-instance fixtures (pixels, cells) are expanded instance by instance. The recommendation favours the fewest units.';

  @override
  String get ma3CalcHowHardware => 'Parameters per hardware (MA docs, v2.3)';

  @override
  String ma3CalcHowSessionMax(String max) {
    return 'Session maximum: $max';
  }

  @override
  String get ma3CalcIssueGdtfMissing =>
      'GDTF missing from the MVR: parameters unknown.';

  @override
  String get ma3CalcIssueUnreadable => 'GDTF can\'t be read.';

  @override
  String ma3CalcIssueModeMissing(String modes) {
    return 'No mode given in the MVR. GDTF modes: $modes';
  }

  @override
  String ma3CalcIssueModeNotFound(String mode, String modes) {
    return 'Mode \"$mode\" not found in the GDTF. Available: $modes';
  }

  @override
  String get ma3CalcIssueModeGuessed =>
      'No mode in the MVR: the GDTF\'s only mode was used.';

  @override
  String ma3CalcIssueModePartial(String mode) {
    return 'Mode matched by similar name: \"$mode\".';
  }

  @override
  String get ma3CalcIssueNoChannels => 'This mode has no DMX channels.';

  @override
  String ma3CalcIssueNoFunction(int count) {
    return '$count channel(s) with no function or attribute: GDTF probably incomplete.';
  }

  @override
  String ma3CalcIssueOverlap(int count) {
    return '$count channel(s) on an already used DMX address: inconsistent GDTF.';
  }

  @override
  String ma3CalcIssueGaps(int count) {
    return '$count empty DMX address(es) in the mode: missing channels?';
  }

  @override
  String ma3CalcIssueNameMismatch(int announced, int found) {
    return 'The mode name says $announced channels, the GDTF describes $found.';
  }

  @override
  String ma3CalcIssueUnknownGeometry(int count) {
    return '$count channel(s) linked to a missing geometry.';
  }

  @override
  String get ma3CalcIssueManual => 'Value entered manually.';

  @override
  String ma3CalcMarginChip(int percent) {
    return '+$percent%';
  }

  @override
  String ma3CalcHwLine(String name, String value) {
    return '$name: $value';
  }

  @override
  String ma3CalcHowOnPcMax(String max) {
    return 'onPC: $max max. (with any onPC hardware)';
  }

  @override
  String get accountSignInCta => 'Sign in';

  @override
  String get accountSignInCtaSubtitle =>
      'Your Pro and plugins, on all your devices ✨';

  @override
  String get accountAuthTitle => 'Your ShowTech account';

  @override
  String get accountAuthSubtitle =>
      'Sign in to get your Pro subscription back\nand join the community.';

  @override
  String get accountSignedInSnack => 'Signed in! Welcome aboard 🎉';

  @override
  String get accountSignedOutSnack => 'Signed out. See you soon 👋';

  @override
  String get accountSignOutConfirmTitle => 'Sign out?';

  @override
  String get accountSignOutConfirmBody =>
      'Your Pro subscription stays linked to your Google account: sign back in anytime to get it back.';

  @override
  String get videoLmCalcDistTitle => 'Throw distance (Ratio × Screen)';

  @override
  String get videoLmSizeModeLabel => 'Known screen size';

  @override
  String get videoLmModeWidth => 'Width';

  @override
  String get videoLmModeHeight => 'Height';

  @override
  String get videoLmModeDiagonal => 'Diagonal';

  @override
  String get videoLmImageHeightLabel => 'Image height (m)';

  @override
  String get videoLmImageHeightHint => 'e.g. 3.375';

  @override
  String get videoLmDiagonalLabel => 'Diagonal (inches)';

  @override
  String get videoLmDiagonalHint => 'e.g. 200';

  @override
  String get videoLmRatioMinLabel => 'Throw ratio (or min. if zoom)';

  @override
  String get videoLmRatioMaxLabel => 'Max. ratio (optional, zoom)';

  @override
  String get videoLmRatioMaxHint => 'e.g. 2.10';

  @override
  String get videoLmErrMissingSizeRatio =>
      '❌ Missing data: Screen size + Ratio.';

  @override
  String get videoLmErrSizeGt0 => '❌ Screen size must be > 0.';

  @override
  String videoLmResultImage(Object width, Object height, Object format) {
    return '📐 Image: $width × $height m ($format)';
  }

  @override
  String videoLmResultDistance(Object distance) {
    return '✅ Distance = $distance m';
  }

  @override
  String videoLmResultDistanceRange(Object min, Object max) {
    return '✅ Distance: from $min m to $max m';
  }

  @override
  String get videoLmDistanceNote =>
      'ℹ️ Distance measured from the lens: check the manufacturer\'s reference point (lens front or chassis).';

  @override
  String get menuViewModeList => 'List view';

  @override
  String get menuViewModeGrid => 'Grid view';

  @override
  String get audioRt60Subtitle => 'Reverberation time of a room';

  @override
  String get audioSplMeterSubtitle =>
      'Measure sound level with the phone\'s mic';

  @override
  String get audioImpedanceSubtitle => 'Speakers in series or parallel';

  @override
  String get audioCrossoverSubtitle => 'Crossover frequencies and filters';

  @override
  String get audioDelayTimeSubtitle => 'Delay times locked to the tempo';

  @override
  String get audioNoiseDoseSubtitle => 'Noise exposure and maximum duration';

  @override
  String get audioInputListSubtitle => 'Build and share your input list';

  @override
  String get networkPoeSubtitle => 'PoE power budget of a switch';

  @override
  String get networkFiberSubtitle => 'Losses and margin of a fiber link';

  @override
  String get networkSubnetSubtitle => 'Mask, address range and broadcast';

  @override
  String get networkArtNetAddressingSubtitle =>
      'DMX universe ↔ Net / Sub-Net / Universe';

  @override
  String get rdmPageSubtitle => 'Discover and configure RDM devices';

  @override
  String get rfSplitterSubtitle => 'Insertion loss of splitters and combiners';

  @override
  String get rfCableAntennaSubtitle => 'Cable loss and antenna gain';

  @override
  String get rfPlannerSubtitle => 'Intermod-free wireless frequency plan';

  @override
  String get timecodeToolConverterSubtitle =>
      'Convert timecode between frame rates';

  @override
  String get timecodeToolMathSubtitle => 'Add, subtract and offset timecode';

  @override
  String get timecodeToolDelaySubtitle => 'Convert frames and milliseconds';

  @override
  String get timecodeToolCountdownSubtitle => 'Countdown to a timecode';

  @override
  String get filterCorrespondenceSubtitle =>
      'Equivalents between filter ranges';

  @override
  String get ma3CalcEditSheetTitle => 'EDIT THIS FIXTURE';

  @override
  String get ma3CalcActionChangeMode => 'Change mode';

  @override
  String get ma3CalcActionChangeModeSub =>
      'Keep the fixture, pick another DMX mode';

  @override
  String get ma3CalcActionChangeType => 'Change fixture (GDTF)';

  @override
  String get ma3CalcActionChangeTypeSub =>
      'Replace or add the GDTF: GDTF Share or file';

  @override
  String get ma3CalcActionManual => 'Enter parameters manually';

  @override
  String get ma3CalcActionManualSub => 'Force a value per fixture';

  @override
  String get ma3CalcNeedGdtfFirst => 'No GDTF for this fixture: pick it first.';

  @override
  String get ma3CalcReplaceSheetTitle => 'Choose the fixture';

  @override
  String ma3CalcLineUpdated(Object label) {
    return '✅ $label updated';
  }

  @override
  String get audioPickAmplifier => 'Choose an amplifier';

  @override
  String get audioPickSpeaker => 'Choose a loudspeaker';

  @override
  String get audioSearchBrandModel => 'Search brand or model';

  @override
  String get audioCustomPreset => 'Custom';

  @override
  String get audioCustomPresetHint => 'Enter your own values';

  @override
  String audioModelsCount(Object count) {
    return '$count models';
  }

  @override
  String get audioNoResults => 'No results';

  @override
  String audioChannelsCount(Object count) {
    return '$count channels';
  }

  @override
  String audioRecommendedAmp(Object range) {
    return 'Recommended amp: $range';
  }

  @override
  String audioPowerHandling(Object watts) {
    return 'Power handling: $watts W';
  }

  @override
  String get audioNoPowerData =>
      'Power handling not published by the manufacturer: only impedance is checked. Use its presets / controllers.';

  @override
  String get audioActiveSection =>
      'Actively driven cabinet: one amp channel per section.';

  @override
  String audioStatusZTooLow(Object diff) {
    return '✗  Z too low (−$diff Ω)';
  }

  @override
  String audioStatusOkPct(Object pct) {
    return '✓  OK ($pct% RMS)';
  }

  @override
  String audioStatusUnderpowered(Object pct) {
    return '↓  Underpowered ($pct% RMS)';
  }

  @override
  String audioStatusHeadroom(Object ratio) {
    return '✓  Headroom ×$ratio';
  }

  @override
  String audioStatusOverpowered(Object ratio) {
    return '✗  Overpowered ×$ratio';
  }

  @override
  String get audioStatusInRange => '✓  Within manufacturer range';

  @override
  String get audioStatusBelowRange => '↓  Below recommended range';

  @override
  String get audioStatusAboveRange => '⚠  Above recommended range';

  @override
  String get audioStatusZOkNoData => '✓  Z OK — P not published';

  @override
  String audioStatusLimiterRequired(Object ratio) {
    return '⚠  ×$ratio — limiter required';
  }

  @override
  String get catalogSearchHint => 'Search a brand, model, type…';

  @override
  String get catalogSearchNoResults => 'No results';

  @override
  String catalogSearchResultsCount(Object count) {
    return '$count results';
  }

  @override
  String get soundCatalogTitle => 'Sound catalogue';

  @override
  String get soundCatalogSubtitle =>
      'Amplifiers and loudspeakers: specs and manuals';

  @override
  String get laserCatalogTitle => 'Laser catalogue';

  @override
  String get laserCatalogSubtitle =>
      'Laser projectors: power, beam, divergence';

  @override
  String get catalogAmplifiers => 'Amplifiers';

  @override
  String get catalogSpeakers => 'Loudspeakers';

  @override
  String get catalogUseValues => 'Use';

  @override
  String get laserPickFromCatalog => 'Pick from catalogue';

  @override
  String get laserCatalogDisclaimer =>
      'Manufacturer-stated values, not measured.';

  @override
  String get laserCatalogMissingValues =>
      'Beam diameter or divergence not published for this laser: fill them in manually.';

  @override
  String get catalogFieldChannels => 'Channels';

  @override
  String get catalogFieldPowerPerChannel => 'Power per channel';

  @override
  String get catalogFieldType => 'Type';

  @override
  String get catalogFieldSection => 'Section';

  @override
  String get catalogFieldPowerHandling => 'Power handling (RMS/AES)';

  @override
  String get catalogFieldRecommendedAmp => 'Recommended amplifier';

  @override
  String get catalogFieldOpticalPower => 'Optical power';

  @override
  String get catalogFieldColors => 'Colours';

  @override
  String get catalogFieldScanner => 'Scanners';

  @override
  String get catalogFieldClass => 'Laser class';

  @override
  String get catalogFieldConsumption => 'Power consumption';

  @override
  String get homeSafetyTitle => 'Safety';

  @override
  String get homeSafetySubtitle => 'Safety plans, installation certificate';

  @override
  String get subscriptionCategorySafetyTitle => 'Safety';

  @override
  String get subscriptionCategorySafetyDescription =>
      'Safety plans, installation certificate with photos, reservations and signature, PDF export.';

  @override
  String get subscriptionHeadlineSafetySubtitle =>
      'Write your safety plans and installation certificates on site, with signed PDF export.';

  @override
  String get safetyPageTitle => 'Safety';

  @override
  String get safetySectionDocuments => 'Documents';

  @override
  String get safetyPpspsTitle => 'Safety plans';

  @override
  String get safetyPpspsSubtitle => 'PPSPS (France), safety plan (Belgium)';

  @override
  String get safetyAttestationTitle => 'Installation check';

  @override
  String get safetyAttestationSubtitle => 'Checks, reservations and signature';

  @override
  String get safetyComingSoon => 'Available in a future version.';

  @override
  String get safetyLibraryTitle => 'Library';

  @override
  String safetyLibrarySummary(Object risks, Object measures, Object controls) {
    return '$risks risks · $measures measures · $controls checks';
  }

  @override
  String safetyLibraryUpdated(Object date) {
    return 'Updated: $date';
  }

  @override
  String get safetyLibraryOffline => 'Local copy, works offline';

  @override
  String get safetyDisclaimer =>
      'Drafting aid only. The content of the documents remains the responsibility of the signing company.';

  @override
  String get ppspsListTitle =>
      'Safety plans';

  @override
  String get ppspsNew =>
      'New plan';

  @override
  String get ppspsEmptyTitle =>
      'No plans yet';

  @override
  String get ppspsEmptyBody =>
      'Create your first safety plan. You can then duplicate it for your next events.';

  @override
  String get ppspsChooseCountry =>
      'Country of the site';

  @override
  String get ppspsStatusDraft =>
      'Draft';

  @override
  String get ppspsStatusFinal =>
      'Finalised';

  @override
  String ppspsStepProgress(Object done, Object total) {
    return 'Step $done/$total';
  }

  @override
  String get ppspsUntitled =>
      'Untitled';

  @override
  String get ppspsDuplicate =>
      'Duplicate';

  @override
  String get ppspsDelete =>
      'Delete';

  @override
  String get ppspsDeleteConfirm =>
      'Delete this plan? This cannot be undone.';

  @override
  String get ppspsCancel =>
      'Cancel';

  @override
  String get ppspsSave =>
      'Save';

  @override
  String get ppspsNext =>
      'Next';

  @override
  String get ppspsPrevious =>
      'Back';

  @override
  String get ppspsStepProject =>
      'Project';

  @override
  String get ppspsStepWorkers =>
      'Contractors';

  @override
  String get ppspsStepRisks =>
      'Risks';

  @override
  String get ppspsStepEmergency =>
      'Emergency';

  @override
  String get ppspsStepExport =>
      'Export';

  @override
  String get ppspsFieldEventName =>
      'Event name';

  @override
  String get ppspsFieldVenue =>
      'Venue';

  @override
  String get ppspsFieldAddress =>
      'Address';

  @override
  String get ppspsFieldOrganizer =>
      'Client / organiser';

  @override
  String get ppspsFieldCoordinator =>
      'Safety coordinator';

  @override
  String get ppspsSectionPhases =>
      'Phases and dates';

  @override
  String get ppspsPhaseMontage =>
      'Load-in';

  @override
  String get ppspsPhaseExploitation =>
      'Show';

  @override
  String get ppspsPhaseDemontage =>
      'Load-out';

  @override
  String get ppspsPhaseNotSet =>
      'Not scheduled';

  @override
  String get ppspsPhaseFilterAll =>
      'All';

  @override
  String get ppspsSectionCompany =>
      'Your company';

  @override
  String get ppspsFieldCompanyName =>
      'Company name';

  @override
  String get ppspsFieldCompanyActivity =>
      'Activity on site';

  @override
  String get ppspsFieldResponsible =>
      'Site manager';

  @override
  String get ppspsFieldPhone =>
      'Phone';

  @override
  String get ppspsFieldCompany =>
      'Company';

  @override
  String get ppspsFieldTrade =>
      'Trade';

  @override
  String get ppspsFieldContact =>
      'Contact';

  @override
  String get ppspsFieldHeadcount =>
      'Headcount';

  @override
  String get ppspsAddWorker =>
      'Add a contractor';

  @override
  String get ppspsWorkersEmpty =>
      'Add the companies and crews working on site.';

  @override
  String ppspsWorkersTotal(Object count) {
    return 'Total headcount: $count people';
  }

  @override
  String get ppspsMeasuresTitle =>
      'Control measures';

  @override
  String get ppspsMeasureCollective =>
      'Collective';

  @override
  String get ppspsMeasureIndividual =>
      'Personal';

  @override
  String get ppspsMeasureOrganisational =>
      'Organisational';

  @override
  String ppspsMeasureCount(Object count) {
    return '$count measures';
  }

  @override
  String get ppspsAddCustomMeasure =>
      'Add a measure';

  @override
  String get ppspsCustomMeasureHint =>
      'Other measure for this site';

  @override
  String ppspsRisksSummary(Object risks, Object measures) {
    return '$risks risks · $measures measures';
  }

  @override
  String get ppspsSectionNumbers =>
      'Emergency numbers';

  @override
  String get ppspsSectionHospital =>
      'Nearest hospital';

  @override
  String get ppspsFieldHospitalName =>
      'Hospital name';

  @override
  String get ppspsSectionOnSite =>
      'On site';

  @override
  String get ppspsFieldFirstAiders =>
      'First aiders on site';

  @override
  String get ppspsFieldAssemblyPoint =>
      'Assembly point';

  @override
  String get ppspsFieldEquipment =>
      'Emergency equipment (extinguishers, defibrillator…)';

  @override
  String get ppspsCritical =>
      'high';

  @override
  String get ppspsMedium =>
      'medium';

  @override
  String get ppspsLow =>
      'low';

  @override
  String get ppspsExportReady =>
      'All steps are complete.';

  @override
  String get ppspsExportMissing =>
      'Still to complete';

  @override
  String get ppspsExportPdf =>
      'Export as PDF';

  @override
  String get ppspsMarkFinal =>
      'Mark as finalised';
}
