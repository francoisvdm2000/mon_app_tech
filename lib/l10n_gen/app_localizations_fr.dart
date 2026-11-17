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
      'Standard DMX sur IP orienté réseau \"pro\".\nMulticast/unicast, IGMP snooping/querier, priorités multi-sources.';

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
  String get laserSearchHint => 'ex: \"RGB 5W\"';

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
  String get lightCatalogTitle => 'Catalogue lumière';

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
  String get lightExposureMeterTitle => 'Posemètre (lux)';

  @override
  String get lightExposureMeterDescription =>
      'Calcule l\'éclairement en lux à partir des réglages ISO / ouverture / vitesse d\'un appareil photo.';

  @override
  String get lightExposureMeterIsoLabel => 'Sensibilité ISO';

  @override
  String get lightExposureMeterApertureLabel => 'Ouverture';

  @override
  String get lightExposureMeterShutterLabel => 'Vitesse d\'obturation';

  @override
  String get lightExposureMeterShutterDenomLabel =>
      'Vitesse (dénominateur, 1/x s)';

  @override
  String get lightExposureMeterResultTitle => 'Éclairement estimé';

  @override
  String get lightExposureMeterReferenceTitle => 'Repères d\'éclairement';

  @override
  String get lightExposureMeterRefMoonlight => 'Clair de lune';

  @override
  String get lightExposureMeterRefDimStage => 'Scène faiblement éclairée';

  @override
  String get lightExposureMeterRefOffice => 'Bureau';

  @override
  String get lightExposureMeterRefOvercast => 'Jour couvert (extérieur)';

  @override
  String get lightExposureMeterRefFollowSpot => 'Poursuite / découpe sur scène';

  @override
  String get lightExposureMeterRefSunlight => 'Plein soleil';

  @override
  String get lightExposureMeterFormulaNote =>
      'Lux = (N² × 250 × 1/t) / ISO — méthode du posemètre à lumière incidente. Valeurs à lire sur l\'appareil photo (mode manuel ou infos EXIF).';

  @override
  String get lightProjectionDescription =>
      'Calcul indicatif de la taille de tache selon l’angle, la distance et le diamètre.';

  @override
  String get lightProjectionTitle => 'Taille de projection';

  @override
  String get menuTitle => 'Menu';

  @override
  String get homeGreetingMorning => 'Bonjour';

  @override
  String get homeGreetingAfternoon => 'Bon après-midi';

  @override
  String get homeGreetingEvening => 'Bonsoir';

  @override
  String get homeGreetingTagline =>
      'Tous tes outils de régie, prêts à l\'emploi.';

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
  String get videoBrightnessSectionTitle => 'Lux / nits / ft-L + seuil';

  @override
  String get videoBrightnessSubtitle => 'Lux / nits / ft-L + seuil';

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
  String get videoCalc1Title => 'Ratio (Distance / Largeur)';

  @override
  String get videoCalc2ErrMissing => '❌ Données manquantes: Distance + Ratio.';

  @override
  String videoCalc2Ok(Object width) {
    return '✅ Largeur image = $width m';
  }

  @override
  String get videoCalc2Title => 'Largeur (Distance / Ratio)';

  @override
  String get videoCalc3ErrMissingWidth => '❌ Donnée manquante: Largeur.';

  @override
  String videoCalc3Ok(Object format, Object height) {
    return '✅ Hauteur = $height m (format $format)';
  }

  @override
  String get videoCalc3Title => 'Hauteur (Largeur + Format)';

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
  String get videoCalc4Title => 'Luminosité (lux / nits / ft-L + seuil)';

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
  String get videoCalc5Title => 'Overlap (Largeur totale + N)';

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
  String get videoCalc6Title => 'Nb projecteurs auto + luminosité';

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
  String get videoLmCalc1Title => 'Ratio (Distance / Largeur)';

  @override
  String get videoLmCalc2Title => 'Largeur (Distance / Ratio)';

  @override
  String get videoLmCalc3Title => 'Hauteur (Largeur + Format)';

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
  String get videoMpCalc5Title => 'Largeur par projecteur';

  @override
  String get videoMpCalc6Title => 'Nombre de projecteurs (ratio min/max)';

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
  String get aboutDmxToc10 => '10) Checklist rapide';

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
      '6) Plans IP \"show\" simples (exemples prêts à copier)';

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
  String get riggingBridleAnglesLegend => 'Angles';

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
  String get elecToc1 => '1) Bases (W, A, V, kW)';

  @override
  String get elecToc2 => '2) Connecteurs (Schuko / P17 / PowerCON)';

  @override
  String get elecToc3 => '3) Mono / Tri (ce que ça change)';

  @override
  String get elecToc4 => '4) Table rapide (16A → 400A)';

  @override
  String get elecToc5 => 'Conversion kVA → kW / A';

  @override
  String get elecToc6 => '6) Sécurité & pièges terrain';

  @override
  String get elecToc7 => '6) Checklist';

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
  String get aboutArtnetPageTitle =>
      'Art-Net — univers DMX sur IP (simple & complet)';

  @override
  String get aboutArtnetTocTitle => 'Sommaire';

  @override
  String get aboutArtnetTocCopyTooltip => 'Copier repères';

  @override
  String get aboutArtnetCopyLine1 => 'Art-Net = DMX sur Ethernet via UDP.';

  @override
  String get aboutArtnetCopyLine2 =>
      'Échelle: beaucoup d’univers via nodes (DMX-out) distribués.';

  @override
  String get aboutArtnetCopyLine3 =>
      'Diffusion: broadcast (simple mais flood) ou unicast (plus propre).';

  @override
  String get aboutArtnetCopyLine4 =>
      'Limites réelles: Wi-Fi, switch basique, firmware nodes, réglages univers/mapping.';

  @override
  String get aboutArtnetCopyLine5 =>
      'RDM: possible via \"RDM proxy\" selon nodes (support variable).';

  @override
  String get aboutArtnetSection1Title => '1) Art-Net — c’est quoi et pourquoi';

  @override
  String get aboutArtnetSection2Title =>
      '2) Adressage & univers — mapping propre';

  @override
  String get aboutArtnetSection3Title =>
      '3) Limites & perf — ce qui casse en premier';

  @override
  String get aboutArtnetSection4Title => '4) Nodes, splitters & RDM';

  @override
  String get aboutArtnetSection5Title => '5) Dépannage — symptômes → causes';

  @override
  String get aboutArtnetSection6Title =>
      '6) Schémas (réseau / unicast vs broadcast)';

  @override
  String get aboutArtnetSection6bTitle =>
      '6bis) Images (assets) — RJ45/switch/câbles';

  @override
  String get aboutArtnetSection7Title => '7) Checklist rapide';

  @override
  String get aboutArtnetConversionTablesTitle =>
      '8) Conversion / tables (Univers 1..256)';

  @override
  String get aboutArtnetPillUdp => 'UDP';

  @override
  String get aboutArtnetPillUniversIp => 'Univers DMX sur IP';

  @override
  String get aboutArtnetPillNodesDmxOut => 'Nodes DMX-out';

  @override
  String get aboutArtnetSection1Paragraph => ' des \"paquets\" sur le réseau';

  @override
  String get aboutArtnetSection1CalloutTitle => 'Pourquoi c’est utile';

  @override
  String get aboutArtnetSection1Bullet1 =>
      'Scalable : beaucoup d’univers sur un seul câble réseau.';

  @override
  String get aboutArtnetSection1Bullet2 =>
      'Distribution : nodes proches des projecteurs/dimmers → moins de longues lignes DMX.';

  @override
  String get aboutArtnetSection1Bullet3 =>
      'Patch flexible : changer un univers ou déplacer un node est rapide.';

  @override
  String get aboutArtnetSection1Subtitle => 'Deux mots à retenir';

  @override
  String get aboutArtnetSection1SubBullet1 =>
      'Art-Net ne remplace pas le DMX : il le transporte sur IP.';

  @override
  String get aboutArtnetSection1SubBullet2 =>
      'La stabilité dépend souvent plus du réseau (switch, Wi-Fi, broadcast) que du protocole.';

  @override
  String get aboutArtnetSection2PillUniverse => 'Univers';

  @override
  String get aboutArtnetSection2PillNodePort => 'Node / Port';

  @override
  String get aboutArtnetSection2PillMapping => 'Mapping';

  @override
  String get aboutDmxPageTitle => 'DMX — fonctionnement (simple & complet)';

  @override
  String get aboutDmxSummaryLine1 =>
      'DMX = RS-485, 512 canaux (slots) par univers, valeurs 0–255 (8-bit).';

  @override
  String get aboutDmxSummaryLine2 =>
      'Timing : 250 kbaud, univers plein ≈ ~44 Hz (ordre de grandeur).';

  @override
  String get aboutDmxSummaryLine3 =>
      'Topologie : daisy-chain (pas de Y passif). Terminaison 120Ω sur le dernier.';

  @override
  String get aboutDmxSummaryLine4 =>
      'RDM = DMX bidirectionnel (config/monitoring) → compatibilités splitters/nodes à vérifier.';

  @override
  String get aboutDmxSummaryLine5 =>
      'Art-Net / sACN = univers DMX transportés sur Ethernet/IP via nodes.';

  @override
  String get aboutDmxSummaryLine6 =>
      'sACN = multicast + priorités (IGMP snooping recommandé).';

  @override
  String get aboutDmxToc1 => '1) DMX, univers, adresses — la base';

  @override
  String get aboutDmxToc2 => '2) Trame DMX — break, start code, canaux';

  @override
  String get aboutDmxToc3 => '3) Câblage RS-485 — topologie & câble';

  @override
  String get aboutDmxToc4 =>
      '4) Terminaison & splitters — éviter les réflexions';

  @override
  String get aboutDmxToc4bis => '4bis) RDM — limites & compatibilités';

  @override
  String get aboutDmxToc5 => '5) Dépannage terrain — symptômes → causes';

  @override
  String get aboutDmxToc6 => '6) Art-Net — repères terrain';

  @override
  String get aboutDmxToc7 => '7) sACN / E1.31 — multicast, IGMP, priorités';

  @override
  String get aboutDmxToc8 => '8) DMX vs Art-Net vs sACN — choisir';

  @override
  String get aboutDmxToc9 => '9) Schémas terrain (DMX / IP / pinout)';

  @override
  String get aboutDmxChecklistCopyTitle => 'DMX — Checklist terrain';

  @override
  String get aboutDmxChecklistCopyTitle2 =>
      'Art-Net / sACN — Checklist terrain';

  @override
  String get aboutDmxChecklistCopyB1 =>
      'Mode appareil correct (nombre de canaux)';

  @override
  String get aboutDmxChecklistCopyB2 =>
      'Adresse DMX correcte (pas de chevauchement)';

  @override
  String get aboutDmxChecklistCopyB3 => 'Daisy-chain (pas de Y passif)';

  @override
  String get aboutDmxChecklistCopyB4 =>
      'Terminaison 120Ω sur le dernier appareil';

  @override
  String get aboutDmxChecklistCopyB5 =>
      'Câble DMX/RS-485 (paire torsadée 120Ω) si possible';

  @override
  String get aboutDmxChecklistCopyB6 => 'Splitter opto si plusieurs branches';

  @override
  String get aboutDmxChecklistCopyB7 =>
      'Éloigner DMX des sources parasites (alims, dimmers) si possible';

  @override
  String get aboutDmxChecklistCopyB8 =>
      'Si RDM : vérifier compatibilité splitter/node + câblage impeccable';

  @override
  String get aboutDmxChecklistCopyB9 => 'Réseau dédié si possible (ou VLAN)';

  @override
  String get aboutDmxChecklistCopyB10 =>
      'Switch correct ; IGMP snooping recommandé (sACN multicast)';

  @override
  String get aboutDmxChecklistCopyB11 =>
      'Unicast (souvent) ou multicast maîtrisé (éviter flood)';

  @override
  String get aboutDmxChecklistCopyB12 => 'Mapping univers ↔ ports/node vérifié';

  @override
  String get aboutDmxChecklistCopyB13 =>
      'Plan IP clair (adresses, masque, DHCP vs statique)';

  @override
  String get aboutDmxS1Title => '1) DMX, univers, adresses — la base';

  @override
  String get aboutDmxS1Pill1 => '1 univers = 512 slots';

  @override
  String get aboutDmxS1Pill2 => '0–255 (8-bit)';

  @override
  String get aboutDmxS1Pill3 => '16-bit = 2 canaux';

  @override
  String get aboutDmxS1Intro =>
      'DMX512 est un protocole de contrôle très utilisé en spectacle (lumière, effets, dimmers). C’est un flux série (RS-485) qui envoie en boucle une \"trame\" contenant jusqu’à 512 valeurs. Chaque valeur = un canal (0→255).';

  @override
  String get aboutDmxS1RememberTitle => 'À retenir';

  @override
  String get aboutDmxS1RememberB1 =>
      '1 univers DMX = 512 canaux (slots) numérotés 1→512.';

  @override
  String get aboutDmxS1RememberB2 =>
      'Un appareil écoute une adresse de départ (ex : 101) et consomme N canaux (selon son mode).';

  @override
  String get aboutDmxS1RememberB3 =>
      'Le contrôleur renvoie tout en continu : si tu arrêtes d’émettre, les appareils \"gèlent\" (ou passent en fallback).';

  @override
  String get aboutDmxS4bisTitle => '4bis) RDM — limites & compatibilités';

  @override
  String get aboutDmxS4bisPlaceholder => '... (garde ton contenu existant)';

  @override
  String get aboutDmxS9Title => '9) Schémas terrain (DMX / IP / pinout)';

  @override
  String get aboutDmxS9Diagram1 => 'Timing DMX (break / MAB / slots)';

  @override
  String get aboutDmxS9Diagram2 => 'Topologie DMX : daisy-chain';

  @override
  String get aboutDmxS9Diagram3 => 'Terminaison 120Ω';

  @override
  String get aboutDmxS9Diagram4 => 'sACN multicast : rappel IGMP (réseau)';

  @override
  String get aboutDmxS9Diagram5 => 'IP → nodes → DMX (Art-Net / sACN)';

  @override
  String get aboutDmxS9Diagram6 => 'Pinout XLR5 (DMX)';

  @override
  String get aboutDmxS10Title => '10) Checklist rapide';

  @override
  String get aboutDmxS10CopyTooltip => 'Copier la checklist';

  @override
  String get aboutDmxS10CalloutTitle => 'Avant de paniquer';

  @override
  String get aboutDmxS10B1 =>
      'Mode appareil + adresse DMX (toujours vérifier).';

  @override
  String get aboutDmxS10B2 =>
      'Chaîne courte avec un câble \"connu OK\" pour isoler.';

  @override
  String get aboutDmxS10B3 => 'Daisy-chain (pas de Y passif).';

  @override
  String get aboutDmxS10B4 =>
      'Terminaison 120Ω sur le dernier appareil uniquement.';

  @override
  String get aboutDmxS10B5 => 'Splitter opto si plusieurs branches.';

  @override
  String get aboutDmxS10B6 =>
      'Si RDM : compat splitter/node + câblage impeccable.';

  @override
  String get aboutDmxS10B7 =>
      'En IP (Art-Net/sACN) : switch correct, IGMP pour sACN multicast, unicast si doute.';

  @override
  String get aboutDmxFooterNote =>
      'Info indicative (terrain). Les comportements exacts peuvent varier selon consoles, nodes, switchs et firmwares.\nObjectif ici : comprendre et dépanner vite, avec une méthode fiable.';

  @override
  String get aboutDmxPainterBreak => 'BREAK';

  @override
  String get aboutDmxPainterMab => 'MAB';

  @override
  String get aboutDmxPainterStartCode => 'Start\ncode';

  @override
  String get aboutDmxPainterSlots => 'Slots 1…N\n(jusqu’à 512)';

  @override
  String get aboutDmxPainterRefresh =>
      'Boucle (refresh) — univers plein ≈ ~44 Hz (ordre de grandeur)';

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
      'Sans IGMP : flood\nAvec IGMP : seulement ports abonnés';

  @override
  String get aboutDmxPainterConsole => 'CONSOLE';

  @override
  String get aboutDmxPainterFix1 => 'FIX 1';

  @override
  String get aboutDmxPainterFix2 => 'FIX 2';

  @override
  String get aboutDmxPainterFix3 => 'FIX 3';

  @override
  String get aboutElectricitePageTitle => 'Électrique — repères terrain';

  @override
  String get elecSection1Title => '1) Bases (W, A, V, kW)';

  @override
  String get elecSection1FormulasTitle => '3 formules utiles';

  @override
  String get elecSection1Formula1 => 'P (W) = U (V) × I (A)';

  @override
  String get elecSection1Formula2 => 'I (A) = P (W) / U (V)';

  @override
  String get elecSection1Formula3 => 'P (kW) = P (W) / 1000';

  @override
  String get elecSection1FieldMarksTitle => 'Repères terrain';

  @override
  String get elecSection1FieldMark1 =>
      'Mono 230V : 16A ≈ 3,7 kW | 32A ≈ 7,4 kW | 63A ≈ 14,5 kW';

  @override
  String get elecSection1FieldMark2 =>
      'Tri 400V : 16A ≈ 11 kW | 32A ≈ 22 kW | 63A ≈ 44 kW';

  @override
  String get elecSection2Title => '2) Connecteurs (Schuko / P17 / PowerCON)';

  @override
  String get elecSection2SchukoTitle => 'Schuko (prises domestiques)';

  @override
  String get elecSection2SchukoBullet1 =>
      'Typiquement 16A max (≈ 3,7 kW à 230V).';

  @override
  String get elecSection2SchukoBullet2 =>
      'Attention aux multiprises et rallonges : échauffement possible.';

  @override
  String get elecSection2P17Title => 'P17 / CEE (bleu/rouge)';

  @override
  String get elecSection2P17Bullet1 =>
      'Bleu : 230V mono (camping, petit distro).';

  @override
  String get elecSection2P17Bullet2 =>
      'Rouge : 400V tri (distro, grandes puissances).';

  @override
  String get elecSection2PowerconTitle => 'PowerCON (audio/éclairage)';

  @override
  String get elecSection2PowerconBullet1 =>
      'PowerCON TRUE1 = plus \"terrain\" (verrouillage, IP).';

  @override
  String get elecSection2PowerconBullet2 =>
      'Vérifie la section de câble et les protections.';

  @override
  String get elecSection3Title => '3) Mono / Tri (ce que ça change)';

  @override
  String get elecSection3Paragraph =>
      'Mono = une phase + neutre (230V). Tri = 3 phases (400V entre phases).';

  @override
  String get elecSection3PitfallsTitle => 'Pièges fréquents';

  @override
  String get elecSection3Pitfall1 =>
      'Déséquilibre des phases (une phase surcharge).';

  @override
  String get elecSection3Pitfall2 =>
      'Neutre qui chauffe si grosses harmoniques (LED, dimmers).';

  @override
  String get elecSection3Pitfall3 =>
      'Terre absente/douteuse sur certains sites.';

  @override
  String get elecSection3MethodTitle => 'Méthode simple';

  @override
  String get elecSection3MethodBullet1 =>
      'Répartis les grosses charges sur L1/L2/L3.';

  @override
  String get elecSection3MethodBullet2 =>
      'Surveille le neutre si beaucoup de LED.';

  @override
  String get elecSection3MethodBullet3 => 'Mesure au clamp si possible.';

  @override
  String get elecSection4Title => '4) Table rapide (16A → 400A)';

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
  String get elecSection4ImportantTitle => 'Important';

  @override
  String get elecSection4ImportantBullet1 =>
      'Ce sont des ordres de grandeur (cosφ, harmoniques, pertes).';

  @override
  String get elecSection4ImportantBullet2 =>
      'Toujours valider protections + sections + température.';

  @override
  String get elecSection5Title => '6) Sécurité & pièges terrain';

  @override
  String get elecSection5DontDoTitle => 'À ne pas faire';

  @override
  String get elecSection5DontDoBullet1 =>
      'Chainer multiprises / rallonges en vrac.';

  @override
  String get elecSection5DontDoBullet2 => 'Mélanger des phases sans savoir.';

  @override
  String get elecSection5DontDoBullet3 => '\"Bridger\" une terre douteuse.';

  @override
  String get elecSection5WarningTitle => 'Signaux d’alerte';

  @override
  String get elecSection5WarningBullet1 =>
      'Odeur de chaud, prises tièdes, déclenchements répétés.';

  @override
  String get elecSection5WarningBullet2 => 'Tension qui chute (brown-out).';

  @override
  String get elecSection5WarningBullet3 =>
      'Disjoncteur \"fatigué\" ou inadapté.';

  @override
  String get elecSection6Title => '6) Checklist';

  @override
  String get elecSection6QuickTitle => 'Rapide';

  @override
  String get elecSection6Bullet1 =>
      'Type d’alim dispo (mono/tri) + calibre (A).';

  @override
  String get elecSection6Bullet2 => 'Répartition phases (charges principales).';

  @override
  String get elecSection6Bullet3 =>
      'Protections (diff/disj) et état du tableau.';

  @override
  String get elecSection6Bullet4 =>
      'Câbles : section / longueur / échauffement.';

  @override
  String get elecSection6Bullet5 => 'Terre : OK ? (testeur si possible).';

  @override
  String get elecFooterNote =>
      'Note : ce contenu est un aide-mémoire terrain. Sur un site réel, respecte toujours les normes, les prescriptions du lieu et les protections en place.';

  @override
  String get infoPageTitle => 'Informatique — repères terrain';

  @override
  String get infoUsbTitle => '1) USB / USB-C / Thunderbolt';

  @override
  String get infoStorageTitle => '2) Stockage (SATA / NVMe / SSD)';

  @override
  String get infoVideoLinksTitle => '3) Liaisons vidéo (DP / HDMI)';

  @override
  String get infoPcieGpuTitle => '4) PCIe / GPU (repères)';

  @override
  String get infoChecklistTitle => '5) Checklist (plateau)';

  @override
  String get infoSummaryCopy =>
      'INFO — repères terrain\n• USB-C = forme, pas vitesse : vérifier la norme.\n• NVMe (M.2) bien plus rapide que SATA.\n• DisplayPort/HDMI = standards, attention versions/câbles.\n• Sur serveurs vidéo : stockage + GPU + débit sont la base.';

  @override
  String get infoChecklistCopy =>
      'INFO — Checklist\n☐ Câbles USB-C certifiés (data/vidéo si besoin)\n☐ Stockage adapté (NVMe si gros flux)\n☐ Drivers GPU stables (version connue)\n☐ Test résolution/FPS réels\n☐ Éviter adaptateurs cheap';

  @override
  String get infoUsbCriticalTitle => 'Point critique';

  @override
  String get infoUsbCriticalBullet1 =>
      'USB-C = connecteur (forme). Ça ne dit pas la vitesse.';

  @override
  String get infoUsbCriticalBullet2 =>
      'Un câble USB-C peut être \"charge only\" et ne pas passer la data/vidéo.';

  @override
  String get infoUsbSpeedTitle => 'Repères vitesses (ordre de grandeur)';

  @override
  String get infoUsbSpeedBullet1 =>
      'USB 2.0 : lent (claviers, dongles, petits périph).';

  @override
  String get infoUsbSpeedBullet2 =>
      'USB 3.x : beaucoup plus rapide (disques, interfaces).';

  @override
  String get infoUsbSpeedBullet3 =>
      'USB4 / Thunderbolt : très haut débit (dock, eGPU, vidéo selon matériel).';

  @override
  String get infoUsbParagraph =>
      'En show : si un périphérique \"déconne\", suspecte le câble (qualité/standard) avant le device.';

  @override
  String get infoStorageSataNvmeTitle => 'SATA vs NVMe';

  @override
  String get infoStorageSataNvmeBullet1 =>
      'SSD SATA : bon et stable, mais limité (interface ancienne).';

  @override
  String get infoStorageSataNvmeBullet2 =>
      'SSD NVMe (M.2) : bien plus rapide (idéal pour serveurs média, gros fichiers).';

  @override
  String get infoStorageFieldTitle => 'Terrain vidéo';

  @override
  String get infoStorageFieldBullet1 =>
      'Lecture de gros fichiers 4K/ProRes → NVMe recommandé.';

  @override
  String get infoStorageFieldBullet2 =>
      'Attention à la température : un NVMe peut throttler (ralentir) si ça chauffe.';

  @override
  String get infoStorageFieldBullet3 =>
      'Toujours tester en conditions réelles avant le show.';

  @override
  String get infoVideoLinksImportantTitle => 'Repère important';

  @override
  String get infoVideoLinksImportantBullet1 =>
      'Les versions comptent : câble + port + device doivent être compatibles.';

  @override
  String get infoVideoLinksImportantBullet2 =>
      'Longue distance = convertisseurs actifs / fibre souvent nécessaires.';

  @override
  String get infoVideoLinksCompareTitle => 'DP vs HDMI (très simplifié)';

  @override
  String get infoVideoLinksCompareBullet1 =>
      'HDMI : omniprésent (TV, processors), mais EDID/HDCP peuvent gêner.';

  @override
  String get infoVideoLinksCompareBullet2 =>
      'DisplayPort : très courant PC, souvent très \"capable\" en débit.';

  @override
  String get infoPcieGpuParagraph =>
      'Pour les serveurs vidéo / mapping : GPU + bus + drivers = stabilité. Les problèmes typiques : drivers, câbles, conversion, et limitations de sorties.';

  @override
  String get infoPcieGpuFieldTitle => 'Terrain';

  @override
  String get infoPcieGpuFieldBullet1 =>
      'Bloquer une version de driver stable avant un gros show.';

  @override
  String get infoPcieGpuFieldBullet2 => 'Éviter les adaptateurs \"cheap\".';

  @override
  String get infoPcieGpuFieldBullet3 =>
      'Tester à la résolution/FPS réels du show.';

  @override
  String get infoChecklistQuickTitle => 'Rapide';

  @override
  String get infoChecklistBullet1 => 'Câble/standard correct.';

  @override
  String get infoChecklistBullet2 => 'Stockage adapté au flux.';

  @override
  String get infoChecklistBullet3 => 'Drivers stables.';

  @override
  String get infoChecklistBullet4 => 'Test réel avant show.';

  @override
  String get infoChecklistBullet5 => 'Éviter adaptateurs cheap.';

  @override
  String get infoFooterNote =>
      'Info indicative (terrain). Les capacités exactes varient selon matériel/versions.\nObjectif : repères simples + méthode fiable.';

  @override
  String get ipBasicsPageTitle =>
      'Réseau — bases IP / masque / DHCP (essentiel)';

  @override
  String get ipBasicsCopyMemoTooltip => 'Copier mémo';

  @override
  String get ipBasicsCopyChecklistTooltip => 'Copier la checklist';

  @override
  String get ipBasicsMemo1 =>
      'IP = adresse logique pour joindre un appareil sur un réseau.';

  @override
  String get ipBasicsMemo2 =>
      'Privé (LAN) : 10.x.x.x, 172.16–31.x.x, 192.168.x.x (non routés sur Internet).';

  @override
  String get ipBasicsMemo3 =>
      'Masque / sous-réseau = dit quelle partie est \"réseau\" vs \"machine\".';

  @override
  String get ipBasicsMemo4 =>
      'Même sous-réseau = communication directe. Sinon → passerelle (routeur).';

  @override
  String get ipBasicsMemo5 =>
      'DHCP attribue IP automatiquement; statique = utile pour nodes/console.';

  @override
  String get ipBasicsToc1 => '1) C’est quoi une IP et à quoi ça sert ?';

  @override
  String get ipBasicsToc2 =>
      '2) Pourquoi 192.x / 10.x / 172.x ? (adresses privées)';

  @override
  String get ipBasicsToc3 =>
      '3) Masque & sous-réseaux : comprendre pour de vrai';

  @override
  String get ipBasicsToc4 => '4) DHCP, passerelle, DNS : qui fait quoi ?';

  @override
  String get ipBasicsToc5 =>
      '5) Comment deux appareils se parlent (LAN vs hors LAN)';

  @override
  String get ipBasicsToc6 =>
      '6) Plans IP \"show\" simples (exemples prêts à copier)';

  @override
  String get ipBasicsToc7 =>
      '7) Dépannage : symptômes → causes (méthode terrain)';

  @override
  String get ipBasicsToc8 =>
      '8) Mini-exercices (vérifier vite un masque / un réseau)';

  @override
  String get ipBasicsToc9 => '9) Checklist rapide';

  @override
  String get ipBasicsSection1Paragraph =>
      'Une adresse IP (IPv4) est un identifiant logique sur un réseau. Elle permet de dire : \"envoie ce paquet à cet appareil\".\n\nQuand tu branches une console, un node Art-Net/sACN, un PC, un switch géré… tout ce qui parle en réseau doit avoir une IP cohérente pour que les appareils se trouvent.';

  @override
  String get ipBasicsSection1CalloutTitle => 'Image mentale';

  @override
  String get ipBasicsSection1Bullet1 =>
      'MAC = identifiant matériel (carte réseau).';

  @override
  String get ipBasicsSection1Bullet2 =>
      'IP = adresse \"postale\" sur un réseau (changeable).';

  @override
  String get ipBasicsSection1Bullet3 =>
      'Masque = \"quartier / code postal\" (délimite le sous-réseau).';

  @override
  String get ipBasicsSection1Bullet4 =>
      'Passerelle = \"sortie du quartier\" (routeur).';

  @override
  String get ipBasicsSection1Subtitle => 'IPv4 en 10 secondes';

  @override
  String get ipBasicsSection1SubBullet1 =>
      'Format : A.B.C.D (4 nombres de 0 à 255).';

  @override
  String get ipBasicsSection1SubBullet2 => 'Ex : 192.168.0.50';

  @override
  String get ipBasicsSection1SubBullet3 =>
      'Ce n’est pas magique : ce sont 32 bits (4 octets).';

  @override
  String get ipBasicsSection1SubBullet4 =>
      'Ce qui compte pour toi : IP + masque doivent être cohérents entre appareils.';

  @override
  String get ipBasicsSection2Paragraph =>
      'Certaines plages d’adresses IPv4 sont réservées aux réseaux privés (LAN). Elles ne sont pas routées sur Internet. C’est pour ça qu’on les utilise en show : tu peux faire ton réseau local sans \"consommer\" des IP publiques.';

  @override
  String get ipBasicsSection2CalloutTitle =>
      'Les 3 grandes plages privées (LAN)';

  @override
  String get ipBasicsSection2Bullet1 =>
      '10.0.0.0 → 10.255.255.255 (souvent écrit \"10.x.x.x\")';

  @override
  String get ipBasicsSection2Bullet2 =>
      '172.16.0.0 → 172.31.255.255 (souvent \"172.16–31.x.x\")';

  @override
  String get ipBasicsSection2Bullet3 =>
      '192.168.0.0 → 192.168.255.255 (souvent \"192.168.x.x\")';

  @override
  String get ipBasicsSection2Subtitle1 =>
      'Pourquoi on voit souvent 192.168.x.x ?';

  @override
  String get ipBasicsSection2SubBullet1 =>
      'Les box/routeurs grand public utilisent souvent 192.168.0.x ou 192.168.1.x.';

  @override
  String get ipBasicsSection2SubBullet2 =>
      'C’est devenu un \"standard de fait\" en petits LAN.';

  @override
  String get ipBasicsSection2SubBullet3 =>
      'Mais en show, 10.x.x.x est pratique si tu veux beaucoup d’adresses ou plusieurs VLAN.';

  @override
  String get ipBasicsSection2Subtitle2 => 'Et le fameux 2.x.x.x (Art-Net) ?';

  @override
  String get ipBasicsSection2SubBullet4 =>
      'Beaucoup de matériel Art-Net sort d’usine avec une IP en 2.x.x.x (réseau fermé).';

  @override
  String get ipBasicsSection2SubBullet5 =>
      'C’est \"pratique\" en plug&play (sans DHCP), mais ça surprend si ton PC est en 192.168.x.x.';

  @override
  String get ipBasicsSection2SubBullet6 =>
      'Important : le \"2.x\" n’a rien de magique pour le broadcast/unicast.';

  @override
  String get ipBasicsSection2SubBullet7 =>
      'Ce qui change le périmètre du broadcast, c’est le masque (souvent /8 = 255.0.0.0 en legacy).';

  @override
  String get ipBasicsSection2SubBullet8 =>
      'Exemple : réseau 2.0.0.0/8 → broadcast = 2.255.255.255 (très large).';

  @override
  String get ipBasicsSection2SubBullet9 =>
      'Solution simple : mettre PC/console dans la même plage + même masque, ou reconfigurer le node sur un plan 192/10.';

  @override
  String get ipBasicsSection3Paragraph =>
      'Le masque (subnet mask) dit quelles adresses sont \"dans le même réseau\". Sans masque, une IP ne veut pas dire grand-chose.\n\nRègle terrain : si deux appareils sont dans le même sous-réseau, ils se parlent directement. Sinon, ils ont besoin d’une passerelle (routeur).';

  @override
  String get ipBasicsSection3Callout1Title => 'Masques les plus courants';

  @override
  String get ipBasicsSection3Bullet1 =>
      '255.0.0.0 ( /8 )   → réseau 10.x.x.x typique \"large\"';

  @override
  String get ipBasicsSection3Bullet2 =>
      '255.255.0.0 ( /16 ) → réseau 10.10.x.x ou 192.168.x.x \"large\"';

  @override
  String get ipBasicsSection3Bullet3 =>
      '255.255.255.0 ( /24 ) → réseau 192.168.0.x \"classique\" (254 appareils)';

  @override
  String get ipBasicsSection3Callout2Title =>
      'Masque → adresse de broadcast (très utile à comprendre)';

  @override
  String get ipBasicsSection3Bullet4 =>
      'Le broadcast dépend du sous-réseau, donc du masque (pas de \"2 vs 192\").';

  @override
  String get ipBasicsSection3Bullet5 =>
      '192.168.10.0/24 → broadcast = 192.168.10.255 (petit réseau).';

  @override
  String get ipBasicsSection3Bullet6 =>
      '2.0.0.0/8 (255.0.0.0) → broadcast = 2.255.255.255 (réseau énorme).';

  @override
  String get ipBasicsSection3Bullet7 =>
      'Plus le réseau est \"grand\", plus un broadcast peut faire du bruit (si tu l’utilises souvent).';

  @override
  String get ipBasicsSection3Subtitle1 =>
      'Exemple concret (le plus utile) : /24';

  @override
  String get ipBasicsSection3SubBullet1 => 'IP : 192.168.0.50';

  @override
  String get ipBasicsSection3SubBullet2 => 'Masque : 255.255.255.0 ( /24 )';

  @override
  String get ipBasicsSection3SubBullet3 => 'Réseau : 192.168.0.0';

  @override
  String get ipBasicsSection3SubBullet4 =>
      'Appareils \"dans le même réseau\" : 192.168.0.1 → 192.168.0.254';

  @override
  String get ipBasicsSection3SubBullet5 =>
      'Si tu passes en 192.168.1.50 → ce n’est PLUS le même réseau.';

  @override
  String get ipBasicsSection3Subtitle2 => 'Pourquoi faire des sous-réseaux ?';

  @override
  String get ipBasicsSection3SubBullet6 =>
      'Organisation : séparer \"lumière\", \"vidéo\", \"intercom\", \"internet\"…';

  @override
  String get ipBasicsSection3SubBullet7 =>
      'Performance : limiter le bruit (broadcast/multicast) à un groupe.';

  @override
  String get ipBasicsSection3SubBullet8 =>
      'Sécurité : éviter qu’un PC \"invité\" voie/perturbe le réseau show.';

  @override
  String get ipBasicsSection3SubBullet9 =>
      'Diagnostic : plus simple de savoir \"où\" est un appareil.';

  @override
  String get ipBasicsSection3Callout3Title => 'Piège classique';

  @override
  String get ipBasicsSection3Bullet8 =>
      'Même \"début\" d’IP ≠ même réseau si le masque n’est pas identique.';

  @override
  String get ipBasicsSection3Bullet9 =>
      'Ex : 10.0.0.5/8 et 10.0.0.200/24 → pas le même périmètre logique.';

  @override
  String get ipBasicsSection4Subtitle1 => 'DHCP (attribution automatique)';

  @override
  String get ipBasicsSection4SubBullet1 =>
      'Un serveur DHCP \"donne\" : IP + masque + passerelle + DNS.';

  @override
  String get ipBasicsSection4SubBullet2 => 'Pratique : tu branches, ça marche.';

  @override
  String get ipBasicsSection4SubBullet3 =>
      'Risque show : si le DHCP tombe / change / conflit → symptômes bizarres.';

  @override
  String get ipBasicsSection4Subtitle2 => 'Statique (IP fixe)';

  @override
  String get ipBasicsSection4SubBullet4 =>
      'Tu définis IP + masque (et éventuellement passerelle/DNS).';

  @override
  String get ipBasicsSection4SubBullet5 =>
      'Très utile pour : console, nodes, switch géré, AP Wi-Fi show.';

  @override
  String get ipBasicsSection4SubBullet6 =>
      'Risque : doublon d’IP si plan pas clair (conflit).';

  @override
  String get ipBasicsSection4Callout1Title => 'Passerelle (gateway)';

  @override
  String get ipBasicsSection4Bullet1 =>
      'C’est l’adresse du routeur : elle sert pour aller \"hors du réseau local\".';

  @override
  String get ipBasicsSection4Bullet2 =>
      'Si tu fais un réseau show isolé (sans Internet) → passerelle souvent inutile.';

  @override
  String get ipBasicsSection4Bullet3 =>
      'Mais si tu veux sortir vers un autre VLAN / Internet → indispensable.';

  @override
  String get ipBasicsSection4Callout2Title => 'DNS';

  @override
  String get ipBasicsSection4Bullet4 =>
      'DNS = \"annuaire\" : transforme un nom (ex: example.com) en IP.';

  @override
  String get ipBasicsSection4Bullet5 =>
      'En show (Art-Net/sACN), souvent inutile : tu travailles en IP direct.';

  @override
  String get ipBasicsSection4Bullet6 =>
      'Si tu utilises des services (MAJ, licences, time server, streaming) → DNS redevient utile.';

  @override
  String get ipBasicsSection4Subtitle3 => 'Règle simple (débutant-friendly)';

  @override
  String get ipBasicsSection4SubBullet7 =>
      'Petit show fermé : statique partout, pas de passerelle, pas de DNS.';

  @override
  String get ipBasicsSection4SubBullet8 =>
      'Show avec Internet / plusieurs réseaux : DHCP contrôlé + réservations DHCP, ou plan statique + routeur.';

  @override
  String get ipBasicsSection5Paragraph =>
      'Quand A veut parler à B, il regarde le masque :\n• Si B est dans le même sous-réseau → A envoie directement sur le réseau local.\n• Si B est hors sous-réseau → A envoie à la passerelle (routeur), qui s’occupe du reste.';

  @override
  String get ipBasicsSection5Callout1Title => 'Exemple (facile)';

  @override
  String get ipBasicsSection5Bullet1 => 'A = 192.168.0.10 /24';

  @override
  String get ipBasicsSection5Bullet2 =>
      'B = 192.168.0.50 /24 → même réseau → OK direct.';

  @override
  String get ipBasicsSection5Bullet3 =>
      'B = 192.168.1.50 /24 → réseau différent → besoin routeur/passerelle.';

  @override
  String get ipBasicsSection5Subtitle => 'Pourquoi ça \"ping\" pas ?';

  @override
  String get ipBasicsSection5SubBullet1 =>
      'Masque différent → A pense que B est \"ailleurs\" (ou inversement).';

  @override
  String get ipBasicsSection5SubBullet2 =>
      'Pas de passerelle → impossible de sortir du sous-réseau.';

  @override
  String get ipBasicsSection5SubBullet3 =>
      'Pare-feu PC → ping bloqué (Windows très fréquent).';

  @override
  String get ipBasicsSection5SubBullet4 =>
      'Câble / switch / VLAN : physiquement pas dans le même segment.';

  @override
  String get ipBasicsSection5Callout2Title =>
      'Broadcast vs unicast (bonus utile)';

  @override
  String get ipBasicsSection5Bullet4 =>
      'Unicast : vers une IP précise (propre).';

  @override
  String get ipBasicsSection5Bullet5 =>
      'Broadcast : \"à tous\" sur le sous-réseau (bruyant).';

  @override
  String get ipBasicsSection5Bullet6 =>
      'En show : broadcast peut marcher en petit, mais devient vite source de bruit en gros réseau.';

  @override
  String get ipBasicsSection6Subtitle1 =>
      'Plan A — ultra simple (un seul réseau /24)';

  @override
  String get ipBasicsSection6Code1 =>
      'Réseau : 192.168.10.0/24   (masque 255.255.255.0)\n\nConsole : 192.168.10.10\nPC (contrôle) : 192.168.10.20\nNode 1 : 192.168.10.101\nNode 2 : 192.168.10.102\nSwitch géré : 192.168.10.2\nPasserelle : (vide) ou 192.168.10.1 si routeur présent';

  @override
  String get ipBasicsSection6Callout1Title => 'Pourquoi ça marche bien';

  @override
  String get ipBasicsSection6Bullet1 =>
      'Tout le monde dans le même sous-réseau → aucune surprise.';

  @override
  String get ipBasicsSection6Bullet2 =>
      'Facile à expliquer, facile à dépanner.';

  @override
  String get ipBasicsSection6Bullet3 => 'Idéal débutant / petit à moyen show.';

  @override
  String get ipBasicsSection6Subtitle2 =>
      'Plan B — \"10.x\" quand tu veux grandir';

  @override
  String get ipBasicsSection6Code2 =>
      'Réseau : 10.10.0.0/16   (masque 255.255.0.0)\n\nConsole : 10.10.0.10\nPC : 10.10.0.20\nNodes : 10.10.1.10 → 10.10.1.200\nSwitch : 10.10.0.2';

  @override
  String get ipBasicsSection6Callout2Title => 'Quand l’utiliser';

  @override
  String get ipBasicsSection6Bullet4 =>
      'Quand tu as beaucoup d’équipements (ou plusieurs zones).';

  @override
  String get ipBasicsSection6Bullet5 =>
      'Quand tu prévois VLAN plus tard (lumière/vidéo/IT).';

  @override
  String get ipBasicsSection6Subtitle3 =>
      'Plan C — compat Art-Net \"2.x.x.x\" (legacy)';

  @override
  String get ipBasicsSection6Code3 =>
      'Réseau : 2.0.0.0/8   (masque 255.0.0.0)\n\nPC/console : 2.0.0.10\nNode 1 : 2.0.0.100\nNode 2 : 2.0.0.101\n\n⚠️ Réseau isolé, pas d’Internet, pas de routage.';

  @override
  String get ipBasicsSection6Callout3Title => 'Attention';

  @override
  String get ipBasicsSection6Bullet6 =>
      'Ce plan est pratique pour du matériel ancien / par défaut.';

  @override
  String get ipBasicsSection6Bullet7 =>
      'Mais évite de mélanger avec un LAN \"normal\" (192.168.x.x) sans routeur.';

  @override
  String get ipBasicsSection7Callout1Title => 'Symptômes → causes probables';

  @override
  String get ipBasicsSection7Bullet1 =>
      '\"Je vois le node mais ça répond pas\" → masque différent / VLAN / pare-feu.';

  @override
  String get ipBasicsSection7Bullet2 =>
      '\"Un appareil marche puis disparaît\" → DHCP instable / conflit d’IP.';

  @override
  String get ipBasicsSection7Bullet3 =>
      '\"Rien ne marche sauf sur le switch\" → IP pas dans le même réseau / mauvais câble / port VLAN.';

  @override
  String get ipBasicsSection7Bullet4 =>
      '\"Tout rame / pertes\" → broadcast/multicast trop large / switch bas de gamme / boucle réseau.';

  @override
  String get ipBasicsSection7Bullet5 =>
      '\"Ça marche en filaire mais pas en Wi-Fi\" → jitter / roaming / bande saturée / power saving.';

  @override
  String get ipBasicsSection7Subtitle => 'Méthode pro en 5 minutes';

  @override
  String get ipBasicsSection7SubBullet1 =>
      '1) Regarder IP + masque de la console/PC et du node.';

  @override
  String get ipBasicsSection7SubBullet2 =>
      '2) Vérifier : même sous-réseau ? (ex: 192.168.10.x /24)';

  @override
  String get ipBasicsSection7SubBullet3 =>
      '3) Ping (si possible) + test d’accès interface web du node.';

  @override
  String get ipBasicsSection7SubBullet4 =>
      '4) Si DHCP : lister qui a quelle IP (table DHCP) et vérifier doublons.';

  @override
  String get ipBasicsSection7SubBullet5 =>
      '5) Si sACN multicast : vérifier IGMP snooping/querier (sinon flood).';

  @override
  String get ipBasicsSection7Callout2Title => 'Piège très fréquent';

  @override
  String get ipBasicsSection7Bullet6 =>
      'Masque \"hérité\" sur un PC (255.255.0.0 au lieu de 255.255.255.0).';

  @override
  String get ipBasicsSection7Bullet7 =>
      'Résultat : tu crois être \"dans le même réseau\", mais pas comme l’autre appareil.';

  @override
  String get ipBasicsSection8Subtitle1 =>
      'Exercice 1 : même réseau ou pas ? (/24)';

  @override
  String get ipBasicsSection8SubBullet1 => 'A = 192.168.10.50 /24';

  @override
  String get ipBasicsSection8SubBullet2 =>
      'B = 192.168.10.200 /24 → ✅ même réseau';

  @override
  String get ipBasicsSection8SubBullet3 =>
      'B = 192.168.11.200 /24 → ❌ pas le même réseau';

  @override
  String get ipBasicsSection8Subtitle2 => 'Exercice 2 : /16 (255.255.0.0)';

  @override
  String get ipBasicsSection8SubBullet4 => 'A = 10.10.5.10 /16';

  @override
  String get ipBasicsSection8SubBullet5 =>
      'B = 10.10.200.20 /16 → ✅ même réseau (10.10.x.x)';

  @override
  String get ipBasicsSection8SubBullet6 =>
      'B = 10.11.200.20 /16 → ❌ pas le même réseau';

  @override
  String get ipBasicsSection8CalloutTitle => 'Astuce visuelle';

  @override
  String get ipBasicsSection8Bullet1 =>
      '/24 → les 3 premiers nombres identiques (A.B.C) = même réseau.';

  @override
  String get ipBasicsSection8Bullet2 =>
      '/16 → les 2 premiers nombres identiques (A.B) = même réseau.';

  @override
  String get ipBasicsSection8Bullet3 =>
      '/8 → le 1er nombre identique (A) = même réseau.';

  @override
  String get ipBasicsSection8Subtitle3 =>
      'Exercice 3 : éviter les IP \"bizarres\"';

  @override
  String get ipBasicsSection8SubBullet7 =>
      '0.x.x.x : réservé (pas une IP normale d’hôte).';

  @override
  String get ipBasicsSection8SubBullet8 =>
      '127.x.x.x : loopback (ton PC lui-même).';

  @override
  String get ipBasicsSection8SubBullet9 =>
      '169.254.x.x : auto-IP quand DHCP absent (APIPA) → signe de problème DHCP.';

  @override
  String get ipBasicsSection9CalloutTitle => 'Avant de chercher midi à 14h';

  @override
  String get ipBasicsSection9Bullet1 =>
      'Même sous-réseau = IP + masque cohérents.';

  @override
  String get ipBasicsSection9Bullet2 => 'Aucun doublon d’IP (conflit).';

  @override
  String get ipBasicsSection9Bullet3 =>
      'DHCP : OK si maîtrisé; sinon plan statique clair.';

  @override
  String get ipBasicsSection9Bullet4 =>
      'Pare-feu PC : peut bloquer ping / discovery.';

  @override
  String get ipBasicsSection9Bullet5 =>
      'Switch/VLAN : bon port, bon VLAN, pas de boucle.';

  @override
  String get ipBasicsSection9Bullet6 =>
      'sACN multicast : IGMP snooping/querier recommandés.';

  @override
  String get ipBasicsChecklistCopy =>
      'Réseau — Checklist rapide (IP)\n☐ Tous les appareils sont dans le même sous-réseau (IP + masque cohérents)\n☐ Pas de doublon d’IP (conflit)\n☐ DHCP : soit tout le monde en DHCP, soit plan statique clair (éviter mélange flou)\n☐ Pour Art-Net/sACN : réseau dédié ou VLAN si possible\n☐ Switch géré si multicast/IGMP (sACN)\n☐ Wi-Fi : éviter pour data show critique (jitter), préférer filaire\n☐ Test simple : ping + vérifier masque/passerelle';

  @override
  String get ipBasicsFooterNote =>
      'Objectif : comprendre assez pour câbler / config / dépanner vite en show.\nLes détails réseau peuvent être plus profonds, mais ces bases couvrent 90% des pannes terrain.';

  @override
  String get aboutDmxPainterTerm120 => 'TERM\n120Ω';

  @override
  String get aboutDmxPainterDaisyChainNote =>
      '✅ Daisy-chain\n❌ Pas de Y passif';

  @override
  String get aboutDmxPainterXlr5Title => 'XLR5 (DMX) — repère rapide';

  @override
  String get aboutDmxPainterPin1 => 'Pin 1 : Shield / masse';

  @override
  String get aboutDmxPainterPin2 => 'Pin 2 : Data−';

  @override
  String get aboutDmxPainterPin3 => 'Pin 3 : Data+';

  @override
  String get aboutDmxPainterPin45 => 'Pin 4/5 : \"data 2\" (rare / optionnel)';

  @override
  String get aboutDmxPainterXlr3Practice =>
      'En pratique : XLR3 souvent utilisé (1/2/3)';

  @override
  String get aboutDmxPainterLastFixture => 'DERNIER\nAPPAREIL';

  @override
  String get aboutDmxPainterTerminationLine =>
      'Terminaison = 120Ω en fin de ligne';

  @override
  String get aboutDmxPainter120Between => '120Ω\nentre\nData− et Data+';

  @override
  String get aboutDmxPainterOneTermination =>
      '✅ Une seule terminaison\n❌ Pas au milieu\n❌ Pas sur chaque branche';

  @override
  String get aboutDmxPainterConsoleIp => 'CONSOLE\nArt-Net / sACN';

  @override
  String get aboutDmxPainterSwitchSacn => 'SWITCH\n(IGMP pour sACN)';

  @override
  String get aboutDmxPainterNode1 => 'NODE 1\nDMX OUT';

  @override
  String get aboutDmxPainterNode2 => 'NODE 2\nDMX OUT';

  @override
  String get aboutDmxPainterFix => 'FIX';

  @override
  String get aboutDmxPainterManyUniverses =>
      '✅ Beaucoup d’univers\n✅ Nodes proches des machines';

  @override
  String get aboutArtnetSection2Paragraph =>
      'Ton objectif : que chaque univers émis par la source arrive au bon node (et au bon port DMX) sans ambiguïté. La plupart des pannes Art-Net = mauvais univers, mauvais subnet/net, ou broadcast qui sature.';

  @override
  String get aboutArtnetSection2CalloutTitle =>
      'Méthode simple (qui évite 80% des erreurs)';

  @override
  String get aboutArtnetSection2Bullet1 =>
      '1) Écris sur papier: \"Univers 1 → Node A port 1\", \"Univers 2 → Node A port 2\", etc.';

  @override
  String get aboutArtnetSection2Bullet2 =>
      '2) Mets des IP stables (DHCP réservé ou statiques).';

  @override
  String get aboutArtnetSection2Bullet3 =>
      '3) Préfère l’unicast si tu as plus d’un node ou un réseau partagé.';

  @override
  String get aboutArtnetSection2Subtitle1 => 'Broadcast vs Unicast';

  @override
  String get aboutArtnetSection2SubBullet1 =>
      'Broadcast : tu envoies à tout le monde → facile mais peut \"flood\" un switch.';

  @override
  String get aboutArtnetSection2SubBullet2 =>
      'Unicast : tu envoies vers l’IP du node → plus propre et prévisible.';

  @override
  String get aboutArtnetSection2SubBullet3 => 'En show: si doute → unicast.';

  @override
  String get aboutArtnetSection2Subtitle2 => 'Univers : pratique terrain';

  @override
  String get aboutArtnetSection2SubBullet4 =>
      'Garde une numérotation simple (ex: 1…N).';

  @override
  String get aboutArtnetSection2SubBullet5 =>
      'Évite \"un univers partout\" : documente tes mappings.';

  @override
  String get aboutArtnetSection2SubBullet6 =>
      'Sur certains setups, \"Net/Subnet/Universe\" existent : pense \"mapping\", pas \"magie\".';

  @override
  String get aboutArtnetSection3CalloutTitle =>
      'Les limites \"réelles\" (dans l’ordre)';

  @override
  String get aboutArtnetSection3Bullet1 =>
      'Wi-Fi : latence variable + pertes → flicker ou décrochages.';

  @override
  String get aboutArtnetSection3Bullet2 =>
      'Broadcast : surcharge un LAN (tout le monde reçoit tout).';

  @override
  String get aboutArtnetSection3Bullet3 =>
      'Switch \"bas de gamme\" : buffers limités, gestion multicast/broadcast médiocre.';

  @override
  String get aboutArtnetSection3Bullet4 =>
      'Nodes : limite firmware/CPU (nb d’univers, fréquence, options).';

  @override
  String get aboutArtnetSection3Bullet5 =>
      'PC/source : driver, charge CPU, antivirus, carte réseau, etc.';

  @override
  String get aboutArtnetSection3Subtitle1 => 'Vitesse de refresh';

  @override
  String get aboutArtnetSection3SubBullet1 =>
      'Le DMX \"classique\" est souvent ~20–44 fps selon trame.';

  @override
  String get aboutArtnetSection3SubBullet2 =>
      'Sur IP, tu peux envoyer plus, mais les nodes ne suivent pas toujours (et ce n’est pas toujours utile).';

  @override
  String get aboutArtnetSection3SubBullet3 =>
      'Stabilité > fréquence : mieux vaut stable à 30–40 fps que \"vite\" mais instable.';

  @override
  String get aboutArtnetSection3Subtitle2 => 'Règles simples';

  @override
  String get aboutArtnetSection3SubBullet4 => 'Réseau dédié (ou VLAN).';

  @override
  String get aboutArtnetSection3SubBullet5 => 'Unicast si plusieurs nodes.';

  @override
  String get aboutArtnetSection3SubBullet6 =>
      'Filaire pour les shows critiques.';

  @override
  String get aboutArtnetSection4Paragraph =>
      'Un node = IP → DMX. Il peut avoir 1, 2, 4, 8 ports DMX. La stabilité dépend du node ET du câblage DMX côté sortie (terminaison, topologie, splitters).';

  @override
  String get aboutArtnetSection4Subtitle1 => 'Nodes vs Splitters';

  @override
  String get aboutArtnetSection4SubBullet1 =>
      'Node : convertit IP→DMX (et parfois DMX→IP).';

  @override
  String get aboutArtnetSection4SubBullet2 =>
      'Splitter DMX : distribue une ligne DMX en branches (opto conseillé).';

  @override
  String get aboutArtnetSection4SubBullet3 =>
      'Bon design : IP jusqu’au plus près, puis DMX court et propre.';

  @override
  String get aboutArtnetSection4CalloutTitle =>
      'RDM sur Art-Net (support variable)';

  @override
  String get aboutArtnetSection4Bullet1 =>
      'Certains nodes supportent un \"RDM proxy\" : la console voit/configure les appareils RDM via IP.';

  @override
  String get aboutArtnetSection4Bullet2 =>
      'D’autres ne supportent RDM du tout, ou partiellement.';

  @override
  String get aboutArtnetSection4Bullet3 =>
      'Un splitter opto \"classique\" peut bloquer le retour RDM (selon modèle).';

  @override
  String get aboutArtnetSection4Bullet4 =>
      'Conseil: si tu veux RDM, choisis explicitement du matériel marqué RDM compatible.';

  @override
  String get aboutArtnetSection4Subtitle2 => 'Bon réflexe terrain';

  @override
  String get aboutArtnetSection4SubBullet4 =>
      'Si DMX instable : règle DMX d’abord (terminaison, câble, Y passif) puis seulement IP.';

  @override
  String get aboutArtnetSection4SubBullet5 =>
      'Si RDM instable : désactive RDM pour vérifier que le DMX pur est stable.';

  @override
  String get aboutArtnetSection5CalloutTitle => 'Symptômes → causes probables';

  @override
  String get aboutArtnetSection5Bullet1 =>
      'Flicker sur tout le plateau → Wi-Fi, broadcast flood, switch saturé.';

  @override
  String get aboutArtnetSection5Bullet2 =>
      'Un node OK, l’autre non → univers/mapping, IP, unicast mal configuré.';

  @override
  String get aboutArtnetSection5Bullet3 =>
      'Décrochages aléatoires → câble RJ45 défectueux, switch instable, PC qui droppe des paquets.';

  @override
  String get aboutArtnetSection5Bullet4 =>
      'Un seul port DMX d’un node KO → câble DMX, terminaison, appareil qui casse la ligne.';

  @override
  String get aboutArtnetSection5Bullet5 =>
      'RDM discovery impossible → node/splitter non compatible RDM, câblage DMX \"borderline\".';

  @override
  String get aboutArtnetSection5Subtitle => 'Méthode rapide';

  @override
  String get aboutArtnetSection5SubBullet1 =>
      '1) Passe en unicast vers un seul node (test simple).';

  @override
  String get aboutArtnetSection5SubBullet2 =>
      '2) Vérifie univers/mapping (papier + node config).';

  @override
  String get aboutArtnetSection5SubBullet3 =>
      '3) Test en filaire direct (PC → switch → node) avec câble connu OK.';

  @override
  String get aboutArtnetSection5SubBullet4 =>
      '4) Isole le DMX : node → 1 appareil + terminaison.';

  @override
  String get aboutArtnetSection6Subtitle1 =>
      'Architecture propre (IP → nodes → DMX court)';

  @override
  String get aboutArtnetSection6Subtitle2 => 'Broadcast vs Unicast (idée)';

  @override
  String get aboutArtnetAssetsCopyTitle => 'Assets recommandés (optionnels)';

  @override
  String get aboutArtnetExampleLabel => 'exemple';

  @override
  String get aboutArtnetAssetsCopyTooltip => 'Copier liste assets';

  @override
  String get aboutArtnetAssetsParagraph =>
      'Section prévue pour illustrer le réseau (RJ45, switch, câbles). Si les assets n’existent pas, l’app affiche un fallback propre.';

  @override
  String get aboutArtnetAssetsExamplesTitle => 'Exemples';

  @override
  String get aboutArtnetAssetsRj45Label => 'RJ45';

  @override
  String get aboutArtnetAssetsRj45Hint => 'Connecteur Ethernet';

  @override
  String get aboutArtnetAssetsSwitchLabel => 'Switch';

  @override
  String get aboutArtnetAssetsSwitchHint =>
      'Switch (idéalement géré si IGMP/VLAN)';

  @override
  String get aboutArtnetAssetsCableLabel => 'Câble Ethernet';

  @override
  String get aboutArtnetAssetsCableHint => 'Cat5e/Cat6 = base fiable';

  @override
  String get aboutArtnetChecklistCopyTitle => 'Art-Net — Checklist terrain';

  @override
  String get aboutArtnetChecklistCopyTooltip => 'Copier la checklist';

  @override
  String get aboutArtnetChecklistTitle => 'Avant de paniquer';

  @override
  String get aboutArtnetChecklistBullet1 => 'Unicast si plusieurs nodes.';

  @override
  String get aboutArtnetChecklistBullet2 =>
      'Réseau dédié (ou VLAN) si possible.';

  @override
  String get aboutArtnetChecklistBullet3 => 'Filaire pour show critique.';

  @override
  String get aboutArtnetChecklistBullet4 => 'Univers/mapping documentés.';

  @override
  String get aboutArtnetChecklistBullet5 =>
      'Test IP simple → 1 node → 1 appareil + terminaison.';

  @override
  String get aboutArtnetChecklistBullet6 =>
      'Si RDM: node \"RDM proxy\" confirmé + câblage DMX stable';

  @override
  String get aboutArtnetFooterNote =>
      'Info indicative (terrain). Selon nodes/switch/firmwares, le comportement peut varier.\nObjectif ici : comprendre et diagnostiquer vite.';

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
  String get aboutArtnetDiagramInfoLabel => 'IP long / DMX court';

  @override
  String get aboutArtnetDiagramSourceShortLabel => 'SOURCE';

  @override
  String get aboutArtnetDiagramNodeALabel => 'NODE A';

  @override
  String get aboutArtnetDiagramNodeBLabel => 'NODE B';

  @override
  String get aboutArtnetDiagramNodeCLabel => 'NODE C';

  @override
  String get aboutArtnetDiagramUnicastLabel => 'Unicast: paquets vers un node';

  @override
  String get aboutArtnetDiagramBroadcastLabel =>
      'Broadcast: tout le monde reçoit';

  @override
  String get aboutArtnetMissingAssetLabel => 'Asset manquant';

  @override
  String get aboutRegistryDmxTitle => 'DMX — fonctionnement (simple & complet)';

  @override
  String get aboutRegistryDmxSubtitle =>
      'Univers, adresses, trames, câblage RS-485, terminaison, erreurs terrain.\nInclut schémas + checklist.';

  @override
  String get aboutRegistryArtnetTitle =>
      'Art-Net — DMX sur IP (nodes, unicast/broadcast)';

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
  String get aboutNetworkToc4 => '4) IGMP (sACN multicast)';

  @override
  String get aboutNetworkToc5 => '5) Wi-Fi vs filaire';

  @override
  String get aboutNetworkToc6 => '6) Switch: ce qu’il faut';

  @override
  String get aboutNetworkToc7 => '7) Schémas';

  @override
  String get aboutNetworkToc8 => '8) Checklist';

  @override
  String get aboutNetworkBasicsPill1 => 'Dédié/VLAN';

  @override
  String get aboutNetworkBasicsPill2 => 'Filaire';

  @override
  String get aboutNetworkBasicsPill3 => 'IGMP si multicast';

  @override
  String get aboutNetworkBasicsParagraph =>
      'Un réseau lumière doit être prévisible: faible perte, faible jitter, architecture simple. Quand ça bug, c’est rarement \"le protocole\" et souvent l’infra (switch, Wi-Fi, boucles, flood).';

  @override
  String get aboutNetworkBasicsCalloutTitle => 'Règle de base';

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
      'Si tu ne maîtrises pas: réseau dédié \"physique\" est souvent plus simple.';

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
      'Sans querier: selon les switchs, les abonnements expirent et tu vois des \"glitches\".';

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
      'Pratique pour \"re-driver\" un signal sur de longues distances.';

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
      'Cherche un \"Y\" caché, un splitter non adapté, ou un mauvais adaptateur XLR.';

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
      'Multicast : un univers est un \"groupe\" réseau (les nodes s’abonnent).';

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
      'sACN : plus \"pro grands systèmes\", multicast + priorités, demande un réseau bien configuré.';

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
      'RÉSEAU — Checklist\n☐ Plan IP clair (plage / masques)\n☐ Switch correct (IGMP si sACN multicast)\n☐ VLAN si plusieurs \"mondes\" (lumière/vidéo/IT)\n☐ Câbles testés + étiquetés\n☐ Fibre : modules compatibles + connecteurs propres\n☐ Éviter boucles (STP) + éviter Wi-Fi public sur show LAN';

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
      'LAN = réseau local via switch (pas \"internet\").';

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
      'Évite les \"daisy-chain réseau\" au hasard.';

  @override
  String get aboutReseauSection1Bullet6 =>
      'Si possible : un réseau dédié show (pas le Wi-Fi public).';

  @override
  String get aboutReseauSection2Title => 'Repères rapides';

  @override
  String get aboutReseauSection2Bullet1 =>
      'Cat5e : 1 Gbit/s \"classique\" (jusqu’à 100m).';

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
      'Évite les connecteurs abîmés : un RJ45 \"fatigué\" = pannes fantômes.';

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
      'Le switch a un \"budget\" total (ex: 120W).';

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
      'Multimode (MM) : distances \"moyennes\" (souvent bâtiment / plateau).';

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
      'Switch \"cheap\" qui flood le multicast → réseau qui s’écroule.';

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
      'Sur gros shows : sACN + IGMP est souvent le choix \"propre\".';

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
      'sACN (E1.31) est un standard largement utilisé pour transporter des univers DMX sur IP. Il est souvent privilégié quand on veut une architecture réseau propre: multicast bien géré, priorités standardisées, et un comportement plus \"réseau pro\".';

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
      'Quand tu veux éviter le \"broadcast partout\".';

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
      'Tu patches \"Universe 0\" alors que le matériel attend une base 1.';

  @override
  String get aboutSacnSection2Bullet3 =>
      'Tu mélanges des conventions de numérotation entre outils.';

  @override
  String get aboutSacnSection3Paragraph =>
      'sACN utilise souvent le multicast: chaque univers \"vit\" sur un groupe multicast, et les nodes s’abonnent aux univers dont ils ont besoin.';

  @override
  String get aboutSacnSection3Title =>
      'IGMP snooping (pourquoi c’est important)';

  @override
  String get aboutSacnSection3Bullet1 =>
      'Sans IGMP: le switch \"flood\" le multicast partout → surcharge possible.';

  @override
  String get aboutSacnSection3Bullet2 =>
      'Avec IGMP: le switch envoie seulement aux ports abonnés → réseau stable.';

  @override
  String get aboutSacnSection3Bullet3 =>
      'Sur gros volumes: IGMP est souvent LA différence entre \"ça marche\" et \"c’est l’enfer\".';

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
      'Deux sources non voulues sur le même univers → \"ça se bat\".';

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
      'Comme avec Art-Net, le RDM \"sur IP\" dépend souvent d’un mécanisme de proxy dans les nodes. Le standard sACN n’implique pas automatiquement que ton node fait du RDM correctement.';

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
  String get aboutSacnChecklistTitle => 'Avant d’accuser \"le protocole\"';

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
      'Astuce : pour un repérage \"utilisable sans éclairage\", on vise souvent > 100–300 lx. Pour un travail fin, plutôt 500 lx et +.';

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
      'Astronomique (-18°) : le ciel est considéré comme \"noir\" (hors pollution lumineise).';

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
  String get patchMvrViewTable => 'Tableur';

  @override
  String get patchMvrViewVisual => 'Visuel';

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
  String get consoleMa3ForgeTitle => 'MA3 Plugin Forge';

  @override
  String get consoleMa3ForgeSubtitle =>
      'Génère des plugins Lua pour grandMA3 avec IA';

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
  String get subscriptionHeadlineAllTitle => 'Choisissez votre formule';

  @override
  String get subscriptionHeadlineAllSubtitle =>
      'Retrouvez ici vos achats actuels et les abonnements encore disponibles.';

  @override
  String subscriptionHeadlineUnlock(Object module) {
    return 'Débloquez $module';
  }

  @override
  String get subscriptionHeadlineVideoSubtitle =>
      'Vous pouvez acheter Vidéo uniquement, ou choisir Pro pour tout déverrouiller.';

  @override
  String get subscriptionHeadlineLightSubtitle =>
      'Vous pouvez acheter Lumière uniquement, ou choisir Pro pour tout déverrouiller.';

  @override
  String get subscriptionHeadlineLaserSubtitle =>
      'Vous pouvez acheter Laser uniquement, ou choisir Pro pour tout déverrouiller.';

  @override
  String get subscriptionHeadlineConsoleSubtitle =>
      'Vous pouvez acheter Console uniquement, ou choisir Pro pour tout déverrouiller.';

  @override
  String get subscriptionHeadlineProSubtitle =>
      'Accès complet à toutes les sections avancées.';

  @override
  String get subscriptionStoreUnavailable =>
      'Boutique indisponible pour le moment.';

  @override
  String get subscriptionLoadError => 'Impossible de charger les abonnements.';

  @override
  String get subscriptionRestorePurchases => 'Restaurer mes achats';

  @override
  String get subscriptionPrivacy => 'Confidentialité';

  @override
  String get subscriptionTerms => 'CGU';

  @override
  String get subscriptionBestValue => 'MEILLEURE VALEUR';

  @override
  String get subscriptionOwned => 'Acheté';

  @override
  String get subscriptionIncludedInPro => 'Inclus dans Pro';

  @override
  String get subscriptionProductUnavailable => 'Produit indisponible.';

  @override
  String get subscriptionSubscribeAll => 'S\'abonner — Tout déverrouiller';

  @override
  String subscriptionSubscribeModule(Object module) {
    return 'S\'abonner — $module';
  }

  @override
  String get subscriptionCategoryVideoTitle => 'Vidéo';

  @override
  String get subscriptionCategoryLightTitle => 'Lumière';

  @override
  String get subscriptionCategoryLaserTitle => 'Laser';

  @override
  String get subscriptionCategoryConsoleTitle => 'Console';

  @override
  String get subscriptionCategoryProTitle => 'ShowTech Tools Pro';

  @override
  String get subscriptionCategoryVideoDescription =>
      'Accès à la section Vidéo.';

  @override
  String get subscriptionCategoryLightDescription =>
      'Accès à la section Lumière.';

  @override
  String get subscriptionCategoryLaserDescription =>
      'Accès à la section Laser.';

  @override
  String get subscriptionCategoryConsoleDescription =>
      'Accès à la section Console.';

  @override
  String get subscriptionCategoryProDescription =>
      'Accès complet à toutes les sections.';

  @override
  String get electricityFreeSection => 'Gratuit';

  @override
  String get electricityProSection => 'Abonnement Électricité';

  @override
  String get riggingFreeSection => 'Gratuit';

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
  String get homeElectricityTitle => 'Électricité';

  @override
  String get homeElectricitySubtitle =>
      'Puissance, courant, sections de câble et autonomie UPS.';

  @override
  String get subscriptionCategoryElectricityTitle => 'Électricité';

  @override
  String get subscriptionCategoryElectricityDescription =>
      'Outils électriques pour la puissance, les phases, les câbles et l’UPS.';

  @override
  String get subscriptionCategoryRiggingTitle => 'Rigging';

  @override
  String get subscriptionCategoryRiggingDescription =>
      'Outils de rigging pour bridle, angles et vérification WLL / CMU.';

  @override
  String get subscriptionHeadlineElectricitySubtitle =>
      'Débloque tous les outils électriques professionnels.';

  @override
  String get subscriptionHeadlineRiggingSubtitle =>
      'Débloque tous les outils de rigging professionnels.';

  @override
  String get electricityTitle => 'Électricité';

  @override
  String get electricityToolPowerCurrentTitle => 'Puissance / courant';

  @override
  String get electricityToolPowerCurrentSubtitle =>
      'Calculer puissance, courant, tension ou énergie en mono ou triphasé.';

  @override
  String get electricityToolPhasePowerTitle => 'Puissance par phase';

  @override
  String get electricityToolPhasePowerSubtitle =>
      'Répartir une puissance totale et lire le courant par phase.';

  @override
  String get electricityToolLoadBalancerTitle => 'Répartition de charge';

  @override
  String get electricityToolLoadBalancerSubtitle =>
      'Ajouter des fixtures depuis le catalogue, assigner par phase et vérifier l\'ampérage de ton tableau.';

  @override
  String get electricityToolGeneratorTitle => 'Groupe électrogène';

  @override
  String get electricityPowerFactorToolTitle =>
      'Facteur de puissance (kVA ↔ kW)';

  @override
  String get electricityToolPowerFactorSubtitle =>
      'Convertit puissance apparente (kVA), active (kW) et cos φ dans les deux sens, avec la puissance réactive (kVAR).';

  @override
  String get electricityPowerFactorModeTitle => 'Sens de calcul';

  @override
  String get electricityPowerFactorModeKvaToKw => 'kVA → kW';

  @override
  String get electricityPowerFactorModeKwToKva => 'kW → kVA';

  @override
  String get electricityPowerFactorInputsTitle => 'Données connues';

  @override
  String get electricityPowerFactorApparentLabel => 'Puissance apparente';

  @override
  String get electricityPowerFactorApparentHint => 'Ex : 10';

  @override
  String get electricityPowerFactorActiveLabel => 'Puissance active';

  @override
  String get electricityPowerFactorActiveHint => 'Ex : 8';

  @override
  String get electricityPowerFactorCosPhiLabel =>
      'Facteur de puissance (cos φ)';

  @override
  String get electricityPowerFactorCosPhiHint => '0.1 – 1.0, ex : 0.8';

  @override
  String get electricityPowerFactorResultsTitle => 'Résultats';

  @override
  String get electricityPowerFactorReactiveLabel => 'Puissance réactive';

  @override
  String get electricityPowerFactorAngleLabel => 'Angle de déphasage';

  @override
  String get electricityPowerFactorEnterValues =>
      'Renseignez les valeurs pour voir le résultat.';

  @override
  String get electricityPowerFactorFormulaNote =>
      'kW = kVA × cos φ · kVA = kW / cos φ · kVAR = √(kVA² − kW²). cos φ = 1 correspond à une charge purement résistive (aucune puissance réactive).';

  @override
  String get electricityToolGeneratorSubtitle =>
      'Dimensionnement : puissance active → kVA, foisonnement, marge de sécurité, taille standard recommandée.';

  @override
  String get electricityGeneratorInputsTitle => 'Charge à alimenter';

  @override
  String get electricityGeneratorActivePowerLabel =>
      'Puissance active installée';

  @override
  String get electricityGeneratorActivePowerHint =>
      'Somme des puissances actives (voir répartiteur de charges)';

  @override
  String get electricityGeneratorCosPhiLabel => 'Cos φ moyen';

  @override
  String get electricityGeneratorCosPhiHint =>
      '0,85–0,95 typique (gradateurs, LED, ampli)';

  @override
  String get electricityGeneratorDiversityLabel => 'Facteur de foisonnement';

  @override
  String get electricityGeneratorDiversityHint =>
      '% de la puissance installée réellement sollicitée en simultané';

  @override
  String get electricityGeneratorMarginLabel => 'Marge de sécurité';

  @override
  String get electricityGeneratorMarginHint =>
      'Headroom recommandé pour démarrages et pointes';

  @override
  String get electricityGeneratorFuelRateLabel => 'Consommation spécifique';

  @override
  String get electricityGeneratorFuelRateHint =>
      '≈0,25 L/kWh typique pour un diesel bien chargé';

  @override
  String get electricityGeneratorResultsTitle => 'Groupe recommandé';

  @override
  String get electricityGeneratorRecommendedLabel =>
      'Taille standard recommandée';

  @override
  String get electricityGeneratorRecommendedOverMax =>
      '> 800 kVA — dimensionnement sur mesure, consultez un loueur';

  @override
  String get electricityGeneratorApparentNeededLabel =>
      'Puissance apparente nécessaire';

  @override
  String get electricityGeneratorCurrentLabel => 'Courant estimé en sortie';

  @override
  String get electricityGeneratorFuelPerHourLabel => 'Consommation estimée';

  @override
  String get electricityGeneratorFuelPerShowLabel => 'Sur 8 h de show';

  @override
  String get electricityGeneratorEnterValues =>
      'Saisissez la puissance active pour calculer';

  @override
  String get electricityGeneratorDisclaimer =>
      'Estimation indicative — vérifiez toujours avec les préconisations du loueur/fabricant du groupe (altitude, température, charges non-linéaires).';

  @override
  String get electricityToolCableSectionTitle => 'Section de câble';

  @override
  String get electricityToolCableSectionSubtitle =>
      'Calculer une section selon courant ou puissance, longueur, chute de tension et référence câble.';

  @override
  String get electricityToolUpsTitle => 'Autonomie UPS';

  @override
  String get electricityToolUpsSubtitle =>
      'Estimer l’autonomie d’une batterie ou d’un UPS selon la charge.';

  @override
  String get electricityInputsTitle => 'Entrées';

  @override
  String get electricityResultsTitle => 'Résultats';

  @override
  String get electricityEnterValuesToCalculate =>
      'Entre des valeurs valides pour calculer.';

  @override
  String get electricityTotalPowerLabel => 'Puissance totale';

  @override
  String get electricityTotalPowerHint => 'Ex. 22000';

  @override
  String get electricityPowerPerPhaseLabel => 'Puissance par phase';

  @override
  String get electricityCurrentPerPhaseLabel => 'Courant par phase';

  @override
  String get electricityCurrentLabel => 'Courant';

  @override
  String get electricityPhaseCountLabel => 'Nombre de phases';

  @override
  String get electricityConsumptionCurrentLabel =>
      'Consommation / courant réel';

  @override
  String get electricityConsumptionCurrentHint => 'Ex. 32';

  @override
  String get electricityBreakerSizeLabel => 'Taille du disjoncteur';

  @override
  String get electricityBreakerSizeHint => 'Ex. 32';

  @override
  String get electricityCableLengthLabel => 'Longueur du câble';

  @override
  String get electricityCableLengthHint => 'Ex. 30';

  @override
  String get electricityAllowedVoltageDropLabel => 'Chute de tension max.';

  @override
  String get electricityAllowedVoltageDropHint => 'Ex. 3';

  @override
  String get electricityRecommendedCableSectionLabel => 'Section recommandée';

  @override
  String get electricityMaxCurrentForSectionLabel => 'Courant admissible';

  @override
  String get electricityVoltageDropLabel => 'Chute de tension';

  @override
  String get electricityBreakerCheckLabel => 'Vérification disjoncteur';

  @override
  String get electricityStatusOk => 'OK';

  @override
  String get electricityStatusWarning => 'À vérifier';

  @override
  String get electricityImportantNoteTitle => 'Note importante';

  @override
  String get electricityCableSectionDisclaimer =>
      'Calcul indicatif basé sur un tableau de référence inspiré IEC 60364-5-52. Vérifie toujours le RGIE/AREI, le mode de pose réel, la température, le groupement de câbles et la protection avec un électricien qualifié.';

  @override
  String get electricityConsumptionInputTypeTitle => 'Valeur connue';

  @override
  String get electricityInputCurrent => 'Courant (A)';

  @override
  String get electricityInputPower => 'Puissance (W)';

  @override
  String get electricityVoltageLabel => 'Tension (U)';

  @override
  String get electricityVoltageHint => 'Ex. 230 ou 400';

  @override
  String get electricityPowerFactorLabel => 'Facteur de puissance (cos φ)';

  @override
  String get electricityPowerFactorHint => 'Ex. 1.0';

  @override
  String get electricityCableReferenceTitle => 'Référence câble';

  @override
  String get electricityCopper => 'Cuivre';

  @override
  String get electricityAluminium => 'Aluminium';

  @override
  String get electricityInsulationPvc => 'PVC 70 °C';

  @override
  String get electricityInsulationXlpe => 'XLPE 90 °C';

  @override
  String get electricityInstallConduit => 'Conduit';

  @override
  String get electricityInstallFreeAir => 'Air libre';

  @override
  String get electricityCalculatedCurrentLabel => 'Courant calculé';

  @override
  String get electricityRecommendedBreakerLabel => 'Disjoncteur recommandé';

  @override
  String get electricityNoStandardBreaker => 'Aucun calibre standard adapté';

  @override
  String get electricityStatusLabel => 'Statut';

  @override
  String get electricityCircuitTypeTitle => 'Type de circuit';

  @override
  String get electricitySinglePhase => 'Monophasé';

  @override
  String get electricityThreePhase => 'Triphasé';

  @override
  String get electricityResultActivePower => 'Puissance active';

  @override
  String get electricityResultCurrent => 'Courant';

  @override
  String get electricityResultVoltage => 'Tension';

  @override
  String get electricityResultEnergy => 'Énergie';

  @override
  String get electricityInsufficient => 'Valeurs insuffisantes';

  @override
  String get electricityCalcPower => 'Puissance';

  @override
  String get electricityCalcCurrent => 'Courant';

  @override
  String get electricityCalcVoltage => 'Tension';

  @override
  String get electricityCalcEnergy => 'Énergie';

  @override
  String get electricityRef16AMono => '16 A mono';

  @override
  String get electricityRef32AMono => '32 A mono';

  @override
  String get electricityRef32ATri => '32 A tri';

  @override
  String get electricityRef63ATri => '63 A tri';

  @override
  String get electricityRef125ATri => '125 A tri';

  @override
  String get electricityFormulaTri => 'P = √3 × U × I × cos φ';

  @override
  String get electricityFormulaMono => 'P = U × I × cos φ';

  @override
  String get electricityFormulaTriDesc =>
      'Formule triphasée pour une charge équilibrée.';

  @override
  String get electricityFormulaMonoDesc => 'Formule monophasée.';

  @override
  String get electricityCircuitType => 'Type de circuit';

  @override
  String get electricityMono => 'Mono';

  @override
  String get electricityMonoDesc => 'Circuit monophasé 230 V.';

  @override
  String get electricityThreePhaseDesc => 'Circuit triphasé 400 V.';

  @override
  String get electricityCalcFor => 'Calculer';

  @override
  String get electricityFieldPower => 'Puissance';

  @override
  String get electricityFieldPowerHint => 'Ex. 3680';

  @override
  String get electricityFieldCurrent => 'Courant';

  @override
  String get electricityFieldCurrentHint => 'Ex. 16';

  @override
  String get electricityFieldVoltage => 'Tension';

  @override
  String get electricityFieldVoltageHint => 'Ex. 230';

  @override
  String get electricityFieldDuration => 'Durée';

  @override
  String get electricityFieldDurationHint => 'Ex. 2';

  @override
  String get electricityFieldPf => 'cos φ';

  @override
  String get electricityFieldPfHint => 'Ex. 1.0';

  @override
  String get electricityCalculate => 'Calculer';

  @override
  String get electricityRefTitle => 'Références rapides';

  @override
  String electricityUpsEnergyAvail(String energy) {
    return '$energy Wh disponibles';
  }

  @override
  String get electricityUpsBatterySection => 'Batterie';

  @override
  String get electricityUpsCalculate => 'Calculer l’autonomie';

  @override
  String get electricityUpsCapacityHint => 'Ex. 100';

  @override
  String get electricityUpsCapacityLabel => 'Capacité';

  @override
  String get electricityUpsCountHint => 'Ex. 1';

  @override
  String get electricityUpsCountLabel => 'Nombre de batteries';

  @override
  String get electricityUpsEfficiencyHint => 'Ex. 85';

  @override
  String get electricityUpsEfficiencyLabel => 'Rendement';

  @override
  String get electricityUpsLoadDesc => 'Puissance consommée par l’équipement.';

  @override
  String get electricityUpsLoadHint => 'Ex. 500';

  @override
  String get electricityUpsLoadLabel => 'Charge';

  @override
  String get electricityUpsLoadSectionTitle => 'Charge à alimenter';

  @override
  String get electricityUpsRef1 => 'Wh disponibles';

  @override
  String get electricityUpsRef1Detail =>
      'Capacité × tension × nombre × rendement.';

  @override
  String get electricityUpsRef2 => 'Autonomie';

  @override
  String get electricityUpsRef2Detail =>
      'Énergie disponible divisée par la charge.';

  @override
  String get electricityUpsRef3Title => 'Résultat indicatif';

  @override
  String get electricityUpsRef3Value =>
      'La valeur réelle dépend du rendement, de l’état des batteries et de la charge.';

  @override
  String get electricityUpsRefTitle => 'Références';

  @override
  String get electricityUpsVoltageHint => 'Ex. 12';

  @override
  String get electricityUpsVoltageLabel => 'Tension batterie';

  @override
  String get riggingToolBridleTitle => 'Bridle 2 points';

  @override
  String get riggingToolBridleSubtitle =>
      'Calcul complet d’un bridle : longueurs, angles, tensions et statut de sécurité.';

  @override
  String get riggingToolAngleFactorTitle => 'Facteur d’angle';

  @override
  String get riggingToolAngleFactorSubtitle =>
      'Voir rapidement l’effet de l’angle sur la tension dans les brins.';

  @override
  String get riggingToolMultiPointTitle => 'Bridage multi-points';

  @override
  String get riggingToolMultiPointSubtitle =>
      'Tension par brin pour un bridage symétrique à 2-8 points, avec vérification WLL.';

  @override
  String get riggingLegCountLabel => 'Nombre de brins';

  @override
  String get riggingWllPerLegLabel => 'WLL par brin';

  @override
  String get riggingMultiPointSymmetricNote =>
      'Calcul valable pour un bridage symétrique : brins de même longueur, charge centrée, tension répartie également. Pour une configuration asymétrique ou complexe, fais appel à un rigger qualifié ou un logiciel certifié.';

  @override
  String get riggingToolHoistTitle => 'Sélection de palan';

  @override
  String get riggingToolHoistSubtitle =>
      'Charge à lever → taille de palan standard recommandée, avec marge de sécurité.';

  @override
  String get riggingHoistRecommendedLabel => 'Palan recommandé';

  @override
  String get riggingHoistOverMaxLabel =>
      '> 10 000 kg — hors gamme standard, consultez un spécialiste levage';

  @override
  String get riggingHoistAvailabilityNote =>
      'Tailles standard indicatives (0,125 à 10 t) — la disponibilité réelle dépend du fabricant et du loueur.';

  @override
  String get riggingToolWllTitle => 'Vérification WLL / CMU';

  @override
  String get riggingToolWllSubtitle =>
      'Comparer une charge appliquée avec la capacité du matériel.';

  @override
  String get riggingToolLengthTitle => 'Longueur bridle';

  @override
  String get riggingToolLengthSubtitle =>
      'Calculer les longueurs et angles sans calcul de charge.';

  @override
  String get riggingKnownDrop => 'Flèche';

  @override
  String get riggingKnownAngle => 'Angle';

  @override
  String get riggingKnownLength => 'Longueur';

  @override
  String get riggingAngleFromHorizontalLabel => 'Angle depuis l’horizontale';

  @override
  String get riggingLegLengthKnownLabel => 'Longueur d’un brin';

  @override
  String get riggingLoadWeightLabel => 'Poids de la charge';

  @override
  String get riggingLoadShortLabel => 'Charge';

  @override
  String get riggingPointALabel => 'A';

  @override
  String get riggingPointBLabel => 'B';

  @override
  String get riggingTensionLabel => 'Tension';

  @override
  String get riggingTensionLeftLabel => 'Tension gauche';

  @override
  String get riggingTensionRightLabel => 'Tension droite';

  @override
  String get riggingTensionPerLegLabel => 'Tension par brin';

  @override
  String get riggingStatusOk => 'OK';

  @override
  String get riggingStatusWatch => 'À surveiller';

  @override
  String get riggingStatusHigh => 'Élevé';

  @override
  String get riggingStatusDanger => 'Dangereux';

  @override
  String get riggingStatusOkDescription =>
      'Angle confortable. La tension reste raisonnable.';

  @override
  String get riggingStatusWatchDescription =>
      'Angle utilisable, mais la tension commence à augmenter.';

  @override
  String get riggingStatusHighDescription =>
      'Angle faible. La tension augmente fortement.';

  @override
  String get riggingStatusDangerDescription =>
      'Angle très faible. Configuration à éviter.';

  @override
  String get riggingSafetyDisclaimer =>
      'Résultat indicatif. Vérifie toujours la CMU/WLL réelle, les coefficients de sécurité et les règles applicables.';

  @override
  String get riggingInvalidInputsMessage =>
      'Entre des valeurs positives et cohérentes.';

  @override
  String get riggingAngleFactorLabel => 'Facteur multiplicateur';

  @override
  String get riggingAngleFactorExplanation =>
      'Plus l’angle est faible par rapport à l’horizontale, plus la tension dans chaque brin augmente.';

  @override
  String get riggingWllLabel => 'WLL / CMU du matériel';

  @override
  String get riggingAppliedLoadLabel => 'Charge appliquée';

  @override
  String get riggingSafetyFactorLabel => 'Facteur de sécurité';

  @override
  String get riggingRequiredLoadLabel => 'Charge à vérifier';

  @override
  String get riggingWllUsageLabel => 'Utilisation WLL';

  @override
  String get riggingMarginLabel => 'Marge restante';

  @override
  String get riggingWllStatusOkDescription =>
      'La capacité du matériel est suffisante pour cette charge.';

  @override
  String get riggingWllStatusWatchDescription =>
      'La capacité est encore suffisante, mais la marge est faible.';

  @override
  String get riggingWllStatusDangerDescription =>
      'La charge dépasse la capacité indiquée.';

  @override
  String get riggingLengthDifferenceLabel => 'Différence de longueur';

  @override
  String get riggingCalculationModeLabel => 'Type de calcul';

  @override
  String get riggingGeometryOnlyLabel => 'Sans charge';

  @override
  String get riggingWithLoadLabel => 'Avec charge';

  @override
  String get riggingGeometryOnlyDescription =>
      'Mode géométrie uniquement : longueurs, flèche et angles. Aucun calcul de tension ou de charge.';

  @override
  String get riggingKnownInputLabel => 'Je connais';

  @override
  String get homeConversionsTitle => 'Conversions';

  @override
  String get homeConversionsSubtitle =>
      'Unités, distance, vidéo, audio, DMX et conversions terrain.';

  @override
  String get conversionsTitle => 'Conversions';

  @override
  String get conversionsDistanceTitle => 'Distance';

  @override
  String get conversionsTemperatureTitle => 'Température';

  @override
  String get conversionsAnglesTitle => 'Angles';

  @override
  String get conversionsVideoTitle => 'Vidéo';

  @override
  String get conversionsAudioTitle => 'Audio';

  @override
  String get conversionsDmxTitle => 'DMX';

  @override
  String get conversionsSwap => 'Inverser';

  @override
  String get conversionsDisclaimer =>
      'Indication uniquement. Vérifie toujours les valeurs critiques avec la documentation constructeur.';

  @override
  String get conversionMetersFeet => 'Mètres <> feet';

  @override
  String get conversionCentimetersInches => 'Centimètres <> pouces';

  @override
  String get conversionMetersYards => 'Mètres <> yards';

  @override
  String get conversionCelsiusFahrenheit => 'Celsius <> Fahrenheit';

  @override
  String get conversionDegreesRadians => 'Degrés <> radians';

  @override
  String get conversionSlopePercentDegrees => 'Pente % <> degrés';

  @override
  String get conversionNitsFootLambert => 'Nits <> foot-lambert';

  @override
  String get conversionFpsFrameTime => 'FPS <> durée image';

  @override
  String get conversionBpmMs => 'BPM <> millisecondes';

  @override
  String get conversionDelayDistance => 'Délai <> distance';

  @override
  String get conversionDmxPercent => 'DMX <> %';

  @override
  String get conversionEightBitSixteenBit => '8 bit <> 16 bit';

  @override
  String get subscriptionDurationYear => 'Abonnement 1 an';

  @override
  String get conversionAudioLevel => 'dBu / dBV / V';

  @override
  String get conversionDmxAbsolute => 'Univers <> DMX absolu';

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
  String get gdtfSearchTab => 'Recherche';

  @override
  String get gdtfGenerateFromPdfTab => 'Générer depuis PDF';

  @override
  String get gdtfSearchHint => 'ex: Martin MAC Aura, Chauvet Rogue…';

  @override
  String get gdtfFixtureNameLabel => 'Nom de la fixture';

  @override
  String get gdtfSearchInfo =>
      'Recherche dans la base GDTF Share (6000+ fixtures).\nSi introuvable, utilise l\'onglet \"Générer depuis PDF\".';

  @override
  String get gdtfNoFixtureFound => 'Aucune fixture trouvée';

  @override
  String get gdtfNoFixtureFoundHelp =>
      'Tu peux générer un GDTF depuis le PDF du manuel.';

  @override
  String get gdtfGenerateFromPdfTitle => 'Générer un GDTF depuis un PDF';

  @override
  String get gdtfGenerateFromPdfIntro =>
      'Upload le manuel technique de ta fixture. L\'IA extrait les modes DMX — tu vérifies et corriges avant de générer le fichier.\n\n⚠️ Clé du succès : saisis le nom exact de la machine tel qu\'il apparaît dans le manuel. Et si tu ajoutes des modes manuellement, utilise les noms exacts des modes DMX — sinon l\'IA ne retrouve pas les bonnes données.';

  @override
  String get gdtfManufacturerHint => 'ex: Martin, Chauvet, Robe…';

  @override
  String get gdtfModelHint => 'ex: MAC Aura XIP, Rogue R2X…';

  @override
  String get gdtfSelectManualPdf => 'Sélectionner le PDF du manuel';

  @override
  String get gdtfDetectingModes => 'Détection des modes…';

  @override
  String get gdtfAnalyzePdf => 'Analyser le PDF';

  @override
  String get gdtfAnalyzePdfHelp =>
      'L\'IA détecte les modes DMX disponibles dans le manuel. Tu choisis ensuite ceux à extraire avant de générer le fichier.';

  @override
  String get gdtfBackToForm => 'Revenir au formulaire';

  @override
  String gdtfDetectedModesInManual(int count) {
    return '$count mode(s) DMX détecté(s) dans le manuel';
  }

  @override
  String get gdtfSearchModeHint => 'Rechercher un mode…';

  @override
  String get gdtfSelectAll => 'Tout';

  @override
  String get gdtfSelectNone => 'Aucun';

  @override
  String gdtfSelectedModesCount(int selected, int total) {
    return '$selected sélectionné(s) sur $total';
  }

  @override
  String get gdtfNoModeMatchesSearch =>
      'Aucun mode ne correspond à la recherche.';

  @override
  String gdtfDmxChannelCount(int count) {
    return '$count canaux DMX';
  }

  @override
  String get gdtfExtractionInProgressLong =>
      'Extraction en cours… cela peut prendre jusqu\'à 10 minutes selon le manuel. Ne ferme pas l\'app.';

  @override
  String get gdtfExtractionMayTakeLong =>
      'L\'extraction peut prendre jusqu\'à 10 minutes selon la taille du manuel et le nombre de modes sélectionnés.';

  @override
  String get gdtfExtractingChannels => 'Extraction des canaux…';

  @override
  String gdtfExtractModes(int count) {
    return 'Extraire $count mode(s)';
  }

  @override
  String get gdtfBackToModeSelection => 'Revenir à la sélection des modes';

  @override
  String gdtfDetectedModesCount(int count) {
    return '$count mode(s) détecté(s)';
  }

  @override
  String gdtfUnextractedModesCount(int count) {
    return '$count mode(s) non extraits';
  }

  @override
  String get gdtfGenerating => 'Génération…';

  @override
  String get gdtfGenerateGdtfFile => 'Générer le fichier .gdtf';

  @override
  String get gdtfModeNameHint => 'Nom du mode';

  @override
  String gdtfChannelCount(int count) {
    return '$count canaux';
  }

  @override
  String get gdtfChannelShort => 'Ch';

  @override
  String get gdtfBits => 'Bits';

  @override
  String get gdtfName => 'Nom';

  @override
  String get gdtfDefaultValueLabel => 'Valeur par défaut (0-255) :';

  @override
  String get gdtfValueRangesLabel => 'Plages de valeurs / Sous-fonctions :';

  @override
  String get gdtfValueRangesHint =>
      'ex: 0-9=fermé, 10-100=strobe lent, 255=ouvert';

  @override
  String get gdtfAddChannel => 'Ajouter un canal';

  @override
  String get gdtfFileGenerated => 'Fichier généré !';

  @override
  String get gdtfShareGdtfFile => 'Partager le fichier .gdtf';

  @override
  String get gdtfGenerateAnotherFile => 'Générer un autre fichier';

  @override
  String get gdtfGmailIosTitle => 'Gmail sur iOS ? Lis ça 👀';

  @override
  String get gdtfGmailIosWarning =>
      'Gmail sur iOS bloque souvent les pièces jointes .gdtf (\"impossible à joindre le fichier\"). Astuce : renomme le fichier en .zip avant de l\'envoyer — le destinataire le renomme en .gdtf après réception. WhatsApp, Messenger et AirDrop fonctionnent sans souci.';

  @override
  String get gdtfDownload => 'Télécharger';

  @override
  String gdtfModeFootprint(String name, int count) {
    return '$name (${count}ch)';
  }

  @override
  String gdtfDownloadingFixture(String fixture) {
    return 'Téléchargement de $fixture…';
  }

  @override
  String gdtfErrorStatus(int statusCode) {
    return 'Erreur $statusCode';
  }

  @override
  String gdtfErrorStatusParentheses(int statusCode) {
    return 'Erreur ($statusCode)';
  }

  @override
  String gdtfNetworkError(String error) {
    return 'Erreur réseau : $error';
  }

  @override
  String gdtfErrorDetails(String error) {
    return 'Erreur : $error';
  }

  @override
  String get gdtfErrorFillManufacturerAndModel =>
      'Remplis le fabricant et le modèle.';

  @override
  String get gdtfErrorSelectPdf => 'Sélectionne un fichier PDF.';

  @override
  String get gdtfErrorCannotExtractDmxPages =>
      'Impossible d\'extraire les pages DMX du PDF.';

  @override
  String get gdtfUnknownError => 'Erreur inconnue';

  @override
  String get gdtfUnknownErrorLowercase => 'erreur inconnue';

  @override
  String get gdtfNoDmxModeDetected => 'Aucun mode DMX détecté dans le manuel.';

  @override
  String get gdtfErrorSelectAtLeastOneMode =>
      'Sélectionne au moins un mode à extraire.';

  @override
  String get gdtfErrorManualDataLost =>
      'Données du manuel perdues, relance l\'analyse.';

  @override
  String get mireVideoPageTitle => 'Mires écran vidéo';

  @override
  String get mireVideoWidthPxLabel => 'Largeur (px)';

  @override
  String get mireVideoHeightPxLabel => 'Hauteur (px)';

  @override
  String get mireVideoProjectorCountLabel => 'Nombre de projecteurs (N)';

  @override
  String get mireVideoOverlapPercentLabel => 'Overlap (%)';

  @override
  String get mireVideoHint1920 => 'ex: 1920';

  @override
  String get mireVideoHint1080 => 'ex: 1080';

  @override
  String get mireVideoHint3840 => 'ex: 3840';

  @override
  String get mireVideoHint2160 => 'ex: 2160';

  @override
  String get mireVideoHint2 => 'ex: 2';

  @override
  String get mireVideoHint10Percent => 'ex: 10.0';

  @override
  String get mireVideoTestPatternTypeLabel => 'Type de mire';

  @override
  String get mireVideoSimpleTypeComboAll =>
      'Combo (grille + cercles + 2 barres centrées)';

  @override
  String get mireVideoSimpleTypeGridSafe => 'Grille + safe + cercles';

  @override
  String get mireVideoSimpleTypeColorBars => 'Barres + rampes + cercles';

  @override
  String get mireVideoSimpleTypeUniformity => 'Uniformité + cercles';

  @override
  String get mireVideoSimpleTypeCheckerboard => 'Damier + cercles';

  @override
  String get mireVideoExportPngButton => 'Exporter PNG';

  @override
  String get mireVideoOrientationLabel => 'Orientation';

  @override
  String get mireVideoOrientationHorizontal => 'Horizontal';

  @override
  String get mireVideoOrientationVertical => 'Vertical';

  @override
  String get mireVideoMappingTypeLabel => 'Type mapping';

  @override
  String get mireVideoMappingTypeCombo => 'Combo (zones + overlap + blend)';

  @override
  String get mireVideoMappingTypeZonesAndOverlap => 'Zones + overlap';

  @override
  String get mireVideoMappingTypeBlendRamps => 'Blend ramps';

  @override
  String get mireVideoErrorInvalidWidthHeight =>
      '❌ Largeur/hauteur invalides (px).';

  @override
  String get mireVideoErrorInvalidProjectorCount =>
      '❌ Nombre de projecteurs invalide (N > 0).';

  @override
  String get mireVideoErrorInvalidOverlap => '❌ Overlap invalide (0 à 99.9).';

  @override
  String get cinemaTitle => 'Cinéma / Film';

  @override
  String get cinemaIntroTitle => 'Outils cinéma et tournage';

  @override
  String get cinemaIntroBody =>
      'Calculs utiles pour l’optique, le cadrage, l’exposition, le stockage, le timecode et la projection cinéma.';

  @override
  String get cinemaFieldOfViewTitle => 'Angle de champ';

  @override
  String get cinemaFieldOfViewSubtitle =>
      'Calcul horizontal, vertical et diagonal selon capteur et focale.';

  @override
  String get cinemaFieldOfViewDescription =>
      'Calcule l’angle de champ selon le format capteur et la focale.';

  @override
  String get cinemaFieldOfViewInfo =>
      'Formule : angle = 2 × atan(taille capteur ÷ (2 × focale)).';

  @override
  String get cinemaSubjectDistanceTitle => 'Distance caméra / sujet';

  @override
  String get cinemaSubjectDistanceSubtitle =>
      'Estime la distance nécessaire pour cadrer un sujet.';

  @override
  String get cinemaSubjectDistanceDescription =>
      'Estime la distance caméra nécessaire pour cadrer un sujet en hauteur.';

  @override
  String get cinemaSubjectDistanceInfo =>
      'Approximation géométrique idéale. La distance réelle peut varier selon le breathing optique, le mode capteur et le recadrage.';

  @override
  String get cinemaDepthOfFieldTitle => 'Profondeur de champ';

  @override
  String get cinemaDepthOfFieldSubtitle =>
      'Zone nette, limite proche, limite lointaine et hyperfocale.';

  @override
  String get cinemaDepthOfFieldDescription =>
      'Calcule la zone de netteté théorique selon focale, ouverture, distance et cercle de confusion.';

  @override
  String get cinemaDepthOfFieldInfo =>
      'Résultat théorique. La perception de netteté dépend aussi de la résolution, de la taille d’affichage et de la distance de visionnage.';

  @override
  String get cinemaLensEquivalenceTitle => 'Équivalence de focale';

  @override
  String get cinemaLensEquivalenceSubtitle =>
      'Conversion de focale entre formats de capteurs.';

  @override
  String get cinemaLensEquivalenceDescription =>
      'Convertit une focale d’un format capteur vers un autre en conservant un angle de champ diagonal similaire.';

  @override
  String get cinemaLensEquivalenceInfo =>
      'Conversion basée sur la diagonale. Pour un cadrage strictement horizontal ou vertical, le facteur peut être légèrement différent.';

  @override
  String get cinemaAnamorphicTitle => 'Anamorphique';

  @override
  String get cinemaAnamorphicSubtitle =>
      'Désqueeze, ratio final et focale horizontale équivalente.';

  @override
  String get cinemaAnamorphicDescription =>
      'Calcule le ratio final après désqueeze et l’équivalence horizontale de la focale.';

  @override
  String get cinemaAnamorphicInfo =>
      'Une optique anamorphique élargit le champ horizontal après désqueeze, mais conserve le comportement vertical de la focale.';

  @override
  String get cinemaShutterTitle => 'Shutter angle / shutter speed';

  @override
  String get cinemaShutterSubtitle =>
      'Conversion entre angle d’obturation, FPS et vitesse.';

  @override
  String get cinemaShutterDescription =>
      'Convertit un angle d’obturation cinéma en vitesse d’obturation.';

  @override
  String get cinemaShutterInfo =>
      'À 180°, la vitesse est environ 1 ÷ (2 × fps). Exemple : 25 fps → 1/50 s.';

  @override
  String get cinemaFlickerTitle => 'Flicker free';

  @override
  String get cinemaFlickerSubtitle =>
      'Vitesses d’obturation sûres selon 50 Hz ou 60 Hz.';

  @override
  String get cinemaFlickerDescription =>
      'Liste des vitesses d’obturation généralement sûres selon la fréquence secteur.';

  @override
  String get cinemaFlickerInfo =>
      'Les LEDs, écrans et sources dimmées peuvent quand même scintiller selon leur électronique, leur PWM ou leur fréquence de refresh.';

  @override
  String get cinemaNdExposureTitle => 'ND / exposition';

  @override
  String get cinemaNdExposureSubtitle =>
      'Stops, densité ND, facteur ND et correction d’exposition.';

  @override
  String get cinemaNdExposureDescription =>
      'Convertit une correction en stops vers densité ND et facteur de réduction lumineuse.';

  @override
  String get cinemaNdExposureInfo =>
      'Repères : ND 0.3 = 1 stop, ND 0.6 = 2 stops, ND 0.9 = 3 stops, ND 1.2 = 4 stops.';

  @override
  String get cinemaRecordingStorageTitle => 'Temps d’enregistrement';

  @override
  String get cinemaRecordingStorageSubtitle =>
      'Durée disponible ou capacité nécessaire selon le bitrate.';

  @override
  String get cinemaRecordingStorageDescription =>
      'Estime la durée disponible sur une carte/un disque, ou la capacité nécessaire pour une durée d\'enregistrement donnée, selon le bitrate vidéo.';

  @override
  String get cinemaRecordingStorageInfo =>
      'Calcul décimal simplifié : 1 GB = 8000 Mb. Prévoir une marge pour l’audio, les métadonnées, le système de fichiers et la réserve média.';

  @override
  String get cinemaTimecodeTitle => 'Timecode';

  @override
  String get cinemaTimecodeSubtitle =>
      'Conversion timecode ↔ frames et durée entre deux TC.';

  @override
  String get cinemaTimecodeDescription =>
      'Convertit deux timecodes en frames et calcule la durée entre les deux.';

  @override
  String get cinemaTimecodeInfo =>
      'Cette première version utilise du timecode entier non-drop-frame. Le 29.97 drop-frame peut être ajouté ensuite séparément.';

  @override
  String get cinemaSlowMotionTitle => 'Ralenti / framerate';

  @override
  String get cinemaSlowMotionSubtitle =>
      'Facteur de ralenti et durée de lecture.';

  @override
  String get cinemaSlowMotionDescription =>
      'Calcule le facteur de ralenti et la durée de lecture finale.';

  @override
  String get cinemaSlowMotionInfo =>
      'Exemple : 100 fps tourné, 25 fps lu = ralenti ×4.';

  @override
  String get cinemaProjectionTitle => 'Projection cinéma';

  @override
  String get cinemaProjectionSubtitle =>
      'Écran, ratio, throw, luminance, nits et ft-L.';

  @override
  String get cinemaProjectionDescription =>
      'Calcule les dimensions écran, la distance projecteur et une luminance approximative.';

  @override
  String get cinemaProjectionInfo =>
      'Luminance approximative : nits ≈ lumens × gain ÷ (π × surface). Les pertes optiques, zoom, vieillissement lampe/laser et calibration ne sont pas inclus.';

  @override
  String get cinemaGlobalDisclaimer =>
      'Ces outils donnent des valeurs techniques indicatives. Les résultats peuvent varier selon la caméra, l’optique, le codec, le profil image, le projecteur, la toile ou les conditions réelles de tournage.';

  @override
  String get cinemaSensorLabel => 'Capteur';

  @override
  String get cinemaFocalLengthLabel => 'Focale';

  @override
  String get cinemaHorizontalAngleResult => 'Angle horizontal';

  @override
  String get cinemaVerticalAngleResult => 'Angle vertical';

  @override
  String get cinemaDiagonalAngleResult => 'Angle diagonal';

  @override
  String get cinemaSensorDiagonalResult => 'Diagonale capteur';

  @override
  String get cinemaSubjectHeightLabel => 'Hauteur du sujet';

  @override
  String get cinemaFrameFillLabel => 'Occupation du cadre en hauteur';

  @override
  String get cinemaEstimatedDistanceResult => 'Distance estimée';

  @override
  String get cinemaFrameHeightResult => 'Hauteur cadre à cette distance';

  @override
  String get cinemaApertureLabel => 'Ouverture';

  @override
  String get cinemaSubjectDistanceInputLabel => 'Distance sujet';

  @override
  String get cinemaCocLabel => 'Cercle de confusion';

  @override
  String get cinemaCocHelper => 'Exemple Full Frame : 0.03 mm';

  @override
  String get cinemaHyperfocalResult => 'Hyperfocale';

  @override
  String get cinemaNearLimitResult => 'Limite proche';

  @override
  String get cinemaFarLimitResult => 'Limite lointaine';

  @override
  String get cinemaTotalDepthResult => 'Profondeur totale';

  @override
  String get cinemaSourceSensorLabel => 'Capteur source';

  @override
  String get cinemaTargetSensorLabel => 'Capteur cible';

  @override
  String get cinemaSourceFocalLengthLabel => 'Focale source';

  @override
  String get cinemaEquivalentFocalResult => 'Focale équivalente';

  @override
  String get cinemaAppliedFactorResult => 'Facteur appliqué';

  @override
  String get cinemaSensorRecordingRatioLabel =>
      'Ratio capteur / enregistrement';

  @override
  String get cinemaSensorRecordingRatioHelper =>
      '16:9 = 1.78, 4:3 = 1.33, 3:2 = 1.50';

  @override
  String get cinemaAnamorphicFactorLabel => 'Facteur anamorphique';

  @override
  String get cinemaAnamorphicFactorHelper => '1.33, 1.5, 1.8, 2.0';

  @override
  String get cinemaOpticalFocalLengthLabel => 'Focale optique';

  @override
  String get cinemaFinalRatioResult => 'Ratio final';

  @override
  String get cinemaHorizontalEquivalentFocalResult =>
      'Focale horizontale équivalente';

  @override
  String get cinemaVerticalFocalResult => 'Focale verticale';

  @override
  String get cinemaFramerateLabel => 'Framerate';

  @override
  String get cinemaShutterAngleLabel => 'Angle d’obturation';

  @override
  String get cinemaExposureTimeResult => 'Temps d’exposition';

  @override
  String get cinemaEquivalentShutterSpeedResult => 'Vitesse équivalente';

  @override
  String get cinemaMainsFrequencyLabel => 'Fréquence secteur';

  @override
  String get cinemaMains50Hz => '50 Hz — Europe';

  @override
  String get cinemaMains60Hz => '60 Hz — USA / autres';

  @override
  String get cinemaRecommendedSpeedsResult => 'Vitesses conseillées';

  @override
  String get cinemaMainsBaseResult => 'Base secteur';

  @override
  String get cinemaReductionLabel => 'Réduction souhaitée';

  @override
  String get cinemaNdDensityResult => 'Densité ND';

  @override
  String get cinemaNdFactorResult => 'Facteur ND';

  @override
  String get cinemaApproxTransmissionResult => 'Transmission approx.';

  @override
  String get cinemaMediaCapacityLabel => 'Capacité média';

  @override
  String get cinemaBitrateLabel => 'Bitrate';

  @override
  String get cinemaBitrateHelper => 'Attention : Mb/s, pas MB/s';

  @override
  String get cinemaAvailableDurationResult => 'Durée disponible';

  @override
  String get cinemaStorageConsumptionResult => 'Consommation';

  @override
  String get cinemaIntegerFramerateLabel => 'Framerate entier';

  @override
  String get cinemaIntegerFramerateHelper => '24, 25, 30, 50, 60…';

  @override
  String get cinemaTcInLabel => 'TC IN';

  @override
  String get cinemaTcOutLabel => 'TC OUT';

  @override
  String get cinemaTimecodeFormatHelper => 'Format HH:MM:SS:FF';

  @override
  String get cinemaTcInFramesResult => 'Frames TC IN';

  @override
  String get cinemaTcOutFramesResult => 'Frames TC OUT';

  @override
  String get cinemaDurationFramesResult => 'Durée en frames';

  @override
  String get cinemaDurationTcResult => 'Durée TC';

  @override
  String get cinemaDurationResult => 'Durée';

  @override
  String get cinemaCaptureFramerateLabel => 'Framerate tournage';

  @override
  String get cinemaPlaybackFramerateLabel => 'Framerate lecture';

  @override
  String get cinemaRealDurationLabel => 'Durée réelle filmée';

  @override
  String get cinemaSlowMotionFactorResult => 'Facteur de ralenti';

  @override
  String get cinemaPlaybackDurationResult => 'Durée de lecture';

  @override
  String get cinemaScreenWidthLabel => 'Largeur écran';

  @override
  String get cinemaImageRatioLabel => 'Ratio image';

  @override
  String get cinemaImageRatioHelper => '1.85, 2.39, 1.78…';

  @override
  String get cinemaThrowRatioLabel => 'Throw ratio';

  @override
  String get cinemaProjectorLumensLabel => 'Flux projecteur';

  @override
  String get cinemaScreenGainLabel => 'Gain toile';

  @override
  String get cinemaScreenHeightResult => 'Hauteur écran';

  @override
  String get cinemaScreenAreaResult => 'Surface écran';

  @override
  String get cinemaProjectorDistanceResult => 'Distance projecteur';

  @override
  String get cinemaApproxLuminanceResult => 'Luminance approx.';

  @override
  String get gdtfScannedPdfOcrEnabled =>
      'PDF scanné détecté : mode OCR activé. L\'analyse peut prendre 1 à 2 minutes supplémentaires.';

  @override
  String get gdtfAddModeDialogTitle => 'Ajouter un mode';

  @override
  String get gdtfModeNameExampleHint => 'Ex: Standard, Easy, Pixel Engine…';

  @override
  String get gdtfDmxChannelCountLabel => 'Nombre de canaux DMX';

  @override
  String get gdtfDmxChannelCountHint => 'Ex: 24';

  @override
  String get gdtfCancel => 'Annuler';

  @override
  String get gdtfAdd => 'Ajouter';

  @override
  String get gdtfErrorModeNameRequired => 'Le nom est requis';

  @override
  String get gdtfErrorInvalidChannelCount =>
      'Nombre de canaux invalide (1-1000)';

  @override
  String get gdtfErrorModeAlreadyExists => 'Un mode portant ce nom existe déjà';

  @override
  String get gdtfHowToUseThisPageTooltip => 'Comment utiliser cette page';

  @override
  String get gdtfHowToGetGdtfTitle => 'Comment obtenir un GDTF';

  @override
  String get gdtfWorkflowIntro =>
      'Pour chaque fixture, suis ces 3 étapes dans l\'ordre.';

  @override
  String get gdtfWorkflowSearchTitle => 'Recherche';

  @override
  String get gdtfWorkflowSearchBody =>
      'Onglet « Recherche ». Tape le nom de ta fixture (ex: \"Spiider\", \"MAC Viper\", \"Q-10\"). La base GDTF Share contient 6000+ fixtures officielles validées par les fabricants. C\'est gratuit, instantané, et 100% fiable. À utiliser EN PREMIER pour 90% des cas.';

  @override
  String get gdtfWorkflowPdfTitle => 'Générer depuis PDF';

  @override
  String get gdtfWorkflowPdfBody =>
      'Si la recherche ne donne rien, passe à l\'onglet « Générer depuis PDF ». Upload le manuel/datasheet PDF — l\'IA extrait les modes DMX automatiquement. ⚠️ Important : saisis le nom exact de la machine (tel qu\'écrit dans le manuel), et si tu ajoutes des modes manuellement, utilise les noms exacts des modes DMX — sinon l\'IA ne retrouve pas les bonnes données. Marche bien sur les PDFs propres (Robe, Martin, etc.) et moins bien sur les manuels scannés ou en chinois traduit.';

  @override
  String get gdtfWorkflowManualTitle => 'Ajout / correction manuels';

  @override
  String get gdtfWorkflowManualBody =>
      'Quand l\'IA a terminé l\'analyse, tu arrives sur la page de sélection des modes. Le bouton « Ajouter un mode manuellement » est TOUJOURS dispo en haut de la liste. Sers-t\'en pour : (a) ajouter un mode que l\'IA a oublié, (b) supprimer une hallucination via la poubelle, (c) corriger un compte de canaux erroné (poubelle + réajout au bon nombre). C\'est ta dernière ligne de défense avant la génération du GDTF — vérifie toujours.';

  @override
  String get gdtfWorkflowTip =>
      'Astuce : avant d\'extraire un PDF, vérifie toujours sur gdtf-share — ça t\'évite l\'extraction IA (plus longue et moins fiable) quand un GDTF officiel existe déjà. Et souviens-toi : nom de machine et noms de modes doivent être les exacts du manuel — l\'IA en dépend !';

  @override
  String get gdtfUnderstood => 'Compris';

  @override
  String get gdtfWorkflowSearchShortBody =>
      'Tape le nom de la fixture ci-dessus. Base GDTF Share (6000+ fixtures officielles). C\'est gratuit, instantané, validé fabricant. Résout 90% des cas.';

  @override
  String get gdtfWorkflowPdfShortBody =>
      'Pas trouvé ? Onglet « Générer depuis PDF ». Upload le manuel — l\'IA extrait les modes DMX. Marche mieux sur les PDFs propres.';

  @override
  String get gdtfWorkflowManualShortBody =>
      'Sur la page des modes, vérifie toujours ce que l\'IA a sorti. Tu peux : ajouter un mode oublié, supprimer une hallucination (icône poubelle), ou corriger un compte de canaux faux (supprimer + réajouter à la bonne valeur). L\'IA est rapide mais pas infaillible — tu restes maître de la liste finale.';

  @override
  String get gdtfAddModeManually => 'Ajouter un mode manuellement';

  @override
  String get gdtfNoModeDetectedAutomatically =>
      'Aucun mode détecté automatiquement.';

  @override
  String get gdtfNoModeDetectedHelp =>
      'Le PDF est probablement scanné ou avec une mise en page complexe. Ajoute les modes manuellement avec le bouton ci-dessus, et l\'extraction des canaux se fera ensuite sur le texte OCR / extrait du manuel.';

  @override
  String get gdtfAddMode => 'Ajouter un mode';

  @override
  String get gdtfDeleteModeTooltip => 'Supprimer ce mode';

  @override
  String get audioHomeTitle => 'Son';

  @override
  String get audioHomeSubtitle =>
      'Sub cardioïde, end-fire, délais, SPL et outils pour l’ingénieur du son.';

  @override
  String get homeRfTitle => 'RF & Sans-fil';

  @override
  String get homeRfSubtitle =>
      'WiFi 2.4/5 GHz, coexistence, bandes UHF/VHF, calculateur d’antenne.';

  @override
  String get homeCinemaTitle => 'Cinéma / Film';

  @override
  String get homeCinemaSubtitle =>
      'Optique, cadrage, exposition, timecode, stockage et projection cinéma.';

  @override
  String get audioSectionPlacementDirectivity => 'Placement & Directivité';

  @override
  String get audioSectionAcousticLevels => 'Acoustique & Niveaux';

  @override
  String get audioSectionAmpCabling => 'Ampli & Câblage';

  @override
  String get audioSectionTimingAlignment => 'Timing & Alignement';

  @override
  String get audioSubCardioidTitle => 'Sub Cardioïde';

  @override
  String get audioSubCardioidSubtitle =>
      'Délais pour configuration cardioïde (2 subs) ou end-fire (N subs en ligne). Annulation arrière, renforcement frontal.';

  @override
  String get audioSplDistanceTitle => 'SPL & Distance';

  @override
  String get audioSplDistanceSubtitle =>
      'Loi du carré inverse : SPL selon la distance. Calcul depuis puissance + sensibilité enceinte.';

  @override
  String get audioSplSumTitle => 'Addition de Sources SPL';

  @override
  String get audioSplSumSubtitle =>
      'N sources incohérentes : +10·log(N) dB. Ou addition de 2 sources différentes.';

  @override
  String get audioElectroacousticTitle => 'Électroacoustique';

  @override
  String get audioElectroacousticSubtitle =>
      'SPL depuis sensibilité enceinte + puissance. Table distances. Couplage cohérent/incohérent.';

  @override
  String get audioWavelengthTitle => 'Fréquence & Longueur d’onde';

  @override
  String get audioWavelengthSubtitle =>
      'Conversion Hz ↔ λ (m), λ/4, λ/2. Tableau du spectre audio par bandes.';

  @override
  String get audioAmpLoadTitle => 'Charge Ampli / Enceintes';

  @override
  String get audioCrossoverTitle => 'Fréquence de Coupure / Crossover';

  @override
  String get audioRt60Title => 'Temps de Réverbération (RT60)';

  @override
  String get audioRt60LengthLabel => 'Longueur';

  @override
  String get audioRt60WidthLabel => 'Largeur';

  @override
  String get audioRt60HeightLabel => 'Hauteur';

  @override
  String get audioRt60AbsorptionLabel => 'Coefficient d\'absorption moyen (α)';

  @override
  String get audioRt60PresetHard => 'Très réverbérant (béton, verre)';

  @override
  String get audioRt60PresetMedium => 'Salle moyenne (bureaux, bois)';

  @override
  String get audioRt60PresetTreated => 'Salle traitée (rideaux, moquette)';

  @override
  String get audioRt60PresetAbsorbent => 'Très absorbant (studio traité)';

  @override
  String get audioRt60ResultTitle => 'RT60 estimé';

  @override
  String get audioRt60VolumeLabel => 'Volume de la salle';

  @override
  String get audioRt60SurfaceLabel => 'Surface totale';

  @override
  String get audioRt60QualLive => 'Très réverbérant';

  @override
  String get audioRt60QualComfortable => 'Confortable pour la voix';

  @override
  String get audioRt60QualDry => 'Sec / contrôlé';

  @override
  String get audioRt60FormulaNote =>
      'RT60 = 0,161 × V / (α × S) — formule de Sabine, estimation avec absorption moyenne uniforme';

  @override
  String get audioSplMeterTitle => 'Sonomètre';

  @override
  String get audioDelayTimeTitle => 'Temps de Delay (BPM)';

  @override
  String get audioDelayTimeBpmLabel => 'BPM';

  @override
  String get audioDelayTimeResultsTitle => 'Temps par division';

  @override
  String get audioDelayTimeEmptyState =>
      'Entre un BPM pour calculer les temps de delay.';

  @override
  String get audioDelayTimeNormalLabel => 'Normale';

  @override
  String get audioDelayTimeDottedLabel => 'Pointée';

  @override
  String get audioDelayTimeTripletLabel => 'Triolet';

  @override
  String get audioDelayTimeFormulaNote =>
      'Temps (ms) = 60000 / BPM × fraction de la noire. Pointée ×1,5 · Triolet ×2/3.';

  @override
  String get audioSplMeterPermissionTitle => 'Accès au microphone requis';

  @override
  String get audioSplMeterPermissionBody =>
      'Le sonomètre utilise le microphone du téléphone pour estimer le niveau sonore ambiant en temps réel.';

  @override
  String get audioSplMeterAllowMic => 'Autoriser le micro';

  @override
  String get audioSplMeterOpenSettings => 'Ouvrir les réglages';

  @override
  String get audioSplMeterLiveTitle => 'Niveau en direct';

  @override
  String get audioSplMeterStartHint => 'Toucher pour démarrer';

  @override
  String get audioSplMeterStopHint => 'Toucher pour arrêter';

  @override
  String get audioSplMeterStatsTitle => 'Statistiques de la session';

  @override
  String get audioSplMeterStatsEmpty =>
      'Démarre une mesure pour voir les statistiques min/moy/max.';

  @override
  String get audioSplMeterMinLabel => 'Minimum';

  @override
  String get audioSplMeterAvgLabel => 'Moyenne';

  @override
  String get audioSplMeterMaxLabel => 'Maximum';

  @override
  String get audioSplMeterReferenceTitle => 'Repères de niveaux sonores';

  @override
  String get audioSplMeterRefQuiet => 'Pièce calme';

  @override
  String get audioSplMeterRefConversation => 'Conversation normale';

  @override
  String get audioSplMeterRefTraffic => 'Circulation urbaine';

  @override
  String get audioSplMeterRefConcert => 'Concert / salle amplifiée';

  @override
  String get audioSplMeterRefPain => 'Seuil de douleur';

  @override
  String get audioSplMeterDisclaimer =>
      'Mesure indicative via le micro du téléphone (non calibré) — ne remplace pas un sonomètre certifié IEC 61672.';

  @override
  String get audioCrossoverFreqLabel => 'Fréquence de coupure';

  @override
  String get audioCrossoverImpedanceLabel => 'Impédance du haut-parleur';

  @override
  String get audioCrossoverCapacitorLabel => 'Condensateur (passe-haut)';

  @override
  String get audioCrossoverInductorLabel => 'Bobine (passe-bas)';

  @override
  String get audioCrossoverOrderNote => 'Filtre du 1er ordre (6 dB/octave)';

  @override
  String get audioCrossoverReferenceTitle => 'Repères de fréquences de coupure';

  @override
  String get audioCrossoverRefSubTop => 'Sub / Top';

  @override
  String get audioCrossoverRef2Way => '2 voies (LF/HF)';

  @override
  String get audioCrossoverRef3WayLow => '3 voies — LF/MF';

  @override
  String get audioCrossoverRef3WayHigh => '3 voies — MF/HF';

  @override
  String get audioCrossoverFormulaNote => 'C = 1 / (2π·f·Z)    L = Z / (2π·f)';

  @override
  String get audioAmpLoadSubtitle =>
      'Combien d’enceintes par voie d’ampli. Impédance résultante, puissance par enceinte.';

  @override
  String get audioImpedanceTitle => 'Impédance Série / Parallèle';

  @override
  String get audioImpedanceModeLabel => 'Mode de câblage';

  @override
  String get audioImpedanceModeSeries => 'Série';

  @override
  String get audioImpedanceModeParallel => 'Parallèle';

  @override
  String get audioImpedanceSpeakerLabel => 'Enceinte';

  @override
  String get audioImpedanceAddSpeaker => 'Ajouter une enceinte';

  @override
  String get audioImpedanceTotalTitle => 'Impédance totale';

  @override
  String get audioImpedanceEmptyState =>
      'Entre au moins une impédance pour calculer le total.';

  @override
  String get audioImpedanceWarningLow =>
      'Impédance basse : vérifie que ton ampli supporte cette charge (souvent 2 Ω minimum).';

  @override
  String get audioImpedanceFormulaNote =>
      'Série : Zt = Z1 + Z2 + …    Parallèle : 1/Zt = 1/Z1 + 1/Z2 + …';

  @override
  String get audioLevelsTitle => 'Niveaux & Câbles';

  @override
  String get audioLevelsSubtitle =>
      'Convertisseur dBu / dBV / V rms. Niveaux de référence −10 dBV, +4 dBu, +18 dBu.';

  @override
  String get audioDelayDistanceTitle => 'Délai de Distance';

  @override
  String get audioDelayDistanceSubtitle =>
      'Distance → ms pour aligner delay stacks, fills ou diffusion distribuée. Multi-points.';

  @override
  String get subscriptionCategorySonRfShort => 'SON & RF';

  @override
  String get subscriptionProShort => 'PRO';

  @override
  String get audioConditions => 'Conditions';

  @override
  String get audioAmbientTemperature => 'Température ambiante';

  @override
  String get audioSpeedOfSound => 'Vitesse du son';

  @override
  String get audioListeningPoints => 'Points d’écoute';

  @override
  String audioDistancePoint(int index) {
    return 'Distance point $index';
  }

  @override
  String get audioAddPoint => 'Ajouter un point';

  @override
  String get audioCalculatedDelays => 'Délais calculés';

  @override
  String get audioTypicalUseCases => 'Cas d’usage typiques';

  @override
  String get audioDelayStackFillsTitle => 'Delay stack / fills';

  @override
  String get audioDelayStackFillsText =>
      'Mesurez la distance entre le main system et le delay tower. Appliquez ce délai au delay tower pour l’aligner avec les mains.';

  @override
  String get audioDistributedSoundTitle => 'Diffusion distribuée';

  @override
  String get audioDistributedSoundText =>
      'Pour chaque zone de haut-parleurs, mesurez la distance depuis le système de référence et appliquez le délai correspondant.';

  @override
  String get audioRoomFillTitle => 'Remplissage de salle';

  @override
  String get audioRoomFillText =>
      'Les enceintes proches du public sont retardées par rapport au son de la scène pour éviter la perception de double-source.';

  @override
  String get audioDelayNote =>
      'Le délai calculé correspond à la propagation acoustique en air libre.\nAjustez finement à l’oreille ou avec un analyseur de phase.';

  @override
  String get audioFromSpeakerSensitivity => 'SPL depuis sensibilité enceinte';

  @override
  String get audioSensitivity => 'Sensibilité';

  @override
  String get audioAmpPower => 'Puissance ampli';

  @override
  String get audioMeasurementDistance => 'Distance de mesure';

  @override
  String get audioTypicalSensitivities => 'Sensibilités typiques';

  @override
  String get audioSourceCoupling => 'Couplage de sources';

  @override
  String get audioSourceCouplingIntro =>
      'En ajoutant des sources identiques côte à côte, le gain dépend du type de couplage :';

  @override
  String audioSourcesCount(int count) {
    return '$count sources';
  }

  @override
  String get audioPracticalRules => 'Règles pratiques';

  @override
  String get audioRuleDoubleDistance =>
      'Doubler la distance = −6 dB (champ libre). Dans une salle, l’atténuation est moindre grâce aux réflexions.';

  @override
  String get audioRuleDoublePower =>
      'Doubler la puissance = +3 dB. Multiplier par 10 = +10 dB. Il faut ×100 la puissance pour gagner +20 dB.';

  @override
  String get audioRuleCoupling =>
      'Couplage cohérent (sources en phase, dos à dos) : +6 dB par doublement. Couplage incohérent : +3 dB.';

  @override
  String get audioRuleSafety =>
      'Seuil de douleur ≈ 120 dB SPL. Risque auditif à partir de 85 dB (8h) selon NIOSH. Chaque +3 dB divise le temps d’exposition par 2.';

  @override
  String get audioDistance => 'Distance';

  @override
  String get audioSpl => 'SPL';

  @override
  String get audioIncoherent => 'Incohérent';

  @override
  String get audioCoherent => 'Cohérent';

  @override
  String get audioIncoherentSubtitle =>
      'Sources décalées\nou non-synchronisées';

  @override
  String get audioCoherentSubtitle => 'Sources en phase\nalignées';

  @override
  String get audioLevelConverter => 'Convertisseur de niveaux';

  @override
  String get audioReferenceLevels => 'Niveaux de référence';

  @override
  String get audioGainStagingRules => 'Gain staging — règles pratiques';

  @override
  String get audioAmplifierPerChannel => 'AMPLIFICATEUR — par voie';

  @override
  String get audioMinimumImpedance => 'Z min (Ω)';

  @override
  String get audioPowerW => 'Puissance (W)';

  @override
  String get audioAtOhm => 'à (Ω)';

  @override
  String get audioSpeaker => 'ENCEINTE';

  @override
  String get audioNominalImpedance => 'Z nominale (Ω)';

  @override
  String get audioContinuousPower => 'P continue (W)';

  @override
  String get audioParallelConnection => 'BRANCHEMENT PARALLÈLE';

  @override
  String get audioLoadImpedance => 'Z charge';

  @override
  String get audioPowerPerSpeaker => 'P / enc.';

  @override
  String get audioStatus => 'Statut';

  @override
  String audioTooLowImpedance(String diff) {
    return '✗  Z trop basse (−$diff Ω)';
  }

  @override
  String get audioExceedsContinuousPower => '⚠  Dépasse P continue';

  @override
  String audioNearLimit(int percent) {
    return '⚠  Proche limite (>$percent%)';
  }

  @override
  String audioOkContinuousPower(int percent) {
    return '✓  OK  ($percent% P cont.)';
  }

  @override
  String get audioAmpLoadNote =>
      'Calcul basé sur les puissances publiées par le fabricant de l’ampli à chaque impédance (interpolées). La puissance de la voie est partagée entre les N enceintes en parallèle. Une marge ×1,5 à ×2 sur la tenue RMS/AES est courante si un limiteur est réglé. Valeurs issues des fiches techniques : vérifiez toujours avec les presets et recommandations du fabricant.';

  @override
  String get audioConfiguration => 'Configuration';

  @override
  String get audioParameters => 'Paramètres';

  @override
  String get audioSubDistance => 'Distance entre subs';

  @override
  String get audioSubCount => 'Nombre de subs';

  @override
  String get audioCardioid2Subs => 'Cardioïde — 2 subs';

  @override
  String get audioCardioid2SubsDescription =>
      '1 sub normal + 1 sub retourné avec délai';

  @override
  String get audioEndFireNSubs => 'End-fire — N subs en ligne';

  @override
  String get audioEndFireNSubsDescription =>
      'Tous face avant, délais décalés par rang';

  @override
  String get audioResults => 'Résultats';

  @override
  String get audioEnterDistanceToCalculate =>
      'Saisissez une distance pour calculer';

  @override
  String get audioDelayToApply => 'Délai à appliquer';

  @override
  String get audioRearSubDelaySublabel => 'sur le sub retourné (arrière)';

  @override
  String get audioOptimalFrequency => 'Fréquence optimale';

  @override
  String get audioFrontSub => 'Sub avant';

  @override
  String get audioRearSubReversed => 'Sub arrière (retourné)';

  @override
  String get audioNormalPolarity => 'Normal ✓';

  @override
  String get audioInvertedPolarity => 'Inversée 🔄';

  @override
  String get audioDelayBetweenRows => 'Délai entre chaque rang';

  @override
  String get audioMaxDelayRearSub => 'Délai max (sub arrière)';

  @override
  String get audioFrontReferenceSub => 'Sub avant (référence)';

  @override
  String audioSubNumber(int index) {
    return 'Sub $index';
  }

  @override
  String get audioEndFireReferenceNote =>
      '→ Le sub 1 (avant) est la référence. Les subs suivants ont un délai croissant.';

  @override
  String get audioHowTo => 'Comment faire ?';

  @override
  String get audioCardioidStep1 =>
      'Placez le sub A face au public (position normale).';

  @override
  String get audioCardioidStep2 =>
      'Placez le sub B juste derrière, physiquement retourné face à l’arrière de la scène.';

  @override
  String get audioCardioidStep3 =>
      'Dans votre processeur ou console, inversez la polarité du sub B (bouton Ø / Phase).';

  @override
  String get audioCardioidStep4 =>
      'Appliquez le délai calculé au sub B. Ne retardez pas le sub A.';

  @override
  String get audioCardioidStep5 =>
      'Vérifiez l’annulation arrière avec un micro de mesure ou en marchant derrière l’array.';

  @override
  String get audioCardioidTip =>
      '💡 La distance idéale entre les subs correspond à λ/4 de la fréquence centrale du sub (ex. 90 Hz → ~0.95 m à 20 °C). Ajustez pour trouver le meilleur compromis entre annulation et puissance.';

  @override
  String get audioEndFireStep1 =>
      'Alignez tous les subs en ligne, tous face au public, avec la même distance d entre chaque.';

  @override
  String get audioEndFireStep2 =>
      'Le sub le plus en avant (sub 1) est la référence : délai = 0.';

  @override
  String get audioEndFireStep3 =>
      'Appliquez un délai croissant à chaque rang suivant (sub 2 → 1×délai, sub 3 → 2×délai, etc.).';

  @override
  String get audioEndFireStep4 =>
      'Tous les subs gardent la même polarité (pas d’inversion).';

  @override
  String get audioEndFireStep5 =>
      'Mesurez à l’arrière pour vérifier l’atténuation.';

  @override
  String get audioEndFireTip =>
      '💡 L’end-fire offre un gain de directivité légèrement inférieur au cardioïde classique, mais fonctionne avec plus de 2 subs et ne nécessite pas de retournement physique.';

  @override
  String get audioConversion => 'Conversion';

  @override
  String get audioFrequency => 'Fréquence';

  @override
  String get audioWavelength => 'Longueur d’onde';

  @override
  String get audioResult => 'Résultat';

  @override
  String get audioEnterValueToCalculate => 'Saisissez une valeur pour calculer';

  @override
  String audioWavelengthAt(String frequency) {
    return 'Longueur d’onde à $frequency';
  }

  @override
  String audioFrequencyForLambda(String lambda) {
    return 'Fréquence pour λ = $lambda m';
  }

  @override
  String get audioHalfWave => 'λ/2 (demi-onde)';

  @override
  String get audioQuarterWave => 'λ/4 (quart d’onde)';

  @override
  String get audioSpectrumMarkers => 'Spectre audio — repères';

  @override
  String get audioWavelengthFormula =>
      'Formule : λ = v / f    |    v = 331,3 + 0,606 × T (°C)';

  @override
  String get audioHzToLambda => 'Hz → λ (m)';

  @override
  String get audioLambdaToHz => 'λ (m) → Hz';

  @override
  String get audioSubBass => 'Sub-basses';

  @override
  String get audioBass => 'Basses';

  @override
  String get audioLowMid => 'Bas-médiums';

  @override
  String get audioMid => 'Médiums';

  @override
  String get audioHighMid => 'Hauts-médiums';

  @override
  String get audioTreble => 'Aigus';

  @override
  String get audioIncoherentSources => 'Sources incohérentes';

  @override
  String get audioIdenticalSources => 'N sources identiques';

  @override
  String get audioSingleSourceSpl => 'SPL d’une source';

  @override
  String audioTotalSplSources(int count) {
    return 'SPL total ($count sources)';
  }

  @override
  String get audioTwoDifferentSources => '2 sources différentes';

  @override
  String get audioSourceA => 'Source A';

  @override
  String get audioSourceB => 'Source B';

  @override
  String get audioTotalSplAB => 'SPL total (A + B)';

  @override
  String get audioDoublingReference => 'Référence — gain par doublement';

  @override
  String get audioIncoherentShort => 'Incoh. : ';

  @override
  String get audioCoherentShort => 'Cohér. : ';

  @override
  String get audioCalculationMode => 'Mode de calcul';

  @override
  String get audioReferenceSpl => 'SPL de référence';

  @override
  String get audioReferenceDistance => 'Distance de référence';

  @override
  String get audioTargetDistance => 'Distance cible';

  @override
  String get audioEnterValuesToCalculate =>
      'Saisissez les valeurs pour calculer';

  @override
  String audioSplAtDistance(String distance) {
    return 'SPL à $distance m';
  }

  @override
  String get audioVariation => 'Variation';

  @override
  String get audioListeningDistance => 'Distance d’écoute';

  @override
  String get audioMaxSplAt1m => 'SPL max à 1 m';

  @override
  String get audioDistanceToSpl => 'Distance → SPL';

  @override
  String get audioPowerToSpl => 'Puissance → SPL';

  @override
  String get audioSoundLevelReference => 'Référence niveaux sonores';

  @override
  String get audioSectionSafety => 'Sécurité auditive';

  @override
  String get audioNoiseDoseTitle => 'Dose sonore & temps d’exposition';

  @override
  String get audioNoiseDoseIntro =>
      'Chaque +3 dB divise par deux le temps d’exposition admissible (règle d’échange 3 dB). Entrez le niveau sonore mesuré ou prévu pour estimer le temps avant d’atteindre les seuils réglementaires d’exposition au bruit.';

  @override
  String get audioNoiseDoseLevelCardTitle => 'Niveau mesuré';

  @override
  String get audioNoiseDoseLevelLabel => 'Niveau sonore';

  @override
  String get audioNoiseDoseAllowedTimeTitle => 'Temps admissible avant la dose';

  @override
  String get audioNoiseDoseVaiLabel => 'Valeur d’action inférieure';

  @override
  String get audioNoiseDoseVasLabel => 'Valeur d’action supérieure';

  @override
  String get audioNoiseDoseVleLabel => 'Valeur limite d’exposition';

  @override
  String get audioNoiseDoseUnlimited => '≥ 8 h (pas de risque sur une journée)';

  @override
  String get audioNoiseDoseTableTitle =>
      'Repères — temps admissible par niveau';

  @override
  String get audioNoiseDoseTableLevelHeader => 'Niveau';

  @override
  String get audioNoiseDoseTableTimeHeader => 'Temps admissible (VLE 87 dB)';

  @override
  String get audioNoiseDoseVenueTitle =>
      'Seuils lieux de diffusion (décret spectacles)';

  @override
  String get audioNoiseDoseVenueText =>
      'Le décret n°2017-1244 impose un niveau moyen LAeq sur 15 min ≤ 102 dB(A) (lieu non habituel) ou 105 dB(A) (lieu habituel), avec un niveau crête ≤ 118 ou 120 dB(C). Ces seuils s’appliquent au public, en continu, via un limiteur — ils sont distincts de l’exposition professionnelle calculée ci-dessus.';

  @override
  String get audioNoiseDoseDisclaimer =>
      'Outil indicatif basé sur la règle d’échange 3 dB (Code du travail, art. R.4431-2). Ne remplace pas un sonomètre ou un dosimètre certifié, ni une mesure réglementaire sur site.';

  @override
  String get audioSectionOrganization => 'Organisation';

  @override
  String get audioInputListTitle => 'Liste d’inputs';

  @override
  String get audioInputListIntro =>
      'Construisez votre liste d’inputs micro/DI pour la balance ou la feuille de patch. L’ordre des lignes définit le numéro de canal — glissez pour réorganiser.';

  @override
  String get audioInputListEmpty =>
      'Aucune entrée pour l’instant. Ajoutez la première ligne de votre liste d’inputs.';

  @override
  String get audioInputListAddButton => 'Ajouter une entrée';

  @override
  String audioInputListChannel(Object n) {
    return 'Canal $n';
  }

  @override
  String get audioInputListNameLabel => 'Source';

  @override
  String get audioInputListPositionLabel => 'Position';

  @override
  String get audioInputListNotesLabel => 'Notes';

  @override
  String get audioInputListTypeMic => 'Micro';

  @override
  String get audioInputListTypeDi => 'DI';

  @override
  String get audioInputListTypeLine => 'Ligne';

  @override
  String get audioInputListTypeWireless => 'Sans-fil';

  @override
  String get audioInputListTypeOther => 'Autre';

  @override
  String get audioInputListCopyAction => 'Copier la liste';

  @override
  String get audioInputListCopiedSnackbar =>
      'Liste copiée dans le presse-papiers';

  @override
  String get audioInputListClearAction => 'Tout effacer';

  @override
  String get audioInputListClearConfirmTitle => 'Effacer toute la liste ?';

  @override
  String get audioInputListClearConfirmBody =>
      'Cette action supprime toutes les entrées de la liste d’inputs. Elle est irréversible.';

  @override
  String get pluginCommunity => 'Plugin Community';

  @override
  String get pluginCommunitySubtitle =>
      'Partage et découvre des plugins grandMA3 créés par la communauté';

  @override
  String get pluginCommunitySubtitleAuth =>
      'Partage et découvre des plugins\ngrandMA3 créés par la communauté.';

  @override
  String get continueWithGoogle => 'Continuer avec Google';

  @override
  String get authChoosePseudo => 'Choisis ton pseudo';

  @override
  String get authPseudoHint => 'Ton pseudo dans la communauté';

  @override
  String get confirm => 'Confirmer';

  @override
  String get loginCancelled => 'Connexion annulée.';

  @override
  String get anonymous => 'Anonyme';

  @override
  String get share => 'Partager';

  @override
  String get searchPluginHint => 'Rechercher un plugin…';

  @override
  String get allPluginsFilter => '⭐ Tous';

  @override
  String get loginRequiredLike => 'Connecte-toi pour liker 👋';

  @override
  String get noPluginsYet => 'Aucun plugin ici encore.';

  @override
  String get beFirstToShare => 'Sois le premier à partager !';

  @override
  String get signOut => 'Se déconnecter';

  @override
  String get luaCode => 'Code Lua';

  @override
  String get copied => 'Copié !';

  @override
  String get copyCode => 'Copier le code';

  @override
  String get pluginPublished => '🚀 Plugin publié !';

  @override
  String get sharePlugin => 'Partager un plugin';

  @override
  String get pluginTitle => 'Titre du plugin';

  @override
  String get pluginTitleHint => 'ex: Batch couleurs RGB — 30 presets';

  @override
  String get pluginTitleRequired => 'Titre requis';

  @override
  String get category => 'Catégorie';

  @override
  String get optionalDescription => 'Description (optionnel)';

  @override
  String get pluginDescriptionHint =>
      'Ce que fait le plugin, ce qu\'il demande à l\'utilisateur...';

  @override
  String get codeRequired => 'Code requis';

  @override
  String get codeMustContainReturnMain =>
      'Le code doit contenir \"return main\"';

  @override
  String get pluginTestedWarning =>
      'Assurez-vous que le plugin est testé dans MA3 avant de le partager.';

  @override
  String get attachFiles => 'Joindre des fichiers';

  @override
  String get addFiles => 'Ajouter des fichiers (.lua, .xml…)';

  @override
  String filesSelected(Object count) {
    return '$count fichier(s) sélectionné(s)';
  }

  @override
  String get codeOptional => 'Coller le code (optionnel)';

  @override
  String get codeOrFileRequired =>
      'Ajoute au moins un fichier ou colle le code';

  @override
  String get downloadFile => 'Télécharger';

  @override
  String get pluginFiles => 'Fichiers';

  @override
  String get uploadingFiles => 'Envoi des fichiers…';

  @override
  String get publishPlugin => 'Publier le plugin';

  @override
  String get free => 'GRATUIT';

  @override
  String get pro => 'PRO';

  @override
  String get console => 'Console';

  @override
  String pluginError(Object error) {
    return 'Erreur : $error';
  }

  @override
  String get pluginCategory_all => 'Tous';

  @override
  String get pluginCategory_color => 'Couleur';

  @override
  String get pluginCategory_movement => 'Mouvement';

  @override
  String get pluginCategory_effect => 'Effets';

  @override
  String get pluginCategory_dimmer => 'Intensité';

  @override
  String get pluginCategory_layout => 'Layout';

  @override
  String get pluginCategory_select => 'Sélection';

  @override
  String get pluginCategory_macro => 'Macro';

  @override
  String get pluginCategory_utility => 'Utilitaire';

  @override
  String get pluginCategory_custom => 'Sur mesure';

  @override
  String get ma3AppTitlePrefix => 'MA3 Plugin ';

  @override
  String get ma3AppTitleAccent => 'Forge';

  @override
  String get ma3New => '↺ Nouveau';

  @override
  String get ma3StepCategory => 'Catégorie';

  @override
  String get ma3StepSettings => 'Paramètres';

  @override
  String get ma3StepGeneratedCode => 'Code généré';

  @override
  String get ma3ChoosePluginType => 'Quel type de plugin ?';

  @override
  String get ma3ChooseCategorySubtitle =>
      'Choisis une catégorie pour commencer';

  @override
  String get ma3Continue => 'Continuer →';

  @override
  String get ma3PluginName => 'Nom du plugin';

  @override
  String get ma3PluginNameHint => 'Mon Plugin MA3';

  @override
  String get ma3PluginSettings => 'Paramètres du plugin';

  @override
  String get ma3AdditionalDetails => '💬 Détails supplémentaires (optionnel)';

  @override
  String get ma3AdditionalDetailsHint =>
      'Ajoute des précisions, cas particuliers, contraintes...';

  @override
  String get ma3Back => '← Retour';

  @override
  String get ma3GeneratePlugin => '⚡ Générer le Plugin';

  @override
  String get ma3GeneratedReady => 'Plugin généré — prêt à coller dans MA3';

  @override
  String get ma3InstallInMa3 => 'Installer dans MA3 : ';

  @override
  String get ma3Menu => 'Menu ';

  @override
  String get ma3Plugin => 'Plugin';

  @override
  String get ma3NewPlugin => 'New Plugin';

  @override
  String get ma3PasteSaveAs => ' → colle → sauvegarde comme ';

  @override
  String get ma3Run => 'Run';

  @override
  String get ma3Copied => '✓ Copié !';

  @override
  String get ma3Copy => '⎘ Copier';

  @override
  String get ma3Edit => '← Modifier';

  @override
  String get ma3Regenerate => '↺ Régénérer';

  @override
  String get ma3NewPluginButton => '+ Nouveau plugin';

  @override
  String get ma3Choose => '— Choisir —';

  @override
  String get ma3Add => 'Ajouter...';

  @override
  String get ma3GeneratedPluginFallback => 'Plugin';

  @override
  String get ma3CategoryColor => 'Couleur';

  @override
  String get ma3CategoryColorDesc => 'Layout RGB, palette, presets couleur';

  @override
  String get ma3CategoryMovement => 'Mouvement';

  @override
  String get ma3CategoryMovementDesc => 'Pan/Tilt, cercle, figure 8, positions';

  @override
  String get ma3CategoryEffect => 'Effets';

  @override
  String get ma3CategoryEffectDesc => 'Strobe, pulse, chase, séquences';

  @override
  String get ma3CategoryDimmer => 'Intensité';

  @override
  String get ma3CategoryDimmerDesc => 'Dimmer, bump, fade, blackout';

  @override
  String get ma3CategoryLayout => 'Layout';

  @override
  String get ma3CategoryLayoutDesc => 'Créer/organiser des layouts MA3';

  @override
  String get ma3CategorySelect => 'Sélection';

  @override
  String get ma3CategorySelectDesc => 'Sélection groupes, fixtures, filtres';

  @override
  String get ma3CategoryMacro => 'Macro';

  @override
  String get ma3CategoryMacroDesc => 'Macros multi-étapes, séquences console';

  @override
  String get ma3CategoryUtility => 'Utilitaire';

  @override
  String get ma3CategoryUtilityDesc => 'Label, store, organiser le show file';

  @override
  String get ma3CategoryCustom => 'Sur mesure';

  @override
  String get ma3CategoryCustomDesc => 'Décris librement ce que tu veux';

  @override
  String get ma3FieldColorSpace => 'Espace couleur des machines';

  @override
  String get ma3FieldColors => 'Couleurs à proposer comme presets';

  @override
  String get ma3FieldGroupSelect => 'Le plugin demande le groupe au lancement';

  @override
  String get ma3YesViaMa3Dialog => 'Oui — via dialog MA3';

  @override
  String get ma3NoUseCurrentSelection => 'Non — utilise la sélection courante';

  @override
  String get ma3FieldMovementType => 'Type de mouvement à créer';

  @override
  String get ma3MovePresetPositions =>
      'Presets positions (scène, face, côtés...)';

  @override
  String get ma3MoveCircle => 'Effect Engine — Cercle';

  @override
  String get ma3MoveFigure8 => 'Effect Engine — Figure 8';

  @override
  String get ma3MovePanSweep => 'Effect Engine — Pan sweep';

  @override
  String get ma3MoveTiltSweep => 'Effect Engine — Tilt sweep';

  @override
  String get ma3MoveRandom => 'Effect Engine — Aléatoire';

  @override
  String get ma3FieldSpeedSourceEffects => 'Source de vitesse (pour effects)';

  @override
  String get ma3SpeedBpmConsole => 'BPM — valeur saisie dans la console';

  @override
  String get ma3SpeedExecutorConsole =>
      'Executeur de vitesse — numéro saisi dans la console';

  @override
  String get ma3SpeedBothConsole => 'Les deux — choix proposé dans la console';

  @override
  String get ma3FieldEffectType => 'Type d\'effet à créer';

  @override
  String get ma3FieldOutput => 'Ce que le plugin crée';

  @override
  String get ma3OutputEffectPresets => 'Presets effet';

  @override
  String get ma3OutputChaseSequence => 'Séquence chase';

  @override
  String get ma3OutputTriggerMacro => 'Macro déclencheur';

  @override
  String get ma3FieldSpeedSource => 'Source de vitesse';

  @override
  String get ma3FieldFeatures => 'Fonctionnalités à inclure';

  @override
  String get ma3OutputIntensityMacros => 'Macros intensité';

  @override
  String get ma3OutputIntensityPresets => 'Presets intensité';

  @override
  String get ma3FieldLayoutSections => 'Sections à inclure dans le layout';

  @override
  String get ma3SectionColors => 'Couleurs';

  @override
  String get ma3SectionGroups => 'Groupes';

  @override
  String get ma3SectionPresets => 'Presets';

  @override
  String get ma3FieldVisualStyle => 'Style visuel';

  @override
  String get ma3FieldGroupNameNumber =>
      'Le plugin demande le nom/numéro au lancement';

  @override
  String get ma3NoHardcodedGenericName => 'Non — nom générique codé en dur';

  @override
  String get ma3FieldSelectionCriteria => 'Critères de sélection à proposer';

  @override
  String get ma3CriteriaEvenOdd => 'Pairs/Impairs';

  @override
  String get ma3CriteriaThirds => '1/3 — 2/3 — 3/3';

  @override
  String get ma3CriteriaPosition => 'Par position (avant/milieu/arrière)';

  @override
  String get ma3CriteriaAll => 'Tous';

  @override
  String get ma3CriteriaFirstLast => 'Premier/Dernier';

  @override
  String get ma3OutputSelectionMacros => 'Macros de sélection';

  @override
  String get ma3OutputGroupButtonsLayout => 'Boutons de groupe dans un layout';

  @override
  String get ma3FieldMacroSteps => 'Décris les étapes de la macro';

  @override
  String get ma3MacroStepsHint =>
      'ex:\n1. Sélectionner un groupe (dialog)\n2. Blackout\n3. Attendre 1s\n4. Fade In 3s';

  @override
  String get ma3FieldTrigger => 'Déclencheur';

  @override
  String get ma3TriggerManual => 'Manuel';

  @override
  String get ma3FieldTask => 'Tâche à effectuer';

  @override
  String get ma3TaskNameFixtures => 'Nommer les fixtures du patch';

  @override
  String get ma3TaskCreateGroups => 'Créer les groupes automatiquement';

  @override
  String get ma3TaskStorePresets => 'Stocker tous les presets';

  @override
  String get ma3TaskCleanEmptyObjects => 'Nettoyer les objets vides';

  @override
  String get ma3TaskCloneLayout => 'Cloner un layout';

  @override
  String get ma3TaskShowReport =>
      'Rapport du show (fixtures, groupes, presets)';

  @override
  String get ma3FieldConfirmEachAction => 'Confirmer avant chaque action';

  @override
  String get ma3Yes => 'Oui';

  @override
  String get ma3No => 'Non';

  @override
  String get ma3FieldCustomDescription =>
      'Décris ce que le plugin doit faire dans MA3';

  @override
  String get ma3ColorRed => 'Rouge';

  @override
  String get ma3ColorGreen => 'Vert';

  @override
  String get ma3ColorBlue => 'Bleu';

  @override
  String get ma3ColorYellow => 'Jaune';

  @override
  String get ma3ColorOrange => 'Orange';

  @override
  String get ma3ColorPink => 'Rose';

  @override
  String get ma3ColorColdWhite => 'Blanc froid';

  @override
  String get ma3ColorWarmWhite => 'Blanc chaud';

  @override
  String get ma3EffectStrobe => 'Strobe';

  @override
  String get ma3EffectPulse => 'Pulse';

  @override
  String get ma3EffectChase => 'Chase';

  @override
  String get ma3EffectTwinkle => 'Twinkle';

  @override
  String get ma3EffectFire => 'Fire';

  @override
  String get ma3EffectSawtooth => 'Sawtooth';

  @override
  String get ma3EffectRandom => 'Random';

  @override
  String get ma3Blackout => 'Blackout';

  @override
  String get ma3Full => 'Full';

  @override
  String get ma3Bump => 'Bump';

  @override
  String get ma3FadeIn => 'Fade In';

  @override
  String get ma3FadeOut => 'Fade Out';

  @override
  String get ma3DimmerChase => 'Dimmer Chase';

  @override
  String get ma3Compact => 'Compact';

  @override
  String get ma3Large => 'Large';

  @override
  String get ma3Tablet => 'Tablette';

  @override
  String get ma3Wing => 'Wing';

  @override
  String get ma3Random => 'Aléatoire';

  @override
  String get ma3FirstLast => 'Premier/Dernier';

  @override
  String ma3Error(Object error) {
    return 'Erreur : $error';
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
  String get ma3Text_Gel_Color => 'Gel Color';

  @override
  String get ma3Text_Cyan => 'Cyan';

  @override
  String get ma3Text_Magenta => 'Magenta';

  @override
  String get ma3Text_Lime => 'Lime';

  @override
  String get ma3Text_UV => 'UV';

  @override
  String get ma3Text_OFF => 'OFF';

  @override
  String get ma3Text_50 => '50%';

  @override
  String get ma3Text_25 => '25%';

  @override
  String get ma3Text_GO_button => 'GO button';

  @override
  String get ma3Text_Timecode => 'Timecode';

  @override
  String get ma3Text_OSC => 'OSC';

  @override
  String get ma3Text_MIDI => 'MIDI';

  @override
  String get gdtfShareAsZip => 'Partager en .zip';

  @override
  String get gdtfZipShareHelp =>
      '💡 Utile si Gmail ou votre messagerie bloque le .gdtf — renommez le fichier en .gdtf après réception.';

  @override
  String get rfAntennaTitle => 'Calculateur d\'antenne';

  @override
  String get rfSplitterTitle => 'Perte Répartiteur / Combineur';

  @override
  String get rfCableAntennaTitle => 'Câble RF & Antennes';

  @override
  String get rfCableLossSectionTitle => 'Perte dans le câble coaxial';

  @override
  String get rfCableLossCableTypeLabel => 'Type de câble';

  @override
  String get rfCableAntennaFrequencyLabel => 'Fréquence';

  @override
  String get rfCableLossLengthLabel => 'Longueur du câble';

  @override
  String get rfCableAntennaEmptyState =>
      'Renseignez les valeurs pour voir le résultat.';

  @override
  String get rfCableLossResultLabel => 'Perte totale';

  @override
  String get rfCableLossFormulaNote =>
      'Atténuation ≈ k1·√f + k2·f (dB/100 m) — modèle empirique par type de câble, ±5 % typique entre 100 MHz et 2,5 GHz. Valeurs indicatives : se référer à la datasheet du câble pour un budget de liaison critique.';

  @override
  String get rfDiversitySectionTitle => 'Espacement antennes diversity (λ/4)';

  @override
  String get rfDiversityResultLabel => 'Espacement recommandé';

  @override
  String get rfDiversityFormulaNote =>
      'λ/4 = 75 / f(MHz) mètres — espacement minimal recommandé entre deux antennes diversity pour limiter les évanouissements (fading) par trajets multiples.';

  @override
  String get rfPlannerTitle => 'Planificateur de Fréquences HF';

  @override
  String get rfPlannerBandLabel => 'Bande de fréquences';

  @override
  String get rfPlannerCustomBand => 'Personnalisée';

  @override
  String get rfPlannerMinFreqLabel => 'Fréquence min';

  @override
  String get rfPlannerMaxFreqLabel => 'Fréquence max';

  @override
  String get rfPlannerChannelCountLabel => 'Nombre de canaux souhaités';

  @override
  String get rfPlannerMinSpacingLabel => 'Espacement minimum entre canaux';

  @override
  String get rfPlannerResultTitle => 'Fréquences proposées';

  @override
  String get rfPlannerFoundLabel => 'Canaux trouvés';

  @override
  String get rfPlannerNotEnoughWarning =>
      'Impossible de trouver tous les canaux demandés dans cette bande avec cet espacement — essaie une bande plus large ou réduis le nombre de canaux/l\'espacement minimum.';

  @override
  String get rfPlannerFormulaNote =>
      'Évite les produits d\'intermodulation du 3e ordre (2fA−fB, fA+fB−fC) entre tous les canaux, tolérance ±200 kHz — pas de garantie absolue, vérifie sur le terrain avec un scan RF.';

  @override
  String get rfSplitterWaysLabel => 'Nombre de voies';

  @override
  String get rfSplitterExcessLossLabel => 'Perte excédentaire du répartiteur';

  @override
  String get rfSplitterAdditionalLossLabel => 'Pertes câbles & connecteurs';

  @override
  String get rfSplitterTotalTitle => 'Perte totale d\'insertion';

  @override
  String get rfSplitterTheoreticalLabel => 'Perte théorique (10·log₁₀N)';

  @override
  String get rfSplitterReferenceTitle => 'Repères par nombre de voies';

  @override
  String get rfSplitterFormulaNote =>
      'Perte totale ≈ perte théorique + perte excédentaire + pertes câbles/connecteurs';

  @override
  String get rfFrequency => 'Fréquence';

  @override
  String get rfVelocityFactorTitle => 'Facteur de vélocité (Vf)';

  @override
  String get rfAntennaLengths => 'Longueurs d\'antenne';

  @override
  String get rfEnterFrequencyToCalculate =>
      'Saisissez une fréquence pour calculer';

  @override
  String get rfFullWave => 'Onde complète (λ)';

  @override
  String get rfHalfWave => 'Demi-onde (λ/2)';

  @override
  String get rfStandardDipole => 'Dipôle standard';

  @override
  String get rfQuarterWave => 'Quart d\'onde (λ/4)';

  @override
  String get rfWhipAntenna => 'Antenne fouet — la plus courante';

  @override
  String get rfFiveEighthWave => '5/8 onde (5λ/8)';

  @override
  String get rfFiveEighthWaveDescription => 'Gain +3 dB vs λ/4';

  @override
  String get rfReferenceFrequencies => 'Fréquences de référence';

  @override
  String get rfFmRadio => 'FM Radio (88 MHz)';

  @override
  String get rfVhfLow => 'VHF Bas (174 MHz)';

  @override
  String get rfUhf470 => 'UHF 470 MHz';

  @override
  String get rfUhf600 => 'UHF 600 MHz';

  @override
  String get rfUhf694 => 'UHF 694 MHz (limite FR)';

  @override
  String get rfIsm863 => 'ISM 863 MHz';

  @override
  String get rfWifi24 => 'WiFi 2.4 GHz';

  @override
  String get rfWifi5 => 'WiFi 5 GHz (centre)';

  @override
  String get rfFormulaExplanation =>
      'λ = c / f × Vf    |    c = 299.792 m/µs\nVf = facteur de vélocité du câble (1.00 pour l\'air libre)';

  @override
  String get rfPresetFreeSpace => 'Air libre';

  @override
  String get rfCoexTitle => 'Coexistence 2.4 GHz';

  @override
  String get rfCoexBandOccupancyTitle => 'Qui occupe la bande 2.4 GHz ?';

  @override
  String get rfCoexAvProtocolsTitle => '⚡ Protocoles AV sur 2.4 GHz';

  @override
  String get rfCoexAllProtocolsTitle => 'Tous les protocoles';

  @override
  String get rfCoexFrequentConflictsTitle =>
      'Conflits fréquents en événementiel';

  @override
  String get rfCoexFieldRecommendationsTitle => 'Recommandations terrain';

  @override
  String get rfCoexProtocolWifi24Name => 'WiFi 2.4 GHz';

  @override
  String get rfCoexProtocolWifi24Note =>
      'Canaux fixes, bande large. Forte puissance d\'émission.';

  @override
  String get rfCoexProtocolBluetoothClassicName => 'Bluetooth Classic';

  @override
  String get rfCoexProtocolBluetoothClassicNote =>
      'Saute entre 1600 fréquences/s. Coexistence avec WiFi via AFH.';

  @override
  String get rfCoexProtocolBluetoothLeName => 'Bluetooth LE';

  @override
  String get rfCoexProtocolBluetoothLeNote =>
      'Canaux 37, 38, 39 = advertising (fixes). Risque avec WiFi ch1.';

  @override
  String get rfCoexProtocolZigbeeName => 'Zigbee (IEEE 802.15.4)';

  @override
  String get rfCoexProtocolZigbeeNote =>
      'Canaux 11–26, chacun 2 MHz large. Compatible avec WiFi ch1/6/11.';

  @override
  String get rfCoexProtocolDigitalMics24Name => 'Micros num. 2.4 GHz';

  @override
  String get rfCoexProtocolDigitalMics24Note =>
      'Shure GLX-D, Line6 XD-V, Sennheiser EW-D 2.4 GHz. Très sensibles aux interférences WiFi.';

  @override
  String get rfCoexProtocolWirelessDmxName => 'DMX / RDM sans-fil';

  @override
  String get rfCoexProtocolWirelessDmxNote =>
      'Lumen Radio CRMX, W-DMX, City Theatrical. FHSS = robuste mais partage la bande.';

  @override
  String get rfCoexProtocolWirelessVideoName => 'Vidéo sans-fil';

  @override
  String get rfCoexProtocolWirelessVideoNote =>
      'Hollyland Mars, DJI O3, Teradek Bolt 4K. Très large bande, conflits majeurs possibles.';

  @override
  String get rfCoexTypeDsssOfdm => 'DSSS / OFDM';

  @override
  String get rfCoexTypeFhss79 => 'FHSS 79 canaux';

  @override
  String get rfCoexTypeFhss40 => 'FHSS 40 canaux';

  @override
  String get rfCoexTypeDsss16 => 'DSSS 16 canaux';

  @override
  String get rfCoexTypeFhssDsss => 'FHSS / DSSS';

  @override
  String get rfCoexTypeFhss => 'FHSS';

  @override
  String get rfCoexTypeOfdm => 'OFDM';

  @override
  String get rfCoexConflictWifiCh6 => 'WiFi ch6';

  @override
  String get rfCoexConflictMic24 => 'Micro 2.4 GHz';

  @override
  String get rfCoexConflictBleAdvertising => 'BLE advertising';

  @override
  String get rfCoexConflictWifiCh1 => 'WiFi ch1';

  @override
  String get rfCoexConflictWirelessVideo => 'Vidéo sans-fil';

  @override
  String get rfCoexConflictEverythingElse => 'Tout le reste';

  @override
  String get rfCoexConflictZigbeeCh11 => 'Zigbee ch11';

  @override
  String get rfCoexRiskHigh => 'ÉLEVÉ';

  @override
  String get rfCoexRiskMedium => 'MOYEN';

  @override
  String get rfCoexConflictWifiCh6Mic24Desc =>
      'Le WiFi ch6 chevauche directement les fréquences favorites des micros numériques.';

  @override
  String get rfCoexConflictBleWifiCh1Desc =>
      'Les canaux BLE 37/38/39 se trouvent à 2402, 2426 et 2480 MHz.';

  @override
  String get rfCoexConflictVideoEverythingDesc =>
      'Les liens vidéo sans-fil utilisent une bande large et saturent facilement la bande.';

  @override
  String get rfCoexConflictZigbeeWifiCh1Desc =>
      'Le canal Zigbee 11 (2405 MHz) est directement dans la bande du WiFi canal 1.';

  @override
  String get rfCoexTipWifiChannels =>
      'Réservez le WiFi aux canaux 1 et/ou 11. Évitez le canal 6 si vous avez des micros 2.4 GHz.';

  @override
  String get rfCoexTipUhfMics =>
      'Pour les micros HF en zone dense, préférez les systèmes UHF (470–694 MHz) aux systèmes 2.4 GHz.';

  @override
  String get rfCoexTipWirelessVideo5Ghz =>
      'Les liens vidéo sans-fil : utilisez impérativement la bande 5 GHz quand c\'est possible.';

  @override
  String get rfCoexTipWirelessDmxFhss =>
      'Le DMX sans-fil FHSS est le plus robuste — il saute automatiquement les fréquences occupées.';

  @override
  String get rfCoexTipSpectrumScan =>
      'Faites un scan du spectre avant l\'event avec une app RF (WiFi Analyzer, Chanalyzer, etc.).';

  @override
  String get rfPageTitle => 'RF & Sans-fil';

  @override
  String get rfSectionMicrosHf => 'Micros HF & Antennes';

  @override
  String get rfSectionCalcHf => 'Calculs HF';

  @override
  String get rfSectionWifi => 'WiFi';

  @override
  String get rfSectionCoexistence => 'Coexistence';

  @override
  String get rfSectionScanTerrain => 'Scan & Terrain';

  @override
  String get rfFreeLabel => 'GRATUIT';

  @override
  String get rfToolUhfBandsTitle => 'Bandes UHF / VHF';

  @override
  String get rfToolUhfBandsSubtitle =>
      'Bandes légales France (ANFR), UHF 470–694 MHz, dividende numérique, DECT, ISM 863 MHz.';

  @override
  String get rfToolAntennaTitle => 'Calculateur d\'Antenne';

  @override
  String get rfToolAntennaSubtitle =>
      'Fréquence → λ/4, λ/2, 5λ/8. Facteur de vélocité pour câbles coaxiaux. Références UHF/WiFi.';

  @override
  String get rfToolIm3Title => 'Intermodulation IM3';

  @override
  String get rfToolIm3Subtitle =>
      'Calcule 2Fi−Fj pour 2 à 16 fréquences. Détecte les produits qui tombent sur vos canaux.';

  @override
  String get rfToolWifi24Title => 'Canaux WiFi 2.4 GHz';

  @override
  String get rfToolWifi24Subtitle =>
      '13 canaux, chevauchements visuels, simulateur de conflits. Canaux non-conflictuels 1, 6, 11.';

  @override
  String get rfToolWifi5Title => 'Canaux WiFi 5 GHz';

  @override
  String get rfToolWifi5Subtitle =>
      'Bandes UNII-1/2A/2C, DFS, canaux disponibles en France. Non-chevauchants à 80 MHz.';

  @override
  String get rfToolCoexTitle => 'Coexistence 2.4 GHz';

  @override
  String get rfToolCoexSubtitle =>
      'Qui partage la bande : WiFi, Bluetooth, Zigbee, micros numériques, DMX sans-fil, vidéo. Conflits typiques.';

  @override
  String get rfToolScanWifiTitle => 'Scan WiFi';

  @override
  String get rfToolScanWifiSubtitle =>
      'Analyse les réseaux WiFi environnants : canaux, RSSI, bandes 2.4/5 GHz. Visualisation occupation du spectre.';

  @override
  String get rfToolScanLogTitle => 'Journal de Scan RF';

  @override
  String get rfToolScanLogSubtitle =>
      'Relevé manuel des fréquences : niveau signal, statut (libre/borderline/occupé), notes terrain.';

  @override
  String get rfIm3PageTitle => 'Intermodulation IM3';

  @override
  String get rfIm3WhatIs => 'Qu\'est-ce que l\'IM3 ?';

  @override
  String get rfIm3WhatIsBody =>
      'Quand deux émetteurs F1 et F2 entrent dans un ampli ou un récepteur, ils génèrent des fréquences parasites à 2F1−F2 et 2F2−F1. Ces produits d\'intermodulation du 3ᵉ ordre tombent près des fréquences originales et peuvent bloquer un canal HF voisin.';

  @override
  String get rfIm3QuickMode => 'Mode rapide — 2 fréquences';

  @override
  String get rfIm3AdvancedMode => 'Mode avancé — jusqu\'à 16 fréquences';

  @override
  String rfIm3FrequencyN(int index) {
    return 'Fréquence $index';
  }

  @override
  String get rfIm3AddFrequency => 'Ajouter une fréquence';

  @override
  String get rfIm3Tips => 'Conseils terrain';

  @override
  String get rfIm3Tip1 =>
      'Espacez vos fréquences de façon irrégulière. Des écarts réguliers génèrent des IM3 qui tombent pile sur vos canaux.';

  @override
  String get rfIm3Tip2 =>
      'Tolérance de détection : ±200 kHz. Adaptez selon la largeur de bande de vos systèmes (généralement 200–400 kHz).';

  @override
  String get rfIm3Tip3 =>
      'Les outils Shure Wireless Workbench, Sennheiser WSM et Audio-Technica Frequency Manager intègrent le calcul IM3 pour leurs gammes — utilisez-les pour le déploiement final.';

  @override
  String get rfIm3OutOfBand => 'Hors bande (< 0 MHz)';

  @override
  String get rfIm3ConflictOnFreq =>
      '⚠ Tombe sur une fréquence utilisée (±200 kHz)';

  @override
  String get rfIm3TableFormula => 'Formule';

  @override
  String get rfIm3TableFreqIm3 => 'Fréquence IM3';

  @override
  String get rfIm3TableStatus => 'Statut';

  @override
  String get rfIm3Footnote =>
      'IM3 = 2×Fi − Fj    |    Tolérance conflit : ±200 kHz\nLes produits négatifs (hors spectre) sont affichés mais non conflictuels.';

  @override
  String rfIm3Conflicts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 's',
      one: '',
    );
    return '$count conflit$_temp0';
  }

  @override
  String get rfScanLogTitle => 'Journal de Scan RF';

  @override
  String get rfScanLogClearAll => 'Tout effacer';

  @override
  String get rfScanLogAdd => 'Ajouter';

  @override
  String get rfScanLogClearConfirmTitle => 'Effacer le journal ?';

  @override
  String get rfScanLogClearConfirmContent =>
      'Toutes les entrées seront supprimées.';

  @override
  String get rfScanLogCancel => 'Annuler';

  @override
  String get rfScanLogDelete => 'Effacer';

  @override
  String get rfScanLogNewEntry => 'Nouvelle entrée';

  @override
  String get rfScanLogFrequency => 'Fréquence';

  @override
  String get rfScanLogOptionalLevel => 'Niveau mesuré (optionnel)';

  @override
  String get rfScanLogNote => 'Note';

  @override
  String get rfScanLogNoteHint => 'ex: canal 36, salle B, interférence TV...';

  @override
  String get rfScanLogStatusLabel => 'Statut :';

  @override
  String get rfScanLogSave => 'Enregistrer';

  @override
  String get rfScanLogEmptyTitle => 'Journal vide';

  @override
  String get rfScanLogEmptyBody =>
      'Notez vos mesures terrain ici : fréquence, niveau mesuré sur l\'analyseur, statut et commentaire.';

  @override
  String get rfScanLogFirstEntry => 'Première entrée';

  @override
  String get rfScanLogStatusFree => 'Libre';

  @override
  String get rfScanLogStatusOccupied => 'Occupée';

  @override
  String get rfScanLogStatusBorderline => 'Borderline';

  @override
  String get rfScanLogInstant => 'À l\'instant';

  @override
  String rfScanLogMinutesAgo(int n) {
    return 'Il y a $n min';
  }

  @override
  String rfScanLogHoursAgo(int n) {
    return 'Il y a $n h';
  }

  @override
  String get rfScanLogFreePlural => 'Libres';

  @override
  String get rfScanLogOccupiedPlural => 'Occupées';

  @override
  String get rfScanLogBorderlinePlural => 'Border.';

  @override
  String get rfScanLogTotal => 'Total';

  @override
  String get rfUhfBandsTitle => 'Bandes UHF / VHF';

  @override
  String get rfUhfBandsOverview => 'Vue d\'ensemble — France';

  @override
  String get rfUhfBandsTips => 'Conseils pour le choix de bande';

  @override
  String get rfUhfBandsSource =>
      'Source : ANFR / ARCEP — Réglementation française.\nLes règles peuvent varier selon les pays.\nVérifiez toujours la conformité de votre matériel.';

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
      '470–694 MHz : optimal pour les productions pro. Large choix de fréquences, bon comportement RF. Déclarer l\'usage à l\'ANFR pour les événements professionnels.';

  @override
  String get rfUhfTip2 =>
      'Vérifiez impérativement que votre matériel est hors bande 694–790 MHz. Les anciens systèmes non revendus post-2017 sont illégaux sur scène.';

  @override
  String get rfUhfTip3 =>
      'DECT (1880–1900 MHz) est idéal pour les systèmes de conférence : bande dédiée, pas d\'interférences WiFi/BT.';

  @override
  String get rfUhfTip4 =>
      'Les systèmes 2.4 GHz sont pratiques mais sensibles aux environnements WiFi denses. À éviter dans les grandes salles de congrès.';

  @override
  String get rfLegendPro => 'Pro (autorisation)';

  @override
  String get rfLegendFree => 'Libre';

  @override
  String get rfLegendForbidden => 'Interdit';

  @override
  String get rfWifi24PageTitle => 'WiFi 2.4 GHz';

  @override
  String get rfWifi24SpectrumTitle => 'Spectre 2.4 GHz — chevauchements';

  @override
  String get rfWifi24SimulateTitle => 'Simuler la coexistence';

  @override
  String get rfWifi24SelectChannels =>
      'Sélectionnez les canaux utilisés dans votre environnement :';

  @override
  String get rfWifi24ConflictWarning =>
      '⚠️ Les canaux sélectionnés se chevauchent — risque d\'interférences mutuelles.';

  @override
  String get rfWifi24ChannelTableTitle => 'Tableau des canaux';

  @override
  String get rfWifi24BestPractices => 'Bonnes pratiques';

  @override
  String get rfWifi24LegendNonOverlap => 'Canal non-chevauchant';

  @override
  String get rfWifi24LegendOk => 'Sélectionné OK';

  @override
  String get rfWifi24LegendConflict => 'Conflit';

  @override
  String get rfWifi24HdrChannel => 'Canal';

  @override
  String get rfWifi24HdrCenter => 'Centre';

  @override
  String get rfWifi24HdrStart => 'Début';

  @override
  String get rfWifi24HdrEnd => 'Fin';

  @override
  String get rfWifi24Tip1 =>
      'Utilisez toujours les canaux 1, 6 et 11 pour 3 réseaux WiFi non-chevauchants.';

  @override
  String get rfWifi24Tip2 =>
      'Avec des canaux à 20 MHz, les canaux 1, 5, 9 et 13 sont également non-chevauchants.';

  @override
  String get rfWifi24Tip3 =>
      'Le WiFi 2.4 GHz partage la bande avec Bluetooth, Zigbee et les micros numériques 2.4 GHz.';

  @override
  String get rfWifi24Tip4 =>
      'En zone dense, préférez le 5 GHz (moins encombré) pour les équipements sensibles.';

  @override
  String get rfWifi5PageTitle => 'WiFi 5 GHz';

  @override
  String get rfWifi5RegulationTitle => 'Réglementation France (ARCEP)';

  @override
  String get rfWifi5BandsAvailable => 'Bandes disponibles';

  @override
  String get rfWifi5Unii3Forbidden => 'UNII-3 (5725–5850)';

  @override
  String get rfWifi5ForbiddenLabel => 'Interdit';

  @override
  String get rfWifi5DfsNote =>
      '⚠️ DFS (Dynamic Frequency Selection) : les canaux UNII-2A et 2C nécessitent la détection radar. L\'équipement peut changer automatiquement de canal si un radar est détecté.';

  @override
  String get rfWifi5ChannelWidthsTitle => 'Largeurs de canal';

  @override
  String get rfWifi5Bw20 => 'Compatibilité max, débit limité';

  @override
  String get rfWifi5Bw40 => '2 canaux liés — 802.11n';

  @override
  String get rfWifi5Bw80 => '4 canaux liés — 802.11ac/ax';

  @override
  String get rfWifi5Bw160 => '8 canaux liés — 802.11ax seulement';

  @override
  String get rfWifi5NonOverlapTitle =>
      'Canaux non-chevauchants à 80 MHz (France)';

  @override
  String get rfWifi5NonOverlapFor3 =>
      'Pour 3 réseaux 80 MHz sans chevauchement (France) :';

  @override
  String get rfWifi5MaxNetworks =>
      '→ Jusqu\'à 6 réseaux 80 MHz disponibles sur UNII-2C seul.';

  @override
  String get rfWifi5ChannelsMhz => 'Canaux (20 MHz)';

  @override
  String get rfWifi5ForbiddenFR => 'Interdit FR';

  @override
  String get rfWifi5Indoor => 'Indoor';

  @override
  String get rfWifiScanTitle => 'Scan WiFi';

  @override
  String get rfWifiScanPlatformInfo =>
      'Scan actif sur Android (permission localisation requise). Sur iOS, seul le réseau connecté est visible.';

  @override
  String get rfWifiScanStart => 'Lancer le scan';

  @override
  String get rfWifiScanInProgress => 'Scan en cours…';

  @override
  String get rfWifiScanGroupedTooltip => 'Vue liste';

  @override
  String get rfWifiScanFlatTooltip => 'Vue groupée';

  @override
  String get rfWifiScanNoResults =>
      'Lance le scan pour voir les réseaux voisins.';

  @override
  String get rfWifiScanOccupation => 'Occupation canaux 2.4 GHz';

  @override
  String get rfWifiScanNonOverlapNote =>
      'Canaux en gras (1, 6, 11) = non-chevauchants';

  @override
  String get rfWifiScanHidden => '(réseau caché)';

  @override
  String rfWifiScanNetworks24(int count) {
    return '$count réseaux';
  }

  @override
  String rfWifiScanNetworks5(int count) {
    return '$count réseaux';
  }

  @override
  String rfWifiScanTotal(int count) {
    return '$count total';
  }

  @override
  String get rfWifiScanSub24 => '2.4 GHz';

  @override
  String get rfWifiScanSub5 => '5 GHz';

  @override
  String get rfWifiScanSubTotal => 'réseaux';

  @override
  String get rfWifiRssiExcellent => 'Excellent';

  @override
  String get rfWifiRssiBon => 'Bon';

  @override
  String get rfWifiRssiMoyen => 'Moyen';

  @override
  String get rfWifiRssiFaible => 'Faible';

  @override
  String get audioLevelInputDbu => 'Valeur en dBu';

  @override
  String get audioLevelInputDbv => 'Valeur en dBV';

  @override
  String get audioLevelInputVrms => 'Tension RMS';

  @override
  String get audioLevelDbfsNote =>
      '* dBFS relatif à +24 dBu = 0 dBFS (valeur typique — varie selon le système)';

  @override
  String get audioGainStagingTip1 =>
      'Visez +4 dBu en nominal sur chaque étage. Gardez ~18 dB de headroom avant le clip.';

  @override
  String get audioGainStagingTip2 =>
      'La différence consumer/pro (+4 dBu vs −10 dBV) est de ~11.8 dB — compensez le gain à chaque interface.';

  @override
  String get audioGainStagingTip3 =>
      'Ligne symétrique (XLR) : +4 dBu. Ligne asymétrique (Jack TS) : −10 dBV. DI box pour adapter impédance et niveau.';

  @override
  String get audioGainStagingTip4 =>
      'dBu = dB rapporté à 0.775 V (600 Ω). dBV = dB rapporté à 1 V. dBV = dBu − 2.218.';

  @override
  String get audioDiffTipEqual =>
      'Sources quasi-égales : gain de ~+3 dB sur la plus forte.';

  @override
  String audioDiffTipSmall(String diff) {
    return 'Différence de $diff dB : la plus faible contribue peu.';
  }

  @override
  String audioDiffTipMedium(String diff, String gain) {
    return 'Différence de $diff dB : gain limité à ~$gain dB sur la source dominante.';
  }

  @override
  String get audioDiffTipLarge =>
      'Différence > 10 dB : la source faible est négligeable. Gain ≈ +0 dB.';

  @override
  String get audioIncoherentShortLabel => 'Incoh. : ';

  @override
  String get audioCoherentShortLabel => 'Cohér. : ';

  @override
  String audioAtDistance(String dist) {
    return 'À $dist m';
  }

  @override
  String get rfWifiScanErrLocationRequired =>
      'Permission de localisation requise pour le scan WiFi.';

  @override
  String get rfWifiScanErrLocationDenied =>
      'Permission de localisation refusée. Activez-la dans les réglages.';

  @override
  String get rfWifiScanErrLocationDisabled =>
      'Service de localisation désactivé. Activez-le sur l\'appareil.';

  @override
  String get rfWifiScanErrNotSupported =>
      'Scan WiFi non supporté sur cet appareil ou cette version d\'OS.';

  @override
  String get rfWifiScanErrFailed => 'Impossible de démarrer le scan.';

  @override
  String get rfWifiScanErrDefault => 'Scan impossible sur cet appareil.';

  @override
  String get rfWifiScanErrReadResults =>
      'Impossible de lire les résultats du scan.';

  @override
  String rfWifiScanErrGeneric(String error) {
    return 'Erreur lors du scan : $error';
  }

  @override
  String get homeNetworkTitle => 'Réseau';

  @override
  String get homeNetworkSubtitle => 'Scan réseau local, Art-Net, sACN / E1.31.';

  @override
  String get networkPageTitle => 'Réseau';

  @override
  String get networkScanCardTitle => 'Scan réseau';

  @override
  String get networkScanCardSubtitle =>
      'Détecter les appareils actifs sur le réseau local.';

  @override
  String get networkArtNetCardTitle => 'Visualizer Art-Net';

  @override
  String get networkArtNetAddressingTitle => 'Adressage Art-Net';

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
      'Renseignez des valeurs valides pour voir le résultat.';

  @override
  String get networkArtNetFormulaNote =>
      'Port-Address (15 bits) = (Net « 8) | (Sub-Net « 4) | Universe — Net 0-127, Sub-Net 0-15, Universe 0-15, Port-Address 0-32767 (spec Art-Net 4).';

  @override
  String get networkArtNetCardSubtitle =>
      'Écoute et analyse des paquets ArtDMX en temps réel.';

  @override
  String get networkSacnCardTitle => 'Visualizer sACN / E1.31';

  @override
  String get networkSacnCardSubtitle =>
      'Écoute et analyse des paquets sACN / E1.31 en temps réel.';

  @override
  String get networkComingSoon => 'À venir';

  @override
  String get networkFutureLuminex => 'Monitoring Luminex';

  @override
  String get networkFutureMaNet => 'Détection MA-Net';

  @override
  String get networkFutureAlarms => 'Alarmes réseau';

  @override
  String get networkFutureSnapshots => 'Snapshots réseau';

  @override
  String get networkFutureExport => 'Export PDF / CSV';

  @override
  String get networkScanTitle => 'Scan réseau';

  @override
  String get networkPoeTitle => 'Calculateur PoE';

  @override
  String get networkFiberTitle => 'Budget de Liaison Fibre';

  @override
  String get networkSubnetTitle => 'Calculateur de Sous-réseau';

  @override
  String get networkSubnetIpLabel => 'Adresse IP';

  @override
  String get networkSubnetPrefixLabel => 'Masque (CIDR)';

  @override
  String get networkSubnetNetworkLabel => 'Adresse réseau';

  @override
  String get networkSubnetBroadcastLabel => 'Adresse de broadcast';

  @override
  String get networkSubnetNetmaskLabel => 'Masque de sous-réseau';

  @override
  String get networkSubnetWildcardLabel => 'Masque générique (wildcard)';

  @override
  String get networkSubnetFirstHostLabel => 'Première IP utilisable';

  @override
  String get networkSubnetLastHostLabel => 'Dernière IP utilisable';

  @override
  String get networkSubnetHostCountLabel => 'Nombre d\'hôtes utilisables';

  @override
  String get networkSubnetInvalidIp =>
      'Adresse IP invalide (format attendu : 192.168.1.0)';

  @override
  String get networkSubnetDivideTitle => 'Diviser en sous-réseaux égaux';

  @override
  String get networkSubnetDivideNote =>
      'Choisis en combien de sous-réseaux diviser ce réseau.';

  @override
  String get networkFiberTypeLabel => 'Type de fibre';

  @override
  String get networkFiberDistanceLabel => 'Distance';

  @override
  String get networkFiberAttenuationLabel => 'Atténuation (par km)';

  @override
  String get networkFiberAdditionalLossLabel =>
      'Pertes connecteurs & épissures';

  @override
  String get networkFiberBudgetLabel =>
      'Budget de liaison émetteur/récepteur (optionnel)';

  @override
  String get networkFiberTotalTitle => 'Perte totale de la liaison';

  @override
  String get networkFiberMarginLabel => 'Marge restante';

  @override
  String get networkFiberWarningOver =>
      'Marge dépassée : la liaison risque de ne pas fonctionner correctement sur cette distance.';

  @override
  String get networkFiberFormulaNote =>
      'Perte totale = atténuation × distance + pertes connecteurs/épissures';

  @override
  String get networkPoeBudgetLabel => 'Budget de l\'injecteur / switch';

  @override
  String get networkPoeDeviceLabel => 'Appareil';

  @override
  String get networkPoeClassLabel => 'Classe PoE';

  @override
  String get networkPoeClassManual => 'Manuel (valeur libre)';

  @override
  String get networkPoeClassWord => 'Classe';

  @override
  String get networkPoeDevicePowerLabel => 'Puissance';

  @override
  String get networkPoeAddDevice => 'Ajouter un appareil';

  @override
  String get networkPoeTotalTitle => 'Consommation totale';

  @override
  String get networkPoeRemainingLabel => 'Budget restant';

  @override
  String get networkPoeEmptyState =>
      'Ajoute au moins un appareil pour calculer.';

  @override
  String get networkPoeWarningOver =>
      'Budget dépassé : retire des appareils ou choisis un switch/injecteur plus puissant.';

  @override
  String get networkPoeFormulaNote =>
      'Consommation totale = somme des appareils. Prévois une marge d\'environ 10 à 20 % sous le budget total.';

  @override
  String get networkScanStartButton => 'Lancer le scan';

  @override
  String get networkScanStopButton => 'Arrêter le scan';

  @override
  String get networkScanScanning => 'Scan en cours…';

  @override
  String networkScanProgress(int done, int total) {
    return '$done / $total IP scannées';
  }

  @override
  String networkScanDevicesFound(int count) {
    return '$count appareil(s) trouvé(s)';
  }

  @override
  String get networkScanNoDevicesFound =>
      'Aucun appareil trouvé sur ce réseau.';

  @override
  String get networkScanNoNetwork =>
      'Aucun réseau local (Wi-Fi) détecté. Connectez-vous à un réseau.';

  @override
  String get networkScanIosLimitation =>
      'Sur iOS, les adresses MAC et le fabricant ne sont pas accessibles par les apps (restriction Apple).';

  @override
  String get networkScanLocalIp => 'IP locale';

  @override
  String get networkScanSubnet => 'Masque';

  @override
  String get networkScanStatusOnline => 'En ligne';

  @override
  String networkScanResponseMs(int ms) {
    return '$ms ms';
  }

  @override
  String get networkScanPermissionDenied =>
      'Permission réseau refusée. Vérifiez les autorisations.';

  @override
  String get networkScanErrorGeneric =>
      'Erreur réseau. Vérifiez votre connexion.';

  @override
  String get networkScanHint =>
      'Appuyez sur « Lancer le scan » pour détecter les appareils.';

  @override
  String get artnetTitle => 'Visualizer Art-Net';

  @override
  String get artnetStartButton => 'Démarrer l\'écoute';

  @override
  String get artnetStopButton => 'Arrêter';

  @override
  String get artnetListening => 'Écoute — Port 6454';

  @override
  String get artnetNotListening => 'Inactif';

  @override
  String get artnetNoPackets => 'En attente de paquets Art-Net…';

  @override
  String get artnetUniversesTitle => 'Univers reçus';

  @override
  String artnetUniverseTitle(int universe) {
    return 'Univers $universe';
  }

  @override
  String artnetSourceIp(Object ip) {
    return 'Source : $ip';
  }

  @override
  String artnetPackets(int count) {
    return '$count paquets';
  }

  @override
  String artnetFps(Object fps) {
    return '$fps fps';
  }

  @override
  String get artnetShowActiveOnly => 'Canaux actifs uniquement';

  @override
  String artnetActiveCount(int count) {
    return '$count canaux actifs';
  }

  @override
  String get artnetPlatformInfo =>
      'Art-Net — UDP port 6454. Doit être sur le même réseau que la source.';

  @override
  String get artnetErrorBind =>
      'Impossible d\'ouvrir le socket UDP. Vérifiez les permissions réseau.';

  @override
  String get sacnTitle => 'Visualizer sACN';

  @override
  String get sacnStartButton => 'Démarrer l\'écoute';

  @override
  String get sacnStopButton => 'Arrêter';

  @override
  String get sacnListening => 'Écoute — Port 5568';

  @override
  String get sacnNotListening => 'Inactif';

  @override
  String get sacnNoPackets => 'En attente de paquets sACN…';

  @override
  String get sacnUniversesTitle => 'Univers reçus';

  @override
  String sacnUniverseTitle(int universe) {
    return 'Univers $universe';
  }

  @override
  String sacnSource(Object name) {
    return 'Source : $name';
  }

  @override
  String sacnPriority(int value) {
    return 'Priorité : $value';
  }

  @override
  String sacnCid(Object cid) {
    return 'CID : $cid';
  }

  @override
  String sacnPackets(int count) {
    return '$count paquets';
  }

  @override
  String sacnFps(Object fps) {
    return '$fps fps';
  }

  @override
  String get sacnShowActiveOnly => 'Canaux actifs uniquement';

  @override
  String sacnActiveCount(int count) {
    return '$count canaux actifs';
  }

  @override
  String get sacnPlatformInfo =>
      'sACN / E1.31 — UDP port 5568. Multicast 239.255.x.x et unicast supportés.';

  @override
  String get sacnErrorBind =>
      'Impossible d\'ouvrir le socket UDP. Vérifiez les permissions réseau.';

  @override
  String get sacnIosMulticastNote =>
      'Sur iOS 14+, le multicast sACN peut nécessiter l\'autorisation d\'accès au réseau local.';

  @override
  String get diagCardTitle => 'Bilan de santé';

  @override
  String get diagCardSubtitle =>
      'Une note et la liste des problèmes : réseau, Art-Net, sACN, GigaCore.';

  @override
  String get diagPageTitle => 'Bilan de santé';

  @override
  String get diagPlatformInfo =>
      'Lance un scan réseau + écoute Art-Net/sACN pendant quelques secondes, puis analyse les problèmes potentiels.';

  @override
  String get diagAnalyseButton => 'Analyser';

  @override
  String get diagCancelButton => 'Annuler';

  @override
  String get diagClearButton => 'Effacer';

  @override
  String get diagSnapshotButton => 'Snapshot';

  @override
  String get diagScoreLabel => 'Score santé réseau';

  @override
  String get diagStatusOk => 'Réseau OK';

  @override
  String get diagStatusWarning => 'Attention';

  @override
  String get diagStatusCritical => 'Critique';

  @override
  String diagAnalysisDate(Object date) {
    return 'Analysé le $date';
  }

  @override
  String get diagSeverityInfo => 'Info';

  @override
  String get diagSeverityWarning => 'Avertissement';

  @override
  String get diagSeverityCritical => 'Critique';

  @override
  String get diagScanningNetwork => 'Scan réseau en cours…';

  @override
  String get diagCollectingFlux => 'Collecte des flux Art-Net / sACN…';

  @override
  String get diagAnalyzing => 'Analyse en cours…';

  @override
  String diagScanProgress(int done, int total) {
    return '$done / $total IPs scannées';
  }

  @override
  String get diagNoResultYet =>
      'Appuyez sur « Analyser » pour lancer le diagnostic réseau.';

  @override
  String get diagAlertsTitle => 'Alertes';

  @override
  String get diagNoAlerts => 'Aucune alerte détectée — réseau sain.';

  @override
  String get diagSnapshotSaved => 'Snapshot sauvegardé.';

  @override
  String get diagNoLocalIp =>
      'Aucune adresse IP locale détectée ou adresse invalide.';

  @override
  String get diagNoDevices => 'Aucun appareil détecté sur le réseau.';

  @override
  String get diagNoArtNet => 'Aucun flux Art-Net reçu.';

  @override
  String get diagNoSacn => 'Aucun flux sACN / E1.31 reçu.';

  @override
  String diagDuplicateIp(Object ip) {
    return 'Adresse IP en doublon détectée : $ip.';
  }

  @override
  String diagArtNetLowFps(int universe, Object fps) {
    return 'Art-Net Univers $universe : FPS faible ($fps fps).';
  }

  @override
  String diagSacnLowFps(int universe, Object fps) {
    return 'sACN Univers $universe : FPS faible ($fps fps).';
  }

  @override
  String diagZeroDmxChannels(Object protocol, int universe) {
    return '$protocol Univers $universe : flux actif mais tous les canaux DMX sont à zéro.';
  }

  @override
  String diagManyUnknownDevices(int count) {
    return '$count appareil(s) sans nom détectés sur le réseau.';
  }

  @override
  String get ndiCardTitle => 'Découverte NDI';

  @override
  String get ndiCardSubtitle => 'Sources NDI / NewTek sur le réseau via mDNS.';

  @override
  String get ndiPageTitle => 'Découverte NDI';

  @override
  String get ndiStartButton => 'Démarrer';

  @override
  String get ndiStopButton => 'Arrêter';

  @override
  String get ndiDiscovering => 'Recherche en cours…';

  @override
  String get ndiHint =>
      'Appuyez sur « Démarrer » pour rechercher les sources NDI sur le réseau.';

  @override
  String get ndiNoSources => 'Aucune source NDI détectée sur ce réseau.';

  @override
  String get ndiIosNote =>
      'Sur iOS, la découverte mDNS peut être limitée selon la configuration réseau.';

  @override
  String ndiSourcesFound(int count) {
    return '$count source(s) NDI trouvée(s)';
  }

  @override
  String get ndiLabelName => 'Source';

  @override
  String get ndiLabelHost => 'Machine';

  @override
  String get ndiLabelIp => 'IP';

  @override
  String get ndiLabelPort => 'Port';

  @override
  String get ndiLabelService => 'Service';

  @override
  String get snapshotCardTitle => 'Snapshots réseau';

  @override
  String get snapshotCardSubtitle =>
      'Enregistrez et comparez l\'état du réseau à différents moments.';

  @override
  String get snapshotPageTitle => 'Snapshots réseau';

  @override
  String get snapshotEmpty => 'Aucun snapshot enregistré.';

  @override
  String get snapshotDeleteConfirm => 'Supprimer ce snapshot ?';

  @override
  String get snapshotDeleteButton => 'Supprimer';

  @override
  String get snapshotCompareButton => 'Comparer';

  @override
  String get snapshotComparisonTitle => 'Comparaison';

  @override
  String get snapshotComparisonSelectTwo =>
      'Sélectionnez deux snapshots à comparer.';

  @override
  String get snapshotSnapshotA => 'Snapshot A';

  @override
  String get snapshotSnapshotB => 'Snapshot B';

  @override
  String get snapshotDevices => 'Appareils';

  @override
  String get snapshotArtnetUniverses => 'Univers Art-Net';

  @override
  String get snapshotSacnUniverses => 'Univers sACN';

  @override
  String get snapshotNdiSources => 'Sources NDI';

  @override
  String get snapshotAlerts => 'Alertes';

  @override
  String get snapshotAdded => 'Apparu(s)';

  @override
  String get snapshotRemoved => 'Disparu(s)';

  @override
  String get snapshotNoChanges => 'Aucune différence entre les deux snapshots.';

  @override
  String get snapshotNoScore => 'Score non disponible';

  @override
  String get subscriptionCategoryNetworkTitle => 'Réseau Pro';

  @override
  String get subscriptionCategoryNetworkDescription =>
      'Outils réseau avancés : Art-Net, sACN, NDI, diagnostic et snapshots.';

  @override
  String get subscriptionHeadlineNetworkSubtitle =>
      'Débloque l\'Art-Net viewer, sACN viewer, NDI, le diagnostic réseau et les snapshots.';

  @override
  String get networkPremiumLabel => 'PREMIUM';

  @override
  String get networkPremiumUnlockButton => 'Débloquer';

  @override
  String get networkPremiumBannerText =>
      'Art-Net, sACN, NDI, diagnostic et snapshots nécessitent un abonnement Réseau Pro.';

  @override
  String get subscriptionCategoryNetworkShort => 'RÉSEAU';

  @override
  String get dashboardPageTitle => 'Surveillance en direct';

  @override
  String get dashboardCardTitle => 'Surveillance en direct';

  @override
  String get dashboardCardSubtitle =>
      'Appareils, flux et alertes en temps réel';

  @override
  String get dashboardStatusIdle => 'En attente';

  @override
  String get dashboardStatusScanning => 'Scan en cours…';

  @override
  String get dashboardStatusCompleted => 'Scan terminé';

  @override
  String get dashboardStatusError => 'Erreur réseau';

  @override
  String get dashboardStatusListening => 'Écoute active';

  @override
  String get dashboardKpiDevices => 'Appareils';

  @override
  String get dashboardKpiArtnet => 'Art-Net';

  @override
  String get dashboardKpiSacn => 'sACN';

  @override
  String get dashboardKpiNdi => 'NDI';

  @override
  String get dashboardKpiScore => 'Score';

  @override
  String get dashboardNoScore => '–';

  @override
  String get dashboardSectionAlerts => 'Alertes actives';

  @override
  String get dashboardNoAlerts => 'Aucune alerte active';

  @override
  String get dashboardSectionSnapshot => 'Dernier snapshot';

  @override
  String get dashboardNoSnapshot => 'Aucun snapshot enregistré';

  @override
  String get dashboardSectionQuickAccess => 'Accès rapide';

  @override
  String get dashboardRescanButton => 'Rescanner';

  @override
  String get dashboardNdiRefreshButton => 'Actualiser NDI';

  @override
  String get dashboardArtnetActive => 'Art-Net actif';

  @override
  String get dashboardSacnActive => 'sACN actif';

  @override
  String get dashboardNdiScanning => 'Découverte NDI…';

  @override
  String dashboardAlertNewDevice(Object ip) {
    return 'Nouvel appareil : $ip';
  }

  @override
  String dashboardAlertLostDevice(Object ip) {
    return 'Appareil disparu : $ip';
  }

  @override
  String dashboardAlertNewArtnetUniverse(int universe) {
    return 'Nouvel univers Art-Net : $universe';
  }

  @override
  String dashboardAlertLostArtnetUniverse(int universe) {
    return 'Univers Art-Net disparu : $universe';
  }

  @override
  String dashboardAlertNewSacnUniverse(int universe) {
    return 'Nouvel univers sACN : $universe';
  }

  @override
  String dashboardAlertLostSacnUniverse(int universe) {
    return 'Univers sACN disparu : $universe';
  }

  @override
  String dashboardAlertNewNdiSource(Object name) {
    return 'Nouvelle source NDI : $name';
  }

  @override
  String dashboardAlertLostNdiSource(Object name) {
    return 'Source NDI disparue : $name';
  }

  @override
  String dashboardAlertArtnetLowFps(int universe, Object fps) {
    return 'Art-Net U$universe : FPS faible ($fps)';
  }

  @override
  String dashboardAlertSacnLowFps(int universe, Object fps) {
    return 'sACN U$universe : FPS faible ($fps)';
  }

  @override
  String dashboardAlertSacnDuplicate(int universe, int count) {
    return 'sACN U$universe : $count sources actives';
  }

  @override
  String dashboardAlertSacnPriority(int universe) {
    return 'sACN U$universe : conflit de priorité';
  }

  @override
  String dashboardScanProgress(int progress) {
    return 'Scan réseau : $progress%';
  }

  @override
  String get luminexPageTitle => 'Switches GigaCore';

  @override
  String get luminexMonitorCardTitle => 'Switches GigaCore';

  @override
  String get luminexMonitorCardSubtitle =>
      'Inventaire, trafic par VLAN, configuration, sauvegardes';

  @override
  String get luminexAddDevice => 'Ajouter un équipement';

  @override
  String get luminexAddDeviceTitle => 'Adresse IP du switch';

  @override
  String get luminexAddDeviceHint => '192.168.x.x';

  @override
  String get luminexAddDeviceConfirm => 'Ajouter';

  @override
  String get luminexAddDeviceCancel => 'Annuler';

  @override
  String get luminexNoDevices => 'Aucun switch Luminex';

  @override
  String get luminexNoDevicesHint =>
      'Ajoutez une IP manuellement ou lancez un scan réseau.';

  @override
  String get luminexRefreshAll => 'Tout actualiser';

  @override
  String get luminexRemoveDevice => 'Retirer';

  @override
  String get luminexScanForDevices => 'Chercher sur le réseau';

  @override
  String get luminexReachable => 'Accessible';

  @override
  String get luminexUnreachable => 'Inaccessible';

  @override
  String get luminexPolling => 'Interrogation…';

  @override
  String get luminexNoAlarms => 'Aucune alarme';

  @override
  String get luminexSectionSystem => 'Informations système';

  @override
  String get luminexSectionPorts => 'Ports';

  @override
  String get luminexSectionAlarms => 'Alarmes actives';

  @override
  String get luminexLabelName => 'Nom';

  @override
  String get luminexLabelModel => 'Modèle';

  @override
  String get luminexLabelFirmware => 'Firmware';

  @override
  String get luminexLabelUptime => 'Uptime';

  @override
  String get luminexLabelTemperature => 'Température';

  @override
  String get luminexLabelPsu => 'Alimentation';

  @override
  String get luminexPsuOk => 'OK';

  @override
  String get luminexPsuAbsent => 'Absente';

  @override
  String get luminexLabelApi => 'API';

  @override
  String get luminexGen1 => 'Gen 1 (texte)';

  @override
  String get luminexGen2 => 'Gen 2 (JSON)';

  @override
  String get luminexGenUnknown => 'Inconnue';

  @override
  String get luminexPortUp => 'Actif';

  @override
  String get luminexPortDown => 'Inactif';

  @override
  String get luminexPortUnknown => 'Inconnu';

  @override
  String get luminexPortPoeActive => 'PoE actif';

  @override
  String get luminexPortPoeFault => 'PoE défaut';

  @override
  String get luminexPortPoeOff => 'PoE inactif';

  @override
  String get luminexPortNoPoe => 'Sans PoE';

  @override
  String get luminexDetectedScan => 'Scan réseau';

  @override
  String get luminexDetectedManual => 'Ajout manuel';

  @override
  String get luminexNotAvailable => 'N/D';

  @override
  String get luminexAlarmInaccessible => 'Switch inaccessible';

  @override
  String get luminexAlarmPsuAbsent => 'Alimentation absente';

  @override
  String luminexAlarmCount(int count) {
    return '$count alarme(s) active(s)';
  }

  @override
  String luminexPortSpeed(int speed) {
    return '$speed Mb/s';
  }

  @override
  String luminexPortRxErrors(int count) {
    return 'RX : $count err.';
  }

  @override
  String luminexPortTxErrors(int count) {
    return 'TX : $count err.';
  }

  @override
  String luminexAlarmPortDown(int port) {
    return 'Port $port hors ligne';
  }

  @override
  String luminexAlarmSpeedDegraded(int port, int speed) {
    return 'Port $port : vitesse dégradée ($speed Mb/s)';
  }

  @override
  String luminexAlarmHighRxErrors(int port, int count) {
    return 'Port $port : erreurs RX élevées ($count)';
  }

  @override
  String luminexAlarmHighTxErrors(int port, int count) {
    return 'Port $port : erreurs TX élevées ($count)';
  }

  @override
  String luminexAlarmPoeFault(int port) {
    return 'Port $port : défaut PoE';
  }

  @override
  String luminexAlarmHighTemp(Object temp) {
    return 'Température élevée : $temp°C';
  }

  @override
  String get manetPageTitle => 'MA-Net Monitor';

  @override
  String get manetMonitorCardTitle => 'MA-Net Monitor';

  @override
  String get manetMonitorCardSubtitle => 'Détection des nœuds grandMA2/3';

  @override
  String get manetNoNodes => 'Aucun nœud MA-Net détecté';

  @override
  String get manetListening => 'Écoute en cours…';

  @override
  String get manetNodeType => 'Type';

  @override
  String get manetFirmware => 'Firmware';

  @override
  String get manetMac => 'Adresse MAC';

  @override
  String get manetLastSeen => 'Vu il y a';

  @override
  String get manetProtocol => 'MA-Net';

  @override
  String get manetProtocolMaNet2 => 'MA-Net2';

  @override
  String get manetProtocolMaNet3 => 'MA-Net3';

  @override
  String get manetEmptyHint =>
      'Assurez-vous d’être sur le même réseau que les équipements MA Lighting';

  @override
  String manetNodeCount(int count) {
    return '$count nœud(s) en ligne';
  }

  @override
  String manetPortListening(int port) {
    return 'UDP :$port';
  }

  @override
  String get helpPageTitle => 'Guide des outils réseau';

  @override
  String get helpIntro =>
      'Tous les outils fonctionnent en lecture seule sur votre réseau local. Appuyez sur un outil pour afficher le détail.';

  @override
  String get helpSectionDoes => 'Ce que ça fait';

  @override
  String get helpSectionDelay => 'Délais';

  @override
  String get helpSectionLimits => 'Ce que ça ne fait pas';

  @override
  String get helpSectionTip => 'Conseil';

  @override
  String get helpGeneralTitle => 'Conseils généraux';

  @override
  String get helpGeneralSubnet =>
      'Tous les outils opèrent sur le subnet /24 local. Un équipement sur un VLAN différent ou derrière un routeur ne sera pas détecté.';

  @override
  String get helpGeneralFirewall =>
      'Les pare-feux logiciels peuvent bloquer certaines sondes. En cas d\'équipements manquants, vérifiez les règles de filtrage.';

  @override
  String get helpGeneralWifi =>
      'Les réseaux WiFi avec isolation de clients bloquent la découverte. Préférez une connexion filaire ou un WiFi en mode bridge.';

  @override
  String get helpToolScanDoes =>
      'Balaye le subnet /24 en parallèle et identifie les équipements actifs. Affiche l\'IP, le nom d\'hôte, le fabricant (via OUI MAC) et les ports ouverts courants.';

  @override
  String get helpToolScanDelay =>
      '15 à 30 secondes selon la taille du réseau. 50 sondes simultanées.';

  @override
  String get helpToolScanLimits =>
      'Ne traverse pas les VLANs ni les routeurs. N\'effectue pas d\'analyse de ports complète ni de scan WAN.';

  @override
  String get helpToolScanTip =>
      'Si des équipements n\'apparaissent pas, vérifiez que votre pare-feu n\'bloque pas les sondes TCP/ICMP entrantes.';

  @override
  String get helpToolDashboardDoes =>
      'Affiche en temps réel l\'état des équipements détectés : disponibilité, latence, alertes réseau actives.';

  @override
  String get helpToolDashboardDelay =>
      'Mise à jour toutes les 30 secondes. Premier chargement immédiat après le scan.';

  @override
  String get helpToolDashboardLimits =>
      'Ne conserve pas l\'historique entre les sessions. Nécessite un scan préalable pour peupler la liste d\'équipements.';

  @override
  String get helpToolDashboardTip =>
      'Lancez un scan réseau avant d\'ouvrir le dashboard pour voir tous les équipements disponibles.';

  @override
  String get helpToolArtNetDoes =>
      'Écoute passivement les paquets Art-Net (UDP 6454) et affiche les univers DMX actifs avec leurs valeurs en temps réel.';

  @override
  String get helpToolArtNetDelay =>
      'Temps réel — les données apparaissent en moins d\'une seconde dès réception du paquet.';

  @override
  String get helpToolArtNetLimits =>
      'Aucune sortie DMX. Ne configure pas les nodes Art-Net et ne gère pas le protocole RDM.';

  @override
  String get helpToolArtNetTip =>
      'Art-Net ne traverse pas les routeurs. Tous les équipements doivent être sur le même réseau L2 (même switch ou même segment).';

  @override
  String get helpToolSacnDoes =>
      'Écoute les flux sACN/E1.31 (UDP 5568) en multicast et affiche les univers actifs, les priorités de source et les valeurs DMX.';

  @override
  String get helpToolSacnDelay =>
      'Temps réel — latence inférieure à une seconde.';

  @override
  String get helpToolSacnLimits =>
      'Pas de sortie DMX. Ne modifie pas les priorités ni la configuration des sources sACN.';

  @override
  String get helpToolSacnTip =>
      'Le multicast sACN nécessite un switch géré avec IGMP snooping activé pour éviter les tempêtes de broadcast sur le réseau.';

  @override
  String get helpToolNdiDoes =>
      'Détecte les sources vidéo NDI sur le LAN via le protocole de découverte NDI. Affiche le nom, l\'adresse IP et le type de chaque source.';

  @override
  String get helpToolNdiDelay =>
      'Les sources apparaissent entre 5 et 15 secondes après leur connexion au réseau.';

  @override
  String get helpToolNdiLimits =>
      'Pas de lecture vidéo ni de routing NDI. Ne détecte pas les sources NDI|HX sans découverte mDNS active.';

  @override
  String get helpToolNdiTip =>
      'NDI nécessite 100 Mb/s minimum par flux. Évitez le WiFi pour la production — préférez une connexion Gigabit filaire.';

  @override
  String get helpToolDiagDoes =>
      'Exécute une série de tests de santé réseau : connectivité, résolution DNS, latence, perte de paquets et disponibilité des services.';

  @override
  String get helpToolDiagDelay => 'Diagnostic complet en 20 à 30 secondes.';

  @override
  String get helpToolDiagLimits =>
      'Diagnostic uniquement — aucune réparation automatique, aucune modification de configuration.';

  @override
  String get helpToolDiagTip =>
      'Lancez un diagnostic avant et après une intervention réseau pour comparer l\'état et isoler rapidement les régressions.';

  @override
  String get helpToolSnapshotDoes =>
      'Capture l\'état du réseau à un instant T (équipements, services) et permet de comparer deux snapshots pour identifier les changements.';

  @override
  String get helpToolSnapshotDelay =>
      'Capture en 30 à 45 secondes selon la taille du réseau.';

  @override
  String get helpToolSnapshotLimits =>
      'Pas de monitoring continu ni d\'alertes automatiques. L\'historique est conservé uniquement sur cet appareil.';

  @override
  String get helpToolSnapshotTip =>
      'Idéal pour documenter l\'état avant/après un changement d\'infrastructure ou pour isoler une régression lors d\'un dépannage.';

  @override
  String get helpToolLuminexDoes =>
      'Interroge les switches GigaCore Luminex via leur API HTTP. Affiche l\'état des ports (lien, vitesse, groupe, appareil branché, débit, PoE), la température, les alimentations, le trafic par groupe sur tout le réseau, et déclenche des alarmes.';

  @override
  String get helpToolLuminexDelay =>
      'Débits et état des ports toutes les 10 secondes ; groupes, LLDP, PoE et alimentations toutes les minutes. Découverte automatique sur le subnet : 15 à 30 secondes.';

  @override
  String get helpToolLuminexLimits =>
      'Lecture seule par défaut. Le mode configuration (cadenas) permet de renommer, changer de groupe, activer ou désactiver un port, faire clignoter les LED et piloter le PoE. Les ports ISL sont verrouillés. Chaque modification peut être annulée.';

  @override
  String get helpToolLuminexTip =>
      'Le téléphone doit être sur le réseau de management des GigaCore. Le trafic par groupe se lit depuis ce seul réseau, sans être dans chaque VLAN. API /api/ des firmwares récents ; les anciens répondent sur /stat/ports en texte brut.';

  @override
  String get helpToolManetDoes =>
      'Écoute passivement le port UDP 30020 et détecte les consoles et nodes grandMA2/3 qui s\'annoncent sur le réseau. Affiche nom, type d\'équipement, version firmware et adresse MAC.';

  @override
  String get helpToolManetDelay =>
      'Les équipements apparaissent dès leur prochain broadcast réseau, généralement en moins de 10 secondes.';

  @override
  String get helpToolManetLimits =>
      'Lecture seule. Aucune donnée de show, aucune valeur DMX, aucune configuration. Ne traverse pas les VLANs.';

  @override
  String get helpToolManetTip =>
      'Si aucun équipement n\'apparaît : vérifiez que la grandMA broadcaster sur le LAN et que le port UDP 30020 n\'est pas bloqué par un pare-feu.';

  @override
  String get bwCardTitle => 'Bande passante';

  @override
  String get bwCardSubtitle =>
      'Débit broadcast reçu, et ports des switches SNMP';

  @override
  String get bwHubTitle => 'Bande passante';

  @override
  String get bwHubSubtitle =>
      'Option 1 — trafic broadcast uniquement (sans équipement). Option 2 — bande passante réelle par port via SNMP (switch managé requis).';

  @override
  String get bwHubTagFree => 'GRATUIT';

  @override
  String get bwHubCardBroadcastTitle => 'Broadcast réseau';

  @override
  String get bwHubCardBroadcastSubtitle => 'Art-Net · sACN · MA-Net';

  @override
  String get bwHubCardBroadcastLimit =>
      'Trafic unicast non visible (NDI, Dante…)';

  @override
  String get bwHubCardSnmpTitle => 'Switch SNMP (autres marques)';

  @override
  String get bwHubCardSnmpSubtitle =>
      'Débit par port via SNMP. Pour les GigaCore, utilise « Switches GigaCore ».';

  @override
  String get bwHubCardSnmpRequires => 'Switch managé SNMP requis';

  @override
  String get bwBroadcastPageTitle => 'Broadcast réseau';

  @override
  String get bwBroadcastWarning =>
      'Broadcast & multicast uniquement. Le trafic unicast (NDI, Dante…) n\'est pas visible depuis cet appareil.';

  @override
  String get bwBroadcastListening => 'En écoute';

  @override
  String get bwBroadcastTotal => 'Total';

  @override
  String get bwSnmpPageTitle => 'Ports switch';

  @override
  String get bwSnmpConfigTitle => 'Connexion SNMP';

  @override
  String get bwSnmpHost => 'IP du switch';

  @override
  String get bwSnmpHostHint => '192.168.1.1';

  @override
  String get bwSnmpCommunity => 'Community';

  @override
  String get bwSnmpCommunityHint => 'public';

  @override
  String get bwSnmpConnect => 'Connecter';

  @override
  String get bwSnmpDisconnect => 'Déconnecter';

  @override
  String get bwSnmpConnecting => 'Connexion…';

  @override
  String get bwSnmpError => 'Erreur SNMP';

  @override
  String get bwSnmpReqTitle => 'Prérequis';

  @override
  String get bwSnmpReq1 => 'Switch managé avec SNMP v2c activé';

  @override
  String get bwSnmpReq2 =>
      'Community string (par défaut : \"public\" sur Luminex GigaCore)';

  @override
  String get bwSnmpReq3 => 'IP du switch accessible depuis cet appareil';

  @override
  String get bwSnmpPortUp => 'Actif';

  @override
  String get bwSnmpPortDown => 'Inactif';

  @override
  String get bwSnmpNoData => 'En attente de données…';

  @override
  String bwSnmpPortCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 's',
      one: '',
    );
    return '$count port$_temp0';
  }

  @override
  String get bwUnitKbps => 'kbps';

  @override
  String get bwUnitMbps => 'Mbps';

  @override
  String get bwUnitPkts => 'paq./s';

  @override
  String get bwLabelIn => '↓ Entrant';

  @override
  String get bwLabelOut => '↑ Sortant';

  @override
  String get conversionsVolumesTitle => 'Volumes';

  @override
  String get volumeCalcCardTitle => 'Volume — cube, cylindre, sphère…';

  @override
  String get volumeCalcUnitLabel => 'Unité des dimensions';

  @override
  String get volumeCalcPlaceholder =>
      'Remplis les dimensions pour voir le volume ✨';

  @override
  String get volumeShapeCube => 'Cube';

  @override
  String get volumeShapeBox => 'Pavé droit';

  @override
  String get volumeShapeCylinder => 'Cylindre';

  @override
  String get volumeShapeSphere => 'Sphère';

  @override
  String get volumeShapeCone => 'Cône';

  @override
  String get volumeShapeSquarePyramid => 'Pyramide (base carrée)';

  @override
  String get volumeFieldSide => 'Côté';

  @override
  String get volumeFieldLength => 'Longueur';

  @override
  String get volumeFieldWidth => 'Largeur';

  @override
  String get volumeFieldHeight => 'Hauteur';

  @override
  String get volumeFieldRadius => 'Rayon';

  @override
  String get volumeFieldRadiusBase => 'Rayon (base)';

  @override
  String get volumeFieldSideBase => 'Côté (base)';

  @override
  String get aboutVesaTitle => 'Supports VESA & tailles d\'écran';

  @override
  String get aboutVesaSubtitle =>
      'Normes VESA, recherche de standard et calcul de diagonale';

  @override
  String get vesaIntroTitle => 'VESA & écrans, en un coup d\'œil';

  @override
  String get vesaIntroBody =>
      'VESA (Video Electronics Standards Association) normalise l\'entraxe des trous de fixation au dos des écrans, TV et moniteurs. Plus l\'écran est grand et lourd, plus l\'entraxe est large. Vérifie toujours le poids et le VESA indiqués par le fabricant avant de choisir un support — cette page donne des ordres de grandeur, pas des valeurs garanties.';

  @override
  String get vesaTableTitle => 'Standards VESA courants';

  @override
  String get vesaColEntraxe => 'Entraxe';

  @override
  String get vesaColScreenSize => 'Taille écran';

  @override
  String get vesaColMaxWeight => 'Poids max.';

  @override
  String get vesaTableFooterNote =>
      'Plages indicatives : un fabricant peut tout à fait proposer un VESA plus large que la moyenne pour un écran donné, notamment sur les écrans pro et les murs LED. Vérifie toujours la fiche technique.';

  @override
  String get vesaLargeFormat => 'Grands formats / murs LED';

  @override
  String get vesaFinderTitle => 'Quel VESA ai-je mesuré ?';

  @override
  String get vesaFinderHint =>
      'Mesure l\'entraxe entre deux trous (horizontal et vertical) au dos de l\'écran, en millimètres.';

  @override
  String get vesaFieldHorizontal => 'Entraxe horizontal (mm)';

  @override
  String get vesaFieldVertical => 'Entraxe vertical (mm)';

  @override
  String get vesaFinderPlaceholder =>
      'Renseigne les deux entraxes pour identifier le standard.';

  @override
  String vesaFinderExactMatch(Object pattern) {
    return 'Standard VESA $pattern 🎯';
  }

  @override
  String vesaFinderNearestMatch(Object pattern, Object delta) {
    return 'Pas de correspondance exacte — le plus proche est $pattern (écart $delta mm cumulés). Vérifie ta mesure.';
  }

  @override
  String get vesaScreenCalcTitle =>
      'Dimensions d\'un écran depuis sa diagonale';

  @override
  String get vesaFieldDiagonal => 'Diagonale (pouces)';

  @override
  String get vesaScreenCalcPlaceholder => 'Indique une diagonale en pouces.';

  @override
  String get vesaResultDiagonal => 'Diagonale';

  @override
  String get vesaResultWidth => 'Largeur';

  @override
  String get vesaResultHeight => 'Hauteur';

  @override
  String get vesaResultArea => 'Surface';

  @override
  String get vesaTipsTitle => 'Conseils de fixation';

  @override
  String get vesaTip1 =>
      'Utilise toujours les 4 (ou plus) vis fournies — jamais 2 en diagonale.';

  @override
  String get vesaTip2 =>
      'Respecte le couple de serrage indiqué : trop serré peut fissurer le châssis.';

  @override
  String get vesaTip3 =>
      'Pour un accroche en hauteur ou sur un pont, prévois une élingue ou une sécurité secondaire indépendante du support VESA.';

  @override
  String get vesaTip4 =>
      'En charge dynamique (mouvement, vibrations, transport), réduis la charge admissible par rapport à la charge statique du fabricant.';

  @override
  String get vesaTip5 =>
      'Vérifie la longueur des vis : trop longues, elles peuvent endommager l\'électronique interne de l\'écran.';

  @override
  String get vesaTip6 =>
      'Un adaptateur VESA (75→100, 100→200…) doit être noté sur la fiche de charge — il ajoute du poids et un bras de levier.';

  @override
  String get cctFilterTitle => 'Filtre ↔ Température (K)';

  @override
  String get cctFilterTileDescription =>
      'Quel CTO/CTB choisir entre deux températures, et dans tous les sens';

  @override
  String get cctFilterIntro =>
      'Trouve en un instant le filtre CTO/CTB qu\'il te faut, ou vérifie le résultat d\'un filtre déjà en main — dans tous les sens ✨';

  @override
  String get cctModeFindFilter => 'Quel filtre ?';

  @override
  String get cctModeSourcePlusFilter => 'K + filtre → K ?';

  @override
  String get cctModeTargetPlusFilter => 'K cible + filtre → K départ ?';

  @override
  String get cctFieldSourceK => 'Température de départ (K)';

  @override
  String get cctFieldTargetK => 'Température souhaitée (K)';

  @override
  String get cctFieldTargetKFinal => 'Température finale souhaitée (K)';

  @override
  String get cctFieldFilter => 'Filtre';

  @override
  String get cctDescEighthCtb => 'Rafraîchit très légèrement';

  @override
  String get cctDescQuarterCtb => 'Rafraîchit légèrement';

  @override
  String get cctDescHalfCtb => 'Rafraîchit modérément';

  @override
  String get cctDescThreeQuarterCtb => 'Rafraîchit fortement';

  @override
  String get cctDescFullCtb => 'Tungstène → lumière du jour';

  @override
  String get cctDescEighthCto => 'Réchauffe très légèrement';

  @override
  String get cctDescQuarterCto => 'Réchauffe légèrement';

  @override
  String get cctDescHalfCto => 'Réchauffe modérément';

  @override
  String get cctDescThreeQuarterCto => 'Réchauffe fortement';

  @override
  String get cctDescFullCto => 'Lumière du jour → tungstène';

  @override
  String get cctFindFilterPlaceholder =>
      'Renseigne les deux températures pour trouver le filtre adapté.';

  @override
  String get cctRequiredShiftLabel => 'Décalage requis';

  @override
  String get cctMiredShiftLabel => 'Mired shift';

  @override
  String cctBestChoice(Object name, Object k) {
    return 'Meilleur choix : $name → ≈ $k K';
  }

  @override
  String cctApproxKelvin(Object k) {
    return '≈ $k K';
  }

  @override
  String get cctOtherFiltersNearby => 'Autres filtres proches';

  @override
  String get cctDisclaimer =>
      'Valeurs de décalage mired standard, approximatives — vérifie la fiche technique du fabricant pour un usage critique.';

  @override
  String get cctSourcePlaceholder => 'Renseigne la température de départ.';

  @override
  String get cctTargetPlaceholder =>
      'Renseigne la température finale souhaitée.';

  @override
  String get cctOutOfRange =>
      'Combinaison hors plage (résultat non physique) — essaie une autre température ou un autre filtre.';

  @override
  String get cctResultObtainedTemp => 'Température obtenue';

  @override
  String get cctResultAppliedFilter => 'Filtre appliqué';

  @override
  String get cctResultRequiredSource => 'Source nécessaire';

  @override
  String get cctResultFilterToApply => 'Filtre à appliquer';

  @override
  String get cctBrandLabel => 'Marque de filtre';

  @override
  String get cctAllBrands => 'Toutes les marques';

  @override
  String get timecodeHubTitle => 'Timecode';

  @override
  String get timecodeToolConverterLabel => 'Convertisseur\nde débit';

  @override
  String get timecodeToolMathLabel => 'Durée &\ndécalage';

  @override
  String get timecodeToolDelayLabel => 'Frame ↔ ms';

  @override
  String get timecodeToolCountdownLabel => 'Compte à\nrebours';

  @override
  String get timecodeBadgeFree => 'GRATUIT';

  @override
  String get timecodeBadgeNew => 'NOUVEAU';

  @override
  String get timecodeConverterTitle => 'Convertisseur de débit';

  @override
  String get timecodeConverterSourceCardTitle => 'Timecode source';

  @override
  String get timecodeConverterFieldLabel => 'HH:MM:SS:FF';

  @override
  String get timecodeConverterFieldHint => '01:00:00:00';

  @override
  String get timecodeConverterSourceRateLabel => 'Débit source';

  @override
  String get timecodeConverterSwapTooltip => 'Inverser source / cible';

  @override
  String get timecodeConverterTargetCardTitle => 'Débit cible';

  @override
  String get timecodeConverterTargetRateLabel => 'Débit cible';

  @override
  String get timecodeConverterButton => 'Convertir';

  @override
  String timecodeConverterErrorInvalid(String rateLabel, int frameBase) {
    return '❌ Timecode invalide pour $rateLabel (attendu : HH:MM:SS:FF, FF < $frameBase).';
  }

  @override
  String timecodeConverterResult(String rateLabel, String tc, String seconds) {
    return 'TC en $rateLabel :\n$tc\n\n(≈ $seconds s écoulées depuis 00:00:00:00)';
  }

  @override
  String get timecodeMathTitle => 'Durée & décalage';

  @override
  String get timecodeMathModeDuration => 'Durée entre 2 TC';

  @override
  String get timecodeMathModeOffset => 'Décaler un TC';

  @override
  String get timecodeMathRateCardTitle => 'Débit';

  @override
  String get timecodeMathDurationCardTitle => 'Timecode In / Out';

  @override
  String get timecodeMathTcInLabel => 'TC In (HH:MM:SS:FF)';

  @override
  String get timecodeMathTcOutLabel => 'TC Out (HH:MM:SS:FF)';

  @override
  String get timecodeMathComputeDurationButton => 'Calculer la durée';

  @override
  String timecodeMathErrorDuration(int frameBase) {
    return '❌ Vérifie les deux timecodes (HH:MM:SS:FF, FF < $frameBase).';
  }

  @override
  String timecodeMathDurationResult(
      String duration, int frames, String rateLabel) {
    return 'Durée : $duration\n($frames frame(s) à $rateLabel)';
  }

  @override
  String get timecodeMathOffsetCardTitle => 'Timecode de départ + décalage';

  @override
  String get timecodeMathBaseTcLabel => 'TC de départ (HH:MM:SS:FF)';

  @override
  String get timecodeMathAddLabel => '+ Ajouter';

  @override
  String get timecodeMathSubtractLabel => '− Soustraire';

  @override
  String get timecodeMathOffsetLabel => 'Décalage — durée (HH:MM:SS:FF)';

  @override
  String get timecodeMathComputeOffsetButton => 'Calculer le nouveau TC';

  @override
  String timecodeMathErrorOffset(int frameBase) {
    return '❌ Vérifie le timecode de départ et le décalage (HH:MM:SS:FF, FF < $frameBase).';
  }

  @override
  String timecodeMathOffsetResult(String tc) {
    return 'Nouveau timecode :\n$tc';
  }

  @override
  String get timecodeDelayTitle => 'Frame ↔ ms';

  @override
  String get timecodeDelayCardTitle => 'Retard vidéo / audio';

  @override
  String get timecodeDelayIntro =>
      'Pratique pour corriger un décalage lip-sync ou un retard de processeur vidéo/LED : entre une valeur, choisis son unité, et récupère l\'équivalent.';

  @override
  String get timecodeDelayRateLabel => 'Débit';

  @override
  String get timecodeDelayUnitFrames => 'Frames';

  @override
  String get timecodeDelayUnitMs => 'Millisecondes';

  @override
  String get timecodeDelayValueLabelFrames => 'Nombre de frames';

  @override
  String get timecodeDelayValueLabelMs => 'Millisecondes';

  @override
  String get timecodeDelayButton => 'Convertir';

  @override
  String get timecodeDelayErrorInvalid => '❌ Valeur invalide.';

  @override
  String timecodeDelayResultFromFrames(
      int frames, String rateLabel, String ms, String duration) {
    return '$frames frame(s) à $rateLabel\n= $ms ms\n= $duration';
  }

  @override
  String timecodeDelayResultFromMs(
      String ms, String rateLabel, int frames, String duration) {
    return '$ms ms à $rateLabel\n= $frames frame(s)\n= $duration';
  }

  @override
  String get timecodeCountdownTitle => 'Compte à rebours';

  @override
  String get timecodeCountdownSettingsCardTitle => 'Réglages';

  @override
  String get timecodeCountdownRateLabel => 'Débit';

  @override
  String get timecodeCountdownCurrentTcLabel => 'TC actuel (HH:MM:SS:FF)';

  @override
  String get timecodeCountdownFillNowTooltip =>
      'Remplir avec l\'heure du téléphone';

  @override
  String get timecodeCountdownTargetTcLabel => 'TC cible (HH:MM:SS:FF)';

  @override
  String get timecodeCountdownStartButton => 'Démarrer';

  @override
  String get timecodeCountdownStopButton => 'Arrêter';

  @override
  String timecodeCountdownErrorInvalid(int frameBase) {
    return '❌ Vérifie les deux timecodes (HH:MM:SS:FF, FF < $frameBase).';
  }

  @override
  String get timecodeCountdownLiveCardTitle => 'En direct';

  @override
  String timecodeCountdownLiveText(String tc, String remaining) {
    return 'TC actuel (estimé) : $tc\nTemps restant : $remaining';
  }

  @override
  String timecodeCountdownOverdue(String duration) {
    return '−$duration (TC dépassé)';
  }

  @override
  String get homeTimecodeTitle => 'Timecode';

  @override
  String get homeTimecodeSubtitle => 'Débit, durée, décalage, retard';

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
  String get aboutAudioTitle => 'Audio — son & diffusion';

  @override
  String get aboutAudioSubtitle =>
      'Gain staging, SPL/distance, délais, subs cardioïdes, câblage.';

  @override
  String get aboutAudioPageTitle => 'Audio — repères terrain';

  @override
  String get audioRefTocCopyText => 'Copier le sommaire';

  @override
  String get audioRefSection1Title => 'Chaîne du signal & gain staging';

  @override
  String get audioRefSection1FormulasTitle => 'Repères de niveaux';

  @override
  String get audioRefSection1Formula1 =>
      '0 dBu ≈ 0,775 V RMS — référence pro analogique';

  @override
  String get audioRefSection1Formula2 =>
      '0 dBFS = niveau numérique maximal avant écrêtage — toujours garder de la marge (headroom)';

  @override
  String get audioRefSection1Formula3 =>
      'Gain staging : régler chaque étage (source → console → ampli) pour un bon rapport signal/bruit, sans saturer';

  @override
  String get audioRefSection1FieldMarksTitle => 'Repères terrain';

  @override
  String get audioRefSection1FieldMark1 =>
      'Vise un niveau d\'entrée qui pulse dans le vert/jaune, jamais dans le rouge en continu';

  @override
  String get audioRefSection1FieldMark2 =>
      'Un système mal réglé sonne bruyant même à faible volume : le problème vient souvent d\'un étage saturé en amont';

  @override
  String get audioRefSection2Title => 'SPL & distance';

  @override
  String get audioRefSection2FormulaTitle => 'Loi de l\'inverse du carré';

  @override
  String get audioRefSection2Formula1 =>
      'Chaque doublement de distance = -6 dB SPL en champ libre';

  @override
  String get audioRefSection2Formula2 =>
      'SPL(d2) = SPL(d1) - 20 × log10(d2 / d1)';

  @override
  String get audioRefSection2NoteTitle => 'À nuancer sur le terrain';

  @override
  String get audioRefSection2Note1 =>
      'En intérieur, les réflexions (murs, plafond) réduisent la chute réelle par rapport à la théorie';

  @override
  String get audioRefSection2Note2 =>
      'Un line array bien conçu chute moins vite qu\'une source ponctuelle sur l\'axe de couverture';

  @override
  String get audioRefSection3Title => 'Alignement de délai (time alignment)';

  @override
  String get audioRefSection3Paragraph =>
      'Un système annexe (delay tower, rappel de façade) doit être retardé pour que son son arrive en même temps que celui du système principal, perçu comme une seule source.';

  @override
  String get audioRefSection3FormulaTitle => 'Formule de base';

  @override
  String get audioRefSection3Formula1 =>
      'Délai (ms) = distance entre les systèmes (m) / 0,343 m/ms (vitesse du son ≈ 343 m/s)';

  @override
  String get audioRefSection3TipsTitle => 'Bonnes pratiques';

  @override
  String get audioRefSection3Tip1 =>
      'Mesure la distance réelle entre les deux sources, pas juste la distance au public';

  @override
  String get audioRefSection3Tip2 =>
      'Ajoute quelques ms de délai supplémentaire (2-5 ms) pour renforcer l\'effet de précédence (loi de Haas) et garder le système principal comme source perçue';

  @override
  String get audioRefSection3Tip3 =>
      'Vérifie à l\'oreille et/ou avec un analyseur (ex: corrélation de phase) après réglage';

  @override
  String get audioRefSection4Title =>
      'Directivité de subs (cardioïde / end-fire)';

  @override
  String get audioRefSection4Paragraph =>
      'Un arrangement cardioïde ou end-fire réduit l\'énergie basse envoyée vers la scène/régie en renforçant celle vers le public, en jouant sur le délai et la polarité entre subs.';

  @override
  String get audioRefSection4TypesTitle => 'Configurations courantes';

  @override
  String get audioRefSection4Type1 =>
      'End-fire : subs alignés en ligne, celui de devant avancé et retardé électroniquement';

  @override
  String get audioRefSection4Type2 =>
      'Cardioïde 2 subs : un sub avant (normal), un sub arrière inversé en polarité et retardé';

  @override
  String get audioRefSection4Type3 =>
      'Cardioïde 3 subs : deux avant en phase, un arrière inversé et retardé — meilleur compromis niveau/rejet arrière';

  @override
  String get audioRefSection5Title => 'Câblage & connecteurs';

  @override
  String get audioRefSection5XlrTitle => 'XLR symétrique';

  @override
  String get audioRefSection5XlrBullet1 =>
      'Toujours préférer une liaison symétrique (XLR/TRS) sur de longues distances pour rejeter les parasites';

  @override
  String get audioRefSection5XlrBullet2 =>
      'Au-delà de ~50-100 m en analogique, envisage une liaison numérique (AES/EBU, Dante, etc.)';

  @override
  String get audioRefSection5SpeakonTitle => 'Speakon (haut-parleurs)';

  @override
  String get audioRefSection5SpeakonBullet1 =>
      'Ne jamais utiliser de XLR pour du haut-parleur : la puissance véhiculée peut endommager du matériel prévu pour du signal ligne';

  @override
  String get audioRefSection5SpeakonBullet2 =>
      'Vérifie la section de câble adaptée à la puissance et à la distance (chute de tension) avant un tirage long';

  @override
  String get audioRefSection5GroundTitle => 'Masse & ronflement';

  @override
  String get audioRefSection5GroundBullet1 =>
      'Une boucle de masse (ground loop) entre deux appareils reliés au secteur par des chemins différents peut créer un ronflement 50/60 Hz';

  @override
  String get audioRefSection5GroundBullet2 =>
      'Un « ground lift » ou un DI box avec isolation galvanique peut résoudre ce problème sans couper la terre de sécurité';

  @override
  String get audioRefSection6Title => 'Sécurité auditive & bonnes pratiques';

  @override
  String get audioRefSection6DontDoTitle => 'À éviter';

  @override
  String get audioRefSection6DontDoBullet1 =>
      'Exposer le public ou l\'équipe à plus de 100 dB SPL en continu sans limitation de durée';

  @override
  String get audioRefSection6DontDoBullet2 =>
      'Pousser un système au-delà de sa puissance nominale pour compenser un mauvais placement';

  @override
  String get audioRefSection6WarningTitle => 'Repères d\'exposition';

  @override
  String get audioRefSection6WarningBullet1 =>
      '85 dB SPL : limite recommandée pour une exposition prolongée (8h) sans protection';

  @override
  String get audioRefSection6WarningBullet2 =>
      '100 dB SPL : quelques minutes seulement avant risque, la plupart des concerts dépassent ce seuil';

  @override
  String get audioRefSection6WarningBullet3 =>
      'Utilise systématiquement un limiteur système en sortie pour protéger le matériel et le public';

  @override
  String get audioRefSection7Title => 'Checklist rapide';

  @override
  String get audioRefSection7QuickTitle => 'Avant le show';

  @override
  String get audioRefSection7Bullet1 =>
      'Gain staging vérifié de la source à l\'ampli, aucune saturation';

  @override
  String get audioRefSection7Bullet2 =>
      'Délais des systèmes annexes calculés et appliqués';

  @override
  String get audioRefSection7Bullet3 => 'Limiteur système actif et réglé';

  @override
  String get audioRefSection7Bullet4 =>
      'Polarité vérifiée entre subs et top (pas d\'annulation)';

  @override
  String get audioRefSection7Bullet5 =>
      'Niveau SPL mesuré en régie et en fond de salle';

  @override
  String get audioRefFooterNote =>
      'Ces repères sont généraux — vérifie toujours les préconisations du fabricant et la réglementation locale sur les niveaux sonores.';

  @override
  String get aboutRfTitle => 'RF — HF & Wi-Fi';

  @override
  String get aboutRfSubtitle =>
      'Bandes UHF, Wi-Fi, coexistence IM3, antennes, scan RF.';

  @override
  String get aboutRfPageTitle => 'RF — repères terrain';

  @override
  String get rfRefTocCopyText => 'Copier le sommaire';

  @override
  String get rfRefSection1Title => 'Bases du spectre RF';

  @override
  String get rfRefSection1FormulasTitle =>
      'Repères fréquence / longueur d\'onde';

  @override
  String get rfRefSection1Formula1 =>
      'λ (m) = 300 / f (MHz) — longueur d\'onde approximative';

  @override
  String get rfRefSection1Formula2 =>
      'Plus la fréquence est haute, plus la longueur d\'onde est courte et plus la portée en espace dégagé diminue';

  @override
  String get rfRefSection1FieldMarksTitle => 'Repères terrain';

  @override
  String get rfRefSection1FieldMark1 =>
      'Le corps humain absorbe et réfléchit les ondes RF — la position d\'un récepteur HF sur le corps influence la réception';

  @override
  String get rfRefSection1FieldMark2 =>
      'Privilégie toujours une ligne de vue directe (line of sight) entre émetteur et récepteur';

  @override
  String get rfRefSection2Title => 'Bandes UHF pour micros HF';

  @override
  String get rfRefSection2Paragraph =>
      'Les micros et in-ears HF utilisent principalement la bande UHF (470-694 MHz en Europe selon les pays), partagée avec la diffusion TV — la disponibilité réelle dépend de la réglementation locale.';

  @override
  String get rfRefSection2NoteTitle => 'À vérifier avant chaque date';

  @override
  String get rfRefSection2Note1 =>
      'Les bandes disponibles varient selon le pays — vérifie la réglementation locale (ANFR en France, Ofcom au Royaume-Uni, etc.)';

  @override
  String get rfRefSection2Note2 =>
      'Une bande libre à un endroit peut être occupée par un émetteur TV ou un autre prestataire ailleurs';

  @override
  String get rfRefSection3Title => 'Wi-Fi 2,4 GHz vs 5 GHz';

  @override
  String get rfRefSection3TableTitle => 'Différences clés';

  @override
  String get rfRefSection3Bullet1 =>
      '2,4 GHz : 3 canaux non-chevauchants (1, 6, 11), meilleure portée, plus encombré (Bluetooth, micros HF haut de bande, autres réseaux)';

  @override
  String get rfRefSection3Bullet2 =>
      '5 GHz : beaucoup plus de canaux non-chevauchants, débit supérieur, portée plus courte, moins d\'interférences en général';

  @override
  String get rfRefSection3Bullet3 =>
      'Pour la régie/contrôle (consoles, visualisation), privilégier le 5 GHz quand c\'est possible';

  @override
  String get rfRefSection4Title => 'Coexistence & intermodulation (IM3)';

  @override
  String get rfRefSection4Paragraph =>
      'Quand plusieurs émetteurs HF fonctionnent ensemble, leurs fréquences peuvent créer des produits d\'intermodulation (IM3) qui tombent sur d\'autres fréquences utilisées et provoquent des interférences.';

  @override
  String get rfRefSection4FormulaTitle => 'Formule IM3 (3ᵉ ordre)';

  @override
  String get rfRefSection4Formula1 => 'IM3 = 2×f1 − f2 et 2×f2 − f1';

  @override
  String get rfRefSection4Tip1 =>
      'Plus le nombre de canaux HF augmente, plus le risque de produits IM3 tombant sur une fréquence utilisée augmente — d\'où l\'intérêt d\'un plan de fréquences calculé en amont';

  @override
  String get rfRefSection5Title => 'Antennes & diversity';

  @override
  String get rfRefSection5Bullet1 =>
      'La réception « diversity » utilise deux antennes légèrement décalées pour éviter les zones d\'annulation (trous RF)';

  @override
  String get rfRefSection5Bullet2 =>
      'Espace les antennes d\'au moins un quart de longueur d\'onde, sans les positionner en ligne droite avec l\'émetteur';

  @override
  String get rfRefSection5Bullet3 =>
      'Évite de poser les antennes à même le sol ou collées à une structure métallique qui peut désaccorder ou masquer le signal';

  @override
  String get rfRefSection6Title => 'Scan RF avant un show';

  @override
  String get rfRefSection6Bullet1 =>
      'Toujours scanner la bande sur place, à l\'heure du show — l\'environnement RF change entre le jour et le soir (autres prestataires, public avec hotspots, etc.)';

  @override
  String get rfRefSection6Bullet2 =>
      'Note les fréquences occupées et documente-les pour la prochaine date au même lieu si possible';

  @override
  String get rfRefSection6Bullet3 =>
      'Prévois une marge de fréquences libres pour un remplacement de dernière minute (matériel HS, interférence imprévue)';

  @override
  String get rfRefSection7Title => 'Checklist rapide';

  @override
  String get rfRefSection7Bullet1 => 'Scan RF effectué à l\'heure du show';

  @override
  String get rfRefSection7Bullet2 => 'Plan de fréquences calculé (IM3 vérifié)';

  @override
  String get rfRefSection7Bullet3 =>
      'Antennes en ligne de vue, espacées correctement';

  @override
  String get rfRefSection7Bullet4 =>
      'Bandes UHF utilisées conformes à la réglementation locale';

  @override
  String get rfRefFooterNote =>
      'La réglementation RF varie fortement selon le pays — vérifie toujours les fréquences autorisées localement avant un show.';

  @override
  String get aboutLaserTitle => 'Laser — physique & sécurité';

  @override
  String get aboutLaserSubtitle =>
      'Comment ça marche, scanners, classes, normes, NOHD/SZED/CZED.';

  @override
  String get aboutLaserPageTitle => 'Laser — référence de terrain';

  @override
  String get laserRefTocCopyText => 'Copier le sommaire';

  @override
  String get laserRefSection1Title => 'Qu\'est-ce qu\'un laser ?';

  @override
  String get laserRefSection1AcronymTitle => 'L\'acronyme LASER';

  @override
  String get laserRefSection1AcronymBody =>
      'LASER signifie « Light Amplification by Stimulated Emission of Radiation » (amplification de lumière par émission stimulée de rayonnement).';

  @override
  String get laserRefSection1HowTitle => 'Le principe physique';

  @override
  String get laserRefSection1HowBody =>
      'Un milieu actif (diode, cristal DPSS...) est « pompé » électriquement ou optiquement, ce qui provoque une émission stimulée de photons. Une cavité résonante (deux miroirs, dont un semi-réfléchissant) amplifie cette lumière, qui ressort cohérente, monochromatique et très collimatée — contrairement à une source lumineuse classique.';

  @override
  String get laserRefSection1TypesTitle => 'Types courants en spectacle';

  @override
  String get laserRefSection1Type1 =>
      'Diode directe : compacte, souvent utilisée en RGB pour mélanger les couleurs';

  @override
  String get laserRefSection1Type2 =>
      'DPSS (Diode Pumped Solid State) : diode qui pompe un cristal, historiquement utilisée pour le vert et d\'autres longueurs d\'onde spécifiques';

  @override
  String get laserRefSection2Title =>
      'Comment on dessine : scanners et vitesse';

  @override
  String get laserRefSection2Paragraph =>
      'Le faisceau est dirigé par deux miroirs galvanométriques (« galvos »), un pour l\'axe X et un pour l\'axe Y, qui pivotent très rapidement. Contrairement à la vidéo (balayage ligne par ligne), un show laser dessine des formes vectorielles, point par point, en suivant les contours de l\'image.';

  @override
  String get laserRefSection2SpeedTitle => 'Vitesse de scan';

  @override
  String get laserRefSection2Speed1 =>
      'La vitesse se mesure en points par seconde (pps) ou en kilopoints par seconde (kpps)';

  @override
  String get laserRefSection2Speed2 =>
      'ILDA (International Laser Display Association) standardise le connecteur, le format de fichier .ild et un motif de test utilisé pour évaluer objectivement un scanner';

  @override
  String get laserRefSection2FieldTitle => 'Repères de terrain';

  @override
  String get laserRefSection2Field1 =>
      'Plus l\'image contient de points, plus il faut de pps pour éviter le scintillement (flicker) — un show fluide tourne généralement autour de 20 à 30 kpps';

  @override
  String get laserRefSection2Field2 =>
      'Le motif de test ILDA permet de comparer deux scanners sur des critères objectifs (vitesse, précision, amortissement)';

  @override
  String get laserRefSection3Title => 'Classes de laser & normes';

  @override
  String get laserRefSection3ClassesTitle => 'Classes IEC 60825-1';

  @override
  String get laserRefSection3Class1 =>
      'Classe 1 : sûre en usage normal, aucune précaution particulière';

  @override
  String get laserRefSection3Class2 =>
      'Classe 1M / 2M : sûres à l\'œil nu, mais dangereuses avec des instruments optiques (jumelles, loupe)';

  @override
  String get laserRefSection3Class3 =>
      'Classe 2 : visible, protégée par le réflexe de clignement (< 1 mW)';

  @override
  String get laserRefSection3Class4 =>
      'Classe 3R : risque modéré, danger direct limité';

  @override
  String get laserRefSection3Class5 =>
      'Classe 3B : dangereuse pour l\'œil en vision directe — la majorité des lasers de spectacle se situent ici ou en classe 4';

  @override
  String get laserRefSection3Class6 =>
      'Classe 4 : dangereuse pour l\'œil et la peau, risque d\'incendie — précautions maximales';

  @override
  String get laserRefSection3StandardsTitle => 'Normes de référence';

  @override
  String get laserRefSection3Standard1 =>
      'IEC 60825-1 : sécurité produit et classification des lasers';

  @override
  String get laserRefSection3Standard2 =>
      'IEC 60825-3 : lignes directrices spécifiques aux shows et vitrines laser (notion de MPE variable selon la durée d\'exposition)';

  @override
  String get laserRefSection3Standard3 =>
      'Réglementations locales : déclaration/autorisation selon la puissance et le pays (ex. FDA/CDRH 21 CFR 1040.10 aux États-Unis avec procédure de variance pour les shows)';

  @override
  String get laserRefSection3FieldNote =>
      'Vérifie toujours la réglementation locale avant un show, en particulier pour l\'audience scanning et à proximité d\'un aéroport.';

  @override
  String get laserRefSection4Title => 'Mesures de sécurité';

  @override
  String get laserRefSection4Bullet1 =>
      'Un Laser Safety Officer (LSO) formé est désigné et responsable du show';

  @override
  String get laserRefSection4Bullet2 =>
      'Interrupteur à clé et arrêt d\'urgence facilement accessibles';

  @override
  String get laserRefSection4Bullet3 =>
      'Verrouillage (interlock) qui coupe l\'émission si un capot ou un boîtier est ouvert';

  @override
  String get laserRefSection4Bullet4 =>
      'Détection de panne de scan (scan-fail) qui coupe le faisceau si les galvos s\'arrêtent — indispensable pour l\'audience scanning';

  @override
  String get laserRefSection4Bullet5 =>
      'Aucun faisceau fixe pointé vers le public — uniquement de l\'audience scanning avec les protections et calculs d\'exposition dédiés';

  @override
  String get laserRefSection4Bullet6 =>
      'Jamais de visée vers une zone aérienne, un avion, ou une surface réfléchissante non contrôlée (verre, miroir, écran)';

  @override
  String get laserRefSection5Title => 'NOHD, SZED, CZED expliqués';

  @override
  String get laserRefSection5Paragraph =>
      'Ces distances de sécurité sont calculées par l\'outil « Zones de sécurité » de l\'app à partir de la puissance, la divergence et le diamètre de sortie du faisceau.';

  @override
  String get laserRefSection5NohdTitle =>
      'NOHD — Nominal Ocular Hazard Distance';

  @override
  String get laserRefSection5NohdBody =>
      'Distance oculaire de danger nominal : au-delà de cette distance, l\'irradiance directe du faisceau descend sous la limite d\'exposition maximale (MPE) admise pour une exposition accidentelle et brève. C\'est la référence de base définie par l\'IEC 60825-1.';

  @override
  String get laserRefSection5SzedTitle => 'SZED — Show Zone Exposure Distance';

  @override
  String get laserRefSection5SzedBody =>
      'Distance d\'exposition de la zone de spectacle : délimite la zone où le public peut se trouver pendant un show avec balayage (audience scanning), avec un seuil MPE plus prudent que le NOHD.';

  @override
  String get laserRefSection5CzedTitle =>
      'CZED — Controlled Zone Exposure Distance';

  @override
  String get laserRefSection5CzedBody =>
      'Distance d\'exposition de la zone contrôlée : la plus prudente des trois, réservée à la zone où seul le personnel formé (opérateurs, techniciens) peut se trouver, en tenant compte d\'une exposition potentiellement plus longue.';

  @override
  String get laserRefSection5FieldNote =>
      'Dans l\'app, plus le seuil MPE utilisé est bas, plus la distance calculée est grande — d\'où l\'ordre CZED > SZED > NOHD. Ces distances restent indicatives : elles ne remplacent pas une étude réalisée par un Laser Safety Officer qualifié, ni la réglementation locale en vigueur.';

  @override
  String get laserRefSection6Title => 'Checklist rapide';

  @override
  String get laserRefSection6Bullet1 =>
      'Classe du laser identifiée, déclarée si nécessaire';

  @override
  String get laserRefSection6Bullet2 =>
      'LSO désigné et présent pendant tout le show';

  @override
  String get laserRefSection6Bullet3 =>
      'Zones NOHD/SZED/CZED calculées et matérialisées';

  @override
  String get laserRefSection6Bullet4 =>
      'Détection de panne de scan active si audience scanning';

  @override
  String get laserRefSection6Bullet5 => 'Arrêt d\'urgence testé et accessible';

  @override
  String get laserRefSection6Bullet6 =>
      'Aucune visée vers une zone aérienne ou une surface réfléchissante non contrôlée';

  @override
  String get laserRefFooterNote =>
      'Ces informations sont générales et pédagogiques — elles ne remplacent pas une formation de Laser Safety Officer ni la réglementation locale (IEC 60825, FDA/CDRH, autorités aéronautiques...).';

  @override
  String get aboutRiggingTitle => 'Rigging';

  @override
  String get aboutRiggingSubtitle => 'Bases, élingage et facteur d\'angle';

  @override
  String get aboutRiggingPageTitle => 'Rigging — cours rapide';

  @override
  String get riggingRefTocCopyText => 'Copier le sommaire';

  @override
  String get riggingRefSection1Title => 'Bases du rigging';

  @override
  String get riggingRefSection2Title => 'Élingage à 2 points (bridle)';

  @override
  String get riggingRefSection3Title => 'Facteur d\'angle';

  @override
  String get riggingRefSection4Title => 'Checklist';

  @override
  String get riggingRefSection1Bullet1 =>
      'WLL (Working Load Limit) : charge maximale d\'utilisation autorisée pour un accessoire, indiquée par le fabricant.';

  @override
  String get riggingRefSection1Bullet2 =>
      'Coefficient de sécurité : rapport entre la charge de rupture et la WLL, généralement 5:1 ou 10:1 selon le matériel et la réglementation.';

  @override
  String get riggingRefSection1Bullet3 =>
      'Chaîne de charge : chaque maillon (point d\'accroche, élingue, manille, structure) doit être dimensionné pour la charge totale — le maillon le plus faible fixe la limite de l\'ensemble.';

  @override
  String get riggingRefSection2Bullet1 =>
      'Un bridage à 2 points répartit la charge entre deux élingues formant un angle par rapport à la verticale.';

  @override
  String get riggingRefSection2Bullet2 =>
      'Plus l\'angle par rapport à la verticale augmente, plus la tension dans chaque élingue augmente.';

  @override
  String get riggingRefSection2Bullet3 =>
      'Recommandation courante : rester sous 90° d\'angle inclus entre les deux brins pour limiter la tension supplémentaire.';

  @override
  String get riggingRefSection3FormulaTitle => 'Formule';

  @override
  String get riggingRefSection3Formula1 =>
      'Tension par élingue = (Charge / nombre d\'élingues) × facteur d\'angle, avec facteur d\'angle = 1 / cos(angle par rapport à la verticale).';

  @override
  String get riggingRefSection3Bullet1 =>
      'Exemples : 0° → facteur 1.0 ; 45° → facteur environ 1.41 ; 60° → facteur 2.0.';

  @override
  String get riggingRefSection3Bullet2 =>
      'Plus l\'angle par rapport à la verticale est grand, plus le facteur — et donc la tension — augmente rapidement.';

  @override
  String get riggingRefSection4Bullet1 =>
      'Vérifier la WLL de chaque accessoire (élingue, manille, mousqueton, structure) avant l\'accroche.';

  @override
  String get riggingRefSection4Bullet2 =>
      'Calculer la tension réelle par élingue en tenant compte du facteur d\'angle, pas seulement de la charge totale divisée par le nombre de brins.';

  @override
  String get riggingRefSection4Bullet3 =>
      'Inspecter visuellement les accessoires (déformation, corrosion, usure) avant chaque utilisation.';

  @override
  String get riggingRefSection4Bullet4 =>
      'Faire vérifier l\'ensemble par une personne compétente ou un rigger qualifié pour les charges importantes ou les configurations complexes.';

  @override
  String get riggingRefFooterNote =>
      'Ce contenu est un rappel pédagogique général et ne remplace pas les normes locales, la formation rigger, ni la vérification par une personne compétente.';

  @override
  String get aboutConsoleTitle => 'Console & patch';

  @override
  String get aboutConsoleSubtitle => 'Console virtuelle, GDTF et patch DMX';

  @override
  String get aboutConsolePageTitle => 'Console — cours rapide';

  @override
  String get consoleRefTocCopyText => 'Copier le sommaire';

  @override
  String get consoleRefSection1Title => 'Console virtuelle & DMX sans fil';

  @override
  String get consoleRefSection2Title => 'GDTF & GDTF Share';

  @override
  String get consoleRefSection3Title => 'Patch & univers';

  @override
  String get consoleRefSection4Title => 'Checklist';

  @override
  String get consoleRefSection1Paragraph =>
      'Une console virtuelle permet de piloter un show depuis une tablette ou un smartphone, en envoyant du DMX via le réseau (Art-Net ou sACN) plutôt que par câble DMX direct.';

  @override
  String get consoleRefSection1Bullet1 =>
      'Le Wi-Fi introduit de la latence et des risques de coupure : à réserver aux réglages, pas au live critique sans solution de secours filaire.';

  @override
  String get consoleRefSection1Bullet2 =>
      'Vérifier que le node/interface DMX-sur-IP reçoit bien le bon univers Art-Net ou sACN configuré sur la console virtuelle.';

  @override
  String get consoleRefSection1Bullet3 =>
      'Prévoir un accès filaire de secours (DMX direct ou Ethernet) pour les moments critiques du show.';

  @override
  String get consoleRefSection2GdtfTitle => 'GDTF (General Device Type Format)';

  @override
  String get consoleRefSection2GdtfBody =>
      'Format de fichier standardisé qui décrit les caractéristiques d\'un projecteur (modes DMX, roues de couleur, géométrie 3D) pour un import fiable dans n\'importe quelle console compatible.';

  @override
  String get consoleRefSection2ShareTitle => 'GDTF Share';

  @override
  String get consoleRefSection2ShareBody =>
      'Base de données en ligne officielle où les fabricants publient les fichiers GDTF de leurs appareils, téléchargeables gratuitement pour le patch.';

  @override
  String get consoleRefSection3Bullet1 =>
      'Un univers DMX contient 512 canaux ; chaque appareil occupe un ou plusieurs canaux selon son mode DMX choisi.';

  @override
  String get consoleRefSection3Bullet2 =>
      'Toujours vérifier le mode DMX réellement réglé sur l\'appareil physique — il doit correspondre à celui sélectionné dans le patch de la console.';

  @override
  String get consoleRefSection3Bullet3 =>
      'Documenter le patch (adresses, univers, modes) facilite le dépannage et la reprise du show par une autre personne.';

  @override
  String get consoleRefSection4Bullet1 =>
      'Vérifier la connexion réseau (Wi-Fi ou filaire) entre la console virtuelle et le node DMX avant le show.';

  @override
  String get consoleRefSection4Bullet2 =>
      'Confirmer que chaque appareil est patché dans le bon univers et à la bonne adresse de départ.';

  @override
  String get consoleRefSection4Bullet3 =>
      'Utiliser un fichier GDTF à jour depuis GDTF Share plutôt qu\'un profil générique.';

  @override
  String get consoleRefSection4Bullet4 =>
      'Prévoir un plan de secours en cas de coupure réseau ou Wi-Fi pendant le show.';

  @override
  String get consoleRefFooterNote =>
      'Ce contenu est un rappel général ; se référer à la documentation du fabricant pour les modes DMX et procédures spécifiques.';

  @override
  String get aboutCinemaTitle => 'Cinéma';

  @override
  String get aboutCinemaSubtitle => 'Caméra, profondeur de champ et cadence';

  @override
  String get aboutCinemaPageTitle => 'Cinéma — cours rapide';

  @override
  String get cinemaRefTocCopyText => 'Copier le sommaire';

  @override
  String get cinemaRefSection1Title => 'Notions de base caméra';

  @override
  String get cinemaRefSection2Title => 'Profondeur de champ & mise au point';

  @override
  String get cinemaRefSection3Title => 'Cadence & obturateur';

  @override
  String get cinemaRefSection4Title => 'Checklist';

  @override
  String get cinemaRefSection1Bullet1 =>
      'Capteur : surface photosensible qui capture l\'image ; sa taille influence le champ de vision et la profondeur de champ pour une focale donnée.';

  @override
  String get cinemaRefSection1Bullet2 =>
      'Focale : distance (en mm) qui détermine l\'angle de champ — une focale courte est grand-angle, une focale longue est un téléobjectif.';

  @override
  String get cinemaRefSection1Bullet3 =>
      'Ouverture (f/) : taille du diaphragme, qui contrôle la quantité de lumière entrante et la profondeur de champ.';

  @override
  String get cinemaRefSection2Paragraph =>
      'La profondeur de champ est la zone de netteté acceptable devant et derrière le sujet mis au point.';

  @override
  String get cinemaRefSection2Bullet1 =>
      'Une ouverture large (f/1.4, f/2) donne une profondeur de champ réduite (arrière-plan flou).';

  @override
  String get cinemaRefSection2Bullet2 =>
      'Une ouverture fermée (f/11, f/16) donne une profondeur de champ étendue (tout net).';

  @override
  String get cinemaRefSection3FormulaTitle => 'Formule shutter angle';

  @override
  String get cinemaRefSection3Formula1 =>
      'Vitesse d\'obturation = 1 / (2 × cadence en images/seconde) pour un angle d\'obturation de 180°, la référence standard en cinéma.';

  @override
  String get cinemaRefSection3Bullet1 =>
      '24 images/seconde est la cadence standard du cinéma ; 25 ou 30 i/s sont courantes en broadcast selon la norme vidéo (PAL/NTSC).';

  @override
  String get cinemaRefSection3Bullet2 =>
      'Un angle d\'obturation plus fermé (90°, 45°) donne un rendu plus saccadé, utilisé pour les scènes d\'action stylisées.';

  @override
  String get cinemaRefSection4Bullet1 =>
      'Vérifier que la cadence caméra correspond à la fréquence des sources lumineuses (éviter le flicker).';

  @override
  String get cinemaRefSection4Bullet2 =>
      'Adapter l\'ouverture au rendu de profondeur de champ souhaité, pas seulement à l\'exposition.';

  @override
  String get cinemaRefSection4Bullet3 =>
      'Garder un angle d\'obturation cohérent sur l\'ensemble du tournage pour une texture de mouvement homogène.';

  @override
  String get cinemaRefSection4Bullet4 =>
      'Toujours tester en conditions réelles de plateau avant le tournage définitif.';

  @override
  String get cinemaRefFooterNote =>
      'Ce contenu est un rappel pédagogique général ; les réglages définitifs dépendent du matériel et de l\'intention artistique.';

  @override
  String get aboutTimecodeTitle => 'Timecode';

  @override
  String get aboutTimecodeSubtitle => 'SMPTE, drop-frame et cadences';

  @override
  String get aboutTimecodePageTitle => 'Timecode — cours rapide';

  @override
  String get timecodeRefTocCopyText => 'Copier le sommaire';

  @override
  String get timecodeRefSection1Title => 'Qu\'est-ce que le timecode SMPTE';

  @override
  String get timecodeRefSection2Title => 'Drop-frame vs Non-drop-frame';

  @override
  String get timecodeRefSection3Title => 'Cadences courantes';

  @override
  String get timecodeRefSection4Title => 'Checklist';

  @override
  String get timecodeRefSection1FormatTitle => 'Format';

  @override
  String get timecodeRefSection1FormatBody =>
      'HH:MM:SS:FF — heures, minutes, secondes et numéro d\'image (frame), remis à zéro à chaque cadence complète.';

  @override
  String get timecodeRefSection1Bullet1 =>
      'Le timecode SMPTE synchronise image, son et éclairage sur une référence temporelle commune.';

  @override
  String get timecodeRefSection1Bullet2 =>
      'Chaque image porte une adresse unique, ce qui permet un référencement précis en post-production comme en régie live.';

  @override
  String get timecodeRefSection2Paragraph =>
      'Le drop-frame (DF) existe car certaines cadences (29.97 i/s) ne sont pas des nombres entiers d\'images par seconde, ce qui décale le timecode par rapport au temps réel s\'il n\'est pas corrigé.';

  @override
  String get timecodeRefSection2Bullet1 =>
      'Non-drop-frame (NDF) : compte les images sans saut ; simple mais dérive légèrement par rapport au temps réel en 29.97 i/s.';

  @override
  String get timecodeRefSection2Bullet2 =>
      'Drop-frame (DF) : saute périodiquement des numéros d\'image (pas d\'image réelle) pour recaler le timecode sur le temps réel.';

  @override
  String get timecodeRefSection3Bullet1 => '24 i/s : cadence cinéma classique.';

  @override
  String get timecodeRefSection3Bullet2 =>
      '25 i/s : standard PAL (Europe) ; 30 i/s (ou 29.97 DF/NDF) : standard NTSC (Amérique du Nord, Japon).';

  @override
  String get timecodeRefSection3Bullet3 =>
      '50 i/s et 59.94/60 i/s : cadences haute fréquence utilisées en broadcast et pour les ralentis.';

  @override
  String get timecodeRefSection3Bullet4 =>
      'Toujours vérifier que toutes les sources (caméra, son, éclairage, vidéo) utilisent la même cadence de référence.';

  @override
  String get timecodeRefSection4Bullet1 =>
      'Confirmer la cadence et le mode (DF/NDF) sur toutes les sources avant le début du show ou du tournage.';

  @override
  String get timecodeRefSection4Bullet2 =>
      'Vérifier que la source maître de timecode (master clock) est bien identifiée et distribuée à tous les appareils.';

  @override
  String get timecodeRefSection4Bullet3 =>
      'En cas de doute sur une dérive, comparer le timecode affiché à une horloge de référence sur une durée suffisante.';

  @override
  String get timecodeRefFooterNote =>
      'Ce contenu est un rappel général ; se référer aux spécifications SMPTE et à la documentation des appareils utilisés.';

  @override
  String get aboutConversionsTitle => 'Conversions & BPM';

  @override
  String get aboutConversionsSubtitle => 'Unités, BPM et DMX en un coup d\'œil';

  @override
  String get aboutConversionsPageTitle => 'Conversions & BPM — cours rapide';

  @override
  String get conversionsRefTocCopyText => 'Copier le sommaire';

  @override
  String get conversionsRefSection1Title => 'Pourquoi convertir';

  @override
  String get conversionsRefSection2Title => 'BPM ↔ millisecondes';

  @override
  String get conversionsRefSection3Title =>
      'DMX ↔ pourcentage / 8-bit ↔ 16-bit';

  @override
  String get conversionsRefSection4Title => 'Checklist';

  @override
  String get conversionsRefSection1Paragraph =>
      'En régie, les unités se mélangent souvent (BPM musicaux, millisecondes de delay, pourcentages DMX, valeurs 8/16-bit) : convertir rapidement et sans erreur évite les décalages entre effets lumière, son et vidéo.';

  @override
  String get conversionsRefSection2FormulaTitle => 'Formule';

  @override
  String get conversionsRefSection2Formula1 =>
      'Durée d\'un battement (ms) = 60 000 / BPM.';

  @override
  String get conversionsRefSection2Bullet1 =>
      'Exemple : à 120 BPM, un battement dure 500 ms ; une double-croche (1/4 de battement) dure 125 ms.';

  @override
  String get conversionsRefSection2Bullet2 =>
      'Utile pour caler un effet lumière, un delay audio ou un clip vidéo sur le tempo d\'un morceau.';

  @override
  String get conversionsRefSection3Bullet1 =>
      'Une valeur DMX 8-bit va de 0 à 255 ; en pourcentage, 255 correspond à 100 %.';

  @override
  String get conversionsRefSection3Bullet2 =>
      'En 16-bit, deux canaux (fin/grossier) combinés donnent une résolution de 0 à 65 535 pour un contrôle plus fin (dimmer, pan/tilt).';

  @override
  String get conversionsRefSection3Bullet3 =>
      'Vérifier le mode (8-bit ou 16-bit) réellement configuré sur l\'appareil avant de patcher, sous peine de décalage de valeurs.';

  @override
  String get conversionsRefSection4Bullet1 =>
      'Toujours vérifier l\'unité affichée avant de saisir une valeur (ms, BPM, %, 8-bit, 16-bit).';

  @override
  String get conversionsRefSection4Bullet2 =>
      'Recalculer plutôt que d\'arrondir de tête pour les valeurs critiques (synchronisation, sécurité).';

  @override
  String get conversionsRefSection4Bullet3 =>
      'Documenter les conversions utilisées dans la fiche technique pour faciliter la reprise du show.';

  @override
  String get conversionsRefFooterNote =>
      'Ce contenu est un rappel général ; se référer à la documentation de l\'appareil pour ses modes de résolution exacts.';

  @override
  String get aboutCategoryNetworkTitle => 'Réseau & protocoles';

  @override
  String get aboutCategoryAudioRfTitle => 'Audio & RF';

  @override
  String get aboutCategoryVideoCinemaTitle => 'Vidéo & cinéma';

  @override
  String get aboutCategoryLightingTitle => 'Éclairage, laser & console';

  @override
  String get aboutCategoryRiggingElecTitle => 'Rigging & électricité';

  @override
  String get aboutCategoryToolsTitle => 'Outils pratiques';

  @override
  String get pinnedItemsTitle => 'Mes épingles';

  @override
  String get homePinnedItemsSubtitle =>
      'Retrouvez rapidement vos outils et références épinglés.';

  @override
  String get pinnedItemsEmpty =>
      'Aucun outil ni référence épinglé pour le moment.';

  @override
  String get fixtureInfoSectionIdentification => 'Identification';

  @override
  String get fixtureInfoLabelName => 'Nom';

  @override
  String get fixtureInfoLabelId => 'ID';

  @override
  String get fixtureInfoSectionDmx => 'DMX / Réseau';

  @override
  String get fixtureInfoLabelUniverse => 'Univers';

  @override
  String get fixtureInfoLabelAddress => 'Adresse';

  @override
  String get fixtureInfoLabelMode => 'Mode';

  @override
  String get fixtureInfoLabelChannelCount => 'Canaux';

  @override
  String get fixtureInfoLabelGdtfSpec => 'Fichier GDTF';

  @override
  String get fixtureInfoSectionPhysical => 'Physique';

  @override
  String get fixtureInfoLabelWeight => 'Poids';

  @override
  String fixtureInfoValueKg(Object kg) {
    return '$kg kg';
  }

  @override
  String get fixtureInfoLabelDimensions => 'Dimensions';

  @override
  String fixtureInfoValueDimensionsCm(
      Object heightCm, Object lengthCm, Object widthCm) {
    return '$lengthCm × $widthCm × $heightCm cm';
  }

  @override
  String get fixtureInfoLabelLegHeight => 'Hauteur des pieds';

  @override
  String fixtureInfoValueCm(Object cm) {
    return '$cm cm';
  }

  @override
  String get fixtureInfoSectionElectrical => 'Électrique';

  @override
  String get fixtureInfoLabelPower => 'Puissance';

  @override
  String fixtureInfoValueWatts(Object watts) {
    return '$watts W';
  }

  @override
  String get fixtureInfoSectionEnvironment => 'Environnement';

  @override
  String get fixtureInfoLabelOperatingTemp => 'Température de fonctionnement';

  @override
  String fixtureInfoValueTempRange(Object highC, Object lowC) {
    return '$lowC°C – $highC°C';
  }

  @override
  String get fixtureInfoNoGdtfData =>
      'Aucune information physique disponible (GDTF non fourni ou incomplet).';

  @override
  String get patch3dTitle => 'Visualiseur 3D';

  @override
  String get patch3dOpenButton => 'Voir en 3D';

  @override
  String get patch3dResetCameraTooltip => 'Recentrer la caméra';

  @override
  String get patch3dFiltersTooltip => 'Filtres et couleurs';

  @override
  String get patch3dZoomToFitTooltip => 'Cadrer sur tout';

  @override
  String get patch3dCameraViewsTooltip => 'Vues caméra';

  @override
  String get patch3dCameraViewFront => 'Face';

  @override
  String get patch3dCameraViewTop => 'Dessus';

  @override
  String get patch3dCameraViewSide => 'Côté';

  @override
  String get patch3dCameraViewIso => 'Isométrique';

  @override
  String get patch3dBackgroundColorLabel => 'Couleur de fond';

  @override
  String patch3dEntriesWithoutPosition(Object count) {
    return '$count fixture(s) sans position 3D (pas de Matrix dans le MVR).';
  }

  @override
  String get patch3dNoPositionedFixtures =>
      'Aucune fixture positionnée à afficher. Importe un MVR contenant des positions 3D.';

  @override
  String get patch3dMissingModelTitle => 'Modèles 3D manquants';

  @override
  String patch3dMissingModelBody(Object count) {
    return '$count type(s) de machine n’ont pas de modèle 3D dans leur GDTF. Un cube générique (30×30×30 cm) est utilisé à la place :';
  }

  @override
  String get patch3dColorModeLabel => 'Colorisation';

  @override
  String get patch3dColorModeByType => 'Par type';

  @override
  String get patch3dColorModeByUniverse => 'Par univers';

  @override
  String get patch3dFilterUniverseLabel => 'Univers';

  @override
  String get patch3dFilterTypeLabel => 'Type de machine';

  @override
  String get patch3dFilterShowAll => 'Tout afficher';

  @override
  String get gdtfWizardSuggestionOpen => 'Ouvert';

  @override
  String get gdtfWizardSuggestionClosed => 'Fermé';

  @override
  String gdtfWizardSuggestionGoboSlot(int n) {
    return 'Gobo $n';
  }

  @override
  String gdtfWizardSuggestionColorSlot(int n) {
    return 'Couleur $n';
  }

  @override
  String get gdtfWizardColorWhite => 'Blanc';

  @override
  String get gdtfWizardColorRed => 'Rouge';

  @override
  String get gdtfWizardColorGreen => 'Vert';

  @override
  String get gdtfWizardColorBlue => 'Bleu';

  @override
  String get gdtfWizardColorYellow => 'Jaune';

  @override
  String get gdtfWizardColorCyan => 'Cyan';

  @override
  String get gdtfWizardColorMagenta => 'Magenta';

  @override
  String get gdtfWizardColorRainbow => 'Arc-en-ciel';

  @override
  String get gdtfWizardStrobeSlowToFast => 'Strobe lent → rapide';

  @override
  String get gdtfWizardStrobeRandom => 'Strobe aléatoire';

  @override
  String get gdtfWizardAppBarTitle => 'Assistant manuel GDTF';

  @override
  String get gdtfWizardStepTitleStyle => 'Style de projecteur';

  @override
  String get gdtfWizardStepTitleFunction => 'Fonction';

  @override
  String get gdtfWizardStepTitleChannels => 'Canaux';

  @override
  String get gdtfWizardStepTitlePixels => 'Pixels';

  @override
  String get gdtfWizardStepTitleStructure => 'Structure';

  @override
  String gdtfWizardStepHeader(int step, String title) {
    return 'Étape $step/5 — $title';
  }

  @override
  String get gdtfWizardErrStyle =>
      'Choisis un style de projecteur pour continuer.';

  @override
  String get gdtfWizardErrFunction =>
      'Sélectionne au moins une fonction (wash, spot ou beam).';

  @override
  String get gdtfWizardErrChannels =>
      'Coche au moins un canal — la machine doit bien piloter quelque chose !';

  @override
  String get gdtfWizardErrPixelCount =>
      'Il faut au moins 2 pixels/instances pour une structure multi-pixel.';

  @override
  String get gdtfWizardErrRepeatCount =>
      'Sélectionne au moins 2 canaux répétables (ex : Red + Green, ou Pan/Tilt) pour que chaque pixel soit bien reconnu comme une instance distincte.';

  @override
  String get gdtfWizardErrRowsCols =>
      'Renseigne un nombre de lignes et de colonnes valide.';

  @override
  String get gdtfWizardErrModeName => 'Donne un nom à ce mode DMX.';

  @override
  String get gdtfWizardStyleIntro => 'Quel type de machine crées-tu ?';

  @override
  String get gdtfWizardStyleLyreTitle => 'Lyre (moving head)';

  @override
  String get gdtfWizardStyleLyreSubtitle =>
      'Tête mobile avec pan/tilt — spot, wash ou beam sur lyre.';

  @override
  String get gdtfWizardStyleParTitle => 'PAR / Fixe';

  @override
  String get gdtfWizardStyleParSubtitle =>
      'Projecteur statique, sans mouvement (PAR LED, découpe fixe…).';

  @override
  String get gdtfWizardStyleBarreTitle => 'Barre (bar)';

  @override
  String get gdtfWizardStyleBarreSubtitle =>
      'Barre linéaire, souvent à pixels (barre LED, X4 Bar…).';

  @override
  String get gdtfWizardPanTiltCheckTitle =>
      'Cette machine a un moteur Pan/Tilt';

  @override
  String get gdtfWizardPanTiltCheckSubtitle =>
      'Ajoute les canaux Pan/Tilt en 16 bits (norme GDTF).';

  @override
  String get gdtfWizardFunctionIntro =>
      'Quelle(s) fonction(s) pour cette machine ? (choix multiples)';

  @override
  String get gdtfWizardFunctionWash => 'Wash';

  @override
  String get gdtfWizardFunctionSpot => 'Spot';

  @override
  String get gdtfWizardFunctionBeam => 'Beam';

  @override
  String get gdtfWizardFunctionHint =>
      'Sert juste à pré-cocher des canaux utiles à l\'étape suivante (Wash → Frost/Zoom, Spot → Gobo/Focus/Prisme, Beam → faisceau serré). Tu pourras tout ajuster juste après.';

  @override
  String get gdtfWizardChannelsIntro => 'Coche les canaux DMX de la machine.';

  @override
  String get gdtfWizardSectionIntensity => 'INTENSITÉ';

  @override
  String get gdtfWizardChannelDimmer => 'Dimmer';

  @override
  String get gdtfWizardChannelStrobe => 'Obturateur / Strobe';

  @override
  String get gdtfWizardSectionColor => 'COULEUR';

  @override
  String get gdtfWizardChannelCto => 'Molette CTO (température de couleur)';

  @override
  String get gdtfWizardChannelColorMacro => 'Macro couleur (préréglages)';

  @override
  String get gdtfWizardSectionPosition => 'POSITION';

  @override
  String get gdtfWizardPanTiltNote =>
      'Pan/Tilt ajoutés automatiquement (16 bits). Pour une fixture à plusieurs têtes mobiles indépendantes, tu pourras le répartir par tête à l\'étape Pixels.';

  @override
  String get gdtfWizardSectionBeamShaping => 'FAISCEAU';

  @override
  String get gdtfWizardChannelZoom => 'Zoom';

  @override
  String get gdtfWizardChannelFocus => 'Focus';

  @override
  String get gdtfWizardChannelIris => 'Iris';

  @override
  String get gdtfWizardChannelFrost => 'Frost';

  @override
  String get gdtfWizardChannelPrism => 'Prisme';

  @override
  String get gdtfWizardChannelPrismRot => 'Rotation du prisme';

  @override
  String get gdtfWizardSectionGobos => 'GOBOS';

  @override
  String get gdtfWizardChannelGobo1 => 'Roue de gobos 1';

  @override
  String get gdtfWizardChannelGobo1Rot => 'Rotation gobo 1';

  @override
  String get gdtfWizardChannelGobo2 => 'Roue de gobos 2';

  @override
  String get gdtfWizardChannelGobo2Rot => 'Rotation gobo 2';

  @override
  String get gdtfWizardSectionEffectsControl => 'EFFETS & CONTRÔLE';

  @override
  String get gdtfWizardChannelEffects => 'Effets / macros';

  @override
  String get gdtfWizardChannelReset => 'Reset';

  @override
  String get gdtfWizardSlotsHint =>
      'Slots (un par ligne, facultatif) — ex : Ouvert, Gobo 1…';

  @override
  String get gdtfWizardSlotsTooltip => 'Suggestion';

  @override
  String get gdtfWizardChannelPanTiltPerHead => 'Pan/Tilt (par tête)';

  @override
  String get gdtfWizardPixelsIntro =>
      'Cette machine a-t-elle plusieurs pixels/cellules pilotables séparément (matrice LED, barre à pixels…) ?';

  @override
  String get gdtfWizardMultiplePixelsTitle => 'Plusieurs pixels / instances';

  @override
  String get gdtfWizardMultiplePixelsSubtitle =>
      'Sinon, tous les canaux cochés à l\'étape précédente restent uniques (une seule sortie).';

  @override
  String get gdtfWizardSectionPixelCount => 'NOMBRE DE PIXELS';

  @override
  String get gdtfWizardSectionPixelContent => 'CONTENU D\'UN PIXEL';

  @override
  String get gdtfWizardNoRepeatableChannels =>
      'Aucun canal répétable pour l\'instant. Retourne à l\'étape « Style » (Pan/Tilt) ou « Canaux » (Dimmer, Obturateur/Strobe, couleur…) et coche au moins un attribut à répéter par tête/pixel.';

  @override
  String gdtfWizardRepeatPerPixelSubtitle(String label) {
    return 'Un canal par pixel (ex: $label 1, $label 2…)';
  }

  @override
  String get gdtfWizardRepeatGlobalSubtitle =>
      'Reste un seul canal global pour toute la machine';

  @override
  String get gdtfWizardModeNameLabel => 'Nom du mode DMX';

  @override
  String get gdtfWizardModeNameHint => 'ex : Standard, 16 bits, Pixel Mode…';

  @override
  String get gdtfWizardSingleOutputNote =>
      'Machine à une seule sortie (pas de pixels multiples) : rien à configurer ici, chaque canal coché reste unique.';

  @override
  String get gdtfWizardSectionLayout => 'AGENCEMENT';

  @override
  String get gdtfWizardArrangementLinearTitle => 'Barre linéaire';

  @override
  String gdtfWizardArrangementLinearSubtitle(int count) {
    return 'Pixels alignés en ligne (ex : X4 Bar). Numérotés 1 à $count.';
  }

  @override
  String get gdtfWizardArrangementMatrixTitle => 'Matrice (grille)';

  @override
  String get gdtfWizardArrangementMatrixSubtitle =>
      'Pixels organisés en lignes × colonnes (ex : mur LED, JDC1 pixel curve).';

  @override
  String get gdtfWizardArrangementModulesTitle => 'Modules indépendants';

  @override
  String get gdtfWizardArrangementModulesSubtitle =>
      'Plusieurs têtes/modules identiques sur un même châssis (ex : JDC1).';

  @override
  String get gdtfWizardRowsLabel => 'Lignes';

  @override
  String get gdtfWizardColsLabel => 'Colonnes';

  @override
  String gdtfWizardMatrixTotal(int count) {
    return 'Total : $count pixels (numérotés en lecture ligne par ligne).';
  }

  @override
  String get gdtfWizardModulesNote =>
      'Chaque module peut avoir sa propre couleur/dimmer/strobe ET son propre zoom/focus/iris/frost/prisme/gobo — retourne à l\'étape « Pixels » et coche, pour chaque canal faisceau concerné, qu\'il doit se répéter par module plutôt que rester commun à tous.';

  @override
  String get gdtfWizardCancel => 'Annuler';

  @override
  String get gdtfWizardBack => 'Retour';

  @override
  String get gdtfWizardValidateAndEdit => 'Valider et éditer';

  @override
  String get gdtfWizardNext => 'Suivant';

  @override
  String get gdtfWizardDefaultModeName => 'Manuel';

  @override
  String get gdtfWizardOrDivider => 'OU';

  @override
  String get gdtfWizardManualButtonLabel =>
      'Assistant manuel (sans PDF) — style, canaux, pixels…';

  @override
  String get gdtfWizardColorModeNone => 'Aucune';

  @override
  String get gdtfWizardColorModeRgb => 'RVB';

  @override
  String get gdtfWizardColorModeRgbw => 'RVB + Blanc';

  @override
  String get gdtfWizardColorModeRgbwaUv => 'RVB + Blanc + Ambre + UV';

  @override
  String get gdtfWizardColorModeCmy => 'CMJ (Cyan/Magenta/Jaune)';

  @override
  String get gdtfWizardColorModeWheel => 'Roue de couleurs';

  @override
  String get gdtfWizardColorAmber => 'Ambre';

  @override
  String get gdtfWizardColorUv => 'UV';

  @override
  String get gdtfWizardChannelCtoShort => 'CTO';

  @override
  String get gdtfManualTab => 'Assistant manuel';

  @override
  String get gdtfWizardManualTabTitle => 'Créer un GDTF sans PDF';

  @override
  String get gdtfWizardManualTabIntro =>
      'Pas de manuel PDF sous la main, ou fixture trop simple pour ça ? Décris ta machine en 5 étapes (style, fonctions, canaux, pixels, structure) et l\'app construit directement un GDTF conforme, sans IA ni upload.';

  @override
  String get gdtfWizardSlotsAddButton => 'Ajouter';

  @override
  String get gdtfWizardSlotsRowHint => 'Nom du slot';

  @override
  String get gdtfWizardSlotsRemoveTooltip => 'Supprimer';

  @override
  String get gdtfWizardSlotsEmptyHint =>
      'Aucun slot nommé pour l\'instant — ajoute-en un ou utilise une suggestion.';

  @override
  String get ma3CalcTitle => 'Paramètres MA3';

  @override
  String get ma3CalcTileDescription =>
      'Combien de paramètres pour ton show, et combien de PU ?';

  @override
  String get ma3CalcTabMvr => 'Depuis un MVR';

  @override
  String get ma3CalcTabList => 'Liste de machines';

  @override
  String get ma3CalcAddFixture => 'Ajouter une machine';

  @override
  String get ma3CalcAddSheetTitle => 'Quelle machine ?';

  @override
  String get ma3CalcAddSheetSubtitle =>
      'Recherche dans GDTF Share, importe un .gdtf ou saisis la valeur toi-même.';

  @override
  String get ma3CalcSearchHint => 'ex. MAC Aura, Robe Spiider…';

  @override
  String get ma3CalcSearchFailed =>
      'Recherche impossible pour le moment. Vérifie ta connexion.';

  @override
  String get ma3CalcNoResult =>
      'Aucun résultat. Essaie un autre nom, ou la saisie manuelle.';

  @override
  String get ma3CalcImportGdtf => 'Fichier .gdtf';

  @override
  String get ma3CalcManualEntry => 'Saisie manuelle';

  @override
  String get ma3CalcManualName => 'Nom de la machine';

  @override
  String get ma3CalcChooseMode => 'Quel mode DMX ?';

  @override
  String ma3CalcModeSummary(int params, int channels) {
    return '$params param. MA3 · $channels canaux DMX';
  }

  @override
  String get ma3CalcModeUnknown => 'Mode sans canaux lisibles';

  @override
  String get ma3CalcHowMany => 'Combien de machines ?';

  @override
  String get ma3CalcDownloadFailed => 'Téléchargement du GDTF impossible.';

  @override
  String get ma3CalcGdtfUnreadable =>
      'Ce GDTF est illisible (fichier abîmé ?).';

  @override
  String get ma3CalcGdtfNoMode => 'Aucun mode DMX dans ce GDTF.';

  @override
  String ma3CalcNotGdtf(String name) {
    return '« $name » n\'est pas un fichier .gdtf.';
  }

  @override
  String ma3CalcNotMvr(String name) {
    return '« $name » n\'est pas un fichier .mvr.';
  }

  @override
  String get ma3CalcPickFailed => 'Impossible d\'ouvrir le fichier.';

  @override
  String get ma3CalcMvrUnreadable =>
      'Ce MVR est illisible (ce n\'est pas une archive valide).';

  @override
  String get ma3CalcMvrNoScene =>
      'Pas de GeneralSceneDescription.xml dans ce MVR.';

  @override
  String get ma3CalcMvrNoFixtures => 'Aucune machine dans ce MVR.';

  @override
  String get ma3CalcMvrEmptyTitle => 'Balance ton MVR 🎛️';

  @override
  String get ma3CalcMvrEmptyBody =>
      'Export Vectorworks, Capture, grandMA3, Depence… On compte les machines, on lit leurs GDTF et on te dit combien de paramètres (et de PU) il te faut.';

  @override
  String get ma3CalcPickMvr => 'Choisir un fichier .mvr';

  @override
  String get ma3CalcChangeFile => 'Changer';

  @override
  String get ma3CalcListEmptyTitle => 'Ton kit, machine par machine';

  @override
  String get ma3CalcListEmptyBody =>
      'Genre 6 × MAC Aura, 23 × Studio Color… Ajoute tes machines, choisis le mode, et le total s\'affiche tout seul.';

  @override
  String get ma3CalcYourSystem => 'Ta console';

  @override
  String get ma3CalcSafetyMargin => 'Marge de sécurité';

  @override
  String get ma3CalcNoMargin => 'Aucune';

  @override
  String get ma3CalcTotalParams => 'Paramètres MA3';

  @override
  String ma3CalcFixturesAndUniverses(int fixtures, int universes) {
    return '$fixtures machines · ≈ $universes univers DMX';
  }

  @override
  String ma3CalcWithMargin(int percent, String value) {
    return 'Avec $percent % de marge : $value';
  }

  @override
  String get ma3CalcCopySummary => 'Copier le résumé';

  @override
  String ma3CalcVerdictSessionMax(String max) {
    return 'Au-delà de $max paramètres : c\'est le maximum d\'une session grandMA3.';
  }

  @override
  String ma3CalcVerdictOnPcTooSmall(String max) {
    return 'onPC plafonne à $max paramètres';
  }

  @override
  String get ma3CalcVerdictOnPcTooSmallSub =>
      'Il te faut une console grandMA3 (+ PU si besoin) : choisis-la au-dessus pour voir la config.';

  @override
  String get ma3CalcVerdictOnPcOk => 'onPC suffit 👌';

  @override
  String ma3CalcVerdictOnPcOkSub(String max) {
    return 'N\'importe quel matériel onPC (command wing, fader wing, node 4k, rack-unit…) débloque $max paramètres.';
  }

  @override
  String ma3CalcVerdictBaseOk(String console) {
    return 'Ta $console suffit, pas besoin de PU 🎉';
  }

  @override
  String ma3CalcVerdictCapacity(String capacity) {
    return 'Capacité totale : $capacity paramètres.';
  }

  @override
  String ma3CalcVerdictAddPu(String units) {
    return 'Ajoute $units';
  }

  @override
  String ma3CalcVerdictXlOnly(int count) {
    return 'Ou, plus simple : $count × PU XL.';
  }

  @override
  String ma3CalcUnknownNotCounted(int count) {
    return '$count machine(s) sans données ne sont pas comptées : corrige-les ci-dessous.';
  }

  @override
  String ma3CalcFixtureTypes(int count) {
    return 'Types de machines ($count)';
  }

  @override
  String ma3CalcMvrCounts(int fixtures, int unpatched) {
    return '$fixtures machines · $unpatched non patchées';
  }

  @override
  String ma3CalcMultipatchNote(int count) {
    return 'Dont $count multipatch, comptés par sécurité.';
  }

  @override
  String ma3CalcPerUnit(int params) {
    return '$params param. par machine';
  }

  @override
  String get ma3CalcUnknownParams => 'Paramètres inconnus';

  @override
  String get ma3CalcTapToFix => 'Touche pour saisir la valeur toi-même →';

  @override
  String get ma3CalcSwipeHint =>
      'Glisse une ligne vers la gauche pour la supprimer · touche-la pour corriger ses paramètres.';

  @override
  String get ma3CalcClear => 'Vider';

  @override
  String get ma3CalcClearListTitle => 'Vider la liste ?';

  @override
  String get ma3CalcClearListBody =>
      'Toutes les machines de la liste seront supprimées.';

  @override
  String get ma3CalcCancel => 'Annuler';

  @override
  String get ma3CalcOk => 'OK';

  @override
  String get ma3CalcParamsPerUnitTitle => 'Paramètres par machine';

  @override
  String get ma3CalcParamsUnit => 'param.';

  @override
  String ma3CalcGdtfValue(int value) {
    return 'Valeur calculée depuis le GDTF : $value';
  }

  @override
  String get ma3CalcParamsHelp =>
      'Astuce : 1 paramètre = 1 canal DMX, les canaux « fine » 16 bits ne comptent pas.';

  @override
  String get ma3CalcBackToGdtf => 'Valeur du GDTF';

  @override
  String get ma3CalcReliabilityOkTitle => 'GDTF complets à première vue ✅';

  @override
  String get ma3CalcReliabilityOkBody =>
      'Tous les modes sont trouvés et cohérents. Le calcul reste basé sur ces GDTF.';

  @override
  String ma3CalcReliabilityWarnTitle(int count) {
    return '$count type(s) de machine à vérifier';
  }

  @override
  String get ma3CalcReliabilityWarnBody =>
      'Certains GDTF semblent incomplets ou incohérents : le total peut être faux. Détails sous chaque machine.';

  @override
  String ma3CalcReliabilityBadTitle(int count) {
    return '$count type(s) de machine sans données';
  }

  @override
  String get ma3CalcReliabilityBadBody =>
      'GDTF absent ou mode introuvable : ces machines ne sont pas comptées, donc le total est trop bas. Touche-les pour saisir la valeur.';

  @override
  String get ma3CalcDisclaimer =>
      'Le calcul est basé sur les GDTF. Si un GDTF est incomplet ou faux, le résultat le sera aussi. Vérifie toujours dans la grandMA3 (fenêtre System Information ou Patch › DMX Universes, colonne Coarse Params).';

  @override
  String get ma3CalcDisclaimerShort =>
      'Calcul basé sur les GDTF : à vérifier dans la grandMA3.';

  @override
  String get ma3CalcHowTitle => 'Comment c\'est calculé ?';

  @override
  String get ma3CalcHowBody =>
      'Pour grandMA3, 1 paramètre = 1 attribut piloté = 1 canal DMX « coarse ». Les canaux fine (16/24 bits) sont gratuits et les canaux virtuels (dimmer virtuel…) ne comptent pas pour la licence. Les machines multi-instance (pixels, cellules) sont dépliées instance par instance. La reco privilégie le moins de boîtiers possible.';

  @override
  String get ma3CalcHowHardware => 'Paramètres par matériel (doc MA, v2.3)';

  @override
  String ma3CalcHowSessionMax(String max) {
    return 'Maximum par session : $max';
  }

  @override
  String get ma3CalcIssueGdtfMissing =>
      'GDTF absent du MVR : paramètres inconnus.';

  @override
  String get ma3CalcIssueUnreadable => 'GDTF illisible.';

  @override
  String ma3CalcIssueModeMissing(String modes) {
    return 'Aucun mode indiqué dans le MVR. Modes du GDTF : $modes';
  }

  @override
  String ma3CalcIssueModeNotFound(String mode, String modes) {
    return 'Mode « $mode » introuvable dans le GDTF. Modes dispo : $modes';
  }

  @override
  String get ma3CalcIssueModeGuessed =>
      'Pas de mode dans le MVR : le seul mode du GDTF a été utilisé.';

  @override
  String ma3CalcIssueModePartial(String mode) {
    return 'Mode trouvé par nom approchant : « $mode ».';
  }

  @override
  String get ma3CalcIssueNoChannels => 'Ce mode ne contient aucun canal DMX.';

  @override
  String ma3CalcIssueNoFunction(int count) {
    return '$count canal(aux) sans fonction ni attribut : GDTF probablement incomplet.';
  }

  @override
  String ma3CalcIssueOverlap(int count) {
    return '$count canal(aux) sur une adresse DMX déjà prise : GDTF incohérent.';
  }

  @override
  String ma3CalcIssueGaps(int count) {
    return '$count adresse(s) DMX vide(s) dans le mode : canaux manquants ?';
  }

  @override
  String ma3CalcIssueNameMismatch(int announced, int found) {
    return 'Le nom du mode annonce $announced canaux, le GDTF en décrit $found.';
  }

  @override
  String ma3CalcIssueUnknownGeometry(int count) {
    return '$count canal(aux) liés à une géométrie inexistante.';
  }

  @override
  String get ma3CalcIssueManual => 'Valeur saisie à la main.';

  @override
  String ma3CalcMarginChip(int percent) {
    return '+$percent %';
  }

  @override
  String ma3CalcHwLine(String name, String value) {
    return '$name : $value';
  }

  @override
  String ma3CalcHowOnPcMax(String max) {
    return 'onPC : $max max. (avec n\'importe quel matériel onPC)';
  }

  @override
  String get accountSignInCta => 'Se connecter';

  @override
  String get accountSignInCtaSubtitle =>
      'Ton Pro et tes plugins, sur tous tes appareils ✨';

  @override
  String get accountAuthTitle => 'Ton compte ShowTech';

  @override
  String get accountAuthSubtitle =>
      'Connecte-toi pour retrouver ton abonnement Pro\net participer à la communauté.';

  @override
  String get accountSignedInSnack => 'Connecté ! Bienvenue à bord 🎉';

  @override
  String get accountSignedOutSnack => 'Déconnecté. À bientôt 👋';

  @override
  String get accountSignOutConfirmTitle => 'Se déconnecter ?';

  @override
  String get accountSignOutConfirmBody =>
      'Ton abonnement Pro reste lié à ton compte Google : reconnecte-toi quand tu veux pour le retrouver.';

  @override
  String get videoLmCalcDistTitle => 'Distance de projection (Ratio × Écran)';

  @override
  String get videoLmSizeModeLabel => 'Taille d\'écran connue';

  @override
  String get videoLmModeWidth => 'Largeur';

  @override
  String get videoLmModeHeight => 'Hauteur';

  @override
  String get videoLmModeDiagonal => 'Diagonale';

  @override
  String get videoLmImageHeightLabel => 'Hauteur d\'image (m)';

  @override
  String get videoLmImageHeightHint => 'ex: 3.375';

  @override
  String get videoLmDiagonalLabel => 'Diagonale (pouces)';

  @override
  String get videoLmDiagonalHint => 'ex: 200';

  @override
  String get videoLmRatioMinLabel => 'Ratio de projection (ou mini si zoom)';

  @override
  String get videoLmRatioMaxLabel => 'Ratio maxi (optionnel, zoom)';

  @override
  String get videoLmRatioMaxHint => 'ex: 2.10';

  @override
  String get videoLmErrMissingSizeRatio =>
      '❌ Données manquantes : Taille d\'écran + Ratio.';

  @override
  String get videoLmErrSizeGt0 => '❌ La taille d\'écran doit être > 0.';

  @override
  String videoLmResultImage(Object width, Object height, Object format) {
    return '📐 Image : $width × $height m ($format)';
  }

  @override
  String videoLmResultDistance(Object distance) {
    return '✅ Distance = $distance m';
  }

  @override
  String videoLmResultDistanceRange(Object min, Object max) {
    return '✅ Distance : de $min m à $max m';
  }

  @override
  String get videoLmDistanceNote =>
      'ℹ️ Distance mesurée depuis l\'objectif : vérifie la référence du fabricant (avant de l\'objectif ou du boîtier).';

  @override
  String get menuViewModeList => 'Affichage en lignes';

  @override
  String get menuViewModeGrid => 'Affichage en cases';

  @override
  String get audioRt60Subtitle => 'Temps de réverbération d\'une salle';

  @override
  String get audioSplMeterSubtitle =>
      'Mesure le niveau sonore avec le micro du téléphone';

  @override
  String get audioImpedanceSubtitle => 'Haut-parleurs en série ou en parallèle';

  @override
  String get audioCrossoverSubtitle => 'Fréquences de coupure et filtres';

  @override
  String get audioDelayTimeSubtitle => 'Temps de delay calé sur le tempo';

  @override
  String get audioNoiseDoseSubtitle => 'Exposition sonore et durée maximale';

  @override
  String get audioInputListSubtitle => 'Prépare et partage ta liste d\'entrées';

  @override
  String get networkPoeSubtitle => 'Budget de puissance PoE d\'un switch';

  @override
  String get networkFiberSubtitle => 'Pertes et marge d\'une liaison fibre';

  @override
  String get networkSubnetSubtitle => 'Masque, plage d\'adresses et broadcast';

  @override
  String get networkArtNetAddressingSubtitle =>
      'Univers DMX ↔ Net / Sub-Net / Univers';

  @override
  String get rdmPageSubtitle => 'Découverte et réglage des appareils RDM';

  @override
  String get rfSplitterSubtitle =>
      'Pertes d\'insertion des répartiteurs et combineurs';

  @override
  String get rfCableAntennaSubtitle => 'Pertes câble et gain d\'antenne';

  @override
  String get rfPlannerSubtitle => 'Plan de fréquences HF sans intermodulation';

  @override
  String get timecodeToolConverterSubtitle =>
      'Convertir un timecode d\'une cadence à l\'autre';

  @override
  String get timecodeToolMathSubtitle =>
      'Additionner, soustraire et décaler du timecode';

  @override
  String get timecodeToolDelaySubtitle => 'Convertir frames et millisecondes';

  @override
  String get timecodeToolCountdownSubtitle =>
      'Compte à rebours jusqu\'à un timecode';

  @override
  String get filterCorrespondenceSubtitle =>
      'Équivalences entre gammes de filtres';

  @override
  String get ma3CalcEditSheetTitle => 'MODIFIER CETTE MACHINE';

  @override
  String get ma3CalcActionChangeMode => 'Changer de mode';

  @override
  String get ma3CalcActionChangeModeSub =>
      'Garder la machine, choisir un autre mode DMX';

  @override
  String get ma3CalcActionChangeType => 'Changer de machine (GDTF)';

  @override
  String get ma3CalcActionChangeTypeSub =>
      'Remplacer ou ajouter le GDTF : GDTF Share ou fichier';

  @override
  String get ma3CalcActionManual => 'Saisir les paramètres à la main';

  @override
  String get ma3CalcActionManualSub => 'Forcer une valeur par machine';

  @override
  String get ma3CalcNeedGdtfFirst =>
      'Pas de GDTF pour cette machine : choisis-le d\'abord.';

  @override
  String get ma3CalcReplaceSheetTitle => 'Choisir la machine';

  @override
  String ma3CalcLineUpdated(Object label) {
    return '✅ $label mis à jour';
  }

  @override
  String get audioPickAmplifier => 'Choisir un amplificateur';

  @override
  String get audioPickSpeaker => 'Choisir une enceinte';

  @override
  String get audioSearchBrandModel => 'Rechercher une marque ou un modèle';

  @override
  String get audioCustomPreset => 'Personnalisé';

  @override
  String get audioCustomPresetHint => 'Saisir vos propres valeurs';

  @override
  String audioModelsCount(Object count) {
    return '$count modèles';
  }

  @override
  String get audioNoResults => 'Aucun résultat';

  @override
  String audioChannelsCount(Object count) {
    return '$count voies';
  }

  @override
  String audioRecommendedAmp(Object range) {
    return 'Ampli recommandé : $range';
  }

  @override
  String audioPowerHandling(Object watts) {
    return 'Tenue en puissance : $watts W';
  }

  @override
  String get audioNoPowerData =>
      'Tenue en puissance non publiée par le fabricant : seule l’impédance est vérifiée. Utilisez ses presets / contrôleurs.';

  @override
  String get audioActiveSection =>
      'Enceinte active : une voie d’ampli par section.';

  @override
  String audioStatusZTooLow(Object diff) {
    return '✗  Z trop basse (−$diff Ω)';
  }

  @override
  String audioStatusOkPct(Object pct) {
    return '✓  OK ($pct % RMS)';
  }

  @override
  String audioStatusUnderpowered(Object pct) {
    return '↓  Sous-alimenté ($pct % RMS)';
  }

  @override
  String audioStatusHeadroom(Object ratio) {
    return '✓  Marge ×$ratio';
  }

  @override
  String audioStatusOverpowered(Object ratio) {
    return '✗  Trop puissant ×$ratio';
  }

  @override
  String get audioStatusInRange => '✓  Dans la plage fabricant';

  @override
  String get audioStatusBelowRange => '↓  Sous la plage recommandée';

  @override
  String get audioStatusAboveRange => '⚠  Au-dessus de la plage';

  @override
  String get audioStatusZOkNoData => '✓  Z OK — P non publiée';

  @override
  String audioStatusLimiterRequired(Object ratio) {
    return '⚠  ×$ratio — limiteur indispensable';
  }

  @override
  String get catalogSearchHint => 'Rechercher une marque, un modèle, un type…';

  @override
  String get catalogSearchNoResults => 'Aucun résultat';

  @override
  String catalogSearchResultsCount(Object count) {
    return '$count résultats';
  }

  @override
  String get soundCatalogTitle => 'Catalogue son';

  @override
  String get soundCatalogSubtitle => 'Amplis et enceintes : specs et manuels';

  @override
  String get laserCatalogTitle => 'Catalogue laser';

  @override
  String get laserCatalogSubtitle =>
      'Projecteurs laser : puissance, faisceau, divergence';

  @override
  String get catalogAmplifiers => 'Amplis';

  @override
  String get catalogSpeakers => 'Enceintes';

  @override
  String get catalogUseValues => 'Utiliser';

  @override
  String get laserPickFromCatalog => 'Choisir dans le catalogue';

  @override
  String get laserCatalogDisclaimer =>
      'Valeurs annoncées par le fabricant, non mesurées.';

  @override
  String get laserCatalogMissingValues =>
      'Diamètre ou divergence non publiés pour ce laser : complétez à la main.';

  @override
  String get catalogFieldChannels => 'Voies';

  @override
  String get catalogFieldPowerPerChannel => 'Puissance par voie';

  @override
  String get catalogFieldType => 'Type';

  @override
  String get catalogFieldSection => 'Section';

  @override
  String get catalogFieldPowerHandling => 'Tenue en puissance (RMS/AES)';

  @override
  String get catalogFieldRecommendedAmp => 'Ampli recommandé';

  @override
  String get catalogFieldOpticalPower => 'Puissance optique';

  @override
  String get catalogFieldColors => 'Couleurs';

  @override
  String get catalogFieldScanner => 'Scanners';

  @override
  String get catalogFieldClass => 'Classe laser';

  @override
  String get catalogFieldConsumption => 'Consommation';

  @override
  String get homeSafetyTitle => 'Sécurité';

  @override
  String get homeSafetySubtitle => 'PPSPS, attestation de bon montage';

  @override
  String get subscriptionCategorySafetyTitle => 'Sécurité';

  @override
  String get subscriptionCategorySafetyDescription =>
      'PPSPS et plan de sécurité, attestation de bon montage avec photos, réserves et signature, export PDF.';

  @override
  String get subscriptionHeadlineSafetySubtitle =>
      'Rédigez vos plans de sécurité et vos attestations de bon montage sur le terrain, avec export PDF signé.';

  @override
  String get safetyPageTitle => 'Sécurité';

  @override
  String get safetySectionDocuments => 'Documents';

  @override
  String get safetyPpspsTitle => 'Plans de sécurité';

  @override
  String get safetyPpspsSubtitle =>
      'PPSPS (France), plan de sécurité (Belgique)';

  @override
  String get safetyAttestationTitle => 'Bon montage';

  @override
  String get safetyAttestationSubtitle => 'Contrôles, réserves et signature';

  @override
  String get safetyComingSoon => 'Disponible dans une prochaine version.';

  @override
  String get safetyLibraryTitle => 'Bibliothèque';

  @override
  String safetyLibrarySummary(Object risks, Object measures, Object controls) {
    return '$risks risques · $measures mesures · $controls points de contrôle';
  }

  @override
  String safetyLibraryUpdated(Object date) {
    return 'Mise à jour : $date';
  }

  @override
  String get safetyLibraryOffline => 'Copie locale, utilisable hors ligne';

  @override
  String get safetyDisclaimer =>
      'Outil d\'aide à la rédaction. Le contenu des documents reste sous la responsabilité de l\'entreprise signataire.';

  @override
  String get ppspsListTitle => 'Plans de sécurité';

  @override
  String get ppspsNew => 'Nouveau plan';

  @override
  String get ppspsEmptyTitle => 'Aucun plan pour l\'instant';

  @override
  String get ppspsEmptyBody =>
      'Créez votre premier plan de sécurité. Vous pourrez ensuite le dupliquer pour vos prochains événements.';

  @override
  String get ppspsChooseCountry => 'Pays du chantier';

  @override
  String get ppspsStatusDraft => 'Brouillon';

  @override
  String get ppspsStatusFinal => 'Finalisé';

  @override
  String ppspsStepProgress(Object done, Object total) {
    return 'Étape $done/$total';
  }

  @override
  String get ppspsUntitled => 'Sans titre';

  @override
  String get ppspsDuplicate => 'Dupliquer';

  @override
  String get ppspsDelete => 'Supprimer';

  @override
  String get ppspsDeleteConfirm =>
      'Supprimer ce plan ? Cette action est définitive.';

  @override
  String get ppspsCancel => 'Annuler';

  @override
  String get ppspsSave => 'Enregistrer';

  @override
  String get ppspsNext => 'Suivant';

  @override
  String get ppspsPrevious => 'Précédent';

  @override
  String get ppspsStepProject => 'Projet';

  @override
  String get ppspsStepWorkers => 'Intervenants';

  @override
  String get ppspsStepRisks => 'Risques';

  @override
  String get ppspsStepEmergency => 'Secours';

  @override
  String get ppspsStepExport => 'Export';

  @override
  String get ppspsFieldEventName => 'Nom de l\'événement';

  @override
  String get ppspsFieldVenue => 'Lieu';

  @override
  String get ppspsFieldAddress => 'Adresse';

  @override
  String get ppspsFieldOrganizer => 'Organisateur (maître d\'ouvrage)';

  @override
  String get ppspsFieldCoordinator => 'Coordinateur sécurité';

  @override
  String get ppspsSectionPhases => 'Phases et dates';

  @override
  String get ppspsPhaseMontage => 'Montage';

  @override
  String get ppspsPhaseExploitation => 'Exploitation';

  @override
  String get ppspsPhaseDemontage => 'Démontage';

  @override
  String get ppspsPhaseNotSet => 'Non prévu';

  @override
  String get ppspsPhaseFilterAll => 'Toutes';

  @override
  String get ppspsSectionCompany => 'Votre entreprise';

  @override
  String get ppspsFieldCompanyName => 'Raison sociale';

  @override
  String get ppspsFieldCompanyActivity => 'Activité sur le chantier';

  @override
  String get ppspsFieldResponsible => 'Responsable sur site';

  @override
  String get ppspsFieldPhone => 'Téléphone';

  @override
  String get ppspsFieldCompany => 'Entreprise';

  @override
  String get ppspsFieldTrade => 'Métier';

  @override
  String get ppspsFieldContact => 'Contact';

  @override
  String get ppspsFieldHeadcount => 'Effectif';

  @override
  String get ppspsAddWorker => 'Ajouter un intervenant';

  @override
  String get ppspsWorkersEmpty =>
      'Ajoutez les entreprises et les équipes présentes sur le chantier.';

  @override
  String ppspsWorkersTotal(Object count) {
    return 'Effectif total : $count personnes';
  }

  @override
  String get ppspsMeasuresTitle => 'Mesures de prévention';

  @override
  String get ppspsMeasureCollective => 'Collective';

  @override
  String get ppspsMeasureIndividual => 'Individuelle';

  @override
  String get ppspsMeasureOrganisational => 'Organisationnelle';

  @override
  String ppspsMeasureCount(Object count) {
    return '$count mesures';
  }

  @override
  String get ppspsAddCustomMeasure => 'Ajouter une mesure';

  @override
  String get ppspsCustomMeasureHint => 'Autre mesure propre à ce chantier';

  @override
  String ppspsRisksSummary(Object risks, Object measures) {
    return '$risks risques · $measures mesures';
  }

  @override
  String get ppspsSectionNumbers => 'Numéros d\'urgence';

  @override
  String get ppspsSectionHospital => 'Hôpital le plus proche';

  @override
  String get ppspsFieldHospitalName => 'Nom de l\'hôpital';

  @override
  String get ppspsSectionOnSite => 'Sur le site';

  @override
  String get ppspsFieldFirstAiders => 'Secouristes présents';

  @override
  String get ppspsFieldAssemblyPoint => 'Point de rassemblement';

  @override
  String get ppspsFieldEquipment =>
      'Matériel de secours (extincteurs, défibrillateur…)';

  @override
  String get ppspsCritical => 'critiques';

  @override
  String get ppspsMedium => 'moyens';

  @override
  String get ppspsLow => 'faibles';

  @override
  String get ppspsExportReady => 'Toutes les étapes sont complétées.';

  @override
  String get ppspsExportMissing => 'À compléter';

  @override
  String get ppspsExportPdf => 'Exporter en PDF';

  @override
  String get ppspsMarkFinal => 'Marquer comme finalisé';

  @override
  String get safetyCountryFR => 'France';

  @override
  String get safetyCountryBE => 'Belgique';

  @override
  String get safetyCountryUK => 'Royaume-Uni';

  @override
  String get safetyCountryLU => 'Luxembourg';

  @override
  String get safetyCountryDE => 'Allemagne';

  @override
  String get safetyCountryNL => 'Pays-Bas';

  @override
  String get ppspsExportLanguages => 'Langues du document';

  @override
  String get ppspsExportLanguagesHint =>
      'Un PDF est créé pour chaque langue cochée.';

  @override
  String ppspsExportPdfMulti(Object count) {
    return 'Exporter $count PDF';
  }

  @override
  String get ppspsPhaseOrderError =>
      'Les dates ne se suivent pas : le montage doit précéder l\'exploitation, puis le démontage.';

  @override
  String get ppspsFindHospital => 'Trouver l\'hôpital le plus proche';

  @override
  String get ppspsFindHospitalSearching => 'Recherche en cours…';

  @override
  String get ppspsFindHospitalNeedAddress =>
      'Renseignez d\'abord le lieu ou l\'adresse de l\'événement (étape Projet).';

  @override
  String get ppspsFindHospitalNoPlace =>
      'Adresse de l\'événement introuvable. Vérifiez-la dans l\'étape Projet, ou complétez l\'hôpital à la main.';

  @override
  String get ppspsFindHospitalError =>
      'Recherche impossible pour le moment (connexion ?). Complétez l\'hôpital à la main.';

  @override
  String get ppspsFindHospitalNone =>
      'Aucun hôpital trouvé à moins de 30 km. Complétez à la main.';

  @override
  String get ppspsFindHospitalTitle => 'Hôpitaux à proximité';

  @override
  String get ppspsFindHospitalVerify =>
      'Vérifiez que l\'hôpital choisi a un service d\'urgences ouvert pendant l\'événement.';

  @override
  String ppspsDistanceKm(Object km) {
    return '$km km';
  }

  @override
  String get ppspsHospitalEmergency => 'Urgences';

  @override
  String get ppspsOsmAttribution => 'Données © contributeurs OpenStreetMap';

  @override
  String get ppspsSectionEquipment => 'Matériel de secours';

  @override
  String get ppspsFieldEquipmentDetails =>
      'Précisions (emplacements, quantités, autre matériel)';

  @override
  String get ppspsSectionSignatures => 'Signatures';

  @override
  String get ppspsSignAuthor => 'Établi par';

  @override
  String get ppspsSignCoordinator => 'Visa du coordinateur (facultatif)';

  @override
  String get ppspsNotSigned => 'Pas encore signé';

  @override
  String ppspsSignedOn(Object date) {
    return 'Signé le $date';
  }

  @override
  String get ppspsSignButton => 'Signer';

  @override
  String get ppspsSignAgain => 'Refaire';

  @override
  String get ppspsSignRemove => 'Retirer la signature';

  @override
  String get ppspsSignName => 'Nom du signataire';

  @override
  String get ppspsSignHint => 'Signez avec le doigt dans le cadre blanc.';

  @override
  String get ppspsSignClear => 'Effacer';

  @override
  String get ppspsSignValidate => 'Valider la signature';

  @override
  String get electricityToolPowerPlanTitle => 'Plan électrique';

  @override
  String get electricityToolPowerPlanSubtitle =>
      'Construis ta distribution case par case : source, tableaux, câbles, charges. Synoptique et tableau de charge en un clic.';

  @override
  String get ppPageTitle => 'Plan électrique';

  @override
  String get ppTabPlan => 'Plan';

  @override
  String get ppTabSynoptic => 'Synoptique';

  @override
  String get ppTabLoadTable => 'Tableau de charge';

  @override
  String get ppDefaultPlanName => 'Mon plan électrique';

  @override
  String get ppStartTitle => 'Commence par la source ⚡';

  @override
  String get ppStartSubtitle =>
      'Groupe électrogène, raccordement réseau ou prise existante. Ensuite, chaque sortie libre devient une case + où brancher un tableau ou un équipement.';

  @override
  String get ppSourceSheetTitle => 'Source d\'alimentation';

  @override
  String get ppSourceGenerator => 'Groupe électrogène';

  @override
  String get ppSourceMains => 'Réseau / compteur';

  @override
  String get ppSourceOutlet => 'Prise existante';

  @override
  String get ppGeneratorSizeLabel => 'Puissance du groupe';

  @override
  String get ppMainsSizeLabel => 'Calibre du raccordement';

  @override
  String get ppOutletTypeLabel => 'Type de prise';

  @override
  String ppSourceCapacity(String amps, String kva) {
    return 'Disponible : $amps A par phase · $kva kVA';
  }

  @override
  String get ppPhaseWord => 'phase';

  @override
  String get ppNameLabel => 'Nom';

  @override
  String get ppValidate => 'C\'est parti !';

  @override
  String get ppSave => 'Enregistrer';

  @override
  String get ppDone => 'Terminé';

  @override
  String get ppDelete => 'Supprimer';

  @override
  String get ppEdit => 'Modifier';

  @override
  String get ppCopy => 'Copier';

  @override
  String get ppRename => 'Renommer';

  @override
  String get ppDuplicate => 'Dupliquer';

  @override
  String get ppUnplug => 'Débrancher';

  @override
  String get ppExpand => 'Déplier';

  @override
  String get ppCollapse => 'Replier';

  @override
  String ppCollapsedHint(String count) {
    return '▸ Afficher les $count départs';
  }

  @override
  String ppCopied(String name) {
    return '📋 « $name » copié : colle-le sur une case + libre';
  }

  @override
  String get ppConnectHere => 'Brancher quelque chose ici';

  @override
  String ppConnectTitle(String connector) {
    return 'Brancher sur $connector';
  }

  @override
  String get ppConnectPanel => 'Un tableau';

  @override
  String get ppConnectPanelSubtitle =>
      'Distro, armoire, multiprise… avec ses propres départs';

  @override
  String get ppConnectLoad => 'Un équipement';

  @override
  String get ppConnectLoadSubtitle =>
      'Lumière, son, écran LED, toilettes, catering, bureaux… tu saisis la puissance';

  @override
  String ppPasteTitle(String name) {
    return 'Coller « $name »';
  }

  @override
  String get ppPasteSubtitle =>
      'Une copie complète, avec tout ce qui est branché dessous';

  @override
  String get ppTemplateSheetTitle => 'Choisis un tableau';

  @override
  String get ppTemplateStrip => 'Multiprise 6× Schuko';

  @override
  String get ppTemplateCustomTri => 'Tableau personnalisé (tri)';

  @override
  String get ppTemplateCustomMono => 'Tableau personnalisé (mono)';

  @override
  String get ppTemplateCustomSubtitle =>
      'Vide : tu ajoutes toi-même les départs';

  @override
  String get ppCompatOk => '✓ Direct';

  @override
  String get ppCompatAdapter => 'Adaptateur';

  @override
  String get ppLoadSheetTitle => 'Brancher un équipement';

  @override
  String get ppLoadEditTitle => 'Modifier l\'équipement';

  @override
  String get ppCategoryLabel => 'Catégorie';

  @override
  String get ppLoadNameHint => 'ex. Écran LED scène, Toilettes VIP…';

  @override
  String get ppPowerLabel => 'Puissance';

  @override
  String get ppCosPhiLabel => 'Facteur de puissance';

  @override
  String get ppConnectAction => 'Brancher';

  @override
  String ppLoadPreviewTri(String amps) {
    return '≈ $amps A par phase (réparti sur L1, L2, L3)';
  }

  @override
  String ppLoadPreviewMono(String amps) {
    return '≈ $amps A sur une phase';
  }

  @override
  String get ppCatLighting => 'Lumière';

  @override
  String get ppCatSound => 'Son';

  @override
  String get ppCatVideo => 'Vidéo / LED';

  @override
  String get ppCatStage => 'Machinerie / moteurs';

  @override
  String get ppCatCatering => 'Catering / bars';

  @override
  String get ppCatToilets => 'Sanitaires';

  @override
  String get ppCatProduction => 'Production / bureaux';

  @override
  String get ppCatHvac => 'Clim / chauffage';

  @override
  String get ppCatOther => 'Autre';

  @override
  String get ppOutputSheetTitle => 'Départ et câble';

  @override
  String get ppConnectorLabel => 'Prise';

  @override
  String get ppBreakerLabel => 'Protection (disjoncteur)';

  @override
  String get ppRcdLabel => 'Différentiel 30 mA';

  @override
  String get ppPhaseLabel => 'Phase';

  @override
  String get ppPhaseInherited => 'Imposée par le tableau mono en amont';

  @override
  String get ppCableLabel => 'Câble';

  @override
  String get ppCableLengthLabel => 'Longueur';

  @override
  String ppAmpacityShort(String amps) {
    return '$amps A admissibles (H07RN-F, indicatif)';
  }

  @override
  String get ppPanelSheetTitle => 'Tableau';

  @override
  String get ppPanelInputLabel => 'Entrée';

  @override
  String get ppMainBreakerLabel => 'Protection générale';

  @override
  String ppOutputsLabel(String count) {
    return 'Départs ($count)';
  }

  @override
  String ppOutputsUsed(String used, String total) {
    return '$used/$total départs utilisés';
  }

  @override
  String get ppFreeOutput => 'libre';

  @override
  String get ppAddOutputHint => 'Ajouter un départ :';

  @override
  String get ppAddOutput => 'Ajouter un départ';

  @override
  String get ppAddSourceOutput => 'Ajouter une sortie à la source';

  @override
  String get ppAutoPhases => 'Répartir L1 / L2 / L3 automatiquement';

  @override
  String get ppDeleteSourceTitle => 'Supprimer la source ?';

  @override
  String get ppDeleteSourceBody => 'Tout le plan branché dessous sera effacé.';

  @override
  String get ppDeleteOutputTitle => 'Supprimer ce départ ?';

  @override
  String ppDeleteOutputBody(String name) {
    return '« $name » et tout ce qui est branché dessous seront retirés.';
  }

  @override
  String get ppDeletePanelTitle => 'Débrancher ce tableau ?';

  @override
  String ppDeletePanelBody(String name) {
    return '« $name » et tout ce qui est branché dessus seront retirés du plan.';
  }

  @override
  String get ppDeletePlanTitle => 'Supprimer ce plan ?';

  @override
  String ppDeletePlanBody(String name) {
    return '« $name » sera définitivement supprimé.';
  }

  @override
  String get ppProjectsTitle => 'Mes plans';

  @override
  String get ppNewPlan => 'Nouveau plan';

  @override
  String get ppRenamePlan => 'Renommer le plan';

  @override
  String ppPlanSummary(String panels, String kw) {
    return '$panels tableau(x) · $kw kW';
  }

  @override
  String get ppKpiPower => 'Puissance';

  @override
  String get ppKpiApparent => 'Puissance apparente';

  @override
  String get ppKpiMaxPhase => 'Phase la + chargée';

  @override
  String get ppKpiSourceUse => 'Source utilisée';

  @override
  String get ppKpiWorstDrop => 'Chute de tension max';

  @override
  String get ppKpiGenerator => 'Groupe conseillé';

  @override
  String ppGeneratorOk(String kva) {
    return '👍 Ton groupe tient la route (minimum conseillé : $kva kVA avec 20 % de marge)';
  }

  @override
  String ppGeneratorTooSmall(String kva) {
    return '🚨 Prévois plutôt un groupe de $kva kVA (phase la plus chargée + 20 % de marge)';
  }

  @override
  String get ppAllGood => 'Tout est au vert, beau boulot ! 🎉';

  @override
  String ppAllGoodWithTips(String count) {
    return 'Tout est au vert 🎉 · $count conseil(s)';
  }

  @override
  String ppAlertsCount(String errors, String warnings) {
    return '$errors erreur(s) · $warnings point(s) à vérifier';
  }

  @override
  String get ppAlertsTitle => 'Points d\'attention';

  @override
  String get ppAllGoodPdf => 'Aucun point d\'attention.';

  @override
  String get ppAlertNoSource => 'Ajoute d\'abord une source d\'alimentation.';

  @override
  String ppAlertSourceOverload(String amps, String limit) {
    return 'Source en surcharge : $amps A pour $limit A disponibles';
  }

  @override
  String ppAlertNearLimit(String percent, String amps, String limit) {
    return 'Chargé à $percent % ($amps / $limit A)';
  }

  @override
  String ppAlertPanelOverload(String amps, String limit) {
    return 'Tableau en surcharge : $amps A sur un $limit A';
  }

  @override
  String ppAlertOutputOverload(String amps, String limit) {
    return 'Départ en surcharge : $amps A sur une protection de $limit A';
  }

  @override
  String ppAlertCableUndersized(String cable, String amps, String limit) {
    return 'Câble $cable ($amps A max) protégé en $limit A : augmente la section';
  }

  @override
  String ppAlertVoltageDrop(String percent, String limit) {
    return 'Chute de tension cumulée de $percent % (plus de $limit %)';
  }

  @override
  String ppAlertImbalance(String percent) {
    return 'Phases déséquilibrées ($percent %) : répartis mieux les charges mono';
  }

  @override
  String ppAlertAdapter(String adapter) {
    return 'Adaptateur nécessaire : $adapter';
  }

  @override
  String get ppCategoriesTitle => 'Répartition par usage';

  @override
  String get ppSynopticSubtitle => 'Synoptique de distribution';

  @override
  String get ppSynopticHint => '🤏 Pince pour zoomer, glisse pour te déplacer';

  @override
  String get ppEmptyTab =>
      'Rien à afficher pour l\'instant : construis d\'abord ton plan dans l\'onglet Plan.';

  @override
  String get ppGoToPlan => 'Aller au plan';

  @override
  String get ppExportTitle => 'Exporter';

  @override
  String get ppExportPdf => 'PDF complet';

  @override
  String get ppExportPdfSubtitle =>
      'Synoptique + tableau de charge + points d\'attention';

  @override
  String get ppExportCsv => 'Tableau CSV';

  @override
  String get ppExportCsvSubtitle => 'Pour Excel, Numbers ou Google Sheets';

  @override
  String get ppExportPng => 'Image du synoptique';

  @override
  String get ppExportPngSubtitle => 'PNG haute définition, fond blanc';

  @override
  String get ppExportError => 'Oups, l\'export a échoué 😕';

  @override
  String get ppPdfTitle => 'Plan de distribution électrique';

  @override
  String get ppPdfGenerated => 'Généré avec ShowTech Tools';

  @override
  String get ppColPanel => 'Tableau';

  @override
  String get ppColOutput => 'Départ';

  @override
  String get ppColConnector => 'Prise';

  @override
  String get ppColBreaker => 'Protection';

  @override
  String get ppColPhase => 'Phase';

  @override
  String get ppColLength => 'Longueur (m)';

  @override
  String get ppColCable => 'Câble';

  @override
  String get ppColConnected => 'Branché';

  @override
  String get ppColCategory => 'Usage';

  @override
  String get ppColPower => 'kW';

  @override
  String get ppColCurrent => 'I (A)';

  @override
  String get ppColDrop => 'ΔU (%)';

  @override
  String get ppDisclaimer =>
      'Calculs indicatifs (230/400 V, câbles H07RN-F cuivre à l\'air libre, chute de tension max 5 %). Ce plan aide à préparer une installation : il doit être validé par une personne qualifiée selon les normes locales.';

  @override
  String get attestationListTitle => 'Attestations de bon montage';

  @override
  String get attestationNew => 'Nouvelle attestation';

  @override
  String get attestationNewTitle => 'Nouvelle attestation';

  @override
  String get attestationNewBlank => 'Attestation vierge';

  @override
  String get attestationNewFromPlan =>
      'Ou à partir d\'un plan de sécurité (reprend l\'événement et l\'entreprise) :';

  @override
  String get attestationEmptyTitle => 'Aucune attestation pour l\'instant';

  @override
  String get attestationEmptyBody =>
      'Après le montage, contrôlez chaque élément, notez les réserves et signez l\'attestation sur place.';

  @override
  String get attestationDeleteConfirm =>
      'Supprimer cette attestation et ses photos ? Cette action est définitive.';

  @override
  String get attestationStatusSigned => 'Signée';

  @override
  String get attestationStatusReserve => 'Signée avec réserve';

  @override
  String attestationElementCount(Object count) {
    return '$count éléments';
  }

  @override
  String get attestationSignatureCleared =>
      'Contenu modifié : la signature a été retirée, signez à nouveau.';

  @override
  String get attestationFieldCompany => 'Entreprise qui a monté';

  @override
  String get attestationElementName => 'Nom de l\'élément (ex. Pont avant)';

  @override
  String get attestationElementDesc =>
      'Description (ex. Structure 40×40, 12 m, 4 palans 1 t)';

  @override
  String get attestationElementFamilies => 'Contrôles à effectuer';

  @override
  String get attestationAppliedLoad => 'Charge appliquée (kg)';

  @override
  String get attestationRatedLoad => 'Charge admissible (kg)';

  @override
  String get attestationDeleteElementConfirm =>
      'Supprimer cet élément, ses contrôles et ses photos ?';

  @override
  String attestationLoadSummary(Object applied, Object rated) {
    return 'Charge : $applied kg / $rated kg admissibles';
  }

  @override
  String get attestationOverload => 'Charge supérieure à la charge admissible';

  @override
  String get attestationElementsEmpty =>
      'Ajoutez les éléments montés : ponts, grill, tours, palans, scène, écrans…';

  @override
  String get attestationAddElement => 'Ajouter un élément';

  @override
  String get attestationTakePhoto => 'Prendre une photo';

  @override
  String get attestationPickPhoto => 'Choisir dans la galerie';

  @override
  String get attestationPhotoError =>
      'Impossible d\'ajouter la photo. Vérifiez l\'accès à l\'appareil photo dans les réglages.';

  @override
  String get attestationOk => 'OK';

  @override
  String get attestationNc => 'NC';

  @override
  String get attestationNa => 'S.O.';

  @override
  String get attestationReserveLabel =>
      'Réserve : constat et action prévue (obligatoire)';

  @override
  String get attestationPhotoRequired => 'Photo recommandée pour ce point';

  @override
  String get attestationNoElements =>
      'Aucun élément à contrôler : ajoutez-les à l\'étape Éléments.';

  @override
  String get attestationReservesMissing =>
      'Chaque point non conforme doit avoir une réserve écrite avant la signature.';

  @override
  String get attestationSignTitle => 'Signature de l\'attestation';

  @override
  String attestationUnanswered(Object count) {
    return '$count points de contrôle sans réponse';
  }

  @override
  String attestationReservesMissingCount(Object count) {
    return '$count non-conformités sans réserve écrite (signature bloquée)';
  }

  @override
  String attestationPhotosMissing(Object count) {
    return '$count photos recommandées manquantes';
  }

  @override
  String get attestationStatElements => 'éléments';

  @override
  String get attestationStatReserves => 'réserves';

  @override
  String get attestationStatPhotos => 'photos';

  @override
  String attestationStatement(Object name) {
    return 'Je soussigné(e), $name, atteste que les installations listées ont été montées conformément aux notices des fabricants et aux règles de l\'art, et qu\'elles ont été vérifiées avant l\'accueil du public.';
  }

  @override
  String attestationStatementReserve(Object name) {
    return 'Je soussigné(e), $name, atteste que les installations listées ont été montées conformément aux notices des fabricants et aux règles de l\'art, et qu\'elles ont été vérifiées avant l\'accueil du public, sous réserve des points ci-dessous.';
  }

  @override
  String get attestationReserve => 'Réserve';

  @override
  String get attestationReserveEmpty => 'Réserve à écrire (étape Contrôles)';

  @override
  String get attestationSignerSection => 'Signataire';

  @override
  String get attestationSignerRole =>
      'Fonction (ex. chef rigger, régisseur général)';

  @override
  String get attestationSign => 'Signer l\'attestation';

  @override
  String get attestationSignWithReserve => 'Signer avec réserve';

  @override
  String get attestationStepInfo => 'Infos';

  @override
  String get attestationStepElements => 'Éléments';

  @override
  String get attestationStepControls => 'Contrôles';

  @override
  String get attestationStepSignature => 'Signature';

  @override
  String get attestationNextElement => 'Élément suivant';

  @override
  String get attestationDeletePhotoConfirm => 'Supprimer cette photo ?';

  @override
  String get hospitalSearchPlaceTitle => 'Où se passe l\'événement ?';

  @override
  String get hospitalSearchPlaceHelp =>
      'Nom de la salle, adresse, ville ou code postal : même approximatif, on s\'en occupe.';

  @override
  String get hospitalSearchPlaceHint => 'ex. Forest National, Bruxelles';

  @override
  String get hospitalSearchButton => 'Rechercher';

  @override
  String get hospitalSearchPlaceChoose =>
      'Plusieurs lieux correspondent, lequel est le bon ?';

  @override
  String get hospitalSearchNoPlace =>
      'Aucun lieu trouvé. Essayez plus court : juste la ville, le code postal ou le nom de la salle.';

  @override
  String hospitalSearchAround(Object place) {
    return 'Autour de $place';
  }

  @override
  String get hospitalSearchChangePlace => 'Changer';

  @override
  String hospitalSearchNoneRadius(Object km) {
    return 'Aucun hôpital trouvé à moins de $km km de ce lieu. Complétez à la main.';
  }

  @override
  String get ppspsRatingTitle => 'Cotation du risque';

  @override
  String get ppspsSeverity => 'Gravité';

  @override
  String get ppspsProbability => 'Probabilité';

  @override
  String ppspsRatingLibraryValue(Object severity, Object probability) {
    return 'Ajusté pour ce plan. Valeur de la bibliothèque : gravité $severity × probabilité $probability.';
  }

  @override
  String get ppspsRatingNoteHint =>
      'Motif (ex. montage en salle, pas d\'exposition au vent)';

  @override
  String get ppspsRatingReset => 'Revenir à la valeur de la bibliothèque';

  @override
  String get ppspsLevelHigh => 'Risque élevé';

  @override
  String get ppspsLevelMedium => 'Risque moyen';

  @override
  String get ppspsLevelLow => 'Risque faible';

  @override
  String get ppspsLevelHighRule =>
      'cote de 12 à 16, ou gravité 4 quelle que soit la probabilité';

  @override
  String get ppspsLevelMediumRule => 'cote de 6 à 11';

  @override
  String get ppspsLevelLowRule => 'cote de 1 à 5';

  @override
  String get ppspsRatingHelpTitle => 'Comment les risques sont cotés';

  @override
  String get ppspsRatingHelpShort => 'Cotation';

  @override
  String get ppspsRatingHelpIntro =>
      'Chaque risque reçoit une gravité de 1 à 4 et une probabilité de 1 à 4. La cote est leur produit, de 1 à 16.';

  @override
  String get ppspsRatingHelpAdjust =>
      'Les valeurs proposées sont celles de la bibliothèque pour un événement type. Ajustez-les pour votre chantier en touchant un risque ; le motif apparaît dans le PDF.';

  @override
  String get netLimitsTitle =>
      'Rien ne s\'affiche ? Ce n\'est pas forcément l\'app';

  @override
  String get netLimitsIntro =>
      'ShowTech Tools écoute le réseau sans rien envoyer. Ce qu\'il peut recevoir dépend du système de l\'appareil et de la configuration du réseau :';

  @override
  String get netLimitsManetMa3Only =>
      'Seuls les équipements grandMA3 (MA-Net3) sont détectés. Les grandMA2 (MA-Net2) ne sont pas pris en charge.';

  @override
  String get netLimitsIosEntitlement =>
      'iOS : Apple soumet la réception du multicast et du broadcast à une autorisation spéciale. Sans elle, seul le trafic envoyé directement (unicast) à cet iPhone ou iPad est reçu. C\'est une limite d\'iOS, pas de l\'app.';

  @override
  String get netLimitsIosLocalNetwork =>
      'iOS : vérifiez que l\'accès est autorisé dans Réglages › Confidentialité et sécurité › Réseau local › ShowTech Tools.';

  @override
  String get netLimitsArtnetUnicast =>
      'grandMA3 envoie l\'Art-Net en unicast vers ses nodes par défaut. Ajoutez l\'IP de cet appareil en destination dans la console, ou passez l\'univers en broadcast.';

  @override
  String get netLimitsArtnetSubnet =>
      'Le broadcast Art-Net n\'est reçu que si cet appareil est dans le même sous-réseau que la source (ex. 2.x.x.x / 255.0.0.0).';

  @override
  String get netLimitsSameNetwork =>
      'Réseau : l\'appareil doit être sur le même réseau / VLAN que les consoles (même groupe Luminex ou port de switch). Le multicast ne traverse pas un routeur.';

  @override
  String get netLimitsWifiAp =>
      'Wi-Fi : la borne doit être en mode point d\'accès (pas en mode routeur), sans isolation des clients ni filtrage multicast / broadcast.';

  @override
  String netLimitsDeviceIp(String ip) {
    return 'IP de cet appareil : $ip';
  }

  @override
  String get netLimitsNoIp => 'Aucune adresse IP locale détectée';

  @override
  String get manetSession => 'Session';

  @override
  String get pingCardTitle => 'Ping';

  @override
  String get pingCardSubtitle => 'Un appareil répond-il ?';

  @override
  String get pingTitle => 'Ping';

  @override
  String get pingHostLabel => 'Adresse IP ou nom';

  @override
  String get pingHostInvalid => 'Adresse introuvable';

  @override
  String get pingCountContinuous => 'Continu';

  @override
  String get pingStart => 'Ping !';

  @override
  String get pingStop => 'Stop';

  @override
  String get pingSent => 'Envoyés';

  @override
  String get pingReceived => 'Reçus';

  @override
  String get pingLoss => 'Pertes';

  @override
  String get pingMin => 'Min ms';

  @override
  String get pingAvg => 'Moy. ms';

  @override
  String get pingMax => 'Max ms';

  @override
  String get pingTimeout => 'Pas de réponse';

  @override
  String get pingIdle => 'Tapez une adresse et lancez le ping 🚀';

  @override
  String get pingVerdictGood => 'Ça répond au quart de tour 👌';

  @override
  String get pingVerdictOk => 'Ça répond, mais la latence est un peu élevée';

  @override
  String get pingVerdictLossy =>
      'Des paquets se perdent : vérifiez le câble ou le Wi-Fi';

  @override
  String get pingVerdictDown =>
      'Aucune réponse : appareil éteint, autre plage IP ou ping bloqué';

  @override
  String get pingNote =>
      'Certains appareils ne répondent pas au ping (pare-feu). Pas de réponse ne veut pas toujours dire hors ligne.';

  @override
  String get myIpCardTitle => 'Mon IP';

  @override
  String get myIpCardSubtitle => 'IP du téléphone & assistant IP fixe';

  @override
  String get myIpTitle => 'Mon IP';

  @override
  String get myIpRefresh => 'Actualiser';

  @override
  String get myIpCurrentTitle => 'Cet appareil';

  @override
  String get myIpNotConnected => 'Pas connecté au Wi-Fi';

  @override
  String get myIpMask => 'Masque';

  @override
  String get myIpGateway => 'Passerelle';

  @override
  String get myIpInterfaces => 'Toutes les interfaces';

  @override
  String get myIpSameRange => 'Déjà dans la bonne plage IP ✅';

  @override
  String get myIpOtherRange => 'Pas dans la même plage IP que cet appareil';

  @override
  String get myIpSystemLimit =>
      'iOS et Android n\'autorisent aucune app à changer l\'adresse IP du téléphone. Ce n\'est pas une limite de ShowTech Tools : l\'IP se règle dans les réglages Wi-Fi. L\'assistant ci-dessous vous donne les valeurs exactes à saisir.';

  @override
  String get myIpAssistantTitle => 'Assistant IP fixe';

  @override
  String get myIpTargetLabel => 'IP d\'un appareil du réseau (ex. la console)';

  @override
  String get myIpMaskLabel => 'Masque du réseau';

  @override
  String get myIpFindFree => 'Trouver une IP libre';

  @override
  String get myIpSearching => 'Recherche d\'une IP libre…';

  @override
  String get myIpPingTarget => 'Pinger cet appareil';

  @override
  String get myIpNoFree =>
      'Aucune IP libre trouvée parmi les essais. Choisissez-en une à la main.';

  @override
  String get myIpValuesTitle => 'Valeurs à saisir';

  @override
  String get myIpValueIp => 'Adresse IP';

  @override
  String get myIpValueMask => 'Masque de sous-réseau';

  @override
  String get myIpValuePrefix => 'Longueur du préfixe réseau';

  @override
  String get myIpValueRouter => 'Routeur / passerelle';

  @override
  String get myIpRouterEmpty => 'Laisser vide';

  @override
  String myIpRouterHint(String ip) {
    return 'Si le champ est obligatoire : $ip';
  }

  @override
  String get myIpFreeNote =>
      'Cette adresse ne répond pas au ping, elle semble libre. En cas de doute, validez-la avec le responsable réseau.';

  @override
  String get myIpCopied => 'Copié';

  @override
  String get myIpOpenWifi => 'Ouvrir les réglages Wi-Fi';

  @override
  String get myIpStepsTitle => 'Comment faire';

  @override
  String get myIpStepsIos =>
      'Ouvrez Réglages › Wi-Fi\nTouchez (i) à côté du réseau\nConfigurer l\'IP › Manuelle\nSaisissez l\'adresse IP et le masque, laissez Routeur vide\nTouchez Enregistrer';

  @override
  String get myIpStepsAndroid =>
      'Ouvrez Paramètres › Wi-Fi\nTouchez la roue dentée du réseau (ou appui long › Modifier)\nOptions avancées › Paramètres IP : Statique\nSaisissez l\'adresse IP et la longueur du préfixe\nEnregistrez (les menus varient selon la marque)';

  @override
  String get myIpBackToDhcp =>
      'Après le show, repassez ce Wi-Fi en automatique (DHCP) pour retrouver Internet.';

  @override
  String get audioSectionPassive => 'Passif';

  @override
  String get audioPickSection => 'Section (une voie d\'ampli chacune)';

  @override
  String get luminexSectionGroupTraffic => 'Trafic par groupe';

  @override
  String get luminexGroupTrafficHint =>
      'Somme des ports d\'accès de tous les switches, liens ISL exclus. Émis : envoyé par les appareils. Reçu : délivré aux appareils.';

  @override
  String get luminexTrafficSent => 'Émis';

  @override
  String get luminexTrafficReceived => 'Reçu';

  @override
  String luminexGroupActivePorts(int active, int total) {
    return '$active ports actifs sur $total';
  }

  @override
  String get luminexAlarmFanFault => 'Défaut de ventilateur';

  @override
  String luminexAlarmDeviceNotice(String text) {
    return 'Switch : $text';
  }

  @override
  String get luminexSectionMulticast => 'Abonnements multicast';

  @override
  String get luminexMulticastHint =>
      'Groupes multicast rejoints (IGMP), relevés sur les switches : qui écoute quel univers sACN ou quelle session MA-Net, dans chaque VLAN.';

  @override
  String luminexMulticastSummary(int groups, int listeners) {
    return 'Groupes : $groups · abonnés : $listeners';
  }

  @override
  String luminexMulticastListeners(int count) {
    return 'Abonnés : $count';
  }

  @override
  String luminexMulticastUniverse(int universe) {
    return 'Univers $universe';
  }

  @override
  String luminexMulticastSacnUniverses(String list) {
    return 'Univers sACN : $list';
  }

  @override
  String get luminexMulticastSacnDiscovery => 'Découverte sACN';

  @override
  String get luminexMulticastManetAdmin => 'MA-Net3 · administration';

  @override
  String get luminexMulticastManetSession => 'MA-Net3 · session';

  @override
  String get luminexMulticastViaIsl => 'Vu via un lien ISL';

  @override
  String luminexMulticastPort(int port) {
    return 'port $port';
  }

  @override
  String get luminexCfgMode => 'Mode configuration';

  @override
  String get luminexCfgModeBanner =>
      'Mode configuration actif : chaque action modifie le switch tout de suite. Touche un port pour le modifier.';

  @override
  String get luminexCfgIdentifySwitch => 'Faire clignoter le switch';

  @override
  String get luminexCfgIdentifyPort => 'Faire clignoter la LED du port';

  @override
  String get luminexCfgRenameSwitch => 'Renommer le switch';

  @override
  String get luminexCfgRenamePort => 'Renommer le port';

  @override
  String get luminexCfgChangeGroup => 'Changer de groupe';

  @override
  String get luminexCfgDisablePort => 'Désactiver le port';

  @override
  String get luminexCfgEnablePort => 'Activer le port';

  @override
  String get luminexCfgPoeOff => 'Couper le PoE';

  @override
  String get luminexCfgPoeOn => 'Rétablir le PoE';

  @override
  String get luminexCfgPoeCycle => 'Redémarrer l\'appareil (PoE)';

  @override
  String luminexCfgPortTitle(int port) {
    return 'Port $port';
  }

  @override
  String get luminexCfgConfirmTitle => 'Confirmer la modification';

  @override
  String get luminexCfgApply => 'Appliquer';

  @override
  String get luminexCfgCancel => 'Annuler';

  @override
  String get luminexCfgUndo => 'Annuler';

  @override
  String get luminexCfgActiveWarning =>
      'Ce port est actif : l\'appareil branché perdra la communication.';

  @override
  String get luminexCfgTrunkLocked =>
      'Port ISL : groupe et activation verrouillés pour protéger le réseau.';

  @override
  String get luminexCfgDone => 'Modification appliquée';

  @override
  String get luminexCfgUndone => 'Modification annulée';

  @override
  String luminexCfgFailed(String reason) {
    return 'Échec : $reason';
  }

  @override
  String get luminexCfgErrUnreachable => 'switch injoignable';

  @override
  String get luminexCfgErrUnauthorized => 'le switch demande un mot de passe';

  @override
  String get luminexCfgErrRejected => 'refusé par le switch';

  @override
  String get luminexCfgErrNotApplied =>
      'le switch n\'a pas pris la modification';

  @override
  String get luminexCfgErrProtected => 'port protégé';

  @override
  String get luminexCfgErrUnknownGroup => 'groupe inconnu sur ce switch';

  @override
  String get luminexCfgErrNoPoe => 'pas de PoE sur ce port';

  @override
  String get luminexCfgErrNoSlot =>
      'aucun emplacement de profil libre sur le switch';

  @override
  String get luminexCfgIdentifySent => 'Les LED clignotent';

  @override
  String get luminexCfgPoeCycleRunning => 'Redémarrage PoE en cours…';

  @override
  String get luminexCfgName => 'Nom';

  @override
  String get luminexOn => 'activé';

  @override
  String get luminexOff => 'désactivé';

  @override
  String get luminexBackupTitle => 'Sauvegardes';

  @override
  String get luminexBackupHint =>
      'Une sauvegarde contient le profil Luminex complet (groupes, trunks, ports, IP) et les légendes des ports. Elle est rangée dans l\'app et peut être partagée. Elle sert à revenir en arrière après un problème ou à configurer un switch de remplacement.';

  @override
  String get luminexBackupNow => 'Sauvegarder ce switch';

  @override
  String get luminexBackupDone => 'Sauvegarde enregistrée';

  @override
  String get luminexBackupImport => 'Importer un fichier';

  @override
  String get luminexBackupImportInvalid =>
      'Ce fichier n\'est pas une sauvegarde GigaCore';

  @override
  String get luminexBackupEmpty => 'Aucune sauvegarde pour l\'instant';

  @override
  String get luminexBackupCompare => 'Comparer';

  @override
  String get luminexBackupShare => 'Partager';

  @override
  String get luminexBackupDelete => 'Supprimer';

  @override
  String get luminexBackupRestorePorts => 'Remettre les ports';

  @override
  String get luminexBackupRestoreFull => 'Restauration complète';

  @override
  String get luminexBackupRestoreFullHint =>
      'Applique tout le profil : groupes, trunks, ports, nom. Le trafic peut être coupé quelques secondes : à éviter pendant un show.';

  @override
  String get luminexBackupConfirmFull => 'restaurer toute la configuration ?';

  @override
  String luminexBackupConfirmPorts(int count) {
    return 'ports à remettre comme dans la sauvegarde : $count';
  }

  @override
  String luminexBackupUseBackupIp(String ip) {
    return 'Reprendre l\'IP de la sauvegarde ($ip) : remplacement de matériel';
  }

  @override
  String get luminexBackupModelMismatch =>
      'Modèle différent : vérifie que cette sauvegarde convient à ce switch.';

  @override
  String get luminexBackupNoDiff => 'Identique à la sauvegarde';

  @override
  String luminexBackupDiffCount(int count) {
    return 'Différences : $count';
  }

  @override
  String get luminexBackupColBackup => 'Sauvegarde';

  @override
  String get luminexBackupColNow => 'Actuel';

  @override
  String get luminexBackupRestoreRunning => 'Restauration en cours…';

  @override
  String get luminexBackupRestored => 'Restauration terminée';

  @override
  String get luminexBackupDiffModel => 'Modèle';

  @override
  String get luminexBackupDiffName => 'Nom du switch';

  @override
  String luminexBackupDiffGroupName(int id) {
    return 'Nom du groupe $id';
  }

  @override
  String luminexBackupDiffPortGroup(int port) {
    return 'Port $port · groupe';
  }

  @override
  String luminexBackupDiffPortTrunk(int port) {
    return 'Port $port · ISL';
  }

  @override
  String luminexBackupDiffPortEnabled(int port) {
    return 'Port $port · activation';
  }

  @override
  String luminexBackupDiffPortLegend(int port) {
    return 'Port $port · légende';
  }

  @override
  String get luminexInvTitle => 'Inventaire du réseau';

  @override
  String get luminexInvHint =>
      'Chaque port actif des GigaCore : appareil branché (LLDP), IP vues en IGMP, groupe et univers sACN écoutés. Un appareil qui n\'envoie ni LLDP ni IGMP n\'apparaît qu\'avec la légende du port.';

  @override
  String luminexInvSummary(int count) {
    return 'Ports occupés : $count';
  }

  @override
  String luminexInvIssuesCount(int count) {
    return 'Anomalies : $count';
  }

  @override
  String get luminexInvNoIssue => 'Aucune anomalie';

  @override
  String get luminexInvSearchHint => 'Nom, IP, groupe, u101…';

  @override
  String get luminexInvShowLinks => 'Liens ISL';

  @override
  String get luminexInvEmpty => 'Rien à afficher';

  @override
  String get luminexInvExport => 'Exporter en CSV';

  @override
  String get luminexInvIssueNoIp =>
      'Appareil sans adresse IP (s\'abonne en 0.0.0.0)';

  @override
  String luminexInvIssueDuplicateIp(String ips) {
    return 'IP en double dans le VLAN : $ips';
  }

  @override
  String get netStartTip =>
      'Par où commencer ? Sur un réseau Luminex, ouvre « Switches GigaCore » avec le téléphone sur le VLAN de management : il voit ce qui est branché sur tous les VLAN. Sinon, lance un « Bilan de santé ».';

  @override
  String get netSecWhoTitle => 'Qui est sur le réseau ?';

  @override
  String get netSecWhoDesc =>
      'Les appareils branchés sur tous les VLAN, vus par les switches GigaCore, et les nœuds MA-Net et NDI.';

  @override
  String get netSecFlowTitle => 'Flux lumière et vidéo';

  @override
  String get netSecFlowDesc =>
      'Ce qui circule là où ton téléphone est branché : sACN, Art-Net, RDM et débit. Pour les autres VLAN, passe par « Switches GigaCore ».';

  @override
  String get netSecHealthTitle => 'Santé du réseau';

  @override
  String get netSecHealthDesc =>
      'Un bilan noté, une surveillance en direct, et des instantanés pour comparer avant / après.';

  @override
  String get netSecToolsTitle => 'Outils et calculs';

  @override
  String get netSecToolsDesc =>
      'Sous-réseau, budgets PoE et fibre, adressage Art-Net.';

  @override
  String get netLimitsLuminexTip =>
      'Le téléphone n\'est pas dans le bon VLAN ? Avec des switches GigaCore, « Switches GigaCore › Abonnements multicast » montre qui écoute quoi sur tous les VLAN, depuis le management.';

  @override
  String diagSacnOtherVlan(int count) {
    return 'Pas de sACN sur ton VLAN, mais $count univers circulent dans d\'autres VLAN (vus par les GigaCore).';
  }

  @override
  String diagLuminexUnreachable(String switchName, String ip) {
    return 'Switch GigaCore $switchName ($ip) injoignable';
  }

  @override
  String diagLuminexAlarm(String switchName, String text) {
    return '$switchName : $text';
  }

  @override
  String diagLuminexNoIp(String switchName, int port, String name) {
    return '$switchName, port $port ($name) : appareil sans adresse IP';
  }

  @override
  String diagLuminexDuplicateIp(String switchName, int port, String ips) {
    return '$switchName, port $port : IP en double dans le VLAN ($ips)';
  }

  @override
  String get netQuickTitle => 'Accès rapide';

  @override
  String get netQuickDesc =>
      'Les gestes de base, gratuits : scanner le réseau, pinger, voir ton adresse IP.';

  @override
  String netCatTools(int count) {
    return 'Outils : $count';
  }

  @override
  String netCatFree(int count) {
    return 'Gratuits : $count';
  }

  @override
  String get netProUnlockTitle => 'Débloquer les outils Pro';

  @override
  String get netProUnlockDesc =>
      'Abonnement Réseau Pro : tous les outils de cette rubrique.';

  @override
  String get fxCmpTitle => 'Comparateur de projecteurs';

  @override
  String get fxCmpTileDescription =>
      'Bêta · Trouver un équivalent à une machine';

  @override
  String get fxCmpPickHint =>
      'Il te manque une machine ? Choisis celle à remplacer : je te trouve des équivalents, classés par luminosité puis zoom.';

  @override
  String get fxCmpRefTitle => 'Machine à remplacer';

  @override
  String get fxCmpSearchHint => 'Marque, modèle ou type…';

  @override
  String get fxCmpNoSearchResults => 'Aucune machine trouvée';

  @override
  String get fxCmpChange => 'Changer';

  @override
  String fxCmpResultsCount(Object count) {
    return 'Équivalents trouvés : $count';
  }

  @override
  String fxCmpShowResults(Object count) {
    return 'Voir les résultats ($count)';
  }

  @override
  String get fxCmpNoResults =>
      'Aucun équivalent avec ces filtres. Élargis un peu la recherche !';

  @override
  String get fxCmpFilters => 'Filtres';

  @override
  String get fxCmpResetFilters => 'Réinitialiser';

  @override
  String get fxCmpCriteriaSection => 'Critères';

  @override
  String get fxCmpConstraintsSection => 'Contraintes';

  @override
  String get fxCmpFamily => 'Famille';

  @override
  String get fxCmpScopeSame => 'Même famille';

  @override
  String get fxCmpScopeClose => 'Familles proches';

  @override
  String get fxCmpScopeAll => 'Toutes';

  @override
  String get fxCmpLumenTolerance => 'Écart de luminosité';

  @override
  String get fxCmpAny => 'Peu importe';

  @override
  String get fxCmpMustCoverZoom => 'Le zoom doit couvrir celui de la référence';

  @override
  String get fxCmpMustCoverZoomShort => 'Zoom couvert';

  @override
  String get fxCmpSource => 'Source lumineuse';

  @override
  String get fxCmpMinCri => 'CRI minimum';

  @override
  String get fxCmpSameMotion => 'Même mouvement (lyre / fixe)';

  @override
  String get fxCmpOtherBrands => 'Autres marques uniquement';

  @override
  String get fxCmpLighter => 'Poids ≤ référence';

  @override
  String get fxCmpLowerPower => 'Consommation ≤ référence';

  @override
  String get fxCmpIncludeIncomplete => 'Inclure les données incomplètes';

  @override
  String get fxCmpIncludeIncompleteHint =>
      'Une donnée manquante n\'exclut pas la machine, mais elle perd les points de ce critère.';

  @override
  String get fxCmpCompleteOnly => 'Données complètes';

  @override
  String get fxCmpRefMissingValue =>
      'Non renseigné pour la machine de référence';

  @override
  String get fxCmpLevelEquivalent => 'Équivalent';

  @override
  String get fxCmpLevelClose => 'Proche';

  @override
  String get fxCmpLevelFar => 'Éloigné';

  @override
  String get fxCmpIncomplete => 'Données incomplètes';

  @override
  String get fxCmpZoomCovers => 'Zoom couvert';

  @override
  String get fxCmpZoomPartial => 'Zoom partiel';

  @override
  String get fxCmpCompareTitle => 'Comparaison';

  @override
  String get fxCmpCritFamily => 'Famille';

  @override
  String get fxCmpCritLumen => 'Luminosité';

  @override
  String get fxCmpCritZoom => 'Zoom';

  @override
  String get fxCmpCritCri => 'CRI';

  @override
  String get fxCmpCritSource => 'Source';

  @override
  String get fxCmpCritPower => 'Puissance';

  @override
  String get fxCmpCritWeight => 'Poids';

  @override
  String get fxCmpCritDmx => 'Canaux DMX';

  @override
  String get fxCmpFamSpotProfile => 'Spot / Profile';

  @override
  String get fxCmpFamBeam => 'Beam';

  @override
  String get fxCmpFamHybrid => 'Hybride';

  @override
  String get fxCmpFamWash => 'Wash';

  @override
  String get fxCmpFamMovingHead => 'Lyre (type non précisé)';

  @override
  String get fxCmpFamPar => 'PAR';

  @override
  String get fxCmpFamFresnelPc => 'Fresnel / PC';

  @override
  String get fxCmpFamBar => 'Barre / linéaire';

  @override
  String get fxCmpFamStrobe => 'Strobe / blinder';

  @override
  String get fxCmpFamFollowspot => 'Poursuite';

  @override
  String get fxCmpFamSoftPanel => 'Panneau / soft';

  @override
  String get fxCmpFamCyclo => 'Cyclo / wall washer';

  @override
  String get fxCmpFamEffect => 'Effet';

  @override
  String get fxCmpFamLaser => 'Laser';

  @override
  String get fxCmpFamAtmospheric => 'Machine à effets (fumée…)';

  @override
  String get fxCmpFamOther => 'Autre';

  @override
  String get fxCmpSrcWhiteLed => 'LED blanche';

  @override
  String get fxCmpSrcColorLed => 'LED couleur (RGBW…)';

  @override
  String get fxCmpSrcDischarge => 'Lampe à décharge';

  @override
  String get fxCmpSrcLaser => 'Laser-phosphore';

  @override
  String get fxCmpSrcHalogen => 'Halogène / tungstène';

  @override
  String get fxCmpSrcOther => 'Autre source';

  @override
  String get fxCmpDataNotice =>
      'Le zoom, la CRI et la source ne sont pas encore renseignés dans le catalogue pour la plupart des machines : ils compteront dans le classement dès qu\'ils le seront.';

  @override
  String get fxCmpRefNoData =>
      'Ni la luminosité ni le zoom ne sont renseignés pour cette machine : le classement sera peu fiable.';

  @override
  String get fxCmpDisclaimer =>
      'Classement indicatif basé sur les données constructeur du catalogue. Vérifie toujours la fiche technique avant de remplacer une machine.';

  @override
  String get fxCmpBetaBadge => 'PRO · BÊTA';

  @override
  String get fxCmpBetaPill => 'BÊTA';

  @override
  String get fxCmpBetaTitle => 'Outil en bêta 🧪';

  @override
  String get fxCmpBetaBody =>
      'Le comparateur est tout neuf ! Le classement va s\'affiner à mesure que le catalogue se complète (luminosité, zoom, CRI, source). Un résultat bizarre ? Écris-nous, ça nous aide à l\'améliorer.';

  @override
  String get fxCmpFeedback => 'Envoyer un retour';

  @override
  String get fxCmpReportResult => 'Signaler ce résultat';

  @override
  String get fxCmpFeedbackSubject => 'Comparateur de projecteurs (bêta)';

  @override
  String fxCmpFeedbackRef(Object name) {
    return 'Machine à remplacer : $name';
  }

  @override
  String fxCmpFeedbackCandidate(Object name, Object score) {
    return 'Équivalent proposé : $name (score $score)';
  }

  @override
  String get fxCmpFeedbackComment => 'Ton commentaire :';

  @override
  String get diaphTitle => 'Diaph d\'une machine';

  @override
  String get diaphTileDescription => 'Quel diaph caméra avec cette machine ?';

  @override
  String get diaphIntro =>
      'En télé, on éclaire en diaph ! Choisis la machine, la distance et ta caméra : je te donne le diaph au centre du faisceau.';

  @override
  String get diaphMachineSection => 'Machine';

  @override
  String get diaphSearchHint => 'Chercher dans le catalogue (facultatif)…';

  @override
  String get diaphSourceLumens => 'Lumens + angle';

  @override
  String get diaphSourceMaker => 'Lux constructeur';

  @override
  String get diaphLumens => 'Flux';

  @override
  String get diaphBeamAngle => 'Angle de faisceau';

  @override
  String get diaphBeamAngleHint => 'Beam angle (50 %), pas le field';

  @override
  String get diaphMakerLux => 'Éclairement';

  @override
  String get diaphMakerDistance => 'à la distance';

  @override
  String diaphZoomRange(Object range) {
    return 'Zoom de la machine : $range';
  }

  @override
  String get diaphDimmer => 'Gradateur';

  @override
  String get diaphDistanceSection => 'Distance';

  @override
  String get diaphDistance => 'Distance machine → sujet';

  @override
  String get diaphCameraSection => 'Caméra';

  @override
  String get diaphCamBroadcast => 'Broadcast';

  @override
  String get diaphCamIso => 'ISO / vitesse';

  @override
  String get diaphSensitivity => 'Sensibilité : F à 2000 lx';

  @override
  String get diaphSensitivityHint => 'Fiche technique de ta caméra (gain 0 dB)';

  @override
  String get diaphCustom => 'Perso';

  @override
  String get diaphGain => 'Gain';

  @override
  String get diaphNd => 'Filtre ND';

  @override
  String get diaphNdClear => 'Clear';

  @override
  String get diaphIso => 'ISO';

  @override
  String get diaphFps => 'Images/s';

  @override
  String get diaphShutter => 'Obturateur';

  @override
  String diaphExposure(Object time) {
    return 'Temps de pose : $time';
  }

  @override
  String get diaphResultTitle => 'Diaph au centre du faisceau';

  @override
  String diaphExact(Object value) {
    return 'exact : f/$value';
  }

  @override
  String get diaphLux => 'Éclairement';

  @override
  String get diaphBeamDiameter => 'Diamètre du faisceau';

  @override
  String get diaphTooDark =>
      'Pas assez de lumière : rapproche la machine, monte le gain ou retire le ND.';

  @override
  String get diaphTooBright =>
      'Trop de lumière : ajoute un ND, baisse le gradateur ou éloigne la machine.';

  @override
  String get diaphMissingInput =>
      'Renseigne la machine (flux + angle, ou lux constructeur) et la distance pour voir le diaph.';

  @override
  String get diaphTargetSection => 'Pour travailler à un diaph précis';

  @override
  String get diaphTargetF => 'Diaph visé (f/)';

  @override
  String diaphTargetResult(Object distance, Object lux) {
    return 'Place la machine à $distance m (il faut $lux lx au sujet).';
  }

  @override
  String get diaphDisclaimer =>
      'Estimation à partir du flux et de l\'angle (faisceau supposé en cloche) : compte ± 1/2 diaph selon l\'optique. Pour plus de précision, utilise les lux constructeur ou un luxmètre.';

  @override
  String get cinemaRecModeDuration => 'Durée disponible';

  @override
  String get cinemaRecModeCapacity => 'Capacité nécessaire';

  @override
  String get cinemaRecHoursLabel => 'Durée à enregistrer — heures';

  @override
  String get cinemaRecMinutesLabel => 'Durée à enregistrer — minutes';

  @override
  String get cinemaRecMarginLabel => 'Marge de sécurité';

  @override
  String get cinemaRecNeededResult => 'Capacité nécessaire';

  @override
  String cinemaRecWithMarginResult(Object pct) {
    return 'Avec $pct % de marge';
  }

  @override
  String get cinemaRecSuggestedMediaResult => 'Support conseillé';

  @override
  String get cinemaRecSuggestedNone => '> 8 TB : plusieurs supports';

  @override
  String get riggingToolTrussLoadTitle => 'Charge par moteur';

  @override
  String get riggingToolTrussLoadSubtitle =>
      'Répartition d’un truss sur 2 à 6 moteurs, avec vérification CMU et truss.';

  @override
  String get riggingTrussSectionTruss => 'Truss';

  @override
  String get riggingTrussLengthLabel => 'Longueur du truss';

  @override
  String get riggingTrussSelfWeightLabel => 'Poids propre du truss';

  @override
  String get riggingTrussExtraUdlLabel => 'Charge répartie en plus (câbles…)';

  @override
  String get riggingUnitKgPerMeter => 'kg/m';

  @override
  String get riggingUnitKn => 'kN';

  @override
  String get riggingUnitKnm => 'kN·m';

  @override
  String get riggingTrussSectionMotors => 'Moteurs';

  @override
  String get riggingTrussMotorCountLabel => 'Nombre de moteurs';

  @override
  String riggingTrussMotorPositionLabel(Object n) {
    return 'Position moteur $n';
  }

  @override
  String get riggingTrussPositionsHint =>
      'Positions mesurées depuis l’extrémité gauche du truss.';

  @override
  String get riggingTrussSpreadMotors => 'Répartir régulièrement';

  @override
  String get riggingTrussExtraPerMotorLabel =>
      'Poids ajouté par point (chaîne, élingues, manilles)';

  @override
  String get riggingTrussMotorWllLabel => 'CMU / WLL du moteur';

  @override
  String get riggingTrussDynamicFactorLabel => 'Coefficient dynamique';

  @override
  String get riggingTrussSectionLoads => 'Charges';

  @override
  String get riggingTrussFixtureCountLabel => 'Projecteurs répartis (nombre)';

  @override
  String get riggingTrussFixtureWeightLabel => 'Poids d’un projecteur';

  @override
  String get riggingTrussPointLoadsLabel => 'Charges ponctuelles';

  @override
  String get riggingTrussAddPointLoad => 'Ajouter une charge';

  @override
  String get riggingTrussPositionLabel => 'Position';

  @override
  String get riggingTrussMassLabel => 'Poids';

  @override
  String get riggingTrussSectionCheck => 'Vérification truss (optionnel)';

  @override
  String get riggingTrussAllowableUdl => 'Répartie (UDL)';

  @override
  String get riggingTrussAllowableCpl => 'Centrée (CPL)';

  @override
  String riggingTrussAllowableValueLabel(Object span) {
    return 'Valeur admissible fabricant ($span m)';
  }

  @override
  String get riggingTrussAllowableHint =>
      'Relève dans le tableau de charge du fabricant la valeur pour la plus grande portée entre deux moteurs.';

  @override
  String riggingTrussMotorResultLabel(Object n, Object x) {
    return 'Moteur $n · $x m';
  }

  @override
  String get riggingTrussTotalLoadLabel => 'Charge totale aux moteurs';

  @override
  String riggingTrussMaxMomentLabel(Object x) {
    return 'Moment max (à $x m)';
  }

  @override
  String get riggingTrussLargestSpanLabel => 'Plus grande portée';

  @override
  String get riggingTrussUsageLabel => 'Utilisation truss (moment)';

  @override
  String get riggingTrussInvalidInput =>
      'Vérifie les valeurs : longueur, CMU, positions des moteurs (dans l’ordre, sur le truss, au moins 1 cm d’écart), charges sur le truss, coefficient dynamique ≥ 1.';

  @override
  String get riggingTrussOkDescription =>
      'Tous les moteurs sont sous 80 % de leur CMU.';

  @override
  String get riggingTrussWatchDescription =>
      'Au moins un moteur dépasse 80 % de sa CMU.';

  @override
  String get riggingTrussOverloadDescription =>
      'Au moins un moteur dépasse sa CMU.';

  @override
  String get riggingTrussUpliftDescription =>
      'Au moins un moteur est en soulèvement (charge négative) : porte-à-faux trop chargé, configuration instable.';

  @override
  String get riggingTrussHyperstaticWarning =>
      '3 moteurs ou plus : répartition théorique, avec des moteurs parfaitement à niveau et un truss de rigidité constante. Quelques centimètres de différence de hauteur changent fortement les charges réelles. Seule une mesure (load cells) donne la réalité.';

  @override
  String get riggingTrussCantileverNote =>
      'Porte-à-faux présent : vérifie aussi les valeurs admissibles en porte-à-faux du fabricant.';

  @override
  String get riggingTrussCheckNote =>
      'Seul le moment fléchissant est comparé. L’effort tranchant, la flèche, les assemblages et les accessoires ne sont pas vérifiés.';

  @override
  String get riggingTrussDisclaimer =>
      'Résultats théoriques fournis à titre indicatif ; ils ne remplacent pas une note de calcul. Toute installation doit être vérifiée et validée par une personne qualifiée. L’éditeur de l’application ne peut en aucun cas être tenu responsable de l’utilisation de ces résultats.';

  @override
  String get riggingTrussModelLabel => 'Modèle de truss';

  @override
  String get riggingTrussModelManual => 'Saisie manuelle';

  @override
  String get riggingTrussModelUnchecked => 'valeurs à contrôler';

  @override
  String riggingTrussTableValueLabel(Object span) {
    return 'Valeur du tableau fabricant ($span m)';
  }

  @override
  String riggingTrussTableSource(Object source) {
    return 'Source : $source';
  }

  @override
  String get riggingTrussOutOfTable =>
      'Portée hors du tableau fabricant : vérification impossible.';

  @override
  String get riggingTrussNetNote =>
      'Le poids propre du truss est déjà déduit des valeurs du tableau ; l’outil en tient compte.';

  @override
  String get riggingTrussUncheckedNote =>
      'Valeurs relevées dans la fiche fabricant mais pas encore contrôlées : vérifie-les sur le document source.';

  @override
  String get riggingBridleHeightDiffLabel =>
      'Dénivelé du point B (+ si plus haut que A)';

  @override
  String get riggingBridleHeightDiffHint =>
      'Entraxe mesuré à l’horizontale, flèche mesurée sous le point A.';

  @override
  String get homeTipLabel => 'Le saviez-vous ?';

  @override
  String get homeTipOpen => 'Découvrir';

  @override
  String get homeTipHide => 'Ne plus afficher';

  @override
  String get homeTipHiddenSnack =>
      'Astuces masquées. Vous pouvez les réactiver dans Paramètres.';

  @override
  String get settingsTipsTitle => 'Astuces à l\'accueil';

  @override
  String get settingsTipsSubtitle =>
      'Suggérer un outil à découvrir à chaque ouverture de l\'app';

  @override
  String get homeTipRdm =>
      'Identifiez et configurez vos appareils DMX à distance grâce à l\'outil RDM, sans monter sur le pont.';

  @override
  String get homeTipGigacore =>
      'Lisez la configuration de vos switches Luminex GigaCore, faites l\'inventaire du réseau et sauvegardez vos configurations.';

  @override
  String get homeTipGdtf =>
      'Créez un fichier GDTF à partir de la fiche PDF d\'un projecteur, ou à la main avec l\'assistant.';

  @override
  String get homeTipPluginForge =>
      'Générez des plugins Lua grandMA3 sur mesure avec MA3 Plugin Forge.';

  @override
  String get homeTipPowerPlan =>
      'Dessinez le synoptique de votre distribution électrique et sortez le rapport demandé par les contrôleurs.';

  @override
  String get homeTipUps =>
      'Calculez l\'autonomie d\'un onduleur (UPS) selon la puissance de vos équipements.';

  @override
  String get homeTipRigging =>
      'Calculez les angles et longueurs d\'élingues de vos bridles, et vérifiez la charge d\'un truss.';

  @override
  String get homeTipSafety =>
      'Préparez votre PPSPS et l\'attestation de bon montage directement depuis votre téléphone.';

  @override
  String get homeTipIm3 =>
      'Calculez les produits d\'intermodulation (IM3) pour choisir des fréquences HF compatibles.';

  @override
  String get homeTipSubCardio =>
      'Réglez un sub cardioïde ou un end-fire : l\'app calcule les délais pour vous.';

  @override
  String get homeTipDipswitch =>
      'Trouvez la position des dip-switchs pour n\'importe quelle adresse DMX.';

  @override
  String get homeTipPinned =>
      'Épinglez les références que vous consultez le plus pour les retrouver directement depuis l\'accueil.';

  @override
  String get homeTipBpm =>
      'Tapez le tempo d\'un morceau et convertissez-le en millisecondes pour vos effets et délais.';

  @override
  String get homeTipTimecode =>
      'Calculez durées, décalages et retards de timecode en quelques secondes.';

  @override
  String get homeDrawerRecommend => 'Recommander à un collègue';

  @override
  String get homeShareAppSubject => 'ShowTech Tools';

  @override
  String get homeShareAppMessage =>
      'Je te conseille ShowTech Tools, une app pensée pour les techniciens du spectacle : lumière, son, vidéo, électricité, rigging, réseau, sécurité… Dispo sur iOS et Android : https://www.openwhite.eu/showtech-tools/';

  @override
  String get riggingTrussGrossNote =>
      'Le fabricant ne précise pas si le poids propre est déduit : par sécurité, l’outil le retire de la valeur du tableau.';

  @override
  String get riggingHoistModelLabel =>
      'Modèle de moteur';

  @override
  String get riggingHoistModelManual =>
      'Saisie manuelle';

  @override
  String riggingHoistModelClassNote(Object cls) {
    return 'Classe publiée : $cls. La classe qui compte est celle de la plaque du moteur.';
  }

  @override
  String riggingHoistModelWeights(Object weight, Object chain) {
    return 'Poids sans chaîne : $weight kg · chaîne : $chain kg/m';
  }
}
