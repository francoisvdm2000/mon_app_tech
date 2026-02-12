// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'My Tech App';

  @override
  String get homeTitle => 'Home';

  @override
  String get menuTitle => 'Menu';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get languageSystem => 'System (automatic)';

  @override
  String get languageSystemCurrent => 'Phone language';

  @override
  String get legalNotices => 'Legal notices';

  @override
  String get resetConsents => 'Reset consents';

  @override
  String get consentsReset => 'Consents reset.';

  @override
  String get homeVideoTitle => 'Video';

  @override
  String get homeVideoSubtitle =>
      'Lens & measurement, brightness, multi-projector, LED and test patterns.';

  @override
  String get homeLightTitle => 'Lighting';

  @override
  String get homeLightSubtitle =>
      'Projection size, DMX dip-switch, photometry, catalog, DMX patch.';

  @override
  String get homeLaserTitle => 'Laser';

  @override
  String get homeLaserSubtitle =>
      'Laser calculations and safety (consent required on each entry).';

  @override
  String get homeReferencesTitle => 'References';

  @override
  String get homeReferencesSubtitle =>
      'DMX / network / video: field sheets & on-site references.';

  @override
  String get disclaimerTitle => '⚠️ LEGAL WARNING & DISCLAIMER';

  @override
  String get disclaimerText =>
      'FOR INFORMATIONAL USE ONLY\n\nThe calculations provided by this application (video, lighting, laser) are for informational and indicative purposes only.\nThey do not replace:\n- certified calculations,\n- technical studies,\n- applicable official standards,\n- or validation by a qualified professional.\n\nLIABILITY\nThe publisher of this application cannot be held liable for calculation errors, omissions, equipment damage,\npersonal injury, or any incident occurring during installation, operation, or use of equipment.\n\nVIDEO & PROJECTION\nResults (sizes, ratios, brightness, overlaps, etc.) are based on theoretical models and may vary depending on:\noptics, zoom, uniformity, ambient light, surface, settings, etc.\nAlways verify with official manufacturer documentation.\n\nLIGHTING\nCalculations are indicative and do not take into account all real-world conditions (tolerances, optical losses,\nsource degradation, local standards, ambient conditions…).\n\nLASER – SAFETY\nNOHD, SZED and CZED calculations are based on standard assumptions and theoretical thresholds.\nThey do not take into account, in particular:\n- optical instruments (binoculars, cameras, telescopes…),\n- atmospheric conditions (fog, rain, dust…),\n- unexpected reflections, misuse, specific settings.\nUsing a laser system implies direct operator responsibility and an appropriate risk assessment.\n\nRISK ACCEPTANCE\nBy using this application, the user acknowledges:\n- having read the applicable safety rules,\n- being solely responsible for their installations,\n- assuming full responsibility for risks related to the use of equipment (video, lighting, laser),\n- systematically verifying data with official manufacturer manuals.';

  @override
  String get disclaimerCertify =>
      'I certify that I have read and accepted these conditions.';

  @override
  String get disclaimerAccept => 'I accept';

  @override
  String get laserConsentTitle => '🔴 LASER CONSENT (MANDATORY)';

  @override
  String get laserConsentText =>
      'ACCESS TO THE LASER SECTION\n\nThe LASER section of this application concerns safety calculations (e.g. NOHD, SZED, CZED).\nThese calculations are indicative and do not replace:\n- a risk assessment,\n- applicable standards,\n- operating procedures,\n- or validation by a qualified person.\n\nIMPORTANT\n- Risk of eye / skin injury in case of improper use.\n- The calculation may be wrong if the entered parameters are incomplete, incorrect, or if real-world conditions differ (optics,\n  atmospheric conditions, reflections, alignment, etc.).\n- The operator is solely responsible for installation, operation, and compliance.\n\nBy validating, you confirm that you:\n- understand the risks,\n- comply with applicable safety rules,\n- assume full responsibility in case of negligence or misuse.';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonSave => 'Save';

  @override
  String get commonRename => 'Rename';

  @override
  String get commonSearch => 'Search';

  @override
  String get commonNone => 'No records';

  @override
  String get commonCalculate => 'Calculate';

  @override
  String get commonCopyResultTooltip => 'Copy result';

  @override
  String get commonUnitMeter => 'm';

  @override
  String get commonReset => 'Reset';

  @override
  String get commonOkWithCheck => 'OK ✅';

  @override
  String get commonTooLowWithCross => 'Too low ❌';

  @override
  String get lightProjectionTitle => 'Projection size';

  @override
  String get lightProjectionDescription =>
      'Indicative spot size calculation based on angle, distance and diameter.';

  @override
  String get lightDmxSwitchTitle => 'DMX dip-switch';

  @override
  String get lightDmxSwitchDescription =>
      'Indicative conversion between DMX address and switches, with range navigation.';

  @override
  String get lightPhotometryTitle => 'Photometry';

  @override
  String get lightPhotometryDescription =>
      'Indicative conversions between lux, candela and lumen, with distance and angle.';

  @override
  String get lightCatalogTitle => 'Catalog';

  @override
  String get lightCatalogDescription =>
      'Select by manufacturer, type and product, with information and manual.';

  @override
  String get lightPatchTitle => 'DMX patch';

  @override
  String get lightPatchDescription =>
      'Import an MVR file or create a patch manually from the library.';

  @override
  String get lightDisclaimerShort =>
      'Indicative tools. Always check the manufacturer documentation.';

  @override
  String get laserInputsTitle => 'Inputs';

  @override
  String get laserPowerLabel => 'Power (mW)';

  @override
  String get laserPowerHint => 'e.g.: 5000';

  @override
  String get laserDivergenceLabel => 'Divergence (mrad)';

  @override
  String get laserDivergenceHint => 'e.g.: 1.2';

  @override
  String get laserDiameterLabel => 'Output diameter (mm)';

  @override
  String get laserDiameterHint => 'e.g.: 3.0';

  @override
  String get laserSaveCurrentProjector => 'Save this projector';

  @override
  String get laserSafetyResultsTitle => 'Safety results';

  @override
  String get laserZoneNohdDesc => 'Eye hazard';

  @override
  String get laserZoneSzedDesc => 'Sensitive zone';

  @override
  String get laserZoneCzedDesc => 'Critical zone';

  @override
  String get laserTargetDistanceLabel => 'Target distance (m)';

  @override
  String get laserTargetDistanceHint => 'e.g.: 10';

  @override
  String get laserAdviceFullPower => 'Full power allowed (100 %)';

  @override
  String laserAdviceMaxRecommended(Object percent) {
    return 'Maximum recommended power: $percent';
  }

  @override
  String get laserSavedProjectorsTitle => 'Saved projectors';

  @override
  String get laserSearchHint => 'e.g.: “RGB 5W”';

  @override
  String laserPresetSubtitle(Object p, Object div, Object diam) {
    return 'P: $p mW • Div: $div mrad • Ø: $diam mm';
  }

  @override
  String get laserSaveProjectorTitle => 'Save a projector';

  @override
  String get laserRenameProjectorTitle => 'Rename projector';

  @override
  String get laserProjectorNameLabel => 'Projector name';

  @override
  String get laserInvalidInputs =>
      'Please enter valid power, divergence and diameter values.';

  @override
  String get laserPresetAdded => 'Record added.';

  @override
  String get laserPresetDeleted => 'Record deleted.';

  @override
  String get laserNameUpdated => 'Name updated.';

  @override
  String get laserNormativeParamsTitle => 'Selected safety parameters';

  @override
  String get laserNormativeParamsBody =>
      'MPE for Nominal Ocular Hazard Distance (NOHD): 25.4 W/m²\n(IEC 60825-1, edition 3.0)\n\nMPE for Sensitive Zone Exposure Distance (SZED): 1 W/m²\n(ANSI Z136.6)\n\nMPE for Critical Zone Exposure Distance (CZED): 0.05 W/m²\n(ANSI Z136.6)';

  @override
  String get laserDisclaimerShort =>
      'Indicative calculation. Does not replace a laser safety assessment.';

  @override
  String get aboutDmxTitle => 'DMX — how it works (simple & complete)';

  @override
  String get aboutDmxSubtitle =>
      'Universes, addresses, frames, RS-485 wiring, termination, field issues.\nIncludes diagrams + checklist.';

  @override
  String get aboutArtNetTitle =>
      'Art-Net — DMX over IP (nodes, unicast/broadcast)';

  @override
  String get aboutArtNetSubtitle =>
      'DMX universes over Ethernet/UDP, nodes, broadcast vs unicast.\nReal-world limits, network stability, RDM depending on hardware.';

  @override
  String get aboutSacnTitle => 'sACN / E1.31 — multicast, IGMP, priorities';

  @override
  String get aboutSacnSubtitle =>
      'A network-oriented “pro” DMX-over-IP standard.\nMulticast/unicast, IGMP snooping/querier, multi-source priorities.';

  @override
  String get aboutIpBasicsTitle =>
      'Network — IP basics / subnet / DHCP (essential)';

  @override
  String get aboutIpBasicsSubtitle =>
      'Understand IP, subnet mask, gateway, DHCP vs static.\nConcrete examples (2.x, 10.x, 192.168.x) + checklist.';

  @override
  String get aboutLightNetworkTitle =>
      'Lighting network — VLAN, IGMP, Wi-Fi vs wired';

  @override
  String get aboutLightNetworkSubtitle =>
      'Simple and robust architecture for Art-Net/sACN.\nVLAN, IGMP snooping/querier, Wi-Fi (jitter), switches, diagrams + checklist.';

  @override
  String get aboutCablingFiberTitle =>
      'Network — RJ45 / fiber / bandwidth & distances';

  @override
  String get aboutCablingFiberSubtitle =>
      'Cat5e→Cat8, fiber OM3/OM4/OS2, LC/SC/MPO, typical distances, show best practices.';

  @override
  String get aboutVideoTitle => 'Video — SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutVideoSubtitle =>
      'Choose based on latency, reliability, cabling, LAN vs WAN.\nTables + diagram.';

  @override
  String get aboutElectricityTitle => 'Electrical — Schuko / CEE (P17) / power';

  @override
  String get aboutElectricitySubtitle =>
      'Connectors, single/three-phase, quick kW tables (16A→400A), field pitfalls.';

  @override
  String get aboutComputingTitle =>
      'Computing — USB / HDMI / DP / SATA / NVMe…';

  @override
  String get aboutComputingSubtitle =>
      'Useful bandwidth, versions, real limits, marketing traps.';

  @override
  String get videoTitle => 'Video';

  @override
  String get videoToolsTitle => 'Video tools';

  @override
  String get videoDisclaimerShort =>
      'Indicative calculations. Always check the manufacturer documentation.';

  @override
  String get videoLensMeasureTitle => 'Lens & measurement';

  @override
  String get videoLensMeasureSubtitle =>
      'Ratio / width / height (calculations 1 to 3).';

  @override
  String get videoBrightnessTitle => 'Brightness';

  @override
  String get videoBrightnessSubtitle =>
      'Lux / nits / ft-L + threshold (calculation 4).';

  @override
  String get videoMultiprojectorTitle => 'Multi-projector';

  @override
  String get videoMultiprojectorSubtitle =>
      'Overlap + width/projector + number of projectors (calculations 5 & 6).';

  @override
  String get videoLedTitle => 'LED';

  @override
  String get videoLedSubtitle =>
      'LED wall pixels based on size, pitch, tile dimensions.';

  @override
  String get videoTestPatternTitle => 'Test pattern';

  @override
  String get videoTestPatternSubtitle =>
      'Create video test patterns for screens and LED walls (later).';

  @override
  String get videoMpFormatLabel => 'Format (ratio)';

  @override
  String get videoMpCalc5Title => 'Calc 5 — Width per projector';

  @override
  String get videoMpCalc6Title =>
      'Calc 6 — Number of projectors (min/max ratio)';

  @override
  String get videoMpTotalWidthLabel => 'Total projection width (m)';

  @override
  String get videoMpTotalWidthHint => 'e.g.: 18.0';

  @override
  String get videoMpDistanceLabel => 'Throw distance (m)';

  @override
  String get videoMpDistanceHint => 'e.g.: 12.0';

  @override
  String get videoMpOverlapLabel => 'Overlap (%)';

  @override
  String get videoMpOverlapHint => 'e.g.: 10';

  @override
  String get videoMpProjectorCountLabel => 'Number of projectors (N)';

  @override
  String get videoMpProjectorCountHint => 'e.g.: 2';

  @override
  String get videoMpRatioMinLabel => 'Min ratio';

  @override
  String get videoMpRatioMinHint => 'e.g.: 1.20';

  @override
  String get videoMpRatioMaxLabel => 'Max ratio';

  @override
  String get videoMpRatioMaxHint => 'e.g.: 1.80';

  @override
  String get videoMpOptionalLuminanceTitle => 'Optional: brightness';

  @override
  String get videoMpLumensPerProjectorLabel => 'Lumens per projector';

  @override
  String get videoMpLumensPerProjectorHint => 'e.g.: 20000';

  @override
  String get videoMpGainLabel => 'Gain';

  @override
  String get videoMpGainHint => 'e.g.: 1.0';

  @override
  String get videoMpErrMissing5 =>
      '❌ Missing data: Total width + Overlap% + N.';

  @override
  String get videoMpErrWidthGt0 => '❌ Total width must be > 0.';

  @override
  String get videoMpErrNGte2 => '❌ N must be ≥ 2.';

  @override
  String get videoMpErrOverlapRange => '❌ Overlap% must be between 0 and 99.9.';

  @override
  String get videoMpErrImpossibleDenom =>
      '❌ Impossible parameters (denom ≤ 0).';

  @override
  String get videoMpErrMissing6Main =>
      '❌ Missing data: Total width + Distance + Overlap%.';

  @override
  String get videoMpErrWidthDistanceGt0 =>
      '❌ Total width and distance must be > 0.';

  @override
  String get videoMpErrMissingRatios =>
      '❌ Missing data: Min ratio and/or Max ratio.';

  @override
  String get videoMpErrInvalidRatio => '❌ Invalid ratio (must be > 0).';

  @override
  String get videoMpLumiOptionalHint =>
      'Brightness (optional): enter Lumens/projector + Gain to estimate.';

  @override
  String get videoMpLumiErrLumensGainGt0 =>
      'Brightness: ❌ Lumens/projector and gain must be > 0.';

  @override
  String videoMpCaseOpenMin(Object n, Object coverage) {
    return 'Widest ratio case (min) = $n projectors | coverage ≈ $coverage m';
  }

  @override
  String videoMpCaseTightMax(Object n, Object coverage) {
    return 'Tightest ratio case (max) = $n projectors | coverage ≈ $coverage m';
  }

  @override
  String videoMpLumiEstimated(
      Object n, Object area, Object lux, Object nits, Object fl) {
    return 'Estimated brightness (N=$n)\nArea: $area m²\nEq lux: $lux\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoMpNoteIndicative => 'Note: indicative estimate.';

  @override
  String get videoLmFormatLabel => 'Format (ratio)';

  @override
  String get videoLmCalc1Title => 'Calc 1 — Ratio (Distance / Width)';

  @override
  String get videoLmCalc2Title => 'Calc 2 — Width (Distance / Ratio)';

  @override
  String get videoLmCalc3Title => 'Calc 3 — Height (Width + Format)';

  @override
  String get videoLmDistanceLabel => 'Throw distance (m)';

  @override
  String get videoLmDistanceHint => 'e.g.: 12.0';

  @override
  String get videoLmImageWidthLabel => 'Image width (m)';

  @override
  String get videoLmImageWidthHint => 'e.g.: 6.0';

  @override
  String get videoLmThrowRatioLabel => 'Throw ratio';

  @override
  String get videoLmThrowRatioHint => 'e.g.: 1.60';

  @override
  String get videoLmErrMissingDistanceWidth =>
      '❌ Missing data: Distance + Width.';

  @override
  String get videoLmErrMissingDistanceRatio =>
      '❌ Missing data: Distance + Ratio.';

  @override
  String get videoLmErrMissingWidthOnly => '❌ Missing data: Width.';

  @override
  String get videoLmErrWidthGt0 => '❌ Width must be > 0.';

  @override
  String get videoLmErrRatioGt0 => '❌ Ratio must be > 0.';

  @override
  String videoLmResultRatio(Object ratio) {
    return '✅ Throw ratio = $ratio';
  }

  @override
  String videoLmResultWidth(Object width) {
    return '✅ Image width = $width m';
  }

  @override
  String videoLmResultHeight(Object height, Object format) {
    return '✅ Height = $height m (format $format)';
  }

  @override
  String get videoLedCalcTitle => 'Calc — Pixels / tiles';

  @override
  String get videoLedTilesXLabel => 'Horizontal tiles (X)';

  @override
  String get videoLedTilesXHint => 'e.g.: 15';

  @override
  String get videoLedTilesYLabel => 'Vertical tiles (Y)';

  @override
  String get videoLedTilesYHint => 'e.g.: 8';

  @override
  String get videoLedTileWpxLabel => 'Tile width (px)';

  @override
  String get videoLedTileWpxHint => 'e.g.: 128';

  @override
  String get videoLedTileHpxLabel => 'Tile height (px)';

  @override
  String get videoLedTileHpxHint => 'e.g.: 128';

  @override
  String get videoLedTileWcmLabel => 'Tile width (cm)';

  @override
  String get videoLedTileWcmHint => 'e.g.: 33.28';

  @override
  String get videoLedTileHcmLabel => 'Tile height (cm)';

  @override
  String get videoLedTileHcmHint => 'e.g.: 33.28';

  @override
  String get videoLedErrMissingInputs =>
      '❌ Missing data: Tiles X/Y + Tile px + Tile cm.';

  @override
  String get videoLedErrAllGt0 => '❌ All values must be > 0.';

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
      Object wallWpx,
      Object wallHpx,
      Object wallWm,
      Object wallHm,
      Object tileWpx,
      Object tileHpx,
      Object tileWcm,
      Object tileHcm,
      Object pitch) {
    return '✅ Wall resolution: $wallWpx × $wallHpx px\n✅ Wall size: $wallWm × $wallHm m\nTile: $tileWpx×$tileHpx px • $tileWcm×$tileHcm cm\nComputed pitch: $pitch';
  }

  @override
  String get videoCalculationsTitle => 'Video calculations';

  @override
  String get videoCopyAllTooltip => 'Copy all results';

  @override
  String get videoExportPdfTooltip => 'Export PDF';

  @override
  String get videoCalculateAll => 'Calculate all';

  @override
  String get videoSummaryPillsTitle => 'Summary (pills)';

  @override
  String get videoCopySummaryTooltip => 'Copy summary';

  @override
  String get videoCommonParamsTitle => 'Common parameters';

  @override
  String get videoFormatLabel => 'Format (ratio)';

  @override
  String get videoDistanceLabel => 'Throw distance (m)';

  @override
  String get videoDistanceHint => 'e.g.: 12.0';

  @override
  String get videoImageWidthLabel => 'Image width (m)';

  @override
  String get videoImageWidthHint => 'e.g.: 6.0';

  @override
  String get videoThrowRatioLabel => 'Throw ratio';

  @override
  String get videoThrowRatioHint => 'e.g.: 1.60';

  @override
  String get videoLumensLabel => 'Lumens (ANSI)';

  @override
  String get videoLumensHint => 'e.g.: 20000';

  @override
  String get videoGainLabel => 'Gain';

  @override
  String get videoGainHint => 'e.g.: 1.0';

  @override
  String get videoScreenPresetLabel => 'Screen / Surface (preset)';

  @override
  String get videoPresetFrontWhite => 'Front - matte white screen (gain 1.0)';

  @override
  String get videoPresetFrontGrey => 'Front - grey screen (gain 0.8)';

  @override
  String get videoPresetFrontHighGain => 'Front - high gain screen (gain 1.3)';

  @override
  String get videoPresetRearDiffusion => 'Rear - diffusion fabric (gain 0.7)';

  @override
  String get videoPresetRearClear => 'Rear - clear fabric (gain 0.9)';

  @override
  String get videoPresetMappingMatte => 'Mapping - matte paint (gain 0.75)';

  @override
  String get videoPresetMappingSatin => 'Mapping - satin paint (gain 0.9)';

  @override
  String get videoPresetMappingLightStone => 'Mapping - light stone (gain 0.6)';

  @override
  String get videoPresetMappingDarkStone => 'Mapping - dark stone (gain 0.35)';

  @override
  String get videoPresetMappingGlass => 'Mapping - glass (gain 0.15)';

  @override
  String get videoPresetFrontWhiteShort => 'Front - matte white screen';

  @override
  String get videoPresetFrontGreyShort => 'Front - grey screen';

  @override
  String get videoPresetFrontHighGainShort => 'Front - high gain screen';

  @override
  String get videoPresetRearDiffusionShort => 'Rear - diffusion fabric';

  @override
  String get videoPresetRearClearShort => 'Rear - clear fabric';

  @override
  String get videoPresetMappingMatteShort => 'Mapping - matte paint';

  @override
  String get videoPresetMappingSatinShort => 'Mapping - satin paint';

  @override
  String get videoPresetMappingLightStoneShort => 'Mapping - light stone';

  @override
  String get videoPresetMappingDarkStoneShort => 'Mapping - dark stone';

  @override
  String get videoPresetMappingGlassShort => 'Mapping - glass';

  @override
  String get videoOverlapLabel => 'Overlap (%)';

  @override
  String get videoOverlapHint => 'e.g.: 10';

  @override
  String get videoTotalWidthLabel => 'Total projection width (m)';

  @override
  String get videoTotalWidthHint => 'e.g.: 18.0';

  @override
  String get videoCalc1Title => 'Calc 1 — Ratio (Distance / Width)';

  @override
  String get videoCalc2Title => 'Calc 2 — Width (Distance / Ratio)';

  @override
  String get videoCalc3Title => 'Calc 3 — Height (Width + Format)';

  @override
  String get videoCalc4Title =>
      'Calc 4 — Brightness (lux / nits / ft-L + threshold)';

  @override
  String get videoCalc5Title => 'Calc 5 — Overlap (Total width + N)';

  @override
  String get videoCalc6Title => 'Calc 6 — Auto projector count + brightness';

  @override
  String get videoCalc5NLabel => 'Number of projectors (N)';

  @override
  String get videoCalc5NHint => 'e.g.: 2';

  @override
  String get videoCalc6RatioMinLabel => 'Min ratio';

  @override
  String get videoCalc6RatioMinHint => 'e.g.: 1.20';

  @override
  String get videoCalc6RatioMaxLabel => 'Max ratio';

  @override
  String get videoCalc6RatioMaxHint => 'e.g.: 1.80';

  @override
  String get videoOptionalBrightnessTitle => 'Optional: brightness';

  @override
  String get videoCalc6LumensPerProjectorLabel => 'Lumens per projector';

  @override
  String get videoCalc6LumensPerProjectorHint => 'e.g.: 20000';

  @override
  String get videoCalc6GainLabel => 'Gain (calc 6)';

  @override
  String get videoCalc6GainHint => 'e.g.: 1.0';

  @override
  String get videoCalc1ErrMissing => '❌ Missing data: Distance + Width.';

  @override
  String get videoCalc2ErrMissing => '❌ Missing data: Distance + Ratio.';

  @override
  String get videoCalc3ErrMissingWidth => '❌ Missing data: Width.';

  @override
  String get videoErrWidthGt0 => '❌ Width must be > 0.';

  @override
  String get videoErrRatioGt0 => '❌ Ratio must be > 0.';

  @override
  String videoCalc1Ok(Object ratio) {
    return '✅ Throw ratio = $ratio';
  }

  @override
  String videoCalc2Ok(Object width) {
    return '✅ Image width = $width m';
  }

  @override
  String videoCalc3Ok(Object height, Object format) {
    return '✅ Height = $height m (format $format)';
  }

  @override
  String get videoCalc4ErrMissing => '❌ Missing data: Lumens + Gain + Width.';

  @override
  String get videoCalc4ErrGt0 => '❌ Lumens/Gain/Width must be > 0.';

  @override
  String videoCalc4Result(Object area, Object format, Object lux, Object luxEq,
      Object nits, Object fl, Object presetLabel, Object minFl, Object status) {
    return 'Area: $area m² (format $format)\nLux (lm/m²): $lux\nEq lux (gain): $luxEq\nLuminance: $nits nits | $fl ft-L\nMinimum threshold ($presetLabel): $minFl ft-L → $status\nNote: nits/ft-L conversion based on a Lambertian assumption (approx).';
  }

  @override
  String get videoCalc5ErrMissing =>
      '❌ Missing data: Total width + Overlap% + Number of projectors.';

  @override
  String get videoErrTotalWidthGt0 => '❌ Total width must be > 0.';

  @override
  String get videoCalc5ErrNMin2 => '❌ Number of projectors must be ≥ 2.';

  @override
  String get videoErrOverlapRange => '❌ Overlap% must be between 0 and 99.9.';

  @override
  String get videoErrImpossibleDenom => '❌ Impossible parameters (denom ≤ 0).';

  @override
  String videoCalc5Result(Object wTot, Object n, Object overlapPct, Object wPer,
      Object overlapM, Object format, Object hTot) {
    return 'Total width: $wTot m\nN: $n | Overlap: $overlapPct% (on projector width)\n\n- Width per projector: $wPer m\n- Overlap between 2 projectors: $overlapM m\n- Total height (format $format): $hTot m';
  }

  @override
  String get videoCalc6ErrMissingBasics =>
      '❌ Missing data: Total width + Distance + Overlap%.';

  @override
  String get videoErrTotalWidthAndDistanceGt0 =>
      '❌ Total width and distance must be > 0.';

  @override
  String get videoCalc6ErrMissingRatio =>
      '❌ Missing data: Min ratio and/or Max ratio.';

  @override
  String get videoCalc6LumiOptional =>
      'Brightness (optional): enter Lumens/projector + Gain for the estimate.';

  @override
  String get videoCalc6LumiErrGt0 =>
      'Brightness: ❌ Lumens/projector and gain must be > 0.';

  @override
  String videoCalc6LumiForN(
      Object n, Object area, Object lux, Object nits, Object fl) {
    return 'Estimated brightness (N=$n)\nArea: $area m²\nEq lux: $lux (lm/m²)\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoCalc6NoteIndicative =>
      'Note: indicative estimate (real blend/overlap may reduce it slightly).';

  @override
  String videoCalc6Result(
      Object wTot,
      Object distance,
      Object overlapPct,
      Object format,
      Object hTot,
      Object area,
      Object ratioMin,
      Object ratioMax,
      Object nMin,
      Object covMin,
      Object lumiMin,
      Object nMax,
      Object covMax,
      Object lumiMax,
      Object note) {
    return 'Total width=$wTot m | Distance=$distance m | Overlap=$overlapPct%\nFormat $format → Total height=$hTot m | Area=$area m²\nMin/max ratio: $ratioMin → $ratioMax\n\nWidest ratio case (min) = $nMin projectors | coverage ≈ $covMin m\n$lumiMin\n\nTightest ratio case (max) = $nMax projectors | coverage ≈ $covMax m\n$lumiMax\n\n$note';
  }

  @override
  String videoCommonPillFormat(Object format) {
    return 'Format: $format';
  }

  @override
  String videoCommonPillDistance(Object value) {
    return 'Distance: $value';
  }

  @override
  String videoCommonPillWidth(Object value) {
    return 'Width: $value';
  }

  @override
  String videoCommonPillRatio(Object value) {
    return 'Ratio: $value';
  }

  @override
  String videoCommonPillHeight(Object value) {
    return 'Height: $value';
  }

  @override
  String videoCommonPillArea(Object value) {
    return 'Area: $value';
  }

  @override
  String videoCommonPillTotalWidth(Object value) {
    return 'Total width: $value';
  }

  @override
  String videoCommonPillOverlap(Object value) {
    return 'Overlap: $value';
  }

  @override
  String get videoPdfTitle => 'My Tech App – Video Export';

  @override
  String get videoPdfDate => 'Date';

  @override
  String get videoPdfFormat => 'Format';

  @override
  String get videoPdfDistance => 'Distance (m)';

  @override
  String get videoPdfImageWidth => 'Image width (m)';

  @override
  String get videoPdfRatio => 'Ratio';

  @override
  String get videoPdfLumens => 'Lumens';

  @override
  String get videoPdfGain => 'Gain';

  @override
  String get videoPdfScreenPreset => 'Screen preset';

  @override
  String get videoPdfOverlap => 'Overlap (%)';

  @override
  String get videoPdfTotalWidth => 'Total width (m)';

  @override
  String get videoPdfCalc5N => 'N (calc 5)';

  @override
  String get videoPdfCalc6RatioMin => 'Min ratio (calc 6)';

  @override
  String get videoPdfCalc6RatioMax => 'Max ratio (calc 6)';

  @override
  String get videoPdfCalc6LumensPerProj => 'Lumens/projector (calc 6)';

  @override
  String get videoPdfCalc6Gain => 'Gain (calc 6)';

  @override
  String get videoPdfParams => 'Parameters';

  @override
  String get videoPdfResults => 'Results';

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
  String get videoPdfCalc6 => 'Calc 6';

  @override
  String videoCalcLabel(Object n) {
    return 'Calc $n';
  }

  @override
  String get videoBrightnessSectionTitle =>
      'Calc 4 — Lux / nits / ft-L + threshold';

  @override
  String get videoCalc4ErrMissingSimple =>
      '❌ Missing data: Width + Lumens + Gain.';

  @override
  String videoBrightnessResult(
      Object format,
      Object area,
      Object lux,
      Object luxEq,
      Object nits,
      Object fl,
      Object presetLabel,
      Object minFl,
      Object status) {
    return 'Format: $format\nArea: $area m²\nLux (lm/m²): $lux\nEq lux (gain): $luxEq\nLuminance: $nits nits | $fl ft-L\nMinimum threshold ($presetLabel): $minFl ft-L → $status\nNote: indicative estimate (Lambert).';
  }

  @override
  String get videoMireTitle => 'Test pattern';

  @override
  String get videoMireHeaderTitle => 'Test pattern generator';

  @override
  String get videoMireHeaderSubtitle =>
      'Indicative patterns (alignment, focus, geometry, blend, pixel perfect).';

  @override
  String get videoMireScreenVideoTitle => 'Video screen pattern';

  @override
  String get videoMireScreenVideoSubtitle =>
      'Simple (WxH px) + multi-projector mapping (N + overlap).';

  @override
  String get videoMireScreenLedTitle => 'LED screen pattern';

  @override
  String get videoMireScreenLedSubtitle =>
      'Pattern based on WxH px (pixel perfect, uniformity, grid).';

  @override
  String get mireVideoSimpleTitle => 'VIDEO / SIMPLE PATTERN';

  @override
  String get mireVideoComboTitle => 'VIDEO / COMBO PATTERN';

  @override
  String get mireVideoMappingTitle => 'VIDEO / MAPPING PATTERN';

  @override
  String get mireLedTitle => 'LED / PATTERN';

  @override
  String get mireLedTilesIdTitle => 'LED / TILE IDs';

  @override
  String get mireSimpleSubtitleGridSafe => 'Grid + safe + circles';

  @override
  String get mireSimpleSubtitleCheckerboard => 'Checkerboard + circles';

  @override
  String get mireSimpleSubtitleColorBars => 'Bars + ramps + circles';

  @override
  String get mireSimpleSubtitleUniformity => 'Uniformity + circles';

  @override
  String get mireSimpleSubtitleComboAll =>
      'Grid + safe + 2 centered bars + circles';

  @override
  String get mireLedSubtitlePixelPerfect => 'Pixel perfect + circles';

  @override
  String get mireLedSubtitleGridLabels => 'Grid + markers + circles';

  @override
  String get mireLedSubtitleColorBars => 'Bars + ramps + circles';

  @override
  String get mireLedSubtitleUniformity => 'Uniformity + circles';

  @override
  String mireMappingSubtitlePattern(Object n, Object orient, Object percent) {
    return 'N=$n • Overlap $percent% • $orient';
  }

  @override
  String get mireOrientationHorizontal => 'Horizontal';

  @override
  String get mireOrientationVertical => 'Vertical';

  @override
  String mireProjectorLabelPattern(Object index) {
    return 'PROJ $index';
  }

  @override
  String get mireBlendLabel => 'BLEND';

  @override
  String get mireTileMissingPx => 'Enter Tile (px) for numbering.';

  @override
  String get mireWallNotMultipleOfTiles => 'WALL NOT A MULTIPLE OF TILES';

  @override
  String mireTilesSubtitleBase(Object nx, Object ny, Object th, Object tw) {
    return 'Tile ${tw}x$th px • Grid $nx x $ny';
  }

  @override
  String mireTilesSubtitleTilePhys(Object hcm, Object wcm) {
    return 'Tile $wcm×$hcm cm';
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
  String mireTilesSubtitleWallPhys(Object hm, Object wm) {
    return 'Wall ~ $wm×$hm m';
  }

  @override
  String get mireSimpleSectionTitle => 'Simple screen pattern';

  @override
  String get mireMappingSectionTitle => 'Multi-projector mapping pattern';

  @override
  String get mireVideoSimpleSectionTitle => 'Simple screen pattern';

  @override
  String get mireVideoMappingSectionTitle => 'Multi-projector mapping pattern';

  @override
  String get mireWidthPxLabel => 'Width (px)';

  @override
  String get mireHeightPxLabel => 'Height (px)';

  @override
  String get mireWidthPxHint => 'e.g.: 1920';

  @override
  String get mireHeightPxHint => 'e.g.: 1080';

  @override
  String get mireWidthPxHintMapping => 'e.g.: 3840';

  @override
  String get mireHeightPxHintMapping => 'e.g.: 2160';

  @override
  String get mireTypeLabel => 'Pattern type';

  @override
  String get mireExportPng => 'Export PNG';

  @override
  String get mireErrInvalidWHpx => '❌ Invalid width/height (px).';

  @override
  String get mireErrInvalidProjectors =>
      '❌ Invalid number of projectors (N > 0).';

  @override
  String get mireErrInvalidOverlap => '❌ Invalid overlap (0 to 99.9).';

  @override
  String get mireSimpleTypeComboAll =>
      'Combo (grid + circles + 2 centered bars)';

  @override
  String get mireSimpleTypeGridSafe => 'Grid + safe + circles';

  @override
  String get mireSimpleTypeColorBars => 'Bars + ramps + circles';

  @override
  String get mireSimpleTypeUniformity => 'Uniformity + circles';

  @override
  String get mireSimpleTypeCheckerboard => 'Checkerboard + circles';

  @override
  String get mireProjectorsNLabel => 'Number of projectors (N)';

  @override
  String get mireProjectorsNHint => 'e.g.: 2';

  @override
  String get mireOverlapLabel => 'Overlap (%)';

  @override
  String get mireOverlapHint => 'e.g.: 10.0';

  @override
  String get mireOrientationLabel => 'Orientation';

  @override
  String get mireMappingTypeLabel => 'Mapping type';

  @override
  String get mireMappingTypeCombo => 'Combo (zones + overlap + blend)';

  @override
  String get mireMappingTypeZonesOverlap => 'Zones + overlap';

  @override
  String get mireMappingTypeBlendRamps => 'Blend ramps';

  @override
  String get mireDash => '—';

  @override
  String mirePitchEqual(Object value) {
    return '$value mm';
  }

  @override
  String mirePitchXY(Object x, Object y) {
    return 'X $x mm • Y $y mm';
  }

  @override
  String get mireLedParamsTitle => 'LED wall parameters';

  @override
  String get mireLedTilesXLabel => 'Horizontal tiles (X)';

  @override
  String get mireLedTilesYLabel => 'Vertical tiles (Y)';

  @override
  String get mireLedTileWpxLabel => 'Tile width (px)';

  @override
  String get mireLedTileHpxLabel => 'Tile height (px)';

  @override
  String get mireLedTileWcmLabel => 'Tile width (cm)';

  @override
  String get mireLedTileHcmLabel => 'Tile height (cm)';

  @override
  String mireLedWallResolution(Object w, Object h) {
    return 'Wall resolution: $w × $h px';
  }

  @override
  String mireLedPitchComputed(Object pitch) {
    return 'Computed pitch: $pitch';
  }

  @override
  String get mireLedErrTilesXY => '❌ Enter Tiles X/Y (>0).';

  @override
  String get mireLedErrTilePx => '❌ Enter Tile px (width/height >0).';

  @override
  String get mireLedErrTileCm => '❌ Enter Tile cm (width/height >0).';

  @override
  String get mireLedWarnPitchOutOfRange =>
      '⚠️ Computed pitch out of range (0.5–20 mm). Check Tile cm / px.';

  @override
  String get mireLedWarnPitchXNotY =>
      '⚠️ Pitch X ≠ Pitch Y (non-uniform tile). Check cm and px dimensions.';

  @override
  String get mireLedTypeTilesId => 'Tile IDs (number + colors)';

  @override
  String get mireLedTypePixelPerfect => 'Pixel perfect + circles';

  @override
  String get mireLedTypeGridLabels => 'Grid + markers + circles';

  @override
  String get mireLedTypeColorBars => 'Bars + ramps + circles';

  @override
  String get mireLedTypeUniformity => 'Uniformity + circles';

  @override
  String get mireVideoTypeCombo => 'Combo (grid + circles + 2 centered bars)';

  @override
  String get mireVideoTypeGridSafe => 'Grid + safe + circles';

  @override
  String get mireVideoTypeColorBars => 'Bars + ramps + circles';

  @override
  String get mireVideoTypeUniformity => 'Uniformity + circles';

  @override
  String get mireVideoTypeCheckerboard => 'Checkerboard + circles';
}
