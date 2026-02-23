// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get aboutArtNetSubtitle =>
      'DMX-Universen über Ethernet/UDP, Nodes, Broadcast vs Unicast.\nPraxis-Limits, Netzwerkstabilität, RDM je nach Hardware.';

  @override
  String get aboutArtNetTitle =>
      'Art-Net — DMX über IP (Nodes, Unicast/Broadcast)';

  @override
  String get aboutCablingFiberSubtitle =>
      'Cat5e→Cat8, Faser OM3/OM4/OS2, LC/SC/MPO, typische Distanzen, Show-Best-Practices.';

  @override
  String get aboutCablingFiberTitle =>
      'Netzwerk — RJ45 / Glasfaser / Bandbreiten & Längen';

  @override
  String get aboutComputingSubtitle =>
      'Nutzbare Datenraten, Versionen, reale Limits, Marketing-Fallen.';

  @override
  String get aboutComputingTitle => 'IT — USB / HDMI / DP / SATA / NVMe…';

  @override
  String get aboutDmxSubtitle =>
      'Universen, Adressen, Frames, RS-485-Verkabelung, Terminierung, typische Feldfehler.\nMit Schaubildern + Checkliste.';

  @override
  String get aboutDmxTitle => 'DMX — Funktionsweise (einfach & vollständig)';

  @override
  String get aboutElectricitySubtitle =>
      'Steckverbinder, Einphasen/Drehstrom, schnelle kW-Tabellen (16A→400A), typische Fallen.';

  @override
  String get aboutElectricityTitle => 'Elektrik — Schuko / P17 / Leistung';

  @override
  String get aboutIpBasicsSubtitle =>
      'IP, Maske, Gateway, DHCP vs statisch verstehen.\nKonkrete Beispiele (2.x, 10.x, 192.168.x) + Checkliste.';

  @override
  String get aboutIpBasicsTitle =>
      'Netzwerk — IP-Grundlagen / Maske / DHCP (essentiell)';

  @override
  String get aboutLightNetworkSubtitle =>
      'Einfache und robuste Architektur für Art-Net/sACN.\nVLAN, IGMP Snooping/Querier, WLAN (Jitter), Switches, Schaubilder + Checkliste.';

  @override
  String get aboutLightNetworkTitle =>
      'Licht-Netzwerk — VLAN, IGMP, WLAN vs Kabel';

  @override
  String get aboutSacnSubtitle =>
      'Ein netzwerkorientierter DMX-over-IP-Standard „pro“.\nMulticast/Unicast, IGMP Snooping/Querier, Prioritäten bei mehreren Quellen.';

  @override
  String get aboutSacnTitle => 'sACN / E1.31 — Multicast, IGMP, Prioritäten';

  @override
  String get aboutVideoSubtitle =>
      'Auswahl nach Latenz, Zuverlässigkeit, Verkabelung, LAN vs WAN.\nTabellen + Schema.';

  @override
  String get aboutVideoTitle => 'Video — SDI / NDI / IP (SRT/RTMP)';

  @override
  String get appTitle => 'Meine Tech-App';

  @override
  String catalogDmxModeItem(Object channels, Object name) {
    return '$name — $channels canaux';
  }

  @override
  String catalogDmxModeTitle(Object count) {
    return 'Mode DMX ($count)';
  }

  @override
  String get catalogInfoDmxChannels => 'Canaux DMX';

  @override
  String get catalogInfoLuminousFlux => 'Flux lumineux';

  @override
  String get catalogInfoPower => 'Puissance';

  @override
  String get catalogInfoWeight => 'Poids';

  @override
  String catalogLastUpdate(Object date) {
    return 'Dernière mise à jour : $date';
  }

  @override
  String catalogManufacturerTitle(Object count) {
    return 'Constructeur ($count)';
  }

  @override
  String catalogModelTitle(Object count) {
    return 'Modèle ($count)';
  }

  @override
  String get catalogNotProvided => 'Non renseigné';

  @override
  String get catalogOpenDmxChart => 'Ouvrir la table DMX';

  @override
  String get catalogOpenManual => 'Ouvrir le manuel';

  @override
  String get catalogResetTooltip => 'Réinitialiser';

  @override
  String catalogSyncError(Object message) {
    return 'Erreur : $message';
  }

  @override
  String catalogSyncFailed(Object reason) {
    return 'Échec de synchronisation : $reason';
  }

  @override
  String get catalogSyncFailedUnknown =>
      'Échec de synchronisation (raison inconnue).';

  @override
  String catalogTypeTitle(Object count) {
    return 'Type ($count)';
  }

  @override
  String get catalogUpdateTooltip => 'Mettre à jour';

  @override
  String get catalogUpdated => 'Catalogue mis à jour.';

  @override
  String get commonCalculate => 'Berechnen';

  @override
  String get commonCancel => 'Abbrechen';

  @override
  String get commonCopyResultTooltip => 'Ergebnis kopieren';

  @override
  String get commonDash => '—';

  @override
  String get commonNone => 'Keine Einträge';

  @override
  String get commonOk => 'OK';

  @override
  String get commonOkWithCheck => 'OK ✅';

  @override
  String get commonRename => 'Umbenennen';

  @override
  String get commonReset => 'Zurücksetzen';

  @override
  String get commonSave => 'Speichern';

  @override
  String get commonSearch => 'Suchen';

  @override
  String get commonTooLowWithCross => 'Zu niedrig ❌';

  @override
  String get commonUnitMeter => 'm';

  @override
  String get consentsReset => 'Einwilligungen zurückgesetzt.';

  @override
  String get dipSwitchAddressHint => 'Ex : 1 à 512';

  @override
  String get dipSwitchAddressLabel => 'Adresse DMX';

  @override
  String get dipSwitchChannelUnit => 'canal';

  @override
  String get dipSwitchEndOfUniverseWarning =>
      'Attention : fin d’univers DMX atteinte.';

  @override
  String get dipSwitchInputsTitle => 'Entrées';

  @override
  String get dipSwitchIntervalHint => 'Ex : 4 (canaux)';

  @override
  String get dipSwitchIntervalLabel => 'Intervalle';

  @override
  String get dipSwitchModeAddressDirect => 'Adresse directe';

  @override
  String get dipSwitchModeAddressMinusOne => 'Adresse - 1';

  @override
  String get dipSwitchNextAddressButton => 'Adresse suivante';

  @override
  String get dipSwitchOffLabel => 'OFF';

  @override
  String get dipSwitchOnLabel => 'ON';

  @override
  String get dipSwitchResetTooltip => 'Réinitialiser';

  @override
  String dipSwitchResultAddressLine(Object address) {
    return 'Adresse : $address';
  }

  @override
  String get dipSwitchResultAddressNotProvided => 'Adresse non renseignée';

  @override
  String dipSwitchResultBinaryValueLine(Object binary) {
    return 'Binaire : $binary';
  }

  @override
  String get dipSwitchResultHeader => 'Résultat';

  @override
  String dipSwitchResultIntervalLine(Object end, Object start) {
    return 'Intervalle : $start → $end';
  }

  @override
  String dipSwitchResultModeLine(Object mode) {
    return 'Mode : $mode';
  }

  @override
  String get dipSwitchScrollHint => 'Fais défiler pour voir tous les switchs.';

  @override
  String get dipSwitchSectionTitle => 'Switchs';

  @override
  String get dipSwitchSummaryTitle => 'Résumé';

  @override
  String dipSwitchSwitchLabel(Object index) {
    return 'Switch $index';
  }

  @override
  String get dipSwitchUseAddressMinusOneLabel => 'Utiliser le mode Adresse - 1';

  @override
  String get disclaimerAccept => 'Ich akzeptiere';

  @override
  String get disclaimerCertify =>
      'Ich bestätige, dass ich diese Bedingungen gelesen und akzeptiert habe.';

  @override
  String get disclaimerText =>
      'NUR ZUR INFORMATION\n\nDie von dieser App bereitgestellten Berechnungen (Video, Licht, Laser) dienen ausschließlich Informations- und Richtwertzwecken.\nSie ersetzen keinesfalls:\n- zertifizierte Berechnungen,\n- technische Studien,\n- geltende offizielle Normen,\n- oder die Prüfung durch eine qualifizierte Fachperson.\n\nHAFTUNG\nDer Herausgeber dieser App kann nicht für Rechenfehler, Auslassungen, Sachschäden,\nPersonenschäden oder Vorfälle haftbar gemacht werden, die bei Installation, Betrieb oder Nutzung der Geräte auftreten.\n\nVIDEO & PROJEKTION\nErgebnisse (Größen, Verhältnisse, Helligkeit, Overlaps usw.) basieren auf theoretischen Modellen und können je nach:\nOptik, Zoom, Homogenität, Umgebungslicht, Oberfläche, Einstellungen usw. variieren.\nBitte stets mit offizieller Herstellerdokumentation verifizieren.\n\nLICHT\n\nBerechnungen sind Richtwerte und berücksichtigen nicht alle realen Bedingungen (Toleranzen, optische Verluste,\nAlterung der Lichtquellen, lokale Normen, Umgebungsbedingungen …).\n\nLASER – SICHERHEIT\nNOHD-, SZED- und CZED-Berechnungen basieren auf Standardannahmen und theoretischen Grenzwerten.\nSie berücksichtigen insbesondere nicht:\n- optische Instrumente (Ferngläser, Kameras, Teleskope …),\n- atmosphärische Bedingungen (Nebel, Regen, Staub …),\n- unerwartete Reflexionen, Fehlanwendung, spezifische Einstellungen.\nDer Einsatz eines Lasersystems bedeutet direkte Verantwortung der Bedienperson und erfordert eine passende Risikoanalyse.\n\nRISIKOAKZEPTANZ\nDurch die Nutzung dieser App bestätigt der/die Nutzer:in:\n- die geltenden Sicherheitsregeln zur Kenntnis genommen zu haben,\n- allein für seine/ihre Installationen verantwortlich zu sein,\n- die volle Verantwortung für Risiken im Zusammenhang mit der Nutzung der Geräte (Video, Licht, Laser) zu übernehmen,\n- die Daten systematisch mit offiziellen Herstellerhandbüchern zu überprüfen.';

  @override
  String get disclaimerTitle => '⚠️ RECHTLICHER HINWEIS & HAFTUNGSAUSSCHLUSS';

  @override
  String get homeLaserSubtitle =>
      'Laser-Berechnungen und Sicherheit (Einwilligung bei jedem Aufruf erforderlich).';

  @override
  String get homeLaserTitle => 'Laser';

  @override
  String get homeLightSubtitle =>
      'Projektionsgröße, DMX-DIP-Schalter, Photometrie, Katalog, DMX-Patch.';

  @override
  String get homeLightTitle => 'Licht';

  @override
  String get homeReferencesSubtitle =>
      'DMX / Netzwerk / Video: Merkblätter & Praxis-Referenzen.';

  @override
  String get homeReferencesTitle => 'Referenzen';

  @override
  String get homeTitle => 'Start';

  @override
  String get homeVideoSubtitle =>
      'Objektiv & Messung, Helligkeit, Multi-Projektor, LED und Testbilder.';

  @override
  String get homeVideoTitle => 'Video';

  @override
  String get language => 'Sprache';

  @override
  String get languageSystem => 'System (automatisch)';

  @override
  String get languageSystemCurrent => 'Handysprache';

  @override
  String get laserAdviceFullPower => 'Volle Leistung zulässig (100 %)';

  @override
  String laserAdviceMaxRecommended(Object percent) {
    return 'Maximal empfohlene Leistung: $percent';
  }

  @override
  String get laserConsentCheckboxLabel =>
      'J’accepte et je comprends les risques.';

  @override
  String get laserConsentContinue => 'Continuer';

  @override
  String get laserConsentText =>
      'ZUGRIFF AUF DEN LASER-BEREICH\n\nDer LASER-Bereich dieser App betrifft Sicherheitsberechnungen (z. B. NOHD, SZED, CZED).\nDiese Berechnungen sind Richtwerte und ersetzen nicht:\n- eine Risikoanalyse,\n- geltende Normen,\n- Betriebsverfahren,\n- oder die Prüfung durch eine qualifizierte Person.\n\nWICHTIG\n- Risiko von Augen-/Hautverletzungen bei unsachgemäßer Nutzung.\n- Das Ergebnis kann falsch sein, wenn eingegebene Parameter unvollständig/fehlerhaft sind oder reale Bedingungen abweichen (Optik,\n  atmosphärische Bedingungen, Reflexionen, Ausrichtung usw.).\n- Die Bedienperson ist allein verantwortlich für Installation, Betrieb und Konformität.\n\nDurch Bestätigung erklärst du, dass du:\n- die Risiken verstehst,\n- die geltenden Sicherheitsregeln einhältst,\n- die volle Verantwortung bei Fahrlässigkeit oder Fehlanwendung übernimmst.';

  @override
  String get laserConsentTitle => '🔴 LASER-EINWILLIGUNG (VERPFLICHTEND)';

  @override
  String get laserDiameterHint => 'z. B.: 3.0';

  @override
  String get laserDiameterLabel => 'Ausgangsdurchmesser (mm)';

  @override
  String get laserDisclaimerShort =>
      'Richtwert-Berechnung. Ersetzt keine Laser-Sicherheitsanalyse.';

  @override
  String get laserDivergenceHint => 'z. B.: 1.2';

  @override
  String get laserDivergenceLabel => 'Divergenz (mrad)';

  @override
  String get laserInputsTitle => 'Eingaben';

  @override
  String get laserInvalidInputs =>
      'Bitte gültige Werte für Leistung, Divergenz und Durchmesser eingeben.';

  @override
  String get laserNameUpdated => 'Name aktualisiert.';

  @override
  String get laserNormativeParamsBody =>
      'MPE für Nominal Ocular Hazard Distance (NOHD): 25,4 W/m²\n(Norm IEC 60825-1, Ausgabe 3.0)\n\nMPE für Sensitive Zone Exposure Distance (SZED): 1 W/m²\n(Norm ANSI Z136.6)\n\nMPE für Critical Zone Exposure Distance (CZED): 0,05 W/m²\n(Norm ANSI Z136.6)';

  @override
  String get laserNormativeParamsTitle => 'Verwendete Sicherheitsparameter';

  @override
  String get laserPowerHint => 'z. B.: 5000';

  @override
  String get laserPowerLabel => 'Leistung (mW)';

  @override
  String get laserPresetAdded => 'Eintrag hinzugefügt.';

  @override
  String get laserPresetDeleted => 'Eintrag gelöscht.';

  @override
  String laserPresetSubtitle(Object diam, Object div, Object p) {
    return 'P: $p mW • Div: $div mrad • Ø: $diam mm';
  }

  @override
  String get laserProjectorNameLabel => 'Projektorname';

  @override
  String get laserRenameProjectorTitle => 'Projektor umbenennen';

  @override
  String get laserSafetyResultsTitle => 'Sicherheitsergebnisse';

  @override
  String get laserSaveCurrentProjector => 'Diesen Projektor speichern';

  @override
  String get laserSaveProjectorTitle => 'Projektor speichern';

  @override
  String get laserSavedProjectorsTitle => 'Gespeicherte Projektoren';

  @override
  String get laserSearchHint => 'z. B.: „RGB 5W“';

  @override
  String get laserTargetDistanceHint => 'z. B.: 10';

  @override
  String get laserTargetDistanceLabel => 'Zielentfernung (m)';

  @override
  String get laserZoneCzedDesc => 'Kritische Zone';

  @override
  String get laserZoneNohdDesc => 'Augengefahr';

  @override
  String get laserZoneSzedDesc => 'Sensible Zone';

  @override
  String get legalNotices => 'Rechtliche Hinweise';

  @override
  String get lightCatalogDescription =>
      'Auswahl nach Hersteller, Typ und Produkt, mit Informationen und Handbuch.';

  @override
  String get lightCatalogTitle => 'Katalog';

  @override
  String get lightDisclaimerShort =>
      'Richtwert-Tools. Prüfe immer die Herstellerdokumentation.';

  @override
  String get lightDmxSwitchDescription =>
      'Richtwert-Umrechnung zwischen DMX-Adresse und Schaltern, mit Intervall-Navigation.';

  @override
  String get lightDmxSwitchTitle => 'DMX-DIP-Schalter';

  @override
  String get lightPatchDescription =>
      'MVR-Datei importieren oder Patch manuell aus der Bibliothek erstellen.';

  @override
  String get lightPatchTitle => 'DMX-Patch';

  @override
  String get lightPhotometryDescription =>
      'Richtwert-Umrechnungen zwischen Lux, Candela und Lumen, mit Entfernung und Winkel.';

  @override
  String get lightPhotometryTitle => 'Photometrie';

  @override
  String get lightProjectionDescription =>
      'Richtwert-Berechnung der Spot-Größe anhand von Winkel, Entfernung und Durchmesser.';

  @override
  String get lightProjectionTitle => 'Projektionsgröße';

  @override
  String get menuTitle => 'Menü';

  @override
  String get mireBlendLabel => 'BLEND';

  @override
  String get mireDash => '—';

  @override
  String get mireErrInvalidOverlap => '❌ Ungültiger Overlap (0 bis 99.9).';

  @override
  String get mireErrInvalidProjectors => '❌ Ungültige Projektoranzahl (N > 0).';

  @override
  String get mireErrInvalidWHpx => '❌ Ungültige Breite/Höhe (px).';

  @override
  String get mireExportPng => 'PNG exportieren';

  @override
  String get mireHeightPxHint => 'z. B.: 1080';

  @override
  String get mireHeightPxHintMapping => 'z. B.: 2160';

  @override
  String get mireHeightPxLabel => 'Höhe (px)';

  @override
  String get mireLedErrTileCm => '❌ Tile cm angeben (Breite/Höhe >0).';

  @override
  String get mireLedErrTilePx => '❌ Tile px angeben (Breite/Höhe >0).';

  @override
  String get mireLedErrTilesXY => '❌ Tiles X/Y angeben (>0).';

  @override
  String get mireLedParamsTitle => 'LED-Wall-Parameter';

  @override
  String mireLedPitchComputed(Object pitch) {
    return 'Berechneter Pitch: $pitch';
  }

  @override
  String get mireLedSubtitleColorBars => 'Balken + Rampen + Kreise';

  @override
  String get mireLedSubtitleGridLabels => 'Raster + Markierungen + Kreise';

  @override
  String get mireLedSubtitlePixelPerfect => 'Pixel-perfect + Kreise';

  @override
  String get mireLedSubtitleUniformity => 'Homogenität + Kreise';

  @override
  String get mireLedTileHcmLabel => 'Tile-Höhe (cm)';

  @override
  String get mireLedTileHpxLabel => 'Tile-Höhe (px)';

  @override
  String get mireLedTileWcmLabel => 'Tile-Breite (cm)';

  @override
  String get mireLedTileWpxLabel => 'Tile-Breite (px)';

  @override
  String get mireLedTilesIdTitle => 'LED / TILE-IDs';

  @override
  String get mireLedTilesXLabel => 'Tiles horizontal (X)';

  @override
  String get mireLedTilesYLabel => 'Tiles vertikal (Y)';

  @override
  String get mireLedTitle => 'LED / TESTBILD';

  @override
  String get mireLedTypeColorBars => 'Balken + Rampen + Kreise';

  @override
  String get mireLedTypeGridLabels => 'Raster + Markierungen + Kreise';

  @override
  String get mireLedTypePixelPerfect => 'Pixel-perfect + Kreise';

  @override
  String get mireLedTypeTilesId => 'Tile-IDs (Nummer + Farben)';

  @override
  String get mireLedTypeUniformity => 'Homogenität + Kreise';

  @override
  String mireLedWallResolution(Object h, Object w) {
    return 'Wall-Auflösung: $w × $h px';
  }

  @override
  String get mireLedWarnPitchOutOfRange =>
      '⚠️ Berechneter Pitch außerhalb Bereich (0.5–20 mm). Prüfe Tile cm / px.';

  @override
  String get mireLedWarnPitchXNotY =>
      '⚠️ Pitch X ≠ Pitch Y (uneinheitliches Tile). Prüfe cm- und px-Maße.';

  @override
  String get mireMappingSectionTitle => 'Multi-Projektor-Mapping-Testbild';

  @override
  String mireMappingSubtitlePattern(Object n, Object orient, Object percent) {
    return 'N=$n • Overlap $percent% • $orient';
  }

  @override
  String get mireMappingTypeBlendRamps => 'Blend-Rampen';

  @override
  String get mireMappingTypeCombo => 'Kombi (Zonen + Overlap + Blend)';

  @override
  String get mireMappingTypeLabel => 'Mapping-Typ';

  @override
  String get mireMappingTypeZonesOverlap => 'Zonen + Overlap';

  @override
  String get mireOrientationHorizontal => 'Horizontal';

  @override
  String get mireOrientationLabel => 'Ausrichtung';

  @override
  String get mireOrientationVertical => 'Vertikal';

  @override
  String get mireOverlapHint => 'z. B.: 10.0';

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
    return 'PROJEKTOR $index';
  }

  @override
  String get mireProjectorsNHint => 'z. B.: 2';

  @override
  String get mireProjectorsNLabel => 'Anzahl Projektoren (N)';

  @override
  String get mireSimpleSectionTitle => 'Einfaches Screen-Testbild';

  @override
  String get mireSimpleSubtitleCheckerboard => 'Schachbrett + Kreise';

  @override
  String get mireSimpleSubtitleColorBars => 'Balken + Rampen + Kreise';

  @override
  String get mireSimpleSubtitleComboAll =>
      'Raster + Safe + 2 zentrierte Balken + Kreise';

  @override
  String get mireSimpleSubtitleGridSafe => 'Raster + Safe + Kreise';

  @override
  String get mireSimpleSubtitleUniformity => 'Homogenität + Kreise';

  @override
  String get mireSimpleTypeCheckerboard => 'Schachbrett + Kreise';

  @override
  String get mireSimpleTypeColorBars => 'Balken + Rampen + Kreise';

  @override
  String get mireSimpleTypeComboAll =>
      'Kombi (Raster + Kreise + 2 zentrierte Balken)';

  @override
  String get mireSimpleTypeGridSafe => 'Raster + Safe + Kreise';

  @override
  String get mireSimpleTypeUniformity => 'Homogenität + Kreise';

  @override
  String get mireTileMissingPx => 'Tile (px) für Nummerierung angeben.';

  @override
  String mireTilesSubtitleBase(Object nx, Object ny, Object th, Object tw) {
    return 'Tile ${tw}x$th px • Raster $nx x $ny';
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
  String get mireTypeLabel => 'Testbild-Typ';

  @override
  String get mireVideoComboTitle => 'VIDEO / KOMBI-TESTBILD';

  @override
  String get mireVideoMappingSectionTitle => 'Multi-Projektor-Mapping-Testbild';

  @override
  String get mireVideoMappingTitle => 'VIDEO / MAPPING-TESTBILD';

  @override
  String get mireVideoSimpleSectionTitle => 'Einfaches Screen-Testbild';

  @override
  String get mireVideoSimpleTitle => 'VIDEO / EINFACHES TESTBILD';

  @override
  String get mireVideoTypeCheckerboard => 'Schachbrett + Kreise';

  @override
  String get mireVideoTypeColorBars => 'Balken + Rampen + Kreise';

  @override
  String get mireVideoTypeCombo =>
      'Kombi (Raster + Kreise + 2 zentrierte Balken)';

  @override
  String get mireVideoTypeGridSafe => 'Raster + Safe + Kreise';

  @override
  String get mireVideoTypeUniformity => 'Homogenität + Kreise';

  @override
  String get mireWallNotMultipleOfTiles => 'WALL NICHT DURCH TILES TEILBAR';

  @override
  String get mireWidthPxHint => 'z. B.: 1920';

  @override
  String get mireWidthPxHintMapping => 'z. B.: 3840';

  @override
  String get mireWidthPxLabel => 'Breite (px)';

  @override
  String patchAddressLabel(Object address) {
    return 'Adresse : $address';
  }

  @override
  String patchChannelsUsed(Object count) {
    return 'Canaux utilisés : $count / 512';
  }

  @override
  String get patchConflictError => 'Conflit d’adresses (chevauchement).';

  @override
  String get patchConflictShort => 'Conflit';

  @override
  String patchConflicts(Object count) {
    return 'Conflits : $count';
  }

  @override
  String get patchEditChannelsLabel => 'Canaux';

  @override
  String get patchEditHint => 'Vérifie le mode et le nombre de canaux.';

  @override
  String get patchEditModeLabel => 'Mode';

  @override
  String get patchEditTitle => 'Édition';

  @override
  String get patchEmptyUniverse => 'Aucune machine dans cet univers.';

  @override
  String patchFixturesCount(Object count) {
    return 'Machines : $count';
  }

  @override
  String get patchHomeDisclaimer =>
      'Les résultats sont indicatifs. Vérifie toujours avec la console.';

  @override
  String get patchHomeImportMvrDescription =>
      'Analyser un fichier MVR et charger le patch en référence.';

  @override
  String get patchHomeImportMvrTitle => 'Importer un MVR';

  @override
  String get patchHomeTitle => 'Patch DMX';

  @override
  String get patchHomeViewPatchDescription => 'Liste et conflits par univers.';

  @override
  String get patchHomeViewPatchTitle => 'Voir le patch';

  @override
  String get patchHubOpenGridButton => 'Ouvrir grille';

  @override
  String get patchHubOpenMvrButton => 'Ouvrir MVR';

  @override
  String get patchHubStateEmpty => 'Aucune référence chargée.';

  @override
  String patchHubStateLoaded(Object count) {
    return 'Chargé : $count univers';
  }

  @override
  String get patchHubStateTitle => 'État';

  @override
  String get patchHubTitle => 'Hub Patch';

  @override
  String get patchHubWorksiteBody =>
      'Importer un MVR ou consulter la grille d’occupation.';

  @override
  String get patchHubWorksiteTitle => 'Chantier';

  @override
  String get patchInvalidChannelCount => 'Nombre de canaux invalide.';

  @override
  String get patchIssueInvalidChannelCount =>
      'Le nombre de canaux doit être supérieur ou égal à 1.';

  @override
  String get patchIssueInvalidStartAddress =>
      'L’adresse DMX doit être comprise entre 1 et 512.';

  @override
  String get patchIssueInvalidUniverse =>
      'L’univers doit être supérieur ou égal à 1.';

  @override
  String get patchIssueRangeExceedsUniverse =>
      'La plage de canaux dépasse 512 dans cet univers.';

  @override
  String get patchIssueUnknown => 'Erreur inconnue.';

  @override
  String get patchListTitle => 'Liste';

  @override
  String get patchManualDisabledBody =>
      'Le patch est en lecture seule lorsqu’une référence MVR est chargée.';

  @override
  String get patchManualDisabledTitle => 'Désactivé';

  @override
  String get patchManualTitle => 'Patch manuel';

  @override
  String patchModeLabel(Object mode) {
    return 'Mode : $mode';
  }

  @override
  String get patchMvrButtonAnalyzing => 'Analyse…';

  @override
  String get patchMvrButtonLoadAsReference => 'Charger comme référence';

  @override
  String get patchMvrButtonPickFile => 'Choisir un fichier';

  @override
  String get patchMvrClearTooltip => 'Effacer';

  @override
  String get patchMvrColAddress => 'Adresse';

  @override
  String get patchMvrColChannels => 'Canaux';

  @override
  String get patchMvrColId => 'ID';

  @override
  String get patchMvrColName => 'Nom';

  @override
  String get patchMvrColUniverse => 'Univers';

  @override
  String get patchMvrColumnsHint =>
      'Colonnes : ID, Nom, Univers, Adresse, Canaux';

  @override
  String get patchMvrFileCardHelp =>
      'Sélectionne un fichier .mvr (ZIP) pour analyser le patch.';

  @override
  String get patchMvrFileCardTitle => 'Fichier';

  @override
  String get patchMvrFilterAllUniverses => 'Tous les univers';

  @override
  String get patchMvrFilterUniverseLabel => 'Filtrer par univers';

  @override
  String get patchMvrModeNotProvided => 'Mode non renseigné';

  @override
  String get patchMvrOrderAsc => 'Croissant';

  @override
  String get patchMvrOrderDesc => 'Décroissant';

  @override
  String get patchMvrOrderLabel => 'Ordre';

  @override
  String get patchMvrSortAddress => 'Adresse';

  @override
  String get patchMvrSortByLabel => 'Trier par';

  @override
  String get patchMvrSortChannels => 'Canaux';

  @override
  String get patchMvrSortId => 'ID';

  @override
  String get patchMvrSortName => 'Nom';

  @override
  String get patchMvrSortUniverse => 'Univers';

  @override
  String get patchMvrSortUniverseThenAddress => 'Univers puis adresse';

  @override
  String get patchMvrStatusCleared => 'Référence effacée.';

  @override
  String get patchMvrStatusEmptyBytes => 'Fichier vide.';

  @override
  String get patchMvrStatusExtractingZip => 'Extraction du ZIP…';

  @override
  String patchMvrStatusFilePickFailed(Object reason) {
    return 'Sélection de fichier impossible : $reason';
  }

  @override
  String patchMvrStatusFixturesFound(int count, int resolved) {
    return 'Machines trouvées : $count (multi-canaux : $resolved).';
  }

  @override
  String get patchMvrStatusLoadingGdtf => 'Chargement des GDTF…';

  @override
  String get patchMvrStatusNoContentToLoad => 'Aucun contenu à charger.';

  @override
  String get patchMvrStatusNoFileSelected => 'Aucun fichier sélectionné.';

  @override
  String get patchMvrStatusNoUsableFixtures =>
      'Aucune machine exploitable trouvée.';

  @override
  String patchMvrStatusParseError(Object message) {
    return 'Erreur de parsing : $message';
  }

  @override
  String get patchMvrStatusParsingContent => 'Analyse du contenu…';

  @override
  String patchMvrStatusReferenceLoaded(int count, int skipped, int footprints) {
    return 'Référence chargée : $count machine(s) (ignorées : $skipped, empreintes GDTF : $footprints).';
  }

  @override
  String patchMvrStatusRestored(Object count) {
    return 'Restauration : $count machines';
  }

  @override
  String get patchMvrStatusSceneXmlNotFound =>
      'scene.xml introuvable dans le MVR.';

  @override
  String get patchMvrStatusSelectingFile => 'Sélection du fichier…';

  @override
  String patchMvrStatusUnsupportedFile(Object ext) {
    return 'Fichier non supporté : $ext';
  }

  @override
  String get patchMvrSummaryTitle => 'Résumé';

  @override
  String get patchMvrTitle => 'Import MVR';

  @override
  String patchMvrUniverseItem(Object universe) {
    return 'Univers $universe';
  }

  @override
  String get patchPageTitle => 'Patch';

  @override
  String get patchSummaryTitle => 'Résumé';

  @override
  String get patchUniverseAppBarTitle => 'Patch';

  @override
  String patchUniverseConflictCount(Object count) {
    return 'Conflits : $count canal(aux)';
  }

  @override
  String get patchUniverseGridLimitedByWidth =>
      'Limité par la largeur de l’écran.';

  @override
  String get patchUniverseGridTitle => 'Occupation (1 à 512)';

  @override
  String patchUniverseItem(Object universe) {
    return 'Univers $universe';
  }

  @override
  String get patchUniverseLabel => 'Univers';

  @override
  String get patchUniverseLegendConflict => 'Conflit';

  @override
  String get patchUniverseLegendFree => 'Libre';

  @override
  String get patchUniverseLegendOccupied => 'Occupé';

  @override
  String patchUniverseOccupantLine(
      Object channels, Object end, Object fixture, Object mode, Object start) {
    return '• $fixture\n  $mode — $channels canal(aux)\n  $start → $end';
  }

  @override
  String patchUniverseOccupiedCount(Object count) {
    return 'Occupés : $count / 512';
  }

  @override
  String patchUniversePopupHeader(
      Object address, Object state, Object universe) {
    return 'Univers $universe — Adresse $address\nÉtat : $state';
  }

  @override
  String get patchUniversePopupManyOccupants =>
      'Plusieurs machines occupent ce canal.';

  @override
  String patchUniversePopupMore(Object count) {
    return '… et $count autre(s).';
  }

  @override
  String get patchUniversePopupTitleConflict => 'Conflit';

  @override
  String get patchUniversePopupTitleFree => 'Canal libre';

  @override
  String get patchUniversePopupTitleOccupied => 'Canal occupé';

  @override
  String get patchUniverseReferenceNone => 'Aucune référence chargée';

  @override
  String get patchUniverseReferenceReadOnly => 'Lecture seule (depuis MVR)';

  @override
  String get patchUniverseReferenceTitle => 'Référence';

  @override
  String get patchUniverseResetConfirm => 'Réinitialiser';

  @override
  String get patchUniverseResetContent =>
      'Cela efface le patch chargé depuis le MVR dans l’application.\nAucune donnée du fichier n’est modifiée.';

  @override
  String get patchUniverseResetTitle => 'Réinitialiser la référence ?';

  @override
  String get patchUniverseResetTooltip => 'Réinitialiser la référence';

  @override
  String get patchUniverseSelected => 'Univers sélectionné';

  @override
  String get patchUniverseStateConflict => 'Conflit';

  @override
  String get patchUniverseStateFree => 'Libre';

  @override
  String get patchUniverseStateOccupied => 'Occupé';

  @override
  String get patchUniverseTapHint => 'Touche une case pour afficher le détail.';

  @override
  String get patchUniverseUniverseDropdownLabel => 'Univers DMX';

  @override
  String patchUniverseUniverseItem(Object universe) {
    return 'Univers $universe';
  }

  @override
  String get patchUniverseUniverseTitle => 'Univers';

  @override
  String get patchUniverseZoomIn => 'Agrandir';

  @override
  String get patchUniverseZoomOut => 'Réduire';

  @override
  String get patchUniverseZoomTitle => 'Zoom';

  @override
  String get photometryBeamAngleHint2 => 'En degrés';

  @override
  String get photometryBeamAngleHint3 => 'En degrés';

  @override
  String get photometryBeamAngleLabel => 'Angle de faisceau';

  @override
  String get photometryCandelaHint1 => 'Entrez une valeur en cd';

  @override
  String get photometryCandelaHint2 => 'Entrez une valeur en cd';

  @override
  String get photometryCandelaLabel => 'Candela';

  @override
  String get photometryDisclaimerShort =>
      'Indication uniquement. Vérifie avec la documentation constructeur.';

  @override
  String get photometryDistanceHint1 => 'En mètres';

  @override
  String get photometryDistanceHint3 => 'En mètres';

  @override
  String get photometryDistanceLabel => 'Distance';

  @override
  String get photometryLumensHint2 => 'Entrez une valeur en lm';

  @override
  String get photometryLumensHint3 => 'Entrez une valeur en lm';

  @override
  String get photometryLumensLabel => 'Lumens';

  @override
  String get photometryLuxHint => 'Entrez une valeur en lux';

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
    return 'À $distance m, $candela cd ≈ $lux lux.';
  }

  @override
  String photometrySummary2(Object distance, Object lumens, Object lux) {
    return 'À $distance m, $lumens lm ≈ $lux lux (approx.).';
  }

  @override
  String photometrySummary3(
      String lumens, String distance, String angle, String lux) {
    return 'Lumens : $lumens lm — Distance : $distance m — Angle : $angle° — Lux : $lux lx.';
  }

  @override
  String get projectionAngleHint => 'En degrés';

  @override
  String get projectionAngleLabel => 'Angle';

  @override
  String get projectionAutoHelp => 'Auto : calcule la valeur manquante.';

  @override
  String projectionConeAngle(Object angle) {
    return 'Angle : $angle°';
  }

  @override
  String projectionConeDiameter(Object diameter) {
    return 'Diamètre : $diameter m';
  }

  @override
  String projectionConeDistance(Object distance) {
    return 'Distance : $distance m';
  }

  @override
  String projectionDetailAngle(Object angle) {
    return 'Angle : $angle°';
  }

  @override
  String projectionDetailDiameter(Object diameter) {
    return 'Diamètre : $diameter m';
  }

  @override
  String projectionDetailDistance(Object distance) {
    return 'Distance : $distance m';
  }

  @override
  String get projectionDiameterHint => 'En mètres';

  @override
  String get projectionDiameterLabel => 'Diamètre';

  @override
  String get projectionDistanceHint => 'En mètres';

  @override
  String get projectionDistanceLabel => 'Distance';

  @override
  String get projectionHeaderAutoActive => 'Auto actif';

  @override
  String get projectionHeaderNeedTwoValues =>
      'Renseigne au moins deux valeurs.';

  @override
  String get projectionInputsTitle => 'Entrées';

  @override
  String get projectionResultsTitle => 'Résultats';

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
    return 'Format: $format\nFläche: $area m²\nLux (lm/m²): $lux\nEq-Lux (Gain): $luxEq\nLuminanz: $nits Nits | $fl ft-L\nMindest-Schwelle ($presetLabel): $minFl ft-L → $status\nHinweis: Richtwert-Schätzung (Lambert).';
  }

  @override
  String get videoBrightnessSectionTitle =>
      'Berechnung 4 — Lux / Nits / ft-L + Schwelle';

  @override
  String get videoBrightnessSubtitle =>
      'Lux / Nits / ft-L + Schwelle (Berechnung 4).';

  @override
  String get videoBrightnessTitle => 'Helligkeit';

  @override
  String get videoCalc1ErrMissing => '❌ Fehlende Daten: Distanz + Breite.';

  @override
  String videoCalc1Ok(Object ratio) {
    return '✅ Projektions-Ratio = $ratio';
  }

  @override
  String get videoCalc1Title => 'Berechnung 1 — Ratio (Distanz / Breite)';

  @override
  String get videoCalc2ErrMissing => '❌ Fehlende Daten: Distanz + Ratio.';

  @override
  String videoCalc2Ok(Object width) {
    return '✅ Bildbreite = $width m';
  }

  @override
  String get videoCalc2Title => 'Berechnung 2 — Breite (Distanz / Ratio)';

  @override
  String get videoCalc3ErrMissingWidth => '❌ Fehlender Wert: Breite.';

  @override
  String videoCalc3Ok(Object format, Object height) {
    return '✅ Höhe = $height m (Format $format)';
  }

  @override
  String get videoCalc3Title => 'Berechnung 3 — Höhe (Breite + Format)';

  @override
  String get videoCalc4ErrGt0 => '❌ Lumen/Gain/Breite müssen > 0 sein.';

  @override
  String get videoCalc4ErrMissing => '❌ Fehlende Daten: Lumen + Gain + Breite.';

  @override
  String get videoCalc4ErrMissingSimple =>
      '❌ Fehlende Daten: Breite + Lumen + Gain.';

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
    return 'Fläche: $area m² (Format $format)\nLux (lm/m²): $lux\nEq-Lux (Gain): $luxEq\nLuminanz: $nits Nits | $fl ft-L\nMindest-Schwelle ($presetLabel): $minFl ft-L → $status\nHinweis: Umrechnung Nits/ft-L basiert auf einer Lambert-Annahme (approx).';
  }

  @override
  String get videoCalc4Title =>
      'Berechnung 4 — Helligkeit (Lux / Nits / ft-L + Schwelle)';

  @override
  String get videoCalc5ErrMissing =>
      '❌ Fehlende Daten: Gesamtbreite + Overlap% + Anzahl Projektoren.';

  @override
  String get videoCalc5ErrNMin2 => '❌ Anzahl Projektoren muss ≥ 2 sein.';

  @override
  String get videoCalc5NHint => 'z. B.: 2';

  @override
  String get videoCalc5NLabel => 'Anzahl Projektoren (N)';

  @override
  String videoCalc5Result(Object format, Object hTot, Object n, Object overlapM,
      Object overlapPct, Object wPer, Object wTot) {
    return 'Gesamtbreite: $wTot m\nN: $n | Overlap: $overlapPct% (bezogen auf Projektorbreite)\n\n- Breite pro Projektor: $wPer m\n- Overlap zwischen 2 Projektoren: $overlapM m\n- Gesamthöhe (Format $format): $hTot m';
  }

  @override
  String get videoCalc5Title => 'Berechnung 5 — Overlap (Gesamtbreite + N)';

  @override
  String get videoCalc6ErrMissingBasics =>
      '❌ Fehlende Daten: Gesamtbreite + Distanz + Overlap%.';

  @override
  String get videoCalc6ErrMissingRatio =>
      '❌ Fehlende Daten: Ratio min und/oder Ratio max.';

  @override
  String get videoCalc6GainHint => 'z. B.: 1.0';

  @override
  String get videoCalc6GainLabel => 'Gain (Calc 6)';

  @override
  String get videoCalc6LumensPerProjectorHint => 'z. B.: 20000';

  @override
  String get videoCalc6LumensPerProjectorLabel => 'Lumen pro Projektor';

  @override
  String get videoCalc6LumiErrGt0 =>
      'Helligkeit: ❌ Lumen/Projektor und Gain müssen > 0 sein.';

  @override
  String videoCalc6LumiForN(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Geschätzte Helligkeit (N=$n)\nFläche: $area m²\nEq-Lux: $lux (lm/m²)\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoCalc6LumiOptional =>
      'Helligkeit (optional): Lumen/Projektor + Gain für die Schätzung eintragen.';

  @override
  String get videoCalc6NoteIndicative =>
      'Hinweis: Richtwert-Schätzung (reales Blend/Overlap kann leicht reduzieren).';

  @override
  String get videoCalc6RatioMaxHint => 'z. B.: 1.80';

  @override
  String get videoCalc6RatioMaxLabel => 'Ratio max';

  @override
  String get videoCalc6RatioMinHint => 'z. B.: 1.20';

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
    return 'Gesamtbreite=$wTot m | Distanz=$distance m | Overlap=$overlapPct%\nFormat $format → Gesamthöhe=$hTot m | Fläche=$area m²\nRatio min/max: $ratioMin → $ratioMax\n\nFall weitestes Ratio (min) = $nMin Projektoren | Abdeckung ≈ $covMin m\n$lumiMin\n\nFall engstes Ratio (max) = $nMax Projektoren | Abdeckung ≈ $covMax m\n$lumiMax\n\n$note';
  }

  @override
  String get videoCalc6Title =>
      'Berechnung 6 — Auto-N Projektoren + Helligkeit';

  @override
  String videoCalcLabel(Object n) {
    return 'Berechnung $n';
  }

  @override
  String get videoCalculateAll => 'Alles berechnen';

  @override
  String get videoCalculationsTitle => 'Video-Berechnungen';

  @override
  String get videoCommonParamsTitle => 'Gemeinsame Parameter';

  @override
  String videoCommonPillArea(Object value) {
    return 'Fläche: $value';
  }

  @override
  String videoCommonPillDistance(Object value) {
    return 'Distanz: $value';
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
    return 'Ratio: $value';
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
      'Richtwert-Berechnungen. Prüfe immer die Herstellerdokumentation.';

  @override
  String get videoDistanceHint => 'z. B.: 12.0';

  @override
  String get videoDistanceLabel => 'Projektionsdistanz (m)';

  @override
  String get videoErrImpossibleDenom => '❌ Unmögliche Parameter (denom ≤ 0).';

  @override
  String get videoErrOverlapRange =>
      '❌ Overlap% muss zwischen 0 und 99.9 liegen.';

  @override
  String get videoErrRatioGt0 => '❌ Das Ratio muss > 0 sein.';

  @override
  String get videoErrTotalWidthAndDistanceGt0 =>
      '❌ Gesamtbreite und Distanz müssen > 0 sein.';

  @override
  String get videoErrTotalWidthGt0 => '❌ Gesamtbreite muss > 0 sein.';

  @override
  String get videoErrWidthGt0 => '❌ Die Breite muss > 0 sein.';

  @override
  String get videoExportPdfTooltip => 'PDF exportieren';

  @override
  String get videoFormatLabel => 'Format (Ratio)';

  @override
  String get videoGainHint => 'z. B.: 1.0';

  @override
  String get videoGainLabel => 'Gain';

  @override
  String get videoImageWidthHint => 'z. B.: 6.0';

  @override
  String get videoImageWidthLabel => 'Bildbreite (m)';

  @override
  String get videoLedCalcTitle => 'Berechnung — Pixel / Tiles';

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
    return '✅ Wall-Auflösung: $wallWpx × $wallHpx px\n✅ Wall-Größe: $wallWm × $wallHm m\nTile: $tileWpx×$tileHpx px • $tileWcm×$tileHcm cm\nBerechneter Pitch: $pitch';
  }

  @override
  String get videoLedSubtitle =>
      'Pixel des LED-Walls nach Größe, Pitch und Tile-Abmessungen.';

  @override
  String get videoLedTileHcmHint => 'z. B.: 33.28';

  @override
  String get videoLedTileHcmLabel => 'Tile-Höhe (cm)';

  @override
  String get videoLedTileHpxHint => 'z. B.: 128';

  @override
  String get videoLedTileHpxLabel => 'Tile-Höhe (px)';

  @override
  String get videoLedTileWcmHint => 'z. B.: 33.28';

  @override
  String get videoLedTileWcmLabel => 'Tile-Breite (cm)';

  @override
  String get videoLedTileWpxHint => 'z. B.: 128';

  @override
  String get videoLedTileWpxLabel => 'Tile-Breite (px)';

  @override
  String get videoLedTilesXHint => 'z. B.: 15';

  @override
  String get videoLedTilesXLabel => 'Tiles horizontal (X)';

  @override
  String get videoLedTilesYHint => 'z. B.: 8';

  @override
  String get videoLedTilesYLabel => 'Tiles vertikal (Y)';

  @override
  String get videoLedTitle => 'LED';

  @override
  String get videoLensMeasureSubtitle =>
      'Ratio / Breite / Höhe (Berechnungen 1 bis 3).';

  @override
  String get videoLensMeasureTitle => 'Objektiv & Messung';

  @override
  String get videoLmCalc1Title => 'Berechnung 1 — Ratio (Distanz / Breite)';

  @override
  String get videoLmCalc2Title => 'Berechnung 2 — Breite (Distanz / Ratio)';

  @override
  String get videoLmCalc3Title => 'Berechnung 3 — Höhe (Breite + Format)';

  @override
  String get videoLmDistanceHint => 'z. B.: 12.0';

  @override
  String get videoLmDistanceLabel => 'Projektionsdistanz (m)';

  @override
  String get videoLmErrMissingDistanceRatio =>
      '❌ Fehlende Daten: Distanz + Ratio.';

  @override
  String get videoLmErrMissingDistanceWidth =>
      '❌ Fehlende Daten: Distanz + Breite.';

  @override
  String get videoLmErrMissingWidthOnly => '❌ Fehlender Wert: Breite.';

  @override
  String get videoLmErrRatioGt0 => '❌ Ratio muss > 0 sein.';

  @override
  String get videoLmErrWidthGt0 => '❌ Breite muss > 0 sein.';

  @override
  String get videoLmFormatLabel => 'Format (Ratio)';

  @override
  String get videoLmImageWidthHint => 'z. B.: 6.0';

  @override
  String get videoLmImageWidthLabel => 'Bildbreite (m)';

  @override
  String videoLmResultHeight(Object format, Object height) {
    return '✅ Höhe = $height m (Format $format)';
  }

  @override
  String videoLmResultRatio(Object ratio) {
    return '✅ Projektions-Ratio = $ratio';
  }

  @override
  String videoLmResultWidth(Object width) {
    return '✅ Bildbreite = $width m';
  }

  @override
  String get videoLmThrowRatioHint => 'z. B.: 1.60';

  @override
  String get videoLmThrowRatioLabel => 'Projektions-Ratio';

  @override
  String get videoLumensHint => 'z. B.: 20000';

  @override
  String get videoLumensLabel => 'Lumen (ANSI)';

  @override
  String get videoMireHeaderSubtitle =>
      'Richtwert-Testbilder (Ausrichten, Fokus, Geometrie, Blend, Pixel-perfect).';

  @override
  String get videoMireHeaderTitle => 'Testbild-Generator';

  @override
  String get videoMireScreenLedSubtitle =>
      'Testbild nach BxH px (pixel-perfect, Homogenität, Raster).';

  @override
  String get videoMireScreenLedTitle => 'Testbild LED-Screen';

  @override
  String get videoMireScreenVideoSubtitle =>
      'Einfach (BxH px) + Multi-Projektor-Mapping (N + Overlap).';

  @override
  String get videoMireScreenVideoTitle => 'Testbild Video-Screen';

  @override
  String get videoMireTitle => 'Testbild';

  @override
  String get videoMpCalc5Title => 'Berechnung 5 — Breite pro Projektor';

  @override
  String get videoMpCalc6Title =>
      'Berechnung 6 — Anzahl Projektoren (Ratio min/max)';

  @override
  String videoMpCaseOpenMin(Object coverage, Object n) {
    return 'Fall weitestes Ratio (min) = $n Projektoren | Abdeckung ≈ $coverage m';
  }

  @override
  String videoMpCaseTightMax(Object coverage, Object n) {
    return 'Fall engstes Ratio (max) = $n Projektoren | Abdeckung ≈ $coverage m';
  }

  @override
  String get videoMpDistanceHint => 'z. B.: 12.0';

  @override
  String get videoMpDistanceLabel => 'Projektionsdistanz (m)';

  @override
  String get videoMpErrImpossibleDenom => '❌ Unmögliche Parameter (denom ≤ 0).';

  @override
  String get videoMpErrInvalidRatio => '❌ Ungültiges Ratio (muss > 0 sein).';

  @override
  String get videoMpErrMissing5 =>
      '❌ Fehlende Daten: Gesamtbreite + Overlap% + N.';

  @override
  String get videoMpErrMissing6Main =>
      '❌ Fehlende Daten: Gesamtbreite + Distanz + Overlap%.';

  @override
  String get videoMpErrMissingRatios =>
      '❌ Fehlende Daten: Ratio min und/oder Ratio max.';

  @override
  String get videoMpErrNGte2 => '❌ N muss ≥ 2 sein.';

  @override
  String get videoMpErrOverlapRange =>
      '❌ Overlap% muss zwischen 0 und 99.9 liegen.';

  @override
  String get videoMpErrWidthDistanceGt0 =>
      '❌ Gesamtbreite und Distanz müssen > 0 sein.';

  @override
  String get videoMpErrWidthGt0 => '❌ Gesamtbreite muss > 0 sein.';

  @override
  String get videoMpFormatLabel => 'Format (Ratio)';

  @override
  String get videoMpGainHint => 'z. B.: 1.0';

  @override
  String get videoMpGainLabel => 'Gain';

  @override
  String get videoMpLumensPerProjectorHint => 'z. B.: 20000';

  @override
  String get videoMpLumensPerProjectorLabel => 'Lumen pro Projektor';

  @override
  String get videoMpLumiErrLumensGainGt0 =>
      'Helligkeit: ❌ Lumen/Projektor und Gain müssen > 0 sein.';

  @override
  String videoMpLumiEstimated(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Geschätzte Helligkeit (N=$n)\nFläche: $area m²\nEq-Lux: $lux\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoMpLumiOptionalHint =>
      'Helligkeit (optional): Lumen/Projektor + Gain eintragen, um zu schätzen.';

  @override
  String get videoMpNoteIndicative => 'Hinweis: Richtwert-Schätzung.';

  @override
  String get videoMpOptionalLuminanceTitle => 'Optional: Helligkeit';

  @override
  String get videoMpOverlapHint => 'z. B.: 10';

  @override
  String get videoMpOverlapLabel => 'Overlap (%)';

  @override
  String get videoMpProjectorCountHint => 'z. B.: 2';

  @override
  String get videoMpProjectorCountLabel => 'Anzahl Projektoren (N)';

  @override
  String get videoMpRatioMaxHint => 'z. B.: 1.80';

  @override
  String get videoMpRatioMaxLabel => 'Ratio max';

  @override
  String get videoMpRatioMinHint => 'z. B.: 1.20';

  @override
  String get videoMpRatioMinLabel => 'Ratio min';

  @override
  String get videoMpTotalWidthHint => 'z. B.: 18.0';

  @override
  String get videoMpTotalWidthLabel => 'Gesamt-Projektionsbreite (m)';

  @override
  String get videoMultiprojectorSubtitle =>
      'Overlap + Breite/Projektor + Anzahl Projektoren (Berechnungen 5 & 6).';

  @override
  String get videoMultiprojectorTitle => 'Multi-Projektor';

  @override
  String get videoOptionalBrightnessTitle => 'Optional: Helligkeit';

  @override
  String get videoOverlapHint => 'z. B.: 10';

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
  String get videoPdfCalc5N => 'N (Calc5)';

  @override
  String get videoPdfCalc6 => 'Berechnung 6';

  @override
  String get videoPdfCalc6Gain => 'Gain (Calc6)';

  @override
  String get videoPdfCalc6LumensPerProj => 'Lumen/Projektor (Calc6)';

  @override
  String get videoPdfCalc6RatioMax => 'Ratio max (Calc6)';

  @override
  String get videoPdfCalc6RatioMin => 'Ratio min (Calc6)';

  @override
  String get videoPdfDate => 'Datum';

  @override
  String get videoPdfDistance => 'Distanz (m)';

  @override
  String get videoPdfFormat => 'Format';

  @override
  String get videoPdfGain => 'Gain';

  @override
  String get videoPdfImageWidth => 'Bildbreite (m)';

  @override
  String get videoPdfLumens => 'Lumen';

  @override
  String get videoPdfOverlap => 'Overlap (%)';

  @override
  String get videoPdfParams => 'Parameter';

  @override
  String get videoPdfRatio => 'Ratio';

  @override
  String get videoPdfResults => 'Ergebnisse';

  @override
  String get videoPdfScreenPreset => 'Leinwand-Preset';

  @override
  String get videoPdfTitle => 'Mon App Technique – Video-Export';

  @override
  String get videoPdfTotalWidth => 'Gesamtbreite (m)';

  @override
  String get videoPresetFrontGrey => 'Front – graue Leinwand (Gain 0.8)';

  @override
  String get videoPresetFrontGreyShort => 'Front – graue Leinwand';

  @override
  String get videoPresetFrontHighGain =>
      'Front – High-Gain-Leinwand (Gain 1.3)';

  @override
  String get videoPresetFrontHighGainShort => 'Front – High-Gain-Leinwand';

  @override
  String get videoPresetFrontWhite => 'Front – matte weiße Leinwand (Gain 1.0)';

  @override
  String get videoPresetFrontWhiteShort => 'Front – matte weiße Leinwand';

  @override
  String get videoPresetMappingDarkStone =>
      'Mapping – dunkler Stein (Gain 0.35)';

  @override
  String get videoPresetMappingDarkStoneShort => 'Mapping – dunkler Stein';

  @override
  String get videoPresetMappingGlass => 'Mapping – Glas (Gain 0.15)';

  @override
  String get videoPresetMappingGlassShort => 'Mapping – Glas';

  @override
  String get videoPresetMappingLightStone =>
      'Mapping – heller Stein (Gain 0.6)';

  @override
  String get videoPresetMappingLightStoneShort => 'Mapping – heller Stein';

  @override
  String get videoPresetMappingMatte => 'Mapping – matte Farbe (Gain 0.75)';

  @override
  String get videoPresetMappingMatteShort => 'Mapping – matte Farbe';

  @override
  String get videoPresetMappingSatin =>
      'Mapping – seidenmatte Farbe (Gain 0.9)';

  @override
  String get videoPresetMappingSatinShort => 'Mapping – seidenmatte Farbe';

  @override
  String get videoPresetRearClear =>
      'Rückprojektion – klares Gewebe (Gain 0.9)';

  @override
  String get videoPresetRearClearShort => 'Rückprojektion – klares Gewebe';

  @override
  String get videoPresetRearDiffusion =>
      'Rückprojektion – Diffusionsgewebe (Gain 0.7)';

  @override
  String get videoPresetRearDiffusionShort =>
      'Rückprojektion – Diffusionsgewebe';

  @override
  String get videoScreenPresetLabel => 'Leinwand / Oberfläche (Preset)';

  @override
  String get videoSummaryPillsTitle => 'Zusammenfassung (Badges)';

  @override
  String get videoTestPatternSubtitle =>
      'Erstellung von Video-Testbildern für Screen und LED-Wall (später).';

  @override
  String get videoTestPatternTitle => 'Testbild';

  @override
  String get videoThrowRatioHint => 'z. B.: 1.60';

  @override
  String get videoThrowRatioLabel => 'Projektions-Ratio';

  @override
  String get videoTitle => 'Video';

  @override
  String get videoToolsTitle => 'Video-Tools';

  @override
  String get videoTotalWidthHint => 'z. B.: 18.0';

  @override
  String get videoTotalWidthLabel => 'Gesamt-Projektionsbreite (m)';

  @override
  String get aboutArtnetTitle => 'Art-Net';

  @override
  String get aboutArtnetToc01 => '1) Art-Net — c’est quoi et pourquoi';

  @override
  String get aboutArtnetToc02 => '2) Adressage & univers — mapping propre';

  @override
  String get aboutArtnetToc03 => '3) Limites & perf — ce qui casse en premier';

  @override
  String get aboutArtnetToc04 => '4) Nodes, splitters & RDM';

  @override
  String get aboutArtnetToc05 => '5) Dépannage — symptômes → causes';

  @override
  String get aboutArtnetToc06 => '6) Schémas (réseau / unicast vs broadcast)';

  @override
  String get aboutArtnetToc07 => '6bis) Images (assets) — RJ45/switch/câbles';

  @override
  String get aboutArtnetToc08 => '7) Checklist rapide';

  @override
  String get aboutDmxToc01 => '1) DMX, univers, adresses — la base';

  @override
  String get aboutDmxToc02 => '2) Trame DMX — break, start code, canaux';

  @override
  String get aboutDmxToc03 => '3) Câblage RS-485 — topologie & câble';

  @override
  String get aboutDmxToc04 =>
      '4) Terminaison & splitters — éviter les réflexions';

  @override
  String get aboutDmxToc05 => '4bis) RDM — limites & compatibilités';

  @override
  String get aboutDmxToc06 => '5) Dépannage terrain — symptômes → causes';

  @override
  String get aboutDmxToc07 => '6) Art-Net — repères terrain';

  @override
  String get aboutDmxToc08 => '7) sACN / E1.31 — multicast, IGMP, priorités';

  @override
  String get aboutDmxToc09 => '8) DMX vs Art-Net vs sACN — choisir';

  @override
  String get aboutDmxToc10 => '9) Schémas terrain (DMX / IP / pinout)';

  @override
  String get aboutDmxToc11 => '10) Checklist rapide';

  @override
  String get aboutElectriciteTitle => 'Électricité';

  @override
  String get aboutElectriciteToc01 => '1) Bases (W, A, V, kW)';

  @override
  String get aboutElectriciteToc02 =>
      '2) Connecteurs (Schuko / P17 / PowerCON)';

  @override
  String get aboutElectriciteToc03 => '3) Mono / Tri (ce que ça change)';

  @override
  String get aboutElectriciteToc04 => '4) Table rapide (16A → 400A)';

  @override
  String get aboutElectriciteToc05 => '5) Sécurité & pièges terrain';

  @override
  String get aboutElectriciteToc06 => '6) Checklist';

  @override
  String get aboutInformatiqueTitle => 'Informatique';

  @override
  String get aboutInformatiqueToc01 => '1) USB / USB-C / Thunderbolt';

  @override
  String get aboutInformatiqueToc02 => '2) Stockage (SATA / NVMe / SSD)';

  @override
  String get aboutInformatiqueToc03 => '3) Liaisons vidéo (DP / HDMI)';

  @override
  String get aboutInformatiqueToc04 => '4) PCIe / GPU (repères)';

  @override
  String get aboutInformatiqueToc05 => '5) Checklist (plateau)';

  @override
  String get aboutIpBasicsToc01 => '1) C’est quoi une IP et à quoi ça sert ?';

  @override
  String get aboutIpBasicsToc02 =>
      '2) Pourquoi 192.x / 10.x / 172.x ? (adresses privées)';

  @override
  String get aboutIpBasicsToc03 =>
      '3) Masque & sous-réseaux : comprendre pour de vrai';

  @override
  String get aboutIpBasicsToc04 => '4) DHCP, passerelle, DNS : qui fait quoi ?';

  @override
  String get aboutIpBasicsToc05 =>
      '5) Comment deux appareils se parlent (LAN vs hors LAN)';

  @override
  String get aboutIpBasicsToc06 =>
      '6) Plans IP “show” simples (exemples prêts à copier)';

  @override
  String get aboutIpBasicsToc07 =>
      '7) Dépannage : symptômes → causes (méthode terrain)';

  @override
  String get aboutIpBasicsToc08 =>
      '8) Mini-exercices (vérifier vite un masque / un réseau)';

  @override
  String get aboutIpBasicsToc09 => '9) Checklist rapide';

  @override
  String get aboutNetworkTitle => 'Network (EN)';

  @override
  String get aboutNetworkToc01 => '1) Objectif: réseau stable';

  @override
  String get aboutNetworkToc02 => '2) Plan IP (simple)';

  @override
  String get aboutNetworkToc03 => '3) VLAN (séparation)';

  @override
  String get aboutNetworkToc04 => '4) IGMP (sACN multicast)';

  @override
  String get aboutNetworkToc05 => '5) Wi-Fi vs filaire';

  @override
  String get aboutNetworkToc06 => '6) Switch: ce qu’il faut';

  @override
  String get aboutNetworkToc07 => '7) Schémas';

  @override
  String get aboutNetworkToc08 => '7bis) Images (assets)';

  @override
  String get aboutNetworkToc09 => '8) Checklist';

  @override
  String get aboutReseauTitle => 'Réseau';

  @override
  String get aboutReseauToc01 => '1) Bases réseau (LAN / IP / débit)';

  @override
  String get aboutReseauToc02 => '2) RJ45 & catégories (Cat5e/6/6A/…)';

  @override
  String get aboutReseauToc03 => '3) PoE (alimentation réseau)';

  @override
  String get aboutReseauToc04 => '4) Fibre (SM/MM) + connecteurs (LC/SC)';

  @override
  String get aboutReseauToc05 => '5) SFP / SFP+ / QSFP (modules)';

  @override
  String get aboutReseauToc06 => '6) Switches (VLAN / IGMP / QoS)';

  @override
  String get aboutReseauToc07 => '7) Art-Net / sACN sur réseau (conseils)';

  @override
  String get aboutReseauToc08 => '8) Checklist';

  @override
  String get aboutSacnToc01 => '1) À quoi sert sACN ?';

  @override
  String get aboutSacnToc02 => '2) Univers (numérotation)';

  @override
  String get aboutSacnToc03 => '3) Multicast / Unicast + IGMP';

  @override
  String get aboutSacnToc04 => '4) Priorités (multi-sources)';

  @override
  String get aboutSacnToc05 => '5) Limites / perfs';

  @override
  String get aboutSacnToc06 => '6) RDM & sACN (proxy / selon matériel)';

  @override
  String get aboutSacnToc07 => '7) Schémas';

  @override
  String get aboutSacnToc08 => '7bis) Images (assets)';

  @override
  String get aboutSacnToc09 => '8) Checklist';

  @override
  String get aboutVideoToc01 => '1) Bases vidéo (mots-clés)';

  @override
  String get aboutVideoToc02 => '2) Résolution & FPS';

  @override
  String get aboutVideoToc03 => '3) Couleur (4:4:4 / 4:2:2 / 10-bit)';

  @override
  String get aboutVideoToc04 => '4) Sync (Genlock / Timecode)';

  @override
  String get aboutVideoToc05 => '5) Câbles & distances';

  @override
  String get aboutVideoToc06 => '6) SDI (3G / 6G / 12G)';

  @override
  String get aboutVideoToc07 => '7) HDMI — terrain';

  @override
  String get aboutVideoToc08 => '8) NDI — quand / pourquoi / limites';

  @override
  String get aboutVideoToc09 => '9) Mapping / LED / multi-projo';

  @override
  String get aboutVideoToc10 => '10) Checklist terrain';

  @override
  String get aboutTileDmxTitle => 'DMX — fonctionnement (simple & complet)';

  @override
  String get aboutTileArtnetTitle =>
      'Art-Net — DMX sur IP (nodes, unicast/broadcast)';

  @override
  String get aboutTileSacnTitle => 'sACN / E1.31 — multicast, IGMP, priorités';

  @override
  String get aboutTileIpBasicsTitle =>
      'Réseau — bases IP / masque / DHCP (essentiel)';

  @override
  String get aboutTileReseauTitle =>
      'Réseau — RJ45 / Fibre / débits & longueurs';

  @override
  String get aboutTileNetworkTitle =>
      'Réseau lumière — VLAN, IGMP, Wi-Fi vs filaire';

  @override
  String get aboutTileVideoTitle => 'Vidéo — SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutTileElectriciteTitle =>
      'Électrique — Schuko / P17 / puissances';

  @override
  String get aboutTileElectriciteSubtitle =>
      'Connecteurs, mono/tri, tableaux kW rapides (16A→400A), pièges terrain.';

  @override
  String get aboutTileInformatiqueTitle =>
      'Informatique — USB / HDMI / DP / SATA / NVMe…';

  @override
  String get aboutTileInformatiqueSubtitle =>
      'Débits utiles, versions, limites réelles, pièges marketing.';

  @override
  String get aboutTitle => 'À propos';
}
