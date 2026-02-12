// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Meine Tech-App';

  @override
  String get homeTitle => 'Start';

  @override
  String get menuTitle => 'Menü';

  @override
  String get settings => 'Einstellungen';

  @override
  String get language => 'Sprache';

  @override
  String get languageSystem => 'System (automatisch)';

  @override
  String get languageSystemCurrent => 'Handysprache';

  @override
  String get legalNotices => 'Rechtliche Hinweise';

  @override
  String get resetConsents => 'Einwilligungen zurücksetzen';

  @override
  String get consentsReset => 'Einwilligungen zurückgesetzt.';

  @override
  String get homeVideoTitle => 'Video';

  @override
  String get homeVideoSubtitle =>
      'Objektiv & Messung, Helligkeit, Multi-Projektor, LED und Testbilder.';

  @override
  String get homeLightTitle => 'Licht';

  @override
  String get homeLightSubtitle =>
      'Projektionsgröße, DMX-DIP-Schalter, Photometrie, Katalog, DMX-Patch.';

  @override
  String get homeLaserTitle => 'Laser';

  @override
  String get homeLaserSubtitle =>
      'Laser-Berechnungen und Sicherheit (Einwilligung bei jedem Aufruf erforderlich).';

  @override
  String get homeReferencesTitle => 'Referenzen';

  @override
  String get homeReferencesSubtitle =>
      'DMX / Netzwerk / Video: Merkblätter & Praxis-Referenzen.';

  @override
  String get disclaimerTitle => '⚠️ RECHTLICHER HINWEIS & HAFTUNGSAUSSCHLUSS';

  @override
  String get disclaimerText =>
      'NUR ZUR INFORMATION\n\nDie von dieser App bereitgestellten Berechnungen (Video, Licht, Laser) dienen ausschließlich Informations- und Richtwertzwecken.\nSie ersetzen keinesfalls:\n- zertifizierte Berechnungen,\n- technische Studien,\n- geltende offizielle Normen,\n- oder die Prüfung durch eine qualifizierte Fachperson.\n\nHAFTUNG\nDer Herausgeber dieser App kann nicht für Rechenfehler, Auslassungen, Sachschäden,\nPersonenschäden oder Vorfälle haftbar gemacht werden, die bei Installation, Betrieb oder Nutzung der Geräte auftreten.\n\nVIDEO & PROJEKTION\nErgebnisse (Größen, Verhältnisse, Helligkeit, Overlaps usw.) basieren auf theoretischen Modellen und können je nach:\nOptik, Zoom, Homogenität, Umgebungslicht, Oberfläche, Einstellungen usw. variieren.\nBitte stets mit offizieller Herstellerdokumentation verifizieren.\n\nLICHT\n\nBerechnungen sind Richtwerte und berücksichtigen nicht alle realen Bedingungen (Toleranzen, optische Verluste,\nAlterung der Lichtquellen, lokale Normen, Umgebungsbedingungen …).\n\nLASER – SICHERHEIT\nNOHD-, SZED- und CZED-Berechnungen basieren auf Standardannahmen und theoretischen Grenzwerten.\nSie berücksichtigen insbesondere nicht:\n- optische Instrumente (Ferngläser, Kameras, Teleskope …),\n- atmosphärische Bedingungen (Nebel, Regen, Staub …),\n- unerwartete Reflexionen, Fehlanwendung, spezifische Einstellungen.\nDer Einsatz eines Lasersystems bedeutet direkte Verantwortung der Bedienperson und erfordert eine passende Risikoanalyse.\n\nRISIKOAKZEPTANZ\nDurch die Nutzung dieser App bestätigt der/die Nutzer:in:\n- die geltenden Sicherheitsregeln zur Kenntnis genommen zu haben,\n- allein für seine/ihre Installationen verantwortlich zu sein,\n- die volle Verantwortung für Risiken im Zusammenhang mit der Nutzung der Geräte (Video, Licht, Laser) zu übernehmen,\n- die Daten systematisch mit offiziellen Herstellerhandbüchern zu überprüfen.';

  @override
  String get disclaimerCertify =>
      'Ich bestätige, dass ich diese Bedingungen gelesen und akzeptiert habe.';

  @override
  String get disclaimerAccept => 'Ich akzeptiere';

  @override
  String get laserConsentTitle => '🔴 LASER-EINWILLIGUNG (VERPFLICHTEND)';

  @override
  String get laserConsentText =>
      'ZUGRIFF AUF DEN LASER-BEREICH\n\nDer LASER-Bereich dieser App betrifft Sicherheitsberechnungen (z. B. NOHD, SZED, CZED).\nDiese Berechnungen sind Richtwerte und ersetzen nicht:\n- eine Risikoanalyse,\n- geltende Normen,\n- Betriebsverfahren,\n- oder die Prüfung durch eine qualifizierte Person.\n\nWICHTIG\n- Risiko von Augen-/Hautverletzungen bei unsachgemäßer Nutzung.\n- Das Ergebnis kann falsch sein, wenn eingegebene Parameter unvollständig/fehlerhaft sind oder reale Bedingungen abweichen (Optik,\n  atmosphärische Bedingungen, Reflexionen, Ausrichtung usw.).\n- Die Bedienperson ist allein verantwortlich für Installation, Betrieb und Konformität.\n\nDurch Bestätigung erklärst du, dass du:\n- die Risiken verstehst,\n- die geltenden Sicherheitsregeln einhältst,\n- die volle Verantwortung bei Fahrlässigkeit oder Fehlanwendung übernimmst.';

  @override
  String get commonCancel => 'Abbrechen';

  @override
  String get commonSave => 'Speichern';

  @override
  String get commonRename => 'Umbenennen';

  @override
  String get commonSearch => 'Suchen';

  @override
  String get commonNone => 'Keine Einträge';

  @override
  String get commonCalculate => 'Berechnen';

  @override
  String get commonCopyResultTooltip => 'Ergebnis kopieren';

  @override
  String get commonUnitMeter => 'm';

  @override
  String get commonReset => 'Zurücksetzen';

  @override
  String get commonOkWithCheck => 'OK ✅';

  @override
  String get commonTooLowWithCross => 'Zu niedrig ❌';

  @override
  String get lightProjectionTitle => 'Projektionsgröße';

  @override
  String get lightProjectionDescription =>
      'Richtwert-Berechnung der Spot-Größe anhand von Winkel, Entfernung und Durchmesser.';

  @override
  String get lightDmxSwitchTitle => 'DMX-DIP-Schalter';

  @override
  String get lightDmxSwitchDescription =>
      'Richtwert-Umrechnung zwischen DMX-Adresse und Schaltern, mit Intervall-Navigation.';

  @override
  String get lightPhotometryTitle => 'Photometrie';

  @override
  String get lightPhotometryDescription =>
      'Richtwert-Umrechnungen zwischen Lux, Candela und Lumen, mit Entfernung und Winkel.';

  @override
  String get lightCatalogTitle => 'Katalog';

  @override
  String get lightCatalogDescription =>
      'Auswahl nach Hersteller, Typ und Produkt, mit Informationen und Handbuch.';

  @override
  String get lightPatchTitle => 'DMX-Patch';

  @override
  String get lightPatchDescription =>
      'MVR-Datei importieren oder Patch manuell aus der Bibliothek erstellen.';

  @override
  String get lightDisclaimerShort =>
      'Richtwert-Tools. Prüfe immer die Herstellerdokumentation.';

  @override
  String get laserInputsTitle => 'Eingaben';

  @override
  String get laserPowerLabel => 'Leistung (mW)';

  @override
  String get laserPowerHint => 'z. B.: 5000';

  @override
  String get laserDivergenceLabel => 'Divergenz (mrad)';

  @override
  String get laserDivergenceHint => 'z. B.: 1.2';

  @override
  String get laserDiameterLabel => 'Ausgangsdurchmesser (mm)';

  @override
  String get laserDiameterHint => 'z. B.: 3.0';

  @override
  String get laserSaveCurrentProjector => 'Diesen Projektor speichern';

  @override
  String get laserSafetyResultsTitle => 'Sicherheitsergebnisse';

  @override
  String get laserZoneNohdDesc => 'Augengefahr';

  @override
  String get laserZoneSzedDesc => 'Sensible Zone';

  @override
  String get laserZoneCzedDesc => 'Kritische Zone';

  @override
  String get laserTargetDistanceLabel => 'Zielentfernung (m)';

  @override
  String get laserTargetDistanceHint => 'z. B.: 10';

  @override
  String get laserAdviceFullPower => 'Volle Leistung zulässig (100 %)';

  @override
  String laserAdviceMaxRecommended(Object percent) {
    return 'Maximal empfohlene Leistung: $percent';
  }

  @override
  String get laserSavedProjectorsTitle => 'Gespeicherte Projektoren';

  @override
  String get laserSearchHint => 'z. B.: „RGB 5W“';

  @override
  String laserPresetSubtitle(Object p, Object div, Object diam) {
    return 'P: $p mW • Div: $div mrad • Ø: $diam mm';
  }

  @override
  String get laserSaveProjectorTitle => 'Projektor speichern';

  @override
  String get laserRenameProjectorTitle => 'Projektor umbenennen';

  @override
  String get laserProjectorNameLabel => 'Projektorname';

  @override
  String get laserInvalidInputs =>
      'Bitte gültige Werte für Leistung, Divergenz und Durchmesser eingeben.';

  @override
  String get laserPresetAdded => 'Eintrag hinzugefügt.';

  @override
  String get laserPresetDeleted => 'Eintrag gelöscht.';

  @override
  String get laserNameUpdated => 'Name aktualisiert.';

  @override
  String get laserNormativeParamsTitle => 'Verwendete Sicherheitsparameter';

  @override
  String get laserNormativeParamsBody =>
      'MPE für Nominal Ocular Hazard Distance (NOHD): 25,4 W/m²\n(Norm IEC 60825-1, Ausgabe 3.0)\n\nMPE für Sensitive Zone Exposure Distance (SZED): 1 W/m²\n(Norm ANSI Z136.6)\n\nMPE für Critical Zone Exposure Distance (CZED): 0,05 W/m²\n(Norm ANSI Z136.6)';

  @override
  String get laserDisclaimerShort =>
      'Richtwert-Berechnung. Ersetzt keine Laser-Sicherheitsanalyse.';

  @override
  String get aboutDmxTitle => 'DMX — Funktionsweise (einfach & vollständig)';

  @override
  String get aboutDmxSubtitle =>
      'Universen, Adressen, Frames, RS-485-Verkabelung, Terminierung, typische Feldfehler.\nMit Schaubildern + Checkliste.';

  @override
  String get aboutArtNetTitle =>
      'Art-Net — DMX über IP (Nodes, Unicast/Broadcast)';

  @override
  String get aboutArtNetSubtitle =>
      'DMX-Universen über Ethernet/UDP, Nodes, Broadcast vs Unicast.\nPraxis-Limits, Netzwerkstabilität, RDM je nach Hardware.';

  @override
  String get aboutSacnTitle => 'sACN / E1.31 — Multicast, IGMP, Prioritäten';

  @override
  String get aboutSacnSubtitle =>
      'Ein netzwerkorientierter DMX-over-IP-Standard „pro“.\nMulticast/Unicast, IGMP Snooping/Querier, Prioritäten bei mehreren Quellen.';

  @override
  String get aboutIpBasicsTitle =>
      'Netzwerk — IP-Grundlagen / Maske / DHCP (essentiell)';

  @override
  String get aboutIpBasicsSubtitle =>
      'IP, Maske, Gateway, DHCP vs statisch verstehen.\nKonkrete Beispiele (2.x, 10.x, 192.168.x) + Checkliste.';

  @override
  String get aboutLightNetworkTitle =>
      'Licht-Netzwerk — VLAN, IGMP, WLAN vs Kabel';

  @override
  String get aboutLightNetworkSubtitle =>
      'Einfache und robuste Architektur für Art-Net/sACN.\nVLAN, IGMP Snooping/Querier, WLAN (Jitter), Switches, Schaubilder + Checkliste.';

  @override
  String get aboutCablingFiberTitle =>
      'Netzwerk — RJ45 / Glasfaser / Bandbreiten & Längen';

  @override
  String get aboutCablingFiberSubtitle =>
      'Cat5e→Cat8, Faser OM3/OM4/OS2, LC/SC/MPO, typische Distanzen, Show-Best-Practices.';

  @override
  String get aboutVideoTitle => 'Video — SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutVideoSubtitle =>
      'Auswahl nach Latenz, Zuverlässigkeit, Verkabelung, LAN vs WAN.\nTabellen + Schema.';

  @override
  String get aboutElectricityTitle => 'Elektrik — Schuko / P17 / Leistung';

  @override
  String get aboutElectricitySubtitle =>
      'Steckverbinder, Einphasen/Drehstrom, schnelle kW-Tabellen (16A→400A), typische Fallen.';

  @override
  String get aboutComputingTitle => 'IT — USB / HDMI / DP / SATA / NVMe…';

  @override
  String get aboutComputingSubtitle =>
      'Nutzbare Datenraten, Versionen, reale Limits, Marketing-Fallen.';

  @override
  String get videoTitle => 'Video';

  @override
  String get videoToolsTitle => 'Video-Tools';

  @override
  String get videoDisclaimerShort =>
      'Richtwert-Berechnungen. Prüfe immer die Herstellerdokumentation.';

  @override
  String get videoLensMeasureTitle => 'Objektiv & Messung';

  @override
  String get videoLensMeasureSubtitle =>
      'Ratio / Breite / Höhe (Berechnungen 1 bis 3).';

  @override
  String get videoBrightnessTitle => 'Helligkeit';

  @override
  String get videoBrightnessSubtitle =>
      'Lux / Nits / ft-L + Schwelle (Berechnung 4).';

  @override
  String get videoMultiprojectorTitle => 'Multi-Projektor';

  @override
  String get videoMultiprojectorSubtitle =>
      'Overlap + Breite/Projektor + Anzahl Projektoren (Berechnungen 5 & 6).';

  @override
  String get videoLedTitle => 'LED';

  @override
  String get videoLedSubtitle =>
      'Pixel des LED-Walls nach Größe, Pitch und Tile-Abmessungen.';

  @override
  String get videoTestPatternTitle => 'Testbild';

  @override
  String get videoTestPatternSubtitle =>
      'Erstellung von Video-Testbildern für Screen und LED-Wall (später).';

  @override
  String get videoMpFormatLabel => 'Format (Ratio)';

  @override
  String get videoMpCalc5Title => 'Berechnung 5 — Breite pro Projektor';

  @override
  String get videoMpCalc6Title =>
      'Berechnung 6 — Anzahl Projektoren (Ratio min/max)';

  @override
  String get videoMpTotalWidthLabel => 'Gesamt-Projektionsbreite (m)';

  @override
  String get videoMpTotalWidthHint => 'z. B.: 18.0';

  @override
  String get videoMpDistanceLabel => 'Projektionsdistanz (m)';

  @override
  String get videoMpDistanceHint => 'z. B.: 12.0';

  @override
  String get videoMpOverlapLabel => 'Overlap (%)';

  @override
  String get videoMpOverlapHint => 'z. B.: 10';

  @override
  String get videoMpProjectorCountLabel => 'Anzahl Projektoren (N)';

  @override
  String get videoMpProjectorCountHint => 'z. B.: 2';

  @override
  String get videoMpRatioMinLabel => 'Ratio min';

  @override
  String get videoMpRatioMinHint => 'z. B.: 1.20';

  @override
  String get videoMpRatioMaxLabel => 'Ratio max';

  @override
  String get videoMpRatioMaxHint => 'z. B.: 1.80';

  @override
  String get videoMpOptionalLuminanceTitle => 'Optional: Helligkeit';

  @override
  String get videoMpLumensPerProjectorLabel => 'Lumen pro Projektor';

  @override
  String get videoMpLumensPerProjectorHint => 'z. B.: 20000';

  @override
  String get videoMpGainLabel => 'Gain';

  @override
  String get videoMpGainHint => 'z. B.: 1.0';

  @override
  String get videoMpErrMissing5 =>
      '❌ Fehlende Daten: Gesamtbreite + Overlap% + N.';

  @override
  String get videoMpErrWidthGt0 => '❌ Gesamtbreite muss > 0 sein.';

  @override
  String get videoMpErrNGte2 => '❌ N muss ≥ 2 sein.';

  @override
  String get videoMpErrOverlapRange =>
      '❌ Overlap% muss zwischen 0 und 99.9 liegen.';

  @override
  String get videoMpErrImpossibleDenom => '❌ Unmögliche Parameter (denom ≤ 0).';

  @override
  String get videoMpErrMissing6Main =>
      '❌ Fehlende Daten: Gesamtbreite + Distanz + Overlap%.';

  @override
  String get videoMpErrWidthDistanceGt0 =>
      '❌ Gesamtbreite und Distanz müssen > 0 sein.';

  @override
  String get videoMpErrMissingRatios =>
      '❌ Fehlende Daten: Ratio min und/oder Ratio max.';

  @override
  String get videoMpErrInvalidRatio => '❌ Ungültiges Ratio (muss > 0 sein).';

  @override
  String get videoMpLumiOptionalHint =>
      'Helligkeit (optional): Lumen/Projektor + Gain eintragen, um zu schätzen.';

  @override
  String get videoMpLumiErrLumensGainGt0 =>
      'Helligkeit: ❌ Lumen/Projektor und Gain müssen > 0 sein.';

  @override
  String videoMpCaseOpenMin(Object n, Object coverage) {
    return 'Fall weitestes Ratio (min) = $n Projektoren | Abdeckung ≈ $coverage m';
  }

  @override
  String videoMpCaseTightMax(Object n, Object coverage) {
    return 'Fall engstes Ratio (max) = $n Projektoren | Abdeckung ≈ $coverage m';
  }

  @override
  String videoMpLumiEstimated(
      Object n, Object area, Object lux, Object nits, Object fl) {
    return 'Geschätzte Helligkeit (N=$n)\nFläche: $area m²\nEq-Lux: $lux\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoMpNoteIndicative => 'Hinweis: Richtwert-Schätzung.';

  @override
  String get videoLmFormatLabel => 'Format (Ratio)';

  @override
  String get videoLmCalc1Title => 'Berechnung 1 — Ratio (Distanz / Breite)';

  @override
  String get videoLmCalc2Title => 'Berechnung 2 — Breite (Distanz / Ratio)';

  @override
  String get videoLmCalc3Title => 'Berechnung 3 — Höhe (Breite + Format)';

  @override
  String get videoLmDistanceLabel => 'Projektionsdistanz (m)';

  @override
  String get videoLmDistanceHint => 'z. B.: 12.0';

  @override
  String get videoLmImageWidthLabel => 'Bildbreite (m)';

  @override
  String get videoLmImageWidthHint => 'z. B.: 6.0';

  @override
  String get videoLmThrowRatioLabel => 'Projektions-Ratio';

  @override
  String get videoLmThrowRatioHint => 'z. B.: 1.60';

  @override
  String get videoLmErrMissingDistanceWidth =>
      '❌ Fehlende Daten: Distanz + Breite.';

  @override
  String get videoLmErrMissingDistanceRatio =>
      '❌ Fehlende Daten: Distanz + Ratio.';

  @override
  String get videoLmErrMissingWidthOnly => '❌ Fehlender Wert: Breite.';

  @override
  String get videoLmErrWidthGt0 => '❌ Breite muss > 0 sein.';

  @override
  String get videoLmErrRatioGt0 => '❌ Ratio muss > 0 sein.';

  @override
  String videoLmResultRatio(Object ratio) {
    return '✅ Projektions-Ratio = $ratio';
  }

  @override
  String videoLmResultWidth(Object width) {
    return '✅ Bildbreite = $width m';
  }

  @override
  String videoLmResultHeight(Object height, Object format) {
    return '✅ Höhe = $height m (Format $format)';
  }

  @override
  String get videoLedCalcTitle => 'Berechnung — Pixel / Tiles';

  @override
  String get videoLedTilesXLabel => 'Tiles horizontal (X)';

  @override
  String get videoLedTilesXHint => 'z. B.: 15';

  @override
  String get videoLedTilesYLabel => 'Tiles vertikal (Y)';

  @override
  String get videoLedTilesYHint => 'z. B.: 8';

  @override
  String get videoLedTileWpxLabel => 'Tile-Breite (px)';

  @override
  String get videoLedTileWpxHint => 'z. B.: 128';

  @override
  String get videoLedTileHpxLabel => 'Tile-Höhe (px)';

  @override
  String get videoLedTileHpxHint => 'z. B.: 128';

  @override
  String get videoLedTileWcmLabel => 'Tile-Breite (cm)';

  @override
  String get videoLedTileWcmHint => 'z. B.: 33.28';

  @override
  String get videoLedTileHcmLabel => 'Tile-Höhe (cm)';

  @override
  String get videoLedTileHcmHint => 'z. B.: 33.28';

  @override
  String get videoLedErrMissingInputs =>
      '❌ Fehlende Daten: Tiles X/Y + Tile px + Tile cm.';

  @override
  String get videoLedErrAllGt0 => '❌ Alle Werte müssen > 0 sein.';

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
    return '✅ Wall-Auflösung: $wallWpx × $wallHpx px\n✅ Wall-Größe: $wallWm × $wallHm m\nTile: $tileWpx×$tileHpx px • $tileWcm×$tileHcm cm\nBerechneter Pitch: $pitch';
  }

  @override
  String get videoCalculationsTitle => 'Video-Berechnungen';

  @override
  String get videoCopyAllTooltip => 'Alle Ergebnisse kopieren';

  @override
  String get videoExportPdfTooltip => 'PDF exportieren';

  @override
  String get videoCalculateAll => 'Alles berechnen';

  @override
  String get videoSummaryPillsTitle => 'Zusammenfassung (Badges)';

  @override
  String get videoCopySummaryTooltip => 'Zusammenfassung kopieren';

  @override
  String get videoCommonParamsTitle => 'Gemeinsame Parameter';

  @override
  String get videoFormatLabel => 'Format (Ratio)';

  @override
  String get videoDistanceLabel => 'Projektionsdistanz (m)';

  @override
  String get videoDistanceHint => 'z. B.: 12.0';

  @override
  String get videoImageWidthLabel => 'Bildbreite (m)';

  @override
  String get videoImageWidthHint => 'z. B.: 6.0';

  @override
  String get videoThrowRatioLabel => 'Projektions-Ratio';

  @override
  String get videoThrowRatioHint => 'z. B.: 1.60';

  @override
  String get videoLumensLabel => 'Lumen (ANSI)';

  @override
  String get videoLumensHint => 'z. B.: 20000';

  @override
  String get videoGainLabel => 'Gain';

  @override
  String get videoGainHint => 'z. B.: 1.0';

  @override
  String get videoScreenPresetLabel => 'Leinwand / Oberfläche (Preset)';

  @override
  String get videoPresetFrontWhite => 'Front – matte weiße Leinwand (Gain 1.0)';

  @override
  String get videoPresetFrontGrey => 'Front – graue Leinwand (Gain 0.8)';

  @override
  String get videoPresetFrontHighGain =>
      'Front – High-Gain-Leinwand (Gain 1.3)';

  @override
  String get videoPresetRearDiffusion =>
      'Rückprojektion – Diffusionsgewebe (Gain 0.7)';

  @override
  String get videoPresetRearClear =>
      'Rückprojektion – klares Gewebe (Gain 0.9)';

  @override
  String get videoPresetMappingMatte => 'Mapping – matte Farbe (Gain 0.75)';

  @override
  String get videoPresetMappingSatin =>
      'Mapping – seidenmatte Farbe (Gain 0.9)';

  @override
  String get videoPresetMappingLightStone =>
      'Mapping – heller Stein (Gain 0.6)';

  @override
  String get videoPresetMappingDarkStone =>
      'Mapping – dunkler Stein (Gain 0.35)';

  @override
  String get videoPresetMappingGlass => 'Mapping – Glas (Gain 0.15)';

  @override
  String get videoPresetFrontWhiteShort => 'Front – matte weiße Leinwand';

  @override
  String get videoPresetFrontGreyShort => 'Front – graue Leinwand';

  @override
  String get videoPresetFrontHighGainShort => 'Front – High-Gain-Leinwand';

  @override
  String get videoPresetRearDiffusionShort =>
      'Rückprojektion – Diffusionsgewebe';

  @override
  String get videoPresetRearClearShort => 'Rückprojektion – klares Gewebe';

  @override
  String get videoPresetMappingMatteShort => 'Mapping – matte Farbe';

  @override
  String get videoPresetMappingSatinShort => 'Mapping – seidenmatte Farbe';

  @override
  String get videoPresetMappingLightStoneShort => 'Mapping – heller Stein';

  @override
  String get videoPresetMappingDarkStoneShort => 'Mapping – dunkler Stein';

  @override
  String get videoPresetMappingGlassShort => 'Mapping – Glas';

  @override
  String get videoOverlapLabel => 'Overlap (%)';

  @override
  String get videoOverlapHint => 'z. B.: 10';

  @override
  String get videoTotalWidthLabel => 'Gesamt-Projektionsbreite (m)';

  @override
  String get videoTotalWidthHint => 'z. B.: 18.0';

  @override
  String get videoCalc1Title => 'Berechnung 1 — Ratio (Distanz / Breite)';

  @override
  String get videoCalc2Title => 'Berechnung 2 — Breite (Distanz / Ratio)';

  @override
  String get videoCalc3Title => 'Berechnung 3 — Höhe (Breite + Format)';

  @override
  String get videoCalc4Title =>
      'Berechnung 4 — Helligkeit (Lux / Nits / ft-L + Schwelle)';

  @override
  String get videoCalc5Title => 'Berechnung 5 — Overlap (Gesamtbreite + N)';

  @override
  String get videoCalc6Title =>
      'Berechnung 6 — Auto-N Projektoren + Helligkeit';

  @override
  String get videoCalc5NLabel => 'Anzahl Projektoren (N)';

  @override
  String get videoCalc5NHint => 'z. B.: 2';

  @override
  String get videoCalc6RatioMinLabel => 'Ratio min';

  @override
  String get videoCalc6RatioMinHint => 'z. B.: 1.20';

  @override
  String get videoCalc6RatioMaxLabel => 'Ratio max';

  @override
  String get videoCalc6RatioMaxHint => 'z. B.: 1.80';

  @override
  String get videoOptionalBrightnessTitle => 'Optional: Helligkeit';

  @override
  String get videoCalc6LumensPerProjectorLabel => 'Lumen pro Projektor';

  @override
  String get videoCalc6LumensPerProjectorHint => 'z. B.: 20000';

  @override
  String get videoCalc6GainLabel => 'Gain (Calc 6)';

  @override
  String get videoCalc6GainHint => 'z. B.: 1.0';

  @override
  String get videoCalc1ErrMissing => '❌ Fehlende Daten: Distanz + Breite.';

  @override
  String get videoCalc2ErrMissing => '❌ Fehlende Daten: Distanz + Ratio.';

  @override
  String get videoCalc3ErrMissingWidth => '❌ Fehlender Wert: Breite.';

  @override
  String get videoErrWidthGt0 => '❌ Die Breite muss > 0 sein.';

  @override
  String get videoErrRatioGt0 => '❌ Das Ratio muss > 0 sein.';

  @override
  String videoCalc1Ok(Object ratio) {
    return '✅ Projektions-Ratio = $ratio';
  }

  @override
  String videoCalc2Ok(Object width) {
    return '✅ Bildbreite = $width m';
  }

  @override
  String videoCalc3Ok(Object height, Object format) {
    return '✅ Höhe = $height m (Format $format)';
  }

  @override
  String get videoCalc4ErrMissing => '❌ Fehlende Daten: Lumen + Gain + Breite.';

  @override
  String get videoCalc4ErrGt0 => '❌ Lumen/Gain/Breite müssen > 0 sein.';

  @override
  String videoCalc4Result(Object area, Object format, Object lux, Object luxEq,
      Object nits, Object fl, Object presetLabel, Object minFl, Object status) {
    return 'Fläche: $area m² (Format $format)\nLux (lm/m²): $lux\nEq-Lux (Gain): $luxEq\nLuminanz: $nits Nits | $fl ft-L\nMindest-Schwelle ($presetLabel): $minFl ft-L → $status\nHinweis: Umrechnung Nits/ft-L basiert auf einer Lambert-Annahme (approx).';
  }

  @override
  String get videoCalc5ErrMissing =>
      '❌ Fehlende Daten: Gesamtbreite + Overlap% + Anzahl Projektoren.';

  @override
  String get videoErrTotalWidthGt0 => '❌ Gesamtbreite muss > 0 sein.';

  @override
  String get videoCalc5ErrNMin2 => '❌ Anzahl Projektoren muss ≥ 2 sein.';

  @override
  String get videoErrOverlapRange =>
      '❌ Overlap% muss zwischen 0 und 99.9 liegen.';

  @override
  String get videoErrImpossibleDenom => '❌ Unmögliche Parameter (denom ≤ 0).';

  @override
  String videoCalc5Result(Object wTot, Object n, Object overlapPct, Object wPer,
      Object overlapM, Object format, Object hTot) {
    return 'Gesamtbreite: $wTot m\nN: $n | Overlap: $overlapPct% (bezogen auf Projektorbreite)\n\n- Breite pro Projektor: $wPer m\n- Overlap zwischen 2 Projektoren: $overlapM m\n- Gesamthöhe (Format $format): $hTot m';
  }

  @override
  String get videoCalc6ErrMissingBasics =>
      '❌ Fehlende Daten: Gesamtbreite + Distanz + Overlap%.';

  @override
  String get videoErrTotalWidthAndDistanceGt0 =>
      '❌ Gesamtbreite und Distanz müssen > 0 sein.';

  @override
  String get videoCalc6ErrMissingRatio =>
      '❌ Fehlende Daten: Ratio min und/oder Ratio max.';

  @override
  String get videoCalc6LumiOptional =>
      'Helligkeit (optional): Lumen/Projektor + Gain für die Schätzung eintragen.';

  @override
  String get videoCalc6LumiErrGt0 =>
      'Helligkeit: ❌ Lumen/Projektor und Gain müssen > 0 sein.';

  @override
  String videoCalc6LumiForN(
      Object n, Object area, Object lux, Object nits, Object fl) {
    return 'Geschätzte Helligkeit (N=$n)\nFläche: $area m²\nEq-Lux: $lux (lm/m²)\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoCalc6NoteIndicative =>
      'Hinweis: Richtwert-Schätzung (reales Blend/Overlap kann leicht reduzieren).';

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
    return 'Gesamtbreite=$wTot m | Distanz=$distance m | Overlap=$overlapPct%\nFormat $format → Gesamthöhe=$hTot m | Fläche=$area m²\nRatio min/max: $ratioMin → $ratioMax\n\nFall weitestes Ratio (min) = $nMin Projektoren | Abdeckung ≈ $covMin m\n$lumiMin\n\nFall engstes Ratio (max) = $nMax Projektoren | Abdeckung ≈ $covMax m\n$lumiMax\n\n$note';
  }

  @override
  String videoCommonPillFormat(Object format) {
    return 'Format: $format';
  }

  @override
  String videoCommonPillDistance(Object value) {
    return 'Distanz: $value';
  }

  @override
  String videoCommonPillWidth(Object value) {
    return 'Breite: $value';
  }

  @override
  String videoCommonPillRatio(Object value) {
    return 'Ratio: $value';
  }

  @override
  String videoCommonPillHeight(Object value) {
    return 'Höhe: $value';
  }

  @override
  String videoCommonPillArea(Object value) {
    return 'Fläche: $value';
  }

  @override
  String videoCommonPillTotalWidth(Object value) {
    return 'Gesamtbreite: $value';
  }

  @override
  String videoCommonPillOverlap(Object value) {
    return 'Overlap: $value';
  }

  @override
  String get videoPdfTitle => 'Mon App Technique – Video-Export';

  @override
  String get videoPdfDate => 'Datum';

  @override
  String get videoPdfFormat => 'Format';

  @override
  String get videoPdfDistance => 'Distanz (m)';

  @override
  String get videoPdfImageWidth => 'Bildbreite (m)';

  @override
  String get videoPdfRatio => 'Ratio';

  @override
  String get videoPdfLumens => 'Lumen';

  @override
  String get videoPdfGain => 'Gain';

  @override
  String get videoPdfScreenPreset => 'Leinwand-Preset';

  @override
  String get videoPdfOverlap => 'Overlap (%)';

  @override
  String get videoPdfTotalWidth => 'Gesamtbreite (m)';

  @override
  String get videoPdfCalc5N => 'N (Calc5)';

  @override
  String get videoPdfCalc6RatioMin => 'Ratio min (Calc6)';

  @override
  String get videoPdfCalc6RatioMax => 'Ratio max (Calc6)';

  @override
  String get videoPdfCalc6LumensPerProj => 'Lumen/Projektor (Calc6)';

  @override
  String get videoPdfCalc6Gain => 'Gain (Calc6)';

  @override
  String get videoPdfParams => 'Parameter';

  @override
  String get videoPdfResults => 'Ergebnisse';

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
  String get videoPdfCalc6 => 'Berechnung 6';

  @override
  String videoCalcLabel(Object n) {
    return 'Berechnung $n';
  }

  @override
  String get videoBrightnessSectionTitle =>
      'Berechnung 4 — Lux / Nits / ft-L + Schwelle';

  @override
  String get videoCalc4ErrMissingSimple =>
      '❌ Fehlende Daten: Breite + Lumen + Gain.';

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
    return 'Format: $format\nFläche: $area m²\nLux (lm/m²): $lux\nEq-Lux (Gain): $luxEq\nLuminanz: $nits Nits | $fl ft-L\nMindest-Schwelle ($presetLabel): $minFl ft-L → $status\nHinweis: Richtwert-Schätzung (Lambert).';
  }

  @override
  String get videoMireTitle => 'Testbild';

  @override
  String get videoMireHeaderTitle => 'Testbild-Generator';

  @override
  String get videoMireHeaderSubtitle =>
      'Richtwert-Testbilder (Ausrichten, Fokus, Geometrie, Blend, Pixel-perfect).';

  @override
  String get videoMireScreenVideoTitle => 'Testbild Video-Screen';

  @override
  String get videoMireScreenVideoSubtitle =>
      'Einfach (BxH px) + Multi-Projektor-Mapping (N + Overlap).';

  @override
  String get videoMireScreenLedTitle => 'Testbild LED-Screen';

  @override
  String get videoMireScreenLedSubtitle =>
      'Testbild nach BxH px (pixel-perfect, Homogenität, Raster).';

  @override
  String get mireVideoSimpleTitle => 'VIDEO / EINFACHES TESTBILD';

  @override
  String get mireVideoComboTitle => 'VIDEO / KOMBI-TESTBILD';

  @override
  String get mireVideoMappingTitle => 'VIDEO / MAPPING-TESTBILD';

  @override
  String get mireLedTitle => 'LED / TESTBILD';

  @override
  String get mireLedTilesIdTitle => 'LED / TILE-IDs';

  @override
  String get mireSimpleSubtitleGridSafe => 'Raster + Safe + Kreise';

  @override
  String get mireSimpleSubtitleCheckerboard => 'Schachbrett + Kreise';

  @override
  String get mireSimpleSubtitleColorBars => 'Balken + Rampen + Kreise';

  @override
  String get mireSimpleSubtitleUniformity => 'Homogenität + Kreise';

  @override
  String get mireSimpleSubtitleComboAll =>
      'Raster + Safe + 2 zentrierte Balken + Kreise';

  @override
  String get mireLedSubtitlePixelPerfect => 'Pixel-perfect + Kreise';

  @override
  String get mireLedSubtitleGridLabels => 'Raster + Markierungen + Kreise';

  @override
  String get mireLedSubtitleColorBars => 'Balken + Rampen + Kreise';

  @override
  String get mireLedSubtitleUniformity => 'Homogenität + Kreise';

  @override
  String mireMappingSubtitlePattern(Object n, Object orient, Object percent) {
    return 'N=$n • Overlap $percent% • $orient';
  }

  @override
  String get mireOrientationHorizontal => 'Horizontal';

  @override
  String get mireOrientationVertical => 'Vertikal';

  @override
  String mireProjectorLabelPattern(Object index) {
    return 'PROJEKTOR $index';
  }

  @override
  String get mireBlendLabel => 'BLEND';

  @override
  String get mireTileMissingPx => 'Tile (px) für Nummerierung angeben.';

  @override
  String get mireWallNotMultipleOfTiles => 'WALL NICHT DURCH TILES TEILBAR';

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
  String get mireSimpleSectionTitle => 'Einfaches Screen-Testbild';

  @override
  String get mireMappingSectionTitle => 'Multi-Projektor-Mapping-Testbild';

  @override
  String get mireVideoSimpleSectionTitle => 'Einfaches Screen-Testbild';

  @override
  String get mireVideoMappingSectionTitle => 'Multi-Projektor-Mapping-Testbild';

  @override
  String get mireWidthPxLabel => 'Breite (px)';

  @override
  String get mireHeightPxLabel => 'Höhe (px)';

  @override
  String get mireWidthPxHint => 'z. B.: 1920';

  @override
  String get mireHeightPxHint => 'z. B.: 1080';

  @override
  String get mireWidthPxHintMapping => 'z. B.: 3840';

  @override
  String get mireHeightPxHintMapping => 'z. B.: 2160';

  @override
  String get mireTypeLabel => 'Testbild-Typ';

  @override
  String get mireExportPng => 'PNG exportieren';

  @override
  String get mireErrInvalidWHpx => '❌ Ungültige Breite/Höhe (px).';

  @override
  String get mireErrInvalidProjectors => '❌ Ungültige Projektoranzahl (N > 0).';

  @override
  String get mireErrInvalidOverlap => '❌ Ungültiger Overlap (0 bis 99.9).';

  @override
  String get mireSimpleTypeComboAll =>
      'Kombi (Raster + Kreise + 2 zentrierte Balken)';

  @override
  String get mireSimpleTypeGridSafe => 'Raster + Safe + Kreise';

  @override
  String get mireSimpleTypeColorBars => 'Balken + Rampen + Kreise';

  @override
  String get mireSimpleTypeUniformity => 'Homogenität + Kreise';

  @override
  String get mireSimpleTypeCheckerboard => 'Schachbrett + Kreise';

  @override
  String get mireProjectorsNLabel => 'Anzahl Projektoren (N)';

  @override
  String get mireProjectorsNHint => 'z. B.: 2';

  @override
  String get mireOverlapLabel => 'Overlap (%)';

  @override
  String get mireOverlapHint => 'z. B.: 10.0';

  @override
  String get mireOrientationLabel => 'Ausrichtung';

  @override
  String get mireMappingTypeLabel => 'Mapping-Typ';

  @override
  String get mireMappingTypeCombo => 'Kombi (Zonen + Overlap + Blend)';

  @override
  String get mireMappingTypeZonesOverlap => 'Zonen + Overlap';

  @override
  String get mireMappingTypeBlendRamps => 'Blend-Rampen';

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
  String get mireLedParamsTitle => 'LED-Wall-Parameter';

  @override
  String get mireLedTilesXLabel => 'Tiles horizontal (X)';

  @override
  String get mireLedTilesYLabel => 'Tiles vertikal (Y)';

  @override
  String get mireLedTileWpxLabel => 'Tile-Breite (px)';

  @override
  String get mireLedTileHpxLabel => 'Tile-Höhe (px)';

  @override
  String get mireLedTileWcmLabel => 'Tile-Breite (cm)';

  @override
  String get mireLedTileHcmLabel => 'Tile-Höhe (cm)';

  @override
  String mireLedWallResolution(Object w, Object h) {
    return 'Wall-Auflösung: $w × $h px';
  }

  @override
  String mireLedPitchComputed(Object pitch) {
    return 'Berechneter Pitch: $pitch';
  }

  @override
  String get mireLedErrTilesXY => '❌ Tiles X/Y angeben (>0).';

  @override
  String get mireLedErrTilePx => '❌ Tile px angeben (Breite/Höhe >0).';

  @override
  String get mireLedErrTileCm => '❌ Tile cm angeben (Breite/Höhe >0).';

  @override
  String get mireLedWarnPitchOutOfRange =>
      '⚠️ Berechneter Pitch außerhalb Bereich (0.5–20 mm). Prüfe Tile cm / px.';

  @override
  String get mireLedWarnPitchXNotY =>
      '⚠️ Pitch X ≠ Pitch Y (uneinheitliches Tile). Prüfe cm- und px-Maße.';

  @override
  String get mireLedTypeTilesId => 'Tile-IDs (Nummer + Farben)';

  @override
  String get mireLedTypePixelPerfect => 'Pixel-perfect + Kreise';

  @override
  String get mireLedTypeGridLabels => 'Raster + Markierungen + Kreise';

  @override
  String get mireLedTypeColorBars => 'Balken + Rampen + Kreise';

  @override
  String get mireLedTypeUniformity => 'Homogenität + Kreise';

  @override
  String get mireVideoTypeCombo =>
      'Kombi (Raster + Kreise + 2 zentrierte Balken)';

  @override
  String get mireVideoTypeGridSafe => 'Raster + Safe + Kreise';

  @override
  String get mireVideoTypeColorBars => 'Balken + Rampen + Kreise';

  @override
  String get mireVideoTypeUniformity => 'Homogenität + Kreise';

  @override
  String get mireVideoTypeCheckerboard => 'Schachbrett + Kreise';

  @override
  String get laserConsentCheckboxLabel =>
      'Je comprends les risques et j’assume ma responsabilité.';

  @override
  String get laserConsentAcceptContinue => 'J\'accepte et continuer';

  @override
  String get laserConsentContinue => 'J\'accepte et continuer';

  @override
  String get laserZoneLabelNohd => 'NOHD';

  @override
  String get laserZoneLabelSzed => 'SZED';

  @override
  String get laserZoneLabelCzed => 'CZED';

  @override
  String laserValueMeter(Object value) {
    return '$value m';
  }

  @override
  String laserPercentValue(Object value) {
    return '$value %';
  }

  @override
  String get catalogUpdateTooltip => 'Mettre à jour';

  @override
  String get catalogResetTooltip => 'Réinitialiser';

  @override
  String catalogLastUpdate(Object date) {
    return 'Dernière mise à jour : $date';
  }

  @override
  String catalogManufacturerTitle(Object count) {
    return 'Constructeur ($count)';
  }

  @override
  String catalogTypeTitle(Object count) {
    return 'Type de projecteur ($count)';
  }

  @override
  String catalogModelTitle(Object count) {
    return 'Modèle ($count)';
  }

  @override
  String catalogDmxModeTitle(Object count) {
    return 'Mode DMX ($count)';
  }

  @override
  String catalogDmxModeItem(Object name, Object channels) {
    return '$name ($channels canaux)';
  }

  @override
  String get catalogInfoDmxChannels => 'Canaux DMX';

  @override
  String get catalogInfoWeight => 'Poids';

  @override
  String get catalogInfoPower => 'Puissance';

  @override
  String get catalogInfoLuminousFlux => 'Flux lumineux';

  @override
  String get catalogNotProvided => 'Non renseigné';

  @override
  String get catalogUpdated => 'Catalogue mis à jour.';

  @override
  String get catalogSyncFailedUnknown =>
      'Synchronisation impossible (raison inconnue).';

  @override
  String catalogSyncFailed(Object reason) {
    return 'Synchronisation impossible : $reason';
  }

  @override
  String catalogSyncError(Object error) {
    return 'Échec synchronisation : $error';
  }

  @override
  String get dipSwitchResetTooltip => 'Réinitialiser';

  @override
  String get dipSwitchInputsTitle => 'Entrées';

  @override
  String get dipSwitchSectionTitle => 'Dip-switch';

  @override
  String get dipSwitchSummaryTitle => 'Résumé';

  @override
  String get dipSwitchAddressLabel => 'Adresse DMX (1 à 512)';

  @override
  String get dipSwitchAddressHint => 'Exemple : 1';

  @override
  String get dipSwitchIntervalLabel => 'Intervalle (nombre de canaux)';

  @override
  String get dipSwitchIntervalHint => 'Exemple : 16';

  @override
  String get dipSwitchUseAddressMinusOneLabel => 'Utiliser adresse moins 1';

  @override
  String get dipSwitchNextAddressButton =>
      'Adresse suivante selon l’intervalle';

  @override
  String get dipSwitchEndOfUniverseWarning =>
      'Fin de l’univers : l’adresse suivante dépasserait 512.';

  @override
  String get dipSwitchScrollHint =>
      'Fais défiler horizontalement si nécessaire.';

  @override
  String get dipSwitchOnLabel => 'ON';

  @override
  String get dipSwitchOffLabel => 'OFF';

  @override
  String dipSwitchSwitchLabel(Object index) {
    return 'Switch $index';
  }

  @override
  String get dipSwitchResultHeader =>
      'Conversion indicative dip-switch / adresse DMX';

  @override
  String get dipSwitchModeAddressMinusOne => 'Adresse moins 1';

  @override
  String get dipSwitchModeAddressDirect => 'Adresse directe';

  @override
  String dipSwitchResultModeLine(Object mode) {
    return 'Mode : $mode';
  }

  @override
  String get dipSwitchResultAddressNotProvided =>
      'Adresse DMX : non renseignée';

  @override
  String dipSwitchResultAddressLine(Object address) {
    return 'Adresse DMX : $address';
  }

  @override
  String get photometrySection1Title => 'Lux et candela';

  @override
  String get photometrySection2Title => 'Lumen et candela';

  @override
  String get photometrySection3Title => 'Lux à partir de lumen';

  @override
  String get photometryLuxLabel => 'Éclairement (lux)';

  @override
  String get photometryLuxHint => 'Exemple : 500';

  @override
  String get photometryCandelaLabel => 'Intensité lumineuse (candela)';

  @override
  String get photometryCandelaHint1 => 'Exemple : 20000';

  @override
  String get photometryCandelaHint2 => 'Exemple : 150000';

  @override
  String get photometryDistanceLabel => 'Distance (mètre)';

  @override
  String get photometryDistanceHint1 => 'Exemple : 5';

  @override
  String get photometryDistanceHint3 => 'Exemple : 8';

  @override
  String get photometryLumensLabel => 'Flux lumineux (lumen)';

  @override
  String get photometryLumensHint2 => 'Exemple : 20000';

  @override
  String get photometryLumensHint3 => 'Exemple : 20000';

  @override
  String get photometryBeamAngleLabel => 'Angle de faisceau (degré)';

  @override
  String get photometryBeamAngleHint2 => 'Exemple : 10';

  @override
  String get photometryBeamAngleHint3 => 'Exemple : 15';

  @override
  String photometrySummary1(Object lux, Object candela, Object distance) {
    return 'Éclairement : $lux lux\nIntensité lumineuse : $candela candela\nDistance : $distance mètre';
  }

  @override
  String photometrySummary2(
      Object lumens, Object candela, Object angle, Object omega) {
    return 'Flux lumineux : $lumens lumen\nIntensité lumineuse : $candela candela\nAngle de faisceau : $angle degré\nAngle solide : $omega stéradian';
  }

  @override
  String get projectionInputsTitle => 'Entrées';

  @override
  String get projectionResultsTitle => 'Résultats';

  @override
  String get projectionAngleLabel => 'Angle de faisceau (degré)';

  @override
  String get projectionAngleHint => 'Exemple : 15';

  @override
  String get projectionDistanceLabel => 'Distance (mètre)';

  @override
  String get projectionDistanceHint => 'Exemple : 10';

  @override
  String get projectionDiameterLabel => 'Diamètre de tache (mètre)';

  @override
  String get projectionDiameterHint => 'Exemple : 2,60';

  @override
  String get projectionAutoHelp =>
      'Le calcul automatique se met à jour lorsque deux champs sont renseignés.';

  @override
  String get projectionHeaderNeedTwoValues =>
      'Saisis deux valeurs pour calculer automatiquement la troisième.';

  @override
  String get projectionHeaderAutoActive => 'Calcul automatique actif.';

  @override
  String projectionDetailAngle(Object value) {
    return 'Angle de faisceau : $value degré';
  }

  @override
  String projectionDetailDistance(Object value) {
    return 'Distance : $value mètre';
  }

  @override
  String projectionDetailDiameter(Object value) {
    return 'Diamètre de tache : $value mètre';
  }

  @override
  String projectionConeAngle(Object angle) {
    return 'Angle $angle°';
  }

  @override
  String projectionConeDistance(Object distance) {
    return '$distance m';
  }

  @override
  String projectionConeDiameter(Object diameter) {
    return '$diameter m';
  }

  @override
  String photometrySummary3(
      Object lumens, Object distance, Object angle, Object lux) {
    return 'Flux lumineux : $lumens lumen\nDistance : $distance mètre\nAngle de faisceau : $angle degré\nÉclairement estimé : $lux lux';
  }

  @override
  String get photometryDisclaimerShort =>
      'Calculs indicatifs. Les résultats dépendent du faisceau réel, des optiques et des conditions de mesure.';

  @override
  String dipSwitchResultBinaryValueLine(Object value) {
    return 'Valeur binaire utilisée : $value';
  }

  @override
  String dipSwitchChannelUnit(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'canaux',
      one: 'canal',
    );
    return '$_temp0';
  }

  @override
  String dipSwitchResultIntervalLine(Object step, Object unit) {
    return 'Intervalle : $step $unit';
  }

  @override
  String get catalogOpenManual => 'Ouvrir le manuel';

  @override
  String get catalogOpenDmxChart => 'Ouvrir la charte DMX';

  @override
  String get laserLegalDisclaimerText =>
      'AVERTISSEMENT LÉGAL ET CLAUSE DE NON-RESPONSABILITÉ\n\nL\'utilisation de ce calculateur est strictement réservée à titre informatif et indicatif.\nLes résultats obtenus ne constituent pas une expertise technique et ne sauraient engager la responsabilité de l\'éditeur en cas d\'erreur de calcul, d\'omission ou d\'accident survenus lors de l\'installation ou de l\'exploitation du matériel.\n\nCalculs NOHD et Instruments Optiques :\nDans certaines circonstances, des instruments optiques spéciaux (jumelles, télescopes) peuvent être utilisés pour visualiser le laser à une distance plus éloignée.\nCe fait doit être pris en compte lors de la détermination du NOHD.\nDans le calcul ci-joint, aucun instrument optique n\'est pris en compte, car il est très peu probable que cela doive être pris en compte dans l\'industrie courante du laser.\nCependant, il incombe à l\'opérateur de procéder à une évaluation appropriée des risques pour la sécurité.\n\nZones d\'Interférence Visuelle (SZED et CZED) :\nLes calculs des distances SZED (aveuglement temporaire) et CZED (éblouissement) sont basés sur des seuils d\'éclairement énergétique standards pour la vision humaine.\nCes valeurs ne sont valables que pour un observateur dont l\'œil est adapté à l\'obscurité (conditions de spectacle).\nCes résultats ne tiennent pas compte des conditions atmosphériques (brume, pluie, pollution) qui peuvent réduire ou diffuser la portée théorique du faisceau.\n\nParamètres Techniques :\nLe calculateur n\'est applicable que pour les sources laser en mode continu (CW) et n\'est valable que pour la plage de longueur d\'onde de 400 à 700 nm – paramètres standards pour les systèmes laser de spectacle.\n\nAcceptation des Risques :\nCe calculateur est fourni \"tel quel\".\nNous ne garantissons pas l\'exactitude et la précision des résultats.\nEn activant cet outil, l\'utilisateur reconnaît être un professionnel formé aux règles de sécurité en vigueur et accepte l\'entière responsabilité des risques liés à la mise en œuvre des équipements (laser, lumière, vidéo).\nVérifiez systématiquement les données avec les manuels constructeurs officiels.';

  @override
  String get laserLegalDisclaimerTextLong =>
      'AVERTISSEMENT LÉGAL ET CLAUSE DE NON-RESPONSABILITÉ\n\nL\'utilisation de ce calculateur est strictement réservée à titre informatif et indicatif.\nLes résultats obtenus ne constituent pas une expertise technique et ne sauraient engager la responsabilité de l\'éditeur en cas d\'erreur de calcul, d\'omission ou d\'accident survenus lors de l\'installation ou de l\'exploitation du matériel.\n\nCalculs NOHD et Instruments Optiques :\nDans certaines circonstances, des instruments optiques spéciaux (jumelles, télescopes) peuvent être utilisés pour visualiser le laser à une distance plus éloignée.\nCe fait doit être pris en compte lors de la détermination du NOHD.\nDans le calcul ci-joint, aucun instrument optique n\'est pris en compte, car il est très peu probable que cela doive être pris en compte dans l\'industrie courante du laser.\nCependant, il incombe à l\'opérateur de procéder à une évaluation appropriée des risques pour la sécurité.\n\nZones d\'Interférence Visuelle (SZED et CZED) :\nLes calculs des distances SZED (aveuglement temporaire) et CZED (éblouissement) sont basés sur des seuils d\'éclairement énergétique standards pour la vision humaine.\nCes valeurs ne sont valables que pour un observateur dont l\'œil est adapté à l\'obscurité (conditions de spectacle).\nCes résultats ne tiennent pas compte des conditions atmosphériques (brume, pluie, pollution) qui peuvent réduire ou diffuser la portée théorique du faisceau.\n\nParamètres Techniques :\nLe calculateur n\'est applicable que pour les sources laser en mode continu (CW) et n\'est valable que pour la plage de longueur d\'onde de 400 à 700 nm – paramètres standards pour les systèmes laser de spectacle.\n\nAcceptation des Risques :\nCe calculateur est fourni \"tel quel\".\nNous ne garantissons pas l\'exactitude et la précision des résultats.\nEn activant cet outil, l\'utilisateur reconnaît être un professionnel formé aux règles de sécurité en vigueur et accepte l\'entière responsabilité des risques liés à la mise en œuvre des équipements (laser, lumière, vidéo).\nVérifiez systématiquement les données avec les manuels constructeurs officiels.';

  @override
  String get commonDash => '—';
}
