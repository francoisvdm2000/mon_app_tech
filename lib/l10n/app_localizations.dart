import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('nl'),
    Locale('pt')
  ];

  /// No description provided for @appTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mon App Tech'**
  String get appTitle;

  /// No description provided for @homeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Accueil'**
  String get homeTitle;

  /// No description provided for @menuTitle.
  ///
  /// In fr, this message translates to:
  /// **'Menu'**
  String get menuTitle;

  /// No description provided for @settings.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In fr, this message translates to:
  /// **'Langue'**
  String get language;

  /// No description provided for @languageSystem.
  ///
  /// In fr, this message translates to:
  /// **'Système (automatique)'**
  String get languageSystem;

  /// No description provided for @languageSystemCurrent.
  ///
  /// In fr, this message translates to:
  /// **'Langue du téléphone'**
  String get languageSystemCurrent;

  /// No description provided for @legalNotices.
  ///
  /// In fr, this message translates to:
  /// **'Mentions légales'**
  String get legalNotices;

  /// No description provided for @resetConsents.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser consentements'**
  String get resetConsents;

  /// No description provided for @consentsReset.
  ///
  /// In fr, this message translates to:
  /// **'Consentements réinitialisés.'**
  String get consentsReset;

  /// No description provided for @homeVideoTitle.
  ///
  /// In fr, this message translates to:
  /// **'Vidéo'**
  String get homeVideoTitle;

  /// No description provided for @homeVideoSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Lentille & mesure, luminosité, multiprojecteur, LED et mires.'**
  String get homeVideoSubtitle;

  /// No description provided for @homeLightTitle.
  ///
  /// In fr, this message translates to:
  /// **'Lumière'**
  String get homeLightTitle;

  /// No description provided for @homeLightSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Taille de projection, dip-switch DMX, photométrie, catalogue, patch DMX.'**
  String get homeLightSubtitle;

  /// No description provided for @homeLaserTitle.
  ///
  /// In fr, this message translates to:
  /// **'Laser'**
  String get homeLaserTitle;

  /// No description provided for @homeLaserSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Calculs et sécurité laser (consentement requis à chaque entrée).'**
  String get homeLaserSubtitle;

  /// No description provided for @homeReferencesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Références'**
  String get homeReferencesTitle;

  /// No description provided for @homeReferencesSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'DMX / réseau / vidéo : fiches & repères terrain.'**
  String get homeReferencesSubtitle;

  /// No description provided for @disclaimerTitle.
  ///
  /// In fr, this message translates to:
  /// **'⚠️ AVERTISSEMENT LÉGAL & NON-RESPONSABILITÉ'**
  String get disclaimerTitle;

  /// No description provided for @disclaimerText.
  ///
  /// In fr, this message translates to:
  /// **'UTILISATION À TITRE INDICATIF UNIQUEMENT\n\nLes calculs fournis par cette application (vidéo, lumière, laser) sont donnés à titre informatif et indicatif.\nIls ne remplacent en aucun cas :\n- des calculs certifiés,\n- des études techniques,\n- les normes officielles en vigueur,\n- ni la validation par un professionnel qualifié.\n\nRESPONSABILITÉ\nL’éditeur de cette application ne peut être tenu responsable d’erreurs de calcul, d’omissions, de dommages matériels,\nd’accidents corporels, ou de tout incident survenant lors de l’installation, de l’exploitation ou de l’utilisation des équipements.\n\nVIDÉO & PROJECTION\nLes résultats (tailles, ratios, luminosité, overlaps, etc.) reposent sur des modèles théoriques et peuvent varier selon :\noptique, zoom, uniformité, environnement lumineux, support, réglages, etc.\nToujours vérifier avec les documentations constructeur officielles.\n\nLUMIÈRE\nLes calculs sont indicatifs et ne tienent pas compte de toutes les conditions réelles (tolérances, pertes optiques,\ndégradation des sources, normes locales, conditions ambiantes…).\n\nLASER – SÉCURITÉ\nLes calculs NOHD, SZED et CZED sont basés sur des hypothèses standards et des seuils théoriques.\nIls ne prennent pas en compte notamment :\n- instruments optiques (jumelles, caméras, télescopes…),\n- conditions atmosphériques (brouillard, pluie, poussière…),\n- réflexions imprévues, usages détournés, réglages spécifiques.\nL’utilisation d’un système laser implique une responsabilité directe de l’opérateur et une analyse de risques adaptée.\n\nACCEPTATION DES RISQUES\nEn utilisant cette application, l’utilisateur reconnaît :\n- avoir pris connaissance des règles de sécurité applicables,\n- être seul responsable de ses installations,\n- assumer l’entière responsabilité des risques liés à l’utilisation des équipements (vidéo, lumière, laser),\n- vérifier systématiquement les données avec les manuels constructeurs officiels.'**
  String get disclaimerText;

  /// No description provided for @disclaimerCertify.
  ///
  /// In fr, this message translates to:
  /// **'Je certifie avoir lu et accepté ces conditions.'**
  String get disclaimerCertify;

  /// No description provided for @disclaimerAccept.
  ///
  /// In fr, this message translates to:
  /// **'J\'accepte'**
  String get disclaimerAccept;

  /// No description provided for @laserConsentTitle.
  ///
  /// In fr, this message translates to:
  /// **'🔴 CONSENTEMENT LASER (OBLIGATOIRE)'**
  String get laserConsentTitle;

  /// No description provided for @laserConsentText.
  ///
  /// In fr, this message translates to:
  /// **'ACCÈS À LA PARTIE LASER\n\nLa partie LASER de cette application concerne des calculs de sécurité (ex : NOHD, SZED, CZED).\nCes calculs sont indicatifs et ne remplacent pas :\n- une analyse de risques,\n- les normes en vigueur,\n- les procédures d’exploitation,\n- ni la validation par une personne qualifiée.\n\nIMPORTANT\n- Risque de lésions oculaires / cutanées en cas de mauvaise utilisation.\n- Le calcul peut être faux si les paramètres entrés sont incomplets, erronés ou si le contexte réel diffère (optique,\n  conditions atmosphériques, réflexions, alignement, etc.).\n- L’opérateur est seul responsable de l’installation, de l’exploitation et de la conformité.\n\nEn validant, vous confirmez :\n- comprendre les risques,\n- respecter les règles de sécurité applicables,\n- assumer l’entière responsabilité en cas de négligence ou mauvaise utilisation.'**
  String get laserConsentText;

  /// No description provided for @commonCancel.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get commonCancel;

  /// No description provided for @commonSave.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer'**
  String get commonSave;

  /// No description provided for @commonRename.
  ///
  /// In fr, this message translates to:
  /// **'Renommer'**
  String get commonRename;

  /// No description provided for @commonSearch.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher'**
  String get commonSearch;

  /// No description provided for @commonNone.
  ///
  /// In fr, this message translates to:
  /// **'Aucun enregistrement'**
  String get commonNone;

  /// No description provided for @commonCalculate.
  ///
  /// In fr, this message translates to:
  /// **'Calculer'**
  String get commonCalculate;

  /// No description provided for @commonCopyResultTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Copier le résultat'**
  String get commonCopyResultTooltip;

  /// No description provided for @commonUnitMeter.
  ///
  /// In fr, this message translates to:
  /// **'m'**
  String get commonUnitMeter;

  /// No description provided for @commonReset.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser'**
  String get commonReset;

  /// No description provided for @commonOkWithCheck.
  ///
  /// In fr, this message translates to:
  /// **'OK ✅'**
  String get commonOkWithCheck;

  /// No description provided for @commonTooLowWithCross.
  ///
  /// In fr, this message translates to:
  /// **'Trop faible ❌'**
  String get commonTooLowWithCross;

  /// No description provided for @lightProjectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Taille de projection'**
  String get lightProjectionTitle;

  /// No description provided for @lightProjectionDescription.
  ///
  /// In fr, this message translates to:
  /// **'Calcul indicatif de la taille de tache selon l’angle, la distance et le diamètre.'**
  String get lightProjectionDescription;

  /// No description provided for @lightDmxSwitchTitle.
  ///
  /// In fr, this message translates to:
  /// **'Dip-switch DMX'**
  String get lightDmxSwitchTitle;

  /// No description provided for @lightDmxSwitchDescription.
  ///
  /// In fr, this message translates to:
  /// **'Conversion indicative entre adresse DMX et interrupteurs, avec navigation par intervalle.'**
  String get lightDmxSwitchDescription;

  /// No description provided for @lightPhotometryTitle.
  ///
  /// In fr, this message translates to:
  /// **'Photométrie'**
  String get lightPhotometryTitle;

  /// No description provided for @lightPhotometryDescription.
  ///
  /// In fr, this message translates to:
  /// **'Conversions indicatives entre lux, candela et lumen, avec distance et angle.'**
  String get lightPhotometryDescription;

  /// No description provided for @lightCatalogTitle.
  ///
  /// In fr, this message translates to:
  /// **'Catalogue'**
  String get lightCatalogTitle;

  /// No description provided for @lightCatalogDescription.
  ///
  /// In fr, this message translates to:
  /// **'Sélection par constructeur, type et produit, avec informations et manuel.'**
  String get lightCatalogDescription;

  /// No description provided for @lightPatchTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch DMX'**
  String get lightPatchTitle;

  /// No description provided for @lightPatchDescription.
  ///
  /// In fr, this message translates to:
  /// **'Importer ou visualiser un fichier MVR.'**
  String get lightPatchDescription;

  /// No description provided for @lightDisclaimerShort.
  ///
  /// In fr, this message translates to:
  /// **'Outils indicatifs. Vérifie toujours la documentation constructeur.'**
  String get lightDisclaimerShort;

  /// No description provided for @laserInputsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Entrées'**
  String get laserInputsTitle;

  /// No description provided for @laserPowerLabel.
  ///
  /// In fr, this message translates to:
  /// **'Puissance (mW)'**
  String get laserPowerLabel;

  /// No description provided for @laserPowerHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 5000'**
  String get laserPowerHint;

  /// No description provided for @laserDivergenceLabel.
  ///
  /// In fr, this message translates to:
  /// **'Divergence (mrad)'**
  String get laserDivergenceLabel;

  /// No description provided for @laserDivergenceHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1.2'**
  String get laserDivergenceHint;

  /// No description provided for @laserDiameterLabel.
  ///
  /// In fr, this message translates to:
  /// **'Diamètre de sortie (mm)'**
  String get laserDiameterLabel;

  /// No description provided for @laserDiameterHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 3.0'**
  String get laserDiameterHint;

  /// No description provided for @laserSaveCurrentProjector.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer ce projecteur'**
  String get laserSaveCurrentProjector;

  /// No description provided for @laserSafetyResultsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Résultats de sécurité'**
  String get laserSafetyResultsTitle;

  /// No description provided for @laserZoneNohdDesc.
  ///
  /// In fr, this message translates to:
  /// **'Danger oculaire'**
  String get laserZoneNohdDesc;

  /// No description provided for @laserZoneSzedDesc.
  ///
  /// In fr, this message translates to:
  /// **'Zone sensible'**
  String get laserZoneSzedDesc;

  /// No description provided for @laserZoneCzedDesc.
  ///
  /// In fr, this message translates to:
  /// **'Zone critique'**
  String get laserZoneCzedDesc;

  /// No description provided for @laserTargetDistanceLabel.
  ///
  /// In fr, this message translates to:
  /// **'Distance cible (m)'**
  String get laserTargetDistanceLabel;

  /// No description provided for @laserTargetDistanceHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 10'**
  String get laserTargetDistanceHint;

  /// No description provided for @laserAdviceFullPower.
  ///
  /// In fr, this message translates to:
  /// **'Pleine puissance autorisée (100 %)'**
  String get laserAdviceFullPower;

  /// No description provided for @laserAdviceMaxRecommended.
  ///
  /// In fr, this message translates to:
  /// **'Puissance maximale conseillée : {percent}'**
  String laserAdviceMaxRecommended(Object percent);

  /// No description provided for @laserSavedProjectorsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Projecteurs enregistrés'**
  String get laserSavedProjectorsTitle;

  /// No description provided for @laserSearchHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: “RGB 5W”'**
  String get laserSearchHint;

  /// No description provided for @laserPresetSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'P: {p} mW • Div: {div} mrad • Ø: {diam} mm'**
  String laserPresetSubtitle(Object p, Object div, Object diam);

  /// No description provided for @laserSaveProjectorTitle.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer un projecteur'**
  String get laserSaveProjectorTitle;

  /// No description provided for @laserRenameProjectorTitle.
  ///
  /// In fr, this message translates to:
  /// **'Renommer le projecteur'**
  String get laserRenameProjectorTitle;

  /// No description provided for @laserProjectorNameLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nom du projecteur'**
  String get laserProjectorNameLabel;

  /// No description provided for @laserInvalidInputs.
  ///
  /// In fr, this message translates to:
  /// **'Veuillez entrer une puissance, une divergence et un diamètre valides.'**
  String get laserInvalidInputs;

  /// No description provided for @laserPresetAdded.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrement ajouté.'**
  String get laserPresetAdded;

  /// No description provided for @laserPresetDeleted.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrement supprimé.'**
  String get laserPresetDeleted;

  /// No description provided for @laserNameUpdated.
  ///
  /// In fr, this message translates to:
  /// **'Nom mis à jour.'**
  String get laserNameUpdated;

  /// No description provided for @laserNormativeParamsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres de sécurité retenus'**
  String get laserNormativeParamsTitle;

  /// No description provided for @laserNormativeParamsBody.
  ///
  /// In fr, this message translates to:
  /// **'MPE pour la distance nominale de danger oculaire (NOHD) : 25,4 W/m²\n(Norme IEC 60825-1, édition 3.0)\n\nMPE pour la distance d’exposition de la zone sensible (SZED) : 1 W/m²\n(Norme ANSI Z136.6)\n\nMPE pour la distance d’exposition de la zone critique (CZED) : 0,05 W/m²\n(Norme ANSI Z136.6)'**
  String get laserNormativeParamsBody;

  /// No description provided for @laserDisclaimerShort.
  ///
  /// In fr, this message translates to:
  /// **'Calcul indicatif. Ne remplace pas une analyse de sécurité laser.'**
  String get laserDisclaimerShort;

  /// No description provided for @aboutDmxTitle.
  ///
  /// In fr, this message translates to:
  /// **'DMX — fonctionnement (simple & complet)'**
  String get aboutDmxTitle;

  /// No description provided for @aboutDmxSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Univers, adresses, trames, câblage RS-485, terminaison, erreurs terrain.\nInclut schémas + checklist.'**
  String get aboutDmxSubtitle;

  /// No description provided for @aboutArtNetTitle.
  ///
  /// In fr, this message translates to:
  /// **'Art-Net — DMX sur IP (nodes, unicast/broadcast)'**
  String get aboutArtNetTitle;

  /// No description provided for @aboutArtNetSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Univers DMX sur Ethernet/UDP, nodes, broadcast vs unicast.\nLimites réelles, stabilité réseau, RDM selon matériel.'**
  String get aboutArtNetSubtitle;

  /// No description provided for @aboutSacnTitle.
  ///
  /// In fr, this message translates to:
  /// **'sACN / E1.31 — multicast, IGMP, priorités'**
  String get aboutSacnTitle;

  /// No description provided for @aboutSacnSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Standard DMX sur IP orienté réseau “pro”.\nMulticast/unicast, IGMP snooping/querier, priorités multi-sources.'**
  String get aboutSacnSubtitle;

  /// No description provided for @aboutIpBasicsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réseau — bases IP / masque / DHCP (essentiel)'**
  String get aboutIpBasicsTitle;

  /// No description provided for @aboutIpBasicsSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Comprendre IP, masque, passerelle, DHCP vs statique.\nExemples concrets (2.x, 10.x, 192.168.x) + checklist.'**
  String get aboutIpBasicsSubtitle;

  /// No description provided for @aboutLightNetworkTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réseau lumière — VLAN, IGMP, Wi-Fi vs filaire'**
  String get aboutLightNetworkTitle;

  /// No description provided for @aboutLightNetworkSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Architecture simple et robuste pour Art-Net/sACN.\nVLAN, IGMP snooping/querier, Wi-Fi (jitter), switchs, schémas + checklist.'**
  String get aboutLightNetworkSubtitle;

  /// No description provided for @aboutCablingFiberTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réseau — RJ45 / Fibre / débits & longueurs'**
  String get aboutCablingFiberTitle;

  /// No description provided for @aboutCablingFiberSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Cat5e→Cat8, fibre OM3/OM4/OS2, LC/SC/MPO, distances typiques, bonnes pratiques show.'**
  String get aboutCablingFiberSubtitle;

  /// No description provided for @aboutVideoTitle.
  ///
  /// In fr, this message translates to:
  /// **'Vidéo — SDI / NDI / IP (SRT/RTMP)'**
  String get aboutVideoTitle;

  /// No description provided for @aboutVideoSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Choisir selon latence, fiabilité, câblage, réseau LAN vs WAN.\nTableaux + schéma.'**
  String get aboutVideoSubtitle;

  /// No description provided for @aboutElectricityTitle.
  ///
  /// In fr, this message translates to:
  /// **'Électrique — Schuko / P17 / puissances'**
  String get aboutElectricityTitle;

  /// No description provided for @aboutElectricitySubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Connecteurs, mono/tri, tableaux kW rapides (16A→400A), pièges terrain.'**
  String get aboutElectricitySubtitle;

  /// No description provided for @aboutComputingTitle.
  ///
  /// In fr, this message translates to:
  /// **'Informatique — USB / HDMI / DP / SATA / NVMe…'**
  String get aboutComputingTitle;

  /// No description provided for @aboutComputingSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Débits utiles, versions, limites réelles, pièges marketing.'**
  String get aboutComputingSubtitle;

  /// No description provided for @videoTitle.
  ///
  /// In fr, this message translates to:
  /// **'Vidéo'**
  String get videoTitle;

  /// No description provided for @videoToolsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Outils vidéo'**
  String get videoToolsTitle;

  /// No description provided for @videoDisclaimerShort.
  ///
  /// In fr, this message translates to:
  /// **'Calculs indicatifs. Vérifie toujours la documentation constructeur.'**
  String get videoDisclaimerShort;

  /// No description provided for @videoLensMeasureTitle.
  ///
  /// In fr, this message translates to:
  /// **'Lentille & mesure'**
  String get videoLensMeasureTitle;

  /// No description provided for @videoLensMeasureSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Ratio / largeur / hauteur (calculs 1 à 3).'**
  String get videoLensMeasureSubtitle;

  /// No description provided for @videoBrightnessTitle.
  ///
  /// In fr, this message translates to:
  /// **'Luminosité'**
  String get videoBrightnessTitle;

  /// No description provided for @videoBrightnessSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Lux / nits / ft-L + seuil (calcul 4).'**
  String get videoBrightnessSubtitle;

  /// No description provided for @videoMultiprojectorTitle.
  ///
  /// In fr, this message translates to:
  /// **'Multiprojecteur'**
  String get videoMultiprojectorTitle;

  /// No description provided for @videoMultiprojectorSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Overlap + largeur/projo + nombre de projos (calculs 5 & 6).'**
  String get videoMultiprojectorSubtitle;

  /// No description provided for @videoLedTitle.
  ///
  /// In fr, this message translates to:
  /// **'LED'**
  String get videoLedTitle;

  /// No description provided for @videoLedSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Pixels du mur LED selon taille, pitch, dimension des tiles.'**
  String get videoLedSubtitle;

  /// No description provided for @videoTestPatternTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mire'**
  String get videoTestPatternTitle;

  /// No description provided for @videoTestPatternSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Création de mire vidéo pour écran et mur LED (à faire après).'**
  String get videoTestPatternSubtitle;

  /// No description provided for @videoMpFormatLabel.
  ///
  /// In fr, this message translates to:
  /// **'Format (ratio)'**
  String get videoMpFormatLabel;

  /// No description provided for @videoMpCalc5Title.
  ///
  /// In fr, this message translates to:
  /// **'Calcul 5 — Largeur par projecteur'**
  String get videoMpCalc5Title;

  /// No description provided for @videoMpCalc6Title.
  ///
  /// In fr, this message translates to:
  /// **'Calcul 6 — Nombre de projecteurs (ratio min/max)'**
  String get videoMpCalc6Title;

  /// No description provided for @videoMpTotalWidthLabel.
  ///
  /// In fr, this message translates to:
  /// **'Largeur totale de projection (m)'**
  String get videoMpTotalWidthLabel;

  /// No description provided for @videoMpTotalWidthHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 18.0'**
  String get videoMpTotalWidthHint;

  /// No description provided for @videoMpDistanceLabel.
  ///
  /// In fr, this message translates to:
  /// **'Distance de projection (m)'**
  String get videoMpDistanceLabel;

  /// No description provided for @videoMpDistanceHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 12.0'**
  String get videoMpDistanceHint;

  /// No description provided for @videoMpOverlapLabel.
  ///
  /// In fr, this message translates to:
  /// **'Overlap (%)'**
  String get videoMpOverlapLabel;

  /// No description provided for @videoMpOverlapHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 10'**
  String get videoMpOverlapHint;

  /// No description provided for @videoMpProjectorCountLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nombre de projecteurs (N)'**
  String get videoMpProjectorCountLabel;

  /// No description provided for @videoMpProjectorCountHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 2'**
  String get videoMpProjectorCountHint;

  /// No description provided for @videoMpRatioMinLabel.
  ///
  /// In fr, this message translates to:
  /// **'Ratio min'**
  String get videoMpRatioMinLabel;

  /// No description provided for @videoMpRatioMinHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1.20'**
  String get videoMpRatioMinHint;

  /// No description provided for @videoMpRatioMaxLabel.
  ///
  /// In fr, this message translates to:
  /// **'Ratio max'**
  String get videoMpRatioMaxLabel;

  /// No description provided for @videoMpRatioMaxHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1.80'**
  String get videoMpRatioMaxHint;

  /// No description provided for @videoMpOptionalLuminanceTitle.
  ///
  /// In fr, this message translates to:
  /// **'Optionnel : luminosité'**
  String get videoMpOptionalLuminanceTitle;

  /// No description provided for @videoMpLumensPerProjectorLabel.
  ///
  /// In fr, this message translates to:
  /// **'Lumens par projecteur'**
  String get videoMpLumensPerProjectorLabel;

  /// No description provided for @videoMpLumensPerProjectorHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 20000'**
  String get videoMpLumensPerProjectorHint;

  /// No description provided for @videoMpGainLabel.
  ///
  /// In fr, this message translates to:
  /// **'Gain'**
  String get videoMpGainLabel;

  /// No description provided for @videoMpGainHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1.0'**
  String get videoMpGainHint;

  /// No description provided for @videoMpErrMissing5.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes : Largeur totale + Overlap% + N.'**
  String get videoMpErrMissing5;

  /// No description provided for @videoMpErrWidthGt0.
  ///
  /// In fr, this message translates to:
  /// **'❌ Largeur totale doit être > 0.'**
  String get videoMpErrWidthGt0;

  /// No description provided for @videoMpErrNGte2.
  ///
  /// In fr, this message translates to:
  /// **'❌ N doit être ≥ 2.'**
  String get videoMpErrNGte2;

  /// No description provided for @videoMpErrOverlapRange.
  ///
  /// In fr, this message translates to:
  /// **'❌ Overlap% doit être entre 0 et 99.9.'**
  String get videoMpErrOverlapRange;

  /// No description provided for @videoMpErrImpossibleDenom.
  ///
  /// In fr, this message translates to:
  /// **'❌ Paramètres impossibles (denom ≤ 0).'**
  String get videoMpErrImpossibleDenom;

  /// No description provided for @videoMpErrMissing6Main.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes : Largeur totale + Distance + Overlap%.'**
  String get videoMpErrMissing6Main;

  /// No description provided for @videoMpErrWidthDistanceGt0.
  ///
  /// In fr, this message translates to:
  /// **'❌ Largeur totale et distance doivent être > 0.'**
  String get videoMpErrWidthDistanceGt0;

  /// No description provided for @videoMpErrMissingRatios.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes : Ratio min et/ou Ratio max.'**
  String get videoMpErrMissingRatios;

  /// No description provided for @videoMpErrInvalidRatio.
  ///
  /// In fr, this message translates to:
  /// **'❌ Ratio invalide (doit être > 0).'**
  String get videoMpErrInvalidRatio;

  /// No description provided for @videoMpLumiOptionalHint.
  ///
  /// In fr, this message translates to:
  /// **'Luminosité (optionnelle) : renseigne Lumens/projo + Gain pour estimer.'**
  String get videoMpLumiOptionalHint;

  /// No description provided for @videoMpLumiErrLumensGainGt0.
  ///
  /// In fr, this message translates to:
  /// **'Luminosité: ❌ Lumens/projo et gain doivent être > 0.'**
  String get videoMpLumiErrLumensGainGt0;

  /// No description provided for @videoMpCaseOpenMin.
  ///
  /// In fr, this message translates to:
  /// **'Cas ratio plus ouvert (min) = {n} projos | couverture ≈ {coverage} m'**
  String videoMpCaseOpenMin(Object n, Object coverage);

  /// No description provided for @videoMpCaseTightMax.
  ///
  /// In fr, this message translates to:
  /// **'Cas ratio plus serré (max) = {n} projos | couverture ≈ {coverage} m'**
  String videoMpCaseTightMax(Object n, Object coverage);

  /// No description provided for @videoMpLumiEstimated.
  ///
  /// In fr, this message translates to:
  /// **'Luminosité estimée (N={n})\nSurface: {area} m²\nLux eq: {lux}\nNits: {nits} | ft-L: {fl}'**
  String videoMpLumiEstimated(
      Object n, Object area, Object lux, Object nits, Object fl);

  /// No description provided for @videoMpNoteIndicative.
  ///
  /// In fr, this message translates to:
  /// **'Note: estimation indicative.'**
  String get videoMpNoteIndicative;

  /// No description provided for @videoLmFormatLabel.
  ///
  /// In fr, this message translates to:
  /// **'Format (ratio)'**
  String get videoLmFormatLabel;

  /// No description provided for @videoLmCalc1Title.
  ///
  /// In fr, this message translates to:
  /// **'Calcul 1 — Ratio (Distance / Largeur)'**
  String get videoLmCalc1Title;

  /// No description provided for @videoLmCalc2Title.
  ///
  /// In fr, this message translates to:
  /// **'Calcul 2 — Largeur (Distance / Ratio)'**
  String get videoLmCalc2Title;

  /// No description provided for @videoLmCalc3Title.
  ///
  /// In fr, this message translates to:
  /// **'Calcul 3 — Hauteur (Largeur + Format)'**
  String get videoLmCalc3Title;

  /// No description provided for @videoLmDistanceLabel.
  ///
  /// In fr, this message translates to:
  /// **'Distance de projection (m)'**
  String get videoLmDistanceLabel;

  /// No description provided for @videoLmDistanceHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 12.0'**
  String get videoLmDistanceHint;

  /// No description provided for @videoLmImageWidthLabel.
  ///
  /// In fr, this message translates to:
  /// **'Largeur d\'image (m)'**
  String get videoLmImageWidthLabel;

  /// No description provided for @videoLmImageWidthHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 6.0'**
  String get videoLmImageWidthHint;

  /// No description provided for @videoLmThrowRatioLabel.
  ///
  /// In fr, this message translates to:
  /// **'Ratio de projection'**
  String get videoLmThrowRatioLabel;

  /// No description provided for @videoLmThrowRatioHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1.60'**
  String get videoLmThrowRatioHint;

  /// No description provided for @videoLmErrMissingDistanceWidth.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes : Distance + Largeur.'**
  String get videoLmErrMissingDistanceWidth;

  /// No description provided for @videoLmErrMissingDistanceRatio.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes : Distance + Ratio.'**
  String get videoLmErrMissingDistanceRatio;

  /// No description provided for @videoLmErrMissingWidthOnly.
  ///
  /// In fr, this message translates to:
  /// **'❌ Donnée manquante : Largeur.'**
  String get videoLmErrMissingWidthOnly;

  /// No description provided for @videoLmErrWidthGt0.
  ///
  /// In fr, this message translates to:
  /// **'❌ Largeur doit être > 0.'**
  String get videoLmErrWidthGt0;

  /// No description provided for @videoLmErrRatioGt0.
  ///
  /// In fr, this message translates to:
  /// **'❌ Ratio doit être > 0.'**
  String get videoLmErrRatioGt0;

  /// No description provided for @videoLmResultRatio.
  ///
  /// In fr, this message translates to:
  /// **'✅ Ratio de projection = {ratio}'**
  String videoLmResultRatio(Object ratio);

  /// No description provided for @videoLmResultWidth.
  ///
  /// In fr, this message translates to:
  /// **'✅ Largeur image = {width} m'**
  String videoLmResultWidth(Object width);

  /// No description provided for @videoLmResultHeight.
  ///
  /// In fr, this message translates to:
  /// **'✅ Hauteur = {height} m (format {format})'**
  String videoLmResultHeight(Object height, Object format);

  /// No description provided for @videoLedCalcTitle.
  ///
  /// In fr, this message translates to:
  /// **'Calcul — Pixels / tiles'**
  String get videoLedCalcTitle;

  /// No description provided for @videoLedTilesXLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tiles horizontales (X)'**
  String get videoLedTilesXLabel;

  /// No description provided for @videoLedTilesXHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 15'**
  String get videoLedTilesXHint;

  /// No description provided for @videoLedTilesYLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tiles verticales (Y)'**
  String get videoLedTilesYLabel;

  /// No description provided for @videoLedTilesYHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 8'**
  String get videoLedTilesYHint;

  /// No description provided for @videoLedTileWpxLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tile largeur (px)'**
  String get videoLedTileWpxLabel;

  /// No description provided for @videoLedTileWpxHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 128'**
  String get videoLedTileWpxHint;

  /// No description provided for @videoLedTileHpxLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tile hauteur (px)'**
  String get videoLedTileHpxLabel;

  /// No description provided for @videoLedTileHpxHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 128'**
  String get videoLedTileHpxHint;

  /// No description provided for @videoLedTileWcmLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tile largeur (cm)'**
  String get videoLedTileWcmLabel;

  /// No description provided for @videoLedTileWcmHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 33.28'**
  String get videoLedTileWcmHint;

  /// No description provided for @videoLedTileHcmLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tile hauteur (cm)'**
  String get videoLedTileHcmLabel;

  /// No description provided for @videoLedTileHcmHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 33.28'**
  String get videoLedTileHcmHint;

  /// No description provided for @videoLedErrMissingInputs.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes : Tiles X/Y + Tile px + Tile cm.'**
  String get videoLedErrMissingInputs;

  /// No description provided for @videoLedErrAllGt0.
  ///
  /// In fr, this message translates to:
  /// **'❌ Toutes les valeurs doivent être > 0.'**
  String get videoLedErrAllGt0;

  /// No description provided for @videoLedPitchUniform.
  ///
  /// In fr, this message translates to:
  /// **'{value} mm'**
  String videoLedPitchUniform(Object value);

  /// No description provided for @videoLedPitchXY.
  ///
  /// In fr, this message translates to:
  /// **'X {x} mm • Y {y} mm'**
  String videoLedPitchXY(Object x, Object y);

  /// No description provided for @videoLedResult.
  ///
  /// In fr, this message translates to:
  /// **'✅ Résolution mur: {wallWpx} × {wallHpx} px\n✅ Taille mur: {wallWm} × {wallHm} m\nTile: {tileWpx}×{tileHpx} px • {tileWcm}×{tileHcm} cm\nPitch calculé: {pitch}'**
  String videoLedResult(
      Object wallWpx,
      Object wallHpx,
      Object wallWm,
      Object wallHm,
      Object tileWpx,
      Object tileHpx,
      Object tileWcm,
      Object tileHcm,
      Object pitch);

  /// No description provided for @videoCalculationsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Calculs vidéo'**
  String get videoCalculationsTitle;

  /// No description provided for @videoCopyAllTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Copier tous les résultats'**
  String get videoCopyAllTooltip;

  /// No description provided for @videoExportPdfTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Exporter PDF'**
  String get videoExportPdfTooltip;

  /// No description provided for @videoCalculateAll.
  ///
  /// In fr, this message translates to:
  /// **'Calculer tout'**
  String get videoCalculateAll;

  /// No description provided for @videoSummaryPillsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Résumé (pastilles)'**
  String get videoSummaryPillsTitle;

  /// No description provided for @videoCopySummaryTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Copier le résumé'**
  String get videoCopySummaryTooltip;

  /// No description provided for @videoCommonParamsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres communs'**
  String get videoCommonParamsTitle;

  /// No description provided for @videoFormatLabel.
  ///
  /// In fr, this message translates to:
  /// **'Format (ratio)'**
  String get videoFormatLabel;

  /// No description provided for @videoDistanceLabel.
  ///
  /// In fr, this message translates to:
  /// **'Distance de projection (m)'**
  String get videoDistanceLabel;

  /// No description provided for @videoDistanceHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 12.0'**
  String get videoDistanceHint;

  /// No description provided for @videoImageWidthLabel.
  ///
  /// In fr, this message translates to:
  /// **'Largeur d\'image (m)'**
  String get videoImageWidthLabel;

  /// No description provided for @videoImageWidthHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 6.0'**
  String get videoImageWidthHint;

  /// No description provided for @videoThrowRatioLabel.
  ///
  /// In fr, this message translates to:
  /// **'Ratio de projection'**
  String get videoThrowRatioLabel;

  /// No description provided for @videoThrowRatioHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1.60'**
  String get videoThrowRatioHint;

  /// No description provided for @videoLumensLabel.
  ///
  /// In fr, this message translates to:
  /// **'Lumens (ANSI)'**
  String get videoLumensLabel;

  /// No description provided for @videoLumensHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 20000'**
  String get videoLumensHint;

  /// No description provided for @videoGainLabel.
  ///
  /// In fr, this message translates to:
  /// **'Gain'**
  String get videoGainLabel;

  /// No description provided for @videoGainHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1.0'**
  String get videoGainHint;

  /// No description provided for @videoScreenPresetLabel.
  ///
  /// In fr, this message translates to:
  /// **'Écran / Support (preset)'**
  String get videoScreenPresetLabel;

  /// No description provided for @videoPresetFrontWhite.
  ///
  /// In fr, this message translates to:
  /// **'Front - écran blanc mat (gain 1.0)'**
  String get videoPresetFrontWhite;

  /// No description provided for @videoPresetFrontGrey.
  ///
  /// In fr, this message translates to:
  /// **'Front - écran gris (gain 0.8)'**
  String get videoPresetFrontGrey;

  /// No description provided for @videoPresetFrontHighGain.
  ///
  /// In fr, this message translates to:
  /// **'Front - écran high gain (gain 1.3)'**
  String get videoPresetFrontHighGain;

  /// No description provided for @videoPresetRearDiffusion.
  ///
  /// In fr, this message translates to:
  /// **'Rétro - toile diffusion (gain 0.7)'**
  String get videoPresetRearDiffusion;

  /// No description provided for @videoPresetRearClear.
  ///
  /// In fr, this message translates to:
  /// **'Rétro - toile claire (gain 0.9)'**
  String get videoPresetRearClear;

  /// No description provided for @videoPresetMappingMatte.
  ///
  /// In fr, this message translates to:
  /// **'Mapping - peinture mate (gain 0.75)'**
  String get videoPresetMappingMatte;

  /// No description provided for @videoPresetMappingSatin.
  ///
  /// In fr, this message translates to:
  /// **'Mapping - peinture satinée (gain 0.9)'**
  String get videoPresetMappingSatin;

  /// No description provided for @videoPresetMappingLightStone.
  ///
  /// In fr, this message translates to:
  /// **'Mapping - pierre claire (gain 0.6)'**
  String get videoPresetMappingLightStone;

  /// No description provided for @videoPresetMappingDarkStone.
  ///
  /// In fr, this message translates to:
  /// **'Mapping - pierre sombre (gain 0.35)'**
  String get videoPresetMappingDarkStone;

  /// No description provided for @videoPresetMappingGlass.
  ///
  /// In fr, this message translates to:
  /// **'Mapping - vitre (gain 0.15)'**
  String get videoPresetMappingGlass;

  /// No description provided for @videoPresetFrontWhiteShort.
  ///
  /// In fr, this message translates to:
  /// **'Front - écran blanc mat'**
  String get videoPresetFrontWhiteShort;

  /// No description provided for @videoPresetFrontGreyShort.
  ///
  /// In fr, this message translates to:
  /// **'Front - écran gris'**
  String get videoPresetFrontGreyShort;

  /// No description provided for @videoPresetFrontHighGainShort.
  ///
  /// In fr, this message translates to:
  /// **'Front - écran high gain'**
  String get videoPresetFrontHighGainShort;

  /// No description provided for @videoPresetRearDiffusionShort.
  ///
  /// In fr, this message translates to:
  /// **'Rétro - toile diffusion'**
  String get videoPresetRearDiffusionShort;

  /// No description provided for @videoPresetRearClearShort.
  ///
  /// In fr, this message translates to:
  /// **'Rétro - toile claire'**
  String get videoPresetRearClearShort;

  /// No description provided for @videoPresetMappingMatteShort.
  ///
  /// In fr, this message translates to:
  /// **'Mapping - peinture mate'**
  String get videoPresetMappingMatteShort;

  /// No description provided for @videoPresetMappingSatinShort.
  ///
  /// In fr, this message translates to:
  /// **'Mapping - peinture satinée'**
  String get videoPresetMappingSatinShort;

  /// No description provided for @videoPresetMappingLightStoneShort.
  ///
  /// In fr, this message translates to:
  /// **'Mapping - pierre claire'**
  String get videoPresetMappingLightStoneShort;

  /// No description provided for @videoPresetMappingDarkStoneShort.
  ///
  /// In fr, this message translates to:
  /// **'Mapping - pierre sombre'**
  String get videoPresetMappingDarkStoneShort;

  /// No description provided for @videoPresetMappingGlassShort.
  ///
  /// In fr, this message translates to:
  /// **'Mapping - vitre'**
  String get videoPresetMappingGlassShort;

  /// No description provided for @videoOverlapLabel.
  ///
  /// In fr, this message translates to:
  /// **'Overlap (%)'**
  String get videoOverlapLabel;

  /// No description provided for @videoOverlapHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 10'**
  String get videoOverlapHint;

  /// No description provided for @videoTotalWidthLabel.
  ///
  /// In fr, this message translates to:
  /// **'Largeur totale de projection (m)'**
  String get videoTotalWidthLabel;

  /// No description provided for @videoTotalWidthHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 18.0'**
  String get videoTotalWidthHint;

  /// No description provided for @videoCalc1Title.
  ///
  /// In fr, this message translates to:
  /// **'Calcul 1 — Ratio (Distance / Largeur)'**
  String get videoCalc1Title;

  /// No description provided for @videoCalc2Title.
  ///
  /// In fr, this message translates to:
  /// **'Calcul 2 — Largeur (Distance / Ratio)'**
  String get videoCalc2Title;

  /// No description provided for @videoCalc3Title.
  ///
  /// In fr, this message translates to:
  /// **'Calcul 3 — Hauteur (Largeur + Format)'**
  String get videoCalc3Title;

  /// No description provided for @videoCalc4Title.
  ///
  /// In fr, this message translates to:
  /// **'Calcul 4 — Luminosité (lux / nits / ft-L + seuil)'**
  String get videoCalc4Title;

  /// No description provided for @videoCalc5Title.
  ///
  /// In fr, this message translates to:
  /// **'Calcul 5 — Overlap (Largeur totale + N)'**
  String get videoCalc5Title;

  /// No description provided for @videoCalc6Title.
  ///
  /// In fr, this message translates to:
  /// **'Calcul 6 — Nb projecteurs auto + luminosité'**
  String get videoCalc6Title;

  /// No description provided for @videoCalc5NLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nombre de projecteurs (N)'**
  String get videoCalc5NLabel;

  /// No description provided for @videoCalc5NHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 2'**
  String get videoCalc5NHint;

  /// No description provided for @videoCalc6RatioMinLabel.
  ///
  /// In fr, this message translates to:
  /// **'Ratio min'**
  String get videoCalc6RatioMinLabel;

  /// No description provided for @videoCalc6RatioMinHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1.20'**
  String get videoCalc6RatioMinHint;

  /// No description provided for @videoCalc6RatioMaxLabel.
  ///
  /// In fr, this message translates to:
  /// **'Ratio max'**
  String get videoCalc6RatioMaxLabel;

  /// No description provided for @videoCalc6RatioMaxHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1.80'**
  String get videoCalc6RatioMaxHint;

  /// No description provided for @videoOptionalBrightnessTitle.
  ///
  /// In fr, this message translates to:
  /// **'Optionnel : luminosité'**
  String get videoOptionalBrightnessTitle;

  /// No description provided for @videoCalc6LumensPerProjectorLabel.
  ///
  /// In fr, this message translates to:
  /// **'Lumens par projecteur'**
  String get videoCalc6LumensPerProjectorLabel;

  /// No description provided for @videoCalc6LumensPerProjectorHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 20000'**
  String get videoCalc6LumensPerProjectorHint;

  /// No description provided for @videoCalc6GainLabel.
  ///
  /// In fr, this message translates to:
  /// **'Gain (calc 6)'**
  String get videoCalc6GainLabel;

  /// No description provided for @videoCalc6GainHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1.0'**
  String get videoCalc6GainHint;

  /// No description provided for @videoCalc1ErrMissing.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes: Distance + Largeur.'**
  String get videoCalc1ErrMissing;

  /// No description provided for @videoCalc2ErrMissing.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes: Distance + Ratio.'**
  String get videoCalc2ErrMissing;

  /// No description provided for @videoCalc3ErrMissingWidth.
  ///
  /// In fr, this message translates to:
  /// **'❌ Donnée manquante: Largeur.'**
  String get videoCalc3ErrMissingWidth;

  /// No description provided for @videoErrWidthGt0.
  ///
  /// In fr, this message translates to:
  /// **'❌ La largeur doit être > 0.'**
  String get videoErrWidthGt0;

  /// No description provided for @videoErrRatioGt0.
  ///
  /// In fr, this message translates to:
  /// **'❌ Le ratio doit être > 0.'**
  String get videoErrRatioGt0;

  /// No description provided for @videoCalc1Ok.
  ///
  /// In fr, this message translates to:
  /// **'✅ Ratio de projection = {ratio}'**
  String videoCalc1Ok(Object ratio);

  /// No description provided for @videoCalc2Ok.
  ///
  /// In fr, this message translates to:
  /// **'✅ Largeur image = {width} m'**
  String videoCalc2Ok(Object width);

  /// No description provided for @videoCalc3Ok.
  ///
  /// In fr, this message translates to:
  /// **'✅ Hauteur = {height} m (format {format})'**
  String videoCalc3Ok(Object height, Object format);

  /// No description provided for @videoCalc4ErrMissing.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes: Lumens + Gain + Largeur.'**
  String get videoCalc4ErrMissing;

  /// No description provided for @videoCalc4ErrGt0.
  ///
  /// In fr, this message translates to:
  /// **'❌ Lumens/Gain/Largeur doivent être > 0.'**
  String get videoCalc4ErrGt0;

  /// No description provided for @videoCalc4Result.
  ///
  /// In fr, this message translates to:
  /// **'Surface: {area} m² (format {format})\nLux (lm/m²): {lux}\nLux eq (gain): {luxEq}\nLuminance: {nits} nits | {fl} ft-L\nSeuil mini ({presetLabel}): {minFl} ft-L → {status}\nNote: conversion nits/ft-L basée sur une hypothèse Lambertienne (approx).'**
  String videoCalc4Result(Object area, Object format, Object lux, Object luxEq,
      Object nits, Object fl, Object presetLabel, Object minFl, Object status);

  /// No description provided for @videoCalc5ErrMissing.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes: Largeur totale + Overlap% + Nombre de projecteurs.'**
  String get videoCalc5ErrMissing;

  /// No description provided for @videoErrTotalWidthGt0.
  ///
  /// In fr, this message translates to:
  /// **'❌ Largeur totale doit être > 0.'**
  String get videoErrTotalWidthGt0;

  /// No description provided for @videoCalc5ErrNMin2.
  ///
  /// In fr, this message translates to:
  /// **'❌ Le nombre de projecteurs doit être ≥ 2.'**
  String get videoCalc5ErrNMin2;

  /// No description provided for @videoErrOverlapRange.
  ///
  /// In fr, this message translates to:
  /// **'❌ Overlap% doit être entre 0 et 99.9.'**
  String get videoErrOverlapRange;

  /// No description provided for @videoErrImpossibleDenom.
  ///
  /// In fr, this message translates to:
  /// **'❌ Paramètres impossibles (denom ≤ 0).'**
  String get videoErrImpossibleDenom;

  /// No description provided for @videoCalc5Result.
  ///
  /// In fr, this message translates to:
  /// **'Largeur totale: {wTot} m\nN: {n} | Overlap: {overlapPct}% (sur largeur projo)\n\n- Largeur par projecteur: {wPer} m\n- Overlap entre 2 projos: {overlapM} m\n- Hauteur totale (format {format}): {hTot} m'**
  String videoCalc5Result(Object wTot, Object n, Object overlapPct, Object wPer,
      Object overlapM, Object format, Object hTot);

  /// No description provided for @videoCalc6ErrMissingBasics.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes: Largeur totale + Distance + Overlap%.'**
  String get videoCalc6ErrMissingBasics;

  /// No description provided for @videoErrTotalWidthAndDistanceGt0.
  ///
  /// In fr, this message translates to:
  /// **'❌ Largeur totale et distance doivent être > 0.'**
  String get videoErrTotalWidthAndDistanceGt0;

  /// No description provided for @videoCalc6ErrMissingRatio.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes: Ratio min et/ou Ratio max.'**
  String get videoCalc6ErrMissingRatio;

  /// No description provided for @videoCalc6LumiOptional.
  ///
  /// In fr, this message translates to:
  /// **'Luminosité (optionnelle): renseigne Lumens/projo + Gain pour l\'estimation.'**
  String get videoCalc6LumiOptional;

  /// No description provided for @videoCalc6LumiErrGt0.
  ///
  /// In fr, this message translates to:
  /// **'Luminosité: ❌ Lumens/projo et gain doivent être > 0.'**
  String get videoCalc6LumiErrGt0;

  /// No description provided for @videoCalc6LumiForN.
  ///
  /// In fr, this message translates to:
  /// **'Luminosité estimée (N={n})\nSurface: {area} m²\nLux eq: {lux} (lm/m²)\nNits: {nits} | ft-L: {fl}'**
  String videoCalc6LumiForN(
      Object n, Object area, Object lux, Object nits, Object fl);

  /// No description provided for @videoCalc6NoteIndicative.
  ///
  /// In fr, this message translates to:
  /// **'Note: estimation indicative (blend/overlap réels peuvent réduire un peu).'**
  String get videoCalc6NoteIndicative;

  /// No description provided for @videoCalc6Result.
  ///
  /// In fr, this message translates to:
  /// **'Largeur totale={wTot} m | Distance={distance} m | Overlap={overlapPct}%\nFormat {format} → Hauteur totale={hTot} m | Surface={area} m²\nRatio min/max: {ratioMin} → {ratioMax}\n\nCas ratio plus ouvert (min) = {nMin} projos | couverture ≈ {covMin} m\n{lumiMin}\n\nCas ratio plus serré (max) = {nMax} projos | couverture ≈ {covMax} m\n{lumiMax}\n\n{note}'**
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
      Object note);

  /// No description provided for @videoCommonPillFormat.
  ///
  /// In fr, this message translates to:
  /// **'Format: {format}'**
  String videoCommonPillFormat(Object format);

  /// No description provided for @videoCommonPillDistance.
  ///
  /// In fr, this message translates to:
  /// **'Distance: {value}'**
  String videoCommonPillDistance(Object value);

  /// No description provided for @videoCommonPillWidth.
  ///
  /// In fr, this message translates to:
  /// **'Largeur: {value}'**
  String videoCommonPillWidth(Object value);

  /// No description provided for @videoCommonPillRatio.
  ///
  /// In fr, this message translates to:
  /// **'Ratio: {value}'**
  String videoCommonPillRatio(Object value);

  /// No description provided for @videoCommonPillHeight.
  ///
  /// In fr, this message translates to:
  /// **'Hauteur: {value}'**
  String videoCommonPillHeight(Object value);

  /// No description provided for @videoCommonPillArea.
  ///
  /// In fr, this message translates to:
  /// **'Surface: {value}'**
  String videoCommonPillArea(Object value);

  /// No description provided for @videoCommonPillTotalWidth.
  ///
  /// In fr, this message translates to:
  /// **'Largeur totale: {value}'**
  String videoCommonPillTotalWidth(Object value);

  /// No description provided for @videoCommonPillOverlap.
  ///
  /// In fr, this message translates to:
  /// **'Overlap: {value}'**
  String videoCommonPillOverlap(Object value);

  /// No description provided for @videoPdfTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mon App Technique – Export Vidéo'**
  String get videoPdfTitle;

  /// No description provided for @videoPdfDate.
  ///
  /// In fr, this message translates to:
  /// **'Date'**
  String get videoPdfDate;

  /// No description provided for @videoPdfFormat.
  ///
  /// In fr, this message translates to:
  /// **'Format'**
  String get videoPdfFormat;

  /// No description provided for @videoPdfDistance.
  ///
  /// In fr, this message translates to:
  /// **'Distance (m)'**
  String get videoPdfDistance;

  /// No description provided for @videoPdfImageWidth.
  ///
  /// In fr, this message translates to:
  /// **'Largeur image (m)'**
  String get videoPdfImageWidth;

  /// No description provided for @videoPdfRatio.
  ///
  /// In fr, this message translates to:
  /// **'Ratio'**
  String get videoPdfRatio;

  /// No description provided for @videoPdfLumens.
  ///
  /// In fr, this message translates to:
  /// **'Lumens'**
  String get videoPdfLumens;

  /// No description provided for @videoPdfGain.
  ///
  /// In fr, this message translates to:
  /// **'Gain'**
  String get videoPdfGain;

  /// No description provided for @videoPdfScreenPreset.
  ///
  /// In fr, this message translates to:
  /// **'Preset écran'**
  String get videoPdfScreenPreset;

  /// No description provided for @videoPdfOverlap.
  ///
  /// In fr, this message translates to:
  /// **'Overlap (%)'**
  String get videoPdfOverlap;

  /// No description provided for @videoPdfTotalWidth.
  ///
  /// In fr, this message translates to:
  /// **'Largeur totale (m)'**
  String get videoPdfTotalWidth;

  /// No description provided for @videoPdfCalc5N.
  ///
  /// In fr, this message translates to:
  /// **'N (calc5)'**
  String get videoPdfCalc5N;

  /// No description provided for @videoPdfCalc6RatioMin.
  ///
  /// In fr, this message translates to:
  /// **'Ratio min (calc6)'**
  String get videoPdfCalc6RatioMin;

  /// No description provided for @videoPdfCalc6RatioMax.
  ///
  /// In fr, this message translates to:
  /// **'Ratio max (calc6)'**
  String get videoPdfCalc6RatioMax;

  /// No description provided for @videoPdfCalc6LumensPerProj.
  ///
  /// In fr, this message translates to:
  /// **'Lumens/projo (calc6)'**
  String get videoPdfCalc6LumensPerProj;

  /// No description provided for @videoPdfCalc6Gain.
  ///
  /// In fr, this message translates to:
  /// **'Gain (calc6)'**
  String get videoPdfCalc6Gain;

  /// No description provided for @videoPdfParams.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres'**
  String get videoPdfParams;

  /// No description provided for @videoPdfResults.
  ///
  /// In fr, this message translates to:
  /// **'Résultats'**
  String get videoPdfResults;

  /// No description provided for @videoPdfCalc1.
  ///
  /// In fr, this message translates to:
  /// **'Calcul 1'**
  String get videoPdfCalc1;

  /// No description provided for @videoPdfCalc2.
  ///
  /// In fr, this message translates to:
  /// **'Calcul 2'**
  String get videoPdfCalc2;

  /// No description provided for @videoPdfCalc3.
  ///
  /// In fr, this message translates to:
  /// **'Calcul 3'**
  String get videoPdfCalc3;

  /// No description provided for @videoPdfCalc4.
  ///
  /// In fr, this message translates to:
  /// **'Calcul 4'**
  String get videoPdfCalc4;

  /// No description provided for @videoPdfCalc5.
  ///
  /// In fr, this message translates to:
  /// **'Calcul 5'**
  String get videoPdfCalc5;

  /// No description provided for @videoPdfCalc6.
  ///
  /// In fr, this message translates to:
  /// **'Calcul 6'**
  String get videoPdfCalc6;

  /// No description provided for @videoCalcLabel.
  ///
  /// In fr, this message translates to:
  /// **'Calcul {n}'**
  String videoCalcLabel(Object n);

  /// No description provided for @videoBrightnessSectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Calcul 4 — Lux / nits / ft-L + seuil'**
  String get videoBrightnessSectionTitle;

  /// No description provided for @videoCalc4ErrMissingSimple.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes : Largeur + Lumens + Gain.'**
  String get videoCalc4ErrMissingSimple;

  /// No description provided for @videoBrightnessResult.
  ///
  /// In fr, this message translates to:
  /// **'Format: {format}\nSurface: {area} m²\nLux (lm/m²): {lux}\nLux eq (gain): {luxEq}\nLuminance: {nits} nits | {fl} ft-L\nSeuil mini ({presetLabel}): {minFl} ft-L → {status}\nNote: estimation indicative (Lambert).'**
  String videoBrightnessResult(
      Object format,
      Object area,
      Object lux,
      Object luxEq,
      Object nits,
      Object fl,
      Object presetLabel,
      Object minFl,
      Object status);

  /// No description provided for @videoMireTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mire'**
  String get videoMireTitle;

  /// No description provided for @videoMireHeaderTitle.
  ///
  /// In fr, this message translates to:
  /// **'Générateur de mires'**
  String get videoMireHeaderTitle;

  /// No description provided for @videoMireHeaderSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Mires indicatives (calage, focus, géométrie, blend, pixel perfect).'**
  String get videoMireHeaderSubtitle;

  /// No description provided for @videoMireScreenVideoTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mire écran vidéo'**
  String get videoMireScreenVideoTitle;

  /// No description provided for @videoMireScreenVideoSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Simple (WxH px) + Mapping multi-projos (N + overlap).'**
  String get videoMireScreenVideoSubtitle;

  /// No description provided for @videoMireScreenLedTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mire écran LED'**
  String get videoMireScreenLedTitle;

  /// No description provided for @videoMireScreenLedSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Mire selon WxH px (pixel perfect, uniformité, grille).'**
  String get videoMireScreenLedSubtitle;

  /// No description provided for @mireVideoSimpleTitle.
  ///
  /// In fr, this message translates to:
  /// **'VIDÉO / MIRE SIMPLE'**
  String get mireVideoSimpleTitle;

  /// No description provided for @mireVideoComboTitle.
  ///
  /// In fr, this message translates to:
  /// **'VIDÉO / MIRE COMBO'**
  String get mireVideoComboTitle;

  /// No description provided for @mireVideoMappingTitle.
  ///
  /// In fr, this message translates to:
  /// **'VIDÉO / MIRE MAPPING'**
  String get mireVideoMappingTitle;

  /// No description provided for @mireLedTitle.
  ///
  /// In fr, this message translates to:
  /// **'LED / MIRE'**
  String get mireLedTitle;

  /// No description provided for @mireLedTilesIdTitle.
  ///
  /// In fr, this message translates to:
  /// **'LED / ID TILES'**
  String get mireLedTilesIdTitle;

  /// No description provided for @mireSimpleSubtitleGridSafe.
  ///
  /// In fr, this message translates to:
  /// **'Grille + safe + cercles'**
  String get mireSimpleSubtitleGridSafe;

  /// No description provided for @mireSimpleSubtitleCheckerboard.
  ///
  /// In fr, this message translates to:
  /// **'Damier + cercles'**
  String get mireSimpleSubtitleCheckerboard;

  /// No description provided for @mireSimpleSubtitleColorBars.
  ///
  /// In fr, this message translates to:
  /// **'Barres + rampes + cercles'**
  String get mireSimpleSubtitleColorBars;

  /// No description provided for @mireSimpleSubtitleUniformity.
  ///
  /// In fr, this message translates to:
  /// **'Uniformité + cercles'**
  String get mireSimpleSubtitleUniformity;

  /// No description provided for @mireSimpleSubtitleComboAll.
  ///
  /// In fr, this message translates to:
  /// **'Grille + safe + 2 barres centrées + cercles'**
  String get mireSimpleSubtitleComboAll;

  /// No description provided for @mireLedSubtitlePixelPerfect.
  ///
  /// In fr, this message translates to:
  /// **'Pixel perfect + cercles'**
  String get mireLedSubtitlePixelPerfect;

  /// No description provided for @mireLedSubtitleGridLabels.
  ///
  /// In fr, this message translates to:
  /// **'Grille + repères + cercles'**
  String get mireLedSubtitleGridLabels;

  /// No description provided for @mireLedSubtitleColorBars.
  ///
  /// In fr, this message translates to:
  /// **'Barres + rampes + cercles'**
  String get mireLedSubtitleColorBars;

  /// No description provided for @mireLedSubtitleUniformity.
  ///
  /// In fr, this message translates to:
  /// **'Uniformité + cercles'**
  String get mireLedSubtitleUniformity;

  /// No description provided for @mireMappingSubtitlePattern.
  ///
  /// In fr, this message translates to:
  /// **'N={n} • Overlap {percent}% • {orient}'**
  String mireMappingSubtitlePattern(Object n, Object orient, Object percent);

  /// No description provided for @mireOrientationHorizontal.
  ///
  /// In fr, this message translates to:
  /// **'Horizontal'**
  String get mireOrientationHorizontal;

  /// No description provided for @mireOrientationVertical.
  ///
  /// In fr, this message translates to:
  /// **'Vertical'**
  String get mireOrientationVertical;

  /// No description provided for @mireProjectorLabelPattern.
  ///
  /// In fr, this message translates to:
  /// **'PROJO {index}'**
  String mireProjectorLabelPattern(Object index);

  /// No description provided for @mireBlendLabel.
  ///
  /// In fr, this message translates to:
  /// **'BLEND'**
  String get mireBlendLabel;

  /// No description provided for @mireTileMissingPx.
  ///
  /// In fr, this message translates to:
  /// **'Renseigne Tile (px) pour numérotation.'**
  String get mireTileMissingPx;

  /// No description provided for @mireWallNotMultipleOfTiles.
  ///
  /// In fr, this message translates to:
  /// **'MUR NON MULTIPLE DE TILES'**
  String get mireWallNotMultipleOfTiles;

  /// No description provided for @mireTilesSubtitleBase.
  ///
  /// In fr, this message translates to:
  /// **'Tile {tw}x{th} px • Grille {nx} x {ny}'**
  String mireTilesSubtitleBase(Object nx, Object ny, Object th, Object tw);

  /// No description provided for @mireTilesSubtitleTilePhys.
  ///
  /// In fr, this message translates to:
  /// **'Tile {wcm}×{hcm} cm'**
  String mireTilesSubtitleTilePhys(Object hcm, Object wcm);

  /// No description provided for @mireTilesSubtitlePitchEq.
  ///
  /// In fr, this message translates to:
  /// **'Pitch ~ {pitch} mm'**
  String mireTilesSubtitlePitchEq(Object pitch);

  /// No description provided for @mireTilesSubtitlePitchXY.
  ///
  /// In fr, this message translates to:
  /// **'Pitch X {px} • Y {py} mm'**
  String mireTilesSubtitlePitchXY(Object px, Object py);

  /// No description provided for @mireTilesSubtitleWallPhys.
  ///
  /// In fr, this message translates to:
  /// **'Mur ~ {wm}×{hm} m'**
  String mireTilesSubtitleWallPhys(Object hm, Object wm);

  /// No description provided for @mireSimpleSectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mire écran simple'**
  String get mireSimpleSectionTitle;

  /// No description provided for @mireMappingSectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mire mapping multi-projecteur'**
  String get mireMappingSectionTitle;

  /// No description provided for @mireVideoSimpleSectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mire écran simple'**
  String get mireVideoSimpleSectionTitle;

  /// No description provided for @mireVideoMappingSectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mire mapping multi-projecteur'**
  String get mireVideoMappingSectionTitle;

  /// No description provided for @mireWidthPxLabel.
  ///
  /// In fr, this message translates to:
  /// **'Largeur (px)'**
  String get mireWidthPxLabel;

  /// No description provided for @mireHeightPxLabel.
  ///
  /// In fr, this message translates to:
  /// **'Hauteur (px)'**
  String get mireHeightPxLabel;

  /// No description provided for @mireWidthPxHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1920'**
  String get mireWidthPxHint;

  /// No description provided for @mireHeightPxHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1080'**
  String get mireHeightPxHint;

  /// No description provided for @mireWidthPxHintMapping.
  ///
  /// In fr, this message translates to:
  /// **'ex: 3840'**
  String get mireWidthPxHintMapping;

  /// No description provided for @mireHeightPxHintMapping.
  ///
  /// In fr, this message translates to:
  /// **'ex: 2160'**
  String get mireHeightPxHintMapping;

  /// No description provided for @mireTypeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Type de mire'**
  String get mireTypeLabel;

  /// No description provided for @mireExportPng.
  ///
  /// In fr, this message translates to:
  /// **'Exporter PNG'**
  String get mireExportPng;

  /// No description provided for @mireErrInvalidWHpx.
  ///
  /// In fr, this message translates to:
  /// **'❌ Largeur/hauteur invalides (px).'**
  String get mireErrInvalidWHpx;

  /// No description provided for @mireErrInvalidProjectors.
  ///
  /// In fr, this message translates to:
  /// **'❌ Nombre de projecteurs invalide (N > 0).'**
  String get mireErrInvalidProjectors;

  /// No description provided for @mireErrInvalidOverlap.
  ///
  /// In fr, this message translates to:
  /// **'❌ Overlap invalide (0 à 99.9).'**
  String get mireErrInvalidOverlap;

  /// No description provided for @mireSimpleTypeComboAll.
  ///
  /// In fr, this message translates to:
  /// **'Combo (grille + cercles + 2 barres centrées)'**
  String get mireSimpleTypeComboAll;

  /// No description provided for @mireSimpleTypeGridSafe.
  ///
  /// In fr, this message translates to:
  /// **'Grille + safe + cercles'**
  String get mireSimpleTypeGridSafe;

  /// No description provided for @mireSimpleTypeColorBars.
  ///
  /// In fr, this message translates to:
  /// **'Barres + rampes + cercles'**
  String get mireSimpleTypeColorBars;

  /// No description provided for @mireSimpleTypeUniformity.
  ///
  /// In fr, this message translates to:
  /// **'Uniformité + cercles'**
  String get mireSimpleTypeUniformity;

  /// No description provided for @mireSimpleTypeCheckerboard.
  ///
  /// In fr, this message translates to:
  /// **'Damier + cercles'**
  String get mireSimpleTypeCheckerboard;

  /// No description provided for @mireProjectorsNLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nombre de projecteurs (N)'**
  String get mireProjectorsNLabel;

  /// No description provided for @mireProjectorsNHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 2'**
  String get mireProjectorsNHint;

  /// No description provided for @mireOverlapLabel.
  ///
  /// In fr, this message translates to:
  /// **'Overlap (%)'**
  String get mireOverlapLabel;

  /// No description provided for @mireOverlapHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 10.0'**
  String get mireOverlapHint;

  /// No description provided for @mireOrientationLabel.
  ///
  /// In fr, this message translates to:
  /// **'Orientation'**
  String get mireOrientationLabel;

  /// No description provided for @mireMappingTypeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Type mapping'**
  String get mireMappingTypeLabel;

  /// No description provided for @mireMappingTypeCombo.
  ///
  /// In fr, this message translates to:
  /// **'Combo (zones + overlap + blend)'**
  String get mireMappingTypeCombo;

  /// No description provided for @mireMappingTypeZonesOverlap.
  ///
  /// In fr, this message translates to:
  /// **'Zones + overlap'**
  String get mireMappingTypeZonesOverlap;

  /// No description provided for @mireMappingTypeBlendRamps.
  ///
  /// In fr, this message translates to:
  /// **'Blend ramps'**
  String get mireMappingTypeBlendRamps;

  /// No description provided for @mireDash.
  ///
  /// In fr, this message translates to:
  /// **'—'**
  String get mireDash;

  /// No description provided for @mirePitchEqual.
  ///
  /// In fr, this message translates to:
  /// **'{value} mm'**
  String mirePitchEqual(Object value);

  /// No description provided for @mirePitchXY.
  ///
  /// In fr, this message translates to:
  /// **'X {x} mm • Y {y} mm'**
  String mirePitchXY(Object x, Object y);

  /// No description provided for @mireLedParamsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres mur LED'**
  String get mireLedParamsTitle;

  /// No description provided for @mireLedTilesXLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tiles horizontales (X)'**
  String get mireLedTilesXLabel;

  /// No description provided for @mireLedTilesYLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tiles verticales (Y)'**
  String get mireLedTilesYLabel;

  /// No description provided for @mireLedTileWpxLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tile largeur (px)'**
  String get mireLedTileWpxLabel;

  /// No description provided for @mireLedTileHpxLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tile hauteur (px)'**
  String get mireLedTileHpxLabel;

  /// No description provided for @mireLedTileWcmLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tile largeur (cm)'**
  String get mireLedTileWcmLabel;

  /// No description provided for @mireLedTileHcmLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tile hauteur (cm)'**
  String get mireLedTileHcmLabel;

  /// No description provided for @mireLedWallResolution.
  ///
  /// In fr, this message translates to:
  /// **'Résolution mur: {w} × {h} px'**
  String mireLedWallResolution(Object w, Object h);

  /// No description provided for @mireLedPitchComputed.
  ///
  /// In fr, this message translates to:
  /// **'Pitch calculé: {pitch}'**
  String mireLedPitchComputed(Object pitch);

  /// No description provided for @mireLedErrTilesXY.
  ///
  /// In fr, this message translates to:
  /// **'❌ Renseigne Tiles X/Y (>0).'**
  String get mireLedErrTilesXY;

  /// No description provided for @mireLedErrTilePx.
  ///
  /// In fr, this message translates to:
  /// **'❌ Renseigne Tile px (largeur/hauteur >0).'**
  String get mireLedErrTilePx;

  /// No description provided for @mireLedErrTileCm.
  ///
  /// In fr, this message translates to:
  /// **'❌ Renseigne Tile cm (largeur/hauteur >0).'**
  String get mireLedErrTileCm;

  /// No description provided for @mireLedWarnPitchOutOfRange.
  ///
  /// In fr, this message translates to:
  /// **'⚠️ Pitch calculé hors plage (0.5–20 mm). Vérifie Tile cm / px.'**
  String get mireLedWarnPitchOutOfRange;

  /// No description provided for @mireLedWarnPitchXNotY.
  ///
  /// In fr, this message translates to:
  /// **'⚠️ Pitch X ≠ Pitch Y (tile non homogène). Vérifie dimensions cm et px.'**
  String get mireLedWarnPitchXNotY;

  /// No description provided for @mireLedTypeTilesId.
  ///
  /// In fr, this message translates to:
  /// **'Tiles ID (numéro + couleurs)'**
  String get mireLedTypeTilesId;

  /// No description provided for @mireLedTypePixelPerfect.
  ///
  /// In fr, this message translates to:
  /// **'Pixel perfect + cercles'**
  String get mireLedTypePixelPerfect;

  /// No description provided for @mireLedTypeGridLabels.
  ///
  /// In fr, this message translates to:
  /// **'Grille + repères + cercles'**
  String get mireLedTypeGridLabels;

  /// No description provided for @mireLedTypeColorBars.
  ///
  /// In fr, this message translates to:
  /// **'Barres + rampes + cercles'**
  String get mireLedTypeColorBars;

  /// No description provided for @mireLedTypeUniformity.
  ///
  /// In fr, this message translates to:
  /// **'Uniformité + cercles'**
  String get mireLedTypeUniformity;

  /// No description provided for @mireVideoTypeCombo.
  ///
  /// In fr, this message translates to:
  /// **'Combo (grille + cercles + 2 barres centrées)'**
  String get mireVideoTypeCombo;

  /// No description provided for @mireVideoTypeGridSafe.
  ///
  /// In fr, this message translates to:
  /// **'Grille + safe + cercles'**
  String get mireVideoTypeGridSafe;

  /// No description provided for @mireVideoTypeColorBars.
  ///
  /// In fr, this message translates to:
  /// **'Barres + rampes + cercles'**
  String get mireVideoTypeColorBars;

  /// No description provided for @mireVideoTypeUniformity.
  ///
  /// In fr, this message translates to:
  /// **'Uniformité + cercles'**
  String get mireVideoTypeUniformity;

  /// No description provided for @mireVideoTypeCheckerboard.
  ///
  /// In fr, this message translates to:
  /// **'Damier + cercles'**
  String get mireVideoTypeCheckerboard;

  /// No description provided for @laserConsentCheckboxLabel.
  ///
  /// In fr, this message translates to:
  /// **'Je comprends les risques et j’assume ma responsabilité.'**
  String get laserConsentCheckboxLabel;

  /// No description provided for @laserConsentAcceptContinue.
  ///
  /// In fr, this message translates to:
  /// **'J\'accepte et continuer'**
  String get laserConsentAcceptContinue;

  /// No description provided for @laserConsentContinue.
  ///
  /// In fr, this message translates to:
  /// **'J\'accepte et continuer'**
  String get laserConsentContinue;

  /// No description provided for @laserZoneLabelNohd.
  ///
  /// In fr, this message translates to:
  /// **'NOHD'**
  String get laserZoneLabelNohd;

  /// No description provided for @laserZoneLabelSzed.
  ///
  /// In fr, this message translates to:
  /// **'SZED'**
  String get laserZoneLabelSzed;

  /// No description provided for @laserZoneLabelCzed.
  ///
  /// In fr, this message translates to:
  /// **'CZED'**
  String get laserZoneLabelCzed;

  /// No description provided for @laserValueMeter.
  ///
  /// In fr, this message translates to:
  /// **'{value} m'**
  String laserValueMeter(Object value);

  /// No description provided for @laserPercentValue.
  ///
  /// In fr, this message translates to:
  /// **'{value} %'**
  String laserPercentValue(Object value);

  /// No description provided for @catalogUpdateTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Mettre à jour'**
  String get catalogUpdateTooltip;

  /// No description provided for @catalogResetTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser'**
  String get catalogResetTooltip;

  /// No description provided for @catalogLastUpdate.
  ///
  /// In fr, this message translates to:
  /// **'Dernière mise à jour : {date}'**
  String catalogLastUpdate(Object date);

  /// No description provided for @catalogManufacturerTitle.
  ///
  /// In fr, this message translates to:
  /// **'Constructeur ({count})'**
  String catalogManufacturerTitle(Object count);

  /// No description provided for @catalogTypeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Type de projecteur ({count})'**
  String catalogTypeTitle(Object count);

  /// No description provided for @catalogModelTitle.
  ///
  /// In fr, this message translates to:
  /// **'Modèle ({count})'**
  String catalogModelTitle(Object count);

  /// No description provided for @catalogDmxModeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mode DMX ({count})'**
  String catalogDmxModeTitle(Object count);

  /// No description provided for @catalogDmxModeItem.
  ///
  /// In fr, this message translates to:
  /// **'{name} ({channels} canaux)'**
  String catalogDmxModeItem(Object name, Object channels);

  /// No description provided for @catalogInfoDmxChannels.
  ///
  /// In fr, this message translates to:
  /// **'Canaux DMX'**
  String get catalogInfoDmxChannels;

  /// No description provided for @catalogInfoWeight.
  ///
  /// In fr, this message translates to:
  /// **'Poids'**
  String get catalogInfoWeight;

  /// No description provided for @catalogInfoPower.
  ///
  /// In fr, this message translates to:
  /// **'Puissance'**
  String get catalogInfoPower;

  /// No description provided for @catalogInfoLuminousFlux.
  ///
  /// In fr, this message translates to:
  /// **'Flux lumineux'**
  String get catalogInfoLuminousFlux;

  /// No description provided for @catalogNotProvided.
  ///
  /// In fr, this message translates to:
  /// **'Non renseigné'**
  String get catalogNotProvided;

  /// No description provided for @catalogUpdated.
  ///
  /// In fr, this message translates to:
  /// **'Catalogue mis à jour.'**
  String get catalogUpdated;

  /// No description provided for @catalogSyncFailedUnknown.
  ///
  /// In fr, this message translates to:
  /// **'Synchronisation impossible (raison inconnue).'**
  String get catalogSyncFailedUnknown;

  /// No description provided for @catalogSyncFailed.
  ///
  /// In fr, this message translates to:
  /// **'Synchronisation impossible : {reason}'**
  String catalogSyncFailed(Object reason);

  /// No description provided for @catalogSyncError.
  ///
  /// In fr, this message translates to:
  /// **'Échec synchronisation : {error}'**
  String catalogSyncError(Object error);

  /// No description provided for @dipSwitchResetTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser'**
  String get dipSwitchResetTooltip;

  /// No description provided for @dipSwitchInputsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Entrées'**
  String get dipSwitchInputsTitle;

  /// No description provided for @dipSwitchSectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Dip-switch'**
  String get dipSwitchSectionTitle;

  /// No description provided for @dipSwitchSummaryTitle.
  ///
  /// In fr, this message translates to:
  /// **'Résumé'**
  String get dipSwitchSummaryTitle;

  /// No description provided for @dipSwitchAddressLabel.
  ///
  /// In fr, this message translates to:
  /// **'Adresse DMX (1 à 512)'**
  String get dipSwitchAddressLabel;

  /// No description provided for @dipSwitchAddressHint.
  ///
  /// In fr, this message translates to:
  /// **'Exemple : 1'**
  String get dipSwitchAddressHint;

  /// No description provided for @dipSwitchIntervalLabel.
  ///
  /// In fr, this message translates to:
  /// **'Intervalle (nombre de canaux)'**
  String get dipSwitchIntervalLabel;

  /// No description provided for @dipSwitchIntervalHint.
  ///
  /// In fr, this message translates to:
  /// **'Exemple : 16'**
  String get dipSwitchIntervalHint;

  /// No description provided for @dipSwitchUseAddressMinusOneLabel.
  ///
  /// In fr, this message translates to:
  /// **'Utiliser adresse moins 1'**
  String get dipSwitchUseAddressMinusOneLabel;

  /// No description provided for @dipSwitchNextAddressButton.
  ///
  /// In fr, this message translates to:
  /// **'Adresse suivante selon l’intervalle'**
  String get dipSwitchNextAddressButton;

  /// No description provided for @dipSwitchEndOfUniverseWarning.
  ///
  /// In fr, this message translates to:
  /// **'Fin de l’univers : l’adresse suivante dépasserait 512.'**
  String get dipSwitchEndOfUniverseWarning;

  /// No description provided for @dipSwitchScrollHint.
  ///
  /// In fr, this message translates to:
  /// **'Fais défiler horizontalement si nécessaire.'**
  String get dipSwitchScrollHint;

  /// No description provided for @dipSwitchOnLabel.
  ///
  /// In fr, this message translates to:
  /// **'ON'**
  String get dipSwitchOnLabel;

  /// No description provided for @dipSwitchOffLabel.
  ///
  /// In fr, this message translates to:
  /// **'OFF'**
  String get dipSwitchOffLabel;

  /// No description provided for @dipSwitchSwitchLabel.
  ///
  /// In fr, this message translates to:
  /// **'Switch {index}'**
  String dipSwitchSwitchLabel(Object index);

  /// No description provided for @dipSwitchResultHeader.
  ///
  /// In fr, this message translates to:
  /// **'Conversion indicative dip-switch / adresse DMX'**
  String get dipSwitchResultHeader;

  /// No description provided for @dipSwitchModeAddressMinusOne.
  ///
  /// In fr, this message translates to:
  /// **'Adresse moins 1'**
  String get dipSwitchModeAddressMinusOne;

  /// No description provided for @dipSwitchModeAddressDirect.
  ///
  /// In fr, this message translates to:
  /// **'Adresse directe'**
  String get dipSwitchModeAddressDirect;

  /// No description provided for @dipSwitchResultModeLine.
  ///
  /// In fr, this message translates to:
  /// **'Mode : {mode}'**
  String dipSwitchResultModeLine(Object mode);

  /// No description provided for @dipSwitchResultAddressNotProvided.
  ///
  /// In fr, this message translates to:
  /// **'Adresse DMX : non renseignée'**
  String get dipSwitchResultAddressNotProvided;

  /// No description provided for @dipSwitchResultAddressLine.
  ///
  /// In fr, this message translates to:
  /// **'Adresse DMX : {address}'**
  String dipSwitchResultAddressLine(Object address);

  /// No description provided for @photometrySection1Title.
  ///
  /// In fr, this message translates to:
  /// **'Lux et candela'**
  String get photometrySection1Title;

  /// No description provided for @photometrySection2Title.
  ///
  /// In fr, this message translates to:
  /// **'Lumen et candela'**
  String get photometrySection2Title;

  /// No description provided for @photometrySection3Title.
  ///
  /// In fr, this message translates to:
  /// **'Lux à partir de lumen'**
  String get photometrySection3Title;

  /// No description provided for @photometryLuxLabel.
  ///
  /// In fr, this message translates to:
  /// **'Éclairement (lux)'**
  String get photometryLuxLabel;

  /// No description provided for @photometryLuxHint.
  ///
  /// In fr, this message translates to:
  /// **'Exemple : 500'**
  String get photometryLuxHint;

  /// No description provided for @photometryCandelaLabel.
  ///
  /// In fr, this message translates to:
  /// **'Intensité lumineuse (candela)'**
  String get photometryCandelaLabel;

  /// No description provided for @photometryCandelaHint1.
  ///
  /// In fr, this message translates to:
  /// **'Exemple : 20000'**
  String get photometryCandelaHint1;

  /// No description provided for @photometryCandelaHint2.
  ///
  /// In fr, this message translates to:
  /// **'Exemple : 150000'**
  String get photometryCandelaHint2;

  /// No description provided for @photometryDistanceLabel.
  ///
  /// In fr, this message translates to:
  /// **'Distance (mètre)'**
  String get photometryDistanceLabel;

  /// No description provided for @photometryDistanceHint1.
  ///
  /// In fr, this message translates to:
  /// **'Exemple : 5'**
  String get photometryDistanceHint1;

  /// No description provided for @photometryDistanceHint3.
  ///
  /// In fr, this message translates to:
  /// **'Exemple : 8'**
  String get photometryDistanceHint3;

  /// No description provided for @photometryLumensLabel.
  ///
  /// In fr, this message translates to:
  /// **'Flux lumineux (lumen)'**
  String get photometryLumensLabel;

  /// No description provided for @photometryLumensHint2.
  ///
  /// In fr, this message translates to:
  /// **'Exemple : 20000'**
  String get photometryLumensHint2;

  /// No description provided for @photometryLumensHint3.
  ///
  /// In fr, this message translates to:
  /// **'Exemple : 20000'**
  String get photometryLumensHint3;

  /// No description provided for @photometryBeamAngleLabel.
  ///
  /// In fr, this message translates to:
  /// **'Angle de faisceau (degré)'**
  String get photometryBeamAngleLabel;

  /// No description provided for @photometryBeamAngleHint2.
  ///
  /// In fr, this message translates to:
  /// **'Exemple : 10'**
  String get photometryBeamAngleHint2;

  /// No description provided for @photometryBeamAngleHint3.
  ///
  /// In fr, this message translates to:
  /// **'Exemple : 15'**
  String get photometryBeamAngleHint3;

  /// No description provided for @photometrySummary1.
  ///
  /// In fr, this message translates to:
  /// **'Éclairement : {lux} lux\nIntensité lumineuse : {candela} candela\nDistance : {distance} mètre'**
  String photometrySummary1(Object lux, Object candela, Object distance);

  /// No description provided for @photometrySummary2.
  ///
  /// In fr, this message translates to:
  /// **'Flux lumineux : {lumens} lumen\nIntensité lumineuse : {candela} candela\nAngle de faisceau : {angle} degré\nAngle solide : {omega} stéradian'**
  String photometrySummary2(
      Object lumens, Object candela, Object angle, Object omega);

  /// No description provided for @projectionInputsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Entrées'**
  String get projectionInputsTitle;

  /// No description provided for @projectionResultsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Résultats'**
  String get projectionResultsTitle;

  /// No description provided for @projectionAngleLabel.
  ///
  /// In fr, this message translates to:
  /// **'Angle de faisceau (degré)'**
  String get projectionAngleLabel;

  /// No description provided for @projectionAngleHint.
  ///
  /// In fr, this message translates to:
  /// **'Exemple : 15'**
  String get projectionAngleHint;

  /// No description provided for @projectionDistanceLabel.
  ///
  /// In fr, this message translates to:
  /// **'Distance (mètre)'**
  String get projectionDistanceLabel;

  /// No description provided for @projectionDistanceHint.
  ///
  /// In fr, this message translates to:
  /// **'Exemple : 10'**
  String get projectionDistanceHint;

  /// No description provided for @projectionDiameterLabel.
  ///
  /// In fr, this message translates to:
  /// **'Diamètre de tache (mètre)'**
  String get projectionDiameterLabel;

  /// No description provided for @projectionDiameterHint.
  ///
  /// In fr, this message translates to:
  /// **'Exemple : 2,60'**
  String get projectionDiameterHint;

  /// No description provided for @projectionAutoHelp.
  ///
  /// In fr, this message translates to:
  /// **'Le calcul automatique se met à jour lorsque deux champs sont renseignés.'**
  String get projectionAutoHelp;

  /// No description provided for @projectionHeaderNeedTwoValues.
  ///
  /// In fr, this message translates to:
  /// **'Saisis deux valeurs pour calculer automatiquement la troisième.'**
  String get projectionHeaderNeedTwoValues;

  /// No description provided for @projectionHeaderAutoActive.
  ///
  /// In fr, this message translates to:
  /// **'Calcul automatique actif.'**
  String get projectionHeaderAutoActive;

  /// No description provided for @projectionDetailAngle.
  ///
  /// In fr, this message translates to:
  /// **'Angle de faisceau : {value} degré'**
  String projectionDetailAngle(Object value);

  /// No description provided for @projectionDetailDistance.
  ///
  /// In fr, this message translates to:
  /// **'Distance : {value} mètre'**
  String projectionDetailDistance(Object value);

  /// No description provided for @projectionDetailDiameter.
  ///
  /// In fr, this message translates to:
  /// **'Diamètre de tache : {value} mètre'**
  String projectionDetailDiameter(Object value);

  /// No description provided for @projectionConeAngle.
  ///
  /// In fr, this message translates to:
  /// **'Angle {angle}°'**
  String projectionConeAngle(Object angle);

  /// No description provided for @projectionConeDistance.
  ///
  /// In fr, this message translates to:
  /// **'{distance} m'**
  String projectionConeDistance(Object distance);

  /// No description provided for @projectionConeDiameter.
  ///
  /// In fr, this message translates to:
  /// **'{diameter} m'**
  String projectionConeDiameter(Object diameter);

  /// No description provided for @photometrySummary3.
  ///
  /// In fr, this message translates to:
  /// **'Flux lumineux : {lumens} lumen\nDistance : {distance} mètre\nAngle de faisceau : {angle} degré\nÉclairement estimé : {lux} lux'**
  String photometrySummary3(
      Object lumens, Object distance, Object angle, Object lux);

  /// No description provided for @photometryDisclaimerShort.
  ///
  /// In fr, this message translates to:
  /// **'Calculs indicatifs. Les résultats dépendent du faisceau réel, des optiques et des conditions de mesure.'**
  String get photometryDisclaimerShort;

  /// No description provided for @dipSwitchResultBinaryValueLine.
  ///
  /// In fr, this message translates to:
  /// **'Valeur binaire utilisée : {value}'**
  String dipSwitchResultBinaryValueLine(Object value);

  /// No description provided for @dipSwitchChannelUnit.
  ///
  /// In fr, this message translates to:
  /// **'{count,plural,one{canal}other{canaux}}'**
  String dipSwitchChannelUnit(num count);

  /// No description provided for @dipSwitchResultIntervalLine.
  ///
  /// In fr, this message translates to:
  /// **'Intervalle : {step} {unit}'**
  String dipSwitchResultIntervalLine(Object step, Object unit);

  /// No description provided for @catalogOpenManual.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrir le manuel'**
  String get catalogOpenManual;

  /// No description provided for @catalogOpenDmxChart.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrir la charte DMX'**
  String get catalogOpenDmxChart;

  /// No description provided for @laserLegalDisclaimerText.
  ///
  /// In fr, this message translates to:
  /// **'AVERTISSEMENT LÉGAL ET CLAUSE DE NON-RESPONSABILITÉ\n\nL\'utilisation de ce calculateur est strictement réservée à titre informatif et indicatif.\nLes résultats obtenus ne constituent pas une expertise technique et ne sauraient engager la responsabilité de l\'éditeur en cas d\'erreur de calcul, d\'omission ou d\'accident survenus lors de l\'installation ou de l\'exploitation du matériel.\n\nCalculs NOHD et Instruments Optiques :\nDans certaines circonstances, des instruments optiques spéciaux (jumelles, télescopes) peuvent être utilisés pour visualiser le laser à une distance plus éloignée.\nCe fait doit être pris en compte lors de la détermination du NOHD.\nDans le calcul ci-joint, aucun instrument optique n\'est pris en compte, car il est très peu probable que cela doive être pris en compte dans l\'industrie courante du laser.\nCependant, il incombe à l\'opérateur de procéder à une évaluation appropriée des risques pour la sécurité.\n\nZones d\'Interférence Visuelle (SZED et CZED) :\nLes calculs des distances SZED (aveuglement temporaire) et CZED (éblouissement) sont basés sur des seuils d\'éclairement énergétique standards pour la vision humaine.\nCes valeurs ne sont valables que pour un observateur dont l\'œil est adapté à l\'obscurité (conditions de spectacle).\nCes résultats ne tiennent pas compte des conditions atmosphériques (brume, pluie, pollution) qui peuvent réduire ou diffuser la portée théorique du faisceau.\n\nParamètres Techniques :\nLe calculateur n\'est applicable que pour les sources laser en mode continu (CW) et n\'est valable que pour la plage de longueur d\'onde de 400 à 700 nm – paramètres standards pour les systèmes laser de spectacle.\n\nAcceptation des Risques :\nCe calculateur est fourni \"tel quel\".\nNous ne garantissons pas l\'exactitude et la précision des résultats.\nEn activant cet outil, l\'utilisateur reconnaît être un professionnel formé aux règles de sécurité en vigueur et accepte l\'entière responsabilité des risques liés à la mise en œuvre des équipements (laser, lumière, vidéo).\nVérifiez systématiquement les données avec les manuels constructeurs officiels.'**
  String get laserLegalDisclaimerText;

  /// No description provided for @patchPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch DMX'**
  String get patchPageTitle;

  /// No description provided for @patchSummaryTitle.
  ///
  /// In fr, this message translates to:
  /// **'Résumé'**
  String get patchSummaryTitle;

  /// No description provided for @patchListTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch'**
  String get patchListTitle;

  /// No description provided for @patchUniverseLabel.
  ///
  /// In fr, this message translates to:
  /// **'Univers DMX :'**
  String get patchUniverseLabel;

  /// No description provided for @patchUniverseSelected.
  ///
  /// In fr, this message translates to:
  /// **'Univers sélectionné'**
  String get patchUniverseSelected;

  /// No description provided for @patchUniverseItem.
  ///
  /// In fr, this message translates to:
  /// **'Univers {value}'**
  String patchUniverseItem(Object value);

  /// No description provided for @patchFixturesCount.
  ///
  /// In fr, this message translates to:
  /// **'Projecteurs : {count}'**
  String patchFixturesCount(Object count);

  /// No description provided for @patchChannelsUsed.
  ///
  /// In fr, this message translates to:
  /// **'Canaux occupés : {count} / 512'**
  String patchChannelsUsed(Object count);

  /// No description provided for @patchConflicts.
  ///
  /// In fr, this message translates to:
  /// **'Conflits : {count} canal(aux)'**
  String patchConflicts(Object count);

  /// No description provided for @patchEmptyUniverse.
  ///
  /// In fr, this message translates to:
  /// **'Aucune entrée dans cet univers.'**
  String get patchEmptyUniverse;

  /// No description provided for @patchModeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Mode DMX : {mode}'**
  String patchModeLabel(Object mode);

  /// No description provided for @patchAddressLabel.
  ///
  /// In fr, this message translates to:
  /// **'Adresse : {start} → {end} (unité : canaux DMX)'**
  String patchAddressLabel(Object start, Object end);

  /// No description provided for @patchConflictShort.
  ///
  /// In fr, this message translates to:
  /// **'Conflit DMX'**
  String get patchConflictShort;

  /// No description provided for @patchEditTitle.
  ///
  /// In fr, this message translates to:
  /// **'Modifier le patch'**
  String get patchEditTitle;

  /// No description provided for @patchEditModeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Mode DMX (libellé)'**
  String get patchEditModeLabel;

  /// No description provided for @patchEditChannelsLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nombre de canaux (unité : canaux DMX)'**
  String get patchEditChannelsLabel;

  /// No description provided for @patchEditHint.
  ///
  /// In fr, this message translates to:
  /// **'Astuce : saisis le nombre de canaux du mode constructeur (ex : 26).'**
  String get patchEditHint;

  /// No description provided for @patchInvalidChannelCount.
  ///
  /// In fr, this message translates to:
  /// **'Nombre de canaux invalide.'**
  String get patchInvalidChannelCount;

  /// No description provided for @patchConflictError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible : conflit DMX ou valeurs invalides.'**
  String get patchConflictError;

  /// No description provided for @patchHomeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch DMX'**
  String get patchHomeTitle;

  /// No description provided for @patchHomeImportMvrTitle.
  ///
  /// In fr, this message translates to:
  /// **'Importer un fichier MVR'**
  String get patchHomeImportMvrTitle;

  /// No description provided for @patchHomeImportMvrDescription.
  ///
  /// In fr, this message translates to:
  /// **'Charger un fichier MVR depuis l’appareil et afficher un résumé clair sous forme de tableur.'**
  String get patchHomeImportMvrDescription;

  /// No description provided for @patchHomeViewPatchTitle.
  ///
  /// In fr, this message translates to:
  /// **'Voir le patch actuel'**
  String get patchHomeViewPatchTitle;

  /// No description provided for @patchHomeViewPatchDescription.
  ///
  /// In fr, this message translates to:
  /// **'Afficher l’univers DMX, les canaux occupés et les projecteurs patchés.'**
  String get patchHomeViewPatchDescription;

  /// No description provided for @patchHomeDisclaimer.
  ///
  /// In fr, this message translates to:
  /// **'Import MVR : lecture indicative. Vérifie toujours le patch final.'**
  String get patchHomeDisclaimer;

  /// No description provided for @patchHubTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch / MVR'**
  String get patchHubTitle;

  /// No description provided for @patchHubWorksiteTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mode chantier'**
  String get patchHubWorksiteTitle;

  /// No description provided for @patchHubWorksiteBody.
  ///
  /// In fr, this message translates to:
  /// **'Lecture seule : le MVR est chargé comme référence.\nAucune modification d’adresses n’est possible dans l’application.'**
  String get patchHubWorksiteBody;

  /// No description provided for @patchHubOpenMvrButton.
  ///
  /// In fr, this message translates to:
  /// **'Charger / consulter un fichier MVR'**
  String get patchHubOpenMvrButton;

  /// No description provided for @patchHubOpenGridButton.
  ///
  /// In fr, this message translates to:
  /// **'Voir la place disponible (grille DMX)'**
  String get patchHubOpenGridButton;

  /// No description provided for @patchHubStateTitle.
  ///
  /// In fr, this message translates to:
  /// **'État'**
  String get patchHubStateTitle;

  /// No description provided for @patchHubStateEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucune référence chargée.'**
  String get patchHubStateEmpty;

  /// No description provided for @patchHubStateLoaded.
  ///
  /// In fr, this message translates to:
  /// **'Référence chargée : {count} entrée(s), lecture seule.'**
  String patchHubStateLoaded(Object count);

  /// No description provided for @patchIssueInvalidUniverse.
  ///
  /// In fr, this message translates to:
  /// **'L’univers doit être supérieur ou égal à 1.'**
  String get patchIssueInvalidUniverse;

  /// No description provided for @patchIssueInvalidStartAddress.
  ///
  /// In fr, this message translates to:
  /// **'L’adresse DMX doit être comprise entre 1 et 512.'**
  String get patchIssueInvalidStartAddress;

  /// No description provided for @patchIssueInvalidChannelCount.
  ///
  /// In fr, this message translates to:
  /// **'Le nombre de canaux doit être supérieur ou égal à 1.'**
  String get patchIssueInvalidChannelCount;

  /// No description provided for @patchIssueRangeExceedsUniverse.
  ///
  /// In fr, this message translates to:
  /// **'La plage de canaux dépasse 512 dans cet univers.'**
  String get patchIssueRangeExceedsUniverse;

  /// No description provided for @patchIssueUnknown.
  ///
  /// In fr, this message translates to:
  /// **'Erreur de validation inconnue.'**
  String get patchIssueUnknown;

  /// No description provided for @patchManualTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch manuel'**
  String get patchManualTitle;

  /// No description provided for @patchManualDisabledTitle.
  ///
  /// In fr, this message translates to:
  /// **'Fonction désactivée'**
  String get patchManualDisabledTitle;

  /// No description provided for @patchManualDisabledBody.
  ///
  /// In fr, this message translates to:
  /// **'Le patch manuel est désactivé pour le mode chantier.\nUtilise uniquement l’import MVR et la vue patch.'**
  String get patchManualDisabledBody;

  /// No description provided for @patchMvrTitle.
  ///
  /// In fr, this message translates to:
  /// **'Importer un fichier MVR'**
  String get patchMvrTitle;

  /// No description provided for @patchMvrClearTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Effacer l’import mémorisé'**
  String get patchMvrClearTooltip;

  /// No description provided for @patchMvrFileCardTitle.
  ///
  /// In fr, this message translates to:
  /// **'Fichier MVR'**
  String get patchMvrFileCardTitle;

  /// No description provided for @patchMvrFileCardHelp.
  ///
  /// In fr, this message translates to:
  /// **'Charge un fichier MVR depuis l’appareil. Les données sont mémorisées automatiquement.'**
  String get patchMvrFileCardHelp;

  /// No description provided for @patchMvrButtonAnalyzing.
  ///
  /// In fr, this message translates to:
  /// **'Analyse en cours…'**
  String get patchMvrButtonAnalyzing;

  /// No description provided for @patchMvrButtonPickFile.
  ///
  /// In fr, this message translates to:
  /// **'Charger un fichier MVR'**
  String get patchMvrButtonPickFile;

  /// No description provided for @patchMvrButtonLoadAsReference.
  ///
  /// In fr, this message translates to:
  /// **'Charger comme référence de patch (lecture seule)'**
  String get patchMvrButtonLoadAsReference;

  /// No description provided for @patchMvrSummaryTitle.
  ///
  /// In fr, this message translates to:
  /// **'Résumé (persistant)'**
  String get patchMvrSummaryTitle;

  /// No description provided for @patchMvrColumnsHint.
  ///
  /// In fr, this message translates to:
  /// **'Colonnes : ID, Nom machine, Univers, Adresse DMX, Canaux.'**
  String get patchMvrColumnsHint;

  /// No description provided for @patchMvrFilterUniverseLabel.
  ///
  /// In fr, this message translates to:
  /// **'Filtrer par univers'**
  String get patchMvrFilterUniverseLabel;

  /// No description provided for @patchMvrFilterAllUniverses.
  ///
  /// In fr, this message translates to:
  /// **'Tous les univers'**
  String get patchMvrFilterAllUniverses;

  /// No description provided for @patchMvrUniverseItem.
  ///
  /// In fr, this message translates to:
  /// **'Univers {u}'**
  String patchMvrUniverseItem(Object u);

  /// No description provided for @patchMvrSortByLabel.
  ///
  /// In fr, this message translates to:
  /// **'Trier par'**
  String get patchMvrSortByLabel;

  /// No description provided for @patchMvrSortId.
  ///
  /// In fr, this message translates to:
  /// **'ID'**
  String get patchMvrSortId;

  /// No description provided for @patchMvrSortName.
  ///
  /// In fr, this message translates to:
  /// **'Nom de machine'**
  String get patchMvrSortName;

  /// No description provided for @patchMvrSortUniverse.
  ///
  /// In fr, this message translates to:
  /// **'Univers'**
  String get patchMvrSortUniverse;

  /// No description provided for @patchMvrSortAddress.
  ///
  /// In fr, this message translates to:
  /// **'Adresse DMX'**
  String get patchMvrSortAddress;

  /// No description provided for @patchMvrSortChannels.
  ///
  /// In fr, this message translates to:
  /// **'Canaux'**
  String get patchMvrSortChannels;

  /// No description provided for @patchMvrSortUniverseThenAddress.
  ///
  /// In fr, this message translates to:
  /// **'Univers + Adresse DMX'**
  String get patchMvrSortUniverseThenAddress;

  /// No description provided for @patchMvrOrderLabel.
  ///
  /// In fr, this message translates to:
  /// **'Ordre'**
  String get patchMvrOrderLabel;

  /// No description provided for @patchMvrOrderAsc.
  ///
  /// In fr, this message translates to:
  /// **'Croissant'**
  String get patchMvrOrderAsc;

  /// No description provided for @patchMvrOrderDesc.
  ///
  /// In fr, this message translates to:
  /// **'Décroissant'**
  String get patchMvrOrderDesc;

  /// No description provided for @patchMvrColId.
  ///
  /// In fr, this message translates to:
  /// **'ID'**
  String get patchMvrColId;

  /// No description provided for @patchMvrColName.
  ///
  /// In fr, this message translates to:
  /// **'Nom machine'**
  String get patchMvrColName;

  /// No description provided for @patchMvrColUniverse.
  ///
  /// In fr, this message translates to:
  /// **'Univers'**
  String get patchMvrColUniverse;

  /// No description provided for @patchMvrColAddress.
  ///
  /// In fr, this message translates to:
  /// **'Adresse DMX'**
  String get patchMvrColAddress;

  /// No description provided for @patchMvrColChannels.
  ///
  /// In fr, this message translates to:
  /// **'Canaux'**
  String get patchMvrColChannels;

  /// No description provided for @patchMvrModeNotProvided.
  ///
  /// In fr, this message translates to:
  /// **'Mode non renseigné (MVR)'**
  String get patchMvrModeNotProvided;

  /// No description provided for @patchMvrStatusRestored.
  ///
  /// In fr, this message translates to:
  /// **'ℹ️ Import MVR restauré ({count} lignes).'**
  String patchMvrStatusRestored(Object count);

  /// No description provided for @patchMvrStatusCleared.
  ///
  /// In fr, this message translates to:
  /// **'Import MVR effacé.'**
  String get patchMvrStatusCleared;

  /// No description provided for @patchMvrStatusSelectingFile.
  ///
  /// In fr, this message translates to:
  /// **'Sélection du fichier…'**
  String get patchMvrStatusSelectingFile;

  /// No description provided for @patchMvrStatusFilePickFailed.
  ///
  /// In fr, this message translates to:
  /// **'❌ Sélection de fichier impossible : {error}'**
  String patchMvrStatusFilePickFailed(Object error);

  /// No description provided for @patchMvrStatusNoFileSelected.
  ///
  /// In fr, this message translates to:
  /// **'❌ Aucun fichier sélectionné.'**
  String get patchMvrStatusNoFileSelected;

  /// No description provided for @patchMvrStatusUnsupportedFile.
  ///
  /// In fr, this message translates to:
  /// **'❌ Fichier non supporté.\nSélectionne un fichier avec l’extension .mvr.\nFichier choisi : {name}'**
  String patchMvrStatusUnsupportedFile(Object name);

  /// No description provided for @patchMvrStatusEmptyBytes.
  ///
  /// In fr, this message translates to:
  /// **'❌ Impossible de lire le fichier (bytes vides).\nAstuce : réessaie en sélectionnant le fichier depuis un gestionnaire de fichiers.'**
  String get patchMvrStatusEmptyBytes;

  /// No description provided for @patchMvrStatusExtractingZip.
  ///
  /// In fr, this message translates to:
  /// **'Extraction MVR (archive ZIP)…'**
  String get patchMvrStatusExtractingZip;

  /// No description provided for @patchMvrStatusSceneXmlNotFound.
  ///
  /// In fr, this message translates to:
  /// **'❌ Fichier MVR invalide : XML de scène introuvable.\nAttendu : GeneralSceneDescription.xml (prioritaire) ou Scene.mvr.'**
  String get patchMvrStatusSceneXmlNotFound;

  /// No description provided for @patchMvrStatusLoadingGdtf.
  ///
  /// In fr, this message translates to:
  /// **'Chargement des fichiers GDTF…'**
  String get patchMvrStatusLoadingGdtf;

  /// No description provided for @patchMvrStatusParsingContent.
  ///
  /// In fr, this message translates to:
  /// **'Analyse du contenu MVR…'**
  String get patchMvrStatusParsingContent;

  /// No description provided for @patchMvrStatusNoUsableFixtures.
  ///
  /// In fr, this message translates to:
  /// **'❌ Aucun projecteur exploitable trouvé.'**
  String get patchMvrStatusNoUsableFixtures;

  /// No description provided for @patchMvrStatusFixturesFound.
  ///
  /// In fr, this message translates to:
  /// **'✅ {count} projecteurs trouvés.\nFootprints via GDTF : {resolved}'**
  String patchMvrStatusFixturesFound(Object count, Object resolved);

  /// No description provided for @patchMvrStatusParseError.
  ///
  /// In fr, this message translates to:
  /// **'❌ Erreur parsing MVR : {error}'**
  String patchMvrStatusParseError(Object error);

  /// No description provided for @patchMvrStatusNoContentToLoad.
  ///
  /// In fr, this message translates to:
  /// **'❌ Aucun contenu MVR à charger.'**
  String get patchMvrStatusNoContentToLoad;

  /// No description provided for @patchMvrStatusReferenceLoaded.
  ///
  /// In fr, this message translates to:
  /// **'✅ Référence patch chargée (lecture seule)\nEntrées chargées : {loaded}\nIgnorées (univers/adresse manquants) : {skipped}\nFootprints via GDTF : {footprints}\n\nAucune modification n’a été appliquée aux adresses du MVR.'**
  String patchMvrStatusReferenceLoaded(
      Object loaded, Object skipped, Object footprints);

  /// No description provided for @commonOk.
  ///
  /// In fr, this message translates to:
  /// **'OK'**
  String get commonOk;

  /// No description provided for @patchUniverseAppBarTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch'**
  String get patchUniverseAppBarTitle;

  /// No description provided for @patchUniverseResetTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser la référence'**
  String get patchUniverseResetTooltip;

  /// No description provided for @patchUniverseReferenceTitle.
  ///
  /// In fr, this message translates to:
  /// **'Référence'**
  String get patchUniverseReferenceTitle;

  /// No description provided for @patchUniverseReferenceReadOnly.
  ///
  /// In fr, this message translates to:
  /// **'Lecture seule (depuis MVR)'**
  String get patchUniverseReferenceReadOnly;

  /// No description provided for @patchUniverseReferenceNone.
  ///
  /// In fr, this message translates to:
  /// **'Aucune référence chargée'**
  String get patchUniverseReferenceNone;

  /// No description provided for @patchUniverseUniverseTitle.
  ///
  /// In fr, this message translates to:
  /// **'Univers'**
  String get patchUniverseUniverseTitle;

  /// No description provided for @patchUniverseUniverseDropdownLabel.
  ///
  /// In fr, this message translates to:
  /// **'Univers DMX'**
  String get patchUniverseUniverseDropdownLabel;

  /// No description provided for @patchUniverseUniverseItem.
  ///
  /// In fr, this message translates to:
  /// **'Univers {value}'**
  String patchUniverseUniverseItem(int value);

  /// No description provided for @patchUniverseOccupiedCount.
  ///
  /// In fr, this message translates to:
  /// **'Occupés : {count} / 512'**
  String patchUniverseOccupiedCount(int count);

  /// No description provided for @patchUniverseConflictCount.
  ///
  /// In fr, this message translates to:
  /// **'Conflits : {count} canal(aux)'**
  String patchUniverseConflictCount(int count);

  /// No description provided for @patchUniverseTapHint.
  ///
  /// In fr, this message translates to:
  /// **'Touche une case pour afficher le détail.'**
  String get patchUniverseTapHint;

  /// No description provided for @patchUniverseZoomTitle.
  ///
  /// In fr, this message translates to:
  /// **'Zoom'**
  String get patchUniverseZoomTitle;

  /// No description provided for @patchUniverseZoomOut.
  ///
  /// In fr, this message translates to:
  /// **'Réduire'**
  String get patchUniverseZoomOut;

  /// No description provided for @patchUniverseZoomIn.
  ///
  /// In fr, this message translates to:
  /// **'Agrandir'**
  String get patchUniverseZoomIn;

  /// No description provided for @patchUniverseGridTitle.
  ///
  /// In fr, this message translates to:
  /// **'Occupation (1 à 512)'**
  String get patchUniverseGridTitle;

  /// No description provided for @patchUniverseGridLimitedByWidth.
  ///
  /// In fr, this message translates to:
  /// **'Limité par la largeur de l’écran.'**
  String get patchUniverseGridLimitedByWidth;

  /// No description provided for @patchUniverseLegendFree.
  ///
  /// In fr, this message translates to:
  /// **'Libre'**
  String get patchUniverseLegendFree;

  /// No description provided for @patchUniverseLegendOccupied.
  ///
  /// In fr, this message translates to:
  /// **'Occupé'**
  String get patchUniverseLegendOccupied;

  /// No description provided for @patchUniverseLegendConflict.
  ///
  /// In fr, this message translates to:
  /// **'Conflit'**
  String get patchUniverseLegendConflict;

  /// No description provided for @patchUniverseResetTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser la référence ?'**
  String get patchUniverseResetTitle;

  /// No description provided for @patchUniverseResetContent.
  ///
  /// In fr, this message translates to:
  /// **'Cela efface le patch chargé depuis le MVR dans l’application.\nAucune donnée du fichier n’est modifiée.'**
  String get patchUniverseResetContent;

  /// No description provided for @patchUniverseResetConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser'**
  String get patchUniverseResetConfirm;

  /// No description provided for @patchUniversePopupTitleFree.
  ///
  /// In fr, this message translates to:
  /// **'Canal libre'**
  String get patchUniversePopupTitleFree;

  /// No description provided for @patchUniversePopupTitleOccupied.
  ///
  /// In fr, this message translates to:
  /// **'Canal occupé'**
  String get patchUniversePopupTitleOccupied;

  /// No description provided for @patchUniversePopupTitleConflict.
  ///
  /// In fr, this message translates to:
  /// **'Conflit'**
  String get patchUniversePopupTitleConflict;

  /// No description provided for @patchUniverseStateFree.
  ///
  /// In fr, this message translates to:
  /// **'Libre'**
  String get patchUniverseStateFree;

  /// No description provided for @patchUniverseStateOccupied.
  ///
  /// In fr, this message translates to:
  /// **'Occupé'**
  String get patchUniverseStateOccupied;

  /// No description provided for @patchUniverseStateConflict.
  ///
  /// In fr, this message translates to:
  /// **'Conflit'**
  String get patchUniverseStateConflict;

  /// No description provided for @patchUniversePopupHeader.
  ///
  /// In fr, this message translates to:
  /// **'Univers : {universe}\nAdresse : {address}\nÉtat : {state}'**
  String patchUniversePopupHeader(int universe, int address, String state);

  /// No description provided for @patchUniversePopupManyOccupants.
  ///
  /// In fr, this message translates to:
  /// **'Plusieurs machines occupent ce canal.'**
  String get patchUniversePopupManyOccupants;

  /// No description provided for @patchUniversePopupMore.
  ///
  /// In fr, this message translates to:
  /// **'… et {count} autre(s).'**
  String patchUniversePopupMore(int count);

  /// No description provided for @patchUniverseOccupantLine.
  ///
  /// In fr, this message translates to:
  /// **'• {fixture}\n  {mode} — {channels} canal(aux)\n  {start} → {end}'**
  String patchUniverseOccupantLine(
      String fixture, String mode, int channels, int start, int end);

  /// No description provided for @commonClose.
  ///
  /// In fr, this message translates to:
  /// **'Fermer'**
  String get commonClose;

  /// No description provided for @commonContinue.
  ///
  /// In fr, this message translates to:
  /// **'Continuer'**
  String get commonContinue;

  /// No description provided for @patchTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch DMX'**
  String get patchTitle;

  /// No description provided for @patchReference.
  ///
  /// In fr, this message translates to:
  /// **'Référence'**
  String get patchReference;

  /// No description provided for @patchReadOnly.
  ///
  /// In fr, this message translates to:
  /// **'Lecture seule (depuis MVR)'**
  String get patchReadOnly;

  /// No description provided for @patchNoReference.
  ///
  /// In fr, this message translates to:
  /// **'Aucune référence chargée'**
  String get patchNoReference;

  /// No description provided for @patchUniverse.
  ///
  /// In fr, this message translates to:
  /// **'Univers DMX'**
  String get patchUniverse;

  /// No description provided for @patchOccupied.
  ///
  /// In fr, this message translates to:
  /// **'Occupés : {count} / 512'**
  String patchOccupied(Object count);

  /// No description provided for @patchResetReferenceTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser la référence ?'**
  String get patchResetReferenceTitle;

  /// No description provided for @patchResetReferenceText.
  ///
  /// In fr, this message translates to:
  /// **'Cela efface le patch chargé depuis le MVR dans l’application.\nAucune donnée du fichier n’est modifiée.'**
  String get patchResetReferenceText;

  /// No description provided for @patchLoadReference.
  ///
  /// In fr, this message translates to:
  /// **'Charger comme référence de patch (lecture seule)'**
  String get patchLoadReference;

  /// No description provided for @laserLegalDisclaimerTextLong.
  ///
  /// In fr, this message translates to:
  /// **'AVERTISSEMENT LÉGAL ET CLAUSE DE NON-RESPONSABILITÉ\n\nL\'utilisation de ce calculateur est strictement réservée à titre informatif et indicatif.\nLes résultats obtenus ne constituent pas une expertise technique et ne sauraient engager la responsabilité de l\'éditeur en cas d\'erreur de calcul, d\'omission ou d\'accident survenus lors de l\'installation ou de l\'exploitation du matériel.\n\nCalculs NOHD et Instruments Optiques :\nDans certaines circonstances, des instruments optiques spéciaux (jumelles, télescopes) peuvent être utilisés pour visualiser le laser à une distance plus éloignée.\nCe fait doit être pris en compte lors de la détermination du NOHD.\nDans le calcul ci-joint, aucun instrument optique n\'est pris en compte, car il est très peu probable que cela doive être pris en compte dans l\'industrie courante du laser.\nCependant, il incombe à l\'opérateur de procéder à une évaluation appropriée des risques pour la sécurité.\n\nZones d\'Interférence Visuelle (SZED et CZED) :\nLes calculs des distances SZED (aveuglement temporaire) et CZED (éblouissement) sont basés sur des seuils d\'éclairement énergétique standards pour la vision humaine.\nCes valeurs ne sont valables que pour un observateur dont l\'œil est adapté à l\'obscurité (conditions de spectacle).\nCes résultats ne tiennent pas compte des conditions atmosphériques (brume, pluie, pollution) qui peuvent réduire ou diffuser la portée théorique du faisceau.\n\nParamètres Techniques :\nLe calculateur n\'est applicable que pour les sources laser en mode continu (CW) et n\'est valable que pour la plage de longueur d\'onde de 400 à 700 nm – paramètres standards pour les systèmes laser de spectacle.\n\nAcceptation des Risques :\nCe calculateur est fourni \"tel quel\".\nNous ne garantissons pas l\'exactitude et la précision des résultats.\nEn activant cet outil, l\'utilisateur reconnaît être un professionnel formé aux règles de sécurité en vigueur et accepte l\'entière responsabilité des risques liés à la mise en œuvre des équipements (laser, lumière, vidéo).\nVérifiez systématiquement les données avec les manuels constructeurs officiels.'**
  String get laserLegalDisclaimerTextLong;

  /// No description provided for @commonDash.
  ///
  /// In fr, this message translates to:
  /// **'—'**
  String get commonDash;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'de',
        'en',
        'es',
        'fr',
        'nl',
        'pt'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'nl':
      return AppLocalizationsNl();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
