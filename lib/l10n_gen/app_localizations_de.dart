// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get aboutArtNetSubtitle =>
      'DMX-Universum über Ethernet/UDP, Nodes, Broadcast vs. Unicast.\nReale Grenzen, Netzwerkstabilität, RDM je nach Hardware.';

  @override
  String get aboutArtNetTitle =>
      'Art-Net - DMX über IP (Knoten, Unicast/Broadcast)';

  @override
  String get aboutCablingFiberSubtitle =>
      'Cat5e→Cat8, OM3/OM4/OS2-Faser, LC/SC/MPO, typische Entfernungen, Best Practices zeigen.';

  @override
  String get aboutCablingFiberTitle =>
      'Netzwerk - RJ45 / Glasfaser / Geschwindigkeiten & Längen';

  @override
  String get aboutComputingSubtitle =>
      'Nützliche Datenmengen, Versionen, tatsächliche Grenzen, Marketingfallen.';

  @override
  String get aboutComputingTitle =>
      'Computer - USB / HDMI / DP / SATA / NVMe...';

  @override
  String get aboutDmxSubtitle =>
      'Universum, Adressen, Frames, RS-485-Verkabelung, Terminierung, Feldfehler.\nEnthält Diagramme + Checkliste.';

  @override
  String get aboutDmxTitle => 'DMX';

  @override
  String get aboutElectricitySubtitle =>
      'Steckverbinder, Mono/Tri, schnelle kW-Schalttafeln (16A→400A), Feldfallen.';

  @override
  String get aboutElectricityTitle => 'Elektrisch - Schuko / P17 / Stärken';

  @override
  String get aboutIpBasicsSubtitle =>
      'IP, Maske, Gateway, DHCP vs. statisch verstehen.\nKonkrete Beispiele (2.x, 10.x, 192.168.x) + Checkliste.';

  @override
  String get aboutIpBasicsTitle => 'IP-Grundlagen';

  @override
  String get aboutLightNetworkSubtitle =>
      'Einfache und robuste Architektur für Art-Net/sACN.\nVLAN, IGMP snooping/querier, Wi-Fi (Jitter), Switches, Schemata + Checkliste.';

  @override
  String get aboutLightNetworkTitle =>
      'Netzwerklicht - VLAN, IGMP, Wi-Fi vs. kabelgebunden';

  @override
  String get aboutSacnSubtitle =>
      'Netzwerkorientierter DMX-over-IP-Standard für \"Profis\".\nMulticast/Unicast, IGMP snooping/querier, Multi-Source-Prioritäten.';

  @override
  String get aboutSacnTitle => 'sACN';

  @override
  String get aboutVideoSubtitle =>
      'Auswahl nach Latenz, Zuverlässigkeit, Verkabelung, LAN vs. WAN.\nTabellen + Schema.';

  @override
  String get aboutVideoTitle => 'Video';

  @override
  String get appTitle => 'Meine Tech App';

  @override
  String catalogDmxModeItem(Object channels, Object name) {
    return '$name - $channels Kanäle';
  }

  @override
  String catalogDmxModeTitle(Object count) {
    return 'DMX-Modus ($count)';
  }

  @override
  String get catalogInfoDmxChannels => 'DMX-Kanäle';

  @override
  String get catalogInfoLuminousFlux => 'Lichtstrom';

  @override
  String get catalogInfoPower => 'Leistung';

  @override
  String get catalogInfoWeight => 'Gewicht';

  @override
  String catalogLastUpdate(Object date) {
    return 'Letzte Aktualisierung : $date';
  }

  @override
  String catalogManufacturerTitle(Object count) {
    return 'Konstrukteur ($count)';
  }

  @override
  String catalogModelTitle(Object count) {
    return 'Modell ($count)';
  }

  @override
  String get catalogNotProvided => 'Nicht angegeben';

  @override
  String get catalogOpenDmxChart => 'DMX-Tabelle öffnen';

  @override
  String get catalogOpenManual => 'Handbuch öffnen';

  @override
  String get catalogResetTooltip => 'Zurücksetzen';

  @override
  String catalogSyncError(Object message) {
    return 'Fehler: $message';
  }

  @override
  String catalogSyncFailed(Object reason) {
    return 'Synchronisierung fehlgeschlagen: $reason';
  }

  @override
  String get catalogSyncFailedUnknown =>
      'Die Synchronisierung ist fehlgeschlagen (Grund unbekannt).';

  @override
  String catalogTypeTitle(Object count) {
    return 'Typ ($count)';
  }

  @override
  String get catalogUpdateTooltip => 'Aktualisieren';

  @override
  String get catalogUpdated => 'Aktualisierter Katalog.';

  @override
  String get commonCalculate => 'Berechnen';

  @override
  String get commonCancel => 'Abbrechen';

  @override
  String get commonCopyResultTooltip => 'Ergebnis kopieren';

  @override
  String get commonDash => '-';

  @override
  String get commonNone => 'Keine Aufzeichnungen';

  @override
  String get commonOk => 'OK';

  @override
  String get commonOkWithCheck => 'OK ✅.';

  @override
  String get commonRename => 'Umbenennen';

  @override
  String get commonReset => 'Reset';

  @override
  String get commonSave => 'Registrieren';

  @override
  String get commonSearch => 'Suche';

  @override
  String get commonTooLowWithCross => 'Zu niedrig ❌.';

  @override
  String get commonUnitMeter => 'm';

  @override
  String get consentsReset => 'Zustimmungen zurückgesetzt.';

  @override
  String get dipSwitchAddressHint => 'Bsp: 1 bis 512';

  @override
  String get dipSwitchAddressLabel => 'DMX-Adresse';

  @override
  String get dipSwitchChannelUnit => 'Kanal';

  @override
  String get dipSwitchEndOfUniverseWarning =>
      'Achtung: Ende des DMX-Universums erreicht.';

  @override
  String get dipSwitchInputsTitle => 'Einträge';

  @override
  String get dipSwitchIntervalHint => 'Bsp: 4 (Kanäle)';

  @override
  String get dipSwitchIntervalLabel => 'Intervall';

  @override
  String get dipSwitchModeAddressDirect => 'Direkte Adresse';

  @override
  String get dipSwitchModeAddressMinusOne => 'Adresse - 1';

  @override
  String get dipSwitchNextAddressButton => 'Nächste Adresse';

  @override
  String get dipSwitchOffLabel => 'OFF';

  @override
  String get dipSwitchOnLabel => 'ON';

  @override
  String get dipSwitchResetTooltip => 'Zurücksetzen';

  @override
  String dipSwitchResultAddressLine(Object address) {
    return 'Adresse: $address';
  }

  @override
  String get dipSwitchResultAddressNotProvided => 'Adresse nicht ausgefüllt';

  @override
  String dipSwitchResultBinaryValueLine(Object binary) {
    return 'Binär : $binary';
  }

  @override
  String get dipSwitchResultHeader => 'Ergebnis';

  @override
  String dipSwitchResultIntervalLine(Object end, Object start) {
    return 'Intervall: $start → $end';
  }

  @override
  String dipSwitchResultModeLine(Object mode) {
    return 'Modus: $mode';
  }

  @override
  String get dipSwitchScrollHint =>
      'Scrolle nach unten, um alle Switches zu sehen.';

  @override
  String get dipSwitchSectionTitle => 'Switches';

  @override
  String get dipSwitchSummaryTitle => 'Zusammenfassung';

  @override
  String dipSwitchSwitchLabel(Object index) {
    return 'Switch $index';
  }

  @override
  String get dipSwitchUseAddressMinusOneLabel =>
      'Den Adressmodus verwenden - 1';

  @override
  String get disclaimerAccept => 'Ich stimme zu';

  @override
  String get disclaimerCertify =>
      'Ich bestätige, dass ich diese Bedingungen gelesen habe und ihnen zustimme.';

  @override
  String get disclaimerText =>
      'VERWENDUNG NUR ZU INFORMATIONSZWECKEN\n\nDie von dieser Anwendung bereitgestellten Berechnungen (Video, Licht, Laser) dienen nur zu Informations- und Anschauungszwecken.\nSie ersetzen in keinem Fall :\n- zertifizierte Berechnungen,\n- technische Studien,\n- die geltenden offiziellen Normen,\n- noch die Validierung durch einen qualifizierten Fachmann.\n\nHAFTUNG\nDer Herausgeber dieser Anwendung haftet nicht für Rechenfehler, Auslassungen, Sachschäden,\nPersonenunfällen oder für Vorfälle, die bei der Installation, dem Betrieb oder der Nutzung der Geräte auftreten.\n\nVIDEO & PROJEKTION\nDie Ergebnisse (Größen, Verhältnisse, Helligkeit, Overlaps usw.) beruhen auf theoretischen Modellen und können variieren nach :\nOptik, Zoom, Gleichmäßigkeit, Lichtumgebung, Medium, Einstellungen usw.\nÜberprüfen Sie dies immer mit den offiziellen Herstellerdokumentationen.\n\nLICHT\nDie Berechnungen sind Richtwerte und berücksichtigen nicht alle tatsächlichen Bedingungen (Toleranzen, optische Verluste,\nVerschlechterung der Lichtquellen, lokale Normen, Umgebungsbedingungen...).\n\nLASER - SICHERHEIT\nDie NOHD-, SZED- und CZED-Berechnungen basieren auf Standardannahmen und theoretischen Schwellenwerten.\nSie berücksichtigen insbesondere nicht :\n- optische Instrumente (Ferngläser, Kameras, Teleskope ...),\n- atmosphärische Bedingungen (Nebel, Regen, Staub...),\n- Unerwartete Reflexionen, zweckentfremdete Nutzung, spezielle Einstellungen.\nDie Verwendung eines Lasersystems setzt die direkte Verantwortung des Bedieners und eine angemessene Risikoanalyse voraus.\n\nRISIKOAKZEPTANZ\nDurch die Nutzung dieser Anwendung erkennt der Nutzer an :\n- Die geltenden Sicherheitsvorschriften zur Kenntnis genommen zu haben,\n- allein für seine Installationen verantwortlich zu sein,\n- die volle Verantwortung für die Risiken zu übernehmen, die mit der Nutzung der Geräte (Video, Licht, Laser) verbunden sind,\n- die Daten systematisch mit den offiziellen Herstellerhandbüchern zu überprüfen.';

  @override
  String get disclaimerTitle => '⚠️ RECHTLICHER HINWEIS & HAFTUNGSAUSSCHLUSS';

  @override
  String get homeLaserSubtitle =>
      'Berechnungen und Lasersicherheit (Zustimmung bei jedem Eintrag erforderlich).';

  @override
  String get homeLaserTitle => 'Laser';

  @override
  String get homeLightSubtitle =>
      'Projektionsgröße, DMX-Dip-Switch, Photometrie, Katalog, DMX-Patch.';

  @override
  String get homeLightTitle => 'Licht';

  @override
  String get homeReferencesSubtitle =>
      'DMX / Netzwerk / Video: Datenblätter & Feldmarkierungen.';

  @override
  String get homeReferencesTitle => 'Referenzen';

  @override
  String get homeTitle => 'Startseite';

  @override
  String get homeVideoSubtitle =>
      'Linse & Messung, Helligkeit, Multiprojektor, LEDs und Testbilder.';

  @override
  String get homeVideoTitle => 'Video';

  @override
  String get language => 'Sprache';

  @override
  String get languageSystem => 'System (automatisch)';

  @override
  String get languageSystemCurrent => 'Sprache des Telefons';

  @override
  String get laserAdviceFullPower => 'Volle Leistung erlaubt (100 %)';

  @override
  String laserAdviceMaxRecommended(Object percent) {
    return 'Empfohlene maximale Leistung : $percent';
  }

  @override
  String get laserConsentCheckboxLabel =>
      'Ich akzeptiere und verstehe die Risiken.';

  @override
  String get laserConsentContinue => 'Weiter';

  @override
  String get laserConsentText =>
      'ZUGANG ZUM LASERTEIL\n\nDer LASER-Teil dieser Anwendung bezieht sich auf Sicherheitsberechnungen (z. B. NOHD, SZED, CZED).\nDiese Berechnungen sind indikativ und ersetzen nicht :\n- eine Risikoanalyse,\n- die geltenden Normen,\n- die Betriebsverfahren,\n- noch die Validierung durch eine qualifizierte Person.\n\nWICHTIG\n- Gefahr von Augen-/Hautverletzungen bei unsachgemäßer Verwendung.\n- Die Berechnung kann falsch sein, wenn die eingegebenen Parameter unvollständig oder fehlerhaft sind oder wenn der tatsächliche Kontext abweicht (Optik,\n  atmosphärische Bedingungen, Reflexionen, Ausrichtung usw.).\n- Der Bediener ist allein für die Installation, den Betrieb und die Einhaltung der Vorschriften verantwortlich.\n\nMit der Validierung bestätigen Sie :\n- die Risiken zu verstehen,\n- die geltenden Sicherheitsvorschriften einzuhalten,\n- die volle Verantwortung im Falle von Fahrlässigkeit oder Missbrauch zu übernehmen.';

  @override
  String get laserConsentTitle => '🔴 LASER-ZUSTIMMUNG (ERFORDERLICH)';

  @override
  String get laserDiameterHint => 'ex: 3.0';

  @override
  String get laserDiameterLabel => 'Durchmesser der Ausgabe (mm)';

  @override
  String get laserDisclaimerShort =>
      'Berechnung als Anhaltspunkt. Ersetzt nicht eine Lasersicherheitsanalyse.';

  @override
  String get laserDivergenceHint => 'ex: 1.2';

  @override
  String get laserDivergenceLabel => 'Divergenz (mrad)';

  @override
  String get laserInputsTitle => 'Einträge';

  @override
  String get laserInvalidInputs =>
      'Bitte geben Sie eine gültige Potenz, Divergenz und einen gültigen Durchmesser ein.';

  @override
  String get laserNameUpdated => 'Name aktualisiert.';

  @override
  String get laserNormativeParamsBody =>
      'MPE für die Nennentfernung zur Augengefährdung (NOHD): 25,4 W/m².\n(Standard IEC 60825-1, Ausgabe 3.0)\n\nMPE für die Expositionsdistanz des empfindlichen Bereichs (SZED): 1 W/m².\n(ANSI-Norm Z136.6)\n\nMPE für den Expositionsabstand des kritischen Bereichs (CZED): 0,05 W/m².\n(ANSI-Norm Z136.6)';

  @override
  String get laserNormativeParamsTitle => 'Ausgewählte Sicherheitsparameter';

  @override
  String get laserPowerHint => 'z.B.: 5000';

  @override
  String get laserPowerLabel => 'Leistung (mW)';

  @override
  String get laserPresetAdded => 'Aufnahme hinzugefügt.';

  @override
  String get laserPresetDeleted => 'Gelöschter Datensatz.';

  @override
  String laserPresetSubtitle(Object diam, Object div, Object p) {
    return 'P: $p mW - Div: $div mrad - Ø: $diam mm';
  }

  @override
  String get laserProjectorNameLabel => 'Name des Projektors';

  @override
  String get laserRenameProjectorTitle => 'Den Projektor umbenennen';

  @override
  String get laserSafetyResultsTitle => 'Sicherheitsergebnisse';

  @override
  String get laserSaveCurrentProjector => 'Diesen Projektor registrieren';

  @override
  String get laserSaveProjectorTitle => 'Einen Projektor registrieren';

  @override
  String get laserSavedProjectorsTitle => 'Registrierte Scheinwerfer';

  @override
  String get laserSearchHint => 'z.B.: \"RGB 5W\"';

  @override
  String get laserTargetDistanceHint => 'z.B.: 10';

  @override
  String get laserTargetDistanceLabel => 'Zielentfernung (m)';

  @override
  String get laserZoneCzedDesc => 'Kritischer Bereich';

  @override
  String get laserZoneNohdDesc => 'Gefahr für die Augen';

  @override
  String get laserZoneSzedDesc => 'Empfindlicher Bereich';

  @override
  String get legalNotices => 'Rechtliche Hinweise';

  @override
  String get lightCatalogDescription =>
      'Auswahl nach Hersteller, Typ und Produkt, mit Informationen und Handbuch.';

  @override
  String get lightCatalogTitle => 'Katalog';

  @override
  String get lightDisclaimerShort =>
      'Werkzeuge, die als Richtwerte gelten. Überprüfe immer die Herstellerdokumentation.';

  @override
  String get lightDmxSwitchDescription =>
      'Indikative Konvertierung zwischen DMX-Adresse und Schaltern, mit Intervallnavigation.';

  @override
  String get lightDmxSwitchTitle => 'Dip-Switch DMX';

  @override
  String get lightPatchDescription =>
      'Importieren und Betrachten einer MVR-Datei.';

  @override
  String get lightPatchTitle => 'DMX-Patch';

  @override
  String get lightPhotometryDescription =>
      'Indikative Umrechnungen zwischen Lux, Candela und Lumen, mit Abstand und Winkel.';

  @override
  String get lightPhotometryTitle => 'Photometrie';

  @override
  String get lightProjectionDescription =>
      'Indikative Berechnung der Fleckgröße anhand von Winkel, Entfernung und Durchmesser.';

  @override
  String get lightProjectionTitle => 'Projektionsgröße';

  @override
  String get menuTitle => 'Menü';

  @override
  String get mireBlendLabel => 'BLEND';

  @override
  String get mireDash => '-';

  @override
  String get mireErrInvalidOverlap => '❌ Ungültiger Overlap (0 bis 99.9).';

  @override
  String get mireErrInvalidProjectors =>
      '❌ Ungültige Anzahl von Scheinwerfern (N > 0).';

  @override
  String get mireErrInvalidWHpx => '❌ Ungültige Breite/Höhe (px).';

  @override
  String get mireExportPng => 'PNG exportieren';

  @override
  String get mireHeightPxHint => 'z.B.: 1080';

  @override
  String get mireHeightPxHintMapping => 'z.B.: 2160';

  @override
  String get mireHeightPxLabel => 'Höhe (px)';

  @override
  String get mireLedErrTileCm => '❌ Informiert Tile cm (Breite/Höhe >0).';

  @override
  String get mireLedErrTilePx => '❌ Informiert Tile px (Breite/Höhe >0).';

  @override
  String get mireLedErrTilesXY => '❌ Informiert Tiles X/Y (>0).';

  @override
  String get mireLedParamsTitle => 'Einstellungen für LED-Wand';

  @override
  String mireLedPitchComputed(Object pitch) {
    return 'Berechnete Tonhöhe (Pitch): $pitch';
  }

  @override
  String get mireLedSubtitleColorBars => 'Barren + Rampen + Kreise';

  @override
  String get mireLedSubtitleGridLabels => 'Raster + Markierungen + Kreise';

  @override
  String get mireLedSubtitlePixelPerfect => 'Pixel perfect + Kreise';

  @override
  String get mireLedSubtitleUniformity => 'Einheitlichkeit + Kreise';

  @override
  String get mireLedTileHcmLabel => 'Tile Höhe (cm)';

  @override
  String get mireLedTileHpxLabel => 'Tile Höhe (px)';

  @override
  String get mireLedTileWcmLabel => 'Tile Breite (cm)';

  @override
  String get mireLedTileWpxLabel => 'Tile Breite (px)';

  @override
  String get mireLedTilesIdTitle => 'LED / ID TILES';

  @override
  String get mireLedTilesXLabel => 'Horizontale Tiles (X)';

  @override
  String get mireLedTilesYLabel => 'Vertikale Fliesen (Y)';

  @override
  String get mireLedTitle => 'LED / MIR';

  @override
  String get mireLedTypeColorBars => 'Barren + Rampen + Kreise';

  @override
  String get mireLedTypeGridLabels => 'Raster + Markierungen + Kreise';

  @override
  String get mireLedTypePixelPerfect => 'Pixel perfect + Kreise';

  @override
  String get mireLedTypeTilesId => 'Tiles ID (Nummer + Farben)';

  @override
  String get mireLedTypeUniformity => 'Einheitlichkeit + Kreise';

  @override
  String mireLedWallResolution(Object h, Object w) {
    return 'Auflösung Wand: $w × $h px';
  }

  @override
  String get mireLedWarnPitchOutOfRange =>
      '⚠️ Berechneter Pitch außerhalb des Bereichs (0,5-20 mm). Überprüft Tile cm / px.';

  @override
  String get mireLedWarnPitchXNotY =>
      '⚠️ Pitch X ≠ Pitch Y (ungleichmäßige Kachel). Überprüfe die Maße cm und px.';

  @override
  String get mireMappingSectionTitle => 'Multi-Projektor-Mapping-Mire';

  @override
  String mireMappingSubtitlePattern(Object n, Object orient, Object percent) {
    return 'N=$n - Overlap $percent% - $orient';
  }

  @override
  String get mireMappingTypeBlendRamps => 'Blend ramps';

  @override
  String get mireMappingTypeCombo => 'Combo (Zonen + Overlap + Blend)';

  @override
  String get mireMappingTypeLabel => 'Typ Mapping';

  @override
  String get mireMappingTypeZonesOverlap => 'Zonen + Overlap';

  @override
  String get mireOrientationHorizontal => 'Horizontal';

  @override
  String get mireOrientationLabel => 'Orientierung';

  @override
  String get mireOrientationVertical => 'Vertikal';

  @override
  String get mireOverlapHint => 'z.B.: 10.0';

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
  String get mireProjectorsNLabel => 'Anzahl der Projektoren (N)';

  @override
  String get mireSimpleSectionTitle => 'Einfaches Bildschirmtestbild';

  @override
  String get mireSimpleSubtitleCheckerboard => 'Schachbrettmuster + Kreise';

  @override
  String get mireSimpleSubtitleColorBars => 'Barren + Rampen + Kreise';

  @override
  String get mireSimpleSubtitleComboAll =>
      'Raster + Safe + 2 zentrierte Balken + Kreise';

  @override
  String get mireSimpleSubtitleGridSafe => 'Raster + Safe + Kreise';

  @override
  String get mireSimpleSubtitleUniformity => 'Einheitlichkeit + Kreise';

  @override
  String get mireSimpleTypeCheckerboard => 'Schachbrett + Kreise';

  @override
  String get mireSimpleTypeColorBars => 'Barren + Rampen + Kreise';

  @override
  String get mireSimpleTypeComboAll =>
      'Combo (Gitter + Kreise + 2 zentrierte Balken)';

  @override
  String get mireSimpleTypeGridSafe => 'Raster + Safe + Kreise';

  @override
  String get mireSimpleTypeUniformity => 'Einheitlichkeit + Kreise';

  @override
  String get mireTileMissingPx => 'Gibt Tile (px) für die Nummerierung an.';

  @override
  String mireTilesSubtitleBase(Object nx, Object ny, Object th, Object tw) {
    return 'Tile ${tw}x$th px - Rost $nx x $ny';
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
    return 'Fliese $wcm×$hcm cm';
  }

  @override
  String mireTilesSubtitleWallPhys(Object hm, Object wm) {
    return 'Wand ~ $wm×$hm m';
  }

  @override
  String get mireTypeLabel => 'Art des Testbildes';

  @override
  String get mireVideoComboTitle => 'VIDEO / COMBO MIRE';

  @override
  String get mireVideoMappingSectionTitle => 'Multi-Projektor-Mapping-Mire';

  @override
  String get mireVideoMappingTitle => 'VIDEO / MIRE MAPPING';

  @override
  String get mireVideoSimpleSectionTitle => 'Einfaches Bildschirmtestbild';

  @override
  String get mireVideoSimpleTitle => 'VIDEO / EINFACHES TESTBILD';

  @override
  String get mireVideoTypeCheckerboard => 'Schachbrett + Kreise';

  @override
  String get mireVideoTypeColorBars => 'Barren + Rampen + Kreise';

  @override
  String get mireVideoTypeCombo =>
      'Combo (Gitter + Kreise + 2 zentrierte Balken)';

  @override
  String get mireVideoTypeGridSafe => 'Raster + Safe + Kreise';

  @override
  String get mireVideoTypeUniformity => 'Einheitlichkeit + Kreise';

  @override
  String get mireWallNotMultipleOfTiles => 'NICHT MEHRFACHE TILES WAND';

  @override
  String get mireWidthPxHint => 'z.B.: 1920';

  @override
  String get mireWidthPxHintMapping => 'z.B.: 3840';

  @override
  String get mireWidthPxLabel => 'Breite (px)';

  @override
  String patchAddressLabel(Object address) {
    return 'Adresse: $address';
  }

  @override
  String patchChannelsUsed(Object count) {
    return 'Verwendete Kanäle : $count / 512';
  }

  @override
  String get patchConflictError => 'Adress-Konflikt (Überschneidung).';

  @override
  String get patchConflictShort => 'Konflikt';

  @override
  String patchConflicts(Object count) {
    return 'Konflikte : $count';
  }

  @override
  String get patchEditChannelsLabel => 'Kanäle';

  @override
  String get patchEditHint => 'Überprüft den Modus und die Anzahl der Kanäle.';

  @override
  String get patchEditModeLabel => 'Modus';

  @override
  String get patchEditTitle => 'Ausgabe';

  @override
  String get patchEmptyUniverse => 'Keine Maschinen in diesem Universum.';

  @override
  String patchFixturesCount(Object count) {
    return 'Maschinen: $count';
  }

  @override
  String get patchHomeDisclaimer =>
      'Die Ergebnisse sind nur Richtwerte. Überprüfe immer mit der Konsole.';

  @override
  String get patchHomeImportMvrDescription =>
      'Analysieren Sie eine MVR-Datei und laden Sie den Patch als Referenz.';

  @override
  String get patchHomeImportMvrTitle => 'Einen MVR importieren';

  @override
  String get patchHomeTitle => 'DMX-Patch';

  @override
  String get patchHomeViewPatchDescription =>
      'Liste und Konflikte nach Universen.';

  @override
  String get patchHomeViewPatchTitle => 'Patch ansehen';

  @override
  String get patchHubOpenGridButton => 'Gitter öffnen';

  @override
  String get patchHubOpenMvrButton => 'MVR öffnen';

  @override
  String get patchHubStateEmpty => 'Keine Referenzen geladen.';

  @override
  String patchHubStateLoaded(Object count) {
    return 'Chargiert: $count univers';
  }

  @override
  String get patchHubStateTitle => 'Staat';

  @override
  String get patchHubTitle => 'Hub Patch';

  @override
  String get patchHubWorksiteBody =>
      'Importieren Sie ein MVR oder sehen Sie sich das Belegungsraster an.';

  @override
  String get patchHubWorksiteTitle => 'Baustelle';

  @override
  String get patchInvalidChannelCount => 'Ungültige Anzahl von Kanälen.';

  @override
  String get patchIssueInvalidChannelCount =>
      'Die Anzahl der Kanäle muss größer oder gleich 1 sein.';

  @override
  String get patchIssueInvalidStartAddress =>
      'Die DMX-Adresse muss zwischen 1 und 512 liegen.';

  @override
  String get patchIssueInvalidUniverse =>
      'Das Universum muss größer oder gleich 1 sein.';

  @override
  String get patchIssueRangeExceedsUniverse =>
      'Der Kanalbereich überschreitet in diesem Universum 512.';

  @override
  String get patchIssueUnknown => 'Unbekannter Fehler.';

  @override
  String get patchListTitle => 'Liste';

  @override
  String get patchManualDisabledBody =>
      'Der Patch ist schreibgeschützt, wenn eine MVR-Referenz geladen wird.';

  @override
  String get patchManualDisabledTitle => 'Deaktiviert';

  @override
  String get patchManualTitle => 'Manuelles Patch';

  @override
  String patchModeLabel(Object mode) {
    return 'Modus: $mode';
  }

  @override
  String get patchMvrButtonAnalyzing => 'Analyse...';

  @override
  String get patchMvrButtonLoadAsReference => 'Als Referenz laden';

  @override
  String get patchMvrButtonPickFile => 'Wählen Sie eine Datei';

  @override
  String get patchMvrClearTooltip => 'Löschen';

  @override
  String get patchMvrColAddress => 'Adresse';

  @override
  String get patchMvrColChannels => 'Kanäle';

  @override
  String get patchMvrColId => 'ID';

  @override
  String get patchMvrColName => 'Name';

  @override
  String get patchMvrColUniverse => 'Universum';

  @override
  String get patchMvrColumnsHint =>
      'Spalten: ID, Name, Universum, Adresse, Channels';

  @override
  String get patchMvrFileCardHelp =>
      'Wählt eine .mvr-Datei (ZIP) aus, um den Patch zu analysieren.';

  @override
  String get patchMvrFileCardTitle => 'Datei';

  @override
  String get patchMvrFilterAllUniverses => 'Alle Universen';

  @override
  String get patchMvrFilterUniverseLabel => 'Nach Universum filtern';

  @override
  String get patchMvrModeNotProvided => 'Nicht ausgefüllter Modus';

  @override
  String get patchMvrOrderAsc => 'Halbmond';

  @override
  String get patchMvrOrderDesc => 'Absteigend';

  @override
  String get patchMvrOrderLabel => 'Befehl';

  @override
  String get patchMvrSortAddress => 'Adresse';

  @override
  String get patchMvrSortByLabel => 'Sortieren nach';

  @override
  String get patchMvrSortChannels => 'Kanäle';

  @override
  String get patchMvrSortId => 'ID';

  @override
  String get patchMvrSortName => 'Name';

  @override
  String get patchMvrSortUniverse => 'Universum';

  @override
  String get patchMvrSortUniverseThenAddress => 'Universum und dann Adresse';

  @override
  String get patchMvrStatusCleared => 'Referenz gelöscht.';

  @override
  String get patchMvrStatusEmptyBytes => 'Leere Datei.';

  @override
  String get patchMvrStatusExtractingZip => 'ZIP entpacken...';

  @override
  String patchMvrStatusFilePickFailed(Object reason) {
    return 'Dateiauswahl nicht möglich: $reason';
  }

  @override
  String patchMvrStatusFixturesFound(int count, int resolved) {
    return 'Maschinen gefunden: $count (Multichannel: $resolved).';
  }

  @override
  String get patchMvrStatusLoadingGdtf => 'GDTF laden...';

  @override
  String get patchMvrStatusNoContentToLoad => 'Keine Inhalte zu laden.';

  @override
  String get patchMvrStatusNoFileSelected => 'Keine Datei ausgewählt.';

  @override
  String get patchMvrStatusNoUsableFixtures =>
      'Es wurden keine verwertbaren Maschinen gefunden.';

  @override
  String patchMvrStatusParseError(Object message) {
    return 'Parsing-Fehler: $message';
  }

  @override
  String get patchMvrStatusParsingContent => 'Analyse des Inhalts...';

  @override
  String patchMvrStatusReferenceLoaded(int count, int skipped, int footprints) {
    return 'Referenz geladen: $count Maschine(n) (ignoriert: $skipped, GDTF-Fingerabdrücke: $footprints).';
  }

  @override
  String patchMvrStatusRestored(Object count) {
    return 'Restauration: $count Maschinen';
  }

  @override
  String get patchMvrStatusSceneXmlNotFound =>
      'scene.xml im MVR nicht gefunden.';

  @override
  String get patchMvrStatusSelectingFile => 'Auswählen der Datei...';

  @override
  String patchMvrStatusUnsupportedFile(Object ext) {
    return 'Nicht unterstützte Datei: $ext';
  }

  @override
  String get patchMvrSummaryTitle => 'Zusammenfassung';

  @override
  String get patchMvrTitle => 'Import MVR';

  @override
  String patchMvrUniverseItem(Object universe) {
    return 'Universum $universe';
  }

  @override
  String get patchPageTitle => 'Patch';

  @override
  String get patchSummaryTitle => 'Zusammenfassung';

  @override
  String get patchUniverseAppBarTitle => 'Patch';

  @override
  String patchUniverseConflictCount(Object count) {
    return 'Konflikte : $count kanal(aux)';
  }

  @override
  String get patchUniverseGridLimitedByWidth =>
      'Begrenzt durch die Breite des Bildschirms.';

  @override
  String get patchUniverseGridTitle => 'Beschäftigung (1 bis 512)';

  @override
  String patchUniverseItem(Object universe) {
    return 'Universum $universe';
  }

  @override
  String get patchUniverseLabel => 'Universum';

  @override
  String get patchUniverseLegendConflict => 'Konflikt';

  @override
  String get patchUniverseLegendFree => 'Frei';

  @override
  String get patchUniverseLegendOccupied => 'Beschäftigt';

  @override
  String patchUniverseOccupantLine(
      Object channels, Object end, Object fixture, Object mode, Object start) {
    return '- $fixture\n  $mode - $channels Kanal(e)\n  $start → $end';
  }

  @override
  String patchUniverseOccupiedCount(Object count) {
    return 'Belegt: $count / 512';
  }

  @override
  String patchUniversePopupHeader(
      Object address, Object state, Object universe) {
    return 'Universum $universe - Adresse $address.\nStaat: $state';
  }

  @override
  String get patchUniversePopupManyOccupants =>
      'Mehrere Maschinen belegen diesen Kanal.';

  @override
  String patchUniversePopupMore(Object count) {
    return '... und $count andere(s).';
  }

  @override
  String get patchUniversePopupTitleConflict => 'Konflikt';

  @override
  String get patchUniversePopupTitleFree => 'Freier Kanal';

  @override
  String get patchUniversePopupTitleOccupied => 'Kanal besetzt';

  @override
  String get patchUniverseReferenceNone => 'Keine Referenzen geladen';

  @override
  String get patchUniverseReferenceReadOnly => 'Schreibgeschützt (seit MVR)';

  @override
  String get patchUniverseReferenceTitle => 'Referenz';

  @override
  String get patchUniverseResetConfirm => 'Zurücksetzen';

  @override
  String get patchUniverseResetContent =>
      'Dies löscht den aus dem MVR geladenen Patch in der Anwendung.\nEs werden keine Daten in der Datei geändert.';

  @override
  String get patchUniverseResetTitle => 'Referenz zurücksetzen?';

  @override
  String get patchUniverseResetTooltip => 'Referenz zurücksetzen';

  @override
  String get patchUniverseSelected => 'Ausgewähltes Universum';

  @override
  String get patchUniverseStateConflict => 'Konflikt';

  @override
  String get patchUniverseStateFree => 'Frei';

  @override
  String get patchUniverseStateOccupied => 'Beschäftigt';

  @override
  String get patchUniverseTapHint =>
      'Berühre ein Kästchen, um die Details anzuzeigen.';

  @override
  String get patchUniverseUniverseDropdownLabel => 'DMX-Universum';

  @override
  String patchUniverseUniverseItem(Object universe) {
    return 'Universum $universe';
  }

  @override
  String get patchUniverseUniverseTitle => 'Universum';

  @override
  String get patchUniverseZoomIn => 'Vergrößern';

  @override
  String get patchUniverseZoomOut => 'Reduzieren';

  @override
  String get patchUniverseZoomTitle => 'Zoom';

  @override
  String get photometryBeamAngleHint2 => 'In Grad';

  @override
  String get photometryBeamAngleHint3 => 'In Grad';

  @override
  String get photometryBeamAngleLabel => 'Strahlwinkel';

  @override
  String get photometryCandelaHint1 => 'Geben Sie einen Wert in cd ein';

  @override
  String get photometryCandelaHint2 => 'Geben Sie einen Wert in cd ein';

  @override
  String get photometryCandelaLabel => 'Candela';

  @override
  String get photometryDisclaimerShort =>
      'Nur als Hinweis zu verstehen. Prüfe anhand der Herstellerdokumentation.';

  @override
  String get photometryDistanceHint1 => 'In Metern';

  @override
  String get photometryDistanceHint3 => 'In Metern';

  @override
  String get photometryDistanceLabel => 'Entfernung';

  @override
  String get photometryLumensHint2 => 'Geben Sie einen Wert in lm ein';

  @override
  String get photometryLumensHint3 => 'Geben Sie einen Wert in lm ein';

  @override
  String get photometryLumensLabel => 'Lumen';

  @override
  String get photometryLuxHint => 'Geben Sie einen Wert in Lux ein';

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
    return 'Bei $distance m, $candela cd ≈ $lux lux.';
  }

  @override
  String photometrySummary2(Object distance, Object lumens, Object lux) {
    return 'Bei $distance m, $lumens lm ≈ $lux lux (ca.).';
  }

  @override
  String photometrySummary3(
      String lumens, String distance, String angle, String lux) {
    return 'Lumen: $lumens lm - Entfernung : $distance m - Winkel: $angle° - Lux : $lux lx.';
  }

  @override
  String get projectionAngleHint => 'In Grad';

  @override
  String get projectionAngleLabel => 'Winkel';

  @override
  String get projectionAutoHelp => 'Auto: Berechnet den fehlenden Wert.';

  @override
  String projectionConeAngle(Object angle) {
    return 'Winkel: $angle°';
  }

  @override
  String projectionConeDiameter(Object diameter) {
    return 'Durchmesser : $diameter m';
  }

  @override
  String projectionConeDistance(Object distance) {
    return 'Entfernung : $distance m';
  }

  @override
  String projectionDetailAngle(Object angle) {
    return 'Winkel: $angle°';
  }

  @override
  String projectionDetailDiameter(Object diameter) {
    return 'Durchmesser : $diameter m';
  }

  @override
  String projectionDetailDistance(Object distance) {
    return 'Entfernung : $distance m';
  }

  @override
  String get projectionDiameterHint => 'In Metern';

  @override
  String get projectionDiameterLabel => 'Durchmesser';

  @override
  String get projectionDistanceHint => 'In Metern';

  @override
  String get projectionDistanceLabel => 'Entfernung';

  @override
  String get projectionHeaderAutoActive => 'Auto aktiv';

  @override
  String get projectionHeaderNeedTwoValues =>
      'Füllen Sie mindestens zwei Werte aus.';

  @override
  String get projectionInputsTitle => 'Einträge';

  @override
  String get projectionResultsTitle => 'Ergebnisse';

  @override
  String get resetConsents => 'Zustimmungen zurücksetzen';

  @override
  String get settings => 'Einstellungen';

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
    return 'Format: $format\nFläche: $area m².\nLux (lm/m²): $lux\nLux eq (Gewinn): $luxEq\nLeuchtdichte: $nits nits | $fl ft-L\nMin. Schwelle ($presetLabel): $minFl ft-L → $status.\nAnmerkung: Indikative Schätzung (Lambert).';
  }

  @override
  String get videoBrightnessSectionTitle => 'Lux / nits / ft-L + Schwellenwert';

  @override
  String get videoBrightnessSubtitle => 'Lux / nits / ft-L + Schwellenwert';

  @override
  String get videoBrightnessTitle => 'Helligkeit';

  @override
  String get videoCalc1ErrMissing => '❌ Fehlende Daten: Abstand + Breite.';

  @override
  String videoCalc1Ok(Object ratio) {
    return '✅ Projektionsverhältnis = $ratio';
  }

  @override
  String get videoCalc1Title => 'Ratio (Abstand / Breite)';

  @override
  String get videoCalc2ErrMissing =>
      '❌ Fehlende Daten: Entfernung + Verhältnis.';

  @override
  String videoCalc2Ok(Object width) {
    return '✅ Bildbreite = $width m';
  }

  @override
  String get videoCalc2Title => 'Breite (Abstand / Verhältnis)';

  @override
  String get videoCalc3ErrMissingWidth => '❌ Angabe fehlt: Breite.';

  @override
  String videoCalc3Ok(Object format, Object height) {
    return '✅ Höhe = $height m (Format $format)';
  }

  @override
  String get videoCalc3Title => 'Höhe (Breite + Format)';

  @override
  String get videoCalc4ErrGt0 => '❌ Lumen/Gewinn/Breite müssen > 0 sein.';

  @override
  String get videoCalc4ErrMissing =>
      '❌ Fehlende Daten: Lumen + Verstärkung + Breite.';

  @override
  String get videoCalc4ErrMissingSimple =>
      '❌ Fehlende Daten: Breite + Lumen + Verstärkung.';

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
    return 'Fläche: $area m² (Format $format)\nLux (lm/m²): ${lux}__\nLux eq (Gewinn): $luxEq\nLeuchtdichte: $nits nits | $fl ft-L\nMin. Schwelle ($presetLabel): $minFl ft-L → $status.\nHinweis: Die Umrechnung von nits/ft-L basiert auf einer Lambertschen Annahme (approx).';
  }

  @override
  String get videoCalc4Title =>
      'Helligkeit (Lux / Nits / ft-L + Schwellenwert)';

  @override
  String get videoCalc5ErrMissing =>
      '❌ Fehlende Daten: Gesamtbreite + Overlap% + Anzahl der Projektoren.';

  @override
  String get videoCalc5ErrNMin2 =>
      '❌ Die Anzahl der Scheinwerfer muss ≥ 2 betragen.';

  @override
  String get videoCalc5NHint => 'ex: 2';

  @override
  String get videoCalc5NLabel => 'Anzahl der Projektoren (N)';

  @override
  String videoCalc5Result(Object format, Object hTot, Object n, Object overlapM,
      Object overlapPct, Object wPer, Object wTot) {
    return 'Gesamtbreite: $wTot m\nN: $n | Overlap: $overlapPct% (auf Projo-Breite)\n\n- Breite pro Projektor: $wPer m\n- Overlap zwischen zwei Projektoren: $overlapM m\n- Gesamthöhe (Format $format): $hTot m';
  }

  @override
  String get videoCalc5Title => 'Overlap (Gesamtbreite + N)';

  @override
  String get videoCalc6ErrMissingBasics =>
      '❌ Fehlende Daten: Gesamtbreite + Abstand + Overlap%.';

  @override
  String get videoCalc6ErrMissingRatio =>
      '❌ Fehlende Daten: Ratio min und/oder Ratio max.';

  @override
  String get videoCalc6GainHint => 'ex: 1.0';

  @override
  String get videoCalc6GainLabel => 'Verstärkung (calc 6)';

  @override
  String get videoCalc6LumensPerProjectorHint => 'z.B.: 20000';

  @override
  String get videoCalc6LumensPerProjectorLabel => 'Lumen pro Projektor';

  @override
  String get videoCalc6LumiErrGt0 =>
      'Helligkeit: ❌ Lumen/Projo und Verstärkung müssen > 0 sein.';

  @override
  String videoCalc6LumiForN(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Geschätzte Helligkeit (N=$n)\nFläche: $area m²\nLux eq: $lux (lm/m²)\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoCalc6LumiOptional =>
      'Helligkeit (optional): Gibt Lumen/Projo + Gain für die Schätzung an.';

  @override
  String get videoCalc6NoteIndicative =>
      'Anmerkung: Unverbindliche Schätzung (tatsächlicher Blend/overlap kann sich etwas verringern).';

  @override
  String get videoCalc6RatioMaxHint => 'z.B.: 1.80';

  @override
  String get videoCalc6RatioMaxLabel => 'Max. Verhältnis';

  @override
  String get videoCalc6RatioMinHint => 'z.B.: 1.20';

  @override
  String get videoCalc6RatioMinLabel => 'Verhältnis min';

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
    return 'Gesamtbreite=$wTot m | Abstand=$distance m | Overlap=$overlapPct%.\nFormat $format → Gesamthöhe=$hTot m | Fläche=$area m²\nVerhältnis min/max: $ratioMin → $ratioMax\n\nFall Ratio offener (min) = $nMin projos | Abdeckung ≈ $covMin m\n$lumiMin\n\nFall Verhältnis enger (max) = $nMax projos | Abdeckung ≈ $covMax m\n$lumiMax\n\n$note';
  }

  @override
  String get videoCalc6Title => 'Anzahl der Projektoren Auto + Helligkeit';

  @override
  String videoCalcLabel(Object n) {
    return 'Berechnung $n';
  }

  @override
  String get videoCalculateAll => 'Alles berechnen';

  @override
  String get videoCalculationsTitle => 'Videoberechnungen';

  @override
  String get videoCommonParamsTitle => 'Gemeinsame Einstellungen';

  @override
  String videoCommonPillArea(Object value) {
    return 'Fläche: $value';
  }

  @override
  String videoCommonPillDistance(Object value) {
    return 'Entfernung: $value';
  }

  @override
  String videoCommonPillFormat(Object format) {
    return 'Format: $format';
  }

  @override
  String videoCommonPillHeight(Object value) {
    return 'Höhe: $value';
  }

  @override
  String videoCommonPillOverlap(Object value) {
    return 'Overlap: $value';
  }

  @override
  String videoCommonPillRatio(Object value) {
    return 'Verhältnis: $value';
  }

  @override
  String videoCommonPillTotalWidth(Object value) {
    return 'Gesamtbreite: $value';
  }

  @override
  String videoCommonPillWidth(Object value) {
    return 'Breite: $value';
  }

  @override
  String get videoCopyAllTooltip => 'Alle Ergebnisse kopieren';

  @override
  String get videoCopySummaryTooltip => 'Zusammenfassung kopieren';

  @override
  String get videoDisclaimerShort =>
      'Berechnungen sind nur Richtwerte. Überprüfe immer die Herstellerdokumentation.';

  @override
  String get videoDistanceHint => 'z.B.: 12.0';

  @override
  String get videoDistanceLabel => 'Projektionsentfernung (m)';

  @override
  String get videoErrImpossibleDenom =>
      '❌ Einstellungen nicht möglich (denom ≤ 0).';

  @override
  String get videoErrOverlapRange =>
      '❌ Overlap% muss zwischen 0 und 99,9 liegen.';

  @override
  String get videoErrRatioGt0 => '❌ Das Verhältnis muss > 0 sein.';

  @override
  String get videoErrTotalWidthAndDistanceGt0 =>
      '❌ Gesamtbreite und Abstand müssen > 0 sein.';

  @override
  String get videoErrTotalWidthGt0 => '❌ Gesamtbreite muss > 0 sein.';

  @override
  String get videoErrWidthGt0 => '❌ Die Breite muss > 0 sein.';

  @override
  String get videoExportPdfTooltip => 'PDF exportieren';

  @override
  String get videoFormatLabel => 'Format (Verhältnis)';

  @override
  String get videoGainHint => 'ex: 1.0';

  @override
  String get videoGainLabel => 'Gewinn';

  @override
  String get videoImageWidthHint => 'ex: 6.0';

  @override
  String get videoImageWidthLabel => 'Bildbreite (m)';

  @override
  String get videoLedCalcTitle => 'Berechnung - Pixel / tiles';

  @override
  String get videoLedErrAllGt0 => '❌ Alle Werte müssen > 0 sein.';

  @override
  String get videoLedErrMissingInputs =>
      '❌ Fehlende Daten: Tiles X/Y + Tile px + Tile cm.';

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
    return '✅ Auflösung Wand: $wallWpx × $wallHpx px\n✅ Wandgröße: $wallWm × $wallHm m\nTile: $tileWpx×$tileHpx px - $tileWcm×$tileHcm cm\nBerechneter Pitch: $pitch';
  }

  @override
  String get videoLedSubtitle =>
      'Pixel der LED-Wand nach Größe, Pitch und Kachelgröße.';

  @override
  String get videoLedTileHcmHint => 'z.B.: 33.28';

  @override
  String get videoLedTileHcmLabel => 'Tile Höhe (cm)';

  @override
  String get videoLedTileHpxHint => 'z.B.: 128';

  @override
  String get videoLedTileHpxLabel => 'Tile Höhe (px)';

  @override
  String get videoLedTileWcmHint => 'z.B.: 33.28';

  @override
  String get videoLedTileWcmLabel => 'Tile Breite (cm)';

  @override
  String get videoLedTileWpxHint => 'z.B.: 128';

  @override
  String get videoLedTileWpxLabel => 'Tile Breite (px)';

  @override
  String get videoLedTilesXHint => 'z.B.: 15';

  @override
  String get videoLedTilesXLabel => 'Horizontale Tiles (X)';

  @override
  String get videoLedTilesYHint => 'z.B.: 8';

  @override
  String get videoLedTilesYLabel => 'Vertikale Fliesen (Y)';

  @override
  String get videoLedTitle => 'LED';

  @override
  String get videoLensMeasureSubtitle =>
      'Verhältnis / Breite / Höhe (Berechnungen 1 bis 3).';

  @override
  String get videoLensMeasureTitle => 'Linse & Messung';

  @override
  String get videoLmCalc1Title => 'Ratio (Abstand / Breite)';

  @override
  String get videoLmCalc2Title => 'Breite (Abstand / Verhältnis)';

  @override
  String get videoLmCalc3Title => 'Höhe (Breite + Format)';

  @override
  String get videoLmDistanceHint => 'z.B.: 12.0';

  @override
  String get videoLmDistanceLabel => 'Projektionsentfernung (m)';

  @override
  String get videoLmErrMissingDistanceRatio =>
      '❌ Fehlende Daten : Distanz + Ratio.';

  @override
  String get videoLmErrMissingDistanceWidth =>
      '❌ Fehlende Daten: Abstand + Breite.';

  @override
  String get videoLmErrMissingWidthOnly => '❌ Fehlende Angaben : Breite.';

  @override
  String get videoLmErrRatioGt0 => '❌ Ratio muss > 0 sein.';

  @override
  String get videoLmErrWidthGt0 => '❌ Breite muss > 0 sein.';

  @override
  String get videoLmFormatLabel => 'Format (Verhältnis)';

  @override
  String get videoLmImageWidthHint => 'ex: 6.0';

  @override
  String get videoLmImageWidthLabel => 'Bildbreite (m)';

  @override
  String videoLmResultHeight(Object format, Object height) {
    return '✅ Höhe = $height m (Format $format)';
  }

  @override
  String videoLmResultRatio(Object ratio) {
    return '✅ Projektionsverhältnis = $ratio';
  }

  @override
  String videoLmResultWidth(Object width) {
    return '✅ Bildbreite = $width m';
  }

  @override
  String get videoLmThrowRatioHint => 'z.B.: 1.60';

  @override
  String get videoLmThrowRatioLabel => 'Projektionsverhältnis';

  @override
  String get videoLumensHint => 'z.B.: 20000';

  @override
  String get videoLumensLabel => 'Lumen (ANSI)';

  @override
  String get videoMireHeaderSubtitle =>
      'Indikative Testbilder (Caliper, Focus, Geometry, Blend, Pixel Perfect).';

  @override
  String get videoMireHeaderTitle => 'Mustergenerator';

  @override
  String get videoMireScreenLedSubtitle =>
      'Testbild nach WxH px (pixel perfect, uniformity, grid).';

  @override
  String get videoMireScreenLedTitle => 'Testbild LED-Bildschirm';

  @override
  String get videoMireScreenVideoSubtitle =>
      'Einfach (WxH px) + Multi-Projekt-Mapping (N + Overlap).';

  @override
  String get videoMireScreenVideoTitle => 'Testbild Videobildschirm';

  @override
  String get videoMireTitle => 'Messlatte';

  @override
  String get videoMpCalc5Title => 'Breite pro Projektor';

  @override
  String get videoMpCalc6Title => 'Anzahl der Projektoren (Verhältnis min/max)';

  @override
  String videoMpCaseOpenMin(Object coverage, Object n) {
    return 'Fall ratio offener (min) = $n projos | Abdeckung ≈ $coverage m';
  }

  @override
  String videoMpCaseTightMax(Object coverage, Object n) {
    return 'Fall engeres Verhältnis (max) = $n projos | Abdeckung ≈ $coverage m';
  }

  @override
  String get videoMpDistanceHint => 'z.B.: 12.0';

  @override
  String get videoMpDistanceLabel => 'Projektionsentfernung (m)';

  @override
  String get videoMpErrImpossibleDenom =>
      '❌ Einstellungen nicht möglich (denom ≤ 0).';

  @override
  String get videoMpErrInvalidRatio =>
      '❌ Ungültiges Verhältnis (muss > 0 sein).';

  @override
  String get videoMpErrMissing5 =>
      '❌ Fehlende Daten: Gesamtbreite + Overlap% + N.';

  @override
  String get videoMpErrMissing6Main =>
      '❌ Fehlende Daten: Gesamtbreite + Abstand + Overlap%.';

  @override
  String get videoMpErrMissingRatios =>
      '❌ Fehlende Daten : Ratio min und/oder Ratio max.';

  @override
  String get videoMpErrNGte2 => '❌ N muss ≥ 2 sein.';

  @override
  String get videoMpErrOverlapRange =>
      '❌ Overlap% muss zwischen 0 und 99,9 liegen.';

  @override
  String get videoMpErrWidthDistanceGt0 =>
      '❌ Gesamtbreite und Abstand müssen > 0 sein.';

  @override
  String get videoMpErrWidthGt0 => '❌ Gesamtbreite muss > 0 sein.';

  @override
  String get videoMpFormatLabel => 'Format (Verhältnis)';

  @override
  String get videoMpGainHint => 'ex: 1.0';

  @override
  String get videoMpGainLabel => 'Gewinn';

  @override
  String get videoMpLumensPerProjectorHint => 'z.B.: 20000';

  @override
  String get videoMpLumensPerProjectorLabel => 'Lumen pro Projektor';

  @override
  String get videoMpLumiErrLumensGainGt0 =>
      'Helligkeit: ❌ Lumen/Projo und Verstärkung müssen > 0 sein.';

  @override
  String videoMpLumiEstimated(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Geschätzte Helligkeit (N=$n)\nFläche: $area m²\nLux eq: $lux.\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoMpLumiOptionalHint =>
      'Helligkeit (optional): Gibt Lumen/Projo + Gain zum Schätzen an.';

  @override
  String get videoMpNoteIndicative => 'Anmerkung: Unverbindliche Schätzung.';

  @override
  String get videoMpOptionalLuminanceTitle => 'Optional: Helligkeit';

  @override
  String get videoMpOverlapHint => 'z.B.: 10';

  @override
  String get videoMpOverlapLabel => 'Overlap (%)';

  @override
  String get videoMpProjectorCountHint => 'ex: 2';

  @override
  String get videoMpProjectorCountLabel => 'Anzahl der Projektoren (N)';

  @override
  String get videoMpRatioMaxHint => 'z.B.: 1.80';

  @override
  String get videoMpRatioMaxLabel => 'Max. Verhältnis';

  @override
  String get videoMpRatioMinHint => 'z.B.: 1.20';

  @override
  String get videoMpRatioMinLabel => 'Verhältnis min';

  @override
  String get videoMpTotalWidthHint => 'ex: 18.0';

  @override
  String get videoMpTotalWidthLabel => 'Gesamtbreite der Projektion (m)';

  @override
  String get videoMultiprojectorSubtitle =>
      'Overlap + Breite/Projo + Anzahl der Projos (Berechnungen 5 & 6).';

  @override
  String get videoMultiprojectorTitle => 'Multiprojektor';

  @override
  String get videoOptionalBrightnessTitle => 'Optional: Helligkeit';

  @override
  String get videoOverlapHint => 'z.B.: 10';

  @override
  String get videoOverlapLabel => 'Overlap (%)';

  @override
  String get videoPdfCalc1 => 'Berechnung 1';

  @override
  String get videoPdfCalc2 => 'Berechnung 2';

  @override
  String get videoPdfCalc3 => 'Berechnung 3';

  @override
  String get videoPdfCalc4 => 'Berechnung 4';

  @override
  String get videoPdfCalc5 => 'Berechnung 5';

  @override
  String get videoPdfCalc5N => 'N (calc5)';

  @override
  String get videoPdfCalc6 => 'Berechnung 6';

  @override
  String get videoPdfCalc6Gain => 'Gewinn (calc6)';

  @override
  String get videoPdfCalc6LumensPerProj => 'Lumen/Projo (calc6)';

  @override
  String get videoPdfCalc6RatioMax => 'Ratio max (calc6)';

  @override
  String get videoPdfCalc6RatioMin => 'Verhältnis min (calc6)';

  @override
  String get videoPdfDate => 'Datum';

  @override
  String get videoPdfDistance => 'Entfernung (m)';

  @override
  String get videoPdfFormat => 'Format';

  @override
  String get videoPdfGain => 'Gewinn';

  @override
  String get videoPdfImageWidth => 'Bildbreite (m)';

  @override
  String get videoPdfLumens => 'Lumen';

  @override
  String get videoPdfOverlap => 'Overlap (%)';

  @override
  String get videoPdfParams => 'Einstellungen';

  @override
  String get videoPdfRatio => 'Verhältnis';

  @override
  String get videoPdfResults => 'Ergebnisse';

  @override
  String get videoPdfScreenPreset => 'Voreinstellung Bildschirm';

  @override
  String get videoPdfTitle => 'Meine Technik-App - Video-Export';

  @override
  String get videoPdfTotalWidth => 'Gesamtbreite (m)';

  @override
  String get videoPresetFrontGrey => 'Front - grauer Bildschirm (Gain 0.8)';

  @override
  String get videoPresetFrontGreyShort => 'Front - grauer Bildschirm';

  @override
  String get videoPresetFrontHighGain =>
      'Front - High-Gain-Bildschirm (Verstärkung 1.3)';

  @override
  String get videoPresetFrontHighGainShort => 'Front - High-Gain-Bildschirm';

  @override
  String get videoPresetFrontWhite =>
      'Front - mattweißer Bildschirm (Gain 1.0)';

  @override
  String get videoPresetFrontWhiteShort => 'Front - mattweißer Bildschirm';

  @override
  String get videoPresetMappingDarkStone =>
      'Mapping - dunkler Stein (Gewinn 0.35)';

  @override
  String get videoPresetMappingDarkStoneShort => 'Mapping - dunkler Stein';

  @override
  String get videoPresetMappingGlass => 'Mapping - Glas (Gewinn 0.15)';

  @override
  String get videoPresetMappingGlassShort => 'Mapping - Glas';

  @override
  String get videoPresetMappingLightStone =>
      'Mapping - heller Stein (gain 0.6)';

  @override
  String get videoPresetMappingLightStoneShort => 'Mapping - heller Stein';

  @override
  String get videoPresetMappingMatte => 'Mapping - matte Farbe (gain 0.75)';

  @override
  String get videoPresetMappingMatteShort => 'Mapping - matte Malerei';

  @override
  String get videoPresetMappingSatin => 'Mapping - Satinfarbe (gain 0.9)';

  @override
  String get videoPresetMappingSatinShort => 'Mapping - Satinfarbe';

  @override
  String get videoPresetRearClear => 'Retro - helle Leinwand (Verstärkung 0.9)';

  @override
  String get videoPresetRearClearShort => 'Retro - helle Leinwand';

  @override
  String get videoPresetRearDiffusion =>
      'Retro - Leinwand Diffusion (Gain 0.7)';

  @override
  String get videoPresetRearDiffusionShort => 'Retro - Leinwand Streuung';

  @override
  String get videoScreenPresetLabel => 'Bildschirm / Halterung (Preset)';

  @override
  String get videoSummaryPillsTitle => 'Zusammenfassung (Pellets)';

  @override
  String get videoTestPatternSubtitle =>
      'Erstellen von Videomuster für LED-Bildschirme und -Wände (wird später gemacht).';

  @override
  String get videoTestPatternTitle => 'Messlatte';

  @override
  String get videoThrowRatioHint => 'z.B.: 1.60';

  @override
  String get videoThrowRatioLabel => 'Projektionsverhältnis';

  @override
  String get videoTitle => 'Video';

  @override
  String get videoToolsTitle => 'Video-Tools';

  @override
  String get videoTotalWidthHint => 'ex: 18.0';

  @override
  String get videoTotalWidthLabel => 'Gesamtbreite der Projektion (m)';

  @override
  String get aboutArtnetTitle => 'Art-Net';

  @override
  String get aboutArtnetToc01 => '1) Art-Net - was ist das und warum';

  @override
  String get aboutArtnetToc02 =>
      '2) Adressierung & Universen - eigenes Mapping';

  @override
  String get aboutArtnetToc03 => '3) Limits & Perf - was zuerst kaputt geht';

  @override
  String get aboutArtnetToc04 => '4) Knoten, Splitter & RDM';

  @override
  String get aboutArtnetToc05 => '5) Fehlerbehebung - Symptome → Ursachen';

  @override
  String get aboutArtnetToc06 =>
      '6) Schemata (Netzwerk / Unicast vs. Broadcast)';

  @override
  String get aboutArtnetToc07 =>
      '6bis) Abbildungen (Assets) - RJ45/Switch/Kabel';

  @override
  String get aboutArtnetToc08 => '7) Schnelle Checkliste';

  @override
  String get aboutDmxToc01 => '1) DMX, Universen, Adressen - die Basis';

  @override
  String get aboutDmxToc02 => '2) DMX-Rahmen - Break, Startcode, Kanäle';

  @override
  String get aboutDmxToc03 => '3) RS-485-Verkabelung - Topologie & Kabel';

  @override
  String get aboutDmxToc04 =>
      '4) Terminierung & Splitter - Vermeidung von Reflexionen';

  @override
  String get aboutDmxToc05 => '4bis) RDM - Grenzen & Kompatibilitäten';

  @override
  String get aboutDmxToc06 => '5) Fehlerbehebung Feld - Symptome → Ursachen';

  @override
  String get aboutDmxToc07 => '6) Art-Net - Feldmarkierungen';

  @override
  String get aboutDmxToc08 => '7) sACN / E1.31 - Multicast, IGMP, Prioritäten';

  @override
  String get aboutDmxToc09 => '8) DMX vs. Art-Net vs. sACN - auswählen';

  @override
  String get aboutDmxToc10 => '10) Schnelle Checkliste';

  @override
  String get aboutDmxToc11 => '10) Schnelle Checkliste';

  @override
  String get aboutElectriciteTitle => 'Elektrizität';

  @override
  String get aboutElectriciteToc01 => '1) Grundlagen (W, A, V, kW)';

  @override
  String get aboutElectriciteToc02 => '2) Anschlüsse (Schuko / P17 / PowerCON)';

  @override
  String get aboutElectriciteToc03 => '3) Mono / Tri (was es ändert)';

  @override
  String get aboutElectriciteToc04 => '4) Schneller Tisch (16A → 400A)';

  @override
  String get aboutElectriciteToc05 => '5) Sicherheit & Feldfallen';

  @override
  String get aboutElectriciteToc06 => '6) Checkliste';

  @override
  String get aboutInformatiqueTitle => 'Informatik';

  @override
  String get aboutInformatiqueToc01 => '1) USB / USB-C / Thunderbolt';

  @override
  String get aboutInformatiqueToc02 => '2) Speicher (SATA / NVMe / SSD)';

  @override
  String get aboutInformatiqueToc03 => '3) Videoverbindungen (DP / HDMI)';

  @override
  String get aboutInformatiqueToc04 => '4) PCIe / GPU (Benchmarks)';

  @override
  String get aboutInformatiqueToc05 => '5) Checkliste (Tablett)';

  @override
  String get aboutIpBasicsToc01 => '1) Was ist eine IP und wozu dient sie?';

  @override
  String get aboutIpBasicsToc02 =>
      '2) Warum 192.x / 10.x / 172.x? (private Adressen)';

  @override
  String get aboutIpBasicsToc03 => '3) Masken & Subnetze: wirklich verstehen';

  @override
  String get aboutIpBasicsToc04 => '4) DHCP, Gateway, DNS: Wer macht was?';

  @override
  String get aboutIpBasicsToc05 =>
      '5) Wie zwei Geräte miteinander sprechen (LAN vs. nicht-LAN)';

  @override
  String get aboutIpBasicsToc06 =>
      '6) Einfache \"Show\"-IP-Pläne (kopierfertige Beispiele)';

  @override
  String get aboutIpBasicsToc07 =>
      '7) Fehlerbehebung: Symptome → Ursachen (Feldmethode)';

  @override
  String get aboutIpBasicsToc08 =>
      '8) Mini-Übungen (schnell eine Maske / ein Netzwerk überprüfen)';

  @override
  String get aboutIpBasicsToc09 => '9) Schnelle Checkliste';

  @override
  String get aboutNetworkTitle => 'Netzwerk (EN)';

  @override
  String get aboutNetworkToc01 => '1) Ziel: Stabiles Netzwerk';

  @override
  String get aboutNetworkToc02 => '2) IP-Plan (einfach)';

  @override
  String get aboutNetworkToc03 => '3) VLAN (Trennung)';

  @override
  String get aboutNetworkToc04 => '4) IGMP (sACN Multicast)';

  @override
  String get aboutNetworkToc05 => '5) Wi-Fi vs. kabelgebunden';

  @override
  String get aboutNetworkToc06 => '6) Switch: Was Sie brauchen';

  @override
  String get aboutNetworkToc07 => '7) Schemata';

  @override
  String get aboutNetworkToc08 => '7bis) Abbildungen (Assets)';

  @override
  String get aboutNetworkToc09 => '8) Checkliste';

  @override
  String get aboutReseauTitle => 'Netzwerk';

  @override
  String get aboutReseauToc01 => '1) Netzwerkgrundlagen (LAN / IP / Durchsatz)';

  @override
  String get aboutReseauToc02 => '2) RJ45 & Kategorien (Cat5e/6/6A/...)';

  @override
  String get aboutReseauToc03 => '3) PoE (Netzwerk-Stromversorgung)';

  @override
  String get aboutReseauToc04 => '4) Glasfaser (SM/MM) + Anschlüsse (LC/SC)';

  @override
  String get aboutReseauToc05 => '5) SFP / SFP+ / QSFP (Module)';

  @override
  String get aboutReseauToc06 => '6) Switches (VLAN / IGMP / QoS)';

  @override
  String get aboutReseauToc07 => '7) Art-Net / sACN im Netzwerk (Tipps)';

  @override
  String get aboutReseauToc08 => '8) Checkliste';

  @override
  String get aboutSacnToc01 => '1) Wozu dient sACN?';

  @override
  String get aboutSacnToc02 => '2) Universum (Nummerierung)';

  @override
  String get aboutSacnToc03 => '3) Multicast / Unicast + IGMP';

  @override
  String get aboutSacnToc04 => '4) Prioritäten (mehrere Quellen)';

  @override
  String get aboutSacnToc05 => '5) Grenzen / Perfs';

  @override
  String get aboutSacnToc06 => '6) RDM & sACN (Proxy / je nach Hardware)';

  @override
  String get aboutSacnToc07 => '7) Schemata';

  @override
  String get aboutSacnToc08 => '7bis) Abbildungen (Assets)';

  @override
  String get aboutSacnToc09 => '8) Checkliste';

  @override
  String get aboutVideoToc01 => '1) Videogrundlagen (Schlüsselwörter)';

  @override
  String get aboutVideoToc02 => '2) Auflösung & FPS';

  @override
  String get aboutVideoToc03 => '3) Farbe (4:4:4 / 4:2:2 / 10-Bit)';

  @override
  String get aboutVideoToc04 => '4) Sync (Genlock / Timecode)';

  @override
  String get aboutVideoToc05 => '5) Kabel & Entfernungen';

  @override
  String get aboutVideoToc06 => '6) SDI (3G / 6G / 12G)';

  @override
  String get aboutVideoToc07 => '7) HDMI - Grundstück';

  @override
  String get aboutVideoToc08 => '8) NDI - wann / warum / Grenzen';

  @override
  String get aboutVideoToc09 => '9) Mapping / LED / Multiprojo';

  @override
  String get aboutVideoToc10 => '10) Checkliste Feld';

  @override
  String get aboutTileDmxTitle => 'DMX - Funktionsweise (einfach & komplett)';

  @override
  String get aboutTileArtnetTitle =>
      'Art-Net - DMX über IP (Knoten, Unicast/Broadcast)';

  @override
  String get aboutTileSacnTitle =>
      'sACN / E1.31 - Multicast, IGMP, Prioritäten';

  @override
  String get aboutTileIpBasicsTitle =>
      'Netzwerk - IP-Grundlagen / Maske / DHCP (wesentlich)';

  @override
  String get aboutTileReseauTitle =>
      'Netzwerk - RJ45 / Glasfaser / Geschwindigkeiten & Längen';

  @override
  String get aboutTileNetworkTitle =>
      'Netzwerklicht - VLAN, IGMP, Wi-Fi vs. kabelgebunden';

  @override
  String get aboutTileVideoTitle => 'Video - SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutTileElectriciteTitle => 'Elektrisch - Schuko / P17 / Stärken';

  @override
  String get aboutTileElectriciteSubtitle =>
      'Steckverbinder, Mono/Tri, schnelle kW-Schalttafeln (16A→400A), Feldfallen.';

  @override
  String get aboutTileInformatiqueTitle =>
      'Computer - USB / HDMI / DP / SATA / NVMe...';

  @override
  String get aboutTileInformatiqueSubtitle =>
      'Nützliche Datenmengen, Versionen, tatsächliche Grenzen, Marketingfallen.';

  @override
  String get aboutTitle => 'Über';

  @override
  String get homeRiggingTitle => 'Rigging';

  @override
  String get homeRiggingSubtitle => 'Bridles: Winkel & Längen von Schlingen.';

  @override
  String get riggingTitle => 'Rigging';

  @override
  String get riggingAngleLengthTitle => 'Zügelwinkel & Schlingenlänge';

  @override
  String get riggingSymmetryNote =>
      'Annahme: Symmetrisches Zaumzeug (2 identische Stränge). Keine Berechnung der Belastung.';

  @override
  String get riggingInputsTitle => 'Einträge';

  @override
  String get riggingSpanLabel => 'Achsabstand (Abstand zwischen den Punkten)';

  @override
  String get riggingSpanHint => 'Ex: 2.40';

  @override
  String get riggingDropLabel => 'Pfeil (vertikaler Drop)';

  @override
  String get riggingDropHint => 'Ex: 0.60';

  @override
  String get riggingUnitMeters => 'm';

  @override
  String get riggingResultsTitle => 'Ergebnisse';

  @override
  String get riggingNeedPositiveValues => 'Informiert über Werte > 0.';

  @override
  String get riggingLegLengthLabel => 'Länge eines Strangs';

  @override
  String get riggingAngleToHorizontalLabel => 'Winkel zur Horizontalen';

  @override
  String get riggingAngleToVerticalLabel => 'Winkel zur Vertikalen';

  @override
  String get riggingDisclaimerShort =>
      'Die Ergebnisse sind unverbindlich. Muss je nach deinem Kontext und den Rigging-Praktiken validiert werden.';

  @override
  String get riggingCalcLegDropTitle => 'Länge + Pfeil → Reichweite';

  @override
  String get riggingCalcLegDropHelp =>
      'Symmetrische Schlinge (2-strängig): Berechnet die Reichweite aus der Schlingenlänge und dem Durchhang.';

  @override
  String get riggingLegLengthInputLabel => 'Länge eines Strangs';

  @override
  String get riggingLegLengthInputHint => 'Ex: 2.50';

  @override
  String get riggingInvalidTriangle =>
      'Nicht möglich: Die Länge muss größer sein als der Pfeil.';

  @override
  String get riggingCalcLegAngleTitle => 'Länge + Winkel → Spannweite + Pfeil';

  @override
  String get riggingCalcLegAngleHelp =>
      'Symmetrische Schlinge (2-strängig): Berechnet Reichweite und Durchbiegung aus der Länge und dem Winkel zur Horizontalen.';

  @override
  String get riggingAngleHorizontalInputLabel => 'Winkel zur Horizontalen';

  @override
  String get riggingAngleHorizontalInputHint => 'Ex: 30';

  @override
  String get riggingInvalidAngle =>
      'Ungültiger Winkel: zwischen 0° und 90° (ausgeschlossen).';

  @override
  String get riggingUnitDegrees => '°';

  @override
  String get riggingCalc1Title => 'Achsabstand + Pfeil → Länge & Winkel';

  @override
  String get riggingCalc1Subtitle =>
      'Symmetrisches Zaumzeug (2 identische Stränge). Gewicht wird angezeigt (Info). Keine Berechnung der Belastung.';

  @override
  String get riggingCalc2Title => 'Achsabstand + Winkel(H) → Pfeil & Länge';

  @override
  String get riggingCalc2Subtitle =>
      'Winkel zur Horizontalen. Symmetrisches Zaumzeug. Keine Berechnung der Belastung.';

  @override
  String get riggingCalc3Title => 'Achsabstand + Länge → Pfeil & Winkel';

  @override
  String get riggingCalc3Subtitle =>
      'Länge eines Strangs bekannt. Symmetrisches Zaumzeug. Keine Berechnung der Belastung.';

  @override
  String get riggingLegLengthHint => 'Ex: 4.70';

  @override
  String get riggingAngleHint => 'Ex: 45';

  @override
  String get riggingInvalidGeometry =>
      'Unmögliche Geometrie (Länge zu kurz für den Achsabstand).';

  @override
  String get riggingSchemaTitle => 'Schema';

  @override
  String get riggingSchemaCaption1 =>
      'Eingaben: Spannweite + Durchbiegung. Ausgänge: Schlingenlänge + Winkel.';

  @override
  String get riggingSchemaCaption2 =>
      'Eingaben: Reichweite + Länge der Schlinge. Ausgaben: Durchhang + Winkel.';

  @override
  String get riggingSchemaCaption3 =>
      'Eingaben: Spannweite + Winkel (horizontal). Ausgaben: Pfeil + Länge.';

  @override
  String get riggingAngleHInputLabel => 'Winkel (von der Horizontalen)';

  @override
  String get riggingAngleHInputHint => 'Ex: 45';

  @override
  String get riggingDropResultLabel => 'Pfeil (drop)';

  @override
  String get riggingSchemaLabelSpan => 'Achsabstand';

  @override
  String get riggingSchemaLabelDrop => 'Pfeil';

  @override
  String get riggingSchemaLabelLeg => 'Brin';

  @override
  String get riggingWeightLabel => 'Gewicht (Info)';

  @override
  String get riggingUnitKg => 'kg';

  @override
  String get riggingImpossibleGeometry =>
      'Unmögliche Geometrie: Die Länge eines Strangs muss > (Achsabstand / 2) sein.';

  @override
  String get riggingDisclaimerNoLoad =>
      'Angezeigtes Gewicht dient nur zur Orientierung. Keine Berechnung der Belastung / Spannung. Gültig gemäß deinem Rigging-Kontext.';

  @override
  String get riggingCalcCommonSubtitle =>
      'Zaumzeug mit zwei Strängen. Angezeigtes Gewicht (Info). Keine Berechnung der Belastung.';

  @override
  String get riggingOffCenterToggle => 'Außermittige Belastung';

  @override
  String get riggingOffsetLabel => 'Offset A → Last';

  @override
  String get riggingInvalidOffset =>
      'Ungültiger Offset: muss > 0 und < Achsabstand sein.';

  @override
  String get riggingLegLeftLabel => 'Länge linker Strang';

  @override
  String get riggingLegRightLabel => 'Länge gerader Strang';

  @override
  String get riggingAngleHLeftLabel => 'H-Winkel (links)';

  @override
  String get riggingAngleHRightLabel => 'H-Winkel (rechts)';

  @override
  String get riggingAngleVLeftLabel => 'V-Winkel (links)';

  @override
  String get riggingAngleVRightLabel => 'V-Winkel (rechts)';

  @override
  String get riggingIncludedAngleLabel => 'Winkel zwischen Strängen';

  @override
  String get riggingAngleHLeftInputLabel => 'H-Winkel (linker Strang)';

  @override
  String get riggingLegLeftInputLabel => 'Länge (linker Strang)';

  @override
  String get riggingNeedValidValues => 'Gültige positive Werte eingeben.';

  @override
  String get photometrySection4Title => 'Lux → Lumen';

  @override
  String get photometryAreaLabel => 'Fläche (m²)';

  @override
  String get photometryAreaHint4 => 'Ex: 12.5';

  @override
  String photometrySummary4(Object lumens, Object lux, Object area) {
    return 'E = $lux lx - S = $area m² → Φ = $lumens lm';
  }

  @override
  String get aboutArtnetTocConversionTitle => 'Umwandlungen';

  @override
  String get aboutArtnetConversionIntro =>
      'Nützliche Konvertierungstools rund um die Welten von DMX, Art-Net und hexadezimalen Werten.';

  @override
  String get aboutUniverseToArtnetTitle => 'Universum → Art-Net';

  @override
  String get aboutUniverseToArtnetSubtitle =>
      'Subnet + Universe (Net/Port-Address) von einem DMX-Universum aus finden.';

  @override
  String get aboutUniverseToHexTitle => 'Universum → Hex';

  @override
  String get aboutUniverseToHexSubtitle =>
      'Konvertiert ein Universum (1...N) in einen Index und einen hexadezimalen Wert.';

  @override
  String get aboutArtnetConversionNote =>
      'Hinweis: Die Art-Net-Konventionen können je nach Konsole variieren (Adressierung, Basis 0/1). Überprüfe immer die Dokumentation deines Systems.';

  @override
  String get elecTocCopyText => 'Inhaltsverzeichnis kopieren';

  @override
  String get elecToc1 => '1) Grundlagen (W, A, V, kW)';

  @override
  String get elecToc2 => '2) Anschlüsse (Schuko / P17 / PowerCON)';

  @override
  String get elecToc3 => '3) Mono / Tri (was es ändert)';

  @override
  String get elecToc4 => '4) Schneller Tisch (16A → 400A)';

  @override
  String get elecToc5 => 'Umrechnung kVA → kW / A';

  @override
  String get elecToc6 => '6) Sicherheit & Feldfallen';

  @override
  String get elecToc7 => '6) Checkliste';

  @override
  String get elecKvaTitle => 'Tabelle kVA → kW (nach cos φ)';

  @override
  String get elecKvaFormula => 'Formel: kW = kVA × cos φ';

  @override
  String get elecKvaIntro =>
      'Diese Tabelle gibt eine schnelle Schätzung der Wirkleistung (kW) aus einer Scheinleistung (kVA).';

  @override
  String get elecKvaNote =>
      'Werte, die als Richtwerte dienen. Verwende die tatsächlichen Werte von cos φ, wenn du sie kennst.';

  @override
  String get elecKvaColKva => 'kVA';

  @override
  String get elecKvaColPf08 => 'kW (cos φ = 0,8)';

  @override
  String get elecKvaColPf10 => 'kW (cos φ = 1,0)';

  @override
  String get commonTocTitle => 'Inhaltsverzeichnis';

  @override
  String get commonCopySummaryTooltip => 'Inhaltsverzeichnis kopieren';

  @override
  String get aboutLightReferenceTitle => 'Referenzen Licht';

  @override
  String get refCriTitle => 'IRC / CRI';

  @override
  String get refKelvinTitle => 'Farbtemperatur (K)';

  @override
  String get refBeamFieldTitle => 'Beam / Field';

  @override
  String get refLuxTitle => 'Beleuchtungsstärken (Lux)';

  @override
  String get refCriContent =>
      'Der CRI (CRI = Color Range Index) misst die Farbtreue. Je höher der CRI-Wert ist, desto natürlicher wirken die Farben.';

  @override
  String get refKelvinContent =>
      'Die Farbtemperatur beschreibt den Farbton von Weiß (warm bis kalt).';

  @override
  String get refBeamFieldContent =>
      'Der Beam ist der Winkel des Hauptstrahls; das Field der Winkel, bei dem die Intensität schwach wird (Rand).';

  @override
  String get refBeamLegendBeam => 'Beam';

  @override
  String get refBeamLegendField => 'Feld';

  @override
  String get refLuxIntro =>
      'Indikative Referenzen für die Beleuchtungsstärke je nach Verwendungszweck.';

  @override
  String get refLuxColUse => 'Verwendung';

  @override
  String get refLuxColLux => 'Lux';

  @override
  String get refLuxUseCorridor => 'Korridor / Zirkulation';

  @override
  String get refLuxUseBackstage => 'Backstage / Technik';

  @override
  String get refLuxUseMeeting => 'Versammlungsraum';

  @override
  String get refLuxUseExpo => 'Expo / Showroom';

  @override
  String get refLuxUseStageGeneral => 'Bühne - allgemein';

  @override
  String get refLuxUseStageTv => 'Bühne - TV / Aufnahme';

  @override
  String get refLuxNote =>
      'Diese Werte variieren je nach Norm und Einschränkungen (Kamera, Kontrast, Umgebung).';

  @override
  String get refLightDisclaimerShort => 'Richtreferenzen - keine Norm.';

  @override
  String get refCri90 => 'Hervorragend (≥ 90)';

  @override
  String get refCri80 => 'Gut (≈ 80)';

  @override
  String get refCriLow => 'Niedrig (< 80)';

  @override
  String get aboutUniverseToArtnetImportantTitle => 'Wichtig';

  @override
  String get aboutUniverseToArtnetImportantBody =>
      'Einige Konsolen verwenden die Basis 0 (Universe 0..15), andere die Basis 1 (Universe 1..16).';

  @override
  String get aboutUniverseToArtnetTableTitle => 'Tisch Univers → Art-Net';

  @override
  String get aboutUniverseToArtnetTableIntro =>
      'Typische Entsprechung zwischen DMX-Universum und Art-Net-Adressierung.';

  @override
  String get aboutUniverseTablesDisclaimer =>
      'Überprüfe immer die Konvention deiner Konsole / deines Nodes.';

  @override
  String get aboutUniverseToArtnetColDmx => 'DMX-Universum';

  @override
  String get aboutUniverseToArtnetColUniHex => 'Uni (hex)';

  @override
  String aboutUniverseToArtnetSubnetTitle(
      Object p0, Object p1, Object p2, Object p3) {
    return 'Subnet $p0 $p1 $p2 $p3';
  }

  @override
  String get aboutUniverseToHexPrincipleTitle => 'Prinzip';

  @override
  String get aboutUniverseToHexPrincipleBody =>
      'Ein Universum (1...N) kann in einen Index (Basis 0) und dann in Hexadezimalzahlen umgewandelt werden.';

  @override
  String get aboutUniverseToHexTableTitle => 'Tabelle Univers → Hex';

  @override
  String get aboutUniverseToHexTableIntro =>
      'Umwandlungstabelle DMX-Universum → Index / Hex.';

  @override
  String aboutUniverseToHexBlockTitle(Object p0, Object p1) {
    return 'Block $p0 $p1';
  }

  @override
  String get aboutUniverseToHexColDmx => 'DMX-Universum';

  @override
  String get aboutUniverseToHexColIndex => 'Index';

  @override
  String get aboutArtnetPageTitle =>
      'Art-Net - DMX-Universum über IP (einfach & komplett)';

  @override
  String get aboutArtnetTocTitle => 'Inhaltsverzeichnis';

  @override
  String get aboutArtnetTocCopyTooltip => 'Markierungen kopieren';

  @override
  String get aboutArtnetCopyLine1 => 'Art-Net = DMX über Ethernet via UDP.';

  @override
  String get aboutArtnetCopyLine2 =>
      'Maßstab: viele Universen über verteilte Knoten (DMX-out).';

  @override
  String get aboutArtnetCopyLine3 =>
      'Übertragung: Broadcast (einfach, aber flood) oder Unicast (sauberer).';

  @override
  String get aboutArtnetCopyLine4 =>
      'Reale Grenzen: Wi-Fi, Basis-Switch, Firmware-Nodes, Universum/Mapping-Einstellungen.';

  @override
  String get aboutArtnetCopyLine5 =>
      'RDM: möglich über \"RDM proxy\" je nach Knoten (variable Unterstützung).';

  @override
  String get aboutArtnetSection1Title => '1) Art-Net - was ist das und warum';

  @override
  String get aboutArtnetSection2Title =>
      '2) Adressierung & Universen - eigenes Mapping';

  @override
  String get aboutArtnetSection3Title =>
      '3) Limits & Perf - was zuerst kaputt geht';

  @override
  String get aboutArtnetSection4Title => '4) Knoten, Splitter & RDM';

  @override
  String get aboutArtnetSection5Title =>
      '5) Fehlerbehebung - Symptome → Ursachen';

  @override
  String get aboutArtnetSection6Title =>
      '6) Schemata (Netzwerk / Unicast vs. Broadcast)';

  @override
  String get aboutArtnetSection6bTitle =>
      '6bis) Abbildungen (Assets) - RJ45/Switch/Kabel';

  @override
  String get aboutArtnetSection7Title => '7) Schnelle Checkliste';

  @override
  String get aboutArtnetConversionTablesTitle =>
      '8) Umrechnung / Tabellen (Univers 1..256)';

  @override
  String get aboutArtnetPillUdp => 'UDP';

  @override
  String get aboutArtnetPillUniversIp => 'DMX-over-IP-Universum';

  @override
  String get aboutArtnetPillNodesDmxOut => 'DMX-out-Nodes';

  @override
  String get aboutArtnetSection1Paragraph =>
      'Art-Net transportiert DMX-Universen über ein Ethernet-Netzwerk (IP). Anstatt eine DMX-Leitung pro Universum zu ziehen, schickst du \"Pakete\" über das Netzwerk, und ein Knoten wandelt sie in der Nähe der Maschinen in DMX um.';

  @override
  String get aboutArtnetSection1CalloutTitle => 'Warum es nützlich ist';

  @override
  String get aboutArtnetSection1Bullet1 =>
      'Skalierbar: Viele Universen auf einem einzigen Netzwerkkabel.';

  @override
  String get aboutArtnetSection1Bullet2 =>
      'Verteilung: Nodes in der Nähe von Projektoren/Dimmers → weniger lange DMX-Leitungen.';

  @override
  String get aboutArtnetSection1Bullet3 =>
      'Flexibler Patch: Das Ändern eines Universums oder das Verschieben eines Knotens geht schnell.';

  @override
  String get aboutArtnetSection1Subtitle =>
      'Zwei Wörter, die Sie sich merken sollten';

  @override
  String get aboutArtnetSection1SubBullet1 =>
      'Art-Net ersetzt DMX nicht: Es transportiert es über IP.';

  @override
  String get aboutArtnetSection1SubBullet2 =>
      'Die Stabilität hängt oft mehr vom Netzwerk (Switch, Wi-Fi, Broadcast) als vom Protokoll ab.';

  @override
  String get aboutArtnetSection2PillUniverse => 'Universum';

  @override
  String get aboutArtnetSection2PillNodePort => 'Knoten / Port';

  @override
  String get aboutArtnetSection2PillMapping => 'Mapping';

  @override
  String get aboutDmxPageTitle => 'DMX - Funktionsweise (einfach & komplett)';

  @override
  String get aboutDmxSummaryLine1 =>
      'DMX = RS-485, 512 Kanäle (Slots) pro Universum, Werte 0-255 (8-Bit).';

  @override
  String get aboutDmxSummaryLine2 =>
      'Timing: 250 kbaud, Volluniversum ≈ ~44 Hz (Größenordnung).';

  @override
  String get aboutDmxSummaryLine3 =>
      'Topologie: Daisy-Chain (kein passives Y). 120Ω-Terminierung auf dem letzten.';

  @override
  String get aboutDmxSummaryLine4 =>
      'RDM = Bidirektionales DMX (config/monitoring) → Splitter/Node-Kompatibilitäten müssen überprüft werden.';

  @override
  String get aboutDmxSummaryLine5 =>
      'Art-Net / sACN = DMX-Universen, die über Nodes auf Ethernet/IP transportiert werden.';

  @override
  String get aboutDmxSummaryLine6 =>
      'sACN = Multicast + Prioritäten (IGMP Snooping empfohlen).';

  @override
  String get aboutDmxToc1 => '1) DMX, Universen, Adressen - die Basis';

  @override
  String get aboutDmxToc2 => '2) DMX-Rahmen - Break, Startcode, Kanäle';

  @override
  String get aboutDmxToc3 => '3) RS-485-Verkabelung - Topologie & Kabel';

  @override
  String get aboutDmxToc4 =>
      '4) Terminierung & Splitter - Vermeidung von Reflexionen';

  @override
  String get aboutDmxToc4bis => '4bis) RDM - Grenzen & Kompatibilitäten';

  @override
  String get aboutDmxToc5 => '5) Fehlerbehebung Feld - Symptome → Ursachen';

  @override
  String get aboutDmxToc6 => '6) Art-Net - Feldmarkierungen';

  @override
  String get aboutDmxToc7 => '7) sACN / E1.31 - Multicast, IGMP, Prioritäten';

  @override
  String get aboutDmxToc8 => '8) DMX vs. Art-Net vs. sACN - auswählen';

  @override
  String get aboutDmxToc9 => '9) Feldschemata (DMX / IP / Pinout)';

  @override
  String get aboutDmxChecklistCopyTitle => 'DMX - Checkliste Feld';

  @override
  String get aboutDmxChecklistCopyTitle2 =>
      'Art-Net / sACN - Checkliste Gelände';

  @override
  String get aboutDmxChecklistCopyB1 =>
      'Richtiger Gerätemodus (Anzahl der Kanäle)';

  @override
  String get aboutDmxChecklistCopyB2 =>
      'Korrekte DMX-Adresse (keine Überschneidungen)';

  @override
  String get aboutDmxChecklistCopyB3 => 'Daisy-Chain (kein passives Y)';

  @override
  String get aboutDmxChecklistCopyB4 => 'Terminierung 120Ω am letzten Gerät';

  @override
  String get aboutDmxChecklistCopyB5 =>
      'DMX/RS-485-Kabel (Twisted Pair 120Ω), wenn möglich';

  @override
  String get aboutDmxChecklistCopyB6 => 'Opto-Splitter, wenn mehrere Zweige';

  @override
  String get aboutDmxChecklistCopyB7 =>
      'DMX möglichst von Störquellen (Stromversorgungen, Dimmer) fernhalten';

  @override
  String get aboutDmxChecklistCopyB8 =>
      'Wenn RDM: Splitter/Node-Kompatibilität prüfen + einwandfreie Verkabelung';

  @override
  String get aboutDmxChecklistCopyB9 =>
      'Dediziertes Netzwerk, wenn möglich (oder VLAN)';

  @override
  String get aboutDmxChecklistCopyB10 =>
      'Switch korrekt; IGMP-Snooping empfohlen (sACN Multicast)';

  @override
  String get aboutDmxChecklistCopyB11 =>
      'Unicast (oft) oder kontrolliertes Multicast (Flood vermeiden)';

  @override
  String get aboutDmxChecklistCopyB12 =>
      'Mapping universe ↔ ports/node verified';

  @override
  String get aboutDmxChecklistCopyB13 =>
      'Klarer IP-Plan (Adressen, Maske, DHCP vs. statisch)';

  @override
  String get aboutDmxS1Title => '1) DMX, Universen, Adressen - die Basis';

  @override
  String get aboutDmxS1Pill1 => '1 Universum = 512 Slots';

  @override
  String get aboutDmxS1Pill2 => '0-255 (8-Bit)';

  @override
  String get aboutDmxS1Pill3 => '16-bit = 2 Kanäle';

  @override
  String get aboutDmxS1Intro =>
      'DMX512 ist ein Steuerprotokoll, das häufig in der Unterhaltungsbranche (Licht, Effekte, Dimmer) verwendet wird. Es ist ein serieller Stream (RS-485), der in einer Schleife einen \"Rahmen\" mit bis zu 512 Werten sendet. Jeder Wert = ein Kanal (0→255).';

  @override
  String get aboutDmxS1RememberTitle => 'Zu merken';

  @override
  String get aboutDmxS1RememberB1 =>
      '1 DMX-Universum = 512 Kanäle (Slots), die mit 1→512 nummeriert sind.';

  @override
  String get aboutDmxS1RememberB2 =>
      'Ein Gerät hört auf eine Startadresse (z. B. 101) und verbraucht N Kanäle (abhängig von seinem Modus).';

  @override
  String get aboutDmxS1RememberB3 =>
      'Der Controller sendet alles kontinuierlich zurück: Wenn du aufhörst zu senden, \"frieren\" die Geräte ein (oder schalten auf Fallback).';

  @override
  String get aboutDmxS4bisTitle => '4bis) RDM - Grenzen & Kompatibilitäten';

  @override
  String get aboutDmxS4bisPlaceholder =>
      '... (behalte deinen bestehenden Inhalt)';

  @override
  String get aboutDmxS9Title => '9) Feldschemata (DMX / IP / Pinout)';

  @override
  String get aboutDmxS9Diagram1 => 'DMX-Timing (Break / MAB / Slots)';

  @override
  String get aboutDmxS9Diagram2 => 'DMX-Topologie: Daisy-Chain';

  @override
  String get aboutDmxS9Diagram3 => 'Terminierung 120Ω';

  @override
  String get aboutDmxS9Diagram4 =>
      'sACN Multicast: Erinnerung an IGMP (Netzwerk)';

  @override
  String get aboutDmxS9Diagram5 => 'IP → Knoten → DMX (Art-Net / sACN)';

  @override
  String get aboutDmxS9Diagram6 => 'Pinout XLR5 (DMX)';

  @override
  String get aboutDmxS10Title => '10) Schnelle Checkliste';

  @override
  String get aboutDmxS10CopyTooltip => 'Kopieren der Checkliste';

  @override
  String get aboutDmxS10CalloutTitle => 'Bevor Sie in Panik geraten';

  @override
  String get aboutDmxS10B1 => 'Gerätemodus + DMX-Adresse (immer prüfen).';

  @override
  String get aboutDmxS10B2 =>
      'Kurze Kette mit einem \"bekannt OK\"-Kabel zum Isolieren.';

  @override
  String get aboutDmxS10B3 => 'Daisy-Chain (kein passives Y).';

  @override
  String get aboutDmxS10B4 => '120Ω-Terminierung nur am letzten Gerät.';

  @override
  String get aboutDmxS10B5 => 'Opto-Splitter, wenn mehrere Zweige.';

  @override
  String get aboutDmxS10B6 =>
      'Wenn RDM: Splitter-/Node-Kompat + einwandfreie Verkabelung.';

  @override
  String get aboutDmxS10B7 =>
      'In IP (Art-Net/sACN): Switch korrekt, IGMP für sACN Multicast, Unicast im Zweifelsfall.';

  @override
  String get aboutDmxFooterNote =>
      'Unverbindliche Info (Feld). Das genaue Verhalten kann je nach Konsole, Node, Switch und Firmware variieren.\nZiel hier: schnell verstehen und Fehler mit einer zuverlässigen Methode beheben.';

  @override
  String get aboutDmxPainterBreak => 'BREAK';

  @override
  String get aboutDmxPainterMab => 'MAB';

  @override
  String get aboutDmxPainterStartCode => 'Start\nCode';

  @override
  String get aboutDmxPainterSlots => 'Slots 1...N\n(bis zu 512)';

  @override
  String get aboutDmxPainterRefresh =>
      'Schleife (refresh) - volles Universum ≈ ~44 Hz (Größenordnung)';

  @override
  String get aboutDmxPainterSourceA => 'QUELLE A\n(Prio 100)';

  @override
  String get aboutDmxPainterSourceB => 'QUELLE B\n(prio 90)';

  @override
  String get aboutDmxPainterSwitchIgmp => 'SWITCH\nIGMP-Snooping';

  @override
  String get aboutDmxPainterMulticastUniverse => 'MULTICAST\nUniverse U';

  @override
  String get aboutDmxPainterRx => 'RX';

  @override
  String get aboutDmxPainterIgmpNote =>
      'Ohne IGMP: Flood\nMit IGMP: nur abonnierte Ports';

  @override
  String get aboutDmxPainterConsole => 'CONSOLE';

  @override
  String get aboutDmxPainterFix1 => 'FIX 1';

  @override
  String get aboutDmxPainterFix2 => 'FIX 2';

  @override
  String get aboutDmxPainterFix3 => 'FIX 3';

  @override
  String get aboutElectricitePageTitle => 'Elektrisch - Feldmarkierungen';

  @override
  String get elecSection1Title => '1) Grundlagen (W, A, V, kW)';

  @override
  String get elecSection1FormulasTitle => '3 nützliche Formeln';

  @override
  String get elecSection1Formula1 => 'P (W) = U (V) × I (A)';

  @override
  String get elecSection1Formula2 => 'I (A) = P (W) / U (V)';

  @override
  String get elecSection1Formula3 => 'P (kW) = P (W) / 1000';

  @override
  String get elecSection1FieldMarksTitle => 'Feldmarkierungen';

  @override
  String get elecSection1FieldMark1 =>
      'Mono 230V: 16A ≈ 3,7 kW | 32A ≈ 7,4 kW | 63A ≈ 14,5 kW';

  @override
  String get elecSection1FieldMark2 =>
      'Tri 400V: 16A ≈ 11 kW | 32A ≈ 22 kW | 63A ≈ 44 kW';

  @override
  String get elecSection2Title => '2) Anschlüsse (Schuko / P17 / PowerCON)';

  @override
  String get elecSection2SchukoTitle => 'Schuko (Haushaltssteckdosen)';

  @override
  String get elecSection2SchukoBullet1 =>
      'Typischerweise max. 16A (≈ 3,7 kW bei 230V).';

  @override
  String get elecSection2SchukoBullet2 =>
      'Vorsicht mit Mehrfachsteckdosen und Verlängerungskabeln: Erhitzung möglich.';

  @override
  String get elecSection2P17Title => 'P17 / CEE (blau/rot)';

  @override
  String get elecSection2P17Bullet1 =>
      'Blau: 230V Mono (Camping, kleine Distros).';

  @override
  String get elecSection2P17Bullet2 =>
      'Rot: 400V Tri (Distro, große Leistungen).';

  @override
  String get elecSection2PowerconTitle => 'PowerCON (Audio/Licht)';

  @override
  String get elecSection2PowerconBullet1 =>
      'PowerCON TRUE1 = mehr \"Feld\" (Sperren, IP).';

  @override
  String get elecSection2PowerconBullet2 =>
      'Überprüfe den Kabelquerschnitt und die Schutzvorrichtungen.';

  @override
  String get elecSection3Title => '3) Mono / Tri (was es ändert)';

  @override
  String get elecSection3Paragraph =>
      'Mono = eine Phase + Neutralleiter (230V). Tri = 3 Phasen (400V zwischen den Phasen).';

  @override
  String get elecSection3PitfallsTitle => 'Häufige Fallen';

  @override
  String get elecSection3Pitfall1 =>
      'Phasenungleichgewicht (eine Phase überlastet).';

  @override
  String get elecSection3Pitfall2 =>
      'Neutralleiter, der sich bei großen Oberschwingungen (LEDs, Dimmer) erwärmt.';

  @override
  String get elecSection3Pitfall3 =>
      'Fehlende/zweifelhafte Erde an einigen Standorten.';

  @override
  String get elecSection3MethodTitle => 'Einfache Methode';

  @override
  String get elecSection3MethodBullet1 =>
      'Verteile die großen Belastungen auf L1/L2/L3.';

  @override
  String get elecSection3MethodBullet2 =>
      'Überwacht den Neutralen, wenn viele LEDs vorhanden sind.';

  @override
  String get elecSection3MethodBullet3 =>
      'Messung mit der Klammer, wenn möglich.';

  @override
  String get elecSection4Title => '4) Schneller Tisch (16A → 400A)';

  @override
  String get elecSection4MonoTitle => 'Mono 230V (≈ U×I)';

  @override
  String get elecSection4MonoCode =>
      '16A ≈ 3,7 kW\n32A ≈ 7,4 kW\n63A ≈ 14,5 kW\n125A ≈ 28,8 kW\n200A ≈ 46 kW\n';

  @override
  String get elecSection4TriTitle => 'Tri 400V (≈ √3×U×I)';

  @override
  String get elecSection4TriCode =>
      '16A ≈ 11 kW\n32A ≈ 22 kW\n63A ≈ 44 kW\n125A ≈ 86 kW\n200A ≈ 138 kW\n400A ≈ 277 kW\n';

  @override
  String get elecSection4ImportantTitle => 'Wichtig';

  @override
  String get elecSection4ImportantBullet1 =>
      'Das sind Größenordnungen (cosφ, Oberschwingungen, Verluste).';

  @override
  String get elecSection4ImportantBullet2 =>
      'Bestätigen Sie immer Schutzmaßnahmen + Abschnitte + Temperatur.';

  @override
  String get elecSection5Title => '6) Sicherheit & Feldfallen';

  @override
  String get elecSection5DontDoTitle => 'Nicht zu tun';

  @override
  String get elecSection5DontDoBullet1 =>
      'Mehrfachsteckdosen/Verlängerungskabel lose ketten.';

  @override
  String get elecSection5DontDoBullet2 => 'Vermischen von Phasen ohne Wissen.';

  @override
  String get elecSection5DontDoBullet3 => '\"Bridger\" ein fragwürdiges Land.';

  @override
  String get elecSection5WarningTitle => 'Warnsignale';

  @override
  String get elecSection5WarningBullet1 =>
      'Heißer Geruch, lauwarme Griffe, wiederholte Auslösungen.';

  @override
  String get elecSection5WarningBullet2 => 'Blutdruck sinkt (Brown-out).';

  @override
  String get elecSection5WarningBullet3 =>
      '\"Müder\" oder ungeeigneter Leistungsschalter.';

  @override
  String get elecSection6Title => '6) Checkliste';

  @override
  String get elecSection6QuickTitle => 'Schnell';

  @override
  String get elecSection6Bullet1 =>
      'Art der Stromversorgung (mono/tri) + Größe (A).';

  @override
  String get elecSection6Bullet2 => 'Phasenverteilung (Hauptlasten).';

  @override
  String get elecSection6Bullet3 =>
      'Schutzmaßnahmen (Diff/Disj) und Status der Tabelle.';

  @override
  String get elecSection6Bullet4 => 'Kabel: Querschnitt / Länge / Erwärmung.';

  @override
  String get elecSection6Bullet5 => 'Erde: OK? (Tester, wenn möglich).';

  @override
  String get elecFooterNote =>
      'Hinweis: Dieser Inhalt ist eine Feldhilfe. Halte dich an einem realen Standort immer an die Normen, die Vorschriften des Ortes und die vorhandenen Schutzmaßnahmen.';

  @override
  String get infoPageTitle => 'Informatik - Feldmarkierungen';

  @override
  String get infoUsbTitle => '1) USB / USB-C / Thunderbolt';

  @override
  String get infoStorageTitle => '2) Speicher (SATA / NVMe / SSD)';

  @override
  String get infoVideoLinksTitle => '3) Videoverbindungen (DP / HDMI)';

  @override
  String get infoPcieGpuTitle => '4) PCIe / GPU (Benchmarks)';

  @override
  String get infoChecklistTitle => '5) Checkliste (Tablett)';

  @override
  String get infoSummaryCopy =>
      'INFO - Feldmarkierungen\n- USB-C = Form, nicht Geschwindigkeit: Standard überprüfen.\n- NVMe (M.2) viel schneller als SATA.\n- DisplayPort/HDMI = Standards, Versionen/Kabel beachten.\n- Auf Videoservern: Speicher + GPU + Durchsatz sind die Basis.';

  @override
  String get infoChecklistCopy =>
      'INFO - Checkliste\n☐ Zertifizierte USB-C-Kabel (Daten/Video, falls erforderlich).\n☐ Geeigneter Speicher (NVMe, wenn große Datenströme).\n☐ Stabile GPU-Treiber (bekannte Version).\n☐ Test tatsächliche Auflösung/FPS\n☐ Vermeidung von Billigadaptern';

  @override
  String get infoUsbCriticalTitle => 'Kritischer Punkt';

  @override
  String get infoUsbCriticalBullet1 =>
      'USB-C = Stecker (Form). Sagt nichts über die Geschwindigkeit aus.';

  @override
  String get infoUsbCriticalBullet2 =>
      'Ein USB-C-Kabel kann \"charge only\" sein und keine Daten/Videos durchlassen.';

  @override
  String get infoUsbSpeedTitle =>
      'Benchmarks Geschwindigkeiten (Größenordnung)';

  @override
  String get infoUsbSpeedBullet1 =>
      'USB 2.0: langsam (Tastaturen, Dongles, kleine Peripheriegeräte).';

  @override
  String get infoUsbSpeedBullet2 =>
      'USB 3.x: viel schneller (Laufwerke, Schnittstellen).';

  @override
  String get infoUsbSpeedBullet3 =>
      'USB4 / Thunderbolt: Sehr hoher Datendurchsatz (Dock, eGPU, Video je nach Hardware).';

  @override
  String get infoUsbParagraph =>
      'In show: Wenn ein Gerät \"ausfällt\", vermute das Kabel (Qualität/Standard) vor dem Device.';

  @override
  String get infoStorageSataNvmeTitle => 'SATA vs. NVMe';

  @override
  String get infoStorageSataNvmeBullet1 =>
      'SATA-SSD: gut und stabil, aber begrenzt (alte Schnittstelle).';

  @override
  String get infoStorageSataNvmeBullet2 =>
      'NVMe (M.2) SSD: viel schneller (ideal für Medienserver, große Dateien).';

  @override
  String get infoStorageFieldTitle => 'Video-Grundstück';

  @override
  String get infoStorageFieldBullet1 =>
      'Wiedergabe von großen 4K/ProRes-Dateien → NVMe empfohlen.';

  @override
  String get infoStorageFieldBullet2 =>
      'Achten Sie auf die Temperatur: Ein NVMe kann throttlen (verlangsamen), wenn es heiß wird.';

  @override
  String get infoStorageFieldBullet3 =>
      'Testen Sie vor der Show immer unter realen Bedingungen.';

  @override
  String get infoVideoLinksImportantTitle => 'Wichtige Markierung';

  @override
  String get infoVideoLinksImportantBullet1 =>
      'Die Versionen zählen: Kabel + Port + Device müssen kompatibel sein.';

  @override
  String get infoVideoLinksImportantBullet2 =>
      'Große Entfernungen = aktive Konverter / Glasfaser oft erforderlich.';

  @override
  String get infoVideoLinksCompareTitle => 'DP vs. HDMI (stark vereinfacht)';

  @override
  String get infoVideoLinksCompareBullet1 =>
      'HDMI: allgegenwärtig (Fernseher, Prozessoren), aber EDID/HDCP können stören.';

  @override
  String get infoVideoLinksCompareBullet2 =>
      'DisplayPort: sehr häufig PC, oft sehr \"fähig\" in der Datenrate.';

  @override
  String get infoPcieGpuParagraph =>
      'Für Video-/Mapping-Server: Grafikprozessor + Busse + Treiber = Stabilität. Typische Probleme: Treiber, Kabel, Konvertierung und Ausgabebegrenzungen.';

  @override
  String get infoPcieGpuFieldTitle => 'Grundstück';

  @override
  String get infoPcieGpuFieldBullet1 =>
      'Blockieren einer stabilen Treiberversion vor einer großen Show.';

  @override
  String get infoPcieGpuFieldBullet2 => 'Vermeiden Sie \"billige\" Adapter.';

  @override
  String get infoPcieGpuFieldBullet3 =>
      'Testen Sie mit der tatsächlichen Auflösung/FPS der Show.';

  @override
  String get infoChecklistQuickTitle => 'Schnell';

  @override
  String get infoChecklistBullet1 => 'Richtiges Kabel/Standard.';

  @override
  String get infoChecklistBullet2 => 'An den Fluss angepasste Lagerung.';

  @override
  String get infoChecklistBullet3 => 'Stabile Treiber.';

  @override
  String get infoChecklistBullet4 => 'Echter Test vor der Show.';

  @override
  String get infoChecklistBullet5 => 'Vermeiden Sie billige Adapter.';

  @override
  String get infoFooterNote =>
      'Unverbindliche Info (Gelände). Die genauen Fähigkeiten variieren je nach Hardware/Versionen.\nZiel: Einfache Anhaltspunkte + zuverlässige Methode.';

  @override
  String get ipBasicsPageTitle =>
      'Netzwerk - IP-Grundlagen / Maske / DHCP (wesentlich)';

  @override
  String get ipBasicsCopyMemoTooltip => 'Memo kopieren';

  @override
  String get ipBasicsCopyChecklistTooltip => 'Kopieren der Checkliste';

  @override
  String get ipBasicsMemo1 =>
      'IP = Logische Adresse, um ein Gerät in einem Netzwerk zu erreichen.';

  @override
  String get ipBasicsMemo2 =>
      'Privat (LAN): 10.x.x.x, 172.16-31.x.x, 192.168.x.x (nicht über das Internet geroutet).';

  @override
  String get ipBasicsMemo3 =>
      'Maske / Subnetz = sagt aus, welcher Teil \"Netzwerk\" vs. \"Maschine\" ist.';

  @override
  String get ipBasicsMemo4 =>
      'Gleiches Subnetz = direkte Kommunikation. Andernfalls → Gateway (Router).';

  @override
  String get ipBasicsMemo5 =>
      'DHCP weist die IP automatisch zu; statisch = nützlich für Nodes/Konsolen.';

  @override
  String get ipBasicsToc1 => '1) Was ist eine IP und wozu dient sie?';

  @override
  String get ipBasicsToc2 =>
      '2) Warum 192.x / 10.x / 172.x? (private Adressen)';

  @override
  String get ipBasicsToc3 => '3) Masken & Subnetze: wirklich verstehen';

  @override
  String get ipBasicsToc4 => '4) DHCP, Gateway, DNS: Wer macht was?';

  @override
  String get ipBasicsToc5 =>
      '5) Wie zwei Geräte miteinander sprechen (LAN vs. nicht-LAN)';

  @override
  String get ipBasicsToc6 =>
      '6) Einfache \"Show\"-IP-Pläne (kopierfertige Beispiele)';

  @override
  String get ipBasicsToc7 =>
      '7) Fehlerbehebung: Symptome → Ursachen (Feldmethode)';

  @override
  String get ipBasicsToc8 =>
      '8) Mini-Übungen (schnell eine Maske / ein Netzwerk überprüfen)';

  @override
  String get ipBasicsToc9 => '9) Schnelle Checkliste';

  @override
  String get ipBasicsSection1Paragraph =>
      'Eine IP-Adresse (IPv4) ist eine logische Kennung in einem Netzwerk. Mit ihr kann man sagen: \"Sende dieses Paket an dieses Gerät\".\n\nWenn du eine Konsole, einen Art-Net/sACN-Node, einen PC, einen verwalteten Switch... anschließt, muss alles, was im Netzwerk spricht, eine konsistente IP haben, damit sich die Geräte finden können.';

  @override
  String get ipBasicsSection1CalloutTitle => 'Geistiges Bild';

  @override
  String get ipBasicsSection1Bullet1 =>
      'MAC = Hardware-Identifikator (Netzwerkkarte).';

  @override
  String get ipBasicsSection1Bullet2 =>
      'IP = \"Post\"-Adresse in einem Netzwerk (veränderbar).';

  @override
  String get ipBasicsSection1Bullet3 =>
      'Maske = \"Stadtteil / Postleitzahl\" (grenzt das Subnetz ein).';

  @override
  String get ipBasicsSection1Bullet4 =>
      'Gateway = \"Ausgang des Viertels\" (Router).';

  @override
  String get ipBasicsSection1Subtitle => 'IPv4 in 10 Sekunden';

  @override
  String get ipBasicsSection1SubBullet1 =>
      'Format: A.B.C.D (4 Zahlen von 0 bis 255).';

  @override
  String get ipBasicsSection1SubBullet2 => 'Bsp: 192.168.0.50';

  @override
  String get ipBasicsSection1SubBullet3 =>
      'Das ist keine Zauberei: Es sind 32 Bit (4 Byte).';

  @override
  String get ipBasicsSection1SubBullet4 =>
      'Was für dich wichtig ist: IP + Maske müssen zwischen den Geräten konsistent sein.';

  @override
  String get ipBasicsSection2Paragraph =>
      'Einige IPv4-Adressbereiche sind für private Netzwerke (LANs) reserviert. Sie werden nicht über das Internet geroutet. Deshalb werden sie in der Show verwendet: Du kannst dein lokales Netzwerk aufbauen, ohne öffentliche IPs zu \"verbrauchen\".';

  @override
  String get ipBasicsSection2CalloutTitle => 'Die 3 großen Privatstrände (LAN)';

  @override
  String get ipBasicsSection2Bullet1 =>
      '10.0.0 → 10.255.255.255 (oft \"10.x.x.x\" geschrieben)';

  @override
  String get ipBasicsSection2Bullet2 =>
      '172.16.0.0 → 172.31.255.255 (oft \"172.16-31.x.x\")';

  @override
  String get ipBasicsSection2Bullet3 =>
      '192.168.0.0 → 192.168.255.255 (oft \"192.168.x.x\")';

  @override
  String get ipBasicsSection2Subtitle1 => 'Warum sehen wir oft 192.168.x.x?';

  @override
  String get ipBasicsSection2SubBullet1 =>
      'Boxen/Router für Verbraucher verwenden häufig 192.168.0.x oder 192.168.1.x.';

  @override
  String get ipBasicsSection2SubBullet2 =>
      'Dies ist in kleinen LAN zu einem \"De-facto-Standard\" geworden.';

  @override
  String get ipBasicsSection2SubBullet3 =>
      'Aber in der Show ist 10.x.x.x praktisch, wenn du viele Adressen oder mehrere VLANs haben willst.';

  @override
  String get ipBasicsSection2Subtitle2 =>
      'Was ist mit dem berühmten 2.x.x.x (Art-Net)?';

  @override
  String get ipBasicsSection2SubBullet4 =>
      'Viele Art-Net-Hardware verlässt die Fabrik mit einer IP in 2.x.x.x (geschlossenes Netzwerk).';

  @override
  String get ipBasicsSection2SubBullet5 =>
      'Das ist \"praktisch\" im Plug&Play (ohne DHCP), aber es überrascht, wenn dein PC auf 192.168.x.x steht.';

  @override
  String get ipBasicsSection2SubBullet6 =>
      'Wichtig: \"2.x\" ist keine Zauberei für Broadcast/Unicast.';

  @override
  String get ipBasicsSection2SubBullet7 =>
      'Was den Umfang des Broadcasts ändert, ist die Maske (oft /8 = 255.0.0 in legacy).';

  @override
  String get ipBasicsSection2SubBullet8 =>
      'Beispiel: Netzwerk 2.0.0.0/8 → broadcast = 2.255.255.255 (sehr breit).';

  @override
  String get ipBasicsSection2SubBullet9 =>
      'Einfache Lösung: PC/Konsole in denselben Bereich + dieselbe Maske setzen oder den Node auf einem 192/10-Plan neu konfigurieren.';

  @override
  String get ipBasicsSection3Paragraph =>
      'Die Maske (subnet mask) sagt aus, welche Adressen \"im selben Netzwerk\" sind. Ohne Maske sagt eine IP nicht viel aus.\n\nFeldregel: Wenn zwei Geräte im selben Subnetz sind, sprechen sie direkt miteinander. Wenn nicht, brauchen sie ein Gateway (Router).';

  @override
  String get ipBasicsSection3Callout1Title => 'Häufigste Masken';

  @override
  String get ipBasicsSection3Bullet1 =>
      '255.0.0 ( /8 ) → Netzwerk 10.x.x.x typisch \"breit\"';

  @override
  String get ipBasicsSection3Bullet2 =>
      '255.255.0.0 ( /16 ) → Netzwerk 10.10.x.x oder 192.168.x.x \"large\".';

  @override
  String get ipBasicsSection3Bullet3 =>
      '255.255.255.0 ( /24 ) → Netzwerk 192.168.0.x \"klassisch\" (254 Geräte)';

  @override
  String get ipBasicsSection3Callout2Title =>
      'Maske → Broadcast-Adresse (sehr hilfreich zu verstehen)';

  @override
  String get ipBasicsSection3Bullet4 =>
      'Der Broadcast hängt vom Subnetz ab, also von der Maske (nicht \"2 vs 192\").';

  @override
  String get ipBasicsSection3Bullet5 =>
      '192.168.10.0/24 → broadcast = 192.168.10.255 (kleines Netzwerk).';

  @override
  String get ipBasicsSection3Bullet6 =>
      '2.0.0.0/8 (255.0.0.0) → broadcast = 2.255.255.255 (riesiges Netzwerk).';

  @override
  String get ipBasicsSection3Bullet7 =>
      'Je \"größer\" das Netzwerk ist, desto mehr Lärm kann ein Broadcast machen (wenn du ihn oft benutzt).';

  @override
  String get ipBasicsSection3Subtitle1 =>
      'Konkretes Beispiel (am nützlichsten): /24';

  @override
  String get ipBasicsSection3SubBullet1 => 'IP: 192.168.0.50';

  @override
  String get ipBasicsSection3SubBullet2 => 'Maske: 255.255.255.0 ( /24 )';

  @override
  String get ipBasicsSection3SubBullet3 => 'Netzwerk: 192.168.0.0';

  @override
  String get ipBasicsSection3SubBullet4 =>
      'Geräte \"im selben Netzwerk\": 192.168.0.1 → 192.168.0.254';

  @override
  String get ipBasicsSection3SubBullet5 =>
      'Wenn du auf 192.168.1.50 → wechselst, ist es NICHT mehr dasselbe Netzwerk.';

  @override
  String get ipBasicsSection3Subtitle2 => 'Warum Subnetze machen?';

  @override
  String get ipBasicsSection3SubBullet6 =>
      'Organisation: Trennen Sie \"Licht\", \"Video\", \"Intercom\", \"Internet\"...';

  @override
  String get ipBasicsSection3SubBullet7 =>
      'Leistung: Das Rauschen (Broadcast/Multicast) auf eine Gruppe beschränken.';

  @override
  String get ipBasicsSection3SubBullet8 =>
      'Sicherheit: Verhindern, dass ein \"Gast\"-PC das Show-Netzwerk sieht/stört.';

  @override
  String get ipBasicsSection3SubBullet9 =>
      'Diagnose: Einfacher zu wissen, \"wo\" ein Gerät ist.';

  @override
  String get ipBasicsSection3Callout3Title => 'Klassische Falle';

  @override
  String get ipBasicsSection3Bullet8 =>
      'Gleicher \"Anfang\" der IP ≠ gleiches Netzwerk, wenn die Maske nicht identisch ist.';

  @override
  String get ipBasicsSection3Bullet9 =>
      'Bsp: 10.0.0.5/8 und 10.0.0.200/24 → nicht derselbe logische Umfang.';

  @override
  String get ipBasicsSection4Subtitle1 => 'DHCP (automatische Zuweisung)';

  @override
  String get ipBasicsSection4SubBullet1 =>
      'Ein DHCP-Server \"gibt\": IP + Maske + Gateway + DNS.';

  @override
  String get ipBasicsSection4SubBullet2 =>
      'Praktisch: Du steckst ein, es funktioniert.';

  @override
  String get ipBasicsSection4SubBullet3 =>
      'Risk show: Wenn DHCP fällt / ändert / Konflikt → seltsame Symptome.';

  @override
  String get ipBasicsSection4Subtitle2 => 'Statisch (feste IP)';

  @override
  String get ipBasicsSection4SubBullet4 =>
      'Du legst IP + Maske (und eventuell Gateway/DNS) fest.';

  @override
  String get ipBasicsSection4SubBullet5 =>
      'Sehr nützlich für: Konsole, Nodes, Managed Switch, AP Wi-Fi show.';

  @override
  String get ipBasicsSection4SubBullet6 =>
      'Risiko: IP-Doppelung bei unklarem Plan (Konflikt).';

  @override
  String get ipBasicsSection4Callout1Title => 'Brücke (gateway)';

  @override
  String get ipBasicsSection4Bullet1 =>
      'Dies ist die Adresse des Routers: Sie wird verwendet, um \"außerhalb des lokalen Netzwerks\" zu gehen.';

  @override
  String get ipBasicsSection4Bullet2 =>
      'Wenn du ein isoliertes Show-Netzwerk (ohne Internet) machst, ist → Gateway oft unnötig.';

  @override
  String get ipBasicsSection4Bullet3 =>
      'Aber wenn du zu einem anderen VLAN / Internet hinausgehen willst → unerlässlich.';

  @override
  String get ipBasicsSection4Callout2Title => 'DNS';

  @override
  String get ipBasicsSection4Bullet4 =>
      'DNS = \"Verzeichnis\": wandelt einen Namen (z. B. example.com) in eine IP um.';

  @override
  String get ipBasicsSection4Bullet5 =>
      'In Show (Art-Net/sACN), oft unnötig: Du arbeitest mit direkter IP.';

  @override
  String get ipBasicsSection4Bullet6 =>
      'Wenn du Dienste nutzt (Updates, Lizenzen, Zeitserver, Streaming), wird → DNS wieder nützlich.';

  @override
  String get ipBasicsSection4Subtitle3 => 'Einfache Regel (anfängerfreundlich)';

  @override
  String get ipBasicsSection4SubBullet7 =>
      'Kleine geschlossene Show: überall statisch, kein Gateway, kein DNS.';

  @override
  String get ipBasicsSection4SubBullet8 =>
      'Show mit Internet / mehreren Netzwerken: kontrolliertes DHCP + DHCP-Reservierungen, oder statischer Plan + Router.';

  @override
  String get ipBasicsSection5Paragraph =>
      'Wenn A mit B sprechen will, schaut er auf die Maske :\n- Wenn B im selben Subnetz ist → A sendet direkt an das lokale Netzwerk.\n- Wenn B außerhalb des Subnetzes ist → A sendet an das Gateway (Router), das sich um den Rest kümmert.';

  @override
  String get ipBasicsSection5Callout1Title => 'Beispiel (leicht)';

  @override
  String get ipBasicsSection5Bullet1 => 'A = 192.168.0.10 /24';

  @override
  String get ipBasicsSection5Bullet2 =>
      'B = 192.168.0.50 /24 → gleiches Netzwerk → OK direkt.';

  @override
  String get ipBasicsSection5Bullet3 =>
      'B = 192.168.1.50 /24 → anderes Netzwerk → benötigt Router/Gateway.';

  @override
  String get ipBasicsSection5Subtitle => 'Warum \"pingt\" es nicht?';

  @override
  String get ipBasicsSection5SubBullet1 =>
      'Andere Maske → A denkt, dass B \"woanders\" ist (oder umgekehrt).';

  @override
  String get ipBasicsSection5SubBullet2 =>
      'Kein Gateway → unmöglich, das Subnetz zu verlassen.';

  @override
  String get ipBasicsSection5SubBullet3 =>
      'PC-Firewall → Ping blockiert (Windows sehr häufig).';

  @override
  String get ipBasicsSection5SubBullet4 =>
      'Kabel / Switch / VLAN: physisch nicht im selben Segment.';

  @override
  String get ipBasicsSection5Callout2Title =>
      'Broadcast vs. Unicast (nützlicher Bonus)';

  @override
  String get ipBasicsSection5Bullet4 =>
      'Unicast: zu einer bestimmten (sauberen) IP.';

  @override
  String get ipBasicsSection5Bullet5 =>
      'Broadcast: \"an alle\" im Subnetz (laut).';

  @override
  String get ipBasicsSection5Bullet6 =>
      'In show: broadcast kann in kleinen Netzwerken funktionieren, wird aber in großen Netzwerken schnell zur Lärmquelle.';

  @override
  String get ipBasicsSection6Subtitle1 =>
      'Plan A - ultraeinfach (nur ein Netzwerk /24)';

  @override
  String get ipBasicsSection6Code1 =>
      'Netzwerk: 192.168.10.0/24 (Maske 255.255.255.0)\n\nKonsole: 192.168.10.10\nPC (Steuerung): 192.168.10.20\nKnoten 1: 192.168.10.101\nKnoten 2: 192.168.10.102\nVerwalteter Switch: 192.168.10.2\nGateway: (leer) oder 192.168.10.1 falls Router vorhanden';

  @override
  String get ipBasicsSection6Callout1Title => 'Warum es gut funktioniert';

  @override
  String get ipBasicsSection6Bullet1 =>
      'Alle im selben Subnetz → keine Überraschung.';

  @override
  String get ipBasicsSection6Bullet2 =>
      'Einfach zu erklären, einfach zu beheben.';

  @override
  String get ipBasicsSection6Bullet3 =>
      'Ideal für Anfänger/kleine bis mittlere Show.';

  @override
  String get ipBasicsSection6Subtitle2 =>
      'Plan B - \"10.x\" wenn du erwachsen werden willst';

  @override
  String get ipBasicsSection6Code2 =>
      'Netzwerk: 10.10.0.0/16 (Maske 255.255.0.0)\n\nKonsole: 10.10.0.10\nPC: 10.10.0.20\nNodes: 10.10.1.10 → 10.10.1.200\nSwitch: 10.10.0.2';

  @override
  String get ipBasicsSection6Callout2Title => 'Wann man es verwendet';

  @override
  String get ipBasicsSection6Bullet4 =>
      'Wenn du viele Ausrüstungsgegenstände (oder mehrere Zonen) hast.';

  @override
  String get ipBasicsSection6Bullet5 =>
      'Wenn du VLANs für später planst (Licht/Video/IT).';

  @override
  String get ipBasicsSection6Subtitle3 =>
      'Plan C - Art-Net-Kompat \"2.x.x.x\" (Legacy)';

  @override
  String get ipBasicsSection6Code3 =>
      'Netzwerk: 2.0.0.0/8 (Maske 255.0.0.0)\n\nPC/Konsole: 2.0.0.10\nKnoten 1: 2.0.0.100\nKnoten 2: 2.0.0.101\n\n⚠️ Isoliertes Netzwerk, kein Internet, kein Routing.';

  @override
  String get ipBasicsSection6Callout3Title => 'Achtung';

  @override
  String get ipBasicsSection6Bullet6 =>
      'Dieser Plan ist praktisch für alte / standardmäßige Hardware.';

  @override
  String get ipBasicsSection6Bullet7 =>
      'Vermeide aber eine Vermischung mit einem \"normalen\" LAN (192.168.x.x) ohne Router.';

  @override
  String get ipBasicsSection7Callout1Title =>
      'Symptome → wahrscheinliche Ursachen';

  @override
  String get ipBasicsSection7Bullet1 =>
      '\"Ich sehe den Knoten, aber er reagiert nicht\" → unterschiedliche Maske / VLAN / Firewall.';

  @override
  String get ipBasicsSection7Bullet2 =>
      '\"Ein Gerät funktioniert und verschwindet dann\" → DHCP instabil / IP-Konflikt.';

  @override
  String get ipBasicsSection7Bullet3 =>
      '\"Nichts funktioniert außer am Switch\" → IP nicht im selben Netzwerk / falsches Kabel / VLAN-Port.';

  @override
  String get ipBasicsSection7Bullet4 =>
      '\"Alles rudert zurück / Verluste\" → Broadcast/Multicast zu breit / billiger Switch / Netzwerkschleife.';

  @override
  String get ipBasicsSection7Bullet5 =>
      '\"Es funktioniert mit Kabel, aber nicht mit Wi-Fi\" → Jitter / Roaming / gesättigtes Band / Stromsparen.';

  @override
  String get ipBasicsSection7Subtitle => 'Profi-Methode in 5 Minuten';

  @override
  String get ipBasicsSection7SubBullet1 =>
      '1) Sehen Sie sich IP + Maske der Konsole/PC und des Nodes an.';

  @override
  String get ipBasicsSection7SubBullet2 =>
      '2) Überprüfen: Gleiches Subnetz? (z. B. 192.168.10.x /24)';

  @override
  String get ipBasicsSection7SubBullet3 =>
      '3) Ping (wenn möglich) + Zugriffstest Webinterface des Nodes.';

  @override
  String get ipBasicsSection7SubBullet4 =>
      '4) Wenn DHCP: Listen Sie auf, wer welche IP hat (DHCP-Tabelle) und prüfen Sie auf Duplikate.';

  @override
  String get ipBasicsSection7SubBullet5 =>
      '5) Wenn sACN Multicast: IGMP snooping/querier überprüfen (sonst flood).';

  @override
  String get ipBasicsSection7Callout2Title => 'Sehr häufige Falle';

  @override
  String get ipBasicsSection7Bullet6 =>
      'Auf einem PC \"vererbte\" Maske (255.255.0.0 statt 255.255.255.0).';

  @override
  String get ipBasicsSection7Bullet7 =>
      'Ergebnis: Du glaubst, du bist \"im selben Netzwerk\", aber nicht wie das andere Gerät.';

  @override
  String get ipBasicsSection8Subtitle1 =>
      'Übung 1: Gleiches Netzwerk oder nicht? (/24)';

  @override
  String get ipBasicsSection8SubBullet1 => 'A = 192.168.10.50 /24';

  @override
  String get ipBasicsSection8SubBullet2 =>
      'B = 192.168.10.200 /24 → ✅ gleiches Netzwerk';

  @override
  String get ipBasicsSection8SubBullet3 =>
      'B = 192.168.11.200 /24 → ❌ nicht das gleiche Netzwerk';

  @override
  String get ipBasicsSection8Subtitle2 => 'Übung 2: /16 (255.255.0.0)';

  @override
  String get ipBasicsSection8SubBullet4 => 'A = 10.10.5.10 /16';

  @override
  String get ipBasicsSection8SubBullet5 =>
      'B = 10.10.200.20 /16 → ✅ gleiches Netzwerk (10.10.x.x)';

  @override
  String get ipBasicsSection8SubBullet6 =>
      'B = 10.11.200.20 /16 → ❌ nicht das gleiche Netzwerk';

  @override
  String get ipBasicsSection8CalloutTitle => 'Visueller Tipp';

  @override
  String get ipBasicsSection8Bullet1 =>
      '/24 → die ersten drei identischen Zahlen (A.B.C) = gleiches Netzwerk.';

  @override
  String get ipBasicsSection8Bullet2 =>
      '/16 → die ersten beiden identischen Zahlen (A.B) = gleiches Netzwerk.';

  @override
  String get ipBasicsSection8Bullet3 =>
      '/8 → die 1. identische Zahl (A) = gleiches Netzwerk.';

  @override
  String get ipBasicsSection8Subtitle3 =>
      'Übung 3: Vermeiden von \"seltsamen\" IPs';

  @override
  String get ipBasicsSection8SubBullet7 =>
      '0.x.x.x: reserviert (keine normale Host-IP).';

  @override
  String get ipBasicsSection8SubBullet8 =>
      '127.x.x.x: Loopback (dein PC selbst).';

  @override
  String get ipBasicsSection8SubBullet9 =>
      '169.254.x.x: Auto-IP, wenn DHCP nicht vorhanden (APIPA) → Anzeichen für ein DHCP-Problem.';

  @override
  String get ipBasicsSection9CalloutTitle =>
      'Bevor Sie 12 Uhr mittags um 14 Uhr suchen';

  @override
  String get ipBasicsSection9Bullet1 =>
      'Gleiches Subnetz = konsistente IP + Maske.';

  @override
  String get ipBasicsSection9Bullet2 => 'Keine doppelten IPs (Konflikt).';

  @override
  String get ipBasicsSection9Bullet3 =>
      'DHCP: OK, wenn beherrscht; ansonsten klarer statischer Plan.';

  @override
  String get ipBasicsSection9Bullet4 =>
      'PC-Firewall: Kann ping / discovery blockieren.';

  @override
  String get ipBasicsSection9Bullet5 =>
      'Switch/VLAN: richtiger Port, richtiges VLAN, keine Schleifen.';

  @override
  String get ipBasicsSection9Bullet6 =>
      'sACN Multicast: IGMP snooping/querier empfohlen.';

  @override
  String get ipBasicsChecklistCopy =>
      'Netzwerk - Schnellcheckliste (IP)\n☐ Alle Geräte befinden sich im selben Subnetz (IP + Maske konsistent).\n☐ Keine doppelten IPs (Konflikt).\n☐ DHCP: Entweder alle in DHCP oder klarer statischer Plan (unscharfe Mischung vermeiden).\n☐ Für Art-Net/sACN: Dediziertes Netzwerk oder VLAN, wenn möglich.\n☐ Managed Switch, wenn Multicast/IGMP (sACN).\n☐ Wi-Fi: Vermeiden für kritische Datenshow (Jitter), lieber kabelgebunden.\n☐ Einfacher Test: ping + Maske/Gateway prüfen';

  @override
  String get ipBasicsFooterNote =>
      'Ziel: genug verstehen, um schnell in einer Show zu verkabeln / zu konfigurieren / Fehler zu beheben.\nDie Netzwerkdetails können tiefer gehen, aber diese Grundlagen decken 90% der Feldausfälle ab.';

  @override
  String get aboutDmxPainterTerm120 => 'TERM\n120Ω';

  @override
  String get aboutDmxPainterDaisyChainNote =>
      '✅ Daisy-Chain\n❌ Passiver Y-Schritt';

  @override
  String get aboutDmxPainterXlr5Title => 'XLR5 (DMX) - schnelle Markierung';

  @override
  String get aboutDmxPainterPin1 => 'Pin 1: Schild / Masse';

  @override
  String get aboutDmxPainterPin2 => 'Pin 2: Data-';

  @override
  String get aboutDmxPainterPin3 => 'Pin 3: Data+';

  @override
  String get aboutDmxPainterPin45 => 'Pin 4/5: \"data 2\" (selten / optional)';

  @override
  String get aboutDmxPainterXlr3Practice =>
      'In der Praxis: XLR3 häufig verwendet (1/2/3)';

  @override
  String get aboutDmxPainterLastFixture => 'LETZTE\nGERÄT';

  @override
  String get aboutDmxPainterTerminationLine =>
      'Termination = 120Ω am Ende der Zeile';

  @override
  String get aboutDmxPainter120Between => '120Ω\nzwischen\nData- und Data+';

  @override
  String get aboutDmxPainterOneTermination =>
      '✅ Eine einzige Endung\n❌ Nicht in der Mitte\n❌ Schritt auf jedem Zweig';

  @override
  String get aboutDmxPainterConsoleIp => 'CONSOLE\nArt-Net / sACN';

  @override
  String get aboutDmxPainterSwitchSacn => 'SWITCH\n(IGMP für sACN)';

  @override
  String get aboutDmxPainterNode1 => 'NODE 1\nDMX OUT';

  @override
  String get aboutDmxPainterNode2 => 'NODE 2\nDMX OUT';

  @override
  String get aboutDmxPainterFix => 'FIX';

  @override
  String get aboutDmxPainterManyUniverses =>
      '✅ Viele Universen\n✅ Nodes in der Nähe von Maschinen';

  @override
  String get aboutArtnetSection2Paragraph =>
      'Dein Ziel: dass jedes von der Quelle gesendete Universum eindeutig beim richtigen Node (und beim richtigen DMX-Port) ankommt. Die meisten Art-Net-Ausfälle = falsches Universe, falsches Subnet/Net oder Broadcast, der überlastet ist.';

  @override
  String get aboutArtnetSection2CalloutTitle =>
      'Einfache Methode (die 80% der Fehler vermeidet)';

  @override
  String get aboutArtnetSection2Bullet1 =>
      '1) Schreibe auf Papier: \"Universum 1 → Node A port 1\", \"Universum 2 → Node A port 2\", etc.';

  @override
  String get aboutArtnetSection2Bullet2 =>
      '2) Setze stabile IPs (DHCP reserviert oder statisch).';

  @override
  String get aboutArtnetSection2Bullet3 =>
      '3) Bevorzuge Unicast, wenn du mehr als einen Knoten oder ein gemeinsames Netzwerk hast.';

  @override
  String get aboutArtnetSection2Subtitle1 => 'Broadcast vs. Unicast';

  @override
  String get aboutArtnetSection2SubBullet1 =>
      'Broadcast: Du sendest an alle → einfach, kann aber einen Switch \"fluten\".';

  @override
  String get aboutArtnetSection2SubBullet2 =>
      'Unicast: Du sendest an die IP des Knotens → sauberer und vorhersehbarer.';

  @override
  String get aboutArtnetSection2SubBullet3 =>
      'In show: Im Zweifelsfall → unicast.';

  @override
  String get aboutArtnetSection2Subtitle2 => 'Universum: Feldpraxis';

  @override
  String get aboutArtnetSection2SubBullet4 =>
      'Behält eine einfache Nummerierung bei (z. B. 1...N).';

  @override
  String get aboutArtnetSection2SubBullet5 =>
      'Vermeide \"ein Universum überall\": Dokumentiere deine Mappings.';

  @override
  String get aboutArtnetSection2SubBullet6 =>
      'Auf einigen Setups gibt es \"Net/Subnet/Universe\": denke \"Mapping\", nicht \"Magie\".';

  @override
  String get aboutArtnetSection3CalloutTitle =>
      'Die \"tatsächlichen\" Grenzen (in dieser Reihenfolge)';

  @override
  String get aboutArtnetSection3Bullet1 =>
      'Wi-Fi: Variable Latenz + → Flimmerverluste oder Dropouts.';

  @override
  String get aboutArtnetSection3Bullet2 =>
      'Broadcast: Überlastet ein LAN (jeder bekommt alles).';

  @override
  String get aboutArtnetSection3Bullet3 =>
      'Billig\"-Switch: begrenzte Puffer, schlechte Multicast-/Broadcast-Verwaltung.';

  @override
  String get aboutArtnetSection3Bullet4 =>
      'Nodes: Firmware/CPU-Limit (Anzahl der Universen, Frequenz, Optionen).';

  @override
  String get aboutArtnetSection3Bullet5 =>
      'PC/Quelle: Treiber, CPU-Auslastung, Antivirus, Netzwerkkarte usw.';

  @override
  String get aboutArtnetSection3Subtitle1 => 'Refresh-Geschwindigkeit';

  @override
  String get aboutArtnetSection3SubBullet1 =>
      'Das \"klassische\" DMX ist oft ~20-44 fps je nach Rahmen.';

  @override
  String get aboutArtnetSection3SubBullet2 =>
      'Auf IP kannst du mehr senden, aber die Knoten folgen nicht immer (und das ist auch nicht immer sinnvoll).';

  @override
  String get aboutArtnetSection3SubBullet3 =>
      'Stabilität > Frequenz: Besser stabil bei 30-40 fps als \"schnell\", aber instabil.';

  @override
  String get aboutArtnetSection3Subtitle2 => 'Einfache Regeln';

  @override
  String get aboutArtnetSection3SubBullet4 =>
      'Dediziertes Netzwerk (oder VLAN).';

  @override
  String get aboutArtnetSection3SubBullet5 => 'Unicast, wenn mehrere Nodes.';

  @override
  String get aboutArtnetSection3SubBullet6 =>
      'Kabelgebunden für kritische Shows.';

  @override
  String get aboutArtnetSection4Paragraph =>
      'Ein Knoten = IP → DMX. Er kann 1, 2, 4, 8 DMX-Ports haben. Die Stabilität hängt vom Node UND der ausgangsseitigen DMX-Verkabelung (Terminierung, Topologie, Splitter) ab.';

  @override
  String get aboutArtnetSection4Subtitle1 => 'Nodes vs. Splitters';

  @override
  String get aboutArtnetSection4SubBullet1 =>
      'Node: Wandelt IP→DMX (und manchmal DMX→IP) um.';

  @override
  String get aboutArtnetSection4SubBullet2 =>
      'DMX-Splitter: Verteilt eine DMX-Leitung in Zweige (Opto empfohlen).';

  @override
  String get aboutArtnetSection4SubBullet3 =>
      'Gutes Design: IP bis zum nächsten, dann DMX kurz und sauber.';

  @override
  String get aboutArtnetSection4CalloutTitle =>
      'RDM auf Art-Net (variable Unterstützung)';

  @override
  String get aboutArtnetSection4Bullet1 =>
      'Einige Nodes unterstützen einen \"RDM-Proxy\": Die Konsole sieht/konfiguriert RDM-Geräte über IP.';

  @override
  String get aboutArtnetSection4Bullet2 =>
      'Andere unterstützen RDM überhaupt nicht oder nur teilweise.';

  @override
  String get aboutArtnetSection4Bullet3 =>
      'Ein \"klassischer\" Opto-Splitter kann den RDM-Rückkanal blockieren (je nach Modell).';

  @override
  String get aboutArtnetSection4Bullet4 =>
      'Tipp: Wenn du RDM willst, wähle explizit Hardware, die als RDM-kompatibel gekennzeichnet ist.';

  @override
  String get aboutArtnetSection4Subtitle2 => 'Guter Feldreflex';

  @override
  String get aboutArtnetSection4SubBullet4 =>
      'Wenn DMX instabil ist: DMX-Regel zuerst (Terminierung, Kabel, passives Y), dann nur IP.';

  @override
  String get aboutArtnetSection4SubBullet5 =>
      'Wenn RDM instabil: Schaltet RDM aus, um zu überprüfen, ob das reine DMX stabil ist.';

  @override
  String get aboutArtnetSection5CalloutTitle =>
      'Symptome → wahrscheinliche Ursachen';

  @override
  String get aboutArtnetSection5Bullet1 =>
      'Flicker über das ganze Set → Wi-Fi, Broadcast Flood, Switch überlastet.';

  @override
  String get aboutArtnetSection5Bullet2 =>
      'Ein Knoten OK, der andere nicht → univers/mapping, IP, unicast falsch konfiguriert.';

  @override
  String get aboutArtnetSection5Bullet3 =>
      'Zufällige Abbrüche → Defektes RJ45-Kabel, instabiler Switch, PC droppt Pakete.';

  @override
  String get aboutArtnetSection5Bullet4 =>
      'Nur ein DMX-Port eines KO-Nodes → DMX-Kabel, Terminierung, Gerät, das die Leitung bricht.';

  @override
  String get aboutArtnetSection5Bullet5 =>
      'RDM discovery unmöglich → node/splitter nicht RDM-kompatibel, DMX-Verkabelung \"borderline\".';

  @override
  String get aboutArtnetSection5Subtitle => 'Schnelle Methode';

  @override
  String get aboutArtnetSection5SubBullet1 =>
      '1) Schaltet auf Unicast zu einem einzelnen Knoten um (einfacher Test).';

  @override
  String get aboutArtnetSection5SubBullet2 =>
      '2) Überprüft Universum/Mapping (Papier + Node Config).';

  @override
  String get aboutArtnetSection5SubBullet3 =>
      '3) Test bei direkter Verkabelung (PC → Switch → Node) mit bekanntem Kabel OK.';

  @override
  String get aboutArtnetSection5SubBullet4 =>
      '4) Isoliere das DMX: Node → 1 Gerät + Terminierung.';

  @override
  String get aboutArtnetSection6Subtitle1 =>
      'Eigene Architektur (IP → Knoten → DMX kurz)';

  @override
  String get aboutArtnetSection6Subtitle2 => 'Broadcast vs. Unicast (Idee)';

  @override
  String get aboutArtnetAssetsCopyTitle => 'Empfohlene Assets (optional)';

  @override
  String get aboutArtnetExampleLabel => 'Beispiel';

  @override
  String get aboutArtnetAssetsCopyTooltip => 'Asset-Liste kopieren';

  @override
  String get aboutArtnetAssetsParagraph =>
      'Abschnitt, der zur Veranschaulichung des Netzwerks (RJ45, Switch, Kabel) vorgesehen ist. Wenn die Assets nicht vorhanden sind, zeigt die App einen eigenen Fallback an.';

  @override
  String get aboutArtnetAssetsExamplesTitle => 'Beispiele';

  @override
  String get aboutArtnetAssetsRj45Label => 'RJ45';

  @override
  String get aboutArtnetAssetsRj45Hint => 'Ethernet-Anschluss';

  @override
  String get aboutArtnetAssetsSwitchLabel => 'Switch';

  @override
  String get aboutArtnetAssetsSwitchHint =>
      'Switch (idealerweise verwaltet, wenn IGMP/VLAN)';

  @override
  String get aboutArtnetAssetsCableLabel => 'Ethernet-Kabel';

  @override
  String get aboutArtnetAssetsCableHint =>
      'Cat5e/Cat6 = zuverlässige Grundlage';

  @override
  String get aboutArtnetChecklistCopyTitle => 'Art-Net - Checkliste Gelände';

  @override
  String get aboutArtnetChecklistCopyTooltip => 'Kopieren der Checkliste';

  @override
  String get aboutArtnetChecklistTitle => 'Bevor Sie in Panik geraten';

  @override
  String get aboutArtnetChecklistBullet1 => 'Unicast, wenn mehrere Nodes.';

  @override
  String get aboutArtnetChecklistBullet2 =>
      'Dediziertes Netzwerk (oder VLAN), wenn möglich.';

  @override
  String get aboutArtnetChecklistBullet3 => 'Draht für kritische Show.';

  @override
  String get aboutArtnetChecklistBullet4 => 'Dokumentiertes Universum/Mapping.';

  @override
  String get aboutArtnetChecklistBullet5 =>
      'Einfacher IP-Test → 1 Node → 1 Gerät + Terminierung.';

  @override
  String get aboutArtnetChecklistBullet6 =>
      'Wenn RDM: bestätigter \"RDM Proxy\"-Node + stabile DMX-Verkabelung';

  @override
  String get aboutArtnetFooterNote =>
      'Indikative Info (Feld). Je nach Node/Switch/Firmware kann das Verhalten variieren.\nZiel hier: schnell verstehen und diagnostizieren.';

  @override
  String get aboutArtnetDiagramSourceLabel => 'QUELLE\n(PC/Konsole)';

  @override
  String get aboutArtnetDiagramSwitchLabel => 'SWITCH';

  @override
  String get aboutArtnetDiagramNode1Label => 'NODE 1\nDMX OUT';

  @override
  String get aboutArtnetDiagramNode2Label => 'NODE 2\nDMX OUT';

  @override
  String get aboutArtnetDiagramFixLabel => 'FIX';

  @override
  String get aboutArtnetDiagramInfoLabel => 'IP lang / DMX kurz';

  @override
  String get aboutArtnetDiagramSourceShortLabel => 'QUELLE';

  @override
  String get aboutArtnetDiagramNodeALabel => 'NODE A';

  @override
  String get aboutArtnetDiagramNodeBLabel => 'NODE B';

  @override
  String get aboutArtnetDiagramNodeCLabel => 'NODE C';

  @override
  String get aboutArtnetDiagramUnicastLabel =>
      'Unicast: Pakete zu einem Knoten';

  @override
  String get aboutArtnetDiagramBroadcastLabel => 'Broadcast: Jeder erhält';

  @override
  String get aboutArtnetMissingAssetLabel => 'Fehlendes Asset';

  @override
  String get aboutRegistryDmxTitle =>
      'DMX - Funktionsweise (einfach & komplett)';

  @override
  String get aboutRegistryDmxSubtitle =>
      'Universum, Adressen, Frames, RS-485-Verkabelung, Terminierung, Feldfehler.\nEnthält Diagramme + Checkliste.';

  @override
  String get aboutRegistryArtnetTitle =>
      'Art-Net - DMX über IP (Knoten, Unicast/Broadcast)';

  @override
  String get aboutRegistryArtnetSubtitle =>
      'Univers DMX sur Ethernet/UDP, nodes, broadcast vs unicast.\nLimites réelles, stabilité réseau, RDM selon matériel, schémas + checklist.';

  @override
  String get aboutRegistrySacnTitle =>
      'sACN / E1.31 — multicast, IGMP, priorités';

  @override
  String get aboutRegistrySacnSubtitle =>
      'Standard DMX sur IP orienté réseau pro.\nMulticast/unicast, IGMP snooping/querier, priorités multi-sources, schémas + checklist.';

  @override
  String get aboutRegistryIpBasicsTitle =>
      'Réseau — bases IP / masque / DHCP (essentiel)';

  @override
  String get aboutRegistryIpBasicsSubtitle =>
      'Comprendre IP, masque, passerelle, DHCP vs statique.\nExemples concrets (2.x.x.x, 10.x, 192.168.x), tests rapides, pièges show.';

  @override
  String get aboutRegistryReseauTitle =>
      'Réseau — RJ45 / Fibre / débits & longueurs';

  @override
  String get aboutRegistryReseauSubtitle =>
      'Cat5e→Cat8, fibre OM3/OM4/OS2, LC/SC/MPO, distances typiques, bonnes pratiques show.';

  @override
  String get aboutRegistryNetworkTitle =>
      'Réseau lumière — VLAN, IGMP, Wi-Fi vs filaire';

  @override
  String get aboutRegistryNetworkSubtitle =>
      'Architecture simple et robuste pour Art-Net/sACN.\nVLAN, IGMP snooping/querier, Wi-Fi (jitter), switchs, schémas + checklist.';

  @override
  String get aboutRegistryVideoTitle => 'Vidéo — SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutRegistryVideoSubtitle =>
      'Choisir selon latence, fiabilité, câblage, réseau LAN vs WAN.\nTableaux + schéma.';

  @override
  String get aboutRegistryElectriciteTitle =>
      'Électrique — Schuko / P17 / puissances';

  @override
  String get aboutRegistryElectriciteSubtitle =>
      'Connecteurs, mono/tri, tableaux kW rapides (16A→400A), pièges terrain.';

  @override
  String get aboutRegistryInformatiqueTitle =>
      'Informatique — USB / HDMI / DP / SATA / NVMe…';

  @override
  String get aboutRegistryInformatiqueSubtitle =>
      'Débits utiles, versions, limites réelles, pièges marketing.';

  @override
  String get aboutUniverseToHexColHex => 'Hex';

  @override
  String get aboutUniverseToHexNote => 'Index = Univers − 1 (base 0).';

  @override
  String get aboutNetworkPageTitle => 'Réseau lumière — VLAN, IGMP, Wi-Fi';

  @override
  String get aboutNetworkCopyTooltip => 'Copier repères';

  @override
  String get aboutNetworkChecklistCopyTooltip => 'Copier';

  @override
  String get aboutNetworkChecklistTitle => 'Avant d’ouvrir Wireshark 😄';

  @override
  String get aboutNetworkFooterNote =>
      'Info indicative (terrain). Selon le matériel réseau, IGMP/VLAN peuvent être indispensables.\nObjectif : rester simple et robuste.';

  @override
  String get aboutNetworkCopy1 =>
      'Réseau lumière: viser simple, dédié, et stable.';

  @override
  String get aboutNetworkCopy2 =>
      'VLAN = séparer le trafic (lumière vs reste).';

  @override
  String get aboutNetworkCopy3 =>
      'IGMP = indispensable si sACN multicast à grande échelle.';

  @override
  String get aboutNetworkCopy4 =>
      'Wi-Fi = ok dépannage, rarement ok en prod critique.';

  @override
  String get aboutNetworkChecklistCopy =>
      'Réseau lumière — Checklist\n☐ Réseau dédié ou VLAN lumière\n☐ Plan IP clair (DHCP ou statique) + masque ok\n☐ Switch correct; boucles évitées\n☐ sACN multicast: IGMP snooping ON\n☐ IGMP querier présent dans le VLAN (si infra le nécessite)\n☐ Unicast en dépannage (surtout Art-Net)\n☐ Wi-Fi: éviter prod critique (jitter/pertes)\n☐ Tests: ping stable + charge progressive (univers)';

  @override
  String get aboutNetworkToc1 => '1) Objectif: réseau stable';

  @override
  String get aboutNetworkToc2 => '2) Plan IP (simple)';

  @override
  String get aboutNetworkToc3 => '3) VLAN (séparation)';

  @override
  String get aboutNetworkToc4 => '4) IGMP (sACN Multicast)';

  @override
  String get aboutNetworkToc5 => '5) Wi-Fi vs. verkabelt';

  @override
  String get aboutNetworkToc6 => '6) Switch: Was Sie brauchen';

  @override
  String get aboutNetworkToc7 => '7) Schemata';

  @override
  String get aboutNetworkToc8 => '8) Checkliste';

  @override
  String get aboutNetworkBasicsPill1 => 'Dediziert/VLAN';

  @override
  String get aboutNetworkBasicsPill2 => 'Drahtgebunden';

  @override
  String get aboutNetworkBasicsPill3 => 'IGMP wenn Multicast';

  @override
  String get aboutNetworkBasicsParagraph =>
      'Ein Lichtnetz muss vorhersehbar sein: geringer Verlust, geringer Jitter, einfache Architektur. Wenn es zu Fehlern kommt, liegt es selten am \"Protokoll\" und oft an der Infrastruktur (Switch, Wi-Fi, Schleifen, Flood).';

  @override
  String get aboutNetworkBasicsCalloutTitle => 'Grundregel';

  @override
  String get aboutNetworkBasicsBullet1 =>
      'Si tu peux: filaire + switch correct + réseau dédié (ou VLAN).';

  @override
  String get aboutNetworkBasicsBullet2 =>
      'Si tu dois partager: VLAN + règles claires.';

  @override
  String get aboutNetworkBasicsBullet3 =>
      'sACN multicast: IGMP devient vite obligatoire.';

  @override
  String get aboutNetworkPlanIpParagraph =>
      'Choisis une stratégie simple et cohérente. Deux approches: DHCP (simple) ou statique (prévisible). Le pire: un mélange non documenté.';

  @override
  String get aboutNetworkPlanIpCalloutTitle => 'Exemple de plan (simple)';

  @override
  String get aboutNetworkPlanIpBullet1 => 'VLAN lumière: 10.10.0.0/24';

  @override
  String get aboutNetworkPlanIpBullet2 => 'Console/PC: 10.10.0.10';

  @override
  String get aboutNetworkPlanIpBullet3 => 'Nodes: 10.10.0.100–150';

  @override
  String get aboutNetworkPlanIpBullet4 => 'Switch mgmt: 10.10.0.2';

  @override
  String get aboutNetworkPlanIpSubtitle => 'Erreurs classiques';

  @override
  String get aboutNetworkPlanIpSubBullet1 =>
      'Masque différent (ex: /24 vs /16) → machines invisibles.';

  @override
  String get aboutNetworkPlanIpSubBullet2 =>
      'Deux appareils même IP → comportement aléatoire.';

  @override
  String get aboutNetworkPlanIpSubBullet3 =>
      'DHCP + statique sur même range sans contrôle → conflits.';

  @override
  String get aboutNetworkVlanParagraph =>
      'Un VLAN te permet d’isoler la lumière du reste (internet, production vidéo, invités…). Ça évite le bruit réseau et réduit le risque qu’un autre service casse ton show.';

  @override
  String get aboutNetworkVlanCalloutTitle => 'Ce que tu gagnes';

  @override
  String get aboutNetworkVlanBullet1 => 'Moins de trafic parasite.';

  @override
  String get aboutNetworkVlanBullet2 =>
      'Moins de risques (DHCP externe, broadcast non désiré).';

  @override
  String get aboutNetworkVlanBullet3 =>
      'Debug plus simple (tout ce qui est dans le VLAN = lumière).';

  @override
  String get aboutNetworkVlanSubtitle => 'Attention';

  @override
  String get aboutNetworkVlanSubBullet1 =>
      'Un VLAN = il faut que tous les ports soient bien configurés (access/trunk).';

  @override
  String get aboutNetworkVlanSubBullet2 =>
      'Si tu ne maîtrises pas: réseau dédié “physique” est souvent plus simple.';

  @override
  String get aboutNetworkIgmpPill1 => 'IGMP snooping';

  @override
  String get aboutNetworkIgmpPill2 => 'IGMP querier';

  @override
  String get aboutNetworkIgmpPill3 => 'Multicast flood';

  @override
  String get aboutNetworkIgmpParagraph =>
      'IGMP snooping permet au switch de savoir quels ports veulent quel multicast. Sans ça, le multicast peut être inondé sur tous les ports → saturation.';

  @override
  String get aboutNetworkIgmpCalloutTitle => 'IGMP querier (idée simple)';

  @override
  String get aboutNetworkIgmpBullet1 =>
      'Dans certains réseaux/VLAN, il faut un querier pour maintenir les abonnements IGMP.';

  @override
  String get aboutNetworkIgmpBullet2 =>
      'Sans querier: selon les switchs, les abonnements expirent et tu vois des “glitches”.';

  @override
  String get aboutNetworkIgmpBullet3 =>
      'Si tu es en petit réseau dédié: parfois tout marche, mais en gros réseau: c’est critique.';

  @override
  String get aboutNetworkIgmpSubtitle => 'Schéma : IGMP (idée)';

  @override
  String get aboutNetworkWifiSubtitle1 => 'Filaire';

  @override
  String get aboutNetworkWifiSubtitle2 => 'Wi-Fi';

  @override
  String get aboutNetworkWifiSubBullet1 =>
      '✅ Latence stable, pertes faibles (si infra propre).';

  @override
  String get aboutNetworkWifiSubBullet2 => '✅ Recommandé en prod.';

  @override
  String get aboutNetworkWifiSubBullet3 =>
      '✅ Pratique (setup rapide, tablette).';

  @override
  String get aboutNetworkWifiSubBullet4 =>
      '❌ Latence variable (jitter), pertes, interférences.';

  @override
  String get aboutNetworkWifiSubBullet5 =>
      '❌ Multicast parfois mal géré selon AP/config.';

  @override
  String get aboutNetworkWifiSubBullet6 =>
      'OK dépannage / petites configs non critiques, rarement OK en show chargé.';

  @override
  String get aboutNetworkWifiCalloutTitle => 'Règle simple';

  @override
  String get aboutNetworkWifiBullet1 => 'Show critique = filaire.';

  @override
  String get aboutNetworkWifiBullet2 =>
      'Wi-Fi = confort opérateur (UI), pas transport principal DMX/IP si gros volume.';

  @override
  String get aboutNetworkSwitchCalloutTitle => 'Minimum recommandé';

  @override
  String get aboutNetworkSwitchBullet1 => 'Switch Ethernet correct (pas hub).';

  @override
  String get aboutNetworkSwitchBullet2 => 'Câbles OK (RJ45, connecteurs).';

  @override
  String get aboutNetworkSwitchBullet3 => 'Éviter boucles (ou STP maîtrisé).';

  @override
  String get aboutNetworkSwitchBullet4 => 'Si sACN multicast: IGMP snooping.';

  @override
  String get aboutNetworkSwitchSubtitle => 'Managed vs unmanaged';

  @override
  String get aboutNetworkSwitchSubBullet1 =>
      'Unmanaged: ok petit réseau dédié (simple).';

  @override
  String get aboutNetworkSwitchSubBullet2 =>
      'Managed: utile pour VLAN/IGMP/diagnostics (gros réseau).';

  @override
  String get aboutNetworkDiagramsSubtitle1 => 'VLAN: séparer lumière / reste';

  @override
  String get aboutNetworkDiagramsSubtitle2 => 'Wi-Fi vs filaire (idée)';

  @override
  String get aboutNetworkChecklistBullet1 => 'Plan IP clair, masque cohérent.';

  @override
  String get aboutNetworkChecklistBullet2 => 'Réseau dédié / VLAN lumière.';

  @override
  String get aboutNetworkChecklistBullet3 => 'Switch OK, pas de boucles.';

  @override
  String get aboutNetworkChecklistBullet4 => 'IGMP pour sACN multicast.';

  @override
  String get aboutNetworkChecklistBullet5 => 'Wi-Fi évité en prod critique.';

  @override
  String get videoCameraExposureTitle => 'Exposition caméra';

  @override
  String get videoCameraExposureSubtitle =>
      'Lux → EV, ISO, vitesse et ouverture.';

  @override
  String get videoCamPageTitle => 'Exposition caméra';

  @override
  String get videoCamInfoTitle => 'Info';

  @override
  String get videoCamIntro =>
      'Calculs indicatifs pour relier lux, ISO, vitesse et ouverture.';

  @override
  String get videoCamInputsTitle => 'Entrées';

  @override
  String get videoCamLuxLabel => 'Lux';

  @override
  String get videoCamLuxHint => 'Ex: 500';

  @override
  String get videoCamIsoLabel => 'ISO';

  @override
  String get videoCamIsoHint => 'Ex: 800';

  @override
  String get videoCamShutterLabel => 'Vitesse (s)';

  @override
  String get videoCamShutterHint => 'Ex: 1/50';

  @override
  String get videoCamApertureLabel => 'Ouverture (f/)';

  @override
  String get videoCamApertureHint => 'Ex: 2.8';

  @override
  String get videoCamEvEmpty => '—';

  @override
  String get videoCamNote =>
      'Valeurs indicatives : la calibration dépend du capteur, de la scène et des normes.';

  @override
  String videoCamEvValue(Object ev) {
    return 'EV $ev';
  }

  @override
  String videoCamApertureResult(Object aperture) {
    return 'Ouverture : f/$aperture';
  }

  @override
  String videoCamShutterResult(Object shutter) {
    return 'Vitesse : $shutter s';
  }

  @override
  String get aboutDmxS2Title => '2) Trame DMX — break, start code, canaux';

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
      'Une trame DMX est envoyée en boucle. Elle commence par un « break » (silence), puis un start code, puis jusqu’à 512 valeurs (0–255). Chaque appareil lit uniquement les canaux qui le concernent (selon son adresse et son mode).';

  @override
  String get aboutDmxS2HowToReadTitle => 'Lire une trame (très simplement)';

  @override
  String get aboutDmxS2HowToReadB1 =>
      'Break + MAB : marque le début de la trame (resynchronisation).';

  @override
  String get aboutDmxS2HowToReadB2 =>
      'Start code : le plus souvent 0x00 (données d’éclairage).';

  @override
  String get aboutDmxS2HowToReadB3 =>
      'Slots 1→512 : chaque slot = 1 canal (0–255).';

  @override
  String get aboutDmxS2HowToReadB4 =>
      'La trame recommence en continu : c’est normal d’« écraser » l’ancienne valeur.';

  @override
  String get aboutDmxS2PracticalTitle => 'En pratique';

  @override
  String get aboutDmxS2PracticalB1 =>
      'Un mode 16-bit utilise 2 canaux pour une même fonction (ex: Pan coarse + Pan fine).';

  @override
  String get aboutDmxS2PracticalB2 =>
      'Plus tu envoies d’univers, plus la charge globale (consoles/nodes/réseau) augmente.';

  @override
  String get aboutDmxS2PracticalB3 =>
      'Si tu as du flicker, pense d’abord câble/termination/branchements avant de soupçonner la console.';

  @override
  String get aboutDmxS3Title => '3) Câblage DMX — RS-485, topologie, pinout';

  @override
  String get aboutDmxS3PillRs485 => 'RS-485';

  @override
  String get aboutDmxS3PillDaisyChain => 'Daisy-chain';

  @override
  String get aboutDmxS3PillNoY => 'Pas de Y';

  @override
  String get aboutDmxS3Pill120ohm => '120 Ω';

  @override
  String get aboutDmxS3Intro =>
      'DMX512 est basé sur RS-485 : un bus différentiel qui aime les lignes propres. La règle d’or : une chaîne (daisy-chain) de la source vers les appareils, puis une terminaison à la fin.';

  @override
  String get aboutDmxS3TopologyTitle => 'Topologie recommandée';

  @override
  String get aboutDmxS3TopologyB1 =>
      'Source → Appareil 1 → Appareil 2 → … → dernier appareil.';

  @override
  String get aboutDmxS3TopologyB2 =>
      'Évite les dérivations en Y : elles créent des réflexions (instabilité).';

  @override
  String get aboutDmxS3TopologyB3 =>
      'Si tu dois faire des branches : utilise un splitter DMX opto-isolé.';

  @override
  String get aboutDmxS3PinoutTitle => 'Connectique (rappel)';

  @override
  String get aboutDmxS3CablesTitle => 'Câbles : ce qui marche vraiment';

  @override
  String get aboutDmxS3CablesB1 =>
      'Utilise un câble DMX (impédance ~120 Ω), pas un micro aléatoire (sauf dépannage court).';

  @override
  String get aboutDmxS3CablesB2 =>
      'Garde les longueurs raisonnables et évite les enroulements serrés près d’alim/gradateurs.';

  @override
  String get aboutDmxS3CablesB3 =>
      'Un mauvais câble = parfois « ça marche »… jusqu’au jour où non (humidité, longueur, charge).';

  @override
  String get aboutDmxS4Title => '4) Terminaison & splitters — stabilité du bus';

  @override
  String get aboutDmxS4Intro =>
      'Sur un bus RS-485, la terminaison évite les réflexions en bout de ligne. Les splitters (opto-isolés) servent à créer des branches propres et à protéger la source.';

  @override
  String get aboutDmxS4TerminatorTitle =>
      'Terminaison (120 Ω) : quand et comment';

  @override
  String get aboutDmxS4TerminatorB1 =>
      'Met une terminaison sur le dernier appareil (ou un bouchon XLR).';

  @override
  String get aboutDmxS4TerminatorB2 =>
      'Une seule terminaison par ligne (pas partout).';

  @override
  String get aboutDmxS4TerminatorB3 =>
      'Indispensable sur longues lignes, grosses charges, environnements bruyants.';

  @override
  String get aboutDmxS4SplittersTitle => 'Splitters / opto-isolation';

  @override
  String get aboutDmxS4SplittersB1 =>
      'Permet de faire 2, 4, 8 branches sans « Y ».';

  @override
  String get aboutDmxS4SplittersB2 =>
      'Isole électriquement : limite les boucles de masse et protège la console/node.';

  @override
  String get aboutDmxS4SplittersB3 =>
      'Pratique pour “re-driver” un signal sur de longues distances.';

  @override
  String get aboutDmxS5Title =>
      '5) Dépannage — méthode simple (rapide et fiable)';

  @override
  String get aboutDmxS5Intro =>
      'Quand un appareil ne répond pas, la clé est d’isoler : est-ce l’adresse, le mode, la ligne DMX, ou l’appareil ? Suis une checklist courte avant de tout reconfigurer.';

  @override
  String get aboutDmxS5QuickChecksTitle => 'Checklist rapide';

  @override
  String get aboutDmxS5QuickB1 =>
      'Adresse DMX correcte ? (et pas 001 vs 000 selon l’écran).';

  @override
  String get aboutDmxS5QuickB2 => 'Bon mode DMX (nombre de canaux) ?';

  @override
  String get aboutDmxS5QuickB3 =>
      'Bon univers / sortie (console, node, port) ?';

  @override
  String get aboutDmxS5QuickB4 =>
      'Teste avec un câble connu OK, puis en remplaçant un par un.';

  @override
  String get aboutDmxS5QuickB5 =>
      'Ajoute/retire une terminaison au bout de la ligne pour voir l’effet.';

  @override
  String get aboutDmxS5IfFlickerTitle => 'Si ça flicker / décroche';

  @override
  String get aboutDmxS5IfFlickerB1 =>
      'Cherche un “Y” caché, un splitter non adapté, ou un mauvais adaptateur XLR.';

  @override
  String get aboutDmxS5IfFlickerB2 =>
      'Éloigne DMX des alimentations/gradateurs, évite les grandes boucles de câble.';

  @override
  String get aboutDmxS5IfFlickerB3 =>
      'Réduis la complexité : 1 univers, 1 ligne, 1 appareil, puis tu reconstruis.';

  @override
  String get aboutDmxS5GoldenRuleTitle => 'Règle d’or';

  @override
  String get aboutDmxS5GoldenRuleBody =>
      'Tu dois pouvoir faire fonctionner un seul appareil sur une seule ligne. Si ce test de base échoue, le problème n’est pas « le patch complet » : c’est l’adressage, le câblage, ou le matériel.';

  @override
  String get aboutDmxS6Title =>
      '6) Art-Net — DMX sur IP (vocabulaire et pièges)';

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
      'Art-Net transporte des univers DMX via Ethernet (UDP). Une console/logiciel envoie des univers sur le réseau, et un node les convertit en sorties DMX physiques.';

  @override
  String get aboutDmxS6BasicsTitle => 'À retenir';

  @override
  String get aboutDmxS6BasicsB1 => 'Un node = réseau ↔ DMX (plusieurs ports).';

  @override
  String get aboutDmxS6BasicsB2 =>
      'Broadcast envoie à tout le monde (simple mais peut saturer).';

  @override
  String get aboutDmxS6BasicsB3 =>
      'Unicast envoie seulement au node ciblé (souvent plus stable sur gros rigs).';

  @override
  String get aboutDmxS6BasicsB4 =>
      'Attention au comptage d’univers : souvent Art-Net commence à 0 (Univers 1 DMX = 0 Art-Net).';

  @override
  String get aboutDmxS6WhenTitle => 'Quand choisir Art-Net ?';

  @override
  String get aboutDmxS6WhenB1 =>
      'Petits/moyens rigs, set-ups rapides, beaucoup de matériel compatible.';

  @override
  String get aboutDmxS6WhenB2 =>
      'OK si le réseau est propre (switch correct, câbles, pas de Wi-Fi).';

  @override
  String get aboutDmxS6WhenB3 =>
      'Si ça sature : passe en unicast et segmente le réseau (VLAN / réseau dédié).';

  @override
  String get aboutDmxS7Title =>
      '7) sACN (E1.31) — multicast, priorités, réseau propre';

  @override
  String get aboutDmxS7PillE131 => 'E1.31';

  @override
  String get aboutDmxS7PillMulticast => 'Multicast';

  @override
  String get aboutDmxS7PillPriority => 'Priorité';

  @override
  String get aboutDmxS7PillIgmp => 'IGMP';

  @override
  String get aboutDmxS7Intro =>
      'sACN (ANSI E1.31) est un standard moderne pour transporter des univers DMX sur IP. Il est très utilisé en grands systèmes car il gère bien le multicast et les priorités.';

  @override
  String get aboutDmxS7KeyIdeasTitle => 'Idées clés';

  @override
  String get aboutDmxS7KeyIdeasB1 =>
      'Multicast : un univers est un “groupe” réseau (les nodes s’abonnent).';

  @override
  String get aboutDmxS7KeyIdeasB2 =>
      'IGMP snooping sur les switches = indispensable à grande échelle (sinon ça inonde).';

  @override
  String get aboutDmxS7KeyIdeasB3 =>
      'Priorité : plusieurs sources possibles, celle avec la plus haute priorité gagne.';

  @override
  String get aboutDmxS7KeyIdeasB4 =>
      'Comme Art-Net : réseau propre + câbles/switch de qualité = stabilité.';

  @override
  String get aboutDmxS8Title =>
      '8) DMX vs Art-Net vs sACN — résumé (quoi choisir ?)';

  @override
  String get aboutDmxS8Intro =>
      'Les trois font la même chose au final : piloter des canaux. La différence se joue sur la distribution (câble DMX vs réseau), l’échelle, et la robustesse.';

  @override
  String get aboutDmxS8QuickTableTitle => 'Résumé en 4 lignes';

  @override
  String get aboutDmxS8QuickB1 =>
      'DMX : simple, robuste, 1 câble = 1 ligne (512 canaux).';

  @override
  String get aboutDmxS8QuickB2 =>
      'Art-Net : très courant, facile à déployer, attention au broadcast.';

  @override
  String get aboutDmxS8QuickB3 =>
      'sACN : plus “pro grands systèmes”, multicast + priorités, demande un réseau bien configuré.';

  @override
  String get aboutDmxS8QuickB4 =>
      'Dans tous les cas : documentation + test progressif = gain de temps énorme.';

  @override
  String get aboutDmxS8ChooseTitle => 'Choix rapide';

  @override
  String get aboutDmxS8ChooseB1 =>
      'Petit set-up : DMX direct ou Art-Net (simple).';

  @override
  String get aboutDmxS8ChooseB2 =>
      'Beaucoup d’univers : réseau dédié + nodes ; Art-Net en unicast ou sACN.';

  @override
  String get aboutDmxS8ChooseB3 =>
      'Très gros rigs / infrastructures : sACN + switches/IGMP bien gérés.';

  @override
  String get aboutSunTimesTitle => 'Soleil (lever / coucher)';

  @override
  String get aboutSunTimesSubtitle =>
      'Choix d’une ville et d’une date, heures de lever/coucher + seuils (lux).';

  @override
  String get homeBpmTitle => 'BPM';

  @override
  String get aboutReseauPageTitle => 'Réseau — repères terrain';

  @override
  String get aboutReseauSummaryCopy =>
      'RÉSEAU — repères terrain\n• RJ45 : Cat5e/6/6A → 1G/10G selon distance.\n• Fibre : longue distance + immunité EMI.\n• Switch : IGMP important pour sACN multicast.\n• VLAN : séparer lumière/vidéo/IT = stabilité.';

  @override
  String get aboutReseauChecklistCopy =>
      'RÉSEAU — Checklist\n☐ Plan IP clair (plage / masques)\n☐ Switch correct (IGMP si sACN multicast)\n☐ VLAN si plusieurs “mondes” (lumière/vidéo/IT)\n☐ Câbles testés + étiquetés\n☐ Fibre : modules compatibles + connecteurs propres\n☐ Éviter boucles (STP) + éviter Wi-Fi public sur show LAN';

  @override
  String get aboutReseauChecklistCopyTooltip => 'Copier';

  @override
  String get aboutReseauFooterNote =>
      'Info indicative (terrain). Les capacités exactes varient selon matériel / câbles / modules.\nObjectif : repères simples + méthode fiable.';

  @override
  String get aboutReseauToc1 => '1) Bases réseau (LAN / IP / débit)';

  @override
  String get aboutReseauToc2 => '2) RJ45 & catégories (Cat5e/6/6A/…)';

  @override
  String get aboutReseauToc3 => '3) PoE (alimentation réseau)';

  @override
  String get aboutReseauToc4 => '4) Fibre (SM/MM) + connecteurs (LC/SC)';

  @override
  String get aboutReseauToc5 => '5) SFP / SFP+ / QSFP (modules)';

  @override
  String get aboutReseauToc6 => '6) Switches (VLAN / IGMP / QoS)';

  @override
  String get aboutReseauToc7 => '7) Art-Net / sACN sur réseau (conseils)';

  @override
  String get aboutReseauToc8 => '8) Checklist';

  @override
  String get aboutReseauSection1Title => 'Les 3 idées simples';

  @override
  String get aboutReseauSection1Bullet1 => 'IP = adresse (ex: 10.0.0.50).';

  @override
  String get aboutReseauSection1Bullet2 =>
      'LAN = réseau local via switch (pas “internet”).';

  @override
  String get aboutReseauSection1Bullet3 =>
      'Débit = capacité (1G, 10G…), mais la stabilité dépend aussi du switch.';

  @override
  String get aboutReseauSection1Title2 => 'Topologie show (propre)';

  @override
  String get aboutReseauSection1Bullet4 =>
      'Console/PC → switch central → nodes/serveurs.';

  @override
  String get aboutReseauSection1Bullet5 =>
      'Évite les “daisy-chain réseau” au hasard.';

  @override
  String get aboutReseauSection1Bullet6 =>
      'Si possible : un réseau dédié show (pas le Wi-Fi public).';

  @override
  String get aboutReseauSection2Title => 'Repères rapides';

  @override
  String get aboutReseauSection2Bullet1 =>
      'Cat5e : 1 Gbit/s “classique” (jusqu’à 100m).';

  @override
  String get aboutReseauSection2Bullet2 =>
      'Cat6 : 1G/10G (10G plutôt sur distances plus courtes).';

  @override
  String get aboutReseauSection2Bullet3 =>
      'Cat6A : 10G jusqu’à 100m (repère pratique).';

  @override
  String get aboutReseauSection2Bullet4 =>
      'Au-delà : Cat7/8 existent, mais Cat6A est souvent le sweet spot terrain.';

  @override
  String get aboutReseauSection2Title2 => 'Terrain';

  @override
  String get aboutReseauSection2Bullet5 =>
      'Toujours tester/étiqueter les câbles (surtout quand c’est loué).';

  @override
  String get aboutReseauSection2Bullet6 =>
      'Évite les connecteurs abîmés : un RJ45 “fatigué” = pannes fantômes.';

  @override
  String get aboutReseauSection2Bullet7 =>
      'Prévoir du 10G si tu fais vidéo IP lourde.';

  @override
  String get aboutReseauSection3Paragraph =>
      'PoE permet d’alimenter des équipements via RJ45 (cam IP, AP Wi-Fi, petits nodes…). Le point critique : le budget PoE total du switch.';

  @override
  String get aboutReseauSection3Title => 'Repères';

  @override
  String get aboutReseauSection3Bullet1 =>
      'PoE (802.3af) ≈ 15W, PoE+ (802.3at) ≈ 30W, PoE++/bt plus haut.';

  @override
  String get aboutReseauSection3Bullet2 =>
      'Le switch a un “budget” total (ex: 120W).';

  @override
  String get aboutReseauSection3Bullet3 =>
      'Si tu dépasses le budget : certains ports ne s’allument plus / reboot.';

  @override
  String get aboutReseauSection4Title => 'Pourquoi la fibre en show';

  @override
  String get aboutReseauSection4Bullet1 => 'Très longues distances.';

  @override
  String get aboutReseauSection4Bullet2 =>
      'Immunité aux parasites (EMI), top en environnements chargés.';

  @override
  String get aboutReseauSection4Bullet3 =>
      'Pratique pour relier FOH ↔ plateau ↔ régie.';

  @override
  String get aboutReseauSection4Title2 =>
      'Multimode vs Monomode (repère simple)';

  @override
  String get aboutReseauSection4Bullet4 =>
      'Multimode (MM) : distances “moyennes” (souvent bâtiment / plateau).';

  @override
  String get aboutReseauSection4Bullet5 =>
      'Monomode (SM) : très longues distances.';

  @override
  String get aboutReseauSection4Bullet6 =>
      'Les modules (SFP) doivent matcher le type de fibre.';

  @override
  String get aboutReseauSection4Title3 => 'Connecteurs';

  @override
  String get aboutReseauSection4Bullet7 => 'LC : petit, très courant sur SFP.';

  @override
  String get aboutReseauSection4Bullet8 =>
      'SC : plus gros, courant en infrastructure.';

  @override
  String get aboutReseauSection4Bullet9 =>
      'Toujours protéger/clean (poussière = pertes).';

  @override
  String get aboutReseauSection5Title => 'Repères';

  @override
  String get aboutReseauSection5Bullet1 => 'SFP : souvent 1G.';

  @override
  String get aboutReseauSection5Bullet2 => 'SFP+ : souvent 10G.';

  @override
  String get aboutReseauSection5Bullet3 => 'QSFP/QSFP+ : 40G (selon usage).';

  @override
  String get aboutReseauSection5Bullet4 =>
      'Un module = vitesse + type fibre + longueur (tout doit être cohérent).';

  @override
  String get aboutReseauSection5Paragraph =>
      'En pratique : prends des modules compatibles avec le switch (et idéalement du même fournisseur/modèle) pour éviter les surprises.';

  @override
  String get aboutReseauSection6Title => 'Fonctions utiles en spectacle';

  @override
  String get aboutReseauSection6Bullet1 =>
      'VLAN : séparer lumière / vidéo / IT.';

  @override
  String get aboutReseauSection6Bullet2 =>
      'IGMP snooping : indispensable si tu utilises sACN multicast à grande échelle.';

  @override
  String get aboutReseauSection6Bullet3 =>
      'QoS : utile si tu mixes beaucoup de flux (selon contexte).';

  @override
  String get aboutReseauSection6Title2 => 'Erreurs fréquentes';

  @override
  String get aboutReseauSection6Bullet4 =>
      'Switch “cheap” qui flood le multicast → réseau qui s’écroule.';

  @override
  String get aboutReseauSection6Bullet5 =>
      'Boucle réseau sans STP → tempête de broadcast.';

  @override
  String get aboutReseauSection6Bullet6 =>
      'Wi-Fi public sur le même LAN que le show → instabilité.';

  @override
  String get aboutReseauSection7Title => 'Art-Net (terrain)';

  @override
  String get aboutReseauSection7Bullet1 => 'Souvent simple à mettre en place.';

  @override
  String get aboutReseauSection7Bullet2 =>
      'Broadcast possible sur petit LAN dédié, mais unicast est plus propre.';

  @override
  String get aboutReseauSection7Bullet3 =>
      'Mapping univers/ports = point numéro 1 à vérifier.';

  @override
  String get aboutReseauSection7Title2 => 'sACN (terrain)';

  @override
  String get aboutReseauSection7Bullet4 =>
      'Multicast : efficace, mais exige un switch correct (IGMP).';

  @override
  String get aboutReseauSection7Bullet5 =>
      'Priorités : utile si plusieurs sources.';

  @override
  String get aboutReseauSection7Bullet6 =>
      'Sur gros shows : sACN + IGMP est souvent le choix “propre”.';

  @override
  String get aboutReseauChecklistTitle => 'Rapide';

  @override
  String get aboutReseauChecklistBullet1 => 'Switch correct + câbles propres.';

  @override
  String get aboutReseauChecklistBullet2 => 'IGMP si sACN multicast.';

  @override
  String get aboutReseauChecklistBullet3 => 'Séparer les usages (VLAN).';

  @override
  String get aboutSacnPageTitle => 'sACN / E1.31 — multicast & priorités';

  @override
  String get aboutSacnCopyTooltip => 'Copier repères';

  @override
  String get aboutSacnChecklistCopyTooltip => 'Copier';

  @override
  String get aboutSacnFooterNote =>
      'Info indicative (terrain). Les comportements dépendent des switchs (IGMP), nodes et firmwares.\nObjectif : comprendre et stabiliser un réseau sACN.';

  @override
  String get aboutSacnCopy1 =>
      'sACN (E1.31) = DMX sur IP (UDP), standard spectacle.';

  @override
  String get aboutSacnCopy2 => 'Universe sACN = 1..63999 (plage standard).';

  @override
  String get aboutSacnCopy3 =>
      'Multicast: IGMP snooping recommandé, sinon flood.';

  @override
  String get aboutSacnCopy4 =>
      'Priorité: utile avec sources multiples (console + backup).';

  @override
  String get aboutSacnChecklistCopy =>
      'sACN (E1.31) — Checklist terrain\n☐ Switch correct (idéalement manageable)\n☐ IGMP snooping activé si multicast\n☐ (Si possible) IGMP querier présent dans le VLAN (sinon comportements bizarres possibles)\n☐ Unicast si réseau non maîtrisé / dépannage\n☐ Priorités: vérifier sources multiples (console/backup)\n☐ Mapping univers ↔ ports node vérifié\n☐ Wi-Fi évité en prod';

  @override
  String get aboutSacnToc1 => '1) À quoi sert sACN ?';

  @override
  String get aboutSacnToc2 => '2) Univers (numérotation)';

  @override
  String get aboutSacnToc3 => '3) Multicast / Unicast + IGMP';

  @override
  String get aboutSacnToc4 => '4) Priorités (multi-sources)';

  @override
  String get aboutSacnToc5 => '5) Limites / perfs';

  @override
  String get aboutSacnToc6 => '6) RDM & sACN (proxy / selon matériel)';

  @override
  String get aboutSacnToc7 => '7) Schémas';

  @override
  String get aboutSacnToc8 => '8) Checklist';

  @override
  String get aboutSacnSection1Pill1 => 'UDP';

  @override
  String get aboutSacnSection1Pill2 => 'Multicast';

  @override
  String get aboutSacnSection1Pill3 => 'Priorité';

  @override
  String get aboutSacnSection1Paragraph =>
      'sACN (E1.31) est un standard largement utilisé pour transporter des univers DMX sur IP. Il est souvent privilégié quand on veut une architecture réseau propre: multicast bien géré, priorités standardisées, et un comportement plus “réseau pro”.';

  @override
  String get aboutSacnSection1Title => 'Quand c’est top';

  @override
  String get aboutSacnSection1Bullet1 =>
      'Beaucoup d’univers sur un réseau bien géré.';

  @override
  String get aboutSacnSection1Bullet2 =>
      'Installations / gros réseaux avec plusieurs sources (priorités).';

  @override
  String get aboutSacnSection1Bullet3 =>
      'Quand tu veux éviter le “broadcast partout”.';

  @override
  String get aboutSacnSection2Pill1 => 'Universe 1..63999';

  @override
  String get aboutSacnSection2Pill2 => '512 slots/universe';

  @override
  String get aboutSacnSection2Paragraph =>
      'Un univers sACN correspond à un univers DMX: jusqu’à 512 slots. La numérotation sACN standard est 1..63999. En pratique, l’important est le mapping console ↔ node ↔ port DMX.';

  @override
  String get aboutSacnSection2Title => 'Erreur classique';

  @override
  String get aboutSacnSection2Bullet1 =>
      'Tu changes le numéro d’univers côté console, mais pas côté node (ou inverse).';

  @override
  String get aboutSacnSection2Bullet2 =>
      'Tu patches “Universe 0” alors que le matériel attend une base 1.';

  @override
  String get aboutSacnSection2Bullet3 =>
      'Tu mélanges des conventions de numérotation entre outils.';

  @override
  String get aboutSacnSection3Paragraph =>
      'sACN utilise souvent le multicast: chaque univers “vit” sur un groupe multicast, et les nodes s’abonnent aux univers dont ils ont besoin.';

  @override
  String get aboutSacnSection3Title =>
      'IGMP snooping (pourquoi c’est important)';

  @override
  String get aboutSacnSection3Bullet1 =>
      'Sans IGMP: le switch “flood” le multicast partout → surcharge possible.';

  @override
  String get aboutSacnSection3Bullet2 =>
      'Avec IGMP: le switch envoie seulement aux ports abonnés → réseau stable.';

  @override
  String get aboutSacnSection3Bullet3 =>
      'Sur gros volumes: IGMP est souvent LA différence entre “ça marche” et “c’est l’enfer”.';

  @override
  String get aboutSacnSection3Subtitle => 'Schéma : multicast & IGMP';

  @override
  String get aboutSacnSection3Subtitle2 => 'Unicast (option)';

  @override
  String get aboutSacnSection3SubBullet1 => 'Possible selon consoles/nodes.';

  @override
  String get aboutSacnSection3SubBullet2 =>
      'Utile en dépannage ou si réseau multicast non maîtrisé.';

  @override
  String get aboutSacnSection3SubBullet3 =>
      'Moins élégant mais parfois plus simple.';

  @override
  String get aboutSacnSection4Pill1 => 'Source A prio 100';

  @override
  String get aboutSacnSection4Pill2 => 'Source B prio 90';

  @override
  String get aboutSacnSection4Paragraph =>
      'sACN gère une notion de priorité: si plusieurs sources envoient le même univers, le récepteur garde la source la plus prioritaire. Très utile avec une console principale + une console backup + un media server.';

  @override
  String get aboutSacnSection4Title => 'Pièges';

  @override
  String get aboutSacnSection4Bullet1 =>
      'Deux sources non voulues sur le même univers → “ça se bat”.';

  @override
  String get aboutSacnSection4Bullet2 =>
      'Priorité mal réglée → backup qui prend le dessus.';

  @override
  String get aboutSacnSection4Bullet3 =>
      'Debug: couper une source et vérifier qui gagne.';

  @override
  String get aboutSacnSection5Pill1 => 'IGMP';

  @override
  String get aboutSacnSection5Pill2 => 'Switch';

  @override
  String get aboutSacnSection5Pill3 => 'Wi-Fi non';

  @override
  String get aboutSacnSection5Pill4 => 'CPU node';

  @override
  String get aboutSacnSection5Title => 'Ce qui casse en premier';

  @override
  String get aboutSacnSection5Bullet1 => 'Multicast sans IGMP → flood.';

  @override
  String get aboutSacnSection5Bullet2 =>
      'Switch non adapté (buffers/CPU) → pertes.';

  @override
  String get aboutSacnSection5Bullet3 => 'Wi-Fi → jitter/pertes.';

  @override
  String get aboutSacnSection5Bullet4 => 'Nodes limités (ports, firmware).';

  @override
  String get aboutSacnSection5Subtitle => 'Règles simples';

  @override
  String get aboutSacnSection5SubBullet1 =>
      'Switch géré + IGMP snooping si beaucoup d’univers.';

  @override
  String get aboutSacnSection5SubBullet2 => 'VLAN dédié lumière si possible.';

  @override
  String get aboutSacnSection5SubBullet3 => 'Unicast pour isoler en dépannage.';

  @override
  String get aboutSacnSection6Paragraph =>
      'Comme avec Art-Net, le RDM “sur IP” dépend souvent d’un mécanisme de proxy dans les nodes. Le standard sACN n’implique pas automatiquement que ton node fait du RDM correctement.';

  @override
  String get aboutSacnSection6Title => 'À vérifier dans la doc du node';

  @override
  String get aboutSacnSection6Bullet1 => 'Support RDM proxy / RDM over IP.';

  @override
  String get aboutSacnSection6Bullet2 =>
      'Limitations (discovery only, commandes partielles).';

  @override
  String get aboutSacnSection6Bullet3 =>
      'Compatibilité avec splitters/opto côté DMX.';

  @override
  String get aboutSacnSection6Subtitle => 'Méthode terrain';

  @override
  String get aboutSacnSection6SubBullet1 => 'Stabiliser DMX sans RDM.';

  @override
  String get aboutSacnSection6SubBullet2 =>
      'Tester RDM sur une ligne simple et propre.';

  @override
  String get aboutSacnSection6SubBullet3 =>
      'Si soucis: désactiver RDM, puis isoler node/splitter.';

  @override
  String get aboutSacnSection7Subtitle1 => 'Multicast + IGMP (idée)';

  @override
  String get aboutSacnSection7Subtitle2 => 'Priorités (2 sources)';

  @override
  String get aboutSacnChecklistTitle => 'Avant d’accuser “le protocole”';

  @override
  String get aboutSacnChecklistBullet1 => 'IGMP snooping activé si multicast.';

  @override
  String get aboutSacnChecklistBullet2 => 'VLAN dédié si possible.';

  @override
  String get aboutSacnChecklistBullet3 => 'Unicast en dépannage.';

  @override
  String get aboutSacnChecklistBullet4 =>
      'Priorités cohérentes si multi-sources.';

  @override
  String get aboutSacnChecklistBullet5 => 'Wi-Fi évité en prod.';

  @override
  String get sunTimesTitle => 'Lever / coucher du soleil';

  @override
  String get sunTimesSectionSettings => 'Paramètres';

  @override
  String get sunTimesSectionResults => 'Résultats';

  @override
  String get sunTimesSectionTimeline => 'Timeline (pas de 30 min)';

  @override
  String get sunTimesSectionTwilight =>
      'À quoi correspondent les crépuscules ?';

  @override
  String get sunTimesSectionLux => 'Seuils de luminosité (repères)';

  @override
  String get sunTimesIntro =>
      'Choisis une ville et une date. Les horaires sont indicatifs (arrondis).';

  @override
  String get sunTimesLabelCity => 'Ville';

  @override
  String get sunTimesLabelDate => 'Date';

  @override
  String get sunTimesNoteApprox =>
      'Heures indicatives — peuvent varier selon l’altitude, la réfraction et la météo.';

  @override
  String get sunTimesNoData => '—';

  @override
  String get sunTimesResultSunrise => 'Lever du soleil';

  @override
  String get sunTimesResultSunset => 'Coucher du soleil';

  @override
  String get sunTimesResultCivilDawn => 'Aube civile';

  @override
  String get sunTimesResultCivilDusk => 'Crépuscule civil';

  @override
  String get sunTimesResultNauticalDawn => 'Aube nautique';

  @override
  String get sunTimesResultNauticalDusk => 'Crépuscule nautique';

  @override
  String get sunTimesResultAstronomicalDawn => 'Aube astronomique';

  @override
  String get sunTimesResultAstronomicalDusk => 'Crépuscule astronomique';

  @override
  String get sunTimesTimelineStep30 => 'Pas: 30 min';

  @override
  String get sunTimesTimelineDay => 'Jour';

  @override
  String get sunTimesTimelineCivil => 'Civil';

  @override
  String get sunTimesTimelineNautical => 'Nautique';

  @override
  String get sunTimesTimelineAstronomical => 'Astronomique';

  @override
  String get sunTimesTimelineNight => 'Nuit';

  @override
  String get sunTimesTwilightIntro =>
      'Les crépuscules sont définis par la hauteur du Soleil sous l’horizon. Ces définitions sont standardisées.';

  @override
  String get sunTimesTwilightCivilTitle => 'Civil (≈ 0° à −6°)';

  @override
  String get sunTimesTwilightCivilBody =>
      'Fin/début de journée. On distingue encore bien le paysage.';

  @override
  String get sunTimesTwilightNauticalTitle => 'Nautique (≈ −6° à −12°)';

  @override
  String get sunTimesTwilightNauticalBody =>
      'La ligne d’horizon devient difficile à distinguer. Le ciel est nettement plus sombre.';

  @override
  String get sunTimesTwilightAstronomicalTitle =>
      'Astronomique (≈ −12° à −18°)';

  @override
  String get sunTimesTwilightAstronomicalBody =>
      'Le ciel est proche de la nuit complète (peu de lumière résiduelle).';

  @override
  String get sunTimesLuxNight => 'Nuit noire';

  @override
  String get sunTimesLuxAstro => 'Crépuscule astro';

  @override
  String get sunTimesLuxNautical => 'Crépuscule naut.';

  @override
  String get sunTimesLuxCivil => 'Crépuscule civil';

  @override
  String get sunTimesLuxVeryLow => 'Très faible';

  @override
  String get sunTimesLuxLow => 'Faible';

  @override
  String get sunTimesLuxDay => 'Jour';

  @override
  String get sunTimesLuxFullDay => 'Plein jour';

  @override
  String get sunTimesLuxNote =>
      'Ces valeurs sont des repères typiques (météo, saison, environnement → variations).';

  @override
  String get aboutVideoPageTitle => 'Vidéo — repères terrain';

  @override
  String get aboutVideoSummaryCopy =>
      'VIDÉO — repères terrain\n• Résolution = taille (px). FPS = fluidité / latence.\n• 4:2:2 / 4:4:4 + 10-bit = qualité couleur.\n• SDI = robuste + longue distance.\n• HDMI = fragile + court.\n• NDI = IP (réseau), dépend du LAN.\n• Genlock / Timecode = synchro.';

  @override
  String get aboutVideoChecklistCopy =>
      'VIDÉO — Checklist\n☐ Même résolution & FPS partout\n☐ HDMI : EDID / HDCP maîtrisés\n☐ SDI : câble 75Ω + bon standard\n☐ NDI/IP : LAN propre (switch, débit)\n☐ Genlock / Timecode si synchro requise\n☐ Tester source → écran direct';

  @override
  String get aboutVideoChecklistCopyTooltip => 'Copier';

  @override
  String get aboutVideoFooterNote =>
      'Info indicative (terrain). Les comportements varient selon matériels.\nObjectif : comprendre vite et dépanner proprement.';

  @override
  String get aboutVideoToc1 => '1) Bases vidéo (mots-clés)';

  @override
  String get aboutVideoToc2 => '2) Résolution & FPS';

  @override
  String get aboutVideoToc3 => '3) Couleur (4:4:4 / 4:2:2 / 10-bit)';

  @override
  String get aboutVideoToc4 => '4) Sync (Genlock / Timecode)';

  @override
  String get aboutVideoToc5 => '5) Câbles & distances';

  @override
  String get aboutVideoToc6 => '6) SDI (3G / 6G / 12G)';

  @override
  String get aboutVideoToc7 => '7) HDMI — terrain';

  @override
  String get aboutVideoToc8 => '8) NDI — quand / pourquoi / limites';

  @override
  String get aboutVideoToc9 => '9) Mapping / LED / multi-projo';

  @override
  String get aboutVideoSection1Paragraph =>
      'La vidéo, c’est une image (pixels) envoyée à un rythme (FPS), avec une structure couleur (sampling / bit depth), transportée par un lien (SDI / HDMI / IP) et parfois synchronisée.';

  @override
  String get aboutVideoSection1Title => 'Vocabulaire utile';

  @override
  String get aboutVideoSection1Bullet1 => 'Résolution : largeur×hauteur (px).';

  @override
  String get aboutVideoSection1Bullet2 => 'FPS : fluidité / latence.';

  @override
  String get aboutVideoSection1Bullet3 => 'Progressif (p) vs entrelacé (i).';

  @override
  String get aboutVideoSection1Bullet4 =>
      'Codec : compression (H.264, H.265…).';

  @override
  String get aboutVideoSection1Bullet5 => 'Latency : critique en live.';

  @override
  String get aboutVideoSection2Title => 'Résolution';

  @override
  String get aboutVideoSection2Bullet1 => '1080p = 1920×1080.';

  @override
  String get aboutVideoSection2Bullet2 => '4K UHD = 3840×2160.';

  @override
  String get aboutVideoSection2Bullet3 => 'DCI 4K = 4096×2160 (cinéma).';

  @override
  String get aboutVideoSection2Bullet4 => 'Plus de pixels = plus de débit.';

  @override
  String get aboutVideoSection2Title2 => 'FPS';

  @override
  String get aboutVideoSection2Bullet5 => '25/50 : standard Europe.';

  @override
  String get aboutVideoSection2Bullet6 => '30/60 : standard US / devices.';

  @override
  String get aboutVideoSection2Bullet7 =>
      'Éviter de mixer 50 et 60 sans conversion.';

  @override
  String get aboutVideoSection3Title => 'Sampling';

  @override
  String get aboutVideoSection3Bullet1 => '4:4:4 : graphismes / keying.';

  @override
  String get aboutVideoSection3Bullet2 => '4:2:2 : pro courant.';

  @override
  String get aboutVideoSection3Bullet3 => '4:2:0 : fichiers / stream.';

  @override
  String get aboutVideoSection3Title2 => 'Bit depth';

  @override
  String get aboutVideoSection3Bullet4 => '8-bit : standard.';

  @override
  String get aboutVideoSection3Bullet5 =>
      '10-bit : meilleurs dégradés (HDR / LED).';

  @override
  String get aboutVideoSection4Title => 'Genlock';

  @override
  String get aboutVideoSection4Bullet1 =>
      'Synchronise le rafraîchissement image.';

  @override
  String get aboutVideoSection4Bullet2 =>
      'Utile en multi-cam / LED / broadcast.';

  @override
  String get aboutVideoSection4Title2 => 'Timecode';

  @override
  String get aboutVideoSection4Bullet3 => 'Synchronisation temporelle.';

  @override
  String get aboutVideoSection4Bullet4 => 'Ne remplace pas le genlock.';

  @override
  String get aboutVideoSection5Title => 'Règles simples';

  @override
  String get aboutVideoSection5Bullet1 => 'HDMI : fragile, court.';

  @override
  String get aboutVideoSection5Bullet2 => 'SDI : robuste, long.';

  @override
  String get aboutVideoSection5Bullet3 => 'Fibre : très long + EMI free.';

  @override
  String get aboutVideoSection6Title => 'Repères';

  @override
  String get aboutVideoSection6Bullet1 => '3G : 1080p60';

  @override
  String get aboutVideoSection6Bullet2 => '6G : 2160p30';

  @override
  String get aboutVideoSection6Bullet3 => '12G : 2160p60';

  @override
  String get aboutVideoSection7Title => 'À surveiller';

  @override
  String get aboutVideoSection7Bullet1 => 'EDID';

  @override
  String get aboutVideoSection7Bullet2 => 'HDCP';

  @override
  String get aboutVideoSection7Bullet3 => 'Longueurs';

  @override
  String get aboutVideoSection8Title => 'IP vidéo';

  @override
  String get aboutVideoSection8Bullet1 => 'Flexible.';

  @override
  String get aboutVideoSection8Bullet2 => 'Charge réseau.';

  @override
  String get aboutVideoSection8Bullet3 => 'LAN propre requis.';

  @override
  String get aboutVideoSection9Title => 'Terrain';

  @override
  String get aboutVideoSection9Bullet1 => 'Même résolution / FPS.';

  @override
  String get aboutVideoSection9Bullet2 => 'Mapping correct.';

  @override
  String get aboutVideoSection9Bullet3 => 'Tester avec mires.';

  @override
  String get aboutVideoChecklistTitle => 'Avant de paniquer';

  @override
  String get aboutVideoChecklistBullet1 => 'Vérifier résolution / FPS.';

  @override
  String get aboutVideoChecklistBullet2 => 'Tester source → écran.';

  @override
  String get aboutVideoChecklistBullet3 => 'Simplifier la chaîne.';

  @override
  String get homeBpmSubtitle => 'Tap tempo, conversion BPM ↔ ms, Hz, mesure.';

  @override
  String get bpmTitle => 'BPM';

  @override
  String get bpmTapTitle => 'Tap tempo';

  @override
  String get bpmTapButton => 'Taper';

  @override
  String get bpmResetTap => 'Réinitialiser les taps';

  @override
  String get bpmDetectedLabel => 'BPM détecté';

  @override
  String get bpmTapHint =>
      'Tape plusieurs fois (idéalement 4 à 8 taps) pour obtenir une moyenne stable.';

  @override
  String get bpmManualTitle => 'BPM manuel';

  @override
  String get bpmManualLabel => 'BPM';

  @override
  String get bpmManualHint => 'Ex. 128';

  @override
  String get commonAdd => 'Ajouter';

  @override
  String get commonEdit => 'Modifier';

  @override
  String get commonDelete => 'Supprimer';

  @override
  String get commonCopied => 'Copié dans le presse-papiers.';

  @override
  String get patchCreateGdtfTitle => 'Créer un GDTF (simple)';

  @override
  String get patchCreateGdtfSubtitle =>
      'Création manuelle d’un device sous forme de tableau.';

  @override
  String get gdtfSimpleTitle => 'Créateur GDTF (simple)';

  @override
  String get gdtfDeviceSectionTitle => 'Appareil';

  @override
  String get gdtfChannelsSectionTitle => 'Canaux';

  @override
  String get gdtfImportJsonTitle => 'Importer JSON';

  @override
  String get gdtfExportJsonTitle => 'Exporter JSON';

  @override
  String get gdtfImportJsonHint => 'Colle le JSON ici';

  @override
  String get gdtfManufacturerLabel => 'Fabricant';

  @override
  String get gdtfModelLabel => 'Modèle';

  @override
  String get gdtfModeNameLabel => 'Nom du mode';

  @override
  String get gdtfChannelsCountLabel => 'Canaux';

  @override
  String get gdtfFootprintLabel => 'Footprint';

  @override
  String get gdtfColIndex => '#';

  @override
  String get gdtfColName => 'Nom';

  @override
  String get gdtfColDmx => 'DMX';

  @override
  String get gdtfColType => 'Type';

  @override
  String get gdtfColRes => '8/16';

  @override
  String get gdtfColDefault => 'Défaut';

  @override
  String get gdtfColActions => 'Actions';

  @override
  String get gdtfMoveUp => 'Monter';

  @override
  String get gdtfMoveDown => 'Descendre';

  @override
  String get gdtfChannelAddTitle => 'Ajouter un canal';

  @override
  String get gdtfChannelEditTitle => 'Modifier le canal';

  @override
  String get gdtfFieldName => 'Nom';

  @override
  String get gdtfFieldDmx => 'Adresse DMX';

  @override
  String get gdtfFieldType => 'Type';

  @override
  String get gdtfFieldResolution => 'Résolution';

  @override
  String get gdtfRes8 => '8-bit';

  @override
  String get gdtfRes16 => '16-bit';

  @override
  String get gdtfFieldDefault8 => 'Valeur par défaut (0–255)';

  @override
  String get gdtfFieldDefault16 => 'Valeur par défaut (0–65535)';

  @override
  String get gdtfDefaultChannelName => 'Canal';

  @override
  String get gdtfMvpHint =>
      'MVP : export JSON (presse-papiers). L’export GDTF réel (XML+ZIP) viendra ensuite.';

  @override
  String get gdtfTypeDimmer => 'Dimmer';

  @override
  String get gdtfTypePan => 'Pan';

  @override
  String get gdtfTypeTilt => 'Tilt';

  @override
  String get gdtfTypeColor => 'Couleur';

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
  String get gdtfTypeEffect => 'Effet';

  @override
  String get gdtfTypeCustom => 'Personnalisé';

  @override
  String get gdtfEasyTitle => 'Créer un GDTF (simple)';

  @override
  String get gdtfTemplatesTitle => 'Présélections';

  @override
  String get gdtfCreateDefaultPreset => 'Créer le preset par défaut';

  @override
  String get gdtfTemplatesHint =>
      'Crée une base rapide (dimmer, shutter, pan, tilt, RGB, etc.) puis complète les adresses DMX et les défauts.';

  @override
  String get gdtfExportButton => 'Exporter GDTF';

  @override
  String get gdtfExportHint =>
      'Export .gdtf minimal (description.xml) puis partage (Mail, WhatsApp, AirDrop, Drive…).';

  @override
  String get gdtfExportNeedDmx =>
      'Ajoute au moins une adresse DMX pour exporter.';

  @override
  String get gdtfExportDone => 'GDTF exporté.';

  @override
  String get gdtfExportError => 'Impossible d’exporter le GDTF.';

  @override
  String get gdtfShareSubject => 'Fichier GDTF';

  @override
  String get gdtfShareText => 'Voici le fichier GDTF exporté.';

  @override
  String get gdtfFieldRole => 'Paramètre';

  @override
  String get gdtfDmxHint => 'Vide ou 1–512';

  @override
  String get gdtfFieldDefault => 'Défaut';

  @override
  String get gdtfDefaultHint8 => '0–255';

  @override
  String get gdtfDefaultHint16 => '0–65535';

  @override
  String get gdtfChannelDefaultName => 'Canal';

  @override
  String get gdtfRoleEmpty => 'Vide / Inconnu';

  @override
  String get gdtfRoleDimmer => 'Dimmer';

  @override
  String get gdtfRoleShutter => 'Shutter';

  @override
  String get gdtfRolePan => 'Pan';

  @override
  String get gdtfRoleTilt => 'Tilt';

  @override
  String get gdtfRoleRed => 'Rouge (R)';

  @override
  String get gdtfRoleGreen => 'Vert (G)';

  @override
  String get gdtfRoleBlue => 'Bleu (B)';

  @override
  String get gdtfRoleColor => 'Couleur';

  @override
  String get gdtfRoleGobo => 'Gobo';

  @override
  String get gdtfRoleZoom => 'Zoom';

  @override
  String get gdtfRoleFocus => 'Focus';

  @override
  String get gdtfRolePrism => 'Prism';

  @override
  String get gdtfRoleEffect => 'Effet';

  @override
  String get gdtfRoleControl => 'Control';

  @override
  String get gdtfRoleCustom => 'Custom';

  @override
  String get gdtfResUnknown => 'Vide';

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
  String get gdtfPresetEffect => 'Effet';

  @override
  String get gdtfPresetControl => 'Control';

  @override
  String get commonApply => 'Appliquer';

  @override
  String get gdtfPresetLabel => 'Choix';

  @override
  String get gdtfPresetFixtureSimple => 'Fixture simple';

  @override
  String get gdtfPresetBarreLed => 'Barre LED';

  @override
  String get gdtfTemplatesHintShort =>
      'Choisis un preset puis applique. Tu peux ensuite ajuster DMX, défauts, et réordonner par glisser-déposer.';

  @override
  String get gdtfExportNeedChannels =>
      'Ajoute au moins un canal pour exporter.';

  @override
  String get homeDrawerContact => 'Contacter le développeur';

  @override
  String get homeDrawerSuggestItem => 'Proposer un article au catalogue';

  @override
  String get homeErrorOpenEmail =>
      'Impossible d\'ouvrir l\'application e-mail.';

  @override
  String get homeErrorOpenForm => 'Impossible d\'ouvrir le formulaire.';

  @override
  String get homeContactEmailSubject => 'Question concernant Mon App Tech';

  @override
  String get bpmManualHelp =>
      'Si un BPM manuel est saisi, il est prioritaire sur le tap tempo.';

  @override
  String get bpmConversionsTitle => 'Conversions';

  @override
  String get bpmActiveLabel => 'BPM actif';

  @override
  String get bpmMsPerBeat => 'Durée d’un beat';

  @override
  String get bpmHz => 'Fréquence';

  @override
  String get bpmSecPerBar44 => 'Durée d’une mesure (4/4)';

  @override
  String get bpmDisclaimer =>
      'Indication approximative. Vérifie au métronome si c’est critique.';

  @override
  String get laserToolsTitle => 'Outils';

  @override
  String get laserBeamSizeTitle => 'Taille du faisceau';

  @override
  String get laserBeamSizeSubtitle =>
      'Diamètre, rayon et surface du spot à une distance donnée.';

  @override
  String get laserBeamInputsTitle => 'Paramètres';

  @override
  String get laserBeamDistanceLabel => 'Distance';

  @override
  String get laserBeamDistanceHint => 'm (ex. 12)';

  @override
  String get laserBeamFormulaHint =>
      'Calcul : D(z) = D0 + θ · z (θ en rad, angle plein).';

  @override
  String get laserBeamResultsTitle => 'Résultats';

  @override
  String get laserBeamDiameterAtDistance => 'Diamètre à la distance';

  @override
  String get laserBeamRadiusAtDistance => 'Rayon à la distance';

  @override
  String get laserBeamAreaAtDistance => 'Surface du spot';

  @override
  String get sunTimesPageTitle => 'Lever / coucher du soleil';

  @override
  String get sunTimesSelectionTitle => 'Paramètres';

  @override
  String get sunTimesCityLabel => 'Ville';

  @override
  String get sunTimesDateLabel => 'Date';

  @override
  String get sunTimesResultsTitle => 'Résultats';

  @override
  String get sunTimesSunriseLabel => 'Lever du soleil';

  @override
  String get sunTimesSunsetLabel => 'Coucher du soleil';

  @override
  String get sunTimesDayLengthLabel => 'Durée du jour';

  @override
  String get sunTimesDisclaimer =>
      'Valeurs indicatives (modèle astronomique). Vérifie avec une source officielle si nécessaire (événement, sécurité, tournage).';

  @override
  String get sunTimesThresholdTitle => 'Seuils de luminosité (repères)';

  @override
  String get sunTimesThresholdIntro =>
      'Ordres de grandeur utiles pour anticiper la lumière ambiante (très variable selon météo, latitude, saison, obstacles, pollution lumineuse).';

  @override
  String get sunTimesLuxDaylight => 'Plein jour (hors soleil direct)';

  @override
  String get sunTimesLuxOvercast => 'Ciel couvert (typique)';

  @override
  String get sunTimesLuxSunrise => 'Lever / coucher (clair)';

  @override
  String get sunTimesLuxCivilTwilight => 'Limite crépuscule civil (clair)';

  @override
  String get sunTimesLuxFullMoon => 'Pleine lune (clair)';

  @override
  String get sunTimesThresholdNote =>
      'Astuce : pour un repérage “utilisable sans éclairage”, on vise souvent > 100–300 lx. Pour un travail fin, plutôt 500 lx et +.';

  @override
  String get sunTimesParamsTitle => 'Paramètres';

  @override
  String get sunTimesPickDate => 'Choisir une date';

  @override
  String get sunTimesSunrise => 'Lever';

  @override
  String get sunTimesSunset => 'Coucher';

  @override
  String get sunTimesDayLength => 'Durée du jour';

  @override
  String get sunTimesPolarNote =>
      'Note : dans les zones proches des pôles, lever/coucher peuvent être absents selon la saison.';

  @override
  String get sunTimesLuxThresholdTitle => 'Seuils de luminosité (repères)';

  @override
  String get sunTimesLuxBulletNightDark => 'Nuit noire : < 1 lux';

  @override
  String get sunTimesLuxBulletNightMoon => 'Nuit (lune) : ~ 0,1–1 lux';

  @override
  String get sunTimesLuxBulletFullMoon => 'Pleine lune : ~ 0,1–0,3 lux';

  @override
  String get sunTimesLuxBulletCivilTwilight =>
      'Crépuscule civil : Soleil à -6°';

  @override
  String get sunTimesLuxBulletUrbanLow =>
      'Éclairage urbain faible : ~ 5–20 lux';

  @override
  String get sunTimesLuxBulletOfficeLow => 'Bureau faible : ~ 100–300 lux';

  @override
  String get sunTimesLuxBulletOfficeStd => 'Bureau standard : ~ 300–500 lux';

  @override
  String get sunTimesLuxBulletOutdoorDay =>
      'Extérieur jour : ~ 10 000–25 000 lux';

  @override
  String get sunTimesLuxBulletDirectSun => 'Soleil direct : ~ 100 000 lux';

  @override
  String get sunTimesLuxDisclaimer =>
      'Repères indicatifs : météo/nuages, environnement, saison et relief peuvent fortement varier.';

  @override
  String get sunTimesTwilightTitle => 'Crépuscules : à quoi ça correspond';

  @override
  String get sunTimesTwilightCivil =>
      'Civil (-6°) : lumière encore suffisante pour distinguer l’environnement sans éclairage artificiel.';

  @override
  String get sunTimesTwilightNautical =>
      'Nautique (-12°) : l’horizon devient difficile à distinguer ; étoiles visibles.';

  @override
  String get sunTimesTwilightAstronomical =>
      'Astronomique (-18°) : le ciel est considéré comme “noir” (hors pollution lumineise).';

  @override
  String get sunTimesTwilightAnglesNote =>
      'Angles exprimés en degrés sous l’horizon (Soleil négatif).';

  @override
  String get sunTimesLuxBulletAstronomicalTwilight =>
      'Crépuscule astronomique : Soleil à -18°';

  @override
  String get sunTimesTimelineTitleStep30 => 'Timeline (pas 30 min)';

  @override
  String get sunTimesTimelineColTime => 'Heure';

  @override
  String get sunTimesTimelineColElevation => 'Élévation';

  @override
  String get sunTimesTimelineColMarker => 'Repère';

  @override
  String get sunTimesTimelineColLux => 'Lux (ordre)';

  @override
  String get sunTimesTimelineFootnote =>
      'Repères indicatifs (météo/nuages, environnement, saison) — utile pour préparer un show.';

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
  String get aboutUniverseToArtnetColUniverse => 'Univers';

  @override
  String get videoLedResultWallResolution => 'Résolution mur';

  @override
  String get videoLedResultWallSize => 'Taille mur';

  @override
  String get videoLedResultTile => 'Dalle';

  @override
  String get videoLedResultPitch => 'Pitch';

  @override
  String get lightFilterLedTabConvert => 'Conversion';

  @override
  String get lightFilterLedTabProfiles => 'Mes fixtures';

  @override
  String get lightFilterLedSourceLabel => 'Source lumineuse';

  @override
  String get lightFilterLedEngineRgbww => 'RGBWW (blanc chaud + froid)';

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
  String get lightFilterLedSaveProfileTitle => 'Sauvegarder le profil fixture';

  @override
  String get lightFilterLedProfileNameLabel => 'Nom de la fixture';

  @override
  String get patchMvrViewTable => 'Table';

  @override
  String get patchMvrViewVisual => 'Visual';

  @override
  String get consoleTitle => 'Console';

  @override
  String get consoleSubtitle => 'DMX patch and GDTF tools';

  @override
  String get consolePatchTitle => 'DMX Patch';

  @override
  String get consolePatchSubtitle => 'Import an MVR and analyze the patch';

  @override
  String get consoleGdtfTitle => 'GDTF';

  @override
  String get consoleGdtfSubtitle => 'Create or analyze a GDTF file';

  @override
  String lightFilterLedProfileSaved(String name) {
    return 'Profil « $name » sauvegardé';
  }

  @override
  String get lightFilterLedNoProfiles => 'Aucun profil fixture enregistré';

  @override
  String get lightFilterLedNoProfilesHint =>
      'Calibre les canaux dans l\'onglet Conversion,\npuis sauvegarde avec l\'icône 💾.';

  @override
  String get lightFilterLedTitle => 'Correspondance filtres LED';

  @override
  String get lightFilterLedDescription =>
      'Conversion des filtres LEE, Rosco… vers moteurs LED (RGB, RGBA, RGBW, etc.).';

  @override
  String get lightFilterLedBrandLabel => 'Marque';

  @override
  String get lightFilterLedSearchLabel => 'Recherche';

  @override
  String get lightFilterLedSearchHint => 'Code ou nom du filtre';

  @override
  String get lightFilterLedFilterLabel => 'Filtre';

  @override
  String get lightFilterLedEngineLabel => 'Moteur LED';

  @override
  String get lightFilterLedShowPercentLabel => 'Afficher en pourcentage';

  @override
  String get lightFilterLedShowPercentHint =>
      'Sinon, les valeurs sont affichées en DMX 0–255.';

  @override
  String get lightFilterLedHexLabel => 'Couleur de référence';

  @override
  String get lightFilterLedChromaticityLabel => 'Chromaticité';

  @override
  String get lightFilterLedTransmissionLabel => 'Transmission';

  @override
  String get lightFilterLedResultTitle => 'Résultat';

  @override
  String get lightFilterLedOriginalPreviewLabel => 'Aperçu filtre';

  @override
  String get lightFilterLedApproximatePreviewLabel => 'Aperçu LED approximatif';

  @override
  String get lightFilterLedDisclaimer =>
      'Résultat indicatif uniquement. Le rendu réel dépend du projecteur, de son spectre, de sa calibration, de son mode couleur et du contexte d’utilisation.';

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
  String get aboutSearchHint => 'Rechercher dans les références';

  @override
  String get aboutSearchNoResults => 'Aucun résultat trouvé.';

  @override
  String get homePinnedTitle => 'Épingles';

  @override
  String get homePinnedSubtitle =>
      'Retrouver rapidement vos références épinglées.';

  @override
  String get pinnedReferencesTitle => 'Références épinglées';

  @override
  String get pinnedReferencesEmpty =>
      'Aucune référence épinglée pour le moment.';

  @override
  String get aboutPinAddTooltip => 'Épingler cette référence';

  @override
  String get aboutPinRemoveTooltip => 'Retirer cette épingle';

  @override
  String get aboutPinAddedMessage => 'Référence épinglée.';

  @override
  String get aboutPinRemovedMessage => 'Épingle retirée.';

  @override
  String get homeDrawerSubscriptions => 'Abonnements';

  @override
  String get subscriptionPageTitle => 'Abonnements';

  @override
  String get subscriptionHeadlineAllTitle => 'Wählen Sie Ihr Abo';

  @override
  String get subscriptionHeadlineAllSubtitle =>
      'Hier finden Sie Ihre aktuellen Käufe und die noch verfügbaren Abonnements.';

  @override
  String subscriptionHeadlineUnlock(Object module) {
    return '$module freischalten';
  }

  @override
  String get subscriptionHeadlineVideoSubtitle =>
      'Sie können nur Video kaufen oder Pro wählen, um alles freizuschalten.';

  @override
  String get subscriptionHeadlineLightSubtitle =>
      'Sie können nur Licht kaufen oder Pro wählen, um alles freizuschalten.';

  @override
  String get subscriptionHeadlineLaserSubtitle =>
      'Sie können nur Laser kaufen oder Pro wählen, um alles freizuschalten.';

  @override
  String get subscriptionHeadlineConsoleSubtitle =>
      'Sie können nur Konsole kaufen oder Pro wählen, um alles freizuschalten.';

  @override
  String get subscriptionHeadlineProSubtitle =>
      'Voller Zugriff auf alle erweiterten Bereiche.';

  @override
  String get subscriptionStoreUnavailable => 'Store derzeit nicht verfügbar.';

  @override
  String get subscriptionLoadError =>
      'Abonnements konnten nicht geladen werden.';

  @override
  String get subscriptionRestorePurchases => 'Meine Käufe wiederherstellen';

  @override
  String get subscriptionPrivacy => 'Datenschutz';

  @override
  String get subscriptionTerms => 'AGB';

  @override
  String get subscriptionBestValue => 'BESTES ANGEBOT';

  @override
  String get subscriptionOwned => 'Gekauft';

  @override
  String get subscriptionIncludedInPro => 'In Pro enthalten';

  @override
  String get subscriptionProductUnavailable => 'Produkt nicht verfügbar.';

  @override
  String get subscriptionSubscribeAll => 'Abonnieren — Alles freischalten';

  @override
  String subscriptionSubscribeModule(Object module) {
    return 'Abonnieren — $module';
  }

  @override
  String get subscriptionCategoryVideoTitle => 'Video';

  @override
  String get subscriptionCategoryLightTitle => 'Licht';

  @override
  String get subscriptionCategoryLaserTitle => 'Laser';

  @override
  String get subscriptionCategoryConsoleTitle => 'Konsole';

  @override
  String get subscriptionCategoryProTitle => 'ShowTech Tools Pro';

  @override
  String get subscriptionCategoryVideoDescription =>
      'Zugriff auf den Bereich Video.';

  @override
  String get subscriptionCategoryLightDescription =>
      'Zugriff auf den Bereich Licht.';

  @override
  String get subscriptionCategoryLaserDescription =>
      'Zugriff auf den Bereich Laser.';

  @override
  String get subscriptionCategoryConsoleDescription =>
      'Zugriff auf den Bereich Konsole.';

  @override
  String get subscriptionCategoryProDescription =>
      'Voller Zugriff auf alle Bereiche.';

  @override
  String get electricityFreeSection => 'Kostenlos';

  @override
  String get electricityProSection => 'Elektrik-Abonnement';

  @override
  String get riggingFreeSection => 'Kostenlos';

  @override
  String get riggingProSection => 'Rigging-Abonnement';

  @override
  String get homeElectricityTitle => 'Strom';

  @override
  String get homeElectricitySubtitle =>
      'Leistung, Strom, Kabelabschnitte und USV-Autonomie.';

  @override
  String get subscriptionCategoryElectricityTitle => 'Strom';

  @override
  String get subscriptionCategoryElectricityDescription =>
      'Elektrowerkzeuge für Strom, Phasen, Kabel und USV.';

  @override
  String get subscriptionCategoryRiggingTitle => 'Rigging';

  @override
  String get subscriptionCategoryRiggingDescription =>
      'Rigging-Werkzeuge für Bridle, Winkel und Verifizierung WLL / CMU.';

  @override
  String get subscriptionHeadlineElectricitySubtitle =>
      'Schaltet alle professionellen Elektrowerkzeuge frei.';

  @override
  String get subscriptionHeadlineRiggingSubtitle =>
      'Schaltet alle professionellen Rigging-Tools frei.';

  @override
  String get electricityTitle => 'Strom';

  @override
  String get electricityToolPowerCurrentTitle => 'Leistung / Strom';

  @override
  String get electricityToolPowerCurrentSubtitle =>
      'Berechnen Sie Leistung, Strom, Spannung oder Energie in ein- oder dreiphasiger Form.';

  @override
  String get electricityToolPhasePowerTitle => 'Leistung pro Phase';

  @override
  String get electricityToolPhasePowerSubtitle =>
      'Verteilen Sie eine Gesamtleistung und lesen Sie den Strom pro Phase ab.';

  @override
  String get electricityToolCableSectionTitle => 'Kabelabschnitt';

  @override
  String get electricityToolCableSectionSubtitle =>
      'Berechnen Sie einen Abschnitt anhand von Strom oder Leistung, Länge, Spannungsabfall und Kabelreferenz.';

  @override
  String get electricityToolUpsTitle => 'USV-Autonomie';

  @override
  String get electricityToolUpsSubtitle =>
      'Schätzen Sie die Autonomie einer Batterie oder einer USV je nach Last.';

  @override
  String get electricityInputsTitle => 'Vorspeisen';

  @override
  String get electricityResultsTitle => 'Ergebnisse';

  @override
  String get electricityEnterValuesToCalculate =>
      'Gibt gültige Werte zur Berechnung ein.';

  @override
  String get electricityTotalPowerLabel => 'Gesamtleistung';

  @override
  String get electricityTotalPowerHint => 'Ex. 22000';

  @override
  String get electricityPowerPerPhaseLabel => 'Leistung pro Phase';

  @override
  String get electricityCurrentPerPhaseLabel => 'Strom pro Phase';

  @override
  String get electricityCurrentLabel => 'Fließend';

  @override
  String get electricityPhaseCountLabel => 'Anzahl der Phasen';

  @override
  String get electricityConsumptionCurrentLabel =>
      'Verbrauch / tatsächlicher Strom';

  @override
  String get electricityConsumptionCurrentHint => '32';

  @override
  String get electricityBreakerSizeLabel => 'Größe des Leistungsschalters';

  @override
  String get electricityBreakerSizeHint => '32';

  @override
  String get electricityCableLengthLabel => 'Kabellänge';

  @override
  String get electricityCableLengthHint => 'Beispiel 30';

  @override
  String get electricityAllowedVoltageDropLabel => 'Maximaler Spannungsabfall';

  @override
  String get electricityAllowedVoltageDropHint => 'Beispiel 3';

  @override
  String get electricityRecommendedCableSectionLabel => 'Empfohlener Abschnitt';

  @override
  String get electricityMaxCurrentForSectionLabel => 'Zulässiger Strom';

  @override
  String get electricityVoltageDropLabel => 'Spannungsabfall';

  @override
  String get electricityBreakerCheckLabel => 'Prüfung des Leistungsschalters';

  @override
  String get electricityStatusOk => 'Okay';

  @override
  String get electricityStatusWarning => 'Zu prüfen';

  @override
  String get electricityImportantNoteTitle => 'Wichtiger Hinweis';

  @override
  String get electricityCableSectionDisclaimer =>
      'Indikative Berechnung basierend auf einer Referenztabelle, die von IEC 60364-5-52 inspiriert ist. Überprüfen Sie stets RGIE/AREI, die tatsächliche Installationsmethode, die Temperatur, die Kabelgruppierung und den Schutz mit einem qualifizierten Elektriker.';

  @override
  String get electricityConsumptionInputTypeTitle => 'Bekannter Wert';

  @override
  String get electricityInputCurrent => 'Strom (A)';

  @override
  String get electricityInputPower => 'Leistung (W)';

  @override
  String get electricityVoltageLabel => 'Spannung (U)';

  @override
  String get electricityVoltageHint => 'Ex. 230 oder 400';

  @override
  String get electricityPowerFactorLabel => 'Leistungsfaktor (cos φ)';

  @override
  String get electricityPowerFactorHint => 'Beispiel 1.0';

  @override
  String get electricityCableReferenceTitle => 'Kabelreferenz';

  @override
  String get electricityCopper => 'Kupfer';

  @override
  String get electricityAluminium => 'Aluminium';

  @override
  String get electricityInsulationPvc => 'PVC 70°C';

  @override
  String get electricityInsulationXlpe => 'XLPE 90°C';

  @override
  String get electricityInstallConduit => 'Angetrieben';

  @override
  String get electricityInstallFreeAir => 'Freie Luft';

  @override
  String get electricityCalculatedCurrentLabel => 'Berechneter Strom';

  @override
  String get electricityRecommendedBreakerLabel => 'Empfohlener Schutzschalter';

  @override
  String get electricityNoStandardBreaker => 'Kein passendes Standardkaliber';

  @override
  String get electricityStatusLabel => 'Status';

  @override
  String get electricityCircuitTypeTitle => 'Schaltungstyp';

  @override
  String get electricitySinglePhase => 'Einphasig';

  @override
  String get electricityThreePhase => 'Dreiphasig';

  @override
  String get electricityResultActivePower => 'Wirkleistung';

  @override
  String get electricityResultCurrent => 'Fließend';

  @override
  String get electricityResultVoltage => 'Spannung';

  @override
  String get electricityResultEnergy => 'Energie';

  @override
  String get electricityInsufficient => 'Unzureichende Werte';

  @override
  String get electricityCalcPower => 'Leistung';

  @override
  String get electricityCalcCurrent => 'Fließend';

  @override
  String get electricityCalcVoltage => 'Spannung';

  @override
  String get electricityCalcEnergy => 'Energie';

  @override
  String get electricityRef16AMono => '16 A Mono';

  @override
  String get electricityRef32AMono => '32 Ein Mono';

  @override
  String get electricityRef32ATri => '32 Eine Sorte';

  @override
  String get electricityRef63ATri => '63 Sortiert';

  @override
  String get electricityRef125ATri => '125 Ein Tri';

  @override
  String get electricityFormulaTri => 'P = √3 × U × I × cos φ';

  @override
  String get electricityFormulaMono => 'P = U × I × cos φ';

  @override
  String get electricityFormulaTriDesc =>
      'Dreiphasenformel für ausgewogenes Laden.';

  @override
  String get electricityFormulaMonoDesc => 'Einphasenformel.';

  @override
  String get electricityCircuitType => 'Schaltungstyp';

  @override
  String get electricityMono => 'Mono';

  @override
  String get electricityMonoDesc => 'Einphasiger 230-V-Stromkreis.';

  @override
  String get electricityThreePhaseDesc => '400-V-Drehstromkreis.';

  @override
  String get electricityCalcFor => 'Berechnen';

  @override
  String get electricityFieldPower => 'Leistung';

  @override
  String get electricityFieldPowerHint => 'Ex. 3680';

  @override
  String get electricityFieldCurrent => 'Fließend';

  @override
  String get electricityFieldCurrentHint => 'Beispiel 16';

  @override
  String get electricityFieldVoltage => 'Spannung';

  @override
  String get electricityFieldVoltageHint => '230';

  @override
  String get electricityFieldDuration => 'Dauer';

  @override
  String get electricityFieldDurationHint => 'Beispiel 2';

  @override
  String get electricityFieldPf => 'cos φ';

  @override
  String get electricityFieldPfHint => 'Beispiel 1.0';

  @override
  String get electricityCalculate => 'Berechnen';

  @override
  String get electricityRefTitle => 'Kurzreferenzen';

  @override
  String electricityUpsEnergyAvail(String energy) {
    return '$energy Wh verfügbar';
  }

  @override
  String get electricityUpsBatterySection => 'Batterie';

  @override
  String get electricityUpsCalculate => 'Autonomie berechnen';

  @override
  String get electricityUpsCapacityHint => 'Beispiel 100';

  @override
  String get electricityUpsCapacityLabel => 'Fähigkeit';

  @override
  String get electricityUpsCountHint => 'Beispiel 1';

  @override
  String get electricityUpsCountLabel => 'Anzahl der Batterien';

  @override
  String get electricityUpsEfficiencyHint => 'Ex. 85';

  @override
  String get electricityUpsEfficiencyLabel => 'Ertrag';

  @override
  String get electricityUpsLoadDesc => 'Vom Gerät verbrauchter Strom.';

  @override
  String get electricityUpsLoadHint => 'Ex. 500';

  @override
  String get electricityUpsLoadLabel => 'Aufladung';

  @override
  String get electricityUpsLoadSectionTitle => 'Zu liefernde Last';

  @override
  String get electricityUpsRef1 => 'Wh verfügbar';

  @override
  String get electricityUpsRef1Detail =>
      'Kapazität × Spannung × Anzahl × Effizienz.';

  @override
  String get electricityUpsRef2 => 'Autonomie';

  @override
  String get electricityUpsRef2Detail =>
      'Verfügbare Energie geteilt durch Last.';

  @override
  String get electricityUpsRef3Title => 'Indikatives Ergebnis';

  @override
  String get electricityUpsRef3Value =>
      'Der tatsächliche Wert hängt von der Effizienz, dem Zustand der Batterien und der Ladung ab.';

  @override
  String get electricityUpsRefTitle => 'Referenzen';

  @override
  String get electricityUpsVoltageHint => 'Beispiel 12';

  @override
  String get electricityUpsVoltageLabel => 'Batteriespannung';

  @override
  String get riggingToolBridleTitle => '2-Punkt-Zaumzeug';

  @override
  String get riggingToolBridleSubtitle =>
      'Vollständige Berechnung eines Zaumzeugs: Längen, Winkel, Spannungen und Sicherheitsstatus.';

  @override
  String get riggingToolAngleFactorTitle => 'Winkelfaktor';

  @override
  String get riggingToolAngleFactorSubtitle =>
      'Erkennen Sie schnell die Auswirkung des Winkels auf die Spannung in den Litzen.';

  @override
  String get riggingToolWllTitle => 'Verifizierung WLL / CMU';

  @override
  String get riggingToolWllSubtitle =>
      'Vergleichen Sie eine aufgebrachte Last mit der Kapazität des Materials.';

  @override
  String get riggingToolLengthTitle => 'Zaumzeuglänge';

  @override
  String get riggingToolLengthSubtitle =>
      'Berechnen Sie Längen und Winkel ohne Lastberechnung.';

  @override
  String get riggingKnownDrop => 'Pfeil';

  @override
  String get riggingKnownAngle => 'Ecke';

  @override
  String get riggingKnownLength => 'Länge';

  @override
  String get riggingAngleFromHorizontalLabel => 'Winkel zur Horizontalen';

  @override
  String get riggingLegLengthKnownLabel => 'Länge eines Strangs';

  @override
  String get riggingLoadWeightLabel => 'Gewicht laden';

  @override
  String get riggingLoadShortLabel => 'Aufladung';

  @override
  String get riggingPointALabel => 'HAT';

  @override
  String get riggingPointBLabel => 'B';

  @override
  String get riggingTensionLabel => 'Spannung';

  @override
  String get riggingTensionLeftLabel => 'Linke Spannung';

  @override
  String get riggingTensionRightLabel => 'Gerade Spannung';

  @override
  String get riggingTensionPerLegLabel => 'Spannung pro Strang';

  @override
  String get riggingStatusOk => 'Okay';

  @override
  String get riggingStatusWatch => 'Zu sehen';

  @override
  String get riggingStatusHigh => 'Schüler';

  @override
  String get riggingStatusDanger => 'Gefährlich';

  @override
  String get riggingStatusOkDescription =>
      'Bequemer Winkel. Die Spannung bleibt angemessen.';

  @override
  String get riggingStatusWatchDescription =>
      'Nutzbarer Winkel, aber die Spannung beginnt zuzunehmen.';

  @override
  String get riggingStatusHighDescription =>
      'Niedriger Winkel. Die Spannung steigt stark an.';

  @override
  String get riggingStatusDangerDescription =>
      'Sehr niedriger Winkel. Zu vermeidende Konfiguration.';

  @override
  String get riggingSafetyDisclaimer =>
      'Indikatives Ergebnis. Überprüfen Sie immer die aktuellen CMU/WLL, Sicherheitsfaktoren und geltenden Regeln.';

  @override
  String get riggingInvalidInputsMessage =>
      'Zwischen positiven und konsistenten Werten.';

  @override
  String get riggingAngleFactorLabel => 'Multiplikatorfaktor';

  @override
  String get riggingAngleFactorExplanation =>
      'Je kleiner der Winkel gegenüber der Horizontalen ist, desto stärker nimmt die Spannung in jedem Strang zu.';

  @override
  String get riggingWllLabel => 'WLL / CMU der Hardware';

  @override
  String get riggingAppliedLoadLabel => 'Angewandte Last';

  @override
  String get riggingSafetyFactorLabel => 'Sicherheitsfaktor';

  @override
  String get riggingRequiredLoadLabel => 'Zur Überprüfung laden';

  @override
  String get riggingWllUsageLabel => 'Verwenden Sie WLL';

  @override
  String get riggingMarginLabel => 'Verbleibende Marge';

  @override
  String get riggingWllStatusOkDescription =>
      'Die Hardwarekapazität reicht für diese Belastung aus.';

  @override
  String get riggingWllStatusWatchDescription =>
      'Die Kapazität ist immer noch ausreichend, die Marge ist jedoch gering.';

  @override
  String get riggingWllStatusDangerDescription =>
      'Die Ladung überschreitet die angegebene Kapazität.';

  @override
  String get riggingLengthDifferenceLabel => 'Längenunterschied';

  @override
  String get riggingCalculationModeLabel => 'Berechnungstyp';

  @override
  String get riggingGeometryOnlyLabel => 'Ohne Ladung';

  @override
  String get riggingWithLoadLabel => 'Mit Ladung';

  @override
  String get riggingGeometryOnlyDescription =>
      'Nur Geometriemodus: Längen, Pfeil und Winkel. Keine Spannungs- oder Lastberechnung.';

  @override
  String get riggingKnownInputLabel => 'Ich weiß';
}
