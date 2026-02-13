// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Mon App Tech';

  @override
  String get homeTitle => 'Accueil';

  @override
  String get menuTitle => 'Menu';

  @override
  String get settings => 'Paramètres';

  @override
  String get language => 'Langue';

  @override
  String get languageSystem => 'Système (automatique)';

  @override
  String get languageSystemCurrent => 'Langue du téléphone';

  @override
  String get legalNotices => 'Mentions légales';

  @override
  String get resetConsents => 'Réinitialiser consentements';

  @override
  String get consentsReset => 'Consentements réinitialisés.';

  @override
  String get homeVideoTitle => 'Vidéo';

  @override
  String get homeVideoSubtitle =>
      'Lentille & mesure, luminosité, multiprojecteur, LED et mires.';

  @override
  String get homeLightTitle => 'Lumière';

  @override
  String get homeLightSubtitle =>
      'Taille de projection, dip-switch DMX, photométrie, catalogue, patch DMX.';

  @override
  String get homeLaserTitle => 'Laser';

  @override
  String get homeLaserSubtitle =>
      'Calculs et sécurité laser (consentement requis à chaque entrée).';

  @override
  String get homeReferencesTitle => 'Références';

  @override
  String get homeReferencesSubtitle =>
      'DMX / réseau / vidéo : fiches & repères terrain.';

  @override
  String get disclaimerTitle => '⚠️ AVERTISSEMENT LÉGAL & NON-RESPONSABILITÉ';

  @override
  String get disclaimerText =>
      'UTILISATION À TITRE INDICATIF UNIQUEMENT\n\nLes calculs fournis par cette application (vidéo, lumière, laser) sont donnés à titre informatif et indicatif.\nIls ne remplacent en aucun cas :\n- des calculs certifiés,\n- des études techniques,\n- les normes officielles en vigueur,\n- ni la validation par un professionnel qualifié.\n\nRESPONSABILITÉ\nL’éditeur de cette application ne peut être tenu responsable d’erreurs de calcul, d’omissions, de dommages matériels,\nd’accidents corporels, ou de tout incident survenant lors de l’installation, de l’exploitation ou de l’utilisation des équipements.\n\nVIDÉO & PROJECTION\nLes résultats (tailles, ratios, luminosité, overlaps, etc.) reposent sur des modèles théoriques et peuvent varier selon :\noptique, zoom, uniformité, environnement lumineux, support, réglages, etc.\nToujours vérifier avec les documentations constructeur officielles.\n\nLUMIÈRE\nLes calculs sont indicatifs et ne tienent pas compte de toutes les conditions réelles (tolérances, pertes optiques,\ndégradation des sources, normes locales, conditions ambiantes…).\n\nLASER – SÉCURITÉ\nLes calculs NOHD, SZED et CZED sont basés sur des hypothèses standards et des seuils théoriques.\nIls ne prennent pas en compte notamment :\n- instruments optiques (jumelles, caméras, télescopes…),\n- conditions atmosphériques (brouillard, pluie, poussière…),\n- réflexions imprévues, usages détournés, réglages spécifiques.\nL’utilisation d’un système laser implique une responsabilité directe de l’opérateur et une analyse de risques adaptée.\n\nACCEPTATION DES RISQUES\nEn utilisant cette application, l’utilisateur reconnaît :\n- avoir pris connaissance des règles de sécurité applicables,\n- être seul responsable de ses installations,\n- assumer l’entière responsabilité des risques liés à l’utilisation des équipements (vidéo, lumière, laser),\n- vérifier systématiquement les données avec les manuels constructeurs officiels.';

  @override
  String get disclaimerCertify =>
      'Je certifie avoir lu et accepté ces conditions.';

  @override
  String get disclaimerAccept => 'J\'accepte';

  @override
  String get laserConsentTitle => '🔴 CONSENTEMENT LASER (OBLIGATOIRE)';

  @override
  String get laserConsentText =>
      'ACCÈS À LA PARTIE LASER\n\nLa partie LASER de cette application concerne des calculs de sécurité (ex : NOHD, SZED, CZED).\nCes calculs sont indicatifs et ne remplacent pas :\n- une analyse de risques,\n- les normes en vigueur,\n- les procédures d’exploitation,\n- ni la validation par une personne qualifiée.\n\nIMPORTANT\n- Risque de lésions oculaires / cutanées en cas de mauvaise utilisation.\n- Le calcul peut être faux si les paramètres entrés sont incomplets, erronés ou si le contexte réel diffère (optique,\n  conditions atmosphériques, réflexions, alignement, etc.).\n- L’opérateur est seul responsable de l’installation, de l’exploitation et de la conformité.\n\nEn validant, vous confirmez :\n- comprendre les risques,\n- respecter les règles de sécurité applicables,\n- assumer l’entière responsabilité en cas de négligence ou mauvaise utilisation.';

  @override
  String get commonCancel => 'Annuler';

  @override
  String get commonSave => 'Enregistrer';

  @override
  String get commonRename => 'Renommer';

  @override
  String get commonSearch => 'Rechercher';

  @override
  String get commonNone => 'Aucun enregistrement';

  @override
  String get commonCalculate => 'Calculer';

  @override
  String get commonCopyResultTooltip => 'Copier le résultat';

  @override
  String get commonUnitMeter => 'm';

  @override
  String get commonReset => 'Réinitialiser';

  @override
  String get commonOkWithCheck => 'OK ✅';

  @override
  String get commonTooLowWithCross => 'Trop faible ❌';

  @override
  String get lightProjectionTitle => 'Taille de projection';

  @override
  String get lightProjectionDescription =>
      'Calcul indicatif de la taille de tache selon l’angle, la distance et le diamètre.';

  @override
  String get lightDmxSwitchTitle => 'Dip-switch DMX';

  @override
  String get lightDmxSwitchDescription =>
      'Conversion indicative entre adresse DMX et interrupteurs, avec navigation par intervalle.';

  @override
  String get lightPhotometryTitle => 'Photométrie';

  @override
  String get lightPhotometryDescription =>
      'Conversions indicatives entre lux, candela et lumen, avec distance et angle.';

  @override
  String get lightCatalogTitle => 'Catalogue';

  @override
  String get lightCatalogDescription =>
      'Sélection par constructeur, type et produit, avec informations et manuel.';

  @override
  String get lightPatchTitle => 'Patch DMX';

  @override
  String get lightPatchDescription =>
      'Importer un fichier MVR ou créer un patch manuellement depuis la librairie.';

  @override
  String get lightDisclaimerShort =>
      'Outils indicatifs. Vérifie toujours la documentation constructeur.';

  @override
  String get laserInputsTitle => 'Entrées';

  @override
  String get laserPowerLabel => 'Puissance (mW)';

  @override
  String get laserPowerHint => 'ex: 5000';

  @override
  String get laserDivergenceLabel => 'Divergence (mrad)';

  @override
  String get laserDivergenceHint => 'ex: 1.2';

  @override
  String get laserDiameterLabel => 'Diamètre de sortie (mm)';

  @override
  String get laserDiameterHint => 'ex: 3.0';

  @override
  String get laserSaveCurrentProjector => 'Enregistrer ce projecteur';

  @override
  String get laserSafetyResultsTitle => 'Résultats de sécurité';

  @override
  String get laserZoneNohdDesc => 'Danger oculaire';

  @override
  String get laserZoneSzedDesc => 'Zone sensible';

  @override
  String get laserZoneCzedDesc => 'Zone critique';

  @override
  String get laserTargetDistanceLabel => 'Distance cible (m)';

  @override
  String get laserTargetDistanceHint => 'ex: 10';

  @override
  String get laserAdviceFullPower => 'Pleine puissance autorisée (100 %)';

  @override
  String laserAdviceMaxRecommended(Object percent) {
    return 'Puissance maximale conseillée : $percent';
  }

  @override
  String get laserSavedProjectorsTitle => 'Projecteurs enregistrés';

  @override
  String get laserSearchHint => 'ex: “RGB 5W”';

  @override
  String laserPresetSubtitle(Object p, Object div, Object diam) {
    return 'P: $p mW • Div: $div mrad • Ø: $diam mm';
  }

  @override
  String get laserSaveProjectorTitle => 'Enregistrer un projecteur';

  @override
  String get laserRenameProjectorTitle => 'Renommer le projecteur';

  @override
  String get laserProjectorNameLabel => 'Nom du projecteur';

  @override
  String get laserInvalidInputs =>
      'Veuillez entrer une puissance, une divergence et un diamètre valides.';

  @override
  String get laserPresetAdded => 'Enregistrement ajouté.';

  @override
  String get laserPresetDeleted => 'Enregistrement supprimé.';

  @override
  String get laserNameUpdated => 'Nom mis à jour.';

  @override
  String get laserNormativeParamsTitle => 'Paramètres de sécurité retenus';

  @override
  String get laserNormativeParamsBody =>
      'MPE pour la distance nominale de danger oculaire (NOHD) : 25,4 W/m²\n(Norme IEC 60825-1, édition 3.0)\n\nMPE pour la distance d’exposition de la zone sensible (SZED) : 1 W/m²\n(Norme ANSI Z136.6)\n\nMPE pour la distance d’exposition de la zone critique (CZED) : 0,05 W/m²\n(Norme ANSI Z136.6)';

  @override
  String get laserDisclaimerShort =>
      'Calcul indicatif. Ne remplace pas une analyse de sécurité laser.';

  @override
  String get aboutDmxTitle => 'DMX — fonctionnement (simple & complet)';

  @override
  String get aboutDmxSubtitle =>
      'Univers, adresses, trames, câblage RS-485, terminaison, erreurs terrain.\nInclut schémas + checklist.';

  @override
  String get aboutArtNetTitle =>
      'Art-Net — DMX sur IP (nodes, unicast/broadcast)';

  @override
  String get aboutArtNetSubtitle =>
      'Univers DMX sur Ethernet/UDP, nodes, broadcast vs unicast.\nLimites réelles, stabilité réseau, RDM selon matériel.';

  @override
  String get aboutSacnTitle => 'sACN / E1.31 — multicast, IGMP, priorités';

  @override
  String get aboutSacnSubtitle =>
      'Standard DMX sur IP orienté réseau “pro”.\nMulticast/unicast, IGMP snooping/querier, priorités multi-sources.';

  @override
  String get aboutIpBasicsTitle =>
      'Réseau — bases IP / masque / DHCP (essentiel)';

  @override
  String get aboutIpBasicsSubtitle =>
      'Comprendre IP, masque, passerelle, DHCP vs statique.\nExemples concrets (2.x, 10.x, 192.168.x) + checklist.';

  @override
  String get aboutLightNetworkTitle =>
      'Réseau lumière — VLAN, IGMP, Wi-Fi vs filaire';

  @override
  String get aboutLightNetworkSubtitle =>
      'Architecture simple et robuste pour Art-Net/sACN.\nVLAN, IGMP snooping/querier, Wi-Fi (jitter), switchs, schémas + checklist.';

  @override
  String get aboutCablingFiberTitle =>
      'Réseau — RJ45 / Fibre / débits & longueurs';

  @override
  String get aboutCablingFiberSubtitle =>
      'Cat5e→Cat8, fibre OM3/OM4/OS2, LC/SC/MPO, distances typiques, bonnes pratiques show.';

  @override
  String get aboutVideoTitle => 'Vidéo — SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutVideoSubtitle =>
      'Choisir selon latence, fiabilité, câblage, réseau LAN vs WAN.\nTableaux + schéma.';

  @override
  String get aboutElectricityTitle => 'Électrique — Schuko / P17 / puissances';

  @override
  String get aboutElectricitySubtitle =>
      'Connecteurs, mono/tri, tableaux kW rapides (16A→400A), pièges terrain.';

  @override
  String get aboutComputingTitle =>
      'Informatique — USB / HDMI / DP / SATA / NVMe…';

  @override
  String get aboutComputingSubtitle =>
      'Débits utiles, versions, limites réelles, pièges marketing.';

  @override
  String get videoTitle => 'Vidéo';

  @override
  String get videoToolsTitle => 'Outils vidéo';

  @override
  String get videoDisclaimerShort =>
      'Calculs indicatifs. Vérifie toujours la documentation constructeur.';

  @override
  String get videoLensMeasureTitle => 'Lentille & mesure';

  @override
  String get videoLensMeasureSubtitle =>
      'Ratio / largeur / hauteur (calculs 1 à 3).';

  @override
  String get videoBrightnessTitle => 'Luminosité';

  @override
  String get videoBrightnessSubtitle => 'Lux / nits / ft-L + seuil (calcul 4).';

  @override
  String get videoMultiprojectorTitle => 'Multiprojecteur';

  @override
  String get videoMultiprojectorSubtitle =>
      'Overlap + largeur/projo + nombre de projos (calculs 5 & 6).';

  @override
  String get videoLedTitle => 'LED';

  @override
  String get videoLedSubtitle =>
      'Pixels du mur LED selon taille, pitch, dimension des tiles.';

  @override
  String get videoTestPatternTitle => 'Mire';

  @override
  String get videoTestPatternSubtitle =>
      'Création de mire vidéo pour écran et mur LED (à faire après).';

  @override
  String get videoMpFormatLabel => 'Format (ratio)';

  @override
  String get videoMpCalc5Title => 'Calcul 5 — Largeur par projecteur';

  @override
  String get videoMpCalc6Title =>
      'Calcul 6 — Nombre de projecteurs (ratio min/max)';

  @override
  String get videoMpTotalWidthLabel => 'Largeur totale de projection (m)';

  @override
  String get videoMpTotalWidthHint => 'ex: 18.0';

  @override
  String get videoMpDistanceLabel => 'Distance de projection (m)';

  @override
  String get videoMpDistanceHint => 'ex: 12.0';

  @override
  String get videoMpOverlapLabel => 'Overlap (%)';

  @override
  String get videoMpOverlapHint => 'ex: 10';

  @override
  String get videoMpProjectorCountLabel => 'Nombre de projecteurs (N)';

  @override
  String get videoMpProjectorCountHint => 'ex: 2';

  @override
  String get videoMpRatioMinLabel => 'Ratio min';

  @override
  String get videoMpRatioMinHint => 'ex: 1.20';

  @override
  String get videoMpRatioMaxLabel => 'Ratio max';

  @override
  String get videoMpRatioMaxHint => 'ex: 1.80';

  @override
  String get videoMpOptionalLuminanceTitle => 'Optionnel : luminosité';

  @override
  String get videoMpLumensPerProjectorLabel => 'Lumens par projecteur';

  @override
  String get videoMpLumensPerProjectorHint => 'ex: 20000';

  @override
  String get videoMpGainLabel => 'Gain';

  @override
  String get videoMpGainHint => 'ex: 1.0';

  @override
  String get videoMpErrMissing5 =>
      '❌ Données manquantes : Largeur totale + Overlap% + N.';

  @override
  String get videoMpErrWidthGt0 => '❌ Largeur totale doit être > 0.';

  @override
  String get videoMpErrNGte2 => '❌ N doit être ≥ 2.';

  @override
  String get videoMpErrOverlapRange => '❌ Overlap% doit être entre 0 et 99.9.';

  @override
  String get videoMpErrImpossibleDenom =>
      '❌ Paramètres impossibles (denom ≤ 0).';

  @override
  String get videoMpErrMissing6Main =>
      '❌ Données manquantes : Largeur totale + Distance + Overlap%.';

  @override
  String get videoMpErrWidthDistanceGt0 =>
      '❌ Largeur totale et distance doivent être > 0.';

  @override
  String get videoMpErrMissingRatios =>
      '❌ Données manquantes : Ratio min et/ou Ratio max.';

  @override
  String get videoMpErrInvalidRatio => '❌ Ratio invalide (doit être > 0).';

  @override
  String get videoMpLumiOptionalHint =>
      'Luminosité (optionnelle) : renseigne Lumens/projo + Gain pour estimer.';

  @override
  String get videoMpLumiErrLumensGainGt0 =>
      'Luminosité: ❌ Lumens/projo et gain doivent être > 0.';

  @override
  String videoMpCaseOpenMin(Object n, Object coverage) {
    return 'Cas ratio plus ouvert (min) = $n projos | couverture ≈ $coverage m';
  }

  @override
  String videoMpCaseTightMax(Object n, Object coverage) {
    return 'Cas ratio plus serré (max) = $n projos | couverture ≈ $coverage m';
  }

  @override
  String videoMpLumiEstimated(
      Object n, Object area, Object lux, Object nits, Object fl) {
    return 'Luminosité estimée (N=$n)\nSurface: $area m²\nLux eq: $lux\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoMpNoteIndicative => 'Note: estimation indicative.';

  @override
  String get videoLmFormatLabel => 'Format (ratio)';

  @override
  String get videoLmCalc1Title => 'Calcul 1 — Ratio (Distance / Largeur)';

  @override
  String get videoLmCalc2Title => 'Calcul 2 — Largeur (Distance / Ratio)';

  @override
  String get videoLmCalc3Title => 'Calcul 3 — Hauteur (Largeur + Format)';

  @override
  String get videoLmDistanceLabel => 'Distance de projection (m)';

  @override
  String get videoLmDistanceHint => 'ex: 12.0';

  @override
  String get videoLmImageWidthLabel => 'Largeur d\'image (m)';

  @override
  String get videoLmImageWidthHint => 'ex: 6.0';

  @override
  String get videoLmThrowRatioLabel => 'Ratio de projection';

  @override
  String get videoLmThrowRatioHint => 'ex: 1.60';

  @override
  String get videoLmErrMissingDistanceWidth =>
      '❌ Données manquantes : Distance + Largeur.';

  @override
  String get videoLmErrMissingDistanceRatio =>
      '❌ Données manquantes : Distance + Ratio.';

  @override
  String get videoLmErrMissingWidthOnly => '❌ Donnée manquante : Largeur.';

  @override
  String get videoLmErrWidthGt0 => '❌ Largeur doit être > 0.';

  @override
  String get videoLmErrRatioGt0 => '❌ Ratio doit être > 0.';

  @override
  String videoLmResultRatio(Object ratio) {
    return '✅ Ratio de projection = $ratio';
  }

  @override
  String videoLmResultWidth(Object width) {
    return '✅ Largeur image = $width m';
  }

  @override
  String videoLmResultHeight(Object height, Object format) {
    return '✅ Hauteur = $height m (format $format)';
  }

  @override
  String get videoLedCalcTitle => 'Calcul — Pixels / tiles';

  @override
  String get videoLedTilesXLabel => 'Tiles horizontales (X)';

  @override
  String get videoLedTilesXHint => 'ex: 15';

  @override
  String get videoLedTilesYLabel => 'Tiles verticales (Y)';

  @override
  String get videoLedTilesYHint => 'ex: 8';

  @override
  String get videoLedTileWpxLabel => 'Tile largeur (px)';

  @override
  String get videoLedTileWpxHint => 'ex: 128';

  @override
  String get videoLedTileHpxLabel => 'Tile hauteur (px)';

  @override
  String get videoLedTileHpxHint => 'ex: 128';

  @override
  String get videoLedTileWcmLabel => 'Tile largeur (cm)';

  @override
  String get videoLedTileWcmHint => 'ex: 33.28';

  @override
  String get videoLedTileHcmLabel => 'Tile hauteur (cm)';

  @override
  String get videoLedTileHcmHint => 'ex: 33.28';

  @override
  String get videoLedErrMissingInputs =>
      '❌ Données manquantes : Tiles X/Y + Tile px + Tile cm.';

  @override
  String get videoLedErrAllGt0 => '❌ Toutes les valeurs doivent être > 0.';

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
    return '✅ Résolution mur: $wallWpx × $wallHpx px\n✅ Taille mur: $wallWm × $wallHm m\nTile: $tileWpx×$tileHpx px • $tileWcm×$tileHcm cm\nPitch calculé: $pitch';
  }

  @override
  String get videoCalculationsTitle => 'Calculs vidéo';

  @override
  String get videoCopyAllTooltip => 'Copier tous les résultats';

  @override
  String get videoExportPdfTooltip => 'Exporter PDF';

  @override
  String get videoCalculateAll => 'Calculer tout';

  @override
  String get videoSummaryPillsTitle => 'Résumé (pastilles)';

  @override
  String get videoCopySummaryTooltip => 'Copier le résumé';

  @override
  String get videoCommonParamsTitle => 'Paramètres communs';

  @override
  String get videoFormatLabel => 'Format (ratio)';

  @override
  String get videoDistanceLabel => 'Distance de projection (m)';

  @override
  String get videoDistanceHint => 'ex: 12.0';

  @override
  String get videoImageWidthLabel => 'Largeur d\'image (m)';

  @override
  String get videoImageWidthHint => 'ex: 6.0';

  @override
  String get videoThrowRatioLabel => 'Ratio de projection';

  @override
  String get videoThrowRatioHint => 'ex: 1.60';

  @override
  String get videoLumensLabel => 'Lumens (ANSI)';

  @override
  String get videoLumensHint => 'ex: 20000';

  @override
  String get videoGainLabel => 'Gain';

  @override
  String get videoGainHint => 'ex: 1.0';

  @override
  String get videoScreenPresetLabel => 'Écran / Support (preset)';

  @override
  String get videoPresetFrontWhite => 'Front - écran blanc mat (gain 1.0)';

  @override
  String get videoPresetFrontGrey => 'Front - écran gris (gain 0.8)';

  @override
  String get videoPresetFrontHighGain => 'Front - écran high gain (gain 1.3)';

  @override
  String get videoPresetRearDiffusion => 'Rétro - toile diffusion (gain 0.7)';

  @override
  String get videoPresetRearClear => 'Rétro - toile claire (gain 0.9)';

  @override
  String get videoPresetMappingMatte => 'Mapping - peinture mate (gain 0.75)';

  @override
  String get videoPresetMappingSatin => 'Mapping - peinture satinée (gain 0.9)';

  @override
  String get videoPresetMappingLightStone =>
      'Mapping - pierre claire (gain 0.6)';

  @override
  String get videoPresetMappingDarkStone =>
      'Mapping - pierre sombre (gain 0.35)';

  @override
  String get videoPresetMappingGlass => 'Mapping - vitre (gain 0.15)';

  @override
  String get videoPresetFrontWhiteShort => 'Front - écran blanc mat';

  @override
  String get videoPresetFrontGreyShort => 'Front - écran gris';

  @override
  String get videoPresetFrontHighGainShort => 'Front - écran high gain';

  @override
  String get videoPresetRearDiffusionShort => 'Rétro - toile diffusion';

  @override
  String get videoPresetRearClearShort => 'Rétro - toile claire';

  @override
  String get videoPresetMappingMatteShort => 'Mapping - peinture mate';

  @override
  String get videoPresetMappingSatinShort => 'Mapping - peinture satinée';

  @override
  String get videoPresetMappingLightStoneShort => 'Mapping - pierre claire';

  @override
  String get videoPresetMappingDarkStoneShort => 'Mapping - pierre sombre';

  @override
  String get videoPresetMappingGlassShort => 'Mapping - vitre';

  @override
  String get videoOverlapLabel => 'Overlap (%)';

  @override
  String get videoOverlapHint => 'ex: 10';

  @override
  String get videoTotalWidthLabel => 'Largeur totale de projection (m)';

  @override
  String get videoTotalWidthHint => 'ex: 18.0';

  @override
  String get videoCalc1Title => 'Calcul 1 — Ratio (Distance / Largeur)';

  @override
  String get videoCalc2Title => 'Calcul 2 — Largeur (Distance / Ratio)';

  @override
  String get videoCalc3Title => 'Calcul 3 — Hauteur (Largeur + Format)';

  @override
  String get videoCalc4Title =>
      'Calcul 4 — Luminosité (lux / nits / ft-L + seuil)';

  @override
  String get videoCalc5Title => 'Calcul 5 — Overlap (Largeur totale + N)';

  @override
  String get videoCalc6Title => 'Calcul 6 — Nb projecteurs auto + luminosité';

  @override
  String get videoCalc5NLabel => 'Nombre de projecteurs (N)';

  @override
  String get videoCalc5NHint => 'ex: 2';

  @override
  String get videoCalc6RatioMinLabel => 'Ratio min';

  @override
  String get videoCalc6RatioMinHint => 'ex: 1.20';

  @override
  String get videoCalc6RatioMaxLabel => 'Ratio max';

  @override
  String get videoCalc6RatioMaxHint => 'ex: 1.80';

  @override
  String get videoOptionalBrightnessTitle => 'Optionnel : luminosité';

  @override
  String get videoCalc6LumensPerProjectorLabel => 'Lumens par projecteur';

  @override
  String get videoCalc6LumensPerProjectorHint => 'ex: 20000';

  @override
  String get videoCalc6GainLabel => 'Gain (calc 6)';

  @override
  String get videoCalc6GainHint => 'ex: 1.0';

  @override
  String get videoCalc1ErrMissing =>
      '❌ Données manquantes: Distance + Largeur.';

  @override
  String get videoCalc2ErrMissing => '❌ Données manquantes: Distance + Ratio.';

  @override
  String get videoCalc3ErrMissingWidth => '❌ Donnée manquante: Largeur.';

  @override
  String get videoErrWidthGt0 => '❌ La largeur doit être > 0.';

  @override
  String get videoErrRatioGt0 => '❌ Le ratio doit être > 0.';

  @override
  String videoCalc1Ok(Object ratio) {
    return '✅ Ratio de projection = $ratio';
  }

  @override
  String videoCalc2Ok(Object width) {
    return '✅ Largeur image = $width m';
  }

  @override
  String videoCalc3Ok(Object height, Object format) {
    return '✅ Hauteur = $height m (format $format)';
  }

  @override
  String get videoCalc4ErrMissing =>
      '❌ Données manquantes: Lumens + Gain + Largeur.';

  @override
  String get videoCalc4ErrGt0 => '❌ Lumens/Gain/Largeur doivent être > 0.';

  @override
  String videoCalc4Result(Object area, Object format, Object lux, Object luxEq,
      Object nits, Object fl, Object presetLabel, Object minFl, Object status) {
    return 'Surface: $area m² (format $format)\nLux (lm/m²): $lux\nLux eq (gain): $luxEq\nLuminance: $nits nits | $fl ft-L\nSeuil mini ($presetLabel): $minFl ft-L → $status\nNote: conversion nits/ft-L basée sur une hypothèse Lambertienne (approx).';
  }

  @override
  String get videoCalc5ErrMissing =>
      '❌ Données manquantes: Largeur totale + Overlap% + Nombre de projecteurs.';

  @override
  String get videoErrTotalWidthGt0 => '❌ Largeur totale doit être > 0.';

  @override
  String get videoCalc5ErrNMin2 => '❌ Le nombre de projecteurs doit être ≥ 2.';

  @override
  String get videoErrOverlapRange => '❌ Overlap% doit être entre 0 et 99.9.';

  @override
  String get videoErrImpossibleDenom => '❌ Paramètres impossibles (denom ≤ 0).';

  @override
  String videoCalc5Result(Object wTot, Object n, Object overlapPct, Object wPer,
      Object overlapM, Object format, Object hTot) {
    return 'Largeur totale: $wTot m\nN: $n | Overlap: $overlapPct% (sur largeur projo)\n\n- Largeur par projecteur: $wPer m\n- Overlap entre 2 projos: $overlapM m\n- Hauteur totale (format $format): $hTot m';
  }

  @override
  String get videoCalc6ErrMissingBasics =>
      '❌ Données manquantes: Largeur totale + Distance + Overlap%.';

  @override
  String get videoErrTotalWidthAndDistanceGt0 =>
      '❌ Largeur totale et distance doivent être > 0.';

  @override
  String get videoCalc6ErrMissingRatio =>
      '❌ Données manquantes: Ratio min et/ou Ratio max.';

  @override
  String get videoCalc6LumiOptional =>
      'Luminosité (optionnelle): renseigne Lumens/projo + Gain pour l\'estimation.';

  @override
  String get videoCalc6LumiErrGt0 =>
      'Luminosité: ❌ Lumens/projo et gain doivent être > 0.';

  @override
  String videoCalc6LumiForN(
      Object n, Object area, Object lux, Object nits, Object fl) {
    return 'Luminosité estimée (N=$n)\nSurface: $area m²\nLux eq: $lux (lm/m²)\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoCalc6NoteIndicative =>
      'Note: estimation indicative (blend/overlap réels peuvent réduire un peu).';

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
    return 'Largeur totale=$wTot m | Distance=$distance m | Overlap=$overlapPct%\nFormat $format → Hauteur totale=$hTot m | Surface=$area m²\nRatio min/max: $ratioMin → $ratioMax\n\nCas ratio plus ouvert (min) = $nMin projos | couverture ≈ $covMin m\n$lumiMin\n\nCas ratio plus serré (max) = $nMax projos | couverture ≈ $covMax m\n$lumiMax\n\n$note';
  }

  @override
  String videoCommonPillFormat(Object format) {
    return 'Format: $format';
  }

  @override
  String videoCommonPillDistance(Object value) {
    return 'Distance: $value';
  }

  @override
  String videoCommonPillWidth(Object value) {
    return 'Largeur: $value';
  }

  @override
  String videoCommonPillRatio(Object value) {
    return 'Ratio: $value';
  }

  @override
  String videoCommonPillHeight(Object value) {
    return 'Hauteur: $value';
  }

  @override
  String videoCommonPillArea(Object value) {
    return 'Surface: $value';
  }

  @override
  String videoCommonPillTotalWidth(Object value) {
    return 'Largeur totale: $value';
  }

  @override
  String videoCommonPillOverlap(Object value) {
    return 'Overlap: $value';
  }

  @override
  String get videoPdfTitle => 'Mon App Technique – Export Vidéo';

  @override
  String get videoPdfDate => 'Date';

  @override
  String get videoPdfFormat => 'Format';

  @override
  String get videoPdfDistance => 'Distance (m)';

  @override
  String get videoPdfImageWidth => 'Largeur image (m)';

  @override
  String get videoPdfRatio => 'Ratio';

  @override
  String get videoPdfLumens => 'Lumens';

  @override
  String get videoPdfGain => 'Gain';

  @override
  String get videoPdfScreenPreset => 'Preset écran';

  @override
  String get videoPdfOverlap => 'Overlap (%)';

  @override
  String get videoPdfTotalWidth => 'Largeur totale (m)';

  @override
  String get videoPdfCalc5N => 'N (calc5)';

  @override
  String get videoPdfCalc6RatioMin => 'Ratio min (calc6)';

  @override
  String get videoPdfCalc6RatioMax => 'Ratio max (calc6)';

  @override
  String get videoPdfCalc6LumensPerProj => 'Lumens/projo (calc6)';

  @override
  String get videoPdfCalc6Gain => 'Gain (calc6)';

  @override
  String get videoPdfParams => 'Paramètres';

  @override
  String get videoPdfResults => 'Résultats';

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
  String get videoPdfCalc6 => 'Calcul 6';

  @override
  String videoCalcLabel(Object n) {
    return 'Calcul $n';
  }

  @override
  String get videoBrightnessSectionTitle =>
      'Calcul 4 — Lux / nits / ft-L + seuil';

  @override
  String get videoCalc4ErrMissingSimple =>
      '❌ Données manquantes : Largeur + Lumens + Gain.';

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
    return 'Format: $format\nSurface: $area m²\nLux (lm/m²): $lux\nLux eq (gain): $luxEq\nLuminance: $nits nits | $fl ft-L\nSeuil mini ($presetLabel): $minFl ft-L → $status\nNote: estimation indicative (Lambert).';
  }

  @override
  String get videoMireTitle => 'Mire';

  @override
  String get videoMireHeaderTitle => 'Générateur de mires';

  @override
  String get videoMireHeaderSubtitle =>
      'Mires indicatives (calage, focus, géométrie, blend, pixel perfect).';

  @override
  String get videoMireScreenVideoTitle => 'Mire écran vidéo';

  @override
  String get videoMireScreenVideoSubtitle =>
      'Simple (WxH px) + Mapping multi-projos (N + overlap).';

  @override
  String get videoMireScreenLedTitle => 'Mire écran LED';

  @override
  String get videoMireScreenLedSubtitle =>
      'Mire selon WxH px (pixel perfect, uniformité, grille).';

  @override
  String get mireVideoSimpleTitle => 'VIDÉO / MIRE SIMPLE';

  @override
  String get mireVideoComboTitle => 'VIDÉO / MIRE COMBO';

  @override
  String get mireVideoMappingTitle => 'VIDÉO / MIRE MAPPING';

  @override
  String get mireLedTitle => 'LED / MIRE';

  @override
  String get mireLedTilesIdTitle => 'LED / ID TILES';

  @override
  String get mireSimpleSubtitleGridSafe => 'Grille + safe + cercles';

  @override
  String get mireSimpleSubtitleCheckerboard => 'Damier + cercles';

  @override
  String get mireSimpleSubtitleColorBars => 'Barres + rampes + cercles';

  @override
  String get mireSimpleSubtitleUniformity => 'Uniformité + cercles';

  @override
  String get mireSimpleSubtitleComboAll =>
      'Grille + safe + 2 barres centrées + cercles';

  @override
  String get mireLedSubtitlePixelPerfect => 'Pixel perfect + cercles';

  @override
  String get mireLedSubtitleGridLabels => 'Grille + repères + cercles';

  @override
  String get mireLedSubtitleColorBars => 'Barres + rampes + cercles';

  @override
  String get mireLedSubtitleUniformity => 'Uniformité + cercles';

  @override
  String mireMappingSubtitlePattern(Object n, Object orient, Object percent) {
    return 'N=$n • Overlap $percent% • $orient';
  }

  @override
  String get mireOrientationHorizontal => 'Horizontal';

  @override
  String get mireOrientationVertical => 'Vertical';

  @override
  String mireProjectorLabelPattern(Object index) {
    return 'PROJO $index';
  }

  @override
  String get mireBlendLabel => 'BLEND';

  @override
  String get mireTileMissingPx => 'Renseigne Tile (px) pour numérotation.';

  @override
  String get mireWallNotMultipleOfTiles => 'MUR NON MULTIPLE DE TILES';

  @override
  String mireTilesSubtitleBase(Object nx, Object ny, Object th, Object tw) {
    return 'Tile ${tw}x$th px • Grille $nx x $ny';
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
    return 'Mur ~ $wm×$hm m';
  }

  @override
  String get mireSimpleSectionTitle => 'Mire écran simple';

  @override
  String get mireMappingSectionTitle => 'Mire mapping multi-projecteur';

  @override
  String get mireVideoSimpleSectionTitle => 'Mire écran simple';

  @override
  String get mireVideoMappingSectionTitle => 'Mire mapping multi-projecteur';

  @override
  String get mireWidthPxLabel => 'Largeur (px)';

  @override
  String get mireHeightPxLabel => 'Hauteur (px)';

  @override
  String get mireWidthPxHint => 'ex: 1920';

  @override
  String get mireHeightPxHint => 'ex: 1080';

  @override
  String get mireWidthPxHintMapping => 'ex: 3840';

  @override
  String get mireHeightPxHintMapping => 'ex: 2160';

  @override
  String get mireTypeLabel => 'Type de mire';

  @override
  String get mireExportPng => 'Exporter PNG';

  @override
  String get mireErrInvalidWHpx => '❌ Largeur/hauteur invalides (px).';

  @override
  String get mireErrInvalidProjectors =>
      '❌ Nombre de projecteurs invalide (N > 0).';

  @override
  String get mireErrInvalidOverlap => '❌ Overlap invalide (0 à 99.9).';

  @override
  String get mireSimpleTypeComboAll =>
      'Combo (grille + cercles + 2 barres centrées)';

  @override
  String get mireSimpleTypeGridSafe => 'Grille + safe + cercles';

  @override
  String get mireSimpleTypeColorBars => 'Barres + rampes + cercles';

  @override
  String get mireSimpleTypeUniformity => 'Uniformité + cercles';

  @override
  String get mireSimpleTypeCheckerboard => 'Damier + cercles';

  @override
  String get mireProjectorsNLabel => 'Nombre de projecteurs (N)';

  @override
  String get mireProjectorsNHint => 'ex: 2';

  @override
  String get mireOverlapLabel => 'Overlap (%)';

  @override
  String get mireOverlapHint => 'ex: 10.0';

  @override
  String get mireOrientationLabel => 'Orientation';

  @override
  String get mireMappingTypeLabel => 'Type mapping';

  @override
  String get mireMappingTypeCombo => 'Combo (zones + overlap + blend)';

  @override
  String get mireMappingTypeZonesOverlap => 'Zones + overlap';

  @override
  String get mireMappingTypeBlendRamps => 'Blend ramps';

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
  String get mireLedParamsTitle => 'Paramètres mur LED';

  @override
  String get mireLedTilesXLabel => 'Tiles horizontales (X)';

  @override
  String get mireLedTilesYLabel => 'Tiles verticales (Y)';

  @override
  String get mireLedTileWpxLabel => 'Tile largeur (px)';

  @override
  String get mireLedTileHpxLabel => 'Tile hauteur (px)';

  @override
  String get mireLedTileWcmLabel => 'Tile largeur (cm)';

  @override
  String get mireLedTileHcmLabel => 'Tile hauteur (cm)';

  @override
  String mireLedWallResolution(Object w, Object h) {
    return 'Résolution mur: $w × $h px';
  }

  @override
  String mireLedPitchComputed(Object pitch) {
    return 'Pitch calculé: $pitch';
  }

  @override
  String get mireLedErrTilesXY => '❌ Renseigne Tiles X/Y (>0).';

  @override
  String get mireLedErrTilePx => '❌ Renseigne Tile px (largeur/hauteur >0).';

  @override
  String get mireLedErrTileCm => '❌ Renseigne Tile cm (largeur/hauteur >0).';

  @override
  String get mireLedWarnPitchOutOfRange =>
      '⚠️ Pitch calculé hors plage (0.5–20 mm). Vérifie Tile cm / px.';

  @override
  String get mireLedWarnPitchXNotY =>
      '⚠️ Pitch X ≠ Pitch Y (tile non homogène). Vérifie dimensions cm et px.';

  @override
  String get mireLedTypeTilesId => 'Tiles ID (numéro + couleurs)';

  @override
  String get mireLedTypePixelPerfect => 'Pixel perfect + cercles';

  @override
  String get mireLedTypeGridLabels => 'Grille + repères + cercles';

  @override
  String get mireLedTypeColorBars => 'Barres + rampes + cercles';

  @override
  String get mireLedTypeUniformity => 'Uniformité + cercles';

  @override
  String get mireVideoTypeCombo =>
      'Combo (grille + cercles + 2 barres centrées)';

  @override
  String get mireVideoTypeGridSafe => 'Grille + safe + cercles';

  @override
  String get mireVideoTypeColorBars => 'Barres + rampes + cercles';

  @override
  String get mireVideoTypeUniformity => 'Uniformité + cercles';

  @override
  String get mireVideoTypeCheckerboard => 'Damier + cercles';

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
  String get patchPageTitle => 'Patch DMX';

  @override
  String get patchSummaryTitle => 'Résumé';

  @override
  String get patchListTitle => 'Patch';

  @override
  String get patchUniverseLabel => 'Univers DMX :';

  @override
  String get patchUniverseSelected => 'Univers sélectionné';

  @override
  String patchUniverseItem(Object value) {
    return 'Univers $value';
  }

  @override
  String patchFixturesCount(Object count) {
    return 'Projecteurs : $count';
  }

  @override
  String patchChannelsUsed(Object count) {
    return 'Canaux occupés : $count / 512';
  }

  @override
  String patchConflicts(Object count) {
    return 'Conflits : $count canal(aux)';
  }

  @override
  String get patchEmptyUniverse => 'Aucune entrée dans cet univers.';

  @override
  String patchModeLabel(Object mode) {
    return 'Mode DMX : $mode';
  }

  @override
  String patchAddressLabel(Object start, Object end) {
    return 'Adresse : $start → $end (unité : canaux DMX)';
  }

  @override
  String get patchConflictShort => 'Conflit DMX';

  @override
  String get patchEditTitle => 'Modifier le patch';

  @override
  String get patchEditModeLabel => 'Mode DMX (libellé)';

  @override
  String get patchEditChannelsLabel => 'Nombre de canaux (unité : canaux DMX)';

  @override
  String get patchEditHint =>
      'Astuce : saisis le nombre de canaux du mode constructeur (ex : 26).';

  @override
  String get patchInvalidChannelCount => 'Nombre de canaux invalide.';

  @override
  String get patchConflictError =>
      'Impossible : conflit DMX ou valeurs invalides.';

  @override
  String get patchHomeTitle => 'Patch DMX';

  @override
  String get patchHomeImportMvrTitle => 'Importer un fichier MVR';

  @override
  String get patchHomeImportMvrDescription =>
      'Charger un fichier MVR depuis l’appareil et afficher un résumé clair sous forme de tableur.';

  @override
  String get patchHomeViewPatchTitle => 'Voir le patch actuel';

  @override
  String get patchHomeViewPatchDescription =>
      'Afficher l’univers DMX, les canaux occupés et les projecteurs patchés.';

  @override
  String get patchHomeDisclaimer =>
      'Import MVR : lecture indicative. Vérifie toujours le patch final.';

  @override
  String get patchHubTitle => 'Patch / MVR';

  @override
  String get patchHubWorksiteTitle => 'Mode chantier';

  @override
  String get patchHubWorksiteBody =>
      'Lecture seule : le MVR est chargé comme référence.\nAucune modification d’adresses n’est possible dans l’application.';

  @override
  String get patchHubOpenMvrButton => 'Charger / consulter un fichier MVR';

  @override
  String get patchHubOpenGridButton => 'Voir la place disponible (grille DMX)';

  @override
  String get patchHubStateTitle => 'État';

  @override
  String get patchHubStateEmpty => 'Aucune référence chargée.';

  @override
  String patchHubStateLoaded(Object count) {
    return 'Référence chargée : $count entrée(s), lecture seule.';
  }

  @override
  String get patchIssueInvalidUniverse =>
      'L’univers doit être supérieur ou égal à 1.';

  @override
  String get patchIssueInvalidStartAddress =>
      'L’adresse DMX doit être comprise entre 1 et 512.';

  @override
  String get patchIssueInvalidChannelCount =>
      'Le nombre de canaux doit être supérieur ou égal à 1.';

  @override
  String get patchIssueRangeExceedsUniverse =>
      'La plage de canaux dépasse 512 dans cet univers.';

  @override
  String get patchIssueUnknown => 'Erreur de validation inconnue.';

  @override
  String get patchManualTitle => 'Patch manuel';

  @override
  String get patchManualDisabledTitle => 'Fonction désactivée';

  @override
  String get patchManualDisabledBody =>
      'Le patch manuel est désactivé pour le mode chantier.\nUtilise uniquement l’import MVR et la vue patch.';

  @override
  String get patchMvrTitle => 'Importer un fichier MVR';

  @override
  String get patchMvrClearTooltip => 'Effacer l’import mémorisé';

  @override
  String get patchMvrFileCardTitle => 'Fichier MVR';

  @override
  String get patchMvrFileCardHelp =>
      'Charge un fichier MVR depuis l’appareil. Les données sont mémorisées automatiquement.';

  @override
  String get patchMvrButtonAnalyzing => 'Analyse en cours…';

  @override
  String get patchMvrButtonPickFile => 'Charger un fichier MVR';

  @override
  String get patchMvrButtonLoadAsReference =>
      'Charger comme référence de patch (lecture seule)';

  @override
  String get patchMvrSummaryTitle => 'Résumé (persistant)';

  @override
  String get patchMvrColumnsHint =>
      'Colonnes : ID, Nom machine, Univers, Adresse DMX, Canaux.';

  @override
  String get patchMvrFilterUniverseLabel => 'Filtrer par univers';

  @override
  String get patchMvrFilterAllUniverses => 'Tous les univers';

  @override
  String patchMvrUniverseItem(Object u) {
    return 'Univers $u';
  }

  @override
  String get patchMvrSortByLabel => 'Trier par';

  @override
  String get patchMvrSortId => 'ID';

  @override
  String get patchMvrSortName => 'Nom de machine';

  @override
  String get patchMvrSortUniverse => 'Univers';

  @override
  String get patchMvrSortAddress => 'Adresse DMX';

  @override
  String get patchMvrSortChannels => 'Canaux';

  @override
  String get patchMvrSortUniverseThenAddress => 'Univers + Adresse DMX';

  @override
  String get patchMvrOrderLabel => 'Ordre';

  @override
  String get patchMvrOrderAsc => 'Croissant';

  @override
  String get patchMvrOrderDesc => 'Décroissant';

  @override
  String get patchMvrColId => 'ID';

  @override
  String get patchMvrColName => 'Nom machine';

  @override
  String get patchMvrColUniverse => 'Univers';

  @override
  String get patchMvrColAddress => 'Adresse DMX';

  @override
  String get patchMvrColChannels => 'Canaux';

  @override
  String get patchMvrModeNotProvided => 'Mode non renseigné (MVR)';

  @override
  String patchMvrStatusRestored(Object count) {
    return 'ℹ️ Import MVR restauré ($count lignes).';
  }

  @override
  String get patchMvrStatusCleared => 'Import MVR effacé.';

  @override
  String get patchMvrStatusSelectingFile => 'Sélection du fichier…';

  @override
  String patchMvrStatusFilePickFailed(Object error) {
    return '❌ Sélection de fichier impossible : $error';
  }

  @override
  String get patchMvrStatusNoFileSelected => '❌ Aucun fichier sélectionné.';

  @override
  String patchMvrStatusUnsupportedFile(Object name) {
    return '❌ Fichier non supporté.\nSélectionne un fichier avec l’extension .mvr.\nFichier choisi : $name';
  }

  @override
  String get patchMvrStatusEmptyBytes =>
      '❌ Impossible de lire le fichier (bytes vides).\nAstuce : réessaie en sélectionnant le fichier depuis un gestionnaire de fichiers.';

  @override
  String get patchMvrStatusExtractingZip => 'Extraction MVR (archive ZIP)…';

  @override
  String get patchMvrStatusSceneXmlNotFound =>
      '❌ Fichier MVR invalide : XML de scène introuvable.\nAttendu : GeneralSceneDescription.xml (prioritaire) ou Scene.mvr.';

  @override
  String get patchMvrStatusLoadingGdtf => 'Chargement des fichiers GDTF…';

  @override
  String get patchMvrStatusParsingContent => 'Analyse du contenu MVR…';

  @override
  String get patchMvrStatusNoUsableFixtures =>
      '❌ Aucun projecteur exploitable trouvé.';

  @override
  String patchMvrStatusFixturesFound(Object count, Object resolved) {
    return '✅ $count projecteurs trouvés.\nFootprints via GDTF : $resolved';
  }

  @override
  String patchMvrStatusParseError(Object error) {
    return '❌ Erreur parsing MVR : $error';
  }

  @override
  String get patchMvrStatusNoContentToLoad => '❌ Aucun contenu MVR à charger.';

  @override
  String patchMvrStatusReferenceLoaded(
      Object loaded, Object skipped, Object footprints) {
    return '✅ Référence patch chargée (lecture seule)\nEntrées chargées : $loaded\nIgnorées (univers/adresse manquants) : $skipped\nFootprints via GDTF : $footprints\n\nAucune modification n’a été appliquée aux adresses du MVR.';
  }

  @override
  String get commonOk => 'OK';

  @override
  String get patchUniverseAppBarTitle => 'Patch';

  @override
  String get patchUniverseResetTooltip => 'Réinitialiser la référence';

  @override
  String get patchUniverseReferenceTitle => 'Référence';

  @override
  String get patchUniverseReferenceReadOnly => 'Lecture seule (depuis MVR)';

  @override
  String get patchUniverseReferenceNone => 'Aucune référence chargée';

  @override
  String get patchUniverseUniverseTitle => 'Univers';

  @override
  String get patchUniverseUniverseDropdownLabel => 'Univers DMX';

  @override
  String patchUniverseUniverseItem(int value) {
    return 'Univers $value';
  }

  @override
  String patchUniverseOccupiedCount(int count) {
    return 'Occupés : $count / 512';
  }

  @override
  String patchUniverseConflictCount(int count) {
    return 'Conflits : $count canal(aux)';
  }

  @override
  String get patchUniverseTapHint => 'Touche une case pour afficher le détail.';

  @override
  String get patchUniverseZoomTitle => 'Zoom';

  @override
  String get patchUniverseZoomOut => 'Réduire';

  @override
  String get patchUniverseZoomIn => 'Agrandir';

  @override
  String get patchUniverseGridTitle => 'Occupation (1 à 512)';

  @override
  String get patchUniverseGridLimitedByWidth =>
      'Limité par la largeur de l’écran.';

  @override
  String get patchUniverseLegendFree => 'Libre';

  @override
  String get patchUniverseLegendOccupied => 'Occupé';

  @override
  String get patchUniverseLegendConflict => 'Conflit';

  @override
  String get patchUniverseResetTitle => 'Réinitialiser la référence ?';

  @override
  String get patchUniverseResetContent =>
      'Cela efface le patch chargé depuis le MVR dans l’application.\nAucune donnée du fichier n’est modifiée.';

  @override
  String get patchUniverseResetConfirm => 'Réinitialiser';

  @override
  String get patchUniversePopupTitleFree => 'Canal libre';

  @override
  String get patchUniversePopupTitleOccupied => 'Canal occupé';

  @override
  String get patchUniversePopupTitleConflict => 'Conflit';

  @override
  String get patchUniverseStateFree => 'Libre';

  @override
  String get patchUniverseStateOccupied => 'Occupé';

  @override
  String get patchUniverseStateConflict => 'Conflit';

  @override
  String patchUniversePopupHeader(int universe, int address, String state) {
    return 'Univers : $universe\nAdresse : $address\nÉtat : $state';
  }

  @override
  String get patchUniversePopupManyOccupants =>
      'Plusieurs machines occupent ce canal.';

  @override
  String patchUniversePopupMore(int count) {
    return '… et $count autre(s).';
  }

  @override
  String patchUniverseOccupantLine(
      String fixture, String mode, int channels, int start, int end) {
    return '• $fixture\n  $mode — $channels canal(aux)\n  $start → $end';
  }

  @override
  String get commonClose => 'Fermer';

  @override
  String get commonContinue => 'Continuer';

  @override
  String get patchTitle => 'Patch DMX';

  @override
  String get patchReference => 'Référence';

  @override
  String get patchReadOnly => 'Lecture seule (depuis MVR)';

  @override
  String get patchNoReference => 'Aucune référence chargée';

  @override
  String get patchUniverse => 'Univers DMX';

  @override
  String patchOccupied(Object count) {
    return 'Occupés : $count / 512';
  }

  @override
  String get patchResetReferenceTitle => 'Réinitialiser la référence ?';

  @override
  String get patchResetReferenceText =>
      'Cela efface le patch chargé depuis le MVR dans l’application.\nAucune donnée du fichier n’est modifiée.';

  @override
  String get patchLoadReference =>
      'Charger comme référence de patch (lecture seule)';

  @override
  String get laserLegalDisclaimerTextLong =>
      'AVERTISSEMENT LÉGAL ET CLAUSE DE NON-RESPONSABILITÉ\n\nL\'utilisation de ce calculateur est strictement réservée à titre informatif et indicatif.\nLes résultats obtenus ne constituent pas une expertise technique et ne sauraient engager la responsabilité de l\'éditeur en cas d\'erreur de calcul, d\'omission ou d\'accident survenus lors de l\'installation ou de l\'exploitation du matériel.\n\nCalculs NOHD et Instruments Optiques :\nDans certaines circonstances, des instruments optiques spéciaux (jumelles, télescopes) peuvent être utilisés pour visualiser le laser à une distance plus éloignée.\nCe fait doit être pris en compte lors de la détermination du NOHD.\nDans le calcul ci-joint, aucun instrument optique n\'est pris en compte, car il est très peu probable que cela doive être pris en compte dans l\'industrie courante du laser.\nCependant, il incombe à l\'opérateur de procéder à une évaluation appropriée des risques pour la sécurité.\n\nZones d\'Interférence Visuelle (SZED et CZED) :\nLes calculs des distances SZED (aveuglement temporaire) et CZED (éblouissement) sont basés sur des seuils d\'éclairement énergétique standards pour la vision humaine.\nCes valeurs ne sont valables que pour un observateur dont l\'œil est adapté à l\'obscurité (conditions de spectacle).\nCes résultats ne tiennent pas compte des conditions atmosphériques (brume, pluie, pollution) qui peuvent réduire ou diffuser la portée théorique du faisceau.\n\nParamètres Techniques :\nLe calculateur n\'est applicable que pour les sources laser en mode continu (CW) et n\'est valable que pour la plage de longueur d\'onde de 400 à 700 nm – paramètres standards pour les systèmes laser de spectacle.\n\nAcceptation des Risques :\nCe calculateur est fourni \"tel quel\".\nNous ne garantissons pas l\'exactitude et la précision des résultats.\nEn activant cet outil, l\'utilisateur reconnaît être un professionnel formé aux règles de sécurité en vigueur et accepte l\'entière responsabilité des risques liés à la mise en œuvre des équipements (laser, lumière, vidéo).\nVérifiez systématiquement les données avec les manuels constructeurs officiels.';

  @override
  String get commonDash => '—';
}
