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
  String get commonOk => 'OK';

  @override
  String get commonOkWithCheck => 'OK ✅';

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
    return 'Mode : $mode';
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
  String get laserDiameterHint => 'ex: 3.0';

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
  String get laserTargetDistanceHint => 'ex: 10';

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
  String get lightCatalogTitle => 'Catalog';

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
  String get lightProjectionDescription =>
      'Indicative spot size calculation based on angle, distance and diameter.';

  @override
  String get lightProjectionTitle => 'Projection size';

  @override
  String get menuTitle => 'Menu';

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
  String get mireHeightPxHint => 'ex: 1080';

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
  String get mireLedTitle => 'LED / MIRE';

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
  String get mireOverlapHint => 'ex: 10.0';

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
  String get patchEditModeLabel => 'Mode';

  @override
  String get patchEditTitle => 'Edition';

  @override
  String get patchEmptyUniverse => 'No machines in this universe.';

  @override
  String patchFixturesCount(Object count) {
    return 'Machines : $count';
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
    return 'Mode : $mode';
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
  String get projectionAngleLabel => 'Angle';

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
    return 'Distance : $distance m';
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
    return 'Distance : $distance m';
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
  String get videoCalc6GainHint => 'ex: 1.0';

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
  String get videoCalc6RatioMaxHint => 'ex: 1.80';

  @override
  String get videoCalc6RatioMaxLabel => 'Max ratio';

  @override
  String get videoCalc6RatioMinHint => 'ex: 1.20';

  @override
  String get videoCalc6RatioMinLabel => 'Ratio min';

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
    return 'Surface: $value';
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
  String get videoDistanceHint => 'ex: 12.0';

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
  String get videoGainHint => 'ex: 1.0';

  @override
  String get videoGainLabel => 'Gain';

  @override
  String get videoImageWidthHint => 'ex: 6.0';

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
  String get videoLedTileHcmHint => 'ex: 33.28';

  @override
  String get videoLedTileHcmLabel => 'Tile height (cm)';

  @override
  String get videoLedTileHpxHint => 'ex: 128';

  @override
  String get videoLedTileHpxLabel => 'Tile height (px)';

  @override
  String get videoLedTileWcmHint => 'ex: 33.28';

  @override
  String get videoLedTileWcmLabel => 'Tile width (cm)';

  @override
  String get videoLedTileWpxHint => 'ex: 128';

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
  String get videoLmDistanceHint => 'ex: 12.0';

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
  String get videoLmImageWidthHint => 'ex: 6.0';

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
  String get videoLmThrowRatioHint => 'ex: 1.60';

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
  String get videoMpDistanceHint => 'ex: 12.0';

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
  String get videoMpGainHint => 'ex: 1.0';

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
  String get videoMpOverlapHint => 'ex: 10';

  @override
  String get videoMpOverlapLabel => 'Overlap (%)';

  @override
  String get videoMpProjectorCountHint => 'ex: 2';

  @override
  String get videoMpProjectorCountLabel => 'Number of spotlights (N)';

  @override
  String get videoMpRatioMaxHint => 'ex: 1.80';

  @override
  String get videoMpRatioMaxLabel => 'Max ratio';

  @override
  String get videoMpRatioMinHint => 'ex: 1.20';

  @override
  String get videoMpRatioMinLabel => 'Ratio min';

  @override
  String get videoMpTotalWidthHint => 'ex: 18.0';

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
  String get videoOverlapHint => 'ex: 10';

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
  String get videoPdfCalc6RatioMin => 'Ratio min (calc6)';

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
  String get videoThrowRatioHint => 'ex: 1.60';

  @override
  String get videoThrowRatioLabel => 'Projection ratio';

  @override
  String get videoTitle => 'Video';

  @override
  String get videoToolsTitle => 'Video tools';

  @override
  String get videoTotalWidthHint => 'ex: 18.0';

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
  String get aboutElectriciteToc01 => '1) Bases (W, A, V, kW)';

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
  String get aboutNetworkToc02 => '2) Plan IP (simple)';

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
  String get aboutVideoToc06 => '6) SDI (3G / 6G / 12G)';

  @override
  String get aboutVideoToc07 => '7) HDMI - field';

  @override
  String get aboutVideoToc08 => '8) NDI - when / why / limits';

  @override
  String get aboutVideoToc09 => '9) Mapping / LED / multi-projo';

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
  String get riggingSpanHint => 'Ex : 2.40';

  @override
  String get riggingDropLabel => 'Arrow (vertical drop)';

  @override
  String get riggingDropHint => 'Ex : 0.60';

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
  String get riggingAngleHint => 'Ex : 45';

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
  String get riggingSchemaLabelLeg => 'Brin';

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
  String get elecToc1 => '1) Bases (W, A, V, kW)';

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
  String get refBeamFieldTitle => 'Beam / Field';

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
  String get refBeamLegendBeam => 'Beam';

  @override
  String get refBeamLegendField => 'Field';

  @override
  String get refLuxIntro =>
      'Indicative illuminance references according to use.';

  @override
  String get refLuxColUse => 'Usage';

  @override
  String get refLuxColLux => 'Lux';

  @override
  String get refLuxUseCorridor => 'Corridor / circulation';

  @override
  String get refLuxUseBackstage => 'Backstage / technical';

  @override
  String get refLuxUseMeeting => 'Meeting room';

  @override
  String get refLuxUseExpo => 'Expo / showroom';

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
  String get refCri90 => 'Excellent (≥ 90)';

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
  String get aboutUniverseToArtnetTableTitle => 'Table Univers → Art-Net';

  @override
  String get aboutUniverseToArtnetTableIntro =>
      'Typical correspondence between DMX universe and Art-Net addressing.';

  @override
  String get aboutUniverseTablesDisclaimer =>
      'Always check your console / node convention.';

  @override
  String get aboutUniverseToArtnetColDmx => 'DMX Universe';

  @override
  String get aboutUniverseToArtnetColUniHex => 'Uni (hex)';

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
  String get aboutUniverseToHexTableTitle => 'Table Univers → Hex';

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
  String get aboutArtnetSection2PillNodePort => 'Node / Port';

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
  String get aboutDmxPainterSourceA => 'SOURCE A\n(prio 100)';

  @override
  String get aboutDmxPainterSourceB => 'SOURCE B\n(prio 90)';

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
  String get elecSection1Title => '1) Bases (W, A, V, kW)';

  @override
  String get elecSection1FormulasTitle => '3 useful formulas';

  @override
  String get elecSection1Formula1 => 'P (W) = U (V) × I (A)';

  @override
  String get elecSection1Formula2 => 'I (A) = P (W) / U (V)';

  @override
  String get elecSection1Formula3 => 'P (kW) = P (W) / 1000';

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
      '16A ≈ 11 kW\n32A ≈ 22 kW\n63A ≈ 44 kW\n125A ≈ 86 kW\n200A ≈ 138 kW\n400A ≈ 277 kW\n';

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
  String get infoStorageSataNvmeTitle => 'SATA vs NVMe';

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
  String get aboutArtnetSection2Subtitle1 => 'Broadcast vs Unicast';

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
  String get aboutNetworkToc2 => '2) Plan IP (simple)';

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
  String get aboutNetworkIgmpPill3 => 'Multicast flood';

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
  String get videoCamInfoTitle => 'Info';

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
  String get aboutDmxS3PillDaisyChain => 'Daisy-chain';

  @override
  String get aboutDmxS3PillNoY => 'No Y';

  @override
  String get aboutDmxS3Pill120ohm => '120 Ω';

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
  String get aboutDmxS6PillBroadcast => 'Broadcast';

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
  String get aboutVideoToc6 => '6) SDI (3G / 6G / 12G)';

  @override
  String get aboutVideoToc7 => '7) HDMI - field';

  @override
  String get aboutVideoToc8 => '8) NDI - when / why / limits';

  @override
  String get aboutVideoToc9 => '9) Mapping / LED / multi-projo';

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
  String get gdtfColType => 'Type';

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
  String get gdtfFieldType => 'Type';

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
  String get gdtfTypePan => 'Pan';

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
  String get gdtfRolePan => 'Pan';

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
  String get gdtfPresetPan => 'Pan';

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
  String get consoleSubtitle => 'Patch DMX et outils GDTF';

  @override
  String get consolePatchTitle => 'Patch DMX';

  @override
  String get consolePatchSubtitle => 'Importer un MVR et analyser le patch';

  @override
  String get consoleGdtfTitle => 'GDTF';

  @override
  String get consoleGdtfSubtitle => 'Créer ou analyser un fichier GDTF';

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
}
