// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get aboutArtNetSubtitle =>
      'Univers DMX sur Ethernet/UDP, nodes, broadcast vs unicast.\nLimites réelles, stabilité réseau, RDM selon matériel.';

  @override
  String get aboutArtNetTitle =>
      'Art-Net — DMX sur IP (nodes, unicast/broadcast)';

  @override
  String get aboutCablingFiberSubtitle =>
      'Cat5e→Cat8, fibre OM3/OM4/OS2, LC/SC/MPO, distances typiques, bonnes pratiques show.';

  @override
  String get aboutCablingFiberTitle =>
      'Réseau — RJ45 / Fibre / débits & longueurs';

  @override
  String get aboutComputingSubtitle =>
      'Débits utiles, versions, limites réelles, pièges marketing.';

  @override
  String get aboutComputingTitle =>
      'Informatique — USB / HDMI / DP / SATA / NVMe…';

  @override
  String get aboutDmxSubtitle =>
      'Univers, adresses, trames, câblage RS-485, terminaison, erreurs terrain.\nInclut schémas + checklist.';

  @override
  String get aboutDmxTitle => 'DMX';

  @override
  String get aboutElectricitySubtitle =>
      'Connecteurs, mono/tri, tableaux kW rapides (16A→400A), pièges terrain.';

  @override
  String get aboutElectricityTitle => 'Électrique — Schuko / P17 / puissances';

  @override
  String get aboutIpBasicsSubtitle =>
      'Comprendre IP, masque, passerelle, DHCP vs statique.\nExemples concrets (2.x, 10.x, 192.168.x) + checklist.';

  @override
  String get aboutIpBasicsTitle => 'Bases IP';

  @override
  String get aboutLightNetworkSubtitle =>
      'Architecture simple et robuste pour Art-Net/sACN.\nVLAN, IGMP snooping/querier, Wi-Fi (jitter), switchs, schémas + checklist.';

  @override
  String get aboutLightNetworkTitle =>
      'Réseau lumière — VLAN, IGMP, Wi-Fi vs filaire';

  @override
  String get aboutSacnSubtitle =>
      'Standard DMX sur IP orienté réseau “pro”.\nMulticast/unicast, IGMP snooping/querier, priorités multi-sources.';

  @override
  String get aboutSacnTitle => 'sACN';

  @override
  String get aboutVideoSubtitle =>
      'Choisir selon latence, fiabilité, câblage, réseau LAN vs WAN.\nTableaux + schéma.';

  @override
  String get aboutVideoTitle => 'Vidéo';

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
  String get riggingInputsTitle => 'Entrées';

  @override
  String get riggingSpanLabel => 'Entraxe (distance entre points)';

  @override
  String get riggingSpanHint => 'Ex : 2.40';

  @override
  String get riggingDropLabel => 'Flèche (drop vertical)';

  @override
  String get riggingDropHint => 'Ex : 0.60';

  @override
  String get riggingUnitMeters => 'm';

  @override
  String get riggingResultsTitle => 'Résultats';

  @override
  String get riggingNeedPositiveValues => 'Renseigne des valeurs > 0.';

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
  String get riggingCalc1Title => 'Entraxe + flèche → longueur & angles';

  @override
  String get riggingCalc1Subtitle =>
      'Bridle symétrique (2 brins identiques). Poids affiché (info). Aucun calcul de charge.';

  @override
  String get riggingCalc2Title => 'Entraxe + angle(H) → flèche & longueur';

  @override
  String get riggingCalc2Subtitle =>
      'Angle par rapport à l\'horizontale. Bridle symétrique. Aucun calcul de charge.';

  @override
  String get riggingCalc3Title => 'Entraxe + longueur → flèche & angles';

  @override
  String get riggingCalc3Subtitle =>
      'Longueur d’un brin connue. Bridle symétrique. Aucun calcul de charge.';

  @override
  String get riggingLegLengthHint => 'Ex: 4.70';

  @override
  String get riggingAngleHint => 'Ex : 45';

  @override
  String get riggingInvalidGeometry =>
      'Géométrie impossible (longueur trop courte pour l’entraxe).';

  @override
  String get riggingSchemaTitle => 'Schéma';

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
  String get riggingWeightLabel => 'Poids (info)';

  @override
  String get riggingUnitKg => 'kg';

  @override
  String get riggingImpossibleGeometry =>
      'Géométrie impossible : la longueur d’un brin doit être > (entraxe / 2).';

  @override
  String get riggingDisclaimerNoLoad =>
      'Poids affiché à titre indicatif. Aucun calcul de charge / tension. Valide selon ton contexte rigging.';

  @override
  String get riggingCalcCommonSubtitle =>
      'Bridle 2 brins. Poids affiché (info). Aucun calcul de charge.';

  @override
  String get riggingOffCenterToggle => 'Charge décentrée';

  @override
  String get riggingOffsetLabel => 'Offset A → charge';

  @override
  String get riggingInvalidOffset =>
      'Offset invalide : doit être > 0 et < entraxe.';

  @override
  String get riggingLegLeftLabel => 'Longueur brin gauche';

  @override
  String get riggingLegRightLabel => 'Longueur brin droit';

  @override
  String get riggingAngleHLeftLabel => 'Angle H (gauche)';

  @override
  String get riggingAngleHRightLabel => 'Angle H (droit)';

  @override
  String get riggingAngleVLeftLabel => 'Angle V (gauche)';

  @override
  String get riggingAngleVRightLabel => 'Angle V (droit)';

  @override
  String get riggingIncludedAngleLabel => 'Angle entre brins';

  @override
  String get riggingAngleHLeftInputLabel => 'Angle H (brin gauche)';

  @override
  String get riggingLegLeftInputLabel => 'Longueur (brin gauche)';

  @override
  String get riggingNeedValidValues => 'Entrer des valeurs positives valides.';

  @override
  String get photometrySection4Title => 'Lux → Lumen';

  @override
  String get photometryAreaLabel => 'Surface (m²)';

  @override
  String get photometryAreaHint4 => 'Ex: 12.5';

  @override
  String photometrySummary4(Object lumens, Object lux, Object area) {
    return 'E = $lux lx • S = $area m² → Φ = $lumens lm';
  }

  @override
  String get aboutArtnetTocConversionTitle => 'Conversions';

  @override
  String get aboutArtnetConversionIntro =>
      'Outils de conversion utiles autour des univers DMX, Art-Net et des valeurs hexadécimales.';

  @override
  String get aboutUniverseToArtnetTitle => 'Univers → Art-Net';

  @override
  String get aboutUniverseToArtnetSubtitle =>
      'Trouver Subnet + Universe (Net/Port-Address) à partir d’un univers DMX.';

  @override
  String get aboutUniverseToHexTitle => 'Univers → Hex';

  @override
  String get aboutUniverseToHexSubtitle =>
      'Convertir un univers (1…N) en index et valeur hexadécimale.';

  @override
  String get aboutArtnetConversionNote =>
      'Note : les conventions Art-Net peuvent varier selon les consoles (adressage, base 0/1). Vérifie toujours la documentation de ton système.';

  @override
  String get elecTocCopyText => 'Copier le sommaire';

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
  String get elecKvaTitle => 'Table kVA → kW (selon cos φ)';

  @override
  String get elecKvaFormula => 'Formule : kW = kVA × cos φ';

  @override
  String get elecKvaIntro =>
      'Cette table donne une estimation rapide de la puissance active (kW) à partir d’une puissance apparente (kVA).';

  @override
  String get elecKvaNote =>
      'Valeurs indicatives. Utilise les valeurs réelles de cos φ quand tu les connais.';

  @override
  String get elecKvaColKva => 'kVA';

  @override
  String get elecKvaColPf08 => 'kW (cos φ = 0,8)';

  @override
  String get elecKvaColPf10 => 'kW (cos φ = 1,0)';

  @override
  String get commonTocTitle => 'Sommaire';

  @override
  String get commonCopySummaryTooltip => 'Copier le sommaire';

  @override
  String get aboutLightReferenceTitle => 'Références lumière';

  @override
  String get refCriTitle => 'IRC / CRI';

  @override
  String get refKelvinTitle => 'Température de couleur (K)';

  @override
  String get refBeamFieldTitle => 'Beam / Field';

  @override
  String get refLuxTitle => 'Niveaux d’éclairement (lux)';

  @override
  String get refCriContent =>
      'L’IRC (CRI) mesure la fidélité des couleurs. Plus il est élevé, plus les couleurs paraissent naturelles.';

  @override
  String get refKelvinContent =>
      'La température de couleur décrit la teinte de blanc (chaud à froid).';

  @override
  String get refBeamFieldContent =>
      'Le Beam est l’angle du faisceau principal ; le Field l’angle où l’intensité devient faible (bordure).';

  @override
  String get refBeamLegendBeam => 'Beam';

  @override
  String get refBeamLegendField => 'Field';

  @override
  String get refLuxIntro =>
      'Références indicatives d’éclairement selon l’usage.';

  @override
  String get refLuxColUse => 'Usage';

  @override
  String get refLuxColLux => 'Lux';

  @override
  String get refLuxUseCorridor => 'Couloir / circulation';

  @override
  String get refLuxUseBackstage => 'Backstage / technique';

  @override
  String get refLuxUseMeeting => 'Salle de réunion';

  @override
  String get refLuxUseExpo => 'Expo / showroom';

  @override
  String get refLuxUseStageGeneral => 'Scène – général';

  @override
  String get refLuxUseStageTv => 'Scène – TV / captation';

  @override
  String get refLuxNote =>
      'Ces valeurs varient selon les normes et les contraintes (caméra, contraste, ambiance).';

  @override
  String get refLightDisclaimerShort =>
      'Références indicatives – pas une norme.';

  @override
  String get refCri90 => 'Excellent (≥ 90)';

  @override
  String get refCri80 => 'Bon (≈ 80)';

  @override
  String get refCriLow => 'Faible (< 80)';

  @override
  String get aboutUniverseToArtnetImportantTitle => 'Important';

  @override
  String get aboutUniverseToArtnetImportantBody =>
      'Certaines consoles utilisent une base 0 (Universe 0..15) et d’autres une base 1 (Universe 1..16).';

  @override
  String get aboutUniverseToArtnetTableTitle => 'Table Univers → Art-Net';

  @override
  String get aboutUniverseToArtnetTableIntro =>
      'Correspondance typique entre univers DMX et adressage Art-Net.';

  @override
  String get aboutUniverseTablesDisclaimer =>
      'Vérifie toujours la convention de ta console / node.';

  @override
  String get aboutUniverseToArtnetColDmx => 'Univers DMX';

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
      'Un univers (1…N) peut être converti en index (base 0) puis en hexadécimal.';

  @override
  String get aboutUniverseToHexTableTitle => 'Table Univers → Hex';

  @override
  String get aboutUniverseToHexTableIntro =>
      'Table de conversion univers DMX → index / hex.';

  @override
  String aboutUniverseToHexBlockTitle(Object p0, Object p1) {
    return 'Bloc $p0 $p1';
  }

  @override
  String get aboutUniverseToHexColDmx => 'Univers DMX';

  @override
  String get aboutUniverseToHexColIndex => 'Index';

  @override
  String get aboutUniverseToHexColHex => 'Hex';

  @override
  String get aboutUniverseToHexNote => 'Index = Univers − 1 (base 0).';

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
  String get sunTimesTitle => 'Lever / coucher du soleil';

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
  String get sunTimesTwilightIntro =>
      'Les crépuscules sont définis par la hauteur du Soleil sous l’horizon. Ces définitions sont standardisées.';

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
  String get sunTimesLabelCity => 'Ville';

  @override
  String get sunTimesLabelDate => 'Date';

  @override
  String get sunTimesNoteApprox =>
      'Heures indicatives — peuvent varier selon l’altitude, la réfraction et la météo.';

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
  String get sunTimesSectionSettings => 'Paramètres';

  @override
  String get sunTimesIntro =>
      'Choisis une ville et une date. Les horaires sont indicatifs (arrondis).';

  @override
  String get sunTimesSectionResults => 'Résultats';

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
  String get sunTimesNoData => '—';

  @override
  String get sunTimesSectionTimeline => 'Timeline (pas de 30 min)';

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
  String get sunTimesSectionTwilight =>
      'À quoi correspondent les crépuscules ?';

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
  String get sunTimesSectionLux => 'Seuils de luminosité (repères)';

  @override
  String get sunTimesLuxNote =>
      'Ces valeurs sont des repères typiques (météo, saison, environnement → variations).';

  @override
  String get aboutUniverseToArtnetColSubnet => 'Subnet';

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
}
