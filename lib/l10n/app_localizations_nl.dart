// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'Mijn Tech App';

  @override
  String get homeTitle => 'Start';

  @override
  String get menuTitle => 'Menu';

  @override
  String get settings => 'Instellingen';

  @override
  String get language => 'Taal';

  @override
  String get languageSystem => 'Systeem (automatisch)';

  @override
  String get languageSystemCurrent => 'Telefoontaal';

  @override
  String get legalNotices => 'Juridische vermeldingen';

  @override
  String get resetConsents => 'Toestemmingen resetten';

  @override
  String get consentsReset => 'Toestemmingen gereset.';

  @override
  String get homeVideoTitle => 'Video';

  @override
  String get homeVideoSubtitle =>
      'Lens & meting, helderheid, multi-projector, LED en testbeelden.';

  @override
  String get homeLightTitle => 'Licht';

  @override
  String get homeLightSubtitle =>
      'Projectiegrootte, DMX dip-switch, fotometrie, catalogus, DMX-patch.';

  @override
  String get homeLaserTitle => 'Laser';

  @override
  String get homeLaserSubtitle =>
      'Laserberekeningen en veiligheid (toestemming vereist bij elke toegang).';

  @override
  String get homeReferencesTitle => 'Referenties';

  @override
  String get homeReferencesSubtitle =>
      'DMX / netwerk / video: fiches & praktijkreferenties.';

  @override
  String get disclaimerTitle => '⚠️ JURIDISCHE WAARSCHUWING & DISCLAIMER';

  @override
  String get disclaimerText =>
      'ENKEL VOOR INFORMATIEF GEBRUIK\n\nDe berekeningen die deze app biedt (video, licht, laser) zijn uitsluitend informatief en indicatief.\nZe vervangen in geen geval:\n- gecertificeerde berekeningen,\n- technische studies,\n- geldende officiële normen,\n- of validatie door een gekwalificeerde professional.\n\nAANSPRAKELIJKHEID\nDe uitgever van deze app kan niet aansprakelijk worden gesteld voor rekenfouten, weglatingen, materiële schade,\nlichamelijk letsel of incidenten die plaatsvinden tijdens installatie, werking of gebruik van apparatuur.\n\nVIDEO & PROJECTIE\nResultaten (afmetingen, ratio’s, helderheid, overlaps, enz.) zijn gebaseerd op theoretische modellen en kunnen variëren afhankelijk van:\noptiek, zoom, uniformiteit, omgevingslicht, oppervlak, instellingen, enz.\nControleer altijd met de officiële documentatie van de fabrikant.\n\nLICHT\nBerekeningen zijn indicatief en houden geen rekening met alle reële omstandigheden (toleranties, optische verliezen,\nveroudering van lichtbronnen, lokale normen, omgevingscondities…).\n\nLASER – VEILIGHEID\nNOHD-, SZED- en CZED-berekeningen zijn gebaseerd op standaardaanames en theoretische grenswaarden.\nZe houden met name geen rekening met:\n- optische instrumenten (verrekijkers, camera’s, telescopen…),\n- atmosferische omstandigheden (mist, regen, stof…),\n- onverwachte reflecties, verkeerd gebruik, specifieke instellingen.\nHet gebruik van een lasersysteem impliceert directe verantwoordelijkheid van de operator en vereist een passende risicoanalyse.\n\nRISICO-AANVAARDING\nDoor deze app te gebruiken bevestigt de gebruiker:\n- de toepasselijke veiligheidsregels te hebben gelezen,\n- als enige verantwoordelijk te zijn voor zijn/haar installaties,\n- de volledige verantwoordelijkheid te dragen voor risico’s verbonden aan het gebruik van apparatuur (video, licht, laser),\n- de gegevens systematisch te verifiëren met de officiële handleidingen van de fabrikant.';

  @override
  String get disclaimerCertify =>
      'Ik bevestig dat ik deze voorwaarden heb gelezen en aanvaard.';

  @override
  String get disclaimerAccept => 'Ik aanvaard';

  @override
  String get laserConsentTitle => '🔴 LASERTOESTEMMING (VERPLICHT)';

  @override
  String get laserConsentText =>
      'TOEGANG TOT DE LASER-SECTIE\n\nDe LASER-sectie van deze app betreft veiligheidsberekeningen (bv. NOHD, SZED, CZED).\nDeze berekeningen zijn indicatief en vervangen niet:\n- een risicoanalyse,\n- geldende normen,\n- bedrijfsprocedures,\n- of validatie door een gekwalificeerde persoon.\n\nBELANGRIJK\n- Risico op oog-/huidletsels bij onjuist gebruik.\n- De berekening kan fout zijn als ingevoerde parameters onvolledig/incorrect zijn of als reële omstandigheden afwijken (optiek,\n  atmosferische omstandigheden, reflecties, uitlijning, enz.).\n- De operator is als enige verantwoordelijk voor installatie, gebruik en conformiteit.\n\nDoor te bevestigen verklaar je dat je:\n- de risico’s begrijpt,\n- de toepasselijke veiligheidsregels naleeft,\n- de volledige verantwoordelijkheid draagt bij nalatigheid of verkeerd gebruik.';

  @override
  String get commonCancel => 'Annuleren';

  @override
  String get commonSave => 'Opslaan';

  @override
  String get commonRename => 'Hernoemen';

  @override
  String get commonSearch => 'Zoeken';

  @override
  String get commonNone => 'Geen records';

  @override
  String get commonCalculate => 'Berekenen';

  @override
  String get commonCopyResultTooltip => 'Resultaat kopiëren';

  @override
  String get commonUnitMeter => 'm';

  @override
  String get commonReset => 'Reset';

  @override
  String get commonOkWithCheck => 'OK ✅';

  @override
  String get commonTooLowWithCross => 'Te laag ❌';

  @override
  String get lightProjectionTitle => 'Projectiegrootte';

  @override
  String get lightProjectionDescription =>
      'Indicatieve berekening van de spotgrootte op basis van hoek, afstand en diameter.';

  @override
  String get lightDmxSwitchTitle => 'DMX dip-switch';

  @override
  String get lightDmxSwitchDescription =>
      'Indicatieve omzetting tussen DMX-adres en schakelaars, met intervalnavigatie.';

  @override
  String get lightPhotometryTitle => 'Fotometrie';

  @override
  String get lightPhotometryDescription =>
      'Indicatieve omzettingen tussen lux, candela en lumen, met afstand en hoek.';

  @override
  String get lightCatalogTitle => 'Catalogus';

  @override
  String get lightCatalogDescription =>
      'Selectie op fabrikant, type en product, met informatie en handleiding.';

  @override
  String get lightPatchTitle => 'DMX-patch';

  @override
  String get lightPatchDescription =>
      'Een MVR-bestand importeren of een patch handmatig aanmaken vanuit de bibliotheek.';

  @override
  String get lightDisclaimerShort =>
      'Indicatieve tools. Controleer altijd de documentatie van de fabrikant.';

  @override
  String get laserInputsTitle => 'Invoer';

  @override
  String get laserPowerLabel => 'Vermogen (mW)';

  @override
  String get laserPowerHint => 'bv.: 5000';

  @override
  String get laserDivergenceLabel => 'Divergentie (mrad)';

  @override
  String get laserDivergenceHint => 'bv.: 1.2';

  @override
  String get laserDiameterLabel => 'Uitgangsdiameter (mm)';

  @override
  String get laserDiameterHint => 'bv.: 3.0';

  @override
  String get laserSaveCurrentProjector => 'Deze projector opslaan';

  @override
  String get laserSafetyResultsTitle => 'Veiligheidsresultaten';

  @override
  String get laserZoneNohdDesc => 'Ooggevaar';

  @override
  String get laserZoneSzedDesc => 'Gevoelige zone';

  @override
  String get laserZoneCzedDesc => 'Kritieke zone';

  @override
  String get laserTargetDistanceLabel => 'Doelafstand (m)';

  @override
  String get laserTargetDistanceHint => 'bv.: 10';

  @override
  String get laserAdviceFullPower => 'Vol vermogen toegestaan (100 %)';

  @override
  String laserAdviceMaxRecommended(Object percent) {
    return 'Maximaal aanbevolen vermogen: $percent';
  }

  @override
  String get laserSavedProjectorsTitle => 'Opgeslagen projectoren';

  @override
  String get laserSearchHint => 'bv.: “RGB 5W”';

  @override
  String laserPresetSubtitle(Object p, Object div, Object diam) {
    return 'P: $p mW • Div: $div mrad • Ø: $diam mm';
  }

  @override
  String get laserSaveProjectorTitle => 'Projector opslaan';

  @override
  String get laserRenameProjectorTitle => 'Projector hernoemen';

  @override
  String get laserProjectorNameLabel => 'Projectornaam';

  @override
  String get laserInvalidInputs =>
      'Voer geldige waarden in voor vermogen, divergentie en diameter.';

  @override
  String get laserPresetAdded => 'Record toegevoegd.';

  @override
  String get laserPresetDeleted => 'Record verwijderd.';

  @override
  String get laserNameUpdated => 'Naam bijgewerkt.';

  @override
  String get laserNormativeParamsTitle => 'Gebruikte veiligheidsparameters';

  @override
  String get laserNormativeParamsBody =>
      'MPE voor Nominal Ocular Hazard Distance (NOHD): 25,4 W/m²\n(Norm IEC 60825-1, editie 3.0)\n\nMPE voor Sensitive Zone Exposure Distance (SZED): 1 W/m²\n(Norm ANSI Z136.6)\n\nMPE voor Critical Zone Exposure Distance (CZED): 0,05 W/m²\n(Norm ANSI Z136.6)';

  @override
  String get laserDisclaimerShort =>
      'Indicatieve berekening. Vervangt geen laser-veiligheidsanalyse.';

  @override
  String get aboutDmxTitle => 'DMX — werking (simpel & volledig)';

  @override
  String get aboutDmxSubtitle =>
      'Universums, adressen, frames, RS-485-bekabeling, terminatie, typische veldproblemen.\nMet schema’s + checklist.';

  @override
  String get aboutArtNetTitle =>
      'Art-Net — DMX over IP (nodes, unicast/broadcast)';

  @override
  String get aboutArtNetSubtitle =>
      'DMX-universums via Ethernet/UDP, nodes, broadcast vs unicast.\nPraktijklimieten, netwerkstabiliteit, RDM afhankelijk van hardware.';

  @override
  String get aboutSacnTitle => 'sACN / E1.31 — multicast, IGMP, prioriteiten';

  @override
  String get aboutSacnSubtitle =>
      'Een netwerkgerichte “pro” DMX-over-IP-standaard.\nMulticast/unicast, IGMP snooping/querier, prioriteiten bij meerdere bronnen.';

  @override
  String get aboutIpBasicsTitle =>
      'Netwerk — IP-basis / subnet / DHCP (essentieel)';

  @override
  String get aboutIpBasicsSubtitle =>
      'IP, subnetmasker, gateway, DHCP vs statisch begrijpen.\nConcrete voorbeelden (2.x, 10.x, 192.168.x) + checklist.';

  @override
  String get aboutLightNetworkTitle =>
      'Lichtnetwerk — VLAN, IGMP, wifi vs kabel';

  @override
  String get aboutLightNetworkSubtitle =>
      'Eenvoudige en robuuste architectuur voor Art-Net/sACN.\nVLAN, IGMP snooping/querier, wifi (jitter), switches, schema’s + checklist.';

  @override
  String get aboutCablingFiberTitle =>
      'Netwerk — RJ45 / glasvezel / bandbreedte & afstanden';

  @override
  String get aboutCablingFiberSubtitle =>
      'Cat5e→Cat8, fiber OM3/OM4/OS2, LC/SC/MPO, typische afstanden, show best practices.';

  @override
  String get aboutVideoTitle => 'Video — SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutVideoSubtitle =>
      'Kies op basis van latency, betrouwbaarheid, bekabeling, LAN vs WAN.\nTabellen + schema.';

  @override
  String get aboutElectricityTitle =>
      'Elektriciteit — Schuko / CEE (P17) / vermogen';

  @override
  String get aboutElectricitySubtitle =>
      'Connectoren, 1-fase/3-fase, snelle kW-tabellen (16A→400A), typische valkuilen.';

  @override
  String get aboutComputingTitle => 'IT — USB / HDMI / DP / SATA / NVMe…';

  @override
  String get aboutComputingSubtitle =>
      'Nuttige bandbreedtes, versies, reële limieten, marketingvalkuilen.';

  @override
  String get videoTitle => 'Video';

  @override
  String get videoToolsTitle => 'Video-tools';

  @override
  String get videoDisclaimerShort =>
      'Indicatieve berekeningen. Controleer altijd de documentatie van de fabrikant.';

  @override
  String get videoLensMeasureTitle => 'Lens & meting';

  @override
  String get videoLensMeasureSubtitle =>
      'Ratio / breedte / hoogte (berekeningen 1 tot 3).';

  @override
  String get videoBrightnessTitle => 'Helderheid';

  @override
  String get videoBrightnessSubtitle =>
      'Lux / nits / ft-L + drempel (berekening 4).';

  @override
  String get videoMultiprojectorTitle => 'Multi-projector';

  @override
  String get videoMultiprojectorSubtitle =>
      'Overlap + breedte/projector + aantal projectoren (berekeningen 5 & 6).';

  @override
  String get videoLedTitle => 'LED';

  @override
  String get videoLedSubtitle =>
      'Pixels van de LED-wall op basis van afmetingen, pitch en tile-afmetingen.';

  @override
  String get videoTestPatternTitle => 'Testbeeld';

  @override
  String get videoTestPatternSubtitle =>
      'Video-testbeelden maken voor screens en LED-walls (later).';

  @override
  String get videoMpFormatLabel => 'Formaat (ratio)';

  @override
  String get videoMpCalc5Title => 'Berekening 5 — Breedte per projector';

  @override
  String get videoMpCalc6Title =>
      'Berekening 6 — Aantal projectoren (ratio min/max)';

  @override
  String get videoMpTotalWidthLabel => 'Totale projectiebreedte (m)';

  @override
  String get videoMpTotalWidthHint => 'bv.: 18.0';

  @override
  String get videoMpDistanceLabel => 'Projectieafstand (m)';

  @override
  String get videoMpDistanceHint => 'bv.: 12.0';

  @override
  String get videoMpOverlapLabel => 'Overlap (%)';

  @override
  String get videoMpOverlapHint => 'bv.: 10';

  @override
  String get videoMpProjectorCountLabel => 'Aantal projectoren (N)';

  @override
  String get videoMpProjectorCountHint => 'bv.: 2';

  @override
  String get videoMpRatioMinLabel => 'Ratio min';

  @override
  String get videoMpRatioMinHint => 'bv.: 1.20';

  @override
  String get videoMpRatioMaxLabel => 'Ratio max';

  @override
  String get videoMpRatioMaxHint => 'bv.: 1.80';

  @override
  String get videoMpOptionalLuminanceTitle => 'Optioneel: helderheid';

  @override
  String get videoMpLumensPerProjectorLabel => 'Lumen per projector';

  @override
  String get videoMpLumensPerProjectorHint => 'bv.: 20000';

  @override
  String get videoMpGainLabel => 'Gain';

  @override
  String get videoMpGainHint => 'bv.: 1.0';

  @override
  String get videoMpErrMissing5 =>
      '❌ Ontbrekende gegevens: Totale breedte + Overlap% + N.';

  @override
  String get videoMpErrWidthGt0 => '❌ Totale breedte moet > 0 zijn.';

  @override
  String get videoMpErrNGte2 => '❌ N moet ≥ 2 zijn.';

  @override
  String get videoMpErrOverlapRange =>
      '❌ Overlap% moet tussen 0 en 99.9 liggen.';

  @override
  String get videoMpErrImpossibleDenom =>
      '❌ Onmogelijke parameters (denom ≤ 0).';

  @override
  String get videoMpErrMissing6Main =>
      '❌ Ontbrekende gegevens: Totale breedte + Afstand + Overlap%.';

  @override
  String get videoMpErrWidthDistanceGt0 =>
      '❌ Totale breedte en afstand moeten > 0 zijn.';

  @override
  String get videoMpErrMissingRatios =>
      '❌ Ontbrekende gegevens: Ratio min en/of Ratio max.';

  @override
  String get videoMpErrInvalidRatio => '❌ Ongeldige ratio (moet > 0 zijn).';

  @override
  String get videoMpLumiOptionalHint =>
      'Helderheid (optioneel): vul Lumen/projector + Gain in om te schatten.';

  @override
  String get videoMpLumiErrLumensGainGt0 =>
      'Helderheid: ❌ Lumen/projector en gain moeten > 0 zijn.';

  @override
  String videoMpCaseOpenMin(Object n, Object coverage) {
    return 'Geval breedste ratio (min) = $n projectoren | dekking ≈ $coverage m';
  }

  @override
  String videoMpCaseTightMax(Object n, Object coverage) {
    return 'Geval smalste ratio (max) = $n projectoren | dekking ≈ $coverage m';
  }

  @override
  String videoMpLumiEstimated(
      Object n, Object area, Object lux, Object nits, Object fl) {
    return 'Geschatte helderheid (N=$n)\nOppervlakte: $area m²\nEq-lux: $lux\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoMpNoteIndicative => 'Opmerking: indicatieve schatting.';

  @override
  String get videoLmFormatLabel => 'Formaat (ratio)';

  @override
  String get videoLmCalc1Title => 'Berekening 1 — Ratio (Afstand / Breedte)';

  @override
  String get videoLmCalc2Title => 'Berekening 2 — Breedte (Afstand / Ratio)';

  @override
  String get videoLmCalc3Title => 'Berekening 3 — Hoogte (Breedte + Formaat)';

  @override
  String get videoLmDistanceLabel => 'Projectieafstand (m)';

  @override
  String get videoLmDistanceHint => 'bv.: 12.0';

  @override
  String get videoLmImageWidthLabel => 'Beeldbreedte (m)';

  @override
  String get videoLmImageWidthHint => 'bv.: 6.0';

  @override
  String get videoLmThrowRatioLabel => 'Projectie-ratio';

  @override
  String get videoLmThrowRatioHint => 'bv.: 1.60';

  @override
  String get videoLmErrMissingDistanceWidth =>
      '❌ Ontbrekende gegevens: Afstand + Breedte.';

  @override
  String get videoLmErrMissingDistanceRatio =>
      '❌ Ontbrekende gegevens: Afstand + Ratio.';

  @override
  String get videoLmErrMissingWidthOnly => '❌ Ontbrekende waarde: Breedte.';

  @override
  String get videoLmErrWidthGt0 => '❌ Breedte moet > 0 zijn.';

  @override
  String get videoLmErrRatioGt0 => '❌ Ratio moet > 0 zijn.';

  @override
  String videoLmResultRatio(Object ratio) {
    return '✅ Projectie-ratio = $ratio';
  }

  @override
  String videoLmResultWidth(Object width) {
    return '✅ Beeldbreedte = $width m';
  }

  @override
  String videoLmResultHeight(Object height, Object format) {
    return '✅ Hoogte = $height m (formaat $format)';
  }

  @override
  String get videoLedCalcTitle => 'Berekening — Pixels / tiles';

  @override
  String get videoLedTilesXLabel => 'Tiles horizontaal (X)';

  @override
  String get videoLedTilesXHint => 'bv.: 15';

  @override
  String get videoLedTilesYLabel => 'Tiles verticaal (Y)';

  @override
  String get videoLedTilesYHint => 'bv.: 8';

  @override
  String get videoLedTileWpxLabel => 'Tile-breedte (px)';

  @override
  String get videoLedTileWpxHint => 'bv.: 128';

  @override
  String get videoLedTileHpxLabel => 'Tile-hoogte (px)';

  @override
  String get videoLedTileHpxHint => 'bv.: 128';

  @override
  String get videoLedTileWcmLabel => 'Tile-breedte (cm)';

  @override
  String get videoLedTileWcmHint => 'bv.: 33.28';

  @override
  String get videoLedTileHcmLabel => 'Tile-hoogte (cm)';

  @override
  String get videoLedTileHcmHint => 'bv.: 33.28';

  @override
  String get videoLedErrMissingInputs =>
      '❌ Ontbrekende gegevens: Tiles X/Y + Tile px + Tile cm.';

  @override
  String get videoLedErrAllGt0 => '❌ Alle waarden moeten > 0 zijn.';

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
    return '✅ Wall-resolutie: $wallWpx × $wallHpx px\n✅ Wall-grootte: $wallWm × $wallHm m\nTile: $tileWpx×$tileHpx px • $tileWcm×$tileHcm cm\nBerekende pitch: $pitch';
  }

  @override
  String get videoCalculationsTitle => 'Videoberekeningen';

  @override
  String get videoCopyAllTooltip => 'Alle resultaten kopiëren';

  @override
  String get videoExportPdfTooltip => 'PDF exporteren';

  @override
  String get videoCalculateAll => 'Alles berekenen';

  @override
  String get videoSummaryPillsTitle => 'Samenvatting (badges)';

  @override
  String get videoCopySummaryTooltip => 'Samenvatting kopiëren';

  @override
  String get videoCommonParamsTitle => 'Gemeenschappelijke parameters';

  @override
  String get videoFormatLabel => 'Formaat (ratio)';

  @override
  String get videoDistanceLabel => 'Projectieafstand (m)';

  @override
  String get videoDistanceHint => 'bv.: 12.0';

  @override
  String get videoImageWidthLabel => 'Beeldbreedte (m)';

  @override
  String get videoImageWidthHint => 'bv.: 6.0';

  @override
  String get videoThrowRatioLabel => 'Projectie-ratio';

  @override
  String get videoThrowRatioHint => 'bv.: 1.60';

  @override
  String get videoLumensLabel => 'Lumen (ANSI)';

  @override
  String get videoLumensHint => 'bv.: 20000';

  @override
  String get videoGainLabel => 'Gain';

  @override
  String get videoGainHint => 'bv.: 1.0';

  @override
  String get videoScreenPresetLabel => 'Scherm / Oppervlak (preset)';

  @override
  String get videoPresetFrontWhite => 'Front – mat wit scherm (gain 1.0)';

  @override
  String get videoPresetFrontGrey => 'Front – grijs scherm (gain 0.8)';

  @override
  String get videoPresetFrontHighGain => 'Front – high-gain scherm (gain 1.3)';

  @override
  String get videoPresetRearDiffusion =>
      'Achterprojectie – diffusiedoek (gain 0.7)';

  @override
  String get videoPresetRearClear => 'Achterprojectie – helder doek (gain 0.9)';

  @override
  String get videoPresetMappingMatte => 'Mapping – matte verf (gain 0.75)';

  @override
  String get videoPresetMappingSatin => 'Mapping – satijnverf (gain 0.9)';

  @override
  String get videoPresetMappingLightStone =>
      'Mapping – lichte steen (gain 0.6)';

  @override
  String get videoPresetMappingDarkStone =>
      'Mapping – donkere steen (gain 0.35)';

  @override
  String get videoPresetMappingGlass => 'Mapping – glas (gain 0.15)';

  @override
  String get videoPresetFrontWhiteShort => 'Front – mat wit scherm';

  @override
  String get videoPresetFrontGreyShort => 'Front – grijs scherm';

  @override
  String get videoPresetFrontHighGainShort => 'Front – high-gain scherm';

  @override
  String get videoPresetRearDiffusionShort => 'Achterprojectie – diffusiedoek';

  @override
  String get videoPresetRearClearShort => 'Achterprojectie – helder doek';

  @override
  String get videoPresetMappingMatteShort => 'Mapping – matte verf';

  @override
  String get videoPresetMappingSatinShort => 'Mapping – satijnverf';

  @override
  String get videoPresetMappingLightStoneShort => 'Mapping – lichte steen';

  @override
  String get videoPresetMappingDarkStoneShort => 'Mapping – donkere steen';

  @override
  String get videoPresetMappingGlassShort => 'Mapping – glas';

  @override
  String get videoOverlapLabel => 'Overlap (%)';

  @override
  String get videoOverlapHint => 'bv.: 10';

  @override
  String get videoTotalWidthLabel => 'Totale projectiebreedte (m)';

  @override
  String get videoTotalWidthHint => 'bv.: 18.0';

  @override
  String get videoCalc1Title => 'Berekening 1 — Ratio (Afstand / Breedte)';

  @override
  String get videoCalc2Title => 'Berekening 2 — Breedte (Afstand / Ratio)';

  @override
  String get videoCalc3Title => 'Berekening 3 — Hoogte (Breedte + Formaat)';

  @override
  String get videoCalc4Title =>
      'Berekening 4 — Helderheid (lux / nits / ft-L + drempel)';

  @override
  String get videoCalc5Title => 'Berekening 5 — Overlap (Totale breedte + N)';

  @override
  String get videoCalc6Title =>
      'Berekening 6 — Auto-aantal projectoren + helderheid';

  @override
  String get videoCalc5NLabel => 'Aantal projectoren (N)';

  @override
  String get videoCalc5NHint => 'bv.: 2';

  @override
  String get videoCalc6RatioMinLabel => 'Ratio min';

  @override
  String get videoCalc6RatioMinHint => 'bv.: 1.20';

  @override
  String get videoCalc6RatioMaxLabel => 'Ratio max';

  @override
  String get videoCalc6RatioMaxHint => 'bv.: 1.80';

  @override
  String get videoOptionalBrightnessTitle => 'Optioneel: helderheid';

  @override
  String get videoCalc6LumensPerProjectorLabel => 'Lumen per projector';

  @override
  String get videoCalc6LumensPerProjectorHint => 'bv.: 20000';

  @override
  String get videoCalc6GainLabel => 'Gain (calc 6)';

  @override
  String get videoCalc6GainHint => 'bv.: 1.0';

  @override
  String get videoCalc1ErrMissing =>
      '❌ Ontbrekende gegevens: Afstand + Breedte.';

  @override
  String get videoCalc2ErrMissing => '❌ Ontbrekende gegevens: Afstand + Ratio.';

  @override
  String get videoCalc3ErrMissingWidth => '❌ Ontbrekende waarde: Breedte.';

  @override
  String get videoErrWidthGt0 => '❌ Breedte moet > 0 zijn.';

  @override
  String get videoErrRatioGt0 => '❌ Ratio moet > 0 zijn.';

  @override
  String videoCalc1Ok(Object ratio) {
    return '✅ Projectie-ratio = $ratio';
  }

  @override
  String videoCalc2Ok(Object width) {
    return '✅ Beeldbreedte = $width m';
  }

  @override
  String videoCalc3Ok(Object height, Object format) {
    return '✅ Hoogte = $height m (formaat $format)';
  }

  @override
  String get videoCalc4ErrMissing =>
      '❌ Ontbrekende gegevens: Lumen + Gain + Breedte.';

  @override
  String get videoCalc4ErrGt0 => '❌ Lumen/Gain/Breedte moeten > 0 zijn.';

  @override
  String videoCalc4Result(Object area, Object format, Object lux, Object luxEq,
      Object nits, Object fl, Object presetLabel, Object minFl, Object status) {
    return 'Oppervlakte: $area m² (formaat $format)\nLux (lm/m²): $lux\nEq-lux (gain): $luxEq\nLuminantie: $nits nits | $fl ft-L\nMinimumdrempel ($presetLabel): $minFl ft-L → $status\nOpmerking: nits/ft-L-omrekening gebaseerd op een Lambert-aanname (approx).';
  }

  @override
  String get videoCalc5ErrMissing =>
      '❌ Ontbrekende gegevens: Totale breedte + Overlap% + Aantal projectoren.';

  @override
  String get videoErrTotalWidthGt0 => '❌ Totale breedte moet > 0 zijn.';

  @override
  String get videoCalc5ErrNMin2 => '❌ Aantal projectoren moet ≥ 2 zijn.';

  @override
  String get videoErrOverlapRange => '❌ Overlap% moet tussen 0 en 99.9 liggen.';

  @override
  String get videoErrImpossibleDenom => '❌ Onmogelijke parameters (denom ≤ 0).';

  @override
  String videoCalc5Result(Object wTot, Object n, Object overlapPct, Object wPer,
      Object overlapM, Object format, Object hTot) {
    return 'Totale breedte: $wTot m\nN: $n | Overlap: $overlapPct% (op projectorb breedte)\n\n- Breedte per projector: $wPer m\n- Overlap tussen 2 projectoren: $overlapM m\n- Totale hoogte (formaat $format): $hTot m';
  }

  @override
  String get videoCalc6ErrMissingBasics =>
      '❌ Ontbrekende gegevens: Totale breedte + Afstand + Overlap%.';

  @override
  String get videoErrTotalWidthAndDistanceGt0 =>
      '❌ Totale breedte en afstand moeten > 0 zijn.';

  @override
  String get videoCalc6ErrMissingRatio =>
      '❌ Ontbrekende gegevens: Ratio min en/of Ratio max.';

  @override
  String get videoCalc6LumiOptional =>
      'Helderheid (optioneel): vul Lumen/projector + Gain in voor de schatting.';

  @override
  String get videoCalc6LumiErrGt0 =>
      'Helderheid: ❌ Lumen/projector en gain moeten > 0 zijn.';

  @override
  String videoCalc6LumiForN(
      Object n, Object area, Object lux, Object nits, Object fl) {
    return 'Geschatte helderheid (N=$n)\nOppervlakte: $area m²\nEq-lux: $lux (lm/m²)\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoCalc6NoteIndicative =>
      'Opmerking: indicatieve schatting (echte blend/overlap kan licht dalen).';

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
    return 'Totale breedte=$wTot m | Afstand=$distance m | Overlap=$overlapPct%\nFormaat $format → Totale hoogte=$hTot m | Oppervlakte=$area m²\nRatio min/max: $ratioMin → $ratioMax\n\nGeval breedste ratio (min) = $nMin projectoren | dekking ≈ $covMin m\n$lumiMin\n\nGeval smalste ratio (max) = $nMax projectoren | dekking ≈ $covMax m\n$lumiMax\n\n$note';
  }

  @override
  String videoCommonPillFormat(Object format) {
    return 'Formaat: $format';
  }

  @override
  String videoCommonPillDistance(Object value) {
    return 'Afstand: $value';
  }

  @override
  String videoCommonPillWidth(Object value) {
    return 'Breedte: $value';
  }

  @override
  String videoCommonPillRatio(Object value) {
    return 'Ratio: $value';
  }

  @override
  String videoCommonPillHeight(Object value) {
    return 'Hoogte: $value';
  }

  @override
  String videoCommonPillArea(Object value) {
    return 'Oppervlakte: $value';
  }

  @override
  String videoCommonPillTotalWidth(Object value) {
    return 'Totale breedte: $value';
  }

  @override
  String videoCommonPillOverlap(Object value) {
    return 'Overlap: $value';
  }

  @override
  String get videoPdfTitle => 'Mon App Technique – Video-export';

  @override
  String get videoPdfDate => 'Datum';

  @override
  String get videoPdfFormat => 'Formaat';

  @override
  String get videoPdfDistance => 'Afstand (m)';

  @override
  String get videoPdfImageWidth => 'Beeldbreedte (m)';

  @override
  String get videoPdfRatio => 'Ratio';

  @override
  String get videoPdfLumens => 'Lumen';

  @override
  String get videoPdfGain => 'Gain';

  @override
  String get videoPdfScreenPreset => 'Scherm-preset';

  @override
  String get videoPdfOverlap => 'Overlap (%)';

  @override
  String get videoPdfTotalWidth => 'Totale breedte (m)';

  @override
  String get videoPdfCalc5N => 'N (calc5)';

  @override
  String get videoPdfCalc6RatioMin => 'Ratio min (calc6)';

  @override
  String get videoPdfCalc6RatioMax => 'Ratio max (calc6)';

  @override
  String get videoPdfCalc6LumensPerProj => 'Lumen/projector (calc6)';

  @override
  String get videoPdfCalc6Gain => 'Gain (calc6)';

  @override
  String get videoPdfParams => 'Parameters';

  @override
  String get videoPdfResults => 'Resultaten';

  @override
  String get videoPdfCalc1 => 'Berekening 1';

  @override
  String get videoPdfCalc2 => 'Berekening 2';

  @override
  String get videoPdfCalc3 => 'Berekening 3';

  @override
  String get videoPdfCalc4 => 'Berekening 4';

  @override
  String get videoPdfCalc5 => 'Berekening 5';

  @override
  String get videoPdfCalc6 => 'Berekening 6';

  @override
  String videoCalcLabel(Object n) {
    return 'Berekening $n';
  }

  @override
  String get videoBrightnessSectionTitle =>
      'Berekening 4 — Lux / nits / ft-L + drempel';

  @override
  String get videoCalc4ErrMissingSimple =>
      '❌ Ontbrekende gegevens: Breedte + Lumen + Gain.';

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
    return 'Formaat: $format\nOppervlakte: $area m²\nLux (lm/m²): $lux\nEq-lux (gain): $luxEq\nLuminantie: $nits nits | $fl ft-L\nMinimumdrempel ($presetLabel): $minFl ft-L → $status\nOpmerking: indicatieve schatting (Lambert).';
  }

  @override
  String get videoMireTitle => 'Testbeeld';

  @override
  String get videoMireHeaderTitle => 'Testbeeld-generator';

  @override
  String get videoMireHeaderSubtitle =>
      'Indicatieve testbeelden (uitlijnen, focus, geometrie, blend, pixel-perfect).';

  @override
  String get videoMireScreenVideoTitle => 'Testbeeld video-screen';

  @override
  String get videoMireScreenVideoSubtitle =>
      'Eenvoudig (BxH px) + multi-projector mapping (N + overlap).';

  @override
  String get videoMireScreenLedTitle => 'Testbeeld LED-screen';

  @override
  String get videoMireScreenLedSubtitle =>
      'Testbeeld op basis van BxH px (pixel-perfect, uniformiteit, raster).';

  @override
  String get mireVideoSimpleTitle => 'VIDEO / EENVOUDIG TESTBEELD';

  @override
  String get mireVideoComboTitle => 'VIDEO / COMBI-TESTBEELD';

  @override
  String get mireVideoMappingTitle => 'VIDEO / MAPPING-TESTBEELD';

  @override
  String get mireLedTitle => 'LED / TESTBEELD';

  @override
  String get mireLedTilesIdTitle => 'LED / TILE-ID\'s';

  @override
  String get mireSimpleSubtitleGridSafe => 'Raster + safe + cirkels';

  @override
  String get mireSimpleSubtitleCheckerboard => 'Schaakbord + cirkels';

  @override
  String get mireSimpleSubtitleColorBars => 'Balken + ramps + cirkels';

  @override
  String get mireSimpleSubtitleUniformity => 'Uniformiteit + cirkels';

  @override
  String get mireSimpleSubtitleComboAll =>
      'Raster + safe + 2 gecentreerde balken + cirkels';

  @override
  String get mireLedSubtitlePixelPerfect => 'Pixel-perfect + cirkels';

  @override
  String get mireLedSubtitleGridLabels => 'Raster + markeringen + cirkels';

  @override
  String get mireLedSubtitleColorBars => 'Balken + ramps + cirkels';

  @override
  String get mireLedSubtitleUniformity => 'Uniformiteit + cirkels';

  @override
  String mireMappingSubtitlePattern(Object n, Object orient, Object percent) {
    return 'N=$n • Overlap $percent% • $orient';
  }

  @override
  String get mireOrientationHorizontal => 'Horizontaal';

  @override
  String get mireOrientationVertical => 'Verticaal';

  @override
  String mireProjectorLabelPattern(Object index) {
    return 'PROJECTOR $index';
  }

  @override
  String get mireBlendLabel => 'BLEND';

  @override
  String get mireTileMissingPx => 'Geef Tile (px) op voor nummering.';

  @override
  String get mireWallNotMultipleOfTiles => 'WALL NIET DEELBAAR DOOR TILES';

  @override
  String mireTilesSubtitleBase(Object nx, Object ny, Object th, Object tw) {
    return 'Tile ${tw}x$th px • Raster $nx x $ny';
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
  String get mireSimpleSectionTitle => 'Eenvoudig screen-testbeeld';

  @override
  String get mireMappingSectionTitle => 'Multi-projector mapping-testbeeld';

  @override
  String get mireVideoSimpleSectionTitle => 'Eenvoudig screen-testbeeld';

  @override
  String get mireVideoMappingSectionTitle =>
      'Multi-projector mapping-testbeeld';

  @override
  String get mireWidthPxLabel => 'Breedte (px)';

  @override
  String get mireHeightPxLabel => 'Hoogte (px)';

  @override
  String get mireWidthPxHint => 'bv.: 1920';

  @override
  String get mireHeightPxHint => 'bv.: 1080';

  @override
  String get mireWidthPxHintMapping => 'bv.: 3840';

  @override
  String get mireHeightPxHintMapping => 'bv.: 2160';

  @override
  String get mireTypeLabel => 'Testbeeld-type';

  @override
  String get mireExportPng => 'PNG exporteren';

  @override
  String get mireErrInvalidWHpx => '❌ Ongeldige breedte/hoogte (px).';

  @override
  String get mireErrInvalidProjectors =>
      '❌ Ongeldig aantal projectoren (N > 0).';

  @override
  String get mireErrInvalidOverlap => '❌ Ongeldige overlap (0 tot 99.9).';

  @override
  String get mireSimpleTypeComboAll =>
      'Combi (raster + cirkels + 2 gecentreerde balken)';

  @override
  String get mireSimpleTypeGridSafe => 'Raster + safe + cirkels';

  @override
  String get mireSimpleTypeColorBars => 'Balken + ramps + cirkels';

  @override
  String get mireSimpleTypeUniformity => 'Uniformiteit + cirkels';

  @override
  String get mireSimpleTypeCheckerboard => 'Schaakbord + cirkels';

  @override
  String get mireProjectorsNLabel => 'Aantal projectoren (N)';

  @override
  String get mireProjectorsNHint => 'bv.: 2';

  @override
  String get mireOverlapLabel => 'Overlap (%)';

  @override
  String get mireOverlapHint => 'bv.: 10.0';

  @override
  String get mireOrientationLabel => 'Oriëntatie';

  @override
  String get mireMappingTypeLabel => 'Mapping-type';

  @override
  String get mireMappingTypeCombo => 'Combi (zones + overlap + blend)';

  @override
  String get mireMappingTypeZonesOverlap => 'Zones + overlap';

  @override
  String get mireMappingTypeBlendRamps => 'Blend-ramps';

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
  String get mireLedParamsTitle => 'LED-wall-parameters';

  @override
  String get mireLedTilesXLabel => 'Tiles horizontaal (X)';

  @override
  String get mireLedTilesYLabel => 'Tiles verticaal (Y)';

  @override
  String get mireLedTileWpxLabel => 'Tile-breedte (px)';

  @override
  String get mireLedTileHpxLabel => 'Tile-hoogte (px)';

  @override
  String get mireLedTileWcmLabel => 'Tile-breedte (cm)';

  @override
  String get mireLedTileHcmLabel => 'Tile-hoogte (cm)';

  @override
  String mireLedWallResolution(Object w, Object h) {
    return 'Wall-resolutie: $w × $h px';
  }

  @override
  String mireLedPitchComputed(Object pitch) {
    return 'Berekende pitch: $pitch';
  }

  @override
  String get mireLedErrTilesXY => '❌ Geef Tiles X/Y op (>0).';

  @override
  String get mireLedErrTilePx => '❌ Geef Tile px op (breedte/hoogte >0).';

  @override
  String get mireLedErrTileCm => '❌ Geef Tile cm op (breedte/hoogte >0).';

  @override
  String get mireLedWarnPitchOutOfRange =>
      '⚠️ Berekende pitch buiten bereik (0.5–20 mm). Controleer Tile cm / px.';

  @override
  String get mireLedWarnPitchXNotY =>
      '⚠️ Pitch X ≠ Pitch Y (niet-uniforme tile). Controleer cm- en px-afmetingen.';

  @override
  String get mireLedTypeTilesId => 'Tile-ID\'s (nummer + kleuren)';

  @override
  String get mireLedTypePixelPerfect => 'Pixel-perfect + cirkels';

  @override
  String get mireLedTypeGridLabels => 'Raster + markeringen + cirkels';

  @override
  String get mireLedTypeColorBars => 'Balken + ramps + cirkels';

  @override
  String get mireLedTypeUniformity => 'Uniformiteit + cirkels';

  @override
  String get mireVideoTypeCombo =>
      'Combi (raster + cirkels + 2 gecentreerde balken)';

  @override
  String get mireVideoTypeGridSafe => 'Raster + safe + cirkels';

  @override
  String get mireVideoTypeColorBars => 'Balken + ramps + cirkels';

  @override
  String get mireVideoTypeUniformity => 'Uniformiteit + cirkels';

  @override
  String get mireVideoTypeCheckerboard => 'Schaakbord + cirkels';
}
