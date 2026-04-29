// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get aboutArtNetSubtitle =>
      'DMX-universum op Ethernet/UDP, knooppunten, broadcast vs. unicast.\nEchte limieten, netwerkstabiliteit, RDM afhankelijk van hardware.';

  @override
  String get aboutArtNetTitle =>
      'Art-Net - DMX over IP (knooppunten, unicast/broadcast)';

  @override
  String get aboutCablingFiberSubtitle =>
      'Cat5e→Cat8, OM3/OM4/OS2 vezel, LC/SC/MPO, typische afstanden, best practice tonen.';

  @override
  String get aboutCablingFiberTitle =>
      'Netwerk - RJ45 / glasvezel / snelheden & lengtes';

  @override
  String get aboutComputingSubtitle =>
      'Nuttige snelheden, versies, echte limieten, marketingvalkuilen.';

  @override
  String get aboutComputingTitle => 'IT - USB / HDMI / DP / SATA / NVMe...';

  @override
  String get aboutDmxSubtitle =>
      'Universum, adressen, frames, RS-485 bekabeling, beëindiging, veldfouten.\nInclusief schema\'s + checklist.';

  @override
  String get aboutDmxTitle => 'DMX';

  @override
  String get aboutElectricitySubtitle =>
      'Connectoren, mono/tri, snelle kW-panelen (16A→400A), veldvallen.';

  @override
  String get aboutElectricityTitle => 'Elektrisch - Schuko / P17 / voeding';

  @override
  String get aboutIpBasicsSubtitle =>
      'IP, masker, gateway, DHCP vs statisch begrijpen.\nConcrete voorbeelden (2.x, 10.x, 192.168.x) + checklist.';

  @override
  String get aboutIpBasicsTitle => 'IP-bases';

  @override
  String get aboutLightNetworkSubtitle =>
      'Eenvoudige, robuuste architectuur voor Art-Net/sACN.\nVLAN, IGMP snooping/query, Wi-Fi (jitter), switches, diagrammen + checklist.';

  @override
  String get aboutLightNetworkTitle =>
      'Licht netwerk - VLAN, IGMP, Wi-Fi vs. bekabeld';

  @override
  String get aboutSacnSubtitle =>
      'Professionele netwerkgeoriënteerde DMX over IP-standaard.\nMulticast/unicast, IGMP snooping/query, multibronprioriteiten.';

  @override
  String get aboutSacnTitle => 'sACN';

  @override
  String get aboutVideoSubtitle =>
      'Kiezen op basis van latentie, betrouwbaarheid, bekabeling, LAN vs WAN.\nTabellen + diagram.';

  @override
  String get aboutVideoTitle => 'Video';

  @override
  String get appTitle => 'Mijn technologie-app';

  @override
  String catalogDmxModeItem(Object channels, Object name) {
    return '$name - $channels kanalen';
  }

  @override
  String catalogDmxModeTitle(Object count) {
    return 'DMX-modus ($count)';
  }

  @override
  String get catalogInfoDmxChannels => 'DMX-kanalen';

  @override
  String get catalogInfoLuminousFlux => 'Lichtstroom';

  @override
  String get catalogInfoPower => 'Stroom';

  @override
  String get catalogInfoWeight => 'Gewicht';

  @override
  String catalogLastUpdate(Object date) {
    return 'Laatste update : $date';
  }

  @override
  String catalogManufacturerTitle(Object count) {
    return 'Constructor ($count)';
  }

  @override
  String catalogModelTitle(Object count) {
    return 'Model ($count)';
  }

  @override
  String get catalogNotProvided => 'Geen informatie';

  @override
  String get catalogOpenDmxChart => 'Open de DMX-tabel';

  @override
  String get catalogOpenManual => 'Open de handleiding';

  @override
  String get catalogResetTooltip => 'Reset';

  @override
  String catalogSyncError(Object message) {
    return 'Fout: $message';
  }

  @override
  String catalogSyncFailed(Object reason) {
    return 'Synchronisatiefout: $reason';
  }

  @override
  String get catalogSyncFailedUnknown => 'Synchronisatiefout (reden onbekend).';

  @override
  String catalogTypeTitle(Object count) {
    return 'Type ($count)';
  }

  @override
  String get catalogUpdateTooltip => 'Update';

  @override
  String get catalogUpdated => 'Bijgewerkte catalogus.';

  @override
  String get commonCalculate => 'Bereken';

  @override
  String get commonCancel => 'Annuleren';

  @override
  String get commonCopyResultTooltip => 'Kopieer het resultaat';

  @override
  String get commonDash => '-';

  @override
  String get commonNone => 'Geen registratie';

  @override
  String get commonOk => 'OK';

  @override
  String get commonOkWithCheck => 'OK ✅';

  @override
  String get commonRename => 'Hernoem';

  @override
  String get commonReset => 'Reset';

  @override
  String get commonSave => 'Registreer';

  @override
  String get commonSearch => 'Zoek op';

  @override
  String get commonTooLowWithCross => 'Te laag ❌';

  @override
  String get commonUnitMeter => 'm';

  @override
  String get consentsReset => 'Toestemming opnieuw ingesteld.';

  @override
  String get dipSwitchAddressHint => 'Ex: 1 tot 512';

  @override
  String get dipSwitchAddressLabel => 'DMX-adres';

  @override
  String get dipSwitchChannelUnit => 'kanaal';

  @override
  String get dipSwitchEndOfUniverseWarning =>
      'Waarschuwing: einde van DMX-universum bereikt.';

  @override
  String get dipSwitchInputsTitle => 'Ingangen';

  @override
  String get dipSwitchIntervalHint => 'Ex : 4 (kanalen)';

  @override
  String get dipSwitchIntervalLabel => 'Interval';

  @override
  String get dipSwitchModeAddressDirect => 'Adres';

  @override
  String get dipSwitchModeAddressMinusOne => 'Adres - 1';

  @override
  String get dipSwitchNextAddressButton => 'Adres';

  @override
  String get dipSwitchOffLabel => 'UIT';

  @override
  String get dipSwitchOnLabel => 'OP';

  @override
  String get dipSwitchResetTooltip => 'Reset';

  @override
  String dipSwitchResultAddressLine(Object address) {
    return 'Adres : $address';
  }

  @override
  String get dipSwitchResultAddressNotProvided => 'Adres niet gegeven';

  @override
  String dipSwitchResultBinaryValueLine(Object binary) {
    return 'Binair: $binary';
  }

  @override
  String get dipSwitchResultHeader => 'Resultaten';

  @override
  String dipSwitchResultIntervalLine(Object end, Object start) {
    return 'Interval: $start → $end';
  }

  @override
  String dipSwitchResultModeLine(Object mode) {
    return 'Modus : $mode';
  }

  @override
  String get dipSwitchScrollHint =>
      'Scroll naar beneden om alle schakelaars te zien.';

  @override
  String get dipSwitchSectionTitle => 'Schakelaars';

  @override
  String get dipSwitchSummaryTitle => 'Samenvatting';

  @override
  String dipSwitchSwitchLabel(Object index) {
    return 'Schakel $index';
  }

  @override
  String get dipSwitchUseAddressMinusOneLabel => 'Adresmodus gebruiken - 1';

  @override
  String get disclaimerAccept => 'Ik accepteer';

  @override
  String get disclaimerCertify =>
      'Ik verklaar dat ik deze voorwaarden heb gelezen en geaccepteerd.';

  @override
  String get disclaimerText =>
      'ALLEEN TER INFORMATIE\n\nDe berekeningen in deze toepassing (video, licht, laser) dienen alleen ter informatie.\nZe vervangen in geen geval :\n- gecertificeerde berekeningen,\n- technische studies\n- officiële geldende normen,\n- of validatie door een gekwalificeerde professional.\n\nAANSPRAKELIJKHEID\nDe uitgever van deze toepassing kan niet aansprakelijk worden gesteld voor rekenfouten, weglatingen, materiële schade, persoonlijk letsel of enig incident dat zich voordoet tijdens de installatie, de bediening of het gebruik van deze toepassing,\npersoonlijk letsel of incidenten die voortvloeien uit de installatie, de bediening of het gebruik van de apparatuur.\n\nVIDEO & PROJECTIE\nResultaten (afmetingen, verhoudingen, helderheid, overlappingen, enz.) zijn gebaseerd op theoretische modellen en kunnen variëren afhankelijk van :\noptiek, zoom, gelijkmatigheid, lichtomgeving, ondersteuning, instellingen, enz.\nRaadpleeg altijd de officiële documentatie van de fabrikant.\n\nLICHT\nBerekeningen zijn indicatief en houden geen rekening met alle werkelijke omstandigheden (toleranties, optische verliezen,\ndegradatie van bronnen, lokale normen, omgevingsomstandigheden, enz.)\n\nLASER - VEILIGHEID\nNOHD-, SZED- en CZED-berekeningen zijn gebaseerd op standaardaannames en theoretische drempelwaarden.\nZe houden met name geen rekening met\n- optische instrumenten (verrekijkers, camera\'s, telescopen, enz.),\n- atmosferische omstandigheden (mist, regen, stof, enz.),\n- onvoorziene reflecties, verkeerd gebruik, specifieke instellingen.\nHet gebruik van een lasersysteem impliceert directe verantwoordelijkheid voor de operator en een gepaste risicoanalyse.\n\nACCEPTEREN VAN DE RISICO\'S\nDoor deze toepassing te gebruiken, erkent de gebruiker :\n- dat hij op de hoogte is van de geldende veiligheidsvoorschriften\n- dat hij als enige verantwoordelijk is voor zijn installaties\n- de volledige verantwoordelijkheid op zich te nemen voor de risico\'s die gepaard gaan met het gebruik van de apparatuur (video, licht, laser),\n- systematisch de gegevens te controleren met de officiële handleidingen van de fabrikant.';

  @override
  String get disclaimerTitle => '⚠️ WETTELIJKE KENNISGEVING & DISCLAIMER';

  @override
  String get homeLaserSubtitle =>
      'Berekeningen en laserveiligheid (toestemming vereist voor elke invoer).';

  @override
  String get homeLaserTitle => 'Laser';

  @override
  String get homeLightSubtitle =>
      'Projectiegrootte, DMX-dipschakelaar, fotometrie, catalogus, DMX-patch.';

  @override
  String get homeLightTitle => 'Licht';

  @override
  String get homeReferencesSubtitle =>
      'DMX / netwerk / video: datasheets en benchmarks.';

  @override
  String get homeReferencesTitle => 'Referenties';

  @override
  String get homeTitle => 'Home';

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
  String get languageSystemCurrent => 'Telefoontaal';

  @override
  String get laserAdviceFullPower => 'Volledig toegestaan vermogen (100%)';

  @override
  String laserAdviceMaxRecommended(Object percent) {
    return 'Maximaal aanbevolen vermogen: $percent';
  }

  @override
  String get laserConsentCheckboxLabel =>
      'Ik accepteer en begrijp de risico\'s.';

  @override
  String get laserConsentContinue => 'Ga verder';

  @override
  String get laserConsentText =>
      'TOEGANG TOT DE LASERSECTIE\n\nHet LASER-gedeelte van deze toepassing betreft veiligheidsberekeningen (bijv. NOHD, SZED, CZED).\nDeze berekeningen zijn indicatief en vervangen niet :\n- een risicoanalyse,\n- de geldende normen\n- operationele procedures\n- of validatie door een gekwalificeerd persoon.\n\nBELANGRIJK\n- Risico op oog-/huidletsel bij onjuist gebruik.\n- De berekening kan onjuist zijn als de ingevoerde parameters onvolledig of onjuist zijn, of als de werkelijke context afwijkt (optiek, atmosferische omstandigheden, reflecties, uitlijning, enz,)\n  atmosferische omstandigheden, reflecties, uitlijning, enz.)\n- De gebruiker is als enige verantwoordelijk voor de installatie, het gebruik en de naleving.\n\nDoor te valideren, bevestigt u dat u :\n- de risico\'s begrijpt,\n- de toepasselijke veiligheidsregels naleeft\n- de volledige verantwoordelijkheid op zich neemt in geval van nalatigheid of verkeerd gebruik.';

  @override
  String get laserConsentTitle => '🔴 LASER TOESTEMMING (VERPLICHT)';

  @override
  String get laserDiameterHint => 'ex: 3,0';

  @override
  String get laserDiameterLabel => 'Uitgangsdiameter (mm)';

  @override
  String get laserDisclaimerShort =>
      'Indicatieve berekening. Vervangt geen laserveiligheidsanalyse.';

  @override
  String get laserDivergenceHint => 'ex: 1.2';

  @override
  String get laserDivergenceLabel => 'Divergentie (mrad)';

  @override
  String get laserInputsTitle => 'Ingangen';

  @override
  String get laserInvalidInputs =>
      'Voer een geldige macht, divergentie en diameter in.';

  @override
  String get laserNameUpdated => 'Naam bijgewerkt.';

  @override
  String get laserNormativeParamsBody =>
      'MEP voor nominale oogafstand (NOHD): 25,4 W/m².\n(Norm IEC 60825-1, uitgave 3.0)\n\nMEP voor blootstellingsafstand voor gevoelige zones (SZED): 1 W/m².\n(ANSI Z136.6 norm)\n\nMEP voor blootstellingsafstand in kritieke zone (CZED): 0,05 W/m² (norm ANSI Z136.6)\n(ANSI Z136.6 norm)';

  @override
  String get laserNormativeParamsTitle => 'Veiligheidsparameters';

  @override
  String get laserPowerHint => 'bijv.: 5000';

  @override
  String get laserPowerLabel => 'Vermogen (mW)';

  @override
  String get laserPresetAdded => 'Opname toegevoegd.';

  @override
  String get laserPresetDeleted => 'Record verwijderd.';

  @override
  String laserPresetSubtitle(Object diam, Object div, Object p) {
    return 'P: $p mW - Div: $div mrad - Ø: $diam mm';
  }

  @override
  String get laserProjectorNameLabel => 'Naam projector';

  @override
  String get laserRenameProjectorTitle => 'De naam van de projector wijzigen';

  @override
  String get laserSafetyResultsTitle => 'Veiligheidsresultaten';

  @override
  String get laserSaveCurrentProjector => 'Registreer deze projector';

  @override
  String get laserSaveProjectorTitle => 'Een projector registreren';

  @override
  String get laserSavedProjectorsTitle => 'Geregistreerde projectoren';

  @override
  String get laserSearchHint => 'bijv. \"RGB 5W';

  @override
  String get laserTargetDistanceHint => 'ex: 10';

  @override
  String get laserTargetDistanceLabel => 'Doelafstand (m)';

  @override
  String get laserZoneCzedDesc => 'Kritieke zone';

  @override
  String get laserZoneNohdDesc => 'Gevaar voor de ogen';

  @override
  String get laserZoneSzedDesc => 'Gevoelig gebied';

  @override
  String get legalNotices => 'Juridische informatie';

  @override
  String get lightCatalogDescription =>
      'Selectie op fabrikant, type en product, met informatie en handleiding.';

  @override
  String get lightCatalogTitle => 'Catalogus';

  @override
  String get lightDisclaimerShort =>
      'Indicatief gereedschap. Controleer altijd de documentatie van de fabrikant.';

  @override
  String get lightDmxSwitchDescription =>
      'Indicatieve conversie tussen DMX-adres en schakelaars, met intervalnavigatie.';

  @override
  String get lightDmxSwitchTitle => 'DMX-dipschakelaar';

  @override
  String get lightPatchDescription => 'Een MVR-bestand importeren en bekijken.';

  @override
  String get lightPatchTitle => 'DMX patch';

  @override
  String get lightPhotometryDescription =>
      'Indicatieve conversies tussen lux, candela en lumen, met afstand en hoek.';

  @override
  String get lightPhotometryTitle => 'Fotometrie';

  @override
  String get lightProjectionDescription =>
      'Indicatieve berekening van de spotgrootte op basis van hoek, afstand en diameter.';

  @override
  String get lightProjectionTitle => 'Grootte projectie';

  @override
  String get menuTitle => 'Menu';

  @override
  String get mireBlendLabel => 'BLEND';

  @override
  String get mireDash => '-';

  @override
  String get mireErrInvalidOverlap => 'Ongeldige overlap (0 tot 99,9).';

  @override
  String get mireErrInvalidProjectors => 'Ongeldig aantal projectoren (N > 0).';

  @override
  String get mireErrInvalidWHpx => 'Ongeldige breedte/hoogte (px).';

  @override
  String get mireExportPng => 'PNG exporteren';

  @override
  String get mireHeightPxHint => 'Bijvoorbeeld 1080';

  @override
  String get mireHeightPxHintMapping => 'ex: 2160';

  @override
  String get mireHeightPxLabel => 'Hoogte (px)';

  @override
  String get mireLedErrTileCm => 'Voer Tegel cm in (breedte/hoogte >0).';

  @override
  String get mireLedErrTilePx => 'Voer Tegel px in (breedte/hoogte >0).';

  @override
  String get mireLedErrTilesXY => 'Voer Tegels X/Y (>0) in.';

  @override
  String get mireLedParamsTitle => 'LED-wandinstellingen';

  @override
  String mireLedPitchComputed(Object pitch) {
    return 'Pitch berekend: $pitch';
  }

  @override
  String get mireLedSubtitleColorBars => 'Balken + hellingen + cirkels';

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
  String get mireLedTitle => 'LED / MIRE';

  @override
  String get mireLedTypeColorBars => 'Balken + hellingen + cirkels';

  @override
  String get mireLedTypeGridLabels => 'Raster + markeringen + cirkels';

  @override
  String get mireLedTypePixelPerfect => 'Pixel perfect + cirkels';

  @override
  String get mireLedTypeTilesId => 'Tegels ID (aantal + kleuren)';

  @override
  String get mireLedTypeUniformity => 'Uniformiteit + cirkels';

  @override
  String mireLedWallResolution(Object h, Object w) {
    return 'Resolutie wand: $w × $h px';
  }

  @override
  String get mireLedWarnPitchOutOfRange =>
      '⚠️ Steek berekend buiten bereik (0,5-20 mm). Controleer Tegel cm / px.';

  @override
  String get mireLedWarnPitchXNotY =>
      '⚠️ Steek X ≠ Steek Y (niet-homogene tegel). Controleer de afmetingen cm en px.';

  @override
  String get mireMappingSectionTitle =>
      'Testpatroon voor toewijzing aan meerdere projectoren';

  @override
  String mireMappingSubtitlePattern(Object n, Object orient, Object percent) {
    return 'N=$n - Overlap $percent% - $orient';
  }

  @override
  String get mireMappingTypeBlendRamps => 'Oprijplaten mengen';

  @override
  String get mireMappingTypeCombo => 'Combo (zones + overlappen + mengen)';

  @override
  String get mireMappingTypeLabel => 'Type in kaart brengen';

  @override
  String get mireMappingTypeZonesOverlap => 'Zones + overlap';

  @override
  String get mireOrientationHorizontal => 'Horizontaal';

  @override
  String get mireOrientationLabel => 'Oriëntatie';

  @override
  String get mireOrientationVertical => 'Verticaal';

  @override
  String get mireOverlapHint => 'ex: 10,0';

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
  String get mireProjectorsNLabel => 'Aantal spots (N)';

  @override
  String get mireSimpleSectionTitle => 'Testpatroon met één scherm';

  @override
  String get mireSimpleSubtitleCheckerboard => 'Dambord + cirkels';

  @override
  String get mireSimpleSubtitleColorBars => 'Balken + hellingen + cirkels';

  @override
  String get mireSimpleSubtitleComboAll =>
      'Raster + veilig + 2 gecentreerde balken + cirkels';

  @override
  String get mireSimpleSubtitleGridSafe => 'Raster + veilig + cirkels';

  @override
  String get mireSimpleSubtitleUniformity => 'Uniformiteit + cirkels';

  @override
  String get mireSimpleTypeCheckerboard => 'Dambord + cirkels';

  @override
  String get mireSimpleTypeColorBars => 'Balken + hellingen + cirkels';

  @override
  String get mireSimpleTypeComboAll =>
      'Combo (raster + cirkels + 2 gecentreerde balken)';

  @override
  String get mireSimpleTypeGridSafe => 'Raster + veilig + cirkels';

  @override
  String get mireSimpleTypeUniformity => 'Uniformiteit + cirkels';

  @override
  String get mireTileMissingPx => 'Voer Tegel (px) in voor nummering.';

  @override
  String mireTilesSubtitleBase(Object nx, Object ny, Object th, Object tw) {
    return 'Tegel ${tw}x$th px - Raster $nx x $ny';
  }

  @override
  String mireTilesSubtitlePitchEq(Object pitch) {
    return 'Steek ~ $pitch mm';
  }

  @override
  String mireTilesSubtitlePitchXY(Object px, Object py) {
    return 'Steek X $px - Y $py mm';
  }

  @override
  String mireTilesSubtitleTilePhys(Object hcm, Object wcm) {
    return 'Tegel $wcm×$hcm cm';
  }

  @override
  String mireTilesSubtitleWallPhys(Object hm, Object wm) {
    return 'Wand ~ $wm×$hm m';
  }

  @override
  String get mireTypeLabel => 'Type zicht';

  @override
  String get mireVideoComboTitle => 'VIDEO / COMBIVIZIER';

  @override
  String get mireVideoMappingSectionTitle =>
      'Testpatroon voor toewijzing aan meerdere projectoren';

  @override
  String get mireVideoMappingTitle => 'VIDEO / TESTPATROON MAPPING';

  @override
  String get mireVideoSimpleSectionTitle => 'Testpatroon met één scherm';

  @override
  String get mireVideoSimpleTitle => 'VIDEO / ENKEL TESTPATROON';

  @override
  String get mireVideoTypeCheckerboard => 'Dambord + cirkels';

  @override
  String get mireVideoTypeColorBars => 'Balken + hellingen + cirkels';

  @override
  String get mireVideoTypeCombo =>
      'Combo (raster + cirkels + 2 gecentreerde balken)';

  @override
  String get mireVideoTypeGridSafe => 'Raster + veilig + cirkels';

  @override
  String get mireVideoTypeUniformity => 'Uniformiteit + cirkels';

  @override
  String get mireWallNotMultipleOfTiles => 'NIET-MEERVOUDIGE TEGELWAND';

  @override
  String get mireWidthPxHint => 'bijv.: 1920';

  @override
  String get mireWidthPxHintMapping => 'ex: 3840';

  @override
  String get mireWidthPxLabel => 'Breedte (px)';

  @override
  String patchAddressLabel(Object address) {
    return 'Adres : $address';
  }

  @override
  String patchChannelsUsed(Object count) {
    return 'Gebruikte kanalen: $count / 512';
  }

  @override
  String get patchConflictError => 'Conflicterende (overlappende) adressen.';

  @override
  String get patchConflictShort => 'Conflict';

  @override
  String patchConflicts(Object count) {
    return 'Conflicten : $count';
  }

  @override
  String get patchEditChannelsLabel => 'Kanalen';

  @override
  String get patchEditHint => 'Controleert de modus en het aantal kanalen.';

  @override
  String get patchEditModeLabel => 'Modus';

  @override
  String get patchEditTitle => 'Editie';

  @override
  String get patchEmptyUniverse => 'Er zijn geen machines in dit universum.';

  @override
  String patchFixturesCount(Object count) {
    return 'Machines : $count';
  }

  @override
  String get patchHomeDisclaimer =>
      'De resultaten zijn indicatief. Controleer dit altijd met de console.';

  @override
  String get patchHomeImportMvrDescription =>
      'Analyseer een MVR-bestand en laad de patch als referentie.';

  @override
  String get patchHomeImportMvrTitle => 'Een MVR importeren';

  @override
  String get patchHomeTitle => 'DMX patch';

  @override
  String get patchHomeViewPatchDescription =>
      'Lijst en conflicten per universum.';

  @override
  String get patchHomeViewPatchTitle => 'Bekijk de patch';

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
  String get patchHubStateTitle => 'Status';

  @override
  String get patchHubTitle => 'Hub Patch';

  @override
  String get patchHubWorksiteBody =>
      'Importeer een MVR of raadpleeg de bezettingsgrafiek.';

  @override
  String get patchHubWorksiteTitle => 'Site';

  @override
  String get patchInvalidChannelCount => 'Ongeldig aantal kanalen.';

  @override
  String get patchIssueInvalidChannelCount =>
      'Het aantal kanalen moet groter dan of gelijk aan 1 zijn.';

  @override
  String get patchIssueInvalidStartAddress =>
      'Het DMX-adres moet tussen 1 en 512 liggen.';

  @override
  String get patchIssueInvalidUniverse =>
      'Het universum moet groter dan of gelijk aan 1 zijn.';

  @override
  String get patchIssueRangeExceedsUniverse =>
      'Het kanaalbereik is groter dan 512 in dit universum.';

  @override
  String get patchIssueUnknown => 'Onbekende fout.';

  @override
  String get patchListTitle => 'Lijst';

  @override
  String get patchManualDisabledBody =>
      'De patch is alleen-lezen wanneer een MVR-referentie wordt geladen.';

  @override
  String get patchManualDisabledTitle => 'Uit';

  @override
  String get patchManualTitle => 'Handmatige patch';

  @override
  String patchModeLabel(Object mode) {
    return 'Modus : $mode';
  }

  @override
  String get patchMvrButtonAnalyzing => 'Analyse...';

  @override
  String get patchMvrButtonLoadAsReference => 'Laden als referentie';

  @override
  String get patchMvrButtonPickFile => 'Kies een bestand';

  @override
  String get patchMvrClearTooltip => 'Verwijder';

  @override
  String get patchMvrColAddress => 'Adres';

  @override
  String get patchMvrColChannels => 'Kanalen';

  @override
  String get patchMvrColId => 'ID';

  @override
  String get patchMvrColName => 'Naam';

  @override
  String get patchMvrColUniverse => 'Universum';

  @override
  String get patchMvrColumnsHint =>
      'Kolommen: ID, Naam, Universum, Adres, Kanalen';

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
  String get patchMvrOrderAsc => 'Halvemaan';

  @override
  String get patchMvrOrderDesc => 'Aflopend';

  @override
  String get patchMvrOrderLabel => 'Bestel';

  @override
  String get patchMvrSortAddress => 'Adres';

  @override
  String get patchMvrSortByLabel => 'Sorteren op';

  @override
  String get patchMvrSortChannels => 'Kanalen';

  @override
  String get patchMvrSortId => 'ID';

  @override
  String get patchMvrSortName => 'Naam';

  @override
  String get patchMvrSortUniverse => 'Universum';

  @override
  String get patchMvrSortUniverseThenAddress => 'Universum richt zich dan tot';

  @override
  String get patchMvrStatusCleared => 'Referentie verwijderd.';

  @override
  String get patchMvrStatusEmptyBytes => 'Leeg bestand.';

  @override
  String get patchMvrStatusExtractingZip => 'De ZIP uitpakken...';

  @override
  String patchMvrStatusFilePickFailed(Object reason) {
    return 'Bestandsselectie niet mogelijk: $reason';
  }

  @override
  String patchMvrStatusFixturesFound(int count, int resolved) {
    return 'Machines gevonden: $count (multikanaal: $resolved).';
  }

  @override
  String get patchMvrStatusLoadingGdtf => 'GDTF\'s laden...';

  @override
  String get patchMvrStatusNoContentToLoad => 'Geen inhoud om te laden.';

  @override
  String get patchMvrStatusNoFileSelected => 'Geen bestanden geselecteerd.';

  @override
  String get patchMvrStatusNoUsableFixtures =>
      'Geen bruikbare machines gevonden.';

  @override
  String patchMvrStatusParseError(Object message) {
    return 'Parsingfout: $message';
  }

  @override
  String get patchMvrStatusParsingContent => 'Inhoudelijke analyse ...';

  @override
  String patchMvrStatusReferenceLoaded(int count, int skipped, int footprints) {
    return 'Referentie geladen: $count machine(s) (genegeerd: $skipped, GDTF-voetafdrukken: $footprints).';
  }

  @override
  String patchMvrStatusRestored(Object count) {
    return 'Catering : $count machines';
  }

  @override
  String get patchMvrStatusSceneXmlNotFound =>
      'scene.xml niet gevonden in de MVR.';

  @override
  String get patchMvrStatusSelectingFile => 'Bestand selecteren...';

  @override
  String patchMvrStatusUnsupportedFile(Object ext) {
    return 'Niet-ondersteund bestand: $ext';
  }

  @override
  String get patchMvrSummaryTitle => 'Samenvatting';

  @override
  String get patchMvrTitle => 'MVR invoer';

  @override
  String patchMvrUniverseItem(Object universe) {
    return 'Universum';
  }

  @override
  String get patchPageTitle => 'Patch';

  @override
  String get patchSummaryTitle => 'Samenvatting';

  @override
  String get patchUniverseAppBarTitle => 'Patch';

  @override
  String patchUniverseConflictCount(Object count) {
    return 'Conflicten : $count kanaal(en)';
  }

  @override
  String get patchUniverseGridLimitedByWidth =>
      'Beperkt door de breedte van het scherm.';

  @override
  String get patchUniverseGridTitle => 'Bezetting (1 tot 512)';

  @override
  String patchUniverseItem(Object universe) {
    return 'Universum';
  }

  @override
  String get patchUniverseLabel => 'Universum';

  @override
  String get patchUniverseLegendConflict => 'Conflict';

  @override
  String get patchUniverseLegendFree => 'Gratis';

  @override
  String get patchUniverseLegendOccupied => 'Bezet';

  @override
  String patchUniverseOccupantLine(
      Object channels, Object end, Object fixture, Object mode, Object start) {
    return '- $fixture\n  $mode - $channels channel(aux)\n  $start → $end';
  }

  @override
  String patchUniverseOccupiedCount(Object count) {
    return 'Bezet : $count / 512';
  }

  @override
  String patchUniversePopupHeader(
      Object address, Object state, Object universe) {
    return 'Universum $universe - Adres $address\nStaat : $state';
  }

  @override
  String get patchUniversePopupManyOccupants =>
      'Verschillende machines bezetten dit kanaal.';

  @override
  String patchUniversePopupMore(Object count) {
    return '... en $count andere(n).';
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
  String get patchUniverseReferenceReadOnly => 'Alleen-lezen (van MVR)';

  @override
  String get patchUniverseReferenceTitle => 'Referentie';

  @override
  String get patchUniverseResetConfirm => 'Reset';

  @override
  String get patchUniverseResetContent =>
      'Hiermee wordt de patch verwijderd die vanuit de MVR in de toepassing is geladen.\nEr worden geen gegevens in het bestand gewijzigd.';

  @override
  String get patchUniverseResetTitle => 'De referentie opnieuw instellen?';

  @override
  String get patchUniverseResetTooltip => 'Reset referentie';

  @override
  String get patchUniverseSelected => 'Geselecteerd universum';

  @override
  String get patchUniverseStateConflict => 'Conflict';

  @override
  String get patchUniverseStateFree => 'Gratis';

  @override
  String get patchUniverseStateOccupied => 'Bezet';

  @override
  String get patchUniverseTapHint =>
      'Raak een vak aan om de details weer te geven.';

  @override
  String get patchUniverseUniverseDropdownLabel => 'DMX Universum';

  @override
  String patchUniverseUniverseItem(Object universe) {
    return 'Universum';
  }

  @override
  String get patchUniverseUniverseTitle => 'Universum';

  @override
  String get patchUniverseZoomIn => 'Vergroten';

  @override
  String get patchUniverseZoomOut => 'Verminder';

  @override
  String get patchUniverseZoomTitle => 'Zoom';

  @override
  String get photometryBeamAngleHint2 => 'In graden';

  @override
  String get photometryBeamAngleHint3 => 'In graden';

  @override
  String get photometryBeamAngleLabel => 'Stralingshoek';

  @override
  String get photometryCandelaHint1 => 'Voer een waarde in cd';

  @override
  String get photometryCandelaHint2 => 'Voer een waarde in cd';

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
  String get photometryLumensLabel => 'Lumen';

  @override
  String get photometryLuxHint => 'Voer een waarde in lux in';

  @override
  String get photometryLuxLabel => 'Lux';

  @override
  String get photometrySection1Title => 'Lux <> Candela';

  @override
  String get photometrySection2Title => 'Lumen <> Candela';

  @override
  String get photometrySection3Title => 'Lumen < Lux';

  @override
  String photometrySummary1(Object candela, Object distance, Object lux) {
    return 'Op $distance m, $candela cd ≈ $lux lux.';
  }

  @override
  String photometrySummary2(Object distance, Object lumens, Object lux) {
    return 'Op $distance m, $lumens lm ≈ $lux lux (ongeveer).';
  }

  @override
  String photometrySummary3(
      String lumens, String distance, String angle, String lux) {
    return 'Lumen: $lumens lm - Afstand: $distance m - Hoek: $angle° - Lux: $lux lx.';
  }

  @override
  String get projectionAngleHint => 'In graden';

  @override
  String get projectionAngleLabel => 'Hoek';

  @override
  String get projectionAutoHelp => 'Auto: berekent de ontbrekende waarde.';

  @override
  String projectionConeAngle(Object angle) {
    return 'Hoek : $angle°';
  }

  @override
  String projectionConeDiameter(Object diameter) {
    return 'Diameter : $diameter m';
  }

  @override
  String projectionConeDistance(Object distance) {
    return 'Afstand : $distance m';
  }

  @override
  String projectionDetailAngle(Object angle) {
    return 'Hoek : $angle°';
  }

  @override
  String projectionDetailDiameter(Object diameter) {
    return 'Diameter : $diameter m';
  }

  @override
  String projectionDetailDistance(Object distance) {
    return 'Afstand : $distance m';
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
  String get projectionHeaderAutoActive => 'Auto actief';

  @override
  String get projectionHeaderNeedTwoValues => 'Voer minstens twee waarden in.';

  @override
  String get projectionInputsTitle => 'Ingangen';

  @override
  String get projectionResultsTitle => 'Resultaten';

  @override
  String get resetConsents => 'Toestemmingen opnieuw instellen';

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
    return 'Formaat: $format\nOppervlakte: $area m²\nLux (lm/m²): $lux\nLux eq (versterking): $luxEq\nHelderheid: $nits nits | $fl ft-L\nMinimumdrempel ($presetLabel): $minFl ft-L → $status\nOpmerking: indicatieve schatting (Lambert).';
  }

  @override
  String get videoBrightnessSectionTitle => 'Lux / nits / ft-L + drempel';

  @override
  String get videoBrightnessSubtitle => 'Lux / nits / ft-L + drempel';

  @override
  String get videoBrightnessTitle => 'Helderheid';

  @override
  String get videoCalc1ErrMissing => 'Ontbrekende gegevens: Afstand + breedte.';

  @override
  String videoCalc1Ok(Object ratio) {
    return 'Projectieverhouding = $ratio';
  }

  @override
  String get videoCalc1Title => 'Verhouding (afstand / breedte)';

  @override
  String get videoCalc2ErrMissing =>
      'Ontbrekende gegevens: Afstand + Verhouding.';

  @override
  String videoCalc2Ok(Object width) {
    return '✅ Beeldbreedte = $width m';
  }

  @override
  String get videoCalc2Title => 'Breedte (Afstand / Verhouding)';

  @override
  String get videoCalc3ErrMissingWidth => 'Ontbrekende gegevens: Breedte.';

  @override
  String videoCalc3Ok(Object format, Object height) {
    return '✅ Hoogte = $height m (formaat $format)';
  }

  @override
  String get videoCalc3Title => 'Hoogte (breedte + formaat)';

  @override
  String get videoCalc4ErrGt0 => 'Lumens/Gain/Width moet > 0 zijn.';

  @override
  String get videoCalc4ErrMissing =>
      'Ontbrekende gegevens: Lumen + versterking + breedte.';

  @override
  String get videoCalc4ErrMissingSimple =>
      'Ontbrekende gegevens: Breedte + Lumens + Gain.';

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
    return 'Oppervlakte: $area m² (formaat $format)\nLux (lm/m²): $lux\nLux eq (versterking): $luxEq\nHelderheid: $nits nits | $fl ft-L\nMinimumdrempel ($presetLabel): $minFl ft-L → $status\nOpmerking: nits/ft-L conversie gebaseerd op een Lambertiaanse aanname (bij benadering).';
  }

  @override
  String get videoCalc4Title => 'Helderheid (lux / nits / ft-L + drempel)';

  @override
  String get videoCalc5ErrMissing =>
      'Ontbrekende gegevens: Totale breedte + Overlap% + Aantal spots.';

  @override
  String get videoCalc5ErrNMin2 => 'Het aantal spots moet ≥ 2 zijn.';

  @override
  String get videoCalc5NHint => 'ex: 2';

  @override
  String get videoCalc5NLabel => 'Aantal spots (N)';

  @override
  String videoCalc5Result(Object format, Object hTot, Object n, Object overlapM,
      Object overlapPct, Object wPer, Object wTot) {
    return 'Totale breedte: $wTot m\nN: $n | Overlap: $overlapPct% (op projo breedte)\n\n- Breedte per projector: $wPer m\n- Overlap tussen 2 projectoren: $overlapM m\n- Totale hoogte (formaat $format): $hTot m';
  }

  @override
  String get videoCalc5Title => 'Overlap (totale breedte + N)';

  @override
  String get videoCalc6ErrMissingBasics =>
      'Ontbrekende gegevens: Totale breedte + Afstand + Overlap%.';

  @override
  String get videoCalc6ErrMissingRatio =>
      'Ontbrekende gegevens: Min ratio en/of Max ratio.';

  @override
  String get videoCalc6GainHint => 'ex: 1,0';

  @override
  String get videoCalc6GainLabel => 'Toename (calc. 6)';

  @override
  String get videoCalc6LumensPerProjectorHint => 'bijv. 20.000';

  @override
  String get videoCalc6LumensPerProjectorLabel => 'Lumen per projector';

  @override
  String get videoCalc6LumiErrGt0 =>
      'Helderheid: ❌ Lumen/projo en versterking moet > 0 zijn.';

  @override
  String videoCalc6LumiForN(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Geschatte lichtkracht (N=$n)\nOppervlakte: $area m²\nLux eq: $lux (lm/m²)\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoCalc6LumiOptional =>
      'Helderheid (optioneel): voert Lumens/projo + Gain in voor schatting.';

  @override
  String get videoCalc6NoteIndicative =>
      'Opmerking: indicatieve schatting (werkelijke mix/overlap kan iets minder zijn).';

  @override
  String get videoCalc6RatioMaxHint => 'ex: 1,80';

  @override
  String get videoCalc6RatioMaxLabel => 'Maximale verhouding';

  @override
  String get videoCalc6RatioMinHint => 'ex: 1,20';

  @override
  String get videoCalc6RatioMinLabel => 'Verhouding min';

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
    return 'Total width=$wTot m | Distance=$distance m | Overlap=$overlapPct%\nFormaat $format → Totale hoogte=$hTot m | Oppervlakte=$area m²\nVerhouding min/max: $ratioMin → $ratioMax\n\nVerhouding meer open (min) = $nMin projos | dekking ≈ $covMin m\n$lumiMin\n\nVerhouding zaak scherper (max) = $nMax projos | dekking ≈ $covMax m\n$lumiMax\n\n$note';
  }

  @override
  String get videoCalc6Title => 'Aantal autospots + helderheid';

  @override
  String videoCalcLabel(Object n) {
    return 'Berekening $n';
  }

  @override
  String get videoCalculateAll => 'Bereken alle';

  @override
  String get videoCalculationsTitle => 'Video berekeningen';

  @override
  String get videoCommonParamsTitle => 'Algemene parameters';

  @override
  String videoCommonPillArea(Object value) {
    return 'Oppervlak: $value';
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
    return 'Overlap: $value';
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
  String get videoCopyAllTooltip => 'Alle resultaten kopiëren';

  @override
  String get videoCopySummaryTooltip => 'Kopieer de samenvatting';

  @override
  String get videoDisclaimerShort =>
      'Indicatieve berekeningen. Raadpleeg altijd de documentatie van de fabrikant.';

  @override
  String get videoDistanceHint => 'ex: 12,0';

  @override
  String get videoDistanceLabel => 'Projectieafstand (m)';

  @override
  String get videoErrImpossibleDenom => 'Onmogelijke parameters (denom ≤ 0).';

  @override
  String get videoErrOverlapRange => 'Overlap% moet tussen 0 en 99,9 liggen.';

  @override
  String get videoErrRatioGt0 => 'De verhouding moet > 0 zijn.';

  @override
  String get videoErrTotalWidthAndDistanceGt0 =>
      'De totale breedte en afstand moeten > 0 zijn.';

  @override
  String get videoErrTotalWidthGt0 => 'De totale breedte moet > 0 zijn.';

  @override
  String get videoErrWidthGt0 => 'De breedte moet > 0 zijn.';

  @override
  String get videoExportPdfTooltip => 'PDF exporteren';

  @override
  String get videoFormatLabel => 'Formaat (verhouding)';

  @override
  String get videoGainHint => 'ex: 1,0';

  @override
  String get videoGainLabel => 'Aanwinst';

  @override
  String get videoImageWidthHint => 'ex: 6,0';

  @override
  String get videoImageWidthLabel => 'Beeldbreedte (m)';

  @override
  String get videoLedCalcTitle => 'Berekening - Pixels / tegels';

  @override
  String get videoLedErrAllGt0 => 'Alle waarden moeten > 0 zijn.';

  @override
  String get videoLedErrMissingInputs =>
      'Ontbrekende gegevens: Tegels X/Y + Tegel px + Tegel cm.';

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
    return '✅ Resolutie wand: $wallWpx × $wallHpx px\n✅ Afmeting wand: $wallWm × $wallHm m\nTegel: $tileWpx×$tileHpx px - $tileWcm×$tileHcm cm\nBerekende steek: $pitch';
  }

  @override
  String get videoLedSubtitle =>
      'LED-wandpixels volgens grootte, steek, tegelafmetingen.';

  @override
  String get videoLedTileHcmHint => 'ex: 33,28';

  @override
  String get videoLedTileHcmLabel => 'Tegelhoogte (cm)';

  @override
  String get videoLedTileHpxHint => 'ex: 128';

  @override
  String get videoLedTileHpxLabel => 'Tegelhoogte (px)';

  @override
  String get videoLedTileWcmHint => 'ex: 33,28';

  @override
  String get videoLedTileWcmLabel => 'Tegelbreedte (cm)';

  @override
  String get videoLedTileWpxHint => 'ex: 128';

  @override
  String get videoLedTileWpxLabel => 'Tegelbreedte (px)';

  @override
  String get videoLedTilesXHint => 'ex: 15';

  @override
  String get videoLedTilesXLabel => 'Horizontale tegels (X)';

  @override
  String get videoLedTilesYHint => 'ex: 8';

  @override
  String get videoLedTilesYLabel => 'Verticale tegels (Y)';

  @override
  String get videoLedTitle => 'LED';

  @override
  String get videoLensMeasureSubtitle =>
      'Verhouding / breedte / hoogte (berekeningen 1 tot 3).';

  @override
  String get videoLensMeasureTitle => 'Lens & meting';

  @override
  String get videoLmCalc1Title => 'Verhouding (afstand / breedte)';

  @override
  String get videoLmCalc2Title => 'Breedte (Afstand / Verhouding)';

  @override
  String get videoLmCalc3Title => 'Hoogte (breedte + formaat)';

  @override
  String get videoLmDistanceHint => 'ex: 12,0';

  @override
  String get videoLmDistanceLabel => 'Projectieafstand (m)';

  @override
  String get videoLmErrMissingDistanceRatio =>
      'Ontbrekende gegevens: Afstand + Verhouding.';

  @override
  String get videoLmErrMissingDistanceWidth =>
      'Ontbrekende gegevens: Afstand + breedte.';

  @override
  String get videoLmErrMissingWidthOnly => 'Ontbrekende gegevens: Breedte.';

  @override
  String get videoLmErrRatioGt0 => 'Verhouding moet > 0 zijn.';

  @override
  String get videoLmErrWidthGt0 => 'De breedte moet > 0 zijn.';

  @override
  String get videoLmFormatLabel => 'Formaat (verhouding)';

  @override
  String get videoLmImageWidthHint => 'ex: 6,0';

  @override
  String get videoLmImageWidthLabel => 'Beeldbreedte (m)';

  @override
  String videoLmResultHeight(Object format, Object height) {
    return '✅ Hoogte = $height m (formaat $format)';
  }

  @override
  String videoLmResultRatio(Object ratio) {
    return 'Projectieverhouding = $ratio';
  }

  @override
  String videoLmResultWidth(Object width) {
    return '✅ Beeldbreedte = $width m';
  }

  @override
  String get videoLmThrowRatioHint => 'ex: 1,60';

  @override
  String get videoLmThrowRatioLabel => 'Projectieverhouding';

  @override
  String get videoLumensHint => 'bijv. 20.000';

  @override
  String get videoLumensLabel => 'Lumen (ANSI)';

  @override
  String get videoMireHeaderSubtitle =>
      'Indicatieve testpatronen (kalibratie, focus, geometrie, overvloeien, pixel perfect).';

  @override
  String get videoMireHeaderTitle => 'Patroongenerator';

  @override
  String get videoMireScreenLedSubtitle =>
      'Testpatroon volgens BxH px (pixel perfect, uniformiteit, raster).';

  @override
  String get videoMireScreenLedTitle => 'LED-scherm zicht';

  @override
  String get videoMireScreenVideoSubtitle =>
      'Eenvoudig (BxH px) + Multi-project mapping (N + overlap).';

  @override
  String get videoMireScreenVideoTitle => 'Testpatroon videoscherm';

  @override
  String get videoMireTitle => 'Zicht';

  @override
  String get videoMpCalc5Title => 'Breedte per spot';

  @override
  String get videoMpCalc6Title => 'Aantal spots (min/max-verhouding)';

  @override
  String videoMpCaseOpenMin(Object coverage, Object n) {
    return 'Geval ratio meer open (min) = $n projos | dekking ≈ $coverage m';
  }

  @override
  String videoMpCaseTightMax(Object coverage, Object n) {
    return 'Strengere verhouding geval (max) = $n projos | dekking ≈ $coverage m';
  }

  @override
  String get videoMpDistanceHint => 'ex: 12,0';

  @override
  String get videoMpDistanceLabel => 'Projectieafstand (m)';

  @override
  String get videoMpErrImpossibleDenom => 'Onmogelijke parameters (denom ≤ 0).';

  @override
  String get videoMpErrInvalidRatio => 'Ongeldige verhouding (moet > 0 zijn).';

  @override
  String get videoMpErrMissing5 =>
      'Ontbrekende gegevens: Totale breedte + Overlap% + N.';

  @override
  String get videoMpErrMissing6Main =>
      'Ontbrekende gegevens: Totale breedte + Afstand + Overlap%.';

  @override
  String get videoMpErrMissingRatios =>
      'Ontbrekende gegevens: Verhouding min en/of Verhouding max.';

  @override
  String get videoMpErrNGte2 => 'N moet ≥ 2 zijn.';

  @override
  String get videoMpErrOverlapRange => 'Overlap% moet tussen 0 en 99,9 liggen.';

  @override
  String get videoMpErrWidthDistanceGt0 =>
      'De totale breedte en afstand moeten > 0 zijn.';

  @override
  String get videoMpErrWidthGt0 => 'De totale breedte moet > 0 zijn.';

  @override
  String get videoMpFormatLabel => 'Formaat (verhouding)';

  @override
  String get videoMpGainHint => 'ex: 1,0';

  @override
  String get videoMpGainLabel => 'Aanwinst';

  @override
  String get videoMpLumensPerProjectorHint => 'bijv. 20.000';

  @override
  String get videoMpLumensPerProjectorLabel => 'Lumen per projector';

  @override
  String get videoMpLumiErrLumensGainGt0 =>
      'Helderheid: ❌ Lumen/projo en versterking moet > 0 zijn.';

  @override
  String videoMpLumiEstimated(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Geschatte lichtkracht (N=$n)\nOppervlakte: $area m²\nLux eq: $lux\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoMpLumiOptionalHint =>
      'Helderheid (optioneel): Voer Lumens/projo + Gain in om te schatten.';

  @override
  String get videoMpNoteIndicative => 'Opmerking: indicatieve schatting.';

  @override
  String get videoMpOptionalLuminanceTitle => 'Optioneel: helderheid';

  @override
  String get videoMpOverlapHint => 'ex: 10';

  @override
  String get videoMpOverlapLabel => 'Overlap (%)';

  @override
  String get videoMpProjectorCountHint => 'ex: 2';

  @override
  String get videoMpProjectorCountLabel => 'Aantal spots (N)';

  @override
  String get videoMpRatioMaxHint => 'ex: 1,80';

  @override
  String get videoMpRatioMaxLabel => 'Maximale verhouding';

  @override
  String get videoMpRatioMinHint => 'ex: 1,20';

  @override
  String get videoMpRatioMinLabel => 'Verhouding min';

  @override
  String get videoMpTotalWidthHint => 'ex: 18,0';

  @override
  String get videoMpTotalWidthLabel => 'Totale projectiebreedte (m)';

  @override
  String get videoMultiprojectorSubtitle =>
      'Overlap + breedte/projo + aantal projecten (berekeningen 5 & 6).';

  @override
  String get videoMultiprojectorTitle => 'Multi-projector';

  @override
  String get videoOptionalBrightnessTitle => 'Optioneel: helderheid';

  @override
  String get videoOverlapHint => 'ex: 10';

  @override
  String get videoOverlapLabel => 'Overlap (%)';

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
  String get videoPdfCalc5N => 'N (calc5)';

  @override
  String get videoPdfCalc6 => 'Berekening 6';

  @override
  String get videoPdfCalc6Gain => 'Toename (calc6)';

  @override
  String get videoPdfCalc6LumensPerProj => 'Lumen/projo (calc6)';

  @override
  String get videoPdfCalc6RatioMax => 'Max verhouding (calc6)';

  @override
  String get videoPdfCalc6RatioMin => 'Verhouding min (calc6)';

  @override
  String get videoPdfDate => 'Datum';

  @override
  String get videoPdfDistance => 'Afstand (m)';

  @override
  String get videoPdfFormat => 'Formaat';

  @override
  String get videoPdfGain => 'Aanwinst';

  @override
  String get videoPdfImageWidth => 'Beeldbreedte (m)';

  @override
  String get videoPdfLumens => 'Lumen';

  @override
  String get videoPdfOverlap => 'Overlap (%)';

  @override
  String get videoPdfParams => 'Parameters';

  @override
  String get videoPdfRatio => 'Verhouding';

  @override
  String get videoPdfResults => 'Resultaten';

  @override
  String get videoPdfScreenPreset => 'Scherm voorinstelling';

  @override
  String get videoPdfTitle => 'Mijn Technische Applicatie - Video Exporteren';

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
  String get videoPresetFrontWhite => 'Voorkant - mat wit scherm (gain 1.0)';

  @override
  String get videoPresetFrontWhiteShort => 'Voorkant - mat wit scherm';

  @override
  String get videoPresetMappingDarkStone =>
      'Mapping - donkere steen (winst 0,35)';

  @override
  String get videoPresetMappingDarkStoneShort =>
      'In kaart brengen - donkere steen';

  @override
  String get videoPresetMappingGlass => 'Mapping - glas (winst 0,15)';

  @override
  String get videoPresetMappingGlassShort => 'In kaart brengen - glas';

  @override
  String get videoPresetMappingLightStone =>
      'Mapping - lichte steen (winst 0,6)';

  @override
  String get videoPresetMappingLightStoneShort =>
      'In kaart brengen - heldere steen';

  @override
  String get videoPresetMappingMatte => 'Mapping - matte verf (winst 0,75)';

  @override
  String get videoPresetMappingMatteShort => 'Mapping - matte verf';

  @override
  String get videoPresetMappingSatin => 'Mapping - satijnverf (winst 0,9)';

  @override
  String get videoPresetMappingSatinShort => 'Mapping - satijnverf';

  @override
  String get videoPresetRearClear => 'Retro - licht canvas (winst 0,9)';

  @override
  String get videoPresetRearClearShort => 'Retro - lichtgekleurd canvas';

  @override
  String get videoPresetRearDiffusion =>
      'Retro - diffusiecanvas (versterking 0,7)';

  @override
  String get videoPresetRearDiffusionShort => 'Retro - verspreidingsdoek';

  @override
  String get videoScreenPresetLabel =>
      'Scherm / Ondersteuning (vooraf ingesteld)';

  @override
  String get videoSummaryPillsTitle => 'Samenvatting (tabletten)';

  @override
  String get videoTestPatternSubtitle =>
      'Aanmaken van videotestpatronen voor LED-schermen en -muren (wordt later gedaan).';

  @override
  String get videoTestPatternTitle => 'Zicht';

  @override
  String get videoThrowRatioHint => 'ex: 1,60';

  @override
  String get videoThrowRatioLabel => 'Projectieverhouding';

  @override
  String get videoTitle => 'Video';

  @override
  String get videoToolsTitle => 'Video hulpmiddelen';

  @override
  String get videoTotalWidthHint => 'ex: 18,0';

  @override
  String get videoTotalWidthLabel => 'Totale projectiebreedte (m)';

  @override
  String get aboutArtnetTitle => 'Kunst-Net';

  @override
  String get aboutArtnetToc01 => '1) Art-Net - wat het is en waarom';

  @override
  String get aboutArtnetToc02 => '2) Adressering & universum - eigen mapping';

  @override
  String get aboutArtnetToc03 => '3) Grenzen & perf - wat het eerst breekt';

  @override
  String get aboutArtnetToc04 => '4) Nodes, splitters & RDM';

  @override
  String get aboutArtnetToc05 => '5) Problemen oplossen - symptomen → oorzaken';

  @override
  String get aboutArtnetToc06 =>
      '6) Diagrammen (netwerk / unicast vs broadcast)';

  @override
  String get aboutArtnetToc07 =>
      '6bis) Afbeeldingen (activa) - RJ45/switch/kabels';

  @override
  String get aboutArtnetToc08 => '7) Snelle checklist';

  @override
  String get aboutDmxToc01 => '1) DMX, universes, adressen - de basis';

  @override
  String get aboutDmxToc02 => '2) DMX-frame - pauze, startcode, kanalen';

  @override
  String get aboutDmxToc03 => '3) RS-485 bekabeling - topologie & kabel';

  @override
  String get aboutDmxToc04 =>
      '4) Terminatie & splitters - reflecties vermijden';

  @override
  String get aboutDmxToc05 => '4bis) RDM - grenzen & compatibiliteiten';

  @override
  String get aboutDmxToc06 =>
      '5) Problemen oplossen in het veld - symptomen → oorzaken';

  @override
  String get aboutDmxToc07 => '6) Art-Net - oriëntatiepunten';

  @override
  String get aboutDmxToc08 => '7) sACN / E1.31 - multicast, IGMP, prioriteiten';

  @override
  String get aboutDmxToc09 => '8) DMX vs Art-Net vs sACN - kiezen';

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
  String get aboutElectriciteToc03 => '3) Mono / Tri (wat is het verschil)';

  @override
  String get aboutElectriciteToc04 => '4) Snelle tafel (16A → 400A)';

  @override
  String get aboutElectriciteToc05 => '5) Veiligheid & valkuilen';

  @override
  String get aboutElectriciteToc06 => '6) Checklist';

  @override
  String get aboutInformatiqueTitle => 'IT';

  @override
  String get aboutInformatiqueToc01 => '1) USB / USB-C / Thunderbolt';

  @override
  String get aboutInformatiqueToc02 => '2) Opslag (SATA / NVMe / SSD)';

  @override
  String get aboutInformatiqueToc03 => '3) Videoverbindingen (DP / HDMI)';

  @override
  String get aboutInformatiqueToc04 => '4) PCIe / GPU (benchmarks)';

  @override
  String get aboutInformatiqueToc05 => '5) Checklist (dienblad)';

  @override
  String get aboutIpBasicsToc01 =>
      '1) Wat is een IP en waar wordt het voor gebruikt?';

  @override
  String get aboutIpBasicsToc02 =>
      '2) Waarom 192.x / 10.x / 172.x? (privéadressen)';

  @override
  String get aboutIpBasicsToc03 => '3) Maskers & subnetwerken: echt begrijpen';

  @override
  String get aboutIpBasicsToc04 => '4) DHCP, gateway, DNS: wie doet wat?';

  @override
  String get aboutIpBasicsToc05 =>
      '5) Hoe twee apparaten met elkaar praten (LAN vs. niet-LAN)';

  @override
  String get aboutIpBasicsToc06 =>
      '6) Eenvoudige IP \"show\" plannen (kant-en-klare voorbeelden)';

  @override
  String get aboutIpBasicsToc07 =>
      '7) Problemen oplossen: symptomen → oorzaken (veldmethode)';

  @override
  String get aboutIpBasicsToc08 =>
      '8) Mini-oefeningen (snel een masker/netwerk controleren)';

  @override
  String get aboutIpBasicsToc09 => '9) Snelle checklist';

  @override
  String get aboutNetworkTitle => 'Netwerk (EN)';

  @override
  String get aboutNetworkToc01 => '1) Doel: stabiel netwerk';

  @override
  String get aboutNetworkToc02 => '2) IP-plan (eenvoudig)';

  @override
  String get aboutNetworkToc03 => '3) VLAN (scheiding)';

  @override
  String get aboutNetworkToc04 => '4) IGMP (sACN multicast)';

  @override
  String get aboutNetworkToc05 => '5) Wi-Fi vs. bekabeld';

  @override
  String get aboutNetworkToc06 => '6) Overstappen: wat je nodig hebt';

  @override
  String get aboutNetworkToc07 => '7) Diagrammen';

  @override
  String get aboutNetworkToc08 => '7bis) Afbeeldingen (activa)';

  @override
  String get aboutNetworkToc09 => '8) Checklist';

  @override
  String get aboutReseauTitle => 'Netwerk';

  @override
  String get aboutReseauToc01 => '1) Netwerkbeginselen (LAN / IP / doorvoer)';

  @override
  String get aboutReseauToc02 => '2) RJ45 & categorieën (Cat5e/6/6A/...)';

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
  String get aboutReseauToc08 => '8) Checklist';

  @override
  String get aboutSacnToc01 => '1) Waar wordt sACN voor gebruikt?';

  @override
  String get aboutSacnToc02 => '2) Universum (nummering)';

  @override
  String get aboutSacnToc03 => '3) Multicast / Unicast + IGMP';

  @override
  String get aboutSacnToc04 => '4) Prioriteiten (meerdere bronnen)';

  @override
  String get aboutSacnToc05 => '5) Grenzen / prestaties';

  @override
  String get aboutSacnToc06 =>
      '6) RDM & sACN (proxy / afhankelijk van apparatuur)';

  @override
  String get aboutSacnToc07 => '7) Diagrammen';

  @override
  String get aboutSacnToc08 => '7bis) Afbeeldingen (activa)';

  @override
  String get aboutSacnToc09 => '8) Checklist';

  @override
  String get aboutVideoToc01 => '1) Videobasis (trefwoorden)';

  @override
  String get aboutVideoToc02 => '2) Resolutie en FPS';

  @override
  String get aboutVideoToc03 => '3) Kleur (4:4:4 / 4:2:2 / 10-bits)';

  @override
  String get aboutVideoToc04 => '4) Synchronisatie (Genlock / Tijdcode)';

  @override
  String get aboutVideoToc05 => '5) Kabels en afstanden';

  @override
  String get aboutVideoToc06 => '6) SDI (3G / 6G / 12G)';

  @override
  String get aboutVideoToc07 => '7) HDMI - veld';

  @override
  String get aboutVideoToc08 => '8) NDI - wanneer / waarom / grenzen';

  @override
  String get aboutVideoToc09 => '9) Mapping / LED / multi-projo';

  @override
  String get aboutVideoToc10 => '10) Veldcontrolelijst';

  @override
  String get aboutTileDmxTitle => 'DMX - bediening (eenvoudig & volledig)';

  @override
  String get aboutTileArtnetTitle =>
      'Art-Net - DMX over IP (knooppunten, unicast/broadcast)';

  @override
  String get aboutTileSacnTitle =>
      'sACN / E1.31 - multicast, IGMP, prioriteiten';

  @override
  String get aboutTileIpBasicsTitle =>
      'Netwerk - IP-bases / masker / DHCP (essentieel)';

  @override
  String get aboutTileReseauTitle =>
      'Netwerk - RJ45 / glasvezel / snelheden & lengtes';

  @override
  String get aboutTileNetworkTitle =>
      'Licht netwerk - VLAN, IGMP, Wi-Fi vs. bekabeld';

  @override
  String get aboutTileVideoTitle => 'Video - SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutTileElectriciteTitle => 'Elektrisch - Schuko / P17 / voeding';

  @override
  String get aboutTileElectriciteSubtitle =>
      'Connectoren, mono/tri, snelle kW-panelen (16A→400A), veldvallen.';

  @override
  String get aboutTileInformatiqueTitle =>
      'IT - USB / HDMI / DP / SATA / NVMe...';

  @override
  String get aboutTileInformatiqueSubtitle =>
      'Nuttige snelheden, versies, echte limieten, marketingvalkuilen.';

  @override
  String get aboutTitle => 'Over ons';

  @override
  String get homeRiggingTitle => 'Tuigage';

  @override
  String get homeRiggingSubtitle => 'Hoofdstellen: stroppen hoeken en lengtes.';

  @override
  String get riggingTitle => 'Tuigage';

  @override
  String get riggingAngleLengthTitle => 'Slingerhoek & -lengte';

  @override
  String get riggingSymmetryNote =>
      'Aanname: symmetrisch hoofdstel (2 identieke strengen). Geen belastingsberekening.';

  @override
  String get riggingInputsTitle => 'Ingangen';

  @override
  String get riggingSpanLabel => 'Centrumafstand (afstand tussen punten)';

  @override
  String get riggingSpanHint => 'Ex : 2.40';

  @override
  String get riggingDropLabel => 'Pijl (verticale daling)';

  @override
  String get riggingDropHint => 'Ex : 0,60';

  @override
  String get riggingUnitMeters => 'm';

  @override
  String get riggingResultsTitle => 'Resultaten';

  @override
  String get riggingNeedPositiveValues => 'Voer waarden > 0 in.';

  @override
  String get riggingLegLengthLabel => 'Lengte van een streng';

  @override
  String get riggingAngleToHorizontalLabel => 'Hoek t.o.v. horizontaal';

  @override
  String get riggingAngleToVerticalLabel => 'Hoek vanaf verticaal';

  @override
  String get riggingDisclaimerShort =>
      'Indicatieve resultaten. Te valideren op basis van uw context en riggingpraktijken.';

  @override
  String get riggingCalcLegDropTitle => 'Lengte + doorbuiging → overspanning';

  @override
  String get riggingCalcLegDropHelp =>
      'Symmetrische strop (2 strengen): berekent de spanwijdte uit de stroplengte en de doorbuiging.';

  @override
  String get riggingLegLengthInputLabel => 'Lengte van een streng';

  @override
  String get riggingLegLengthInputHint => 'Ex: 2,50';

  @override
  String get riggingInvalidTriangle =>
      'Onmogelijk: de lengte moet groter zijn dan de pijl.';

  @override
  String get riggingCalcLegAngleTitle =>
      'Lengte + hoek → overspanning + doorbuiging';

  @override
  String get riggingCalcLegAngleHelp =>
      'Symmetrische strop (2 strengen): berekent reikwijdte en doorbuiging uit lengte en hoek ten opzichte van de horizontaal.';

  @override
  String get riggingAngleHorizontalInputLabel => 'Hoek t.o.v. horizontaal';

  @override
  String get riggingAngleHorizontalInputHint => 'Ex: 30';

  @override
  String get riggingInvalidAngle =>
      'Ongeldige hoek: tussen 0° en 90° (uitgesloten).';

  @override
  String get riggingUnitDegrees => '°';

  @override
  String get riggingCalc1Title =>
      'Afstand hart op hart + doorbuiging → lengte & hoeken';

  @override
  String get riggingCalc1Subtitle =>
      'Symmetrisch hoofdstel (2 identieke strengen). Gewicht weergegeven (info). Geen belastingsberekening.';

  @override
  String get riggingCalc2Title =>
      'Centrumafstand + hoek (H) → doorbuiging & lengte';

  @override
  String get riggingCalc2Subtitle =>
      'Hoek ten opzichte van de horizontaal. Symmetrisch hoofdstel. Geen belastingsberekening.';

  @override
  String get riggingCalc3Title =>
      'Afstand hart op hart + lengte → doorbuiging & hoeken';

  @override
  String get riggingCalc3Subtitle =>
      'Lengte van één streng bekend. Symmetrisch hoofdstel. Geen belastingsberekening.';

  @override
  String get riggingLegLengthHint => 'Ex: 4,70';

  @override
  String get riggingAngleHint => 'Ex : 45';

  @override
  String get riggingInvalidGeometry =>
      'Onmogelijke geometrie (lengte te kort voor hartafstand).';

  @override
  String get riggingSchemaTitle => 'Diagram';

  @override
  String get riggingSchemaCaption1 =>
      'Ingangen: spanwijdte + doorbuiging. Uitgangen: hijslengte + hoeken.';

  @override
  String get riggingSchemaCaption2 =>
      'Invoer: spanwijdte + stroppengte. Uitgangen: doorbuiging + hoeken.';

  @override
  String get riggingSchemaCaption3 =>
      'Invoer: spanwijdte + hoek (horizontaal). Uitvoer: pijl + lengte.';

  @override
  String get riggingAngleHInputLabel => 'Hoek (ten opzichte van horizontaal)';

  @override
  String get riggingAngleHInputHint => 'Ex: 45';

  @override
  String get riggingDropResultLabel => 'Pijl (druppel)';

  @override
  String get riggingSchemaLabelSpan => 'Centrum-tot-centrum';

  @override
  String get riggingSchemaLabelDrop => 'Pijl';

  @override
  String get riggingSchemaLabelLeg => 'Brin';

  @override
  String get riggingWeightLabel => 'Gewicht (info)';

  @override
  String get riggingUnitKg => 'kg';

  @override
  String get riggingImpossibleGeometry =>
      'Onmogelijke geometrie: de lengte van een streng moet > (hart op hart afstand / 2) zijn.';

  @override
  String get riggingDisclaimerNoLoad =>
      'Gewicht alleen ter indicatie. Geen berekening van belasting/spanning. Geldig in uw tuigcontext.';

  @override
  String get riggingCalcCommonSubtitle =>
      '2-strengs hoofdstel. Gewicht weergegeven (info). Geen belastingsberekening.';

  @override
  String get riggingOffCenterToggle => 'Belasting buiten het midden';

  @override
  String get riggingOffsetLabel => 'Offset A → belasting';

  @override
  String get riggingInvalidOffset =>
      'Ongeldige offset: moet > 0 en < hartafstand zijn.';

  @override
  String get riggingLegLeftLabel => 'Lengte linker streng';

  @override
  String get riggingLegRightLabel => 'Lengte rechte streng';

  @override
  String get riggingAngleHLeftLabel => 'Hoek H (links)';

  @override
  String get riggingAngleHRightLabel => 'Hoek H (recht)';

  @override
  String get riggingAngleVLeftLabel => 'Hoek V (links)';

  @override
  String get riggingAngleVRightLabel => 'Hoek V (recht)';

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
  String get photometryAreaHint4 => 'Ex: 12,5';

  @override
  String photometrySummary4(Object lumens, Object lux, Object area) {
    return 'E = $lux lx - S = $area m² → Φ = $lumens lm';
  }

  @override
  String get aboutArtnetTocConversionTitle => 'Conversies';

  @override
  String get aboutArtnetConversionIntro =>
      'Handige conversietools voor DMX, Art-Net en hexadecimale waarden.';

  @override
  String get aboutUniverseToArtnetTitle => 'Universum → Art-Net';

  @override
  String get aboutUniverseToArtnetSubtitle =>
      'Zoek Subnet + Universum (Net/Port-Adres) van een DMX-universum.';

  @override
  String get aboutUniverseToHexTitle => 'Universum → Hex';

  @override
  String get aboutUniverseToHexSubtitle =>
      'Converteer een universum (1...N) in een index en hexadecimale waarde.';

  @override
  String get aboutArtnetConversionNote =>
      'Opmerking: Art-Net conventies kunnen per console verschillen (adressering, 0/1 basis). Raadpleeg altijd de systeemdocumentatie.';

  @override
  String get elecTocCopyText => 'Kopieer de inhoudsopgave';

  @override
  String get elecToc1 => '1) Basis (W, A, V, kW)';

  @override
  String get elecToc2 => '2) Connectoren (Schuko / P17 / PowerCON)';

  @override
  String get elecToc3 => '3) Mono / Tri (wat is het verschil)';

  @override
  String get elecToc4 => '4) Snelle tafel (16A → 400A)';

  @override
  String get elecToc5 => 'Omzetting kVA → kW / A';

  @override
  String get elecToc6 => '6) Veiligheid & valkuilen';

  @override
  String get elecToc7 => '6) Checklist';

  @override
  String get elecKvaTitle => 'Tabel kVA → kW (volgens cos φ)';

  @override
  String get elecKvaFormula => 'Formule: kW = kVA × cos φ';

  @override
  String get elecKvaIntro =>
      'Deze tabel geeft een snelle schatting van actief vermogen (kW) uit schijnbaar vermogen (kVA).';

  @override
  String get elecKvaNote =>
      'Indicatieve waarden. Gebruik de reële waarden van cos φ als je ze weet.';

  @override
  String get elecKvaColKva => 'kVA';

  @override
  String get elecKvaColPf08 => 'kW (cos φ = 0,8)';

  @override
  String get elecKvaColPf10 => 'kW (cos φ = 1,0)';

  @override
  String get commonTocTitle => 'Inhoud';

  @override
  String get commonCopySummaryTooltip => 'Kopieer de inhoudsopgave';

  @override
  String get aboutLightReferenceTitle => 'Verlichtingsreferenties';

  @override
  String get refCriTitle => 'IRC / CRI';

  @override
  String get refKelvinTitle => 'Kleurtemperatuur (K)';

  @override
  String get refBeamFieldTitle => 'Straal / Veld';

  @override
  String get refLuxTitle => 'Verlichtingssterkte (lux)';

  @override
  String get refCriContent =>
      'De CRI meet de kleurgetrouwheid. Hoe hoger deze is, hoe natuurlijker de kleuren lijken.';

  @override
  String get refKelvinContent =>
      'De kleurtemperatuur beschrijft de tint wit (warm tot koel).';

  @override
  String get refBeamFieldContent =>
      'De bundel is de hoek van de hoofdbundel; het veld is de hoek waar de intensiteit zwak wordt (rand).';

  @override
  String get refBeamLegendBeam => 'Straal';

  @override
  String get refBeamLegendField => 'Veld';

  @override
  String get refLuxIntro =>
      'Indicatieve verlichtingssterkten naargelang het gebruik.';

  @override
  String get refLuxColUse => 'Gebruik';

  @override
  String get refLuxColLux => 'Lux';

  @override
  String get refLuxUseCorridor => 'Gang / circulatie';

  @override
  String get refLuxUseBackstage => 'Backstage / technisch';

  @override
  String get refLuxUseMeeting => 'Vergaderzaal';

  @override
  String get refLuxUseExpo => 'Tentoonstelling / showroom';

  @override
  String get refLuxUseStageGeneral => 'Podium - algemeen';

  @override
  String get refLuxUseStageTv => 'Podium - TV / opname';

  @override
  String get refLuxNote =>
      'Deze waarden variëren volgens de normen en beperkingen (camera, contrast, omgeving).';

  @override
  String get refLightDisclaimerShort =>
      'Indicatieve referenties - geen standaard.';

  @override
  String get refCri90 => 'Uitstekend (≥ 90)';

  @override
  String get refCri80 => 'Goed (≈ 80)';

  @override
  String get refCriLow => 'Laag (< 80)';

  @override
  String get aboutUniverseToArtnetImportantTitle => 'Belangrijk';

  @override
  String get aboutUniverseToArtnetImportantBody =>
      'Sommige consoles gebruiken een basis 0 (Universum 0..15) en andere een basis 1 (Universum 1..16).';

  @override
  String get aboutUniverseToArtnetTableTitle => 'Tafel Universum → Art-Net';

  @override
  String get aboutUniverseToArtnetTableIntro =>
      'Typische overeenkomst tussen DMX-universum en Art-Net adressering.';

  @override
  String get aboutUniverseTablesDisclaimer =>
      'Controleer altijd de conventie van je console / knooppunt.';

  @override
  String get aboutUniverseToArtnetColDmx => 'DMX Universum';

  @override
  String get aboutUniverseToArtnetColUniHex => 'Uni (hex)';

  @override
  String aboutUniverseToArtnetSubnetTitle(
      Object p0, Object p1, Object p2, Object p3) {
    return 'Subnet $p0 $p1 $p2 $p3';
  }

  @override
  String get aboutUniverseToHexPrincipleTitle => 'Principe';

  @override
  String get aboutUniverseToHexPrincipleBody =>
      'Een universum (1...N) kan worden omgezet in een index (basis 0) en vervolgens in hexadecimaal.';

  @override
  String get aboutUniverseToHexTableTitle => 'Tabel Univers → Hex';

  @override
  String get aboutUniverseToHexTableIntro =>
      'DMX-universumconversietabel → index / hex.';

  @override
  String aboutUniverseToHexBlockTitle(Object p0, Object p1) {
    return 'Blok $p0 $p1';
  }

  @override
  String get aboutUniverseToHexColDmx => 'DMX Universum';

  @override
  String get aboutUniverseToHexColIndex => 'Index';

  @override
  String get aboutArtnetPageTitle =>
      'Art-Net - DMX over IP (eenvoudig & compleet)';

  @override
  String get aboutArtnetTocTitle => 'Inhoud';

  @override
  String get aboutArtnetTocCopyTooltip => 'Markeringen kopiëren';

  @override
  String get aboutArtnetCopyLine1 => 'Art-Net = DMX over Ethernet via UDP.';

  @override
  String get aboutArtnetCopyLine2 =>
      'Schaal: vele universums via gedistribueerde (DMX-out) nodes.';

  @override
  String get aboutArtnetCopyLine3 =>
      'Distributie: broadcast (eenvoudig maar overstroming) of unicast (schoner).';

  @override
  String get aboutArtnetCopyLine4 =>
      'Echte beperkingen: Wi-Fi, basisschakelaar, firmware knooppunten, universum/mapping instellingen.';

  @override
  String get aboutArtnetCopyLine5 =>
      'RDM: mogelijk via RDM proxy afhankelijk van knooppunten (variabele ondersteuning).';

  @override
  String get aboutArtnetSection1Title => '1) Art-Net - wat het is en waarom';

  @override
  String get aboutArtnetSection2Title =>
      '2) Adressering & universum - eigen mapping';

  @override
  String get aboutArtnetSection3Title =>
      '3) Grenzen & perf - wat het eerst breekt';

  @override
  String get aboutArtnetSection4Title => '4) Nodes, splitters & RDM';

  @override
  String get aboutArtnetSection5Title =>
      '5) Problemen oplossen - symptomen → oorzaken';

  @override
  String get aboutArtnetSection6Title =>
      '6) Diagrammen (netwerk / unicast vs broadcast)';

  @override
  String get aboutArtnetSection6bTitle =>
      '6bis) Afbeeldingen (activa) - RJ45/switch/kabels';

  @override
  String get aboutArtnetSection7Title => '7) Snelle checklist';

  @override
  String get aboutArtnetConversionTablesTitle =>
      '8) Conversie / tabellen (Universum 1..256)';

  @override
  String get aboutArtnetPillUdp => 'UDP';

  @override
  String get aboutArtnetPillUniversIp => 'Universum DMX over IP';

  @override
  String get aboutArtnetPillNodesDmxOut => 'DMX-uit knooppunten';

  @override
  String get aboutArtnetSection1Paragraph =>
      'Art-Net transporteert DMX-universums over een Ethernet (IP)-netwerk. In plaats van een DMX-lijn per universum te tekenen, stuur je \"pakketten\" over het netwerk en een knooppunt zet ze om in DMX bij de machines.';

  @override
  String get aboutArtnetSection1CalloutTitle => 'Waarom het nuttig is';

  @override
  String get aboutArtnetSection1Bullet1 =>
      'Schaalbaar: veel universums op één netwerkkabel.';

  @override
  String get aboutArtnetSection1Bullet2 =>
      'Distributie: nodes dicht bij projectoren/dimmers → minder lange DMX-lijnen.';

  @override
  String get aboutArtnetSection1Bullet3 =>
      'Flexibele patch: verander snel een universum of verplaats een knooppunt.';

  @override
  String get aboutArtnetSection1Subtitle => 'Twee woorden om te onthouden';

  @override
  String get aboutArtnetSection1SubBullet1 =>
      'Art-Net vervangt DMX niet: het transporteert het over IP.';

  @override
  String get aboutArtnetSection1SubBullet2 =>
      'Stabiliteit hangt vaak meer af van het netwerk (switch, Wi-Fi, broadcast) dan van het protocol.';

  @override
  String get aboutArtnetSection2PillUniverse => 'Universum';

  @override
  String get aboutArtnetSection2PillNodePort => 'Knooppunt / poort';

  @override
  String get aboutArtnetSection2PillMapping => 'In kaart brengen';

  @override
  String get aboutDmxPageTitle => 'DMX - bediening (eenvoudig & volledig)';

  @override
  String get aboutDmxSummaryLine1 =>
      'DMX = RS-485, 512 kanalen (slots) per universum, waarden 0-255 (8-bits).';

  @override
  String get aboutDmxSummaryLine2 =>
      'Timing: 250 kbaud, volledig universum ≈ ~44 Hz (orde van grootte).';

  @override
  String get aboutDmxSummaryLine3 =>
      'Topologie: serieschakeling (geen passieve Y). 120Ω afsluiting op de laatste.';

  @override
  String get aboutDmxSummaryLine4 =>
      'RDM = bidirectionele DMX (configuratie/bewaking) → compatibiliteit splitter/node moet worden gecontroleerd.';

  @override
  String get aboutDmxSummaryLine5 =>
      'Art-Net / sACN = DMX-universums getransporteerd op Ethernet/IP via nodes.';

  @override
  String get aboutDmxSummaryLine6 =>
      'sACN = multicast + prioriteiten (IGMP snooping aanbevolen).';

  @override
  String get aboutDmxToc1 => '1) DMX, universes, adressen - de basis';

  @override
  String get aboutDmxToc2 => '2) DMX-frame - pauze, startcode, kanalen';

  @override
  String get aboutDmxToc3 => '3) RS-485 bekabeling - topologie & kabel';

  @override
  String get aboutDmxToc4 => '4) Terminatie & splitters - reflecties vermijden';

  @override
  String get aboutDmxToc4bis => '4bis) RDM - grenzen & compatibiliteiten';

  @override
  String get aboutDmxToc5 =>
      '5) Problemen oplossen in het veld - symptomen → oorzaken';

  @override
  String get aboutDmxToc6 => '6) Art-Net - oriëntatiepunten';

  @override
  String get aboutDmxToc7 => '7) sACN / E1.31 - multicast, IGMP, prioriteiten';

  @override
  String get aboutDmxToc8 => '8) DMX vs Art-Net vs sACN - kiezen';

  @override
  String get aboutDmxToc9 => '9) Veldschema\'s (DMX / IP / pinout)';

  @override
  String get aboutDmxChecklistCopyTitle => 'DMX - Veldcontrolelijst';

  @override
  String get aboutDmxChecklistCopyTitle2 =>
      'Art-Net / sACN - Veldcontrolelijst';

  @override
  String get aboutDmxChecklistCopyB1 => 'Juiste apparaatmodus (aantal kanalen)';

  @override
  String get aboutDmxChecklistCopyB2 => 'Juist DMX-adres (geen overlapping)';

  @override
  String get aboutDmxChecklistCopyB3 => 'Daisy-chain (geen passieve Y)';

  @override
  String get aboutDmxChecklistCopyB4 =>
      '120Ω afsluiting op het laatste apparaat';

  @override
  String get aboutDmxChecklistCopyB5 =>
      'DMX/RS-485 kabel (120Ω twisted pair) indien mogelijk';

  @override
  String get aboutDmxChecklistCopyB6 => 'Splitter opto indien meerdere takken';

  @override
  String get aboutDmxChecklistCopyB7 =>
      'Houd DMX indien mogelijk uit de buurt van storingsbronnen (voedingen, dimmers)';

  @override
  String get aboutDmxChecklistCopyB8 =>
      'Indien RDM: controleer compatibiliteit splitter/node + onberispelijke bekabeling';

  @override
  String get aboutDmxChecklistCopyB9 =>
      'Dedicated netwerk indien mogelijk (of VLAN)';

  @override
  String get aboutDmxChecklistCopyB10 =>
      'Schakelaar correct; IGMP snooping aanbevolen (sACN multicast)';

  @override
  String get aboutDmxChecklistCopyB11 =>
      'Unicast (vaak) of gecontroleerde multicast (flood vermijden)';

  @override
  String get aboutDmxChecklistCopyB12 =>
      'Mapping universum ↔ poorten/knooppunt gecontroleerd';

  @override
  String get aboutDmxChecklistCopyB13 =>
      'Duidelijk IP-plan (adressen, masker, DHCP vs. statisch)';

  @override
  String get aboutDmxS1Title => '1) DMX, universes, adressen - de basis';

  @override
  String get aboutDmxS1Pill1 => '1 universum = 512 slots';

  @override
  String get aboutDmxS1Pill2 => '0-255 (8-bits)';

  @override
  String get aboutDmxS1Pill3 => '16-bits = 2 kanalen';

  @override
  String get aboutDmxS1Intro =>
      'DMX512 is een besturingsprotocol dat veel wordt gebruikt in entertainment (verlichting, effecten, dimmers). Het is een seriële stroom (RS-485) die een doorgelust \"frame\" met maximaal 512 waarden verstuurt. Elke waarde = een kanaal (0→255).';

  @override
  String get aboutDmxS1RememberTitle => 'Om te onthouden';

  @override
  String get aboutDmxS1RememberB1 =>
      '1 DMX-universum = 512 kanalen (slots) genummerd 1→512.';

  @override
  String get aboutDmxS1RememberB2 =>
      'Een apparaat luistert naar een startadres (bijvoorbeeld 101) en verbruikt N kanalen (afhankelijk van de modus).';

  @override
  String get aboutDmxS1RememberB3 =>
      'De controller verzendt alles continu: als je stopt met verzenden, \"bevriezen\" de apparaten (of gaan in fallback).';

  @override
  String get aboutDmxS4bisTitle => '4bis) RDM - grenzen & compatibiliteiten';

  @override
  String get aboutDmxS4bisPlaceholder => '... (behoud je bestaande inhoud)';

  @override
  String get aboutDmxS9Title => '9) Veldschema\'s (DMX / IP / pinout)';

  @override
  String get aboutDmxS9Diagram1 => 'DMX-timing (break / MAB / slots)';

  @override
  String get aboutDmxS9Diagram2 => 'DMX-topologie: serieschakeling';

  @override
  String get aboutDmxS9Diagram3 => '120Ω beëindiging';

  @override
  String get aboutDmxS9Diagram4 => 'sACN multicast: IGMP herinnering (netwerk)';

  @override
  String get aboutDmxS9Diagram5 => 'IP → knooppunten → DMX (Art-Net / sACN)';

  @override
  String get aboutDmxS9Diagram6 => 'XLR5 pin-out (DMX)';

  @override
  String get aboutDmxS10Title => '10) Snelle checklist';

  @override
  String get aboutDmxS10CopyTooltip => 'Kopieer de checklist';

  @override
  String get aboutDmxS10CalloutTitle => 'Voordat je in paniek raakt';

  @override
  String get aboutDmxS10B1 => 'Apparaatmodus + DMX-adres (altijd controleren).';

  @override
  String get aboutDmxS10B2 =>
      'Korte ketting met een \"bekende OK\" kabel voor isolatie.';

  @override
  String get aboutDmxS10B3 => 'Daisy-chain (geen passieve Y).';

  @override
  String get aboutDmxS10B4 => '120Ω afsluiting alleen op laatste apparaat.';

  @override
  String get aboutDmxS10B5 => 'Splitter opto als er meerdere takken zijn.';

  @override
  String get aboutDmxS10B6 =>
      'Indien RDM: compatibele splitter/node + onberispelijke bekabeling.';

  @override
  String get aboutDmxS10B7 =>
      'In IP (Art-Net/sACN): juiste switch, IGMP voor multicast sACN, unicast bij twijfel.';

  @override
  String get aboutDmxFooterNote =>
      'Indicatieve info (veld). Exact gedrag kan verschillen tussen consoles, nodes, switches en firmware.\nHet doel hier is om het snel te begrijpen en problemen op te lossen met behulp van een betrouwbare methode.';

  @override
  String get aboutDmxPainterBreak => 'BREAK';

  @override
  String get aboutDmxPainterMab => 'MAB';

  @override
  String get aboutDmxPainterStartCode => 'Start\ncode';

  @override
  String get aboutDmxPainterSlots => 'Sleuven 1...N\n(maximaal 512)';

  @override
  String get aboutDmxPainterRefresh =>
      'Loop (verversen) - volledig universum ≈ ~44 Hz (orde van grootte)';

  @override
  String get aboutDmxPainterSourceA => 'BRON A\n(prio 100)';

  @override
  String get aboutDmxPainterSourceB => 'BRON B\n(prio 90)';

  @override
  String get aboutDmxPainterSwitchIgmp => 'SWITCH\nIGMP-snooping';

  @override
  String get aboutDmxPainterMulticastUniverse => 'MULTICAST\nUniversum U';

  @override
  String get aboutDmxPainterRx => 'RX';

  @override
  String get aboutDmxPainterIgmpNote =>
      'Zonder IGMP: overstroming\nMet IGMP: alleen geabonneerde poorten';

  @override
  String get aboutDmxPainterConsole => 'CONSOLE';

  @override
  String get aboutDmxPainterFix1 => 'FIX 1';

  @override
  String get aboutDmxPainterFix2 => 'FIX 2';

  @override
  String get aboutDmxPainterFix3 => 'FIX 3';

  @override
  String get aboutElectricitePageTitle => 'Elektrisch - veldbenchmarks';

  @override
  String get elecSection1Title => '1) Basis (W, A, V, kW)';

  @override
  String get elecSection1FormulasTitle => '3 nuttige formules';

  @override
  String get elecSection1Formula1 => 'P (W) = U (V) × I (A)';

  @override
  String get elecSection1Formula2 => 'I (A) = P (W) / U (V)';

  @override
  String get elecSection1Formula3 => 'P (kW) = P (W) / 1000';

  @override
  String get elecSection1FieldMarksTitle => 'Bezienswaardigheden';

  @override
  String get elecSection1FieldMark1 =>
      'Mono 230V: 16A ≈ 3,7 kW | 32A ≈ 7,4 kW | 63A ≈ 14,5 kW';

  @override
  String get elecSection1FieldMark2 =>
      'Drie 400V: 16A ≈ 11 kW | 32A ≈ 22 kW | 63A ≈ 44 kW';

  @override
  String get elecSection2Title => '2) Connectoren (Schuko / P17 / PowerCON)';

  @override
  String get elecSection2SchukoTitle =>
      'Schuko (stopcontacten voor huishoudelijk gebruik)';

  @override
  String get elecSection2SchukoBullet1 =>
      'Typisch 16A max (≈ 3,7 kW bij 230V).';

  @override
  String get elecSection2SchukoBullet2 =>
      'Wees voorzichtig met stekkerdozen en verlengsnoeren: ze kunnen warm worden.';

  @override
  String get elecSection2P17Title => 'P17 / CEE (blauw/rood)';

  @override
  String get elecSection2P17Bullet1 =>
      'Blauw: 230V mono (camping, kleine distro).';

  @override
  String get elecSection2P17Bullet2 =>
      'Rood: 400V driefasig (distro, hoog vermogen).';

  @override
  String get elecSection2PowerconTitle => 'PowerCON (audio/verlichting)';

  @override
  String get elecSection2PowerconBullet1 =>
      'PowerCON TRUE1 = meer \"veld\" (vergrendeling, IP).';

  @override
  String get elecSection2PowerconBullet2 =>
      'Controleer de kabeldoorsnede en bescherming.';

  @override
  String get elecSection3Title => '3) Mono / Tri (wat is het verschil)';

  @override
  String get elecSection3Paragraph =>
      'Mono = één fase + nul (230V). Tri = 3 fasen (400V tussen fasen).';

  @override
  String get elecSection3PitfallsTitle => 'Veelvoorkomende valkuilen';

  @override
  String get elecSection3Pitfall1 => 'Fase-onbalans (één fase overbelast).';

  @override
  String get elecSection3Pitfall2 =>
      'Neutraal wordt warm bij hoge harmonischen (LED\'s, dimmers).';

  @override
  String get elecSection3Pitfall3 =>
      'Afwezige/ twijfelachtige bodem op sommige plekken.';

  @override
  String get elecSection3MethodTitle => 'Eenvoudige methode';

  @override
  String get elecSection3MethodBullet1 =>
      'Verdeel de zware lasten over L1/L2/L3.';

  @override
  String get elecSection3MethodBullet2 =>
      'Controleer neutraal als er veel LED\'s zijn.';

  @override
  String get elecSection3MethodBullet3 => 'Klem meting indien mogelijk.';

  @override
  String get elecSection4Title => '4) Snelle tafel (16A → 400A)';

  @override
  String get elecSection4MonoTitle => 'Mono 230V (≈ U×I)';

  @override
  String get elecSection4MonoCode =>
      '16A ≈ 3,7 kW\n32A ≈ 7,4 kW\n63A ≈ 14,5 kW\n125A ≈ 28,8 kW\n200A ≈ 46 kW\n';

  @override
  String get elecSection4TriTitle => 'Drie 400V (≈ √3×U×I)';

  @override
  String get elecSection4TriCode =>
      '16 A ≈ 11 kW\n32A ≈ 22 kW\n63A ≈ 44 kW\n125A ≈ 86 kW\n200A ≈ 138 kW\n400A ≈ 277 kW\n';

  @override
  String get elecSection4ImportantTitle => 'Belangrijk';

  @override
  String get elecSection4ImportantBullet1 =>
      'Dit zijn orden van grootte (cosφ, harmonischen, verliezen).';

  @override
  String get elecSection4ImportantBullet2 =>
      'Valideer altijd beveiligingen + secties + temperatuur.';

  @override
  String get elecSection5Title => '6) Veiligheid & valkuilen';

  @override
  String get elecSection5DontDoTitle => 'Wat u niet moet doen';

  @override
  String get elecSection5DontDoBullet1 =>
      'Keten van losse stekkerdozen/verlengsnoeren.';

  @override
  String get elecSection5DontDoBullet2 => 'Fasen mengen zonder het te weten.';

  @override
  String get elecSection5DontDoBullet3 => '\"Bridger\" een dubieus land.';

  @override
  String get elecSection5WarningTitle => 'Waarschuwingen';

  @override
  String get elecSection5WarningBullet1 =>
      'Hete geur, warme handgrepen, herhaalde trekkers.';

  @override
  String get elecSection5WarningBullet2 => 'Dalende bloeddruk (brown-out).';

  @override
  String get elecSection5WarningBullet3 =>
      'Moe\" of ongeschikte stroomonderbreker.';

  @override
  String get elecSection6Title => '6) Checklist';

  @override
  String get elecSection6QuickTitle => 'Snel';

  @override
  String get elecSection6Bullet1 =>
      'Type voeding beschikbaar (mono/tri) + nominale waarde (A).';

  @override
  String get elecSection6Bullet2 => 'Faseverdeling (hoofdbelastingen).';

  @override
  String get elecSection6Bullet3 =>
      'Beveiligingen (diff/disj) en status van het schakelbord.';

  @override
  String get elecSection6Bullet4 =>
      'Kabels: doorsnede / lengte / temperatuurstijging.';

  @override
  String get elecSection6Bullet5 => 'Aarde: OK? (tester indien mogelijk).';

  @override
  String get elecFooterNote =>
      'Opmerking: deze inhoud is een checklist voor in het veld. Houd u op een echte locatie altijd aan de geldende normen, plaatselijke voorschriften en beschermende maatregelen.';

  @override
  String get infoPageTitle => 'IT - benchmarks in het veld';

  @override
  String get infoUsbTitle => '1) USB / USB-C / Thunderbolt';

  @override
  String get infoStorageTitle => '2) Opslag (SATA / NVMe / SSD)';

  @override
  String get infoVideoLinksTitle => '3) Videoverbindingen (DP / HDMI)';

  @override
  String get infoPcieGpuTitle => '4) PCIe / GPU (benchmarks)';

  @override
  String get infoChecklistTitle => '5) Checklist (dienblad)';

  @override
  String get infoSummaryCopy =>
      'INFO - benchmarks in de praktijk\n- USB-C = vorm, niet snelheid: controleer de standaard.\n- NVMe (M.2) veel sneller dan SATA.\n- DisplayPort/HDMI = standaard, maar pas op voor versies/kabels.\n- Op videoservers: opslag + GPU + doorvoer zijn de basis.';

  @override
  String get infoChecklistCopy =>
      'INFO - Checklist\n☐ Gecertificeerde USB-C kabels (data/video indien nodig)\n☐ Geschikte opslag (NVMe indien grote streams)\n☐ Stabiele GPU-stuurprogramma\'s (bekende versie)\n☐ Echte resolutie/FPS-test\n☐ Vermijd goedkope adapters';

  @override
  String get infoUsbCriticalTitle => 'Kritisch punt';

  @override
  String get infoUsbCriticalBullet1 =>
      'USB-C = connector (vorm). Het zegt niet hoe snel.';

  @override
  String get infoUsbCriticalBullet2 =>
      'Een USB-C kabel kan \"alleen opladen\" en geen data/video doorgeven.';

  @override
  String get infoUsbSpeedTitle => 'Snelheidsbenchmarks (orde van grootte)';

  @override
  String get infoUsbSpeedBullet1 =>
      'USB 2.0: traag (toetsenborden, dongles, kleine randapparatuur).';

  @override
  String get infoUsbSpeedBullet2 =>
      'USB 3.x: veel sneller (schijven, interfaces).';

  @override
  String get infoUsbSpeedBullet3 =>
      'USB4 / Thunderbolt: zeer hoge snelheid (dock, eGPU, video afhankelijk van hardware).';

  @override
  String get infoUsbParagraph =>
      'In de show: als een apparaat \"losraakt\", verdenk dan eerst de kabel (kwaliteit/standaard) en dan pas het apparaat.';

  @override
  String get infoStorageSataNvmeTitle => 'SATA vs NVMe';

  @override
  String get infoStorageSataNvmeBullet1 =>
      'SATA SSD: goed en stabiel, maar beperkt (oude interface).';

  @override
  String get infoStorageSataNvmeBullet2 =>
      'NVMe SSD (M.2): veel sneller (ideaal voor mediaservers, grote bestanden).';

  @override
  String get infoStorageFieldTitle => 'Terrein video';

  @override
  String get infoStorageFieldBullet1 =>
      'Afspelen van grote 4K/ProRes-bestanden → NVMe aanbevolen.';

  @override
  String get infoStorageFieldBullet2 =>
      'Pas op voor de temperatuur: een NVMe kan gas terugnemen (vertragen) als deze te heet wordt.';

  @override
  String get infoStorageFieldBullet3 =>
      'Test altijd in echte omstandigheden voor de show.';

  @override
  String get infoVideoLinksImportantTitle => 'Een belangrijke mijlpaal';

  @override
  String get infoVideoLinksImportantBullet1 =>
      'De versies die tellen: kabel + poort + apparaat moeten compatibel zijn.';

  @override
  String get infoVideoLinksImportantBullet2 =>
      'Lange afstand = vaak actieve/vezelconverters nodig.';

  @override
  String get infoVideoLinksCompareTitle => 'DP vs HDMI (zeer vereenvoudigd)';

  @override
  String get infoVideoLinksCompareBullet1 =>
      'HDMI: alomtegenwoordig (TV, processors), maar EDID/HDCP kan een probleem zijn.';

  @override
  String get infoVideoLinksCompareBullet2 =>
      'DisplayPort: heel gebruikelijk op PC\'s, vaak zeer \"capabel\" in termen van datasnelheid.';

  @override
  String get infoPcieGpuParagraph =>
      'Voor video/mapping servers: GPU + bus + stuurprogramma\'s = stabiliteit. Typische problemen: stuurprogramma\'s, kabels, conversie en uitvoerbeperkingen.';

  @override
  String get infoPcieGpuFieldTitle => 'Land';

  @override
  String get infoPcieGpuFieldBullet1 =>
      'Blokkeer een stabiele driverversie voor een grote show.';

  @override
  String get infoPcieGpuFieldBullet2 => 'Vermijd goedkope adapters.';

  @override
  String get infoPcieGpuFieldBullet3 =>
      'Test met de werkelijke resolutie/FPS van de show.';

  @override
  String get infoChecklistQuickTitle => 'Snel';

  @override
  String get infoChecklistBullet1 => 'Juiste kabel/standaard.';

  @override
  String get infoChecklistBullet2 => 'Opslag aangepast aan de stroom.';

  @override
  String get infoChecklistBullet3 => 'Stabiele drivers.';

  @override
  String get infoChecklistBullet4 => 'Een echte test voor de show.';

  @override
  String get infoChecklistBullet5 => 'Vermijd goedkope adapters.';

  @override
  String get infoFooterNote =>
      'Indicatieve info (terrein). Exacte capaciteiten variëren afhankelijk van uitrusting/versies.\nDoel: eenvoudige referentiepunten + betrouwbare methode.';

  @override
  String get ipBasicsPageTitle =>
      'Netwerk - IP-bases / masker / DHCP (essentieel)';

  @override
  String get ipBasicsCopyMemoTooltip => 'Memo kopiëren';

  @override
  String get ipBasicsCopyChecklistTooltip => 'Kopieer de checklist';

  @override
  String get ipBasicsMemo1 =>
      'IP = logisch adres voor het verbinden van een apparaat met een netwerk.';

  @override
  String get ipBasicsMemo2 =>
      'Privé (LAN): 10.x.x.x, 172.16-31.x.x, 192.168.x.x (niet omgeleid naar het internet).';

  @override
  String get ipBasicsMemo3 =>
      'Masker / subnet = vertelt welk deel \"netwerk\" vs \"machine\" is.';

  @override
  String get ipBasicsMemo4 =>
      'Zelfde subnet = directe communicatie. Anders → gateway (router).';

  @override
  String get ipBasicsMemo5 =>
      'DHCP wijst automatisch IP toe; statisch = nuttig voor nodes/console.';

  @override
  String get ipBasicsToc1 =>
      '1) Wat is een IP en waar wordt het voor gebruikt?';

  @override
  String get ipBasicsToc2 => '2) Waarom 192.x / 10.x / 172.x? (privéadressen)';

  @override
  String get ipBasicsToc3 => '3) Maskers & subnetwerken: echt begrijpen';

  @override
  String get ipBasicsToc4 => '4) DHCP, gateway, DNS: wie doet wat?';

  @override
  String get ipBasicsToc5 =>
      '5) Hoe twee apparaten met elkaar praten (LAN vs. niet-LAN)';

  @override
  String get ipBasicsToc6 =>
      '6) Eenvoudige IP \"show\" plannen (kant-en-klare voorbeelden)';

  @override
  String get ipBasicsToc7 =>
      '7) Problemen oplossen: symptomen → oorzaken (veldmethode)';

  @override
  String get ipBasicsToc8 =>
      '8) Mini-oefeningen (snel een masker/netwerk controleren)';

  @override
  String get ipBasicsToc9 => '9) Snelle checklist';

  @override
  String get ipBasicsSection1Paragraph =>
      'Een IP-adres (IPv4) is een logische identificatie op een netwerk. Het wordt gebruikt om te zeggen \"stuur dit pakket naar dit apparaat\".\n\nWanneer je een console, een Art-Net/sACN knooppunt, een PC, een beheerde switch, etc. aansluit, moet alles dat op het netwerk praat een consistent IP hebben zodat de apparaten elkaar kunnen vinden.';

  @override
  String get ipBasicsSection1CalloutTitle => 'Mentaal beeld';

  @override
  String get ipBasicsSection1Bullet1 =>
      'MAC = hardware-identificatie (netwerkkaart).';

  @override
  String get ipBasicsSection1Bullet2 =>
      'IP = \"postadres\" op een netwerk (wijzigbaar).';

  @override
  String get ipBasicsSection1Bullet3 =>
      'Masker = \"wijk / postcode\" (definieert het subnetwerk).';

  @override
  String get ipBasicsSection1Bullet4 =>
      'Gateway = \"uitgang uit de buurt\" (router).';

  @override
  String get ipBasicsSection1Subtitle => 'IPv4 in 10 seconden';

  @override
  String get ipBasicsSection1SubBullet1 =>
      'Formaat: A.B.C.D (4 getallen van 0 tot 255).';

  @override
  String get ipBasicsSection1SubBullet2 => 'Voorbeeld: 192.168.0.50';

  @override
  String get ipBasicsSection1SubBullet3 =>
      'Het is geen magie: het zijn 32 bits (4 bytes).';

  @override
  String get ipBasicsSection1SubBullet4 =>
      'Wat voor jou telt: IP + masker moet consistent zijn tussen apparaten.';

  @override
  String get ipBasicsSection2Paragraph =>
      'Sommige IPv4-adresreeksen zijn gereserveerd voor privé-netwerken (LAN\'s). Ze worden niet gerouteerd op het internet. Daarom worden ze gebruikt in shows: je kunt je eigen lokale netwerk opzetten zonder publieke IP\'s te \"verbruiken\".';

  @override
  String get ipBasicsSection2CalloutTitle => 'De 3 grote privéstranden (LAN)';

  @override
  String get ipBasicsSection2Bullet1 =>
      '10.0.0.0 → 10.255.255.255 (vaak geschreven als \"10.x.x.x\")';

  @override
  String get ipBasicsSection2Bullet2 =>
      '172.16.0.0 → 172.31.255.255 (vaak \"172.16-31.x.x\")';

  @override
  String get ipBasicsSection2Bullet3 =>
      '192.168.0.0 → 192.168.255.255 (vaak \"192.168.x.x\")';

  @override
  String get ipBasicsSection2Subtitle1 => 'Waarom zien we vaak 192.168.x.x?';

  @override
  String get ipBasicsSection2SubBullet1 =>
      'Consumentenkasten/routers gebruiken vaak 192.168.0.x of 192.168.1.x.';

  @override
  String get ipBasicsSection2SubBullet2 =>
      'Dit is een de facto standaard geworden in kleine LAN\'s.';

  @override
  String get ipBasicsSection2SubBullet3 =>
      'Maar in showmodus is 10.x.x.x praktisch als je veel adressen of meerdere VLAN\'s wilt.';

  @override
  String get ipBasicsSection2Subtitle2 => 'En het beroemde 2.x.x.x (Art-Net)?';

  @override
  String get ipBasicsSection2SubBullet4 =>
      'Veel Art-Net apparatuur verlaat de fabriek met een IP van 2.x.x.x (gesloten netwerk).';

  @override
  String get ipBasicsSection2SubBullet5 =>
      'Het is \"praktisch\" in plug&play (zonder DHCP), maar verrassend als je PC in 192.168.x.x staat.';

  @override
  String get ipBasicsSection2SubBullet6 =>
      'Belangrijk: er is niets magisch aan \"2.x\" voor broadcast/unicast.';

  @override
  String get ipBasicsSection2SubBullet7 =>
      'Wat de reikwijdte van de broadcast verandert, is het masker (vaak /8 = 255.0.0.0 in legacy).';

  @override
  String get ipBasicsSection2SubBullet8 =>
      'Voorbeeld: netwerk 2.0.0.0/8 → broadcast = 2.255.255.255 (zeer groot).';

  @override
  String get ipBasicsSection2SubBullet9 =>
      'Eenvoudige oplossing: zet pc/console in hetzelfde bereik + hetzelfde masker of herconfigureer het knooppunt op een 192/10-vlak.';

  @override
  String get ipBasicsSection3Paragraph =>
      'Het subnetmasker vertelt je welke adressen zich \"in hetzelfde netwerk\" bevinden. Zonder masker betekent een IP niet veel.\n\nBasisregel: als twee apparaten zich op hetzelfde subnet bevinden, praten ze rechtstreeks met elkaar. Anders hebben ze een gateway (router) nodig.';

  @override
  String get ipBasicsSection3Callout1Title => 'De meest voorkomende maskers';

  @override
  String get ipBasicsSection3Bullet1 =>
      '255.0.0.0 ( /8 ) → 10.x.x.x typisch \"groot\" netwerk';

  @override
  String get ipBasicsSection3Bullet2 =>
      '255.255.0.0 ( /16 ) → 10.10.x.x of 192.168.x.x \"groot\" netwerk';

  @override
  String get ipBasicsSection3Bullet3 =>
      '255.255.255.0 ( /24 ) → \"klassiek\" 192.168.0.x netwerk (254 apparaten)';

  @override
  String get ipBasicsSection3Callout2Title =>
      'Mask → broadcast adres (zeer nuttig om te begrijpen)';

  @override
  String get ipBasicsSection3Bullet4 =>
      'De broadcast is afhankelijk van het subnet, d.w.z. het masker (niet \"2 vs 192\").';

  @override
  String get ipBasicsSection3Bullet5 =>
      '192.168.10.0/24 → broadcast = 192.168.10.255 (klein netwerk).';

  @override
  String get ipBasicsSection3Bullet6 =>
      '2.0.0.0/8 (255.0.0.0) → broadcast = 2.255.255.255 (groot netwerk).';

  @override
  String get ipBasicsSection3Bullet7 =>
      'Hoe \"groter\" het netwerk, hoe meer lawaai een uitzending kan maken (als je het vaak gebruikt).';

  @override
  String get ipBasicsSection3Subtitle1 =>
      'Concreet voorbeeld (het meest bruikbaar): /24';

  @override
  String get ipBasicsSection3SubBullet1 => 'IP: 192.168.0.50';

  @override
  String get ipBasicsSection3SubBullet2 => 'Masker : 255.255.255.0 ( /24 )';

  @override
  String get ipBasicsSection3SubBullet3 => 'Netwerk: 192.168.0.0';

  @override
  String get ipBasicsSection3SubBullet4 =>
      'Apparaten \"op hetzelfde netwerk\": 192.168.0.1 → 192.168.0.254';

  @override
  String get ipBasicsSection3SubBullet5 =>
      'Als je overschakelt naar 192.168.1.50 → is het NIET hetzelfde netwerk.';

  @override
  String get ipBasicsSection3Subtitle2 => 'Waarom subnetwerken maken?';

  @override
  String get ipBasicsSection3SubBullet6 =>
      'Organisatie: aparte \"lichten\", \"video\", \"intercom\", \"internet\", enz.';

  @override
  String get ipBasicsSection3SubBullet7 =>
      'Prestaties: beperk ruis (broadcast/multicast) tot één groep.';

  @override
  String get ipBasicsSection3SubBullet8 =>
      'Beveiliging: voorkomen dat een \"gast\"-pc het shownetwerk ziet/stoort.';

  @override
  String get ipBasicsSection3SubBullet9 =>
      'Diagnostiek: gemakkelijker om te weten \"waar\" een apparaat zich bevindt.';

  @override
  String get ipBasicsSection3Callout3Title => 'Klassieke val';

  @override
  String get ipBasicsSection3Bullet8 =>
      'Dezelfde IP \"start\" ≠ hetzelfde netwerk als het masker niet identiek is.';

  @override
  String get ipBasicsSection3Bullet9 =>
      'Voorbeeld: 10.0.0.5/8 en 10.0.0.200/24 → niet dezelfde logische perimeter.';

  @override
  String get ipBasicsSection4Subtitle1 => 'DHCP (automatische toewijzing)';

  @override
  String get ipBasicsSection4SubBullet1 =>
      'Een DHCP-server \"geeft\": IP + masker + gateway + DNS.';

  @override
  String get ipBasicsSection4SubBullet2 =>
      'Praktisch: aansluiten en het werkt.';

  @override
  String get ipBasicsSection4SubBullet3 =>
      'Risico: als DHCP valt/verandert/conflict → rare symptomen.';

  @override
  String get ipBasicsSection4Subtitle2 => 'Statisch (vast IP-adres)';

  @override
  String get ipBasicsSection4SubBullet4 =>
      'Je definieert IP + masker (en mogelijk gateway/DNS).';

  @override
  String get ipBasicsSection4SubBullet5 =>
      'Zeer handig voor: console, nodes, beheerde switch, AP Wi-Fi show.';

  @override
  String get ipBasicsSection4SubBullet6 =>
      'Risico: dubbele IP als plan niet duidelijk is (conflict).';

  @override
  String get ipBasicsSection4Callout1Title => 'Gateway';

  @override
  String get ipBasicsSection4Bullet1 =>
      'Dit is het adres van de router: het wordt gebruikt om \"buiten het lokale netwerk\" te gaan.';

  @override
  String get ipBasicsSection4Bullet2 =>
      'Als je een geïsoleerd shownetwerk opzet (zonder internet) → gateway vaak nutteloos.';

  @override
  String get ipBasicsSection4Bullet3 =>
      'Maar als je naar een ander VLAN / Internet wilt → essentieel.';

  @override
  String get ipBasicsSection4Callout2Title => 'DNS';

  @override
  String get ipBasicsSection4Bullet4 =>
      'DNS = \"directory\": zet een naam (bijv. example.com) om in een IP.';

  @override
  String get ipBasicsSection4Bullet5 =>
      'In show (Art-Net/sACN), vaak nutteloos: je werkt in direct IP.';

  @override
  String get ipBasicsSection4Bullet6 =>
      'Als je diensten gebruikt (upgrades, licenties, tijdserver, streaming) → DNS wordt weer nuttig.';

  @override
  String get ipBasicsSection4Subtitle3 =>
      'Eenvoudige regel (beginnersvriendelijk)';

  @override
  String get ipBasicsSection4SubBullet7 =>
      'Kleine gesloten show: overal statisch, geen gateway, geen DNS.';

  @override
  String get ipBasicsSection4SubBullet8 =>
      'Tonen met internet / meerdere netwerken: gecontroleerd DHCP + DHCP-reserveringen, of statisch plan + router.';

  @override
  String get ipBasicsSection5Paragraph =>
      'Als A met B wil praten, kijkt hij naar het masker :\n- Als B zich in hetzelfde subnet bevindt → stuurt A rechtstreeks naar het lokale netwerk.\n- Als B zich buiten het subnet bevindt → stuurt A naar de gateway (router), die voor de rest zorgt.';

  @override
  String get ipBasicsSection5Callout1Title => 'Voorbeeld (gemakkelijk)';

  @override
  String get ipBasicsSection5Bullet1 => 'A = 192.168.0.10 /24';

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
      'Verschillend masker → A denkt dat B \"ergens anders\" is (of andersom).';

  @override
  String get ipBasicsSection5SubBullet2 =>
      'Geen gateway → onmogelijk om het subnet te verlaten.';

  @override
  String get ipBasicsSection5SubBullet3 =>
      'PC firewall → ping geblokkeerd (komt vaak voor bij Windows).';

  @override
  String get ipBasicsSection5SubBullet4 =>
      'Kabel / switch / VLAN: fysiek niet in hetzelfde segment.';

  @override
  String get ipBasicsSection5Callout2Title =>
      'Broadcast vs unicast (nuttige bonus)';

  @override
  String get ipBasicsSection5Bullet4 =>
      'Unicast: naar een specifiek (schoon) IP-adres.';

  @override
  String get ipBasicsSection5Bullet5 =>
      'Broadcast: \"naar iedereen\" op het subnet (luidruchtig).';

  @override
  String get ipBasicsSection5Bullet6 =>
      'In show: broadcast kan werken in kleine netwerken, maar wordt al snel een bron van ruis in grote netwerken.';

  @override
  String get ipBasicsSection6Subtitle1 =>
      'Plan A - ultra eenvoudig (één netwerk /24)';

  @override
  String get ipBasicsSection6Code1 =>
      'Netwerk: 192.168.10.0/24 (masker 255.255.255.0)\n\nConsole: 192.168.10.10\nPC (besturing): 192.168.10.20\nKnooppunt 1: 192.168.10.101\nNode 2: 192.168.10.102\nBeheerde schakelaar: 192.168.10.2\nGateway: (leeg) of 192.168.10.1 als router aanwezig is';

  @override
  String get ipBasicsSection6Callout1Title => 'Waarom het werkt';

  @override
  String get ipBasicsSection6Bullet1 =>
      'Iedereen op hetzelfde subnet → geen verrassingen.';

  @override
  String get ipBasicsSection6Bullet2 =>
      'Eenvoudig uit te leggen, eenvoudig problemen op te lossen.';

  @override
  String get ipBasicsSection6Bullet3 =>
      'Ideaal voor beginners / kleine tot middelgrote shows.';

  @override
  String get ipBasicsSection6Subtitle2 =>
      'Plan B - \"10.x\" als je volwassen wilt worden';

  @override
  String get ipBasicsSection6Code2 =>
      'Netwerk: 10.10.0.0/16 (masker 255.255.0.0)\n\nConsole: 10.10.0.10\nPC: 10.10.0.20\nKnooppunten: 10.10.1.10 → 10.10.1.200\nSchakelaar: 10.10.0.2';

  @override
  String get ipBasicsSection6Callout2Title => 'Wanneer gebruiken?';

  @override
  String get ipBasicsSection6Bullet4 =>
      'Wanneer je veel apparatuur (of meerdere zones) hebt.';

  @override
  String get ipBasicsSection6Bullet5 =>
      'Wanneer je later VLAN plant (licht/video/IT).';

  @override
  String get ipBasicsSection6Subtitle3 =>
      'Plan C - compat Art-Net \"2.x.x.x\" (legacy)';

  @override
  String get ipBasicsSection6Code3 =>
      'Netwerk: 2.0.0.0/8 (masker 255.0.0.0)\n\nPC/console: 2.0.0.10\nKnooppunt 1: 2.0.0.100\nKnooppunt 2: 2.0.0.101\n\n⚠️ Geïsoleerd netwerk, geen internet, geen routering.';

  @override
  String get ipBasicsSection6Callout3Title => 'Attentie';

  @override
  String get ipBasicsSection6Bullet6 =>
      'Dit plan is praktisch voor oudere/standaard apparatuur.';

  @override
  String get ipBasicsSection6Bullet7 =>
      'Maar vermeng het niet met een \"normaal\" LAN (192.168.x.x) zonder router.';

  @override
  String get ipBasicsSection7Callout1Title =>
      'Symptomen → waarschijnlijke oorzaken';

  @override
  String get ipBasicsSection7Bullet1 =>
      '\"Ik kan het knooppunt zien maar het reageert niet\". → ander masker / VLAN / firewall.';

  @override
  String get ipBasicsSection7Bullet2 =>
      '\"Eén apparaat werkt en verdwijnt dan\" → DHCP instabiel / IP-conflict.';

  @override
  String get ipBasicsSection7Bullet3 =>
      '\"Niets werkt behalve op de switch\" → IP niet in hetzelfde netwerk / verkeerde kabel / VLAN-poort.';

  @override
  String get ipBasicsSection7Bullet4 =>
      '\"Alles kruipt / verliest\" → broadcast/multicast te breed / low-end switch / netwerklus.';

  @override
  String get ipBasicsSection7Bullet5 =>
      '\"Het werkt bedraad maar niet op Wi-Fi\" → jitter / roaming / bandverzadiging / energiebesparing.';

  @override
  String get ipBasicsSection7Subtitle => 'Pro-methode in 5 minuten';

  @override
  String get ipBasicsSection7SubBullet1 =>
      '1) Kijk naar het IP + masker van de console/PC en het knooppunt.';

  @override
  String get ipBasicsSection7SubBullet2 =>
      '2) Controleer: hetzelfde subnet (bijv. 192.168.10.x /24)';

  @override
  String get ipBasicsSection7SubBullet3 =>
      '3) Ping (indien mogelijk) + test de toegang tot de webinterface van het knooppunt.';

  @override
  String get ipBasicsSection7SubBullet4 =>
      '4) Indien DHCP: maak een lijst van wie welk IP heeft (DHCP-tabel) en controleer op duplicaten.';

  @override
  String get ipBasicsSection7SubBullet5 =>
      '5) Indien sACN multicast: controleer IGMP snooping/querier (anders flood).';

  @override
  String get ipBasicsSection7Callout2Title => 'Zeer veel voorkomende val';

  @override
  String get ipBasicsSection7Bullet6 =>
      'Geërfd\" masker op een PC (255.255.0.0 in plaats van 255.255.255.0).';

  @override
  String get ipBasicsSection7Bullet7 =>
      'Resultaat: je denkt dat je \"in hetzelfde netwerk\" zit, maar niet zoals het andere apparaat.';

  @override
  String get ipBasicsSection8Subtitle1 =>
      'Oefening 1: hetzelfde netwerk of niet (/24)';

  @override
  String get ipBasicsSection8SubBullet1 => 'A = 192.168.10.50 /24';

  @override
  String get ipBasicsSection8SubBullet2 =>
      'B = 192.168.10.200 /24 → ✅ hetzelfde netwerk';

  @override
  String get ipBasicsSection8SubBullet3 =>
      'B = 192.168.11.200 /24 → ❌ niet hetzelfde netwerk';

  @override
  String get ipBasicsSection8Subtitle2 => 'Oefening 2: /16 (255.255.0.0)';

  @override
  String get ipBasicsSection8SubBullet4 => 'A = 10.10.5.10 /16';

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
      '/24 → de eerste 3 identieke getallen (A.B.C) = hetzelfde netwerk.';

  @override
  String get ipBasicsSection8Bullet2 =>
      '/16 → de eerste 2 identieke getallen (A.B) = hetzelfde netwerk.';

  @override
  String get ipBasicsSection8Bullet3 =>
      '/8 → het 1e identieke getal (A) = hetzelfde netwerk.';

  @override
  String get ipBasicsSection8Subtitle3 =>
      'Oefening 3: \"rare\" IP\'s vermijden';

  @override
  String get ipBasicsSection8SubBullet7 =>
      '0.x.x.x: gereserveerd (geen normaal host IP).';

  @override
  String get ipBasicsSection8SubBullet8 => '127.x.x.x: loopback (je PC zelf).';

  @override
  String get ipBasicsSection8SubBullet9 =>
      '169.254.x.x: auto-IP wanneer DHCP afwezig (APIPA) → teken van DHCP probleem.';

  @override
  String get ipBasicsSection9CalloutTitle =>
      'Voordat we op zoek gaan naar de lunch om 14.00 uur';

  @override
  String get ipBasicsSection9Bullet1 =>
      'Zelfde subnet = consistente IP + masker.';

  @override
  String get ipBasicsSection9Bullet2 => 'Geen dubbele IP\'s (conflict).';

  @override
  String get ipBasicsSection9Bullet3 =>
      'DHCP: OK indien onder de knie; anders statisch plan wissen.';

  @override
  String get ipBasicsSection9Bullet4 =>
      'PC firewall: kan ping / discovery blokkeren.';

  @override
  String get ipBasicsSection9Bullet5 =>
      'Switch/VLAN: juiste poort, juiste VLAN, geen lussen.';

  @override
  String get ipBasicsSection9Bullet6 =>
      'sACN multicast: IGMP snooping/querier aanbevolen.';

  @override
  String get ipBasicsChecklistCopy =>
      'Netwerk - Snelle checklist (IP)\n☐ Alle apparaten bevinden zich in hetzelfde subnet (consistent IP + masker)\n☐ Geen dubbele IP\'s (conflict)\n☐ DHCP: of iedereen in DHCP, of duidelijk statisch plan (voorkom wazige mix)\n☐ Voor Art-Net/sACN: dedicated netwerk of VLAN indien mogelijk.\n☐ Beheerde schakelaar indien multicast/IGMP (sACN)\n☐ Wi-Fi: vermijden voor kritieke gegevensvertoning (jitter), liever bekabeld\n☐ Eenvoudige test: ping + controleer masker/gateway';

  @override
  String get ipBasicsFooterNote =>
      'Doel: voldoende begrijpen om snel bedrading / configuratie / probleemoplossing in een show uit te voeren.\nDe netwerkdetails kunnen dieper gaan, maar deze basis dekt 90% van de storingen in het veld.';

  @override
  String get aboutDmxPainterTerm120 => 'TERM\n120Ω';

  @override
  String get aboutDmxPainterDaisyChainNote => 'Daisy-ketting\nGeen passief Y';

  @override
  String get aboutDmxPainterXlr5Title => 'XLR5 (DMX) - snelle markering';

  @override
  String get aboutDmxPainterPin1 => 'Pen 1: Scherm / aarde';

  @override
  String get aboutDmxPainterPin2 => 'Pin 2: Data-';

  @override
  String get aboutDmxPainterPin3 => 'Pin 3 : Data+';

  @override
  String get aboutDmxPainterPin45 => 'Pin 4/5: \"data 2\" (zeldzaam/optioneel)';

  @override
  String get aboutDmxPainterXlr3Practice =>
      'In de praktijk: XLR3 vaak gebruikt (1/2/3)';

  @override
  String get aboutDmxPainterLastFixture => 'LAATSTE\nAPPARATUUR';

  @override
  String get aboutDmxPainterTerminationLine =>
      'Afsluiting = 120Ω aan het einde van de lijn';

  @override
  String get aboutDmxPainter120Between => '120Ω\ntussen\nData- en Data+';

  @override
  String get aboutDmxPainterOneTermination =>
      'Een enkel einde\nNiet in het midden\nNiet op elke tak';

  @override
  String get aboutDmxPainterConsoleIp => 'CONSOLE\nArt-Net / sACN';

  @override
  String get aboutDmxPainterSwitchSacn => 'SWITCH\n(IGMP voor sACN)';

  @override
  String get aboutDmxPainterNode1 => 'NODE 1\nDMX UIT';

  @override
  String get aboutDmxPainterNode2 => 'NODE 2\nDMX UIT';

  @override
  String get aboutDmxPainterFix => 'FIX';

  @override
  String get aboutDmxPainterManyUniverses =>
      'Vele universums\nKnooppunten dichtbij machines';

  @override
  String get aboutArtnetSection2Paragraph =>
      'Je doel: dat elk universum dat door de bron wordt uitgezonden, ondubbelzinnig op het juiste knooppunt (en de juiste DMX-poort) aankomt. De meeste Art-Net fouten = verkeerd universum, verkeerd subnet/net, of broadcast verzadiging.';

  @override
  String get aboutArtnetSection2CalloutTitle =>
      'Eenvoudige methode (vermijdt 80% van de fouten)';

  @override
  String get aboutArtnetSection2Bullet1 =>
      '1) Schrijf op papier: \"Universum 1 → Knooppunt A poort 1\", \"Universum 2 → Knooppunt A poort 2\", enz.';

  @override
  String get aboutArtnetSection2Bullet2 =>
      '2) Stel stabiele IP\'s in (DHCP gereserveerd of statisch).';

  @override
  String get aboutArtnetSection2Bullet3 =>
      '3) Gebruik unicast als je meer dan één node of een gedeeld netwerk hebt.';

  @override
  String get aboutArtnetSection2Subtitle1 => 'Broadcast vs Unicast';

  @override
  String get aboutArtnetSection2SubBullet1 =>
      'Broadcast: je stuurt naar iedereen → makkelijk maar kan een schakelaar \"overspoelen\".';

  @override
  String get aboutArtnetSection2SubBullet2 =>
      'Unicast: je stuurt naar het IP van het knooppunt → schoner en voorspelbaarder.';

  @override
  String get aboutArtnetSection2SubBullet3 => 'En show: bij twijfel → unicast.';

  @override
  String get aboutArtnetSection2Subtitle2 => 'Universum: praktijkervaring';

  @override
  String get aboutArtnetSection2SubBullet4 =>
      'Houd de nummering eenvoudig (bijv. 1...N).';

  @override
  String get aboutArtnetSection2SubBullet5 =>
      'Vermijd \"overal één universum\": documenteer je mappings.';

  @override
  String get aboutArtnetSection2SubBullet6 =>
      'Op sommige opstellingen bestaat \"Net/Subnet/Universum\": denk aan \"mapping\", niet aan \"magie\".';

  @override
  String get aboutArtnetSection3CalloutTitle =>
      'De \"echte\" grenzen (in volgorde)';

  @override
  String get aboutArtnetSection3Bullet1 =>
      'Wi-Fi: variabele latentie + verliezen → flikkering of uitval.';

  @override
  String get aboutArtnetSection3Bullet2 =>
      'Broadcast: overbelast een LAN (iedereen ontvangt alles).';

  @override
  String get aboutArtnetSection3Bullet3 =>
      'Low-end\" switch: beperkte buffers, middelmatig multicast/broadcast-beheer.';

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
      'Klassieke\" DMX is vaak ~20-44 fps, afhankelijk van het frame.';

  @override
  String get aboutArtnetSection3SubBullet2 =>
      'Op IP kun je meer sturen, maar de nodes volgen niet altijd (en het is niet altijd nuttig).';

  @override
  String get aboutArtnetSection3SubBullet3 =>
      'Stabiliteit > frequentie: stabiel met 30-40 fps is beter dan \"snel\" maar instabiel.';

  @override
  String get aboutArtnetSection3Subtitle2 => 'Eenvoudige regels';

  @override
  String get aboutArtnetSection3SubBullet4 => 'Specifiek netwerk (of VLAN).';

  @override
  String get aboutArtnetSection3SubBullet5 => 'Unicast indien meerdere nodes.';

  @override
  String get aboutArtnetSection3SubBullet6 => 'Bedraad voor kritische shows.';

  @override
  String get aboutArtnetSection4Paragraph =>
      'Een knooppunt = IP → DMX. Het kan 1, 2, 4 of 8 DMX-poorten hebben. De stabiliteit hangt af van het knooppunt EN de DMX-bekabeling aan de uitgangszijde (termination, topologie, splitters).';

  @override
  String get aboutArtnetSection4Subtitle1 => 'Knooppunten vs Splitters';

  @override
  String get aboutArtnetSection4SubBullet1 =>
      'Node: zet IP→DMX (en soms DMX→IP) om.';

  @override
  String get aboutArtnetSection4SubBullet2 =>
      'DMX-splitter: splitst een DMX-lijn in takken (opto aanbevolen).';

  @override
  String get aboutArtnetSection4SubBullet3 =>
      'Goed ontwerp: IP tot in het kleinste detail, dan korte, strakke DMX.';

  @override
  String get aboutArtnetSection4CalloutTitle =>
      'RDM op Art-Net (variabele ondersteuning)';

  @override
  String get aboutArtnetSection4Bullet1 =>
      'Sommige nodes ondersteunen een RDM proxy: de console ziet/configureert RDM apparaten via IP.';

  @override
  String get aboutArtnetSection4Bullet2 =>
      'Andere ondersteunen RDM helemaal niet of slechts gedeeltelijk.';

  @override
  String get aboutArtnetSection4Bullet3 =>
      'Een \"klassieke\" opto splitter kan de RDM retour blokkeren (afhankelijk van het model).';

  @override
  String get aboutArtnetSection4Bullet4 =>
      'Tip: als je RDM wilt, kies dan expliciet hardware die gemarkeerd is als RDM-compatibel.';

  @override
  String get aboutArtnetSection4Subtitle2 => 'Goede veldreflexen';

  @override
  String get aboutArtnetSection4SubBullet4 =>
      'Als DMX instabiel is: pas eerst DMX aan (termination, kabel, passieve Y) en dan pas IP.';

  @override
  String get aboutArtnetSection4SubBullet5 =>
      'Indien RDM onstabiel: deactiveert RDM om te controleren of de zuivere DMX stabiel is.';

  @override
  String get aboutArtnetSection5CalloutTitle =>
      'Symptomen → waarschijnlijke oorzaken';

  @override
  String get aboutArtnetSection5Bullet1 =>
      'Flikkering over de hele set → Wi-Fi, broadcast flood, verzadigde schakelaar.';

  @override
  String get aboutArtnetSection5Bullet2 =>
      'Eén knooppunt OK, het andere niet → universum/mapping, IP, unicast verkeerd geconfigureerd.';

  @override
  String get aboutArtnetSection5Bullet3 =>
      'Willekeurige uitval → defecte RJ45-kabel, onstabiele switch, pc die pakketten laat vallen.';

  @override
  String get aboutArtnetSection5Bullet4 =>
      'Een enkele DMX-poort op een knooppunt KO → DMX-kabel, beëindiging, armatuur die de lijn onderbreekt.';

  @override
  String get aboutArtnetSection5Bullet5 =>
      'RDM ontdekking onmogelijk → node/splitter niet RDM-compatibel, grensgeval DMX-bekabeling.';

  @override
  String get aboutArtnetSection5Subtitle => 'Snelle methode';

  @override
  String get aboutArtnetSection5SubBullet1 =>
      '1) Unicast naar een enkel knooppunt (eenvoudige test).';

  @override
  String get aboutArtnetSection5SubBullet2 =>
      '2) Controleer universum/mapping (papier + knooppuntconfiguratie).';

  @override
  String get aboutArtnetSection5SubBullet3 =>
      '3) Directe bedrade test (pc → schakelaar → knooppunt) met bekende kabel OK.';

  @override
  String get aboutArtnetSection5SubBullet4 =>
      '4) Isoleer de DMX: knooppunt → 1 apparaat + beëindiging.';

  @override
  String get aboutArtnetSection6Subtitle1 =>
      'Eigen architectuur (IP → knooppunten → korte DMX)';

  @override
  String get aboutArtnetSection6Subtitle2 => 'Broadcast vs Unicast (idee)';

  @override
  String get aboutArtnetAssetsCopyTitle => 'Aanbevolen activa (optioneel)';

  @override
  String get aboutArtnetExampleLabel => 'voorbeeld';

  @override
  String get aboutArtnetAssetsCopyTooltip => 'Activalijst kopiëren';

  @override
  String get aboutArtnetAssetsParagraph =>
      'Sectie gebruikt om het netwerk te illustreren (RJ45, switch, kabels). Als de onderdelen niet bestaan, geeft de app een schone fallback weer.';

  @override
  String get aboutArtnetAssetsExamplesTitle => 'Voorbeelden';

  @override
  String get aboutArtnetAssetsRj45Label => 'RJ45';

  @override
  String get aboutArtnetAssetsRj45Hint => 'Ethernetstekker';

  @override
  String get aboutArtnetAssetsSwitchLabel => 'Schakelaar';

  @override
  String get aboutArtnetAssetsSwitchHint =>
      'Switch (idealiter beheerd als IGMP/VLAN)';

  @override
  String get aboutArtnetAssetsCableLabel => 'Ethernetkabel';

  @override
  String get aboutArtnetAssetsCableHint => 'Cat5e/Cat6 = betrouwbare basis';

  @override
  String get aboutArtnetChecklistCopyTitle => 'Art-Net - Veldcontrolelijst';

  @override
  String get aboutArtnetChecklistCopyTooltip => 'Kopieer de checklist';

  @override
  String get aboutArtnetChecklistTitle => 'Voordat je in paniek raakt';

  @override
  String get aboutArtnetChecklistBullet1 => 'Unicast indien meerdere nodes.';

  @override
  String get aboutArtnetChecklistBullet2 =>
      'Dedicated netwerk (of VLAN) indien mogelijk.';

  @override
  String get aboutArtnetChecklistBullet3 => 'Bedraad voor kritische show.';

  @override
  String get aboutArtnetChecklistBullet4 => 'Gedocumenteerd universum/mapping.';

  @override
  String get aboutArtnetChecklistBullet5 =>
      'Eenvoudige IP-test → 1 knooppunt → 1 apparaat + afsluiting.';

  @override
  String get aboutArtnetChecklistBullet6 =>
      'Indien RDM: \"RDM proxy\" knooppunt bevestigd + stabiele DMX-bekabeling';

  @override
  String get aboutArtnetFooterNote =>
      'Indicatieve info (veld). Gedrag kan verschillen per nodes/switch/firmware.\nHet doel is om dit te begrijpen en snel een diagnose te stellen.';

  @override
  String get aboutArtnetDiagramSourceLabel => 'BRON\n(PC/console)';

  @override
  String get aboutArtnetDiagramSwitchLabel => 'SWITCH';

  @override
  String get aboutArtnetDiagramNode1Label => 'NODE 1\nDMX UIT';

  @override
  String get aboutArtnetDiagramNode2Label => 'NODE 2\nDMX UIT';

  @override
  String get aboutArtnetDiagramFixLabel => 'FIX';

  @override
  String get aboutArtnetDiagramInfoLabel => 'IP lang / DMX kort';

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
  String get aboutArtnetMissingAssetLabel => 'Ontbrekend actief';

  @override
  String get aboutRegistryDmxTitle => 'DMX - bediening (eenvoudig & volledig)';

  @override
  String get aboutRegistryDmxSubtitle =>
      'Universum, adressen, frames, RS-485 bekabeling, beëindiging, veldfouten.\nInclusief schema\'s + checklist.';

  @override
  String get aboutRegistryArtnetTitle =>
      'Art-Net - DMX over IP (knooppunten, unicast/broadcast)';

  @override
  String get aboutRegistryArtnetSubtitle =>
      'DMX-universum op Ethernet/UDP, knooppunten, broadcast vs unicast.\nEchte limieten, netwerkstabiliteit, RDM afhankelijk van apparatuur, diagrammen + checklist.';

  @override
  String get aboutRegistrySacnTitle =>
      'sACN / E1.31 - multicast, IGMP, prioriteiten';

  @override
  String get aboutRegistrySacnSubtitle =>
      'DMX over IP-standaard voor professionele netwerken.\nMulticast/unicast, IGMP snooping/query, multi-source prioriteiten, schema\'s + checklist.';

  @override
  String get aboutRegistryIpBasicsTitle =>
      'Netwerk - IP-bases / masker / DHCP (essentieel)';

  @override
  String get aboutRegistryIpBasicsSubtitle =>
      'IP, masker, gateway, DHCP vs statisch begrijpen.\nConcrete voorbeelden (2.x.x.x, 10.x, 192.168.x), snelle tests, traps tonen.';

  @override
  String get aboutRegistryReseauTitle =>
      'Netwerk - RJ45 / glasvezel / bitsnelheden & lengtes';

  @override
  String get aboutRegistryReseauSubtitle =>
      'Cat5e→Cat8, OM3/OM4/OS2 vezel, LC/SC/MPO, typische afstanden, best practice tonen.';

  @override
  String get aboutRegistryNetworkTitle =>
      'Licht netwerk - VLAN, IGMP, Wi-Fi vs. bekabeld';

  @override
  String get aboutRegistryNetworkSubtitle =>
      'Eenvoudige, robuuste architectuur voor Art-Net/sACN.\nVLAN, IGMP snooping/query, Wi-Fi (jitter), switches, diagrammen + checklist.';

  @override
  String get aboutRegistryVideoTitle => 'Video - SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutRegistryVideoSubtitle =>
      'Kiezen op basis van latentie, betrouwbaarheid, bekabeling, LAN vs WAN.\nTabellen + diagram.';

  @override
  String get aboutRegistryElectriciteTitle =>
      'Elektrisch - Schuko / P17 / voeding';

  @override
  String get aboutRegistryElectriciteSubtitle =>
      'Connectoren, mono/tri, snelle kW-panelen (16A→400A), veldvallen.';

  @override
  String get aboutRegistryInformatiqueTitle =>
      'IT - USB / HDMI / DP / SATA / NVMe...';

  @override
  String get aboutRegistryInformatiqueSubtitle =>
      'Nuttige snelheden, versies, echte limieten, marketingvalkuilen.';

  @override
  String get aboutUniverseToHexColHex => 'Hex';

  @override
  String get aboutUniverseToHexNote => 'Index = Universum - 1 (basis 0).';

  @override
  String get aboutNetworkPageTitle => 'Licht netwerk - VLAN, IGMP, Wi-Fi';

  @override
  String get aboutNetworkCopyTooltip => 'Markeringen kopiëren';

  @override
  String get aboutNetworkChecklistCopyTooltip => 'Kopie';

  @override
  String get aboutNetworkChecklistTitle => 'Voordat u Wireshark opent 😄';

  @override
  String get aboutNetworkFooterNote =>
      'Indicatieve info (veld). Afhankelijk van de netwerkhardware kan IGMP/VLAN essentieel zijn.\nDoel: houd het eenvoudig en robuust.';

  @override
  String get aboutNetworkCopy1 =>
      'Licht netwerk: eenvoudig, toegewijd, stabiel doel.';

  @override
  String get aboutNetworkCopy2 => 'VLAN = gescheiden verkeer (licht vs. rest).';

  @override
  String get aboutNetworkCopy3 =>
      'IGMP = essentieel als grootschalig multicast sACN.';

  @override
  String get aboutNetworkCopy4 =>
      'Wi-Fi = OK voor probleemoplossing, zelden OK voor kritische productie.';

  @override
  String get aboutNetworkChecklistCopy =>
      'Verlichtingsnetwerk - Checklist\n☐ Specifiek netwerk of licht VLAN\n☐ Duidelijk IP-plan (DHCP of statisch) + masker ok\n☐ Schakelaar correct; lussen vermeden\n☐ sACN multicast: IGMP snooping AAN\n☐ IGMP querier aanwezig in VLAN (indien infra vereist)\n☐ Unicast voor probleemoplossing (vooral Art-Net)\n☐ Wi-Fi: kritische prod (jitter/verliezen) vermijden\n☐ Tests: stabiele ping + progressieve belasting (universum)';

  @override
  String get aboutNetworkToc1 => '1) Doel: stabiel netwerk';

  @override
  String get aboutNetworkToc2 => '2) IP-plan (eenvoudig)';

  @override
  String get aboutNetworkToc3 => '3) VLAN (scheiding)';

  @override
  String get aboutNetworkToc4 => '4) IGMP (sACN multicast)';

  @override
  String get aboutNetworkToc5 => '5) Wi-Fi vs. bekabeld';

  @override
  String get aboutNetworkToc6 => '6) Overstappen: wat je nodig hebt';

  @override
  String get aboutNetworkToc7 => '7) Diagrammen';

  @override
  String get aboutNetworkToc8 => '8) Checklist';

  @override
  String get aboutNetworkBasicsPill1 => 'Toegewezen/VLAN';

  @override
  String get aboutNetworkBasicsPill2 => 'Bedraad';

  @override
  String get aboutNetworkBasicsPill3 => 'IGMP als multicast';

  @override
  String get aboutNetworkBasicsParagraph =>
      'Een licht netwerk moet voorspelbaar zijn: weinig verlies, weinig jitter, eenvoudige architectuur. Als het fout gaat, ligt dat zelden aan \"het protocol\" en vaak aan de infrastructuur (switch, Wi-Fi, loops, flood).';

  @override
  String get aboutNetworkBasicsCalloutTitle => 'Basisregel';

  @override
  String get aboutNetworkBasicsBullet1 =>
      'Als het kan: bekabeld + juiste switch + specifiek netwerk (of VLAN).';

  @override
  String get aboutNetworkBasicsBullet2 =>
      'Als je moet delen: VLAN + duidelijke regels.';

  @override
  String get aboutNetworkBasicsBullet3 =>
      'sACN multicast: IGMP wordt snel verplicht.';

  @override
  String get aboutNetworkPlanIpParagraph =>
      'Kies een eenvoudige, consistente strategie. Twee benaderingen: DHCP (eenvoudig) of statisch (voorspelbaar). Slechtste scenario: een ongedocumenteerde mix.';

  @override
  String get aboutNetworkPlanIpCalloutTitle =>
      'Voorbeeld van een plan (eenvoudig)';

  @override
  String get aboutNetworkPlanIpBullet1 => 'Lichte VLAN: 10.10.0.0/24';

  @override
  String get aboutNetworkPlanIpBullet2 => 'Console/PC: 10.10.0.10';

  @override
  String get aboutNetworkPlanIpBullet3 => 'Knooppunten: 10.10.0.100-150';

  @override
  String get aboutNetworkPlanIpBullet4 => 'Schakelaar mgmt: 10.10.0.2';

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
  String get aboutNetworkIgmpPill2 => 'IGMP querier';

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
  String get aboutNetworkWifiSubtitle2 => 'Wi-Fi';

  @override
  String get aboutNetworkWifiSubBullet1 =>
      '✅ Stabiele latentie, lage verliezen (indien infra schoon).';

  @override
  String get aboutNetworkWifiSubBullet2 => 'Aanbevolen voor prod.';

  @override
  String get aboutNetworkWifiSubBullet3 =>
      'Praktisch (snelle installatie, tablet).';

  @override
  String get aboutNetworkWifiSubBullet4 =>
      '❌ Variabele latentie (jitter), verliezen, interferentie.';

  @override
  String get aboutNetworkWifiSubBullet5 =>
      'Multicast wordt soms slecht beheerd volgens AP/config.';

  @override
  String get aboutNetworkWifiSubBullet6 =>
      'OK voor probleemoplossing / kleine, niet-kritieke configuraties, zelden OK wanneer show geladen.';

  @override
  String get aboutNetworkWifiCalloutTitle => 'Eenvoudige regel';

  @override
  String get aboutNetworkWifiBullet1 => 'Kritische show = bekabeld.';

  @override
  String get aboutNetworkWifiBullet2 =>
      'Wi-Fi = bedieningsgemak (UI), niet het belangrijkste DMX/IP-transport als het volume groot is.';

  @override
  String get aboutNetworkSwitchCalloutTitle => 'Minimaal aanbevolen';

  @override
  String get aboutNetworkSwitchBullet1 => 'Juiste Ethernet-switch (geen hub).';

  @override
  String get aboutNetworkSwitchBullet2 => 'OK-kabels (RJ45, connectoren).';

  @override
  String get aboutNetworkSwitchBullet3 =>
      'Vermijd lussen (of gecontroleerde STP).';

  @override
  String get aboutNetworkSwitchBullet4 => 'Als sACN multicast: IGMP snooping.';

  @override
  String get aboutNetworkSwitchSubtitle => 'Beheerd vs onbeheerd';

  @override
  String get aboutNetworkSwitchSubBullet1 =>
      'Unmanaged: ok klein dedicated netwerk (eenvoudig).';

  @override
  String get aboutNetworkSwitchSubBullet2 =>
      'Managed: nuttig voor VLAN/IGMP/diagnostiek (grote netwerken).';

  @override
  String get aboutNetworkDiagramsSubtitle1 => 'VLAN: licht/rust gescheiden';

  @override
  String get aboutNetworkDiagramsSubtitle2 => 'Wi-Fi vs bekabeld (idee)';

  @override
  String get aboutNetworkChecklistBullet1 =>
      'Duidelijk IP-plan, consistent masker.';

  @override
  String get aboutNetworkChecklistBullet2 => 'Specifiek netwerk / licht VLAN.';

  @override
  String get aboutNetworkChecklistBullet3 => 'Schakelaar OK, geen lussen.';

  @override
  String get aboutNetworkChecklistBullet4 => 'IGMP voor multicast sACN.';

  @override
  String get aboutNetworkChecklistBullet5 => 'Wi-Fi vermeden in kritieke prod.';

  @override
  String get videoCameraExposureTitle => 'Camera-belichting';

  @override
  String get videoCameraExposureSubtitle =>
      'Lux → EV, ISO, snelheid en diafragma.';

  @override
  String get videoCamPageTitle => 'Camera-belichting';

  @override
  String get videoCamInfoTitle => 'Info';

  @override
  String get videoCamIntro =>
      'Indicatieve berekeningen voor het koppelen van lux, ISO, snelheid en diafragma.';

  @override
  String get videoCamInputsTitle => 'Ingangen';

  @override
  String get videoCamLuxLabel => 'Lux';

  @override
  String get videoCamLuxHint => 'Ex: 500';

  @override
  String get videoCamIsoLabel => 'ISO';

  @override
  String get videoCamIsoHint => 'Ex: 800';

  @override
  String get videoCamShutterLabel => 'Snelheid (s)';

  @override
  String get videoCamShutterHint => 'Ex: 1/50';

  @override
  String get videoCamApertureLabel => 'Diafragma (f/)';

  @override
  String get videoCamApertureHint => 'Ex: 2,8';

  @override
  String get videoCamEvEmpty => '-';

  @override
  String get videoCamNote =>
      'Indicatieve waarden: kalibratie is afhankelijk van de sensor, de scène en de standaarden.';

  @override
  String videoCamEvValue(Object ev) {
    return 'EV';
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
  String get aboutDmxS2Title => '2) DMX-frame - pauze, startcode, kanalen';

  @override
  String get aboutDmxS2PillBreak => 'Pauze';

  @override
  String get aboutDmxS2PillStartCode => 'Startcode';

  @override
  String get aboutDmxS2PillSlots512 => '512 slots';

  @override
  String get aboutDmxS2PillRefresh => 'Vernieuw';

  @override
  String get aboutDmxS2Intro =>
      'Een DMX-frame wordt in een lus verzonden. Het begint met een \"pauze\" (stilte), dan een startcode en vervolgens maximaal 512 waarden (0-255). Elke armatuur leest alleen de kanalen die op hem van toepassing zijn (afhankelijk van het adres en de modus).';

  @override
  String get aboutDmxS2HowToReadTitle => 'Een frame lezen (heel eenvoudig)';

  @override
  String get aboutDmxS2HowToReadB1 =>
      'Break + MAB: markeert het begin van het frame (hersynchronisatie).';

  @override
  String get aboutDmxS2HowToReadB2 =>
      'Startcode: meestal 0x00 (verlichtingsgegevens).';

  @override
  String get aboutDmxS2HowToReadB3 =>
      'Sleuven 1→512: elke sleuf = 1 kanaal (0-255).';

  @override
  String get aboutDmxS2HowToReadB4 =>
      'Het frame begint continu opnieuw: het is normaal om de oude waarde te \"overschrijven\".';

  @override
  String get aboutDmxS2PracticalTitle => 'In de praktijk';

  @override
  String get aboutDmxS2PracticalB1 =>
      'Een 16-bits modus gebruikt 2 kanalen voor dezelfde functie (bijv. Pan grof + Pan fijn).';

  @override
  String get aboutDmxS2PracticalB2 =>
      'Hoe meer universums je stuurt, hoe groter de totale belasting (consoles/nodes/netwerk).';

  @override
  String get aboutDmxS2PracticalB3 =>
      'Als je last hebt van flikkering, denk dan eerst aan de kabel/aansluiting/aansluitingen voordat je de console verdenkt.';

  @override
  String get aboutDmxS3Title =>
      '3) DMX-bekabeling - RS-485, topologie, pin-out';

  @override
  String get aboutDmxS3PillRs485 => 'RS-485';

  @override
  String get aboutDmxS3PillDaisyChain => 'Madeliefje-ketting';

  @override
  String get aboutDmxS3PillNoY => 'Nee Y';

  @override
  String get aboutDmxS3Pill120ohm => '120 Ω';

  @override
  String get aboutDmxS3Intro =>
      'DMX512 is gebaseerd op RS-485: een differentiële bus die van strakke lijnen houdt. De gouden regel: een daisy-chain van de bron naar de armaturen, dan een afsluiting aan het einde.';

  @override
  String get aboutDmxS3TopologyTitle => 'Aanbevolen topologie';

  @override
  String get aboutDmxS3TopologyB1 =>
      'Bron → Apparaat 1 → Apparaat 2 → ... → laatste apparaat.';

  @override
  String get aboutDmxS3TopologyB2 =>
      'Vermijd Y-takken: deze veroorzaken reflecties (instabiliteit).';

  @override
  String get aboutDmxS3TopologyB3 =>
      'Als je aftakkingen moet maken: gebruik een opto-geïsoleerde DMX-splitter.';

  @override
  String get aboutDmxS3PinoutTitle => 'Aansluitingen (herinnering)';

  @override
  String get aboutDmxS3CablesTitle => 'Kabels: wat echt werkt';

  @override
  String get aboutDmxS3CablesB1 =>
      'Gebruik een DMX-kabel (impedantie ~120 Ω), geen willekeurige microfoon (behalve voor korte probleemoplossing).';

  @override
  String get aboutDmxS3CablesB2 =>
      'Houd de lengtes redelijk en vermijd krappe windingen in de buurt van voedingen/dimmers.';

  @override
  String get aboutDmxS3CablesB3 =>
      'Een slechte kabel \"werkt\" soms... totdat hij het niet meer doet (vocht, lengte, belasting).';

  @override
  String get aboutDmxS4Title => '4) Terminatie & splitters - busstabiliteit';

  @override
  String get aboutDmxS4Intro =>
      'Op een RS-485 bus voorkomt terminatie reflecties aan het einde van de lijn. Opto-geïsoleerde splitters worden gebruikt om zuivere aftakkingen te maken en de bron te beschermen.';

  @override
  String get aboutDmxS4TerminatorTitle => 'Afsluiting (120 Ω): wanneer en hoe';

  @override
  String get aboutDmxS4TerminatorB1 =>
      'Zet een afsluiter op het laatste apparaat (of een XLR-plug).';

  @override
  String get aboutDmxS4TerminatorB2 =>
      'Slechts één afsluiting per lijn (niet overal).';

  @override
  String get aboutDmxS4TerminatorB3 =>
      'Onmisbaar bij lange lijnen, zware ladingen en lawaaierige omgevingen.';

  @override
  String get aboutDmxS4SplittersTitle => 'Splitters / opto-isolatie';

  @override
  String get aboutDmxS4SplittersB1 =>
      'Hiermee kun je 2, 4 of 8 takken maken zonder een \"Y\".';

  @override
  String get aboutDmxS4SplittersB2 =>
      'Isoleert elektrisch: beperkt aardlussen en beschermt de console/node.';

  @override
  String get aboutDmxS4SplittersB3 =>
      'Handig voor het omleiden van een signaal over lange afstanden.';

  @override
  String get aboutDmxS5Title =>
      '5) Problemen oplossen - eenvoudige methode (snel en betrouwbaar)';

  @override
  String get aboutDmxS5Intro =>
      'Als een armatuur niet reageert, is het belangrijk om het te isoleren: ligt het aan het adres, de modus, de DMX-lijn of de armatuur? Volg een korte checklist voordat je alles opnieuw configureert.';

  @override
  String get aboutDmxS5QuickChecksTitle => 'Snelle checklist';

  @override
  String get aboutDmxS5QuickB1 =>
      'Juist DMX-adres (en niet 001 vs 000 volgens het scherm).';

  @override
  String get aboutDmxS5QuickB2 => 'Juiste DMX-modus (aantal kanalen)?';

  @override
  String get aboutDmxS5QuickB3 =>
      'Goed universum / uitvoer (console, knooppunt, poort)?';

  @override
  String get aboutDmxS5QuickB4 =>
      'Test met een kabel waarvan bekend is dat deze in orde is en vervang deze vervolgens een voor een.';

  @override
  String get aboutDmxS5QuickB5 =>
      'Voegt/verwijdert een afsluiter toe aan het einde van de regel om het effect te zien.';

  @override
  String get aboutDmxS5IfFlickerTitle => 'Als het flikkert/pikt';

  @override
  String get aboutDmxS5IfFlickerB1 =>
      'Zoek naar een verborgen \"Y\", een ongeschikte splitter of een slechte XLR-adapter.';

  @override
  String get aboutDmxS5IfFlickerB2 =>
      'Verplaatst DMX weg van voedingen/dimmers, vermijdt grote kabellussen.';

  @override
  String get aboutDmxS5IfFlickerB3 =>
      'Verminder de complexiteit: 1 universum, 1 regel, 1 apparaat, dan herbouwen.';

  @override
  String get aboutDmxS5GoldenRuleTitle => 'Gouden regel';

  @override
  String get aboutDmxS5GoldenRuleBody =>
      'Je moet een enkel apparaat op een enkele lijn kunnen bedienen. Als deze basistest mislukt, is het probleem niet \"de volledige patch\": het is de adressering, de bekabeling of de hardware.';

  @override
  String get aboutDmxS6Title =>
      '6) Art-Net - DMX over IP (woordenschat en valkuilen)';

  @override
  String get aboutDmxS6PillUdp => 'UDP';

  @override
  String get aboutDmxS6PillNodes => 'Knooppunten';

  @override
  String get aboutDmxS6PillBroadcast => 'Uitzending';

  @override
  String get aboutDmxS6PillUnicast => 'Unicast';

  @override
  String get aboutDmxS6Intro =>
      'Art-Net transporteert DMX-universums via Ethernet (UDP). Een console/software stuurt universes over het netwerk en een node zet ze om in fysieke DMX-uitgangen.';

  @override
  String get aboutDmxS6BasicsTitle => 'Om te onthouden';

  @override
  String get aboutDmxS6BasicsB1 =>
      'Eén knooppunt = netwerk ↔ DMX (meerdere poorten).';

  @override
  String get aboutDmxS6BasicsB2 =>
      'Broadcast naar iedereen (eenvoudig, maar kan verzadigen).';

  @override
  String get aboutDmxS6BasicsB3 =>
      'Unicast stuurt alleen naar het doelknooppunt (vaak stabieler op grote booreilanden).';

  @override
  String get aboutDmxS6BasicsB4 =>
      'Wees voorzichtig met het tellen van universums: Art-Net begint vaak bij 0 (Universum 1 DMX = 0 Art-Net).';

  @override
  String get aboutDmxS6WhenTitle => 'Wanneer moet je kiezen voor Art-Net?';

  @override
  String get aboutDmxS6WhenB1 =>
      'Kleine/middelgrote rigs, snelle set-ups, veel compatibele hardware.';

  @override
  String get aboutDmxS6WhenB2 =>
      'OK als het netwerk schoon is (juiste switch, kabels, geen Wi-Fi).';

  @override
  String get aboutDmxS6WhenB3 =>
      'Als het verzadigd raakt: schakel over op unicast en segmenteer het netwerk (VLAN / dedicated netwerk).';

  @override
  String get aboutDmxS7Title =>
      '7) sACN (E1.31) - multicast, prioriteiten, eigen netwerk';

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
      'sACN (ANSI E1.31) is een moderne standaard voor het transporteren van DMX-universums over IP. Het wordt veel gebruikt in grote systemen omdat het goed omgaat met multicast en prioriteiten.';

  @override
  String get aboutDmxS7KeyIdeasTitle => 'Belangrijkste ideeën';

  @override
  String get aboutDmxS7KeyIdeasB1 =>
      'Multicast: een universum is een netwerk-\"groep\" (knooppunten abonneren zich op elkaar).';

  @override
  String get aboutDmxS7KeyIdeasB2 =>
      'IGMP snooping op switches = essentieel op grote schaal (anders wordt het overspoeld).';

  @override
  String get aboutDmxS7KeyIdeasB3 =>
      'Prioriteit: meerdere mogelijke bronnen, degene met de hoogste prioriteit wint.';

  @override
  String get aboutDmxS7KeyIdeasB4 =>
      'Zoals Art-Net: schoon netwerk + kwaliteitskabels/schakelaars = stabiliteit.';

  @override
  String get aboutDmxS8Title =>
      '8) DMX vs Art-Net vs sACN - samenvatting (wat kiezen?)';

  @override
  String get aboutDmxS8Intro =>
      'Alle drie doen ze hetzelfde: kanalen aansturen. Het verschil zit in de distributie (DMX-kabel vs. netwerk), schaal en robuustheid.';

  @override
  String get aboutDmxS8QuickTableTitle => 'Samenvatting in 4 regels';

  @override
  String get aboutDmxS8QuickB1 =>
      'DMX: eenvoudig, robuust, 1 kabel = 1 lijn (512 kanalen).';

  @override
  String get aboutDmxS8QuickB2 =>
      'Art-Net: komt veel voor, is eenvoudig te implementeren, pas op voor uitzendingen.';

  @override
  String get aboutDmxS8QuickB3 =>
      'sACN: meer \"pro grote systemen\", multicast + prioriteiten, vereist een goed geconfigureerd netwerk.';

  @override
  String get aboutDmxS8QuickB4 =>
      'In alle gevallen: documentatie + progressief testen = enorme tijdsbesparing.';

  @override
  String get aboutDmxS8ChooseTitle => 'Snelle selectie';

  @override
  String get aboutDmxS8ChooseB1 =>
      'Kleine set-up: DMX direct of Art-Net (eenvoudig).';

  @override
  String get aboutDmxS8ChooseB2 =>
      'Vele universums: specifiek netwerk + knooppunten; Art-Net in unicast of sACN.';

  @override
  String get aboutDmxS8ChooseB3 =>
      'Zeer groot materieel / infrastructuur: sACN + switches/IGMP goed beheerd.';

  @override
  String get aboutSunTimesTitle => 'Zonsopgang/ondergang';

  @override
  String get aboutSunTimesSubtitle =>
      'Keuze van stad en datum, tijden van zonsopgang/ondergang + drempels (lux).';

  @override
  String get homeBpmTitle => 'BPM';

  @override
  String get aboutReseauPageTitle => 'Netwerk - oriëntatiepunten';

  @override
  String get aboutReseauSummaryCopy =>
      'NETWERK - veldmarkeringen\n- RJ45: Cat5e/6/6A → 1G/10G afhankelijk van afstand.\n- Glasvezel: lange afstand + EMI-immuniteit.\n- Switch: IGMP belangrijk voor multicast sACN.\n- VLAN: gescheiden licht/video/IT = stabiliteit.';

  @override
  String get aboutReseauChecklistCopy =>
      'NETWERK - Checklist\n☐ IP-plan leegmaken (bereik / maskers)\n☐ Correcte switch (IGMP indien multicast sACN)\n☐ VLAN indien meerdere \"werelden\" (licht/video/IT)\n☐ Kabels getest + gelabeld\n☐ Glasvezel: compatibele modules + eigen connectoren\n☐ Lussen vermijden (STP) + openbare Wi-Fi op show LAN vermijden';

  @override
  String get aboutReseauChecklistCopyTooltip => 'Kopie';

  @override
  String get aboutReseauFooterNote =>
      'Indicatieve info (veld). Exacte capaciteiten variëren afhankelijk van apparatuur / kabels / modules.\nDoel: eenvoudige referentiepunten + betrouwbare methode.';

  @override
  String get aboutReseauToc1 => '1) Netwerkbeginselen (LAN / IP / doorvoer)';

  @override
  String get aboutReseauToc2 => '2) RJ45 & categorieën (Cat5e/6/6A/...)';

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
  String get aboutReseauToc8 => '8) Checklist';

  @override
  String get aboutReseauSection1Title => '3 eenvoudige ideeën';

  @override
  String get aboutReseauSection1Bullet1 => 'IP = adres (bijv. 10.0.0.50).';

  @override
  String get aboutReseauSection1Bullet2 =>
      'LAN = lokaal netwerk via switch (niet \"internet\").';

  @override
  String get aboutReseauSection1Bullet3 =>
      'Doorvoer = capaciteit (1G, 10G...), maar stabiliteit hangt ook af van de schakelaar.';

  @override
  String get aboutReseauSection1Title2 => 'Topologie weergeven (clean)';

  @override
  String get aboutReseauSection1Bullet4 =>
      'Console/PC → centrale switch → knooppunten/servers.';

  @override
  String get aboutReseauSection1Bullet5 =>
      'Vermijd willekeurige netwerken in serie.';

  @override
  String get aboutReseauSection1Bullet6 =>
      'Indien mogelijk: een speciaal shownetwerk (geen openbare Wi-Fi).';

  @override
  String get aboutReseauSection2Title => 'Snelle referentiepunten';

  @override
  String get aboutReseauSection2Bullet1 =>
      'Cat5e: 1 Gbit/s \"klassiek\" (tot 100 m).';

  @override
  String get aboutReseauSection2Bullet2 =>
      'Cat6: 1G/10G (10G voor kortere afstanden).';

  @override
  String get aboutReseauSection2Bullet3 =>
      'Cat6A: 10G tot 100m (praktische benchmark).';

  @override
  String get aboutReseauSection2Bullet4 =>
      'Verder: Cat7/8 bestaat, maar Cat6A is vaak de beste oplossing in het veld.';

  @override
  String get aboutReseauSection2Title2 => 'Land';

  @override
  String get aboutReseauSection2Bullet5 =>
      'Test/label kabels altijd (vooral als je huurt).';

  @override
  String get aboutReseauSection2Bullet6 =>
      'Vermijd beschadigde connectoren: een \"vermoeide\" RJ45 = fantoomfouten.';

  @override
  String get aboutReseauSection2Bullet7 =>
      'Reken op 10G als je veel IP-video doet.';

  @override
  String get aboutReseauSection3Paragraph =>
      'PoE kan worden gebruikt om apparatuur via RJ45 van stroom te voorzien (IP-cams, Wi-Fi-AP\'s, kleine nodes, enz.). Het kritieke punt: het totale PoE-budget van de switch.';

  @override
  String get aboutReseauSection3Title => 'Bezienswaardigheden';

  @override
  String get aboutReseauSection3Bullet1 =>
      'PoE (802.3af) ≈ 15W, PoE+ (802.3at) ≈ 30W, PoE++/bt hoger.';

  @override
  String get aboutReseauSection3Bullet2 =>
      'De schakelaar heeft een totaal \"budget\" (bijv. 120W).';

  @override
  String get aboutReseauSection3Bullet3 =>
      'Als je je budget overschrijdt: sommige poorten lichten niet meer op / herstarten niet meer.';

  @override
  String get aboutReseauSection4Title => 'Waarom vezels in de show';

  @override
  String get aboutReseauSection4Bullet1 => 'Zeer lange afstanden.';

  @override
  String get aboutReseauSection4Bullet2 =>
      'Immuniteit voor interferentie (EMI), top in drukke omgevingen.';

  @override
  String get aboutReseauSection4Bullet3 =>
      'Praktisch voor het verbinden van FOH ↔ set ↔ controlekamer.';

  @override
  String get aboutReseauSection4Title2 =>
      'Multimode vs. enkelvoudige modus (enkele markering)';

  @override
  String get aboutReseauSection4Bullet4 =>
      'Multimode (MM): \"middellange\" afstanden (vaak gebouw/platform).';

  @override
  String get aboutReseauSection4Bullet5 =>
      'Enkelvoudige modus (SM): zeer lange afstanden.';

  @override
  String get aboutReseauSection4Bullet6 =>
      'De (SFP) modules moeten overeenkomen met het vezeltype.';

  @override
  String get aboutReseauSection4Title3 => 'Aansluitingen';

  @override
  String get aboutReseauSection4Bullet7 => 'LC: klein, komt vaak voor op SFP.';

  @override
  String get aboutReseauSection4Bullet8 =>
      'SC: Groter, gebruikelijk in infrastructuur.';

  @override
  String get aboutReseauSection4Bullet9 =>
      'Altijd beschermen/schoonmaken (stof = verliezen).';

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
      'Een module = snelheid + vezeltype + lengte (alles moet consistent zijn).';

  @override
  String get aboutReseauSection5Paragraph =>
      'In de praktijk: gebruik modules die compatibel zijn met de schakelaar (en idealiter van dezelfde leverancier/model) om verrassingen te voorkomen.';

  @override
  String get aboutReseauSection6Title => 'Nuttige showfuncties';

  @override
  String get aboutReseauSection6Bullet1 =>
      'VLAN: afzonderlijke verlichting/video/IT.';

  @override
  String get aboutReseauSection6Bullet2 =>
      'IGMP snooping: essentieel als je sACN multicast op grote schaal gebruikt.';

  @override
  String get aboutReseauSection6Bullet3 =>
      'QoS: nuttig als je veel stromen mengt (afhankelijk van de context).';

  @override
  String get aboutReseauSection6Title2 => 'Veelvoorkomende fouten';

  @override
  String get aboutReseauSection6Bullet4 =>
      'Goedkope schakelaar die multicast verzendt → netwerk stort in.';

  @override
  String get aboutReseauSection6Bullet5 =>
      'Netwerklus zonder STP → broadcast storm.';

  @override
  String get aboutReseauSection6Bullet6 =>
      'Openbare Wi-Fi op hetzelfde LAN als de show → instabiliteit.';

  @override
  String get aboutReseauSection7Title => 'Art-Net (terrein)';

  @override
  String get aboutReseauSection7Bullet1 => 'Vaak eenvoudig in te stellen.';

  @override
  String get aboutReseauSection7Bullet2 =>
      'Broadcast mogelijk op klein, speciaal LAN, maar unicast is schoner.';

  @override
  String get aboutReseauSection7Bullet3 =>
      'Universums/poorten in kaart brengen = punt nummer 1 om te controleren.';

  @override
  String get aboutReseauSection7Title2 => 'sACN (land)';

  @override
  String get aboutReseauSection7Bullet4 =>
      'Multicast: effectief, maar vereist een goede switch (IGMP).';

  @override
  String get aboutReseauSection7Bullet5 =>
      'Prioriteiten: nuttig als er meerdere bronnen zijn.';

  @override
  String get aboutReseauSection7Bullet6 =>
      'Op grote shows is sACN + IGMP vaak de \'schone\' keuze.';

  @override
  String get aboutReseauChecklistTitle => 'Snel';

  @override
  String get aboutReseauChecklistBullet1 =>
      'Juiste schakelaar + schone kabels.';

  @override
  String get aboutReseauChecklistBullet2 => 'IGMP als multicast sACN.';

  @override
  String get aboutReseauChecklistBullet3 => 'Gescheiden gebruik (VLAN).';

  @override
  String get aboutSacnPageTitle => 'sACN / E1.31 - multicast & prioriteiten';

  @override
  String get aboutSacnCopyTooltip => 'Markeringen kopiëren';

  @override
  String get aboutSacnChecklistCopyTooltip => 'Kopie';

  @override
  String get aboutSacnFooterNote =>
      'Indicatieve info (veld). Gedrag is afhankelijk van switches (IGMP), knooppunten en firmware.\nDoel: een sACN-netwerk begrijpen en stabiliseren.';

  @override
  String get aboutSacnCopy1 =>
      'sACN (E1.31) = DMX over IP (UDP), standaard weergeven.';

  @override
  String get aboutSacnCopy2 => 'Universum sACN = 1..63999 (standaardbereik).';

  @override
  String get aboutSacnCopy3 =>
      'Multicast: IGMP snooping aanbevolen, anders flood.';

  @override
  String get aboutSacnCopy4 =>
      'Prioriteit: nuttig met meerdere bronnen (console + back-up).';

  @override
  String get aboutSacnChecklistCopy =>
      'sACN (E1.31) - Veldcontrolelijst\n☐ Schakelaar correct (idealiter beheerbaar)\n☐ IGMP snooping ingeschakeld indien multicast\n☐ (Indien mogelijk) IGMP querier aanwezig in het VLAN (anders is vreemd gedrag mogelijk)\n☐ Unicast indien netwerk niet onder controle / probleemoplossing\n☐ Prioriteiten: controleer meerdere bronnen (console/back-up)\n☐ Mapping universe ↔ ports node gecontroleerd\n☐ Wi-Fi in productie vermijden';

  @override
  String get aboutSacnToc1 => '1) Waar wordt sACN voor gebruikt?';

  @override
  String get aboutSacnToc2 => '2) Universum (nummering)';

  @override
  String get aboutSacnToc3 => '3) Multicast / Unicast + IGMP';

  @override
  String get aboutSacnToc4 => '4) Prioriteiten (meerdere bronnen)';

  @override
  String get aboutSacnToc5 => '5) Grenzen / prestaties';

  @override
  String get aboutSacnToc6 =>
      '6) RDM & sACN (proxy / afhankelijk van apparatuur)';

  @override
  String get aboutSacnToc7 => '7) Diagrammen';

  @override
  String get aboutSacnToc8 => '8) Checklist';

  @override
  String get aboutSacnSection1Pill1 => 'UDP';

  @override
  String get aboutSacnSection1Pill2 => 'Multicast';

  @override
  String get aboutSacnSection1Pill3 => 'Prioriteit';

  @override
  String get aboutSacnSection1Paragraph =>
      'sACN (E1.31) is een veelgebruikte standaard voor het transporteren van DMX-universums over IP. Het heeft vaak de voorkeur als je een schone netwerkarchitectuur wilt: goed beheerde multicast, gestandaardiseerde prioriteiten en meer \"pro-netwerk\" gedrag.';

  @override
  String get aboutSacnSection1Title => 'Wanneer het top is';

  @override
  String get aboutSacnSection1Bullet1 =>
      'Veel universums op een goed beheerd netwerk.';

  @override
  String get aboutSacnSection1Bullet2 =>
      'Installaties / grote netwerken met meerdere bronnen (prioriteiten).';

  @override
  String get aboutSacnSection1Bullet3 =>
      'Wanneer je \"overal uitzenden\" wilt vermijden.';

  @override
  String get aboutSacnSection2Pill1 => 'Universum 1..63999';

  @override
  String get aboutSacnSection2Pill2 => '512 slots/universum';

  @override
  String get aboutSacnSection2Paragraph =>
      'Eén sACN-universum komt overeen met één DMX-universum: maximaal 512 slots. De standaard sACN-nummering is 1..63999. In de praktijk is de toewijzing van de console ↔ node ↔ DMX-poort belangrijk.';

  @override
  String get aboutSacnSection2Title => 'Klassieke fout';

  @override
  String get aboutSacnSection2Bullet1 =>
      'U wijzigt het universumnummer aan de consolekant, maar niet aan de knooppuntkant (of omgekeerd).';

  @override
  String get aboutSacnSection2Bullet2 =>
      'Je patch \"Universe 0\" wanneer de hardware een basis 1 verwacht.';

  @override
  String get aboutSacnSection2Bullet3 =>
      'Je haalt nummerconventies tussen gereedschappen door elkaar.';

  @override
  String get aboutSacnSection3Paragraph =>
      'sACN maakt vaak gebruik van multicast: elk universum \"leeft\" op een multicast groep en de knooppunten abonneren zich op de universums die ze nodig hebben.';

  @override
  String get aboutSacnSection3Title =>
      'IGMP snooping (waarom het belangrijk is)';

  @override
  String get aboutSacnSection3Bullet1 =>
      'Zonder IGMP: de switch \"floods\" multicast overal → mogelijke overbelasting.';

  @override
  String get aboutSacnSection3Bullet2 =>
      'Met IGMP: de switch verzendt alleen naar geabonneerde poorten → stabiel netwerk.';

  @override
  String get aboutSacnSection3Bullet3 =>
      'Voor grote volumes: IGMP is vaak HET verschil tussen \"het werkt\" en \"het is een hel\".';

  @override
  String get aboutSacnSection3Subtitle => 'Diagram: multicast & IGMP';

  @override
  String get aboutSacnSection3Subtitle2 => 'Unicast (optie)';

  @override
  String get aboutSacnSection3SubBullet1 =>
      'Mogelijk afhankelijk van consoles/nodes.';

  @override
  String get aboutSacnSection3SubBullet2 =>
      'Nuttig voor probleemoplossing of als het multicast-netwerk niet meer onder controle is.';

  @override
  String get aboutSacnSection3SubBullet3 =>
      'Minder elegant, maar soms eenvoudiger.';

  @override
  String get aboutSacnSection4Pill1 => 'Bron A prio 100';

  @override
  String get aboutSacnSection4Pill2 => 'Bron B prio 90';

  @override
  String get aboutSacnSection4Paragraph =>
      'sACN beheert een notie van prioriteit: als meerdere bronnen hetzelfde universum verzenden, behoudt de ontvanger de bron met de hoogste prioriteit. Zeer nuttig met een hoofdconsole + een back-upconsole + een mediaserver.';

  @override
  String get aboutSacnSection4Title => 'Vallen';

  @override
  String get aboutSacnSection4Bullet1 =>
      'Twee ongewenste bronnen op hetzelfde universum → \"het vecht\".';

  @override
  String get aboutSacnSection4Bullet2 =>
      'Prioriteit verkeerd ingesteld → back-up neemt over.';

  @override
  String get aboutSacnSection4Bullet3 =>
      'Debug: knip een bron door en kijk wie er wint.';

  @override
  String get aboutSacnSection5Pill1 => 'IGMP';

  @override
  String get aboutSacnSection5Pill2 => 'Schakelaar';

  @override
  String get aboutSacnSection5Pill3 => 'Wi-Fi nee';

  @override
  String get aboutSacnSection5Pill4 => 'CPU-knooppunt';

  @override
  String get aboutSacnSection5Title => 'Wat het eerst breekt';

  @override
  String get aboutSacnSection5Bullet1 =>
      'Multicast zonder IGMP → overstroming.';

  @override
  String get aboutSacnSection5Bullet2 =>
      'Schakelaar niet aangepast (buffers/CPU) → verliezen.';

  @override
  String get aboutSacnSection5Bullet3 => 'Wi-Fi → jitter/verliezen.';

  @override
  String get aboutSacnSection5Bullet4 =>
      'Beperkte knooppunten (poorten, firmware).';

  @override
  String get aboutSacnSection5Subtitle => 'Eenvoudige regels';

  @override
  String get aboutSacnSection5SubBullet1 =>
      'Beheerde schakelaar + IGMP-snooping als er veel universums zijn.';

  @override
  String get aboutSacnSection5SubBullet2 =>
      'Dedicated light VLAN indien mogelijk.';

  @override
  String get aboutSacnSection5SubBullet3 => 'Unicast voor probleemoplossing.';

  @override
  String get aboutSacnSection6Paragraph =>
      'Net als bij Art-Net is RDM \"over IP\" vaak afhankelijk van een proxy mechanisme in de nodes. De sACN standaard impliceert niet automatisch dat je knooppunt RDM correct uitvoert.';

  @override
  String get aboutSacnSection6Title => 'Controleer de knooppuntdocumentatie';

  @override
  String get aboutSacnSection6Bullet1 =>
      'Ondersteuning voor RDM proxy / RDM over IP.';

  @override
  String get aboutSacnSection6Bullet2 =>
      'Beperkingen (alleen ontdekken, gedeeltelijke opdrachten).';

  @override
  String get aboutSacnSection6Bullet3 =>
      'Compatibel met splitters/opto aan DMX-zijde.';

  @override
  String get aboutSacnSection6Subtitle => 'Veldmethode';

  @override
  String get aboutSacnSection6SubBullet1 => 'DMX stabiliseren zonder RDM.';

  @override
  String get aboutSacnSection6SubBullet2 =>
      'Test RDM op een eenvoudige, strakke lijn.';

  @override
  String get aboutSacnSection6SubBullet3 =>
      'Als er problemen optreden: schakel RDM uit en isoleer vervolgens het knooppunt/de splitter.';

  @override
  String get aboutSacnSection7Subtitle1 => 'Multicast + IGMP (idee)';

  @override
  String get aboutSacnSection7Subtitle2 => 'Prioriteiten (2 bronnen)';

  @override
  String get aboutSacnChecklistTitle =>
      'Voordat je \"protocol\" de schuld geeft';

  @override
  String get aboutSacnChecklistBullet1 =>
      'IGMP snooping ingeschakeld als multicast.';

  @override
  String get aboutSacnChecklistBullet2 => 'Toegewijde VLAN indien mogelijk.';

  @override
  String get aboutSacnChecklistBullet3 => 'Unicast voor probleemoplossing.';

  @override
  String get aboutSacnChecklistBullet4 =>
      'Consistente prioriteiten als er meerdere bronnen zijn.';

  @override
  String get aboutSacnChecklistBullet5 => 'Wi-Fi vermeden in prod.';

  @override
  String get sunTimesTitle => 'Zonsopgang / zonsondergang';

  @override
  String get sunTimesSectionSettings => 'Parameters';

  @override
  String get sunTimesSectionResults => 'Resultaten';

  @override
  String get sunTimesSectionTimeline => 'Tijdlijn (stappen van 30 minuten)';

  @override
  String get sunTimesSectionTwilight => 'Wat is schemering?';

  @override
  String get sunTimesSectionLux => 'Helderheidsdrempels (markers)';

  @override
  String get sunTimesIntro =>
      'Kies een stad en een datum. Tijden zijn indicatief (afgerond).';

  @override
  String get sunTimesLabelCity => 'Stad';

  @override
  String get sunTimesLabelDate => 'Datum';

  @override
  String get sunTimesNoteApprox =>
      'Tijden zijn bij benadering - kunnen variëren afhankelijk van hoogte, breking en weer.';

  @override
  String get sunTimesNoData => '-';

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
  String get sunTimesTimelineStep30 => 'Standplaats: 30 min';

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
      'Schemering wordt gedefinieerd door de hoogte van de zon onder de horizon. Deze definities zijn gestandaardiseerd.';

  @override
  String get sunTimesTwilightCivilTitle => 'Civiel (≈ 0° tot -6°)';

  @override
  String get sunTimesTwilightCivilBody =>
      'Einde/begin van de dag. Het landschap is nog steeds duidelijk zichtbaar.';

  @override
  String get sunTimesTwilightNauticalTitle => 'Nautisch (≈ -6° tot -12°)';

  @override
  String get sunTimesTwilightNauticalBody =>
      'De horizon wordt moeilijk te onderscheiden. De lucht is veel donkerder.';

  @override
  String get sunTimesTwilightAstronomicalTitle =>
      'Astronomisch (≈ -12° tot -18°)';

  @override
  String get sunTimesTwilightAstronomicalBody =>
      'De hemel is bijna helemaal donker (weinig restlicht).';

  @override
  String get sunTimesLuxNight => 'Zwarte nacht';

  @override
  String get sunTimesLuxAstro => 'Astro schemering';

  @override
  String get sunTimesLuxNautical => 'Twilight is geboren.';

  @override
  String get sunTimesLuxCivil => 'Burgerlijke schemering';

  @override
  String get sunTimesLuxVeryLow => 'Zeer laag';

  @override
  String get sunTimesLuxLow => 'Laag';

  @override
  String get sunTimesLuxDay => 'Dag';

  @override
  String get sunTimesLuxFullDay => 'Daglicht';

  @override
  String get sunTimesLuxNote =>
      'Deze waarden zijn typische benchmarks (weer, seizoen, omgeving → variaties).';

  @override
  String get aboutVideoPageTitle => 'Video - oriëntatiepunten';

  @override
  String get aboutVideoSummaryCopy =>
      'VIDEO - oriëntatiepunten\n- Resolutie = grootte (px). FPS = vloeiendheid / latentie.\n- 4:2:2 / 4:4:4 + 10-bit = kleurkwaliteit.\n- SDI = robuust + lange afstand.\n- HDMI = kwetsbaar + kort.\n- NDI = IP (netwerk), afhankelijk van LAN.\n- Genlock / Timecode = synchro.';

  @override
  String get aboutVideoChecklistCopy =>
      'VIDEO - Checklist\n☐ Overal dezelfde resolutie & FPS\n☐ HDMI: EDID / HDCP gemastered\n☐ SDI: 75Ω kabel + goede standaard\n☐ NDI/IP: schoon LAN (switch, snelheid)\n☐ Genlock / Timecode indien synchro vereist\n☐ Testbron → direct scherm';

  @override
  String get aboutVideoChecklistCopyTooltip => 'Kopie';

  @override
  String get aboutVideoFooterNote =>
      'Indicatieve informatie (veld). Gedrag varieert afhankelijk van de apparatuur.\nDoel: snel begrijpen en problemen netjes oplossen.';

  @override
  String get aboutVideoToc1 => '1) Videobasis (trefwoorden)';

  @override
  String get aboutVideoToc2 => '2) Resolutie en FPS';

  @override
  String get aboutVideoToc3 => '3) Kleur (4:4:4 / 4:2:2 / 10-bits)';

  @override
  String get aboutVideoToc4 => '4) Synchronisatie (Genlock / Tijdcode)';

  @override
  String get aboutVideoToc5 => '5) Kabels en afstanden';

  @override
  String get aboutVideoToc6 => '6) SDI (3G / 6G / 12G)';

  @override
  String get aboutVideoToc7 => '7) HDMI - veld';

  @override
  String get aboutVideoToc8 => '8) NDI - wanneer / waarom / grenzen';

  @override
  String get aboutVideoToc9 => '9) Mapping / LED / multi-projo';

  @override
  String get aboutVideoSection1Paragraph =>
      'Video is een beeld (pixels) dat wordt verzonden met een snelheid (FPS), met een kleurenstructuur (sampling / bitdiepte), getransporteerd door een link (SDI / HDMI / IP) en soms gesynchroniseerd.';

  @override
  String get aboutVideoSection1Title => 'Nuttige woordenschat';

  @override
  String get aboutVideoSection1Bullet1 => 'Resolutie: breedte×hoogte (px).';

  @override
  String get aboutVideoSection1Bullet2 => 'FPS: vloeiendheid/latentie.';

  @override
  String get aboutVideoSection1Bullet3 => 'Progressief (p) vs interlaced (i).';

  @override
  String get aboutVideoSection1Bullet4 =>
      'Codec: compressie (H.264, H.265...).';

  @override
  String get aboutVideoSection1Bullet5 => 'Latency: live recensie.';

  @override
  String get aboutVideoSection2Title => 'Resolutie';

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
  String get aboutVideoSection3Bullet1 => '4:4:4: graphics / keying.';

  @override
  String get aboutVideoSection3Bullet2 => '4:2:2: pro courant.';

  @override
  String get aboutVideoSection3Bullet3 => '4:2:0: bestanden / streams.';

  @override
  String get aboutVideoSection3Title2 => 'Bitdiepte';

  @override
  String get aboutVideoSection3Bullet4 => '8-bits: standaard.';

  @override
  String get aboutVideoSection3Bullet5 =>
      '10-bits: betere gradatie (HDR / LED).';

  @override
  String get aboutVideoSection4Title => 'Genlock';

  @override
  String get aboutVideoSection4Bullet1 => 'Synchroniseert de beeldverversing.';

  @override
  String get aboutVideoSection4Bullet2 =>
      'Handig voor multi-cam / LED / uitzending.';

  @override
  String get aboutVideoSection4Title2 => 'Tijdcode';

  @override
  String get aboutVideoSection4Bullet3 => 'Tijdsynchronisatie.';

  @override
  String get aboutVideoSection4Bullet4 => 'Vervangt de genlock niet.';

  @override
  String get aboutVideoSection5Title => 'Eenvoudige regels';

  @override
  String get aboutVideoSection5Bullet1 => 'HDMI: breekbaar, kort.';

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
  String get aboutVideoSection7Title => 'Waar je op moet letten';

  @override
  String get aboutVideoSection7Bullet1 => 'EDID';

  @override
  String get aboutVideoSection7Bullet2 => 'HDCP';

  @override
  String get aboutVideoSection7Bullet3 => 'Lengtes';

  @override
  String get aboutVideoSection8Title => 'IP-video';

  @override
  String get aboutVideoSection8Bullet1 => 'Flexibel.';

  @override
  String get aboutVideoSection8Bullet2 => 'Netwerkbelasting.';

  @override
  String get aboutVideoSection8Bullet3 => 'Schoon LAN vereist.';

  @override
  String get aboutVideoSection9Title => 'Land';

  @override
  String get aboutVideoSection9Bullet1 => 'Dezelfde resolutie / FPS.';

  @override
  String get aboutVideoSection9Bullet2 => 'Juiste toewijzing.';

  @override
  String get aboutVideoSection9Bullet3 => 'Test met testpatronen.';

  @override
  String get aboutVideoChecklistTitle => 'Voordat je in paniek raakt';

  @override
  String get aboutVideoChecklistBullet1 => 'Controleer resolutie / FPS.';

  @override
  String get aboutVideoChecklistBullet2 => 'Test bron → scherm.';

  @override
  String get aboutVideoChecklistBullet3 => 'Vereenvoudig de keten.';

  @override
  String get homeBpmSubtitle => 'Tik tempo, BPM conversie ↔ ms, Hz, maat.';

  @override
  String get bpmTitle => 'BPM';

  @override
  String get bpmTapTitle => 'Tik op tempo';

  @override
  String get bpmTapButton => 'Type';

  @override
  String get bpmResetTap => 'Kranen resetten';

  @override
  String get bpmDetectedLabel => 'BPM gedetecteerd';

  @override
  String get bpmTapHint =>
      'Tik verschillende keren (idealiter 4 tot 8 keer) om een stabiel gemiddelde te verkrijgen.';

  @override
  String get bpmManualTitle => 'Handmatige BPM';

  @override
  String get bpmManualLabel => 'BPM';

  @override
  String get bpmManualHint => 'Ex. 128';

  @override
  String get commonAdd => 'Voeg  toe';

  @override
  String get commonEdit => 'wijzigen';

  @override
  String get commonDelete => 'Verwijder';

  @override
  String get commonCopied => 'Gekopieerd naar het klembord.';

  @override
  String get patchCreateGdtfTitle => 'Een GDTF maken (eenvoudig)';

  @override
  String get patchCreateGdtfSubtitle =>
      'Handmatig een apparaat aanmaken in tabelvorm.';

  @override
  String get gdtfSimpleTitle => 'GDTF-maker (eenvoudig)';

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
  String get gdtfColType => 'Type';

  @override
  String get gdtfColRes => '8/16';

  @override
  String get gdtfColDefault => 'Fout';

  @override
  String get gdtfColActions => 'Acties';

  @override
  String get gdtfMoveUp => 'Naar boven';

  @override
  String get gdtfMoveDown => 'Naar beneden';

  @override
  String get gdtfChannelAddTitle => 'Een kanaal toevoegen';

  @override
  String get gdtfChannelEditTitle => 'Kanaal wijzigen';

  @override
  String get gdtfFieldName => 'Naam';

  @override
  String get gdtfFieldDmx => 'DMX-adres';

  @override
  String get gdtfFieldType => 'Type';

  @override
  String get gdtfFieldResolution => 'Resolutie';

  @override
  String get gdtfRes8 => '8-bit';

  @override
  String get gdtfRes16 => '16-bit';

  @override
  String get gdtfFieldDefault8 => 'Standaardwaarde (0-255)';

  @override
  String get gdtfFieldDefault16 => 'Standaardwaarde (0-65535)';

  @override
  String get gdtfDefaultChannelName => 'Kanaal';

  @override
  String get gdtfMvpHint =>
      'MVP: JSON export (klembord). De daadwerkelijke GDTF-export (XML+ZIP) volgt.';

  @override
  String get gdtfTypeDimmer => 'Dimmer';

  @override
  String get gdtfTypePan => 'Pan';

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
  String get gdtfTypeCustom => 'Gepersonaliseerde';

  @override
  String get gdtfEasyTitle => 'Een GDTF maken (eenvoudig)';

  @override
  String get gdtfTemplatesTitle => 'Preselecties';

  @override
  String get gdtfCreateDefaultPreset => 'De standaardpreset maken';

  @override
  String get gdtfTemplatesHint =>
      'Creëert een snelle basis (dimmer, sluiter, pan, tilt, RGB, enz.) en vult vervolgens DMX-adressen en fouten in.';

  @override
  String get gdtfExportButton => 'GDTF exporteren';

  @override
  String get gdtfExportHint =>
      'Minimale .gdtf export (description.xml) en vervolgens delen (Mail, WhatsApp, AirDrop, Drive...).';

  @override
  String get gdtfExportNeedDmx =>
      'Voegt ten minste één DMX-adres toe voor export.';

  @override
  String get gdtfExportDone => 'GDTF geëxporteerd.';

  @override
  String get gdtfExportError => 'Kan de GDTF niet exporteren.';

  @override
  String get gdtfShareSubject => 'GDTF-bestand';

  @override
  String get gdtfShareText => 'Hier is het geëxporteerde GDTF-bestand.';

  @override
  String get gdtfFieldRole => 'Parameter';

  @override
  String get gdtfDmxHint => 'Leeg of 1-512';

  @override
  String get gdtfFieldDefault => 'Fout';

  @override
  String get gdtfDefaultHint8 => '0-255';

  @override
  String get gdtfDefaultHint16 => '0-65535';

  @override
  String get gdtfChannelDefaultName => 'Kanaal';

  @override
  String get gdtfRoleEmpty => 'Leeg / Onbekend';

  @override
  String get gdtfRoleDimmer => 'Dimmer';

  @override
  String get gdtfRoleShutter => 'Sluiter';

  @override
  String get gdtfRolePan => 'Pan';

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
  String get gdtfResUnknown => 'Vacuüm';

  @override
  String get gdtfPresetDimmer => 'Dimmer';

  @override
  String get gdtfPresetShutter => 'Sluiter';

  @override
  String get gdtfPresetPan => 'Pan';

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
  String get gdtfPresetFixtureSimple => 'Enkele armatuur';

  @override
  String get gdtfPresetBarreLed => 'LED-balk';

  @override
  String get gdtfTemplatesHintShort =>
      'Kies een preset en pas toe. Vervolgens kun je DMX en standaardinstellingen aanpassen en de volgorde wijzigen met slepen en neerzetten.';

  @override
  String get gdtfExportNeedChannels =>
      'Voegt minstens één kanaal toe voor export.';

  @override
  String get homeDrawerContact => 'Contact opnemen met de ontwikkelaar';

  @override
  String get homeDrawerSuggestItem => 'Een item toevoegen aan de catalogus';

  @override
  String get homeErrorOpenEmail => 'Kan het e-mailprogramma niet openen.';

  @override
  String get homeErrorOpenForm => 'Kan het formulier niet openen.';

  @override
  String get homeContactEmailSubject => 'Vraag over Mijn App Tech';

  @override
  String get bpmManualHelp =>
      'Als een handmatige BPM wordt ingevoerd, heeft deze voorrang op het tap tempo.';

  @override
  String get bpmConversionsTitle => 'Conversies';

  @override
  String get bpmActiveLabel => 'Actieve BPM';

  @override
  String get bpmMsPerBeat => 'Duur van een beat';

  @override
  String get bpmHz => 'Frequentie';

  @override
  String get bpmSecPerBar44 => 'Duur van een maat (4/4)';

  @override
  String get bpmDisclaimer =>
      'Indicatie bij benadering. Controleer de metronoom als het belangrijk is.';

  @override
  String get laserToolsTitle => 'Gereedschap';

  @override
  String get laserBeamSizeTitle => 'Bundelgrootte';

  @override
  String get laserBeamSizeSubtitle =>
      'Diameter, straal en oppervlakte van de vlek op een bepaalde afstand.';

  @override
  String get laserBeamInputsTitle => 'Parameters';

  @override
  String get laserBeamDistanceLabel => 'Afstand';

  @override
  String get laserBeamDistanceHint => 'm (ex. 12)';

  @override
  String get laserBeamFormulaHint =>
      'Berekening: D(z) = D0 + θ - z (θ in rad, volledige hoek).';

  @override
  String get laserBeamResultsTitle => 'Resultaten';

  @override
  String get laserBeamDiameterAtDistance => 'Diameter op afstand';

  @override
  String get laserBeamRadiusAtDistance => 'Straal op afstand';

  @override
  String get laserBeamAreaAtDistance => 'Spot oppervlak';

  @override
  String get sunTimesPageTitle => 'Zonsopgang / zonsondergang';

  @override
  String get sunTimesSelectionTitle => 'Parameters';

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
  String get sunTimesDayLengthLabel => 'Duur van de dag';

  @override
  String get sunTimesDisclaimer =>
      'Indicatieve waarden (astronomisch model). Controleer met een officiële bron indien nodig (evenement, veiligheid, filmen).';

  @override
  String get sunTimesThresholdTitle => 'Helderheidsdrempels (markers)';

  @override
  String get sunTimesThresholdIntro =>
      'Orden van grootte nuttig voor het anticiperen op omgevingslicht (zeer variabel afhankelijk van weer, breedtegraad, seizoen, obstakels, lichtvervuiling).';

  @override
  String get sunTimesLuxDaylight => 'Daglicht (uitgezonderd direct zonlicht)';

  @override
  String get sunTimesLuxOvercast => 'Bewolkt (typisch)';

  @override
  String get sunTimesLuxSunrise => 'Rise/set (duidelijk)';

  @override
  String get sunTimesLuxCivilTwilight => 'Limiet civiele schemering (helder)';

  @override
  String get sunTimesLuxFullMoon => 'Volle maan (helder)';

  @override
  String get sunTimesThresholdNote =>
      'Tip: voor \"bruikbaar zonder verlichting\" spotten, streven we vaak naar > 100-300 lx. Richt voor fijn werk op 500 lx of meer.';

  @override
  String get sunTimesParamsTitle => 'Parameters';

  @override
  String get sunTimesPickDate => 'Kies een datum';

  @override
  String get sunTimesSunrise => 'verhogen';

  @override
  String get sunTimesSunset => 'Bedtijd';

  @override
  String get sunTimesDayLength => 'Duur van de dag';

  @override
  String get sunTimesPolarNote =>
      'Opmerking: in gebieden dicht bij de polen kan zonsopgang/ondergang afwezig zijn, afhankelijk van het seizoen.';

  @override
  String get sunTimesLuxThresholdTitle => 'Helderheidsdrempels (markers)';

  @override
  String get sunTimesLuxBulletNightDark => 'Donkere nacht: < 1 lux';

  @override
  String get sunTimesLuxBulletNightMoon => 'Nacht (maan): ~ 0,1-1 lux';

  @override
  String get sunTimesLuxBulletFullMoon => 'Volle maan: ~ 0.1-0.3 lux';

  @override
  String get sunTimesLuxBulletCivilTwilight =>
      'Civiele schemering: Zon op -6°.';

  @override
  String get sunTimesLuxBulletUrbanLow => 'Zwakke stadsverlichting: ~ 5-20 lux';

  @override
  String get sunTimesLuxBulletOfficeLow => 'Zwak kantoor: ~ 100-300 lux';

  @override
  String get sunTimesLuxBulletOfficeStd => 'Standaard kantoor: ~ 300-500 lux';

  @override
  String get sunTimesLuxBulletOutdoorDay =>
      'Buiten overdag: ~ 10.000-25.000 lux';

  @override
  String get sunTimesLuxBulletDirectSun => 'Direct zonlicht: ~ 100.000 lux';

  @override
  String get sunTimesLuxDisclaimer =>
      'Referentiepunten: weer/bewolking, omgeving, seizoen en terrein kunnen aanzienlijk variëren.';

  @override
  String get sunTimesTwilightTitle => 'Twilight: wat betekent het?';

  @override
  String get sunTimesTwilightCivil =>
      'Civiel (-6°): licht dat nog voldoende is om de omgeving te onderscheiden zonder kunstlicht.';

  @override
  String get sunTimesTwilightNautical =>
      'Nautisch (-12°): de horizon wordt moeilijk te onderscheiden; sterren zichtbaar.';

  @override
  String get sunTimesTwilightAstronomical =>
      'Astronomisch (-18°): de hemel wordt als \"zwart\" beschouwd (lichtvervuiling niet meegerekend).';

  @override
  String get sunTimesTwilightAnglesNote =>
      'Hoeken uitgedrukt in graden onder de horizon (negatieve zon).';

  @override
  String get sunTimesLuxBulletAstronomicalTwilight =>
      'Astronomische schemering: Zon op -18°.';

  @override
  String get sunTimesTimelineTitleStep30 => 'Tijdlijn (niet 30 min)';

  @override
  String get sunTimesTimelineColTime => 'Tijd';

  @override
  String get sunTimesTimelineColElevation => 'Verhoging';

  @override
  String get sunTimesTimelineColMarker => 'Referentie';

  @override
  String get sunTimesTimelineColLux => 'Lux (bestelling)';

  @override
  String get sunTimesTimelineFootnote =>
      'Indicatieve ijkpunten (weer/bewolking, omgeving, seizoen) - nuttig om een show voor te bereiden.';

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
  String get videoLedResultWallSize => 'Afmeting wand';

  @override
  String get videoLedResultTile => 'Plak';

  @override
  String get videoLedResultPitch => 'Standplaats';

  @override
  String get lightFilterLedTabConvert => 'Conversie';

  @override
  String get lightFilterLedTabProfiles => 'Mijn armaturen';

  @override
  String get lightFilterLedSourceLabel => 'Lichtbron';

  @override
  String get lightFilterLedEngineRgbww => 'RGBWW (warm + koel wit)';

  @override
  String get lightFilterLedEngineRgbaw => 'RGBAW';

  @override
  String get lightFilterLedEngineRgbauv => 'RGBAUV';

  @override
  String get lightFilterLedEngineRgbwauv => 'RGBWAUV';

  @override
  String get lightFilterLedEngineRgbrcl => 'RGBRCL (rood, cyaan, lime)';

  @override
  String get lightFilterLedEngineCmy => 'CMY';

  @override
  String get lightFilterLedSaveProfileTitle =>
      'Het profiel van de armatuur opslaan';

  @override
  String get lightFilterLedProfileNameLabel => 'Naam van armatuur';

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
    return '$name\" profiel opgeslagen';
  }

  @override
  String get lightFilterLedNoProfiles => 'Geen armatuurprofiel opgeslagen';

  @override
  String get lightFilterLedNoProfilesHint =>
      'Kalibreer de kanalen in het tabblad Conversie,\nSla dan op met het 💾 pictogram.';

  @override
  String get lightFilterLedTitle => 'Bijpassende LED-filters';

  @override
  String get lightFilterLedDescription =>
      'Conversie van LEE, Rosco... filters naar LED-motoren (RGB, RGBA, RGBW, enz.).';

  @override
  String get lightFilterLedBrandLabel => 'Merk';

  @override
  String get lightFilterLedSearchLabel => 'Zoek op';

  @override
  String get lightFilterLedSearchHint => 'Filtercode of -naam';

  @override
  String get lightFilterLedFilterLabel => 'Filter';

  @override
  String get lightFilterLedEngineLabel => 'LED-motor';

  @override
  String get lightFilterLedShowPercentLabel => 'Weergeven als een percentage';

  @override
  String get lightFilterLedShowPercentHint =>
      'Anders worden de waarden weergegeven in DMX 0-255.';

  @override
  String get lightFilterLedHexLabel => 'Referentiekleur';

  @override
  String get lightFilterLedChromaticityLabel => 'Chromaticiteit';

  @override
  String get lightFilterLedTransmissionLabel => 'Transmissie';

  @override
  String get lightFilterLedResultTitle => 'Resultaten';

  @override
  String get lightFilterLedOriginalPreviewLabel => 'Filteroverzicht';

  @override
  String get lightFilterLedApproximatePreviewLabel =>
      'LED-overzicht bij benadering';

  @override
  String get lightFilterLedDisclaimer =>
      'Alleen indicatief resultaat. De werkelijke weergave is afhankelijk van de projector, het spectrum, de kalibratie, de kleurmodus en de gebruikscontext.';

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
  String get aboutSearchHint => 'Zoeken in referenties';

  @override
  String get aboutSearchNoResults => 'Geen resultaten gevonden.';

  @override
  String get homePinnedTitle => 'Pinnen';

  @override
  String get homePinnedSubtitle => 'Vind snel je vastgemaakte referenties.';

  @override
  String get pinnedReferencesTitle => 'Referenties vastgepind';

  @override
  String get pinnedReferencesEmpty => 'Er zijn nog geen referenties gepend.';

  @override
  String get aboutPinAddTooltip => 'Deze referentie vastpinnen';

  @override
  String get aboutPinRemoveTooltip => 'Verwijder deze pin';

  @override
  String get aboutPinAddedMessage => 'Referentie vastgepind.';

  @override
  String get aboutPinRemovedMessage => 'Pin verwijderd.';

  @override
  String get homeDrawerSubscriptions => 'Abonnementen';

  @override
  String get subscriptionPageTitle => 'Abonnementen';

  @override
  String get subscriptionHeadlineAllTitle => 'Kies je formule';

  @override
  String get subscriptionHeadlineAllSubtitle =>
      'Bekijk hier je huidige aankopen en de abonnementen die nog beschikbaar zijn.';

  @override
  String subscriptionHeadlineUnlock(Object module) {
    return '$module ontgrendelen';
  }

  @override
  String get subscriptionHeadlineVideoSubtitle =>
      'Je kunt alleen Video kopen, of Pro kiezen om alles te ontgrendelen.';

  @override
  String get subscriptionHeadlineLightSubtitle =>
      'Je kunt alleen Licht kopen, of Pro kiezen om alles te ontgrendelen.';

  @override
  String get subscriptionHeadlineLaserSubtitle =>
      'Je kunt alleen Laser kopen, of Pro kiezen om alles te ontgrendelen.';

  @override
  String get subscriptionHeadlineConsoleSubtitle =>
      'Je kunt alleen Console kopen, of Pro kiezen om alles te ontgrendelen.';

  @override
  String get subscriptionHeadlineProSubtitle =>
      'Volledige toegang tot alle geavanceerde onderdelen.';

  @override
  String get subscriptionStoreUnavailable =>
      'Winkel momenteel niet beschikbaar.';

  @override
  String get subscriptionLoadError => 'Kan abonnementen niet laden.';

  @override
  String get subscriptionRestorePurchases => 'Mijn aankopen herstellen';

  @override
  String get subscriptionPrivacy => 'Privacy';

  @override
  String get subscriptionTerms => 'Voorwaarden';

  @override
  String get subscriptionBestValue => 'BESTE KEUZE';

  @override
  String get subscriptionOwned => 'Gekocht';

  @override
  String get subscriptionIncludedInPro => 'In Pro inbegrepen';

  @override
  String get subscriptionProductUnavailable => 'Product niet beschikbaar.';

  @override
  String get subscriptionSubscribeAll => 'Abonneren — Alles ontgrendelen';

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
  String get subscriptionCategoryConsoleTitle => 'Console';

  @override
  String get subscriptionCategoryProTitle => 'ShowTech Tools Pro';

  @override
  String get subscriptionCategoryVideoDescription =>
      'Toegang tot de sectie Video.';

  @override
  String get subscriptionCategoryLightDescription =>
      'Toegang tot de sectie Licht.';

  @override
  String get subscriptionCategoryLaserDescription =>
      'Toegang tot de sectie Laser.';

  @override
  String get subscriptionCategoryConsoleDescription =>
      'Toegang tot de sectie Console.';

  @override
  String get subscriptionCategoryProDescription =>
      'Volledige toegang tot alle secties.';

  @override
  String get electricityFreeSection => 'Gratis';

  @override
  String get electricityProSection => 'Elektriciteit-abonnement';

  @override
  String get riggingFreeSection => 'Gratis';

  @override
  String get riggingProSection => 'Rigging-abonnement';

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
      'Indicatief resultaat. Controleer altijd de feitelijke CMU/WLL, veiligheidsfactoren en toepasselijke regels.';

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
}
