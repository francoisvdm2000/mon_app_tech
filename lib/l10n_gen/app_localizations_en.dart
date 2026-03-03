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
      'Network — IP basics / subnet / DHCP (essentials)';

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
  String get aboutSacnTitle => 'sACN / E1.31 — multicast, IGMP, priorities';

  @override
  String get aboutVideoSubtitle =>
      'Choose based on latency, reliability, cabling, LAN vs WAN.\\nTables + diagram.';

  @override
  String get aboutVideoTitle => 'Video — SDI / NDI / IP (SRT/RTMP)';

  @override
  String get appTitle => 'Mon App Tech';

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
  String get commonCalculate => 'Calculer';

  @override
  String get commonCancel => 'Annuler';

  @override
  String get commonCopyResultTooltip => 'Copier le résultat';

  @override
  String get commonDash => '—';

  @override
  String get commonNone => 'Aucun enregistrement';

  @override
  String get commonOk => 'OK';

  @override
  String get commonOkWithCheck => 'OK ✅';

  @override
  String get commonRename => 'Renommer';

  @override
  String get commonReset => 'Reset';

  @override
  String get commonSave => 'Enregistrer';

  @override
  String get commonSearch => 'Rechercher';

  @override
  String get commonTooLowWithCross => 'Trop faible ❌';

  @override
  String get commonUnitMeter => 'm';

  @override
  String get consentsReset => 'Consentements réinitialisés.';

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
  String get disclaimerAccept => 'J\'accepte';

  @override
  String get disclaimerCertify =>
      'Je certifie avoir lu et accepté ces conditions.';

  @override
  String get disclaimerText =>
      'UTILISATION À TITRE INDICATIF UNIQUEMENT\n\nLes calculs fournis par cette application (vidéo, lumière, laser) sont donnés à titre informatif et indicatif.\nIls ne remplacent en aucun cas :\n- des calculs certifiés,\n- des études techniques,\n- les normes officielles en vigueur,\n- ni la validation par un professionnel qualifié.\n\nRESPONSABILITÉ\nL’éditeur de cette application ne peut être tenu responsable d’erreurs de calcul, d’omissions, de dommages matériels,\nd’accidents corporels, ou de tout incident survenant lors de l’installation, de l’exploitation ou de l’utilisation des équipements.\n\nVIDÉO & PROJECTION\nLes résultats (tailles, ratios, luminosité, overlaps, etc.) reposent sur des modèles théoriques et peuvent varier selon :\noptique, zoom, uniformité, environnement lumineux, support, réglages, etc.\nToujours vérifier avec les documentations constructeur officielles.\n\nLUMIÈRE\nLes calculs sont indicatifs et ne tienent pas compte de toutes les conditions réelles (tolérances, pertes optiques,\ndégradation des sources, normes locales, conditions ambiantes…).\n\nLASER – SÉCURITÉ\nLes calculs NOHD, SZED et CZED sont basés sur des hypothèses standards et des seuils théoriques.\nIls ne prennent pas en compte notamment :\n- instruments optiques (jumelles, caméras, télescopes…),\n- conditions atmosphériques (brouillard, pluie, poussière…),\n- réflexions imprévues, usages détournés, réglages spécifiques.\nL’utilisation d’un système laser implique une responsabilité directe de l’opérateur et une analyse de risques adaptée.\n\nACCEPTATION DES RISQUES\nEn utilisant cette application, l’utilisateur reconnaît :\n- avoir pris connaissance des règles de sécurité applicables,\n- être seul responsable de ses installations,\n- assumer l’entière responsabilité des risques liés à l’utilisation des équipements (vidéo, lumière, laser),\n- vérifier systématiquement les données avec les manuels constructeurs officiels.';

  @override
  String get disclaimerTitle => '⚠️ AVERTISSEMENT LÉGAL & NON-RESPONSABILITÉ';

  @override
  String get homeLaserSubtitle =>
      'Calculs et sécurité laser (consentement requis à chaque entrée).';

  @override
  String get homeLaserTitle => 'Laser';

  @override
  String get homeLightSubtitle =>
      'Taille de projection, dip-switch DMX, photométrie, catalogue, patch DMX.';

  @override
  String get homeLightTitle => 'Lumière';

  @override
  String get homeReferencesSubtitle =>
      'DMX / réseau / vidéo : fiches & repères terrain.';

  @override
  String get homeReferencesTitle => 'Références';

  @override
  String get homeTitle => 'Accueil';

  @override
  String get homeVideoSubtitle =>
      'Lentille & mesure, luminosité, multiprojecteur, LED et mires.';

  @override
  String get homeVideoTitle => 'Vidéo';

  @override
  String get language => 'Langue';

  @override
  String get languageSystem => 'Système (automatique)';

  @override
  String get languageSystemCurrent => 'Langue du téléphone';

  @override
  String get laserAdviceFullPower => 'Pleine puissance autorisée (100 %)';

  @override
  String laserAdviceMaxRecommended(Object percent) {
    return 'Puissance maximale conseillée : $percent';
  }

  @override
  String get laserConsentCheckboxLabel =>
      'J’accepte et je comprends les risques.';

  @override
  String get laserConsentContinue => 'Continuer';

  @override
  String get laserConsentText =>
      'ACCÈS À LA PARTIE LASER\n\nLa partie LASER de cette application concerne des calculs de sécurité (ex : NOHD, SZED, CZED).\nCes calculs sont indicatifs et ne remplacent pas :\n- une analyse de risques,\n- les normes en vigueur,\n- les procédures d’exploitation,\n- ni la validation par une personne qualifiée.\n\nIMPORTANT\n- Risque de lésions oculaires / cutanées en cas de mauvaise utilisation.\n- Le calcul peut être faux si les paramètres entrés sont incomplets, erronés ou si le contexte réel diffère (optique,\n  conditions atmosphériques, réflexions, alignement, etc.).\n- L’opérateur est seul responsable de l’installation, de l’exploitation et de la conformité.\n\nEn validant, vous confirmez :\n- comprendre les risques,\n- respecter les règles de sécurité applicables,\n- assumer l’entière responsabilité en cas de négligence ou mauvaise utilisation.';

  @override
  String get laserConsentTitle => '🔴 CONSENTEMENT LASER (OBLIGATOIRE)';

  @override
  String get laserDiameterHint => 'ex: 3.0';

  @override
  String get laserDiameterLabel => 'Diamètre de sortie (mm)';

  @override
  String get laserDisclaimerShort =>
      'Calcul indicatif. Ne remplace pas une analyse de sécurité laser.';

  @override
  String get laserDivergenceHint => 'ex: 1.2';

  @override
  String get laserDivergenceLabel => 'Divergence (mrad)';

  @override
  String get laserInputsTitle => 'Entrées';

  @override
  String get laserInvalidInputs =>
      'Veuillez entrer une puissance, une divergence et un diamètre valides.';

  @override
  String get laserNameUpdated => 'Nom mis à jour.';

  @override
  String get laserNormativeParamsBody =>
      'MPE pour la distance nominale de danger oculaire (NOHD) : 25,4 W/m²\n(Norme IEC 60825-1, édition 3.0)\n\nMPE pour la distance d’exposition de la zone sensible (SZED) : 1 W/m²\n(Norme ANSI Z136.6)\n\nMPE pour la distance d’exposition de la zone critique (CZED) : 0,05 W/m²\n(Norme ANSI Z136.6)';

  @override
  String get laserNormativeParamsTitle => 'Paramètres de sécurité retenus';

  @override
  String get laserPowerHint => 'ex: 5000';

  @override
  String get laserPowerLabel => 'Puissance (mW)';

  @override
  String get laserPresetAdded => 'Enregistrement ajouté.';

  @override
  String get laserPresetDeleted => 'Enregistrement supprimé.';

  @override
  String laserPresetSubtitle(Object diam, Object div, Object p) {
    return 'P: $p mW • Div: $div mrad • Ø: $diam mm';
  }

  @override
  String get laserProjectorNameLabel => 'Nom du projecteur';

  @override
  String get laserRenameProjectorTitle => 'Renommer le projecteur';

  @override
  String get laserSafetyResultsTitle => 'Résultats de sécurité';

  @override
  String get laserSaveCurrentProjector => 'Enregistrer ce projecteur';

  @override
  String get laserSaveProjectorTitle => 'Enregistrer un projecteur';

  @override
  String get laserSavedProjectorsTitle => 'Projecteurs enregistrés';

  @override
  String get laserSearchHint => 'ex: “RGB 5W”';

  @override
  String get laserTargetDistanceHint => 'ex: 10';

  @override
  String get laserTargetDistanceLabel => 'Distance cible (m)';

  @override
  String get laserZoneCzedDesc => 'Zone critique';

  @override
  String get laserZoneNohdDesc => 'Danger oculaire';

  @override
  String get laserZoneSzedDesc => 'Zone sensible';

  @override
  String get legalNotices => 'Mentions légales';

  @override
  String get lightCatalogDescription =>
      'Sélection par constructeur, type et produit, avec informations et manuel.';

  @override
  String get lightCatalogTitle => 'Catalogue';

  @override
  String get lightDisclaimerShort =>
      'Outils indicatifs. Vérifie toujours la documentation constructeur.';

  @override
  String get lightDmxSwitchDescription =>
      'Conversion indicative entre adresse DMX et interrupteurs, avec navigation par intervalle.';

  @override
  String get lightDmxSwitchTitle => 'Dip-switch DMX';

  @override
  String get lightPatchDescription => 'Importer et visualiser un fichier MVR.';

  @override
  String get lightPatchTitle => 'Patch DMX';

  @override
  String get lightPhotometryDescription =>
      'Conversions indicatives entre lux, candela et lumen, avec distance et angle.';

  @override
  String get lightPhotometryTitle => 'Photométrie';

  @override
  String get lightProjectionDescription =>
      'Calcul indicatif de la taille de tache selon l’angle, la distance et le diamètre.';

  @override
  String get lightProjectionTitle => 'Taille de projection';

  @override
  String get menuTitle => 'Menu';

  @override
  String get mireBlendLabel => 'BLEND';

  @override
  String get mireDash => '—';

  @override
  String get mireErrInvalidOverlap => '❌ Overlap invalide (0 à 99.9).';

  @override
  String get mireErrInvalidProjectors =>
      '❌ Nombre de projecteurs invalide (N > 0).';

  @override
  String get mireErrInvalidWHpx => '❌ Largeur/hauteur invalides (px).';

  @override
  String get mireExportPng => 'Exporter PNG';

  @override
  String get mireHeightPxHint => 'ex: 1080';

  @override
  String get mireHeightPxHintMapping => 'ex: 2160';

  @override
  String get mireHeightPxLabel => 'Hauteur (px)';

  @override
  String get mireLedErrTileCm => '❌ Renseigne Tile cm (largeur/hauteur >0).';

  @override
  String get mireLedErrTilePx => '❌ Renseigne Tile px (largeur/hauteur >0).';

  @override
  String get mireLedErrTilesXY => '❌ Renseigne Tiles X/Y (>0).';

  @override
  String get mireLedParamsTitle => 'Paramètres mur LED';

  @override
  String mireLedPitchComputed(Object pitch) {
    return 'Pitch calculé: $pitch';
  }

  @override
  String get mireLedSubtitleColorBars => 'Barres + rampes + cercles';

  @override
  String get mireLedSubtitleGridLabels => 'Grille + repères + cercles';

  @override
  String get mireLedSubtitlePixelPerfect => 'Pixel perfect + cercles';

  @override
  String get mireLedSubtitleUniformity => 'Uniformité + cercles';

  @override
  String get mireLedTileHcmLabel => 'Tile hauteur (cm)';

  @override
  String get mireLedTileHpxLabel => 'Tile hauteur (px)';

  @override
  String get mireLedTileWcmLabel => 'Tile largeur (cm)';

  @override
  String get mireLedTileWpxLabel => 'Tile largeur (px)';

  @override
  String get mireLedTilesIdTitle => 'LED / ID TILES';

  @override
  String get mireLedTilesXLabel => 'Tiles horizontales (X)';

  @override
  String get mireLedTilesYLabel => 'Tiles verticales (Y)';

  @override
  String get mireLedTitle => 'LED / MIRE';

  @override
  String get mireLedTypeColorBars => 'Barres + rampes + cercles';

  @override
  String get mireLedTypeGridLabels => 'Grille + repères + cercles';

  @override
  String get mireLedTypePixelPerfect => 'Pixel perfect + cercles';

  @override
  String get mireLedTypeTilesId => 'Tiles ID (numéro + couleurs)';

  @override
  String get mireLedTypeUniformity => 'Uniformité + cercles';

  @override
  String mireLedWallResolution(Object h, Object w) {
    return 'Résolution mur: $w × $h px';
  }

  @override
  String get mireLedWarnPitchOutOfRange =>
      '⚠️ Pitch calculé hors plage (0.5–20 mm). Vérifie Tile cm / px.';

  @override
  String get mireLedWarnPitchXNotY =>
      '⚠️ Pitch X ≠ Pitch Y (tile non homogène). Vérifie dimensions cm et px.';

  @override
  String get mireMappingSectionTitle => 'Mire mapping multi-projecteur';

  @override
  String mireMappingSubtitlePattern(Object n, Object orient, Object percent) {
    return 'N=$n • Overlap $percent% • $orient';
  }

  @override
  String get mireMappingTypeBlendRamps => 'Blend ramps';

  @override
  String get mireMappingTypeCombo => 'Combo (zones + overlap + blend)';

  @override
  String get mireMappingTypeLabel => 'Type mapping';

  @override
  String get mireMappingTypeZonesOverlap => 'Zones + overlap';

  @override
  String get mireOrientationHorizontal => 'Horizontal';

  @override
  String get mireOrientationLabel => 'Orientation';

  @override
  String get mireOrientationVertical => 'Vertical';

  @override
  String get mireOverlapHint => 'ex: 10.0';

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
    return 'PROJO $index';
  }

  @override
  String get mireProjectorsNHint => 'ex: 2';

  @override
  String get mireProjectorsNLabel => 'Nombre de projecteurs (N)';

  @override
  String get mireSimpleSectionTitle => 'Mire écran simple';

  @override
  String get mireSimpleSubtitleCheckerboard => 'Damier + cercles';

  @override
  String get mireSimpleSubtitleColorBars => 'Barres + rampes + cercles';

  @override
  String get mireSimpleSubtitleComboAll =>
      'Grille + safe + 2 barres centrées + cercles';

  @override
  String get mireSimpleSubtitleGridSafe => 'Grille + safe + cercles';

  @override
  String get mireSimpleSubtitleUniformity => 'Uniformité + cercles';

  @override
  String get mireSimpleTypeCheckerboard => 'Damier + cercles';

  @override
  String get mireSimpleTypeColorBars => 'Barres + rampes + cercles';

  @override
  String get mireSimpleTypeComboAll =>
      'Combo (grille + cercles + 2 barres centrées)';

  @override
  String get mireSimpleTypeGridSafe => 'Grille + safe + cercles';

  @override
  String get mireSimpleTypeUniformity => 'Uniformité + cercles';

  @override
  String get mireTileMissingPx => 'Renseigne Tile (px) pour numérotation.';

  @override
  String mireTilesSubtitleBase(Object nx, Object ny, Object th, Object tw) {
    return 'Tile ${tw}x$th px • Grille $nx x $ny';
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
    return 'Mur ~ $wm×$hm m';
  }

  @override
  String get mireTypeLabel => 'Type de mire';

  @override
  String get mireVideoComboTitle => 'VIDÉO / MIRE COMBO';

  @override
  String get mireVideoMappingSectionTitle => 'Mire mapping multi-projecteur';

  @override
  String get mireVideoMappingTitle => 'VIDÉO / MIRE MAPPING';

  @override
  String get mireVideoSimpleSectionTitle => 'Mire écran simple';

  @override
  String get mireVideoSimpleTitle => 'VIDÉO / MIRE SIMPLE';

  @override
  String get mireVideoTypeCheckerboard => 'Damier + cercles';

  @override
  String get mireVideoTypeColorBars => 'Barres + rampes + cercles';

  @override
  String get mireVideoTypeCombo =>
      'Combo (grille + cercles + 2 barres centrées)';

  @override
  String get mireVideoTypeGridSafe => 'Grille + safe + cercles';

  @override
  String get mireVideoTypeUniformity => 'Uniformité + cercles';

  @override
  String get mireWallNotMultipleOfTiles => 'MUR NON MULTIPLE DE TILES';

  @override
  String get mireWidthPxHint => 'ex: 1920';

  @override
  String get mireWidthPxHintMapping => 'ex: 3840';

  @override
  String get mireWidthPxLabel => 'Largeur (px)';

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
  String get photometrySection1Title => 'Lux <> Candela';

  @override
  String get photometrySection2Title => 'Lumens <> Candela';

  @override
  String get photometrySection3Title => 'Lumens < Lux';

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
  String get resetConsents => 'Réinitialiser consentements';

  @override
  String get settings => 'Paramètres';

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
    return 'Format: $format\nSurface: $area m²\nLux (lm/m²): $lux\nLux eq (gain): $luxEq\nLuminance: $nits nits | $fl ft-L\nSeuil mini ($presetLabel): $minFl ft-L → $status\nNote: estimation indicative (Lambert).';
  }

  @override
  String get videoBrightnessSectionTitle =>
      'Calcul 4 — Lux / nits / ft-L + seuil';

  @override
  String get videoBrightnessSubtitle => 'Lux / nits / ft-L + seuil (calcul 4).';

  @override
  String get videoBrightnessTitle => 'Luminosité';

  @override
  String get videoCalc1ErrMissing =>
      '❌ Données manquantes: Distance + Largeur.';

  @override
  String videoCalc1Ok(Object ratio) {
    return '✅ Ratio de projection = $ratio';
  }

  @override
  String get videoCalc1Title => 'Calcul 1 — Ratio (Distance / Largeur)';

  @override
  String get videoCalc2ErrMissing => '❌ Données manquantes: Distance + Ratio.';

  @override
  String videoCalc2Ok(Object width) {
    return '✅ Largeur image = $width m';
  }

  @override
  String get videoCalc2Title => 'Calcul 2 — Largeur (Distance / Ratio)';

  @override
  String get videoCalc3ErrMissingWidth => '❌ Donnée manquante: Largeur.';

  @override
  String videoCalc3Ok(Object format, Object height) {
    return '✅ Hauteur = $height m (format $format)';
  }

  @override
  String get videoCalc3Title => 'Calcul 3 — Hauteur (Largeur + Format)';

  @override
  String get videoCalc4ErrGt0 => '❌ Lumens/Gain/Largeur doivent être > 0.';

  @override
  String get videoCalc4ErrMissing =>
      '❌ Données manquantes: Lumens + Gain + Largeur.';

  @override
  String get videoCalc4ErrMissingSimple =>
      '❌ Données manquantes : Largeur + Lumens + Gain.';

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
    return 'Surface: $area m² (format $format)\nLux (lm/m²): $lux\nLux eq (gain): $luxEq\nLuminance: $nits nits | $fl ft-L\nSeuil mini ($presetLabel): $minFl ft-L → $status\nNote: conversion nits/ft-L basée sur une hypothèse Lambertienne (approx).';
  }

  @override
  String get videoCalc4Title =>
      'Calcul 4 — Luminosité (lux / nits / ft-L + seuil)';

  @override
  String get videoCalc5ErrMissing =>
      '❌ Données manquantes: Largeur totale + Overlap% + Nombre de projecteurs.';

  @override
  String get videoCalc5ErrNMin2 => '❌ Le nombre de projecteurs doit être ≥ 2.';

  @override
  String get videoCalc5NHint => 'ex: 2';

  @override
  String get videoCalc5NLabel => 'Nombre de projecteurs (N)';

  @override
  String videoCalc5Result(Object format, Object hTot, Object n, Object overlapM,
      Object overlapPct, Object wPer, Object wTot) {
    return 'Largeur totale: $wTot m\nN: $n | Overlap: $overlapPct% (sur largeur projo)\n\n- Largeur par projecteur: $wPer m\n- Overlap entre 2 projos: $overlapM m\n- Hauteur totale (format $format): $hTot m';
  }

  @override
  String get videoCalc5Title => 'Calcul 5 — Overlap (Largeur totale + N)';

  @override
  String get videoCalc6ErrMissingBasics =>
      '❌ Données manquantes: Largeur totale + Distance + Overlap%.';

  @override
  String get videoCalc6ErrMissingRatio =>
      '❌ Données manquantes: Ratio min et/ou Ratio max.';

  @override
  String get videoCalc6GainHint => 'ex: 1.0';

  @override
  String get videoCalc6GainLabel => 'Gain (calc 6)';

  @override
  String get videoCalc6LumensPerProjectorHint => 'ex: 20000';

  @override
  String get videoCalc6LumensPerProjectorLabel => 'Lumens par projecteur';

  @override
  String get videoCalc6LumiErrGt0 =>
      'Luminosité: ❌ Lumens/projo et gain doivent être > 0.';

  @override
  String videoCalc6LumiForN(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Luminosité estimée (N=$n)\nSurface: $area m²\nLux eq: $lux (lm/m²)\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoCalc6LumiOptional =>
      'Luminosité (optionnelle): renseigne Lumens/projo + Gain pour l\'estimation.';

  @override
  String get videoCalc6NoteIndicative =>
      'Note: estimation indicative (blend/overlap réels peuvent réduire un peu).';

  @override
  String get videoCalc6RatioMaxHint => 'ex: 1.80';

  @override
  String get videoCalc6RatioMaxLabel => 'Ratio max';

  @override
  String get videoCalc6RatioMinHint => 'ex: 1.20';

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
    return 'Largeur totale=$wTot m | Distance=$distance m | Overlap=$overlapPct%\nFormat $format → Hauteur totale=$hTot m | Surface=$area m²\nRatio min/max: $ratioMin → $ratioMax\n\nCas ratio plus ouvert (min) = $nMin projos | couverture ≈ $covMin m\n$lumiMin\n\nCas ratio plus serré (max) = $nMax projos | couverture ≈ $covMax m\n$lumiMax\n\n$note';
  }

  @override
  String get videoCalc6Title => 'Calcul 6 — Nb projecteurs auto + luminosité';

  @override
  String videoCalcLabel(Object n) {
    return 'Calcul $n';
  }

  @override
  String get videoCalculateAll => 'Calculer tout';

  @override
  String get videoCalculationsTitle => 'Calculs vidéo';

  @override
  String get videoCommonParamsTitle => 'Paramètres communs';

  @override
  String videoCommonPillArea(Object value) {
    return 'Surface: $value';
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
    return 'Hauteur: $value';
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
    return 'Largeur totale: $value';
  }

  @override
  String videoCommonPillWidth(Object value) {
    return 'Largeur: $value';
  }

  @override
  String get videoCopyAllTooltip => 'Copier tous les résultats';

  @override
  String get videoCopySummaryTooltip => 'Copier le résumé';

  @override
  String get videoDisclaimerShort =>
      'Calculs indicatifs. Vérifie toujours la documentation constructeur.';

  @override
  String get videoDistanceHint => 'ex: 12.0';

  @override
  String get videoDistanceLabel => 'Distance de projection (m)';

  @override
  String get videoErrImpossibleDenom => '❌ Paramètres impossibles (denom ≤ 0).';

  @override
  String get videoErrOverlapRange => '❌ Overlap% doit être entre 0 et 99.9.';

  @override
  String get videoErrRatioGt0 => '❌ Le ratio doit être > 0.';

  @override
  String get videoErrTotalWidthAndDistanceGt0 =>
      '❌ Largeur totale et distance doivent être > 0.';

  @override
  String get videoErrTotalWidthGt0 => '❌ Largeur totale doit être > 0.';

  @override
  String get videoErrWidthGt0 => '❌ La largeur doit être > 0.';

  @override
  String get videoExportPdfTooltip => 'Exporter PDF';

  @override
  String get videoFormatLabel => 'Format (ratio)';

  @override
  String get videoGainHint => 'ex: 1.0';

  @override
  String get videoGainLabel => 'Gain';

  @override
  String get videoImageWidthHint => 'ex: 6.0';

  @override
  String get videoImageWidthLabel => 'Largeur d\'image (m)';

  @override
  String get videoLedCalcTitle => 'Calcul — Pixels / tiles';

  @override
  String get videoLedErrAllGt0 => '❌ Toutes les valeurs doivent être > 0.';

  @override
  String get videoLedErrMissingInputs =>
      '❌ Données manquantes : Tiles X/Y + Tile px + Tile cm.';

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
    return '✅ Résolution mur: $wallWpx × $wallHpx px\n✅ Taille mur: $wallWm × $wallHm m\nTile: $tileWpx×$tileHpx px • $tileWcm×$tileHcm cm\nPitch calculé: $pitch';
  }

  @override
  String get videoLedSubtitle =>
      'Pixels du mur LED selon taille, pitch, dimension des tiles.';

  @override
  String get videoLedTileHcmHint => 'ex: 33.28';

  @override
  String get videoLedTileHcmLabel => 'Tile hauteur (cm)';

  @override
  String get videoLedTileHpxHint => 'ex: 128';

  @override
  String get videoLedTileHpxLabel => 'Tile hauteur (px)';

  @override
  String get videoLedTileWcmHint => 'ex: 33.28';

  @override
  String get videoLedTileWcmLabel => 'Tile largeur (cm)';

  @override
  String get videoLedTileWpxHint => 'ex: 128';

  @override
  String get videoLedTileWpxLabel => 'Tile largeur (px)';

  @override
  String get videoLedTilesXHint => 'ex: 15';

  @override
  String get videoLedTilesXLabel => 'Tiles horizontales (X)';

  @override
  String get videoLedTilesYHint => 'ex: 8';

  @override
  String get videoLedTilesYLabel => 'Tiles verticales (Y)';

  @override
  String get videoLedTitle => 'LED';

  @override
  String get videoLensMeasureSubtitle =>
      'Ratio / largeur / hauteur (calculs 1 à 3).';

  @override
  String get videoLensMeasureTitle => 'Lentille & mesure';

  @override
  String get videoLmCalc1Title => 'Calcul 1 — Ratio (Distance / Largeur)';

  @override
  String get videoLmCalc2Title => 'Calcul 2 — Largeur (Distance / Ratio)';

  @override
  String get videoLmCalc3Title => 'Calcul 3 — Hauteur (Largeur + Format)';

  @override
  String get videoLmDistanceHint => 'ex: 12.0';

  @override
  String get videoLmDistanceLabel => 'Distance de projection (m)';

  @override
  String get videoLmErrMissingDistanceRatio =>
      '❌ Données manquantes : Distance + Ratio.';

  @override
  String get videoLmErrMissingDistanceWidth =>
      '❌ Données manquantes : Distance + Largeur.';

  @override
  String get videoLmErrMissingWidthOnly => '❌ Donnée manquante : Largeur.';

  @override
  String get videoLmErrRatioGt0 => '❌ Ratio doit être > 0.';

  @override
  String get videoLmErrWidthGt0 => '❌ Largeur doit être > 0.';

  @override
  String get videoLmFormatLabel => 'Format (ratio)';

  @override
  String get videoLmImageWidthHint => 'ex: 6.0';

  @override
  String get videoLmImageWidthLabel => 'Largeur d\'image (m)';

  @override
  String videoLmResultHeight(Object format, Object height) {
    return '✅ Hauteur = $height m (format $format)';
  }

  @override
  String videoLmResultRatio(Object ratio) {
    return '✅ Ratio de projection = $ratio';
  }

  @override
  String videoLmResultWidth(Object width) {
    return '✅ Largeur image = $width m';
  }

  @override
  String get videoLmThrowRatioHint => 'ex: 1.60';

  @override
  String get videoLmThrowRatioLabel => 'Ratio de projection';

  @override
  String get videoLumensHint => 'ex: 20000';

  @override
  String get videoLumensLabel => 'Lumens (ANSI)';

  @override
  String get videoMireHeaderSubtitle =>
      'Mires indicatives (calage, focus, géométrie, blend, pixel perfect).';

  @override
  String get videoMireHeaderTitle => 'Générateur de mires';

  @override
  String get videoMireScreenLedSubtitle =>
      'Mire selon WxH px (pixel perfect, uniformité, grille).';

  @override
  String get videoMireScreenLedTitle => 'Mire écran LED';

  @override
  String get videoMireScreenVideoSubtitle =>
      'Simple (WxH px) + Mapping multi-projos (N + overlap).';

  @override
  String get videoMireScreenVideoTitle => 'Mire écran vidéo';

  @override
  String get videoMireTitle => 'Mire';

  @override
  String get videoMpCalc5Title => 'Calcul 5 — Largeur par projecteur';

  @override
  String get videoMpCalc6Title =>
      'Calcul 6 — Nombre de projecteurs (ratio min/max)';

  @override
  String videoMpCaseOpenMin(Object coverage, Object n) {
    return 'Cas ratio plus ouvert (min) = $n projos | couverture ≈ $coverage m';
  }

  @override
  String videoMpCaseTightMax(Object coverage, Object n) {
    return 'Cas ratio plus serré (max) = $n projos | couverture ≈ $coverage m';
  }

  @override
  String get videoMpDistanceHint => 'ex: 12.0';

  @override
  String get videoMpDistanceLabel => 'Distance de projection (m)';

  @override
  String get videoMpErrImpossibleDenom =>
      '❌ Paramètres impossibles (denom ≤ 0).';

  @override
  String get videoMpErrInvalidRatio => '❌ Ratio invalide (doit être > 0).';

  @override
  String get videoMpErrMissing5 =>
      '❌ Données manquantes : Largeur totale + Overlap% + N.';

  @override
  String get videoMpErrMissing6Main =>
      '❌ Données manquantes : Largeur totale + Distance + Overlap%.';

  @override
  String get videoMpErrMissingRatios =>
      '❌ Données manquantes : Ratio min et/ou Ratio max.';

  @override
  String get videoMpErrNGte2 => '❌ N doit être ≥ 2.';

  @override
  String get videoMpErrOverlapRange => '❌ Overlap% doit être entre 0 et 99.9.';

  @override
  String get videoMpErrWidthDistanceGt0 =>
      '❌ Largeur totale et distance doivent être > 0.';

  @override
  String get videoMpErrWidthGt0 => '❌ Largeur totale doit être > 0.';

  @override
  String get videoMpFormatLabel => 'Format (ratio)';

  @override
  String get videoMpGainHint => 'ex: 1.0';

  @override
  String get videoMpGainLabel => 'Gain';

  @override
  String get videoMpLumensPerProjectorHint => 'ex: 20000';

  @override
  String get videoMpLumensPerProjectorLabel => 'Lumens par projecteur';

  @override
  String get videoMpLumiErrLumensGainGt0 =>
      'Luminosité: ❌ Lumens/projo et gain doivent être > 0.';

  @override
  String videoMpLumiEstimated(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Luminosité estimée (N=$n)\nSurface: $area m²\nLux eq: $lux\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoMpLumiOptionalHint =>
      'Luminosité (optionnelle) : renseigne Lumens/projo + Gain pour estimer.';

  @override
  String get videoMpNoteIndicative => 'Note: estimation indicative.';

  @override
  String get videoMpOptionalLuminanceTitle => 'Optionnel : luminosité';

  @override
  String get videoMpOverlapHint => 'ex: 10';

  @override
  String get videoMpOverlapLabel => 'Overlap (%)';

  @override
  String get videoMpProjectorCountHint => 'ex: 2';

  @override
  String get videoMpProjectorCountLabel => 'Nombre de projecteurs (N)';

  @override
  String get videoMpRatioMaxHint => 'ex: 1.80';

  @override
  String get videoMpRatioMaxLabel => 'Ratio max';

  @override
  String get videoMpRatioMinHint => 'ex: 1.20';

  @override
  String get videoMpRatioMinLabel => 'Ratio min';

  @override
  String get videoMpTotalWidthHint => 'ex: 18.0';

  @override
  String get videoMpTotalWidthLabel => 'Largeur totale de projection (m)';

  @override
  String get videoMultiprojectorSubtitle =>
      'Overlap + largeur/projo + nombre de projos (calculs 5 & 6).';

  @override
  String get videoMultiprojectorTitle => 'Multiprojecteur';

  @override
  String get videoOptionalBrightnessTitle => 'Optionnel : luminosité';

  @override
  String get videoOverlapHint => 'ex: 10';

  @override
  String get videoOverlapLabel => 'Overlap (%)';

  @override
  String get videoPdfCalc1 => 'Calcul 1';

  @override
  String get videoPdfCalc2 => 'Calcul 2';

  @override
  String get videoPdfCalc3 => 'Calcul 3';

  @override
  String get videoPdfCalc4 => 'Calcul 4';

  @override
  String get videoPdfCalc5 => 'Calcul 5';

  @override
  String get videoPdfCalc5N => 'N (calc5)';

  @override
  String get videoPdfCalc6 => 'Calcul 6';

  @override
  String get videoPdfCalc6Gain => 'Gain (calc6)';

  @override
  String get videoPdfCalc6LumensPerProj => 'Lumens/projo (calc6)';

  @override
  String get videoPdfCalc6RatioMax => 'Ratio max (calc6)';

  @override
  String get videoPdfCalc6RatioMin => 'Ratio min (calc6)';

  @override
  String get videoPdfDate => 'Date';

  @override
  String get videoPdfDistance => 'Distance (m)';

  @override
  String get videoPdfFormat => 'Format';

  @override
  String get videoPdfGain => 'Gain';

  @override
  String get videoPdfImageWidth => 'Largeur image (m)';

  @override
  String get videoPdfLumens => 'Lumens';

  @override
  String get videoPdfOverlap => 'Overlap (%)';

  @override
  String get videoPdfParams => 'Paramètres';

  @override
  String get videoPdfRatio => 'Ratio';

  @override
  String get videoPdfResults => 'Résultats';

  @override
  String get videoPdfScreenPreset => 'Preset écran';

  @override
  String get videoPdfTitle => 'Mon App Technique – Export Vidéo';

  @override
  String get videoPdfTotalWidth => 'Largeur totale (m)';

  @override
  String get videoPresetFrontGrey => 'Front - écran gris (gain 0.8)';

  @override
  String get videoPresetFrontGreyShort => 'Front - écran gris';

  @override
  String get videoPresetFrontHighGain => 'Front - écran high gain (gain 1.3)';

  @override
  String get videoPresetFrontHighGainShort => 'Front - écran high gain';

  @override
  String get videoPresetFrontWhite => 'Front - écran blanc mat (gain 1.0)';

  @override
  String get videoPresetFrontWhiteShort => 'Front - écran blanc mat';

  @override
  String get videoPresetMappingDarkStone =>
      'Mapping - pierre sombre (gain 0.35)';

  @override
  String get videoPresetMappingDarkStoneShort => 'Mapping - pierre sombre';

  @override
  String get videoPresetMappingGlass => 'Mapping - vitre (gain 0.15)';

  @override
  String get videoPresetMappingGlassShort => 'Mapping - vitre';

  @override
  String get videoPresetMappingLightStone =>
      'Mapping - pierre claire (gain 0.6)';

  @override
  String get videoPresetMappingLightStoneShort => 'Mapping - pierre claire';

  @override
  String get videoPresetMappingMatte => 'Mapping - peinture mate (gain 0.75)';

  @override
  String get videoPresetMappingMatteShort => 'Mapping - peinture mate';

  @override
  String get videoPresetMappingSatin => 'Mapping - peinture satinée (gain 0.9)';

  @override
  String get videoPresetMappingSatinShort => 'Mapping - peinture satinée';

  @override
  String get videoPresetRearClear => 'Rétro - toile claire (gain 0.9)';

  @override
  String get videoPresetRearClearShort => 'Rétro - toile claire';

  @override
  String get videoPresetRearDiffusion => 'Rétro - toile diffusion (gain 0.7)';

  @override
  String get videoPresetRearDiffusionShort => 'Rétro - toile diffusion';

  @override
  String get videoScreenPresetLabel => 'Écran / Support (preset)';

  @override
  String get videoSummaryPillsTitle => 'Résumé (pastilles)';

  @override
  String get videoTestPatternSubtitle =>
      'Création de mire vidéo pour écran et mur LED (à faire après).';

  @override
  String get videoTestPatternTitle => 'Mire';

  @override
  String get videoThrowRatioHint => 'ex: 1.60';

  @override
  String get videoThrowRatioLabel => 'Ratio de projection';

  @override
  String get videoTitle => 'Vidéo';

  @override
  String get videoToolsTitle => 'Outils vidéo';

  @override
  String get videoTotalWidthHint => 'ex: 18.0';

  @override
  String get videoTotalWidthLabel => 'Largeur totale de projection (m)';

  @override
  String get aboutArtnetTitle => 'Art-Nand';

  @override
  String get aboutArtnetToc01 => '1) Art-Nand — c’est quoi and porrquoi';

  @override
  String get aboutArtnetToc02 => '2) Addressing & universe — mapping propre';

  @override
  String get aboutArtnetToc03 => '3) Limites & perf — ce qui casse en premier';

  @override
  String get aboutArtnetToc04 => '4) Nodes, splitters & RDM';

  @override
  String get aboutArtnetToc05 => '5) Trorbleshooting — symptoms → causes';

  @override
  String get aboutArtnetToc06 => '6) Schémas (nandwork / unicast vs broadcast)';

  @override
  String get aboutArtnetToc07 => '6bis) Images (assands) — RJ45/switch/cables';

  @override
  String get aboutArtnetToc08 => '7) Checklist rapide';

  @override
  String get aboutDmxToc01 => '1) DMX, universe, addresses — la base';

  @override
  String get aboutDmxToc02 => '2) Trame DMX — break, start code, canaux';

  @override
  String get aboutDmxToc03 => '3) Câblage RS-485 — topologie & cable';

  @override
  String get aboutDmxToc04 =>
      '4) Terminaison & splitters — éviter les réflexions';

  @override
  String get aboutDmxToc05 => '4bis) RDM — limites & compatibilités';

  @override
  String get aboutDmxToc06 => '5) Trorbleshooting terrain — symptoms → causes';

  @override
  String get aboutDmxToc07 => '6) Art-Nand — repères terrain';

  @override
  String get aboutDmxToc08 => '7) sACN / E1.31 — multicast, IGMP, priorités';

  @override
  String get aboutDmxToc09 => '8) DMX vs Art-Nand vs sACN — choisir';

  @override
  String get aboutDmxToc10 => '9) Schémas terrain (DMX / IP / pinort)';

  @override
  String get aboutDmxToc11 => '10) Checklist rapide';

  @override
  String get aboutElectriciteTitle => 'Electricity';

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
  String get aboutInformatiqueTitle => 'IT basics';

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
  String get aboutIpBasicsToc01 => '1) C’est quoi une IP and à quoi ça sert ?';

  @override
  String get aboutIpBasicsToc02 =>
      '2) Why 192.x / 10.x / 172.x ? (addresses privées)';

  @override
  String get aboutIpBasicsToc03 =>
      '3) Subnand mask & sors-nandworkx: comprendre porr de vrai';

  @override
  String get aboutIpBasicsToc04 => '4) DHCP, passerelle, DNS: qui fait quoi ?';

  @override
  String get aboutIpBasicsToc05 =>
      '5) How deux appareils se parlent (LAN vs hors LAN)';

  @override
  String get aboutIpBasicsToc06 =>
      '6) Plans IP “show” simples (exemples prêts à copier)';

  @override
  String get aboutIpBasicsToc07 =>
      '7) Trorbleshooting: symptoms → causes (méthode terrain)';

  @override
  String get aboutIpBasicsToc08 =>
      '8) Mini-exercices (vérifier vite un masque / un nandwork)';

  @override
  String get aboutIpBasicsToc09 => '9) Checklist rapide';

  @override
  String get aboutNetworkTitle => 'Nandwork (EN)';

  @override
  String get aboutNetworkToc01 => '1) Objectif: nandwork stable';

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
  String get aboutNetworkToc08 => '7bis) Images (assands)';

  @override
  String get aboutNetworkToc09 => '8) Checklist';

  @override
  String get aboutReseauTitle => 'Nandwork';

  @override
  String get aboutReseauToc01 => '1) Bases nandwork (LAN / IP / débit)';

  @override
  String get aboutReseauToc02 => '2) RJ45 & catégories (Cat5e/6/6A/…)';

  @override
  String get aboutReseauToc03 => '3) PoE (alimentation nandwork)';

  @override
  String get aboutReseauToc04 => '4) Fibre (SM/MM) + connectors (LC/SC)';

  @override
  String get aboutReseauToc05 => '5) SFP / SFP+ / QSFP (modules)';

  @override
  String get aboutReseauToc06 => '6) Switches (VLAN / IGMP / QoS)';

  @override
  String get aboutReseauToc07 => '7) Art-Nand / sACN sur nandwork (conseils)';

  @override
  String get aboutReseauToc08 => '8) Checklist';

  @override
  String get aboutSacnToc01 => '1) À quoi sert sACN ?';

  @override
  String get aboutSacnToc02 => '2) Universe (numérotation)';

  @override
  String get aboutSacnToc03 => '3) Multicast / Unicast + IGMP';

  @override
  String get aboutSacnToc04 => '4) Priorités (multi-sorrces)';

  @override
  String get aboutSacnToc05 => '5) Limites / perfs';

  @override
  String get aboutSacnToc06 => '6) RDM & sACN (proxy / selon matériel)';

  @override
  String get aboutSacnToc07 => '7) Schémas';

  @override
  String get aboutSacnToc08 => '7bis) Images (assands)';

  @override
  String get aboutSacnToc09 => '8) Checklist';

  @override
  String get aboutVideoToc01 => '1) Bases vidéo (mots-clés)';

  @override
  String get aboutVideoToc02 => '2) Resolution & FPS';

  @override
  String get aboutVideoToc03 => '3) Corleur (4:4:4 / 4:2:2 / 10-bit)';

  @override
  String get aboutVideoToc04 => '4) Sync (Genlock / Timecode)';

  @override
  String get aboutVideoToc05 => '5) Câbles & distances';

  @override
  String get aboutVideoToc06 => '6) SDI (3G / 6G / 12G)';

  @override
  String get aboutVideoToc07 => '7) HDMI — terrain';

  @override
  String get aboutVideoToc08 => '8) NDI — quand / porrquoi / limites';

  @override
  String get aboutVideoToc09 => '9) Mapping / LED / multi-projo';

  @override
  String get aboutVideoToc10 => '10) Checklist terrain';

  @override
  String get aboutTileDmxTitle => 'DMX — fonctionnement (simple & compland)';

  @override
  String get aboutTileArtnetTitle =>
      'Art-Nand — DMX sur IP (nodes, unicast/broadcast)';

  @override
  String get aboutTileSacnTitle => 'sACN / E1.31 — multicast, IGMP, priorités';

  @override
  String get aboutTileIpBasicsTitle =>
      'Nandwork — bases IP / masque / DHCP (essentiel)';

  @override
  String get aboutTileReseauTitle =>
      'Nandwork — RJ45 / Fibre / débits & longueurs';

  @override
  String get aboutTileNetworkTitle =>
      'Nandwork lumière — VLAN, IGMP, Wi-Fi vs filaire';

  @override
  String get aboutTileVideoTitle => 'Video — SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutTileElectriciteTitle =>
      'Électrique — Schuko / P17 / puissances';

  @override
  String get aboutTileElectriciteSubtitle =>
      'Connecteurs, mono/tri, tableaux kW rapides (16A→400A), pièges terrain.';

  @override
  String get aboutTileInformatiqueTitle =>
      'IT basics — USB / HDMI / DP / SATA / NVMe…';

  @override
  String get aboutTileInformatiqueSubtitle =>
      'Débits utiles, versions, limites réelles, pièges markanding.';

  @override
  String get aboutTitle => 'Abort';

  @override
  String get homeRiggingTitle => 'Rigging';

  @override
  String get homeRiggingSubtitle => 'Bridles : angles & longueurs d’élingues.';

  @override
  String get riggingTitle => 'Rigging';

  @override
  String get riggingAngleLengthTitle => 'Angle de bridle & longueur d’élingues';

  @override
  String get riggingSymmetryNote =>
      'Hypothèse : bridle symétrique (2 brins identiques). Aucun calcul de charge.';

  @override
  String get riggingInputsTitle => 'Inputs';

  @override
  String get riggingSpanLabel => 'Span';

  @override
  String get riggingSpanHint => 'Ex : 2.40';

  @override
  String get riggingDropLabel => 'Drop';

  @override
  String get riggingDropHint => 'Ex : 0.60';

  @override
  String get riggingUnitMeters => 'm';

  @override
  String get riggingResultsTitle => 'Results';

  @override
  String get riggingNeedPositiveValues => 'Positive values required.';

  @override
  String get riggingLegLengthLabel => 'Longueur d’un brin';

  @override
  String get riggingAngleToHorizontalLabel =>
      'Angle par rapport à l’horizontale';

  @override
  String get riggingAngleToVerticalLabel => 'Angle par rapport à la verticale';

  @override
  String get riggingDisclaimerShort =>
      'Résultats indicatifs. À valider selon ton contexte et les pratiques rigging.';

  @override
  String get riggingCalcLegDropTitle => 'Longueur + flèche → portée';

  @override
  String get riggingCalcLegDropHelp =>
      'Élingue symétrique (2 brins) : calcule la portée à partir de la longueur d’élingue et de la flèche.';

  @override
  String get riggingLegLengthInputLabel => 'Longueur d’un brin';

  @override
  String get riggingLegLengthInputHint => 'Ex: 2.50';

  @override
  String get riggingInvalidTriangle =>
      'Impossible : la longueur doit être supérieure à la flèche.';

  @override
  String get riggingCalcLegAngleTitle => 'Longueur + angle → portée + flèche';

  @override
  String get riggingCalcLegAngleHelp =>
      'Élingue symétrique (2 brins) : calcule portée et flèche à partir de la longueur et de l’angle par rapport à l’horizontale.';

  @override
  String get riggingAngleHorizontalInputLabel =>
      'Angle par rapport à l’horizontale';

  @override
  String get riggingAngleHorizontalInputHint => 'Ex: 30';

  @override
  String get riggingInvalidAngle => 'Angle invalide : entre 0° et 90° (exclu).';

  @override
  String get riggingUnitDegrees => '°';

  @override
  String get riggingCalc1Title => 'Calculation 1';

  @override
  String get riggingCalc1Subtitle =>
      'Bridle symétrique (2 brins identiques). Poids affiché (info). Aucun calcul de charge.';

  @override
  String get riggingCalc2Title => 'Calculation 2';

  @override
  String get riggingCalc2Subtitle => 'Variant with offset.';

  @override
  String get riggingCalc3Title => 'Calculation 3';

  @override
  String get riggingCalc3Subtitle => 'Variant with 2 pick points.';

  @override
  String get riggingLegLengthHint => 'Ex: 4.70';

  @override
  String get riggingAngleHint => 'Ex : 45';

  @override
  String get riggingInvalidGeometry =>
      'Géométrie impossible (longueur trop courte pour l’entraxe).';

  @override
  String get riggingSchemaTitle => 'Diagram';

  @override
  String get riggingSchemaCaption1 =>
      'Entrées : portée + flèche. Sorties : longueur d’élingue + angles.';

  @override
  String get riggingSchemaCaption2 =>
      'Entrées : portée + longueur d’élingue. Sorties : flèche + angles.';

  @override
  String get riggingSchemaCaption3 =>
      'Entrées : portée + angle (horizontal). Sorties : flèche + longueur.';

  @override
  String get riggingAngleHInputLabel => 'Angle (par rapport à l’horizontale)';

  @override
  String get riggingAngleHInputHint => 'Ex: 45';

  @override
  String get riggingDropResultLabel => 'Flèche (drop)';

  @override
  String get riggingSchemaLabelSpan => 'Entraxe';

  @override
  String get riggingSchemaLabelDrop => 'Flèche';

  @override
  String get riggingSchemaLabelLeg => 'Brin';

  @override
  String get riggingWeightLabel => 'Load';

  @override
  String get riggingUnitKg => 'kg';

  @override
  String get riggingImpossibleGeometry => 'Impossible geometry.';

  @override
  String get riggingDisclaimerNoLoad =>
      'Warning: do not use for structural sizing.';

  @override
  String get riggingCalcCommonSubtitle =>
      'Simple estimate – verify on the plan.';

  @override
  String get riggingOffCenterToggle => 'Off-center load';

  @override
  String get riggingOffsetLabel => 'Offset';

  @override
  String get riggingInvalidOffset => 'Invalid offset.';

  @override
  String get riggingLegLeftLabel => 'Left leg';

  @override
  String get riggingLegRightLabel => 'Right leg';

  @override
  String get riggingAngleHLeftLabel => 'Left H angle';

  @override
  String get riggingAngleHRightLabel => 'Right H angle';

  @override
  String get riggingAngleVLeftLabel => 'Left V angle';

  @override
  String get riggingAngleVRightLabel => 'Right V angle';

  @override
  String get riggingIncludedAngleLabel => 'Included angle';

  @override
  String get riggingAngleHLeftInputLabel => 'Left H angle';

  @override
  String get riggingLegLeftInputLabel => 'Left leg';

  @override
  String get riggingNeedValidValues => 'Entrer des valeurs positives valides.';

  @override
  String get photometrySection4Title => 'Area & lumens';

  @override
  String get photometryAreaLabel => 'Area';

  @override
  String get photometryAreaHint4 => 'e.g., 12.5';

  @override
  String photometrySummary4(Object lumens, Object lux, Object area) {
    return '≈ $lumens lm for $lux lx over $area m²';
  }

  @override
  String get aboutArtnetTocConversionTitle => 'Conversions';

  @override
  String get aboutArtnetConversionIntro =>
      'Useful conversion tools around DMX universes, Art-Net and hexadecimal values.';

  @override
  String get aboutUniverseToArtnetTitle => 'Universe → Art-Net';

  @override
  String get aboutUniverseToArtnetSubtitle =>
      'Find Subnet + Universe (Net/Port-Address) from a DMX universe.';

  @override
  String get aboutUniverseToHexTitle => 'Universe → Hex';

  @override
  String get aboutUniverseToHexSubtitle =>
      'Convert a universe (1…N) to index and hexadecimal value.';

  @override
  String get aboutArtnetConversionNote =>
      'Note: Art-Net conventions can vary between consoles (addressing, 0/1 base). Always check your system documentation.';

  @override
  String get elecTocCopyText => 'Copy table of contents';

  @override
  String get elecToc1 => 'Section 1';

  @override
  String get elecToc2 => 'Section 2';

  @override
  String get elecToc3 => 'Section 3';

  @override
  String get elecToc4 => 'Section 4';

  @override
  String get elecToc5 => 'Section 5';

  @override
  String get elecToc6 => 'Section 6';

  @override
  String get elecToc7 => 'Section 7';

  @override
  String get elecKvaTitle => 'kVA → kW table (by power factor)';

  @override
  String get elecKvaFormula => 'Formula: kW = kVA × PF';

  @override
  String get elecKvaIntro =>
      'This table provides a quick estimate of active power (kW) from apparent power (kVA).';

  @override
  String get elecKvaNote =>
      'Indicative values. Use real PF values when you have them.';

  @override
  String get elecKvaColKva => 'kVA';

  @override
  String get elecKvaColPf08 => 'kW (PF = 0.8)';

  @override
  String get elecKvaColPf10 => 'kW (PF = 1.0)';

  @override
  String get commonTocTitle => 'Contents';

  @override
  String get commonCopySummaryTooltip => 'Copy contents';

  @override
  String get aboutLightReferenceTitle => 'Lighting reference';

  @override
  String get refCriTitle => 'CRI';

  @override
  String get refKelvinTitle => 'Color temperature (K)';

  @override
  String get refBeamFieldTitle => 'Beam / Field';

  @override
  String get refLuxTitle => 'Illuminance levels (lux)';

  @override
  String get refCriContent =>
      'CRI measures color rendering fidelity. The higher, the more natural colors look.';

  @override
  String get refKelvinContent =>
      'Color temperature describes the tint of white (warm to cool).';

  @override
  String get refBeamFieldContent =>
      'Beam is the main cone angle; Field is the wider angle where intensity falls off (edge).';

  @override
  String get refBeamLegendBeam => 'Beam';

  @override
  String get refBeamLegendField => 'Field';

  @override
  String get refLuxIntro => 'Indicative illuminance references by use case.';

  @override
  String get refLuxColUse => 'Use';

  @override
  String get refLuxColLux => 'Lux';

  @override
  String get refLuxUseCorridor => 'Corridor / circulation';

  @override
  String get refLuxUseBackstage => 'Backstage / technical';

  @override
  String get refLuxUseMeeting => 'Meeting room';

  @override
  String get refLuxUseExpo => 'Exhibition / showroom';

  @override
  String get refLuxUseStageGeneral => 'Stage – general';

  @override
  String get refLuxUseStageTv => 'Stage – TV / broadcast';

  @override
  String get refLuxNote =>
      'Values vary with standards and constraints (camera, contrast, ambience).';

  @override
  String get refLightDisclaimerShort =>
      'Indicative references – not a standard.';

  @override
  String get refCri90 => 'Excellent (≥ 90)';

  @override
  String get refCri80 => 'Good (≈ 80)';

  @override
  String get refCriLow => 'Low (< 80)';

  @override
  String get aboutUniverseToArtnetImportantTitle => 'Important';

  @override
  String get aboutUniverseToArtnetImportantBody =>
      'Some consoles use a 0-based scheme (Universe 0..15) while others are 1-based (Universe 1..16).';

  @override
  String get aboutUniverseToArtnetTableTitle => 'Universe → Art-Net table';

  @override
  String get aboutUniverseToArtnetTableIntro =>
      'Typical mapping between DMX universes and Art-Net addressing.';

  @override
  String get aboutUniverseTablesDisclaimer =>
      'Always verify your console/node convention.';

  @override
  String get aboutUniverseToArtnetColDmx => 'DMX universe';

  @override
  String get aboutUniverseToArtnetColUniHex => 'Uni (hex)';

  @override
  String aboutUniverseToArtnetSubnetTitle(
      Object p0, Object p1, Object p2, Object p3) {
    return 'Subnet $p0 $p1 $p2 $p3';
  }

  @override
  String get aboutUniverseToHexPrincipleTitle => 'Principle';

  @override
  String get aboutUniverseToHexPrincipleBody =>
      'A universe (1…N) can be converted to a 0-based index then to hexadecimal.';

  @override
  String get aboutUniverseToHexTableTitle => 'Universe → Hex table';

  @override
  String get aboutUniverseToHexTableIntro =>
      'Conversion table DMX universe → index / hex.';

  @override
  String aboutUniverseToHexBlockTitle(Object p0, Object p1) {
    return 'Block $p0 $p1';
  }

  @override
  String get aboutUniverseToHexColDmx => 'DMX universe';

  @override
  String get aboutUniverseToHexColIndex => 'Index';

  @override
  String get aboutUniverseToHexColHex => 'Hex';

  @override
  String get aboutUniverseToHexNote => 'Index = Universe − 1 (0-based).';

  @override
  String get videoCameraExposureTitle => 'Camera exposure';

  @override
  String get videoCameraExposureSubtitle =>
      'Lux → EV, ISO, shutter and aperture.';

  @override
  String get videoCamPageTitle => 'Camera exposure';

  @override
  String get videoCamInfoTitle => 'Info';

  @override
  String get videoCamIntro =>
      'Indicative calculations linking lux, ISO, shutter and aperture.';

  @override
  String get videoCamInputsTitle => 'Inputs';

  @override
  String get videoCamLuxLabel => 'Lux';

  @override
  String get videoCamLuxHint => 'e.g., 500';

  @override
  String get videoCamIsoLabel => 'ISO';

  @override
  String get videoCamIsoHint => 'e.g., 800';

  @override
  String get videoCamShutterLabel => 'Shutter (s)';

  @override
  String get videoCamShutterHint => 'e.g., 1/50';

  @override
  String get videoCamApertureLabel => 'Aperture (f/)';

  @override
  String get videoCamApertureHint => 'e.g., 2.8';

  @override
  String get videoCamEvEmpty => '—';

  @override
  String get videoCamNote =>
      'Indicative values: calibration depends on sensor, scene and standards.';

  @override
  String videoCamEvValue(Object ev) {
    return 'EV $ev';
  }

  @override
  String videoCamApertureResult(Object aperture) {
    return 'Aperture: f/$aperture';
  }

  @override
  String videoCamShutterResult(Object shutter) {
    return 'Shutter: $shutter s';
  }

  @override
  String get aboutDmxS2Title => '2) DMX frame — break, start code, channels';

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
      'A DMX frame is sent in a continuous loop. It starts with a “break” (line held low), then a start code, then up to 512 values (0–255). Each device reads only the channels it needs (based on its address and mode).';

  @override
  String get aboutDmxS2HowToReadTitle => 'Reading a frame (simple view)';

  @override
  String get aboutDmxS2HowToReadB1 =>
      'Break + MAB: marks the start of the frame (re-sync).';

  @override
  String get aboutDmxS2HowToReadB2 =>
      'Start code: most of the time 0x00 (lighting data).';

  @override
  String get aboutDmxS2HowToReadB3 =>
      'Slots 1→512: each slot = 1 channel (0–255).';

  @override
  String get aboutDmxS2HowToReadB4 =>
      'The frame repeats continuously: new values overwrite old ones.';

  @override
  String get aboutDmxS2PracticalTitle => 'In practice';

  @override
  String get aboutDmxS2PracticalB1 =>
      'A 16-bit mode uses 2 channels for one function (e.g., Pan coarse + Pan fine).';

  @override
  String get aboutDmxS2PracticalB2 =>
      'The more universes you send, the higher the overall load (console/nodes/network).';

  @override
  String get aboutDmxS2PracticalB3 =>
      'If you see flicker, check cabling/termination/topology first before blaming the console.';

  @override
  String get aboutDmxS3Title => '3) DMX wiring — RS-485, topology, pinout';

  @override
  String get aboutDmxS3PillRs485 => 'RS-485';

  @override
  String get aboutDmxS3PillDaisyChain => 'Daisy-chain';

  @override
  String get aboutDmxS3PillNoY => 'No Y-split';

  @override
  String get aboutDmxS3Pill120ohm => '120 Ω';

  @override
  String get aboutDmxS3Intro =>
      'DMX512 is based on RS-485: a differential bus that needs clean lines. Golden rule: a daisy-chain from source to fixtures, and a terminator at the end.';

  @override
  String get aboutDmxS3TopologyTitle => 'Recommended topology';

  @override
  String get aboutDmxS3TopologyB1 =>
      'Source → Fixture 1 → Fixture 2 → … → last fixture.';

  @override
  String get aboutDmxS3TopologyB2 =>
      'Avoid Y-splits: they create reflections (instability).';

  @override
  String get aboutDmxS3TopologyB3 =>
      'If you need branches: use an opto-isolated DMX splitter.';

  @override
  String get aboutDmxS3PinoutTitle => 'Connector reminder';

  @override
  String get aboutDmxS3CablesTitle => 'Cables: what actually works';

  @override
  String get aboutDmxS3CablesB1 =>
      'Use proper DMX cable (~120 Ω), not random mic cable (except short emergency).';

  @override
  String get aboutDmxS3CablesB2 =>
      'Keep lengths reasonable and avoid tight coils near power/dimmers.';

  @override
  String get aboutDmxS3CablesB3 =>
      'Bad cable can “work” until it doesn’t (humidity, length, load).';

  @override
  String get aboutDmxS4Title => '4) Termination & splitters — bus stability';

  @override
  String get aboutDmxS4Intro =>
      'On an RS-485 bus, termination prevents reflections at the end of the line. Splitters (opto-isolated) create clean branches and protect the source.';

  @override
  String get aboutDmxS4TerminatorTitle => 'Termination (120 Ω): when and how';

  @override
  String get aboutDmxS4TerminatorB1 =>
      'Add a terminator on the last device (or an XLR terminator plug).';

  @override
  String get aboutDmxS4TerminatorB2 =>
      'One terminator per line (not everywhere).';

  @override
  String get aboutDmxS4TerminatorB3 =>
      'Important on long runs, heavy loads, electrically noisy environments.';

  @override
  String get aboutDmxS4SplittersTitle => 'Splitters / opto-isolation';

  @override
  String get aboutDmxS4SplittersB1 =>
      'Lets you build 2/4/8 branches without Y-splits.';

  @override
  String get aboutDmxS4SplittersB2 =>
      'Electrical isolation reduces ground loops and protects console/node.';

  @override
  String get aboutDmxS4SplittersB3 =>
      'Useful to re-drive the signal over long distances.';

  @override
  String get aboutDmxS5Title =>
      '5) Troubleshooting — a simple method (fast and reliable)';

  @override
  String get aboutDmxS5Intro =>
      'When a fixture does not respond, isolate the problem: address, mode, DMX line, or the fixture itself. Run a short checklist before rebuilding the patch.';

  @override
  String get aboutDmxS5QuickChecksTitle => 'Quick checklist';

  @override
  String get aboutDmxS5QuickB1 =>
      'Correct DMX address? (and not 001 vs 000 depending on display).';

  @override
  String get aboutDmxS5QuickB2 => 'Correct DMX mode (channel count)?';

  @override
  String get aboutDmxS5QuickB3 =>
      'Correct universe/output (console, node, port)?';

  @override
  String get aboutDmxS5QuickB4 =>
      'Test with a known-good cable, replacing one element at a time.';

  @override
  String get aboutDmxS5QuickB5 =>
      'Add/remove termination at the end of the line and observe the change.';

  @override
  String get aboutDmxS5IfFlickerTitle => 'If it flickers / drops out';

  @override
  String get aboutDmxS5IfFlickerB1 =>
      'Look for a hidden Y-split, wrong splitter, or a dodgy XLR adaptor.';

  @override
  String get aboutDmxS5IfFlickerB2 =>
      'Keep DMX away from power/dimmers and avoid huge cable loops.';

  @override
  String get aboutDmxS5IfFlickerB3 =>
      'Reduce complexity: 1 universe, 1 line, 1 fixture, then rebuild.';

  @override
  String get aboutDmxS5GoldenRuleTitle => 'Golden rule';

  @override
  String get aboutDmxS5GoldenRuleBody =>
      'You should be able to run a single fixture on a single line. If this base test fails, the issue is not “the full patch”: it’s addressing, cabling, or hardware.';

  @override
  String get aboutDmxS6Title =>
      '6) Art-Net — DMX over IP (vocabulary and traps)';

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
      'Art-Net carries DMX universes over Ethernet (UDP). A console/software sends universes on the network, and a node converts them to physical DMX outputs.';

  @override
  String get aboutDmxS6BasicsTitle => 'Key points';

  @override
  String get aboutDmxS6BasicsB1 => 'A node = network ↔ DMX (multiple ports).';

  @override
  String get aboutDmxS6BasicsB2 =>
      'Broadcast sends to everyone (easy but can saturate).';

  @override
  String get aboutDmxS6BasicsB3 =>
      'Unicast sends only to a target node (often more stable on big rigs).';

  @override
  String get aboutDmxS6BasicsB4 =>
      'Watch universe indexing: Art-Net is often 0-based (DMX Universe 1 = Art-Net 0).';

  @override
  String get aboutDmxS6WhenTitle => 'When to choose Art-Net?';

  @override
  String get aboutDmxS6WhenB1 =>
      'Small/medium rigs, quick setups, lots of compatible gear.';

  @override
  String get aboutDmxS6WhenB2 =>
      'Great if the network is clean (proper switch/cables, no Wi-Fi).';

  @override
  String get aboutDmxS6WhenB3 =>
      'If it saturates: move to unicast and segment the network (VLAN / dedicated LAN).';

  @override
  String get aboutDmxS7Title =>
      '7) sACN (E1.31) — multicast, priorities, clean networking';

  @override
  String get aboutDmxS7PillE131 => 'E1.31';

  @override
  String get aboutDmxS7PillMulticast => 'Multicast';

  @override
  String get aboutDmxS7PillPriority => 'Priority';

  @override
  String get aboutDmxS7PillIgmp => 'IGMP';

  @override
  String get aboutDmxS7Intro =>
      'sACN (ANSI E1.31) is a modern standard to carry DMX universes over IP. It is widely used in large systems thanks to multicast and priority handling.';

  @override
  String get aboutDmxS7KeyIdeasTitle => 'Key ideas';

  @override
  String get aboutDmxS7KeyIdeasB1 =>
      'Multicast: each universe is a network “group” (nodes subscribe).';

  @override
  String get aboutDmxS7KeyIdeasB2 =>
      'IGMP snooping on switches becomes essential at scale (otherwise you flood the LAN).';

  @override
  String get aboutDmxS7KeyIdeasB3 =>
      'Priority: multiple sources can exist; the highest priority wins.';

  @override
  String get aboutDmxS7KeyIdeasB4 =>
      'Just like Art-Net: clean network + decent switches/cables = stability.';

  @override
  String get aboutDmxS8Title =>
      '8) DMX vs Art-Net vs sACN — summary (what to pick?)';

  @override
  String get aboutDmxS8Intro =>
      'All three ultimately control channels. The difference is distribution (DMX cable vs network), scale, and robustness.';

  @override
  String get aboutDmxS8QuickTableTitle => '4-line summary';

  @override
  String get aboutDmxS8QuickB1 =>
      'DMX: simple, robust, 1 cable = 1 line (512 channels).';

  @override
  String get aboutDmxS8QuickB2 =>
      'Art-Net: very common, easy to deploy, watch broadcast.';

  @override
  String get aboutDmxS8QuickB3 =>
      'sACN: more “large-system friendly”, multicast + priorities, requires a well configured network.';

  @override
  String get aboutDmxS8QuickB4 =>
      'In all cases: documentation + incremental testing saves a lot of time.';

  @override
  String get aboutDmxS8ChooseTitle => 'Fast choice';

  @override
  String get aboutDmxS8ChooseB1 =>
      'Small setup: direct DMX or Art-Net (simple).';

  @override
  String get aboutDmxS8ChooseB2 =>
      'Many universes: dedicated network + nodes; Art-Net unicast or sACN.';

  @override
  String get aboutDmxS8ChooseB3 =>
      'Very large rigs/infrastructure: sACN + properly managed IGMP switches.';

  @override
  String get aboutSunTimesTitle => 'Sun (rise / set)';

  @override
  String get aboutSunTimesSubtitle =>
      'Pick a city and a date, sunrise/sunset times + lux reference thresholds.';

  @override
  String get homeBpmTitle => 'BPM';

  @override
  String get homeBpmSubtitle => 'Tap tempo, BPM ↔ ms, Hz conversions.';

  @override
  String get bpmTitle => 'BPM';

  @override
  String get bpmTapTitle => 'Tap tempo';

  @override
  String get bpmTapButton => 'Tap';

  @override
  String get bpmResetTap => 'Reset taps';

  @override
  String get bpmDetectedLabel => 'Detected BPM';

  @override
  String get bpmTapHint =>
      'Tap several times (ideally 4 to 8 taps) to get a stable average.';

  @override
  String get bpmManualTitle => 'Manual BPM';

  @override
  String get bpmManualLabel => 'BPM';

  @override
  String get bpmManualHint => 'e.g. 128';

  @override
  String get bpmManualHelp =>
      'If a manual BPM is entered, it takes priority over tap tempo.';

  @override
  String get bpmConversionsTitle => 'Conversions';

  @override
  String get bpmActiveLabel => 'Active BPM';

  @override
  String get bpmMsPerBeat => 'Beat duration';

  @override
  String get bpmHz => 'Frequency';

  @override
  String get bpmSecPerBar44 => 'Bar duration (4/4)';

  @override
  String get bpmDisclaimer =>
      'Approximate indication. Use a metronome if this is critical.';

  @override
  String get laserToolsTitle => 'Tools';

  @override
  String get laserBeamSizeTitle => 'Beam size';

  @override
  String get laserBeamSizeSubtitle =>
      'Diameter, radius and spot area at a given distance.';

  @override
  String get laserBeamInputsTitle => 'Parameters';

  @override
  String get laserBeamDistanceLabel => 'Distance';

  @override
  String get laserBeamDistanceHint => 'm (e.g. 12)';

  @override
  String get laserBeamFormulaHint =>
      'Formula: D(z) = D0 + θ · z (θ in rad, full angle).';

  @override
  String get laserBeamResultsTitle => 'Results';

  @override
  String get laserBeamDiameterAtDistance => 'Diameter at distance';

  @override
  String get laserBeamRadiusAtDistance => 'Radius at distance';

  @override
  String get laserBeamAreaAtDistance => 'Spot area';

  @override
  String get sunTimesPageTitle => 'Sunrise / Sunset';

  @override
  String get sunTimesSelectionTitle => 'Settings';

  @override
  String get sunTimesCityLabel => 'City';

  @override
  String get sunTimesDateLabel => 'Date';

  @override
  String get sunTimesResultsTitle => 'Results';

  @override
  String get sunTimesSunriseLabel => 'Sunrise';

  @override
  String get sunTimesSunsetLabel => 'Sunset';

  @override
  String get sunTimesDayLengthLabel => 'Day length';

  @override
  String get sunTimesDisclaimer =>
      'Indicative values (astronomical model). Double-check with an official source if needed (event, safety, shooting).';

  @override
  String get sunTimesThresholdTitle => 'Illuminance thresholds (quick refs)';

  @override
  String get sunTimesThresholdIntro =>
      'Useful orders of magnitude to anticipate ambient light (highly dependent on weather, latitude, season, obstacles, light pollution).';

  @override
  String get sunTimesLuxDaylight => 'Daylight (not direct sun)';

  @override
  String get sunTimesLuxOvercast => 'Overcast (typical)';

  @override
  String get sunTimesLuxSunrise => 'Sunrise / sunset (clear)';

  @override
  String get sunTimesLuxCivilTwilight => 'Civil twilight limit (clear)';

  @override
  String get sunTimesLuxFullMoon => 'Full moon (clear)';

  @override
  String get sunTimesThresholdNote =>
      'Tip: for “usable without additional lighting”, people often aim for > 100–300 lx. For detailed work, 500 lx and above.';

  @override
  String get sunTimesTitle => 'Sunrise / sunset';

  @override
  String get sunTimesParamsTitle => 'Settings';

  @override
  String get sunTimesPickDate => 'Pick a date';

  @override
  String get sunTimesSunrise => 'Sunrise';

  @override
  String get sunTimesSunset => 'Sunset';

  @override
  String get sunTimesDayLength => 'Day length';

  @override
  String get sunTimesPolarNote =>
      'Note: in high-latitude areas, sunrise/sunset may not occur depending on the season.';

  @override
  String get sunTimesLuxThresholdTitle => 'Light level thresholds (reference)';

  @override
  String get sunTimesLuxBulletNightDark => 'Dark night: < 1 lux';

  @override
  String get sunTimesLuxBulletNightMoon => 'Night (moon): ~ 0.1–1 lux';

  @override
  String get sunTimesLuxBulletFullMoon => 'Full moon: ~ 0.1–0.3 lux';

  @override
  String get sunTimesLuxBulletCivilTwilight => 'Civil twilight: Sun at -6°';

  @override
  String get sunTimesLuxBulletUrbanLow => 'Low urban lighting: ~ 5–20 lux';

  @override
  String get sunTimesLuxBulletOfficeLow => 'Low office lighting: ~ 100–300 lux';

  @override
  String get sunTimesLuxBulletOfficeStd => 'Typical office: ~ 300–500 lux';

  @override
  String get sunTimesLuxBulletOutdoorDay =>
      'Outdoor daylight: ~ 10,000–25,000 lux';

  @override
  String get sunTimesLuxBulletDirectSun => 'Direct sunlight: ~ 100,000 lux';

  @override
  String get sunTimesLuxDisclaimer =>
      'Indicative references: weather/clouds, surroundings, season and terrain can vary a lot.';

  @override
  String get sunTimesTwilightTitle => 'Twilight: what it means';

  @override
  String get sunTimesTwilightIntro =>
      'Twilights are defined by the Sun’s position below the horizon. These definitions are standardized.';

  @override
  String get sunTimesTwilightCivil =>
      'Civil (-6°): usually enough ambient light to see surroundings without artificial lighting.';

  @override
  String get sunTimesTwilightNautical =>
      'Nautical (-12°): the horizon becomes hard to distinguish; stars are visible.';

  @override
  String get sunTimesTwilightAstronomical =>
      'Astronomical (-18°): the sky is considered “dark” (excluding light pollution).';

  @override
  String get sunTimesTwilightAnglesNote =>
      'Angles are degrees below the horizon (negative Sun elevation).';

  @override
  String get sunTimesLabelCity => 'City';

  @override
  String get sunTimesLabelDate => 'Date';

  @override
  String get sunTimesNoteApprox =>
      'Indicative times — may vary with altitude, refraction and weather.';

  @override
  String get sunTimesLuxBulletAstronomicalTwilight =>
      'Astronomical twilight: Sun at -18°';

  @override
  String get sunTimesTimelineTitleStep30 => 'Timeline (30 min step)';

  @override
  String get sunTimesTimelineColTime => 'Time';

  @override
  String get sunTimesTimelineColElevation => 'Elevation';

  @override
  String get sunTimesTimelineColMarker => 'Marker';

  @override
  String get sunTimesTimelineColLux => 'Lux (order)';

  @override
  String get sunTimesTimelineFootnote =>
      'Indicative markers (weather/clouds, surroundings, season) — useful to prep a show.';

  @override
  String get sunTimesLuxNight => 'Dark night';

  @override
  String get sunTimesLuxAstro => 'Astro twilight';

  @override
  String get sunTimesLuxNautical => 'Nautical twil.';

  @override
  String get sunTimesLuxCivil => 'Civil twilight';

  @override
  String get sunTimesLuxVeryLow => 'Very low';

  @override
  String get sunTimesLuxLow => 'Low';

  @override
  String get sunTimesLuxDay => 'Day';

  @override
  String get sunTimesLuxFullDay => 'Full daylight';

  @override
  String get sunTimesSectionSettings => 'Settings';

  @override
  String get sunTimesIntro =>
      'Choose a city and a date. Results are indicative (rounded to 1 minute).';

  @override
  String get sunTimesSectionResults => 'Results';

  @override
  String get sunTimesResultSunrise => 'Sunrise';

  @override
  String get sunTimesResultSunset => 'Sunset';

  @override
  String get sunTimesResultCivilDawn => 'Dawn — civil twilight';

  @override
  String get sunTimesResultCivilDusk => 'Dusk — civil twilight';

  @override
  String get sunTimesResultNauticalDawn => 'Dawn — nautical twilight';

  @override
  String get sunTimesResultNauticalDusk => 'Dusk — nautical twilight';

  @override
  String get sunTimesResultAstronomicalDawn => 'Dawn — astronomical twilight';

  @override
  String get sunTimesResultAstronomicalDusk => 'Dusk — astronomical twilight';

  @override
  String get sunTimesNoData => '—';

  @override
  String get sunTimesSectionTimeline => 'Timeline';

  @override
  String get sunTimesTimelineStep30 => 'Step: 30 min';

  @override
  String get sunTimesTimelineDay => 'Day';

  @override
  String get sunTimesTimelineCivil => 'Civil';

  @override
  String get sunTimesTimelineNautical => 'Nautical';

  @override
  String get sunTimesTimelineAstronomical => 'Astronomical';

  @override
  String get sunTimesTimelineNight => 'Night';

  @override
  String get sunTimesSectionTwilight => 'What do the twilight phases mean?';

  @override
  String get sunTimesTwilightCivilTitle => 'Civil twilight (0° to −6°)';

  @override
  String get sunTimesTwilightCivilBody =>
      'Still bright enough for many activities without strong artificial light. The first/last light of the day.';

  @override
  String get sunTimesTwilightNauticalTitle => 'Nautical twilight (−6° to −12°)';

  @override
  String get sunTimesTwilightNauticalBody =>
      'The sky is darker; the horizon becomes hard to distinguish. Stars become clearly visible.';

  @override
  String get sunTimesTwilightAstronomicalTitle =>
      'Astronomical twilight (−12° to −18°)';

  @override
  String get sunTimesTwilightAstronomicalBody =>
      'Almost full darkness. Beyond −18°, it’s commonly considered full night.';

  @override
  String get sunTimesSectionLux => 'Light levels (reference)';

  @override
  String get sunTimesLuxNote =>
      'These are rough orders of magnitude. Weather changes everything.';

  @override
  String get aboutUniverseToArtnetColSubnet => 'Subnet';

  @override
  String get aboutUniverseToArtnetColUniverse => 'Universe';

  @override
  String get videoLedResultWallResolution => 'Wall resolution';

  @override
  String get videoLedResultWallSize => 'Wall size';

  @override
  String get videoLedResultTile => 'Tile';

  @override
  String get videoLedResultPitch => 'Pitch';
}
