// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get aboutArtNetSubtitle =>
      'Universe DMX op Ethernet/UDP, knooppunten, uitzending versus unicast.\nWerkelijke limieten, netwerkstabiliteit, RDM afhankelijk van hardware.';

  @override
  String get aboutArtNetTitle =>
      'Art-Net — DMX via IP (knooppunten, unicast/broadcast)';

  @override
  String get aboutCablingFiberSubtitle =>
      'Cat5e → Cat8, OM3/OM4/OS2-vezel, LC/SC/MPO, typische afstanden, best practices worden getoond.';

  @override
  String get aboutCablingFiberTitle =>
      'Netwerk — RJ45 / Glasvezel / snelheden en lengtes';

  @override
  String get aboutComputingSubtitle =>
      'Nuttige snelheden, versies, echte limieten, marketingvalkuilen.';

  @override
  String get aboutComputingTitle => 'Computers — USB/HDMI/DP/SATA/NVMe...';

  @override
  String get aboutDmxSubtitle =>
      'Universe, adressen, frames, RS-485-bekabeling, afsluiting, veldfouten.\nInclusief diagrammen + checklist.';

  @override
  String get aboutDmxTitle => 'DMX';

  @override
  String get aboutElectricitySubtitle =>
      'Connectoren, mono/tri, snelle kW-tafels (16A → 400 A), veldvallen.';

  @override
  String get aboutElectricityTitle =>
      'Elektrisch — Schuko / P17 / bevoegdheden';

  @override
  String get aboutIpBasicsSubtitle =>
      'Begrijp IP, masker, gateway, DHCP versus statisch.\nConcrete voorbeelden (2.x, 10.x, 192.168.x) + checklist.';

  @override
  String get aboutIpBasicsTitle => 'IP-basisprincipes';

  @override
  String get aboutLightNetworkSubtitle =>
      'Eenvoudige en robuuste architectuur voor Art-Net/sACN.\nVLAN, IGMP snooping/querier, Wi-Fi (jitter), switches, diagrammen + checklist.';

  @override
  String get aboutLightNetworkTitle =>
      'Licht netwerk – VLAN, IGMP, Wi-Fi versus bekabeld';

  @override
  String get aboutSacnSubtitle =>
      'Standaard DMX op IP-georiënteerd \"pro\"-netwerk.\nMulticast/unicast, IGMP-snooping/querier, prioriteiten met meerdere bronnen.';

  @override
  String get aboutSacnTitle => 'sACN';

  @override
  String get aboutVideoSubtitle =>
      'Kies op basis van latentie, betrouwbaarheid, bekabeling, LAN versus WAN-netwerk.\nTabellen + diagram.';

  @override
  String get aboutVideoTitle => 'Video';

  @override
  String get appTitle => 'Mijn Tech-app';

  @override
  String catalogDmxModeItem(Object channels, Object name) {
    return '$name — $channels kanalen';
  }

  @override
  String catalogDmxModeTitle(Object count) {
    return 'Modus DMX ($count)';
  }

  @override
  String get catalogInfoDmxChannels => 'Kanalen DMX';

  @override
  String get catalogInfoLuminousFlux => 'Lichtstroom';

  @override
  String get catalogInfoPower => 'Stroom';

  @override
  String get catalogInfoWeight => 'Gewicht';

  @override
  String catalogLastUpdate(Object date) {
    return 'Laatste update: $date';
  }

  @override
  String catalogManufacturerTitle(Object count) {
    return 'Fabrikant ($count)';
  }

  @override
  String catalogModelTitle(Object count) {
    return 'Model ($count)';
  }

  @override
  String get catalogNotProvided => 'Niet gespecificeerd';

  @override
  String get catalogOpenDmxChart => 'Open tafel DMX';

  @override
  String get catalogOpenManual => 'Open de handleiding';

  @override
  String get catalogResetTooltip => 'Opnieuw instellen';

  @override
  String catalogSyncError(Object message) {
    return 'Fout: $message';
  }

  @override
  String catalogSyncFailed(Object reason) {
    return 'Synchronisatiefout: $reason';
  }

  @override
  String get catalogSyncFailedUnknown =>
      'Synchronisatiefout (onbekende reden).';

  @override
  String catalogTypeTitle(Object count) {
    return 'Type ($count)';
  }

  @override
  String get catalogUpdateTooltip => 'Om te updaten';

  @override
  String get catalogUpdated => 'Bijgewerkte catalogus.';

  @override
  String get commonCalculate => 'Berekenen';

  @override
  String get commonCancel => 'Annuleren';

  @override
  String get commonCopyResultTooltip => 'Kopieer resultaat';

  @override
  String get commonDash => '—';

  @override
  String get commonNone => 'Geen opname';

  @override
  String get commonOk => 'Oké';

  @override
  String get commonOkWithCheck => 'Oké ✅';

  @override
  String get commonRename => 'Hernoemen';

  @override
  String get commonReset => 'Opnieuw instellen';

  @override
  String get commonSave => 'Redden';

  @override
  String get commonSearch => 'Om te onderzoeken';

  @override
  String get commonTooLowWithCross => 'Te zwak ❌';

  @override
  String get commonUnitMeter => 'M';

  @override
  String get consentsReset => 'Toestemmingen gereset.';

  @override
  String get dipSwitchAddressHint => 'Bijvoorbeeld: 1 tot 512';

  @override
  String get dipSwitchAddressLabel => 'Adres DMX';

  @override
  String get dipSwitchChannelUnit => 'kanaal';

  @override
  String get dipSwitchEndOfUniverseWarning =>
      'Waarschuwing: einde van universum DMX bereikt.';

  @override
  String get dipSwitchInputsTitle => 'Voorgerechten';

  @override
  String get dipSwitchIntervalHint => 'Bijv.: 4 (kanalen)';

  @override
  String get dipSwitchIntervalLabel => 'Interval';

  @override
  String get dipSwitchModeAddressDirect => 'Direct adres';

  @override
  String get dipSwitchModeAddressMinusOne => 'Adres - 1';

  @override
  String get dipSwitchNextAddressButton => 'Volgende adres';

  @override
  String get dipSwitchOffLabel => 'UIT';

  @override
  String get dipSwitchOnLabel => 'OP';

  @override
  String get dipSwitchResetTooltip => 'Opnieuw instellen';

  @override
  String dipSwitchResultAddressLine(Object address) {
    return 'Adres: $address';
  }

  @override
  String get dipSwitchResultAddressNotProvided => 'Adres niet opgegeven';

  @override
  String dipSwitchResultBinaryValueLine(Object binary) {
    return 'Binair: $binary';
  }

  @override
  String get dipSwitchResultHeader => 'Resultaat';

  @override
  String dipSwitchResultIntervalLine(Object end, Object start) {
    return 'Interval: $start → $end';
  }

  @override
  String dipSwitchResultModeLine(Object mode) {
    return 'Modus: $mode';
  }

  @override
  String get dipSwitchScrollHint => 'Scroll om alle schakelaars te zien.';

  @override
  String get dipSwitchSectionTitle => 'Schakelaars';

  @override
  String get dipSwitchSummaryTitle => 'Samenvatting';

  @override
  String dipSwitchSwitchLabel(Object index) {
    return 'Schakel $index';
  }

  @override
  String get dipSwitchUseAddressMinusOneLabel => 'Gebruik adresmodus - 1';

  @override
  String get disclaimerAccept => 'Ik accepteer';

  @override
  String get disclaimerCertify =>
      'Ik verklaar dat ik deze voorwaarden heb gelezen en geaccepteerd.';

  @override
  String get disclaimerText =>
      'ALLEEN GEBRUIK VOOR INDICATIEVE DOELEINDEN\n\nDe berekeningen van deze applicatie (video, licht, laser) worden uitsluitend ter informatie en indicatief gegeven.\nZe vervangen op geen enkele manier:\n- gecertificeerde berekeningen,\n- technische studies,\n- de officiële normen die van kracht zijn,\n- noch validatie door een gekwalificeerde professional.\n\nVERANTWOORDELIJKHEID\nDe uitgever van deze applicatie kan niet aansprakelijk worden gesteld voor rekenfouten, weglatingen, materiële schade,\npersoonlijke ongelukken of enig incident dat zich voordoet tijdens de installatie, bediening of gebruik van de apparatuur.\n\nVIDEO & SCREENING\nDe resultaten (groottes, verhoudingen, helderheid, overlappingen, enz.) zijn gebaseerd op theoretische modellen en kunnen variëren afhankelijk van:\noptica, zoom, uniformiteit, lichtomgeving, ondersteuning, instellingen, etc.\nRaadpleeg altijd de officiële documentatie van de fabrikant.\n\nLICHT\nDe berekeningen zijn indicatief en houden geen rekening met alle reële omstandigheden (toleranties, optische verliezen,\ndegradatie van bronnen, lokale normen, omgevingsomstandigheden, enz.).\n\nLASER – VEILIGHEID\nDe NOHD-, SZED- en CZED-berekeningen zijn gebaseerd op standaardaannames en theoretische drempels.\nZe houden in het bijzonder geen rekening met:\n- optische instrumenten (verrekijkers, camera\'s, telescopen, enz.),\n- atmosferische omstandigheden (mist, regen, stof, enz.),\n- onvoorziene reflecties, omgeleid gebruik, specifieke instellingen.\nHet gebruik van een lasersysteem impliceert directe verantwoordelijkheid van de operator en een passende risicoanalyse.\n\nAANVAARDING VAN RISICO’S\nDoor deze applicatie te gebruiken, erkent de gebruiker:\n- de geldende veiligheidsregels gelezen hebben,\n- als enige verantwoordelijk zijn voor zijn installaties,\n- de volledige verantwoordelijkheid aanvaarden voor de risico\'s verbonden aan het gebruik van apparatuur (video, licht, laser),\n- controleer systematisch de gegevens met de officiële handleidingen van de fabrikant.';

  @override
  String get disclaimerTitle => '⚠️ JURIDISCHE WAARSCHUWING & DISCLAIMER';

  @override
  String get homeLaserSubtitle =>
      'Laserberekeningen en beveiliging (toestemming vereist bij elke invoer).';

  @override
  String get homeLaserTitle => 'Laser';

  @override
  String get homeLightSubtitle =>
      'Projectiegrootte, dip-switch DMX, fotometrie, catalogus, patch DMX.';

  @override
  String get homeLightTitle => 'Licht';

  @override
  String get homeReferencesSubtitle =>
      'DMX / netwerk / video: factsheets en veldreferenties.';

  @override
  String get homeReferencesTitle => 'Referenties';

  @override
  String get homeTitle => 'Welkom';

  @override
  String get homeVideoSubtitle =>
      'Lens & meting, helderheid, multi-projector, LED en testpatronen.';

  @override
  String get homeVideoTitle => 'Video';

  @override
  String get language => 'Taal';

  @override
  String get languageSystem => 'Systeem (automatisch)';

  @override
  String get languageSystemCurrent => 'Telefoon taal';

  @override
  String get laserAdviceFullPower => 'Vol vermogen toegestaan ​​(100%)';

  @override
  String laserAdviceMaxRecommended(Object percent) {
    return 'Aanbevolen maximaal vermogen: $percent';
  }

  @override
  String get laserConsentCheckboxLabel =>
      'Ik accepteer en begrijp de risico\'s.';

  @override
  String get laserConsentContinue => 'Doorgaan';

  @override
  String get laserConsentText =>
      'TOEGANG TOT HET LASERDEEL\n\nHet LASER-gedeelte van deze applicatie betreft beveiligingsberekeningen (bijvoorbeeld: NOHD, SZED, CZED).\nDeze berekeningen zijn indicatief en vervangen niet:\n- een risicoanalyse,\n- de geldende normen,\n- operationele procedures,\n- noch validatie door een gekwalificeerd persoon.\n\nBELANGRIJK\n- Risico op oog-/huidbeschadiging bij misbruik.\n- De berekening kan onjuist zijn als de ingevoerde parameters onvolledig of onjuist zijn of als de werkelijke context afwijkt (optisch,\n  atmosferische omstandigheden, reflecties, uitlijning, enz.).\n- De exploitant is als enige verantwoordelijk voor installatie, bediening en naleving.\n\nDoor te valideren bevestigt u:\n- de risico\'s begrijpen,\n- voldoen aan de toepasselijke veiligheidsregels,\n- aanvaardt de volledige verantwoordelijkheid in geval van nalatigheid of misbruik.';

  @override
  String get laserConsentTitle => '🔴 LASERTOESTEMMING (VERPLICHT)';

  @override
  String get laserDiameterHint => 'bijvoorbeeld: 3.0';

  @override
  String get laserDiameterLabel => 'Uitlaatdiameter (mm)';

  @override
  String get laserDisclaimerShort =>
      'Indicatieve berekening. Geen vervanging voor een laserveiligheidsanalyse.';

  @override
  String get laserDivergenceHint => 'bijvoorbeeld: 1.2';

  @override
  String get laserDivergenceLabel => 'Divergentie (mrad)';

  @override
  String get laserInputsTitle => 'Voorgerechten';

  @override
  String get laserInvalidInputs =>
      'Voer een geldige macht, divergentie en diameter in.';

  @override
  String get laserNameUpdated => 'Naam bijgewerkt.';

  @override
  String get laserNormativeParamsBody =>
      'MPE voor nominale ooggevaarafstand (NOHD): 25,4 W/m²\n(IEC 60825-1 standaard, editie 3.0)\n\nMPE voor blootstellingsafstand in gevoelige zones (SZED): 1 W/m²\n(ANSI Z136.6-standaard)\n\nMPE voor blootstellingsafstand in kritische zones (CZED): 0,05 W/m²\n(ANSI Z136.6-standaard)';

  @override
  String get laserNormativeParamsTitle => 'Beveiligingsinstellingen behouden';

  @override
  String get laserPowerHint => 'bijv: 5000';

  @override
  String get laserPowerLabel => 'Vermogen (mW)';

  @override
  String get laserPresetAdded => 'Opname toegevoegd.';

  @override
  String get laserPresetDeleted => 'Opname verwijderd.';

  @override
  String laserPresetSubtitle(Object diam, Object div, Object p) {
    return 'P: $p mW • Div: $div mrad • Ø: $diam mm';
  }

  @override
  String get laserProjectorNameLabel => 'Projectornaam';

  @override
  String get laserRenameProjectorTitle => 'Hernoem de projector';

  @override
  String get laserSafetyResultsTitle => 'Veiligheidsresultaten';

  @override
  String get laserSaveCurrentProjector => 'Registreer deze projector';

  @override
  String get laserSaveProjectorTitle => 'Registreer een projector';

  @override
  String get laserSavedProjectorsTitle => 'Geregistreerde projectoren';

  @override
  String get laserSearchHint => 'bijv. “RGB 5W”';

  @override
  String get laserTargetDistanceHint => 'bijvoorbeeld: 10';

  @override
  String get laserTargetDistanceLabel => 'Doelafstand (m)';

  @override
  String get laserZoneCzedDesc => 'Kritieke zone';

  @override
  String get laserZoneNohdDesc => 'Gevaar voor de ogen';

  @override
  String get laserZoneSzedDesc => 'Gevoelig gebied';

  @override
  String get legalNotices => 'Juridische mededelingen';

  @override
  String get lightCatalogDescription =>
      'Selectie op fabrikant, type en product, met informatie en handleiding.';

  @override
  String get lightCatalogTitle => 'Lichtcatalogus';

  @override
  String get lightDisclaimerShort =>
      'Indicatieve hulpmiddelen. Controleer altijd de documentatie van de fabrikant.';

  @override
  String get lightDmxSwitchDescription =>
      'Indicatieve conversie tussen adres DMX en schakelaars, met intervalnavigatie.';

  @override
  String get lightDmxSwitchTitle => 'Dip-schakelaar DMX';

  @override
  String get lightPatchDescription => 'Importeer en bekijk een MVR bestand.';

  @override
  String get lightPatchTitle => 'Patch DMX';

  @override
  String get lightPhotometryDescription =>
      'Indicatieve conversies tussen lux, candela en lumen, met afstand en hoek.';

  @override
  String get lightPhotometryTitle => 'Fotometrie';

  @override
  String get lightExposureMeterTitle => 'Belichtingsmeter (lux)';

  @override
  String get lightExposureMeterDescription =>
      'Berekent de verlichtingssterkte in lux op basis van de ISO-/diafragma-/sluitertijdinstellingen van een camera.';

  @override
  String get lightExposureMeterIsoLabel => 'ISO-gevoeligheid';

  @override
  String get lightExposureMeterApertureLabel => 'Diafragma';

  @override
  String get lightExposureMeterShutterLabel => 'Sluitertijd';

  @override
  String get lightExposureMeterShutterDenomLabel =>
      'Sluitertijd (noemer, 1/x s)';

  @override
  String get lightExposureMeterResultTitle => 'Geschatte verlichtingssterkte';

  @override
  String get lightExposureMeterReferenceTitle =>
      'Referentie verlichtingssterkte';

  @override
  String get lightExposureMeterRefMoonlight => 'Maanlicht';

  @override
  String get lightExposureMeterRefDimStage => 'Zwak verlicht podium';

  @override
  String get lightExposureMeterRefOffice => 'Kantoor';

  @override
  String get lightExposureMeterRefOvercast => 'Bewolkte dag (buiten)';

  @override
  String get lightExposureMeterRefFollowSpot =>
      'Volgspot / profielschijnwerper op het podium';

  @override
  String get lightExposureMeterRefSunlight => 'Fel zonlicht';

  @override
  String get lightExposureMeterFormulaNote =>
      'Lux = (N² × 250 × 1/t) / ISO — methode van de invallend-lichtmeter. Lees de waarden af van de camera (handmatige modus of EXIF-info).';

  @override
  String get lightProjectionDescription =>
      'Indicatieve berekening van de spotgrootte op basis van hoek, afstand en diameter.';

  @override
  String get lightProjectionTitle => 'Projectiegrootte';

  @override
  String get menuTitle => 'Menu';

  @override
  String get homeGreetingMorning => 'Goedemorgen';

  @override
  String get homeGreetingAfternoon => 'Goedemiddag';

  @override
  String get homeGreetingEvening => 'Goedenavond';

  @override
  String get homeGreetingTagline => 'Al je regie-tools, klaar voor gebruik.';

  @override
  String get mireBlendLabel => 'MENGEN';

  @override
  String get mireDash => '—';

  @override
  String get mireErrInvalidOverlap => '❌ Ongeldige overlap (0 tot 99,9).';

  @override
  String get mireErrInvalidProjectors =>
      '❌ Ongeldig aantal projectoren (N > 0).';

  @override
  String get mireErrInvalidWHpx => '❌ Ongeldige breedte/hoogte (px).';

  @override
  String get mireExportPng => 'Exporteer PNG';

  @override
  String get mireHeightPxHint => 'bijvoorbeeld: 1080';

  @override
  String get mireHeightPxHintMapping => 'bijvoorbeeld: 2160';

  @override
  String get mireHeightPxLabel => 'Hoogte (px)';

  @override
  String get mireLedErrTileCm => '❌ Geeft tegelcm aan (breedte/hoogte >0).';

  @override
  String get mireLedErrTilePx => '❌ Geeft tegel-px aan (breedte/hoogte >0).';

  @override
  String get mireLedErrTilesXY => '❌ Geeft tegels X/Y aan (>0).';

  @override
  String get mireLedParamsTitle => 'LED-wandparameters';

  @override
  String mireLedPitchComputed(Object pitch) {
    return 'Berekende toonhoogte: $pitch';
  }

  @override
  String get mireLedSubtitleColorBars => 'Bars + hellingen + cirkels';

  @override
  String get mireLedSubtitleGridLabels => 'Raster + markeringen + cirkels';

  @override
  String get mireLedSubtitlePixelPerfect => 'Pixel perfect + cirkels';

  @override
  String get mireLedSubtitleUniformity => 'Uniformiteit + cirkels';

  @override
  String get mireLedTileHcmLabel => 'Tegelhoogte (cm)';

  @override
  String get mireLedTileHpxLabel => 'Tegelhoogte (px)';

  @override
  String get mireLedTileWcmLabel => 'Tegelbreedte (cm)';

  @override
  String get mireLedTileWpxLabel => 'Tegelbreedte (px)';

  @override
  String get mireLedTilesIdTitle => 'LED / ID TEGELS';

  @override
  String get mireLedTilesXLabel => 'Horizontale tegels (X)';

  @override
  String get mireLedTilesYLabel => 'Verticale tegels (Y)';

  @override
  String get mireLedTitle => 'LED / MARK';

  @override
  String get mireLedTypeColorBars => 'Bars + hellingen + cirkels';

  @override
  String get mireLedTypeGridLabels => 'Raster + markeringen + cirkels';

  @override
  String get mireLedTypePixelPerfect => 'Pixel perfect + cirkels';

  @override
  String get mireLedTypeTilesId => 'Tegels-ID (nummer + kleuren)';

  @override
  String get mireLedTypeUniformity => 'Uniformiteit + cirkels';

  @override
  String mireLedWallResolution(Object h, Object w) {
    return 'Muurresolutie: $w × $h px';
  }

  @override
  String get mireLedWarnPitchOutOfRange =>
      '⚠️ Steek berekend buiten bereik (0,5–20 mm). Controleert Tegel cm/px.';

  @override
  String get mireLedWarnPitchXNotY =>
      '⚠️ Veld X ≠ Veld Y (niet-homogene tegel). Controleer de afmetingen cm en px.';

  @override
  String get mireMappingSectionTitle => 'Mappingdoel met meerdere projectoren';

  @override
  String mireMappingSubtitlePattern(Object n, Object orient, Object percent) {
    return 'N=$n • Overlapping $percent% • $orient';
  }

  @override
  String get mireMappingTypeBlendRamps => 'Meng hellingen';

  @override
  String get mireMappingTypeCombo => 'Combo (zones + overlap + overvloeiing)';

  @override
  String get mireMappingTypeLabel => 'Type toewijzing';

  @override
  String get mireMappingTypeZonesOverlap => 'Zones + overlap';

  @override
  String get mireOrientationHorizontal => 'Horizontaal';

  @override
  String get mireOrientationLabel => 'Oriëntatie';

  @override
  String get mireOrientationVertical => 'Verticaal';

  @override
  String get mireOverlapHint => 'bijvoorbeeld: 10.0';

  @override
  String get mireOverlapLabel => 'Overlapping (%)';

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
    return 'PROJO $index';
  }

  @override
  String get mireProjectorsNHint => 'bijv: 2';

  @override
  String get mireProjectorsNLabel => 'Aantal projectoren (N)';

  @override
  String get mireSimpleSectionTitle => 'Eenvoudige schermtest';

  @override
  String get mireSimpleSubtitleCheckerboard => 'Dambord + cirkels';

  @override
  String get mireSimpleSubtitleColorBars => 'Bars + hellingen + cirkels';

  @override
  String get mireSimpleSubtitleComboAll =>
      'Raster + kluis + 2 gecentreerde staven + cirkels';

  @override
  String get mireSimpleSubtitleGridSafe => 'Raster + kluis + cirkels';

  @override
  String get mireSimpleSubtitleUniformity => 'Uniformiteit + cirkels';

  @override
  String get mireSimpleTypeCheckerboard => 'Dambord + cirkels';

  @override
  String get mireSimpleTypeColorBars => 'Bars + hellingen + cirkels';

  @override
  String get mireSimpleTypeComboAll =>
      'Combo (raster + cirkels + 2 gecentreerde staven)';

  @override
  String get mireSimpleTypeGridSafe => 'Raster + kluis + cirkels';

  @override
  String get mireSimpleTypeUniformity => 'Uniformiteit + cirkels';

  @override
  String get mireTileMissingPx => 'Specificeert Tegel (px) voor nummering.';

  @override
  String mireTilesSubtitleBase(Object nx, Object ny, Object th, Object tw) {
    return 'Tegel ${tw}x$th px • Raster $nx x $ny';
  }

  @override
  String mireTilesSubtitlePitchEq(Object pitch) {
    return 'Steek ~ $pitch mm';
  }

  @override
  String mireTilesSubtitlePitchXY(Object px, Object py) {
    return 'Steek X $px • Y $py mm';
  }

  @override
  String mireTilesSubtitleTilePhys(Object hcm, Object wcm) {
    return 'Tegel $wcm×$hcm cm';
  }

  @override
  String mireTilesSubtitleWallPhys(Object hm, Object wm) {
    return 'Muur ~ $wm×$hm m';
  }

  @override
  String get mireTypeLabel => 'Soort zicht';

  @override
  String get mireVideoComboTitle => 'VIDEO / COMBO-MERK';

  @override
  String get mireVideoMappingSectionTitle =>
      'Mappingdoel met meerdere projectoren';

  @override
  String get mireVideoMappingTitle => 'VIDEO / DOEL IN KAART MAKEN';

  @override
  String get mireVideoSimpleSectionTitle => 'Eenvoudige schermtest';

  @override
  String get mireVideoSimpleTitle => 'VIDEO / EENVOUDIG SCHERM';

  @override
  String get mireVideoTypeCheckerboard => 'Dambord + cirkels';

  @override
  String get mireVideoTypeColorBars => 'Bars + hellingen + cirkels';

  @override
  String get mireVideoTypeCombo =>
      'Combo (raster + cirkels + 2 gecentreerde staven)';

  @override
  String get mireVideoTypeGridSafe => 'Raster + kluis + cirkels';

  @override
  String get mireVideoTypeUniformity => 'Uniformiteit + cirkels';

  @override
  String get mireWallNotMultipleOfTiles => 'NIET-MEERVOUDIGE BETEGELDE MUUR';

  @override
  String get mireWidthPxHint => 'bijv.: 1920';

  @override
  String get mireWidthPxHintMapping => 'bijv.: 3840';

  @override
  String get mireWidthPxLabel => 'Breedte (px)';

  @override
  String patchAddressLabel(Object address) {
    return 'Adres: $address';
  }

  @override
  String patchChannelsUsed(Object count) {
    return 'Gebruikte kanalen: $count / 512';
  }

  @override
  String get patchConflictError => 'Conflicten aanpakken (overlapping).';

  @override
  String get patchConflictShort => 'Conflict';

  @override
  String patchConflicts(Object count) {
    return 'Conflicten: $count';
  }

  @override
  String get patchEditChannelsLabel => 'Kanalen';

  @override
  String get patchEditHint => 'Controleert de modus en het aantal kanalen.';

  @override
  String get patchEditModeLabel => 'Mode';

  @override
  String get patchEditTitle => 'Editie';

  @override
  String get patchEmptyUniverse => 'Geen machines in dit universum.';

  @override
  String patchFixturesCount(Object count) {
    return 'Machines: $count';
  }

  @override
  String get patchHomeDisclaimer =>
      'De resultaten zijn indicatief. Controleer dit altijd bij de console.';

  @override
  String get patchHomeImportMvrDescription =>
      'Parseer een MVR bestand en laad de patch als referentie.';

  @override
  String get patchHomeImportMvrTitle => 'Importeer een MVR';

  @override
  String get patchHomeTitle => 'Patch DMX';

  @override
  String get patchHomeViewPatchDescription =>
      'Lijst en conflicten per universum.';

  @override
  String get patchHomeViewPatchTitle => 'Bekijk pleister';

  @override
  String get patchHubOpenGridButton => 'Open rooster';

  @override
  String get patchHubOpenMvrButton => 'Open MVR';

  @override
  String get patchHubStateEmpty => 'Geen referenties geladen.';

  @override
  String patchHubStateLoaded(Object count) {
    return 'Geladen: $count universum';
  }

  @override
  String get patchHubStateTitle => 'Staat';

  @override
  String get patchHubTitle => 'Hub-patch';

  @override
  String get patchHubWorksiteBody =>
      'Importeer een MVR of raadpleeg het bezettingsoverzicht.';

  @override
  String get patchHubWorksiteTitle => 'Bouwplaats';

  @override
  String get patchInvalidChannelCount => 'Ongeldig aantal kanalen.';

  @override
  String get patchIssueInvalidChannelCount =>
      'Het aantal kanalen moet groter dan of gelijk zijn aan 1.';

  @override
  String get patchIssueInvalidStartAddress =>
      'Het DMX adres moet tussen 1 en 512 liggen.';

  @override
  String get patchIssueInvalidUniverse =>
      'Het universum moet groter dan of gelijk zijn aan 1.';

  @override
  String get patchIssueRangeExceedsUniverse =>
      'Het kanaalbereik overschrijdt 512 in dit universum.';

  @override
  String get patchIssueUnknown => 'Onbekende fout.';

  @override
  String get patchListTitle => 'Lijst';

  @override
  String get patchManualDisabledBody =>
      'De patch is alleen-lezen als een MVR referentie is geladen.';

  @override
  String get patchManualDisabledTitle => 'Gehandicapt';

  @override
  String get patchManualTitle => 'Handmatig patchen';

  @override
  String patchModeLabel(Object mode) {
    return 'Modus: $mode';
  }

  @override
  String get patchMvrButtonAnalyzing => 'Analyse…';

  @override
  String get patchMvrButtonLoadAsReference => 'Laden als referentie';

  @override
  String get patchMvrButtonPickFile => 'Kies een bestand';

  @override
  String get patchMvrClearTooltip => 'Om te wissen';

  @override
  String get patchMvrColAddress => 'Adres';

  @override
  String get patchMvrColChannels => 'Kanalen';

  @override
  String get patchMvrColId => 'Identiteitskaart';

  @override
  String get patchMvrColName => 'Naam';

  @override
  String get patchMvrColUniverse => 'Universum';

  @override
  String get patchMvrColumnsHint =>
      'Kolommen: ID, Naam, Universe, Adres, Kanalen';

  @override
  String get patchMvrFileCardHelp =>
      'Selecteert een .mvr-bestand (ZIP) om de patch te analyseren.';

  @override
  String get patchMvrFileCardTitle => 'Bestand';

  @override
  String get patchMvrFilterAllUniverses => 'Alle universums';

  @override
  String get patchMvrFilterUniverseLabel => 'Filter op universum';

  @override
  String get patchMvrModeNotProvided => 'Modus niet gespecificeerd';

  @override
  String get patchMvrOrderAsc => 'Croissant';

  @override
  String get patchMvrOrderDesc => 'Aflopend';

  @override
  String get patchMvrOrderLabel => 'Volgorde';

  @override
  String get patchMvrSortAddress => 'Adres';

  @override
  String get patchMvrSortByLabel => 'sorteren op';

  @override
  String get patchMvrSortChannels => 'Kanalen';

  @override
  String get patchMvrSortId => 'Identiteitskaart';

  @override
  String get patchMvrSortName => 'Naam';

  @override
  String get patchMvrSortUniverse => 'Universum';

  @override
  String get patchMvrSortUniverseThenAddress => 'Universum adresseert dan';

  @override
  String get patchMvrStatusCleared => 'Referentie verwijderd.';

  @override
  String get patchMvrStatusEmptyBytes => 'Leeg bestand.';

  @override
  String get patchMvrStatusExtractingZip => 'De ZIP uitpakken...';

  @override
  String patchMvrStatusFilePickFailed(Object reason) {
    return 'Kan bestand niet selecteren: $reason';
  }

  @override
  String patchMvrStatusFixturesFound(int count, int resolved) {
    return 'Gevonden machines: $count (meerkanaals: $resolved).';
  }

  @override
  String get patchMvrStatusLoadingGdtf => 'GDTF laden…';

  @override
  String get patchMvrStatusNoContentToLoad => 'Geen inhoud om te laden.';

  @override
  String get patchMvrStatusNoFileSelected => 'Geen bestanden geselecteerd.';

  @override
  String get patchMvrStatusNoUsableFixtures =>
      'Geen exploiteerbare machines gevonden.';

  @override
  String patchMvrStatusParseError(Object message) {
    return 'Parseerfout: $message';
  }

  @override
  String get patchMvrStatusParsingContent => 'Inhoudsanalyse…';

  @override
  String patchMvrStatusReferenceLoaded(int count, int skipped, int footprints) {
    return 'Referentie geladen: $count machine(s) (genegeerd: $skipped, vingerafdrukken GDTF: $footprints).';
  }

  @override
  String patchMvrStatusRestored(Object count) {
    return 'Catering: $count machines';
  }

  @override
  String get patchMvrStatusSceneXmlNotFound =>
      'scene.xml niet gevonden in MVR.';

  @override
  String get patchMvrStatusSelectingFile => 'Het bestand selecteren…';

  @override
  String patchMvrStatusUnsupportedFile(Object ext) {
    return 'Niet-ondersteund bestand: $ext';
  }

  @override
  String get patchMvrSummaryTitle => 'Samenvatting';

  @override
  String get patchMvrTitle => 'Importeren MVR';

  @override
  String patchMvrUniverseItem(Object universe) {
    return 'Universum $universe';
  }

  @override
  String get patchPageTitle => 'Lapje';

  @override
  String get patchSummaryTitle => 'Samenvatting';

  @override
  String get patchUniverseAppBarTitle => 'Lapje';

  @override
  String patchUniverseConflictCount(Object count) {
    return 'Conflicten: $count kanaal(s)';
  }

  @override
  String get patchUniverseGridLimitedByWidth => 'Beperkt door schermbreedte.';

  @override
  String get patchUniverseGridTitle => 'Bezetting (1 tot 512)';

  @override
  String patchUniverseItem(Object universe) {
    return 'Universum $universe';
  }

  @override
  String get patchUniverseLabel => 'Universum';

  @override
  String get patchUniverseLegendConflict => 'Conflict';

  @override
  String get patchUniverseLegendFree => 'Vrij';

  @override
  String get patchUniverseLegendOccupied => 'Druk bezig';

  @override
  String patchUniverseOccupantLine(
      Object channels, Object end, Object fixture, Object mode, Object start) {
    return '• $fixture\n  $mode — $channels kanaal(s)\n  $start → $end';
  }

  @override
  String patchUniverseOccupiedCount(Object count) {
    return 'Bezet: $count / 512';
  }

  @override
  String patchUniversePopupHeader(
      Object address, Object state, Object universe) {
    return 'Universe $universe — Adres $address\nStatus: $state';
  }

  @override
  String get patchUniversePopupManyOccupants =>
      'Verschillende machines bezetten dit kanaal.';

  @override
  String patchUniversePopupMore(Object count) {
    return '…en $count andere(n).';
  }

  @override
  String get patchUniversePopupTitleConflict => 'Conflict';

  @override
  String get patchUniversePopupTitleFree => 'Gratis kanaal';

  @override
  String get patchUniversePopupTitleOccupied => 'Kanaal bezet';

  @override
  String get patchUniverseReferenceNone => 'Geen referentie geladen';

  @override
  String get patchUniverseReferenceReadOnly => 'Alleen-lezen (sinds MVR)';

  @override
  String get patchUniverseReferenceTitle => 'Referentie';

  @override
  String get patchUniverseResetConfirm => 'Opnieuw instellen';

  @override
  String get patchUniverseResetContent =>
      'Hierdoor wordt de patch gewist die is geladen vanuit MVR in de toepassing.\nEr worden geen gegevens in het bestand gewijzigd.';

  @override
  String get patchUniverseResetTitle => 'Referentie resetten?';

  @override
  String get patchUniverseResetTooltip => 'Referentie resetten';

  @override
  String get patchUniverseSelected => 'Geselecteerd universum';

  @override
  String get patchUniverseStateConflict => 'Conflict';

  @override
  String get patchUniverseStateFree => 'Vrij';

  @override
  String get patchUniverseStateOccupied => 'Druk bezig';

  @override
  String get patchUniverseTapHint =>
      'Raak een vakje aan om de details te bekijken.';

  @override
  String get patchUniverseUniverseDropdownLabel => 'Universum DMX';

  @override
  String patchUniverseUniverseItem(Object universe) {
    return 'Universum $universe';
  }

  @override
  String get patchUniverseUniverseTitle => 'Universum';

  @override
  String get patchUniverseZoomIn => 'Vergroten';

  @override
  String get patchUniverseZoomOut => 'Verminderen';

  @override
  String get patchUniverseZoomTitle => 'Zoom';

  @override
  String get photometryBeamAngleHint2 => 'In graden';

  @override
  String get photometryBeamAngleHint3 => 'In graden';

  @override
  String get photometryBeamAngleLabel => 'Stralingshoek';

  @override
  String get photometryCandelaHint1 => 'Voer een waarde in cd in';

  @override
  String get photometryCandelaHint2 => 'Voer een waarde in cd in';

  @override
  String get photometryCandelaLabel => 'Candela';

  @override
  String get photometryDisclaimerShort =>
      'Alleen indicatie. Raadpleeg de documentatie van de fabrikant.';

  @override
  String get photometryDistanceHint1 => 'In meters';

  @override
  String get photometryDistanceHint3 => 'In meters';

  @override
  String get photometryDistanceLabel => 'Afstand';

  @override
  String get photometryLumensHint2 => 'Voer een waarde in lm in';

  @override
  String get photometryLumensHint3 => 'Voer een waarde in lm in';

  @override
  String get photometryLumensLabel => 'Lumens';

  @override
  String get photometryLuxHint => 'Voer een waarde in lux in';

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
    return 'Bij $distance m, $candela cd ≈ $lux lux.';
  }

  @override
  String photometrySummary2(Object distance, Object lumens, Object lux) {
    return 'Bij $distance m, $lumens lm ≈ $lux lux (circa).';
  }

  @override
  String photometrySummary3(
      String lumens, String distance, String angle, String lux) {
    return 'Lumens: $lumens lm — Afstand: $distance m — Hoek: $angle° — Lux: $lux lx.';
  }

  @override
  String get projectionAngleHint => 'In graden';

  @override
  String get projectionAngleLabel => 'Hoek';

  @override
  String get projectionAutoHelp => 'Auto: berekent de ontbrekende waarde.';

  @override
  String projectionConeAngle(Object angle) {
    return 'Hoek: $angle°';
  }

  @override
  String projectionConeDiameter(Object diameter) {
    return 'Diameter: $diameter m';
  }

  @override
  String projectionConeDistance(Object distance) {
    return 'Afstand: $distance m';
  }

  @override
  String projectionDetailAngle(Object angle) {
    return 'Hoek: $angle°';
  }

  @override
  String projectionDetailDiameter(Object diameter) {
    return 'Diameter: $diameter m';
  }

  @override
  String projectionDetailDistance(Object distance) {
    return 'Afstand: $distance m';
  }

  @override
  String get projectionDiameterHint => 'In meters';

  @override
  String get projectionDiameterLabel => 'Diameter';

  @override
  String get projectionDistanceHint => 'In meters';

  @override
  String get projectionDistanceLabel => 'Afstand';

  @override
  String get projectionHeaderAutoActive => 'Automatisch actief';

  @override
  String get projectionHeaderNeedTwoValues => 'Voer minimaal twee waarden in.';

  @override
  String get projectionInputsTitle => 'Voorgerechten';

  @override
  String get projectionResultsTitle => 'Resultaten';

  @override
  String get resetConsents => 'Toestemmingen opnieuw instellen';

  @override
  String get settings => 'Instellingen';

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
    return 'Formaat: $format\nOppervlakte: $area m²\nLux (lm/m²): $lux\nLux eq (winst): $luxEq\nLuminantie: $nits nits | $fl ft-L\nMinimumdrempel ($presetLabel): $minFl ft-L → $status\nOpmerking: indicatieve schatting (Lambert).';
  }

  @override
  String get videoBrightnessSectionTitle => 'Lux / nits / ft-L + drempel';

  @override
  String get videoBrightnessSubtitle => 'Lux / nits / ft-L + drempel';

  @override
  String get videoBrightnessTitle => 'Helderheid';

  @override
  String get videoCalc1ErrMissing =>
      '❌ Ontbrekende gegevens: afstand + breedte.';

  @override
  String videoCalc1Ok(Object ratio) {
    return '✅ Projectieverhouding = $ratio';
  }

  @override
  String get videoCalc1Title => 'Verhouding (afstand / breedte)';

  @override
  String get videoCalc2ErrMissing =>
      '❌ Ontbrekende gegevens: afstand + verhouding.';

  @override
  String videoCalc2Ok(Object width) {
    return '✅ Afbeeldingsbreedte = $width m';
  }

  @override
  String get videoCalc2Title => 'Breedte (afstand / verhouding)';

  @override
  String get videoCalc3ErrMissingWidth => '❌ Ontbrekende gegevens: breedte.';

  @override
  String videoCalc3Ok(Object format, Object height) {
    return '✅ Hoogte = $height m ($format formaat)';
  }

  @override
  String get videoCalc3Title => 'Hoogte (breedte + formaat)';

  @override
  String get videoCalc4ErrGt0 => '❌ Lumens/Versterking/Breedte moet > 0 zijn.';

  @override
  String get videoCalc4ErrMissing =>
      '❌ Ontbrekende gegevens: Lumens + versterking + breedte.';

  @override
  String get videoCalc4ErrMissingSimple =>
      '❌ Ontbrekende gegevens: breedte + Lumens + versterking.';

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
    return 'Oppervlakte: $area m² (formaat $format)\nLux (lm/m²): $lux\nLux eq (winst): $luxEq\nLuminantie: $nits nits | $fl ft-L\nMinimumdrempel ($presetLabel): $minFl ft-L → $status\nOpmerking: nits/ft-L-conversie gebaseerd op een Lambertiaanse aanname (bij benadering).';
  }

  @override
  String get videoCalc4Title => 'Helderheid (lux/nits/ft-L + drempelwaarde)';

  @override
  String get videoCalc5ErrMissing =>
      '❌ Ontbrekende gegevens: Totale breedte + Overlap% + Aantal spotlights.';

  @override
  String get videoCalc5ErrNMin2 => '❌ Het aantal projectoren moet ≥ 2 zijn.';

  @override
  String get videoCalc5NHint => 'bijv: 2';

  @override
  String get videoCalc5NLabel => 'Aantal projectoren (N)';

  @override
  String videoCalc5Result(Object format, Object hTot, Object n, Object overlapM,
      Object overlapPct, Object wPer, Object wTot) {
    return 'Totale breedte: $wTot m\nN: $n | Overlapping: $overlapPct% (op projobreedte)\n\n- Breedte per projector: $wPer m\n- Overlapping tussen 2 projecten: $overlapM m\n- Totale hoogte ($format formaat): $hTot m';
  }

  @override
  String get videoCalc5Title => 'Overlapping (totale breedte + N)';

  @override
  String get videoCalc6ErrMissingBasics =>
      '❌ Ontbrekende gegevens: totale breedte + afstand + overlap%.';

  @override
  String get videoCalc6ErrMissingRatio =>
      '❌ Ontbrekende gegevens: Min. verhouding en/of Max. verhouding.';

  @override
  String get videoCalc6GainHint => 'bijvoorbeeld: 1.0';

  @override
  String get videoCalc6GainLabel => 'Winst (berekening 6)';

  @override
  String get videoCalc6LumensPerProjectorHint => 'bijvoorbeeld: 20000';

  @override
  String get videoCalc6LumensPerProjectorLabel => 'Lumens per projector';

  @override
  String get videoCalc6LumiErrGt0 =>
      'Helderheid: ❌ Lumens/projo en versterking moeten > 0 zijn.';

  @override
  String videoCalc6LumiForN(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Geschatte helderheid (N=$n)\nOppervlakte: $area m²\nLux eq: $lux (lm/m²)\nNeten: $nits | ft-L: $fl';
  }

  @override
  String get videoCalc6LumiOptional =>
      'Helderheid (optioneel): biedt Lumens/projo + versterking voor schatting.';

  @override
  String get videoCalc6NoteIndicative =>
      'Let op: indicatieve schatting (werkelijke vermenging/overlapping kan iets afnemen).';

  @override
  String get videoCalc6RatioMaxHint => 'bijvoorbeeld: 1,80';

  @override
  String get videoCalc6RatioMaxLabel => 'Maximale verhouding';

  @override
  String get videoCalc6RatioMinHint => 'bijvoorbeeld: 1,20';

  @override
  String get videoCalc6RatioMinLabel => 'Minimale verhouding';

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
    return 'Totale breedte=$wTot m | Afstand=$distance m | Overlapping=$overlapPct%\nFormaat $format → Totale hoogte=$hTot m | Oppervlakte=$area m²\nMin/max-verhouding: $ratioMin → $ratioMax\n\nCase ratio meer open (min) = $nMin projos | dekking ≈ $covMin m\n$lumiMin\n\nStrakker verhoudingsgeval (max) = $nMax projos | dekking ≈ $covMax m\n$lumiMax\n\n$note';
  }

  @override
  String get videoCalc6Title => 'Aantal automatische koplampen + helderheid';

  @override
  String videoCalcLabel(Object n) {
    return 'Berekening $n';
  }

  @override
  String get videoCalculateAll => 'Bereken alles';

  @override
  String get videoCalculationsTitle => 'Videoberekeningen';

  @override
  String get videoCommonParamsTitle => 'Algemene instellingen';

  @override
  String videoCommonPillArea(Object value) {
    return 'Gebied: $value';
  }

  @override
  String videoCommonPillDistance(Object value) {
    return 'Afstand: $value';
  }

  @override
  String videoCommonPillFormat(Object format) {
    return 'Formaat: $format';
  }

  @override
  String videoCommonPillHeight(Object value) {
    return 'Hoogte: $value';
  }

  @override
  String videoCommonPillOverlap(Object value) {
    return 'Overlapping: $value';
  }

  @override
  String videoCommonPillRatio(Object value) {
    return 'Verhouding: $value';
  }

  @override
  String videoCommonPillTotalWidth(Object value) {
    return 'Totale breedte: $value';
  }

  @override
  String videoCommonPillWidth(Object value) {
    return 'Breedte: $value';
  }

  @override
  String get videoCopyAllTooltip => 'Kopieer alle resultaten';

  @override
  String get videoCopySummaryTooltip => 'Samenvatting kopiëren';

  @override
  String get videoDisclaimerShort =>
      'Indicatieve berekeningen. Controleer altijd de documentatie van de fabrikant.';

  @override
  String get videoDistanceHint => 'bijvoorbeeld: 12.0';

  @override
  String get videoDistanceLabel => 'Werpafstand (m)';

  @override
  String get videoErrImpossibleDenom => '❌ Onmogelijke parameters (denom ≤ 0).';

  @override
  String get videoErrOverlapRange => '❌ Overlap% moet tussen 0 en 99,9 liggen.';

  @override
  String get videoErrRatioGt0 => '❌ De verhouding moet > 0 zijn.';

  @override
  String get videoErrTotalWidthAndDistanceGt0 =>
      '❌ Totale breedte en afstand moeten > 0 zijn.';

  @override
  String get videoErrTotalWidthGt0 => '❌ Totale breedte moet > 0 zijn.';

  @override
  String get videoErrWidthGt0 => '❌ Breedte moet > 0 zijn.';

  @override
  String get videoExportPdfTooltip => 'Exporteer PDF';

  @override
  String get videoFormatLabel => 'Formaat (verhouding)';

  @override
  String get videoGainHint => 'bijvoorbeeld: 1.0';

  @override
  String get videoGainLabel => 'Verdienen';

  @override
  String get videoImageWidthHint => 'bijvoorbeeld: 6,0';

  @override
  String get videoImageWidthLabel => 'Beeldbreedte (m)';

  @override
  String get videoLedCalcTitle => 'Berekening — Pixels/tegels';

  @override
  String get videoLedErrAllGt0 => '❌ Alle waarden moeten > 0 zijn.';

  @override
  String get videoLedErrMissingInputs =>
      '❌ Ontbrekende gegevens: Tegels X/Y + Tegel px + Tegel cm.';

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
    return '✅ Wandresolutie: $wallWpx × $wallHpx px\n✅ Wandafmetingen: $wallWm × $wallHm m\nTegel: $tileWpx×$tileHpx px • $tileWcm×$tileHcm cm\nBerekende toonhoogte: $pitch';
  }

  @override
  String get videoLedSubtitle =>
      'Pixels van de LED-muur volgens grootte, steek, afmeting van de tegels.';

  @override
  String get videoLedTileHcmHint => 'bijvoorbeeld: 33.28';

  @override
  String get videoLedTileHcmLabel => 'Tegelhoogte (cm)';

  @override
  String get videoLedTileHpxHint => 'bijvoorbeeld: 128';

  @override
  String get videoLedTileHpxLabel => 'Tegelhoogte (px)';

  @override
  String get videoLedTileWcmHint => 'bijvoorbeeld: 33.28';

  @override
  String get videoLedTileWcmLabel => 'Tegelbreedte (cm)';

  @override
  String get videoLedTileWpxHint => 'bijvoorbeeld: 128';

  @override
  String get videoLedTileWpxLabel => 'Tegelbreedte (px)';

  @override
  String get videoLedTilesXHint => 'bijv: 15';

  @override
  String get videoLedTilesXLabel => 'Horizontale tegels (X)';

  @override
  String get videoLedTilesYHint => 'bijv: 8';

  @override
  String get videoLedTilesYLabel => 'Verticale tegels (Y)';

  @override
  String get videoLedTitle => 'LED';

  @override
  String get videoLensMeasureSubtitle =>
      'Verhouding / breedte / hoogte (berekeningen 1 t/m 3).';

  @override
  String get videoLensMeasureTitle => 'Lens en meting';

  @override
  String get videoLmCalc1Title => 'Verhouding (afstand / breedte)';

  @override
  String get videoLmCalc2Title => 'Breedte (afstand / verhouding)';

  @override
  String get videoLmCalc3Title => 'Hoogte (breedte + formaat)';

  @override
  String get videoLmDistanceHint => 'bijvoorbeeld: 12.0';

  @override
  String get videoLmDistanceLabel => 'Werpafstand (m)';

  @override
  String get videoLmErrMissingDistanceRatio =>
      '❌ Ontbrekende gegevens: afstand + verhouding.';

  @override
  String get videoLmErrMissingDistanceWidth =>
      '❌ Ontbrekende gegevens: afstand + breedte.';

  @override
  String get videoLmErrMissingWidthOnly => '❌ Ontbrekende gegevens: breedte.';

  @override
  String get videoLmErrRatioGt0 => '❌ Verhouding moet > 0 zijn.';

  @override
  String get videoLmErrWidthGt0 => '❌ Breedte moet > 0 zijn.';

  @override
  String get videoLmFormatLabel => 'Formaat (verhouding)';

  @override
  String get videoLmImageWidthHint => 'bijvoorbeeld: 6,0';

  @override
  String get videoLmImageWidthLabel => 'Beeldbreedte (m)';

  @override
  String videoLmResultHeight(Object format, Object height) {
    return '✅ Hoogte = $height m ($format formaat)';
  }

  @override
  String videoLmResultRatio(Object ratio) {
    return '✅ Projectieverhouding = $ratio';
  }

  @override
  String videoLmResultWidth(Object width) {
    return '✅ Afbeeldingsbreedte = $width m';
  }

  @override
  String get videoLmThrowRatioHint => 'bijvoorbeeld: 1,60';

  @override
  String get videoLmThrowRatioLabel => 'Gooi verhouding';

  @override
  String get videoLumensHint => 'bijvoorbeeld: 20000';

  @override
  String get videoLumensLabel => 'Lumens (ANSI)';

  @override
  String get videoMireHeaderSubtitle =>
      'Indicatieve doelen (caling, focus, geometrie, blend, pixel perfect).';

  @override
  String get videoMireHeaderTitle => 'Patroongenerator';

  @override
  String get videoMireScreenLedSubtitle =>
      'Doel volgens BxH px (pixel perfect, uniformiteit, raster).';

  @override
  String get videoMireScreenLedTitle => 'LED-schermdoel';

  @override
  String get videoMireScreenVideoSubtitle =>
      'Eenvoudig (BxH px) + Multi-project mapping (N + overlap).';

  @override
  String get videoMireScreenVideoTitle => 'Videoschermtest';

  @override
  String get videoMireTitle => 'Slijk';

  @override
  String get videoMpCalc5Title => 'Breedte per projector';

  @override
  String get videoMpCalc6Title => 'Aantal projectoren (min/max verhouding)';

  @override
  String videoMpCaseOpenMin(Object coverage, Object n) {
    return 'Case ratio meer open (min) = $n projos | dekking ≈ $coverage m';
  }

  @override
  String videoMpCaseTightMax(Object coverage, Object n) {
    return 'Strakker verhoudingsgeval (max) = $n projos | dekking ≈ $coverage m';
  }

  @override
  String get videoMpDistanceHint => 'bijvoorbeeld: 12.0';

  @override
  String get videoMpDistanceLabel => 'Werpafstand (m)';

  @override
  String get videoMpErrImpossibleDenom =>
      '❌ Onmogelijke parameters (denom ≤ 0).';

  @override
  String get videoMpErrInvalidRatio =>
      '❌ Ongeldige verhouding (moet > 0 zijn).';

  @override
  String get videoMpErrMissing5 =>
      '❌ Ontbrekende gegevens: Totale breedte + Overlap% + N.';

  @override
  String get videoMpErrMissing6Main =>
      '❌ Ontbrekende gegevens: totale breedte + afstand + overlap%.';

  @override
  String get videoMpErrMissingRatios =>
      '❌ Ontbrekende gegevens: Min. verhouding en/of Max. verhouding.';

  @override
  String get videoMpErrNGte2 => '❌ N moet ≥ 2 zijn.';

  @override
  String get videoMpErrOverlapRange =>
      '❌ Overlap% moet tussen 0 en 99,9 liggen.';

  @override
  String get videoMpErrWidthDistanceGt0 =>
      '❌ Totale breedte en afstand moeten > 0 zijn.';

  @override
  String get videoMpErrWidthGt0 => '❌ Totale breedte moet > 0 zijn.';

  @override
  String get videoMpFormatLabel => 'Formaat (verhouding)';

  @override
  String get videoMpGainHint => 'bijvoorbeeld: 1.0';

  @override
  String get videoMpGainLabel => 'Verdienen';

  @override
  String get videoMpLumensPerProjectorHint => 'bijvoorbeeld: 20000';

  @override
  String get videoMpLumensPerProjectorLabel => 'Lumens per projector';

  @override
  String get videoMpLumiErrLumensGainGt0 =>
      'Helderheid: ❌ Lumens/projo en versterking moeten > 0 zijn.';

  @override
  String videoMpLumiEstimated(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Geschatte helderheid (N=$n)\nOppervlakte: $area m²\nLux eq: $lux\nNeten: $nits | ft-L: $fl';
  }

  @override
  String get videoMpLumiOptionalHint =>
      'Helderheid (optioneel): voert Lumens/projo + Gain in om te schatten.';

  @override
  String get videoMpNoteIndicative => 'Let op: indicatieve schatting.';

  @override
  String get videoMpOptionalLuminanceTitle => 'Optioneel: helderheid';

  @override
  String get videoMpOverlapHint => 'bijvoorbeeld: 10';

  @override
  String get videoMpOverlapLabel => 'Overlapping (%)';

  @override
  String get videoMpProjectorCountHint => 'bijv: 2';

  @override
  String get videoMpProjectorCountLabel => 'Aantal projectoren (N)';

  @override
  String get videoMpRatioMaxHint => 'bijvoorbeeld: 1,80';

  @override
  String get videoMpRatioMaxLabel => 'Maximale verhouding';

  @override
  String get videoMpRatioMinHint => 'bijvoorbeeld: 1,20';

  @override
  String get videoMpRatioMinLabel => 'Minimale verhouding';

  @override
  String get videoMpTotalWidthHint => 'bijv.: 18.0';

  @override
  String get videoMpTotalWidthLabel => 'Totale projectiebreedte (m)';

  @override
  String get videoMultiprojectorSubtitle =>
      'Overlap + breedte/projo + aantal projo\'s (berekeningen 5 & 6).';

  @override
  String get videoMultiprojectorTitle => 'Multiprojector';

  @override
  String get videoOptionalBrightnessTitle => 'Optioneel: helderheid';

  @override
  String get videoOverlapHint => 'bijvoorbeeld: 10';

  @override
  String get videoOverlapLabel => 'Overlapping (%)';

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
  String get videoPdfCalc5N => 'N (berekening5)';

  @override
  String get videoPdfCalc6 => 'Berekening 6';

  @override
  String get videoPdfCalc6Gain => 'Winst (berekening6)';

  @override
  String get videoPdfCalc6LumensPerProj => 'Lumens/project (berekening6)';

  @override
  String get videoPdfCalc6RatioMax => 'Maximale verhouding (berekening6)';

  @override
  String get videoPdfCalc6RatioMin => 'Min. verhouding (berekening6)';

  @override
  String get videoPdfDate => 'Datum';

  @override
  String get videoPdfDistance => 'Afstand (m)';

  @override
  String get videoPdfFormat => 'Formaat';

  @override
  String get videoPdfGain => 'Verdienen';

  @override
  String get videoPdfImageWidth => 'Beeldbreedte (m)';

  @override
  String get videoPdfLumens => 'Lumens';

  @override
  String get videoPdfOverlap => 'Overlapping (%)';

  @override
  String get videoPdfParams => 'Instellingen';

  @override
  String get videoPdfRatio => 'Verhouding';

  @override
  String get videoPdfResults => 'Resultaten';

  @override
  String get videoPdfScreenPreset => 'Schermvoorinstelling';

  @override
  String get videoPdfTitle => 'Mijn technische app – Video-export';

  @override
  String get videoPdfTotalWidth => 'Totale breedte (m)';

  @override
  String get videoPresetFrontGrey =>
      'Voorkant - grijs scherm (versterking 0,8)';

  @override
  String get videoPresetFrontGreyShort => 'Voorkant - grijs scherm';

  @override
  String get videoPresetFrontHighGain =>
      'Voorkant - scherm met hoge versterking (versterking 1,3)';

  @override
  String get videoPresetFrontHighGainShort =>
      'Voorkant - scherm met hoge versterking';

  @override
  String get videoPresetFrontWhite => 'Voorkant - matwit scherm (winst 1.0)';

  @override
  String get videoPresetFrontWhiteShort => 'Voorzijde - matwit scherm';

  @override
  String get videoPresetMappingDarkStone =>
      'Mapping - donkere steen (winst 0,35)';

  @override
  String get videoPresetMappingDarkStoneShort =>
      'In kaart brengen - donkere steen';

  @override
  String get videoPresetMappingGlass => 'Mapping - venster (winst 0,15)';

  @override
  String get videoPresetMappingGlassShort => 'In kaart brengen - venster';

  @override
  String get videoPresetMappingLightStone =>
      'Mapping - lichte steen (winst 0,6)';

  @override
  String get videoPresetMappingLightStoneShort =>
      'In kaart brengen - lichte steen';

  @override
  String get videoPresetMappingMatte => 'Mapping - matte verf (winst 0,75)';

  @override
  String get videoPresetMappingMatteShort => 'In kaart brengen - matte verf';

  @override
  String get videoPresetMappingSatin => 'Mapping - satijnverf (winst 0,9)';

  @override
  String get videoPresetMappingSatinShort => 'In kaart brengen - satijnverf';

  @override
  String get videoPresetRearClear => 'Retro - licht canvas (winst 0,9)';

  @override
  String get videoPresetRearClearShort => 'Retro - licht canvas';

  @override
  String get videoPresetRearDiffusion => 'Retro - diffusiedoek (winst 0,7)';

  @override
  String get videoPresetRearDiffusionShort => 'Retro - verspreidingsdoek';

  @override
  String get videoScreenPresetLabel =>
      'Scherm / Ondersteuning (vooraf ingesteld)';

  @override
  String get videoSummaryPillsTitle => 'Samenvatting (pellets)';

  @override
  String get videoTestPatternSubtitle =>
      'Creatie van videopatroon voor scherm en LED-muur (wordt later gedaan).';

  @override
  String get videoTestPatternTitle => 'Slijk';

  @override
  String get videoThrowRatioHint => 'bijvoorbeeld: 1,60';

  @override
  String get videoThrowRatioLabel => 'Gooi verhouding';

  @override
  String get videoTitle => 'Video';

  @override
  String get videoToolsTitle => 'Videohulpmiddelen';

  @override
  String get videoTotalWidthHint => 'bijv.: 18.0';

  @override
  String get videoTotalWidthLabel => 'Totale projectiebreedte (m)';

  @override
  String get aboutArtnetTitle => 'Art-Net';

  @override
  String get aboutArtnetToc01 => '1) Art-Net — wat is het en waarom';

  @override
  String get aboutArtnetToc02 => '2) Adressering en universum – eigen mapping';

  @override
  String get aboutArtnetToc03 =>
      '3) Grenzen en prestaties – wat het eerst kapot gaat';

  @override
  String get aboutArtnetToc04 => '4) Knooppunten, splitters en RDM';

  @override
  String get aboutArtnetToc05 => '5) Problemen oplossen – symptomen → oorzaken';

  @override
  String get aboutArtnetToc06 =>
      '6) Schema\'s (netwerk/unicast versus uitzending)';

  @override
  String get aboutArtnetToc07 =>
      '6bis) Afbeeldingen (middelen) — RJ45/schakelaar/kabels';

  @override
  String get aboutArtnetToc08 => '7) Snelle checklist';

  @override
  String get aboutDmxToc01 => '1) DMX, universum, adressen – de basis';

  @override
  String get aboutDmxToc02 => '2) Frame DMX — pauze, startcode, kanalen';

  @override
  String get aboutDmxToc03 => '3) RS-485-bekabeling — topologie en kabel';

  @override
  String get aboutDmxToc04 => '4) Afsluiting en splitters — vermijd reflecties';

  @override
  String get aboutDmxToc05 => '4bis) MDR — limieten en compatibiliteit';

  @override
  String get aboutDmxToc06 =>
      '5) Probleemoplossing ter plaatse – symptomen → oorzaken';

  @override
  String get aboutDmxToc07 => '6) Art-Net — veldbenchmarks';

  @override
  String get aboutDmxToc08 => '7) sACN / E1.31 — multicast, IGMP, prioriteiten';

  @override
  String get aboutDmxToc09 => '8) DMX versus Art-Net versus sACN — kies';

  @override
  String get aboutDmxToc10 => '10) Snelle checklist';

  @override
  String get aboutDmxToc11 => '10) Snelle checklist';

  @override
  String get aboutElectriciteTitle => 'Elektriciteit';

  @override
  String get aboutElectriciteToc01 => '1) Basis (W, A, V, kW)';

  @override
  String get aboutElectriciteToc02 =>
      '2) Connectoren (Schuko / P17 / PowerCON)';

  @override
  String get aboutElectriciteToc03 => '3) Mono / Tri (wat verandert er)';

  @override
  String get aboutElectriciteToc04 => '4) Snelle tafel (16A → 400A)';

  @override
  String get aboutElectriciteToc05 => '5) Beveiligings- en terreinvallen';

  @override
  String get aboutElectriciteToc06 => '6) Controlelijst';

  @override
  String get aboutInformatiqueTitle => 'Computerwetenschappen';

  @override
  String get aboutInformatiqueToc01 => '1) USB/USB-C/Thunderbolt';

  @override
  String get aboutInformatiqueToc02 => '2) Opslag (SATA/NVMe/SSD)';

  @override
  String get aboutInformatiqueToc03 => '3) Video-aansluitingen (DP / HDMI)';

  @override
  String get aboutInformatiqueToc04 => '4) PCIe/GPU (benchmarks)';

  @override
  String get aboutInformatiqueToc05 => '5) Controlelijst (lade)';

  @override
  String get aboutIpBasicsToc01 => '1) Wat is een IP en waar dient het voor?';

  @override
  String get aboutIpBasicsToc02 =>
      '2) Waarom 192.x / 10.x / 172.x? (privéadressen)';

  @override
  String get aboutIpBasicsToc03 => '3) Maskers en subnetten: begrijp het echt';

  @override
  String get aboutIpBasicsToc04 => '4) DHCP, gateway, DNS: wie doet wat?';

  @override
  String get aboutIpBasicsToc05 =>
      '5) Hoe twee apparaten met elkaar praten (LAN vs. off-LAN)';

  @override
  String get aboutIpBasicsToc06 =>
      '6) Eenvoudige “show” IP-plannen (voorbeelden die klaar zijn om te kopiëren)';

  @override
  String get aboutIpBasicsToc07 =>
      '7) Probleemoplossing: symptomen → oorzaken (veldmethode)';

  @override
  String get aboutIpBasicsToc08 =>
      '8) Mini-oefeningen (snel een masker/netwerk controleren)';

  @override
  String get aboutIpBasicsToc09 => '9) Snelle checklist';

  @override
  String get aboutNetworkTitle => 'Netwerk (EN)';

  @override
  String get aboutNetworkToc01 => '1) Doelstelling: stabiel netwerk';

  @override
  String get aboutNetworkToc02 => '2) IP-abonnement (eenvoudig)';

  @override
  String get aboutNetworkToc03 => '3) VLAN (scheiding)';

  @override
  String get aboutNetworkToc04 => '4) IGMP (sACN multicast)';

  @override
  String get aboutNetworkToc05 => '5) Wi-Fi versus bekabeld';

  @override
  String get aboutNetworkToc06 => '6) Schakelaar: wat je nodig hebt';

  @override
  String get aboutNetworkToc07 => '7) Schema\'s';

  @override
  String get aboutNetworkToc08 => '7bis) Afbeeldingen (activa)';

  @override
  String get aboutNetworkToc09 => '8) Controlelijst';

  @override
  String get aboutReseauTitle => 'Netwerk';

  @override
  String get aboutReseauToc01 =>
      '1) Basisprincipes van het netwerk (LAN / IP / doorvoer)';

  @override
  String get aboutReseauToc02 => '2) RJ45 & categorieën (Cat5e/6/6A/…)';

  @override
  String get aboutReseauToc03 => '3) PoE (netwerkvoeding)';

  @override
  String get aboutReseauToc04 => '4) Vezel (SM/MM) + connectoren (LC/SC)';

  @override
  String get aboutReseauToc05 => '5) SFP / SFP+ / QSFP (modules)';

  @override
  String get aboutReseauToc06 => '6) Schakelaars (VLAN / IGMP / QoS)';

  @override
  String get aboutReseauToc07 => '7) Art-Net / sACN op netwerk (advies)';

  @override
  String get aboutReseauToc08 => '8) Controlelijst';

  @override
  String get aboutSacnToc01 => '1) Waar wordt sACN voor gebruikt?';

  @override
  String get aboutSacnToc02 => '2) Universum (nummering)';

  @override
  String get aboutSacnToc03 => '3) Multicast / Unicast + IGMP';

  @override
  String get aboutSacnToc04 => '4) Prioriteiten (multi-source)';

  @override
  String get aboutSacnToc05 => '5) Limieten / prestaties';

  @override
  String get aboutSacnToc06 =>
      '6) RDM & sACN (proxy / afhankelijk van hardware)';

  @override
  String get aboutSacnToc07 => '7) Schema\'s';

  @override
  String get aboutSacnToc08 => '7bis) Afbeeldingen (activa)';

  @override
  String get aboutSacnToc09 => '8) Controlelijst';

  @override
  String get aboutVideoToc01 => '1) Basisprincipes van video (trefwoorden)';

  @override
  String get aboutVideoToc02 => '2) Resolutie en FPS';

  @override
  String get aboutVideoToc03 => '3) Kleur (4:4:4 / 4:2:2 / 10-bits)';

  @override
  String get aboutVideoToc04 => '4) Synchroniseren (Genlock / Tijdcode)';

  @override
  String get aboutVideoToc05 => '5) Kabels & afstanden';

  @override
  String get aboutVideoToc06 => '6) SDI (3G/6G/12G)';

  @override
  String get aboutVideoToc07 => '7) HDMI — veld';

  @override
  String get aboutVideoToc08 => '8) NDI — wanneer / waarom / limieten';

  @override
  String get aboutVideoToc09 =>
      '9) In kaart brengen / LED / meerdere projecten';

  @override
  String get aboutVideoToc10 => '10) Veldcontrolelijst';

  @override
  String get aboutTileDmxTitle => 'DMX — bediening (eenvoudig en compleet)';

  @override
  String get aboutTileArtnetTitle =>
      'Art-Net — DMX via IP (knooppunten, unicast/broadcast)';

  @override
  String get aboutTileSacnTitle =>
      'sACN / E1.31 — multicast, IGMP, prioriteiten';

  @override
  String get aboutTileIpBasicsTitle =>
      'Netwerk — IP-bases/masker/DHCP (essentieel)';

  @override
  String get aboutTileReseauTitle =>
      'Netwerk — RJ45 / Glasvezel / snelheden en lengtes';

  @override
  String get aboutTileNetworkTitle =>
      'Licht netwerk – VLAN, IGMP, Wi-Fi versus bekabeld';

  @override
  String get aboutTileVideoTitle => 'Video — SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutTileElectriciteTitle =>
      'Elektrisch — Schuko / P17 / bevoegdheden';

  @override
  String get aboutTileElectriciteSubtitle =>
      'Connectoren, mono/tri, snelle kW-tafels (16A → 400 A), veldvallen.';

  @override
  String get aboutTileInformatiqueTitle =>
      'Computers — USB/HDMI/DP/SATA/NVMe...';

  @override
  String get aboutTileInformatiqueSubtitle =>
      'Nuttige snelheden, versies, echte limieten, marketingvalkuilen.';

  @override
  String get aboutTitle => 'Over';

  @override
  String get homeRiggingTitle => 'Rigging';

  @override
  String get homeRiggingSubtitle => 'Hoofdstellen: slinghoeken en lengtes.';

  @override
  String get riggingTitle => 'Rigging';

  @override
  String get riggingAngleLengthTitle => 'Hoofdstelhoek en slinglengte';

  @override
  String get riggingSymmetryNote =>
      'Hypothese: symmetrisch hoofdstel (2 identieke strengen). Geen belastingberekening.';

  @override
  String get riggingInputsTitle => 'Voorgerechten';

  @override
  String get riggingSpanLabel => 'Hartafstand (afstand tussen punten)';

  @override
  String get riggingSpanHint => 'Bijvoorbeeld: 2.40';

  @override
  String get riggingDropLabel => 'Pijl (verticale daling)';

  @override
  String get riggingDropHint => 'Bijvoorbeeld: 0,60';

  @override
  String get riggingUnitMeters => 'M';

  @override
  String get riggingResultsTitle => 'Resultaten';

  @override
  String get riggingNeedPositiveValues => 'Voer waarden > 0 in.';

  @override
  String get riggingLegLengthLabel => 'Lengte van een streng';

  @override
  String get riggingAngleToHorizontalLabel =>
      'Hoek ten opzichte van de horizontaal';

  @override
  String get riggingAngleToVerticalLabel => 'Hoek ten opzichte van verticaal';

  @override
  String get riggingDisclaimerShort =>
      'Indicatieve resultaten. Te valideren volgens uw context en riggingpraktijken.';

  @override
  String get riggingCalcLegDropTitle => 'Lengte + pijl → bereik';

  @override
  String get riggingCalcLegDropHelp =>
      'Symmetrische tilband (2 poten): berekent het bereik op basis van de tilbandlengte en de doorzakking.';

  @override
  String get riggingLegLengthInputLabel => 'Lengte van een streng';

  @override
  String get riggingLegLengthInputHint => 'Bijvoorbeeld: 2,50';

  @override
  String get riggingInvalidTriangle =>
      'Onmogelijk: de lengte moet groter zijn dan de pijl.';

  @override
  String get riggingCalcLegAngleTitle => 'Lengte + hoek → bereik + pijl';

  @override
  String get riggingCalcLegAngleHelp =>
      'Symmetrische tilband (2 poten): berekent het bereik en de doorbuiging op basis van de lengte en hoek ten opzichte van de horizontaal.';

  @override
  String get riggingAngleHorizontalInputLabel =>
      'Hoek ten opzichte van de horizontaal';

  @override
  String get riggingAngleHorizontalInputHint => 'Bijv.: 30';

  @override
  String get riggingInvalidAngle =>
      'Ongeldige hoek: tussen 0° en 90° (exclusief).';

  @override
  String get riggingUnitDegrees => '°';

  @override
  String get riggingCalc1Title => 'Hartafstand + pijl → lengte en hoeken';

  @override
  String get riggingCalc1Subtitle =>
      'Symmetrisch hoofdstel (2 identieke strengen). Weergegeven gewicht (info). Geen belastingberekening.';

  @override
  String get riggingCalc2Title => 'Hartafstand + hoek (H) → pijl & lengte';

  @override
  String get riggingCalc2Subtitle =>
      'Hoek ten opzichte van de horizontaal. Symmetrisch hoofdstel. Geen belastingberekening.';

  @override
  String get riggingCalc3Title => 'Hartafstand + lengte → pijl & hoeken';

  @override
  String get riggingCalc3Subtitle =>
      'Lengte van een streng bekend. Symmetrisch hoofdstel. Geen belastingberekening.';

  @override
  String get riggingLegLengthHint => 'Bijvoorbeeld: 4,70';

  @override
  String get riggingAngleHint => 'Bijv.: 45';

  @override
  String get riggingInvalidGeometry =>
      'Onmogelijke geometrie (lengte te kort voor de hartafstand).';

  @override
  String get riggingSchemaTitle => 'Plan';

  @override
  String get riggingSchemaCaption1 =>
      'Ingangen: bereik + pijl. Uitgangen: slinglengte + hoeken.';

  @override
  String get riggingSchemaCaption2 =>
      'Ingangen: bereik + slinglengte. Uitgangen: pijl + hoeken.';

  @override
  String get riggingSchemaCaption3 =>
      'Ingangen: bereik + hoek (horizontaal). Uitgangen: pijl + lengte.';

  @override
  String get riggingAngleHInputLabel => 'Hoek (ten opzichte van horizontaal)';

  @override
  String get riggingAngleHInputHint => 'Bijv.: 45';

  @override
  String get riggingDropResultLabel => 'Pijl (laten vallen)';

  @override
  String get riggingSchemaLabelSpan => 'Centrum afstand';

  @override
  String get riggingSchemaLabelDrop => 'Pijl';

  @override
  String get riggingSchemaLabelLeg => 'Streng';

  @override
  String get riggingWeightLabel => 'Gewicht (info)';

  @override
  String get riggingUnitKg => 'kg';

  @override
  String get riggingImpossibleGeometry =>
      'Geometrie onmogelijk: de lengte van een streng moet > (hartafstand / 2) zijn.';

  @override
  String get riggingDisclaimerNoLoad =>
      'Gewicht weergegeven uitsluitend ter informatie. Geen lading/spanningsberekening. Geldig volgens uw riggingcontext.';

  @override
  String get riggingCalcCommonSubtitle =>
      '2 strengs hoofdstel. Weergegeven gewicht (info). Geen belastingberekening.';

  @override
  String get riggingOffCenterToggle => 'Niet-gecentreerde belasting';

  @override
  String get riggingOffsetLabel => 'Offset A → belasting';

  @override
  String get riggingInvalidOffset =>
      'Offset ongeldig: moet > 0 en < hartafstand zijn.';

  @override
  String get riggingLegLeftLabel => 'Lengte van de linker streng';

  @override
  String get riggingLegRightLabel => 'Rechte strenglengte';

  @override
  String get riggingAngleHLeftLabel => 'Hoek H (links)';

  @override
  String get riggingAngleHRightLabel => 'Hoek H (rechts)';

  @override
  String get riggingAngleVLeftLabel => 'Hoek V (links)';

  @override
  String get riggingAngleVRightLabel => 'Hoek V (rechts)';

  @override
  String get riggingBridleAnglesLegend => 'Hoeken';

  @override
  String get riggingIncludedAngleLabel => 'Hoek tussen strengen';

  @override
  String get riggingAngleHLeftInputLabel => 'Hoek H (linker streng)';

  @override
  String get riggingLegLeftInputLabel => 'Lengte (linker streng)';

  @override
  String get riggingNeedValidValues => 'Voer geldige positieve waarden in.';

  @override
  String get photometrySection4Title => 'Lux → Lumen';

  @override
  String get photometryAreaLabel => 'Oppervlakte (m²)';

  @override
  String get photometryAreaHint4 => 'Bijv.: 12.5';

  @override
  String photometrySummary4(Object lumens, Object lux, Object area) {
    return 'E = $lux lx • S = $area m² → Φ = $lumens lm';
  }

  @override
  String get aboutArtnetTocConversionTitle => 'Conversies';

  @override
  String get aboutArtnetConversionIntro =>
      'Handige conversietools rond DMX, Art-Net universums en hexadecimale waarden.';

  @override
  String get aboutUniverseToArtnetTitle => 'Universum → Art-Net';

  @override
  String get aboutUniverseToArtnetSubtitle =>
      'Zoek subnet + universum (net-/poortadres) uit een universum DMX.';

  @override
  String get aboutUniverseToHexTitle => 'Heelal → Hex';

  @override
  String get aboutUniverseToHexSubtitle =>
      'Converteer een universum (1…N) naar een index- en hexadecimale waarde.';

  @override
  String get aboutArtnetConversionNote =>
      'Opmerking: Art-Net-conventies kunnen variëren afhankelijk van de consoles (adressering, basis 0/1). Controleer altijd uw systeemdocumentatie.';

  @override
  String get elecTocCopyText => 'Samenvatting kopiëren';

  @override
  String get elecToc1 => '1) Basis (W, A, V, kW)';

  @override
  String get elecToc2 => '2) Connectoren (Schuko / P17 / PowerCON)';

  @override
  String get elecToc3 => '3) Mono / Tri (wat verandert er)';

  @override
  String get elecToc4 => '4) Snelle tafel (16A → 400A)';

  @override
  String get elecToc5 => 'Conversie kVA → kW / A';

  @override
  String get elecToc6 => '6) Beveiliging en veldvallen';

  @override
  String get elecToc7 => '6) Controlelijst';

  @override
  String get elecKvaTitle => 'Tabel kVA → kW (volgens cos φ)';

  @override
  String get elecKvaFormula => 'Formule: kW = kVA × cos φ';

  @override
  String get elecKvaIntro =>
      'Deze tabel geeft een snelle schatting van het actieve vermogen (kW) op basis van een schijnbaar vermogen (kVA).';

  @override
  String get elecKvaNote =>
      'Indicatieve waarden. Gebruik de echte waarden van cos φ als je ze kent.';

  @override
  String get elecKvaColKva => 'kVA';

  @override
  String get elecKvaColPf08 => 'kW (cos φ = 0,8)';

  @override
  String get elecKvaColPf10 => 'kW (cos φ = 1,0)';

  @override
  String get commonTocTitle => 'Samenvatting';

  @override
  String get commonCopySummaryTooltip => 'Samenvatting kopiëren';

  @override
  String get aboutLightReferenceTitle => 'Verlichting referenties';

  @override
  String get refCriTitle => 'IRC/CRI';

  @override
  String get refKelvinTitle => 'Kleurtemperatuur (K)';

  @override
  String get refBeamFieldTitle => 'Straal/Veld';

  @override
  String get refLuxTitle => 'Verlichtingsniveaus (lux)';

  @override
  String get refCriContent =>
      'CRI (CRI) meet de kleurgetrouwheid. Hoe hoger deze is, hoe natuurlijker de kleuren verschijnen.';

  @override
  String get refKelvinContent =>
      'De kleurtemperatuur beschrijft de tint wit (warm tot koel).';

  @override
  String get refBeamFieldContent =>
      'De straal is de hoek van het grootlicht; het veld de hoek waar de intensiteit zwak wordt (grens).';

  @override
  String get refBeamLegendBeam => 'straal';

  @override
  String get refBeamLegendField => 'Veld';

  @override
  String get refLuxIntro =>
      'Indicatieve referenties voor verlichting naar gebruik.';

  @override
  String get refLuxColUse => 'Gebruik';

  @override
  String get refLuxColLux => 'Lux';

  @override
  String get refLuxUseCorridor => 'Gang / circulatie';

  @override
  String get refLuxUseBackstage => 'Backstage / technisch';

  @override
  String get refLuxUseMeeting => 'Vergaderruimte';

  @override
  String get refLuxUseExpo => 'Expositie/showroom';

  @override
  String get refLuxUseStageGeneral => 'Scène – algemeen';

  @override
  String get refLuxUseStageTv => 'Podium – TV / opname';

  @override
  String get refLuxNote =>
      'Deze waarden variëren afhankelijk van normen en beperkingen (camera, contrast, sfeer).';

  @override
  String get refLightDisclaimerShort =>
      'Indicatieve referenties – geen standaard.';

  @override
  String get refCri90 => 'Uitstekend (≥90)';

  @override
  String get refCri80 => 'Goed (≈ 80)';

  @override
  String get refCriLow => 'Laag (< 80)';

  @override
  String get aboutUniverseToArtnetImportantTitle => 'Belangrijk';

  @override
  String get aboutUniverseToArtnetImportantBody =>
      'Sommige consoles gebruiken basis 0 (Universe 0..15) en andere gebruiken basis 1 (Universe 1..16).';

  @override
  String get aboutUniverseToArtnetTableTitle => 'Universumtabel → Art-Net';

  @override
  String get aboutUniverseToArtnetTableIntro =>
      'Typische correspondentie tussen universum DMX en adressering Art-Net.';

  @override
  String get aboutUniverseTablesDisclaimer =>
      'Controleer altijd uw console/knooppuntconventie.';

  @override
  String get aboutUniverseToArtnetColDmx => 'Universum DMX';

  @override
  String get aboutUniverseToArtnetColUniHex => 'Gewoon (hexadecimaal)';

  @override
  String aboutUniverseToArtnetSubnetTitle(
      Object p0, Object p1, Object p2, Object p3) {
    return 'Subnet $p0 $p1 $p2 $p3';
  }

  @override
  String get aboutUniverseToHexPrincipleTitle => 'Beginsel';

  @override
  String get aboutUniverseToHexPrincipleBody =>
      'Een universum (1…N) kan worden geconverteerd naar index (grondtal 0) en vervolgens naar hexadecimaal.';

  @override
  String get aboutUniverseToHexTableTitle => 'Universe → Hex-tabel';

  @override
  String get aboutUniverseToHexTableIntro =>
      'Universe-conversietabel DMX → index / hex.';

  @override
  String aboutUniverseToHexBlockTitle(Object p0, Object p1) {
    return 'Blokkeer $p0 $p1';
  }

  @override
  String get aboutUniverseToHexColDmx => 'Universum DMX';

  @override
  String get aboutUniverseToHexColIndex => 'Index';

  @override
  String get aboutArtnetPageTitle =>
      'Art-Net — DMX universum op IP (eenvoudig en compleet)';

  @override
  String get aboutArtnetTocTitle => 'Samenvatting';

  @override
  String get aboutArtnetTocCopyTooltip => 'Kopieer markeringen';

  @override
  String get aboutArtnetCopyLine1 => 'Art-Net = DMX via Ethernet via UDP.';

  @override
  String get aboutArtnetCopyLine2 =>
      'Schaal: veel universums via gedistribueerde knooppunten (DMX-out).';

  @override
  String get aboutArtnetCopyLine3 =>
      'Verspreiding: uitzending (eenvoudig maar overstroming) of unicast (schoner).';

  @override
  String get aboutArtnetCopyLine4 =>
      'Echte limieten: Wi-Fi, basisschakelaar, firmwareknooppunten, universum-/toewijzingsinstellingen.';

  @override
  String get aboutArtnetCopyLine5 =>
      'RDM: mogelijk via \"RDM proxy\" afhankelijk van knooppunten (variabele ondersteuning).';

  @override
  String get aboutArtnetSection1Title => '1) Art-Net — wat is het en waarom';

  @override
  String get aboutArtnetSection2Title =>
      '2) Adressering en universum – eigen mapping';

  @override
  String get aboutArtnetSection3Title =>
      '3) Grenzen en prestaties – wat het eerst kapot gaat';

  @override
  String get aboutArtnetSection4Title => '4) Knooppunten, splitters en RDM';

  @override
  String get aboutArtnetSection5Title =>
      '5) Problemen oplossen – symptomen → oorzaken';

  @override
  String get aboutArtnetSection6Title =>
      '6) Schema\'s (netwerk/unicast versus uitzending)';

  @override
  String get aboutArtnetSection6bTitle =>
      '6bis) Afbeeldingen (middelen) — RJ45/schakelaar/kabels';

  @override
  String get aboutArtnetSection7Title => '7) Snelle checklist';

  @override
  String get aboutArtnetConversionTablesTitle =>
      '8) Conversie / tabellen (Universe 1..256)';

  @override
  String get aboutArtnetPillUdp => 'UDP';

  @override
  String get aboutArtnetPillUniversIp => 'Universum DMX op IP';

  @override
  String get aboutArtnetPillNodesDmxOut => 'Knooppunten DMX-uit';

  @override
  String get aboutArtnetSection1Paragraph => '\"pakketten\" op het netwerk';

  @override
  String get aboutArtnetSection1CalloutTitle => 'Waarom het nuttig is';

  @override
  String get aboutArtnetSection1Bullet1 =>
      'Schaalbaar: veel universums op één netwerkkabel.';

  @override
  String get aboutArtnetSection1Bullet2 =>
      'Distributie: knooppunten dichtbij projectoren/dimmers → minder lange lijnen DMX.';

  @override
  String get aboutArtnetSection1Bullet3 =>
      'Flexibele patching: het veranderen van een universum of het verplaatsen van een knooppunt gaat snel.';

  @override
  String get aboutArtnetSection1Subtitle => 'Twee woorden om te onthouden';

  @override
  String get aboutArtnetSection1SubBullet1 =>
      'Art-Net vervangt DMX niet: het transporteert het over IP.';

  @override
  String get aboutArtnetSection1SubBullet2 =>
      'Stabiliteit hangt vaak meer af van het netwerk (switch, wifi, uitzending) dan van het protocol.';

  @override
  String get aboutArtnetSection2PillUniverse => 'Universum';

  @override
  String get aboutArtnetSection2PillNodePort => 'Knooppunt/poort';

  @override
  String get aboutArtnetSection2PillMapping => 'In kaart brengen';

  @override
  String get aboutDmxPageTitle => 'DMX — bediening (eenvoudig en compleet)';

  @override
  String get aboutDmxSummaryLine1 =>
      'DMX = RS-485, 512 kanalen (slots) per universum, waarden 0–255 (8-bit).';

  @override
  String get aboutDmxSummaryLine2 =>
      'Timing: 250 kbaud, volledig universum ≈ ~44 Hz (orde van grootte).';

  @override
  String get aboutDmxSummaryLine3 =>
      'Topologie: serieschakeling (geen passieve Y). 120Ω afsluiting op de laatste.';

  @override
  String get aboutDmxSummaryLine4 =>
      'RDM = DMX bidirectioneel (config/monitoring) → compatibiliteit van splitter/knooppunt om te controleren.';

  @override
  String get aboutDmxSummaryLine5 =>
      'Art-Net / sACN = universum DMX getransporteerd via Ethernet/IP via knooppunten.';

  @override
  String get aboutDmxSummaryLine6 =>
      'sACN = multicast + prioriteiten (IGMP-spionage aanbevolen).';

  @override
  String get aboutDmxToc1 => '1) DMX, universum, adressen – de basis';

  @override
  String get aboutDmxToc2 => '2) Frame DMX — pauze, startcode, kanalen';

  @override
  String get aboutDmxToc3 => '3) RS-485-bekabeling — topologie en kabel';

  @override
  String get aboutDmxToc4 => '4) Afsluiting en splitters — vermijd reflecties';

  @override
  String get aboutDmxToc4bis => '4bis) MDR — limieten en compatibiliteit';

  @override
  String get aboutDmxToc5 =>
      '5) Probleemoplossing ter plaatse – symptomen → oorzaken';

  @override
  String get aboutDmxToc6 => '6) Art-Net — veldbenchmarks';

  @override
  String get aboutDmxToc7 => '7) sACN / E1.31 — multicast, IGMP, prioriteiten';

  @override
  String get aboutDmxToc8 => '8) DMX versus Art-Net versus sACN — kies';

  @override
  String get aboutDmxToc9 => '9) Velddiagrammen (DMX / IP / pinout)';

  @override
  String get aboutDmxChecklistCopyTitle => 'DMX — Controlelijst ter plaatse';

  @override
  String get aboutDmxChecklistCopyTitle2 =>
      'Art-Net / sACN — Controlelijst ter plaatse';

  @override
  String get aboutDmxChecklistCopyB1 =>
      'Correcte apparaatmodus (aantal kanalen)';

  @override
  String get aboutDmxChecklistCopyB2 => 'Correct DMX adres (geen overlap)';

  @override
  String get aboutDmxChecklistCopyB3 => 'Daisy-chain (geen passieve Y)';

  @override
  String get aboutDmxChecklistCopyB4 => '120Ω afsluiting op laatste apparaat';

  @override
  String get aboutDmxChecklistCopyB5 =>
      'DMX/RS-485-kabel (120Ω twisted pair) indien mogelijk';

  @override
  String get aboutDmxChecklistCopyB6 =>
      'Opto splitsen als er meerdere vertakkingen zijn';

  @override
  String get aboutDmxChecklistCopyB7 =>
      'Houd DMX indien mogelijk uit de buurt van parasitaire bronnen (voedingen, dimmers).';

  @override
  String get aboutDmxChecklistCopyB8 =>
      'Indien RDM: controleer de compatibiliteit van splitter/node + onberispelijke bekabeling';

  @override
  String get aboutDmxChecklistCopyB9 =>
      'Eigen netwerk indien mogelijk (of VLAN)';

  @override
  String get aboutDmxChecklistCopyB10 =>
      'Juiste schakelaar; IGMP-spionage aanbevolen (sACN multicast)';

  @override
  String get aboutDmxChecklistCopyB11 =>
      'Unicast (vaak) of gecontroleerde multicast (voorkom overstromingen)';

  @override
  String get aboutDmxChecklistCopyB12 =>
      'Universe-toewijzing ↔ poorten/knooppunt geverifieerd';

  @override
  String get aboutDmxChecklistCopyB13 =>
      'Duidelijk IP-plan (adressen, masker, DHCP versus statisch)';

  @override
  String get aboutDmxS1Title => '1) DMX, universum, adressen – de basis';

  @override
  String get aboutDmxS1Pill1 => '1 universum = 512 slots';

  @override
  String get aboutDmxS1Pill2 => '0–255 (8-bits)';

  @override
  String get aboutDmxS1Pill3 => '16-bit = 2 kanalen';

  @override
  String get aboutDmxS1Intro =>
      'DMX512 is een besturingsprotocol dat veel wordt gebruikt in shows (verlichting, effecten, dimmers). Het is een seriële stroom (RS-485) die een “frame” doorloopt met maximaal 512 waarden. Elke waarde = één kanaal (0→255).';

  @override
  String get aboutDmxS1RememberTitle => 'Om te onthouden';

  @override
  String get aboutDmxS1RememberB1 =>
      '1 universum DMX = 512 kanalen (slots) genummerd 1 → 512.';

  @override
  String get aboutDmxS1RememberB2 =>
      'Een apparaat luistert naar een startadres (bijvoorbeeld: 101) en verbruikt N kanalen (afhankelijk van de modus).';

  @override
  String get aboutDmxS1RememberB3 =>
      'De controller stuurt alles continu terug: als je stopt met zenden, \"bevriezen\" de apparaten (of gaan ze in fallback).';

  @override
  String get aboutDmxS4bisTitle => '4bis) MDR — limieten en compatibiliteit';

  @override
  String get aboutDmxS4bisPlaceholder => '... (behoud uw bestaande inhoud)';

  @override
  String get aboutDmxS9Title => '9) Velddiagrammen (DMX / IP / pinout)';

  @override
  String get aboutDmxS9Diagram1 => 'Timing DMX (pauze / MAB / slots)';

  @override
  String get aboutDmxS9Diagram2 => 'Topologie DMX: serieschakeling';

  @override
  String get aboutDmxS9Diagram3 => '120Ω afsluiting';

  @override
  String get aboutDmxS9Diagram4 => 'sACN multicast: IGMP-callback (netwerk)';

  @override
  String get aboutDmxS9Diagram5 => 'IP → knooppunten → DMX (Art-Net / sACN)';

  @override
  String get aboutDmxS9Diagram6 => 'Pin-out XLR5 (DMX)';

  @override
  String get aboutDmxS10Title => '10) Snelle checklist';

  @override
  String get aboutDmxS10CopyTooltip => 'Controlelijst kopiëren';

  @override
  String get aboutDmxS10CalloutTitle => 'Voordat je in paniek raakt';

  @override
  String get aboutDmxS10B1 => 'Apparaatmodus + adres DMX (altijd controleren).';

  @override
  String get aboutDmxS10B2 =>
      'Korte ketting met een \"bekende OK\" kabel om te isoleren.';

  @override
  String get aboutDmxS10B3 => 'Daisy-chain (geen passieve Y).';

  @override
  String get aboutDmxS10B4 => '120Ω-afsluiting alleen op het laatste apparaat.';

  @override
  String get aboutDmxS10B5 =>
      'Splitter opto als er meerdere vertakkingen zijn.';

  @override
  String get aboutDmxS10B6 =>
      'Indien RDM: compatibele splitter/node + onberispelijke bekabeling.';

  @override
  String get aboutDmxS10B7 =>
      'In IP (Art-Net/sACN): correcte schakelaar, IGMP voor sACN multicast, unicast bij twijfel.';

  @override
  String get aboutDmxFooterNote =>
      'Indicatieve informatie (terrein). Het exacte gedrag kan variëren, afhankelijk van consoles, knooppunten, switches en firmware.\nDoel hier: snel begrijpen en problemen oplossen, met een betrouwbare methode.';

  @override
  String get aboutDmxPainterBreak => 'PAUZE';

  @override
  String get aboutDmxPainterMab => 'MAB';

  @override
  String get aboutDmxPainterStartCode => 'Begin\ncode';

  @override
  String get aboutDmxPainterSlots => 'Sleuven 1…N\n(tot 512)';

  @override
  String get aboutDmxPainterRefresh =>
      'Lus (vernieuwen) — volledig universum ≈ ~44 Hz (orde van grootte)';

  @override
  String get aboutDmxPainterSourceA => 'BRON A\n(prioriteit 100)';

  @override
  String get aboutDmxPainterSourceB => 'BRON B\n(vóór 90)';

  @override
  String get aboutDmxPainterSwitchIgmp => 'SCHAKEL\nIGMP-spionage';

  @override
  String get aboutDmxPainterMulticastUniverse => 'MULTICAST\nUniversum U';

  @override
  String get aboutDmxPainterRx => 'RX';

  @override
  String get aboutDmxPainterIgmpNote =>
      'Zonder IGMP: overstroming\nMet IGMP: alleen abonneepoorten';

  @override
  String get aboutDmxPainterConsole => 'TROOSTEN';

  @override
  String get aboutDmxPainterFix1 => 'FIX 1';

  @override
  String get aboutDmxPainterFix2 => 'FIX 2';

  @override
  String get aboutDmxPainterFix3 => 'FIX 3';

  @override
  String get aboutElectricitePageTitle => 'Elektrisch — veldreferenties';

  @override
  String get elecSection1Title => '1) Basis (W, A, V, kW)';

  @override
  String get elecSection1FormulasTitle => '3 handige formules';

  @override
  String get elecSection1Formula1 => 'P(W) = U(V) × I(A)';

  @override
  String get elecSection1Formula2 => 'I(A) = P(W)/U(V)';

  @override
  String get elecSection1Formula3 => 'P(kW) = P(W)/1000';

  @override
  String get elecSection1FieldMarksTitle => 'Veldbenchmarks';

  @override
  String get elecSection1FieldMark1 =>
      'Mono 230V: 16A ≈ 3,7 kW | 32A ≈ 7,4 kW | 63A ≈ 14,5 kW';

  @override
  String get elecSection1FieldMark2 =>
      'Tri 400V: 16A ≈ 11 kW | 32A ≈ 22 kW | 63A ≈ 44 kW';

  @override
  String get elecSection2Title => '2) Connectoren (Schuko / P17 / PowerCON)';

  @override
  String get elecSection2SchukoTitle => 'Schuko (huishoudelijke stopcontacten)';

  @override
  String get elecSection2SchukoBullet1 =>
      'Normaal gesproken maximaal 16 A (≈ 3,7 kW bij 230 V).';

  @override
  String get elecSection2SchukoBullet2 =>
      'Wees voorzichtig met stopcontacten en verlengsnoeren: mogelijke oververhitting.';

  @override
  String get elecSection2P17Title => 'P17 / CEE (blauw/rood)';

  @override
  String get elecSection2P17Bullet1 =>
      'Blauw: 230V mono (camping, kleine distro).';

  @override
  String get elecSection2P17Bullet2 =>
      'Rood: 400V tri (distro, hoge vermogens).';

  @override
  String get elecSection2PowerconTitle => 'PowerCON (audio/verlichting)';

  @override
  String get elecSection2PowerconBullet1 =>
      'PowerCON TRUE1 = plus “veld” (vergrendelend, IP).';

  @override
  String get elecSection2PowerconBullet2 =>
      'Controleer de kabeldoorsnede en beveiligingen.';

  @override
  String get elecSection3Title => '3) Mono / Tri (wat verandert er)';

  @override
  String get elecSection3Paragraph =>
      'Mono = één fase + neutraal (230V). Tri = 3 fasen (400V tussen fasen).';

  @override
  String get elecSection3PitfallsTitle => 'Veelvoorkomende valkuilen';

  @override
  String get elecSection3Pitfall1 => 'Fase-onbalans (één fase-overbelasting).';

  @override
  String get elecSection3Pitfall2 =>
      'Neutraal die opwarmt bij grote harmonischen (LED, dimmers).';

  @override
  String get elecSection3Pitfall3 =>
      'Land afwezig/twijfelachtig op sommige sites.';

  @override
  String get elecSection3MethodTitle => 'Eenvoudige methode';

  @override
  String get elecSection3MethodBullet1 =>
      'Verdeel grote ladingen over L1/L2/L3.';

  @override
  String get elecSection3MethodBullet2 =>
      'Monitor neutraal als er veel LED\'s zijn.';

  @override
  String get elecSection3MethodBullet3 => 'Meet indien mogelijk met een klem.';

  @override
  String get elecSection4Title => '4) Snelle tafel (16A → 400A)';

  @override
  String get elecSection4MonoTitle => 'Mono 230V (≈ U×I)';

  @override
  String get elecSection4MonoCode =>
      '16A ≈ 3,7 kW\n32A ≈ 7,4 kW\n63A ≈ 14,5 kW\n125A ≈ 28,8 kW\n200A ≈ 46 kW';

  @override
  String get elecSection4TriTitle => 'Tri 400V (≈ √3×U×I)';

  @override
  String get elecSection4TriCode =>
      '16A ≈ 11 kW\n32A ≈ 22 kW\n63A ≈ 44 kW\n125A ≈ 86 kW\n200A ≈ 138 kW\n400A ≈ 277 kW';

  @override
  String get elecSection4ImportantTitle => 'Belangrijk';

  @override
  String get elecSection4ImportantBullet1 =>
      'Dit zijn ordes van grootte (cosφ, harmonischen, verliezen).';

  @override
  String get elecSection4ImportantBullet2 =>
      'Valideer altijd de beveiligingen + secties + temperatuur.';

  @override
  String get elecSection5Title => '6) Beveiliging en veldvallen';

  @override
  String get elecSection5DontDoTitle => 'Wat je niet moet doen';

  @override
  String get elecSection5DontDoBullet1 =>
      'Chainer stekkerdozen / verlengsnoeren in bulk.';

  @override
  String get elecSection5DontDoBullet2 => 'Fasen mengen zonder het te weten.';

  @override
  String get elecSection5DontDoBullet3 => '“Bridger” een twijfelachtig land.';

  @override
  String get elecSection5WarningTitle => 'Waarschuwingsborden';

  @override
  String get elecSection5WarningBullet1 =>
      'Hete geur, lauwe shots, herhaalde triggering.';

  @override
  String get elecSection5WarningBullet2 => 'Spanning daalt (bruin-out).';

  @override
  String get elecSection5WarningBullet3 =>
      '“Moe” of ongeschikte stroomonderbreker.';

  @override
  String get elecSection6Title => '6) Controlelijst';

  @override
  String get elecSection6QuickTitle => 'Snel';

  @override
  String get elecSection6Bullet1 =>
      'Type voeding beschikbaar (mono/tri) + vermogen (A).';

  @override
  String get elecSection6Bullet2 => 'Faseverdeling (hoofdbelastingen).';

  @override
  String get elecSection6Bullet3 => 'Beveiligingen (diff/disj) en tabelstatus.';

  @override
  String get elecSection6Bullet4 =>
      'Kabels: doorsnede / lengte / temperatuurstijging.';

  @override
  String get elecSection6Bullet5 => 'Aarde: Oké? (tester indien mogelijk).';

  @override
  String get elecFooterNote =>
      'Let op: deze inhoud is een veldgeheugenhulpmiddel. Op een echte site respecteert u altijd de normen, de regelgeving van de plaats en de geldende beschermingen.';

  @override
  String get infoPageTitle => 'IT — veldbenchmarks';

  @override
  String get infoUsbTitle => '1) USB/USB-C/Thunderbolt';

  @override
  String get infoStorageTitle => '2) Opslag (SATA/NVMe/SSD)';

  @override
  String get infoVideoLinksTitle => '3) Video-aansluitingen (DP / HDMI)';

  @override
  String get infoPcieGpuTitle => '4) PCIe/GPU (benchmarks)';

  @override
  String get infoChecklistTitle => '5) Controlelijst (lade)';

  @override
  String get infoSummaryCopy =>
      'INFO — veldmarkeringen\n• USB-C = vorm, niet snelheid: controleer de standaard.\n• NVMe (M.2) veel sneller dan SATA.\n• DisplayPort/HDMI = standaarden, let op versies/kabels.\n• Op videoservers: opslag + GPU + doorvoer vormen de basis.';

  @override
  String get infoChecklistCopy =>
      'INFO — Controlelijst\n☐ Gecertificeerde USB-C-kabels (data/video indien nodig)\n☐ Aangepaste opslag (NVMe bij grote stroom)\n☐ Stabiele GPU-stuurprogramma\'s (bekende versie)\n☐ Echte resolutie/FPS-test\n☐ Vermijd goedkope adapters';

  @override
  String get infoUsbCriticalTitle => 'Kritisch punt';

  @override
  String get infoUsbCriticalBullet1 =>
      'USB-C = connector (vorm). Er staat geen snelheid.';

  @override
  String get infoUsbCriticalBullet2 =>
      'Een USB-C-kabel kan ‘alleen opladen’ zijn en geen gegevens/video doorgeven.';

  @override
  String get infoUsbSpeedTitle => 'Snelheidsbenchmarks (orde van grootte)';

  @override
  String get infoUsbSpeedBullet1 =>
      'USB 2.0: langzaam (toetsenborden, dongles, kleine apparaten).';

  @override
  String get infoUsbSpeedBullet2 =>
      'USB 3.x: veel sneller (schijven, interfaces).';

  @override
  String get infoUsbSpeedBullet3 =>
      'USB4 / Thunderbolt: zeer hoge snelheid (dock, eGPU, video afhankelijk van hardware).';

  @override
  String get infoUsbParagraph =>
      'In beeld: als een apparaat \"fout gaat\", vermoed dan de kabel (kwaliteit/standaard) vóór het apparaat.';

  @override
  String get infoStorageSataNvmeTitle => 'SATA versus NVMe';

  @override
  String get infoStorageSataNvmeBullet1 =>
      'SATA SSD: goed en stabiel, maar beperkt (oude interface).';

  @override
  String get infoStorageSataNvmeBullet2 =>
      'NVMe SSD (M.2): veel sneller (ideaal voor mediaservers, grote bestanden).';

  @override
  String get infoStorageFieldTitle => 'Video-terrein';

  @override
  String get infoStorageFieldBullet1 =>
      'Weergave van grote bestanden 4K/ProRes → NVMe aanbevolen.';

  @override
  String get infoStorageFieldBullet2 =>
      'Wees voorzichtig met de temperatuur: een NVMe kan gas geven (vertragen) als hij heet wordt.';

  @override
  String get infoStorageFieldBullet3 =>
      'Test altijd vóór de show in reële omstandigheden.';

  @override
  String get infoVideoLinksImportantTitle => 'Belangrijk herkenningspunt';

  @override
  String get infoVideoLinksImportantBullet1 =>
      'Versies tellen: kabel + poort + apparaat moeten compatibel zijn.';

  @override
  String get infoVideoLinksImportantBullet2 =>
      'Lange afstand = actieve/glasvezelconverters vaak vereist.';

  @override
  String get infoVideoLinksCompareTitle =>
      'DP versus HDMI (zeer vereenvoudigd)';

  @override
  String get infoVideoLinksCompareBullet1 =>
      'HDMI: alomtegenwoordig (TV, processors), maar EDID/HDCP kan in de weg zitten.';

  @override
  String get infoVideoLinksCompareBullet2 =>
      'DisplayPort: een veel voorkomende pc, vaak zeer “in staat” tot doorvoer.';

  @override
  String get infoPcieGpuParagraph =>
      'Voor video-/kaartservers: GPU + bus + stuurprogramma\'s = stabiliteit. Typische problemen: stuurprogramma\'s, kabels, conversie en uitvoerbeperkingen.';

  @override
  String get infoPcieGpuFieldTitle => 'Grond';

  @override
  String get infoPcieGpuFieldBullet1 =>
      'Blokkeer een stabiele driverversie vóór een grote show.';

  @override
  String get infoPcieGpuFieldBullet2 => 'Vermijd “goedkope” adapters.';

  @override
  String get infoPcieGpuFieldBullet3 =>
      'Test met werkelijke showresolutie/FPS.';

  @override
  String get infoChecklistQuickTitle => 'Snel';

  @override
  String get infoChecklistBullet1 => 'Juiste kabel/standaard.';

  @override
  String get infoChecklistBullet2 => 'Opslag aangepast aan de stroom.';

  @override
  String get infoChecklistBullet3 => 'Stabiele chauffeurs.';

  @override
  String get infoChecklistBullet4 => 'Echte test vóór de show.';

  @override
  String get infoChecklistBullet5 => 'Vermijd goedkope adapters.';

  @override
  String get infoFooterNote =>
      'Indicatieve informatie (terrein). De exacte mogelijkheden variëren per hardware/versie.\nDoel: eenvoudige benchmarks + betrouwbare methode.';

  @override
  String get ipBasicsPageTitle => 'Netwerk — IP-bases/masker/DHCP (essentieel)';

  @override
  String get ipBasicsCopyMemoTooltip => 'Memo kopiëren';

  @override
  String get ipBasicsCopyChecklistTooltip => 'Controlelijst kopiëren';

  @override
  String get ipBasicsMemo1 =>
      'IP = logisch adres om een ​​apparaat op een netwerk te bereiken.';

  @override
  String get ipBasicsMemo2 =>
      'Privé (LAN): 10.x.x.x, 172.16–31.x.x, 192.168.x.x (niet gerouteerd via internet).';

  @override
  String get ipBasicsMemo3 =>
      'Masker/subnet = zegt welk deel \"netwerk\" versus \"machine\" is.';

  @override
  String get ipBasicsMemo4 =>
      'Hetzelfde subnet = directe communicatie. Anders → gateway (router).';

  @override
  String get ipBasicsMemo5 =>
      'DHCP wijst IP automatisch toe; statisch = nuttig voor knooppunten/console.';

  @override
  String get ipBasicsToc1 => '1) Wat is een IP en waar dient het voor?';

  @override
  String get ipBasicsToc2 => '2) Waarom 192.x / 10.x / 172.x? (privéadressen)';

  @override
  String get ipBasicsToc3 => '3) Maskers en subnetten: begrijp het echt';

  @override
  String get ipBasicsToc4 => '4) DHCP, gateway, DNS: wie doet wat?';

  @override
  String get ipBasicsToc5 =>
      '5) Hoe twee apparaten met elkaar praten (LAN vs. off-LAN)';

  @override
  String get ipBasicsToc6 =>
      '6) Eenvoudige “show” IP-plannen (voorbeelden die klaar zijn om te kopiëren)';

  @override
  String get ipBasicsToc7 =>
      '7) Probleemoplossing: symptomen → oorzaken (veldmethode)';

  @override
  String get ipBasicsToc8 =>
      '8) Mini-oefeningen (snel een masker/netwerk controleren)';

  @override
  String get ipBasicsToc9 => '9) Snelle checklist';

  @override
  String get ipBasicsSection1Paragraph =>
      'Een IP-adres (IPv4) is een logische identificatie op een netwerk. Hiermee kunt u zeggen: \"stuur dit pakket naar dit apparaat\".\n\nWanneer u een console, een Art-Net/sACN knooppunt, een pc, een beheerde switch aansluit... moet alles wat op het netwerk spreekt een consistent IP-adres hebben zodat de apparaten elkaar kunnen vinden.';

  @override
  String get ipBasicsSection1CalloutTitle => 'Mentaal beeld';

  @override
  String get ipBasicsSection1Bullet1 =>
      'MAC = hardware-identificatie (netwerkkaart).';

  @override
  String get ipBasicsSection1Bullet2 =>
      'IP = “postadres” op een netwerk (wijzigbaar).';

  @override
  String get ipBasicsSection1Bullet3 =>
      'Masker = \"district / postcode\" (begrenst het subnet).';

  @override
  String get ipBasicsSection1Bullet4 => 'Gateway = “buurtuitgang” (router).';

  @override
  String get ipBasicsSection1Subtitle => 'IPv4 in 10 seconden';

  @override
  String get ipBasicsSection1SubBullet1 =>
      'Formaat: ABCD (4 cijfers van 0 tot 255).';

  @override
  String get ipBasicsSection1SubBullet2 => 'Bijvoorbeeld: 192.168.0.50';

  @override
  String get ipBasicsSection1SubBullet3 =>
      'Het is geen magie: ze zijn 32 bits (4 bytes).';

  @override
  String get ipBasicsSection1SubBullet4 =>
      'Wat voor u belangrijk is: IP + masker moeten consistent zijn tussen apparaten.';

  @override
  String get ipBasicsSection2Paragraph =>
      'Bepaalde IPv4-adresbereiken zijn gereserveerd voor particuliere netwerken (LAN). Ze worden niet via internet gerouteerd. Dit is de reden waarom we ze gebruiken in shows: u kunt uw lokale netwerk creëren zonder openbare IP\'s te \"consumeren\".';

  @override
  String get ipBasicsSection2CalloutTitle => 'De 3 grote privéstranden (LAN)';

  @override
  String get ipBasicsSection2Bullet1 =>
      '10.0.0.0 → 10.255.255.255 (vaak geschreven \"10.x.x.x\")';

  @override
  String get ipBasicsSection2Bullet2 =>
      '172.16.0.0 → 172.31.255.255 (vaak \"172.16–31.x.x\")';

  @override
  String get ipBasicsSection2Bullet3 =>
      '192.168.0.0 → 192.168.255.255 (vaak \"192.168.x.x\")';

  @override
  String get ipBasicsSection2Subtitle1 => 'Waarom zien we vaak 192.168.x.x?';

  @override
  String get ipBasicsSection2SubBullet1 =>
      'Consumentenboxen/routers gebruiken vaak 192.168.0.x of 192.168.1.x.';

  @override
  String get ipBasicsSection2SubBullet2 =>
      'Het is een \"de facto standaard\" geworden in kleine LAN\'s.';

  @override
  String get ipBasicsSection2SubBullet3 =>
      'Maar in de praktijk is 10.x.x.x handig als u veel adressen of meerdere VLAN\'s wilt.';

  @override
  String get ipBasicsSection2Subtitle2 => 'En de beroemde 2.x.x.x (Art-Net)?';

  @override
  String get ipBasicsSection2SubBullet4 =>
      'Veel Art-Net hardware verlaat de fabriek met een 2.x.x.x IP (gesloten netwerk).';

  @override
  String get ipBasicsSection2SubBullet5 =>
      'Het is \"praktisch\" in plug&play (zonder DHCP), maar het is verrassend als je pc in 192.168.x.x staat.';

  @override
  String get ipBasicsSection2SubBullet6 =>
      'Belangrijk: \"2.x\" is geen magie voor uitzending/unicast.';

  @override
  String get ipBasicsSection2SubBullet7 =>
      'Wat de reikwijdte van de uitzending verandert, is het masker (vaak /8 = 255.0.0.0 in de oude versie).';

  @override
  String get ipBasicsSection2SubBullet8 =>
      'Voorbeeld: netwerk 2.0.0.0/8 → uitzending = 2.255.255.255 (zeer breed).';

  @override
  String get ipBasicsSection2SubBullet9 =>
      'Eenvoudige oplossing: plaats pc/console in hetzelfde bereik + hetzelfde masker, of configureer het knooppunt opnieuw op een 192/10-abonnement.';

  @override
  String get ipBasicsSection3Paragraph =>
      'Het subnetmasker geeft aan welke adressen zich \"in hetzelfde netwerk\" bevinden. Zonder masker betekent een IP niet veel.\n\nVeldregel: als twee apparaten zich in hetzelfde subnet bevinden, praten ze rechtstreeks met elkaar. Anders hebben ze een gateway (router) nodig.';

  @override
  String get ipBasicsSection3Callout1Title => 'Meest voorkomende maskers';

  @override
  String get ipBasicsSection3Bullet1 =>
      '255.0.0.0 ( /8 ) → typisch “breed” 10.x.x.x-netwerk';

  @override
  String get ipBasicsSection3Bullet2 =>
      '255.255.0.0 ( /16 ) → netwerk 10.10.x.x of 192.168.x.x \"breed\"';

  @override
  String get ipBasicsSection3Bullet3 =>
      '255.255.255.0 ( /24 ) → 192.168.0.x “klassiek” netwerk (254 apparaten)';

  @override
  String get ipBasicsSection3Callout2Title =>
      'Masker → uitzendadres (erg handig om te begrijpen)';

  @override
  String get ipBasicsSection3Bullet4 =>
      'De uitzending is afhankelijk van het subnet en dus van het masker (geen \"2 vs 192\").';

  @override
  String get ipBasicsSection3Bullet5 =>
      '192.168.10.0/24 → uitzending = 192.168.10.255 (klein netwerk).';

  @override
  String get ipBasicsSection3Bullet6 =>
      '2.0.0.0/8 (255.0.0.0) → uitzending = 2.255.255.255 (groot netwerk).';

  @override
  String get ipBasicsSection3Bullet7 =>
      'Hoe “groter” het netwerk, hoe meer ruis een uitzending kan maken (als je deze vaak gebruikt).';

  @override
  String get ipBasicsSection3Subtitle1 =>
      'Concreet voorbeeld (meest bruikbaar): /24';

  @override
  String get ipBasicsSection3SubBullet1 => 'IP-adres: 192.168.0.50';

  @override
  String get ipBasicsSection3SubBullet2 => 'Masker: 255.255.255.0 ( /24 )';

  @override
  String get ipBasicsSection3SubBullet3 => 'Netwerk: 192.168.0.0';

  @override
  String get ipBasicsSection3SubBullet4 =>
      'Apparaten “in hetzelfde netwerk”: 192.168.0.1 → 192.168.0.254';

  @override
  String get ipBasicsSection3SubBullet5 =>
      'Als je naar 192.168.1.50 gaat → is het NIET MEER hetzelfde netwerk.';

  @override
  String get ipBasicsSection3Subtitle2 => 'Waarom subnetwerken maken?';

  @override
  String get ipBasicsSection3SubBullet6 =>
      'Organisatie: apart “licht”, “video”, “intercom”, “internet”…';

  @override
  String get ipBasicsSection3SubBullet7 =>
      'Prestaties: beperk ruis (broadcast/multicast) tot een groep.';

  @override
  String get ipBasicsSection3SubBullet8 =>
      'Beveiliging: voorkom dat een “gast”-pc het shownetwerk kan zien/onderbreken.';

  @override
  String get ipBasicsSection3SubBullet9 =>
      'Diagnose: gemakkelijker om te weten “waar” een apparaat is.';

  @override
  String get ipBasicsSection3Callout3Title => 'Klassieke val';

  @override
  String get ipBasicsSection3Bullet8 =>
      'Zelfde \"start\" van IP ≠ hetzelfde netwerk als het masker niet identiek is.';

  @override
  String get ipBasicsSection3Bullet9 =>
      'Bijvoorbeeld: 10.0.0.5/8 en 10.0.0.200/24 ​​→ niet dezelfde logische perimeter.';

  @override
  String get ipBasicsSection4Subtitle1 => 'DHCP (automatische toewijzing)';

  @override
  String get ipBasicsSection4SubBullet1 =>
      'Een DHCP-server \"geeft\": IP + masker + gateway + DNS.';

  @override
  String get ipBasicsSection4SubBullet2 =>
      'Praktisch: je steekt de stekker in het stopcontact en het werkt.';

  @override
  String get ipBasicsSection4SubBullet3 =>
      'Risico tonen: als DHCP wegvalt/ verandert/conflict → vreemde symptomen.';

  @override
  String get ipBasicsSection4Subtitle2 => 'Statisch (vast IP)';

  @override
  String get ipBasicsSection4SubBullet4 =>
      'U definieert IP + masker (en eventueel gateway/DNS).';

  @override
  String get ipBasicsSection4SubBullet5 =>
      'Zeer handig voor: console, knooppunten, beheerde switch, AP Wi-Fi-show.';

  @override
  String get ipBasicsSection4SubBullet6 =>
      'Risico: dubbele IP als plan onduidelijk is (conflict).';

  @override
  String get ipBasicsSection4Callout1Title => 'Poort';

  @override
  String get ipBasicsSection4Bullet1 =>
      'Dit is het adres van de router: het wordt gebruikt om “buiten het lokale netwerk” te gaan.';

  @override
  String get ipBasicsSection4Bullet2 =>
      'Als je een geïsoleerd shownetwerk maakt (zonder internet) → gateway vaak nutteloos.';

  @override
  String get ipBasicsSection4Bullet3 =>
      'Maar als je naar een ander VLAN / internet wilt gaan → essentieel.';

  @override
  String get ipBasicsSection4Callout2Title => 'DNS';

  @override
  String get ipBasicsSection4Bullet4 =>
      'DNS = \"directory\": transformeert een naam (bijvoorbeeld: voorbeeld.com) in een IP.';

  @override
  String get ipBasicsSection4Bullet5 =>
      'In show (Art-Net/sACN), vaak nutteloos: je werkt in directe IP.';

  @override
  String get ipBasicsSection4Bullet6 =>
      'Als u services gebruikt (UPDATE, licenties, tijdserver, streaming) → DNS wordt weer nuttig.';

  @override
  String get ipBasicsSection4Subtitle3 =>
      'Eenvoudige regel (beginnersvriendelijk)';

  @override
  String get ipBasicsSection4SubBullet7 =>
      'Kleine gesloten show: overal statisch, geen gateway, geen DNS.';

  @override
  String get ipBasicsSection4SubBullet8 =>
      'Show met internet / meerdere netwerken: DHCP-gestuurd + DHCP-reserveringen, of statisch plan + router.';

  @override
  String get ipBasicsSection5Paragraph =>
      'Als A met B wil praten, kijkt hij naar het masker:\n• Als B zich in hetzelfde subnet bevindt → A verzendt rechtstreeks naar het lokale netwerk.\n• Als B zich buiten het subnet bevindt → A verzendt naar de gateway (router), die voor de rest zorgt.';

  @override
  String get ipBasicsSection5Callout1Title => 'Voorbeeld (makkelijk)';

  @override
  String get ipBasicsSection5Bullet1 => 'EEN = 192,168,0,10/24';

  @override
  String get ipBasicsSection5Bullet2 =>
      'B = 192.168.0.50 /24 → hetzelfde netwerk → OK direct.';

  @override
  String get ipBasicsSection5Bullet3 =>
      'B = 192.168.1.50 /24 → ander netwerk → router/gateway nodig.';

  @override
  String get ipBasicsSection5Subtitle => 'Waarom pingt het niet?';

  @override
  String get ipBasicsSection5SubBullet1 =>
      'Ander masker → A denkt dat B “elders” is (of andersom).';

  @override
  String get ipBasicsSection5SubBullet2 =>
      'Geen gateway → kan het subnet niet verlaten.';

  @override
  String get ipBasicsSection5SubBullet3 =>
      'PC-firewall → ping geblokkeerd (Windows zeer gebruikelijk).';

  @override
  String get ipBasicsSection5SubBullet4 =>
      'Kabel/switch/VLAN: fysiek niet in hetzelfde segment.';

  @override
  String get ipBasicsSection5Callout2Title =>
      'Uitzending versus unicast (nuttige bonus)';

  @override
  String get ipBasicsSection5Bullet4 =>
      'Unicast: naar een specifiek (eigen) IP.';

  @override
  String get ipBasicsSection5Bullet5 =>
      'Uitzending: \"naar iedereen\" op het subnet (luidruchtig).';

  @override
  String get ipBasicsSection5Bullet6 =>
      'In de show: uitzending kan op kleine schaal werken, maar wordt al snel een bron van ruis op een groot netwerk.';

  @override
  String get ipBasicsSection6Subtitle1 =>
      'Plan A — ultraeenvoudig (één netwerk/24)';

  @override
  String get ipBasicsSection6Code1 =>
      'Netwerk: 192.168.10.0/24 (masker 255.255.255.0)\n\nConsole: 192.168.10.10\nPC (besturing): 192.168.10.20\nKnooppunt 1: 192.168.10.101\nKnooppunt 2: 192.168.10.102\nBeheerde schakelaar: 192.168.10.2\nGateway: (leeg) of 192.168.10.1 indien router aanwezig';

  @override
  String get ipBasicsSection6Callout1Title => 'Waarom werkt het goed';

  @override
  String get ipBasicsSection6Bullet1 =>
      'Iedereen in hetzelfde subnet → geen verrassingen.';

  @override
  String get ipBasicsSection6Bullet2 =>
      'Makkelijk uit te leggen, makkelijk op te lossen.';

  @override
  String get ipBasicsSection6Bullet3 =>
      'Ideale beginners/kleine tot middelgrote show.';

  @override
  String get ipBasicsSection6Subtitle2 => 'Plan B – “10.x” als je wilt groeien';

  @override
  String get ipBasicsSection6Code2 =>
      'Netwerk: 10.10.0.0/16 (masker 255.255.0.0)\n\nConsole: 10.10.0.10\nPC: 10.10.0.20\nKnooppunten: 10.10.1.10 → 10.10.1.200\nSchakelaar: 10.10.0.2';

  @override
  String get ipBasicsSection6Callout2Title => 'Wanneer moet u het gebruiken?';

  @override
  String get ipBasicsSection6Bullet4 =>
      'Wanneer u veel apparatuur heeft (of meerdere zones).';

  @override
  String get ipBasicsSection6Bullet5 =>
      'Wanneer u VLAN later plant (light/video/IT).';

  @override
  String get ipBasicsSection6Subtitle3 =>
      'Plan C — compatibel Art-Net \"2.x.x.x\" (verouderd)';

  @override
  String get ipBasicsSection6Code3 =>
      'Netwerk: 2.0.0.0/8 (masker 255.0.0.0)\n\nPC/console: 2.0.0.10\nKnooppunt 1: 2.0.0.100\nKnooppunt 2: 2.0.0.101\n\n⚠️ Geïsoleerd netwerk, geen internet, geen routing.';

  @override
  String get ipBasicsSection6Callout3Title => 'Aandacht';

  @override
  String get ipBasicsSection6Bullet6 =>
      'Dit plan is praktisch voor oude/standaardhardware.';

  @override
  String get ipBasicsSection6Bullet7 =>
      'Maar vermijd het mengen met een \"normaal\" LAN (192.168.x.x) zonder router.';

  @override
  String get ipBasicsSection7Callout1Title =>
      'Symptomen → waarschijnlijke oorzaken';

  @override
  String get ipBasicsSection7Bullet1 =>
      '“Ik zie het knooppunt, maar het reageert niet” → ander masker / VLAN / firewall.';

  @override
  String get ipBasicsSection7Bullet2 =>
      '“Een apparaat werkt en verdwijnt dan” → Onstabiel DHCP / IP-conflict.';

  @override
  String get ipBasicsSection7Bullet3 =>
      '“Niets werkt behalve op de switch” → IP niet in hetzelfde netwerk / verkeerde kabel / VLAN-poort.';

  @override
  String get ipBasicsSection7Bullet4 =>
      '“Alle rijen / verliezen” → uitzending/multicast te breed / low-end switch / netwerklus.';

  @override
  String get ipBasicsSection7Bullet5 =>
      '“Het werkt bedraad, maar geen Wi-Fi” → jitter / roaming / verzadigde band / energiebesparing.';

  @override
  String get ipBasicsSection7Subtitle => 'Professionele werkwijze in 5 minuten';

  @override
  String get ipBasicsSection7SubBullet1 =>
      '1) Kijk naar IP + console/PC en knooppuntmasker.';

  @override
  String get ipBasicsSection7SubBullet2 =>
      '2) Controleer: hetzelfde subnet? (bijvoorbeeld: 192.168.10.x /24)';

  @override
  String get ipBasicsSection7SubBullet3 =>
      '3) Ping (indien mogelijk) + toegangstest voor de webinterface van het knooppunt.';

  @override
  String get ipBasicsSection7SubBullet4 =>
      '4) Indien DHCP: vermeld wie welk IP-adres heeft (DHCP-tabel) en controleer op duplicaten.';

  @override
  String get ipBasicsSection7SubBullet5 =>
      '5) Indien sACN multicast: controleer IGMP-snooping/querier (anders flood).';

  @override
  String get ipBasicsSection7Callout2Title => 'Veel voorkomende valstrik';

  @override
  String get ipBasicsSection7Bullet6 =>
      '\"Legacy\"-masker op een pc (255.255.0.0 in plaats van 255.255.255.0).';

  @override
  String get ipBasicsSection7Bullet7 =>
      'Resultaat: u denkt dat u zich \"in hetzelfde netwerk\" bevindt, maar niet zoals het andere apparaat.';

  @override
  String get ipBasicsSection8Subtitle1 =>
      'Oefening 1: zelfde netwerk of niet? (/24)';

  @override
  String get ipBasicsSection8SubBullet1 => 'EEN = 192,168,10,50/24';

  @override
  String get ipBasicsSection8SubBullet2 =>
      'B = 192.168.10.200 /24 → ✅ hetzelfde netwerk';

  @override
  String get ipBasicsSection8SubBullet3 =>
      'B = 192.168.11.200 /24 → ❌ niet hetzelfde netwerk';

  @override
  String get ipBasicsSection8Subtitle2 => 'Oefening 2: /16 (255.255.0.0)';

  @override
  String get ipBasicsSection8SubBullet4 => 'EEN = 10.10.5.10 /16';

  @override
  String get ipBasicsSection8SubBullet5 =>
      'B = 10.10.200.20 /16 → ✅ hetzelfde netwerk (10.10.x.x)';

  @override
  String get ipBasicsSection8SubBullet6 =>
      'B = 10.11.200.20 /16 → ❌ niet hetzelfde netwerk';

  @override
  String get ipBasicsSection8CalloutTitle => 'Visuele tip';

  @override
  String get ipBasicsSection8Bullet1 =>
      '/24 → de eerste 3 identieke cijfers (A.B.C) = hetzelfde netwerk.';

  @override
  String get ipBasicsSection8Bullet2 =>
      '/16 → de eerste 2 identieke nummers (A.B) = hetzelfde netwerk.';

  @override
  String get ipBasicsSection8Bullet3 =>
      '/8 → het 1e identieke nummer (A) = hetzelfde netwerk.';

  @override
  String get ipBasicsSection8Subtitle3 => 'Oefening 3: Vermijd “rare” IP’s';

  @override
  String get ipBasicsSection8SubBullet7 =>
      '0.x.x.x: Gereserveerd (geen normaal host-IP).';

  @override
  String get ipBasicsSection8SubBullet8 => '127.x.x.x: loopback (uw pc zelf).';

  @override
  String get ipBasicsSection8SubBullet9 =>
      '169.254.x.x: auto-IP wanneer DHCP afwezig is (APIPA) → teken van DHCP-probleem.';

  @override
  String get ipBasicsSection9CalloutTitle =>
      'Voordat u tussen 12.00 en 14.00 uur gaat zoeken';

  @override
  String get ipBasicsSection9Bullet1 =>
      'Hetzelfde subnet = consistent IP + masker.';

  @override
  String get ipBasicsSection9Bullet2 => 'Geen dubbele IP\'s (conflict).';

  @override
  String get ipBasicsSection9Bullet3 =>
      'DHCP: OK indien beheerd; verder duidelijk statisch plan.';

  @override
  String get ipBasicsSection9Bullet4 =>
      'PC-firewall: kan ping/detectie blokkeren.';

  @override
  String get ipBasicsSection9Bullet5 =>
      'Switch/VLAN: goede poort, goede VLAN, geen loopback.';

  @override
  String get ipBasicsSection9Bullet6 =>
      'sACN multicast: IGMP-snooping/querier aanbevolen.';

  @override
  String get ipBasicsChecklistCopy =>
      'Netwerk — Snelle checklist (IP)\n☐ Alle apparaten bevinden zich in hetzelfde subnet (consistent IP + masker)\n☐ Geen dubbel IP-adres (conflict)\n☐ DHCP: iedereen in DHCP, of een duidelijk statisch plan (voorkom wazige vermenging)\n☐ Voor Art-Net/sACN: speciaal netwerk of VLAN, indien mogelijk\n☐ Switch beheerd als multicast/IGMP (sACN)\n☐ Wi-Fi: vermijd kritieke datashows (jitter), geef de voorkeur aan bekabeld\n☐ Eenvoudige test: ping + controleer masker/gateway';

  @override
  String get ipBasicsFooterNote =>
      'Doel: voldoende begrijpen om snel bedrading/configuratie/problemen op te lossen in de show.\nNetwerkdetails kunnen dieper gaan, maar deze basisprincipes dekken 90% van de veldfouten.';

  @override
  String get aboutDmxPainterTerm120 => 'TERMIJN\n120Ω';

  @override
  String get aboutDmxPainterDaisyChainNote => '✅ Daisychain\n❌ Geen passieve Y';

  @override
  String get aboutDmxPainterXlr5Title => 'XLR5 (DMX) — snelle keu';

  @override
  String get aboutDmxPainterPin1 => 'Pin 1: Schild/massa';

  @override
  String get aboutDmxPainterPin2 => 'Pin 2: Gegevens−';

  @override
  String get aboutDmxPainterPin3 => 'Pin 3: Gegevens+';

  @override
  String get aboutDmxPainterPin45 => 'Pin 4/5: “data 2” (zeldzaam / optioneel)';

  @override
  String get aboutDmxPainterXlr3Practice =>
      'In de praktijk: XLR3 vaak gebruikt (1/2/3)';

  @override
  String get aboutDmxPainterLastFixture => 'NIEUWSTE\nAPPARAAT';

  @override
  String get aboutDmxPainterTerminationLine =>
      'Afsluiting = 120Ω aan einde van de lijn';

  @override
  String get aboutDmxPainter120Between => '120Ω\ntussen\nData− en Data+';

  @override
  String get aboutDmxPainterOneTermination =>
      '✅ Slechts één einde\n❌Niet in het midden\n❌Niet op elk filiaal';

  @override
  String get aboutDmxPainterConsoleIp => 'CONSOLE\nArt-Net / sACN';

  @override
  String get aboutDmxPainterSwitchSacn => 'SCHAKEL\n(IGMP voor sACN)';

  @override
  String get aboutDmxPainterNode1 => 'Knooppunt 1\nDMX UIT';

  @override
  String get aboutDmxPainterNode2 => 'Knooppunt 2\nDMX UIT';

  @override
  String get aboutDmxPainterFix => 'REPAREREN';

  @override
  String get aboutDmxPainterManyUniverses =>
      '✅ Veel universums\n✅ Knooppunten dichtbij machines';

  @override
  String get aboutArtnetSection2Paragraph =>
      'Jouw doel: dat elk universum dat door de bron wordt uitgezonden, zonder dubbelzinnigheid bij het juiste knooppunt (en de juiste poort DMX) aankomt. De meeste Art-Net-fouten = slecht universum, slecht subnet/net of verzadigende uitzending.';

  @override
  String get aboutArtnetSection2CalloutTitle =>
      'Eenvoudige methode (die 80% van de fouten vermijdt)';

  @override
  String get aboutArtnetSection2Bullet1 =>
      '1) Schrijf op papier: “Universum 1 → Knooppunt A poort 1”, “Universum 2 → Knooppunt A poort 2”, enz.';

  @override
  String get aboutArtnetSection2Bullet2 =>
      '2) Stel stabiele IP\'s in (DHCP gereserveerd of statisch).';

  @override
  String get aboutArtnetSection2Bullet3 =>
      '3) Geef de voorkeur aan unicast als u meer dan één knooppunt of een gedeeld netwerk heeft.';

  @override
  String get aboutArtnetSection2Subtitle1 => 'Uitzending versus Unicast';

  @override
  String get aboutArtnetSection2SubBullet1 =>
      'Broadcast: je stuurt naar iedereen → makkelijk maar kan een schakelaar ‘overspoelen’.';

  @override
  String get aboutArtnetSection2SubBullet2 =>
      'Unicast: u verzendt naar het IP-adres van het knooppunt → schoner en voorspelbaar.';

  @override
  String get aboutArtnetSection2SubBullet3 => 'In show: bij twijfel → unicast.';

  @override
  String get aboutArtnetSection2Subtitle2 => 'Universe: praktijk in het veld';

  @override
  String get aboutArtnetSection2SubBullet4 =>
      'Houd de nummering eenvoudig (bijvoorbeeld: 1…N).';

  @override
  String get aboutArtnetSection2SubBullet5 =>
      'Vermijd “één universum overal”: documenteer uw mappings.';

  @override
  String get aboutArtnetSection2SubBullet6 =>
      'Bij bepaalde opstellingen bestaat er \"Net/Subnet/Universe\": denk aan \"mapping\", niet aan \"magie\".';

  @override
  String get aboutArtnetSection3CalloutTitle =>
      'De “echte” limieten (in volgorde)';

  @override
  String get aboutArtnetSection3Bullet1 =>
      'Wi-Fi: variabele latentie + verliezen → flikkeringen of uitval.';

  @override
  String get aboutArtnetSection3Bullet2 =>
      'Broadcast: overbelast een LAN (iedereen ontvangt alles).';

  @override
  String get aboutArtnetSection3Bullet3 =>
      '“Low-end”-schakelaar: beperkte buffers, slecht multicast/broadcast-beheer.';

  @override
  String get aboutArtnetSection3Bullet4 =>
      'Knooppunten: firmware/CPU-limiet (aantal universums, frequentie, opties).';

  @override
  String get aboutArtnetSection3Bullet5 =>
      'PC/bron: stuurprogramma, CPU-belasting, antivirus, netwerkkaart, enz.';

  @override
  String get aboutArtnetSection3Subtitle1 => 'Vernieuwingssnelheid';

  @override
  String get aboutArtnetSection3SubBullet1 =>
      '\"Klassiek\" DMX is vaak ~20-44 fps, afhankelijk van het frame.';

  @override
  String get aboutArtnetSection3SubBullet2 =>
      'Op IP kun je meer verzenden, maar de knooppunten volgen niet altijd (en het is niet altijd nuttig).';

  @override
  String get aboutArtnetSection3SubBullet3 =>
      'Stabiliteit > frequentie: beter stabiel bij 30-40 fps dan “snel” maar onstabiel.';

  @override
  String get aboutArtnetSection3Subtitle2 => 'Eenvoudige regels';

  @override
  String get aboutArtnetSection3SubBullet4 => 'Speciaal netwerk (of VLAN).';

  @override
  String get aboutArtnetSection3SubBullet5 =>
      'Unicast als er meerdere knooppunten zijn.';

  @override
  String get aboutArtnetSection3SubBullet6 => 'Bedraad voor kritische shows.';

  @override
  String get aboutArtnetSection4Paragraph =>
      'Een knooppunt = IP → DMX. Het kan 1, 2, 4, 8 DMX poorten hebben. De stabiliteit is afhankelijk van het knooppunt EN de DMX-bekabeling aan de uitgangszijde (afsluiting, topologie, splitters).';

  @override
  String get aboutArtnetSection4Subtitle1 => 'Knooppunten versus splitters';

  @override
  String get aboutArtnetSection4SubBullet1 =>
      'Knooppunt: converteert IP →DMX (en soms DMX→IP).';

  @override
  String get aboutArtnetSection4SubBullet2 =>
      'Splitter DMX: verdeelt een DMX lijn in takken (optie aanbevolen).';

  @override
  String get aboutArtnetSection4SubBullet3 =>
      'Goed ontwerp: IP tot het dichtstbijzijnde, dan DMX kort en schoon.';

  @override
  String get aboutArtnetSection4CalloutTitle =>
      'RDM op Art-Net (variabele ondersteuning)';

  @override
  String get aboutArtnetSection4Bullet1 =>
      'Sommige knooppunten ondersteunen een \"RDM-proxy\": de console ziet/configureert RDM-apparaten via IP.';

  @override
  String get aboutArtnetSection4Bullet2 =>
      'Anderen ondersteunen RDM helemaal of gedeeltelijk niet.';

  @override
  String get aboutArtnetSection4Bullet3 =>
      'Een “klassieke” optosplitter kan de RDM-retour blokkeren (afhankelijk van het model).';

  @override
  String get aboutArtnetSection4Bullet4 =>
      'Tip: Als je RDM wilt, kies dan expliciet hardware gemarkeerd met RDM-compatibel.';

  @override
  String get aboutArtnetSection4Subtitle2 => 'Goede veldreflex';

  @override
  String get aboutArtnetSection4SubBullet4 =>
      'Indien DMX instabiel: regel eerst DMX (afsluiting, kabel, passieve Y), daarna alleen IP.';

  @override
  String get aboutArtnetSection4SubBullet5 =>
      'Indien RDM instabiel: schakelt RDM uit om te verifiëren dat pure DMX stabiel is.';

  @override
  String get aboutArtnetSection5CalloutTitle =>
      'Symptomen → waarschijnlijke oorzaken';

  @override
  String get aboutArtnetSection5Bullet1 =>
      'Flikker over het hele bord → Wi-Fi, uitzending overstroming, verzadigde schakelaar.';

  @override
  String get aboutArtnetSection5Bullet2 =>
      'Eén knooppunt OK, het andere nee → universum/mapping, IP, unicast slecht geconfigureerd.';

  @override
  String get aboutArtnetSection5Bullet3 =>
      'Willekeurige uitval → defecte RJ45-kabel, onstabiele schakelaar, pc laat pakketten vallen.';

  @override
  String get aboutArtnetSection5Bullet4 =>
      'Eén enkele DMX poort van een KO-knooppunt → DMX kabel, afsluiting, apparaat dat de lijn verbreekt.';

  @override
  String get aboutArtnetSection5Bullet5 =>
      'RDM-detectie onmogelijk → knooppunt/splitter niet RDM-compatibel, DMX “borderline”-bekabeling.';

  @override
  String get aboutArtnetSection5Subtitle => 'Snelle methode';

  @override
  String get aboutArtnetSection5SubBullet1 =>
      '1) Unicast naar een enkel knooppunt (eenvoudige test).';

  @override
  String get aboutArtnetSection5SubBullet2 =>
      '2) Controleer universum/toewijzing (papier + knooppuntconfiguratie).';

  @override
  String get aboutArtnetSection5SubBullet3 =>
      '3) Directe bekabelde test (PC → schakelaar → knooppunt) met bekende kabel OK.';

  @override
  String get aboutArtnetSection5SubBullet4 =>
      '4) Isoleer de DMX: knooppunt → 1 apparaat + afsluiting.';

  @override
  String get aboutArtnetSection6Subtitle1 =>
      'Schone architectuur (IP → knooppunten → DMX kort)';

  @override
  String get aboutArtnetSection6Subtitle2 => 'Uitzending versus Unicast (idee)';

  @override
  String get aboutArtnetAssetsCopyTitle => 'Aanbevolen items (optioneel)';

  @override
  String get aboutArtnetExampleLabel => 'voorbeeld';

  @override
  String get aboutArtnetAssetsCopyTooltip => 'Kopieer de activalijst';

  @override
  String get aboutArtnetAssetsParagraph =>
      'Sectie bedoeld om het netwerk te illustreren (RJ45, switch, kabels). Als de assets niet bestaan, geeft de app zijn eigen fallback weer.';

  @override
  String get aboutArtnetAssetsExamplesTitle => 'Voorbeelden';

  @override
  String get aboutArtnetAssetsRj45Label => 'RJ45';

  @override
  String get aboutArtnetAssetsRj45Hint => 'Ethernet-aansluiting';

  @override
  String get aboutArtnetAssetsSwitchLabel => 'Schakelaar';

  @override
  String get aboutArtnetAssetsSwitchHint =>
      'Switch (idealiter beheerd als IGMP/VLAN)';

  @override
  String get aboutArtnetAssetsCableLabel => 'Ethernet-kabel';

  @override
  String get aboutArtnetAssetsCableHint => 'Cat5e/Cat6 = betrouwbare basis';

  @override
  String get aboutArtnetChecklistCopyTitle =>
      'Art-Net — Controlelijst ter plaatse';

  @override
  String get aboutArtnetChecklistCopyTooltip => 'Controlelijst kopiëren';

  @override
  String get aboutArtnetChecklistTitle => 'Voordat je in paniek raakt';

  @override
  String get aboutArtnetChecklistBullet1 =>
      'Unicast als er meerdere knooppunten zijn.';

  @override
  String get aboutArtnetChecklistBullet2 =>
      'Een speciaal netwerk (of VLAN) indien mogelijk.';

  @override
  String get aboutArtnetChecklistBullet3 => 'Klaar voor kritische show.';

  @override
  String get aboutArtnetChecklistBullet4 => 'Gedocumenteerd universum/kaarten.';

  @override
  String get aboutArtnetChecklistBullet5 =>
      'Eenvoudige IP-test → 1 knooppunt → 1 apparaat + afsluiting.';

  @override
  String get aboutArtnetChecklistBullet6 =>
      'Indien RDM: “RDM proxy” knooppunt bevestigd + stabiele DMX bekabeling';

  @override
  String get aboutArtnetFooterNote =>
      'Indicatieve informatie (terrein). Afhankelijk van de knooppunten/switch/firmware kan het gedrag variëren.\nDoel hier: snel begrijpen en diagnosticeren.';

  @override
  String get aboutArtnetDiagramSourceLabel => 'BRON\n(PC/console)';

  @override
  String get aboutArtnetDiagramSwitchLabel => 'SCHAKELAAR';

  @override
  String get aboutArtnetDiagramNode1Label => 'Knooppunt 1\nDMX UIT';

  @override
  String get aboutArtnetDiagramNode2Label => 'Knooppunt 2\nDMX UIT';

  @override
  String get aboutArtnetDiagramFixLabel => 'REPAREREN';

  @override
  String get aboutArtnetDiagramInfoLabel => 'Lange IP / korte DMX';

  @override
  String get aboutArtnetDiagramSourceShortLabel => 'BRON';

  @override
  String get aboutArtnetDiagramNodeALabel => 'NODE A';

  @override
  String get aboutArtnetDiagramNodeBLabel => 'NODE B';

  @override
  String get aboutArtnetDiagramNodeCLabel => 'NODE C';

  @override
  String get aboutArtnetDiagramUnicastLabel =>
      'Unicast: pakketten naar een knooppunt';

  @override
  String get aboutArtnetDiagramBroadcastLabel =>
      'Uitzending: iedereen ontvangt';

  @override
  String get aboutArtnetMissingAssetLabel => 'Ontbrekende activa';

  @override
  String get aboutRegistryDmxTitle => 'DMX — bediening (eenvoudig en compleet)';

  @override
  String get aboutRegistryDmxSubtitle =>
      'Universe, adressen, frames, RS-485-bekabeling, afsluiting, veldfouten.\nInclusief diagrammen + checklist.';

  @override
  String get aboutRegistryArtnetTitle =>
      'Art-Net — DMX via IP (knooppunten, unicast/broadcast)';

  @override
  String get aboutRegistryArtnetSubtitle =>
      'Universe DMX op Ethernet/UDP, knooppunten, uitzending versus unicast.\nActuele limieten, netwerkstabiliteit, RDM volgens hardware, diagrammen + checklist.';

  @override
  String get aboutRegistrySacnTitle =>
      'sACN / E1.31 — multicast, IGMP, prioriteiten';

  @override
  String get aboutRegistrySacnSubtitle =>
      'Standaard DMX op IP-georiënteerd professioneel netwerk.\nMulticast/unicast, IGMP-snooping/querier, prioriteiten met meerdere bronnen, schema\'s + checklist.';

  @override
  String get aboutRegistryIpBasicsTitle =>
      'Netwerk — IP-bases/masker/DHCP (essentieel)';

  @override
  String get aboutRegistryIpBasicsSubtitle =>
      'Begrijp IP, masker, gateway, DHCP versus statisch.\nConcrete voorbeelden (2.x.x.x, 10.x, 192.168.x), snelle tests, showtraps.';

  @override
  String get aboutRegistryReseauTitle =>
      'Netwerk — RJ45 / Glasvezel / snelheden en lengtes';

  @override
  String get aboutRegistryReseauSubtitle =>
      'Cat5e → Cat8, OM3/OM4/OS2-vezel, LC/SC/MPO, typische afstanden, best practices worden getoond.';

  @override
  String get aboutRegistryNetworkTitle =>
      'Licht netwerk – VLAN, IGMP, Wi-Fi versus bekabeld';

  @override
  String get aboutRegistryNetworkSubtitle =>
      'Eenvoudige en robuuste architectuur voor Art-Net/sACN.\nVLAN, IGMP snooping/querier, Wi-Fi (jitter), switches, diagrammen + checklist.';

  @override
  String get aboutRegistryVideoTitle => 'Video — SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutRegistryVideoSubtitle =>
      'Kies op basis van latentie, betrouwbaarheid, bekabeling, LAN versus WAN-netwerk.\nTabellen + diagram.';

  @override
  String get aboutRegistryElectriciteTitle =>
      'Elektrisch — Schuko / P17 / bevoegdheden';

  @override
  String get aboutRegistryElectriciteSubtitle =>
      'Connectoren, mono/tri, snelle kW-tafels (16A → 400 A), veldvallen.';

  @override
  String get aboutRegistryInformatiqueTitle =>
      'Computers — USB/HDMI/DP/SATA/NVMe...';

  @override
  String get aboutRegistryInformatiqueSubtitle =>
      'Nuttige snelheden, versies, echte limieten, marketingvalkuilen.';

  @override
  String get aboutUniverseToHexColHex => 'Hex';

  @override
  String get aboutUniverseToHexNote => 'Index = Universum − 1 (basis 0).';

  @override
  String get aboutNetworkPageTitle => 'Licht netwerk — VLAN, IGMP, Wi-Fi';

  @override
  String get aboutNetworkCopyTooltip => 'Kopieer markeringen';

  @override
  String get aboutNetworkChecklistCopyTooltip => 'Kopiëren';

  @override
  String get aboutNetworkChecklistTitle => 'Voordat u Wireshark opent 😄';

  @override
  String get aboutNetworkFooterNote =>
      'Indicatieve informatie (terrein). Afhankelijk van de netwerkhardware is mogelijk IGMP/VLAN vereist.\nDoel: eenvoudig en robuust blijven.';

  @override
  String get aboutNetworkCopy1 =>
      'Lichtnetwerk: eenvoudig, toegewijd en stabiel richten.';

  @override
  String get aboutNetworkCopy2 => 'VLAN = gescheiden verkeer (licht vs. rust).';

  @override
  String get aboutNetworkCopy3 =>
      'IGMP = essentieel als sACN grootschalige multicast.';

  @override
  String get aboutNetworkCopy4 =>
      'Wi-Fi = prima probleemoplossing, zelden ok in kritische productie.';

  @override
  String get aboutNetworkChecklistCopy =>
      'Lichtnetwerk — Controlelijst\n☐ Speciaal netwerk of licht VLAN\n☐ Duidelijk IP-plan (DHCP of statisch) + masker ok\n☐ Juiste schakelaar; lussen vermeden\n☐ sACN multicast: IGMP-spionage AAN\n☐ IGMP-querier aanwezig in het VLAN (indien nodig)\n☐ Unicast bij probleemoplossing (vooral Art-Net)\n☐ Wi-Fi: vermijd kritische productie (jitter/verliezen)\n☐ Tests: stabiele ping + progressieve belasting (universum)';

  @override
  String get aboutNetworkToc1 => '1) Doelstelling: stabiel netwerk';

  @override
  String get aboutNetworkToc2 => '2) IP-abonnement (eenvoudig)';

  @override
  String get aboutNetworkToc3 => '3) VLAN (scheiding)';

  @override
  String get aboutNetworkToc4 => '4) IGMP (sACN multicast)';

  @override
  String get aboutNetworkToc5 => '5) Wi-Fi versus bekabeld';

  @override
  String get aboutNetworkToc6 => '6) Schakelaar: wat je nodig hebt';

  @override
  String get aboutNetworkToc7 => '7) Schema\'s';

  @override
  String get aboutNetworkToc8 => '8) Controlelijst';

  @override
  String get aboutNetworkBasicsPill1 => 'Toegewijd/VLAN';

  @override
  String get aboutNetworkBasicsPill2 => 'Bedraad';

  @override
  String get aboutNetworkBasicsPill3 => 'IGMP als multicast';

  @override
  String get aboutNetworkBasicsParagraph =>
      'Een verlichtingsnetwerk moet voorspelbaar zijn: weinig verlies, weinig jitter, eenvoudige architectuur. Als er iets misgaat, ligt het zelden aan ‘het protocol’ en vaak aan de infrastructuur (switch, wifi, loops, flood).';

  @override
  String get aboutNetworkBasicsCalloutTitle => 'Basisregel';

  @override
  String get aboutNetworkBasicsBullet1 =>
      'Als het kan: bedraad + juiste switch + speciaal netwerk (of VLAN).';

  @override
  String get aboutNetworkBasicsBullet2 =>
      'Als je moet delen: VLAN + duidelijke regels.';

  @override
  String get aboutNetworkBasicsBullet3 =>
      'sACN multicast: IGMP wordt al snel verplicht.';

  @override
  String get aboutNetworkPlanIpParagraph =>
      'Kies een eenvoudige en consistente strategie. Twee benaderingen: DHCP (eenvoudig) of statisch (voorspelbaar). Het ergste: een mix zonder papieren.';

  @override
  String get aboutNetworkPlanIpCalloutTitle => 'Voorbeeldplan (eenvoudig)';

  @override
  String get aboutNetworkPlanIpBullet1 => 'Licht VLAN: 10.10.0.0/24';

  @override
  String get aboutNetworkPlanIpBullet2 => 'Console/pc: 10.10.0.10';

  @override
  String get aboutNetworkPlanIpBullet3 => 'Knooppunten: 10.10.0.100–150';

  @override
  String get aboutNetworkPlanIpBullet4 => 'Schakelbeheer: 10.10.0.2';

  @override
  String get aboutNetworkPlanIpSubtitle => 'Klassieke fouten';

  @override
  String get aboutNetworkPlanIpSubBullet1 =>
      'Verschillende maskers (bijv. /24 vs /16) → onzichtbare machines.';

  @override
  String get aboutNetworkPlanIpSubBullet2 =>
      'Twee apparaten met hetzelfde IP → willekeurig gedrag.';

  @override
  String get aboutNetworkPlanIpSubBullet3 =>
      'DHCP + statisch op hetzelfde bereik zonder controle → conflicten.';

  @override
  String get aboutNetworkVlanParagraph =>
      'Met een VLAN kun je het licht isoleren van de rest (internet, videoproductie, gasten...). Dit voorkomt netwerkruis en vermindert het risico dat een andere service je show verstoort.';

  @override
  String get aboutNetworkVlanCalloutTitle => 'Wat je verdient';

  @override
  String get aboutNetworkVlanBullet1 => 'Minder parasitair verkeer.';

  @override
  String get aboutNetworkVlanBullet2 =>
      'Minder risico (externe DHCP, ongewenste broadcast).';

  @override
  String get aboutNetworkVlanBullet3 =>
      'Eenvoudiger debuggen (alles in het VLAN = licht).';

  @override
  String get aboutNetworkVlanSubtitle => 'Attentie';

  @override
  String get aboutNetworkVlanSubBullet1 =>
      'Een VLAN = alle poorten moeten juist geconfigureerd zijn (access/trunk).';

  @override
  String get aboutNetworkVlanSubBullet2 =>
      'Als je niet weet hoe: een speciaal \"fysiek\" netwerk is vaak eenvoudiger.';

  @override
  String get aboutNetworkIgmpPill1 => 'IGMP-snooping';

  @override
  String get aboutNetworkIgmpPill2 => 'IGMP-querier';

  @override
  String get aboutNetworkIgmpPill3 => 'Multicast-overstroming';

  @override
  String get aboutNetworkIgmpParagraph =>
      'IGMP snooping laat de switch weten welke poorten welke multicast willen. Zonder dit kan multicast op alle poorten overspoeld worden → verzadiging.';

  @override
  String get aboutNetworkIgmpCalloutTitle => 'IGMP querier (eenvoudig idee)';

  @override
  String get aboutNetworkIgmpBullet1 =>
      'In sommige netwerken/VLAN\'s is een querier nodig om IGMP-abonnementen te onderhouden.';

  @override
  String get aboutNetworkIgmpBullet2 =>
      'Geen geharrewar: afhankelijk van de switch verlopen abonnementen en zie je \"glitches\".';

  @override
  String get aboutNetworkIgmpBullet3 =>
      'Als je een klein toegewijd netwerk hebt: soms werkt alles, maar met een groot netwerk: het is kritiek.';

  @override
  String get aboutNetworkIgmpSubtitle => 'Diagram : IGMP (idee)';

  @override
  String get aboutNetworkWifiSubtitle1 => 'Bedraad';

  @override
  String get aboutNetworkWifiSubtitle2 => 'Wifi';

  @override
  String get aboutNetworkWifiSubBullet1 =>
      '✅ Stabiele latentie, lage verliezen (bij schone infrastructuur).';

  @override
  String get aboutNetworkWifiSubBullet2 => '✅ Aanbevolen in productie.';

  @override
  String get aboutNetworkWifiSubBullet3 =>
      '✅ Praktisch (snel instellen, tablet).';

  @override
  String get aboutNetworkWifiSubBullet4 =>
      '❌ Variabele latentie (jitter), verliezen, interferentie.';

  @override
  String get aboutNetworkWifiSubBullet5 =>
      '❌ Multicast wordt soms slecht beheerd, afhankelijk van AP/config.';

  @override
  String get aboutNetworkWifiSubBullet6 =>
      'OK probleemoplossing / kleine niet-kritieke configuraties, zelden OK in geladen show.';

  @override
  String get aboutNetworkWifiCalloutTitle => 'Eenvoudige regel';

  @override
  String get aboutNetworkWifiBullet1 => 'Kritische show = bedraad.';

  @override
  String get aboutNetworkWifiBullet2 =>
      'Wi-Fi = operatorcomfort (UI), niet hoofdtransport DMX/IP bij groot volume.';

  @override
  String get aboutNetworkSwitchCalloutTitle => 'Minimaal aanbevolen';

  @override
  String get aboutNetworkSwitchBullet1 => 'Juiste Ethernet-switch (niet hub).';

  @override
  String get aboutNetworkSwitchBullet2 => 'Kabels OK (RJ45, connectoren).';

  @override
  String get aboutNetworkSwitchBullet3 =>
      'Vermijd lussen (of gecontroleerde STP).';

  @override
  String get aboutNetworkSwitchBullet4 =>
      'Indien sACN multicast: IGMP-spionage.';

  @override
  String get aboutNetworkSwitchSubtitle => 'Beheerd versus onbeheerd';

  @override
  String get aboutNetworkSwitchSubBullet1 =>
      'Onbeheerd: ok klein speciaal netwerk (eenvoudig).';

  @override
  String get aboutNetworkSwitchSubBullet2 =>
      'Beheerd: handig voor VLAN/IGMP/diagnostiek (groot netwerk).';

  @override
  String get aboutNetworkDiagramsSubtitle1 => 'VLAN: apart licht/rust';

  @override
  String get aboutNetworkDiagramsSubtitle2 => 'Wi-Fi versus bekabeld (idee)';

  @override
  String get aboutNetworkChecklistBullet1 =>
      'Duidelijk IP-plan, consistent masker.';

  @override
  String get aboutNetworkChecklistBullet2 => 'Speciaal netwerk / licht VLAN.';

  @override
  String get aboutNetworkChecklistBullet3 => 'Schakelaar OK, geen lussen.';

  @override
  String get aboutNetworkChecklistBullet4 => 'IGMP voor sACN multicast.';

  @override
  String get aboutNetworkChecklistBullet5 =>
      'Wi-Fi vermeden in kritische productie.';

  @override
  String get videoCameraExposureTitle => 'Belichting van de camera';

  @override
  String get videoCameraExposureSubtitle =>
      'Lux → EV, ISO, snelheid en diafragma.';

  @override
  String get videoCamPageTitle => 'Belichting van de camera';

  @override
  String get videoCamInfoTitle => 'Informatie';

  @override
  String get videoCamIntro =>
      'Indicatieve berekeningen om lux, ISO, snelheid en diafragma met elkaar in verband te brengen.';

  @override
  String get videoCamInputsTitle => 'Voorgerechten';

  @override
  String get videoCamLuxLabel => 'Lux';

  @override
  String get videoCamLuxHint => 'Bijvoorbeeld: 500';

  @override
  String get videoCamIsoLabel => 'ISO';

  @override
  String get videoCamIsoHint => 'Bijvoorbeeld: 800';

  @override
  String get videoCamShutterLabel => 'Snelheid(en)';

  @override
  String get videoCamShutterHint => 'Bijv.: 1/50';

  @override
  String get videoCamApertureLabel => 'Opening (v/)';

  @override
  String get videoCamApertureHint => 'Bijv.: 2.8';

  @override
  String get videoCamEvEmpty => '—';

  @override
  String get videoCamNote =>
      'Indicatieve waarden: kalibratie is afhankelijk van de sensor, de scène en de normen.';

  @override
  String videoCamEvValue(Object ev) {
    return 'EV $ev';
  }

  @override
  String videoCamApertureResult(Object aperture) {
    return 'Diafragma: f/$aperture';
  }

  @override
  String videoCamShutterResult(Object shutter) {
    return 'Snelheid: $shutter s';
  }

  @override
  String get aboutDmxS2Title => '2) Frame DMX — pauze, startcode, kanalen';

  @override
  String get aboutDmxS2PillBreak => 'Pauze';

  @override
  String get aboutDmxS2PillStartCode => 'Startcode';

  @override
  String get aboutDmxS2PillSlots512 => '512 slots';

  @override
  String get aboutDmxS2PillRefresh => 'Vernieuwen';

  @override
  String get aboutDmxS2Intro =>
      'Een DMX-frame wordt in een lus verzonden. Het begint met een “pauze” (stilte), vervolgens een startcode en vervolgens maximaal 512 waarden (0–255). Elk apparaat leest alleen de kanalen die erop betrekking hebben (afhankelijk van zijn adres en modus).';

  @override
  String get aboutDmxS2HowToReadTitle => 'Een frame lezen (heel eenvoudig)';

  @override
  String get aboutDmxS2HowToReadB1 =>
      'Break + MAB: markeert het begin van het frame (hersynchronisatie).';

  @override
  String get aboutDmxS2HowToReadB2 =>
      'Startcode: meestal 0x00 (lichtgegevens).';

  @override
  String get aboutDmxS2HowToReadB3 =>
      'Slots 1 → 512: elk slot = 1 kanaal (0–255).';

  @override
  String get aboutDmxS2HowToReadB4 =>
      'Het frame begint continu opnieuw: het is normaal om de oude waarde te “overschrijven”.';

  @override
  String get aboutDmxS2PracticalTitle => 'In de praktijk';

  @override
  String get aboutDmxS2PracticalB1 =>
      'Een 16-bits modus gebruikt 2 kanalen voor dezelfde functie (bijvoorbeeld: Pan grof + Pan fijn).';

  @override
  String get aboutDmxS2PracticalB2 =>
      'Hoe meer universums u verzendt, hoe meer de algehele belasting (consoles/nodes/netwerk) toeneemt.';

  @override
  String get aboutDmxS2PracticalB3 =>
      'Als u flikkering ervaart, denk dan eerst aan de kabel/afsluiting/verbindingen voordat u de console vermoedt.';

  @override
  String get aboutDmxS3Title =>
      '3) Bekabeling DMX — RS-485, topologie, pin-out';

  @override
  String get aboutDmxS3PillRs485 => 'RS-485';

  @override
  String get aboutDmxS3PillDaisyChain => 'Daisy-keten';

  @override
  String get aboutDmxS3PillNoY => 'Nee Y';

  @override
  String get aboutDmxS3Pill120ohm => '120Ω';

  @override
  String get aboutDmxS3Intro =>
      'DMX512 is gebaseerd op RS-485: een differentiële bus die van strakke lijnen houdt. De gouden regel: een ketting (daisy-chain) van de bron naar de apparaten, en dan een afsluiting aan het einde.';

  @override
  String get aboutDmxS3TopologyTitle => 'Aanbevolen topologie';

  @override
  String get aboutDmxS3TopologyB1 =>
      'Bron → Apparaat 1 → Apparaat 2 → … → laatste apparaat.';

  @override
  String get aboutDmxS3TopologyB2 =>
      'Vermijd Y-afleidingen: deze veroorzaken reflecties (instabiliteit).';

  @override
  String get aboutDmxS3TopologyB3 =>
      'Als je aftakkingen moet maken: gebruik een opto-geïsoleerde DMX splitter.';

  @override
  String get aboutDmxS3PinoutTitle => 'Verbindingen (herinnering)';

  @override
  String get aboutDmxS3CablesTitle => 'Kabels: wat echt werkt';

  @override
  String get aboutDmxS3CablesB1 =>
      'Gebruikt een DMX kabel (impedantie ~120 Ω), geen willekeurige microfoon (tenzij korte probleemoplossing).';

  @override
  String get aboutDmxS3CablesB2 =>
      'Houd de lengtes redelijk en vermijd krappe wikkelingen in de buurt van voedingen/dimmers.';

  @override
  String get aboutDmxS3CablesB3 =>
      'Een slechte kabel = soms “werkt het”… tot de dag dat het niet meer werkt (vochtigheid, lengte, belasting).';

  @override
  String get aboutDmxS4Title => '4) Afsluiting en splitters — busstabiliteit';

  @override
  String get aboutDmxS4Intro =>
      'Op een RS-485-bus vermijdt de afsluiting reflecties aan het einde van de lijn. Splitters (opto-geïsoleerd) worden gebruikt om schone takken te creëren en de bron te beschermen.';

  @override
  String get aboutDmxS4TerminatorTitle => 'Afsluiting (120 Ω): wanneer en hoe';

  @override
  String get aboutDmxS4TerminatorB1 =>
      'Plaatst een afsluiting op het laatste apparaat (of een XLR-stekker).';

  @override
  String get aboutDmxS4TerminatorB2 =>
      'Slechts één afsluiting per lijn (niet overal).';

  @override
  String get aboutDmxS4TerminatorB3 =>
      'Essentieel bij lange lijnen, grote ladingen en luidruchtige omgevingen.';

  @override
  String get aboutDmxS4SplittersTitle => 'Splitters / opto-isolatie';

  @override
  String get aboutDmxS4SplittersB1 =>
      'Hiermee kunt u 2, 4, 8 takken maken zonder “Y”.';

  @override
  String get aboutDmxS4SplittersB2 =>
      'Isoleert elektrisch: beperkt aardlussen en beschermt de console/het knooppunt.';

  @override
  String get aboutDmxS4SplittersB3 =>
      'Praktisch voor het “hersturen” van een signaal over lange afstanden.';

  @override
  String get aboutDmxS5Title =>
      '5) Probleemoplossing — eenvoudige methode (snel en betrouwbaar)';

  @override
  String get aboutDmxS5Intro =>
      'Wanneer een apparaat niet reageert, is het de sleutel om te isoleren: is dit het adres, de modus, de DMX lijn of het apparaat? Volg een korte checklist voordat u alles opnieuw configureert.';

  @override
  String get aboutDmxS5QuickChecksTitle => 'Snelle controlelijst';

  @override
  String get aboutDmxS5QuickB1 =>
      'Adres DMX correct? (en niet 001 versus 000, afhankelijk van het scherm).';

  @override
  String get aboutDmxS5QuickB2 => 'Correcte DMX-modus (aantal kanalen)?';

  @override
  String get aboutDmxS5QuickB3 =>
      'Goede universe/uitvoer (console, knooppunt, poort)?';

  @override
  String get aboutDmxS5QuickB4 =>
      'Test met een bekende OK-kabel en vervang deze vervolgens één voor één.';

  @override
  String get aboutDmxS5QuickB5 =>
      'Voeg een einde aan het einde van de regel toe of verwijder deze om het effect te zien.';

  @override
  String get aboutDmxS5IfFlickerTitle => 'Als het flikkert / oppakt';

  @override
  String get aboutDmxS5IfFlickerB1 =>
      'Zoek naar een verborgen \"Y\", een ongeschikte splitter of een slechte XLR-adapter.';

  @override
  String get aboutDmxS5IfFlickerB2 =>
      'Houdt DMX uit de buurt van voedingen/dimmers, vermijdt grote kabellussen.';

  @override
  String get aboutDmxS5IfFlickerB3 =>
      'Verminder de complexiteit: 1 universum, 1 lijn, 1 apparaat, en dan herbouw je het.';

  @override
  String get aboutDmxS5GoldenRuleTitle => 'Gouden regel';

  @override
  String get aboutDmxS5GoldenRuleBody =>
      'U moet één apparaat op één lijn kunnen bedienen. Als deze basistest mislukt, is het probleem niet \"de hele patch\": het is de adressering, de bekabeling of de hardware.';

  @override
  String get aboutDmxS6Title =>
      '6) Art-Net — DMX over IP (woordenschat en valkuilen)';

  @override
  String get aboutDmxS6PillUdp => 'UDP';

  @override
  String get aboutDmxS6PillNodes => 'Knooppunten';

  @override
  String get aboutDmxS6PillBroadcast => 'uitzending';

  @override
  String get aboutDmxS6PillUnicast => 'Unicast';

  @override
  String get aboutDmxS6Intro =>
      'Art-Net transporteert DMX universums via Ethernet (UDP). Een console/software verzendt universums over het netwerk en een knooppunt zet deze om in fysieke DMX-uitvoer.';

  @override
  String get aboutDmxS6BasicsTitle => 'Om te onthouden';

  @override
  String get aboutDmxS6BasicsB1 =>
      'Eén knooppunt = netwerk ↔ DMX (meerdere poorten).';

  @override
  String get aboutDmxS6BasicsB2 =>
      'Broadcast verzendt naar iedereen (eenvoudig maar kan verzadigen).';

  @override
  String get aboutDmxS6BasicsB3 =>
      'Unicast verzendt alleen naar het beoogde knooppunt (vaak stabieler op grote platforms).';

  @override
  String get aboutDmxS6BasicsB4 =>
      'Wees voorzichtig bij het tellen van universums: vaak begint Art-Net bij 0 (Universum 1 DMX = 0 Art-Net).';

  @override
  String get aboutDmxS6WhenTitle => 'Wanneer kies je voor Art-Net?';

  @override
  String get aboutDmxS6WhenB1 =>
      'Kleine/middelgrote installaties, snelle installatie, veel compatibele apparatuur.';

  @override
  String get aboutDmxS6WhenB2 =>
      'OK als het netwerk schoon is (juiste schakelaar, kabels, geen wifi).';

  @override
  String get aboutDmxS6WhenB3 =>
      'Als het verzadigd raakt: schakel over naar unicast en segmenteer het netwerk (VLAN / dedicated netwerk).';

  @override
  String get aboutDmxS7Title =>
      '7) sACN (E1.31) — multicast, prioriteiten, eigen netwerk';

  @override
  String get aboutDmxS7PillE131 => 'E1.31';

  @override
  String get aboutDmxS7PillMulticast => 'Multicast';

  @override
  String get aboutDmxS7PillPriority => 'Prioriteit';

  @override
  String get aboutDmxS7PillIgmp => 'IGMP';

  @override
  String get aboutDmxS7Intro =>
      'sACN (ANSI E1.31) is een moderne standaard voor het transporteren van DMX universums via IP. Het wordt veel gebruikt in grote systemen omdat het multicast en prioriteiten goed beheert.';

  @override
  String get aboutDmxS7KeyIdeasTitle => 'Belangrijkste ideeën';

  @override
  String get aboutDmxS7KeyIdeasB1 =>
      'Multicast: een universum is een netwerkgroep (de knooppunten zijn geabonneerd).';

  @override
  String get aboutDmxS7KeyIdeasB2 =>
      'IGMP-spionage op schakelaars = essentieel op grote schaal (anders loopt het over).';

  @override
  String get aboutDmxS7KeyIdeasB3 =>
      'Prioriteit: meerdere mogelijke bronnen, degene met de hoogste prioriteit wint.';

  @override
  String get aboutDmxS7KeyIdeasB4 =>
      'Zoals Art-Net: schoon netwerk + kwaliteitskabels/switch = stabiliteit.';

  @override
  String get aboutDmxS8Title =>
      '8) DMX versus Art-Net versus sACN — samenvatting (wat te kiezen?)';

  @override
  String get aboutDmxS8Intro =>
      'Alle drie doen ze uiteindelijk hetzelfde: controlekanalen. Het verschil komt neer op distributie (DMX kabel versus netwerk), schaal en robuustheid.';

  @override
  String get aboutDmxS8QuickTableTitle => 'Samenvatting in 4 regels';

  @override
  String get aboutDmxS8QuickB1 =>
      'DMX: eenvoudig, robuust, 1 kabel = 1 lijn (512 kanalen).';

  @override
  String get aboutDmxS8QuickB2 =>
      'Art-Net: zeer gebruikelijk, eenvoudig in te zetten, pas op voor uitzending.';

  @override
  String get aboutDmxS8QuickB3 =>
      'sACN: meer \"pro large systems\", multicast + prioriteiten, vereist een goed geconfigureerd netwerk.';

  @override
  String get aboutDmxS8QuickB4 =>
      'In alle gevallen: documentatie + progressief testen = enorme tijdsbesparing.';

  @override
  String get aboutDmxS8ChooseTitle => 'Snelle keuze';

  @override
  String get aboutDmxS8ChooseB1 =>
      'Kleine opzet: DMX direct of Art-Net (eenvoudig).';

  @override
  String get aboutDmxS8ChooseB2 =>
      'Veel universums: speciaal netwerk + knooppunten; Art-Net in unicast of sACN.';

  @override
  String get aboutDmxS8ChooseB3 =>
      'Zeer grote installaties/infrastructuur: sACN + goed beheerde switches/IGMP.';

  @override
  String get aboutSunTimesTitle => 'Zon (opkomen/ondergaan)';

  @override
  String get aboutSunTimesSubtitle =>
      'Keuze uit een stad en een datum, zonsopgang/ondergangstijden + drempels (lux).';

  @override
  String get homeBpmTitle => 'BPM';

  @override
  String get aboutReseauPageTitle => 'Netwerk — veldbenchmarks';

  @override
  String get aboutReseauSummaryCopy =>
      'NETWERK — veldbenchmarks\n• RJ45: Cat5e/6/6A → 1G/10G afhankelijk van de afstand.\n• Glasvezel: lange afstand + EMI-immuniteit.\n• Switch: IGMP belangrijk voor sACN multicast.\n• VLAN: gescheiden licht/video/IT = stabiliteit.';

  @override
  String get aboutReseauChecklistCopy =>
      'NETWERK — Controlelijst\n☐ Duidelijk IP-plan (bereik/maskers)\n☐ Correcte schakelaar (IGMP als sACN multicast)\n☐ VLAN indien meerdere “werelden” (licht/video/IT)\n☐ Kabels getest + gelabeld\n☐ Glasvezel: compatibele modules + eigen connectoren\n☐ Vermijd loops (STP) + vermijd openbare Wi-Fi op LAN-show';

  @override
  String get aboutReseauChecklistCopyTooltip => 'Kopiëren';

  @override
  String get aboutReseauFooterNote =>
      'Indicatieve informatie (terrein). Exacte capaciteiten variëren afhankelijk van hardware/kabels/modules.\nDoel: eenvoudige benchmarks + betrouwbare methode.';

  @override
  String get aboutReseauToc1 =>
      '1) Basisprincipes van het netwerk (LAN / IP / doorvoer)';

  @override
  String get aboutReseauToc2 => '2) RJ45 & categorieën (Cat5e/6/6A/…)';

  @override
  String get aboutReseauToc3 => '3) PoE (netwerkvoeding)';

  @override
  String get aboutReseauToc4 => '4) Vezel (SM/MM) + connectoren (LC/SC)';

  @override
  String get aboutReseauToc5 => '5) SFP / SFP+ / QSFP (modules)';

  @override
  String get aboutReseauToc6 => '6) Schakelaars (VLAN / IGMP / QoS)';

  @override
  String get aboutReseauToc7 => '7) Art-Net / sACN op netwerk (advies)';

  @override
  String get aboutReseauToc8 => '8) Controlelijst';

  @override
  String get aboutReseauSection1Title => 'De 3 simpele ideeën';

  @override
  String get aboutReseauSection1Bullet1 =>
      'IP = adres (bijvoorbeeld: 10.0.0.50).';

  @override
  String get aboutReseauSection1Bullet2 =>
      'LAN = lokaal netwerk via switch (niet \"internet\").';

  @override
  String get aboutReseauSection1Bullet3 =>
      'Flow = capaciteit (1G, 10G, etc.), maar stabiliteit is ook afhankelijk van de schakelaar.';

  @override
  String get aboutReseauSection1Title2 => 'Toon (schone) topologie';

  @override
  String get aboutReseauSection1Bullet4 =>
      'Console/PC → centrale schakelaar → knooppunten/servers.';

  @override
  String get aboutReseauSection1Bullet5 =>
      'Vermijd willekeurige ‘daisy-chain-netwerken’.';

  @override
  String get aboutReseauSection1Bullet6 =>
      'Indien mogelijk: een speciaal shownetwerk (geen openbare wifi).';

  @override
  String get aboutReseauSection2Title => 'Snelle referenties';

  @override
  String get aboutReseauSection2Bullet1 =>
      'Cat5e: 1 Gbit/s “klassiek” (tot 100m).';

  @override
  String get aboutReseauSection2Bullet2 =>
      'Cat6: 1G/10G (10G liever over kortere afstanden).';

  @override
  String get aboutReseauSection2Bullet3 =>
      'Cat6A: 10G tot 100m (praktische referentie).';

  @override
  String get aboutReseauSection2Bullet4 =>
      'Verder: Cat7/8 bestaat, maar Cat6A is vaak de goede plek in het veld.';

  @override
  String get aboutReseauSection2Title2 => 'Grond';

  @override
  String get aboutReseauSection2Bullet5 =>
      'Test/label kabels altijd (vooral wanneer ze worden gehuurd).';

  @override
  String get aboutReseauSection2Bullet6 =>
      'Voorkom beschadigde connectoren: een “vermoeide” RJ45 = fantoomstoringen.';

  @override
  String get aboutReseauSection2Bullet7 =>
      'Plan voor 10G als je zware IP-video maakt.';

  @override
  String get aboutReseauSection3Paragraph =>
      'Met PoE kunt u apparatuur via RJ45 van stroom voorzien (IP-cam, Wi-Fi AP, kleine knooppunten, enz.). Het kritieke punt: het totale budget van PoE van de overstap.';

  @override
  String get aboutReseauSection3Title => 'Bezienswaardigheden';

  @override
  String get aboutReseauSection3Bullet1 =>
      'PoE (802.3af) ≈ 15W, PoE+ (802.3at) ≈ 30W, PoE++/bt hoger.';

  @override
  String get aboutReseauSection3Bullet2 =>
      'De schakelaar heeft een totaal \"budget\" (bijvoorbeeld: 120W).';

  @override
  String get aboutReseauSection3Bullet3 =>
      'Als je het budget overschrijdt: sommige poorten lichten niet meer op / rebooten niet meer.';

  @override
  String get aboutReseauSection4Title => 'Waarom vezels in de show';

  @override
  String get aboutReseauSection4Bullet1 => 'Zeer lange afstanden.';

  @override
  String get aboutReseauSection4Bullet2 =>
      'Immuniteit tegen parasieten (EMI), top in drukke omgevingen.';

  @override
  String get aboutReseauSection4Bullet3 =>
      'Praktisch voor het aansluiten van FOH ↔ podium ↔ controlekamer.';

  @override
  String get aboutReseauSection4Title2 =>
      'Multimode versus Singlemode (enkele markering)';

  @override
  String get aboutReseauSection4Bullet4 =>
      'Multimode (MM): “gemiddelde” afstanden (vaak gebouw/platform).';

  @override
  String get aboutReseauSection4Bullet5 =>
      'Single mode (SM): zeer lange afstanden.';

  @override
  String get aboutReseauSection4Bullet6 =>
      'De modules (SFP) moeten overeenkomen met het vezeltype.';

  @override
  String get aboutReseauSection4Title3 => 'Connectoren';

  @override
  String get aboutReseauSection4Bullet7 =>
      'LC: klein, zeer gebruikelijk op SFP.';

  @override
  String get aboutReseauSection4Bullet8 =>
      'SC: groter, gebruikelijk in infrastructuur.';

  @override
  String get aboutReseauSection4Bullet9 =>
      'Altijd beschermen/reinigen (stof = verlies).';

  @override
  String get aboutReseauSection5Title => 'Bezienswaardigheden';

  @override
  String get aboutReseauSection5Bullet1 => 'SFP: vaak 1G.';

  @override
  String get aboutReseauSection5Bullet2 => 'SFP+: vaak 10G.';

  @override
  String get aboutReseauSection5Bullet3 =>
      'QSFP/QSFP+: 40G (afhankelijk van gebruik).';

  @override
  String get aboutReseauSection5Bullet4 =>
      'Eén module = snelheid + vezeltype + lengte (alles moet consistent zijn).';

  @override
  String get aboutReseauSection5Paragraph =>
      'In de praktijk: neem modules die compatibel zijn met de switch (en idealiter van dezelfde leverancier/model) om verrassingen te voorkomen.';

  @override
  String get aboutReseauSection6Title => 'Handige functies in de show';

  @override
  String get aboutReseauSection6Bullet1 => 'VLAN: gescheiden licht/video/IT.';

  @override
  String get aboutReseauSection6Bullet2 =>
      'IGMP-snooping: essentieel als u op grote schaal sACN multicast gebruikt.';

  @override
  String get aboutReseauSection6Bullet3 =>
      'QoS: handig als je veel stromen mixt (afhankelijk van de context).';

  @override
  String get aboutReseauSection6Title2 => 'Veelvoorkomende fouten';

  @override
  String get aboutReseauSection6Bullet4 =>
      '“Goedkope” schakelaar die de multicast overspoelt → netwerk dat instort.';

  @override
  String get aboutReseauSection6Bullet5 =>
      'Netwerklus zonder STP → uitzendingstorm.';

  @override
  String get aboutReseauSection6Bullet6 =>
      'Openbare Wi-Fi op hetzelfde LAN als de show → instabiliteit.';

  @override
  String get aboutReseauSection7Title => 'Art-Net (veld)';

  @override
  String get aboutReseauSection7Bullet1 => 'Vaak eenvoudig in te stellen.';

  @override
  String get aboutReseauSection7Bullet2 =>
      'Uitzending mogelijk op een klein speciaal LAN, maar unicast is schoner.';

  @override
  String get aboutReseauSection7Bullet3 =>
      'Universe/poort mapping = punt nummer 1 om te controleren.';

  @override
  String get aboutReseauSection7Title2 => 'sACN (veld)';

  @override
  String get aboutReseauSection7Bullet4 =>
      'Multicast: effectief, maar vereist een correcte schakelaar (IGMP).';

  @override
  String get aboutReseauSection7Bullet5 =>
      'Prioriteiten: handig als er meerdere bronnen zijn.';

  @override
  String get aboutReseauSection7Bullet6 =>
      'Op grote shows: sACN + IGMP is vaak de \"schone\" keuze.';

  @override
  String get aboutReseauChecklistTitle => 'Snel';

  @override
  String get aboutReseauChecklistBullet1 =>
      'Correcte schakelaar + schone kabels.';

  @override
  String get aboutReseauChecklistBullet2 => 'IGMP als sACN multicast.';

  @override
  String get aboutReseauChecklistBullet3 => 'Afzonderlijk gebruik (VLAN).';

  @override
  String get aboutSacnPageTitle => 'sACN / E1.31 — multicast en prioriteiten';

  @override
  String get aboutSacnCopyTooltip => 'Kopieer markeringen';

  @override
  String get aboutSacnChecklistCopyTooltip => 'Kopiëren';

  @override
  String get aboutSacnFooterNote =>
      'Indicatieve informatie (terrein). Gedrag is afhankelijk van schakelaars (IGMP), knooppunten en firmware.\nDoel: een sACN netwerk begrijpen en stabiliseren.';

  @override
  String get aboutSacnCopy1 =>
      'sACN (E1.31) = DMX over IP (UDP), standaard weergeven.';

  @override
  String get aboutSacnCopy2 => 'Universe sACN = 1..63999 (standaard bereik).';

  @override
  String get aboutSacnCopy3 =>
      'Multicast: IGMP-snooping aanbevolen, anders overstromen.';

  @override
  String get aboutSacnCopy4 =>
      'Prioriteit: handig bij meerdere bronnen (console + back-up).';

  @override
  String get aboutSacnChecklistCopy =>
      'sACN (E1.31) — Controlelijst ter plaatse\n☐ Correcte schakelaar (idealiter beheersbaar)\n☐ IGMP-spionage ingeschakeld bij multicast\n☐ (indien mogelijk) IGMP-querier aanwezig in het VLAN (anders vreemd gedrag mogelijk)\n☐ Unicast als netwerk niet wordt beheerd / probleemoplossing\n☐ Prioriteiten: controleer meerdere bronnen (console/back-up)\n☐ Universe-toewijzing ↔ knooppuntpoorten aangevinkt\n☐ Wi-Fi vermeden in productie';

  @override
  String get aboutSacnToc1 => '1) Waar wordt sACN voor gebruikt?';

  @override
  String get aboutSacnToc2 => '2) Universum (nummering)';

  @override
  String get aboutSacnToc3 => '3) Multicast / Unicast + IGMP';

  @override
  String get aboutSacnToc4 => '4) Prioriteiten (multi-source)';

  @override
  String get aboutSacnToc5 => '5) Limieten / prestaties';

  @override
  String get aboutSacnToc6 =>
      '6) RDM & sACN (proxy / afhankelijk van hardware)';

  @override
  String get aboutSacnToc7 => '7) Schema\'s';

  @override
  String get aboutSacnToc8 => '8) Controlelijst';

  @override
  String get aboutSacnSection1Pill1 => 'UDP';

  @override
  String get aboutSacnSection1Pill2 => 'Multicast';

  @override
  String get aboutSacnSection1Pill3 => 'Prioriteit';

  @override
  String get aboutSacnSection1Paragraph =>
      'sACN (E1.31) is een veelgebruikte standaard voor het transporteren van DMX-universums via IP. Dit heeft vaak de voorkeur als u een schone netwerkarchitectuur wilt: goed beheerde multicast, gestandaardiseerde prioriteiten en meer \"professioneel netwerkgedrag\".';

  @override
  String get aboutSacnSection1Title => 'Wanneer het geweldig is';

  @override
  String get aboutSacnSection1Bullet1 =>
      'Veel universums op een goed beheerd netwerk.';

  @override
  String get aboutSacnSection1Bullet2 =>
      'Installaties/grote netwerken met meerdere bronnen (prioriteiten).';

  @override
  String get aboutSacnSection1Bullet3 =>
      'Wanneer u “overal uitzenden” wilt vermijden.';

  @override
  String get aboutSacnSection2Pill1 => 'Universum 1..63999';

  @override
  String get aboutSacnSection2Pill2 => '512 slots/universum';

  @override
  String get aboutSacnSection2Paragraph =>
      'Een sACN-universum komt overeen met een DMX-universum: maximaal 512 slots. De standaard sACN nummering is 1..63999. In de praktijk is het belangrijkste de toewijzing van de console ↔ knooppunt ↔ poort DMX.';

  @override
  String get aboutSacnSection2Title => 'Klassieke fout';

  @override
  String get aboutSacnSection2Bullet1 =>
      'U wijzigt het universe-nummer aan de consolezijde, maar niet aan de knooppuntzijde (of omgekeerd).';

  @override
  String get aboutSacnSection2Bullet2 =>
      'Je patcht \"Universe 0\" terwijl de hardware een basis 1 verwacht.';

  @override
  String get aboutSacnSection2Bullet3 =>
      'Je combineert nummeringsconventies tussen tools.';

  @override
  String get aboutSacnSection3Paragraph =>
      'sACN maakt vaak gebruik van multicast: elk universum \"leeft\" op een multicastgroep en de knooppunten abonneren zich op de universums die ze nodig hebben.';

  @override
  String get aboutSacnSection3Title => 'IGMP-snooping (waarom het ertoe doet)';

  @override
  String get aboutSacnSection3Bullet1 =>
      'Zonder IGMP: de switch overspoelt overal multicast → mogelijke overbelasting.';

  @override
  String get aboutSacnSection3Bullet2 =>
      'Met IGMP: de switch verzendt alleen naar abonneepoorten → stabiel netwerk.';

  @override
  String get aboutSacnSection3Bullet3 =>
      'Op grote volumes: IGMP is vaak HET verschil tussen “het werkt” en “het is een hel”.';

  @override
  String get aboutSacnSection3Subtitle => 'Schema: multicast & IGMP';

  @override
  String get aboutSacnSection3Subtitle2 => 'Unicast (optie)';

  @override
  String get aboutSacnSection3SubBullet1 =>
      'Mogelijk afhankelijk van consoles/nodes.';

  @override
  String get aboutSacnSection3SubBullet2 =>
      'Handig voor het oplossen van problemen of als het multicast-netwerk niet wordt beheerd.';

  @override
  String get aboutSacnSection3SubBullet3 =>
      'Minder elegant maar soms eenvoudiger.';

  @override
  String get aboutSacnSection4Pill1 => 'Bron Apri 100';

  @override
  String get aboutSacnSection4Pill2 => 'Bron Bprio 90';

  @override
  String get aboutSacnSection4Paragraph =>
      'sACN hanteert een prioriteitsbegrip: als meerdere bronnen hetzelfde universum zenden, behoudt de ontvanger de bron met de hoogste prioriteit. Erg handig met een hoofdconsole + een back-upconsole + een mediaserver.';

  @override
  String get aboutSacnSection4Title => 'Valkuilen';

  @override
  String get aboutSacnSection4Bullet1 =>
      'Twee ongewenste bronnen in hetzelfde universum → “het is aan het vechten”.';

  @override
  String get aboutSacnSection4Bullet2 =>
      'Slecht ingestelde prioriteit → back-up die het overneemt.';

  @override
  String get aboutSacnSection4Bullet3 =>
      'Debuggen: knip een bron af en kijk wie er wint.';

  @override
  String get aboutSacnSection5Pill1 => 'IGMP';

  @override
  String get aboutSacnSection5Pill2 => 'Schakelaar';

  @override
  String get aboutSacnSection5Pill3 => 'Wifi-nr';

  @override
  String get aboutSacnSection5Pill4 => 'CPU-knooppunt';

  @override
  String get aboutSacnSection5Title => 'Wat het eerst kapot gaat';

  @override
  String get aboutSacnSection5Bullet1 =>
      'Multicast zonder IGMP → overstroming.';

  @override
  String get aboutSacnSection5Bullet2 =>
      'Ongeschikte schakelaar (buffers/CPU) → verliezen.';

  @override
  String get aboutSacnSection5Bullet3 => 'Wi-Fi → jitter/uitval.';

  @override
  String get aboutSacnSection5Bullet4 =>
      'Beperkte knooppunten (poorten, firmware).';

  @override
  String get aboutSacnSection5Subtitle => 'Eenvoudige regels';

  @override
  String get aboutSacnSection5SubBullet1 =>
      'Beheerde switch + IGMP-snooping als er veel universums zijn.';

  @override
  String get aboutSacnSection5SubBullet2 =>
      'Speciaal licht VLAN indien mogelijk.';

  @override
  String get aboutSacnSection5SubBullet3 =>
      'Unicast om te isoleren bij het oplossen van problemen.';

  @override
  String get aboutSacnSection6Paragraph =>
      'Net als bij Art-Net is \"over IP\" RDM vaak afhankelijk van een proxymechanisme in de knooppunten. De sACN-standaard impliceert niet automatisch dat uw knooppunt RDM correct uitvoert.';

  @override
  String get aboutSacnSection6Title => 'Om het knooppuntdocument in te checken';

  @override
  String get aboutSacnSection6Bullet1 =>
      'RDM-proxy / RDM over IP-ondersteuning.';

  @override
  String get aboutSacnSection6Bullet2 =>
      'Beperkingen (alleen ontdekking, gedeeltelijke bestellingen).';

  @override
  String get aboutSacnSection6Bullet3 =>
      'Compatibiliteit met splitters/optozijde DMX.';

  @override
  String get aboutSacnSection6Subtitle => 'Veldmethode';

  @override
  String get aboutSacnSection6SubBullet1 => 'Stabiliseer DMX zonder RDM.';

  @override
  String get aboutSacnSection6SubBullet2 =>
      'Test RDM op een eenvoudige en overzichtelijke lijn.';

  @override
  String get aboutSacnSection6SubBullet3 =>
      'Als u problemen ondervindt: schakel RDM uit en isoleer vervolgens het knooppunt/de splitter.';

  @override
  String get aboutSacnSection7Subtitle1 => 'Multicast + IGMP (idee)';

  @override
  String get aboutSacnSection7Subtitle2 => 'Prioriteiten (2 bronnen)';

  @override
  String get aboutSacnChecklistTitle => 'Voordat je “het protocol” beschuldigt';

  @override
  String get aboutSacnChecklistBullet1 =>
      'IGMP-spionage ingeschakeld bij multicast.';

  @override
  String get aboutSacnChecklistBullet2 => 'Dedicated VLAN indien mogelijk.';

  @override
  String get aboutSacnChecklistBullet3 =>
      'Unicast bij het oplossen van problemen.';

  @override
  String get aboutSacnChecklistBullet4 =>
      'Consistente prioriteiten als er meerdere bronnen zijn.';

  @override
  String get aboutSacnChecklistBullet5 => 'Wi-Fi vermeden in productie.';

  @override
  String get sunTimesTitle => 'Zonsopgang/zonsondergang';

  @override
  String get sunTimesSectionSettings => 'Instellingen';

  @override
  String get sunTimesSectionResults => 'Resultaten';

  @override
  String get sunTimesSectionTimeline => 'Tijdlijn (stappen van 30 minuten)';

  @override
  String get sunTimesSectionTwilight => 'Wat zijn schemeringen?';

  @override
  String get sunTimesSectionLux => 'Helderheidsdrempels (benchmarks)';

  @override
  String get sunTimesIntro =>
      'Kies een stad en een datum. Tijden zijn indicatief (afgerond).';

  @override
  String get sunTimesLabelCity => 'Stad';

  @override
  String get sunTimesLabelDate => 'Datum';

  @override
  String get sunTimesNoteApprox =>
      'Indicatieve tijden — kunnen variëren afhankelijk van hoogte, refractie en weer.';

  @override
  String get sunTimesNoData => '—';

  @override
  String get sunTimesResultSunrise => 'Zonsopgang';

  @override
  String get sunTimesResultSunset => 'Zonsondergang';

  @override
  String get sunTimesResultCivilDawn => 'Burgerlijke dageraad';

  @override
  String get sunTimesResultCivilDusk => 'Burgerlijke schemering';

  @override
  String get sunTimesResultNauticalDawn => 'Nautische dageraad';

  @override
  String get sunTimesResultNauticalDusk => 'Nautische schemering';

  @override
  String get sunTimesResultAstronomicalDawn => 'Astronomische dageraad';

  @override
  String get sunTimesResultAstronomicalDusk => 'Astronomische schemering';

  @override
  String get sunTimesTimelineStep30 => 'Stappen: 30 minuten';

  @override
  String get sunTimesTimelineDay => 'Dag';

  @override
  String get sunTimesTimelineCivil => 'Civiel';

  @override
  String get sunTimesTimelineNautical => 'Nautisch';

  @override
  String get sunTimesTimelineAstronomical => 'Astronomisch';

  @override
  String get sunTimesTimelineNight => 'Nacht';

  @override
  String get sunTimesTwilightIntro =>
      'Schemeringen worden gedefinieerd door de hoogte van de zon onder de horizon. Deze definities zijn gestandaardiseerd.';

  @override
  String get sunTimesTwilightCivilTitle => 'Civiel (≈ 0° tot −6°)';

  @override
  String get sunTimesTwilightCivilBody =>
      'Einde/begin van de dag. We kunnen het landschap nog duidelijk zien.';

  @override
  String get sunTimesTwilightNauticalTitle => 'Nautisch (≈ −6° tot −12°)';

  @override
  String get sunTimesTwilightNauticalBody =>
      'De horizonlijn wordt moeilijk te onderscheiden. De lucht is merkbaar donkerder.';

  @override
  String get sunTimesTwilightAstronomicalTitle =>
      'Astronomisch (≈ −12° tot −18°)';

  @override
  String get sunTimesTwilightAstronomicalBody =>
      'De lucht is bijna volledig donker (weinig restlicht).';

  @override
  String get sunTimesLuxNight => 'Donkere nacht';

  @override
  String get sunTimesLuxAstro => 'Astro Schemering';

  @override
  String get sunTimesLuxNautical => 'Schemer naut.';

  @override
  String get sunTimesLuxCivil => 'Burgerlijke schemering';

  @override
  String get sunTimesLuxVeryLow => 'Zeer zwak';

  @override
  String get sunTimesLuxLow => 'Zwak';

  @override
  String get sunTimesLuxDay => 'Dag';

  @override
  String get sunTimesLuxFullDay => 'Volledige dag';

  @override
  String get sunTimesLuxNote =>
      'Deze waarden zijn typische benchmarks (weer, seizoen, omgeving → variaties).';

  @override
  String get aboutVideoPageTitle => 'Video — veldmarkeringen';

  @override
  String get aboutVideoSummaryCopy =>
      'VIDEO — veldreferenties\n• Resolutie = grootte (px). FPS = vloeibaarheid / latentie.\n• 4:2:2 / 4:4:4 + 10-bit = kleurkwaliteit.\n• SDI = robuust + lange afstand.\n• HDMI = kwetsbaar + kort.\n• NDI = IP (netwerk), afhankelijk van LAN.\n• Genlock / Tijdcode = synchroniseren.';

  @override
  String get aboutVideoChecklistCopy =>
      'VIDEO — Controlelijst\n☐ Overal dezelfde resolutie en FPS\n☐ HDMI: EDID / HDCP gemasterd\n☐ SDI: 75Ω kabel + goede standaard\n☐ NDI/IP: eigen LAN (switch, snelheid)\n☐ Genlock / Tijdcode indien synchronisatie vereist\n☐ Testbron → direct scherm';

  @override
  String get aboutVideoChecklistCopyTooltip => 'Kopiëren';

  @override
  String get aboutVideoFooterNote =>
      'Indicatieve informatie (terrein). Het gedrag varieert afhankelijk van de hardware.\nDoel: snel begrijpen en problemen op de juiste manier oplossen.';

  @override
  String get aboutVideoToc1 => '1) Basisprincipes van video (trefwoorden)';

  @override
  String get aboutVideoToc2 => '2) Resolutie en FPS';

  @override
  String get aboutVideoToc3 => '3) Kleur (4:4:4 / 4:2:2 / 10-bits)';

  @override
  String get aboutVideoToc4 => '4) Synchroniseren (Genlock / Tijdcode)';

  @override
  String get aboutVideoToc5 => '5) Kabels & afstanden';

  @override
  String get aboutVideoToc6 => '6) SDI (3G/6G/12G)';

  @override
  String get aboutVideoToc7 => '7) HDMI — veld';

  @override
  String get aboutVideoToc8 => '8) NDI — wanneer / waarom / limieten';

  @override
  String get aboutVideoToc9 => '9) In kaart brengen / LED / meerdere projecten';

  @override
  String get aboutVideoSection1Paragraph =>
      'Video is een beeld (pixels) dat wordt verzonden met een snelheid (FPS), met een kleurstructuur (sampling / bitdiepte), getransporteerd via een link (SDI / HDMI / IP) en soms gesynchroniseerd.';

  @override
  String get aboutVideoSection1Title => 'Nuttige woordenschat';

  @override
  String get aboutVideoSection1Bullet1 => 'Resolutie: breedte×hoogte (px).';

  @override
  String get aboutVideoSection1Bullet2 => 'FPS: vloeibaarheid / latentie.';

  @override
  String get aboutVideoSection1Bullet3 =>
      'Progressief (p) versus geïnterlinieerd (i).';

  @override
  String get aboutVideoSection1Bullet4 => 'Codec: compressie (H.264, H.265…).';

  @override
  String get aboutVideoSection1Bullet5 => 'Latentie: live beoordeling.';

  @override
  String get aboutVideoSection2Title => 'Oplossing';

  @override
  String get aboutVideoSection2Bullet1 => '1080p = 1920×1080.';

  @override
  String get aboutVideoSection2Bullet2 => '4K UHD = 3840×2160.';

  @override
  String get aboutVideoSection2Bullet3 => 'DCI 4K = 4096×2160 (bioscoop).';

  @override
  String get aboutVideoSection2Bullet4 => 'Meer pixels = meer doorvoer.';

  @override
  String get aboutVideoSection2Title2 => 'FPS';

  @override
  String get aboutVideoSection2Bullet5 => '25/50: Europese norm.';

  @override
  String get aboutVideoSection2Bullet6 =>
      '30/60: Amerikaanse standaard / apparaten.';

  @override
  String get aboutVideoSection2Bullet7 =>
      'Vermijd het mengen van 50 en 60 zonder conversie.';

  @override
  String get aboutVideoSection3Title => 'Bemonstering';

  @override
  String get aboutVideoSection3Bullet1 => '4:4:4: afbeeldingen / keying.';

  @override
  String get aboutVideoSection3Bullet2 => '4:2:2: huidige professional.';

  @override
  String get aboutVideoSection3Bullet3 => '4:2:0: bestanden / stream.';

  @override
  String get aboutVideoSection3Title2 => 'Beetje diepte';

  @override
  String get aboutVideoSection3Bullet4 => '8-bit: standaard.';

  @override
  String get aboutVideoSection3Bullet5 =>
      '10-bit: betere hellingen (HDR / LED).';

  @override
  String get aboutVideoSection4Title => 'Genlock';

  @override
  String get aboutVideoSection4Bullet1 =>
      'Synchroniseert het vernieuwen van afbeeldingen.';

  @override
  String get aboutVideoSection4Bullet2 =>
      'Handig bij multi-cam / LED / uitzending.';

  @override
  String get aboutVideoSection4Title2 => 'Tijdcode';

  @override
  String get aboutVideoSection4Bullet3 => 'Tijdsynchronisatie.';

  @override
  String get aboutVideoSection4Bullet4 => 'Vervangt genlock niet.';

  @override
  String get aboutVideoSection5Title => 'Eenvoudige regels';

  @override
  String get aboutVideoSection5Bullet1 => 'HDMI: kwetsbaar, kort.';

  @override
  String get aboutVideoSection5Bullet2 => 'SDI: robuust, lang.';

  @override
  String get aboutVideoSection5Bullet3 => 'Vezel: zeer lang + EMI-vrij.';

  @override
  String get aboutVideoSection6Title => 'Bezienswaardigheden';

  @override
  String get aboutVideoSection6Bullet1 => '3G: 1080p60';

  @override
  String get aboutVideoSection6Bullet2 => '6G: 2160p30';

  @override
  String get aboutVideoSection6Bullet3 => '12G: 2160p60';

  @override
  String get aboutVideoSection7Title => 'Om naar te kijken';

  @override
  String get aboutVideoSection7Bullet1 => 'EDID';

  @override
  String get aboutVideoSection7Bullet2 => 'HDCP';

  @override
  String get aboutVideoSection7Bullet3 => 'Lengtes';

  @override
  String get aboutVideoSection8Title => 'Video-IP';

  @override
  String get aboutVideoSection8Bullet1 => 'Flexibele.';

  @override
  String get aboutVideoSection8Bullet2 => 'Netwerkbelasting.';

  @override
  String get aboutVideoSection8Bullet3 => 'Eigen LAN vereist.';

  @override
  String get aboutVideoSection9Title => 'Grond';

  @override
  String get aboutVideoSection9Bullet1 => 'Zelfde resolutie/FPS.';

  @override
  String get aboutVideoSection9Bullet2 => 'Correcte mapping.';

  @override
  String get aboutVideoSection9Bullet3 => 'Test met bezienswaardigheden.';

  @override
  String get aboutVideoChecklistTitle => 'Voordat je in paniek raakt';

  @override
  String get aboutVideoChecklistBullet1 => 'Controleer resolutie/FPS.';

  @override
  String get aboutVideoChecklistBullet2 => 'Testbron → scherm.';

  @override
  String get aboutVideoChecklistBullet3 => 'Vereenvoudig de keten.';

  @override
  String get homeBpmSubtitle => 'Taptempo, BPM ↔ ms conversie, Hz, meting.';

  @override
  String get bpmTitle => 'BPM';

  @override
  String get bpmTapTitle => 'Tik op tempo';

  @override
  String get bpmTapButton => 'Type';

  @override
  String get bpmResetTap => 'Kranen opnieuw instellen';

  @override
  String get bpmDetectedLabel => 'BPM gedetecteerd';

  @override
  String get bpmTapHint =>
      'Tik meerdere keren (idealiter 4 tot 8 tikken) om een ​​stabiel gemiddelde te verkrijgen.';

  @override
  String get bpmManualTitle => 'Handmatige BPM';

  @override
  String get bpmManualLabel => 'BPM';

  @override
  String get bpmManualHint => 'Ex. 128';

  @override
  String get commonAdd => 'Toevoegen';

  @override
  String get commonEdit => 'Wijzigen';

  @override
  String get commonDelete => 'VERWIJDEREN';

  @override
  String get commonCopied => 'Gekopieerd naar klembord.';

  @override
  String get patchCreateGdtfTitle => 'Maak een GDTF (eenvoudig)';

  @override
  String get patchCreateGdtfSubtitle =>
      'Handmatige creatie van een apparaat in tabelvorm.';

  @override
  String get gdtfSimpleTitle => 'Maker GDTF (eenvoudig)';

  @override
  String get gdtfDeviceSectionTitle => 'Apparaat';

  @override
  String get gdtfChannelsSectionTitle => 'Kanalen';

  @override
  String get gdtfImportJsonTitle => 'JSON importeren';

  @override
  String get gdtfExportJsonTitle => 'JSON exporteren';

  @override
  String get gdtfImportJsonHint => 'Plak de JSON hier';

  @override
  String get gdtfManufacturerLabel => 'Fabrikant';

  @override
  String get gdtfModelLabel => 'Model';

  @override
  String get gdtfModeNameLabel => 'Modusnaam';

  @override
  String get gdtfChannelsCountLabel => 'Kanalen';

  @override
  String get gdtfFootprintLabel => 'Voetafdruk';

  @override
  String get gdtfColIndex => '#';

  @override
  String get gdtfColName => 'Naam';

  @override
  String get gdtfColDmx => 'DMX';

  @override
  String get gdtfColType => 'Vriendelijk';

  @override
  String get gdtfColRes => '8/16';

  @override
  String get gdtfColDefault => 'Standaard';

  @override
  String get gdtfColActions => 'Acties';

  @override
  String get gdtfMoveUp => 'Om omhoog te gaan';

  @override
  String get gdtfMoveDown => 'Om naar beneden te komen';

  @override
  String get gdtfChannelAddTitle => 'Voeg een kanaal toe';

  @override
  String get gdtfChannelEditTitle => 'Kanaal bewerken';

  @override
  String get gdtfFieldName => 'Naam';

  @override
  String get gdtfFieldDmx => 'Adres DMX';

  @override
  String get gdtfFieldType => 'Vriendelijk';

  @override
  String get gdtfFieldResolution => 'Oplossing';

  @override
  String get gdtfRes8 => '8-bits';

  @override
  String get gdtfRes16 => '16-bits';

  @override
  String get gdtfFieldDefault8 => 'Standaardwaarde (0–255)';

  @override
  String get gdtfFieldDefault16 => 'Standaardwaarde (0–65535)';

  @override
  String get gdtfDefaultChannelName => 'Kanaal';

  @override
  String get gdtfMvpHint =>
      'MVP: JSON-export (klembord). De daadwerkelijke GDTF-export (XML+ZIP) komt hierna.';

  @override
  String get gdtfTypeDimmer => 'Dimmer';

  @override
  String get gdtfTypePan => 'Knal';

  @override
  String get gdtfTypeTilt => 'Kantelen';

  @override
  String get gdtfTypeColor => 'Kleur';

  @override
  String get gdtfTypeGobo => 'Gobo';

  @override
  String get gdtfTypeShutter => 'Sluiter';

  @override
  String get gdtfTypePrism => 'Prisma';

  @override
  String get gdtfTypeZoom => 'Zoom';

  @override
  String get gdtfTypeFocus => 'Focus';

  @override
  String get gdtfTypeIris => 'Iris';

  @override
  String get gdtfTypeEffect => 'Effect';

  @override
  String get gdtfTypeCustom => 'Aangepast';

  @override
  String get gdtfEasyTitle => 'Maak een GDTF (eenvoudig)';

  @override
  String get gdtfTemplatesTitle => 'Voorselecties';

  @override
  String get gdtfCreateDefaultPreset => 'Maak de standaardvoorinstelling';

  @override
  String get gdtfTemplatesHint =>
      'Creëert een snelle basis (dimmer, sluiter, pan, tilt, RGB, etc.) en voltooit vervolgens de DMX adressen en de standaardinstellingen.';

  @override
  String get gdtfExportButton => 'Exporteer GDTF';

  @override
  String get gdtfExportHint =>
      'Minimale .gdtf-export (description.xml) en vervolgens delen (Mail, WhatsApp, AirDrop, Drive…).';

  @override
  String get gdtfExportNeedDmx =>
      'Voeg ten minste één DMX-adres toe om te exporteren.';

  @override
  String get gdtfExportDone => 'GDTF geëxporteerd.';

  @override
  String get gdtfExportError => 'Kan GDTF niet exporteren.';

  @override
  String get gdtfShareSubject => 'Bestand GDTF';

  @override
  String get gdtfShareText => 'Hier is het geëxporteerde GDTF-bestand.';

  @override
  String get gdtfFieldRole => 'Instelling';

  @override
  String get gdtfDmxHint => 'Blanco of 1–512';

  @override
  String get gdtfFieldDefault => 'Standaard';

  @override
  String get gdtfDefaultHint8 => '0–255';

  @override
  String get gdtfDefaultHint16 => '0–65535';

  @override
  String get gdtfChannelDefaultName => 'Kanaal';

  @override
  String get gdtfRoleEmpty => 'Leeg / Onbekend';

  @override
  String get gdtfRoleDimmer => 'Dimmer';

  @override
  String get gdtfRoleShutter => 'Sluiter';

  @override
  String get gdtfRolePan => 'Knal';

  @override
  String get gdtfRoleTilt => 'Kantelen';

  @override
  String get gdtfRoleRed => 'Rood (R)';

  @override
  String get gdtfRoleGreen => 'Groen (G)';

  @override
  String get gdtfRoleBlue => 'Blauw (B)';

  @override
  String get gdtfRoleColor => 'Kleur';

  @override
  String get gdtfRoleGobo => 'Gobo';

  @override
  String get gdtfRoleZoom => 'Zoom';

  @override
  String get gdtfRoleFocus => 'Focus';

  @override
  String get gdtfRolePrism => 'Prisma';

  @override
  String get gdtfRoleEffect => 'Effect';

  @override
  String get gdtfRoleControl => 'Controle';

  @override
  String get gdtfRoleCustom => 'Aangepast';

  @override
  String get gdtfResUnknown => 'Leeg';

  @override
  String get gdtfPresetDimmer => 'Dimmer';

  @override
  String get gdtfPresetShutter => 'Sluiter';

  @override
  String get gdtfPresetPan => 'Knal';

  @override
  String get gdtfPresetTilt => 'Kantelen';

  @override
  String get gdtfPresetRed => 'R';

  @override
  String get gdtfPresetGreen => 'G';

  @override
  String get gdtfPresetBlue => 'B';

  @override
  String get gdtfPresetColor1 => 'Kleur 1';

  @override
  String get gdtfPresetGobo1 => 'Gobo 1';

  @override
  String get gdtfPresetZoom => 'Zoom';

  @override
  String get gdtfPresetFocus => 'Focus';

  @override
  String get gdtfPresetPrism => 'Prisma';

  @override
  String get gdtfPresetEffect => 'Effect';

  @override
  String get gdtfPresetControl => 'Controle';

  @override
  String get commonApply => 'Toepassen';

  @override
  String get gdtfPresetLabel => 'Keuze';

  @override
  String get gdtfPresetFixtureSimple => 'Eenvoudige bevestiging';

  @override
  String get gdtfPresetBarreLed => 'LED-balk';

  @override
  String get gdtfTemplatesHintShort =>
      'Kies een voorinstelling en pas deze vervolgens toe. Vervolgens kunt u DMX en de standaardinstellingen aanpassen en de volgorde wijzigen door middel van slepen en neerzetten.';

  @override
  String get gdtfExportNeedChannels =>
      'Voegt ten minste één kanaal toe om te exporteren.';

  @override
  String get homeDrawerContact => 'Neem contact op met de ontwikkelaar';

  @override
  String get homeDrawerSuggestItem => 'Voeg een artikel toe aan de catalogus';

  @override
  String get homeErrorOpenEmail => 'Kan e-mailtoepassing niet openen.';

  @override
  String get homeErrorOpenForm => 'Kan het formulier niet openen.';

  @override
  String get homeContactEmailSubject => 'Vraag over Mijn Tech-app';

  @override
  String get bpmManualHelp =>
      'Als er handmatig een BPM wordt ingevoerd, heeft deze voorrang op het taptempo.';

  @override
  String get bpmConversionsTitle => 'Conversies';

  @override
  String get bpmActiveLabel => 'Actieve BPM';

  @override
  String get bpmMsPerBeat => 'Lengte van een tel';

  @override
  String get bpmHz => 'Frequentie';

  @override
  String get bpmSecPerBar44 => 'Duur van een maat (4/4)';

  @override
  String get bpmDisclaimer =>
      'Geschatte indicatie. Neem contact op met de metronoom als deze van cruciaal belang is.';

  @override
  String get laserToolsTitle => 'Hulpmiddelen';

  @override
  String get laserBeamSizeTitle => 'Grootte van de straal';

  @override
  String get laserBeamSizeSubtitle =>
      'Diameter, straal en oppervlakte van de plek op een bepaalde afstand.';

  @override
  String get laserBeamInputsTitle => 'Instellingen';

  @override
  String get laserBeamDistanceLabel => 'Afstand';

  @override
  String get laserBeamDistanceHint => 'm (bijv. 12)';

  @override
  String get laserBeamFormulaHint =>
      'Berekening: D(z) = D0 + θ · z (θ in rad, volledige hoek).';

  @override
  String get laserBeamResultsTitle => 'Resultaten';

  @override
  String get laserBeamDiameterAtDistance => 'Diameter op afstand';

  @override
  String get laserBeamRadiusAtDistance => 'Straal naar afstand';

  @override
  String get laserBeamAreaAtDistance => 'Vlek oppervlak';

  @override
  String get sunTimesPageTitle => 'Zonsopgang/zonsondergang';

  @override
  String get sunTimesSelectionTitle => 'Instellingen';

  @override
  String get sunTimesCityLabel => 'Stad';

  @override
  String get sunTimesDateLabel => 'Datum';

  @override
  String get sunTimesResultsTitle => 'Resultaten';

  @override
  String get sunTimesSunriseLabel => 'Zonsopgang';

  @override
  String get sunTimesSunsetLabel => 'Zonsondergang';

  @override
  String get sunTimesDayLengthLabel => 'Lengte van de dag';

  @override
  String get sunTimesDisclaimer =>
      'Indicatieve waarden (astronomisch model). Neem indien nodig contact op met een officiële bron (evenement, beveiliging, filmopnamen).';

  @override
  String get sunTimesThresholdTitle => 'Helderheidsdrempels (benchmarks)';

  @override
  String get sunTimesThresholdIntro =>
      'Orden van grootte die nuttig zijn voor het anticiperen op omgevingslicht (zeer variabel afhankelijk van het weer, de breedtegraad, het seizoen, obstakels, lichtvervuiling).';

  @override
  String get sunTimesLuxDaylight => 'Vol daglicht (exclusief directe zon)';

  @override
  String get sunTimesLuxOvercast => 'Bewolkt (typisch)';

  @override
  String get sunTimesLuxSunrise => 'Zonsopgang/ondergang (helder)';

  @override
  String get sunTimesLuxCivilTwilight => 'Civiele schemergrens (duidelijk)';

  @override
  String get sunTimesLuxFullMoon => 'Volle maan (helder)';

  @override
  String get sunTimesThresholdNote =>
      'Tip: bij de markering “bruikbaar zonder verlichting” streven we vaak naar > 100–300 lx. Voor fijn werk liever 500 lx en meer.';

  @override
  String get sunTimesParamsTitle => 'Instellingen';

  @override
  String get sunTimesPickDate => 'Kies een datum';

  @override
  String get sunTimesSunrise => 'Tillen';

  @override
  String get sunTimesSunset => 'Om te slapen';

  @override
  String get sunTimesDayLength => 'Lengte van de dag';

  @override
  String get sunTimesPolarNote =>
      'Let op: in gebieden dicht bij de polen kan zonsopgang/ondergang afwezig zijn, afhankelijk van het seizoen.';

  @override
  String get sunTimesLuxThresholdTitle => 'Helderheidsdrempels (benchmarks)';

  @override
  String get sunTimesLuxBulletNightDark => 'Donkere nacht: < 1 lux';

  @override
  String get sunTimesLuxBulletNightMoon => 'Nacht (maan): ~0,1–1 lux';

  @override
  String get sunTimesLuxBulletFullMoon => 'Volle maan: ~0,1–0,3 lux';

  @override
  String get sunTimesLuxBulletCivilTwilight =>
      'Burgerlijke schemering: Zon bij -6°';

  @override
  String get sunTimesLuxBulletUrbanLow => 'Lage stadsverlichting: ~5–20 lux';

  @override
  String get sunTimesLuxBulletOfficeLow => 'Laag kantoor: ~100–300 lux';

  @override
  String get sunTimesLuxBulletOfficeStd => 'Standaard kantoor: ~300–500 lux';

  @override
  String get sunTimesLuxBulletOutdoorDay =>
      'Buiten overdag: ~10.000–25.000 lux';

  @override
  String get sunTimesLuxBulletDirectSun => 'Direct zonlicht: ~100.000 lux';

  @override
  String get sunTimesLuxDisclaimer =>
      'Indicatieve benchmarks: weer/bewolking, omgeving, seizoen en reliëf kunnen sterk variëren.';

  @override
  String get sunTimesTwilightTitle => 'Schemering: wat betekent het?';

  @override
  String get sunTimesTwilightCivil =>
      'Civiel (-6°): licht nog steeds voldoende om de omgeving te onderscheiden zonder kunstlicht.';

  @override
  String get sunTimesTwilightNautical =>
      'Nautisch (-12°): de horizon wordt moeilijk te onderscheiden; zichtbare sterren.';

  @override
  String get sunTimesTwilightAstronomical =>
      'Astronomisch (-18°): de lucht wordt als \"zwart\" beschouwd (exclusief lichtvervuiling).';

  @override
  String get sunTimesTwilightAnglesNote =>
      'Hoeken uitgedrukt in graden onder de horizon (negatieve zon).';

  @override
  String get sunTimesLuxBulletAstronomicalTwilight =>
      'Astronomische schemering: Zon op -18°';

  @override
  String get sunTimesTimelineTitleStep30 => 'Tijdlijn (niet 30 min)';

  @override
  String get sunTimesTimelineColTime => 'Uur';

  @override
  String get sunTimesTimelineColElevation => 'Hoogte';

  @override
  String get sunTimesTimelineColMarker => 'Oriëntatiepunt';

  @override
  String get sunTimesTimelineColLux => 'Lux (bestelling)';

  @override
  String get sunTimesTimelineFootnote =>
      'Indicatieve benchmarks (weer/wolken, omgeving, seizoen) — handig voor het voorbereiden van een show.';

  @override
  String get aboutUniverseToArtnetColSubnet => 'Subnet';

  @override
  String appVersionLabel(Object version, Object build) {
    return 'Versie $version ($build)';
  }

  @override
  String appVersionLabelNoBuild(Object version) {
    return 'Versie $version';
  }

  @override
  String get aboutUniverseToArtnetColUniverse => 'Universum';

  @override
  String get videoLedResultWallResolution => 'Muurresolutie';

  @override
  String get videoLedResultWallSize => 'Grootte van de muur';

  @override
  String get videoLedResultTile => 'Plaat';

  @override
  String get videoLedResultPitch => 'Toonhoogte';

  @override
  String get lightFilterLedTabConvert => 'Conversie';

  @override
  String get lightFilterLedTabProfiles => 'Mijn armaturen';

  @override
  String get lightFilterLedSourceLabel => 'Lichtbron';

  @override
  String get lightFilterLedEngineRgbww => 'RGBWW (warm + koud wit)';

  @override
  String get lightFilterLedEngineRgbaw => 'RGBAW';

  @override
  String get lightFilterLedEngineRgbauv => 'RGBAUV';

  @override
  String get lightFilterLedEngineRgbwauv => 'RGBWAUV';

  @override
  String get lightFilterLedEngineRgbrcl => 'RGBRCL (rood, cyaan, limoen)';

  @override
  String get lightFilterLedEngineCmy => 'CMY';

  @override
  String get lightFilterLedSaveProfileTitle => 'Armatuurprofiel opslaan';

  @override
  String get lightFilterLedProfileNameLabel => 'Naam armatuur';

  @override
  String get patchMvrViewTable => 'Spreadsheet';

  @override
  String get patchMvrViewVisual => 'Visueel';

  @override
  String get consoleTitle => 'Troosten';

  @override
  String get consoleSubtitle => 'Patch DMX en tools GDTF';

  @override
  String get consolePatchTitle => 'Patch DMX';

  @override
  String get consolePatchSubtitle => 'Importeer een MVR en analyseer de patch';

  @override
  String get consoleGdtfTitle => 'GDTF';

  @override
  String get consoleGdtfSubtitle => 'Creëer of analyseer een GDTF bestand';

  @override
  String get consoleMa3ForgeTitle => 'MA3-plug-in Forge';

  @override
  String get consoleMa3ForgeSubtitle =>
      'Genereer Lua-plug-ins voor grandMA3 met AI';

  @override
  String lightFilterLedProfileSaved(String name) {
    return 'Profiel “$name” opgeslagen';
  }

  @override
  String get lightFilterLedNoProfiles => 'Geen armatuurprofiel opgeslagen';

  @override
  String get lightFilterLedNoProfilesHint =>
      'Kalibreer de kanalen op het tabblad Conversie,\nsla vervolgens op met het 💾-pictogram.';

  @override
  String get lightFilterLedTitle => 'Bijpassende LED-filters';

  @override
  String get lightFilterLedDescription =>
      'Conversie van LEE-, Rosco-filters naar LED-engines (RGB, RGBA, RGBW, enz.).';

  @override
  String get lightFilterLedBrandLabel => 'Merk';

  @override
  String get lightFilterLedSearchLabel => 'Onderzoek';

  @override
  String get lightFilterLedSearchHint => 'Filtercode of naam';

  @override
  String get lightFilterLedFilterLabel => 'Gefilterd';

  @override
  String get lightFilterLedEngineLabel => 'LED-motor';

  @override
  String get lightFilterLedShowPercentLabel => 'Weergeven als percentage';

  @override
  String get lightFilterLedShowPercentHint =>
      'Anders worden waarden weergegeven als DMX 0–255.';

  @override
  String get lightFilterLedHexLabel => 'Referentie kleur';

  @override
  String get lightFilterLedChromaticityLabel => 'Chromaticiteit';

  @override
  String get lightFilterLedTransmissionLabel => 'Overdragen';

  @override
  String get lightFilterLedResultTitle => 'Resultaat';

  @override
  String get lightFilterLedOriginalPreviewLabel => 'Filtervoorbeeld';

  @override
  String get lightFilterLedApproximatePreviewLabel => 'Grof LED-overzicht';

  @override
  String get lightFilterLedDisclaimer =>
      'Alleen indicatief resultaat. De daadwerkelijke weergave is afhankelijk van de projector, het spectrum, de kalibratie, de kleurmodus en de gebruikscontext.';

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
  String get aboutSearchHint => 'Zoek in referenties';

  @override
  String get aboutSearchNoResults => 'Geen resultaten gevonden.';

  @override
  String get homePinnedTitle => 'Pinnen';

  @override
  String get homePinnedSubtitle => 'Vind snel uw vastgezette referenties.';

  @override
  String get pinnedReferencesTitle => 'Vastgezette referenties';

  @override
  String get pinnedReferencesEmpty =>
      'Er zijn momenteel geen referenties vastgezet.';

  @override
  String get aboutPinAddTooltip => 'Zet deze referentie vast';

  @override
  String get aboutPinRemoveTooltip => 'Verwijder deze pin';

  @override
  String get aboutPinAddedMessage => 'Vastgezette referentie.';

  @override
  String get aboutPinRemovedMessage => 'Pin verwijderd.';

  @override
  String get homeDrawerSubscriptions => 'Abonnementen';

  @override
  String get subscriptionPageTitle => 'Abonnementen';

  @override
  String get subscriptionHeadlineAllTitle => 'Kies uw formule';

  @override
  String get subscriptionHeadlineAllSubtitle =>
      'Vind hier uw huidige aankopen en abonnementen die nog beschikbaar zijn.';

  @override
  String subscriptionHeadlineUnlock(Object module) {
    return 'Ontgrendel $module';
  }

  @override
  String get subscriptionHeadlineVideoSubtitle =>
      'Je kunt alleen video kopen of Pro kiezen om alles te ontgrendelen.';

  @override
  String get subscriptionHeadlineLightSubtitle =>
      'Je kunt alleen Light kopen, of Pro kiezen om alles te ontgrendelen.';

  @override
  String get subscriptionHeadlineLaserSubtitle =>
      'Je kunt alleen Laser kopen, of Pro kiezen om alles te ontgrendelen.';

  @override
  String get subscriptionHeadlineConsoleSubtitle =>
      'Je kunt alleen Console kopen, of Pro kiezen om alles te ontgrendelen.';

  @override
  String get subscriptionHeadlineProSubtitle =>
      'Volledige toegang tot alle geavanceerde secties.';

  @override
  String get subscriptionStoreUnavailable =>
      'Winkel momenteel niet beschikbaar.';

  @override
  String get subscriptionLoadError => 'Kan abonnementen niet laden.';

  @override
  String get subscriptionRestorePurchases => 'Mijn aankopen herstellen';

  @override
  String get subscriptionPrivacy => 'Vertrouwelijkheid';

  @override
  String get subscriptionTerms => 'CGU';

  @override
  String get subscriptionBestValue => 'BESTE WAARDE';

  @override
  String get subscriptionOwned => 'Gekocht';

  @override
  String get subscriptionIncludedInPro => 'Inbegrepen in Pro';

  @override
  String get subscriptionProductUnavailable => 'Product niet beschikbaar.';

  @override
  String get subscriptionSubscribeAll => 'Abonneren - Ontgrendel alles';

  @override
  String subscriptionSubscribeModule(Object module) {
    return 'Abonneren — $module';
  }

  @override
  String get subscriptionCategoryVideoTitle => 'Video';

  @override
  String get subscriptionCategoryLightTitle => 'Licht';

  @override
  String get subscriptionCategoryLaserTitle => 'Laser';

  @override
  String get subscriptionCategoryConsoleTitle => 'Troosten';

  @override
  String get subscriptionCategoryProTitle => 'ShowTech Tools Pro';

  @override
  String get subscriptionCategoryVideoDescription =>
      'Toegang tot het videogedeelte.';

  @override
  String get subscriptionCategoryLightDescription =>
      'Toegang tot het lichtgedeelte.';

  @override
  String get subscriptionCategoryLaserDescription =>
      'Toegang tot het Lasergedeelte.';

  @override
  String get subscriptionCategoryConsoleDescription =>
      'Toegang tot het Console-gedeelte.';

  @override
  String get subscriptionCategoryProDescription =>
      'Volledige toegang tot alle secties.';

  @override
  String get electricityFreeSection => 'Vrij';

  @override
  String get electricityProSection => 'Elektriciteit abonnement';

  @override
  String get riggingFreeSection => 'Vrij';

  @override
  String get riggingProSection => 'Abonnement Rigging';

  @override
  String get videoFreeSection => 'Vrij';

  @override
  String get videoProSection => 'Video abonnement';

  @override
  String get lumiereFreeSection => 'Vrij';

  @override
  String get lumiereProSection => 'Verlichting abonnement';

  @override
  String get consoleFreeSection => 'Vrij';

  @override
  String get consoleProSection => 'Console abonnement';

  @override
  String get lumiereFilterEquivDescription =>
      'Equivalenten Lee ↔ Roscolux ↔ e-colour+';

  @override
  String get audioSplModeDistance => 'Afstand → SPL';

  @override
  String get audioSplModePower => 'Vermogen → SPL';

  @override
  String get homeElectricityTitle => 'Elektriciteit';

  @override
  String get homeElectricitySubtitle =>
      'Vermogen, stroom, kabelsecties en UPS-autonomie.';

  @override
  String get subscriptionCategoryElectricityTitle => 'Elektriciteit';

  @override
  String get subscriptionCategoryElectricityDescription =>
      'Elektrisch gereedschap voor stroom, fasen, kabels en UPS.';

  @override
  String get subscriptionCategoryRiggingTitle => 'Rigging';

  @override
  String get subscriptionCategoryRiggingDescription =>
      'Tuiggereedschap voor hoofdstel, hoeken en verificatie WLL / CMU.';

  @override
  String get subscriptionHeadlineElectricitySubtitle =>
      'Ontgrendelt alle professionele elektrische gereedschappen.';

  @override
  String get subscriptionHeadlineRiggingSubtitle =>
      'Ontgrendelt alle professionele rigging-tools.';

  @override
  String get electricityTitle => 'Elektriciteit';

  @override
  String get electricityToolPowerCurrentTitle => 'Vermogen / stroom';

  @override
  String get electricityToolPowerCurrentSubtitle =>
      'Bereken vermogen, stroom, spanning of energie in enkel- of driefasig.';

  @override
  String get electricityToolPhasePowerTitle => 'Vermogen per fase';

  @override
  String get electricityToolPhasePowerSubtitle =>
      'Verdeel een totaal vermogen en lees de stroom per fase af.';

  @override
  String get electricityToolLoadBalancerTitle => 'Verdeling van de lading';

  @override
  String get electricityToolLoadBalancerSubtitle =>
      'Voeg armaturen toe uit de catalogus, wijs ze toe per fase en controleer de stroomsterkte van uw paneel.';

  @override
  String get electricityToolGeneratorTitle => 'Aggregaat';

  @override
  String get electricityPowerFactorToolTitle => 'Vermogensfactor (kVA ↔ kW)';

  @override
  String get electricityToolPowerFactorSubtitle =>
      'Zet schijnbaar (kVA) en actief vermogen (kW) via cos φ in beide richtingen om, met blindvermogen (kVAR).';

  @override
  String get electricityPowerFactorModeTitle => 'Berekeningsrichting';

  @override
  String get electricityPowerFactorModeKvaToKw => 'kVA → kW';

  @override
  String get electricityPowerFactorModeKwToKva => 'kW → kVA';

  @override
  String get electricityPowerFactorInputsTitle => 'Bekende waarden';

  @override
  String get electricityPowerFactorApparentLabel => 'Schijnbaar vermogen';

  @override
  String get electricityPowerFactorApparentHint => 'Bijv.: 10';

  @override
  String get electricityPowerFactorActiveLabel => 'Actief vermogen';

  @override
  String get electricityPowerFactorActiveHint => 'Bijv.: 8';

  @override
  String get electricityPowerFactorCosPhiLabel => 'Vermogensfactor (cos φ)';

  @override
  String get electricityPowerFactorCosPhiHint => '0.1 – 1.0, bijv.: 0.8';

  @override
  String get electricityPowerFactorResultsTitle => 'Resultaten';

  @override
  String get electricityPowerFactorReactiveLabel => 'Blindvermogen';

  @override
  String get electricityPowerFactorAngleLabel => 'Faseverschuivingshoek';

  @override
  String get electricityPowerFactorEnterValues =>
      'Vul de waarden in om het resultaat te zien.';

  @override
  String get electricityPowerFactorFormulaNote =>
      'kW = kVA × cos φ · kVA = kW / cos φ · kVAR = √(kVA² − kW²). cos φ = 1 betekent een zuiver resistieve belasting (geen blindvermogen).';

  @override
  String get electricityToolGeneratorSubtitle =>
      'Dimensionering: actief vermogen → kVA, gelijktijdigheidsfactor, veiligheidsmarge, aanbevolen standaardmaat.';

  @override
  String get electricityGeneratorInputsTitle => 'Te voeden belasting';

  @override
  String get electricityGeneratorActivePowerLabel =>
      'Geïnstalleerd actief vermogen';

  @override
  String get electricityGeneratorActivePowerHint =>
      'Som van de actieve vermogens (zie lastverdeler)';

  @override
  String get electricityGeneratorCosPhiLabel => 'Gemiddelde cos φ';

  @override
  String get electricityGeneratorCosPhiHint =>
      '0,85–0,95 typisch (dimmers, LED, versterkers)';

  @override
  String get electricityGeneratorDiversityLabel => 'Gelijktijdigheidsfactor';

  @override
  String get electricityGeneratorDiversityHint =>
      '% van het geïnstalleerde vermogen dat werkelijk gelijktijdig wordt gebruikt';

  @override
  String get electricityGeneratorMarginLabel => 'Veiligheidsmarge';

  @override
  String get electricityGeneratorMarginHint =>
      'Aanbevolen marge voor opstartpieken';

  @override
  String get electricityGeneratorFuelRateLabel => 'Specifiek verbruik';

  @override
  String get electricityGeneratorFuelRateHint =>
      '≈0,25 L/kWh typisch voor een goed belaste diesel';

  @override
  String get electricityGeneratorResultsTitle => 'Aanbevolen aggregaat';

  @override
  String get electricityGeneratorRecommendedLabel => 'Aanbevolen standaardmaat';

  @override
  String get electricityGeneratorRecommendedOverMax =>
      '> 800 kVA — maatwerk, raadpleeg een verhuurder';

  @override
  String get electricityGeneratorApparentNeededLabel =>
      'Benodigd schijnbaar vermogen';

  @override
  String get electricityGeneratorCurrentLabel => 'Geschatte uitgangsstroom';

  @override
  String get electricityGeneratorFuelPerHourLabel => 'Geschat verbruik';

  @override
  String get electricityGeneratorFuelPerShowLabel => 'Over 8 u show';

  @override
  String get electricityGeneratorEnterValues =>
      'Voer het actieve vermogen in om te berekenen';

  @override
  String get electricityGeneratorDisclaimer =>
      'Indicatieve schatting — controleer altijd bij de aanbevelingen van de verhuurder/fabrikant van het aggregaat (hoogte, temperatuur, niet-lineaire belastingen).';

  @override
  String get electricityToolCableSectionTitle => 'Kabel sectie';

  @override
  String get electricityToolCableSectionSubtitle =>
      'Bereken een sectie op basis van stroom of vermogen, lengte, spanningsval en kabelreferentie.';

  @override
  String get electricityToolUpsTitle => 'UPS-autonomie';

  @override
  String get electricityToolUpsSubtitle =>
      'Schat de autonomie van een batterij of een UPS in, afhankelijk van de belasting.';

  @override
  String get electricityInputsTitle => 'Voorgerechten';

  @override
  String get electricityResultsTitle => 'Resultaten';

  @override
  String get electricityEnterValuesToCalculate =>
      'Voert geldige waarden in om te berekenen.';

  @override
  String get electricityTotalPowerLabel => 'Totaal vermogen';

  @override
  String get electricityTotalPowerHint => 'Ex. 22000';

  @override
  String get electricityPowerPerPhaseLabel => 'Vermogen per fase';

  @override
  String get electricityCurrentPerPhaseLabel => 'Stroom per fase';

  @override
  String get electricityCurrentLabel => 'Vloeiend';

  @override
  String get electricityPhaseCountLabel => 'Aantal fasen';

  @override
  String get electricityConsumptionCurrentLabel =>
      'Verbruik / werkelijke stroom';

  @override
  String get electricityConsumptionCurrentHint => '32';

  @override
  String get electricityBreakerSizeLabel => 'Grootte van de stroomonderbreker';

  @override
  String get electricityBreakerSizeHint => '32';

  @override
  String get electricityCableLengthLabel => 'Kabel lengte';

  @override
  String get electricityCableLengthHint => 'Voorbeeld 30';

  @override
  String get electricityAllowedVoltageDropLabel => 'Maximale spanningsval';

  @override
  String get electricityAllowedVoltageDropHint => 'Voorbeeld 3';

  @override
  String get electricityRecommendedCableSectionLabel => 'Aanbevolen sectie';

  @override
  String get electricityMaxCurrentForSectionLabel => 'Toegestane stroom';

  @override
  String get electricityVoltageDropLabel => 'Spanningsdaling';

  @override
  String get electricityBreakerCheckLabel =>
      'Controle van de stroomonderbreker';

  @override
  String get electricityStatusOk => 'Oké';

  @override
  String get electricityStatusWarning => 'Te controleren';

  @override
  String get electricityImportantNoteTitle => 'Belangrijke opmerking';

  @override
  String get electricityCableSectionDisclaimer =>
      'Indicatieve berekening gebaseerd op een referentietabel geïnspireerd op IEC 60364-5-52. Controleer altijd de RGIE/AREI, de daadwerkelijke installatiemethode, de temperatuur, de kabelgroepering en de bescherming bij een gekwalificeerde elektricien.';

  @override
  String get electricityConsumptionInputTypeTitle => 'Bekende waarde';

  @override
  String get electricityInputCurrent => 'Stroom (A)';

  @override
  String get electricityInputPower => 'Vermogen (W)';

  @override
  String get electricityVoltageLabel => 'Spanning (U)';

  @override
  String get electricityVoltageHint => 'Ex. 230 of 400';

  @override
  String get electricityPowerFactorLabel => 'Vermogensfactor (cos φ)';

  @override
  String get electricityPowerFactorHint => 'Voorbeeld 1.0';

  @override
  String get electricityCableReferenceTitle => 'Kabelreferentie';

  @override
  String get electricityCopper => 'Koper';

  @override
  String get electricityAluminium => 'Aluminium';

  @override
  String get electricityInsulationPvc => 'PVC 70°C';

  @override
  String get electricityInsulationXlpe => 'XLPE 90°C';

  @override
  String get electricityInstallConduit => 'Gedreven';

  @override
  String get electricityInstallFreeAir => 'Vrije lucht';

  @override
  String get electricityCalculatedCurrentLabel => 'Berekende stroom';

  @override
  String get electricityRecommendedBreakerLabel =>
      'Aanbevolen stroomonderbreker';

  @override
  String get electricityNoStandardBreaker => 'Geen geschikt standaardkaliber';

  @override
  String get electricityStatusLabel => 'Status';

  @override
  String get electricityCircuitTypeTitle => 'Circuittype';

  @override
  String get electricitySinglePhase => 'Enkele fase';

  @override
  String get electricityThreePhase => 'Driefasig';

  @override
  String get electricityResultActivePower => 'Actieve kracht';

  @override
  String get electricityResultCurrent => 'Vloeiend';

  @override
  String get electricityResultVoltage => 'Spanning';

  @override
  String get electricityResultEnergy => 'Energie';

  @override
  String get electricityInsufficient => 'Onvoldoende waarden';

  @override
  String get electricityCalcPower => 'Stroom';

  @override
  String get electricityCalcCurrent => 'Vloeiend';

  @override
  String get electricityCalcVoltage => 'Spanning';

  @override
  String get electricityCalcEnergy => 'Energie';

  @override
  String get electricityRef16AMono => '16 Een mono';

  @override
  String get electricityRef32AMono => '32 Een mono';

  @override
  String get electricityRef32ATri => '32 Een soort';

  @override
  String get electricityRef63ATri => '63 Gesorteerd';

  @override
  String get electricityRef125ATri => '125 Een tri';

  @override
  String get electricityFormulaTri => 'P = √3 × U × I × cos φ';

  @override
  String get electricityFormulaMono => 'P = U × I × cos φ';

  @override
  String get electricityFormulaTriDesc =>
      'Driefasige formule voor gebalanceerd opladen.';

  @override
  String get electricityFormulaMonoDesc => 'Eenfasige formule.';

  @override
  String get electricityCircuitType => 'Circuittype';

  @override
  String get electricityMono => 'Mono';

  @override
  String get electricityMonoDesc => 'Eenfasig 230 V-circuit.';

  @override
  String get electricityThreePhaseDesc => '400 V driefasig circuit.';

  @override
  String get electricityCalcFor => 'Berekenen';

  @override
  String get electricityFieldPower => 'Stroom';

  @override
  String get electricityFieldPowerHint => 'Ex. 3680';

  @override
  String get electricityFieldCurrent => 'Vloeiend';

  @override
  String get electricityFieldCurrentHint => 'Voorbeeld 16';

  @override
  String get electricityFieldVoltage => 'Spanning';

  @override
  String get electricityFieldVoltageHint => '230';

  @override
  String get electricityFieldDuration => 'Duur';

  @override
  String get electricityFieldDurationHint => 'Voorbeeld 2';

  @override
  String get electricityFieldPf => 'omdat φ';

  @override
  String get electricityFieldPfHint => 'Voorbeeld 1.0';

  @override
  String get electricityCalculate => 'Berekenen';

  @override
  String get electricityRefTitle => 'Snelle referenties';

  @override
  String electricityUpsEnergyAvail(String energy) {
    return '$energy Wh beschikbaar';
  }

  @override
  String get electricityUpsBatterySection => 'Batterij';

  @override
  String get electricityUpsCalculate => 'Bereken autonomie';

  @override
  String get electricityUpsCapacityHint => 'Voorbeeld 100';

  @override
  String get electricityUpsCapacityLabel => 'Vaardigheid';

  @override
  String get electricityUpsCountHint => 'Voorbeeld 1';

  @override
  String get electricityUpsCountLabel => 'Aantal batterijen';

  @override
  String get electricityUpsEfficiencyHint => 'Ex. 85';

  @override
  String get electricityUpsEfficiencyLabel => 'Opbrengst';

  @override
  String get electricityUpsLoadDesc => 'Stroomverbruik door de apparatuur.';

  @override
  String get electricityUpsLoadHint => 'Ex. 500';

  @override
  String get electricityUpsLoadLabel => 'Aanval';

  @override
  String get electricityUpsLoadSectionTitle => 'Te leveren lading';

  @override
  String get electricityUpsRef1 => 'Wh beschikbaar';

  @override
  String get electricityUpsRef1Detail =>
      'Capaciteit × spanning × aantal × efficiëntie.';

  @override
  String get electricityUpsRef2 => 'Autonomie';

  @override
  String get electricityUpsRef2Detail =>
      'Beschikbare energie gedeeld door belasting.';

  @override
  String get electricityUpsRef3Title => 'Indicatief resultaat';

  @override
  String get electricityUpsRef3Value =>
      'De werkelijke waarde is afhankelijk van het rendement, de staat van de accu’s en de lading.';

  @override
  String get electricityUpsRefTitle => 'Referenties';

  @override
  String get electricityUpsVoltageHint => 'Voorbeeld 12';

  @override
  String get electricityUpsVoltageLabel => 'Accuspanning';

  @override
  String get riggingToolBridleTitle => '2 punts hoofdstel';

  @override
  String get riggingToolBridleSubtitle =>
      'Volledige berekening van een hoofdstel: lengtes, hoeken, spanningen en veiligheidsstatus.';

  @override
  String get riggingToolAngleFactorTitle => 'Hoekfactor';

  @override
  String get riggingToolAngleFactorSubtitle =>
      'Zie snel het effect van de hoek op de spanning in de strengen.';

  @override
  String get riggingToolMultiPointTitle => 'Meerpunts-bridle';

  @override
  String get riggingToolMultiPointSubtitle =>
      'Trekkracht per streng voor een symmetrische bridle met 2-8 punten, met WLL-controle.';

  @override
  String get riggingLegCountLabel => 'Aantal strengen';

  @override
  String get riggingWllPerLegLabel => 'WLL per streng';

  @override
  String get riggingMultiPointSymmetricNote =>
      'Geldig voor een symmetrische bridle: strengen van gelijke lengte, gecentreerde last, gelijk verdeelde trekkracht. Raadpleeg bij een asymmetrische of complexe opstelling een gekwalificeerde rigger of gecertificeerde software.';

  @override
  String get riggingToolHoistTitle => 'Takel selecteren';

  @override
  String get riggingToolHoistSubtitle =>
      'Te hijsen last → aanbevolen standaardmaat takel, met veiligheidsmarge.';

  @override
  String get riggingHoistRecommendedLabel => 'Aanbevolen takel';

  @override
  String get riggingHoistOverMaxLabel =>
      '> 10.000 kg — buiten het standaardbereik, raadpleeg een hijsspecialist';

  @override
  String get riggingHoistAvailabilityNote =>
      'Indicatieve standaardmaten (0,125 tot 10 t) — de werkelijke beschikbaarheid hangt af van fabrikant en verhuurder.';

  @override
  String get riggingToolWllTitle => 'Verificatie WLL / CMU';

  @override
  String get riggingToolWllSubtitle =>
      'Vergelijk een uitgeoefende belasting met de capaciteit van het materiaal.';

  @override
  String get riggingToolLengthTitle => 'Lengte hoofdstel';

  @override
  String get riggingToolLengthSubtitle =>
      'Bereken lengtes en hoeken zonder belastingberekening.';

  @override
  String get riggingKnownDrop => 'Pijl';

  @override
  String get riggingKnownAngle => 'Hoek';

  @override
  String get riggingKnownLength => 'Lengte';

  @override
  String get riggingAngleFromHorizontalLabel => 'Hoek vanaf horizontaal';

  @override
  String get riggingLegLengthKnownLabel => 'Lengte van een streng';

  @override
  String get riggingLoadWeightLabel => 'Gewicht laden';

  @override
  String get riggingLoadShortLabel => 'Aanval';

  @override
  String get riggingPointALabel => 'HEEFT';

  @override
  String get riggingPointBLabel => 'B';

  @override
  String get riggingTensionLabel => 'Spanning';

  @override
  String get riggingTensionLeftLabel => 'Linkse spanning';

  @override
  String get riggingTensionRightLabel => 'Rechte spanning';

  @override
  String get riggingTensionPerLegLabel => 'Spanning per streng';

  @override
  String get riggingStatusOk => 'Oké';

  @override
  String get riggingStatusWatch => 'Om naar te kijken';

  @override
  String get riggingStatusHigh => 'Leerling';

  @override
  String get riggingStatusDanger => 'Gevaarlijk';

  @override
  String get riggingStatusOkDescription =>
      'Comfortabele hoek. De spanning blijft redelijk.';

  @override
  String get riggingStatusWatchDescription =>
      'Bruikbare hoek, maar de spanning begint toe te nemen.';

  @override
  String get riggingStatusHighDescription =>
      'Lage hoek. De spanning loopt sterk op.';

  @override
  String get riggingStatusDangerDescription =>
      'Zeer lage hoek. Te vermijden configuratie.';

  @override
  String get riggingSafetyDisclaimer =>
      'Indicatief resultaat. Controleer altijd de actuele CMU/WLL, veiligheidsfactoren en toepasselijke regels.';

  @override
  String get riggingInvalidInputsMessage =>
      'Tussen positieve en consistente waarden.';

  @override
  String get riggingAngleFactorLabel => 'Vermenigvuldigingsfactor';

  @override
  String get riggingAngleFactorExplanation =>
      'Hoe kleiner de hoek ten opzichte van de horizontaal, hoe meer de spanning in elke streng toeneemt.';

  @override
  String get riggingWllLabel => 'WLL / CMU hardware';

  @override
  String get riggingAppliedLoadLabel => 'Toegepaste belasting';

  @override
  String get riggingSafetyFactorLabel => 'Veiligheidsfactor';

  @override
  String get riggingRequiredLoadLabel => 'Laden om te controleren';

  @override
  String get riggingWllUsageLabel => 'Gebruik WLL';

  @override
  String get riggingMarginLabel => 'Resterende marge';

  @override
  String get riggingWllStatusOkDescription =>
      'De hardwarecapaciteit is voldoende voor deze belasting.';

  @override
  String get riggingWllStatusWatchDescription =>
      'De capaciteit is nog steeds voldoende, maar de marge is laag.';

  @override
  String get riggingWllStatusDangerDescription =>
      'De belasting overschrijdt het aangegeven vermogen.';

  @override
  String get riggingLengthDifferenceLabel => 'Lengte verschil';

  @override
  String get riggingCalculationModeLabel => 'Berekeningstype';

  @override
  String get riggingGeometryOnlyLabel => 'Zonder lading';

  @override
  String get riggingWithLoadLabel => 'Met lading';

  @override
  String get riggingGeometryOnlyDescription =>
      'Alleen geometriemodus: lengtes, pijl en hoeken. Geen berekening van spanning of belasting.';

  @override
  String get riggingKnownInputLabel => 'Ik weet';

  @override
  String get homeConversionsTitle => 'Conversies';

  @override
  String get homeConversionsSubtitle =>
      'Eenheden, afstand, video, audio, DMX en veldconversies.';

  @override
  String get conversionsTitle => 'Conversies';

  @override
  String get conversionsDistanceTitle => 'Afstand';

  @override
  String get conversionsTemperatureTitle => 'Temperatuur';

  @override
  String get conversionsAnglesTitle => 'Hoeken';

  @override
  String get conversionsVideoTitle => 'Video';

  @override
  String get conversionsAudioTitle => 'Audio';

  @override
  String get conversionsDmxTitle => 'DMX';

  @override
  String get conversionsSwap => 'Achteruit';

  @override
  String get conversionsDisclaimer =>
      'Alleen indicatie. Controleer kritische waarden altijd met de documentatie van de fabrikant.';

  @override
  String get conversionMetersFeet => 'Meter <> voet';

  @override
  String get conversionCentimetersInches => 'Centimeter <> inch';

  @override
  String get conversionMetersYards => 'Meters <> yards';

  @override
  String get conversionCelsiusFahrenheit => 'Celsius <> Fahrenheit';

  @override
  String get conversionDegreesRadians => 'Graden <> radialen';

  @override
  String get conversionSlopePercentDegrees => 'Helling % <> graden';

  @override
  String get conversionNitsFootLambert => 'Neten <> voet-lambert';

  @override
  String get conversionFpsFrameTime => 'FPS <> frameduur';

  @override
  String get conversionBpmMs => 'BPM <> milliseconden';

  @override
  String get conversionDelayDistance => 'Vertraging <> afstand';

  @override
  String get conversionDmxPercent => 'DMX <> %';

  @override
  String get conversionEightBitSixteenBit => '8 bit <> 16 bit';

  @override
  String get subscriptionDurationYear => '1 jaar abonnement';

  @override
  String get conversionAudioLevel => 'dBu/dBV/V';

  @override
  String get conversionDmxAbsolute => 'Universum <> DMX absoluut';

  @override
  String get conversionDmxToAbsoluteHint => 'Universum + adres → absoluut';

  @override
  String get conversionDmxFromAbsoluteHint => 'Absoluut → universum + adres';

  @override
  String get conversionDmxUniverseLabel => 'Universum';

  @override
  String get conversionDmxAddressLabel => 'Adres';

  @override
  String get conversionDmxAbsoluteLabel => 'DMX absoluut';

  @override
  String get gdtfTitle => 'GDTF';

  @override
  String get gdtfSearchTab => 'Onderzoek';

  @override
  String get gdtfGenerateFromPdfTab => 'Genereer van PDF';

  @override
  String get gdtfSearchHint => 'bijvoorbeeld: Martin MAC Aura, Chauvet Rogue…';

  @override
  String get gdtfFixtureNameLabel => 'Naam armatuur';

  @override
  String get gdtfSearchInfo =>
      'Zoek in de GDTF Deeldatabase (6000+ armaturen).\nIndien niet gevonden, gebruik dan het tabblad \"Genereren van PDF\".';

  @override
  String get gdtfNoFixtureFound => 'Geen armaturen gevonden';

  @override
  String get gdtfNoFixtureFoundHelp =>
      'U kunt een GDTF genereren uit de PDF in de handleiding.';

  @override
  String get gdtfGenerateFromPdfTitle => 'Genereer een GDTF uit een PDF';

  @override
  String get gdtfGenerateFromPdfIntro =>
      'Upload de technische handleiding voor uw armatuur. De AI extraheert de DMX-modi – u controleert en corrigeert voordat u het bestand genereert.\n\n⚠️ Sleutel tot succes: voer de exacte naam van de machine in zoals deze in de handleiding verschijnt. En als je modi handmatig toevoegt, gebruik dan de exacte modusnamen DMX, anders zal de AI de juiste gegevens niet vinden.';

  @override
  String get gdtfManufacturerHint => 'bijv.: Martin, Chauvet, Robe…';

  @override
  String get gdtfModelHint => 'bijvoorbeeld: MAC Aura XIP, Rogue R2X…';

  @override
  String get gdtfSelectManualPdf => 'Selecteer PDF in de handleiding';

  @override
  String get gdtfDetectingModes => 'Modusdetectie…';

  @override
  String get gdtfAnalyzePdf => 'Analyseer de PDF';

  @override
  String get gdtfAnalyzePdfHelp =>
      'De AI detecteert de DMX-modi die beschikbaar zijn in de handleiding. Vervolgens kiest u welke u wilt extraheren voordat u het bestand genereert.';

  @override
  String get gdtfBackToForm => 'Keer terug naar het formulier';

  @override
  String gdtfDetectedModesInManual(int count) {
    return '$count modus(en) DMX gedetecteerd in de handleiding';
  }

  @override
  String get gdtfSearchModeHint => 'Zoek naar een modus…';

  @override
  String get gdtfSelectAll => 'Alle';

  @override
  String get gdtfSelectNone => 'Geen';

  @override
  String gdtfSelectedModesCount(int selected, int total) {
    return '$selected geselecteerd op $total';
  }

  @override
  String get gdtfNoModeMatchesSearch =>
      'Geen enkele modus komt overeen met de zoekopdracht.';

  @override
  String gdtfDmxChannelCount(int count) {
    return '$count kanalen DMX';
  }

  @override
  String get gdtfExtractionInProgressLong =>
      'Bezig met uitpakken...dit kan volgens de handleiding maximaal 10 minuten duren. Sluit de app niet.';

  @override
  String get gdtfExtractionMayTakeLong =>
      'Het uitpakken kan tot 10 minuten duren, afhankelijk van de grootte van de handleiding en het aantal geselecteerde modi.';

  @override
  String get gdtfExtractingChannels => 'Extractie van kanalen…';

  @override
  String gdtfExtractModes(int count) {
    return 'Extraheer $count modus(en)';
  }

  @override
  String get gdtfBackToModeSelection => 'Terug naar modusselectie';

  @override
  String gdtfDetectedModesCount(int count) {
    return '$count modus(en) gedetecteerd';
  }

  @override
  String gdtfUnextractedModesCount(int count) {
    return '$count modus(en) niet geëxtraheerd';
  }

  @override
  String get gdtfGenerating => 'Generatie…';

  @override
  String get gdtfGenerateGdtfFile => 'Genereer het .gdtf-bestand';

  @override
  String get gdtfModeNameHint => 'Modusnaam';

  @override
  String gdtfChannelCount(int count) {
    return '$count kanalen';
  }

  @override
  String get gdtfChannelShort => 'Ch';

  @override
  String get gdtfBits => 'Beetjes';

  @override
  String get gdtfName => 'Naam';

  @override
  String get gdtfDefaultValueLabel => 'Standaardwaarde (0-255):';

  @override
  String get gdtfValueRangesLabel => 'Waardebereiken / subfuncties:';

  @override
  String get gdtfValueRangesHint =>
      'bijv.: 0-9=gesloten, 10-100=langzame flitser, 255=open';

  @override
  String get gdtfAddChannel => 'Voeg een kanaal toe';

  @override
  String get gdtfFileGenerated => 'Bestand gegenereerd!';

  @override
  String get gdtfShareGdtfFile => 'Deel het .gdtf-bestand';

  @override
  String get gdtfGenerateAnotherFile => 'Genereer nog een bestand';

  @override
  String get gdtfGmailIosTitle => 'Gmail op iOS? Lees dit 👀';

  @override
  String get gdtfGmailIosWarning =>
      'Gmail op iOS blokkeert vaak .gdtf-bijlagen (\"kan geen bestand bijvoegen\"). Tip: Hernoem het bestand naar .zip voordat het wordt verzonden. De ontvanger hernoemt het naar .gdtf na ontvangst. WhatsApp, Messenger en AirDrop werken zonder problemen.';

  @override
  String get gdtfDownload => 'Downloaden';

  @override
  String gdtfModeFootprint(String name, int count) {
    return '$name (${count}ch)';
  }

  @override
  String gdtfDownloadingFixture(String fixture) {
    return '$fixture downloaden…';
  }

  @override
  String gdtfErrorStatus(int statusCode) {
    return 'Fout $statusCode';
  }

  @override
  String gdtfErrorStatusParentheses(int statusCode) {
    return 'Fout ($statusCode)';
  }

  @override
  String gdtfNetworkError(String error) {
    return 'Netwerkfout: $error';
  }

  @override
  String gdtfErrorDetails(String error) {
    return 'Fout: $error';
  }

  @override
  String get gdtfErrorFillManufacturerAndModel =>
      'Vul de fabrikant en het model in.';

  @override
  String get gdtfErrorSelectPdf => 'Selecteert een PDF bestand.';

  @override
  String get gdtfErrorCannotExtractDmxPages =>
      'Kan pagina\'s DMX niet extraheren uit PDF.';

  @override
  String get gdtfUnknownError => 'Onbekende fout';

  @override
  String get gdtfUnknownErrorLowercase => 'onbekende fout';

  @override
  String get gdtfNoDmxModeDetected =>
      'Geen DMX-modi gedetecteerd in de handleiding.';

  @override
  String get gdtfErrorSelectAtLeastOneMode =>
      'Selecteert ten minste één modus om te extraheren.';

  @override
  String get gdtfErrorManualDataLost =>
      'Handmatige gegevens verloren, analyse opnieuw starten.';

  @override
  String get mireVideoPageTitle => 'Videoschermdoelen';

  @override
  String get mireVideoWidthPxLabel => 'Breedte (px)';

  @override
  String get mireVideoHeightPxLabel => 'Hoogte (px)';

  @override
  String get mireVideoProjectorCountLabel => 'Aantal projectoren (N)';

  @override
  String get mireVideoOverlapPercentLabel => 'Overlapping (%)';

  @override
  String get mireVideoHint1920 => 'bijv.: 1920';

  @override
  String get mireVideoHint1080 => 'bijvoorbeeld: 1080';

  @override
  String get mireVideoHint3840 => 'bijv.: 3840';

  @override
  String get mireVideoHint2160 => 'bijvoorbeeld: 2160';

  @override
  String get mireVideoHint2 => 'bijv: 2';

  @override
  String get mireVideoHint10Percent => 'bijvoorbeeld: 10.0';

  @override
  String get mireVideoTestPatternTypeLabel => 'Soort zicht';

  @override
  String get mireVideoSimpleTypeComboAll =>
      'Combo (raster + cirkels + 2 gecentreerde staven)';

  @override
  String get mireVideoSimpleTypeGridSafe => 'Raster + kluis + cirkels';

  @override
  String get mireVideoSimpleTypeColorBars => 'Bars + hellingen + cirkels';

  @override
  String get mireVideoSimpleTypeUniformity => 'Uniformiteit + cirkels';

  @override
  String get mireVideoSimpleTypeCheckerboard => 'Dambord + cirkels';

  @override
  String get mireVideoExportPngButton => 'Exporteer PNG';

  @override
  String get mireVideoOrientationLabel => 'Oriëntatie';

  @override
  String get mireVideoOrientationHorizontal => 'Horizontaal';

  @override
  String get mireVideoOrientationVertical => 'Verticaal';

  @override
  String get mireVideoMappingTypeLabel => 'Type toewijzing';

  @override
  String get mireVideoMappingTypeCombo =>
      'Combo (zones + overlap + overvloeiing)';

  @override
  String get mireVideoMappingTypeZonesAndOverlap => 'Zones + overlap';

  @override
  String get mireVideoMappingTypeBlendRamps => 'Meng hellingen';

  @override
  String get mireVideoErrorInvalidWidthHeight =>
      '❌ Ongeldige breedte/hoogte (px).';

  @override
  String get mireVideoErrorInvalidProjectorCount =>
      '❌ Ongeldig aantal projectoren (N > 0).';

  @override
  String get mireVideoErrorInvalidOverlap =>
      '❌ Ongeldige overlap (0 tot 99,9).';

  @override
  String get cinemaTitle => 'Bioscoop / film';

  @override
  String get cinemaIntroTitle => 'Film- en filmtools';

  @override
  String get cinemaIntroBody =>
      'Handige berekeningen voor optica, framing, belichting, opslag, tijdcode en bioscoopprojectie.';

  @override
  String get cinemaFieldOfViewTitle => 'Veldhoek';

  @override
  String get cinemaFieldOfViewSubtitle =>
      'Horizontale, verticale en diagonale berekening afhankelijk van sensor en brandpuntsafstand.';

  @override
  String get cinemaFieldOfViewDescription =>
      'Berekent de beeldhoek op basis van het sensorformaat en de brandpuntsafstand.';

  @override
  String get cinemaFieldOfViewInfo =>
      'Formule: hoek = 2 × atan (sensorgrootte ÷ (2 × brandpuntsafstand)).';

  @override
  String get cinemaSubjectDistanceTitle => 'Afstand camera/onderwerp';

  @override
  String get cinemaSubjectDistanceSubtitle =>
      'Schat de afstand die nodig is om een ​​onderwerp in beeld te brengen.';

  @override
  String get cinemaSubjectDistanceDescription =>
      'Schat de cameraafstand in die nodig is om een ​​onderwerp op hoogte in beeld te brengen.';

  @override
  String get cinemaSubjectDistanceInfo =>
      'Ideale geometrische benadering. De werkelijke afstand kan variëren, afhankelijk van de ademhalingsoptiek, de sensormodus en de uitsnede.';

  @override
  String get cinemaDepthOfFieldTitle => 'Diepte van het veld';

  @override
  String get cinemaDepthOfFieldSubtitle =>
      'Scherpe zone, nabije limiet, verre limiet en hyperfocaal.';

  @override
  String get cinemaDepthOfFieldDescription =>
      'Berekent de theoretische scherptezone op basis van brandpuntsafstand, diafragma, afstand en verwarringscirkel.';

  @override
  String get cinemaDepthOfFieldInfo =>
      'Theoretisch resultaat. De perceptie van scherpte is mede afhankelijk van de resolutie, schermgrootte en kijkafstand.';

  @override
  String get cinemaLensEquivalenceTitle =>
      'Equivalentie van de brandpuntsafstand';

  @override
  String get cinemaLensEquivalenceSubtitle =>
      'Conversie van de brandpuntsafstand tussen sensorformaten.';

  @override
  String get cinemaLensEquivalenceDescription =>
      'Converteert een brandpuntsafstand van het ene sensorformaat naar het andere, terwijl een vergelijkbare diagonale beeldhoek behouden blijft.';

  @override
  String get cinemaLensEquivalenceInfo =>
      'Diagonaal gebaseerde conversie. Voor strikt horizontale of verticale kadrering kan de factor enigszins afwijken.';

  @override
  String get cinemaAnamorphicTitle => 'Anamorf';

  @override
  String get cinemaAnamorphicSubtitle =>
      'Uitknijpen, eindverhouding en equivalente horizontale brandpuntsafstand.';

  @override
  String get cinemaAnamorphicDescription =>
      'Berekent de uiteindelijke verhouding na het uitknijpen en de horizontale equivalentie van de brandpuntsafstand.';

  @override
  String get cinemaAnamorphicInfo =>
      'Een anamorfe lens verbreedt het horizontale veld na het uitknijpen, maar behoudt het verticale gedrag van de brandpuntsafstand.';

  @override
  String get cinemaShutterTitle => 'Sluiterhoek/sluitertijd';

  @override
  String get cinemaShutterSubtitle =>
      'Conversie tussen sluiterhoek, FPS en snelheid.';

  @override
  String get cinemaShutterDescription =>
      'Converteert een bioscoopsluiterhoek naar sluitertijd.';

  @override
  String get cinemaShutterInfo =>
      'Bij 180° is de snelheid ongeveer 1 ÷ (2 × fps). Voorbeeld: 25 fps → 1/50 s.';

  @override
  String get cinemaFlickerTitle => 'Flikkervrij';

  @override
  String get cinemaFlickerSubtitle =>
      'Veilige sluitertijden volgens 50 Hz of 60 Hz.';

  @override
  String get cinemaFlickerDescription =>
      'Lijst met over het algemeen veilige sluitertijden op basis van AC-frequentie.';

  @override
  String get cinemaFlickerInfo =>
      'LED\'s, schermen en gedimde bronnen kunnen nog steeds flikkeren, afhankelijk van hun elektronica, hun PWM of hun verversingsfrequentie.';

  @override
  String get cinemaNdExposureTitle => 'ND / tentoonstelling';

  @override
  String get cinemaNdExposureSubtitle =>
      'Stops, ND-dichtheid, ND-factor en belichtingscompensatie.';

  @override
  String get cinemaNdExposureDescription =>
      'Converteert een correctie in stops naar ND-dichtheid en lichtreductiefactor.';

  @override
  String get cinemaNdExposureInfo =>
      'Merken: ND 0,3 = 1 stop, ND 0,6 = 2 stops, ND 0,9 = 3 stops, ND 1,2 = 4 stops.';

  @override
  String get cinemaRecordingStorageTitle => 'Opnametijd';

  @override
  String get cinemaRecordingStorageSubtitle =>
      'Beschikbare duur afhankelijk van capaciteit en bitrate.';

  @override
  String get cinemaRecordingStorageDescription =>
      'Schat de beschikbare tijd op basis van kaart-/schijfcapaciteit en videobitsnelheid.';

  @override
  String get cinemaRecordingStorageInfo =>
      'Vereenvoudigde decimale berekening: 1 GB = 8000 Mb. Zorg voor ruimte voor audio, metadata, bestandssysteem en mediapool.';

  @override
  String get cinemaTimecodeTitle => 'Tijdcode';

  @override
  String get cinemaTimecodeSubtitle =>
      'Tijdcodeconversie ↔ frames en duur tussen twee TC\'s.';

  @override
  String get cinemaTimecodeDescription =>
      'Converteert twee tijdcodes naar frames en berekent de duur tussen de twee.';

  @override
  String get cinemaTimecodeInfo =>
      'Deze eerste versie maakt gebruik van volledige non-drop-frame tijdcode. Het dropframe 29.97 kan dan afzonderlijk worden toegevoegd.';

  @override
  String get cinemaSlowMotionTitle => 'Slow motion/framerate';

  @override
  String get cinemaSlowMotionSubtitle => 'Slow motion-factor en afspeeltijd.';

  @override
  String get cinemaSlowMotionDescription =>
      'Berekent de slow motion-factor en de uiteindelijke afspeeltijd.';

  @override
  String get cinemaSlowMotionInfo =>
      'Voorbeeld: 100 fps opname, 25 fps lezen = slow motion ×4.';

  @override
  String get cinemaProjectionTitle => 'Bioscoopvertoning';

  @override
  String get cinemaProjectionSubtitle =>
      'Scherm, verhouding, worp, luminantie, nits en ft-L.';

  @override
  String get cinemaProjectionDescription =>
      'Berekent schermafmetingen, projectorafstand en geschatte luminantie.';

  @override
  String get cinemaProjectionInfo =>
      'Geschatte luminantie: nits ≈ lumen × versterking ÷ (π × oppervlakte). Optische verliezen, zoom, lamp/laserveroudering en kalibratie zijn niet inbegrepen.';

  @override
  String get cinemaGlobalDisclaimer =>
      'Deze tools bieden indicatieve technische waarden. Resultaten kunnen variëren afhankelijk van camera, optica, codec, beeldprofiel, projector, canvas of feitelijke filmomstandigheden.';

  @override
  String get cinemaSensorLabel => 'Sensor';

  @override
  String get cinemaFocalLengthLabel => 'Brandpuntsafstand';

  @override
  String get cinemaHorizontalAngleResult => 'Horizontale hoek';

  @override
  String get cinemaVerticalAngleResult => 'Verticale hoek';

  @override
  String get cinemaDiagonalAngleResult => 'Diagonale hoek';

  @override
  String get cinemaSensorDiagonalResult => 'Diagonale sensor';

  @override
  String get cinemaSubjectHeightLabel => 'Onderwerp Hoogte';

  @override
  String get cinemaFrameFillLabel => 'Bezetting van het hoogteframe';

  @override
  String get cinemaEstimatedDistanceResult => 'Geschatte afstand';

  @override
  String get cinemaFrameHeightResult => 'Framehoogte op deze afstand';

  @override
  String get cinemaApertureLabel => 'Opening';

  @override
  String get cinemaSubjectDistanceInputLabel => 'Onderwerp afstand';

  @override
  String get cinemaCocLabel => 'Cirkel van verwarring';

  @override
  String get cinemaCocHelper => 'Voorbeeld volledig frame: 0,03 mm';

  @override
  String get cinemaHyperfocalResult => 'Hyperfocaal';

  @override
  String get cinemaNearLimitResult => 'Bijna limiet';

  @override
  String get cinemaFarLimitResult => 'Verre limiet';

  @override
  String get cinemaTotalDepthResult => 'Totale diepte';

  @override
  String get cinemaSourceSensorLabel => 'Bronsensor';

  @override
  String get cinemaTargetSensorLabel => 'Doelsensor';

  @override
  String get cinemaSourceFocalLengthLabel => 'Bron brandpuntsafstand';

  @override
  String get cinemaEquivalentFocalResult => 'Equivalente brandpuntsafstand';

  @override
  String get cinemaAppliedFactorResult => 'Toegepaste factor';

  @override
  String get cinemaSensorRecordingRatioLabel => 'Sensor/opnameverhouding';

  @override
  String get cinemaSensorRecordingRatioHelper =>
      '16:9 = 1,78, 4:3 = 1,33, 3:2 = 1,50';

  @override
  String get cinemaAnamorphicFactorLabel => 'Anamorfe factor';

  @override
  String get cinemaAnamorphicFactorHelper => '1,33, 1,5, 1,8, 2,0';

  @override
  String get cinemaOpticalFocalLengthLabel => 'Optische brandpuntsafstand';

  @override
  String get cinemaFinalRatioResult => 'Uiteindelijke verhouding';

  @override
  String get cinemaHorizontalEquivalentFocalResult =>
      'Equivalente horizontale brandpuntsafstand';

  @override
  String get cinemaVerticalFocalResult => 'Verticale brandpuntsafstand';

  @override
  String get cinemaFramerateLabel => 'Framesnelheid';

  @override
  String get cinemaShutterAngleLabel => 'Sluiterhoek';

  @override
  String get cinemaExposureTimeResult => 'Blootstellingstijd';

  @override
  String get cinemaEquivalentShutterSpeedResult => 'Equivalente snelheid';

  @override
  String get cinemaMainsFrequencyLabel => 'Netfrequentie';

  @override
  String get cinemaMains50Hz => '50 Hz — Europa';

  @override
  String get cinemaMains60Hz => '60 Hz — VS/andere';

  @override
  String get cinemaRecommendedSpeedsResult => 'Aanbevolen snelheden';

  @override
  String get cinemaMainsBaseResult => 'Sectorbasis';

  @override
  String get cinemaReductionLabel => 'Gewenste reductie';

  @override
  String get cinemaNdDensityResult => 'Dichtheid ND';

  @override
  String get cinemaNdFactorResult => 'ND-factor';

  @override
  String get cinemaApproxTransmissionResult => 'Transmissie ca.';

  @override
  String get cinemaMediaCapacityLabel => 'Mediacapaciteit';

  @override
  String get cinemaBitrateLabel => 'Bitsnelheid';

  @override
  String get cinemaBitrateHelper => 'Waarschuwing: Mb/s, niet MB/s';

  @override
  String get cinemaAvailableDurationResult => 'Duur beschikbaar';

  @override
  String get cinemaStorageConsumptionResult => 'Consumptie';

  @override
  String get cinemaIntegerFramerateLabel => 'Framesnelheid van gehele getallen';

  @override
  String get cinemaIntegerFramerateHelper => '24, 25, 30, 50, 60…';

  @override
  String get cinemaTcInLabel => 'TC IN';

  @override
  String get cinemaTcOutLabel => 'TC UIT';

  @override
  String get cinemaTimecodeFormatHelper => 'Formaat HH:MM:SS:FF';

  @override
  String get cinemaTcInFramesResult => 'Frames TC IN';

  @override
  String get cinemaTcOutFramesResult => 'Frames TC UIT';

  @override
  String get cinemaDurationFramesResult => 'Duur in frames';

  @override
  String get cinemaDurationTcResult => 'TC-duur';

  @override
  String get cinemaDurationResult => 'Duur';

  @override
  String get cinemaCaptureFramerateLabel => 'Framerate filmen';

  @override
  String get cinemaPlaybackFramerateLabel => 'Framerate afspelen';

  @override
  String get cinemaRealDurationLabel => 'Werkelijke duur gefilmd';

  @override
  String get cinemaSlowMotionFactorResult => 'Inactieve factor';

  @override
  String get cinemaPlaybackDurationResult => 'Leestijd';

  @override
  String get cinemaScreenWidthLabel => 'Schermbreedte';

  @override
  String get cinemaImageRatioLabel => 'Beeldverhouding';

  @override
  String get cinemaImageRatioHelper => '1,85, 2,39, 1,78…';

  @override
  String get cinemaThrowRatioLabel => 'Gooi verhouding';

  @override
  String get cinemaProjectorLumensLabel => 'Projectorstroom';

  @override
  String get cinemaScreenGainLabel => 'Canvas winst';

  @override
  String get cinemaScreenHeightResult => 'Scherm hoogte';

  @override
  String get cinemaScreenAreaResult => 'Schermoppervlak';

  @override
  String get cinemaProjectorDistanceResult => 'Projectorafstand';

  @override
  String get cinemaApproxLuminanceResult => 'Luminantie ca.';

  @override
  String get gdtfScannedPdfOcrEnabled =>
      'PDF gescand gedetecteerd: OCR-modus geactiveerd. De scan kan nog eens 1-2 minuten duren.';

  @override
  String get gdtfAddModeDialogTitle => 'Voeg een modus toe';

  @override
  String get gdtfModeNameExampleHint =>
      'Bijvoorbeeld: Standaard, Eenvoudig, Pixel Engine…';

  @override
  String get gdtfDmxChannelCountLabel => 'Aantal kanalen DMX';

  @override
  String get gdtfDmxChannelCountHint => 'Bijv.: 24';

  @override
  String get gdtfCancel => 'Annuleren';

  @override
  String get gdtfAdd => 'Toevoegen';

  @override
  String get gdtfErrorModeNameRequired => 'Naam is vereist';

  @override
  String get gdtfErrorInvalidChannelCount => 'Ongeldig aantal kanalen (1-1000)';

  @override
  String get gdtfErrorModeAlreadyExists =>
      'Er bestaat al een modus met deze naam';

  @override
  String get gdtfHowToUseThisPageTooltip => 'Hoe deze pagina te gebruiken';

  @override
  String get gdtfHowToGetGdtfTitle => 'Hoe u een GDTF kunt krijgen';

  @override
  String get gdtfWorkflowIntro =>
      'Volg voor elk armatuur deze 3 stappen in volgorde.';

  @override
  String get gdtfWorkflowSearchTitle => 'Onderzoek';

  @override
  String get gdtfWorkflowSearchBody =>
      'Tabblad “Zoeken”. Typ de naam van uw armatuur (bijvoorbeeld: \"Spiider\", \"MAC Viper\", \"Q-10\"). De GDTF Share-database bevat meer dan 6000 officiële armaturen die zijn gevalideerd door fabrikanten. Het is gratis, direct en 100% betrouwbaar. Gebruik EERSTE voor 90% van de gevallen.';

  @override
  String get gdtfWorkflowPdfTitle => 'Genereer van PDF';

  @override
  String get gdtfWorkflowPdfBody =>
      'Als de zoekopdracht niets oplevert, ga dan naar het tabblad “Genereren vanuit PDF”. Upload de PDF handleiding/datasheet – de AI extraheert de DMX modi automatisch. ⚠️ Belangrijk: voer de exacte naam van de machine in (zoals geschreven in de handleiding), en als je modi handmatig toevoegt, gebruik dan de exacte modusnamen DMX — anders zal de AI de juiste gegevens niet vinden. Werkt goed op schone PDFs (Robe, Martin, enz.) en minder goed op gescande of vertaalde Chinese handleidingen.';

  @override
  String get gdtfWorkflowManualTitle => 'Handmatige toevoeging/correctie';

  @override
  String get gdtfWorkflowManualBody =>
      'Wanneer de AI de analyse heeft afgerond, kom je op de modusselectiepagina. De knop “Een modus handmatig toevoegen” is ALTIJD beschikbaar bovenaan de lijst. Gebruik het om: (a) een modus toe te voegen die de AI is vergeten, (b) een hallucinatie via de prullenbak te verwijderen, (c) een onjuiste kanaaltelling te corrigeren (prullenbak + opnieuw toevoegen aan het juiste nummer). Dit is je laatste verdedigingslinie voordat je GDTF genereert – controleer dit altijd.';

  @override
  String get gdtfWorkflowTip =>
      'Tip: controleer altijd gdtf-share voordat u een PDF extraheert — dit bespaart u de AI-extractie (langer en minder betrouwbaar) wanneer er al een officiële GDTF bestaat. En onthoud: de machinenaam en modusnamen moeten exact dezelfde zijn als uit de handleiding – de AI is ervan afhankelijk!';

  @override
  String get gdtfUnderstood => 'Begrepen';

  @override
  String get gdtfWorkflowSearchShortBody =>
      'Typ hierboven de naam van het armatuur. GDTF Deel database (meer dan 6000 officiële wedstrijden). Het is gratis, direct en door de fabrikant gevalideerd. Lost 90% van de gevallen op.';

  @override
  String get gdtfWorkflowPdfShortBody =>
      'Niet gevonden? Tabblad ‘Genereren vanuit PDF’. Upload de handleiding – de AI extraheert de DMX-modi. Werkt het beste op schone PDFs.';

  @override
  String get gdtfWorkflowManualShortBody =>
      'Controleer op de modipagina altijd wat de AI heeft uitgevoerd. Je kunt: een vergeten modus toevoegen, een hallucinatie verwijderen (prullenbakpictogram) of een onjuiste kanaaltelling corrigeren (verwijderen + opnieuw toevoegen aan de juiste waarde). De AI is snel maar niet onfeilbaar – jij behoudt de controle over de definitieve lijst.';

  @override
  String get gdtfAddModeManually => 'Voeg handmatig een modus toe';

  @override
  String get gdtfNoModeDetectedAutomatically =>
      'Er wordt geen modus automatisch gedetecteerd.';

  @override
  String get gdtfNoModeDetectedHelp =>
      'De PDF is waarschijnlijk gescand of heeft een complexe lay-out. Voeg de modi handmatig toe met de knop hierboven, en het extraheren van de kanalen gebeurt dan op de OCR-tekst / uit de handleiding gehaald.';

  @override
  String get gdtfAddMode => 'Voeg een modus toe';

  @override
  String get gdtfDeleteModeTooltip => 'Verwijder deze modus';

  @override
  String get audioHomeTitle => 'Haar';

  @override
  String get audioHomeSubtitle =>
      'Cardioid sub, end-fire, delays, SPL en tools voor de geluidstechnicus.';

  @override
  String get homeRfTitle => 'RF en draadloos';

  @override
  String get homeRfSubtitle =>
      'WiFi 2,4/5 GHz, coëxistentie, UHF/VHF-banden, antennecalculator.';

  @override
  String get homeCinemaTitle => 'Bioscoop / film';

  @override
  String get homeCinemaSubtitle =>
      'Optica, kadrering, belichting, tijdcode, opslag en bioscoopprojectie.';

  @override
  String get audioSectionPlacementDirectivity => 'Plaatsing en directiviteit';

  @override
  String get audioSectionAcousticLevels => 'Akoestiek en niveaus';

  @override
  String get audioSectionAmpCabling => 'Versterker en bedrading';

  @override
  String get audioSectionTimingAlignment => 'Timing en uitlijning';

  @override
  String get audioSubCardioidTitle => 'Sub-cardioïde';

  @override
  String get audioSubCardioidSubtitle =>
      'Vertragingen voor cardioïde configuratie (2 subs) of eindvuur (N subs in lijn). Achterannulering, voorversteviging.';

  @override
  String get audioSplDistanceTitle => 'SPL en afstand';

  @override
  String get audioSplDistanceSubtitle =>
      'Inverse kwadratenwet: SPL afhankelijk van de afstand. Berekening op basis van vermogen + luidsprekergevoeligheid.';

  @override
  String get audioSplSumTitle => 'Toevoeging van SPL-bronnen';

  @override
  String get audioSplSumSubtitle =>
      'N onsamenhangende bronnen: +10·log(N) dB. Of toevoeging van 2 verschillende bronnen.';

  @override
  String get audioElectroacousticTitle => 'Elektro-akoestiek';

  @override
  String get audioElectroacousticSubtitle =>
      'SPL van luidsprekergevoeligheid + vermogen. Afstandstabel. Coherente/inconsistente koppeling.';

  @override
  String get audioWavelengthTitle => 'Frequentie en golflengte';

  @override
  String get audioWavelengthSubtitle =>
      'Conversie Hz ↔ λ (m), λ/4, λ/2. Audiospectrumtabel per bands.';

  @override
  String get audioAmpLoadTitle => 'Laad versterker/luidsprekers';

  @override
  String get audioCrossoverTitle => 'Scheidingsfrequentie / Crossover';

  @override
  String get audioRt60Title => 'Nagalmtijd (RT60)';

  @override
  String get audioRt60LengthLabel => 'Lengte';

  @override
  String get audioRt60WidthLabel => 'Breedte';

  @override
  String get audioRt60HeightLabel => 'Hoogte';

  @override
  String get audioRt60AbsorptionLabel => 'Gemiddelde absorptiecoëfficiënt (α)';

  @override
  String get audioRt60PresetHard => 'Zeer galmend (beton, glas)';

  @override
  String get audioRt60PresetMedium => 'Gemiddelde ruimte (kantoor, hout)';

  @override
  String get audioRt60PresetTreated =>
      'Akoestisch behandelde ruimte (gordijnen, tapijt)';

  @override
  String get audioRt60PresetAbsorbent => 'Zeer absorberend (behandelde studio)';

  @override
  String get audioRt60ResultTitle => 'Geschatte RT60';

  @override
  String get audioRt60VolumeLabel => 'Ruimtevolume';

  @override
  String get audioRt60SurfaceLabel => 'Totale oppervlakte';

  @override
  String get audioRt60QualLive => 'Zeer galmend';

  @override
  String get audioRt60QualComfortable => 'Comfortabel voor spraak';

  @override
  String get audioRt60QualDry => 'Droog / gecontroleerd';

  @override
  String get audioRt60FormulaNote =>
      'RT60 = 0,161 × V / (α × S) — Sabine-formule, schatting met uniforme gemiddelde absorptie';

  @override
  String get audioSplMeterTitle => 'Geluidsmeter';

  @override
  String get audioDelayTimeTitle => 'Delay-tijd (BPM)';

  @override
  String get audioDelayTimeBpmLabel => 'BPM';

  @override
  String get audioDelayTimeResultsTitle => 'Tijden per onderverdeling';

  @override
  String get audioDelayTimeEmptyState =>
      'Voer een BPM in om de delay-tijden te berekenen.';

  @override
  String get audioDelayTimeNormalLabel => 'Normaal';

  @override
  String get audioDelayTimeDottedLabel => 'Gepunkteerd';

  @override
  String get audioDelayTimeTripletLabel => 'Triool';

  @override
  String get audioDelayTimeFormulaNote =>
      'Tijd (ms) = 60000 / BPM × fractie van het kwartnoot. Gepunkteerd ×1,5 · Triool ×2/3.';

  @override
  String get audioSplMeterPermissionTitle => 'Microfoontoegang vereist';

  @override
  String get audioSplMeterPermissionBody =>
      'De geluidsmeter gebruikt de microfoon van de telefoon om het omgevingsgeluidsniveau in real time te schatten.';

  @override
  String get audioSplMeterAllowMic => 'Microfoon toestaan';

  @override
  String get audioSplMeterOpenSettings => 'Instellingen openen';

  @override
  String get audioSplMeterLiveTitle => 'Live niveau';

  @override
  String get audioSplMeterStartHint => 'Tik om te starten';

  @override
  String get audioSplMeterStopHint => 'Tik om te stoppen';

  @override
  String get audioSplMeterStatsTitle => 'Sessiestatistieken';

  @override
  String get audioSplMeterStatsEmpty =>
      'Start een meting om de min/gem/max-statistieken te zien.';

  @override
  String get audioSplMeterMinLabel => 'Minimum';

  @override
  String get audioSplMeterAvgLabel => 'Gemiddelde';

  @override
  String get audioSplMeterMaxLabel => 'Maximum';

  @override
  String get audioSplMeterReferenceTitle => 'Referentie geluidsniveaus';

  @override
  String get audioSplMeterRefQuiet => 'Stille kamer';

  @override
  String get audioSplMeterRefConversation => 'Normaal gesprek';

  @override
  String get audioSplMeterRefTraffic => 'Stadsverkeer';

  @override
  String get audioSplMeterRefConcert => 'Concert / versterkte zaal';

  @override
  String get audioSplMeterRefPain => 'Pijngrens';

  @override
  String get audioSplMeterDisclaimer =>
      'Indicatieve meting via de telefoonmicrofoon (niet gekalibreerd) — vervangt geen gecertificeerde IEC 61672-geluidsmeter.';

  @override
  String get audioCrossoverFreqLabel => 'Scheidingsfrequentie';

  @override
  String get audioCrossoverImpedanceLabel => 'Luidsprekerimpedantie';

  @override
  String get audioCrossoverCapacitorLabel => 'Condensator (hoogdoorlaat)';

  @override
  String get audioCrossoverInductorLabel => 'Spoel (laagdoorlaat)';

  @override
  String get audioCrossoverOrderNote => 'Filter 1e orde (6 dB/octaaf)';

  @override
  String get audioCrossoverReferenceTitle => 'Typische scheidingsfrequenties';

  @override
  String get audioCrossoverRefSubTop => 'Sub / Top';

  @override
  String get audioCrossoverRef2Way => '2-weg (LF/HF)';

  @override
  String get audioCrossoverRef3WayLow => '3-weg — LF/MF';

  @override
  String get audioCrossoverRef3WayHigh => '3-weg — MF/HF';

  @override
  String get audioCrossoverFormulaNote => 'C = 1 / (2π·f·Z)    L = Z / (2π·f)';

  @override
  String get audioAmpLoadSubtitle =>
      'Hoeveel luidsprekers per versterkerkanaal. Resulterende impedantie, vermogen per luidspreker.';

  @override
  String get audioImpedanceTitle => 'Impedantie Serie / Parallel';

  @override
  String get audioImpedanceModeLabel => 'Bekabelingsmodus';

  @override
  String get audioImpedanceModeSeries => 'Serie';

  @override
  String get audioImpedanceModeParallel => 'Parallel';

  @override
  String get audioImpedanceSpeakerLabel => 'Luidspreker';

  @override
  String get audioImpedanceAddSpeaker => 'Luidspreker toevoegen';

  @override
  String get audioImpedanceTotalTitle => 'Totale impedantie';

  @override
  String get audioImpedanceEmptyState =>
      'Voer minstens één impedantie in om het totaal te berekenen.';

  @override
  String get audioImpedanceWarningLow =>
      'Lage impedantie: controleer of je versterker deze belasting aankan (vaak minimaal 2 Ω).';

  @override
  String get audioImpedanceFormulaNote =>
      'Serie: Zt = Z1 + Z2 + …    Parallel: 1/Zt = 1/Z1 + 1/Z2 + …';

  @override
  String get audioLevelsTitle => 'Niveaus en kabels';

  @override
  String get audioLevelsSubtitle =>
      'dBu/dBV/V rms-omzetter. Referentieniveaus −10 dBV, +4 dBu, +18 dBu.';

  @override
  String get audioDelayDistanceTitle => 'Afstand vertraging';

  @override
  String get audioDelayDistanceSubtitle =>
      'Afstand → ms om vertragingsstapels, vullingen of gedistribueerde diffusie uit te lijnen. Meerpunts.';

  @override
  String get subscriptionCategorySonRfShort => 'GELUID & RF';

  @override
  String get subscriptionProShort => 'PRO';

  @override
  String get audioConditions => 'Voorwaarden';

  @override
  String get audioAmbientTemperature => 'Omgevingstemperatuur';

  @override
  String get audioSpeedOfSound => 'Snelheid van geluid';

  @override
  String get audioListeningPoints => 'Luisterpunten';

  @override
  String audioDistancePoint(int index) {
    return 'Puntafstand $index';
  }

  @override
  String get audioAddPoint => 'Voeg een punt toe';

  @override
  String get audioCalculatedDelays => 'Berekende deadlines';

  @override
  String get audioTypicalUseCases => 'Typische gebruiksscenario\'s';

  @override
  String get audioDelayStackFillsTitle => 'Vertraging stapelen/vullen';

  @override
  String get audioDelayStackFillsText =>
      'Meet de afstand tussen het hoofdsysteem en de vertragingstoren. Pas deze vertraging toe op de vertragingstoren om deze op één lijn te brengen met de wijzers.';

  @override
  String get audioDistributedSoundTitle => 'Gedistribueerde uitzending';

  @override
  String get audioDistributedSoundText =>
      'Meet voor elke luidsprekerzone de afstand tot het referentiesysteem en pas de bijbehorende vertraging toe.';

  @override
  String get audioRoomFillTitle => 'Kamervulling';

  @override
  String get audioRoomFillText =>
      'Sprekers die dicht bij het publiek staan, worden vertraagd ten opzichte van het geluid op het podium om de perceptie van dubbele bronnen te voorkomen.';

  @override
  String get audioDelayNote =>
      'De berekende vertraging komt overeen met de akoestische voortplanting in de vrije lucht.\nFijn afstellen op het gehoor of met een fase-analysator.';

  @override
  String get audioFromSpeakerSensitivity => 'SPL van luidsprekergevoeligheid';

  @override
  String get audioSensitivity => 'Gevoeligheid';

  @override
  String get audioAmpPower => 'Versterker vermogen';

  @override
  String get audioMeasurementDistance => 'Afstand meten';

  @override
  String get audioTypicalSensitivities => 'Typische gevoeligheden';

  @override
  String get audioSourceCoupling => 'Bronkoppeling';

  @override
  String get audioSourceCouplingIntro =>
      'Door identieke bronnen naast elkaar toe te voegen, is de winst afhankelijk van het type koppeling:';

  @override
  String audioSourcesCount(int count) {
    return '$count bronnen';
  }

  @override
  String get audioPracticalRules => 'Praktische regels';

  @override
  String get audioRuleDoubleDistance =>
      'Verdubbel de afstand = −6 dB (vrij veld). In een ruimte is de demping minder dankzij reflecties.';

  @override
  String get audioRuleDoublePower =>
      'Verdubbel het vermogen = +3 dB. Vermenigvuldigen met 10 = +10 dB. Er is ×100 vermogen nodig om +20 dB te verkrijgen.';

  @override
  String get audioRuleCoupling =>
      'Coherente koppeling (bronnen in fase, rug aan rug): +6 dB per verdubbeling. Inconsistente koppeling: +3 dB.';

  @override
  String get audioRuleSafety =>
      'Pijngrens ≈ 120 dB SPL. Gehoorrisico vanaf 85 dB (8h) volgens NIOSH. Elke +3 dB deelt de belichtingstijd door 2.';

  @override
  String get audioDistance => 'Afstand';

  @override
  String get audioSpl => 'SPL';

  @override
  String get audioIncoherent => 'Onsamenhangend';

  @override
  String get audioCoherent => 'Consistent';

  @override
  String get audioIncoherentSubtitle =>
      'Ongebruikelijke bronnen\nof niet gesynchroniseerd';

  @override
  String get audioCoherentSubtitle => 'In-fase bronnen\nuitgelijnd';

  @override
  String get audioLevelConverter => 'Niveau-omzetter';

  @override
  String get audioReferenceLevels => 'Referentieniveaus';

  @override
  String get audioGainStagingRules => 'Gain enscenering – praktische regels';

  @override
  String get audioAmplifierPerChannel => 'VERSTERKER — per kanaal';

  @override
  String get audioMinimumImpedance => 'Zmin (Ω)';

  @override
  String get audioPowerW => 'Vermogen (W)';

  @override
  String get audioAtOhm => 'naar (Ω)';

  @override
  String get audioSpeaker => 'ZWANGER';

  @override
  String get audioNominalImpedance => 'Z nominaal (Ω)';

  @override
  String get audioContinuousPower => 'P gaat verder (W)';

  @override
  String get audioParallelConnection => 'PARALLELLE VERBINDING';

  @override
  String get audioLoadImpedance => 'Z-belasting';

  @override
  String get audioPowerPerSpeaker => 'P / bijl.';

  @override
  String get audioStatus => 'Status';

  @override
  String audioTooLowImpedance(String diff) {
    return '✗ Z te laag (−$diff Ω)';
  }

  @override
  String get audioExceedsContinuousPower => '⚠ Overschrijdt P gaat door';

  @override
  String audioNearLimit(int percent) {
    return '⚠ Bijna limiet (>$percent%)';
  }

  @override
  String audioOkContinuousPower(int percent) {
    return '✓ OK ($percent% P vervolg)';
  }

  @override
  String get audioAmpLoadNote =>
      'Berekening op basis van het opgegeven vermogen van de versterker per impedantie (geïnterpoleerd). Het kanaalvermogen wordt verdeeld over de N parallelle luidsprekers. 1,5× tot 2× reserve boven de RMS/AES-belastbaarheid is gebruikelijk met een ingestelde limiter. Waarden uit datasheets: controleer altijd met de presets en aanbevelingen van de fabrikant.';

  @override
  String get audioConfiguration => 'Configuratie';

  @override
  String get audioParameters => 'Instellingen';

  @override
  String get audioSubDistance => 'Afstand tussen sub';

  @override
  String get audioSubCount => 'Aantal subs';

  @override
  String get audioCardioid2Subs => 'Cardioïde — 2 subs';

  @override
  String get audioCardioid2SubsDescription =>
      '1 normale sub + 1 sub met vertraging teruggestuurd';

  @override
  String get audioEndFireNSubs => 'Eindvuur - N subs online';

  @override
  String get audioEndFireNSubsDescription =>
      'Allemaal naar voren gericht, vertragingen verschoven per rij';

  @override
  String get audioResults => 'Resultaten';

  @override
  String get audioEnterDistanceToCalculate =>
      'Voer een afstand in om te berekenen';

  @override
  String get audioDelayToApply => 'Deadline voor aanmelding';

  @override
  String get audioRearSubDelaySublabel => 'op de sub omgedraaid (achterkant)';

  @override
  String get audioOptimalFrequency => 'Optimale frequentie';

  @override
  String get audioFrontSub => 'Voorste sub';

  @override
  String get audioRearSubReversed => 'Achterste sub (omgedraaid)';

  @override
  String get audioNormalPolarity => 'Normaal ✓';

  @override
  String get audioInvertedPolarity => 'Omgekeerd 🔄';

  @override
  String get audioDelayBetweenRows => 'Vertraging tussen elke rij';

  @override
  String get audioMaxDelayRearSub => 'Maximale vertraging (achter-sub)';

  @override
  String get audioFrontReferenceSub => 'Sub vooraan (referentie)';

  @override
  String audioSubNumber(int index) {
    return 'Sub $index';
  }

  @override
  String get audioEndFireReferenceNote =>
      '→ Sub 1 (voorkant) is de referentie. De volgende subs hebben een toenemende vertraging.';

  @override
  String get audioHowTo => 'Hoe moet je het doen?';

  @override
  String get audioCardioidStep1 =>
      'Plaats sub A richting het publiek (normale positie).';

  @override
  String get audioCardioidStep2 =>
      'Plaats de B-sub er vlak achter, fysiek ondersteboven gericht, naar de achterkant van het podium gericht.';

  @override
  String get audioCardioidStep3 =>
      'Draai in uw processor of console de polariteit van sub B om (Ø / Phase-knop).';

  @override
  String get audioCardioidStep4 =>
      'Pas de berekende vertraging toe op sub B. Stel sub A niet uit.';

  @override
  String get audioCardioidStep5 =>
      'Controleer de achterste annulering met een meetmicrofoon of door achter de array te lopen.';

  @override
  String get audioCardioidTip =>
      '💡 De ideale afstand tussen de subs komt overeen met λ/4 van de centrale frequentie van de sub (bijvoorbeeld 90 Hz → ~0,95 m bij 20 °C). Pas aan om het beste compromis tussen annulering en kracht te vinden.';

  @override
  String get audioEndFireStep1 =>
      'Zet alle subs op een rij, allemaal gericht naar het publiek, met dezelfde afstand ertussen.';

  @override
  String get audioEndFireStep2 =>
      'De meest voorwaartse sub (sub 1) is de referentie: vertraging = 0.';

  @override
  String get audioEndFireStep3 =>
      'Pas een toenemende vertraging toe op elke volgende rang (sub 2 → 1×vertraging, sub 3 → 2×vertraging, etc.).';

  @override
  String get audioEndFireStep4 =>
      'Alle subs behouden dezelfde polariteit (geen inversie).';

  @override
  String get audioEndFireStep5 =>
      'Meet vanaf de achterkant om te controleren op demping.';

  @override
  String get audioEndFireTip =>
      '💡 End-fire biedt iets minder directiviteitsversterking dan klassieke cardioïde, maar werkt met meer dan 2 subs en vereist geen fysieke flipping.';

  @override
  String get audioConversion => 'Conversie';

  @override
  String get audioFrequency => 'Frequentie';

  @override
  String get audioWavelength => 'Golflengte';

  @override
  String get audioResult => 'Resultaat';

  @override
  String get audioEnterValueToCalculate => 'Voer een waarde in om te berekenen';

  @override
  String audioWavelengthAt(String frequency) {
    return 'Golflengte bij $frequency';
  }

  @override
  String audioFrequencyForLambda(String lambda) {
    return 'Frequentie voor λ = $lambda m';
  }

  @override
  String get audioHalfWave => 'λ/2 (halve golf)';

  @override
  String get audioQuarterWave => 'λ/4 (kwartgolf)';

  @override
  String get audioSpectrumMarkers => 'Audiospectrum — benchmarks';

  @override
  String get audioWavelengthFormula =>
      'Formule: λ = v / f |    v = 331,3 + 0,606 × T (°C)';

  @override
  String get audioHzToLambda => 'Hz → λ (m)';

  @override
  String get audioLambdaToHz => 'λ (m) → Hz';

  @override
  String get audioSubBass => 'Sub-bas';

  @override
  String get audioBass => 'Bas';

  @override
  String get audioLowMid => 'Lage middentonen';

  @override
  String get audioMid => 'Mediums';

  @override
  String get audioHighMid => 'Hoge middentonen';

  @override
  String get audioTreble => 'Drievoudig';

  @override
  String get audioIncoherentSources => 'Inconsistente bronnen';

  @override
  String get audioIdenticalSources => 'N identieke bronnen';

  @override
  String get audioSingleSourceSpl => 'SPL van een bron';

  @override
  String audioTotalSplSources(int count) {
    return 'Totaal SPL ($count bronnen)';
  }

  @override
  String get audioTwoDifferentSources => '2 verschillende bronnen';

  @override
  String get audioSourceA => 'Bron A';

  @override
  String get audioSourceB => 'Bron B';

  @override
  String get audioTotalSplAB => 'Totaal SPL (A + B)';

  @override
  String get audioDoublingReference => 'Referentie – verdubbeling van de winst';

  @override
  String get audioIncoherentShort => 'Inco. :';

  @override
  String get audioCoherentShort => 'Coher. :';

  @override
  String get audioCalculationMode => 'Berekeningswijze';

  @override
  String get audioReferenceSpl => 'Referentie SPL';

  @override
  String get audioReferenceDistance => 'Referentie afstand';

  @override
  String get audioTargetDistance => 'Doel afstand';

  @override
  String get audioEnterValuesToCalculate =>
      'Voer de waarden in die u wilt berekenen';

  @override
  String audioSplAtDistance(String distance) {
    return 'SPL op $distance m';
  }

  @override
  String get audioVariation => 'Variatie';

  @override
  String get audioListeningDistance => 'Luisterafstand';

  @override
  String get audioMaxSplAt1m => 'Maximale SPL op 1 meter';

  @override
  String get audioDistanceToSpl => 'Afstand → SPL';

  @override
  String get audioPowerToSpl => 'Vermogen → SPL';

  @override
  String get audioSoundLevelReference => 'Referentie geluidsniveau';

  @override
  String get audioSectionSafety => 'Gehoorveiligheid';

  @override
  String get audioNoiseDoseTitle => 'Geluidsdosis & blootstellingstijd';

  @override
  String get audioNoiseDoseIntro =>
      'Elke +3 dB halveert de toegestane blootstellingstijd (3 dB-uitwisselingsregel). Voer het gemeten of geplande geluidsniveau in om de tijd tot de wettelijke blootstellingsdrempels te schatten.';

  @override
  String get audioNoiseDoseLevelCardTitle => 'Gemeten niveau';

  @override
  String get audioNoiseDoseLevelLabel => 'Geluidsniveau';

  @override
  String get audioNoiseDoseAllowedTimeTitle => 'Toegestane tijd tot de dosis';

  @override
  String get audioNoiseDoseVaiLabel => 'Onderste actiewaarde';

  @override
  String get audioNoiseDoseVasLabel => 'Bovenste actiewaarde';

  @override
  String get audioNoiseDoseVleLabel => 'Blootstellingsgrenswaarde';

  @override
  String get audioNoiseDoseUnlimited => '≥ 8 u (geen risico per dag)';

  @override
  String get audioNoiseDoseTableTitle =>
      'Referentie — toegestane tijd per niveau';

  @override
  String get audioNoiseDoseTableLevelHeader => 'Niveau';

  @override
  String get audioNoiseDoseTableTimeHeader =>
      'Toegestane tijd (grenswaarde 87 dB)';

  @override
  String get audioNoiseDoseVenueTitle =>
      'Drempels voor locaties (Frans showdecreet)';

  @override
  String get audioNoiseDoseVenueText =>
      'Het Franse decreet 2017-1244 beperkt het gemiddelde niveau (LAeq over 15 min) tot 102 dB(A) (occasionele locatie) of 105 dB(A) (vaste locatie), met een piekniveau ≤ 118 of 120 dB(C). Deze gelden doorlopend voor het publiek via een limiter — los van de hierboven berekende beroepsmatige blootstelling.';

  @override
  String get audioNoiseDoseDisclaimer =>
      'Indicatieve tool op basis van de 3 dB-uitwisselingsregel (Frans arbeidsrecht, art. R.4431-2). Vervangt geen gecertificeerde geluidsmeter of dosimeter, noch een wettelijke meting ter plaatse.';

  @override
  String get audioSectionOrganization => 'Organisatie';

  @override
  String get audioInputListTitle => 'Inputlijst';

  @override
  String get audioInputListIntro =>
      'Stel je microfoon-/DI-inputlijst samen voor de soundcheck of het patchblad. De volgorde van de rijen bepaalt het kanaalnummer — sleep om te herschikken.';

  @override
  String get audioInputListEmpty =>
      'Nog geen items. Voeg de eerste regel van je inputlijst toe.';

  @override
  String get audioInputListAddButton => 'Item toevoegen';

  @override
  String audioInputListChannel(Object n) {
    return 'Kanaal $n';
  }

  @override
  String get audioInputListNameLabel => 'Bron';

  @override
  String get audioInputListPositionLabel => 'Positie';

  @override
  String get audioInputListNotesLabel => 'Notities';

  @override
  String get audioInputListTypeMic => 'Microfoon';

  @override
  String get audioInputListTypeDi => 'DI';

  @override
  String get audioInputListTypeLine => 'Lijn';

  @override
  String get audioInputListTypeWireless => 'Draadloos';

  @override
  String get audioInputListTypeOther => 'Anders';

  @override
  String get audioInputListCopyAction => 'Lijst kopiëren';

  @override
  String get audioInputListCopiedSnackbar => 'Lijst gekopieerd naar klembord';

  @override
  String get audioInputListClearAction => 'Alles wissen';

  @override
  String get audioInputListClearConfirmTitle => 'Hele lijst wissen?';

  @override
  String get audioInputListClearConfirmBody =>
      'Hiermee worden alle items uit de inputlijst verwijderd. Dit kan niet ongedaan worden gemaakt.';

  @override
  String get pluginCommunity => 'Plugin-gemeenschap';

  @override
  String get pluginCommunitySubtitle =>
      'Deel en ontdek grandMA3 plug-ins gemaakt door de community';

  @override
  String get pluginCommunitySubtitleAuth =>
      'Deel en ontdek plug-ins\ngrandMA3 gemaakt door de community.';

  @override
  String get continueWithGoogle => 'Ga verder met Google';

  @override
  String get authChoosePseudo => 'Kies je bijnaam';

  @override
  String get authPseudoHint => 'Jouw bijnaam in de community';

  @override
  String get confirm => 'Bevestigen';

  @override
  String get loginCancelled => 'Verbinding geannuleerd.';

  @override
  String get anonymous => 'Anoniem';

  @override
  String get share => 'Deel';

  @override
  String get searchPluginHint => 'Zoek naar een plug-in…';

  @override
  String get allPluginsFilter => '⭐Alles';

  @override
  String get loginRequiredLike => 'Log in om het leuk te vinden 👋';

  @override
  String get noPluginsYet => 'Er zijn hier nog geen plug-ins.';

  @override
  String get beFirstToShare => 'Deel als eerste!';

  @override
  String get signOut => 'Uitloggen';

  @override
  String get luaCode => 'Lua-code';

  @override
  String get copied => 'Gekopieerd!';

  @override
  String get copyCode => 'Kopieer code';

  @override
  String get pluginPublished => '🚀 Plug-in vrijgegeven!';

  @override
  String get sharePlugin => 'Deel een plug-in';

  @override
  String get pluginTitle => 'Titel van de plug-in';

  @override
  String get pluginTitleHint => 'bijv.: RGB-kleurenbatch - 30 presets';

  @override
  String get pluginTitleRequired => 'Titel vereist';

  @override
  String get category => 'Categorie';

  @override
  String get optionalDescription => 'Beschrijving (optioneel)';

  @override
  String get pluginDescriptionHint =>
      'Wat de plug-in doet, wat hij van de gebruiker vraagt...';

  @override
  String get codeRequired => 'Code vereist';

  @override
  String get codeMustContainReturnMain =>
      'De code moet \"return main\" bevatten';

  @override
  String get pluginTestedWarning =>
      'Zorg ervoor dat de plug-in is getest in MA3 voordat u deze deelt.';

  @override
  String get attachFiles => 'Bestanden bijvoegen';

  @override
  String get addFiles => 'Bestanden toevoegen (.lua, .xml…)';

  @override
  String filesSelected(Object count) {
    return '$count geselecteerde bestand(en)';
  }

  @override
  String get codeOptional => 'Plak de code (optioneel)';

  @override
  String get codeOrFileRequired =>
      'Voeg ten minste één bestand toe of plak de code';

  @override
  String get downloadFile => 'Downloaden';

  @override
  String get pluginFiles => 'Bestanden';

  @override
  String get uploadingFiles => 'Bestanden verzenden…';

  @override
  String get publishPlugin => 'Publiceer de plug-in';

  @override
  String get free => 'VRIJ';

  @override
  String get pro => 'PRO';

  @override
  String get console => 'Troosten';

  @override
  String pluginError(Object error) {
    return 'Fout: $error';
  }

  @override
  String get pluginCategory_all => 'Alle';

  @override
  String get pluginCategory_color => 'Kleur';

  @override
  String get pluginCategory_movement => 'Beweging';

  @override
  String get pluginCategory_effect => 'Effecten';

  @override
  String get pluginCategory_dimmer => 'Intensiteit';

  @override
  String get pluginCategory_layout => 'Indeling';

  @override
  String get pluginCategory_select => 'Selectie';

  @override
  String get pluginCategory_macro => 'Macro';

  @override
  String get pluginCategory_utility => 'Nutsvoorziening';

  @override
  String get pluginCategory_custom => 'Op maat gemaakt';

  @override
  String get ma3AppTitlePrefix => 'MA3-plug-in';

  @override
  String get ma3AppTitleAccent => 'Gesmeed';

  @override
  String get ma3New => '↺ Nieuw';

  @override
  String get ma3StepCategory => 'Categorie';

  @override
  String get ma3StepSettings => 'Instellingen';

  @override
  String get ma3StepGeneratedCode => 'Code gegenereerd';

  @override
  String get ma3ChoosePluginType => 'Welk type plug-in?';

  @override
  String get ma3ChooseCategorySubtitle =>
      'Kies een categorie om aan de slag te gaan';

  @override
  String get ma3Continue => 'Ga verder →';

  @override
  String get ma3PluginName => 'Naam van plug-in';

  @override
  String get ma3PluginNameHint => 'Mijn MA3-plug-in';

  @override
  String get ma3PluginSettings => 'Plugin-instellingen';

  @override
  String get ma3AdditionalDetails => '💬 Aanvullende details (optioneel)';

  @override
  String get ma3AdditionalDetailsHint =>
      'Voegt details, speciale gevallen, beperkingen toe...';

  @override
  String get ma3Back => '← Terug';

  @override
  String get ma3GeneratePlugin => '⚡ Genereer de plug-in';

  @override
  String get ma3GeneratedReady =>
      'Gegenereerde plug-in — klaar om in MA3 te plakken';

  @override
  String get ma3InstallInMa3 => 'Installeren in MA3:';

  @override
  String get ma3Menu => 'Menu';

  @override
  String get ma3Plugin => 'Plug-in';

  @override
  String get ma3NewPlugin => 'Nieuwe plug-in';

  @override
  String get ma3PasteSaveAs => '→ plakken → opslaan als';

  @override
  String get ma3Run => 'Loop';

  @override
  String get ma3Copied => '✓ Gekopieerd!';

  @override
  String get ma3Copy => '⎘ Kopiëren';

  @override
  String get ma3Edit => '← Bewerken';

  @override
  String get ma3Regenerate => '↺ Regenereren';

  @override
  String get ma3NewPluginButton => '+ Nieuwe plug-in';

  @override
  String get ma3Choose => '- Kiezen -';

  @override
  String get ma3Add => 'Toevoegen...';

  @override
  String get ma3GeneratedPluginFallback => 'Plug-in';

  @override
  String get ma3CategoryColor => 'Kleur';

  @override
  String get ma3CategoryColorDesc =>
      'RGB-indeling, palet, kleurvoorinstellingen';

  @override
  String get ma3CategoryMovement => 'Beweging';

  @override
  String get ma3CategoryMovementDesc => 'Pan/Tilt, cirkel, figuur 8, posities';

  @override
  String get ma3CategoryEffect => 'Effecten';

  @override
  String get ma3CategoryEffectDesc =>
      'Stroboscoop, puls, achtervolging, sequenties';

  @override
  String get ma3CategoryDimmer => 'Intensiteit';

  @override
  String get ma3CategoryDimmerDesc => 'Dimmer, bump, fade, black-out';

  @override
  String get ma3CategoryLayout => 'Indeling';

  @override
  String get ma3CategoryLayoutDesc => 'MA3-lay-outs maken/organiseren';

  @override
  String get ma3CategorySelect => 'Selectie';

  @override
  String get ma3CategorySelectDesc =>
      'Selectie van groepen, armaturen, filters';

  @override
  String get ma3CategoryMacro => 'Macro';

  @override
  String get ma3CategoryMacroDesc => 'Meerstapsmacro\'s, consolesequenties';

  @override
  String get ma3CategoryUtility => 'Nutsvoorziening';

  @override
  String get ma3CategoryUtilityDesc =>
      'Label, bewaar en organiseer het showbestand';

  @override
  String get ma3CategoryCustom => 'Op maat gemaakt';

  @override
  String get ma3CategoryCustomDesc => 'Beschrijf vrij wat je wilt';

  @override
  String get ma3FieldColorSpace => 'Machinekleurruimte';

  @override
  String get ma3FieldColors =>
      'Kleuren die als presets kunnen worden aangeboden';

  @override
  String get ma3FieldGroupSelect =>
      'De plug-in vraagt ​​bij het opstarten naar de groep';

  @override
  String get ma3YesViaMa3Dialog => 'Ja — via dialoog MA3';

  @override
  String get ma3NoUseCurrentSelection => 'Nee — gebruikt de huidige selectie';

  @override
  String get ma3FieldMovementType => 'Type beweging dat u wilt creëren';

  @override
  String get ma3MovePresetPositions =>
      'Vooraf ingestelde posities (scène, voorkant, zijkanten...)';

  @override
  String get ma3MoveCircle => 'Effectengine — Cirkel';

  @override
  String get ma3MoveFigure8 => 'Effectengine – Afbeelding 8';

  @override
  String get ma3MovePanSweep => 'Effectengine — Pan-veegbeweging';

  @override
  String get ma3MoveTiltSweep => 'Effectengine - Tilt-sweep';

  @override
  String get ma3MoveRandom => 'Effectengine: willekeurig';

  @override
  String get ma3FieldSpeedSourceEffects => 'Snelheidsbron (voor effecten)';

  @override
  String get ma3SpeedBpmConsole => 'BPM — waarde ingevoerd in de console';

  @override
  String get ma3SpeedExecutorConsole =>
      'Speed ​​Executor — nummer ingevoerd in de console';

  @override
  String get ma3SpeedBothConsole => 'Beide: keuze aangeboden in de console';

  @override
  String get ma3FieldEffectType => 'Type effect dat u wilt creëren';

  @override
  String get ma3FieldOutput => 'Wat de plug-in creëert';

  @override
  String get ma3OutputEffectPresets => 'Effectvoorinstellingen';

  @override
  String get ma3OutputChaseSequence => 'Achtervolgingsreeks';

  @override
  String get ma3OutputTriggerMacro => 'Macro-trigger';

  @override
  String get ma3FieldSpeedSource => 'Snelheid Bron';

  @override
  String get ma3FieldFeatures => 'Functies om op te nemen';

  @override
  String get ma3OutputIntensityMacros => 'Intensiteit macro\'s';

  @override
  String get ma3OutputIntensityPresets => 'Voorinstellingen voor intensiteit';

  @override
  String get ma3FieldLayoutSections =>
      'Secties die in de lay-out moeten worden opgenomen';

  @override
  String get ma3SectionColors => 'Kleuren';

  @override
  String get ma3SectionGroups => 'Groepen';

  @override
  String get ma3SectionPresets => 'Voorinstellingen';

  @override
  String get ma3FieldVisualStyle => 'Visuele stijl';

  @override
  String get ma3FieldGroupNameNumber =>
      'De plug-in vraagt ​​bij het opstarten om de naam/het nummer';

  @override
  String get ma3NoHardcodedGenericName => 'Nee - hardgecodeerde generieke naam';

  @override
  String get ma3FieldSelectionCriteria => 'Voor te stellen selectiecriteria';

  @override
  String get ma3CriteriaEvenOdd => 'Even/oneven';

  @override
  String get ma3CriteriaThirds => '1/3 — 2/3 — 3/3';

  @override
  String get ma3CriteriaPosition => 'Op positie (vooruit/midden/achter)';

  @override
  String get ma3CriteriaAll => 'Alle';

  @override
  String get ma3CriteriaFirstLast => 'Eerste/Laatste';

  @override
  String get ma3OutputSelectionMacros => 'Selectie macro\'s';

  @override
  String get ma3OutputGroupButtonsLayout => 'Groepeer knoppen in een lay-out';

  @override
  String get ma3FieldMacroSteps => 'Beschrijf de stappen van de macro';

  @override
  String get ma3MacroStepsHint =>
      'bijvoorbeeld:\n1. Selecteer een groep (dialoogvenster)\n2. Black-out\n3. Wacht 1 seconde\n4. Fade-in 3s';

  @override
  String get ma3FieldTrigger => 'Trekker';

  @override
  String get ma3TriggerManual => 'Handmatig';

  @override
  String get ma3FieldTask => 'Uit te voeren taak';

  @override
  String get ma3TaskNameFixtures => 'De patcharmaturen een naam geven';

  @override
  String get ma3TaskCreateGroups => 'Creëer automatisch groepen';

  @override
  String get ma3TaskStorePresets => 'Sla alle voorinstellingen op';

  @override
  String get ma3TaskCleanEmptyObjects => 'Maak lege voorwerpen schoon';

  @override
  String get ma3TaskCloneLayout => 'Kloon een lay-out';

  @override
  String get ma3TaskShowReport => 'Rapport tonen (armaturen, groepen, presets)';

  @override
  String get ma3FieldConfirmEachAction => 'Bevestig vóór elke actie';

  @override
  String get ma3Yes => 'Ja';

  @override
  String get ma3No => 'Nee';

  @override
  String get ma3FieldCustomDescription =>
      'Beschrijf wat de plug-in moet doen in MA3';

  @override
  String get ma3ColorRed => 'Rood';

  @override
  String get ma3ColorGreen => 'Groente';

  @override
  String get ma3ColorBlue => 'Blauw';

  @override
  String get ma3ColorYellow => 'GEEL';

  @override
  String get ma3ColorOrange => 'Oranje';

  @override
  String get ma3ColorPink => 'Roze';

  @override
  String get ma3ColorColdWhite => 'Koel wit';

  @override
  String get ma3ColorWarmWhite => 'Warm wit';

  @override
  String get ma3EffectStrobe => 'Stroboscoop';

  @override
  String get ma3EffectPulse => 'Puls';

  @override
  String get ma3EffectChase => 'Achtervolging';

  @override
  String get ma3EffectTwinkle => 'Fonkel';

  @override
  String get ma3EffectFire => 'Vuur';

  @override
  String get ma3EffectSawtooth => 'Zaagtand';

  @override
  String get ma3EffectRandom => 'Willekeurig';

  @override
  String get ma3Blackout => 'Verduistering';

  @override
  String get ma3Full => 'Vol';

  @override
  String get ma3Bump => 'Buil';

  @override
  String get ma3FadeIn => 'Fade-in';

  @override
  String get ma3FadeOut => 'Vervagen';

  @override
  String get ma3DimmerChase => 'Dimmer achtervolging';

  @override
  String get ma3Compact => 'Compact';

  @override
  String get ma3Large => 'Breed';

  @override
  String get ma3Tablet => 'Tablet';

  @override
  String get ma3Wing => 'vleugel';

  @override
  String get ma3Random => 'Willekeurig';

  @override
  String get ma3FirstLast => 'Eerste/Laatste';

  @override
  String ma3Error(Object error) {
    return 'Fout: $error';
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
  String get ma3Text_Gel_Color => 'Gelkleur';

  @override
  String get ma3Text_Cyan => 'Cyaan';

  @override
  String get ma3Text_Magenta => 'Magenta';

  @override
  String get ma3Text_Lime => 'Limoen';

  @override
  String get ma3Text_UV => 'UV';

  @override
  String get ma3Text_OFF => 'UIT';

  @override
  String get ma3Text_50 => '50%';

  @override
  String get ma3Text_25 => '25%';

  @override
  String get ma3Text_GO_button => 'GO-knop';

  @override
  String get ma3Text_Timecode => 'Tijdcode';

  @override
  String get ma3Text_OSC => 'CSO';

  @override
  String get ma3Text_MIDI => 'MIDDAG';

  @override
  String get gdtfShareAsZip => 'Deel in .zip';

  @override
  String get gdtfZipShareHelp =>
      '💡 Handig als Gmail of uw e-mail .gdtf blokkeert: hernoem het bestand naar .gdtf na ontvangst.';

  @override
  String get rfAntennaTitle => 'Antenne rekenmachine';

  @override
  String get rfSplitterTitle => 'Splitter-/Combiner-verlies';

  @override
  String get rfCableAntennaTitle => 'RF-kabel & antennes';

  @override
  String get rfCableLossSectionTitle => 'Verlies in coaxkabel';

  @override
  String get rfCableLossCableTypeLabel => 'Kabeltype';

  @override
  String get rfCableAntennaFrequencyLabel => 'Frequentie';

  @override
  String get rfCableLossLengthLabel => 'Kabellengte';

  @override
  String get rfCableAntennaEmptyState =>
      'Vul de waarden in om het resultaat te zien.';

  @override
  String get rfCableLossResultLabel => 'Totaal verlies';

  @override
  String get rfCableLossFormulaNote =>
      'Verzwakking ≈ k1·√f + k2·f (dB/100 m) — empirisch model per kabeltype, doorgaans ±5% tussen 100 MHz en 2,5 GHz. Indicatieve waarden: raadpleeg het datasheet van de kabel voor een kritische linkbudget-berekening.';

  @override
  String get rfDiversitySectionTitle => 'Diversity-antenneafstand (λ/4)';

  @override
  String get rfDiversityResultLabel => 'Aanbevolen afstand';

  @override
  String get rfDiversityFormulaNote =>
      'λ/4 = 75 / f(MHz) meter — aanbevolen minimale afstand tussen twee diversity-antennes om multipath-fading te beperken.';

  @override
  String get rfPlannerTitle => 'HF-Frequentieplanner';

  @override
  String get rfPlannerBandLabel => 'Frequentieband';

  @override
  String get rfPlannerCustomBand => 'Aangepast';

  @override
  String get rfPlannerMinFreqLabel => 'Min. frequentie';

  @override
  String get rfPlannerMaxFreqLabel => 'Max. frequentie';

  @override
  String get rfPlannerChannelCountLabel => 'Gewenst aantal kanalen';

  @override
  String get rfPlannerMinSpacingLabel => 'Minimale afstand tussen kanalen';

  @override
  String get rfPlannerResultTitle => 'Voorgestelde frequenties';

  @override
  String get rfPlannerFoundLabel => 'Gevonden kanalen';

  @override
  String get rfPlannerNotEnoughWarning =>
      'Niet alle gevraagde kanalen konden in deze band met deze afstand worden gevonden — probeer een bredere band of verminder het aantal kanalen/de minimale afstand.';

  @override
  String get rfPlannerFormulaNote =>
      'Vermijdt derde-orde intermodulatieproducten (2fA−fB, fA+fB−fC) tussen alle kanalen, ±200 kHz tolerantie — geen absolute garantie, controleer ter plaatse met een RF-scan.';

  @override
  String get rfSplitterWaysLabel => 'Aantal wegen';

  @override
  String get rfSplitterExcessLossLabel => 'Extra verlies van de splitter';

  @override
  String get rfSplitterAdditionalLossLabel => 'Kabel- en connectorverliezen';

  @override
  String get rfSplitterTotalTitle => 'Totale insertieverlies';

  @override
  String get rfSplitterTheoreticalLabel => 'Theoretisch verlies (10·log₁₀N)';

  @override
  String get rfSplitterReferenceTitle => 'Referentie per aantal wegen';

  @override
  String get rfSplitterFormulaNote =>
      'Totaal verlies ≈ theoretisch verlies + extra verlies + kabel-/connectorverliezen';

  @override
  String get rfFrequency => 'Frequentie';

  @override
  String get rfVelocityFactorTitle => 'Snelheidsfactor (Vf)';

  @override
  String get rfAntennaLengths => 'Antenne lengtes';

  @override
  String get rfEnterFrequencyToCalculate =>
      'Voer een frequentie in om te berekenen';

  @override
  String get rfFullWave => 'Volledige golf (λ)';

  @override
  String get rfHalfWave => 'Halve golf (λ/2)';

  @override
  String get rfStandardDipole => 'Standaard dipool';

  @override
  String get rfQuarterWave => 'Kwartgolf (λ/4)';

  @override
  String get rfWhipAntenna => 'Sprietantenne - meest voorkomende';

  @override
  String get rfFiveEighthWave => '5/8 golf (5λ/8)';

  @override
  String get rfFiveEighthWaveDescription => 'Versterking +3 dB versus λ/4';

  @override
  String get rfReferenceFrequencies => 'Referentiefrequenties';

  @override
  String get rfFmRadio => 'FM-radio (88MHz)';

  @override
  String get rfVhfLow => 'VHF laag (174 MHz)';

  @override
  String get rfUhf470 => 'UHF-470 MHz';

  @override
  String get rfUhf600 => 'UHF-600 MHz';

  @override
  String get rfUhf694 => 'UHF 694 MHz (FR-limiet)';

  @override
  String get rfIsm863 => 'ISM-863 MHz';

  @override
  String get rfWifi24 => '2,4 GHz wifi';

  @override
  String get rfWifi5 => '5 GHz WiFi (midden)';

  @override
  String get rfFormulaExplanation =>
      'λ = c / f × Vf |    c = 299,792 m/µs\nVf = kabelsnelheidsfactor (1,00 voor vrije lucht)';

  @override
  String get rfPresetFreeSpace => 'Vrije lucht';

  @override
  String get rfCoexTitle => '2,4 GHz-coëxistentie';

  @override
  String get rfCoexBandOccupancyTitle => 'Wie bezet de 2,4 GHz-band?';

  @override
  String get rfCoexAvProtocolsTitle => '⚡ AV-protocollen op 2,4 GHz';

  @override
  String get rfCoexAllProtocolsTitle => 'Alle protocollen';

  @override
  String get rfCoexFrequentConflictsTitle =>
      'Frequente conflicten bij evenementen';

  @override
  String get rfCoexFieldRecommendationsTitle => 'Aanbevelingen ter plaatse';

  @override
  String get rfCoexProtocolWifi24Name => '2,4 GHz wifi';

  @override
  String get rfCoexProtocolWifi24Note =>
      'Vaste kanalen, breedband. Hoog zendvermogen.';

  @override
  String get rfCoexProtocolBluetoothClassicName => 'Bluetooth-klassieker';

  @override
  String get rfCoexProtocolBluetoothClassicNote =>
      'Springt tussen 1600 frequenties/s. Coëxistentie met WiFi via AFH.';

  @override
  String get rfCoexProtocolBluetoothLeName => 'Bluetooth LE';

  @override
  String get rfCoexProtocolBluetoothLeNote =>
      'Kanalen 37, 38, 39 = reclame (vast). Risico met WiFi ch1.';

  @override
  String get rfCoexProtocolZigbeeName => 'Zigbee (IEEE 802.15.4)';

  @override
  String get rfCoexProtocolZigbeeNote =>
      'Kanalen 11–26, elk 2 MHz breed. Compatibel met WiFi ch1/6/11.';

  @override
  String get rfCoexProtocolDigitalMics24Name => 'Digitale microfoons 2,4GHz';

  @override
  String get rfCoexProtocolDigitalMics24Note =>
      'Shure GLX-D, Line6 XD-V, Sennheiser EW-D 2,4 GHz. Zeer gevoelig voor WiFi-interferentie.';

  @override
  String get rfCoexProtocolWirelessDmxName => 'DMX / Draadloze RDM';

  @override
  String get rfCoexProtocolWirelessDmxNote =>
      'Lumen Radio CRMX, W-DMX, Stadstheater. FHSS = robuust maar band delen.';

  @override
  String get rfCoexProtocolWirelessVideoName => 'Draadloze video';

  @override
  String get rfCoexProtocolWirelessVideoNote =>
      'Hollyland Mars, DJI O3, Teradek Bolt 4K. Zeer grote bandbreedte, grote conflicten mogelijk.';

  @override
  String get rfCoexTypeDsssOfdm => 'DSSS/OFDM';

  @override
  String get rfCoexTypeFhss79 => '79-kanaals FHSS';

  @override
  String get rfCoexTypeFhss40 => '40-kanaals FHSS';

  @override
  String get rfCoexTypeDsss16 => '16-kanaals DSSS';

  @override
  String get rfCoexTypeFhssDsss => 'FHSS/DSSS';

  @override
  String get rfCoexTypeFhss => 'FHSS';

  @override
  String get rfCoexTypeOfdm => 'OFDM';

  @override
  String get rfCoexConflictWifiCh6 => 'Wi-Fi kanaal6';

  @override
  String get rfCoexConflictMic24 => 'Microfoon 2,4 GHz';

  @override
  String get rfCoexConflictBleAdvertising => 'BLE-reclame';

  @override
  String get rfCoexConflictWifiCh1 => 'WiFi-kanaal 1';

  @override
  String get rfCoexConflictWirelessVideo => 'Draadloze video';

  @override
  String get rfCoexConflictEverythingElse => 'Al het andere';

  @override
  String get rfCoexConflictZigbeeCh11 => 'Zigbee kanaal 11';

  @override
  String get rfCoexRiskHigh => 'LEERLING';

  @override
  String get rfCoexRiskMedium => 'GEMIDDELD';

  @override
  String get rfCoexConflictWifiCh6Mic24Desc =>
      'WiFi ch6 overlapt direct de voorkeursfrequenties van digitale microfoons.';

  @override
  String get rfCoexConflictBleWifiCh1Desc =>
      'BLE-kanalen 37/38/39 bevinden zich op 2402, 2426 en 2480 MHz.';

  @override
  String get rfCoexConflictVideoEverythingDesc =>
      'Draadloze videoverbindingen gebruiken een grote bandbreedte en verzadigen de band gemakkelijk.';

  @override
  String get rfCoexConflictZigbeeWifiCh1Desc =>
      'Zigbee kanaal 11 (2405 MHz) bevindt zich direct in de WiFi-kanaal 1-band.';

  @override
  String get rfCoexTipWifiChannels =>
      'Reserveer WiFi voor kanaal 1 en/of 11. Vermijd kanaal 6 als je 2,4 GHz microfoons hebt.';

  @override
  String get rfCoexTipUhfMics =>
      'Voor HF-microfoons in dichte gebieden geeft u de voorkeur aan UHF-systemen (470–694 MHz) boven 2,4 GHz-systemen.';

  @override
  String get rfCoexTipWirelessVideo5Ghz =>
      'Draadloze videoverbindingen: gebruik indien mogelijk absoluut de 5 GHz-band.';

  @override
  String get rfCoexTipWirelessDmxFhss =>
      'De draadloze DMX FHSS is het meest robuust: hij slaat automatisch drukke frequenties over.';

  @override
  String get rfCoexTipSpectrumScan =>
      'Doe vóór het evenement een spectrumscan met een RF-app (WiFi Analyzer, Chanalyzer, etc.).';

  @override
  String get rfPageTitle => 'RF en draadloos';

  @override
  String get rfSectionMicrosHf => 'HF-microfoons en antennes';

  @override
  String get rfSectionCalcHf => 'HF-berekeningen';

  @override
  String get rfSectionWifi => 'Wifi';

  @override
  String get rfSectionCoexistence => 'Coëxistentie';

  @override
  String get rfSectionScanTerrain => 'Scannen en veld';

  @override
  String get rfFreeLabel => 'VRIJ';

  @override
  String get rfToolUhfBandsTitle => 'UHF/VHF-banden';

  @override
  String get rfToolUhfBandsSubtitle =>
      'Legale banden Frankrijk (ANFR), UHF 470–694 MHz, digitaal dividend, DECT, ISM 863 MHz.';

  @override
  String get rfToolAntennaTitle => 'Antenne rekenmachine';

  @override
  String get rfToolAntennaSubtitle =>
      'Frequentie → λ/4, λ/2, 5λ/8. Snelheidsfactor voor coaxkabels. UHF/WiFi-referenties.';

  @override
  String get rfToolIm3Title => 'IM3-intermodulatie';

  @override
  String get rfToolIm3Subtitle =>
      'Berekent 2Fi−Fj voor 2 tot 16 frequenties. Detecteert producten die op jouw kanalen vallen.';

  @override
  String get rfToolWifi24Title => '2,4 GHz WiFi-kanalen';

  @override
  String get rfToolWifi24Subtitle =>
      '13 kanalen, visuele overlappingen, conflictsimulator. Niet-conflicterende kanalen 1, 6, 11.';

  @override
  String get rfToolWifi5Title => '5GHz WiFi-kanalen';

  @override
  String get rfToolWifi5Subtitle =>
      'UNII-1/2A/2C-banden, DFS, kanalen beschikbaar in Frankrijk. Niet-overlappend bij 80 MHz.';

  @override
  String get rfToolCoexTitle => '2,4 GHz-coëxistentie';

  @override
  String get rfToolCoexSubtitle =>
      'Wie deelt de band: WiFi, Bluetooth, Zigbee, digitale microfoons, draadloos DMX, video. Typische conflicten.';

  @override
  String get rfToolScanWifiTitle => 'WiFi-scan';

  @override
  String get rfToolScanWifiSubtitle =>
      'Analyseert omliggende WiFi-netwerken: kanalen, RSSI, 2,4/5 GHz-banden. Visualisatie van spectrumbezetting.';

  @override
  String get rfToolScanLogTitle => 'RF-scanlogboek';

  @override
  String get rfToolScanLogSubtitle =>
      'Handmatige frequentie-uitlezing: signaalniveau, status (vrij/grens/bezet), veldnotities.';

  @override
  String get rfIm3PageTitle => 'IM3-intermodulatie';

  @override
  String get rfIm3WhatIs => 'Wat is IM3?';

  @override
  String get rfIm3WhatIsBody =>
      'Wanneer twee zenders F1 en F2 een versterker of ontvanger binnenkomen, genereren ze valse frequenties bij 2F1−F2 en 2F2−F1. Deze intermodulatieproducten van de derde orde komen dicht bij de oorspronkelijke frequenties en kunnen een naburig HF-kanaal blokkeren.';

  @override
  String get rfIm3QuickMode => 'Snelle modus — 2 frequenties';

  @override
  String get rfIm3AdvancedMode => 'Geavanceerde modus — tot 16 frequenties';

  @override
  String rfIm3FrequencyN(int index) {
    return 'Frequentie $index';
  }

  @override
  String get rfIm3AddFrequency => 'Voeg een frequentie toe';

  @override
  String get rfIm3Tips => 'Veldadvies';

  @override
  String get rfIm3Tip1 =>
      'Verdeel uw frequenties onregelmatig. Regelmatige hiaten genereren IM3\'s die rechtstreeks op uw kanalen vallen.';

  @override
  String get rfIm3Tip2 =>
      'Detectietolerantie: ±200 kHz. Pas deze aan de bandbreedte van uw systemen aan (doorgaans 200–400 kHz).';

  @override
  String get rfIm3Tip3 =>
      'De tools Shure Wireless Workbench, Sennheiser WSM en Audio-Technica Frequency Manager omvatten IM3-berekeningen voor hun bereik; gebruik ze voor de uiteindelijke implementatie.';

  @override
  String get rfIm3OutOfBand => 'Buiten band (< 0 MHz)';

  @override
  String get rfIm3ConflictOnFreq =>
      '⚠ Valt op een gebruikte frequentie (±200 kHz)';

  @override
  String get rfIm3TableFormula => 'Formule';

  @override
  String get rfIm3TableFreqIm3 => 'IM3-frequentie';

  @override
  String get rfIm3TableStatus => 'Status';

  @override
  String get rfIm3Footnote =>
      'IM3 = 2×Fi − Fj |    Conflicttolerantie: ±200 kHz\nNegatieve producten (buiten het spectrum) worden weergegeven, maar zijn niet conflicterend.';

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
  String get rfScanLogTitle => 'RF-scanlogboek';

  @override
  String get rfScanLogClearAll => 'Alles wissen';

  @override
  String get rfScanLogAdd => 'Toevoegen';

  @override
  String get rfScanLogClearConfirmTitle => 'Logboek wissen?';

  @override
  String get rfScanLogClearConfirmContent =>
      'Alle vermeldingen worden verwijderd.';

  @override
  String get rfScanLogCancel => 'Annuleren';

  @override
  String get rfScanLogDelete => 'Om te wissen';

  @override
  String get rfScanLogNewEntry => 'Nieuwe invoer';

  @override
  String get rfScanLogFrequency => 'Frequentie';

  @override
  String get rfScanLogOptionalLevel => 'Gemeten niveau (optioneel)';

  @override
  String get rfScanLogNote => 'Opmerking';

  @override
  String get rfScanLogNoteHint =>
      'bijv.: kanaal 36, kamer B, tv-interferentie...';

  @override
  String get rfScanLogStatusLabel => 'Status:';

  @override
  String get rfScanLogSave => 'Redden';

  @override
  String get rfScanLogEmptyTitle => 'Leeg dagboek';

  @override
  String get rfScanLogEmptyBody =>
      'Noteer hier uw veldmetingen: frequentie, niveau gemeten op de analyser, status en commentaar.';

  @override
  String get rfScanLogFirstEntry => 'Eerste binnenkomst';

  @override
  String get rfScanLogStatusFree => 'Vrij';

  @override
  String get rfScanLogStatusOccupied => 'Druk bezig';

  @override
  String get rfScanLogStatusBorderline => 'Grenslijn';

  @override
  String get rfScanLogInstant => 'Op dit moment';

  @override
  String rfScanLogMinutesAgo(int n) {
    return '$n min geleden';
  }

  @override
  String rfScanLogHoursAgo(int n) {
    return '$n uur geleden';
  }

  @override
  String get rfScanLogFreePlural => 'Vrij';

  @override
  String get rfScanLogOccupiedPlural => 'Druk bezig';

  @override
  String get rfScanLogBorderlinePlural => 'Grens.';

  @override
  String get rfScanLogTotal => 'Totaal';

  @override
  String get rfUhfBandsTitle => 'UHF/VHF-banden';

  @override
  String get rfUhfBandsOverview => 'Overzicht — Frankrijk';

  @override
  String get rfUhfBandsTips => 'Tips voor bandselectie';

  @override
  String get rfUhfBandsSource =>
      'Bron: ANFR / ARCEP — Franse regelgeving.\nRegels kunnen per land verschillen.\nControleer altijd de conformiteit van uw apparatuur.';

  @override
  String get rfUhfBand1Name => 'VHF Laag';

  @override
  String get rfUhfBand1Status => 'Beperkt';

  @override
  String get rfUhfBand1Desc =>
      'Oude analoge tv-band. Sommige HF-systemen gebruiken dit bereik. Minder gebruikelijk bij evenementen.';

  @override
  String get rfUhfBand1Examples => 'Sommige oudere Sennheiser-, Shure-systemen';

  @override
  String get rfUhfBand2Name => 'UHF — TV-blok';

  @override
  String get rfUhfBand2Status => 'Pro (vergunning)';

  @override
  String get rfUhfBand2Desc =>
      'Belangrijkste band voor professionele draadloze microfoons in Frankrijk. Gedeeld met DTT. Vereist ANFR-vergunning voor commercieel gebruik. Vrij gebruik voor audiovisuele productie onder voorwaarden.';

  @override
  String get rfUhfBand2Examples =>
      'Shure Axient, Sennheiser 2000, Sony DWX, Audio-Technica 3000';

  @override
  String get rfUhfBand3Name => 'Digitaal dividend';

  @override
  String get rfUhfBand3Status => 'VERBODEN';

  @override
  String get rfUhfBand3Desc =>
      'Band toegewezen aan 4G/5G mobiele netwerken in Frankrijk sinds 2017. Alle draadloze audioapparatuur in deze band is sindsdien illegaal.';

  @override
  String get rfUhfBand4Name => 'ISM / SRD 863 MHz';

  @override
  String get rfUhfBand4Status => 'Vrij (10 mW)';

  @override
  String get rfUhfBand4Desc =>
      'Vrije band in Europa (SRD — Short Range Device). Geen vergunning vereist. Vermogenslimiet: 10 mW ERP, 25 kHz bandbreedte.';

  @override
  String get rfUhfBand4Examples =>
      'Sommige instapsystemen, afstandsbedieningen';

  @override
  String get rfUhfBand5Name => 'DECT';

  @override
  String get rfUhfBand5Status => 'Vrij (250 mW)';

  @override
  String get rfUhfBand5Desc =>
      'Standaard gewijd aan draadloze spraak. Geen interferentie met WiFi/Bluetooth. Gebruikt voor conferentiesystemen, intercom en sommige draadloze microfoons.';

  @override
  String get rfUhfBand5Examples =>
      'Bosch CCS-800 Ultro, Sennheiser SpeechLine, Beyerdynamic Quinta';

  @override
  String get rfUhfBand6Name => 'Digitale microfoon 2.4 GHz';

  @override
  String get rfUhfBand6Status => 'Vrij (100 mW)';

  @override
  String get rfUhfBand6Desc =>
      'ISM-band, vrij zonder vergunning. Gevoelig voor WiFi- en Bluetooth-interferentie. Geschikt voor kleine producties, vermijd grote zalen met dicht WiFi-verkeer.';

  @override
  String get rfUhfBand6Examples =>
      'Shure GLX-D, Line6 XD-V, Sennheiser EW-D (2.4G-variant)';

  @override
  String get rfUhfBand7Name => 'Draadloos 5.8 GHz';

  @override
  String get rfUhfBand7Status => 'Beperkt (FR)';

  @override
  String get rfUhfBand7Desc =>
      'Niet beschikbaar voor WiFi in Frankrijk, maar sommige propriëtaire systemen gebruiken dit bereik. Controleer de ARCEP-conformiteit van elk apparaat.';

  @override
  String get rfUhfBand7Examples => 'Sommige hoogwaardige IEM-systemen';

  @override
  String get rfUhfOverviewSublabel1 => 'VHF / overgangsband';

  @override
  String get rfUhfOverviewSublabel2 => 'UHF pro (vergunning)';

  @override
  String get rfUhfOverviewSublabel3 => '4G/5G — VERBODEN';

  @override
  String get rfUhfOverviewSublabel4 => 'Vrij ISM';

  @override
  String get rfUhfOverviewSublabel5 => 'Vrij DECT';

  @override
  String get rfUhfOverviewSublabel6 => 'ISM (WiFi + digitale microfoons)';

  @override
  String get rfUhfTip1 =>
      '470–694 MHz: optimaal voor professionele producties. Ruime keuze aan frequenties, goed RF-gedrag. Geef het gebruik aan bij de ANFR voor professionele evenementen.';

  @override
  String get rfUhfTip2 =>
      'Zorg ervoor dat uw apparatuur zich buiten de 694–790 MHz-band bevindt. Oude, onverkochte systemen van na 2017 zijn illegaal op het podium.';

  @override
  String get rfUhfTip3 =>
      'DECT (1880–1900 MHz) is ideaal voor conferentiesystemen: speciale band, geen WiFi/BT-interferentie.';

  @override
  String get rfUhfTip4 =>
      '2,4 GHz-systemen zijn handig, maar gevoelig voor dichte WiFi-omgevingen. Vermijd grote vergaderzalen.';

  @override
  String get rfLegendPro => 'Pro (autorisatie)';

  @override
  String get rfLegendFree => 'Vrij';

  @override
  String get rfLegendForbidden => 'Verboden';

  @override
  String get rfWifi24PageTitle => '2,4 GHz wifi';

  @override
  String get rfWifi24SpectrumTitle => '2,4 GHz spectrum — overlapt';

  @override
  String get rfWifi24SimulateTitle => 'Simuleer coëxistentie';

  @override
  String get rfWifi24SelectChannels =>
      'Selecteer de kanalen die in uw omgeving worden gebruikt:';

  @override
  String get rfWifi24ConflictWarning =>
      '⚠️ Geselecteerde kanalen overlappen elkaar — risico op wederzijdse interferentie.';

  @override
  String get rfWifi24ChannelTableTitle => 'Kanaaltabel';

  @override
  String get rfWifi24BestPractices => 'Beste praktijken';

  @override
  String get rfWifi24LegendNonOverlap => 'Niet-overlappend kanaal';

  @override
  String get rfWifi24LegendOk => 'OK geselecteerd';

  @override
  String get rfWifi24LegendConflict => 'Conflict';

  @override
  String get rfWifi24HdrChannel => 'Kanaal';

  @override
  String get rfWifi24HdrCenter => 'Centrum';

  @override
  String get rfWifi24HdrStart => 'Begin';

  @override
  String get rfWifi24HdrEnd => 'EINDE';

  @override
  String get rfWifi24Tip1 =>
      'Gebruik altijd kanalen 1, 6 en 11 voor 3 niet-overlappende WiFi-netwerken.';

  @override
  String get rfWifi24Tip2 =>
      'Bij 20 MHz-kanalen overlappen ook de kanalen 1, 5, 9 en 13 elkaar niet.';

  @override
  String get rfWifi24Tip3 =>
      '2,4 GHz WiFi deelt de band met Bluetooth, Zigbee en 2,4 GHz digitale microfoons.';

  @override
  String get rfWifi24Tip4 =>
      'In dichtbevolkte gebieden geeft u de voorkeur aan 5 GHz (minder druk) voor gevoelige apparatuur.';

  @override
  String get rfWifi5PageTitle => '5GHz WiFi';

  @override
  String get rfWifi5RegulationTitle => 'Franse regelgeving (ARCEP)';

  @override
  String get rfWifi5BandsAvailable => 'Banden beschikbaar';

  @override
  String get rfWifi5Unii3Forbidden => 'UNII-3 (5725-5850)';

  @override
  String get rfWifi5ForbiddenLabel => 'Verboden';

  @override
  String get rfWifi5DfsNote =>
      '⚠️ DFS (Dynamic Frequency Selection): UNII-2A- en 2C-kanalen vereisen radardetectie. De apparatuur kan automatisch van kanaal wisselen als er een radar wordt gedetecteerd.';

  @override
  String get rfWifi5ChannelWidthsTitle => 'Kanaalbreedtes';

  @override
  String get rfWifi5Bw20 => 'Maximale compatibiliteit, beperkte doorstroming';

  @override
  String get rfWifi5Bw40 => '2 gekoppelde kanalen — 802.11n';

  @override
  String get rfWifi5Bw80 => '4 gekoppelde kanalen — 802.11ac/ax';

  @override
  String get rfWifi5Bw160 => '8 gekoppelde kanalen — alleen 802.11ax';

  @override
  String get rfWifi5NonOverlapTitle =>
      'Niet-overlappende kanalen op 80 MHz (Frankrijk)';

  @override
  String get rfWifi5NonOverlapFor3 =>
      'Voor 3 niet-overlappende 80 MHz-netwerken (Frankrijk):';

  @override
  String get rfWifi5MaxNetworks =>
      '→ Tot 6 80 MHz-netwerken alleen beschikbaar op UNII-2C.';

  @override
  String get rfWifi5ChannelsMhz => 'Kanalen (20 MHz)';

  @override
  String get rfWifi5ForbiddenFR => 'Verboden FR';

  @override
  String get rfWifi5Indoor => 'Binnen';

  @override
  String get rfWifiScanTitle => 'WiFi-scan';

  @override
  String get rfWifiScanPlatformInfo =>
      'Actief scannen op Android (lokalisatietoestemming vereist). Op iOS is alleen het verbonden netwerk zichtbaar.';

  @override
  String get rfWifiScanStart => 'Start de scan';

  @override
  String get rfWifiScanInProgress => 'Bezig met scannen…';

  @override
  String get rfWifiScanGroupedTooltip => 'Lijstweergave';

  @override
  String get rfWifiScanFlatTooltip => 'Groepsweergave';

  @override
  String get rfWifiScanNoResults =>
      'Start de scan om aangrenzende netwerken te zien.';

  @override
  String get rfWifiScanOccupation => '2,4 GHz kanaalbezetting';

  @override
  String get rfWifiScanNonOverlapNote =>
      'Vetgedrukte kanalen (1, 6, 11) = niet-overlappend';

  @override
  String get rfWifiScanHidden => '(verborgen netwerk)';

  @override
  String rfWifiScanNetworks24(int count) {
    return '$count netwerken';
  }

  @override
  String rfWifiScanNetworks5(int count) {
    return '$count netwerken';
  }

  @override
  String rfWifiScanTotal(int count) {
    return '$count totaal';
  }

  @override
  String get rfWifiScanSub24 => '2,4 GHz';

  @override
  String get rfWifiScanSub5 => '5 GHz';

  @override
  String get rfWifiScanSubTotal => 'netwerken';

  @override
  String get rfWifiRssiExcellent => 'Uitstekend';

  @override
  String get rfWifiRssiBon => 'Goed';

  @override
  String get rfWifiRssiMoyen => 'GEMIDDELD';

  @override
  String get rfWifiRssiFaible => 'Zwak';

  @override
  String get audioLevelInputDbu => 'Waarde in dBu';

  @override
  String get audioLevelInputDbv => 'Waarde in dBV';

  @override
  String get audioLevelInputVrms => 'RMS-spanning';

  @override
  String get audioLevelDbfsNote =>
      '* dBFS relatief tot +24 dBu = 0 dBFS (typische waarde — verschilt per systeem)';

  @override
  String get audioGainStagingTip1 =>
      'Streef naar +4 dBu nominaal op elke fase. Houd ~18 dB hoofdruimte aan vóór de clip.';

  @override
  String get audioGainStagingTip2 =>
      'Het verschil tussen consument en professional (+4 dBu versus −10 dBV) is ~11,8 dB – compenseer de versterking op elke interface.';

  @override
  String get audioGainStagingTip3 =>
      'Gebalanceerde lijn (XLR): +4 dBu. Ongebalanceerde lijn (TS-aansluiting): −10 dBV. DI-box om impedantie en niveau aan te passen.';

  @override
  String get audioGainStagingTip4 =>
      'dBu = dB gerelateerd aan 0,775 V (600 Ω). dBV = dB relatief ten opzichte van 1 V. dBV = dBu − 2,218.';

  @override
  String get audioDiffTipEqual =>
      'Bijna gelijke bronnen: winst van ~+3 dB op de sterkste.';

  @override
  String audioDiffTipSmall(String diff) {
    return 'Verschil in $diff dB: de laagste draagt ​​weinig bij.';
  }

  @override
  String audioDiffTipMedium(String diff, String gain) {
    return 'Verschil van $diff dB: versterking beperkt tot ~$gain dB op de dominante bron.';
  }

  @override
  String get audioDiffTipLarge =>
      'Verschil > 10 dB: de zwakke bron is verwaarloosbaar. Versterking ≈ +0 dB.';

  @override
  String get audioIncoherentShortLabel => 'Inco. :';

  @override
  String get audioCoherentShortLabel => 'Coher. :';

  @override
  String audioAtDistance(String dist) {
    return 'Op $dist m';
  }

  @override
  String get rfWifiScanErrLocationRequired =>
      'Locatietoestemming vereist voor WiFi-scannen.';

  @override
  String get rfWifiScanErrLocationDenied =>
      'Locatietoestemming geweigerd. Activeer het in de instellingen.';

  @override
  String get rfWifiScanErrLocationDisabled =>
      'Locatieservice uitgeschakeld. Schakel het in op het apparaat.';

  @override
  String get rfWifiScanErrNotSupported =>
      'WiFi-scan wordt niet ondersteund op dit apparaat of deze besturingssysteemversie.';

  @override
  String get rfWifiScanErrFailed => 'Kan het scannen niet starten.';

  @override
  String get rfWifiScanErrDefault => 'Kan niet scannen op dit apparaat.';

  @override
  String get rfWifiScanErrReadResults => 'Kan de scanresultaten niet lezen.';

  @override
  String rfWifiScanErrGeneric(String error) {
    return 'Fout tijdens scannen: $error';
  }

  @override
  String get homeNetworkTitle => 'Netwerk';

  @override
  String get homeNetworkSubtitle =>
      'Lokale netwerkscan, Art-Net, sACN / E1.31.';

  @override
  String get networkPageTitle => 'Netwerk';

  @override
  String get networkScanCardTitle => 'Netwerkscan';

  @override
  String get networkScanCardSubtitle =>
      'Detecteer actieve apparaten op het lokale netwerk.';

  @override
  String get networkArtNetCardTitle => 'Visualisatieapparaat Art-Net';

  @override
  String get networkArtNetAddressingTitle => 'Art-Net-adressering';

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
  String get networkArtNetEmptyState =>
      'Vul geldige waarden in om het resultaat te zien.';

  @override
  String get networkArtNetFormulaNote =>
      'Port-Address (15 bit) = (Net << 8) | (Sub-Net << 4) | Universe — Net 0-127, Sub-Net 0-15, Universe 0-15, Port-Address 0-32767 (Art-Net 4-specificatie).';

  @override
  String get networkArtNetCardSubtitle =>
      'Luisteren en analyseren van ArtDMX-pakketten in realtime.';

  @override
  String get networkSacnCardTitle => 'Visualisatieapparaat sACN / E1.31';

  @override
  String get networkSacnCardSubtitle =>
      'Luisteren en analyseren van sACN / E1.31-pakketten in realtime.';

  @override
  String get networkComingSoon => 'Toekomst';

  @override
  String get networkFutureLuminex => 'Toezicht Luminex';

  @override
  String get networkFutureMaNet => 'MA-Net detectie';

  @override
  String get networkFutureAlarms => 'Netwerkalarmen';

  @override
  String get networkFutureSnapshots => 'Netwerkmomentopnamen';

  @override
  String get networkFutureExport => 'Exporteer PDF/CSV';

  @override
  String get networkScanTitle => 'Netwerkscan';

  @override
  String get networkPoeTitle => 'PoE-calculator';

  @override
  String get networkFiberTitle => 'Glasvezel-linkbudget';

  @override
  String get networkSubnetTitle => 'Subnetcalculator';

  @override
  String get networkSubnetIpLabel => 'IP-adres';

  @override
  String get networkSubnetPrefixLabel => 'Prefix (CIDR)';

  @override
  String get networkSubnetNetworkLabel => 'Netwerkadres';

  @override
  String get networkSubnetBroadcastLabel => 'Broadcastadres';

  @override
  String get networkSubnetNetmaskLabel => 'Subnetmasker';

  @override
  String get networkSubnetWildcardLabel => 'Wildcardmasker';

  @override
  String get networkSubnetFirstHostLabel => 'Eerste bruikbare IP';

  @override
  String get networkSubnetLastHostLabel => 'Laatste bruikbare IP';

  @override
  String get networkSubnetHostCountLabel => 'Bruikbare hosts';

  @override
  String get networkSubnetInvalidIp =>
      'Ongeldig IP-adres (verwacht formaat: 192.168.1.0)';

  @override
  String get networkSubnetDivideTitle => 'Splitsen in gelijke subnetten';

  @override
  String get networkSubnetDivideNote =>
      'Kies in hoeveel subnetten dit netwerk gesplitst moet worden.';

  @override
  String get networkFiberTypeLabel => 'Vezeltype';

  @override
  String get networkFiberDistanceLabel => 'Afstand';

  @override
  String get networkFiberAttenuationLabel => 'Demping (per km)';

  @override
  String get networkFiberAdditionalLossLabel => 'Connector- en lasverliezen';

  @override
  String get networkFiberBudgetLabel => 'Transceiver-linkbudget (optioneel)';

  @override
  String get networkFiberTotalTitle => 'Totaal verlies van de link';

  @override
  String get networkFiberMarginLabel => 'Resterende marge';

  @override
  String get networkFiberWarningOver =>
      'Marge overschreden: de link werkt mogelijk niet betrouwbaar over deze afstand.';

  @override
  String get networkFiberFormulaNote =>
      'Totaal verlies = demping × afstand + connector-/lasverliezen';

  @override
  String get networkPoeBudgetLabel => 'Injector-/switchbudget';

  @override
  String get networkPoeDeviceLabel => 'Apparaat';

  @override
  String get networkPoeClassLabel => 'PoE-klasse';

  @override
  String get networkPoeClassManual => 'Handmatig (vrije waarde)';

  @override
  String get networkPoeClassWord => 'Klasse';

  @override
  String get networkPoeDevicePowerLabel => 'Vermogen';

  @override
  String get networkPoeAddDevice => 'Apparaat toevoegen';

  @override
  String get networkPoeTotalTitle => 'Totaal verbruik';

  @override
  String get networkPoeRemainingLabel => 'Resterend budget';

  @override
  String get networkPoeEmptyState =>
      'Voeg minstens één apparaat toe om te berekenen.';

  @override
  String get networkPoeWarningOver =>
      'Budget overschreden: verwijder apparaten of gebruik een krachtigere switch/injector.';

  @override
  String get networkPoeFormulaNote =>
      'Totaal verbruik = som van de apparaten. Houd ongeveer 10-20% marge onder het totale budget.';

  @override
  String get networkScanStartButton => 'Start de scan';

  @override
  String get networkScanStopButton => 'Stop met scannen';

  @override
  String get networkScanScanning => 'Bezig met scannen…';

  @override
  String networkScanProgress(int done, int total) {
    return '$done / $total IP\'s gescand';
  }

  @override
  String networkScanDevicesFound(int count) {
    return '$count apparaat(en) gevonden';
  }

  @override
  String get networkScanNoDevicesFound =>
      'Geen apparaten gevonden op dit netwerk.';

  @override
  String get networkScanNoNetwork =>
      'Geen lokaal netwerk (Wi-Fi) gedetecteerd. Maak verbinding met een netwerk.';

  @override
  String get networkScanIosLimitation =>
      'Op iOS zijn MAC-adressen en fabrikant niet toegankelijk voor apps (Apple-beperking).';

  @override
  String get networkScanLocalIp => 'Lokaal IP-adres';

  @override
  String get networkScanSubnet => 'Masker';

  @override
  String get networkScanStatusOnline => 'Online';

  @override
  String networkScanResponseMs(int ms) {
    return '$ms ms';
  }

  @override
  String get networkScanPermissionDenied =>
      'Netwerktoestemming geweigerd. Controleer machtigingen.';

  @override
  String get networkScanErrorGeneric =>
      'Netwerkfout. Controleer uw verbinding.';

  @override
  String get networkScanHint =>
      'Tik op “Start Scan” om apparaten te detecteren.';

  @override
  String get artnetTitle => 'Visualisatieapparaat Art-Net';

  @override
  String get artnetStartButton => 'Begin met luisteren';

  @override
  String get artnetStopButton => 'Stop';

  @override
  String get artnetListening => 'Luisteren — Poort 6454';

  @override
  String get artnetNotListening => 'Inactief';

  @override
  String get artnetNoPackets => 'Wachten op Art-Net pakketten…';

  @override
  String get artnetUniversesTitle => 'Universum ontvangen';

  @override
  String artnetUniverseTitle(int universe) {
    return 'Universum $universe';
  }

  @override
  String artnetSourceIp(Object ip) {
    return 'Bron: $ip';
  }

  @override
  String artnetPackets(int count) {
    return '$count pakketten';
  }

  @override
  String artnetFps(Object fps) {
    return '$fps fps';
  }

  @override
  String get artnetShowActiveOnly => 'Alleen actieve kanalen';

  @override
  String artnetActiveCount(int count) {
    return '$count actieve kanalen';
  }

  @override
  String get artnetPlatformInfo =>
      'Art-Net — UDP-poort 6454. Moet zich op hetzelfde netwerk bevinden als de bron.';

  @override
  String get artnetErrorBind =>
      'Kan UDP-socket niet openen. Controleer netwerkrechten.';

  @override
  String get sacnTitle => 'Visualisatieapparaat sACN';

  @override
  String get sacnStartButton => 'Begin met luisteren';

  @override
  String get sacnStopButton => 'Stop';

  @override
  String get sacnListening => 'Luisteren — Poort 5568';

  @override
  String get sacnNotListening => 'Inactief';

  @override
  String get sacnNoPackets => 'Wachten op sACN pakketten…';

  @override
  String get sacnUniversesTitle => 'Universum ontvangen';

  @override
  String sacnUniverseTitle(int universe) {
    return 'Universum $universe';
  }

  @override
  String sacnSource(Object name) {
    return 'Bron: $name';
  }

  @override
  String sacnPriority(int value) {
    return 'Prioriteit: $value';
  }

  @override
  String sacnCid(Object cid) {
    return 'Klant-ID: $cid';
  }

  @override
  String sacnPackets(int count) {
    return '$count pakketten';
  }

  @override
  String sacnFps(Object fps) {
    return '$fps fps';
  }

  @override
  String get sacnShowActiveOnly => 'Alleen actieve kanalen';

  @override
  String sacnActiveCount(int count) {
    return '$count actieve kanalen';
  }

  @override
  String get sacnPlatformInfo =>
      'sACN / E1.31 — UDP-poort 5568. Multicast 239.255.x.x en unicast ondersteund.';

  @override
  String get sacnErrorBind =>
      'Kan UDP-socket niet openen. Controleer netwerkrechten.';

  @override
  String get sacnIosMulticastNote =>
      'Op iOS 14+ is voor sACN multicast mogelijk toestemming voor lokale netwerktoegang vereist.';

  @override
  String get diagCardTitle => 'Netwerkdiagnostiek';

  @override
  String get diagCardSubtitle =>
      'Automatische netwerkanalyse, Art-Net en sACN.';

  @override
  String get diagPageTitle => 'Netwerkdiagnostiek';

  @override
  String get diagPlatformInfo =>
      'Voer een netwerkscan uit + luister een paar seconden naar Art-Net/sACN en scan vervolgens op mogelijke problemen.';

  @override
  String get diagAnalyseButton => 'Analyseren';

  @override
  String get diagCancelButton => 'Annuleren';

  @override
  String get diagClearButton => 'Om te wissen';

  @override
  String get diagSnapshotButton => 'Momentopname';

  @override
  String get diagScoreLabel => 'Netwerkgezondheidsscore';

  @override
  String get diagStatusOk => 'Netwerk oké';

  @override
  String get diagStatusWarning => 'Aandacht';

  @override
  String get diagStatusCritical => 'Kritisch';

  @override
  String diagAnalysisDate(Object date) {
    return 'Geanalyseerd op $date';
  }

  @override
  String get diagSeverityInfo => 'Informatie';

  @override
  String get diagSeverityWarning => 'Waarschuwing';

  @override
  String get diagSeverityCritical => 'Kritisch';

  @override
  String get diagScanningNetwork => 'Netwerkscan wordt uitgevoerd...';

  @override
  String get diagCollectingFlux => 'Verzameling van stromen Art-Net / sACN…';

  @override
  String get diagAnalyzing => 'Analyse wordt uitgevoerd...';

  @override
  String diagScanProgress(int done, int total) {
    return '$done / $total IP\'s gescand';
  }

  @override
  String get diagNoResultYet =>
      'Druk op “Scannen” om de netwerkdiagnose te starten.';

  @override
  String get diagAlertsTitle => 'Waarschuwingen';

  @override
  String get diagNoAlerts =>
      'Geen waarschuwingen gedetecteerd: netwerk in orde.';

  @override
  String get diagSnapshotSaved => 'Momentopname opgeslagen.';

  @override
  String get diagNoLocalIp =>
      'Geen lokaal IP-adres gedetecteerd of ongeldig adres.';

  @override
  String get diagNoDevices => 'Geen apparaten gedetecteerd op het netwerk.';

  @override
  String get diagNoArtNet => 'Geen Art-Net streams ontvangen.';

  @override
  String get diagNoSacn => 'Geen sACN / E1.31-streams ontvangen.';

  @override
  String diagDuplicateIp(Object ip) {
    return 'Dubbel IP-adres gedetecteerd: $ip.';
  }

  @override
  String diagArtNetLowFps(int universe, Object fps) {
    return 'Art-Net Universum $universe: lage FPS ($fps fps).';
  }

  @override
  String diagSacnLowFps(int universe, Object fps) {
    return 'sACN Universum $universe: lage FPS ($fps fps).';
  }

  @override
  String diagZeroDmxChannels(Object protocol, int universe) {
    return '$protocol Universum $universe: actieve stroom, maar alle DMX kanalen staan ​​op nul.';
  }

  @override
  String diagManyUnknownDevices(int count) {
    return '$count naamloze apparaten gedetecteerd op het netwerk.';
  }

  @override
  String get ndiCardTitle => 'Ontdekking NDI';

  @override
  String get ndiCardSubtitle => 'Bronnen NDI / NewTek op het netwerk via mDNS.';

  @override
  String get ndiPageTitle => 'Ontdekking NDI';

  @override
  String get ndiStartButton => 'Om op te starten';

  @override
  String get ndiStopButton => 'Stop';

  @override
  String get ndiDiscovering => 'Onderzoek in uitvoering…';

  @override
  String get ndiHint =>
      'Druk op “Start” om te zoeken naar NDI bronnen op het netwerk.';

  @override
  String get ndiNoSources => 'Geen NDI bronnen gedetecteerd op dit netwerk.';

  @override
  String get ndiIosNote =>
      'Op iOS kan de mDNS-detectie beperkt zijn, afhankelijk van de netwerkconfiguratie.';

  @override
  String ndiSourcesFound(int count) {
    return '$count bron(nen) NDI gevonden';
  }

  @override
  String get ndiLabelName => 'Bron';

  @override
  String get ndiLabelHost => 'Machine';

  @override
  String get ndiLabelIp => 'IP';

  @override
  String get ndiLabelPort => 'Haven';

  @override
  String get ndiLabelService => 'Dienst';

  @override
  String get snapshotCardTitle => 'Netwerkmomentopnamen';

  @override
  String get snapshotCardSubtitle =>
      'Registreer en vergelijk de netwerkstatus op verschillende tijdstippen.';

  @override
  String get snapshotPageTitle => 'Netwerkmomentopnamen';

  @override
  String get snapshotEmpty => 'Geen momentopnamen opgeslagen.';

  @override
  String get snapshotDeleteConfirm => 'Deze momentopname verwijderen?';

  @override
  String get snapshotDeleteButton => 'VERWIJDEREN';

  @override
  String get snapshotCompareButton => 'Vergelijken';

  @override
  String get snapshotComparisonTitle => 'Vergelijking';

  @override
  String get snapshotComparisonSelectTwo =>
      'Selecteer twee momentopnamen om te vergelijken.';

  @override
  String get snapshotSnapshotA => 'Momentopname A';

  @override
  String get snapshotSnapshotB => 'Momentopname B';

  @override
  String get snapshotDevices => 'Apparaten';

  @override
  String get snapshotArtnetUniverses => 'Universum Art-Net';

  @override
  String get snapshotSacnUniverses => 'Universum sACN';

  @override
  String get snapshotNdiSources => 'Bronnen NDI';

  @override
  String get snapshotAlerts => 'Waarschuwingen';

  @override
  String get snapshotAdded => 'Verscheen';

  @override
  String get snapshotRemoved => 'Verdwenen';

  @override
  String get snapshotNoChanges => 'Geen verschil tussen de twee snapshots.';

  @override
  String get snapshotNoScore => 'Score niet beschikbaar';

  @override
  String get subscriptionCategoryNetworkTitle => 'Pro-netwerk';

  @override
  String get subscriptionCategoryNetworkDescription =>
      'Geavanceerde netwerktools: Art-Net, sACN, NDI, diagnostiek en snapshots.';

  @override
  String get subscriptionHeadlineNetworkSubtitle =>
      'Ontgrendelt Art-Net viewer, sACN viewer, NDI, netwerkdiagnostiek en snapshots.';

  @override
  String get networkPremiumLabel => 'PREMIE';

  @override
  String get networkPremiumUnlockButton => 'Deblokkeren';

  @override
  String get networkPremiumBannerText =>
      'Voor Art-Net, sACN, NDI, diagnostiek en snapshots is een Pro Network-abonnement vereist.';

  @override
  String get subscriptionCategoryNetworkShort => 'NETWERK';

  @override
  String get dashboardPageTitle => 'Netwerkdashboard';

  @override
  String get dashboardCardTitle => 'Netwerkdashboard';

  @override
  String get dashboardCardSubtitle => 'Realtime netwerkweergave';

  @override
  String get dashboardStatusIdle => 'In de wacht';

  @override
  String get dashboardStatusScanning => 'Bezig met scannen…';

  @override
  String get dashboardStatusCompleted => 'Scannen voltooid';

  @override
  String get dashboardStatusError => 'Netwerkfout';

  @override
  String get dashboardStatusListening => 'Actief luisteren';

  @override
  String get dashboardKpiDevices => 'Apparaten';

  @override
  String get dashboardKpiArtnet => 'Art-Net';

  @override
  String get dashboardKpiSacn => 'sACN';

  @override
  String get dashboardKpiNdi => 'NDI';

  @override
  String get dashboardKpiScore => 'Scoren';

  @override
  String get dashboardNoScore => '–';

  @override
  String get dashboardSectionAlerts => 'Actieve waarschuwingen';

  @override
  String get dashboardNoAlerts => 'Geen actieve waarschuwing';

  @override
  String get dashboardSectionSnapshot => 'Laatste momentopname';

  @override
  String get dashboardNoSnapshot => 'Geen momentopnamen opgeslagen';

  @override
  String get dashboardSectionQuickAccess => 'Snelle toegang';

  @override
  String get dashboardRescanButton => 'Opnieuw scannen';

  @override
  String get dashboardNdiRefreshButton => 'Update NDI';

  @override
  String get dashboardArtnetActive => 'Art-Net actief';

  @override
  String get dashboardSacnActive => 'sACN actief';

  @override
  String get dashboardNdiScanning => 'Ontdekking NDI…';

  @override
  String dashboardAlertNewDevice(Object ip) {
    return 'Nieuw apparaat: $ip';
  }

  @override
  String dashboardAlertLostDevice(Object ip) {
    return 'Apparaat ontbreekt: $ip';
  }

  @override
  String dashboardAlertNewArtnetUniverse(int universe) {
    return 'Nieuw universum Art-Net: $universe';
  }

  @override
  String dashboardAlertLostArtnetUniverse(int universe) {
    return 'Universum Art-Net verdwenen: $universe';
  }

  @override
  String dashboardAlertNewSacnUniverse(int universe) {
    return 'Nieuw universum sACN: $universe';
  }

  @override
  String dashboardAlertLostSacnUniverse(int universe) {
    return 'Universum sACN verdwenen: $universe';
  }

  @override
  String dashboardAlertNewNdiSource(Object name) {
    return 'Nieuwe bron NDI: $name';
  }

  @override
  String dashboardAlertLostNdiSource(Object name) {
    return 'Bron NDI verdwenen: $name';
  }

  @override
  String dashboardAlertArtnetLowFps(int universe, Object fps) {
    return 'Art-Net U$universe: Lage FPS ($fps)';
  }

  @override
  String dashboardAlertSacnLowFps(int universe, Object fps) {
    return 'sACN U$universe: Lage FPS ($fps)';
  }

  @override
  String dashboardAlertSacnDuplicate(int universe, int count) {
    return 'sACN U$universe: $count actieve bronnen';
  }

  @override
  String dashboardAlertSacnPriority(int universe) {
    return 'sACN U$universe: prioriteitsconflict';
  }

  @override
  String dashboardScanProgress(int progress) {
    return 'Netwerkscan: $progress%';
  }

  @override
  String get luminexPageTitle => 'Luminex Monitor';

  @override
  String get luminexMonitorCardTitle => 'Luminex Monitor';

  @override
  String get luminexMonitorCardSubtitle => 'Bewakingsschakelaars GigaCore';

  @override
  String get luminexAddDevice => 'Voeg apparatuur toe';

  @override
  String get luminexAddDeviceTitle => 'IP-adres van de switch';

  @override
  String get luminexAddDeviceHint => '192.168.xx';

  @override
  String get luminexAddDeviceConfirm => 'Toevoegen';

  @override
  String get luminexAddDeviceCancel => 'Annuleren';

  @override
  String get luminexNoDevices => 'Geen schakelaar Luminex';

  @override
  String get luminexNoDevicesHint =>
      'Voeg handmatig een IP toe of voer een netwerkscan uit.';

  @override
  String get luminexRefreshAll => 'Vernieuw alles';

  @override
  String get luminexRemoveDevice => 'Terugtrekken';

  @override
  String get luminexScanForDevices => 'Zoek het netwerk';

  @override
  String get luminexReachable => 'Toegankelijk';

  @override
  String get luminexUnreachable => 'Ontoegankelijk';

  @override
  String get luminexPolling => 'Vraag…';

  @override
  String get luminexNoAlarms => 'Geen wekker';

  @override
  String get luminexSectionSystem => 'Systeeminformatie';

  @override
  String get luminexSectionPorts => 'Poorten';

  @override
  String get luminexSectionAlarms => 'Actieve alarmen';

  @override
  String get luminexLabelName => 'Naam';

  @override
  String get luminexLabelModel => 'Model';

  @override
  String get luminexLabelFirmware => 'Firmware';

  @override
  String get luminexLabelUptime => 'Uptime';

  @override
  String get luminexLabelTemperature => 'Temperatuur';

  @override
  String get luminexLabelPsu => 'Voedsel';

  @override
  String get luminexPsuOk => 'Oké';

  @override
  String get luminexPsuAbsent => 'Afwezig';

  @override
  String get luminexLabelApi => 'API';

  @override
  String get luminexGen1 => 'Gen 1 (tekst)';

  @override
  String get luminexGen2 => 'Gen 2 (JSON)';

  @override
  String get luminexGenUnknown => 'Onbekend';

  @override
  String get luminexPortUp => 'Actief';

  @override
  String get luminexPortDown => 'Inactief';

  @override
  String get luminexPortUnknown => 'Onbekend';

  @override
  String get luminexPortPoeActive => 'PoE actief';

  @override
  String get luminexPortPoeFault => 'PoE standaard';

  @override
  String get luminexPortPoeOff => 'PoE inactief';

  @override
  String get luminexPortNoPoe => 'Zonder PoE';

  @override
  String get luminexDetectedScan => 'Netwerkscan';

  @override
  String get luminexDetectedManual => 'Handmatige toevoeging';

  @override
  String get luminexNotAvailable => 'N.v.t';

  @override
  String get luminexAlarmInaccessible => 'Schakelaar onbereikbaar';

  @override
  String get luminexAlarmPsuAbsent => 'Geen stroomvoorziening';

  @override
  String luminexAlarmCount(int count) {
    return '$count actieve alarm(en)';
  }

  @override
  String luminexPortSpeed(int speed) {
    return '$speed Mbps';
  }

  @override
  String luminexPortRxErrors(int count) {
    return 'RX: $count fout.';
  }

  @override
  String luminexPortTxErrors(int count) {
    return 'TX: $count fout.';
  }

  @override
  String luminexAlarmPortDown(int port) {
    return 'Poort $port offline';
  }

  @override
  String luminexAlarmSpeedDegraded(int port, int speed) {
    return 'Poort $port: verminderde snelheid ($speed Mb/s)';
  }

  @override
  String luminexAlarmHighRxErrors(int port, int count) {
    return 'Poort $port: Hoge RX-fouten ($count)';
  }

  @override
  String luminexAlarmHighTxErrors(int port, int count) {
    return 'Poort $port: hoge TX-fouten ($count)';
  }

  @override
  String luminexAlarmPoeFault(int port) {
    return 'Poort $port: standaard PoE';
  }

  @override
  String luminexAlarmHighTemp(Object temp) {
    return 'Hoge temperatuur: $temp°C';
  }

  @override
  String get manetPageTitle => 'MA-Net Monitor';

  @override
  String get manetMonitorCardTitle => 'MA-Net Monitor';

  @override
  String get manetMonitorCardSubtitle => 'Knooppuntdetectie grandMA2/3';

  @override
  String get manetNoNodes => 'Geen MA-Net knooppunten gedetecteerd';

  @override
  String get manetListening => 'Bezig met luisteren...';

  @override
  String get manetNodeType => 'Vriendelijk';

  @override
  String get manetFirmware => 'Firmware';

  @override
  String get manetMac => 'MAC-adres';

  @override
  String get manetLastSeen => 'Gezien is er';

  @override
  String get manetProtocol => 'MA-Net';

  @override
  String get manetProtocolMaNet2 => 'MA-Net2';

  @override
  String get manetProtocolMaNet3 => 'MA-Net3';

  @override
  String get manetEmptyHint =>
      'Zorg ervoor dat u zich op hetzelfde netwerk bevindt als de MA Lighting-apparatuur';

  @override
  String manetNodeCount(int count) {
    return '$count knooppunt(en) online';
  }

  @override
  String manetPortListening(int port) {
    return 'UDP:$port';
  }

  @override
  String get helpPageTitle => 'Gids voor netwerkhulpmiddelen';

  @override
  String get helpIntro =>
      'Alle tools werken alleen-lezen op uw lokale netwerk. Tik op een hulpmiddel om de details te bekijken.';

  @override
  String get helpSectionDoes => 'Wat het doet';

  @override
  String get helpSectionDelay => 'Tijdslimiet';

  @override
  String get helpSectionLimits => 'Wat het niet doet';

  @override
  String get helpSectionTip => 'Advies';

  @override
  String get helpGeneralTitle => 'Algemeen advies';

  @override
  String get helpGeneralSubnet =>
      'Alle tools werken op het lokale /24-subnet. Apparatuur op een ander VLAN of achter een router wordt niet gedetecteerd.';

  @override
  String get helpGeneralFirewall =>
      'Softwarefirewalls kunnen sommige tests blokkeren. Controleer de filterregels als er apparatuur ontbreekt.';

  @override
  String get helpGeneralWifi =>
      'WiFi-netwerken met detectie van clientisolatieblokken. Geef de voorkeur aan een bekabelde verbinding of WiFi in bridge-modus.';

  @override
  String get helpToolScanDoes =>
      'Scant parallel het /24-subnet en identificeert actieve apparaten. Toont huidige IP, hostnaam, fabrikant (via OUI MAC) en open poorten.';

  @override
  String get helpToolScanDelay =>
      '15 tot 30 seconden, afhankelijk van de netwerkgrootte. 50 gelijktijdige sondes.';

  @override
  String get helpToolScanLimits =>
      'Crosst geen VLAN\'s of routers. Voert geen volledige poortscan of WAN-scan uit.';

  @override
  String get helpToolScanTip =>
      'Als er geen apparaten verschijnen, controleer dan of uw firewall binnenkomende TCP/ICMP-tests niet blokkeert.';

  @override
  String get helpToolDashboardDoes =>
      'Geeft de status van gedetecteerde apparatuur in realtime weer: beschikbaarheid, latentie, actieve netwerkwaarschuwingen.';

  @override
  String get helpToolDashboardDelay =>
      'Elke 30 seconden bijgewerkt. Eerste onmiddellijke belasting na het scannen.';

  @override
  String get helpToolDashboardLimits =>
      'Bewaart geen geschiedenis tussen sessies. Vereist een voorafgaande scan om de apparatuurlijst in te vullen.';

  @override
  String get helpToolDashboardTip =>
      'Voer een netwerkscan uit voordat u het dashboard opent om alle beschikbare apparatuur te zien.';

  @override
  String get helpToolArtNetDoes =>
      'Luistert passief naar Art-Net (UDP 6454)-pakketten en geeft actieve DMX-universes weer met hun realtime waarden.';

  @override
  String get helpToolArtNetDelay =>
      'Realtime: gegevens verschijnen in minder dan een seconde na ontvangst van het pakket.';

  @override
  String get helpToolArtNetLimits =>
      'Geen DMX-uitvoer. Configureert geen Art-Net knooppunten en beheert het RDM-protocol niet.';

  @override
  String get helpToolArtNetTip =>
      'Art-Net doorkruist geen routers. Alle apparatuur moet zich op hetzelfde L2-netwerk bevinden (dezelfde switch of hetzelfde segment).';

  @override
  String get helpToolSacnDoes =>
      'Luistert naar sACN/E1.31 (UDP 5568) multicaststreams en geeft actieve universums, bronprioriteiten en DMX waarden weer.';

  @override
  String get helpToolSacnDelay => 'Realtime — latentie minder dan één seconde.';

  @override
  String get helpToolSacnLimits =>
      'Geen DMX-uitvoer. Wijzigt de prioriteiten of configuratie van sACN bronnen niet.';

  @override
  String get helpToolSacnTip =>
      'Voor sACN multicast is een beheerde switch vereist waarin IGMP-snooping is ingeschakeld om uitzendstormen op het netwerk te voorkomen.';

  @override
  String get helpToolNdiDoes =>
      'Ontdekt NDI videobronnen op het LAN via het NDI detectieprotocol. Toont de naam, het IP-adres en het type van elke bron.';

  @override
  String get helpToolNdiDelay =>
      'Bronnen verschijnen tussen 5 en 15 seconden na verbinding met het netwerk.';

  @override
  String get helpToolNdiLimits =>
      'Geen video afspelen of NDI routering. Detecteert geen NDI|HX-bronnen zonder actieve mDNS-detectie.';

  @override
  String get helpToolNdiTip =>
      'NDI vereist minimaal 100 Mb/s per stream. Vermijd wifi voor productie; geef de voorkeur aan een bekabelde Gigabit-verbinding.';

  @override
  String get helpToolDiagDoes =>
      'Voert een reeks netwerkgezondheidstests uit: connectiviteit, DNS-resolutie, latentie, pakketverlies en beschikbaarheid van services.';

  @override
  String get helpToolDiagDelay => 'Volledige diagnose in 20 tot 30 seconden.';

  @override
  String get helpToolDiagLimits =>
      'Alleen diagnostiek: geen automatische reparaties, geen configuratiewijzigingen.';

  @override
  String get helpToolDiagTip =>
      'Voer een diagnose uit voor en na een netwerkinterventie om de status te vergelijken en snel regressies te isoleren.';

  @override
  String get helpToolSnapshotDoes =>
      'Legt de toestand van het netwerk op een bepaald moment vast (apparatuur, diensten) en stelt u in staat twee snapshots te vergelijken om veranderingen te identificeren.';

  @override
  String get helpToolSnapshotDelay =>
      'Vastleggen in 30 tot 45 seconden, afhankelijk van de netwerkgrootte.';

  @override
  String get helpToolSnapshotLimits =>
      'Geen continue monitoring of automatische waarschuwingen. De geschiedenis wordt alleen op dit apparaat bewaard.';

  @override
  String get helpToolSnapshotTip =>
      'Ideaal voor het documenteren van de toestand voor/na een infrastructuurwijziging of voor het isoleren van een regressie tijdens het oplossen van problemen.';

  @override
  String get helpToolLuminexDoes =>
      'Query\'s GigaCore Luminex schakelen via hun HTTP API. Toont de poortstatus (link, snelheid, PoE, fouten), temperatuur, voedingen en activeert alarmen.';

  @override
  String get helpToolLuminexDelay =>
      'Poll elke 30 seconden. Automatische detectie op het subnet: 15 tot 30 seconden.';

  @override
  String get helpToolLuminexLimits =>
      'Alleen lezen. Geen wijzigingen in VLAN-, groeps- of poortconfiguratie. Ondersteunt geen MA-Net- of NDI-video.';

  @override
  String get helpToolLuminexTip =>
      'Standaardverificatie: admin / leeg wachtwoord. Gen2s tonen /api/v1/, Gen1s reageren op /stat/ports in platte tekst.';

  @override
  String get helpToolManetDoes =>
      'Luistert passief naar UDP-poort 6549 en detecteert grandMA2/3 consoles en knooppunten die zichzelf aankondigen op het netwerk. Toont naam, apparaattype, firmwareversie en MAC-adres.';

  @override
  String get helpToolManetDelay =>
      'De apparaten verschijnen zodra hun volgende netwerkuitzending plaatsvindt, doorgaans binnen 10 seconden.';

  @override
  String get helpToolManetLimits =>
      'Alleen lezen. Geen showgegevens, geen DMX-waarde, geen configuratie. Crosst geen VLAN\'s.';

  @override
  String get helpToolManetTip =>
      'Als er geen apparaat verschijnt: controleer of de grandMA-zender zich op het LAN bevindt en of UDP-poort 6549 niet wordt geblokkeerd door een firewall.';

  @override
  String get bwCardTitle => 'Bandbreedte';

  @override
  String get bwCardSubtitle => 'Broadcast + SNMP-switch';

  @override
  String get bwHubTitle => 'Bandbreedte';

  @override
  String get bwHubSubtitle =>
      'Optie 1 — alleen broadcast-verkeer (geen apparatuur nodig). Optie 2 — echte bandbreedte per poort via SNMP (beheerde switch vereist).';

  @override
  String get bwHubTagFree => 'GRATIS';

  @override
  String get bwHubCardBroadcastTitle => 'Netwerk-broadcast';

  @override
  String get bwHubCardBroadcastSubtitle => 'Art-Net · sACN · MA-Net';

  @override
  String get bwHubCardBroadcastLimit =>
      'Unicast-verkeer niet zichtbaar (NDI, Dante…)';

  @override
  String get bwHubCardSnmpTitle => 'Switch-poorten';

  @override
  String get bwHubCardSnmpSubtitle => 'Per-poort weergave, al het verkeer';

  @override
  String get bwHubCardSnmpRequires => 'SNMP-beheerde switch vereist';

  @override
  String get bwBroadcastPageTitle => 'Netwerk-broadcast';

  @override
  String get bwBroadcastWarning =>
      'Alleen broadcast en multicast. Unicast-verkeer (NDI, Dante…) is niet zichtbaar vanaf dit apparaat.';

  @override
  String get bwBroadcastListening => 'Luisteren';

  @override
  String get bwBroadcastTotal => 'Totaal';

  @override
  String get bwSnmpPageTitle => 'Switch-poorten';

  @override
  String get bwSnmpConfigTitle => 'SNMP-verbinding';

  @override
  String get bwSnmpHost => 'Switch-IP';

  @override
  String get bwSnmpHostHint => '192.168.1.1';

  @override
  String get bwSnmpCommunity => 'Community';

  @override
  String get bwSnmpCommunityHint => 'public';

  @override
  String get bwSnmpConnect => 'Verbinden';

  @override
  String get bwSnmpDisconnect => 'Verbreken';

  @override
  String get bwSnmpConnecting => 'Verbinding maken…';

  @override
  String get bwSnmpError => 'SNMP-fout';

  @override
  String get bwSnmpReqTitle => 'Vereisten';

  @override
  String get bwSnmpReq1 => 'Beheerde switch met SNMP v2c ingeschakeld';

  @override
  String get bwSnmpReq2 =>
      'Community-string (standaard: \"public\" op Luminex GigaCore)';

  @override
  String get bwSnmpReq3 => 'Switch-IP toegankelijk vanaf dit apparaat';

  @override
  String get bwSnmpPortUp => 'Actief';

  @override
  String get bwSnmpPortDown => 'Inactief';

  @override
  String get bwSnmpNoData => 'Wachten op gegevens…';

  @override
  String bwSnmpPortCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'en',
      one: '',
    );
    return '$count poort$_temp0';
  }

  @override
  String get bwUnitKbps => 'kbps';

  @override
  String get bwUnitMbps => 'Mbps';

  @override
  String get bwUnitPkts => 'pak./s';

  @override
  String get bwLabelIn => '↓ In';

  @override
  String get bwLabelOut => '↑ Uit';

  @override
  String get conversionsVolumesTitle => 'Volumes';

  @override
  String get volumeCalcCardTitle => 'Volume — kubus, cilinder, bol…';

  @override
  String get volumeCalcUnitLabel => 'Eenheid van de afmetingen';

  @override
  String get volumeCalcPlaceholder =>
      'Vul de afmetingen in om het volume te zien ✨';

  @override
  String get volumeShapeCube => 'Kubus';

  @override
  String get volumeShapeBox => 'Rechthoekig blok';

  @override
  String get volumeShapeCylinder => 'Cilinder';

  @override
  String get volumeShapeSphere => 'Bol';

  @override
  String get volumeShapeCone => 'Kegel';

  @override
  String get volumeShapeSquarePyramid => 'Piramide (vierkante basis)';

  @override
  String get volumeFieldSide => 'Zijde';

  @override
  String get volumeFieldLength => 'Lengte';

  @override
  String get volumeFieldWidth => 'Breedte';

  @override
  String get volumeFieldHeight => 'Hoogte';

  @override
  String get volumeFieldRadius => 'Straal';

  @override
  String get volumeFieldRadiusBase => 'Straal (basis)';

  @override
  String get volumeFieldSideBase => 'Zijde (basis)';

  @override
  String get aboutVesaTitle => 'VESA-beugels & schermformaten';

  @override
  String get aboutVesaSubtitle =>
      'VESA-normen, standaardzoeker en diagonaalberekening';

  @override
  String get vesaIntroTitle => 'VESA & schermen in één oogopslag';

  @override
  String get vesaIntroBody =>
      'VESA (Video Electronics Standards Association) standaardiseert de gatafstand van de bevestigingsgaten aan de achterkant van schermen, tv\'s en monitoren. Hoe groter en zwaarder het scherm, hoe groter de gatafstand. Controleer altijd het gewicht en het VESA-patroon dat de fabrikant opgeeft voordat je een beugel kiest — deze pagina geeft richtwaarden, geen gegarandeerde waarden.';

  @override
  String get vesaTableTitle => 'Gangbare VESA-standaarden';

  @override
  String get vesaColEntraxe => 'Gatafstand';

  @override
  String get vesaColScreenSize => 'Schermformaat';

  @override
  String get vesaColMaxWeight => 'Max. gewicht';

  @override
  String get vesaTableFooterNote =>
      'Indicatieve bereiken: een fabrikant kan voor een bepaald scherm best een breder VESA-patroon dan gemiddeld aanbieden, vooral bij professionele schermen en LED-walls. Controleer altijd het datasheet.';

  @override
  String get vesaLargeFormat => 'Grote formaten / LED-walls';

  @override
  String get vesaFinderTitle => 'Welk VESA-patroon heb ik gemeten?';

  @override
  String get vesaFinderHint =>
      'Meet de afstand tussen twee gaten (horizontaal en verticaal) aan de achterkant van het scherm, in millimeter.';

  @override
  String get vesaFieldHorizontal => 'Horizontale afstand (mm)';

  @override
  String get vesaFieldVertical => 'Verticale afstand (mm)';

  @override
  String get vesaFinderPlaceholder =>
      'Vul beide afstanden in om de standaard te herkennen.';

  @override
  String vesaFinderExactMatch(Object pattern) {
    return 'VESA-standaard $pattern 🎯';
  }

  @override
  String vesaFinderNearestMatch(Object pattern, Object delta) {
    return 'Geen exacte match — het dichtst in de buurt is $pattern (gecombineerd verschil van $delta mm). Controleer je meting.';
  }

  @override
  String get vesaScreenCalcTitle =>
      'Schermafmetingen op basis van de diagonaal';

  @override
  String get vesaFieldDiagonal => 'Diagonaal (inch)';

  @override
  String get vesaScreenCalcPlaceholder => 'Geef een diagonaal in inch op.';

  @override
  String get vesaResultDiagonal => 'Diagonaal';

  @override
  String get vesaResultWidth => 'Breedte';

  @override
  String get vesaResultHeight => 'Hoogte';

  @override
  String get vesaResultArea => 'Oppervlakte';

  @override
  String get vesaTipsTitle => 'Montagetips';

  @override
  String get vesaTip1 =>
      'Gebruik altijd alle 4 (of meer) meegeleverde schroeven — nooit slechts 2 diagonaal.';

  @override
  String get vesaTip2 =>
      'Houd het opgegeven aanhaalmoment aan: te strak aandraaien kan de behuizing doen barsten.';

  @override
  String get vesaTip3 =>
      'Bij een montage in de hoogte of op een truss, voorzie een sling of een secundaire beveiliging die onafhankelijk is van de VESA-beugel.';

  @override
  String get vesaTip4 =>
      'Bij dynamische belasting (beweging, trillingen, transport), verlaag de toelaatbare last ten opzichte van de statische belasting van de fabrikant.';

  @override
  String get vesaTip5 =>
      'Controleer de schroeflengte: te lange schroeven kunnen de interne elektronica van het scherm beschadigen.';

  @override
  String get vesaTip6 =>
      'Een VESA-adapter (75→100, 100→200…) moet worden vermeld op het lastenblad — hij voegt gewicht en een hefboomarm toe.';

  @override
  String get cctFilterTitle => 'Filter ↔ Kleurtemperatuur (K)';

  @override
  String get cctFilterTileDescription =>
      'Welke CTO/CTB kiezen tussen twee temperaturen, in elke richting';

  @override
  String get cctFilterIntro =>
      'Vind meteen het CTO/CTB-filter dat je nodig hebt, of controleer het resultaat van een filter dat je al hebt — in elke richting ✨';

  @override
  String get cctModeFindFilter => 'Welk filter?';

  @override
  String get cctModeSourcePlusFilter => 'K + filter → K?';

  @override
  String get cctModeTargetPlusFilter => 'Doel-K + filter → start-K?';

  @override
  String get cctFieldSourceK => 'Starttemperatuur (K)';

  @override
  String get cctFieldTargetK => 'Gewenste temperatuur (K)';

  @override
  String get cctFieldTargetKFinal => 'Gewenste eindtemperatuur (K)';

  @override
  String get cctFieldFilter => 'Filter';

  @override
  String get cctDescEighthCtb => 'Koelt zeer licht af';

  @override
  String get cctDescQuarterCtb => 'Koelt licht af';

  @override
  String get cctDescHalfCtb => 'Koelt matig af';

  @override
  String get cctDescThreeQuarterCtb => 'Koelt sterk af';

  @override
  String get cctDescFullCtb => 'Wolfraam → daglicht';

  @override
  String get cctDescEighthCto => 'Verwarmt zeer licht';

  @override
  String get cctDescQuarterCto => 'Verwarmt licht';

  @override
  String get cctDescHalfCto => 'Verwarmt matig';

  @override
  String get cctDescThreeQuarterCto => 'Verwarmt sterk';

  @override
  String get cctDescFullCto => 'Daglicht → wolfraam';

  @override
  String get cctFindFilterPlaceholder =>
      'Vul beide temperaturen in om het juiste filter te vinden.';

  @override
  String get cctRequiredShiftLabel => 'Vereiste verschuiving';

  @override
  String get cctMiredShiftLabel => 'Mired shift';

  @override
  String cctBestChoice(Object name, Object k) {
    return 'Beste keuze: $name → ≈ $k K';
  }

  @override
  String cctApproxKelvin(Object k) {
    return '≈ $k K';
  }

  @override
  String get cctOtherFiltersNearby => 'Andere filters in de buurt';

  @override
  String get cctDisclaimer =>
      'Standaard mired-verschuivingswaarden, bij benadering — raadpleeg voor kritisch gebruik het datasheet van de fabrikant.';

  @override
  String get cctSourcePlaceholder => 'Vul de starttemperatuur in.';

  @override
  String get cctTargetPlaceholder => 'Vul de gewenste eindtemperatuur in.';

  @override
  String get cctOutOfRange =>
      'Combinatie buiten bereik (niet-fysisch resultaat) — probeer een andere temperatuur of een ander filter.';

  @override
  String get cctResultObtainedTemp => 'Verkregen temperatuur';

  @override
  String get cctResultAppliedFilter => 'Toegepast filter';

  @override
  String get cctResultRequiredSource => 'Vereiste bron';

  @override
  String get cctResultFilterToApply => 'Toe te passen filter';

  @override
  String get cctBrandLabel => 'Filtermerk';

  @override
  String get cctAllBrands => 'Alle merken';

  @override
  String get timecodeHubTitle => 'Timecode';

  @override
  String get timecodeToolConverterLabel => 'Framerate-\nconverter';

  @override
  String get timecodeToolMathLabel => 'Duur &\nverschuiving';

  @override
  String get timecodeToolDelayLabel => 'Frame ↔ ms';

  @override
  String get timecodeToolCountdownLabel => 'Aftellen';

  @override
  String get timecodeBadgeFree => 'GRATIS';

  @override
  String get timecodeBadgeNew => 'NIEUW';

  @override
  String get timecodeConverterTitle => 'Framerate-converter';

  @override
  String get timecodeConverterSourceCardTitle => 'Bron-timecode';

  @override
  String get timecodeConverterFieldLabel => 'HH:MM:SS:FF';

  @override
  String get timecodeConverterFieldHint => '01:00:00:00';

  @override
  String get timecodeConverterSourceRateLabel => 'Bron-framerate';

  @override
  String get timecodeConverterSwapTooltip => 'Bron/doel wisselen';

  @override
  String get timecodeConverterTargetCardTitle => 'Doel-framerate';

  @override
  String get timecodeConverterTargetRateLabel => 'Doel-framerate';

  @override
  String get timecodeConverterButton => 'Converteren';

  @override
  String timecodeConverterErrorInvalid(String rateLabel, int frameBase) {
    return '❌ Ongeldige timecode voor $rateLabel (verwacht: HH:MM:SS:FF, FF < $frameBase).';
  }

  @override
  String timecodeConverterResult(String rateLabel, String tc, String seconds) {
    return 'TC in $rateLabel:\n$tc\n\n(≈ $seconds s verstreken sinds 00:00:00:00)';
  }

  @override
  String get timecodeMathTitle => 'Duur & verschuiving';

  @override
  String get timecodeMathModeDuration => 'Duur tussen 2 TC';

  @override
  String get timecodeMathModeOffset => 'TC verschuiven';

  @override
  String get timecodeMathRateCardTitle => 'Framerate';

  @override
  String get timecodeMathDurationCardTitle => 'Timecode In / Out';

  @override
  String get timecodeMathTcInLabel => 'TC In (HH:MM:SS:FF)';

  @override
  String get timecodeMathTcOutLabel => 'TC Out (HH:MM:SS:FF)';

  @override
  String get timecodeMathComputeDurationButton => 'Duur berekenen';

  @override
  String timecodeMathErrorDuration(int frameBase) {
    return '❌ Controleer beide timecodes (HH:MM:SS:FF, FF < $frameBase).';
  }

  @override
  String timecodeMathDurationResult(
      String duration, int frames, String rateLabel) {
    return 'Duur: $duration\n($frames frame(s) bij $rateLabel)';
  }

  @override
  String get timecodeMathOffsetCardTitle => 'Starttimecode + verschuiving';

  @override
  String get timecodeMathBaseTcLabel => 'Start-TC (HH:MM:SS:FF)';

  @override
  String get timecodeMathAddLabel => '+ Optellen';

  @override
  String get timecodeMathSubtractLabel => '− Aftrekken';

  @override
  String get timecodeMathOffsetLabel => 'Verschuiving — duur (HH:MM:SS:FF)';

  @override
  String get timecodeMathComputeOffsetButton => 'Nieuwe TC berekenen';

  @override
  String timecodeMathErrorOffset(int frameBase) {
    return '❌ Controleer de starttimecode en de verschuiving (HH:MM:SS:FF, FF < $frameBase).';
  }

  @override
  String timecodeMathOffsetResult(String tc) {
    return 'Nieuwe timecode:\n$tc';
  }

  @override
  String get timecodeDelayTitle => 'Frame ↔ ms';

  @override
  String get timecodeDelayCardTitle => 'Video-/audiovertraging';

  @override
  String get timecodeDelayIntro =>
      'Handig om een lipsync-verschil of een video-/LED-processorvertraging te corrigeren: voer een waarde in, kies de eenheid en krijg het equivalent.';

  @override
  String get timecodeDelayRateLabel => 'Framerate';

  @override
  String get timecodeDelayUnitFrames => 'Frames';

  @override
  String get timecodeDelayUnitMs => 'Milliseconden';

  @override
  String get timecodeDelayValueLabelFrames => 'Aantal frames';

  @override
  String get timecodeDelayValueLabelMs => 'Milliseconden';

  @override
  String get timecodeDelayButton => 'Converteren';

  @override
  String get timecodeDelayErrorInvalid => '❌ Ongeldige waarde.';

  @override
  String timecodeDelayResultFromFrames(
      int frames, String rateLabel, String ms, String duration) {
    return '$frames frame(s) bij $rateLabel\n= $ms ms\n= $duration';
  }

  @override
  String timecodeDelayResultFromMs(
      String ms, String rateLabel, int frames, String duration) {
    return '$ms ms bij $rateLabel\n= $frames frame(s)\n= $duration';
  }

  @override
  String get timecodeCountdownTitle => 'Aftellen';

  @override
  String get timecodeCountdownSettingsCardTitle => 'Instellingen';

  @override
  String get timecodeCountdownRateLabel => 'Framerate';

  @override
  String get timecodeCountdownCurrentTcLabel => 'Huidige TC (HH:MM:SS:FF)';

  @override
  String get timecodeCountdownFillNowTooltip =>
      'Vullen met de tijd van de telefoon';

  @override
  String get timecodeCountdownTargetTcLabel => 'Doel-TC (HH:MM:SS:FF)';

  @override
  String get timecodeCountdownStartButton => 'Starten';

  @override
  String get timecodeCountdownStopButton => 'Stoppen';

  @override
  String timecodeCountdownErrorInvalid(int frameBase) {
    return '❌ Controleer beide timecodes (HH:MM:SS:FF, FF < $frameBase).';
  }

  @override
  String get timecodeCountdownLiveCardTitle => 'Live';

  @override
  String timecodeCountdownLiveText(String tc, String remaining) {
    return 'Huidige TC (geschat): $tc\nResterende tijd: $remaining';
  }

  @override
  String timecodeCountdownOverdue(String duration) {
    return '−$duration (TC overschreden)';
  }

  @override
  String get homeTimecodeTitle => 'Timecode';

  @override
  String get homeTimecodeSubtitle =>
      'Framerate, duur, verschuiving, vertraging';

  @override
  String get vconsoleTitle => 'Virtuele Console';

  @override
  String get vconsoleTileDescription =>
      'Verstuurt Art-Net/sACN via wifi om je apparatuur te testen';

  @override
  String get vconsoleSectionConnection => 'Netwerkverbinding';

  @override
  String get vconsoleUniverseLabel => 'Startuniversum';

  @override
  String get vconsoleUniverseCountLabel => 'Aantal universums';

  @override
  String get rdmPageTitle => 'RDM';

  @override
  String get rdmScanButton => 'Netwerk scannen';

  @override
  String get rdmScanningStatus => 'RDM-fixtures zoeken…';

  @override
  String get rdmEmptyState => 'Geen RDM-fixtures gevonden. Start een scan.';

  @override
  String rdmDeviceCountLabel(Object count) {
    return '$count fixture(s) gevonden';
  }

  @override
  String get rdmUidLabel => 'UID';

  @override
  String get rdmManufacturerLabel => 'Fabrikant';

  @override
  String get rdmStartAddressLabel => 'DMX-adres';

  @override
  String get rdmFootprintLabel => 'Kanalen';

  @override
  String get rdmPersonalityLabel => 'Personality (modus)';

  @override
  String get rdmSoftwareVersionLabel => 'Softwareversie';

  @override
  String get rdmIdentifyButton => 'Identificeren';

  @override
  String get rdmEditTitle => 'Fixture bewerken';

  @override
  String rdmConfirmSetStartAddress(Object uid, Object value) {
    return 'DMX-adres van $uid wijzigen naar $value?';
  }

  @override
  String rdmConfirmSetPersonality(Object uid, Object value) {
    return 'Modus van $uid wijzigen naar $value?';
  }

  @override
  String rdmConfirmSetLabel(Object uid, Object value) {
    return '$uid hernoemen naar \"$value\"?';
  }

  @override
  String get rdmConfirmButton => 'Bevestigen';

  @override
  String get rdmCancelButton => 'Annuleren';

  @override
  String get rdmSetSuccess => 'Succesvol gewijzigd';

  @override
  String get rdmSetFailed => 'Wijzigen mislukt';

  @override
  String get rdmNoResponse => 'Geen reactie van de fixture';

  @override
  String get rdmRefreshTooltip => 'Vernieuwen';

  @override
  String get rdmWriteWarning =>
      'Een fixture live wijzigen kan een lopende show verstoren. Gebruik met zorg.';

  @override
  String get vconsoleTargetBroadcast => 'Broadcast (auto)';

  @override
  String get vconsoleTargetUnicast => 'Specifiek IP';

  @override
  String get vconsoleManualIpLabel => 'IP van de node (bijv. 192.168.1.50)';

  @override
  String get vconsoleStop => 'Verzenden stoppen';

  @override
  String get vconsoleStart => 'Verzenden starten';

  @override
  String get vconsoleBlackout => 'Blackout';

  @override
  String vconsoleStatusLive(Object fps) {
    return 'Live • $fps fps';
  }

  @override
  String get vconsoleStatusStopped => 'Gestopt';

  @override
  String vconsoleUniversePill(Object universe) {
    return 'Universum $universe';
  }

  @override
  String vconsoleTargetPill(Object target) {
    return '→ $target';
  }

  @override
  String vconsoleErrorLabel(Object message) {
    return 'Fout: $message';
  }

  @override
  String vconsoleStartFailed(Object message) {
    return 'Kan niet starten: $message';
  }

  @override
  String get vconsoleTabFaders => 'Eenvoudige faders';

  @override
  String get vconsoleTabGdtf => 'GDTF';

  @override
  String get vconsoleTabPatch => 'Mijn Patch';

  @override
  String get vconsoleChannelCountLabel => 'Aantal kanalen';

  @override
  String get vconsoleAllZero => 'Alles op 0';

  @override
  String get vconsoleAllFull => 'Alles op 255';

  @override
  String get vconsoleSearchTitle => 'Zoeken op GDTF Share';

  @override
  String get vconsoleSearchHint => 'Bijv. MAC Viper, Spiider...';

  @override
  String get vconsoleImportLocal => 'Een .gdtf-bestand importeren';

  @override
  String vconsoleModeDialogTitleFor(Object fixture) {
    return 'DMX-modus — $fixture';
  }

  @override
  String vconsoleModeDialogOption(Object mode, Object count) {
    return '$mode ($count ch)';
  }

  @override
  String get vconsoleModeDialogTitleGeneric => 'DMX-modus';

  @override
  String get vconsoleNoModeFound =>
      'Geen DMX-modus gevonden in dit .gdtf-bestand';

  @override
  String vconsolePickFailed(Object message) {
    return 'Selecteren mislukt: $message';
  }

  @override
  String vconsoleDownloadFailed(Object code) {
    return 'Downloaden mislukt ($code)';
  }

  @override
  String vconsoleSearchResultSubtitle(Object count, Object size) {
    return '$count modus(sen) • $size';
  }

  @override
  String get vconsoleChooseFixtureHint =>
      'Kies een fixture om de faders te tonen.';

  @override
  String get vconsolePatchSectionTitle => 'Mijn Patch (MVR-import)';

  @override
  String get vconsolePatchEmpty =>
      'Nog geen gepatchte fixtures. Importeer een MVR-bestand via de Patch-tool om ze hier te zien.';

  @override
  String vconsolePatchEntrySubtitle(
      Object universe, Object start, Object end, Object count) {
    return 'Universum $universe • $start-$end • $count ch';
  }

  @override
  String get vconsoleChoosePatchedFixtureHint =>
      'Kies een gepatchte fixture om de faders te tonen.';

  @override
  String get vconsoleStartAddressLabel => 'Startadres';

  @override
  String get vconsoleFixtureFallbackTitle => 'Fixture';

  @override
  String vconsoleUniverseArrow(Object universe) {
    return '→ universum $universe';
  }

  @override
  String vconsoleSearchError(Object code) {
    return 'Fout $code';
  }

  @override
  String vconsoleNetworkError(Object message) {
    return 'Netwerkfout: $message';
  }

  @override
  String vconsoleChannelShortLabel(Object n) {
    return 'Ch $n';
  }

  @override
  String get vconsoleContinueToSource => 'Bron kiezen';

  @override
  String get vconsoleContinueToSourceHint =>
      'Eenvoudige faders, GDTF-fixture of een al gepatchte machine (MVR).';

  @override
  String get vconsoleControlGroupTooltip => 'Hele groep bedienen';

  @override
  String vconsoleGroupInfo(Object count, Object universe) {
    return '$count machine(s) • universum $universe';
  }

  @override
  String vconsoleGroupInfoWithExcluded(
      Object count, Object universe, Object excluded) {
    return '$count machine(s) • universum $universe • $excluded buiten groep (ander universum)';
  }

  @override
  String vconsoleGroupSubtitle(Object count, Object universes) {
    return '$count machines • universum $universes';
  }

  @override
  String get vconsoleOpenFaders => 'Console openen';

  @override
  String vconsolePresetsTitleFor(Object channel) {
    return 'Presets — $channel';
  }

  @override
  String get vconsolePresetsTooltip => 'Presets';

  @override
  String get vconsoleSourceStepTitle => 'Bron kiezen';

  @override
  String get vconsoleUnit8Bit => '8-bit';

  @override
  String get vconsoleUnitPercent => '%';

  @override
  String get vconsoleHomeTooltip =>
      'Home-positie (dimmer 100%, pan/tilt gecentreerd, shutter open)';

  @override
  String get vconsoleHomeButton => 'Home';

  @override
  String get filterCorrespondenceTitle => 'Filtercorrespondentie';

  @override
  String get filterCorrespondenceSearchHint => 'Zoeken (nummer of naam)…';

  @override
  String get filterCorrespondenceColLeeName => 'Lee / Naam';

  @override
  String get filterCorrespondenceEmpty => 'Geen overeenkomst';

  @override
  String filterCorrespondenceResultsCount(Object count) {
    return '$count overeenkomst(en)';
  }

  @override
  String filterCorrespondenceFilteredOf(Object total) {
    return ' (gefilterd op $total)';
  }

  @override
  String get lbResetDialogTitle => 'Alles resetten?';

  @override
  String get lbResetDialogBody =>
      'De fixturelijst wordt geleegd. De configuratie van het bord blijft behouden.';

  @override
  String get lbClearAction => 'Leegmaken';

  @override
  String get lbPageTitle => 'Belastingsverdeling';

  @override
  String get lbResetTooltip => 'Resetten';

  @override
  String get lbPanelConfigTitle => 'Configuratie van het bord';

  @override
  String get lbVoltageTypeLabel => 'Type netwerk';

  @override
  String get lbPanelSizeLabel => 'Grootte van het bord';

  @override
  String get lbCosPhiLabel => 'Vermogensfactor (cos φ)';

  @override
  String get lbPhaseGaugesTitle => 'Stroomsterkte per fase';

  @override
  String lbFixturesListTitle(Object count, Object totalW) {
    return 'Fixtures — $count regels · $totalW W totaal';
  }

  @override
  String get lbEmptyTitle => 'Nog geen fixtures';

  @override
  String get lbEmptyBody => 'Tik op + om toe te voegen\nvanuit de catalogus.';

  @override
  String get lbAddFixtureButton => 'Fixture toevoegen';

  @override
  String get lbSheetTitleDefault => '⚡ Fixture toevoegen';

  @override
  String get lbPickerSearchHint => 'Fabrikant of fixture zoeken…';

  @override
  String get lbNoResults => 'Geen resultaten 🤷';

  @override
  String lbProductsWithPowerCount(Object count) {
    return '$count fixture(s) met verbruiksgegevens';
  }

  @override
  String get lbUnknownPower => 'verbruik onbekend';

  @override
  String get lbFixtureSectionLabel => 'Fixture';

  @override
  String get lbPowerLabel => 'Verbruik (W)';

  @override
  String get lbQuantityLabel => 'Aantal';

  @override
  String get lbPhaseLabel => 'Fase';

  @override
  String get lbPowerHint => 'bijv. 350';

  @override
  String get lbAddToDistribution => 'Toevoegen aan verdeling';

  @override
  String get filterLedFiltreLabel => 'Filter';

  @override
  String get filterLedTransmissionLabel => 'Transmissie';

  @override
  String get filterLedSaveProfileTooltip => 'Profiel opslaan';

  @override
  String get filterLedColorComparisonTitle => 'Kleurvergelijking';

  @override
  String get proHeaderBody =>
      'Ontgrendel alle geavanceerde tools voor licht-, video- en lasertechnici.';

  @override
  String get proPerYear => '/ jaar';

  @override
  String get proSubscribeButton => 'Abonneren';

  @override
  String get proRestorePurchases => 'Aankopen herstellen';

  @override
  String get proPrivacyPolicy => 'Privacybeleid';

  @override
  String get proTermsOfUse => 'Gebruiksvoorwaarden';

  @override
  String get rfIm3ConflictBadge => '⚠ CONFLICT';

  @override
  String get filterLedHideCalibration => 'Kalibratie verbergen';

  @override
  String get filterLedShowCalibration => 'Mijn fixture kalibreren';

  @override
  String get aboutAudioTitle => 'Audio — geluid & PA';

  @override
  String get aboutAudioSubtitle =>
      'Gain staging, SPL/afstand, delays, cardioïde subs, bekabeling.';

  @override
  String get aboutAudioPageTitle => 'Audio — praktijkreferentie';

  @override
  String get audioRefTocCopyText => 'Inhoudsopgave kopiëren';

  @override
  String get audioRefSection1Title => 'Signaalketen & gain staging';

  @override
  String get audioRefSection1FormulasTitle => 'Niveaureferenties';

  @override
  String get audioRefSection1Formula1 =>
      '0 dBu ≈ 0,775 V RMS — professionele analoge referentie';

  @override
  String get audioRefSection1Formula2 =>
      '0 dBFS = maximaal digitaal niveau voor clipping — houd altijd headroom aan';

  @override
  String get audioRefSection1Formula3 =>
      'Gain staging: stel elke trap (bron → mengtafel → versterker) in voor een goede signaal-ruisverhouding, zonder te oversturen';

  @override
  String get audioRefSection1FieldMarksTitle => 'Praktijktips';

  @override
  String get audioRefSection1FieldMark1 =>
      'Streef naar een ingangsniveau dat in het groen/geel pulseert, nooit continu in het rood';

  @override
  String get audioRefSection1FieldMark2 =>
      'Een slecht ingesteld systeem klinkt al ruisend bij laag volume: het probleem zit vaak in een overstuurde trap eerder in de keten';

  @override
  String get audioRefSection2Title => 'SPL & afstand';

  @override
  String get audioRefSection2FormulaTitle =>
      'Kwadratenwet (inverse square law)';

  @override
  String get audioRefSection2Formula1 =>
      'Elke verdubbeling van de afstand = -6 dB SPL in het vrije veld';

  @override
  String get audioRefSection2Formula2 =>
      'SPL(d2) = SPL(d1) - 20 × log10(d2 / d1)';

  @override
  String get audioRefSection2NoteTitle => 'Nuance op de werkvloer';

  @override
  String get audioRefSection2Note1 =>
      'Binnen verminderen reflecties (muren, plafond) de werkelijke afname ten opzichte van de theorie';

  @override
  String get audioRefSection2Note2 =>
      'Een goed ontworpen line-array neemt langs de dekkingsas minder snel af dan een puntbron';

  @override
  String get audioRefSection3Title => 'Delay-uitlijning (time alignment)';

  @override
  String get audioRefSection3Paragraph =>
      'Een secundair systeem (delay tower, front fill) moet vertraagd worden zodat het geluid tegelijk aankomt met het hoofdsysteem en als één bron wordt waargenomen.';

  @override
  String get audioRefSection3FormulaTitle => 'Basisformule';

  @override
  String get audioRefSection3Formula1 =>
      'Delay (ms) = afstand tussen de systemen (m) / 0,343 m/ms (geluidssnelheid ≈ 343 m/s)';

  @override
  String get audioRefSection3TipsTitle => 'Goede praktijken';

  @override
  String get audioRefSection3Tip1 =>
      'Meet de werkelijke afstand tussen de twee bronnen, niet alleen de afstand tot het publiek';

  @override
  String get audioRefSection3Tip2 =>
      'Voeg een paar extra ms delay toe (2-5 ms) om het precedentie-effect (Haas-effect) te versterken en het hoofdsysteem als waargenomen bron te behouden';

  @override
  String get audioRefSection3Tip3 =>
      'Controleer op het gehoor en/of met een analyzer (bijv. fasecorrelatie) na het instellen';

  @override
  String get audioRefSection4Title =>
      'Richtwerking van subs (cardioïde / end-fire)';

  @override
  String get audioRefSection4Paragraph =>
      'Een cardioïde of end-fire opstelling vermindert de laagenergie richting het podium/FOH en versterkt die richting het publiek, door te spelen met delay en polariteit tussen de subs.';

  @override
  String get audioRefSection4TypesTitle => 'Gangbare configuraties';

  @override
  String get audioRefSection4Type1 =>
      'End-fire: subs op een rij, de voorste vooruitgeschoven en elektronisch vertraagd';

  @override
  String get audioRefSection4Type2 =>
      '2-sub cardioïde: één sub vooraan (normaal), één sub achteraan met omgekeerde polariteit en vertraagd';

  @override
  String get audioRefSection4Type3 =>
      '3-sub cardioïde: twee vooraan in fase, één achteraan omgekeerd en vertraagd — beste balans tussen niveau en achterwaartse onderdrukking';

  @override
  String get audioRefSection5Title => 'Bekabeling & connectoren';

  @override
  String get audioRefSection5XlrTitle => 'Gebalanceerde XLR';

  @override
  String get audioRefSection5XlrBullet1 =>
      'Kies bij lange afstanden altijd voor een gebalanceerde verbinding (XLR/TRS) om storing te onderdrukken';

  @override
  String get audioRefSection5XlrBullet2 =>
      'Boven ~50-100 m analoog, overweeg een digitale verbinding (AES/EBU, Dante, enz.)';

  @override
  String get audioRefSection5SpeakonTitle => 'Speakon (luidsprekers)';

  @override
  String get audioRefSection5SpeakonBullet1 =>
      'Gebruik nooit XLR voor luidsprekers: het vermogen kan apparatuur beschadigen die bedoeld is voor lijnniveau-signaal';

  @override
  String get audioRefSection5SpeakonBullet2 =>
      'Controleer of de kabeldoorsnede geschikt is voor het vermogen en de afstand (spanningsval) vóór een lange trekking';

  @override
  String get audioRefSection5GroundTitle => 'Massa & brom';

  @override
  String get audioRefSection5GroundBullet1 =>
      'Een aardlus tussen twee apparaten die via verschillende paden op het net zijn aangesloten kan 50/60 Hz brom veroorzaken';

  @override
  String get audioRefSection5GroundBullet2 =>
      'Een ground lift of een DI-box met galvanische scheiding kan dit oplossen zonder de veiligheidsaarde te onderbreken';

  @override
  String get audioRefSection6Title => 'Gehoorveiligheid & goede praktijken';

  @override
  String get audioRefSection6DontDoTitle => 'Vermijd';

  @override
  String get audioRefSection6DontDoBullet1 =>
      'Publiek of crew continu en zonder tijdslimiet blootstellen aan meer dan 100 dB SPL';

  @override
  String get audioRefSection6DontDoBullet2 =>
      'Een systeem verder pushen dan zijn nominale vermogen om een slechte plaatsing te compenseren';

  @override
  String get audioRefSection6WarningTitle => 'Blootstellingsreferenties';

  @override
  String get audioRefSection6WarningBullet1 =>
      '85 dB SPL: aanbevolen limiet voor langdurige blootstelling (8u) zonder bescherming';

  @override
  String get audioRefSection6WarningBullet2 =>
      '100 dB SPL: al na enkele minuten risico — de meeste concerten overschrijden dit niveau';

  @override
  String get audioRefSection6WarningBullet3 =>
      'Gebruik altijd een systeemlimiter op de uitgang om apparatuur en publiek te beschermen';

  @override
  String get audioRefSection7Title => 'Snelle checklist';

  @override
  String get audioRefSection7QuickTitle => 'Voor de show';

  @override
  String get audioRefSection7Bullet1 =>
      'Gain staging gecontroleerd van bron tot versterker, geen oversturing';

  @override
  String get audioRefSection7Bullet2 =>
      'Delays van secundaire systemen berekend en toegepast';

  @override
  String get audioRefSection7Bullet3 => 'Systeemlimiter actief en ingesteld';

  @override
  String get audioRefSection7Bullet4 =>
      'Polariteit gecontroleerd tussen subs en tops (geen uitdoving)';

  @override
  String get audioRefSection7Bullet5 =>
      'SPL-niveau gemeten bij FOH en achterin de zaal';

  @override
  String get audioRefFooterNote =>
      'Dit zijn algemene richtlijnen — controleer altijd de aanbevelingen van de fabrikant en de lokale regelgeving over geluidsniveaus.';

  @override
  String get aboutRfTitle => 'RF — draadloos & Wi-Fi';

  @override
  String get aboutRfSubtitle =>
      'UHF-banden, Wi-Fi, IM3-coëxistentie, antennes, RF-scan.';

  @override
  String get aboutRfPageTitle => 'RF — praktijkreferentie';

  @override
  String get rfRefTocCopyText => 'Inhoudsopgave kopiëren';

  @override
  String get rfRefSection1Title => 'Basis van het RF-spectrum';

  @override
  String get rfRefSection1FormulasTitle => 'Frequentie-/golflengtereferentie';

  @override
  String get rfRefSection1Formula1 =>
      'λ (m) = 300 / f (MHz) — geschatte golflengte';

  @override
  String get rfRefSection1Formula2 =>
      'Hoe hoger de frequentie, hoe korter de golflengte en hoe korter het bereik in de vrije ruimte';

  @override
  String get rfRefSection1FieldMarksTitle => 'Praktijktips';

  @override
  String get rfRefSection1FieldMark1 =>
      'Het menselijk lichaam absorbeert en reflecteert RF-golven — de positie van een draadloze ontvanger op het lichaam beïnvloedt de ontvangst';

  @override
  String get rfRefSection1FieldMark2 =>
      'Geef altijd de voorkeur aan direct zicht (line of sight) tussen zender en ontvanger';

  @override
  String get rfRefSection2Title => 'UHF-banden voor draadloze microfoons';

  @override
  String get rfRefSection2Paragraph =>
      'Draadloze microfoons en in-ears gebruiken vooral de UHF-band (470-694 MHz in Europa, afhankelijk van het land), gedeeld met TV-uitzendingen — de werkelijke beschikbaarheid hangt af van de lokale regelgeving.';

  @override
  String get rfRefSection2NoteTitle => 'Controleer vóór elke show';

  @override
  String get rfRefSection2Note1 =>
      'De beschikbare banden verschillen per land — controleer de lokale regelgeving (ANFR in Frankrijk, Ofcom in het VK, enz.)';

  @override
  String get rfRefSection2Note2 =>
      'Een band die op één plek vrij is, kan elders bezet zijn door een TV-zender of een andere leverancier';

  @override
  String get rfRefSection3Title => 'Wi-Fi 2,4 GHz vs 5 GHz';

  @override
  String get rfRefSection3TableTitle => 'Belangrijkste verschillen';

  @override
  String get rfRefSection3Bullet1 =>
      '2,4 GHz: 3 niet-overlappende kanalen (1, 6, 11), beter bereik, drukker (Bluetooth, draadloze microfoons in de hoge band, andere netwerken)';

  @override
  String get rfRefSection3Bullet2 =>
      '5 GHz: veel meer niet-overlappende kanalen, hogere doorvoer, korter bereik, over het algemeen minder interferentie';

  @override
  String get rfRefSection3Bullet3 =>
      'Geef voor regie/besturing (mengtafels, visualisatie) waar mogelijk de voorkeur aan 5 GHz';

  @override
  String get rfRefSection4Title => 'Coëxistentie & intermodulatie (IM3)';

  @override
  String get rfRefSection4Paragraph =>
      'Wanneer meerdere draadloze zenders samen werken, kunnen hun frequenties intermodulatieproducten (IM3) creëren die op andere gebruikte frequenties vallen en storing veroorzaken.';

  @override
  String get rfRefSection4FormulaTitle => 'IM3-formule (3e orde)';

  @override
  String get rfRefSection4Formula1 => 'IM3 = 2×f1 − f2 en 2×f2 − f1';

  @override
  String get rfRefSection4Tip1 =>
      'Hoe meer draadloze kanalen worden toegevoegd, hoe groter het risico dat een IM3-product op een gebruikte frequentie valt — vandaar het nut van een vooraf berekend frequentieplan';

  @override
  String get rfRefSection5Title => 'Antennes & diversity';

  @override
  String get rfRefSection5Bullet1 =>
      'Diversity-ontvangst gebruikt twee licht verschoven antennes om uitdovingszones (RF-dode plekken) te vermijden';

  @override
  String get rfRefSection5Bullet2 =>
      'Plaats antennes minstens een kwart golflengte uit elkaar, niet recht in lijn met de zender';

  @override
  String get rfRefSection5Bullet3 =>
      'Vermijd antennes direct op de grond of tegen een metalen structuur, wat het signaal kan ontstemmen of afschermen';

  @override
  String get rfRefSection6Title => 'RF-scan vóór een show';

  @override
  String get rfRefSection6Bullet1 =>
      'Scan de band altijd ter plaatse, op showtijd — de RF-omgeving verandert tussen dag en avond (andere leveranciers, publiek met hotspots, enz.)';

  @override
  String get rfRefSection6Bullet2 =>
      'Noteer de bezette frequenties en documenteer ze voor de volgende show op dezelfde locatie indien mogelijk';

  @override
  String get rfRefSection6Bullet3 =>
      'Houd een marge vrije frequenties achter de hand voor een last-minute wissel (defecte apparatuur, onverwachte storing)';

  @override
  String get rfRefSection7Title => 'Snelle checklist';

  @override
  String get rfRefSection7Bullet1 => 'RF-scan uitgevoerd op showtijd';

  @override
  String get rfRefSection7Bullet2 =>
      'Frequentieplan berekend (IM3 gecontroleerd)';

  @override
  String get rfRefSection7Bullet3 => 'Antennes in zichtlijn, correct geplaatst';

  @override
  String get rfRefSection7Bullet4 =>
      'Gebruikte UHF-banden conform de lokale regelgeving';

  @override
  String get rfRefFooterNote =>
      'RF-regelgeving verschilt sterk per land — controleer altijd de lokaal toegestane frequenties vóór een show.';

  @override
  String get aboutLaserTitle => 'Laser — natuurkunde & veiligheid';

  @override
  String get aboutLaserSubtitle =>
      'Werking, scanners, klassen, normen, NOHD/SZED/CZED.';

  @override
  String get aboutLaserPageTitle => 'Laser — praktijkreferentie';

  @override
  String get laserRefTocCopyText => 'Inhoudsopgave kopiëren';

  @override
  String get laserRefSection1Title => 'Wat is een laser?';

  @override
  String get laserRefSection1AcronymTitle => 'Het acroniem LASER';

  @override
  String get laserRefSection1AcronymBody =>
      'LASER staat voor „Light Amplification by Stimulated Emission of Radiation” (lichtversterking door gestimuleerde emissie van straling).';

  @override
  String get laserRefSection1HowTitle => 'Het fysische principe';

  @override
  String get laserRefSection1HowBody =>
      'Een actief medium (diode, DPSS-kristal...) wordt elektrisch of optisch „gepompt”, wat gestimuleerde emissie van fotonen veroorzaakt. Een resonantieholte (twee spiegels, waarvan één deels doorlatend) versterkt dit licht, dat coherent, monochromatisch en sterk gecollimeerd naar buiten komt — in tegenstelling tot een gewone lichtbron.';

  @override
  String get laserRefSection1TypesTitle => 'Veelvoorkomende types in shows';

  @override
  String get laserRefSection1Type1 =>
      'Directe diode: compact, vaak gebruikt in RGB om kleuren te mengen';

  @override
  String get laserRefSection1Type2 =>
      'DPSS (Diode Pumped Solid State): een diode pompt een kristal, van oudsher gebruikt voor groen en andere specifieke golflengtes';

  @override
  String get laserRefSection2Title =>
      'Hoe er getekend wordt: scanners en snelheid';

  @override
  String get laserRefSection2Paragraph =>
      'De straal wordt gestuurd door twee galvanometerspiegels („galvo\'s”), één voor de X-as en één voor de Y-as, die extreem snel draaien. In tegenstelling tot video (regel-voor-regel raster) tekent een lasershow vectorvormen, punt voor punt, langs de contour van het beeld.';

  @override
  String get laserRefSection2SpeedTitle => 'Scansnelheid';

  @override
  String get laserRefSection2Speed1 =>
      'De snelheid wordt gemeten in punten per seconde (pps) of kilopunten per seconde (kpps)';

  @override
  String get laserRefSection2Speed2 =>
      'ILDA (International Laser Display Association) standaardiseert de connector, het .ild-bestandsformaat en een testpatroon om een scanner objectief te beoordelen';

  @override
  String get laserRefSection2FieldTitle => 'Praktijktips';

  @override
  String get laserRefSection2Field1 =>
      'Hoe meer punten een beeld bevat, hoe meer pps nodig zijn om flikkering (flicker) te vermijden — een vloeiende show draait doorgaans rond 20 tot 30 kpps';

  @override
  String get laserRefSection2Field2 =>
      'Het ILDA-testpatroon maakt het mogelijk twee scanners te vergelijken op objectieve criteria (snelheid, precisie, demping)';

  @override
  String get laserRefSection3Title => 'Laserklassen & normen';

  @override
  String get laserRefSection3ClassesTitle => 'IEC 60825-1-klassen';

  @override
  String get laserRefSection3Class1 =>
      'Klasse 1: veilig bij normaal gebruik, geen bijzondere voorzorgen nodig';

  @override
  String get laserRefSection3Class2 =>
      'Klasse 1M / 2M: veilig met het blote oog, maar gevaarlijk met optische instrumenten (verrekijker, loep)';

  @override
  String get laserRefSection3Class3 =>
      'Klasse 2: zichtbaar, beschermd door de knipperreflex (< 1 mW)';

  @override
  String get laserRefSection3Class4 =>
      'Klasse 3R: matig risico, beperkt direct gevaar';

  @override
  String get laserRefSection3Class5 =>
      'Klasse 3B: gevaarlijk voor het oog bij direct zicht — de meeste showlasers vallen in deze of klasse 4';

  @override
  String get laserRefSection3Class6 =>
      'Klasse 4: gevaarlijk voor oog en huid, brandgevaar — maximale voorzorgen vereist';

  @override
  String get laserRefSection3StandardsTitle => 'Referentienormen';

  @override
  String get laserRefSection3Standard1 =>
      'IEC 60825-1: productveiligheid en laserclassificatie';

  @override
  String get laserRefSection3Standard2 =>
      'IEC 60825-3: specifieke richtlijnen voor laserdisplays en -shows (concept van variabele MPE afhankelijk van blootstellingsduur)';

  @override
  String get laserRefSection3Standard3 =>
      'Lokale regelgeving: aangifte/vergunning afhankelijk van vermogen en land (bv. FDA/CDRH 21 CFR 1040.10 in de VS, met variance-procedure voor shows)';

  @override
  String get laserRefSection3FieldNote =>
      'Controleer altijd de lokale regelgeving vóór een show, vooral voor audience scanning en in de buurt van een luchthaven.';

  @override
  String get laserRefSection4Title => 'Veiligheidsmaatregelen';

  @override
  String get laserRefSection4Bullet1 =>
      'Een opgeleide Laser Safety Officer (LSO) is aangesteld en verantwoordelijk voor de show';

  @override
  String get laserRefSection4Bullet2 =>
      'Sleutelschakelaar en noodstop zijn makkelijk bereikbaar';

  @override
  String get laserRefSection4Bullet3 =>
      'Een vergrendeling (interlock) onderbreekt de emissie als een kap of behuizing wordt geopend';

  @override
  String get laserRefSection4Bullet4 =>
      'Scan-fail-detectie onderbreekt de straal als de galvo\'s stoppen — onmisbaar bij audience scanning';

  @override
  String get laserRefSection4Bullet5 =>
      'Geen vaste straal gericht op het publiek — alleen audience scanning met de bijbehorende beveiligingen en blootstellingsberekeningen';

  @override
  String get laserRefSection4Bullet6 =>
      'Nooit richten op luchtruim, een vliegtuig of een ongecontroleerd reflecterend oppervlak (glas, spiegel, scherm)';

  @override
  String get laserRefSection5Title => 'NOHD, SZED, CZED uitgelegd';

  @override
  String get laserRefSection5Paragraph =>
      'Deze veiligheidsafstanden worden berekend door de tool „Veiligheidszones” van de app op basis van vermogen, divergentie en uittredediameter van de straal.';

  @override
  String get laserRefSection5NohdTitle =>
      'NOHD — Nominal Ocular Hazard Distance';

  @override
  String get laserRefSection5NohdBody =>
      'Nominale oculaire gevarenafstand: voorbij deze afstand daalt de directe bestraling van de straal onder de maximaal toegestane blootstelling (MPE) voor een korte, onbedoelde blootstelling. Dit is de basisreferentie zoals gedefinieerd door IEC 60825-1.';

  @override
  String get laserRefSection5SzedTitle => 'SZED — Show Zone Exposure Distance';

  @override
  String get laserRefSection5SzedBody =>
      'Blootstellingsafstand van de showzone: bakent de zone af waar het publiek zich mag bevinden tijdens een show met beam scanning (audience scanning), met een voorzichtiger MPE-drempel dan de NOHD.';

  @override
  String get laserRefSection5CzedTitle =>
      'CZED — Controlled Zone Exposure Distance';

  @override
  String get laserRefSection5CzedBody =>
      'Blootstellingsafstand van de gecontroleerde zone: de voorzichtigste van de drie, voorbehouden aan de zone waar alleen opgeleid personeel (operators, technici) mag staan, rekening houdend met een mogelijk langere blootstelling.';

  @override
  String get laserRefSection5FieldNote =>
      'In de app geldt: hoe lager de gebruikte MPE-drempel, hoe groter de berekende afstand — vandaar de volgorde CZED > SZED > NOHD. Deze afstanden blijven indicatief: ze vervangen geen beoordeling door een gekwalificeerde Laser Safety Officer, noch de geldende lokale regelgeving.';

  @override
  String get laserRefSection6Title => 'Snelle checklist';

  @override
  String get laserRefSection6Bullet1 =>
      'Laserklasse geïdentificeerd, indien nodig aangemeld';

  @override
  String get laserRefSection6Bullet2 =>
      'LSO aangesteld en aanwezig tijdens de hele show';

  @override
  String get laserRefSection6Bullet3 =>
      'NOHD-/SZED-/CZED-zones berekend en gemarkeerd';

  @override
  String get laserRefSection6Bullet4 =>
      'Scan-fail-detectie actief bij audience scanning';

  @override
  String get laserRefSection6Bullet5 => 'Noodstop getest en bereikbaar';

  @override
  String get laserRefSection6Bullet6 =>
      'Niet richten op luchtruim of een ongecontroleerd reflecterend oppervlak';

  @override
  String get laserRefFooterNote =>
      'Deze informatie is algemeen en educatief — ze vervangt geen Laser Safety Officer-opleiding, noch lokale regelgeving (IEC 60825, FDA/CDRH, luchtvaartautoriteiten...).';

  @override
  String get aboutRiggingTitle => 'Rigging';

  @override
  String get aboutRiggingSubtitle => 'Basis, bridles en hoekfactor';

  @override
  String get aboutRiggingPageTitle => 'Rigging — snelcursus';

  @override
  String get riggingRefTocCopyText => 'Samenvatting kopiëren';

  @override
  String get riggingRefSection1Title => 'Rigging-basis';

  @override
  String get riggingRefSection2Title => '2-punts aanslag (bridle)';

  @override
  String get riggingRefSection3Title => 'Hoekfactor';

  @override
  String get riggingRefSection4Title => 'Checklist';

  @override
  String get riggingRefSection1Bullet1 =>
      'WLL (Working Load Limit): de door de fabrikant opgegeven maximaal toegestane belasting van een accessoire.';

  @override
  String get riggingRefSection1Bullet2 =>
      'Veiligheidsfactor: de verhouding tussen breeklast en WLL, meestal 5:1 of 10:1 afhankelijk van het materiaal en de regelgeving.';

  @override
  String get riggingRefSection1Bullet3 =>
      'Lastketen: elke schakel (ophangpunt, sling, harpsluiting, structuur) moet berekend zijn op de volledige last — de zwakste schakel bepaalt de limiet van de hele keten.';

  @override
  String get riggingRefSection2Bullet1 =>
      'Een 2-punts bridle verdeelt de last over twee slings die een hoek maken ten opzichte van de verticaal.';

  @override
  String get riggingRefSection2Bullet2 =>
      'Hoe groter de hoek ten opzichte van de verticaal, hoe hoger de spanning in elke sling.';

  @override
  String get riggingRefSection2Bullet3 =>
      'Gangbare aanbeveling: de ingesloten hoek tussen de twee benen onder 90° houden om de extra spanning te beperken.';

  @override
  String get riggingRefSection3FormulaTitle => 'Formule';

  @override
  String get riggingRefSection3Formula1 =>
      'Spanning per sling = (Last / aantal slings) × hoekfactor, met hoekfactor = 1 / cos(hoek ten opzichte van de verticaal).';

  @override
  String get riggingRefSection3Bullet1 =>
      'Voorbeelden: 0° → factor 1,0; 45° → factor circa 1,41; 60° → factor 2,0.';

  @override
  String get riggingRefSection3Bullet2 =>
      'Hoe groter de hoek ten opzichte van de verticaal, hoe sneller de factor — en dus de spanning — toeneemt.';

  @override
  String get riggingRefSection4Bullet1 =>
      'Controleer de WLL van elk accessoire (sling, harpsluiting, karabijnhaak, structuur) vóór het rigging.';

  @override
  String get riggingRefSection4Bullet2 =>
      'Bereken de werkelijke spanning per sling met de hoekfactor, niet alleen de totale last gedeeld door het aantal benen.';

  @override
  String get riggingRefSection4Bullet3 =>
      'Inspecteer accessoires visueel (vervorming, corrosie, slijtage) vóór elk gebruik.';

  @override
  String get riggingRefSection4Bullet4 =>
      'Laat de opstelling bij zware lasten of complexe configuraties controleren door een deskundige of gekwalificeerde rigger.';

  @override
  String get riggingRefFooterNote =>
      'Deze inhoud is een algemene educatieve herinnering en vervangt geen lokale normen, riggeropleiding of controle door een deskundige.';

  @override
  String get aboutConsoleTitle => 'Console & patch';

  @override
  String get aboutConsoleSubtitle => 'Virtuele console, GDTF en DMX-patch';

  @override
  String get aboutConsolePageTitle => 'Console — snelcursus';

  @override
  String get consoleRefTocCopyText => 'Samenvatting kopiëren';

  @override
  String get consoleRefSection1Title => 'Virtuele console & draadloze DMX';

  @override
  String get consoleRefSection2Title => 'GDTF & GDTF Share';

  @override
  String get consoleRefSection3Title => 'Patch & universums';

  @override
  String get consoleRefSection4Title => 'Checklist';

  @override
  String get consoleRefSection1Paragraph =>
      'Met een virtuele console bestuur je een show vanaf een tablet of smartphone, waarbij DMX via het netwerk (Art-Net of sACN) wordt verzonden in plaats van via een directe DMX-kabel.';

  @override
  String get consoleRefSection1Bullet1 =>
      'Wi-Fi brengt latency en uitvalrisico met zich mee: reserveer het voor instelwerk, niet voor kritieke live-cues zonder bekabelde back-up.';

  @override
  String get consoleRefSection1Bullet2 =>
      'Controleer of de DMX-over-IP-node/interface daadwerkelijk het op de virtuele console geconfigureerde Art-Net- of sACN-universum ontvangt.';

  @override
  String get consoleRefSection1Bullet3 =>
      'Houd een bekabelde back-up (directe DMX of Ethernet) achter de hand voor kritieke momenten van de show.';

  @override
  String get consoleRefSection2GdtfTitle => 'GDTF (General Device Type Format)';

  @override
  String get consoleRefSection2GdtfBody =>
      'Een gestandaardiseerd bestandsformaat dat de eigenschappen van een fixture beschrijft (DMX-modi, kleurenwielen, 3D-geometrie) voor een betrouwbare import in elke compatibele console.';

  @override
  String get consoleRefSection2ShareTitle => 'GDTF Share';

  @override
  String get consoleRefSection2ShareBody =>
      'De officiële online database waar fabrikanten GDTF-bestanden van hun apparatuur publiceren, gratis te downloaden voor het patchen.';

  @override
  String get consoleRefSection3Bullet1 =>
      'Een DMX-universum bevat 512 kanalen; elk apparaat gebruikt een of meer kanalen afhankelijk van de gekozen DMX-modus.';

  @override
  String get consoleRefSection3Bullet2 =>
      'Controleer altijd de DMX-modus die daadwerkelijk op het fysieke apparaat is ingesteld — deze moet overeenkomen met de modus geselecteerd in de patch van de console.';

  @override
  String get consoleRefSection3Bullet3 =>
      'Het documenteren van de patch (adressen, universums, modi) maakt troubleshooting en overdracht aan een andere persoon veel eenvoudiger.';

  @override
  String get consoleRefSection4Bullet1 =>
      'Controleer de netwerkverbinding (Wi-Fi of bekabeld) tussen de virtuele console en de DMX-node vóór de show.';

  @override
  String get consoleRefSection4Bullet2 =>
      'Bevestig dat elk apparaat gepatcht is in het juiste universum en op het juiste startadres.';

  @override
  String get consoleRefSection4Bullet3 =>
      'Gebruik een actueel GDTF-bestand van GDTF Share in plaats van een generiek profiel.';

  @override
  String get consoleRefSection4Bullet4 =>
      'Voorzie een back-upplan voor het geval van netwerk- of Wi-Fi-uitval tijdens de show.';

  @override
  String get consoleRefFooterNote =>
      'Deze inhoud is een algemene herinnering; raadpleeg de documentatie van de fabrikant voor specifieke DMX-modi en procedures.';

  @override
  String get aboutCinemaTitle => 'Cinema';

  @override
  String get aboutCinemaSubtitle => 'Camera, scherptediepte en framerate';

  @override
  String get aboutCinemaPageTitle => 'Cinema — snelcursus';

  @override
  String get cinemaRefTocCopyText => 'Samenvatting kopiëren';

  @override
  String get cinemaRefSection1Title => 'Camera-basis';

  @override
  String get cinemaRefSection2Title => 'Scherptediepte & focus';

  @override
  String get cinemaRefSection3Title => 'Framerate & sluiter';

  @override
  String get cinemaRefSection4Title => 'Checklist';

  @override
  String get cinemaRefSection1Bullet1 =>
      'Sensor: het lichtgevoelige oppervlak dat het beeld vastlegt; de grootte ervan beïnvloedt bij een gegeven brandpuntsafstand het beeldveld en de scherptediepte.';

  @override
  String get cinemaRefSection1Bullet2 =>
      'Brandpuntsafstand: de afstand (in mm) die de beeldhoek bepaalt — een korte brandpuntsafstand is groothoek, een lange is tele.';

  @override
  String get cinemaRefSection1Bullet3 =>
      'Diafragma (f/): de grootte van de diafragmaopening, die zowel de hoeveelheid binnenvallend licht als de scherptediepte regelt.';

  @override
  String get cinemaRefSection2Paragraph =>
      'Scherptediepte is de zone van aanvaardbare scherpte vóór en achter het scherpgestelde onderwerp.';

  @override
  String get cinemaRefSection2Bullet1 =>
      'Een wijd diafragma (f/1.4, f/2) geeft een geringe scherptediepte (wazige achtergrond).';

  @override
  String get cinemaRefSection2Bullet2 =>
      'Een gesloten diafragma (f/11, f/16) geeft een grote scherptediepte (alles scherp).';

  @override
  String get cinemaRefSection3FormulaTitle => 'Sluiterhoek-formule';

  @override
  String get cinemaRefSection3Formula1 =>
      'Sluitertijd = 1 / (2 × framerate in fps) voor een sluiterhoek van 180°, de standaardreferentie in film.';

  @override
  String get cinemaRefSection3Bullet1 =>
      '24 beelden per seconde is de klassieke bioscoop-framerate; 25 of 30 fps zijn gangbaar in broadcast afhankelijk van de videostandaard (PAL/NTSC).';

  @override
  String get cinemaRefSection3Bullet2 =>
      'Een kleinere sluiterhoek (90°, 45°) geeft een hakkeriger beeld, vaak gebruikt voor gestileerde actiescènes.';

  @override
  String get cinemaRefSection4Bullet1 =>
      'Controleer of de framerate van de camera overeenkomt met de frequentie van de lichtbronnen (flikkering vermijden).';

  @override
  String get cinemaRefSection4Bullet2 =>
      'Pas het diafragma aan op de gewenste scherptediepte, niet alleen op de belichting.';

  @override
  String get cinemaRefSection4Bullet3 =>
      'Houd tijdens de hele opname een consistente sluiterhoek aan voor een uniforme bewegingstextuur.';

  @override
  String get cinemaRefSection4Bullet4 =>
      'Test altijd onder echte setomstandigheden vóór de definitieve opname.';

  @override
  String get cinemaRefFooterNote =>
      'Deze inhoud is een algemene educatieve herinnering; de definitieve instellingen hangen af van de apparatuur en de artistieke intentie.';

  @override
  String get aboutTimecodeTitle => 'Timecode';

  @override
  String get aboutTimecodeSubtitle => 'SMPTE, drop-frame en framerates';

  @override
  String get aboutTimecodePageTitle => 'Timecode — snelcursus';

  @override
  String get timecodeRefTocCopyText => 'Samenvatting kopiëren';

  @override
  String get timecodeRefSection1Title => 'Wat is SMPTE-timecode';

  @override
  String get timecodeRefSection2Title => 'Drop-frame versus non-drop-frame';

  @override
  String get timecodeRefSection3Title => 'Gangbare framerates';

  @override
  String get timecodeRefSection4Title => 'Checklist';

  @override
  String get timecodeRefSection1FormatTitle => 'Formaat';

  @override
  String get timecodeRefSection1FormatBody =>
      'UU:MM:SS:FF — uren, minuten, seconden en framenummer, dat bij elke volledige framerate wordt gereset.';

  @override
  String get timecodeRefSection1Bullet1 =>
      'SMPTE-timecode synchroniseert beeld, geluid en licht op één gedeelde tijdreferentie.';

  @override
  String get timecodeRefSection1Bullet2 =>
      'Elk frame heeft een uniek adres, wat een nauwkeurige referentie mogelijk maakt, zowel in postproductie als bij live-besturing.';

  @override
  String get timecodeRefSection2Paragraph =>
      'Drop-frame (DF) bestaat omdat sommige framerates (29,97 fps) geen geheel aantal frames per seconde opleveren, waardoor de timecode zonder correctie afwijkt van de werkelijke tijd.';

  @override
  String get timecodeRefSection2Bullet1 =>
      'Non-drop-frame (NDF): telt frames zonder sprongen; eenvoudig, maar wijkt bij 29,97 fps licht af van de werkelijke tijd.';

  @override
  String get timecodeRefSection2Bullet2 =>
      'Drop-frame (DF): slaat periodiek framenummers over (geen echte frames) om de timecode weer gelijk te trekken met de werkelijke tijd.';

  @override
  String get timecodeRefSection3Bullet1 =>
      '24 fps: de klassieke bioscoop-framerate.';

  @override
  String get timecodeRefSection3Bullet2 =>
      '25 fps: PAL-standaard (Europa); 30 fps (of 29,97 DF/NDF): NTSC-standaard (Noord-Amerika, Japan).';

  @override
  String get timecodeRefSection3Bullet3 =>
      '50 fps en 59,94/60 fps: hoge framerates gebruikt in broadcast en voor slow motion.';

  @override
  String get timecodeRefSection3Bullet4 =>
      'Controleer altijd of alle bronnen (camera, geluid, licht, video) dezelfde referentieframerate gebruiken.';

  @override
  String get timecodeRefSection4Bullet1 =>
      'Bevestig de framerate en modus (DF/NDF) op alle bronnen vóór het begin van de show of opname.';

  @override
  String get timecodeRefSection4Bullet2 =>
      'Zorg dat de master-timecodebron (master clock) duidelijk is geïdentificeerd en naar alle apparaten wordt verdeeld.';

  @override
  String get timecodeRefSection4Bullet3 =>
      'Vergelijk bij vermoede afwijking de weergegeven timecode gedurende een voldoende lange periode met een referentieklok.';

  @override
  String get timecodeRefFooterNote =>
      'Deze inhoud is een algemene herinnering; raadpleeg de SMPTE-specificaties en de documentatie van de gebruikte apparatuur.';

  @override
  String get aboutConversionsTitle => 'Conversies & BPM';

  @override
  String get aboutConversionsSubtitle =>
      'Eenheden, BPM en DMX in één oogopslag';

  @override
  String get aboutConversionsPageTitle => 'Conversies & BPM — snelcursus';

  @override
  String get conversionsRefTocCopyText => 'Samenvatting kopiëren';

  @override
  String get conversionsRefSection1Title => 'Waarom converteren';

  @override
  String get conversionsRefSection2Title => 'BPM ↔ milliseconden';

  @override
  String get conversionsRefSection3Title => 'DMX ↔ percentage / 8-bit ↔ 16-bit';

  @override
  String get conversionsRefSection4Title => 'Checklist';

  @override
  String get conversionsRefSection1Paragraph =>
      'Aan de regie worden eenheden vaak door elkaar gehaald (muzikale BPM, delay-milliseconden, DMX-percentages, 8/16-bit-waarden): snel en foutloos converteren voorkomt afwijkingen tussen licht-, geluids- en video-effecten.';

  @override
  String get conversionsRefSection2FormulaTitle => 'Formule';

  @override
  String get conversionsRefSection2Formula1 =>
      'Duur van één beat (ms) = 60.000 / BPM.';

  @override
  String get conversionsRefSection2Bullet1 =>
      'Voorbeeld: bij 120 BPM duurt een beat 500 ms; een zestiende noot (1/4 beat) duurt 125 ms.';

  @override
  String get conversionsRefSection2Bullet2 =>
      'Handig om een lichteffect, een audio-delay of een videoclip af te stemmen op het tempo van een track.';

  @override
  String get conversionsRefSection3Bullet1 =>
      'Een 8-bit DMX-waarde loopt van 0 tot 255; in percentage komt 255 overeen met 100%.';

  @override
  String get conversionsRefSection3Bullet2 =>
      'In 16-bit geven twee gecombineerde kanalen (fijn/grof) een resolutie van 0 tot 65.535 voor fijnere besturing (dimmer, pan/tilt).';

  @override
  String get conversionsRefSection3Bullet3 =>
      'Controleer vóór het patchen de modus (8-bit of 16-bit) die daadwerkelijk op het apparaat is ingesteld, anders kloppen de waarden niet.';

  @override
  String get conversionsRefSection4Bullet1 =>
      'Controleer altijd de weergegeven eenheid voordat je een waarde invoert (ms, BPM, %, 8-bit, 16-bit).';

  @override
  String get conversionsRefSection4Bullet2 =>
      'Herbereken in plaats van uit het hoofd af te ronden voor kritieke waarden (synchronisatie, veiligheid).';

  @override
  String get conversionsRefSection4Bullet3 =>
      'Documenteer de gebruikte conversies in de technische rider om de overdracht van de show te vergemakkelijken.';

  @override
  String get conversionsRefFooterNote =>
      'Deze inhoud is een algemene herinnering; raadpleeg de documentatie van het apparaat voor de exacte resolutiemodi.';

  @override
  String get aboutCategoryNetworkTitle => 'Netwerk & protocollen';

  @override
  String get aboutCategoryAudioRfTitle => 'Audio & RF';

  @override
  String get aboutCategoryVideoCinemaTitle => 'Video & cinema';

  @override
  String get aboutCategoryLightingTitle => 'Licht, laser & console';

  @override
  String get aboutCategoryRiggingElecTitle => 'Rigging & elektriciteit';

  @override
  String get aboutCategoryToolsTitle => 'Praktische tools';

  @override
  String get pinnedItemsTitle => 'Mijn pins';

  @override
  String get homePinnedItemsSubtitle =>
      'Vind snel je vastgezette tools en referenties terug.';

  @override
  String get pinnedItemsEmpty => 'Nog geen vastgezette tools of referenties.';

  @override
  String get fixtureInfoSectionIdentification => 'Identificatie';

  @override
  String get fixtureInfoLabelName => 'Naam';

  @override
  String get fixtureInfoLabelId => 'ID';

  @override
  String get fixtureInfoSectionDmx => 'DMX / Netwerk';

  @override
  String get fixtureInfoLabelUniverse => 'Universum';

  @override
  String get fixtureInfoLabelAddress => 'Adres';

  @override
  String get fixtureInfoLabelMode => 'Modus';

  @override
  String get fixtureInfoLabelChannelCount => 'Kanalen';

  @override
  String get fixtureInfoLabelGdtfSpec => 'GDTF-bestand';

  @override
  String get fixtureInfoSectionPhysical => 'Fysiek';

  @override
  String get fixtureInfoLabelWeight => 'Gewicht';

  @override
  String fixtureInfoValueKg(Object kg) {
    return '$kg kg';
  }

  @override
  String get fixtureInfoLabelDimensions => 'Afmetingen';

  @override
  String fixtureInfoValueDimensionsCm(
      Object heightCm, Object lengthCm, Object widthCm) {
    return '$lengthCm × $widthCm × $heightCm cm';
  }

  @override
  String get fixtureInfoLabelLegHeight => 'Poothoogte';

  @override
  String fixtureInfoValueCm(Object cm) {
    return '$cm cm';
  }

  @override
  String get fixtureInfoSectionElectrical => 'Elektrisch';

  @override
  String get fixtureInfoLabelPower => 'Vermogen';

  @override
  String fixtureInfoValueWatts(Object watts) {
    return '$watts W';
  }

  @override
  String get fixtureInfoSectionEnvironment => 'Omgeving';

  @override
  String get fixtureInfoLabelOperatingTemp => 'Bedrijfstemperatuur';

  @override
  String fixtureInfoValueTempRange(Object highC, Object lowC) {
    return '$lowC°C – $highC°C';
  }

  @override
  String get fixtureInfoNoGdtfData =>
      'Geen fysieke informatie beschikbaar (GDTF ontbreekt of onvolledig).';

  @override
  String get patch3dTitle => '3D-viewer';

  @override
  String get patch3dOpenButton => 'Bekijk in 3D';

  @override
  String get patch3dResetCameraTooltip => 'Camera opnieuw centreren';

  @override
  String get patch3dFiltersTooltip => 'Filters en kleuren';

  @override
  String get patch3dZoomToFitTooltip => 'Alles passend maken';

  @override
  String get patch3dCameraViewsTooltip => 'Cameraweergaven';

  @override
  String get patch3dCameraViewFront => 'Voorkant';

  @override
  String get patch3dCameraViewTop => 'Boven';

  @override
  String get patch3dCameraViewSide => 'Zijkant';

  @override
  String get patch3dCameraViewIso => 'Isometrisch';

  @override
  String get patch3dBackgroundColorLabel => 'Achtergrondkleur';

  @override
  String patch3dEntriesWithoutPosition(Object count) {
    return '$count fixture(s) zonder 3D-positie (geen Matrix in de MVR).';
  }

  @override
  String get patch3dNoPositionedFixtures =>
      'Geen gepositioneerde fixtures om weer te geven. Importeer een MVR met 3D-posities.';

  @override
  String get patch3dMissingModelTitle => 'Ontbrekende 3D-modellen';

  @override
  String patch3dMissingModelBody(Object count) {
    return '$count apparaattype(s) hebben geen 3D-model in hun GDTF. In plaats daarvan wordt een generieke kubus (30×30×30 cm) gebruikt:';
  }

  @override
  String get patch3dColorModeLabel => 'Kleuring';

  @override
  String get patch3dColorModeByType => 'Op type';

  @override
  String get patch3dColorModeByUniverse => 'Op universum';

  @override
  String get patch3dFilterUniverseLabel => 'Universum';

  @override
  String get patch3dFilterTypeLabel => 'Apparaattype';

  @override
  String get patch3dFilterShowAll => 'Alles tonen';

  @override
  String get gdtfWizardSuggestionOpen => 'Open';

  @override
  String get gdtfWizardSuggestionClosed => 'Gesloten';

  @override
  String gdtfWizardSuggestionGoboSlot(int n) {
    return 'Gobo $n';
  }

  @override
  String gdtfWizardSuggestionColorSlot(int n) {
    return 'Kleur $n';
  }

  @override
  String get gdtfWizardColorWhite => 'Wit';

  @override
  String get gdtfWizardColorRed => 'Rood';

  @override
  String get gdtfWizardColorGreen => 'Groen';

  @override
  String get gdtfWizardColorBlue => 'Blauw';

  @override
  String get gdtfWizardColorYellow => 'Geel';

  @override
  String get gdtfWizardColorCyan => 'Cyaan';

  @override
  String get gdtfWizardColorMagenta => 'Magenta';

  @override
  String get gdtfWizardColorRainbow => 'Regenboog';

  @override
  String get gdtfWizardStrobeSlowToFast => 'Strobe langzaam → snel';

  @override
  String get gdtfWizardStrobeRandom => 'Willekeurige strobe';

  @override
  String get gdtfWizardAppBarTitle => 'Handmatige GDTF-wizard';

  @override
  String get gdtfWizardStepTitleStyle => 'Type toestel';

  @override
  String get gdtfWizardStepTitleFunction => 'Functie';

  @override
  String get gdtfWizardStepTitleChannels => 'Kanalen';

  @override
  String get gdtfWizardStepTitlePixels => 'Pixels';

  @override
  String get gdtfWizardStepTitleStructure => 'Structuur';

  @override
  String gdtfWizardStepHeader(int step, String title) {
    return 'Stap $step/5 — $title';
  }

  @override
  String get gdtfWizardErrStyle => 'Kies een toesteltype om verder te gaan.';

  @override
  String get gdtfWizardErrFunction =>
      'Selecteer minstens één functie (wash, spot of beam).';

  @override
  String get gdtfWizardErrChannels =>
      'Vink minstens één kanaal aan — het toestel moet toch iets aansturen!';

  @override
  String get gdtfWizardErrPixelCount =>
      'Er zijn minstens 2 pixels/instanties nodig voor een multi-pixelstructuur.';

  @override
  String get gdtfWizardErrRepeatCount =>
      'Selecteer minstens 2 herhaalbare kanalen (bv. Red + Green, of Pan/Tilt) zodat elke pixel correct wordt herkend als aparte instantie.';

  @override
  String get gdtfWizardErrRowsCols =>
      'Voer een geldig aantal rijen en kolommen in.';

  @override
  String get gdtfWizardErrModeName => 'Geef deze DMX-modus een naam.';

  @override
  String get gdtfWizardStyleIntro => 'Welk type toestel maak je aan?';

  @override
  String get gdtfWizardStyleLyreTitle => 'Moving head';

  @override
  String get gdtfWizardStyleLyreSubtitle =>
      'Bewegende kop met pan/tilt — spot, wash of beam moving head.';

  @override
  String get gdtfWizardStyleParTitle => 'PAR / Vast';

  @override
  String get gdtfWizardStyleParSubtitle =>
      'Statisch toestel, zonder beweging (LED PAR, vaste profielspot…).';

  @override
  String get gdtfWizardStyleBarreTitle => 'Balk';

  @override
  String get gdtfWizardStyleBarreSubtitle =>
      'Lineaire balk, vaak met pixels (LED-balk, X4 Bar…).';

  @override
  String get gdtfWizardPanTiltCheckTitle =>
      'Dit toestel heeft een Pan/Tilt-motor';

  @override
  String get gdtfWizardPanTiltCheckSubtitle =>
      'Voegt de Pan/Tilt-kanalen in 16 bit toe (GDTF-norm).';

  @override
  String get gdtfWizardFunctionIntro =>
      'Welke functie(s) heeft dit toestel? (meerdere keuzes mogelijk)';

  @override
  String get gdtfWizardFunctionWash => 'Wash';

  @override
  String get gdtfWizardFunctionSpot => 'Spot';

  @override
  String get gdtfWizardFunctionBeam => 'Beam';

  @override
  String get gdtfWizardFunctionHint =>
      'Dit vinkt gewoon nuttige kanalen aan voor de volgende stap (Wash → Frost/Zoom, Spot → Gobo/Focus/Prisma, Beam → smalle bundel). Je kan daarna alles aanpassen.';

  @override
  String get gdtfWizardChannelsIntro =>
      'Vink de DMX-kanalen van het toestel aan.';

  @override
  String get gdtfWizardSectionIntensity => 'INTENSITEIT';

  @override
  String get gdtfWizardChannelDimmer => 'Dimmer';

  @override
  String get gdtfWizardChannelStrobe => 'Shutter / Strobe';

  @override
  String get gdtfWizardSectionColor => 'KLEUR';

  @override
  String get gdtfWizardChannelCto => 'CTO-wiel (kleurtemperatuur)';

  @override
  String get gdtfWizardChannelColorMacro => 'Kleurmacro (presets)';

  @override
  String get gdtfWizardSectionPosition => 'POSITIE';

  @override
  String get gdtfWizardPanTiltNote =>
      'Pan/Tilt wordt automatisch toegevoegd (16 bit). Voor een toestel met meerdere onafhankelijke bewegende koppen kan je dit per kop verdelen in de stap Pixels.';

  @override
  String get gdtfWizardSectionBeamShaping => 'BUNDEL';

  @override
  String get gdtfWizardChannelZoom => 'Zoom';

  @override
  String get gdtfWizardChannelFocus => 'Focus';

  @override
  String get gdtfWizardChannelIris => 'Iris';

  @override
  String get gdtfWizardChannelFrost => 'Frost';

  @override
  String get gdtfWizardChannelPrism => 'Prisma';

  @override
  String get gdtfWizardChannelPrismRot => 'Prismarotatie';

  @override
  String get gdtfWizardSectionGobos => 'GOBO\'S';

  @override
  String get gdtfWizardChannelGobo1 => 'Gobowiel 1';

  @override
  String get gdtfWizardChannelGobo1Rot => 'Gobo 1-rotatie';

  @override
  String get gdtfWizardChannelGobo2 => 'Gobowiel 2';

  @override
  String get gdtfWizardChannelGobo2Rot => 'Gobo 2-rotatie';

  @override
  String get gdtfWizardSectionEffectsControl => 'EFFECTEN & BEDIENING';

  @override
  String get gdtfWizardChannelEffects => 'Effecten / macro\'s';

  @override
  String get gdtfWizardChannelReset => 'Reset';

  @override
  String get gdtfWizardSlotsHint =>
      'Slots (één per regel, optioneel) — bv. Open, Gobo 1…';

  @override
  String get gdtfWizardSlotsTooltip => 'Suggestie';

  @override
  String get gdtfWizardChannelPanTiltPerHead => 'Pan/Tilt (per kop)';

  @override
  String get gdtfWizardPixelsIntro =>
      'Heeft dit toestel meerdere afzonderlijk aanstuurbare pixels/cellen (LED-matrix, pixelbalk…)?';

  @override
  String get gdtfWizardMultiplePixelsTitle => 'Meerdere pixels / instanties';

  @override
  String get gdtfWizardMultiplePixelsSubtitle =>
      'Anders blijven alle in de vorige stap aangevinkte kanalen uniek (één enkele uitgang).';

  @override
  String get gdtfWizardSectionPixelCount => 'AANTAL PIXELS';

  @override
  String get gdtfWizardSectionPixelContent => 'INHOUD VAN ÉÉN PIXEL';

  @override
  String get gdtfWizardNoRepeatableChannels =>
      'Nog geen herhaalbaar kanaal. Ga terug naar de stap “Stijl” (Pan/Tilt) of “Kanalen” (Dimmer, Shutter/Strobe, kleur…) en vink minstens één attribuut aan om per kop/pixel te herhalen.';

  @override
  String gdtfWizardRepeatPerPixelSubtitle(String label) {
    return 'Eén kanaal per pixel (bv. $label 1, $label 2…)';
  }

  @override
  String get gdtfWizardRepeatGlobalSubtitle =>
      'Blijft één globaal kanaal voor het hele toestel';

  @override
  String get gdtfWizardModeNameLabel => 'Naam van de DMX-modus';

  @override
  String get gdtfWizardModeNameHint => 'bv. Standard, 16-bit, Pixel Mode…';

  @override
  String get gdtfWizardSingleOutputNote =>
      'Toestel met één uitgang (geen meerdere pixels): hier valt niets te configureren, elk aangevinkt kanaal blijft uniek.';

  @override
  String get gdtfWizardSectionLayout => 'INDELING';

  @override
  String get gdtfWizardArrangementLinearTitle => 'Lineaire balk';

  @override
  String gdtfWizardArrangementLinearSubtitle(int count) {
    return 'Pixels op een rij (bv. X4 Bar). Genummerd van 1 tot $count.';
  }

  @override
  String get gdtfWizardArrangementMatrixTitle => 'Matrix (raster)';

  @override
  String get gdtfWizardArrangementMatrixSubtitle =>
      'Pixels ingedeeld in rijen × kolommen (bv. LED-wand, JDC1 pixel curve).';

  @override
  String get gdtfWizardArrangementModulesTitle => 'Onafhankelijke modules';

  @override
  String get gdtfWizardArrangementModulesSubtitle =>
      'Meerdere identieke koppen/modules op hetzelfde chassis (bv. JDC1).';

  @override
  String get gdtfWizardRowsLabel => 'Rijen';

  @override
  String get gdtfWizardColsLabel => 'Kolommen';

  @override
  String gdtfWizardMatrixTotal(int count) {
    return 'Totaal: $count pixels (genummerd rij per rij).';
  }

  @override
  String get gdtfWizardModulesNote =>
      'Elke module kan zijn eigen kleur/dimmer/strobe hebben ÉN zijn eigen zoom/focus/iris/frost/prisma/gobo — ga terug naar de stap “Pixels” en vink voor elk betrokken bundelkanaal aan dat het per module moet herhalen in plaats van gemeenschappelijk te blijven.';

  @override
  String get gdtfWizardCancel => 'Annuleren';

  @override
  String get gdtfWizardBack => 'Terug';

  @override
  String get gdtfWizardValidateAndEdit => 'Bevestigen en bewerken';

  @override
  String get gdtfWizardNext => 'Volgende';

  @override
  String get gdtfWizardDefaultModeName => 'Handmatig';

  @override
  String get gdtfWizardOrDivider => 'OF';

  @override
  String get gdtfWizardManualButtonLabel =>
      'Handmatige wizard (zonder PDF) — stijl, kanalen, pixels…';

  @override
  String get gdtfWizardColorModeNone => 'Geen';

  @override
  String get gdtfWizardColorModeRgb => 'RGB';

  @override
  String get gdtfWizardColorModeRgbw => 'RGB + Wit';

  @override
  String get gdtfWizardColorModeRgbwaUv => 'RGB + Wit + Amber + UV';

  @override
  String get gdtfWizardColorModeCmy => 'CMY (Cyaan/Magenta/Geel)';

  @override
  String get gdtfWizardColorModeWheel => 'Kleurenwiel';

  @override
  String get gdtfWizardColorAmber => 'Amber';

  @override
  String get gdtfWizardColorUv => 'UV';

  @override
  String get gdtfWizardChannelCtoShort => 'CTO';

  @override
  String get gdtfManualTab => 'Handmatige wizard';

  @override
  String get gdtfWizardManualTabTitle => 'GDTF maken zonder PDF';

  @override
  String get gdtfWizardManualTabIntro =>
      'Geen PDF-handleiding bij de hand, of is het toestel daar te simpel voor? Beschrijf je fixture in 5 stappen (stijl, functies, kanalen, pixels, structuur) en de app bouwt direct een conform GDTF-bestand — zonder AI, zonder upload.';

  @override
  String get gdtfWizardSlotsAddButton => 'Toevoegen';

  @override
  String get gdtfWizardSlotsRowHint => 'Naam van de slot';

  @override
  String get gdtfWizardSlotsRemoveTooltip => 'Verwijderen';

  @override
  String get gdtfWizardSlotsEmptyHint =>
      'Nog geen benoemde slots — voeg er een toe of gebruik een suggestie.';

  @override
  String get ma3CalcTitle => 'MA3-parameters';

  @override
  String get ma3CalcTileDescription =>
      'Hoeveel parameters heeft je show nodig, en hoeveel PU\'s?';

  @override
  String get ma3CalcTabMvr => 'Vanuit MVR';

  @override
  String get ma3CalcTabList => 'Armaturenlijst';

  @override
  String get ma3CalcAddFixture => 'Armatuur toevoegen';

  @override
  String get ma3CalcAddSheetTitle => 'Welk armatuur?';

  @override
  String get ma3CalcAddSheetSubtitle =>
      'Zoek in GDTF Share, importeer een .gdtf of vul de waarde zelf in.';

  @override
  String get ma3CalcSearchHint => 'bv. MAC Aura, Robe Spiider…';

  @override
  String get ma3CalcSearchFailed =>
      'Zoeken lukt nu niet. Controleer je verbinding.';

  @override
  String get ma3CalcNoResult =>
      'Geen resultaten. Probeer een andere naam of handmatige invoer.';

  @override
  String get ma3CalcImportGdtf => '.gdtf-bestand';

  @override
  String get ma3CalcManualEntry => 'Handmatig';

  @override
  String get ma3CalcManualName => 'Naam armatuur';

  @override
  String get ma3CalcChooseMode => 'Welke DMX-modus?';

  @override
  String ma3CalcModeSummary(int params, int channels) {
    return '$params MA3-param. · $channels DMX-kanalen';
  }

  @override
  String get ma3CalcModeUnknown => 'Modus zonder leesbare kanalen';

  @override
  String get ma3CalcHowMany => 'Hoeveel armaturen?';

  @override
  String get ma3CalcDownloadFailed => 'GDTF downloaden mislukt.';

  @override
  String get ma3CalcGdtfUnreadable =>
      'Deze GDTF is onleesbaar (bestand beschadigd?).';

  @override
  String get ma3CalcGdtfNoMode => 'Geen DMX-modus in deze GDTF.';

  @override
  String ma3CalcNotGdtf(String name) {
    return '\"$name\" is geen .gdtf-bestand.';
  }

  @override
  String ma3CalcNotMvr(String name) {
    return '\"$name\" is geen .mvr-bestand.';
  }

  @override
  String get ma3CalcPickFailed => 'Bestand openen mislukt.';

  @override
  String get ma3CalcMvrUnreadable =>
      'Deze MVR is onleesbaar (geen geldig archief).';

  @override
  String get ma3CalcMvrNoScene =>
      'Geen GeneralSceneDescription.xml in deze MVR.';

  @override
  String get ma3CalcMvrNoFixtures => 'Geen armaturen in deze MVR.';

  @override
  String get ma3CalcMvrEmptyTitle => 'Laad je MVR 🎛️';

  @override
  String get ma3CalcMvrEmptyBody =>
      'Export uit Vectorworks, Capture, grandMA3, Depence… We tellen de armaturen, lezen hun GDTF\'s en zeggen hoeveel parameters (en PU\'s) je nodig hebt.';

  @override
  String get ma3CalcPickMvr => 'Kies een .mvr-bestand';

  @override
  String get ma3CalcChangeFile => 'Wijzigen';

  @override
  String get ma3CalcListEmptyTitle => 'Je rig, armatuur per armatuur';

  @override
  String get ma3CalcListEmptyBody =>
      'Zoals 6 × MAC Aura, 23 × Studio Color… Voeg je armaturen toe, kies de modus en het totaal verschijnt vanzelf.';

  @override
  String get ma3CalcYourSystem => 'Je console';

  @override
  String get ma3CalcSafetyMargin => 'Veiligheidsmarge';

  @override
  String get ma3CalcNoMargin => 'Geen';

  @override
  String get ma3CalcTotalParams => 'MA3-parameters';

  @override
  String ma3CalcFixturesAndUniverses(int fixtures, int universes) {
    return '$fixtures armaturen · ≈ $universes DMX-universes';
  }

  @override
  String ma3CalcWithMargin(int percent, String value) {
    return 'Met $percent% marge: $value';
  }

  @override
  String get ma3CalcCopySummary => 'Samenvatting kopiëren';

  @override
  String ma3CalcVerdictSessionMax(String max) {
    return 'Meer dan $max parameters: dat is het maximum van een grandMA3-sessie.';
  }

  @override
  String ma3CalcVerdictOnPcTooSmall(String max) {
    return 'onPC stopt bij $max parameters';
  }

  @override
  String get ma3CalcVerdictOnPcTooSmallSub =>
      'Je hebt een grandMA3-console nodig (+ PU\'s indien nodig): kies er hierboven een om de setup te zien.';

  @override
  String get ma3CalcVerdictOnPcOk => 'onPC volstaat 👌';

  @override
  String ma3CalcVerdictOnPcOkSub(String max) {
    return 'Elke onPC-hardware (command wing, fader wing, node 4k, rack-unit…) ontgrendelt $max parameters.';
  }

  @override
  String ma3CalcVerdictBaseOk(String console) {
    return 'Je $console volstaat, geen PU nodig 🎉';
  }

  @override
  String ma3CalcVerdictCapacity(String capacity) {
    return 'Totale capaciteit: $capacity parameters.';
  }

  @override
  String ma3CalcVerdictAddPu(String units) {
    return 'Voeg $units toe';
  }

  @override
  String ma3CalcVerdictXlOnly(int count) {
    return 'Of eenvoudiger: $count × PU XL.';
  }

  @override
  String ma3CalcUnknownNotCounted(int count) {
    return '$count armatu(u)r(en) zonder gegevens worden niet meegeteld: corrigeer ze hieronder.';
  }

  @override
  String ma3CalcFixtureTypes(int count) {
    return 'Armatuurtypes ($count)';
  }

  @override
  String ma3CalcMvrCounts(int fixtures, int unpatched) {
    return '$fixtures armaturen · $unpatched niet gepatcht';
  }

  @override
  String ma3CalcMultipatchNote(int count) {
    return 'Waarvan $count multipatch, voor de zekerheid meegeteld.';
  }

  @override
  String ma3CalcPerUnit(int params) {
    return '$params param. per armatuur';
  }

  @override
  String get ma3CalcUnknownParams => 'Parameters onbekend';

  @override
  String get ma3CalcTapToFix => 'Tik om de waarde zelf in te vullen →';

  @override
  String get ma3CalcSwipeHint =>
      'Veeg een regel naar links om te verwijderen · tik om de parameters te corrigeren.';

  @override
  String get ma3CalcClear => 'Wissen';

  @override
  String get ma3CalcClearListTitle => 'Lijst wissen?';

  @override
  String get ma3CalcClearListBody =>
      'Alle armaturen in de lijst worden verwijderd.';

  @override
  String get ma3CalcCancel => 'Annuleren';

  @override
  String get ma3CalcOk => 'OK';

  @override
  String get ma3CalcParamsPerUnitTitle => 'Parameters per armatuur';

  @override
  String get ma3CalcParamsUnit => 'param.';

  @override
  String ma3CalcGdtfValue(int value) {
    return 'Waarde berekend uit de GDTF: $value';
  }

  @override
  String get ma3CalcParamsHelp =>
      'Tip: 1 parameter = 1 DMX-kanaal, 16-bit \"fine\"-kanalen tellen niet mee.';

  @override
  String get ma3CalcBackToGdtf => 'GDTF-waarde';

  @override
  String get ma3CalcReliabilityOkTitle => 'GDTF\'s lijken compleet ✅';

  @override
  String get ma3CalcReliabilityOkBody =>
      'Alle modi gevonden en consistent. De berekening blijft gebaseerd op deze GDTF\'s.';

  @override
  String ma3CalcReliabilityWarnTitle(int count) {
    return '$count armatuurtype(s) te controleren';
  }

  @override
  String get ma3CalcReliabilityWarnBody =>
      'Sommige GDTF\'s lijken onvolledig of inconsistent: het totaal kan fout zijn. Details onder elk armatuur.';

  @override
  String ma3CalcReliabilityBadTitle(int count) {
    return '$count armatuurtype(s) zonder gegevens';
  }

  @override
  String get ma3CalcReliabilityBadBody =>
      'GDTF ontbreekt of modus niet gevonden: deze armaturen tellen niet mee, dus het totaal is te laag. Tik erop om de waarde in te vullen.';

  @override
  String get ma3CalcDisclaimer =>
      'De berekening is gebaseerd op de GDTF\'s. Is een GDTF onvolledig of fout, dan is het resultaat dat ook. Controleer altijd in de grandMA3 (venster System Information of Patch › DMX Universes, kolom Coarse Params).';

  @override
  String get ma3CalcDisclaimerShort =>
      'Gebaseerd op de GDTF\'s: controleer in de grandMA3.';

  @override
  String get ma3CalcHowTitle => 'Hoe wordt het berekend?';

  @override
  String get ma3CalcHowBody =>
      'Voor grandMA3 geldt: 1 parameter = 1 aangestuurd attribuut = 1 \"coarse\" DMX-kanaal. Fine-kanalen (16/24-bit) zijn gratis en virtuele kanalen (virtuele dimmer…) tellen niet voor de licentie. Multi-instance armaturen (pixels, cellen) worden per instance uitgeklapt. Het advies kiest zo weinig mogelijk units.';

  @override
  String get ma3CalcHowHardware => 'Parameters per hardware (MA-docs, v2.3)';

  @override
  String ma3CalcHowSessionMax(String max) {
    return 'Maximum per sessie: $max';
  }

  @override
  String get ma3CalcIssueGdtfMissing =>
      'GDTF ontbreekt in de MVR: parameters onbekend.';

  @override
  String get ma3CalcIssueUnreadable => 'GDTF onleesbaar.';

  @override
  String ma3CalcIssueModeMissing(String modes) {
    return 'Geen modus in de MVR. GDTF-modi: $modes';
  }

  @override
  String ma3CalcIssueModeNotFound(String mode, String modes) {
    return 'Modus \"$mode\" niet gevonden in de GDTF. Beschikbaar: $modes';
  }

  @override
  String get ma3CalcIssueModeGuessed =>
      'Geen modus in de MVR: de enige GDTF-modus is gebruikt.';

  @override
  String ma3CalcIssueModePartial(String mode) {
    return 'Modus gevonden via gelijkaardige naam: \"$mode\".';
  }

  @override
  String get ma3CalcIssueNoChannels => 'Deze modus heeft geen DMX-kanalen.';

  @override
  String ma3CalcIssueNoFunction(int count) {
    return '$count kana(a)l(en) zonder functie of attribuut: GDTF waarschijnlijk onvolledig.';
  }

  @override
  String ma3CalcIssueOverlap(int count) {
    return '$count kana(a)l(en) op een al bezet DMX-adres: inconsistente GDTF.';
  }

  @override
  String ma3CalcIssueGaps(int count) {
    return '$count lege DMX-adres(sen) in de modus: ontbrekende kanalen?';
  }

  @override
  String ma3CalcIssueNameMismatch(int announced, int found) {
    return 'De modusnaam zegt $announced kanalen, de GDTF beschrijft er $found.';
  }

  @override
  String ma3CalcIssueUnknownGeometry(int count) {
    return '$count kana(a)l(en) gekoppeld aan een ontbrekende geometrie.';
  }

  @override
  String get ma3CalcIssueManual => 'Waarde handmatig ingevuld.';

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
    return 'onPC: max. $max (met elke onPC-hardware)';
  }

  @override
  String get accountSignInCta => 'Inloggen';

  @override
  String get accountSignInCtaSubtitle =>
      'Je Pro en plugins, op al je toestellen ✨';

  @override
  String get accountAuthTitle => 'Je ShowTech-account';

  @override
  String get accountAuthSubtitle =>
      'Log in om je Pro-abonnement terug te vinden\nen mee te doen met de community.';

  @override
  String get accountSignedInSnack => 'Ingelogd! Welkom aan boord 🎉';

  @override
  String get accountSignedOutSnack => 'Uitgelogd. Tot snel 👋';

  @override
  String get accountSignOutConfirmTitle => 'Uitloggen?';

  @override
  String get accountSignOutConfirmBody =>
      'Je Pro-abonnement blijft gekoppeld aan je Google-account: log gewoon opnieuw in om het terug te krijgen.';

  @override
  String get videoLmCalcDistTitle => 'Projectieafstand (Ratio × Scherm)';

  @override
  String get videoLmSizeModeLabel => 'Bekende schermgrootte';

  @override
  String get videoLmModeWidth => 'Breedte';

  @override
  String get videoLmModeHeight => 'Hoogte';

  @override
  String get videoLmModeDiagonal => 'Diagonaal';

  @override
  String get videoLmImageHeightLabel => 'Beeldhoogte (m)';

  @override
  String get videoLmImageHeightHint => 'bv. 3.375';

  @override
  String get videoLmDiagonalLabel => 'Diagonaal (inch)';

  @override
  String get videoLmDiagonalHint => 'bv. 200';

  @override
  String get videoLmRatioMinLabel => 'Projectieverhouding (of min. bij zoom)';

  @override
  String get videoLmRatioMaxLabel => 'Max. verhouding (optioneel, zoom)';

  @override
  String get videoLmRatioMaxHint => 'bv. 2.10';

  @override
  String get videoLmErrMissingSizeRatio =>
      '❌ Ontbrekende gegevens: Schermgrootte + Verhouding.';

  @override
  String get videoLmErrSizeGt0 => '❌ Schermgrootte moet > 0 zijn.';

  @override
  String videoLmResultImage(Object width, Object height, Object format) {
    return '📐 Beeld: $width × $height m ($format)';
  }

  @override
  String videoLmResultDistance(Object distance) {
    return '✅ Afstand = $distance m';
  }

  @override
  String videoLmResultDistanceRange(Object min, Object max) {
    return '✅ Afstand: van $min m tot $max m';
  }

  @override
  String get videoLmDistanceNote =>
      'ℹ️ Afstand gemeten vanaf de lens: controleer het referentiepunt van de fabrikant (voorkant lens of behuizing).';

  @override
  String get menuViewModeList => 'Lijstweergave';

  @override
  String get menuViewModeGrid => 'Rasterweergave';

  @override
  String get audioRt60Subtitle => 'Nagalmtijd van een zaal';

  @override
  String get audioSplMeterSubtitle =>
      'Meet het geluidsniveau met de microfoon van je telefoon';

  @override
  String get audioImpedanceSubtitle => 'Luidsprekers in serie of parallel';

  @override
  String get audioCrossoverSubtitle => 'Kantelfrequenties en filters';

  @override
  String get audioDelayTimeSubtitle => 'Delaytijden afgestemd op het tempo';

  @override
  String get audioNoiseDoseSubtitle => 'Geluidsblootstelling en maximale duur';

  @override
  String get audioInputListSubtitle => 'Maak en deel je inputlijst';

  @override
  String get networkPoeSubtitle => 'PoE-vermogensbudget van een switch';

  @override
  String get networkFiberSubtitle =>
      'Verliezen en marge van een glasvezelverbinding';

  @override
  String get networkSubnetSubtitle => 'Masker, adresbereik en broadcast';

  @override
  String get networkArtNetAddressingSubtitle =>
      'DMX-universe ↔ Net / Sub-Net / Universe';

  @override
  String get rdmPageSubtitle => 'RDM-apparaten zoeken en instellen';

  @override
  String get rfSplitterSubtitle => 'Invoegverlies van splitters en combiners';

  @override
  String get rfCableAntennaSubtitle => 'Kabelverlies en antenneversterking';

  @override
  String get rfPlannerSubtitle =>
      'Draadloos frequentieplan zonder intermodulatie';

  @override
  String get timecodeToolConverterSubtitle =>
      'Timecode omzetten tussen framerates';

  @override
  String get timecodeToolMathSubtitle =>
      'Timecode optellen, aftrekken en verschuiven';

  @override
  String get timecodeToolDelaySubtitle => 'Frames en milliseconden omzetten';

  @override
  String get timecodeToolCountdownSubtitle => 'Aftellen tot een timecode';

  @override
  String get filterCorrespondenceSubtitle =>
      'Equivalenten tussen filterreeksen';

  @override
  String get ma3CalcEditSheetTitle => 'DIT TOESTEL BEWERKEN';

  @override
  String get ma3CalcActionChangeMode => 'Modus wijzigen';

  @override
  String get ma3CalcActionChangeModeSub =>
      'Toestel behouden, andere DMX-modus kiezen';

  @override
  String get ma3CalcActionChangeType => 'Toestel wijzigen (GDTF)';

  @override
  String get ma3CalcActionChangeTypeSub =>
      'GDTF vervangen of toevoegen: GDTF Share of bestand';

  @override
  String get ma3CalcActionManual => 'Parameters handmatig invoeren';

  @override
  String get ma3CalcActionManualSub => 'Een waarde per toestel forceren';

  @override
  String get ma3CalcNeedGdtfFirst =>
      'Geen GDTF voor dit toestel: kies het eerst.';

  @override
  String get ma3CalcReplaceSheetTitle => 'Toestel kiezen';

  @override
  String ma3CalcLineUpdated(Object label) {
    return '✅ $label bijgewerkt';
  }

  @override
  String get audioPickAmplifier => 'Kies een versterker';

  @override
  String get audioPickSpeaker => 'Kies een luidspreker';

  @override
  String get audioSearchBrandModel => 'Zoek merk of model';

  @override
  String get audioCustomPreset => 'Aangepast';

  @override
  String get audioCustomPresetHint => 'Eigen waarden invoeren';

  @override
  String audioModelsCount(Object count) {
    return '$count modellen';
  }

  @override
  String get audioNoResults => 'Geen resultaten';

  @override
  String audioChannelsCount(Object count) {
    return '$count kanalen';
  }

  @override
  String audioRecommendedAmp(Object range) {
    return 'Aanbevolen versterker: $range';
  }

  @override
  String audioPowerHandling(Object watts) {
    return 'Belastbaarheid: $watts W';
  }

  @override
  String get audioNoPowerData =>
      'Belastbaarheid niet gepubliceerd door de fabrikant: alleen de impedantie wordt gecontroleerd. Gebruik de presets / controllers van de fabrikant.';

  @override
  String get audioActiveSection =>
      'Actief aangestuurde kast: één versterkerkanaal per sectie.';

  @override
  String audioStatusZTooLow(Object diff) {
    return '✗  Z te laag (−$diff Ω)';
  }

  @override
  String audioStatusOkPct(Object pct) {
    return '✓  OK ($pct% RMS)';
  }

  @override
  String audioStatusUnderpowered(Object pct) {
    return '↓  Te weinig vermogen ($pct% RMS)';
  }

  @override
  String audioStatusHeadroom(Object ratio) {
    return '✓  Reserve ×$ratio';
  }

  @override
  String audioStatusOverpowered(Object ratio) {
    return '✗  Te veel vermogen ×$ratio';
  }

  @override
  String get audioStatusInRange => '✓  Binnen fabrieksbereik';

  @override
  String get audioStatusBelowRange => '↓  Onder aanbevolen bereik';

  @override
  String get audioStatusAboveRange => '⚠  Boven aanbevolen bereik';

  @override
  String get audioStatusZOkNoData => '✓  Z OK — P niet gepubliceerd';

  @override
  String audioStatusLimiterRequired(Object ratio) {
    return '⚠  ×$ratio — limiter vereist';
  }

  @override
  String get catalogSearchHint => 'Zoek merk, model, type…';

  @override
  String get catalogSearchNoResults => 'Geen resultaten';

  @override
  String catalogSearchResultsCount(Object count) {
    return '$count resultaten';
  }

  @override
  String get soundCatalogTitle => 'Geluidscatalogus';

  @override
  String get soundCatalogSubtitle =>
      'Versterkers en luidsprekers: specificaties en handleidingen';

  @override
  String get laserCatalogTitle => 'Lasercatalogus';

  @override
  String get laserCatalogSubtitle =>
      'Laserprojectoren: vermogen, straal, divergentie';

  @override
  String get catalogAmplifiers => 'Versterkers';

  @override
  String get catalogSpeakers => 'Luidsprekers';

  @override
  String get catalogUseValues => 'Gebruiken';

  @override
  String get laserPickFromCatalog => 'Kiezen uit catalogus';

  @override
  String get laserCatalogDisclaimer =>
      'Door de fabrikant opgegeven waarden, niet gemeten.';

  @override
  String get laserCatalogMissingValues =>
      'Straaldiameter of divergentie niet gepubliceerd voor deze laser: vul ze handmatig in.';

  @override
  String get catalogFieldChannels => 'Kanalen';

  @override
  String get catalogFieldPowerPerChannel => 'Vermogen per kanaal';

  @override
  String get catalogFieldType => 'Type';

  @override
  String get catalogFieldSection => 'Sectie';

  @override
  String get catalogFieldPowerHandling => 'Belastbaarheid (RMS/AES)';

  @override
  String get catalogFieldRecommendedAmp => 'Aanbevolen versterker';

  @override
  String get catalogFieldOpticalPower => 'Optisch vermogen';

  @override
  String get catalogFieldColors => 'Kleuren';

  @override
  String get catalogFieldScanner => 'Scanners';

  @override
  String get catalogFieldClass => 'Laserklasse';

  @override
  String get catalogFieldConsumption => 'Verbruik';

  @override
  String get homeSafetyTitle => 'Veiligheid';

  @override
  String get homeSafetySubtitle => 'Veiligheidsplannen, montageattest';

  @override
  String get subscriptionCategorySafetyTitle => 'Veiligheid';

  @override
  String get subscriptionCategorySafetyDescription =>
      'Veiligheidsplannen, montageattest met foto\'s, voorbehouden en handtekening, PDF-export.';

  @override
  String get subscriptionHeadlineSafetySubtitle =>
      'Stel uw veiligheidsplannen en montageattesten op locatie op, met ondertekende PDF-export.';

  @override
  String get safetyPageTitle => 'Veiligheid';

  @override
  String get safetySectionDocuments => 'Documenten';

  @override
  String get safetyPpspsTitle => 'Veiligheidsplannen';

  @override
  String get safetyPpspsSubtitle =>
      'PPSPS (Frankrijk), veiligheidsplan (België)';

  @override
  String get safetyAttestationTitle => 'Montageattest';

  @override
  String get safetyAttestationSubtitle =>
      'Controles, voorbehouden en handtekening';

  @override
  String get safetyComingSoon => 'Beschikbaar in een volgende versie.';

  @override
  String get safetyLibraryTitle => 'Bibliotheek';

  @override
  String safetyLibrarySummary(Object risks, Object measures, Object controls) {
    return '$risks risico\'s · $measures maatregelen · $controls controlepunten';
  }

  @override
  String safetyLibraryUpdated(Object date) {
    return 'Bijgewerkt: $date';
  }

  @override
  String get safetyLibraryOffline => 'Lokale kopie, werkt offline';

  @override
  String get safetyDisclaimer =>
      'Hulpmiddel bij het opstellen. De inhoud van de documenten blijft de verantwoordelijkheid van het ondertekenende bedrijf.';

  @override
  String get ppspsListTitle => 'Veiligheidsplannen';

  @override
  String get ppspsNew => 'Nieuw plan';

  @override
  String get ppspsEmptyTitle => 'Nog geen plannen';

  @override
  String get ppspsEmptyBody =>
      'Maak uw eerste veiligheidsplan. Daarna kunt u het dupliceren voor volgende evenementen.';

  @override
  String get ppspsChooseCountry => 'Land van de werf';

  @override
  String get ppspsStatusDraft => 'Concept';

  @override
  String get ppspsStatusFinal => 'Afgerond';

  @override
  String ppspsStepProgress(Object done, Object total) {
    return 'Stap $done/$total';
  }

  @override
  String get ppspsUntitled => 'Naamloos';

  @override
  String get ppspsDuplicate => 'Dupliceren';

  @override
  String get ppspsDelete => 'Verwijderen';

  @override
  String get ppspsDeleteConfirm =>
      'Dit plan verwijderen? Dit kan niet ongedaan worden gemaakt.';

  @override
  String get ppspsCancel => 'Annuleren';

  @override
  String get ppspsSave => 'Opslaan';

  @override
  String get ppspsNext => 'Volgende';

  @override
  String get ppspsPrevious => 'Vorige';

  @override
  String get ppspsStepProject => 'Project';

  @override
  String get ppspsStepWorkers => 'Uitvoerders';

  @override
  String get ppspsStepRisks => 'Risico\'s';

  @override
  String get ppspsStepEmergency => 'Hulpdiensten';

  @override
  String get ppspsStepExport => 'Export';

  @override
  String get ppspsFieldEventName => 'Naam van het evenement';

  @override
  String get ppspsFieldVenue => 'Locatie';

  @override
  String get ppspsFieldAddress => 'Adres';

  @override
  String get ppspsFieldOrganizer => 'Organisator (opdrachtgever)';

  @override
  String get ppspsFieldCoordinator => 'Veiligheidscoördinator';

  @override
  String get ppspsSectionPhases => 'Fasen en data';

  @override
  String get ppspsPhaseMontage => 'Opbouw';

  @override
  String get ppspsPhaseExploitation => 'Evenement';

  @override
  String get ppspsPhaseDemontage => 'Afbouw';

  @override
  String get ppspsPhaseNotSet => 'Niet gepland';

  @override
  String get ppspsPhaseFilterAll => 'Alle';

  @override
  String get ppspsSectionCompany => 'Uw bedrijf';

  @override
  String get ppspsFieldCompanyName => 'Bedrijfsnaam';

  @override
  String get ppspsFieldCompanyActivity => 'Activiteit op de werf';

  @override
  String get ppspsFieldResponsible => 'Verantwoordelijke ter plaatse';

  @override
  String get ppspsFieldPhone => 'Telefoon';

  @override
  String get ppspsFieldCompany => 'Bedrijf';

  @override
  String get ppspsFieldTrade => 'Vakgebied';

  @override
  String get ppspsFieldContact => 'Contactpersoon';

  @override
  String get ppspsFieldHeadcount => 'Aantal personen';

  @override
  String get ppspsAddWorker => 'Uitvoerder toevoegen';

  @override
  String get ppspsWorkersEmpty =>
      'Voeg de bedrijven en ploegen toe die op de werf aanwezig zijn.';

  @override
  String ppspsWorkersTotal(Object count) {
    return 'Totaal: $count personen';
  }

  @override
  String get ppspsMeasuresTitle => 'Preventiemaatregelen';

  @override
  String get ppspsMeasureCollective => 'Collectief';

  @override
  String get ppspsMeasureIndividual => 'Individueel';

  @override
  String get ppspsMeasureOrganisational => 'Organisatorisch';

  @override
  String ppspsMeasureCount(Object count) {
    return '$count maatregelen';
  }

  @override
  String get ppspsAddCustomMeasure => 'Maatregel toevoegen';

  @override
  String get ppspsCustomMeasureHint => 'Andere maatregel voor deze werf';

  @override
  String ppspsRisksSummary(Object risks, Object measures) {
    return '$risks risico\'s · $measures maatregelen';
  }

  @override
  String get ppspsSectionNumbers => 'Noodnummers';

  @override
  String get ppspsSectionHospital => 'Dichtstbijzijnde ziekenhuis';

  @override
  String get ppspsFieldHospitalName => 'Naam van het ziekenhuis';

  @override
  String get ppspsSectionOnSite => 'Ter plaatse';

  @override
  String get ppspsFieldFirstAiders => 'Aanwezige hulpverleners';

  @override
  String get ppspsFieldAssemblyPoint => 'Verzamelplaats';

  @override
  String get ppspsFieldEquipment => 'Noodmateriaal (blusmiddelen, AED…)';

  @override
  String get ppspsCritical => 'hoog';

  @override
  String get ppspsMedium => 'middel';

  @override
  String get ppspsLow => 'laag';

  @override
  String get ppspsExportReady => 'Alle stappen zijn ingevuld.';

  @override
  String get ppspsExportMissing => 'Nog in te vullen';

  @override
  String get ppspsExportPdf => 'Exporteren als PDF';

  @override
  String get ppspsMarkFinal => 'Markeren als afgerond';

  @override
  String get safetyCountryFR => 'Frankrijk';

  @override
  String get safetyCountryBE => 'België';

  @override
  String get safetyCountryUK => 'Verenigd Koninkrijk';

  @override
  String get safetyCountryLU => 'Luxemburg';

  @override
  String get safetyCountryDE => 'Duitsland';

  @override
  String get safetyCountryNL => 'Nederland';

  @override
  String get ppspsExportLanguages => 'Talen van het document';

  @override
  String get ppspsExportLanguagesHint =>
      'Voor elke aangevinkte taal wordt een PDF gemaakt.';

  @override
  String ppspsExportPdfMulti(Object count) {
    return '$count PDF\'s exporteren';
  }

  @override
  String get ppspsPhaseOrderError =>
      'De data volgen elkaar niet op: eerst opbouw, dan evenement, dan afbouw.';

  @override
  String get ppspsFindHospital => 'Dichtstbijzijnde ziekenhuis zoeken';

  @override
  String get ppspsFindHospitalSearching => 'Bezig met zoeken…';

  @override
  String get ppspsFindHospitalNeedAddress =>
      'Vul eerst de locatie of het adres van het evenement in (stap Project).';

  @override
  String get ppspsFindHospitalNoPlace =>
      'Het adres van het evenement is niet gevonden. Controleer het in de stap Project of vul het ziekenhuis handmatig in.';

  @override
  String get ppspsFindHospitalError =>
      'Zoeken lukt nu niet (verbinding?). Vul het ziekenhuis handmatig in.';

  @override
  String get ppspsFindHospitalNone =>
      'Geen ziekenhuis gevonden binnen 30 km. Vul het handmatig in.';

  @override
  String get ppspsFindHospitalTitle => 'Ziekenhuizen in de buurt';

  @override
  String get ppspsFindHospitalVerify =>
      'Controleer of het gekozen ziekenhuis tijdens het evenement een open spoedafdeling heeft.';

  @override
  String ppspsDistanceKm(Object km) {
    return '$km km';
  }

  @override
  String get ppspsHospitalEmergency => 'Spoedafdeling';

  @override
  String get ppspsOsmAttribution => 'Gegevens © OpenStreetMap-bijdragers';

  @override
  String get ppspsSectionEquipment => 'Noodmateriaal';

  @override
  String get ppspsFieldEquipmentDetails =>
      'Details (plaatsen, aantallen, ander materiaal)';

  @override
  String get ppspsSectionSignatures => 'Handtekeningen';

  @override
  String get ppspsSignAuthor => 'Opgesteld door';

  @override
  String get ppspsSignCoordinator => 'Visum van de coördinator (optioneel)';

  @override
  String get ppspsNotSigned => 'Nog niet ondertekend';

  @override
  String ppspsSignedOn(Object date) {
    return 'Ondertekend op $date';
  }

  @override
  String get ppspsSignButton => 'Ondertekenen';

  @override
  String get ppspsSignAgain => 'Opnieuw';

  @override
  String get ppspsSignRemove => 'Handtekening verwijderen';

  @override
  String get ppspsSignName => 'Naam van de ondertekenaar';

  @override
  String get ppspsSignHint => 'Onderteken met uw vinger in het witte vak.';

  @override
  String get ppspsSignClear => 'Wissen';

  @override
  String get ppspsSignValidate => 'Handtekening bevestigen';

  @override
  String get electricityToolPowerPlanTitle => 'Stroomplan';

  @override
  String get electricityToolPowerPlanSubtitle =>
      'Bouw je distributie vakje per vakje: bron, verdeelkasten, kabels, lasten. Synoptiek en lastentabel in één tik.';

  @override
  String get ppPageTitle => 'Stroomplan';

  @override
  String get ppTabPlan => 'Plan';

  @override
  String get ppTabSynoptic => 'Synoptiek';

  @override
  String get ppTabLoadTable => 'Lastentabel';

  @override
  String get ppDefaultPlanName => 'Mijn stroomplan';

  @override
  String get ppStartTitle => 'Begin met de stroombron ⚡';

  @override
  String get ppStartSubtitle =>
      'Aggregaat, netaansluiting of bestaand stopcontact. Daarna wordt elke vrije uitgang een +-vakje voor een verdeelkast of een toestel.';

  @override
  String get ppSourceSheetTitle => 'Stroombron';

  @override
  String get ppSourceGenerator => 'Aggregaat';

  @override
  String get ppSourceMains => 'Net / meter';

  @override
  String get ppSourceOutlet => 'Bestaand stopcontact';

  @override
  String get ppGeneratorSizeLabel => 'Vermogen aggregaat';

  @override
  String get ppMainsSizeLabel => 'Aansluitwaarde';

  @override
  String get ppOutletTypeLabel => 'Type stopcontact';

  @override
  String ppSourceCapacity(String amps, String kva) {
    return 'Beschikbaar: $amps A per fase · $kva kVA';
  }

  @override
  String get ppPhaseWord => 'fase';

  @override
  String get ppNameLabel => 'Naam';

  @override
  String get ppValidate => 'Aan de slag!';

  @override
  String get ppSave => 'Opslaan';

  @override
  String get ppDone => 'Klaar';

  @override
  String get ppDelete => 'Verwijderen';

  @override
  String get ppEdit => 'Bewerken';

  @override
  String get ppCopy => 'Kopiëren';

  @override
  String get ppRename => 'Hernoemen';

  @override
  String get ppDuplicate => 'Dupliceren';

  @override
  String get ppUnplug => 'Loskoppelen';

  @override
  String get ppExpand => 'Uitklappen';

  @override
  String get ppCollapse => 'Inklappen';

  @override
  String ppCollapsedHint(String count) {
    return '▸ Toon de $count uitgangen';
  }

  @override
  String ppCopied(String name) {
    return '📋 ‘$name’ gekopieerd: plak het op een vrij +-vakje';
  }

  @override
  String get ppConnectHere => 'Hier iets aansluiten';

  @override
  String ppConnectTitle(String connector) {
    return 'Aansluiten op $connector';
  }

  @override
  String get ppConnectPanel => 'Een verdeelkast';

  @override
  String get ppConnectPanelSubtitle =>
      'Verdeelkast, kast, stekkerdoos… met eigen uitgangen';

  @override
  String get ppConnectLoad => 'Een toestel';

  @override
  String get ppConnectLoadSubtitle =>
      'Licht, geluid, ledscherm, toiletten, catering, kantoren… je vult het vermogen in';

  @override
  String ppPasteTitle(String name) {
    return '‘$name’ plakken';
  }

  @override
  String get ppPasteSubtitle =>
      'Een volledige kopie, met alles wat eronder hangt';

  @override
  String get ppTemplateSheetTitle => 'Kies een verdeelkast';

  @override
  String get ppTemplateStrip => 'Stekkerdoos 6× Schuko';

  @override
  String get ppTemplateCustomTri => 'Eigen verdeelkast (3-fase)';

  @override
  String get ppTemplateCustomMono => 'Eigen verdeelkast (1-fase)';

  @override
  String get ppTemplateCustomSubtitle => 'Leeg: je voegt zelf de uitgangen toe';

  @override
  String get ppCompatOk => '✓ Direct';

  @override
  String get ppCompatAdapter => 'Adapter';

  @override
  String get ppLoadSheetTitle => 'Toestel aansluiten';

  @override
  String get ppLoadEditTitle => 'Toestel bewerken';

  @override
  String get ppCategoryLabel => 'Categorie';

  @override
  String get ppLoadNameHint => 'bv. Ledscherm podium, VIP-toiletten…';

  @override
  String get ppPowerLabel => 'Vermogen';

  @override
  String get ppCosPhiLabel => 'Arbeidsfactor';

  @override
  String get ppConnectAction => 'Aansluiten';

  @override
  String ppLoadPreviewTri(String amps) {
    return '≈ $amps A per fase (verdeeld over L1, L2, L3)';
  }

  @override
  String ppLoadPreviewMono(String amps) {
    return '≈ $amps A op één fase';
  }

  @override
  String get ppCatLighting => 'Licht';

  @override
  String get ppCatSound => 'Geluid';

  @override
  String get ppCatVideo => 'Video / led';

  @override
  String get ppCatStage => 'Rigging / motoren';

  @override
  String get ppCatCatering => 'Catering / bars';

  @override
  String get ppCatToilets => 'Sanitair';

  @override
  String get ppCatProduction => 'Productie / kantoren';

  @override
  String get ppCatHvac => 'Airco / verwarming';

  @override
  String get ppCatOther => 'Overig';

  @override
  String get ppOutputSheetTitle => 'Uitgang en kabel';

  @override
  String get ppConnectorLabel => 'Connector';

  @override
  String get ppBreakerLabel => 'Beveiliging (automaat)';

  @override
  String get ppRcdLabel => 'Differentieel 30 mA';

  @override
  String get ppPhaseLabel => 'Fase';

  @override
  String get ppPhaseInherited =>
      'Opgelegd door de 1-fase verdeelkast stroomopwaarts';

  @override
  String get ppCableLabel => 'Kabel';

  @override
  String get ppCableLengthLabel => 'Lengte';

  @override
  String ppAmpacityShort(String amps) {
    return '$amps A toelaatbaar (H07RN-F, indicatief)';
  }

  @override
  String get ppPanelSheetTitle => 'Verdeelkast';

  @override
  String get ppPanelInputLabel => 'Ingang';

  @override
  String get ppMainBreakerLabel => 'Hoofdschakelaar';

  @override
  String ppOutputsLabel(String count) {
    return 'Uitgangen ($count)';
  }

  @override
  String ppOutputsUsed(String used, String total) {
    return '$used/$total uitgangen gebruikt';
  }

  @override
  String get ppFreeOutput => 'vrij';

  @override
  String get ppAddOutputHint => 'Uitgang toevoegen:';

  @override
  String get ppAddOutput => 'Uitgang toevoegen';

  @override
  String get ppAddSourceOutput => 'Uitgang aan de bron toevoegen';

  @override
  String get ppAutoPhases => 'L1 / L2 / L3 automatisch verdelen';

  @override
  String get ppDeleteSourceTitle => 'Bron verwijderen?';

  @override
  String get ppDeleteSourceBody => 'Het hele plan eronder wordt gewist.';

  @override
  String get ppDeleteOutputTitle => 'Deze uitgang verwijderen?';

  @override
  String ppDeleteOutputBody(String name) {
    return '‘$name’ en alles eronder worden verwijderd.';
  }

  @override
  String get ppDeletePanelTitle => 'Deze verdeelkast loskoppelen?';

  @override
  String ppDeletePanelBody(String name) {
    return '‘$name’ en alles wat erop aangesloten is, worden uit het plan verwijderd.';
  }

  @override
  String get ppDeletePlanTitle => 'Dit plan verwijderen?';

  @override
  String ppDeletePlanBody(String name) {
    return '‘$name’ wordt definitief verwijderd.';
  }

  @override
  String get ppProjectsTitle => 'Mijn plannen';

  @override
  String get ppNewPlan => 'Nieuw plan';

  @override
  String get ppRenamePlan => 'Plan hernoemen';

  @override
  String ppPlanSummary(String panels, String kw) {
    return '$panels verdeelkast(en) · $kw kW';
  }

  @override
  String get ppKpiPower => 'Vermogen';

  @override
  String get ppKpiApparent => 'Schijnbaar vermogen';

  @override
  String get ppKpiMaxPhase => 'Zwaarste fase';

  @override
  String get ppKpiSourceUse => 'Bron gebruikt';

  @override
  String get ppKpiWorstDrop => 'Max. spanningsval';

  @override
  String get ppKpiGenerator => 'Aanbevolen aggregaat';

  @override
  String ppGeneratorOk(String kva) {
    return '👍 Je aggregaat volstaat (aanbevolen minimum: $kva kVA met 20 % marge)';
  }

  @override
  String ppGeneratorTooSmall(String kva) {
    return '🚨 Voorzie beter een aggregaat van $kva kVA (zwaarste fase + 20 % marge)';
  }

  @override
  String get ppAllGood => 'Alles in het groen, goed bezig! 🎉';

  @override
  String ppAllGoodWithTips(String count) {
    return 'Alles groen 🎉 · $count tip(s)';
  }

  @override
  String ppAlertsCount(String errors, String warnings) {
    return '$errors fout(en) · $warnings punt(en) om na te kijken';
  }

  @override
  String get ppAlertsTitle => 'Aandachtspunten';

  @override
  String get ppAllGoodPdf => 'Geen aandachtspunten.';

  @override
  String get ppAlertNoSource => 'Voeg eerst een stroombron toe.';

  @override
  String ppAlertSourceOverload(String amps, String limit) {
    return 'Bron overbelast: $amps A voor $limit A beschikbaar';
  }

  @override
  String ppAlertNearLimit(String percent, String amps, String limit) {
    return 'Belast op $percent % ($amps / $limit A)';
  }

  @override
  String ppAlertPanelOverload(String amps, String limit) {
    return 'Verdeelkast overbelast: $amps A op $limit A';
  }

  @override
  String ppAlertOutputOverload(String amps, String limit) {
    return 'Uitgang overbelast: $amps A op een beveiliging van $limit A';
  }

  @override
  String ppAlertCableUndersized(String cable, String amps, String limit) {
    return 'Kabel $cable ($amps A max) beveiligd op $limit A: verhoog de doorsnede';
  }

  @override
  String ppAlertVoltageDrop(String percent, String limit) {
    return 'Cumulatieve spanningsval van $percent % (meer dan $limit %)';
  }

  @override
  String ppAlertImbalance(String percent) {
    return 'Fases uit balans ($percent %): verdeel de 1-fase lasten beter';
  }

  @override
  String ppAlertAdapter(String adapter) {
    return 'Adapter nodig: $adapter';
  }

  @override
  String get ppCategoriesTitle => 'Verdeling per gebruik';

  @override
  String get ppSynopticSubtitle => 'Synoptiek van de distributie';

  @override
  String get ppSynopticHint => '🤏 Knijp om te zoomen, sleep om te bewegen';

  @override
  String get ppEmptyTab =>
      'Nog niets te tonen: bouw eerst je plan in het tabblad Plan.';

  @override
  String get ppGoToPlan => 'Naar het plan';

  @override
  String get ppExportTitle => 'Exporteren';

  @override
  String get ppExportPdf => 'Volledige pdf';

  @override
  String get ppExportPdfSubtitle => 'Synoptiek + lastentabel + aandachtspunten';

  @override
  String get ppExportCsv => 'CSV-tabel';

  @override
  String get ppExportCsvSubtitle => 'Voor Excel, Numbers of Google Sheets';

  @override
  String get ppExportPng => 'Afbeelding van de synoptiek';

  @override
  String get ppExportPngSubtitle => 'PNG in hoge resolutie, witte achtergrond';

  @override
  String get ppExportError => 'Oei, de export is mislukt 😕';

  @override
  String get ppPdfTitle => 'Plan van de stroomverdeling';

  @override
  String get ppPdfGenerated => 'Gemaakt met ShowTech Tools';

  @override
  String get ppColPanel => 'Verdeelkast';

  @override
  String get ppColOutput => 'Uitgang';

  @override
  String get ppColConnector => 'Connector';

  @override
  String get ppColBreaker => 'Beveiliging';

  @override
  String get ppColPhase => 'Fase';

  @override
  String get ppColLength => 'Lengte (m)';

  @override
  String get ppColCable => 'Kabel';

  @override
  String get ppColConnected => 'Aangesloten';

  @override
  String get ppColCategory => 'Gebruik';

  @override
  String get ppColPower => 'kW';

  @override
  String get ppColCurrent => 'I (A)';

  @override
  String get ppColDrop => 'ΔU (%)';

  @override
  String get ppDisclaimer =>
      'Indicatieve berekeningen (230/400 V, H07RN-F koperkabels in open lucht, max. 5 % spanningsval). Dit plan helpt een installatie voorbereiden: het moet door een bevoegd persoon volgens de lokale normen worden gevalideerd.';

  @override
  String get attestationListTitle => 'Montageattesten';

  @override
  String get attestationNew => 'Nieuw attest';

  @override
  String get attestationNewTitle => 'Nieuw attest';

  @override
  String get attestationNewBlank => 'Leeg attest';

  @override
  String get attestationNewFromPlan =>
      'Of vanuit een veiligheidsplan (neemt evenement en bedrijf over):';

  @override
  String get attestationEmptyTitle => 'Nog geen attesten';

  @override
  String get attestationEmptyBody =>
      'Controleer na de opbouw elk element, noteer de voorbehouden en onderteken het attest ter plaatse.';

  @override
  String get attestationDeleteConfirm =>
      'Dit attest en de foto\'s verwijderen? Dit kan niet ongedaan worden gemaakt.';

  @override
  String get attestationStatusSigned => 'Ondertekend';

  @override
  String get attestationStatusReserve => 'Ondertekend met voorbehoud';

  @override
  String attestationElementCount(Object count) {
    return '$count elementen';
  }

  @override
  String get attestationSignatureCleared =>
      'Inhoud gewijzigd: de handtekening is verwijderd, onderteken opnieuw.';

  @override
  String get attestationFieldCompany => 'Monterend bedrijf';

  @override
  String get attestationElementName =>
      'Naam van het element (bv. Voorste truss)';

  @override
  String get attestationElementDesc =>
      'Beschrijving (bv. Truss 40×40, 12 m, 4 takels 1 t)';

  @override
  String get attestationElementFamilies => 'Uit te voeren controles';

  @override
  String get attestationAppliedLoad => 'Toegepaste last (kg)';

  @override
  String get attestationRatedLoad => 'Toelaatbare last (kg)';

  @override
  String get attestationDeleteElementConfirm =>
      'Dit element met controles en foto\'s verwijderen?';

  @override
  String attestationLoadSummary(Object applied, Object rated) {
    return 'Last: $applied kg / $rated kg toelaatbaar';
  }

  @override
  String get attestationOverload => 'Last hoger dan de toelaatbare last';

  @override
  String get attestationElementsEmpty =>
      'Voeg de gemonteerde elementen toe: trussen, grid, torens, takels, podium, schermen…';

  @override
  String get attestationAddElement => 'Element toevoegen';

  @override
  String get attestationTakePhoto => 'Foto nemen';

  @override
  String get attestationPickPhoto => 'Kiezen uit galerij';

  @override
  String get attestationPhotoError =>
      'Foto kon niet worden toegevoegd. Controleer de cameratoegang in de instellingen.';

  @override
  String get attestationOk => 'OK';

  @override
  String get attestationNc => 'NC';

  @override
  String get attestationNa => 'N.v.t.';

  @override
  String get attestationReserveLabel =>
      'Voorbehoud: vaststelling en geplande actie (verplicht)';

  @override
  String get attestationPhotoRequired => 'Foto aanbevolen voor dit punt';

  @override
  String get attestationNoElements =>
      'Geen elementen te controleren: voeg ze toe in de stap Elementen.';

  @override
  String get attestationReservesMissing =>
      'Elk niet-conform punt heeft een schriftelijk voorbehoud nodig vóór ondertekening.';

  @override
  String get attestationSignTitle => 'Ondertekening van het attest';

  @override
  String attestationUnanswered(Object count) {
    return '$count controlepunten zonder antwoord';
  }

  @override
  String attestationReservesMissingCount(Object count) {
    return '$count non-conformiteiten zonder voorbehoud (ondertekening geblokkeerd)';
  }

  @override
  String attestationPhotosMissing(Object count) {
    return '$count aanbevolen foto\'s ontbreken';
  }

  @override
  String get attestationStatElements => 'elementen';

  @override
  String get attestationStatReserves => 'voorbehouden';

  @override
  String get attestationStatPhotos => 'foto\'s';

  @override
  String attestationStatement(Object name) {
    return 'Ondergetekende, $name, verklaart dat de vermelde installaties gemonteerd zijn volgens de handleidingen van de fabrikanten en de regels van goed vakmanschap, en gecontroleerd zijn vóór de toegang van het publiek.';
  }

  @override
  String attestationStatementReserve(Object name) {
    return 'Ondergetekende, $name, verklaart dat de vermelde installaties gemonteerd zijn volgens de handleidingen van de fabrikanten en de regels van goed vakmanschap, en gecontroleerd zijn vóór de toegang van het publiek, onder voorbehoud van de onderstaande punten.';
  }

  @override
  String get attestationReserve => 'Voorbehoud';

  @override
  String get attestationReserveEmpty =>
      'Voorbehoud nog te schrijven (stap Controles)';

  @override
  String get attestationSignerSection => 'Ondertekenaar';

  @override
  String get attestationSignerRole =>
      'Functie (bv. hoofdrigger, productieleider)';

  @override
  String get attestationSign => 'Attest ondertekenen';

  @override
  String get attestationSignWithReserve => 'Ondertekenen met voorbehoud';

  @override
  String get attestationStepInfo => 'Gegevens';

  @override
  String get attestationStepElements => 'Elementen';

  @override
  String get attestationStepControls => 'Controles';

  @override
  String get attestationStepSignature => 'Handtekening';

  @override
  String get attestationNextElement => 'Volgend element';

  @override
  String get attestationDeletePhotoConfirm => 'Deze foto verwijderen?';

  @override
  String get hospitalSearchPlaceTitle => 'Waar vindt het evenement plaats?';

  @override
  String get hospitalSearchPlaceHelp =>
      'Naam van de zaal, adres, stad of postcode: ook een ruwe aanduiding volstaat.';

  @override
  String get hospitalSearchPlaceHint => 'bv. Ziggo Dome, Amsterdam';

  @override
  String get hospitalSearchButton => 'Zoeken';

  @override
  String get hospitalSearchPlaceChoose =>
      'Meerdere plaatsen komen overeen. Welke is het?';

  @override
  String get hospitalSearchNoPlace =>
      'Geen plaats gevonden. Probeer korter: alleen de stad, de postcode of de naam van de zaal.';

  @override
  String hospitalSearchAround(Object place) {
    return 'Rond $place';
  }

  @override
  String get hospitalSearchChangePlace => 'Wijzigen';

  @override
  String hospitalSearchNoneRadius(Object km) {
    return 'Geen ziekenhuis gevonden binnen $km km. Vul het handmatig in.';
  }

  @override
  String get ppspsRatingTitle => 'Risicobeoordeling';

  @override
  String get ppspsSeverity => 'Ernst';

  @override
  String get ppspsProbability => 'Waarschijnlijkheid';

  @override
  String ppspsRatingLibraryValue(Object severity, Object probability) {
    return 'Aangepast voor dit plan. Waarde uit de bibliotheek: ernst $severity × waarschijnlijkheid $probability.';
  }

  @override
  String get ppspsRatingNoteHint => 'Reden (bv. binnenlocatie, geen wind)';

  @override
  String get ppspsRatingReset => 'Terug naar de waarde uit de bibliotheek';

  @override
  String get ppspsLevelHigh => 'Hoog risico';

  @override
  String get ppspsLevelMedium => 'Middelmatig risico';

  @override
  String get ppspsLevelLow => 'Laag risico';

  @override
  String get ppspsLevelHighRule =>
      'score 12 tot 16, of ernst 4 ongeacht de waarschijnlijkheid';

  @override
  String get ppspsLevelMediumRule => 'score 6 tot 11';

  @override
  String get ppspsLevelLowRule => 'score 1 tot 5';

  @override
  String get ppspsRatingHelpTitle => 'Hoe risico\'s worden beoordeeld';

  @override
  String get ppspsRatingHelpShort => 'Beoordeling';

  @override
  String get ppspsRatingHelpIntro =>
      'Elk risico krijgt een ernst van 1 tot 4 en een waarschijnlijkheid van 1 tot 4. De score is hun product, van 1 tot 16.';

  @override
  String get ppspsRatingHelpAdjust =>
      'De voorgestelde waarden komen uit de bibliotheek voor een typisch evenement. Pas ze aan voor uw werf door op een risico te tikken; de reden verschijnt in de pdf.';
}
