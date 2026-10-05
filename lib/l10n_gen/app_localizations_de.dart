// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get aboutArtNetSubtitle =>
      'Universum DMX auf Ethernet/UDP, Knoten, Broadcast vs. Unicast.\nTatsächliche Grenzen, Netzwerkstabilität, RDM abhängig von der Hardware.';

  @override
  String get aboutArtNetTitle =>
      'Art-Net – DMX über IP (Knoten, Unicast/Broadcast)';

  @override
  String get aboutCablingFiberSubtitle =>
      'Cat5e→Cat8, OM3/OM4/OS2-Faser, LC/SC/MPO, typische Entfernungen, Best Practices zeigen.';

  @override
  String get aboutCablingFiberTitle =>
      'Netzwerk – RJ45 / Glasfaser / Geschwindigkeiten und Längen';

  @override
  String get aboutComputingSubtitle =>
      'Nützliche Geschwindigkeiten, Versionen, echte Grenzen, Marketing-Fallstricke.';

  @override
  String get aboutComputingTitle => 'Computer – USB / HDMI / DP / SATA / NVMe…';

  @override
  String get aboutDmxSubtitle =>
      'Universum, Adressen, Frames, RS-485-Verkabelung, Terminierung, Feldfehler.\nEnthält Diagramme und Checkliste.';

  @override
  String get aboutDmxTitle => 'DMX';

  @override
  String get aboutElectricitySubtitle =>
      'Steckverbinder, Mono/Tri, schnelle kW-Tabellen (16A→400A), Feldfallen.';

  @override
  String get aboutElectricityTitle => 'Elektrisch – Schuko / P17 / Strom';

  @override
  String get aboutIpBasicsSubtitle =>
      'Verstehen Sie IP, Maske, Gateway, DHCP vs. statisch.\nKonkrete Beispiele (2.x, 10.x, 192.168.x) + Checkliste.';

  @override
  String get aboutIpBasicsTitle => 'IP-Grundlagen';

  @override
  String get aboutLightNetworkSubtitle =>
      'Einfache und robuste Architektur für Art-Net/sACN.\nVLAN, IGMP-Snooping/Querier, Wi-Fi (Jitter), Switches, Diagramme + Checkliste.';

  @override
  String get aboutLightNetworkTitle =>
      'Leichtes Netzwerk – VLAN, IGMP, Wi-Fi vs. kabelgebunden';

  @override
  String get aboutSacnSubtitle =>
      'Standard DMX im IP-orientierten „Pro“-Netzwerk.\nMulticast/Unicast, IGMP-Snooping/Querier, Multi-Source-Prioritäten.';

  @override
  String get aboutSacnTitle => 'sACN';

  @override
  String get aboutVideoSubtitle =>
      'Wählen Sie basierend auf Latenz, Zuverlässigkeit, Verkabelung, LAN- oder WAN-Netzwerk.\nTabellen + Diagramm.';

  @override
  String get aboutVideoTitle => 'Video';

  @override
  String get appTitle => 'Meine Tech-App';

  @override
  String catalogDmxModeItem(Object channels, Object name) {
    return '$name – $channels Kanäle';
  }

  @override
  String catalogDmxModeTitle(Object count) {
    return 'Modus DMX ($count)';
  }

  @override
  String get catalogInfoDmxChannels => 'Kanäle DMX';

  @override
  String get catalogInfoLuminousFlux => 'Lichtstrom';

  @override
  String get catalogInfoPower => 'Leistung';

  @override
  String get catalogInfoWeight => 'Gewicht';

  @override
  String catalogLastUpdate(Object date) {
    return 'Letzte Aktualisierung: $date';
  }

  @override
  String catalogManufacturerTitle(Object count) {
    return 'Hersteller ($count)';
  }

  @override
  String catalogModelTitle(Object count) {
    return 'Modell ($count)';
  }

  @override
  String get catalogNotProvided => 'Nicht angegeben';

  @override
  String get catalogOpenDmxChart => 'Offener Tisch DMX';

  @override
  String get catalogOpenManual => 'Öffnen Sie das Handbuch';

  @override
  String get catalogResetTooltip => 'Zurücksetzen';

  @override
  String catalogSyncError(Object message) {
    return 'Fehler: $message';
  }

  @override
  String catalogSyncFailed(Object reason) {
    return 'Synchronisierungsfehler: $reason';
  }

  @override
  String get catalogSyncFailedUnknown =>
      'Synchronisierungsfehler (unbekannter Grund).';

  @override
  String catalogTypeTitle(Object count) {
    return 'Typ ($count)';
  }

  @override
  String get catalogUpdateTooltip => 'Zum Aktualisieren';

  @override
  String get catalogUpdated => 'Aktualisierter Katalog.';

  @override
  String get commonCalculate => 'Berechnen';

  @override
  String get commonCancel => 'Stornieren';

  @override
  String get commonCopyResultTooltip => 'Ergebnis kopieren';

  @override
  String get commonDash => '—';

  @override
  String get commonNone => 'Keine Aufnahme';

  @override
  String get commonOk => 'Okay';

  @override
  String get commonOkWithCheck => 'Okay ✅';

  @override
  String get commonRename => 'Umbenennen';

  @override
  String get commonReset => 'Zurücksetzen';

  @override
  String get commonSave => 'Speichern';

  @override
  String get commonSearch => 'Zur Recherche';

  @override
  String get commonTooLowWithCross => 'Zu schwach ❌';

  @override
  String get commonUnitMeter => 'M';

  @override
  String get consentsReset => 'Einwilligungen zurückgesetzt.';

  @override
  String get dipSwitchAddressHint => 'Beispiel: 1 bis 512';

  @override
  String get dipSwitchAddressLabel => 'Adresse DMX';

  @override
  String get dipSwitchChannelUnit => 'Kanal';

  @override
  String get dipSwitchEndOfUniverseWarning =>
      'Warnung: Ende des Universums DMX erreicht.';

  @override
  String get dipSwitchInputsTitle => 'Vorspeisen';

  @override
  String get dipSwitchIntervalHint => 'Beispiel: 4 (Kanäle)';

  @override
  String get dipSwitchIntervalLabel => 'Intervall';

  @override
  String get dipSwitchModeAddressDirect => 'Direkte Adresse';

  @override
  String get dipSwitchModeAddressMinusOne => 'Adresse - 1';

  @override
  String get dipSwitchNextAddressButton => 'Nächste Adresse';

  @override
  String get dipSwitchOffLabel => 'AUS';

  @override
  String get dipSwitchOnLabel => 'AN';

  @override
  String get dipSwitchResetTooltip => 'Zurücksetzen';

  @override
  String dipSwitchResultAddressLine(Object address) {
    return 'Adresse: $address';
  }

  @override
  String get dipSwitchResultAddressNotProvided => 'Adresse nicht angegeben';

  @override
  String dipSwitchResultBinaryValueLine(Object binary) {
    return 'Binär: $binary';
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
      'Scrollen Sie, um alle Schalter anzuzeigen.';

  @override
  String get dipSwitchSectionTitle => 'Schalter';

  @override
  String get dipSwitchSummaryTitle => 'Zusammenfassung';

  @override
  String dipSwitchSwitchLabel(Object index) {
    return 'Schalter $index';
  }

  @override
  String get dipSwitchUseAddressMinusOneLabel => 'Adressmodus verwenden – 1';

  @override
  String get disclaimerAccept => 'Ich akzeptiere';

  @override
  String get disclaimerCertify =>
      'Ich bestätige, dass ich diese Bedingungen gelesen und akzeptiert habe.';

  @override
  String get disclaimerText =>
      'NUR FÜR INDIKATIVE ZWECKE VERWENDEN\n\nDie von dieser Anwendung bereitgestellten Berechnungen (Video, Licht, Laser) dienen nur zu Informations- und Orientierungszwecken.\nSie ersetzen in keiner Weise:\n- zertifizierte Berechnungen,\n- technisches Studium,\n- die geltenden offiziellen Normen,\n- noch eine Validierung durch einen qualifizierten Fachmann.\n\nVERANTWORTUNG\nDer Herausgeber dieser Anwendung übernimmt keine Haftung für Berechnungsfehler, Auslassungen, Sachschäden,\nPersonenunfälle oder Vorfälle, die während der Installation, des Betriebs oder der Verwendung des Geräts auftreten.\n\nVIDEO & SCREENING\nDie Ergebnisse (Größen, Verhältnisse, Leuchtstärke, Überlappungen usw.) basieren auf theoretischen Modellen und können variieren abhängig von:\nOptik, Zoom, Gleichmäßigkeit, Lichtumgebung, Unterstützung, Einstellungen usw.\nÜberprüfen Sie immer die offizielle Herstellerdokumentation.\n\nLICHT\nDie Berechnungen sind Richtwerte und berücksichtigen nicht alle realen Bedingungen (Toleranzen, optische Verluste,\nVerschlechterung der Quellen, örtliche Standards, Umgebungsbedingungen usw.).\n\nLASER – SICHERHEIT\nDie Berechnungen von NOHD, SZED und CZED basieren auf Standardannahmen und theoretischen Schwellenwerten.\nSie berücksichtigen insbesondere nicht:\n- optische Instrumente (Ferngläser, Kameras, Teleskope usw.),\n- atmosphärische Bedingungen (Nebel, Regen, Staub usw.),\n- unvorhergesehene Überlegungen, Umnutzungen, spezifische Situationen.\nDer Einsatz eines Lasersystems setzt die unmittelbare Verantwortung des Betreibers und eine entsprechende Risikoanalyse voraus.\n\nAkzeptanz von Risiken\nDurch die Nutzung dieser Anwendung erkennt der Nutzer Folgendes an:\n- die geltenden Sicherheitsvorschriften gelesen haben,\n- die alleinige Verantwortung für seine Installationen tragen,\n- die volle Verantwortung für die Risiken übernehmen, die mit der Verwendung von Geräten (Video, Licht, Laser) verbunden sind,\n- Überprüfen Sie die Daten systematisch anhand der offiziellen Herstellerhandbücher.';

  @override
  String get disclaimerTitle => '⚠️ RECHTLICHE HINWEISE UND HAFTUNGSAUSSCHLUSS';

  @override
  String get homeLaserSubtitle =>
      'Laserberechnungen und Sicherheit (Zustimmung bei jedem Eintrag erforderlich).';

  @override
  String get homeLaserTitle => 'Laser';

  @override
  String get homeLightSubtitle =>
      'Projektionsgröße, DIP-Schalter DMX, Photometrie, Katalog, Patch DMX.';

  @override
  String get homeLightTitle => 'Licht';

  @override
  String get homeReferencesSubtitle =>
      'DMX / Netzwerk / Video: Faktenblätter und Feldreferenzen.';

  @override
  String get homeReferencesTitle => 'Referenzen';

  @override
  String get homeTitle => 'Willkommen';

  @override
  String get homeVideoSubtitle =>
      'Objektiv & Messung, Helligkeit, Multiprojektor, LED und Testmuster.';

  @override
  String get homeVideoTitle => 'Video';

  @override
  String get language => 'Sprache';

  @override
  String get languageSystem => 'System (automatisch)';

  @override
  String get languageSystemCurrent => 'Telefonsprache';

  @override
  String get laserAdviceFullPower => 'Volle Leistung erlaubt (100 %)';

  @override
  String laserAdviceMaxRecommended(Object percent) {
    return 'Empfohlene maximale Leistung: $percent';
  }

  @override
  String get laserConsentCheckboxLabel =>
      'Ich akzeptiere und verstehe die Risiken.';

  @override
  String get laserConsentContinue => 'Weitermachen';

  @override
  String get laserConsentText =>
      'ZUGANG ZUM LASERTEIL\n\nDer LASER-Teil dieser Anwendung betrifft Sicherheitsberechnungen (z. B. NOHD, SZED, CZED).\nDiese Berechnungen sind Richtwerte und ersetzen nicht:\n- eine Risikoanalyse,\n- die geltenden Normen,\n- Betriebsabläufe,\n- noch eine Validierung durch eine qualifizierte Person.\n\nWICHTIG\n- Gefahr von Augen-/Hautschäden bei unsachgemäßer Verwendung.\n- Die Berechnung kann fehlerhaft sein, wenn die eingegebenen Parameter unvollständig oder falsch sind oder der reale Kontext abweicht (optisch,\n  atmosphärische Bedingungen, Reflexionen, Ausrichtung usw.).\n- Für Installation, Betrieb und Einhaltung ist ausschließlich der Betreiber verantwortlich.\n\nMit der Validierung bestätigen Sie:\n- die Risiken verstehen,\n- die geltenden Sicherheitsvorschriften einhalten,\n- Im Falle von Fahrlässigkeit oder Missbrauch übernehmen wir die volle Verantwortung.';

  @override
  String get laserConsentTitle => '🔴 LASER-EINWILLIGUNG (PFLICHT)';

  @override
  String get laserDiameterHint => 'zB: 3.0';

  @override
  String get laserDiameterLabel => 'Auslassdurchmesser (mm)';

  @override
  String get laserDisclaimerShort =>
      'Indikative Berechnung. Kein Ersatz für eine Lasersicherheitsanalyse.';

  @override
  String get laserDivergenceHint => 'Beispiel: 1.2';

  @override
  String get laserDivergenceLabel => 'Divergenz (mrad)';

  @override
  String get laserInputsTitle => 'Vorspeisen';

  @override
  String get laserInvalidInputs =>
      'Bitte geben Sie eine gültige Leistung, Divergenz und einen gültigen Durchmesser ein.';

  @override
  String get laserNameUpdated => 'Name aktualisiert.';

  @override
  String get laserNormativeParamsBody =>
      'MPE für den nominellen Augengefahrenabstand (NOHD): 25,4 W/m²\n(IEC 60825-1-Standard, Ausgabe 3.0)\n\nMPE für den Belichtungsabstand der sensiblen Zone (SZED): 1 W/m²\n(ANSI Z136.6-Standard)\n\nMPE für kritische Zonen-Expositionsentfernung (CZED): 0,05 W/m²\n(ANSI Z136.6-Standard)';

  @override
  String get laserNormativeParamsTitle =>
      'Sicherheitseinstellungen bleiben erhalten';

  @override
  String get laserPowerHint => 'Beispiel: 5000';

  @override
  String get laserPowerLabel => 'Leistung (mW)';

  @override
  String get laserPresetAdded => 'Aufnahme hinzugefügt.';

  @override
  String get laserPresetDeleted => 'Datensatz gelöscht.';

  @override
  String laserPresetSubtitle(Object diam, Object div, Object p) {
    return 'P: $p mW • Div: $div mrad • Ø: $diam mm';
  }

  @override
  String get laserProjectorNameLabel => 'Projektorname';

  @override
  String get laserRenameProjectorTitle => 'Benennen Sie den Projektor um';

  @override
  String get laserSafetyResultsTitle => 'Sicherheitsergebnisse';

  @override
  String get laserSaveCurrentProjector => 'Registrieren Sie diesen Projektor';

  @override
  String get laserSaveProjectorTitle => 'Registrieren Sie einen Projektor';

  @override
  String get laserSavedProjectorsTitle => 'Registrierte Projektoren';

  @override
  String get laserSearchHint => 'z.B. „RGB 5W“';

  @override
  String get laserTargetDistanceHint => 'z.B.: 10';

  @override
  String get laserTargetDistanceLabel => 'Zielentfernung (m)';

  @override
  String get laserZoneCzedDesc => 'Kritische Zone';

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
  String get lightCatalogTitle => 'Licht-Katalog';

  @override
  String get lightDisclaimerShort =>
      'Indikative Werkzeuge. Überprüfen Sie immer die Dokumentation des Herstellers.';

  @override
  String get lightDmxSwitchDescription =>
      'Indikative Konvertierung zwischen Adresse DMX und Schaltern, mit Intervallnavigation.';

  @override
  String get lightDmxSwitchTitle => 'DIP-Schalter DMX';

  @override
  String get lightPatchDescription =>
      'Importieren Sie eine MVR-Datei und zeigen Sie sie an.';

  @override
  String get lightPatchTitle => 'Patch DMX';

  @override
  String get lightPhotometryDescription =>
      'Indikative Umrechnungen zwischen Lux, Candela und Lumen, mit Abstand und Winkel.';

  @override
  String get lightPhotometryTitle => 'Photometrie';

  @override
  String get lightExposureMeterTitle => 'Belichtungsmesser (Lux)';

  @override
  String get lightExposureMeterDescription =>
      'Berechnet die Beleuchtungsstärke in Lux aus ISO-/Blenden-/Verschlusszeit-Einstellungen einer Kamera.';

  @override
  String get lightExposureMeterIsoLabel => 'ISO-Empfindlichkeit';

  @override
  String get lightExposureMeterApertureLabel => 'Blende';

  @override
  String get lightExposureMeterShutterLabel => 'Verschlusszeit';

  @override
  String get lightExposureMeterShutterDenomLabel =>
      'Verschlusszeit (Nenner, 1/x s)';

  @override
  String get lightExposureMeterResultTitle => 'Geschätzte Beleuchtungsstärke';

  @override
  String get lightExposureMeterReferenceTitle =>
      'Referenzwerte Beleuchtungsstärke';

  @override
  String get lightExposureMeterRefMoonlight => 'Mondlicht';

  @override
  String get lightExposureMeterRefDimStage => 'Schwach beleuchtete Bühne';

  @override
  String get lightExposureMeterRefOffice => 'Büro';

  @override
  String get lightExposureMeterRefOvercast => 'Bewölkter Tag (im Freien)';

  @override
  String get lightExposureMeterRefFollowSpot =>
      'Verfolger / Profilscheinwerfer auf der Bühne';

  @override
  String get lightExposureMeterRefSunlight => 'Direktes Sonnenlicht';

  @override
  String get lightExposureMeterFormulaNote =>
      'Lux = (N² × 250 × 1/t) / ISO — Methode des Lichtmessers für einfallendes Licht. Werte an der Kamera ablesen (manueller Modus oder EXIF-Daten).';

  @override
  String get lightProjectionDescription =>
      'Indikative Berechnung der Spotgröße anhand von Winkel, Abstand und Durchmesser.';

  @override
  String get lightProjectionTitle => 'Projektionsgröße';

  @override
  String get menuTitle => 'Speisekarte';

  @override
  String get homeGreetingMorning => 'Guten Morgen';

  @override
  String get homeGreetingAfternoon => 'Guten Tag';

  @override
  String get homeGreetingEvening => 'Guten Abend';

  @override
  String get homeGreetingTagline =>
      'Alle deine Bühnentechnik-Tools, startklar.';

  @override
  String get mireBlendLabel => 'MISCHUNG';

  @override
  String get mireDash => '—';

  @override
  String get mireErrInvalidOverlap => '❌ Ungültige Überlappung (0 bis 99,9).';

  @override
  String get mireErrInvalidProjectors =>
      '❌ Ungültige Anzahl von Projektoren (N > 0).';

  @override
  String get mireErrInvalidWHpx => '❌ Ungültige Breite/Höhe (px).';

  @override
  String get mireExportPng => 'Exportieren PNG';

  @override
  String get mireHeightPxHint => 'zB: 1080';

  @override
  String get mireHeightPxHintMapping => 'Beispiel: 2160';

  @override
  String get mireHeightPxLabel => 'Höhe (px)';

  @override
  String get mireLedErrTileCm => '❌ Zeigt Fliesen-cm an (Breite/Höhe >0).';

  @override
  String get mireLedErrTilePx => '❌ Zeigt Kachel-Pixel an (Breite/Höhe >0).';

  @override
  String get mireLedErrTilesXY => '❌ Zeigt Kacheln X/Y (>0) an.';

  @override
  String get mireLedParamsTitle => 'LED-Wandparameter';

  @override
  String mireLedPitchComputed(Object pitch) {
    return 'Berechneter Pitch: $pitch';
  }

  @override
  String get mireLedSubtitleColorBars => 'Stangen + Rampen + Kreise';

  @override
  String get mireLedSubtitleGridLabels => 'Raster + Markierungen + Kreise';

  @override
  String get mireLedSubtitlePixelPerfect => 'Pixelgenau + Kreise';

  @override
  String get mireLedSubtitleUniformity => 'Einheitlichkeit + Kreise';

  @override
  String get mireLedTileHcmLabel => 'Fliesenhöhe (cm)';

  @override
  String get mireLedTileHpxLabel => 'Kachelhöhe (px)';

  @override
  String get mireLedTileWcmLabel => 'Fliesenbreite (cm)';

  @override
  String get mireLedTileWpxLabel => 'Kachelbreite (px)';

  @override
  String get mireLedTilesIdTitle => 'LED-/ID-FLIESEN';

  @override
  String get mireLedTilesXLabel => 'Horizontale Kacheln (X)';

  @override
  String get mireLedTilesYLabel => 'Vertikale Kacheln (Y)';

  @override
  String get mireLedTitle => 'LED / MARK';

  @override
  String get mireLedTypeColorBars => 'Stangen + Rampen + Kreise';

  @override
  String get mireLedTypeGridLabels => 'Raster + Markierungen + Kreise';

  @override
  String get mireLedTypePixelPerfect => 'Pixelgenau + Kreise';

  @override
  String get mireLedTypeTilesId => 'Kachel-ID (Anzahl + Farben)';

  @override
  String get mireLedTypeUniformity => 'Einheitlichkeit + Kreise';

  @override
  String mireLedWallResolution(Object h, Object w) {
    return 'Wandauflösung: $w × $h px';
  }

  @override
  String get mireLedWarnPitchOutOfRange =>
      '⚠️ Steigung außerhalb des Bereichs berechnet (0,5–20 mm). Überprüft die Kachel cm/px.';

  @override
  String get mireLedWarnPitchXNotY =>
      '⚠️ Teilung X ≠ Teilung Y (inhomogene Fliese). Überprüfen Sie die Maße cm und px.';

  @override
  String get mireMappingSectionTitle => 'Mapping-Ziel für mehrere Projektoren';

  @override
  String mireMappingSubtitlePattern(Object n, Object orient, Object percent) {
    return 'N=$n • Überlappung $percent% • $orient';
  }

  @override
  String get mireMappingTypeBlendRamps => 'Mischrampen';

  @override
  String get mireMappingTypeCombo =>
      'Kombination (Zonen + Überlappung + Mischung)';

  @override
  String get mireMappingTypeLabel => 'Typzuordnung';

  @override
  String get mireMappingTypeZonesOverlap => 'Zonen + Überlappung';

  @override
  String get mireOrientationHorizontal => 'Horizontal';

  @override
  String get mireOrientationLabel => 'Orientierung';

  @override
  String get mireOrientationVertical => 'Vertikal';

  @override
  String get mireOverlapHint => 'zB: 10.0';

  @override
  String get mireOverlapLabel => 'Überlappung (%)';

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
  String get mireProjectorsNHint => 'Beispiel: 2';

  @override
  String get mireProjectorsNLabel => 'Anzahl Projektoren (N)';

  @override
  String get mireSimpleSectionTitle => 'Einfacher Bildschirmtest';

  @override
  String get mireSimpleSubtitleCheckerboard => 'Schachbrett + Kreise';

  @override
  String get mireSimpleSubtitleColorBars => 'Stangen + Rampen + Kreise';

  @override
  String get mireSimpleSubtitleComboAll =>
      'Gitter + Safe + 2 zentrierte Balken + Kreise';

  @override
  String get mireSimpleSubtitleGridSafe => 'Gitter + Safe + Kreise';

  @override
  String get mireSimpleSubtitleUniformity => 'Einheitlichkeit + Kreise';

  @override
  String get mireSimpleTypeCheckerboard => 'Schachbrett + Kreise';

  @override
  String get mireSimpleTypeColorBars => 'Stangen + Rampen + Kreise';

  @override
  String get mireSimpleTypeComboAll =>
      'Kombination (Gitter + Kreise + 2 zentrierte Balken)';

  @override
  String get mireSimpleTypeGridSafe => 'Gitter + Safe + Kreise';

  @override
  String get mireSimpleTypeUniformity => 'Einheitlichkeit + Kreise';

  @override
  String get mireTileMissingPx => 'Gibt Kachel (px) für die Nummerierung an.';

  @override
  String mireTilesSubtitleBase(Object nx, Object ny, Object th, Object tw) {
    return 'Kachel ${tw}x$th px • Raster $nx x $ny';
  }

  @override
  String mireTilesSubtitlePitchEq(Object pitch) {
    return 'Steigung ~ $pitch mm';
  }

  @override
  String mireTilesSubtitlePitchXY(Object px, Object py) {
    return 'Teilung X $px • Y $py mm';
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
  String get mireTypeLabel => 'Art der Sicht';

  @override
  String get mireVideoComboTitle => 'VIDEO-/COMBO-MARKE';

  @override
  String get mireVideoMappingSectionTitle =>
      'Mapping-Ziel für mehrere Projektoren';

  @override
  String get mireVideoMappingTitle => 'VIDEO / Mapping-Ziel';

  @override
  String get mireVideoSimpleSectionTitle => 'Einfacher Bildschirmtest';

  @override
  String get mireVideoSimpleTitle => 'VIDEO / EINFACHER BILDSCHIRM';

  @override
  String get mireVideoTypeCheckerboard => 'Schachbrett + Kreise';

  @override
  String get mireVideoTypeColorBars => 'Stangen + Rampen + Kreise';

  @override
  String get mireVideoTypeCombo =>
      'Kombination (Gitter + Kreise + 2 zentrierte Balken)';

  @override
  String get mireVideoTypeGridSafe => 'Gitter + Safe + Kreise';

  @override
  String get mireVideoTypeUniformity => 'Einheitlichkeit + Kreise';

  @override
  String get mireWallNotMultipleOfTiles => 'NICHT MEHRFACH GEFLIESTE WAND';

  @override
  String get mireWidthPxHint => 'Beispiel: 1920';

  @override
  String get mireWidthPxHintMapping => 'Beispiel: 3840';

  @override
  String get mireWidthPxLabel => 'Breite (px)';

  @override
  String patchAddressLabel(Object address) {
    return 'Adresse: $address';
  }

  @override
  String patchChannelsUsed(Object count) {
    return 'Verwendete Kanäle: $count / 512';
  }

  @override
  String get patchConflictError => 'Adresskonflikt (Überlappung).';

  @override
  String get patchConflictShort => 'Konflikt';

  @override
  String patchConflicts(Object count) {
    return 'Konflikte: $count';
  }

  @override
  String get patchEditChannelsLabel => 'Kanäle';

  @override
  String get patchEditHint => 'Überprüft den Modus und die Anzahl der Kanäle.';

  @override
  String get patchEditModeLabel => 'Mode';

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
      'Die Ergebnisse sind indikativ. Erkundigen Sie sich immer bei der Konsole.';

  @override
  String get patchHomeImportMvrDescription =>
      'Analysieren Sie eine MVR-Datei und laden Sie den Patch als Referenz.';

  @override
  String get patchHomeImportMvrTitle => 'Importieren Sie einen MVR';

  @override
  String get patchHomeTitle => 'Patch DMX';

  @override
  String get patchHomeViewPatchDescription =>
      'Liste und Konflikte nach Universum.';

  @override
  String get patchHomeViewPatchTitle => 'Patch ansehen';

  @override
  String get patchHubOpenGridButton => 'Offenes Gitter';

  @override
  String get patchHubOpenMvrButton => 'Öffnen Sie MVR';

  @override
  String get patchHubStateEmpty => 'Keine Referenzen geladen.';

  @override
  String patchHubStateLoaded(Object count) {
    return 'Geladen: $count Universum';
  }

  @override
  String get patchHubStateTitle => 'Zustand';

  @override
  String get patchHubTitle => 'Hub-Patch';

  @override
  String get patchHubWorksiteBody =>
      'Importieren Sie einen MVR oder konsultieren Sie das Belegungsraster.';

  @override
  String get patchHubWorksiteTitle => 'Baustelle';

  @override
  String get patchInvalidChannelCount => 'Ungültige Anzahl von Kanälen.';

  @override
  String get patchIssueInvalidChannelCount =>
      'Die Anzahl der Kanäle muss größer oder gleich 1 sein.';

  @override
  String get patchIssueInvalidStartAddress =>
      'Die Adresse DMX muss zwischen 1 und 512 liegen.';

  @override
  String get patchIssueInvalidUniverse =>
      'Das Universum muss größer oder gleich 1 sein.';

  @override
  String get patchIssueRangeExceedsUniverse =>
      'Der Kanalbereich in diesem Universum überschreitet 512.';

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
  String get patchManualTitle => 'Manueller Patch';

  @override
  String patchModeLabel(Object mode) {
    return 'Modus: $mode';
  }

  @override
  String get patchMvrButtonAnalyzing => 'Analyse…';

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
  String get patchMvrColId => 'AUSWEIS';

  @override
  String get patchMvrColName => 'Name';

  @override
  String get patchMvrColUniverse => 'Universum';

  @override
  String get patchMvrColumnsHint =>
      'Spalten: ID, Name, Universum, Adresse, Kanäle';

  @override
  String get patchMvrFileCardHelp =>
      'Wählt eine .mvr-Datei (ZIP) zur Analyse des Patches aus.';

  @override
  String get patchMvrFileCardTitle => 'Datei';

  @override
  String get patchMvrFilterAllUniverses => 'Alle Universen';

  @override
  String get patchMvrFilterUniverseLabel => 'Nach Universum filtern';

  @override
  String get patchMvrModeNotProvided => 'Modus nicht angegeben';

  @override
  String get patchMvrOrderAsc => 'Croissant';

  @override
  String get patchMvrOrderDesc => 'Absteigend';

  @override
  String get patchMvrOrderLabel => 'Befehl';

  @override
  String get patchMvrSortAddress => 'Adresse';

  @override
  String get patchMvrSortByLabel => 'sortieren nach';

  @override
  String get patchMvrSortChannels => 'Kanäle';

  @override
  String get patchMvrSortId => 'AUSWEIS';

  @override
  String get patchMvrSortName => 'Name';

  @override
  String get patchMvrSortUniverse => 'Universum';

  @override
  String get patchMvrSortUniverseThenAddress => 'Universum dann ansprechen';

  @override
  String get patchMvrStatusCleared => 'Referenz gelöscht.';

  @override
  String get patchMvrStatusEmptyBytes => 'Leere Datei.';

  @override
  String get patchMvrStatusExtractingZip => 'Extrahieren der ZIP-Datei…';

  @override
  String patchMvrStatusFilePickFailed(Object reason) {
    return 'Datei kann nicht ausgewählt werden: $reason';
  }

  @override
  String patchMvrStatusFixturesFound(int count, int resolved) {
    return 'Gefundene Maschinen: $count (Mehrkanal: $resolved).';
  }

  @override
  String get patchMvrStatusLoadingGdtf => 'Laden GDTF…';

  @override
  String get patchMvrStatusNoContentToLoad =>
      'Kein Inhalt zum Laden vorhanden.';

  @override
  String get patchMvrStatusNoFileSelected => 'Keine Dateien ausgewählt.';

  @override
  String get patchMvrStatusNoUsableFixtures =>
      'Keine ausnutzbaren Maschinen gefunden.';

  @override
  String patchMvrStatusParseError(Object message) {
    return 'Parsing-Fehler: $message';
  }

  @override
  String get patchMvrStatusParsingContent => 'Inhaltsanalyse…';

  @override
  String patchMvrStatusReferenceLoaded(int count, int skipped, int footprints) {
    return 'Referenz geladen: $count Maschine(n) (ignoriert: $skipped, Fingerabdrücke GDTF: $footprints).';
  }

  @override
  String patchMvrStatusRestored(Object count) {
    return 'Catering: $count Maschinen';
  }

  @override
  String get patchMvrStatusSceneXmlNotFound =>
      'scene.xml nicht in MVR gefunden.';

  @override
  String get patchMvrStatusSelectingFile => 'Datei auswählen…';

  @override
  String patchMvrStatusUnsupportedFile(Object ext) {
    return 'Nicht unterstützte Datei: $ext';
  }

  @override
  String get patchMvrSummaryTitle => 'Zusammenfassung';

  @override
  String get patchMvrTitle => 'MVR importieren';

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
    return 'Konflikte: $count Kanal(e)';
  }

  @override
  String get patchUniverseGridLimitedByWidth =>
      'Begrenzt durch die Bildschirmbreite.';

  @override
  String get patchUniverseGridTitle => 'Belegung (1 bis 512)';

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
    return '• $fixture\n  $mode – $channels Kanal(e)\n  $start → $end';
  }

  @override
  String patchUniverseOccupiedCount(Object count) {
    return 'Besetzt: $count / 512';
  }

  @override
  String patchUniversePopupHeader(
      Object address, Object state, Object universe) {
    return 'Universum $universe – Adresse $address\nStatus: $state';
  }

  @override
  String get patchUniversePopupManyOccupants =>
      'Mehrere Maschinen belegen diesen Kanal.';

  @override
  String patchUniversePopupMore(Object count) {
    return '…und $count andere(r).';
  }

  @override
  String get patchUniversePopupTitleConflict => 'Konflikt';

  @override
  String get patchUniversePopupTitleFree => 'Kostenloser Kanal';

  @override
  String get patchUniversePopupTitleOccupied => 'Kanal belegt';

  @override
  String get patchUniverseReferenceNone => 'Keine Referenz geladen';

  @override
  String get patchUniverseReferenceReadOnly => 'Nur lesen (seit MVR)';

  @override
  String get patchUniverseReferenceTitle => 'Referenz';

  @override
  String get patchUniverseResetConfirm => 'Zurücksetzen';

  @override
  String get patchUniverseResetContent =>
      'Dadurch wird der von MVR geladene Patch in der Anwendung gelöscht.\nEs werden keine Daten in der Datei geändert.';

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
      'Berühren Sie ein Feld, um die Details anzuzeigen.';

  @override
  String get patchUniverseUniverseDropdownLabel => 'Universum DMX';

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
  String get photometryBeamAngleLabel => 'Abstrahlwinkel';

  @override
  String get photometryCandelaHint1 => 'Geben Sie einen Wert in cd ein';

  @override
  String get photometryCandelaHint2 => 'Geben Sie einen Wert in cd ein';

  @override
  String get photometryCandelaLabel => 'Candela';

  @override
  String get photometryDisclaimerShort =>
      'Nur als Hinweis. Schauen Sie in der Dokumentation des Herstellers nach.';

  @override
  String get photometryDistanceHint1 => 'In Metern';

  @override
  String get photometryDistanceHint3 => 'In Metern';

  @override
  String get photometryDistanceLabel => 'Distanz';

  @override
  String get photometryLumensHint2 => 'Geben Sie einen Wert in lm ein';

  @override
  String get photometryLumensHint3 => 'Geben Sie einen Wert in lm ein';

  @override
  String get photometryLumensLabel => 'Lumens';

  @override
  String get photometryLuxHint => 'Geben Sie einen Wert in Lux ein';

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
    return 'Bei $distance m, $candela cd ≈ $lux Lux.';
  }

  @override
  String photometrySummary2(Object distance, Object lumens, Object lux) {
    return 'Bei $distance m, $lumens lm ≈ $lux Lux (ungefähr).';
  }

  @override
  String photometrySummary3(
      String lumens, String distance, String angle, String lux) {
    return 'Lumens: $lumens lm — Entfernung: $distance m — Winkel: $angle° — Lux: $lux lx.';
  }

  @override
  String get projectionAngleHint => 'In Grad';

  @override
  String get projectionAngleLabel => 'Ecke';

  @override
  String get projectionAutoHelp => 'Auto: Berechnet den fehlenden Wert.';

  @override
  String projectionConeAngle(Object angle) {
    return 'Winkel: $angle°';
  }

  @override
  String projectionConeDiameter(Object diameter) {
    return 'Durchmesser: $diameter m';
  }

  @override
  String projectionConeDistance(Object distance) {
    return 'Entfernung: $distance m';
  }

  @override
  String projectionDetailAngle(Object angle) {
    return 'Winkel: $angle°';
  }

  @override
  String projectionDetailDiameter(Object diameter) {
    return 'Durchmesser: $diameter m';
  }

  @override
  String projectionDetailDistance(Object distance) {
    return 'Entfernung: $distance m';
  }

  @override
  String get projectionDiameterHint => 'In Metern';

  @override
  String get projectionDiameterLabel => 'Durchmesser';

  @override
  String get projectionDistanceHint => 'In Metern';

  @override
  String get projectionDistanceLabel => 'Distanz';

  @override
  String get projectionHeaderAutoActive => 'Automatisch aktiv';

  @override
  String get projectionHeaderNeedTwoValues =>
      'Geben Sie mindestens zwei Werte ein.';

  @override
  String get projectionInputsTitle => 'Vorspeisen';

  @override
  String get projectionResultsTitle => 'Ergebnisse';

  @override
  String get resetConsents => 'Einwilligungen zurücksetzen';

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
    return 'Format: $format\nFläche: $area m²\nLux (lm/m²): $lux\nLux eq (Gewinn): $luxEq\nLeuchtdichte: $nits Nits | $fl ft-L\nMindestschwelle ($presetLabel): $minFl ft-L → $status\nHinweis: indikative Schätzung (Lambert).';
  }

  @override
  String get videoBrightnessSectionTitle => 'Lux / Nits / ft-L + Schwelle';

  @override
  String get videoBrightnessSubtitle => 'Lux / Nits / ft-L + Schwelle';

  @override
  String get videoBrightnessTitle => 'Helligkeit';

  @override
  String get videoCalc1ErrMissing => '❌ Fehlende Daten: Abstand + Breite.';

  @override
  String videoCalc1Ok(Object ratio) {
    return '✅ Projektionsverhältnis = $ratio';
  }

  @override
  String get videoCalc1Title => 'Verhältnis (Abstand / Breite)';

  @override
  String get videoCalc2ErrMissing => '❌ Fehlende Daten: Distanz + Verhältnis.';

  @override
  String videoCalc2Ok(Object width) {
    return '✅ Bildbreite = $width m';
  }

  @override
  String get videoCalc2Title => 'Breite (Abstand/Verhältnis)';

  @override
  String get videoCalc3ErrMissingWidth => '❌ Fehlende Daten: Breite.';

  @override
  String videoCalc3Ok(Object format, Object height) {
    return '✅ Höhe = $height m ($format-Format)';
  }

  @override
  String get videoCalc3Title => 'Höhe (Breite + Format)';

  @override
  String get videoCalc4ErrGt0 => '❌ Lumens/Gain/Width muss > 0 sein.';

  @override
  String get videoCalc4ErrMissing =>
      '❌ Fehlende Daten: Lumens + Verstärkung + Breite.';

  @override
  String get videoCalc4ErrMissingSimple =>
      '❌ Fehlende Daten: Breite + Lumens + Verstärkung.';

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
    return 'Fläche: $area m² (Format $format)\nLux (lm/m²): $lux\nLux eq (Gewinn): $luxEq\nLeuchtdichte: $nits Nits | $fl ft-L\nMindestschwelle ($presetLabel): $minFl ft-L → $status\nHinweis: Die Umrechnung von Nits/ft-L basiert auf einer Lambertschen Annahme (ungefähr).';
  }

  @override
  String get videoCalc4Title => 'Helligkeit (Lux/Nits/ft-L + Schwellenwert)';

  @override
  String get videoCalc5ErrMissing =>
      '❌ Fehlende Daten: Gesamtbreite + Überlappung % + Anzahl der Strahler.';

  @override
  String get videoCalc5ErrNMin2 =>
      '❌ Die Anzahl der Projektoren muss ≥ 2 sein.';

  @override
  String get videoCalc5NHint => 'Beispiel: 2';

  @override
  String get videoCalc5NLabel => 'Anzahl Projektoren (N)';

  @override
  String videoCalc5Result(Object format, Object hTot, Object n, Object overlapM,
      Object overlapPct, Object wPer, Object wTot) {
    return 'Gesamtbreite: $wTot m\nN: $n | Überlappung: $overlapPct % (auf Projektbreite)\n\n- Breite pro Projektor: $wPer m\n- Überschneidung zwischen 2 Projekten: $overlapM m\n- Gesamthöhe (Format $format): $hTot m';
  }

  @override
  String get videoCalc5Title => 'Überlappung (Gesamtbreite + N)';

  @override
  String get videoCalc6ErrMissingBasics =>
      '❌ Fehlende Daten: Gesamtbreite + Abstand + Überlappung %.';

  @override
  String get videoCalc6ErrMissingRatio =>
      '❌ Fehlende Daten: Min. Verhältnis und/oder Max. Verhältnis.';

  @override
  String get videoCalc6GainHint => 'zB: 1.0';

  @override
  String get videoCalc6GainLabel => 'Gewinn (Berechnung 6)';

  @override
  String get videoCalc6LumensPerProjectorHint => 'Beispiel: 20000';

  @override
  String get videoCalc6LumensPerProjectorLabel => 'Lumens pro Projektor';

  @override
  String get videoCalc6LumiErrGt0 =>
      'Helligkeit: ❌ Lumens/Projekt und Verstärkung müssen > 0 sein.';

  @override
  String videoCalc6LumiForN(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Geschätzte Helligkeit (N=$n)\nFläche: $area m²\nLux eq: $lux (lm/m²)\nNits: $nits | Fuß-L: $fl';
  }

  @override
  String get videoCalc6LumiOptional =>
      'Helligkeit (optional): liefert Lumens/Projekt + Verstärkung zur Schätzung.';

  @override
  String get videoCalc6NoteIndicative =>
      'Hinweis: Indikative Schätzung (die tatsächliche Mischung/Überlappung kann sich etwas verringern).';

  @override
  String get videoCalc6RatioMaxHint => 'z.B.: 1,80';

  @override
  String get videoCalc6RatioMaxLabel => 'Maximales Verhältnis';

  @override
  String get videoCalc6RatioMinHint => 'z.B.: 1,20';

  @override
  String get videoCalc6RatioMinLabel => 'Mindestverhältnis';

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
    return 'Gesamtbreite=$wTot m | Entfernung=$distance m | Überlappung=$overlapPct%\nFormat $format → Gesamthöhe=$hTot m | Fläche=$area m²\nMin/Max-Verhältnis: $ratioMin → $ratioMax\n\nFallverhältnis offener (min) = $nMin projos | Abdeckung ≈ $covMin m\n$lumiMin\n\nFall mit engerem Verhältnis (max.) = $nMax projos | Abdeckung ≈ $covMax m\n$lumiMax\n\n$note';
  }

  @override
  String get videoCalc6Title => 'Anzahl der Autoscheinwerfer + Helligkeit';

  @override
  String videoCalcLabel(Object n) {
    return 'Berechnung $n';
  }

  @override
  String get videoCalculateAll => 'Berechnen Sie alles';

  @override
  String get videoCalculationsTitle => 'Videoberechnungen';

  @override
  String get videoCommonParamsTitle => 'Allgemeine Einstellungen';

  @override
  String videoCommonPillArea(Object value) {
    return 'Bereich: $value';
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
    return 'Überlappung: $value';
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
      'Indikative Berechnungen. Überprüfen Sie immer die Dokumentation des Herstellers.';

  @override
  String get videoDistanceHint => 'zB: 12.0';

  @override
  String get videoDistanceLabel => 'Wurfweite (m)';

  @override
  String get videoErrImpossibleDenom => '❌ Unmögliche Parameter (Denom ≤ 0).';

  @override
  String get videoErrOverlapRange =>
      '❌ Überlappung % muss zwischen 0 und 99,9 liegen.';

  @override
  String get videoErrRatioGt0 => '❌ Das Verhältnis muss > 0 sein.';

  @override
  String get videoErrTotalWidthAndDistanceGt0 =>
      '❌ Gesamtbreite und -abstand müssen > 0 sein.';

  @override
  String get videoErrTotalWidthGt0 => '❌ Gesamtbreite muss > 0 sein.';

  @override
  String get videoErrWidthGt0 => '❌ Breite muss > 0 sein.';

  @override
  String get videoExportPdfTooltip => 'Exportieren PDF';

  @override
  String get videoFormatLabel => 'Format (Verhältnis)';

  @override
  String get videoGainHint => 'zB: 1.0';

  @override
  String get videoGainLabel => 'Gewinnen';

  @override
  String get videoImageWidthHint => 'zB: 6.0';

  @override
  String get videoImageWidthLabel => 'Bildbreite (m)';

  @override
  String get videoLedCalcTitle => 'Berechnung – Pixel/Kacheln';

  @override
  String get videoLedErrAllGt0 => '❌ Alle Werte müssen > 0 sein.';

  @override
  String get videoLedErrMissingInputs =>
      '❌ Fehlende Daten: Kacheln X/Y + Kachel px + Kachel cm.';

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
    return '✅ Wandauflösung: $wallWpx × $wallHpx px\n✅ Wandgröße: $wallWm × $wallHm m\nFliese: $tileWpx×$tileHpx px • $tileWcm×$tileHcm cm\nBerechneter Pitch: $pitch';
  }

  @override
  String get videoLedSubtitle =>
      'Pixel der LED-Wand nach Größe, Abstand, Abmessung der Fliesen.';

  @override
  String get videoLedTileHcmHint => 'z.B.: 33,28';

  @override
  String get videoLedTileHcmLabel => 'Fliesenhöhe (cm)';

  @override
  String get videoLedTileHpxHint => 'z.B.: 128';

  @override
  String get videoLedTileHpxLabel => 'Kachelhöhe (px)';

  @override
  String get videoLedTileWcmHint => 'z.B.: 33,28';

  @override
  String get videoLedTileWcmLabel => 'Fliesenbreite (cm)';

  @override
  String get videoLedTileWpxHint => 'z.B.: 128';

  @override
  String get videoLedTileWpxLabel => 'Kachelbreite (px)';

  @override
  String get videoLedTilesXHint => 'Beispiel: 15';

  @override
  String get videoLedTilesXLabel => 'Horizontale Kacheln (X)';

  @override
  String get videoLedTilesYHint => 'Beispiel: 8';

  @override
  String get videoLedTilesYLabel => 'Vertikale Kacheln (Y)';

  @override
  String get videoLedTitle => 'LED';

  @override
  String get videoLensMeasureSubtitle =>
      'Verhältnis / Breite / Höhe (Berechnungen 1 bis 3).';

  @override
  String get videoLensMeasureTitle => 'Objektiv & Messung';

  @override
  String get videoLmCalc1Title => 'Verhältnis (Abstand / Breite)';

  @override
  String get videoLmCalc2Title => 'Breite (Abstand/Verhältnis)';

  @override
  String get videoLmCalc3Title => 'Höhe (Breite + Format)';

  @override
  String get videoLmDistanceHint => 'zB: 12.0';

  @override
  String get videoLmDistanceLabel => 'Wurfweite (m)';

  @override
  String get videoLmErrMissingDistanceRatio =>
      '❌ Fehlende Daten: Distanz + Verhältnis.';

  @override
  String get videoLmErrMissingDistanceWidth =>
      '❌ Fehlende Daten: Abstand + Breite.';

  @override
  String get videoLmErrMissingWidthOnly => '❌ Fehlende Daten: Breite.';

  @override
  String get videoLmErrRatioGt0 => '❌ Verhältnis muss > 0 sein.';

  @override
  String get videoLmErrWidthGt0 => '❌ Breite muss > 0 sein.';

  @override
  String get videoLmFormatLabel => 'Format (Verhältnis)';

  @override
  String get videoLmImageWidthHint => 'zB: 6.0';

  @override
  String get videoLmImageWidthLabel => 'Bildbreite (m)';

  @override
  String videoLmResultHeight(Object format, Object height) {
    return '✅ Höhe = $height m ($format-Format)';
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
  String get videoLmThrowRatioHint => 'z.B.: 1,60';

  @override
  String get videoLmThrowRatioLabel => 'Wurfverhältnis';

  @override
  String get videoLumensHint => 'Beispiel: 20000';

  @override
  String get videoLumensLabel => 'Lumens (ANSI)';

  @override
  String get videoMireHeaderSubtitle =>
      'Indikative Ziele (Kalierung, Fokus, Geometrie, Mischung, Pixel-Perfekt).';

  @override
  String get videoMireHeaderTitle => 'Mustergenerator';

  @override
  String get videoMireScreenLedSubtitle =>
      'Ziel nach BxH px (Pixel perfekt, Gleichmäßigkeit, Raster).';

  @override
  String get videoMireScreenLedTitle => 'LED-Bildschirmziel';

  @override
  String get videoMireScreenVideoSubtitle =>
      'Einfach (BxH px) + Multiprojekt-Mapping (N + Überlappung).';

  @override
  String get videoMireScreenVideoTitle => 'Videobildschirmtest';

  @override
  String get videoMireTitle => 'Schlamm';

  @override
  String get videoMpCalc5Title => 'Breite pro Projektor';

  @override
  String get videoMpCalc6Title => 'Anzahl der Projektoren (Min/Max-Verhältnis)';

  @override
  String videoMpCaseOpenMin(Object coverage, Object n) {
    return 'Fallverhältnis offener (min) = $n projos | Abdeckung ≈ $coverage m';
  }

  @override
  String videoMpCaseTightMax(Object coverage, Object n) {
    return 'Fall mit engerem Verhältnis (max) = $n projos | Abdeckung ≈ $coverage m';
  }

  @override
  String get videoMpDistanceHint => 'zB: 12.0';

  @override
  String get videoMpDistanceLabel => 'Wurfweite (m)';

  @override
  String get videoMpErrImpossibleDenom => '❌ Unmögliche Parameter (Denom ≤ 0).';

  @override
  String get videoMpErrInvalidRatio =>
      '❌ Ungültiges Verhältnis (muss > 0 sein).';

  @override
  String get videoMpErrMissing5 =>
      '❌ Fehlende Daten: Gesamtbreite + Überlappung % + N.';

  @override
  String get videoMpErrMissing6Main =>
      '❌ Fehlende Daten: Gesamtbreite + Abstand + Überlappung %.';

  @override
  String get videoMpErrMissingRatios =>
      '❌ Fehlende Daten: Min. Verhältnis und/oder Max. Verhältnis.';

  @override
  String get videoMpErrNGte2 => '❌ N muss ≥ 2 sein.';

  @override
  String get videoMpErrOverlapRange =>
      '❌ Überlappung % muss zwischen 0 und 99,9 liegen.';

  @override
  String get videoMpErrWidthDistanceGt0 =>
      '❌ Gesamtbreite und -abstand müssen > 0 sein.';

  @override
  String get videoMpErrWidthGt0 => '❌ Gesamtbreite muss > 0 sein.';

  @override
  String get videoMpFormatLabel => 'Format (Verhältnis)';

  @override
  String get videoMpGainHint => 'zB: 1.0';

  @override
  String get videoMpGainLabel => 'Gewinnen';

  @override
  String get videoMpLumensPerProjectorHint => 'Beispiel: 20000';

  @override
  String get videoMpLumensPerProjectorLabel => 'Lumens pro Projektor';

  @override
  String get videoMpLumiErrLumensGainGt0 =>
      'Helligkeit: ❌ Lumens/Projekt und Verstärkung müssen > 0 sein.';

  @override
  String videoMpLumiEstimated(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Geschätzte Helligkeit (N=$n)\nFläche: $area m²\nLux Äq: $lux\nNits: $nits | Fuß-L: $fl';
  }

  @override
  String get videoMpLumiOptionalHint =>
      'Helligkeit (optional): Eingabe von Lumens/projo + Verstärkung zur Schätzung.';

  @override
  String get videoMpNoteIndicative => 'Hinweis: Richtschätzung.';

  @override
  String get videoMpOptionalLuminanceTitle => 'Optional: Helligkeit';

  @override
  String get videoMpOverlapHint => 'z.B.: 10';

  @override
  String get videoMpOverlapLabel => 'Überlappung (%)';

  @override
  String get videoMpProjectorCountHint => 'Beispiel: 2';

  @override
  String get videoMpProjectorCountLabel => 'Anzahl Projektoren (N)';

  @override
  String get videoMpRatioMaxHint => 'z.B.: 1,80';

  @override
  String get videoMpRatioMaxLabel => 'Maximales Verhältnis';

  @override
  String get videoMpRatioMinHint => 'z.B.: 1,20';

  @override
  String get videoMpRatioMinLabel => 'Mindestverhältnis';

  @override
  String get videoMpTotalWidthHint => 'Beispiel: 18.0';

  @override
  String get videoMpTotalWidthLabel => 'Gesamtprojektionsbreite (m)';

  @override
  String get videoMultiprojectorSubtitle =>
      'Überlappung + Breite/Projektion + Anzahl der Projekte (Berechnungen 5 und 6).';

  @override
  String get videoMultiprojectorTitle => 'Multiprojektor';

  @override
  String get videoOptionalBrightnessTitle => 'Optional: Helligkeit';

  @override
  String get videoOverlapHint => 'z.B.: 10';

  @override
  String get videoOverlapLabel => 'Überlappung (%)';

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
  String get videoPdfCalc5N => 'N (berechnet5)';

  @override
  String get videoPdfCalc6 => 'Berechnung 6';

  @override
  String get videoPdfCalc6Gain => 'Gewinn (calc6)';

  @override
  String get videoPdfCalc6LumensPerProj => 'Lumens/projo (calc6)';

  @override
  String get videoPdfCalc6RatioMax => 'Maximales Verhältnis (calc6)';

  @override
  String get videoPdfCalc6RatioMin => 'Min. Verhältnis (calc6)';

  @override
  String get videoPdfDate => 'Datum';

  @override
  String get videoPdfDistance => 'Entfernung (m)';

  @override
  String get videoPdfFormat => 'Format';

  @override
  String get videoPdfGain => 'Gewinnen';

  @override
  String get videoPdfImageWidth => 'Bildbreite (m)';

  @override
  String get videoPdfLumens => 'Lumens';

  @override
  String get videoPdfOverlap => 'Überlappung (%)';

  @override
  String get videoPdfParams => 'Einstellungen';

  @override
  String get videoPdfRatio => 'Verhältnis';

  @override
  String get videoPdfResults => 'Ergebnisse';

  @override
  String get videoPdfScreenPreset => 'Bildschirmvoreinstellung';

  @override
  String get videoPdfTitle => 'Meine technische App – Videoexport';

  @override
  String get videoPdfTotalWidth => 'Gesamtbreite (m)';

  @override
  String get videoPresetFrontGrey =>
      'Vorderseite – grauer Bildschirm (Verstärkung 0,8)';

  @override
  String get videoPresetFrontGreyShort => 'Vorderseite - grauer Bildschirm';

  @override
  String get videoPresetFrontHighGain =>
      'Vorderseite – Bildschirm mit hoher Verstärkung (Verstärkung 1,3)';

  @override
  String get videoPresetFrontHighGainShort =>
      'Vorderseite – Bildschirm mit hoher Verstärkung';

  @override
  String get videoPresetFrontWhite =>
      'Vorderseite – mattweißer Bildschirm (Gain 1,0)';

  @override
  String get videoPresetFrontWhiteShort =>
      'Vorderseite - mattweißer Bildschirm';

  @override
  String get videoPresetMappingDarkStone =>
      'Kartierung – Dunkler Stein (Gewinn 0,35)';

  @override
  String get videoPresetMappingDarkStoneShort => 'Kartierung – dunkler Stein';

  @override
  String get videoPresetMappingGlass => 'Mapping – Fenster (Gewinn 0,15)';

  @override
  String get videoPresetMappingGlassShort => 'Zuordnung – Fenster';

  @override
  String get videoPresetMappingLightStone =>
      'Kartierung – Heller Stein (Gewinn 0,6)';

  @override
  String get videoPresetMappingLightStoneShort => 'Kartierung – heller Stein';

  @override
  String get videoPresetMappingMatte => 'Mapping – Mattlack (Gewinn 0,75)';

  @override
  String get videoPresetMappingMatteShort => 'Mapping – Mattlack';

  @override
  String get videoPresetMappingSatin => 'Mapping – Satinfarbe (Gewinn 0,9)';

  @override
  String get videoPresetMappingSatinShort => 'Mapping – Satinfarbe';

  @override
  String get videoPresetRearClear => 'Retro – helle Leinwand (Verstärkung 0,9)';

  @override
  String get videoPresetRearClearShort => 'Retro - leichte Leinwand';

  @override
  String get videoPresetRearDiffusion =>
      'Retro – Diffusionsleinwand (Gewinn 0,7)';

  @override
  String get videoPresetRearDiffusionShort => 'Retro - Diffusionsleinwand';

  @override
  String get videoScreenPresetLabel => 'Bildschirm / Support (voreingestellt)';

  @override
  String get videoSummaryPillsTitle => 'Zusammenfassung (Pellets)';

  @override
  String get videoTestPatternSubtitle =>
      'Erstellung eines Videomusters für Leinwand und LED-Wand (wird später erledigt).';

  @override
  String get videoTestPatternTitle => 'Schlamm';

  @override
  String get videoThrowRatioHint => 'z.B.: 1,60';

  @override
  String get videoThrowRatioLabel => 'Wurfverhältnis';

  @override
  String get videoTitle => 'Video';

  @override
  String get videoToolsTitle => 'Video-Tools';

  @override
  String get videoTotalWidthHint => 'Beispiel: 18.0';

  @override
  String get videoTotalWidthLabel => 'Gesamtprojektionsbreite (m)';

  @override
  String get aboutArtnetTitle => 'Art-Net';

  @override
  String get aboutArtnetToc01 => '1) Art-Net – was ist das und warum';

  @override
  String get aboutArtnetToc02 =>
      '2) Adressierung & Universum – eigene Zuordnung';

  @override
  String get aboutArtnetToc03 =>
      '3) Grenzen und Leistung – was zuerst kaputt geht';

  @override
  String get aboutArtnetToc04 => '4) Knoten, Splitter und RDM';

  @override
  String get aboutArtnetToc05 => '5) Fehlerbehebung – Symptome → Ursachen';

  @override
  String get aboutArtnetToc06 => '6) Schemata (Netzwerk/Unicast vs. Broadcast)';

  @override
  String get aboutArtnetToc07 => '6bis) Bilder (Assets) – RJ45/Switch/Kabel';

  @override
  String get aboutArtnetToc08 => '7) Kurze Checkliste';

  @override
  String get aboutDmxToc01 => '1) DMX, Universum, Adressen – die Basis';

  @override
  String get aboutDmxToc02 => '2) Frame DMX – Pause, Startcode, Kanäle';

  @override
  String get aboutDmxToc03 => '3) RS-485-Verkabelung – Topologie und Kabel';

  @override
  String get aboutDmxToc04 =>
      '4) Terminierung und Splitter – vermeiden Sie Reflexionen';

  @override
  String get aboutDmxToc05 => '4bis) MDR – Grenzwerte und Kompatibilitäten';

  @override
  String get aboutDmxToc06 => '5) Fehlerbehebung vor Ort – Symptome → Ursachen';

  @override
  String get aboutDmxToc07 => '6) Art-Net – Feld-Benchmarks';

  @override
  String get aboutDmxToc08 => '7) sACN / E1.31 – Multicast, IGMP, Prioritäten';

  @override
  String get aboutDmxToc09 => '8) DMX vs. Art-Net vs. sACN – wählen Sie';

  @override
  String get aboutDmxToc10 => '10) Kurze Checkliste';

  @override
  String get aboutDmxToc11 => '10) Kurze Checkliste';

  @override
  String get aboutElectriciteTitle => 'Strom';

  @override
  String get aboutElectriciteToc01 => '1) Grundlagen (W, A, V, kW)';

  @override
  String get aboutElectriciteToc02 => '2) Anschlüsse (Schuko / P17 / PowerCON)';

  @override
  String get aboutElectriciteToc03 => '3) Mono / Tri (was ändert sich)';

  @override
  String get aboutElectriciteToc04 => '4) Schneller Tisch (16A → 400A)';

  @override
  String get aboutElectriciteToc05 => '5) Sicherheits- und Geländefallen';

  @override
  String get aboutElectriciteToc06 => '6) Checkliste';

  @override
  String get aboutInformatiqueTitle => 'Informatik';

  @override
  String get aboutInformatiqueToc01 => '1) USB / USB-C / Thunderbolt';

  @override
  String get aboutInformatiqueToc02 => '2) Speicher (SATA/NVMe/SSD)';

  @override
  String get aboutInformatiqueToc03 => '3) Videoanschlüsse (DP / HDMI)';

  @override
  String get aboutInformatiqueToc04 => '4) PCIe/GPU (Benchmarks)';

  @override
  String get aboutInformatiqueToc05 => '5) Checkliste (Tablett)';

  @override
  String get aboutIpBasicsToc01 => '1) Was ist eine IP und wozu dient sie?';

  @override
  String get aboutIpBasicsToc02 =>
      '2) Warum 192.x / 10.x / 172.x? (Privatadressen)';

  @override
  String get aboutIpBasicsToc03 => '3) Maske und Subnetze: Wirklich verstehen';

  @override
  String get aboutIpBasicsToc04 => '4) DHCP, Gateway, DNS: Wer macht was?';

  @override
  String get aboutIpBasicsToc05 =>
      '5) Wie zwei Geräte miteinander kommunizieren (LAN vs. Off-LAN)';

  @override
  String get aboutIpBasicsToc06 =>
      '6) Einfache „Anzeige“ von IP-Plänen (kopierbare Beispiele)';

  @override
  String get aboutIpBasicsToc07 =>
      '7) Fehlerbehebung: Symptome → Ursachen (Feldmethode)';

  @override
  String get aboutIpBasicsToc08 =>
      '8) Mini-Übungen (schnell eine Maske/ein Netzwerk prüfen)';

  @override
  String get aboutIpBasicsToc09 => '9) Kurze Checkliste';

  @override
  String get aboutNetworkTitle => 'Netzwerk (EN)';

  @override
  String get aboutNetworkToc01 => '1) Ziel: stabiles Netzwerk';

  @override
  String get aboutNetworkToc02 => '2) IP-Plan (einfach)';

  @override
  String get aboutNetworkToc03 => '3) VLAN (Trennung)';

  @override
  String get aboutNetworkToc04 => '4) IGMP (sACN Multicast)';

  @override
  String get aboutNetworkToc05 => '5) WLAN vs. kabelgebunden';

  @override
  String get aboutNetworkToc06 => '6) Schalter: was Sie brauchen';

  @override
  String get aboutNetworkToc07 => '7) Schemata';

  @override
  String get aboutNetworkToc08 => '7bis) Bilder (Assets)';

  @override
  String get aboutNetworkToc09 => '8) Checkliste';

  @override
  String get aboutReseauTitle => 'Netzwerk';

  @override
  String get aboutReseauToc01 => '1) Netzwerkgrundlagen (LAN / IP / Durchsatz)';

  @override
  String get aboutReseauToc02 => '2) RJ45 & Kategorien (Cat5e/6/6A/…)';

  @override
  String get aboutReseauToc03 => '3) PoE (Netzwerk-Stromversorgung)';

  @override
  String get aboutReseauToc04 => '4) Glasfaser (SM/MM) + Anschlüsse (LC/SC)';

  @override
  String get aboutReseauToc05 => '5) SFP / SFP+ / QSFP (Module)';

  @override
  String get aboutReseauToc06 => '6) Switches (VLAN / IGMP / QoS)';

  @override
  String get aboutReseauToc07 => '7) Art-Net / sACN im Netzwerk (Beratung)';

  @override
  String get aboutReseauToc08 => '8) Checkliste';

  @override
  String get aboutSacnToc01 => '1) Wofür wird sACN verwendet?';

  @override
  String get aboutSacnToc02 => '2) Universum (Nummerierung)';

  @override
  String get aboutSacnToc03 => '3) Multicast / Unicast + IGMP';

  @override
  String get aboutSacnToc04 => '4) Prioritäten (mehrere Quellen)';

  @override
  String get aboutSacnToc05 => '5) Grenzen/Leistung';

  @override
  String get aboutSacnToc06 =>
      '6) RDM & sACN (Proxy / abhängig von der Hardware)';

  @override
  String get aboutSacnToc07 => '7) Schemata';

  @override
  String get aboutSacnToc08 => '7bis) Bilder (Assets)';

  @override
  String get aboutSacnToc09 => '8) Checkliste';

  @override
  String get aboutVideoToc01 => '1) Video-Grundlagen (Schlüsselwörter)';

  @override
  String get aboutVideoToc02 => '2) Auflösung und FPS';

  @override
  String get aboutVideoToc03 => '3) Farbe (4:4:4 / 4:2:2 / 10-Bit)';

  @override
  String get aboutVideoToc04 => '4) Synchronisierung (Genlock / Timecode)';

  @override
  String get aboutVideoToc05 => '5) Kabel und Entfernungen';

  @override
  String get aboutVideoToc06 => '6) SDI (3G/6G/12G)';

  @override
  String get aboutVideoToc07 => '7) HDMI – Feld';

  @override
  String get aboutVideoToc08 => '8) NDI – wann / warum / Grenzen';

  @override
  String get aboutVideoToc09 => '9) Mapping / LED / Multiprojekt';

  @override
  String get aboutVideoToc10 => '10) Checkliste vor Ort';

  @override
  String get aboutTileDmxTitle => 'DMX – Bedienung (einfach und vollständig)';

  @override
  String get aboutTileArtnetTitle =>
      'Art-Net – DMX über IP (Knoten, Unicast/Broadcast)';

  @override
  String get aboutTileSacnTitle =>
      'sACN / E1.31 – Multicast, IGMP, Prioritäten';

  @override
  String get aboutTileIpBasicsTitle =>
      'Netzwerk – IP-Basen/Maske/DHCP (wesentlich)';

  @override
  String get aboutTileReseauTitle =>
      'Netzwerk – RJ45 / Glasfaser / Geschwindigkeiten und Längen';

  @override
  String get aboutTileNetworkTitle =>
      'Leichtes Netzwerk – VLAN, IGMP, Wi-Fi vs. kabelgebunden';

  @override
  String get aboutTileVideoTitle => 'Video – SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutTileElectriciteTitle => 'Elektrisch – Schuko / P17 / Strom';

  @override
  String get aboutTileElectriciteSubtitle =>
      'Steckverbinder, Mono/Tri, schnelle kW-Tabellen (16A→400A), Feldfallen.';

  @override
  String get aboutTileInformatiqueTitle =>
      'Computer – USB / HDMI / DP / SATA / NVMe…';

  @override
  String get aboutTileInformatiqueSubtitle =>
      'Nützliche Geschwindigkeiten, Versionen, echte Grenzen, Marketing-Fallstricke.';

  @override
  String get aboutTitle => 'Um';

  @override
  String get homeRiggingTitle => 'Rigging';

  @override
  String get homeRiggingSubtitle => 'Zäume: Schlingenwinkel und -längen.';

  @override
  String get riggingTitle => 'Rigging';

  @override
  String get riggingAngleLengthTitle => 'Waagewinkel und Schlingenlänge';

  @override
  String get riggingSymmetryNote =>
      'Hypothese: symmetrisches Zaumzeug (2 identische Stränge). Keine Lastberechnung.';

  @override
  String get riggingInputsTitle => 'Vorspeisen';

  @override
  String get riggingSpanLabel => 'Achsabstand (Abstand zwischen Punkten)';

  @override
  String get riggingSpanHint => 'Beispiel: 2,40';

  @override
  String get riggingDropLabel => 'Pfeil (vertikaler Abfall)';

  @override
  String get riggingDropHint => 'Beispiel: 0,60';

  @override
  String get riggingUnitMeters => 'M';

  @override
  String get riggingResultsTitle => 'Ergebnisse';

  @override
  String get riggingNeedPositiveValues => 'Geben Sie Werte > 0 ein.';

  @override
  String get riggingLegLengthLabel => 'Länge eines Strangs';

  @override
  String get riggingAngleToHorizontalLabel => 'Winkel relativ zur Horizontalen';

  @override
  String get riggingAngleToVerticalLabel => 'Winkel relativ zur Vertikalen';

  @override
  String get riggingDisclaimerShort =>
      'Indikative Ergebnisse. Zur Validierung entsprechend Ihrem Kontext und Ihren Rigging-Praktiken.';

  @override
  String get riggingCalcLegDropTitle => 'Länge + Pfeil → Reichweite';

  @override
  String get riggingCalcLegDropHelp =>
      'Symmetrische Schlinge (2 Beine): Berechnet die Reichweite aus der Schlingenlänge und dem Durchhang.';

  @override
  String get riggingLegLengthInputLabel => 'Länge eines Strangs';

  @override
  String get riggingLegLengthInputHint => 'Beispiel: 2,50';

  @override
  String get riggingInvalidTriangle =>
      'Unmöglich: Die Länge muss größer als der Pfeil sein.';

  @override
  String get riggingCalcLegAngleTitle => 'Länge + Winkel → Reichweite + Pfeil';

  @override
  String get riggingCalcLegAngleHelp =>
      'Symmetrische Schlinge (2 Beine): Berechnet Reichweite und Durchhang aus der Länge und dem Winkel relativ zur Horizontalen.';

  @override
  String get riggingAngleHorizontalInputLabel =>
      'Winkel relativ zur Horizontalen';

  @override
  String get riggingAngleHorizontalInputHint => 'Beispiel: 30';

  @override
  String get riggingInvalidAngle =>
      'Ungültiger Winkel: zwischen 0° und 90° (ausgeschlossen).';

  @override
  String get riggingUnitDegrees => '°';

  @override
  String get riggingCalc1Title => 'Achsabstand + Pfeil → Länge & Winkel';

  @override
  String get riggingCalc1Subtitle =>
      'Symmetrisches Zaumzeug (2 identische Stränge). Gewicht angezeigt (Info). Keine Lastberechnung.';

  @override
  String get riggingCalc2Title => 'Achsabstand + Winkel (H) → Pfeil & Länge';

  @override
  String get riggingCalc2Subtitle =>
      'Winkel relativ zur Horizontalen. Symmetrisches Zaumzeug. Keine Lastberechnung.';

  @override
  String get riggingCalc3Title => 'Achsabstand + Länge → Pfeil & Winkel';

  @override
  String get riggingCalc3Subtitle =>
      'Länge eines Strangs bekannt. Symmetrisches Zaumzeug. Keine Lastberechnung.';

  @override
  String get riggingLegLengthHint => 'Beispiel: 4,70';

  @override
  String get riggingAngleHint => 'Beispiel: 45';

  @override
  String get riggingInvalidGeometry =>
      'Unmögliche Geometrie (Länge zu kurz für den Achsabstand).';

  @override
  String get riggingSchemaTitle => 'Planen';

  @override
  String get riggingSchemaCaption1 =>
      'Eingaben: Bereich + Pfeil. Ausgänge: Schlingenlänge + Winkel.';

  @override
  String get riggingSchemaCaption2 =>
      'Eingaben: Reichweite + Schlingenlänge. Ausgänge: Pfeil + Winkel.';

  @override
  String get riggingSchemaCaption3 =>
      'Eingaben: Reichweite + Winkel (horizontal). Ausgaben: Pfeil + Länge.';

  @override
  String get riggingAngleHInputLabel => 'Winkel (relativ zur Horizontalen)';

  @override
  String get riggingAngleHInputHint => 'Beispiel: 45';

  @override
  String get riggingDropResultLabel => 'Pfeil (fallen lassen)';

  @override
  String get riggingSchemaLabelSpan => 'Achsabstand';

  @override
  String get riggingSchemaLabelDrop => 'Pfeil';

  @override
  String get riggingSchemaLabelLeg => 'Strand';

  @override
  String get riggingWeightLabel => 'Gewicht (Info)';

  @override
  String get riggingUnitKg => 'kg';

  @override
  String get riggingImpossibleGeometry =>
      'Geometrie unmöglich: Die Länge einer Litze muss > (Achsabstand / 2) sein.';

  @override
  String get riggingDisclaimerNoLoad =>
      'Das Gewicht wird nur zu Informationszwecken angezeigt. Keine Ladungs-/Spannungsberechnung. Gültig entsprechend Ihrem Rigging-Kontext.';

  @override
  String get riggingCalcCommonSubtitle =>
      '2-strängiges Zaumzeug. Gewicht angezeigt (Info). Keine Lastberechnung.';

  @override
  String get riggingOffCenterToggle => 'Außermittige Belastung';

  @override
  String get riggingOffsetLabel => 'Offset A → laden';

  @override
  String get riggingInvalidOffset =>
      'Offset ungültig: muss > 0 und < Achsabstand sein.';

  @override
  String get riggingLegLeftLabel => 'Linke Stranglänge';

  @override
  String get riggingLegRightLabel => 'Gerade Stranglänge';

  @override
  String get riggingAngleHLeftLabel => 'Winkel H (links)';

  @override
  String get riggingAngleHRightLabel => 'Winkel H (rechts)';

  @override
  String get riggingAngleVLeftLabel => 'Winkel V (links)';

  @override
  String get riggingAngleVRightLabel => 'Winkel V (rechts)';

  @override
  String get riggingBridleAnglesLegend => 'Angles';

  @override
  String get riggingIncludedAngleLabel => 'Winkel zwischen den Strängen';

  @override
  String get riggingAngleHLeftInputLabel => 'Winkel H (linker Strang)';

  @override
  String get riggingLegLeftInputLabel => 'Länge (linker Strang)';

  @override
  String get riggingNeedValidValues => 'Geben Sie gültige positive Werte ein.';

  @override
  String get photometrySection4Title => 'Lux → Lumen';

  @override
  String get photometryAreaLabel => 'Fläche (m²)';

  @override
  String get photometryAreaHint4 => 'Beispiel: 12.5';

  @override
  String photometrySummary4(Object lumens, Object lux, Object area) {
    return 'E = $lux lx • S = $area m² → Φ = $lumens lm';
  }

  @override
  String get aboutArtnetTocConversionTitle => 'Konvertierungen';

  @override
  String get aboutArtnetConversionIntro =>
      'Nützliche Konvertierungstools für die Universen DMX, Art-Net und Hexadezimalwerte.';

  @override
  String get aboutUniverseToArtnetTitle => 'Universum → Art-Net';

  @override
  String get aboutUniverseToArtnetSubtitle =>
      'Finden Sie Subnetz + Universum (Netz-/Port-Adresse) aus einem Universum DMX.';

  @override
  String get aboutUniverseToHexTitle => 'Universum → Hex';

  @override
  String get aboutUniverseToHexSubtitle =>
      'Konvertieren Sie ein Universum (1…N) in einen Index und einen Hexadezimalwert.';

  @override
  String get aboutArtnetConversionNote =>
      'Hinweis: Die Art-Net-Konventionen können je nach Konsole variieren (Adressierung, Basis 0/1). Überprüfen Sie immer Ihre Systemdokumentation.';

  @override
  String get elecTocCopyText => 'Zusammenfassung kopieren';

  @override
  String get elecToc1 => '1) Grundlagen (W, A, V, kW)';

  @override
  String get elecToc2 => '2) Anschlüsse (Schuko / P17 / PowerCON)';

  @override
  String get elecToc3 => '3) Mono / Tri (was ändert sich)';

  @override
  String get elecToc4 => '4) Schneller Tisch (16A → 400A)';

  @override
  String get elecToc5 => 'Umrechnung kVA → kW / A';

  @override
  String get elecToc6 => '6) Sicherheits- und Feldfallen';

  @override
  String get elecToc7 => '6) Checkliste';

  @override
  String get elecKvaTitle => 'Tabelle kVA → kW (nach cos φ)';

  @override
  String get elecKvaFormula => 'Formel: kW = kVA × cos φ';

  @override
  String get elecKvaIntro =>
      'Diese Tabelle gibt eine schnelle Abschätzung der Wirkleistung (kW) aus einer Scheinleistung (kVA).';

  @override
  String get elecKvaNote =>
      'Richtwerte. Verwenden Sie die tatsächlichen Werte von cos φ, wenn Sie diese kennen.';

  @override
  String get elecKvaColKva => 'kVA';

  @override
  String get elecKvaColPf08 => 'kW (cos φ = 0,8)';

  @override
  String get elecKvaColPf10 => 'kW (cos φ = 1,0)';

  @override
  String get commonTocTitle => 'Zusammenfassung';

  @override
  String get commonCopySummaryTooltip => 'Zusammenfassung kopieren';

  @override
  String get aboutLightReferenceTitle => 'Beleuchtungsreferenzen';

  @override
  String get refCriTitle => 'IRC / CRI';

  @override
  String get refKelvinTitle => 'Farbtemperatur (K)';

  @override
  String get refBeamFieldTitle => 'Strahl/Feld';

  @override
  String get refLuxTitle => 'Beleuchtungsstärken (Lux)';

  @override
  String get refCriContent =>
      'CRI (CRI) misst die Farbtreue. Je höher er ist, desto natürlicher erscheinen die Farben.';

  @override
  String get refKelvinContent =>
      'Die Farbtemperatur beschreibt den Weißton (warm bis kühl).';

  @override
  String get refBeamFieldContent =>
      'Der Strahl ist der Winkel des Hauptstrahls; Das Feld ist der Winkel, in dem die Intensität schwächer wird (Grenze).';

  @override
  String get refBeamLegendBeam => 'Strahl';

  @override
  String get refBeamLegendField => 'Feld';

  @override
  String get refLuxIntro => 'Richtwerte für die Beleuchtung je nach Nutzung.';

  @override
  String get refLuxColUse => 'Verwenden';

  @override
  String get refLuxColLux => 'Lux';

  @override
  String get refLuxUseCorridor => 'Korridor / Zirkulation';

  @override
  String get refLuxUseBackstage => 'Backstage / Technik';

  @override
  String get refLuxUseMeeting => 'Besprechungsraum';

  @override
  String get refLuxUseExpo => 'Ausstellung / Showroom';

  @override
  String get refLuxUseStageGeneral => 'Szene – allgemein';

  @override
  String get refLuxUseStageTv => 'Bühne – Fernsehen / Aufnahme';

  @override
  String get refLuxNote =>
      'Diese Werte variieren je nach Standards und Randbedingungen (Kamera, Kontrast, Atmosphäre).';

  @override
  String get refLightDisclaimerShort =>
      'Indikative Referenzen – kein Standard.';

  @override
  String get refCri90 => 'Ausgezeichnet (≥90)';

  @override
  String get refCri80 => 'Gut (≈ 80)';

  @override
  String get refCriLow => 'Niedrig (< 80)';

  @override
  String get aboutUniverseToArtnetImportantTitle => 'Wichtig';

  @override
  String get aboutUniverseToArtnetImportantBody =>
      'Einige Konsolen verwenden Basis 0 (Universum 0..15) und andere verwenden Basis 1 (Universum 1..16).';

  @override
  String get aboutUniverseToArtnetTableTitle => 'Universumstabelle → Art-Net';

  @override
  String get aboutUniverseToArtnetTableIntro =>
      'Typische Korrespondenz zwischen dem Universum DMX und der Adressierung Art-Net.';

  @override
  String get aboutUniverseTablesDisclaimer =>
      'Überprüfen Sie immer Ihre Konsolen-/Knotenkonvention.';

  @override
  String get aboutUniverseToArtnetColDmx => 'Universum DMX';

  @override
  String get aboutUniverseToArtnetColUniHex => 'Einfach (hex)';

  @override
  String aboutUniverseToArtnetSubnetTitle(
      Object p0, Object p1, Object p2, Object p3) {
    return 'Subnetz $p0 $p1 $p2 $p3';
  }

  @override
  String get aboutUniverseToHexPrincipleTitle => 'Prinzip';

  @override
  String get aboutUniverseToHexPrincipleBody =>
      'Ein Universum (1…N) kann in einen Index (Basis 0) und dann in eine Hexadezimalzahl umgewandelt werden.';

  @override
  String get aboutUniverseToHexTableTitle => 'Universum → Hex-Tabelle';

  @override
  String get aboutUniverseToHexTableIntro =>
      'Universumskonvertierungstabelle DMX → Index / Hex.';

  @override
  String aboutUniverseToHexBlockTitle(Object p0, Object p1) {
    return 'Blockieren $p0 $p1';
  }

  @override
  String get aboutUniverseToHexColDmx => 'Universum DMX';

  @override
  String get aboutUniverseToHexColIndex => 'Index';

  @override
  String get aboutArtnetPageTitle =>
      'Art-Net – DMX Universum auf IP (einfach und vollständig)';

  @override
  String get aboutArtnetTocTitle => 'Zusammenfassung';

  @override
  String get aboutArtnetTocCopyTooltip => 'Markierungen kopieren';

  @override
  String get aboutArtnetCopyLine1 => 'Art-Net = DMX über Ethernet über UDP.';

  @override
  String get aboutArtnetCopyLine2 =>
      'Skalierung: viele Universen über verteilte Knoten (DMX-out).';

  @override
  String get aboutArtnetCopyLine3 =>
      'Verbreitung: Broadcast (einfach, aber Flut) oder Unicast (sauberer).';

  @override
  String get aboutArtnetCopyLine4 =>
      'Echte Grenzen: WLAN, Basisschalter, Firmware-Knoten, Universums-/Zuordnungseinstellungen.';

  @override
  String get aboutArtnetCopyLine5 =>
      'RDM: möglich über „RDM-Proxy“ je nach Knoten (Variablenunterstützung).';

  @override
  String get aboutArtnetSection1Title => '1) Art-Net – was ist das und warum';

  @override
  String get aboutArtnetSection2Title =>
      '2) Adressierung & Universum – eigene Zuordnung';

  @override
  String get aboutArtnetSection3Title =>
      '3) Grenzen und Leistung – was zuerst kaputt geht';

  @override
  String get aboutArtnetSection4Title => '4) Knoten, Splitter und RDM';

  @override
  String get aboutArtnetSection5Title =>
      '5) Fehlerbehebung – Symptome → Ursachen';

  @override
  String get aboutArtnetSection6Title =>
      '6) Schemata (Netzwerk/Unicast vs. Broadcast)';

  @override
  String get aboutArtnetSection6bTitle =>
      '6bis) Bilder (Assets) – RJ45/Switch/Kabel';

  @override
  String get aboutArtnetSection7Title => '7) Kurze Checkliste';

  @override
  String get aboutArtnetConversionTablesTitle =>
      '8) Umrechnung / Tabellen (Universum 1..256)';

  @override
  String get aboutArtnetPillUdp => 'UDP';

  @override
  String get aboutArtnetPillUniversIp => 'Universum DMX auf IP';

  @override
  String get aboutArtnetPillNodesDmxOut => 'Knoten DMX-out';

  @override
  String get aboutArtnetSection1Paragraph => '„Pakete“ im Netzwerk';

  @override
  String get aboutArtnetSection1CalloutTitle => 'Warum es nützlich ist';

  @override
  String get aboutArtnetSection1Bullet1 =>
      'Skalierbar: viele Universen auf einem einzigen Netzwerkkabel.';

  @override
  String get aboutArtnetSection1Bullet2 =>
      'Verteilung: Knoten in der Nähe von Projektoren/Dimmern → weniger lange Leitungen DMX.';

  @override
  String get aboutArtnetSection1Bullet3 =>
      'Flexibles Patchen: Das Ändern eines Universums oder das Verschieben eines Knotens geht schnell.';

  @override
  String get aboutArtnetSection1Subtitle =>
      'Zwei Worte, die man sich merken sollte';

  @override
  String get aboutArtnetSection1SubBullet1 =>
      'Art-Net ersetzt nicht DMX: Es transportiert es über IP.';

  @override
  String get aboutArtnetSection1SubBullet2 =>
      'Die Stabilität hängt oft mehr vom Netzwerk (Switch, WLAN, Broadcast) als vom Protokoll ab.';

  @override
  String get aboutArtnetSection2PillUniverse => 'Universum';

  @override
  String get aboutArtnetSection2PillNodePort => 'Knoten/Port';

  @override
  String get aboutArtnetSection2PillMapping => 'Abbildung';

  @override
  String get aboutDmxPageTitle => 'DMX – Bedienung (einfach und vollständig)';

  @override
  String get aboutDmxSummaryLine1 =>
      'DMX = RS-485, 512 Kanäle (Slots) pro Universum, Werte 0–255 (8-Bit).';

  @override
  String get aboutDmxSummaryLine2 =>
      'Timing: 250 kBaud, vollständiges Universum ≈ ~44 Hz (Größenordnung).';

  @override
  String get aboutDmxSummaryLine3 =>
      'Topologie: Daisy-Chain (kein passives Y). 120-Ω-Abschluss am letzten.';

  @override
  String get aboutDmxSummaryLine4 =>
      'RDM = DMX bidirektional (Konfiguration/Überwachung) → Splitter-/Knotenkompatibilität zu prüfen.';

  @override
  String get aboutDmxSummaryLine5 =>
      'Art-Net / sACN = Universum DMX, das über Ethernet/IP über Knoten transportiert wird.';

  @override
  String get aboutDmxSummaryLine6 =>
      'sACN = Multicast + Prioritäten (IGMP-Snooping empfohlen).';

  @override
  String get aboutDmxToc1 => '1) DMX, Universum, Adressen – die Basis';

  @override
  String get aboutDmxToc2 => '2) Frame DMX – Pause, Startcode, Kanäle';

  @override
  String get aboutDmxToc3 => '3) RS-485-Verkabelung – Topologie und Kabel';

  @override
  String get aboutDmxToc4 =>
      '4) Terminierung und Splitter – vermeiden Sie Reflexionen';

  @override
  String get aboutDmxToc4bis => '4bis) MDR – Grenzwerte und Kompatibilitäten';

  @override
  String get aboutDmxToc5 => '5) Fehlerbehebung vor Ort – Symptome → Ursachen';

  @override
  String get aboutDmxToc6 => '6) Art-Net – Feld-Benchmarks';

  @override
  String get aboutDmxToc7 => '7) sACN / E1.31 – Multicast, IGMP, Prioritäten';

  @override
  String get aboutDmxToc8 => '8) DMX vs. Art-Net vs. sACN – wählen Sie';

  @override
  String get aboutDmxToc9 => '9) Felddiagramme (DMX / IP / Pinbelegung)';

  @override
  String get aboutDmxChecklistCopyTitle => 'DMX – Feld-Checkliste';

  @override
  String get aboutDmxChecklistCopyTitle2 =>
      'Art-Net / sACN – Checkliste vor Ort';

  @override
  String get aboutDmxChecklistCopyB1 =>
      'Richtiger Gerätemodus (Anzahl der Kanäle)';

  @override
  String get aboutDmxChecklistCopyB2 =>
      'Richtige DMX-Adresse (keine Überschneidung)';

  @override
  String get aboutDmxChecklistCopyB3 => 'Daisy-Chain (kein passives Y)';

  @override
  String get aboutDmxChecklistCopyB4 => '120-Ω-Abschluss am letzten Gerät';

  @override
  String get aboutDmxChecklistCopyB5 =>
      'DMX/RS-485-Kabel (120 Ω Twisted Pair), wenn möglich';

  @override
  String get aboutDmxChecklistCopyB6 =>
      'Split-Optokoppler bei mehreren Zweigen';

  @override
  String get aboutDmxChecklistCopyB7 =>
      'Halten Sie DMX nach Möglichkeit von parasitären Quellen (Netzteilen, Dimmern) fern';

  @override
  String get aboutDmxChecklistCopyB8 =>
      'Bei RDM: Splitter-/Knotenkompatibilität und einwandfreie Verkabelung prüfen';

  @override
  String get aboutDmxChecklistCopyB9 =>
      'Dediziertes Netzwerk, wenn möglich (oder VLAN)';

  @override
  String get aboutDmxChecklistCopyB10 =>
      'Richtiger Schalter; IGMP-Snooping empfohlen (sACN Multicast)';

  @override
  String get aboutDmxChecklistCopyB11 =>
      'Unicast (häufig) oder kontrolliertes Multicast (Überflutung vermeiden)';

  @override
  String get aboutDmxChecklistCopyB12 =>
      'Universumszuordnung ↔ Ports/Knoten überprüft';

  @override
  String get aboutDmxChecklistCopyB13 =>
      'Klarer IP-Plan (Adressen, Maske, DHCP vs. statisch)';

  @override
  String get aboutDmxS1Title => '1) DMX, Universum, Adressen – die Basis';

  @override
  String get aboutDmxS1Pill1 => '1 Universum = 512 Slots';

  @override
  String get aboutDmxS1Pill2 => '0–255 (8-Bit)';

  @override
  String get aboutDmxS1Pill3 => '16-Bit = 2 Kanäle';

  @override
  String get aboutDmxS1Intro =>
      'DMX512 ist ein Steuerprotokoll, das häufig in Shows verwendet wird (Beleuchtung, Effekte, Dimmer). Es handelt sich um einen seriellen Stream (RS-485), der einen „Frame“ mit bis zu 512 Werten durchläuft. Jeder Wert = ein Kanal (0→255).';

  @override
  String get aboutDmxS1RememberTitle => 'Zum Erinnern';

  @override
  String get aboutDmxS1RememberB1 =>
      '1 Universum DMX = 512 Kanäle (Slots) nummeriert 1→512.';

  @override
  String get aboutDmxS1RememberB2 =>
      'Ein Gerät hört auf eine Startadresse (z. B. 101) und verbraucht N Kanäle (abhängig von seinem Modus).';

  @override
  String get aboutDmxS1RememberB3 =>
      'Der Controller sendet alles kontinuierlich zurück: Wenn Sie die Übertragung stoppen, „frieren“ die Geräte ein (oder gehen in den Fallback).';

  @override
  String get aboutDmxS4bisTitle =>
      '4bis) MDR – Grenzwerte und Kompatibilitäten';

  @override
  String get aboutDmxS4bisPlaceholder =>
      '... (behalten Sie Ihre bestehenden Inhalte)';

  @override
  String get aboutDmxS9Title => '9) Felddiagramme (DMX / IP / Pinbelegung)';

  @override
  String get aboutDmxS9Diagram1 => 'Timing DMX (Pause / MAB / Slots)';

  @override
  String get aboutDmxS9Diagram2 => 'Topologie DMX: Daisy-Chain';

  @override
  String get aboutDmxS9Diagram3 => '120-Ω-Abschluss';

  @override
  String get aboutDmxS9Diagram4 => 'sACN Multicast: IGMP-Rückruf (Netzwerk)';

  @override
  String get aboutDmxS9Diagram5 => 'IP → Knoten → DMX (Art-Net / sACN)';

  @override
  String get aboutDmxS9Diagram6 => 'Pinbelegung XLR5 (DMX)';

  @override
  String get aboutDmxS10Title => '10) Kurze Checkliste';

  @override
  String get aboutDmxS10CopyTooltip => 'Checkliste kopieren';

  @override
  String get aboutDmxS10CalloutTitle => 'Bevor Sie in Panik geraten';

  @override
  String get aboutDmxS10B1 => 'Gerätemodus + Adresse DMX (immer prüfen).';

  @override
  String get aboutDmxS10B2 =>
      'Kurze Kette mit einem „bekanntermaßen in Ordnung“-Kabel zur Isolierung.';

  @override
  String get aboutDmxS10B3 => 'Daisy-Chain (kein passives Y).';

  @override
  String get aboutDmxS10B4 => '120-Ω-Abschluss nur am letzten Gerät.';

  @override
  String get aboutDmxS10B5 => 'Opto-Verteiler bei mehreren Abzweigungen.';

  @override
  String get aboutDmxS10B6 =>
      'Wenn RDM: kompatibler Splitter/Knoten + einwandfreie Verkabelung.';

  @override
  String get aboutDmxS10B7 =>
      'Bei IP (Art-Net/sACN): richtiger Switch, IGMP für sACN Multicast, im Zweifel Unicast.';

  @override
  String get aboutDmxFooterNote =>
      'Indikative Informationen (Gelände). Das genaue Verhalten kann je nach Konsolen, Knoten, Switches und Firmware variieren.\nZiel hier: Schnelles Verständnis und Fehlerbehebung mit einer zuverlässigen Methode.';

  @override
  String get aboutDmxPainterBreak => 'BRECHEN';

  @override
  String get aboutDmxPainterMab => 'MAB';

  @override
  String get aboutDmxPainterStartCode => 'Start\nCode';

  @override
  String get aboutDmxPainterSlots => 'Steckplätze 1…N\n(bis 512)';

  @override
  String get aboutDmxPainterRefresh =>
      'Schleife (Aktualisierung) – vollständiges Universum ≈ ~44 Hz (Größenordnung)';

  @override
  String get aboutDmxPainterSourceA => 'QUELLE A\n(Priorität 100)';

  @override
  String get aboutDmxPainterSourceB => 'QUELLE B\n(vor 90)';

  @override
  String get aboutDmxPainterSwitchIgmp => 'SCHALTER\nIGMP-Schnüffeln';

  @override
  String get aboutDmxPainterMulticastUniverse => 'MULTICAST\nUniversum U';

  @override
  String get aboutDmxPainterRx => 'RX';

  @override
  String get aboutDmxPainterIgmpNote =>
      'Ohne IGMP: Überschwemmung\nBei IGMP: nur Teilnehmer-Ports';

  @override
  String get aboutDmxPainterConsole => 'KONSOLE';

  @override
  String get aboutDmxPainterFix1 => 'FIX 1';

  @override
  String get aboutDmxPainterFix2 => 'FIX 2';

  @override
  String get aboutDmxPainterFix3 => 'FIX 3';

  @override
  String get aboutElectricitePageTitle => 'Elektrik – Feldreferenzen';

  @override
  String get elecSection1Title => '1) Grundlagen (W, A, V, kW)';

  @override
  String get elecSection1FormulasTitle => '3 nützliche Formeln';

  @override
  String get elecSection1Formula1 => 'P(W) = U(V) × I(A)';

  @override
  String get elecSection1Formula2 => 'I(A) = P(W)/U(V)';

  @override
  String get elecSection1Formula3 => 'P(kW) = P(W)/1000';

  @override
  String get elecSection1FieldMarksTitle => 'Feld-Benchmarks';

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
      'Typischerweise maximal 16 A (≈ 3,7 kW bei 230 V).';

  @override
  String get elecSection2SchukoBullet2 =>
      'Vorsicht bei Mehrfachsteckdosen und Verlängerungskabeln: Überhitzung möglich.';

  @override
  String get elecSection2P17Title => 'P17 / CEE (blau/rot)';

  @override
  String get elecSection2P17Bullet1 =>
      'Blau: 230 V Mono (Camping, kleine Distribution).';

  @override
  String get elecSection2P17Bullet2 =>
      'Rot: 400 V Tri (Verteilung, hohe Leistung).';

  @override
  String get elecSection2PowerconTitle => 'PowerCON (Audio/Beleuchtung)';

  @override
  String get elecSection2PowerconBullet1 =>
      'PowerCON TRUE1 = plus „Feld“ (Sperrung, IP).';

  @override
  String get elecSection2PowerconBullet2 =>
      'Überprüfen Sie den Kabelquerschnitt und die Schutzvorrichtungen.';

  @override
  String get elecSection3Title => '3) Mono / Tri (was ändert sich)';

  @override
  String get elecSection3Paragraph =>
      'Mono = eine Phase + Neutralleiter (230 V). Tri = 3 Phasen (400 V zwischen den Phasen).';

  @override
  String get elecSection3PitfallsTitle => 'Häufige Fallstricke';

  @override
  String get elecSection3Pitfall1 =>
      'Phasenungleichgewicht (eine Phasenüberlastung).';

  @override
  String get elecSection3Pitfall2 =>
      'Neutralleiter, der sich bei großen Oberwellen (LED, Dimmer) erwärmt.';

  @override
  String get elecSection3Pitfall3 =>
      'An manchen Standorten fehlt Land oder ist zweifelhaft.';

  @override
  String get elecSection3MethodTitle => 'Einfache Methode';

  @override
  String get elecSection3MethodBullet1 =>
      'Verteilen Sie große Lasten auf L1/L2/L3.';

  @override
  String get elecSection3MethodBullet2 => 'Bei vielen LEDs neutral überwachen.';

  @override
  String get elecSection3MethodBullet3 =>
      'Wenn möglich mit einer Klemme messen.';

  @override
  String get elecSection4Title => '4) Schneller Tisch (16A → 400A)';

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
  String get elecSection4ImportantTitle => 'Wichtig';

  @override
  String get elecSection4ImportantBullet1 =>
      'Dabei handelt es sich um Größenordnungen (cosφ, Harmonische, Verluste).';

  @override
  String get elecSection4ImportantBullet2 =>
      'Validieren Sie immer Schutzfunktionen + Abschnitte + Temperatur.';

  @override
  String get elecSection5Title => '6) Sicherheits- und Feldfallen';

  @override
  String get elecSection5DontDoTitle => 'Was man nicht tun sollte';

  @override
  String get elecSection5DontDoBullet1 =>
      'Chainer Mehrfachsteckdosen / Verlängerungskabel in Großpackung.';

  @override
  String get elecSection5DontDoBullet2 => 'Mischphasen ohne es zu wissen.';

  @override
  String get elecSection5DontDoBullet3 => '„Bridger“ ein zweifelhaftes Land.';

  @override
  String get elecSection5WarningTitle => 'Warnzeichen';

  @override
  String get elecSection5WarningBullet1 =>
      'Heißer Geruch, lauwarme Schüsse, wiederholtes Auslösen.';

  @override
  String get elecSection5WarningBullet2 => 'Spannungsabfall (Brownout).';

  @override
  String get elecSection5WarningBullet3 =>
      '„Müde“ oder ungeeigneter Leistungsschalter.';

  @override
  String get elecSection6Title => '6) Checkliste';

  @override
  String get elecSection6QuickTitle => 'Schnell';

  @override
  String get elecSection6Bullet1 =>
      'Art der verfügbaren Stromversorgung (Mono/Tri) + Nennleistung (A).';

  @override
  String get elecSection6Bullet2 => 'Phasenverteilung (Hauptlasten).';

  @override
  String get elecSection6Bullet3 =>
      'Schutzmaßnahmen (diff/disj) und Tabellenstatus.';

  @override
  String get elecSection6Bullet4 =>
      'Kabel: Abschnitt / Länge / Temperaturanstieg.';

  @override
  String get elecSection6Bullet5 => 'Erde: OK? (wenn möglich Tester).';

  @override
  String get elecFooterNote =>
      'Hinweis: Bei diesem Inhalt handelt es sich um eine Feldgedächtnishilfe. Beachten Sie an einem realen Standort stets die Standards, die Vorschriften des Ortes und die vorhandenen Schutzmaßnahmen.';

  @override
  String get infoPageTitle => 'IT – Feld-Benchmarks';

  @override
  String get infoUsbTitle => '1) USB / USB-C / Thunderbolt';

  @override
  String get infoStorageTitle => '2) Speicher (SATA/NVMe/SSD)';

  @override
  String get infoVideoLinksTitle => '3) Videoanschlüsse (DP / HDMI)';

  @override
  String get infoPcieGpuTitle => '4) PCIe/GPU (Benchmarks)';

  @override
  String get infoChecklistTitle => '5) Checkliste (Tablett)';

  @override
  String get infoSummaryCopy =>
      'INFO – Feldmarkierungen\n• USB-C = Form, nicht Geschwindigkeit: Überprüfen Sie den Standard.\n• NVMe (M.2) viel schneller als SATA.\n• DisplayPort/HDMI = Standards, Ausführungen/Kabel beachten.\n• Auf Videoservern: Speicher + GPU + Durchsatz sind die Basis.';

  @override
  String get infoChecklistCopy =>
      'INFO – Checkliste\n☐ Zertifizierte USB-C-Kabel (Daten/Video ggf.)\n☐ Angepasster Speicher (NVMe bei großem Datenfluss)\n☐ Stabile GPU-Treiber (bekannte Version)\n☐ Echter Auflösungs-/FPS-Test\n☐ Vermeiden Sie billige Adapter';

  @override
  String get infoUsbCriticalTitle => 'Kritischer Punkt';

  @override
  String get infoUsbCriticalBullet1 =>
      'USB-C = Stecker (Form). Da steht nicht Geschwindigkeit.';

  @override
  String get infoUsbCriticalBullet2 =>
      'Ein USB-C-Kabel dient möglicherweise nur zum Laden und überträgt keine Daten/Videos.';

  @override
  String get infoUsbSpeedTitle => 'Geschwindigkeitsbenchmarks (Größenordnung)';

  @override
  String get infoUsbSpeedBullet1 =>
      'USB 2.0: langsam (Tastaturen, Dongles, Kleingeräte).';

  @override
  String get infoUsbSpeedBullet2 =>
      'USB 3.x: viel schneller (Festplatten, Schnittstellen).';

  @override
  String get infoUsbSpeedBullet3 =>
      'USB4 / Thunderbolt: sehr hohe Geschwindigkeit (Dock, eGPU, Video je nach Hardware).';

  @override
  String get infoUsbParagraph =>
      'In der Show: Wenn ein Gerät „schief geht“, vermuten Sie das Kabel (Qualität/Standard) vor dem Gerät.';

  @override
  String get infoStorageSataNvmeTitle => 'SATA vs. NVMe';

  @override
  String get infoStorageSataNvmeBullet1 =>
      'SATA SSD: gut und stabil, aber eingeschränkt (alte Schnittstelle).';

  @override
  String get infoStorageSataNvmeBullet2 =>
      'NVMe SSD (M.2): viel schneller (ideal für Medienserver, große Dateien).';

  @override
  String get infoStorageFieldTitle => 'Video-Gelände';

  @override
  String get infoStorageFieldBullet1 =>
      'Wiedergabe großer Dateien 4K/ProRes → NVMe empfohlen.';

  @override
  String get infoStorageFieldBullet2 =>
      'Seien Sie vorsichtig mit der Temperatur: Ein NVMe kann drosseln (langsamer werden), wenn es heiß wird.';

  @override
  String get infoStorageFieldBullet3 =>
      'Testen Sie vor der Show immer unter realen Bedingungen.';

  @override
  String get infoVideoLinksImportantTitle => 'Wichtiges Wahrzeichen';

  @override
  String get infoVideoLinksImportantBullet1 =>
      'Versionen zählen: Kabel + Port + Gerät müssen kompatibel sein.';

  @override
  String get infoVideoLinksImportantBullet2 =>
      'Große Entfernung = Aktiv-/Glasfaser-Konverter oft erforderlich.';

  @override
  String get infoVideoLinksCompareTitle => 'DP vs. HDMI (sehr vereinfacht)';

  @override
  String get infoVideoLinksCompareBullet1 =>
      'HDMI: allgegenwärtig (Fernseher, Prozessoren), aber EDID/HDCP kann stören.';

  @override
  String get infoVideoLinksCompareBullet2 =>
      'DisplayPort: sehr verbreiteter PC, oft sehr „durchsatzfähig“.';

  @override
  String get infoPcieGpuParagraph =>
      'Für Video-/Mapping-Server: GPU + Bus + Treiber = Stabilität. Typische Probleme: Treiber, Kabel, Konvertierung und Ausgabebeschränkungen.';

  @override
  String get infoPcieGpuFieldTitle => 'Boden';

  @override
  String get infoPcieGpuFieldBullet1 =>
      'Blockieren Sie vor einer großen Show eine stabile Treiberversion.';

  @override
  String get infoPcieGpuFieldBullet2 => 'Vermeiden Sie „billige“ Adapter.';

  @override
  String get infoPcieGpuFieldBullet3 =>
      'Testen Sie mit der tatsächlichen Auflösung/FPS der Show.';

  @override
  String get infoChecklistQuickTitle => 'Schnell';

  @override
  String get infoChecklistBullet1 => 'Richtiges Kabel/Standard.';

  @override
  String get infoChecklistBullet2 => 'Dem Durchfluss angepasste Lagerung.';

  @override
  String get infoChecklistBullet3 => 'Stabile Treiber.';

  @override
  String get infoChecklistBullet4 => 'Echter Test vor der Show.';

  @override
  String get infoChecklistBullet5 => 'Vermeiden Sie billige Adapter.';

  @override
  String get infoFooterNote =>
      'Indikative Informationen (Gelände). Die genauen Funktionen variieren je nach Hardware/Version.\nZiel: einfache Benchmarks + zuverlässige Methode.';

  @override
  String get ipBasicsPageTitle => 'Netzwerk – IP-Basen/Maske/DHCP (wesentlich)';

  @override
  String get ipBasicsCopyMemoTooltip => 'Memo kopieren';

  @override
  String get ipBasicsCopyChecklistTooltip => 'Checkliste kopieren';

  @override
  String get ipBasicsMemo1 =>
      'IP = logische Adresse, um ein Gerät in einem Netzwerk zu erreichen.';

  @override
  String get ipBasicsMemo2 =>
      'Privat (LAN): 10.x.x.x, 172.16–31.x.x, 192.168.x.x (nicht über das Internet geroutet).';

  @override
  String get ipBasicsMemo3 =>
      'Maske/Subnetz = gibt an, welcher Teil „Netzwerk“ oder „Maschine“ ist.';

  @override
  String get ipBasicsMemo4 =>
      'Gleiches Subnetz = direkte Kommunikation. Ansonsten → Gateway (Router).';

  @override
  String get ipBasicsMemo5 =>
      'DHCP weist IP automatisch zu; static = nützlich für Knoten/Konsole.';

  @override
  String get ipBasicsToc1 => '1) Was ist eine IP und wozu dient sie?';

  @override
  String get ipBasicsToc2 => '2) Warum 192.x / 10.x / 172.x? (Privatadressen)';

  @override
  String get ipBasicsToc3 => '3) Maske und Subnetze: Wirklich verstehen';

  @override
  String get ipBasicsToc4 => '4) DHCP, Gateway, DNS: Wer macht was?';

  @override
  String get ipBasicsToc5 =>
      '5) Wie zwei Geräte miteinander kommunizieren (LAN vs. Off-LAN)';

  @override
  String get ipBasicsToc6 =>
      '6) Einfache „Anzeige“ von IP-Plänen (kopierbare Beispiele)';

  @override
  String get ipBasicsToc7 =>
      '7) Fehlerbehebung: Symptome → Ursachen (Feldmethode)';

  @override
  String get ipBasicsToc8 =>
      '8) Mini-Übungen (schnell eine Maske/ein Netzwerk prüfen)';

  @override
  String get ipBasicsToc9 => '9) Kurze Checkliste';

  @override
  String get ipBasicsSection1Paragraph =>
      'Eine IP-Adresse (IPv4) ist eine logische Kennung in einem Netzwerk. Sie können damit sagen: „Dieses Paket an dieses Gerät senden“.\n\nWenn Sie eine Konsole, einen Art-Net/sACN-Knoten, einen PC, einen verwalteten Switch anschließen ... muss alles, was im Netzwerk spricht, eine konsistente IP haben, damit die Geräte einander finden können.';

  @override
  String get ipBasicsSection1CalloutTitle => 'Geistiges Bild';

  @override
  String get ipBasicsSection1Bullet1 =>
      'MAC = Hardware-Identifikator (Netzwerkkarte).';

  @override
  String get ipBasicsSection1Bullet2 =>
      'IP = „Postadresse“ in einem Netzwerk (änderbar).';

  @override
  String get ipBasicsSection1Bullet3 =>
      'Mask = „Bezirk / Postleitzahl“ (grenzt das Subnetz ab).';

  @override
  String get ipBasicsSection1Bullet4 =>
      'Gateway = „Nachbarschaftsausgang“ (Router).';

  @override
  String get ipBasicsSection1Subtitle => 'IPv4 in 10 Sekunden';

  @override
  String get ipBasicsSection1SubBullet1 =>
      'Format: A.B.C.D (4 ​​Zahlen von 0 bis 255).';

  @override
  String get ipBasicsSection1SubBullet2 => 'Beispiel: 192.168.0.50';

  @override
  String get ipBasicsSection1SubBullet3 =>
      'Es ist keine Zauberei: Es sind 32 Bit (4 Byte).';

  @override
  String get ipBasicsSection1SubBullet4 =>
      'Was für Sie wichtig ist: IP + Maske muss zwischen den Geräten konsistent sein.';

  @override
  String get ipBasicsSection2Paragraph =>
      'Bestimmte IPv4-Adressbereiche sind privaten Netzwerken (LAN) vorbehalten. Sie werden nicht über das Internet weitergeleitet. Aus diesem Grund verwenden wir sie in Shows: Sie können Ihr lokales Netzwerk erstellen, ohne öffentliche IPs zu „verbrauchen“.';

  @override
  String get ipBasicsSection2CalloutTitle => 'Die 3 großen Privatstrände (LAN)';

  @override
  String get ipBasicsSection2Bullet1 =>
      '10.0.0.0 → 10.255.255.255 (oft geschrieben „10.x.x.x“)';

  @override
  String get ipBasicsSection2Bullet2 =>
      '172.16.0.0 → 172.31.255.255 (oft „172.16–31.x.x“)';

  @override
  String get ipBasicsSection2Bullet3 =>
      '192.168.0.0 → 192.168.255.255 (häufig „192.168.x.x“)';

  @override
  String get ipBasicsSection2Subtitle1 => 'Warum sehen wir oft 192.168.x.x?';

  @override
  String get ipBasicsSection2SubBullet1 =>
      'Consumer-Boxen/Router verwenden häufig 192.168.0.x oder 192.168.1.x.';

  @override
  String get ipBasicsSection2SubBullet2 =>
      'In kleinen LANs ist es zum „De-facto-Standard“ geworden.';

  @override
  String get ipBasicsSection2SubBullet3 =>
      'Aber in der Show ist 10.x.x.x nützlich, wenn Sie viele Adressen oder mehrere VLANs benötigen.';

  @override
  String get ipBasicsSection2Subtitle2 => 'Und das berühmte 2.x.x.x (Art-Net)?';

  @override
  String get ipBasicsSection2SubBullet4 =>
      'Viele Art-Net-Hardware verlässt das Werk mit einer 2.x.x.x-IP (geschlossenes Netzwerk).';

  @override
  String get ipBasicsSection2SubBullet5 =>
      'Im Plug&Play-Modus (ohne DHCP) ist es „praktisch“, verwundert aber, wenn Ihr PC in 192.168.x.x läuft.';

  @override
  String get ipBasicsSection2SubBullet6 =>
      'Wichtig: „2.x“ ist keine Zauberei für Broadcast/Unicast.';

  @override
  String get ipBasicsSection2SubBullet7 =>
      'Was den Umfang der Übertragung ändert, ist die Maske (in der Vorgängerversion oft /8 = 255.0.0.0).';

  @override
  String get ipBasicsSection2SubBullet8 =>
      'Beispiel: Netzwerk 2.0.0.0/8 → Broadcast = 2.255.255.255 (sehr breit).';

  @override
  String get ipBasicsSection2SubBullet9 =>
      'Einfache Lösung: PC/Konsole im gleichen Bereich + gleiche Maske platzieren oder den Knoten auf einem 192/10-Plan neu konfigurieren.';

  @override
  String get ipBasicsSection3Paragraph =>
      'Die Subnetzmaske sagt aus, welche Adressen sich „im selben Netzwerk“ befinden. Ohne Maske bedeutet eine IP nicht viel.\n\nFeldregel: Befinden sich zwei Geräte im selben Subnetz, kommunizieren sie direkt miteinander. Andernfalls benötigen sie ein Gateway (Router).';

  @override
  String get ipBasicsSection3Callout1Title => 'Die häufigsten Masken';

  @override
  String get ipBasicsSection3Bullet1 =>
      '255.0.0.0 ( /8 ) → typisches „breites“ 10.x.x.x-Netzwerk';

  @override
  String get ipBasicsSection3Bullet2 =>
      '255.255.0.0 ( /16 ) → Netzwerk 10.10.x.x oder 192.168.x.x „breit“';

  @override
  String get ipBasicsSection3Bullet3 =>
      '255.255.255.0 ( /24 ) → 192.168.0.x „klassisches“ Netzwerk (254 Geräte)';

  @override
  String get ipBasicsSection3Callout2Title =>
      'Maske → Broadcast-Adresse (sehr nützlich zum Verständnis)';

  @override
  String get ipBasicsSection3Bullet4 =>
      'Die Ausstrahlung ist abhängig vom Subnetz, also von der Maske (kein „2 vs 192“).';

  @override
  String get ipBasicsSection3Bullet5 =>
      '192.168.10.0/24 → Broadcast = 192.168.10.255 (kleines Netzwerk).';

  @override
  String get ipBasicsSection3Bullet6 =>
      '2.0.0.0/8 (255.0.0.0) → Broadcast = 2.255.255.255 (riesiges Netzwerk).';

  @override
  String get ipBasicsSection3Bullet7 =>
      'Je „größer“ das Netzwerk, desto mehr Lärm kann eine Übertragung verursachen (wenn Sie sie häufig nutzen).';

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
      'Geräte „im selben Netzwerk“: 192.168.0.1 → 192.168.0.254';

  @override
  String get ipBasicsSection3SubBullet5 =>
      'Wenn Sie zu 192.168.1.50 gehen → ist es NICHT MEHR dasselbe Netzwerk.';

  @override
  String get ipBasicsSection3Subtitle2 => 'Warum Subnetzwerke erstellen?';

  @override
  String get ipBasicsSection3SubBullet6 =>
      'Organisation: separate „Licht“, „Video“, „Gegensprechanlage“, „Internet“…';

  @override
  String get ipBasicsSection3SubBullet7 =>
      'Leistung: Rauschen (Broadcast/Multicast) auf eine Gruppe beschränken.';

  @override
  String get ipBasicsSection3SubBullet8 =>
      'Sicherheit: Verhindern Sie, dass ein „Gast“-PC das Show-Netzwerk sieht/stört.';

  @override
  String get ipBasicsSection3SubBullet9 =>
      'Diagnose: einfacher zu wissen, „wo“ sich ein Gerät befindet.';

  @override
  String get ipBasicsSection3Callout3Title => 'Klassische Falle';

  @override
  String get ipBasicsSection3Bullet8 =>
      'Gleicher „Anfang“ der IP ≠ gleiches Netzwerk, wenn die Maske nicht identisch ist.';

  @override
  String get ipBasicsSection3Bullet9 =>
      'Beispiel: 10.0.0.5/8 und 10.0.0.200/24 ​​​​→ nicht der gleiche logische Umfang.';

  @override
  String get ipBasicsSection4Subtitle1 => 'DHCP (automatische Zuweisung)';

  @override
  String get ipBasicsSection4SubBullet1 =>
      'Ein DHCP-Server „gibt“: IP + Maske + Gateway + DNS.';

  @override
  String get ipBasicsSection4SubBullet2 =>
      'Praktisch: Einstecken, es funktioniert.';

  @override
  String get ipBasicsSection4SubBullet3 =>
      'Risiko anzeigen: Wenn DHCP ausfällt/Änderungen/Konflikt auftritt → seltsame Symptome.';

  @override
  String get ipBasicsSection4Subtitle2 => 'Statisch (feste IP)';

  @override
  String get ipBasicsSection4SubBullet4 =>
      'Sie definieren IP + Maske (und möglicherweise Gateway/DNS).';

  @override
  String get ipBasicsSection4SubBullet5 =>
      'Sehr nützlich für: Konsole, Knoten, verwalteter Switch, AP-WLAN-Anzeige.';

  @override
  String get ipBasicsSection4SubBullet6 =>
      'Risiko: doppelte IP, wenn Plan unklar ist (Konflikt).';

  @override
  String get ipBasicsSection4Callout1Title => 'Tor';

  @override
  String get ipBasicsSection4Bullet1 =>
      'Dies ist die Adresse des Routers: Sie wird verwendet, um „außerhalb des lokalen Netzwerks“ zu gehen.';

  @override
  String get ipBasicsSection4Bullet2 =>
      'Wenn Sie ein isoliertes Show-Netzwerk (ohne Internet) → Gateway machen, ist es oft unbrauchbar.';

  @override
  String get ipBasicsSection4Bullet3 =>
      'Aber wenn Sie zu einem anderen VLAN/Internet gehen möchten → unerlässlich.';

  @override
  String get ipBasicsSection4Callout2Title => 'DNS';

  @override
  String get ipBasicsSection4Bullet4 =>
      'DNS = „Verzeichnis“: Wandelt einen Namen (z. B. example.com) in eine IP um.';

  @override
  String get ipBasicsSection4Bullet5 =>
      'In Show (Art-Net/sACN) oft nutzlos: Sie arbeiten in direkter IP.';

  @override
  String get ipBasicsSection4Bullet6 =>
      'Wenn Sie Dienste nutzen (UPDATE, Lizenzen, Zeitserver, Streaming) → DNS wird wieder nützlich.';

  @override
  String get ipBasicsSection4Subtitle3 => 'Einfache Regel (anfängerfreundlich)';

  @override
  String get ipBasicsSection4SubBullet7 =>
      'Kleine geschlossene Show: überall statisch, kein Gateway, kein DNS.';

  @override
  String get ipBasicsSection4SubBullet8 =>
      'Mit Internet/mehreren Netzwerken anzeigen: DHCP-gesteuert + DHCP-Reservierungen oder statischer Plan + Router.';

  @override
  String get ipBasicsSection5Paragraph =>
      'Als A mit B sprechen möchte, schaut er auf die Maske:\n• Wenn B im selben Subnetz ist → A sendet direkt an das lokale Netzwerk.\n• Wenn B sich außerhalb des Subnetzes befindet, sendet A an das Gateway (Router), das sich um den Rest kümmert.';

  @override
  String get ipBasicsSection5Callout1Title => 'Beispiel (einfach)';

  @override
  String get ipBasicsSection5Bullet1 => 'A = 192.168.0.10 /24';

  @override
  String get ipBasicsSection5Bullet2 =>
      'B = 192.168.0.50 /24 → gleiches Netzwerk → OK direkt.';

  @override
  String get ipBasicsSection5Bullet3 =>
      'B = 192.168.1.50 /24 → anderes Netzwerk → Router/Gateway erforderlich.';

  @override
  String get ipBasicsSection5Subtitle => 'Warum pingt es nicht?';

  @override
  String get ipBasicsSection5SubBullet1 =>
      'Andere Maske → A denkt, dass B „anderswo“ ist (oder umgekehrt).';

  @override
  String get ipBasicsSection5SubBullet2 =>
      'Kein Gateway → Subnetz kann nicht verlassen werden.';

  @override
  String get ipBasicsSection5SubBullet3 =>
      'PC-Firewall → Ping blockiert (Windows sehr häufig).';

  @override
  String get ipBasicsSection5SubBullet4 =>
      'Kabel/Switch/VLAN: physikalisch nicht im gleichen Segment.';

  @override
  String get ipBasicsSection5Callout2Title =>
      'Broadcast vs. Unicast (nützlicher Bonus)';

  @override
  String get ipBasicsSection5Bullet4 =>
      'Unicast: an eine bestimmte (eigene) IP.';

  @override
  String get ipBasicsSection5Bullet5 =>
      'Broadcast: „an alle“ im Subnetz (verrauscht).';

  @override
  String get ipBasicsSection5Bullet6 =>
      'In der Show: Broadcast kann im kleinen Maßstab funktionieren, wird aber in einem großen Netzwerk schnell zu einer Lärmquelle.';

  @override
  String get ipBasicsSection6Subtitle1 =>
      'Plan A – ultraeinfach (ein Netzwerk/24)';

  @override
  String get ipBasicsSection6Code1 =>
      'Netzwerk: 192.168.10.0/24 (Maske 255.255.255.0)\n\nKonsole: 192.168.10.10\nPC (Steuerung): 192.168.10.20\nKnoten 1: 192.168.10.101\nKnoten 2: 192.168.10.102\nVerwalteter Switch: 192.168.10.2\nGateway: (leer) oder 192.168.10.1, wenn Router vorhanden';

  @override
  String get ipBasicsSection6Callout1Title => 'Warum funktioniert es gut?';

  @override
  String get ipBasicsSection6Bullet1 =>
      'Alle im selben Subnetz → keine Überraschungen.';

  @override
  String get ipBasicsSection6Bullet2 =>
      'Einfach zu erklären, leicht zu beheben.';

  @override
  String get ipBasicsSection6Bullet3 =>
      'Ideale Anfänger-/kleine bis mittlere Show.';

  @override
  String get ipBasicsSection6Subtitle2 =>
      'Plan B – „10.x“, wenn Sie wachsen möchten';

  @override
  String get ipBasicsSection6Code2 =>
      'Netzwerk: 10.10.0.0/16 (Maske 255.255.0.0)\n\nKonsole: 10.10.0.10\nPC: 10.10.0.20\nKnoten: 10.10.1.10 → 10.10.1.200\nSchalter: 10.10.0.2';

  @override
  String get ipBasicsSection6Callout2Title => 'Wann sollte man es verwenden?';

  @override
  String get ipBasicsSection6Bullet4 =>
      'Wenn Sie über viel Ausrüstung (oder mehrere Zonen) verfügen.';

  @override
  String get ipBasicsSection6Bullet5 =>
      'Wenn Sie später VLAN planen (Licht/Video/IT).';

  @override
  String get ipBasicsSection6Subtitle3 =>
      'Plan C – kompatibel mit Art-Net „2.x.x.x“ (Legacy)';

  @override
  String get ipBasicsSection6Code3 =>
      'Netzwerk: 2.0.0.0/8 (Maske 255.0.0.0)\n\nPC/Konsole: 2.0.0.10\nKnoten 1: 2.0.0.100\nKnoten 2: 2.0.0.101\n\n⚠️ Isoliertes Netzwerk, kein Internet, kein Routing.';

  @override
  String get ipBasicsSection6Callout3Title => 'Aufmerksamkeit';

  @override
  String get ipBasicsSection6Bullet6 =>
      'Dieser Plan ist praktisch für alte/Standard-Hardware.';

  @override
  String get ipBasicsSection6Bullet7 =>
      'Vermeiden Sie aber eine Vermischung mit einem „normalen“ LAN (192.168.x.x) ohne Router.';

  @override
  String get ipBasicsSection7Callout1Title =>
      'Symptome → wahrscheinliche Ursachen';

  @override
  String get ipBasicsSection7Bullet1 =>
      '„Ich sehe den Knoten, aber er antwortet nicht“ → andere Maske/VLAN/Firewall.';

  @override
  String get ipBasicsSection7Bullet2 =>
      '„Ein Gerät funktioniert und verschwindet dann“ → Instabiler DHCP-/IP-Konflikt.';

  @override
  String get ipBasicsSection7Bullet3 =>
      '„Nichts geht außer am Switch“ → IP nicht im gleichen Netzwerk / falsches Kabel / VLAN-Port.';

  @override
  String get ipBasicsSection7Bullet4 =>
      '„Alle Zeilen / Verluste“ → Broadcast/Multicast zu breit / Low-End-Switch / Netzwerkschleife.';

  @override
  String get ipBasicsSection7Bullet5 =>
      '„Es funktioniert kabelgebunden, aber nicht über WLAN“ → Jitter / Roaming / gesättigtes Band / Energiesparen.';

  @override
  String get ipBasicsSection7Subtitle => 'Professionelle Methode in 5 Minuten';

  @override
  String get ipBasicsSection7SubBullet1 =>
      '1) Sehen Sie sich IP + Konsole/PC und Knotenmaske an.';

  @override
  String get ipBasicsSection7SubBullet2 =>
      '2) Prüfen: Gleiches Subnetz? (Beispiel: 192.168.10.x /24)';

  @override
  String get ipBasicsSection7SubBullet3 =>
      '3) Ping (falls möglich) + Knoten-Webschnittstellen-Zugriffstest.';

  @override
  String get ipBasicsSection7SubBullet4 =>
      '4) Bei DHCP: Auflisten, wer welche IP hat (DHCP-Tabelle) und auf Duplikate prüfen.';

  @override
  String get ipBasicsSection7SubBullet5 =>
      '5) Bei sACN Multicast: IGMP-Snooping/Querier prüfen (sonst Flood).';

  @override
  String get ipBasicsSection7Callout2Title => 'Sehr häufige Falle';

  @override
  String get ipBasicsSection7Bullet6 =>
      '„Legacy“-Maske auf einem PC (255.255.0.0 statt 255.255.255.0).';

  @override
  String get ipBasicsSection7Bullet7 =>
      'Ergebnis: Sie glauben, Sie seien „im selben Netzwerk“, aber nicht wie das andere Gerät.';

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
      'B = 192.168.11.200 /24 → ❌ nicht dasselbe Netzwerk';

  @override
  String get ipBasicsSection8Subtitle2 => 'Übung 2: /16 (255.255.0.0)';

  @override
  String get ipBasicsSection8SubBullet4 => 'A = 10.10.5.10 /16';

  @override
  String get ipBasicsSection8SubBullet5 =>
      'B = 10.10.200.20 /16 → ✅ gleiches Netzwerk (10.10.x.x)';

  @override
  String get ipBasicsSection8SubBullet6 =>
      'B = 10.11.200.20 /16 → ❌ nicht dasselbe Netzwerk';

  @override
  String get ipBasicsSection8CalloutTitle => 'Visueller Tipp';

  @override
  String get ipBasicsSection8Bullet1 =>
      '/24 → die ersten 3 identischen Zahlen (A.B.C) = gleiches Netzwerk.';

  @override
  String get ipBasicsSection8Bullet2 =>
      '/16 → die ersten 2 identischen Zahlen (A.B) = gleiches Netzwerk.';

  @override
  String get ipBasicsSection8Bullet3 =>
      '/8 → die 1. identische Zahl (A) = gleiches Netzwerk.';

  @override
  String get ipBasicsSection8Subtitle3 =>
      'Übung 3: Vermeiden Sie „seltsame“ IPs';

  @override
  String get ipBasicsSection8SubBullet7 =>
      '0.x.x.x: Reserviert (keine normale Host-IP).';

  @override
  String get ipBasicsSection8SubBullet8 =>
      '127.x.x.x: Loopback (Ihr PC selbst).';

  @override
  String get ipBasicsSection8SubBullet9 =>
      '169.254.x.x: Auto-IP bei fehlendem DHCP (APIPA) → Anzeichen eines DHCP-Problems.';

  @override
  String get ipBasicsSection9CalloutTitle => 'Vor der Suche von 12 bis 14 Uhr.';

  @override
  String get ipBasicsSection9Bullet1 =>
      'Gleiches Subnetz = konsistente IP + Maske.';

  @override
  String get ipBasicsSection9Bullet2 => 'Keine doppelten IPs (Konflikt).';

  @override
  String get ipBasicsSection9Bullet3 =>
      'DHCP: OK, wenn gemastert; Ansonsten klarer statischer Plan.';

  @override
  String get ipBasicsSection9Bullet4 =>
      'PC-Firewall: Kann Ping/Erkennung blockieren.';

  @override
  String get ipBasicsSection9Bullet5 =>
      'Switch/VLAN: guter Port, gutes VLAN, kein Loopback.';

  @override
  String get ipBasicsSection9Bullet6 =>
      'sACN Multicast: IGMP-Snooping/Querier empfohlen.';

  @override
  String get ipBasicsChecklistCopy =>
      'Netzwerk – Kurzcheckliste (IP)\n☐ Alle Geräte befinden sich im gleichen Subnetz (konsistente IP + Maske)\n☐ Keine doppelte IP (Konflikt)\n☐ DHCP: entweder alle in DHCP oder klarer statischer Plan (verschwommenes Mischen vermeiden)\n☐ Für Art-Net/sACN: dediziertes Netzwerk oder VLAN, wenn möglich\n☐ Switch verwaltet, wenn Multicast/IGMP (sACN)\n☐ WLAN: Bei kritischen Datenanzeigen (Jitter) vermeiden, lieber kabelgebunden verwenden\n☐ Einfacher Test: Ping + Maske/Gateway prüfen';

  @override
  String get ipBasicsFooterNote =>
      'Ziel: Genug Verständnis für die schnelle Verkabelung/Konfiguration/Fehlerbehebung in der Show.\nNetzwerkdetails können detaillierter sein, aber diese Grundlagen decken 90 % der Feldausfälle ab.';

  @override
  String get aboutDmxPainterTerm120 => 'BEGRIFF\n120Ω';

  @override
  String get aboutDmxPainterDaisyChainNote =>
      '✅ Daisy-Chain\n❌ Kein passives Y';

  @override
  String get aboutDmxPainterXlr5Title => 'XLR5 (DMX) – Kurzanleitung';

  @override
  String get aboutDmxPainterPin1 => 'Pin 1: Schirm / Masse';

  @override
  String get aboutDmxPainterPin2 => 'Pin 2: Daten−';

  @override
  String get aboutDmxPainterPin3 => 'Pin 3: Daten+';

  @override
  String get aboutDmxPainterPin45 => 'Pin 4/5: „Daten 2“ (selten / optional)';

  @override
  String get aboutDmxPainterXlr3Practice =>
      'In der Praxis: XLR3 häufig verwendet (1/2/3)';

  @override
  String get aboutDmxPainterLastFixture => 'AKTUELL\nGERÄT';

  @override
  String get aboutDmxPainterTerminationLine =>
      'Abschluss = 120 Ω am Ende der Leitung';

  @override
  String get aboutDmxPainter120Between => '120Ω\ndazwischen\nDaten− und Daten+';

  @override
  String get aboutDmxPainterOneTermination =>
      '✅ Nur ein Ende\n❌ Nicht in der Mitte\n❌ Nicht in jeder Filiale';

  @override
  String get aboutDmxPainterConsoleIp => 'KONSOLE\nArt-Net / sACN';

  @override
  String get aboutDmxPainterSwitchSacn => 'SCHALTER\n(IGMP für sACN)';

  @override
  String get aboutDmxPainterNode1 => 'KNOTEN 1\nDMX AUS';

  @override
  String get aboutDmxPainterNode2 => 'KNOTEN 2\nDMX AUS';

  @override
  String get aboutDmxPainterFix => 'FIX';

  @override
  String get aboutDmxPainterManyUniverses =>
      '✅ Viele Universen\n✅ Knoten in der Nähe von Maschinen';

  @override
  String get aboutArtnetSection2Paragraph =>
      'Ihr Ziel: dass jedes von der Quelle emittierte Universum ohne Mehrdeutigkeit am richtigen Knoten (und am richtigen Port DMX) ankommt. Die meisten Art-Net-Fehler = fehlerhaftes Universum, fehlerhaftes Subnetz/Netz oder sättigende Übertragung.';

  @override
  String get aboutArtnetSection2CalloutTitle =>
      'Einfache Methode (die 80 % der Fehler vermeidet)';

  @override
  String get aboutArtnetSection2Bullet1 =>
      '1) Schreiben Sie auf Papier: „Universum 1 → Knoten A Port 1“, „Universum 2 → Knoten A Port 2“ usw.';

  @override
  String get aboutArtnetSection2Bullet2 =>
      '2) Legen Sie stabile IPs fest (DHCP reserviert oder statisch).';

  @override
  String get aboutArtnetSection2Bullet3 =>
      '3) Bevorzugen Sie Unicast, wenn Sie mehr als einen Knoten oder ein gemeinsames Netzwerk haben.';

  @override
  String get aboutArtnetSection2Subtitle1 => 'Broadcast vs. Unicast';

  @override
  String get aboutArtnetSection2SubBullet1 =>
      'Broadcast: Sie senden an alle → einfach, kann aber einen Switch „überfluten“.';

  @override
  String get aboutArtnetSection2SubBullet2 =>
      'Unicast: Sie senden an die IP des Knotens → sauberer und vorhersehbar.';

  @override
  String get aboutArtnetSection2SubBullet3 =>
      'In der Show: im Zweifelsfall → Unicast.';

  @override
  String get aboutArtnetSection2Subtitle2 => 'Universum: Feldpraxis';

  @override
  String get aboutArtnetSection2SubBullet4 =>
      'Halten Sie die Nummerierung einfach (z. B. 1…N).';

  @override
  String get aboutArtnetSection2SubBullet5 =>
      'Vermeiden Sie „ein Universum überall“: Dokumentieren Sie Ihre Zuordnungen.';

  @override
  String get aboutArtnetSection2SubBullet6 =>
      'Bei bestimmten Setups gibt es „Netz/Subnetz/Universum“: Denken Sie an „Zuordnung“, nicht an „Magie“.';

  @override
  String get aboutArtnetSection3CalloutTitle =>
      'Die „echten“ Grenzen (in der Reihenfolge)';

  @override
  String get aboutArtnetSection3Bullet1 =>
      'WLAN: variable Latenz + Verluste → Flackern oder Aussetzer.';

  @override
  String get aboutArtnetSection3Bullet2 =>
      'Broadcast: Überlastet ein LAN (jeder erhält alles).';

  @override
  String get aboutArtnetSection3Bullet3 =>
      '„Low-End“-Switch: begrenzte Puffer, schlechte Multicast-/Broadcast-Verwaltung.';

  @override
  String get aboutArtnetSection3Bullet4 =>
      'Knoten: Firmware-/CPU-Limit (Anzahl der Universen, Häufigkeit, Optionen).';

  @override
  String get aboutArtnetSection3Bullet5 =>
      'PC/Quelle: Treiber, CPU-Auslastung, Antivirus, Netzwerkkarte usw.';

  @override
  String get aboutArtnetSection3Subtitle1 => 'Aktualisierungsgeschwindigkeit';

  @override
  String get aboutArtnetSection3SubBullet1 =>
      '„Klassisch“ DMX liegt je nach Frame oft bei etwa 20–44 fps.';

  @override
  String get aboutArtnetSection3SubBullet2 =>
      'Über IP können Sie mehr senden, aber die Knoten folgen nicht immer (und es ist nicht immer nützlich).';

  @override
  String get aboutArtnetSection3SubBullet3 =>
      'Stabilität > Frequenz: besser stabil bei 30–40 fps als „schnell“, aber instabil.';

  @override
  String get aboutArtnetSection3Subtitle2 => 'Einfache Regeln';

  @override
  String get aboutArtnetSection3SubBullet4 =>
      'Dediziertes Netzwerk (oder VLAN).';

  @override
  String get aboutArtnetSection3SubBullet5 =>
      'Unicast, wenn mehrere Knoten vorhanden sind.';

  @override
  String get aboutArtnetSection3SubBullet6 => 'Für kritische Shows geeignet.';

  @override
  String get aboutArtnetSection4Paragraph =>
      'Ein Knoten = IP → DMX. Es kann 1, 2, 4, 8 DMX-Ports haben. Die Stabilität hängt vom Knoten UND der DMX-Verkabelung auf der Ausgangsseite ab (Abschluss, Topologie, Splitter).';

  @override
  String get aboutArtnetSection4Subtitle1 => 'Knoten vs. Splitter';

  @override
  String get aboutArtnetSection4SubBullet1 =>
      'Knoten: konvertiert IP→DMX (und manchmal DMX→IP).';

  @override
  String get aboutArtnetSection4SubBullet2 =>
      'Splitter DMX: verteilt eine DMX-Leitung in Zweige (optisch empfohlen).';

  @override
  String get aboutArtnetSection4SubBullet3 =>
      'Gutes Design: IP bis zum nächsten, dann DMX kurz und sauber.';

  @override
  String get aboutArtnetSection4CalloutTitle =>
      'RDM auf Art-Net (Variablenunterstützung)';

  @override
  String get aboutArtnetSection4Bullet1 =>
      'Einige Knoten unterstützen einen „RDM-Proxy“: Die Konsole sieht/konfiguriert RDM-Geräte über IP.';

  @override
  String get aboutArtnetSection4Bullet2 =>
      'Andere unterstützen RDM überhaupt nicht oder nur teilweise.';

  @override
  String get aboutArtnetSection4Bullet3 =>
      'Ein „klassischer“ Opto-Splitter kann die RDM-Rückführung blockieren (je nach Modell).';

  @override
  String get aboutArtnetSection4Bullet4 =>
      'Tipp: Wenn Sie RDM wünschen, wählen Sie explizit Hardware aus, die als RDM-kompatibel gekennzeichnet ist.';

  @override
  String get aboutArtnetSection4Subtitle2 => 'Guter Feldreflex';

  @override
  String get aboutArtnetSection4SubBullet4 =>
      'Wenn DMX instabil: Regel DMX zuerst (Terminierung, Kabel, passives Y), dann nur IP.';

  @override
  String get aboutArtnetSection4SubBullet5 =>
      'Wenn RDM instabil ist: Deaktiviert RDM, um zu überprüfen, ob reines DMX stabil ist.';

  @override
  String get aboutArtnetSection5CalloutTitle =>
      'Symptome → wahrscheinliche Ursachen';

  @override
  String get aboutArtnetSection5Bullet1 =>
      'Überall flackern → WLAN, Broadcast-Flut, gesättigter Schalter.';

  @override
  String get aboutArtnetSection5Bullet2 =>
      'Ein Knoten OK, der andere nein → Universum/Zuordnung, IP, Unicast schlecht konfiguriert.';

  @override
  String get aboutArtnetSection5Bullet3 =>
      'Zufällige Ausfälle → defektes RJ45-Kabel, instabiler Switch, PC verwirft Pakete.';

  @override
  String get aboutArtnetSection5Bullet4 =>
      'Ein einzelner DMX-Port eines KO-Knotens → DMX-Kabel, Abschluss, Gerät, das die Leitung unterbricht.';

  @override
  String get aboutArtnetSection5Bullet5 =>
      'RDM-Erkennung unmöglich → Knoten/Splitter nicht RDM-kompatibel, DMX „grenzwertige“ Verkabelung.';

  @override
  String get aboutArtnetSection5Subtitle => 'Schnelle Methode';

  @override
  String get aboutArtnetSection5SubBullet1 =>
      '1) Unicast an einen einzelnen Knoten (einfacher Test).';

  @override
  String get aboutArtnetSection5SubBullet2 =>
      '2) Überprüfen Sie das Universum/Mapping (Papier + Knotenkonfiguration).';

  @override
  String get aboutArtnetSection5SubBullet3 =>
      '3) Direkter Kabeltest (PC → Switch → Knoten) mit bekanntem Kabel in Ordnung.';

  @override
  String get aboutArtnetSection5SubBullet4 =>
      '4) Isolieren Sie den DMX: Knoten → 1 Gerät + Abschluss.';

  @override
  String get aboutArtnetSection6Subtitle1 =>
      'Saubere Architektur (IP → Knoten → kurz DMX)';

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
      'Abschnitt zur Veranschaulichung des Netzwerks (RJ45, Switch, Kabel). Wenn die Assets nicht vorhanden sind, zeigt die App ihren eigenen Fallback an.';

  @override
  String get aboutArtnetAssetsExamplesTitle => 'Beispiele';

  @override
  String get aboutArtnetAssetsRj45Label => 'RJ45';

  @override
  String get aboutArtnetAssetsRj45Hint => 'Ethernet-Anschluss';

  @override
  String get aboutArtnetAssetsSwitchLabel => 'Schalten';

  @override
  String get aboutArtnetAssetsSwitchHint =>
      'Switch (idealerweise verwaltet, wenn IGMP/VLAN)';

  @override
  String get aboutArtnetAssetsCableLabel => 'Ethernet-Kabel';

  @override
  String get aboutArtnetAssetsCableHint => 'Cat5e/Cat6 = zuverlässige Basis';

  @override
  String get aboutArtnetChecklistCopyTitle => 'Art-Net – Checkliste vor Ort';

  @override
  String get aboutArtnetChecklistCopyTooltip => 'Checkliste kopieren';

  @override
  String get aboutArtnetChecklistTitle => 'Bevor Sie in Panik geraten';

  @override
  String get aboutArtnetChecklistBullet1 =>
      'Unicast, wenn mehrere Knoten vorhanden sind.';

  @override
  String get aboutArtnetChecklistBullet2 =>
      'Dediziertes Netzwerk (oder VLAN), wenn möglich.';

  @override
  String get aboutArtnetChecklistBullet3 => 'Für kritische Shows gerüstet.';

  @override
  String get aboutArtnetChecklistBullet4 => 'Dokumentiertes Universum/Mapping.';

  @override
  String get aboutArtnetChecklistBullet5 =>
      'Einfacher IP-Test → 1 Knoten → 1 Gerät + Terminierung.';

  @override
  String get aboutArtnetChecklistBullet6 =>
      'Wenn RDM: „RDM-Proxy“-Knoten bestätigt + stabile DMX-Verkabelung';

  @override
  String get aboutArtnetFooterNote =>
      'Indikative Informationen (Gelände). Je nach Knoten/Switch/Firmware kann das Verhalten variieren.\nZiel hier: schnell verstehen und diagnostizieren.';

  @override
  String get aboutArtnetDiagramSourceLabel => 'QUELLE\n(PC/Konsole)';

  @override
  String get aboutArtnetDiagramSwitchLabel => 'SCHALTEN';

  @override
  String get aboutArtnetDiagramNode1Label => 'KNOTEN 1\nDMX AUS';

  @override
  String get aboutArtnetDiagramNode2Label => 'KNOTEN 2\nDMX AUS';

  @override
  String get aboutArtnetDiagramFixLabel => 'FIX';

  @override
  String get aboutArtnetDiagramInfoLabel => 'Lange IP / kurze DMX';

  @override
  String get aboutArtnetDiagramSourceShortLabel => 'QUELLE';

  @override
  String get aboutArtnetDiagramNodeALabel => 'KNOTEN A';

  @override
  String get aboutArtnetDiagramNodeBLabel => 'KNOTEN B';

  @override
  String get aboutArtnetDiagramNodeCLabel => 'KNOTEN C';

  @override
  String get aboutArtnetDiagramUnicastLabel =>
      'Unicast: Pakete an einen Knoten';

  @override
  String get aboutArtnetDiagramBroadcastLabel => 'Ausstrahlung: Jeder empfängt';

  @override
  String get aboutArtnetMissingAssetLabel => 'Fehlender Vermögenswert';

  @override
  String get aboutRegistryDmxTitle =>
      'DMX – Bedienung (einfach und vollständig)';

  @override
  String get aboutRegistryDmxSubtitle =>
      'Universum, Adressen, Frames, RS-485-Verkabelung, Terminierung, Feldfehler.\nEnthält Diagramme und Checkliste.';

  @override
  String get aboutRegistryArtnetTitle =>
      'Art-Net – DMX über IP (Knoten, Unicast/Broadcast)';

  @override
  String get aboutRegistryArtnetSubtitle =>
      'Universum DMX auf Ethernet/UDP, Knoten, Broadcast vs. Unicast.\nTatsächliche Grenzen, Netzwerkstabilität, RDM je nach Hardware, Diagramme + Checkliste.';

  @override
  String get aboutRegistrySacnTitle =>
      'sACN / E1.31 – Multicast, IGMP, Prioritäten';

  @override
  String get aboutRegistrySacnSubtitle =>
      'Standard DMX im IP-orientierten professionellen Netzwerk.\nMulticast/Unicast, IGMP-Snooping/Querier, Multi-Source-Prioritäten, Schemata + Checkliste.';

  @override
  String get aboutRegistryIpBasicsTitle =>
      'Netzwerk – IP-Basen/Maske/DHCP (wesentlich)';

  @override
  String get aboutRegistryIpBasicsSubtitle =>
      'Verstehen Sie IP, Maske, Gateway, DHCP vs. statisch.\nKonkrete Beispiele (2.x.x.x, 10.x, 192.168.x), Schnelltests, Fallen aufzeigen.';

  @override
  String get aboutRegistryReseauTitle =>
      'Netzwerk – RJ45 / Glasfaser / Geschwindigkeiten und Längen';

  @override
  String get aboutRegistryReseauSubtitle =>
      'Cat5e→Cat8, OM3/OM4/OS2-Faser, LC/SC/MPO, typische Entfernungen, Best Practices zeigen.';

  @override
  String get aboutRegistryNetworkTitle =>
      'Leichtes Netzwerk – VLAN, IGMP, Wi-Fi vs. kabelgebunden';

  @override
  String get aboutRegistryNetworkSubtitle =>
      'Einfache und robuste Architektur für Art-Net/sACN.\nVLAN, IGMP-Snooping/Querier, Wi-Fi (Jitter), Switches, Diagramme + Checkliste.';

  @override
  String get aboutRegistryVideoTitle => 'Video – SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutRegistryVideoSubtitle =>
      'Wählen Sie basierend auf Latenz, Zuverlässigkeit, Verkabelung, LAN- oder WAN-Netzwerk.\nTabellen + Diagramm.';

  @override
  String get aboutRegistryElectriciteTitle =>
      'Elektrisch – Schuko / P17 / Strom';

  @override
  String get aboutRegistryElectriciteSubtitle =>
      'Steckverbinder, Mono/Tri, schnelle kW-Tabellen (16A→400A), Feldfallen.';

  @override
  String get aboutRegistryInformatiqueTitle =>
      'Computer – USB / HDMI / DP / SATA / NVMe…';

  @override
  String get aboutRegistryInformatiqueSubtitle =>
      'Nützliche Geschwindigkeiten, Versionen, echte Grenzen, Marketing-Fallstricke.';

  @override
  String get aboutUniverseToHexColHex => 'Verhexen';

  @override
  String get aboutUniverseToHexNote => 'Index = Universum − 1 (Basis 0).';

  @override
  String get aboutNetworkPageTitle => 'Leichtes Netzwerk – VLAN, IGMP, Wi-Fi';

  @override
  String get aboutNetworkCopyTooltip => 'Markierungen kopieren';

  @override
  String get aboutNetworkChecklistCopyTooltip => 'Kopie';

  @override
  String get aboutNetworkChecklistTitle => 'Vor dem Öffnen von Wireshark 😄';

  @override
  String get aboutNetworkFooterNote =>
      'Indikative Informationen (Gelände). Abhängig von der Netzwerkhardware ist möglicherweise IGMP/VLAN erforderlich.\nZiel: einfach und robust bleiben.';

  @override
  String get aboutNetworkCopy1 =>
      'Lichtnetzwerk: einfaches, dediziertes und stabiles Zielen.';

  @override
  String get aboutNetworkCopy2 =>
      'VLAN = separater Datenverkehr (leicht vs. ruhend).';

  @override
  String get aboutNetworkCopy3 =>
      'IGMP = unerlässlich, wenn sACN groß angelegter Multicast.';

  @override
  String get aboutNetworkCopy4 =>
      'Wi-Fi = ok zur Fehlerbehebung, selten ok in kritischen Produktionen.';

  @override
  String get aboutNetworkChecklistCopy =>
      'Lichtnetzwerk – Checkliste\n☐ Dediziertes Netzwerk oder leichtes VLAN\n☐ IP-Plan löschen (DHCP oder statisch) + Maske ok\n☐ Richtiger Schalter; Schleifen vermieden\n☐ sACN Multicast: IGMP-Snooping EIN\n☐ IGMP-Querier im VLAN vorhanden (falls erforderlich)\n☐ Unicast bei der Fehlerbehebung (insbesondere Art-Net)\n☐ WLAN: Kritische Produktion vermeiden (Jitter/Verluste)\n☐ Tests: stabiler Ping + progressive Belastung (Universum)';

  @override
  String get aboutNetworkToc1 => '1) Ziel: stabiles Netzwerk';

  @override
  String get aboutNetworkToc2 => '2) IP-Plan (einfach)';

  @override
  String get aboutNetworkToc3 => '3) VLAN (Trennung)';

  @override
  String get aboutNetworkToc4 => '4) IGMP (sACN Multicast)';

  @override
  String get aboutNetworkToc5 => '5) WLAN vs. kabelgebunden';

  @override
  String get aboutNetworkToc6 => '6) Schalter: was Sie brauchen';

  @override
  String get aboutNetworkToc7 => '7) Schemata';

  @override
  String get aboutNetworkToc8 => '8) Checkliste';

  @override
  String get aboutNetworkBasicsPill1 => 'Dediziert/VLAN';

  @override
  String get aboutNetworkBasicsPill2 => 'Verdrahtet';

  @override
  String get aboutNetworkBasicsPill3 => 'IGMP bei Multicast';

  @override
  String get aboutNetworkBasicsParagraph =>
      'Ein Beleuchtungsnetzwerk muss vorhersehbar sein: geringer Verlust, geringer Jitter, einfache Architektur. Wenn etwas schief geht, liegt es selten am „Protokoll“ und oft an der Infrastruktur (Switch, WLAN, Loops, Flood).';

  @override
  String get aboutNetworkBasicsCalloutTitle => 'Grundregel';

  @override
  String get aboutNetworkBasicsBullet1 =>
      'Wenn Sie können: verkabelt + korrekter Switch + dediziertes Netzwerk (oder VLAN).';

  @override
  String get aboutNetworkBasicsBullet2 =>
      'Wenn Sie teilen müssen: VLAN + klare Regeln.';

  @override
  String get aboutNetworkBasicsBullet3 =>
      'sACN Multicast: IGMP wird schnell zur Pflicht.';

  @override
  String get aboutNetworkPlanIpParagraph =>
      'Wählen Sie eine einfache und konsistente Strategie. Zwei Ansätze: DHCP (einfach) oder statisch (vorhersehbar). Das Schlimmste: eine undokumentierte Mischung.';

  @override
  String get aboutNetworkPlanIpCalloutTitle => 'Beispielplan (einfach)';

  @override
  String get aboutNetworkPlanIpBullet1 => 'Leichtes VLAN: 10.10.0.0/24';

  @override
  String get aboutNetworkPlanIpBullet2 => 'Konsole/PC: 10.10.0.10';

  @override
  String get aboutNetworkPlanIpBullet3 => 'Knoten: 10.10.0.100–150';

  @override
  String get aboutNetworkPlanIpBullet4 => 'Schalterverwaltung: 10.10.0.2';

  @override
  String get aboutNetworkPlanIpSubtitle => 'Klassische Fehler';

  @override
  String get aboutNetworkPlanIpSubBullet1 =>
      'Unterschiedliche Maske (z. B. /24 vs. /16) → unsichtbare Maschinen.';

  @override
  String get aboutNetworkPlanIpSubBullet2 =>
      'Zwei Geräte haben dieselbe IP → zufälliges Verhalten.';

  @override
  String get aboutNetworkPlanIpSubBullet3 =>
      'DHCP + statisch im gleichen Bereich ohne Kontrolle → Konflikte.';

  @override
  String get aboutNetworkVlanParagraph =>
      'Mit einem VLAN können Sie das Licht vom Rest (Internet, Videoproduktion, Gäste usw.) isolieren. Dies vermeidet Netzwerkrauschen und verringert das Risiko, dass ein anderer Dienst Ihre Show stört.';

  @override
  String get aboutNetworkVlanCalloutTitle => 'Was Sie gewinnen';

  @override
  String get aboutNetworkVlanBullet1 => 'Weniger unerwünschter Verkehr.';

  @override
  String get aboutNetworkVlanBullet2 =>
      'Geringeres Risiko (externes DHCP, unerwünschter Broadcast).';

  @override
  String get aboutNetworkVlanBullet3 =>
      'Einfacheres Debuggen (alles im VLAN = Light).';

  @override
  String get aboutNetworkVlanSubtitle => 'Aufmerksamkeit';

  @override
  String get aboutNetworkVlanSubBullet1 =>
      'Ein VLAN = alle Ports müssen ordnungsgemäß konfiguriert sein (Zugriff/Trunk).';

  @override
  String get aboutNetworkVlanSubBullet2 =>
      'Falls Sie es nicht wissen: Ein dediziertes „physisches“ Netzwerk ist oft einfacher.';

  @override
  String get aboutNetworkIgmpPill1 => 'IGMP-Schnüffeln';

  @override
  String get aboutNetworkIgmpPill2 => 'IGMP-Abfrage';

  @override
  String get aboutNetworkIgmpPill3 => 'Multicast-Flooding';

  @override
  String get aboutNetworkIgmpParagraph =>
      'Durch IGMP-Snooping kann der Switch erkennen, welche Ports welchen Multicast wünschen. Ohne dies kann Multicast auf allen Ports überflutet werden → Sättigung.';

  @override
  String get aboutNetworkIgmpCalloutTitle => 'IGMP-Querier (einfache Idee)';

  @override
  String get aboutNetworkIgmpBullet1 =>
      'In einigen Netzwerken/VLANs ist ein Abfrager erforderlich, um IGMP-Abonnements zu verwalten.';

  @override
  String get aboutNetworkIgmpBullet2 =>
      'Ohne Frage: Je nach Schalter laufen Abonnements ab und es kommt zu „Störungen“.';

  @override
  String get aboutNetworkIgmpBullet3 =>
      'Wenn Sie sich in einem kleinen dedizierten Netzwerk befinden: Manchmal funktioniert alles, aber in einem großen Netzwerk: Es ist entscheidend.';

  @override
  String get aboutNetworkIgmpSubtitle => 'Schema: IGMP (Idee)';

  @override
  String get aboutNetworkWifiSubtitle1 => 'Verdrahtet';

  @override
  String get aboutNetworkWifiSubtitle2 => 'W-lan';

  @override
  String get aboutNetworkWifiSubBullet1 =>
      '✅ Stabile Latenz, geringe Verluste (bei sauberer Infrastruktur).';

  @override
  String get aboutNetworkWifiSubBullet2 => '✅ Empfohlen in der Produktion.';

  @override
  String get aboutNetworkWifiSubBullet3 =>
      '✅ Praktisch (schnelle Einrichtung, Tablet).';

  @override
  String get aboutNetworkWifiSubBullet4 =>
      '❌ Variable Latenz (Jitter), Verluste, Interferenzen.';

  @override
  String get aboutNetworkWifiSubBullet5 =>
      '❌ Multicast wird je nach AP/Konfiguration manchmal schlecht verwaltet.';

  @override
  String get aboutNetworkWifiSubBullet6 =>
      'OK Fehlerbehebung / kleine unkritische Konfigurationen, bei geladener Show selten OK.';

  @override
  String get aboutNetworkWifiCalloutTitle => 'Einfache Regel';

  @override
  String get aboutNetworkWifiBullet1 => 'Kritische Show = verkabelt.';

  @override
  String get aboutNetworkWifiBullet2 =>
      'Wi-Fi = Bedienerkomfort (UI), nicht Haupttransport DMX/IP bei großem Volumen.';

  @override
  String get aboutNetworkSwitchCalloutTitle => 'Mindestens empfohlen';

  @override
  String get aboutNetworkSwitchBullet1 =>
      'Richtiger Ethernet-Switch (nicht Hub).';

  @override
  String get aboutNetworkSwitchBullet2 => 'Kabel ok (RJ45, Anschlüsse).';

  @override
  String get aboutNetworkSwitchBullet3 =>
      'Vermeiden Sie Schleifen (oder kontrollierte STP).';

  @override
  String get aboutNetworkSwitchBullet4 => 'Wenn sACN Multicast: IGMP-Snooping.';

  @override
  String get aboutNetworkSwitchSubtitle => 'Verwaltet vs. nicht verwaltet';

  @override
  String get aboutNetworkSwitchSubBullet1 =>
      'Nicht verwaltet: ok, kleines dediziertes Netzwerk (einfach).';

  @override
  String get aboutNetworkSwitchSubBullet2 =>
      'Verwaltet: nützlich für VLAN/IGMP/Diagnose (großes Netzwerk).';

  @override
  String get aboutNetworkDiagramsSubtitle1 => 'VLAN: separates Licht/Rest';

  @override
  String get aboutNetworkDiagramsSubtitle2 => 'Wi-Fi vs. kabelgebunden (Idee)';

  @override
  String get aboutNetworkChecklistBullet1 =>
      'Klarer IP-Plan, einheitliche Maske.';

  @override
  String get aboutNetworkChecklistBullet2 =>
      'Dediziertes Netzwerk / leichtes VLAN.';

  @override
  String get aboutNetworkChecklistBullet3 => 'Schalter OK, keine Schleifen.';

  @override
  String get aboutNetworkChecklistBullet4 => 'IGMP für sACN Multicast.';

  @override
  String get aboutNetworkChecklistBullet5 =>
      'Wi-Fi wird in der kritischen Produktion vermieden.';

  @override
  String get videoCameraExposureTitle => 'Kamerabelichtung';

  @override
  String get videoCameraExposureSubtitle =>
      'Lux → EV, ISO, Geschwindigkeit und Blende.';

  @override
  String get videoCamPageTitle => 'Kamerabelichtung';

  @override
  String get videoCamInfoTitle => 'Information';

  @override
  String get videoCamIntro =>
      'Indikative Berechnungen zum Verhältnis von Lux, ISO, Geschwindigkeit und Blende.';

  @override
  String get videoCamInputsTitle => 'Vorspeisen';

  @override
  String get videoCamLuxLabel => 'Lux';

  @override
  String get videoCamLuxHint => 'Beispiel: 500';

  @override
  String get videoCamIsoLabel => 'ISO';

  @override
  String get videoCamIsoHint => 'Beispiel: 800';

  @override
  String get videoCamShutterLabel => 'Geschwindigkeit(en)';

  @override
  String get videoCamShutterHint => 'Beispiel: 1/50';

  @override
  String get videoCamApertureLabel => 'Eröffnung (f/)';

  @override
  String get videoCamApertureHint => 'Beispiel: 2.8';

  @override
  String get videoCamEvEmpty => '—';

  @override
  String get videoCamNote =>
      'Richtwerte: Die Kalibrierung hängt vom Sensor, der Szene und den Standards ab.';

  @override
  String videoCamEvValue(Object ev) {
    return 'EV $ev';
  }

  @override
  String videoCamApertureResult(Object aperture) {
    return 'Blende: f/$aperture';
  }

  @override
  String videoCamShutterResult(Object shutter) {
    return 'Geschwindigkeit: $shutter s';
  }

  @override
  String get aboutDmxS2Title => '2) Frame DMX – Pause, Startcode, Kanäle';

  @override
  String get aboutDmxS2PillBreak => 'Brechen';

  @override
  String get aboutDmxS2PillStartCode => 'Code starten';

  @override
  String get aboutDmxS2PillSlots512 => '512 Steckplätze';

  @override
  String get aboutDmxS2PillRefresh => 'Aktualisieren';

  @override
  String get aboutDmxS2Intro =>
      'Ein DMX-Frame wird in einer Schleife gesendet. Es beginnt mit einer „Pause“ (Stille), dann einem Startcode, dann bis zu 512 Werte (0–255). Jedes Gerät liest nur die Kanäle, die es betreffen (je nach Adresse und Modus).';

  @override
  String get aboutDmxS2HowToReadTitle => 'Einen Frame lesen (sehr einfach)';

  @override
  String get aboutDmxS2HowToReadB1 =>
      'Break + MAB: Markiert den Start des Frames (Resynchronisation).';

  @override
  String get aboutDmxS2HowToReadB2 =>
      'Startcode: meistens 0x00 (Beleuchtungsdaten).';

  @override
  String get aboutDmxS2HowToReadB3 =>
      'Slots 1→512: jeder Slot = 1 Kanal (0–255).';

  @override
  String get aboutDmxS2HowToReadB4 =>
      'Der Frame startet fortlaufend neu: Es ist normal, den alten Wert zu „überschreiben“.';

  @override
  String get aboutDmxS2PracticalTitle => 'In der Praxis';

  @override
  String get aboutDmxS2PracticalB1 =>
      'Ein 16-Bit-Modus verwendet 2 Kanäle für die gleiche Funktion (z. B. Pan grob + Pan fein).';

  @override
  String get aboutDmxS2PracticalB2 =>
      'Je mehr Universen Sie senden, desto mehr steigt die Gesamtlast (Konsolen/Knoten/Netzwerk).';

  @override
  String get aboutDmxS2PracticalB3 =>
      'Wenn Sie Flimmern haben, denken Sie zuerst über Kabel/Abschluss/Verbindungen nach, bevor Sie die Konsole in Verdacht bringen.';

  @override
  String get aboutDmxS3Title =>
      '3) Verkabelung DMX – RS-485, Topologie, Pinbelegung';

  @override
  String get aboutDmxS3PillRs485 => 'RS-485';

  @override
  String get aboutDmxS3PillDaisyChain => 'Daisy-Chain';

  @override
  String get aboutDmxS3PillNoY => 'Nein Y';

  @override
  String get aboutDmxS3Pill120ohm => '120Ω';

  @override
  String get aboutDmxS3Intro =>
      'DMX512 basiert auf RS-485: einem Differentialbus, der klare Linien mag. Die goldene Regel: eine Kette (Daisy-Chain) von der Quelle zu den Geräten, dann ein Abschluss am Ende.';

  @override
  String get aboutDmxS3TopologyTitle => 'Empfohlene Topologie';

  @override
  String get aboutDmxS3TopologyB1 =>
      'Quelle → Gerät 1 → Gerät 2 → … → letztes Gerät.';

  @override
  String get aboutDmxS3TopologyB2 =>
      'Vermeiden Sie Y-Ablenkungen: Sie erzeugen Reflexionen (Instabilität).';

  @override
  String get aboutDmxS3TopologyB3 =>
      'Wenn Abzweigungen vorgenommen werden müssen: Verwenden Sie einen optisch isolierten DMX-Splitter.';

  @override
  String get aboutDmxS3PinoutTitle => 'Verbindungen (Erinnerung)';

  @override
  String get aboutDmxS3CablesTitle => 'Kabel: Was wirklich funktioniert';

  @override
  String get aboutDmxS3CablesB1 =>
      'Verwendet ein DMX-Kabel (Impedanz ~120 Ω), kein beliebiges Mikrofon (außer bei kurzer Fehlerbehebung).';

  @override
  String get aboutDmxS3CablesB2 =>
      'Halten Sie die Längen angemessen und vermeiden Sie enge Wicklungen in der Nähe von Netzteilen/Dimmern.';

  @override
  String get aboutDmxS3CablesB3 =>
      'Ein schlechtes Kabel = manchmal „funktioniert es“ … bis zu dem Tag, an dem es nicht mehr funktioniert (Luftfeuchtigkeit, Länge, Last).';

  @override
  String get aboutDmxS4Title => '4) Terminierung und Splitter – Busstabilität';

  @override
  String get aboutDmxS4Intro =>
      'Bei einem RS-485-Bus werden durch die Terminierung Reflexionen am Ende der Leitung vermieden. Splitter (optoisoliert) werden verwendet, um saubere Abzweigungen zu erzeugen und die Quelle zu schützen.';

  @override
  String get aboutDmxS4TerminatorTitle => 'Terminierung (120 Ω): wann und wie';

  @override
  String get aboutDmxS4TerminatorB1 =>
      'Setzt am letzten Gerät einen Abschluss (oder einen XLR-Stecker).';

  @override
  String get aboutDmxS4TerminatorB2 =>
      'Nur ein Abschluss pro Leitung (nicht überall).';

  @override
  String get aboutDmxS4TerminatorB3 =>
      'Unverzichtbar bei langen Leitungen, großen Lasten und lauten Umgebungen.';

  @override
  String get aboutDmxS4SplittersTitle => 'Splitter / Opto-Isolation';

  @override
  String get aboutDmxS4SplittersB1 =>
      'Ermöglicht die Erstellung von 2, 4, 8 Zweigen ohne „Y“.';

  @override
  String get aboutDmxS4SplittersB2 =>
      'Elektrisch isoliert: Begrenzt Erdschleifen und schützt die Konsole/den Knoten.';

  @override
  String get aboutDmxS4SplittersB3 =>
      'Praktisch zum „Nachfahren“ eines Signals über große Entfernungen.';

  @override
  String get aboutDmxS5Title =>
      '5) Fehlerbehebung – einfache Methode (schnell und zuverlässig)';

  @override
  String get aboutDmxS5Intro =>
      'Wenn ein Gerät nicht antwortet, liegt der Schlüssel darin, Folgendes zu isolieren: Liegt es an der Adresse, am Modus, an der DMX-Leitung oder am Gerät? Befolgen Sie eine kurze Checkliste, bevor Sie alles neu konfigurieren.';

  @override
  String get aboutDmxS5QuickChecksTitle => 'Kurze Checkliste';

  @override
  String get aboutDmxS5QuickB1 =>
      'Adresse DMX korrekt? (und nicht 001 vs. 000, je nach Bildschirm).';

  @override
  String get aboutDmxS5QuickB2 => 'Richtiger DMX-Modus (Anzahl der Kanäle)?';

  @override
  String get aboutDmxS5QuickB3 =>
      'Gutes Universum/Ausgabe (Konsole, Knoten, Port)?';

  @override
  String get aboutDmxS5QuickB4 =>
      'Testen Sie es mit einem bekanntermaßen in Ordnung befindlichen Kabel und ersetzen Sie es dann einzeln.';

  @override
  String get aboutDmxS5QuickB5 =>
      'Fügen Sie am Ende der Zeile ein Ende hinzu oder entfernen Sie es, um den Effekt zu sehen.';

  @override
  String get aboutDmxS5IfFlickerTitle => 'Wenn es flackert / stärker wird';

  @override
  String get aboutDmxS5IfFlickerB1 =>
      'Suchen Sie nach einem versteckten „Y“, einem ungeeigneten Splitter oder einem schlechten XLR-Adapter.';

  @override
  String get aboutDmxS5IfFlickerB2 =>
      'Hält DMX von Netzteilen/Dimmern fern und vermeidet große Kabelschleifen.';

  @override
  String get aboutDmxS5IfFlickerB3 =>
      'Reduzieren Sie die Komplexität: 1 Universum, 1 Linie, 1 Gerät, dann wird neu erstellt.';

  @override
  String get aboutDmxS5GoldenRuleTitle => 'Goldene Regel';

  @override
  String get aboutDmxS5GoldenRuleBody =>
      'Sie müssen in der Lage sein, ein einzelnes Gerät an einer einzigen Leitung zu betreiben. Wenn dieser grundlegende Test fehlschlägt, liegt das Problem nicht am „gesamten Patch“, sondern an der Adressierung, der Verkabelung oder der Hardware.';

  @override
  String get aboutDmxS6Title =>
      '6) Art-Net – DMX zu IP (Vokabular und Fallstricke)';

  @override
  String get aboutDmxS6PillUdp => 'UDP';

  @override
  String get aboutDmxS6PillNodes => 'Knoten';

  @override
  String get aboutDmxS6PillBroadcast => 'übertragen';

  @override
  String get aboutDmxS6PillUnicast => 'Unicast';

  @override
  String get aboutDmxS6Intro =>
      'Art-Net transportiert DMX Universen über Ethernet (UDP). Eine Konsole/Software sendet Universen über das Netzwerk und ein Knoten wandelt sie in physische DMX-Ausgaben um.';

  @override
  String get aboutDmxS6BasicsTitle => 'Zum Erinnern';

  @override
  String get aboutDmxS6BasicsB1 =>
      'Ein Knoten = Netzwerk ↔ DMX (mehrere Ports).';

  @override
  String get aboutDmxS6BasicsB2 =>
      'Broadcast wird an alle gesendet (einfach, kann aber überfordern).';

  @override
  String get aboutDmxS6BasicsB3 =>
      'Unicast sendet nur an den Zielknoten (auf großen Rigs oft stabiler).';

  @override
  String get aboutDmxS6BasicsB4 =>
      'Seien Sie vorsichtig beim Zählen von Universen: Oft beginnt Art-Net bei 0 (Universum 1 DMX = 0 Art-Net).';

  @override
  String get aboutDmxS6WhenTitle => 'Wann sollte man Art-Net wählen?';

  @override
  String get aboutDmxS6WhenB1 =>
      'Kleine/mittlere Rigs, schnelle Aufbauten, viele kompatible Geräte.';

  @override
  String get aboutDmxS6WhenB2 =>
      'OK, wenn das Netzwerk sauber ist (richtiger Switch, Kabel, kein WLAN).';

  @override
  String get aboutDmxS6WhenB3 =>
      'Bei Auslastung: Wechseln Sie zu Unicast und segmentieren Sie das Netzwerk (VLAN / dediziertes Netzwerk).';

  @override
  String get aboutDmxS7Title =>
      '7) sACN (E1.31) – Multicast, Prioritäten, eigenes Netzwerk';

  @override
  String get aboutDmxS7PillE131 => 'E1.31';

  @override
  String get aboutDmxS7PillMulticast => 'Multicast';

  @override
  String get aboutDmxS7PillPriority => 'Priorität';

  @override
  String get aboutDmxS7PillIgmp => 'IGMP';

  @override
  String get aboutDmxS7Intro =>
      'sACN (ANSI E1.31) ist ein moderner Standard für den Transport von DMX-Universen über IP. Es wird häufig in großen Systemen verwendet, da es Multicast und Prioritäten gut verwaltet.';

  @override
  String get aboutDmxS7KeyIdeasTitle => 'Schlüsselideen';

  @override
  String get aboutDmxS7KeyIdeasB1 =>
      'Multicast: Ein Universum ist eine Netzwerk-„Gruppe“ (die Knoten abonnieren).';

  @override
  String get aboutDmxS7KeyIdeasB2 =>
      'IGMP-Schnüffeln an Switches = im großen Maßstab unerlässlich (sonst kommt es zu Überschwemmungen).';

  @override
  String get aboutDmxS7KeyIdeasB3 =>
      'Priorität: mehrere mögliche Quellen, diejenige mit der höchsten Priorität gewinnt.';

  @override
  String get aboutDmxS7KeyIdeasB4 =>
      'Wie Art-Net: sauberes Netzwerk + hochwertige Kabel/Switch = Stabilität.';

  @override
  String get aboutDmxS8Title =>
      '8) DMX vs Art-Net vs sACN – Zusammenfassung (was soll ich wählen?)';

  @override
  String get aboutDmxS8Intro =>
      'Alle drei machen letztendlich dasselbe: Kanäle steuern. Der Unterschied liegt in der Verteilung (DMX Kabel vs. Netzwerk), der Skalierung und der Robustheit.';

  @override
  String get aboutDmxS8QuickTableTitle => 'Zusammenfassung in 4 Zeilen';

  @override
  String get aboutDmxS8QuickB1 =>
      'DMX: einfach, robust, 1 Kabel = 1 Leitung (512 Kanäle).';

  @override
  String get aboutDmxS8QuickB2 =>
      'Art-Net: Sehr verbreitet, einfach bereitzustellen, achten Sie auf Übertragungen.';

  @override
  String get aboutDmxS8QuickB3 =>
      'sACN: Mehr „pro große Systeme“, Multicast + Prioritäten, erfordert ein gut konfiguriertes Netzwerk.';

  @override
  String get aboutDmxS8QuickB4 =>
      'In allen Fällen gilt: Dokumentation + fortschreitendes Testen = enorme Zeitersparnis.';

  @override
  String get aboutDmxS8ChooseTitle => 'Schnelle Wahl';

  @override
  String get aboutDmxS8ChooseB1 =>
      'Kleine Einrichtung: DMX direkt oder Art-Net (einfach).';

  @override
  String get aboutDmxS8ChooseB2 =>
      'Viele Universen: dediziertes Netzwerk + Knoten; Art-Net in Unicast oder sACN.';

  @override
  String get aboutDmxS8ChooseB3 =>
      'Sehr große Anlagen/Infrastrukturen: sACN + gut verwaltete Switches/IGMP.';

  @override
  String get aboutSunTimesTitle => 'Sonne (Aufgang/Untergang)';

  @override
  String get aboutSunTimesSubtitle =>
      'Auswahl einer Stadt und eines Datums, Sonnenaufgangs-/Untergangszeiten + Schwellenwerte (Lux).';

  @override
  String get homeBpmTitle => 'BPM';

  @override
  String get aboutReseauPageTitle => 'Netzwerk – Feld-Benchmarks';

  @override
  String get aboutReseauSummaryCopy =>
      'NETZWERK – Feld-Benchmarks\n• RJ45: Cat5e/6/6A → 1G/10G je nach Entfernung.\n• Glasfaser: Langstrecken + EMI-Immunität.\n• Schalter: IGMP wichtig für sACN Multicast.\n• VLAN: separates Licht/Video/IT = Stabilität.';

  @override
  String get aboutReseauChecklistCopy =>
      'NETZWERK – Checkliste\n☐ Klarer IP-Plan (Bereich/Masken)\n☐ Korrekter Switch (IGMP wenn sACN Multicast)\n☐ VLAN wenn mehrere „Welten“ (Licht/Video/IT)\n☐ Kabel geprüft + beschriftet\n☐ Glasfaser: kompatible Module + eigene Anschlüsse\n☐ Vermeiden Sie Schleifen (STP) + vermeiden Sie öffentliches WLAN auf der LAN-Anzeige';

  @override
  String get aboutReseauChecklistCopyTooltip => 'Kopie';

  @override
  String get aboutReseauFooterNote =>
      'Indikative Informationen (Gelände). Die genauen Kapazitäten variieren je nach Hardware/Kabeln/Modulen.\nZiel: einfache Benchmarks + zuverlässige Methode.';

  @override
  String get aboutReseauToc1 => '1) Netzwerkgrundlagen (LAN / IP / Durchsatz)';

  @override
  String get aboutReseauToc2 => '2) RJ45 & Kategorien (Cat5e/6/6A/…)';

  @override
  String get aboutReseauToc3 => '3) PoE (Netzwerk-Stromversorgung)';

  @override
  String get aboutReseauToc4 => '4) Glasfaser (SM/MM) + Anschlüsse (LC/SC)';

  @override
  String get aboutReseauToc5 => '5) SFP / SFP+ / QSFP (Module)';

  @override
  String get aboutReseauToc6 => '6) Switches (VLAN / IGMP / QoS)';

  @override
  String get aboutReseauToc7 => '7) Art-Net / sACN im Netzwerk (Beratung)';

  @override
  String get aboutReseauToc8 => '8) Checkliste';

  @override
  String get aboutReseauSection1Title => 'Die 3 einfachen Ideen';

  @override
  String get aboutReseauSection1Bullet1 => 'IP = Adresse (z. B. 10.0.0.50).';

  @override
  String get aboutReseauSection1Bullet2 =>
      'LAN = lokales Netzwerk über Switch (nicht „Internet“).';

  @override
  String get aboutReseauSection1Bullet3 =>
      'Fluss = Kapazität (1G, 10G usw.), aber die Stabilität hängt auch vom Schalter ab.';

  @override
  String get aboutReseauSection1Title2 => '(Saubere) Topologie anzeigen';

  @override
  String get aboutReseauSection1Bullet4 =>
      'Konsole/PC → zentraler Switch → Knoten/Server.';

  @override
  String get aboutReseauSection1Bullet5 =>
      'Vermeiden Sie zufällige „Daisy-Chain-Netzwerke“.';

  @override
  String get aboutReseauSection1Bullet6 =>
      'Wenn möglich: ein dediziertes Show-Netzwerk (kein öffentliches WLAN).';

  @override
  String get aboutReseauSection2Title => 'Kurzreferenzen';

  @override
  String get aboutReseauSection2Bullet1 =>
      'Cat5e: 1 Gbit/s „klassisch“ (bis zu 100 m).';

  @override
  String get aboutReseauSection2Bullet2 =>
      'Cat6: 1G/10G (10G eher über kürzere Distanzen).';

  @override
  String get aboutReseauSection2Bullet3 =>
      'Cat6A: 10G bis zu 100 m (Praxisreferenz).';

  @override
  String get aboutReseauSection2Bullet4 =>
      'Darüber hinaus: Es gibt Cat7/8, aber Cat6A ist auf diesem Gebiet oft der beste Platz.';

  @override
  String get aboutReseauSection2Title2 => 'Boden';

  @override
  String get aboutReseauSection2Bullet5 =>
      'Testen/beschriften Sie Kabel immer (besonders wenn sie gemietet werden).';

  @override
  String get aboutReseauSection2Bullet6 =>
      'Vermeiden Sie beschädigte Anschlüsse: ein „müder“ RJ45 = Phantomfehler.';

  @override
  String get aboutReseauSection2Bullet7 =>
      'Planen Sie 10G ein, wenn Sie umfangreiche IP-Videos nutzen.';

  @override
  String get aboutReseauSection3Paragraph =>
      'Mit PoE können Sie Geräte über RJ45 mit Strom versorgen (IP-Kamera, WLAN-AP, kleine Knoten usw.). Der kritische Punkt: das gesamte PoE-Budget der Umstellung.';

  @override
  String get aboutReseauSection3Title => 'Sehenswürdigkeiten';

  @override
  String get aboutReseauSection3Bullet1 =>
      'PoE (802.3af) ≈ 15 W, PoE+ (802.3at) ≈ 30 W, PoE++/bt höher.';

  @override
  String get aboutReseauSection3Bullet2 =>
      'Der Schalter hat ein Gesamtbudget (z. B. 120 W).';

  @override
  String get aboutReseauSection3Bullet3 =>
      'Bei Überschreitung des Budgets: Einige Ports leuchten nicht mehr / starten nicht mehr.';

  @override
  String get aboutReseauSection4Title => 'Warum Faser in der Show';

  @override
  String get aboutReseauSection4Bullet1 => 'Sehr weite Strecken.';

  @override
  String get aboutReseauSection4Bullet2 =>
      'Immunität gegen Parasiten (EMI), Top in geschäftigen Umgebungen.';

  @override
  String get aboutReseauSection4Bullet3 =>
      'Praktisch für die Verbindung von FOH ↔ Bühne ↔ Regie.';

  @override
  String get aboutReseauSection4Title2 =>
      'Multimode vs. Singlemode (einzelne Markierung)';

  @override
  String get aboutReseauSection4Bullet4 =>
      'Multimode (MM): „durchschnittliche“ Entfernungen (häufig Gebäude/Plattform).';

  @override
  String get aboutReseauSection4Bullet5 =>
      'Singlemode (SM): sehr große Entfernungen.';

  @override
  String get aboutReseauSection4Bullet6 =>
      'Die Module (SFP) müssen zum Fasertyp passen.';

  @override
  String get aboutReseauSection4Title3 => 'Anschlüsse';

  @override
  String get aboutReseauSection4Bullet7 => 'LC: klein, sehr häufig bei SFP.';

  @override
  String get aboutReseauSection4Bullet8 =>
      'SC: größer, häufig in der Infrastruktur.';

  @override
  String get aboutReseauSection4Bullet9 =>
      'Stets schützen/reinigen (Staub = Verluste).';

  @override
  String get aboutReseauSection5Title => 'Sehenswürdigkeiten';

  @override
  String get aboutReseauSection5Bullet1 => 'SFP: oft 1G.';

  @override
  String get aboutReseauSection5Bullet2 => 'SFP+: oft 10G.';

  @override
  String get aboutReseauSection5Bullet3 => 'QSFP/QSFP+: 40G (je nach Nutzung).';

  @override
  String get aboutReseauSection5Bullet4 =>
      'Ein Modul = Geschwindigkeit + Fasertyp + Länge (alles muss konsistent sein).';

  @override
  String get aboutReseauSection5Paragraph =>
      'In der Praxis: Nehmen Sie mit dem Switch kompatible Module (und idealerweise vom gleichen Lieferanten/Modell), um Überraschungen zu vermeiden.';

  @override
  String get aboutReseauSection6Title => 'Nützliche Funktionen in Show';

  @override
  String get aboutReseauSection6Bullet1 =>
      'VLAN: separates Licht / Video / IT.';

  @override
  String get aboutReseauSection6Bullet2 =>
      'IGMP-Snooping: unerlässlich, wenn Sie sACN Multicast in großem Umfang verwenden.';

  @override
  String get aboutReseauSection6Bullet3 =>
      'QoS: nützlich, wenn Sie viele Flüsse mischen (je nach Kontext).';

  @override
  String get aboutReseauSection6Title2 => 'Häufige Fehler';

  @override
  String get aboutReseauSection6Bullet4 =>
      '„Billiger“ Switch, der das Multicast überschwemmt → Netzwerk, das zusammenbricht.';

  @override
  String get aboutReseauSection6Bullet5 =>
      'Netzwerkschleife ohne STP → Broadcast Storm.';

  @override
  String get aboutReseauSection6Bullet6 =>
      'Öffentliches WLAN im selben LAN wie die Show → Instabilität.';

  @override
  String get aboutReseauSection7Title => 'Art-Net (Feld)';

  @override
  String get aboutReseauSection7Bullet1 => 'Oft einfach einzurichten.';

  @override
  String get aboutReseauSection7Bullet2 =>
      'Broadcast ist über ein kleines dediziertes LAN möglich, Unicast ist jedoch sauberer.';

  @override
  String get aboutReseauSection7Bullet3 =>
      'Universums-/Portzuordnung = Punkt Nummer 1, der überprüft werden muss.';

  @override
  String get aboutReseauSection7Title2 => 'sACN (Feld)';

  @override
  String get aboutReseauSection7Bullet4 =>
      'Multicast: effektiv, erfordert aber einen korrekten Switch (IGMP).';

  @override
  String get aboutReseauSection7Bullet5 =>
      'Prioritäten: nützlich, wenn mehrere Quellen vorhanden sind.';

  @override
  String get aboutReseauSection7Bullet6 =>
      'Bei großen Messen: sACN + IGMP ist oft die „saubere“ Wahl.';

  @override
  String get aboutReseauChecklistTitle => 'Schnell';

  @override
  String get aboutReseauChecklistBullet1 =>
      'Richtiger Schalter + saubere Kabel.';

  @override
  String get aboutReseauChecklistBullet2 => 'IGMP wenn sACN Multicast.';

  @override
  String get aboutReseauChecklistBullet3 => 'Separate Nutzungen (VLAN).';

  @override
  String get aboutSacnPageTitle => 'sACN / E1.31 – Multicast und Prioritäten';

  @override
  String get aboutSacnCopyTooltip => 'Markierungen kopieren';

  @override
  String get aboutSacnChecklistCopyTooltip => 'Kopie';

  @override
  String get aboutSacnFooterNote =>
      'Indikative Informationen (Gelände). Das Verhalten hängt von Switches (IGMP), Knoten und Firmware ab.\nZiel: Ein sACN-Netzwerk verstehen und stabilisieren.';

  @override
  String get aboutSacnCopy1 =>
      'sACN (E1.31) = DMX über IP (UDP), Standard anzeigen.';

  @override
  String get aboutSacnCopy2 => 'Universum sACN = 1..63999 (Standardbereich).';

  @override
  String get aboutSacnCopy3 =>
      'Multicast: IGMP-Snooping empfohlen, sonst Flood.';

  @override
  String get aboutSacnCopy4 =>
      'Priorität: nützlich bei mehreren Quellen (Konsole + Backup).';

  @override
  String get aboutSacnChecklistCopy =>
      'sACN (E1.31) – Checkliste vor Ort\n☐ Richtiger Schalter (idealerweise beherrschbar)\n☐ IGMP-Snooping aktiviert, wenn Multicast\n☐ (Wenn möglich) IGMP-Querier im VLAN vorhanden (sonst seltsames Verhalten möglich)\n☐ Unicast, wenn das Netzwerk nicht kontrolliert wird / Fehlerbehebung\n☐ Prioritäten: Mehrere Quellen prüfen (Konsole/Backup)\n☐ Universumszuordnung ↔ Knoten-Ports überprüft\n☐ WLAN wird in der Produktion vermieden';

  @override
  String get aboutSacnToc1 => '1) Wofür wird sACN verwendet?';

  @override
  String get aboutSacnToc2 => '2) Universum (Nummerierung)';

  @override
  String get aboutSacnToc3 => '3) Multicast / Unicast + IGMP';

  @override
  String get aboutSacnToc4 => '4) Prioritäten (mehrere Quellen)';

  @override
  String get aboutSacnToc5 => '5) Grenzen/Leistung';

  @override
  String get aboutSacnToc6 =>
      '6) RDM & sACN (Proxy / abhängig von der Hardware)';

  @override
  String get aboutSacnToc7 => '7) Schemata';

  @override
  String get aboutSacnToc8 => '8) Checkliste';

  @override
  String get aboutSacnSection1Pill1 => 'UDP';

  @override
  String get aboutSacnSection1Pill2 => 'Multicast';

  @override
  String get aboutSacnSection1Pill3 => 'Priorität';

  @override
  String get aboutSacnSection1Paragraph =>
      'sACN (E1.31) ist ein weit verbreiteter Standard für den Transport von DMX-Universen über IP. Dies wird häufig bevorzugt, wenn Sie eine saubere Netzwerkarchitektur wünschen: gut verwaltetes Multicast, standardisierte Prioritäten und ein „professionelleres Netzwerkverhalten“.';

  @override
  String get aboutSacnSection1Title => 'Wenn es großartig ist';

  @override
  String get aboutSacnSection1Bullet1 =>
      'Viele Universen in einem gut verwalteten Netzwerk.';

  @override
  String get aboutSacnSection1Bullet2 =>
      'Installationen / große Netzwerke mit mehreren Quellen (Prioritäten).';

  @override
  String get aboutSacnSection1Bullet3 =>
      'Wenn Sie „Überall senden“ vermeiden möchten.';

  @override
  String get aboutSacnSection2Pill1 => 'Universum 1..63999';

  @override
  String get aboutSacnSection2Pill2 => '512 Slots/Universum';

  @override
  String get aboutSacnSection2Paragraph =>
      'Ein sACN-Universum entspricht einem DMX-Universum: bis zu 512 Slots. Die Standardnummerierung von sACN ist 1..63999. In der Praxis kommt es vor allem auf die Zuordnung Konsole ↔ Knoten ↔ Port DMX an.';

  @override
  String get aboutSacnSection2Title => 'Klassischer Fehler';

  @override
  String get aboutSacnSection2Bullet1 =>
      'Sie ändern die Universumsnummer auf der Konsolenseite, nicht jedoch auf der Knotenseite (oder umgekehrt).';

  @override
  String get aboutSacnSection2Bullet2 =>
      'Sie patchen „Universum 0“, während die Hardware eine Basis 1 erwartet.';

  @override
  String get aboutSacnSection2Bullet3 =>
      'Sie verwechseln die Nummerierungskonventionen zwischen den Werkzeugen.';

  @override
  String get aboutSacnSection3Paragraph =>
      'sACN verwendet häufig Multicast: Jedes Universum „lebt“ in einer Multicast-Gruppe und die Knoten abonnieren die Universen, die sie benötigen.';

  @override
  String get aboutSacnSection3Title => 'IGMP-Snooping (warum es wichtig ist)';

  @override
  String get aboutSacnSection3Bullet1 =>
      'Ohne IGMP: Der Switch überschwemmt Multicast überall → mögliche Überlastung.';

  @override
  String get aboutSacnSection3Bullet2 =>
      'Bei IGMP: Der Switch sendet nur an Teilnehmerports → stabiles Netzwerk.';

  @override
  String get aboutSacnSection3Bullet3 =>
      'Bei großen Volumina: IGMP ist oft DER Unterschied zwischen „es funktioniert“ und „es ist die Hölle“.';

  @override
  String get aboutSacnSection3Subtitle => 'Schema: Multicast & IGMP';

  @override
  String get aboutSacnSection3Subtitle2 => 'Unicast (Option)';

  @override
  String get aboutSacnSection3SubBullet1 =>
      'Abhängig von Konsolen/Knoten möglich.';

  @override
  String get aboutSacnSection3SubBullet2 =>
      'Nützlich zur Fehlerbehebung oder wenn das Multicast-Netzwerk nicht kontrolliert wird.';

  @override
  String get aboutSacnSection3SubBullet3 =>
      'Weniger elegant, aber manchmal einfacher.';

  @override
  String get aboutSacnSection4Pill1 => 'Quelle A vor 100';

  @override
  String get aboutSacnSection4Pill2 => 'Quelle B vor 90';

  @override
  String get aboutSacnSection4Paragraph =>
      'sACN verwaltet ein Prioritätskonzept: Wenn mehrere Quellen dasselbe Universum senden, behält der Empfänger die Quelle mit der höchsten Priorität. Sehr nützlich mit einer Hauptkonsole + einer Backup-Konsole + einem Medienserver.';

  @override
  String get aboutSacnSection4Title => 'Fallstricke';

  @override
  String get aboutSacnSection4Bullet1 =>
      'Zwei unerwünschte Quellen im selben Universum → „es kämpft“.';

  @override
  String get aboutSacnSection4Bullet2 =>
      'Schlecht eingestellte Priorität → Backup, das übernimmt.';

  @override
  String get aboutSacnSection4Bullet3 =>
      'Debug: Schneiden Sie eine Quelle aus und prüfen Sie, wer gewinnt.';

  @override
  String get aboutSacnSection5Pill1 => 'IGMP';

  @override
  String get aboutSacnSection5Pill2 => 'Schalten';

  @override
  String get aboutSacnSection5Pill3 => 'WLAN Nr';

  @override
  String get aboutSacnSection5Pill4 => 'CPU-Knoten';

  @override
  String get aboutSacnSection5Title => 'Was zuerst kaputt geht';

  @override
  String get aboutSacnSection5Bullet1 => 'Multicast ohne IGMP → Flood.';

  @override
  String get aboutSacnSection5Bullet2 =>
      'Ungeeigneter Switch (Puffer/CPU) → Verluste.';

  @override
  String get aboutSacnSection5Bullet3 => 'WLAN → Jitter/Aussetzer.';

  @override
  String get aboutSacnSection5Bullet4 => 'Begrenzte Knoten (Ports, Firmware).';

  @override
  String get aboutSacnSection5Subtitle => 'Einfache Regeln';

  @override
  String get aboutSacnSection5SubBullet1 =>
      'Verwalteter Switch + IGMP-Snooping bei vielen Universen.';

  @override
  String get aboutSacnSection5SubBullet2 =>
      'Dediziertes Light-VLAN, wenn möglich.';

  @override
  String get aboutSacnSection5SubBullet3 =>
      'Unicast zur Isolierung bei der Fehlerbehebung.';

  @override
  String get aboutSacnSection6Paragraph =>
      'Wie bei Art-Net hängt „over IP“-RDM häufig von einem Proxy-Mechanismus in den Knoten ab. Der sACN-Standard impliziert nicht automatisch, dass Ihr Knoten RDM korrekt ausführt.';

  @override
  String get aboutSacnSection6Title => 'Zum Einchecken des Knotendokuments';

  @override
  String get aboutSacnSection6Bullet1 => 'RDM-Proxy/RDM-over-IP-Unterstützung.';

  @override
  String get aboutSacnSection6Bullet2 =>
      'Einschränkungen (nur Entdeckung, Teilbestellungen).';

  @override
  String get aboutSacnSection6Bullet3 =>
      'Kompatibilität mit Splittern/Opto-Seite DMX.';

  @override
  String get aboutSacnSection6Subtitle => 'Feldmethode';

  @override
  String get aboutSacnSection6SubBullet1 => 'Stabilisieren Sie DMX ohne RDM.';

  @override
  String get aboutSacnSection6SubBullet2 =>
      'Testen Sie RDM auf einer einfachen und klaren Linie.';

  @override
  String get aboutSacnSection6SubBullet3 =>
      'Wenn Sie Probleme haben: Deaktivieren Sie RDM und isolieren Sie dann den Knoten/Splitter.';

  @override
  String get aboutSacnSection7Subtitle1 => 'Multicast + IGMP (Idee)';

  @override
  String get aboutSacnSection7Subtitle2 => 'Prioritäten (2 Quellen)';

  @override
  String get aboutSacnChecklistTitle =>
      'Bevor „das Protokoll“ beschuldigt wird';

  @override
  String get aboutSacnChecklistBullet1 =>
      'IGMP-Snooping aktiviert, wenn Multicast.';

  @override
  String get aboutSacnChecklistBullet2 => 'Dediziertes VLAN, wenn möglich.';

  @override
  String get aboutSacnChecklistBullet3 => 'Unicast bei der Fehlerbehebung.';

  @override
  String get aboutSacnChecklistBullet4 =>
      'Konsistente Prioritäten bei mehreren Quellen.';

  @override
  String get aboutSacnChecklistBullet5 =>
      'WLAN wird in der Produktion vermieden.';

  @override
  String get sunTimesTitle => 'Sonnenaufgang/Sonnenuntergang';

  @override
  String get sunTimesSectionSettings => 'Einstellungen';

  @override
  String get sunTimesSectionResults => 'Ergebnisse';

  @override
  String get sunTimesSectionTimeline => 'Zeitleiste (30-Minuten-Schritte)';

  @override
  String get sunTimesSectionTwilight => 'Was sind Dämmerungen?';

  @override
  String get sunTimesSectionLux => 'Helligkeitsschwellen (Benchmarks)';

  @override
  String get sunTimesIntro =>
      'Wählen Sie eine Stadt und ein Datum. Die Zeiten sind Richtwerte (gerundet).';

  @override
  String get sunTimesLabelCity => 'Stadt';

  @override
  String get sunTimesLabelDate => 'Datum';

  @override
  String get sunTimesNoteApprox =>
      'Richtzeiten – können je nach Höhe, Lichtbrechung und Wetter variieren.';

  @override
  String get sunTimesNoData => '—';

  @override
  String get sunTimesResultSunrise => 'Sonnenaufgang';

  @override
  String get sunTimesResultSunset => 'Sonnenuntergang';

  @override
  String get sunTimesResultCivilDawn => 'Zivile Morgendämmerung';

  @override
  String get sunTimesResultCivilDusk => 'Bürgerliche Dämmerung';

  @override
  String get sunTimesResultNauticalDawn => 'Nautische Morgendämmerung';

  @override
  String get sunTimesResultNauticalDusk => 'Nautische Dämmerung';

  @override
  String get sunTimesResultAstronomicalDawn => 'Astronomische Morgendämmerung';

  @override
  String get sunTimesResultAstronomicalDusk => 'Astronomische Dämmerung';

  @override
  String get sunTimesTimelineStep30 => 'Schritte: 30 Min';

  @override
  String get sunTimesTimelineDay => 'Tag';

  @override
  String get sunTimesTimelineCivil => 'Bürgerlich';

  @override
  String get sunTimesTimelineNautical => 'Nautisch';

  @override
  String get sunTimesTimelineAstronomical => 'Astronomisch';

  @override
  String get sunTimesTimelineNight => 'Nacht';

  @override
  String get sunTimesTwilightIntro =>
      'Dämmerungen werden durch die Höhe der Sonne unter dem Horizont definiert. Diese Definitionen sind standardisiert.';

  @override
  String get sunTimesTwilightCivilTitle => 'Zivil (≈ 0° bis −6°)';

  @override
  String get sunTimesTwilightCivilBody =>
      'Ende/Anfang des Tages. Wir können die Landschaft noch deutlich erkennen.';

  @override
  String get sunTimesTwilightNauticalTitle => 'Nautisch (≈ −6° bis −12°)';

  @override
  String get sunTimesTwilightNauticalBody =>
      'Die Horizontlinie wird schwer zu erkennen. Der Himmel ist merklich dunkler.';

  @override
  String get sunTimesTwilightAstronomicalTitle =>
      'Astronomisch (≈ −12° bis −18°)';

  @override
  String get sunTimesTwilightAstronomicalBody =>
      'Der Himmel ist nahezu völlig dunkel (wenig Restlicht).';

  @override
  String get sunTimesLuxNight => 'Dunkle Nacht';

  @override
  String get sunTimesLuxAstro => 'Astro-Twilight';

  @override
  String get sunTimesLuxNautical => 'Abenddämmerung.';

  @override
  String get sunTimesLuxCivil => 'Bürgerliche Dämmerung';

  @override
  String get sunTimesLuxVeryLow => 'Sehr schwach';

  @override
  String get sunTimesLuxLow => 'Schwach';

  @override
  String get sunTimesLuxDay => 'Tag';

  @override
  String get sunTimesLuxFullDay => 'Ganzer Tag';

  @override
  String get sunTimesLuxNote =>
      'Bei diesen Werten handelt es sich um typische Richtwerte (Wetter, Jahreszeit, Umgebung → Schwankungen).';

  @override
  String get aboutVideoPageTitle => 'Video – Feldmarkierungen';

  @override
  String get aboutVideoSummaryCopy =>
      'VIDEO – Feldreferenzen\n• Auflösung = Größe (px). FPS = Fluidität / Latenz.\n• 4:2:2 / 4:4:4 + 10-Bit = Farbqualität.\n• SDI = robust + lange Distanz.\n• HDMI = zerbrechlich + kurz.\n• NDI = IP (Netzwerk), hängt vom LAN ab.\n• Genlock / Timecode = sync.';

  @override
  String get aboutVideoChecklistCopy =>
      'VIDEO – Checkliste\n☐ Gleiche Auflösung und FPS überall\n☐ HDMI: EDID / HDCP gemastert\n☐ SDI: 75Ω-Kabel + guter Standard\n☐ NDI/IP: eigenes LAN (Switch, Geschwindigkeit)\n☐ Genlock / Timecode, falls Synchronisierung erforderlich\n☐ Testquelle → Direktbildschirm';

  @override
  String get aboutVideoChecklistCopyTooltip => 'Kopie';

  @override
  String get aboutVideoFooterNote =>
      'Indikative Informationen (Gelände). Das Verhalten variiert je nach Hardware.\nZiel: schnell verstehen und Fehler richtig beheben.';

  @override
  String get aboutVideoToc1 => '1) Video-Grundlagen (Schlüsselwörter)';

  @override
  String get aboutVideoToc2 => '2) Auflösung und FPS';

  @override
  String get aboutVideoToc3 => '3) Farbe (4:4:4 / 4:2:2 / 10-Bit)';

  @override
  String get aboutVideoToc4 => '4) Synchronisierung (Genlock / Timecode)';

  @override
  String get aboutVideoToc5 => '5) Kabel und Entfernungen';

  @override
  String get aboutVideoToc6 => '6) SDI (3G/6G/12G)';

  @override
  String get aboutVideoToc7 => '7) HDMI – Feld';

  @override
  String get aboutVideoToc8 => '8) NDI – wann / warum / Grenzen';

  @override
  String get aboutVideoToc9 => '9) Mapping / LED / Multiprojekt';

  @override
  String get aboutVideoSection1Paragraph =>
      'Video ist ein Bild (Pixel), das mit einer Geschwindigkeit (FPS) mit einer Farbstruktur (Sampling/Bittiefe) gesendet, über eine Verbindung (SDI/HDMI/IP) transportiert und manchmal synchronisiert wird.';

  @override
  String get aboutVideoSection1Title => 'Nützlicher Wortschatz';

  @override
  String get aboutVideoSection1Bullet1 => 'Auflösung: Breite×Höhe (px).';

  @override
  String get aboutVideoSection1Bullet2 => 'FPS: Flüssigkeit / Latenz.';

  @override
  String get aboutVideoSection1Bullet3 => 'Progressiv (p) vs. interlaced (i).';

  @override
  String get aboutVideoSection1Bullet4 =>
      'Codec: Komprimierung (H.264, H.265…).';

  @override
  String get aboutVideoSection1Bullet5 => 'Latenz: Live-Überprüfung.';

  @override
  String get aboutVideoSection2Title => 'Auflösung';

  @override
  String get aboutVideoSection2Bullet1 => '1080p = 1920×1080.';

  @override
  String get aboutVideoSection2Bullet2 => '4K UHD = 3840×2160.';

  @override
  String get aboutVideoSection2Bullet3 => 'DCI 4K = 4096×2160 (Kino).';

  @override
  String get aboutVideoSection2Bullet4 => 'Mehr Pixel = mehr Durchsatz.';

  @override
  String get aboutVideoSection2Title2 => 'FPS';

  @override
  String get aboutVideoSection2Bullet5 => '25/50: Europäischer Standard.';

  @override
  String get aboutVideoSection2Bullet6 => '30/60: US-Standard / Geräte.';

  @override
  String get aboutVideoSection2Bullet7 =>
      'Vermeiden Sie es, 50 und 60 ohne Umrechnung zu mischen.';

  @override
  String get aboutVideoSection3Title => 'Probenahme';

  @override
  String get aboutVideoSection3Bullet1 => '4:4:4: Grafik / Keying.';

  @override
  String get aboutVideoSection3Bullet2 => '4:2:2: aktueller Profi.';

  @override
  String get aboutVideoSection3Bullet3 => '4:2:0: Dateien / Stream.';

  @override
  String get aboutVideoSection3Title2 => 'Bittiefe';

  @override
  String get aboutVideoSection3Bullet4 => '8-Bit: Standard.';

  @override
  String get aboutVideoSection3Bullet5 =>
      '10-Bit: bessere Farbverläufe (HDR / LED).';

  @override
  String get aboutVideoSection4Title => 'Genlock';

  @override
  String get aboutVideoSection4Bullet1 =>
      'Synchronisiert die Bildaktualisierung.';

  @override
  String get aboutVideoSection4Bullet2 =>
      'Nützlich bei Multicam/LED/Broadcast.';

  @override
  String get aboutVideoSection4Title2 => 'Timecode';

  @override
  String get aboutVideoSection4Bullet3 => 'Zeitsynchronisation.';

  @override
  String get aboutVideoSection4Bullet4 => 'Ersetzt nicht Genlock.';

  @override
  String get aboutVideoSection5Title => 'Einfache Regeln';

  @override
  String get aboutVideoSection5Bullet1 => 'HDMI: fragil, kurz.';

  @override
  String get aboutVideoSection5Bullet2 => 'SDI: robust, lang.';

  @override
  String get aboutVideoSection5Bullet3 => 'Faser: sehr lang + EMI-frei.';

  @override
  String get aboutVideoSection6Title => 'Sehenswürdigkeiten';

  @override
  String get aboutVideoSection6Bullet1 => '3G: 1080p60';

  @override
  String get aboutVideoSection6Bullet2 => '6G: 2160p30';

  @override
  String get aboutVideoSection6Bullet3 => '12G: 2160p60';

  @override
  String get aboutVideoSection7Title => 'Zu sehen';

  @override
  String get aboutVideoSection7Bullet1 => 'EDID';

  @override
  String get aboutVideoSection7Bullet2 => 'HDCP';

  @override
  String get aboutVideoSection7Bullet3 => 'Längen';

  @override
  String get aboutVideoSection8Title => 'Video-IP';

  @override
  String get aboutVideoSection8Bullet1 => 'Flexibel.';

  @override
  String get aboutVideoSection8Bullet2 => 'Netzwerklast.';

  @override
  String get aboutVideoSection8Bullet3 => 'Eigenes LAN erforderlich.';

  @override
  String get aboutVideoSection9Title => 'Boden';

  @override
  String get aboutVideoSection9Bullet1 => 'Gleiche Auflösung/FPS.';

  @override
  String get aboutVideoSection9Bullet2 => 'Richtige Zuordnung.';

  @override
  String get aboutVideoSection9Bullet3 => 'Test mit Sehenswürdigkeiten.';

  @override
  String get aboutVideoChecklistTitle => 'Bevor Sie in Panik geraten';

  @override
  String get aboutVideoChecklistBullet1 => 'Überprüfen Sie die Auflösung/FPS.';

  @override
  String get aboutVideoChecklistBullet2 => 'Testquelle → Bildschirm.';

  @override
  String get aboutVideoChecklistBullet3 => 'Vereinfachen Sie die Kette.';

  @override
  String get homeBpmSubtitle => 'Tap-Tempo, BPM ↔ ms-Umwandlung, Hz, Messung.';

  @override
  String get bpmTitle => 'BPM';

  @override
  String get bpmTapTitle => 'Tippen Sie auf Tempo';

  @override
  String get bpmTapButton => 'Typ';

  @override
  String get bpmResetTap => 'Wasserhähne zurücksetzen';

  @override
  String get bpmDetectedLabel => 'BPM erkannt';

  @override
  String get bpmTapHint =>
      'Tippen Sie mehrmals (idealerweise 4 bis 8 Mal), um einen stabilen Durchschnitt zu erhalten.';

  @override
  String get bpmManualTitle => 'Manueller BPM';

  @override
  String get bpmManualLabel => 'BPM';

  @override
  String get bpmManualHint => 'Ex. 128';

  @override
  String get commonAdd => 'Hinzufügen';

  @override
  String get commonEdit => 'Zu ändern';

  @override
  String get commonDelete => 'LÖSCHEN';

  @override
  String get commonCopied => 'In die Zwischenablage kopiert.';

  @override
  String get patchCreateGdtfTitle => 'Erstellen Sie ein GDTF (einfach)';

  @override
  String get patchCreateGdtfSubtitle =>
      'Manuelle Erstellung eines Gerätes in Tabellenform.';

  @override
  String get gdtfSimpleTitle => 'Ersteller GDTF (einfach)';

  @override
  String get gdtfDeviceSectionTitle => 'Gerät';

  @override
  String get gdtfChannelsSectionTitle => 'Kanäle';

  @override
  String get gdtfImportJsonTitle => 'JSON importieren';

  @override
  String get gdtfExportJsonTitle => 'JSON exportieren';

  @override
  String get gdtfImportJsonHint => 'Fügen Sie den JSON hier ein';

  @override
  String get gdtfManufacturerLabel => 'Hersteller';

  @override
  String get gdtfModelLabel => 'Modell';

  @override
  String get gdtfModeNameLabel => 'Modusname';

  @override
  String get gdtfChannelsCountLabel => 'Kanäle';

  @override
  String get gdtfFootprintLabel => 'Fußabdruck';

  @override
  String get gdtfColIndex => '#';

  @override
  String get gdtfColName => 'Name';

  @override
  String get gdtfColDmx => 'DMX';

  @override
  String get gdtfColType => 'Art';

  @override
  String get gdtfColRes => '8/16';

  @override
  String get gdtfColDefault => 'Standard';

  @override
  String get gdtfColActions => 'Aktionen';

  @override
  String get gdtfMoveUp => 'Nach oben gehen';

  @override
  String get gdtfMoveDown => 'Runterkommen';

  @override
  String get gdtfChannelAddTitle => 'Fügen Sie einen Kanal hinzu';

  @override
  String get gdtfChannelEditTitle => 'Kanal bearbeiten';

  @override
  String get gdtfFieldName => 'Name';

  @override
  String get gdtfFieldDmx => 'Adresse DMX';

  @override
  String get gdtfFieldType => 'Art';

  @override
  String get gdtfFieldResolution => 'Auflösung';

  @override
  String get gdtfRes8 => '8-Bit';

  @override
  String get gdtfRes16 => '16-Bit';

  @override
  String get gdtfFieldDefault8 => 'Standardwert (0–255)';

  @override
  String get gdtfFieldDefault16 => 'Standardwert (0–65535)';

  @override
  String get gdtfDefaultChannelName => 'Kanal';

  @override
  String get gdtfMvpHint =>
      'MVP: JSON-Export (Zwischenablage). Als nächstes folgt der eigentliche GDTF-Export (XML+ZIP).';

  @override
  String get gdtfTypeDimmer => 'Dimmer';

  @override
  String get gdtfTypePan => 'Knall';

  @override
  String get gdtfTypeTilt => 'Neigung';

  @override
  String get gdtfTypeColor => 'Farbe';

  @override
  String get gdtfTypeGobo => 'Gobo';

  @override
  String get gdtfTypeShutter => 'Verschluss';

  @override
  String get gdtfTypePrism => 'Prisma';

  @override
  String get gdtfTypeZoom => 'Zoom';

  @override
  String get gdtfTypeFocus => 'Fokus';

  @override
  String get gdtfTypeIris => 'Iris';

  @override
  String get gdtfTypeEffect => 'Wirkung';

  @override
  String get gdtfTypeCustom => 'Brauch';

  @override
  String get gdtfEasyTitle => 'Erstellen Sie ein GDTF (einfach)';

  @override
  String get gdtfTemplatesTitle => 'Vorauswahlen';

  @override
  String get gdtfCreateDefaultPreset =>
      'Erstellen Sie die Standardvoreinstellung';

  @override
  String get gdtfTemplatesHint =>
      'Erstellt eine Schnellbasis (Dimmer, Verschluss, Schwenken, Neigen, RGB usw.) und vervollständigt dann die DMX-Adressen und die Standardeinstellungen.';

  @override
  String get gdtfExportButton => 'Exportieren GDTF';

  @override
  String get gdtfExportHint =>
      'Minimaler .gdtf-Export (description.xml) und dann teilen (Mail, WhatsApp, AirDrop, Drive…).';

  @override
  String get gdtfExportNeedDmx =>
      'Fügen Sie mindestens eine DMX-Adresse zum Exportieren hinzu.';

  @override
  String get gdtfExportDone => 'GDTF exportiert.';

  @override
  String get gdtfExportError => 'GDTF konnte nicht exportiert werden.';

  @override
  String get gdtfShareSubject => 'Datei GDTF';

  @override
  String get gdtfShareText => 'Hier ist die exportierte GDTF-Datei.';

  @override
  String get gdtfFieldRole => 'Einstellung';

  @override
  String get gdtfDmxHint => 'Leer oder 1–512';

  @override
  String get gdtfFieldDefault => 'Standard';

  @override
  String get gdtfDefaultHint8 => '0–255';

  @override
  String get gdtfDefaultHint16 => '0–65535';

  @override
  String get gdtfChannelDefaultName => 'Kanal';

  @override
  String get gdtfRoleEmpty => 'Leer / Unbekannt';

  @override
  String get gdtfRoleDimmer => 'Dimmer';

  @override
  String get gdtfRoleShutter => 'Verschluss';

  @override
  String get gdtfRolePan => 'Knall';

  @override
  String get gdtfRoleTilt => 'Neigung';

  @override
  String get gdtfRoleRed => 'Rot (R)';

  @override
  String get gdtfRoleGreen => 'Grün (G)';

  @override
  String get gdtfRoleBlue => 'Blau (B)';

  @override
  String get gdtfRoleColor => 'Farbe';

  @override
  String get gdtfRoleGobo => 'Gobo';

  @override
  String get gdtfRoleZoom => 'Zoom';

  @override
  String get gdtfRoleFocus => 'Fokus';

  @override
  String get gdtfRolePrism => 'Prisma';

  @override
  String get gdtfRoleEffect => 'Wirkung';

  @override
  String get gdtfRoleControl => 'Kontrolle';

  @override
  String get gdtfRoleCustom => 'Brauch';

  @override
  String get gdtfResUnknown => 'Leer';

  @override
  String get gdtfPresetDimmer => 'Dimmer';

  @override
  String get gdtfPresetShutter => 'Verschluss';

  @override
  String get gdtfPresetPan => 'Knall';

  @override
  String get gdtfPresetTilt => 'Neigung';

  @override
  String get gdtfPresetRed => 'R';

  @override
  String get gdtfPresetGreen => 'G';

  @override
  String get gdtfPresetBlue => 'B';

  @override
  String get gdtfPresetColor1 => 'Farbe 1';

  @override
  String get gdtfPresetGobo1 => 'Gobo 1';

  @override
  String get gdtfPresetZoom => 'Zoom';

  @override
  String get gdtfPresetFocus => 'Fokus';

  @override
  String get gdtfPresetPrism => 'Prisma';

  @override
  String get gdtfPresetEffect => 'Wirkung';

  @override
  String get gdtfPresetControl => 'Kontrolle';

  @override
  String get commonApply => 'Anwenden';

  @override
  String get gdtfPresetLabel => 'Auswahl';

  @override
  String get gdtfPresetFixtureSimple => 'Einfache Befestigung';

  @override
  String get gdtfPresetBarreLed => 'LED-Leiste';

  @override
  String get gdtfTemplatesHintShort =>
      'Wählen Sie eine Voreinstellung und wenden Sie sie an. Anschließend können Sie DMX, Standardeinstellungen anpassen und per Drag-and-Drop neu anordnen.';

  @override
  String get gdtfExportNeedChannels =>
      'Fügt mindestens einen Kanal zum Exportieren hinzu.';

  @override
  String get homeDrawerContact => 'Kontaktieren Sie den Entwickler';

  @override
  String get homeDrawerSuggestItem => 'Senden Sie einen Artikel an den Katalog';

  @override
  String get homeErrorOpenEmail =>
      'E-Mail-Anwendung kann nicht geöffnet werden.';

  @override
  String get homeErrorOpenForm => 'Das Formular kann nicht geöffnet werden.';

  @override
  String get homeContactEmailSubject => 'Frage zu My Tech App';

  @override
  String get bpmManualHelp =>
      'Wenn ein manueller BPM eingegeben wird, hat dieser Vorrang vor dem Tap-Tempo.';

  @override
  String get bpmConversionsTitle => 'Konvertierungen';

  @override
  String get bpmActiveLabel => 'Aktiver BPM';

  @override
  String get bpmMsPerBeat => 'Länge eines Schlags';

  @override
  String get bpmHz => 'Frequenz';

  @override
  String get bpmSecPerBar44 => 'Dauer einer Maßnahme (4/4)';

  @override
  String get bpmDisclaimer =>
      'Ungefähre Angabe. Überprüfen Sie das Metronom, wenn es kritisch ist.';

  @override
  String get laserToolsTitle => 'Werkzeuge';

  @override
  String get laserBeamSizeTitle => 'Strahlgröße';

  @override
  String get laserBeamSizeSubtitle =>
      'Durchmesser, Radius und Fläche des Flecks in einer bestimmten Entfernung.';

  @override
  String get laserBeamInputsTitle => 'Einstellungen';

  @override
  String get laserBeamDistanceLabel => 'Distanz';

  @override
  String get laserBeamDistanceHint => 'm (Bsp. 12)';

  @override
  String get laserBeamFormulaHint =>
      'Berechnung: D(z) = D0 + θ · z (θ in rad, Vollwinkel).';

  @override
  String get laserBeamResultsTitle => 'Ergebnisse';

  @override
  String get laserBeamDiameterAtDistance => 'Durchmesser im Abstand';

  @override
  String get laserBeamRadiusAtDistance => 'Radius zu Abstand';

  @override
  String get laserBeamAreaAtDistance => 'Spot-Oberfläche';

  @override
  String get sunTimesPageTitle => 'Sonnenaufgang/Sonnenuntergang';

  @override
  String get sunTimesSelectionTitle => 'Einstellungen';

  @override
  String get sunTimesCityLabel => 'Stadt';

  @override
  String get sunTimesDateLabel => 'Datum';

  @override
  String get sunTimesResultsTitle => 'Ergebnisse';

  @override
  String get sunTimesSunriseLabel => 'Sonnenaufgang';

  @override
  String get sunTimesSunsetLabel => 'Sonnenuntergang';

  @override
  String get sunTimesDayLengthLabel => 'Länge des Tages';

  @override
  String get sunTimesDisclaimer =>
      'Richtwerte (astronomisches Modell). Erkundigen Sie sich bei Bedarf bei einer offiziellen Quelle (Veranstaltung, Sicherheit, Filmaufnahmen).';

  @override
  String get sunTimesThresholdTitle => 'Helligkeitsschwellen (Benchmarks)';

  @override
  String get sunTimesThresholdIntro =>
      'Größenordnungen, die zur Vorhersage des Umgebungslichts nützlich sind (sehr unterschiedlich je nach Wetter, Breitengrad, Jahreszeit, Hindernissen, Lichtverschmutzung).';

  @override
  String get sunTimesLuxDaylight => 'Volles Tageslicht (ohne direkte Sonne)';

  @override
  String get sunTimesLuxOvercast => 'Bewölkt (typisch)';

  @override
  String get sunTimesLuxSunrise => 'Sonnenaufgang/Untergang (klar)';

  @override
  String get sunTimesLuxCivilTwilight => 'Zivile Dämmerungsgrenze (klar)';

  @override
  String get sunTimesLuxFullMoon => 'Vollmond (hell)';

  @override
  String get sunTimesThresholdNote =>
      'Tipp: Bei der Kennzeichnung „ohne Beleuchtung nutzbar“ streben wir oft > 100–300 lx an. Für feine Arbeiten eher 500 lx und mehr.';

  @override
  String get sunTimesParamsTitle => 'Einstellungen';

  @override
  String get sunTimesPickDate => 'Wählen Sie ein Datum';

  @override
  String get sunTimesSunrise => 'Aufzug';

  @override
  String get sunTimesSunset => 'Zum Schlafen';

  @override
  String get sunTimesDayLength => 'Länge des Tages';

  @override
  String get sunTimesPolarNote =>
      'Hinweis: In polnahen Gebieten kann der Sonnenaufgang/-untergang je nach Jahreszeit ausbleiben.';

  @override
  String get sunTimesLuxThresholdTitle => 'Helligkeitsschwellen (Benchmarks)';

  @override
  String get sunTimesLuxBulletNightDark => 'Dunkle Nacht: < 1 Lux';

  @override
  String get sunTimesLuxBulletNightMoon => 'Nacht (Mond): ~0,1–1 Lux';

  @override
  String get sunTimesLuxBulletFullMoon => 'Vollmond: ~0,1–0,3 Lux';

  @override
  String get sunTimesLuxBulletCivilTwilight =>
      'Bürgerliche Dämmerung: Sonne bei -6°';

  @override
  String get sunTimesLuxBulletUrbanLow => 'Geringe Stadtbeleuchtung: ~5–20 Lux';

  @override
  String get sunTimesLuxBulletOfficeLow => 'Niedriges Büro: ~100–300 Lux';

  @override
  String get sunTimesLuxBulletOfficeStd => 'Standardbüro: ~300–500 Lux';

  @override
  String get sunTimesLuxBulletOutdoorDay =>
      'Tagsüber im Freien: ~10.000–25.000 Lux';

  @override
  String get sunTimesLuxBulletDirectSun => 'Direktes Sonnenlicht: ~100.000 Lux';

  @override
  String get sunTimesLuxDisclaimer =>
      'Richtwerte: Wetter/Wolken, Umgebung, Jahreszeit und Relief können stark variieren.';

  @override
  String get sunTimesTwilightTitle => 'Dämmerung: Was bedeutet das?';

  @override
  String get sunTimesTwilightCivil =>
      'Zivil (-6°): Licht reicht immer noch aus, um die Umgebung ohne künstliche Beleuchtung zu unterscheiden.';

  @override
  String get sunTimesTwilightNautical =>
      'Nautisch (-12°): Der Horizont ist schwer zu erkennen; sichtbare Sterne.';

  @override
  String get sunTimesTwilightAstronomical =>
      'Astronomisch (-18°): Der Himmel gilt als „schwarz“ (ohne Lichtverschmutzung).';

  @override
  String get sunTimesTwilightAnglesNote =>
      'Winkel ausgedrückt in Grad unter dem Horizont (negative Sonne).';

  @override
  String get sunTimesLuxBulletAstronomicalTwilight =>
      'Astronomische Dämmerung: Sonne bei -18°';

  @override
  String get sunTimesTimelineTitleStep30 => 'Zeitleiste (nicht 30 Min.)';

  @override
  String get sunTimesTimelineColTime => 'Stunde';

  @override
  String get sunTimesTimelineColElevation => 'Elevation';

  @override
  String get sunTimesTimelineColMarker => 'Wahrzeichen';

  @override
  String get sunTimesTimelineColLux => 'Lux (Bestellung)';

  @override
  String get sunTimesTimelineFootnote =>
      'Richtwerte (Wetter/Wolken, Umgebung, Jahreszeit) – nützlich für die Vorbereitung einer Show.';

  @override
  String get aboutUniverseToArtnetColSubnet => 'Subnetz';

  @override
  String appVersionLabel(Object version, Object build) {
    return 'Version $version ($build)';
  }

  @override
  String appVersionLabelNoBuild(Object version) {
    return 'Version $version';
  }

  @override
  String get aboutUniverseToArtnetColUniverse => 'Universum';

  @override
  String get videoLedResultWallResolution => 'Wandauflösung';

  @override
  String get videoLedResultWallSize => 'Wandgröße';

  @override
  String get videoLedResultTile => 'Platte';

  @override
  String get videoLedResultPitch => 'Tonhöhe';

  @override
  String get lightFilterLedTabConvert => 'Konvertierung';

  @override
  String get lightFilterLedTabProfiles => 'Meine Ausstattung';

  @override
  String get lightFilterLedSourceLabel => 'Lichtquelle';

  @override
  String get lightFilterLedEngineRgbww => 'RGBWW (warmes + kaltes Weiß)';

  @override
  String get lightFilterLedEngineRgbaw => 'RGBAW';

  @override
  String get lightFilterLedEngineRgbauv => 'RGBAUV';

  @override
  String get lightFilterLedEngineRgbwauv => 'RGBWAUV';

  @override
  String get lightFilterLedEngineRgbrcl => 'RGBRCL (Rot, Cyan, Limette)';

  @override
  String get lightFilterLedEngineCmy => 'CMY';

  @override
  String get lightFilterLedSaveProfileTitle => 'Geräteprofil speichern';

  @override
  String get lightFilterLedProfileNameLabel => 'Gerätename';

  @override
  String get patchMvrViewTable => 'Kalkulationstabelle';

  @override
  String get patchMvrViewVisual => 'Visuell';

  @override
  String get consoleTitle => 'Konsole';

  @override
  String get consoleSubtitle => 'Patch DMX und Tools GDTF';

  @override
  String get consolePatchTitle => 'Patch DMX';

  @override
  String get consolePatchSubtitle =>
      'Importieren Sie einen MVR und analysieren Sie den Patch';

  @override
  String get consoleGdtfTitle => 'GDTF';

  @override
  String get consoleGdtfSubtitle =>
      'Erstellen oder analysieren Sie eine GDTF-Datei';

  @override
  String get consoleMa3ForgeTitle => 'MA3 Plugin Forge';

  @override
  String get consoleMa3ForgeSubtitle =>
      'Generieren Sie Lua-Plugins für grandMA3 mit KI';

  @override
  String lightFilterLedProfileSaved(String name) {
    return 'Profil „$name“ gespeichert';
  }

  @override
  String get lightFilterLedNoProfiles => 'Kein Geräteprofil gespeichert';

  @override
  String get lightFilterLedNoProfilesHint =>
      'Kalibrieren Sie die Kanäle auf der Registerkarte „Konvertierung“.\nAnschließend mit dem 💾-Symbol speichern.';

  @override
  String get lightFilterLedTitle => 'Passende LED-Filter';

  @override
  String get lightFilterLedDescription =>
      'Konvertierung von LEE-, Rosco…-Filtern in LED-Engines (RGB, RGBA, RGBW usw.).';

  @override
  String get lightFilterLedBrandLabel => 'Marke';

  @override
  String get lightFilterLedSearchLabel => 'Forschung';

  @override
  String get lightFilterLedSearchHint => 'Filtercode oder Name';

  @override
  String get lightFilterLedFilterLabel => 'Gefiltert';

  @override
  String get lightFilterLedEngineLabel => 'LED-Motor';

  @override
  String get lightFilterLedShowPercentLabel => 'Als Prozentsatz anzeigen';

  @override
  String get lightFilterLedShowPercentHint =>
      'Andernfalls werden Werte als DMX 0–255 angezeigt.';

  @override
  String get lightFilterLedHexLabel => 'Referenzfarbe';

  @override
  String get lightFilterLedChromaticityLabel => 'Chromatizität';

  @override
  String get lightFilterLedTransmissionLabel => 'Übertragung';

  @override
  String get lightFilterLedResultTitle => 'Ergebnis';

  @override
  String get lightFilterLedOriginalPreviewLabel => 'Filtervorschau';

  @override
  String get lightFilterLedApproximatePreviewLabel => 'Grobe LED-Übersicht';

  @override
  String get lightFilterLedDisclaimer =>
      'Nur indikatives Ergebnis. Die tatsächliche Wiedergabe hängt vom Projektor, seinem Spektrum, seiner Kalibrierung, seinem Farbmodus und dem Nutzungskontext ab.';

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
  String get aboutSearchHint => 'Suchen Sie in Referenzen';

  @override
  String get aboutSearchNoResults => 'Keine Ergebnisse gefunden.';

  @override
  String get homePinnedTitle => 'Stifte';

  @override
  String get homePinnedSubtitle =>
      'Finden Sie schnell Ihre angehefteten Referenzen.';

  @override
  String get pinnedReferencesTitle => 'Angepinnte Referenzen';

  @override
  String get pinnedReferencesEmpty =>
      'Im Moment sind keine Referenzen angepinnt.';

  @override
  String get aboutPinAddTooltip => 'Pinne diese Referenz';

  @override
  String get aboutPinRemoveTooltip => 'Entfernen Sie diesen Stift';

  @override
  String get aboutPinAddedMessage => 'Angepinnte Referenz.';

  @override
  String get aboutPinRemovedMessage => 'Pin entfernt.';

  @override
  String get homeDrawerSubscriptions => 'Abonnements';

  @override
  String get subscriptionPageTitle => 'Abonnements';

  @override
  String get subscriptionHeadlineAllTitle => 'Wählen Sie Ihre Formel';

  @override
  String get subscriptionHeadlineAllSubtitle =>
      'Hier finden Sie Ihre aktuellen Käufe und noch verfügbaren Abonnements.';

  @override
  String subscriptionHeadlineUnlock(Object module) {
    return '$module freischalten';
  }

  @override
  String get subscriptionHeadlineVideoSubtitle =>
      'Sie können nur Video kaufen oder Pro wählen, um alles freizuschalten.';

  @override
  String get subscriptionHeadlineLightSubtitle =>
      'Sie können nur Light kaufen oder sich für Pro entscheiden, um alles freizuschalten.';

  @override
  String get subscriptionHeadlineLaserSubtitle =>
      'Sie können nur Laser kaufen oder sich für Pro entscheiden, um alles freizuschalten.';

  @override
  String get subscriptionHeadlineConsoleSubtitle =>
      'Sie können nur die Konsole kaufen oder sich für Pro entscheiden, um alles freizuschalten.';

  @override
  String get subscriptionHeadlineProSubtitle =>
      'Voller Zugriff auf alle erweiterten Abschnitte.';

  @override
  String get subscriptionStoreUnavailable => 'Shop derzeit nicht verfügbar.';

  @override
  String get subscriptionLoadError =>
      'Abonnements können nicht geladen werden.';

  @override
  String get subscriptionRestorePurchases => 'Meine Einkäufe wiederherstellen';

  @override
  String get subscriptionPrivacy => 'Vertraulichkeit';

  @override
  String get subscriptionTerms => 'CGU';

  @override
  String get subscriptionBestValue => 'Das beste Preis-Leistungs-Verhältnis';

  @override
  String get subscriptionOwned => 'Gekauft';

  @override
  String get subscriptionIncludedInPro => 'In Pro enthalten';

  @override
  String get subscriptionProductUnavailable => 'Produkt nicht verfügbar.';

  @override
  String get subscriptionSubscribeAll => 'Abonnieren – Alle freischalten';

  @override
  String subscriptionSubscribeModule(Object module) {
    return 'Abonnieren – $module';
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
      'Zugriff auf den Videobereich.';

  @override
  String get subscriptionCategoryLightDescription => 'Zugang zum Lichtbereich.';

  @override
  String get subscriptionCategoryLaserDescription => 'Zugang zum Laserbereich.';

  @override
  String get subscriptionCategoryConsoleDescription =>
      'Zugriff auf den Konsolenbereich.';

  @override
  String get subscriptionCategoryProDescription =>
      'Voller Zugriff auf alle Abschnitte.';

  @override
  String get electricityFreeSection => 'Frei';

  @override
  String get electricityProSection => 'Stromabonnement';

  @override
  String get riggingFreeSection => 'Frei';

  @override
  String get riggingProSection => 'Abonnement Rigging';

  @override
  String get videoFreeSection => 'Gratuit';

  @override
  String get videoProSection => 'Abonnement Vidéo';

  @override
  String get lumiereFreeSection => 'Gratuit';

  @override
  String get lumiereProSection => 'Abonnement Lumière';

  @override
  String get consoleFreeSection => 'Gratuit';

  @override
  String get consoleProSection => 'Abonnement Console';

  @override
  String get lumiereFilterEquivDescription =>
      'Équivalences Lee ↔ Roscolux ↔ e-colour+';

  @override
  String get audioSplModeDistance => 'Distance → SPL';

  @override
  String get audioSplModePower => 'Puissance → SPL';

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
  String get electricityToolLoadBalancerTitle => 'Lastverteilung';

  @override
  String get electricityToolLoadBalancerSubtitle =>
      'Fügen Sie Leuchten aus dem Katalog hinzu, weisen Sie sie nach Phase zu und überprüfen Sie die Stromstärke Ihres Panels.';

  @override
  String get electricityToolGeneratorTitle => 'Stromaggregat';

  @override
  String get electricityPowerFactorToolTitle => 'Leistungsfaktor (kVA ↔ kW)';

  @override
  String get electricityToolPowerFactorSubtitle =>
      'Wandelt Scheinleistung (kVA) und Wirkleistung (kW) über cos φ in beide Richtungen um, inklusive Blindleistung (kVAR).';

  @override
  String get electricityPowerFactorModeTitle => 'Berechnungsrichtung';

  @override
  String get electricityPowerFactorModeKvaToKw => 'kVA → kW';

  @override
  String get electricityPowerFactorModeKwToKva => 'kW → kVA';

  @override
  String get electricityPowerFactorInputsTitle => 'Bekannte Werte';

  @override
  String get electricityPowerFactorApparentLabel => 'Scheinleistung';

  @override
  String get electricityPowerFactorApparentHint => 'Z. B.: 10';

  @override
  String get electricityPowerFactorActiveLabel => 'Wirkleistung';

  @override
  String get electricityPowerFactorActiveHint => 'Z. B.: 8';

  @override
  String get electricityPowerFactorCosPhiLabel => 'Leistungsfaktor (cos φ)';

  @override
  String get electricityPowerFactorCosPhiHint => '0.1 – 1.0, z. B.: 0.8';

  @override
  String get electricityPowerFactorResultsTitle => 'Ergebnisse';

  @override
  String get electricityPowerFactorReactiveLabel => 'Blindleistung';

  @override
  String get electricityPowerFactorAngleLabel => 'Phasenwinkel';

  @override
  String get electricityPowerFactorEnterValues =>
      'Werte eingeben, um das Ergebnis zu sehen.';

  @override
  String get electricityPowerFactorFormulaNote =>
      'kW = kVA × cos φ · kVA = kW / cos φ · kVAR = √(kVA² − kW²). cos φ = 1 bedeutet eine rein ohmsche Last (keine Blindleistung).';

  @override
  String get electricityToolGeneratorSubtitle =>
      'Dimensionierung: Wirkleistung → kVA, Gleichzeitigkeitsfaktor, Sicherheitsmarge, empfohlene Standardgröße.';

  @override
  String get electricityGeneratorInputsTitle => 'Zu versorgende Last';

  @override
  String get electricityGeneratorActivePowerLabel =>
      'Installierte Wirkleistung';

  @override
  String get electricityGeneratorActivePowerHint =>
      'Summe der Wirkleistungen (siehe Lastverteiler)';

  @override
  String get electricityGeneratorCosPhiLabel => 'Mittlerer Leistungsfaktor';

  @override
  String get electricityGeneratorCosPhiHint =>
      '0,85–0,95 typisch (Dimmer, LED, Verstärker)';

  @override
  String get electricityGeneratorDiversityLabel => 'Gleichzeitigkeitsfaktor';

  @override
  String get electricityGeneratorDiversityHint =>
      '% der installierten Leistung, die tatsächlich gleichzeitig genutzt wird';

  @override
  String get electricityGeneratorMarginLabel => 'Sicherheitsmarge';

  @override
  String get electricityGeneratorMarginHint =>
      'Empfohlener Spielraum für Anlaufströme und Spitzen';

  @override
  String get electricityGeneratorFuelRateLabel => 'Spezifischer Verbrauch';

  @override
  String get electricityGeneratorFuelRateHint =>
      '≈0,25 L/kWh typisch für ein gut ausgelastetes Dieselaggregat';

  @override
  String get electricityGeneratorResultsTitle => 'Empfohlenes Aggregat';

  @override
  String get electricityGeneratorRecommendedLabel => 'Empfohlene Standardgröße';

  @override
  String get electricityGeneratorRecommendedOverMax =>
      '> 800 kVA — individuelle Auslegung, Vermieter konsultieren';

  @override
  String get electricityGeneratorApparentNeededLabel =>
      'Benötigte Scheinleistung';

  @override
  String get electricityGeneratorCurrentLabel => 'Geschätzter Ausgangsstrom';

  @override
  String get electricityGeneratorFuelPerHourLabel => 'Geschätzter Verbrauch';

  @override
  String get electricityGeneratorFuelPerShowLabel => 'Über 8 Std. Show';

  @override
  String get electricityGeneratorEnterValues =>
      'Wirkleistung eingeben, um zu berechnen';

  @override
  String get electricityGeneratorDisclaimer =>
      'Indikative Schätzung — immer mit den Empfehlungen des Aggregat-Vermieters/Herstellers abgleichen (Höhe, Temperatur, nichtlineare Lasten).';

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
  String get riggingToolMultiPointTitle => 'Mehrpunkt-Anschlag';

  @override
  String get riggingToolMultiPointSubtitle =>
      'Strangzug für einen symmetrischen 2-8-Punkt-Anschlag, mit WLL-Prüfung.';

  @override
  String get riggingLegCountLabel => 'Anzahl der Stränge';

  @override
  String get riggingWllPerLegLabel => 'WLL pro Strang';

  @override
  String get riggingMultiPointSymmetricNote =>
      'Gilt für einen symmetrischen Anschlag: gleich lange Stränge, zentrierte Last, gleichmäßig verteilte Zugkraft. Bei asymmetrischen oder komplexen Aufbauten einen qualifizierten Rigger oder zertifizierte Software hinzuziehen.';

  @override
  String get riggingToolHoistTitle => 'Kettenzug-Auswahl';

  @override
  String get riggingToolHoistSubtitle =>
      'Zu hebende Last → empfohlene Standardgröße des Kettenzugs, mit Sicherheitsmarge.';

  @override
  String get riggingHoistRecommendedLabel => 'Empfohlener Kettenzug';

  @override
  String get riggingHoistOverMaxLabel =>
      '> 10.000 kg — außerhalb des Standardbereichs, Hebespezialisten konsultieren';

  @override
  String get riggingHoistAvailabilityNote =>
      'Indikative Standardgrößen (0,125 bis 10 t) — die tatsächliche Verfügbarkeit hängt vom Hersteller und Vermieter ab.';

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

  @override
  String get homeConversionsTitle => 'Konvertierungen';

  @override
  String get homeConversionsSubtitle =>
      'Einheiten, Entfernung, Video, Audio, DMX und Feldumrechnungen.';

  @override
  String get conversionsTitle => 'Konvertierungen';

  @override
  String get conversionsDistanceTitle => 'Distanz';

  @override
  String get conversionsTemperatureTitle => 'Temperatur';

  @override
  String get conversionsAnglesTitle => 'Winkel';

  @override
  String get conversionsVideoTitle => 'Video';

  @override
  String get conversionsAudioTitle => 'Audio';

  @override
  String get conversionsDmxTitle => 'DMX';

  @override
  String get conversionsSwap => 'Umkehren';

  @override
  String get conversionsDisclaimer =>
      'Nur als Hinweis. Überprüfen Sie kritische Werte immer anhand der Dokumentation des Herstellers.';

  @override
  String get conversionMetersFeet => 'Meter <> Fuß';

  @override
  String get conversionCentimetersInches => 'Zentimeter <> Zoll';

  @override
  String get conversionMetersYards => 'Meter <> Yards';

  @override
  String get conversionCelsiusFahrenheit => 'Celsius <> Fahrenheit';

  @override
  String get conversionDegreesRadians => 'Grad <> Bogenmaß';

  @override
  String get conversionSlopePercentDegrees => 'Steigung % <> Grad';

  @override
  String get conversionNitsFootLambert => 'Nissen <> Fuß-Lambert';

  @override
  String get conversionFpsFrameTime => 'FPS <> Bilddauer';

  @override
  String get conversionBpmMs => 'BPM <> Millisekunden';

  @override
  String get conversionDelayDistance => 'Verzögerung <> Distanz';

  @override
  String get conversionDmxPercent => 'DMX <> %';

  @override
  String get conversionEightBitSixteenBit => '8 Bit <> 16 Bit';

  @override
  String get subscriptionDurationYear => '1-Jahres-Abonnement';

  @override
  String get conversionAudioLevel => 'dBu/dBV/V';

  @override
  String get conversionDmxAbsolute => 'Universum <> DMX absolut';

  @override
  String get conversionDmxToAbsoluteHint => 'Univers + adresse → absolu';

  @override
  String get conversionDmxFromAbsoluteHint => 'Absolu → univers + adresse';

  @override
  String get conversionDmxUniverseLabel => 'Univers';

  @override
  String get conversionDmxAddressLabel => 'Adresse';

  @override
  String get conversionDmxAbsoluteLabel => 'DMX Absolu';

  @override
  String get gdtfTitle => 'GDTF';

  @override
  String get gdtfSearchTab => 'Forschung';

  @override
  String get gdtfGenerateFromPdfTab => 'Aus PDF generieren';

  @override
  String get gdtfSearchHint => 'Ex: Martin MAC Aura, Chauvet Rogue…';

  @override
  String get gdtfFixtureNameLabel => 'Gerätename';

  @override
  String get gdtfSearchInfo =>
      'Suchen Sie in der GDTF Share-Datenbank (über 6000 Geräte).\nWenn nicht gefunden, verwenden Sie die Registerkarte „Generieren aus PDF“.';

  @override
  String get gdtfNoFixtureFound => 'Keine Vorrichtungen gefunden';

  @override
  String get gdtfNoFixtureFoundHelp =>
      'Sie können aus dem PDF im Handbuch einen GDTF generieren.';

  @override
  String get gdtfGenerateFromPdfTitle =>
      'Generieren Sie einen GDTF aus einem PDF';

  @override
  String get gdtfGenerateFromPdfIntro =>
      'Laden Sie das technische Handbuch für Ihr Gerät hoch. Die KI extrahiert die DMX-Modi – Sie überprüfen und korrigieren, bevor Sie die Datei generieren.\n\n⚠️ Schlüssel zum Erfolg: Geben Sie den genauen Namen der Maschine ein, wie er im Handbuch steht. Und wenn Sie Modi manuell hinzufügen, verwenden Sie die genauen Modusnamen DMX – sonst findet die KI nicht die richtigen Daten.';

  @override
  String get gdtfManufacturerHint => 'ex: Martin, Chauvet, Robe…';

  @override
  String get gdtfModelHint => 'Bsp.: MAC Aura XIP, Rogue R2X…';

  @override
  String get gdtfSelectManualPdf => 'Wählen Sie PDF aus dem Handbuch aus';

  @override
  String get gdtfDetectingModes => 'Moduserkennung…';

  @override
  String get gdtfAnalyzePdf => 'Analysieren Sie die PDF';

  @override
  String get gdtfAnalyzePdfHelp =>
      'Die KI erkennt die im Handbuch verfügbaren DMX-Modi. Anschließend wählen Sie aus, welche extrahiert werden sollen, bevor Sie die Datei generieren.';

  @override
  String get gdtfBackToForm => 'Zurück zur Form';

  @override
  String gdtfDetectedModesInManual(int count) {
    return '$count Modus(s) DMX im Handbuch erkannt';
  }

  @override
  String get gdtfSearchModeHint => 'Nach einem Modus suchen…';

  @override
  String get gdtfSelectAll => 'Alle';

  @override
  String get gdtfSelectNone => 'Keiner';

  @override
  String gdtfSelectedModesCount(int selected, int total) {
    return '$selected ausgewählt am $total';
  }

  @override
  String get gdtfNoModeMatchesSearch => 'Kein Modus entspricht der Suche.';

  @override
  String gdtfDmxChannelCount(int count) {
    return '$count Kanäle DMX';
  }

  @override
  String get gdtfExtractionInProgressLong =>
      'Die Extraktion läuft. Dies kann laut Handbuch bis zu 10 Minuten dauern. Schließen Sie die App nicht.';

  @override
  String get gdtfExtractionMayTakeLong =>
      'Das Extrahieren kann je nach Umfang des Handbuchs und Anzahl der ausgewählten Modi bis zu 10 Minuten dauern.';

  @override
  String get gdtfExtractingChannels => 'Extraktion von Kanälen…';

  @override
  String gdtfExtractModes(int count) {
    return '$count Modus(e) extrahieren';
  }

  @override
  String get gdtfBackToModeSelection => 'Zurück zur Modusauswahl';

  @override
  String gdtfDetectedModesCount(int count) {
    return '$count Modus(s) erkannt';
  }

  @override
  String gdtfUnextractedModesCount(int count) {
    return '$count Modus(s) nicht extrahiert';
  }

  @override
  String get gdtfGenerating => 'Generation…';

  @override
  String get gdtfGenerateGdtfFile => 'Generieren Sie die .gdtf-Datei';

  @override
  String get gdtfModeNameHint => 'Modusname';

  @override
  String gdtfChannelCount(int count) {
    return '$count Kanäle';
  }

  @override
  String get gdtfChannelShort => 'Kap';

  @override
  String get gdtfBits => 'Bits';

  @override
  String get gdtfName => 'Name';

  @override
  String get gdtfDefaultValueLabel => 'Standardwert (0-255):';

  @override
  String get gdtfValueRangesLabel => 'Wertebereiche / Unterfunktionen:';

  @override
  String get gdtfValueRangesHint =>
      'Beispiel: 0-9=geschlossen, 10-100=langsames Blinken, 255=offen';

  @override
  String get gdtfAddChannel => 'Fügen Sie einen Kanal hinzu';

  @override
  String get gdtfFileGenerated => 'Datei generiert!';

  @override
  String get gdtfShareGdtfFile => 'Geben Sie die .gdtf-Datei frei';

  @override
  String get gdtfGenerateAnotherFile => 'Erzeugen Sie eine weitere Datei';

  @override
  String get gdtfGmailIosTitle => 'Gmail auf iOS? Lesen Sie dies 👀';

  @override
  String get gdtfGmailIosWarning =>
      'Gmail unter iOS blockiert häufig .gdtf-Anhänge („Datei konnte nicht angehängt werden“). Tipp: Benennen Sie die Datei vor dem Senden in .zip um – der Empfänger benennt sie nach dem Empfang in .gdtf um. WhatsApp, Messenger und AirDrop funktionieren problemlos.';

  @override
  String get gdtfDownload => 'Herunterladen';

  @override
  String gdtfModeFootprint(String name, int count) {
    return '$name (${count}ch)';
  }

  @override
  String gdtfDownloadingFixture(String fixture) {
    return '$fixture wird heruntergeladen…';
  }

  @override
  String gdtfErrorStatus(int statusCode) {
    return 'Fehler $statusCode';
  }

  @override
  String gdtfErrorStatusParentheses(int statusCode) {
    return 'Fehler ($statusCode)';
  }

  @override
  String gdtfNetworkError(String error) {
    return 'Netzwerkfehler: $error';
  }

  @override
  String gdtfErrorDetails(String error) {
    return 'Fehler: $error';
  }

  @override
  String get gdtfErrorFillManufacturerAndModel =>
      'Geben Sie Hersteller und Modell ein.';

  @override
  String get gdtfErrorSelectPdf => 'Wählt eine PDF-Datei aus.';

  @override
  String get gdtfErrorCannotExtractDmxPages =>
      'Die Seiten DMX können nicht aus PDF extrahiert werden.';

  @override
  String get gdtfUnknownError => 'Unbekannter Fehler';

  @override
  String get gdtfUnknownErrorLowercase => 'unbekannter Fehler';

  @override
  String get gdtfNoDmxModeDetected =>
      'Im Handbuch wurden keine DMX-Modi erkannt.';

  @override
  String get gdtfErrorSelectAtLeastOneMode =>
      'Wählt mindestens einen Modus zum Extrahieren aus.';

  @override
  String get gdtfErrorManualDataLost =>
      'Manuelle Daten verloren, Analyse neu starten.';

  @override
  String get mireVideoPageTitle => 'Ziele für Videobildschirme';

  @override
  String get mireVideoWidthPxLabel => 'Breite (px)';

  @override
  String get mireVideoHeightPxLabel => 'Höhe (px)';

  @override
  String get mireVideoProjectorCountLabel => 'Anzahl Projektoren (N)';

  @override
  String get mireVideoOverlapPercentLabel => 'Überlappung (%)';

  @override
  String get mireVideoHint1920 => 'Beispiel: 1920';

  @override
  String get mireVideoHint1080 => 'zB: 1080';

  @override
  String get mireVideoHint3840 => 'Beispiel: 3840';

  @override
  String get mireVideoHint2160 => 'Beispiel: 2160';

  @override
  String get mireVideoHint2 => 'Beispiel: 2';

  @override
  String get mireVideoHint10Percent => 'zB: 10.0';

  @override
  String get mireVideoTestPatternTypeLabel => 'Art der Sicht';

  @override
  String get mireVideoSimpleTypeComboAll =>
      'Kombination (Gitter + Kreise + 2 zentrierte Balken)';

  @override
  String get mireVideoSimpleTypeGridSafe => 'Gitter + Safe + Kreise';

  @override
  String get mireVideoSimpleTypeColorBars => 'Stangen + Rampen + Kreise';

  @override
  String get mireVideoSimpleTypeUniformity => 'Einheitlichkeit + Kreise';

  @override
  String get mireVideoSimpleTypeCheckerboard => 'Schachbrett + Kreise';

  @override
  String get mireVideoExportPngButton => 'Exportieren PNG';

  @override
  String get mireVideoOrientationLabel => 'Orientierung';

  @override
  String get mireVideoOrientationHorizontal => 'Horizontal';

  @override
  String get mireVideoOrientationVertical => 'Vertikal';

  @override
  String get mireVideoMappingTypeLabel => 'Typzuordnung';

  @override
  String get mireVideoMappingTypeCombo =>
      'Kombination (Zonen + Überlappung + Mischung)';

  @override
  String get mireVideoMappingTypeZonesAndOverlap => 'Zonen + Überlappung';

  @override
  String get mireVideoMappingTypeBlendRamps => 'Mischrampen';

  @override
  String get mireVideoErrorInvalidWidthHeight =>
      '❌ Ungültige Breite/Höhe (px).';

  @override
  String get mireVideoErrorInvalidProjectorCount =>
      '❌ Ungültige Anzahl von Projektoren (N > 0).';

  @override
  String get mireVideoErrorInvalidOverlap =>
      '❌ Ungültige Überlappung (0 bis 99,9).';

  @override
  String get cinemaTitle => 'Kino / Film';

  @override
  String get cinemaIntroTitle => 'Kino- und Filmwerkzeuge';

  @override
  String get cinemaIntroBody =>
      'Nützliche Berechnungen für Optik, Bildausschnitt, Belichtung, Speicherung, Timecode und Kinoprojektion.';

  @override
  String get cinemaFieldOfViewTitle => 'Feldwinkel';

  @override
  String get cinemaFieldOfViewSubtitle =>
      'Horizontale, vertikale und diagonale Berechnung je nach Sensor und Brennweite.';

  @override
  String get cinemaFieldOfViewDescription =>
      'Berechnet den Blickwinkel entsprechend dem Sensorformat und der Brennweite.';

  @override
  String get cinemaFieldOfViewInfo =>
      'Formel: Winkel = 2 × atan (Sensorgröße ÷ (2 × Brennweite)).';

  @override
  String get cinemaSubjectDistanceTitle =>
      'Entfernung zwischen Kamera und Motiv';

  @override
  String get cinemaSubjectDistanceSubtitle =>
      'Schätzen Sie den Abstand, der zum Einrahmen eines Motivs erforderlich ist.';

  @override
  String get cinemaSubjectDistanceDescription =>
      'Schätzt den Kameraabstand, der erforderlich ist, um ein Motiv in der Höhe einzufangen.';

  @override
  String get cinemaSubjectDistanceInfo =>
      'Ideale geometrische Näherung. Der tatsächliche Abstand kann je nach Atemoptik, Sensormodus und Zuschnitt variieren.';

  @override
  String get cinemaDepthOfFieldTitle => 'Schärfentiefe';

  @override
  String get cinemaDepthOfFieldSubtitle =>
      'Scharfe Zone, Nahgrenze, Ferngrenze und Hyperfokal.';

  @override
  String get cinemaDepthOfFieldDescription =>
      'Berechnet den theoretischen Schärfebereich anhand von Brennweite, Blende, Entfernung und Zerstreuungskreis.';

  @override
  String get cinemaDepthOfFieldInfo =>
      'Theoretisches Ergebnis. Die Wahrnehmung der Schärfe hängt auch von der Auflösung, der Displaygröße und dem Betrachtungsabstand ab.';

  @override
  String get cinemaLensEquivalenceTitle => 'Brennweitenäquivalenz';

  @override
  String get cinemaLensEquivalenceSubtitle =>
      'Brennweitenkonvertierung zwischen Sensorformaten.';

  @override
  String get cinemaLensEquivalenceDescription =>
      'Konvertiert eine Brennweite von einem Sensorformat in ein anderes und behält dabei einen ähnlichen diagonalen Blickwinkel bei.';

  @override
  String get cinemaLensEquivalenceInfo =>
      'Diagonalbasierte Konvertierung. Bei streng horizontaler oder vertikaler Rahmung kann der Faktor geringfügig abweichen.';

  @override
  String get cinemaAnamorphicTitle => 'Anamorph';

  @override
  String get cinemaAnamorphicSubtitle =>
      'Auspressen, endgültiges Verhältnis und äquivalente horizontale Brennweite.';

  @override
  String get cinemaAnamorphicDescription =>
      'Berechnet das endgültige Verhältnis nach dem Entstauchen und die horizontale Äquivalenz der Brennweite.';

  @override
  String get cinemaAnamorphicInfo =>
      'Eine anamorphotische Linse erweitert das horizontale Bildfeld nach dem Dequeezing, behält aber das vertikale Verhalten der Brennweite bei.';

  @override
  String get cinemaShutterTitle => 'Verschlusswinkel / Verschlusszeit';

  @override
  String get cinemaShutterSubtitle =>
      'Umrechnung zwischen Verschlusswinkel, FPS und Geschwindigkeit.';

  @override
  String get cinemaShutterDescription =>
      'Wandelt einen Kino-Verschlusswinkel in eine Verschlusszeit um.';

  @override
  String get cinemaShutterInfo =>
      'Bei 180° beträgt die Geschwindigkeit etwa 1 ÷ (2 × fps). Beispiel: 25 fps → 1/50 s.';

  @override
  String get cinemaFlickerTitle => 'Flimmerfrei';

  @override
  String get cinemaFlickerSubtitle =>
      'Sichere Verschlusszeiten nach 50 Hz oder 60 Hz.';

  @override
  String get cinemaFlickerDescription =>
      'Liste allgemein sicherer Verschlusszeiten basierend auf der Wechselstromfrequenz.';

  @override
  String get cinemaFlickerInfo =>
      'LEDs, Bildschirme und gedimmte Quellen können je nach Elektronik, PWM oder Bildwiederholfrequenz dennoch flackern.';

  @override
  String get cinemaNdExposureTitle => 'ND / Ausstellung';

  @override
  String get cinemaNdExposureSubtitle =>
      'Blendenstufen, ND-Dichte, ND-Faktor und Belichtungskorrektur.';

  @override
  String get cinemaNdExposureDescription =>
      'Konvertiert eine Korrektur in Blendenstufen in ND-Dichte und Lichtreduktionsfaktor.';

  @override
  String get cinemaNdExposureInfo =>
      'Markierungen: ND 0,3 = 1 Stopp, ND 0,6 = 2 Stopps, ND 0,9 = 3 Stopps, ND 1,2 = 4 Stopps.';

  @override
  String get cinemaRecordingStorageTitle => 'Aufnahmezeit';

  @override
  String get cinemaRecordingStorageSubtitle =>
      'Verfügbare Dauer abhängig von Kapazität und Bitrate.';

  @override
  String get cinemaRecordingStorageDescription =>
      'Schätzt die verfügbare Zeit basierend auf der Karten-/Festplattenkapazität und der Videobitrate.';

  @override
  String get cinemaRecordingStorageInfo =>
      'Vereinfachte Dezimalrechnung: 1 GB = 8000 MB. Lassen Sie Platz für Audio, Metadaten, Dateisystem und Medienpool.';

  @override
  String get cinemaTimecodeTitle => 'Timecode';

  @override
  String get cinemaTimecodeSubtitle =>
      'Timecode-Konvertierung ↔ Frames und Dauer zwischen zwei TCs.';

  @override
  String get cinemaTimecodeDescription =>
      'Konvertiert zwei Timecodes in Frames und berechnet die Dauer zwischen den beiden.';

  @override
  String get cinemaTimecodeInfo =>
      'Diese erste Version verwendet vollständigen Non-Drop-Frame-Timecode. Der Drop-Frame 29,97 kann dann separat hinzugefügt werden.';

  @override
  String get cinemaSlowMotionTitle => 'Zeitlupe/Framerate';

  @override
  String get cinemaSlowMotionSubtitle => 'Zeitlupenfaktor und Wiedergabezeit.';

  @override
  String get cinemaSlowMotionDescription =>
      'Berechnet den Zeitlupenfaktor und die endgültige Wiedergabezeit.';

  @override
  String get cinemaSlowMotionInfo =>
      'Beispiel: Aufnahme mit 100 Bildern pro Sekunde, Lesen mit 25 Bildern pro Sekunde = Zeitlupe ×4.';

  @override
  String get cinemaProjectionTitle => 'Kinovorführung';

  @override
  String get cinemaProjectionSubtitle =>
      'Bildschirm, Verhältnis, Projektion, Leuchtdichte, Nits und ft-L.';

  @override
  String get cinemaProjectionDescription =>
      'Berechnet Leinwandabmessungen, Projektorabstand und ungefähre Leuchtdichte.';

  @override
  String get cinemaProjectionInfo =>
      'Ungefähre Leuchtdichte: Nits ≈ Lumen × Verstärkung ÷ (π × Fläche). Optische Verluste, Zoom, Lampen-/Laseralterung und Kalibrierung sind nicht enthalten.';

  @override
  String get cinemaGlobalDisclaimer =>
      'Diese Werkzeuge liefern indikative technische Werte. Die Ergebnisse können je nach Kamera, Optik, Codec, Bildprofil, Projektor, Leinwand oder tatsächlichen Aufnahmebedingungen variieren.';

  @override
  String get cinemaSensorLabel => 'Sensor';

  @override
  String get cinemaFocalLengthLabel => 'Brennweite';

  @override
  String get cinemaHorizontalAngleResult => 'Horizontaler Winkel';

  @override
  String get cinemaVerticalAngleResult => 'Vertikaler Winkel';

  @override
  String get cinemaDiagonalAngleResult => 'Diagonaler Winkel';

  @override
  String get cinemaSensorDiagonalResult => 'Diagonalsensor';

  @override
  String get cinemaSubjectHeightLabel => 'Motivhöhe';

  @override
  String get cinemaFrameFillLabel => 'Belegung des Höhenrahmens';

  @override
  String get cinemaEstimatedDistanceResult => 'Geschätzte Entfernung';

  @override
  String get cinemaFrameHeightResult => 'Rahmenhöhe in diesem Abstand';

  @override
  String get cinemaApertureLabel => 'Öffnung';

  @override
  String get cinemaSubjectDistanceInputLabel => 'Motiventfernung';

  @override
  String get cinemaCocLabel => 'Kreis der Verwirrung';

  @override
  String get cinemaCocHelper => 'Beispiel Vollbild: 0,03 mm';

  @override
  String get cinemaHyperfocalResult => 'Hyperfokal';

  @override
  String get cinemaNearLimitResult => 'Nahe der Grenze';

  @override
  String get cinemaFarLimitResult => 'Weite Grenze';

  @override
  String get cinemaTotalDepthResult => 'Gesamttiefe';

  @override
  String get cinemaSourceSensorLabel => 'Quellsensor';

  @override
  String get cinemaTargetSensorLabel => 'Zielsensor';

  @override
  String get cinemaSourceFocalLengthLabel => 'Brennweite der Quelle';

  @override
  String get cinemaEquivalentFocalResult => 'Äquivalente Brennweite';

  @override
  String get cinemaAppliedFactorResult => 'Angewandter Faktor';

  @override
  String get cinemaSensorRecordingRatioLabel => 'Sensor-/Aufnahmeverhältnis';

  @override
  String get cinemaSensorRecordingRatioHelper =>
      '16:9 = 1,78, 4:3 = 1,33, 3:2 = 1,50';

  @override
  String get cinemaAnamorphicFactorLabel => 'Anamorpher Faktor';

  @override
  String get cinemaAnamorphicFactorHelper => '1,33, 1,5, 1,8, 2,0';

  @override
  String get cinemaOpticalFocalLengthLabel => 'Optische Brennweite';

  @override
  String get cinemaFinalRatioResult => 'Endgültiges Verhältnis';

  @override
  String get cinemaHorizontalEquivalentFocalResult =>
      'Äquivalente horizontale Brennweite';

  @override
  String get cinemaVerticalFocalResult => 'Vertikale Brennweite';

  @override
  String get cinemaFramerateLabel => 'Bildrate';

  @override
  String get cinemaShutterAngleLabel => 'Verschlusswinkel';

  @override
  String get cinemaExposureTimeResult => 'Expositionszeit';

  @override
  String get cinemaEquivalentShutterSpeedResult =>
      'Äquivalente Geschwindigkeit';

  @override
  String get cinemaMainsFrequencyLabel => 'Netzfrequenz';

  @override
  String get cinemaMains50Hz => '50 Hz – Europa';

  @override
  String get cinemaMains60Hz => '60 Hz – USA / andere';

  @override
  String get cinemaRecommendedSpeedsResult => 'Empfohlene Geschwindigkeiten';

  @override
  String get cinemaMainsBaseResult => 'Branchenbasis';

  @override
  String get cinemaReductionLabel => 'Gewünschte Reduzierung';

  @override
  String get cinemaNdDensityResult => 'Dichte ND';

  @override
  String get cinemaNdFactorResult => 'ND-Faktor';

  @override
  String get cinemaApproxTransmissionResult => 'Übertragung ca.';

  @override
  String get cinemaMediaCapacityLabel => 'Medienkapazität';

  @override
  String get cinemaBitrateLabel => 'Bitrate';

  @override
  String get cinemaBitrateHelper => 'Warnung: Mbit/s, nicht MB/s';

  @override
  String get cinemaAvailableDurationResult => 'Dauer verfügbar';

  @override
  String get cinemaStorageConsumptionResult => 'Verbrauch';

  @override
  String get cinemaIntegerFramerateLabel => 'Ganzzahlige Framerate';

  @override
  String get cinemaIntegerFramerateHelper => '24, 25, 30, 50, 60…';

  @override
  String get cinemaTcInLabel => 'TC IN';

  @override
  String get cinemaTcOutLabel => 'TC OUT';

  @override
  String get cinemaTimecodeFormatHelper => 'Formatieren Sie HH:MM:SS:FF';

  @override
  String get cinemaTcInFramesResult => 'Rahmen TC IN';

  @override
  String get cinemaTcOutFramesResult => 'Frames TC OUT';

  @override
  String get cinemaDurationFramesResult => 'Dauer in Frames';

  @override
  String get cinemaDurationTcResult => 'TC-Dauer';

  @override
  String get cinemaDurationResult => 'Dauer';

  @override
  String get cinemaCaptureFramerateLabel => 'Framerate-Filmen';

  @override
  String get cinemaPlaybackFramerateLabel => 'Framerate-Wiedergabe';

  @override
  String get cinemaRealDurationLabel => 'Tatsächliche gefilmte Dauer';

  @override
  String get cinemaSlowMotionFactorResult => 'Leerlauffaktor';

  @override
  String get cinemaPlaybackDurationResult => 'Lesezeit';

  @override
  String get cinemaScreenWidthLabel => 'Bildschirmbreite';

  @override
  String get cinemaImageRatioLabel => 'Bildverhältnis';

  @override
  String get cinemaImageRatioHelper => '1,85, 2,39, 1,78…';

  @override
  String get cinemaThrowRatioLabel => 'Wurfverhältnis';

  @override
  String get cinemaProjectorLumensLabel => 'Projektorfluss';

  @override
  String get cinemaScreenGainLabel => 'Leinwandgewinn';

  @override
  String get cinemaScreenHeightResult => 'Bildschirmhöhe';

  @override
  String get cinemaScreenAreaResult => 'Bildschirmoberfläche';

  @override
  String get cinemaProjectorDistanceResult => 'Projektorabstand';

  @override
  String get cinemaApproxLuminanceResult => 'Leuchtdichte ca.';

  @override
  String get gdtfScannedPdfOcrEnabled =>
      'PDF gescannt erkannt: OCR-Modus aktiviert. Der Scan kann weitere 1-2 Minuten dauern.';

  @override
  String get gdtfAddModeDialogTitle => 'Fügen Sie einen Modus hinzu';

  @override
  String get gdtfModeNameExampleHint =>
      'Beispiel: Standard, Einfach, Pixel Engine …';

  @override
  String get gdtfDmxChannelCountLabel => 'Anzahl Kanäle DMX';

  @override
  String get gdtfDmxChannelCountHint => 'Beispiel: 24';

  @override
  String get gdtfCancel => 'Stornieren';

  @override
  String get gdtfAdd => 'Hinzufügen';

  @override
  String get gdtfErrorModeNameRequired => 'Name ist erforderlich';

  @override
  String get gdtfErrorInvalidChannelCount =>
      'Ungültige Anzahl von Kanälen (1-1000)';

  @override
  String get gdtfErrorModeAlreadyExists =>
      'Ein Modus mit diesem Namen existiert bereits';

  @override
  String get gdtfHowToUseThisPageTooltip => 'So nutzen Sie diese Seite';

  @override
  String get gdtfHowToGetGdtfTitle => 'So erhalten Sie einen GDTF';

  @override
  String get gdtfWorkflowIntro =>
      'Befolgen Sie für jedes Gerät diese 3 Schritte der Reihe nach.';

  @override
  String get gdtfWorkflowSearchTitle => 'Forschung';

  @override
  String get gdtfWorkflowSearchBody =>
      'Registerkarte „Suchen“. Geben Sie den Namen Ihres Geräts ein (z. B. „Spiider“, „MAC Viper“, „Q-10“). Die GDTF Share-Datenbank enthält über 6000 offizielle, von Herstellern validierte Vorrichtungen. Es ist kostenlos, sofort und 100 % zuverlässig. Verwenden Sie in 90 % der Fälle ZUERST.';

  @override
  String get gdtfWorkflowPdfTitle => 'Aus PDF generieren';

  @override
  String get gdtfWorkflowPdfBody =>
      'Wenn die Suche nichts ergibt, wechseln Sie zur Registerkarte „Generieren aus PDF“. Laden Sie das PDF-Handbuch/Datenblatt hoch – die KI extrahiert die DMX-Modi automatisch. ⚠️ Wichtig: Geben Sie den genauen Namen der Maschine ein (wie im Handbuch angegeben), und wenn Sie Modi manuell hinzufügen, verwenden Sie die genauen Modusnamen DMX – sonst findet die KI nicht die richtigen Daten. Funktioniert gut auf sauberen PDFs (Robe, Martin usw.) und weniger gut auf gescannten oder übersetzten chinesischen Handbüchern.';

  @override
  String get gdtfWorkflowManualTitle => 'Manuelle Ergänzung/Korrektur';

  @override
  String get gdtfWorkflowManualBody =>
      'Wenn die KI die Analyse abgeschlossen hat, gelangen Sie auf die Modusauswahlseite. Die Schaltfläche „Modus manuell hinzufügen“ ist IMMER oben in der Liste verfügbar. Verwenden Sie es, um: (a) einen Modus hinzuzufügen, den die KI vergessen hat, (b) eine Halluzination über den Papierkorb zu löschen, (c) eine falsche Kanalanzahl zu korrigieren (Papierkorb + erneut zur richtigen Nummer hinzufügen). Dies ist Ihre letzte Verteidigungslinie, bevor Sie GDTF generieren – überprüfen Sie es immer.';

  @override
  String get gdtfWorkflowTip =>
      'Tipp: Überprüfen Sie vor dem Extrahieren eines PDF immer die gdtf-Freigabe – dies erspart Ihnen die KI-Extraktion (länger und weniger zuverlässig), wenn bereits ein offizieller GDTF existiert. Und denken Sie daran: Maschinenname und Modusnamen müssen genau denen aus dem Handbuch entsprechen – die KI hängt davon ab!';

  @override
  String get gdtfUnderstood => 'Verstanden';

  @override
  String get gdtfWorkflowSearchShortBody =>
      'Geben Sie oben den Gerätenamen ein. GDTF Share-Datenbank (über 6000 offizielle Spiele). Es ist kostenlos, sofort und vom Hersteller validiert. Löst 90 % der Fälle.';

  @override
  String get gdtfWorkflowPdfShortBody =>
      'Nicht gefunden? Registerkarte „Aus PDF generieren“. Laden Sie das Handbuch hoch – die KI extrahiert die DMX-Modi. Funktioniert am besten auf sauberen PDFs.';

  @override
  String get gdtfWorkflowManualShortBody =>
      'Überprüfen Sie auf der Seite „Modi“ immer, was die KI ausgegeben hat. Sie können: einen vergessenen Modus hinzufügen, eine Halluzination löschen (Papierkorbsymbol) oder eine falsche Kanalanzahl korrigieren (löschen + erneut auf den richtigen Wert hinzufügen). Die KI ist schnell, aber nicht unfehlbar – Sie behalten die Kontrolle über die endgültige Liste.';

  @override
  String get gdtfAddModeManually => 'Fügen Sie manuell einen Modus hinzu';

  @override
  String get gdtfNoModeDetectedAutomatically =>
      'Kein Modus automatisch erkannt.';

  @override
  String get gdtfNoModeDetectedHelp =>
      'Der PDF ist wahrscheinlich gescannt oder weist ein komplexes Layout auf. Fügen Sie die Modi manuell mit der Schaltfläche oben hinzu, und die Extraktion der Kanäle erfolgt dann anhand des OCR-Textes bzw. der Extraktion aus dem Handbuch.';

  @override
  String get gdtfAddMode => 'Fügen Sie einen Modus hinzu';

  @override
  String get gdtfDeleteModeTooltip => 'Entfernen Sie diesen Modus';

  @override
  String get audioHomeTitle => 'Ihr';

  @override
  String get audioHomeSubtitle =>
      'Nieren-Sub, End-Fire, Delays, SPL und Tools für den Toningenieur.';

  @override
  String get homeRfTitle => 'RF und Wireless';

  @override
  String get homeRfSubtitle =>
      'WLAN 2,4/5 GHz, Koexistenz, UHF/VHF-Bänder, Antennenrechner.';

  @override
  String get homeCinemaTitle => 'Kino / Film';

  @override
  String get homeCinemaSubtitle =>
      'Optik, Bildausschnitt, Belichtung, Timecode, Speicherung und Kinoprojektion.';

  @override
  String get audioSectionPlacementDirectivity => 'Platzierung und Richtwirkung';

  @override
  String get audioSectionAcousticLevels => 'Akustik & Pegel';

  @override
  String get audioSectionAmpCabling => 'Verstärker und Verkabelung';

  @override
  String get audioSectionTimingAlignment => 'Timing und Ausrichtung';

  @override
  String get audioSubCardioidTitle => 'Sub-Niere';

  @override
  String get audioSubCardioidSubtitle =>
      'Verzögerungen für Nierenkonfiguration (2 Subwoofer) oder Endfeuer (N Subwoofer in Reihe). Hintere Aufhebung, vordere Verstärkung.';

  @override
  String get audioSplDistanceTitle => 'Schalldruck und Distanz';

  @override
  String get audioSplDistanceSubtitle =>
      'Inverses Quadratgesetz: SPL abhängig vom Abstand. Berechnung aus Leistung + Lautsprecherempfindlichkeit.';

  @override
  String get audioSplSumTitle => 'Hinzufügung von SPL-Quellen';

  @override
  String get audioSplSumSubtitle =>
      'N inkohärente Quellen: +10·log(N) dB. Oder Hinzufügung von 2 verschiedenen Quellen.';

  @override
  String get audioElectroacousticTitle => 'Elektroakustik';

  @override
  String get audioElectroacousticSubtitle =>
      'Schalldruck aus Lautsprecherempfindlichkeit + Leistung. Entfernungstabelle. Kohärente/inkonsistente Kopplung.';

  @override
  String get audioWavelengthTitle => 'Frequenz und Wellenlänge';

  @override
  String get audioWavelengthSubtitle =>
      'Umrechnung Hz ↔ λ (m), λ/4, λ/2. Audiospektrumtabelle nach Bands.';

  @override
  String get audioAmpLoadTitle => 'Verstärker/Lautsprecher laden';

  @override
  String get audioCrossoverTitle => 'Trennfrequenz / Crossover';

  @override
  String get audioRt60Title => 'Nachhallzeit (RT60)';

  @override
  String get audioRt60LengthLabel => 'Länge';

  @override
  String get audioRt60WidthLabel => 'Breite';

  @override
  String get audioRt60HeightLabel => 'Höhe';

  @override
  String get audioRt60AbsorptionLabel =>
      'Durchschnittlicher Absorptionsgrad (α)';

  @override
  String get audioRt60PresetHard => 'Sehr hallig (Beton, Glas)';

  @override
  String get audioRt60PresetMedium => 'Durchschnittlicher Raum (Büro, Holz)';

  @override
  String get audioRt60PresetTreated =>
      'Akustisch behandelter Raum (Vorhänge, Teppich)';

  @override
  String get audioRt60PresetAbsorbent =>
      'Sehr absorbierend (behandeltes Studio)';

  @override
  String get audioRt60ResultTitle => 'Geschätzte RT60';

  @override
  String get audioRt60VolumeLabel => 'Raumvolumen';

  @override
  String get audioRt60SurfaceLabel => 'Gesamtfläche';

  @override
  String get audioRt60QualLive => 'Sehr hallig';

  @override
  String get audioRt60QualComfortable => 'Angenehm für Sprache';

  @override
  String get audioRt60QualDry => 'Trocken / kontrolliert';

  @override
  String get audioRt60FormulaNote =>
      'RT60 = 0,161 × V / (α × S) — Sabine-Formel, Schätzung mit gleichmäßiger durchschnittlicher Absorption';

  @override
  String get audioSplMeterTitle => 'Schallpegelmesser';

  @override
  String get audioDelayTimeTitle => 'Delay-Zeit (BPM)';

  @override
  String get audioDelayTimeBpmLabel => 'BPM';

  @override
  String get audioDelayTimeResultsTitle => 'Zeiten je Unterteilung';

  @override
  String get audioDelayTimeEmptyState =>
      'Gib ein BPM ein, um die Delay-Zeiten zu berechnen.';

  @override
  String get audioDelayTimeNormalLabel => 'Normal';

  @override
  String get audioDelayTimeDottedLabel => 'Punktiert';

  @override
  String get audioDelayTimeTripletLabel => 'Triole';

  @override
  String get audioDelayTimeFormulaNote =>
      'Zeit (ms) = 60000 / BPM × Viertelnoten-Anteil. Punktiert ×1,5 · Triole ×2/3.';

  @override
  String get audioSplMeterPermissionTitle => 'Mikrofonzugriff erforderlich';

  @override
  String get audioSplMeterPermissionBody =>
      'Der Schallpegelmesser nutzt das Mikrofon des Telefons, um den Umgebungsschallpegel in Echtzeit zu schätzen.';

  @override
  String get audioSplMeterAllowMic => 'Mikrofon erlauben';

  @override
  String get audioSplMeterOpenSettings => 'Einstellungen öffnen';

  @override
  String get audioSplMeterLiveTitle => 'Live-Pegel';

  @override
  String get audioSplMeterStartHint => 'Zum Starten tippen';

  @override
  String get audioSplMeterStopHint => 'Zum Stoppen tippen';

  @override
  String get audioSplMeterStatsTitle => 'Sitzungsstatistik';

  @override
  String get audioSplMeterStatsEmpty =>
      'Starte eine Messung, um die Min/Ø/Max-Statistik zu sehen.';

  @override
  String get audioSplMeterMinLabel => 'Minimum';

  @override
  String get audioSplMeterAvgLabel => 'Durchschnitt';

  @override
  String get audioSplMeterMaxLabel => 'Maximum';

  @override
  String get audioSplMeterReferenceTitle => 'Referenzwerte Schallpegel';

  @override
  String get audioSplMeterRefQuiet => 'Ruhiger Raum';

  @override
  String get audioSplMeterRefConversation => 'Normales Gespräch';

  @override
  String get audioSplMeterRefTraffic => 'Straßenverkehr';

  @override
  String get audioSplMeterRefConcert => 'Konzert / beschallter Raum';

  @override
  String get audioSplMeterRefPain => 'Schmerzgrenze';

  @override
  String get audioSplMeterDisclaimer =>
      'Indikative Messung über das Telefonmikrofon (nicht kalibriert) — ersetzt kein zertifiziertes Schallpegelmessgerät nach IEC 61672.';

  @override
  String get audioCrossoverFreqLabel => 'Trennfrequenz';

  @override
  String get audioCrossoverImpedanceLabel => 'Lautsprecherimpedanz';

  @override
  String get audioCrossoverCapacitorLabel => 'Kondensator (Hochpass)';

  @override
  String get audioCrossoverInductorLabel => 'Spule (Tiefpass)';

  @override
  String get audioCrossoverOrderNote => 'Filter 1. Ordnung (6 dB/Oktave)';

  @override
  String get audioCrossoverReferenceTitle => 'Typische Trennfrequenzen';

  @override
  String get audioCrossoverRefSubTop => 'Sub / Top';

  @override
  String get audioCrossoverRef2Way => '2-Wege (LF/HF)';

  @override
  String get audioCrossoverRef3WayLow => '3-Wege — LF/MF';

  @override
  String get audioCrossoverRef3WayHigh => '3-Wege — MF/HF';

  @override
  String get audioCrossoverFormulaNote => 'C = 1 / (2π·f·Z)    L = Z / (2π·f)';

  @override
  String get audioAmpLoadSubtitle =>
      'Wie viele Lautsprecher pro Verstärkerkanal? Resultierende Impedanz, Leistung pro Lautsprecher.';

  @override
  String get audioImpedanceTitle => 'Impedanz Serie / Parallel';

  @override
  String get audioImpedanceModeLabel => 'Verkabelungsmodus';

  @override
  String get audioImpedanceModeSeries => 'Serie';

  @override
  String get audioImpedanceModeParallel => 'Parallel';

  @override
  String get audioImpedanceSpeakerLabel => 'Lautsprecher';

  @override
  String get audioImpedanceAddSpeaker => 'Lautsprecher hinzufügen';

  @override
  String get audioImpedanceTotalTitle => 'Gesamtimpedanz';

  @override
  String get audioImpedanceEmptyState =>
      'Gib mindestens eine Impedanz ein, um die Summe zu berechnen.';

  @override
  String get audioImpedanceWarningLow =>
      'Niedrige Impedanz: Prüfe, ob dein Verstärker diese Last verträgt (oft mindestens 2 Ω).';

  @override
  String get audioImpedanceFormulaNote =>
      'Serie: Zt = Z1 + Z2 + …    Parallel: 1/Zt = 1/Z1 + 1/Z2 + …';

  @override
  String get audioLevelsTitle => 'Wasserwaagen und Kabel';

  @override
  String get audioLevelsSubtitle =>
      'dBu/dBV/Vrms-Wandler. Referenzpegel −10 dBV, +4 dBu, +18 dBu.';

  @override
  String get audioDelayDistanceTitle => 'Distanzverzögerung';

  @override
  String get audioDelayDistanceSubtitle =>
      'Abstand → ms zum Ausrichten von Verzögerungsstapeln, Füllungen oder verteilter Diffusion. Mehrpunkt.';

  @override
  String get subscriptionCategorySonRfShort => 'TON & HF';

  @override
  String get subscriptionProShort => 'PRO';

  @override
  String get audioConditions => 'Bedingungen';

  @override
  String get audioAmbientTemperature => 'Umgebungstemperatur';

  @override
  String get audioSpeedOfSound => 'Schallgeschwindigkeit';

  @override
  String get audioListeningPoints => 'Hörpunkte';

  @override
  String audioDistancePoint(int index) {
    return 'Punktabstand $index';
  }

  @override
  String get audioAddPoint => 'Fügen Sie einen Punkt hinzu';

  @override
  String get audioCalculatedDelays => 'Berechnete Fristen';

  @override
  String get audioTypicalUseCases => 'Typische Anwendungsfälle';

  @override
  String get audioDelayStackFillsTitle => 'Delay-Stack/Füllungen';

  @override
  String get audioDelayStackFillsText =>
      'Messen Sie den Abstand zwischen dem Hauptsystem und dem Verzögerungsturm. Wenden Sie diese Verzögerung auf den Verzögerungsturm an, um ihn mit den Händen auszurichten.';

  @override
  String get audioDistributedSoundTitle => 'Verteilte Übertragung';

  @override
  String get audioDistributedSoundText =>
      'Messen Sie für jede Lautsprecherzone den Abstand vom Referenzsystem und wenden Sie die entsprechende Verzögerung an.';

  @override
  String get audioRoomFillTitle => 'Raumfüllend';

  @override
  String get audioRoomFillText =>
      'Lautsprecher in der Nähe des Publikums werden gegenüber dem Klang auf der Bühne verzögert, um die Wahrnehmung von Doppelquellen zu vermeiden.';

  @override
  String get audioDelayNote =>
      'Die berechnete Verzögerung entspricht der Schallausbreitung in freier Luft.\nFeineinstellung nach Gehör oder mit einem Phasenanalysator.';

  @override
  String get audioFromSpeakerSensitivity =>
      'Schalldruckpegel von der Lautsprecherempfindlichkeit';

  @override
  String get audioSensitivity => 'Empfindlichkeit';

  @override
  String get audioAmpPower => 'Verstärkerleistung';

  @override
  String get audioMeasurementDistance => 'Entfernung messen';

  @override
  String get audioTypicalSensitivities => 'Typische Empfindlichkeiten';

  @override
  String get audioSourceCoupling => 'Quellenkopplung';

  @override
  String get audioSourceCouplingIntro =>
      'Durch das Nebeneinanderschalten identischer Quellen hängt der Gewinn von der Art der Kopplung ab:';

  @override
  String audioSourcesCount(int count) {
    return '$count Quellen';
  }

  @override
  String get audioPracticalRules => 'Praktische Regeln';

  @override
  String get audioRuleDoubleDistance =>
      'Doppelter Abstand = −6 dB (Freifeld). In einem Raum ist die Dämpfung durch Reflexionen geringer.';

  @override
  String get audioRuleDoublePower =>
      'Doppelte Leistung = +3 dB. Mit 10 multiplizieren = +10 dB. Um +20 dB zu erreichen, ist 100-fache Leistung erforderlich.';

  @override
  String get audioRuleCoupling =>
      'Kohärente Kopplung (Quellen in Phase, Rücken an Rücken): +6 dB pro Verdoppelung. Inkonsistente Kopplung: +3 dB.';

  @override
  String get audioRuleSafety =>
      'Schmerzschwelle ≈ 120 dB SPL. Hörrisiko ab 85 dB (8h) laut NIOSH. Alle +3 dB teilen die Belichtungszeit durch 2.';

  @override
  String get audioDistance => 'Distanz';

  @override
  String get audioSpl => 'SPL';

  @override
  String get audioIncoherent => 'Inkohärent';

  @override
  String get audioCoherent => 'Konsistent';

  @override
  String get audioIncoherentSubtitle =>
      'Ausgefallene Quellen\noder nicht synchronisiert';

  @override
  String get audioCoherentSubtitle => 'Inphase-Quellen\nausgerichtet';

  @override
  String get audioLevelConverter => 'Pegelkonverter';

  @override
  String get audioReferenceLevels => 'Referenzniveaus';

  @override
  String get audioGainStagingRules => 'Gain-Inszenierung – praktische Regeln';

  @override
  String get audioAmplifierPerChannel => 'VERSTÄRKER – pro Kanal';

  @override
  String get audioMinimumImpedance => 'Z min (Ω)';

  @override
  String get audioPowerW => 'Leistung (W)';

  @override
  String get audioAtOhm => 'zu (Ω)';

  @override
  String get audioSpeaker => 'SCHWANGER';

  @override
  String get audioNominalImpedance => 'Z nominal (Ω)';

  @override
  String get audioContinuousPower => 'P geht weiter (W)';

  @override
  String get audioParallelConnection => 'PARALLELVERBINDUNG';

  @override
  String get audioLoadImpedance => 'Z-Last';

  @override
  String get audioPowerPerSpeaker => 'P / Enz.';

  @override
  String get audioStatus => 'Status';

  @override
  String audioTooLowImpedance(String diff) {
    return '✗ Z zu niedrig (−$diff Ω)';
  }

  @override
  String get audioExceedsContinuousPower => '⚠ Überschreitet P weiterhin';

  @override
  String audioNearLimit(int percent) {
    return '⚠ Nahe am Grenzwert (>$percent%)';
  }

  @override
  String audioOkContinuousPower(int percent) {
    return '✓ OK ($percent% P cont.)';
  }

  @override
  String get audioAmpLoadNote =>
      'Berechnung auf Basis der vom Hersteller angegebenen Verstärkerleistung je Impedanz (interpoliert). Die Kanalleistung wird auf die N parallel geschalteten Lautsprecher aufgeteilt. 1,5- bis 2-fache Reserve gegenüber der RMS/AES-Belastbarkeit ist mit eingestelltem Limiter üblich. Werte aus Herstellerdatenblättern: immer mit Herstellerpresets und -empfehlungen abgleichen.';

  @override
  String get audioConfiguration => 'Konfiguration';

  @override
  String get audioParameters => 'Einstellungen';

  @override
  String get audioSubDistance => 'Abstand zwischen Subs';

  @override
  String get audioSubCount => 'Anzahl der Subs';

  @override
  String get audioCardioid2Subs => 'Niere – 2 Subwoofer';

  @override
  String get audioCardioid2SubsDescription =>
      '1 normales Sub + 1 Sub mit Verzögerung zurückgegeben';

  @override
  String get audioEndFireNSubs => 'End-Fire – N U-Boote online';

  @override
  String get audioEndFireNSubsDescription =>
      'Alle nach vorne gerichtet, Verzögerungen nach Reihe verschoben';

  @override
  String get audioResults => 'Ergebnisse';

  @override
  String get audioEnterDistanceToCalculate =>
      'Geben Sie eine zu berechnende Entfernung ein';

  @override
  String get audioDelayToApply => 'Bewerbungsschluss';

  @override
  String get audioRearSubDelaySublabel => 'auf dem umgedrehten Sub (hinten)';

  @override
  String get audioOptimalFrequency => 'Optimale Frequenz';

  @override
  String get audioFrontSub => 'Front-Sub';

  @override
  String get audioRearSubReversed => 'Hinterer Sub (umgedreht)';

  @override
  String get audioNormalPolarity => 'Normal ✓';

  @override
  String get audioInvertedPolarity => 'Umgekehrt 🔄';

  @override
  String get audioDelayBetweenRows =>
      'Verzögerung zwischen den einzelnen Reihen';

  @override
  String get audioMaxDelayRearSub => 'Max. Verzögerung (hinterer Sub)';

  @override
  String get audioFrontReferenceSub => 'Front-Sub (Referenz)';

  @override
  String audioSubNumber(int index) {
    return 'Sub $index';
  }

  @override
  String get audioEndFireReferenceNote =>
      '→ Sub 1 (vorne) ist die Referenz. Die folgenden Subs haben eine zunehmende Verzögerung.';

  @override
  String get audioHowTo => 'Wie geht das?';

  @override
  String get audioCardioidStep1 =>
      'Platzieren Sie Subwoofer A mit Blick auf das Publikum (normale Position).';

  @override
  String get audioCardioidStep2 =>
      'Platzieren Sie den B-Sub direkt dahinter, mit dem Kopf nach unten und mit Blick auf die Rückseite der Bühne.';

  @override
  String get audioCardioidStep3 =>
      'Kehren Sie in Ihrem Prozessor oder Ihrer Konsole die Polarität von Sub B um (Ø / Phase-Taste).';

  @override
  String get audioCardioidStep4 =>
      'Wenden Sie die berechnete Verzögerung auf Sub B an. Verzögern Sie Sub A nicht.';

  @override
  String get audioCardioidStep5 =>
      'Überprüfen Sie die rückwärtige Auslöschung mit einem Messmikrofon oder indem Sie hinter das Array gehen.';

  @override
  String get audioCardioidTip =>
      '💡 Der ideale Abstand zwischen den Subs entspricht λ/4 der Mittenfrequenz des Subs (z. B. 90 Hz → ~0,95 m bei 20 °C). Passen Sie an, um den besten Kompromiss zwischen Unterdrückung und Leistung zu finden.';

  @override
  String get audioEndFireStep1 =>
      'Stellen Sie alle Subs in einer Reihe auf, alle mit dem gleichen Abstand zum Publikum.';

  @override
  String get audioEndFireStep2 =>
      'Der am weitesten vorne liegende Sub (Sub 1) ist die Referenz: Verzögerung = 0.';

  @override
  String get audioEndFireStep3 =>
      'Wenden Sie eine zunehmende Verzögerung auf jeden nachfolgenden Rang an (Unter 2 → 1×Verzögerung, Unter 3 → 2×Verzögerung usw.).';

  @override
  String get audioEndFireStep4 =>
      'Alle Subs behalten die gleiche Polarität (keine Umkehrung).';

  @override
  String get audioEndFireStep5 =>
      'Messen Sie von hinten, um die Dämpfung zu prüfen.';

  @override
  String get audioEndFireTip =>
      '💡 End-Fire bietet etwas weniger Richtwirkungsgewinn als die klassische Niere, funktioniert aber mit mehr als 2 Subwoofern und erfordert kein physisches Umdrehen.';

  @override
  String get audioConversion => 'Konvertierung';

  @override
  String get audioFrequency => 'Frequenz';

  @override
  String get audioWavelength => 'Wellenlänge';

  @override
  String get audioResult => 'Ergebnis';

  @override
  String get audioEnterValueToCalculate =>
      'Geben Sie einen zu berechnenden Wert ein';

  @override
  String audioWavelengthAt(String frequency) {
    return 'Wellenlänge bei $frequency';
  }

  @override
  String audioFrequencyForLambda(String lambda) {
    return 'Frequenz für λ = $lambda m';
  }

  @override
  String get audioHalfWave => 'λ/2 (Halbwelle)';

  @override
  String get audioQuarterWave => 'λ/4 (Viertelwelle)';

  @override
  String get audioSpectrumMarkers => 'Audiospektrum – Benchmarks';

  @override
  String get audioWavelengthFormula =>
      'Formel: λ = v / f |    v = 331,3 + 0,606 × T (°C)';

  @override
  String get audioHzToLambda => 'Hz → λ (m)';

  @override
  String get audioLambdaToHz => 'λ (m) → Hz';

  @override
  String get audioSubBass => 'Subbass';

  @override
  String get audioBass => 'Bass';

  @override
  String get audioLowMid => 'Tiefmitten';

  @override
  String get audioMid => 'Medien';

  @override
  String get audioHighMid => 'Hohe Mitten';

  @override
  String get audioTreble => 'Verdreifachen';

  @override
  String get audioIncoherentSources => 'Inkonsistente Quellen';

  @override
  String get audioIdenticalSources => 'N identische Quellen';

  @override
  String get audioSingleSourceSpl => 'Schalldruckpegel einer Quelle';

  @override
  String audioTotalSplSources(int count) {
    return 'Gesamt-SPL ($count Quellen)';
  }

  @override
  String get audioTwoDifferentSources => '2 verschiedene Quellen';

  @override
  String get audioSourceA => 'Quelle A';

  @override
  String get audioSourceB => 'Quelle B';

  @override
  String get audioTotalSplAB => 'Gesamt-SPL (A + B)';

  @override
  String get audioDoublingReference => 'Referenz – Verdoppelung des Gewinns';

  @override
  String get audioIncoherentShort => 'Incoh. :';

  @override
  String get audioCoherentShort => 'Kohärent. :';

  @override
  String get audioCalculationMode => 'Berechnungsmethode';

  @override
  String get audioReferenceSpl => 'Referenz-SPL';

  @override
  String get audioReferenceDistance => 'Referenzabstand';

  @override
  String get audioTargetDistance => 'Zielentfernung';

  @override
  String get audioEnterValuesToCalculate =>
      'Geben Sie die zu berechnenden Werte ein';

  @override
  String audioSplAtDistance(String distance) {
    return 'SPL bei $distance m';
  }

  @override
  String get audioVariation => 'Variation';

  @override
  String get audioListeningDistance => 'Hörabstand';

  @override
  String get audioMaxSplAt1m => 'Maximaler Schalldruckpegel bei 1 m';

  @override
  String get audioDistanceToSpl => 'Abstand → SPL';

  @override
  String get audioPowerToSpl => 'Leistung → SPL';

  @override
  String get audioSoundLevelReference => 'Schallpegelreferenz';

  @override
  String get audioSectionSafety => 'Gehörschutz';

  @override
  String get audioNoiseDoseTitle => 'Lärmdosis & Expositionszeit';

  @override
  String get audioNoiseDoseIntro =>
      'Jede +3 dB halbiert die zulässige Expositionszeit (3-dB-Austauschregel). Gib den gemessenen oder geplanten Schallpegel ein, um die Zeit bis zum Erreichen der gesetzlichen Lärmgrenzwerte abzuschätzen.';

  @override
  String get audioNoiseDoseLevelCardTitle => 'Gemessener Pegel';

  @override
  String get audioNoiseDoseLevelLabel => 'Schallpegel';

  @override
  String get audioNoiseDoseAllowedTimeTitle => 'Zulässige Zeit bis zur Dosis';

  @override
  String get audioNoiseDoseVaiLabel => 'Unterer Auslösewert';

  @override
  String get audioNoiseDoseVasLabel => 'Oberer Auslösewert';

  @override
  String get audioNoiseDoseVleLabel => 'Expositionsgrenzwert';

  @override
  String get audioNoiseDoseUnlimited => '≥ 8 Std. (kein Risiko pro Tag)';

  @override
  String get audioNoiseDoseTableTitle => 'Referenz — zulässige Zeit nach Pegel';

  @override
  String get audioNoiseDoseTableLevelHeader => 'Pegel';

  @override
  String get audioNoiseDoseTableTimeHeader =>
      'Zulässige Zeit (Grenzwert 87 dB)';

  @override
  String get audioNoiseDoseVenueTitle =>
      'Grenzwerte für Veranstaltungsorte (frz. Show-Dekret)';

  @override
  String get audioNoiseDoseVenueText =>
      'Das französische Dekret 2017-1244 begrenzt den Mittelungspegel (LAeq über 15 Min.) auf 102 dB(A) (gelegentlicher Ort) bzw. 105 dB(A) (regelmäßiger Ort), mit einem Spitzenpegel ≤ 118 bzw. 120 dB(C). Diese gelten fortlaufend für das Publikum über einen Begrenzer — unabhängig von der oben berechneten arbeitsbezogenen Exposition.';

  @override
  String get audioNoiseDoseDisclaimer =>
      'Indikatives Werkzeug basierend auf der 3-dB-Austauschregel (frz. Arbeitsgesetzbuch, Art. R.4431-2). Ersetzt kein zertifiziertes Schallpegelmessgerät oder Dosimeter und keine gesetzliche Messung vor Ort.';

  @override
  String get audioSectionOrganization => 'Organisation';

  @override
  String get audioInputListTitle => 'Input-Liste';

  @override
  String get audioInputListIntro =>
      'Erstelle deine Mikro-/DI-Input-Liste für den Soundcheck oder den Patchplan. Die Zeilenreihenfolge bestimmt die Kanalnummer — zum Umsortieren ziehen.';

  @override
  String get audioInputListEmpty =>
      'Noch keine Einträge. Füge die erste Zeile deiner Input-Liste hinzu.';

  @override
  String get audioInputListAddButton => 'Eintrag hinzufügen';

  @override
  String audioInputListChannel(Object n) {
    return 'Kanal $n';
  }

  @override
  String get audioInputListNameLabel => 'Quelle';

  @override
  String get audioInputListPositionLabel => 'Position';

  @override
  String get audioInputListNotesLabel => 'Notizen';

  @override
  String get audioInputListTypeMic => 'Mikro';

  @override
  String get audioInputListTypeDi => 'DI';

  @override
  String get audioInputListTypeLine => 'Line';

  @override
  String get audioInputListTypeWireless => 'Funk';

  @override
  String get audioInputListTypeOther => 'Andere';

  @override
  String get audioInputListCopyAction => 'Liste kopieren';

  @override
  String get audioInputListCopiedSnackbar =>
      'Liste in die Zwischenablage kopiert';

  @override
  String get audioInputListClearAction => 'Alles löschen';

  @override
  String get audioInputListClearConfirmTitle => 'Ganze Liste löschen?';

  @override
  String get audioInputListClearConfirmBody =>
      'Dadurch werden alle Einträge der Input-Liste entfernt. Das kann nicht rückgängig gemacht werden.';

  @override
  String get pluginCommunity => 'Plugin-Community';

  @override
  String get pluginCommunitySubtitle =>
      'Teilen und entdecken Sie von der Community erstellte grandMA3-Plugins';

  @override
  String get pluginCommunitySubtitleAuth =>
      'Teilen und entdecken Sie Plugins\ngrandMA3 erstellt von der Community.';

  @override
  String get continueWithGoogle => 'Weiter mit Google';

  @override
  String get authChoosePseudo => 'Wählen Sie Ihren Spitznamen';

  @override
  String get authPseudoHint => 'Ihr Spitzname in der Community';

  @override
  String get confirm => 'Bestätigen';

  @override
  String get loginCancelled => 'Verbindung abgebrochen.';

  @override
  String get anonymous => 'Anonym';

  @override
  String get share => 'Aktie';

  @override
  String get searchPluginHint => 'Nach einem Plugin suchen…';

  @override
  String get allPluginsFilter => '⭐ Alle';

  @override
  String get loginRequiredLike => 'Melden Sie sich an, um 👋 zu liken';

  @override
  String get noPluginsYet => 'Hier gibt es noch keine Plugins.';

  @override
  String get beFirstToShare => 'Seien Sie der Erste, der etwas teilt!';

  @override
  String get signOut => 'Abmelden';

  @override
  String get luaCode => 'Lua-Code';

  @override
  String get copied => 'Kopiert!';

  @override
  String get copyCode => 'Code kopieren';

  @override
  String get pluginPublished => '🚀 Plugin veröffentlicht!';

  @override
  String get sharePlugin => 'Teilen Sie ein Plugin';

  @override
  String get pluginTitle => 'Plugin-Titel';

  @override
  String get pluginTitleHint =>
      'Beispiel: RGB-Farbstapel – 30 Voreinstellungen';

  @override
  String get pluginTitleRequired => 'Titel erforderlich';

  @override
  String get category => 'Kategorie';

  @override
  String get optionalDescription => 'Beschreibung (optional)';

  @override
  String get pluginDescriptionHint =>
      'Was das Plugin macht, was es vom Benutzer verlangt ...';

  @override
  String get codeRequired => 'Code erforderlich';

  @override
  String get codeMustContainReturnMain =>
      'Der Code muss „return main“ enthalten.';

  @override
  String get pluginTestedWarning =>
      'Stellen Sie sicher, dass das Plugin in MA3 getestet wurde, bevor Sie es freigeben.';

  @override
  String get attachFiles => 'Dateien anhängen';

  @override
  String get addFiles => 'Dateien hinzufügen (.lua, .xml…)';

  @override
  String filesSelected(Object count) {
    return '$count ausgewählte Datei(en)';
  }

  @override
  String get codeOptional => 'Fügen Sie den Code ein (optional)';

  @override
  String get codeOrFileRequired =>
      'Fügen Sie mindestens eine Datei hinzu oder fügen Sie den Code ein';

  @override
  String get downloadFile => 'Herunterladen';

  @override
  String get pluginFiles => 'Dateien';

  @override
  String get uploadingFiles => 'Dateien werden gesendet…';

  @override
  String get publishPlugin => 'Veröffentlichen Sie das Plugin';

  @override
  String get free => 'FREI';

  @override
  String get pro => 'PRO';

  @override
  String get console => 'Konsole';

  @override
  String pluginError(Object error) {
    return 'Fehler: $error';
  }

  @override
  String get pluginCategory_all => 'Alle';

  @override
  String get pluginCategory_color => 'Farbe';

  @override
  String get pluginCategory_movement => 'Bewegung';

  @override
  String get pluginCategory_effect => 'Effekte';

  @override
  String get pluginCategory_dimmer => 'Intensität';

  @override
  String get pluginCategory_layout => 'Layout';

  @override
  String get pluginCategory_select => 'Auswahl';

  @override
  String get pluginCategory_macro => 'Makro';

  @override
  String get pluginCategory_utility => 'Dienstprogramm';

  @override
  String get pluginCategory_custom => 'Mass angefertigt';

  @override
  String get ma3AppTitlePrefix => 'MA3-Plugin';

  @override
  String get ma3AppTitleAccent => 'Geschmiedet';

  @override
  String get ma3New => '↺ Neu';

  @override
  String get ma3StepCategory => 'Kategorie';

  @override
  String get ma3StepSettings => 'Einstellungen';

  @override
  String get ma3StepGeneratedCode => 'Code generiert';

  @override
  String get ma3ChoosePluginType => 'Welche Art von Plugin?';

  @override
  String get ma3ChooseCategorySubtitle =>
      'Wählen Sie eine Kategorie, um loszulegen';

  @override
  String get ma3Continue => 'Weiter →';

  @override
  String get ma3PluginName => 'Plugin-Name';

  @override
  String get ma3PluginNameHint => 'Mein MA3 Plugin';

  @override
  String get ma3PluginSettings => 'Plugin-Einstellungen';

  @override
  String get ma3AdditionalDetails => '💬 Zusätzliche Details (optional)';

  @override
  String get ma3AdditionalDetailsHint =>
      'Fügt Details, Sonderfälle, Einschränkungen hinzu ...';

  @override
  String get ma3Back => '← Zurück';

  @override
  String get ma3GeneratePlugin => '⚡ Generieren Sie das Plugin';

  @override
  String get ma3GeneratedReady =>
      'Generiertes Plugin – bereit zum Einfügen in MA3';

  @override
  String get ma3InstallInMa3 => 'In MA3 installieren:';

  @override
  String get ma3Menu => 'Speisekarte';

  @override
  String get ma3Plugin => 'Plugin';

  @override
  String get ma3NewPlugin => 'Neues Plugin';

  @override
  String get ma3PasteSaveAs => '→ Einfügen → Speichern unter';

  @override
  String get ma3Run => 'Laufen';

  @override
  String get ma3Copied => '✓ Kopiert!';

  @override
  String get ma3Copy => '⎘ Kopieren';

  @override
  String get ma3Edit => '← Bearbeiten';

  @override
  String get ma3Regenerate => '↺ Regenerieren';

  @override
  String get ma3NewPluginButton => '+ Neues Plugin';

  @override
  String get ma3Choose => '- Wählen -';

  @override
  String get ma3Add => 'Hinzufügen...';

  @override
  String get ma3GeneratedPluginFallback => 'Plugin';

  @override
  String get ma3CategoryColor => 'Farbe';

  @override
  String get ma3CategoryColorDesc =>
      'RGB-Layout, Palette, Farbvoreinstellungen';

  @override
  String get ma3CategoryMovement => 'Bewegung';

  @override
  String get ma3CategoryMovementDesc =>
      'Schwenken/Neigen, Kreis, Zahl 8, Positionen';

  @override
  String get ma3CategoryEffect => 'Effekte';

  @override
  String get ma3CategoryEffectDesc => 'Strobe, Pulse, Chase, Sequenzen';

  @override
  String get ma3CategoryDimmer => 'Intensität';

  @override
  String get ma3CategoryDimmerDesc => 'Dimmer, Bump, Fade, Blackout';

  @override
  String get ma3CategoryLayout => 'Layout';

  @override
  String get ma3CategoryLayoutDesc => 'MA3-Layouts erstellen/organisieren';

  @override
  String get ma3CategorySelect => 'Auswahl';

  @override
  String get ma3CategorySelectDesc =>
      'Auswahl von Gruppen, Vorrichtungen, Filtern';

  @override
  String get ma3CategoryMacro => 'Makro';

  @override
  String get ma3CategoryMacroDesc => 'Mehrschrittmakros, Konsolensequenzen';

  @override
  String get ma3CategoryUtility => 'Dienstprogramm';

  @override
  String get ma3CategoryUtilityDesc =>
      'Beschriften, speichern und organisieren Sie die Showdatei';

  @override
  String get ma3CategoryCustom => 'Mass angefertigt';

  @override
  String get ma3CategoryCustomDesc => 'Beschreiben Sie frei, was Sie wollen';

  @override
  String get ma3FieldColorSpace => 'Maschinenfarbraum';

  @override
  String get ma3FieldColors => 'Farben als Voreinstellungen anzubieten';

  @override
  String get ma3FieldGroupSelect =>
      'Das Plugin fragt beim Start nach der Gruppe';

  @override
  String get ma3YesViaMa3Dialog => 'Ja – über Dialog MA3';

  @override
  String get ma3NoUseCurrentSelection =>
      'Nein – verwendet die aktuelle Auswahl';

  @override
  String get ma3FieldMovementType => 'Art der zu erstellenden Bewegung';

  @override
  String get ma3MovePresetPositions =>
      'Voreingestellte Positionen (Szene, Vorderseite, Seiten...)';

  @override
  String get ma3MoveCircle => 'Effekt-Engine – Kreis';

  @override
  String get ma3MoveFigure8 => 'Effekt-Engine – Abbildung 8';

  @override
  String get ma3MovePanSweep => 'Effekt-Engine – Pan-Sweep';

  @override
  String get ma3MoveTiltSweep => 'Effekt-Engine – Tilt-Sweep';

  @override
  String get ma3MoveRandom => 'Effekt-Engine – Zufällig';

  @override
  String get ma3FieldSpeedSourceEffects =>
      'Geschwindigkeitsquelle (für Effekte)';

  @override
  String get ma3SpeedBpmConsole => 'BPM – in der Konsole eingegebener Wert';

  @override
  String get ma3SpeedExecutorConsole =>
      'Speed ​​​​Executor – in die Konsole eingegebene Nummer';

  @override
  String get ma3SpeedBothConsole => 'Beides – Auswahl in der Konsole';

  @override
  String get ma3FieldEffectType => 'Art des zu erstellenden Effekts';

  @override
  String get ma3FieldOutput => 'Was das Plugin erstellt';

  @override
  String get ma3OutputEffectPresets => 'Effektvoreinstellungen';

  @override
  String get ma3OutputChaseSequence => 'Chase-Sequenz';

  @override
  String get ma3OutputTriggerMacro => 'Makro-Trigger';

  @override
  String get ma3FieldSpeedSource => 'Geschwindigkeitsquelle';

  @override
  String get ma3FieldFeatures => 'Einzuschließende Funktionen';

  @override
  String get ma3OutputIntensityMacros => 'Intensitätsmakros';

  @override
  String get ma3OutputIntensityPresets => 'Intensitätsvoreinstellungen';

  @override
  String get ma3FieldLayoutSections =>
      'Abschnitte, die in das Layout einbezogen werden sollen';

  @override
  String get ma3SectionColors => 'Farben';

  @override
  String get ma3SectionGroups => 'Gruppen';

  @override
  String get ma3SectionPresets => 'Voreinstellungen';

  @override
  String get ma3FieldVisualStyle => 'Visueller Stil';

  @override
  String get ma3FieldGroupNameNumber =>
      'Das Plugin fragt beim Start nach dem Namen/der Nummer';

  @override
  String get ma3NoHardcodedGenericName =>
      'Nein – fest codierter generischer Name';

  @override
  String get ma3FieldSelectionCriteria => 'Vorzuschlagende Auswahlkriterien';

  @override
  String get ma3CriteriaEvenOdd => 'Gerade/Ungerade';

  @override
  String get ma3CriteriaThirds => '1/3 – 2/3 – 3/3';

  @override
  String get ma3CriteriaPosition => 'Nach Position (vorne/mitte/hinten)';

  @override
  String get ma3CriteriaAll => 'Alle';

  @override
  String get ma3CriteriaFirstLast => 'Erster/Letzter';

  @override
  String get ma3OutputSelectionMacros => 'Auswahlmakros';

  @override
  String get ma3OutputGroupButtonsLayout =>
      'Gruppieren Sie Schaltflächen in einem Layout';

  @override
  String get ma3FieldMacroSteps => 'Beschreiben Sie die Schritte des Makros';

  @override
  String get ma3MacroStepsHint =>
      'Bsp.:\n1. Gruppe auswählen (Dialog)\n2. Blackout\n3. Warten Sie 1 Sekunde\n4. 3 Sekunden einblenden';

  @override
  String get ma3FieldTrigger => 'Auslösen';

  @override
  String get ma3TriggerManual => 'Handbuch';

  @override
  String get ma3FieldTask => 'Aufgabe, die ausgeführt werden soll';

  @override
  String get ma3TaskNameFixtures => 'Benennen der Patch-Geräte';

  @override
  String get ma3TaskCreateGroups => 'Gruppen automatisch erstellen';

  @override
  String get ma3TaskStorePresets => 'Speichern Sie alle Voreinstellungen';

  @override
  String get ma3TaskCleanEmptyObjects => 'Leere Gegenstände reinigen';

  @override
  String get ma3TaskCloneLayout => 'Klonen Sie ein Layout';

  @override
  String get ma3TaskShowReport =>
      'Bericht anzeigen (Geräte, Gruppen, Voreinstellungen)';

  @override
  String get ma3FieldConfirmEachAction => 'Bestätigen Sie vor jeder Aktion';

  @override
  String get ma3Yes => 'Ja';

  @override
  String get ma3No => 'NEIN';

  @override
  String get ma3FieldCustomDescription =>
      'Beschreiben Sie, was das Plugin in MA3 tun soll';

  @override
  String get ma3ColorRed => 'Rot';

  @override
  String get ma3ColorGreen => 'Grün';

  @override
  String get ma3ColorBlue => 'Blau';

  @override
  String get ma3ColorYellow => 'GELB';

  @override
  String get ma3ColorOrange => 'Orange';

  @override
  String get ma3ColorPink => 'Rosa';

  @override
  String get ma3ColorColdWhite => 'Kühles Weiß';

  @override
  String get ma3ColorWarmWhite => 'Warmweiß';

  @override
  String get ma3EffectStrobe => 'Blitz';

  @override
  String get ma3EffectPulse => 'Impuls';

  @override
  String get ma3EffectChase => 'Verfolgungsjagd';

  @override
  String get ma3EffectTwinkle => 'Funkeln';

  @override
  String get ma3EffectFire => 'Feuer';

  @override
  String get ma3EffectSawtooth => 'Sägezahn';

  @override
  String get ma3EffectRandom => 'Zufällig';

  @override
  String get ma3Blackout => 'Blackout';

  @override
  String get ma3Full => 'Voll';

  @override
  String get ma3Bump => 'Stoßen';

  @override
  String get ma3FadeIn => 'Einblenden';

  @override
  String get ma3FadeOut => 'Ausblenden';

  @override
  String get ma3DimmerChase => 'Dimmer Chase';

  @override
  String get ma3Compact => 'Kompakt';

  @override
  String get ma3Large => 'Breit';

  @override
  String get ma3Tablet => 'Tablette';

  @override
  String get ma3Wing => 'Flügel';

  @override
  String get ma3Random => 'Zufällig';

  @override
  String get ma3FirstLast => 'Erster/Letzter';

  @override
  String ma3Error(Object error) {
    return 'Fehler: $error';
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
  String get ma3Text_Gel_Color => 'Gelfarbe';

  @override
  String get ma3Text_Cyan => 'Cyan';

  @override
  String get ma3Text_Magenta => 'Magenta';

  @override
  String get ma3Text_Lime => 'Kalk';

  @override
  String get ma3Text_UV => 'UV';

  @override
  String get ma3Text_OFF => 'AUS';

  @override
  String get ma3Text_50 => '50 %';

  @override
  String get ma3Text_25 => '25 %';

  @override
  String get ma3Text_GO_button => 'GO-Taste';

  @override
  String get ma3Text_Timecode => 'Timecode';

  @override
  String get ma3Text_OSC => 'CSO';

  @override
  String get ma3Text_MIDI => 'MITTAG';

  @override
  String get gdtfShareAsZip => 'Teilen in .zip';

  @override
  String get gdtfZipShareHelp =>
      '💡 Nützlich, wenn Gmail oder Ihre E-Mail .gdtf blockiert – benennen Sie die Datei nach dem Empfang in .gdtf um.';

  @override
  String get rfAntennaTitle => 'Antennenrechner';

  @override
  String get rfSplitterTitle => 'Verteiler-/Kombinierer-Verlust';

  @override
  String get rfCableAntennaTitle => 'HF-Kabel & Antennen';

  @override
  String get rfCableLossSectionTitle => 'Koaxialkabel-Dämpfung';

  @override
  String get rfCableLossCableTypeLabel => 'Kabeltyp';

  @override
  String get rfCableAntennaFrequencyLabel => 'Frequenz';

  @override
  String get rfCableLossLengthLabel => 'Kabellänge';

  @override
  String get rfCableAntennaEmptyState =>
      'Werte eingeben, um das Ergebnis zu sehen.';

  @override
  String get rfCableLossResultLabel => 'Gesamtdämpfung';

  @override
  String get rfCableLossFormulaNote =>
      'Dämpfung ≈ k1·√f + k2·f (dB/100 m) — empirisches Modell je Kabeltyp, typischerweise ±5 % zwischen 100 MHz und 2,5 GHz. Richtwerte: für ein kritisches Link-Budget das Datenblatt des Kabels heranziehen.';

  @override
  String get rfDiversitySectionTitle => 'Diversity-Antennenabstand (λ/4)';

  @override
  String get rfDiversityResultLabel => 'Empfohlener Abstand';

  @override
  String get rfDiversityFormulaNote =>
      'λ/4 = 75 / f(MHz) Meter — empfohlener Mindestabstand zwischen zwei Diversity-Antennen zur Begrenzung von Mehrwegeschwund (Fading).';

  @override
  String get rfPlannerTitle => 'HF-Frequenzplaner';

  @override
  String get rfPlannerBandLabel => 'Frequenzband';

  @override
  String get rfPlannerCustomBand => 'Benutzerdefiniert';

  @override
  String get rfPlannerMinFreqLabel => 'Min. Frequenz';

  @override
  String get rfPlannerMaxFreqLabel => 'Max. Frequenz';

  @override
  String get rfPlannerChannelCountLabel => 'Gewünschte Kanalanzahl';

  @override
  String get rfPlannerMinSpacingLabel => 'Mindestabstand zwischen Kanälen';

  @override
  String get rfPlannerResultTitle => 'Vorgeschlagene Frequenzen';

  @override
  String get rfPlannerFoundLabel => 'Gefundene Kanäle';

  @override
  String get rfPlannerNotEnoughWarning =>
      'Nicht alle gewünschten Kanäle konnten in diesem Band mit diesem Abstand gefunden werden — versuche ein breiteres Band oder reduziere die Kanalanzahl/den Mindestabstand.';

  @override
  String get rfPlannerFormulaNote =>
      'Vermeidet Intermodulationsprodukte 3. Ordnung (2fA−fB, fA+fB−fC) zwischen allen Kanälen, ±200 kHz Toleranz — keine absolute Garantie, vor Ort mit einem HF-Scan prüfen.';

  @override
  String get rfSplitterWaysLabel => 'Anzahl der Wege';

  @override
  String get rfSplitterExcessLossLabel => 'Zusätzlicher Verteilerverlust';

  @override
  String get rfSplitterAdditionalLossLabel => 'Kabel- & Steckerverluste';

  @override
  String get rfSplitterTotalTitle => 'Gesamteinfügungsdämpfung';

  @override
  String get rfSplitterTheoreticalLabel => 'Theoretischer Verlust (10·log₁₀N)';

  @override
  String get rfSplitterReferenceTitle => 'Referenz nach Anzahl der Wege';

  @override
  String get rfSplitterFormulaNote =>
      'Gesamtverlust ≈ theoretischer Verlust + Zusatzverlust + Kabel-/Steckerverluste';

  @override
  String get rfFrequency => 'Frequenz';

  @override
  String get rfVelocityFactorTitle => 'Geschwindigkeitsfaktor (Vf)';

  @override
  String get rfAntennaLengths => 'Antennenlängen';

  @override
  String get rfEnterFrequencyToCalculate =>
      'Geben Sie eine zu berechnende Häufigkeit ein';

  @override
  String get rfFullWave => 'Vollwelle (λ)';

  @override
  String get rfHalfWave => 'Halbwelle (λ/2)';

  @override
  String get rfStandardDipole => 'Standard-Dipol';

  @override
  String get rfQuarterWave => 'Viertelwelle (λ/4)';

  @override
  String get rfWhipAntenna => 'Peitschenantenne – am häufigsten';

  @override
  String get rfFiveEighthWave => '5/8-Welle (5λ/8)';

  @override
  String get rfFiveEighthWaveDescription => 'Verstärkung +3 dB gegenüber λ/4';

  @override
  String get rfReferenceFrequencies => 'Referenzfrequenzen';

  @override
  String get rfFmRadio => 'UKW-Radio (88 MHz)';

  @override
  String get rfVhfLow => 'UKW-Niedrig (174 MHz)';

  @override
  String get rfUhf470 => 'UHF 470 MHz';

  @override
  String get rfUhf600 => 'UHF 600 MHz';

  @override
  String get rfUhf694 => 'UHF 694 MHz (FR-Grenze)';

  @override
  String get rfIsm863 => 'ISM 863 MHz';

  @override
  String get rfWifi24 => '2,4-GHz-WLAN';

  @override
  String get rfWifi5 => '5-GHz-WLAN (Mitte)';

  @override
  String get rfFormulaExplanation =>
      'λ = c / f × Vf |    c = 299,792 m/µs\nVf = Kabelgeschwindigkeitsfaktor (1,00 für freie Luft)';

  @override
  String get rfPresetFreeSpace => 'Freie Luft';

  @override
  String get rfCoexTitle => '2,4-GHz-Koexistenz';

  @override
  String get rfCoexBandOccupancyTitle => 'Wer belegt das 2,4-GHz-Band?';

  @override
  String get rfCoexAvProtocolsTitle => '⚡ AV-Protokolle auf 2,4 GHz';

  @override
  String get rfCoexAllProtocolsTitle => 'Alle Protokolle';

  @override
  String get rfCoexFrequentConflictsTitle =>
      'Häufige Konflikte bei Veranstaltungen';

  @override
  String get rfCoexFieldRecommendationsTitle => 'Feldempfehlungen';

  @override
  String get rfCoexProtocolWifi24Name => '2,4-GHz-WLAN';

  @override
  String get rfCoexProtocolWifi24Note =>
      'Feste Kanäle, Breitband. Hohe Sendeleistung.';

  @override
  String get rfCoexProtocolBluetoothClassicName => 'Bluetooth-Klassiker';

  @override
  String get rfCoexProtocolBluetoothClassicNote =>
      'Springt zwischen 1600 Frequenzen/s. Koexistenz mit WLAN über AFH.';

  @override
  String get rfCoexProtocolBluetoothLeName => 'Bluetooth LE';

  @override
  String get rfCoexProtocolBluetoothLeNote =>
      'Kanäle 37, 38, 39 = Werbung (fest). Risiko mit WiFi ch1.';

  @override
  String get rfCoexProtocolZigbeeName => 'Zigbee (IEEE 802.15.4)';

  @override
  String get rfCoexProtocolZigbeeNote =>
      'Kanäle 11–26, jeweils 2 MHz breit. Kompatibel mit WiFi ch1/6/11.';

  @override
  String get rfCoexProtocolDigitalMics24Name => 'Digitale Mikrofone 2,4 GHz';

  @override
  String get rfCoexProtocolDigitalMics24Note =>
      'Shure GLX-D, Line6 XD-V, Sennheiser EW-D 2,4 GHz. Sehr anfällig für WLAN-Störungen.';

  @override
  String get rfCoexProtocolWirelessDmxName => 'DMX / Drahtloses RDM';

  @override
  String get rfCoexProtocolWirelessDmxNote =>
      'Lumen Radio CRMX, W-DMX, City Theatrical. FHSS = robust, aber Band-Sharing.';

  @override
  String get rfCoexProtocolWirelessVideoName => 'Drahtloses Video';

  @override
  String get rfCoexProtocolWirelessVideoNote =>
      'Hollyland Mars, DJI O3, Teradek Bolt 4K. Sehr große Bandbreite, größere Konflikte möglich.';

  @override
  String get rfCoexTypeDsssOfdm => 'DSSS/OFDM';

  @override
  String get rfCoexTypeFhss79 => '79-Kanal-FHSS';

  @override
  String get rfCoexTypeFhss40 => '40-Kanal-FHSS';

  @override
  String get rfCoexTypeDsss16 => '16-Kanal-DSSS';

  @override
  String get rfCoexTypeFhssDsss => 'FHSS/DSSS';

  @override
  String get rfCoexTypeFhss => 'FHSS';

  @override
  String get rfCoexTypeOfdm => 'OFDM';

  @override
  String get rfCoexConflictWifiCh6 => 'WLAN-Kanal 6';

  @override
  String get rfCoexConflictMic24 => 'Mikrofon 2,4 GHz';

  @override
  String get rfCoexConflictBleAdvertising => 'BLE-Werbung';

  @override
  String get rfCoexConflictWifiCh1 => 'WLAN Kanal 1';

  @override
  String get rfCoexConflictWirelessVideo => 'Drahtloses Video';

  @override
  String get rfCoexConflictEverythingElse => 'Alles andere';

  @override
  String get rfCoexConflictZigbeeCh11 => 'Zigbee ch11';

  @override
  String get rfCoexRiskHigh => 'SCHÜLER';

  @override
  String get rfCoexRiskMedium => 'DURCHSCHNITT';

  @override
  String get rfCoexConflictWifiCh6Mic24Desc =>
      'WiFi ch6 überlappt direkt die bevorzugten Frequenzen digitaler Mikrofone.';

  @override
  String get rfCoexConflictBleWifiCh1Desc =>
      'Die BLE-Kanäle 37/38/39 liegen bei 2402, 2426 und 2480 MHz.';

  @override
  String get rfCoexConflictVideoEverythingDesc =>
      'Drahtlose Videoverbindungen nutzen eine große Bandbreite und überlasten das Band leicht.';

  @override
  String get rfCoexConflictZigbeeWifiCh1Desc =>
      'Zigbee-Kanal 11 (2405 MHz) liegt direkt im WiFi-Kanal-1-Band.';

  @override
  String get rfCoexTipWifiChannels =>
      'Reservieren Sie WLAN für die Kanäle 1 und/oder 11. Vermeiden Sie Kanal 6, wenn Sie 2,4-GHz-Mikrofone haben.';

  @override
  String get rfCoexTipUhfMics =>
      'Für HF-Mikrofone in dicht besiedelten Gebieten bevorzugen Sie UHF-Systeme (470–694 MHz) gegenüber 2,4-GHz-Systemen.';

  @override
  String get rfCoexTipWirelessVideo5Ghz =>
      'Drahtlose Videoverbindungen: Verwenden Sie nach Möglichkeit unbedingt das 5-GHz-Band.';

  @override
  String get rfCoexTipWirelessDmxFhss =>
      'Das DMX FHSS-Funkgerät ist am robustesten – es überspringt automatisch besetzte Frequenzen.';

  @override
  String get rfCoexTipSpectrumScan =>
      'Führen Sie vor der Veranstaltung einen Spektrumscan mit einer RF-App (WiFi-Analyzer, Chanalyzer usw.) durch.';

  @override
  String get rfPageTitle => 'RF und Wireless';

  @override
  String get rfSectionMicrosHf => 'HF-Mikrofone und Antennen';

  @override
  String get rfSectionCalcHf => 'HF-Berechnungen';

  @override
  String get rfSectionWifi => 'W-lan';

  @override
  String get rfSectionCoexistence => 'Koexistenz';

  @override
  String get rfSectionScanTerrain => 'Scannen und Feld';

  @override
  String get rfFreeLabel => 'FREI';

  @override
  String get rfToolUhfBandsTitle => 'UHF/VHF-Bänder';

  @override
  String get rfToolUhfBandsSubtitle =>
      'Zugelassene Bänder Frankreich (ANFR), UHF 470–694 MHz, digitale Dividende, DECT, ISM 863 MHz.';

  @override
  String get rfToolAntennaTitle => 'Antennenrechner';

  @override
  String get rfToolAntennaSubtitle =>
      'Frequenz → λ/4, λ/2, 5λ/8. Geschwindigkeitsfaktor für Koaxialkabel. Referenzen zu UHF/WiFi.';

  @override
  String get rfToolIm3Title => 'IM3-Intermodulation';

  @override
  String get rfToolIm3Subtitle =>
      'Berechnet 2Fi−Fj für 2 bis 16 Frequenzen. Erkennt Produkte, die auf Ihren Kanälen landen.';

  @override
  String get rfToolWifi24Title => '2,4-GHz-WLAN-Kanäle';

  @override
  String get rfToolWifi24Subtitle =>
      '13 Kanäle, visuelle Überschneidungen, Konfliktsimulator. Nicht widersprüchliche Kanäle 1, 6, 11.';

  @override
  String get rfToolWifi5Title => '5-GHz-WLAN-Kanäle';

  @override
  String get rfToolWifi5Subtitle =>
      'UNII-1/2A/2C-Bänder, DFS, Kanäle in Frankreich verfügbar. Nicht überlappend bei 80 MHz.';

  @override
  String get rfToolCoexTitle => '2,4-GHz-Koexistenz';

  @override
  String get rfToolCoexSubtitle =>
      'Wer teilt sich das Band: WLAN, Bluetooth, Zigbee, digitale Mikrofone, drahtlos DMX, Video. Typische Konflikte.';

  @override
  String get rfToolScanWifiTitle => 'WLAN-Scan';

  @override
  String get rfToolScanWifiSubtitle =>
      'Analysiert umliegende WLAN-Netzwerke: Kanäle, RSSI, 2,4/5-GHz-Bänder. Visualisierung der Spektrumbelegung.';

  @override
  String get rfToolScanLogTitle => 'RF-Scan-Protokoll';

  @override
  String get rfToolScanLogSubtitle =>
      'Manuelle Frequenzablesung: Signalpegel, Status (frei/grenzwertig/besetzt), Feldnotizen.';

  @override
  String get rfIm3PageTitle => 'IM3-Intermodulation';

  @override
  String get rfIm3WhatIs => 'Was ist IM3?';

  @override
  String get rfIm3WhatIsBody =>
      'Wenn zwei Sender F1 und F2 in einen Verstärker oder Empfänger eintreten, erzeugen sie Störfrequenzen bei 2F1 − F2 und 2F2 − F1. Diese Intermodulationsprodukte 3. Ordnung liegen nahe an den Originalfrequenzen und können einen benachbarten HF-Kanal blockieren.';

  @override
  String get rfIm3QuickMode => 'Schnellmodus – 2 Frequenzen';

  @override
  String get rfIm3AdvancedMode => 'Erweiterter Modus – bis zu 16 Frequenzen';

  @override
  String rfIm3FrequencyN(int index) {
    return 'Häufigkeit $index';
  }

  @override
  String get rfIm3AddFrequency => 'Fügen Sie eine Frequenz hinzu';

  @override
  String get rfIm3Tips => 'Beratung vor Ort';

  @override
  String get rfIm3Tip1 =>
      'Verteilen Sie Ihre Frequenzen unregelmäßig. Regelmäßige Lücken generieren IM3s, die direkt auf Ihre Kanäle fallen.';

  @override
  String get rfIm3Tip2 =>
      'Erkennungstoleranz: ±200 kHz. Passen Sie es an die Bandbreite Ihrer Systeme an (typischerweise 200–400 kHz).';

  @override
  String get rfIm3Tip3 =>
      'Die Tools Shure Wireless Workbench, Sennheiser WSM und Audio-Technica Frequency Manager verfügen über eine IM3-Berechnung für ihre Reichweiten – verwenden Sie sie für die endgültige Bereitstellung.';

  @override
  String get rfIm3OutOfBand => 'Außerhalb des Bandes (< 0 MHz)';

  @override
  String get rfIm3ConflictOnFreq =>
      '⚠ Fällt auf eine verwendete Frequenz (±200 kHz)';

  @override
  String get rfIm3TableFormula => 'Formel';

  @override
  String get rfIm3TableFreqIm3 => 'IM3-Frequenz';

  @override
  String get rfIm3TableStatus => 'Status';

  @override
  String get rfIm3Footnote =>
      'IM3 = 2×Fi − Fj |    Konflikttoleranz: ±200 kHz\nNegative Produkte (außerhalb des Spektrums) werden angezeigt, stehen jedoch nicht in Konflikt.';

  @override
  String rfIm3Conflicts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'e',
      one: '',
    );
    return '$count Konflikt$_temp0';
  }

  @override
  String get rfScanLogTitle => 'RF-Scan-Protokoll';

  @override
  String get rfScanLogClearAll => 'Alles löschen';

  @override
  String get rfScanLogAdd => 'Hinzufügen';

  @override
  String get rfScanLogClearConfirmTitle => 'Protokoll löschen?';

  @override
  String get rfScanLogClearConfirmContent => 'Alle Einträge werden gelöscht.';

  @override
  String get rfScanLogCancel => 'Stornieren';

  @override
  String get rfScanLogDelete => 'Löschen';

  @override
  String get rfScanLogNewEntry => 'Neuer Eintrag';

  @override
  String get rfScanLogFrequency => 'Frequenz';

  @override
  String get rfScanLogOptionalLevel => 'Gemessener Füllstand (optional)';

  @override
  String get rfScanLogNote => 'Notiz';

  @override
  String get rfScanLogNoteHint => 'Beispiel: Kanal 36, Raum B, TV-Störung...';

  @override
  String get rfScanLogStatusLabel => 'Status:';

  @override
  String get rfScanLogSave => 'Speichern';

  @override
  String get rfScanLogEmptyTitle => 'Leeres Tagebuch';

  @override
  String get rfScanLogEmptyBody =>
      'Notieren Sie hier Ihre Feldmessungen: Frequenz, am Analysator gemessener Füllstand, Status und Kommentar.';

  @override
  String get rfScanLogFirstEntry => 'Erster Eintrag';

  @override
  String get rfScanLogStatusFree => 'Frei';

  @override
  String get rfScanLogStatusOccupied => 'Beschäftigt';

  @override
  String get rfScanLogStatusBorderline => 'Grenze';

  @override
  String get rfScanLogInstant => 'Im Augenblick';

  @override
  String rfScanLogMinutesAgo(int n) {
    return 'Vor $n Minuten';
  }

  @override
  String rfScanLogHoursAgo(int n) {
    return 'Vor $n Stunden';
  }

  @override
  String get rfScanLogFreePlural => 'Frei';

  @override
  String get rfScanLogOccupiedPlural => 'Beschäftigt';

  @override
  String get rfScanLogBorderlinePlural => 'Grenze.';

  @override
  String get rfScanLogTotal => 'Gesamt';

  @override
  String get rfUhfBandsTitle => 'UHF/VHF-Bänder';

  @override
  String get rfUhfBandsOverview => 'Übersicht – Frankreich';

  @override
  String get rfUhfBandsTips => 'Tipps zur Bandauswahl';

  @override
  String get rfUhfBandsSource =>
      'Quelle: ANFR / ARCEP – Französische Vorschriften.\nDie Regeln können je nach Land variieren.\nÜberprüfen Sie immer die Konformität Ihrer Ausrüstung.';

  @override
  String get rfUhfBand1Name => 'VHF Bas';

  @override
  String get rfUhfBand1Status => 'Limité';

  @override
  String get rfUhfBand1Desc =>
      'Ancienne bande TV analogique. Quelques systèmes HF utilisent cette plage. Moins commune en événementiel.';

  @override
  String get rfUhfBand1Examples =>
      'Certains anciens systèmes Sennheiser, Shure';

  @override
  String get rfUhfBand2Name => 'UHF — Bloc TV';

  @override
  String get rfUhfBand2Status => 'Pro (autorisation)';

  @override
  String get rfUhfBand2Desc =>
      'Principale bande pour micros HF professionnels en France. Partage avec la TNT. Requiert une autorisation ANFR pour usage commercial. Usage libre pour la production audiovisuelle sous conditions.';

  @override
  String get rfUhfBand2Examples =>
      'Shure Axient, Sennheiser 2000, Sony DWX, Audio-Technica 3000';

  @override
  String get rfUhfBand3Name => 'Dividende numérique';

  @override
  String get rfUhfBand3Status => 'INTERDIT';

  @override
  String get rfUhfBand3Desc =>
      'Bande allouée aux réseaux mobiles 4G/5G en France depuis 2017. Tout matériel sans-fil audio dans cette bande est illégal depuis cette date.';

  @override
  String get rfUhfBand4Name => 'ISM / SRD 863 MHz';

  @override
  String get rfUhfBand4Status => 'Libre (10 mW)';

  @override
  String get rfUhfBand4Desc =>
      'Bande libre en Europe (SRD — Short Range Device). Pas d\'autorisation requise. Limite de puissance : 10 mW ERP, 25 kHz de largeur de bande.';

  @override
  String get rfUhfBand4Examples =>
      'Certains systèmes d\'entrée de gamme, télécommandes';

  @override
  String get rfUhfBand5Name => 'DECT';

  @override
  String get rfUhfBand5Status => 'Libre (250 mW)';

  @override
  String get rfUhfBand5Desc =>
      'Standard dédié à la voix sans-fil. Pas d\'interférences avec WiFi/Bluetooth. Utilisé pour les systèmes de conférence, intercom et certains micros sans-fil.';

  @override
  String get rfUhfBand5Examples =>
      'Bosch CCS-800 Ultro, Sennheiser SpeechLine, Beyerdynamic Quinta';

  @override
  String get rfUhfBand6Name => 'Micro num. 2.4 GHz';

  @override
  String get rfUhfBand6Status => 'Libre (100 mW)';

  @override
  String get rfUhfBand6Desc =>
      'Bande ISM, libre sans autorisation. Sujette aux interférences WiFi et Bluetooth. Convient aux petites productions, éviter les grandes salles avec WiFi dense.';

  @override
  String get rfUhfBand6Examples =>
      'Shure GLX-D, Line6 XD-V, Sennheiser EW-D (variante 2.4G)';

  @override
  String get rfUhfBand7Name => 'Sans-fil 5.8 GHz';

  @override
  String get rfUhfBand7Status => 'Limité (FR)';

  @override
  String get rfUhfBand7Desc =>
      'Non disponible pour WiFi en France, mais certains systèmes propriétaires utilisent cette plage. Vérifier la conformité ARCEP de chaque équipement.';

  @override
  String get rfUhfBand7Examples => 'Certains systèmes IEM haut de gamme';

  @override
  String get rfUhfOverviewSublabel1 => 'VHF / transitoire';

  @override
  String get rfUhfOverviewSublabel2 => 'UHF pro (autorisation)';

  @override
  String get rfUhfOverviewSublabel3 => '4G/5G — INTERDIT';

  @override
  String get rfUhfOverviewSublabel4 => 'ISM libre';

  @override
  String get rfUhfOverviewSublabel5 => 'DECT libre';

  @override
  String get rfUhfOverviewSublabel6 => 'ISM (WiFi + micros num.)';

  @override
  String get rfUhfTip1 =>
      '470–694 MHz: optimal für professionelle Produktionen. Große Auswahl an Frequenzen, gutes HF-Verhalten. Melden Sie die Verwendung bei professionellen Veranstaltungen der ANFR an.';

  @override
  String get rfUhfTip2 =>
      'Stellen Sie sicher, dass sich Ihre Ausrüstung außerhalb des 694–790-MHz-Bands befindet. Alte, nicht weiterverkaufte Systeme nach 2017 sind auf der Bühne illegal.';

  @override
  String get rfUhfTip3 =>
      'DECT (1880–1900 MHz) ist ideal für Konferenzsysteme: dediziertes Band, keine WiFi/BT-Störungen.';

  @override
  String get rfUhfTip4 =>
      '2,4-GHz-Systeme sind praktisch, reagieren jedoch empfindlich auf dichte WLAN-Umgebungen. Vermeiden Sie große Konferenzräume.';

  @override
  String get rfLegendPro => 'Pro (Autorisierung)';

  @override
  String get rfLegendFree => 'Frei';

  @override
  String get rfLegendForbidden => 'Verboten';

  @override
  String get rfWifi24PageTitle => '2,4-GHz-WLAN';

  @override
  String get rfWifi24SpectrumTitle => '2,4-GHz-Spektrum – Überlappungen';

  @override
  String get rfWifi24SimulateTitle => 'Simulieren Sie das Zusammenleben';

  @override
  String get rfWifi24SelectChannels =>
      'Wählen Sie die in Ihrer Umgebung verwendeten Kanäle aus:';

  @override
  String get rfWifi24ConflictWarning =>
      '⚠️ Ausgewählte Kanäle überschneiden sich – es besteht die Gefahr einer gegenseitigen Beeinflussung.';

  @override
  String get rfWifi24ChannelTableTitle => 'Kanaltabelle';

  @override
  String get rfWifi24BestPractices => 'Best Practices';

  @override
  String get rfWifi24LegendNonOverlap => 'Nicht überlappender Kanal';

  @override
  String get rfWifi24LegendOk => 'OK ausgewählt';

  @override
  String get rfWifi24LegendConflict => 'Konflikt';

  @override
  String get rfWifi24HdrChannel => 'Kanal';

  @override
  String get rfWifi24HdrCenter => 'Center';

  @override
  String get rfWifi24HdrStart => 'Anfang';

  @override
  String get rfWifi24HdrEnd => 'ENDE';

  @override
  String get rfWifi24Tip1 =>
      'Verwenden Sie immer die Kanäle 1, 6 und 11 für 3 sich nicht überlappende WLAN-Netzwerke.';

  @override
  String get rfWifi24Tip2 =>
      'Bei 20-MHz-Kanälen sind auch die Kanäle 1, 5, 9 und 13 überlappungsfrei.';

  @override
  String get rfWifi24Tip3 =>
      '2,4-GHz-WLAN teilt sich das Band mit Bluetooth, Zigbee und 2,4-GHz-Digitalmikrofonen.';

  @override
  String get rfWifi24Tip4 =>
      'Bevorzugen Sie in dicht besiedelten Gebieten 5 GHz (weniger überlastet) für empfindliche Geräte.';

  @override
  String get rfWifi5PageTitle => '5GHz WLAN';

  @override
  String get rfWifi5RegulationTitle => 'Französische Vorschriften (ARCEP)';

  @override
  String get rfWifi5BandsAvailable => 'Bands verfügbar';

  @override
  String get rfWifi5Unii3Forbidden => 'UNII-3 (5725–5850)';

  @override
  String get rfWifi5ForbiddenLabel => 'Verboten';

  @override
  String get rfWifi5DfsNote =>
      '⚠️ DFS (Dynamic Frequency Selection): UNII-2A- und 2C-Kanäle erfordern eine Radarerkennung. Das Gerät kann den Kanal automatisch wechseln, wenn ein Radar erkannt wird.';

  @override
  String get rfWifi5ChannelWidthsTitle => 'Kanalbreiten';

  @override
  String get rfWifi5Bw20 => 'Maximale Kompatibilität, begrenzter Durchfluss';

  @override
  String get rfWifi5Bw40 => '2 verbundene Kanäle – 802.11n';

  @override
  String get rfWifi5Bw80 => '4 verbundene Kanäle – 802.11ac/ax';

  @override
  String get rfWifi5Bw160 => '8 verknüpfte Kanäle – nur 802.11ax';

  @override
  String get rfWifi5NonOverlapTitle =>
      'Nicht überlappende Kanäle bei 80 MHz (Frankreich)';

  @override
  String get rfWifi5NonOverlapFor3 =>
      'Für 3 nicht überlappende 80-MHz-Netze (Frankreich):';

  @override
  String get rfWifi5MaxNetworks =>
      '→ Bis zu 6 80-MHz-Netzwerke allein auf UNII-2C verfügbar.';

  @override
  String get rfWifi5ChannelsMhz => 'Kanäle (20 MHz)';

  @override
  String get rfWifi5ForbiddenFR => 'Verbotene FR';

  @override
  String get rfWifi5Indoor => 'Drinnen';

  @override
  String get rfWifiScanTitle => 'WLAN-Scan';

  @override
  String get rfWifiScanPlatformInfo =>
      'Aktives Scannen auf Android (Lokalisierungsberechtigung erforderlich). Unter iOS ist nur das verbundene Netzwerk sichtbar.';

  @override
  String get rfWifiScanStart => 'Starten Sie den Scan';

  @override
  String get rfWifiScanInProgress => 'Der Scanvorgang läuft…';

  @override
  String get rfWifiScanGroupedTooltip => 'Listenansicht';

  @override
  String get rfWifiScanFlatTooltip => 'Gruppenansicht';

  @override
  String get rfWifiScanNoResults =>
      'Starten Sie den Scan, um benachbarte Netzwerke anzuzeigen.';

  @override
  String get rfWifiScanOccupation => '2,4-GHz-Kanalbelegung';

  @override
  String get rfWifiScanNonOverlapNote =>
      'Fettgedruckte Kanäle (1, 6, 11) = nicht überlappend';

  @override
  String get rfWifiScanHidden => '(verstecktes Netzwerk)';

  @override
  String rfWifiScanNetworks24(int count) {
    return '$count Netzwerke';
  }

  @override
  String rfWifiScanNetworks5(int count) {
    return '$count Netzwerke';
  }

  @override
  String rfWifiScanTotal(int count) {
    return '$count insgesamt';
  }

  @override
  String get rfWifiScanSub24 => '2,4 GHz';

  @override
  String get rfWifiScanSub5 => '5GHz';

  @override
  String get rfWifiScanSubTotal => 'Netzwerke';

  @override
  String get rfWifiRssiExcellent => 'Exzellent';

  @override
  String get rfWifiRssiBon => 'Gut';

  @override
  String get rfWifiRssiMoyen => 'DURCHSCHNITT';

  @override
  String get rfWifiRssiFaible => 'Schwach';

  @override
  String get audioLevelInputDbu => 'Wert in dBu';

  @override
  String get audioLevelInputDbv => 'Wert in dBV';

  @override
  String get audioLevelInputVrms => 'RMS-Spannung';

  @override
  String get audioLevelDbfsNote =>
      '* dBFS relativ zu +24 dBu = 0 dBFS (typischer Wert – variiert je nach System)';

  @override
  String get audioGainStagingTip1 =>
      'Streben Sie auf jeder Stufe einen Nennwert von +4 dBu an. Halten Sie vor dem Clip einen Headroom von ca. 18 dB ein.';

  @override
  String get audioGainStagingTip2 =>
      'Der Unterschied zwischen Verbraucher und Profi (+4 dBu gegenüber −10 dBV) beträgt ~11,8 dB – kompensieren Sie die Verstärkung an jeder Schnittstelle.';

  @override
  String get audioGainStagingTip3 =>
      'Symmetrische Leitung (XLR): +4 dBu. Unsymmetrische Leitung (TS-Buchse): −10 dBV. DI-Box zur Anpassung von Impedanz und Pegel.';

  @override
  String get audioGainStagingTip4 =>
      'dBu = dB bezogen auf 0,775 V (600 Ω). dBV = dB relativ zu 1 V. dBV = dBu − 2,218.';

  @override
  String get audioDiffTipEqual =>
      'Nahezu gleiche Quellen: Verstärkung von ~+3 dB bei der stärksten Quelle.';

  @override
  String audioDiffTipSmall(String diff) {
    return 'Unterschied in $diff dB: Der niedrigste trägt wenig bei.';
  }

  @override
  String audioDiffTipMedium(String diff, String gain) {
    return 'Differenz von $diff dB: Verstärkung auf ~$gain dB an der dominanten Quelle begrenzt.';
  }

  @override
  String get audioDiffTipLarge =>
      'Differenz > 10 dB: Die schwache Quelle ist vernachlässigbar. Verstärkung ≈ +0 dB.';

  @override
  String get audioIncoherentShortLabel => 'Incoh. :';

  @override
  String get audioCoherentShortLabel => 'Kohärent. :';

  @override
  String audioAtDistance(String dist) {
    return 'Bei $dist m';
  }

  @override
  String get rfWifiScanErrLocationRequired =>
      'Für das WLAN-Scannen ist eine Standortgenehmigung erforderlich.';

  @override
  String get rfWifiScanErrLocationDenied =>
      'Standortberechtigung verweigert. Aktivieren Sie es in den Einstellungen.';

  @override
  String get rfWifiScanErrLocationDisabled =>
      'Standortdienst deaktiviert. Aktivieren Sie es auf dem Gerät.';

  @override
  String get rfWifiScanErrNotSupported =>
      'WiFi-Scan wird auf diesem Gerät oder dieser Betriebssystemversion nicht unterstützt.';

  @override
  String get rfWifiScanErrFailed => 'Der Scan kann nicht gestartet werden.';

  @override
  String get rfWifiScanErrDefault =>
      'Auf diesem Gerät kann nicht gescannt werden.';

  @override
  String get rfWifiScanErrReadResults =>
      'Scan-Ergebnisse können nicht gelesen werden.';

  @override
  String rfWifiScanErrGeneric(String error) {
    return 'Fehler beim Scannen: $error';
  }

  @override
  String get homeNetworkTitle => 'Netzwerk';

  @override
  String get homeNetworkSubtitle =>
      'Lokaler Netzwerkscan, Art-Net, sACN / E1.31.';

  @override
  String get networkPageTitle => 'Netzwerk';

  @override
  String get networkScanCardTitle => 'Netzwerkscan';

  @override
  String get networkScanCardSubtitle =>
      'Erkennen Sie aktive Geräte im lokalen Netzwerk.';

  @override
  String get networkArtNetCardTitle => 'Visualisierer Art-Net';

  @override
  String get networkArtNetAddressingTitle => 'Art-Net-Adressierung';

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
      'Gültige Werte eingeben, um das Ergebnis zu sehen.';

  @override
  String get networkArtNetFormulaNote =>
      'Port-Address (15 Bit) = (Net << 8) | (Sub-Net << 4) | Universe — Net 0-127, Sub-Net 0-15, Universe 0-15, Port-Address 0-32767 (Art-Net-4-Spezifikation).';

  @override
  String get networkArtNetCardSubtitle =>
      'Abhören und Analysieren von ArtDMX-Paketen in Echtzeit.';

  @override
  String get networkSacnCardTitle => 'Visualizer sACN / E1.31';

  @override
  String get networkSacnCardSubtitle =>
      'Abhören und Analysieren von sACN / E1.31-Paketen in Echtzeit.';

  @override
  String get networkComingSoon => 'Zukunft';

  @override
  String get networkFutureLuminex => 'Überwachung Luminex';

  @override
  String get networkFutureMaNet => 'MA-Net Erkennung';

  @override
  String get networkFutureAlarms => 'Netzwerkalarme';

  @override
  String get networkFutureSnapshots => 'Netzwerk-Snapshots';

  @override
  String get networkFutureExport => 'PDF / CSV exportieren';

  @override
  String get networkScanTitle => 'Netzwerkscan';

  @override
  String get networkPoeTitle => 'PoE-Rechner';

  @override
  String get networkFiberTitle => 'Glasfaser-Streckenbudget';

  @override
  String get networkSubnetTitle => 'Subnetz-Rechner';

  @override
  String get networkSubnetIpLabel => 'IP-Adresse';

  @override
  String get networkSubnetPrefixLabel => 'Präfix (CIDR)';

  @override
  String get networkSubnetNetworkLabel => 'Netzwerkadresse';

  @override
  String get networkSubnetBroadcastLabel => 'Broadcast-Adresse';

  @override
  String get networkSubnetNetmaskLabel => 'Subnetzmaske';

  @override
  String get networkSubnetWildcardLabel => 'Wildcard-Maske';

  @override
  String get networkSubnetFirstHostLabel => 'Erste nutzbare IP';

  @override
  String get networkSubnetLastHostLabel => 'Letzte nutzbare IP';

  @override
  String get networkSubnetHostCountLabel => 'Nutzbare Hosts';

  @override
  String get networkSubnetInvalidIp =>
      'Ungültige IP-Adresse (erwartetes Format: 192.168.1.0)';

  @override
  String get networkSubnetDivideTitle => 'In gleiche Subnetze aufteilen';

  @override
  String get networkSubnetDivideNote =>
      'Wähle, in wie viele Subnetze dieses Netzwerk aufgeteilt werden soll.';

  @override
  String get networkFiberTypeLabel => 'Fasertyp';

  @override
  String get networkFiberDistanceLabel => 'Distanz';

  @override
  String get networkFiberAttenuationLabel => 'Dämpfung (pro km)';

  @override
  String get networkFiberAdditionalLossLabel => 'Stecker- & Spleißverluste';

  @override
  String get networkFiberBudgetLabel => 'Transceiver-Streckenbudget (optional)';

  @override
  String get networkFiberTotalTitle => 'Gesamtverlust der Strecke';

  @override
  String get networkFiberMarginLabel => 'Verbleibende Marge';

  @override
  String get networkFiberWarningOver =>
      'Marge überschritten: die Strecke funktioniert über diese Distanz möglicherweise nicht zuverlässig.';

  @override
  String get networkFiberFormulaNote =>
      'Gesamtverlust = Dämpfung × Distanz + Stecker-/Spleißverluste';

  @override
  String get networkPoeBudgetLabel => 'Injektor-/Switch-Budget';

  @override
  String get networkPoeDeviceLabel => 'Gerät';

  @override
  String get networkPoeClassLabel => 'PoE-Klasse';

  @override
  String get networkPoeClassManual => 'Manuell (freier Wert)';

  @override
  String get networkPoeClassWord => 'Klasse';

  @override
  String get networkPoeDevicePowerLabel => 'Leistung';

  @override
  String get networkPoeAddDevice => 'Gerät hinzufügen';

  @override
  String get networkPoeTotalTitle => 'Gesamtverbrauch';

  @override
  String get networkPoeRemainingLabel => 'Verbleibendes Budget';

  @override
  String get networkPoeEmptyState =>
      'Füge mindestens ein Gerät hinzu, um zu berechnen.';

  @override
  String get networkPoeWarningOver =>
      'Budget überschritten: Entferne Geräte oder nutze einen leistungsstärkeren Switch/Injektor.';

  @override
  String get networkPoeFormulaNote =>
      'Gesamtverbrauch = Summe der Geräte. Plane ca. 10-20 % Marge unter dem Gesamtbudget ein.';

  @override
  String get networkScanStartButton => 'Starten Sie den Scan';

  @override
  String get networkScanStopButton => 'Stoppen Sie den Scanvorgang';

  @override
  String get networkScanScanning => 'Der Scanvorgang läuft…';

  @override
  String networkScanProgress(int done, int total) {
    return '$done / $total IPs gescannt';
  }

  @override
  String networkScanDevicesFound(int count) {
    return '$count Gerät(e) gefunden';
  }

  @override
  String get networkScanNoDevicesFound =>
      'In diesem Netzwerk wurden keine Geräte gefunden.';

  @override
  String get networkScanNoNetwork =>
      'Kein lokales Netzwerk (WLAN) erkannt. Stellen Sie eine Verbindung zu einem Netzwerk her.';

  @override
  String get networkScanIosLimitation =>
      'Unter iOS sind MAC-Adressen und Hersteller für Apps nicht zugänglich (Apple-Einschränkung).';

  @override
  String get networkScanLocalIp => 'Lokale IP';

  @override
  String get networkScanSubnet => 'Maske';

  @override
  String get networkScanStatusOnline => 'Online';

  @override
  String networkScanResponseMs(int ms) {
    return '$ms ms';
  }

  @override
  String get networkScanPermissionDenied =>
      'Netzwerkberechtigung verweigert. Überprüfen Sie die Berechtigungen.';

  @override
  String get networkScanErrorGeneric =>
      'Netzwerkfehler. Überprüfen Sie Ihre Verbindung.';

  @override
  String get networkScanHint =>
      'Tippen Sie auf „Scan starten“, um Geräte zu erkennen.';

  @override
  String get artnetTitle => 'Visualisierer Art-Net';

  @override
  String get artnetStartButton => 'Fangen Sie an zuzuhören';

  @override
  String get artnetStopButton => 'Stoppen';

  @override
  String get artnetListening => 'Zuhören – Port 6454';

  @override
  String get artnetNotListening => 'Inaktiv';

  @override
  String get artnetNoPackets => 'Warten auf Art-Net Pakete…';

  @override
  String get artnetUniversesTitle => 'Universum erhalten';

  @override
  String artnetUniverseTitle(int universe) {
    return 'Universum $universe';
  }

  @override
  String artnetSourceIp(Object ip) {
    return 'Quelle: $ip';
  }

  @override
  String artnetPackets(int count) {
    return '$count Pakete';
  }

  @override
  String artnetFps(Object fps) {
    return '$fps fps';
  }

  @override
  String get artnetShowActiveOnly => 'Nur aktive Kanäle';

  @override
  String artnetActiveCount(int count) {
    return '$count aktive Kanäle';
  }

  @override
  String get artnetPlatformInfo =>
      'Art-Net – UDP-Port 6454. Muss sich im selben Netzwerk wie die Quelle befinden.';

  @override
  String get artnetErrorBind =>
      'UDP-Socket kann nicht geöffnet werden. Überprüfen Sie die Netzwerkberechtigungen.';

  @override
  String get sacnTitle => 'Visualisierer sACN';

  @override
  String get sacnStartButton => 'Fangen Sie an zuzuhören';

  @override
  String get sacnStopButton => 'Stoppen';

  @override
  String get sacnListening => 'Zuhören – Port 5568';

  @override
  String get sacnNotListening => 'Inaktiv';

  @override
  String get sacnNoPackets => 'Warten auf sACN Pakete…';

  @override
  String get sacnUniversesTitle => 'Universum erhalten';

  @override
  String sacnUniverseTitle(int universe) {
    return 'Universum $universe';
  }

  @override
  String sacnSource(Object name) {
    return 'Quelle: $name';
  }

  @override
  String sacnPriority(int value) {
    return 'Priorität: $value';
  }

  @override
  String sacnCid(Object cid) {
    return 'CID: $cid';
  }

  @override
  String sacnPackets(int count) {
    return '$count Pakete';
  }

  @override
  String sacnFps(Object fps) {
    return '$fps fps';
  }

  @override
  String get sacnShowActiveOnly => 'Nur aktive Kanäle';

  @override
  String sacnActiveCount(int count) {
    return '$count aktive Kanäle';
  }

  @override
  String get sacnPlatformInfo =>
      'sACN / E1.31 – UDP-Port 5568. Multicast 239.255.x.x und Unicast werden unterstützt.';

  @override
  String get sacnErrorBind =>
      'UDP-Socket kann nicht geöffnet werden. Überprüfen Sie die Netzwerkberechtigungen.';

  @override
  String get sacnIosMulticastNote =>
      'Unter iOS 14+ erfordert sACN Multicast möglicherweise eine lokale Netzwerkzugriffsberechtigung.';

  @override
  String get diagCardTitle => 'Netzwerkdiagnose';

  @override
  String get diagCardSubtitle =>
      'Automatische Netzwerkanalyse, Art-Net und sACN.';

  @override
  String get diagPageTitle => 'Netzwerkdiagnose';

  @override
  String get diagPlatformInfo =>
      'Führen Sie einen Netzwerkscan durch, hören Sie einige Sekunden lang auf Art-Net/sACN und suchen Sie dann nach potenziellen Problemen.';

  @override
  String get diagAnalyseButton => 'Analysieren';

  @override
  String get diagCancelButton => 'Stornieren';

  @override
  String get diagClearButton => 'Löschen';

  @override
  String get diagSnapshotButton => 'Schnappschuss';

  @override
  String get diagScoreLabel => 'Netzwerkgesundheitsbewertung';

  @override
  String get diagStatusOk => 'Netzwerk OK';

  @override
  String get diagStatusWarning => 'Aufmerksamkeit';

  @override
  String get diagStatusCritical => 'Kritisch';

  @override
  String diagAnalysisDate(Object date) {
    return 'Analysiert am $date';
  }

  @override
  String get diagSeverityInfo => 'Information';

  @override
  String get diagSeverityWarning => 'Warnung';

  @override
  String get diagSeverityCritical => 'Kritisch';

  @override
  String get diagScanningNetwork => 'Netzwerkscan läuft...';

  @override
  String get diagCollectingFlux => 'Sammlung der Flüsse Art-Net / sACN…';

  @override
  String get diagAnalyzing => 'Analyse läuft…';

  @override
  String diagScanProgress(int done, int total) {
    return '$done / $total IPs gescannt';
  }

  @override
  String get diagNoResultYet =>
      'Drücken Sie „Scan“, um die Netzwerkdiagnose zu starten.';

  @override
  String get diagAlertsTitle => 'Warnungen';

  @override
  String get diagNoAlerts => 'Keine Warnungen erkannt – gesundes Netzwerk.';

  @override
  String get diagSnapshotSaved => 'Schnappschuss gespeichert.';

  @override
  String get diagNoLocalIp =>
      'Keine lokale IP-Adresse erkannt oder ungültige Adresse.';

  @override
  String get diagNoDevices => 'Im Netzwerk wurden keine Geräte erkannt.';

  @override
  String get diagNoArtNet => 'Keine Art-Net Streams empfangen.';

  @override
  String get diagNoSacn => 'Keine sACN / E1.31-Streams empfangen.';

  @override
  String diagDuplicateIp(Object ip) {
    return 'Doppelte IP-Adresse erkannt: $ip.';
  }

  @override
  String diagArtNetLowFps(int universe, Object fps) {
    return 'Art-Net Universum $universe: Niedrige FPS ($fps fps).';
  }

  @override
  String diagSacnLowFps(int universe, Object fps) {
    return 'sACN Universum $universe: Niedrige FPS ($fps fps).';
  }

  @override
  String diagZeroDmxChannels(Object protocol, int universe) {
    return '$protocol Universum $universe: aktiver Fluss, aber alle DMX Kanäle sind auf Null.';
  }

  @override
  String diagManyUnknownDevices(int count) {
    return '$count unbenannte Geräte im Netzwerk erkannt.';
  }

  @override
  String get ndiCardTitle => 'Entdeckung NDI';

  @override
  String get ndiCardSubtitle => 'Quellen NDI / NewTek im Netzwerk über mDNS.';

  @override
  String get ndiPageTitle => 'Entdeckung NDI';

  @override
  String get ndiStartButton => 'Zum Starten';

  @override
  String get ndiStopButton => 'Stoppen';

  @override
  String get ndiDiscovering => 'Forschung läuft…';

  @override
  String get ndiHint =>
      'Drücken Sie „Start“, um im Netzwerk nach NDI-Quellen zu suchen.';

  @override
  String get ndiNoSources =>
      'In diesem Netzwerk wurden keine NDI-Quellen gefunden.';

  @override
  String get ndiIosNote =>
      'Unter iOS kann die mDNS-Erkennung je nach Netzwerkkonfiguration eingeschränkt sein.';

  @override
  String ndiSourcesFound(int count) {
    return '$count Quelle(n) NDI gefunden';
  }

  @override
  String get ndiLabelName => 'Quelle';

  @override
  String get ndiLabelHost => 'Maschine';

  @override
  String get ndiLabelIp => 'IP';

  @override
  String get ndiLabelPort => 'Hafen';

  @override
  String get ndiLabelService => 'Service';

  @override
  String get snapshotCardTitle => 'Netzwerk-Snapshots';

  @override
  String get snapshotCardSubtitle =>
      'Erfassen und vergleichen Sie den Netzwerkstatus zu verschiedenen Zeiten.';

  @override
  String get snapshotPageTitle => 'Netzwerk-Snapshots';

  @override
  String get snapshotEmpty => 'Keine Schnappschüsse gespeichert.';

  @override
  String get snapshotDeleteConfirm => 'Diesen Schnappschuss löschen?';

  @override
  String get snapshotDeleteButton => 'LÖSCHEN';

  @override
  String get snapshotCompareButton => 'Vergleichen';

  @override
  String get snapshotComparisonTitle => 'Vergleich';

  @override
  String get snapshotComparisonSelectTwo =>
      'Wählen Sie zwei Schnappschüsse zum Vergleich aus.';

  @override
  String get snapshotSnapshotA => 'Schnappschuss A';

  @override
  String get snapshotSnapshotB => 'Schnappschuss B';

  @override
  String get snapshotDevices => 'Geräte';

  @override
  String get snapshotArtnetUniverses => 'Universum Art-Net';

  @override
  String get snapshotSacnUniverses => 'Universum sACN';

  @override
  String get snapshotNdiSources => 'Quellen NDI';

  @override
  String get snapshotAlerts => 'Warnungen';

  @override
  String get snapshotAdded => 'Erschien';

  @override
  String get snapshotRemoved => 'Verschwunden';

  @override
  String get snapshotNoChanges =>
      'Kein Unterschied zwischen den beiden Schnappschüssen.';

  @override
  String get snapshotNoScore => 'Partitur nicht verfügbar';

  @override
  String get subscriptionCategoryNetworkTitle => 'Pro-Netzwerk';

  @override
  String get subscriptionCategoryNetworkDescription =>
      'Erweiterte Netzwerk-Tools: Art-Net, sACN, NDI, Diagnose und Snapshots.';

  @override
  String get subscriptionHeadlineNetworkSubtitle =>
      'Schaltet Art-Net Viewer, sACN Viewer, NDI, Netzwerkdiagnose und Snapshots frei.';

  @override
  String get networkPremiumLabel => 'PRÄMIE';

  @override
  String get networkPremiumUnlockButton => 'Entsperren';

  @override
  String get networkPremiumBannerText =>
      'Für Art-Net, sACN, NDI, Diagnose und Snapshots ist ein Pro Network-Abonnement erforderlich.';

  @override
  String get subscriptionCategoryNetworkShort => 'NETZWERK';

  @override
  String get dashboardPageTitle => 'Netzwerk-Dashboard';

  @override
  String get dashboardCardTitle => 'Netzwerk-Dashboard';

  @override
  String get dashboardCardSubtitle => 'Netzwerkansicht in Echtzeit';

  @override
  String get dashboardStatusIdle => 'In der Warteschleife';

  @override
  String get dashboardStatusScanning => 'Der Scanvorgang läuft…';

  @override
  String get dashboardStatusCompleted => 'Scan abgeschlossen';

  @override
  String get dashboardStatusError => 'Netzwerkfehler';

  @override
  String get dashboardStatusListening => 'Aktives Zuhören';

  @override
  String get dashboardKpiDevices => 'Geräte';

  @override
  String get dashboardKpiArtnet => 'Art-Net';

  @override
  String get dashboardKpiSacn => 'sACN';

  @override
  String get dashboardKpiNdi => 'NDI';

  @override
  String get dashboardKpiScore => 'Punktzahl';

  @override
  String get dashboardNoScore => '–';

  @override
  String get dashboardSectionAlerts => 'Aktive Warnungen';

  @override
  String get dashboardNoAlerts => 'Keine aktive Warnung';

  @override
  String get dashboardSectionSnapshot => 'Letzter Schnappschuss';

  @override
  String get dashboardNoSnapshot => 'Keine Schnappschüsse gespeichert';

  @override
  String get dashboardSectionQuickAccess => 'Schneller Zugriff';

  @override
  String get dashboardRescanButton => 'Erneut scannen';

  @override
  String get dashboardNdiRefreshButton => 'Update NDI';

  @override
  String get dashboardArtnetActive => 'Art-Net aktiv';

  @override
  String get dashboardSacnActive => 'sACN aktiv';

  @override
  String get dashboardNdiScanning => 'Entdeckung NDI…';

  @override
  String dashboardAlertNewDevice(Object ip) {
    return 'Neues Gerät: $ip';
  }

  @override
  String dashboardAlertLostDevice(Object ip) {
    return 'Gerät fehlt: $ip';
  }

  @override
  String dashboardAlertNewArtnetUniverse(int universe) {
    return 'Neues Universum Art-Net: $universe';
  }

  @override
  String dashboardAlertLostArtnetUniverse(int universe) {
    return 'Universum Art-Net verschwunden: $universe';
  }

  @override
  String dashboardAlertNewSacnUniverse(int universe) {
    return 'Neues Universum sACN: $universe';
  }

  @override
  String dashboardAlertLostSacnUniverse(int universe) {
    return 'Universum sACN verschwunden: $universe';
  }

  @override
  String dashboardAlertNewNdiSource(Object name) {
    return 'Neue Quelle NDI: $name';
  }

  @override
  String dashboardAlertLostNdiSource(Object name) {
    return 'Quelle NDI verschwunden: $name';
  }

  @override
  String dashboardAlertArtnetLowFps(int universe, Object fps) {
    return 'Art-Net U$universe: Niedrige FPS ($fps)';
  }

  @override
  String dashboardAlertSacnLowFps(int universe, Object fps) {
    return 'sACN U$universe: Niedrige FPS ($fps)';
  }

  @override
  String dashboardAlertSacnDuplicate(int universe, int count) {
    return 'sACN U$universe: $count aktive Quellen';
  }

  @override
  String dashboardAlertSacnPriority(int universe) {
    return 'sACN U$universe: Prioritätskonflikt';
  }

  @override
  String dashboardScanProgress(int progress) {
    return 'Netzwerkscan: $progress%';
  }

  @override
  String get luminexPageTitle => 'Luminex Monitor';

  @override
  String get luminexMonitorCardTitle => 'Luminex Monitor';

  @override
  String get luminexMonitorCardSubtitle => 'Überwachungsschalter GigaCore';

  @override
  String get luminexAddDevice => 'Ausrüstung hinzufügen';

  @override
  String get luminexAddDeviceTitle => 'IP-Adresse des Switches';

  @override
  String get luminexAddDeviceHint => '192.168.x.x';

  @override
  String get luminexAddDeviceConfirm => 'Hinzufügen';

  @override
  String get luminexAddDeviceCancel => 'Stornieren';

  @override
  String get luminexNoDevices => 'Kein Schalter Luminex';

  @override
  String get luminexNoDevicesHint =>
      'Fügen Sie manuell eine IP hinzu oder führen Sie einen Netzwerkscan durch.';

  @override
  String get luminexRefreshAll => 'Alles aktualisieren';

  @override
  String get luminexRemoveDevice => 'Zurückziehen';

  @override
  String get luminexScanForDevices => 'Durchsuchen Sie das Netzwerk';

  @override
  String get luminexReachable => 'Zugänglich';

  @override
  String get luminexUnreachable => 'Unzugänglich';

  @override
  String get luminexPolling => 'Frage…';

  @override
  String get luminexNoAlarms => 'Kein Alarm';

  @override
  String get luminexSectionSystem => 'Systeminformationen';

  @override
  String get luminexSectionPorts => 'Häfen';

  @override
  String get luminexSectionAlarms => 'Aktive Alarme';

  @override
  String get luminexLabelName => 'Name';

  @override
  String get luminexLabelModel => 'Modell';

  @override
  String get luminexLabelFirmware => 'Firmware';

  @override
  String get luminexLabelUptime => 'Betriebszeit';

  @override
  String get luminexLabelTemperature => 'Temperatur';

  @override
  String get luminexLabelPsu => 'Essen';

  @override
  String get luminexPsuOk => 'Okay';

  @override
  String get luminexPsuAbsent => 'Abwesend';

  @override
  String get luminexLabelApi => 'API';

  @override
  String get luminexGen1 => 'Gen 1 (Text)';

  @override
  String get luminexGen2 => 'Gen 2 (JSON)';

  @override
  String get luminexGenUnknown => 'Unbekannt';

  @override
  String get luminexPortUp => 'Aktiv';

  @override
  String get luminexPortDown => 'Inaktiv';

  @override
  String get luminexPortUnknown => 'Unbekannt';

  @override
  String get luminexPortPoeActive => 'PoE aktiv';

  @override
  String get luminexPortPoeFault => 'PoE Standard';

  @override
  String get luminexPortPoeOff => 'PoE inaktiv';

  @override
  String get luminexPortNoPoe => 'Ohne PoE';

  @override
  String get luminexDetectedScan => 'Netzwerkscan';

  @override
  String get luminexDetectedManual => 'Manuelle Zugabe';

  @override
  String get luminexNotAvailable => 'N / A';

  @override
  String get luminexAlarmInaccessible => 'Schalter nicht zugänglich';

  @override
  String get luminexAlarmPsuAbsent => 'Keine Stromversorgung';

  @override
  String luminexAlarmCount(int count) {
    return '$count aktive(r) Alarm(e)';
  }

  @override
  String luminexPortSpeed(int speed) {
    return '$speed Mbit/s';
  }

  @override
  String luminexPortRxErrors(int count) {
    return 'RX: $count Fehler.';
  }

  @override
  String luminexPortTxErrors(int count) {
    return 'TX: $count Fehler.';
  }

  @override
  String luminexAlarmPortDown(int port) {
    return 'Port $port offline';
  }

  @override
  String luminexAlarmSpeedDegraded(int port, int speed) {
    return 'Port $port: verringerte Geschwindigkeit ($speed Mbit/s)';
  }

  @override
  String luminexAlarmHighRxErrors(int port, int count) {
    return 'Port $port: Hohe RX-Fehler ($count)';
  }

  @override
  String luminexAlarmHighTxErrors(int port, int count) {
    return 'Port $port: hohe TX-Fehler ($count)';
  }

  @override
  String luminexAlarmPoeFault(int port) {
    return 'Port $port: Standard PoE';
  }

  @override
  String luminexAlarmHighTemp(Object temp) {
    return 'Hohe Temperatur: $temp°C';
  }

  @override
  String get manetPageTitle => 'MA-Net Monitor';

  @override
  String get manetMonitorCardTitle => 'MA-Net Monitor';

  @override
  String get manetMonitorCardSubtitle => 'Knotenerkennung grandMA2/3';

  @override
  String get manetNoNodes => 'Keine MA-Net Knoten erkannt';

  @override
  String get manetListening => 'Anhören läuft...';

  @override
  String get manetNodeType => 'Art';

  @override
  String get manetFirmware => 'Firmware';

  @override
  String get manetMac => 'MAC-Adresse';

  @override
  String get manetLastSeen => 'Gesehen gibt es';

  @override
  String get manetProtocol => 'MA-Net';

  @override
  String get manetProtocolMaNet2 => 'MA-Net2';

  @override
  String get manetProtocolMaNet3 => 'MA-Net3';

  @override
  String get manetEmptyHint =>
      'Stellen Sie sicher, dass Sie sich im selben Netzwerk befinden wie die MA Lighting-Geräte';

  @override
  String manetNodeCount(int count) {
    return '$count Knoten online';
  }

  @override
  String manetPortListening(int port) {
    return 'UDP:$port';
  }

  @override
  String get helpPageTitle => 'Netzwerk-Tools-Handbuch';

  @override
  String get helpIntro =>
      'Alle Tools funktionieren schreibgeschützt in Ihrem lokalen Netzwerk. Tippen Sie auf ein Werkzeug, um die Details anzuzeigen.';

  @override
  String get helpSectionDoes => 'Was es bewirkt';

  @override
  String get helpSectionDelay => 'Zeitlimit';

  @override
  String get helpSectionLimits => 'Was es nicht tut';

  @override
  String get helpSectionTip => 'Beratung';

  @override
  String get helpGeneralTitle => 'Allgemeine Ratschläge';

  @override
  String get helpGeneralSubnet =>
      'Alle Tools arbeiten im lokalen /24-Subnetz. Geräte in einem anderen VLAN oder hinter einem Router werden nicht erkannt.';

  @override
  String get helpGeneralFirewall =>
      'Software-Firewalls blockieren möglicherweise einige Sonden. Überprüfen Sie bei fehlender Ausrüstung die Filterregeln.';

  @override
  String get helpGeneralWifi =>
      'WiFi-Netzwerke mit Erkennung von Client-Isolationsblöcken. Bevorzugen Sie eine Kabelverbindung oder WLAN im Bridge-Modus.';

  @override
  String get helpToolScanDoes =>
      'Scannt das /24-Subnetz parallel und identifiziert aktive Geräte. Zeigt aktuelle IP, Hostnamen, Hersteller (über OUI MAC) und offene Ports.';

  @override
  String get helpToolScanDelay =>
      '15 bis 30 Sekunden, abhängig von der Netzwerkgröße. 50 gleichzeitige Sonden.';

  @override
  String get helpToolScanLimits =>
      'Überquert keine VLANs oder Router. Führt keinen vollständigen Port-Scan oder WAN-Scan durch.';

  @override
  String get helpToolScanTip =>
      'Wenn keine Geräte angezeigt werden, überprüfen Sie, ob Ihre Firewall eingehende TCP/ICMP-Probes blockiert.';

  @override
  String get helpToolDashboardDoes =>
      'Zeigt den Status erkannter Geräte in Echtzeit an: Verfügbarkeit, Latenz, aktive Netzwerkwarnungen.';

  @override
  String get helpToolDashboardDelay =>
      'Alle 30 Sekunden aktualisiert. Erstes sofortiges Laden nach dem Scannen.';

  @override
  String get helpToolDashboardLimits =>
      'Der Verlauf zwischen den Sitzungen wird nicht gespeichert. Erfordert einen vorherigen Scan, um die Ausrüstungsliste zu füllen.';

  @override
  String get helpToolDashboardTip =>
      'Führen Sie vor dem Öffnen des Dashboards einen Netzwerkscan durch, um alle verfügbaren Geräte anzuzeigen.';

  @override
  String get helpToolArtNetDoes =>
      'Hört passiv auf Art-Net (UDP 6454)-Pakete und zeigt aktive DMX-Universen mit ihren Echtzeitwerten an.';

  @override
  String get helpToolArtNetDelay =>
      'Echtzeit – Daten erscheinen in weniger als einer Sekunde nach Empfang des Pakets.';

  @override
  String get helpToolArtNetLimits =>
      'Keine DMX-Ausgabe. Konfiguriert keine Art-Net-Knoten und verwaltet nicht das RDM-Protokoll.';

  @override
  String get helpToolArtNetTip =>
      'Art-Net durchquert keine Router. Alle Geräte müssen sich im selben L2-Netzwerk befinden (gleicher Switch oder gleiches Segment).';

  @override
  String get helpToolSacnDoes =>
      'Hört sACN/E1.31 (UDP 5568) Multicast-Streams und zeigt aktive Universen, Quellprioritäten und DMX-Werte an.';

  @override
  String get helpToolSacnDelay => 'Echtzeit – Latenz weniger als eine Sekunde.';

  @override
  String get helpToolSacnLimits =>
      'Keine DMX-Ausgabe. Ändert nicht die Prioritäten oder Konfiguration von sACN-Quellen.';

  @override
  String get helpToolSacnTip =>
      'sACN Multicast erfordert einen verwalteten Switch mit aktiviertem IGMP-Snooping, um Broadcast-Stürme im Netzwerk zu vermeiden.';

  @override
  String get helpToolNdiDoes =>
      'Erkennt NDI-Videoquellen im LAN über das NDI-Erkennungsprotokoll. Zeigt den Namen, die IP-Adresse und den Typ jeder Quelle an.';

  @override
  String get helpToolNdiDelay =>
      'Quellen erscheinen zwischen 5 und 15 Sekunden nach der Verbindung mit dem Netzwerk.';

  @override
  String get helpToolNdiLimits =>
      'Keine Videowiedergabe oder NDI-Routing. Erkennt keine NDI|HX-Quellen ohne aktive mDNS-Erkennung.';

  @override
  String get helpToolNdiTip =>
      'NDI erfordert mindestens 100 Mbit/s pro Stream. Vermeiden Sie WLAN für die Produktion – bevorzugen Sie eine kabelgebundene Gigabit-Verbindung.';

  @override
  String get helpToolDiagDoes =>
      'Führt eine Reihe von Netzwerkzustandstests durch: Konnektivität, DNS-Auflösung, Latenz, Paketverlust und Dienstverfügbarkeit.';

  @override
  String get helpToolDiagDelay =>
      'Vollständige Diagnose in 20 bis 30 Sekunden.';

  @override
  String get helpToolDiagLimits =>
      'Nur Diagnose – keine automatischen Reparaturen, keine Konfigurationsänderungen.';

  @override
  String get helpToolDiagTip =>
      'Führen Sie vor und nach einem Netzwerkeingriff eine Diagnose durch, um den Status zu vergleichen und Regressionen schnell zu isolieren.';

  @override
  String get helpToolSnapshotDoes =>
      'Erfasst den Zustand des Netzwerks zu einem bestimmten Zeitpunkt (Geräte, Dienste) und ermöglicht den Vergleich zweier Schnappschüsse, um Änderungen zu identifizieren.';

  @override
  String get helpToolSnapshotDelay =>
      'Je nach Netzwerkgröße dauert die Erfassung 30 bis 45 Sekunden.';

  @override
  String get helpToolSnapshotLimits =>
      'Keine kontinuierliche Überwachung oder automatische Warnungen. Der Verlauf wird nur auf diesem Gerät gespeichert.';

  @override
  String get helpToolSnapshotTip =>
      'Ideal zur Dokumentation des Zustandes vor/nach einer Infrastrukturänderung oder zur Eingrenzung einer Regression bei der Fehlerbehebung.';

  @override
  String get helpToolLuminexDoes =>
      'Fragt GigaCore Luminex Switches über ihre HTTP-API ab. Zeigt den Portstatus (Verbindung, Geschwindigkeit, PoE, Fehler), Temperatur, Netzteile an und löst Alarme aus.';

  @override
  String get helpToolLuminexDelay =>
      'Umfrage alle 30 Sekunden. Automatische Erkennung im Subnetz: 15 bis 30 Sekunden.';

  @override
  String get helpToolLuminexLimits =>
      'Nur lesen. Keine Änderungen an der VLAN-, Gruppen- oder Portkonfiguration. Unterstützt kein MA-Net- oder NDI-Video.';

  @override
  String get helpToolLuminexTip =>
      'Standardauthentifizierung: Admin / leeres Passwort. Gen2s machen /api/v1/ verfügbar, Gen1s antworten auf /stat/ports im Klartext.';

  @override
  String get helpToolManetDoes =>
      'Hört passiv auf UDP-Port 6549 und erkennt grandMA2/3 Konsolen und Knoten, die sich im Netzwerk anmelden. Zeigt Name, Gerätetyp, Firmware-Version und MAC-Adresse an.';

  @override
  String get helpToolManetDelay =>
      'Die Geräte erscheinen, sobald sie das nächste Mal im Netzwerk übertragen werden, im Allgemeinen in weniger als 10 Sekunden.';

  @override
  String get helpToolManetLimits =>
      'Nur lesen. Keine Anzeigedaten, kein DMX-Wert, keine Konfiguration. Überquert keine VLANs.';

  @override
  String get helpToolManetTip =>
      'Wenn kein Gerät angezeigt wird: Überprüfen Sie, ob sich der grandMA-Broadcaster im LAN befindet und der UDP-Port 6549 nicht durch eine Firewall blockiert ist.';

  @override
  String get bwCardTitle => 'Bandbreite';

  @override
  String get bwCardSubtitle => 'Broadcast + SNMP-Switch';

  @override
  String get bwHubTitle => 'Bandbreite';

  @override
  String get bwHubSubtitle =>
      'Option 1 — nur Broadcast-Datenverkehr (kein Gerät erforderlich). Option 2 — echte Port-Bandbreite via SNMP (verwalteter Switch erforderlich).';

  @override
  String get bwHubTagFree => 'GRATIS';

  @override
  String get bwHubCardBroadcastTitle => 'Netzwerk-Broadcast';

  @override
  String get bwHubCardBroadcastSubtitle => 'Art-Net · sACN · MA-Net';

  @override
  String get bwHubCardBroadcastLimit =>
      'Unicast-Datenverkehr nicht sichtbar (NDI, Dante…)';

  @override
  String get bwHubCardSnmpTitle => 'Switch-Ports';

  @override
  String get bwHubCardSnmpSubtitle => 'Port-Ansicht, gesamter Datenverkehr';

  @override
  String get bwHubCardSnmpRequires => 'SNMP-Switch erforderlich';

  @override
  String get bwBroadcastPageTitle => 'Netzwerk-Broadcast';

  @override
  String get bwBroadcastWarning =>
      'Nur Broadcast & Multicast. Unicast-Datenverkehr (NDI, Dante…) ist von diesem Gerät nicht sichtbar.';

  @override
  String get bwBroadcastListening => 'Hört zu';

  @override
  String get bwBroadcastTotal => 'Gesamt';

  @override
  String get bwSnmpPageTitle => 'Switch-Ports';

  @override
  String get bwSnmpConfigTitle => 'SNMP-Verbindung';

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
  String get bwSnmpDisconnect => 'Trennen';

  @override
  String get bwSnmpConnecting => 'Verbindung…';

  @override
  String get bwSnmpError => 'SNMP-Fehler';

  @override
  String get bwSnmpReqTitle => 'Voraussetzungen';

  @override
  String get bwSnmpReq1 => 'Verwalteter Switch mit aktiviertem SNMP v2c';

  @override
  String get bwSnmpReq2 =>
      'Community-String (Standard: \"public\" bei Luminex GigaCore)';

  @override
  String get bwSnmpReq3 => 'Switch-IP von diesem Gerät erreichbar';

  @override
  String get bwSnmpPortUp => 'Aktiv';

  @override
  String get bwSnmpPortDown => 'Inaktiv';

  @override
  String get bwSnmpNoData => 'Warten auf Daten…';

  @override
  String bwSnmpPortCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'e',
      one: '',
    );
    return '$count Port$_temp0';
  }

  @override
  String get bwUnitKbps => 'kbps';

  @override
  String get bwUnitMbps => 'Mbps';

  @override
  String get bwUnitPkts => 'Pak./s';

  @override
  String get bwLabelIn => '↓ Ein';

  @override
  String get bwLabelOut => '↑ Aus';

  @override
  String get conversionsVolumesTitle => 'Volumen';

  @override
  String get volumeCalcCardTitle => 'Volumen — Würfel, Zylinder, Kugel…';

  @override
  String get volumeCalcUnitLabel => 'Einheit der Maße';

  @override
  String get volumeCalcPlaceholder =>
      'Gib die Maße ein, um das Volumen zu sehen ✨';

  @override
  String get volumeShapeCube => 'Würfel';

  @override
  String get volumeShapeBox => 'Quader';

  @override
  String get volumeShapeCylinder => 'Zylinder';

  @override
  String get volumeShapeSphere => 'Kugel';

  @override
  String get volumeShapeCone => 'Kegel';

  @override
  String get volumeShapeSquarePyramid => 'Pyramide (quadratische Grundfläche)';

  @override
  String get volumeFieldSide => 'Seite';

  @override
  String get volumeFieldLength => 'Länge';

  @override
  String get volumeFieldWidth => 'Breite';

  @override
  String get volumeFieldHeight => 'Höhe';

  @override
  String get volumeFieldRadius => 'Radius';

  @override
  String get volumeFieldRadiusBase => 'Radius (Grundfläche)';

  @override
  String get volumeFieldSideBase => 'Seite (Grundfläche)';

  @override
  String get aboutVesaTitle => 'VESA-Halterungen & Bildschirmgrößen';

  @override
  String get aboutVesaSubtitle =>
      'VESA-Normen, Standard-Finder und Diagonalenrechner';

  @override
  String get vesaIntroTitle => 'VESA & Bildschirme auf einen Blick';

  @override
  String get vesaIntroBody =>
      'VESA (Video Electronics Standards Association) legt den Lochabstand der Befestigungslöcher auf der Rückseite von Bildschirmen, Fernsehern und Monitoren fest. Je größer und schwerer der Bildschirm, desto größer der Lochabstand. Prüfe vor der Wahl einer Halterung immer das vom Hersteller angegebene Gewicht und VESA-Muster — diese Seite liefert Richtwerte, keine garantierten Werte.';

  @override
  String get vesaTableTitle => 'Gängige VESA-Standards';

  @override
  String get vesaColEntraxe => 'Lochabstand';

  @override
  String get vesaColScreenSize => 'Bildschirmgröße';

  @override
  String get vesaColMaxWeight => 'Max. Gewicht';

  @override
  String get vesaTableFooterNote =>
      'Richtwerte: Ein Hersteller kann für einen bestimmten Bildschirm durchaus ein breiteres VESA-Muster als üblich anbieten, insbesondere bei Profi-Displays und LED-Wänden. Prüfe immer das Datenblatt.';

  @override
  String get vesaLargeFormat => 'Großformate / LED-Wände';

  @override
  String get vesaFinderTitle => 'Welches VESA-Muster habe ich gemessen?';

  @override
  String get vesaFinderHint =>
      'Miss den Abstand zwischen zwei Löchern (horizontal und vertikal) auf der Rückseite des Bildschirms, in Millimetern.';

  @override
  String get vesaFieldHorizontal => 'Horizontaler Abstand (mm)';

  @override
  String get vesaFieldVertical => 'Vertikaler Abstand (mm)';

  @override
  String get vesaFinderPlaceholder =>
      'Gib beide Abstände ein, um den Standard zu ermitteln.';

  @override
  String vesaFinderExactMatch(Object pattern) {
    return 'VESA-Standard $pattern 🎯';
  }

  @override
  String vesaFinderNearestMatch(Object pattern, Object delta) {
    return 'Keine exakte Übereinstimmung — am nächsten liegt $pattern (Gesamtabweichung $delta mm). Überprüfe deine Messung.';
  }

  @override
  String get vesaScreenCalcTitle =>
      'Bildschirmabmessungen anhand der Diagonale';

  @override
  String get vesaFieldDiagonal => 'Diagonale (Zoll)';

  @override
  String get vesaScreenCalcPlaceholder => 'Gib eine Diagonale in Zoll ein.';

  @override
  String get vesaResultDiagonal => 'Diagonale';

  @override
  String get vesaResultWidth => 'Breite';

  @override
  String get vesaResultHeight => 'Höhe';

  @override
  String get vesaResultArea => 'Fläche';

  @override
  String get vesaTipsTitle => 'Montagetipps';

  @override
  String get vesaTip1 =>
      'Verwende immer alle 4 (oder mehr) mitgelieferten Schrauben — niemals nur 2 diagonal.';

  @override
  String get vesaTip2 =>
      'Halte das angegebene Anzugsdrehmoment ein: zu festes Anziehen kann das Gehäuse rissig machen.';

  @override
  String get vesaTip3 =>
      'Bei einer Montage in der Höhe oder an einer Traverse solltest du eine Schlinge oder eine vom VESA-Halter unabhängige Zweitsicherung einplanen.';

  @override
  String get vesaTip4 =>
      'Bei dynamischer Belastung (Bewegung, Vibration, Transport) solltest du die zulässige Last gegenüber der statischen Herstellerangabe reduzieren.';

  @override
  String get vesaTip5 =>
      'Prüfe die Schraubenlänge: Sind sie zu lang, können sie die interne Elektronik des Bildschirms beschädigen.';

  @override
  String get vesaTip6 =>
      'Ein VESA-Adapter (75→100, 100→200…) muss im Lastprotokoll vermerkt werden — er fügt Gewicht und einen Hebelarm hinzu.';

  @override
  String get cctFilterTitle => 'Filter ↔ Farbtemperatur (K)';

  @override
  String get cctFilterTileDescription =>
      'Welchen CTO/CTB zwischen zwei Temperaturen wählen — in jede Richtung';

  @override
  String get cctFilterIntro =>
      'Finde sofort den passenden CTO/CTB-Filter oder prüfe das Ergebnis eines Filters, den du schon hast — in jede Richtung ✨';

  @override
  String get cctModeFindFilter => 'Welcher Filter?';

  @override
  String get cctModeSourcePlusFilter => 'K + Filter → K?';

  @override
  String get cctModeTargetPlusFilter => 'Ziel-K + Filter → Start-K?';

  @override
  String get cctFieldSourceK => 'Ausgangstemperatur (K)';

  @override
  String get cctFieldTargetK => 'Gewünschte Temperatur (K)';

  @override
  String get cctFieldTargetKFinal => 'Gewünschte Endtemperatur (K)';

  @override
  String get cctFieldFilter => 'Filter';

  @override
  String get cctDescEighthCtb => 'Kühlt sehr leicht ab';

  @override
  String get cctDescQuarterCtb => 'Kühlt leicht ab';

  @override
  String get cctDescHalfCtb => 'Kühlt mäßig ab';

  @override
  String get cctDescThreeQuarterCtb => 'Kühlt stark ab';

  @override
  String get cctDescFullCtb => 'Wolfram → Tageslicht';

  @override
  String get cctDescEighthCto => 'Wärmt sehr leicht';

  @override
  String get cctDescQuarterCto => 'Wärmt leicht';

  @override
  String get cctDescHalfCto => 'Wärmt mäßig';

  @override
  String get cctDescThreeQuarterCto => 'Wärmt stark';

  @override
  String get cctDescFullCto => 'Tageslicht → Wolfram';

  @override
  String get cctFindFilterPlaceholder =>
      'Gib beide Temperaturen ein, um den passenden Filter zu finden.';

  @override
  String get cctRequiredShiftLabel => 'Erforderliche Verschiebung';

  @override
  String get cctMiredShiftLabel => 'Mired shift';

  @override
  String cctBestChoice(Object name, Object k) {
    return 'Beste Wahl: $name → ≈ $k K';
  }

  @override
  String cctApproxKelvin(Object k) {
    return '≈ $k K';
  }

  @override
  String get cctOtherFiltersNearby => 'Andere nahegelegene Filter';

  @override
  String get cctDisclaimer =>
      'Standard-Mired-Verschiebungswerte, ungefähr — prüfe für kritische Anwendungen das Datenblatt des Herstellers.';

  @override
  String get cctSourcePlaceholder => 'Gib die Ausgangstemperatur ein.';

  @override
  String get cctTargetPlaceholder => 'Gib die gewünschte Endtemperatur ein.';

  @override
  String get cctOutOfRange =>
      'Kombination außerhalb des Bereichs (physikalisch nicht möglich) — versuche eine andere Temperatur oder einen anderen Filter.';

  @override
  String get cctResultObtainedTemp => 'Erhaltene Temperatur';

  @override
  String get cctResultAppliedFilter => 'Angewendeter Filter';

  @override
  String get cctResultRequiredSource => 'Erforderliche Quelle';

  @override
  String get cctResultFilterToApply => 'Anzuwendender Filter';

  @override
  String get cctBrandLabel => 'Filtermarke';

  @override
  String get cctAllBrands => 'Alle Marken';

  @override
  String get timecodeHubTitle => 'Timecode';

  @override
  String get timecodeToolConverterLabel => 'Framerate-\nKonverter';

  @override
  String get timecodeToolMathLabel => 'Dauer &\nVerschiebung';

  @override
  String get timecodeToolDelayLabel => 'Frame ↔ ms';

  @override
  String get timecodeToolCountdownLabel => 'Countdown';

  @override
  String get timecodeBadgeFree => 'GRATIS';

  @override
  String get timecodeBadgeNew => 'NEU';

  @override
  String get timecodeConverterTitle => 'Framerate-Konverter';

  @override
  String get timecodeConverterSourceCardTitle => 'Quell-Timecode';

  @override
  String get timecodeConverterFieldLabel => 'HH:MM:SS:FF';

  @override
  String get timecodeConverterFieldHint => '01:00:00:00';

  @override
  String get timecodeConverterSourceRateLabel => 'Quell-Framerate';

  @override
  String get timecodeConverterSwapTooltip => 'Quelle/Ziel tauschen';

  @override
  String get timecodeConverterTargetCardTitle => 'Ziel-Framerate';

  @override
  String get timecodeConverterTargetRateLabel => 'Ziel-Framerate';

  @override
  String get timecodeConverterButton => 'Umrechnen';

  @override
  String timecodeConverterErrorInvalid(String rateLabel, int frameBase) {
    return '❌ Ungültiger Timecode für $rateLabel (erwartet: HH:MM:SS:FF, FF < $frameBase).';
  }

  @override
  String timecodeConverterResult(String rateLabel, String tc, String seconds) {
    return 'TC in $rateLabel:\n$tc\n\n(≈ $seconds s seit 00:00:00:00 vergangen)';
  }

  @override
  String get timecodeMathTitle => 'Dauer & Verschiebung';

  @override
  String get timecodeMathModeDuration => 'Dauer zwischen 2 TC';

  @override
  String get timecodeMathModeOffset => 'TC verschieben';

  @override
  String get timecodeMathRateCardTitle => 'Framerate';

  @override
  String get timecodeMathDurationCardTitle => 'Timecode In / Out';

  @override
  String get timecodeMathTcInLabel => 'TC In (HH:MM:SS:FF)';

  @override
  String get timecodeMathTcOutLabel => 'TC Out (HH:MM:SS:FF)';

  @override
  String get timecodeMathComputeDurationButton => 'Dauer berechnen';

  @override
  String timecodeMathErrorDuration(int frameBase) {
    return '❌ Überprüfe beide Timecodes (HH:MM:SS:FF, FF < $frameBase).';
  }

  @override
  String timecodeMathDurationResult(
      String duration, int frames, String rateLabel) {
    return 'Dauer: $duration\n($frames Frame(s) bei $rateLabel)';
  }

  @override
  String get timecodeMathOffsetCardTitle => 'Start-Timecode + Verschiebung';

  @override
  String get timecodeMathBaseTcLabel => 'Start-TC (HH:MM:SS:FF)';

  @override
  String get timecodeMathAddLabel => '+ Addieren';

  @override
  String get timecodeMathSubtractLabel => '− Subtrahieren';

  @override
  String get timecodeMathOffsetLabel => 'Verschiebung — Dauer (HH:MM:SS:FF)';

  @override
  String get timecodeMathComputeOffsetButton => 'Neuen TC berechnen';

  @override
  String timecodeMathErrorOffset(int frameBase) {
    return '❌ Überprüfe den Start-Timecode und die Verschiebung (HH:MM:SS:FF, FF < $frameBase).';
  }

  @override
  String timecodeMathOffsetResult(String tc) {
    return 'Neuer Timecode:\n$tc';
  }

  @override
  String get timecodeDelayTitle => 'Frame ↔ ms';

  @override
  String get timecodeDelayCardTitle => 'Video-/Audioverzögerung';

  @override
  String get timecodeDelayIntro =>
      'Praktisch, um einen Lippensynchronisationsfehler oder eine Video-/LED-Prozessorverzögerung zu korrigieren: Wert eingeben, Einheit wählen und das Äquivalent erhalten.';

  @override
  String get timecodeDelayRateLabel => 'Framerate';

  @override
  String get timecodeDelayUnitFrames => 'Frames';

  @override
  String get timecodeDelayUnitMs => 'Millisekunden';

  @override
  String get timecodeDelayValueLabelFrames => 'Anzahl Frames';

  @override
  String get timecodeDelayValueLabelMs => 'Millisekunden';

  @override
  String get timecodeDelayButton => 'Umrechnen';

  @override
  String get timecodeDelayErrorInvalid => '❌ Ungültiger Wert.';

  @override
  String timecodeDelayResultFromFrames(
      int frames, String rateLabel, String ms, String duration) {
    return '$frames Frame(s) bei $rateLabel\n= $ms ms\n= $duration';
  }

  @override
  String timecodeDelayResultFromMs(
      String ms, String rateLabel, int frames, String duration) {
    return '$ms ms bei $rateLabel\n= $frames Frame(s)\n= $duration';
  }

  @override
  String get timecodeCountdownTitle => 'Countdown';

  @override
  String get timecodeCountdownSettingsCardTitle => 'Einstellungen';

  @override
  String get timecodeCountdownRateLabel => 'Framerate';

  @override
  String get timecodeCountdownCurrentTcLabel => 'Aktueller TC (HH:MM:SS:FF)';

  @override
  String get timecodeCountdownFillNowTooltip => 'Mit der Telefonzeit füllen';

  @override
  String get timecodeCountdownTargetTcLabel => 'Ziel-TC (HH:MM:SS:FF)';

  @override
  String get timecodeCountdownStartButton => 'Start';

  @override
  String get timecodeCountdownStopButton => 'Stopp';

  @override
  String timecodeCountdownErrorInvalid(int frameBase) {
    return '❌ Überprüfe beide Timecodes (HH:MM:SS:FF, FF < $frameBase).';
  }

  @override
  String get timecodeCountdownLiveCardTitle => 'Live';

  @override
  String timecodeCountdownLiveText(String tc, String remaining) {
    return 'Aktueller TC (geschätzt): $tc\nVerbleibende Zeit: $remaining';
  }

  @override
  String timecodeCountdownOverdue(String duration) {
    return '−$duration (TC überschritten)';
  }

  @override
  String get homeTimecodeTitle => 'Timecode';

  @override
  String get homeTimecodeSubtitle =>
      'Framerate, Dauer, Verschiebung, Verzögerung';

  @override
  String get vconsoleTitle => 'Console Virtuelle';

  @override
  String get vconsoleTileDescription =>
      'Envoie de l\'Art-Net/sACN en WiFi pour tester tes machines';

  @override
  String get vconsoleSectionConnection => 'Connexion réseau';

  @override
  String get vconsoleUniverseLabel => 'Univers de départ';

  @override
  String get vconsoleUniverseCountLabel => 'Nombre d\'univers';

  @override
  String get rdmPageTitle => 'RDM';

  @override
  String get rdmScanButton => 'Scanner le réseau';

  @override
  String get rdmScanningStatus => 'Recherche des fixtures RDM…';

  @override
  String get rdmEmptyState =>
      'Aucune fixture RDM trouvée. Lancez une recherche.';

  @override
  String rdmDeviceCountLabel(Object count) {
    return '$count fixture(s) trouvée(s)';
  }

  @override
  String get rdmUidLabel => 'UID';

  @override
  String get rdmManufacturerLabel => 'Fabricant';

  @override
  String get rdmStartAddressLabel => 'Adresse DMX';

  @override
  String get rdmFootprintLabel => 'Empreinte (canaux)';

  @override
  String get rdmPersonalityLabel => 'Mode (personality)';

  @override
  String get rdmSoftwareVersionLabel => 'Version logicielle';

  @override
  String get rdmIdentifyButton => 'Identifier';

  @override
  String get rdmEditTitle => 'Modifier la fixture';

  @override
  String rdmConfirmSetStartAddress(Object uid, Object value) {
    return 'Changer l\'adresse DMX de $uid en $value ?';
  }

  @override
  String rdmConfirmSetPersonality(Object uid, Object value) {
    return 'Changer le mode de $uid en $value ?';
  }

  @override
  String rdmConfirmSetLabel(Object uid, Object value) {
    return 'Renommer $uid en « $value » ?';
  }

  @override
  String get rdmConfirmButton => 'Confirmer';

  @override
  String get rdmCancelButton => 'Annuler';

  @override
  String get rdmSetSuccess => 'Modifié avec succès';

  @override
  String get rdmSetFailed => 'Échec de la modification';

  @override
  String get rdmNoResponse => 'Pas de réponse de la fixture';

  @override
  String get rdmRefreshTooltip => 'Rafraîchir';

  @override
  String get rdmWriteWarning =>
      'Modifier une fixture en direct peut perturber un show en cours. À utiliser avec précaution.';

  @override
  String get vconsoleTargetBroadcast => 'Broadcast (auto)';

  @override
  String get vconsoleTargetUnicast => 'IP précise';

  @override
  String get vconsoleManualIpLabel => 'IP du node (ex: 192.168.1.50)';

  @override
  String get vconsoleStop => 'Arrêter l\'envoi';

  @override
  String get vconsoleStart => 'Démarrer l\'envoi';

  @override
  String get vconsoleBlackout => 'Blackout';

  @override
  String vconsoleStatusLive(Object fps) {
    return 'En direct • $fps fps';
  }

  @override
  String get vconsoleStatusStopped => 'Arrêté';

  @override
  String vconsoleUniversePill(Object universe) {
    return 'Univers $universe';
  }

  @override
  String vconsoleTargetPill(Object target) {
    return '→ $target';
  }

  @override
  String vconsoleErrorLabel(Object message) {
    return 'Erreur : $message';
  }

  @override
  String vconsoleStartFailed(Object message) {
    return 'Impossible de démarrer : $message';
  }

  @override
  String get vconsoleTabFaders => 'Faders simples';

  @override
  String get vconsoleTabGdtf => 'GDTF';

  @override
  String get vconsoleTabPatch => 'Mon Patch';

  @override
  String get vconsoleChannelCountLabel => 'Nombre de canaux';

  @override
  String get vconsoleAllZero => 'Tout à 0';

  @override
  String get vconsoleAllFull => 'Tout à 255';

  @override
  String get vconsoleSearchTitle => 'Rechercher sur GDTF Share';

  @override
  String get vconsoleSearchHint => 'Ex: MAC Viper, Spiider...';

  @override
  String get vconsoleImportLocal => 'Importer un fichier .gdtf';

  @override
  String vconsoleModeDialogTitleFor(Object fixture) {
    return 'Mode DMX — $fixture';
  }

  @override
  String vconsoleModeDialogOption(Object mode, Object count) {
    return '$mode ($count ch)';
  }

  @override
  String get vconsoleModeDialogTitleGeneric => 'Mode DMX';

  @override
  String get vconsoleNoModeFound =>
      'Aucun mode DMX trouvé dans ce fichier .gdtf';

  @override
  String vconsolePickFailed(Object message) {
    return 'Sélection impossible : $message';
  }

  @override
  String vconsoleDownloadFailed(Object code) {
    return 'Téléchargement impossible ($code)';
  }

  @override
  String vconsoleSearchResultSubtitle(Object count, Object size) {
    return '$count mode(s) • $size';
  }

  @override
  String get vconsoleChooseFixtureHint =>
      'Choisis une fixture pour afficher ses faders.';

  @override
  String get vconsolePatchSectionTitle => 'Mon Patch (import MVR)';

  @override
  String get vconsolePatchEmpty =>
      'Aucune fixture patchée pour l\'instant. Importe un fichier MVR depuis l\'outil Patch pour les retrouver ici.';

  @override
  String vconsolePatchEntrySubtitle(
      Object universe, Object start, Object end, Object count) {
    return 'Univers $universe • $start-$end • $count ch';
  }

  @override
  String get vconsoleChoosePatchedFixtureHint =>
      'Choisis une fixture patchée pour afficher ses faders.';

  @override
  String get vconsoleStartAddressLabel => 'Adresse de départ';

  @override
  String get vconsoleFixtureFallbackTitle => 'Fixture';

  @override
  String vconsoleUniverseArrow(Object universe) {
    return '→ univers $universe';
  }

  @override
  String vconsoleSearchError(Object code) {
    return 'Erreur $code';
  }

  @override
  String vconsoleNetworkError(Object message) {
    return 'Erreur réseau : $message';
  }

  @override
  String vconsoleChannelShortLabel(Object n) {
    return 'Ch $n';
  }

  @override
  String get vconsoleContinueToSource => 'Choisir la source';

  @override
  String get vconsoleContinueToSourceHint =>
      'Faders simples, fixture GDTF ou machine déjà patchée (MVR).';

  @override
  String get vconsoleControlGroupTooltip => 'Piloter tout le groupe';

  @override
  String vconsoleGroupInfo(Object count, Object universe) {
    return '$count machine(s) • univers $universe';
  }

  @override
  String vconsoleGroupInfoWithExcluded(
      Object count, Object universe, Object excluded) {
    return '$count machine(s) • univers $universe • $excluded hors groupe (autre univers)';
  }

  @override
  String vconsoleGroupSubtitle(Object count, Object universes) {
    return '$count machines • univers $universes';
  }

  @override
  String get vconsoleOpenFaders => 'Ouvrir la console';

  @override
  String vconsolePresetsTitleFor(Object channel) {
    return 'Presets — $channel';
  }

  @override
  String get vconsolePresetsTooltip => 'Presets';

  @override
  String get vconsoleSourceStepTitle => 'Choisir la source';

  @override
  String get vconsoleUnit8Bit => '8 bit';

  @override
  String get vconsoleUnitPercent => '%';

  @override
  String get vconsoleHomeTooltip =>
      'Position Home (dimmer 100%, pan/tilt centrés, shutter ouvert)';

  @override
  String get vconsoleHomeButton => 'Home';

  @override
  String get filterCorrespondenceTitle => 'Correspondance filtres';

  @override
  String get filterCorrespondenceSearchHint => 'Rechercher (n° ou nom)…';

  @override
  String get filterCorrespondenceColLeeName => 'Lee / Nom';

  @override
  String get filterCorrespondenceEmpty => 'Aucune correspondance';

  @override
  String filterCorrespondenceResultsCount(Object count) {
    return '$count correspondance(s)';
  }

  @override
  String filterCorrespondenceFilteredOf(Object total) {
    return ' (filtré sur $total)';
  }

  @override
  String get lbResetDialogTitle => 'Tout remettre à zéro ?';

  @override
  String get lbResetDialogBody =>
      'La liste de fixtures sera vidée. La config du tableau sera conservée.';

  @override
  String get lbClearAction => 'Vider';

  @override
  String get lbPageTitle => 'Répartition de charge';

  @override
  String get lbResetTooltip => 'Remettre à zéro';

  @override
  String get lbPanelConfigTitle => 'Configuration du tableau';

  @override
  String get lbVoltageTypeLabel => 'Type de réseau';

  @override
  String get lbPanelSizeLabel => 'Taille du tableau';

  @override
  String get lbCosPhiLabel => 'Facteur de puissance (cos φ)';

  @override
  String get lbPhaseGaugesTitle => 'Ampérage par phase';

  @override
  String lbFixturesListTitle(Object count, Object totalW) {
    return 'Fixtures — $count lignes · $totalW W total';
  }

  @override
  String get lbEmptyTitle => 'Aucune fixture pour l\'instant';

  @override
  String get lbEmptyBody => 'Appuie sur + pour ajouter\ndepuis le catalogue.';

  @override
  String get lbAddFixtureButton => 'Ajouter une fixture';

  @override
  String get lbSheetTitleDefault => '⚡ Ajouter une fixture';

  @override
  String get lbPickerSearchHint => 'Rechercher fabricant ou fixture…';

  @override
  String get lbNoResults => 'Aucun résultat 🤷';

  @override
  String lbProductsWithPowerCount(Object count) {
    return '$count fixture(s) avec données conso';
  }

  @override
  String get lbUnknownPower => 'conso inconnue';

  @override
  String get lbFixtureSectionLabel => 'Fixture';

  @override
  String get lbPowerLabel => 'Consommation (W)';

  @override
  String get lbQuantityLabel => 'Quantité';

  @override
  String get lbPhaseLabel => 'Phase';

  @override
  String get lbPowerHint => 'ex: 350';

  @override
  String get lbAddToDistribution => 'Ajouter à la distribution';

  @override
  String get filterLedFiltreLabel => 'Filtre';

  @override
  String get filterLedTransmissionLabel => 'Transmission';

  @override
  String get filterLedSaveProfileTooltip => 'Sauvegarder le profil';

  @override
  String get filterLedColorComparisonTitle => 'Comparaison couleur';

  @override
  String get proHeaderBody =>
      'Débloque tous les outils avancés pour les techniciens lumière, vidéo et laser.';

  @override
  String get proPerYear => '/ an';

  @override
  String get proSubscribeButton => 'S\'abonner';

  @override
  String get proRestorePurchases => 'Restaurer les achats';

  @override
  String get proPrivacyPolicy => 'Politique de confidentialité';

  @override
  String get proTermsOfUse => 'Conditions d\'utilisation';

  @override
  String get rfIm3ConflictBadge => '⚠ CONFLIT';

  @override
  String get filterLedHideCalibration => 'Masquer calibration';

  @override
  String get filterLedShowCalibration => 'Calibrer ma fixture';

  @override
  String get aboutAudioTitle => 'Audio — Beschallung';

  @override
  String get aboutAudioSubtitle =>
      'Gain Staging, SPL/Distanz, Delays, Kardioid-Subs, Verkabelung.';

  @override
  String get aboutAudioPageTitle => 'Audio — Praxis-Referenz';

  @override
  String get audioRefTocCopyText => 'Inhaltsverzeichnis kopieren';

  @override
  String get audioRefSection1Title => 'Signalkette & Gain Staging';

  @override
  String get audioRefSection1FormulasTitle => 'Pegel-Referenzwerte';

  @override
  String get audioRefSection1Formula1 =>
      '0 dBu ≈ 0,775 V RMS — professionelle analoge Referenz';

  @override
  String get audioRefSection1Formula2 =>
      '0 dBFS = maximaler digitaler Pegel vor dem Clipping — immer Headroom lassen';

  @override
  String get audioRefSection1Formula3 =>
      'Gain Staging: jede Stufe (Quelle → Pult → Endstufe) für ein gutes Signal-Rausch-Verhältnis einstellen, ohne zu übersteuern';

  @override
  String get audioRefSection1FieldMarksTitle => 'Praxistipps';

  @override
  String get audioRefSection1FieldMark1 =>
      'Ziel: Eingangspegel pendelt im grün/gelben Bereich, nie dauerhaft im Roten';

  @override
  String get audioRefSection1FieldMark2 =>
      'Ein schlecht eingepegeltes System klingt schon bei niedriger Lautstärke rauschig: meist liegt die Ursache in einer übersteuerten Stufe weiter vorn';

  @override
  String get audioRefSection2Title => 'SPL & Entfernung';

  @override
  String get audioRefSection2FormulaTitle =>
      'Abstandsgesetz (inverse square law)';

  @override
  String get audioRefSection2Formula1 =>
      'Jede Verdopplung der Entfernung = -6 dB SPL im Freifeld';

  @override
  String get audioRefSection2Formula2 =>
      'SPL(d2) = SPL(d1) - 20 × log10(d2 / d1)';

  @override
  String get audioRefSection2NoteTitle => 'Praxisnuancen';

  @override
  String get audioRefSection2Note1 =>
      'Im Innenraum verringern Reflexionen (Wände, Decke) den tatsächlichen Pegelabfall gegenüber der Theorie';

  @override
  String get audioRefSection2Note2 =>
      'Ein gut konstruiertes Line-Array fällt entlang der Abdeckungsachse langsamer ab als eine Punktquelle';

  @override
  String get audioRefSection3Title => 'Delay-Alignment (Time Alignment)';

  @override
  String get audioRefSection3Paragraph =>
      'Ein Zusatzsystem (Delay-Tower, Frontfill) muss verzögert werden, damit sein Schall gleichzeitig mit dem Hauptsystem ankommt und als eine einzige Quelle wahrgenommen wird.';

  @override
  String get audioRefSection3FormulaTitle => 'Grundformel';

  @override
  String get audioRefSection3Formula1 =>
      'Delay (ms) = Abstand zwischen den Systemen (m) / 0,343 m/ms (Schallgeschwindigkeit ≈ 343 m/s)';

  @override
  String get audioRefSection3TipsTitle => 'Best Practices';

  @override
  String get audioRefSection3Tip1 =>
      'Miss den tatsächlichen Abstand zwischen den beiden Quellen, nicht nur die Entfernung zum Publikum';

  @override
  String get audioRefSection3Tip2 =>
      'Füge ein paar zusätzliche ms Delay (2-5 ms) hinzu, um den Präzedenzeffekt (Haas-Effekt) zu verstärken und das Hauptsystem als wahrgenommene Quelle zu erhalten';

  @override
  String get audioRefSection3Tip3 =>
      'Nach der Einstellung mit dem Ohr und/oder einem Analyzer (z. B. Phasenkorrelation) überprüfen';

  @override
  String get audioRefSection4Title => 'Sub-Richtwirkung (Kardioid / End-Fire)';

  @override
  String get audioRefSection4Paragraph =>
      'Eine Kardioid- oder End-Fire-Anordnung reduziert die zur Bühne/zum FOH abgestrahlte Bassenergie und verstärkt sie zum Publikum hin, durch Spiel mit Delay und Polarität zwischen den Subs.';

  @override
  String get audioRefSection4TypesTitle => 'Gängige Konfigurationen';

  @override
  String get audioRefSection4Type1 =>
      'End-Fire: Subs in einer Reihe, der vordere vorgezogen und elektronisch verzögert';

  @override
  String get audioRefSection4Type2 =>
      '2-Sub-Kardioid: ein vorderer Sub (normal), ein hinterer Sub mit invertierter Polarität und Delay';

  @override
  String get audioRefSection4Type3 =>
      '3-Sub-Kardioid: zwei vordere in Phase, ein hinterer invertiert und verzögert — bester Kompromiss zwischen Pegel und Rückwärtsunterdrückung';

  @override
  String get audioRefSection5Title => 'Verkabelung & Steckverbinder';

  @override
  String get audioRefSection5XlrTitle => 'Symmetrisches XLR';

  @override
  String get audioRefSection5XlrBullet1 =>
      'Bei langen Strecken immer eine symmetrische Verbindung (XLR/TRS) bevorzugen, um Störungen zu unterdrücken';

  @override
  String get audioRefSection5XlrBullet2 =>
      'Ab ca. 50-100 m analog eine digitale Verbindung in Betracht ziehen (AES/EBU, Dante usw.)';

  @override
  String get audioRefSection5SpeakonTitle => 'Speakon (Lautsprecher)';

  @override
  String get audioRefSection5SpeakonBullet1 =>
      'Nie XLR für Lautsprecher verwenden: die übertragene Leistung kann für Line-Signale ausgelegte Geräte beschädigen';

  @override
  String get audioRefSection5SpeakonBullet2 =>
      'Vor einer langen Verlegung den Kabelquerschnitt passend zu Leistung und Entfernung (Spannungsabfall) prüfen';

  @override
  String get audioRefSection5GroundTitle => 'Masse & Brummen';

  @override
  String get audioRefSection5GroundBullet1 =>
      'Eine Erdschleife zwischen zwei über unterschiedliche Wege ans Netz angeschlossenen Geräten kann 50/60-Hz-Brummen erzeugen';

  @override
  String get audioRefSection5GroundBullet2 =>
      'Ein Ground Lift oder eine DI-Box mit galvanischer Trennung kann das lösen, ohne den Schutzleiter zu unterbrechen';

  @override
  String get audioRefSection6Title => 'Gehörschutz & Best Practices';

  @override
  String get audioRefSection6DontDoTitle => 'Zu vermeiden';

  @override
  String get audioRefSection6DontDoBullet1 =>
      'Publikum oder Crew dauerhaft und zeitlich unbegrenzt mehr als 100 dB SPL auszusetzen';

  @override
  String get audioRefSection6DontDoBullet2 =>
      'Ein System über seine Nennleistung hinaus zu treiben, um eine schlechte Platzierung auszugleichen';

  @override
  String get audioRefSection6WarningTitle => 'Expositions-Richtwerte';

  @override
  String get audioRefSection6WarningBullet1 =>
      '85 dB SPL: empfohlene Grenze für längere Exposition (8h) ohne Schutz';

  @override
  String get audioRefSection6WarningBullet2 =>
      '100 dB SPL: schon nach wenigen Minuten Risiko — die meisten Konzerte überschreiten dieses Niveau';

  @override
  String get audioRefSection6WarningBullet3 =>
      'Immer einen System-Limiter am Ausgang verwenden, um Equipment und Publikum zu schützen';

  @override
  String get audioRefSection7Title => 'Schnell-Checkliste';

  @override
  String get audioRefSection7QuickTitle => 'Vor der Show';

  @override
  String get audioRefSection7Bullet1 =>
      'Gain Staging von der Quelle bis zur Endstufe geprüft, keine Übersteuerung';

  @override
  String get audioRefSection7Bullet2 =>
      'Delays der Zusatzsysteme berechnet und angewendet';

  @override
  String get audioRefSection7Bullet3 => 'System-Limiter aktiv und eingestellt';

  @override
  String get audioRefSection7Bullet4 =>
      'Polarität zwischen Subs und Tops geprüft (keine Auslöschung)';

  @override
  String get audioRefSection7Bullet5 =>
      'SPL-Pegel am FOH und hinten im Raum gemessen';

  @override
  String get audioRefFooterNote =>
      'Dies sind allgemeine Richtwerte — prüfe immer die Herstellerangaben und die örtlichen Vorschriften zu Schallpegeln.';

  @override
  String get aboutRfTitle => 'RF — Funk & Wi-Fi';

  @override
  String get aboutRfSubtitle =>
      'UHF-Bänder, Wi-Fi, IM3-Koexistenz, Antennen, RF-Scan.';

  @override
  String get aboutRfPageTitle => 'RF — Praxis-Referenz';

  @override
  String get rfRefTocCopyText => 'Inhaltsverzeichnis kopieren';

  @override
  String get rfRefSection1Title => 'Grundlagen des RF-Spektrums';

  @override
  String get rfRefSection1FormulasTitle => 'Frequenz-/Wellenlängen-Referenz';

  @override
  String get rfRefSection1Formula1 =>
      'λ (m) = 300 / f (MHz) — ungefähre Wellenlänge';

  @override
  String get rfRefSection1Formula2 =>
      'Je höher die Frequenz, desto kürzer die Wellenlänge und desto geringer die Reichweite im freien Raum';

  @override
  String get rfRefSection1FieldMarksTitle => 'Praxistipps';

  @override
  String get rfRefSection1FieldMark1 =>
      'Der menschliche Körper absorbiert und reflektiert RF-Wellen — die Position eines Funkempfängers am Körper beeinflusst den Empfang';

  @override
  String get rfRefSection1FieldMark2 =>
      'Immer eine direkte Sichtverbindung (Line of Sight) zwischen Sender und Empfänger bevorzugen';

  @override
  String get rfRefSection2Title => 'UHF-Bänder für Funkmikrofone';

  @override
  String get rfRefSection2Paragraph =>
      'Funkmikrofone und In-Ears nutzen hauptsächlich das UHF-Band (470-694 MHz in Europa, je nach Land), das mit dem TV-Rundfunk geteilt wird — die tatsächliche Verfügbarkeit hängt von den örtlichen Vorschriften ab.';

  @override
  String get rfRefSection2NoteTitle => 'Vor jedem Termin prüfen';

  @override
  String get rfRefSection2Note1 =>
      'Die verfügbaren Bänder variieren je nach Land — örtliche Vorschriften prüfen (ANFR in Frankreich, Ofcom in UK usw.)';

  @override
  String get rfRefSection2Note2 =>
      'Ein an einem Ort freies Band kann anderswo von einem TV-Sender oder einem anderen Dienstleister belegt sein';

  @override
  String get rfRefSection3Title => 'Wi-Fi 2,4 GHz vs. 5 GHz';

  @override
  String get rfRefSection3TableTitle => 'Wichtige Unterschiede';

  @override
  String get rfRefSection3Bullet1 =>
      '2,4 GHz: 3 überschneidungsfreie Kanäle (1, 6, 11), bessere Reichweite, stärker belegt (Bluetooth, Funkmikrofone im oberen Band, andere Netzwerke)';

  @override
  String get rfRefSection3Bullet2 =>
      '5 GHz: deutlich mehr überschneidungsfreie Kanäle, höherer Durchsatz, kürzere Reichweite, generell weniger Störungen';

  @override
  String get rfRefSection3Bullet3 =>
      'Für Regie/Steuerung (Pulte, Visualisierung) wenn möglich 5 GHz bevorzugen';

  @override
  String get rfRefSection4Title => 'Koexistenz & Intermodulation (IM3)';

  @override
  String get rfRefSection4Paragraph =>
      'Wenn mehrere Funkstrecken gemeinsam betrieben werden, können ihre Frequenzen Intermodulationsprodukte (IM3) erzeugen, die auf andere genutzte Frequenzen fallen und Störungen verursachen.';

  @override
  String get rfRefSection4FormulaTitle => 'IM3-Formel (3. Ordnung)';

  @override
  String get rfRefSection4Formula1 => 'IM3 = 2×f1 − f2 und 2×f2 − f1';

  @override
  String get rfRefSection4Tip1 =>
      'Je mehr Funkkanäle hinzukommen, desto höher das Risiko, dass ein IM3-Produkt auf eine genutzte Frequenz fällt — daher lohnt sich ein im Voraus berechneter Frequenzplan';

  @override
  String get rfRefSection5Title => 'Antennen & Diversity';

  @override
  String get rfRefSection5Bullet1 =>
      'Diversity-Empfang nutzt zwei leicht versetzte Antennen, um Auslöschungszonen (RF-Funklöcher) zu vermeiden';

  @override
  String get rfRefSection5Bullet2 =>
      'Antennen mindestens eine Viertelwellenlänge auseinander positionieren, nicht direkt in einer Linie mit dem Sender';

  @override
  String get rfRefSection5Bullet3 =>
      'Antennen nicht direkt auf dem Boden oder an einer Metallstruktur platzieren — das kann das Signal verstimmen oder abschirmen';

  @override
  String get rfRefSection6Title => 'RF-Scan vor einer Show';

  @override
  String get rfRefSection6Bullet1 =>
      'Das Band immer vor Ort zur Showzeit scannen — die RF-Umgebung ändert sich zwischen Tag und Abend (andere Dienstleister, Publikum mit Hotspots usw.)';

  @override
  String get rfRefSection6Bullet2 =>
      'Belegte Frequenzen notieren und für den nächsten Termin am selben Ort dokumentieren, wenn möglich';

  @override
  String get rfRefSection6Bullet3 =>
      'Einen Spielraum an freien Frequenzen für einen kurzfristigen Wechsel einplanen (defektes Gerät, unerwartete Störung)';

  @override
  String get rfRefSection7Title => 'Schnell-Checkliste';

  @override
  String get rfRefSection7Bullet1 => 'RF-Scan zur Showzeit durchgeführt';

  @override
  String get rfRefSection7Bullet2 => 'Frequenzplan berechnet (IM3 geprüft)';

  @override
  String get rfRefSection7Bullet3 =>
      'Antennen in Sichtverbindung, korrekt positioniert';

  @override
  String get rfRefSection7Bullet4 =>
      'Genutzte UHF-Bänder entsprechen den örtlichen Vorschriften';

  @override
  String get rfRefFooterNote =>
      'Die RF-Vorschriften unterscheiden sich stark je nach Land — vor einer Show immer die örtlich zulässigen Frequenzen prüfen.';

  @override
  String get aboutLaserTitle => 'Laser — Physik & Sicherheit';

  @override
  String get aboutLaserSubtitle =>
      'Funktionsweise, Scanner, Klassen, Normen, NOHD/SZED/CZED.';

  @override
  String get aboutLaserPageTitle => 'Laser — Praxisreferenz';

  @override
  String get laserRefTocCopyText => 'Inhaltsverzeichnis kopieren';

  @override
  String get laserRefSection1Title => 'Was ist ein Laser?';

  @override
  String get laserRefSection1AcronymTitle => 'Das Akronym LASER';

  @override
  String get laserRefSection1AcronymBody =>
      'LASER steht für „Light Amplification by Stimulated Emission of Radiation” (Lichtverstärkung durch stimulierte Emission von Strahlung).';

  @override
  String get laserRefSection1HowTitle => 'Das physikalische Prinzip';

  @override
  String get laserRefSection1HowBody =>
      'Ein aktives Medium (Diode, DPSS-Kristall...) wird elektrisch oder optisch „gepumpt”, was eine stimulierte Emission von Photonen auslöst. Ein Resonanzresonator (zwei Spiegel, einer teildurchlässig) verstärkt dieses Licht, das kohärent, monochromatisch und stark kollimiert austritt — im Gegensatz zu einer gewöhnlichen Lichtquelle.';

  @override
  String get laserRefSection1TypesTitle => 'Gängige Typen im Showbereich';

  @override
  String get laserRefSection1Type1 =>
      'Direktdiode: kompakt, oft in RGB zur Farbmischung eingesetzt';

  @override
  String get laserRefSection1Type2 =>
      'DPSS (Diode Pumped Solid State): eine Diode pumpt einen Kristall, historisch für Grün und andere spezifische Wellenlängen genutzt';

  @override
  String get laserRefSection2Title =>
      'Wie gezeichnet wird: Scanner und Geschwindigkeit';

  @override
  String get laserRefSection2Paragraph =>
      'Der Strahl wird von zwei Galvanometer-Spiegeln („Galvos”) gesteuert, einer für die X-Achse und einer für die Y-Achse, die sich extrem schnell drehen. Im Gegensatz zu Video (zeilenweiser Rasterscan) zeichnet eine Lasershow Vektorformen, Punkt für Punkt, entlang der Kontur des Bildes.';

  @override
  String get laserRefSection2SpeedTitle => 'Scan-Geschwindigkeit';

  @override
  String get laserRefSection2Speed1 =>
      'Die Geschwindigkeit wird in Punkten pro Sekunde (pps) oder Kilopunkten pro Sekunde (kpps) gemessen';

  @override
  String get laserRefSection2Speed2 =>
      'ILDA (International Laser Display Association) standardisiert den Steckverbinder, das .ild-Dateiformat und ein Testmuster zur objektiven Bewertung eines Scanners';

  @override
  String get laserRefSection2FieldTitle => 'Praxishinweise';

  @override
  String get laserRefSection2Field1 =>
      'Je mehr Punkte ein Bild enthält, desto mehr pps sind nötig, um Flackern (Flicker) zu vermeiden — eine flüssige Show läuft meist bei etwa 20 bis 30 kpps';

  @override
  String get laserRefSection2Field2 =>
      'Das ILDA-Testmuster ermöglicht den Vergleich zweier Scanner anhand objektiver Kriterien (Geschwindigkeit, Präzision, Dämpfung)';

  @override
  String get laserRefSection3Title => 'Laserklassen & Normen';

  @override
  String get laserRefSection3ClassesTitle => 'IEC-60825-1-Klassen';

  @override
  String get laserRefSection3Class1 =>
      'Klasse 1: bei normalem Gebrauch sicher, keine besonderen Vorkehrungen nötig';

  @override
  String get laserRefSection3Class2 =>
      'Klasse 1M / 2M: mit bloßem Auge sicher, aber gefährlich mit optischen Instrumenten (Fernglas, Lupe)';

  @override
  String get laserRefSection3Class3 =>
      'Klasse 2: sichtbar, durch den Lidschlussreflex geschützt (< 1 mW)';

  @override
  String get laserRefSection3Class4 =>
      'Klasse 3R: moderates Risiko, begrenzte direkte Gefahr';

  @override
  String get laserRefSection3Class5 =>
      'Klasse 3B: gefährlich für das Auge bei direkter Betrachtung — die meisten Showlaser fallen in diese oder Klasse 4';

  @override
  String get laserRefSection3Class6 =>
      'Klasse 4: gefährlich für Auge und Haut, Brandgefahr — maximale Vorsichtsmaßnahmen erforderlich';

  @override
  String get laserRefSection3StandardsTitle => 'Referenznormen';

  @override
  String get laserRefSection3Standard1 =>
      'IEC 60825-1: Produktsicherheit und Laserklassifizierung';

  @override
  String get laserRefSection3Standard2 =>
      'IEC 60825-3: spezifische Richtlinien für Laser-Displays und -Shows (Konzept der variablen MPE je nach Expositionsdauer)';

  @override
  String get laserRefSection3Standard3 =>
      'Örtliche Vorschriften: Anmeldung/Genehmigung je nach Leistung und Land (z. B. FDA/CDRH 21 CFR 1040.10 in den USA mit Variance-Verfahren für Shows)';

  @override
  String get laserRefSection3FieldNote =>
      'Vor einer Show immer die örtlichen Vorschriften prüfen, besonders für Audience Scanning und in Flughafennähe.';

  @override
  String get laserRefSection4Title => 'Sicherheitsmaßnahmen';

  @override
  String get laserRefSection4Bullet1 =>
      'Ein geschulter Laser Safety Officer (LSO) ist benannt und für die Show verantwortlich';

  @override
  String get laserRefSection4Bullet2 =>
      'Schlüsselschalter und Not-Aus sind leicht zugänglich';

  @override
  String get laserRefSection4Bullet3 =>
      'Eine Verriegelung (Interlock) unterbricht die Emission, wenn eine Abdeckung oder ein Gehäuse geöffnet wird';

  @override
  String get laserRefSection4Bullet4 =>
      'Scan-Fail-Erkennung unterbricht den Strahl, wenn die Galvos anhalten — unverzichtbar für Audience Scanning';

  @override
  String get laserRefSection4Bullet5 =>
      'Kein statischer Strahl auf das Publikum gerichtet — nur Audience Scanning mit dedizierten Schutzmaßnahmen und Expositionsberechnungen';

  @override
  String get laserRefSection4Bullet6 =>
      'Niemals auf Luftraum, ein Flugzeug oder eine unkontrollierte reflektierende Fläche (Glas, Spiegel, Bildschirm) richten';

  @override
  String get laserRefSection5Title => 'NOHD, SZED, CZED erklärt';

  @override
  String get laserRefSection5Paragraph =>
      'Diese Sicherheitsabstände werden vom Werkzeug „Sicherheitszonen” der App anhand von Leistung, Divergenz und Austrittsdurchmesser des Strahls berechnet.';

  @override
  String get laserRefSection5NohdTitle =>
      'NOHD — Nominal Ocular Hazard Distance';

  @override
  String get laserRefSection5NohdBody =>
      'Nominale Augengefährdungsdistanz: jenseits dieser Distanz sinkt die direkte Bestrahlungsstärke des Strahls unter den zulässigen Grenzwert (MPE) für eine kurze, versehentliche Exposition. Dies ist die Basisreferenz gemäß IEC 60825-1.';

  @override
  String get laserRefSection5SzedTitle => 'SZED — Show Zone Exposure Distance';

  @override
  String get laserRefSection5SzedBody =>
      'Expositionsdistanz der Showzone: markiert den Bereich, in dem sich das Publikum während einer Show mit Strahlabtastung (Audience Scanning) aufhalten darf, mit einem vorsichtigeren MPE-Schwellenwert als beim NOHD.';

  @override
  String get laserRefSection5CzedTitle =>
      'CZED — Controlled Zone Exposure Distance';

  @override
  String get laserRefSection5CzedBody =>
      'Expositionsdistanz der kontrollierten Zone: die vorsichtigste der drei, reserviert für den Bereich, in dem sich nur geschultes Personal (Operator, Techniker) aufhalten darf, unter Berücksichtigung einer potenziell längeren Exposition.';

  @override
  String get laserRefSection5FieldNote =>
      'In der App gilt: je niedriger der verwendete MPE-Schwellenwert, desto größer die berechnete Distanz — daher die Reihenfolge CZED > SZED > NOHD. Diese Distanzen sind nur Richtwerte: Sie ersetzen weder eine Beurteilung durch einen qualifizierten Laser Safety Officer noch die geltenden örtlichen Vorschriften.';

  @override
  String get laserRefSection6Title => 'Schnell-Checkliste';

  @override
  String get laserRefSection6Bullet1 =>
      'Laserklasse identifiziert, bei Bedarf angemeldet';

  @override
  String get laserRefSection6Bullet2 =>
      'LSO benannt und während der gesamten Show anwesend';

  @override
  String get laserRefSection6Bullet3 =>
      'NOHD-/SZED-/CZED-Zonen berechnet und markiert';

  @override
  String get laserRefSection6Bullet4 =>
      'Scan-Fail-Erkennung aktiv bei Audience Scanning';

  @override
  String get laserRefSection6Bullet5 => 'Not-Aus getestet und zugänglich';

  @override
  String get laserRefSection6Bullet6 =>
      'Kein Zielen auf Luftraum oder eine unkontrollierte reflektierende Fläche';

  @override
  String get laserRefFooterNote =>
      'Diese Informationen sind allgemein und pädagogisch gemeint — sie ersetzen weder eine Laser-Safety-Officer-Schulung noch örtliche Vorschriften (IEC 60825, FDA/CDRH, Luftfahrtbehörden...).';

  @override
  String get aboutRiggingTitle => 'Rigging';

  @override
  String get aboutRiggingSubtitle => 'Grundlagen, Bridle und Winkelfaktor';

  @override
  String get aboutRiggingPageTitle => 'Rigging — Schnellkurs';

  @override
  String get riggingRefTocCopyText => 'Zusammenfassung kopieren';

  @override
  String get riggingRefSection1Title => 'Rigging-Grundlagen';

  @override
  String get riggingRefSection2Title => '2-Punkt-Anschlag (Bridle)';

  @override
  String get riggingRefSection3Title => 'Winkelfaktor';

  @override
  String get riggingRefSection4Title => 'Checkliste';

  @override
  String get riggingRefSection1Bullet1 =>
      'WLL (Working Load Limit): die vom Hersteller angegebene maximal zulässige Nutzlast eines Zubehörteils.';

  @override
  String get riggingRefSection1Bullet2 =>
      'Sicherheitsfaktor: Verhältnis zwischen Bruchlast und WLL, üblicherweise 5:1 oder 10:1 je nach Material und Vorschriften.';

  @override
  String get riggingRefSection1Bullet3 =>
      'Lastkette: jedes Glied (Anschlagpunkt, Schlinge, Schäkel, Struktur) muss für die Gesamtlast ausgelegt sein — das schwächste Glied bestimmt die Grenze der gesamten Kette.';

  @override
  String get riggingRefSection2Bullet1 =>
      'Ein 2-Punkt-Anschlag verteilt die Last auf zwei Schlingen, die einen Winkel zur Senkrechten bilden.';

  @override
  String get riggingRefSection2Bullet2 =>
      'Je größer der Winkel zur Senkrechten, desto höher die Zugkraft in jeder Schlinge.';

  @override
  String get riggingRefSection2Bullet3 =>
      'Übliche Empfehlung: den eingeschlossenen Winkel zwischen den beiden Schenkeln unter 90° halten, um die zusätzliche Zugkraft zu begrenzen.';

  @override
  String get riggingRefSection3FormulaTitle => 'Formel';

  @override
  String get riggingRefSection3Formula1 =>
      'Zugkraft pro Schlinge = (Last / Anzahl der Schlingen) × Winkelfaktor, mit Winkelfaktor = 1 / cos(Winkel zur Senkrechten).';

  @override
  String get riggingRefSection3Bullet1 =>
      'Beispiele: 0° → Faktor 1,0; 45° → Faktor etwa 1,41; 60° → Faktor 2,0.';

  @override
  String get riggingRefSection3Bullet2 =>
      'Je größer der Winkel zur Senkrechten, desto schneller steigt der Faktor — und damit die Zugkraft.';

  @override
  String get riggingRefSection4Bullet1 =>
      'WLL jedes Zubehörteils (Schlinge, Schäkel, Karabiner, Struktur) vor dem Anschlagen prüfen.';

  @override
  String get riggingRefSection4Bullet2 =>
      'Die tatsächliche Zugkraft pro Schlinge unter Berücksichtigung des Winkelfaktors berechnen, nicht nur die Gesamtlast durch die Anzahl der Schenkel teilen.';

  @override
  String get riggingRefSection4Bullet3 =>
      'Zubehör vor jedem Einsatz visuell prüfen (Verformung, Korrosion, Verschleiß).';

  @override
  String get riggingRefSection4Bullet4 =>
      'Den Aufbau bei hohen Lasten oder komplexen Konfigurationen von einer sachkundigen Person oder einem qualifizierten Rigger prüfen lassen.';

  @override
  String get riggingRefFooterNote =>
      'Dieser Inhalt ist ein allgemeiner pädagogischer Hinweis und ersetzt weder lokale Normen noch eine Rigger-Ausbildung oder die Prüfung durch eine sachkundige Person.';

  @override
  String get aboutConsoleTitle => 'Konsole & Patch';

  @override
  String get aboutConsoleSubtitle => 'Virtuelle Konsole, GDTF und DMX-Patch';

  @override
  String get aboutConsolePageTitle => 'Konsole — Schnellkurs';

  @override
  String get consoleRefTocCopyText => 'Zusammenfassung kopieren';

  @override
  String get consoleRefSection1Title => 'Virtuelle Konsole & drahtloses DMX';

  @override
  String get consoleRefSection2Title => 'GDTF & GDTF Share';

  @override
  String get consoleRefSection3Title => 'Patch & Universen';

  @override
  String get consoleRefSection4Title => 'Checkliste';

  @override
  String get consoleRefSection1Paragraph =>
      'Eine virtuelle Konsole ermöglicht die Steuerung einer Show über Tablet oder Smartphone, wobei DMX über das Netzwerk (Art-Net oder sACN) statt über ein direktes DMX-Kabel gesendet wird.';

  @override
  String get consoleRefSection1Bullet1 =>
      'Wi-Fi bringt Latenz und Ausfallrisiko mit sich: nur für Einrichtungsarbeiten nutzen, nicht für kritische Live-Cues ohne kabelgebundene Rückfalllösung.';

  @override
  String get consoleRefSection1Bullet2 =>
      'Sicherstellen, dass der DMX-über-IP-Node/die Schnittstelle tatsächlich das auf der virtuellen Konsole konfigurierte Art-Net- oder sACN-Universum empfängt.';

  @override
  String get consoleRefSection1Bullet3 =>
      'Für kritische Momente der Show einen kabelgebundenen Rückfall (direktes DMX oder Ethernet) bereithalten.';

  @override
  String get consoleRefSection2GdtfTitle => 'GDTF (General Device Type Format)';

  @override
  String get consoleRefSection2GdtfBody =>
      'Ein standardisiertes Dateiformat, das die Eigenschaften eines Scheinwerfers beschreibt (DMX-Modi, Farbräder, 3D-Geometrie) für einen zuverlässigen Import in jede kompatible Konsole.';

  @override
  String get consoleRefSection2ShareTitle => 'GDTF Share';

  @override
  String get consoleRefSection2ShareBody =>
      'Die offizielle Online-Datenbank, in der Hersteller die GDTF-Dateien ihrer Geräte veröffentlichen, kostenlos zum Patchen herunterladbar.';

  @override
  String get consoleRefSection3Bullet1 =>
      'Ein DMX-Universum enthält 512 Kanäle; jedes Gerät belegt je nach gewähltem DMX-Modus einen oder mehrere Kanäle.';

  @override
  String get consoleRefSection3Bullet2 =>
      'Immer den tatsächlich am physischen Gerät eingestellten DMX-Modus prüfen — er muss mit dem im Konsolen-Patch gewählten übereinstimmen.';

  @override
  String get consoleRefSection3Bullet3 =>
      'Eine Dokumentation des Patches (Adressen, Universen, Modi) erleichtert die Fehlersuche und die Übergabe an eine andere Person.';

  @override
  String get consoleRefSection4Bullet1 =>
      'Die Netzwerkverbindung (Wi-Fi oder kabelgebunden) zwischen virtueller Konsole und DMX-Node vor der Show prüfen.';

  @override
  String get consoleRefSection4Bullet2 =>
      'Bestätigen, dass jedes Gerät im richtigen Universum und auf der richtigen Startadresse gepatcht ist.';

  @override
  String get consoleRefSection4Bullet3 =>
      'Eine aktuelle GDTF-Datei von GDTF Share statt eines generischen Profils verwenden.';

  @override
  String get consoleRefSection4Bullet4 =>
      'Einen Rückfallplan für Netzwerk- oder Wi-Fi-Ausfälle während der Show vorsehen.';

  @override
  String get consoleRefFooterNote =>
      'Dieser Inhalt ist ein allgemeiner Hinweis; für spezifische DMX-Modi und Verfahren die Herstellerdokumentation konsultieren.';

  @override
  String get aboutCinemaTitle => 'Kino';

  @override
  String get aboutCinemaSubtitle => 'Kamera, Schärfentiefe und Bildrate';

  @override
  String get aboutCinemaPageTitle => 'Kino — Schnellkurs';

  @override
  String get cinemaRefTocCopyText => 'Zusammenfassung kopieren';

  @override
  String get cinemaRefSection1Title => 'Kamera-Grundlagen';

  @override
  String get cinemaRefSection2Title => 'Schärfentiefe & Fokus';

  @override
  String get cinemaRefSection3Title => 'Bildrate & Verschluss';

  @override
  String get cinemaRefSection4Title => 'Checkliste';

  @override
  String get cinemaRefSection1Bullet1 =>
      'Sensor: die lichtempfindliche Fläche, die das Bild erfasst; ihre Größe beeinflusst bei gegebener Brennweite den Bildwinkel und die Schärfentiefe.';

  @override
  String get cinemaRefSection1Bullet2 =>
      'Brennweite: die Entfernung (in mm), die den Bildwinkel bestimmt — eine kurze Brennweite ist Weitwinkel, eine lange ist Tele.';

  @override
  String get cinemaRefSection1Bullet3 =>
      'Blende (f/): die Größe der Blendenöffnung, die sowohl die einfallende Lichtmenge als auch die Schärfentiefe steuert.';

  @override
  String get cinemaRefSection2Paragraph =>
      'Die Schärfentiefe ist der Bereich akzeptabler Schärfe vor und hinter dem scharfgestellten Motiv.';

  @override
  String get cinemaRefSection2Bullet1 =>
      'Eine offene Blende (f/1.4, f/2) ergibt eine geringe Schärfentiefe (unscharfer Hintergrund).';

  @override
  String get cinemaRefSection2Bullet2 =>
      'Eine geschlossene Blende (f/11, f/16) ergibt eine große Schärfentiefe (alles scharf).';

  @override
  String get cinemaRefSection3FormulaTitle => 'Verschlusswinkel-Formel';

  @override
  String get cinemaRefSection3Formula1 =>
      'Verschlusszeit = 1 / (2 × Bildrate in fps) für einen Verschlusswinkel von 180°, die Standardreferenz im Film.';

  @override
  String get cinemaRefSection3Bullet1 =>
      '24 Bilder/Sekunde ist die klassische Kino-Bildrate; 25 oder 30 fps sind je nach Videostandard (PAL/NTSC) im Broadcast üblich.';

  @override
  String get cinemaRefSection3Bullet2 =>
      'Ein engerer Verschlusswinkel (90°, 45°) ergibt eine ruckartigere Optik, die für stilisierte Actionszenen genutzt wird.';

  @override
  String get cinemaRefSection4Bullet1 =>
      'Prüfen, dass die Kamerabildrate mit der Frequenz der Lichtquellen übereinstimmt (Flicker vermeiden).';

  @override
  String get cinemaRefSection4Bullet2 =>
      'Die Blende an die gewünschte Schärfentiefe anpassen, nicht nur an die Belichtung.';

  @override
  String get cinemaRefSection4Bullet3 =>
      'Während des gesamten Drehs einen konsistenten Verschlusswinkel beibehalten für eine einheitliche Bewegungsanmutung.';

  @override
  String get cinemaRefSection4Bullet4 =>
      'Vor dem endgültigen Dreh immer unter realen Set-Bedingungen testen.';

  @override
  String get cinemaRefFooterNote =>
      'Dieser Inhalt ist ein allgemeiner pädagogischer Hinweis; die endgültigen Einstellungen hängen von der Ausrüstung und der künstlerischen Absicht ab.';

  @override
  String get aboutTimecodeTitle => 'Timecode';

  @override
  String get aboutTimecodeSubtitle => 'SMPTE, Drop-Frame und Bildraten';

  @override
  String get aboutTimecodePageTitle => 'Timecode — Schnellkurs';

  @override
  String get timecodeRefTocCopyText => 'Zusammenfassung kopieren';

  @override
  String get timecodeRefSection1Title => 'Was ist SMPTE-Timecode';

  @override
  String get timecodeRefSection2Title => 'Drop-Frame vs. Non-Drop-Frame';

  @override
  String get timecodeRefSection3Title => 'Gängige Bildraten';

  @override
  String get timecodeRefSection4Title => 'Checkliste';

  @override
  String get timecodeRefSection1FormatTitle => 'Format';

  @override
  String get timecodeRefSection1FormatBody =>
      'HH:MM:SS:FF — Stunden, Minuten, Sekunden und Bildnummer (Frame), die bei jeder vollen Bildrate zurückgesetzt wird.';

  @override
  String get timecodeRefSection1Bullet1 =>
      'SMPTE-Timecode synchronisiert Bild, Ton und Licht auf eine gemeinsame Zeitreferenz.';

  @override
  String get timecodeRefSection1Bullet2 =>
      'Jedes Bild trägt eine eindeutige Adresse, was eine präzise Referenzierung sowohl in der Postproduktion als auch im Live-Betrieb ermöglicht.';

  @override
  String get timecodeRefSection2Paragraph =>
      'Drop-Frame (DF) existiert, weil manche Bildraten (29,97 fps) keine ganze Anzahl von Bildern pro Sekunde ergeben, wodurch der Timecode ohne Korrektur von der Echtzeit abweicht.';

  @override
  String get timecodeRefSection2Bullet1 =>
      'Non-Drop-Frame (NDF): zählt Bilder ohne Sprünge; einfach, driftet aber bei 29,97 fps leicht von der Echtzeit ab.';

  @override
  String get timecodeRefSection2Bullet2 =>
      'Drop-Frame (DF): überspringt periodisch Bildnummern (keine echten Bilder), um den Timecode wieder an die Echtzeit anzupassen.';

  @override
  String get timecodeRefSection3Bullet1 =>
      '24 fps: die klassische Kino-Bildrate.';

  @override
  String get timecodeRefSection3Bullet2 =>
      '25 fps: PAL-Standard (Europa); 30 fps (oder 29,97 DF/NDF): NTSC-Standard (Nordamerika, Japan).';

  @override
  String get timecodeRefSection3Bullet3 =>
      '50 fps und 59,94/60 fps: hohe Bildraten, die im Broadcast und für Zeitlupen genutzt werden.';

  @override
  String get timecodeRefSection3Bullet4 =>
      'Immer prüfen, dass alle Quellen (Kamera, Ton, Licht, Video) dieselbe Referenzbildrate verwenden.';

  @override
  String get timecodeRefSection4Bullet1 =>
      'Bildrate und Modus (DF/NDF) auf allen Quellen vor Beginn der Show oder des Drehs bestätigen.';

  @override
  String get timecodeRefSection4Bullet2 =>
      'Sicherstellen, dass die Master-Timecode-Quelle (Master Clock) klar identifiziert und an alle Geräte verteilt ist.';

  @override
  String get timecodeRefSection4Bullet3 =>
      'Bei Verdacht auf Drift den angezeigten Timecode über einen ausreichend langen Zeitraum mit einer Referenzuhr vergleichen.';

  @override
  String get timecodeRefFooterNote =>
      'Dieser Inhalt ist ein allgemeiner Hinweis; die SMPTE-Spezifikationen und die Dokumentation der verwendeten Geräte konsultieren.';

  @override
  String get aboutConversionsTitle => 'Umrechnungen & BPM';

  @override
  String get aboutConversionsSubtitle =>
      'Einheiten, BPM und DMX auf einen Blick';

  @override
  String get aboutConversionsPageTitle => 'Umrechnungen & BPM — Schnellkurs';

  @override
  String get conversionsRefTocCopyText => 'Zusammenfassung kopieren';

  @override
  String get conversionsRefSection1Title => 'Warum umrechnen';

  @override
  String get conversionsRefSection2Title => 'BPM ↔ Millisekunden';

  @override
  String get conversionsRefSection3Title => 'DMX ↔ Prozent / 8-Bit ↔ 16-Bit';

  @override
  String get conversionsRefSection4Title => 'Checkliste';

  @override
  String get conversionsRefSection1Paragraph =>
      'Am Pult werden Einheiten oft gemischt (musikalische BPM, Delay-Millisekunden, DMX-Prozentwerte, 8/16-Bit-Werte): schnelles und fehlerfreies Umrechnen verhindert Abweichungen zwischen Licht-, Ton- und Video-Effekten.';

  @override
  String get conversionsRefSection2FormulaTitle => 'Formel';

  @override
  String get conversionsRefSection2Formula1 =>
      'Schlagdauer (ms) = 60.000 / BPM.';

  @override
  String get conversionsRefSection2Bullet1 =>
      'Beispiel: bei 120 BPM dauert ein Schlag 500 ms; eine Sechzehntelnote (1/4 Schlag) dauert 125 ms.';

  @override
  String get conversionsRefSection2Bullet2 =>
      'Nützlich, um einen Lichteffekt, ein Audio-Delay oder einen Videoclip auf das Tempo eines Titels abzustimmen.';

  @override
  String get conversionsRefSection3Bullet1 =>
      'Ein 8-Bit-DMX-Wert reicht von 0 bis 255; in Prozent entspricht 255 100 %.';

  @override
  String get conversionsRefSection3Bullet2 =>
      'In 16-Bit ergeben zwei kombinierte Kanäle (fein/grob) eine Auflösung von 0 bis 65.535 für eine feinere Steuerung (Dimmer, Pan/Tilt).';

  @override
  String get conversionsRefSection3Bullet3 =>
      'Vor dem Patchen den tatsächlich am Gerät eingestellten Modus (8-Bit oder 16-Bit) prüfen, sonst stimmen die Werte nicht überein.';

  @override
  String get conversionsRefSection4Bullet1 =>
      'Vor der Eingabe eines Werts immer die angezeigte Einheit prüfen (ms, BPM, %, 8-Bit, 16-Bit).';

  @override
  String get conversionsRefSection4Bullet2 =>
      'Bei kritischen Werten (Synchronisation, Sicherheit) neu berechnen statt aus dem Kopf zu runden.';

  @override
  String get conversionsRefSection4Bullet3 =>
      'Die verwendeten Umrechnungen im technischen Rider dokumentieren, um die Übergabe der Show zu erleichtern.';

  @override
  String get conversionsRefFooterNote =>
      'Dieser Inhalt ist ein allgemeiner Hinweis; für die genauen Auflösungsmodi die Gerätedokumentation konsultieren.';

  @override
  String get aboutCategoryNetworkTitle => 'Netzwerk & Protokolle';

  @override
  String get aboutCategoryAudioRfTitle => 'Audio & RF';

  @override
  String get aboutCategoryVideoCinemaTitle => 'Video & Kino';

  @override
  String get aboutCategoryLightingTitle => 'Licht, Laser & Konsole';

  @override
  String get aboutCategoryRiggingElecTitle => 'Rigging & Elektrik';

  @override
  String get aboutCategoryToolsTitle => 'Praktische Werkzeuge';

  @override
  String get pinnedItemsTitle => 'Meine Pins';

  @override
  String get homePinnedItemsSubtitle =>
      'Finde deine angepinnten Werkzeuge und Referenzen schnell wieder.';

  @override
  String get pinnedItemsEmpty =>
      'Noch keine angepinnten Werkzeuge oder Referenzen.';

  @override
  String get fixtureInfoSectionIdentification => 'Identifikation';

  @override
  String get fixtureInfoLabelName => 'Name';

  @override
  String get fixtureInfoLabelId => 'ID';

  @override
  String get fixtureInfoSectionDmx => 'DMX / Netzwerk';

  @override
  String get fixtureInfoLabelUniverse => 'Universum';

  @override
  String get fixtureInfoLabelAddress => 'Adresse';

  @override
  String get fixtureInfoLabelMode => 'Modus';

  @override
  String get fixtureInfoLabelChannelCount => 'Kanäle';

  @override
  String get fixtureInfoLabelGdtfSpec => 'GDTF-Datei';

  @override
  String get fixtureInfoSectionPhysical => 'Physisch';

  @override
  String get fixtureInfoLabelWeight => 'Gewicht';

  @override
  String fixtureInfoValueKg(Object kg) {
    return '$kg kg';
  }

  @override
  String get fixtureInfoLabelDimensions => 'Abmessungen';

  @override
  String fixtureInfoValueDimensionsCm(
      Object heightCm, Object lengthCm, Object widthCm) {
    return '$lengthCm × $widthCm × $heightCm cm';
  }

  @override
  String get fixtureInfoLabelLegHeight => 'Standfußhöhe';

  @override
  String fixtureInfoValueCm(Object cm) {
    return '$cm cm';
  }

  @override
  String get fixtureInfoSectionElectrical => 'Elektrisch';

  @override
  String get fixtureInfoLabelPower => 'Leistung';

  @override
  String fixtureInfoValueWatts(Object watts) {
    return '$watts W';
  }

  @override
  String get fixtureInfoSectionEnvironment => 'Umgebung';

  @override
  String get fixtureInfoLabelOperatingTemp => 'Betriebstemperatur';

  @override
  String fixtureInfoValueTempRange(Object highC, Object lowC) {
    return '$lowC°C – $highC°C';
  }

  @override
  String get fixtureInfoNoGdtfData =>
      'Keine physischen Daten verfügbar (GDTF fehlt oder unvollständig).';

  @override
  String get patch3dTitle => '3D-Viewer';

  @override
  String get patch3dOpenButton => 'In 3D ansehen';

  @override
  String get patch3dResetCameraTooltip => 'Kamera zentrieren';

  @override
  String get patch3dFiltersTooltip => 'Filter und Farben';

  @override
  String get patch3dZoomToFitTooltip => 'Alles einpassen';

  @override
  String get patch3dCameraViewsTooltip => 'Kameraansichten';

  @override
  String get patch3dCameraViewFront => 'Vorne';

  @override
  String get patch3dCameraViewTop => 'Oben';

  @override
  String get patch3dCameraViewSide => 'Seite';

  @override
  String get patch3dCameraViewIso => 'Isometrisch';

  @override
  String get patch3dBackgroundColorLabel => 'Hintergrundfarbe';

  @override
  String patch3dEntriesWithoutPosition(Object count) {
    return '$count Fixture(s) ohne 3D-Position (keine Matrix im MVR).';
  }

  @override
  String get patch3dNoPositionedFixtures =>
      'Keine positionierten Fixtures anzuzeigen. Importiere ein MVR mit 3D-Positionen.';

  @override
  String get patch3dMissingModelTitle => 'Fehlende 3D-Modelle';

  @override
  String patch3dMissingModelBody(Object count) {
    return '$count Gerätetyp(en) haben kein 3D-Modell in ihrer GDTF. Stattdessen wird ein generischer Würfel (30×30×30 cm) verwendet:';
  }

  @override
  String get patch3dColorModeLabel => 'Farbgebung';

  @override
  String get patch3dColorModeByType => 'Nach Typ';

  @override
  String get patch3dColorModeByUniverse => 'Nach Universum';

  @override
  String get patch3dFilterUniverseLabel => 'Universum';

  @override
  String get patch3dFilterTypeLabel => 'Gerätetyp';

  @override
  String get patch3dFilterShowAll => 'Alle anzeigen';

  @override
  String get gdtfWizardSuggestionOpen => 'Offen';

  @override
  String get gdtfWizardSuggestionClosed => 'Geschlossen';

  @override
  String gdtfWizardSuggestionGoboSlot(int n) {
    return 'Gobo $n';
  }

  @override
  String gdtfWizardSuggestionColorSlot(int n) {
    return 'Farbe $n';
  }

  @override
  String get gdtfWizardColorWhite => 'Weiß';

  @override
  String get gdtfWizardColorRed => 'Rot';

  @override
  String get gdtfWizardColorGreen => 'Grün';

  @override
  String get gdtfWizardColorBlue => 'Blau';

  @override
  String get gdtfWizardColorYellow => 'Gelb';

  @override
  String get gdtfWizardColorCyan => 'Cyan';

  @override
  String get gdtfWizardColorMagenta => 'Magenta';

  @override
  String get gdtfWizardColorRainbow => 'Regenbogen';

  @override
  String get gdtfWizardStrobeSlowToFast => 'Strobe langsam → schnell';

  @override
  String get gdtfWizardStrobeRandom => 'Zufälliger Strobe';

  @override
  String get gdtfWizardAppBarTitle => 'Manueller GDTF-Assistent';

  @override
  String get gdtfWizardStepTitleStyle => 'Gerätetyp';

  @override
  String get gdtfWizardStepTitleFunction => 'Funktion';

  @override
  String get gdtfWizardStepTitleChannels => 'Kanäle';

  @override
  String get gdtfWizardStepTitlePixels => 'Pixel';

  @override
  String get gdtfWizardStepTitleStructure => 'Struktur';

  @override
  String gdtfWizardStepHeader(int step, String title) {
    return 'Schritt $step/5 — $title';
  }

  @override
  String get gdtfWizardErrStyle => 'Wähle einen Gerätetyp, um fortzufahren.';

  @override
  String get gdtfWizardErrFunction =>
      'Wähle mindestens eine Funktion (Wash, Spot oder Beam).';

  @override
  String get gdtfWizardErrChannels =>
      'Aktiviere mindestens einen Kanal — das Gerät muss ja etwas steuern!';

  @override
  String get gdtfWizardErrPixelCount =>
      'Für eine Multi-Pixel-Struktur sind mindestens 2 Pixel/Instanzen nötig.';

  @override
  String get gdtfWizardErrRepeatCount =>
      'Wähle mindestens 2 wiederholbare Kanäle (z. B. Red + Green oder Pan/Tilt), damit jedes Pixel korrekt als eigene Instanz erkannt wird.';

  @override
  String get gdtfWizardErrRowsCols =>
      'Gib eine gültige Anzahl an Zeilen und Spalten ein.';

  @override
  String get gdtfWizardErrModeName => 'Gib diesem DMX-Modus einen Namen.';

  @override
  String get gdtfWizardStyleIntro => 'Welchen Gerätetyp erstellst du?';

  @override
  String get gdtfWizardStyleLyreTitle => 'Moving Head';

  @override
  String get gdtfWizardStyleLyreSubtitle =>
      'Bewegter Kopf mit Pan/Tilt — Spot, Wash oder Beam Moving Head.';

  @override
  String get gdtfWizardStyleParTitle => 'PAR / Statisch';

  @override
  String get gdtfWizardStyleParSubtitle =>
      'Statisches Gerät ohne Bewegung (LED-PAR, feste Profilscheinwerfer…).';

  @override
  String get gdtfWizardStyleBarreTitle => 'Bar';

  @override
  String get gdtfWizardStyleBarreSubtitle =>
      'Lineare Bar, oft mit Pixelsteuerung (LED-Bar, X4 Bar…).';

  @override
  String get gdtfWizardPanTiltCheckTitle =>
      'Dieses Gerät hat einen Pan/Tilt-Motor';

  @override
  String get gdtfWizardPanTiltCheckSubtitle =>
      'Fügt die Pan/Tilt-Kanäle in 16 Bit hinzu (GDTF-Standard).';

  @override
  String get gdtfWizardFunctionIntro =>
      'Welche Funktion(en) hat dieses Gerät? (Mehrfachauswahl)';

  @override
  String get gdtfWizardFunctionWash => 'Wash';

  @override
  String get gdtfWizardFunctionSpot => 'Spot';

  @override
  String get gdtfWizardFunctionBeam => 'Beam';

  @override
  String get gdtfWizardFunctionHint =>
      'Damit werden nur nützliche Kanäle für den nächsten Schritt vorausgewählt (Wash → Frost/Zoom, Spot → Gobo/Focus/Prisma, Beam → enger Strahl). Du kannst danach alles anpassen.';

  @override
  String get gdtfWizardChannelsIntro => 'Aktiviere die DMX-Kanäle des Geräts.';

  @override
  String get gdtfWizardSectionIntensity => 'INTENSITÄT';

  @override
  String get gdtfWizardChannelDimmer => 'Dimmer';

  @override
  String get gdtfWizardChannelStrobe => 'Shutter / Strobe';

  @override
  String get gdtfWizardSectionColor => 'FARBE';

  @override
  String get gdtfWizardChannelCto => 'CTO-Filter (Farbtemperatur)';

  @override
  String get gdtfWizardChannelColorMacro => 'Farbmakro (Presets)';

  @override
  String get gdtfWizardSectionPosition => 'POSITION';

  @override
  String get gdtfWizardPanTiltNote =>
      'Pan/Tilt wird automatisch hinzugefügt (16 Bit). Bei einem Gerät mit mehreren unabhängigen beweglichen Köpfen kannst du es im Schritt „Pixel“ pro Kopf aufteilen.';

  @override
  String get gdtfWizardSectionBeamShaping => 'STRAHL';

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
  String get gdtfWizardChannelPrismRot => 'Prismenrotation';

  @override
  String get gdtfWizardSectionGobos => 'GOBOS';

  @override
  String get gdtfWizardChannelGobo1 => 'Gobo-Rad 1';

  @override
  String get gdtfWizardChannelGobo1Rot => 'Gobo-1-Rotation';

  @override
  String get gdtfWizardChannelGobo2 => 'Gobo-Rad 2';

  @override
  String get gdtfWizardChannelGobo2Rot => 'Gobo-2-Rotation';

  @override
  String get gdtfWizardSectionEffectsControl => 'EFFEKTE & STEUERUNG';

  @override
  String get gdtfWizardChannelEffects => 'Effekte / Makros';

  @override
  String get gdtfWizardChannelReset => 'Reset';

  @override
  String get gdtfWizardSlotsHint =>
      'Slots (einer pro Zeile, optional) — z. B. Offen, Gobo 1…';

  @override
  String get gdtfWizardSlotsTooltip => 'Vorschlag';

  @override
  String get gdtfWizardChannelPanTiltPerHead => 'Pan/Tilt (pro Kopf)';

  @override
  String get gdtfWizardPixelsIntro =>
      'Hat dieses Gerät mehrere einzeln ansteuerbare Pixel/Zellen (LED-Matrix, Pixel-Bar…)?';

  @override
  String get gdtfWizardMultiplePixelsTitle => 'Mehrere Pixel / Instanzen';

  @override
  String get gdtfWizardMultiplePixelsSubtitle =>
      'Andernfalls bleiben alle im vorigen Schritt aktivierten Kanäle einmalig (nur ein Ausgang).';

  @override
  String get gdtfWizardSectionPixelCount => 'ANZAHL PIXEL';

  @override
  String get gdtfWizardSectionPixelContent => 'INHALT EINES PIXELS';

  @override
  String get gdtfWizardNoRepeatableChannels =>
      'Noch kein wiederholbarer Kanal. Geh zurück zum Schritt „Stil“ (Pan/Tilt) oder „Kanäle“ (Dimmer, Shutter/Strobe, Farbe…) und aktiviere mindestens ein Attribut, das pro Kopf/Pixel wiederholt werden soll.';

  @override
  String gdtfWizardRepeatPerPixelSubtitle(String label) {
    return 'Ein Kanal pro Pixel (z. B. $label 1, $label 2…)';
  }

  @override
  String get gdtfWizardRepeatGlobalSubtitle =>
      'Bleibt ein einziger globaler Kanal für das gesamte Gerät';

  @override
  String get gdtfWizardModeNameLabel => 'Name des DMX-Modus';

  @override
  String get gdtfWizardModeNameHint => 'z. B. Standard, 16 Bit, Pixel Mode…';

  @override
  String get gdtfWizardSingleOutputNote =>
      'Gerät mit nur einem Ausgang (keine mehreren Pixel): hier gibt es nichts zu konfigurieren, jeder aktivierte Kanal bleibt einmalig.';

  @override
  String get gdtfWizardSectionLayout => 'ANORDNUNG';

  @override
  String get gdtfWizardArrangementLinearTitle => 'Lineare Bar';

  @override
  String gdtfWizardArrangementLinearSubtitle(int count) {
    return 'Pixel in einer Reihe angeordnet (z. B. X4 Bar). Nummeriert 1 bis $count.';
  }

  @override
  String get gdtfWizardArrangementMatrixTitle => 'Matrix (Raster)';

  @override
  String get gdtfWizardArrangementMatrixSubtitle =>
      'Pixel in Zeilen × Spalten angeordnet (z. B. LED-Wand, JDC1 Pixel Curve).';

  @override
  String get gdtfWizardArrangementModulesTitle => 'Unabhängige Module';

  @override
  String get gdtfWizardArrangementModulesSubtitle =>
      'Mehrere identische Köpfe/Module in einem Gehäuse (z. B. JDC1).';

  @override
  String get gdtfWizardRowsLabel => 'Zeilen';

  @override
  String get gdtfWizardColsLabel => 'Spalten';

  @override
  String gdtfWizardMatrixTotal(int count) {
    return 'Gesamt: $count Pixel (zeilenweise nummeriert).';
  }

  @override
  String get gdtfWizardModulesNote =>
      'Jedes Modul kann seine eigene Farbe/seinen eigenen Dimmer/Strobe UND seinen eigenen Zoom/Focus/Iris/Frost/Prisma/Gobo haben — geh zurück zum Schritt „Pixel“ und aktiviere für jeden betroffenen Strahlkanal, dass er pro Modul wiederholt werden soll, statt für alle gemeinsam zu gelten.';

  @override
  String get gdtfWizardCancel => 'Abbrechen';

  @override
  String get gdtfWizardBack => 'Zurück';

  @override
  String get gdtfWizardValidateAndEdit => 'Bestätigen und bearbeiten';

  @override
  String get gdtfWizardNext => 'Weiter';

  @override
  String get gdtfWizardDefaultModeName => 'Manuell';

  @override
  String get gdtfWizardOrDivider => 'ODER';

  @override
  String get gdtfWizardManualButtonLabel =>
      'Manueller Assistent (ohne PDF) — Stil, Kanäle, Pixel…';

  @override
  String get gdtfWizardColorModeNone => 'Keine';

  @override
  String get gdtfWizardColorModeRgb => 'RGB';

  @override
  String get gdtfWizardColorModeRgbw => 'RGB + Weiß';

  @override
  String get gdtfWizardColorModeRgbwaUv => 'RGB + Weiß + Amber + UV';

  @override
  String get gdtfWizardColorModeCmy => 'CMY (Cyan/Magenta/Gelb)';

  @override
  String get gdtfWizardColorModeWheel => 'Farbrad';

  @override
  String get gdtfWizardColorAmber => 'Amber';

  @override
  String get gdtfWizardColorUv => 'UV';

  @override
  String get gdtfWizardChannelCtoShort => 'CTO';

  @override
  String get gdtfManualTab => 'Manueller Assistent';

  @override
  String get gdtfWizardManualTabTitle => 'GDTF ohne PDF erstellen';

  @override
  String get gdtfWizardManualTabIntro =>
      'Kein PDF-Handbuch zur Hand, oder das Gerät ist dafür zu einfach? Beschreibe dein Gerät in 5 Schritten (Stil, Funktionen, Kanäle, Pixel, Struktur) und die App erstellt direkt eine konforme GDTF-Datei — ohne KI, ohne Upload.';

  @override
  String get gdtfWizardSlotsAddButton => 'Hinzufügen';

  @override
  String get gdtfWizardSlotsRowHint => 'Slot-Name';

  @override
  String get gdtfWizardSlotsRemoveTooltip => 'Entfernen';

  @override
  String get gdtfWizardSlotsEmptyHint =>
      'Noch keine benannten Slots — füge einen hinzu oder nutze einen Vorschlag.';

  @override
  String get ma3CalcTitle => 'MA3-Parameter';

  @override
  String get ma3CalcTileDescription =>
      'Wie viele Parameter braucht deine Show – und wie viele PUs?';

  @override
  String get ma3CalcTabMvr => 'Aus MVR';

  @override
  String get ma3CalcTabList => 'Geräteliste';

  @override
  String get ma3CalcAddFixture => 'Gerät hinzufügen';

  @override
  String get ma3CalcAddSheetTitle => 'Welches Gerät?';

  @override
  String get ma3CalcAddSheetSubtitle =>
      'Suche in GDTF Share, importiere eine .gdtf oder gib den Wert selbst ein.';

  @override
  String get ma3CalcSearchHint => 'z. B. MAC Aura, Robe Spiider…';

  @override
  String get ma3CalcSearchFailed =>
      'Suche gerade nicht möglich. Prüfe deine Verbindung.';

  @override
  String get ma3CalcNoResult =>
      'Keine Treffer. Versuche einen anderen Namen oder die manuelle Eingabe.';

  @override
  String get ma3CalcImportGdtf => '.gdtf-Datei';

  @override
  String get ma3CalcManualEntry => 'Manuelle Eingabe';

  @override
  String get ma3CalcManualName => 'Gerätename';

  @override
  String get ma3CalcChooseMode => 'Welcher DMX-Modus?';

  @override
  String ma3CalcModeSummary(int params, int channels) {
    return '$params MA3-Param. · $channels DMX-Kanäle';
  }

  @override
  String get ma3CalcModeUnknown => 'Modus ohne lesbare Kanäle';

  @override
  String get ma3CalcHowMany => 'Wie viele Geräte?';

  @override
  String get ma3CalcDownloadFailed => 'GDTF konnte nicht geladen werden.';

  @override
  String get ma3CalcGdtfUnreadable =>
      'Diese GDTF ist nicht lesbar (Datei beschädigt?).';

  @override
  String get ma3CalcGdtfNoMode => 'Kein DMX-Modus in dieser GDTF.';

  @override
  String ma3CalcNotGdtf(String name) {
    return '„$name“ ist keine .gdtf-Datei.';
  }

  @override
  String ma3CalcNotMvr(String name) {
    return '„$name“ ist keine .mvr-Datei.';
  }

  @override
  String get ma3CalcPickFailed => 'Datei konnte nicht geöffnet werden.';

  @override
  String get ma3CalcMvrUnreadable =>
      'Diese MVR ist nicht lesbar (kein gültiges Archiv).';

  @override
  String get ma3CalcMvrNoScene =>
      'Keine GeneralSceneDescription.xml in dieser MVR.';

  @override
  String get ma3CalcMvrNoFixtures => 'Keine Geräte in dieser MVR.';

  @override
  String get ma3CalcMvrEmptyTitle => 'Her mit deiner MVR 🎛️';

  @override
  String get ma3CalcMvrEmptyBody =>
      'Export aus Vectorworks, Capture, grandMA3, Depence… Wir zählen die Geräte, lesen ihre GDTFs und sagen dir, wie viele Parameter (und PUs) du brauchst.';

  @override
  String get ma3CalcPickMvr => '.mvr-Datei wählen';

  @override
  String get ma3CalcChangeFile => 'Ändern';

  @override
  String get ma3CalcListEmptyTitle => 'Dein Rig, Gerät für Gerät';

  @override
  String get ma3CalcListEmptyBody =>
      'Etwa 6 × MAC Aura, 23 × Studio Color… Geräte hinzufügen, Modus wählen – die Summe erscheint von selbst.';

  @override
  String get ma3CalcYourSystem => 'Dein Pult';

  @override
  String get ma3CalcSafetyMargin => 'Sicherheitsreserve';

  @override
  String get ma3CalcNoMargin => 'Keine';

  @override
  String get ma3CalcTotalParams => 'MA3-Parameter';

  @override
  String ma3CalcFixturesAndUniverses(int fixtures, int universes) {
    return '$fixtures Geräte · ≈ $universes DMX-Universen';
  }

  @override
  String ma3CalcWithMargin(int percent, String value) {
    return 'Mit $percent % Reserve: $value';
  }

  @override
  String get ma3CalcCopySummary => 'Zusammenfassung kopieren';

  @override
  String ma3CalcVerdictSessionMax(String max) {
    return 'Über $max Parameter: das ist das Maximum einer grandMA3-Session.';
  }

  @override
  String ma3CalcVerdictOnPcTooSmall(String max) {
    return 'onPC ist bei $max Parametern am Limit';
  }

  @override
  String get ma3CalcVerdictOnPcTooSmallSub =>
      'Du brauchst ein grandMA3-Pult (+ PUs bei Bedarf): wähle es oben, um die Konfiguration zu sehen.';

  @override
  String get ma3CalcVerdictOnPcOk => 'onPC reicht 👌';

  @override
  String ma3CalcVerdictOnPcOkSub(String max) {
    return 'Jede onPC-Hardware (Command Wing, Fader Wing, Node 4k, Rack-Unit…) schaltet $max Parameter frei.';
  }

  @override
  String ma3CalcVerdictBaseOk(String console) {
    return 'Dein $console reicht, keine PU nötig 🎉';
  }

  @override
  String ma3CalcVerdictCapacity(String capacity) {
    return 'Gesamtkapazität: $capacity Parameter.';
  }

  @override
  String ma3CalcVerdictAddPu(String units) {
    return 'Füge $units hinzu';
  }

  @override
  String ma3CalcVerdictXlOnly(int count) {
    return 'Oder einfacher: $count × PU XL.';
  }

  @override
  String ma3CalcUnknownNotCounted(int count) {
    return '$count Gerät(e) ohne Daten werden nicht gezählt: unten korrigieren.';
  }

  @override
  String ma3CalcFixtureTypes(int count) {
    return 'Gerätetypen ($count)';
  }

  @override
  String ma3CalcMvrCounts(int fixtures, int unpatched) {
    return '$fixtures Geräte · $unpatched ungepatcht';
  }

  @override
  String ma3CalcMultipatchNote(int count) {
    return 'Davon $count Multipatch, sicherheitshalber mitgezählt.';
  }

  @override
  String ma3CalcPerUnit(int params) {
    return '$params Param. pro Gerät';
  }

  @override
  String get ma3CalcUnknownParams => 'Parameter unbekannt';

  @override
  String get ma3CalcTapToFix => 'Tippen, um den Wert selbst einzugeben →';

  @override
  String get ma3CalcSwipeHint =>
      'Zeile nach links wischen zum Löschen · antippen, um Parameter zu korrigieren.';

  @override
  String get ma3CalcClear => 'Leeren';

  @override
  String get ma3CalcClearListTitle => 'Liste leeren?';

  @override
  String get ma3CalcClearListBody => 'Alle Geräte der Liste werden entfernt.';

  @override
  String get ma3CalcCancel => 'Abbrechen';

  @override
  String get ma3CalcOk => 'OK';

  @override
  String get ma3CalcParamsPerUnitTitle => 'Parameter pro Gerät';

  @override
  String get ma3CalcParamsUnit => 'Param.';

  @override
  String ma3CalcGdtfValue(int value) {
    return 'Aus der GDTF berechneter Wert: $value';
  }

  @override
  String get ma3CalcParamsHelp =>
      'Tipp: 1 Parameter = 1 DMX-Kanal, 16-Bit-„Fine“-Kanäle zählen nicht.';

  @override
  String get ma3CalcBackToGdtf => 'GDTF-Wert';

  @override
  String get ma3CalcReliabilityOkTitle => 'GDTFs wirken vollständig ✅';

  @override
  String get ma3CalcReliabilityOkBody =>
      'Alle Modi gefunden und stimmig. Das Ergebnis basiert trotzdem auf diesen GDTFs.';

  @override
  String ma3CalcReliabilityWarnTitle(int count) {
    return '$count Gerätetyp(en) prüfen';
  }

  @override
  String get ma3CalcReliabilityWarnBody =>
      'Manche GDTFs wirken unvollständig oder widersprüchlich: die Summe kann falsch sein. Details unter jedem Gerät.';

  @override
  String ma3CalcReliabilityBadTitle(int count) {
    return '$count Gerätetyp(en) ohne Daten';
  }

  @override
  String get ma3CalcReliabilityBadBody =>
      'GDTF fehlt oder Modus nicht gefunden: diese Geräte werden nicht gezählt, die Summe ist also zu niedrig. Antippen, um den Wert einzugeben.';

  @override
  String get ma3CalcDisclaimer =>
      'Die Berechnung basiert auf den GDTFs. Ist eine GDTF unvollständig oder falsch, ist es das Ergebnis auch. Immer in der grandMA3 prüfen (Fenster System Information oder Patch › DMX Universes, Spalte Coarse Params).';

  @override
  String get ma3CalcDisclaimerShort =>
      'Basiert auf den GDTFs: in der grandMA3 prüfen.';

  @override
  String get ma3CalcHowTitle => 'Wie wird gerechnet?';

  @override
  String get ma3CalcHowBody =>
      'Bei grandMA3 gilt: 1 Parameter = 1 gesteuertes Attribut = 1 „Coarse“-DMX-Kanal. Fine-Kanäle (16/24 Bit) sind gratis, virtuelle Kanäle (virtueller Dimmer…) zählen nicht für die Lizenz. Multi-Instanz-Geräte (Pixel, Zellen) werden pro Instanz aufgelöst. Die Empfehlung setzt auf möglichst wenige Geräte.';

  @override
  String get ma3CalcHowHardware => 'Parameter pro Hardware (MA-Doku, v2.3)';

  @override
  String ma3CalcHowSessionMax(String max) {
    return 'Maximum pro Session: $max';
  }

  @override
  String get ma3CalcIssueGdtfMissing =>
      'GDTF fehlt in der MVR: Parameter unbekannt.';

  @override
  String get ma3CalcIssueUnreadable => 'GDTF nicht lesbar.';

  @override
  String ma3CalcIssueModeMissing(String modes) {
    return 'Kein Modus in der MVR angegeben. GDTF-Modi: $modes';
  }

  @override
  String ma3CalcIssueModeNotFound(String mode, String modes) {
    return 'Modus „$mode“ nicht in der GDTF. Verfügbar: $modes';
  }

  @override
  String get ma3CalcIssueModeGuessed =>
      'Kein Modus in der MVR: der einzige GDTF-Modus wurde verwendet.';

  @override
  String ma3CalcIssueModePartial(String mode) {
    return 'Modus über ähnlichen Namen gefunden: „$mode“.';
  }

  @override
  String get ma3CalcIssueNoChannels => 'Dieser Modus hat keine DMX-Kanäle.';

  @override
  String ma3CalcIssueNoFunction(int count) {
    return '$count Kanal/Kanäle ohne Funktion oder Attribut: GDTF wohl unvollständig.';
  }

  @override
  String ma3CalcIssueOverlap(int count) {
    return '$count Kanal/Kanäle auf bereits belegter DMX-Adresse: GDTF widersprüchlich.';
  }

  @override
  String ma3CalcIssueGaps(int count) {
    return '$count leere DMX-Adresse(n) im Modus: fehlende Kanäle?';
  }

  @override
  String ma3CalcIssueNameMismatch(int announced, int found) {
    return 'Der Modusname nennt $announced Kanäle, die GDTF beschreibt $found.';
  }

  @override
  String ma3CalcIssueUnknownGeometry(int count) {
    return '$count Kanal/Kanäle mit nicht vorhandener Geometrie.';
  }

  @override
  String get ma3CalcIssueManual => 'Wert manuell eingegeben.';

  @override
  String ma3CalcMarginChip(int percent) {
    return '+$percent %';
  }

  @override
  String ma3CalcHwLine(String name, String value) {
    return '$name: $value';
  }

  @override
  String ma3CalcHowOnPcMax(String max) {
    return 'onPC: max. $max (mit beliebiger onPC-Hardware)';
  }

  @override
  String get accountSignInCta => 'Anmelden';

  @override
  String get accountSignInCtaSubtitle =>
      'Dein Pro und deine Plugins, auf all deinen Geräten ✨';

  @override
  String get accountAuthTitle => 'Dein ShowTech-Konto';

  @override
  String get accountAuthSubtitle =>
      'Melde dich an, um dein Pro-Abo wiederzubekommen\nund bei der Community mitzumachen.';

  @override
  String get accountSignedInSnack => 'Angemeldet! Willkommen an Bord 🎉';

  @override
  String get accountSignedOutSnack => 'Abgemeldet. Bis bald 👋';

  @override
  String get accountSignOutConfirmTitle => 'Abmelden?';

  @override
  String get accountSignOutConfirmBody =>
      'Dein Pro-Abo bleibt mit deinem Google-Konto verknüpft: Melde dich jederzeit wieder an, um es zurückzubekommen.';

  @override
  String get videoLmCalcDistTitle => 'Projektionsabstand (Ratio × Leinwand)';

  @override
  String get videoLmSizeModeLabel => 'Bekannte Leinwandgröße';

  @override
  String get videoLmModeWidth => 'Breite';

  @override
  String get videoLmModeHeight => 'Höhe';

  @override
  String get videoLmModeDiagonal => 'Diagonale';

  @override
  String get videoLmImageHeightLabel => 'Bildhöhe (m)';

  @override
  String get videoLmImageHeightHint => 'z. B. 3.375';

  @override
  String get videoLmDiagonalLabel => 'Diagonale (Zoll)';

  @override
  String get videoLmDiagonalHint => 'z. B. 200';

  @override
  String get videoLmRatioMinLabel =>
      'Projektionsverhältnis (oder min. bei Zoom)';

  @override
  String get videoLmRatioMaxLabel => 'Max. Verhältnis (optional, Zoom)';

  @override
  String get videoLmRatioMaxHint => 'z. B. 2.10';

  @override
  String get videoLmErrMissingSizeRatio =>
      '❌ Fehlende Daten: Leinwandgröße + Verhältnis.';

  @override
  String get videoLmErrSizeGt0 => '❌ Leinwandgröße muss > 0 sein.';

  @override
  String videoLmResultImage(Object width, Object height, Object format) {
    return '📐 Bild: $width × $height m ($format)';
  }

  @override
  String videoLmResultDistance(Object distance) {
    return '✅ Abstand = $distance m';
  }

  @override
  String videoLmResultDistanceRange(Object min, Object max) {
    return '✅ Abstand: von $min m bis $max m';
  }

  @override
  String get videoLmDistanceNote =>
      'ℹ️ Abstand ab Objektiv gemessen: Bezugspunkt des Herstellers prüfen (Objektivfront oder Gehäuse).';

  @override
  String get menuViewModeList => 'Listenansicht';

  @override
  String get menuViewModeGrid => 'Kachelansicht';

  @override
  String get audioRt60Subtitle => 'Nachhallzeit eines Raums';

  @override
  String get audioSplMeterSubtitle =>
      'Schallpegel mit dem Handy-Mikrofon messen';

  @override
  String get audioImpedanceSubtitle => 'Lautsprecher in Reihe oder parallel';

  @override
  String get audioCrossoverSubtitle => 'Trennfrequenzen und Filter';

  @override
  String get audioDelayTimeSubtitle => 'Delay-Zeiten passend zum Tempo';

  @override
  String get audioNoiseDoseSubtitle => 'Lärmexposition und maximale Dauer';

  @override
  String get audioInputListSubtitle => 'Input-Liste erstellen und teilen';

  @override
  String get networkPoeSubtitle => 'PoE-Leistungsbudget eines Switches';

  @override
  String get networkFiberSubtitle =>
      'Dämpfung und Reserve einer Glasfaserstrecke';

  @override
  String get networkSubnetSubtitle => 'Maske, Adressbereich und Broadcast';

  @override
  String get networkArtNetAddressingSubtitle =>
      'DMX-Universum ↔ Net / Sub-Net / Universe';

  @override
  String get rdmPageSubtitle => 'RDM-Geräte finden und einstellen';

  @override
  String get rfSplitterSubtitle =>
      'Einfügedämpfung von Splittern und Combinern';

  @override
  String get rfCableAntennaSubtitle => 'Kabeldämpfung und Antennengewinn';

  @override
  String get rfPlannerSubtitle => 'Intermodulationsfreier Funkfrequenzplan';

  @override
  String get timecodeToolConverterSubtitle =>
      'Timecode zwischen Bildraten umrechnen';

  @override
  String get timecodeToolMathSubtitle =>
      'Timecode addieren, subtrahieren, versetzen';

  @override
  String get timecodeToolDelaySubtitle => 'Frames und Millisekunden umrechnen';

  @override
  String get timecodeToolCountdownSubtitle => 'Countdown bis zu einem Timecode';

  @override
  String get filterCorrespondenceSubtitle =>
      'Entsprechungen zwischen Filterserien';

  @override
  String get ma3CalcEditSheetTitle => 'DIESES GERÄT BEARBEITEN';

  @override
  String get ma3CalcActionChangeMode => 'Modus ändern';

  @override
  String get ma3CalcActionChangeModeSub =>
      'Gerät behalten, anderen DMX-Modus wählen';

  @override
  String get ma3CalcActionChangeType => 'Gerät ändern (GDTF)';

  @override
  String get ma3CalcActionChangeTypeSub =>
      'GDTF ersetzen oder hinzufügen: GDTF Share oder Datei';

  @override
  String get ma3CalcActionManual => 'Parameter manuell eingeben';

  @override
  String get ma3CalcActionManualSub => 'Wert pro Gerät festlegen';

  @override
  String get ma3CalcNeedGdtfFirst =>
      'Kein GDTF für dieses Gerät: zuerst auswählen.';

  @override
  String get ma3CalcReplaceSheetTitle => 'Gerät auswählen';

  @override
  String ma3CalcLineUpdated(Object label) {
    return '✅ $label aktualisiert';
  }

  @override
  String get audioPickAmplifier => 'Verstärker wählen';

  @override
  String get audioPickSpeaker => 'Lautsprecher wählen';

  @override
  String get audioSearchBrandModel => 'Marke oder Modell suchen';

  @override
  String get audioCustomPreset => 'Benutzerdefiniert';

  @override
  String get audioCustomPresetHint => 'Eigene Werte eingeben';

  @override
  String audioModelsCount(Object count) {
    return '$count Modelle';
  }

  @override
  String get audioNoResults => 'Keine Ergebnisse';

  @override
  String audioChannelsCount(Object count) {
    return '$count Kanäle';
  }

  @override
  String audioRecommendedAmp(Object range) {
    return 'Empfohlener Verstärker: $range';
  }

  @override
  String audioPowerHandling(Object watts) {
    return 'Belastbarkeit: $watts W';
  }

  @override
  String get audioNoPowerData =>
      'Belastbarkeit vom Hersteller nicht veröffentlicht: nur die Impedanz wird geprüft. Herstellerpresets / Controller verwenden.';

  @override
  String get audioActiveSection =>
      'Aktiv betriebener Lautsprecher: ein Verstärkerkanal pro Sektion.';

  @override
  String audioStatusZTooLow(Object diff) {
    return '✗  Z zu niedrig (−$diff Ω)';
  }

  @override
  String audioStatusOkPct(Object pct) {
    return '✓  OK ($pct % RMS)';
  }

  @override
  String audioStatusUnderpowered(Object pct) {
    return '↓  Unterversorgt ($pct % RMS)';
  }

  @override
  String audioStatusHeadroom(Object ratio) {
    return '✓  Reserve ×$ratio';
  }

  @override
  String audioStatusOverpowered(Object ratio) {
    return '✗  Zu stark ×$ratio';
  }

  @override
  String get audioStatusInRange => '✓  Im Herstellerbereich';

  @override
  String get audioStatusBelowRange => '↓  Unter empfohlenem Bereich';

  @override
  String get audioStatusAboveRange => '⚠  Über empfohlenem Bereich';

  @override
  String get audioStatusZOkNoData => '✓  Z OK — P nicht veröffentlicht';

  @override
  String audioStatusLimiterRequired(Object ratio) {
    return '⚠  ×$ratio — Limiter erforderlich';
  }

  @override
  String get catalogSearchHint => 'Marke, Modell, Typ suchen…';

  @override
  String get catalogSearchNoResults => 'Keine Ergebnisse';

  @override
  String catalogSearchResultsCount(Object count) {
    return '$count Ergebnisse';
  }

  @override
  String get soundCatalogTitle => 'Sound-Katalog';

  @override
  String get soundCatalogSubtitle =>
      'Verstärker und Lautsprecher: Daten und Handbücher';

  @override
  String get laserCatalogTitle => 'Laser-Katalog';

  @override
  String get laserCatalogSubtitle =>
      'Laserprojektoren: Leistung, Strahl, Divergenz';

  @override
  String get catalogAmplifiers => 'Verstärker';

  @override
  String get catalogSpeakers => 'Lautsprecher';

  @override
  String get catalogUseValues => 'Übernehmen';

  @override
  String get laserPickFromCatalog => 'Aus dem Katalog wählen';

  @override
  String get laserCatalogDisclaimer => 'Herstellerangaben, nicht gemessen.';

  @override
  String get laserCatalogMissingValues =>
      'Strahldurchmesser oder Divergenz für diesen Laser nicht veröffentlicht: bitte manuell eingeben.';

  @override
  String get catalogFieldChannels => 'Kanäle';

  @override
  String get catalogFieldPowerPerChannel => 'Leistung pro Kanal';

  @override
  String get catalogFieldType => 'Typ';

  @override
  String get catalogFieldSection => 'Sektion';

  @override
  String get catalogFieldPowerHandling => 'Belastbarkeit (RMS/AES)';

  @override
  String get catalogFieldRecommendedAmp => 'Empfohlener Verstärker';

  @override
  String get catalogFieldOpticalPower => 'Optische Leistung';

  @override
  String get catalogFieldColors => 'Farben';

  @override
  String get catalogFieldScanner => 'Scanner';

  @override
  String get catalogFieldClass => 'Laserklasse';

  @override
  String get catalogFieldConsumption => 'Leistungsaufnahme';

  @override
  String get homeSafetyTitle => 'Sicherheit';

  @override
  String get homeSafetySubtitle => 'Sicherheitspläne, Montageabnahme';

  @override
  String get subscriptionCategorySafetyTitle => 'Sicherheit';

  @override
  String get subscriptionCategorySafetyDescription =>
      'Sicherheitspläne, Montageabnahme mit Fotos, Vorbehalten und Unterschrift, PDF-Export.';

  @override
  String get subscriptionHeadlineSafetySubtitle =>
      'Erstellen Sie Sicherheitspläne und Montageabnahmen direkt vor Ort, mit unterschriebenem PDF-Export.';

  @override
  String get safetyPageTitle => 'Sicherheit';

  @override
  String get safetySectionDocuments => 'Dokumente';

  @override
  String get safetyPpspsTitle => 'Sicherheitspläne';

  @override
  String get safetyPpspsSubtitle =>
      'PPSPS (Frankreich), Sicherheitsplan (Belgien)';

  @override
  String get safetyAttestationTitle => 'Montageabnahme';

  @override
  String get safetyAttestationSubtitle =>
      'Prüfungen, Vorbehalte und Unterschrift';

  @override
  String get safetyComingSoon => 'In einer kommenden Version verfügbar.';

  @override
  String get safetyLibraryTitle => 'Bibliothek';

  @override
  String safetyLibrarySummary(Object risks, Object measures, Object controls) {
    return '$risks Risiken · $measures Maßnahmen · $controls Prüfpunkte';
  }

  @override
  String safetyLibraryUpdated(Object date) {
    return 'Aktualisiert: $date';
  }

  @override
  String get safetyLibraryOffline => 'Lokale Kopie, offline nutzbar';

  @override
  String get safetyDisclaimer =>
      'Nur eine Erstellungshilfe. Für den Inhalt der Dokumente bleibt das unterzeichnende Unternehmen verantwortlich.';

  @override
  String get ppspsListTitle => 'Sicherheitspläne';

  @override
  String get ppspsNew => 'Neuer Plan';

  @override
  String get ppspsEmptyTitle => 'Noch keine Pläne';

  @override
  String get ppspsEmptyBody =>
      'Erstellen Sie Ihren ersten Sicherheitsplan. Sie können ihn danach für weitere Veranstaltungen duplizieren.';

  @override
  String get ppspsChooseCountry => 'Land der Baustelle';

  @override
  String get ppspsStatusDraft => 'Entwurf';

  @override
  String get ppspsStatusFinal => 'Abgeschlossen';

  @override
  String ppspsStepProgress(Object done, Object total) {
    return 'Schritt $done/$total';
  }

  @override
  String get ppspsUntitled => 'Ohne Titel';

  @override
  String get ppspsDuplicate => 'Duplizieren';

  @override
  String get ppspsDelete => 'Löschen';

  @override
  String get ppspsDeleteConfirm =>
      'Diesen Plan löschen? Dies kann nicht rückgängig gemacht werden.';

  @override
  String get ppspsCancel => 'Abbrechen';

  @override
  String get ppspsSave => 'Speichern';

  @override
  String get ppspsNext => 'Weiter';

  @override
  String get ppspsPrevious => 'Zurück';

  @override
  String get ppspsStepProject => 'Projekt';

  @override
  String get ppspsStepWorkers => 'Beteiligte';

  @override
  String get ppspsStepRisks => 'Risiken';

  @override
  String get ppspsStepEmergency => 'Notfall';

  @override
  String get ppspsStepExport => 'Export';

  @override
  String get ppspsFieldEventName => 'Name der Veranstaltung';

  @override
  String get ppspsFieldVenue => 'Veranstaltungsort';

  @override
  String get ppspsFieldAddress => 'Adresse';

  @override
  String get ppspsFieldOrganizer => 'Veranstalter (Bauherr)';

  @override
  String get ppspsFieldCoordinator => 'Sicherheitskoordinator';

  @override
  String get ppspsSectionPhases => 'Phasen und Termine';

  @override
  String get ppspsPhaseMontage => 'Aufbau';

  @override
  String get ppspsPhaseExploitation => 'Veranstaltung';

  @override
  String get ppspsPhaseDemontage => 'Abbau';

  @override
  String get ppspsPhaseNotSet => 'Nicht geplant';

  @override
  String get ppspsPhaseFilterAll => 'Alle';

  @override
  String get ppspsSectionCompany => 'Ihr Unternehmen';

  @override
  String get ppspsFieldCompanyName => 'Firmenname';

  @override
  String get ppspsFieldCompanyActivity => 'Tätigkeit vor Ort';

  @override
  String get ppspsFieldResponsible => 'Verantwortlicher vor Ort';

  @override
  String get ppspsFieldPhone => 'Telefon';

  @override
  String get ppspsFieldCompany => 'Unternehmen';

  @override
  String get ppspsFieldTrade => 'Gewerk';

  @override
  String get ppspsFieldContact => 'Ansprechpartner';

  @override
  String get ppspsFieldHeadcount => 'Personenzahl';

  @override
  String get ppspsAddWorker => 'Beteiligten hinzufügen';

  @override
  String get ppspsWorkersEmpty =>
      'Fügen Sie die auf der Baustelle tätigen Firmen und Teams hinzu.';

  @override
  String ppspsWorkersTotal(Object count) {
    return 'Gesamt: $count Personen';
  }

  @override
  String get ppspsMeasuresTitle => 'Schutzmaßnahmen';

  @override
  String get ppspsMeasureCollective => 'Kollektiv';

  @override
  String get ppspsMeasureIndividual => 'Persönlich';

  @override
  String get ppspsMeasureOrganisational => 'Organisatorisch';

  @override
  String ppspsMeasureCount(Object count) {
    return '$count Maßnahmen';
  }

  @override
  String get ppspsAddCustomMeasure => 'Maßnahme hinzufügen';

  @override
  String get ppspsCustomMeasureHint => 'Weitere Maßnahme für diese Baustelle';

  @override
  String ppspsRisksSummary(Object risks, Object measures) {
    return '$risks Risiken · $measures Maßnahmen';
  }

  @override
  String get ppspsSectionNumbers => 'Notrufnummern';

  @override
  String get ppspsSectionHospital => 'Nächstes Krankenhaus';

  @override
  String get ppspsFieldHospitalName => 'Name des Krankenhauses';

  @override
  String get ppspsSectionOnSite => 'Vor Ort';

  @override
  String get ppspsFieldFirstAiders => 'Ersthelfer vor Ort';

  @override
  String get ppspsFieldAssemblyPoint => 'Sammelplatz';

  @override
  String get ppspsFieldEquipment =>
      'Notfallausrüstung (Feuerlöscher, Defibrillator…)';

  @override
  String get ppspsCritical => 'hoch';

  @override
  String get ppspsMedium => 'mittel';

  @override
  String get ppspsLow => 'niedrig';

  @override
  String get ppspsExportReady => 'Alle Schritte sind abgeschlossen.';

  @override
  String get ppspsExportMissing => 'Noch auszufüllen';

  @override
  String get ppspsExportPdf => 'Als PDF exportieren';

  @override
  String get ppspsMarkFinal => 'Als abgeschlossen markieren';

  @override
  String get safetyCountryFR => 'Frankreich';

  @override
  String get safetyCountryBE => 'Belgien';

  @override
  String get safetyCountryUK => 'Vereinigtes Königreich';

  @override
  String get safetyCountryLU => 'Luxemburg';

  @override
  String get safetyCountryDE => 'Deutschland';

  @override
  String get safetyCountryNL => 'Niederlande';

  @override
  String get ppspsExportLanguages => 'Sprachen des Dokuments';

  @override
  String get ppspsExportLanguagesHint =>
      'Für jede ausgewählte Sprache wird ein PDF erstellt.';

  @override
  String ppspsExportPdfMulti(Object count) {
    return '$count PDFs exportieren';
  }

  @override
  String get ppspsPhaseOrderError =>
      'Die Termine sind nicht in der richtigen Reihenfolge: erst Aufbau, dann Veranstaltung, dann Abbau.';

  @override
  String get ppspsFindHospital => 'Nächstes Krankenhaus suchen';

  @override
  String get ppspsFindHospitalSearching => 'Suche läuft…';

  @override
  String get ppspsFindHospitalNeedAddress =>
      'Geben Sie zuerst Ort oder Adresse der Veranstaltung ein (Schritt Projekt).';

  @override
  String get ppspsFindHospitalNoPlace =>
      'Die Adresse der Veranstaltung wurde nicht gefunden. Prüfen Sie sie im Schritt Projekt oder tragen Sie das Krankenhaus manuell ein.';

  @override
  String get ppspsFindHospitalError =>
      'Suche derzeit nicht möglich (Verbindung?). Tragen Sie das Krankenhaus manuell ein.';

  @override
  String get ppspsFindHospitalNone =>
      'Kein Krankenhaus im Umkreis von 30 km gefunden. Bitte manuell eintragen.';

  @override
  String get ppspsFindHospitalTitle => 'Krankenhäuser in der Nähe';

  @override
  String get ppspsFindHospitalVerify =>
      'Prüfen Sie, ob das gewählte Krankenhaus während der Veranstaltung eine geöffnete Notaufnahme hat.';

  @override
  String ppspsDistanceKm(Object km) {
    return '$km km';
  }

  @override
  String get ppspsHospitalEmergency => 'Notaufnahme';

  @override
  String get ppspsOsmAttribution => 'Daten © OpenStreetMap-Mitwirkende';

  @override
  String get ppspsSectionEquipment => 'Notfallausrüstung';

  @override
  String get ppspsFieldEquipmentDetails =>
      'Details (Standorte, Mengen, weitere Ausrüstung)';

  @override
  String get ppspsSectionSignatures => 'Unterschriften';

  @override
  String get ppspsSignAuthor => 'Erstellt von';

  @override
  String get ppspsSignCoordinator => 'Freigabe des Koordinators (optional)';

  @override
  String get ppspsNotSigned => 'Noch nicht unterschrieben';

  @override
  String ppspsSignedOn(Object date) {
    return 'Unterschrieben am $date';
  }

  @override
  String get ppspsSignButton => 'Unterschreiben';

  @override
  String get ppspsSignAgain => 'Erneut';

  @override
  String get ppspsSignRemove => 'Unterschrift entfernen';

  @override
  String get ppspsSignName => 'Name des Unterzeichners';

  @override
  String get ppspsSignHint =>
      'Unterschreiben Sie mit dem Finger im weißen Feld.';

  @override
  String get ppspsSignClear => 'Löschen';

  @override
  String get ppspsSignValidate => 'Unterschrift bestätigen';

  @override
  String get electricityToolPowerPlanTitle => 'Stromplan';

  @override
  String get electricityToolPowerPlanSubtitle =>
      'Baue deine Verteilung Feld für Feld: Quelle, Verteiler, Kabel, Lasten. Übersichtsplan und Lasttabelle mit einem Tipp.';

  @override
  String get ppPageTitle => 'Stromplan';

  @override
  String get ppTabPlan => 'Plan';

  @override
  String get ppTabSynoptic => 'Übersicht';

  @override
  String get ppTabLoadTable => 'Lasttabelle';

  @override
  String get ppDefaultPlanName => 'Mein Stromplan';

  @override
  String get ppStartTitle => 'Starte mit der Stromquelle ⚡';

  @override
  String get ppStartSubtitle =>
      'Aggregat, Netzanschluss oder vorhandene Steckdose. Danach wird jeder freie Abgang ein +-Feld für einen Verteiler oder ein Gerät.';

  @override
  String get ppSourceSheetTitle => 'Stromquelle';

  @override
  String get ppSourceGenerator => 'Aggregat';

  @override
  String get ppSourceMains => 'Netz / Zähler';

  @override
  String get ppSourceOutlet => 'Vorhandene Steckdose';

  @override
  String get ppGeneratorSizeLabel => 'Aggregatgröße';

  @override
  String get ppMainsSizeLabel => 'Anschlusswert';

  @override
  String get ppOutletTypeLabel => 'Steckdosentyp';

  @override
  String ppSourceCapacity(String amps, String kva) {
    return 'Verfügbar: $amps A pro Phase · $kva kVA';
  }

  @override
  String get ppPhaseWord => 'Phase';

  @override
  String get ppNameLabel => 'Name';

  @override
  String get ppValidate => 'Los geht\'s!';

  @override
  String get ppSave => 'Speichern';

  @override
  String get ppDone => 'Fertig';

  @override
  String get ppDelete => 'Löschen';

  @override
  String get ppEdit => 'Bearbeiten';

  @override
  String get ppCopy => 'Kopieren';

  @override
  String get ppRename => 'Umbenennen';

  @override
  String get ppDuplicate => 'Duplizieren';

  @override
  String get ppUnplug => 'Abstecken';

  @override
  String get ppExpand => 'Aufklappen';

  @override
  String get ppCollapse => 'Zuklappen';

  @override
  String ppCollapsedHint(String count) {
    return '▸ $count Abgänge anzeigen';
  }

  @override
  String ppCopied(String name) {
    return '📋 „$name“ kopiert: auf einem freien +-Feld einfügen';
  }

  @override
  String get ppConnectHere => 'Hier etwas anschließen';

  @override
  String ppConnectTitle(String connector) {
    return 'An $connector anschließen';
  }

  @override
  String get ppConnectPanel => 'Ein Verteiler';

  @override
  String get ppConnectPanelSubtitle =>
      'Verteiler, Schrank, Steckdosenleiste… mit eigenen Abgängen';

  @override
  String get ppConnectLoad => 'Ein Gerät';

  @override
  String get ppConnectLoadSubtitle =>
      'Licht, Ton, LED-Wand, Toiletten, Catering, Büros… du gibst die Leistung ein';

  @override
  String ppPasteTitle(String name) {
    return '„$name“ einfügen';
  }

  @override
  String get ppPasteSubtitle =>
      'Eine vollständige Kopie mit allem, was darunter hängt';

  @override
  String get ppTemplateSheetTitle => 'Verteiler wählen';

  @override
  String get ppTemplateStrip => 'Steckdosenleiste 6× Schuko';

  @override
  String get ppTemplateCustomTri => 'Eigener Verteiler (3-phasig)';

  @override
  String get ppTemplateCustomMono => 'Eigener Verteiler (1-phasig)';

  @override
  String get ppTemplateCustomSubtitle =>
      'Leer: du fügst die Abgänge selbst hinzu';

  @override
  String get ppCompatOk => '✓ Direkt';

  @override
  String get ppCompatAdapter => 'Adapter';

  @override
  String get ppLoadSheetTitle => 'Gerät anschließen';

  @override
  String get ppLoadEditTitle => 'Gerät bearbeiten';

  @override
  String get ppCategoryLabel => 'Kategorie';

  @override
  String get ppLoadNameHint => 'z. B. LED-Wand Bühne, VIP-Toiletten…';

  @override
  String get ppPowerLabel => 'Leistung';

  @override
  String get ppCosPhiLabel => 'Leistungsfaktor';

  @override
  String get ppConnectAction => 'Anschließen';

  @override
  String ppLoadPreviewTri(String amps) {
    return '≈ $amps A pro Phase (auf L1, L2, L3 verteilt)';
  }

  @override
  String ppLoadPreviewMono(String amps) {
    return '≈ $amps A auf einer Phase';
  }

  @override
  String get ppCatLighting => 'Licht';

  @override
  String get ppCatSound => 'Ton';

  @override
  String get ppCatVideo => 'Video / LED';

  @override
  String get ppCatStage => 'Bühnentechnik / Motoren';

  @override
  String get ppCatCatering => 'Catering / Bars';

  @override
  String get ppCatToilets => 'Sanitär';

  @override
  String get ppCatProduction => 'Produktion / Büros';

  @override
  String get ppCatHvac => 'Klima / Heizung';

  @override
  String get ppCatOther => 'Sonstiges';

  @override
  String get ppOutputSheetTitle => 'Abgang und Kabel';

  @override
  String get ppConnectorLabel => 'Steckverbinder';

  @override
  String get ppBreakerLabel => 'Absicherung (LS-Schalter)';

  @override
  String get ppRcdLabel => 'FI 30 mA';

  @override
  String get ppPhaseLabel => 'Phase';

  @override
  String get ppPhaseInherited =>
      'Vorgegeben durch den 1-phasigen Verteiler davor';

  @override
  String get ppCableLabel => 'Kabel';

  @override
  String get ppCableLengthLabel => 'Länge';

  @override
  String ppAmpacityShort(String amps) {
    return '$amps A zulässig (H07RN-F, Richtwert)';
  }

  @override
  String get ppPanelSheetTitle => 'Verteiler';

  @override
  String get ppPanelInputLabel => 'Eingang';

  @override
  String get ppMainBreakerLabel => 'Hauptschalter';

  @override
  String ppOutputsLabel(String count) {
    return 'Abgänge ($count)';
  }

  @override
  String ppOutputsUsed(String used, String total) {
    return '$used/$total Abgänge belegt';
  }

  @override
  String get ppFreeOutput => 'frei';

  @override
  String get ppAddOutputHint => 'Abgang hinzufügen:';

  @override
  String get ppAddOutput => 'Abgang hinzufügen';

  @override
  String get ppAddSourceOutput => 'Ausgang an der Quelle hinzufügen';

  @override
  String get ppAutoPhases => 'L1 / L2 / L3 automatisch verteilen';

  @override
  String get ppDeleteSourceTitle => 'Quelle löschen?';

  @override
  String get ppDeleteSourceBody => 'Der gesamte Plan darunter wird gelöscht.';

  @override
  String get ppDeleteOutputTitle => 'Diesen Abgang löschen?';

  @override
  String ppDeleteOutputBody(String name) {
    return '„$name“ und alles darunter werden entfernt.';
  }

  @override
  String get ppDeletePanelTitle => 'Diesen Verteiler abstecken?';

  @override
  String ppDeletePanelBody(String name) {
    return '„$name“ und alles daran Angeschlossene werden aus dem Plan entfernt.';
  }

  @override
  String get ppDeletePlanTitle => 'Diesen Plan löschen?';

  @override
  String ppDeletePlanBody(String name) {
    return '„$name“ wird endgültig gelöscht.';
  }

  @override
  String get ppProjectsTitle => 'Meine Pläne';

  @override
  String get ppNewPlan => 'Neuer Plan';

  @override
  String get ppRenamePlan => 'Plan umbenennen';

  @override
  String ppPlanSummary(String panels, String kw) {
    return '$panels Verteiler · $kw kW';
  }

  @override
  String get ppKpiPower => 'Leistung';

  @override
  String get ppKpiApparent => 'Scheinleistung';

  @override
  String get ppKpiMaxPhase => 'Stärkste Phase';

  @override
  String get ppKpiSourceUse => 'Quelle genutzt';

  @override
  String get ppKpiWorstDrop => 'Max. Spannungsfall';

  @override
  String get ppKpiGenerator => 'Empfohlenes Aggregat';

  @override
  String ppGeneratorOk(String kva) {
    return '👍 Dein Aggregat reicht (empfohlenes Minimum: $kva kVA mit 20 % Reserve)';
  }

  @override
  String ppGeneratorTooSmall(String kva) {
    return '🚨 Plane lieber ein $kva-kVA-Aggregat ein (stärkste Phase + 20 % Reserve)';
  }

  @override
  String get ppAllGood => 'Alles im grünen Bereich, gute Arbeit! 🎉';

  @override
  String ppAllGoodWithTips(String count) {
    return 'Alles grün 🎉 · $count Hinweis(e)';
  }

  @override
  String ppAlertsCount(String errors, String warnings) {
    return '$errors Fehler · $warnings Punkt(e) zu prüfen';
  }

  @override
  String get ppAlertsTitle => 'Hinweise';

  @override
  String get ppAllGoodPdf => 'Keine Hinweise.';

  @override
  String get ppAlertNoSource => 'Füge zuerst eine Stromquelle hinzu.';

  @override
  String ppAlertSourceOverload(String amps, String limit) {
    return 'Quelle überlastet: $amps A bei $limit A verfügbar';
  }

  @override
  String ppAlertNearLimit(String percent, String amps, String limit) {
    return 'Zu $percent % ausgelastet ($amps / $limit A)';
  }

  @override
  String ppAlertPanelOverload(String amps, String limit) {
    return 'Verteiler überlastet: $amps A an $limit A';
  }

  @override
  String ppAlertOutputOverload(String amps, String limit) {
    return 'Abgang überlastet: $amps A an $limit-A-Absicherung';
  }

  @override
  String ppAlertCableUndersized(String cable, String amps, String limit) {
    return 'Kabel $cable ($amps A max.) mit $limit A abgesichert: Querschnitt erhöhen';
  }

  @override
  String ppAlertVoltageDrop(String percent, String limit) {
    return 'Kumulierter Spannungsfall $percent % (über $limit %)';
  }

  @override
  String ppAlertImbalance(String percent) {
    return 'Phasen unsymmetrisch ($percent %): 1-phasige Lasten besser verteilen';
  }

  @override
  String ppAlertAdapter(String adapter) {
    return 'Adapter nötig: $adapter';
  }

  @override
  String get ppCategoriesTitle => 'Aufteilung nach Nutzung';

  @override
  String get ppSynopticSubtitle => 'Verteilungsübersicht';

  @override
  String get ppSynopticHint => '🤏 Zum Zoomen ziehen, zum Verschieben wischen';

  @override
  String get ppEmptyTab =>
      'Noch nichts anzuzeigen: baue zuerst deinen Plan im Tab Plan.';

  @override
  String get ppGoToPlan => 'Zum Plan';

  @override
  String get ppExportTitle => 'Exportieren';

  @override
  String get ppExportPdf => 'Komplettes PDF';

  @override
  String get ppExportPdfSubtitle => 'Übersicht + Lasttabelle + Hinweise';

  @override
  String get ppExportCsv => 'CSV-Tabelle';

  @override
  String get ppExportCsvSubtitle => 'Für Excel, Numbers oder Google Sheets';

  @override
  String get ppExportPng => 'Bild der Übersicht';

  @override
  String get ppExportPngSubtitle => 'Hochauflösendes PNG, weißer Hintergrund';

  @override
  String get ppExportError => 'Hoppla, der Export ist fehlgeschlagen 😕';

  @override
  String get ppPdfTitle => 'Stromverteilungsplan';

  @override
  String get ppPdfGenerated => 'Erstellt mit ShowTech Tools';

  @override
  String get ppColPanel => 'Verteiler';

  @override
  String get ppColOutput => 'Abgang';

  @override
  String get ppColConnector => 'Steckverbinder';

  @override
  String get ppColBreaker => 'Absicherung';

  @override
  String get ppColPhase => 'Phase';

  @override
  String get ppColLength => 'Länge (m)';

  @override
  String get ppColCable => 'Kabel';

  @override
  String get ppColConnected => 'Angeschlossen';

  @override
  String get ppColCategory => 'Nutzung';

  @override
  String get ppColPower => 'kW';

  @override
  String get ppColCurrent => 'I (A)';

  @override
  String get ppColDrop => 'ΔU (%)';

  @override
  String get ppDisclaimer =>
      'Richtwerte (230/400 V, H07RN-F-Kupferkabel frei verlegt, max. 5 % Spannungsfall). Dieser Plan hilft bei der Vorbereitung einer Anlage und muss von einer Elektrofachkraft nach den örtlichen Normen geprüft werden.';

  @override
  String get attestationListTitle => 'Montageabnahmen';

  @override
  String get attestationNew => 'Neue Abnahme';

  @override
  String get attestationNewTitle => 'Neue Abnahme';

  @override
  String get attestationNewBlank => 'Leere Abnahme';

  @override
  String get attestationNewFromPlan =>
      'Oder aus einem Sicherheitsplan (übernimmt Veranstaltung und Unternehmen):';

  @override
  String get attestationEmptyTitle => 'Noch keine Abnahmen';

  @override
  String get attestationEmptyBody =>
      'Prüfen Sie nach dem Aufbau jedes Element, halten Sie Vorbehalte fest und unterschreiben Sie die Abnahme vor Ort.';

  @override
  String get attestationDeleteConfirm =>
      'Diese Abnahme und ihre Fotos löschen? Dies kann nicht rückgängig gemacht werden.';

  @override
  String get attestationStatusSigned => 'Unterschrieben';

  @override
  String get attestationStatusReserve => 'Mit Vorbehalt unterschrieben';

  @override
  String attestationElementCount(Object count) {
    return '$count Elemente';
  }

  @override
  String get attestationSignatureCleared =>
      'Inhalt geändert: Die Unterschrift wurde entfernt, bitte erneut unterschreiben.';

  @override
  String get attestationFieldCompany => 'Montageunternehmen';

  @override
  String get attestationElementName =>
      'Name des Elements (z. B. vordere Traverse)';

  @override
  String get attestationElementDesc =>
      'Beschreibung (z. B. Traverse 40×40, 12 m, 4 Kettenzüge 1 t)';

  @override
  String get attestationElementFamilies => 'Durchzuführende Prüfungen';

  @override
  String get attestationAppliedLoad => 'Aufgebrachte Last (kg)';

  @override
  String get attestationRatedLoad => 'Zulässige Last (kg)';

  @override
  String get attestationDeleteElementConfirm =>
      'Dieses Element mit Prüfungen und Fotos löschen?';

  @override
  String attestationLoadSummary(Object applied, Object rated) {
    return 'Last: $applied kg / $rated kg zulässig';
  }

  @override
  String get attestationOverload => 'Last überschreitet die zulässige Last';

  @override
  String get attestationElementsEmpty =>
      'Fügen Sie die montierten Elemente hinzu: Traversen, Grid, Türme, Kettenzüge, Bühne, Screens…';

  @override
  String get attestationAddElement => 'Element hinzufügen';

  @override
  String get attestationTakePhoto => 'Foto aufnehmen';

  @override
  String get attestationPickPhoto => 'Aus der Galerie wählen';

  @override
  String get attestationPhotoError =>
      'Foto konnte nicht hinzugefügt werden. Prüfen Sie den Kamerazugriff in den Einstellungen.';

  @override
  String get attestationOk => 'OK';

  @override
  String get attestationNc => 'M';

  @override
  String get attestationNa => 'Entf.';

  @override
  String get attestationReserveLabel =>
      'Vorbehalt: Befund und geplante Maßnahme (Pflicht)';

  @override
  String get attestationPhotoRequired => 'Foto für diesen Prüfpunkt empfohlen';

  @override
  String get attestationNoElements =>
      'Keine Elemente zu prüfen: Fügen Sie sie im Schritt Elemente hinzu.';

  @override
  String get attestationReservesMissing =>
      'Jeder Mangel braucht vor der Unterschrift einen schriftlichen Vorbehalt.';

  @override
  String get attestationSignTitle => 'Unterschrift der Abnahme';

  @override
  String attestationUnanswered(Object count) {
    return '$count Prüfpunkte ohne Antwort';
  }

  @override
  String attestationReservesMissingCount(Object count) {
    return '$count Mängel ohne schriftlichen Vorbehalt (Unterschrift gesperrt)';
  }

  @override
  String attestationPhotosMissing(Object count) {
    return '$count empfohlene Fotos fehlen';
  }

  @override
  String get attestationStatElements => 'Elemente';

  @override
  String get attestationStatReserves => 'Vorbehalte';

  @override
  String get attestationStatPhotos => 'Fotos';

  @override
  String attestationStatement(Object name) {
    return 'Ich, $name, bescheinige, dass die aufgeführten Einrichtungen gemäß den Herstellerangaben und den anerkannten Regeln der Technik montiert und vor dem Einlass des Publikums geprüft wurden.';
  }

  @override
  String attestationStatementReserve(Object name) {
    return 'Ich, $name, bescheinige, dass die aufgeführten Einrichtungen gemäß den Herstellerangaben und den anerkannten Regeln der Technik montiert und vor dem Einlass des Publikums geprüft wurden, vorbehaltlich der unten genannten Punkte.';
  }

  @override
  String get attestationReserve => 'Vorbehalt';

  @override
  String get attestationReserveEmpty =>
      'Vorbehalt noch zu schreiben (Schritt Prüfungen)';

  @override
  String get attestationSignerSection => 'Unterzeichner';

  @override
  String get attestationSignerRole =>
      'Funktion (z. B. Head Rigger, Produktionsleiter)';

  @override
  String get attestationSign => 'Abnahme unterschreiben';

  @override
  String get attestationSignWithReserve => 'Mit Vorbehalt unterschreiben';

  @override
  String get attestationStepInfo => 'Angaben';

  @override
  String get attestationStepElements => 'Elemente';

  @override
  String get attestationStepControls => 'Prüfungen';

  @override
  String get attestationStepSignature => 'Unterschrift';

  @override
  String get attestationNextElement => 'Nächstes Element';

  @override
  String get attestationDeletePhotoConfirm => 'Dieses Foto löschen?';

  @override
  String get hospitalSearchPlaceTitle => 'Wo findet die Veranstaltung statt?';

  @override
  String get hospitalSearchPlaceHelp =>
      'Name des Veranstaltungsorts, Adresse, Stadt oder PLZ – auch ungefähr reicht.';

  @override
  String get hospitalSearchPlaceHint => 'z. B. Lanxess Arena, Köln';

  @override
  String get hospitalSearchButton => 'Suchen';

  @override
  String get hospitalSearchPlaceChoose =>
      'Mehrere Orte passen – welcher ist es?';

  @override
  String get hospitalSearchNoPlace =>
      'Kein Ort gefunden. Versuchen Sie es kürzer: nur Stadt, PLZ oder Name des Veranstaltungsorts.';

  @override
  String hospitalSearchAround(Object place) {
    return 'Rund um $place';
  }

  @override
  String get hospitalSearchChangePlace => 'Ändern';

  @override
  String hospitalSearchNoneRadius(Object km) {
    return 'Kein Krankenhaus im Umkreis von $km km gefunden. Bitte manuell eintragen.';
  }

  @override
  String get ppspsRatingTitle => 'Risikobewertung';

  @override
  String get ppspsSeverity => 'Schwere';

  @override
  String get ppspsProbability => 'Wahrscheinlichkeit';

  @override
  String ppspsRatingLibraryValue(Object severity, Object probability) {
    return 'Für diesen Plan angepasst. Wert der Bibliothek: Schwere $severity × Wahrscheinlichkeit $probability.';
  }

  @override
  String get ppspsRatingNoteHint => 'Begründung (z. B. Halle, kein Wind)';

  @override
  String get ppspsRatingReset => 'Auf den Wert der Bibliothek zurücksetzen';

  @override
  String get ppspsLevelHigh => 'Hohes Risiko';

  @override
  String get ppspsLevelMedium => 'Mittleres Risiko';

  @override
  String get ppspsLevelLow => 'Geringes Risiko';

  @override
  String get ppspsLevelHighRule =>
      'Wert 12 bis 16 oder Schwere 4 unabhängig von der Wahrscheinlichkeit';

  @override
  String get ppspsLevelMediumRule => 'Wert 6 bis 11';

  @override
  String get ppspsLevelLowRule => 'Wert 1 bis 5';

  @override
  String get ppspsRatingHelpTitle => 'Wie Risiken bewertet werden';

  @override
  String get ppspsRatingHelpShort => 'Bewertung';

  @override
  String get ppspsRatingHelpIntro =>
      'Jedes Risiko erhält eine Schwere von 1 bis 4 und eine Wahrscheinlichkeit von 1 bis 4. Der Wert ist ihr Produkt, von 1 bis 16.';

  @override
  String get ppspsRatingHelpAdjust =>
      'Die vorgeschlagenen Werte stammen aus der Bibliothek für eine typische Veranstaltung. Passen Sie sie für Ihre Baustelle an, indem Sie auf ein Risiko tippen; die Begründung erscheint im PDF.';
}
