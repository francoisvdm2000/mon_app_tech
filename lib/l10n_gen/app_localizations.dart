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
/// import 'l10n_gen/app_localizations.dart';
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
  /// **'Reset'**
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

  /// No description provided for @elecTocCopyText.
  ///
  /// In fr, this message translates to:
  /// **'Copier le texte'**
  String get elecTocCopyText;

  /// No description provided for @elecKvaTitle.
  ///
  /// In fr, this message translates to:
  /// **'Conversion kVA'**
  String get elecKvaTitle;

  /// No description provided for @elecKvaFormula.
  ///
  /// In fr, this message translates to:
  /// **'Formule'**
  String get elecKvaFormula;

  /// No description provided for @elecKvaIntro.
  ///
  /// In fr, this message translates to:
  /// **'Calcul de puissance apparente'**
  String get elecKvaIntro;

  /// No description provided for @elecKvaNote.
  ///
  /// In fr, this message translates to:
  /// **'Valeur indicative'**
  String get elecKvaNote;

  /// No description provided for @elecKvaColKva.
  ///
  /// In fr, this message translates to:
  /// **'kVA'**
  String get elecKvaColKva;

  /// No description provided for @elecKvaColPf08.
  ///
  /// In fr, this message translates to:
  /// **'cosφ 0.8'**
  String get elecKvaColPf08;

  /// No description provided for @elecKvaColPf10.
  ///
  /// In fr, this message translates to:
  /// **'cosφ 1.0'**
  String get elecKvaColPf10;

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
  /// **'Importer un fichier MVR ou créer un patch manuellement depuis la librairie.'**
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
  /// **'Laser Advice Max Recommended : {p0}'**
  String laserAdviceMaxRecommended(Object p0);

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
  /// **'Laser Preset Subtitle : {p0} · {p1} · {p2}'**
  String laserPresetSubtitle(Object p0, Object p1, Object p2);

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
  /// **'Video Mp Case Open Min : {p0} · {p1}'**
  String videoMpCaseOpenMin(Object p0, Object p1);

  /// No description provided for @videoMpCaseTightMax.
  ///
  /// In fr, this message translates to:
  /// **'Video Mp Case Tight Max : {p0} · {p1}'**
  String videoMpCaseTightMax(Object p0, Object p1);

  /// No description provided for @videoMpLumiEstimated.
  ///
  /// In fr, this message translates to:
  /// **'Video Mp Lumi Estimated : {p0} · {p1} · {p2} · {p3} · {p4}'**
  String videoMpLumiEstimated(
      Object p0, Object p1, Object p2, Object p3, Object p4);

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
  /// **'Video Lm Result Ratio : {p0}'**
  String videoLmResultRatio(Object p0);

  /// No description provided for @videoLmResultWidth.
  ///
  /// In fr, this message translates to:
  /// **'Video Lm Result Width : {p0}'**
  String videoLmResultWidth(Object p0);

  /// No description provided for @videoLmResultHeight.
  ///
  /// In fr, this message translates to:
  /// **'Video Lm Result Height : {p0} · {p1}'**
  String videoLmResultHeight(Object p0, Object p1);

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
  /// **'Video LED Pitch Uniform : {p0}'**
  String videoLedPitchUniform(Object p0);

  /// No description provided for @videoLedPitchXY.
  ///
  /// In fr, this message translates to:
  /// **'Video LED Pitch XY : {p0} · {p1}'**
  String videoLedPitchXY(Object p0, Object p1);

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
  /// **'Video Calc1 Ok : {p0}'**
  String videoCalc1Ok(Object p0);

  /// No description provided for @videoCalc2Ok.
  ///
  /// In fr, this message translates to:
  /// **'Video Calc2 Ok : {p0}'**
  String videoCalc2Ok(Object p0);

  /// No description provided for @videoCalc3Ok.
  ///
  /// In fr, this message translates to:
  /// **'Video Calc3 Ok : {p0} · {p1}'**
  String videoCalc3Ok(Object p0, Object p1);

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
  /// **'Video Calc4 Result : {p0} · {p1} · {p2} · {p3} · {p4} · {p5} · {p6} · {p7} · {p8}'**
  String videoCalc4Result(Object p0, Object p1, Object p2, Object p3, Object p4,
      Object p5, Object p6, Object p7, Object p8);

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
  /// **'Video Calc5 Result : {p0} · {p1} · {p2} · {p3} · {p4} · {p5} · {p6}'**
  String videoCalc5Result(Object p0, Object p1, Object p2, Object p3, Object p4,
      Object p5, Object p6);

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
  /// **'Video Calc6 Lumi For N : {p0} · {p1} · {p2} · {p3} · {p4}'**
  String videoCalc6LumiForN(
      Object p0, Object p1, Object p2, Object p3, Object p4);

  /// No description provided for @videoCalc6NoteIndicative.
  ///
  /// In fr, this message translates to:
  /// **'Note: estimation indicative (blend/overlap réels peuvent réduire un peu).'**
  String get videoCalc6NoteIndicative;

  /// No description provided for @videoCalc6Result.
  ///
  /// In fr, this message translates to:
  /// **'Video Calc6 Result : {p0} · {p1} · {p2} · {p3} · {p4} · {p5} · {p6} · {p7} · {p8} · {p9} · {p10} · {p11} · {p12} · {p13} · {p14}'**
  String videoCalc6Result(
      Object p0,
      Object p1,
      Object p2,
      Object p3,
      Object p4,
      Object p5,
      Object p6,
      Object p7,
      Object p8,
      Object p9,
      Object p10,
      Object p11,
      Object p12,
      Object p13,
      Object p14);

  /// No description provided for @videoCommonPillFormat.
  ///
  /// In fr, this message translates to:
  /// **'Video Common Pill Format : {p0}'**
  String videoCommonPillFormat(Object p0);

  /// No description provided for @videoCommonPillDistance.
  ///
  /// In fr, this message translates to:
  /// **'Video Common Pill Distance : {p0}'**
  String videoCommonPillDistance(Object p0);

  /// No description provided for @videoCommonPillWidth.
  ///
  /// In fr, this message translates to:
  /// **'Video Common Pill Width : {p0}'**
  String videoCommonPillWidth(Object p0);

  /// No description provided for @videoCommonPillRatio.
  ///
  /// In fr, this message translates to:
  /// **'Video Common Pill Ratio : {p0}'**
  String videoCommonPillRatio(Object p0);

  /// No description provided for @videoCommonPillHeight.
  ///
  /// In fr, this message translates to:
  /// **'Video Common Pill Height : {p0}'**
  String videoCommonPillHeight(Object p0);

  /// No description provided for @videoCommonPillArea.
  ///
  /// In fr, this message translates to:
  /// **'Video Common Pill Area : {p0}'**
  String videoCommonPillArea(Object p0);

  /// No description provided for @videoCommonPillTotalWidth.
  ///
  /// In fr, this message translates to:
  /// **'Video Common Pill Total Width : {p0}'**
  String videoCommonPillTotalWidth(Object p0);

  /// No description provided for @videoCommonPillOverlap.
  ///
  /// In fr, this message translates to:
  /// **'Video Common Pill Overlap : {p0}'**
  String videoCommonPillOverlap(Object p0);

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
  /// **'Video Calc Label : {p0}'**
  String videoCalcLabel(Object p0);

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
  /// **'Video Brightness Result : {p0} · {p1} · {p2} · {p3} · {p4} · {p5} · {p6} · {p7} · {p8}'**
  String videoBrightnessResult(Object p0, Object p1, Object p2, Object p3,
      Object p4, Object p5, Object p6, Object p7, Object p8);

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
  /// **'Mire Mapping Subtitle Pattern : {p0} · {p1} · {p2}'**
  String mireMappingSubtitlePattern(Object p0, Object p1, Object p2);

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
  /// **'Mire Projector Label Pattern : {p0}'**
  String mireProjectorLabelPattern(Object p0);

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
  /// **'Mire Tiles Subtitle Base : {p0} · {p1} · {p2} · {p3}'**
  String mireTilesSubtitleBase(Object p0, Object p1, Object p2, Object p3);

  /// No description provided for @mireTilesSubtitleTilePhys.
  ///
  /// In fr, this message translates to:
  /// **'Mire Tiles Subtitle Tile Phys : {p0} · {p1}'**
  String mireTilesSubtitleTilePhys(Object p0, Object p1);

  /// No description provided for @mireTilesSubtitlePitchEq.
  ///
  /// In fr, this message translates to:
  /// **'Mire Tiles Subtitle Pitch Eq : {p0}'**
  String mireTilesSubtitlePitchEq(Object p0);

  /// No description provided for @mireTilesSubtitlePitchXY.
  ///
  /// In fr, this message translates to:
  /// **'Mire Tiles Subtitle Pitch XY : {p0} · {p1}'**
  String mireTilesSubtitlePitchXY(Object p0, Object p1);

  /// No description provided for @mireTilesSubtitleWallPhys.
  ///
  /// In fr, this message translates to:
  /// **'Mire Tiles Subtitle Wall Phys : {p0} · {p1}'**
  String mireTilesSubtitleWallPhys(Object p0, Object p1);

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
  /// **'Mire Pitch Equal : {p0}'**
  String mirePitchEqual(Object p0);

  /// No description provided for @mirePitchXY.
  ///
  /// In fr, this message translates to:
  /// **'Mire Pitch XY : {p0} · {p1}'**
  String mirePitchXY(Object p0, Object p1);

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
  /// **'Mire LED Wall Resolution : {p0} · {p1}'**
  String mireLedWallResolution(Object p0, Object p1);

  /// No description provided for @mireLedPitchComputed.
  ///
  /// In fr, this message translates to:
  /// **'Mire LED Pitch Computed : {p0}'**
  String mireLedPitchComputed(Object p0);

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

  /// No description provided for @laserLegalDisclaimerText.
  ///
  /// In fr, this message translates to:
  /// **'AVERTISSEMENT LÉGAL ET CLAUSE DE NON-RESPONSABILITÉ\n\nL\'utilisation de ce calculateur est strictement réservée à titre informatif et indicatif.\nLes résultats obtenus ne constituent pas une expertise technique et ne sauraient engager la responsabilité de l\'éditeur en cas d\'erreur de calcul, d\'omission ou d\'accident survenus lors de l\'installation ou de l\'exploitation du matériel.\n\nCalculs NOHD et Instruments Optiques :\nDans certaines circonstances, des instruments optiques spéciaux (jumelles, télescopes) peuvent être utilisés pour visualiser le laser à une distance plus éloignée.\nCe fait doit être pris en compte lors de la détermination du NOHD.\nDans le calcul ci-joint, aucun instrument optique n\'est pris en compte, car il est très peu probable que cela doive être pris en compte dans l\'industrie courante du laser.\nCependant, il incombe à l\'opérateur de procéder à une évaluation appropriée des risques pour la sécurité.\n\nZones d\'Interférence Visuelle (SZED et CZED) :\nLes calculs des distances SZED (aveuglement temporaire) et CZED (éblouissement) sont basés sur des seuils d\'éclairement énergétique standards pour la vision humaine.\nCes valeurs ne sont valables que pour un observateur dont l\'œil est adapté à l\'obscurité (conditions de spectacle).\nCes résultats ne tiennent pas compte des conditions atmosphériques (brume, pluie, pollution) qui peuvent réduire ou diffuser la portée théorique du faisceau.\n\nParamètres Techniques :\nLe calculateur n\'est applicable que pour les sources laser en mode continu (CW) et n\'est valable que pour la plage de longueur d\'onde de 400 à 700 nm – paramètres standards pour les systèmes laser de spectacle.\n\nAcceptation des Risques :\nCe calculateur est fourni \"tel quel\".\nNous ne garantissons pas l\'exactitude et la précision des résultats.\nEn activant cet outil, l\'utilisateur reconnaît être un professionnel formé aux règles de sécurité en vigueur et accepte l\'entière responsabilité des risques liés à la mise en œuvre des équipements (laser, lumière, vidéo).\nVérifiez systématiquement les données avec les manuels constructeurs officiels.'**
  String get laserLegalDisclaimerText;

  /// No description provided for @laserLegalDisclaimerTextLong.
  ///
  /// In fr, this message translates to:
  /// **'AVERTISSEMENT LÉGAL ET CLAUSE DE NON-RESPONSABILITÉ\n\nL\'utilisation de ce calculateur est strictement réservée à titre informatif et indicatif.\nLes résultats obtenus ne constituent pas une expertise technique et ne sauraient engager la responsabilité de l\'éditeur en cas d\'erreur de calcul, d\'omission ou d\'accident survenus lors de l\'installation ou de l\'exploitation du matériel.\n\nCalculs NOHD et Instruments Optiques :\nDans certaines circonstances, des instruments optiques spéciaux (jumelles, télescopes) peuvent être utilisés pour visualiser le laser à une distance plus éloignée.\nCe fait doit être pris en compte lors de la détermination du NOHD.\nDans le calcul ci-joint, aucun instrument optique n\'est pris en compte, car il est très peu probable que cela doive être pris en compte dans l\'industrie courante du laser.\nCependant, il incombe à l\'opérateur de procéder à une évaluation appropriée des risques pour la sécurité.\n\nZones d\'Interférence Visuelle (SZED et CZED) :\nLes calculs des distances SZED (aveuglement temporaire) et CZED (éblouissement) sont basés sur des seuils d\'éclairement énergétique standards pour la vision humaine.\nCes valeurs ne sont valables que pour un observateur dont l\'œil est adapté à l\'obscurité (conditions de spectacle).\nCes résultats ne tiennent pas compte des conditions atmosphériques (brume, pluie, pollution) qui peuvent réduire ou diffuser la portée théorique du faisceau.\n\nParamètres Techniques :\nLe calculateur n\'est applicable que pour les sources laser en mode continu (CW) et n\'est valable que pour la plage de longueur d\'onde de 400 à 700 nm – paramètres standards pour les systèmes laser de spectacle.\n\nAcceptation des Risques :\nCe calculateur est fourni \"tel quel\".\nNous ne garantissons pas l\'exactitude et la précision des résultats.\nEn activant cet outil, l\'utilisateur reconnaît être un professionnel formé aux règles de sécurité en vigueur et accepte l\'entière responsabilité des risques liés à la mise en œuvre des équipements (laser, lumière, vidéo).\nVérifiez systématiquement les données avec les manuels constructeurs officiels.'**
  String get laserLegalDisclaimerTextLong;

  /// No description provided for @common_copie_dans_le_presse_papiers.
  ///
  /// In fr, this message translates to:
  /// **'Copié dans le presse-papiers.'**
  String get common_copie_dans_le_presse_papiers;

  /// No description provided for @mireEcranVideo_mires_ecran_video.
  ///
  /// In fr, this message translates to:
  /// **'Mires écran vidéo'**
  String get mireEcranVideo_mires_ecran_video;

  /// No description provided for @mireEcranVideo_exporter_png.
  ///
  /// In fr, this message translates to:
  /// **'Exporter PNG'**
  String get mireEcranVideo_exporter_png;

  /// No description provided for @mireEcranVideo_exporter_png_2.
  ///
  /// In fr, this message translates to:
  /// **'Exporter PNG'**
  String get mireEcranVideo_exporter_png_2;

  /// No description provided for @mireEcranVideo_combo_grille_cercles_2_barres_centrees.
  ///
  /// In fr, this message translates to:
  /// **'Combo (grille + cercles + 2 barres centrées)'**
  String get mireEcranVideo_combo_grille_cercles_2_barres_centrees;

  /// No description provided for @mireEcranVideo_grille_safe_cercles.
  ///
  /// In fr, this message translates to:
  /// **'Grille + safe + cercles'**
  String get mireEcranVideo_grille_safe_cercles;

  /// No description provided for @mireEcranVideo_barres_rampes_cercles.
  ///
  /// In fr, this message translates to:
  /// **'Barres + rampes + cercles'**
  String get mireEcranVideo_barres_rampes_cercles;

  /// No description provided for @mireEcranVideo_uniformite_cercles.
  ///
  /// In fr, this message translates to:
  /// **'Uniformité + cercles'**
  String get mireEcranVideo_uniformite_cercles;

  /// No description provided for @mireEcranVideo_damier_cercles.
  ///
  /// In fr, this message translates to:
  /// **'Damier + cercles'**
  String get mireEcranVideo_damier_cercles;

  /// No description provided for @mireEcranVideo_horizontal.
  ///
  /// In fr, this message translates to:
  /// **'Horizontal'**
  String get mireEcranVideo_horizontal;

  /// No description provided for @mireEcranVideo_vertical.
  ///
  /// In fr, this message translates to:
  /// **'Vertical'**
  String get mireEcranVideo_vertical;

  /// No description provided for @mireEcranVideo_combo_zones_overlap_blend.
  ///
  /// In fr, this message translates to:
  /// **'Combo (zones + overlap + blend)'**
  String get mireEcranVideo_combo_zones_overlap_blend;

  /// No description provided for @mireEcranVideo_zones_overlap.
  ///
  /// In fr, this message translates to:
  /// **'Zones + overlap'**
  String get mireEcranVideo_zones_overlap;

  /// No description provided for @mireEcranVideo_blend_ramps.
  ///
  /// In fr, this message translates to:
  /// **'Blend ramps'**
  String get mireEcranVideo_blend_ramps;

  /// No description provided for @mireEcranVideo_mire_ecran_simple.
  ///
  /// In fr, this message translates to:
  /// **'Mire écran simple'**
  String get mireEcranVideo_mire_ecran_simple;

  /// No description provided for @mireEcranVideo_mire_mapping_multi_projecteur.
  ///
  /// In fr, this message translates to:
  /// **'Mire mapping multi-projecteur'**
  String get mireEcranVideo_mire_mapping_multi_projecteur;

  /// No description provided for @mireEcranVideo_largeur_px.
  ///
  /// In fr, this message translates to:
  /// **'Largeur (px)'**
  String get mireEcranVideo_largeur_px;

  /// No description provided for @mireEcranVideo_hauteur_px.
  ///
  /// In fr, this message translates to:
  /// **'Hauteur (px)'**
  String get mireEcranVideo_hauteur_px;

  /// No description provided for @mireEcranVideo_largeur_px_2.
  ///
  /// In fr, this message translates to:
  /// **'Largeur (px)'**
  String get mireEcranVideo_largeur_px_2;

  /// No description provided for @mireEcranVideo_hauteur_px_2.
  ///
  /// In fr, this message translates to:
  /// **'Hauteur (px)'**
  String get mireEcranVideo_hauteur_px_2;

  /// No description provided for @mireEcranVideo_nombre_de_projecteurs_n.
  ///
  /// In fr, this message translates to:
  /// **'Nombre de projecteurs (N)'**
  String get mireEcranVideo_nombre_de_projecteurs_n;

  /// No description provided for @mireEcranVideo_overlap.
  ///
  /// In fr, this message translates to:
  /// **'Overlap (%)'**
  String get mireEcranVideo_overlap;

  /// No description provided for @mireEcranVideo_ex_1920.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1920'**
  String get mireEcranVideo_ex_1920;

  /// No description provided for @mireEcranVideo_ex_1080.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1080'**
  String get mireEcranVideo_ex_1080;

  /// No description provided for @mireEcranVideo_ex_3840.
  ///
  /// In fr, this message translates to:
  /// **'ex: 3840'**
  String get mireEcranVideo_ex_3840;

  /// No description provided for @mireEcranVideo_ex_2160.
  ///
  /// In fr, this message translates to:
  /// **'ex: 2160'**
  String get mireEcranVideo_ex_2160;

  /// No description provided for @mireEcranVideo_ex_2.
  ///
  /// In fr, this message translates to:
  /// **'ex: 2'**
  String get mireEcranVideo_ex_2;

  /// No description provided for @mireEcranVideo_ex_10_0.
  ///
  /// In fr, this message translates to:
  /// **'ex: 10.0'**
  String get mireEcranVideo_ex_10_0;

  /// No description provided for @aboutRegistry_dmx_fonctionnement_simple_complet.
  ///
  /// In fr, this message translates to:
  /// **'DMX — fonctionnement (simple & complet)'**
  String get aboutRegistry_dmx_fonctionnement_simple_complet;

  /// No description provided for @aboutRegistry_univers_adresses_trames_cablage_rs_485_t.
  ///
  /// In fr, this message translates to:
  /// **'Univers, adresses, trames, câblage RS-485, terminaison, erreurs terrain.\\n'**
  String get aboutRegistry_univers_adresses_trames_cablage_rs_485_t;

  /// No description provided for @aboutRegistry_art_net_dmx_sur_ip_nodes_unicast_broadca.
  ///
  /// In fr, this message translates to:
  /// **'Art-Net — DMX sur IP (nodes, unicast/broadcast)'**
  String get aboutRegistry_art_net_dmx_sur_ip_nodes_unicast_broadca;

  /// No description provided for @aboutRegistry_univers_dmx_sur_ethernet_udp_nodes_broad.
  ///
  /// In fr, this message translates to:
  /// **'Univers DMX sur Ethernet/UDP, nodes, broadcast vs unicast.\\n'**
  String get aboutRegistry_univers_dmx_sur_ethernet_udp_nodes_broad;

  /// No description provided for @aboutRegistry_sacn_e1_31_multicast_igmp_priorites.
  ///
  /// In fr, this message translates to:
  /// **'sACN / E1.31 — multicast, IGMP, priorités'**
  String get aboutRegistry_sacn_e1_31_multicast_igmp_priorites;

  /// No description provided for @aboutRegistry_standard_dmx_sur_ip_oriente_reseau_pro_n.
  ///
  /// In fr, this message translates to:
  /// **'Standard DMX sur IP orienté réseau pro.\\n'**
  String get aboutRegistry_standard_dmx_sur_ip_oriente_reseau_pro_n;

  /// No description provided for @aboutRegistry_reseau_bases_ip_masque_dhcp_essentiel.
  ///
  /// In fr, this message translates to:
  /// **'Réseau — bases IP / masque / DHCP (essentiel)'**
  String get aboutRegistry_reseau_bases_ip_masque_dhcp_essentiel;

  /// No description provided for @aboutRegistry_comprendre_ip_masque_passerelle_dhcp_vs_.
  ///
  /// In fr, this message translates to:
  /// **'Comprendre IP, masque, passerelle, DHCP vs statique.\\n'**
  String get aboutRegistry_comprendre_ip_masque_passerelle_dhcp_vs_;

  /// No description provided for @aboutRegistry_reseau_rj45_fibre_debits_longueurs.
  ///
  /// In fr, this message translates to:
  /// **'Réseau — RJ45 / Fibre / débits & longueurs'**
  String get aboutRegistry_reseau_rj45_fibre_debits_longueurs;

  /// No description provided for @aboutRegistry_cat5e_cat8_fibre_om3_om4_os2_lc_sc_mpo_d.
  ///
  /// In fr, this message translates to:
  /// **'Cat5e→Cat8, fibre OM3/OM4/OS2, LC/SC/MPO, distances typiques, bonnes pratiques show.'**
  String get aboutRegistry_cat5e_cat8_fibre_om3_om4_os2_lc_sc_mpo_d;

  /// No description provided for @aboutRegistry_reseau_lumiere_vlan_igmp_wi_fi_vs_filair.
  ///
  /// In fr, this message translates to:
  /// **'Réseau lumière — VLAN, IGMP, Wi-Fi vs filaire'**
  String get aboutRegistry_reseau_lumiere_vlan_igmp_wi_fi_vs_filair;

  /// No description provided for @aboutRegistry_architecture_simple_et_robuste_pour_art_.
  ///
  /// In fr, this message translates to:
  /// **'Architecture simple et robuste pour Art-Net/sACN.\\n'**
  String get aboutRegistry_architecture_simple_et_robuste_pour_art_;

  /// No description provided for @aboutRegistry_video_sdi_ndi_ip_srt_rtmp.
  ///
  /// In fr, this message translates to:
  /// **'Vidéo — SDI / NDI / IP (SRT/RTMP)'**
  String get aboutRegistry_video_sdi_ndi_ip_srt_rtmp;

  /// No description provided for @aboutRegistry_choisir_selon_latence_fiabilite_cablage_.
  ///
  /// In fr, this message translates to:
  /// **'Choisir selon latence, fiabilité, câblage, réseau LAN vs WAN.\\n'**
  String get aboutRegistry_choisir_selon_latence_fiabilite_cablage_;

  /// No description provided for @aboutRegistry_electrique_schuko_p17_puissances.
  ///
  /// In fr, this message translates to:
  /// **'Électrique — Schuko / P17 / puissances'**
  String get aboutRegistry_electrique_schuko_p17_puissances;

  /// No description provided for @aboutRegistry_connecteurs_mono_tri_tableaux_kw_rapides.
  ///
  /// In fr, this message translates to:
  /// **'Connecteurs, mono/tri, tableaux kW rapides (16A→400A), pièges terrain.'**
  String get aboutRegistry_connecteurs_mono_tri_tableaux_kw_rapides;

  /// No description provided for @aboutRegistry_informatique_usb_hdmi_dp_sata_nvme.
  ///
  /// In fr, this message translates to:
  /// **'Informatique — USB / HDMI / DP / SATA / NVMe…'**
  String get aboutRegistry_informatique_usb_hdmi_dp_sata_nvme;

  /// No description provided for @aboutRegistry_debits_utiles_versions_limites_reelles_p.
  ///
  /// In fr, this message translates to:
  /// **'Débits utiles, versions, limites réelles, pièges marketing.'**
  String get aboutRegistry_debits_utiles_versions_limites_reelles_p;

  /// No description provided for @fixtureCatalog_catalogue.
  ///
  /// In fr, this message translates to:
  /// **'Catalogue'**
  String get fixtureCatalog_catalogue;

  /// No description provided for @fixtureCatalog_ouvrir_le_manuel.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrir le manuel'**
  String get fixtureCatalog_ouvrir_le_manuel;

  /// No description provided for @fixtureCatalog_ouvrir_la_charte_dmx.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrir la charte DMX'**
  String get fixtureCatalog_ouvrir_la_charte_dmx;

  /// No description provided for @fixtureCatalog_catalogue_mis_a_jour.
  ///
  /// In fr, this message translates to:
  /// **'Catalogue mis à jour.'**
  String get fixtureCatalog_catalogue_mis_a_jour;

  /// Auto-generated placeholders for L10n.
  ///
  /// In fr, this message translates to:
  /// **'Échec synchronisation : {error}'**
  String fixtureCatalog_echec_synchronisation_e(Object error);

  /// Auto-generated placeholders for L10n.
  ///
  /// In fr, this message translates to:
  /// **'{label} : {value}'**
  String fixtureCatalog_label_value(Object label, Object value);

  /// No description provided for @fixtureCatalog_constructeur_manufacturers_length.
  ///
  /// In fr, this message translates to:
  /// **'FixtureCatalog constructeur manufacturers length : {p0}'**
  String fixtureCatalog_constructeur_manufacturers_length(Object p0);

  /// No description provided for @fixtureCatalog_type_de_projecteur_types_length.
  ///
  /// In fr, this message translates to:
  /// **'FixtureCatalog type de projecteur types length : {p0}'**
  String fixtureCatalog_type_de_projecteur_types_length(Object p0);

  /// No description provided for @fixtureCatalog_modele_products_length.
  ///
  /// In fr, this message translates to:
  /// **'FixtureCatalog modele products length : {p0}'**
  String fixtureCatalog_modele_products_length(Object p0);

  /// No description provided for @fixtureCatalog_mode_dmx_modenames_length.
  ///
  /// In fr, this message translates to:
  /// **'FixtureCatalog mode DMX modenames length : {p0}'**
  String fixtureCatalog_mode_dmx_modenames_length(Object p0);

  /// No description provided for @fixtureCatalog_mettre_a_jour.
  ///
  /// In fr, this message translates to:
  /// **'Mettre à jour'**
  String get fixtureCatalog_mettre_a_jour;

  /// No description provided for @fixtureCatalog_reinitialiser.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser'**
  String get fixtureCatalog_reinitialiser;

  /// No description provided for @aboutInformatique_informatique_reperes_terrain.
  ///
  /// In fr, this message translates to:
  /// **'Informatique — repères terrain'**
  String get aboutInformatique_informatique_reperes_terrain;

  /// No description provided for @aboutInformatique_sommaire.
  ///
  /// In fr, this message translates to:
  /// **'Sommaire'**
  String get aboutInformatique_sommaire;

  /// No description provided for @aboutInformatique_1_usb_usb_c_thunderbolt.
  ///
  /// In fr, this message translates to:
  /// **'1) USB / USB-C / Thunderbolt'**
  String get aboutInformatique_1_usb_usb_c_thunderbolt;

  /// No description provided for @aboutInformatique_point_critique.
  ///
  /// In fr, this message translates to:
  /// **'Point critique'**
  String get aboutInformatique_point_critique;

  /// No description provided for @aboutInformatique_reperes_vitesses_ordre_de_grandeur.
  ///
  /// In fr, this message translates to:
  /// **'Repères vitesses (ordre de grandeur)'**
  String get aboutInformatique_reperes_vitesses_ordre_de_grandeur;

  /// No description provided for @aboutInformatique_2_stockage_sata_nvme_ssd.
  ///
  /// In fr, this message translates to:
  /// **'2) Stockage (SATA / NVMe / SSD)'**
  String get aboutInformatique_2_stockage_sata_nvme_ssd;

  /// No description provided for @aboutInformatique_sata_vs_nvme.
  ///
  /// In fr, this message translates to:
  /// **'SATA vs NVMe'**
  String get aboutInformatique_sata_vs_nvme;

  /// No description provided for @aboutInformatique_terrain_video.
  ///
  /// In fr, this message translates to:
  /// **'Terrain vidéo'**
  String get aboutInformatique_terrain_video;

  /// No description provided for @aboutInformatique_3_liaisons_video_dp_hdmi.
  ///
  /// In fr, this message translates to:
  /// **'3) Liaisons vidéo (DP / HDMI)'**
  String get aboutInformatique_3_liaisons_video_dp_hdmi;

  /// No description provided for @aboutInformatique_repere_important.
  ///
  /// In fr, this message translates to:
  /// **'Repère important'**
  String get aboutInformatique_repere_important;

  /// No description provided for @aboutInformatique_dp_vs_hdmi_tres_simplifie.
  ///
  /// In fr, this message translates to:
  /// **'DP vs HDMI (très simplifié)'**
  String get aboutInformatique_dp_vs_hdmi_tres_simplifie;

  /// No description provided for @aboutInformatique_4_pcie_gpu_reperes.
  ///
  /// In fr, this message translates to:
  /// **'4) PCIe / GPU (repères)'**
  String get aboutInformatique_4_pcie_gpu_reperes;

  /// No description provided for @aboutInformatique_terrain.
  ///
  /// In fr, this message translates to:
  /// **'Terrain'**
  String get aboutInformatique_terrain;

  /// No description provided for @aboutInformatique_5_checklist_plateau.
  ///
  /// In fr, this message translates to:
  /// **'5) Checklist (plateau)'**
  String get aboutInformatique_5_checklist_plateau;

  /// No description provided for @aboutInformatique_rapide.
  ///
  /// In fr, this message translates to:
  /// **'Rapide'**
  String get aboutInformatique_rapide;

  /// No description provided for @aboutInformatique_copier_resume.
  ///
  /// In fr, this message translates to:
  /// **'Copier résumé'**
  String get aboutInformatique_copier_resume;

  /// No description provided for @aboutInformatique_copier.
  ///
  /// In fr, this message translates to:
  /// **'Copier'**
  String get aboutInformatique_copier;

  /// No description provided for @aboutElectricite_electrique_reperes_terrain.
  ///
  /// In fr, this message translates to:
  /// **'Électrique — repères terrain'**
  String get aboutElectricite_electrique_reperes_terrain;

  /// No description provided for @aboutElectricite_sommaire.
  ///
  /// In fr, this message translates to:
  /// **'Sommaire'**
  String get aboutElectricite_sommaire;

  /// No description provided for @aboutElectricite_1_bases_w_a_v_kw.
  ///
  /// In fr, this message translates to:
  /// **'1) Bases (W, A, V, kW)'**
  String get aboutElectricite_1_bases_w_a_v_kw;

  /// No description provided for @aboutElectricite_3_formules_utiles.
  ///
  /// In fr, this message translates to:
  /// **'3 formules utiles'**
  String get aboutElectricite_3_formules_utiles;

  /// No description provided for @aboutElectricite_reperes_terrain.
  ///
  /// In fr, this message translates to:
  /// **'Repères terrain'**
  String get aboutElectricite_reperes_terrain;

  /// No description provided for @aboutElectricite_2_connecteurs_schuko_p17_powercon.
  ///
  /// In fr, this message translates to:
  /// **'2) Connecteurs (Schuko / P17 / PowerCON)'**
  String get aboutElectricite_2_connecteurs_schuko_p17_powercon;

  /// No description provided for @aboutElectricite_schuko_prises_domestiques.
  ///
  /// In fr, this message translates to:
  /// **'Schuko (prises domestiques)'**
  String get aboutElectricite_schuko_prises_domestiques;

  /// No description provided for @aboutElectricite_p17_cee_bleu_rouge.
  ///
  /// In fr, this message translates to:
  /// **'P17 / CEE (bleu/rouge)'**
  String get aboutElectricite_p17_cee_bleu_rouge;

  /// No description provided for @aboutElectricite_powercon_audio_eclairage.
  ///
  /// In fr, this message translates to:
  /// **'PowerCON (audio/éclairage)'**
  String get aboutElectricite_powercon_audio_eclairage;

  /// No description provided for @aboutElectricite_3_mono_tri_ce_que_ca_change.
  ///
  /// In fr, this message translates to:
  /// **'3) Mono / Tri (ce que ça change)'**
  String get aboutElectricite_3_mono_tri_ce_que_ca_change;

  /// No description provided for @aboutElectricite_pieges_frequents.
  ///
  /// In fr, this message translates to:
  /// **'Pièges fréquents'**
  String get aboutElectricite_pieges_frequents;

  /// No description provided for @aboutElectricite_methode_simple.
  ///
  /// In fr, this message translates to:
  /// **'Méthode simple'**
  String get aboutElectricite_methode_simple;

  /// No description provided for @aboutElectricite_4_table_rapide_16a_400a.
  ///
  /// In fr, this message translates to:
  /// **'4) Table rapide (16A → 400A)'**
  String get aboutElectricite_4_table_rapide_16a_400a;

  /// No description provided for @aboutElectricite_important.
  ///
  /// In fr, this message translates to:
  /// **'Important'**
  String get aboutElectricite_important;

  /// No description provided for @aboutElectricite_5_securite_pieges_terrain.
  ///
  /// In fr, this message translates to:
  /// **'5) Sécurité & pièges terrain'**
  String get aboutElectricite_5_securite_pieges_terrain;

  /// No description provided for @aboutElectricite_a_ne_pas_faire.
  ///
  /// In fr, this message translates to:
  /// **'À ne pas faire'**
  String get aboutElectricite_a_ne_pas_faire;

  /// No description provided for @aboutElectricite_signaux_d_alerte.
  ///
  /// In fr, this message translates to:
  /// **'Signaux d’alerte'**
  String get aboutElectricite_signaux_d_alerte;

  /// No description provided for @aboutElectricite_6_checklist.
  ///
  /// In fr, this message translates to:
  /// **'6) Checklist'**
  String get aboutElectricite_6_checklist;

  /// No description provided for @aboutElectricite_rapide.
  ///
  /// In fr, this message translates to:
  /// **'Rapide'**
  String get aboutElectricite_rapide;

  /// No description provided for @aboutElectricite_copier_resume.
  ///
  /// In fr, this message translates to:
  /// **'Copier résumé'**
  String get aboutElectricite_copier_resume;

  /// No description provided for @aboutElectricite_copier.
  ///
  /// In fr, this message translates to:
  /// **'Copier'**
  String get aboutElectricite_copier;

  /// No description provided for @aboutNetwork_reseau_lumiere_vlan_igmp_wi_fi.
  ///
  /// In fr, this message translates to:
  /// **'Réseau lumière — VLAN, IGMP, Wi-Fi'**
  String get aboutNetwork_reseau_lumiere_vlan_igmp_wi_fi;

  /// No description provided for @aboutNetwork_1_objectif_reseau_stable.
  ///
  /// In fr, this message translates to:
  /// **'1) Objectif: réseau stable'**
  String get aboutNetwork_1_objectif_reseau_stable;

  /// No description provided for @aboutNetwork_regle_de_base.
  ///
  /// In fr, this message translates to:
  /// **'Règle de base'**
  String get aboutNetwork_regle_de_base;

  /// No description provided for @aboutNetwork_2_plan_ip_simple.
  ///
  /// In fr, this message translates to:
  /// **'2) Plan IP (simple)'**
  String get aboutNetwork_2_plan_ip_simple;

  /// No description provided for @aboutNetwork_exemple_de_plan_simple.
  ///
  /// In fr, this message translates to:
  /// **'Exemple de plan (simple)'**
  String get aboutNetwork_exemple_de_plan_simple;

  /// No description provided for @aboutNetwork_3_vlan_separation.
  ///
  /// In fr, this message translates to:
  /// **'3) VLAN (séparation)'**
  String get aboutNetwork_3_vlan_separation;

  /// No description provided for @aboutNetwork_ce_que_tu_gagnes.
  ///
  /// In fr, this message translates to:
  /// **'Ce que tu gagnes'**
  String get aboutNetwork_ce_que_tu_gagnes;

  /// No description provided for @aboutNetwork_4_igmp_sacn_multicast.
  ///
  /// In fr, this message translates to:
  /// **'4) IGMP (sACN multicast)'**
  String get aboutNetwork_4_igmp_sacn_multicast;

  /// No description provided for @aboutNetwork_igmp_querier_idee_simple.
  ///
  /// In fr, this message translates to:
  /// **'IGMP querier (idée simple)'**
  String get aboutNetwork_igmp_querier_idee_simple;

  /// No description provided for @aboutNetwork_5_wi_fi_vs_filaire.
  ///
  /// In fr, this message translates to:
  /// **'5) Wi-Fi vs filaire'**
  String get aboutNetwork_5_wi_fi_vs_filaire;

  /// No description provided for @aboutNetwork_regle_simple.
  ///
  /// In fr, this message translates to:
  /// **'Règle simple'**
  String get aboutNetwork_regle_simple;

  /// No description provided for @aboutNetwork_6_switch_ce_qu_il_faut.
  ///
  /// In fr, this message translates to:
  /// **'6) Switch: ce qu’il faut'**
  String get aboutNetwork_6_switch_ce_qu_il_faut;

  /// No description provided for @aboutNetwork_minimum_recommande.
  ///
  /// In fr, this message translates to:
  /// **'Minimum recommandé'**
  String get aboutNetwork_minimum_recommande;

  /// No description provided for @aboutNetwork_7_schemas.
  ///
  /// In fr, this message translates to:
  /// **'7) Schémas'**
  String get aboutNetwork_7_schemas;

  /// No description provided for @aboutNetwork_7bis_images_assets.
  ///
  /// In fr, this message translates to:
  /// **'7bis) Images (assets)'**
  String get aboutNetwork_7bis_images_assets;

  /// No description provided for @aboutNetwork_8_checklist.
  ///
  /// In fr, this message translates to:
  /// **'8) Checklist'**
  String get aboutNetwork_8_checklist;

  /// No description provided for @aboutNetwork_avant_d_ouvrir_wireshark.
  ///
  /// In fr, this message translates to:
  /// **'Avant d’ouvrir Wireshark 😄'**
  String get aboutNetwork_avant_d_ouvrir_wireshark;

  /// No description provided for @aboutNetwork_sommaire.
  ///
  /// In fr, this message translates to:
  /// **'Sommaire'**
  String get aboutNetwork_sommaire;

  /// No description provided for @aboutNetwork_copier_liste_assets.
  ///
  /// In fr, this message translates to:
  /// **'Copier liste assets'**
  String get aboutNetwork_copier_liste_assets;

  /// No description provided for @aboutNetwork_copier.
  ///
  /// In fr, this message translates to:
  /// **'Copier'**
  String get aboutNetwork_copier;

  /// No description provided for @aboutNetwork_copier_reperes.
  ///
  /// In fr, this message translates to:
  /// **'Copier repères'**
  String get aboutNetwork_copier_reperes;

  /// No description provided for @aboutVideo_video_reperes_terrain.
  ///
  /// In fr, this message translates to:
  /// **'Vidéo — repères terrain'**
  String get aboutVideo_video_reperes_terrain;

  /// No description provided for @aboutVideo_sommaire.
  ///
  /// In fr, this message translates to:
  /// **'Sommaire'**
  String get aboutVideo_sommaire;

  /// No description provided for @aboutVideo_1_bases_video_mots_cles.
  ///
  /// In fr, this message translates to:
  /// **'1) Bases vidéo (mots-clés)'**
  String get aboutVideo_1_bases_video_mots_cles;

  /// No description provided for @aboutVideo_vocabulaire_utile.
  ///
  /// In fr, this message translates to:
  /// **'Vocabulaire utile'**
  String get aboutVideo_vocabulaire_utile;

  /// No description provided for @aboutVideo_2_resolution_fps.
  ///
  /// In fr, this message translates to:
  /// **'2) Résolution & FPS'**
  String get aboutVideo_2_resolution_fps;

  /// No description provided for @aboutVideo_resolution.
  ///
  /// In fr, this message translates to:
  /// **'Résolution'**
  String get aboutVideo_resolution;

  /// No description provided for @aboutVideo_fps.
  ///
  /// In fr, this message translates to:
  /// **'FPS'**
  String get aboutVideo_fps;

  /// No description provided for @aboutVideo_3_couleur_4_4_4_4_2_2_10_bit.
  ///
  /// In fr, this message translates to:
  /// **'3) Couleur (4:4:4 / 4:2:2 / 10-bit)'**
  String get aboutVideo_3_couleur_4_4_4_4_2_2_10_bit;

  /// No description provided for @aboutVideo_sampling.
  ///
  /// In fr, this message translates to:
  /// **'Sampling'**
  String get aboutVideo_sampling;

  /// No description provided for @aboutVideo_bit_depth.
  ///
  /// In fr, this message translates to:
  /// **'Bit depth'**
  String get aboutVideo_bit_depth;

  /// No description provided for @aboutVideo_4_sync_genlock_timecode.
  ///
  /// In fr, this message translates to:
  /// **'4) Sync (Genlock / Timecode)'**
  String get aboutVideo_4_sync_genlock_timecode;

  /// No description provided for @aboutVideo_genlock.
  ///
  /// In fr, this message translates to:
  /// **'Genlock'**
  String get aboutVideo_genlock;

  /// No description provided for @aboutVideo_timecode.
  ///
  /// In fr, this message translates to:
  /// **'Timecode'**
  String get aboutVideo_timecode;

  /// No description provided for @aboutVideo_5_cables_distances.
  ///
  /// In fr, this message translates to:
  /// **'5) Câbles & distances'**
  String get aboutVideo_5_cables_distances;

  /// No description provided for @aboutVideo_regles_simples.
  ///
  /// In fr, this message translates to:
  /// **'Règles simples'**
  String get aboutVideo_regles_simples;

  /// No description provided for @aboutVideo_6_sdi_3g_6g_12g.
  ///
  /// In fr, this message translates to:
  /// **'6) SDI (3G / 6G / 12G)'**
  String get aboutVideo_6_sdi_3g_6g_12g;

  /// No description provided for @aboutVideo_reperes.
  ///
  /// In fr, this message translates to:
  /// **'Repères'**
  String get aboutVideo_reperes;

  /// No description provided for @aboutVideo_7_hdmi_terrain.
  ///
  /// In fr, this message translates to:
  /// **'7) HDMI — terrain'**
  String get aboutVideo_7_hdmi_terrain;

  /// No description provided for @aboutVideo_a_surveiller.
  ///
  /// In fr, this message translates to:
  /// **'À surveiller'**
  String get aboutVideo_a_surveiller;

  /// No description provided for @aboutVideo_8_ndi.
  ///
  /// In fr, this message translates to:
  /// **'8) NDI'**
  String get aboutVideo_8_ndi;

  /// No description provided for @aboutVideo_ip_video.
  ///
  /// In fr, this message translates to:
  /// **'IP vidéo'**
  String get aboutVideo_ip_video;

  /// No description provided for @aboutVideo_9_mapping_led_multi_projo.
  ///
  /// In fr, this message translates to:
  /// **'9) Mapping / LED / multi-projo'**
  String get aboutVideo_9_mapping_led_multi_projo;

  /// No description provided for @aboutVideo_terrain.
  ///
  /// In fr, this message translates to:
  /// **'Terrain'**
  String get aboutVideo_terrain;

  /// No description provided for @aboutVideo_10_checklist_terrain.
  ///
  /// In fr, this message translates to:
  /// **'10) Checklist terrain'**
  String get aboutVideo_10_checklist_terrain;

  /// No description provided for @aboutVideo_avant_de_paniquer.
  ///
  /// In fr, this message translates to:
  /// **'Avant de paniquer'**
  String get aboutVideo_avant_de_paniquer;

  /// No description provided for @aboutVideo_copier_resume.
  ///
  /// In fr, this message translates to:
  /// **'Copier résumé'**
  String get aboutVideo_copier_resume;

  /// No description provided for @aboutArtnet_art_net_univers_dmx_sur_ip_simple_comple.
  ///
  /// In fr, this message translates to:
  /// **'Art-Net — univers DMX sur IP (simple & complet)'**
  String get aboutArtnet_art_net_univers_dmx_sur_ip_simple_comple;

  /// No description provided for @aboutArtnet_1_art_net_c_est_quoi_et_pourquoi.
  ///
  /// In fr, this message translates to:
  /// **'1) Art-Net — c’est quoi et pourquoi'**
  String get aboutArtnet_1_art_net_c_est_quoi_et_pourquoi;

  /// No description provided for @aboutArtnet_pourquoi_c_est_utile.
  ///
  /// In fr, this message translates to:
  /// **'Pourquoi c’est utile'**
  String get aboutArtnet_pourquoi_c_est_utile;

  /// No description provided for @aboutArtnet_2_adressage_univers_mapping_propre.
  ///
  /// In fr, this message translates to:
  /// **'2) Adressage & univers — mapping propre'**
  String get aboutArtnet_2_adressage_univers_mapping_propre;

  /// No description provided for @aboutArtnet_methode_simple_qui_evite_80_des_erreurs.
  ///
  /// In fr, this message translates to:
  /// **'Méthode simple (qui évite 80% des erreurs)'**
  String get aboutArtnet_methode_simple_qui_evite_80_des_erreurs;

  /// No description provided for @aboutArtnet_3_limites_perf_ce_qui_casse_en_premier.
  ///
  /// In fr, this message translates to:
  /// **'3) Limites & perf — ce qui casse en premier'**
  String get aboutArtnet_3_limites_perf_ce_qui_casse_en_premier;

  /// No description provided for @aboutArtnet_les_limites_reelles_dans_l_ordre.
  ///
  /// In fr, this message translates to:
  /// **'Les limites “réelles” (dans l’ordre)'**
  String get aboutArtnet_les_limites_reelles_dans_l_ordre;

  /// No description provided for @aboutArtnet_4_nodes_splitters_rdm.
  ///
  /// In fr, this message translates to:
  /// **'4) Nodes, splitters & RDM'**
  String get aboutArtnet_4_nodes_splitters_rdm;

  /// No description provided for @aboutArtnet_rdm_sur_art_net_support_variable.
  ///
  /// In fr, this message translates to:
  /// **'RDM sur Art-Net (support variable)'**
  String get aboutArtnet_rdm_sur_art_net_support_variable;

  /// No description provided for @aboutArtnet_5_depannage_symptomes_causes.
  ///
  /// In fr, this message translates to:
  /// **'5) Dépannage — symptômes → causes'**
  String get aboutArtnet_5_depannage_symptomes_causes;

  /// No description provided for @aboutArtnet_symptomes_causes_probables.
  ///
  /// In fr, this message translates to:
  /// **'Symptômes → causes probables'**
  String get aboutArtnet_symptomes_causes_probables;

  /// No description provided for @aboutArtnet_6_schemas_reseau_unicast_vs_broadcast.
  ///
  /// In fr, this message translates to:
  /// **'6) Schémas (réseau / unicast vs broadcast)'**
  String get aboutArtnet_6_schemas_reseau_unicast_vs_broadcast;

  /// No description provided for @aboutArtnet_6bis_images_assets_rj45_switch_cables.
  ///
  /// In fr, this message translates to:
  /// **'6bis) Images (assets) — RJ45/switch/câbles'**
  String get aboutArtnet_6bis_images_assets_rj45_switch_cables;

  /// No description provided for @aboutArtnet_7_checklist_rapide.
  ///
  /// In fr, this message translates to:
  /// **'7) Checklist rapide'**
  String get aboutArtnet_7_checklist_rapide;

  /// No description provided for @aboutArtnet_avant_de_paniquer.
  ///
  /// In fr, this message translates to:
  /// **'Avant de paniquer'**
  String get aboutArtnet_avant_de_paniquer;

  /// No description provided for @aboutArtnet_sommaire.
  ///
  /// In fr, this message translates to:
  /// **'Sommaire'**
  String get aboutArtnet_sommaire;

  /// No description provided for @aboutArtnet_copier_liste_assets.
  ///
  /// In fr, this message translates to:
  /// **'Copier liste assets'**
  String get aboutArtnet_copier_liste_assets;

  /// No description provided for @aboutArtnet_copier_la_checklist.
  ///
  /// In fr, this message translates to:
  /// **'Copier la checklist'**
  String get aboutArtnet_copier_la_checklist;

  /// No description provided for @aboutArtnet_copier_reperes.
  ///
  /// In fr, this message translates to:
  /// **'Copier repères'**
  String get aboutArtnet_copier_reperes;

  /// No description provided for @aboutReseau_reseau_reperes_terrain.
  ///
  /// In fr, this message translates to:
  /// **'Réseau — repères terrain'**
  String get aboutReseau_reseau_reperes_terrain;

  /// No description provided for @aboutReseau_sommaire.
  ///
  /// In fr, this message translates to:
  /// **'Sommaire'**
  String get aboutReseau_sommaire;

  /// No description provided for @aboutReseau_1_bases_reseau_lan_ip_debit.
  ///
  /// In fr, this message translates to:
  /// **'1) Bases réseau (LAN / IP / débit)'**
  String get aboutReseau_1_bases_reseau_lan_ip_debit;

  /// No description provided for @aboutReseau_les_3_idees_simples.
  ///
  /// In fr, this message translates to:
  /// **'Les 3 idées simples'**
  String get aboutReseau_les_3_idees_simples;

  /// No description provided for @aboutReseau_topologie_show_propre.
  ///
  /// In fr, this message translates to:
  /// **'Topologie show (propre)'**
  String get aboutReseau_topologie_show_propre;

  /// No description provided for @aboutReseau_2_rj45_categories_cat5e_6_6a.
  ///
  /// In fr, this message translates to:
  /// **'2) RJ45 & catégories (Cat5e/6/6A/…)'**
  String get aboutReseau_2_rj45_categories_cat5e_6_6a;

  /// No description provided for @aboutReseau_reperes_rapides.
  ///
  /// In fr, this message translates to:
  /// **'Repères rapides'**
  String get aboutReseau_reperes_rapides;

  /// No description provided for @aboutReseau_terrain.
  ///
  /// In fr, this message translates to:
  /// **'Terrain'**
  String get aboutReseau_terrain;

  /// No description provided for @aboutReseau_3_poe_alimentation_reseau.
  ///
  /// In fr, this message translates to:
  /// **'3) PoE (alimentation réseau)'**
  String get aboutReseau_3_poe_alimentation_reseau;

  /// No description provided for @aboutReseau_reperes.
  ///
  /// In fr, this message translates to:
  /// **'Repères'**
  String get aboutReseau_reperes;

  /// No description provided for @aboutReseau_4_fibre_sm_mm_connecteurs_lc_sc.
  ///
  /// In fr, this message translates to:
  /// **'4) Fibre (SM/MM) + connecteurs (LC/SC)'**
  String get aboutReseau_4_fibre_sm_mm_connecteurs_lc_sc;

  /// No description provided for @aboutReseau_pourquoi_la_fibre_en_show.
  ///
  /// In fr, this message translates to:
  /// **'Pourquoi la fibre en show'**
  String get aboutReseau_pourquoi_la_fibre_en_show;

  /// No description provided for @aboutReseau_multimode_vs_monomode_repere_simple.
  ///
  /// In fr, this message translates to:
  /// **'Multimode vs Monomode (repère simple)'**
  String get aboutReseau_multimode_vs_monomode_repere_simple;

  /// No description provided for @aboutReseau_connecteurs.
  ///
  /// In fr, this message translates to:
  /// **'Connecteurs'**
  String get aboutReseau_connecteurs;

  /// No description provided for @aboutReseau_5_sfp_sfp_qsfp_modules.
  ///
  /// In fr, this message translates to:
  /// **'5) SFP / SFP+ / QSFP (modules)'**
  String get aboutReseau_5_sfp_sfp_qsfp_modules;

  /// No description provided for @aboutReseau_reperes_2.
  ///
  /// In fr, this message translates to:
  /// **'Repères'**
  String get aboutReseau_reperes_2;

  /// No description provided for @aboutReseau_6_switches_vlan_igmp_qos.
  ///
  /// In fr, this message translates to:
  /// **'6) Switches (VLAN / IGMP / QoS)'**
  String get aboutReseau_6_switches_vlan_igmp_qos;

  /// No description provided for @aboutReseau_fonctions_utiles_en_spectacle.
  ///
  /// In fr, this message translates to:
  /// **'Fonctions utiles en spectacle'**
  String get aboutReseau_fonctions_utiles_en_spectacle;

  /// No description provided for @aboutReseau_erreurs_frequentes.
  ///
  /// In fr, this message translates to:
  /// **'Erreurs fréquentes'**
  String get aboutReseau_erreurs_frequentes;

  /// No description provided for @aboutReseau_7_art_net_sacn_sur_reseau_conseils.
  ///
  /// In fr, this message translates to:
  /// **'7) Art-Net / sACN sur réseau (conseils)'**
  String get aboutReseau_7_art_net_sacn_sur_reseau_conseils;

  /// No description provided for @aboutReseau_art_net_terrain.
  ///
  /// In fr, this message translates to:
  /// **'Art-Net (terrain)'**
  String get aboutReseau_art_net_terrain;

  /// No description provided for @aboutReseau_sacn_terrain.
  ///
  /// In fr, this message translates to:
  /// **'sACN (terrain)'**
  String get aboutReseau_sacn_terrain;

  /// No description provided for @aboutReseau_8_checklist.
  ///
  /// In fr, this message translates to:
  /// **'8) Checklist'**
  String get aboutReseau_8_checklist;

  /// No description provided for @aboutReseau_rapide.
  ///
  /// In fr, this message translates to:
  /// **'Rapide'**
  String get aboutReseau_rapide;

  /// No description provided for @aboutReseau_copier_resume.
  ///
  /// In fr, this message translates to:
  /// **'Copier résumé'**
  String get aboutReseau_copier_resume;

  /// No description provided for @aboutReseau_copier.
  ///
  /// In fr, this message translates to:
  /// **'Copier'**
  String get aboutReseau_copier;

  /// No description provided for @aboutSacn_sacn_e1_31_multicast_priorites.
  ///
  /// In fr, this message translates to:
  /// **'sACN / E1.31 — multicast & priorités'**
  String get aboutSacn_sacn_e1_31_multicast_priorites;

  /// No description provided for @aboutSacn_1_a_quoi_sert_sacn.
  ///
  /// In fr, this message translates to:
  /// **'1) À quoi sert sACN ?'**
  String get aboutSacn_1_a_quoi_sert_sacn;

  /// No description provided for @aboutSacn_quand_c_est_top.
  ///
  /// In fr, this message translates to:
  /// **'Quand c’est top'**
  String get aboutSacn_quand_c_est_top;

  /// No description provided for @aboutSacn_2_univers_numerotation.
  ///
  /// In fr, this message translates to:
  /// **'2) Univers (numérotation)'**
  String get aboutSacn_2_univers_numerotation;

  /// No description provided for @aboutSacn_erreur_classique.
  ///
  /// In fr, this message translates to:
  /// **'Erreur classique'**
  String get aboutSacn_erreur_classique;

  /// No description provided for @aboutSacn_3_multicast_unicast_igmp.
  ///
  /// In fr, this message translates to:
  /// **'3) Multicast / Unicast + IGMP'**
  String get aboutSacn_3_multicast_unicast_igmp;

  /// No description provided for @aboutSacn_igmp_snooping_pourquoi_c_est_important.
  ///
  /// In fr, this message translates to:
  /// **'IGMP snooping (pourquoi c’est important)'**
  String get aboutSacn_igmp_snooping_pourquoi_c_est_important;

  /// No description provided for @aboutSacn_4_priorites_multi_sources.
  ///
  /// In fr, this message translates to:
  /// **'4) Priorités (multi-sources)'**
  String get aboutSacn_4_priorites_multi_sources;

  /// No description provided for @aboutSacn_pieges.
  ///
  /// In fr, this message translates to:
  /// **'Pièges'**
  String get aboutSacn_pieges;

  /// No description provided for @aboutSacn_5_limites_perfs.
  ///
  /// In fr, this message translates to:
  /// **'5) Limites / perfs'**
  String get aboutSacn_5_limites_perfs;

  /// No description provided for @aboutSacn_ce_qui_casse_en_premier.
  ///
  /// In fr, this message translates to:
  /// **'Ce qui casse en premier'**
  String get aboutSacn_ce_qui_casse_en_premier;

  /// No description provided for @aboutSacn_6_rdm_sacn_proxy_selon_materiel.
  ///
  /// In fr, this message translates to:
  /// **'6) RDM & sACN (proxy / selon matériel)'**
  String get aboutSacn_6_rdm_sacn_proxy_selon_materiel;

  /// No description provided for @aboutSacn_a_verifier_dans_la_doc_du_node.
  ///
  /// In fr, this message translates to:
  /// **'À vérifier dans la doc du node'**
  String get aboutSacn_a_verifier_dans_la_doc_du_node;

  /// No description provided for @aboutSacn_7_schemas.
  ///
  /// In fr, this message translates to:
  /// **'7) Schémas'**
  String get aboutSacn_7_schemas;

  /// No description provided for @aboutSacn_7bis_images_assets.
  ///
  /// In fr, this message translates to:
  /// **'7bis) Images (assets)'**
  String get aboutSacn_7bis_images_assets;

  /// No description provided for @aboutSacn_8_checklist.
  ///
  /// In fr, this message translates to:
  /// **'8) Checklist'**
  String get aboutSacn_8_checklist;

  /// No description provided for @aboutSacn_avant_d_accuser_le_protocole.
  ///
  /// In fr, this message translates to:
  /// **'Avant d’accuser “le protocole”'**
  String get aboutSacn_avant_d_accuser_le_protocole;

  /// No description provided for @aboutSacn_sommaire.
  ///
  /// In fr, this message translates to:
  /// **'Sommaire'**
  String get aboutSacn_sommaire;

  /// No description provided for @aboutSacn_copier_liste_assets.
  ///
  /// In fr, this message translates to:
  /// **'Copier liste assets'**
  String get aboutSacn_copier_liste_assets;

  /// No description provided for @aboutSacn_copier.
  ///
  /// In fr, this message translates to:
  /// **'Copier'**
  String get aboutSacn_copier;

  /// No description provided for @aboutSacn_copier_reperes.
  ///
  /// In fr, this message translates to:
  /// **'Copier repères'**
  String get aboutSacn_copier_reperes;

  /// No description provided for @aboutDmx_dmx_fonctionnement_simple_complet.
  ///
  /// In fr, this message translates to:
  /// **'DMX — fonctionnement (simple & complet)'**
  String get aboutDmx_dmx_fonctionnement_simple_complet;

  /// No description provided for @aboutDmx_garde_ton_contenu_existant.
  ///
  /// In fr, this message translates to:
  /// **'... (garde ton contenu existant)'**
  String get aboutDmx_garde_ton_contenu_existant;

  /// No description provided for @aboutDmx_garde_ton_contenu_existant_2.
  ///
  /// In fr, this message translates to:
  /// **'... (garde ton contenu existant)'**
  String get aboutDmx_garde_ton_contenu_existant_2;

  /// No description provided for @aboutDmx_garde_ton_contenu_existant_3.
  ///
  /// In fr, this message translates to:
  /// **'... (garde ton contenu existant)'**
  String get aboutDmx_garde_ton_contenu_existant_3;

  /// No description provided for @aboutDmx_garde_ton_contenu_existant_4.
  ///
  /// In fr, this message translates to:
  /// **'... (garde ton contenu existant)'**
  String get aboutDmx_garde_ton_contenu_existant_4;

  /// No description provided for @aboutDmx_garde_ton_contenu_existant_5.
  ///
  /// In fr, this message translates to:
  /// **'... (garde ton contenu existant)'**
  String get aboutDmx_garde_ton_contenu_existant_5;

  /// No description provided for @aboutDmx_garde_ton_contenu_existant_6.
  ///
  /// In fr, this message translates to:
  /// **'... (garde ton contenu existant)'**
  String get aboutDmx_garde_ton_contenu_existant_6;

  /// No description provided for @aboutDmx_garde_ton_contenu_existant_7.
  ///
  /// In fr, this message translates to:
  /// **'... (garde ton contenu existant)'**
  String get aboutDmx_garde_ton_contenu_existant_7;

  /// No description provided for @aboutDmx_garde_ton_contenu_existant_8.
  ///
  /// In fr, this message translates to:
  /// **'... (garde ton contenu existant)'**
  String get aboutDmx_garde_ton_contenu_existant_8;

  /// No description provided for @aboutDmx_sommaire.
  ///
  /// In fr, this message translates to:
  /// **'Sommaire'**
  String get aboutDmx_sommaire;

  /// No description provided for @aboutDmx_1_dmx_univers_adresses_la_base.
  ///
  /// In fr, this message translates to:
  /// **'1) DMX, univers, adresses — la base'**
  String get aboutDmx_1_dmx_univers_adresses_la_base;

  /// No description provided for @aboutDmx_a_retenir.
  ///
  /// In fr, this message translates to:
  /// **'À retenir'**
  String get aboutDmx_a_retenir;

  /// No description provided for @aboutDmx_2_trame_dmx_break_start_code_canaux.
  ///
  /// In fr, this message translates to:
  /// **'2) Trame DMX — break, start code, canaux'**
  String get aboutDmx_2_trame_dmx_break_start_code_canaux;

  /// No description provided for @aboutDmx_3_cablage_rs_485_topologie_cable.
  ///
  /// In fr, this message translates to:
  /// **'3) Câblage RS-485 — topologie & câble'**
  String get aboutDmx_3_cablage_rs_485_topologie_cable;

  /// No description provided for @aboutDmx_4_terminaison_splitters_eviter_les_refle.
  ///
  /// In fr, this message translates to:
  /// **'4) Terminaison & splitters — éviter les réflexions'**
  String get aboutDmx_4_terminaison_splitters_eviter_les_refle;

  /// No description provided for @aboutDmx_4bis_rdm_limites_compatibilites.
  ///
  /// In fr, this message translates to:
  /// **'4bis) RDM — limites & compatibilités'**
  String get aboutDmx_4bis_rdm_limites_compatibilites;

  /// No description provided for @aboutDmx_5_depannage_terrain_symptomes_causes.
  ///
  /// In fr, this message translates to:
  /// **'5) Dépannage terrain — symptômes → causes'**
  String get aboutDmx_5_depannage_terrain_symptomes_causes;

  /// No description provided for @aboutDmx_6_art_net_reperes_terrain.
  ///
  /// In fr, this message translates to:
  /// **'6) Art-Net — repères terrain'**
  String get aboutDmx_6_art_net_reperes_terrain;

  /// No description provided for @aboutDmx_7_sacn_e1_31_multicast_igmp_priorites.
  ///
  /// In fr, this message translates to:
  /// **'7) sACN / E1.31 — multicast, IGMP, priorités'**
  String get aboutDmx_7_sacn_e1_31_multicast_igmp_priorites;

  /// No description provided for @aboutDmx_8_dmx_vs_art_net_vs_sacn_choisir.
  ///
  /// In fr, this message translates to:
  /// **'8) DMX vs Art-Net vs sACN — choisir'**
  String get aboutDmx_8_dmx_vs_art_net_vs_sacn_choisir;

  /// No description provided for @aboutDmx_9_schemas_terrain_dmx_ip_pinout.
  ///
  /// In fr, this message translates to:
  /// **'9) Schémas terrain (DMX / IP / pinout)'**
  String get aboutDmx_9_schemas_terrain_dmx_ip_pinout;

  /// No description provided for @aboutDmx_10_checklist_rapide.
  ///
  /// In fr, this message translates to:
  /// **'10) Checklist rapide'**
  String get aboutDmx_10_checklist_rapide;

  /// No description provided for @aboutDmx_avant_de_paniquer.
  ///
  /// In fr, this message translates to:
  /// **'Avant de paniquer'**
  String get aboutDmx_avant_de_paniquer;

  /// No description provided for @aboutDmx_copier_resume.
  ///
  /// In fr, this message translates to:
  /// **'Copier résumé'**
  String get aboutDmx_copier_resume;

  /// No description provided for @aboutDmx_copier_la_checklist.
  ///
  /// In fr, this message translates to:
  /// **'Copier la checklist'**
  String get aboutDmx_copier_la_checklist;

  /// No description provided for @aboutIpBasics_reseau_bases_ip_masque_dhcp_essentiel.
  ///
  /// In fr, this message translates to:
  /// **'Réseau — bases IP / masque / DHCP (essentiel)'**
  String get aboutIpBasics_reseau_bases_ip_masque_dhcp_essentiel;

  /// No description provided for @aboutIpBasics_sommaire.
  ///
  /// In fr, this message translates to:
  /// **'Sommaire'**
  String get aboutIpBasics_sommaire;

  /// No description provided for @aboutIpBasics_1_c_est_quoi_une_ip_et_a_quoi_ca_sert.
  ///
  /// In fr, this message translates to:
  /// **'1) C’est quoi une IP et à quoi ça sert ?'**
  String get aboutIpBasics_1_c_est_quoi_une_ip_et_a_quoi_ca_sert;

  /// No description provided for @aboutIpBasics_image_mentale.
  ///
  /// In fr, this message translates to:
  /// **'Image mentale'**
  String get aboutIpBasics_image_mentale;

  /// No description provided for @aboutIpBasics_2_pourquoi_192_x_10_x_172_x_adresses_pri.
  ///
  /// In fr, this message translates to:
  /// **'2) Pourquoi 192.x / 10.x / 172.x ? (adresses privées)'**
  String get aboutIpBasics_2_pourquoi_192_x_10_x_172_x_adresses_pri;

  /// No description provided for @aboutIpBasics_les_3_grandes_plages_privees_lan.
  ///
  /// In fr, this message translates to:
  /// **'Les 3 grandes plages privées (LAN)'**
  String get aboutIpBasics_les_3_grandes_plages_privees_lan;

  /// No description provided for @aboutIpBasics_3_masque_sous_reseaux_comprendre_pour_de.
  ///
  /// In fr, this message translates to:
  /// **'3) Masque & sous-réseaux : comprendre pour de vrai'**
  String get aboutIpBasics_3_masque_sous_reseaux_comprendre_pour_de;

  /// No description provided for @aboutIpBasics_masques_les_plus_courants.
  ///
  /// In fr, this message translates to:
  /// **'Masques les plus courants'**
  String get aboutIpBasics_masques_les_plus_courants;

  /// No description provided for @aboutIpBasics_masque_adresse_de_broadcast_tres_utile_a.
  ///
  /// In fr, this message translates to:
  /// **'Masque → adresse de broadcast (très utile à comprendre)'**
  String get aboutIpBasics_masque_adresse_de_broadcast_tres_utile_a;

  /// No description provided for @aboutIpBasics_piege_classique.
  ///
  /// In fr, this message translates to:
  /// **'Piège classique'**
  String get aboutIpBasics_piege_classique;

  /// No description provided for @aboutIpBasics_4_dhcp_passerelle_dns_qui_fait_quoi.
  ///
  /// In fr, this message translates to:
  /// **'4) DHCP, passerelle, DNS : qui fait quoi ?'**
  String get aboutIpBasics_4_dhcp_passerelle_dns_qui_fait_quoi;

  /// No description provided for @aboutIpBasics_passerelle_gateway.
  ///
  /// In fr, this message translates to:
  /// **'Passerelle (gateway)'**
  String get aboutIpBasics_passerelle_gateway;

  /// No description provided for @aboutIpBasics_dns.
  ///
  /// In fr, this message translates to:
  /// **'DNS'**
  String get aboutIpBasics_dns;

  /// No description provided for @aboutIpBasics_5_comment_deux_appareils_se_parlent_lan_.
  ///
  /// In fr, this message translates to:
  /// **'5) Comment deux appareils se parlent (LAN vs hors LAN)'**
  String get aboutIpBasics_5_comment_deux_appareils_se_parlent_lan_;

  /// No description provided for @aboutIpBasics_exemple_facile.
  ///
  /// In fr, this message translates to:
  /// **'Exemple (facile)'**
  String get aboutIpBasics_exemple_facile;

  /// No description provided for @aboutIpBasics_broadcast_vs_unicast_bonus_utile.
  ///
  /// In fr, this message translates to:
  /// **'Broadcast vs unicast (bonus utile)'**
  String get aboutIpBasics_broadcast_vs_unicast_bonus_utile;

  /// No description provided for @aboutIpBasics_6_plans_ip_show_simples_exemples_prets_a.
  ///
  /// In fr, this message translates to:
  /// **'6) Plans IP “show” simples (exemples prêts à copier)'**
  String get aboutIpBasics_6_plans_ip_show_simples_exemples_prets_a;

  /// No description provided for @aboutIpBasics_pourquoi_ca_marche_bien.
  ///
  /// In fr, this message translates to:
  /// **'Pourquoi ça marche bien'**
  String get aboutIpBasics_pourquoi_ca_marche_bien;

  /// No description provided for @aboutIpBasics_quand_l_utiliser.
  ///
  /// In fr, this message translates to:
  /// **'Quand l’utiliser'**
  String get aboutIpBasics_quand_l_utiliser;

  /// No description provided for @aboutIpBasics_attention.
  ///
  /// In fr, this message translates to:
  /// **'Attention'**
  String get aboutIpBasics_attention;

  /// No description provided for @aboutIpBasics_7_depannage_symptomes_causes_methode_ter.
  ///
  /// In fr, this message translates to:
  /// **'7) Dépannage : symptômes → causes (méthode terrain)'**
  String get aboutIpBasics_7_depannage_symptomes_causes_methode_ter;

  /// No description provided for @aboutIpBasics_symptomes_causes_probables.
  ///
  /// In fr, this message translates to:
  /// **'Symptômes → causes probables'**
  String get aboutIpBasics_symptomes_causes_probables;

  /// No description provided for @aboutIpBasics_piege_tres_frequent.
  ///
  /// In fr, this message translates to:
  /// **'Piège très fréquent'**
  String get aboutIpBasics_piege_tres_frequent;

  /// No description provided for @aboutIpBasics_8_mini_exercices_verifier_vite_un_masque.
  ///
  /// In fr, this message translates to:
  /// **'8) Mini-exercices (vérifier vite un masque / un réseau)'**
  String get aboutIpBasics_8_mini_exercices_verifier_vite_un_masque;

  /// No description provided for @aboutIpBasics_astuce_visuelle.
  ///
  /// In fr, this message translates to:
  /// **'Astuce visuelle'**
  String get aboutIpBasics_astuce_visuelle;

  /// No description provided for @aboutIpBasics_9_checklist_rapide.
  ///
  /// In fr, this message translates to:
  /// **'9) Checklist rapide'**
  String get aboutIpBasics_9_checklist_rapide;

  /// No description provided for @aboutIpBasics_avant_de_chercher_midi_a_14h.
  ///
  /// In fr, this message translates to:
  /// **'Avant de chercher midi à 14h'**
  String get aboutIpBasics_avant_de_chercher_midi_a_14h;

  /// No description provided for @aboutIpBasics_copier_memo.
  ///
  /// In fr, this message translates to:
  /// **'Copier mémo'**
  String get aboutIpBasics_copier_memo;

  /// No description provided for @aboutIpBasics_copier_la_checklist.
  ///
  /// In fr, this message translates to:
  /// **'Copier la checklist'**
  String get aboutIpBasics_copier_la_checklist;

  /// No description provided for @common_non_renseigne.
  ///
  /// In fr, this message translates to:
  /// **'Non renseigné'**
  String get common_non_renseigne;

  /// No description provided for @common_label_value.
  ///
  /// In fr, this message translates to:
  /// **'Common label value : {p0} · {p1}'**
  String common_label_value(Object p0, Object p1);

  /// No description provided for @fixtureCatalog_mode_label.
  ///
  /// In fr, this message translates to:
  /// **'FixtureCatalog mode label : {p0} · {p1}'**
  String fixtureCatalog_mode_label(Object p0, Object p1);

  /// No description provided for @fixtureCatalog_canaux_dmx.
  ///
  /// In fr, this message translates to:
  /// **'Canaux DMX'**
  String get fixtureCatalog_canaux_dmx;

  /// No description provided for @fixtureCatalog_poids.
  ///
  /// In fr, this message translates to:
  /// **'Poids'**
  String get fixtureCatalog_poids;

  /// No description provided for @fixtureCatalog_puissance.
  ///
  /// In fr, this message translates to:
  /// **'Puissance'**
  String get fixtureCatalog_puissance;

  /// No description provided for @fixtureCatalog_flux_lumineux.
  ///
  /// In fr, this message translates to:
  /// **'Flux lumineux'**
  String get fixtureCatalog_flux_lumineux;

  /// No description provided for @bpmTitle.
  ///
  /// In fr, this message translates to:
  /// **'BPM'**
  String get bpmTitle;

  /// No description provided for @bpmTapTitle.
  ///
  /// In fr, this message translates to:
  /// **'Tap tempo'**
  String get bpmTapTitle;

  /// No description provided for @bpmTapButton.
  ///
  /// In fr, this message translates to:
  /// **'Taper'**
  String get bpmTapButton;

  /// No description provided for @bpmResetTap.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser'**
  String get bpmResetTap;

  /// No description provided for @bpmDetectedLabel.
  ///
  /// In fr, this message translates to:
  /// **'BPM détecté'**
  String get bpmDetectedLabel;

  /// No description provided for @bpmTapHint.
  ///
  /// In fr, this message translates to:
  /// **'Tape au moins 4 fois pour stabiliser.'**
  String get bpmTapHint;

  /// No description provided for @bpmManualTitle.
  ///
  /// In fr, this message translates to:
  /// **'Saisie manuelle'**
  String get bpmManualTitle;

  /// No description provided for @bpmManualLabel.
  ///
  /// In fr, this message translates to:
  /// **'BPM'**
  String get bpmManualLabel;

  /// No description provided for @bpmManualHint.
  ///
  /// In fr, this message translates to:
  /// **'ex : 128'**
  String get bpmManualHint;

  /// No description provided for @bpmManualHelp.
  ///
  /// In fr, this message translates to:
  /// **'Entre une valeur, puis l’app calcule les conversions.'**
  String get bpmManualHelp;

  /// No description provided for @bpmConversionsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Conversions'**
  String get bpmConversionsTitle;

  /// No description provided for @bpmActiveLabel.
  ///
  /// In fr, this message translates to:
  /// **'Actif'**
  String get bpmActiveLabel;

  /// No description provided for @bpmMsPerBeat.
  ///
  /// In fr, this message translates to:
  /// **'ms / beat'**
  String get bpmMsPerBeat;

  /// No description provided for @bpmHz.
  ///
  /// In fr, this message translates to:
  /// **'Hz'**
  String get bpmHz;

  /// No description provided for @bpmSecPerBar44.
  ///
  /// In fr, this message translates to:
  /// **'s / mesure (4/4)'**
  String get bpmSecPerBar44;

  /// No description provided for @bpmDisclaimer.
  ///
  /// In fr, this message translates to:
  /// **'Indicatif — dépend du swing, des subdivisions et du timecode.'**
  String get bpmDisclaimer;

  /// No description provided for @fixtureCatalog_dmx_section.
  ///
  /// In fr, this message translates to:
  /// **'DMX'**
  String get fixtureCatalog_dmx_section;

  /// No description provided for @aboutLightReferenceTitle.
  ///
  /// In fr, this message translates to:
  /// **'About Light Reference Title'**
  String get aboutLightReferenceTitle;

  /// No description provided for @aboutSunTimesSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'About Sun Times Subtitle'**
  String get aboutSunTimesSubtitle;

  /// No description provided for @aboutSunTimesTitle.
  ///
  /// In fr, this message translates to:
  /// **'About Sun Times Title'**
  String get aboutSunTimesTitle;

  /// No description provided for @commonAdd.
  ///
  /// In fr, this message translates to:
  /// **'Common Add'**
  String get commonAdd;

  /// No description provided for @commonApply.
  ///
  /// In fr, this message translates to:
  /// **'Common Apply'**
  String get commonApply;

  /// No description provided for @commonCopySummaryTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Common Copy Summary Tooltip'**
  String get commonCopySummaryTooltip;

  /// No description provided for @commonDash.
  ///
  /// In fr, this message translates to:
  /// **'Common Dash'**
  String get commonDash;

  /// No description provided for @commonDelete.
  ///
  /// In fr, this message translates to:
  /// **'Common Delete'**
  String get commonDelete;

  /// No description provided for @commonOk.
  ///
  /// In fr, this message translates to:
  /// **'Common Ok'**
  String get commonOk;

  /// No description provided for @commonTocTitle.
  ///
  /// In fr, this message translates to:
  /// **'Common Toc Title'**
  String get commonTocTitle;

  /// No description provided for @dipSwitchAddressHint.
  ///
  /// In fr, this message translates to:
  /// **'Dip Switch Address Hint'**
  String get dipSwitchAddressHint;

  /// No description provided for @dipSwitchAddressLabel.
  ///
  /// In fr, this message translates to:
  /// **'Dip Switch Address Label'**
  String get dipSwitchAddressLabel;

  /// No description provided for @dipSwitchChannelUnit.
  ///
  /// In fr, this message translates to:
  /// **'Dip Switch Channel Unit'**
  String get dipSwitchChannelUnit;

  /// No description provided for @dipSwitchInputsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Dip Switch Inputs Title'**
  String get dipSwitchInputsTitle;

  /// No description provided for @dipSwitchIntervalHint.
  ///
  /// In fr, this message translates to:
  /// **'Dip Switch Interval Hint'**
  String get dipSwitchIntervalHint;

  /// No description provided for @dipSwitchIntervalLabel.
  ///
  /// In fr, this message translates to:
  /// **'Dip Switch Interval Label'**
  String get dipSwitchIntervalLabel;

  /// No description provided for @dipSwitchModeAddressDirect.
  ///
  /// In fr, this message translates to:
  /// **'Dip Switch Mode Address Direct'**
  String get dipSwitchModeAddressDirect;

  /// No description provided for @dipSwitchModeAddressMinusOne.
  ///
  /// In fr, this message translates to:
  /// **'Dip Switch Mode Address Minus One'**
  String get dipSwitchModeAddressMinusOne;

  /// No description provided for @dipSwitchNextAddressButton.
  ///
  /// In fr, this message translates to:
  /// **'Dip Switch Next Address Button'**
  String get dipSwitchNextAddressButton;

  /// No description provided for @dipSwitchOffLabel.
  ///
  /// In fr, this message translates to:
  /// **'Dip Switch Off Label'**
  String get dipSwitchOffLabel;

  /// No description provided for @dipSwitchOnLabel.
  ///
  /// In fr, this message translates to:
  /// **'Dip Switch On Label'**
  String get dipSwitchOnLabel;

  /// No description provided for @dipSwitchResetTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Dip Switch Reset Tooltip'**
  String get dipSwitchResetTooltip;

  /// No description provided for @dipSwitchResultAddressLine.
  ///
  /// In fr, this message translates to:
  /// **'Dip Switch Result Address Line : {p0}'**
  String dipSwitchResultAddressLine(Object p0);

  /// No description provided for @dipSwitchResultAddressNotProvided.
  ///
  /// In fr, this message translates to:
  /// **'Dip Switch Result Address Not Provided'**
  String get dipSwitchResultAddressNotProvided;

  /// No description provided for @dipSwitchResultBinaryValueLine.
  ///
  /// In fr, this message translates to:
  /// **'Dip Switch Result Binary Value Line : {p0}'**
  String dipSwitchResultBinaryValueLine(Object p0);

  /// No description provided for @dipSwitchResultHeader.
  ///
  /// In fr, this message translates to:
  /// **'Dip Switch Result Header'**
  String get dipSwitchResultHeader;

  /// No description provided for @dipSwitchResultIntervalLine.
  ///
  /// In fr, this message translates to:
  /// **'Dip Switch Result Interval Line : {p0} · {p1}'**
  String dipSwitchResultIntervalLine(Object p0, Object p1);

  /// No description provided for @dipSwitchResultModeLine.
  ///
  /// In fr, this message translates to:
  /// **'Dip Switch Result Mode Line : {p0}'**
  String dipSwitchResultModeLine(Object p0);

  /// No description provided for @dipSwitchScrollHint.
  ///
  /// In fr, this message translates to:
  /// **'Dip Switch Scroll Hint'**
  String get dipSwitchScrollHint;

  /// No description provided for @dipSwitchSectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Dip Switch Section Title'**
  String get dipSwitchSectionTitle;

  /// No description provided for @dipSwitchSwitchLabel.
  ///
  /// In fr, this message translates to:
  /// **'Dip Switch Switch Label : {p0}'**
  String dipSwitchSwitchLabel(Object p0);

  /// No description provided for @dipSwitchUseAddressMinusOneLabel.
  ///
  /// In fr, this message translates to:
  /// **'Dip Switch Use Address Minus One Label'**
  String get dipSwitchUseAddressMinusOneLabel;

  /// No description provided for @gdtfChannelDefaultName.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Channel Default Name'**
  String get gdtfChannelDefaultName;

  /// No description provided for @gdtfChannelsCountLabel.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Channels Count Label'**
  String get gdtfChannelsCountLabel;

  /// No description provided for @gdtfChannelsSectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Channels Section Title'**
  String get gdtfChannelsSectionTitle;

  /// No description provided for @gdtfDeviceSectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Device Section Title'**
  String get gdtfDeviceSectionTitle;

  /// No description provided for @gdtfEasyTitle.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Easy Title'**
  String get gdtfEasyTitle;

  /// No description provided for @gdtfExportButton.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Export Button'**
  String get gdtfExportButton;

  /// No description provided for @gdtfExportDone.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Export Done'**
  String get gdtfExportDone;

  /// No description provided for @gdtfExportError.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Export Error'**
  String get gdtfExportError;

  /// No description provided for @gdtfExportHint.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Export Hint'**
  String get gdtfExportHint;

  /// No description provided for @gdtfExportNeedChannels.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Export Need Channels'**
  String get gdtfExportNeedChannels;

  /// No description provided for @gdtfFieldDefault.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Field Default'**
  String get gdtfFieldDefault;

  /// No description provided for @gdtfFieldName.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Field Name'**
  String get gdtfFieldName;

  /// No description provided for @gdtfFieldResolution.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Field Resolution'**
  String get gdtfFieldResolution;

  /// No description provided for @gdtfFieldRole.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Field Role'**
  String get gdtfFieldRole;

  /// No description provided for @gdtfFootprintLabel.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Footprint Label'**
  String get gdtfFootprintLabel;

  /// No description provided for @gdtfManufacturerLabel.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Manufacturer Label'**
  String get gdtfManufacturerLabel;

  /// No description provided for @gdtfModeNameLabel.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Mode Name Label'**
  String get gdtfModeNameLabel;

  /// No description provided for @gdtfModelLabel.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Model Label'**
  String get gdtfModelLabel;

  /// No description provided for @gdtfPresetBarreLed.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Preset Barre LED'**
  String get gdtfPresetBarreLed;

  /// No description provided for @gdtfPresetBlue.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Preset Blue'**
  String get gdtfPresetBlue;

  /// No description provided for @gdtfPresetColor1.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Preset Color1'**
  String get gdtfPresetColor1;

  /// No description provided for @gdtfPresetControl.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Preset Control'**
  String get gdtfPresetControl;

  /// No description provided for @gdtfPresetDimmer.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Preset Dimmer'**
  String get gdtfPresetDimmer;

  /// No description provided for @gdtfPresetEffect.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Preset Effect'**
  String get gdtfPresetEffect;

  /// No description provided for @gdtfPresetFixtureSimple.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Preset Fixture Simple'**
  String get gdtfPresetFixtureSimple;

  /// No description provided for @gdtfPresetFocus.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Preset Focus'**
  String get gdtfPresetFocus;

  /// No description provided for @gdtfPresetGobo1.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Preset Gobo1'**
  String get gdtfPresetGobo1;

  /// No description provided for @gdtfPresetGreen.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Preset Green'**
  String get gdtfPresetGreen;

  /// No description provided for @gdtfPresetLabel.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Preset Label'**
  String get gdtfPresetLabel;

  /// No description provided for @gdtfPresetPan.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Preset Pan'**
  String get gdtfPresetPan;

  /// No description provided for @gdtfPresetPrism.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Preset Prism'**
  String get gdtfPresetPrism;

  /// No description provided for @gdtfPresetRed.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Preset Red'**
  String get gdtfPresetRed;

  /// No description provided for @gdtfPresetShutter.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Preset Shutter'**
  String get gdtfPresetShutter;

  /// No description provided for @gdtfPresetTilt.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Preset Tilt'**
  String get gdtfPresetTilt;

  /// No description provided for @gdtfPresetZoom.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Preset Zoom'**
  String get gdtfPresetZoom;

  /// No description provided for @gdtfRes16.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Res16'**
  String get gdtfRes16;

  /// No description provided for @gdtfRes8.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Res8'**
  String get gdtfRes8;

  /// No description provided for @gdtfRoleBlue.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Role Blue'**
  String get gdtfRoleBlue;

  /// No description provided for @gdtfRoleColor.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Role Color'**
  String get gdtfRoleColor;

  /// No description provided for @gdtfRoleControl.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Role Control'**
  String get gdtfRoleControl;

  /// No description provided for @gdtfRoleCustom.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Role Custom'**
  String get gdtfRoleCustom;

  /// No description provided for @gdtfRoleDimmer.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Role Dimmer'**
  String get gdtfRoleDimmer;

  /// No description provided for @gdtfRoleEffect.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Role Effect'**
  String get gdtfRoleEffect;

  /// No description provided for @gdtfRoleEmpty.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Role Empty'**
  String get gdtfRoleEmpty;

  /// No description provided for @gdtfRoleFocus.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Role Focus'**
  String get gdtfRoleFocus;

  /// No description provided for @gdtfRoleGobo.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Role Gobo'**
  String get gdtfRoleGobo;

  /// No description provided for @gdtfRoleGreen.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Role Green'**
  String get gdtfRoleGreen;

  /// No description provided for @gdtfRolePan.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Role Pan'**
  String get gdtfRolePan;

  /// No description provided for @gdtfRolePrism.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Role Prism'**
  String get gdtfRolePrism;

  /// No description provided for @gdtfRoleRed.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Role Red'**
  String get gdtfRoleRed;

  /// No description provided for @gdtfRoleShutter.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Role Shutter'**
  String get gdtfRoleShutter;

  /// No description provided for @gdtfRoleTilt.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Role Tilt'**
  String get gdtfRoleTilt;

  /// No description provided for @gdtfRoleZoom.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Role Zoom'**
  String get gdtfRoleZoom;

  /// No description provided for @gdtfShareSubject.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Share Subject'**
  String get gdtfShareSubject;

  /// No description provided for @gdtfShareText.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Share Text'**
  String get gdtfShareText;

  /// No description provided for @gdtfTemplatesHintShort.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Templates Hint Short'**
  String get gdtfTemplatesHintShort;

  /// No description provided for @gdtfTemplatesTitle.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Templates Title'**
  String get gdtfTemplatesTitle;

  /// No description provided for @homeBpmSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Home Bpm Subtitle'**
  String get homeBpmSubtitle;

  /// No description provided for @homeBpmTitle.
  ///
  /// In fr, this message translates to:
  /// **'Home Bpm Title'**
  String get homeBpmTitle;

  /// No description provided for @homeDrawerContact.
  ///
  /// In fr, this message translates to:
  /// **'Home Drawer Contact'**
  String get homeDrawerContact;

  /// No description provided for @homeDrawerSuggestItem.
  ///
  /// In fr, this message translates to:
  /// **'Home Drawer Suggest Item'**
  String get homeDrawerSuggestItem;

  /// No description provided for @laserBeamAreaAtDistance.
  ///
  /// In fr, this message translates to:
  /// **'Laser Beam Area At Distance'**
  String get laserBeamAreaAtDistance;

  /// No description provided for @laserBeamDiameterAtDistance.
  ///
  /// In fr, this message translates to:
  /// **'Laser Beam Diameter At Distance'**
  String get laserBeamDiameterAtDistance;

  /// No description provided for @laserBeamDistanceHint.
  ///
  /// In fr, this message translates to:
  /// **'Laser Beam Distance Hint'**
  String get laserBeamDistanceHint;

  /// No description provided for @laserBeamDistanceLabel.
  ///
  /// In fr, this message translates to:
  /// **'Laser Beam Distance Label'**
  String get laserBeamDistanceLabel;

  /// No description provided for @laserBeamFormulaHint.
  ///
  /// In fr, this message translates to:
  /// **'Laser Beam Formula Hint'**
  String get laserBeamFormulaHint;

  /// No description provided for @laserBeamInputsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Laser Beam Inputs Title'**
  String get laserBeamInputsTitle;

  /// No description provided for @laserBeamRadiusAtDistance.
  ///
  /// In fr, this message translates to:
  /// **'Laser Beam Radius At Distance'**
  String get laserBeamRadiusAtDistance;

  /// No description provided for @laserBeamResultsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Laser Beam Results Title'**
  String get laserBeamResultsTitle;

  /// No description provided for @laserBeamSizeSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Laser Beam Size Subtitle'**
  String get laserBeamSizeSubtitle;

  /// No description provided for @laserBeamSizeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Laser Beam Size Title'**
  String get laserBeamSizeTitle;

  /// No description provided for @laserToolsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Laser Tools Title'**
  String get laserToolsTitle;

  /// No description provided for @patchAddressLabel.
  ///
  /// In fr, this message translates to:
  /// **'Patch Address Label : {p0}'**
  String patchAddressLabel(Object p0);

  /// No description provided for @patchChannelsUsed.
  ///
  /// In fr, this message translates to:
  /// **'Patch Channels Used : {p0}'**
  String patchChannelsUsed(Object p0);

  /// No description provided for @patchConflictError.
  ///
  /// In fr, this message translates to:
  /// **'Patch Conflict Error'**
  String get patchConflictError;

  /// No description provided for @patchConflictShort.
  ///
  /// In fr, this message translates to:
  /// **'Patch Conflict Short'**
  String get patchConflictShort;

  /// No description provided for @patchConflicts.
  ///
  /// In fr, this message translates to:
  /// **'Patch Conflicts : {p0}'**
  String patchConflicts(Object p0);

  /// No description provided for @patchCreateGdtfSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch Create GDTF Subtitle'**
  String get patchCreateGdtfSubtitle;

  /// No description provided for @patchCreateGdtfTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch Create GDTF Title'**
  String get patchCreateGdtfTitle;

  /// No description provided for @patchEditChannelsLabel.
  ///
  /// In fr, this message translates to:
  /// **'Patch Edit Channels Label'**
  String get patchEditChannelsLabel;

  /// No description provided for @patchEditHint.
  ///
  /// In fr, this message translates to:
  /// **'Patch Edit Hint'**
  String get patchEditHint;

  /// No description provided for @patchEditModeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Patch Edit Mode Label'**
  String get patchEditModeLabel;

  /// No description provided for @patchEditTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch Edit Title'**
  String get patchEditTitle;

  /// No description provided for @patchEmptyUniverse.
  ///
  /// In fr, this message translates to:
  /// **'Patch Empty Universe'**
  String get patchEmptyUniverse;

  /// No description provided for @patchFixturesCount.
  ///
  /// In fr, this message translates to:
  /// **'Patch Fixtures Count : {p0}'**
  String patchFixturesCount(Object p0);

  /// No description provided for @patchHomeDisclaimer.
  ///
  /// In fr, this message translates to:
  /// **'Patch Home Disclaimer'**
  String get patchHomeDisclaimer;

  /// No description provided for @patchHomeImportMvrDescription.
  ///
  /// In fr, this message translates to:
  /// **'Patch Home Import MVR Description'**
  String get patchHomeImportMvrDescription;

  /// No description provided for @patchHomeImportMvrTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch Home Import MVR Title'**
  String get patchHomeImportMvrTitle;

  /// No description provided for @patchHomeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch Home Title'**
  String get patchHomeTitle;

  /// No description provided for @patchHomeViewPatchDescription.
  ///
  /// In fr, this message translates to:
  /// **'Patch Home View Patch Description'**
  String get patchHomeViewPatchDescription;

  /// No description provided for @patchHomeViewPatchTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch Home View Patch Title'**
  String get patchHomeViewPatchTitle;

  /// No description provided for @patchHubOpenGridButton.
  ///
  /// In fr, this message translates to:
  /// **'Patch Hub Open Grid Button'**
  String get patchHubOpenGridButton;

  /// No description provided for @patchHubOpenMvrButton.
  ///
  /// In fr, this message translates to:
  /// **'Patch Hub Open MVR Button'**
  String get patchHubOpenMvrButton;

  /// No description provided for @patchHubStateEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Patch Hub State Empty'**
  String get patchHubStateEmpty;

  /// No description provided for @patchHubStateLoaded.
  ///
  /// In fr, this message translates to:
  /// **'Patch Hub State Loaded : {p0}'**
  String patchHubStateLoaded(Object p0);

  /// No description provided for @patchHubStateTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch Hub State Title'**
  String get patchHubStateTitle;

  /// No description provided for @patchHubTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch Hub Title'**
  String get patchHubTitle;

  /// No description provided for @patchHubWorksiteBody.
  ///
  /// In fr, this message translates to:
  /// **'Patch Hub Worksite Body'**
  String get patchHubWorksiteBody;

  /// No description provided for @patchHubWorksiteTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch Hub Worksite Title'**
  String get patchHubWorksiteTitle;

  /// No description provided for @patchInvalidChannelCount.
  ///
  /// In fr, this message translates to:
  /// **'Patch Invalid Channel Count'**
  String get patchInvalidChannelCount;

  /// No description provided for @patchIssueInvalidChannelCount.
  ///
  /// In fr, this message translates to:
  /// **'Patch Issue Invalid Channel Count'**
  String get patchIssueInvalidChannelCount;

  /// No description provided for @patchIssueInvalidStartAddress.
  ///
  /// In fr, this message translates to:
  /// **'Patch Issue Invalid Start Address'**
  String get patchIssueInvalidStartAddress;

  /// No description provided for @patchIssueInvalidUniverse.
  ///
  /// In fr, this message translates to:
  /// **'Patch Issue Invalid Universe'**
  String get patchIssueInvalidUniverse;

  /// No description provided for @patchIssueRangeExceedsUniverse.
  ///
  /// In fr, this message translates to:
  /// **'Patch Issue Range Exceeds Universe'**
  String get patchIssueRangeExceedsUniverse;

  /// No description provided for @patchListTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch List Title'**
  String get patchListTitle;

  /// No description provided for @patchManualDisabledBody.
  ///
  /// In fr, this message translates to:
  /// **'Patch Manual Disabled Body'**
  String get patchManualDisabledBody;

  /// No description provided for @patchManualDisabledTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch Manual Disabled Title'**
  String get patchManualDisabledTitle;

  /// No description provided for @patchManualTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch Manual Title'**
  String get patchManualTitle;

  /// No description provided for @patchModeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Patch Mode Label : {p0}'**
  String patchModeLabel(Object p0);

  /// No description provided for @patchMvrButtonAnalyzing.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Button Analyzing'**
  String get patchMvrButtonAnalyzing;

  /// No description provided for @patchMvrButtonLoadAsReference.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Button Load As Reference'**
  String get patchMvrButtonLoadAsReference;

  /// No description provided for @patchMvrButtonPickFile.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Button Pick File'**
  String get patchMvrButtonPickFile;

  /// No description provided for @patchMvrClearTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Clear Tooltip'**
  String get patchMvrClearTooltip;

  /// No description provided for @patchMvrColAddress.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Col Address'**
  String get patchMvrColAddress;

  /// No description provided for @patchMvrColChannels.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Col Channels'**
  String get patchMvrColChannels;

  /// No description provided for @patchMvrColId.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Col Id'**
  String get patchMvrColId;

  /// No description provided for @patchMvrColName.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Col Name'**
  String get patchMvrColName;

  /// No description provided for @patchMvrColUniverse.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Col Universe'**
  String get patchMvrColUniverse;

  /// No description provided for @patchMvrColumnsHint.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Columns Hint'**
  String get patchMvrColumnsHint;

  /// No description provided for @patchMvrFileCardHelp.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR File Card Help'**
  String get patchMvrFileCardHelp;

  /// No description provided for @patchMvrFileCardTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR File Card Title'**
  String get patchMvrFileCardTitle;

  /// No description provided for @patchMvrFilterAllUniverses.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Filter All Universes'**
  String get patchMvrFilterAllUniverses;

  /// No description provided for @patchMvrFilterUniverseLabel.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Filter Universe Label'**
  String get patchMvrFilterUniverseLabel;

  /// No description provided for @patchMvrModeNotProvided.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Mode Not Provided'**
  String get patchMvrModeNotProvided;

  /// No description provided for @patchMvrOrderAsc.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Order Asc'**
  String get patchMvrOrderAsc;

  /// No description provided for @patchMvrOrderDesc.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Order Desc'**
  String get patchMvrOrderDesc;

  /// No description provided for @patchMvrOrderLabel.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Order Label'**
  String get patchMvrOrderLabel;

  /// No description provided for @patchMvrSortAddress.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Sort Address'**
  String get patchMvrSortAddress;

  /// No description provided for @patchMvrSortByLabel.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Sort By Label'**
  String get patchMvrSortByLabel;

  /// No description provided for @patchMvrSortChannels.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Sort Channels'**
  String get patchMvrSortChannels;

  /// No description provided for @patchMvrSortId.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Sort Id'**
  String get patchMvrSortId;

  /// No description provided for @patchMvrSortName.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Sort Name'**
  String get patchMvrSortName;

  /// No description provided for @patchMvrSortUniverse.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Sort Universe'**
  String get patchMvrSortUniverse;

  /// No description provided for @patchMvrSortUniverseThenAddress.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Sort Universe Then Address'**
  String get patchMvrSortUniverseThenAddress;

  /// No description provided for @patchMvrStatusCleared.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Status Cleared'**
  String get patchMvrStatusCleared;

  /// No description provided for @patchMvrStatusEmptyBytes.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Status Empty Bytes'**
  String get patchMvrStatusEmptyBytes;

  /// No description provided for @patchMvrStatusExtractingZip.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Status Extracting Zip'**
  String get patchMvrStatusExtractingZip;

  /// No description provided for @patchMvrStatusFilePickFailed.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Status File Pick Failed : {p0}'**
  String patchMvrStatusFilePickFailed(Object p0);

  /// No description provided for @patchMvrStatusFixturesFound.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Status Fixtures Found : {p0} · {p1}'**
  String patchMvrStatusFixturesFound(Object p0, Object p1);

  /// No description provided for @patchMvrStatusLoadingGdtf.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Status Loading GDTF'**
  String get patchMvrStatusLoadingGdtf;

  /// No description provided for @patchMvrStatusNoContentToLoad.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Status No Content To Load'**
  String get patchMvrStatusNoContentToLoad;

  /// No description provided for @patchMvrStatusNoFileSelected.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Status No File Selected'**
  String get patchMvrStatusNoFileSelected;

  /// No description provided for @patchMvrStatusNoUsableFixtures.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Status No Usable Fixtures'**
  String get patchMvrStatusNoUsableFixtures;

  /// No description provided for @patchMvrStatusParseError.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Status Parse Error : {p0}'**
  String patchMvrStatusParseError(Object p0);

  /// No description provided for @patchMvrStatusParsingContent.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Status Parsing Content'**
  String get patchMvrStatusParsingContent;

  /// No description provided for @patchMvrStatusReferenceLoaded.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Status Reference Loaded : {p0} · {p1} · {p2}'**
  String patchMvrStatusReferenceLoaded(Object p0, Object p1, Object p2);

  /// No description provided for @patchMvrStatusRestored.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Status Restored : {p0}'**
  String patchMvrStatusRestored(Object p0);

  /// No description provided for @patchMvrStatusSceneXmlNotFound.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Status Scene Xml Not Found'**
  String get patchMvrStatusSceneXmlNotFound;

  /// No description provided for @patchMvrStatusSelectingFile.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Status Selecting File'**
  String get patchMvrStatusSelectingFile;

  /// No description provided for @patchMvrStatusUnsupportedFile.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Status Unsupported File : {p0}'**
  String patchMvrStatusUnsupportedFile(Object p0);

  /// No description provided for @patchMvrSummaryTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Summary Title'**
  String get patchMvrSummaryTitle;

  /// No description provided for @patchMvrTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Title'**
  String get patchMvrTitle;

  /// No description provided for @patchMvrUniverseItem.
  ///
  /// In fr, this message translates to:
  /// **'Patch MVR Universe Item : {p0}'**
  String patchMvrUniverseItem(Object p0);

  /// No description provided for @patchPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch Page Title'**
  String get patchPageTitle;

  /// No description provided for @patchSummaryTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch Summary Title'**
  String get patchSummaryTitle;

  /// No description provided for @patchUniverseAppBarTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe App Bar Title'**
  String get patchUniverseAppBarTitle;

  /// No description provided for @patchUniverseConflictCount.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Conflict Count : {p0}'**
  String patchUniverseConflictCount(Object p0);

  /// No description provided for @patchUniverseGridLimitedByWidth.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Grid Limited By Width'**
  String get patchUniverseGridLimitedByWidth;

  /// No description provided for @patchUniverseGridTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Grid Title'**
  String get patchUniverseGridTitle;

  /// No description provided for @patchUniverseItem.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Item : {p0}'**
  String patchUniverseItem(Object p0);

  /// No description provided for @patchUniverseLabel.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Label'**
  String get patchUniverseLabel;

  /// No description provided for @patchUniverseLegendConflict.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Legend Conflict'**
  String get patchUniverseLegendConflict;

  /// No description provided for @patchUniverseLegendFree.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Legend Free'**
  String get patchUniverseLegendFree;

  /// No description provided for @patchUniverseLegendOccupied.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Legend Occupied'**
  String get patchUniverseLegendOccupied;

  /// No description provided for @patchUniverseOccupantLine.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Occupant Line : {p0} · {p1} · {p2} · {p3} · {p4}'**
  String patchUniverseOccupantLine(
      Object p0, Object p1, Object p2, Object p3, Object p4);

  /// No description provided for @patchUniverseOccupiedCount.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Occupied Count : {p0}'**
  String patchUniverseOccupiedCount(Object p0);

  /// No description provided for @patchUniversePopupHeader.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Popup Header : {p0} · {p1} · {p2}'**
  String patchUniversePopupHeader(Object p0, Object p1, Object p2);

  /// No description provided for @patchUniversePopupManyOccupants.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Popup Many Occupants'**
  String get patchUniversePopupManyOccupants;

  /// No description provided for @patchUniversePopupMore.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Popup More : {p0}'**
  String patchUniversePopupMore(Object p0);

  /// No description provided for @patchUniversePopupTitleConflict.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Popup Title Conflict'**
  String get patchUniversePopupTitleConflict;

  /// No description provided for @patchUniversePopupTitleFree.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Popup Title Free'**
  String get patchUniversePopupTitleFree;

  /// No description provided for @patchUniversePopupTitleOccupied.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Popup Title Occupied'**
  String get patchUniversePopupTitleOccupied;

  /// No description provided for @patchUniverseReferenceNone.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Reference None'**
  String get patchUniverseReferenceNone;

  /// No description provided for @patchUniverseReferenceReadOnly.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Reference Read Only'**
  String get patchUniverseReferenceReadOnly;

  /// No description provided for @patchUniverseReferenceTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Reference Title'**
  String get patchUniverseReferenceTitle;

  /// No description provided for @patchUniverseResetConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Reset Confirm'**
  String get patchUniverseResetConfirm;

  /// No description provided for @patchUniverseResetContent.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Reset Content'**
  String get patchUniverseResetContent;

  /// No description provided for @patchUniverseResetTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Reset Title'**
  String get patchUniverseResetTitle;

  /// No description provided for @patchUniverseResetTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Reset Tooltip'**
  String get patchUniverseResetTooltip;

  /// No description provided for @patchUniverseSelected.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Selected'**
  String get patchUniverseSelected;

  /// No description provided for @patchUniverseStateConflict.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe State Conflict'**
  String get patchUniverseStateConflict;

  /// No description provided for @patchUniverseStateFree.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe State Free'**
  String get patchUniverseStateFree;

  /// No description provided for @patchUniverseStateOccupied.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe State Occupied'**
  String get patchUniverseStateOccupied;

  /// No description provided for @patchUniverseTapHint.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Tap Hint'**
  String get patchUniverseTapHint;

  /// No description provided for @patchUniverseUniverseDropdownLabel.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Universe Dropdown Label'**
  String get patchUniverseUniverseDropdownLabel;

  /// No description provided for @patchUniverseUniverseItem.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Universe Item : {p0}'**
  String patchUniverseUniverseItem(Object p0);

  /// No description provided for @patchUniverseUniverseTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Universe Title'**
  String get patchUniverseUniverseTitle;

  /// No description provided for @patchUniverseZoomIn.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Zoom In'**
  String get patchUniverseZoomIn;

  /// No description provided for @patchUniverseZoomOut.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Zoom Out'**
  String get patchUniverseZoomOut;

  /// No description provided for @patchUniverseZoomTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch Universe Zoom Title'**
  String get patchUniverseZoomTitle;

  /// No description provided for @photometryAreaHint4.
  ///
  /// In fr, this message translates to:
  /// **'Photometry Area Hint4'**
  String get photometryAreaHint4;

  /// No description provided for @photometryAreaLabel.
  ///
  /// In fr, this message translates to:
  /// **'Photometry Area Label'**
  String get photometryAreaLabel;

  /// No description provided for @photometryBeamAngleHint2.
  ///
  /// In fr, this message translates to:
  /// **'Photometry Beam Angle Hint2'**
  String get photometryBeamAngleHint2;

  /// No description provided for @photometryBeamAngleHint3.
  ///
  /// In fr, this message translates to:
  /// **'Photometry Beam Angle Hint3'**
  String get photometryBeamAngleHint3;

  /// No description provided for @photometryBeamAngleLabel.
  ///
  /// In fr, this message translates to:
  /// **'Photometry Beam Angle Label'**
  String get photometryBeamAngleLabel;

  /// No description provided for @photometryCandelaHint1.
  ///
  /// In fr, this message translates to:
  /// **'Photometry Candela Hint1'**
  String get photometryCandelaHint1;

  /// No description provided for @photometryCandelaHint2.
  ///
  /// In fr, this message translates to:
  /// **'Photometry Candela Hint2'**
  String get photometryCandelaHint2;

  /// No description provided for @photometryCandelaLabel.
  ///
  /// In fr, this message translates to:
  /// **'Photometry Candela Label'**
  String get photometryCandelaLabel;

  /// No description provided for @photometryDisclaimerShort.
  ///
  /// In fr, this message translates to:
  /// **'Photometry Disclaimer Short'**
  String get photometryDisclaimerShort;

  /// No description provided for @photometryDistanceHint1.
  ///
  /// In fr, this message translates to:
  /// **'Photometry Distance Hint1'**
  String get photometryDistanceHint1;

  /// No description provided for @photometryDistanceHint3.
  ///
  /// In fr, this message translates to:
  /// **'Photometry Distance Hint3'**
  String get photometryDistanceHint3;

  /// No description provided for @photometryDistanceLabel.
  ///
  /// In fr, this message translates to:
  /// **'Photometry Distance Label'**
  String get photometryDistanceLabel;

  /// No description provided for @photometryLumensHint2.
  ///
  /// In fr, this message translates to:
  /// **'Photometry Lumens Hint2'**
  String get photometryLumensHint2;

  /// No description provided for @photometryLumensHint3.
  ///
  /// In fr, this message translates to:
  /// **'Photometry Lumens Hint3'**
  String get photometryLumensHint3;

  /// No description provided for @photometryLumensLabel.
  ///
  /// In fr, this message translates to:
  /// **'Photometry Lumens Label'**
  String get photometryLumensLabel;

  /// No description provided for @photometryLuxHint.
  ///
  /// In fr, this message translates to:
  /// **'Photometry Lux Hint'**
  String get photometryLuxHint;

  /// No description provided for @photometryLuxLabel.
  ///
  /// In fr, this message translates to:
  /// **'Photometry Lux Label'**
  String get photometryLuxLabel;

  /// No description provided for @photometrySection1Title.
  ///
  /// In fr, this message translates to:
  /// **'Photometry Section1 Title'**
  String get photometrySection1Title;

  /// No description provided for @photometrySection2Title.
  ///
  /// In fr, this message translates to:
  /// **'Photometry Section2 Title'**
  String get photometrySection2Title;

  /// No description provided for @photometrySection3Title.
  ///
  /// In fr, this message translates to:
  /// **'Photometry Section3 Title'**
  String get photometrySection3Title;

  /// No description provided for @photometrySection4Title.
  ///
  /// In fr, this message translates to:
  /// **'Photometry Section4 Title'**
  String get photometrySection4Title;

  /// No description provided for @photometrySummary1.
  ///
  /// In fr, this message translates to:
  /// **'Photometry Summary1 : {p0} · {p1} · {p2}'**
  String photometrySummary1(Object p0, Object p1, Object p2);

  /// No description provided for @photometrySummary2.
  ///
  /// In fr, this message translates to:
  /// **'Photometry Summary2 : {p0} · {p1} · {p2}'**
  String photometrySummary2(Object p0, Object p1, Object p2);

  /// No description provided for @photometrySummary3.
  ///
  /// In fr, this message translates to:
  /// **'Photometry Summary3 : {p0} · {p1} · {p2} · {p3}'**
  String photometrySummary3(Object p0, Object p1, Object p2, Object p3);

  /// No description provided for @photometrySummary4.
  ///
  /// In fr, this message translates to:
  /// **'Photometry Summary4 : {p0} · {p1} · {p2}'**
  String photometrySummary4(Object p0, Object p1, Object p2);

  /// No description provided for @projectionAngleHint.
  ///
  /// In fr, this message translates to:
  /// **'Projection Angle Hint'**
  String get projectionAngleHint;

  /// No description provided for @projectionAngleLabel.
  ///
  /// In fr, this message translates to:
  /// **'Projection Angle Label'**
  String get projectionAngleLabel;

  /// No description provided for @projectionAutoHelp.
  ///
  /// In fr, this message translates to:
  /// **'Projection Auto Help'**
  String get projectionAutoHelp;

  /// No description provided for @projectionConeAngle.
  ///
  /// In fr, this message translates to:
  /// **'Projection Cone Angle : {p0}'**
  String projectionConeAngle(Object p0);

  /// No description provided for @projectionConeDiameter.
  ///
  /// In fr, this message translates to:
  /// **'Projection Cone Diameter : {p0}'**
  String projectionConeDiameter(Object p0);

  /// No description provided for @projectionConeDistance.
  ///
  /// In fr, this message translates to:
  /// **'Projection Cone Distance : {p0}'**
  String projectionConeDistance(Object p0);

  /// No description provided for @projectionDetailAngle.
  ///
  /// In fr, this message translates to:
  /// **'Projection Detail Angle : {p0}'**
  String projectionDetailAngle(Object p0);

  /// No description provided for @projectionDetailDiameter.
  ///
  /// In fr, this message translates to:
  /// **'Projection Detail Diameter : {p0}'**
  String projectionDetailDiameter(Object p0);

  /// No description provided for @projectionDetailDistance.
  ///
  /// In fr, this message translates to:
  /// **'Projection Detail Distance : {p0}'**
  String projectionDetailDistance(Object p0);

  /// No description provided for @projectionDiameterHint.
  ///
  /// In fr, this message translates to:
  /// **'Projection Diameter Hint'**
  String get projectionDiameterHint;

  /// No description provided for @projectionDiameterLabel.
  ///
  /// In fr, this message translates to:
  /// **'Projection Diameter Label'**
  String get projectionDiameterLabel;

  /// No description provided for @projectionDistanceHint.
  ///
  /// In fr, this message translates to:
  /// **'Projection Distance Hint'**
  String get projectionDistanceHint;

  /// No description provided for @projectionDistanceLabel.
  ///
  /// In fr, this message translates to:
  /// **'Projection Distance Label'**
  String get projectionDistanceLabel;

  /// No description provided for @projectionHeaderAutoActive.
  ///
  /// In fr, this message translates to:
  /// **'Projection Header Auto Active'**
  String get projectionHeaderAutoActive;

  /// No description provided for @projectionHeaderNeedTwoValues.
  ///
  /// In fr, this message translates to:
  /// **'Projection Header Need Two Values'**
  String get projectionHeaderNeedTwoValues;

  /// No description provided for @projectionInputsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Projection Inputs Title'**
  String get projectionInputsTitle;

  /// No description provided for @projectionResultsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Projection Results Title'**
  String get projectionResultsTitle;

  /// No description provided for @refBeamFieldContent.
  ///
  /// In fr, this message translates to:
  /// **'Ref Beam Field Content'**
  String get refBeamFieldContent;

  /// No description provided for @refBeamFieldTitle.
  ///
  /// In fr, this message translates to:
  /// **'Ref Beam Field Title'**
  String get refBeamFieldTitle;

  /// No description provided for @refBeamLegendBeam.
  ///
  /// In fr, this message translates to:
  /// **'Ref Beam Legend Beam'**
  String get refBeamLegendBeam;

  /// No description provided for @refBeamLegendField.
  ///
  /// In fr, this message translates to:
  /// **'Ref Beam Legend Field'**
  String get refBeamLegendField;

  /// No description provided for @refCri80.
  ///
  /// In fr, this message translates to:
  /// **'Ref Cri80'**
  String get refCri80;

  /// No description provided for @refCri90.
  ///
  /// In fr, this message translates to:
  /// **'Ref Cri90'**
  String get refCri90;

  /// No description provided for @refCriContent.
  ///
  /// In fr, this message translates to:
  /// **'Ref Cri Content'**
  String get refCriContent;

  /// No description provided for @refCriLow.
  ///
  /// In fr, this message translates to:
  /// **'Ref Cri Low'**
  String get refCriLow;

  /// No description provided for @refCriTitle.
  ///
  /// In fr, this message translates to:
  /// **'Ref Cri Title'**
  String get refCriTitle;

  /// No description provided for @refKelvinContent.
  ///
  /// In fr, this message translates to:
  /// **'Ref Kelvin Content'**
  String get refKelvinContent;

  /// No description provided for @refKelvinTitle.
  ///
  /// In fr, this message translates to:
  /// **'Ref Kelvin Title'**
  String get refKelvinTitle;

  /// No description provided for @refLightDisclaimerShort.
  ///
  /// In fr, this message translates to:
  /// **'Ref Light Disclaimer Short'**
  String get refLightDisclaimerShort;

  /// No description provided for @refLuxColLux.
  ///
  /// In fr, this message translates to:
  /// **'Ref Lux Col Lux'**
  String get refLuxColLux;

  /// No description provided for @refLuxColUse.
  ///
  /// In fr, this message translates to:
  /// **'Ref Lux Col Use'**
  String get refLuxColUse;

  /// No description provided for @refLuxIntro.
  ///
  /// In fr, this message translates to:
  /// **'Ref Lux Intro'**
  String get refLuxIntro;

  /// No description provided for @refLuxNote.
  ///
  /// In fr, this message translates to:
  /// **'Ref Lux Note'**
  String get refLuxNote;

  /// No description provided for @refLuxTitle.
  ///
  /// In fr, this message translates to:
  /// **'Ref Lux Title'**
  String get refLuxTitle;

  /// No description provided for @refLuxUseBackstage.
  ///
  /// In fr, this message translates to:
  /// **'Ref Lux Use Backstage'**
  String get refLuxUseBackstage;

  /// No description provided for @refLuxUseCorridor.
  ///
  /// In fr, this message translates to:
  /// **'Ref Lux Use Corridor'**
  String get refLuxUseCorridor;

  /// No description provided for @refLuxUseExpo.
  ///
  /// In fr, this message translates to:
  /// **'Ref Lux Use Expo'**
  String get refLuxUseExpo;

  /// No description provided for @refLuxUseMeeting.
  ///
  /// In fr, this message translates to:
  /// **'Ref Lux Use Meeting'**
  String get refLuxUseMeeting;

  /// No description provided for @refLuxUseStageGeneral.
  ///
  /// In fr, this message translates to:
  /// **'Ref Lux Use Stage General'**
  String get refLuxUseStageGeneral;

  /// No description provided for @refLuxUseStageTv.
  ///
  /// In fr, this message translates to:
  /// **'Ref Lux Use Stage Tv'**
  String get refLuxUseStageTv;

  /// No description provided for @riggingAngleHLeftInputLabel.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Angle HLeft Input Label'**
  String get riggingAngleHLeftInputLabel;

  /// No description provided for @riggingAngleHLeftLabel.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Angle HLeft Label'**
  String get riggingAngleHLeftLabel;

  /// No description provided for @riggingAngleHRightLabel.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Angle HRight Label'**
  String get riggingAngleHRightLabel;

  /// No description provided for @riggingAngleVLeftLabel.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Angle VLeft Label'**
  String get riggingAngleVLeftLabel;

  /// No description provided for @riggingAngleVRightLabel.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Angle VRight Label'**
  String get riggingAngleVRightLabel;

  /// No description provided for @riggingCalc1Title.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Calc1 Title'**
  String get riggingCalc1Title;

  /// No description provided for @riggingCalc2Subtitle.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Calc2 Subtitle'**
  String get riggingCalc2Subtitle;

  /// No description provided for @riggingCalc2Title.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Calc2 Title'**
  String get riggingCalc2Title;

  /// No description provided for @riggingCalc3Subtitle.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Calc3 Subtitle'**
  String get riggingCalc3Subtitle;

  /// No description provided for @riggingCalc3Title.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Calc3 Title'**
  String get riggingCalc3Title;

  /// No description provided for @riggingCalcCommonSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Calc Common Subtitle'**
  String get riggingCalcCommonSubtitle;

  /// No description provided for @riggingDisclaimerNoLoad.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Disclaimer No Load'**
  String get riggingDisclaimerNoLoad;

  /// No description provided for @riggingDropLabel.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Drop Label'**
  String get riggingDropLabel;

  /// No description provided for @riggingImpossibleGeometry.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Impossible Geometry'**
  String get riggingImpossibleGeometry;

  /// No description provided for @riggingIncludedAngleLabel.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Included Angle Label'**
  String get riggingIncludedAngleLabel;

  /// No description provided for @riggingInputsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Inputs Title'**
  String get riggingInputsTitle;

  /// No description provided for @riggingInvalidOffset.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Invalid Offset'**
  String get riggingInvalidOffset;

  /// No description provided for @riggingLegLeftInputLabel.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Leg Left Input Label'**
  String get riggingLegLeftInputLabel;

  /// No description provided for @riggingLegLeftLabel.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Leg Left Label'**
  String get riggingLegLeftLabel;

  /// No description provided for @riggingLegRightLabel.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Leg Right Label'**
  String get riggingLegRightLabel;

  /// No description provided for @riggingNeedPositiveValues.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Need Positive Values'**
  String get riggingNeedPositiveValues;

  /// No description provided for @riggingOffCenterToggle.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Off Center Toggle'**
  String get riggingOffCenterToggle;

  /// No description provided for @riggingOffsetLabel.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Offset Label'**
  String get riggingOffsetLabel;

  /// No description provided for @riggingResultsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Results Title'**
  String get riggingResultsTitle;

  /// No description provided for @riggingSchemaTitle.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Schema Title'**
  String get riggingSchemaTitle;

  /// No description provided for @riggingSpanLabel.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Span Label'**
  String get riggingSpanLabel;

  /// No description provided for @riggingTitle.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Title'**
  String get riggingTitle;

  /// No description provided for @riggingUnitKg.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Unit kg'**
  String get riggingUnitKg;

  /// No description provided for @riggingUnitMeters.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Unit Meters'**
  String get riggingUnitMeters;

  /// No description provided for @riggingWeightLabel.
  ///
  /// In fr, this message translates to:
  /// **'Rigging Weight Label'**
  String get riggingWeightLabel;

  /// No description provided for @sunTimesIntro.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Intro'**
  String get sunTimesIntro;

  /// No description provided for @sunTimesLabelCity.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Label City'**
  String get sunTimesLabelCity;

  /// No description provided for @sunTimesLabelDate.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Label Date'**
  String get sunTimesLabelDate;

  /// No description provided for @sunTimesLuxAstro.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Lux Astro'**
  String get sunTimesLuxAstro;

  /// No description provided for @sunTimesLuxCivil.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Lux Civil'**
  String get sunTimesLuxCivil;

  /// No description provided for @sunTimesLuxDay.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Lux Day'**
  String get sunTimesLuxDay;

  /// No description provided for @sunTimesLuxFullDay.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Lux Full Day'**
  String get sunTimesLuxFullDay;

  /// No description provided for @sunTimesLuxLow.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Lux Low'**
  String get sunTimesLuxLow;

  /// No description provided for @sunTimesLuxNautical.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Lux Nautical'**
  String get sunTimesLuxNautical;

  /// No description provided for @sunTimesLuxNight.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Lux Night'**
  String get sunTimesLuxNight;

  /// No description provided for @sunTimesLuxNote.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Lux Note'**
  String get sunTimesLuxNote;

  /// No description provided for @sunTimesLuxVeryLow.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Lux Very Low'**
  String get sunTimesLuxVeryLow;

  /// No description provided for @sunTimesNoData.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times No Data'**
  String get sunTimesNoData;

  /// No description provided for @sunTimesNoteApprox.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Note Approx'**
  String get sunTimesNoteApprox;

  /// No description provided for @sunTimesResultAstronomicalDawn.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Result Astronomical Dawn'**
  String get sunTimesResultAstronomicalDawn;

  /// No description provided for @sunTimesResultAstronomicalDusk.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Result Astronomical Dusk'**
  String get sunTimesResultAstronomicalDusk;

  /// No description provided for @sunTimesResultCivilDawn.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Result Civil Dawn'**
  String get sunTimesResultCivilDawn;

  /// No description provided for @sunTimesResultCivilDusk.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Result Civil Dusk'**
  String get sunTimesResultCivilDusk;

  /// No description provided for @sunTimesResultNauticalDawn.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Result Nautical Dawn'**
  String get sunTimesResultNauticalDawn;

  /// No description provided for @sunTimesResultNauticalDusk.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Result Nautical Dusk'**
  String get sunTimesResultNauticalDusk;

  /// No description provided for @sunTimesResultSunrise.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Result Sunrise'**
  String get sunTimesResultSunrise;

  /// No description provided for @sunTimesResultSunset.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Result Sunset'**
  String get sunTimesResultSunset;

  /// No description provided for @sunTimesSectionLux.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Section Lux'**
  String get sunTimesSectionLux;

  /// No description provided for @sunTimesSectionResults.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Section Results'**
  String get sunTimesSectionResults;

  /// No description provided for @sunTimesSectionSettings.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Section Settings'**
  String get sunTimesSectionSettings;

  /// No description provided for @sunTimesSectionTimeline.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Section Timeline'**
  String get sunTimesSectionTimeline;

  /// No description provided for @sunTimesSectionTwilight.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Section Twilight'**
  String get sunTimesSectionTwilight;

  /// No description provided for @sunTimesTimelineAstronomical.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Timeline Astronomical'**
  String get sunTimesTimelineAstronomical;

  /// No description provided for @sunTimesTimelineCivil.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Timeline Civil'**
  String get sunTimesTimelineCivil;

  /// No description provided for @sunTimesTimelineDay.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Timeline Day'**
  String get sunTimesTimelineDay;

  /// No description provided for @sunTimesTimelineNautical.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Timeline Nautical'**
  String get sunTimesTimelineNautical;

  /// No description provided for @sunTimesTimelineNight.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Timeline Night'**
  String get sunTimesTimelineNight;

  /// No description provided for @sunTimesTimelineStep30.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Timeline Step30'**
  String get sunTimesTimelineStep30;

  /// No description provided for @sunTimesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Title'**
  String get sunTimesTitle;

  /// No description provided for @sunTimesTwilightAstronomicalBody.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Twilight Astronomical Body'**
  String get sunTimesTwilightAstronomicalBody;

  /// No description provided for @sunTimesTwilightAstronomicalTitle.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Twilight Astronomical Title'**
  String get sunTimesTwilightAstronomicalTitle;

  /// No description provided for @sunTimesTwilightCivilBody.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Twilight Civil Body'**
  String get sunTimesTwilightCivilBody;

  /// No description provided for @sunTimesTwilightCivilTitle.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Twilight Civil Title'**
  String get sunTimesTwilightCivilTitle;

  /// No description provided for @sunTimesTwilightIntro.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Twilight Intro'**
  String get sunTimesTwilightIntro;

  /// No description provided for @sunTimesTwilightNauticalBody.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Twilight Nautical Body'**
  String get sunTimesTwilightNauticalBody;

  /// No description provided for @sunTimesTwilightNauticalTitle.
  ///
  /// In fr, this message translates to:
  /// **'Sun Times Twilight Nautical Title'**
  String get sunTimesTwilightNauticalTitle;

  /// No description provided for @videoCamApertureHint.
  ///
  /// In fr, this message translates to:
  /// **'Video Cam Aperture Hint'**
  String get videoCamApertureHint;

  /// No description provided for @videoCamApertureLabel.
  ///
  /// In fr, this message translates to:
  /// **'Video Cam Aperture Label'**
  String get videoCamApertureLabel;

  /// No description provided for @videoCamApertureResult.
  ///
  /// In fr, this message translates to:
  /// **'Video Cam Aperture Result : {p0}'**
  String videoCamApertureResult(Object p0);

  /// No description provided for @videoCamEvEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Video Cam EV Empty'**
  String get videoCamEvEmpty;

  /// No description provided for @videoCamEvValue.
  ///
  /// In fr, this message translates to:
  /// **'Video Cam EV Value : {p0}'**
  String videoCamEvValue(Object p0);

  /// No description provided for @videoCamInfoTitle.
  ///
  /// In fr, this message translates to:
  /// **'Video Cam Info Title'**
  String get videoCamInfoTitle;

  /// No description provided for @videoCamInputsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Video Cam Inputs Title'**
  String get videoCamInputsTitle;

  /// No description provided for @videoCamIntro.
  ///
  /// In fr, this message translates to:
  /// **'Video Cam Intro'**
  String get videoCamIntro;

  /// No description provided for @videoCamIsoHint.
  ///
  /// In fr, this message translates to:
  /// **'Video Cam Iso Hint'**
  String get videoCamIsoHint;

  /// No description provided for @videoCamIsoLabel.
  ///
  /// In fr, this message translates to:
  /// **'Video Cam Iso Label'**
  String get videoCamIsoLabel;

  /// No description provided for @videoCamLuxHint.
  ///
  /// In fr, this message translates to:
  /// **'Video Cam Lux Hint'**
  String get videoCamLuxHint;

  /// No description provided for @videoCamLuxLabel.
  ///
  /// In fr, this message translates to:
  /// **'Video Cam Lux Label'**
  String get videoCamLuxLabel;

  /// No description provided for @videoCamNote.
  ///
  /// In fr, this message translates to:
  /// **'Video Cam Note'**
  String get videoCamNote;

  /// No description provided for @videoCamPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Video Cam Page Title'**
  String get videoCamPageTitle;

  /// No description provided for @videoCamShutterHint.
  ///
  /// In fr, this message translates to:
  /// **'Video Cam Shutter Hint'**
  String get videoCamShutterHint;

  /// No description provided for @videoCamShutterLabel.
  ///
  /// In fr, this message translates to:
  /// **'Video Cam Shutter Label'**
  String get videoCamShutterLabel;

  /// No description provided for @videoCamShutterResult.
  ///
  /// In fr, this message translates to:
  /// **'Video Cam Shutter Result : {p0}'**
  String videoCamShutterResult(Object p0);

  /// No description provided for @videoCameraExposureSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Video Camera Exposure Subtitle'**
  String get videoCameraExposureSubtitle;

  /// No description provided for @videoCameraExposureTitle.
  ///
  /// In fr, this message translates to:
  /// **'Video Camera Exposure Title'**
  String get videoCameraExposureTitle;

  /// No description provided for @videoLedResultPitch.
  ///
  /// In fr, this message translates to:
  /// **'Video LED Result Pitch'**
  String get videoLedResultPitch;

  /// No description provided for @videoLedResultTile.
  ///
  /// In fr, this message translates to:
  /// **'Video LED Result Tile'**
  String get videoLedResultTile;

  /// No description provided for @videoLedResultWallResolution.
  ///
  /// In fr, this message translates to:
  /// **'Video LED Result Wall Resolution'**
  String get videoLedResultWallResolution;

  /// No description provided for @videoLedResultWallSize.
  ///
  /// In fr, this message translates to:
  /// **'Video LED Result Wall Size'**
  String get videoLedResultWallSize;

  ///
  ///
  /// In fr, this message translates to:
  /// **'DMX (univers)'**
  String get aboutUniverseToArtnetColDmx;

  ///
  ///
  /// In fr, this message translates to:
  /// **'Subnet'**
  String get aboutUniverseToArtnetColSubnet;

  ///
  ///
  /// In fr, this message translates to:
  /// **'Univers'**
  String get aboutUniverseToArtnetColUniverse;

  ///
  ///
  /// In fr, this message translates to:
  /// **'Uni (hex)'**
  String get aboutUniverseToArtnetColUniHex;

  ///
  ///
  /// In fr, this message translates to:
  /// **'Univers DMX → Art-Net'**
  String get aboutUniverseToArtnetTitle;

  ///
  ///
  /// In fr, this message translates to:
  /// **'Table de conversion'**
  String get aboutUniverseToArtnetTableTitle;

  ///
  ///
  /// In fr, this message translates to:
  /// **'Correspondance pratique entre l’univers DMX (sACN) et les champs Art-Net (Subnet/Universe).'**
  String get aboutUniverseToArtnetTableIntro;

  ///
  ///
  /// In fr, this message translates to:
  /// **'Note : certaines consoles, nodes ou logiciels peuvent numéroter à partir de 0 ou 1 selon le contexte. Vérifie toujours la documentation.'**
  String get aboutUniverseTablesDisclaimer;

  ///
  ///
  /// In fr, this message translates to:
  /// **'Mon App Tech – Contact'**
  String get homeContactEmailSubject;

  ///
  ///
  /// In fr, this message translates to:
  /// **'Impossible d’ouvrir l’application e‑mail.'**
  String get homeErrorOpenEmail;

  ///
  ///
  /// In fr, this message translates to:
  /// **'Impossible d’ouvrir le formulaire.'**
  String get homeErrorOpenForm;
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
