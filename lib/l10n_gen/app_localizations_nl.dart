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
  String get elecTocCopyText => 'Copier le texte';

  @override
  String get elecKvaTitle => 'Conversion kVA';

  @override
  String get elecKvaFormula => 'Formule';

  @override
  String get elecKvaIntro => 'Calcul de puissance apparente';

  @override
  String get elecKvaNote => 'Valeur indicative';

  @override
  String get elecKvaColKva => 'kVA';

  @override
  String get elecKvaColPf08 => 'cosφ 0.8';

  @override
  String get elecKvaColPf10 => 'cosφ 1.0';

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
  String laserAdviceMaxRecommended(Object p0) {
    return 'Laser Advice Max Recommended : $p0';
  }

  @override
  String get laserSavedProjectorsTitle => 'Opgeslagen projectoren';

  @override
  String get laserSearchHint => 'bv.: “RGB 5W”';

  @override
  String laserPresetSubtitle(Object p0, Object p1, Object p2) {
    return 'Laser Preset Subtitle : $p0 · $p1 · $p2';
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
  String videoMpCaseOpenMin(Object p0, Object p1) {
    return 'Video Mp Case Open Min : $p0 · $p1';
  }

  @override
  String videoMpCaseTightMax(Object p0, Object p1) {
    return 'Video Mp Case Tight Max : $p0 · $p1';
  }

  @override
  String videoMpLumiEstimated(
      Object p0, Object p1, Object p2, Object p3, Object p4) {
    return 'Video Mp Lumi Estimated : $p0 · $p1 · $p2 · $p3 · $p4';
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
  String videoLmResultRatio(Object p0) {
    return 'Video Lm Result Ratio : $p0';
  }

  @override
  String videoLmResultWidth(Object p0) {
    return 'Video Lm Result Width : $p0';
  }

  @override
  String videoLmResultHeight(Object p0, Object p1) {
    return 'Video Lm Result Height : $p0 · $p1';
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
  String videoLedPitchUniform(Object p0) {
    return 'Video LED Pitch Uniform : $p0';
  }

  @override
  String videoLedPitchXY(Object p0, Object p1) {
    return 'Video LED Pitch XY : $p0 · $p1';
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
  String videoCalc1Ok(Object p0) {
    return 'Video Calc1 Ok : $p0';
  }

  @override
  String videoCalc2Ok(Object p0) {
    return 'Video Calc2 Ok : $p0';
  }

  @override
  String videoCalc3Ok(Object p0, Object p1) {
    return 'Video Calc3 Ok : $p0 · $p1';
  }

  @override
  String get videoCalc4ErrMissing =>
      '❌ Ontbrekende gegevens: Lumen + Gain + Breedte.';

  @override
  String get videoCalc4ErrGt0 => '❌ Lumen/Gain/Breedte moeten > 0 zijn.';

  @override
  String videoCalc4Result(Object p0, Object p1, Object p2, Object p3, Object p4,
      Object p5, Object p6, Object p7, Object p8) {
    return 'Video Calc4 Result : $p0 · $p1 · $p2 · $p3 · $p4 · $p5 · $p6 · $p7 · $p8';
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
  String videoCalc5Result(Object p0, Object p1, Object p2, Object p3, Object p4,
      Object p5, Object p6) {
    return 'Video Calc5 Result : $p0 · $p1 · $p2 · $p3 · $p4 · $p5 · $p6';
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
      Object p0, Object p1, Object p2, Object p3, Object p4) {
    return 'Video Calc6 Lumi For N : $p0 · $p1 · $p2 · $p3 · $p4';
  }

  @override
  String get videoCalc6NoteIndicative =>
      'Opmerking: indicatieve schatting (echte blend/overlap kan licht dalen).';

  @override
  String videoCalc6Result(
      Object p0,
      Object p1,
      Object p2,
      Object p3,
      Object p4,
      Object p5,
      Object p6,
      Object p7,
      Object p8,
      Object p9,
      Object p10,
      Object p11,
      Object p12,
      Object p13,
      Object p14) {
    return 'Video Calc6 Result : $p0 · $p1 · $p2 · $p3 · $p4 · $p5 · $p6 · $p7 · $p8 · $p9 · $p10 · $p11 · $p12 · $p13 · $p14';
  }

  @override
  String videoCommonPillFormat(Object p0) {
    return 'Video Common Pill Format : $p0';
  }

  @override
  String videoCommonPillDistance(Object p0) {
    return 'Video Common Pill Distance : $p0';
  }

  @override
  String videoCommonPillWidth(Object p0) {
    return 'Video Common Pill Width : $p0';
  }

  @override
  String videoCommonPillRatio(Object p0) {
    return 'Video Common Pill Ratio : $p0';
  }

  @override
  String videoCommonPillHeight(Object p0) {
    return 'Video Common Pill Height : $p0';
  }

  @override
  String videoCommonPillArea(Object p0) {
    return 'Video Common Pill Area : $p0';
  }

  @override
  String videoCommonPillTotalWidth(Object p0) {
    return 'Video Common Pill Total Width : $p0';
  }

  @override
  String videoCommonPillOverlap(Object p0) {
    return 'Video Common Pill Overlap : $p0';
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
  String videoCalcLabel(Object p0) {
    return 'Video Calc Label : $p0';
  }

  @override
  String get videoBrightnessSectionTitle =>
      'Berekening 4 — Lux / nits / ft-L + drempel';

  @override
  String get videoCalc4ErrMissingSimple =>
      '❌ Ontbrekende gegevens: Breedte + Lumen + Gain.';

  @override
  String videoBrightnessResult(Object p0, Object p1, Object p2, Object p3,
      Object p4, Object p5, Object p6, Object p7, Object p8) {
    return 'Video Brightness Result : $p0 · $p1 · $p2 · $p3 · $p4 · $p5 · $p6 · $p7 · $p8';
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
  String mireMappingSubtitlePattern(Object p0, Object p1, Object p2) {
    return 'Mire Mapping Subtitle Pattern : $p0 · $p1 · $p2';
  }

  @override
  String get mireOrientationHorizontal => 'Horizontaal';

  @override
  String get mireOrientationVertical => 'Verticaal';

  @override
  String mireProjectorLabelPattern(Object p0) {
    return 'Mire Projector Label Pattern : $p0';
  }

  @override
  String get mireBlendLabel => 'BLEND';

  @override
  String get mireTileMissingPx => 'Geef Tile (px) op voor nummering.';

  @override
  String get mireWallNotMultipleOfTiles => 'WALL NIET DEELBAAR DOOR TILES';

  @override
  String mireTilesSubtitleBase(Object p0, Object p1, Object p2, Object p3) {
    return 'Mire Tiles Subtitle Base : $p0 · $p1 · $p2 · $p3';
  }

  @override
  String mireTilesSubtitleTilePhys(Object p0, Object p1) {
    return 'Mire Tiles Subtitle Tile Phys : $p0 · $p1';
  }

  @override
  String mireTilesSubtitlePitchEq(Object p0) {
    return 'Mire Tiles Subtitle Pitch Eq : $p0';
  }

  @override
  String mireTilesSubtitlePitchXY(Object p0, Object p1) {
    return 'Mire Tiles Subtitle Pitch XY : $p0 · $p1';
  }

  @override
  String mireTilesSubtitleWallPhys(Object p0, Object p1) {
    return 'Mire Tiles Subtitle Wall Phys : $p0 · $p1';
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
  String mirePitchEqual(Object p0) {
    return 'Mire Pitch Equal : $p0';
  }

  @override
  String mirePitchXY(Object p0, Object p1) {
    return 'Mire Pitch XY : $p0 · $p1';
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
  String mireLedWallResolution(Object p0, Object p1) {
    return 'Mire LED Wall Resolution : $p0 · $p1';
  }

  @override
  String mireLedPitchComputed(Object p0) {
    return 'Mire LED Pitch Computed : $p0';
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

  @override
  String get laserConsentCheckboxLabel => 'Laser Consent Checkbox Label';

  @override
  String get laserConsentAcceptContinue => 'Laser Consent Accept Continue';

  @override
  String get laserConsentContinue => 'Laser Consent Continue';

  @override
  String get laserZoneLabelNohd => 'Laser Zone Label Nohd';

  @override
  String get laserZoneLabelSzed => 'Laser Zone Label Szed';

  @override
  String get laserZoneLabelCzed => 'Laser Zone Label Czed';

  @override
  String laserValueMeter(Object value) {
    return 'Laser Value Meter';
  }

  @override
  String laserPercentValue(Object value) {
    return 'Laser Percent Value';
  }

  @override
  String get laserLegalDisclaimerText => 'Laser Legal Disclaimer Text';

  @override
  String get laserLegalDisclaimerTextLong => 'Laser Legal Disclaimer Text Long';

  @override
  String get common_copie_dans_le_presse_papiers =>
      'Gekopieerd naar het klembord.';

  @override
  String get mireEcranVideo_mires_ecran_video => 'Videoscherm testpatronen';

  @override
  String get mireEcranVideo_exporter_png => 'PNG exporteren';

  @override
  String get mireEcranVideo_exporter_png_2 => 'PNG exporteren';

  @override
  String get mireEcranVideo_combo_grille_cercles_2_barres_centrees =>
      'Combo (grille + cercles + 2 barres centrées)';

  @override
  String get mireEcranVideo_grille_safe_cercles => 'Raster + safe + cirkels';

  @override
  String get mireEcranVideo_barres_rampes_cercles => 'Balken + ramps + cirkels';

  @override
  String get mireEcranVideo_uniformite_cercles => 'Uniformiteit + cirkels';

  @override
  String get mireEcranVideo_damier_cercles => 'Damier + cirkels';

  @override
  String get mireEcranVideo_horizontal => 'Horizontaal';

  @override
  String get mireEcranVideo_vertical => 'Verticaal';

  @override
  String get mireEcranVideo_combo_zones_overlap_blend =>
      'Combo (zones + overlap + blend)';

  @override
  String get mireEcranVideo_zones_overlap => 'Zones + overlap';

  @override
  String get mireEcranVideo_blend_ramps => 'Blend ramps';

  @override
  String get mireEcranVideo_mire_ecran_simple => 'Eenvoudig testpatroon';

  @override
  String get mireEcranVideo_mire_mapping_multi_projecteur =>
      'Mapping testpatroon (multi-projector)';

  @override
  String get mireEcranVideo_largeur_px => 'Breedte (px)';

  @override
  String get mireEcranVideo_hauteur_px => 'Hoogte (px)';

  @override
  String get mireEcranVideo_largeur_px_2 => 'Breedte (px)';

  @override
  String get mireEcranVideo_hauteur_px_2 => 'Hoogte (px)';

  @override
  String get mireEcranVideo_nombre_de_projecteurs_n => 'Aantal projectoren (N)';

  @override
  String get mireEcranVideo_overlap => 'Overlap (%)';

  @override
  String get mireEcranVideo_ex_1920 => 'bv. 1920';

  @override
  String get mireEcranVideo_ex_1080 => 'bv. 1080';

  @override
  String get mireEcranVideo_ex_3840 => 'bv. 3840';

  @override
  String get mireEcranVideo_ex_2160 => 'bv. 2160';

  @override
  String get mireEcranVideo_ex_2 => 'bv. 2';

  @override
  String get mireEcranVideo_ex_10_0 => 'bv. 10.0';

  @override
  String get aboutRegistry_dmx_fonctionnement_simple_complet =>
      'DMX — fonctionnement (simple & complet)';

  @override
  String get aboutRegistry_univers_adresses_trames_cablage_rs_485_t =>
      'Univers, adresses, trames, câblage RS-485, terminaison, erreurs terrain.\\n';

  @override
  String get aboutRegistry_art_net_dmx_sur_ip_nodes_unicast_broadca =>
      'Art-Net — DMX sur IP (nodes, unicast/broadcast)';

  @override
  String get aboutRegistry_univers_dmx_sur_ethernet_udp_nodes_broad =>
      'Univers DMX sur Ethernet/UDP, nodes, broadcast vs unicast.\\n';

  @override
  String get aboutRegistry_sacn_e1_31_multicast_igmp_priorites =>
      'sACN / E1.31 — multicast, IGMP, priorités';

  @override
  String get aboutRegistry_standard_dmx_sur_ip_oriente_reseau_pro_n =>
      'Standard DMX sur IP orienté réseau pro.\\n';

  @override
  String get aboutRegistry_reseau_bases_ip_masque_dhcp_essentiel =>
      'Réseau — bases IP / masque / DHCP (essentiel)';

  @override
  String get aboutRegistry_comprendre_ip_masque_passerelle_dhcp_vs_ =>
      'Comprendre IP, masque, passerelle, DHCP vs statique.\\n';

  @override
  String get aboutRegistry_reseau_rj45_fibre_debits_longueurs =>
      'Réseau — RJ45 / Fibre / débits & longueurs';

  @override
  String get aboutRegistry_cat5e_cat8_fibre_om3_om4_os2_lc_sc_mpo_d =>
      'Cat5e→Cat8, fibre OM3/OM4/OS2, LC/SC/MPO, distances typiques, bonnes pratiques show.';

  @override
  String get aboutRegistry_reseau_lumiere_vlan_igmp_wi_fi_vs_filair =>
      'Réseau lumière — VLAN, IGMP, Wi-Fi vs filaire';

  @override
  String get aboutRegistry_architecture_simple_et_robuste_pour_art_ =>
      'Architecture simple et robuste pour Art-Net/sACN.\\n';

  @override
  String get aboutRegistry_video_sdi_ndi_ip_srt_rtmp =>
      'Vidéo — SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutRegistry_choisir_selon_latence_fiabilite_cablage_ =>
      'Choisir selon latence, fiabilité, câblage, réseau LAN vs WAN.\\n';

  @override
  String get aboutRegistry_electrique_schuko_p17_puissances =>
      'Électrique — Schuko / P17 / puissances';

  @override
  String get aboutRegistry_connecteurs_mono_tri_tableaux_kw_rapides =>
      'Connecteurs, mono/tri, tableaux kW rapides (16A→400A), pièges terrain.';

  @override
  String get aboutRegistry_informatique_usb_hdmi_dp_sata_nvme =>
      'Informatique — USB / HDMI / DP / SATA / NVMe…';

  @override
  String get aboutRegistry_debits_utiles_versions_limites_reelles_p =>
      'Débits utiles, versions, limites réelles, pièges marketing.';

  @override
  String get fixtureCatalog_catalogue => 'Catalogus';

  @override
  String get fixtureCatalog_ouvrir_le_manuel => 'Handleiding openen';

  @override
  String get fixtureCatalog_ouvrir_la_charte_dmx => 'DMX-tabel openen';

  @override
  String get fixtureCatalog_catalogue_mis_a_jour => 'Catalogue mis à jour.';

  @override
  String fixtureCatalog_echec_synchronisation_e(Object error) {
    return 'Synchronisatie mislukt: $error';
  }

  @override
  String fixtureCatalog_label_value(Object label, Object value) {
    return '$label: $value';
  }

  @override
  String fixtureCatalog_constructeur_manufacturers_length(Object p0) {
    return 'FixtureCatalog constructeur manufacturers length : $p0';
  }

  @override
  String fixtureCatalog_type_de_projecteur_types_length(Object p0) {
    return 'FixtureCatalog type de projecteur types length : $p0';
  }

  @override
  String fixtureCatalog_modele_products_length(Object p0) {
    return 'FixtureCatalog modele products length : $p0';
  }

  @override
  String fixtureCatalog_mode_dmx_modenames_length(Object p0) {
    return 'FixtureCatalog mode DMX modenames length : $p0';
  }

  @override
  String get fixtureCatalog_mettre_a_jour => 'Bijwerken';

  @override
  String get fixtureCatalog_reinitialiser => 'Reset';

  @override
  String get aboutInformatique_informatique_reperes_terrain =>
      'Informatique — repères terrain';

  @override
  String get aboutInformatique_sommaire => 'Inhoud';

  @override
  String get aboutInformatique_1_usb_usb_c_thunderbolt =>
      '1) USB / USB-C / Thunderbolt';

  @override
  String get aboutInformatique_point_critique => 'Point critique';

  @override
  String get aboutInformatique_reperes_vitesses_ordre_de_grandeur =>
      'Repères vitesses (ordre de grandeur)';

  @override
  String get aboutInformatique_2_stockage_sata_nvme_ssd =>
      '2) Stockage (SATA / NVMe / SSD)';

  @override
  String get aboutInformatique_sata_vs_nvme => 'SATA vs NVMe';

  @override
  String get aboutInformatique_terrain_video => 'Terrain vidéo';

  @override
  String get aboutInformatique_3_liaisons_video_dp_hdmi =>
      '3) Liaisons vidéo (DP / HDMI)';

  @override
  String get aboutInformatique_repere_important => 'Repère important';

  @override
  String get aboutInformatique_dp_vs_hdmi_tres_simplifie =>
      'DP vs HDMI (très simplifié)';

  @override
  String get aboutInformatique_4_pcie_gpu_reperes => '4) PCIe / GPU (repères)';

  @override
  String get aboutInformatique_terrain => 'Terrain';

  @override
  String get aboutInformatique_5_checklist_plateau => '5) Checklist (plateau)';

  @override
  String get aboutInformatique_rapide => 'Rapide';

  @override
  String get aboutInformatique_copier_resume => 'Copier résumé';

  @override
  String get aboutInformatique_copier => 'Copier';

  @override
  String get aboutElectricite_electrique_reperes_terrain =>
      'Électrique — repères terrain';

  @override
  String get aboutElectricite_sommaire => 'Inhoud';

  @override
  String get aboutElectricite_1_bases_w_a_v_kw => '1) Bases (W, A, V, kW)';

  @override
  String get aboutElectricite_3_formules_utiles => '3 formules utiles';

  @override
  String get aboutElectricite_reperes_terrain => 'Repères terrain';

  @override
  String get aboutElectricite_2_connecteurs_schuko_p17_powercon =>
      '2) Connecteurs (Schuko / P17 / PowerCON)';

  @override
  String get aboutElectricite_schuko_prises_domestiques =>
      'Schuko (prises domestiques)';

  @override
  String get aboutElectricite_p17_cee_bleu_rouge => 'P17 / CEE (bleu/rouge)';

  @override
  String get aboutElectricite_powercon_audio_eclairage =>
      'PowerCON (audio/éclairage)';

  @override
  String get aboutElectricite_3_mono_tri_ce_que_ca_change =>
      '3) Mono / Tri (ce que ça change)';

  @override
  String get aboutElectricite_pieges_frequents => 'Pièges fréquents';

  @override
  String get aboutElectricite_methode_simple => 'Méthode simple';

  @override
  String get aboutElectricite_4_table_rapide_16a_400a =>
      '4) Table rapide (16A → 400A)';

  @override
  String get aboutElectricite_important => 'Important';

  @override
  String get aboutElectricite_5_securite_pieges_terrain =>
      '5) Sécurité & pièges terrain';

  @override
  String get aboutElectricite_a_ne_pas_faire => 'À ne pas faire';

  @override
  String get aboutElectricite_signaux_d_alerte => 'Signaux d’alerte';

  @override
  String get aboutElectricite_6_checklist => '6) Checklist';

  @override
  String get aboutElectricite_rapide => 'Rapide';

  @override
  String get aboutElectricite_copier_resume => 'Copier résumé';

  @override
  String get aboutElectricite_copier => 'Copier';

  @override
  String get aboutNetwork_reseau_lumiere_vlan_igmp_wi_fi =>
      'Réseau lumière — VLAN, IGMP, Wi-Fi';

  @override
  String get aboutNetwork_1_objectif_reseau_stable =>
      '1) Objectif: réseau stable';

  @override
  String get aboutNetwork_regle_de_base => 'Règle de base';

  @override
  String get aboutNetwork_2_plan_ip_simple => '2) Plan IP (simple)';

  @override
  String get aboutNetwork_exemple_de_plan_simple => 'Exemple de plan (simple)';

  @override
  String get aboutNetwork_3_vlan_separation => '3) VLAN (séparation)';

  @override
  String get aboutNetwork_ce_que_tu_gagnes => 'Ce que tu gagnes';

  @override
  String get aboutNetwork_4_igmp_sacn_multicast => '4) IGMP (sACN multicast)';

  @override
  String get aboutNetwork_igmp_querier_idee_simple =>
      'IGMP querier (idée simple)';

  @override
  String get aboutNetwork_5_wi_fi_vs_filaire => '5) Wi-Fi vs filaire';

  @override
  String get aboutNetwork_regle_simple => 'Règle simple';

  @override
  String get aboutNetwork_6_switch_ce_qu_il_faut => '6) Switch: ce qu’il faut';

  @override
  String get aboutNetwork_minimum_recommande => 'Minimum recommandé';

  @override
  String get aboutNetwork_7_schemas => '7) Schémas';

  @override
  String get aboutNetwork_7bis_images_assets => '7bis) Images (assets)';

  @override
  String get aboutNetwork_8_checklist => '8) Checklist';

  @override
  String get aboutNetwork_avant_d_ouvrir_wireshark =>
      'Avant d’ouvrir Wireshark 😄';

  @override
  String get aboutNetwork_sommaire => 'Inhoud';

  @override
  String get aboutNetwork_copier_liste_assets => 'Copier liste assets';

  @override
  String get aboutNetwork_copier => 'Copier';

  @override
  String get aboutNetwork_copier_reperes => 'Copier repères';

  @override
  String get aboutVideo_video_reperes_terrain => 'Vidéo — repères terrain';

  @override
  String get aboutVideo_sommaire => 'Inhoud';

  @override
  String get aboutVideo_1_bases_video_mots_cles => '1) Bases vidéo (mots-clés)';

  @override
  String get aboutVideo_vocabulaire_utile => 'Vocabulaire utile';

  @override
  String get aboutVideo_2_resolution_fps => '2) Résolution & FPS';

  @override
  String get aboutVideo_resolution => 'Résolution';

  @override
  String get aboutVideo_fps => 'FPS';

  @override
  String get aboutVideo_3_couleur_4_4_4_4_2_2_10_bit =>
      '3) Couleur (4:4:4 / 4:2:2 / 10-bit)';

  @override
  String get aboutVideo_sampling => 'Sampling';

  @override
  String get aboutVideo_bit_depth => 'Bit depth';

  @override
  String get aboutVideo_4_sync_genlock_timecode =>
      '4) Sync (Genlock / Timecode)';

  @override
  String get aboutVideo_genlock => 'Genlock';

  @override
  String get aboutVideo_timecode => 'Timecode';

  @override
  String get aboutVideo_5_cables_distances => '5) Câbles & distances';

  @override
  String get aboutVideo_regles_simples => 'Règles simples';

  @override
  String get aboutVideo_6_sdi_3g_6g_12g => '6) SDI (3G / 6G / 12G)';

  @override
  String get aboutVideo_reperes => 'Repères';

  @override
  String get aboutVideo_7_hdmi_terrain => '7) HDMI — terrain';

  @override
  String get aboutVideo_a_surveiller => 'À surveiller';

  @override
  String get aboutVideo_8_ndi => '8) NDI';

  @override
  String get aboutVideo_ip_video => 'IP vidéo';

  @override
  String get aboutVideo_9_mapping_led_multi_projo =>
      '9) Mapping / LED / multi-projo';

  @override
  String get aboutVideo_terrain => 'Terrain';

  @override
  String get aboutVideo_10_checklist_terrain => '10) Checklist terrain';

  @override
  String get aboutVideo_avant_de_paniquer => 'Avant de paniquer';

  @override
  String get aboutVideo_copier_resume => 'Copier résumé';

  @override
  String get aboutArtnet_art_net_univers_dmx_sur_ip_simple_comple =>
      'Art-Net — univers DMX sur IP (simple & complet)';

  @override
  String get aboutArtnet_1_art_net_c_est_quoi_et_pourquoi =>
      '1) Art-Net — c’est quoi et pourquoi';

  @override
  String get aboutArtnet_pourquoi_c_est_utile => 'Pourquoi c’est utile';

  @override
  String get aboutArtnet_2_adressage_univers_mapping_propre =>
      '2) Adressage & univers — mapping propre';

  @override
  String get aboutArtnet_methode_simple_qui_evite_80_des_erreurs =>
      'Méthode simple (qui évite 80% des erreurs)';

  @override
  String get aboutArtnet_3_limites_perf_ce_qui_casse_en_premier =>
      '3) Limites & perf — ce qui casse en premier';

  @override
  String get aboutArtnet_les_limites_reelles_dans_l_ordre =>
      'Les limites “réelles” (dans l’ordre)';

  @override
  String get aboutArtnet_4_nodes_splitters_rdm => '4) Nodes, splitters & RDM';

  @override
  String get aboutArtnet_rdm_sur_art_net_support_variable =>
      'RDM sur Art-Net (support variable)';

  @override
  String get aboutArtnet_5_depannage_symptomes_causes =>
      '5) Dépannage — symptômes → causes';

  @override
  String get aboutArtnet_symptomes_causes_probables =>
      'Symptômes → causes probables';

  @override
  String get aboutArtnet_6_schemas_reseau_unicast_vs_broadcast =>
      '6) Schémas (réseau / unicast vs broadcast)';

  @override
  String get aboutArtnet_6bis_images_assets_rj45_switch_cables =>
      '6bis) Images (assets) — RJ45/switch/câbles';

  @override
  String get aboutArtnet_7_checklist_rapide => '7) Checklist rapide';

  @override
  String get aboutArtnet_avant_de_paniquer => 'Avant de paniquer';

  @override
  String get aboutArtnet_sommaire => 'Inhoud';

  @override
  String get aboutArtnet_copier_liste_assets => 'Copier liste assets';

  @override
  String get aboutArtnet_copier_la_checklist => 'Copier la checklist';

  @override
  String get aboutArtnet_copier_reperes => 'Copier repères';

  @override
  String get aboutReseau_reseau_reperes_terrain => 'Réseau — repères terrain';

  @override
  String get aboutReseau_sommaire => 'Inhoud';

  @override
  String get aboutReseau_1_bases_reseau_lan_ip_debit =>
      '1) Bases réseau (LAN / IP / débit)';

  @override
  String get aboutReseau_les_3_idees_simples => 'Les 3 idées simples';

  @override
  String get aboutReseau_topologie_show_propre => 'Topologie show (propre)';

  @override
  String get aboutReseau_2_rj45_categories_cat5e_6_6a =>
      '2) RJ45 & catégories (Cat5e/6/6A/…)';

  @override
  String get aboutReseau_reperes_rapides => 'Repères rapides';

  @override
  String get aboutReseau_terrain => 'Terrain';

  @override
  String get aboutReseau_3_poe_alimentation_reseau =>
      '3) PoE (alimentation réseau)';

  @override
  String get aboutReseau_reperes => 'Repères';

  @override
  String get aboutReseau_4_fibre_sm_mm_connecteurs_lc_sc =>
      '4) Fibre (SM/MM) + connecteurs (LC/SC)';

  @override
  String get aboutReseau_pourquoi_la_fibre_en_show =>
      'Pourquoi la fibre en show';

  @override
  String get aboutReseau_multimode_vs_monomode_repere_simple =>
      'Multimode vs Monomode (repère simple)';

  @override
  String get aboutReseau_connecteurs => 'Connecteurs';

  @override
  String get aboutReseau_5_sfp_sfp_qsfp_modules =>
      '5) SFP / SFP+ / QSFP (modules)';

  @override
  String get aboutReseau_reperes_2 => 'Repères';

  @override
  String get aboutReseau_6_switches_vlan_igmp_qos =>
      '6) Switches (VLAN / IGMP / QoS)';

  @override
  String get aboutReseau_fonctions_utiles_en_spectacle =>
      'Fonctions utiles en spectacle';

  @override
  String get aboutReseau_erreurs_frequentes => 'Erreurs fréquentes';

  @override
  String get aboutReseau_7_art_net_sacn_sur_reseau_conseils =>
      '7) Art-Net / sACN sur réseau (conseils)';

  @override
  String get aboutReseau_art_net_terrain => 'Art-Net (terrain)';

  @override
  String get aboutReseau_sacn_terrain => 'sACN (terrain)';

  @override
  String get aboutReseau_8_checklist => '8) Checklist';

  @override
  String get aboutReseau_rapide => 'Rapide';

  @override
  String get aboutReseau_copier_resume => 'Copier résumé';

  @override
  String get aboutReseau_copier => 'Copier';

  @override
  String get aboutSacn_sacn_e1_31_multicast_priorites =>
      'sACN / E1.31 — multicast & priorités';

  @override
  String get aboutSacn_1_a_quoi_sert_sacn => '1) À quoi sert sACN ?';

  @override
  String get aboutSacn_quand_c_est_top => 'Quand c’est top';

  @override
  String get aboutSacn_2_univers_numerotation => '2) Univers (numérotation)';

  @override
  String get aboutSacn_erreur_classique => 'Erreur classique';

  @override
  String get aboutSacn_3_multicast_unicast_igmp =>
      '3) Multicast / Unicast + IGMP';

  @override
  String get aboutSacn_igmp_snooping_pourquoi_c_est_important =>
      'IGMP snooping (pourquoi c’est important)';

  @override
  String get aboutSacn_4_priorites_multi_sources =>
      '4) Priorités (multi-sources)';

  @override
  String get aboutSacn_pieges => 'Pièges';

  @override
  String get aboutSacn_5_limites_perfs => '5) Limites / perfs';

  @override
  String get aboutSacn_ce_qui_casse_en_premier => 'Ce qui casse en premier';

  @override
  String get aboutSacn_6_rdm_sacn_proxy_selon_materiel =>
      '6) RDM & sACN (proxy / selon matériel)';

  @override
  String get aboutSacn_a_verifier_dans_la_doc_du_node =>
      'À vérifier dans la doc du node';

  @override
  String get aboutSacn_7_schemas => '7) Schémas';

  @override
  String get aboutSacn_7bis_images_assets => '7bis) Images (assets)';

  @override
  String get aboutSacn_8_checklist => '8) Checklist';

  @override
  String get aboutSacn_avant_d_accuser_le_protocole =>
      'Avant d’accuser “le protocole”';

  @override
  String get aboutSacn_sommaire => 'Inhoud';

  @override
  String get aboutSacn_copier_liste_assets => 'Copier liste assets';

  @override
  String get aboutSacn_copier => 'Copier';

  @override
  String get aboutSacn_copier_reperes => 'Copier repères';

  @override
  String get aboutDmx_dmx_fonctionnement_simple_complet =>
      'DMX — fonctionnement (simple & complet)';

  @override
  String get aboutDmx_garde_ton_contenu_existant =>
      '... (garde ton contenu existant)';

  @override
  String get aboutDmx_garde_ton_contenu_existant_2 =>
      '... (garde ton contenu existant)';

  @override
  String get aboutDmx_garde_ton_contenu_existant_3 =>
      '... (garde ton contenu existant)';

  @override
  String get aboutDmx_garde_ton_contenu_existant_4 =>
      '... (garde ton contenu existant)';

  @override
  String get aboutDmx_garde_ton_contenu_existant_5 =>
      '... (garde ton contenu existant)';

  @override
  String get aboutDmx_garde_ton_contenu_existant_6 =>
      '... (garde ton contenu existant)';

  @override
  String get aboutDmx_garde_ton_contenu_existant_7 =>
      '... (garde ton contenu existant)';

  @override
  String get aboutDmx_garde_ton_contenu_existant_8 =>
      '... (garde ton contenu existant)';

  @override
  String get aboutDmx_sommaire => 'Inhoud';

  @override
  String get aboutDmx_1_dmx_univers_adresses_la_base =>
      '1) DMX, univers, adresses — la base';

  @override
  String get aboutDmx_a_retenir => 'À retenir';

  @override
  String get aboutDmx_2_trame_dmx_break_start_code_canaux =>
      '2) Trame DMX — break, start code, canaux';

  @override
  String get aboutDmx_3_cablage_rs_485_topologie_cable =>
      '3) Câblage RS-485 — topologie & câble';

  @override
  String get aboutDmx_4_terminaison_splitters_eviter_les_refle =>
      '4) Terminaison & splitters — éviter les réflexions';

  @override
  String get aboutDmx_4bis_rdm_limites_compatibilites =>
      '4bis) RDM — limites & compatibilités';

  @override
  String get aboutDmx_5_depannage_terrain_symptomes_causes =>
      '5) Dépannage terrain — symptômes → causes';

  @override
  String get aboutDmx_6_art_net_reperes_terrain =>
      '6) Art-Net — repères terrain';

  @override
  String get aboutDmx_7_sacn_e1_31_multicast_igmp_priorites =>
      '7) sACN / E1.31 — multicast, IGMP, priorités';

  @override
  String get aboutDmx_8_dmx_vs_art_net_vs_sacn_choisir =>
      '8) DMX vs Art-Net vs sACN — choisir';

  @override
  String get aboutDmx_9_schemas_terrain_dmx_ip_pinout =>
      '9) Schémas terrain (DMX / IP / pinout)';

  @override
  String get aboutDmx_10_checklist_rapide => '10) Checklist rapide';

  @override
  String get aboutDmx_avant_de_paniquer => 'Avant de paniquer';

  @override
  String get aboutDmx_copier_resume => 'Copier résumé';

  @override
  String get aboutDmx_copier_la_checklist => 'Copier la checklist';

  @override
  String get aboutIpBasics_reseau_bases_ip_masque_dhcp_essentiel =>
      'Réseau — bases IP / masque / DHCP (essentiel)';

  @override
  String get aboutIpBasics_sommaire => 'Inhoud';

  @override
  String get aboutIpBasics_1_c_est_quoi_une_ip_et_a_quoi_ca_sert =>
      '1) C’est quoi une IP et à quoi ça sert ?';

  @override
  String get aboutIpBasics_image_mentale => 'Image mentale';

  @override
  String get aboutIpBasics_2_pourquoi_192_x_10_x_172_x_adresses_pri =>
      '2) Pourquoi 192.x / 10.x / 172.x ? (adresses privées)';

  @override
  String get aboutIpBasics_les_3_grandes_plages_privees_lan =>
      'Les 3 grandes plages privées (LAN)';

  @override
  String get aboutIpBasics_3_masque_sous_reseaux_comprendre_pour_de =>
      '3) Masque & sous-réseaux : comprendre pour de vrai';

  @override
  String get aboutIpBasics_masques_les_plus_courants =>
      'Masques les plus courants';

  @override
  String get aboutIpBasics_masque_adresse_de_broadcast_tres_utile_a =>
      'Masque → adresse de broadcast (très utile à comprendre)';

  @override
  String get aboutIpBasics_piege_classique => 'Piège classique';

  @override
  String get aboutIpBasics_4_dhcp_passerelle_dns_qui_fait_quoi =>
      '4) DHCP, passerelle, DNS : qui fait quoi ?';

  @override
  String get aboutIpBasics_passerelle_gateway => 'Passerelle (gateway)';

  @override
  String get aboutIpBasics_dns => 'DNS';

  @override
  String get aboutIpBasics_5_comment_deux_appareils_se_parlent_lan_ =>
      '5) Comment deux appareils se parlent (LAN vs hors LAN)';

  @override
  String get aboutIpBasics_exemple_facile => 'Exemple (facile)';

  @override
  String get aboutIpBasics_broadcast_vs_unicast_bonus_utile =>
      'Broadcast vs unicast (bonus utile)';

  @override
  String get aboutIpBasics_6_plans_ip_show_simples_exemples_prets_a =>
      '6) Plans IP “show” simples (exemples prêts à copier)';

  @override
  String get aboutIpBasics_pourquoi_ca_marche_bien => 'Pourquoi ça marche bien';

  @override
  String get aboutIpBasics_quand_l_utiliser => 'Quand l’utiliser';

  @override
  String get aboutIpBasics_attention => 'Attention';

  @override
  String get aboutIpBasics_7_depannage_symptomes_causes_methode_ter =>
      '7) Dépannage : symptômes → causes (méthode terrain)';

  @override
  String get aboutIpBasics_symptomes_causes_probables =>
      'Symptômes → causes probables';

  @override
  String get aboutIpBasics_piege_tres_frequent => 'Piège très fréquent';

  @override
  String get aboutIpBasics_8_mini_exercices_verifier_vite_un_masque =>
      '8) Mini-exercices (vérifier vite un masque / un réseau)';

  @override
  String get aboutIpBasics_astuce_visuelle => 'Astuce visuelle';

  @override
  String get aboutIpBasics_9_checklist_rapide => '9) Checklist rapide';

  @override
  String get aboutIpBasics_avant_de_chercher_midi_a_14h =>
      'Avant de chercher midi à 14h';

  @override
  String get aboutIpBasics_copier_memo => 'Copier mémo';

  @override
  String get aboutIpBasics_copier_la_checklist => 'Copier la checklist';

  @override
  String get common_non_renseigne => 'Niet opgegeven';

  @override
  String common_label_value(Object p0, Object p1) {
    return 'Common label value : $p0 · $p1';
  }

  @override
  String fixtureCatalog_mode_label(Object p0, Object p1) {
    return 'FixtureCatalog mode label : $p0 · $p1';
  }

  @override
  String get fixtureCatalog_canaux_dmx => 'DMX-kanalen';

  @override
  String get fixtureCatalog_poids => 'Gewicht';

  @override
  String get fixtureCatalog_puissance => 'Vermogen';

  @override
  String get fixtureCatalog_flux_lumineux => 'Lichtstroom';

  @override
  String get bpmTitle => 'BPM';

  @override
  String get bpmTapTitle => 'Tap tempo';

  @override
  String get bpmTapButton => 'Tikken';

  @override
  String get bpmResetTap => 'Reset';

  @override
  String get bpmDetectedLabel => 'Gedetecteerde BPM';

  @override
  String get bpmTapHint => 'Tik minstens 4 keer om te stabiliseren.';

  @override
  String get bpmManualTitle => 'Handmatige invoer';

  @override
  String get bpmManualLabel => 'BPM';

  @override
  String get bpmManualHint => 'bv. 128';

  @override
  String get bpmManualHelp =>
      'Voer een waarde in en de app berekent de conversies.';

  @override
  String get bpmConversionsTitle => 'Conversies';

  @override
  String get bpmActiveLabel => 'Actief';

  @override
  String get bpmMsPerBeat => 'ms / beat';

  @override
  String get bpmHz => 'Hz';

  @override
  String get bpmSecPerBar44 => 's / maat (4/4)';

  @override
  String get bpmDisclaimer =>
      'Indicatief — hangt af van swing, subdivisies en timecode.';

  @override
  String get fixtureCatalog_dmx_section => 'DMX';

  @override
  String get aboutLightReferenceTitle => 'About Light Reference Title';

  @override
  String get aboutSunTimesSubtitle => 'About Sun Times Subtitle';

  @override
  String get aboutSunTimesTitle => 'About Sun Times Title';

  @override
  String get commonAdd => 'Common Add';

  @override
  String get commonApply => 'Common Apply';

  @override
  String get commonCopySummaryTooltip => 'Common Copy Summary Tooltip';

  @override
  String get commonDash => 'Common Dash';

  @override
  String get commonDelete => 'Common Delete';

  @override
  String get commonOk => 'Common Ok';

  @override
  String get commonTocTitle => 'Common Toc Title';

  @override
  String get dipSwitchAddressHint => 'Dip Switch Address Hint';

  @override
  String get dipSwitchAddressLabel => 'Dip Switch Address Label';

  @override
  String get dipSwitchChannelUnit => 'Dip Switch Channel Unit';

  @override
  String get dipSwitchInputsTitle => 'Dip Switch Inputs Title';

  @override
  String get dipSwitchIntervalHint => 'Dip Switch Interval Hint';

  @override
  String get dipSwitchIntervalLabel => 'Dip Switch Interval Label';

  @override
  String get dipSwitchModeAddressDirect => 'Dip Switch Mode Address Direct';

  @override
  String get dipSwitchModeAddressMinusOne =>
      'Dip Switch Mode Address Minus One';

  @override
  String get dipSwitchNextAddressButton => 'Dip Switch Next Address Button';

  @override
  String get dipSwitchOffLabel => 'Dip Switch Off Label';

  @override
  String get dipSwitchOnLabel => 'Dip Switch On Label';

  @override
  String get dipSwitchResetTooltip => 'Dip Switch Reset Tooltip';

  @override
  String dipSwitchResultAddressLine(Object p0) {
    return 'Dip Switch Result Address Line : $p0';
  }

  @override
  String get dipSwitchResultAddressNotProvided =>
      'Dip Switch Result Address Not Provided';

  @override
  String dipSwitchResultBinaryValueLine(Object p0) {
    return 'Dip Switch Result Binary Value Line : $p0';
  }

  @override
  String get dipSwitchResultHeader => 'Dip Switch Result Header';

  @override
  String dipSwitchResultIntervalLine(Object p0, Object p1) {
    return 'Dip Switch Result Interval Line : $p0 · $p1';
  }

  @override
  String dipSwitchResultModeLine(Object p0) {
    return 'Dip Switch Result Mode Line : $p0';
  }

  @override
  String get dipSwitchScrollHint => 'Dip Switch Scroll Hint';

  @override
  String get dipSwitchSectionTitle => 'Dip Switch Section Title';

  @override
  String dipSwitchSwitchLabel(Object p0) {
    return 'Dip Switch Switch Label : $p0';
  }

  @override
  String get dipSwitchUseAddressMinusOneLabel =>
      'Dip Switch Use Address Minus One Label';

  @override
  String get gdtfChannelDefaultName => 'GDTF Channel Default Name';

  @override
  String get gdtfChannelsCountLabel => 'GDTF Channels Count Label';

  @override
  String get gdtfChannelsSectionTitle => 'GDTF Channels Section Title';

  @override
  String get gdtfDeviceSectionTitle => 'GDTF Device Section Title';

  @override
  String get gdtfEasyTitle => 'GDTF Easy Title';

  @override
  String get gdtfExportButton => 'GDTF Export Button';

  @override
  String get gdtfExportDone => 'GDTF Export Done';

  @override
  String get gdtfExportError => 'GDTF Export Error';

  @override
  String get gdtfExportHint => 'GDTF Export Hint';

  @override
  String get gdtfExportNeedChannels => 'GDTF Export Need Channels';

  @override
  String get gdtfFieldDefault => 'GDTF Field Default';

  @override
  String get gdtfFieldName => 'GDTF Field Name';

  @override
  String get gdtfFieldResolution => 'GDTF Field Resolution';

  @override
  String get gdtfFieldRole => 'GDTF Field Role';

  @override
  String get gdtfFootprintLabel => 'GDTF Footprint Label';

  @override
  String get gdtfManufacturerLabel => 'GDTF Manufacturer Label';

  @override
  String get gdtfModeNameLabel => 'GDTF Mode Name Label';

  @override
  String get gdtfModelLabel => 'GDTF Model Label';

  @override
  String get gdtfPresetBarreLed => 'GDTF Preset Barre LED';

  @override
  String get gdtfPresetBlue => 'GDTF Preset Blue';

  @override
  String get gdtfPresetColor1 => 'GDTF Preset Color1';

  @override
  String get gdtfPresetControl => 'GDTF Preset Control';

  @override
  String get gdtfPresetDimmer => 'GDTF Preset Dimmer';

  @override
  String get gdtfPresetEffect => 'GDTF Preset Effect';

  @override
  String get gdtfPresetFixtureSimple => 'GDTF Preset Fixture Simple';

  @override
  String get gdtfPresetFocus => 'GDTF Preset Focus';

  @override
  String get gdtfPresetGobo1 => 'GDTF Preset Gobo1';

  @override
  String get gdtfPresetGreen => 'GDTF Preset Green';

  @override
  String get gdtfPresetLabel => 'GDTF Preset Label';

  @override
  String get gdtfPresetPan => 'GDTF Preset Pan';

  @override
  String get gdtfPresetPrism => 'GDTF Preset Prism';

  @override
  String get gdtfPresetRed => 'GDTF Preset Red';

  @override
  String get gdtfPresetShutter => 'GDTF Preset Shutter';

  @override
  String get gdtfPresetTilt => 'GDTF Preset Tilt';

  @override
  String get gdtfPresetZoom => 'GDTF Preset Zoom';

  @override
  String get gdtfRes16 => 'GDTF Res16';

  @override
  String get gdtfRes8 => 'GDTF Res8';

  @override
  String get gdtfRoleBlue => 'GDTF Role Blue';

  @override
  String get gdtfRoleColor => 'GDTF Role Color';

  @override
  String get gdtfRoleControl => 'GDTF Role Control';

  @override
  String get gdtfRoleCustom => 'GDTF Role Custom';

  @override
  String get gdtfRoleDimmer => 'GDTF Role Dimmer';

  @override
  String get gdtfRoleEffect => 'GDTF Role Effect';

  @override
  String get gdtfRoleEmpty => 'GDTF Role Empty';

  @override
  String get gdtfRoleFocus => 'GDTF Role Focus';

  @override
  String get gdtfRoleGobo => 'GDTF Role Gobo';

  @override
  String get gdtfRoleGreen => 'GDTF Role Green';

  @override
  String get gdtfRolePan => 'GDTF Role Pan';

  @override
  String get gdtfRolePrism => 'GDTF Role Prism';

  @override
  String get gdtfRoleRed => 'GDTF Role Red';

  @override
  String get gdtfRoleShutter => 'GDTF Role Shutter';

  @override
  String get gdtfRoleTilt => 'GDTF Role Tilt';

  @override
  String get gdtfRoleZoom => 'GDTF Role Zoom';

  @override
  String get gdtfShareSubject => 'GDTF Share Subject';

  @override
  String get gdtfShareText => 'GDTF Share Text';

  @override
  String get gdtfTemplatesHintShort => 'GDTF Templates Hint Short';

  @override
  String get gdtfTemplatesTitle => 'GDTF Templates Title';

  @override
  String get homeBpmSubtitle => 'Home Bpm Subtitle';

  @override
  String get homeBpmTitle => 'Home Bpm Title';

  @override
  String get homeDrawerContact => 'Home Drawer Contact';

  @override
  String get homeDrawerSuggestItem => 'Home Drawer Suggest Item';

  @override
  String get laserBeamAreaAtDistance => 'Laser Beam Area At Distance';

  @override
  String get laserBeamDiameterAtDistance => 'Laser Beam Diameter At Distance';

  @override
  String get laserBeamDistanceHint => 'Laser Beam Distance Hint';

  @override
  String get laserBeamDistanceLabel => 'Laser Beam Distance Label';

  @override
  String get laserBeamFormulaHint => 'Laser Beam Formula Hint';

  @override
  String get laserBeamInputsTitle => 'Laser Beam Inputs Title';

  @override
  String get laserBeamRadiusAtDistance => 'Laser Beam Radius At Distance';

  @override
  String get laserBeamResultsTitle => 'Laser Beam Results Title';

  @override
  String get laserBeamSizeSubtitle => 'Laser Beam Size Subtitle';

  @override
  String get laserBeamSizeTitle => 'Laser Beam Size Title';

  @override
  String get laserToolsTitle => 'Laser Tools Title';

  @override
  String patchAddressLabel(Object p0) {
    return 'Patch Address Label : $p0';
  }

  @override
  String patchChannelsUsed(Object p0) {
    return 'Patch Channels Used : $p0';
  }

  @override
  String get patchConflictError => 'Patch Conflict Error';

  @override
  String get patchConflictShort => 'Patch Conflict Short';

  @override
  String patchConflicts(Object p0) {
    return 'Patch Conflicts : $p0';
  }

  @override
  String get patchCreateGdtfSubtitle => 'Patch Create GDTF Subtitle';

  @override
  String get patchCreateGdtfTitle => 'Patch Create GDTF Title';

  @override
  String get patchEditChannelsLabel => 'Patch Edit Channels Label';

  @override
  String get patchEditHint => 'Patch Edit Hint';

  @override
  String get patchEditModeLabel => 'Patch Edit Mode Label';

  @override
  String get patchEditTitle => 'Patch Edit Title';

  @override
  String get patchEmptyUniverse => 'Patch Empty Universe';

  @override
  String patchFixturesCount(Object p0) {
    return 'Patch Fixtures Count : $p0';
  }

  @override
  String get patchHomeDisclaimer => 'Patch Home Disclaimer';

  @override
  String get patchHomeImportMvrDescription =>
      'Patch Home Import MVR Description';

  @override
  String get patchHomeImportMvrTitle => 'Patch Home Import MVR Title';

  @override
  String get patchHomeTitle => 'Patch Home Title';

  @override
  String get patchHomeViewPatchDescription =>
      'Patch Home View Patch Description';

  @override
  String get patchHomeViewPatchTitle => 'Patch Home View Patch Title';

  @override
  String get patchHubOpenGridButton => 'Patch Hub Open Grid Button';

  @override
  String get patchHubOpenMvrButton => 'Patch Hub Open MVR Button';

  @override
  String get patchHubStateEmpty => 'Patch Hub State Empty';

  @override
  String patchHubStateLoaded(Object p0) {
    return 'Patch Hub State Loaded : $p0';
  }

  @override
  String get patchHubStateTitle => 'Patch Hub State Title';

  @override
  String get patchHubTitle => 'Patch Hub Title';

  @override
  String get patchHubWorksiteBody => 'Patch Hub Worksite Body';

  @override
  String get patchHubWorksiteTitle => 'Patch Hub Worksite Title';

  @override
  String get patchInvalidChannelCount => 'Patch Invalid Channel Count';

  @override
  String get patchIssueInvalidChannelCount =>
      'Patch Issue Invalid Channel Count';

  @override
  String get patchIssueInvalidStartAddress =>
      'Patch Issue Invalid Start Address';

  @override
  String get patchIssueInvalidUniverse => 'Patch Issue Invalid Universe';

  @override
  String get patchIssueRangeExceedsUniverse =>
      'Patch Issue Range Exceeds Universe';

  @override
  String get patchListTitle => 'Patch List Title';

  @override
  String get patchManualDisabledBody => 'Patch Manual Disabled Body';

  @override
  String get patchManualDisabledTitle => 'Patch Manual Disabled Title';

  @override
  String get patchManualTitle => 'Patch Manual Title';

  @override
  String patchModeLabel(Object p0) {
    return 'Patch Mode Label : $p0';
  }

  @override
  String get patchMvrButtonAnalyzing => 'Patch MVR Button Analyzing';

  @override
  String get patchMvrButtonLoadAsReference =>
      'Patch MVR Button Load As Reference';

  @override
  String get patchMvrButtonPickFile => 'Patch MVR Button Pick File';

  @override
  String get patchMvrClearTooltip => 'Patch MVR Clear Tooltip';

  @override
  String get patchMvrColAddress => 'Patch MVR Col Address';

  @override
  String get patchMvrColChannels => 'Patch MVR Col Channels';

  @override
  String get patchMvrColId => 'Patch MVR Col Id';

  @override
  String get patchMvrColName => 'Patch MVR Col Name';

  @override
  String get patchMvrColUniverse => 'Patch MVR Col Universe';

  @override
  String get patchMvrColumnsHint => 'Patch MVR Columns Hint';

  @override
  String get patchMvrFileCardHelp => 'Patch MVR File Card Help';

  @override
  String get patchMvrFileCardTitle => 'Patch MVR File Card Title';

  @override
  String get patchMvrFilterAllUniverses => 'Patch MVR Filter All Universes';

  @override
  String get patchMvrFilterUniverseLabel => 'Patch MVR Filter Universe Label';

  @override
  String get patchMvrModeNotProvided => 'Patch MVR Mode Not Provided';

  @override
  String get patchMvrOrderAsc => 'Patch MVR Order Asc';

  @override
  String get patchMvrOrderDesc => 'Patch MVR Order Desc';

  @override
  String get patchMvrOrderLabel => 'Patch MVR Order Label';

  @override
  String get patchMvrSortAddress => 'Patch MVR Sort Address';

  @override
  String get patchMvrSortByLabel => 'Patch MVR Sort By Label';

  @override
  String get patchMvrSortChannels => 'Patch MVR Sort Channels';

  @override
  String get patchMvrSortId => 'Patch MVR Sort Id';

  @override
  String get patchMvrSortName => 'Patch MVR Sort Name';

  @override
  String get patchMvrSortUniverse => 'Patch MVR Sort Universe';

  @override
  String get patchMvrSortUniverseThenAddress =>
      'Patch MVR Sort Universe Then Address';

  @override
  String get patchMvrStatusCleared => 'Patch MVR Status Cleared';

  @override
  String get patchMvrStatusEmptyBytes => 'Patch MVR Status Empty Bytes';

  @override
  String get patchMvrStatusExtractingZip => 'Patch MVR Status Extracting Zip';

  @override
  String patchMvrStatusFilePickFailed(Object p0) {
    return 'Patch MVR Status File Pick Failed : $p0';
  }

  @override
  String patchMvrStatusFixturesFound(Object p0, Object p1) {
    return 'Patch MVR Status Fixtures Found : $p0 · $p1';
  }

  @override
  String get patchMvrStatusLoadingGdtf => 'Patch MVR Status Loading GDTF';

  @override
  String get patchMvrStatusNoContentToLoad =>
      'Patch MVR Status No Content To Load';

  @override
  String get patchMvrStatusNoFileSelected =>
      'Patch MVR Status No File Selected';

  @override
  String get patchMvrStatusNoUsableFixtures =>
      'Patch MVR Status No Usable Fixtures';

  @override
  String patchMvrStatusParseError(Object p0) {
    return 'Patch MVR Status Parse Error : $p0';
  }

  @override
  String get patchMvrStatusParsingContent => 'Patch MVR Status Parsing Content';

  @override
  String patchMvrStatusReferenceLoaded(Object p0, Object p1, Object p2) {
    return 'Patch MVR Status Reference Loaded : $p0 · $p1 · $p2';
  }

  @override
  String patchMvrStatusRestored(Object p0) {
    return 'Patch MVR Status Restored : $p0';
  }

  @override
  String get patchMvrStatusSceneXmlNotFound =>
      'Patch MVR Status Scene Xml Not Found';

  @override
  String get patchMvrStatusSelectingFile => 'Patch MVR Status Selecting File';

  @override
  String patchMvrStatusUnsupportedFile(Object p0) {
    return 'Patch MVR Status Unsupported File : $p0';
  }

  @override
  String get patchMvrSummaryTitle => 'Patch MVR Summary Title';

  @override
  String get patchMvrTitle => 'Patch MVR Title';

  @override
  String patchMvrUniverseItem(Object p0) {
    return 'Patch MVR Universe Item : $p0';
  }

  @override
  String get patchPageTitle => 'Patch Page Title';

  @override
  String get patchSummaryTitle => 'Patch Summary Title';

  @override
  String get patchUniverseAppBarTitle => 'Patch Universe App Bar Title';

  @override
  String patchUniverseConflictCount(Object p0) {
    return 'Patch Universe Conflict Count : $p0';
  }

  @override
  String get patchUniverseGridLimitedByWidth =>
      'Patch Universe Grid Limited By Width';

  @override
  String get patchUniverseGridTitle => 'Patch Universe Grid Title';

  @override
  String patchUniverseItem(Object p0) {
    return 'Patch Universe Item : $p0';
  }

  @override
  String get patchUniverseLabel => 'Patch Universe Label';

  @override
  String get patchUniverseLegendConflict => 'Patch Universe Legend Conflict';

  @override
  String get patchUniverseLegendFree => 'Patch Universe Legend Free';

  @override
  String get patchUniverseLegendOccupied => 'Patch Universe Legend Occupied';

  @override
  String patchUniverseOccupantLine(
      Object p0, Object p1, Object p2, Object p3, Object p4) {
    return 'Patch Universe Occupant Line : $p0 · $p1 · $p2 · $p3 · $p4';
  }

  @override
  String patchUniverseOccupiedCount(Object p0) {
    return 'Patch Universe Occupied Count : $p0';
  }

  @override
  String patchUniversePopupHeader(Object p0, Object p1, Object p2) {
    return 'Patch Universe Popup Header : $p0 · $p1 · $p2';
  }

  @override
  String get patchUniversePopupManyOccupants =>
      'Patch Universe Popup Many Occupants';

  @override
  String patchUniversePopupMore(Object p0) {
    return 'Patch Universe Popup More : $p0';
  }

  @override
  String get patchUniversePopupTitleConflict =>
      'Patch Universe Popup Title Conflict';

  @override
  String get patchUniversePopupTitleFree => 'Patch Universe Popup Title Free';

  @override
  String get patchUniversePopupTitleOccupied =>
      'Patch Universe Popup Title Occupied';

  @override
  String get patchUniverseReferenceNone => 'Patch Universe Reference None';

  @override
  String get patchUniverseReferenceReadOnly =>
      'Patch Universe Reference Read Only';

  @override
  String get patchUniverseReferenceTitle => 'Patch Universe Reference Title';

  @override
  String get patchUniverseResetConfirm => 'Patch Universe Reset Confirm';

  @override
  String get patchUniverseResetContent => 'Patch Universe Reset Content';

  @override
  String get patchUniverseResetTitle => 'Patch Universe Reset Title';

  @override
  String get patchUniverseResetTooltip => 'Patch Universe Reset Tooltip';

  @override
  String get patchUniverseSelected => 'Patch Universe Selected';

  @override
  String get patchUniverseStateConflict => 'Patch Universe State Conflict';

  @override
  String get patchUniverseStateFree => 'Patch Universe State Free';

  @override
  String get patchUniverseStateOccupied => 'Patch Universe State Occupied';

  @override
  String get patchUniverseTapHint => 'Patch Universe Tap Hint';

  @override
  String get patchUniverseUniverseDropdownLabel =>
      'Patch Universe Universe Dropdown Label';

  @override
  String patchUniverseUniverseItem(Object p0) {
    return 'Patch Universe Universe Item : $p0';
  }

  @override
  String get patchUniverseUniverseTitle => 'Patch Universe Universe Title';

  @override
  String get patchUniverseZoomIn => 'Patch Universe Zoom In';

  @override
  String get patchUniverseZoomOut => 'Patch Universe Zoom Out';

  @override
  String get patchUniverseZoomTitle => 'Patch Universe Zoom Title';

  @override
  String get photometryAreaHint4 => 'Photometry Area Hint4';

  @override
  String get photometryAreaLabel => 'Photometry Area Label';

  @override
  String get photometryBeamAngleHint2 => 'Photometry Beam Angle Hint2';

  @override
  String get photometryBeamAngleHint3 => 'Photometry Beam Angle Hint3';

  @override
  String get photometryBeamAngleLabel => 'Photometry Beam Angle Label';

  @override
  String get photometryCandelaHint1 => 'Photometry Candela Hint1';

  @override
  String get photometryCandelaHint2 => 'Photometry Candela Hint2';

  @override
  String get photometryCandelaLabel => 'Photometry Candela Label';

  @override
  String get photometryDisclaimerShort => 'Photometry Disclaimer Short';

  @override
  String get photometryDistanceHint1 => 'Photometry Distance Hint1';

  @override
  String get photometryDistanceHint3 => 'Photometry Distance Hint3';

  @override
  String get photometryDistanceLabel => 'Photometry Distance Label';

  @override
  String get photometryLumensHint2 => 'Photometry Lumens Hint2';

  @override
  String get photometryLumensHint3 => 'Photometry Lumens Hint3';

  @override
  String get photometryLumensLabel => 'Photometry Lumens Label';

  @override
  String get photometryLuxHint => 'Photometry Lux Hint';

  @override
  String get photometryLuxLabel => 'Photometry Lux Label';

  @override
  String get photometrySection1Title => 'Photometry Section1 Title';

  @override
  String get photometrySection2Title => 'Photometry Section2 Title';

  @override
  String get photometrySection3Title => 'Photometry Section3 Title';

  @override
  String get photometrySection4Title => 'Photometry Section4 Title';

  @override
  String photometrySummary1(Object p0, Object p1, Object p2) {
    return 'Photometry Summary1 : $p0 · $p1 · $p2';
  }

  @override
  String photometrySummary2(Object p0, Object p1, Object p2) {
    return 'Photometry Summary2 : $p0 · $p1 · $p2';
  }

  @override
  String photometrySummary3(Object p0, Object p1, Object p2, Object p3) {
    return 'Photometry Summary3 : $p0 · $p1 · $p2 · $p3';
  }

  @override
  String photometrySummary4(Object p0, Object p1, Object p2) {
    return 'Photometry Summary4 : $p0 · $p1 · $p2';
  }

  @override
  String get projectionAngleHint => 'Projection Angle Hint';

  @override
  String get projectionAngleLabel => 'Projection Angle Label';

  @override
  String get projectionAutoHelp => 'Projection Auto Help';

  @override
  String projectionConeAngle(Object p0) {
    return 'Projection Cone Angle : $p0';
  }

  @override
  String projectionConeDiameter(Object p0) {
    return 'Projection Cone Diameter : $p0';
  }

  @override
  String projectionConeDistance(Object p0) {
    return 'Projection Cone Distance : $p0';
  }

  @override
  String projectionDetailAngle(Object p0) {
    return 'Projection Detail Angle : $p0';
  }

  @override
  String projectionDetailDiameter(Object p0) {
    return 'Projection Detail Diameter : $p0';
  }

  @override
  String projectionDetailDistance(Object p0) {
    return 'Projection Detail Distance : $p0';
  }

  @override
  String get projectionDiameterHint => 'Projection Diameter Hint';

  @override
  String get projectionDiameterLabel => 'Projection Diameter Label';

  @override
  String get projectionDistanceHint => 'Projection Distance Hint';

  @override
  String get projectionDistanceLabel => 'Projection Distance Label';

  @override
  String get projectionHeaderAutoActive => 'Projection Header Auto Active';

  @override
  String get projectionHeaderNeedTwoValues =>
      'Projection Header Need Two Values';

  @override
  String get projectionInputsTitle => 'Projection Inputs Title';

  @override
  String get projectionResultsTitle => 'Projection Results Title';

  @override
  String get refBeamFieldContent => 'Ref Beam Field Content';

  @override
  String get refBeamFieldTitle => 'Ref Beam Field Title';

  @override
  String get refBeamLegendBeam => 'Ref Beam Legend Beam';

  @override
  String get refBeamLegendField => 'Ref Beam Legend Field';

  @override
  String get refCri80 => 'Ref Cri80';

  @override
  String get refCri90 => 'Ref Cri90';

  @override
  String get refCriContent => 'Ref Cri Content';

  @override
  String get refCriLow => 'Ref Cri Low';

  @override
  String get refCriTitle => 'Ref Cri Title';

  @override
  String get refKelvinContent => 'Ref Kelvin Content';

  @override
  String get refKelvinTitle => 'Ref Kelvin Title';

  @override
  String get refLightDisclaimerShort => 'Ref Light Disclaimer Short';

  @override
  String get refLuxColLux => 'Ref Lux Col Lux';

  @override
  String get refLuxColUse => 'Ref Lux Col Use';

  @override
  String get refLuxIntro => 'Ref Lux Intro';

  @override
  String get refLuxNote => 'Ref Lux Note';

  @override
  String get refLuxTitle => 'Ref Lux Title';

  @override
  String get refLuxUseBackstage => 'Ref Lux Use Backstage';

  @override
  String get refLuxUseCorridor => 'Ref Lux Use Corridor';

  @override
  String get refLuxUseExpo => 'Ref Lux Use Expo';

  @override
  String get refLuxUseMeeting => 'Ref Lux Use Meeting';

  @override
  String get refLuxUseStageGeneral => 'Ref Lux Use Stage General';

  @override
  String get refLuxUseStageTv => 'Ref Lux Use Stage Tv';

  @override
  String get riggingAngleHLeftInputLabel => 'Rigging Angle HLeft Input Label';

  @override
  String get riggingAngleHLeftLabel => 'Rigging Angle HLeft Label';

  @override
  String get riggingAngleHRightLabel => 'Rigging Angle HRight Label';

  @override
  String get riggingAngleVLeftLabel => 'Rigging Angle VLeft Label';

  @override
  String get riggingAngleVRightLabel => 'Rigging Angle VRight Label';

  @override
  String get riggingCalc1Title => 'Rigging Calc1 Title';

  @override
  String get riggingCalc2Subtitle => 'Rigging Calc2 Subtitle';

  @override
  String get riggingCalc2Title => 'Rigging Calc2 Title';

  @override
  String get riggingCalc3Subtitle => 'Rigging Calc3 Subtitle';

  @override
  String get riggingCalc3Title => 'Rigging Calc3 Title';

  @override
  String get riggingCalcCommonSubtitle => 'Rigging Calc Common Subtitle';

  @override
  String get riggingDisclaimerNoLoad => 'Rigging Disclaimer No Load';

  @override
  String get riggingDropLabel => 'Rigging Drop Label';

  @override
  String get riggingImpossibleGeometry => 'Rigging Impossible Geometry';

  @override
  String get riggingIncludedAngleLabel => 'Rigging Included Angle Label';

  @override
  String get riggingInputsTitle => 'Rigging Inputs Title';

  @override
  String get riggingInvalidOffset => 'Rigging Invalid Offset';

  @override
  String get riggingLegLeftInputLabel => 'Rigging Leg Left Input Label';

  @override
  String get riggingLegLeftLabel => 'Rigging Leg Left Label';

  @override
  String get riggingLegRightLabel => 'Rigging Leg Right Label';

  @override
  String get riggingNeedPositiveValues => 'Rigging Need Positive Values';

  @override
  String get riggingOffCenterToggle => 'Rigging Off Center Toggle';

  @override
  String get riggingOffsetLabel => 'Rigging Offset Label';

  @override
  String get riggingResultsTitle => 'Rigging Results Title';

  @override
  String get riggingSchemaTitle => 'Rigging Schema Title';

  @override
  String get riggingSpanLabel => 'Rigging Span Label';

  @override
  String get riggingTitle => 'Rigging Title';

  @override
  String get riggingUnitKg => 'Rigging Unit kg';

  @override
  String get riggingUnitMeters => 'Rigging Unit Meters';

  @override
  String get riggingWeightLabel => 'Rigging Weight Label';

  @override
  String get sunTimesIntro => 'Sun Times Intro';

  @override
  String get sunTimesLabelCity => 'Sun Times Label City';

  @override
  String get sunTimesLabelDate => 'Sun Times Label Date';

  @override
  String get sunTimesLuxAstro => 'Sun Times Lux Astro';

  @override
  String get sunTimesLuxCivil => 'Sun Times Lux Civil';

  @override
  String get sunTimesLuxDay => 'Sun Times Lux Day';

  @override
  String get sunTimesLuxFullDay => 'Sun Times Lux Full Day';

  @override
  String get sunTimesLuxLow => 'Sun Times Lux Low';

  @override
  String get sunTimesLuxNautical => 'Sun Times Lux Nautical';

  @override
  String get sunTimesLuxNight => 'Sun Times Lux Night';

  @override
  String get sunTimesLuxNote => 'Sun Times Lux Note';

  @override
  String get sunTimesLuxVeryLow => 'Sun Times Lux Very Low';

  @override
  String get sunTimesNoData => 'Sun Times No Data';

  @override
  String get sunTimesNoteApprox => 'Sun Times Note Approx';

  @override
  String get sunTimesResultAstronomicalDawn =>
      'Sun Times Result Astronomical Dawn';

  @override
  String get sunTimesResultAstronomicalDusk =>
      'Sun Times Result Astronomical Dusk';

  @override
  String get sunTimesResultCivilDawn => 'Sun Times Result Civil Dawn';

  @override
  String get sunTimesResultCivilDusk => 'Sun Times Result Civil Dusk';

  @override
  String get sunTimesResultNauticalDawn => 'Sun Times Result Nautical Dawn';

  @override
  String get sunTimesResultNauticalDusk => 'Sun Times Result Nautical Dusk';

  @override
  String get sunTimesResultSunrise => 'Sun Times Result Sunrise';

  @override
  String get sunTimesResultSunset => 'Sun Times Result Sunset';

  @override
  String get sunTimesSectionLux => 'Sun Times Section Lux';

  @override
  String get sunTimesSectionResults => 'Sun Times Section Results';

  @override
  String get sunTimesSectionSettings => 'Sun Times Section Settings';

  @override
  String get sunTimesSectionTimeline => 'Sun Times Section Timeline';

  @override
  String get sunTimesSectionTwilight => 'Sun Times Section Twilight';

  @override
  String get sunTimesTimelineAstronomical => 'Sun Times Timeline Astronomical';

  @override
  String get sunTimesTimelineCivil => 'Sun Times Timeline Civil';

  @override
  String get sunTimesTimelineDay => 'Sun Times Timeline Day';

  @override
  String get sunTimesTimelineNautical => 'Sun Times Timeline Nautical';

  @override
  String get sunTimesTimelineNight => 'Sun Times Timeline Night';

  @override
  String get sunTimesTimelineStep30 => 'Sun Times Timeline Step30';

  @override
  String get sunTimesTitle => 'Sun Times Title';

  @override
  String get sunTimesTwilightAstronomicalBody =>
      'Sun Times Twilight Astronomical Body';

  @override
  String get sunTimesTwilightAstronomicalTitle =>
      'Sun Times Twilight Astronomical Title';

  @override
  String get sunTimesTwilightCivilBody => 'Sun Times Twilight Civil Body';

  @override
  String get sunTimesTwilightCivilTitle => 'Sun Times Twilight Civil Title';

  @override
  String get sunTimesTwilightIntro => 'Sun Times Twilight Intro';

  @override
  String get sunTimesTwilightNauticalBody => 'Sun Times Twilight Nautical Body';

  @override
  String get sunTimesTwilightNauticalTitle =>
      'Sun Times Twilight Nautical Title';

  @override
  String get videoCamApertureHint => 'Video Cam Aperture Hint';

  @override
  String get videoCamApertureLabel => 'Video Cam Aperture Label';

  @override
  String videoCamApertureResult(Object p0) {
    return 'Video Cam Aperture Result : $p0';
  }

  @override
  String get videoCamEvEmpty => 'Video Cam EV Empty';

  @override
  String videoCamEvValue(Object p0) {
    return 'Video Cam EV Value : $p0';
  }

  @override
  String get videoCamInfoTitle => 'Video Cam Info Title';

  @override
  String get videoCamInputsTitle => 'Video Cam Inputs Title';

  @override
  String get videoCamIntro => 'Video Cam Intro';

  @override
  String get videoCamIsoHint => 'Video Cam Iso Hint';

  @override
  String get videoCamIsoLabel => 'Video Cam Iso Label';

  @override
  String get videoCamLuxHint => 'Video Cam Lux Hint';

  @override
  String get videoCamLuxLabel => 'Video Cam Lux Label';

  @override
  String get videoCamNote => 'Video Cam Note';

  @override
  String get videoCamPageTitle => 'Video Cam Page Title';

  @override
  String get videoCamShutterHint => 'Video Cam Shutter Hint';

  @override
  String get videoCamShutterLabel => 'Video Cam Shutter Label';

  @override
  String videoCamShutterResult(Object p0) {
    return 'Video Cam Shutter Result : $p0';
  }

  @override
  String get videoCameraExposureSubtitle => 'Video Camera Exposure Subtitle';

  @override
  String get videoCameraExposureTitle => 'Video Camera Exposure Title';

  @override
  String get videoLedResultPitch => 'Video LED Result Pitch';

  @override
  String get videoLedResultTile => 'Video LED Result Tile';

  @override
  String get videoLedResultWallResolution => 'Video LED Result Wall Resolution';

  @override
  String get videoLedResultWallSize => 'Video LED Result Wall Size';

  @override
  String get aboutUniverseToArtnetColDmx => 'DMX (universum)';

  @override
  String get aboutUniverseToArtnetColSubnet => 'Subnet';

  @override
  String get aboutUniverseToArtnetColUniverse => 'Universum';

  @override
  String get aboutUniverseToArtnetColUniHex => 'Uni (hex)';

  @override
  String get aboutUniverseToArtnetTitle => 'DMX-universum → Art-Net';

  @override
  String get aboutUniverseToArtnetTableTitle => 'Conversietabel';

  @override
  String get aboutUniverseToArtnetTableIntro =>
      'Praktische mapping tussen het DMX-(sACN)-universum en de Art-Net-velden (Subnet/Universe).';

  @override
  String get aboutUniverseTablesDisclaimer =>
      'Opmerking: sommige consoles, nodes of software nummeren vanaf 0 of 1 afhankelijk van de context. Controleer altijd de documentatie.';

  @override
  String get homeContactEmailSubject => 'Mon App Tech – Contact';

  @override
  String get homeErrorOpenEmail => 'E-mailapp kan niet worden geopend.';

  @override
  String get homeErrorOpenForm => 'Formulier kan niet worden geopend.';
}
