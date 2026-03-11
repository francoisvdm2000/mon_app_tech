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
  String get aboutDmxToc10 => '10) Quick checklist';

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
  String get aboutVideoToc10 => '10) Field checklist';

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
  String get elecToc1 => '1) Basics (W, A, V, kW)';

  @override
  String get elecToc2 => '2) Connectors (Schuko / CEE / PowerCON)';

  @override
  String get elecToc3 => '3) Single-phase / Three-phase (what changes)';

  @override
  String get elecToc4 => '4) Quick table (16A → 400A)';

  @override
  String get elecToc5 => 'kVA → kW / A conversion';

  @override
  String get elecToc6 => '6) Safety & common pitfalls';

  @override
  String get elecToc7 => '6) Checklist';

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
  String get aboutArtnetPageTitle =>
      'Art-Net — DMX universes over IP (simple & complete)';

  @override
  String get aboutArtnetTocTitle => 'Table of contents';

  @override
  String get aboutArtnetTocCopyTooltip => 'Copy notes';

  @override
  String get aboutArtnetCopyLine1 => 'Art-Net = DMX over Ethernet via UDP.';

  @override
  String get aboutArtnetCopyLine2 =>
      'Scale: many universes via distributed nodes (DMX-out).';

  @override
  String get aboutArtnetCopyLine3 =>
      'Transport: broadcast (simple but floods) or unicast (cleaner).';

  @override
  String get aboutArtnetCopyLine4 =>
      'Real limits: Wi-Fi, basic switch, node firmware, universe/mapping settings.';

  @override
  String get aboutArtnetCopyLine5 =>
      'RDM: possible via “RDM proxy” depending on nodes (support varies).';

  @override
  String get aboutArtnetSection1Title => '1) Art-Net — what it is and why';

  @override
  String get aboutArtnetSection2Title =>
      '2) Addressing & universes — clean mapping';

  @override
  String get aboutArtnetSection3Title =>
      '3) Limits & performance — what breaks first';

  @override
  String get aboutArtnetSection4Title => '4) Nodes, splitters & RDM';

  @override
  String get aboutArtnetSection5Title =>
      '5) Troubleshooting — symptoms → causes';

  @override
  String get aboutArtnetSection6Title =>
      '6) Diagrams (network / unicast vs broadcast)';

  @override
  String get aboutArtnetSection6bTitle =>
      '6b) Images (assets) — RJ45/switch/cables';

  @override
  String get aboutArtnetSection7Title => '7) Quick checklist';

  @override
  String get aboutArtnetConversionTablesTitle =>
      'Conversion / tables (Universe 1..256)';

  @override
  String get aboutArtnetPillUdp => 'UDP';

  @override
  String get aboutArtnetPillUniversIp => 'DMX universes over IP';

  @override
  String get aboutArtnetPillNodesDmxOut => 'DMX-out nodes';

  @override
  String get aboutArtnetSection1Paragraph =>
      'Art-Net carries DMX universes over an Ethernet (IP) network. Instead of running one DMX line per universe, you send packets over the network and a node converts them to DMX near the fixtures.';

  @override
  String get aboutArtnetSection1CalloutTitle => 'Why it is useful';

  @override
  String get aboutArtnetSection1Bullet1 =>
      'Scalable: many universes on a single network cable.';

  @override
  String get aboutArtnetSection1Bullet2 =>
      'Distribution: nodes close to fixtures/dimmers → fewer long DMX runs.';

  @override
  String get aboutArtnetSection1Bullet3 =>
      'Flexible patching: changing a universe or moving a node is quick.';

  @override
  String get aboutArtnetSection1Subtitle => 'Two things to remember';

  @override
  String get aboutArtnetSection1SubBullet1 =>
      'Art-Net does not replace DMX: it transports it over IP.';

  @override
  String get aboutArtnetSection1SubBullet2 =>
      'Stability often depends more on the network (switch, Wi-Fi, broadcast) than on the protocol itself.';

  @override
  String get aboutArtnetSection2PillUniverse => 'Universe';

  @override
  String get aboutArtnetSection2PillNodePort => 'Node / Port';

  @override
  String get aboutArtnetSection2PillMapping => 'Mapping';

  @override
  String get aboutDmxPageTitle => 'DMX — operation (simple & complete)';

  @override
  String get aboutDmxSummaryLine1 =>
      'DMX = RS-485, 512 channels (slots) per universe, values 0–255 (8-bit).';

  @override
  String get aboutDmxSummaryLine2 =>
      'Timing: 250 kbaud, full universe ≈ ~44 Hz (order of magnitude).';

  @override
  String get aboutDmxSummaryLine3 =>
      'Topology: daisy-chain (no passive Y). 120Ω termination on the last device.';

  @override
  String get aboutDmxSummaryLine4 =>
      'RDM = bidirectional DMX (config/monitoring) → splitter/node compatibility must be checked.';

  @override
  String get aboutDmxSummaryLine5 =>
      'Art-Net / sACN = DMX universes transported over Ethernet/IP via nodes.';

  @override
  String get aboutDmxSummaryLine6 =>
      'sACN = multicast + priorities (IGMP snooping recommended).';

  @override
  String get aboutDmxToc1 => '1) DMX, universes, addresses — the basics';

  @override
  String get aboutDmxToc2 => '2) DMX frame — break, start code, channels';

  @override
  String get aboutDmxToc3 => '3) RS-485 cabling — topology & cable';

  @override
  String get aboutDmxToc4 => '4) Termination & splitters — avoid reflections';

  @override
  String get aboutDmxToc4bis => '4b) RDM — limits & compatibility';

  @override
  String get aboutDmxToc5 => '5) Field troubleshooting — symptoms → causes';

  @override
  String get aboutDmxToc6 => '6) Art-Net — field notes';

  @override
  String get aboutDmxToc7 => '7) sACN / E1.31 — multicast, IGMP, priorities';

  @override
  String get aboutDmxToc8 => '8) DMX vs Art-Net vs sACN — choosing';

  @override
  String get aboutDmxToc9 => '9) Field diagrams (DMX / IP / pinout)';

  @override
  String get aboutDmxChecklistCopyTitle => 'DMX — field checklist';

  @override
  String get aboutDmxChecklistCopyTitle2 => 'Art-Net / sACN — field checklist';

  @override
  String get aboutDmxChecklistCopyB1 => 'Correct device mode (channel count)';

  @override
  String get aboutDmxChecklistCopyB2 => 'Correct DMX address (no overlap)';

  @override
  String get aboutDmxChecklistCopyB3 => 'Daisy-chain (no passive Y)';

  @override
  String get aboutDmxChecklistCopyB4 => '120Ω termination on the last device';

  @override
  String get aboutDmxChecklistCopyB5 =>
      'DMX/RS-485 cable (120Ω twisted pair) if possible';

  @override
  String get aboutDmxChecklistCopyB6 => 'Opto splitter if several branches';

  @override
  String get aboutDmxChecklistCopyB7 =>
      'Keep DMX away from noisy sources (PSUs, dimmers) if possible';

  @override
  String get aboutDmxChecklistCopyB8 =>
      'If using RDM: check splitter/node compatibility + perfect cabling';

  @override
  String get aboutDmxChecklistCopyB9 =>
      'Dedicated network if possible (or VLAN)';

  @override
  String get aboutDmxChecklistCopyB10 =>
      'Proper switch; IGMP snooping recommended (sACN multicast)';

  @override
  String get aboutDmxChecklistCopyB11 =>
      'Unicast (often) or controlled multicast (avoid flooding)';

  @override
  String get aboutDmxChecklistCopyB12 =>
      'Universe ↔ port/node mapping verified';

  @override
  String get aboutDmxChecklistCopyB13 =>
      'Clear IP plan (addresses, mask, DHCP vs static)';

  @override
  String get aboutDmxS1Title => '1) DMX, universes, addresses — the basics';

  @override
  String get aboutDmxS1Pill1 => '1 universe = 512 slots';

  @override
  String get aboutDmxS1Pill2 => '0–255 (8-bit)';

  @override
  String get aboutDmxS1Pill3 => '16-bit = 2 channels';

  @override
  String get aboutDmxS1Intro =>
      'DMX512 is a control protocol widely used in live events (lighting, effects, dimmers). It is a serial stream (RS-485) that continuously sends a frame containing up to 512 values. Each value = one channel (0→255).';

  @override
  String get aboutDmxS1RememberTitle => 'Remember';

  @override
  String get aboutDmxS1RememberB1 =>
      '1 DMX universe = 512 channels (slots) numbered 1→512.';

  @override
  String get aboutDmxS1RememberB2 =>
      'A fixture listens to a start address (e.g. 101) and uses N channels (depending on its mode).';

  @override
  String get aboutDmxS1RememberB3 =>
      'The controller keeps sending continuously: if you stop transmitting, devices freeze (or go to fallback).';

  @override
  String get aboutDmxS4bisTitle => '4b) RDM — limits & compatibility';

  @override
  String get aboutDmxS4bisPlaceholder => '... (keep your existing content)';

  @override
  String get aboutDmxS9Title => '9) Field diagrams (DMX / IP / pinout)';

  @override
  String get aboutDmxS9Diagram1 => 'DMX timing (break / MAB / slots)';

  @override
  String get aboutDmxS9Diagram2 => 'DMX topology: daisy-chain';

  @override
  String get aboutDmxS9Diagram3 => '120Ω termination';

  @override
  String get aboutDmxS9Diagram4 => 'sACN multicast: IGMP reminder (network)';

  @override
  String get aboutDmxS9Diagram5 => 'IP → nodes → DMX (Art-Net / sACN)';

  @override
  String get aboutDmxS9Diagram6 => 'XLR5 pinout (DMX)';

  @override
  String get aboutDmxS10Title => '10) Quick checklist';

  @override
  String get aboutDmxS10CopyTooltip => 'Copy checklist';

  @override
  String get aboutDmxS10CalloutTitle => 'Before panicking';

  @override
  String get aboutDmxS10B1 => 'Device mode + DMX address (always check).';

  @override
  String get aboutDmxS10B2 => 'Short chain with a known-good cable to isolate.';

  @override
  String get aboutDmxS10B3 => 'Daisy-chain (no passive Y).';

  @override
  String get aboutDmxS10B4 => '120Ω termination on the last device only.';

  @override
  String get aboutDmxS10B5 => 'Opto splitter if several branches.';

  @override
  String get aboutDmxS10B6 =>
      'If using RDM: splitter/node compatibility + impeccable cabling.';

  @override
  String get aboutDmxS10B7 =>
      'On IP (Art-Net/sACN): proper switch, IGMP for sACN multicast, unicast if unsure.';

  @override
  String get aboutDmxFooterNote =>
      'Indicative field information. Exact behavior may vary depending on consoles, nodes, switches and firmware.\nThe goal here is to understand and troubleshoot quickly with a reliable method.';

  @override
  String get aboutDmxPainterBreak => 'BREAK';

  @override
  String get aboutDmxPainterMab => 'MAB';

  @override
  String get aboutDmxPainterStartCode => 'Start\ncode';

  @override
  String get aboutDmxPainterSlots => 'Slots 1…N\n(up to 512)';

  @override
  String get aboutDmxPainterRefresh =>
      'Loop (refresh) — full universe ≈ ~44 Hz (order of magnitude)';

  @override
  String get aboutDmxPainterSourceA => 'SOURCE A\n(prio 100)';

  @override
  String get aboutDmxPainterSourceB => 'SOURCE B\n(prio 90)';

  @override
  String get aboutDmxPainterSwitchIgmp => 'SWITCH\nIGMP snooping';

  @override
  String get aboutDmxPainterMulticastUniverse => 'MULTICAST\nUniverse U';

  @override
  String get aboutDmxPainterRx => 'RX';

  @override
  String get aboutDmxPainterIgmpNote =>
      'Without IGMP: flood\nWith IGMP: subscribers only';

  @override
  String get aboutDmxPainterConsole => 'CONSOLE';

  @override
  String get aboutDmxPainterFix1 => 'FIX 1';

  @override
  String get aboutDmxPainterFix2 => 'FIX 2';

  @override
  String get aboutDmxPainterFix3 => 'FIX 3';

  @override
  String get aboutElectricitePageTitle => 'Electrical — field reference';

  @override
  String get elecSection1Title => '1) Basics (W, A, V, kW)';

  @override
  String get elecSection1FormulasTitle => '3 useful formulas';

  @override
  String get elecSection1Formula1 => 'P (W) = U (V) × I (A)';

  @override
  String get elecSection1Formula2 => 'I (A) = P (W) / U (V)';

  @override
  String get elecSection1Formula3 => 'P (kW) = P (W) / 1000';

  @override
  String get elecSection1FieldMarksTitle => 'Field reference';

  @override
  String get elecSection1FieldMark1 =>
      'Single-phase 230V: 16A ≈ 3.7 kW | 32A ≈ 7.4 kW | 63A ≈ 14.5 kW';

  @override
  String get elecSection1FieldMark2 =>
      'Three-phase 400V: 16A ≈ 11 kW | 32A ≈ 22 kW | 63A ≈ 44 kW';

  @override
  String get elecSection2Title => '2) Connectors (Schuko / P17 / PowerCON)';

  @override
  String get elecSection2SchukoTitle => 'Schuko (domestic sockets)';

  @override
  String get elecSection2SchukoBullet1 =>
      'Typically 16A max (≈ 3.7 kW at 230V).';

  @override
  String get elecSection2SchukoBullet2 =>
      'Watch out for power strips and extension leads: overheating is possible.';

  @override
  String get elecSection2P17Title => 'P17 / CEE (blue/red)';

  @override
  String get elecSection2P17Bullet1 =>
      'Blue: 230V single-phase (camping, small distro).';

  @override
  String get elecSection2P17Bullet2 =>
      'Red: 400V three-phase (distro, high power).';

  @override
  String get elecSection2PowerconTitle => 'PowerCON (audio/lighting)';

  @override
  String get elecSection2PowerconBullet1 =>
      'PowerCON TRUE1 = more field-friendly (locking, IP).';

  @override
  String get elecSection2PowerconBullet2 =>
      'Check cable cross-section and protections.';

  @override
  String get elecSection3Title => '3) Single / Three-phase (what changes)';

  @override
  String get elecSection3Paragraph =>
      'Single-phase = one phase + neutral (230V). Three-phase = 3 phases (400V between phases).';

  @override
  String get elecSection3PitfallsTitle => 'Common pitfalls';

  @override
  String get elecSection3Pitfall1 => 'Phase imbalance (one phase overloads).';

  @override
  String get elecSection3Pitfall2 =>
      'Neutral heating up with strong harmonics (LED, dimmers).';

  @override
  String get elecSection3Pitfall3 => 'Missing/doubtful earth on some sites.';

  @override
  String get elecSection3MethodTitle => 'Simple method';

  @override
  String get elecSection3MethodBullet1 => 'Spread heavy loads across L1/L2/L3.';

  @override
  String get elecSection3MethodBullet2 =>
      'Monitor the neutral if using many LED loads.';

  @override
  String get elecSection3MethodBullet3 =>
      'Measure with a clamp meter if possible.';

  @override
  String get elecSection4Title => '4) Quick table (16A → 400A)';

  @override
  String get elecSection4MonoTitle => 'Single-phase 230V (≈ U×I)';

  @override
  String get elecSection4MonoCode =>
      '16A ≈ 3.7 kW\n32A ≈ 7.4 kW\n63A ≈ 14.5 kW\n125A ≈ 28.8 kW\n200A ≈ 46 kW\n';

  @override
  String get elecSection4TriTitle => 'Three-phase 400V (≈ √3×U×I)';

  @override
  String get elecSection4TriCode =>
      '16A ≈ 11 kW\n32A ≈ 22 kW\n63A ≈ 44 kW\n125A ≈ 86 kW\n200A ≈ 138 kW\n400A ≈ 277 kW\n';

  @override
  String get elecSection4ImportantTitle => 'Important';

  @override
  String get elecSection4ImportantBullet1 =>
      'These are approximate values (power factor, harmonics, losses).';

  @override
  String get elecSection4ImportantBullet2 =>
      'Always validate protections + cable sizes + temperature.';

  @override
  String get elecSection5Title => '6) Safety & field pitfalls';

  @override
  String get elecSection5DontDoTitle => 'Do not do this';

  @override
  String get elecSection5DontDoBullet1 =>
      'Daisy-chain power strips / extensions randomly.';

  @override
  String get elecSection5DontDoBullet2 =>
      'Mix phases without knowing exactly what you are doing.';

  @override
  String get elecSection5DontDoBullet3 => '“Bridge” a doubtful earth.';

  @override
  String get elecSection5WarningTitle => 'Warning signs';

  @override
  String get elecSection5WarningBullet1 =>
      'Hot smell, warm sockets, repeated trips.';

  @override
  String get elecSection5WarningBullet2 => 'Voltage drop (brown-out).';

  @override
  String get elecSection5WarningBullet3 => '“Tired” or unsuitable breaker.';

  @override
  String get elecSection6Title => '6) Checklist';

  @override
  String get elecSection6QuickTitle => 'Quick';

  @override
  String get elecSection6Bullet1 =>
      'Available supply type (single/three-phase) + rating (A).';

  @override
  String get elecSection6Bullet2 => 'Phase distribution (main loads).';

  @override
  String get elecSection6Bullet3 =>
      'Protections (RCD/breaker) and panel condition.';

  @override
  String get elecSection6Bullet4 =>
      'Cables: cross-section / length / overheating.';

  @override
  String get elecSection6Bullet5 => 'Earth: OK? (tester if possible).';

  @override
  String get elecFooterNote =>
      'Note: this content is a field memo. On a real site, always follow standards, venue requirements, and installed protections.';

  @override
  String get infoPageTitle => 'Computing — field reference';

  @override
  String get infoUsbTitle => '1) USB / USB-C / Thunderbolt';

  @override
  String get infoStorageTitle => '2) Storage (SATA / NVMe / SSD)';

  @override
  String get infoVideoLinksTitle => '3) Video links (DP / HDMI)';

  @override
  String get infoPcieGpuTitle => '4) PCIe / GPU (reference)';

  @override
  String get infoChecklistTitle => '5) Checklist (stage)';

  @override
  String get infoSummaryCopy =>
      'INFO — field reference\n• USB-C = shape, not speed: check the standard.\n• NVMe (M.2) is much faster than SATA.\n• DisplayPort/HDMI = standards, watch versions/cables.\n• On video servers: storage + GPU + bandwidth are the base.';

  @override
  String get infoChecklistCopy =>
      'INFO — Checklist\n☐ Certified USB-C cables (data/video if needed)\n☐ Suitable storage (NVMe for heavy media)\n☐ Stable GPU drivers (known version)\n☐ Real resolution/FPS test\n☐ Avoid cheap adapters';

  @override
  String get infoUsbCriticalTitle => 'Critical point';

  @override
  String get infoUsbCriticalBullet1 =>
      'USB-C = connector (shape). It does not indicate speed.';

  @override
  String get infoUsbCriticalBullet2 =>
      'A USB-C cable can be “charge only” and not carry data/video.';

  @override
  String get infoUsbSpeedTitle =>
      'Speed reference points (rough order of magnitude)';

  @override
  String get infoUsbSpeedBullet1 =>
      'USB 2.0: slow (keyboards, dongles, small peripherals).';

  @override
  String get infoUsbSpeedBullet2 =>
      'USB 3.x: much faster (drives, interfaces).';

  @override
  String get infoUsbSpeedBullet3 =>
      'USB4 / Thunderbolt: very high bandwidth (dock, eGPU, video depending on hardware).';

  @override
  String get infoUsbParagraph =>
      'In show conditions: if a peripheral misbehaves, suspect the cable (quality/standard) before the device.';

  @override
  String get infoStorageSataNvmeTitle => 'SATA vs NVMe';

  @override
  String get infoStorageSataNvmeBullet1 =>
      'SATA SSD: good and stable, but limited (older interface).';

  @override
  String get infoStorageSataNvmeBullet2 =>
      'NVMe SSD (M.2): much faster (ideal for media servers, large files).';

  @override
  String get infoStorageFieldTitle => 'Video field use';

  @override
  String get infoStorageFieldBullet1 =>
      'Playback of large 4K/ProRes files → NVMe recommended.';

  @override
  String get infoStorageFieldBullet2 =>
      'Watch temperature: an NVMe can throttle (slow down) if it gets hot.';

  @override
  String get infoStorageFieldBullet3 =>
      'Always test under real conditions before the show.';

  @override
  String get infoVideoLinksImportantTitle => 'Important point';

  @override
  String get infoVideoLinksImportantBullet1 =>
      'Versions matter: cable + port + device must all be compatible.';

  @override
  String get infoVideoLinksImportantBullet2 =>
      'Long distance = active converters / fiber often required.';

  @override
  String get infoVideoLinksCompareTitle => 'DP vs HDMI (very simplified)';

  @override
  String get infoVideoLinksCompareBullet1 =>
      'HDMI: everywhere (TVs, processors), but EDID/HDCP can get in the way.';

  @override
  String get infoVideoLinksCompareBullet2 =>
      'DisplayPort: very common on PCs, often very capable in bandwidth.';

  @override
  String get infoPcieGpuParagraph =>
      'For video servers / mapping: GPU + bus + drivers = stability. Typical issues: drivers, cables, conversion, and output limitations.';

  @override
  String get infoPcieGpuFieldTitle => 'Field';

  @override
  String get infoPcieGpuFieldBullet1 =>
      'Lock a stable driver version before a major show.';

  @override
  String get infoPcieGpuFieldBullet2 => 'Avoid cheap adapters.';

  @override
  String get infoPcieGpuFieldBullet3 => 'Test at the real show resolution/FPS.';

  @override
  String get infoChecklistQuickTitle => 'Quick';

  @override
  String get infoChecklistBullet1 => 'Correct cable/standard.';

  @override
  String get infoChecklistBullet2 => 'Storage suited to the media flow.';

  @override
  String get infoChecklistBullet3 => 'Stable drivers.';

  @override
  String get infoChecklistBullet4 => 'Real-world test before show.';

  @override
  String get infoChecklistBullet5 => 'Avoid cheap adapters.';

  @override
  String get infoFooterNote =>
      'Indicative field information. Exact capabilities vary depending on hardware/versions.\nGoal: simple reference points + reliable method.';

  @override
  String get ipBasicsPageTitle =>
      'Network — IP basics / mask / DHCP (essential)';

  @override
  String get ipBasicsCopyMemoTooltip => 'Copy memo';

  @override
  String get ipBasicsCopyChecklistTooltip => 'Copy checklist';

  @override
  String get ipBasicsMemo1 =>
      'IP = logical address used to reach a device on a network.';

  @override
  String get ipBasicsMemo2 =>
      'Private (LAN): 10.x.x.x, 172.16–31.x.x, 192.168.x.x (not routed on the Internet).';

  @override
  String get ipBasicsMemo3 =>
      'Mask / subnet = tells which part is “network” vs “host”.';

  @override
  String get ipBasicsMemo4 =>
      'Same subnet = direct communication. Otherwise → gateway (router).';

  @override
  String get ipBasicsMemo5 =>
      'DHCP assigns IP automatically; static = useful for nodes/console.';

  @override
  String get ipBasicsToc1 => '1) What is an IP address and what is it for?';

  @override
  String get ipBasicsToc2 => '2) Why 192.x / 10.x / 172.x? (private addresses)';

  @override
  String get ipBasicsToc3 => '3) Mask & subnets: really understanding them';

  @override
  String get ipBasicsToc4 => '4) DHCP, gateway, DNS: who does what?';

  @override
  String get ipBasicsToc5 => '5) How two devices talk (LAN vs outside LAN)';

  @override
  String get ipBasicsToc6 =>
      '6) Simple “show” IP plans (ready-to-copy examples)';

  @override
  String get ipBasicsToc7 =>
      '7) Troubleshooting: symptoms → causes (field method)';

  @override
  String get ipBasicsToc8 =>
      '8) Mini exercises (quickly verify a mask / a network)';

  @override
  String get ipBasicsToc9 => '9) Quick checklist';

  @override
  String get ipBasicsSection1Paragraph =>
      'An IP address (IPv4) is a logical identifier on a network. It tells the network: “send this packet to this device”.\n\nWhen you connect a console, an Art-Net/sACN node, a PC, a managed switch… everything that talks on the network must have a coherent IP so devices can find each other.';

  @override
  String get ipBasicsSection1CalloutTitle => 'Mental picture';

  @override
  String get ipBasicsSection1Bullet1 =>
      'MAC = hardware identifier (network card).';

  @override
  String get ipBasicsSection1Bullet2 =>
      'IP = “postal address” on a network (changeable).';

  @override
  String get ipBasicsSection1Bullet3 =>
      'Mask = “district / ZIP code” (defines the subnet).';

  @override
  String get ipBasicsSection1Bullet4 =>
      'Gateway = “way out of the district” (router).';

  @override
  String get ipBasicsSection1Subtitle => 'IPv4 in 10 seconds';

  @override
  String get ipBasicsSection1SubBullet1 =>
      'Format: A.B.C.D (4 numbers from 0 to 255).';

  @override
  String get ipBasicsSection1SubBullet2 => 'Ex: 192.168.0.50';

  @override
  String get ipBasicsSection1SubBullet3 =>
      'It is not magic: these are 32 bits (4 octets).';

  @override
  String get ipBasicsSection1SubBullet4 =>
      'What matters for you: IP + mask must be coherent between devices.';

  @override
  String get ipBasicsSection2Paragraph =>
      'Some IPv4 address ranges are reserved for private networks (LAN). They are not routed on the Internet. That is why we use them in show environments: you can build your local network without “using up” public IP addresses.';

  @override
  String get ipBasicsSection2CalloutTitle => 'The 3 main private ranges (LAN)';

  @override
  String get ipBasicsSection2Bullet1 =>
      '10.0.0.0 → 10.255.255.255 (often written “10.x.x.x”)';

  @override
  String get ipBasicsSection2Bullet2 =>
      '172.16.0.0 → 172.31.255.255 (often “172.16–31.x.x”)';

  @override
  String get ipBasicsSection2Bullet3 =>
      '192.168.0.0 → 192.168.255.255 (often “192.168.x.x”)';

  @override
  String get ipBasicsSection2Subtitle1 => 'Why do we often see 192.168.x.x?';

  @override
  String get ipBasicsSection2SubBullet1 =>
      'Consumer routers/boxes often use 192.168.0.x or 192.168.1.x.';

  @override
  String get ipBasicsSection2SubBullet2 =>
      'It has become a de facto standard for small LANs.';

  @override
  String get ipBasicsSection2SubBullet3 =>
      'But in show setups, 10.x.x.x is practical if you want many addresses or several VLANs.';

  @override
  String get ipBasicsSection2Subtitle2 => 'And the famous 2.x.x.x (Art-Net)?';

  @override
  String get ipBasicsSection2SubBullet4 =>
      'A lot of Art-Net hardware ships with a 2.x.x.x IP by default (closed network).';

  @override
  String get ipBasicsSection2SubBullet5 =>
      'This is convenient in plug&play mode (without DHCP), but surprising if your PC is on 192.168.x.x.';

  @override
  String get ipBasicsSection2SubBullet6 =>
      'Important: “2.x” itself is not magic for broadcast/unicast.';

  @override
  String get ipBasicsSection2SubBullet7 =>
      'What changes the broadcast scope is the mask (often /8 = 255.0.0.0 in legacy mode).';

  @override
  String get ipBasicsSection2SubBullet8 =>
      'Example: network 2.0.0.0/8 → broadcast = 2.255.255.255 (very wide).';

  @override
  String get ipBasicsSection2SubBullet9 =>
      'Simple fix: put PC/console in the same range + same mask, or reconfigure the node to a 192/10 plan.';

  @override
  String get ipBasicsSection3Paragraph =>
      'The mask (subnet mask) tells which addresses are “in the same network”. Without a mask, an IP address does not mean much.\n\nField rule: if two devices are in the same subnet, they talk directly. Otherwise, they need a gateway (router).';

  @override
  String get ipBasicsSection3Callout1Title => 'Most common masks';

  @override
  String get ipBasicsSection3Bullet1 =>
      '255.0.0.0 ( /8 )   → typical “large” 10.x.x.x network';

  @override
  String get ipBasicsSection3Bullet2 =>
      '255.255.0.0 ( /16 ) → “large” 10.10.x.x or 192.168.x.x network';

  @override
  String get ipBasicsSection3Bullet3 =>
      '255.255.255.0 ( /24 ) → classic 192.168.0.x network (254 devices)';

  @override
  String get ipBasicsSection3Callout2Title =>
      'Mask → broadcast address (very useful to understand)';

  @override
  String get ipBasicsSection3Bullet4 =>
      'Broadcast depends on the subnet, therefore on the mask (not on “2 vs 192”).';

  @override
  String get ipBasicsSection3Bullet5 =>
      '192.168.10.0/24 → broadcast = 192.168.10.255 (small network).';

  @override
  String get ipBasicsSection3Bullet6 =>
      '2.0.0.0/8 (255.0.0.0) → broadcast = 2.255.255.255 (huge network).';

  @override
  String get ipBasicsSection3Bullet7 =>
      'The “bigger” the network, the noisier a broadcast can be (if you use it often).';

  @override
  String get ipBasicsSection3Subtitle1 => 'Concrete example (most useful): /24';

  @override
  String get ipBasicsSection3SubBullet1 => 'IP: 192.168.0.50';

  @override
  String get ipBasicsSection3SubBullet2 => 'Mask: 255.255.255.0 ( /24 )';

  @override
  String get ipBasicsSection3SubBullet3 => 'Network: 192.168.0.0';

  @override
  String get ipBasicsSection3SubBullet4 =>
      'Devices “in the same network”: 192.168.0.1 → 192.168.0.254';

  @override
  String get ipBasicsSection3SubBullet5 =>
      'If you move to 192.168.1.50 → it is NO LONGER the same network.';

  @override
  String get ipBasicsSection3Subtitle2 => 'Why create subnets?';

  @override
  String get ipBasicsSection3SubBullet6 =>
      'Organization: separate “lighting”, “video”, “intercom”, “internet”…';

  @override
  String get ipBasicsSection3SubBullet7 =>
      'Performance: limit noise (broadcast/multicast) to one group.';

  @override
  String get ipBasicsSection3SubBullet8 =>
      'Security: prevent a guest PC from seeing/disturbing the show network.';

  @override
  String get ipBasicsSection3SubBullet9 =>
      'Diagnostics: easier to know “where” a device is.';

  @override
  String get ipBasicsSection3Callout3Title => 'Classic trap';

  @override
  String get ipBasicsSection3Bullet8 =>
      'Same IP “beginning” ≠ same network if the mask is not identical.';

  @override
  String get ipBasicsSection3Bullet9 =>
      'Ex: 10.0.0.5/8 and 10.0.0.200/24 → not the same logical scope.';

  @override
  String get ipBasicsSection4Subtitle1 => 'DHCP (automatic assignment)';

  @override
  String get ipBasicsSection4SubBullet1 =>
      'A DHCP server “gives” IP + mask + gateway + DNS.';

  @override
  String get ipBasicsSection4SubBullet2 => 'Convenient: plug in and it works.';

  @override
  String get ipBasicsSection4SubBullet3 =>
      'Show risk: if DHCP fails / changes / conflicts → strange symptoms.';

  @override
  String get ipBasicsSection4Subtitle2 => 'Static (fixed IP)';

  @override
  String get ipBasicsSection4SubBullet4 =>
      'You define IP + mask (and optionally gateway/DNS).';

  @override
  String get ipBasicsSection4SubBullet5 =>
      'Very useful for: console, nodes, managed switch, show Wi-Fi AP.';

  @override
  String get ipBasicsSection4SubBullet6 =>
      'Risk: duplicate IP if the plan is unclear (conflict).';

  @override
  String get ipBasicsSection4Callout1Title => 'Gateway';

  @override
  String get ipBasicsSection4Bullet1 =>
      'This is the router address: it is used to go “outside the local network”.';

  @override
  String get ipBasicsSection4Bullet2 =>
      'If you build an isolated show network (without Internet) → gateway is often unnecessary.';

  @override
  String get ipBasicsSection4Bullet3 =>
      'But if you need to reach another VLAN / the Internet → it is essential.';

  @override
  String get ipBasicsSection4Callout2Title => 'DNS';

  @override
  String get ipBasicsSection4Bullet4 =>
      'DNS = “directory”: translates a name (ex: example.com) into an IP.';

  @override
  String get ipBasicsSection4Bullet5 =>
      'In show environments (Art-Net/sACN), it is often useless: you work with direct IPs.';

  @override
  String get ipBasicsSection4Bullet6 =>
      'If you use services (updates, licenses, time server, streaming) → DNS becomes useful again.';

  @override
  String get ipBasicsSection4Subtitle3 => 'Simple rule (beginner-friendly)';

  @override
  String get ipBasicsSection4SubBullet7 =>
      'Small closed show: static everywhere, no gateway, no DNS.';

  @override
  String get ipBasicsSection4SubBullet8 =>
      'Show with Internet / several networks: controlled DHCP + reservations, or static plan + router.';

  @override
  String get ipBasicsSection5Paragraph =>
      'When A wants to talk to B, it checks the mask:\n• If B is in the same subnet → A sends directly on the local network.\n• If B is outside the subnet → A sends to the gateway (router), which handles the rest.';

  @override
  String get ipBasicsSection5Callout1Title => 'Example (easy)';

  @override
  String get ipBasicsSection5Bullet1 => 'A = 192.168.0.10 /24';

  @override
  String get ipBasicsSection5Bullet2 =>
      'B = 192.168.0.50 /24 → same network → direct OK.';

  @override
  String get ipBasicsSection5Bullet3 =>
      'B = 192.168.1.50 /24 → different network → router/gateway needed.';

  @override
  String get ipBasicsSection5Subtitle => 'Why won’t it ping?';

  @override
  String get ipBasicsSection5SubBullet1 =>
      'Different mask → A thinks B is “elsewhere” (or vice versa).';

  @override
  String get ipBasicsSection5SubBullet2 =>
      'No gateway → impossible to leave the subnet.';

  @override
  String get ipBasicsSection5SubBullet3 =>
      'PC firewall → ping blocked (very common on Windows).';

  @override
  String get ipBasicsSection5SubBullet4 =>
      'Cable / switch / VLAN: physically not in the same segment.';

  @override
  String get ipBasicsSection5Callout2Title =>
      'Broadcast vs unicast (useful bonus)';

  @override
  String get ipBasicsSection5Bullet4 => 'Unicast: to one specific IP (clean).';

  @override
  String get ipBasicsSection5Bullet5 =>
      'Broadcast: “to everyone” on the subnet (noisy).';

  @override
  String get ipBasicsSection5Bullet6 =>
      'In show environments: broadcast can work on a small setup, but quickly becomes noisy on larger networks.';

  @override
  String get ipBasicsSection6Subtitle1 =>
      'Plan A — ultra simple (one /24 network)';

  @override
  String get ipBasicsSection6Code1 =>
      'Network: 192.168.10.0/24   (mask 255.255.255.0)\n\nConsole: 192.168.10.10\nPC (control): 192.168.10.20\nNode 1: 192.168.10.101\nNode 2: 192.168.10.102\nManaged switch: 192.168.10.2\nGateway: (empty) or 192.168.10.1 if router present';

  @override
  String get ipBasicsSection6Callout1Title => 'Why it works well';

  @override
  String get ipBasicsSection6Bullet1 =>
      'Everyone is in the same subnet → no surprises.';

  @override
  String get ipBasicsSection6Bullet2 =>
      'Easy to explain, easy to troubleshoot.';

  @override
  String get ipBasicsSection6Bullet3 =>
      'Ideal for beginners / small to medium show.';

  @override
  String get ipBasicsSection6Subtitle2 =>
      'Plan B — “10.x” when you want to grow';

  @override
  String get ipBasicsSection6Code2 =>
      'Network: 10.10.0.0/16   (mask 255.255.0.0)\n\nConsole: 10.10.0.10\nPC: 10.10.0.20\nNodes: 10.10.1.10 → 10.10.1.200\nSwitch: 10.10.0.2';

  @override
  String get ipBasicsSection6Callout2Title => 'When to use it';

  @override
  String get ipBasicsSection6Bullet4 =>
      'When you have many devices (or several areas).';

  @override
  String get ipBasicsSection6Bullet5 =>
      'When you plan VLANs later (lighting/video/IT).';

  @override
  String get ipBasicsSection6Subtitle3 =>
      'Plan C — Art-Net “2.x.x.x” legacy compatibility';

  @override
  String get ipBasicsSection6Code3 =>
      'Network: 2.0.0.0/8   (mask 255.0.0.0)\n\nPC/console: 2.0.0.10\nNode 1: 2.0.0.100\nNode 2: 2.0.0.101\n\n⚠️ Isolated network, no Internet, no routing.';

  @override
  String get ipBasicsSection6Callout3Title => 'Warning';

  @override
  String get ipBasicsSection6Bullet6 =>
      'This plan is convenient for old/default hardware.';

  @override
  String get ipBasicsSection6Bullet7 =>
      'But avoid mixing it with a “normal” LAN (192.168.x.x) without a router.';

  @override
  String get ipBasicsSection7Callout1Title => 'Symptoms → likely causes';

  @override
  String get ipBasicsSection7Bullet1 =>
      '“I see the node but it won’t respond” → different mask / VLAN / firewall.';

  @override
  String get ipBasicsSection7Bullet2 =>
      '“A device works then disappears” → unstable DHCP / IP conflict.';

  @override
  String get ipBasicsSection7Bullet3 =>
      '“Nothing works except on the switch” → IP not in the same network / wrong cable / wrong VLAN port.';

  @override
  String get ipBasicsSection7Bullet4 =>
      '“Everything is slow / packet loss” → broadcast/multicast too wide / low-end switch / network loop.';

  @override
  String get ipBasicsSection7Bullet5 =>
      '“It works wired but not on Wi-Fi” → jitter / roaming / saturated band / power saving.';

  @override
  String get ipBasicsSection7Subtitle => 'Pro method in 5 minutes';

  @override
  String get ipBasicsSection7SubBullet1 =>
      '1) Check console/PC IP + mask and node IP + mask.';

  @override
  String get ipBasicsSection7SubBullet2 =>
      '2) Verify: same subnet? (ex: 192.168.10.x /24)';

  @override
  String get ipBasicsSection7SubBullet3 =>
      '3) Ping (if possible) + test access to the node web interface.';

  @override
  String get ipBasicsSection7SubBullet4 =>
      '4) If DHCP: list who has which IP (DHCP table) and check for duplicates.';

  @override
  String get ipBasicsSection7SubBullet5 =>
      '5) If sACN multicast: check IGMP snooping/querier (otherwise flood).';

  @override
  String get ipBasicsSection7Callout2Title => 'Very common trap';

  @override
  String get ipBasicsSection7Bullet6 =>
      'Legacy mask on a PC (255.255.0.0 instead of 255.255.255.0).';

  @override
  String get ipBasicsSection7Bullet7 =>
      'Result: you think you are “in the same network”, but not in the same way as the other device.';

  @override
  String get ipBasicsSection8Subtitle1 =>
      'Exercise 1: same network or not? (/24)';

  @override
  String get ipBasicsSection8SubBullet1 => 'A = 192.168.10.50 /24';

  @override
  String get ipBasicsSection8SubBullet2 =>
      'B = 192.168.10.200 /24 → ✅ same network';

  @override
  String get ipBasicsSection8SubBullet3 =>
      'B = 192.168.11.200 /24 → ❌ not the same network';

  @override
  String get ipBasicsSection8Subtitle2 => 'Exercise 2: /16 (255.255.0.0)';

  @override
  String get ipBasicsSection8SubBullet4 => 'A = 10.10.5.10 /16';

  @override
  String get ipBasicsSection8SubBullet5 =>
      'B = 10.10.200.20 /16 → ✅ same network (10.10.x.x)';

  @override
  String get ipBasicsSection8SubBullet6 =>
      'B = 10.11.200.20 /16 → ❌ not the same network';

  @override
  String get ipBasicsSection8CalloutTitle => 'Visual trick';

  @override
  String get ipBasicsSection8Bullet1 =>
      '/24 → same first 3 numbers (A.B.C) = same network.';

  @override
  String get ipBasicsSection8Bullet2 =>
      '/16 → same first 2 numbers (A.B) = same network.';

  @override
  String get ipBasicsSection8Bullet3 =>
      '/8 → same first number (A) = same network.';

  @override
  String get ipBasicsSection8Subtitle3 => 'Exercise 3: avoid “weird” IPs';

  @override
  String get ipBasicsSection8SubBullet7 =>
      '0.x.x.x : reserved (not a normal host IP).';

  @override
  String get ipBasicsSection8SubBullet8 =>
      '127.x.x.x : loopback (your PC itself).';

  @override
  String get ipBasicsSection8SubBullet9 =>
      '169.254.x.x : auto-IP when DHCP is absent (APIPA) → sign of a DHCP problem.';

  @override
  String get ipBasicsSection9CalloutTitle => 'Before overcomplicating it';

  @override
  String get ipBasicsSection9Bullet1 => 'Same subnet = coherent IP + mask.';

  @override
  String get ipBasicsSection9Bullet2 => 'No duplicate IP (conflict).';

  @override
  String get ipBasicsSection9Bullet3 =>
      'DHCP: OK if controlled; otherwise clear static plan.';

  @override
  String get ipBasicsSection9Bullet4 =>
      'PC firewall: can block ping / discovery.';

  @override
  String get ipBasicsSection9Bullet5 =>
      'Switch/VLAN: correct port, correct VLAN, no loop.';

  @override
  String get ipBasicsSection9Bullet6 =>
      'sACN multicast: IGMP snooping/querier recommended.';

  @override
  String get ipBasicsChecklistCopy =>
      'Network — Quick checklist (IP)\n☐ All devices are in the same subnet (coherent IP + mask)\n☐ No duplicate IP (conflict)\n☐ DHCP: either everyone on DHCP, or a clear static plan (avoid fuzzy mixes)\n☐ For Art-Net/sACN: dedicated network or VLAN if possible\n☐ Managed switch if multicast/IGMP (sACN)\n☐ Wi-Fi: avoid for critical show data (jitter), prefer wired\n☐ Simple test: ping + verify mask/gateway';

  @override
  String get ipBasicsFooterNote =>
      'Goal: understand enough to cable / configure / troubleshoot quickly in show environments.\nNetwork details can go deeper, but these basics cover 90% of field failures.';

  @override
  String get aboutDmxPainterTerm120 => 'TERM\n120Ω';

  @override
  String get aboutDmxPainterDaisyChainNote => '✅ Daisy-chain\n❌ No passive Y';

  @override
  String get aboutDmxPainterXlr5Title => 'XLR5 (DMX) — quick reference';

  @override
  String get aboutDmxPainterPin1 => 'Pin 1: Shield / ground';

  @override
  String get aboutDmxPainterPin2 => 'Pin 2: Data−';

  @override
  String get aboutDmxPainterPin3 => 'Pin 3: Data+';

  @override
  String get aboutDmxPainterPin45 => 'Pin 4/5: “data 2” (rare / optional)';

  @override
  String get aboutDmxPainterXlr3Practice =>
      'In practice: XLR3 is often used (1/2/3)';

  @override
  String get aboutDmxPainterLastFixture => 'LAST\nFIXTURE';

  @override
  String get aboutDmxPainterTerminationLine =>
      'Termination = 120Ω at end of line';

  @override
  String get aboutDmxPainter120Between => '120Ω\nbetween\nData− and Data+';

  @override
  String get aboutDmxPainterOneTermination =>
      '✅ One termination only\n❌ Not in the middle\n❌ Not on every branch';

  @override
  String get aboutDmxPainterConsoleIp => 'CONSOLE\nArt-Net / sACN';

  @override
  String get aboutDmxPainterSwitchSacn => 'SWITCH\n(IGMP for sACN)';

  @override
  String get aboutDmxPainterNode1 => 'NODE 1\nDMX OUT';

  @override
  String get aboutDmxPainterNode2 => 'NODE 2\nDMX OUT';

  @override
  String get aboutDmxPainterFix => 'FIX';

  @override
  String get aboutDmxPainterManyUniverses =>
      '✅ Many universes\n✅ Nodes close to fixtures';

  @override
  String get aboutArtnetSection2Paragraph =>
      'Your goal: make sure each universe sent by the source reaches the right node (and the right DMX port) without ambiguity. Most Art-Net failures = wrong universe, wrong subnet/net, or broadcast saturation.';

  @override
  String get aboutArtnetSection2CalloutTitle =>
      'Simple method (avoids 80% of errors)';

  @override
  String get aboutArtnetSection2Bullet1 =>
      '1) Write it down: “Universe 1 → Node A port 1”, “Universe 2 → Node A port 2”, etc.';

  @override
  String get aboutArtnetSection2Bullet2 =>
      '2) Use stable IPs (reserved DHCP or static).';

  @override
  String get aboutArtnetSection2Bullet3 =>
      '3) Prefer unicast if you have more than one node or a shared network.';

  @override
  String get aboutArtnetSection2Subtitle1 => 'Broadcast vs Unicast';

  @override
  String get aboutArtnetSection2SubBullet1 =>
      'Broadcast: you send to everyone → easy but can flood a switch.';

  @override
  String get aboutArtnetSection2SubBullet2 =>
      'Unicast: you send to the node IP → cleaner and more predictable.';

  @override
  String get aboutArtnetSection2SubBullet3 =>
      'In show conditions: if in doubt → unicast.';

  @override
  String get aboutArtnetSection2Subtitle2 => 'Universes: field practice';

  @override
  String get aboutArtnetSection2SubBullet4 =>
      'Keep numbering simple (e.g. 1…N).';

  @override
  String get aboutArtnetSection2SubBullet5 =>
      'Avoid “one universe everywhere”: document your mappings.';

  @override
  String get aboutArtnetSection2SubBullet6 =>
      'On some setups, “Net/Subnet/Universe” exist: think “mapping”, not “magic”.';

  @override
  String get aboutArtnetSection3CalloutTitle => 'The real limits (in order)';

  @override
  String get aboutArtnetSection3Bullet1 =>
      'Wi-Fi: variable latency + losses → flicker or dropouts.';

  @override
  String get aboutArtnetSection3Bullet2 =>
      'Broadcast: overloads a LAN (everyone receives everything).';

  @override
  String get aboutArtnetSection3Bullet3 =>
      'Low-end switch: limited buffers, poor multicast/broadcast handling.';

  @override
  String get aboutArtnetSection3Bullet4 =>
      'Nodes: firmware/CPU limits (number of universes, rate, options).';

  @override
  String get aboutArtnetSection3Bullet5 =>
      'PC/source: driver, CPU load, antivirus, network card, etc.';

  @override
  String get aboutArtnetSection3Subtitle1 => 'Refresh rate';

  @override
  String get aboutArtnetSection3SubBullet1 =>
      'Classic DMX is often around ~20–44 fps depending on frame size.';

  @override
  String get aboutArtnetSection3SubBullet2 =>
      'Over IP, you can send more, but nodes do not always keep up (and it is not always useful).';

  @override
  String get aboutArtnetSection3SubBullet3 =>
      'Stability > frequency: stable at 30–40 fps is better than “fast” but unstable.';

  @override
  String get aboutArtnetSection3Subtitle2 => 'Simple rules';

  @override
  String get aboutArtnetSection3SubBullet4 => 'Dedicated network (or VLAN).';

  @override
  String get aboutArtnetSection3SubBullet5 =>
      'Unicast if you have multiple nodes.';

  @override
  String get aboutArtnetSection3SubBullet6 => 'Wired for critical shows.';

  @override
  String get aboutArtnetSection4Paragraph =>
      'A node = IP → DMX. It can have 1, 2, 4, 8 DMX ports. Stability depends on the node AND the DMX cabling on the output side (termination, topology, splitters).';

  @override
  String get aboutArtnetSection4Subtitle1 => 'Nodes vs Splitters';

  @override
  String get aboutArtnetSection4SubBullet1 =>
      'Node: converts IP→DMX (and sometimes DMX→IP).';

  @override
  String get aboutArtnetSection4SubBullet2 =>
      'DMX splitter: distributes one DMX line into branches (opto recommended).';

  @override
  String get aboutArtnetSection4SubBullet3 =>
      'Good design: IP as close as possible, then short and clean DMX.';

  @override
  String get aboutArtnetSection4CalloutTitle =>
      'RDM over Art-Net (variable support)';

  @override
  String get aboutArtnetSection4Bullet1 =>
      'Some nodes support an “RDM proxy”: the console sees/configures RDM devices over IP.';

  @override
  String get aboutArtnetSection4Bullet2 =>
      'Others do not support RDM at all, or only partially.';

  @override
  String get aboutArtnetSection4Bullet3 =>
      'A classic opto splitter can block RDM return (depending on model).';

  @override
  String get aboutArtnetSection4Bullet4 =>
      'Tip: if you want RDM, explicitly choose hardware marked as RDM-compatible.';

  @override
  String get aboutArtnetSection4Subtitle2 => 'Good field reflex';

  @override
  String get aboutArtnetSection4SubBullet4 =>
      'If DMX is unstable: solve DMX first (termination, cable, passive Y) then IP.';

  @override
  String get aboutArtnetSection4SubBullet5 =>
      'If RDM is unstable: disable RDM to verify pure DMX is stable.';

  @override
  String get aboutArtnetSection5CalloutTitle => 'Symptoms → likely causes';

  @override
  String get aboutArtnetSection5Bullet1 =>
      'Flicker across the whole stage → Wi-Fi, broadcast flood, saturated switch.';

  @override
  String get aboutArtnetSection5Bullet2 =>
      'One node works, the other does not → universe/mapping, IP, badly configured unicast.';

  @override
  String get aboutArtnetSection5Bullet3 =>
      'Random dropouts → faulty RJ45 cable, unstable switch, PC dropping packets.';

  @override
  String get aboutArtnetSection5Bullet4 =>
      'Only one DMX port on a node fails → DMX cable, termination, device breaking the line.';

  @override
  String get aboutArtnetSection5Bullet5 =>
      'Impossible RDM discovery → node/splitter not RDM compatible, borderline DMX cabling.';

  @override
  String get aboutArtnetSection5Subtitle => 'Quick method';

  @override
  String get aboutArtnetSection5SubBullet1 =>
      '1) Switch to unicast to a single node (simple test).';

  @override
  String get aboutArtnetSection5SubBullet2 =>
      '2) Check universes/mapping (paper + node config).';

  @override
  String get aboutArtnetSection5SubBullet3 =>
      '3) Test direct wired path (PC → switch → node) with a known-good cable.';

  @override
  String get aboutArtnetSection5SubBullet4 =>
      '4) Isolate DMX: node → 1 fixture + termination.';

  @override
  String get aboutArtnetSection6Subtitle1 =>
      'Clean architecture (IP → nodes → short DMX)';

  @override
  String get aboutArtnetSection6Subtitle2 => 'Broadcast vs Unicast (concept)';

  @override
  String get aboutArtnetAssetsCopyTitle => 'Recommended assets (optional)';

  @override
  String get aboutArtnetExampleLabel => 'example';

  @override
  String get aboutArtnetAssetsCopyTooltip => 'Copy asset list';

  @override
  String get aboutArtnetAssetsParagraph =>
      'Section intended to illustrate the network (RJ45, switch, cables). If the assets do not exist, the app shows a clean fallback.';

  @override
  String get aboutArtnetAssetsExamplesTitle => 'Examples';

  @override
  String get aboutArtnetAssetsRj45Label => 'RJ45';

  @override
  String get aboutArtnetAssetsRj45Hint => 'Ethernet connector';

  @override
  String get aboutArtnetAssetsSwitchLabel => 'Switch';

  @override
  String get aboutArtnetAssetsSwitchHint =>
      'Switch (managed is ideal for IGMP/VLAN)';

  @override
  String get aboutArtnetAssetsCableLabel => 'Ethernet cable';

  @override
  String get aboutArtnetAssetsCableHint => 'Cat5e/Cat6 = reliable base';

  @override
  String get aboutArtnetChecklistCopyTitle => 'Art-Net — field checklist';

  @override
  String get aboutArtnetChecklistCopyTooltip => 'Copy checklist';

  @override
  String get aboutArtnetChecklistTitle => 'Before panicking';

  @override
  String get aboutArtnetChecklistBullet1 => 'Unicast if multiple nodes.';

  @override
  String get aboutArtnetChecklistBullet2 =>
      'Dedicated network (or VLAN) if possible.';

  @override
  String get aboutArtnetChecklistBullet3 => 'Wired for critical shows.';

  @override
  String get aboutArtnetChecklistBullet4 => 'Documented universe/mapping.';

  @override
  String get aboutArtnetChecklistBullet5 =>
      'Simple IP test → 1 node → 1 fixture + termination.';

  @override
  String get aboutArtnetChecklistBullet6 =>
      'If using RDM: confirmed “RDM proxy” node + stable DMX cabling';

  @override
  String get aboutArtnetFooterNote =>
      'Indicative field information. Depending on nodes/switches/firmwares, behavior may vary.\nThe goal here is to understand and diagnose quickly.';

  @override
  String get aboutArtnetDiagramSourceLabel => 'SOURCE\n(PC/console)';

  @override
  String get aboutArtnetDiagramSwitchLabel => 'SWITCH';

  @override
  String get aboutArtnetDiagramNode1Label => 'NODE 1\nDMX OUT';

  @override
  String get aboutArtnetDiagramNode2Label => 'NODE 2\nDMX OUT';

  @override
  String get aboutArtnetDiagramFixLabel => 'FIX';

  @override
  String get aboutArtnetDiagramInfoLabel => 'Long IP / short DMX';

  @override
  String get aboutArtnetDiagramSourceShortLabel => 'SOURCE';

  @override
  String get aboutArtnetDiagramNodeALabel => 'NODE A';

  @override
  String get aboutArtnetDiagramNodeBLabel => 'NODE B';

  @override
  String get aboutArtnetDiagramNodeCLabel => 'NODE C';

  @override
  String get aboutArtnetDiagramUnicastLabel =>
      'Unicast: packets sent to one node';

  @override
  String get aboutArtnetDiagramBroadcastLabel =>
      'Broadcast: everyone receives everything';

  @override
  String get aboutArtnetMissingAssetLabel => 'Missing asset';

  @override
  String get aboutRegistryDmxTitle => 'DMX — operation (simple & complete)';

  @override
  String get aboutRegistryDmxSubtitle =>
      'Universes, addresses, frames, RS-485 cabling, termination, field errors.\nIncludes diagrams + checklist.';

  @override
  String get aboutRegistryArtnetTitle =>
      'Art-Net — DMX over IP (nodes, unicast/broadcast)';

  @override
  String get aboutRegistryArtnetSubtitle =>
      'DMX universes over Ethernet/UDP, nodes, broadcast vs unicast.\nReal limits, network stability, RDM depending on hardware, diagrams + checklist.';

  @override
  String get aboutRegistrySacnTitle =>
      'sACN / E1.31 — multicast, IGMP, priorities';

  @override
  String get aboutRegistrySacnSubtitle =>
      'Professional network-oriented DMX over IP standard.\nMulticast/unicast, IGMP snooping/querier, multi-source priorities, diagrams + checklist.';

  @override
  String get aboutRegistryIpBasicsTitle =>
      'Network — IP basics / mask / DHCP (essential)';

  @override
  String get aboutRegistryIpBasicsSubtitle =>
      'Understand IP, mask, gateway, DHCP vs static.\nConcrete examples (2.x.x.x, 10.x, 192.168.x), quick tests, show pitfalls.';

  @override
  String get aboutRegistryReseauTitle =>
      'Network — RJ45 / Fiber / speeds & distances';

  @override
  String get aboutRegistryReseauSubtitle =>
      'Cat5e→Cat8, OM3/OM4/OS2 fiber, LC/SC/MPO, typical distances, show best practices.';

  @override
  String get aboutRegistryNetworkTitle =>
      'Lighting network — VLAN, IGMP, Wi-Fi vs wired';

  @override
  String get aboutRegistryNetworkSubtitle =>
      'Simple and robust architecture for Art-Net/sACN.\nVLAN, IGMP snooping/querier, Wi-Fi (jitter), switches, diagrams + checklist.';

  @override
  String get aboutRegistryVideoTitle => 'Video — SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutRegistryVideoSubtitle =>
      'Choose according to latency, reliability, cabling, LAN vs WAN network.\nTables + diagram.';

  @override
  String get aboutRegistryElectriciteTitle =>
      'Electrical — Schuko / P17 / power';

  @override
  String get aboutRegistryElectriciteSubtitle =>
      'Connectors, single/three-phase, quick kW tables (16A→400A), field pitfalls.';

  @override
  String get aboutRegistryInformatiqueTitle =>
      'Computing — USB / HDMI / DP / SATA / NVMe…';

  @override
  String get aboutRegistryInformatiqueSubtitle =>
      'Useful throughput, versions, real limits, marketing pitfalls.';

  @override
  String get aboutUniverseToHexColHex => 'Hex';

  @override
  String get aboutUniverseToHexNote => 'Index = Universe − 1 (0-based).';

  @override
  String get aboutNetworkPageTitle => 'Lighting network — VLAN, IGMP, Wi-Fi';

  @override
  String get aboutNetworkCopyTooltip => 'Copy notes';

  @override
  String get aboutNetworkChecklistCopyTooltip => 'Copy';

  @override
  String get aboutNetworkChecklistTitle => 'Before opening Wireshark 😄';

  @override
  String get aboutNetworkFooterNote =>
      'Indicative field info. Depending on the network hardware, IGMP/VLAN may be essential.\nGoal: stay simple and robust.';

  @override
  String get aboutNetworkCopy1 =>
      'Lighting network: aim for simple, dedicated, and stable.';

  @override
  String get aboutNetworkCopy2 =>
      'VLAN = separate traffic (lighting vs everything else).';

  @override
  String get aboutNetworkCopy3 =>
      'IGMP = essential for large-scale sACN multicast.';

  @override
  String get aboutNetworkCopy4 =>
      'Wi-Fi = OK for troubleshooting, rarely OK for critical production.';

  @override
  String get aboutNetworkChecklistCopy =>
      'Lighting network — Checklist\n☐ Dedicated network or lighting VLAN\n☐ Clear IP plan (DHCP or static) + correct mask\n☐ Proper switch; loops avoided\n☐ sACN multicast: IGMP snooping ON\n☐ IGMP querier present in the VLAN (if the infrastructure requires it)\n☐ Unicast for troubleshooting (especially Art-Net)\n☐ Wi-Fi: avoid for critical production (jitter/loss)\n☐ Tests: stable ping + progressive load (universes)';

  @override
  String get aboutNetworkToc1 => '1) Goal: stable network';

  @override
  String get aboutNetworkToc2 => '2) IP plan (simple)';

  @override
  String get aboutNetworkToc3 => '3) VLAN (segmentation)';

  @override
  String get aboutNetworkToc4 => '4) IGMP (sACN multicast)';

  @override
  String get aboutNetworkToc5 => '5) Wi-Fi vs wired';

  @override
  String get aboutNetworkToc6 => '6) Switch: what you need';

  @override
  String get aboutNetworkToc7 => '7) Diagrams';

  @override
  String get aboutNetworkToc8 => '8) Checklist';

  @override
  String get aboutNetworkBasicsPill1 => 'Dedicated/VLAN';

  @override
  String get aboutNetworkBasicsPill2 => 'Wired';

  @override
  String get aboutNetworkBasicsPill3 => 'IGMP if multicast';

  @override
  String get aboutNetworkBasicsParagraph =>
      'A lighting network must be predictable: low loss, low jitter, simple architecture. When it breaks, it is rarely “the protocol” and often the infrastructure (switch, Wi-Fi, loops, flood).';

  @override
  String get aboutNetworkBasicsCalloutTitle => 'Basic rule';

  @override
  String get aboutNetworkBasicsBullet1 =>
      'If possible: wired + proper switch + dedicated network (or VLAN).';

  @override
  String get aboutNetworkBasicsBullet2 =>
      'If you must share: VLAN + clear rules.';

  @override
  String get aboutNetworkBasicsBullet3 =>
      'sACN multicast: IGMP quickly becomes mandatory.';

  @override
  String get aboutNetworkPlanIpParagraph =>
      'Choose a simple and coherent strategy. Two approaches: DHCP (simple) or static (predictable). The worst option: an undocumented mix.';

  @override
  String get aboutNetworkPlanIpCalloutTitle => 'Example plan (simple)';

  @override
  String get aboutNetworkPlanIpBullet1 => 'Lighting VLAN: 10.10.0.0/24';

  @override
  String get aboutNetworkPlanIpBullet2 => 'Console/PC: 10.10.0.10';

  @override
  String get aboutNetworkPlanIpBullet3 => 'Nodes: 10.10.0.100–150';

  @override
  String get aboutNetworkPlanIpBullet4 => 'Switch mgmt: 10.10.0.2';

  @override
  String get aboutNetworkPlanIpSubtitle => 'Common mistakes';

  @override
  String get aboutNetworkPlanIpSubBullet1 =>
      'Different mask (ex: /24 vs /16) → devices become invisible.';

  @override
  String get aboutNetworkPlanIpSubBullet2 =>
      'Two devices with the same IP → random behavior.';

  @override
  String get aboutNetworkPlanIpSubBullet3 =>
      'DHCP + static on the same range without control → conflicts.';

  @override
  String get aboutNetworkVlanParagraph =>
      'A VLAN lets you isolate lighting from everything else (internet, video production, guests…). This reduces network noise and the risk that another service breaks your show.';

  @override
  String get aboutNetworkVlanCalloutTitle => 'What you gain';

  @override
  String get aboutNetworkVlanBullet1 => 'Less parasite traffic.';

  @override
  String get aboutNetworkVlanBullet2 =>
      'Less risk (external DHCP, unwanted broadcast).';

  @override
  String get aboutNetworkVlanBullet3 =>
      'Simpler debugging (everything in the VLAN = lighting).';

  @override
  String get aboutNetworkVlanSubtitle => 'Warning';

  @override
  String get aboutNetworkVlanSubBullet1 =>
      'A VLAN means all ports must be configured correctly (access/trunk).';

  @override
  String get aboutNetworkVlanSubBullet2 =>
      'If you do not master it: a dedicated physical network is often simpler.';

  @override
  String get aboutNetworkIgmpPill1 => 'IGMP snooping';

  @override
  String get aboutNetworkIgmpPill2 => 'IGMP querier';

  @override
  String get aboutNetworkIgmpPill3 => 'Multicast flood';

  @override
  String get aboutNetworkIgmpParagraph =>
      'IGMP snooping lets the switch know which ports want which multicast. Without it, multicast can be flooded to every port → saturation.';

  @override
  String get aboutNetworkIgmpCalloutTitle => 'IGMP querier (simple idea)';

  @override
  String get aboutNetworkIgmpBullet1 =>
      'In some networks/VLANs, a querier is needed to maintain IGMP subscriptions.';

  @override
  String get aboutNetworkIgmpBullet2 =>
      'Without a querier: depending on the switches, subscriptions expire and you get “glitches”.';

  @override
  String get aboutNetworkIgmpBullet3 =>
      'On a small dedicated network: everything may work, but on a large network: it becomes critical.';

  @override
  String get aboutNetworkIgmpSubtitle => 'Diagram: IGMP (concept)';

  @override
  String get aboutNetworkWifiSubtitle1 => 'Wired';

  @override
  String get aboutNetworkWifiSubtitle2 => 'Wi-Fi';

  @override
  String get aboutNetworkWifiSubBullet1 =>
      '✅ Stable latency, low loss (if infrastructure is clean).';

  @override
  String get aboutNetworkWifiSubBullet2 => '✅ Recommended in production.';

  @override
  String get aboutNetworkWifiSubBullet3 =>
      '✅ Convenient (quick setup, tablet).';

  @override
  String get aboutNetworkWifiSubBullet4 =>
      '❌ Variable latency (jitter), losses, interference.';

  @override
  String get aboutNetworkWifiSubBullet5 =>
      '❌ Multicast sometimes poorly handled depending on AP/config.';

  @override
  String get aboutNetworkWifiSubBullet6 =>
      'OK for troubleshooting / small non-critical setups, rarely OK on a busy show.';

  @override
  String get aboutNetworkWifiCalloutTitle => 'Simple rule';

  @override
  String get aboutNetworkWifiBullet1 => 'Critical show = wired.';

  @override
  String get aboutNetworkWifiBullet2 =>
      'Wi-Fi = operator comfort (UI), not main DMX/IP transport for heavy traffic.';

  @override
  String get aboutNetworkSwitchCalloutTitle => 'Recommended minimum';

  @override
  String get aboutNetworkSwitchBullet1 => 'Proper Ethernet switch (not a hub).';

  @override
  String get aboutNetworkSwitchBullet2 => 'Good cables (RJ45, connectors).';

  @override
  String get aboutNetworkSwitchBullet3 => 'Avoid loops (or controlled STP).';

  @override
  String get aboutNetworkSwitchBullet4 => 'For sACN multicast: IGMP snooping.';

  @override
  String get aboutNetworkSwitchSubtitle => 'Managed vs unmanaged';

  @override
  String get aboutNetworkSwitchSubBullet1 =>
      'Unmanaged: OK for a small dedicated network (simple).';

  @override
  String get aboutNetworkSwitchSubBullet2 =>
      'Managed: useful for VLAN/IGMP/diagnostics (larger network).';

  @override
  String get aboutNetworkDiagramsSubtitle1 =>
      'VLAN: separate lighting / everything else';

  @override
  String get aboutNetworkDiagramsSubtitle2 => 'Wi-Fi vs wired (concept)';

  @override
  String get aboutNetworkChecklistBullet1 => 'Clear IP plan, coherent mask.';

  @override
  String get aboutNetworkChecklistBullet2 =>
      'Dedicated network / lighting VLAN.';

  @override
  String get aboutNetworkChecklistBullet3 => 'Switch OK, no loops.';

  @override
  String get aboutNetworkChecklistBullet4 => 'IGMP for sACN multicast.';

  @override
  String get aboutNetworkChecklistBullet5 =>
      'Avoid Wi-Fi in critical production.';

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
  String get aboutReseauPageTitle => 'Network — field reference';

  @override
  String get aboutReseauSummaryCopy =>
      'NETWORK — field reference\n• RJ45: Cat5e/6/6A → 1G/10G depending on distance.\n• Fiber: long distance + EMI immunity.\n• Switch: IGMP matters for sACN multicast.\n• VLAN: separating lighting/video/IT = stability.';

  @override
  String get aboutReseauChecklistCopy =>
      'NETWORK — Checklist\n☐ Clear IP plan (range / masks)\n☐ Proper switch (IGMP if sACN multicast)\n☐ VLAN if several “worlds” (lighting/video/IT)\n☐ Tested + labeled cables\n☐ Fiber: compatible modules + clean connectors\n☐ Avoid loops (STP) + avoid public Wi-Fi on show LAN';

  @override
  String get aboutReseauChecklistCopyTooltip => 'Copy';

  @override
  String get aboutReseauFooterNote =>
      'Indicative field info. Exact capabilities vary depending on hardware / cables / modules.\nGoal: simple reference points + reliable method.';

  @override
  String get aboutReseauToc1 => '1) Network basics (LAN / IP / bandwidth)';

  @override
  String get aboutReseauToc2 => '2) RJ45 & categories (Cat5e/6/6A/…)';

  @override
  String get aboutReseauToc3 => '3) PoE (network power)';

  @override
  String get aboutReseauToc4 => '4) Fiber (SM/MM) + connectors (LC/SC)';

  @override
  String get aboutReseauToc5 => '5) SFP / SFP+ / QSFP (modules)';

  @override
  String get aboutReseauToc6 => '6) Switches (VLAN / IGMP / QoS)';

  @override
  String get aboutReseauToc7 => '7) Art-Net / sACN on network (tips)';

  @override
  String get aboutReseauToc8 => '8) Checklist';

  @override
  String get aboutReseauSection1Title => 'The 3 simple ideas';

  @override
  String get aboutReseauSection1Bullet1 => 'IP = address (ex: 10.0.0.50).';

  @override
  String get aboutReseauSection1Bullet2 =>
      'LAN = local network through a switch (not “internet”).';

  @override
  String get aboutReseauSection1Bullet3 =>
      'Bandwidth = capacity (1G, 10G…), but stability also depends on the switch.';

  @override
  String get aboutReseauSection1Title2 => 'Clean show topology';

  @override
  String get aboutReseauSection1Bullet4 =>
      'Console/PC → central switch → nodes/servers.';

  @override
  String get aboutReseauSection1Bullet5 => 'Avoid random network daisy-chains.';

  @override
  String get aboutReseauSection1Bullet6 =>
      'If possible: a dedicated show network (not public Wi-Fi).';

  @override
  String get aboutReseauSection2Title => 'Quick reference points';

  @override
  String get aboutReseauSection2Bullet1 =>
      'Cat5e: classic 1 Gbit/s (up to 100m).';

  @override
  String get aboutReseauSection2Bullet2 =>
      'Cat6: 1G/10G (10G rather on shorter distances).';

  @override
  String get aboutReseauSection2Bullet3 =>
      'Cat6A: 10G up to 100m (practical reference).';

  @override
  String get aboutReseauSection2Bullet4 =>
      'Beyond that: Cat7/8 exist, but Cat6A is often the field sweet spot.';

  @override
  String get aboutReseauSection2Title2 => 'Field';

  @override
  String get aboutReseauSection2Bullet5 =>
      'Always test/label cables (especially rentals).';

  @override
  String get aboutReseauSection2Bullet6 =>
      'Avoid damaged connectors: a “tired” RJ45 = ghost faults.';

  @override
  String get aboutReseauSection2Bullet7 =>
      'Plan for 10G if you do heavy IP video.';

  @override
  String get aboutReseauSection3Paragraph =>
      'PoE allows devices to be powered over RJ45 (IP cameras, Wi-Fi APs, small nodes…). The critical point is the switch’s total PoE budget.';

  @override
  String get aboutReseauSection3Title => 'Reference points';

  @override
  String get aboutReseauSection3Bullet1 =>
      'PoE (802.3af) ≈ 15W, PoE+ (802.3at) ≈ 30W, PoE++/bt higher.';

  @override
  String get aboutReseauSection3Bullet2 =>
      'The switch has a total “budget” (ex: 120W).';

  @override
  String get aboutReseauSection3Bullet3 =>
      'If you exceed the budget: some ports may stop powering / reboot.';

  @override
  String get aboutReseauSection4Title => 'Why fiber in show environments';

  @override
  String get aboutReseauSection4Bullet1 => 'Very long distances.';

  @override
  String get aboutReseauSection4Bullet2 =>
      'Immunity to interference (EMI), excellent in electrically noisy environments.';

  @override
  String get aboutReseauSection4Bullet3 =>
      'Convenient for linking FOH ↔ stage ↔ control room.';

  @override
  String get aboutReseauSection4Title2 =>
      'Multimode vs Singlemode (simple reference)';

  @override
  String get aboutReseauSection4Bullet4 =>
      'Multimode (MM): “medium” distances (often building / stage).';

  @override
  String get aboutReseauSection4Bullet5 =>
      'Singlemode (SM): very long distances.';

  @override
  String get aboutReseauSection4Bullet6 =>
      'Modules (SFP) must match the fiber type.';

  @override
  String get aboutReseauSection4Title3 => 'Connectors';

  @override
  String get aboutReseauSection4Bullet7 => 'LC: small, very common on SFP.';

  @override
  String get aboutReseauSection4Bullet8 =>
      'SC: larger, common in infrastructure.';

  @override
  String get aboutReseauSection4Bullet9 =>
      'Always protect/clean them (dust = losses).';

  @override
  String get aboutReseauSection5Title => 'Reference points';

  @override
  String get aboutReseauSection5Bullet1 => 'SFP: often 1G.';

  @override
  String get aboutReseauSection5Bullet2 => 'SFP+: often 10G.';

  @override
  String get aboutReseauSection5Bullet3 =>
      'QSFP/QSFP+: 40G (depending on usage).';

  @override
  String get aboutReseauSection5Bullet4 =>
      'A module = speed + fiber type + distance (everything must match).';

  @override
  String get aboutReseauSection5Paragraph =>
      'In practice: use modules compatible with the switch (and ideally from the same vendor/model) to avoid surprises.';

  @override
  String get aboutReseauSection6Title => 'Useful functions in live events';

  @override
  String get aboutReseauSection6Bullet1 =>
      'VLAN: separate lighting / video / IT.';

  @override
  String get aboutReseauSection6Bullet2 =>
      'IGMP snooping: essential if you use large-scale sACN multicast.';

  @override
  String get aboutReseauSection6Bullet3 =>
      'QoS: useful if you mix many flows (depending on context).';

  @override
  String get aboutReseauSection6Title2 => 'Common mistakes';

  @override
  String get aboutReseauSection6Bullet4 =>
      'Cheap switch flooding multicast → network collapses.';

  @override
  String get aboutReseauSection6Bullet5 =>
      'Network loop without STP → broadcast storm.';

  @override
  String get aboutReseauSection6Bullet6 =>
      'Public Wi-Fi on the same LAN as the show → instability.';

  @override
  String get aboutReseauSection7Title => 'Art-Net (field)';

  @override
  String get aboutReseauSection7Bullet1 => 'Often easy to set up.';

  @override
  String get aboutReseauSection7Bullet2 =>
      'Broadcast can work on a small dedicated LAN, but unicast is cleaner.';

  @override
  String get aboutReseauSection7Bullet3 =>
      'Universe/port mapping = the number 1 thing to verify.';

  @override
  String get aboutReseauSection7Title2 => 'sACN (field)';

  @override
  String get aboutReseauSection7Bullet4 =>
      'Multicast: efficient, but requires a proper switch (IGMP).';

  @override
  String get aboutReseauSection7Bullet5 =>
      'Priorities: useful if several sources are present.';

  @override
  String get aboutReseauSection7Bullet6 =>
      'On large shows: sACN + IGMP is often the clean choice.';

  @override
  String get aboutReseauChecklistTitle => 'Quick';

  @override
  String get aboutReseauChecklistBullet1 => 'Proper switch + clean cables.';

  @override
  String get aboutReseauChecklistBullet2 => 'IGMP if sACN multicast.';

  @override
  String get aboutReseauChecklistBullet3 => 'Separate usages (VLAN).';

  @override
  String get aboutSacnPageTitle => 'sACN / E1.31 — multicast & priorities';

  @override
  String get aboutSacnCopyTooltip => 'Copy notes';

  @override
  String get aboutSacnChecklistCopyTooltip => 'Copy';

  @override
  String get aboutSacnFooterNote =>
      'Indicative field info. Behavior depends on switches (IGMP), nodes and firmware.\nGoal: understand and stabilize an sACN network.';

  @override
  String get aboutSacnCopy1 =>
      'sACN (E1.31) = DMX over IP (UDP), live event standard.';

  @override
  String get aboutSacnCopy2 => 'sACN universe = 1..63999 (standard range).';

  @override
  String get aboutSacnCopy3 =>
      'Multicast: IGMP snooping recommended, otherwise flooding.';

  @override
  String get aboutSacnCopy4 =>
      'Priority: useful with multiple sources (console + backup).';

  @override
  String get aboutSacnChecklistCopy =>
      'sACN (E1.31) — Field checklist\n☐ Proper switch (ideally manageable)\n☐ IGMP snooping enabled if multicast\n☐ (If possible) IGMP querier present in the VLAN (otherwise strange behavior may occur)\n☐ Unicast if the network is not controlled / troubleshooting\n☐ Priorities: verify multiple sources (console/backup)\n☐ Universe ↔ node port mapping verified\n☐ Avoid Wi-Fi in production';

  @override
  String get aboutSacnToc1 => '1) What is sACN used for?';

  @override
  String get aboutSacnToc2 => '2) Universes (numbering)';

  @override
  String get aboutSacnToc3 => '3) Multicast / Unicast + IGMP';

  @override
  String get aboutSacnToc4 => '4) Priorities (multi-source)';

  @override
  String get aboutSacnToc5 => '5) Limits / performance';

  @override
  String get aboutSacnToc6 => '6) RDM & sACN (proxy / hardware dependent)';

  @override
  String get aboutSacnToc7 => '7) Diagrams';

  @override
  String get aboutSacnToc8 => '8) Checklist';

  @override
  String get aboutSacnSection1Pill1 => 'UDP';

  @override
  String get aboutSacnSection1Pill2 => 'Multicast';

  @override
  String get aboutSacnSection1Pill3 => 'Priority';

  @override
  String get aboutSacnSection1Paragraph =>
      'sACN (E1.31) is a widely used standard for transporting DMX universes over IP. It is often preferred when you want a clean network architecture: properly managed multicast, standardized priorities, and a more “pro network” behavior.';

  @override
  String get aboutSacnSection1Title => 'When it shines';

  @override
  String get aboutSacnSection1Bullet1 =>
      'Many universes on a well-managed network.';

  @override
  String get aboutSacnSection1Bullet2 =>
      'Installations / large networks with multiple sources (priorities).';

  @override
  String get aboutSacnSection1Bullet3 =>
      'When you want to avoid “broadcast everywhere”.';

  @override
  String get aboutSacnSection2Pill1 => 'Universe 1..63999';

  @override
  String get aboutSacnSection2Pill2 => '512 slots/universe';

  @override
  String get aboutSacnSection2Paragraph =>
      'An sACN universe corresponds to a DMX universe: up to 512 slots. Standard sACN numbering is 1..63999. In practice, what matters is console ↔ node ↔ DMX port mapping.';

  @override
  String get aboutSacnSection2Title => 'Common mistake';

  @override
  String get aboutSacnSection2Bullet1 =>
      'You change the universe number on the console side, but not on the node side (or vice versa).';

  @override
  String get aboutSacnSection2Bullet2 =>
      'You patch “Universe 0” while the hardware expects base 1.';

  @override
  String get aboutSacnSection2Bullet3 =>
      'You mix numbering conventions between tools.';

  @override
  String get aboutSacnSection3Paragraph =>
      'sACN often uses multicast: each universe “lives” on a multicast group, and nodes subscribe to the universes they need.';

  @override
  String get aboutSacnSection3Title => 'IGMP snooping (why it matters)';

  @override
  String get aboutSacnSection3Bullet1 =>
      'Without IGMP: the switch floods multicast everywhere → possible overload.';

  @override
  String get aboutSacnSection3Bullet2 =>
      'With IGMP: the switch sends only to subscribed ports → stable network.';

  @override
  String get aboutSacnSection3Bullet3 =>
      'At large scale: IGMP is often THE difference between “it works” and “it’s hell”.';

  @override
  String get aboutSacnSection3Subtitle => 'Diagram: multicast & IGMP';

  @override
  String get aboutSacnSection3Subtitle2 => 'Unicast (option)';

  @override
  String get aboutSacnSection3SubBullet1 =>
      'Possible depending on consoles/nodes.';

  @override
  String get aboutSacnSection3SubBullet2 =>
      'Useful for troubleshooting or if multicast networking is not under control.';

  @override
  String get aboutSacnSection3SubBullet3 =>
      'Less elegant but sometimes simpler.';

  @override
  String get aboutSacnSection4Pill1 => 'Source A prio 100';

  @override
  String get aboutSacnSection4Pill2 => 'Source B prio 90';

  @override
  String get aboutSacnSection4Paragraph =>
      'sACN supports priority: if multiple sources send the same universe, the receiver keeps the highest-priority source. Very useful with a main console + backup console + media server.';

  @override
  String get aboutSacnSection4Title => 'Pitfalls';

  @override
  String get aboutSacnSection4Bullet1 =>
      'Two unwanted sources on the same universe → “they fight”.';

  @override
  String get aboutSacnSection4Bullet2 =>
      'Priority set incorrectly → backup takes over.';

  @override
  String get aboutSacnSection4Bullet3 =>
      'Debug: mute one source and check who wins.';

  @override
  String get aboutSacnSection5Pill1 => 'IGMP';

  @override
  String get aboutSacnSection5Pill2 => 'Switch';

  @override
  String get aboutSacnSection5Pill3 => 'No Wi-Fi';

  @override
  String get aboutSacnSection5Pill4 => 'Node CPU';

  @override
  String get aboutSacnSection5Title => 'What breaks first';

  @override
  String get aboutSacnSection5Bullet1 => 'Multicast without IGMP → flooding.';

  @override
  String get aboutSacnSection5Bullet2 =>
      'Unsuitable switch (buffers/CPU) → loss.';

  @override
  String get aboutSacnSection5Bullet3 => 'Wi-Fi → jitter/loss.';

  @override
  String get aboutSacnSection5Bullet4 => 'Limited nodes (ports, firmware).';

  @override
  String get aboutSacnSection5Subtitle => 'Simple rules';

  @override
  String get aboutSacnSection5SubBullet1 =>
      'Managed switch + IGMP snooping if many universes.';

  @override
  String get aboutSacnSection5SubBullet2 =>
      'Dedicated lighting VLAN if possible.';

  @override
  String get aboutSacnSection5SubBullet3 =>
      'Use unicast for troubleshooting isolation.';

  @override
  String get aboutSacnSection6Paragraph =>
      'As with Art-Net, RDM “over IP” often depends on a proxy mechanism in the nodes. The sACN standard does not automatically mean your node handles RDM correctly.';

  @override
  String get aboutSacnSection6Title => 'Check in the node documentation';

  @override
  String get aboutSacnSection6Bullet1 => 'RDM proxy / RDM over IP support.';

  @override
  String get aboutSacnSection6Bullet2 =>
      'Limitations (discovery only, partial commands).';

  @override
  String get aboutSacnSection6Bullet3 =>
      'Compatibility with splitters/opto on the DMX side.';

  @override
  String get aboutSacnSection6Subtitle => 'Field method';

  @override
  String get aboutSacnSection6SubBullet1 => 'Stabilize DMX without RDM.';

  @override
  String get aboutSacnSection6SubBullet2 => 'Test RDM on a simple, clean line.';

  @override
  String get aboutSacnSection6SubBullet3 =>
      'If issues: disable RDM, then isolate node/splitter.';

  @override
  String get aboutSacnSection7Subtitle1 => 'Multicast + IGMP (concept)';

  @override
  String get aboutSacnSection7Subtitle2 => 'Priorities (2 sources)';

  @override
  String get aboutSacnChecklistTitle => 'Before blaming “the protocol”';

  @override
  String get aboutSacnChecklistBullet1 => 'IGMP snooping enabled if multicast.';

  @override
  String get aboutSacnChecklistBullet2 => 'Dedicated VLAN if possible.';

  @override
  String get aboutSacnChecklistBullet3 => 'Use unicast for troubleshooting.';

  @override
  String get aboutSacnChecklistBullet4 =>
      'Consistent priorities in multi-source setups.';

  @override
  String get aboutSacnChecklistBullet5 => 'Avoid Wi-Fi in production.';

  @override
  String get sunTimesTitle => 'Sunrise / sunset';

  @override
  String get sunTimesSectionSettings => 'Settings';

  @override
  String get sunTimesSectionResults => 'Results';

  @override
  String get sunTimesSectionTimeline => 'Timeline';

  @override
  String get sunTimesSectionTwilight => 'What do the twilight phases mean?';

  @override
  String get sunTimesSectionLux => 'Light levels (reference)';

  @override
  String get sunTimesIntro =>
      'Choose a city and a date. Results are indicative (rounded to 1 minute).';

  @override
  String get sunTimesLabelCity => 'City';

  @override
  String get sunTimesLabelDate => 'Date';

  @override
  String get sunTimesNoteApprox =>
      'Indicative times — may vary with altitude, refraction and weather.';

  @override
  String get sunTimesNoData => '—';

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
  String get sunTimesTwilightIntro =>
      'Twilights are defined by the Sun’s position below the horizon. These definitions are standardized.';

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
  String get sunTimesLuxNote =>
      'These are rough orders of magnitude. Weather changes everything.';

  @override
  String get aboutVideoPageTitle => 'Video — field reference';

  @override
  String get aboutVideoSummaryCopy =>
      'VIDEO — field reference\n• Resolution = size (px). FPS = smoothness / latency.\n• 4:2:2 / 4:4:4 + 10-bit = color quality.\n• SDI = robust + long distance.\n• HDMI = fragile + short.\n• NDI = IP (network), depends on the LAN.\n• Genlock / Timecode = sync.';

  @override
  String get aboutVideoChecklistCopy =>
      'VIDEO — Checklist\n☐ Same resolution & FPS everywhere\n☐ HDMI: EDID / HDCP under control\n☐ SDI: 75Ω cable + correct standard\n☐ NDI/IP: clean LAN (switch, bandwidth)\n☐ Genlock / Timecode if sync is required\n☐ Test source → screen direct';

  @override
  String get aboutVideoChecklistCopyTooltip => 'Copy';

  @override
  String get aboutVideoFooterNote =>
      'Indicative field info. Behavior varies depending on hardware.\nGoal: understand quickly and troubleshoot cleanly.';

  @override
  String get aboutVideoToc1 => '1) Video basics (keywords)';

  @override
  String get aboutVideoToc2 => '2) Resolution & FPS';

  @override
  String get aboutVideoToc3 => '3) Color (4:4:4 / 4:2:2 / 10-bit)';

  @override
  String get aboutVideoToc4 => '4) Sync (Genlock / Timecode)';

  @override
  String get aboutVideoToc5 => '5) Cables & distances';

  @override
  String get aboutVideoToc6 => '6) SDI (3G / 6G / 12G)';

  @override
  String get aboutVideoToc7 => '7) HDMI — field';

  @override
  String get aboutVideoToc8 => '8) NDI — when / why / limits';

  @override
  String get aboutVideoToc9 => '9) Mapping / LED / multi-projector';

  @override
  String get aboutVideoSection1Paragraph =>
      'Video is an image (pixels) sent at a rate (FPS), with a color structure (sampling / bit depth), carried over a link (SDI / HDMI / IP) and sometimes synchronized.';

  @override
  String get aboutVideoSection1Title => 'Useful vocabulary';

  @override
  String get aboutVideoSection1Bullet1 => 'Resolution: width×height (px).';

  @override
  String get aboutVideoSection1Bullet2 => 'FPS: smoothness / latency.';

  @override
  String get aboutVideoSection1Bullet3 => 'Progressive (p) vs interlaced (i).';

  @override
  String get aboutVideoSection1Bullet4 => 'Codec: compression (H.264, H.265…).';

  @override
  String get aboutVideoSection1Bullet5 => 'Latency: critical in live work.';

  @override
  String get aboutVideoSection2Title => 'Resolution';

  @override
  String get aboutVideoSection2Bullet1 => '1080p = 1920×1080.';

  @override
  String get aboutVideoSection2Bullet2 => '4K UHD = 3840×2160.';

  @override
  String get aboutVideoSection2Bullet3 => 'DCI 4K = 4096×2160 (cinema).';

  @override
  String get aboutVideoSection2Bullet4 => 'More pixels = more bandwidth.';

  @override
  String get aboutVideoSection2Title2 => 'FPS';

  @override
  String get aboutVideoSection2Bullet5 => '25/50: Europe standard.';

  @override
  String get aboutVideoSection2Bullet6 => '30/60: US / devices standard.';

  @override
  String get aboutVideoSection2Bullet7 =>
      'Avoid mixing 50 and 60 without conversion.';

  @override
  String get aboutVideoSection3Title => 'Sampling';

  @override
  String get aboutVideoSection3Bullet1 => '4:4:4: graphics / keying.';

  @override
  String get aboutVideoSection3Bullet2 => '4:2:2: common pro use.';

  @override
  String get aboutVideoSection3Bullet3 => '4:2:0: files / streaming.';

  @override
  String get aboutVideoSection3Title2 => 'Bit depth';

  @override
  String get aboutVideoSection3Bullet4 => '8-bit: standard.';

  @override
  String get aboutVideoSection3Bullet5 =>
      '10-bit: better gradients (HDR / LED).';

  @override
  String get aboutVideoSection4Title => 'Genlock';

  @override
  String get aboutVideoSection4Bullet1 => 'Synchronizes image refresh.';

  @override
  String get aboutVideoSection4Bullet2 =>
      'Useful in multi-camera / LED / broadcast.';

  @override
  String get aboutVideoSection4Title2 => 'Timecode';

  @override
  String get aboutVideoSection4Bullet3 => 'Time synchronization.';

  @override
  String get aboutVideoSection4Bullet4 => 'Does not replace genlock.';

  @override
  String get aboutVideoSection5Title => 'Simple rules';

  @override
  String get aboutVideoSection5Bullet1 => 'HDMI: fragile, short.';

  @override
  String get aboutVideoSection5Bullet2 => 'SDI: robust, long.';

  @override
  String get aboutVideoSection5Bullet3 => 'Fiber: very long + EMI free.';

  @override
  String get aboutVideoSection6Title => 'Reference points';

  @override
  String get aboutVideoSection6Bullet1 => '3G: 1080p60';

  @override
  String get aboutVideoSection6Bullet2 => '6G: 2160p30';

  @override
  String get aboutVideoSection6Bullet3 => '12G: 2160p60';

  @override
  String get aboutVideoSection7Title => 'Watch out for';

  @override
  String get aboutVideoSection7Bullet1 => 'EDID';

  @override
  String get aboutVideoSection7Bullet2 => 'HDCP';

  @override
  String get aboutVideoSection7Bullet3 => 'Cable lengths';

  @override
  String get aboutVideoSection8Title => 'Video over IP';

  @override
  String get aboutVideoSection8Bullet1 => 'Flexible.';

  @override
  String get aboutVideoSection8Bullet2 => 'Network load.';

  @override
  String get aboutVideoSection8Bullet3 => 'Requires a clean LAN.';

  @override
  String get aboutVideoSection9Title => 'Field';

  @override
  String get aboutVideoSection9Bullet1 => 'Same resolution / FPS.';

  @override
  String get aboutVideoSection9Bullet2 => 'Correct mapping.';

  @override
  String get aboutVideoSection9Bullet3 => 'Test with patterns.';

  @override
  String get aboutVideoChecklistTitle => 'Before panicking';

  @override
  String get aboutVideoChecklistBullet1 => 'Check resolution / FPS.';

  @override
  String get aboutVideoChecklistBullet2 => 'Test source → screen.';

  @override
  String get aboutVideoChecklistBullet3 => 'Simplify the chain.';

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
  String get commonAdd => 'Add';

  @override
  String get commonEdit => 'Edit';

  @override
  String get commonDelete => 'Delete';

  @override
  String get commonCopied => 'Copied to clipboard.';

  @override
  String get patchCreateGdtfTitle => 'Create GDTF (simple)';

  @override
  String get patchCreateGdtfSubtitle =>
      'Manual device creation using a table editor.';

  @override
  String get gdtfSimpleTitle => 'GDTF Builder (Simple)';

  @override
  String get gdtfDeviceSectionTitle => 'Device';

  @override
  String get gdtfChannelsSectionTitle => 'Channels';

  @override
  String get gdtfImportJsonTitle => 'Import JSON';

  @override
  String get gdtfExportJsonTitle => 'Export JSON';

  @override
  String get gdtfImportJsonHint => 'Paste JSON here';

  @override
  String get gdtfManufacturerLabel => 'Manufacturer';

  @override
  String get gdtfModelLabel => 'Model';

  @override
  String get gdtfModeNameLabel => 'Mode name';

  @override
  String get gdtfChannelsCountLabel => 'Channels';

  @override
  String get gdtfFootprintLabel => 'Footprint';

  @override
  String get gdtfColIndex => '#';

  @override
  String get gdtfColName => 'Name';

  @override
  String get gdtfColDmx => 'DMX';

  @override
  String get gdtfColType => 'Type';

  @override
  String get gdtfColRes => '8/16';

  @override
  String get gdtfColDefault => 'Default';

  @override
  String get gdtfColActions => 'Actions';

  @override
  String get gdtfMoveUp => 'Move up';

  @override
  String get gdtfMoveDown => 'Move down';

  @override
  String get gdtfChannelAddTitle => 'Add channel';

  @override
  String get gdtfChannelEditTitle => 'Edit channel';

  @override
  String get gdtfFieldName => 'Name';

  @override
  String get gdtfFieldDmx => 'DMX address';

  @override
  String get gdtfFieldType => 'Type';

  @override
  String get gdtfFieldResolution => 'Resolution';

  @override
  String get gdtfRes8 => '8-bit';

  @override
  String get gdtfRes16 => '16-bit';

  @override
  String get gdtfFieldDefault8 => 'Default value (0–255)';

  @override
  String get gdtfFieldDefault16 => 'Default value (0–65535)';

  @override
  String get gdtfDefaultChannelName => 'Channel';

  @override
  String get gdtfMvpHint =>
      'MVP: export JSON (clipboard). Real GDTF export (XML+ZIP) will come next.';

  @override
  String get gdtfTypeDimmer => 'Dimmer';

  @override
  String get gdtfTypePan => 'Pan';

  @override
  String get gdtfTypeTilt => 'Tilt';

  @override
  String get gdtfTypeColor => 'Color';

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
  String get gdtfTypeEffect => 'Effect';

  @override
  String get gdtfTypeCustom => 'Custom';

  @override
  String get gdtfEasyTitle => 'Create GDTF (simple)';

  @override
  String get gdtfTemplatesTitle => 'Presets';

  @override
  String get gdtfCreateDefaultPreset => 'Create default preset';

  @override
  String get gdtfTemplatesHint =>
      'Creates a quick base (dimmer, shutter, pan, tilt, RGB, etc.), then fill DMX addresses and defaults.';

  @override
  String get gdtfExportButton => 'Export GDTF';

  @override
  String get gdtfExportHint =>
      'Minimal .gdtf export (description.xml) then share (Mail, WhatsApp, AirDrop, Drive…).';

  @override
  String get gdtfExportNeedDmx => 'Add at least one DMX address to export.';

  @override
  String get gdtfExportDone => 'GDTF exported.';

  @override
  String get gdtfExportError => 'Unable to export GDTF.';

  @override
  String get gdtfShareSubject => 'GDTF file';

  @override
  String get gdtfShareText => 'Here is the exported GDTF file.';

  @override
  String get gdtfFieldRole => 'Parameter';

  @override
  String get gdtfDmxHint => 'Empty or 1–512';

  @override
  String get gdtfFieldDefault => 'Default';

  @override
  String get gdtfDefaultHint8 => '0–255';

  @override
  String get gdtfDefaultHint16 => '0–65535';

  @override
  String get gdtfChannelDefaultName => 'Channel';

  @override
  String get gdtfRoleEmpty => 'Empty / Unknown';

  @override
  String get gdtfRoleDimmer => 'Dimmer';

  @override
  String get gdtfRoleShutter => 'Shutter';

  @override
  String get gdtfRolePan => 'Pan';

  @override
  String get gdtfRoleTilt => 'Tilt';

  @override
  String get gdtfRoleRed => 'Red (R)';

  @override
  String get gdtfRoleGreen => 'Green (G)';

  @override
  String get gdtfRoleBlue => 'Blue (B)';

  @override
  String get gdtfRoleColor => 'Color';

  @override
  String get gdtfRoleGobo => 'Gobo';

  @override
  String get gdtfRoleZoom => 'Zoom';

  @override
  String get gdtfRoleFocus => 'Focus';

  @override
  String get gdtfRolePrism => 'Prism';

  @override
  String get gdtfRoleEffect => 'Effect';

  @override
  String get gdtfRoleControl => 'Control';

  @override
  String get gdtfRoleCustom => 'Custom';

  @override
  String get gdtfResUnknown => 'Empty';

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
  String get gdtfPresetEffect => 'Effect';

  @override
  String get gdtfPresetControl => 'Control';

  @override
  String get commonApply => 'Apply';

  @override
  String get gdtfPresetLabel => 'Choice';

  @override
  String get gdtfPresetFixtureSimple => 'Simple fixture';

  @override
  String get gdtfPresetBarreLed => 'LED bar';

  @override
  String get gdtfTemplatesHintShort =>
      'Pick a preset then apply. You can edit DMX, defaults, and reorder via drag & drop.';

  @override
  String get gdtfExportNeedChannels => 'Add at least one channel to export.';

  @override
  String get homeDrawerContact => 'Contact the developer';

  @override
  String get homeDrawerSuggestItem => 'Suggest an item for the catalogue';

  @override
  String get homeErrorOpenEmail => 'Unable to open the email application.';

  @override
  String get homeErrorOpenForm => 'Unable to open the form.';

  @override
  String get homeContactEmailSubject => 'Question about Mon App Tech';

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
