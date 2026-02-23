// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get aboutArtNetSubtitle =>
      'DMX universes over Ethernet/UDP, nodes, broadcast vs unicast.\\nReal-world limits, network stability, RDM depending on hardware.';

  @override
  String get aboutArtNetTitle =>
      'Art-Net — DMX over IP (nodes, unicast/broadcast)';

  @override
  String get aboutCablingFiberSubtitle =>
      'Cat5e→Cat8, fiber OM3/OM4/OS2, LC/SC/MPO, typical distances, show best practices.';

  @override
  String get aboutCablingFiberTitle =>
      'Network — RJ45 / fiber / speeds & distances';

  @override
  String get aboutComputingSubtitle =>
      'Useful bandwidth, versions, real limits, marketing traps.';

  @override
  String get aboutComputingTitle =>
      'Computing — USB / HDMI / DP / SATA / NVMe…';

  @override
  String get aboutDmxSubtitle =>
      'Universes, addresses, frames, RS-485 wiring, termination, field issues.\\nIncludes diagrams + checklist.';

  @override
  String get aboutDmxTitle => 'DMX — how it works (simple & complete)';

  @override
  String get aboutElectricitySubtitle =>
      'Connectors, single/three-phase, quick kW tables (16A→400A), field pitfalls.';

  @override
  String get aboutElectricityTitle => 'Electrical — Schuko / CEE (P17) / power';

  @override
  String get aboutIpBasicsSubtitle =>
      'Understand IP, subnet mask, gateway, DHCP vs static.\\nConcrete examples (2.x, 10.x, 192.168.x) + checklist.';

  @override
  String get aboutIpBasicsTitle =>
      'Network — IP basics / subnet mask / DHCP (essential)';

  @override
  String get aboutLightNetworkSubtitle =>
      'Simple and robust architecture for Art-Net/sACN.\\nVLAN, IGMP snooping/querier, Wi‑Fi (jitter), switches, diagrams + checklist.';

  @override
  String get aboutLightNetworkTitle =>
      'Lighting network — VLAN, IGMP, Wi-Fi vs wired';

  @override
  String get aboutSacnSubtitle =>
      'A network-pro-oriented DMX-over-IP standard.\\nMulticast/unicast, IGMP snooping/querier, multi-source priorities.';

  @override
  String get aboutSacnTitle => 'sACN / E1.31 — multicast & priorities';

  @override
  String get aboutVideoSubtitle =>
      'Choose based on latency, reliability, cabling, LAN vs WAN.\\nTables + diagram.';

  @override
  String get aboutVideoTitle => 'Video — field notes';

  @override
  String get appTitle => 'My Tech App';

  @override
  String catalogDmxModeItem(Object channels, Object name) {
    return '$name — $channels channels';
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
    return 'Last update: $date';
  }

  @override
  String catalogManufacturerTitle(Object count) {
    return 'Manufacturer ($count)';
  }

  @override
  String catalogModelTitle(Object count) {
    return 'Model ($count)';
  }

  @override
  String get catalogNotProvided => 'Not provided';

  @override
  String get catalogOpenDmxChart => 'Open DMX chart';

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
    return 'Sync failed: $reason';
  }

  @override
  String get catalogSyncFailedUnknown => 'Sync failed (unknown reason).';

  @override
  String catalogTypeTitle(Object count) {
    return 'Type ($count)';
  }

  @override
  String get catalogUpdateTooltip => 'Update';

  @override
  String get catalogUpdated => 'Catalog updated.';

  @override
  String get commonCalculate => 'Calculate';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonCopyResultTooltip => 'Copy result';

  @override
  String get commonDash => '—';

  @override
  String get commonNone => 'No records';

  @override
  String get commonOk => 'OK';

  @override
  String get commonOkWithCheck => 'OK ✅';

  @override
  String get commonRename => 'Rename';

  @override
  String get commonReset => 'Reset';

  @override
  String get commonSave => 'Save';

  @override
  String get commonSearch => 'Search';

  @override
  String get commonTooLowWithCross => 'Too low ❌';

  @override
  String get commonUnitMeter => 'm';

  @override
  String get consentsReset => 'Consents reset.';

  @override
  String get dipSwitchAddressHint => 'e.g. 1 to 512';

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
  String get dipSwitchIntervalHint => 'e.g. 4 (channels)';

  @override
  String get dipSwitchIntervalLabel => 'Interval';

  @override
  String get dipSwitchModeAddressDirect => 'Direct address';

  @override
  String get dipSwitchModeAddressMinusOne => 'Address - 1';

  @override
  String get dipSwitchNextAddressButton => 'Next address';

  @override
  String get dipSwitchOffLabel => 'OFF';

  @override
  String get dipSwitchOnLabel => 'ON';

  @override
  String get dipSwitchResetTooltip => 'Reset';

  @override
  String dipSwitchResultAddressLine(Object address) {
    return 'Address: $address';
  }

  @override
  String get dipSwitchResultAddressNotProvided => 'Address not provided';

  @override
  String dipSwitchResultBinaryValueLine(Object binary) {
    return 'Binary: $binary';
  }

  @override
  String get dipSwitchResultHeader => 'Result';

  @override
  String dipSwitchResultIntervalLine(Object end, Object start) {
    return 'Range: $start → $end';
  }

  @override
  String dipSwitchResultModeLine(Object mode) {
    return 'Mode: $mode';
  }

  @override
  String get dipSwitchScrollHint => 'Scroll to see all switches.';

  @override
  String get dipSwitchSectionTitle => 'Switches';

  @override
  String get dipSwitchSummaryTitle => 'Summary';

  @override
  String dipSwitchSwitchLabel(Object index) {
    return 'Switch $index';
  }

  @override
  String get dipSwitchUseAddressMinusOneLabel => 'Use Address - 1 mode';

  @override
  String get disclaimerAccept => 'Accept';

  @override
  String get disclaimerCertify =>
      'I certify that I have read and accepted these conditions.';

  @override
  String get disclaimerText =>
      'FOR INFORMATIONAL USE ONLY\\n\\nThe calculations provided by this application (video, lighting, laser) are for informational and indicative purposes only.\\nThey do not replace:\\n- certified calculations,\\n- technical studies,\\n- applicable official standards,\\n- or validation by a qualified professional.\\n\\nLIABILITY\\nThe publisher of this application cannot be held responsible for calculation errors, omissions, equipment damage,\\npersonal injury, or any incident occurring during installation, operation, or use of equipment.\\n\\nVIDEO & PROJECTION\\nResults (sizes, ratios, brightness, overlaps, etc.) are based on theoretical models and may vary depending on:\\noptics, zoom, uniformity, ambient light, surface, settings, etc.\\nAlways verify with official manufacturer documentation.\\n\\nLIGHTING\\nCalculations are indicative and do not account for all real conditions (tolerances, optical losses,\\nsource degradation, local standards, environmental conditions…).\\n\\nLASER – SAFETY\\nNOHD, SZED and CZED calculations are based on standard assumptions and theoretical thresholds.\\nThey do not take into account, in particular:\\n- optical instruments (binoculars, cameras, telescopes…),\\n- atmospheric conditions (fog, rain, dust…),\\n- unexpected reflections, misuse, or specific settings.\\nThe use of a laser system implies direct operator responsibility and an appropriate risk assessment.\\n\\nRISK ACCEPTANCE\\nBy using this application, the user acknowledges:\\n- having read the applicable safety rules,\\n- being solely responsible for their installations,\\n- assuming full responsibility for risks related to the use of equipment (video, lighting, laser),\\n- systematically verifying data with official manufacturer manuals.';

  @override
  String get disclaimerTitle => '⚠️ LEGAL DISCLAIMER & LIMITATION OF LIABILITY';

  @override
  String get homeLaserSubtitle =>
      'Laser calculations and safety (consent required each time).';

  @override
  String get homeLaserTitle => 'Laser';

  @override
  String get homeLightSubtitle =>
      'Projection size, DMX dip-switch, photometry, catalog, DMX patch.';

  @override
  String get homeLightTitle => 'Lighting';

  @override
  String get homeReferencesSubtitle =>
      'DMX / network / video: field guides & quick references.';

  @override
  String get homeReferencesTitle => 'References';

  @override
  String get homeTitle => 'Home';

  @override
  String get homeVideoSubtitle =>
      'Lens & measurement, brightness, multi-projector, LED and test patterns.';

  @override
  String get homeVideoTitle => 'Video';

  @override
  String get language => 'Language';

  @override
  String get languageSystem => 'System (automatic)';

  @override
  String get languageSystemCurrent => 'Phone language';

  @override
  String get laserAdviceFullPower => 'Full power allowed (100 %)';

  @override
  String laserAdviceMaxRecommended(Object percent) {
    return 'Maximum recommended power: $percent';
  }

  @override
  String get laserConsentCheckboxLabel => 'I accept and understand the risks.';

  @override
  String get laserConsentContinue => 'Continue';

  @override
  String get laserConsentText =>
      'ACCESS TO THE LASER SECTION\\n\\nThe LASER section of this application includes safety calculations (e.g. NOHD, SZED, CZED).\\nThese calculations are indicative and do not replace:\\n- a risk assessment,\\n- applicable standards,\\n- operating procedures,\\n- or validation by a qualified person.\\n\\nIMPORTANT\\n- Risk of eye / skin injury in case of improper use.\\n- Results may be incorrect if parameters are incomplete, inaccurate, or if real conditions differ (optics,\\n  atmospheric conditions, reflections, alignment, etc.).\\n- The operator is solely responsible for installation, operation, and compliance.\\n\\nBy validating, you confirm that you:\\n- understand the risks,\\n- comply with applicable safety rules,\\n- assume full responsibility in case of negligence or misuse.';

  @override
  String get laserConsentTitle => '🔴 LASER CONSENT (MANDATORY)';

  @override
  String get laserDiameterHint => 'e.g.: 3.0';

  @override
  String get laserDiameterLabel => 'Output diameter (mm)';

  @override
  String get laserDisclaimerShort =>
      'Indicative calculation. Does not replace a laser safety analysis.';

  @override
  String get laserDivergenceHint => 'e.g.: 1.2';

  @override
  String get laserDivergenceLabel => 'Divergence (mrad)';

  @override
  String get laserInputsTitle => 'Inputs';

  @override
  String get laserInvalidInputs =>
      'Please enter valid power, divergence and diameter values.';

  @override
  String get laserNameUpdated => 'Name updated.';

  @override
  String get laserNormativeParamsBody =>
      'MPE for Nominal Ocular Hazard Distance (NOHD): 25.4 W/m²\\n(IEC 60825-1, edition 3.0)\\n\\nMPE for Sensitive Zone Exposure Distance (SZED): 1 W/m²\\n(ANSI Z136.6)\\n\\nMPE for Critical Zone Exposure Distance (CZED): 0.05 W/m²\\n(ANSI Z136.6)';

  @override
  String get laserNormativeParamsTitle => 'Selected safety parameters';

  @override
  String get laserPowerHint => 'e.g.: 5000';

  @override
  String get laserPowerLabel => 'Power (mW)';

  @override
  String get laserPresetAdded => 'Record added.';

  @override
  String get laserPresetDeleted => 'Record deleted.';

  @override
  String laserPresetSubtitle(Object diam, Object div, Object p) {
    return 'P: $p mW • Div: $div mrad • Ø: $diam mm';
  }

  @override
  String get laserProjectorNameLabel => 'Projector name';

  @override
  String get laserRenameProjectorTitle => 'Rename projector';

  @override
  String get laserSafetyResultsTitle => 'Safety results';

  @override
  String get laserSaveCurrentProjector => 'Save this projector';

  @override
  String get laserSaveProjectorTitle => 'Save a projector';

  @override
  String get laserSavedProjectorsTitle => 'Saved projectors';

  @override
  String get laserSearchHint => 'e.g.: “RGB 5W”';

  @override
  String get laserTargetDistanceHint => 'e.g.: 10';

  @override
  String get laserTargetDistanceLabel => 'Target distance (m)';

  @override
  String get laserZoneCzedDesc => 'Critical zone';

  @override
  String get laserZoneNohdDesc => 'Eye hazard';

  @override
  String get laserZoneSzedDesc => 'Sensitive zone';

  @override
  String get legalNotices => 'Legal notices';

  @override
  String get lightCatalogDescription =>
      'Selection by manufacturer, type and product, with information and manual.';

  @override
  String get lightCatalogTitle => 'Catalog';

  @override
  String get lightDisclaimerShort =>
      'Indicative tools. Always check manufacturer documentation.';

  @override
  String get lightDmxSwitchDescription =>
      'Indicative conversion between DMX address and switches, with range navigation.';

  @override
  String get lightDmxSwitchTitle => 'DMX dip-switch';

  @override
  String get lightPatchDescription =>
      'Import an MVR file or create a patch manually from the library.';

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
  String get mireDash => '—';

  @override
  String get mireErrInvalidOverlap => '❌ Invalid overlap (0 to 99.9).';

  @override
  String get mireErrInvalidProjectors =>
      '❌ Invalid number of projectors (N > 0).';

  @override
  String get mireErrInvalidWHpx => '❌ Invalid width/height (px).';

  @override
  String get mireExportPng => 'Export PNG';

  @override
  String get mireHeightPxHint => 'e.g.: 1080';

  @override
  String get mireHeightPxHintMapping => 'e.g.: 2160';

  @override
  String get mireHeightPxLabel => 'Height (px)';

  @override
  String get mireLedErrTileCm => '❌ Enter Tile cm (width/height >0).';

  @override
  String get mireLedErrTilePx => '❌ Enter Tile px (width/height >0).';

  @override
  String get mireLedErrTilesXY => '❌ Enter Tiles X/Y (>0).';

  @override
  String get mireLedParamsTitle => 'LED wall parameters';

  @override
  String mireLedPitchComputed(Object pitch) {
    return 'Computed pitch: $pitch';
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
  String get mireLedTilesIdTitle => 'LED / TILE IDs';

  @override
  String get mireLedTilesXLabel => 'Horizontal tiles (X)';

  @override
  String get mireLedTilesYLabel => 'Vertical tiles (Y)';

  @override
  String get mireLedTitle => 'LED / PATTERN';

  @override
  String get mireLedTypeColorBars => 'Bars + ramps + circles';

  @override
  String get mireLedTypeGridLabels => 'Grid + markers + circles';

  @override
  String get mireLedTypePixelPerfect => 'Pixel perfect + circles';

  @override
  String get mireLedTypeTilesId => 'Tile IDs (number + colors)';

  @override
  String get mireLedTypeUniformity => 'Uniformity + circles';

  @override
  String mireLedWallResolution(Object h, Object w) {
    return 'Wall resolution: $w × $h px';
  }

  @override
  String get mireLedWarnPitchOutOfRange =>
      '⚠️ Computed pitch out of range (0.5–20 mm). Check Tile cm / px.';

  @override
  String get mireLedWarnPitchXNotY =>
      '⚠️ Pitch X ≠ Pitch Y (non-uniform tile). Check cm and px dimensions.';

  @override
  String get mireMappingSectionTitle => 'Multi-projector mapping pattern';

  @override
  String mireMappingSubtitlePattern(Object n, Object orient, Object percent) {
    return 'N=$n • Overlap $percent% • $orient';
  }

  @override
  String get mireMappingTypeBlendRamps => 'Blend ramps';

  @override
  String get mireMappingTypeCombo => 'Combo (zones + overlap + blend)';

  @override
  String get mireMappingTypeLabel => 'Mapping type';

  @override
  String get mireMappingTypeZonesOverlap => 'Zones + overlap';

  @override
  String get mireOrientationHorizontal => 'Horizontal';

  @override
  String get mireOrientationLabel => 'Orientation';

  @override
  String get mireOrientationVertical => 'Vertical';

  @override
  String get mireOverlapHint => 'e.g.: 10.0';

  @override
  String get mireOverlapLabel => 'Overlap (%)';

  @override
  String mirePitchEqual(Object value) {
    return '$value mm';
  }

  @override
  String mirePitchXY(Object x, Object y) {
    return 'X $x mm • Y $y mm';
  }

  @override
  String mireProjectorLabelPattern(Object index) {
    return 'PROJ $index';
  }

  @override
  String get mireProjectorsNHint => 'e.g.: 2';

  @override
  String get mireProjectorsNLabel => 'Number of projectors (N)';

  @override
  String get mireSimpleSectionTitle => 'Simple screen pattern';

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
    return 'Tile ${tw}x$th px • Grid $nx x $ny';
  }

  @override
  String mireTilesSubtitlePitchEq(Object pitch) {
    return 'Pitch ~ $pitch mm';
  }

  @override
  String mireTilesSubtitlePitchXY(Object px, Object py) {
    return 'Pitch X $px • Y $py mm';
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
  String get mireTypeLabel => 'Pattern type';

  @override
  String get mireVideoComboTitle => 'VIDEO / COMBO PATTERN';

  @override
  String get mireVideoMappingSectionTitle => 'Multi-projector mapping pattern';

  @override
  String get mireVideoMappingTitle => 'VIDEO / MAPPING PATTERN';

  @override
  String get mireVideoSimpleSectionTitle => 'Simple screen pattern';

  @override
  String get mireVideoSimpleTitle => 'VIDEO / SIMPLE PATTERN';

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
  String get mireWallNotMultipleOfTiles => 'WALL NOT A MULTIPLE OF TILES';

  @override
  String get mireWidthPxHint => 'e.g.: 1920';

  @override
  String get mireWidthPxHintMapping => 'e.g.: 3840';

  @override
  String get mireWidthPxLabel => 'Width (px)';

  @override
  String patchAddressLabel(Object address) {
    return 'Address: $address';
  }

  @override
  String patchChannelsUsed(Object count) {
    return 'Channels used: $count / 512';
  }

  @override
  String get patchConflictError => 'Address conflict (overlap).';

  @override
  String get patchConflictShort => 'Conflict';

  @override
  String patchConflicts(Object count) {
    return 'Conflicts: $count';
  }

  @override
  String get patchEditChannelsLabel => 'Channels';

  @override
  String get patchEditHint => 'Check the mode and channel count.';

  @override
  String get patchEditModeLabel => 'Mode';

  @override
  String get patchEditTitle => 'Edit';

  @override
  String get patchEmptyUniverse => 'No fixtures in this universe.';

  @override
  String patchFixturesCount(Object count) {
    return 'Fixtures: $count';
  }

  @override
  String get patchHomeDisclaimer =>
      'Indicative only. Always verify on the console.';

  @override
  String get patchHomeImportMvrDescription =>
      'Analyze an MVR file and load the patch as a reference.';

  @override
  String get patchHomeImportMvrTitle => 'Import an MVR';

  @override
  String get patchHomeTitle => 'DMX Patch';

  @override
  String get patchHomeViewPatchDescription =>
      'List and conflicts per universe.';

  @override
  String get patchHomeViewPatchTitle => 'View patch';

  @override
  String get patchHubOpenGridButton => 'Open grid';

  @override
  String get patchHubOpenMvrButton => 'Open MVR';

  @override
  String get patchHubStateEmpty => 'No reference loaded.';

  @override
  String patchHubStateLoaded(Object count) {
    return 'Loaded: $count universes';
  }

  @override
  String get patchHubStateTitle => 'State';

  @override
  String get patchHubTitle => 'Patch Hub';

  @override
  String get patchHubWorksiteBody =>
      'Import an MVR or view the occupancy grid.';

  @override
  String get patchHubWorksiteTitle => 'Worksite';

  @override
  String get patchInvalidChannelCount => 'Invalid channel count.';

  @override
  String get patchIssueInvalidChannelCount =>
      'Channel count must be 1 or greater.';

  @override
  String get patchIssueInvalidStartAddress =>
      'DMX address must be between 1 and 512.';

  @override
  String get patchIssueInvalidUniverse => 'Universe must be 1 or greater.';

  @override
  String get patchIssueRangeExceedsUniverse =>
      'Channel range exceeds 512 in this universe.';

  @override
  String get patchIssueUnknown => 'Unknown error.';

  @override
  String get patchListTitle => 'List';

  @override
  String get patchManualDisabledBody =>
      'Patch is read-only when an MVR reference is loaded.';

  @override
  String get patchManualDisabledTitle => 'Disabled';

  @override
  String get patchManualTitle => 'Manual patch';

  @override
  String patchModeLabel(Object mode) {
    return 'Mode: $mode';
  }

  @override
  String get patchMvrButtonAnalyzing => 'Analyzing…';

  @override
  String get patchMvrButtonLoadAsReference => 'Load as reference';

  @override
  String get patchMvrButtonPickFile => 'Pick a file';

  @override
  String get patchMvrClearTooltip => 'Clear';

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
      'Select a .mvr file (ZIP) to analyze the patch.';

  @override
  String get patchMvrFileCardTitle => 'File';

  @override
  String get patchMvrFilterAllUniverses => 'All universes';

  @override
  String get patchMvrFilterUniverseLabel => 'Filter by universe';

  @override
  String get patchMvrModeNotProvided => 'Mode not provided';

  @override
  String get patchMvrOrderAsc => 'Ascending';

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
  String get patchMvrStatusCleared => 'Reference cleared.';

  @override
  String get patchMvrStatusEmptyBytes => 'Empty file.';

  @override
  String get patchMvrStatusExtractingZip => 'Extracting ZIP…';

  @override
  String patchMvrStatusFilePickFailed(Object reason) {
    return 'File selection failed: $reason';
  }

  @override
  String patchMvrStatusFixturesFound(int count, int resolved) {
    return 'Fixtures found: $count (multi-channel: $resolved).';
  }

  @override
  String get patchMvrStatusLoadingGdtf => 'Loading GDTF…';

  @override
  String get patchMvrStatusNoContentToLoad => 'No content to load.';

  @override
  String get patchMvrStatusNoFileSelected => 'No file selected.';

  @override
  String get patchMvrStatusNoUsableFixtures => 'No usable fixtures found.';

  @override
  String patchMvrStatusParseError(Object message) {
    return 'Parse error: $message';
  }

  @override
  String get patchMvrStatusParsingContent => 'Parsing content…';

  @override
  String patchMvrStatusReferenceLoaded(int count, int skipped, int footprints) {
    return 'Reference loaded: $count fixture(s) (skipped: $skipped, GDTF footprints: $footprints).';
  }

  @override
  String patchMvrStatusRestored(Object count) {
    return 'Restored: $count fixtures';
  }

  @override
  String get patchMvrStatusSceneXmlNotFound =>
      'scene.xml not found in the MVR.';

  @override
  String get patchMvrStatusSelectingFile => 'Selecting file…';

  @override
  String patchMvrStatusUnsupportedFile(Object ext) {
    return 'Unsupported file: $ext';
  }

  @override
  String get patchMvrSummaryTitle => 'Summary';

  @override
  String get patchMvrTitle => 'MVR Import';

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
    return 'Conflicts: $count channel(s)';
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
    return '• $fixture\n  $mode — $channels channel(s)\n  $start → $end';
  }

  @override
  String patchUniverseOccupiedCount(Object count) {
    return 'Occupied: $count / 512';
  }

  @override
  String patchUniversePopupHeader(
      Object address, Object state, Object universe) {
    return 'Universe $universe — Address $address\nState: $state';
  }

  @override
  String get patchUniversePopupManyOccupants =>
      'Multiple fixtures occupy this channel.';

  @override
  String patchUniversePopupMore(Object count) {
    return '… and $count more.';
  }

  @override
  String get patchUniversePopupTitleConflict => 'Conflict';

  @override
  String get patchUniversePopupTitleFree => 'Channel free';

  @override
  String get patchUniversePopupTitleOccupied => 'Channel occupied';

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
      'This clears the patch loaded from the MVR in the app.\nNo data in the file is modified.';

  @override
  String get patchUniverseResetTitle => 'Reset reference?';

  @override
  String get patchUniverseResetTooltip => 'Reset reference';

  @override
  String get patchUniverseSelected => 'Selected universe';

  @override
  String get patchUniverseStateConflict => 'Conflict';

  @override
  String get patchUniverseStateFree => 'Free';

  @override
  String get patchUniverseStateOccupied => 'Occupied';

  @override
  String get patchUniverseTapHint => 'Tap a cell to see details.';

  @override
  String get patchUniverseUniverseDropdownLabel => 'DMX Universe';

  @override
  String patchUniverseUniverseItem(Object universe) {
    return 'Universe $universe';
  }

  @override
  String get patchUniverseUniverseTitle => 'Universe';

  @override
  String get patchUniverseZoomIn => 'Zoom in';

  @override
  String get patchUniverseZoomOut => 'Zoom out';

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
      'Indicative only. Check the manufacturer documentation.';

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
  String get photometrySection1Title => 'Section 1';

  @override
  String get photometrySection2Title => 'Section 2';

  @override
  String get photometrySection3Title => 'Section 3';

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
    return 'Lumens: $lumens lm — Distance: $distance m — Angle: $angle° — Lux: $lux lx.';
  }

  @override
  String get projectionAngleHint => 'In degrees';

  @override
  String get projectionAngleLabel => 'Angle';

  @override
  String get projectionAutoHelp => 'Auto: computes the missing value.';

  @override
  String projectionConeAngle(Object angle) {
    return 'Angle: $angle°';
  }

  @override
  String projectionConeDiameter(Object diameter) {
    return 'Diameter: $diameter m';
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
    return 'Diameter: $diameter m';
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
  String get settings => 'Settings';

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
    return 'Format: $format\\nArea: $area m²\\nLux (lm/m²): $lux\\nEq lux (gain): $luxEq\\nLuminance: $nits nits | $fl ft‑L\\nMinimum threshold ($presetLabel): $minFl ft‑L → $status\\nNote: indicative estimate (Lambert).';
  }

  @override
  String get videoBrightnessSectionTitle =>
      'Calc 4 — Lux / nits / ft‑L + threshold';

  @override
  String get videoBrightnessSubtitle =>
      'Lux / nits / ft‑L + threshold (calculation 4).';

  @override
  String get videoBrightnessTitle => 'Brightness';

  @override
  String get videoCalc1ErrMissing => '❌ Missing data: Distance + Width.';

  @override
  String videoCalc1Ok(Object ratio) {
    return '✅ Throw ratio = $ratio';
  }

  @override
  String get videoCalc1Title => 'Calc 1 — Ratio (Distance / Width)';

  @override
  String get videoCalc2ErrMissing => '❌ Missing data: Distance + Ratio.';

  @override
  String videoCalc2Ok(Object width) {
    return '✅ Image width = $width m';
  }

  @override
  String get videoCalc2Title => 'Calc 2 — Width (Distance / Ratio)';

  @override
  String get videoCalc3ErrMissingWidth => '❌ Missing data: Width.';

  @override
  String videoCalc3Ok(Object format, Object height) {
    return '✅ Height = $height m (format $format)';
  }

  @override
  String get videoCalc3Title => 'Calc 3 — Height (Width + Format)';

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
    return 'Area: $area m² (format $format)\\nLux (lm/m²): $lux\\nEq lux (gain): $luxEq\\nLuminance: $nits nits | $fl ft‑L\\nMinimum threshold ($presetLabel): $minFl ft‑L → $status\\nNote: nits/ft‑L conversion based on a Lambertian assumption (approx).';
  }

  @override
  String get videoCalc4Title =>
      'Calc 4 — Brightness (lux / nits / ft‑L + threshold)';

  @override
  String get videoCalc5ErrMissing =>
      '❌ Missing data: Total width + Overlap% + Number of projectors.';

  @override
  String get videoCalc5ErrNMin2 => '❌ Number of projectors must be ≥ 2.';

  @override
  String get videoCalc5NHint => 'e.g.: 2';

  @override
  String get videoCalc5NLabel => 'Number of projectors (N)';

  @override
  String videoCalc5Result(Object format, Object hTot, Object n, Object overlapM,
      Object overlapPct, Object wPer, Object wTot) {
    return 'Total width: $wTot m\\nN: $n | Overlap: $overlapPct% (on projector width)\\n\\n- Width per projector: $wPer m\\n- Overlap between 2 projectors: $overlapM m\\n- Total height (format $format): $hTot m';
  }

  @override
  String get videoCalc5Title => 'Calc 5 — Overlap (Total width + N)';

  @override
  String get videoCalc6ErrMissingBasics =>
      '❌ Missing data: Total width + Distance + Overlap%.';

  @override
  String get videoCalc6ErrMissingRatio =>
      '❌ Missing data: Min ratio and/or Max ratio.';

  @override
  String get videoCalc6GainHint => 'e.g.: 1.0';

  @override
  String get videoCalc6GainLabel => 'Gain (calc 6)';

  @override
  String get videoCalc6LumensPerProjectorHint => 'e.g.: 20000';

  @override
  String get videoCalc6LumensPerProjectorLabel => 'Lumens per projector';

  @override
  String get videoCalc6LumiErrGt0 =>
      'Brightness: ❌ Lumens/projector and gain must be > 0.';

  @override
  String videoCalc6LumiForN(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Estimated brightness (N=$n)\\nArea: $area m²\\nEq lux: $lux (lm/m²)\\nNits: $nits | ft‑L: $fl';
  }

  @override
  String get videoCalc6LumiOptional =>
      'Brightness (optional): enter Lumens/projector + Gain for the estimate.';

  @override
  String get videoCalc6NoteIndicative =>
      'Note: indicative estimate (real blend/overlap may reduce it slightly).';

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
    return 'Total width=$wTot m | Distance=$distance m | Overlap=$overlapPct%\\nFormat $format → Total height=$hTot m | Area=$area m²\\nMin/max ratio: $ratioMin → $ratioMax\\n\\nWidest ratio case (min) = $nMin projectors | coverage ≈ $covMin m\\n$lumiMin\\n\\nTightest ratio case (max) = $nMax projectors | coverage ≈ $covMax m\\n$lumiMax\\n\\n$note';
  }

  @override
  String get videoCalc6Title => 'Calc 6 — Auto projector count + brightness';

  @override
  String videoCalcLabel(Object n) {
    return 'Calc $n';
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
    return 'Ratio: $value';
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
      'Indicative calculations. Always check manufacturer documentation.';

  @override
  String get videoDistanceHint => 'e.g.: 12.0';

  @override
  String get videoDistanceLabel => 'Throw distance (m)';

  @override
  String get videoErrImpossibleDenom => '❌ Impossible parameters (denom ≤ 0).';

  @override
  String get videoErrOverlapRange => '❌ Overlap% must be between 0 and 99.9.';

  @override
  String get videoErrRatioGt0 => '❌ Ratio must be > 0.';

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
  String get videoFormatLabel => 'Format (aspect ratio)';

  @override
  String get videoGainHint => 'e.g.: 1.0';

  @override
  String get videoGainLabel => 'Gain';

  @override
  String get videoImageWidthHint => 'e.g.: 6.0';

  @override
  String get videoImageWidthLabel => 'Image width (m)';

  @override
  String get videoLedCalcTitle => 'Calc — Pixels / tiles';

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
    return 'X $x mm • Y $y mm';
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
    return '✅ Wall resolution: $wallWpx × $wallHpx px\\n✅ Wall size: $wallWm × $wallHm m\\nTile: $tileWpx×$tileHpx px • $tileWcm×$tileHcm cm\\nComputed pitch: $pitch';
  }

  @override
  String get videoLedSubtitle =>
      'LED wall pixels based on size, pitch, tile dimensions.';

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
  String get videoLedTilesXHint => 'e.g.: 15';

  @override
  String get videoLedTilesXLabel => 'Horizontal tiles (X)';

  @override
  String get videoLedTilesYHint => 'e.g.: 8';

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
  String get videoLmCalc1Title => 'Calc 1 — Ratio (Distance / Width)';

  @override
  String get videoLmCalc2Title => 'Calc 2 — Width (Distance / Ratio)';

  @override
  String get videoLmCalc3Title => 'Calc 3 — Height (Width + Format)';

  @override
  String get videoLmDistanceHint => 'e.g.: 12.0';

  @override
  String get videoLmDistanceLabel => 'Throw distance (m)';

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
  String get videoLmFormatLabel => 'Format (aspect ratio)';

  @override
  String get videoLmImageWidthHint => 'e.g.: 6.0';

  @override
  String get videoLmImageWidthLabel => 'Image width (m)';

  @override
  String videoLmResultHeight(Object format, Object height) {
    return '✅ Height = $height m (format $format)';
  }

  @override
  String videoLmResultRatio(Object ratio) {
    return '✅ Throw ratio = $ratio';
  }

  @override
  String videoLmResultWidth(Object width) {
    return '✅ Image width = $width m';
  }

  @override
  String get videoLmThrowRatioHint => 'e.g.: 1.60';

  @override
  String get videoLmThrowRatioLabel => 'Throw ratio';

  @override
  String get videoLumensHint => 'e.g.: 20000';

  @override
  String get videoLumensLabel => 'Lumens (ANSI)';

  @override
  String get videoMireHeaderSubtitle =>
      'Indicative patterns (alignment, focus, geometry, blend, pixel perfect).';

  @override
  String get videoMireHeaderTitle => 'Test pattern generator';

  @override
  String get videoMireScreenLedSubtitle =>
      'Pattern based on W×H px (pixel perfect, uniformity, grid).';

  @override
  String get videoMireScreenLedTitle => 'LED screen test pattern';

  @override
  String get videoMireScreenVideoSubtitle =>
      'Simple (W×H px) + multi-projector mapping (N + overlap).';

  @override
  String get videoMireScreenVideoTitle => 'Video screen test pattern';

  @override
  String get videoMireTitle => 'Test patterns';

  @override
  String get videoMpCalc5Title => 'Calc 5 — Width per projector';

  @override
  String get videoMpCalc6Title =>
      'Calc 6 — Number of projectors (min/max ratio)';

  @override
  String videoMpCaseOpenMin(Object coverage, Object n) {
    return 'Widest ratio case (min) = $n projectors | coverage ≈ $coverage m';
  }

  @override
  String videoMpCaseTightMax(Object coverage, Object n) {
    return 'Tightest ratio case (max) = $n projectors | coverage ≈ $coverage m';
  }

  @override
  String get videoMpDistanceHint => 'e.g.: 12.0';

  @override
  String get videoMpDistanceLabel => 'Throw distance (m)';

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
      '❌ Missing data: Min ratio and/or Max ratio.';

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
  String get videoMpFormatLabel => 'Format (aspect ratio)';

  @override
  String get videoMpGainHint => 'e.g.: 1.0';

  @override
  String get videoMpGainLabel => 'Gain';

  @override
  String get videoMpLumensPerProjectorHint => 'e.g.: 20000';

  @override
  String get videoMpLumensPerProjectorLabel => 'Lumens per projector';

  @override
  String get videoMpLumiErrLumensGainGt0 =>
      'Brightness: ❌ Lumens/projector and gain must be > 0.';

  @override
  String videoMpLumiEstimated(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Estimated brightness (N=$n)\\nArea: $area m²\\nEq lux: $lux\\nNits: $nits | ft‑L: $fl';
  }

  @override
  String get videoMpLumiOptionalHint =>
      'Brightness (optional): enter Lumens/projector + Gain to estimate.';

  @override
  String get videoMpNoteIndicative => 'Note: indicative estimate.';

  @override
  String get videoMpOptionalLuminanceTitle => 'Optional: brightness';

  @override
  String get videoMpOverlapHint => 'e.g.: 10';

  @override
  String get videoMpOverlapLabel => 'Overlap (%)';

  @override
  String get videoMpProjectorCountHint => 'e.g.: 2';

  @override
  String get videoMpProjectorCountLabel => 'Number of projectors (N)';

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
      'Overlap + width/projector + number of projectors (calculations 5 & 6).';

  @override
  String get videoMultiprojectorTitle => 'Multi-projector';

  @override
  String get videoOptionalBrightnessTitle => 'Optional: brightness';

  @override
  String get videoOverlapHint => 'e.g.: 10';

  @override
  String get videoOverlapLabel => 'Overlap (%)';

  @override
  String get videoPdfCalc1 => 'Calc 1';

  @override
  String get videoPdfCalc2 => 'Calc 2';

  @override
  String get videoPdfCalc3 => 'Calc 3';

  @override
  String get videoPdfCalc4 => 'Calc 4';

  @override
  String get videoPdfCalc5 => 'Calc 5';

  @override
  String get videoPdfCalc5N => 'N (calc 5)';

  @override
  String get videoPdfCalc6 => 'Calc 6';

  @override
  String get videoPdfCalc6Gain => 'Gain (calc 6)';

  @override
  String get videoPdfCalc6LumensPerProj => 'Lumens/projector (calc 6)';

  @override
  String get videoPdfCalc6RatioMax => 'Max ratio (calc 6)';

  @override
  String get videoPdfCalc6RatioMin => 'Min ratio (calc 6)';

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
  String get videoPdfTitle => 'My Tech App – Video Export';

  @override
  String get videoPdfTotalWidth => 'Total width (m)';

  @override
  String get videoPresetFrontGrey => 'Front - grey screen (gain 0.8)';

  @override
  String get videoPresetFrontGreyShort => 'Front - grey screen';

  @override
  String get videoPresetFrontHighGain => 'Front - high gain screen (gain 1.3)';

  @override
  String get videoPresetFrontHighGainShort => 'Front - high gain screen';

  @override
  String get videoPresetFrontWhite => 'Front - matte white screen (gain 1.0)';

  @override
  String get videoPresetFrontWhiteShort => 'Front - matte white screen';

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
  String get videoPresetMappingLightStoneShort => 'Mapping - light stone';

  @override
  String get videoPresetMappingMatte => 'Mapping - matte paint (gain 0.75)';

  @override
  String get videoPresetMappingMatteShort => 'Mapping - matte paint';

  @override
  String get videoPresetMappingSatin => 'Mapping - satin paint (gain 0.9)';

  @override
  String get videoPresetMappingSatinShort => 'Mapping - satin paint';

  @override
  String get videoPresetRearClear => 'Rear - clear screen (gain 0.9)';

  @override
  String get videoPresetRearClearShort => 'Rear - clear screen';

  @override
  String get videoPresetRearDiffusion => 'Rear - diffusion screen (gain 0.7)';

  @override
  String get videoPresetRearDiffusionShort => 'Rear - diffusion screen';

  @override
  String get videoScreenPresetLabel => 'Screen / Surface (preset)';

  @override
  String get videoSummaryPillsTitle => 'Summary (pills)';

  @override
  String get videoTestPatternSubtitle =>
      'Create video test patterns for screens and LED walls (later).';

  @override
  String get videoTestPatternTitle => 'Test pattern';

  @override
  String get videoThrowRatioHint => 'e.g.: 1.60';

  @override
  String get videoThrowRatioLabel => 'Throw ratio';

  @override
  String get videoTitle => 'Video';

  @override
  String get videoToolsTitle => 'Video tools';

  @override
  String get videoTotalWidthHint => 'e.g.: 18.0';

  @override
  String get videoTotalWidthLabel => 'Total projection width (m)';

  @override
  String get aboutArtnetTitle =>
      'Art-Net — DMX universes over IP (simple & complete)';

  @override
  String get aboutArtnetToc01 => '1) Art‑Net — what it is and why';

  @override
  String get aboutArtnetToc02 => '2) Addressing & universes — clean mapping';

  @override
  String get aboutArtnetToc03 => '3) Limits & performance — what breaks first';

  @override
  String get aboutArtnetToc04 => '4) Nodes, splitters & RDM';

  @override
  String get aboutArtnetToc05 => '5) Troubleshooting — symptoms → causes';

  @override
  String get aboutArtnetToc06 => '6) Diagrams (network / unicast vs broadcast)';

  @override
  String get aboutArtnetToc07 => '6bis) Images (assets) — RJ45/switch/cables';

  @override
  String get aboutArtnetToc08 => '7) Quick checklist';

  @override
  String get aboutDmxToc01 => '1) DMX, universes, addresses — the basics';

  @override
  String get aboutDmxToc02 => '2) DMX frame — break, start code, channels';

  @override
  String get aboutDmxToc03 => '3) RS‑485 wiring — topology & cable';

  @override
  String get aboutDmxToc04 => '4) Termination & splitters — avoid reflections';

  @override
  String get aboutDmxToc05 => '4bis) RDM — limits & compatibility';

  @override
  String get aboutDmxToc06 => '5) Field troubleshooting — symptoms → causes';

  @override
  String get aboutDmxToc07 => '6) Art‑Net — field pointers';

  @override
  String get aboutDmxToc08 => '7) sACN / E1.31 — multicast, IGMP, priorities';

  @override
  String get aboutDmxToc09 => '8) DMX vs Art‑Net vs sACN — choosing';

  @override
  String get aboutDmxToc10 => '9) Field diagrams (DMX / IP / pinout)';

  @override
  String get aboutDmxToc11 => '10) Quick checklist';

  @override
  String get aboutElectriciteTitle => 'Electrical — field notes';

  @override
  String get aboutElectriciteToc01 => '1) Basics (W, A, V, kW)';

  @override
  String get aboutElectriciteToc02 => '2) Connectors (Schuko / CEE / PowerCON)';

  @override
  String get aboutElectriciteToc03 =>
      '3) Single‑phase / three‑phase (what changes)';

  @override
  String get aboutElectriciteToc04 => '4) Quick table (16A → 400A)';

  @override
  String get aboutElectriciteToc05 => '5) Safety & field pitfalls';

  @override
  String get aboutElectriciteToc06 => '6) Checklist';

  @override
  String get aboutInformatiqueTitle => 'IT — field notes';

  @override
  String get aboutInformatiqueToc01 => '1) USB / USB‑C / Thunderbolt';

  @override
  String get aboutInformatiqueToc02 => '2) Storage (SATA / NVMe / SSD)';

  @override
  String get aboutInformatiqueToc03 => '3) Video links (DP / HDMI)';

  @override
  String get aboutInformatiqueToc04 => '4) PCIe / GPU (markers)';

  @override
  String get aboutInformatiqueToc05 => '5) Checklist (on site)';

  @override
  String get aboutIpBasicsToc01 =>
      '1) What is an IP address and what is it for?';

  @override
  String get aboutIpBasicsToc02 =>
      '2) Why 192.x / 10.x / 172.x? (private addresses)';

  @override
  String get aboutIpBasicsToc03 =>
      '3) Subnet mask & subnets: actually understanding it';

  @override
  String get aboutIpBasicsToc04 => '4) DHCP, gateway, DNS: who does what?';

  @override
  String get aboutIpBasicsToc05 =>
      '5) How two devices talk (LAN vs outside LAN)';

  @override
  String get aboutIpBasicsToc06 =>
      '6) Simple “show” IP plans (copy‑paste examples)';

  @override
  String get aboutIpBasicsToc07 =>
      '7) Troubleshooting: symptoms → causes (field method)';

  @override
  String get aboutIpBasicsToc08 =>
      '8) Mini‑exercises (quickly verify a mask / a network)';

  @override
  String get aboutIpBasicsToc09 => '9) Quick checklist';

  @override
  String get aboutNetworkTitle => 'Lighting network — VLAN, IGMP, Wi‑Fi';

  @override
  String get aboutNetworkToc01 => '1) Goal: a stable network';

  @override
  String get aboutNetworkToc02 => '2) IP plan (simple)';

  @override
  String get aboutNetworkToc03 => '3) VLAN (segmentation)';

  @override
  String get aboutNetworkToc04 => '4) IGMP (sACN multicast)';

  @override
  String get aboutNetworkToc05 => '5) Wi‑Fi vs wired';

  @override
  String get aboutNetworkToc06 => '6) Switch: what you need';

  @override
  String get aboutNetworkToc07 => '7) Diagrams';

  @override
  String get aboutNetworkToc08 => '7bis) Images (assets)';

  @override
  String get aboutNetworkToc09 => '8) Checklist';

  @override
  String get aboutReseauTitle => 'Networking — field notes';

  @override
  String get aboutReseauToc01 => '1) Network basics (LAN / IP / bandwidth)';

  @override
  String get aboutReseauToc02 => '2) RJ45 & categories (Cat5e/6/6A/…)';

  @override
  String get aboutReseauToc03 => '3) PoE (power over Ethernet)';

  @override
  String get aboutReseauToc04 => '4) Fiber (SM/MM) + connectors (LC/SC)';

  @override
  String get aboutReseauToc05 => '5) SFP / SFP+ / QSFP (modules)';

  @override
  String get aboutReseauToc06 => '6) Switches (VLAN / IGMP / QoS)';

  @override
  String get aboutReseauToc07 => '7) Art‑Net / sACN on a network (tips)';

  @override
  String get aboutReseauToc08 => '8) Checklist';

  @override
  String get aboutSacnToc01 => '1) What is sACN for?';

  @override
  String get aboutSacnToc02 => '2) Universes (numbering)';

  @override
  String get aboutSacnToc03 => '3) Multicast / Unicast + IGMP';

  @override
  String get aboutSacnToc04 => '4) Priorities (multiple sources)';

  @override
  String get aboutSacnToc05 => '5) Limits / performance';

  @override
  String get aboutSacnToc06 => '6) RDM & sACN (proxy / hardware‑dependent)';

  @override
  String get aboutSacnToc07 => '7) Diagrams';

  @override
  String get aboutSacnToc08 => '7bis) Images (assets)';

  @override
  String get aboutSacnToc09 => '8) Checklist';

  @override
  String get aboutVideoToc01 => '1) Video basics (keywords)';

  @override
  String get aboutVideoToc02 => '2) Resolution & FPS';

  @override
  String get aboutVideoToc03 => '3) Color (4:4:4 / 4:2:2 / 10‑bit)';

  @override
  String get aboutVideoToc04 => '4) Sync (Genlock / Timecode)';

  @override
  String get aboutVideoToc05 => '5) Cables & distances';

  @override
  String get aboutVideoToc06 => '6) SDI (3G / 6G / 12G)';

  @override
  String get aboutVideoToc07 => '7) HDMI — field notes';

  @override
  String get aboutVideoToc08 => '8) NDI — when / why / limits';

  @override
  String get aboutVideoToc09 => '9) Mapping / LED / multi‑projector';

  @override
  String get aboutVideoToc10 => '10) Field checklist';

  @override
  String get aboutTileDmxTitle => 'DMX — how it works (simple & complete)';

  @override
  String get aboutTileArtnetTitle =>
      'Art‑Net — DMX over IP (nodes, unicast/broadcast)';

  @override
  String get aboutTileSacnTitle => 'sACN / E1.31 — multicast, IGMP, priorities';

  @override
  String get aboutTileIpBasicsTitle =>
      'Network — IP basics / subnet mask / DHCP (essential)';

  @override
  String get aboutTileReseauTitle =>
      'Networking — RJ45 / fiber / bandwidth & distances';

  @override
  String get aboutTileNetworkTitle =>
      'Lighting network — VLAN, IGMP, Wi‑Fi vs wired';

  @override
  String get aboutTileVideoTitle => 'Video — SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutTileElectriciteTitle => 'Electrical — Schuko / CEE / power';

  @override
  String get aboutTileElectriciteSubtitle =>
      'Connectors, 1‑phase/3‑phase, quick kW tables (16A→400A), field pitfalls.';

  @override
  String get aboutTileInformatiqueTitle =>
      'IT — USB / HDMI / DP / SATA / NVMe…';

  @override
  String get aboutTileInformatiqueSubtitle =>
      'Useful throughput, versions, real limits, marketing traps.';

  @override
  String get aboutTitle => 'À propos';
}
