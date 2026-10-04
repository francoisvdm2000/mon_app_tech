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

  /// No description provided for @aboutArtNetSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Univers DMX sur Ethernet/UDP, nodes, broadcast vs unicast.\nLimites réelles, stabilité réseau, RDM selon matériel.'**
  String get aboutArtNetSubtitle;

  /// No description provided for @aboutArtNetTitle.
  ///
  /// In fr, this message translates to:
  /// **'Art-Net — DMX sur IP (nodes, unicast/broadcast)'**
  String get aboutArtNetTitle;

  /// No description provided for @aboutCablingFiberSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Cat5e→Cat8, fibre OM3/OM4/OS2, LC/SC/MPO, distances typiques, bonnes pratiques show.'**
  String get aboutCablingFiberSubtitle;

  /// No description provided for @aboutCablingFiberTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réseau — RJ45 / Fibre / débits & longueurs'**
  String get aboutCablingFiberTitle;

  /// No description provided for @aboutComputingSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Débits utiles, versions, limites réelles, pièges marketing.'**
  String get aboutComputingSubtitle;

  /// No description provided for @aboutComputingTitle.
  ///
  /// In fr, this message translates to:
  /// **'Informatique — USB / HDMI / DP / SATA / NVMe…'**
  String get aboutComputingTitle;

  /// No description provided for @aboutDmxSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Univers, adresses, trames, câblage RS-485, terminaison, erreurs terrain.\nInclut schémas + checklist.'**
  String get aboutDmxSubtitle;

  /// No description provided for @aboutDmxTitle.
  ///
  /// In fr, this message translates to:
  /// **'DMX'**
  String get aboutDmxTitle;

  /// No description provided for @aboutElectricitySubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Connecteurs, mono/tri, tableaux kW rapides (16A→400A), pièges terrain.'**
  String get aboutElectricitySubtitle;

  /// No description provided for @aboutElectricityTitle.
  ///
  /// In fr, this message translates to:
  /// **'Électrique — Schuko / P17 / puissances'**
  String get aboutElectricityTitle;

  /// No description provided for @aboutIpBasicsSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Comprendre IP, masque, passerelle, DHCP vs statique.\nExemples concrets (2.x, 10.x, 192.168.x) + checklist.'**
  String get aboutIpBasicsSubtitle;

  /// No description provided for @aboutIpBasicsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Bases IP'**
  String get aboutIpBasicsTitle;

  /// No description provided for @aboutLightNetworkSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Architecture simple et robuste pour Art-Net/sACN.\nVLAN, IGMP snooping/querier, Wi-Fi (jitter), switchs, schémas + checklist.'**
  String get aboutLightNetworkSubtitle;

  /// No description provided for @aboutLightNetworkTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réseau lumière — VLAN, IGMP, Wi-Fi vs filaire'**
  String get aboutLightNetworkTitle;

  /// No description provided for @aboutSacnSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Standard DMX sur IP orienté réseau \"pro\".\nMulticast/unicast, IGMP snooping/querier, priorités multi-sources.'**
  String get aboutSacnSubtitle;

  /// No description provided for @aboutSacnTitle.
  ///
  /// In fr, this message translates to:
  /// **'sACN'**
  String get aboutSacnTitle;

  /// No description provided for @aboutVideoSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Choisir selon latence, fiabilité, câblage, réseau LAN vs WAN.\nTableaux + schéma.'**
  String get aboutVideoSubtitle;

  /// No description provided for @aboutVideoTitle.
  ///
  /// In fr, this message translates to:
  /// **'Vidéo'**
  String get aboutVideoTitle;

  /// No description provided for @appTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mon App Tech'**
  String get appTitle;

  /// No description provided for @catalogDmxModeItem.
  ///
  /// In fr, this message translates to:
  /// **'{name} — {channels} canaux'**
  String catalogDmxModeItem(Object channels, Object name);

  /// No description provided for @catalogDmxModeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mode DMX ({count})'**
  String catalogDmxModeTitle(Object count);

  /// No description provided for @catalogInfoDmxChannels.
  ///
  /// In fr, this message translates to:
  /// **'Canaux DMX'**
  String get catalogInfoDmxChannels;

  /// No description provided for @catalogInfoLuminousFlux.
  ///
  /// In fr, this message translates to:
  /// **'Flux lumineux'**
  String get catalogInfoLuminousFlux;

  /// No description provided for @catalogInfoPower.
  ///
  /// In fr, this message translates to:
  /// **'Puissance'**
  String get catalogInfoPower;

  /// No description provided for @catalogInfoWeight.
  ///
  /// In fr, this message translates to:
  /// **'Poids'**
  String get catalogInfoWeight;

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

  /// No description provided for @catalogModelTitle.
  ///
  /// In fr, this message translates to:
  /// **'Modèle ({count})'**
  String catalogModelTitle(Object count);

  /// No description provided for @catalogNotProvided.
  ///
  /// In fr, this message translates to:
  /// **'Non renseigné'**
  String get catalogNotProvided;

  /// No description provided for @catalogOpenDmxChart.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrir la table DMX'**
  String get catalogOpenDmxChart;

  /// No description provided for @catalogOpenManual.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrir le manuel'**
  String get catalogOpenManual;

  /// No description provided for @catalogResetTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser'**
  String get catalogResetTooltip;

  /// No description provided for @catalogSyncError.
  ///
  /// In fr, this message translates to:
  /// **'Erreur : {message}'**
  String catalogSyncError(Object message);

  /// No description provided for @catalogSyncFailed.
  ///
  /// In fr, this message translates to:
  /// **'Échec de synchronisation : {reason}'**
  String catalogSyncFailed(Object reason);

  /// No description provided for @catalogSyncFailedUnknown.
  ///
  /// In fr, this message translates to:
  /// **'Échec de synchronisation (raison inconnue).'**
  String get catalogSyncFailedUnknown;

  /// No description provided for @catalogTypeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Type ({count})'**
  String catalogTypeTitle(Object count);

  /// No description provided for @catalogUpdateTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Mettre à jour'**
  String get catalogUpdateTooltip;

  /// No description provided for @catalogUpdated.
  ///
  /// In fr, this message translates to:
  /// **'Catalogue mis à jour.'**
  String get catalogUpdated;

  /// No description provided for @commonCalculate.
  ///
  /// In fr, this message translates to:
  /// **'Calculer'**
  String get commonCalculate;

  /// No description provided for @commonCancel.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get commonCancel;

  /// No description provided for @commonCopyResultTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Copier le résultat'**
  String get commonCopyResultTooltip;

  /// No description provided for @commonDash.
  ///
  /// In fr, this message translates to:
  /// **'—'**
  String get commonDash;

  /// No description provided for @commonNone.
  ///
  /// In fr, this message translates to:
  /// **'Aucun enregistrement'**
  String get commonNone;

  /// No description provided for @commonOk.
  ///
  /// In fr, this message translates to:
  /// **'OK'**
  String get commonOk;

  /// No description provided for @commonOkWithCheck.
  ///
  /// In fr, this message translates to:
  /// **'OK ✅'**
  String get commonOkWithCheck;

  /// No description provided for @commonRename.
  ///
  /// In fr, this message translates to:
  /// **'Renommer'**
  String get commonRename;

  /// No description provided for @commonReset.
  ///
  /// In fr, this message translates to:
  /// **'Reset'**
  String get commonReset;

  /// No description provided for @commonSave.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer'**
  String get commonSave;

  /// No description provided for @commonSearch.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher'**
  String get commonSearch;

  /// No description provided for @commonTooLowWithCross.
  ///
  /// In fr, this message translates to:
  /// **'Trop faible ❌'**
  String get commonTooLowWithCross;

  /// No description provided for @commonUnitMeter.
  ///
  /// In fr, this message translates to:
  /// **'m'**
  String get commonUnitMeter;

  /// No description provided for @consentsReset.
  ///
  /// In fr, this message translates to:
  /// **'Consentements réinitialisés.'**
  String get consentsReset;

  /// No description provided for @dipSwitchAddressHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex : 1 à 512'**
  String get dipSwitchAddressHint;

  /// No description provided for @dipSwitchAddressLabel.
  ///
  /// In fr, this message translates to:
  /// **'Adresse DMX'**
  String get dipSwitchAddressLabel;

  /// No description provided for @dipSwitchChannelUnit.
  ///
  /// In fr, this message translates to:
  /// **'canal'**
  String get dipSwitchChannelUnit;

  /// No description provided for @dipSwitchEndOfUniverseWarning.
  ///
  /// In fr, this message translates to:
  /// **'Attention : fin d’univers DMX atteinte.'**
  String get dipSwitchEndOfUniverseWarning;

  /// No description provided for @dipSwitchInputsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Entrées'**
  String get dipSwitchInputsTitle;

  /// No description provided for @dipSwitchIntervalHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex : 4 (canaux)'**
  String get dipSwitchIntervalHint;

  /// No description provided for @dipSwitchIntervalLabel.
  ///
  /// In fr, this message translates to:
  /// **'Intervalle'**
  String get dipSwitchIntervalLabel;

  /// No description provided for @dipSwitchModeAddressDirect.
  ///
  /// In fr, this message translates to:
  /// **'Adresse directe'**
  String get dipSwitchModeAddressDirect;

  /// No description provided for @dipSwitchModeAddressMinusOne.
  ///
  /// In fr, this message translates to:
  /// **'Adresse - 1'**
  String get dipSwitchModeAddressMinusOne;

  /// No description provided for @dipSwitchNextAddressButton.
  ///
  /// In fr, this message translates to:
  /// **'Adresse suivante'**
  String get dipSwitchNextAddressButton;

  /// No description provided for @dipSwitchOffLabel.
  ///
  /// In fr, this message translates to:
  /// **'OFF'**
  String get dipSwitchOffLabel;

  /// No description provided for @dipSwitchOnLabel.
  ///
  /// In fr, this message translates to:
  /// **'ON'**
  String get dipSwitchOnLabel;

  /// No description provided for @dipSwitchResetTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser'**
  String get dipSwitchResetTooltip;

  /// No description provided for @dipSwitchResultAddressLine.
  ///
  /// In fr, this message translates to:
  /// **'Adresse : {address}'**
  String dipSwitchResultAddressLine(Object address);

  /// No description provided for @dipSwitchResultAddressNotProvided.
  ///
  /// In fr, this message translates to:
  /// **'Adresse non renseignée'**
  String get dipSwitchResultAddressNotProvided;

  /// No description provided for @dipSwitchResultBinaryValueLine.
  ///
  /// In fr, this message translates to:
  /// **'Binaire : {binary}'**
  String dipSwitchResultBinaryValueLine(Object binary);

  /// No description provided for @dipSwitchResultHeader.
  ///
  /// In fr, this message translates to:
  /// **'Résultat'**
  String get dipSwitchResultHeader;

  /// No description provided for @dipSwitchResultIntervalLine.
  ///
  /// In fr, this message translates to:
  /// **'Intervalle : {start} → {end}'**
  String dipSwitchResultIntervalLine(Object end, Object start);

  /// No description provided for @dipSwitchResultModeLine.
  ///
  /// In fr, this message translates to:
  /// **'Mode : {mode}'**
  String dipSwitchResultModeLine(Object mode);

  /// No description provided for @dipSwitchScrollHint.
  ///
  /// In fr, this message translates to:
  /// **'Fais défiler pour voir tous les switchs.'**
  String get dipSwitchScrollHint;

  /// No description provided for @dipSwitchSectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Switchs'**
  String get dipSwitchSectionTitle;

  /// No description provided for @dipSwitchSummaryTitle.
  ///
  /// In fr, this message translates to:
  /// **'Résumé'**
  String get dipSwitchSummaryTitle;

  /// No description provided for @dipSwitchSwitchLabel.
  ///
  /// In fr, this message translates to:
  /// **'Switch {index}'**
  String dipSwitchSwitchLabel(Object index);

  /// No description provided for @dipSwitchUseAddressMinusOneLabel.
  ///
  /// In fr, this message translates to:
  /// **'Utiliser le mode Adresse - 1'**
  String get dipSwitchUseAddressMinusOneLabel;

  /// No description provided for @disclaimerAccept.
  ///
  /// In fr, this message translates to:
  /// **'J\'accepte'**
  String get disclaimerAccept;

  /// No description provided for @disclaimerCertify.
  ///
  /// In fr, this message translates to:
  /// **'Je certifie avoir lu et accepté ces conditions.'**
  String get disclaimerCertify;

  /// No description provided for @disclaimerText.
  ///
  /// In fr, this message translates to:
  /// **'UTILISATION À TITRE INDICATIF UNIQUEMENT\n\nLes calculs fournis par cette application (vidéo, lumière, laser) sont donnés à titre informatif et indicatif.\nIls ne remplacent en aucun cas :\n- des calculs certifiés,\n- des études techniques,\n- les normes officielles en vigueur,\n- ni la validation par un professionnel qualifié.\n\nRESPONSABILITÉ\nL’éditeur de cette application ne peut être tenu responsable d’erreurs de calcul, d’omissions, de dommages matériels,\nd’accidents corporels, ou de tout incident survenant lors de l’installation, de l’exploitation ou de l’utilisation des équipements.\n\nVIDÉO & PROJECTION\nLes résultats (tailles, ratios, luminosité, overlaps, etc.) reposent sur des modèles théoriques et peuvent varier selon :\noptique, zoom, uniformité, environnement lumineux, support, réglages, etc.\nToujours vérifier avec les documentations constructeur officielles.\n\nLUMIÈRE\nLes calculs sont indicatifs et ne tienent pas compte de toutes les conditions réelles (tolérances, pertes optiques,\ndégradation des sources, normes locales, conditions ambiantes…).\n\nLASER – SÉCURITÉ\nLes calculs NOHD, SZED et CZED sont basés sur des hypothèses standards et des seuils théoriques.\nIls ne prennent pas en compte notamment :\n- instruments optiques (jumelles, caméras, télescopes…),\n- conditions atmosphériques (brouillard, pluie, poussière…),\n- réflexions imprévues, usages détournés, réglages spécifiques.\nL’utilisation d’un système laser implique une responsabilité directe de l’opérateur et une analyse de risques adaptée.\n\nACCEPTATION DES RISQUES\nEn utilisant cette application, l’utilisateur reconnaît :\n- avoir pris connaissance des règles de sécurité applicables,\n- être seul responsable de ses installations,\n- assumer l’entière responsabilité des risques liés à l’utilisation des équipements (vidéo, lumière, laser),\n- vérifier systématiquement les données avec les manuels constructeurs officiels.'**
  String get disclaimerText;

  /// No description provided for @disclaimerTitle.
  ///
  /// In fr, this message translates to:
  /// **'⚠️ AVERTISSEMENT LÉGAL & NON-RESPONSABILITÉ'**
  String get disclaimerTitle;

  /// No description provided for @homeLaserSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Calculs et sécurité laser (consentement requis à chaque entrée).'**
  String get homeLaserSubtitle;

  /// No description provided for @homeLaserTitle.
  ///
  /// In fr, this message translates to:
  /// **'Laser'**
  String get homeLaserTitle;

  /// No description provided for @homeLightSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Taille de projection, dip-switch DMX, photométrie, catalogue, patch DMX.'**
  String get homeLightSubtitle;

  /// No description provided for @homeLightTitle.
  ///
  /// In fr, this message translates to:
  /// **'Lumière'**
  String get homeLightTitle;

  /// No description provided for @homeReferencesSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'DMX / réseau / vidéo : fiches & repères terrain.'**
  String get homeReferencesSubtitle;

  /// No description provided for @homeReferencesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Références'**
  String get homeReferencesTitle;

  /// No description provided for @homeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Accueil'**
  String get homeTitle;

  /// No description provided for @homeVideoSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Lentille & mesure, luminosité, multiprojecteur, LED et mires.'**
  String get homeVideoSubtitle;

  /// No description provided for @homeVideoTitle.
  ///
  /// In fr, this message translates to:
  /// **'Vidéo'**
  String get homeVideoTitle;

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

  /// No description provided for @laserConsentCheckboxLabel.
  ///
  /// In fr, this message translates to:
  /// **'J’accepte et je comprends les risques.'**
  String get laserConsentCheckboxLabel;

  /// No description provided for @laserConsentContinue.
  ///
  /// In fr, this message translates to:
  /// **'Continuer'**
  String get laserConsentContinue;

  /// No description provided for @laserConsentText.
  ///
  /// In fr, this message translates to:
  /// **'ACCÈS À LA PARTIE LASER\n\nLa partie LASER de cette application concerne des calculs de sécurité (ex : NOHD, SZED, CZED).\nCes calculs sont indicatifs et ne remplacent pas :\n- une analyse de risques,\n- les normes en vigueur,\n- les procédures d’exploitation,\n- ni la validation par une personne qualifiée.\n\nIMPORTANT\n- Risque de lésions oculaires / cutanées en cas de mauvaise utilisation.\n- Le calcul peut être faux si les paramètres entrés sont incomplets, erronés ou si le contexte réel diffère (optique,\n  conditions atmosphériques, réflexions, alignement, etc.).\n- L’opérateur est seul responsable de l’installation, de l’exploitation et de la conformité.\n\nEn validant, vous confirmez :\n- comprendre les risques,\n- respecter les règles de sécurité applicables,\n- assumer l’entière responsabilité en cas de négligence ou mauvaise utilisation.'**
  String get laserConsentText;

  /// No description provided for @laserConsentTitle.
  ///
  /// In fr, this message translates to:
  /// **'🔴 CONSENTEMENT LASER (OBLIGATOIRE)'**
  String get laserConsentTitle;

  /// No description provided for @laserDiameterHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 3.0'**
  String get laserDiameterHint;

  /// No description provided for @laserDiameterLabel.
  ///
  /// In fr, this message translates to:
  /// **'Diamètre de sortie (mm)'**
  String get laserDiameterLabel;

  /// No description provided for @laserDisclaimerShort.
  ///
  /// In fr, this message translates to:
  /// **'Calcul indicatif. Ne remplace pas une analyse de sécurité laser.'**
  String get laserDisclaimerShort;

  /// No description provided for @laserDivergenceHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1.2'**
  String get laserDivergenceHint;

  /// No description provided for @laserDivergenceLabel.
  ///
  /// In fr, this message translates to:
  /// **'Divergence (mrad)'**
  String get laserDivergenceLabel;

  /// No description provided for @laserInputsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Entrées'**
  String get laserInputsTitle;

  /// No description provided for @laserInvalidInputs.
  ///
  /// In fr, this message translates to:
  /// **'Veuillez entrer une puissance, une divergence et un diamètre valides.'**
  String get laserInvalidInputs;

  /// No description provided for @laserNameUpdated.
  ///
  /// In fr, this message translates to:
  /// **'Nom mis à jour.'**
  String get laserNameUpdated;

  /// No description provided for @laserNormativeParamsBody.
  ///
  /// In fr, this message translates to:
  /// **'MPE pour la distance nominale de danger oculaire (NOHD) : 25,4 W/m²\n(Norme IEC 60825-1, édition 3.0)\n\nMPE pour la distance d’exposition de la zone sensible (SZED) : 1 W/m²\n(Norme ANSI Z136.6)\n\nMPE pour la distance d’exposition de la zone critique (CZED) : 0,05 W/m²\n(Norme ANSI Z136.6)'**
  String get laserNormativeParamsBody;

  /// No description provided for @laserNormativeParamsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres de sécurité retenus'**
  String get laserNormativeParamsTitle;

  /// No description provided for @laserPowerHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 5000'**
  String get laserPowerHint;

  /// No description provided for @laserPowerLabel.
  ///
  /// In fr, this message translates to:
  /// **'Puissance (mW)'**
  String get laserPowerLabel;

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

  /// No description provided for @laserPresetSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'P: {p} mW • Div: {div} mrad • Ø: {diam} mm'**
  String laserPresetSubtitle(Object diam, Object div, Object p);

  /// No description provided for @laserProjectorNameLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nom du projecteur'**
  String get laserProjectorNameLabel;

  /// No description provided for @laserRenameProjectorTitle.
  ///
  /// In fr, this message translates to:
  /// **'Renommer le projecteur'**
  String get laserRenameProjectorTitle;

  /// No description provided for @laserSafetyResultsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Résultats de sécurité'**
  String get laserSafetyResultsTitle;

  /// No description provided for @laserSaveCurrentProjector.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer ce projecteur'**
  String get laserSaveCurrentProjector;

  /// No description provided for @laserSaveProjectorTitle.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer un projecteur'**
  String get laserSaveProjectorTitle;

  /// No description provided for @laserSavedProjectorsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Projecteurs enregistrés'**
  String get laserSavedProjectorsTitle;

  /// No description provided for @laserSearchHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: \"RGB 5W\"'**
  String get laserSearchHint;

  /// No description provided for @laserTargetDistanceHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 10'**
  String get laserTargetDistanceHint;

  /// No description provided for @laserTargetDistanceLabel.
  ///
  /// In fr, this message translates to:
  /// **'Distance cible (m)'**
  String get laserTargetDistanceLabel;

  /// No description provided for @laserZoneCzedDesc.
  ///
  /// In fr, this message translates to:
  /// **'Zone critique'**
  String get laserZoneCzedDesc;

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

  /// No description provided for @legalNotices.
  ///
  /// In fr, this message translates to:
  /// **'Mentions légales'**
  String get legalNotices;

  /// No description provided for @lightCatalogDescription.
  ///
  /// In fr, this message translates to:
  /// **'Sélection par constructeur, type et produit, avec informations et manuel.'**
  String get lightCatalogDescription;

  /// No description provided for @lightCatalogTitle.
  ///
  /// In fr, this message translates to:
  /// **'Catalogue lumière'**
  String get lightCatalogTitle;

  /// No description provided for @lightDisclaimerShort.
  ///
  /// In fr, this message translates to:
  /// **'Outils indicatifs. Vérifie toujours la documentation constructeur.'**
  String get lightDisclaimerShort;

  /// No description provided for @lightDmxSwitchDescription.
  ///
  /// In fr, this message translates to:
  /// **'Conversion indicative entre adresse DMX et interrupteurs, avec navigation par intervalle.'**
  String get lightDmxSwitchDescription;

  /// No description provided for @lightDmxSwitchTitle.
  ///
  /// In fr, this message translates to:
  /// **'Dip-switch DMX'**
  String get lightDmxSwitchTitle;

  /// No description provided for @lightPatchDescription.
  ///
  /// In fr, this message translates to:
  /// **'Importer et visualiser un fichier MVR.'**
  String get lightPatchDescription;

  /// No description provided for @lightPatchTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch DMX'**
  String get lightPatchTitle;

  /// No description provided for @lightPhotometryDescription.
  ///
  /// In fr, this message translates to:
  /// **'Conversions indicatives entre lux, candela et lumen, avec distance et angle.'**
  String get lightPhotometryDescription;

  /// No description provided for @lightPhotometryTitle.
  ///
  /// In fr, this message translates to:
  /// **'Photométrie'**
  String get lightPhotometryTitle;

  /// No description provided for @lightExposureMeterTitle.
  ///
  /// In fr, this message translates to:
  /// **'Posemètre (lux)'**
  String get lightExposureMeterTitle;

  /// No description provided for @lightExposureMeterDescription.
  ///
  /// In fr, this message translates to:
  /// **'Calcule l\'éclairement en lux à partir des réglages ISO / ouverture / vitesse d\'un appareil photo.'**
  String get lightExposureMeterDescription;

  /// No description provided for @lightExposureMeterIsoLabel.
  ///
  /// In fr, this message translates to:
  /// **'Sensibilité ISO'**
  String get lightExposureMeterIsoLabel;

  /// No description provided for @lightExposureMeterApertureLabel.
  ///
  /// In fr, this message translates to:
  /// **'Ouverture'**
  String get lightExposureMeterApertureLabel;

  /// No description provided for @lightExposureMeterShutterLabel.
  ///
  /// In fr, this message translates to:
  /// **'Vitesse d\'obturation'**
  String get lightExposureMeterShutterLabel;

  /// No description provided for @lightExposureMeterShutterDenomLabel.
  ///
  /// In fr, this message translates to:
  /// **'Vitesse (dénominateur, 1/x s)'**
  String get lightExposureMeterShutterDenomLabel;

  /// No description provided for @lightExposureMeterResultTitle.
  ///
  /// In fr, this message translates to:
  /// **'Éclairement estimé'**
  String get lightExposureMeterResultTitle;

  /// No description provided for @lightExposureMeterReferenceTitle.
  ///
  /// In fr, this message translates to:
  /// **'Repères d\'éclairement'**
  String get lightExposureMeterReferenceTitle;

  /// No description provided for @lightExposureMeterRefMoonlight.
  ///
  /// In fr, this message translates to:
  /// **'Clair de lune'**
  String get lightExposureMeterRefMoonlight;

  /// No description provided for @lightExposureMeterRefDimStage.
  ///
  /// In fr, this message translates to:
  /// **'Scène faiblement éclairée'**
  String get lightExposureMeterRefDimStage;

  /// No description provided for @lightExposureMeterRefOffice.
  ///
  /// In fr, this message translates to:
  /// **'Bureau'**
  String get lightExposureMeterRefOffice;

  /// No description provided for @lightExposureMeterRefOvercast.
  ///
  /// In fr, this message translates to:
  /// **'Jour couvert (extérieur)'**
  String get lightExposureMeterRefOvercast;

  /// No description provided for @lightExposureMeterRefFollowSpot.
  ///
  /// In fr, this message translates to:
  /// **'Poursuite / découpe sur scène'**
  String get lightExposureMeterRefFollowSpot;

  /// No description provided for @lightExposureMeterRefSunlight.
  ///
  /// In fr, this message translates to:
  /// **'Plein soleil'**
  String get lightExposureMeterRefSunlight;

  /// No description provided for @lightExposureMeterFormulaNote.
  ///
  /// In fr, this message translates to:
  /// **'Lux = (N² × 250 × 1/t) / ISO — méthode du posemètre à lumière incidente. Valeurs à lire sur l\'appareil photo (mode manuel ou infos EXIF).'**
  String get lightExposureMeterFormulaNote;

  /// No description provided for @lightProjectionDescription.
  ///
  /// In fr, this message translates to:
  /// **'Calcul indicatif de la taille de tache selon l’angle, la distance et le diamètre.'**
  String get lightProjectionDescription;

  /// No description provided for @lightProjectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Taille de projection'**
  String get lightProjectionTitle;

  /// No description provided for @menuTitle.
  ///
  /// In fr, this message translates to:
  /// **'Menu'**
  String get menuTitle;

  /// No description provided for @homeGreetingMorning.
  ///
  /// In fr, this message translates to:
  /// **'Bonjour'**
  String get homeGreetingMorning;

  /// No description provided for @homeGreetingAfternoon.
  ///
  /// In fr, this message translates to:
  /// **'Bon après-midi'**
  String get homeGreetingAfternoon;

  /// No description provided for @homeGreetingEvening.
  ///
  /// In fr, this message translates to:
  /// **'Bonsoir'**
  String get homeGreetingEvening;

  /// No description provided for @homeGreetingTagline.
  ///
  /// In fr, this message translates to:
  /// **'Tous tes outils de régie, prêts à l\'emploi.'**
  String get homeGreetingTagline;

  /// No description provided for @mireBlendLabel.
  ///
  /// In fr, this message translates to:
  /// **'BLEND'**
  String get mireBlendLabel;

  /// No description provided for @mireDash.
  ///
  /// In fr, this message translates to:
  /// **'—'**
  String get mireDash;

  /// No description provided for @mireErrInvalidOverlap.
  ///
  /// In fr, this message translates to:
  /// **'❌ Overlap invalide (0 à 99.9).'**
  String get mireErrInvalidOverlap;

  /// No description provided for @mireErrInvalidProjectors.
  ///
  /// In fr, this message translates to:
  /// **'❌ Nombre de projecteurs invalide (N > 0).'**
  String get mireErrInvalidProjectors;

  /// No description provided for @mireErrInvalidWHpx.
  ///
  /// In fr, this message translates to:
  /// **'❌ Largeur/hauteur invalides (px).'**
  String get mireErrInvalidWHpx;

  /// No description provided for @mireExportPng.
  ///
  /// In fr, this message translates to:
  /// **'Exporter PNG'**
  String get mireExportPng;

  /// No description provided for @mireHeightPxHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1080'**
  String get mireHeightPxHint;

  /// No description provided for @mireHeightPxHintMapping.
  ///
  /// In fr, this message translates to:
  /// **'ex: 2160'**
  String get mireHeightPxHintMapping;

  /// No description provided for @mireHeightPxLabel.
  ///
  /// In fr, this message translates to:
  /// **'Hauteur (px)'**
  String get mireHeightPxLabel;

  /// No description provided for @mireLedErrTileCm.
  ///
  /// In fr, this message translates to:
  /// **'❌ Renseigne Tile cm (largeur/hauteur >0).'**
  String get mireLedErrTileCm;

  /// No description provided for @mireLedErrTilePx.
  ///
  /// In fr, this message translates to:
  /// **'❌ Renseigne Tile px (largeur/hauteur >0).'**
  String get mireLedErrTilePx;

  /// No description provided for @mireLedErrTilesXY.
  ///
  /// In fr, this message translates to:
  /// **'❌ Renseigne Tiles X/Y (>0).'**
  String get mireLedErrTilesXY;

  /// No description provided for @mireLedParamsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres mur LED'**
  String get mireLedParamsTitle;

  /// No description provided for @mireLedPitchComputed.
  ///
  /// In fr, this message translates to:
  /// **'Pitch calculé: {pitch}'**
  String mireLedPitchComputed(Object pitch);

  /// No description provided for @mireLedSubtitleColorBars.
  ///
  /// In fr, this message translates to:
  /// **'Barres + rampes + cercles'**
  String get mireLedSubtitleColorBars;

  /// No description provided for @mireLedSubtitleGridLabels.
  ///
  /// In fr, this message translates to:
  /// **'Grille + repères + cercles'**
  String get mireLedSubtitleGridLabels;

  /// No description provided for @mireLedSubtitlePixelPerfect.
  ///
  /// In fr, this message translates to:
  /// **'Pixel perfect + cercles'**
  String get mireLedSubtitlePixelPerfect;

  /// No description provided for @mireLedSubtitleUniformity.
  ///
  /// In fr, this message translates to:
  /// **'Uniformité + cercles'**
  String get mireLedSubtitleUniformity;

  /// No description provided for @mireLedTileHcmLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tile hauteur (cm)'**
  String get mireLedTileHcmLabel;

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

  /// No description provided for @mireLedTileWpxLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tile largeur (px)'**
  String get mireLedTileWpxLabel;

  /// No description provided for @mireLedTilesIdTitle.
  ///
  /// In fr, this message translates to:
  /// **'LED / ID TILES'**
  String get mireLedTilesIdTitle;

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

  /// No description provided for @mireLedTitle.
  ///
  /// In fr, this message translates to:
  /// **'LED / MIRE'**
  String get mireLedTitle;

  /// No description provided for @mireLedTypeColorBars.
  ///
  /// In fr, this message translates to:
  /// **'Barres + rampes + cercles'**
  String get mireLedTypeColorBars;

  /// No description provided for @mireLedTypeGridLabels.
  ///
  /// In fr, this message translates to:
  /// **'Grille + repères + cercles'**
  String get mireLedTypeGridLabels;

  /// No description provided for @mireLedTypePixelPerfect.
  ///
  /// In fr, this message translates to:
  /// **'Pixel perfect + cercles'**
  String get mireLedTypePixelPerfect;

  /// No description provided for @mireLedTypeTilesId.
  ///
  /// In fr, this message translates to:
  /// **'Tiles ID (numéro + couleurs)'**
  String get mireLedTypeTilesId;

  /// No description provided for @mireLedTypeUniformity.
  ///
  /// In fr, this message translates to:
  /// **'Uniformité + cercles'**
  String get mireLedTypeUniformity;

  /// No description provided for @mireLedWallResolution.
  ///
  /// In fr, this message translates to:
  /// **'Résolution mur: {w} × {h} px'**
  String mireLedWallResolution(Object h, Object w);

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

  /// No description provided for @mireMappingSectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mire mapping multi-projecteur'**
  String get mireMappingSectionTitle;

  /// No description provided for @mireMappingSubtitlePattern.
  ///
  /// In fr, this message translates to:
  /// **'N={n} • Overlap {percent}% • {orient}'**
  String mireMappingSubtitlePattern(Object n, Object orient, Object percent);

  /// No description provided for @mireMappingTypeBlendRamps.
  ///
  /// In fr, this message translates to:
  /// **'Blend ramps'**
  String get mireMappingTypeBlendRamps;

  /// No description provided for @mireMappingTypeCombo.
  ///
  /// In fr, this message translates to:
  /// **'Combo (zones + overlap + blend)'**
  String get mireMappingTypeCombo;

  /// No description provided for @mireMappingTypeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Type mapping'**
  String get mireMappingTypeLabel;

  /// No description provided for @mireMappingTypeZonesOverlap.
  ///
  /// In fr, this message translates to:
  /// **'Zones + overlap'**
  String get mireMappingTypeZonesOverlap;

  /// No description provided for @mireOrientationHorizontal.
  ///
  /// In fr, this message translates to:
  /// **'Horizontal'**
  String get mireOrientationHorizontal;

  /// No description provided for @mireOrientationLabel.
  ///
  /// In fr, this message translates to:
  /// **'Orientation'**
  String get mireOrientationLabel;

  /// No description provided for @mireOrientationVertical.
  ///
  /// In fr, this message translates to:
  /// **'Vertical'**
  String get mireOrientationVertical;

  /// No description provided for @mireOverlapHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 10.0'**
  String get mireOverlapHint;

  /// No description provided for @mireOverlapLabel.
  ///
  /// In fr, this message translates to:
  /// **'Overlap (%)'**
  String get mireOverlapLabel;

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

  /// No description provided for @mireProjectorLabelPattern.
  ///
  /// In fr, this message translates to:
  /// **'PROJO {index}'**
  String mireProjectorLabelPattern(Object index);

  /// No description provided for @mireProjectorsNHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 2'**
  String get mireProjectorsNHint;

  /// No description provided for @mireProjectorsNLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nombre de projecteurs (N)'**
  String get mireProjectorsNLabel;

  /// No description provided for @mireSimpleSectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mire écran simple'**
  String get mireSimpleSectionTitle;

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

  /// No description provided for @mireSimpleSubtitleComboAll.
  ///
  /// In fr, this message translates to:
  /// **'Grille + safe + 2 barres centrées + cercles'**
  String get mireSimpleSubtitleComboAll;

  /// No description provided for @mireSimpleSubtitleGridSafe.
  ///
  /// In fr, this message translates to:
  /// **'Grille + safe + cercles'**
  String get mireSimpleSubtitleGridSafe;

  /// No description provided for @mireSimpleSubtitleUniformity.
  ///
  /// In fr, this message translates to:
  /// **'Uniformité + cercles'**
  String get mireSimpleSubtitleUniformity;

  /// No description provided for @mireSimpleTypeCheckerboard.
  ///
  /// In fr, this message translates to:
  /// **'Damier + cercles'**
  String get mireSimpleTypeCheckerboard;

  /// No description provided for @mireSimpleTypeColorBars.
  ///
  /// In fr, this message translates to:
  /// **'Barres + rampes + cercles'**
  String get mireSimpleTypeColorBars;

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

  /// No description provided for @mireSimpleTypeUniformity.
  ///
  /// In fr, this message translates to:
  /// **'Uniformité + cercles'**
  String get mireSimpleTypeUniformity;

  /// No description provided for @mireTileMissingPx.
  ///
  /// In fr, this message translates to:
  /// **'Renseigne Tile (px) pour numérotation.'**
  String get mireTileMissingPx;

  /// No description provided for @mireTilesSubtitleBase.
  ///
  /// In fr, this message translates to:
  /// **'Tile {tw}x{th} px • Grille {nx} x {ny}'**
  String mireTilesSubtitleBase(Object nx, Object ny, Object th, Object tw);

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

  /// No description provided for @mireTilesSubtitleTilePhys.
  ///
  /// In fr, this message translates to:
  /// **'Tile {wcm}×{hcm} cm'**
  String mireTilesSubtitleTilePhys(Object hcm, Object wcm);

  /// No description provided for @mireTilesSubtitleWallPhys.
  ///
  /// In fr, this message translates to:
  /// **'Mur ~ {wm}×{hm} m'**
  String mireTilesSubtitleWallPhys(Object hm, Object wm);

  /// No description provided for @mireTypeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Type de mire'**
  String get mireTypeLabel;

  /// No description provided for @mireVideoComboTitle.
  ///
  /// In fr, this message translates to:
  /// **'VIDÉO / MIRE COMBO'**
  String get mireVideoComboTitle;

  /// No description provided for @mireVideoMappingSectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mire mapping multi-projecteur'**
  String get mireVideoMappingSectionTitle;

  /// No description provided for @mireVideoMappingTitle.
  ///
  /// In fr, this message translates to:
  /// **'VIDÉO / MIRE MAPPING'**
  String get mireVideoMappingTitle;

  /// No description provided for @mireVideoSimpleSectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mire écran simple'**
  String get mireVideoSimpleSectionTitle;

  /// No description provided for @mireVideoSimpleTitle.
  ///
  /// In fr, this message translates to:
  /// **'VIDÉO / MIRE SIMPLE'**
  String get mireVideoSimpleTitle;

  /// No description provided for @mireVideoTypeCheckerboard.
  ///
  /// In fr, this message translates to:
  /// **'Damier + cercles'**
  String get mireVideoTypeCheckerboard;

  /// No description provided for @mireVideoTypeColorBars.
  ///
  /// In fr, this message translates to:
  /// **'Barres + rampes + cercles'**
  String get mireVideoTypeColorBars;

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

  /// No description provided for @mireVideoTypeUniformity.
  ///
  /// In fr, this message translates to:
  /// **'Uniformité + cercles'**
  String get mireVideoTypeUniformity;

  /// No description provided for @mireWallNotMultipleOfTiles.
  ///
  /// In fr, this message translates to:
  /// **'MUR NON MULTIPLE DE TILES'**
  String get mireWallNotMultipleOfTiles;

  /// No description provided for @mireWidthPxHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1920'**
  String get mireWidthPxHint;

  /// No description provided for @mireWidthPxHintMapping.
  ///
  /// In fr, this message translates to:
  /// **'ex: 3840'**
  String get mireWidthPxHintMapping;

  /// No description provided for @mireWidthPxLabel.
  ///
  /// In fr, this message translates to:
  /// **'Largeur (px)'**
  String get mireWidthPxLabel;

  /// No description provided for @patchAddressLabel.
  ///
  /// In fr, this message translates to:
  /// **'Adresse : {address}'**
  String patchAddressLabel(Object address);

  /// No description provided for @patchChannelsUsed.
  ///
  /// In fr, this message translates to:
  /// **'Canaux utilisés : {count} / 512'**
  String patchChannelsUsed(Object count);

  /// No description provided for @patchConflictError.
  ///
  /// In fr, this message translates to:
  /// **'Conflit d’adresses (chevauchement).'**
  String get patchConflictError;

  /// No description provided for @patchConflictShort.
  ///
  /// In fr, this message translates to:
  /// **'Conflit'**
  String get patchConflictShort;

  /// No description provided for @patchConflicts.
  ///
  /// In fr, this message translates to:
  /// **'Conflits : {count}'**
  String patchConflicts(Object count);

  /// No description provided for @patchEditChannelsLabel.
  ///
  /// In fr, this message translates to:
  /// **'Canaux'**
  String get patchEditChannelsLabel;

  /// No description provided for @patchEditHint.
  ///
  /// In fr, this message translates to:
  /// **'Vérifie le mode et le nombre de canaux.'**
  String get patchEditHint;

  /// No description provided for @patchEditModeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Mode'**
  String get patchEditModeLabel;

  /// No description provided for @patchEditTitle.
  ///
  /// In fr, this message translates to:
  /// **'Édition'**
  String get patchEditTitle;

  /// No description provided for @patchEmptyUniverse.
  ///
  /// In fr, this message translates to:
  /// **'Aucune machine dans cet univers.'**
  String get patchEmptyUniverse;

  /// No description provided for @patchFixturesCount.
  ///
  /// In fr, this message translates to:
  /// **'Machines : {count}'**
  String patchFixturesCount(Object count);

  /// No description provided for @patchHomeDisclaimer.
  ///
  /// In fr, this message translates to:
  /// **'Les résultats sont indicatifs. Vérifie toujours avec la console.'**
  String get patchHomeDisclaimer;

  /// No description provided for @patchHomeImportMvrDescription.
  ///
  /// In fr, this message translates to:
  /// **'Analyser un fichier MVR et charger le patch en référence.'**
  String get patchHomeImportMvrDescription;

  /// No description provided for @patchHomeImportMvrTitle.
  ///
  /// In fr, this message translates to:
  /// **'Importer un MVR'**
  String get patchHomeImportMvrTitle;

  /// No description provided for @patchHomeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch DMX'**
  String get patchHomeTitle;

  /// No description provided for @patchHomeViewPatchDescription.
  ///
  /// In fr, this message translates to:
  /// **'Liste et conflits par univers.'**
  String get patchHomeViewPatchDescription;

  /// No description provided for @patchHomeViewPatchTitle.
  ///
  /// In fr, this message translates to:
  /// **'Voir le patch'**
  String get patchHomeViewPatchTitle;

  /// No description provided for @patchHubOpenGridButton.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrir grille'**
  String get patchHubOpenGridButton;

  /// No description provided for @patchHubOpenMvrButton.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrir MVR'**
  String get patchHubOpenMvrButton;

  /// No description provided for @patchHubStateEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucune référence chargée.'**
  String get patchHubStateEmpty;

  /// No description provided for @patchHubStateLoaded.
  ///
  /// In fr, this message translates to:
  /// **'Chargé : {count} univers'**
  String patchHubStateLoaded(Object count);

  /// No description provided for @patchHubStateTitle.
  ///
  /// In fr, this message translates to:
  /// **'État'**
  String get patchHubStateTitle;

  /// No description provided for @patchHubTitle.
  ///
  /// In fr, this message translates to:
  /// **'Hub Patch'**
  String get patchHubTitle;

  /// No description provided for @patchHubWorksiteBody.
  ///
  /// In fr, this message translates to:
  /// **'Importer un MVR ou consulter la grille d’occupation.'**
  String get patchHubWorksiteBody;

  /// No description provided for @patchHubWorksiteTitle.
  ///
  /// In fr, this message translates to:
  /// **'Chantier'**
  String get patchHubWorksiteTitle;

  /// No description provided for @patchInvalidChannelCount.
  ///
  /// In fr, this message translates to:
  /// **'Nombre de canaux invalide.'**
  String get patchInvalidChannelCount;

  /// No description provided for @patchIssueInvalidChannelCount.
  ///
  /// In fr, this message translates to:
  /// **'Le nombre de canaux doit être supérieur ou égal à 1.'**
  String get patchIssueInvalidChannelCount;

  /// No description provided for @patchIssueInvalidStartAddress.
  ///
  /// In fr, this message translates to:
  /// **'L’adresse DMX doit être comprise entre 1 et 512.'**
  String get patchIssueInvalidStartAddress;

  /// No description provided for @patchIssueInvalidUniverse.
  ///
  /// In fr, this message translates to:
  /// **'L’univers doit être supérieur ou égal à 1.'**
  String get patchIssueInvalidUniverse;

  /// No description provided for @patchIssueRangeExceedsUniverse.
  ///
  /// In fr, this message translates to:
  /// **'La plage de canaux dépasse 512 dans cet univers.'**
  String get patchIssueRangeExceedsUniverse;

  /// No description provided for @patchIssueUnknown.
  ///
  /// In fr, this message translates to:
  /// **'Erreur inconnue.'**
  String get patchIssueUnknown;

  /// No description provided for @patchListTitle.
  ///
  /// In fr, this message translates to:
  /// **'Liste'**
  String get patchListTitle;

  /// No description provided for @patchManualDisabledBody.
  ///
  /// In fr, this message translates to:
  /// **'Le patch est en lecture seule lorsqu’une référence MVR est chargée.'**
  String get patchManualDisabledBody;

  /// No description provided for @patchManualDisabledTitle.
  ///
  /// In fr, this message translates to:
  /// **'Désactivé'**
  String get patchManualDisabledTitle;

  /// No description provided for @patchManualTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch manuel'**
  String get patchManualTitle;

  /// No description provided for @patchModeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Mode : {mode}'**
  String patchModeLabel(Object mode);

  /// No description provided for @patchMvrButtonAnalyzing.
  ///
  /// In fr, this message translates to:
  /// **'Analyse…'**
  String get patchMvrButtonAnalyzing;

  /// No description provided for @patchMvrButtonLoadAsReference.
  ///
  /// In fr, this message translates to:
  /// **'Charger comme référence'**
  String get patchMvrButtonLoadAsReference;

  /// No description provided for @patchMvrButtonPickFile.
  ///
  /// In fr, this message translates to:
  /// **'Choisir un fichier'**
  String get patchMvrButtonPickFile;

  /// No description provided for @patchMvrClearTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Effacer'**
  String get patchMvrClearTooltip;

  /// No description provided for @patchMvrColAddress.
  ///
  /// In fr, this message translates to:
  /// **'Adresse'**
  String get patchMvrColAddress;

  /// No description provided for @patchMvrColChannels.
  ///
  /// In fr, this message translates to:
  /// **'Canaux'**
  String get patchMvrColChannels;

  /// No description provided for @patchMvrColId.
  ///
  /// In fr, this message translates to:
  /// **'ID'**
  String get patchMvrColId;

  /// No description provided for @patchMvrColName.
  ///
  /// In fr, this message translates to:
  /// **'Nom'**
  String get patchMvrColName;

  /// No description provided for @patchMvrColUniverse.
  ///
  /// In fr, this message translates to:
  /// **'Univers'**
  String get patchMvrColUniverse;

  /// No description provided for @patchMvrColumnsHint.
  ///
  /// In fr, this message translates to:
  /// **'Colonnes : ID, Nom, Univers, Adresse, Canaux'**
  String get patchMvrColumnsHint;

  /// No description provided for @patchMvrFileCardHelp.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionne un fichier .mvr (ZIP) pour analyser le patch.'**
  String get patchMvrFileCardHelp;

  /// No description provided for @patchMvrFileCardTitle.
  ///
  /// In fr, this message translates to:
  /// **'Fichier'**
  String get patchMvrFileCardTitle;

  /// No description provided for @patchMvrFilterAllUniverses.
  ///
  /// In fr, this message translates to:
  /// **'Tous les univers'**
  String get patchMvrFilterAllUniverses;

  /// No description provided for @patchMvrFilterUniverseLabel.
  ///
  /// In fr, this message translates to:
  /// **'Filtrer par univers'**
  String get patchMvrFilterUniverseLabel;

  /// No description provided for @patchMvrModeNotProvided.
  ///
  /// In fr, this message translates to:
  /// **'Mode non renseigné'**
  String get patchMvrModeNotProvided;

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

  /// No description provided for @patchMvrOrderLabel.
  ///
  /// In fr, this message translates to:
  /// **'Ordre'**
  String get patchMvrOrderLabel;

  /// No description provided for @patchMvrSortAddress.
  ///
  /// In fr, this message translates to:
  /// **'Adresse'**
  String get patchMvrSortAddress;

  /// No description provided for @patchMvrSortByLabel.
  ///
  /// In fr, this message translates to:
  /// **'Trier par'**
  String get patchMvrSortByLabel;

  /// No description provided for @patchMvrSortChannels.
  ///
  /// In fr, this message translates to:
  /// **'Canaux'**
  String get patchMvrSortChannels;

  /// No description provided for @patchMvrSortId.
  ///
  /// In fr, this message translates to:
  /// **'ID'**
  String get patchMvrSortId;

  /// No description provided for @patchMvrSortName.
  ///
  /// In fr, this message translates to:
  /// **'Nom'**
  String get patchMvrSortName;

  /// No description provided for @patchMvrSortUniverse.
  ///
  /// In fr, this message translates to:
  /// **'Univers'**
  String get patchMvrSortUniverse;

  /// No description provided for @patchMvrSortUniverseThenAddress.
  ///
  /// In fr, this message translates to:
  /// **'Univers puis adresse'**
  String get patchMvrSortUniverseThenAddress;

  /// No description provided for @patchMvrStatusCleared.
  ///
  /// In fr, this message translates to:
  /// **'Référence effacée.'**
  String get patchMvrStatusCleared;

  /// No description provided for @patchMvrStatusEmptyBytes.
  ///
  /// In fr, this message translates to:
  /// **'Fichier vide.'**
  String get patchMvrStatusEmptyBytes;

  /// No description provided for @patchMvrStatusExtractingZip.
  ///
  /// In fr, this message translates to:
  /// **'Extraction du ZIP…'**
  String get patchMvrStatusExtractingZip;

  /// No description provided for @patchMvrStatusFilePickFailed.
  ///
  /// In fr, this message translates to:
  /// **'Sélection de fichier impossible : {reason}'**
  String patchMvrStatusFilePickFailed(Object reason);

  ///
  ///
  /// In fr, this message translates to:
  /// **'Machines trouvées : {count} (multi-canaux : {resolved}).'**
  String patchMvrStatusFixturesFound(int count, int resolved);

  /// No description provided for @patchMvrStatusLoadingGdtf.
  ///
  /// In fr, this message translates to:
  /// **'Chargement des GDTF…'**
  String get patchMvrStatusLoadingGdtf;

  /// No description provided for @patchMvrStatusNoContentToLoad.
  ///
  /// In fr, this message translates to:
  /// **'Aucun contenu à charger.'**
  String get patchMvrStatusNoContentToLoad;

  /// No description provided for @patchMvrStatusNoFileSelected.
  ///
  /// In fr, this message translates to:
  /// **'Aucun fichier sélectionné.'**
  String get patchMvrStatusNoFileSelected;

  /// No description provided for @patchMvrStatusNoUsableFixtures.
  ///
  /// In fr, this message translates to:
  /// **'Aucune machine exploitable trouvée.'**
  String get patchMvrStatusNoUsableFixtures;

  /// No description provided for @patchMvrStatusParseError.
  ///
  /// In fr, this message translates to:
  /// **'Erreur de parsing : {message}'**
  String patchMvrStatusParseError(Object message);

  /// No description provided for @patchMvrStatusParsingContent.
  ///
  /// In fr, this message translates to:
  /// **'Analyse du contenu…'**
  String get patchMvrStatusParsingContent;

  ///
  ///
  /// In fr, this message translates to:
  /// **'Référence chargée : {count} machine(s) (ignorées : {skipped}, empreintes GDTF : {footprints}).'**
  String patchMvrStatusReferenceLoaded(int count, int skipped, int footprints);

  /// No description provided for @patchMvrStatusRestored.
  ///
  /// In fr, this message translates to:
  /// **'Restauration : {count} machines'**
  String patchMvrStatusRestored(Object count);

  /// No description provided for @patchMvrStatusSceneXmlNotFound.
  ///
  /// In fr, this message translates to:
  /// **'scene.xml introuvable dans le MVR.'**
  String get patchMvrStatusSceneXmlNotFound;

  /// No description provided for @patchMvrStatusSelectingFile.
  ///
  /// In fr, this message translates to:
  /// **'Sélection du fichier…'**
  String get patchMvrStatusSelectingFile;

  /// No description provided for @patchMvrStatusUnsupportedFile.
  ///
  /// In fr, this message translates to:
  /// **'Fichier non supporté : {ext}'**
  String patchMvrStatusUnsupportedFile(Object ext);

  /// No description provided for @patchMvrSummaryTitle.
  ///
  /// In fr, this message translates to:
  /// **'Résumé'**
  String get patchMvrSummaryTitle;

  /// No description provided for @patchMvrTitle.
  ///
  /// In fr, this message translates to:
  /// **'Import MVR'**
  String get patchMvrTitle;

  /// No description provided for @patchMvrUniverseItem.
  ///
  /// In fr, this message translates to:
  /// **'Univers {universe}'**
  String patchMvrUniverseItem(Object universe);

  /// No description provided for @patchPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch'**
  String get patchPageTitle;

  /// No description provided for @patchSummaryTitle.
  ///
  /// In fr, this message translates to:
  /// **'Résumé'**
  String get patchSummaryTitle;

  /// No description provided for @patchUniverseAppBarTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch'**
  String get patchUniverseAppBarTitle;

  /// No description provided for @patchUniverseConflictCount.
  ///
  /// In fr, this message translates to:
  /// **'Conflits : {count} canal(aux)'**
  String patchUniverseConflictCount(Object count);

  /// No description provided for @patchUniverseGridLimitedByWidth.
  ///
  /// In fr, this message translates to:
  /// **'Limité par la largeur de l’écran.'**
  String get patchUniverseGridLimitedByWidth;

  /// No description provided for @patchUniverseGridTitle.
  ///
  /// In fr, this message translates to:
  /// **'Occupation (1 à 512)'**
  String get patchUniverseGridTitle;

  /// No description provided for @patchUniverseItem.
  ///
  /// In fr, this message translates to:
  /// **'Univers {universe}'**
  String patchUniverseItem(Object universe);

  /// No description provided for @patchUniverseLabel.
  ///
  /// In fr, this message translates to:
  /// **'Univers'**
  String get patchUniverseLabel;

  /// No description provided for @patchUniverseLegendConflict.
  ///
  /// In fr, this message translates to:
  /// **'Conflit'**
  String get patchUniverseLegendConflict;

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

  /// No description provided for @patchUniverseOccupantLine.
  ///
  /// In fr, this message translates to:
  /// **'• {fixture}\n  {mode} — {channels} canal(aux)\n  {start} → {end}'**
  String patchUniverseOccupantLine(
      Object channels, Object end, Object fixture, Object mode, Object start);

  /// No description provided for @patchUniverseOccupiedCount.
  ///
  /// In fr, this message translates to:
  /// **'Occupés : {count} / 512'**
  String patchUniverseOccupiedCount(Object count);

  /// No description provided for @patchUniversePopupHeader.
  ///
  /// In fr, this message translates to:
  /// **'Univers {universe} — Adresse {address}\nÉtat : {state}'**
  String patchUniversePopupHeader(
      Object address, Object state, Object universe);

  /// No description provided for @patchUniversePopupManyOccupants.
  ///
  /// In fr, this message translates to:
  /// **'Plusieurs machines occupent ce canal.'**
  String get patchUniversePopupManyOccupants;

  /// No description provided for @patchUniversePopupMore.
  ///
  /// In fr, this message translates to:
  /// **'… et {count} autre(s).'**
  String patchUniversePopupMore(Object count);

  /// No description provided for @patchUniversePopupTitleConflict.
  ///
  /// In fr, this message translates to:
  /// **'Conflit'**
  String get patchUniversePopupTitleConflict;

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

  /// No description provided for @patchUniverseReferenceNone.
  ///
  /// In fr, this message translates to:
  /// **'Aucune référence chargée'**
  String get patchUniverseReferenceNone;

  /// No description provided for @patchUniverseReferenceReadOnly.
  ///
  /// In fr, this message translates to:
  /// **'Lecture seule (depuis MVR)'**
  String get patchUniverseReferenceReadOnly;

  /// No description provided for @patchUniverseReferenceTitle.
  ///
  /// In fr, this message translates to:
  /// **'Référence'**
  String get patchUniverseReferenceTitle;

  /// No description provided for @patchUniverseResetConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser'**
  String get patchUniverseResetConfirm;

  /// No description provided for @patchUniverseResetContent.
  ///
  /// In fr, this message translates to:
  /// **'Cela efface le patch chargé depuis le MVR dans l’application.\nAucune donnée du fichier n’est modifiée.'**
  String get patchUniverseResetContent;

  /// No description provided for @patchUniverseResetTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser la référence ?'**
  String get patchUniverseResetTitle;

  /// No description provided for @patchUniverseResetTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser la référence'**
  String get patchUniverseResetTooltip;

  /// No description provided for @patchUniverseSelected.
  ///
  /// In fr, this message translates to:
  /// **'Univers sélectionné'**
  String get patchUniverseSelected;

  /// No description provided for @patchUniverseStateConflict.
  ///
  /// In fr, this message translates to:
  /// **'Conflit'**
  String get patchUniverseStateConflict;

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

  /// No description provided for @patchUniverseTapHint.
  ///
  /// In fr, this message translates to:
  /// **'Touche une case pour afficher le détail.'**
  String get patchUniverseTapHint;

  /// No description provided for @patchUniverseUniverseDropdownLabel.
  ///
  /// In fr, this message translates to:
  /// **'Univers DMX'**
  String get patchUniverseUniverseDropdownLabel;

  /// No description provided for @patchUniverseUniverseItem.
  ///
  /// In fr, this message translates to:
  /// **'Univers {universe}'**
  String patchUniverseUniverseItem(Object universe);

  /// No description provided for @patchUniverseUniverseTitle.
  ///
  /// In fr, this message translates to:
  /// **'Univers'**
  String get patchUniverseUniverseTitle;

  /// No description provided for @patchUniverseZoomIn.
  ///
  /// In fr, this message translates to:
  /// **'Agrandir'**
  String get patchUniverseZoomIn;

  /// No description provided for @patchUniverseZoomOut.
  ///
  /// In fr, this message translates to:
  /// **'Réduire'**
  String get patchUniverseZoomOut;

  /// No description provided for @patchUniverseZoomTitle.
  ///
  /// In fr, this message translates to:
  /// **'Zoom'**
  String get patchUniverseZoomTitle;

  /// No description provided for @photometryBeamAngleHint2.
  ///
  /// In fr, this message translates to:
  /// **'En degrés'**
  String get photometryBeamAngleHint2;

  /// No description provided for @photometryBeamAngleHint3.
  ///
  /// In fr, this message translates to:
  /// **'En degrés'**
  String get photometryBeamAngleHint3;

  /// No description provided for @photometryBeamAngleLabel.
  ///
  /// In fr, this message translates to:
  /// **'Angle de faisceau'**
  String get photometryBeamAngleLabel;

  /// No description provided for @photometryCandelaHint1.
  ///
  /// In fr, this message translates to:
  /// **'Entrez une valeur en cd'**
  String get photometryCandelaHint1;

  /// No description provided for @photometryCandelaHint2.
  ///
  /// In fr, this message translates to:
  /// **'Entrez une valeur en cd'**
  String get photometryCandelaHint2;

  /// No description provided for @photometryCandelaLabel.
  ///
  /// In fr, this message translates to:
  /// **'Candela'**
  String get photometryCandelaLabel;

  /// No description provided for @photometryDisclaimerShort.
  ///
  /// In fr, this message translates to:
  /// **'Indication uniquement. Vérifie avec la documentation constructeur.'**
  String get photometryDisclaimerShort;

  /// No description provided for @photometryDistanceHint1.
  ///
  /// In fr, this message translates to:
  /// **'En mètres'**
  String get photometryDistanceHint1;

  /// No description provided for @photometryDistanceHint3.
  ///
  /// In fr, this message translates to:
  /// **'En mètres'**
  String get photometryDistanceHint3;

  /// No description provided for @photometryDistanceLabel.
  ///
  /// In fr, this message translates to:
  /// **'Distance'**
  String get photometryDistanceLabel;

  /// No description provided for @photometryLumensHint2.
  ///
  /// In fr, this message translates to:
  /// **'Entrez une valeur en lm'**
  String get photometryLumensHint2;

  /// No description provided for @photometryLumensHint3.
  ///
  /// In fr, this message translates to:
  /// **'Entrez une valeur en lm'**
  String get photometryLumensHint3;

  /// No description provided for @photometryLumensLabel.
  ///
  /// In fr, this message translates to:
  /// **'Lumens'**
  String get photometryLumensLabel;

  /// No description provided for @photometryLuxHint.
  ///
  /// In fr, this message translates to:
  /// **'Entrez une valeur en lux'**
  String get photometryLuxHint;

  /// No description provided for @photometryLuxLabel.
  ///
  /// In fr, this message translates to:
  /// **'Lux'**
  String get photometryLuxLabel;

  /// No description provided for @photometrySection1Title.
  ///
  /// In fr, this message translates to:
  /// **'Lux <> Candela'**
  String get photometrySection1Title;

  /// No description provided for @photometrySection2Title.
  ///
  /// In fr, this message translates to:
  /// **'Lumens <> Candela'**
  String get photometrySection2Title;

  /// No description provided for @photometrySection3Title.
  ///
  /// In fr, this message translates to:
  /// **'Lumens < Lux'**
  String get photometrySection3Title;

  /// No description provided for @photometrySummary1.
  ///
  /// In fr, this message translates to:
  /// **'À {distance} m, {candela} cd ≈ {lux} lux.'**
  String photometrySummary1(Object candela, Object distance, Object lux);

  /// No description provided for @photometrySummary2.
  ///
  /// In fr, this message translates to:
  /// **'À {distance} m, {lumens} lm ≈ {lux} lux (approx.).'**
  String photometrySummary2(Object distance, Object lumens, Object lux);

  ///
  ///
  /// In fr, this message translates to:
  /// **'Lumens : {lumens} lm — Distance : {distance} m — Angle : {angle}° — Lux : {lux} lx.'**
  String photometrySummary3(
      String lumens, String distance, String angle, String lux);

  /// No description provided for @projectionAngleHint.
  ///
  /// In fr, this message translates to:
  /// **'En degrés'**
  String get projectionAngleHint;

  /// No description provided for @projectionAngleLabel.
  ///
  /// In fr, this message translates to:
  /// **'Angle'**
  String get projectionAngleLabel;

  /// No description provided for @projectionAutoHelp.
  ///
  /// In fr, this message translates to:
  /// **'Auto : calcule la valeur manquante.'**
  String get projectionAutoHelp;

  /// No description provided for @projectionConeAngle.
  ///
  /// In fr, this message translates to:
  /// **'Angle : {angle}°'**
  String projectionConeAngle(Object angle);

  /// No description provided for @projectionConeDiameter.
  ///
  /// In fr, this message translates to:
  /// **'Diamètre : {diameter} m'**
  String projectionConeDiameter(Object diameter);

  /// No description provided for @projectionConeDistance.
  ///
  /// In fr, this message translates to:
  /// **'Distance : {distance} m'**
  String projectionConeDistance(Object distance);

  /// No description provided for @projectionDetailAngle.
  ///
  /// In fr, this message translates to:
  /// **'Angle : {angle}°'**
  String projectionDetailAngle(Object angle);

  /// No description provided for @projectionDetailDiameter.
  ///
  /// In fr, this message translates to:
  /// **'Diamètre : {diameter} m'**
  String projectionDetailDiameter(Object diameter);

  /// No description provided for @projectionDetailDistance.
  ///
  /// In fr, this message translates to:
  /// **'Distance : {distance} m'**
  String projectionDetailDistance(Object distance);

  /// No description provided for @projectionDiameterHint.
  ///
  /// In fr, this message translates to:
  /// **'En mètres'**
  String get projectionDiameterHint;

  /// No description provided for @projectionDiameterLabel.
  ///
  /// In fr, this message translates to:
  /// **'Diamètre'**
  String get projectionDiameterLabel;

  /// No description provided for @projectionDistanceHint.
  ///
  /// In fr, this message translates to:
  /// **'En mètres'**
  String get projectionDistanceHint;

  /// No description provided for @projectionDistanceLabel.
  ///
  /// In fr, this message translates to:
  /// **'Distance'**
  String get projectionDistanceLabel;

  /// No description provided for @projectionHeaderAutoActive.
  ///
  /// In fr, this message translates to:
  /// **'Auto actif'**
  String get projectionHeaderAutoActive;

  /// No description provided for @projectionHeaderNeedTwoValues.
  ///
  /// In fr, this message translates to:
  /// **'Renseigne au moins deux valeurs.'**
  String get projectionHeaderNeedTwoValues;

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

  /// No description provided for @resetConsents.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser consentements'**
  String get resetConsents;

  /// No description provided for @settings.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres'**
  String get settings;

  /// No description provided for @videoBrightnessResult.
  ///
  /// In fr, this message translates to:
  /// **'Format: {format}\nSurface: {area} m²\nLux (lm/m²): {lux}\nLux eq (gain): {luxEq}\nLuminance: {nits} nits | {fl} ft-L\nSeuil mini ({presetLabel}): {minFl} ft-L → {status}\nNote: estimation indicative (Lambert).'**
  String videoBrightnessResult(
      Object area,
      Object fl,
      Object format,
      Object lux,
      Object luxEq,
      Object minFl,
      Object nits,
      Object presetLabel,
      Object status);

  /// No description provided for @videoBrightnessSectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Lux / nits / ft-L + seuil'**
  String get videoBrightnessSectionTitle;

  /// No description provided for @videoBrightnessSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Lux / nits / ft-L + seuil'**
  String get videoBrightnessSubtitle;

  /// No description provided for @videoBrightnessTitle.
  ///
  /// In fr, this message translates to:
  /// **'Luminosité'**
  String get videoBrightnessTitle;

  /// No description provided for @videoCalc1ErrMissing.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes: Distance + Largeur.'**
  String get videoCalc1ErrMissing;

  /// No description provided for @videoCalc1Ok.
  ///
  /// In fr, this message translates to:
  /// **'✅ Ratio de projection = {ratio}'**
  String videoCalc1Ok(Object ratio);

  /// No description provided for @videoCalc1Title.
  ///
  /// In fr, this message translates to:
  /// **'Ratio (Distance / Largeur)'**
  String get videoCalc1Title;

  /// No description provided for @videoCalc2ErrMissing.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes: Distance + Ratio.'**
  String get videoCalc2ErrMissing;

  /// No description provided for @videoCalc2Ok.
  ///
  /// In fr, this message translates to:
  /// **'✅ Largeur image = {width} m'**
  String videoCalc2Ok(Object width);

  /// No description provided for @videoCalc2Title.
  ///
  /// In fr, this message translates to:
  /// **'Largeur (Distance / Ratio)'**
  String get videoCalc2Title;

  /// No description provided for @videoCalc3ErrMissingWidth.
  ///
  /// In fr, this message translates to:
  /// **'❌ Donnée manquante: Largeur.'**
  String get videoCalc3ErrMissingWidth;

  /// No description provided for @videoCalc3Ok.
  ///
  /// In fr, this message translates to:
  /// **'✅ Hauteur = {height} m (format {format})'**
  String videoCalc3Ok(Object format, Object height);

  /// No description provided for @videoCalc3Title.
  ///
  /// In fr, this message translates to:
  /// **'Hauteur (Largeur + Format)'**
  String get videoCalc3Title;

  /// No description provided for @videoCalc4ErrGt0.
  ///
  /// In fr, this message translates to:
  /// **'❌ Lumens/Gain/Largeur doivent être > 0.'**
  String get videoCalc4ErrGt0;

  /// No description provided for @videoCalc4ErrMissing.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes: Lumens + Gain + Largeur.'**
  String get videoCalc4ErrMissing;

  /// No description provided for @videoCalc4ErrMissingSimple.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes : Largeur + Lumens + Gain.'**
  String get videoCalc4ErrMissingSimple;

  /// No description provided for @videoCalc4Result.
  ///
  /// In fr, this message translates to:
  /// **'Surface: {area} m² (format {format})\nLux (lm/m²): {lux}\nLux eq (gain): {luxEq}\nLuminance: {nits} nits | {fl} ft-L\nSeuil mini ({presetLabel}): {minFl} ft-L → {status}\nNote: conversion nits/ft-L basée sur une hypothèse Lambertienne (approx).'**
  String videoCalc4Result(
      Object area,
      Object fl,
      Object format,
      Object lux,
      Object luxEq,
      Object minFl,
      Object nits,
      Object presetLabel,
      Object status);

  /// No description provided for @videoCalc4Title.
  ///
  /// In fr, this message translates to:
  /// **'Luminosité (lux / nits / ft-L + seuil)'**
  String get videoCalc4Title;

  /// No description provided for @videoCalc5ErrMissing.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes: Largeur totale + Overlap% + Nombre de projecteurs.'**
  String get videoCalc5ErrMissing;

  /// No description provided for @videoCalc5ErrNMin2.
  ///
  /// In fr, this message translates to:
  /// **'❌ Le nombre de projecteurs doit être ≥ 2.'**
  String get videoCalc5ErrNMin2;

  /// No description provided for @videoCalc5NHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 2'**
  String get videoCalc5NHint;

  /// No description provided for @videoCalc5NLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nombre de projecteurs (N)'**
  String get videoCalc5NLabel;

  /// No description provided for @videoCalc5Result.
  ///
  /// In fr, this message translates to:
  /// **'Largeur totale: {wTot} m\nN: {n} | Overlap: {overlapPct}% (sur largeur projo)\n\n- Largeur par projecteur: {wPer} m\n- Overlap entre 2 projos: {overlapM} m\n- Hauteur totale (format {format}): {hTot} m'**
  String videoCalc5Result(Object format, Object hTot, Object n, Object overlapM,
      Object overlapPct, Object wPer, Object wTot);

  /// No description provided for @videoCalc5Title.
  ///
  /// In fr, this message translates to:
  /// **'Overlap (Largeur totale + N)'**
  String get videoCalc5Title;

  /// No description provided for @videoCalc6ErrMissingBasics.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes: Largeur totale + Distance + Overlap%.'**
  String get videoCalc6ErrMissingBasics;

  /// No description provided for @videoCalc6ErrMissingRatio.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes: Ratio min et/ou Ratio max.'**
  String get videoCalc6ErrMissingRatio;

  /// No description provided for @videoCalc6GainHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1.0'**
  String get videoCalc6GainHint;

  /// No description provided for @videoCalc6GainLabel.
  ///
  /// In fr, this message translates to:
  /// **'Gain (calc 6)'**
  String get videoCalc6GainLabel;

  /// No description provided for @videoCalc6LumensPerProjectorHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 20000'**
  String get videoCalc6LumensPerProjectorHint;

  /// No description provided for @videoCalc6LumensPerProjectorLabel.
  ///
  /// In fr, this message translates to:
  /// **'Lumens par projecteur'**
  String get videoCalc6LumensPerProjectorLabel;

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
      Object area, Object fl, Object lux, Object n, Object nits);

  /// No description provided for @videoCalc6LumiOptional.
  ///
  /// In fr, this message translates to:
  /// **'Luminosité (optionnelle): renseigne Lumens/projo + Gain pour l\'estimation.'**
  String get videoCalc6LumiOptional;

  /// No description provided for @videoCalc6NoteIndicative.
  ///
  /// In fr, this message translates to:
  /// **'Note: estimation indicative (blend/overlap réels peuvent réduire un peu).'**
  String get videoCalc6NoteIndicative;

  /// No description provided for @videoCalc6RatioMaxHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1.80'**
  String get videoCalc6RatioMaxHint;

  /// No description provided for @videoCalc6RatioMaxLabel.
  ///
  /// In fr, this message translates to:
  /// **'Ratio max'**
  String get videoCalc6RatioMaxLabel;

  /// No description provided for @videoCalc6RatioMinHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1.20'**
  String get videoCalc6RatioMinHint;

  /// No description provided for @videoCalc6RatioMinLabel.
  ///
  /// In fr, this message translates to:
  /// **'Ratio min'**
  String get videoCalc6RatioMinLabel;

  /// No description provided for @videoCalc6Result.
  ///
  /// In fr, this message translates to:
  /// **'Largeur totale={wTot} m | Distance={distance} m | Overlap={overlapPct}%\nFormat {format} → Hauteur totale={hTot} m | Surface={area} m²\nRatio min/max: {ratioMin} → {ratioMax}\n\nCas ratio plus ouvert (min) = {nMin} projos | couverture ≈ {covMin} m\n{lumiMin}\n\nCas ratio plus serré (max) = {nMax} projos | couverture ≈ {covMax} m\n{lumiMax}\n\n{note}'**
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
      Object wTot);

  /// No description provided for @videoCalc6Title.
  ///
  /// In fr, this message translates to:
  /// **'Nb projecteurs auto + luminosité'**
  String get videoCalc6Title;

  /// No description provided for @videoCalcLabel.
  ///
  /// In fr, this message translates to:
  /// **'Calcul {n}'**
  String videoCalcLabel(Object n);

  /// No description provided for @videoCalculateAll.
  ///
  /// In fr, this message translates to:
  /// **'Calculer tout'**
  String get videoCalculateAll;

  /// No description provided for @videoCalculationsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Calculs vidéo'**
  String get videoCalculationsTitle;

  /// No description provided for @videoCommonParamsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres communs'**
  String get videoCommonParamsTitle;

  /// No description provided for @videoCommonPillArea.
  ///
  /// In fr, this message translates to:
  /// **'Surface: {value}'**
  String videoCommonPillArea(Object value);

  /// No description provided for @videoCommonPillDistance.
  ///
  /// In fr, this message translates to:
  /// **'Distance: {value}'**
  String videoCommonPillDistance(Object value);

  /// No description provided for @videoCommonPillFormat.
  ///
  /// In fr, this message translates to:
  /// **'Format: {format}'**
  String videoCommonPillFormat(Object format);

  /// No description provided for @videoCommonPillHeight.
  ///
  /// In fr, this message translates to:
  /// **'Hauteur: {value}'**
  String videoCommonPillHeight(Object value);

  /// No description provided for @videoCommonPillOverlap.
  ///
  /// In fr, this message translates to:
  /// **'Overlap: {value}'**
  String videoCommonPillOverlap(Object value);

  /// No description provided for @videoCommonPillRatio.
  ///
  /// In fr, this message translates to:
  /// **'Ratio: {value}'**
  String videoCommonPillRatio(Object value);

  /// No description provided for @videoCommonPillTotalWidth.
  ///
  /// In fr, this message translates to:
  /// **'Largeur totale: {value}'**
  String videoCommonPillTotalWidth(Object value);

  /// No description provided for @videoCommonPillWidth.
  ///
  /// In fr, this message translates to:
  /// **'Largeur: {value}'**
  String videoCommonPillWidth(Object value);

  /// No description provided for @videoCopyAllTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Copier tous les résultats'**
  String get videoCopyAllTooltip;

  /// No description provided for @videoCopySummaryTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Copier le résumé'**
  String get videoCopySummaryTooltip;

  /// No description provided for @videoDisclaimerShort.
  ///
  /// In fr, this message translates to:
  /// **'Calculs indicatifs. Vérifie toujours la documentation constructeur.'**
  String get videoDisclaimerShort;

  /// No description provided for @videoDistanceHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 12.0'**
  String get videoDistanceHint;

  /// No description provided for @videoDistanceLabel.
  ///
  /// In fr, this message translates to:
  /// **'Distance de projection (m)'**
  String get videoDistanceLabel;

  /// No description provided for @videoErrImpossibleDenom.
  ///
  /// In fr, this message translates to:
  /// **'❌ Paramètres impossibles (denom ≤ 0).'**
  String get videoErrImpossibleDenom;

  /// No description provided for @videoErrOverlapRange.
  ///
  /// In fr, this message translates to:
  /// **'❌ Overlap% doit être entre 0 et 99.9.'**
  String get videoErrOverlapRange;

  /// No description provided for @videoErrRatioGt0.
  ///
  /// In fr, this message translates to:
  /// **'❌ Le ratio doit être > 0.'**
  String get videoErrRatioGt0;

  /// No description provided for @videoErrTotalWidthAndDistanceGt0.
  ///
  /// In fr, this message translates to:
  /// **'❌ Largeur totale et distance doivent être > 0.'**
  String get videoErrTotalWidthAndDistanceGt0;

  /// No description provided for @videoErrTotalWidthGt0.
  ///
  /// In fr, this message translates to:
  /// **'❌ Largeur totale doit être > 0.'**
  String get videoErrTotalWidthGt0;

  /// No description provided for @videoErrWidthGt0.
  ///
  /// In fr, this message translates to:
  /// **'❌ La largeur doit être > 0.'**
  String get videoErrWidthGt0;

  /// No description provided for @videoExportPdfTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Exporter PDF'**
  String get videoExportPdfTooltip;

  /// No description provided for @videoFormatLabel.
  ///
  /// In fr, this message translates to:
  /// **'Format (ratio)'**
  String get videoFormatLabel;

  /// No description provided for @videoGainHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1.0'**
  String get videoGainHint;

  /// No description provided for @videoGainLabel.
  ///
  /// In fr, this message translates to:
  /// **'Gain'**
  String get videoGainLabel;

  /// No description provided for @videoImageWidthHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 6.0'**
  String get videoImageWidthHint;

  /// No description provided for @videoImageWidthLabel.
  ///
  /// In fr, this message translates to:
  /// **'Largeur d\'image (m)'**
  String get videoImageWidthLabel;

  /// No description provided for @videoLedCalcTitle.
  ///
  /// In fr, this message translates to:
  /// **'Calcul — Pixels / tiles'**
  String get videoLedCalcTitle;

  /// No description provided for @videoLedErrAllGt0.
  ///
  /// In fr, this message translates to:
  /// **'❌ Toutes les valeurs doivent être > 0.'**
  String get videoLedErrAllGt0;

  /// No description provided for @videoLedErrMissingInputs.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes : Tiles X/Y + Tile px + Tile cm.'**
  String get videoLedErrMissingInputs;

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
      Object pitch,
      Object tileHcm,
      Object tileHpx,
      Object tileWcm,
      Object tileWpx,
      Object wallHm,
      Object wallHpx,
      Object wallWm,
      Object wallWpx);

  /// No description provided for @videoLedSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Pixels du mur LED selon taille, pitch, dimension des tiles.'**
  String get videoLedSubtitle;

  /// No description provided for @videoLedTileHcmHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 33.28'**
  String get videoLedTileHcmHint;

  /// No description provided for @videoLedTileHcmLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tile hauteur (cm)'**
  String get videoLedTileHcmLabel;

  /// No description provided for @videoLedTileHpxHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 128'**
  String get videoLedTileHpxHint;

  /// No description provided for @videoLedTileHpxLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tile hauteur (px)'**
  String get videoLedTileHpxLabel;

  /// No description provided for @videoLedTileWcmHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 33.28'**
  String get videoLedTileWcmHint;

  /// No description provided for @videoLedTileWcmLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tile largeur (cm)'**
  String get videoLedTileWcmLabel;

  /// No description provided for @videoLedTileWpxHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 128'**
  String get videoLedTileWpxHint;

  /// No description provided for @videoLedTileWpxLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tile largeur (px)'**
  String get videoLedTileWpxLabel;

  /// No description provided for @videoLedTilesXHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 15'**
  String get videoLedTilesXHint;

  /// No description provided for @videoLedTilesXLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tiles horizontales (X)'**
  String get videoLedTilesXLabel;

  /// No description provided for @videoLedTilesYHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 8'**
  String get videoLedTilesYHint;

  /// No description provided for @videoLedTilesYLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tiles verticales (Y)'**
  String get videoLedTilesYLabel;

  /// No description provided for @videoLedTitle.
  ///
  /// In fr, this message translates to:
  /// **'LED'**
  String get videoLedTitle;

  /// No description provided for @videoLensMeasureSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Ratio / largeur / hauteur (calculs 1 à 3).'**
  String get videoLensMeasureSubtitle;

  /// No description provided for @videoLensMeasureTitle.
  ///
  /// In fr, this message translates to:
  /// **'Lentille & mesure'**
  String get videoLensMeasureTitle;

  /// No description provided for @videoLmCalc1Title.
  ///
  /// In fr, this message translates to:
  /// **'Ratio (Distance / Largeur)'**
  String get videoLmCalc1Title;

  /// No description provided for @videoLmCalc2Title.
  ///
  /// In fr, this message translates to:
  /// **'Largeur (Distance / Ratio)'**
  String get videoLmCalc2Title;

  /// No description provided for @videoLmCalc3Title.
  ///
  /// In fr, this message translates to:
  /// **'Hauteur (Largeur + Format)'**
  String get videoLmCalc3Title;

  /// No description provided for @videoLmDistanceHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 12.0'**
  String get videoLmDistanceHint;

  /// No description provided for @videoLmDistanceLabel.
  ///
  /// In fr, this message translates to:
  /// **'Distance de projection (m)'**
  String get videoLmDistanceLabel;

  /// No description provided for @videoLmErrMissingDistanceRatio.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes : Distance + Ratio.'**
  String get videoLmErrMissingDistanceRatio;

  /// No description provided for @videoLmErrMissingDistanceWidth.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes : Distance + Largeur.'**
  String get videoLmErrMissingDistanceWidth;

  /// No description provided for @videoLmErrMissingWidthOnly.
  ///
  /// In fr, this message translates to:
  /// **'❌ Donnée manquante : Largeur.'**
  String get videoLmErrMissingWidthOnly;

  /// No description provided for @videoLmErrRatioGt0.
  ///
  /// In fr, this message translates to:
  /// **'❌ Ratio doit être > 0.'**
  String get videoLmErrRatioGt0;

  /// No description provided for @videoLmErrWidthGt0.
  ///
  /// In fr, this message translates to:
  /// **'❌ Largeur doit être > 0.'**
  String get videoLmErrWidthGt0;

  /// No description provided for @videoLmFormatLabel.
  ///
  /// In fr, this message translates to:
  /// **'Format (ratio)'**
  String get videoLmFormatLabel;

  /// No description provided for @videoLmImageWidthHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 6.0'**
  String get videoLmImageWidthHint;

  /// No description provided for @videoLmImageWidthLabel.
  ///
  /// In fr, this message translates to:
  /// **'Largeur d\'image (m)'**
  String get videoLmImageWidthLabel;

  /// No description provided for @videoLmResultHeight.
  ///
  /// In fr, this message translates to:
  /// **'✅ Hauteur = {height} m (format {format})'**
  String videoLmResultHeight(Object format, Object height);

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

  /// No description provided for @videoLmThrowRatioHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1.60'**
  String get videoLmThrowRatioHint;

  /// No description provided for @videoLmThrowRatioLabel.
  ///
  /// In fr, this message translates to:
  /// **'Ratio de projection'**
  String get videoLmThrowRatioLabel;

  /// No description provided for @videoLumensHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 20000'**
  String get videoLumensHint;

  /// No description provided for @videoLumensLabel.
  ///
  /// In fr, this message translates to:
  /// **'Lumens (ANSI)'**
  String get videoLumensLabel;

  /// No description provided for @videoMireHeaderSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Mires indicatives (calage, focus, géométrie, blend, pixel perfect).'**
  String get videoMireHeaderSubtitle;

  /// No description provided for @videoMireHeaderTitle.
  ///
  /// In fr, this message translates to:
  /// **'Générateur de mires'**
  String get videoMireHeaderTitle;

  /// No description provided for @videoMireScreenLedSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Mire selon WxH px (pixel perfect, uniformité, grille).'**
  String get videoMireScreenLedSubtitle;

  /// No description provided for @videoMireScreenLedTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mire écran LED'**
  String get videoMireScreenLedTitle;

  /// No description provided for @videoMireScreenVideoSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Simple (WxH px) + Mapping multi-projos (N + overlap).'**
  String get videoMireScreenVideoSubtitle;

  /// No description provided for @videoMireScreenVideoTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mire écran vidéo'**
  String get videoMireScreenVideoTitle;

  /// No description provided for @videoMireTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mire'**
  String get videoMireTitle;

  /// No description provided for @videoMpCalc5Title.
  ///
  /// In fr, this message translates to:
  /// **'Largeur par projecteur'**
  String get videoMpCalc5Title;

  /// No description provided for @videoMpCalc6Title.
  ///
  /// In fr, this message translates to:
  /// **'Nombre de projecteurs (ratio min/max)'**
  String get videoMpCalc6Title;

  /// No description provided for @videoMpCaseOpenMin.
  ///
  /// In fr, this message translates to:
  /// **'Cas ratio plus ouvert (min) = {n} projos | couverture ≈ {coverage} m'**
  String videoMpCaseOpenMin(Object coverage, Object n);

  /// No description provided for @videoMpCaseTightMax.
  ///
  /// In fr, this message translates to:
  /// **'Cas ratio plus serré (max) = {n} projos | couverture ≈ {coverage} m'**
  String videoMpCaseTightMax(Object coverage, Object n);

  /// No description provided for @videoMpDistanceHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 12.0'**
  String get videoMpDistanceHint;

  /// No description provided for @videoMpDistanceLabel.
  ///
  /// In fr, this message translates to:
  /// **'Distance de projection (m)'**
  String get videoMpDistanceLabel;

  /// No description provided for @videoMpErrImpossibleDenom.
  ///
  /// In fr, this message translates to:
  /// **'❌ Paramètres impossibles (denom ≤ 0).'**
  String get videoMpErrImpossibleDenom;

  /// No description provided for @videoMpErrInvalidRatio.
  ///
  /// In fr, this message translates to:
  /// **'❌ Ratio invalide (doit être > 0).'**
  String get videoMpErrInvalidRatio;

  /// No description provided for @videoMpErrMissing5.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes : Largeur totale + Overlap% + N.'**
  String get videoMpErrMissing5;

  /// No description provided for @videoMpErrMissing6Main.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes : Largeur totale + Distance + Overlap%.'**
  String get videoMpErrMissing6Main;

  /// No description provided for @videoMpErrMissingRatios.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes : Ratio min et/ou Ratio max.'**
  String get videoMpErrMissingRatios;

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

  /// No description provided for @videoMpErrWidthDistanceGt0.
  ///
  /// In fr, this message translates to:
  /// **'❌ Largeur totale et distance doivent être > 0.'**
  String get videoMpErrWidthDistanceGt0;

  /// No description provided for @videoMpErrWidthGt0.
  ///
  /// In fr, this message translates to:
  /// **'❌ Largeur totale doit être > 0.'**
  String get videoMpErrWidthGt0;

  /// No description provided for @videoMpFormatLabel.
  ///
  /// In fr, this message translates to:
  /// **'Format (ratio)'**
  String get videoMpFormatLabel;

  /// No description provided for @videoMpGainHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1.0'**
  String get videoMpGainHint;

  /// No description provided for @videoMpGainLabel.
  ///
  /// In fr, this message translates to:
  /// **'Gain'**
  String get videoMpGainLabel;

  /// No description provided for @videoMpLumensPerProjectorHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 20000'**
  String get videoMpLumensPerProjectorHint;

  /// No description provided for @videoMpLumensPerProjectorLabel.
  ///
  /// In fr, this message translates to:
  /// **'Lumens par projecteur'**
  String get videoMpLumensPerProjectorLabel;

  /// No description provided for @videoMpLumiErrLumensGainGt0.
  ///
  /// In fr, this message translates to:
  /// **'Luminosité: ❌ Lumens/projo et gain doivent être > 0.'**
  String get videoMpLumiErrLumensGainGt0;

  /// No description provided for @videoMpLumiEstimated.
  ///
  /// In fr, this message translates to:
  /// **'Luminosité estimée (N={n})\nSurface: {area} m²\nLux eq: {lux}\nNits: {nits} | ft-L: {fl}'**
  String videoMpLumiEstimated(
      Object area, Object fl, Object lux, Object n, Object nits);

  /// No description provided for @videoMpLumiOptionalHint.
  ///
  /// In fr, this message translates to:
  /// **'Luminosité (optionnelle) : renseigne Lumens/projo + Gain pour estimer.'**
  String get videoMpLumiOptionalHint;

  /// No description provided for @videoMpNoteIndicative.
  ///
  /// In fr, this message translates to:
  /// **'Note: estimation indicative.'**
  String get videoMpNoteIndicative;

  /// No description provided for @videoMpOptionalLuminanceTitle.
  ///
  /// In fr, this message translates to:
  /// **'Optionnel : luminosité'**
  String get videoMpOptionalLuminanceTitle;

  /// No description provided for @videoMpOverlapHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 10'**
  String get videoMpOverlapHint;

  /// No description provided for @videoMpOverlapLabel.
  ///
  /// In fr, this message translates to:
  /// **'Overlap (%)'**
  String get videoMpOverlapLabel;

  /// No description provided for @videoMpProjectorCountHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 2'**
  String get videoMpProjectorCountHint;

  /// No description provided for @videoMpProjectorCountLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nombre de projecteurs (N)'**
  String get videoMpProjectorCountLabel;

  /// No description provided for @videoMpRatioMaxHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1.80'**
  String get videoMpRatioMaxHint;

  /// No description provided for @videoMpRatioMaxLabel.
  ///
  /// In fr, this message translates to:
  /// **'Ratio max'**
  String get videoMpRatioMaxLabel;

  /// No description provided for @videoMpRatioMinHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1.20'**
  String get videoMpRatioMinHint;

  /// No description provided for @videoMpRatioMinLabel.
  ///
  /// In fr, this message translates to:
  /// **'Ratio min'**
  String get videoMpRatioMinLabel;

  /// No description provided for @videoMpTotalWidthHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 18.0'**
  String get videoMpTotalWidthHint;

  /// No description provided for @videoMpTotalWidthLabel.
  ///
  /// In fr, this message translates to:
  /// **'Largeur totale de projection (m)'**
  String get videoMpTotalWidthLabel;

  /// No description provided for @videoMultiprojectorSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Overlap + largeur/projo + nombre de projos (calculs 5 & 6).'**
  String get videoMultiprojectorSubtitle;

  /// No description provided for @videoMultiprojectorTitle.
  ///
  /// In fr, this message translates to:
  /// **'Multiprojecteur'**
  String get videoMultiprojectorTitle;

  /// No description provided for @videoOptionalBrightnessTitle.
  ///
  /// In fr, this message translates to:
  /// **'Optionnel : luminosité'**
  String get videoOptionalBrightnessTitle;

  /// No description provided for @videoOverlapHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 10'**
  String get videoOverlapHint;

  /// No description provided for @videoOverlapLabel.
  ///
  /// In fr, this message translates to:
  /// **'Overlap (%)'**
  String get videoOverlapLabel;

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

  /// No description provided for @videoPdfCalc5N.
  ///
  /// In fr, this message translates to:
  /// **'N (calc5)'**
  String get videoPdfCalc5N;

  /// No description provided for @videoPdfCalc6.
  ///
  /// In fr, this message translates to:
  /// **'Calcul 6'**
  String get videoPdfCalc6;

  /// No description provided for @videoPdfCalc6Gain.
  ///
  /// In fr, this message translates to:
  /// **'Gain (calc6)'**
  String get videoPdfCalc6Gain;

  /// No description provided for @videoPdfCalc6LumensPerProj.
  ///
  /// In fr, this message translates to:
  /// **'Lumens/projo (calc6)'**
  String get videoPdfCalc6LumensPerProj;

  /// No description provided for @videoPdfCalc6RatioMax.
  ///
  /// In fr, this message translates to:
  /// **'Ratio max (calc6)'**
  String get videoPdfCalc6RatioMax;

  /// No description provided for @videoPdfCalc6RatioMin.
  ///
  /// In fr, this message translates to:
  /// **'Ratio min (calc6)'**
  String get videoPdfCalc6RatioMin;

  /// No description provided for @videoPdfDate.
  ///
  /// In fr, this message translates to:
  /// **'Date'**
  String get videoPdfDate;

  /// No description provided for @videoPdfDistance.
  ///
  /// In fr, this message translates to:
  /// **'Distance (m)'**
  String get videoPdfDistance;

  /// No description provided for @videoPdfFormat.
  ///
  /// In fr, this message translates to:
  /// **'Format'**
  String get videoPdfFormat;

  /// No description provided for @videoPdfGain.
  ///
  /// In fr, this message translates to:
  /// **'Gain'**
  String get videoPdfGain;

  /// No description provided for @videoPdfImageWidth.
  ///
  /// In fr, this message translates to:
  /// **'Largeur image (m)'**
  String get videoPdfImageWidth;

  /// No description provided for @videoPdfLumens.
  ///
  /// In fr, this message translates to:
  /// **'Lumens'**
  String get videoPdfLumens;

  /// No description provided for @videoPdfOverlap.
  ///
  /// In fr, this message translates to:
  /// **'Overlap (%)'**
  String get videoPdfOverlap;

  /// No description provided for @videoPdfParams.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres'**
  String get videoPdfParams;

  /// No description provided for @videoPdfRatio.
  ///
  /// In fr, this message translates to:
  /// **'Ratio'**
  String get videoPdfRatio;

  /// No description provided for @videoPdfResults.
  ///
  /// In fr, this message translates to:
  /// **'Résultats'**
  String get videoPdfResults;

  /// No description provided for @videoPdfScreenPreset.
  ///
  /// In fr, this message translates to:
  /// **'Preset écran'**
  String get videoPdfScreenPreset;

  /// No description provided for @videoPdfTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mon App Technique – Export Vidéo'**
  String get videoPdfTitle;

  /// No description provided for @videoPdfTotalWidth.
  ///
  /// In fr, this message translates to:
  /// **'Largeur totale (m)'**
  String get videoPdfTotalWidth;

  /// No description provided for @videoPresetFrontGrey.
  ///
  /// In fr, this message translates to:
  /// **'Front - écran gris (gain 0.8)'**
  String get videoPresetFrontGrey;

  /// No description provided for @videoPresetFrontGreyShort.
  ///
  /// In fr, this message translates to:
  /// **'Front - écran gris'**
  String get videoPresetFrontGreyShort;

  /// No description provided for @videoPresetFrontHighGain.
  ///
  /// In fr, this message translates to:
  /// **'Front - écran high gain (gain 1.3)'**
  String get videoPresetFrontHighGain;

  /// No description provided for @videoPresetFrontHighGainShort.
  ///
  /// In fr, this message translates to:
  /// **'Front - écran high gain'**
  String get videoPresetFrontHighGainShort;

  /// No description provided for @videoPresetFrontWhite.
  ///
  /// In fr, this message translates to:
  /// **'Front - écran blanc mat (gain 1.0)'**
  String get videoPresetFrontWhite;

  /// No description provided for @videoPresetFrontWhiteShort.
  ///
  /// In fr, this message translates to:
  /// **'Front - écran blanc mat'**
  String get videoPresetFrontWhiteShort;

  /// No description provided for @videoPresetMappingDarkStone.
  ///
  /// In fr, this message translates to:
  /// **'Mapping - pierre sombre (gain 0.35)'**
  String get videoPresetMappingDarkStone;

  /// No description provided for @videoPresetMappingDarkStoneShort.
  ///
  /// In fr, this message translates to:
  /// **'Mapping - pierre sombre'**
  String get videoPresetMappingDarkStoneShort;

  /// No description provided for @videoPresetMappingGlass.
  ///
  /// In fr, this message translates to:
  /// **'Mapping - vitre (gain 0.15)'**
  String get videoPresetMappingGlass;

  /// No description provided for @videoPresetMappingGlassShort.
  ///
  /// In fr, this message translates to:
  /// **'Mapping - vitre'**
  String get videoPresetMappingGlassShort;

  /// No description provided for @videoPresetMappingLightStone.
  ///
  /// In fr, this message translates to:
  /// **'Mapping - pierre claire (gain 0.6)'**
  String get videoPresetMappingLightStone;

  /// No description provided for @videoPresetMappingLightStoneShort.
  ///
  /// In fr, this message translates to:
  /// **'Mapping - pierre claire'**
  String get videoPresetMappingLightStoneShort;

  /// No description provided for @videoPresetMappingMatte.
  ///
  /// In fr, this message translates to:
  /// **'Mapping - peinture mate (gain 0.75)'**
  String get videoPresetMappingMatte;

  /// No description provided for @videoPresetMappingMatteShort.
  ///
  /// In fr, this message translates to:
  /// **'Mapping - peinture mate'**
  String get videoPresetMappingMatteShort;

  /// No description provided for @videoPresetMappingSatin.
  ///
  /// In fr, this message translates to:
  /// **'Mapping - peinture satinée (gain 0.9)'**
  String get videoPresetMappingSatin;

  /// No description provided for @videoPresetMappingSatinShort.
  ///
  /// In fr, this message translates to:
  /// **'Mapping - peinture satinée'**
  String get videoPresetMappingSatinShort;

  /// No description provided for @videoPresetRearClear.
  ///
  /// In fr, this message translates to:
  /// **'Rétro - toile claire (gain 0.9)'**
  String get videoPresetRearClear;

  /// No description provided for @videoPresetRearClearShort.
  ///
  /// In fr, this message translates to:
  /// **'Rétro - toile claire'**
  String get videoPresetRearClearShort;

  /// No description provided for @videoPresetRearDiffusion.
  ///
  /// In fr, this message translates to:
  /// **'Rétro - toile diffusion (gain 0.7)'**
  String get videoPresetRearDiffusion;

  /// No description provided for @videoPresetRearDiffusionShort.
  ///
  /// In fr, this message translates to:
  /// **'Rétro - toile diffusion'**
  String get videoPresetRearDiffusionShort;

  /// No description provided for @videoScreenPresetLabel.
  ///
  /// In fr, this message translates to:
  /// **'Écran / Support (preset)'**
  String get videoScreenPresetLabel;

  /// No description provided for @videoSummaryPillsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Résumé (pastilles)'**
  String get videoSummaryPillsTitle;

  /// No description provided for @videoTestPatternSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Création de mire vidéo pour écran et mur LED (à faire après).'**
  String get videoTestPatternSubtitle;

  /// No description provided for @videoTestPatternTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mire'**
  String get videoTestPatternTitle;

  /// No description provided for @videoThrowRatioHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1.60'**
  String get videoThrowRatioHint;

  /// No description provided for @videoThrowRatioLabel.
  ///
  /// In fr, this message translates to:
  /// **'Ratio de projection'**
  String get videoThrowRatioLabel;

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

  /// No description provided for @videoTotalWidthHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 18.0'**
  String get videoTotalWidthHint;

  /// No description provided for @videoTotalWidthLabel.
  ///
  /// In fr, this message translates to:
  /// **'Largeur totale de projection (m)'**
  String get videoTotalWidthLabel;

  /// No description provided for @aboutArtnetTitle.
  ///
  /// In fr, this message translates to:
  /// **'Art-Net'**
  String get aboutArtnetTitle;

  /// No description provided for @aboutArtnetToc01.
  ///
  /// In fr, this message translates to:
  /// **'1) Art-Net — c’est quoi et pourquoi'**
  String get aboutArtnetToc01;

  /// No description provided for @aboutArtnetToc02.
  ///
  /// In fr, this message translates to:
  /// **'2) Adressage & univers — mapping propre'**
  String get aboutArtnetToc02;

  /// No description provided for @aboutArtnetToc03.
  ///
  /// In fr, this message translates to:
  /// **'3) Limites & perf — ce qui casse en premier'**
  String get aboutArtnetToc03;

  /// No description provided for @aboutArtnetToc04.
  ///
  /// In fr, this message translates to:
  /// **'4) Nodes, splitters & RDM'**
  String get aboutArtnetToc04;

  /// No description provided for @aboutArtnetToc05.
  ///
  /// In fr, this message translates to:
  /// **'5) Dépannage — symptômes → causes'**
  String get aboutArtnetToc05;

  /// No description provided for @aboutArtnetToc06.
  ///
  /// In fr, this message translates to:
  /// **'6) Schémas (réseau / unicast vs broadcast)'**
  String get aboutArtnetToc06;

  /// No description provided for @aboutArtnetToc07.
  ///
  /// In fr, this message translates to:
  /// **'6bis) Images (assets) — RJ45/switch/câbles'**
  String get aboutArtnetToc07;

  /// No description provided for @aboutArtnetToc08.
  ///
  /// In fr, this message translates to:
  /// **'7) Checklist rapide'**
  String get aboutArtnetToc08;

  /// No description provided for @aboutDmxToc01.
  ///
  /// In fr, this message translates to:
  /// **'1) DMX, univers, adresses — la base'**
  String get aboutDmxToc01;

  /// No description provided for @aboutDmxToc02.
  ///
  /// In fr, this message translates to:
  /// **'2) Trame DMX — break, start code, canaux'**
  String get aboutDmxToc02;

  /// No description provided for @aboutDmxToc03.
  ///
  /// In fr, this message translates to:
  /// **'3) Câblage RS-485 — topologie & câble'**
  String get aboutDmxToc03;

  /// No description provided for @aboutDmxToc04.
  ///
  /// In fr, this message translates to:
  /// **'4) Terminaison & splitters — éviter les réflexions'**
  String get aboutDmxToc04;

  /// No description provided for @aboutDmxToc05.
  ///
  /// In fr, this message translates to:
  /// **'4bis) RDM — limites & compatibilités'**
  String get aboutDmxToc05;

  /// No description provided for @aboutDmxToc06.
  ///
  /// In fr, this message translates to:
  /// **'5) Dépannage terrain — symptômes → causes'**
  String get aboutDmxToc06;

  /// No description provided for @aboutDmxToc07.
  ///
  /// In fr, this message translates to:
  /// **'6) Art-Net — repères terrain'**
  String get aboutDmxToc07;

  /// No description provided for @aboutDmxToc08.
  ///
  /// In fr, this message translates to:
  /// **'7) sACN / E1.31 — multicast, IGMP, priorités'**
  String get aboutDmxToc08;

  /// No description provided for @aboutDmxToc09.
  ///
  /// In fr, this message translates to:
  /// **'8) DMX vs Art-Net vs sACN — choisir'**
  String get aboutDmxToc09;

  /// No description provided for @aboutDmxToc10.
  ///
  /// In fr, this message translates to:
  /// **'10) Checklist rapide'**
  String get aboutDmxToc10;

  /// No description provided for @aboutDmxToc11.
  ///
  /// In fr, this message translates to:
  /// **'10) Checklist rapide'**
  String get aboutDmxToc11;

  /// No description provided for @aboutElectriciteTitle.
  ///
  /// In fr, this message translates to:
  /// **'Électricité'**
  String get aboutElectriciteTitle;

  /// No description provided for @aboutElectriciteToc01.
  ///
  /// In fr, this message translates to:
  /// **'1) Bases (W, A, V, kW)'**
  String get aboutElectriciteToc01;

  /// No description provided for @aboutElectriciteToc02.
  ///
  /// In fr, this message translates to:
  /// **'2) Connecteurs (Schuko / P17 / PowerCON)'**
  String get aboutElectriciteToc02;

  /// No description provided for @aboutElectriciteToc03.
  ///
  /// In fr, this message translates to:
  /// **'3) Mono / Tri (ce que ça change)'**
  String get aboutElectriciteToc03;

  /// No description provided for @aboutElectriciteToc04.
  ///
  /// In fr, this message translates to:
  /// **'4) Table rapide (16A → 400A)'**
  String get aboutElectriciteToc04;

  /// No description provided for @aboutElectriciteToc05.
  ///
  /// In fr, this message translates to:
  /// **'5) Sécurité & pièges terrain'**
  String get aboutElectriciteToc05;

  /// No description provided for @aboutElectriciteToc06.
  ///
  /// In fr, this message translates to:
  /// **'6) Checklist'**
  String get aboutElectriciteToc06;

  /// No description provided for @aboutInformatiqueTitle.
  ///
  /// In fr, this message translates to:
  /// **'Informatique'**
  String get aboutInformatiqueTitle;

  /// No description provided for @aboutInformatiqueToc01.
  ///
  /// In fr, this message translates to:
  /// **'1) USB / USB-C / Thunderbolt'**
  String get aboutInformatiqueToc01;

  /// No description provided for @aboutInformatiqueToc02.
  ///
  /// In fr, this message translates to:
  /// **'2) Stockage (SATA / NVMe / SSD)'**
  String get aboutInformatiqueToc02;

  /// No description provided for @aboutInformatiqueToc03.
  ///
  /// In fr, this message translates to:
  /// **'3) Liaisons vidéo (DP / HDMI)'**
  String get aboutInformatiqueToc03;

  /// No description provided for @aboutInformatiqueToc04.
  ///
  /// In fr, this message translates to:
  /// **'4) PCIe / GPU (repères)'**
  String get aboutInformatiqueToc04;

  /// No description provided for @aboutInformatiqueToc05.
  ///
  /// In fr, this message translates to:
  /// **'5) Checklist (plateau)'**
  String get aboutInformatiqueToc05;

  /// No description provided for @aboutIpBasicsToc01.
  ///
  /// In fr, this message translates to:
  /// **'1) C’est quoi une IP et à quoi ça sert ?'**
  String get aboutIpBasicsToc01;

  /// No description provided for @aboutIpBasicsToc02.
  ///
  /// In fr, this message translates to:
  /// **'2) Pourquoi 192.x / 10.x / 172.x ? (adresses privées)'**
  String get aboutIpBasicsToc02;

  /// No description provided for @aboutIpBasicsToc03.
  ///
  /// In fr, this message translates to:
  /// **'3) Masque & sous-réseaux : comprendre pour de vrai'**
  String get aboutIpBasicsToc03;

  /// No description provided for @aboutIpBasicsToc04.
  ///
  /// In fr, this message translates to:
  /// **'4) DHCP, passerelle, DNS : qui fait quoi ?'**
  String get aboutIpBasicsToc04;

  /// No description provided for @aboutIpBasicsToc05.
  ///
  /// In fr, this message translates to:
  /// **'5) Comment deux appareils se parlent (LAN vs hors LAN)'**
  String get aboutIpBasicsToc05;

  /// No description provided for @aboutIpBasicsToc06.
  ///
  /// In fr, this message translates to:
  /// **'6) Plans IP \"show\" simples (exemples prêts à copier)'**
  String get aboutIpBasicsToc06;

  /// No description provided for @aboutIpBasicsToc07.
  ///
  /// In fr, this message translates to:
  /// **'7) Dépannage : symptômes → causes (méthode terrain)'**
  String get aboutIpBasicsToc07;

  /// No description provided for @aboutIpBasicsToc08.
  ///
  /// In fr, this message translates to:
  /// **'8) Mini-exercices (vérifier vite un masque / un réseau)'**
  String get aboutIpBasicsToc08;

  /// No description provided for @aboutIpBasicsToc09.
  ///
  /// In fr, this message translates to:
  /// **'9) Checklist rapide'**
  String get aboutIpBasicsToc09;

  /// No description provided for @aboutNetworkTitle.
  ///
  /// In fr, this message translates to:
  /// **'Network (EN)'**
  String get aboutNetworkTitle;

  /// No description provided for @aboutNetworkToc01.
  ///
  /// In fr, this message translates to:
  /// **'1) Objectif: réseau stable'**
  String get aboutNetworkToc01;

  /// No description provided for @aboutNetworkToc02.
  ///
  /// In fr, this message translates to:
  /// **'2) Plan IP (simple)'**
  String get aboutNetworkToc02;

  /// No description provided for @aboutNetworkToc03.
  ///
  /// In fr, this message translates to:
  /// **'3) VLAN (séparation)'**
  String get aboutNetworkToc03;

  /// No description provided for @aboutNetworkToc04.
  ///
  /// In fr, this message translates to:
  /// **'4) IGMP (sACN multicast)'**
  String get aboutNetworkToc04;

  /// No description provided for @aboutNetworkToc05.
  ///
  /// In fr, this message translates to:
  /// **'5) Wi-Fi vs filaire'**
  String get aboutNetworkToc05;

  /// No description provided for @aboutNetworkToc06.
  ///
  /// In fr, this message translates to:
  /// **'6) Switch: ce qu’il faut'**
  String get aboutNetworkToc06;

  /// No description provided for @aboutNetworkToc07.
  ///
  /// In fr, this message translates to:
  /// **'7) Schémas'**
  String get aboutNetworkToc07;

  /// No description provided for @aboutNetworkToc08.
  ///
  /// In fr, this message translates to:
  /// **'7bis) Images (assets)'**
  String get aboutNetworkToc08;

  /// No description provided for @aboutNetworkToc09.
  ///
  /// In fr, this message translates to:
  /// **'8) Checklist'**
  String get aboutNetworkToc09;

  /// No description provided for @aboutReseauTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réseau'**
  String get aboutReseauTitle;

  /// No description provided for @aboutReseauToc01.
  ///
  /// In fr, this message translates to:
  /// **'1) Bases réseau (LAN / IP / débit)'**
  String get aboutReseauToc01;

  /// No description provided for @aboutReseauToc02.
  ///
  /// In fr, this message translates to:
  /// **'2) RJ45 & catégories (Cat5e/6/6A/…)'**
  String get aboutReseauToc02;

  /// No description provided for @aboutReseauToc03.
  ///
  /// In fr, this message translates to:
  /// **'3) PoE (alimentation réseau)'**
  String get aboutReseauToc03;

  /// No description provided for @aboutReseauToc04.
  ///
  /// In fr, this message translates to:
  /// **'4) Fibre (SM/MM) + connecteurs (LC/SC)'**
  String get aboutReseauToc04;

  /// No description provided for @aboutReseauToc05.
  ///
  /// In fr, this message translates to:
  /// **'5) SFP / SFP+ / QSFP (modules)'**
  String get aboutReseauToc05;

  /// No description provided for @aboutReseauToc06.
  ///
  /// In fr, this message translates to:
  /// **'6) Switches (VLAN / IGMP / QoS)'**
  String get aboutReseauToc06;

  /// No description provided for @aboutReseauToc07.
  ///
  /// In fr, this message translates to:
  /// **'7) Art-Net / sACN sur réseau (conseils)'**
  String get aboutReseauToc07;

  /// No description provided for @aboutReseauToc08.
  ///
  /// In fr, this message translates to:
  /// **'8) Checklist'**
  String get aboutReseauToc08;

  /// No description provided for @aboutSacnToc01.
  ///
  /// In fr, this message translates to:
  /// **'1) À quoi sert sACN ?'**
  String get aboutSacnToc01;

  /// No description provided for @aboutSacnToc02.
  ///
  /// In fr, this message translates to:
  /// **'2) Univers (numérotation)'**
  String get aboutSacnToc02;

  /// No description provided for @aboutSacnToc03.
  ///
  /// In fr, this message translates to:
  /// **'3) Multicast / Unicast + IGMP'**
  String get aboutSacnToc03;

  /// No description provided for @aboutSacnToc04.
  ///
  /// In fr, this message translates to:
  /// **'4) Priorités (multi-sources)'**
  String get aboutSacnToc04;

  /// No description provided for @aboutSacnToc05.
  ///
  /// In fr, this message translates to:
  /// **'5) Limites / perfs'**
  String get aboutSacnToc05;

  /// No description provided for @aboutSacnToc06.
  ///
  /// In fr, this message translates to:
  /// **'6) RDM & sACN (proxy / selon matériel)'**
  String get aboutSacnToc06;

  /// No description provided for @aboutSacnToc07.
  ///
  /// In fr, this message translates to:
  /// **'7) Schémas'**
  String get aboutSacnToc07;

  /// No description provided for @aboutSacnToc08.
  ///
  /// In fr, this message translates to:
  /// **'7bis) Images (assets)'**
  String get aboutSacnToc08;

  /// No description provided for @aboutSacnToc09.
  ///
  /// In fr, this message translates to:
  /// **'8) Checklist'**
  String get aboutSacnToc09;

  /// No description provided for @aboutVideoToc01.
  ///
  /// In fr, this message translates to:
  /// **'1) Bases vidéo (mots-clés)'**
  String get aboutVideoToc01;

  /// No description provided for @aboutVideoToc02.
  ///
  /// In fr, this message translates to:
  /// **'2) Résolution & FPS'**
  String get aboutVideoToc02;

  /// No description provided for @aboutVideoToc03.
  ///
  /// In fr, this message translates to:
  /// **'3) Couleur (4:4:4 / 4:2:2 / 10-bit)'**
  String get aboutVideoToc03;

  /// No description provided for @aboutVideoToc04.
  ///
  /// In fr, this message translates to:
  /// **'4) Sync (Genlock / Timecode)'**
  String get aboutVideoToc04;

  /// No description provided for @aboutVideoToc05.
  ///
  /// In fr, this message translates to:
  /// **'5) Câbles & distances'**
  String get aboutVideoToc05;

  /// No description provided for @aboutVideoToc06.
  ///
  /// In fr, this message translates to:
  /// **'6) SDI (3G / 6G / 12G)'**
  String get aboutVideoToc06;

  /// No description provided for @aboutVideoToc07.
  ///
  /// In fr, this message translates to:
  /// **'7) HDMI — terrain'**
  String get aboutVideoToc07;

  /// No description provided for @aboutVideoToc08.
  ///
  /// In fr, this message translates to:
  /// **'8) NDI — quand / pourquoi / limites'**
  String get aboutVideoToc08;

  /// No description provided for @aboutVideoToc09.
  ///
  /// In fr, this message translates to:
  /// **'9) Mapping / LED / multi-projo'**
  String get aboutVideoToc09;

  /// No description provided for @aboutVideoToc10.
  ///
  /// In fr, this message translates to:
  /// **'10) Checklist terrain'**
  String get aboutVideoToc10;

  /// No description provided for @aboutTileDmxTitle.
  ///
  /// In fr, this message translates to:
  /// **'DMX — fonctionnement (simple & complet)'**
  String get aboutTileDmxTitle;

  /// No description provided for @aboutTileArtnetTitle.
  ///
  /// In fr, this message translates to:
  /// **'Art-Net — DMX sur IP (nodes, unicast/broadcast)'**
  String get aboutTileArtnetTitle;

  /// No description provided for @aboutTileSacnTitle.
  ///
  /// In fr, this message translates to:
  /// **'sACN / E1.31 — multicast, IGMP, priorités'**
  String get aboutTileSacnTitle;

  /// No description provided for @aboutTileIpBasicsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réseau — bases IP / masque / DHCP (essentiel)'**
  String get aboutTileIpBasicsTitle;

  /// No description provided for @aboutTileReseauTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réseau — RJ45 / Fibre / débits & longueurs'**
  String get aboutTileReseauTitle;

  /// No description provided for @aboutTileNetworkTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réseau lumière — VLAN, IGMP, Wi-Fi vs filaire'**
  String get aboutTileNetworkTitle;

  /// No description provided for @aboutTileVideoTitle.
  ///
  /// In fr, this message translates to:
  /// **'Vidéo — SDI / NDI / IP (SRT/RTMP)'**
  String get aboutTileVideoTitle;

  /// No description provided for @aboutTileElectriciteTitle.
  ///
  /// In fr, this message translates to:
  /// **'Électrique — Schuko / P17 / puissances'**
  String get aboutTileElectriciteTitle;

  /// No description provided for @aboutTileElectriciteSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Connecteurs, mono/tri, tableaux kW rapides (16A→400A), pièges terrain.'**
  String get aboutTileElectriciteSubtitle;

  /// No description provided for @aboutTileInformatiqueTitle.
  ///
  /// In fr, this message translates to:
  /// **'Informatique — USB / HDMI / DP / SATA / NVMe…'**
  String get aboutTileInformatiqueTitle;

  /// No description provided for @aboutTileInformatiqueSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Débits utiles, versions, limites réelles, pièges marketing.'**
  String get aboutTileInformatiqueSubtitle;

  /// No description provided for @aboutTitle.
  ///
  /// In fr, this message translates to:
  /// **'À propos'**
  String get aboutTitle;

  /// No description provided for @homeRiggingTitle.
  ///
  /// In fr, this message translates to:
  /// **'Rigging'**
  String get homeRiggingTitle;

  /// No description provided for @homeRiggingSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Bridles : angles & longueurs d’élingues.'**
  String get homeRiggingSubtitle;

  /// No description provided for @riggingTitle.
  ///
  /// In fr, this message translates to:
  /// **'Rigging'**
  String get riggingTitle;

  /// No description provided for @riggingAngleLengthTitle.
  ///
  /// In fr, this message translates to:
  /// **'Angle de bridle & longueur d’élingues'**
  String get riggingAngleLengthTitle;

  /// No description provided for @riggingSymmetryNote.
  ///
  /// In fr, this message translates to:
  /// **'Hypothèse : bridle symétrique (2 brins identiques). Aucun calcul de charge.'**
  String get riggingSymmetryNote;

  /// No description provided for @riggingInputsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Entrées'**
  String get riggingInputsTitle;

  /// No description provided for @riggingSpanLabel.
  ///
  /// In fr, this message translates to:
  /// **'Entraxe (distance entre points)'**
  String get riggingSpanLabel;

  /// No description provided for @riggingSpanHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex : 2.40'**
  String get riggingSpanHint;

  /// No description provided for @riggingDropLabel.
  ///
  /// In fr, this message translates to:
  /// **'Flèche (drop vertical)'**
  String get riggingDropLabel;

  /// No description provided for @riggingDropHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex : 0.60'**
  String get riggingDropHint;

  /// No description provided for @riggingUnitMeters.
  ///
  /// In fr, this message translates to:
  /// **'m'**
  String get riggingUnitMeters;

  /// No description provided for @riggingResultsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Résultats'**
  String get riggingResultsTitle;

  /// No description provided for @riggingNeedPositiveValues.
  ///
  /// In fr, this message translates to:
  /// **'Renseigne des valeurs > 0.'**
  String get riggingNeedPositiveValues;

  /// No description provided for @riggingLegLengthLabel.
  ///
  /// In fr, this message translates to:
  /// **'Longueur d’un brin'**
  String get riggingLegLengthLabel;

  /// No description provided for @riggingAngleToHorizontalLabel.
  ///
  /// In fr, this message translates to:
  /// **'Angle par rapport à l’horizontale'**
  String get riggingAngleToHorizontalLabel;

  /// No description provided for @riggingAngleToVerticalLabel.
  ///
  /// In fr, this message translates to:
  /// **'Angle par rapport à la verticale'**
  String get riggingAngleToVerticalLabel;

  /// No description provided for @riggingDisclaimerShort.
  ///
  /// In fr, this message translates to:
  /// **'Résultats indicatifs. À valider selon ton contexte et les pratiques rigging.'**
  String get riggingDisclaimerShort;

  /// No description provided for @riggingCalcLegDropTitle.
  ///
  /// In fr, this message translates to:
  /// **'Longueur + flèche → portée'**
  String get riggingCalcLegDropTitle;

  /// No description provided for @riggingCalcLegDropHelp.
  ///
  /// In fr, this message translates to:
  /// **'Élingue symétrique (2 brins) : calcule la portée à partir de la longueur d’élingue et de la flèche.'**
  String get riggingCalcLegDropHelp;

  /// No description provided for @riggingLegLengthInputLabel.
  ///
  /// In fr, this message translates to:
  /// **'Longueur d’un brin'**
  String get riggingLegLengthInputLabel;

  /// No description provided for @riggingLegLengthInputHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex: 2.50'**
  String get riggingLegLengthInputHint;

  /// No description provided for @riggingInvalidTriangle.
  ///
  /// In fr, this message translates to:
  /// **'Impossible : la longueur doit être supérieure à la flèche.'**
  String get riggingInvalidTriangle;

  /// No description provided for @riggingCalcLegAngleTitle.
  ///
  /// In fr, this message translates to:
  /// **'Longueur + angle → portée + flèche'**
  String get riggingCalcLegAngleTitle;

  /// No description provided for @riggingCalcLegAngleHelp.
  ///
  /// In fr, this message translates to:
  /// **'Élingue symétrique (2 brins) : calcule portée et flèche à partir de la longueur et de l’angle par rapport à l’horizontale.'**
  String get riggingCalcLegAngleHelp;

  /// No description provided for @riggingAngleHorizontalInputLabel.
  ///
  /// In fr, this message translates to:
  /// **'Angle par rapport à l’horizontale'**
  String get riggingAngleHorizontalInputLabel;

  /// No description provided for @riggingAngleHorizontalInputHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex: 30'**
  String get riggingAngleHorizontalInputHint;

  /// No description provided for @riggingInvalidAngle.
  ///
  /// In fr, this message translates to:
  /// **'Angle invalide : entre 0° et 90° (exclu).'**
  String get riggingInvalidAngle;

  /// No description provided for @riggingUnitDegrees.
  ///
  /// In fr, this message translates to:
  /// **'°'**
  String get riggingUnitDegrees;

  /// No description provided for @riggingCalc1Title.
  ///
  /// In fr, this message translates to:
  /// **'Entraxe + flèche → longueur & angles'**
  String get riggingCalc1Title;

  /// No description provided for @riggingCalc1Subtitle.
  ///
  /// In fr, this message translates to:
  /// **'Bridle symétrique (2 brins identiques). Poids affiché (info). Aucun calcul de charge.'**
  String get riggingCalc1Subtitle;

  /// No description provided for @riggingCalc2Title.
  ///
  /// In fr, this message translates to:
  /// **'Entraxe + angle(H) → flèche & longueur'**
  String get riggingCalc2Title;

  /// No description provided for @riggingCalc2Subtitle.
  ///
  /// In fr, this message translates to:
  /// **'Angle par rapport à l\'horizontale. Bridle symétrique. Aucun calcul de charge.'**
  String get riggingCalc2Subtitle;

  /// No description provided for @riggingCalc3Title.
  ///
  /// In fr, this message translates to:
  /// **'Entraxe + longueur → flèche & angles'**
  String get riggingCalc3Title;

  /// No description provided for @riggingCalc3Subtitle.
  ///
  /// In fr, this message translates to:
  /// **'Longueur d’un brin connue. Bridle symétrique. Aucun calcul de charge.'**
  String get riggingCalc3Subtitle;

  /// No description provided for @riggingLegLengthHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex: 4.70'**
  String get riggingLegLengthHint;

  /// No description provided for @riggingAngleHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex : 45'**
  String get riggingAngleHint;

  /// No description provided for @riggingInvalidGeometry.
  ///
  /// In fr, this message translates to:
  /// **'Géométrie impossible (longueur trop courte pour l’entraxe).'**
  String get riggingInvalidGeometry;

  /// No description provided for @riggingSchemaTitle.
  ///
  /// In fr, this message translates to:
  /// **'Schéma'**
  String get riggingSchemaTitle;

  /// No description provided for @riggingSchemaCaption1.
  ///
  /// In fr, this message translates to:
  /// **'Entrées : portée + flèche. Sorties : longueur d’élingue + angles.'**
  String get riggingSchemaCaption1;

  /// No description provided for @riggingSchemaCaption2.
  ///
  /// In fr, this message translates to:
  /// **'Entrées : portée + longueur d’élingue. Sorties : flèche + angles.'**
  String get riggingSchemaCaption2;

  /// No description provided for @riggingSchemaCaption3.
  ///
  /// In fr, this message translates to:
  /// **'Entrées : portée + angle (horizontal). Sorties : flèche + longueur.'**
  String get riggingSchemaCaption3;

  /// No description provided for @riggingAngleHInputLabel.
  ///
  /// In fr, this message translates to:
  /// **'Angle (par rapport à l’horizontale)'**
  String get riggingAngleHInputLabel;

  /// No description provided for @riggingAngleHInputHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex: 45'**
  String get riggingAngleHInputHint;

  /// No description provided for @riggingDropResultLabel.
  ///
  /// In fr, this message translates to:
  /// **'Flèche (drop)'**
  String get riggingDropResultLabel;

  /// No description provided for @riggingSchemaLabelSpan.
  ///
  /// In fr, this message translates to:
  /// **'Entraxe'**
  String get riggingSchemaLabelSpan;

  /// No description provided for @riggingSchemaLabelDrop.
  ///
  /// In fr, this message translates to:
  /// **'Flèche'**
  String get riggingSchemaLabelDrop;

  /// No description provided for @riggingSchemaLabelLeg.
  ///
  /// In fr, this message translates to:
  /// **'Brin'**
  String get riggingSchemaLabelLeg;

  /// No description provided for @riggingWeightLabel.
  ///
  /// In fr, this message translates to:
  /// **'Poids (info)'**
  String get riggingWeightLabel;

  /// No description provided for @riggingUnitKg.
  ///
  /// In fr, this message translates to:
  /// **'kg'**
  String get riggingUnitKg;

  /// No description provided for @riggingImpossibleGeometry.
  ///
  /// In fr, this message translates to:
  /// **'Géométrie impossible : la longueur d’un brin doit être > (entraxe / 2).'**
  String get riggingImpossibleGeometry;

  /// No description provided for @riggingDisclaimerNoLoad.
  ///
  /// In fr, this message translates to:
  /// **'Poids affiché à titre indicatif. Aucun calcul de charge / tension. Valide selon ton contexte rigging.'**
  String get riggingDisclaimerNoLoad;

  /// No description provided for @riggingCalcCommonSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Bridle 2 brins. Poids affiché (info). Aucun calcul de charge.'**
  String get riggingCalcCommonSubtitle;

  /// No description provided for @riggingOffCenterToggle.
  ///
  /// In fr, this message translates to:
  /// **'Charge décentrée'**
  String get riggingOffCenterToggle;

  /// No description provided for @riggingOffsetLabel.
  ///
  /// In fr, this message translates to:
  /// **'Offset A → charge'**
  String get riggingOffsetLabel;

  /// No description provided for @riggingInvalidOffset.
  ///
  /// In fr, this message translates to:
  /// **'Offset invalide : doit être > 0 et < entraxe.'**
  String get riggingInvalidOffset;

  /// No description provided for @riggingLegLeftLabel.
  ///
  /// In fr, this message translates to:
  /// **'Longueur brin gauche'**
  String get riggingLegLeftLabel;

  /// No description provided for @riggingLegRightLabel.
  ///
  /// In fr, this message translates to:
  /// **'Longueur brin droit'**
  String get riggingLegRightLabel;

  /// No description provided for @riggingAngleHLeftLabel.
  ///
  /// In fr, this message translates to:
  /// **'Angle H (gauche)'**
  String get riggingAngleHLeftLabel;

  /// No description provided for @riggingAngleHRightLabel.
  ///
  /// In fr, this message translates to:
  /// **'Angle H (droit)'**
  String get riggingAngleHRightLabel;

  /// No description provided for @riggingAngleVLeftLabel.
  ///
  /// In fr, this message translates to:
  /// **'Angle V (gauche)'**
  String get riggingAngleVLeftLabel;

  /// No description provided for @riggingAngleVRightLabel.
  ///
  /// In fr, this message translates to:
  /// **'Angle V (droit)'**
  String get riggingAngleVRightLabel;

  /// No description provided for @riggingBridleAnglesLegend.
  ///
  /// In fr, this message translates to:
  /// **'Angles'**
  String get riggingBridleAnglesLegend;

  /// No description provided for @riggingIncludedAngleLabel.
  ///
  /// In fr, this message translates to:
  /// **'Angle entre brins'**
  String get riggingIncludedAngleLabel;

  /// No description provided for @riggingAngleHLeftInputLabel.
  ///
  /// In fr, this message translates to:
  /// **'Angle H (brin gauche)'**
  String get riggingAngleHLeftInputLabel;

  /// No description provided for @riggingLegLeftInputLabel.
  ///
  /// In fr, this message translates to:
  /// **'Longueur (brin gauche)'**
  String get riggingLegLeftInputLabel;

  /// No description provided for @riggingNeedValidValues.
  ///
  /// In fr, this message translates to:
  /// **'Entrer des valeurs positives valides.'**
  String get riggingNeedValidValues;

  /// No description provided for @photometrySection4Title.
  ///
  /// In fr, this message translates to:
  /// **'Lux → Lumen'**
  String get photometrySection4Title;

  /// No description provided for @photometryAreaLabel.
  ///
  /// In fr, this message translates to:
  /// **'Surface (m²)'**
  String get photometryAreaLabel;

  /// No description provided for @photometryAreaHint4.
  ///
  /// In fr, this message translates to:
  /// **'Ex: 12.5'**
  String get photometryAreaHint4;

  /// No description provided for @photometrySummary4.
  ///
  /// In fr, this message translates to:
  /// **'E = {lux} lx • S = {area} m² → Φ = {lumens} lm'**
  String photometrySummary4(Object lumens, Object lux, Object area);

  /// No description provided for @aboutArtnetTocConversionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Conversions'**
  String get aboutArtnetTocConversionTitle;

  /// No description provided for @aboutArtnetConversionIntro.
  ///
  /// In fr, this message translates to:
  /// **'Outils de conversion utiles autour des univers DMX, Art-Net et des valeurs hexadécimales.'**
  String get aboutArtnetConversionIntro;

  /// No description provided for @aboutUniverseToArtnetTitle.
  ///
  /// In fr, this message translates to:
  /// **'Univers → Art-Net'**
  String get aboutUniverseToArtnetTitle;

  /// No description provided for @aboutUniverseToArtnetSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Trouver Subnet + Universe (Net/Port-Address) à partir d’un univers DMX.'**
  String get aboutUniverseToArtnetSubtitle;

  /// No description provided for @aboutUniverseToHexTitle.
  ///
  /// In fr, this message translates to:
  /// **'Univers → Hex'**
  String get aboutUniverseToHexTitle;

  /// No description provided for @aboutUniverseToHexSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Convertir un univers (1…N) en index et valeur hexadécimale.'**
  String get aboutUniverseToHexSubtitle;

  /// No description provided for @aboutArtnetConversionNote.
  ///
  /// In fr, this message translates to:
  /// **'Note : les conventions Art-Net peuvent varier selon les consoles (adressage, base 0/1). Vérifie toujours la documentation de ton système.'**
  String get aboutArtnetConversionNote;

  /// No description provided for @elecTocCopyText.
  ///
  /// In fr, this message translates to:
  /// **'Copier le sommaire'**
  String get elecTocCopyText;

  /// No description provided for @elecToc1.
  ///
  /// In fr, this message translates to:
  /// **'1) Bases (W, A, V, kW)'**
  String get elecToc1;

  /// No description provided for @elecToc2.
  ///
  /// In fr, this message translates to:
  /// **'2) Connecteurs (Schuko / P17 / PowerCON)'**
  String get elecToc2;

  /// No description provided for @elecToc3.
  ///
  /// In fr, this message translates to:
  /// **'3) Mono / Tri (ce que ça change)'**
  String get elecToc3;

  /// No description provided for @elecToc4.
  ///
  /// In fr, this message translates to:
  /// **'4) Table rapide (16A → 400A)'**
  String get elecToc4;

  /// No description provided for @elecToc5.
  ///
  /// In fr, this message translates to:
  /// **'Conversion kVA → kW / A'**
  String get elecToc5;

  /// No description provided for @elecToc6.
  ///
  /// In fr, this message translates to:
  /// **'6) Sécurité & pièges terrain'**
  String get elecToc6;

  /// No description provided for @elecToc7.
  ///
  /// In fr, this message translates to:
  /// **'6) Checklist'**
  String get elecToc7;

  /// No description provided for @elecKvaTitle.
  ///
  /// In fr, this message translates to:
  /// **'Table kVA → kW (selon cos φ)'**
  String get elecKvaTitle;

  /// No description provided for @elecKvaFormula.
  ///
  /// In fr, this message translates to:
  /// **'Formule : kW = kVA × cos φ'**
  String get elecKvaFormula;

  /// No description provided for @elecKvaIntro.
  ///
  /// In fr, this message translates to:
  /// **'Cette table donne une estimation rapide de la puissance active (kW) à partir d’une puissance apparente (kVA).'**
  String get elecKvaIntro;

  /// No description provided for @elecKvaNote.
  ///
  /// In fr, this message translates to:
  /// **'Valeurs indicatives. Utilise les valeurs réelles de cos φ quand tu les connais.'**
  String get elecKvaNote;

  /// No description provided for @elecKvaColKva.
  ///
  /// In fr, this message translates to:
  /// **'kVA'**
  String get elecKvaColKva;

  /// No description provided for @elecKvaColPf08.
  ///
  /// In fr, this message translates to:
  /// **'kW (cos φ = 0,8)'**
  String get elecKvaColPf08;

  /// No description provided for @elecKvaColPf10.
  ///
  /// In fr, this message translates to:
  /// **'kW (cos φ = 1,0)'**
  String get elecKvaColPf10;

  /// No description provided for @commonTocTitle.
  ///
  /// In fr, this message translates to:
  /// **'Sommaire'**
  String get commonTocTitle;

  /// No description provided for @commonCopySummaryTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Copier le sommaire'**
  String get commonCopySummaryTooltip;

  /// No description provided for @aboutLightReferenceTitle.
  ///
  /// In fr, this message translates to:
  /// **'Références lumière'**
  String get aboutLightReferenceTitle;

  /// No description provided for @refCriTitle.
  ///
  /// In fr, this message translates to:
  /// **'IRC / CRI'**
  String get refCriTitle;

  /// No description provided for @refKelvinTitle.
  ///
  /// In fr, this message translates to:
  /// **'Température de couleur (K)'**
  String get refKelvinTitle;

  /// No description provided for @refBeamFieldTitle.
  ///
  /// In fr, this message translates to:
  /// **'Beam / Field'**
  String get refBeamFieldTitle;

  /// No description provided for @refLuxTitle.
  ///
  /// In fr, this message translates to:
  /// **'Niveaux d’éclairement (lux)'**
  String get refLuxTitle;

  /// No description provided for @refCriContent.
  ///
  /// In fr, this message translates to:
  /// **'L’IRC (CRI) mesure la fidélité des couleurs. Plus il est élevé, plus les couleurs paraissent naturelles.'**
  String get refCriContent;

  /// No description provided for @refKelvinContent.
  ///
  /// In fr, this message translates to:
  /// **'La température de couleur décrit la teinte de blanc (chaud à froid).'**
  String get refKelvinContent;

  /// No description provided for @refBeamFieldContent.
  ///
  /// In fr, this message translates to:
  /// **'Le Beam est l’angle du faisceau principal ; le Field l’angle où l’intensité devient faible (bordure).'**
  String get refBeamFieldContent;

  /// No description provided for @refBeamLegendBeam.
  ///
  /// In fr, this message translates to:
  /// **'Beam'**
  String get refBeamLegendBeam;

  /// No description provided for @refBeamLegendField.
  ///
  /// In fr, this message translates to:
  /// **'Field'**
  String get refBeamLegendField;

  /// No description provided for @refLuxIntro.
  ///
  /// In fr, this message translates to:
  /// **'Références indicatives d’éclairement selon l’usage.'**
  String get refLuxIntro;

  /// No description provided for @refLuxColUse.
  ///
  /// In fr, this message translates to:
  /// **'Usage'**
  String get refLuxColUse;

  /// No description provided for @refLuxColLux.
  ///
  /// In fr, this message translates to:
  /// **'Lux'**
  String get refLuxColLux;

  /// No description provided for @refLuxUseCorridor.
  ///
  /// In fr, this message translates to:
  /// **'Couloir / circulation'**
  String get refLuxUseCorridor;

  /// No description provided for @refLuxUseBackstage.
  ///
  /// In fr, this message translates to:
  /// **'Backstage / technique'**
  String get refLuxUseBackstage;

  /// No description provided for @refLuxUseMeeting.
  ///
  /// In fr, this message translates to:
  /// **'Salle de réunion'**
  String get refLuxUseMeeting;

  /// No description provided for @refLuxUseExpo.
  ///
  /// In fr, this message translates to:
  /// **'Expo / showroom'**
  String get refLuxUseExpo;

  /// No description provided for @refLuxUseStageGeneral.
  ///
  /// In fr, this message translates to:
  /// **'Scène – général'**
  String get refLuxUseStageGeneral;

  /// No description provided for @refLuxUseStageTv.
  ///
  /// In fr, this message translates to:
  /// **'Scène – TV / captation'**
  String get refLuxUseStageTv;

  /// No description provided for @refLuxNote.
  ///
  /// In fr, this message translates to:
  /// **'Ces valeurs varient selon les normes et les contraintes (caméra, contraste, ambiance).'**
  String get refLuxNote;

  /// No description provided for @refLightDisclaimerShort.
  ///
  /// In fr, this message translates to:
  /// **'Références indicatives – pas une norme.'**
  String get refLightDisclaimerShort;

  /// No description provided for @refCri90.
  ///
  /// In fr, this message translates to:
  /// **'Excellent (≥ 90)'**
  String get refCri90;

  /// No description provided for @refCri80.
  ///
  /// In fr, this message translates to:
  /// **'Bon (≈ 80)'**
  String get refCri80;

  /// No description provided for @refCriLow.
  ///
  /// In fr, this message translates to:
  /// **'Faible (< 80)'**
  String get refCriLow;

  /// No description provided for @aboutUniverseToArtnetImportantTitle.
  ///
  /// In fr, this message translates to:
  /// **'Important'**
  String get aboutUniverseToArtnetImportantTitle;

  /// No description provided for @aboutUniverseToArtnetImportantBody.
  ///
  /// In fr, this message translates to:
  /// **'Certaines consoles utilisent une base 0 (Universe 0..15) et d’autres une base 1 (Universe 1..16).'**
  String get aboutUniverseToArtnetImportantBody;

  /// No description provided for @aboutUniverseToArtnetTableTitle.
  ///
  /// In fr, this message translates to:
  /// **'Table Univers → Art-Net'**
  String get aboutUniverseToArtnetTableTitle;

  /// No description provided for @aboutUniverseToArtnetTableIntro.
  ///
  /// In fr, this message translates to:
  /// **'Correspondance typique entre univers DMX et adressage Art-Net.'**
  String get aboutUniverseToArtnetTableIntro;

  /// No description provided for @aboutUniverseTablesDisclaimer.
  ///
  /// In fr, this message translates to:
  /// **'Vérifie toujours la convention de ta console / node.'**
  String get aboutUniverseTablesDisclaimer;

  /// No description provided for @aboutUniverseToArtnetColDmx.
  ///
  /// In fr, this message translates to:
  /// **'Univers DMX'**
  String get aboutUniverseToArtnetColDmx;

  /// No description provided for @aboutUniverseToArtnetColUniHex.
  ///
  /// In fr, this message translates to:
  /// **'Uni (hex)'**
  String get aboutUniverseToArtnetColUniHex;

  /// No description provided for @aboutUniverseToArtnetSubnetTitle.
  ///
  /// In fr, this message translates to:
  /// **'Subnet {p0} {p1} {p2} {p3}'**
  String aboutUniverseToArtnetSubnetTitle(
      Object p0, Object p1, Object p2, Object p3);

  /// No description provided for @aboutUniverseToHexPrincipleTitle.
  ///
  /// In fr, this message translates to:
  /// **'Principe'**
  String get aboutUniverseToHexPrincipleTitle;

  /// No description provided for @aboutUniverseToHexPrincipleBody.
  ///
  /// In fr, this message translates to:
  /// **'Un univers (1…N) peut être converti en index (base 0) puis en hexadécimal.'**
  String get aboutUniverseToHexPrincipleBody;

  /// No description provided for @aboutUniverseToHexTableTitle.
  ///
  /// In fr, this message translates to:
  /// **'Table Univers → Hex'**
  String get aboutUniverseToHexTableTitle;

  /// No description provided for @aboutUniverseToHexTableIntro.
  ///
  /// In fr, this message translates to:
  /// **'Table de conversion univers DMX → index / hex.'**
  String get aboutUniverseToHexTableIntro;

  /// No description provided for @aboutUniverseToHexBlockTitle.
  ///
  /// In fr, this message translates to:
  /// **'Bloc {p0} {p1}'**
  String aboutUniverseToHexBlockTitle(Object p0, Object p1);

  /// No description provided for @aboutUniverseToHexColDmx.
  ///
  /// In fr, this message translates to:
  /// **'Univers DMX'**
  String get aboutUniverseToHexColDmx;

  /// No description provided for @aboutUniverseToHexColIndex.
  ///
  /// In fr, this message translates to:
  /// **'Index'**
  String get aboutUniverseToHexColIndex;

  /// No description provided for @aboutArtnetPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Art-Net — univers DMX sur IP (simple & complet)'**
  String get aboutArtnetPageTitle;

  /// No description provided for @aboutArtnetTocTitle.
  ///
  /// In fr, this message translates to:
  /// **'Sommaire'**
  String get aboutArtnetTocTitle;

  /// No description provided for @aboutArtnetTocCopyTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Copier repères'**
  String get aboutArtnetTocCopyTooltip;

  /// No description provided for @aboutArtnetCopyLine1.
  ///
  /// In fr, this message translates to:
  /// **'Art-Net = DMX sur Ethernet via UDP.'**
  String get aboutArtnetCopyLine1;

  /// No description provided for @aboutArtnetCopyLine2.
  ///
  /// In fr, this message translates to:
  /// **'Échelle: beaucoup d’univers via nodes (DMX-out) distribués.'**
  String get aboutArtnetCopyLine2;

  /// No description provided for @aboutArtnetCopyLine3.
  ///
  /// In fr, this message translates to:
  /// **'Diffusion: broadcast (simple mais flood) ou unicast (plus propre).'**
  String get aboutArtnetCopyLine3;

  /// No description provided for @aboutArtnetCopyLine4.
  ///
  /// In fr, this message translates to:
  /// **'Limites réelles: Wi-Fi, switch basique, firmware nodes, réglages univers/mapping.'**
  String get aboutArtnetCopyLine4;

  /// No description provided for @aboutArtnetCopyLine5.
  ///
  /// In fr, this message translates to:
  /// **'RDM: possible via \"RDM proxy\" selon nodes (support variable).'**
  String get aboutArtnetCopyLine5;

  /// No description provided for @aboutArtnetSection1Title.
  ///
  /// In fr, this message translates to:
  /// **'1) Art-Net — c’est quoi et pourquoi'**
  String get aboutArtnetSection1Title;

  /// No description provided for @aboutArtnetSection2Title.
  ///
  /// In fr, this message translates to:
  /// **'2) Adressage & univers — mapping propre'**
  String get aboutArtnetSection2Title;

  /// No description provided for @aboutArtnetSection3Title.
  ///
  /// In fr, this message translates to:
  /// **'3) Limites & perf — ce qui casse en premier'**
  String get aboutArtnetSection3Title;

  /// No description provided for @aboutArtnetSection4Title.
  ///
  /// In fr, this message translates to:
  /// **'4) Nodes, splitters & RDM'**
  String get aboutArtnetSection4Title;

  /// No description provided for @aboutArtnetSection5Title.
  ///
  /// In fr, this message translates to:
  /// **'5) Dépannage — symptômes → causes'**
  String get aboutArtnetSection5Title;

  /// No description provided for @aboutArtnetSection6Title.
  ///
  /// In fr, this message translates to:
  /// **'6) Schémas (réseau / unicast vs broadcast)'**
  String get aboutArtnetSection6Title;

  /// No description provided for @aboutArtnetSection6bTitle.
  ///
  /// In fr, this message translates to:
  /// **'6bis) Images (assets) — RJ45/switch/câbles'**
  String get aboutArtnetSection6bTitle;

  /// No description provided for @aboutArtnetSection7Title.
  ///
  /// In fr, this message translates to:
  /// **'7) Checklist rapide'**
  String get aboutArtnetSection7Title;

  /// No description provided for @aboutArtnetConversionTablesTitle.
  ///
  /// In fr, this message translates to:
  /// **'8) Conversion / tables (Univers 1..256)'**
  String get aboutArtnetConversionTablesTitle;

  /// No description provided for @aboutArtnetPillUdp.
  ///
  /// In fr, this message translates to:
  /// **'UDP'**
  String get aboutArtnetPillUdp;

  /// No description provided for @aboutArtnetPillUniversIp.
  ///
  /// In fr, this message translates to:
  /// **'Univers DMX sur IP'**
  String get aboutArtnetPillUniversIp;

  /// No description provided for @aboutArtnetPillNodesDmxOut.
  ///
  /// In fr, this message translates to:
  /// **'Nodes DMX-out'**
  String get aboutArtnetPillNodesDmxOut;

  /// No description provided for @aboutArtnetSection1Paragraph.
  ///
  /// In fr, this message translates to:
  /// **' des \"paquets\" sur le réseau'**
  String get aboutArtnetSection1Paragraph;

  /// No description provided for @aboutArtnetSection1CalloutTitle.
  ///
  /// In fr, this message translates to:
  /// **'Pourquoi c’est utile'**
  String get aboutArtnetSection1CalloutTitle;

  /// No description provided for @aboutArtnetSection1Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Scalable : beaucoup d’univers sur un seul câble réseau.'**
  String get aboutArtnetSection1Bullet1;

  /// No description provided for @aboutArtnetSection1Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Distribution : nodes proches des projecteurs/dimmers → moins de longues lignes DMX.'**
  String get aboutArtnetSection1Bullet2;

  /// No description provided for @aboutArtnetSection1Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Patch flexible : changer un univers ou déplacer un node est rapide.'**
  String get aboutArtnetSection1Bullet3;

  /// No description provided for @aboutArtnetSection1Subtitle.
  ///
  /// In fr, this message translates to:
  /// **'Deux mots à retenir'**
  String get aboutArtnetSection1Subtitle;

  /// No description provided for @aboutArtnetSection1SubBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Art-Net ne remplace pas le DMX : il le transporte sur IP.'**
  String get aboutArtnetSection1SubBullet1;

  /// No description provided for @aboutArtnetSection1SubBullet2.
  ///
  /// In fr, this message translates to:
  /// **'La stabilité dépend souvent plus du réseau (switch, Wi-Fi, broadcast) que du protocole.'**
  String get aboutArtnetSection1SubBullet2;

  /// No description provided for @aboutArtnetSection2PillUniverse.
  ///
  /// In fr, this message translates to:
  /// **'Univers'**
  String get aboutArtnetSection2PillUniverse;

  /// No description provided for @aboutArtnetSection2PillNodePort.
  ///
  /// In fr, this message translates to:
  /// **'Node / Port'**
  String get aboutArtnetSection2PillNodePort;

  /// No description provided for @aboutArtnetSection2PillMapping.
  ///
  /// In fr, this message translates to:
  /// **'Mapping'**
  String get aboutArtnetSection2PillMapping;

  /// No description provided for @aboutDmxPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'DMX — fonctionnement (simple & complet)'**
  String get aboutDmxPageTitle;

  /// No description provided for @aboutDmxSummaryLine1.
  ///
  /// In fr, this message translates to:
  /// **'DMX = RS-485, 512 canaux (slots) par univers, valeurs 0–255 (8-bit).'**
  String get aboutDmxSummaryLine1;

  /// No description provided for @aboutDmxSummaryLine2.
  ///
  /// In fr, this message translates to:
  /// **'Timing : 250 kbaud, univers plein ≈ ~44 Hz (ordre de grandeur).'**
  String get aboutDmxSummaryLine2;

  /// No description provided for @aboutDmxSummaryLine3.
  ///
  /// In fr, this message translates to:
  /// **'Topologie : daisy-chain (pas de Y passif). Terminaison 120Ω sur le dernier.'**
  String get aboutDmxSummaryLine3;

  /// No description provided for @aboutDmxSummaryLine4.
  ///
  /// In fr, this message translates to:
  /// **'RDM = DMX bidirectionnel (config/monitoring) → compatibilités splitters/nodes à vérifier.'**
  String get aboutDmxSummaryLine4;

  /// No description provided for @aboutDmxSummaryLine5.
  ///
  /// In fr, this message translates to:
  /// **'Art-Net / sACN = univers DMX transportés sur Ethernet/IP via nodes.'**
  String get aboutDmxSummaryLine5;

  /// No description provided for @aboutDmxSummaryLine6.
  ///
  /// In fr, this message translates to:
  /// **'sACN = multicast + priorités (IGMP snooping recommandé).'**
  String get aboutDmxSummaryLine6;

  /// No description provided for @aboutDmxToc1.
  ///
  /// In fr, this message translates to:
  /// **'1) DMX, univers, adresses — la base'**
  String get aboutDmxToc1;

  /// No description provided for @aboutDmxToc2.
  ///
  /// In fr, this message translates to:
  /// **'2) Trame DMX — break, start code, canaux'**
  String get aboutDmxToc2;

  /// No description provided for @aboutDmxToc3.
  ///
  /// In fr, this message translates to:
  /// **'3) Câblage RS-485 — topologie & câble'**
  String get aboutDmxToc3;

  /// No description provided for @aboutDmxToc4.
  ///
  /// In fr, this message translates to:
  /// **'4) Terminaison & splitters — éviter les réflexions'**
  String get aboutDmxToc4;

  /// No description provided for @aboutDmxToc4bis.
  ///
  /// In fr, this message translates to:
  /// **'4bis) RDM — limites & compatibilités'**
  String get aboutDmxToc4bis;

  /// No description provided for @aboutDmxToc5.
  ///
  /// In fr, this message translates to:
  /// **'5) Dépannage terrain — symptômes → causes'**
  String get aboutDmxToc5;

  /// No description provided for @aboutDmxToc6.
  ///
  /// In fr, this message translates to:
  /// **'6) Art-Net — repères terrain'**
  String get aboutDmxToc6;

  /// No description provided for @aboutDmxToc7.
  ///
  /// In fr, this message translates to:
  /// **'7) sACN / E1.31 — multicast, IGMP, priorités'**
  String get aboutDmxToc7;

  /// No description provided for @aboutDmxToc8.
  ///
  /// In fr, this message translates to:
  /// **'8) DMX vs Art-Net vs sACN — choisir'**
  String get aboutDmxToc8;

  /// No description provided for @aboutDmxToc9.
  ///
  /// In fr, this message translates to:
  /// **'9) Schémas terrain (DMX / IP / pinout)'**
  String get aboutDmxToc9;

  /// No description provided for @aboutDmxChecklistCopyTitle.
  ///
  /// In fr, this message translates to:
  /// **'DMX — Checklist terrain'**
  String get aboutDmxChecklistCopyTitle;

  /// No description provided for @aboutDmxChecklistCopyTitle2.
  ///
  /// In fr, this message translates to:
  /// **'Art-Net / sACN — Checklist terrain'**
  String get aboutDmxChecklistCopyTitle2;

  /// No description provided for @aboutDmxChecklistCopyB1.
  ///
  /// In fr, this message translates to:
  /// **'Mode appareil correct (nombre de canaux)'**
  String get aboutDmxChecklistCopyB1;

  /// No description provided for @aboutDmxChecklistCopyB2.
  ///
  /// In fr, this message translates to:
  /// **'Adresse DMX correcte (pas de chevauchement)'**
  String get aboutDmxChecklistCopyB2;

  /// No description provided for @aboutDmxChecklistCopyB3.
  ///
  /// In fr, this message translates to:
  /// **'Daisy-chain (pas de Y passif)'**
  String get aboutDmxChecklistCopyB3;

  /// No description provided for @aboutDmxChecklistCopyB4.
  ///
  /// In fr, this message translates to:
  /// **'Terminaison 120Ω sur le dernier appareil'**
  String get aboutDmxChecklistCopyB4;

  /// No description provided for @aboutDmxChecklistCopyB5.
  ///
  /// In fr, this message translates to:
  /// **'Câble DMX/RS-485 (paire torsadée 120Ω) si possible'**
  String get aboutDmxChecklistCopyB5;

  /// No description provided for @aboutDmxChecklistCopyB6.
  ///
  /// In fr, this message translates to:
  /// **'Splitter opto si plusieurs branches'**
  String get aboutDmxChecklistCopyB6;

  /// No description provided for @aboutDmxChecklistCopyB7.
  ///
  /// In fr, this message translates to:
  /// **'Éloigner DMX des sources parasites (alims, dimmers) si possible'**
  String get aboutDmxChecklistCopyB7;

  /// No description provided for @aboutDmxChecklistCopyB8.
  ///
  /// In fr, this message translates to:
  /// **'Si RDM : vérifier compatibilité splitter/node + câblage impeccable'**
  String get aboutDmxChecklistCopyB8;

  /// No description provided for @aboutDmxChecklistCopyB9.
  ///
  /// In fr, this message translates to:
  /// **'Réseau dédié si possible (ou VLAN)'**
  String get aboutDmxChecklistCopyB9;

  /// No description provided for @aboutDmxChecklistCopyB10.
  ///
  /// In fr, this message translates to:
  /// **'Switch correct ; IGMP snooping recommandé (sACN multicast)'**
  String get aboutDmxChecklistCopyB10;

  /// No description provided for @aboutDmxChecklistCopyB11.
  ///
  /// In fr, this message translates to:
  /// **'Unicast (souvent) ou multicast maîtrisé (éviter flood)'**
  String get aboutDmxChecklistCopyB11;

  /// No description provided for @aboutDmxChecklistCopyB12.
  ///
  /// In fr, this message translates to:
  /// **'Mapping univers ↔ ports/node vérifié'**
  String get aboutDmxChecklistCopyB12;

  /// No description provided for @aboutDmxChecklistCopyB13.
  ///
  /// In fr, this message translates to:
  /// **'Plan IP clair (adresses, masque, DHCP vs statique)'**
  String get aboutDmxChecklistCopyB13;

  /// No description provided for @aboutDmxS1Title.
  ///
  /// In fr, this message translates to:
  /// **'1) DMX, univers, adresses — la base'**
  String get aboutDmxS1Title;

  /// No description provided for @aboutDmxS1Pill1.
  ///
  /// In fr, this message translates to:
  /// **'1 univers = 512 slots'**
  String get aboutDmxS1Pill1;

  /// No description provided for @aboutDmxS1Pill2.
  ///
  /// In fr, this message translates to:
  /// **'0–255 (8-bit)'**
  String get aboutDmxS1Pill2;

  /// No description provided for @aboutDmxS1Pill3.
  ///
  /// In fr, this message translates to:
  /// **'16-bit = 2 canaux'**
  String get aboutDmxS1Pill3;

  /// No description provided for @aboutDmxS1Intro.
  ///
  /// In fr, this message translates to:
  /// **'DMX512 est un protocole de contrôle très utilisé en spectacle (lumière, effets, dimmers). C’est un flux série (RS-485) qui envoie en boucle une \"trame\" contenant jusqu’à 512 valeurs. Chaque valeur = un canal (0→255).'**
  String get aboutDmxS1Intro;

  /// No description provided for @aboutDmxS1RememberTitle.
  ///
  /// In fr, this message translates to:
  /// **'À retenir'**
  String get aboutDmxS1RememberTitle;

  /// No description provided for @aboutDmxS1RememberB1.
  ///
  /// In fr, this message translates to:
  /// **'1 univers DMX = 512 canaux (slots) numérotés 1→512.'**
  String get aboutDmxS1RememberB1;

  /// No description provided for @aboutDmxS1RememberB2.
  ///
  /// In fr, this message translates to:
  /// **'Un appareil écoute une adresse de départ (ex : 101) et consomme N canaux (selon son mode).'**
  String get aboutDmxS1RememberB2;

  /// No description provided for @aboutDmxS1RememberB3.
  ///
  /// In fr, this message translates to:
  /// **'Le contrôleur renvoie tout en continu : si tu arrêtes d’émettre, les appareils \"gèlent\" (ou passent en fallback).'**
  String get aboutDmxS1RememberB3;

  /// No description provided for @aboutDmxS4bisTitle.
  ///
  /// In fr, this message translates to:
  /// **'4bis) RDM — limites & compatibilités'**
  String get aboutDmxS4bisTitle;

  /// No description provided for @aboutDmxS4bisPlaceholder.
  ///
  /// In fr, this message translates to:
  /// **'... (garde ton contenu existant)'**
  String get aboutDmxS4bisPlaceholder;

  /// No description provided for @aboutDmxS9Title.
  ///
  /// In fr, this message translates to:
  /// **'9) Schémas terrain (DMX / IP / pinout)'**
  String get aboutDmxS9Title;

  /// No description provided for @aboutDmxS9Diagram1.
  ///
  /// In fr, this message translates to:
  /// **'Timing DMX (break / MAB / slots)'**
  String get aboutDmxS9Diagram1;

  /// No description provided for @aboutDmxS9Diagram2.
  ///
  /// In fr, this message translates to:
  /// **'Topologie DMX : daisy-chain'**
  String get aboutDmxS9Diagram2;

  /// No description provided for @aboutDmxS9Diagram3.
  ///
  /// In fr, this message translates to:
  /// **'Terminaison 120Ω'**
  String get aboutDmxS9Diagram3;

  /// No description provided for @aboutDmxS9Diagram4.
  ///
  /// In fr, this message translates to:
  /// **'sACN multicast : rappel IGMP (réseau)'**
  String get aboutDmxS9Diagram4;

  /// No description provided for @aboutDmxS9Diagram5.
  ///
  /// In fr, this message translates to:
  /// **'IP → nodes → DMX (Art-Net / sACN)'**
  String get aboutDmxS9Diagram5;

  /// No description provided for @aboutDmxS9Diagram6.
  ///
  /// In fr, this message translates to:
  /// **'Pinout XLR5 (DMX)'**
  String get aboutDmxS9Diagram6;

  /// No description provided for @aboutDmxS10Title.
  ///
  /// In fr, this message translates to:
  /// **'10) Checklist rapide'**
  String get aboutDmxS10Title;

  /// No description provided for @aboutDmxS10CopyTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Copier la checklist'**
  String get aboutDmxS10CopyTooltip;

  /// No description provided for @aboutDmxS10CalloutTitle.
  ///
  /// In fr, this message translates to:
  /// **'Avant de paniquer'**
  String get aboutDmxS10CalloutTitle;

  /// No description provided for @aboutDmxS10B1.
  ///
  /// In fr, this message translates to:
  /// **'Mode appareil + adresse DMX (toujours vérifier).'**
  String get aboutDmxS10B1;

  /// No description provided for @aboutDmxS10B2.
  ///
  /// In fr, this message translates to:
  /// **'Chaîne courte avec un câble \"connu OK\" pour isoler.'**
  String get aboutDmxS10B2;

  /// No description provided for @aboutDmxS10B3.
  ///
  /// In fr, this message translates to:
  /// **'Daisy-chain (pas de Y passif).'**
  String get aboutDmxS10B3;

  /// No description provided for @aboutDmxS10B4.
  ///
  /// In fr, this message translates to:
  /// **'Terminaison 120Ω sur le dernier appareil uniquement.'**
  String get aboutDmxS10B4;

  /// No description provided for @aboutDmxS10B5.
  ///
  /// In fr, this message translates to:
  /// **'Splitter opto si plusieurs branches.'**
  String get aboutDmxS10B5;

  /// No description provided for @aboutDmxS10B6.
  ///
  /// In fr, this message translates to:
  /// **'Si RDM : compat splitter/node + câblage impeccable.'**
  String get aboutDmxS10B6;

  /// No description provided for @aboutDmxS10B7.
  ///
  /// In fr, this message translates to:
  /// **'En IP (Art-Net/sACN) : switch correct, IGMP pour sACN multicast, unicast si doute.'**
  String get aboutDmxS10B7;

  /// No description provided for @aboutDmxFooterNote.
  ///
  /// In fr, this message translates to:
  /// **'Info indicative (terrain). Les comportements exacts peuvent varier selon consoles, nodes, switchs et firmwares.\nObjectif ici : comprendre et dépanner vite, avec une méthode fiable.'**
  String get aboutDmxFooterNote;

  /// No description provided for @aboutDmxPainterBreak.
  ///
  /// In fr, this message translates to:
  /// **'BREAK'**
  String get aboutDmxPainterBreak;

  /// No description provided for @aboutDmxPainterMab.
  ///
  /// In fr, this message translates to:
  /// **'MAB'**
  String get aboutDmxPainterMab;

  /// No description provided for @aboutDmxPainterStartCode.
  ///
  /// In fr, this message translates to:
  /// **'Start\ncode'**
  String get aboutDmxPainterStartCode;

  /// No description provided for @aboutDmxPainterSlots.
  ///
  /// In fr, this message translates to:
  /// **'Slots 1…N\n(jusqu’à 512)'**
  String get aboutDmxPainterSlots;

  /// No description provided for @aboutDmxPainterRefresh.
  ///
  /// In fr, this message translates to:
  /// **'Boucle (refresh) — univers plein ≈ ~44 Hz (ordre de grandeur)'**
  String get aboutDmxPainterRefresh;

  /// No description provided for @aboutDmxPainterSourceA.
  ///
  /// In fr, this message translates to:
  /// **'SOURCE A\n(prio 100)'**
  String get aboutDmxPainterSourceA;

  /// No description provided for @aboutDmxPainterSourceB.
  ///
  /// In fr, this message translates to:
  /// **'SOURCE B\n(prio 90)'**
  String get aboutDmxPainterSourceB;

  /// No description provided for @aboutDmxPainterSwitchIgmp.
  ///
  /// In fr, this message translates to:
  /// **'SWITCH\nIGMP snooping'**
  String get aboutDmxPainterSwitchIgmp;

  /// No description provided for @aboutDmxPainterMulticastUniverse.
  ///
  /// In fr, this message translates to:
  /// **'MULTICAST\nUniverse U'**
  String get aboutDmxPainterMulticastUniverse;

  /// No description provided for @aboutDmxPainterRx.
  ///
  /// In fr, this message translates to:
  /// **'RX'**
  String get aboutDmxPainterRx;

  /// No description provided for @aboutDmxPainterIgmpNote.
  ///
  /// In fr, this message translates to:
  /// **'Sans IGMP : flood\nAvec IGMP : seulement ports abonnés'**
  String get aboutDmxPainterIgmpNote;

  /// No description provided for @aboutDmxPainterConsole.
  ///
  /// In fr, this message translates to:
  /// **'CONSOLE'**
  String get aboutDmxPainterConsole;

  /// No description provided for @aboutDmxPainterFix1.
  ///
  /// In fr, this message translates to:
  /// **'FIX 1'**
  String get aboutDmxPainterFix1;

  /// No description provided for @aboutDmxPainterFix2.
  ///
  /// In fr, this message translates to:
  /// **'FIX 2'**
  String get aboutDmxPainterFix2;

  /// No description provided for @aboutDmxPainterFix3.
  ///
  /// In fr, this message translates to:
  /// **'FIX 3'**
  String get aboutDmxPainterFix3;

  /// No description provided for @aboutElectricitePageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Électrique — repères terrain'**
  String get aboutElectricitePageTitle;

  /// No description provided for @elecSection1Title.
  ///
  /// In fr, this message translates to:
  /// **'1) Bases (W, A, V, kW)'**
  String get elecSection1Title;

  /// No description provided for @elecSection1FormulasTitle.
  ///
  /// In fr, this message translates to:
  /// **'3 formules utiles'**
  String get elecSection1FormulasTitle;

  /// No description provided for @elecSection1Formula1.
  ///
  /// In fr, this message translates to:
  /// **'P (W) = U (V) × I (A)'**
  String get elecSection1Formula1;

  /// No description provided for @elecSection1Formula2.
  ///
  /// In fr, this message translates to:
  /// **'I (A) = P (W) / U (V)'**
  String get elecSection1Formula2;

  /// No description provided for @elecSection1Formula3.
  ///
  /// In fr, this message translates to:
  /// **'P (kW) = P (W) / 1000'**
  String get elecSection1Formula3;

  /// No description provided for @elecSection1FieldMarksTitle.
  ///
  /// In fr, this message translates to:
  /// **'Repères terrain'**
  String get elecSection1FieldMarksTitle;

  /// No description provided for @elecSection1FieldMark1.
  ///
  /// In fr, this message translates to:
  /// **'Mono 230V : 16A ≈ 3,7 kW | 32A ≈ 7,4 kW | 63A ≈ 14,5 kW'**
  String get elecSection1FieldMark1;

  /// No description provided for @elecSection1FieldMark2.
  ///
  /// In fr, this message translates to:
  /// **'Tri 400V : 16A ≈ 11 kW | 32A ≈ 22 kW | 63A ≈ 44 kW'**
  String get elecSection1FieldMark2;

  /// No description provided for @elecSection2Title.
  ///
  /// In fr, this message translates to:
  /// **'2) Connecteurs (Schuko / P17 / PowerCON)'**
  String get elecSection2Title;

  /// No description provided for @elecSection2SchukoTitle.
  ///
  /// In fr, this message translates to:
  /// **'Schuko (prises domestiques)'**
  String get elecSection2SchukoTitle;

  /// No description provided for @elecSection2SchukoBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Typiquement 16A max (≈ 3,7 kW à 230V).'**
  String get elecSection2SchukoBullet1;

  /// No description provided for @elecSection2SchukoBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Attention aux multiprises et rallonges : échauffement possible.'**
  String get elecSection2SchukoBullet2;

  /// No description provided for @elecSection2P17Title.
  ///
  /// In fr, this message translates to:
  /// **'P17 / CEE (bleu/rouge)'**
  String get elecSection2P17Title;

  /// No description provided for @elecSection2P17Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Bleu : 230V mono (camping, petit distro).'**
  String get elecSection2P17Bullet1;

  /// No description provided for @elecSection2P17Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Rouge : 400V tri (distro, grandes puissances).'**
  String get elecSection2P17Bullet2;

  /// No description provided for @elecSection2PowerconTitle.
  ///
  /// In fr, this message translates to:
  /// **'PowerCON (audio/éclairage)'**
  String get elecSection2PowerconTitle;

  /// No description provided for @elecSection2PowerconBullet1.
  ///
  /// In fr, this message translates to:
  /// **'PowerCON TRUE1 = plus \"terrain\" (verrouillage, IP).'**
  String get elecSection2PowerconBullet1;

  /// No description provided for @elecSection2PowerconBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Vérifie la section de câble et les protections.'**
  String get elecSection2PowerconBullet2;

  /// No description provided for @elecSection3Title.
  ///
  /// In fr, this message translates to:
  /// **'3) Mono / Tri (ce que ça change)'**
  String get elecSection3Title;

  /// No description provided for @elecSection3Paragraph.
  ///
  /// In fr, this message translates to:
  /// **'Mono = une phase + neutre (230V). Tri = 3 phases (400V entre phases).'**
  String get elecSection3Paragraph;

  /// No description provided for @elecSection3PitfallsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Pièges fréquents'**
  String get elecSection3PitfallsTitle;

  /// No description provided for @elecSection3Pitfall1.
  ///
  /// In fr, this message translates to:
  /// **'Déséquilibre des phases (une phase surcharge).'**
  String get elecSection3Pitfall1;

  /// No description provided for @elecSection3Pitfall2.
  ///
  /// In fr, this message translates to:
  /// **'Neutre qui chauffe si grosses harmoniques (LED, dimmers).'**
  String get elecSection3Pitfall2;

  /// No description provided for @elecSection3Pitfall3.
  ///
  /// In fr, this message translates to:
  /// **'Terre absente/douteuse sur certains sites.'**
  String get elecSection3Pitfall3;

  /// No description provided for @elecSection3MethodTitle.
  ///
  /// In fr, this message translates to:
  /// **'Méthode simple'**
  String get elecSection3MethodTitle;

  /// No description provided for @elecSection3MethodBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Répartis les grosses charges sur L1/L2/L3.'**
  String get elecSection3MethodBullet1;

  /// No description provided for @elecSection3MethodBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Surveille le neutre si beaucoup de LED.'**
  String get elecSection3MethodBullet2;

  /// No description provided for @elecSection3MethodBullet3.
  ///
  /// In fr, this message translates to:
  /// **'Mesure au clamp si possible.'**
  String get elecSection3MethodBullet3;

  /// No description provided for @elecSection4Title.
  ///
  /// In fr, this message translates to:
  /// **'4) Table rapide (16A → 400A)'**
  String get elecSection4Title;

  /// No description provided for @elecSection4MonoTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mono 230V (≈ U×I)'**
  String get elecSection4MonoTitle;

  /// No description provided for @elecSection4MonoCode.
  ///
  /// In fr, this message translates to:
  /// **'16A ≈ 3,7 kW\n32A ≈ 7,4 kW\n63A ≈ 14,5 kW\n125A ≈ 28,8 kW\n200A ≈ 46 kW\n'**
  String get elecSection4MonoCode;

  /// No description provided for @elecSection4TriTitle.
  ///
  /// In fr, this message translates to:
  /// **'Tri 400V (≈ √3×U×I)'**
  String get elecSection4TriTitle;

  /// No description provided for @elecSection4TriCode.
  ///
  /// In fr, this message translates to:
  /// **'16A ≈ 11 kW\n32A ≈ 22 kW\n63A ≈ 44 kW\n125A ≈ 86 kW\n200A ≈ 138 kW\n400A ≈ 277 kW\n'**
  String get elecSection4TriCode;

  /// No description provided for @elecSection4ImportantTitle.
  ///
  /// In fr, this message translates to:
  /// **'Important'**
  String get elecSection4ImportantTitle;

  /// No description provided for @elecSection4ImportantBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Ce sont des ordres de grandeur (cosφ, harmoniques, pertes).'**
  String get elecSection4ImportantBullet1;

  /// No description provided for @elecSection4ImportantBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Toujours valider protections + sections + température.'**
  String get elecSection4ImportantBullet2;

  /// No description provided for @elecSection5Title.
  ///
  /// In fr, this message translates to:
  /// **'6) Sécurité & pièges terrain'**
  String get elecSection5Title;

  /// No description provided for @elecSection5DontDoTitle.
  ///
  /// In fr, this message translates to:
  /// **'À ne pas faire'**
  String get elecSection5DontDoTitle;

  /// No description provided for @elecSection5DontDoBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Chainer multiprises / rallonges en vrac.'**
  String get elecSection5DontDoBullet1;

  /// No description provided for @elecSection5DontDoBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Mélanger des phases sans savoir.'**
  String get elecSection5DontDoBullet2;

  /// No description provided for @elecSection5DontDoBullet3.
  ///
  /// In fr, this message translates to:
  /// **'\"Bridger\" une terre douteuse.'**
  String get elecSection5DontDoBullet3;

  /// No description provided for @elecSection5WarningTitle.
  ///
  /// In fr, this message translates to:
  /// **'Signaux d’alerte'**
  String get elecSection5WarningTitle;

  /// No description provided for @elecSection5WarningBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Odeur de chaud, prises tièdes, déclenchements répétés.'**
  String get elecSection5WarningBullet1;

  /// No description provided for @elecSection5WarningBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Tension qui chute (brown-out).'**
  String get elecSection5WarningBullet2;

  /// No description provided for @elecSection5WarningBullet3.
  ///
  /// In fr, this message translates to:
  /// **'Disjoncteur \"fatigué\" ou inadapté.'**
  String get elecSection5WarningBullet3;

  /// No description provided for @elecSection6Title.
  ///
  /// In fr, this message translates to:
  /// **'6) Checklist'**
  String get elecSection6Title;

  /// No description provided for @elecSection6QuickTitle.
  ///
  /// In fr, this message translates to:
  /// **'Rapide'**
  String get elecSection6QuickTitle;

  /// No description provided for @elecSection6Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Type d’alim dispo (mono/tri) + calibre (A).'**
  String get elecSection6Bullet1;

  /// No description provided for @elecSection6Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Répartition phases (charges principales).'**
  String get elecSection6Bullet2;

  /// No description provided for @elecSection6Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Protections (diff/disj) et état du tableau.'**
  String get elecSection6Bullet3;

  /// No description provided for @elecSection6Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Câbles : section / longueur / échauffement.'**
  String get elecSection6Bullet4;

  /// No description provided for @elecSection6Bullet5.
  ///
  /// In fr, this message translates to:
  /// **'Terre : OK ? (testeur si possible).'**
  String get elecSection6Bullet5;

  /// No description provided for @elecFooterNote.
  ///
  /// In fr, this message translates to:
  /// **'Note : ce contenu est un aide-mémoire terrain. Sur un site réel, respecte toujours les normes, les prescriptions du lieu et les protections en place.'**
  String get elecFooterNote;

  /// No description provided for @infoPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Informatique — repères terrain'**
  String get infoPageTitle;

  /// No description provided for @infoUsbTitle.
  ///
  /// In fr, this message translates to:
  /// **'1) USB / USB-C / Thunderbolt'**
  String get infoUsbTitle;

  /// No description provided for @infoStorageTitle.
  ///
  /// In fr, this message translates to:
  /// **'2) Stockage (SATA / NVMe / SSD)'**
  String get infoStorageTitle;

  /// No description provided for @infoVideoLinksTitle.
  ///
  /// In fr, this message translates to:
  /// **'3) Liaisons vidéo (DP / HDMI)'**
  String get infoVideoLinksTitle;

  /// No description provided for @infoPcieGpuTitle.
  ///
  /// In fr, this message translates to:
  /// **'4) PCIe / GPU (repères)'**
  String get infoPcieGpuTitle;

  /// No description provided for @infoChecklistTitle.
  ///
  /// In fr, this message translates to:
  /// **'5) Checklist (plateau)'**
  String get infoChecklistTitle;

  /// No description provided for @infoSummaryCopy.
  ///
  /// In fr, this message translates to:
  /// **'INFO — repères terrain\n• USB-C = forme, pas vitesse : vérifier la norme.\n• NVMe (M.2) bien plus rapide que SATA.\n• DisplayPort/HDMI = standards, attention versions/câbles.\n• Sur serveurs vidéo : stockage + GPU + débit sont la base.'**
  String get infoSummaryCopy;

  /// No description provided for @infoChecklistCopy.
  ///
  /// In fr, this message translates to:
  /// **'INFO — Checklist\n☐ Câbles USB-C certifiés (data/vidéo si besoin)\n☐ Stockage adapté (NVMe si gros flux)\n☐ Drivers GPU stables (version connue)\n☐ Test résolution/FPS réels\n☐ Éviter adaptateurs cheap'**
  String get infoChecklistCopy;

  /// No description provided for @infoUsbCriticalTitle.
  ///
  /// In fr, this message translates to:
  /// **'Point critique'**
  String get infoUsbCriticalTitle;

  /// No description provided for @infoUsbCriticalBullet1.
  ///
  /// In fr, this message translates to:
  /// **'USB-C = connecteur (forme). Ça ne dit pas la vitesse.'**
  String get infoUsbCriticalBullet1;

  /// No description provided for @infoUsbCriticalBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Un câble USB-C peut être \"charge only\" et ne pas passer la data/vidéo.'**
  String get infoUsbCriticalBullet2;

  /// No description provided for @infoUsbSpeedTitle.
  ///
  /// In fr, this message translates to:
  /// **'Repères vitesses (ordre de grandeur)'**
  String get infoUsbSpeedTitle;

  /// No description provided for @infoUsbSpeedBullet1.
  ///
  /// In fr, this message translates to:
  /// **'USB 2.0 : lent (claviers, dongles, petits périph).'**
  String get infoUsbSpeedBullet1;

  /// No description provided for @infoUsbSpeedBullet2.
  ///
  /// In fr, this message translates to:
  /// **'USB 3.x : beaucoup plus rapide (disques, interfaces).'**
  String get infoUsbSpeedBullet2;

  /// No description provided for @infoUsbSpeedBullet3.
  ///
  /// In fr, this message translates to:
  /// **'USB4 / Thunderbolt : très haut débit (dock, eGPU, vidéo selon matériel).'**
  String get infoUsbSpeedBullet3;

  /// No description provided for @infoUsbParagraph.
  ///
  /// In fr, this message translates to:
  /// **'En show : si un périphérique \"déconne\", suspecte le câble (qualité/standard) avant le device.'**
  String get infoUsbParagraph;

  /// No description provided for @infoStorageSataNvmeTitle.
  ///
  /// In fr, this message translates to:
  /// **'SATA vs NVMe'**
  String get infoStorageSataNvmeTitle;

  /// No description provided for @infoStorageSataNvmeBullet1.
  ///
  /// In fr, this message translates to:
  /// **'SSD SATA : bon et stable, mais limité (interface ancienne).'**
  String get infoStorageSataNvmeBullet1;

  /// No description provided for @infoStorageSataNvmeBullet2.
  ///
  /// In fr, this message translates to:
  /// **'SSD NVMe (M.2) : bien plus rapide (idéal pour serveurs média, gros fichiers).'**
  String get infoStorageSataNvmeBullet2;

  /// No description provided for @infoStorageFieldTitle.
  ///
  /// In fr, this message translates to:
  /// **'Terrain vidéo'**
  String get infoStorageFieldTitle;

  /// No description provided for @infoStorageFieldBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Lecture de gros fichiers 4K/ProRes → NVMe recommandé.'**
  String get infoStorageFieldBullet1;

  /// No description provided for @infoStorageFieldBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Attention à la température : un NVMe peut throttler (ralentir) si ça chauffe.'**
  String get infoStorageFieldBullet2;

  /// No description provided for @infoStorageFieldBullet3.
  ///
  /// In fr, this message translates to:
  /// **'Toujours tester en conditions réelles avant le show.'**
  String get infoStorageFieldBullet3;

  /// No description provided for @infoVideoLinksImportantTitle.
  ///
  /// In fr, this message translates to:
  /// **'Repère important'**
  String get infoVideoLinksImportantTitle;

  /// No description provided for @infoVideoLinksImportantBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Les versions comptent : câble + port + device doivent être compatibles.'**
  String get infoVideoLinksImportantBullet1;

  /// No description provided for @infoVideoLinksImportantBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Longue distance = convertisseurs actifs / fibre souvent nécessaires.'**
  String get infoVideoLinksImportantBullet2;

  /// No description provided for @infoVideoLinksCompareTitle.
  ///
  /// In fr, this message translates to:
  /// **'DP vs HDMI (très simplifié)'**
  String get infoVideoLinksCompareTitle;

  /// No description provided for @infoVideoLinksCompareBullet1.
  ///
  /// In fr, this message translates to:
  /// **'HDMI : omniprésent (TV, processors), mais EDID/HDCP peuvent gêner.'**
  String get infoVideoLinksCompareBullet1;

  /// No description provided for @infoVideoLinksCompareBullet2.
  ///
  /// In fr, this message translates to:
  /// **'DisplayPort : très courant PC, souvent très \"capable\" en débit.'**
  String get infoVideoLinksCompareBullet2;

  /// No description provided for @infoPcieGpuParagraph.
  ///
  /// In fr, this message translates to:
  /// **'Pour les serveurs vidéo / mapping : GPU + bus + drivers = stabilité. Les problèmes typiques : drivers, câbles, conversion, et limitations de sorties.'**
  String get infoPcieGpuParagraph;

  /// No description provided for @infoPcieGpuFieldTitle.
  ///
  /// In fr, this message translates to:
  /// **'Terrain'**
  String get infoPcieGpuFieldTitle;

  /// No description provided for @infoPcieGpuFieldBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Bloquer une version de driver stable avant un gros show.'**
  String get infoPcieGpuFieldBullet1;

  /// No description provided for @infoPcieGpuFieldBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Éviter les adaptateurs \"cheap\".'**
  String get infoPcieGpuFieldBullet2;

  /// No description provided for @infoPcieGpuFieldBullet3.
  ///
  /// In fr, this message translates to:
  /// **'Tester à la résolution/FPS réels du show.'**
  String get infoPcieGpuFieldBullet3;

  /// No description provided for @infoChecklistQuickTitle.
  ///
  /// In fr, this message translates to:
  /// **'Rapide'**
  String get infoChecklistQuickTitle;

  /// No description provided for @infoChecklistBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Câble/standard correct.'**
  String get infoChecklistBullet1;

  /// No description provided for @infoChecklistBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Stockage adapté au flux.'**
  String get infoChecklistBullet2;

  /// No description provided for @infoChecklistBullet3.
  ///
  /// In fr, this message translates to:
  /// **'Drivers stables.'**
  String get infoChecklistBullet3;

  /// No description provided for @infoChecklistBullet4.
  ///
  /// In fr, this message translates to:
  /// **'Test réel avant show.'**
  String get infoChecklistBullet4;

  /// No description provided for @infoChecklistBullet5.
  ///
  /// In fr, this message translates to:
  /// **'Éviter adaptateurs cheap.'**
  String get infoChecklistBullet5;

  /// No description provided for @infoFooterNote.
  ///
  /// In fr, this message translates to:
  /// **'Info indicative (terrain). Les capacités exactes varient selon matériel/versions.\nObjectif : repères simples + méthode fiable.'**
  String get infoFooterNote;

  /// No description provided for @ipBasicsPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réseau — bases IP / masque / DHCP (essentiel)'**
  String get ipBasicsPageTitle;

  /// No description provided for @ipBasicsCopyMemoTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Copier mémo'**
  String get ipBasicsCopyMemoTooltip;

  /// No description provided for @ipBasicsCopyChecklistTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Copier la checklist'**
  String get ipBasicsCopyChecklistTooltip;

  /// No description provided for @ipBasicsMemo1.
  ///
  /// In fr, this message translates to:
  /// **'IP = adresse logique pour joindre un appareil sur un réseau.'**
  String get ipBasicsMemo1;

  /// No description provided for @ipBasicsMemo2.
  ///
  /// In fr, this message translates to:
  /// **'Privé (LAN) : 10.x.x.x, 172.16–31.x.x, 192.168.x.x (non routés sur Internet).'**
  String get ipBasicsMemo2;

  /// No description provided for @ipBasicsMemo3.
  ///
  /// In fr, this message translates to:
  /// **'Masque / sous-réseau = dit quelle partie est \"réseau\" vs \"machine\".'**
  String get ipBasicsMemo3;

  /// No description provided for @ipBasicsMemo4.
  ///
  /// In fr, this message translates to:
  /// **'Même sous-réseau = communication directe. Sinon → passerelle (routeur).'**
  String get ipBasicsMemo4;

  /// No description provided for @ipBasicsMemo5.
  ///
  /// In fr, this message translates to:
  /// **'DHCP attribue IP automatiquement; statique = utile pour nodes/console.'**
  String get ipBasicsMemo5;

  /// No description provided for @ipBasicsToc1.
  ///
  /// In fr, this message translates to:
  /// **'1) C’est quoi une IP et à quoi ça sert ?'**
  String get ipBasicsToc1;

  /// No description provided for @ipBasicsToc2.
  ///
  /// In fr, this message translates to:
  /// **'2) Pourquoi 192.x / 10.x / 172.x ? (adresses privées)'**
  String get ipBasicsToc2;

  /// No description provided for @ipBasicsToc3.
  ///
  /// In fr, this message translates to:
  /// **'3) Masque & sous-réseaux : comprendre pour de vrai'**
  String get ipBasicsToc3;

  /// No description provided for @ipBasicsToc4.
  ///
  /// In fr, this message translates to:
  /// **'4) DHCP, passerelle, DNS : qui fait quoi ?'**
  String get ipBasicsToc4;

  /// No description provided for @ipBasicsToc5.
  ///
  /// In fr, this message translates to:
  /// **'5) Comment deux appareils se parlent (LAN vs hors LAN)'**
  String get ipBasicsToc5;

  /// No description provided for @ipBasicsToc6.
  ///
  /// In fr, this message translates to:
  /// **'6) Plans IP \"show\" simples (exemples prêts à copier)'**
  String get ipBasicsToc6;

  /// No description provided for @ipBasicsToc7.
  ///
  /// In fr, this message translates to:
  /// **'7) Dépannage : symptômes → causes (méthode terrain)'**
  String get ipBasicsToc7;

  /// No description provided for @ipBasicsToc8.
  ///
  /// In fr, this message translates to:
  /// **'8) Mini-exercices (vérifier vite un masque / un réseau)'**
  String get ipBasicsToc8;

  /// No description provided for @ipBasicsToc9.
  ///
  /// In fr, this message translates to:
  /// **'9) Checklist rapide'**
  String get ipBasicsToc9;

  /// No description provided for @ipBasicsSection1Paragraph.
  ///
  /// In fr, this message translates to:
  /// **'Une adresse IP (IPv4) est un identifiant logique sur un réseau. Elle permet de dire : \"envoie ce paquet à cet appareil\".\n\nQuand tu branches une console, un node Art-Net/sACN, un PC, un switch géré… tout ce qui parle en réseau doit avoir une IP cohérente pour que les appareils se trouvent.'**
  String get ipBasicsSection1Paragraph;

  /// No description provided for @ipBasicsSection1CalloutTitle.
  ///
  /// In fr, this message translates to:
  /// **'Image mentale'**
  String get ipBasicsSection1CalloutTitle;

  /// No description provided for @ipBasicsSection1Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'MAC = identifiant matériel (carte réseau).'**
  String get ipBasicsSection1Bullet1;

  /// No description provided for @ipBasicsSection1Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'IP = adresse \"postale\" sur un réseau (changeable).'**
  String get ipBasicsSection1Bullet2;

  /// No description provided for @ipBasicsSection1Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Masque = \"quartier / code postal\" (délimite le sous-réseau).'**
  String get ipBasicsSection1Bullet3;

  /// No description provided for @ipBasicsSection1Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Passerelle = \"sortie du quartier\" (routeur).'**
  String get ipBasicsSection1Bullet4;

  /// No description provided for @ipBasicsSection1Subtitle.
  ///
  /// In fr, this message translates to:
  /// **'IPv4 en 10 secondes'**
  String get ipBasicsSection1Subtitle;

  /// No description provided for @ipBasicsSection1SubBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Format : A.B.C.D (4 nombres de 0 à 255).'**
  String get ipBasicsSection1SubBullet1;

  /// No description provided for @ipBasicsSection1SubBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Ex : 192.168.0.50'**
  String get ipBasicsSection1SubBullet2;

  /// No description provided for @ipBasicsSection1SubBullet3.
  ///
  /// In fr, this message translates to:
  /// **'Ce n’est pas magique : ce sont 32 bits (4 octets).'**
  String get ipBasicsSection1SubBullet3;

  /// No description provided for @ipBasicsSection1SubBullet4.
  ///
  /// In fr, this message translates to:
  /// **'Ce qui compte pour toi : IP + masque doivent être cohérents entre appareils.'**
  String get ipBasicsSection1SubBullet4;

  /// No description provided for @ipBasicsSection2Paragraph.
  ///
  /// In fr, this message translates to:
  /// **'Certaines plages d’adresses IPv4 sont réservées aux réseaux privés (LAN). Elles ne sont pas routées sur Internet. C’est pour ça qu’on les utilise en show : tu peux faire ton réseau local sans \"consommer\" des IP publiques.'**
  String get ipBasicsSection2Paragraph;

  /// No description provided for @ipBasicsSection2CalloutTitle.
  ///
  /// In fr, this message translates to:
  /// **'Les 3 grandes plages privées (LAN)'**
  String get ipBasicsSection2CalloutTitle;

  /// No description provided for @ipBasicsSection2Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'10.0.0.0 → 10.255.255.255 (souvent écrit \"10.x.x.x\")'**
  String get ipBasicsSection2Bullet1;

  /// No description provided for @ipBasicsSection2Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'172.16.0.0 → 172.31.255.255 (souvent \"172.16–31.x.x\")'**
  String get ipBasicsSection2Bullet2;

  /// No description provided for @ipBasicsSection2Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'192.168.0.0 → 192.168.255.255 (souvent \"192.168.x.x\")'**
  String get ipBasicsSection2Bullet3;

  /// No description provided for @ipBasicsSection2Subtitle1.
  ///
  /// In fr, this message translates to:
  /// **'Pourquoi on voit souvent 192.168.x.x ?'**
  String get ipBasicsSection2Subtitle1;

  /// No description provided for @ipBasicsSection2SubBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Les box/routeurs grand public utilisent souvent 192.168.0.x ou 192.168.1.x.'**
  String get ipBasicsSection2SubBullet1;

  /// No description provided for @ipBasicsSection2SubBullet2.
  ///
  /// In fr, this message translates to:
  /// **'C’est devenu un \"standard de fait\" en petits LAN.'**
  String get ipBasicsSection2SubBullet2;

  /// No description provided for @ipBasicsSection2SubBullet3.
  ///
  /// In fr, this message translates to:
  /// **'Mais en show, 10.x.x.x est pratique si tu veux beaucoup d’adresses ou plusieurs VLAN.'**
  String get ipBasicsSection2SubBullet3;

  /// No description provided for @ipBasicsSection2Subtitle2.
  ///
  /// In fr, this message translates to:
  /// **'Et le fameux 2.x.x.x (Art-Net) ?'**
  String get ipBasicsSection2Subtitle2;

  /// No description provided for @ipBasicsSection2SubBullet4.
  ///
  /// In fr, this message translates to:
  /// **'Beaucoup de matériel Art-Net sort d’usine avec une IP en 2.x.x.x (réseau fermé).'**
  String get ipBasicsSection2SubBullet4;

  /// No description provided for @ipBasicsSection2SubBullet5.
  ///
  /// In fr, this message translates to:
  /// **'C’est \"pratique\" en plug&play (sans DHCP), mais ça surprend si ton PC est en 192.168.x.x.'**
  String get ipBasicsSection2SubBullet5;

  /// No description provided for @ipBasicsSection2SubBullet6.
  ///
  /// In fr, this message translates to:
  /// **'Important : le \"2.x\" n’a rien de magique pour le broadcast/unicast.'**
  String get ipBasicsSection2SubBullet6;

  /// No description provided for @ipBasicsSection2SubBullet7.
  ///
  /// In fr, this message translates to:
  /// **'Ce qui change le périmètre du broadcast, c’est le masque (souvent /8 = 255.0.0.0 en legacy).'**
  String get ipBasicsSection2SubBullet7;

  /// No description provided for @ipBasicsSection2SubBullet8.
  ///
  /// In fr, this message translates to:
  /// **'Exemple : réseau 2.0.0.0/8 → broadcast = 2.255.255.255 (très large).'**
  String get ipBasicsSection2SubBullet8;

  /// No description provided for @ipBasicsSection2SubBullet9.
  ///
  /// In fr, this message translates to:
  /// **'Solution simple : mettre PC/console dans la même plage + même masque, ou reconfigurer le node sur un plan 192/10.'**
  String get ipBasicsSection2SubBullet9;

  /// No description provided for @ipBasicsSection3Paragraph.
  ///
  /// In fr, this message translates to:
  /// **'Le masque (subnet mask) dit quelles adresses sont \"dans le même réseau\". Sans masque, une IP ne veut pas dire grand-chose.\n\nRègle terrain : si deux appareils sont dans le même sous-réseau, ils se parlent directement. Sinon, ils ont besoin d’une passerelle (routeur).'**
  String get ipBasicsSection3Paragraph;

  /// No description provided for @ipBasicsSection3Callout1Title.
  ///
  /// In fr, this message translates to:
  /// **'Masques les plus courants'**
  String get ipBasicsSection3Callout1Title;

  /// No description provided for @ipBasicsSection3Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'255.0.0.0 ( /8 )   → réseau 10.x.x.x typique \"large\"'**
  String get ipBasicsSection3Bullet1;

  /// No description provided for @ipBasicsSection3Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'255.255.0.0 ( /16 ) → réseau 10.10.x.x ou 192.168.x.x \"large\"'**
  String get ipBasicsSection3Bullet2;

  /// No description provided for @ipBasicsSection3Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'255.255.255.0 ( /24 ) → réseau 192.168.0.x \"classique\" (254 appareils)'**
  String get ipBasicsSection3Bullet3;

  /// No description provided for @ipBasicsSection3Callout2Title.
  ///
  /// In fr, this message translates to:
  /// **'Masque → adresse de broadcast (très utile à comprendre)'**
  String get ipBasicsSection3Callout2Title;

  /// No description provided for @ipBasicsSection3Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Le broadcast dépend du sous-réseau, donc du masque (pas de \"2 vs 192\").'**
  String get ipBasicsSection3Bullet4;

  /// No description provided for @ipBasicsSection3Bullet5.
  ///
  /// In fr, this message translates to:
  /// **'192.168.10.0/24 → broadcast = 192.168.10.255 (petit réseau).'**
  String get ipBasicsSection3Bullet5;

  /// No description provided for @ipBasicsSection3Bullet6.
  ///
  /// In fr, this message translates to:
  /// **'2.0.0.0/8 (255.0.0.0) → broadcast = 2.255.255.255 (réseau énorme).'**
  String get ipBasicsSection3Bullet6;

  /// No description provided for @ipBasicsSection3Bullet7.
  ///
  /// In fr, this message translates to:
  /// **'Plus le réseau est \"grand\", plus un broadcast peut faire du bruit (si tu l’utilises souvent).'**
  String get ipBasicsSection3Bullet7;

  /// No description provided for @ipBasicsSection3Subtitle1.
  ///
  /// In fr, this message translates to:
  /// **'Exemple concret (le plus utile) : /24'**
  String get ipBasicsSection3Subtitle1;

  /// No description provided for @ipBasicsSection3SubBullet1.
  ///
  /// In fr, this message translates to:
  /// **'IP : 192.168.0.50'**
  String get ipBasicsSection3SubBullet1;

  /// No description provided for @ipBasicsSection3SubBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Masque : 255.255.255.0 ( /24 )'**
  String get ipBasicsSection3SubBullet2;

  /// No description provided for @ipBasicsSection3SubBullet3.
  ///
  /// In fr, this message translates to:
  /// **'Réseau : 192.168.0.0'**
  String get ipBasicsSection3SubBullet3;

  /// No description provided for @ipBasicsSection3SubBullet4.
  ///
  /// In fr, this message translates to:
  /// **'Appareils \"dans le même réseau\" : 192.168.0.1 → 192.168.0.254'**
  String get ipBasicsSection3SubBullet4;

  /// No description provided for @ipBasicsSection3SubBullet5.
  ///
  /// In fr, this message translates to:
  /// **'Si tu passes en 192.168.1.50 → ce n’est PLUS le même réseau.'**
  String get ipBasicsSection3SubBullet5;

  /// No description provided for @ipBasicsSection3Subtitle2.
  ///
  /// In fr, this message translates to:
  /// **'Pourquoi faire des sous-réseaux ?'**
  String get ipBasicsSection3Subtitle2;

  /// No description provided for @ipBasicsSection3SubBullet6.
  ///
  /// In fr, this message translates to:
  /// **'Organisation : séparer \"lumière\", \"vidéo\", \"intercom\", \"internet\"…'**
  String get ipBasicsSection3SubBullet6;

  /// No description provided for @ipBasicsSection3SubBullet7.
  ///
  /// In fr, this message translates to:
  /// **'Performance : limiter le bruit (broadcast/multicast) à un groupe.'**
  String get ipBasicsSection3SubBullet7;

  /// No description provided for @ipBasicsSection3SubBullet8.
  ///
  /// In fr, this message translates to:
  /// **'Sécurité : éviter qu’un PC \"invité\" voie/perturbe le réseau show.'**
  String get ipBasicsSection3SubBullet8;

  /// No description provided for @ipBasicsSection3SubBullet9.
  ///
  /// In fr, this message translates to:
  /// **'Diagnostic : plus simple de savoir \"où\" est un appareil.'**
  String get ipBasicsSection3SubBullet9;

  /// No description provided for @ipBasicsSection3Callout3Title.
  ///
  /// In fr, this message translates to:
  /// **'Piège classique'**
  String get ipBasicsSection3Callout3Title;

  /// No description provided for @ipBasicsSection3Bullet8.
  ///
  /// In fr, this message translates to:
  /// **'Même \"début\" d’IP ≠ même réseau si le masque n’est pas identique.'**
  String get ipBasicsSection3Bullet8;

  /// No description provided for @ipBasicsSection3Bullet9.
  ///
  /// In fr, this message translates to:
  /// **'Ex : 10.0.0.5/8 et 10.0.0.200/24 → pas le même périmètre logique.'**
  String get ipBasicsSection3Bullet9;

  /// No description provided for @ipBasicsSection4Subtitle1.
  ///
  /// In fr, this message translates to:
  /// **'DHCP (attribution automatique)'**
  String get ipBasicsSection4Subtitle1;

  /// No description provided for @ipBasicsSection4SubBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Un serveur DHCP \"donne\" : IP + masque + passerelle + DNS.'**
  String get ipBasicsSection4SubBullet1;

  /// No description provided for @ipBasicsSection4SubBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Pratique : tu branches, ça marche.'**
  String get ipBasicsSection4SubBullet2;

  /// No description provided for @ipBasicsSection4SubBullet3.
  ///
  /// In fr, this message translates to:
  /// **'Risque show : si le DHCP tombe / change / conflit → symptômes bizarres.'**
  String get ipBasicsSection4SubBullet3;

  /// No description provided for @ipBasicsSection4Subtitle2.
  ///
  /// In fr, this message translates to:
  /// **'Statique (IP fixe)'**
  String get ipBasicsSection4Subtitle2;

  /// No description provided for @ipBasicsSection4SubBullet4.
  ///
  /// In fr, this message translates to:
  /// **'Tu définis IP + masque (et éventuellement passerelle/DNS).'**
  String get ipBasicsSection4SubBullet4;

  /// No description provided for @ipBasicsSection4SubBullet5.
  ///
  /// In fr, this message translates to:
  /// **'Très utile pour : console, nodes, switch géré, AP Wi-Fi show.'**
  String get ipBasicsSection4SubBullet5;

  /// No description provided for @ipBasicsSection4SubBullet6.
  ///
  /// In fr, this message translates to:
  /// **'Risque : doublon d’IP si plan pas clair (conflit).'**
  String get ipBasicsSection4SubBullet6;

  /// No description provided for @ipBasicsSection4Callout1Title.
  ///
  /// In fr, this message translates to:
  /// **'Passerelle (gateway)'**
  String get ipBasicsSection4Callout1Title;

  /// No description provided for @ipBasicsSection4Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'C’est l’adresse du routeur : elle sert pour aller \"hors du réseau local\".'**
  String get ipBasicsSection4Bullet1;

  /// No description provided for @ipBasicsSection4Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Si tu fais un réseau show isolé (sans Internet) → passerelle souvent inutile.'**
  String get ipBasicsSection4Bullet2;

  /// No description provided for @ipBasicsSection4Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Mais si tu veux sortir vers un autre VLAN / Internet → indispensable.'**
  String get ipBasicsSection4Bullet3;

  /// No description provided for @ipBasicsSection4Callout2Title.
  ///
  /// In fr, this message translates to:
  /// **'DNS'**
  String get ipBasicsSection4Callout2Title;

  /// No description provided for @ipBasicsSection4Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'DNS = \"annuaire\" : transforme un nom (ex: example.com) en IP.'**
  String get ipBasicsSection4Bullet4;

  /// No description provided for @ipBasicsSection4Bullet5.
  ///
  /// In fr, this message translates to:
  /// **'En show (Art-Net/sACN), souvent inutile : tu travailles en IP direct.'**
  String get ipBasicsSection4Bullet5;

  /// No description provided for @ipBasicsSection4Bullet6.
  ///
  /// In fr, this message translates to:
  /// **'Si tu utilises des services (MAJ, licences, time server, streaming) → DNS redevient utile.'**
  String get ipBasicsSection4Bullet6;

  /// No description provided for @ipBasicsSection4Subtitle3.
  ///
  /// In fr, this message translates to:
  /// **'Règle simple (débutant-friendly)'**
  String get ipBasicsSection4Subtitle3;

  /// No description provided for @ipBasicsSection4SubBullet7.
  ///
  /// In fr, this message translates to:
  /// **'Petit show fermé : statique partout, pas de passerelle, pas de DNS.'**
  String get ipBasicsSection4SubBullet7;

  /// No description provided for @ipBasicsSection4SubBullet8.
  ///
  /// In fr, this message translates to:
  /// **'Show avec Internet / plusieurs réseaux : DHCP contrôlé + réservations DHCP, ou plan statique + routeur.'**
  String get ipBasicsSection4SubBullet8;

  /// No description provided for @ipBasicsSection5Paragraph.
  ///
  /// In fr, this message translates to:
  /// **'Quand A veut parler à B, il regarde le masque :\n• Si B est dans le même sous-réseau → A envoie directement sur le réseau local.\n• Si B est hors sous-réseau → A envoie à la passerelle (routeur), qui s’occupe du reste.'**
  String get ipBasicsSection5Paragraph;

  /// No description provided for @ipBasicsSection5Callout1Title.
  ///
  /// In fr, this message translates to:
  /// **'Exemple (facile)'**
  String get ipBasicsSection5Callout1Title;

  /// No description provided for @ipBasicsSection5Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'A = 192.168.0.10 /24'**
  String get ipBasicsSection5Bullet1;

  /// No description provided for @ipBasicsSection5Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'B = 192.168.0.50 /24 → même réseau → OK direct.'**
  String get ipBasicsSection5Bullet2;

  /// No description provided for @ipBasicsSection5Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'B = 192.168.1.50 /24 → réseau différent → besoin routeur/passerelle.'**
  String get ipBasicsSection5Bullet3;

  /// No description provided for @ipBasicsSection5Subtitle.
  ///
  /// In fr, this message translates to:
  /// **'Pourquoi ça \"ping\" pas ?'**
  String get ipBasicsSection5Subtitle;

  /// No description provided for @ipBasicsSection5SubBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Masque différent → A pense que B est \"ailleurs\" (ou inversement).'**
  String get ipBasicsSection5SubBullet1;

  /// No description provided for @ipBasicsSection5SubBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Pas de passerelle → impossible de sortir du sous-réseau.'**
  String get ipBasicsSection5SubBullet2;

  /// No description provided for @ipBasicsSection5SubBullet3.
  ///
  /// In fr, this message translates to:
  /// **'Pare-feu PC → ping bloqué (Windows très fréquent).'**
  String get ipBasicsSection5SubBullet3;

  /// No description provided for @ipBasicsSection5SubBullet4.
  ///
  /// In fr, this message translates to:
  /// **'Câble / switch / VLAN : physiquement pas dans le même segment.'**
  String get ipBasicsSection5SubBullet4;

  /// No description provided for @ipBasicsSection5Callout2Title.
  ///
  /// In fr, this message translates to:
  /// **'Broadcast vs unicast (bonus utile)'**
  String get ipBasicsSection5Callout2Title;

  /// No description provided for @ipBasicsSection5Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Unicast : vers une IP précise (propre).'**
  String get ipBasicsSection5Bullet4;

  /// No description provided for @ipBasicsSection5Bullet5.
  ///
  /// In fr, this message translates to:
  /// **'Broadcast : \"à tous\" sur le sous-réseau (bruyant).'**
  String get ipBasicsSection5Bullet5;

  /// No description provided for @ipBasicsSection5Bullet6.
  ///
  /// In fr, this message translates to:
  /// **'En show : broadcast peut marcher en petit, mais devient vite source de bruit en gros réseau.'**
  String get ipBasicsSection5Bullet6;

  /// No description provided for @ipBasicsSection6Subtitle1.
  ///
  /// In fr, this message translates to:
  /// **'Plan A — ultra simple (un seul réseau /24)'**
  String get ipBasicsSection6Subtitle1;

  /// No description provided for @ipBasicsSection6Code1.
  ///
  /// In fr, this message translates to:
  /// **'Réseau : 192.168.10.0/24   (masque 255.255.255.0)\n\nConsole : 192.168.10.10\nPC (contrôle) : 192.168.10.20\nNode 1 : 192.168.10.101\nNode 2 : 192.168.10.102\nSwitch géré : 192.168.10.2\nPasserelle : (vide) ou 192.168.10.1 si routeur présent'**
  String get ipBasicsSection6Code1;

  /// No description provided for @ipBasicsSection6Callout1Title.
  ///
  /// In fr, this message translates to:
  /// **'Pourquoi ça marche bien'**
  String get ipBasicsSection6Callout1Title;

  /// No description provided for @ipBasicsSection6Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Tout le monde dans le même sous-réseau → aucune surprise.'**
  String get ipBasicsSection6Bullet1;

  /// No description provided for @ipBasicsSection6Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Facile à expliquer, facile à dépanner.'**
  String get ipBasicsSection6Bullet2;

  /// No description provided for @ipBasicsSection6Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Idéal débutant / petit à moyen show.'**
  String get ipBasicsSection6Bullet3;

  /// No description provided for @ipBasicsSection6Subtitle2.
  ///
  /// In fr, this message translates to:
  /// **'Plan B — \"10.x\" quand tu veux grandir'**
  String get ipBasicsSection6Subtitle2;

  /// No description provided for @ipBasicsSection6Code2.
  ///
  /// In fr, this message translates to:
  /// **'Réseau : 10.10.0.0/16   (masque 255.255.0.0)\n\nConsole : 10.10.0.10\nPC : 10.10.0.20\nNodes : 10.10.1.10 → 10.10.1.200\nSwitch : 10.10.0.2'**
  String get ipBasicsSection6Code2;

  /// No description provided for @ipBasicsSection6Callout2Title.
  ///
  /// In fr, this message translates to:
  /// **'Quand l’utiliser'**
  String get ipBasicsSection6Callout2Title;

  /// No description provided for @ipBasicsSection6Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Quand tu as beaucoup d’équipements (ou plusieurs zones).'**
  String get ipBasicsSection6Bullet4;

  /// No description provided for @ipBasicsSection6Bullet5.
  ///
  /// In fr, this message translates to:
  /// **'Quand tu prévois VLAN plus tard (lumière/vidéo/IT).'**
  String get ipBasicsSection6Bullet5;

  /// No description provided for @ipBasicsSection6Subtitle3.
  ///
  /// In fr, this message translates to:
  /// **'Plan C — compat Art-Net \"2.x.x.x\" (legacy)'**
  String get ipBasicsSection6Subtitle3;

  /// No description provided for @ipBasicsSection6Code3.
  ///
  /// In fr, this message translates to:
  /// **'Réseau : 2.0.0.0/8   (masque 255.0.0.0)\n\nPC/console : 2.0.0.10\nNode 1 : 2.0.0.100\nNode 2 : 2.0.0.101\n\n⚠️ Réseau isolé, pas d’Internet, pas de routage.'**
  String get ipBasicsSection6Code3;

  /// No description provided for @ipBasicsSection6Callout3Title.
  ///
  /// In fr, this message translates to:
  /// **'Attention'**
  String get ipBasicsSection6Callout3Title;

  /// No description provided for @ipBasicsSection6Bullet6.
  ///
  /// In fr, this message translates to:
  /// **'Ce plan est pratique pour du matériel ancien / par défaut.'**
  String get ipBasicsSection6Bullet6;

  /// No description provided for @ipBasicsSection6Bullet7.
  ///
  /// In fr, this message translates to:
  /// **'Mais évite de mélanger avec un LAN \"normal\" (192.168.x.x) sans routeur.'**
  String get ipBasicsSection6Bullet7;

  /// No description provided for @ipBasicsSection7Callout1Title.
  ///
  /// In fr, this message translates to:
  /// **'Symptômes → causes probables'**
  String get ipBasicsSection7Callout1Title;

  /// No description provided for @ipBasicsSection7Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'\"Je vois le node mais ça répond pas\" → masque différent / VLAN / pare-feu.'**
  String get ipBasicsSection7Bullet1;

  /// No description provided for @ipBasicsSection7Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'\"Un appareil marche puis disparaît\" → DHCP instable / conflit d’IP.'**
  String get ipBasicsSection7Bullet2;

  /// No description provided for @ipBasicsSection7Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'\"Rien ne marche sauf sur le switch\" → IP pas dans le même réseau / mauvais câble / port VLAN.'**
  String get ipBasicsSection7Bullet3;

  /// No description provided for @ipBasicsSection7Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'\"Tout rame / pertes\" → broadcast/multicast trop large / switch bas de gamme / boucle réseau.'**
  String get ipBasicsSection7Bullet4;

  /// No description provided for @ipBasicsSection7Bullet5.
  ///
  /// In fr, this message translates to:
  /// **'\"Ça marche en filaire mais pas en Wi-Fi\" → jitter / roaming / bande saturée / power saving.'**
  String get ipBasicsSection7Bullet5;

  /// No description provided for @ipBasicsSection7Subtitle.
  ///
  /// In fr, this message translates to:
  /// **'Méthode pro en 5 minutes'**
  String get ipBasicsSection7Subtitle;

  /// No description provided for @ipBasicsSection7SubBullet1.
  ///
  /// In fr, this message translates to:
  /// **'1) Regarder IP + masque de la console/PC et du node.'**
  String get ipBasicsSection7SubBullet1;

  /// No description provided for @ipBasicsSection7SubBullet2.
  ///
  /// In fr, this message translates to:
  /// **'2) Vérifier : même sous-réseau ? (ex: 192.168.10.x /24)'**
  String get ipBasicsSection7SubBullet2;

  /// No description provided for @ipBasicsSection7SubBullet3.
  ///
  /// In fr, this message translates to:
  /// **'3) Ping (si possible) + test d’accès interface web du node.'**
  String get ipBasicsSection7SubBullet3;

  /// No description provided for @ipBasicsSection7SubBullet4.
  ///
  /// In fr, this message translates to:
  /// **'4) Si DHCP : lister qui a quelle IP (table DHCP) et vérifier doublons.'**
  String get ipBasicsSection7SubBullet4;

  /// No description provided for @ipBasicsSection7SubBullet5.
  ///
  /// In fr, this message translates to:
  /// **'5) Si sACN multicast : vérifier IGMP snooping/querier (sinon flood).'**
  String get ipBasicsSection7SubBullet5;

  /// No description provided for @ipBasicsSection7Callout2Title.
  ///
  /// In fr, this message translates to:
  /// **'Piège très fréquent'**
  String get ipBasicsSection7Callout2Title;

  /// No description provided for @ipBasicsSection7Bullet6.
  ///
  /// In fr, this message translates to:
  /// **'Masque \"hérité\" sur un PC (255.255.0.0 au lieu de 255.255.255.0).'**
  String get ipBasicsSection7Bullet6;

  /// No description provided for @ipBasicsSection7Bullet7.
  ///
  /// In fr, this message translates to:
  /// **'Résultat : tu crois être \"dans le même réseau\", mais pas comme l’autre appareil.'**
  String get ipBasicsSection7Bullet7;

  /// No description provided for @ipBasicsSection8Subtitle1.
  ///
  /// In fr, this message translates to:
  /// **'Exercice 1 : même réseau ou pas ? (/24)'**
  String get ipBasicsSection8Subtitle1;

  /// No description provided for @ipBasicsSection8SubBullet1.
  ///
  /// In fr, this message translates to:
  /// **'A = 192.168.10.50 /24'**
  String get ipBasicsSection8SubBullet1;

  /// No description provided for @ipBasicsSection8SubBullet2.
  ///
  /// In fr, this message translates to:
  /// **'B = 192.168.10.200 /24 → ✅ même réseau'**
  String get ipBasicsSection8SubBullet2;

  /// No description provided for @ipBasicsSection8SubBullet3.
  ///
  /// In fr, this message translates to:
  /// **'B = 192.168.11.200 /24 → ❌ pas le même réseau'**
  String get ipBasicsSection8SubBullet3;

  /// No description provided for @ipBasicsSection8Subtitle2.
  ///
  /// In fr, this message translates to:
  /// **'Exercice 2 : /16 (255.255.0.0)'**
  String get ipBasicsSection8Subtitle2;

  /// No description provided for @ipBasicsSection8SubBullet4.
  ///
  /// In fr, this message translates to:
  /// **'A = 10.10.5.10 /16'**
  String get ipBasicsSection8SubBullet4;

  /// No description provided for @ipBasicsSection8SubBullet5.
  ///
  /// In fr, this message translates to:
  /// **'B = 10.10.200.20 /16 → ✅ même réseau (10.10.x.x)'**
  String get ipBasicsSection8SubBullet5;

  /// No description provided for @ipBasicsSection8SubBullet6.
  ///
  /// In fr, this message translates to:
  /// **'B = 10.11.200.20 /16 → ❌ pas le même réseau'**
  String get ipBasicsSection8SubBullet6;

  /// No description provided for @ipBasicsSection8CalloutTitle.
  ///
  /// In fr, this message translates to:
  /// **'Astuce visuelle'**
  String get ipBasicsSection8CalloutTitle;

  /// No description provided for @ipBasicsSection8Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'/24 → les 3 premiers nombres identiques (A.B.C) = même réseau.'**
  String get ipBasicsSection8Bullet1;

  /// No description provided for @ipBasicsSection8Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'/16 → les 2 premiers nombres identiques (A.B) = même réseau.'**
  String get ipBasicsSection8Bullet2;

  /// No description provided for @ipBasicsSection8Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'/8 → le 1er nombre identique (A) = même réseau.'**
  String get ipBasicsSection8Bullet3;

  /// No description provided for @ipBasicsSection8Subtitle3.
  ///
  /// In fr, this message translates to:
  /// **'Exercice 3 : éviter les IP \"bizarres\"'**
  String get ipBasicsSection8Subtitle3;

  /// No description provided for @ipBasicsSection8SubBullet7.
  ///
  /// In fr, this message translates to:
  /// **'0.x.x.x : réservé (pas une IP normale d’hôte).'**
  String get ipBasicsSection8SubBullet7;

  /// No description provided for @ipBasicsSection8SubBullet8.
  ///
  /// In fr, this message translates to:
  /// **'127.x.x.x : loopback (ton PC lui-même).'**
  String get ipBasicsSection8SubBullet8;

  /// No description provided for @ipBasicsSection8SubBullet9.
  ///
  /// In fr, this message translates to:
  /// **'169.254.x.x : auto-IP quand DHCP absent (APIPA) → signe de problème DHCP.'**
  String get ipBasicsSection8SubBullet9;

  /// No description provided for @ipBasicsSection9CalloutTitle.
  ///
  /// In fr, this message translates to:
  /// **'Avant de chercher midi à 14h'**
  String get ipBasicsSection9CalloutTitle;

  /// No description provided for @ipBasicsSection9Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Même sous-réseau = IP + masque cohérents.'**
  String get ipBasicsSection9Bullet1;

  /// No description provided for @ipBasicsSection9Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Aucun doublon d’IP (conflit).'**
  String get ipBasicsSection9Bullet2;

  /// No description provided for @ipBasicsSection9Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'DHCP : OK si maîtrisé; sinon plan statique clair.'**
  String get ipBasicsSection9Bullet3;

  /// No description provided for @ipBasicsSection9Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Pare-feu PC : peut bloquer ping / discovery.'**
  String get ipBasicsSection9Bullet4;

  /// No description provided for @ipBasicsSection9Bullet5.
  ///
  /// In fr, this message translates to:
  /// **'Switch/VLAN : bon port, bon VLAN, pas de boucle.'**
  String get ipBasicsSection9Bullet5;

  /// No description provided for @ipBasicsSection9Bullet6.
  ///
  /// In fr, this message translates to:
  /// **'sACN multicast : IGMP snooping/querier recommandés.'**
  String get ipBasicsSection9Bullet6;

  /// No description provided for @ipBasicsChecklistCopy.
  ///
  /// In fr, this message translates to:
  /// **'Réseau — Checklist rapide (IP)\n☐ Tous les appareils sont dans le même sous-réseau (IP + masque cohérents)\n☐ Pas de doublon d’IP (conflit)\n☐ DHCP : soit tout le monde en DHCP, soit plan statique clair (éviter mélange flou)\n☐ Pour Art-Net/sACN : réseau dédié ou VLAN si possible\n☐ Switch géré si multicast/IGMP (sACN)\n☐ Wi-Fi : éviter pour data show critique (jitter), préférer filaire\n☐ Test simple : ping + vérifier masque/passerelle'**
  String get ipBasicsChecklistCopy;

  /// No description provided for @ipBasicsFooterNote.
  ///
  /// In fr, this message translates to:
  /// **'Objectif : comprendre assez pour câbler / config / dépanner vite en show.\nLes détails réseau peuvent être plus profonds, mais ces bases couvrent 90% des pannes terrain.'**
  String get ipBasicsFooterNote;

  /// No description provided for @aboutDmxPainterTerm120.
  ///
  /// In fr, this message translates to:
  /// **'TERM\n120Ω'**
  String get aboutDmxPainterTerm120;

  /// No description provided for @aboutDmxPainterDaisyChainNote.
  ///
  /// In fr, this message translates to:
  /// **'✅ Daisy-chain\n❌ Pas de Y passif'**
  String get aboutDmxPainterDaisyChainNote;

  /// No description provided for @aboutDmxPainterXlr5Title.
  ///
  /// In fr, this message translates to:
  /// **'XLR5 (DMX) — repère rapide'**
  String get aboutDmxPainterXlr5Title;

  /// No description provided for @aboutDmxPainterPin1.
  ///
  /// In fr, this message translates to:
  /// **'Pin 1 : Shield / masse'**
  String get aboutDmxPainterPin1;

  /// No description provided for @aboutDmxPainterPin2.
  ///
  /// In fr, this message translates to:
  /// **'Pin 2 : Data−'**
  String get aboutDmxPainterPin2;

  /// No description provided for @aboutDmxPainterPin3.
  ///
  /// In fr, this message translates to:
  /// **'Pin 3 : Data+'**
  String get aboutDmxPainterPin3;

  /// No description provided for @aboutDmxPainterPin45.
  ///
  /// In fr, this message translates to:
  /// **'Pin 4/5 : \"data 2\" (rare / optionnel)'**
  String get aboutDmxPainterPin45;

  /// No description provided for @aboutDmxPainterXlr3Practice.
  ///
  /// In fr, this message translates to:
  /// **'En pratique : XLR3 souvent utilisé (1/2/3)'**
  String get aboutDmxPainterXlr3Practice;

  /// No description provided for @aboutDmxPainterLastFixture.
  ///
  /// In fr, this message translates to:
  /// **'DERNIER\nAPPAREIL'**
  String get aboutDmxPainterLastFixture;

  /// No description provided for @aboutDmxPainterTerminationLine.
  ///
  /// In fr, this message translates to:
  /// **'Terminaison = 120Ω en fin de ligne'**
  String get aboutDmxPainterTerminationLine;

  /// No description provided for @aboutDmxPainter120Between.
  ///
  /// In fr, this message translates to:
  /// **'120Ω\nentre\nData− et Data+'**
  String get aboutDmxPainter120Between;

  /// No description provided for @aboutDmxPainterOneTermination.
  ///
  /// In fr, this message translates to:
  /// **'✅ Une seule terminaison\n❌ Pas au milieu\n❌ Pas sur chaque branche'**
  String get aboutDmxPainterOneTermination;

  /// No description provided for @aboutDmxPainterConsoleIp.
  ///
  /// In fr, this message translates to:
  /// **'CONSOLE\nArt-Net / sACN'**
  String get aboutDmxPainterConsoleIp;

  /// No description provided for @aboutDmxPainterSwitchSacn.
  ///
  /// In fr, this message translates to:
  /// **'SWITCH\n(IGMP pour sACN)'**
  String get aboutDmxPainterSwitchSacn;

  /// No description provided for @aboutDmxPainterNode1.
  ///
  /// In fr, this message translates to:
  /// **'NODE 1\nDMX OUT'**
  String get aboutDmxPainterNode1;

  /// No description provided for @aboutDmxPainterNode2.
  ///
  /// In fr, this message translates to:
  /// **'NODE 2\nDMX OUT'**
  String get aboutDmxPainterNode2;

  /// No description provided for @aboutDmxPainterFix.
  ///
  /// In fr, this message translates to:
  /// **'FIX'**
  String get aboutDmxPainterFix;

  /// No description provided for @aboutDmxPainterManyUniverses.
  ///
  /// In fr, this message translates to:
  /// **'✅ Beaucoup d’univers\n✅ Nodes proches des machines'**
  String get aboutDmxPainterManyUniverses;

  /// No description provided for @aboutArtnetSection2Paragraph.
  ///
  /// In fr, this message translates to:
  /// **'Ton objectif : que chaque univers émis par la source arrive au bon node (et au bon port DMX) sans ambiguïté. La plupart des pannes Art-Net = mauvais univers, mauvais subnet/net, ou broadcast qui sature.'**
  String get aboutArtnetSection2Paragraph;

  /// No description provided for @aboutArtnetSection2CalloutTitle.
  ///
  /// In fr, this message translates to:
  /// **'Méthode simple (qui évite 80% des erreurs)'**
  String get aboutArtnetSection2CalloutTitle;

  /// No description provided for @aboutArtnetSection2Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'1) Écris sur papier: \"Univers 1 → Node A port 1\", \"Univers 2 → Node A port 2\", etc.'**
  String get aboutArtnetSection2Bullet1;

  /// No description provided for @aboutArtnetSection2Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'2) Mets des IP stables (DHCP réservé ou statiques).'**
  String get aboutArtnetSection2Bullet2;

  /// No description provided for @aboutArtnetSection2Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'3) Préfère l’unicast si tu as plus d’un node ou un réseau partagé.'**
  String get aboutArtnetSection2Bullet3;

  /// No description provided for @aboutArtnetSection2Subtitle1.
  ///
  /// In fr, this message translates to:
  /// **'Broadcast vs Unicast'**
  String get aboutArtnetSection2Subtitle1;

  /// No description provided for @aboutArtnetSection2SubBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Broadcast : tu envoies à tout le monde → facile mais peut \"flood\" un switch.'**
  String get aboutArtnetSection2SubBullet1;

  /// No description provided for @aboutArtnetSection2SubBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Unicast : tu envoies vers l’IP du node → plus propre et prévisible.'**
  String get aboutArtnetSection2SubBullet2;

  /// No description provided for @aboutArtnetSection2SubBullet3.
  ///
  /// In fr, this message translates to:
  /// **'En show: si doute → unicast.'**
  String get aboutArtnetSection2SubBullet3;

  /// No description provided for @aboutArtnetSection2Subtitle2.
  ///
  /// In fr, this message translates to:
  /// **'Univers : pratique terrain'**
  String get aboutArtnetSection2Subtitle2;

  /// No description provided for @aboutArtnetSection2SubBullet4.
  ///
  /// In fr, this message translates to:
  /// **'Garde une numérotation simple (ex: 1…N).'**
  String get aboutArtnetSection2SubBullet4;

  /// No description provided for @aboutArtnetSection2SubBullet5.
  ///
  /// In fr, this message translates to:
  /// **'Évite \"un univers partout\" : documente tes mappings.'**
  String get aboutArtnetSection2SubBullet5;

  /// No description provided for @aboutArtnetSection2SubBullet6.
  ///
  /// In fr, this message translates to:
  /// **'Sur certains setups, \"Net/Subnet/Universe\" existent : pense \"mapping\", pas \"magie\".'**
  String get aboutArtnetSection2SubBullet6;

  /// No description provided for @aboutArtnetSection3CalloutTitle.
  ///
  /// In fr, this message translates to:
  /// **'Les limites \"réelles\" (dans l’ordre)'**
  String get aboutArtnetSection3CalloutTitle;

  /// No description provided for @aboutArtnetSection3Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Wi-Fi : latence variable + pertes → flicker ou décrochages.'**
  String get aboutArtnetSection3Bullet1;

  /// No description provided for @aboutArtnetSection3Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Broadcast : surcharge un LAN (tout le monde reçoit tout).'**
  String get aboutArtnetSection3Bullet2;

  /// No description provided for @aboutArtnetSection3Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Switch \"bas de gamme\" : buffers limités, gestion multicast/broadcast médiocre.'**
  String get aboutArtnetSection3Bullet3;

  /// No description provided for @aboutArtnetSection3Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Nodes : limite firmware/CPU (nb d’univers, fréquence, options).'**
  String get aboutArtnetSection3Bullet4;

  /// No description provided for @aboutArtnetSection3Bullet5.
  ///
  /// In fr, this message translates to:
  /// **'PC/source : driver, charge CPU, antivirus, carte réseau, etc.'**
  String get aboutArtnetSection3Bullet5;

  /// No description provided for @aboutArtnetSection3Subtitle1.
  ///
  /// In fr, this message translates to:
  /// **'Vitesse de refresh'**
  String get aboutArtnetSection3Subtitle1;

  /// No description provided for @aboutArtnetSection3SubBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Le DMX \"classique\" est souvent ~20–44 fps selon trame.'**
  String get aboutArtnetSection3SubBullet1;

  /// No description provided for @aboutArtnetSection3SubBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Sur IP, tu peux envoyer plus, mais les nodes ne suivent pas toujours (et ce n’est pas toujours utile).'**
  String get aboutArtnetSection3SubBullet2;

  /// No description provided for @aboutArtnetSection3SubBullet3.
  ///
  /// In fr, this message translates to:
  /// **'Stabilité > fréquence : mieux vaut stable à 30–40 fps que \"vite\" mais instable.'**
  String get aboutArtnetSection3SubBullet3;

  /// No description provided for @aboutArtnetSection3Subtitle2.
  ///
  /// In fr, this message translates to:
  /// **'Règles simples'**
  String get aboutArtnetSection3Subtitle2;

  /// No description provided for @aboutArtnetSection3SubBullet4.
  ///
  /// In fr, this message translates to:
  /// **'Réseau dédié (ou VLAN).'**
  String get aboutArtnetSection3SubBullet4;

  /// No description provided for @aboutArtnetSection3SubBullet5.
  ///
  /// In fr, this message translates to:
  /// **'Unicast si plusieurs nodes.'**
  String get aboutArtnetSection3SubBullet5;

  /// No description provided for @aboutArtnetSection3SubBullet6.
  ///
  /// In fr, this message translates to:
  /// **'Filaire pour les shows critiques.'**
  String get aboutArtnetSection3SubBullet6;

  /// No description provided for @aboutArtnetSection4Paragraph.
  ///
  /// In fr, this message translates to:
  /// **'Un node = IP → DMX. Il peut avoir 1, 2, 4, 8 ports DMX. La stabilité dépend du node ET du câblage DMX côté sortie (terminaison, topologie, splitters).'**
  String get aboutArtnetSection4Paragraph;

  /// No description provided for @aboutArtnetSection4Subtitle1.
  ///
  /// In fr, this message translates to:
  /// **'Nodes vs Splitters'**
  String get aboutArtnetSection4Subtitle1;

  /// No description provided for @aboutArtnetSection4SubBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Node : convertit IP→DMX (et parfois DMX→IP).'**
  String get aboutArtnetSection4SubBullet1;

  /// No description provided for @aboutArtnetSection4SubBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Splitter DMX : distribue une ligne DMX en branches (opto conseillé).'**
  String get aboutArtnetSection4SubBullet2;

  /// No description provided for @aboutArtnetSection4SubBullet3.
  ///
  /// In fr, this message translates to:
  /// **'Bon design : IP jusqu’au plus près, puis DMX court et propre.'**
  String get aboutArtnetSection4SubBullet3;

  /// No description provided for @aboutArtnetSection4CalloutTitle.
  ///
  /// In fr, this message translates to:
  /// **'RDM sur Art-Net (support variable)'**
  String get aboutArtnetSection4CalloutTitle;

  /// No description provided for @aboutArtnetSection4Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Certains nodes supportent un \"RDM proxy\" : la console voit/configure les appareils RDM via IP.'**
  String get aboutArtnetSection4Bullet1;

  /// No description provided for @aboutArtnetSection4Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'D’autres ne supportent RDM du tout, ou partiellement.'**
  String get aboutArtnetSection4Bullet2;

  /// No description provided for @aboutArtnetSection4Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Un splitter opto \"classique\" peut bloquer le retour RDM (selon modèle).'**
  String get aboutArtnetSection4Bullet3;

  /// No description provided for @aboutArtnetSection4Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Conseil: si tu veux RDM, choisis explicitement du matériel marqué RDM compatible.'**
  String get aboutArtnetSection4Bullet4;

  /// No description provided for @aboutArtnetSection4Subtitle2.
  ///
  /// In fr, this message translates to:
  /// **'Bon réflexe terrain'**
  String get aboutArtnetSection4Subtitle2;

  /// No description provided for @aboutArtnetSection4SubBullet4.
  ///
  /// In fr, this message translates to:
  /// **'Si DMX instable : règle DMX d’abord (terminaison, câble, Y passif) puis seulement IP.'**
  String get aboutArtnetSection4SubBullet4;

  /// No description provided for @aboutArtnetSection4SubBullet5.
  ///
  /// In fr, this message translates to:
  /// **'Si RDM instable : désactive RDM pour vérifier que le DMX pur est stable.'**
  String get aboutArtnetSection4SubBullet5;

  /// No description provided for @aboutArtnetSection5CalloutTitle.
  ///
  /// In fr, this message translates to:
  /// **'Symptômes → causes probables'**
  String get aboutArtnetSection5CalloutTitle;

  /// No description provided for @aboutArtnetSection5Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Flicker sur tout le plateau → Wi-Fi, broadcast flood, switch saturé.'**
  String get aboutArtnetSection5Bullet1;

  /// No description provided for @aboutArtnetSection5Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Un node OK, l’autre non → univers/mapping, IP, unicast mal configuré.'**
  String get aboutArtnetSection5Bullet2;

  /// No description provided for @aboutArtnetSection5Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Décrochages aléatoires → câble RJ45 défectueux, switch instable, PC qui droppe des paquets.'**
  String get aboutArtnetSection5Bullet3;

  /// No description provided for @aboutArtnetSection5Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Un seul port DMX d’un node KO → câble DMX, terminaison, appareil qui casse la ligne.'**
  String get aboutArtnetSection5Bullet4;

  /// No description provided for @aboutArtnetSection5Bullet5.
  ///
  /// In fr, this message translates to:
  /// **'RDM discovery impossible → node/splitter non compatible RDM, câblage DMX \"borderline\".'**
  String get aboutArtnetSection5Bullet5;

  /// No description provided for @aboutArtnetSection5Subtitle.
  ///
  /// In fr, this message translates to:
  /// **'Méthode rapide'**
  String get aboutArtnetSection5Subtitle;

  /// No description provided for @aboutArtnetSection5SubBullet1.
  ///
  /// In fr, this message translates to:
  /// **'1) Passe en unicast vers un seul node (test simple).'**
  String get aboutArtnetSection5SubBullet1;

  /// No description provided for @aboutArtnetSection5SubBullet2.
  ///
  /// In fr, this message translates to:
  /// **'2) Vérifie univers/mapping (papier + node config).'**
  String get aboutArtnetSection5SubBullet2;

  /// No description provided for @aboutArtnetSection5SubBullet3.
  ///
  /// In fr, this message translates to:
  /// **'3) Test en filaire direct (PC → switch → node) avec câble connu OK.'**
  String get aboutArtnetSection5SubBullet3;

  /// No description provided for @aboutArtnetSection5SubBullet4.
  ///
  /// In fr, this message translates to:
  /// **'4) Isole le DMX : node → 1 appareil + terminaison.'**
  String get aboutArtnetSection5SubBullet4;

  /// No description provided for @aboutArtnetSection6Subtitle1.
  ///
  /// In fr, this message translates to:
  /// **'Architecture propre (IP → nodes → DMX court)'**
  String get aboutArtnetSection6Subtitle1;

  /// No description provided for @aboutArtnetSection6Subtitle2.
  ///
  /// In fr, this message translates to:
  /// **'Broadcast vs Unicast (idée)'**
  String get aboutArtnetSection6Subtitle2;

  /// No description provided for @aboutArtnetAssetsCopyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Assets recommandés (optionnels)'**
  String get aboutArtnetAssetsCopyTitle;

  /// No description provided for @aboutArtnetExampleLabel.
  ///
  /// In fr, this message translates to:
  /// **'exemple'**
  String get aboutArtnetExampleLabel;

  /// No description provided for @aboutArtnetAssetsCopyTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Copier liste assets'**
  String get aboutArtnetAssetsCopyTooltip;

  /// No description provided for @aboutArtnetAssetsParagraph.
  ///
  /// In fr, this message translates to:
  /// **'Section prévue pour illustrer le réseau (RJ45, switch, câbles). Si les assets n’existent pas, l’app affiche un fallback propre.'**
  String get aboutArtnetAssetsParagraph;

  /// No description provided for @aboutArtnetAssetsExamplesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Exemples'**
  String get aboutArtnetAssetsExamplesTitle;

  /// No description provided for @aboutArtnetAssetsRj45Label.
  ///
  /// In fr, this message translates to:
  /// **'RJ45'**
  String get aboutArtnetAssetsRj45Label;

  /// No description provided for @aboutArtnetAssetsRj45Hint.
  ///
  /// In fr, this message translates to:
  /// **'Connecteur Ethernet'**
  String get aboutArtnetAssetsRj45Hint;

  /// No description provided for @aboutArtnetAssetsSwitchLabel.
  ///
  /// In fr, this message translates to:
  /// **'Switch'**
  String get aboutArtnetAssetsSwitchLabel;

  /// No description provided for @aboutArtnetAssetsSwitchHint.
  ///
  /// In fr, this message translates to:
  /// **'Switch (idéalement géré si IGMP/VLAN)'**
  String get aboutArtnetAssetsSwitchHint;

  /// No description provided for @aboutArtnetAssetsCableLabel.
  ///
  /// In fr, this message translates to:
  /// **'Câble Ethernet'**
  String get aboutArtnetAssetsCableLabel;

  /// No description provided for @aboutArtnetAssetsCableHint.
  ///
  /// In fr, this message translates to:
  /// **'Cat5e/Cat6 = base fiable'**
  String get aboutArtnetAssetsCableHint;

  /// No description provided for @aboutArtnetChecklistCopyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Art-Net — Checklist terrain'**
  String get aboutArtnetChecklistCopyTitle;

  /// No description provided for @aboutArtnetChecklistCopyTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Copier la checklist'**
  String get aboutArtnetChecklistCopyTooltip;

  /// No description provided for @aboutArtnetChecklistTitle.
  ///
  /// In fr, this message translates to:
  /// **'Avant de paniquer'**
  String get aboutArtnetChecklistTitle;

  /// No description provided for @aboutArtnetChecklistBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Unicast si plusieurs nodes.'**
  String get aboutArtnetChecklistBullet1;

  /// No description provided for @aboutArtnetChecklistBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Réseau dédié (ou VLAN) si possible.'**
  String get aboutArtnetChecklistBullet2;

  /// No description provided for @aboutArtnetChecklistBullet3.
  ///
  /// In fr, this message translates to:
  /// **'Filaire pour show critique.'**
  String get aboutArtnetChecklistBullet3;

  /// No description provided for @aboutArtnetChecklistBullet4.
  ///
  /// In fr, this message translates to:
  /// **'Univers/mapping documentés.'**
  String get aboutArtnetChecklistBullet4;

  /// No description provided for @aboutArtnetChecklistBullet5.
  ///
  /// In fr, this message translates to:
  /// **'Test IP simple → 1 node → 1 appareil + terminaison.'**
  String get aboutArtnetChecklistBullet5;

  /// No description provided for @aboutArtnetChecklistBullet6.
  ///
  /// In fr, this message translates to:
  /// **'Si RDM: node \"RDM proxy\" confirmé + câblage DMX stable'**
  String get aboutArtnetChecklistBullet6;

  /// No description provided for @aboutArtnetFooterNote.
  ///
  /// In fr, this message translates to:
  /// **'Info indicative (terrain). Selon nodes/switch/firmwares, le comportement peut varier.\nObjectif ici : comprendre et diagnostiquer vite.'**
  String get aboutArtnetFooterNote;

  /// No description provided for @aboutArtnetDiagramSourceLabel.
  ///
  /// In fr, this message translates to:
  /// **'SOURCE\n(PC/console)'**
  String get aboutArtnetDiagramSourceLabel;

  /// No description provided for @aboutArtnetDiagramSwitchLabel.
  ///
  /// In fr, this message translates to:
  /// **'SWITCH'**
  String get aboutArtnetDiagramSwitchLabel;

  /// No description provided for @aboutArtnetDiagramNode1Label.
  ///
  /// In fr, this message translates to:
  /// **'NODE 1\nDMX OUT'**
  String get aboutArtnetDiagramNode1Label;

  /// No description provided for @aboutArtnetDiagramNode2Label.
  ///
  /// In fr, this message translates to:
  /// **'NODE 2\nDMX OUT'**
  String get aboutArtnetDiagramNode2Label;

  /// No description provided for @aboutArtnetDiagramFixLabel.
  ///
  /// In fr, this message translates to:
  /// **'FIX'**
  String get aboutArtnetDiagramFixLabel;

  /// No description provided for @aboutArtnetDiagramInfoLabel.
  ///
  /// In fr, this message translates to:
  /// **'IP long / DMX court'**
  String get aboutArtnetDiagramInfoLabel;

  /// No description provided for @aboutArtnetDiagramSourceShortLabel.
  ///
  /// In fr, this message translates to:
  /// **'SOURCE'**
  String get aboutArtnetDiagramSourceShortLabel;

  /// No description provided for @aboutArtnetDiagramNodeALabel.
  ///
  /// In fr, this message translates to:
  /// **'NODE A'**
  String get aboutArtnetDiagramNodeALabel;

  /// No description provided for @aboutArtnetDiagramNodeBLabel.
  ///
  /// In fr, this message translates to:
  /// **'NODE B'**
  String get aboutArtnetDiagramNodeBLabel;

  /// No description provided for @aboutArtnetDiagramNodeCLabel.
  ///
  /// In fr, this message translates to:
  /// **'NODE C'**
  String get aboutArtnetDiagramNodeCLabel;

  /// No description provided for @aboutArtnetDiagramUnicastLabel.
  ///
  /// In fr, this message translates to:
  /// **'Unicast: paquets vers un node'**
  String get aboutArtnetDiagramUnicastLabel;

  /// No description provided for @aboutArtnetDiagramBroadcastLabel.
  ///
  /// In fr, this message translates to:
  /// **'Broadcast: tout le monde reçoit'**
  String get aboutArtnetDiagramBroadcastLabel;

  /// No description provided for @aboutArtnetMissingAssetLabel.
  ///
  /// In fr, this message translates to:
  /// **'Asset manquant'**
  String get aboutArtnetMissingAssetLabel;

  /// No description provided for @aboutRegistryDmxTitle.
  ///
  /// In fr, this message translates to:
  /// **'DMX — fonctionnement (simple & complet)'**
  String get aboutRegistryDmxTitle;

  /// No description provided for @aboutRegistryDmxSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Univers, adresses, trames, câblage RS-485, terminaison, erreurs terrain.\nInclut schémas + checklist.'**
  String get aboutRegistryDmxSubtitle;

  /// No description provided for @aboutRegistryArtnetTitle.
  ///
  /// In fr, this message translates to:
  /// **'Art-Net — DMX sur IP (nodes, unicast/broadcast)'**
  String get aboutRegistryArtnetTitle;

  /// No description provided for @aboutRegistryArtnetSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Univers DMX sur Ethernet/UDP, nodes, broadcast vs unicast.\nLimites réelles, stabilité réseau, RDM selon matériel, schémas + checklist.'**
  String get aboutRegistryArtnetSubtitle;

  /// No description provided for @aboutRegistrySacnTitle.
  ///
  /// In fr, this message translates to:
  /// **'sACN / E1.31 — multicast, IGMP, priorités'**
  String get aboutRegistrySacnTitle;

  /// No description provided for @aboutRegistrySacnSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Standard DMX sur IP orienté réseau pro.\nMulticast/unicast, IGMP snooping/querier, priorités multi-sources, schémas + checklist.'**
  String get aboutRegistrySacnSubtitle;

  /// No description provided for @aboutRegistryIpBasicsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réseau — bases IP / masque / DHCP (essentiel)'**
  String get aboutRegistryIpBasicsTitle;

  /// No description provided for @aboutRegistryIpBasicsSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Comprendre IP, masque, passerelle, DHCP vs statique.\nExemples concrets (2.x.x.x, 10.x, 192.168.x), tests rapides, pièges show.'**
  String get aboutRegistryIpBasicsSubtitle;

  /// No description provided for @aboutRegistryReseauTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réseau — RJ45 / Fibre / débits & longueurs'**
  String get aboutRegistryReseauTitle;

  /// No description provided for @aboutRegistryReseauSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Cat5e→Cat8, fibre OM3/OM4/OS2, LC/SC/MPO, distances typiques, bonnes pratiques show.'**
  String get aboutRegistryReseauSubtitle;

  /// No description provided for @aboutRegistryNetworkTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réseau lumière — VLAN, IGMP, Wi-Fi vs filaire'**
  String get aboutRegistryNetworkTitle;

  /// No description provided for @aboutRegistryNetworkSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Architecture simple et robuste pour Art-Net/sACN.\nVLAN, IGMP snooping/querier, Wi-Fi (jitter), switchs, schémas + checklist.'**
  String get aboutRegistryNetworkSubtitle;

  /// No description provided for @aboutRegistryVideoTitle.
  ///
  /// In fr, this message translates to:
  /// **'Vidéo — SDI / NDI / IP (SRT/RTMP)'**
  String get aboutRegistryVideoTitle;

  /// No description provided for @aboutRegistryVideoSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Choisir selon latence, fiabilité, câblage, réseau LAN vs WAN.\nTableaux + schéma.'**
  String get aboutRegistryVideoSubtitle;

  /// No description provided for @aboutRegistryElectriciteTitle.
  ///
  /// In fr, this message translates to:
  /// **'Électrique — Schuko / P17 / puissances'**
  String get aboutRegistryElectriciteTitle;

  /// No description provided for @aboutRegistryElectriciteSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Connecteurs, mono/tri, tableaux kW rapides (16A→400A), pièges terrain.'**
  String get aboutRegistryElectriciteSubtitle;

  /// No description provided for @aboutRegistryInformatiqueTitle.
  ///
  /// In fr, this message translates to:
  /// **'Informatique — USB / HDMI / DP / SATA / NVMe…'**
  String get aboutRegistryInformatiqueTitle;

  /// No description provided for @aboutRegistryInformatiqueSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Débits utiles, versions, limites réelles, pièges marketing.'**
  String get aboutRegistryInformatiqueSubtitle;

  /// No description provided for @aboutUniverseToHexColHex.
  ///
  /// In fr, this message translates to:
  /// **'Hex'**
  String get aboutUniverseToHexColHex;

  /// No description provided for @aboutUniverseToHexNote.
  ///
  /// In fr, this message translates to:
  /// **'Index = Univers − 1 (base 0).'**
  String get aboutUniverseToHexNote;

  /// No description provided for @aboutNetworkPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réseau lumière — VLAN, IGMP, Wi-Fi'**
  String get aboutNetworkPageTitle;

  /// No description provided for @aboutNetworkCopyTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Copier repères'**
  String get aboutNetworkCopyTooltip;

  /// No description provided for @aboutNetworkChecklistCopyTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Copier'**
  String get aboutNetworkChecklistCopyTooltip;

  /// No description provided for @aboutNetworkChecklistTitle.
  ///
  /// In fr, this message translates to:
  /// **'Avant d’ouvrir Wireshark 😄'**
  String get aboutNetworkChecklistTitle;

  /// No description provided for @aboutNetworkFooterNote.
  ///
  /// In fr, this message translates to:
  /// **'Info indicative (terrain). Selon le matériel réseau, IGMP/VLAN peuvent être indispensables.\nObjectif : rester simple et robuste.'**
  String get aboutNetworkFooterNote;

  /// No description provided for @aboutNetworkCopy1.
  ///
  /// In fr, this message translates to:
  /// **'Réseau lumière: viser simple, dédié, et stable.'**
  String get aboutNetworkCopy1;

  /// No description provided for @aboutNetworkCopy2.
  ///
  /// In fr, this message translates to:
  /// **'VLAN = séparer le trafic (lumière vs reste).'**
  String get aboutNetworkCopy2;

  /// No description provided for @aboutNetworkCopy3.
  ///
  /// In fr, this message translates to:
  /// **'IGMP = indispensable si sACN multicast à grande échelle.'**
  String get aboutNetworkCopy3;

  /// No description provided for @aboutNetworkCopy4.
  ///
  /// In fr, this message translates to:
  /// **'Wi-Fi = ok dépannage, rarement ok en prod critique.'**
  String get aboutNetworkCopy4;

  /// No description provided for @aboutNetworkChecklistCopy.
  ///
  /// In fr, this message translates to:
  /// **'Réseau lumière — Checklist\n☐ Réseau dédié ou VLAN lumière\n☐ Plan IP clair (DHCP ou statique) + masque ok\n☐ Switch correct; boucles évitées\n☐ sACN multicast: IGMP snooping ON\n☐ IGMP querier présent dans le VLAN (si infra le nécessite)\n☐ Unicast en dépannage (surtout Art-Net)\n☐ Wi-Fi: éviter prod critique (jitter/pertes)\n☐ Tests: ping stable + charge progressive (univers)'**
  String get aboutNetworkChecklistCopy;

  /// No description provided for @aboutNetworkToc1.
  ///
  /// In fr, this message translates to:
  /// **'1) Objectif: réseau stable'**
  String get aboutNetworkToc1;

  /// No description provided for @aboutNetworkToc2.
  ///
  /// In fr, this message translates to:
  /// **'2) Plan IP (simple)'**
  String get aboutNetworkToc2;

  /// No description provided for @aboutNetworkToc3.
  ///
  /// In fr, this message translates to:
  /// **'3) VLAN (séparation)'**
  String get aboutNetworkToc3;

  /// No description provided for @aboutNetworkToc4.
  ///
  /// In fr, this message translates to:
  /// **'4) IGMP (sACN multicast)'**
  String get aboutNetworkToc4;

  /// No description provided for @aboutNetworkToc5.
  ///
  /// In fr, this message translates to:
  /// **'5) Wi-Fi vs filaire'**
  String get aboutNetworkToc5;

  /// No description provided for @aboutNetworkToc6.
  ///
  /// In fr, this message translates to:
  /// **'6) Switch: ce qu’il faut'**
  String get aboutNetworkToc6;

  /// No description provided for @aboutNetworkToc7.
  ///
  /// In fr, this message translates to:
  /// **'7) Schémas'**
  String get aboutNetworkToc7;

  /// No description provided for @aboutNetworkToc8.
  ///
  /// In fr, this message translates to:
  /// **'8) Checklist'**
  String get aboutNetworkToc8;

  /// No description provided for @aboutNetworkBasicsPill1.
  ///
  /// In fr, this message translates to:
  /// **'Dédié/VLAN'**
  String get aboutNetworkBasicsPill1;

  /// No description provided for @aboutNetworkBasicsPill2.
  ///
  /// In fr, this message translates to:
  /// **'Filaire'**
  String get aboutNetworkBasicsPill2;

  /// No description provided for @aboutNetworkBasicsPill3.
  ///
  /// In fr, this message translates to:
  /// **'IGMP si multicast'**
  String get aboutNetworkBasicsPill3;

  /// No description provided for @aboutNetworkBasicsParagraph.
  ///
  /// In fr, this message translates to:
  /// **'Un réseau lumière doit être prévisible: faible perte, faible jitter, architecture simple. Quand ça bug, c’est rarement \"le protocole\" et souvent l’infra (switch, Wi-Fi, boucles, flood).'**
  String get aboutNetworkBasicsParagraph;

  /// No description provided for @aboutNetworkBasicsCalloutTitle.
  ///
  /// In fr, this message translates to:
  /// **'Règle de base'**
  String get aboutNetworkBasicsCalloutTitle;

  /// No description provided for @aboutNetworkBasicsBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Si tu peux: filaire + switch correct + réseau dédié (ou VLAN).'**
  String get aboutNetworkBasicsBullet1;

  /// No description provided for @aboutNetworkBasicsBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Si tu dois partager: VLAN + règles claires.'**
  String get aboutNetworkBasicsBullet2;

  /// No description provided for @aboutNetworkBasicsBullet3.
  ///
  /// In fr, this message translates to:
  /// **'sACN multicast: IGMP devient vite obligatoire.'**
  String get aboutNetworkBasicsBullet3;

  /// No description provided for @aboutNetworkPlanIpParagraph.
  ///
  /// In fr, this message translates to:
  /// **'Choisis une stratégie simple et cohérente. Deux approches: DHCP (simple) ou statique (prévisible). Le pire: un mélange non documenté.'**
  String get aboutNetworkPlanIpParagraph;

  /// No description provided for @aboutNetworkPlanIpCalloutTitle.
  ///
  /// In fr, this message translates to:
  /// **'Exemple de plan (simple)'**
  String get aboutNetworkPlanIpCalloutTitle;

  /// No description provided for @aboutNetworkPlanIpBullet1.
  ///
  /// In fr, this message translates to:
  /// **'VLAN lumière: 10.10.0.0/24'**
  String get aboutNetworkPlanIpBullet1;

  /// No description provided for @aboutNetworkPlanIpBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Console/PC: 10.10.0.10'**
  String get aboutNetworkPlanIpBullet2;

  /// No description provided for @aboutNetworkPlanIpBullet3.
  ///
  /// In fr, this message translates to:
  /// **'Nodes: 10.10.0.100–150'**
  String get aboutNetworkPlanIpBullet3;

  /// No description provided for @aboutNetworkPlanIpBullet4.
  ///
  /// In fr, this message translates to:
  /// **'Switch mgmt: 10.10.0.2'**
  String get aboutNetworkPlanIpBullet4;

  /// No description provided for @aboutNetworkPlanIpSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Erreurs classiques'**
  String get aboutNetworkPlanIpSubtitle;

  /// No description provided for @aboutNetworkPlanIpSubBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Masque différent (ex: /24 vs /16) → machines invisibles.'**
  String get aboutNetworkPlanIpSubBullet1;

  /// No description provided for @aboutNetworkPlanIpSubBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Deux appareils même IP → comportement aléatoire.'**
  String get aboutNetworkPlanIpSubBullet2;

  /// No description provided for @aboutNetworkPlanIpSubBullet3.
  ///
  /// In fr, this message translates to:
  /// **'DHCP + statique sur même range sans contrôle → conflits.'**
  String get aboutNetworkPlanIpSubBullet3;

  /// No description provided for @aboutNetworkVlanParagraph.
  ///
  /// In fr, this message translates to:
  /// **'Un VLAN te permet d’isoler la lumière du reste (internet, production vidéo, invités…). Ça évite le bruit réseau et réduit le risque qu’un autre service casse ton show.'**
  String get aboutNetworkVlanParagraph;

  /// No description provided for @aboutNetworkVlanCalloutTitle.
  ///
  /// In fr, this message translates to:
  /// **'Ce que tu gagnes'**
  String get aboutNetworkVlanCalloutTitle;

  /// No description provided for @aboutNetworkVlanBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Moins de trafic parasite.'**
  String get aboutNetworkVlanBullet1;

  /// No description provided for @aboutNetworkVlanBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Moins de risques (DHCP externe, broadcast non désiré).'**
  String get aboutNetworkVlanBullet2;

  /// No description provided for @aboutNetworkVlanBullet3.
  ///
  /// In fr, this message translates to:
  /// **'Debug plus simple (tout ce qui est dans le VLAN = lumière).'**
  String get aboutNetworkVlanBullet3;

  /// No description provided for @aboutNetworkVlanSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Attention'**
  String get aboutNetworkVlanSubtitle;

  /// No description provided for @aboutNetworkVlanSubBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Un VLAN = il faut que tous les ports soient bien configurés (access/trunk).'**
  String get aboutNetworkVlanSubBullet1;

  /// No description provided for @aboutNetworkVlanSubBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Si tu ne maîtrises pas: réseau dédié \"physique\" est souvent plus simple.'**
  String get aboutNetworkVlanSubBullet2;

  /// No description provided for @aboutNetworkIgmpPill1.
  ///
  /// In fr, this message translates to:
  /// **'IGMP snooping'**
  String get aboutNetworkIgmpPill1;

  /// No description provided for @aboutNetworkIgmpPill2.
  ///
  /// In fr, this message translates to:
  /// **'IGMP querier'**
  String get aboutNetworkIgmpPill2;

  /// No description provided for @aboutNetworkIgmpPill3.
  ///
  /// In fr, this message translates to:
  /// **'Multicast flood'**
  String get aboutNetworkIgmpPill3;

  /// No description provided for @aboutNetworkIgmpParagraph.
  ///
  /// In fr, this message translates to:
  /// **'IGMP snooping permet au switch de savoir quels ports veulent quel multicast. Sans ça, le multicast peut être inondé sur tous les ports → saturation.'**
  String get aboutNetworkIgmpParagraph;

  /// No description provided for @aboutNetworkIgmpCalloutTitle.
  ///
  /// In fr, this message translates to:
  /// **'IGMP querier (idée simple)'**
  String get aboutNetworkIgmpCalloutTitle;

  /// No description provided for @aboutNetworkIgmpBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Dans certains réseaux/VLAN, il faut un querier pour maintenir les abonnements IGMP.'**
  String get aboutNetworkIgmpBullet1;

  /// No description provided for @aboutNetworkIgmpBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Sans querier: selon les switchs, les abonnements expirent et tu vois des \"glitches\".'**
  String get aboutNetworkIgmpBullet2;

  /// No description provided for @aboutNetworkIgmpBullet3.
  ///
  /// In fr, this message translates to:
  /// **'Si tu es en petit réseau dédié: parfois tout marche, mais en gros réseau: c’est critique.'**
  String get aboutNetworkIgmpBullet3;

  /// No description provided for @aboutNetworkIgmpSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Schéma : IGMP (idée)'**
  String get aboutNetworkIgmpSubtitle;

  /// No description provided for @aboutNetworkWifiSubtitle1.
  ///
  /// In fr, this message translates to:
  /// **'Filaire'**
  String get aboutNetworkWifiSubtitle1;

  /// No description provided for @aboutNetworkWifiSubtitle2.
  ///
  /// In fr, this message translates to:
  /// **'Wi-Fi'**
  String get aboutNetworkWifiSubtitle2;

  /// No description provided for @aboutNetworkWifiSubBullet1.
  ///
  /// In fr, this message translates to:
  /// **'✅ Latence stable, pertes faibles (si infra propre).'**
  String get aboutNetworkWifiSubBullet1;

  /// No description provided for @aboutNetworkWifiSubBullet2.
  ///
  /// In fr, this message translates to:
  /// **'✅ Recommandé en prod.'**
  String get aboutNetworkWifiSubBullet2;

  /// No description provided for @aboutNetworkWifiSubBullet3.
  ///
  /// In fr, this message translates to:
  /// **'✅ Pratique (setup rapide, tablette).'**
  String get aboutNetworkWifiSubBullet3;

  /// No description provided for @aboutNetworkWifiSubBullet4.
  ///
  /// In fr, this message translates to:
  /// **'❌ Latence variable (jitter), pertes, interférences.'**
  String get aboutNetworkWifiSubBullet4;

  /// No description provided for @aboutNetworkWifiSubBullet5.
  ///
  /// In fr, this message translates to:
  /// **'❌ Multicast parfois mal géré selon AP/config.'**
  String get aboutNetworkWifiSubBullet5;

  /// No description provided for @aboutNetworkWifiSubBullet6.
  ///
  /// In fr, this message translates to:
  /// **'OK dépannage / petites configs non critiques, rarement OK en show chargé.'**
  String get aboutNetworkWifiSubBullet6;

  /// No description provided for @aboutNetworkWifiCalloutTitle.
  ///
  /// In fr, this message translates to:
  /// **'Règle simple'**
  String get aboutNetworkWifiCalloutTitle;

  /// No description provided for @aboutNetworkWifiBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Show critique = filaire.'**
  String get aboutNetworkWifiBullet1;

  /// No description provided for @aboutNetworkWifiBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Wi-Fi = confort opérateur (UI), pas transport principal DMX/IP si gros volume.'**
  String get aboutNetworkWifiBullet2;

  /// No description provided for @aboutNetworkSwitchCalloutTitle.
  ///
  /// In fr, this message translates to:
  /// **'Minimum recommandé'**
  String get aboutNetworkSwitchCalloutTitle;

  /// No description provided for @aboutNetworkSwitchBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Switch Ethernet correct (pas hub).'**
  String get aboutNetworkSwitchBullet1;

  /// No description provided for @aboutNetworkSwitchBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Câbles OK (RJ45, connecteurs).'**
  String get aboutNetworkSwitchBullet2;

  /// No description provided for @aboutNetworkSwitchBullet3.
  ///
  /// In fr, this message translates to:
  /// **'Éviter boucles (ou STP maîtrisé).'**
  String get aboutNetworkSwitchBullet3;

  /// No description provided for @aboutNetworkSwitchBullet4.
  ///
  /// In fr, this message translates to:
  /// **'Si sACN multicast: IGMP snooping.'**
  String get aboutNetworkSwitchBullet4;

  /// No description provided for @aboutNetworkSwitchSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Managed vs unmanaged'**
  String get aboutNetworkSwitchSubtitle;

  /// No description provided for @aboutNetworkSwitchSubBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Unmanaged: ok petit réseau dédié (simple).'**
  String get aboutNetworkSwitchSubBullet1;

  /// No description provided for @aboutNetworkSwitchSubBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Managed: utile pour VLAN/IGMP/diagnostics (gros réseau).'**
  String get aboutNetworkSwitchSubBullet2;

  /// No description provided for @aboutNetworkDiagramsSubtitle1.
  ///
  /// In fr, this message translates to:
  /// **'VLAN: séparer lumière / reste'**
  String get aboutNetworkDiagramsSubtitle1;

  /// No description provided for @aboutNetworkDiagramsSubtitle2.
  ///
  /// In fr, this message translates to:
  /// **'Wi-Fi vs filaire (idée)'**
  String get aboutNetworkDiagramsSubtitle2;

  /// No description provided for @aboutNetworkChecklistBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Plan IP clair, masque cohérent.'**
  String get aboutNetworkChecklistBullet1;

  /// No description provided for @aboutNetworkChecklistBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Réseau dédié / VLAN lumière.'**
  String get aboutNetworkChecklistBullet2;

  /// No description provided for @aboutNetworkChecklistBullet3.
  ///
  /// In fr, this message translates to:
  /// **'Switch OK, pas de boucles.'**
  String get aboutNetworkChecklistBullet3;

  /// No description provided for @aboutNetworkChecklistBullet4.
  ///
  /// In fr, this message translates to:
  /// **'IGMP pour sACN multicast.'**
  String get aboutNetworkChecklistBullet4;

  /// No description provided for @aboutNetworkChecklistBullet5.
  ///
  /// In fr, this message translates to:
  /// **'Wi-Fi évité en prod critique.'**
  String get aboutNetworkChecklistBullet5;

  /// No description provided for @videoCameraExposureTitle.
  ///
  /// In fr, this message translates to:
  /// **'Exposition caméra'**
  String get videoCameraExposureTitle;

  /// No description provided for @videoCameraExposureSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Lux → EV, ISO, vitesse et ouverture.'**
  String get videoCameraExposureSubtitle;

  /// No description provided for @videoCamPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Exposition caméra'**
  String get videoCamPageTitle;

  /// No description provided for @videoCamInfoTitle.
  ///
  /// In fr, this message translates to:
  /// **'Info'**
  String get videoCamInfoTitle;

  /// No description provided for @videoCamIntro.
  ///
  /// In fr, this message translates to:
  /// **'Calculs indicatifs pour relier lux, ISO, vitesse et ouverture.'**
  String get videoCamIntro;

  /// No description provided for @videoCamInputsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Entrées'**
  String get videoCamInputsTitle;

  /// No description provided for @videoCamLuxLabel.
  ///
  /// In fr, this message translates to:
  /// **'Lux'**
  String get videoCamLuxLabel;

  /// No description provided for @videoCamLuxHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex: 500'**
  String get videoCamLuxHint;

  /// No description provided for @videoCamIsoLabel.
  ///
  /// In fr, this message translates to:
  /// **'ISO'**
  String get videoCamIsoLabel;

  /// No description provided for @videoCamIsoHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex: 800'**
  String get videoCamIsoHint;

  /// No description provided for @videoCamShutterLabel.
  ///
  /// In fr, this message translates to:
  /// **'Vitesse (s)'**
  String get videoCamShutterLabel;

  /// No description provided for @videoCamShutterHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex: 1/50'**
  String get videoCamShutterHint;

  /// No description provided for @videoCamApertureLabel.
  ///
  /// In fr, this message translates to:
  /// **'Ouverture (f/)'**
  String get videoCamApertureLabel;

  /// No description provided for @videoCamApertureHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex: 2.8'**
  String get videoCamApertureHint;

  /// No description provided for @videoCamEvEmpty.
  ///
  /// In fr, this message translates to:
  /// **'—'**
  String get videoCamEvEmpty;

  /// No description provided for @videoCamNote.
  ///
  /// In fr, this message translates to:
  /// **'Valeurs indicatives : la calibration dépend du capteur, de la scène et des normes.'**
  String get videoCamNote;

  /// No description provided for @videoCamEvValue.
  ///
  /// In fr, this message translates to:
  /// **'EV {ev}'**
  String videoCamEvValue(Object ev);

  /// No description provided for @videoCamApertureResult.
  ///
  /// In fr, this message translates to:
  /// **'Ouverture : f/{aperture}'**
  String videoCamApertureResult(Object aperture);

  /// No description provided for @videoCamShutterResult.
  ///
  /// In fr, this message translates to:
  /// **'Vitesse : {shutter} s'**
  String videoCamShutterResult(Object shutter);

  /// No description provided for @aboutDmxS2Title.
  ///
  /// In fr, this message translates to:
  /// **'2) Trame DMX — break, start code, canaux'**
  String get aboutDmxS2Title;

  /// No description provided for @aboutDmxS2PillBreak.
  ///
  /// In fr, this message translates to:
  /// **'Break'**
  String get aboutDmxS2PillBreak;

  /// No description provided for @aboutDmxS2PillStartCode.
  ///
  /// In fr, this message translates to:
  /// **'Start code'**
  String get aboutDmxS2PillStartCode;

  /// No description provided for @aboutDmxS2PillSlots512.
  ///
  /// In fr, this message translates to:
  /// **'512 slots'**
  String get aboutDmxS2PillSlots512;

  /// No description provided for @aboutDmxS2PillRefresh.
  ///
  /// In fr, this message translates to:
  /// **'Refresh'**
  String get aboutDmxS2PillRefresh;

  /// No description provided for @aboutDmxS2Intro.
  ///
  /// In fr, this message translates to:
  /// **'Une trame DMX est envoyée en boucle. Elle commence par un « break » (silence), puis un start code, puis jusqu’à 512 valeurs (0–255). Chaque appareil lit uniquement les canaux qui le concernent (selon son adresse et son mode).'**
  String get aboutDmxS2Intro;

  /// No description provided for @aboutDmxS2HowToReadTitle.
  ///
  /// In fr, this message translates to:
  /// **'Lire une trame (très simplement)'**
  String get aboutDmxS2HowToReadTitle;

  /// No description provided for @aboutDmxS2HowToReadB1.
  ///
  /// In fr, this message translates to:
  /// **'Break + MAB : marque le début de la trame (resynchronisation).'**
  String get aboutDmxS2HowToReadB1;

  /// No description provided for @aboutDmxS2HowToReadB2.
  ///
  /// In fr, this message translates to:
  /// **'Start code : le plus souvent 0x00 (données d’éclairage).'**
  String get aboutDmxS2HowToReadB2;

  /// No description provided for @aboutDmxS2HowToReadB3.
  ///
  /// In fr, this message translates to:
  /// **'Slots 1→512 : chaque slot = 1 canal (0–255).'**
  String get aboutDmxS2HowToReadB3;

  /// No description provided for @aboutDmxS2HowToReadB4.
  ///
  /// In fr, this message translates to:
  /// **'La trame recommence en continu : c’est normal d’« écraser » l’ancienne valeur.'**
  String get aboutDmxS2HowToReadB4;

  /// No description provided for @aboutDmxS2PracticalTitle.
  ///
  /// In fr, this message translates to:
  /// **'En pratique'**
  String get aboutDmxS2PracticalTitle;

  /// No description provided for @aboutDmxS2PracticalB1.
  ///
  /// In fr, this message translates to:
  /// **'Un mode 16-bit utilise 2 canaux pour une même fonction (ex: Pan coarse + Pan fine).'**
  String get aboutDmxS2PracticalB1;

  /// No description provided for @aboutDmxS2PracticalB2.
  ///
  /// In fr, this message translates to:
  /// **'Plus tu envoies d’univers, plus la charge globale (consoles/nodes/réseau) augmente.'**
  String get aboutDmxS2PracticalB2;

  /// No description provided for @aboutDmxS2PracticalB3.
  ///
  /// In fr, this message translates to:
  /// **'Si tu as du flicker, pense d’abord câble/termination/branchements avant de soupçonner la console.'**
  String get aboutDmxS2PracticalB3;

  /// No description provided for @aboutDmxS3Title.
  ///
  /// In fr, this message translates to:
  /// **'3) Câblage DMX — RS-485, topologie, pinout'**
  String get aboutDmxS3Title;

  /// No description provided for @aboutDmxS3PillRs485.
  ///
  /// In fr, this message translates to:
  /// **'RS-485'**
  String get aboutDmxS3PillRs485;

  /// No description provided for @aboutDmxS3PillDaisyChain.
  ///
  /// In fr, this message translates to:
  /// **'Daisy-chain'**
  String get aboutDmxS3PillDaisyChain;

  /// No description provided for @aboutDmxS3PillNoY.
  ///
  /// In fr, this message translates to:
  /// **'Pas de Y'**
  String get aboutDmxS3PillNoY;

  /// No description provided for @aboutDmxS3Pill120ohm.
  ///
  /// In fr, this message translates to:
  /// **'120 Ω'**
  String get aboutDmxS3Pill120ohm;

  /// No description provided for @aboutDmxS3Intro.
  ///
  /// In fr, this message translates to:
  /// **'DMX512 est basé sur RS-485 : un bus différentiel qui aime les lignes propres. La règle d’or : une chaîne (daisy-chain) de la source vers les appareils, puis une terminaison à la fin.'**
  String get aboutDmxS3Intro;

  /// No description provided for @aboutDmxS3TopologyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Topologie recommandée'**
  String get aboutDmxS3TopologyTitle;

  /// No description provided for @aboutDmxS3TopologyB1.
  ///
  /// In fr, this message translates to:
  /// **'Source → Appareil 1 → Appareil 2 → … → dernier appareil.'**
  String get aboutDmxS3TopologyB1;

  /// No description provided for @aboutDmxS3TopologyB2.
  ///
  /// In fr, this message translates to:
  /// **'Évite les dérivations en Y : elles créent des réflexions (instabilité).'**
  String get aboutDmxS3TopologyB2;

  /// No description provided for @aboutDmxS3TopologyB3.
  ///
  /// In fr, this message translates to:
  /// **'Si tu dois faire des branches : utilise un splitter DMX opto-isolé.'**
  String get aboutDmxS3TopologyB3;

  /// No description provided for @aboutDmxS3PinoutTitle.
  ///
  /// In fr, this message translates to:
  /// **'Connectique (rappel)'**
  String get aboutDmxS3PinoutTitle;

  /// No description provided for @aboutDmxS3CablesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Câbles : ce qui marche vraiment'**
  String get aboutDmxS3CablesTitle;

  /// No description provided for @aboutDmxS3CablesB1.
  ///
  /// In fr, this message translates to:
  /// **'Utilise un câble DMX (impédance ~120 Ω), pas un micro aléatoire (sauf dépannage court).'**
  String get aboutDmxS3CablesB1;

  /// No description provided for @aboutDmxS3CablesB2.
  ///
  /// In fr, this message translates to:
  /// **'Garde les longueurs raisonnables et évite les enroulements serrés près d’alim/gradateurs.'**
  String get aboutDmxS3CablesB2;

  /// No description provided for @aboutDmxS3CablesB3.
  ///
  /// In fr, this message translates to:
  /// **'Un mauvais câble = parfois « ça marche »… jusqu’au jour où non (humidité, longueur, charge).'**
  String get aboutDmxS3CablesB3;

  /// No description provided for @aboutDmxS4Title.
  ///
  /// In fr, this message translates to:
  /// **'4) Terminaison & splitters — stabilité du bus'**
  String get aboutDmxS4Title;

  /// No description provided for @aboutDmxS4Intro.
  ///
  /// In fr, this message translates to:
  /// **'Sur un bus RS-485, la terminaison évite les réflexions en bout de ligne. Les splitters (opto-isolés) servent à créer des branches propres et à protéger la source.'**
  String get aboutDmxS4Intro;

  /// No description provided for @aboutDmxS4TerminatorTitle.
  ///
  /// In fr, this message translates to:
  /// **'Terminaison (120 Ω) : quand et comment'**
  String get aboutDmxS4TerminatorTitle;

  /// No description provided for @aboutDmxS4TerminatorB1.
  ///
  /// In fr, this message translates to:
  /// **'Met une terminaison sur le dernier appareil (ou un bouchon XLR).'**
  String get aboutDmxS4TerminatorB1;

  /// No description provided for @aboutDmxS4TerminatorB2.
  ///
  /// In fr, this message translates to:
  /// **'Une seule terminaison par ligne (pas partout).'**
  String get aboutDmxS4TerminatorB2;

  /// No description provided for @aboutDmxS4TerminatorB3.
  ///
  /// In fr, this message translates to:
  /// **'Indispensable sur longues lignes, grosses charges, environnements bruyants.'**
  String get aboutDmxS4TerminatorB3;

  /// No description provided for @aboutDmxS4SplittersTitle.
  ///
  /// In fr, this message translates to:
  /// **'Splitters / opto-isolation'**
  String get aboutDmxS4SplittersTitle;

  /// No description provided for @aboutDmxS4SplittersB1.
  ///
  /// In fr, this message translates to:
  /// **'Permet de faire 2, 4, 8 branches sans « Y ».'**
  String get aboutDmxS4SplittersB1;

  /// No description provided for @aboutDmxS4SplittersB2.
  ///
  /// In fr, this message translates to:
  /// **'Isole électriquement : limite les boucles de masse et protège la console/node.'**
  String get aboutDmxS4SplittersB2;

  /// No description provided for @aboutDmxS4SplittersB3.
  ///
  /// In fr, this message translates to:
  /// **'Pratique pour \"re-driver\" un signal sur de longues distances.'**
  String get aboutDmxS4SplittersB3;

  /// No description provided for @aboutDmxS5Title.
  ///
  /// In fr, this message translates to:
  /// **'5) Dépannage — méthode simple (rapide et fiable)'**
  String get aboutDmxS5Title;

  /// No description provided for @aboutDmxS5Intro.
  ///
  /// In fr, this message translates to:
  /// **'Quand un appareil ne répond pas, la clé est d’isoler : est-ce l’adresse, le mode, la ligne DMX, ou l’appareil ? Suis une checklist courte avant de tout reconfigurer.'**
  String get aboutDmxS5Intro;

  /// No description provided for @aboutDmxS5QuickChecksTitle.
  ///
  /// In fr, this message translates to:
  /// **'Checklist rapide'**
  String get aboutDmxS5QuickChecksTitle;

  /// No description provided for @aboutDmxS5QuickB1.
  ///
  /// In fr, this message translates to:
  /// **'Adresse DMX correcte ? (et pas 001 vs 000 selon l’écran).'**
  String get aboutDmxS5QuickB1;

  /// No description provided for @aboutDmxS5QuickB2.
  ///
  /// In fr, this message translates to:
  /// **'Bon mode DMX (nombre de canaux) ?'**
  String get aboutDmxS5QuickB2;

  /// No description provided for @aboutDmxS5QuickB3.
  ///
  /// In fr, this message translates to:
  /// **'Bon univers / sortie (console, node, port) ?'**
  String get aboutDmxS5QuickB3;

  /// No description provided for @aboutDmxS5QuickB4.
  ///
  /// In fr, this message translates to:
  /// **'Teste avec un câble connu OK, puis en remplaçant un par un.'**
  String get aboutDmxS5QuickB4;

  /// No description provided for @aboutDmxS5QuickB5.
  ///
  /// In fr, this message translates to:
  /// **'Ajoute/retire une terminaison au bout de la ligne pour voir l’effet.'**
  String get aboutDmxS5QuickB5;

  /// No description provided for @aboutDmxS5IfFlickerTitle.
  ///
  /// In fr, this message translates to:
  /// **'Si ça flicker / décroche'**
  String get aboutDmxS5IfFlickerTitle;

  /// No description provided for @aboutDmxS5IfFlickerB1.
  ///
  /// In fr, this message translates to:
  /// **'Cherche un \"Y\" caché, un splitter non adapté, ou un mauvais adaptateur XLR.'**
  String get aboutDmxS5IfFlickerB1;

  /// No description provided for @aboutDmxS5IfFlickerB2.
  ///
  /// In fr, this message translates to:
  /// **'Éloigne DMX des alimentations/gradateurs, évite les grandes boucles de câble.'**
  String get aboutDmxS5IfFlickerB2;

  /// No description provided for @aboutDmxS5IfFlickerB3.
  ///
  /// In fr, this message translates to:
  /// **'Réduis la complexité : 1 univers, 1 ligne, 1 appareil, puis tu reconstruis.'**
  String get aboutDmxS5IfFlickerB3;

  /// No description provided for @aboutDmxS5GoldenRuleTitle.
  ///
  /// In fr, this message translates to:
  /// **'Règle d’or'**
  String get aboutDmxS5GoldenRuleTitle;

  /// No description provided for @aboutDmxS5GoldenRuleBody.
  ///
  /// In fr, this message translates to:
  /// **'Tu dois pouvoir faire fonctionner un seul appareil sur une seule ligne. Si ce test de base échoue, le problème n’est pas « le patch complet » : c’est l’adressage, le câblage, ou le matériel.'**
  String get aboutDmxS5GoldenRuleBody;

  /// No description provided for @aboutDmxS6Title.
  ///
  /// In fr, this message translates to:
  /// **'6) Art-Net — DMX sur IP (vocabulaire et pièges)'**
  String get aboutDmxS6Title;

  /// No description provided for @aboutDmxS6PillUdp.
  ///
  /// In fr, this message translates to:
  /// **'UDP'**
  String get aboutDmxS6PillUdp;

  /// No description provided for @aboutDmxS6PillNodes.
  ///
  /// In fr, this message translates to:
  /// **'Nodes'**
  String get aboutDmxS6PillNodes;

  /// No description provided for @aboutDmxS6PillBroadcast.
  ///
  /// In fr, this message translates to:
  /// **'Broadcast'**
  String get aboutDmxS6PillBroadcast;

  /// No description provided for @aboutDmxS6PillUnicast.
  ///
  /// In fr, this message translates to:
  /// **'Unicast'**
  String get aboutDmxS6PillUnicast;

  /// No description provided for @aboutDmxS6Intro.
  ///
  /// In fr, this message translates to:
  /// **'Art-Net transporte des univers DMX via Ethernet (UDP). Une console/logiciel envoie des univers sur le réseau, et un node les convertit en sorties DMX physiques.'**
  String get aboutDmxS6Intro;

  /// No description provided for @aboutDmxS6BasicsTitle.
  ///
  /// In fr, this message translates to:
  /// **'À retenir'**
  String get aboutDmxS6BasicsTitle;

  /// No description provided for @aboutDmxS6BasicsB1.
  ///
  /// In fr, this message translates to:
  /// **'Un node = réseau ↔ DMX (plusieurs ports).'**
  String get aboutDmxS6BasicsB1;

  /// No description provided for @aboutDmxS6BasicsB2.
  ///
  /// In fr, this message translates to:
  /// **'Broadcast envoie à tout le monde (simple mais peut saturer).'**
  String get aboutDmxS6BasicsB2;

  /// No description provided for @aboutDmxS6BasicsB3.
  ///
  /// In fr, this message translates to:
  /// **'Unicast envoie seulement au node ciblé (souvent plus stable sur gros rigs).'**
  String get aboutDmxS6BasicsB3;

  /// No description provided for @aboutDmxS6BasicsB4.
  ///
  /// In fr, this message translates to:
  /// **'Attention au comptage d’univers : souvent Art-Net commence à 0 (Univers 1 DMX = 0 Art-Net).'**
  String get aboutDmxS6BasicsB4;

  /// No description provided for @aboutDmxS6WhenTitle.
  ///
  /// In fr, this message translates to:
  /// **'Quand choisir Art-Net ?'**
  String get aboutDmxS6WhenTitle;

  /// No description provided for @aboutDmxS6WhenB1.
  ///
  /// In fr, this message translates to:
  /// **'Petits/moyens rigs, set-ups rapides, beaucoup de matériel compatible.'**
  String get aboutDmxS6WhenB1;

  /// No description provided for @aboutDmxS6WhenB2.
  ///
  /// In fr, this message translates to:
  /// **'OK si le réseau est propre (switch correct, câbles, pas de Wi-Fi).'**
  String get aboutDmxS6WhenB2;

  /// No description provided for @aboutDmxS6WhenB3.
  ///
  /// In fr, this message translates to:
  /// **'Si ça sature : passe en unicast et segmente le réseau (VLAN / réseau dédié).'**
  String get aboutDmxS6WhenB3;

  /// No description provided for @aboutDmxS7Title.
  ///
  /// In fr, this message translates to:
  /// **'7) sACN (E1.31) — multicast, priorités, réseau propre'**
  String get aboutDmxS7Title;

  /// No description provided for @aboutDmxS7PillE131.
  ///
  /// In fr, this message translates to:
  /// **'E1.31'**
  String get aboutDmxS7PillE131;

  /// No description provided for @aboutDmxS7PillMulticast.
  ///
  /// In fr, this message translates to:
  /// **'Multicast'**
  String get aboutDmxS7PillMulticast;

  /// No description provided for @aboutDmxS7PillPriority.
  ///
  /// In fr, this message translates to:
  /// **'Priorité'**
  String get aboutDmxS7PillPriority;

  /// No description provided for @aboutDmxS7PillIgmp.
  ///
  /// In fr, this message translates to:
  /// **'IGMP'**
  String get aboutDmxS7PillIgmp;

  /// No description provided for @aboutDmxS7Intro.
  ///
  /// In fr, this message translates to:
  /// **'sACN (ANSI E1.31) est un standard moderne pour transporter des univers DMX sur IP. Il est très utilisé en grands systèmes car il gère bien le multicast et les priorités.'**
  String get aboutDmxS7Intro;

  /// No description provided for @aboutDmxS7KeyIdeasTitle.
  ///
  /// In fr, this message translates to:
  /// **'Idées clés'**
  String get aboutDmxS7KeyIdeasTitle;

  /// No description provided for @aboutDmxS7KeyIdeasB1.
  ///
  /// In fr, this message translates to:
  /// **'Multicast : un univers est un \"groupe\" réseau (les nodes s’abonnent).'**
  String get aboutDmxS7KeyIdeasB1;

  /// No description provided for @aboutDmxS7KeyIdeasB2.
  ///
  /// In fr, this message translates to:
  /// **'IGMP snooping sur les switches = indispensable à grande échelle (sinon ça inonde).'**
  String get aboutDmxS7KeyIdeasB2;

  /// No description provided for @aboutDmxS7KeyIdeasB3.
  ///
  /// In fr, this message translates to:
  /// **'Priorité : plusieurs sources possibles, celle avec la plus haute priorité gagne.'**
  String get aboutDmxS7KeyIdeasB3;

  /// No description provided for @aboutDmxS7KeyIdeasB4.
  ///
  /// In fr, this message translates to:
  /// **'Comme Art-Net : réseau propre + câbles/switch de qualité = stabilité.'**
  String get aboutDmxS7KeyIdeasB4;

  /// No description provided for @aboutDmxS8Title.
  ///
  /// In fr, this message translates to:
  /// **'8) DMX vs Art-Net vs sACN — résumé (quoi choisir ?)'**
  String get aboutDmxS8Title;

  /// No description provided for @aboutDmxS8Intro.
  ///
  /// In fr, this message translates to:
  /// **'Les trois font la même chose au final : piloter des canaux. La différence se joue sur la distribution (câble DMX vs réseau), l’échelle, et la robustesse.'**
  String get aboutDmxS8Intro;

  /// No description provided for @aboutDmxS8QuickTableTitle.
  ///
  /// In fr, this message translates to:
  /// **'Résumé en 4 lignes'**
  String get aboutDmxS8QuickTableTitle;

  /// No description provided for @aboutDmxS8QuickB1.
  ///
  /// In fr, this message translates to:
  /// **'DMX : simple, robuste, 1 câble = 1 ligne (512 canaux).'**
  String get aboutDmxS8QuickB1;

  /// No description provided for @aboutDmxS8QuickB2.
  ///
  /// In fr, this message translates to:
  /// **'Art-Net : très courant, facile à déployer, attention au broadcast.'**
  String get aboutDmxS8QuickB2;

  /// No description provided for @aboutDmxS8QuickB3.
  ///
  /// In fr, this message translates to:
  /// **'sACN : plus \"pro grands systèmes\", multicast + priorités, demande un réseau bien configuré.'**
  String get aboutDmxS8QuickB3;

  /// No description provided for @aboutDmxS8QuickB4.
  ///
  /// In fr, this message translates to:
  /// **'Dans tous les cas : documentation + test progressif = gain de temps énorme.'**
  String get aboutDmxS8QuickB4;

  /// No description provided for @aboutDmxS8ChooseTitle.
  ///
  /// In fr, this message translates to:
  /// **'Choix rapide'**
  String get aboutDmxS8ChooseTitle;

  /// No description provided for @aboutDmxS8ChooseB1.
  ///
  /// In fr, this message translates to:
  /// **'Petit set-up : DMX direct ou Art-Net (simple).'**
  String get aboutDmxS8ChooseB1;

  /// No description provided for @aboutDmxS8ChooseB2.
  ///
  /// In fr, this message translates to:
  /// **'Beaucoup d’univers : réseau dédié + nodes ; Art-Net en unicast ou sACN.'**
  String get aboutDmxS8ChooseB2;

  /// No description provided for @aboutDmxS8ChooseB3.
  ///
  /// In fr, this message translates to:
  /// **'Très gros rigs / infrastructures : sACN + switches/IGMP bien gérés.'**
  String get aboutDmxS8ChooseB3;

  /// No description provided for @aboutSunTimesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Soleil (lever / coucher)'**
  String get aboutSunTimesTitle;

  /// No description provided for @aboutSunTimesSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Choix d’une ville et d’une date, heures de lever/coucher + seuils (lux).'**
  String get aboutSunTimesSubtitle;

  /// No description provided for @homeBpmTitle.
  ///
  /// In fr, this message translates to:
  /// **'BPM'**
  String get homeBpmTitle;

  /// No description provided for @aboutReseauPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réseau — repères terrain'**
  String get aboutReseauPageTitle;

  /// No description provided for @aboutReseauSummaryCopy.
  ///
  /// In fr, this message translates to:
  /// **'RÉSEAU — repères terrain\n• RJ45 : Cat5e/6/6A → 1G/10G selon distance.\n• Fibre : longue distance + immunité EMI.\n• Switch : IGMP important pour sACN multicast.\n• VLAN : séparer lumière/vidéo/IT = stabilité.'**
  String get aboutReseauSummaryCopy;

  /// No description provided for @aboutReseauChecklistCopy.
  ///
  /// In fr, this message translates to:
  /// **'RÉSEAU — Checklist\n☐ Plan IP clair (plage / masques)\n☐ Switch correct (IGMP si sACN multicast)\n☐ VLAN si plusieurs \"mondes\" (lumière/vidéo/IT)\n☐ Câbles testés + étiquetés\n☐ Fibre : modules compatibles + connecteurs propres\n☐ Éviter boucles (STP) + éviter Wi-Fi public sur show LAN'**
  String get aboutReseauChecklistCopy;

  /// No description provided for @aboutReseauChecklistCopyTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Copier'**
  String get aboutReseauChecklistCopyTooltip;

  /// No description provided for @aboutReseauFooterNote.
  ///
  /// In fr, this message translates to:
  /// **'Info indicative (terrain). Les capacités exactes varient selon matériel / câbles / modules.\nObjectif : repères simples + méthode fiable.'**
  String get aboutReseauFooterNote;

  /// No description provided for @aboutReseauToc1.
  ///
  /// In fr, this message translates to:
  /// **'1) Bases réseau (LAN / IP / débit)'**
  String get aboutReseauToc1;

  /// No description provided for @aboutReseauToc2.
  ///
  /// In fr, this message translates to:
  /// **'2) RJ45 & catégories (Cat5e/6/6A/…)'**
  String get aboutReseauToc2;

  /// No description provided for @aboutReseauToc3.
  ///
  /// In fr, this message translates to:
  /// **'3) PoE (alimentation réseau)'**
  String get aboutReseauToc3;

  /// No description provided for @aboutReseauToc4.
  ///
  /// In fr, this message translates to:
  /// **'4) Fibre (SM/MM) + connecteurs (LC/SC)'**
  String get aboutReseauToc4;

  /// No description provided for @aboutReseauToc5.
  ///
  /// In fr, this message translates to:
  /// **'5) SFP / SFP+ / QSFP (modules)'**
  String get aboutReseauToc5;

  /// No description provided for @aboutReseauToc6.
  ///
  /// In fr, this message translates to:
  /// **'6) Switches (VLAN / IGMP / QoS)'**
  String get aboutReseauToc6;

  /// No description provided for @aboutReseauToc7.
  ///
  /// In fr, this message translates to:
  /// **'7) Art-Net / sACN sur réseau (conseils)'**
  String get aboutReseauToc7;

  /// No description provided for @aboutReseauToc8.
  ///
  /// In fr, this message translates to:
  /// **'8) Checklist'**
  String get aboutReseauToc8;

  /// No description provided for @aboutReseauSection1Title.
  ///
  /// In fr, this message translates to:
  /// **'Les 3 idées simples'**
  String get aboutReseauSection1Title;

  /// No description provided for @aboutReseauSection1Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'IP = adresse (ex: 10.0.0.50).'**
  String get aboutReseauSection1Bullet1;

  /// No description provided for @aboutReseauSection1Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'LAN = réseau local via switch (pas \"internet\").'**
  String get aboutReseauSection1Bullet2;

  /// No description provided for @aboutReseauSection1Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Débit = capacité (1G, 10G…), mais la stabilité dépend aussi du switch.'**
  String get aboutReseauSection1Bullet3;

  /// No description provided for @aboutReseauSection1Title2.
  ///
  /// In fr, this message translates to:
  /// **'Topologie show (propre)'**
  String get aboutReseauSection1Title2;

  /// No description provided for @aboutReseauSection1Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Console/PC → switch central → nodes/serveurs.'**
  String get aboutReseauSection1Bullet4;

  /// No description provided for @aboutReseauSection1Bullet5.
  ///
  /// In fr, this message translates to:
  /// **'Évite les \"daisy-chain réseau\" au hasard.'**
  String get aboutReseauSection1Bullet5;

  /// No description provided for @aboutReseauSection1Bullet6.
  ///
  /// In fr, this message translates to:
  /// **'Si possible : un réseau dédié show (pas le Wi-Fi public).'**
  String get aboutReseauSection1Bullet6;

  /// No description provided for @aboutReseauSection2Title.
  ///
  /// In fr, this message translates to:
  /// **'Repères rapides'**
  String get aboutReseauSection2Title;

  /// No description provided for @aboutReseauSection2Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Cat5e : 1 Gbit/s \"classique\" (jusqu’à 100m).'**
  String get aboutReseauSection2Bullet1;

  /// No description provided for @aboutReseauSection2Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Cat6 : 1G/10G (10G plutôt sur distances plus courtes).'**
  String get aboutReseauSection2Bullet2;

  /// No description provided for @aboutReseauSection2Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Cat6A : 10G jusqu’à 100m (repère pratique).'**
  String get aboutReseauSection2Bullet3;

  /// No description provided for @aboutReseauSection2Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Au-delà : Cat7/8 existent, mais Cat6A est souvent le sweet spot terrain.'**
  String get aboutReseauSection2Bullet4;

  /// No description provided for @aboutReseauSection2Title2.
  ///
  /// In fr, this message translates to:
  /// **'Terrain'**
  String get aboutReseauSection2Title2;

  /// No description provided for @aboutReseauSection2Bullet5.
  ///
  /// In fr, this message translates to:
  /// **'Toujours tester/étiqueter les câbles (surtout quand c’est loué).'**
  String get aboutReseauSection2Bullet5;

  /// No description provided for @aboutReseauSection2Bullet6.
  ///
  /// In fr, this message translates to:
  /// **'Évite les connecteurs abîmés : un RJ45 \"fatigué\" = pannes fantômes.'**
  String get aboutReseauSection2Bullet6;

  /// No description provided for @aboutReseauSection2Bullet7.
  ///
  /// In fr, this message translates to:
  /// **'Prévoir du 10G si tu fais vidéo IP lourde.'**
  String get aboutReseauSection2Bullet7;

  /// No description provided for @aboutReseauSection3Paragraph.
  ///
  /// In fr, this message translates to:
  /// **'PoE permet d’alimenter des équipements via RJ45 (cam IP, AP Wi-Fi, petits nodes…). Le point critique : le budget PoE total du switch.'**
  String get aboutReseauSection3Paragraph;

  /// No description provided for @aboutReseauSection3Title.
  ///
  /// In fr, this message translates to:
  /// **'Repères'**
  String get aboutReseauSection3Title;

  /// No description provided for @aboutReseauSection3Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'PoE (802.3af) ≈ 15W, PoE+ (802.3at) ≈ 30W, PoE++/bt plus haut.'**
  String get aboutReseauSection3Bullet1;

  /// No description provided for @aboutReseauSection3Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Le switch a un \"budget\" total (ex: 120W).'**
  String get aboutReseauSection3Bullet2;

  /// No description provided for @aboutReseauSection3Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Si tu dépasses le budget : certains ports ne s’allument plus / reboot.'**
  String get aboutReseauSection3Bullet3;

  /// No description provided for @aboutReseauSection4Title.
  ///
  /// In fr, this message translates to:
  /// **'Pourquoi la fibre en show'**
  String get aboutReseauSection4Title;

  /// No description provided for @aboutReseauSection4Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Très longues distances.'**
  String get aboutReseauSection4Bullet1;

  /// No description provided for @aboutReseauSection4Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Immunité aux parasites (EMI), top en environnements chargés.'**
  String get aboutReseauSection4Bullet2;

  /// No description provided for @aboutReseauSection4Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Pratique pour relier FOH ↔ plateau ↔ régie.'**
  String get aboutReseauSection4Bullet3;

  /// No description provided for @aboutReseauSection4Title2.
  ///
  /// In fr, this message translates to:
  /// **'Multimode vs Monomode (repère simple)'**
  String get aboutReseauSection4Title2;

  /// No description provided for @aboutReseauSection4Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Multimode (MM) : distances \"moyennes\" (souvent bâtiment / plateau).'**
  String get aboutReseauSection4Bullet4;

  /// No description provided for @aboutReseauSection4Bullet5.
  ///
  /// In fr, this message translates to:
  /// **'Monomode (SM) : très longues distances.'**
  String get aboutReseauSection4Bullet5;

  /// No description provided for @aboutReseauSection4Bullet6.
  ///
  /// In fr, this message translates to:
  /// **'Les modules (SFP) doivent matcher le type de fibre.'**
  String get aboutReseauSection4Bullet6;

  /// No description provided for @aboutReseauSection4Title3.
  ///
  /// In fr, this message translates to:
  /// **'Connecteurs'**
  String get aboutReseauSection4Title3;

  /// No description provided for @aboutReseauSection4Bullet7.
  ///
  /// In fr, this message translates to:
  /// **'LC : petit, très courant sur SFP.'**
  String get aboutReseauSection4Bullet7;

  /// No description provided for @aboutReseauSection4Bullet8.
  ///
  /// In fr, this message translates to:
  /// **'SC : plus gros, courant en infrastructure.'**
  String get aboutReseauSection4Bullet8;

  /// No description provided for @aboutReseauSection4Bullet9.
  ///
  /// In fr, this message translates to:
  /// **'Toujours protéger/clean (poussière = pertes).'**
  String get aboutReseauSection4Bullet9;

  /// No description provided for @aboutReseauSection5Title.
  ///
  /// In fr, this message translates to:
  /// **'Repères'**
  String get aboutReseauSection5Title;

  /// No description provided for @aboutReseauSection5Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'SFP : souvent 1G.'**
  String get aboutReseauSection5Bullet1;

  /// No description provided for @aboutReseauSection5Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'SFP+ : souvent 10G.'**
  String get aboutReseauSection5Bullet2;

  /// No description provided for @aboutReseauSection5Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'QSFP/QSFP+ : 40G (selon usage).'**
  String get aboutReseauSection5Bullet3;

  /// No description provided for @aboutReseauSection5Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Un module = vitesse + type fibre + longueur (tout doit être cohérent).'**
  String get aboutReseauSection5Bullet4;

  /// No description provided for @aboutReseauSection5Paragraph.
  ///
  /// In fr, this message translates to:
  /// **'En pratique : prends des modules compatibles avec le switch (et idéalement du même fournisseur/modèle) pour éviter les surprises.'**
  String get aboutReseauSection5Paragraph;

  /// No description provided for @aboutReseauSection6Title.
  ///
  /// In fr, this message translates to:
  /// **'Fonctions utiles en spectacle'**
  String get aboutReseauSection6Title;

  /// No description provided for @aboutReseauSection6Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'VLAN : séparer lumière / vidéo / IT.'**
  String get aboutReseauSection6Bullet1;

  /// No description provided for @aboutReseauSection6Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'IGMP snooping : indispensable si tu utilises sACN multicast à grande échelle.'**
  String get aboutReseauSection6Bullet2;

  /// No description provided for @aboutReseauSection6Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'QoS : utile si tu mixes beaucoup de flux (selon contexte).'**
  String get aboutReseauSection6Bullet3;

  /// No description provided for @aboutReseauSection6Title2.
  ///
  /// In fr, this message translates to:
  /// **'Erreurs fréquentes'**
  String get aboutReseauSection6Title2;

  /// No description provided for @aboutReseauSection6Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Switch \"cheap\" qui flood le multicast → réseau qui s’écroule.'**
  String get aboutReseauSection6Bullet4;

  /// No description provided for @aboutReseauSection6Bullet5.
  ///
  /// In fr, this message translates to:
  /// **'Boucle réseau sans STP → tempête de broadcast.'**
  String get aboutReseauSection6Bullet5;

  /// No description provided for @aboutReseauSection6Bullet6.
  ///
  /// In fr, this message translates to:
  /// **'Wi-Fi public sur le même LAN que le show → instabilité.'**
  String get aboutReseauSection6Bullet6;

  /// No description provided for @aboutReseauSection7Title.
  ///
  /// In fr, this message translates to:
  /// **'Art-Net (terrain)'**
  String get aboutReseauSection7Title;

  /// No description provided for @aboutReseauSection7Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Souvent simple à mettre en place.'**
  String get aboutReseauSection7Bullet1;

  /// No description provided for @aboutReseauSection7Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Broadcast possible sur petit LAN dédié, mais unicast est plus propre.'**
  String get aboutReseauSection7Bullet2;

  /// No description provided for @aboutReseauSection7Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Mapping univers/ports = point numéro 1 à vérifier.'**
  String get aboutReseauSection7Bullet3;

  /// No description provided for @aboutReseauSection7Title2.
  ///
  /// In fr, this message translates to:
  /// **'sACN (terrain)'**
  String get aboutReseauSection7Title2;

  /// No description provided for @aboutReseauSection7Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Multicast : efficace, mais exige un switch correct (IGMP).'**
  String get aboutReseauSection7Bullet4;

  /// No description provided for @aboutReseauSection7Bullet5.
  ///
  /// In fr, this message translates to:
  /// **'Priorités : utile si plusieurs sources.'**
  String get aboutReseauSection7Bullet5;

  /// No description provided for @aboutReseauSection7Bullet6.
  ///
  /// In fr, this message translates to:
  /// **'Sur gros shows : sACN + IGMP est souvent le choix \"propre\".'**
  String get aboutReseauSection7Bullet6;

  /// No description provided for @aboutReseauChecklistTitle.
  ///
  /// In fr, this message translates to:
  /// **'Rapide'**
  String get aboutReseauChecklistTitle;

  /// No description provided for @aboutReseauChecklistBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Switch correct + câbles propres.'**
  String get aboutReseauChecklistBullet1;

  /// No description provided for @aboutReseauChecklistBullet2.
  ///
  /// In fr, this message translates to:
  /// **'IGMP si sACN multicast.'**
  String get aboutReseauChecklistBullet2;

  /// No description provided for @aboutReseauChecklistBullet3.
  ///
  /// In fr, this message translates to:
  /// **'Séparer les usages (VLAN).'**
  String get aboutReseauChecklistBullet3;

  /// No description provided for @aboutSacnPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'sACN / E1.31 — multicast & priorités'**
  String get aboutSacnPageTitle;

  /// No description provided for @aboutSacnCopyTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Copier repères'**
  String get aboutSacnCopyTooltip;

  /// No description provided for @aboutSacnChecklistCopyTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Copier'**
  String get aboutSacnChecklistCopyTooltip;

  /// No description provided for @aboutSacnFooterNote.
  ///
  /// In fr, this message translates to:
  /// **'Info indicative (terrain). Les comportements dépendent des switchs (IGMP), nodes et firmwares.\nObjectif : comprendre et stabiliser un réseau sACN.'**
  String get aboutSacnFooterNote;

  /// No description provided for @aboutSacnCopy1.
  ///
  /// In fr, this message translates to:
  /// **'sACN (E1.31) = DMX sur IP (UDP), standard spectacle.'**
  String get aboutSacnCopy1;

  /// No description provided for @aboutSacnCopy2.
  ///
  /// In fr, this message translates to:
  /// **'Universe sACN = 1..63999 (plage standard).'**
  String get aboutSacnCopy2;

  /// No description provided for @aboutSacnCopy3.
  ///
  /// In fr, this message translates to:
  /// **'Multicast: IGMP snooping recommandé, sinon flood.'**
  String get aboutSacnCopy3;

  /// No description provided for @aboutSacnCopy4.
  ///
  /// In fr, this message translates to:
  /// **'Priorité: utile avec sources multiples (console + backup).'**
  String get aboutSacnCopy4;

  /// No description provided for @aboutSacnChecklistCopy.
  ///
  /// In fr, this message translates to:
  /// **'sACN (E1.31) — Checklist terrain\n☐ Switch correct (idéalement manageable)\n☐ IGMP snooping activé si multicast\n☐ (Si possible) IGMP querier présent dans le VLAN (sinon comportements bizarres possibles)\n☐ Unicast si réseau non maîtrisé / dépannage\n☐ Priorités: vérifier sources multiples (console/backup)\n☐ Mapping univers ↔ ports node vérifié\n☐ Wi-Fi évité en prod'**
  String get aboutSacnChecklistCopy;

  /// No description provided for @aboutSacnToc1.
  ///
  /// In fr, this message translates to:
  /// **'1) À quoi sert sACN ?'**
  String get aboutSacnToc1;

  /// No description provided for @aboutSacnToc2.
  ///
  /// In fr, this message translates to:
  /// **'2) Univers (numérotation)'**
  String get aboutSacnToc2;

  /// No description provided for @aboutSacnToc3.
  ///
  /// In fr, this message translates to:
  /// **'3) Multicast / Unicast + IGMP'**
  String get aboutSacnToc3;

  /// No description provided for @aboutSacnToc4.
  ///
  /// In fr, this message translates to:
  /// **'4) Priorités (multi-sources)'**
  String get aboutSacnToc4;

  /// No description provided for @aboutSacnToc5.
  ///
  /// In fr, this message translates to:
  /// **'5) Limites / perfs'**
  String get aboutSacnToc5;

  /// No description provided for @aboutSacnToc6.
  ///
  /// In fr, this message translates to:
  /// **'6) RDM & sACN (proxy / selon matériel)'**
  String get aboutSacnToc6;

  /// No description provided for @aboutSacnToc7.
  ///
  /// In fr, this message translates to:
  /// **'7) Schémas'**
  String get aboutSacnToc7;

  /// No description provided for @aboutSacnToc8.
  ///
  /// In fr, this message translates to:
  /// **'8) Checklist'**
  String get aboutSacnToc8;

  /// No description provided for @aboutSacnSection1Pill1.
  ///
  /// In fr, this message translates to:
  /// **'UDP'**
  String get aboutSacnSection1Pill1;

  /// No description provided for @aboutSacnSection1Pill2.
  ///
  /// In fr, this message translates to:
  /// **'Multicast'**
  String get aboutSacnSection1Pill2;

  /// No description provided for @aboutSacnSection1Pill3.
  ///
  /// In fr, this message translates to:
  /// **'Priorité'**
  String get aboutSacnSection1Pill3;

  /// No description provided for @aboutSacnSection1Paragraph.
  ///
  /// In fr, this message translates to:
  /// **'sACN (E1.31) est un standard largement utilisé pour transporter des univers DMX sur IP. Il est souvent privilégié quand on veut une architecture réseau propre: multicast bien géré, priorités standardisées, et un comportement plus \"réseau pro\".'**
  String get aboutSacnSection1Paragraph;

  /// No description provided for @aboutSacnSection1Title.
  ///
  /// In fr, this message translates to:
  /// **'Quand c’est top'**
  String get aboutSacnSection1Title;

  /// No description provided for @aboutSacnSection1Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Beaucoup d’univers sur un réseau bien géré.'**
  String get aboutSacnSection1Bullet1;

  /// No description provided for @aboutSacnSection1Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Installations / gros réseaux avec plusieurs sources (priorités).'**
  String get aboutSacnSection1Bullet2;

  /// No description provided for @aboutSacnSection1Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Quand tu veux éviter le \"broadcast partout\".'**
  String get aboutSacnSection1Bullet3;

  /// No description provided for @aboutSacnSection2Pill1.
  ///
  /// In fr, this message translates to:
  /// **'Universe 1..63999'**
  String get aboutSacnSection2Pill1;

  /// No description provided for @aboutSacnSection2Pill2.
  ///
  /// In fr, this message translates to:
  /// **'512 slots/universe'**
  String get aboutSacnSection2Pill2;

  /// No description provided for @aboutSacnSection2Paragraph.
  ///
  /// In fr, this message translates to:
  /// **'Un univers sACN correspond à un univers DMX: jusqu’à 512 slots. La numérotation sACN standard est 1..63999. En pratique, l’important est le mapping console ↔ node ↔ port DMX.'**
  String get aboutSacnSection2Paragraph;

  /// No description provided for @aboutSacnSection2Title.
  ///
  /// In fr, this message translates to:
  /// **'Erreur classique'**
  String get aboutSacnSection2Title;

  /// No description provided for @aboutSacnSection2Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Tu changes le numéro d’univers côté console, mais pas côté node (ou inverse).'**
  String get aboutSacnSection2Bullet1;

  /// No description provided for @aboutSacnSection2Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Tu patches \"Universe 0\" alors que le matériel attend une base 1.'**
  String get aboutSacnSection2Bullet2;

  /// No description provided for @aboutSacnSection2Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Tu mélanges des conventions de numérotation entre outils.'**
  String get aboutSacnSection2Bullet3;

  /// No description provided for @aboutSacnSection3Paragraph.
  ///
  /// In fr, this message translates to:
  /// **'sACN utilise souvent le multicast: chaque univers \"vit\" sur un groupe multicast, et les nodes s’abonnent aux univers dont ils ont besoin.'**
  String get aboutSacnSection3Paragraph;

  /// No description provided for @aboutSacnSection3Title.
  ///
  /// In fr, this message translates to:
  /// **'IGMP snooping (pourquoi c’est important)'**
  String get aboutSacnSection3Title;

  /// No description provided for @aboutSacnSection3Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Sans IGMP: le switch \"flood\" le multicast partout → surcharge possible.'**
  String get aboutSacnSection3Bullet1;

  /// No description provided for @aboutSacnSection3Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Avec IGMP: le switch envoie seulement aux ports abonnés → réseau stable.'**
  String get aboutSacnSection3Bullet2;

  /// No description provided for @aboutSacnSection3Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Sur gros volumes: IGMP est souvent LA différence entre \"ça marche\" et \"c’est l’enfer\".'**
  String get aboutSacnSection3Bullet3;

  /// No description provided for @aboutSacnSection3Subtitle.
  ///
  /// In fr, this message translates to:
  /// **'Schéma : multicast & IGMP'**
  String get aboutSacnSection3Subtitle;

  /// No description provided for @aboutSacnSection3Subtitle2.
  ///
  /// In fr, this message translates to:
  /// **'Unicast (option)'**
  String get aboutSacnSection3Subtitle2;

  /// No description provided for @aboutSacnSection3SubBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Possible selon consoles/nodes.'**
  String get aboutSacnSection3SubBullet1;

  /// No description provided for @aboutSacnSection3SubBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Utile en dépannage ou si réseau multicast non maîtrisé.'**
  String get aboutSacnSection3SubBullet2;

  /// No description provided for @aboutSacnSection3SubBullet3.
  ///
  /// In fr, this message translates to:
  /// **'Moins élégant mais parfois plus simple.'**
  String get aboutSacnSection3SubBullet3;

  /// No description provided for @aboutSacnSection4Pill1.
  ///
  /// In fr, this message translates to:
  /// **'Source A prio 100'**
  String get aboutSacnSection4Pill1;

  /// No description provided for @aboutSacnSection4Pill2.
  ///
  /// In fr, this message translates to:
  /// **'Source B prio 90'**
  String get aboutSacnSection4Pill2;

  /// No description provided for @aboutSacnSection4Paragraph.
  ///
  /// In fr, this message translates to:
  /// **'sACN gère une notion de priorité: si plusieurs sources envoient le même univers, le récepteur garde la source la plus prioritaire. Très utile avec une console principale + une console backup + un media server.'**
  String get aboutSacnSection4Paragraph;

  /// No description provided for @aboutSacnSection4Title.
  ///
  /// In fr, this message translates to:
  /// **'Pièges'**
  String get aboutSacnSection4Title;

  /// No description provided for @aboutSacnSection4Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Deux sources non voulues sur le même univers → \"ça se bat\".'**
  String get aboutSacnSection4Bullet1;

  /// No description provided for @aboutSacnSection4Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Priorité mal réglée → backup qui prend le dessus.'**
  String get aboutSacnSection4Bullet2;

  /// No description provided for @aboutSacnSection4Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Debug: couper une source et vérifier qui gagne.'**
  String get aboutSacnSection4Bullet3;

  /// No description provided for @aboutSacnSection5Pill1.
  ///
  /// In fr, this message translates to:
  /// **'IGMP'**
  String get aboutSacnSection5Pill1;

  /// No description provided for @aboutSacnSection5Pill2.
  ///
  /// In fr, this message translates to:
  /// **'Switch'**
  String get aboutSacnSection5Pill2;

  /// No description provided for @aboutSacnSection5Pill3.
  ///
  /// In fr, this message translates to:
  /// **'Wi-Fi non'**
  String get aboutSacnSection5Pill3;

  /// No description provided for @aboutSacnSection5Pill4.
  ///
  /// In fr, this message translates to:
  /// **'CPU node'**
  String get aboutSacnSection5Pill4;

  /// No description provided for @aboutSacnSection5Title.
  ///
  /// In fr, this message translates to:
  /// **'Ce qui casse en premier'**
  String get aboutSacnSection5Title;

  /// No description provided for @aboutSacnSection5Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Multicast sans IGMP → flood.'**
  String get aboutSacnSection5Bullet1;

  /// No description provided for @aboutSacnSection5Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Switch non adapté (buffers/CPU) → pertes.'**
  String get aboutSacnSection5Bullet2;

  /// No description provided for @aboutSacnSection5Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Wi-Fi → jitter/pertes.'**
  String get aboutSacnSection5Bullet3;

  /// No description provided for @aboutSacnSection5Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Nodes limités (ports, firmware).'**
  String get aboutSacnSection5Bullet4;

  /// No description provided for @aboutSacnSection5Subtitle.
  ///
  /// In fr, this message translates to:
  /// **'Règles simples'**
  String get aboutSacnSection5Subtitle;

  /// No description provided for @aboutSacnSection5SubBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Switch géré + IGMP snooping si beaucoup d’univers.'**
  String get aboutSacnSection5SubBullet1;

  /// No description provided for @aboutSacnSection5SubBullet2.
  ///
  /// In fr, this message translates to:
  /// **'VLAN dédié lumière si possible.'**
  String get aboutSacnSection5SubBullet2;

  /// No description provided for @aboutSacnSection5SubBullet3.
  ///
  /// In fr, this message translates to:
  /// **'Unicast pour isoler en dépannage.'**
  String get aboutSacnSection5SubBullet3;

  /// No description provided for @aboutSacnSection6Paragraph.
  ///
  /// In fr, this message translates to:
  /// **'Comme avec Art-Net, le RDM \"sur IP\" dépend souvent d’un mécanisme de proxy dans les nodes. Le standard sACN n’implique pas automatiquement que ton node fait du RDM correctement.'**
  String get aboutSacnSection6Paragraph;

  /// No description provided for @aboutSacnSection6Title.
  ///
  /// In fr, this message translates to:
  /// **'À vérifier dans la doc du node'**
  String get aboutSacnSection6Title;

  /// No description provided for @aboutSacnSection6Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Support RDM proxy / RDM over IP.'**
  String get aboutSacnSection6Bullet1;

  /// No description provided for @aboutSacnSection6Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Limitations (discovery only, commandes partielles).'**
  String get aboutSacnSection6Bullet2;

  /// No description provided for @aboutSacnSection6Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Compatibilité avec splitters/opto côté DMX.'**
  String get aboutSacnSection6Bullet3;

  /// No description provided for @aboutSacnSection6Subtitle.
  ///
  /// In fr, this message translates to:
  /// **'Méthode terrain'**
  String get aboutSacnSection6Subtitle;

  /// No description provided for @aboutSacnSection6SubBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Stabiliser DMX sans RDM.'**
  String get aboutSacnSection6SubBullet1;

  /// No description provided for @aboutSacnSection6SubBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Tester RDM sur une ligne simple et propre.'**
  String get aboutSacnSection6SubBullet2;

  /// No description provided for @aboutSacnSection6SubBullet3.
  ///
  /// In fr, this message translates to:
  /// **'Si soucis: désactiver RDM, puis isoler node/splitter.'**
  String get aboutSacnSection6SubBullet3;

  /// No description provided for @aboutSacnSection7Subtitle1.
  ///
  /// In fr, this message translates to:
  /// **'Multicast + IGMP (idée)'**
  String get aboutSacnSection7Subtitle1;

  /// No description provided for @aboutSacnSection7Subtitle2.
  ///
  /// In fr, this message translates to:
  /// **'Priorités (2 sources)'**
  String get aboutSacnSection7Subtitle2;

  /// No description provided for @aboutSacnChecklistTitle.
  ///
  /// In fr, this message translates to:
  /// **'Avant d’accuser \"le protocole\"'**
  String get aboutSacnChecklistTitle;

  /// No description provided for @aboutSacnChecklistBullet1.
  ///
  /// In fr, this message translates to:
  /// **'IGMP snooping activé si multicast.'**
  String get aboutSacnChecklistBullet1;

  /// No description provided for @aboutSacnChecklistBullet2.
  ///
  /// In fr, this message translates to:
  /// **'VLAN dédié si possible.'**
  String get aboutSacnChecklistBullet2;

  /// No description provided for @aboutSacnChecklistBullet3.
  ///
  /// In fr, this message translates to:
  /// **'Unicast en dépannage.'**
  String get aboutSacnChecklistBullet3;

  /// No description provided for @aboutSacnChecklistBullet4.
  ///
  /// In fr, this message translates to:
  /// **'Priorités cohérentes si multi-sources.'**
  String get aboutSacnChecklistBullet4;

  /// No description provided for @aboutSacnChecklistBullet5.
  ///
  /// In fr, this message translates to:
  /// **'Wi-Fi évité en prod.'**
  String get aboutSacnChecklistBullet5;

  /// No description provided for @sunTimesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Lever / coucher du soleil'**
  String get sunTimesTitle;

  /// No description provided for @sunTimesSectionSettings.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres'**
  String get sunTimesSectionSettings;

  /// No description provided for @sunTimesSectionResults.
  ///
  /// In fr, this message translates to:
  /// **'Résultats'**
  String get sunTimesSectionResults;

  /// No description provided for @sunTimesSectionTimeline.
  ///
  /// In fr, this message translates to:
  /// **'Timeline (pas de 30 min)'**
  String get sunTimesSectionTimeline;

  /// No description provided for @sunTimesSectionTwilight.
  ///
  /// In fr, this message translates to:
  /// **'À quoi correspondent les crépuscules ?'**
  String get sunTimesSectionTwilight;

  /// No description provided for @sunTimesSectionLux.
  ///
  /// In fr, this message translates to:
  /// **'Seuils de luminosité (repères)'**
  String get sunTimesSectionLux;

  /// No description provided for @sunTimesIntro.
  ///
  /// In fr, this message translates to:
  /// **'Choisis une ville et une date. Les horaires sont indicatifs (arrondis).'**
  String get sunTimesIntro;

  /// No description provided for @sunTimesLabelCity.
  ///
  /// In fr, this message translates to:
  /// **'Ville'**
  String get sunTimesLabelCity;

  /// No description provided for @sunTimesLabelDate.
  ///
  /// In fr, this message translates to:
  /// **'Date'**
  String get sunTimesLabelDate;

  /// No description provided for @sunTimesNoteApprox.
  ///
  /// In fr, this message translates to:
  /// **'Heures indicatives — peuvent varier selon l’altitude, la réfraction et la météo.'**
  String get sunTimesNoteApprox;

  /// No description provided for @sunTimesNoData.
  ///
  /// In fr, this message translates to:
  /// **'—'**
  String get sunTimesNoData;

  /// No description provided for @sunTimesResultSunrise.
  ///
  /// In fr, this message translates to:
  /// **'Lever du soleil'**
  String get sunTimesResultSunrise;

  /// No description provided for @sunTimesResultSunset.
  ///
  /// In fr, this message translates to:
  /// **'Coucher du soleil'**
  String get sunTimesResultSunset;

  /// No description provided for @sunTimesResultCivilDawn.
  ///
  /// In fr, this message translates to:
  /// **'Aube civile'**
  String get sunTimesResultCivilDawn;

  /// No description provided for @sunTimesResultCivilDusk.
  ///
  /// In fr, this message translates to:
  /// **'Crépuscule civil'**
  String get sunTimesResultCivilDusk;

  /// No description provided for @sunTimesResultNauticalDawn.
  ///
  /// In fr, this message translates to:
  /// **'Aube nautique'**
  String get sunTimesResultNauticalDawn;

  /// No description provided for @sunTimesResultNauticalDusk.
  ///
  /// In fr, this message translates to:
  /// **'Crépuscule nautique'**
  String get sunTimesResultNauticalDusk;

  /// No description provided for @sunTimesResultAstronomicalDawn.
  ///
  /// In fr, this message translates to:
  /// **'Aube astronomique'**
  String get sunTimesResultAstronomicalDawn;

  /// No description provided for @sunTimesResultAstronomicalDusk.
  ///
  /// In fr, this message translates to:
  /// **'Crépuscule astronomique'**
  String get sunTimesResultAstronomicalDusk;

  /// No description provided for @sunTimesTimelineStep30.
  ///
  /// In fr, this message translates to:
  /// **'Pas: 30 min'**
  String get sunTimesTimelineStep30;

  /// No description provided for @sunTimesTimelineDay.
  ///
  /// In fr, this message translates to:
  /// **'Jour'**
  String get sunTimesTimelineDay;

  /// No description provided for @sunTimesTimelineCivil.
  ///
  /// In fr, this message translates to:
  /// **'Civil'**
  String get sunTimesTimelineCivil;

  /// No description provided for @sunTimesTimelineNautical.
  ///
  /// In fr, this message translates to:
  /// **'Nautique'**
  String get sunTimesTimelineNautical;

  /// No description provided for @sunTimesTimelineAstronomical.
  ///
  /// In fr, this message translates to:
  /// **'Astronomique'**
  String get sunTimesTimelineAstronomical;

  /// No description provided for @sunTimesTimelineNight.
  ///
  /// In fr, this message translates to:
  /// **'Nuit'**
  String get sunTimesTimelineNight;

  /// No description provided for @sunTimesTwilightIntro.
  ///
  /// In fr, this message translates to:
  /// **'Les crépuscules sont définis par la hauteur du Soleil sous l’horizon. Ces définitions sont standardisées.'**
  String get sunTimesTwilightIntro;

  /// No description provided for @sunTimesTwilightCivilTitle.
  ///
  /// In fr, this message translates to:
  /// **'Civil (≈ 0° à −6°)'**
  String get sunTimesTwilightCivilTitle;

  /// No description provided for @sunTimesTwilightCivilBody.
  ///
  /// In fr, this message translates to:
  /// **'Fin/début de journée. On distingue encore bien le paysage.'**
  String get sunTimesTwilightCivilBody;

  /// No description provided for @sunTimesTwilightNauticalTitle.
  ///
  /// In fr, this message translates to:
  /// **'Nautique (≈ −6° à −12°)'**
  String get sunTimesTwilightNauticalTitle;

  /// No description provided for @sunTimesTwilightNauticalBody.
  ///
  /// In fr, this message translates to:
  /// **'La ligne d’horizon devient difficile à distinguer. Le ciel est nettement plus sombre.'**
  String get sunTimesTwilightNauticalBody;

  /// No description provided for @sunTimesTwilightAstronomicalTitle.
  ///
  /// In fr, this message translates to:
  /// **'Astronomique (≈ −12° à −18°)'**
  String get sunTimesTwilightAstronomicalTitle;

  /// No description provided for @sunTimesTwilightAstronomicalBody.
  ///
  /// In fr, this message translates to:
  /// **'Le ciel est proche de la nuit complète (peu de lumière résiduelle).'**
  String get sunTimesTwilightAstronomicalBody;

  /// No description provided for @sunTimesLuxNight.
  ///
  /// In fr, this message translates to:
  /// **'Nuit noire'**
  String get sunTimesLuxNight;

  /// No description provided for @sunTimesLuxAstro.
  ///
  /// In fr, this message translates to:
  /// **'Crépuscule astro'**
  String get sunTimesLuxAstro;

  /// No description provided for @sunTimesLuxNautical.
  ///
  /// In fr, this message translates to:
  /// **'Crépuscule naut.'**
  String get sunTimesLuxNautical;

  /// No description provided for @sunTimesLuxCivil.
  ///
  /// In fr, this message translates to:
  /// **'Crépuscule civil'**
  String get sunTimesLuxCivil;

  /// No description provided for @sunTimesLuxVeryLow.
  ///
  /// In fr, this message translates to:
  /// **'Très faible'**
  String get sunTimesLuxVeryLow;

  /// No description provided for @sunTimesLuxLow.
  ///
  /// In fr, this message translates to:
  /// **'Faible'**
  String get sunTimesLuxLow;

  /// No description provided for @sunTimesLuxDay.
  ///
  /// In fr, this message translates to:
  /// **'Jour'**
  String get sunTimesLuxDay;

  /// No description provided for @sunTimesLuxFullDay.
  ///
  /// In fr, this message translates to:
  /// **'Plein jour'**
  String get sunTimesLuxFullDay;

  /// No description provided for @sunTimesLuxNote.
  ///
  /// In fr, this message translates to:
  /// **'Ces valeurs sont des repères typiques (météo, saison, environnement → variations).'**
  String get sunTimesLuxNote;

  /// No description provided for @aboutVideoPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Vidéo — repères terrain'**
  String get aboutVideoPageTitle;

  /// No description provided for @aboutVideoSummaryCopy.
  ///
  /// In fr, this message translates to:
  /// **'VIDÉO — repères terrain\n• Résolution = taille (px). FPS = fluidité / latence.\n• 4:2:2 / 4:4:4 + 10-bit = qualité couleur.\n• SDI = robuste + longue distance.\n• HDMI = fragile + court.\n• NDI = IP (réseau), dépend du LAN.\n• Genlock / Timecode = synchro.'**
  String get aboutVideoSummaryCopy;

  /// No description provided for @aboutVideoChecklistCopy.
  ///
  /// In fr, this message translates to:
  /// **'VIDÉO — Checklist\n☐ Même résolution & FPS partout\n☐ HDMI : EDID / HDCP maîtrisés\n☐ SDI : câble 75Ω + bon standard\n☐ NDI/IP : LAN propre (switch, débit)\n☐ Genlock / Timecode si synchro requise\n☐ Tester source → écran direct'**
  String get aboutVideoChecklistCopy;

  /// No description provided for @aboutVideoChecklistCopyTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Copier'**
  String get aboutVideoChecklistCopyTooltip;

  /// No description provided for @aboutVideoFooterNote.
  ///
  /// In fr, this message translates to:
  /// **'Info indicative (terrain). Les comportements varient selon matériels.\nObjectif : comprendre vite et dépanner proprement.'**
  String get aboutVideoFooterNote;

  /// No description provided for @aboutVideoToc1.
  ///
  /// In fr, this message translates to:
  /// **'1) Bases vidéo (mots-clés)'**
  String get aboutVideoToc1;

  /// No description provided for @aboutVideoToc2.
  ///
  /// In fr, this message translates to:
  /// **'2) Résolution & FPS'**
  String get aboutVideoToc2;

  /// No description provided for @aboutVideoToc3.
  ///
  /// In fr, this message translates to:
  /// **'3) Couleur (4:4:4 / 4:2:2 / 10-bit)'**
  String get aboutVideoToc3;

  /// No description provided for @aboutVideoToc4.
  ///
  /// In fr, this message translates to:
  /// **'4) Sync (Genlock / Timecode)'**
  String get aboutVideoToc4;

  /// No description provided for @aboutVideoToc5.
  ///
  /// In fr, this message translates to:
  /// **'5) Câbles & distances'**
  String get aboutVideoToc5;

  /// No description provided for @aboutVideoToc6.
  ///
  /// In fr, this message translates to:
  /// **'6) SDI (3G / 6G / 12G)'**
  String get aboutVideoToc6;

  /// No description provided for @aboutVideoToc7.
  ///
  /// In fr, this message translates to:
  /// **'7) HDMI — terrain'**
  String get aboutVideoToc7;

  /// No description provided for @aboutVideoToc8.
  ///
  /// In fr, this message translates to:
  /// **'8) NDI — quand / pourquoi / limites'**
  String get aboutVideoToc8;

  /// No description provided for @aboutVideoToc9.
  ///
  /// In fr, this message translates to:
  /// **'9) Mapping / LED / multi-projo'**
  String get aboutVideoToc9;

  /// No description provided for @aboutVideoSection1Paragraph.
  ///
  /// In fr, this message translates to:
  /// **'La vidéo, c’est une image (pixels) envoyée à un rythme (FPS), avec une structure couleur (sampling / bit depth), transportée par un lien (SDI / HDMI / IP) et parfois synchronisée.'**
  String get aboutVideoSection1Paragraph;

  /// No description provided for @aboutVideoSection1Title.
  ///
  /// In fr, this message translates to:
  /// **'Vocabulaire utile'**
  String get aboutVideoSection1Title;

  /// No description provided for @aboutVideoSection1Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Résolution : largeur×hauteur (px).'**
  String get aboutVideoSection1Bullet1;

  /// No description provided for @aboutVideoSection1Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'FPS : fluidité / latence.'**
  String get aboutVideoSection1Bullet2;

  /// No description provided for @aboutVideoSection1Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Progressif (p) vs entrelacé (i).'**
  String get aboutVideoSection1Bullet3;

  /// No description provided for @aboutVideoSection1Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Codec : compression (H.264, H.265…).'**
  String get aboutVideoSection1Bullet4;

  /// No description provided for @aboutVideoSection1Bullet5.
  ///
  /// In fr, this message translates to:
  /// **'Latency : critique en live.'**
  String get aboutVideoSection1Bullet5;

  /// No description provided for @aboutVideoSection2Title.
  ///
  /// In fr, this message translates to:
  /// **'Résolution'**
  String get aboutVideoSection2Title;

  /// No description provided for @aboutVideoSection2Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'1080p = 1920×1080.'**
  String get aboutVideoSection2Bullet1;

  /// No description provided for @aboutVideoSection2Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'4K UHD = 3840×2160.'**
  String get aboutVideoSection2Bullet2;

  /// No description provided for @aboutVideoSection2Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'DCI 4K = 4096×2160 (cinéma).'**
  String get aboutVideoSection2Bullet3;

  /// No description provided for @aboutVideoSection2Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Plus de pixels = plus de débit.'**
  String get aboutVideoSection2Bullet4;

  /// No description provided for @aboutVideoSection2Title2.
  ///
  /// In fr, this message translates to:
  /// **'FPS'**
  String get aboutVideoSection2Title2;

  /// No description provided for @aboutVideoSection2Bullet5.
  ///
  /// In fr, this message translates to:
  /// **'25/50 : standard Europe.'**
  String get aboutVideoSection2Bullet5;

  /// No description provided for @aboutVideoSection2Bullet6.
  ///
  /// In fr, this message translates to:
  /// **'30/60 : standard US / devices.'**
  String get aboutVideoSection2Bullet6;

  /// No description provided for @aboutVideoSection2Bullet7.
  ///
  /// In fr, this message translates to:
  /// **'Éviter de mixer 50 et 60 sans conversion.'**
  String get aboutVideoSection2Bullet7;

  /// No description provided for @aboutVideoSection3Title.
  ///
  /// In fr, this message translates to:
  /// **'Sampling'**
  String get aboutVideoSection3Title;

  /// No description provided for @aboutVideoSection3Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'4:4:4 : graphismes / keying.'**
  String get aboutVideoSection3Bullet1;

  /// No description provided for @aboutVideoSection3Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'4:2:2 : pro courant.'**
  String get aboutVideoSection3Bullet2;

  /// No description provided for @aboutVideoSection3Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'4:2:0 : fichiers / stream.'**
  String get aboutVideoSection3Bullet3;

  /// No description provided for @aboutVideoSection3Title2.
  ///
  /// In fr, this message translates to:
  /// **'Bit depth'**
  String get aboutVideoSection3Title2;

  /// No description provided for @aboutVideoSection3Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'8-bit : standard.'**
  String get aboutVideoSection3Bullet4;

  /// No description provided for @aboutVideoSection3Bullet5.
  ///
  /// In fr, this message translates to:
  /// **'10-bit : meilleurs dégradés (HDR / LED).'**
  String get aboutVideoSection3Bullet5;

  /// No description provided for @aboutVideoSection4Title.
  ///
  /// In fr, this message translates to:
  /// **'Genlock'**
  String get aboutVideoSection4Title;

  /// No description provided for @aboutVideoSection4Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Synchronise le rafraîchissement image.'**
  String get aboutVideoSection4Bullet1;

  /// No description provided for @aboutVideoSection4Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Utile en multi-cam / LED / broadcast.'**
  String get aboutVideoSection4Bullet2;

  /// No description provided for @aboutVideoSection4Title2.
  ///
  /// In fr, this message translates to:
  /// **'Timecode'**
  String get aboutVideoSection4Title2;

  /// No description provided for @aboutVideoSection4Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Synchronisation temporelle.'**
  String get aboutVideoSection4Bullet3;

  /// No description provided for @aboutVideoSection4Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Ne remplace pas le genlock.'**
  String get aboutVideoSection4Bullet4;

  /// No description provided for @aboutVideoSection5Title.
  ///
  /// In fr, this message translates to:
  /// **'Règles simples'**
  String get aboutVideoSection5Title;

  /// No description provided for @aboutVideoSection5Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'HDMI : fragile, court.'**
  String get aboutVideoSection5Bullet1;

  /// No description provided for @aboutVideoSection5Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'SDI : robuste, long.'**
  String get aboutVideoSection5Bullet2;

  /// No description provided for @aboutVideoSection5Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Fibre : très long + EMI free.'**
  String get aboutVideoSection5Bullet3;

  /// No description provided for @aboutVideoSection6Title.
  ///
  /// In fr, this message translates to:
  /// **'Repères'**
  String get aboutVideoSection6Title;

  /// No description provided for @aboutVideoSection6Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'3G : 1080p60'**
  String get aboutVideoSection6Bullet1;

  /// No description provided for @aboutVideoSection6Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'6G : 2160p30'**
  String get aboutVideoSection6Bullet2;

  /// No description provided for @aboutVideoSection6Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'12G : 2160p60'**
  String get aboutVideoSection6Bullet3;

  /// No description provided for @aboutVideoSection7Title.
  ///
  /// In fr, this message translates to:
  /// **'À surveiller'**
  String get aboutVideoSection7Title;

  /// No description provided for @aboutVideoSection7Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'EDID'**
  String get aboutVideoSection7Bullet1;

  /// No description provided for @aboutVideoSection7Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'HDCP'**
  String get aboutVideoSection7Bullet2;

  /// No description provided for @aboutVideoSection7Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Longueurs'**
  String get aboutVideoSection7Bullet3;

  /// No description provided for @aboutVideoSection8Title.
  ///
  /// In fr, this message translates to:
  /// **'IP vidéo'**
  String get aboutVideoSection8Title;

  /// No description provided for @aboutVideoSection8Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Flexible.'**
  String get aboutVideoSection8Bullet1;

  /// No description provided for @aboutVideoSection8Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Charge réseau.'**
  String get aboutVideoSection8Bullet2;

  /// No description provided for @aboutVideoSection8Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'LAN propre requis.'**
  String get aboutVideoSection8Bullet3;

  /// No description provided for @aboutVideoSection9Title.
  ///
  /// In fr, this message translates to:
  /// **'Terrain'**
  String get aboutVideoSection9Title;

  /// No description provided for @aboutVideoSection9Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Même résolution / FPS.'**
  String get aboutVideoSection9Bullet1;

  /// No description provided for @aboutVideoSection9Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Mapping correct.'**
  String get aboutVideoSection9Bullet2;

  /// No description provided for @aboutVideoSection9Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Tester avec mires.'**
  String get aboutVideoSection9Bullet3;

  /// No description provided for @aboutVideoChecklistTitle.
  ///
  /// In fr, this message translates to:
  /// **'Avant de paniquer'**
  String get aboutVideoChecklistTitle;

  /// No description provided for @aboutVideoChecklistBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Vérifier résolution / FPS.'**
  String get aboutVideoChecklistBullet1;

  /// No description provided for @aboutVideoChecklistBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Tester source → écran.'**
  String get aboutVideoChecklistBullet2;

  /// No description provided for @aboutVideoChecklistBullet3.
  ///
  /// In fr, this message translates to:
  /// **'Simplifier la chaîne.'**
  String get aboutVideoChecklistBullet3;

  /// No description provided for @homeBpmSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Tap tempo, conversion BPM ↔ ms, Hz, mesure.'**
  String get homeBpmSubtitle;

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
  /// **'Réinitialiser les taps'**
  String get bpmResetTap;

  /// No description provided for @bpmDetectedLabel.
  ///
  /// In fr, this message translates to:
  /// **'BPM détecté'**
  String get bpmDetectedLabel;

  /// No description provided for @bpmTapHint.
  ///
  /// In fr, this message translates to:
  /// **'Tape plusieurs fois (idéalement 4 à 8 taps) pour obtenir une moyenne stable.'**
  String get bpmTapHint;

  /// No description provided for @bpmManualTitle.
  ///
  /// In fr, this message translates to:
  /// **'BPM manuel'**
  String get bpmManualTitle;

  /// No description provided for @bpmManualLabel.
  ///
  /// In fr, this message translates to:
  /// **'BPM'**
  String get bpmManualLabel;

  /// No description provided for @bpmManualHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex. 128'**
  String get bpmManualHint;

  /// No description provided for @commonAdd.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter'**
  String get commonAdd;

  /// No description provided for @commonEdit.
  ///
  /// In fr, this message translates to:
  /// **'Modifier'**
  String get commonEdit;

  /// No description provided for @commonDelete.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer'**
  String get commonDelete;

  /// No description provided for @commonCopied.
  ///
  /// In fr, this message translates to:
  /// **'Copié dans le presse-papiers.'**
  String get commonCopied;

  /// No description provided for @patchCreateGdtfTitle.
  ///
  /// In fr, this message translates to:
  /// **'Créer un GDTF (simple)'**
  String get patchCreateGdtfTitle;

  /// No description provided for @patchCreateGdtfSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Création manuelle d’un device sous forme de tableau.'**
  String get patchCreateGdtfSubtitle;

  /// No description provided for @gdtfSimpleTitle.
  ///
  /// In fr, this message translates to:
  /// **'Créateur GDTF (simple)'**
  String get gdtfSimpleTitle;

  /// No description provided for @gdtfDeviceSectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Appareil'**
  String get gdtfDeviceSectionTitle;

  /// No description provided for @gdtfChannelsSectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Canaux'**
  String get gdtfChannelsSectionTitle;

  /// No description provided for @gdtfImportJsonTitle.
  ///
  /// In fr, this message translates to:
  /// **'Importer JSON'**
  String get gdtfImportJsonTitle;

  /// No description provided for @gdtfExportJsonTitle.
  ///
  /// In fr, this message translates to:
  /// **'Exporter JSON'**
  String get gdtfExportJsonTitle;

  /// No description provided for @gdtfImportJsonHint.
  ///
  /// In fr, this message translates to:
  /// **'Colle le JSON ici'**
  String get gdtfImportJsonHint;

  /// No description provided for @gdtfManufacturerLabel.
  ///
  /// In fr, this message translates to:
  /// **'Fabricant'**
  String get gdtfManufacturerLabel;

  /// No description provided for @gdtfModelLabel.
  ///
  /// In fr, this message translates to:
  /// **'Modèle'**
  String get gdtfModelLabel;

  /// No description provided for @gdtfModeNameLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nom du mode'**
  String get gdtfModeNameLabel;

  /// No description provided for @gdtfChannelsCountLabel.
  ///
  /// In fr, this message translates to:
  /// **'Canaux'**
  String get gdtfChannelsCountLabel;

  /// No description provided for @gdtfFootprintLabel.
  ///
  /// In fr, this message translates to:
  /// **'Footprint'**
  String get gdtfFootprintLabel;

  /// No description provided for @gdtfColIndex.
  ///
  /// In fr, this message translates to:
  /// **'#'**
  String get gdtfColIndex;

  /// No description provided for @gdtfColName.
  ///
  /// In fr, this message translates to:
  /// **'Nom'**
  String get gdtfColName;

  /// No description provided for @gdtfColDmx.
  ///
  /// In fr, this message translates to:
  /// **'DMX'**
  String get gdtfColDmx;

  /// No description provided for @gdtfColType.
  ///
  /// In fr, this message translates to:
  /// **'Type'**
  String get gdtfColType;

  /// No description provided for @gdtfColRes.
  ///
  /// In fr, this message translates to:
  /// **'8/16'**
  String get gdtfColRes;

  /// No description provided for @gdtfColDefault.
  ///
  /// In fr, this message translates to:
  /// **'Défaut'**
  String get gdtfColDefault;

  /// No description provided for @gdtfColActions.
  ///
  /// In fr, this message translates to:
  /// **'Actions'**
  String get gdtfColActions;

  /// No description provided for @gdtfMoveUp.
  ///
  /// In fr, this message translates to:
  /// **'Monter'**
  String get gdtfMoveUp;

  /// No description provided for @gdtfMoveDown.
  ///
  /// In fr, this message translates to:
  /// **'Descendre'**
  String get gdtfMoveDown;

  /// No description provided for @gdtfChannelAddTitle.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter un canal'**
  String get gdtfChannelAddTitle;

  /// No description provided for @gdtfChannelEditTitle.
  ///
  /// In fr, this message translates to:
  /// **'Modifier le canal'**
  String get gdtfChannelEditTitle;

  /// No description provided for @gdtfFieldName.
  ///
  /// In fr, this message translates to:
  /// **'Nom'**
  String get gdtfFieldName;

  /// No description provided for @gdtfFieldDmx.
  ///
  /// In fr, this message translates to:
  /// **'Adresse DMX'**
  String get gdtfFieldDmx;

  /// No description provided for @gdtfFieldType.
  ///
  /// In fr, this message translates to:
  /// **'Type'**
  String get gdtfFieldType;

  /// No description provided for @gdtfFieldResolution.
  ///
  /// In fr, this message translates to:
  /// **'Résolution'**
  String get gdtfFieldResolution;

  /// No description provided for @gdtfRes8.
  ///
  /// In fr, this message translates to:
  /// **'8-bit'**
  String get gdtfRes8;

  /// No description provided for @gdtfRes16.
  ///
  /// In fr, this message translates to:
  /// **'16-bit'**
  String get gdtfRes16;

  /// No description provided for @gdtfFieldDefault8.
  ///
  /// In fr, this message translates to:
  /// **'Valeur par défaut (0–255)'**
  String get gdtfFieldDefault8;

  /// No description provided for @gdtfFieldDefault16.
  ///
  /// In fr, this message translates to:
  /// **'Valeur par défaut (0–65535)'**
  String get gdtfFieldDefault16;

  /// No description provided for @gdtfDefaultChannelName.
  ///
  /// In fr, this message translates to:
  /// **'Canal'**
  String get gdtfDefaultChannelName;

  /// No description provided for @gdtfMvpHint.
  ///
  /// In fr, this message translates to:
  /// **'MVP : export JSON (presse-papiers). L’export GDTF réel (XML+ZIP) viendra ensuite.'**
  String get gdtfMvpHint;

  /// No description provided for @gdtfTypeDimmer.
  ///
  /// In fr, this message translates to:
  /// **'Dimmer'**
  String get gdtfTypeDimmer;

  /// No description provided for @gdtfTypePan.
  ///
  /// In fr, this message translates to:
  /// **'Pan'**
  String get gdtfTypePan;

  /// No description provided for @gdtfTypeTilt.
  ///
  /// In fr, this message translates to:
  /// **'Tilt'**
  String get gdtfTypeTilt;

  /// No description provided for @gdtfTypeColor.
  ///
  /// In fr, this message translates to:
  /// **'Couleur'**
  String get gdtfTypeColor;

  /// No description provided for @gdtfTypeGobo.
  ///
  /// In fr, this message translates to:
  /// **'Gobo'**
  String get gdtfTypeGobo;

  /// No description provided for @gdtfTypeShutter.
  ///
  /// In fr, this message translates to:
  /// **'Shutter'**
  String get gdtfTypeShutter;

  /// No description provided for @gdtfTypePrism.
  ///
  /// In fr, this message translates to:
  /// **'Prism'**
  String get gdtfTypePrism;

  /// No description provided for @gdtfTypeZoom.
  ///
  /// In fr, this message translates to:
  /// **'Zoom'**
  String get gdtfTypeZoom;

  /// No description provided for @gdtfTypeFocus.
  ///
  /// In fr, this message translates to:
  /// **'Focus'**
  String get gdtfTypeFocus;

  /// No description provided for @gdtfTypeIris.
  ///
  /// In fr, this message translates to:
  /// **'Iris'**
  String get gdtfTypeIris;

  /// No description provided for @gdtfTypeEffect.
  ///
  /// In fr, this message translates to:
  /// **'Effet'**
  String get gdtfTypeEffect;

  /// No description provided for @gdtfTypeCustom.
  ///
  /// In fr, this message translates to:
  /// **'Personnalisé'**
  String get gdtfTypeCustom;

  /// No description provided for @gdtfEasyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Créer un GDTF (simple)'**
  String get gdtfEasyTitle;

  /// No description provided for @gdtfTemplatesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Présélections'**
  String get gdtfTemplatesTitle;

  /// No description provided for @gdtfCreateDefaultPreset.
  ///
  /// In fr, this message translates to:
  /// **'Créer le preset par défaut'**
  String get gdtfCreateDefaultPreset;

  /// No description provided for @gdtfTemplatesHint.
  ///
  /// In fr, this message translates to:
  /// **'Crée une base rapide (dimmer, shutter, pan, tilt, RGB, etc.) puis complète les adresses DMX et les défauts.'**
  String get gdtfTemplatesHint;

  /// No description provided for @gdtfExportButton.
  ///
  /// In fr, this message translates to:
  /// **'Exporter GDTF'**
  String get gdtfExportButton;

  /// No description provided for @gdtfExportHint.
  ///
  /// In fr, this message translates to:
  /// **'Export .gdtf minimal (description.xml) puis partage (Mail, WhatsApp, AirDrop, Drive…).'**
  String get gdtfExportHint;

  /// No description provided for @gdtfExportNeedDmx.
  ///
  /// In fr, this message translates to:
  /// **'Ajoute au moins une adresse DMX pour exporter.'**
  String get gdtfExportNeedDmx;

  /// No description provided for @gdtfExportDone.
  ///
  /// In fr, this message translates to:
  /// **'GDTF exporté.'**
  String get gdtfExportDone;

  /// No description provided for @gdtfExportError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible d’exporter le GDTF.'**
  String get gdtfExportError;

  /// No description provided for @gdtfShareSubject.
  ///
  /// In fr, this message translates to:
  /// **'Fichier GDTF'**
  String get gdtfShareSubject;

  /// No description provided for @gdtfShareText.
  ///
  /// In fr, this message translates to:
  /// **'Voici le fichier GDTF exporté.'**
  String get gdtfShareText;

  /// No description provided for @gdtfFieldRole.
  ///
  /// In fr, this message translates to:
  /// **'Paramètre'**
  String get gdtfFieldRole;

  /// No description provided for @gdtfDmxHint.
  ///
  /// In fr, this message translates to:
  /// **'Vide ou 1–512'**
  String get gdtfDmxHint;

  /// No description provided for @gdtfFieldDefault.
  ///
  /// In fr, this message translates to:
  /// **'Défaut'**
  String get gdtfFieldDefault;

  /// No description provided for @gdtfDefaultHint8.
  ///
  /// In fr, this message translates to:
  /// **'0–255'**
  String get gdtfDefaultHint8;

  /// No description provided for @gdtfDefaultHint16.
  ///
  /// In fr, this message translates to:
  /// **'0–65535'**
  String get gdtfDefaultHint16;

  /// No description provided for @gdtfChannelDefaultName.
  ///
  /// In fr, this message translates to:
  /// **'Canal'**
  String get gdtfChannelDefaultName;

  /// No description provided for @gdtfRoleEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Vide / Inconnu'**
  String get gdtfRoleEmpty;

  /// No description provided for @gdtfRoleDimmer.
  ///
  /// In fr, this message translates to:
  /// **'Dimmer'**
  String get gdtfRoleDimmer;

  /// No description provided for @gdtfRoleShutter.
  ///
  /// In fr, this message translates to:
  /// **'Shutter'**
  String get gdtfRoleShutter;

  /// No description provided for @gdtfRolePan.
  ///
  /// In fr, this message translates to:
  /// **'Pan'**
  String get gdtfRolePan;

  /// No description provided for @gdtfRoleTilt.
  ///
  /// In fr, this message translates to:
  /// **'Tilt'**
  String get gdtfRoleTilt;

  /// No description provided for @gdtfRoleRed.
  ///
  /// In fr, this message translates to:
  /// **'Rouge (R)'**
  String get gdtfRoleRed;

  /// No description provided for @gdtfRoleGreen.
  ///
  /// In fr, this message translates to:
  /// **'Vert (G)'**
  String get gdtfRoleGreen;

  /// No description provided for @gdtfRoleBlue.
  ///
  /// In fr, this message translates to:
  /// **'Bleu (B)'**
  String get gdtfRoleBlue;

  /// No description provided for @gdtfRoleColor.
  ///
  /// In fr, this message translates to:
  /// **'Couleur'**
  String get gdtfRoleColor;

  /// No description provided for @gdtfRoleGobo.
  ///
  /// In fr, this message translates to:
  /// **'Gobo'**
  String get gdtfRoleGobo;

  /// No description provided for @gdtfRoleZoom.
  ///
  /// In fr, this message translates to:
  /// **'Zoom'**
  String get gdtfRoleZoom;

  /// No description provided for @gdtfRoleFocus.
  ///
  /// In fr, this message translates to:
  /// **'Focus'**
  String get gdtfRoleFocus;

  /// No description provided for @gdtfRolePrism.
  ///
  /// In fr, this message translates to:
  /// **'Prism'**
  String get gdtfRolePrism;

  /// No description provided for @gdtfRoleEffect.
  ///
  /// In fr, this message translates to:
  /// **'Effet'**
  String get gdtfRoleEffect;

  /// No description provided for @gdtfRoleControl.
  ///
  /// In fr, this message translates to:
  /// **'Control'**
  String get gdtfRoleControl;

  /// No description provided for @gdtfRoleCustom.
  ///
  /// In fr, this message translates to:
  /// **'Custom'**
  String get gdtfRoleCustom;

  /// No description provided for @gdtfResUnknown.
  ///
  /// In fr, this message translates to:
  /// **'Vide'**
  String get gdtfResUnknown;

  /// No description provided for @gdtfPresetDimmer.
  ///
  /// In fr, this message translates to:
  /// **'Dimmer'**
  String get gdtfPresetDimmer;

  /// No description provided for @gdtfPresetShutter.
  ///
  /// In fr, this message translates to:
  /// **'Shutter'**
  String get gdtfPresetShutter;

  /// No description provided for @gdtfPresetPan.
  ///
  /// In fr, this message translates to:
  /// **'Pan'**
  String get gdtfPresetPan;

  /// No description provided for @gdtfPresetTilt.
  ///
  /// In fr, this message translates to:
  /// **'Tilt'**
  String get gdtfPresetTilt;

  /// No description provided for @gdtfPresetRed.
  ///
  /// In fr, this message translates to:
  /// **'R'**
  String get gdtfPresetRed;

  /// No description provided for @gdtfPresetGreen.
  ///
  /// In fr, this message translates to:
  /// **'G'**
  String get gdtfPresetGreen;

  /// No description provided for @gdtfPresetBlue.
  ///
  /// In fr, this message translates to:
  /// **'B'**
  String get gdtfPresetBlue;

  /// No description provided for @gdtfPresetColor1.
  ///
  /// In fr, this message translates to:
  /// **'Color 1'**
  String get gdtfPresetColor1;

  /// No description provided for @gdtfPresetGobo1.
  ///
  /// In fr, this message translates to:
  /// **'Gobo 1'**
  String get gdtfPresetGobo1;

  /// No description provided for @gdtfPresetZoom.
  ///
  /// In fr, this message translates to:
  /// **'Zoom'**
  String get gdtfPresetZoom;

  /// No description provided for @gdtfPresetFocus.
  ///
  /// In fr, this message translates to:
  /// **'Focus'**
  String get gdtfPresetFocus;

  /// No description provided for @gdtfPresetPrism.
  ///
  /// In fr, this message translates to:
  /// **'Prism'**
  String get gdtfPresetPrism;

  /// No description provided for @gdtfPresetEffect.
  ///
  /// In fr, this message translates to:
  /// **'Effet'**
  String get gdtfPresetEffect;

  /// No description provided for @gdtfPresetControl.
  ///
  /// In fr, this message translates to:
  /// **'Control'**
  String get gdtfPresetControl;

  /// No description provided for @commonApply.
  ///
  /// In fr, this message translates to:
  /// **'Appliquer'**
  String get commonApply;

  /// No description provided for @gdtfPresetLabel.
  ///
  /// In fr, this message translates to:
  /// **'Choix'**
  String get gdtfPresetLabel;

  /// No description provided for @gdtfPresetFixtureSimple.
  ///
  /// In fr, this message translates to:
  /// **'Fixture simple'**
  String get gdtfPresetFixtureSimple;

  /// No description provided for @gdtfPresetBarreLed.
  ///
  /// In fr, this message translates to:
  /// **'Barre LED'**
  String get gdtfPresetBarreLed;

  /// No description provided for @gdtfTemplatesHintShort.
  ///
  /// In fr, this message translates to:
  /// **'Choisis un preset puis applique. Tu peux ensuite ajuster DMX, défauts, et réordonner par glisser-déposer.'**
  String get gdtfTemplatesHintShort;

  /// No description provided for @gdtfExportNeedChannels.
  ///
  /// In fr, this message translates to:
  /// **'Ajoute au moins un canal pour exporter.'**
  String get gdtfExportNeedChannels;

  /// No description provided for @homeDrawerContact.
  ///
  /// In fr, this message translates to:
  /// **'Contacter le développeur'**
  String get homeDrawerContact;

  /// No description provided for @homeDrawerSuggestItem.
  ///
  /// In fr, this message translates to:
  /// **'Proposer un article au catalogue'**
  String get homeDrawerSuggestItem;

  /// No description provided for @homeErrorOpenEmail.
  ///
  /// In fr, this message translates to:
  /// **'Impossible d\'ouvrir l\'application e-mail.'**
  String get homeErrorOpenEmail;

  /// No description provided for @homeErrorOpenForm.
  ///
  /// In fr, this message translates to:
  /// **'Impossible d\'ouvrir le formulaire.'**
  String get homeErrorOpenForm;

  /// No description provided for @homeContactEmailSubject.
  ///
  /// In fr, this message translates to:
  /// **'Question concernant Mon App Tech'**
  String get homeContactEmailSubject;

  /// No description provided for @bpmManualHelp.
  ///
  /// In fr, this message translates to:
  /// **'Si un BPM manuel est saisi, il est prioritaire sur le tap tempo.'**
  String get bpmManualHelp;

  /// No description provided for @bpmConversionsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Conversions'**
  String get bpmConversionsTitle;

  /// No description provided for @bpmActiveLabel.
  ///
  /// In fr, this message translates to:
  /// **'BPM actif'**
  String get bpmActiveLabel;

  /// No description provided for @bpmMsPerBeat.
  ///
  /// In fr, this message translates to:
  /// **'Durée d’un beat'**
  String get bpmMsPerBeat;

  /// No description provided for @bpmHz.
  ///
  /// In fr, this message translates to:
  /// **'Fréquence'**
  String get bpmHz;

  /// No description provided for @bpmSecPerBar44.
  ///
  /// In fr, this message translates to:
  /// **'Durée d’une mesure (4/4)'**
  String get bpmSecPerBar44;

  /// No description provided for @bpmDisclaimer.
  ///
  /// In fr, this message translates to:
  /// **'Indication approximative. Vérifie au métronome si c’est critique.'**
  String get bpmDisclaimer;

  /// No description provided for @laserToolsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Outils'**
  String get laserToolsTitle;

  /// No description provided for @laserBeamSizeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Taille du faisceau'**
  String get laserBeamSizeTitle;

  /// No description provided for @laserBeamSizeSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Diamètre, rayon et surface du spot à une distance donnée.'**
  String get laserBeamSizeSubtitle;

  /// No description provided for @laserBeamInputsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres'**
  String get laserBeamInputsTitle;

  /// No description provided for @laserBeamDistanceLabel.
  ///
  /// In fr, this message translates to:
  /// **'Distance'**
  String get laserBeamDistanceLabel;

  /// No description provided for @laserBeamDistanceHint.
  ///
  /// In fr, this message translates to:
  /// **'m (ex. 12)'**
  String get laserBeamDistanceHint;

  /// No description provided for @laserBeamFormulaHint.
  ///
  /// In fr, this message translates to:
  /// **'Calcul : D(z) = D0 + θ · z (θ en rad, angle plein).'**
  String get laserBeamFormulaHint;

  /// No description provided for @laserBeamResultsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Résultats'**
  String get laserBeamResultsTitle;

  /// No description provided for @laserBeamDiameterAtDistance.
  ///
  /// In fr, this message translates to:
  /// **'Diamètre à la distance'**
  String get laserBeamDiameterAtDistance;

  /// No description provided for @laserBeamRadiusAtDistance.
  ///
  /// In fr, this message translates to:
  /// **'Rayon à la distance'**
  String get laserBeamRadiusAtDistance;

  /// No description provided for @laserBeamAreaAtDistance.
  ///
  /// In fr, this message translates to:
  /// **'Surface du spot'**
  String get laserBeamAreaAtDistance;

  /// No description provided for @sunTimesPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Lever / coucher du soleil'**
  String get sunTimesPageTitle;

  /// No description provided for @sunTimesSelectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres'**
  String get sunTimesSelectionTitle;

  /// No description provided for @sunTimesCityLabel.
  ///
  /// In fr, this message translates to:
  /// **'Ville'**
  String get sunTimesCityLabel;

  /// No description provided for @sunTimesDateLabel.
  ///
  /// In fr, this message translates to:
  /// **'Date'**
  String get sunTimesDateLabel;

  /// No description provided for @sunTimesResultsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Résultats'**
  String get sunTimesResultsTitle;

  /// No description provided for @sunTimesSunriseLabel.
  ///
  /// In fr, this message translates to:
  /// **'Lever du soleil'**
  String get sunTimesSunriseLabel;

  /// No description provided for @sunTimesSunsetLabel.
  ///
  /// In fr, this message translates to:
  /// **'Coucher du soleil'**
  String get sunTimesSunsetLabel;

  /// No description provided for @sunTimesDayLengthLabel.
  ///
  /// In fr, this message translates to:
  /// **'Durée du jour'**
  String get sunTimesDayLengthLabel;

  /// No description provided for @sunTimesDisclaimer.
  ///
  /// In fr, this message translates to:
  /// **'Valeurs indicatives (modèle astronomique). Vérifie avec une source officielle si nécessaire (événement, sécurité, tournage).'**
  String get sunTimesDisclaimer;

  /// No description provided for @sunTimesThresholdTitle.
  ///
  /// In fr, this message translates to:
  /// **'Seuils de luminosité (repères)'**
  String get sunTimesThresholdTitle;

  /// No description provided for @sunTimesThresholdIntro.
  ///
  /// In fr, this message translates to:
  /// **'Ordres de grandeur utiles pour anticiper la lumière ambiante (très variable selon météo, latitude, saison, obstacles, pollution lumineuse).'**
  String get sunTimesThresholdIntro;

  /// No description provided for @sunTimesLuxDaylight.
  ///
  /// In fr, this message translates to:
  /// **'Plein jour (hors soleil direct)'**
  String get sunTimesLuxDaylight;

  /// No description provided for @sunTimesLuxOvercast.
  ///
  /// In fr, this message translates to:
  /// **'Ciel couvert (typique)'**
  String get sunTimesLuxOvercast;

  /// No description provided for @sunTimesLuxSunrise.
  ///
  /// In fr, this message translates to:
  /// **'Lever / coucher (clair)'**
  String get sunTimesLuxSunrise;

  /// No description provided for @sunTimesLuxCivilTwilight.
  ///
  /// In fr, this message translates to:
  /// **'Limite crépuscule civil (clair)'**
  String get sunTimesLuxCivilTwilight;

  /// No description provided for @sunTimesLuxFullMoon.
  ///
  /// In fr, this message translates to:
  /// **'Pleine lune (clair)'**
  String get sunTimesLuxFullMoon;

  /// No description provided for @sunTimesThresholdNote.
  ///
  /// In fr, this message translates to:
  /// **'Astuce : pour un repérage \"utilisable sans éclairage\", on vise souvent > 100–300 lx. Pour un travail fin, plutôt 500 lx et +.'**
  String get sunTimesThresholdNote;

  /// No description provided for @sunTimesParamsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres'**
  String get sunTimesParamsTitle;

  /// No description provided for @sunTimesPickDate.
  ///
  /// In fr, this message translates to:
  /// **'Choisir une date'**
  String get sunTimesPickDate;

  /// No description provided for @sunTimesSunrise.
  ///
  /// In fr, this message translates to:
  /// **'Lever'**
  String get sunTimesSunrise;

  /// No description provided for @sunTimesSunset.
  ///
  /// In fr, this message translates to:
  /// **'Coucher'**
  String get sunTimesSunset;

  /// No description provided for @sunTimesDayLength.
  ///
  /// In fr, this message translates to:
  /// **'Durée du jour'**
  String get sunTimesDayLength;

  /// No description provided for @sunTimesPolarNote.
  ///
  /// In fr, this message translates to:
  /// **'Note : dans les zones proches des pôles, lever/coucher peuvent être absents selon la saison.'**
  String get sunTimesPolarNote;

  /// No description provided for @sunTimesLuxThresholdTitle.
  ///
  /// In fr, this message translates to:
  /// **'Seuils de luminosité (repères)'**
  String get sunTimesLuxThresholdTitle;

  /// No description provided for @sunTimesLuxBulletNightDark.
  ///
  /// In fr, this message translates to:
  /// **'Nuit noire : < 1 lux'**
  String get sunTimesLuxBulletNightDark;

  /// No description provided for @sunTimesLuxBulletNightMoon.
  ///
  /// In fr, this message translates to:
  /// **'Nuit (lune) : ~ 0,1–1 lux'**
  String get sunTimesLuxBulletNightMoon;

  /// No description provided for @sunTimesLuxBulletFullMoon.
  ///
  /// In fr, this message translates to:
  /// **'Pleine lune : ~ 0,1–0,3 lux'**
  String get sunTimesLuxBulletFullMoon;

  /// No description provided for @sunTimesLuxBulletCivilTwilight.
  ///
  /// In fr, this message translates to:
  /// **'Crépuscule civil : Soleil à -6°'**
  String get sunTimesLuxBulletCivilTwilight;

  /// No description provided for @sunTimesLuxBulletUrbanLow.
  ///
  /// In fr, this message translates to:
  /// **'Éclairage urbain faible : ~ 5–20 lux'**
  String get sunTimesLuxBulletUrbanLow;

  /// No description provided for @sunTimesLuxBulletOfficeLow.
  ///
  /// In fr, this message translates to:
  /// **'Bureau faible : ~ 100–300 lux'**
  String get sunTimesLuxBulletOfficeLow;

  /// No description provided for @sunTimesLuxBulletOfficeStd.
  ///
  /// In fr, this message translates to:
  /// **'Bureau standard : ~ 300–500 lux'**
  String get sunTimesLuxBulletOfficeStd;

  /// No description provided for @sunTimesLuxBulletOutdoorDay.
  ///
  /// In fr, this message translates to:
  /// **'Extérieur jour : ~ 10 000–25 000 lux'**
  String get sunTimesLuxBulletOutdoorDay;

  /// No description provided for @sunTimesLuxBulletDirectSun.
  ///
  /// In fr, this message translates to:
  /// **'Soleil direct : ~ 100 000 lux'**
  String get sunTimesLuxBulletDirectSun;

  /// No description provided for @sunTimesLuxDisclaimer.
  ///
  /// In fr, this message translates to:
  /// **'Repères indicatifs : météo/nuages, environnement, saison et relief peuvent fortement varier.'**
  String get sunTimesLuxDisclaimer;

  /// No description provided for @sunTimesTwilightTitle.
  ///
  /// In fr, this message translates to:
  /// **'Crépuscules : à quoi ça correspond'**
  String get sunTimesTwilightTitle;

  /// No description provided for @sunTimesTwilightCivil.
  ///
  /// In fr, this message translates to:
  /// **'Civil (-6°) : lumière encore suffisante pour distinguer l’environnement sans éclairage artificiel.'**
  String get sunTimesTwilightCivil;

  /// No description provided for @sunTimesTwilightNautical.
  ///
  /// In fr, this message translates to:
  /// **'Nautique (-12°) : l’horizon devient difficile à distinguer ; étoiles visibles.'**
  String get sunTimesTwilightNautical;

  /// No description provided for @sunTimesTwilightAstronomical.
  ///
  /// In fr, this message translates to:
  /// **'Astronomique (-18°) : le ciel est considéré comme \"noir\" (hors pollution lumineise).'**
  String get sunTimesTwilightAstronomical;

  /// No description provided for @sunTimesTwilightAnglesNote.
  ///
  /// In fr, this message translates to:
  /// **'Angles exprimés en degrés sous l’horizon (Soleil négatif).'**
  String get sunTimesTwilightAnglesNote;

  /// No description provided for @sunTimesLuxBulletAstronomicalTwilight.
  ///
  /// In fr, this message translates to:
  /// **'Crépuscule astronomique : Soleil à -18°'**
  String get sunTimesLuxBulletAstronomicalTwilight;

  /// No description provided for @sunTimesTimelineTitleStep30.
  ///
  /// In fr, this message translates to:
  /// **'Timeline (pas 30 min)'**
  String get sunTimesTimelineTitleStep30;

  /// No description provided for @sunTimesTimelineColTime.
  ///
  /// In fr, this message translates to:
  /// **'Heure'**
  String get sunTimesTimelineColTime;

  /// No description provided for @sunTimesTimelineColElevation.
  ///
  /// In fr, this message translates to:
  /// **'Élévation'**
  String get sunTimesTimelineColElevation;

  /// No description provided for @sunTimesTimelineColMarker.
  ///
  /// In fr, this message translates to:
  /// **'Repère'**
  String get sunTimesTimelineColMarker;

  /// No description provided for @sunTimesTimelineColLux.
  ///
  /// In fr, this message translates to:
  /// **'Lux (ordre)'**
  String get sunTimesTimelineColLux;

  /// No description provided for @sunTimesTimelineFootnote.
  ///
  /// In fr, this message translates to:
  /// **'Repères indicatifs (météo/nuages, environnement, saison) — utile pour préparer un show.'**
  String get sunTimesTimelineFootnote;

  /// En-tête de colonne : subnet Art-Net (0–15).
  ///
  /// In fr, this message translates to:
  /// **'Subnet'**
  String get aboutUniverseToArtnetColSubnet;

  /// No description provided for @appVersionLabel.
  ///
  /// In fr, this message translates to:
  /// **'Version {version} ({build})'**
  String appVersionLabel(Object version, Object build);

  /// No description provided for @appVersionLabelNoBuild.
  ///
  /// In fr, this message translates to:
  /// **'Version {version}'**
  String appVersionLabelNoBuild(Object version);

  /// En-tête de colonne : univers Art-Net (0–15).
  ///
  /// In fr, this message translates to:
  /// **'Univers'**
  String get aboutUniverseToArtnetColUniverse;

  /// Video LED page result label
  ///
  /// In fr, this message translates to:
  /// **'Résolution mur'**
  String get videoLedResultWallResolution;

  /// Video LED page result label
  ///
  /// In fr, this message translates to:
  /// **'Taille mur'**
  String get videoLedResultWallSize;

  /// Video LED page result label
  ///
  /// In fr, this message translates to:
  /// **'Dalle'**
  String get videoLedResultTile;

  /// Video LED page result label
  ///
  /// In fr, this message translates to:
  /// **'Pitch'**
  String get videoLedResultPitch;

  /// No description provided for @lightFilterLedTabConvert.
  ///
  /// In fr, this message translates to:
  /// **'Conversion'**
  String get lightFilterLedTabConvert;

  /// No description provided for @lightFilterLedTabProfiles.
  ///
  /// In fr, this message translates to:
  /// **'Mes fixtures'**
  String get lightFilterLedTabProfiles;

  /// No description provided for @lightFilterLedSourceLabel.
  ///
  /// In fr, this message translates to:
  /// **'Source lumineuse'**
  String get lightFilterLedSourceLabel;

  /// No description provided for @lightFilterLedEngineRgbww.
  ///
  /// In fr, this message translates to:
  /// **'RGBWW (blanc chaud + froid)'**
  String get lightFilterLedEngineRgbww;

  /// No description provided for @lightFilterLedEngineRgbaw.
  ///
  /// In fr, this message translates to:
  /// **'RGBAW'**
  String get lightFilterLedEngineRgbaw;

  /// No description provided for @lightFilterLedEngineRgbauv.
  ///
  /// In fr, this message translates to:
  /// **'RGBAUV'**
  String get lightFilterLedEngineRgbauv;

  /// No description provided for @lightFilterLedEngineRgbwauv.
  ///
  /// In fr, this message translates to:
  /// **'RGBWAUV'**
  String get lightFilterLedEngineRgbwauv;

  /// No description provided for @lightFilterLedEngineRgbrcl.
  ///
  /// In fr, this message translates to:
  /// **'RGBRCL (Red, Cyan, Lime)'**
  String get lightFilterLedEngineRgbrcl;

  /// No description provided for @lightFilterLedEngineCmy.
  ///
  /// In fr, this message translates to:
  /// **'CMY'**
  String get lightFilterLedEngineCmy;

  /// No description provided for @lightFilterLedSaveProfileTitle.
  ///
  /// In fr, this message translates to:
  /// **'Sauvegarder le profil fixture'**
  String get lightFilterLedSaveProfileTitle;

  /// No description provided for @lightFilterLedProfileNameLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nom de la fixture'**
  String get lightFilterLedProfileNameLabel;

  /// No description provided for @patchMvrViewTable.
  ///
  /// In fr, this message translates to:
  /// **'Tableur'**
  String get patchMvrViewTable;

  /// No description provided for @patchMvrViewVisual.
  ///
  /// In fr, this message translates to:
  /// **'Visuel'**
  String get patchMvrViewVisual;

  /// No description provided for @consoleTitle.
  ///
  /// In fr, this message translates to:
  /// **'Console'**
  String get consoleTitle;

  /// No description provided for @consoleSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch DMX et outils GDTF'**
  String get consoleSubtitle;

  /// No description provided for @consolePatchTitle.
  ///
  /// In fr, this message translates to:
  /// **'Patch DMX'**
  String get consolePatchTitle;

  /// No description provided for @consolePatchSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Importer un MVR et analyser le patch'**
  String get consolePatchSubtitle;

  /// No description provided for @consoleGdtfTitle.
  ///
  /// In fr, this message translates to:
  /// **'GDTF'**
  String get consoleGdtfTitle;

  /// No description provided for @consoleGdtfSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Créer ou analyser un fichier GDTF'**
  String get consoleGdtfSubtitle;

  /// No description provided for @consoleMa3ForgeTitle.
  ///
  /// In fr, this message translates to:
  /// **'MA3 Plugin Forge'**
  String get consoleMa3ForgeTitle;

  /// No description provided for @consoleMa3ForgeSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Génère des plugins Lua pour grandMA3 avec IA'**
  String get consoleMa3ForgeSubtitle;

  /// No description provided for @lightFilterLedProfileSaved.
  ///
  /// In fr, this message translates to:
  /// **'Profil « {name} » sauvegardé'**
  String lightFilterLedProfileSaved(String name);

  /// No description provided for @lightFilterLedNoProfiles.
  ///
  /// In fr, this message translates to:
  /// **'Aucun profil fixture enregistré'**
  String get lightFilterLedNoProfiles;

  /// No description provided for @lightFilterLedNoProfilesHint.
  ///
  /// In fr, this message translates to:
  /// **'Calibre les canaux dans l\'onglet Conversion,\npuis sauvegarde avec l\'icône 💾.'**
  String get lightFilterLedNoProfilesHint;

  /// No description provided for @lightFilterLedTitle.
  ///
  /// In fr, this message translates to:
  /// **'Correspondance filtres LED'**
  String get lightFilterLedTitle;

  /// No description provided for @lightFilterLedDescription.
  ///
  /// In fr, this message translates to:
  /// **'Conversion des filtres LEE, Rosco… vers moteurs LED (RGB, RGBA, RGBW, etc.).'**
  String get lightFilterLedDescription;

  /// No description provided for @lightFilterLedBrandLabel.
  ///
  /// In fr, this message translates to:
  /// **'Marque'**
  String get lightFilterLedBrandLabel;

  /// No description provided for @lightFilterLedSearchLabel.
  ///
  /// In fr, this message translates to:
  /// **'Recherche'**
  String get lightFilterLedSearchLabel;

  /// No description provided for @lightFilterLedSearchHint.
  ///
  /// In fr, this message translates to:
  /// **'Code ou nom du filtre'**
  String get lightFilterLedSearchHint;

  /// No description provided for @lightFilterLedFilterLabel.
  ///
  /// In fr, this message translates to:
  /// **'Filtre'**
  String get lightFilterLedFilterLabel;

  /// No description provided for @lightFilterLedEngineLabel.
  ///
  /// In fr, this message translates to:
  /// **'Moteur LED'**
  String get lightFilterLedEngineLabel;

  /// No description provided for @lightFilterLedShowPercentLabel.
  ///
  /// In fr, this message translates to:
  /// **'Afficher en pourcentage'**
  String get lightFilterLedShowPercentLabel;

  /// No description provided for @lightFilterLedShowPercentHint.
  ///
  /// In fr, this message translates to:
  /// **'Sinon, les valeurs sont affichées en DMX 0–255.'**
  String get lightFilterLedShowPercentHint;

  /// No description provided for @lightFilterLedHexLabel.
  ///
  /// In fr, this message translates to:
  /// **'Couleur de référence'**
  String get lightFilterLedHexLabel;

  /// No description provided for @lightFilterLedChromaticityLabel.
  ///
  /// In fr, this message translates to:
  /// **'Chromaticité'**
  String get lightFilterLedChromaticityLabel;

  /// No description provided for @lightFilterLedTransmissionLabel.
  ///
  /// In fr, this message translates to:
  /// **'Transmission'**
  String get lightFilterLedTransmissionLabel;

  /// No description provided for @lightFilterLedResultTitle.
  ///
  /// In fr, this message translates to:
  /// **'Résultat'**
  String get lightFilterLedResultTitle;

  /// No description provided for @lightFilterLedOriginalPreviewLabel.
  ///
  /// In fr, this message translates to:
  /// **'Aperçu filtre'**
  String get lightFilterLedOriginalPreviewLabel;

  /// No description provided for @lightFilterLedApproximatePreviewLabel.
  ///
  /// In fr, this message translates to:
  /// **'Aperçu LED approximatif'**
  String get lightFilterLedApproximatePreviewLabel;

  /// No description provided for @lightFilterLedDisclaimer.
  ///
  /// In fr, this message translates to:
  /// **'Résultat indicatif uniquement. Le rendu réel dépend du projecteur, de son spectre, de sa calibration, de son mode couleur et du contexte d’utilisation.'**
  String get lightFilterLedDisclaimer;

  /// No description provided for @lightFilterLedEngineRgb.
  ///
  /// In fr, this message translates to:
  /// **'RGB'**
  String get lightFilterLedEngineRgb;

  /// No description provided for @lightFilterLedEngineRgba.
  ///
  /// In fr, this message translates to:
  /// **'RGBA'**
  String get lightFilterLedEngineRgba;

  /// No description provided for @lightFilterLedEngineRgbw.
  ///
  /// In fr, this message translates to:
  /// **'RGBW'**
  String get lightFilterLedEngineRgbw;

  /// No description provided for @lightFilterLedEngineRgbl.
  ///
  /// In fr, this message translates to:
  /// **'RGBL'**
  String get lightFilterLedEngineRgbl;

  /// No description provided for @lightFilterLedEngineRgbwa.
  ///
  /// In fr, this message translates to:
  /// **'RGBWA'**
  String get lightFilterLedEngineRgbwa;

  /// No description provided for @lightFilterLedEngineRgbal.
  ///
  /// In fr, this message translates to:
  /// **'RGBAL'**
  String get lightFilterLedEngineRgbal;

  /// No description provided for @aboutSearchHint.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher dans les références'**
  String get aboutSearchHint;

  /// No description provided for @aboutSearchNoResults.
  ///
  /// In fr, this message translates to:
  /// **'Aucun résultat trouvé.'**
  String get aboutSearchNoResults;

  /// No description provided for @homePinnedTitle.
  ///
  /// In fr, this message translates to:
  /// **'Épingles'**
  String get homePinnedTitle;

  /// No description provided for @homePinnedSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Retrouver rapidement vos références épinglées.'**
  String get homePinnedSubtitle;

  /// No description provided for @pinnedReferencesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Références épinglées'**
  String get pinnedReferencesTitle;

  /// No description provided for @pinnedReferencesEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucune référence épinglée pour le moment.'**
  String get pinnedReferencesEmpty;

  /// No description provided for @aboutPinAddTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Épingler cette référence'**
  String get aboutPinAddTooltip;

  /// No description provided for @aboutPinRemoveTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Retirer cette épingle'**
  String get aboutPinRemoveTooltip;

  /// No description provided for @aboutPinAddedMessage.
  ///
  /// In fr, this message translates to:
  /// **'Référence épinglée.'**
  String get aboutPinAddedMessage;

  /// No description provided for @aboutPinRemovedMessage.
  ///
  /// In fr, this message translates to:
  /// **'Épingle retirée.'**
  String get aboutPinRemovedMessage;

  /// No description provided for @homeDrawerSubscriptions.
  ///
  /// In fr, this message translates to:
  /// **'Abonnements'**
  String get homeDrawerSubscriptions;

  /// No description provided for @subscriptionPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Abonnements'**
  String get subscriptionPageTitle;

  /// No description provided for @subscriptionHeadlineAllTitle.
  ///
  /// In fr, this message translates to:
  /// **'Choisissez votre formule'**
  String get subscriptionHeadlineAllTitle;

  /// No description provided for @subscriptionHeadlineAllSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Retrouvez ici vos achats actuels et les abonnements encore disponibles.'**
  String get subscriptionHeadlineAllSubtitle;

  /// No description provided for @subscriptionHeadlineUnlock.
  ///
  /// In fr, this message translates to:
  /// **'Débloquez {module}'**
  String subscriptionHeadlineUnlock(Object module);

  /// No description provided for @subscriptionHeadlineVideoSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Vous pouvez acheter Vidéo uniquement, ou choisir Pro pour tout déverrouiller.'**
  String get subscriptionHeadlineVideoSubtitle;

  /// No description provided for @subscriptionHeadlineLightSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Vous pouvez acheter Lumière uniquement, ou choisir Pro pour tout déverrouiller.'**
  String get subscriptionHeadlineLightSubtitle;

  /// No description provided for @subscriptionHeadlineLaserSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Vous pouvez acheter Laser uniquement, ou choisir Pro pour tout déverrouiller.'**
  String get subscriptionHeadlineLaserSubtitle;

  /// No description provided for @subscriptionHeadlineConsoleSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Vous pouvez acheter Console uniquement, ou choisir Pro pour tout déverrouiller.'**
  String get subscriptionHeadlineConsoleSubtitle;

  /// No description provided for @subscriptionHeadlineProSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Accès complet à toutes les sections avancées.'**
  String get subscriptionHeadlineProSubtitle;

  /// No description provided for @subscriptionStoreUnavailable.
  ///
  /// In fr, this message translates to:
  /// **'Boutique indisponible pour le moment.'**
  String get subscriptionStoreUnavailable;

  /// No description provided for @subscriptionLoadError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de charger les abonnements.'**
  String get subscriptionLoadError;

  /// No description provided for @subscriptionRestorePurchases.
  ///
  /// In fr, this message translates to:
  /// **'Restaurer mes achats'**
  String get subscriptionRestorePurchases;

  /// No description provided for @subscriptionPrivacy.
  ///
  /// In fr, this message translates to:
  /// **'Confidentialité'**
  String get subscriptionPrivacy;

  /// No description provided for @subscriptionTerms.
  ///
  /// In fr, this message translates to:
  /// **'CGU'**
  String get subscriptionTerms;

  /// No description provided for @subscriptionBestValue.
  ///
  /// In fr, this message translates to:
  /// **'MEILLEURE VALEUR'**
  String get subscriptionBestValue;

  /// No description provided for @subscriptionOwned.
  ///
  /// In fr, this message translates to:
  /// **'Acheté'**
  String get subscriptionOwned;

  /// No description provided for @subscriptionIncludedInPro.
  ///
  /// In fr, this message translates to:
  /// **'Inclus dans Pro'**
  String get subscriptionIncludedInPro;

  /// No description provided for @subscriptionProductUnavailable.
  ///
  /// In fr, this message translates to:
  /// **'Produit indisponible.'**
  String get subscriptionProductUnavailable;

  /// No description provided for @subscriptionSubscribeAll.
  ///
  /// In fr, this message translates to:
  /// **'S\'abonner — Tout déverrouiller'**
  String get subscriptionSubscribeAll;

  /// No description provided for @subscriptionSubscribeModule.
  ///
  /// In fr, this message translates to:
  /// **'S\'abonner — {module}'**
  String subscriptionSubscribeModule(Object module);

  /// No description provided for @subscriptionCategoryVideoTitle.
  ///
  /// In fr, this message translates to:
  /// **'Vidéo'**
  String get subscriptionCategoryVideoTitle;

  /// No description provided for @subscriptionCategoryLightTitle.
  ///
  /// In fr, this message translates to:
  /// **'Lumière'**
  String get subscriptionCategoryLightTitle;

  /// No description provided for @subscriptionCategoryLaserTitle.
  ///
  /// In fr, this message translates to:
  /// **'Laser'**
  String get subscriptionCategoryLaserTitle;

  /// No description provided for @subscriptionCategoryConsoleTitle.
  ///
  /// In fr, this message translates to:
  /// **'Console'**
  String get subscriptionCategoryConsoleTitle;

  /// No description provided for @subscriptionCategoryProTitle.
  ///
  /// In fr, this message translates to:
  /// **'ShowTech Tools Pro'**
  String get subscriptionCategoryProTitle;

  /// No description provided for @subscriptionCategoryVideoDescription.
  ///
  /// In fr, this message translates to:
  /// **'Accès à la section Vidéo.'**
  String get subscriptionCategoryVideoDescription;

  /// No description provided for @subscriptionCategoryLightDescription.
  ///
  /// In fr, this message translates to:
  /// **'Accès à la section Lumière.'**
  String get subscriptionCategoryLightDescription;

  /// No description provided for @subscriptionCategoryLaserDescription.
  ///
  /// In fr, this message translates to:
  /// **'Accès à la section Laser.'**
  String get subscriptionCategoryLaserDescription;

  /// No description provided for @subscriptionCategoryConsoleDescription.
  ///
  /// In fr, this message translates to:
  /// **'Accès à la section Console.'**
  String get subscriptionCategoryConsoleDescription;

  /// No description provided for @subscriptionCategoryProDescription.
  ///
  /// In fr, this message translates to:
  /// **'Accès complet à toutes les sections.'**
  String get subscriptionCategoryProDescription;

  /// No description provided for @electricityFreeSection.
  ///
  /// In fr, this message translates to:
  /// **'Gratuit'**
  String get electricityFreeSection;

  /// No description provided for @electricityProSection.
  ///
  /// In fr, this message translates to:
  /// **'Abonnement Électricité'**
  String get electricityProSection;

  /// No description provided for @riggingFreeSection.
  ///
  /// In fr, this message translates to:
  /// **'Gratuit'**
  String get riggingFreeSection;

  /// No description provided for @riggingProSection.
  ///
  /// In fr, this message translates to:
  /// **'Abonnement Rigging'**
  String get riggingProSection;

  /// No description provided for @videoFreeSection.
  ///
  /// In fr, this message translates to:
  /// **'Gratuit'**
  String get videoFreeSection;

  /// No description provided for @videoProSection.
  ///
  /// In fr, this message translates to:
  /// **'Abonnement Vidéo'**
  String get videoProSection;

  /// No description provided for @lumiereFreeSection.
  ///
  /// In fr, this message translates to:
  /// **'Gratuit'**
  String get lumiereFreeSection;

  /// No description provided for @lumiereProSection.
  ///
  /// In fr, this message translates to:
  /// **'Abonnement Lumière'**
  String get lumiereProSection;

  /// No description provided for @consoleFreeSection.
  ///
  /// In fr, this message translates to:
  /// **'Gratuit'**
  String get consoleFreeSection;

  /// No description provided for @consoleProSection.
  ///
  /// In fr, this message translates to:
  /// **'Abonnement Console'**
  String get consoleProSection;

  /// No description provided for @lumiereFilterEquivDescription.
  ///
  /// In fr, this message translates to:
  /// **'Équivalences Lee ↔ Roscolux ↔ e-colour+'**
  String get lumiereFilterEquivDescription;

  /// No description provided for @audioSplModeDistance.
  ///
  /// In fr, this message translates to:
  /// **'Distance → SPL'**
  String get audioSplModeDistance;

  /// No description provided for @audioSplModePower.
  ///
  /// In fr, this message translates to:
  /// **'Puissance → SPL'**
  String get audioSplModePower;

  /// No description provided for @homeElectricityTitle.
  ///
  /// In fr, this message translates to:
  /// **'Électricité'**
  String get homeElectricityTitle;

  /// No description provided for @homeElectricitySubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Puissance, courant, sections de câble et autonomie UPS.'**
  String get homeElectricitySubtitle;

  /// No description provided for @subscriptionCategoryElectricityTitle.
  ///
  /// In fr, this message translates to:
  /// **'Électricité'**
  String get subscriptionCategoryElectricityTitle;

  /// No description provided for @subscriptionCategoryElectricityDescription.
  ///
  /// In fr, this message translates to:
  /// **'Outils électriques pour la puissance, les phases, les câbles et l’UPS.'**
  String get subscriptionCategoryElectricityDescription;

  /// No description provided for @subscriptionCategoryRiggingTitle.
  ///
  /// In fr, this message translates to:
  /// **'Rigging'**
  String get subscriptionCategoryRiggingTitle;

  /// No description provided for @subscriptionCategoryRiggingDescription.
  ///
  /// In fr, this message translates to:
  /// **'Outils de rigging pour bridle, angles et vérification WLL / CMU.'**
  String get subscriptionCategoryRiggingDescription;

  /// No description provided for @subscriptionHeadlineElectricitySubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Débloque tous les outils électriques professionnels.'**
  String get subscriptionHeadlineElectricitySubtitle;

  /// No description provided for @subscriptionHeadlineRiggingSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Débloque tous les outils de rigging professionnels.'**
  String get subscriptionHeadlineRiggingSubtitle;

  /// No description provided for @electricityTitle.
  ///
  /// In fr, this message translates to:
  /// **'Électricité'**
  String get electricityTitle;

  /// No description provided for @electricityToolPowerCurrentTitle.
  ///
  /// In fr, this message translates to:
  /// **'Puissance / courant'**
  String get electricityToolPowerCurrentTitle;

  /// No description provided for @electricityToolPowerCurrentSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Calculer puissance, courant, tension ou énergie en mono ou triphasé.'**
  String get electricityToolPowerCurrentSubtitle;

  /// No description provided for @electricityToolPhasePowerTitle.
  ///
  /// In fr, this message translates to:
  /// **'Puissance par phase'**
  String get electricityToolPhasePowerTitle;

  /// No description provided for @electricityToolPhasePowerSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Répartir une puissance totale et lire le courant par phase.'**
  String get electricityToolPhasePowerSubtitle;

  /// No description provided for @electricityToolLoadBalancerTitle.
  ///
  /// In fr, this message translates to:
  /// **'Répartition de charge'**
  String get electricityToolLoadBalancerTitle;

  /// No description provided for @electricityToolLoadBalancerSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter des fixtures depuis le catalogue, assigner par phase et vérifier l\'ampérage de ton tableau.'**
  String get electricityToolLoadBalancerSubtitle;

  /// No description provided for @electricityToolGeneratorTitle.
  ///
  /// In fr, this message translates to:
  /// **'Groupe électrogène'**
  String get electricityToolGeneratorTitle;

  /// No description provided for @electricityPowerFactorToolTitle.
  ///
  /// In fr, this message translates to:
  /// **'Facteur de puissance (kVA ↔ kW)'**
  String get electricityPowerFactorToolTitle;

  /// No description provided for @electricityToolPowerFactorSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Convertit puissance apparente (kVA), active (kW) et cos φ dans les deux sens, avec la puissance réactive (kVAR).'**
  String get electricityToolPowerFactorSubtitle;

  /// No description provided for @electricityPowerFactorModeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Sens de calcul'**
  String get electricityPowerFactorModeTitle;

  /// No description provided for @electricityPowerFactorModeKvaToKw.
  ///
  /// In fr, this message translates to:
  /// **'kVA → kW'**
  String get electricityPowerFactorModeKvaToKw;

  /// No description provided for @electricityPowerFactorModeKwToKva.
  ///
  /// In fr, this message translates to:
  /// **'kW → kVA'**
  String get electricityPowerFactorModeKwToKva;

  /// No description provided for @electricityPowerFactorInputsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Données connues'**
  String get electricityPowerFactorInputsTitle;

  /// No description provided for @electricityPowerFactorApparentLabel.
  ///
  /// In fr, this message translates to:
  /// **'Puissance apparente'**
  String get electricityPowerFactorApparentLabel;

  /// No description provided for @electricityPowerFactorApparentHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex : 10'**
  String get electricityPowerFactorApparentHint;

  /// No description provided for @electricityPowerFactorActiveLabel.
  ///
  /// In fr, this message translates to:
  /// **'Puissance active'**
  String get electricityPowerFactorActiveLabel;

  /// No description provided for @electricityPowerFactorActiveHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex : 8'**
  String get electricityPowerFactorActiveHint;

  /// No description provided for @electricityPowerFactorCosPhiLabel.
  ///
  /// In fr, this message translates to:
  /// **'Facteur de puissance (cos φ)'**
  String get electricityPowerFactorCosPhiLabel;

  /// No description provided for @electricityPowerFactorCosPhiHint.
  ///
  /// In fr, this message translates to:
  /// **'0.1 – 1.0, ex : 0.8'**
  String get electricityPowerFactorCosPhiHint;

  /// No description provided for @electricityPowerFactorResultsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Résultats'**
  String get electricityPowerFactorResultsTitle;

  /// No description provided for @electricityPowerFactorReactiveLabel.
  ///
  /// In fr, this message translates to:
  /// **'Puissance réactive'**
  String get electricityPowerFactorReactiveLabel;

  /// No description provided for @electricityPowerFactorAngleLabel.
  ///
  /// In fr, this message translates to:
  /// **'Angle de déphasage'**
  String get electricityPowerFactorAngleLabel;

  /// No description provided for @electricityPowerFactorEnterValues.
  ///
  /// In fr, this message translates to:
  /// **'Renseignez les valeurs pour voir le résultat.'**
  String get electricityPowerFactorEnterValues;

  /// No description provided for @electricityPowerFactorFormulaNote.
  ///
  /// In fr, this message translates to:
  /// **'kW = kVA × cos φ · kVA = kW / cos φ · kVAR = √(kVA² − kW²). cos φ = 1 correspond à une charge purement résistive (aucune puissance réactive).'**
  String get electricityPowerFactorFormulaNote;

  /// No description provided for @electricityToolGeneratorSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Dimensionnement : puissance active → kVA, foisonnement, marge de sécurité, taille standard recommandée.'**
  String get electricityToolGeneratorSubtitle;

  /// No description provided for @electricityGeneratorInputsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Charge à alimenter'**
  String get electricityGeneratorInputsTitle;

  /// No description provided for @electricityGeneratorActivePowerLabel.
  ///
  /// In fr, this message translates to:
  /// **'Puissance active installée'**
  String get electricityGeneratorActivePowerLabel;

  /// No description provided for @electricityGeneratorActivePowerHint.
  ///
  /// In fr, this message translates to:
  /// **'Somme des puissances actives (voir répartiteur de charges)'**
  String get electricityGeneratorActivePowerHint;

  /// No description provided for @electricityGeneratorCosPhiLabel.
  ///
  /// In fr, this message translates to:
  /// **'Cos φ moyen'**
  String get electricityGeneratorCosPhiLabel;

  /// No description provided for @electricityGeneratorCosPhiHint.
  ///
  /// In fr, this message translates to:
  /// **'0,85–0,95 typique (gradateurs, LED, ampli)'**
  String get electricityGeneratorCosPhiHint;

  /// No description provided for @electricityGeneratorDiversityLabel.
  ///
  /// In fr, this message translates to:
  /// **'Facteur de foisonnement'**
  String get electricityGeneratorDiversityLabel;

  /// No description provided for @electricityGeneratorDiversityHint.
  ///
  /// In fr, this message translates to:
  /// **'% de la puissance installée réellement sollicitée en simultané'**
  String get electricityGeneratorDiversityHint;

  /// No description provided for @electricityGeneratorMarginLabel.
  ///
  /// In fr, this message translates to:
  /// **'Marge de sécurité'**
  String get electricityGeneratorMarginLabel;

  /// No description provided for @electricityGeneratorMarginHint.
  ///
  /// In fr, this message translates to:
  /// **'Headroom recommandé pour démarrages et pointes'**
  String get electricityGeneratorMarginHint;

  /// No description provided for @electricityGeneratorFuelRateLabel.
  ///
  /// In fr, this message translates to:
  /// **'Consommation spécifique'**
  String get electricityGeneratorFuelRateLabel;

  /// No description provided for @electricityGeneratorFuelRateHint.
  ///
  /// In fr, this message translates to:
  /// **'≈0,25 L/kWh typique pour un diesel bien chargé'**
  String get electricityGeneratorFuelRateHint;

  /// No description provided for @electricityGeneratorResultsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Groupe recommandé'**
  String get electricityGeneratorResultsTitle;

  /// No description provided for @electricityGeneratorRecommendedLabel.
  ///
  /// In fr, this message translates to:
  /// **'Taille standard recommandée'**
  String get electricityGeneratorRecommendedLabel;

  /// No description provided for @electricityGeneratorRecommendedOverMax.
  ///
  /// In fr, this message translates to:
  /// **'> 800 kVA — dimensionnement sur mesure, consultez un loueur'**
  String get electricityGeneratorRecommendedOverMax;

  /// No description provided for @electricityGeneratorApparentNeededLabel.
  ///
  /// In fr, this message translates to:
  /// **'Puissance apparente nécessaire'**
  String get electricityGeneratorApparentNeededLabel;

  /// No description provided for @electricityGeneratorCurrentLabel.
  ///
  /// In fr, this message translates to:
  /// **'Courant estimé en sortie'**
  String get electricityGeneratorCurrentLabel;

  /// No description provided for @electricityGeneratorFuelPerHourLabel.
  ///
  /// In fr, this message translates to:
  /// **'Consommation estimée'**
  String get electricityGeneratorFuelPerHourLabel;

  /// No description provided for @electricityGeneratorFuelPerShowLabel.
  ///
  /// In fr, this message translates to:
  /// **'Sur 8 h de show'**
  String get electricityGeneratorFuelPerShowLabel;

  /// No description provided for @electricityGeneratorEnterValues.
  ///
  /// In fr, this message translates to:
  /// **'Saisissez la puissance active pour calculer'**
  String get electricityGeneratorEnterValues;

  /// No description provided for @electricityGeneratorDisclaimer.
  ///
  /// In fr, this message translates to:
  /// **'Estimation indicative — vérifiez toujours avec les préconisations du loueur/fabricant du groupe (altitude, température, charges non-linéaires).'**
  String get electricityGeneratorDisclaimer;

  /// No description provided for @electricityToolCableSectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Section de câble'**
  String get electricityToolCableSectionTitle;

  /// No description provided for @electricityToolCableSectionSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Calculer une section selon courant ou puissance, longueur, chute de tension et référence câble.'**
  String get electricityToolCableSectionSubtitle;

  /// No description provided for @electricityToolUpsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Autonomie UPS'**
  String get electricityToolUpsTitle;

  /// No description provided for @electricityToolUpsSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Estimer l’autonomie d’une batterie ou d’un UPS selon la charge.'**
  String get electricityToolUpsSubtitle;

  /// No description provided for @electricityInputsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Entrées'**
  String get electricityInputsTitle;

  /// No description provided for @electricityResultsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Résultats'**
  String get electricityResultsTitle;

  /// No description provided for @electricityEnterValuesToCalculate.
  ///
  /// In fr, this message translates to:
  /// **'Entre des valeurs valides pour calculer.'**
  String get electricityEnterValuesToCalculate;

  /// No description provided for @electricityTotalPowerLabel.
  ///
  /// In fr, this message translates to:
  /// **'Puissance totale'**
  String get electricityTotalPowerLabel;

  /// No description provided for @electricityTotalPowerHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex. 22000'**
  String get electricityTotalPowerHint;

  /// No description provided for @electricityPowerPerPhaseLabel.
  ///
  /// In fr, this message translates to:
  /// **'Puissance par phase'**
  String get electricityPowerPerPhaseLabel;

  /// No description provided for @electricityCurrentPerPhaseLabel.
  ///
  /// In fr, this message translates to:
  /// **'Courant par phase'**
  String get electricityCurrentPerPhaseLabel;

  /// No description provided for @electricityCurrentLabel.
  ///
  /// In fr, this message translates to:
  /// **'Courant'**
  String get electricityCurrentLabel;

  /// No description provided for @electricityPhaseCountLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nombre de phases'**
  String get electricityPhaseCountLabel;

  /// No description provided for @electricityConsumptionCurrentLabel.
  ///
  /// In fr, this message translates to:
  /// **'Consommation / courant réel'**
  String get electricityConsumptionCurrentLabel;

  /// No description provided for @electricityConsumptionCurrentHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex. 32'**
  String get electricityConsumptionCurrentHint;

  /// No description provided for @electricityBreakerSizeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Taille du disjoncteur'**
  String get electricityBreakerSizeLabel;

  /// No description provided for @electricityBreakerSizeHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex. 32'**
  String get electricityBreakerSizeHint;

  /// No description provided for @electricityCableLengthLabel.
  ///
  /// In fr, this message translates to:
  /// **'Longueur du câble'**
  String get electricityCableLengthLabel;

  /// No description provided for @electricityCableLengthHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex. 30'**
  String get electricityCableLengthHint;

  /// No description provided for @electricityAllowedVoltageDropLabel.
  ///
  /// In fr, this message translates to:
  /// **'Chute de tension max.'**
  String get electricityAllowedVoltageDropLabel;

  /// No description provided for @electricityAllowedVoltageDropHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex. 3'**
  String get electricityAllowedVoltageDropHint;

  /// No description provided for @electricityRecommendedCableSectionLabel.
  ///
  /// In fr, this message translates to:
  /// **'Section recommandée'**
  String get electricityRecommendedCableSectionLabel;

  /// No description provided for @electricityMaxCurrentForSectionLabel.
  ///
  /// In fr, this message translates to:
  /// **'Courant admissible'**
  String get electricityMaxCurrentForSectionLabel;

  /// No description provided for @electricityVoltageDropLabel.
  ///
  /// In fr, this message translates to:
  /// **'Chute de tension'**
  String get electricityVoltageDropLabel;

  /// No description provided for @electricityBreakerCheckLabel.
  ///
  /// In fr, this message translates to:
  /// **'Vérification disjoncteur'**
  String get electricityBreakerCheckLabel;

  /// No description provided for @electricityStatusOk.
  ///
  /// In fr, this message translates to:
  /// **'OK'**
  String get electricityStatusOk;

  /// No description provided for @electricityStatusWarning.
  ///
  /// In fr, this message translates to:
  /// **'À vérifier'**
  String get electricityStatusWarning;

  /// No description provided for @electricityImportantNoteTitle.
  ///
  /// In fr, this message translates to:
  /// **'Note importante'**
  String get electricityImportantNoteTitle;

  /// No description provided for @electricityCableSectionDisclaimer.
  ///
  /// In fr, this message translates to:
  /// **'Calcul indicatif basé sur un tableau de référence inspiré IEC 60364-5-52. Vérifie toujours le RGIE/AREI, le mode de pose réel, la température, le groupement de câbles et la protection avec un électricien qualifié.'**
  String get electricityCableSectionDisclaimer;

  /// No description provided for @electricityConsumptionInputTypeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Valeur connue'**
  String get electricityConsumptionInputTypeTitle;

  /// No description provided for @electricityInputCurrent.
  ///
  /// In fr, this message translates to:
  /// **'Courant (A)'**
  String get electricityInputCurrent;

  /// No description provided for @electricityInputPower.
  ///
  /// In fr, this message translates to:
  /// **'Puissance (W)'**
  String get electricityInputPower;

  /// No description provided for @electricityVoltageLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tension (U)'**
  String get electricityVoltageLabel;

  /// No description provided for @electricityVoltageHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex. 230 ou 400'**
  String get electricityVoltageHint;

  /// No description provided for @electricityPowerFactorLabel.
  ///
  /// In fr, this message translates to:
  /// **'Facteur de puissance (cos φ)'**
  String get electricityPowerFactorLabel;

  /// No description provided for @electricityPowerFactorHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex. 1.0'**
  String get electricityPowerFactorHint;

  /// No description provided for @electricityCableReferenceTitle.
  ///
  /// In fr, this message translates to:
  /// **'Référence câble'**
  String get electricityCableReferenceTitle;

  /// No description provided for @electricityCopper.
  ///
  /// In fr, this message translates to:
  /// **'Cuivre'**
  String get electricityCopper;

  /// No description provided for @electricityAluminium.
  ///
  /// In fr, this message translates to:
  /// **'Aluminium'**
  String get electricityAluminium;

  /// No description provided for @electricityInsulationPvc.
  ///
  /// In fr, this message translates to:
  /// **'PVC 70 °C'**
  String get electricityInsulationPvc;

  /// No description provided for @electricityInsulationXlpe.
  ///
  /// In fr, this message translates to:
  /// **'XLPE 90 °C'**
  String get electricityInsulationXlpe;

  /// No description provided for @electricityInstallConduit.
  ///
  /// In fr, this message translates to:
  /// **'Conduit'**
  String get electricityInstallConduit;

  /// No description provided for @electricityInstallFreeAir.
  ///
  /// In fr, this message translates to:
  /// **'Air libre'**
  String get electricityInstallFreeAir;

  /// No description provided for @electricityCalculatedCurrentLabel.
  ///
  /// In fr, this message translates to:
  /// **'Courant calculé'**
  String get electricityCalculatedCurrentLabel;

  /// No description provided for @electricityRecommendedBreakerLabel.
  ///
  /// In fr, this message translates to:
  /// **'Disjoncteur recommandé'**
  String get electricityRecommendedBreakerLabel;

  /// No description provided for @electricityNoStandardBreaker.
  ///
  /// In fr, this message translates to:
  /// **'Aucun calibre standard adapté'**
  String get electricityNoStandardBreaker;

  /// No description provided for @electricityStatusLabel.
  ///
  /// In fr, this message translates to:
  /// **'Statut'**
  String get electricityStatusLabel;

  /// No description provided for @electricityCircuitTypeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Type de circuit'**
  String get electricityCircuitTypeTitle;

  /// No description provided for @electricitySinglePhase.
  ///
  /// In fr, this message translates to:
  /// **'Monophasé'**
  String get electricitySinglePhase;

  /// No description provided for @electricityThreePhase.
  ///
  /// In fr, this message translates to:
  /// **'Triphasé'**
  String get electricityThreePhase;

  /// No description provided for @electricityResultActivePower.
  ///
  /// In fr, this message translates to:
  /// **'Puissance active'**
  String get electricityResultActivePower;

  /// No description provided for @electricityResultCurrent.
  ///
  /// In fr, this message translates to:
  /// **'Courant'**
  String get electricityResultCurrent;

  /// No description provided for @electricityResultVoltage.
  ///
  /// In fr, this message translates to:
  /// **'Tension'**
  String get electricityResultVoltage;

  /// No description provided for @electricityResultEnergy.
  ///
  /// In fr, this message translates to:
  /// **'Énergie'**
  String get electricityResultEnergy;

  /// No description provided for @electricityInsufficient.
  ///
  /// In fr, this message translates to:
  /// **'Valeurs insuffisantes'**
  String get electricityInsufficient;

  /// No description provided for @electricityCalcPower.
  ///
  /// In fr, this message translates to:
  /// **'Puissance'**
  String get electricityCalcPower;

  /// No description provided for @electricityCalcCurrent.
  ///
  /// In fr, this message translates to:
  /// **'Courant'**
  String get electricityCalcCurrent;

  /// No description provided for @electricityCalcVoltage.
  ///
  /// In fr, this message translates to:
  /// **'Tension'**
  String get electricityCalcVoltage;

  /// No description provided for @electricityCalcEnergy.
  ///
  /// In fr, this message translates to:
  /// **'Énergie'**
  String get electricityCalcEnergy;

  /// No description provided for @electricityRef16AMono.
  ///
  /// In fr, this message translates to:
  /// **'16 A mono'**
  String get electricityRef16AMono;

  /// No description provided for @electricityRef32AMono.
  ///
  /// In fr, this message translates to:
  /// **'32 A mono'**
  String get electricityRef32AMono;

  /// No description provided for @electricityRef32ATri.
  ///
  /// In fr, this message translates to:
  /// **'32 A tri'**
  String get electricityRef32ATri;

  /// No description provided for @electricityRef63ATri.
  ///
  /// In fr, this message translates to:
  /// **'63 A tri'**
  String get electricityRef63ATri;

  /// No description provided for @electricityRef125ATri.
  ///
  /// In fr, this message translates to:
  /// **'125 A tri'**
  String get electricityRef125ATri;

  /// No description provided for @electricityFormulaTri.
  ///
  /// In fr, this message translates to:
  /// **'P = √3 × U × I × cos φ'**
  String get electricityFormulaTri;

  /// No description provided for @electricityFormulaMono.
  ///
  /// In fr, this message translates to:
  /// **'P = U × I × cos φ'**
  String get electricityFormulaMono;

  /// No description provided for @electricityFormulaTriDesc.
  ///
  /// In fr, this message translates to:
  /// **'Formule triphasée pour une charge équilibrée.'**
  String get electricityFormulaTriDesc;

  /// No description provided for @electricityFormulaMonoDesc.
  ///
  /// In fr, this message translates to:
  /// **'Formule monophasée.'**
  String get electricityFormulaMonoDesc;

  /// No description provided for @electricityCircuitType.
  ///
  /// In fr, this message translates to:
  /// **'Type de circuit'**
  String get electricityCircuitType;

  /// No description provided for @electricityMono.
  ///
  /// In fr, this message translates to:
  /// **'Mono'**
  String get electricityMono;

  /// No description provided for @electricityMonoDesc.
  ///
  /// In fr, this message translates to:
  /// **'Circuit monophasé 230 V.'**
  String get electricityMonoDesc;

  /// No description provided for @electricityThreePhaseDesc.
  ///
  /// In fr, this message translates to:
  /// **'Circuit triphasé 400 V.'**
  String get electricityThreePhaseDesc;

  /// No description provided for @electricityCalcFor.
  ///
  /// In fr, this message translates to:
  /// **'Calculer'**
  String get electricityCalcFor;

  /// No description provided for @electricityFieldPower.
  ///
  /// In fr, this message translates to:
  /// **'Puissance'**
  String get electricityFieldPower;

  /// No description provided for @electricityFieldPowerHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex. 3680'**
  String get electricityFieldPowerHint;

  /// No description provided for @electricityFieldCurrent.
  ///
  /// In fr, this message translates to:
  /// **'Courant'**
  String get electricityFieldCurrent;

  /// No description provided for @electricityFieldCurrentHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex. 16'**
  String get electricityFieldCurrentHint;

  /// No description provided for @electricityFieldVoltage.
  ///
  /// In fr, this message translates to:
  /// **'Tension'**
  String get electricityFieldVoltage;

  /// No description provided for @electricityFieldVoltageHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex. 230'**
  String get electricityFieldVoltageHint;

  /// No description provided for @electricityFieldDuration.
  ///
  /// In fr, this message translates to:
  /// **'Durée'**
  String get electricityFieldDuration;

  /// No description provided for @electricityFieldDurationHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex. 2'**
  String get electricityFieldDurationHint;

  /// No description provided for @electricityFieldPf.
  ///
  /// In fr, this message translates to:
  /// **'cos φ'**
  String get electricityFieldPf;

  /// No description provided for @electricityFieldPfHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex. 1.0'**
  String get electricityFieldPfHint;

  /// No description provided for @electricityCalculate.
  ///
  /// In fr, this message translates to:
  /// **'Calculer'**
  String get electricityCalculate;

  /// No description provided for @electricityRefTitle.
  ///
  /// In fr, this message translates to:
  /// **'Références rapides'**
  String get electricityRefTitle;

  /// No description provided for @electricityUpsEnergyAvail.
  ///
  /// In fr, this message translates to:
  /// **'{energy} Wh disponibles'**
  String electricityUpsEnergyAvail(String energy);

  /// No description provided for @electricityUpsBatterySection.
  ///
  /// In fr, this message translates to:
  /// **'Batterie'**
  String get electricityUpsBatterySection;

  /// No description provided for @electricityUpsCalculate.
  ///
  /// In fr, this message translates to:
  /// **'Calculer l’autonomie'**
  String get electricityUpsCalculate;

  /// No description provided for @electricityUpsCapacityHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex. 100'**
  String get electricityUpsCapacityHint;

  /// No description provided for @electricityUpsCapacityLabel.
  ///
  /// In fr, this message translates to:
  /// **'Capacité'**
  String get electricityUpsCapacityLabel;

  /// No description provided for @electricityUpsCountHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex. 1'**
  String get electricityUpsCountHint;

  /// No description provided for @electricityUpsCountLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nombre de batteries'**
  String get electricityUpsCountLabel;

  /// No description provided for @electricityUpsEfficiencyHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex. 85'**
  String get electricityUpsEfficiencyHint;

  /// No description provided for @electricityUpsEfficiencyLabel.
  ///
  /// In fr, this message translates to:
  /// **'Rendement'**
  String get electricityUpsEfficiencyLabel;

  /// No description provided for @electricityUpsLoadDesc.
  ///
  /// In fr, this message translates to:
  /// **'Puissance consommée par l’équipement.'**
  String get electricityUpsLoadDesc;

  /// No description provided for @electricityUpsLoadHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex. 500'**
  String get electricityUpsLoadHint;

  /// No description provided for @electricityUpsLoadLabel.
  ///
  /// In fr, this message translates to:
  /// **'Charge'**
  String get electricityUpsLoadLabel;

  /// No description provided for @electricityUpsLoadSectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Charge à alimenter'**
  String get electricityUpsLoadSectionTitle;

  /// No description provided for @electricityUpsRef1.
  ///
  /// In fr, this message translates to:
  /// **'Wh disponibles'**
  String get electricityUpsRef1;

  /// No description provided for @electricityUpsRef1Detail.
  ///
  /// In fr, this message translates to:
  /// **'Capacité × tension × nombre × rendement.'**
  String get electricityUpsRef1Detail;

  /// No description provided for @electricityUpsRef2.
  ///
  /// In fr, this message translates to:
  /// **'Autonomie'**
  String get electricityUpsRef2;

  /// No description provided for @electricityUpsRef2Detail.
  ///
  /// In fr, this message translates to:
  /// **'Énergie disponible divisée par la charge.'**
  String get electricityUpsRef2Detail;

  /// No description provided for @electricityUpsRef3Title.
  ///
  /// In fr, this message translates to:
  /// **'Résultat indicatif'**
  String get electricityUpsRef3Title;

  /// No description provided for @electricityUpsRef3Value.
  ///
  /// In fr, this message translates to:
  /// **'La valeur réelle dépend du rendement, de l’état des batteries et de la charge.'**
  String get electricityUpsRef3Value;

  /// No description provided for @electricityUpsRefTitle.
  ///
  /// In fr, this message translates to:
  /// **'Références'**
  String get electricityUpsRefTitle;

  /// No description provided for @electricityUpsVoltageHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex. 12'**
  String get electricityUpsVoltageHint;

  /// No description provided for @electricityUpsVoltageLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tension batterie'**
  String get electricityUpsVoltageLabel;

  /// No description provided for @riggingToolBridleTitle.
  ///
  /// In fr, this message translates to:
  /// **'Bridle 2 points'**
  String get riggingToolBridleTitle;

  /// No description provided for @riggingToolBridleSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Calcul complet d’un bridle : longueurs, angles, tensions et statut de sécurité.'**
  String get riggingToolBridleSubtitle;

  /// No description provided for @riggingToolAngleFactorTitle.
  ///
  /// In fr, this message translates to:
  /// **'Facteur d’angle'**
  String get riggingToolAngleFactorTitle;

  /// No description provided for @riggingToolAngleFactorSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Voir rapidement l’effet de l’angle sur la tension dans les brins.'**
  String get riggingToolAngleFactorSubtitle;

  /// No description provided for @riggingToolMultiPointTitle.
  ///
  /// In fr, this message translates to:
  /// **'Bridage multi-points'**
  String get riggingToolMultiPointTitle;

  /// No description provided for @riggingToolMultiPointSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Tension par brin pour un bridage symétrique à 2-8 points, avec vérification WLL.'**
  String get riggingToolMultiPointSubtitle;

  /// No description provided for @riggingLegCountLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nombre de brins'**
  String get riggingLegCountLabel;

  /// No description provided for @riggingWllPerLegLabel.
  ///
  /// In fr, this message translates to:
  /// **'WLL par brin'**
  String get riggingWllPerLegLabel;

  /// No description provided for @riggingMultiPointSymmetricNote.
  ///
  /// In fr, this message translates to:
  /// **'Calcul valable pour un bridage symétrique : brins de même longueur, charge centrée, tension répartie également. Pour une configuration asymétrique ou complexe, fais appel à un rigger qualifié ou un logiciel certifié.'**
  String get riggingMultiPointSymmetricNote;

  /// No description provided for @riggingToolHoistTitle.
  ///
  /// In fr, this message translates to:
  /// **'Sélection de palan'**
  String get riggingToolHoistTitle;

  /// No description provided for @riggingToolHoistSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Charge à lever → taille de palan standard recommandée, avec marge de sécurité.'**
  String get riggingToolHoistSubtitle;

  /// No description provided for @riggingHoistRecommendedLabel.
  ///
  /// In fr, this message translates to:
  /// **'Palan recommandé'**
  String get riggingHoistRecommendedLabel;

  /// No description provided for @riggingHoistOverMaxLabel.
  ///
  /// In fr, this message translates to:
  /// **'> 10 000 kg — hors gamme standard, consultez un spécialiste levage'**
  String get riggingHoistOverMaxLabel;

  /// No description provided for @riggingHoistAvailabilityNote.
  ///
  /// In fr, this message translates to:
  /// **'Tailles standard indicatives (0,125 à 10 t) — la disponibilité réelle dépend du fabricant et du loueur.'**
  String get riggingHoistAvailabilityNote;

  /// No description provided for @riggingToolWllTitle.
  ///
  /// In fr, this message translates to:
  /// **'Vérification WLL / CMU'**
  String get riggingToolWllTitle;

  /// No description provided for @riggingToolWllSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Comparer une charge appliquée avec la capacité du matériel.'**
  String get riggingToolWllSubtitle;

  /// No description provided for @riggingToolLengthTitle.
  ///
  /// In fr, this message translates to:
  /// **'Longueur bridle'**
  String get riggingToolLengthTitle;

  /// No description provided for @riggingToolLengthSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Calculer les longueurs et angles sans calcul de charge.'**
  String get riggingToolLengthSubtitle;

  /// No description provided for @riggingKnownDrop.
  ///
  /// In fr, this message translates to:
  /// **'Flèche'**
  String get riggingKnownDrop;

  /// No description provided for @riggingKnownAngle.
  ///
  /// In fr, this message translates to:
  /// **'Angle'**
  String get riggingKnownAngle;

  /// No description provided for @riggingKnownLength.
  ///
  /// In fr, this message translates to:
  /// **'Longueur'**
  String get riggingKnownLength;

  /// No description provided for @riggingAngleFromHorizontalLabel.
  ///
  /// In fr, this message translates to:
  /// **'Angle depuis l’horizontale'**
  String get riggingAngleFromHorizontalLabel;

  /// No description provided for @riggingLegLengthKnownLabel.
  ///
  /// In fr, this message translates to:
  /// **'Longueur d’un brin'**
  String get riggingLegLengthKnownLabel;

  /// No description provided for @riggingLoadWeightLabel.
  ///
  /// In fr, this message translates to:
  /// **'Poids de la charge'**
  String get riggingLoadWeightLabel;

  /// No description provided for @riggingLoadShortLabel.
  ///
  /// In fr, this message translates to:
  /// **'Charge'**
  String get riggingLoadShortLabel;

  /// No description provided for @riggingPointALabel.
  ///
  /// In fr, this message translates to:
  /// **'A'**
  String get riggingPointALabel;

  /// No description provided for @riggingPointBLabel.
  ///
  /// In fr, this message translates to:
  /// **'B'**
  String get riggingPointBLabel;

  /// No description provided for @riggingTensionLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tension'**
  String get riggingTensionLabel;

  /// No description provided for @riggingTensionLeftLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tension gauche'**
  String get riggingTensionLeftLabel;

  /// No description provided for @riggingTensionRightLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tension droite'**
  String get riggingTensionRightLabel;

  /// No description provided for @riggingTensionPerLegLabel.
  ///
  /// In fr, this message translates to:
  /// **'Tension par brin'**
  String get riggingTensionPerLegLabel;

  /// No description provided for @riggingStatusOk.
  ///
  /// In fr, this message translates to:
  /// **'OK'**
  String get riggingStatusOk;

  /// No description provided for @riggingStatusWatch.
  ///
  /// In fr, this message translates to:
  /// **'À surveiller'**
  String get riggingStatusWatch;

  /// No description provided for @riggingStatusHigh.
  ///
  /// In fr, this message translates to:
  /// **'Élevé'**
  String get riggingStatusHigh;

  /// No description provided for @riggingStatusDanger.
  ///
  /// In fr, this message translates to:
  /// **'Dangereux'**
  String get riggingStatusDanger;

  /// No description provided for @riggingStatusOkDescription.
  ///
  /// In fr, this message translates to:
  /// **'Angle confortable. La tension reste raisonnable.'**
  String get riggingStatusOkDescription;

  /// No description provided for @riggingStatusWatchDescription.
  ///
  /// In fr, this message translates to:
  /// **'Angle utilisable, mais la tension commence à augmenter.'**
  String get riggingStatusWatchDescription;

  /// No description provided for @riggingStatusHighDescription.
  ///
  /// In fr, this message translates to:
  /// **'Angle faible. La tension augmente fortement.'**
  String get riggingStatusHighDescription;

  /// No description provided for @riggingStatusDangerDescription.
  ///
  /// In fr, this message translates to:
  /// **'Angle très faible. Configuration à éviter.'**
  String get riggingStatusDangerDescription;

  /// No description provided for @riggingSafetyDisclaimer.
  ///
  /// In fr, this message translates to:
  /// **'Résultat indicatif. Vérifie toujours la CMU/WLL réelle, les coefficients de sécurité et les règles applicables.'**
  String get riggingSafetyDisclaimer;

  /// No description provided for @riggingInvalidInputsMessage.
  ///
  /// In fr, this message translates to:
  /// **'Entre des valeurs positives et cohérentes.'**
  String get riggingInvalidInputsMessage;

  /// No description provided for @riggingAngleFactorLabel.
  ///
  /// In fr, this message translates to:
  /// **'Facteur multiplicateur'**
  String get riggingAngleFactorLabel;

  /// No description provided for @riggingAngleFactorExplanation.
  ///
  /// In fr, this message translates to:
  /// **'Plus l’angle est faible par rapport à l’horizontale, plus la tension dans chaque brin augmente.'**
  String get riggingAngleFactorExplanation;

  /// No description provided for @riggingWllLabel.
  ///
  /// In fr, this message translates to:
  /// **'WLL / CMU du matériel'**
  String get riggingWllLabel;

  /// No description provided for @riggingAppliedLoadLabel.
  ///
  /// In fr, this message translates to:
  /// **'Charge appliquée'**
  String get riggingAppliedLoadLabel;

  /// No description provided for @riggingSafetyFactorLabel.
  ///
  /// In fr, this message translates to:
  /// **'Facteur de sécurité'**
  String get riggingSafetyFactorLabel;

  /// No description provided for @riggingRequiredLoadLabel.
  ///
  /// In fr, this message translates to:
  /// **'Charge à vérifier'**
  String get riggingRequiredLoadLabel;

  /// No description provided for @riggingWllUsageLabel.
  ///
  /// In fr, this message translates to:
  /// **'Utilisation WLL'**
  String get riggingWllUsageLabel;

  /// No description provided for @riggingMarginLabel.
  ///
  /// In fr, this message translates to:
  /// **'Marge restante'**
  String get riggingMarginLabel;

  /// No description provided for @riggingWllStatusOkDescription.
  ///
  /// In fr, this message translates to:
  /// **'La capacité du matériel est suffisante pour cette charge.'**
  String get riggingWllStatusOkDescription;

  /// No description provided for @riggingWllStatusWatchDescription.
  ///
  /// In fr, this message translates to:
  /// **'La capacité est encore suffisante, mais la marge est faible.'**
  String get riggingWllStatusWatchDescription;

  /// No description provided for @riggingWllStatusDangerDescription.
  ///
  /// In fr, this message translates to:
  /// **'La charge dépasse la capacité indiquée.'**
  String get riggingWllStatusDangerDescription;

  /// No description provided for @riggingLengthDifferenceLabel.
  ///
  /// In fr, this message translates to:
  /// **'Différence de longueur'**
  String get riggingLengthDifferenceLabel;

  /// No description provided for @riggingCalculationModeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Type de calcul'**
  String get riggingCalculationModeLabel;

  /// No description provided for @riggingGeometryOnlyLabel.
  ///
  /// In fr, this message translates to:
  /// **'Sans charge'**
  String get riggingGeometryOnlyLabel;

  /// No description provided for @riggingWithLoadLabel.
  ///
  /// In fr, this message translates to:
  /// **'Avec charge'**
  String get riggingWithLoadLabel;

  /// No description provided for @riggingGeometryOnlyDescription.
  ///
  /// In fr, this message translates to:
  /// **'Mode géométrie uniquement : longueurs, flèche et angles. Aucun calcul de tension ou de charge.'**
  String get riggingGeometryOnlyDescription;

  /// No description provided for @riggingKnownInputLabel.
  ///
  /// In fr, this message translates to:
  /// **'Je connais'**
  String get riggingKnownInputLabel;

  /// No description provided for @homeConversionsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Conversions'**
  String get homeConversionsTitle;

  /// No description provided for @homeConversionsSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Unités, distance, vidéo, audio, DMX et conversions terrain.'**
  String get homeConversionsSubtitle;

  /// No description provided for @conversionsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Conversions'**
  String get conversionsTitle;

  /// No description provided for @conversionsDistanceTitle.
  ///
  /// In fr, this message translates to:
  /// **'Distance'**
  String get conversionsDistanceTitle;

  /// No description provided for @conversionsTemperatureTitle.
  ///
  /// In fr, this message translates to:
  /// **'Température'**
  String get conversionsTemperatureTitle;

  /// No description provided for @conversionsAnglesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Angles'**
  String get conversionsAnglesTitle;

  /// No description provided for @conversionsVideoTitle.
  ///
  /// In fr, this message translates to:
  /// **'Vidéo'**
  String get conversionsVideoTitle;

  /// No description provided for @conversionsAudioTitle.
  ///
  /// In fr, this message translates to:
  /// **'Audio'**
  String get conversionsAudioTitle;

  /// No description provided for @conversionsDmxTitle.
  ///
  /// In fr, this message translates to:
  /// **'DMX'**
  String get conversionsDmxTitle;

  /// No description provided for @conversionsSwap.
  ///
  /// In fr, this message translates to:
  /// **'Inverser'**
  String get conversionsSwap;

  /// No description provided for @conversionsDisclaimer.
  ///
  /// In fr, this message translates to:
  /// **'Indication uniquement. Vérifie toujours les valeurs critiques avec la documentation constructeur.'**
  String get conversionsDisclaimer;

  /// No description provided for @conversionMetersFeet.
  ///
  /// In fr, this message translates to:
  /// **'Mètres <> feet'**
  String get conversionMetersFeet;

  /// No description provided for @conversionCentimetersInches.
  ///
  /// In fr, this message translates to:
  /// **'Centimètres <> pouces'**
  String get conversionCentimetersInches;

  /// No description provided for @conversionMetersYards.
  ///
  /// In fr, this message translates to:
  /// **'Mètres <> yards'**
  String get conversionMetersYards;

  /// No description provided for @conversionCelsiusFahrenheit.
  ///
  /// In fr, this message translates to:
  /// **'Celsius <> Fahrenheit'**
  String get conversionCelsiusFahrenheit;

  /// No description provided for @conversionDegreesRadians.
  ///
  /// In fr, this message translates to:
  /// **'Degrés <> radians'**
  String get conversionDegreesRadians;

  /// No description provided for @conversionSlopePercentDegrees.
  ///
  /// In fr, this message translates to:
  /// **'Pente % <> degrés'**
  String get conversionSlopePercentDegrees;

  /// No description provided for @conversionNitsFootLambert.
  ///
  /// In fr, this message translates to:
  /// **'Nits <> foot-lambert'**
  String get conversionNitsFootLambert;

  /// No description provided for @conversionFpsFrameTime.
  ///
  /// In fr, this message translates to:
  /// **'FPS <> durée image'**
  String get conversionFpsFrameTime;

  /// No description provided for @conversionBpmMs.
  ///
  /// In fr, this message translates to:
  /// **'BPM <> millisecondes'**
  String get conversionBpmMs;

  /// No description provided for @conversionDelayDistance.
  ///
  /// In fr, this message translates to:
  /// **'Délai <> distance'**
  String get conversionDelayDistance;

  /// No description provided for @conversionDmxPercent.
  ///
  /// In fr, this message translates to:
  /// **'DMX <> %'**
  String get conversionDmxPercent;

  /// No description provided for @conversionEightBitSixteenBit.
  ///
  /// In fr, this message translates to:
  /// **'8 bit <> 16 bit'**
  String get conversionEightBitSixteenBit;

  /// No description provided for @subscriptionDurationYear.
  ///
  /// In fr, this message translates to:
  /// **'Abonnement 1 an'**
  String get subscriptionDurationYear;

  /// No description provided for @conversionAudioLevel.
  ///
  /// In fr, this message translates to:
  /// **'dBu / dBV / V'**
  String get conversionAudioLevel;

  /// No description provided for @conversionDmxAbsolute.
  ///
  /// In fr, this message translates to:
  /// **'Univers <> DMX absolu'**
  String get conversionDmxAbsolute;

  /// No description provided for @conversionDmxToAbsoluteHint.
  ///
  /// In fr, this message translates to:
  /// **'Univers + adresse → absolu'**
  String get conversionDmxToAbsoluteHint;

  /// No description provided for @conversionDmxFromAbsoluteHint.
  ///
  /// In fr, this message translates to:
  /// **'Absolu → univers + adresse'**
  String get conversionDmxFromAbsoluteHint;

  /// No description provided for @conversionDmxUniverseLabel.
  ///
  /// In fr, this message translates to:
  /// **'Univers'**
  String get conversionDmxUniverseLabel;

  /// No description provided for @conversionDmxAddressLabel.
  ///
  /// In fr, this message translates to:
  /// **'Adresse'**
  String get conversionDmxAddressLabel;

  /// No description provided for @conversionDmxAbsoluteLabel.
  ///
  /// In fr, this message translates to:
  /// **'DMX Absolu'**
  String get conversionDmxAbsoluteLabel;

  /// No description provided for @gdtfTitle.
  ///
  /// In fr, this message translates to:
  /// **'GDTF'**
  String get gdtfTitle;

  /// No description provided for @gdtfSearchTab.
  ///
  /// In fr, this message translates to:
  /// **'Recherche'**
  String get gdtfSearchTab;

  /// No description provided for @gdtfGenerateFromPdfTab.
  ///
  /// In fr, this message translates to:
  /// **'Générer depuis PDF'**
  String get gdtfGenerateFromPdfTab;

  /// No description provided for @gdtfSearchHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: Martin MAC Aura, Chauvet Rogue…'**
  String get gdtfSearchHint;

  /// No description provided for @gdtfFixtureNameLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nom de la fixture'**
  String get gdtfFixtureNameLabel;

  /// No description provided for @gdtfSearchInfo.
  ///
  /// In fr, this message translates to:
  /// **'Recherche dans la base GDTF Share (6000+ fixtures).\nSi introuvable, utilise l\'onglet \"Générer depuis PDF\".'**
  String get gdtfSearchInfo;

  /// No description provided for @gdtfNoFixtureFound.
  ///
  /// In fr, this message translates to:
  /// **'Aucune fixture trouvée'**
  String get gdtfNoFixtureFound;

  /// No description provided for @gdtfNoFixtureFoundHelp.
  ///
  /// In fr, this message translates to:
  /// **'Tu peux générer un GDTF depuis le PDF du manuel.'**
  String get gdtfNoFixtureFoundHelp;

  /// No description provided for @gdtfGenerateFromPdfTitle.
  ///
  /// In fr, this message translates to:
  /// **'Générer un GDTF depuis un PDF'**
  String get gdtfGenerateFromPdfTitle;

  /// No description provided for @gdtfGenerateFromPdfIntro.
  ///
  /// In fr, this message translates to:
  /// **'Upload le manuel technique de ta fixture. L\'IA extrait les modes DMX — tu vérifies et corriges avant de générer le fichier.\n\n⚠️ Clé du succès : saisis le nom exact de la machine tel qu\'il apparaît dans le manuel. Et si tu ajoutes des modes manuellement, utilise les noms exacts des modes DMX — sinon l\'IA ne retrouve pas les bonnes données.'**
  String get gdtfGenerateFromPdfIntro;

  /// No description provided for @gdtfManufacturerHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: Martin, Chauvet, Robe…'**
  String get gdtfManufacturerHint;

  /// No description provided for @gdtfModelHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: MAC Aura XIP, Rogue R2X…'**
  String get gdtfModelHint;

  /// No description provided for @gdtfSelectManualPdf.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionner le PDF du manuel'**
  String get gdtfSelectManualPdf;

  /// No description provided for @gdtfDetectingModes.
  ///
  /// In fr, this message translates to:
  /// **'Détection des modes…'**
  String get gdtfDetectingModes;

  /// No description provided for @gdtfAnalyzePdf.
  ///
  /// In fr, this message translates to:
  /// **'Analyser le PDF'**
  String get gdtfAnalyzePdf;

  /// No description provided for @gdtfAnalyzePdfHelp.
  ///
  /// In fr, this message translates to:
  /// **'L\'IA détecte les modes DMX disponibles dans le manuel. Tu choisis ensuite ceux à extraire avant de générer le fichier.'**
  String get gdtfAnalyzePdfHelp;

  /// No description provided for @gdtfBackToForm.
  ///
  /// In fr, this message translates to:
  /// **'Revenir au formulaire'**
  String get gdtfBackToForm;

  /// No description provided for @gdtfDetectedModesInManual.
  ///
  /// In fr, this message translates to:
  /// **'{count} mode(s) DMX détecté(s) dans le manuel'**
  String gdtfDetectedModesInManual(int count);

  /// No description provided for @gdtfSearchModeHint.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher un mode…'**
  String get gdtfSearchModeHint;

  /// No description provided for @gdtfSelectAll.
  ///
  /// In fr, this message translates to:
  /// **'Tout'**
  String get gdtfSelectAll;

  /// No description provided for @gdtfSelectNone.
  ///
  /// In fr, this message translates to:
  /// **'Aucun'**
  String get gdtfSelectNone;

  /// No description provided for @gdtfSelectedModesCount.
  ///
  /// In fr, this message translates to:
  /// **'{selected} sélectionné(s) sur {total}'**
  String gdtfSelectedModesCount(int selected, int total);

  /// No description provided for @gdtfNoModeMatchesSearch.
  ///
  /// In fr, this message translates to:
  /// **'Aucun mode ne correspond à la recherche.'**
  String get gdtfNoModeMatchesSearch;

  /// No description provided for @gdtfDmxChannelCount.
  ///
  /// In fr, this message translates to:
  /// **'{count} canaux DMX'**
  String gdtfDmxChannelCount(int count);

  /// No description provided for @gdtfExtractionInProgressLong.
  ///
  /// In fr, this message translates to:
  /// **'Extraction en cours… cela peut prendre jusqu\'à 10 minutes selon le manuel. Ne ferme pas l\'app.'**
  String get gdtfExtractionInProgressLong;

  /// No description provided for @gdtfExtractionMayTakeLong.
  ///
  /// In fr, this message translates to:
  /// **'L\'extraction peut prendre jusqu\'à 10 minutes selon la taille du manuel et le nombre de modes sélectionnés.'**
  String get gdtfExtractionMayTakeLong;

  /// No description provided for @gdtfExtractingChannels.
  ///
  /// In fr, this message translates to:
  /// **'Extraction des canaux…'**
  String get gdtfExtractingChannels;

  /// No description provided for @gdtfExtractModes.
  ///
  /// In fr, this message translates to:
  /// **'Extraire {count} mode(s)'**
  String gdtfExtractModes(int count);

  /// No description provided for @gdtfBackToModeSelection.
  ///
  /// In fr, this message translates to:
  /// **'Revenir à la sélection des modes'**
  String get gdtfBackToModeSelection;

  /// No description provided for @gdtfDetectedModesCount.
  ///
  /// In fr, this message translates to:
  /// **'{count} mode(s) détecté(s)'**
  String gdtfDetectedModesCount(int count);

  /// No description provided for @gdtfUnextractedModesCount.
  ///
  /// In fr, this message translates to:
  /// **'{count} mode(s) non extraits'**
  String gdtfUnextractedModesCount(int count);

  /// No description provided for @gdtfGenerating.
  ///
  /// In fr, this message translates to:
  /// **'Génération…'**
  String get gdtfGenerating;

  /// No description provided for @gdtfGenerateGdtfFile.
  ///
  /// In fr, this message translates to:
  /// **'Générer le fichier .gdtf'**
  String get gdtfGenerateGdtfFile;

  /// No description provided for @gdtfModeNameHint.
  ///
  /// In fr, this message translates to:
  /// **'Nom du mode'**
  String get gdtfModeNameHint;

  /// No description provided for @gdtfChannelCount.
  ///
  /// In fr, this message translates to:
  /// **'{count} canaux'**
  String gdtfChannelCount(int count);

  /// No description provided for @gdtfChannelShort.
  ///
  /// In fr, this message translates to:
  /// **'Ch'**
  String get gdtfChannelShort;

  /// No description provided for @gdtfBits.
  ///
  /// In fr, this message translates to:
  /// **'Bits'**
  String get gdtfBits;

  /// No description provided for @gdtfName.
  ///
  /// In fr, this message translates to:
  /// **'Nom'**
  String get gdtfName;

  /// No description provided for @gdtfDefaultValueLabel.
  ///
  /// In fr, this message translates to:
  /// **'Valeur par défaut (0-255) :'**
  String get gdtfDefaultValueLabel;

  /// No description provided for @gdtfValueRangesLabel.
  ///
  /// In fr, this message translates to:
  /// **'Plages de valeurs / Sous-fonctions :'**
  String get gdtfValueRangesLabel;

  /// No description provided for @gdtfValueRangesHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 0-9=fermé, 10-100=strobe lent, 255=ouvert'**
  String get gdtfValueRangesHint;

  /// No description provided for @gdtfAddChannel.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter un canal'**
  String get gdtfAddChannel;

  /// No description provided for @gdtfFileGenerated.
  ///
  /// In fr, this message translates to:
  /// **'Fichier généré !'**
  String get gdtfFileGenerated;

  /// No description provided for @gdtfShareGdtfFile.
  ///
  /// In fr, this message translates to:
  /// **'Partager le fichier .gdtf'**
  String get gdtfShareGdtfFile;

  /// No description provided for @gdtfGenerateAnotherFile.
  ///
  /// In fr, this message translates to:
  /// **'Générer un autre fichier'**
  String get gdtfGenerateAnotherFile;

  /// No description provided for @gdtfGmailIosTitle.
  ///
  /// In fr, this message translates to:
  /// **'Gmail sur iOS ? Lis ça 👀'**
  String get gdtfGmailIosTitle;

  /// No description provided for @gdtfGmailIosWarning.
  ///
  /// In fr, this message translates to:
  /// **'Gmail sur iOS bloque souvent les pièces jointes .gdtf (\"impossible à joindre le fichier\"). Astuce : renomme le fichier en .zip avant de l\'envoyer — le destinataire le renomme en .gdtf après réception. WhatsApp, Messenger et AirDrop fonctionnent sans souci.'**
  String get gdtfGmailIosWarning;

  /// No description provided for @gdtfDownload.
  ///
  /// In fr, this message translates to:
  /// **'Télécharger'**
  String get gdtfDownload;

  /// No description provided for @gdtfModeFootprint.
  ///
  /// In fr, this message translates to:
  /// **'{name} ({count}ch)'**
  String gdtfModeFootprint(String name, int count);

  /// No description provided for @gdtfDownloadingFixture.
  ///
  /// In fr, this message translates to:
  /// **'Téléchargement de {fixture}…'**
  String gdtfDownloadingFixture(String fixture);

  /// No description provided for @gdtfErrorStatus.
  ///
  /// In fr, this message translates to:
  /// **'Erreur {statusCode}'**
  String gdtfErrorStatus(int statusCode);

  /// No description provided for @gdtfErrorStatusParentheses.
  ///
  /// In fr, this message translates to:
  /// **'Erreur ({statusCode})'**
  String gdtfErrorStatusParentheses(int statusCode);

  /// No description provided for @gdtfNetworkError.
  ///
  /// In fr, this message translates to:
  /// **'Erreur réseau : {error}'**
  String gdtfNetworkError(String error);

  /// No description provided for @gdtfErrorDetails.
  ///
  /// In fr, this message translates to:
  /// **'Erreur : {error}'**
  String gdtfErrorDetails(String error);

  /// No description provided for @gdtfErrorFillManufacturerAndModel.
  ///
  /// In fr, this message translates to:
  /// **'Remplis le fabricant et le modèle.'**
  String get gdtfErrorFillManufacturerAndModel;

  /// No description provided for @gdtfErrorSelectPdf.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionne un fichier PDF.'**
  String get gdtfErrorSelectPdf;

  /// No description provided for @gdtfErrorCannotExtractDmxPages.
  ///
  /// In fr, this message translates to:
  /// **'Impossible d\'extraire les pages DMX du PDF.'**
  String get gdtfErrorCannotExtractDmxPages;

  /// No description provided for @gdtfUnknownError.
  ///
  /// In fr, this message translates to:
  /// **'Erreur inconnue'**
  String get gdtfUnknownError;

  /// No description provided for @gdtfUnknownErrorLowercase.
  ///
  /// In fr, this message translates to:
  /// **'erreur inconnue'**
  String get gdtfUnknownErrorLowercase;

  /// No description provided for @gdtfNoDmxModeDetected.
  ///
  /// In fr, this message translates to:
  /// **'Aucun mode DMX détecté dans le manuel.'**
  String get gdtfNoDmxModeDetected;

  /// No description provided for @gdtfErrorSelectAtLeastOneMode.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionne au moins un mode à extraire.'**
  String get gdtfErrorSelectAtLeastOneMode;

  /// No description provided for @gdtfErrorManualDataLost.
  ///
  /// In fr, this message translates to:
  /// **'Données du manuel perdues, relance l\'analyse.'**
  String get gdtfErrorManualDataLost;

  /// No description provided for @mireVideoPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mires écran vidéo'**
  String get mireVideoPageTitle;

  /// No description provided for @mireVideoWidthPxLabel.
  ///
  /// In fr, this message translates to:
  /// **'Largeur (px)'**
  String get mireVideoWidthPxLabel;

  /// No description provided for @mireVideoHeightPxLabel.
  ///
  /// In fr, this message translates to:
  /// **'Hauteur (px)'**
  String get mireVideoHeightPxLabel;

  /// No description provided for @mireVideoProjectorCountLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nombre de projecteurs (N)'**
  String get mireVideoProjectorCountLabel;

  /// No description provided for @mireVideoOverlapPercentLabel.
  ///
  /// In fr, this message translates to:
  /// **'Overlap (%)'**
  String get mireVideoOverlapPercentLabel;

  /// No description provided for @mireVideoHint1920.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1920'**
  String get mireVideoHint1920;

  /// No description provided for @mireVideoHint1080.
  ///
  /// In fr, this message translates to:
  /// **'ex: 1080'**
  String get mireVideoHint1080;

  /// No description provided for @mireVideoHint3840.
  ///
  /// In fr, this message translates to:
  /// **'ex: 3840'**
  String get mireVideoHint3840;

  /// No description provided for @mireVideoHint2160.
  ///
  /// In fr, this message translates to:
  /// **'ex: 2160'**
  String get mireVideoHint2160;

  /// No description provided for @mireVideoHint2.
  ///
  /// In fr, this message translates to:
  /// **'ex: 2'**
  String get mireVideoHint2;

  /// No description provided for @mireVideoHint10Percent.
  ///
  /// In fr, this message translates to:
  /// **'ex: 10.0'**
  String get mireVideoHint10Percent;

  /// No description provided for @mireVideoTestPatternTypeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Type de mire'**
  String get mireVideoTestPatternTypeLabel;

  /// No description provided for @mireVideoSimpleTypeComboAll.
  ///
  /// In fr, this message translates to:
  /// **'Combo (grille + cercles + 2 barres centrées)'**
  String get mireVideoSimpleTypeComboAll;

  /// No description provided for @mireVideoSimpleTypeGridSafe.
  ///
  /// In fr, this message translates to:
  /// **'Grille + safe + cercles'**
  String get mireVideoSimpleTypeGridSafe;

  /// No description provided for @mireVideoSimpleTypeColorBars.
  ///
  /// In fr, this message translates to:
  /// **'Barres + rampes + cercles'**
  String get mireVideoSimpleTypeColorBars;

  /// No description provided for @mireVideoSimpleTypeUniformity.
  ///
  /// In fr, this message translates to:
  /// **'Uniformité + cercles'**
  String get mireVideoSimpleTypeUniformity;

  /// No description provided for @mireVideoSimpleTypeCheckerboard.
  ///
  /// In fr, this message translates to:
  /// **'Damier + cercles'**
  String get mireVideoSimpleTypeCheckerboard;

  /// No description provided for @mireVideoExportPngButton.
  ///
  /// In fr, this message translates to:
  /// **'Exporter PNG'**
  String get mireVideoExportPngButton;

  /// No description provided for @mireVideoOrientationLabel.
  ///
  /// In fr, this message translates to:
  /// **'Orientation'**
  String get mireVideoOrientationLabel;

  /// No description provided for @mireVideoOrientationHorizontal.
  ///
  /// In fr, this message translates to:
  /// **'Horizontal'**
  String get mireVideoOrientationHorizontal;

  /// No description provided for @mireVideoOrientationVertical.
  ///
  /// In fr, this message translates to:
  /// **'Vertical'**
  String get mireVideoOrientationVertical;

  /// No description provided for @mireVideoMappingTypeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Type mapping'**
  String get mireVideoMappingTypeLabel;

  /// No description provided for @mireVideoMappingTypeCombo.
  ///
  /// In fr, this message translates to:
  /// **'Combo (zones + overlap + blend)'**
  String get mireVideoMappingTypeCombo;

  /// No description provided for @mireVideoMappingTypeZonesAndOverlap.
  ///
  /// In fr, this message translates to:
  /// **'Zones + overlap'**
  String get mireVideoMappingTypeZonesAndOverlap;

  /// No description provided for @mireVideoMappingTypeBlendRamps.
  ///
  /// In fr, this message translates to:
  /// **'Blend ramps'**
  String get mireVideoMappingTypeBlendRamps;

  /// No description provided for @mireVideoErrorInvalidWidthHeight.
  ///
  /// In fr, this message translates to:
  /// **'❌ Largeur/hauteur invalides (px).'**
  String get mireVideoErrorInvalidWidthHeight;

  /// No description provided for @mireVideoErrorInvalidProjectorCount.
  ///
  /// In fr, this message translates to:
  /// **'❌ Nombre de projecteurs invalide (N > 0).'**
  String get mireVideoErrorInvalidProjectorCount;

  /// No description provided for @mireVideoErrorInvalidOverlap.
  ///
  /// In fr, this message translates to:
  /// **'❌ Overlap invalide (0 à 99.9).'**
  String get mireVideoErrorInvalidOverlap;

  /// No description provided for @cinemaTitle.
  ///
  /// In fr, this message translates to:
  /// **'Cinéma / Film'**
  String get cinemaTitle;

  /// No description provided for @cinemaIntroTitle.
  ///
  /// In fr, this message translates to:
  /// **'Outils cinéma et tournage'**
  String get cinemaIntroTitle;

  /// No description provided for @cinemaIntroBody.
  ///
  /// In fr, this message translates to:
  /// **'Calculs utiles pour l’optique, le cadrage, l’exposition, le stockage, le timecode et la projection cinéma.'**
  String get cinemaIntroBody;

  /// No description provided for @cinemaFieldOfViewTitle.
  ///
  /// In fr, this message translates to:
  /// **'Angle de champ'**
  String get cinemaFieldOfViewTitle;

  /// No description provided for @cinemaFieldOfViewSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Calcul horizontal, vertical et diagonal selon capteur et focale.'**
  String get cinemaFieldOfViewSubtitle;

  /// No description provided for @cinemaFieldOfViewDescription.
  ///
  /// In fr, this message translates to:
  /// **'Calcule l’angle de champ selon le format capteur et la focale.'**
  String get cinemaFieldOfViewDescription;

  /// No description provided for @cinemaFieldOfViewInfo.
  ///
  /// In fr, this message translates to:
  /// **'Formule : angle = 2 × atan(taille capteur ÷ (2 × focale)).'**
  String get cinemaFieldOfViewInfo;

  /// No description provided for @cinemaSubjectDistanceTitle.
  ///
  /// In fr, this message translates to:
  /// **'Distance caméra / sujet'**
  String get cinemaSubjectDistanceTitle;

  /// No description provided for @cinemaSubjectDistanceSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Estime la distance nécessaire pour cadrer un sujet.'**
  String get cinemaSubjectDistanceSubtitle;

  /// No description provided for @cinemaSubjectDistanceDescription.
  ///
  /// In fr, this message translates to:
  /// **'Estime la distance caméra nécessaire pour cadrer un sujet en hauteur.'**
  String get cinemaSubjectDistanceDescription;

  /// No description provided for @cinemaSubjectDistanceInfo.
  ///
  /// In fr, this message translates to:
  /// **'Approximation géométrique idéale. La distance réelle peut varier selon le breathing optique, le mode capteur et le recadrage.'**
  String get cinemaSubjectDistanceInfo;

  /// No description provided for @cinemaDepthOfFieldTitle.
  ///
  /// In fr, this message translates to:
  /// **'Profondeur de champ'**
  String get cinemaDepthOfFieldTitle;

  /// No description provided for @cinemaDepthOfFieldSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Zone nette, limite proche, limite lointaine et hyperfocale.'**
  String get cinemaDepthOfFieldSubtitle;

  /// No description provided for @cinemaDepthOfFieldDescription.
  ///
  /// In fr, this message translates to:
  /// **'Calcule la zone de netteté théorique selon focale, ouverture, distance et cercle de confusion.'**
  String get cinemaDepthOfFieldDescription;

  /// No description provided for @cinemaDepthOfFieldInfo.
  ///
  /// In fr, this message translates to:
  /// **'Résultat théorique. La perception de netteté dépend aussi de la résolution, de la taille d’affichage et de la distance de visionnage.'**
  String get cinemaDepthOfFieldInfo;

  /// No description provided for @cinemaLensEquivalenceTitle.
  ///
  /// In fr, this message translates to:
  /// **'Équivalence de focale'**
  String get cinemaLensEquivalenceTitle;

  /// No description provided for @cinemaLensEquivalenceSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Conversion de focale entre formats de capteurs.'**
  String get cinemaLensEquivalenceSubtitle;

  /// No description provided for @cinemaLensEquivalenceDescription.
  ///
  /// In fr, this message translates to:
  /// **'Convertit une focale d’un format capteur vers un autre en conservant un angle de champ diagonal similaire.'**
  String get cinemaLensEquivalenceDescription;

  /// No description provided for @cinemaLensEquivalenceInfo.
  ///
  /// In fr, this message translates to:
  /// **'Conversion basée sur la diagonale. Pour un cadrage strictement horizontal ou vertical, le facteur peut être légèrement différent.'**
  String get cinemaLensEquivalenceInfo;

  /// No description provided for @cinemaAnamorphicTitle.
  ///
  /// In fr, this message translates to:
  /// **'Anamorphique'**
  String get cinemaAnamorphicTitle;

  /// No description provided for @cinemaAnamorphicSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Désqueeze, ratio final et focale horizontale équivalente.'**
  String get cinemaAnamorphicSubtitle;

  /// No description provided for @cinemaAnamorphicDescription.
  ///
  /// In fr, this message translates to:
  /// **'Calcule le ratio final après désqueeze et l’équivalence horizontale de la focale.'**
  String get cinemaAnamorphicDescription;

  /// No description provided for @cinemaAnamorphicInfo.
  ///
  /// In fr, this message translates to:
  /// **'Une optique anamorphique élargit le champ horizontal après désqueeze, mais conserve le comportement vertical de la focale.'**
  String get cinemaAnamorphicInfo;

  /// No description provided for @cinemaShutterTitle.
  ///
  /// In fr, this message translates to:
  /// **'Shutter angle / shutter speed'**
  String get cinemaShutterTitle;

  /// No description provided for @cinemaShutterSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Conversion entre angle d’obturation, FPS et vitesse.'**
  String get cinemaShutterSubtitle;

  /// No description provided for @cinemaShutterDescription.
  ///
  /// In fr, this message translates to:
  /// **'Convertit un angle d’obturation cinéma en vitesse d’obturation.'**
  String get cinemaShutterDescription;

  /// No description provided for @cinemaShutterInfo.
  ///
  /// In fr, this message translates to:
  /// **'À 180°, la vitesse est environ 1 ÷ (2 × fps). Exemple : 25 fps → 1/50 s.'**
  String get cinemaShutterInfo;

  /// No description provided for @cinemaFlickerTitle.
  ///
  /// In fr, this message translates to:
  /// **'Flicker free'**
  String get cinemaFlickerTitle;

  /// No description provided for @cinemaFlickerSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Vitesses d’obturation sûres selon 50 Hz ou 60 Hz.'**
  String get cinemaFlickerSubtitle;

  /// No description provided for @cinemaFlickerDescription.
  ///
  /// In fr, this message translates to:
  /// **'Liste des vitesses d’obturation généralement sûres selon la fréquence secteur.'**
  String get cinemaFlickerDescription;

  /// No description provided for @cinemaFlickerInfo.
  ///
  /// In fr, this message translates to:
  /// **'Les LEDs, écrans et sources dimmées peuvent quand même scintiller selon leur électronique, leur PWM ou leur fréquence de refresh.'**
  String get cinemaFlickerInfo;

  /// No description provided for @cinemaNdExposureTitle.
  ///
  /// In fr, this message translates to:
  /// **'ND / exposition'**
  String get cinemaNdExposureTitle;

  /// No description provided for @cinemaNdExposureSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Stops, densité ND, facteur ND et correction d’exposition.'**
  String get cinemaNdExposureSubtitle;

  /// No description provided for @cinemaNdExposureDescription.
  ///
  /// In fr, this message translates to:
  /// **'Convertit une correction en stops vers densité ND et facteur de réduction lumineuse.'**
  String get cinemaNdExposureDescription;

  /// No description provided for @cinemaNdExposureInfo.
  ///
  /// In fr, this message translates to:
  /// **'Repères : ND 0.3 = 1 stop, ND 0.6 = 2 stops, ND 0.9 = 3 stops, ND 1.2 = 4 stops.'**
  String get cinemaNdExposureInfo;

  /// No description provided for @cinemaRecordingStorageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Temps d’enregistrement'**
  String get cinemaRecordingStorageTitle;

  /// No description provided for @cinemaRecordingStorageSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Durée disponible selon capacité et bitrate.'**
  String get cinemaRecordingStorageSubtitle;

  /// No description provided for @cinemaRecordingStorageDescription.
  ///
  /// In fr, this message translates to:
  /// **'Estime la durée disponible selon la capacité de carte/disque et le bitrate vidéo.'**
  String get cinemaRecordingStorageDescription;

  /// No description provided for @cinemaRecordingStorageInfo.
  ///
  /// In fr, this message translates to:
  /// **'Calcul décimal simplifié : 1 GB = 8000 Mb. Prévoir une marge pour l’audio, les métadonnées, le système de fichiers et la réserve média.'**
  String get cinemaRecordingStorageInfo;

  /// No description provided for @cinemaTimecodeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Timecode'**
  String get cinemaTimecodeTitle;

  /// No description provided for @cinemaTimecodeSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Conversion timecode ↔ frames et durée entre deux TC.'**
  String get cinemaTimecodeSubtitle;

  /// No description provided for @cinemaTimecodeDescription.
  ///
  /// In fr, this message translates to:
  /// **'Convertit deux timecodes en frames et calcule la durée entre les deux.'**
  String get cinemaTimecodeDescription;

  /// No description provided for @cinemaTimecodeInfo.
  ///
  /// In fr, this message translates to:
  /// **'Cette première version utilise du timecode entier non-drop-frame. Le 29.97 drop-frame peut être ajouté ensuite séparément.'**
  String get cinemaTimecodeInfo;

  /// No description provided for @cinemaSlowMotionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Ralenti / framerate'**
  String get cinemaSlowMotionTitle;

  /// No description provided for @cinemaSlowMotionSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Facteur de ralenti et durée de lecture.'**
  String get cinemaSlowMotionSubtitle;

  /// No description provided for @cinemaSlowMotionDescription.
  ///
  /// In fr, this message translates to:
  /// **'Calcule le facteur de ralenti et la durée de lecture finale.'**
  String get cinemaSlowMotionDescription;

  /// No description provided for @cinemaSlowMotionInfo.
  ///
  /// In fr, this message translates to:
  /// **'Exemple : 100 fps tourné, 25 fps lu = ralenti ×4.'**
  String get cinemaSlowMotionInfo;

  /// No description provided for @cinemaProjectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Projection cinéma'**
  String get cinemaProjectionTitle;

  /// No description provided for @cinemaProjectionSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Écran, ratio, throw, luminance, nits et ft-L.'**
  String get cinemaProjectionSubtitle;

  /// No description provided for @cinemaProjectionDescription.
  ///
  /// In fr, this message translates to:
  /// **'Calcule les dimensions écran, la distance projecteur et une luminance approximative.'**
  String get cinemaProjectionDescription;

  /// No description provided for @cinemaProjectionInfo.
  ///
  /// In fr, this message translates to:
  /// **'Luminance approximative : nits ≈ lumens × gain ÷ (π × surface). Les pertes optiques, zoom, vieillissement lampe/laser et calibration ne sont pas inclus.'**
  String get cinemaProjectionInfo;

  /// No description provided for @cinemaGlobalDisclaimer.
  ///
  /// In fr, this message translates to:
  /// **'Ces outils donnent des valeurs techniques indicatives. Les résultats peuvent varier selon la caméra, l’optique, le codec, le profil image, le projecteur, la toile ou les conditions réelles de tournage.'**
  String get cinemaGlobalDisclaimer;

  /// No description provided for @cinemaSensorLabel.
  ///
  /// In fr, this message translates to:
  /// **'Capteur'**
  String get cinemaSensorLabel;

  /// No description provided for @cinemaFocalLengthLabel.
  ///
  /// In fr, this message translates to:
  /// **'Focale'**
  String get cinemaFocalLengthLabel;

  /// No description provided for @cinemaHorizontalAngleResult.
  ///
  /// In fr, this message translates to:
  /// **'Angle horizontal'**
  String get cinemaHorizontalAngleResult;

  /// No description provided for @cinemaVerticalAngleResult.
  ///
  /// In fr, this message translates to:
  /// **'Angle vertical'**
  String get cinemaVerticalAngleResult;

  /// No description provided for @cinemaDiagonalAngleResult.
  ///
  /// In fr, this message translates to:
  /// **'Angle diagonal'**
  String get cinemaDiagonalAngleResult;

  /// No description provided for @cinemaSensorDiagonalResult.
  ///
  /// In fr, this message translates to:
  /// **'Diagonale capteur'**
  String get cinemaSensorDiagonalResult;

  /// No description provided for @cinemaSubjectHeightLabel.
  ///
  /// In fr, this message translates to:
  /// **'Hauteur du sujet'**
  String get cinemaSubjectHeightLabel;

  /// No description provided for @cinemaFrameFillLabel.
  ///
  /// In fr, this message translates to:
  /// **'Occupation du cadre en hauteur'**
  String get cinemaFrameFillLabel;

  /// No description provided for @cinemaEstimatedDistanceResult.
  ///
  /// In fr, this message translates to:
  /// **'Distance estimée'**
  String get cinemaEstimatedDistanceResult;

  /// No description provided for @cinemaFrameHeightResult.
  ///
  /// In fr, this message translates to:
  /// **'Hauteur cadre à cette distance'**
  String get cinemaFrameHeightResult;

  /// No description provided for @cinemaApertureLabel.
  ///
  /// In fr, this message translates to:
  /// **'Ouverture'**
  String get cinemaApertureLabel;

  /// No description provided for @cinemaSubjectDistanceInputLabel.
  ///
  /// In fr, this message translates to:
  /// **'Distance sujet'**
  String get cinemaSubjectDistanceInputLabel;

  /// No description provided for @cinemaCocLabel.
  ///
  /// In fr, this message translates to:
  /// **'Cercle de confusion'**
  String get cinemaCocLabel;

  /// No description provided for @cinemaCocHelper.
  ///
  /// In fr, this message translates to:
  /// **'Exemple Full Frame : 0.03 mm'**
  String get cinemaCocHelper;

  /// No description provided for @cinemaHyperfocalResult.
  ///
  /// In fr, this message translates to:
  /// **'Hyperfocale'**
  String get cinemaHyperfocalResult;

  /// No description provided for @cinemaNearLimitResult.
  ///
  /// In fr, this message translates to:
  /// **'Limite proche'**
  String get cinemaNearLimitResult;

  /// No description provided for @cinemaFarLimitResult.
  ///
  /// In fr, this message translates to:
  /// **'Limite lointaine'**
  String get cinemaFarLimitResult;

  /// No description provided for @cinemaTotalDepthResult.
  ///
  /// In fr, this message translates to:
  /// **'Profondeur totale'**
  String get cinemaTotalDepthResult;

  /// No description provided for @cinemaSourceSensorLabel.
  ///
  /// In fr, this message translates to:
  /// **'Capteur source'**
  String get cinemaSourceSensorLabel;

  /// No description provided for @cinemaTargetSensorLabel.
  ///
  /// In fr, this message translates to:
  /// **'Capteur cible'**
  String get cinemaTargetSensorLabel;

  /// No description provided for @cinemaSourceFocalLengthLabel.
  ///
  /// In fr, this message translates to:
  /// **'Focale source'**
  String get cinemaSourceFocalLengthLabel;

  /// No description provided for @cinemaEquivalentFocalResult.
  ///
  /// In fr, this message translates to:
  /// **'Focale équivalente'**
  String get cinemaEquivalentFocalResult;

  /// No description provided for @cinemaAppliedFactorResult.
  ///
  /// In fr, this message translates to:
  /// **'Facteur appliqué'**
  String get cinemaAppliedFactorResult;

  /// No description provided for @cinemaSensorRecordingRatioLabel.
  ///
  /// In fr, this message translates to:
  /// **'Ratio capteur / enregistrement'**
  String get cinemaSensorRecordingRatioLabel;

  /// No description provided for @cinemaSensorRecordingRatioHelper.
  ///
  /// In fr, this message translates to:
  /// **'16:9 = 1.78, 4:3 = 1.33, 3:2 = 1.50'**
  String get cinemaSensorRecordingRatioHelper;

  /// No description provided for @cinemaAnamorphicFactorLabel.
  ///
  /// In fr, this message translates to:
  /// **'Facteur anamorphique'**
  String get cinemaAnamorphicFactorLabel;

  /// No description provided for @cinemaAnamorphicFactorHelper.
  ///
  /// In fr, this message translates to:
  /// **'1.33, 1.5, 1.8, 2.0'**
  String get cinemaAnamorphicFactorHelper;

  /// No description provided for @cinemaOpticalFocalLengthLabel.
  ///
  /// In fr, this message translates to:
  /// **'Focale optique'**
  String get cinemaOpticalFocalLengthLabel;

  /// No description provided for @cinemaFinalRatioResult.
  ///
  /// In fr, this message translates to:
  /// **'Ratio final'**
  String get cinemaFinalRatioResult;

  /// No description provided for @cinemaHorizontalEquivalentFocalResult.
  ///
  /// In fr, this message translates to:
  /// **'Focale horizontale équivalente'**
  String get cinemaHorizontalEquivalentFocalResult;

  /// No description provided for @cinemaVerticalFocalResult.
  ///
  /// In fr, this message translates to:
  /// **'Focale verticale'**
  String get cinemaVerticalFocalResult;

  /// No description provided for @cinemaFramerateLabel.
  ///
  /// In fr, this message translates to:
  /// **'Framerate'**
  String get cinemaFramerateLabel;

  /// No description provided for @cinemaShutterAngleLabel.
  ///
  /// In fr, this message translates to:
  /// **'Angle d’obturation'**
  String get cinemaShutterAngleLabel;

  /// No description provided for @cinemaExposureTimeResult.
  ///
  /// In fr, this message translates to:
  /// **'Temps d’exposition'**
  String get cinemaExposureTimeResult;

  /// No description provided for @cinemaEquivalentShutterSpeedResult.
  ///
  /// In fr, this message translates to:
  /// **'Vitesse équivalente'**
  String get cinemaEquivalentShutterSpeedResult;

  /// No description provided for @cinemaMainsFrequencyLabel.
  ///
  /// In fr, this message translates to:
  /// **'Fréquence secteur'**
  String get cinemaMainsFrequencyLabel;

  /// No description provided for @cinemaMains50Hz.
  ///
  /// In fr, this message translates to:
  /// **'50 Hz — Europe'**
  String get cinemaMains50Hz;

  /// No description provided for @cinemaMains60Hz.
  ///
  /// In fr, this message translates to:
  /// **'60 Hz — USA / autres'**
  String get cinemaMains60Hz;

  /// No description provided for @cinemaRecommendedSpeedsResult.
  ///
  /// In fr, this message translates to:
  /// **'Vitesses conseillées'**
  String get cinemaRecommendedSpeedsResult;

  /// No description provided for @cinemaMainsBaseResult.
  ///
  /// In fr, this message translates to:
  /// **'Base secteur'**
  String get cinemaMainsBaseResult;

  /// No description provided for @cinemaReductionLabel.
  ///
  /// In fr, this message translates to:
  /// **'Réduction souhaitée'**
  String get cinemaReductionLabel;

  /// No description provided for @cinemaNdDensityResult.
  ///
  /// In fr, this message translates to:
  /// **'Densité ND'**
  String get cinemaNdDensityResult;

  /// No description provided for @cinemaNdFactorResult.
  ///
  /// In fr, this message translates to:
  /// **'Facteur ND'**
  String get cinemaNdFactorResult;

  /// No description provided for @cinemaApproxTransmissionResult.
  ///
  /// In fr, this message translates to:
  /// **'Transmission approx.'**
  String get cinemaApproxTransmissionResult;

  /// No description provided for @cinemaMediaCapacityLabel.
  ///
  /// In fr, this message translates to:
  /// **'Capacité média'**
  String get cinemaMediaCapacityLabel;

  /// No description provided for @cinemaBitrateLabel.
  ///
  /// In fr, this message translates to:
  /// **'Bitrate'**
  String get cinemaBitrateLabel;

  /// No description provided for @cinemaBitrateHelper.
  ///
  /// In fr, this message translates to:
  /// **'Attention : Mb/s, pas MB/s'**
  String get cinemaBitrateHelper;

  /// No description provided for @cinemaAvailableDurationResult.
  ///
  /// In fr, this message translates to:
  /// **'Durée disponible'**
  String get cinemaAvailableDurationResult;

  /// No description provided for @cinemaStorageConsumptionResult.
  ///
  /// In fr, this message translates to:
  /// **'Consommation'**
  String get cinemaStorageConsumptionResult;

  /// No description provided for @cinemaIntegerFramerateLabel.
  ///
  /// In fr, this message translates to:
  /// **'Framerate entier'**
  String get cinemaIntegerFramerateLabel;

  /// No description provided for @cinemaIntegerFramerateHelper.
  ///
  /// In fr, this message translates to:
  /// **'24, 25, 30, 50, 60…'**
  String get cinemaIntegerFramerateHelper;

  /// No description provided for @cinemaTcInLabel.
  ///
  /// In fr, this message translates to:
  /// **'TC IN'**
  String get cinemaTcInLabel;

  /// No description provided for @cinemaTcOutLabel.
  ///
  /// In fr, this message translates to:
  /// **'TC OUT'**
  String get cinemaTcOutLabel;

  /// No description provided for @cinemaTimecodeFormatHelper.
  ///
  /// In fr, this message translates to:
  /// **'Format HH:MM:SS:FF'**
  String get cinemaTimecodeFormatHelper;

  /// No description provided for @cinemaTcInFramesResult.
  ///
  /// In fr, this message translates to:
  /// **'Frames TC IN'**
  String get cinemaTcInFramesResult;

  /// No description provided for @cinemaTcOutFramesResult.
  ///
  /// In fr, this message translates to:
  /// **'Frames TC OUT'**
  String get cinemaTcOutFramesResult;

  /// No description provided for @cinemaDurationFramesResult.
  ///
  /// In fr, this message translates to:
  /// **'Durée en frames'**
  String get cinemaDurationFramesResult;

  /// No description provided for @cinemaDurationTcResult.
  ///
  /// In fr, this message translates to:
  /// **'Durée TC'**
  String get cinemaDurationTcResult;

  /// No description provided for @cinemaDurationResult.
  ///
  /// In fr, this message translates to:
  /// **'Durée'**
  String get cinemaDurationResult;

  /// No description provided for @cinemaCaptureFramerateLabel.
  ///
  /// In fr, this message translates to:
  /// **'Framerate tournage'**
  String get cinemaCaptureFramerateLabel;

  /// No description provided for @cinemaPlaybackFramerateLabel.
  ///
  /// In fr, this message translates to:
  /// **'Framerate lecture'**
  String get cinemaPlaybackFramerateLabel;

  /// No description provided for @cinemaRealDurationLabel.
  ///
  /// In fr, this message translates to:
  /// **'Durée réelle filmée'**
  String get cinemaRealDurationLabel;

  /// No description provided for @cinemaSlowMotionFactorResult.
  ///
  /// In fr, this message translates to:
  /// **'Facteur de ralenti'**
  String get cinemaSlowMotionFactorResult;

  /// No description provided for @cinemaPlaybackDurationResult.
  ///
  /// In fr, this message translates to:
  /// **'Durée de lecture'**
  String get cinemaPlaybackDurationResult;

  /// No description provided for @cinemaScreenWidthLabel.
  ///
  /// In fr, this message translates to:
  /// **'Largeur écran'**
  String get cinemaScreenWidthLabel;

  /// No description provided for @cinemaImageRatioLabel.
  ///
  /// In fr, this message translates to:
  /// **'Ratio image'**
  String get cinemaImageRatioLabel;

  /// No description provided for @cinemaImageRatioHelper.
  ///
  /// In fr, this message translates to:
  /// **'1.85, 2.39, 1.78…'**
  String get cinemaImageRatioHelper;

  /// No description provided for @cinemaThrowRatioLabel.
  ///
  /// In fr, this message translates to:
  /// **'Throw ratio'**
  String get cinemaThrowRatioLabel;

  /// No description provided for @cinemaProjectorLumensLabel.
  ///
  /// In fr, this message translates to:
  /// **'Flux projecteur'**
  String get cinemaProjectorLumensLabel;

  /// No description provided for @cinemaScreenGainLabel.
  ///
  /// In fr, this message translates to:
  /// **'Gain toile'**
  String get cinemaScreenGainLabel;

  /// No description provided for @cinemaScreenHeightResult.
  ///
  /// In fr, this message translates to:
  /// **'Hauteur écran'**
  String get cinemaScreenHeightResult;

  /// No description provided for @cinemaScreenAreaResult.
  ///
  /// In fr, this message translates to:
  /// **'Surface écran'**
  String get cinemaScreenAreaResult;

  /// No description provided for @cinemaProjectorDistanceResult.
  ///
  /// In fr, this message translates to:
  /// **'Distance projecteur'**
  String get cinemaProjectorDistanceResult;

  /// No description provided for @cinemaApproxLuminanceResult.
  ///
  /// In fr, this message translates to:
  /// **'Luminance approx.'**
  String get cinemaApproxLuminanceResult;

  /// No description provided for @gdtfScannedPdfOcrEnabled.
  ///
  /// In fr, this message translates to:
  /// **'PDF scanné détecté : mode OCR activé. L\'analyse peut prendre 1 à 2 minutes supplémentaires.'**
  String get gdtfScannedPdfOcrEnabled;

  /// No description provided for @gdtfAddModeDialogTitle.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter un mode'**
  String get gdtfAddModeDialogTitle;

  /// No description provided for @gdtfModeNameExampleHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex: Standard, Easy, Pixel Engine…'**
  String get gdtfModeNameExampleHint;

  /// No description provided for @gdtfDmxChannelCountLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nombre de canaux DMX'**
  String get gdtfDmxChannelCountLabel;

  /// No description provided for @gdtfDmxChannelCountHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex: 24'**
  String get gdtfDmxChannelCountHint;

  /// No description provided for @gdtfCancel.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get gdtfCancel;

  /// No description provided for @gdtfAdd.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter'**
  String get gdtfAdd;

  /// No description provided for @gdtfErrorModeNameRequired.
  ///
  /// In fr, this message translates to:
  /// **'Le nom est requis'**
  String get gdtfErrorModeNameRequired;

  /// No description provided for @gdtfErrorInvalidChannelCount.
  ///
  /// In fr, this message translates to:
  /// **'Nombre de canaux invalide (1-1000)'**
  String get gdtfErrorInvalidChannelCount;

  /// No description provided for @gdtfErrorModeAlreadyExists.
  ///
  /// In fr, this message translates to:
  /// **'Un mode portant ce nom existe déjà'**
  String get gdtfErrorModeAlreadyExists;

  /// No description provided for @gdtfHowToUseThisPageTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Comment utiliser cette page'**
  String get gdtfHowToUseThisPageTooltip;

  /// No description provided for @gdtfHowToGetGdtfTitle.
  ///
  /// In fr, this message translates to:
  /// **'Comment obtenir un GDTF'**
  String get gdtfHowToGetGdtfTitle;

  /// No description provided for @gdtfWorkflowIntro.
  ///
  /// In fr, this message translates to:
  /// **'Pour chaque fixture, suis ces 3 étapes dans l\'ordre.'**
  String get gdtfWorkflowIntro;

  /// No description provided for @gdtfWorkflowSearchTitle.
  ///
  /// In fr, this message translates to:
  /// **'Recherche'**
  String get gdtfWorkflowSearchTitle;

  /// No description provided for @gdtfWorkflowSearchBody.
  ///
  /// In fr, this message translates to:
  /// **'Onglet « Recherche ». Tape le nom de ta fixture (ex: \"Spiider\", \"MAC Viper\", \"Q-10\"). La base GDTF Share contient 6000+ fixtures officielles validées par les fabricants. C\'est gratuit, instantané, et 100% fiable. À utiliser EN PREMIER pour 90% des cas.'**
  String get gdtfWorkflowSearchBody;

  /// No description provided for @gdtfWorkflowPdfTitle.
  ///
  /// In fr, this message translates to:
  /// **'Générer depuis PDF'**
  String get gdtfWorkflowPdfTitle;

  /// No description provided for @gdtfWorkflowPdfBody.
  ///
  /// In fr, this message translates to:
  /// **'Si la recherche ne donne rien, passe à l\'onglet « Générer depuis PDF ». Upload le manuel/datasheet PDF — l\'IA extrait les modes DMX automatiquement. ⚠️ Important : saisis le nom exact de la machine (tel qu\'écrit dans le manuel), et si tu ajoutes des modes manuellement, utilise les noms exacts des modes DMX — sinon l\'IA ne retrouve pas les bonnes données. Marche bien sur les PDFs propres (Robe, Martin, etc.) et moins bien sur les manuels scannés ou en chinois traduit.'**
  String get gdtfWorkflowPdfBody;

  /// No description provided for @gdtfWorkflowManualTitle.
  ///
  /// In fr, this message translates to:
  /// **'Ajout / correction manuels'**
  String get gdtfWorkflowManualTitle;

  /// No description provided for @gdtfWorkflowManualBody.
  ///
  /// In fr, this message translates to:
  /// **'Quand l\'IA a terminé l\'analyse, tu arrives sur la page de sélection des modes. Le bouton « Ajouter un mode manuellement » est TOUJOURS dispo en haut de la liste. Sers-t\'en pour : (a) ajouter un mode que l\'IA a oublié, (b) supprimer une hallucination via la poubelle, (c) corriger un compte de canaux erroné (poubelle + réajout au bon nombre). C\'est ta dernière ligne de défense avant la génération du GDTF — vérifie toujours.'**
  String get gdtfWorkflowManualBody;

  /// No description provided for @gdtfWorkflowTip.
  ///
  /// In fr, this message translates to:
  /// **'Astuce : avant d\'extraire un PDF, vérifie toujours sur gdtf-share — ça t\'évite l\'extraction IA (plus longue et moins fiable) quand un GDTF officiel existe déjà. Et souviens-toi : nom de machine et noms de modes doivent être les exacts du manuel — l\'IA en dépend !'**
  String get gdtfWorkflowTip;

  /// No description provided for @gdtfUnderstood.
  ///
  /// In fr, this message translates to:
  /// **'Compris'**
  String get gdtfUnderstood;

  /// No description provided for @gdtfWorkflowSearchShortBody.
  ///
  /// In fr, this message translates to:
  /// **'Tape le nom de la fixture ci-dessus. Base GDTF Share (6000+ fixtures officielles). C\'est gratuit, instantané, validé fabricant. Résout 90% des cas.'**
  String get gdtfWorkflowSearchShortBody;

  /// No description provided for @gdtfWorkflowPdfShortBody.
  ///
  /// In fr, this message translates to:
  /// **'Pas trouvé ? Onglet « Générer depuis PDF ». Upload le manuel — l\'IA extrait les modes DMX. Marche mieux sur les PDFs propres.'**
  String get gdtfWorkflowPdfShortBody;

  /// No description provided for @gdtfWorkflowManualShortBody.
  ///
  /// In fr, this message translates to:
  /// **'Sur la page des modes, vérifie toujours ce que l\'IA a sorti. Tu peux : ajouter un mode oublié, supprimer une hallucination (icône poubelle), ou corriger un compte de canaux faux (supprimer + réajouter à la bonne valeur). L\'IA est rapide mais pas infaillible — tu restes maître de la liste finale.'**
  String get gdtfWorkflowManualShortBody;

  /// No description provided for @gdtfAddModeManually.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter un mode manuellement'**
  String get gdtfAddModeManually;

  /// No description provided for @gdtfNoModeDetectedAutomatically.
  ///
  /// In fr, this message translates to:
  /// **'Aucun mode détecté automatiquement.'**
  String get gdtfNoModeDetectedAutomatically;

  /// No description provided for @gdtfNoModeDetectedHelp.
  ///
  /// In fr, this message translates to:
  /// **'Le PDF est probablement scanné ou avec une mise en page complexe. Ajoute les modes manuellement avec le bouton ci-dessus, et l\'extraction des canaux se fera ensuite sur le texte OCR / extrait du manuel.'**
  String get gdtfNoModeDetectedHelp;

  /// No description provided for @gdtfAddMode.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter un mode'**
  String get gdtfAddMode;

  /// No description provided for @gdtfDeleteModeTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer ce mode'**
  String get gdtfDeleteModeTooltip;

  /// No description provided for @audioHomeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Son'**
  String get audioHomeTitle;

  /// No description provided for @audioHomeSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Sub cardioïde, end-fire, délais, SPL et outils pour l’ingénieur du son.'**
  String get audioHomeSubtitle;

  /// No description provided for @homeRfTitle.
  ///
  /// In fr, this message translates to:
  /// **'RF & Sans-fil'**
  String get homeRfTitle;

  /// No description provided for @homeRfSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'WiFi 2.4/5 GHz, coexistence, bandes UHF/VHF, calculateur d’antenne.'**
  String get homeRfSubtitle;

  /// No description provided for @homeCinemaTitle.
  ///
  /// In fr, this message translates to:
  /// **'Cinéma / Film'**
  String get homeCinemaTitle;

  /// No description provided for @homeCinemaSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Optique, cadrage, exposition, timecode, stockage et projection cinéma.'**
  String get homeCinemaSubtitle;

  /// No description provided for @audioSectionPlacementDirectivity.
  ///
  /// In fr, this message translates to:
  /// **'Placement & Directivité'**
  String get audioSectionPlacementDirectivity;

  /// No description provided for @audioSectionAcousticLevels.
  ///
  /// In fr, this message translates to:
  /// **'Acoustique & Niveaux'**
  String get audioSectionAcousticLevels;

  /// No description provided for @audioSectionAmpCabling.
  ///
  /// In fr, this message translates to:
  /// **'Ampli & Câblage'**
  String get audioSectionAmpCabling;

  /// No description provided for @audioSectionTimingAlignment.
  ///
  /// In fr, this message translates to:
  /// **'Timing & Alignement'**
  String get audioSectionTimingAlignment;

  /// No description provided for @audioSubCardioidTitle.
  ///
  /// In fr, this message translates to:
  /// **'Sub Cardioïde'**
  String get audioSubCardioidTitle;

  /// No description provided for @audioSubCardioidSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Délais pour configuration cardioïde (2 subs) ou end-fire (N subs en ligne). Annulation arrière, renforcement frontal.'**
  String get audioSubCardioidSubtitle;

  /// No description provided for @audioSplDistanceTitle.
  ///
  /// In fr, this message translates to:
  /// **'SPL & Distance'**
  String get audioSplDistanceTitle;

  /// No description provided for @audioSplDistanceSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Loi du carré inverse : SPL selon la distance. Calcul depuis puissance + sensibilité enceinte.'**
  String get audioSplDistanceSubtitle;

  /// No description provided for @audioSplSumTitle.
  ///
  /// In fr, this message translates to:
  /// **'Addition de Sources SPL'**
  String get audioSplSumTitle;

  /// No description provided for @audioSplSumSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'N sources incohérentes : +10·log(N) dB. Ou addition de 2 sources différentes.'**
  String get audioSplSumSubtitle;

  /// No description provided for @audioElectroacousticTitle.
  ///
  /// In fr, this message translates to:
  /// **'Électroacoustique'**
  String get audioElectroacousticTitle;

  /// No description provided for @audioElectroacousticSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'SPL depuis sensibilité enceinte + puissance. Table distances. Couplage cohérent/incohérent.'**
  String get audioElectroacousticSubtitle;

  /// No description provided for @audioWavelengthTitle.
  ///
  /// In fr, this message translates to:
  /// **'Fréquence & Longueur d’onde'**
  String get audioWavelengthTitle;

  /// No description provided for @audioWavelengthSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Conversion Hz ↔ λ (m), λ/4, λ/2. Tableau du spectre audio par bandes.'**
  String get audioWavelengthSubtitle;

  /// No description provided for @audioAmpLoadTitle.
  ///
  /// In fr, this message translates to:
  /// **'Charge Ampli / Enceintes'**
  String get audioAmpLoadTitle;

  /// No description provided for @audioCrossoverTitle.
  ///
  /// In fr, this message translates to:
  /// **'Fréquence de Coupure / Crossover'**
  String get audioCrossoverTitle;

  /// No description provided for @audioRt60Title.
  ///
  /// In fr, this message translates to:
  /// **'Temps de Réverbération (RT60)'**
  String get audioRt60Title;

  /// No description provided for @audioRt60LengthLabel.
  ///
  /// In fr, this message translates to:
  /// **'Longueur'**
  String get audioRt60LengthLabel;

  /// No description provided for @audioRt60WidthLabel.
  ///
  /// In fr, this message translates to:
  /// **'Largeur'**
  String get audioRt60WidthLabel;

  /// No description provided for @audioRt60HeightLabel.
  ///
  /// In fr, this message translates to:
  /// **'Hauteur'**
  String get audioRt60HeightLabel;

  /// No description provided for @audioRt60AbsorptionLabel.
  ///
  /// In fr, this message translates to:
  /// **'Coefficient d\'absorption moyen (α)'**
  String get audioRt60AbsorptionLabel;

  /// No description provided for @audioRt60PresetHard.
  ///
  /// In fr, this message translates to:
  /// **'Très réverbérant (béton, verre)'**
  String get audioRt60PresetHard;

  /// No description provided for @audioRt60PresetMedium.
  ///
  /// In fr, this message translates to:
  /// **'Salle moyenne (bureaux, bois)'**
  String get audioRt60PresetMedium;

  /// No description provided for @audioRt60PresetTreated.
  ///
  /// In fr, this message translates to:
  /// **'Salle traitée (rideaux, moquette)'**
  String get audioRt60PresetTreated;

  /// No description provided for @audioRt60PresetAbsorbent.
  ///
  /// In fr, this message translates to:
  /// **'Très absorbant (studio traité)'**
  String get audioRt60PresetAbsorbent;

  /// No description provided for @audioRt60ResultTitle.
  ///
  /// In fr, this message translates to:
  /// **'RT60 estimé'**
  String get audioRt60ResultTitle;

  /// No description provided for @audioRt60VolumeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Volume de la salle'**
  String get audioRt60VolumeLabel;

  /// No description provided for @audioRt60SurfaceLabel.
  ///
  /// In fr, this message translates to:
  /// **'Surface totale'**
  String get audioRt60SurfaceLabel;

  /// No description provided for @audioRt60QualLive.
  ///
  /// In fr, this message translates to:
  /// **'Très réverbérant'**
  String get audioRt60QualLive;

  /// No description provided for @audioRt60QualComfortable.
  ///
  /// In fr, this message translates to:
  /// **'Confortable pour la voix'**
  String get audioRt60QualComfortable;

  /// No description provided for @audioRt60QualDry.
  ///
  /// In fr, this message translates to:
  /// **'Sec / contrôlé'**
  String get audioRt60QualDry;

  /// No description provided for @audioRt60FormulaNote.
  ///
  /// In fr, this message translates to:
  /// **'RT60 = 0,161 × V / (α × S) — formule de Sabine, estimation avec absorption moyenne uniforme'**
  String get audioRt60FormulaNote;

  /// No description provided for @audioSplMeterTitle.
  ///
  /// In fr, this message translates to:
  /// **'Sonomètre'**
  String get audioSplMeterTitle;

  /// No description provided for @audioDelayTimeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Temps de Delay (BPM)'**
  String get audioDelayTimeTitle;

  /// No description provided for @audioDelayTimeBpmLabel.
  ///
  /// In fr, this message translates to:
  /// **'BPM'**
  String get audioDelayTimeBpmLabel;

  /// No description provided for @audioDelayTimeResultsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Temps par division'**
  String get audioDelayTimeResultsTitle;

  /// No description provided for @audioDelayTimeEmptyState.
  ///
  /// In fr, this message translates to:
  /// **'Entre un BPM pour calculer les temps de delay.'**
  String get audioDelayTimeEmptyState;

  /// No description provided for @audioDelayTimeNormalLabel.
  ///
  /// In fr, this message translates to:
  /// **'Normale'**
  String get audioDelayTimeNormalLabel;

  /// No description provided for @audioDelayTimeDottedLabel.
  ///
  /// In fr, this message translates to:
  /// **'Pointée'**
  String get audioDelayTimeDottedLabel;

  /// No description provided for @audioDelayTimeTripletLabel.
  ///
  /// In fr, this message translates to:
  /// **'Triolet'**
  String get audioDelayTimeTripletLabel;

  /// No description provided for @audioDelayTimeFormulaNote.
  ///
  /// In fr, this message translates to:
  /// **'Temps (ms) = 60000 / BPM × fraction de la noire. Pointée ×1,5 · Triolet ×2/3.'**
  String get audioDelayTimeFormulaNote;

  /// No description provided for @audioSplMeterPermissionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Accès au microphone requis'**
  String get audioSplMeterPermissionTitle;

  /// No description provided for @audioSplMeterPermissionBody.
  ///
  /// In fr, this message translates to:
  /// **'Le sonomètre utilise le microphone du téléphone pour estimer le niveau sonore ambiant en temps réel.'**
  String get audioSplMeterPermissionBody;

  /// No description provided for @audioSplMeterAllowMic.
  ///
  /// In fr, this message translates to:
  /// **'Autoriser le micro'**
  String get audioSplMeterAllowMic;

  /// No description provided for @audioSplMeterOpenSettings.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrir les réglages'**
  String get audioSplMeterOpenSettings;

  /// No description provided for @audioSplMeterLiveTitle.
  ///
  /// In fr, this message translates to:
  /// **'Niveau en direct'**
  String get audioSplMeterLiveTitle;

  /// No description provided for @audioSplMeterStartHint.
  ///
  /// In fr, this message translates to:
  /// **'Toucher pour démarrer'**
  String get audioSplMeterStartHint;

  /// No description provided for @audioSplMeterStopHint.
  ///
  /// In fr, this message translates to:
  /// **'Toucher pour arrêter'**
  String get audioSplMeterStopHint;

  /// No description provided for @audioSplMeterStatsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Statistiques de la session'**
  String get audioSplMeterStatsTitle;

  /// No description provided for @audioSplMeterStatsEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Démarre une mesure pour voir les statistiques min/moy/max.'**
  String get audioSplMeterStatsEmpty;

  /// No description provided for @audioSplMeterMinLabel.
  ///
  /// In fr, this message translates to:
  /// **'Minimum'**
  String get audioSplMeterMinLabel;

  /// No description provided for @audioSplMeterAvgLabel.
  ///
  /// In fr, this message translates to:
  /// **'Moyenne'**
  String get audioSplMeterAvgLabel;

  /// No description provided for @audioSplMeterMaxLabel.
  ///
  /// In fr, this message translates to:
  /// **'Maximum'**
  String get audioSplMeterMaxLabel;

  /// No description provided for @audioSplMeterReferenceTitle.
  ///
  /// In fr, this message translates to:
  /// **'Repères de niveaux sonores'**
  String get audioSplMeterReferenceTitle;

  /// No description provided for @audioSplMeterRefQuiet.
  ///
  /// In fr, this message translates to:
  /// **'Pièce calme'**
  String get audioSplMeterRefQuiet;

  /// No description provided for @audioSplMeterRefConversation.
  ///
  /// In fr, this message translates to:
  /// **'Conversation normale'**
  String get audioSplMeterRefConversation;

  /// No description provided for @audioSplMeterRefTraffic.
  ///
  /// In fr, this message translates to:
  /// **'Circulation urbaine'**
  String get audioSplMeterRefTraffic;

  /// No description provided for @audioSplMeterRefConcert.
  ///
  /// In fr, this message translates to:
  /// **'Concert / salle amplifiée'**
  String get audioSplMeterRefConcert;

  /// No description provided for @audioSplMeterRefPain.
  ///
  /// In fr, this message translates to:
  /// **'Seuil de douleur'**
  String get audioSplMeterRefPain;

  /// No description provided for @audioSplMeterDisclaimer.
  ///
  /// In fr, this message translates to:
  /// **'Mesure indicative via le micro du téléphone (non calibré) — ne remplace pas un sonomètre certifié IEC 61672.'**
  String get audioSplMeterDisclaimer;

  /// No description provided for @audioCrossoverFreqLabel.
  ///
  /// In fr, this message translates to:
  /// **'Fréquence de coupure'**
  String get audioCrossoverFreqLabel;

  /// No description provided for @audioCrossoverImpedanceLabel.
  ///
  /// In fr, this message translates to:
  /// **'Impédance du haut-parleur'**
  String get audioCrossoverImpedanceLabel;

  /// No description provided for @audioCrossoverCapacitorLabel.
  ///
  /// In fr, this message translates to:
  /// **'Condensateur (passe-haut)'**
  String get audioCrossoverCapacitorLabel;

  /// No description provided for @audioCrossoverInductorLabel.
  ///
  /// In fr, this message translates to:
  /// **'Bobine (passe-bas)'**
  String get audioCrossoverInductorLabel;

  /// No description provided for @audioCrossoverOrderNote.
  ///
  /// In fr, this message translates to:
  /// **'Filtre du 1er ordre (6 dB/octave)'**
  String get audioCrossoverOrderNote;

  /// No description provided for @audioCrossoverReferenceTitle.
  ///
  /// In fr, this message translates to:
  /// **'Repères de fréquences de coupure'**
  String get audioCrossoverReferenceTitle;

  /// No description provided for @audioCrossoverRefSubTop.
  ///
  /// In fr, this message translates to:
  /// **'Sub / Top'**
  String get audioCrossoverRefSubTop;

  /// No description provided for @audioCrossoverRef2Way.
  ///
  /// In fr, this message translates to:
  /// **'2 voies (LF/HF)'**
  String get audioCrossoverRef2Way;

  /// No description provided for @audioCrossoverRef3WayLow.
  ///
  /// In fr, this message translates to:
  /// **'3 voies — LF/MF'**
  String get audioCrossoverRef3WayLow;

  /// No description provided for @audioCrossoverRef3WayHigh.
  ///
  /// In fr, this message translates to:
  /// **'3 voies — MF/HF'**
  String get audioCrossoverRef3WayHigh;

  /// No description provided for @audioCrossoverFormulaNote.
  ///
  /// In fr, this message translates to:
  /// **'C = 1 / (2π·f·Z)    L = Z / (2π·f)'**
  String get audioCrossoverFormulaNote;

  /// No description provided for @audioAmpLoadSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Combien d’enceintes par voie d’ampli. Impédance résultante, puissance par enceinte.'**
  String get audioAmpLoadSubtitle;

  /// No description provided for @audioImpedanceTitle.
  ///
  /// In fr, this message translates to:
  /// **'Impédance Série / Parallèle'**
  String get audioImpedanceTitle;

  /// No description provided for @audioImpedanceModeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Mode de câblage'**
  String get audioImpedanceModeLabel;

  /// No description provided for @audioImpedanceModeSeries.
  ///
  /// In fr, this message translates to:
  /// **'Série'**
  String get audioImpedanceModeSeries;

  /// No description provided for @audioImpedanceModeParallel.
  ///
  /// In fr, this message translates to:
  /// **'Parallèle'**
  String get audioImpedanceModeParallel;

  /// No description provided for @audioImpedanceSpeakerLabel.
  ///
  /// In fr, this message translates to:
  /// **'Enceinte'**
  String get audioImpedanceSpeakerLabel;

  /// No description provided for @audioImpedanceAddSpeaker.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter une enceinte'**
  String get audioImpedanceAddSpeaker;

  /// No description provided for @audioImpedanceTotalTitle.
  ///
  /// In fr, this message translates to:
  /// **'Impédance totale'**
  String get audioImpedanceTotalTitle;

  /// No description provided for @audioImpedanceEmptyState.
  ///
  /// In fr, this message translates to:
  /// **'Entre au moins une impédance pour calculer le total.'**
  String get audioImpedanceEmptyState;

  /// No description provided for @audioImpedanceWarningLow.
  ///
  /// In fr, this message translates to:
  /// **'Impédance basse : vérifie que ton ampli supporte cette charge (souvent 2 Ω minimum).'**
  String get audioImpedanceWarningLow;

  /// No description provided for @audioImpedanceFormulaNote.
  ///
  /// In fr, this message translates to:
  /// **'Série : Zt = Z1 + Z2 + …    Parallèle : 1/Zt = 1/Z1 + 1/Z2 + …'**
  String get audioImpedanceFormulaNote;

  /// No description provided for @audioLevelsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Niveaux & Câbles'**
  String get audioLevelsTitle;

  /// No description provided for @audioLevelsSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Convertisseur dBu / dBV / V rms. Niveaux de référence −10 dBV, +4 dBu, +18 dBu.'**
  String get audioLevelsSubtitle;

  /// No description provided for @audioDelayDistanceTitle.
  ///
  /// In fr, this message translates to:
  /// **'Délai de Distance'**
  String get audioDelayDistanceTitle;

  /// No description provided for @audioDelayDistanceSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Distance → ms pour aligner delay stacks, fills ou diffusion distribuée. Multi-points.'**
  String get audioDelayDistanceSubtitle;

  /// No description provided for @subscriptionCategorySonRfShort.
  ///
  /// In fr, this message translates to:
  /// **'SON & RF'**
  String get subscriptionCategorySonRfShort;

  /// No description provided for @subscriptionProShort.
  ///
  /// In fr, this message translates to:
  /// **'PRO'**
  String get subscriptionProShort;

  /// No description provided for @audioConditions.
  ///
  /// In fr, this message translates to:
  /// **'Conditions'**
  String get audioConditions;

  /// No description provided for @audioAmbientTemperature.
  ///
  /// In fr, this message translates to:
  /// **'Température ambiante'**
  String get audioAmbientTemperature;

  /// No description provided for @audioSpeedOfSound.
  ///
  /// In fr, this message translates to:
  /// **'Vitesse du son'**
  String get audioSpeedOfSound;

  /// No description provided for @audioListeningPoints.
  ///
  /// In fr, this message translates to:
  /// **'Points d’écoute'**
  String get audioListeningPoints;

  /// No description provided for @audioDistancePoint.
  ///
  /// In fr, this message translates to:
  /// **'Distance point {index}'**
  String audioDistancePoint(int index);

  /// No description provided for @audioAddPoint.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter un point'**
  String get audioAddPoint;

  /// No description provided for @audioCalculatedDelays.
  ///
  /// In fr, this message translates to:
  /// **'Délais calculés'**
  String get audioCalculatedDelays;

  /// No description provided for @audioTypicalUseCases.
  ///
  /// In fr, this message translates to:
  /// **'Cas d’usage typiques'**
  String get audioTypicalUseCases;

  /// No description provided for @audioDelayStackFillsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Delay stack / fills'**
  String get audioDelayStackFillsTitle;

  /// No description provided for @audioDelayStackFillsText.
  ///
  /// In fr, this message translates to:
  /// **'Mesurez la distance entre le main system et le delay tower. Appliquez ce délai au delay tower pour l’aligner avec les mains.'**
  String get audioDelayStackFillsText;

  /// No description provided for @audioDistributedSoundTitle.
  ///
  /// In fr, this message translates to:
  /// **'Diffusion distribuée'**
  String get audioDistributedSoundTitle;

  /// No description provided for @audioDistributedSoundText.
  ///
  /// In fr, this message translates to:
  /// **'Pour chaque zone de haut-parleurs, mesurez la distance depuis le système de référence et appliquez le délai correspondant.'**
  String get audioDistributedSoundText;

  /// No description provided for @audioRoomFillTitle.
  ///
  /// In fr, this message translates to:
  /// **'Remplissage de salle'**
  String get audioRoomFillTitle;

  /// No description provided for @audioRoomFillText.
  ///
  /// In fr, this message translates to:
  /// **'Les enceintes proches du public sont retardées par rapport au son de la scène pour éviter la perception de double-source.'**
  String get audioRoomFillText;

  /// No description provided for @audioDelayNote.
  ///
  /// In fr, this message translates to:
  /// **'Le délai calculé correspond à la propagation acoustique en air libre.\nAjustez finement à l’oreille ou avec un analyseur de phase.'**
  String get audioDelayNote;

  /// No description provided for @audioFromSpeakerSensitivity.
  ///
  /// In fr, this message translates to:
  /// **'SPL depuis sensibilité enceinte'**
  String get audioFromSpeakerSensitivity;

  /// No description provided for @audioSensitivity.
  ///
  /// In fr, this message translates to:
  /// **'Sensibilité'**
  String get audioSensitivity;

  /// No description provided for @audioAmpPower.
  ///
  /// In fr, this message translates to:
  /// **'Puissance ampli'**
  String get audioAmpPower;

  /// No description provided for @audioMeasurementDistance.
  ///
  /// In fr, this message translates to:
  /// **'Distance de mesure'**
  String get audioMeasurementDistance;

  /// No description provided for @audioTypicalSensitivities.
  ///
  /// In fr, this message translates to:
  /// **'Sensibilités typiques'**
  String get audioTypicalSensitivities;

  /// No description provided for @audioSourceCoupling.
  ///
  /// In fr, this message translates to:
  /// **'Couplage de sources'**
  String get audioSourceCoupling;

  /// No description provided for @audioSourceCouplingIntro.
  ///
  /// In fr, this message translates to:
  /// **'En ajoutant des sources identiques côte à côte, le gain dépend du type de couplage :'**
  String get audioSourceCouplingIntro;

  /// No description provided for @audioSourcesCount.
  ///
  /// In fr, this message translates to:
  /// **'{count} sources'**
  String audioSourcesCount(int count);

  /// No description provided for @audioPracticalRules.
  ///
  /// In fr, this message translates to:
  /// **'Règles pratiques'**
  String get audioPracticalRules;

  /// No description provided for @audioRuleDoubleDistance.
  ///
  /// In fr, this message translates to:
  /// **'Doubler la distance = −6 dB (champ libre). Dans une salle, l’atténuation est moindre grâce aux réflexions.'**
  String get audioRuleDoubleDistance;

  /// No description provided for @audioRuleDoublePower.
  ///
  /// In fr, this message translates to:
  /// **'Doubler la puissance = +3 dB. Multiplier par 10 = +10 dB. Il faut ×100 la puissance pour gagner +20 dB.'**
  String get audioRuleDoublePower;

  /// No description provided for @audioRuleCoupling.
  ///
  /// In fr, this message translates to:
  /// **'Couplage cohérent (sources en phase, dos à dos) : +6 dB par doublement. Couplage incohérent : +3 dB.'**
  String get audioRuleCoupling;

  /// No description provided for @audioRuleSafety.
  ///
  /// In fr, this message translates to:
  /// **'Seuil de douleur ≈ 120 dB SPL. Risque auditif à partir de 85 dB (8h) selon NIOSH. Chaque +3 dB divise le temps d’exposition par 2.'**
  String get audioRuleSafety;

  /// No description provided for @audioDistance.
  ///
  /// In fr, this message translates to:
  /// **'Distance'**
  String get audioDistance;

  /// No description provided for @audioSpl.
  ///
  /// In fr, this message translates to:
  /// **'SPL'**
  String get audioSpl;

  /// No description provided for @audioIncoherent.
  ///
  /// In fr, this message translates to:
  /// **'Incohérent'**
  String get audioIncoherent;

  /// No description provided for @audioCoherent.
  ///
  /// In fr, this message translates to:
  /// **'Cohérent'**
  String get audioCoherent;

  /// No description provided for @audioIncoherentSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Sources décalées\nou non-synchronisées'**
  String get audioIncoherentSubtitle;

  /// No description provided for @audioCoherentSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Sources en phase\nalignées'**
  String get audioCoherentSubtitle;

  /// No description provided for @audioLevelConverter.
  ///
  /// In fr, this message translates to:
  /// **'Convertisseur de niveaux'**
  String get audioLevelConverter;

  /// No description provided for @audioReferenceLevels.
  ///
  /// In fr, this message translates to:
  /// **'Niveaux de référence'**
  String get audioReferenceLevels;

  /// No description provided for @audioGainStagingRules.
  ///
  /// In fr, this message translates to:
  /// **'Gain staging — règles pratiques'**
  String get audioGainStagingRules;

  /// No description provided for @audioAmplifierPerChannel.
  ///
  /// In fr, this message translates to:
  /// **'AMPLIFICATEUR — par voie'**
  String get audioAmplifierPerChannel;

  /// No description provided for @audioMinimumImpedance.
  ///
  /// In fr, this message translates to:
  /// **'Z min (Ω)'**
  String get audioMinimumImpedance;

  /// No description provided for @audioPowerW.
  ///
  /// In fr, this message translates to:
  /// **'Puissance (W)'**
  String get audioPowerW;

  /// No description provided for @audioAtOhm.
  ///
  /// In fr, this message translates to:
  /// **'à (Ω)'**
  String get audioAtOhm;

  /// No description provided for @audioSpeaker.
  ///
  /// In fr, this message translates to:
  /// **'ENCEINTE'**
  String get audioSpeaker;

  /// No description provided for @audioNominalImpedance.
  ///
  /// In fr, this message translates to:
  /// **'Z nominale (Ω)'**
  String get audioNominalImpedance;

  /// No description provided for @audioContinuousPower.
  ///
  /// In fr, this message translates to:
  /// **'P continue (W)'**
  String get audioContinuousPower;

  /// No description provided for @audioParallelConnection.
  ///
  /// In fr, this message translates to:
  /// **'BRANCHEMENT PARALLÈLE'**
  String get audioParallelConnection;

  /// No description provided for @audioLoadImpedance.
  ///
  /// In fr, this message translates to:
  /// **'Z charge'**
  String get audioLoadImpedance;

  /// No description provided for @audioPowerPerSpeaker.
  ///
  /// In fr, this message translates to:
  /// **'P / enc.'**
  String get audioPowerPerSpeaker;

  /// No description provided for @audioStatus.
  ///
  /// In fr, this message translates to:
  /// **'Statut'**
  String get audioStatus;

  /// No description provided for @audioTooLowImpedance.
  ///
  /// In fr, this message translates to:
  /// **'✗  Z trop basse (−{diff} Ω)'**
  String audioTooLowImpedance(String diff);

  /// No description provided for @audioExceedsContinuousPower.
  ///
  /// In fr, this message translates to:
  /// **'⚠  Dépasse P continue'**
  String get audioExceedsContinuousPower;

  /// No description provided for @audioNearLimit.
  ///
  /// In fr, this message translates to:
  /// **'⚠  Proche limite (>{percent}%)'**
  String audioNearLimit(int percent);

  /// No description provided for @audioOkContinuousPower.
  ///
  /// In fr, this message translates to:
  /// **'✓  OK  ({percent}% P cont.)'**
  String audioOkContinuousPower(int percent);

  /// No description provided for @audioAmpLoadNote.
  ///
  /// In fr, this message translates to:
  /// **'Calcul basé sur les puissances publiées par le fabricant de l’ampli à chaque impédance (interpolées). La puissance de la voie est partagée entre les N enceintes en parallèle. Une marge ×1,5 à ×2 sur la tenue RMS/AES est courante si un limiteur est réglé. Valeurs issues des fiches techniques : vérifiez toujours avec les presets et recommandations du fabricant.'**
  String get audioAmpLoadNote;

  /// No description provided for @audioConfiguration.
  ///
  /// In fr, this message translates to:
  /// **'Configuration'**
  String get audioConfiguration;

  /// No description provided for @audioParameters.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres'**
  String get audioParameters;

  /// No description provided for @audioSubDistance.
  ///
  /// In fr, this message translates to:
  /// **'Distance entre subs'**
  String get audioSubDistance;

  /// No description provided for @audioSubCount.
  ///
  /// In fr, this message translates to:
  /// **'Nombre de subs'**
  String get audioSubCount;

  /// No description provided for @audioCardioid2Subs.
  ///
  /// In fr, this message translates to:
  /// **'Cardioïde — 2 subs'**
  String get audioCardioid2Subs;

  /// No description provided for @audioCardioid2SubsDescription.
  ///
  /// In fr, this message translates to:
  /// **'1 sub normal + 1 sub retourné avec délai'**
  String get audioCardioid2SubsDescription;

  /// No description provided for @audioEndFireNSubs.
  ///
  /// In fr, this message translates to:
  /// **'End-fire — N subs en ligne'**
  String get audioEndFireNSubs;

  /// No description provided for @audioEndFireNSubsDescription.
  ///
  /// In fr, this message translates to:
  /// **'Tous face avant, délais décalés par rang'**
  String get audioEndFireNSubsDescription;

  /// No description provided for @audioResults.
  ///
  /// In fr, this message translates to:
  /// **'Résultats'**
  String get audioResults;

  /// No description provided for @audioEnterDistanceToCalculate.
  ///
  /// In fr, this message translates to:
  /// **'Saisissez une distance pour calculer'**
  String get audioEnterDistanceToCalculate;

  /// No description provided for @audioDelayToApply.
  ///
  /// In fr, this message translates to:
  /// **'Délai à appliquer'**
  String get audioDelayToApply;

  /// No description provided for @audioRearSubDelaySublabel.
  ///
  /// In fr, this message translates to:
  /// **'sur le sub retourné (arrière)'**
  String get audioRearSubDelaySublabel;

  /// No description provided for @audioOptimalFrequency.
  ///
  /// In fr, this message translates to:
  /// **'Fréquence optimale'**
  String get audioOptimalFrequency;

  /// No description provided for @audioFrontSub.
  ///
  /// In fr, this message translates to:
  /// **'Sub avant'**
  String get audioFrontSub;

  /// No description provided for @audioRearSubReversed.
  ///
  /// In fr, this message translates to:
  /// **'Sub arrière (retourné)'**
  String get audioRearSubReversed;

  /// No description provided for @audioNormalPolarity.
  ///
  /// In fr, this message translates to:
  /// **'Normal ✓'**
  String get audioNormalPolarity;

  /// No description provided for @audioInvertedPolarity.
  ///
  /// In fr, this message translates to:
  /// **'Inversée 🔄'**
  String get audioInvertedPolarity;

  /// No description provided for @audioDelayBetweenRows.
  ///
  /// In fr, this message translates to:
  /// **'Délai entre chaque rang'**
  String get audioDelayBetweenRows;

  /// No description provided for @audioMaxDelayRearSub.
  ///
  /// In fr, this message translates to:
  /// **'Délai max (sub arrière)'**
  String get audioMaxDelayRearSub;

  /// No description provided for @audioFrontReferenceSub.
  ///
  /// In fr, this message translates to:
  /// **'Sub avant (référence)'**
  String get audioFrontReferenceSub;

  /// No description provided for @audioSubNumber.
  ///
  /// In fr, this message translates to:
  /// **'Sub {index}'**
  String audioSubNumber(int index);

  /// No description provided for @audioEndFireReferenceNote.
  ///
  /// In fr, this message translates to:
  /// **'→ Le sub 1 (avant) est la référence. Les subs suivants ont un délai croissant.'**
  String get audioEndFireReferenceNote;

  /// No description provided for @audioHowTo.
  ///
  /// In fr, this message translates to:
  /// **'Comment faire ?'**
  String get audioHowTo;

  /// No description provided for @audioCardioidStep1.
  ///
  /// In fr, this message translates to:
  /// **'Placez le sub A face au public (position normale).'**
  String get audioCardioidStep1;

  /// No description provided for @audioCardioidStep2.
  ///
  /// In fr, this message translates to:
  /// **'Placez le sub B juste derrière, physiquement retourné face à l’arrière de la scène.'**
  String get audioCardioidStep2;

  /// No description provided for @audioCardioidStep3.
  ///
  /// In fr, this message translates to:
  /// **'Dans votre processeur ou console, inversez la polarité du sub B (bouton Ø / Phase).'**
  String get audioCardioidStep3;

  /// No description provided for @audioCardioidStep4.
  ///
  /// In fr, this message translates to:
  /// **'Appliquez le délai calculé au sub B. Ne retardez pas le sub A.'**
  String get audioCardioidStep4;

  /// No description provided for @audioCardioidStep5.
  ///
  /// In fr, this message translates to:
  /// **'Vérifiez l’annulation arrière avec un micro de mesure ou en marchant derrière l’array.'**
  String get audioCardioidStep5;

  /// No description provided for @audioCardioidTip.
  ///
  /// In fr, this message translates to:
  /// **'💡 La distance idéale entre les subs correspond à λ/4 de la fréquence centrale du sub (ex. 90 Hz → ~0.95 m à 20 °C). Ajustez pour trouver le meilleur compromis entre annulation et puissance.'**
  String get audioCardioidTip;

  /// No description provided for @audioEndFireStep1.
  ///
  /// In fr, this message translates to:
  /// **'Alignez tous les subs en ligne, tous face au public, avec la même distance d entre chaque.'**
  String get audioEndFireStep1;

  /// No description provided for @audioEndFireStep2.
  ///
  /// In fr, this message translates to:
  /// **'Le sub le plus en avant (sub 1) est la référence : délai = 0.'**
  String get audioEndFireStep2;

  /// No description provided for @audioEndFireStep3.
  ///
  /// In fr, this message translates to:
  /// **'Appliquez un délai croissant à chaque rang suivant (sub 2 → 1×délai, sub 3 → 2×délai, etc.).'**
  String get audioEndFireStep3;

  /// No description provided for @audioEndFireStep4.
  ///
  /// In fr, this message translates to:
  /// **'Tous les subs gardent la même polarité (pas d’inversion).'**
  String get audioEndFireStep4;

  /// No description provided for @audioEndFireStep5.
  ///
  /// In fr, this message translates to:
  /// **'Mesurez à l’arrière pour vérifier l’atténuation.'**
  String get audioEndFireStep5;

  /// No description provided for @audioEndFireTip.
  ///
  /// In fr, this message translates to:
  /// **'💡 L’end-fire offre un gain de directivité légèrement inférieur au cardioïde classique, mais fonctionne avec plus de 2 subs et ne nécessite pas de retournement physique.'**
  String get audioEndFireTip;

  /// No description provided for @audioConversion.
  ///
  /// In fr, this message translates to:
  /// **'Conversion'**
  String get audioConversion;

  /// No description provided for @audioFrequency.
  ///
  /// In fr, this message translates to:
  /// **'Fréquence'**
  String get audioFrequency;

  /// No description provided for @audioWavelength.
  ///
  /// In fr, this message translates to:
  /// **'Longueur d’onde'**
  String get audioWavelength;

  /// No description provided for @audioResult.
  ///
  /// In fr, this message translates to:
  /// **'Résultat'**
  String get audioResult;

  /// No description provided for @audioEnterValueToCalculate.
  ///
  /// In fr, this message translates to:
  /// **'Saisissez une valeur pour calculer'**
  String get audioEnterValueToCalculate;

  /// No description provided for @audioWavelengthAt.
  ///
  /// In fr, this message translates to:
  /// **'Longueur d’onde à {frequency}'**
  String audioWavelengthAt(String frequency);

  /// No description provided for @audioFrequencyForLambda.
  ///
  /// In fr, this message translates to:
  /// **'Fréquence pour λ = {lambda} m'**
  String audioFrequencyForLambda(String lambda);

  /// No description provided for @audioHalfWave.
  ///
  /// In fr, this message translates to:
  /// **'λ/2 (demi-onde)'**
  String get audioHalfWave;

  /// No description provided for @audioQuarterWave.
  ///
  /// In fr, this message translates to:
  /// **'λ/4 (quart d’onde)'**
  String get audioQuarterWave;

  /// No description provided for @audioSpectrumMarkers.
  ///
  /// In fr, this message translates to:
  /// **'Spectre audio — repères'**
  String get audioSpectrumMarkers;

  /// No description provided for @audioWavelengthFormula.
  ///
  /// In fr, this message translates to:
  /// **'Formule : λ = v / f    |    v = 331,3 + 0,606 × T (°C)'**
  String get audioWavelengthFormula;

  /// No description provided for @audioHzToLambda.
  ///
  /// In fr, this message translates to:
  /// **'Hz → λ (m)'**
  String get audioHzToLambda;

  /// No description provided for @audioLambdaToHz.
  ///
  /// In fr, this message translates to:
  /// **'λ (m) → Hz'**
  String get audioLambdaToHz;

  /// No description provided for @audioSubBass.
  ///
  /// In fr, this message translates to:
  /// **'Sub-basses'**
  String get audioSubBass;

  /// No description provided for @audioBass.
  ///
  /// In fr, this message translates to:
  /// **'Basses'**
  String get audioBass;

  /// No description provided for @audioLowMid.
  ///
  /// In fr, this message translates to:
  /// **'Bas-médiums'**
  String get audioLowMid;

  /// No description provided for @audioMid.
  ///
  /// In fr, this message translates to:
  /// **'Médiums'**
  String get audioMid;

  /// No description provided for @audioHighMid.
  ///
  /// In fr, this message translates to:
  /// **'Hauts-médiums'**
  String get audioHighMid;

  /// No description provided for @audioTreble.
  ///
  /// In fr, this message translates to:
  /// **'Aigus'**
  String get audioTreble;

  /// No description provided for @audioIncoherentSources.
  ///
  /// In fr, this message translates to:
  /// **'Sources incohérentes'**
  String get audioIncoherentSources;

  /// No description provided for @audioIdenticalSources.
  ///
  /// In fr, this message translates to:
  /// **'N sources identiques'**
  String get audioIdenticalSources;

  /// No description provided for @audioSingleSourceSpl.
  ///
  /// In fr, this message translates to:
  /// **'SPL d’une source'**
  String get audioSingleSourceSpl;

  /// No description provided for @audioTotalSplSources.
  ///
  /// In fr, this message translates to:
  /// **'SPL total ({count} sources)'**
  String audioTotalSplSources(int count);

  /// No description provided for @audioTwoDifferentSources.
  ///
  /// In fr, this message translates to:
  /// **'2 sources différentes'**
  String get audioTwoDifferentSources;

  /// No description provided for @audioSourceA.
  ///
  /// In fr, this message translates to:
  /// **'Source A'**
  String get audioSourceA;

  /// No description provided for @audioSourceB.
  ///
  /// In fr, this message translates to:
  /// **'Source B'**
  String get audioSourceB;

  /// No description provided for @audioTotalSplAB.
  ///
  /// In fr, this message translates to:
  /// **'SPL total (A + B)'**
  String get audioTotalSplAB;

  /// No description provided for @audioDoublingReference.
  ///
  /// In fr, this message translates to:
  /// **'Référence — gain par doublement'**
  String get audioDoublingReference;

  /// No description provided for @audioIncoherentShort.
  ///
  /// In fr, this message translates to:
  /// **'Incoh. : '**
  String get audioIncoherentShort;

  /// No description provided for @audioCoherentShort.
  ///
  /// In fr, this message translates to:
  /// **'Cohér. : '**
  String get audioCoherentShort;

  /// No description provided for @audioCalculationMode.
  ///
  /// In fr, this message translates to:
  /// **'Mode de calcul'**
  String get audioCalculationMode;

  /// No description provided for @audioReferenceSpl.
  ///
  /// In fr, this message translates to:
  /// **'SPL de référence'**
  String get audioReferenceSpl;

  /// No description provided for @audioReferenceDistance.
  ///
  /// In fr, this message translates to:
  /// **'Distance de référence'**
  String get audioReferenceDistance;

  /// No description provided for @audioTargetDistance.
  ///
  /// In fr, this message translates to:
  /// **'Distance cible'**
  String get audioTargetDistance;

  /// No description provided for @audioEnterValuesToCalculate.
  ///
  /// In fr, this message translates to:
  /// **'Saisissez les valeurs pour calculer'**
  String get audioEnterValuesToCalculate;

  /// No description provided for @audioSplAtDistance.
  ///
  /// In fr, this message translates to:
  /// **'SPL à {distance} m'**
  String audioSplAtDistance(String distance);

  /// No description provided for @audioVariation.
  ///
  /// In fr, this message translates to:
  /// **'Variation'**
  String get audioVariation;

  /// No description provided for @audioListeningDistance.
  ///
  /// In fr, this message translates to:
  /// **'Distance d’écoute'**
  String get audioListeningDistance;

  /// No description provided for @audioMaxSplAt1m.
  ///
  /// In fr, this message translates to:
  /// **'SPL max à 1 m'**
  String get audioMaxSplAt1m;

  /// No description provided for @audioDistanceToSpl.
  ///
  /// In fr, this message translates to:
  /// **'Distance → SPL'**
  String get audioDistanceToSpl;

  /// No description provided for @audioPowerToSpl.
  ///
  /// In fr, this message translates to:
  /// **'Puissance → SPL'**
  String get audioPowerToSpl;

  /// No description provided for @audioSoundLevelReference.
  ///
  /// In fr, this message translates to:
  /// **'Référence niveaux sonores'**
  String get audioSoundLevelReference;

  /// No description provided for @audioSectionSafety.
  ///
  /// In fr, this message translates to:
  /// **'Sécurité auditive'**
  String get audioSectionSafety;

  /// No description provided for @audioNoiseDoseTitle.
  ///
  /// In fr, this message translates to:
  /// **'Dose sonore & temps d’exposition'**
  String get audioNoiseDoseTitle;

  /// No description provided for @audioNoiseDoseIntro.
  ///
  /// In fr, this message translates to:
  /// **'Chaque +3 dB divise par deux le temps d’exposition admissible (règle d’échange 3 dB). Entrez le niveau sonore mesuré ou prévu pour estimer le temps avant d’atteindre les seuils réglementaires d’exposition au bruit.'**
  String get audioNoiseDoseIntro;

  /// No description provided for @audioNoiseDoseLevelCardTitle.
  ///
  /// In fr, this message translates to:
  /// **'Niveau mesuré'**
  String get audioNoiseDoseLevelCardTitle;

  /// No description provided for @audioNoiseDoseLevelLabel.
  ///
  /// In fr, this message translates to:
  /// **'Niveau sonore'**
  String get audioNoiseDoseLevelLabel;

  /// No description provided for @audioNoiseDoseAllowedTimeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Temps admissible avant la dose'**
  String get audioNoiseDoseAllowedTimeTitle;

  /// No description provided for @audioNoiseDoseVaiLabel.
  ///
  /// In fr, this message translates to:
  /// **'Valeur d’action inférieure'**
  String get audioNoiseDoseVaiLabel;

  /// No description provided for @audioNoiseDoseVasLabel.
  ///
  /// In fr, this message translates to:
  /// **'Valeur d’action supérieure'**
  String get audioNoiseDoseVasLabel;

  /// No description provided for @audioNoiseDoseVleLabel.
  ///
  /// In fr, this message translates to:
  /// **'Valeur limite d’exposition'**
  String get audioNoiseDoseVleLabel;

  /// No description provided for @audioNoiseDoseUnlimited.
  ///
  /// In fr, this message translates to:
  /// **'≥ 8 h (pas de risque sur une journée)'**
  String get audioNoiseDoseUnlimited;

  /// No description provided for @audioNoiseDoseTableTitle.
  ///
  /// In fr, this message translates to:
  /// **'Repères — temps admissible par niveau'**
  String get audioNoiseDoseTableTitle;

  /// No description provided for @audioNoiseDoseTableLevelHeader.
  ///
  /// In fr, this message translates to:
  /// **'Niveau'**
  String get audioNoiseDoseTableLevelHeader;

  /// No description provided for @audioNoiseDoseTableTimeHeader.
  ///
  /// In fr, this message translates to:
  /// **'Temps admissible (VLE 87 dB)'**
  String get audioNoiseDoseTableTimeHeader;

  /// No description provided for @audioNoiseDoseVenueTitle.
  ///
  /// In fr, this message translates to:
  /// **'Seuils lieux de diffusion (décret spectacles)'**
  String get audioNoiseDoseVenueTitle;

  /// No description provided for @audioNoiseDoseVenueText.
  ///
  /// In fr, this message translates to:
  /// **'Le décret n°2017-1244 impose un niveau moyen LAeq sur 15 min ≤ 102 dB(A) (lieu non habituel) ou 105 dB(A) (lieu habituel), avec un niveau crête ≤ 118 ou 120 dB(C). Ces seuils s’appliquent au public, en continu, via un limiteur — ils sont distincts de l’exposition professionnelle calculée ci-dessus.'**
  String get audioNoiseDoseVenueText;

  /// No description provided for @audioNoiseDoseDisclaimer.
  ///
  /// In fr, this message translates to:
  /// **'Outil indicatif basé sur la règle d’échange 3 dB (Code du travail, art. R.4431-2). Ne remplace pas un sonomètre ou un dosimètre certifié, ni une mesure réglementaire sur site.'**
  String get audioNoiseDoseDisclaimer;

  /// No description provided for @audioSectionOrganization.
  ///
  /// In fr, this message translates to:
  /// **'Organisation'**
  String get audioSectionOrganization;

  /// No description provided for @audioInputListTitle.
  ///
  /// In fr, this message translates to:
  /// **'Liste d’inputs'**
  String get audioInputListTitle;

  /// No description provided for @audioInputListIntro.
  ///
  /// In fr, this message translates to:
  /// **'Construisez votre liste d’inputs micro/DI pour la balance ou la feuille de patch. L’ordre des lignes définit le numéro de canal — glissez pour réorganiser.'**
  String get audioInputListIntro;

  /// No description provided for @audioInputListEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucune entrée pour l’instant. Ajoutez la première ligne de votre liste d’inputs.'**
  String get audioInputListEmpty;

  /// No description provided for @audioInputListAddButton.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter une entrée'**
  String get audioInputListAddButton;

  /// No description provided for @audioInputListChannel.
  ///
  /// In fr, this message translates to:
  /// **'Canal {n}'**
  String audioInputListChannel(Object n);

  /// No description provided for @audioInputListNameLabel.
  ///
  /// In fr, this message translates to:
  /// **'Source'**
  String get audioInputListNameLabel;

  /// No description provided for @audioInputListPositionLabel.
  ///
  /// In fr, this message translates to:
  /// **'Position'**
  String get audioInputListPositionLabel;

  /// No description provided for @audioInputListNotesLabel.
  ///
  /// In fr, this message translates to:
  /// **'Notes'**
  String get audioInputListNotesLabel;

  /// No description provided for @audioInputListTypeMic.
  ///
  /// In fr, this message translates to:
  /// **'Micro'**
  String get audioInputListTypeMic;

  /// No description provided for @audioInputListTypeDi.
  ///
  /// In fr, this message translates to:
  /// **'DI'**
  String get audioInputListTypeDi;

  /// No description provided for @audioInputListTypeLine.
  ///
  /// In fr, this message translates to:
  /// **'Ligne'**
  String get audioInputListTypeLine;

  /// No description provided for @audioInputListTypeWireless.
  ///
  /// In fr, this message translates to:
  /// **'Sans-fil'**
  String get audioInputListTypeWireless;

  /// No description provided for @audioInputListTypeOther.
  ///
  /// In fr, this message translates to:
  /// **'Autre'**
  String get audioInputListTypeOther;

  /// No description provided for @audioInputListCopyAction.
  ///
  /// In fr, this message translates to:
  /// **'Copier la liste'**
  String get audioInputListCopyAction;

  /// No description provided for @audioInputListCopiedSnackbar.
  ///
  /// In fr, this message translates to:
  /// **'Liste copiée dans le presse-papiers'**
  String get audioInputListCopiedSnackbar;

  /// No description provided for @audioInputListClearAction.
  ///
  /// In fr, this message translates to:
  /// **'Tout effacer'**
  String get audioInputListClearAction;

  /// No description provided for @audioInputListClearConfirmTitle.
  ///
  /// In fr, this message translates to:
  /// **'Effacer toute la liste ?'**
  String get audioInputListClearConfirmTitle;

  /// No description provided for @audioInputListClearConfirmBody.
  ///
  /// In fr, this message translates to:
  /// **'Cette action supprime toutes les entrées de la liste d’inputs. Elle est irréversible.'**
  String get audioInputListClearConfirmBody;

  /// No description provided for @pluginCommunity.
  ///
  /// In fr, this message translates to:
  /// **'Plugin Community'**
  String get pluginCommunity;

  /// No description provided for @pluginCommunitySubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Partage et découvre des plugins grandMA3 créés par la communauté'**
  String get pluginCommunitySubtitle;

  /// No description provided for @pluginCommunitySubtitleAuth.
  ///
  /// In fr, this message translates to:
  /// **'Partage et découvre des plugins\ngrandMA3 créés par la communauté.'**
  String get pluginCommunitySubtitleAuth;

  /// No description provided for @continueWithGoogle.
  ///
  /// In fr, this message translates to:
  /// **'Continuer avec Google'**
  String get continueWithGoogle;

  /// No description provided for @authChoosePseudo.
  ///
  /// In fr, this message translates to:
  /// **'Choisis ton pseudo'**
  String get authChoosePseudo;

  /// No description provided for @authPseudoHint.
  ///
  /// In fr, this message translates to:
  /// **'Ton pseudo dans la communauté'**
  String get authPseudoHint;

  /// No description provided for @confirm.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer'**
  String get confirm;

  /// No description provided for @loginCancelled.
  ///
  /// In fr, this message translates to:
  /// **'Connexion annulée.'**
  String get loginCancelled;

  /// No description provided for @anonymous.
  ///
  /// In fr, this message translates to:
  /// **'Anonyme'**
  String get anonymous;

  /// No description provided for @share.
  ///
  /// In fr, this message translates to:
  /// **'Partager'**
  String get share;

  /// No description provided for @searchPluginHint.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher un plugin…'**
  String get searchPluginHint;

  /// No description provided for @allPluginsFilter.
  ///
  /// In fr, this message translates to:
  /// **'⭐ Tous'**
  String get allPluginsFilter;

  /// No description provided for @loginRequiredLike.
  ///
  /// In fr, this message translates to:
  /// **'Connecte-toi pour liker 👋'**
  String get loginRequiredLike;

  /// No description provided for @noPluginsYet.
  ///
  /// In fr, this message translates to:
  /// **'Aucun plugin ici encore.'**
  String get noPluginsYet;

  /// No description provided for @beFirstToShare.
  ///
  /// In fr, this message translates to:
  /// **'Sois le premier à partager !'**
  String get beFirstToShare;

  /// No description provided for @signOut.
  ///
  /// In fr, this message translates to:
  /// **'Se déconnecter'**
  String get signOut;

  /// No description provided for @luaCode.
  ///
  /// In fr, this message translates to:
  /// **'Code Lua'**
  String get luaCode;

  /// No description provided for @copied.
  ///
  /// In fr, this message translates to:
  /// **'Copié !'**
  String get copied;

  /// No description provided for @copyCode.
  ///
  /// In fr, this message translates to:
  /// **'Copier le code'**
  String get copyCode;

  /// No description provided for @pluginPublished.
  ///
  /// In fr, this message translates to:
  /// **'🚀 Plugin publié !'**
  String get pluginPublished;

  /// No description provided for @sharePlugin.
  ///
  /// In fr, this message translates to:
  /// **'Partager un plugin'**
  String get sharePlugin;

  /// No description provided for @pluginTitle.
  ///
  /// In fr, this message translates to:
  /// **'Titre du plugin'**
  String get pluginTitle;

  /// No description provided for @pluginTitleHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: Batch couleurs RGB — 30 presets'**
  String get pluginTitleHint;

  /// No description provided for @pluginTitleRequired.
  ///
  /// In fr, this message translates to:
  /// **'Titre requis'**
  String get pluginTitleRequired;

  /// No description provided for @category.
  ///
  /// In fr, this message translates to:
  /// **'Catégorie'**
  String get category;

  /// No description provided for @optionalDescription.
  ///
  /// In fr, this message translates to:
  /// **'Description (optionnel)'**
  String get optionalDescription;

  /// No description provided for @pluginDescriptionHint.
  ///
  /// In fr, this message translates to:
  /// **'Ce que fait le plugin, ce qu\'il demande à l\'utilisateur...'**
  String get pluginDescriptionHint;

  /// No description provided for @codeRequired.
  ///
  /// In fr, this message translates to:
  /// **'Code requis'**
  String get codeRequired;

  /// No description provided for @codeMustContainReturnMain.
  ///
  /// In fr, this message translates to:
  /// **'Le code doit contenir \"return main\"'**
  String get codeMustContainReturnMain;

  /// No description provided for @pluginTestedWarning.
  ///
  /// In fr, this message translates to:
  /// **'Assurez-vous que le plugin est testé dans MA3 avant de le partager.'**
  String get pluginTestedWarning;

  /// No description provided for @attachFiles.
  ///
  /// In fr, this message translates to:
  /// **'Joindre des fichiers'**
  String get attachFiles;

  /// No description provided for @addFiles.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter des fichiers (.lua, .xml…)'**
  String get addFiles;

  /// No description provided for @filesSelected.
  ///
  /// In fr, this message translates to:
  /// **'{count} fichier(s) sélectionné(s)'**
  String filesSelected(Object count);

  /// No description provided for @codeOptional.
  ///
  /// In fr, this message translates to:
  /// **'Coller le code (optionnel)'**
  String get codeOptional;

  /// No description provided for @codeOrFileRequired.
  ///
  /// In fr, this message translates to:
  /// **'Ajoute au moins un fichier ou colle le code'**
  String get codeOrFileRequired;

  /// No description provided for @downloadFile.
  ///
  /// In fr, this message translates to:
  /// **'Télécharger'**
  String get downloadFile;

  /// No description provided for @pluginFiles.
  ///
  /// In fr, this message translates to:
  /// **'Fichiers'**
  String get pluginFiles;

  /// No description provided for @uploadingFiles.
  ///
  /// In fr, this message translates to:
  /// **'Envoi des fichiers…'**
  String get uploadingFiles;

  /// No description provided for @publishPlugin.
  ///
  /// In fr, this message translates to:
  /// **'Publier le plugin'**
  String get publishPlugin;

  /// No description provided for @free.
  ///
  /// In fr, this message translates to:
  /// **'GRATUIT'**
  String get free;

  /// No description provided for @pro.
  ///
  /// In fr, this message translates to:
  /// **'PRO'**
  String get pro;

  /// No description provided for @console.
  ///
  /// In fr, this message translates to:
  /// **'Console'**
  String get console;

  /// No description provided for @pluginError.
  ///
  /// In fr, this message translates to:
  /// **'Erreur : {error}'**
  String pluginError(Object error);

  /// No description provided for @pluginCategory_all.
  ///
  /// In fr, this message translates to:
  /// **'Tous'**
  String get pluginCategory_all;

  /// No description provided for @pluginCategory_color.
  ///
  /// In fr, this message translates to:
  /// **'Couleur'**
  String get pluginCategory_color;

  /// No description provided for @pluginCategory_movement.
  ///
  /// In fr, this message translates to:
  /// **'Mouvement'**
  String get pluginCategory_movement;

  /// No description provided for @pluginCategory_effect.
  ///
  /// In fr, this message translates to:
  /// **'Effets'**
  String get pluginCategory_effect;

  /// No description provided for @pluginCategory_dimmer.
  ///
  /// In fr, this message translates to:
  /// **'Intensité'**
  String get pluginCategory_dimmer;

  /// No description provided for @pluginCategory_layout.
  ///
  /// In fr, this message translates to:
  /// **'Layout'**
  String get pluginCategory_layout;

  /// No description provided for @pluginCategory_select.
  ///
  /// In fr, this message translates to:
  /// **'Sélection'**
  String get pluginCategory_select;

  /// No description provided for @pluginCategory_macro.
  ///
  /// In fr, this message translates to:
  /// **'Macro'**
  String get pluginCategory_macro;

  /// No description provided for @pluginCategory_utility.
  ///
  /// In fr, this message translates to:
  /// **'Utilitaire'**
  String get pluginCategory_utility;

  /// No description provided for @pluginCategory_custom.
  ///
  /// In fr, this message translates to:
  /// **'Sur mesure'**
  String get pluginCategory_custom;

  /// No description provided for @ma3AppTitlePrefix.
  ///
  /// In fr, this message translates to:
  /// **'MA3 Plugin '**
  String get ma3AppTitlePrefix;

  /// No description provided for @ma3AppTitleAccent.
  ///
  /// In fr, this message translates to:
  /// **'Forge'**
  String get ma3AppTitleAccent;

  /// No description provided for @ma3New.
  ///
  /// In fr, this message translates to:
  /// **'↺ Nouveau'**
  String get ma3New;

  /// No description provided for @ma3StepCategory.
  ///
  /// In fr, this message translates to:
  /// **'Catégorie'**
  String get ma3StepCategory;

  /// No description provided for @ma3StepSettings.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres'**
  String get ma3StepSettings;

  /// No description provided for @ma3StepGeneratedCode.
  ///
  /// In fr, this message translates to:
  /// **'Code généré'**
  String get ma3StepGeneratedCode;

  /// No description provided for @ma3ChoosePluginType.
  ///
  /// In fr, this message translates to:
  /// **'Quel type de plugin ?'**
  String get ma3ChoosePluginType;

  /// No description provided for @ma3ChooseCategorySubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Choisis une catégorie pour commencer'**
  String get ma3ChooseCategorySubtitle;

  /// No description provided for @ma3Continue.
  ///
  /// In fr, this message translates to:
  /// **'Continuer →'**
  String get ma3Continue;

  /// No description provided for @ma3PluginName.
  ///
  /// In fr, this message translates to:
  /// **'Nom du plugin'**
  String get ma3PluginName;

  /// No description provided for @ma3PluginNameHint.
  ///
  /// In fr, this message translates to:
  /// **'Mon Plugin MA3'**
  String get ma3PluginNameHint;

  /// No description provided for @ma3PluginSettings.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres du plugin'**
  String get ma3PluginSettings;

  /// No description provided for @ma3AdditionalDetails.
  ///
  /// In fr, this message translates to:
  /// **'💬 Détails supplémentaires (optionnel)'**
  String get ma3AdditionalDetails;

  /// No description provided for @ma3AdditionalDetailsHint.
  ///
  /// In fr, this message translates to:
  /// **'Ajoute des précisions, cas particuliers, contraintes...'**
  String get ma3AdditionalDetailsHint;

  /// No description provided for @ma3Back.
  ///
  /// In fr, this message translates to:
  /// **'← Retour'**
  String get ma3Back;

  /// No description provided for @ma3GeneratePlugin.
  ///
  /// In fr, this message translates to:
  /// **'⚡ Générer le Plugin'**
  String get ma3GeneratePlugin;

  /// No description provided for @ma3GeneratedReady.
  ///
  /// In fr, this message translates to:
  /// **'Plugin généré — prêt à coller dans MA3'**
  String get ma3GeneratedReady;

  /// No description provided for @ma3InstallInMa3.
  ///
  /// In fr, this message translates to:
  /// **'Installer dans MA3 : '**
  String get ma3InstallInMa3;

  /// No description provided for @ma3Menu.
  ///
  /// In fr, this message translates to:
  /// **'Menu '**
  String get ma3Menu;

  /// No description provided for @ma3Plugin.
  ///
  /// In fr, this message translates to:
  /// **'Plugin'**
  String get ma3Plugin;

  /// No description provided for @ma3NewPlugin.
  ///
  /// In fr, this message translates to:
  /// **'New Plugin'**
  String get ma3NewPlugin;

  /// No description provided for @ma3PasteSaveAs.
  ///
  /// In fr, this message translates to:
  /// **' → colle → sauvegarde comme '**
  String get ma3PasteSaveAs;

  /// No description provided for @ma3Run.
  ///
  /// In fr, this message translates to:
  /// **'Run'**
  String get ma3Run;

  /// No description provided for @ma3Copied.
  ///
  /// In fr, this message translates to:
  /// **'✓ Copié !'**
  String get ma3Copied;

  /// No description provided for @ma3Copy.
  ///
  /// In fr, this message translates to:
  /// **'⎘ Copier'**
  String get ma3Copy;

  /// No description provided for @ma3Edit.
  ///
  /// In fr, this message translates to:
  /// **'← Modifier'**
  String get ma3Edit;

  /// No description provided for @ma3Regenerate.
  ///
  /// In fr, this message translates to:
  /// **'↺ Régénérer'**
  String get ma3Regenerate;

  /// No description provided for @ma3NewPluginButton.
  ///
  /// In fr, this message translates to:
  /// **'+ Nouveau plugin'**
  String get ma3NewPluginButton;

  /// No description provided for @ma3Choose.
  ///
  /// In fr, this message translates to:
  /// **'— Choisir —'**
  String get ma3Choose;

  /// No description provided for @ma3Add.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter...'**
  String get ma3Add;

  /// No description provided for @ma3GeneratedPluginFallback.
  ///
  /// In fr, this message translates to:
  /// **'Plugin'**
  String get ma3GeneratedPluginFallback;

  /// No description provided for @ma3CategoryColor.
  ///
  /// In fr, this message translates to:
  /// **'Couleur'**
  String get ma3CategoryColor;

  /// No description provided for @ma3CategoryColorDesc.
  ///
  /// In fr, this message translates to:
  /// **'Layout RGB, palette, presets couleur'**
  String get ma3CategoryColorDesc;

  /// No description provided for @ma3CategoryMovement.
  ///
  /// In fr, this message translates to:
  /// **'Mouvement'**
  String get ma3CategoryMovement;

  /// No description provided for @ma3CategoryMovementDesc.
  ///
  /// In fr, this message translates to:
  /// **'Pan/Tilt, cercle, figure 8, positions'**
  String get ma3CategoryMovementDesc;

  /// No description provided for @ma3CategoryEffect.
  ///
  /// In fr, this message translates to:
  /// **'Effets'**
  String get ma3CategoryEffect;

  /// No description provided for @ma3CategoryEffectDesc.
  ///
  /// In fr, this message translates to:
  /// **'Strobe, pulse, chase, séquences'**
  String get ma3CategoryEffectDesc;

  /// No description provided for @ma3CategoryDimmer.
  ///
  /// In fr, this message translates to:
  /// **'Intensité'**
  String get ma3CategoryDimmer;

  /// No description provided for @ma3CategoryDimmerDesc.
  ///
  /// In fr, this message translates to:
  /// **'Dimmer, bump, fade, blackout'**
  String get ma3CategoryDimmerDesc;

  /// No description provided for @ma3CategoryLayout.
  ///
  /// In fr, this message translates to:
  /// **'Layout'**
  String get ma3CategoryLayout;

  /// No description provided for @ma3CategoryLayoutDesc.
  ///
  /// In fr, this message translates to:
  /// **'Créer/organiser des layouts MA3'**
  String get ma3CategoryLayoutDesc;

  /// No description provided for @ma3CategorySelect.
  ///
  /// In fr, this message translates to:
  /// **'Sélection'**
  String get ma3CategorySelect;

  /// No description provided for @ma3CategorySelectDesc.
  ///
  /// In fr, this message translates to:
  /// **'Sélection groupes, fixtures, filtres'**
  String get ma3CategorySelectDesc;

  /// No description provided for @ma3CategoryMacro.
  ///
  /// In fr, this message translates to:
  /// **'Macro'**
  String get ma3CategoryMacro;

  /// No description provided for @ma3CategoryMacroDesc.
  ///
  /// In fr, this message translates to:
  /// **'Macros multi-étapes, séquences console'**
  String get ma3CategoryMacroDesc;

  /// No description provided for @ma3CategoryUtility.
  ///
  /// In fr, this message translates to:
  /// **'Utilitaire'**
  String get ma3CategoryUtility;

  /// No description provided for @ma3CategoryUtilityDesc.
  ///
  /// In fr, this message translates to:
  /// **'Label, store, organiser le show file'**
  String get ma3CategoryUtilityDesc;

  /// No description provided for @ma3CategoryCustom.
  ///
  /// In fr, this message translates to:
  /// **'Sur mesure'**
  String get ma3CategoryCustom;

  /// No description provided for @ma3CategoryCustomDesc.
  ///
  /// In fr, this message translates to:
  /// **'Décris librement ce que tu veux'**
  String get ma3CategoryCustomDesc;

  /// No description provided for @ma3FieldColorSpace.
  ///
  /// In fr, this message translates to:
  /// **'Espace couleur des machines'**
  String get ma3FieldColorSpace;

  /// No description provided for @ma3FieldColors.
  ///
  /// In fr, this message translates to:
  /// **'Couleurs à proposer comme presets'**
  String get ma3FieldColors;

  /// No description provided for @ma3FieldGroupSelect.
  ///
  /// In fr, this message translates to:
  /// **'Le plugin demande le groupe au lancement'**
  String get ma3FieldGroupSelect;

  /// No description provided for @ma3YesViaMa3Dialog.
  ///
  /// In fr, this message translates to:
  /// **'Oui — via dialog MA3'**
  String get ma3YesViaMa3Dialog;

  /// No description provided for @ma3NoUseCurrentSelection.
  ///
  /// In fr, this message translates to:
  /// **'Non — utilise la sélection courante'**
  String get ma3NoUseCurrentSelection;

  /// No description provided for @ma3FieldMovementType.
  ///
  /// In fr, this message translates to:
  /// **'Type de mouvement à créer'**
  String get ma3FieldMovementType;

  /// No description provided for @ma3MovePresetPositions.
  ///
  /// In fr, this message translates to:
  /// **'Presets positions (scène, face, côtés...)'**
  String get ma3MovePresetPositions;

  /// No description provided for @ma3MoveCircle.
  ///
  /// In fr, this message translates to:
  /// **'Effect Engine — Cercle'**
  String get ma3MoveCircle;

  /// No description provided for @ma3MoveFigure8.
  ///
  /// In fr, this message translates to:
  /// **'Effect Engine — Figure 8'**
  String get ma3MoveFigure8;

  /// No description provided for @ma3MovePanSweep.
  ///
  /// In fr, this message translates to:
  /// **'Effect Engine — Pan sweep'**
  String get ma3MovePanSweep;

  /// No description provided for @ma3MoveTiltSweep.
  ///
  /// In fr, this message translates to:
  /// **'Effect Engine — Tilt sweep'**
  String get ma3MoveTiltSweep;

  /// No description provided for @ma3MoveRandom.
  ///
  /// In fr, this message translates to:
  /// **'Effect Engine — Aléatoire'**
  String get ma3MoveRandom;

  /// No description provided for @ma3FieldSpeedSourceEffects.
  ///
  /// In fr, this message translates to:
  /// **'Source de vitesse (pour effects)'**
  String get ma3FieldSpeedSourceEffects;

  /// No description provided for @ma3SpeedBpmConsole.
  ///
  /// In fr, this message translates to:
  /// **'BPM — valeur saisie dans la console'**
  String get ma3SpeedBpmConsole;

  /// No description provided for @ma3SpeedExecutorConsole.
  ///
  /// In fr, this message translates to:
  /// **'Executeur de vitesse — numéro saisi dans la console'**
  String get ma3SpeedExecutorConsole;

  /// No description provided for @ma3SpeedBothConsole.
  ///
  /// In fr, this message translates to:
  /// **'Les deux — choix proposé dans la console'**
  String get ma3SpeedBothConsole;

  /// No description provided for @ma3FieldEffectType.
  ///
  /// In fr, this message translates to:
  /// **'Type d\'effet à créer'**
  String get ma3FieldEffectType;

  /// No description provided for @ma3FieldOutput.
  ///
  /// In fr, this message translates to:
  /// **'Ce que le plugin crée'**
  String get ma3FieldOutput;

  /// No description provided for @ma3OutputEffectPresets.
  ///
  /// In fr, this message translates to:
  /// **'Presets effet'**
  String get ma3OutputEffectPresets;

  /// No description provided for @ma3OutputChaseSequence.
  ///
  /// In fr, this message translates to:
  /// **'Séquence chase'**
  String get ma3OutputChaseSequence;

  /// No description provided for @ma3OutputTriggerMacro.
  ///
  /// In fr, this message translates to:
  /// **'Macro déclencheur'**
  String get ma3OutputTriggerMacro;

  /// No description provided for @ma3FieldSpeedSource.
  ///
  /// In fr, this message translates to:
  /// **'Source de vitesse'**
  String get ma3FieldSpeedSource;

  /// No description provided for @ma3FieldFeatures.
  ///
  /// In fr, this message translates to:
  /// **'Fonctionnalités à inclure'**
  String get ma3FieldFeatures;

  /// No description provided for @ma3OutputIntensityMacros.
  ///
  /// In fr, this message translates to:
  /// **'Macros intensité'**
  String get ma3OutputIntensityMacros;

  /// No description provided for @ma3OutputIntensityPresets.
  ///
  /// In fr, this message translates to:
  /// **'Presets intensité'**
  String get ma3OutputIntensityPresets;

  /// No description provided for @ma3FieldLayoutSections.
  ///
  /// In fr, this message translates to:
  /// **'Sections à inclure dans le layout'**
  String get ma3FieldLayoutSections;

  /// No description provided for @ma3SectionColors.
  ///
  /// In fr, this message translates to:
  /// **'Couleurs'**
  String get ma3SectionColors;

  /// No description provided for @ma3SectionGroups.
  ///
  /// In fr, this message translates to:
  /// **'Groupes'**
  String get ma3SectionGroups;

  /// No description provided for @ma3SectionPresets.
  ///
  /// In fr, this message translates to:
  /// **'Presets'**
  String get ma3SectionPresets;

  /// No description provided for @ma3FieldVisualStyle.
  ///
  /// In fr, this message translates to:
  /// **'Style visuel'**
  String get ma3FieldVisualStyle;

  /// No description provided for @ma3FieldGroupNameNumber.
  ///
  /// In fr, this message translates to:
  /// **'Le plugin demande le nom/numéro au lancement'**
  String get ma3FieldGroupNameNumber;

  /// No description provided for @ma3NoHardcodedGenericName.
  ///
  /// In fr, this message translates to:
  /// **'Non — nom générique codé en dur'**
  String get ma3NoHardcodedGenericName;

  /// No description provided for @ma3FieldSelectionCriteria.
  ///
  /// In fr, this message translates to:
  /// **'Critères de sélection à proposer'**
  String get ma3FieldSelectionCriteria;

  /// No description provided for @ma3CriteriaEvenOdd.
  ///
  /// In fr, this message translates to:
  /// **'Pairs/Impairs'**
  String get ma3CriteriaEvenOdd;

  /// No description provided for @ma3CriteriaThirds.
  ///
  /// In fr, this message translates to:
  /// **'1/3 — 2/3 — 3/3'**
  String get ma3CriteriaThirds;

  /// No description provided for @ma3CriteriaPosition.
  ///
  /// In fr, this message translates to:
  /// **'Par position (avant/milieu/arrière)'**
  String get ma3CriteriaPosition;

  /// No description provided for @ma3CriteriaAll.
  ///
  /// In fr, this message translates to:
  /// **'Tous'**
  String get ma3CriteriaAll;

  /// No description provided for @ma3CriteriaFirstLast.
  ///
  /// In fr, this message translates to:
  /// **'Premier/Dernier'**
  String get ma3CriteriaFirstLast;

  /// No description provided for @ma3OutputSelectionMacros.
  ///
  /// In fr, this message translates to:
  /// **'Macros de sélection'**
  String get ma3OutputSelectionMacros;

  /// No description provided for @ma3OutputGroupButtonsLayout.
  ///
  /// In fr, this message translates to:
  /// **'Boutons de groupe dans un layout'**
  String get ma3OutputGroupButtonsLayout;

  /// No description provided for @ma3FieldMacroSteps.
  ///
  /// In fr, this message translates to:
  /// **'Décris les étapes de la macro'**
  String get ma3FieldMacroSteps;

  /// No description provided for @ma3MacroStepsHint.
  ///
  /// In fr, this message translates to:
  /// **'ex:\n1. Sélectionner un groupe (dialog)\n2. Blackout\n3. Attendre 1s\n4. Fade In 3s'**
  String get ma3MacroStepsHint;

  /// No description provided for @ma3FieldTrigger.
  ///
  /// In fr, this message translates to:
  /// **'Déclencheur'**
  String get ma3FieldTrigger;

  /// No description provided for @ma3TriggerManual.
  ///
  /// In fr, this message translates to:
  /// **'Manuel'**
  String get ma3TriggerManual;

  /// No description provided for @ma3FieldTask.
  ///
  /// In fr, this message translates to:
  /// **'Tâche à effectuer'**
  String get ma3FieldTask;

  /// No description provided for @ma3TaskNameFixtures.
  ///
  /// In fr, this message translates to:
  /// **'Nommer les fixtures du patch'**
  String get ma3TaskNameFixtures;

  /// No description provided for @ma3TaskCreateGroups.
  ///
  /// In fr, this message translates to:
  /// **'Créer les groupes automatiquement'**
  String get ma3TaskCreateGroups;

  /// No description provided for @ma3TaskStorePresets.
  ///
  /// In fr, this message translates to:
  /// **'Stocker tous les presets'**
  String get ma3TaskStorePresets;

  /// No description provided for @ma3TaskCleanEmptyObjects.
  ///
  /// In fr, this message translates to:
  /// **'Nettoyer les objets vides'**
  String get ma3TaskCleanEmptyObjects;

  /// No description provided for @ma3TaskCloneLayout.
  ///
  /// In fr, this message translates to:
  /// **'Cloner un layout'**
  String get ma3TaskCloneLayout;

  /// No description provided for @ma3TaskShowReport.
  ///
  /// In fr, this message translates to:
  /// **'Rapport du show (fixtures, groupes, presets)'**
  String get ma3TaskShowReport;

  /// No description provided for @ma3FieldConfirmEachAction.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer avant chaque action'**
  String get ma3FieldConfirmEachAction;

  /// No description provided for @ma3Yes.
  ///
  /// In fr, this message translates to:
  /// **'Oui'**
  String get ma3Yes;

  /// No description provided for @ma3No.
  ///
  /// In fr, this message translates to:
  /// **'Non'**
  String get ma3No;

  /// No description provided for @ma3FieldCustomDescription.
  ///
  /// In fr, this message translates to:
  /// **'Décris ce que le plugin doit faire dans MA3'**
  String get ma3FieldCustomDescription;

  /// No description provided for @ma3ColorRed.
  ///
  /// In fr, this message translates to:
  /// **'Rouge'**
  String get ma3ColorRed;

  /// No description provided for @ma3ColorGreen.
  ///
  /// In fr, this message translates to:
  /// **'Vert'**
  String get ma3ColorGreen;

  /// No description provided for @ma3ColorBlue.
  ///
  /// In fr, this message translates to:
  /// **'Bleu'**
  String get ma3ColorBlue;

  /// No description provided for @ma3ColorYellow.
  ///
  /// In fr, this message translates to:
  /// **'Jaune'**
  String get ma3ColorYellow;

  /// No description provided for @ma3ColorOrange.
  ///
  /// In fr, this message translates to:
  /// **'Orange'**
  String get ma3ColorOrange;

  /// No description provided for @ma3ColorPink.
  ///
  /// In fr, this message translates to:
  /// **'Rose'**
  String get ma3ColorPink;

  /// No description provided for @ma3ColorColdWhite.
  ///
  /// In fr, this message translates to:
  /// **'Blanc froid'**
  String get ma3ColorColdWhite;

  /// No description provided for @ma3ColorWarmWhite.
  ///
  /// In fr, this message translates to:
  /// **'Blanc chaud'**
  String get ma3ColorWarmWhite;

  /// No description provided for @ma3EffectStrobe.
  ///
  /// In fr, this message translates to:
  /// **'Strobe'**
  String get ma3EffectStrobe;

  /// No description provided for @ma3EffectPulse.
  ///
  /// In fr, this message translates to:
  /// **'Pulse'**
  String get ma3EffectPulse;

  /// No description provided for @ma3EffectChase.
  ///
  /// In fr, this message translates to:
  /// **'Chase'**
  String get ma3EffectChase;

  /// No description provided for @ma3EffectTwinkle.
  ///
  /// In fr, this message translates to:
  /// **'Twinkle'**
  String get ma3EffectTwinkle;

  /// No description provided for @ma3EffectFire.
  ///
  /// In fr, this message translates to:
  /// **'Fire'**
  String get ma3EffectFire;

  /// No description provided for @ma3EffectSawtooth.
  ///
  /// In fr, this message translates to:
  /// **'Sawtooth'**
  String get ma3EffectSawtooth;

  /// No description provided for @ma3EffectRandom.
  ///
  /// In fr, this message translates to:
  /// **'Random'**
  String get ma3EffectRandom;

  /// No description provided for @ma3Blackout.
  ///
  /// In fr, this message translates to:
  /// **'Blackout'**
  String get ma3Blackout;

  /// No description provided for @ma3Full.
  ///
  /// In fr, this message translates to:
  /// **'Full'**
  String get ma3Full;

  /// No description provided for @ma3Bump.
  ///
  /// In fr, this message translates to:
  /// **'Bump'**
  String get ma3Bump;

  /// No description provided for @ma3FadeIn.
  ///
  /// In fr, this message translates to:
  /// **'Fade In'**
  String get ma3FadeIn;

  /// No description provided for @ma3FadeOut.
  ///
  /// In fr, this message translates to:
  /// **'Fade Out'**
  String get ma3FadeOut;

  /// No description provided for @ma3DimmerChase.
  ///
  /// In fr, this message translates to:
  /// **'Dimmer Chase'**
  String get ma3DimmerChase;

  /// No description provided for @ma3Compact.
  ///
  /// In fr, this message translates to:
  /// **'Compact'**
  String get ma3Compact;

  /// No description provided for @ma3Large.
  ///
  /// In fr, this message translates to:
  /// **'Large'**
  String get ma3Large;

  /// No description provided for @ma3Tablet.
  ///
  /// In fr, this message translates to:
  /// **'Tablette'**
  String get ma3Tablet;

  /// No description provided for @ma3Wing.
  ///
  /// In fr, this message translates to:
  /// **'Wing'**
  String get ma3Wing;

  /// No description provided for @ma3Random.
  ///
  /// In fr, this message translates to:
  /// **'Aléatoire'**
  String get ma3Random;

  /// No description provided for @ma3FirstLast.
  ///
  /// In fr, this message translates to:
  /// **'Premier/Dernier'**
  String get ma3FirstLast;

  /// No description provided for @ma3Error.
  ///
  /// In fr, this message translates to:
  /// **'Erreur : {error}'**
  String ma3Error(Object error);

  /// No description provided for @ma3Text_RGB.
  ///
  /// In fr, this message translates to:
  /// **'RGB'**
  String get ma3Text_RGB;

  /// No description provided for @ma3Text_CMY.
  ///
  /// In fr, this message translates to:
  /// **'CMY'**
  String get ma3Text_CMY;

  /// No description provided for @ma3Text_HSI.
  ///
  /// In fr, this message translates to:
  /// **'HSI'**
  String get ma3Text_HSI;

  /// No description provided for @ma3Text_RGBW.
  ///
  /// In fr, this message translates to:
  /// **'RGBW'**
  String get ma3Text_RGBW;

  /// No description provided for @ma3Text_RGBWW.
  ///
  /// In fr, this message translates to:
  /// **'RGBWW'**
  String get ma3Text_RGBWW;

  /// No description provided for @ma3Text_RGBA.
  ///
  /// In fr, this message translates to:
  /// **'RGBA'**
  String get ma3Text_RGBA;

  /// No description provided for @ma3Text_RGBL.
  ///
  /// In fr, this message translates to:
  /// **'RGBL'**
  String get ma3Text_RGBL;

  /// No description provided for @ma3Text_RGBWA.
  ///
  /// In fr, this message translates to:
  /// **'RGBWA'**
  String get ma3Text_RGBWA;

  /// No description provided for @ma3Text_RGBUV.
  ///
  /// In fr, this message translates to:
  /// **'RGBUV'**
  String get ma3Text_RGBUV;

  /// No description provided for @ma3Text_Gel_Color.
  ///
  /// In fr, this message translates to:
  /// **'Gel Color'**
  String get ma3Text_Gel_Color;

  /// No description provided for @ma3Text_Cyan.
  ///
  /// In fr, this message translates to:
  /// **'Cyan'**
  String get ma3Text_Cyan;

  /// No description provided for @ma3Text_Magenta.
  ///
  /// In fr, this message translates to:
  /// **'Magenta'**
  String get ma3Text_Magenta;

  /// No description provided for @ma3Text_Lime.
  ///
  /// In fr, this message translates to:
  /// **'Lime'**
  String get ma3Text_Lime;

  /// No description provided for @ma3Text_UV.
  ///
  /// In fr, this message translates to:
  /// **'UV'**
  String get ma3Text_UV;

  /// No description provided for @ma3Text_OFF.
  ///
  /// In fr, this message translates to:
  /// **'OFF'**
  String get ma3Text_OFF;

  /// No description provided for @ma3Text_50.
  ///
  /// In fr, this message translates to:
  /// **'50%'**
  String get ma3Text_50;

  /// No description provided for @ma3Text_25.
  ///
  /// In fr, this message translates to:
  /// **'25%'**
  String get ma3Text_25;

  /// No description provided for @ma3Text_GO_button.
  ///
  /// In fr, this message translates to:
  /// **'GO button'**
  String get ma3Text_GO_button;

  /// No description provided for @ma3Text_Timecode.
  ///
  /// In fr, this message translates to:
  /// **'Timecode'**
  String get ma3Text_Timecode;

  /// No description provided for @ma3Text_OSC.
  ///
  /// In fr, this message translates to:
  /// **'OSC'**
  String get ma3Text_OSC;

  /// No description provided for @ma3Text_MIDI.
  ///
  /// In fr, this message translates to:
  /// **'MIDI'**
  String get ma3Text_MIDI;

  /// No description provided for @gdtfShareAsZip.
  ///
  /// In fr, this message translates to:
  /// **'Partager en .zip'**
  String get gdtfShareAsZip;

  /// No description provided for @gdtfZipShareHelp.
  ///
  /// In fr, this message translates to:
  /// **'💡 Utile si Gmail ou votre messagerie bloque le .gdtf — renommez le fichier en .gdtf après réception.'**
  String get gdtfZipShareHelp;

  /// No description provided for @rfAntennaTitle.
  ///
  /// In fr, this message translates to:
  /// **'Calculateur d\'antenne'**
  String get rfAntennaTitle;

  /// No description provided for @rfSplitterTitle.
  ///
  /// In fr, this message translates to:
  /// **'Perte Répartiteur / Combineur'**
  String get rfSplitterTitle;

  /// No description provided for @rfCableAntennaTitle.
  ///
  /// In fr, this message translates to:
  /// **'Câble RF & Antennes'**
  String get rfCableAntennaTitle;

  /// No description provided for @rfCableLossSectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Perte dans le câble coaxial'**
  String get rfCableLossSectionTitle;

  /// No description provided for @rfCableLossCableTypeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Type de câble'**
  String get rfCableLossCableTypeLabel;

  /// No description provided for @rfCableAntennaFrequencyLabel.
  ///
  /// In fr, this message translates to:
  /// **'Fréquence'**
  String get rfCableAntennaFrequencyLabel;

  /// No description provided for @rfCableLossLengthLabel.
  ///
  /// In fr, this message translates to:
  /// **'Longueur du câble'**
  String get rfCableLossLengthLabel;

  /// No description provided for @rfCableAntennaEmptyState.
  ///
  /// In fr, this message translates to:
  /// **'Renseignez les valeurs pour voir le résultat.'**
  String get rfCableAntennaEmptyState;

  /// No description provided for @rfCableLossResultLabel.
  ///
  /// In fr, this message translates to:
  /// **'Perte totale'**
  String get rfCableLossResultLabel;

  /// No description provided for @rfCableLossFormulaNote.
  ///
  /// In fr, this message translates to:
  /// **'Atténuation ≈ k1·√f + k2·f (dB/100 m) — modèle empirique par type de câble, ±5 % typique entre 100 MHz et 2,5 GHz. Valeurs indicatives : se référer à la datasheet du câble pour un budget de liaison critique.'**
  String get rfCableLossFormulaNote;

  /// No description provided for @rfDiversitySectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Espacement antennes diversity (λ/4)'**
  String get rfDiversitySectionTitle;

  /// No description provided for @rfDiversityResultLabel.
  ///
  /// In fr, this message translates to:
  /// **'Espacement recommandé'**
  String get rfDiversityResultLabel;

  /// No description provided for @rfDiversityFormulaNote.
  ///
  /// In fr, this message translates to:
  /// **'λ/4 = 75 / f(MHz) mètres — espacement minimal recommandé entre deux antennes diversity pour limiter les évanouissements (fading) par trajets multiples.'**
  String get rfDiversityFormulaNote;

  /// No description provided for @rfPlannerTitle.
  ///
  /// In fr, this message translates to:
  /// **'Planificateur de Fréquences HF'**
  String get rfPlannerTitle;

  /// No description provided for @rfPlannerBandLabel.
  ///
  /// In fr, this message translates to:
  /// **'Bande de fréquences'**
  String get rfPlannerBandLabel;

  /// No description provided for @rfPlannerCustomBand.
  ///
  /// In fr, this message translates to:
  /// **'Personnalisée'**
  String get rfPlannerCustomBand;

  /// No description provided for @rfPlannerMinFreqLabel.
  ///
  /// In fr, this message translates to:
  /// **'Fréquence min'**
  String get rfPlannerMinFreqLabel;

  /// No description provided for @rfPlannerMaxFreqLabel.
  ///
  /// In fr, this message translates to:
  /// **'Fréquence max'**
  String get rfPlannerMaxFreqLabel;

  /// No description provided for @rfPlannerChannelCountLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nombre de canaux souhaités'**
  String get rfPlannerChannelCountLabel;

  /// No description provided for @rfPlannerMinSpacingLabel.
  ///
  /// In fr, this message translates to:
  /// **'Espacement minimum entre canaux'**
  String get rfPlannerMinSpacingLabel;

  /// No description provided for @rfPlannerResultTitle.
  ///
  /// In fr, this message translates to:
  /// **'Fréquences proposées'**
  String get rfPlannerResultTitle;

  /// No description provided for @rfPlannerFoundLabel.
  ///
  /// In fr, this message translates to:
  /// **'Canaux trouvés'**
  String get rfPlannerFoundLabel;

  /// No description provided for @rfPlannerNotEnoughWarning.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de trouver tous les canaux demandés dans cette bande avec cet espacement — essaie une bande plus large ou réduis le nombre de canaux/l\'espacement minimum.'**
  String get rfPlannerNotEnoughWarning;

  /// No description provided for @rfPlannerFormulaNote.
  ///
  /// In fr, this message translates to:
  /// **'Évite les produits d\'intermodulation du 3e ordre (2fA−fB, fA+fB−fC) entre tous les canaux, tolérance ±200 kHz — pas de garantie absolue, vérifie sur le terrain avec un scan RF.'**
  String get rfPlannerFormulaNote;

  /// No description provided for @rfSplitterWaysLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nombre de voies'**
  String get rfSplitterWaysLabel;

  /// No description provided for @rfSplitterExcessLossLabel.
  ///
  /// In fr, this message translates to:
  /// **'Perte excédentaire du répartiteur'**
  String get rfSplitterExcessLossLabel;

  /// No description provided for @rfSplitterAdditionalLossLabel.
  ///
  /// In fr, this message translates to:
  /// **'Pertes câbles & connecteurs'**
  String get rfSplitterAdditionalLossLabel;

  /// No description provided for @rfSplitterTotalTitle.
  ///
  /// In fr, this message translates to:
  /// **'Perte totale d\'insertion'**
  String get rfSplitterTotalTitle;

  /// No description provided for @rfSplitterTheoreticalLabel.
  ///
  /// In fr, this message translates to:
  /// **'Perte théorique (10·log₁₀N)'**
  String get rfSplitterTheoreticalLabel;

  /// No description provided for @rfSplitterReferenceTitle.
  ///
  /// In fr, this message translates to:
  /// **'Repères par nombre de voies'**
  String get rfSplitterReferenceTitle;

  /// No description provided for @rfSplitterFormulaNote.
  ///
  /// In fr, this message translates to:
  /// **'Perte totale ≈ perte théorique + perte excédentaire + pertes câbles/connecteurs'**
  String get rfSplitterFormulaNote;

  /// No description provided for @rfFrequency.
  ///
  /// In fr, this message translates to:
  /// **'Fréquence'**
  String get rfFrequency;

  /// No description provided for @rfVelocityFactorTitle.
  ///
  /// In fr, this message translates to:
  /// **'Facteur de vélocité (Vf)'**
  String get rfVelocityFactorTitle;

  /// No description provided for @rfAntennaLengths.
  ///
  /// In fr, this message translates to:
  /// **'Longueurs d\'antenne'**
  String get rfAntennaLengths;

  /// No description provided for @rfEnterFrequencyToCalculate.
  ///
  /// In fr, this message translates to:
  /// **'Saisissez une fréquence pour calculer'**
  String get rfEnterFrequencyToCalculate;

  /// No description provided for @rfFullWave.
  ///
  /// In fr, this message translates to:
  /// **'Onde complète (λ)'**
  String get rfFullWave;

  /// No description provided for @rfHalfWave.
  ///
  /// In fr, this message translates to:
  /// **'Demi-onde (λ/2)'**
  String get rfHalfWave;

  /// No description provided for @rfStandardDipole.
  ///
  /// In fr, this message translates to:
  /// **'Dipôle standard'**
  String get rfStandardDipole;

  /// No description provided for @rfQuarterWave.
  ///
  /// In fr, this message translates to:
  /// **'Quart d\'onde (λ/4)'**
  String get rfQuarterWave;

  /// No description provided for @rfWhipAntenna.
  ///
  /// In fr, this message translates to:
  /// **'Antenne fouet — la plus courante'**
  String get rfWhipAntenna;

  /// No description provided for @rfFiveEighthWave.
  ///
  /// In fr, this message translates to:
  /// **'5/8 onde (5λ/8)'**
  String get rfFiveEighthWave;

  /// No description provided for @rfFiveEighthWaveDescription.
  ///
  /// In fr, this message translates to:
  /// **'Gain +3 dB vs λ/4'**
  String get rfFiveEighthWaveDescription;

  /// No description provided for @rfReferenceFrequencies.
  ///
  /// In fr, this message translates to:
  /// **'Fréquences de référence'**
  String get rfReferenceFrequencies;

  /// No description provided for @rfFmRadio.
  ///
  /// In fr, this message translates to:
  /// **'FM Radio (88 MHz)'**
  String get rfFmRadio;

  /// No description provided for @rfVhfLow.
  ///
  /// In fr, this message translates to:
  /// **'VHF Bas (174 MHz)'**
  String get rfVhfLow;

  /// No description provided for @rfUhf470.
  ///
  /// In fr, this message translates to:
  /// **'UHF 470 MHz'**
  String get rfUhf470;

  /// No description provided for @rfUhf600.
  ///
  /// In fr, this message translates to:
  /// **'UHF 600 MHz'**
  String get rfUhf600;

  /// No description provided for @rfUhf694.
  ///
  /// In fr, this message translates to:
  /// **'UHF 694 MHz (limite FR)'**
  String get rfUhf694;

  /// No description provided for @rfIsm863.
  ///
  /// In fr, this message translates to:
  /// **'ISM 863 MHz'**
  String get rfIsm863;

  /// No description provided for @rfWifi24.
  ///
  /// In fr, this message translates to:
  /// **'WiFi 2.4 GHz'**
  String get rfWifi24;

  /// No description provided for @rfWifi5.
  ///
  /// In fr, this message translates to:
  /// **'WiFi 5 GHz (centre)'**
  String get rfWifi5;

  /// No description provided for @rfFormulaExplanation.
  ///
  /// In fr, this message translates to:
  /// **'λ = c / f × Vf    |    c = 299.792 m/µs\nVf = facteur de vélocité du câble (1.00 pour l\'air libre)'**
  String get rfFormulaExplanation;

  /// No description provided for @rfPresetFreeSpace.
  ///
  /// In fr, this message translates to:
  /// **'Air libre'**
  String get rfPresetFreeSpace;

  /// No description provided for @rfCoexTitle.
  ///
  /// In fr, this message translates to:
  /// **'Coexistence 2.4 GHz'**
  String get rfCoexTitle;

  /// No description provided for @rfCoexBandOccupancyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Qui occupe la bande 2.4 GHz ?'**
  String get rfCoexBandOccupancyTitle;

  /// No description provided for @rfCoexAvProtocolsTitle.
  ///
  /// In fr, this message translates to:
  /// **'⚡ Protocoles AV sur 2.4 GHz'**
  String get rfCoexAvProtocolsTitle;

  /// No description provided for @rfCoexAllProtocolsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Tous les protocoles'**
  String get rfCoexAllProtocolsTitle;

  /// No description provided for @rfCoexFrequentConflictsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Conflits fréquents en événementiel'**
  String get rfCoexFrequentConflictsTitle;

  /// No description provided for @rfCoexFieldRecommendationsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Recommandations terrain'**
  String get rfCoexFieldRecommendationsTitle;

  /// No description provided for @rfCoexProtocolWifi24Name.
  ///
  /// In fr, this message translates to:
  /// **'WiFi 2.4 GHz'**
  String get rfCoexProtocolWifi24Name;

  /// No description provided for @rfCoexProtocolWifi24Note.
  ///
  /// In fr, this message translates to:
  /// **'Canaux fixes, bande large. Forte puissance d\'émission.'**
  String get rfCoexProtocolWifi24Note;

  /// No description provided for @rfCoexProtocolBluetoothClassicName.
  ///
  /// In fr, this message translates to:
  /// **'Bluetooth Classic'**
  String get rfCoexProtocolBluetoothClassicName;

  /// No description provided for @rfCoexProtocolBluetoothClassicNote.
  ///
  /// In fr, this message translates to:
  /// **'Saute entre 1600 fréquences/s. Coexistence avec WiFi via AFH.'**
  String get rfCoexProtocolBluetoothClassicNote;

  /// No description provided for @rfCoexProtocolBluetoothLeName.
  ///
  /// In fr, this message translates to:
  /// **'Bluetooth LE'**
  String get rfCoexProtocolBluetoothLeName;

  /// No description provided for @rfCoexProtocolBluetoothLeNote.
  ///
  /// In fr, this message translates to:
  /// **'Canaux 37, 38, 39 = advertising (fixes). Risque avec WiFi ch1.'**
  String get rfCoexProtocolBluetoothLeNote;

  /// No description provided for @rfCoexProtocolZigbeeName.
  ///
  /// In fr, this message translates to:
  /// **'Zigbee (IEEE 802.15.4)'**
  String get rfCoexProtocolZigbeeName;

  /// No description provided for @rfCoexProtocolZigbeeNote.
  ///
  /// In fr, this message translates to:
  /// **'Canaux 11–26, chacun 2 MHz large. Compatible avec WiFi ch1/6/11.'**
  String get rfCoexProtocolZigbeeNote;

  /// No description provided for @rfCoexProtocolDigitalMics24Name.
  ///
  /// In fr, this message translates to:
  /// **'Micros num. 2.4 GHz'**
  String get rfCoexProtocolDigitalMics24Name;

  /// No description provided for @rfCoexProtocolDigitalMics24Note.
  ///
  /// In fr, this message translates to:
  /// **'Shure GLX-D, Line6 XD-V, Sennheiser EW-D 2.4 GHz. Très sensibles aux interférences WiFi.'**
  String get rfCoexProtocolDigitalMics24Note;

  /// No description provided for @rfCoexProtocolWirelessDmxName.
  ///
  /// In fr, this message translates to:
  /// **'DMX / RDM sans-fil'**
  String get rfCoexProtocolWirelessDmxName;

  /// No description provided for @rfCoexProtocolWirelessDmxNote.
  ///
  /// In fr, this message translates to:
  /// **'Lumen Radio CRMX, W-DMX, City Theatrical. FHSS = robuste mais partage la bande.'**
  String get rfCoexProtocolWirelessDmxNote;

  /// No description provided for @rfCoexProtocolWirelessVideoName.
  ///
  /// In fr, this message translates to:
  /// **'Vidéo sans-fil'**
  String get rfCoexProtocolWirelessVideoName;

  /// No description provided for @rfCoexProtocolWirelessVideoNote.
  ///
  /// In fr, this message translates to:
  /// **'Hollyland Mars, DJI O3, Teradek Bolt 4K. Très large bande, conflits majeurs possibles.'**
  String get rfCoexProtocolWirelessVideoNote;

  /// No description provided for @rfCoexTypeDsssOfdm.
  ///
  /// In fr, this message translates to:
  /// **'DSSS / OFDM'**
  String get rfCoexTypeDsssOfdm;

  /// No description provided for @rfCoexTypeFhss79.
  ///
  /// In fr, this message translates to:
  /// **'FHSS 79 canaux'**
  String get rfCoexTypeFhss79;

  /// No description provided for @rfCoexTypeFhss40.
  ///
  /// In fr, this message translates to:
  /// **'FHSS 40 canaux'**
  String get rfCoexTypeFhss40;

  /// No description provided for @rfCoexTypeDsss16.
  ///
  /// In fr, this message translates to:
  /// **'DSSS 16 canaux'**
  String get rfCoexTypeDsss16;

  /// No description provided for @rfCoexTypeFhssDsss.
  ///
  /// In fr, this message translates to:
  /// **'FHSS / DSSS'**
  String get rfCoexTypeFhssDsss;

  /// No description provided for @rfCoexTypeFhss.
  ///
  /// In fr, this message translates to:
  /// **'FHSS'**
  String get rfCoexTypeFhss;

  /// No description provided for @rfCoexTypeOfdm.
  ///
  /// In fr, this message translates to:
  /// **'OFDM'**
  String get rfCoexTypeOfdm;

  /// No description provided for @rfCoexConflictWifiCh6.
  ///
  /// In fr, this message translates to:
  /// **'WiFi ch6'**
  String get rfCoexConflictWifiCh6;

  /// No description provided for @rfCoexConflictMic24.
  ///
  /// In fr, this message translates to:
  /// **'Micro 2.4 GHz'**
  String get rfCoexConflictMic24;

  /// No description provided for @rfCoexConflictBleAdvertising.
  ///
  /// In fr, this message translates to:
  /// **'BLE advertising'**
  String get rfCoexConflictBleAdvertising;

  /// No description provided for @rfCoexConflictWifiCh1.
  ///
  /// In fr, this message translates to:
  /// **'WiFi ch1'**
  String get rfCoexConflictWifiCh1;

  /// No description provided for @rfCoexConflictWirelessVideo.
  ///
  /// In fr, this message translates to:
  /// **'Vidéo sans-fil'**
  String get rfCoexConflictWirelessVideo;

  /// No description provided for @rfCoexConflictEverythingElse.
  ///
  /// In fr, this message translates to:
  /// **'Tout le reste'**
  String get rfCoexConflictEverythingElse;

  /// No description provided for @rfCoexConflictZigbeeCh11.
  ///
  /// In fr, this message translates to:
  /// **'Zigbee ch11'**
  String get rfCoexConflictZigbeeCh11;

  /// No description provided for @rfCoexRiskHigh.
  ///
  /// In fr, this message translates to:
  /// **'ÉLEVÉ'**
  String get rfCoexRiskHigh;

  /// No description provided for @rfCoexRiskMedium.
  ///
  /// In fr, this message translates to:
  /// **'MOYEN'**
  String get rfCoexRiskMedium;

  /// No description provided for @rfCoexConflictWifiCh6Mic24Desc.
  ///
  /// In fr, this message translates to:
  /// **'Le WiFi ch6 chevauche directement les fréquences favorites des micros numériques.'**
  String get rfCoexConflictWifiCh6Mic24Desc;

  /// No description provided for @rfCoexConflictBleWifiCh1Desc.
  ///
  /// In fr, this message translates to:
  /// **'Les canaux BLE 37/38/39 se trouvent à 2402, 2426 et 2480 MHz.'**
  String get rfCoexConflictBleWifiCh1Desc;

  /// No description provided for @rfCoexConflictVideoEverythingDesc.
  ///
  /// In fr, this message translates to:
  /// **'Les liens vidéo sans-fil utilisent une bande large et saturent facilement la bande.'**
  String get rfCoexConflictVideoEverythingDesc;

  /// No description provided for @rfCoexConflictZigbeeWifiCh1Desc.
  ///
  /// In fr, this message translates to:
  /// **'Le canal Zigbee 11 (2405 MHz) est directement dans la bande du WiFi canal 1.'**
  String get rfCoexConflictZigbeeWifiCh1Desc;

  /// No description provided for @rfCoexTipWifiChannels.
  ///
  /// In fr, this message translates to:
  /// **'Réservez le WiFi aux canaux 1 et/ou 11. Évitez le canal 6 si vous avez des micros 2.4 GHz.'**
  String get rfCoexTipWifiChannels;

  /// No description provided for @rfCoexTipUhfMics.
  ///
  /// In fr, this message translates to:
  /// **'Pour les micros HF en zone dense, préférez les systèmes UHF (470–694 MHz) aux systèmes 2.4 GHz.'**
  String get rfCoexTipUhfMics;

  /// No description provided for @rfCoexTipWirelessVideo5Ghz.
  ///
  /// In fr, this message translates to:
  /// **'Les liens vidéo sans-fil : utilisez impérativement la bande 5 GHz quand c\'est possible.'**
  String get rfCoexTipWirelessVideo5Ghz;

  /// No description provided for @rfCoexTipWirelessDmxFhss.
  ///
  /// In fr, this message translates to:
  /// **'Le DMX sans-fil FHSS est le plus robuste — il saute automatiquement les fréquences occupées.'**
  String get rfCoexTipWirelessDmxFhss;

  /// No description provided for @rfCoexTipSpectrumScan.
  ///
  /// In fr, this message translates to:
  /// **'Faites un scan du spectre avant l\'event avec une app RF (WiFi Analyzer, Chanalyzer, etc.).'**
  String get rfCoexTipSpectrumScan;

  /// No description provided for @rfPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'RF & Sans-fil'**
  String get rfPageTitle;

  /// No description provided for @rfSectionMicrosHf.
  ///
  /// In fr, this message translates to:
  /// **'Micros HF & Antennes'**
  String get rfSectionMicrosHf;

  /// No description provided for @rfSectionCalcHf.
  ///
  /// In fr, this message translates to:
  /// **'Calculs HF'**
  String get rfSectionCalcHf;

  /// No description provided for @rfSectionWifi.
  ///
  /// In fr, this message translates to:
  /// **'WiFi'**
  String get rfSectionWifi;

  /// No description provided for @rfSectionCoexistence.
  ///
  /// In fr, this message translates to:
  /// **'Coexistence'**
  String get rfSectionCoexistence;

  /// No description provided for @rfSectionScanTerrain.
  ///
  /// In fr, this message translates to:
  /// **'Scan & Terrain'**
  String get rfSectionScanTerrain;

  /// No description provided for @rfFreeLabel.
  ///
  /// In fr, this message translates to:
  /// **'GRATUIT'**
  String get rfFreeLabel;

  /// No description provided for @rfToolUhfBandsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Bandes UHF / VHF'**
  String get rfToolUhfBandsTitle;

  /// No description provided for @rfToolUhfBandsSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Bandes légales France (ANFR), UHF 470–694 MHz, dividende numérique, DECT, ISM 863 MHz.'**
  String get rfToolUhfBandsSubtitle;

  /// No description provided for @rfToolAntennaTitle.
  ///
  /// In fr, this message translates to:
  /// **'Calculateur d\'Antenne'**
  String get rfToolAntennaTitle;

  /// No description provided for @rfToolAntennaSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Fréquence → λ/4, λ/2, 5λ/8. Facteur de vélocité pour câbles coaxiaux. Références UHF/WiFi.'**
  String get rfToolAntennaSubtitle;

  /// No description provided for @rfToolIm3Title.
  ///
  /// In fr, this message translates to:
  /// **'Intermodulation IM3'**
  String get rfToolIm3Title;

  /// No description provided for @rfToolIm3Subtitle.
  ///
  /// In fr, this message translates to:
  /// **'Calcule 2Fi−Fj pour 2 à 16 fréquences. Détecte les produits qui tombent sur vos canaux.'**
  String get rfToolIm3Subtitle;

  /// No description provided for @rfToolWifi24Title.
  ///
  /// In fr, this message translates to:
  /// **'Canaux WiFi 2.4 GHz'**
  String get rfToolWifi24Title;

  /// No description provided for @rfToolWifi24Subtitle.
  ///
  /// In fr, this message translates to:
  /// **'13 canaux, chevauchements visuels, simulateur de conflits. Canaux non-conflictuels 1, 6, 11.'**
  String get rfToolWifi24Subtitle;

  /// No description provided for @rfToolWifi5Title.
  ///
  /// In fr, this message translates to:
  /// **'Canaux WiFi 5 GHz'**
  String get rfToolWifi5Title;

  /// No description provided for @rfToolWifi5Subtitle.
  ///
  /// In fr, this message translates to:
  /// **'Bandes UNII-1/2A/2C, DFS, canaux disponibles en France. Non-chevauchants à 80 MHz.'**
  String get rfToolWifi5Subtitle;

  /// No description provided for @rfToolCoexTitle.
  ///
  /// In fr, this message translates to:
  /// **'Coexistence 2.4 GHz'**
  String get rfToolCoexTitle;

  /// No description provided for @rfToolCoexSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Qui partage la bande : WiFi, Bluetooth, Zigbee, micros numériques, DMX sans-fil, vidéo. Conflits typiques.'**
  String get rfToolCoexSubtitle;

  /// No description provided for @rfToolScanWifiTitle.
  ///
  /// In fr, this message translates to:
  /// **'Scan WiFi'**
  String get rfToolScanWifiTitle;

  /// No description provided for @rfToolScanWifiSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Analyse les réseaux WiFi environnants : canaux, RSSI, bandes 2.4/5 GHz. Visualisation occupation du spectre.'**
  String get rfToolScanWifiSubtitle;

  /// No description provided for @rfToolScanLogTitle.
  ///
  /// In fr, this message translates to:
  /// **'Journal de Scan RF'**
  String get rfToolScanLogTitle;

  /// No description provided for @rfToolScanLogSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Relevé manuel des fréquences : niveau signal, statut (libre/borderline/occupé), notes terrain.'**
  String get rfToolScanLogSubtitle;

  /// No description provided for @rfIm3PageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Intermodulation IM3'**
  String get rfIm3PageTitle;

  /// No description provided for @rfIm3WhatIs.
  ///
  /// In fr, this message translates to:
  /// **'Qu\'est-ce que l\'IM3 ?'**
  String get rfIm3WhatIs;

  /// No description provided for @rfIm3WhatIsBody.
  ///
  /// In fr, this message translates to:
  /// **'Quand deux émetteurs F1 et F2 entrent dans un ampli ou un récepteur, ils génèrent des fréquences parasites à 2F1−F2 et 2F2−F1. Ces produits d\'intermodulation du 3ᵉ ordre tombent près des fréquences originales et peuvent bloquer un canal HF voisin.'**
  String get rfIm3WhatIsBody;

  /// No description provided for @rfIm3QuickMode.
  ///
  /// In fr, this message translates to:
  /// **'Mode rapide — 2 fréquences'**
  String get rfIm3QuickMode;

  /// No description provided for @rfIm3AdvancedMode.
  ///
  /// In fr, this message translates to:
  /// **'Mode avancé — jusqu\'à 16 fréquences'**
  String get rfIm3AdvancedMode;

  /// No description provided for @rfIm3FrequencyN.
  ///
  /// In fr, this message translates to:
  /// **'Fréquence {index}'**
  String rfIm3FrequencyN(int index);

  /// No description provided for @rfIm3AddFrequency.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter une fréquence'**
  String get rfIm3AddFrequency;

  /// No description provided for @rfIm3Tips.
  ///
  /// In fr, this message translates to:
  /// **'Conseils terrain'**
  String get rfIm3Tips;

  /// No description provided for @rfIm3Tip1.
  ///
  /// In fr, this message translates to:
  /// **'Espacez vos fréquences de façon irrégulière. Des écarts réguliers génèrent des IM3 qui tombent pile sur vos canaux.'**
  String get rfIm3Tip1;

  /// No description provided for @rfIm3Tip2.
  ///
  /// In fr, this message translates to:
  /// **'Tolérance de détection : ±200 kHz. Adaptez selon la largeur de bande de vos systèmes (généralement 200–400 kHz).'**
  String get rfIm3Tip2;

  /// No description provided for @rfIm3Tip3.
  ///
  /// In fr, this message translates to:
  /// **'Les outils Shure Wireless Workbench, Sennheiser WSM et Audio-Technica Frequency Manager intègrent le calcul IM3 pour leurs gammes — utilisez-les pour le déploiement final.'**
  String get rfIm3Tip3;

  /// No description provided for @rfIm3OutOfBand.
  ///
  /// In fr, this message translates to:
  /// **'Hors bande (< 0 MHz)'**
  String get rfIm3OutOfBand;

  /// No description provided for @rfIm3ConflictOnFreq.
  ///
  /// In fr, this message translates to:
  /// **'⚠ Tombe sur une fréquence utilisée (±200 kHz)'**
  String get rfIm3ConflictOnFreq;

  /// No description provided for @rfIm3TableFormula.
  ///
  /// In fr, this message translates to:
  /// **'Formule'**
  String get rfIm3TableFormula;

  /// No description provided for @rfIm3TableFreqIm3.
  ///
  /// In fr, this message translates to:
  /// **'Fréquence IM3'**
  String get rfIm3TableFreqIm3;

  /// No description provided for @rfIm3TableStatus.
  ///
  /// In fr, this message translates to:
  /// **'Statut'**
  String get rfIm3TableStatus;

  /// No description provided for @rfIm3Footnote.
  ///
  /// In fr, this message translates to:
  /// **'IM3 = 2×Fi − Fj    |    Tolérance conflit : ±200 kHz\nLes produits négatifs (hors spectre) sont affichés mais non conflictuels.'**
  String get rfIm3Footnote;

  /// No description provided for @rfIm3Conflicts.
  ///
  /// In fr, this message translates to:
  /// **'{count} conflit{count, plural, one{} other{s}}'**
  String rfIm3Conflicts(int count);

  /// No description provided for @rfScanLogTitle.
  ///
  /// In fr, this message translates to:
  /// **'Journal de Scan RF'**
  String get rfScanLogTitle;

  /// No description provided for @rfScanLogClearAll.
  ///
  /// In fr, this message translates to:
  /// **'Tout effacer'**
  String get rfScanLogClearAll;

  /// No description provided for @rfScanLogAdd.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter'**
  String get rfScanLogAdd;

  /// No description provided for @rfScanLogClearConfirmTitle.
  ///
  /// In fr, this message translates to:
  /// **'Effacer le journal ?'**
  String get rfScanLogClearConfirmTitle;

  /// No description provided for @rfScanLogClearConfirmContent.
  ///
  /// In fr, this message translates to:
  /// **'Toutes les entrées seront supprimées.'**
  String get rfScanLogClearConfirmContent;

  /// No description provided for @rfScanLogCancel.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get rfScanLogCancel;

  /// No description provided for @rfScanLogDelete.
  ///
  /// In fr, this message translates to:
  /// **'Effacer'**
  String get rfScanLogDelete;

  /// No description provided for @rfScanLogNewEntry.
  ///
  /// In fr, this message translates to:
  /// **'Nouvelle entrée'**
  String get rfScanLogNewEntry;

  /// No description provided for @rfScanLogFrequency.
  ///
  /// In fr, this message translates to:
  /// **'Fréquence'**
  String get rfScanLogFrequency;

  /// No description provided for @rfScanLogOptionalLevel.
  ///
  /// In fr, this message translates to:
  /// **'Niveau mesuré (optionnel)'**
  String get rfScanLogOptionalLevel;

  /// No description provided for @rfScanLogNote.
  ///
  /// In fr, this message translates to:
  /// **'Note'**
  String get rfScanLogNote;

  /// No description provided for @rfScanLogNoteHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: canal 36, salle B, interférence TV...'**
  String get rfScanLogNoteHint;

  /// No description provided for @rfScanLogStatusLabel.
  ///
  /// In fr, this message translates to:
  /// **'Statut :'**
  String get rfScanLogStatusLabel;

  /// No description provided for @rfScanLogSave.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer'**
  String get rfScanLogSave;

  /// No description provided for @rfScanLogEmptyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Journal vide'**
  String get rfScanLogEmptyTitle;

  /// No description provided for @rfScanLogEmptyBody.
  ///
  /// In fr, this message translates to:
  /// **'Notez vos mesures terrain ici : fréquence, niveau mesuré sur l\'analyseur, statut et commentaire.'**
  String get rfScanLogEmptyBody;

  /// No description provided for @rfScanLogFirstEntry.
  ///
  /// In fr, this message translates to:
  /// **'Première entrée'**
  String get rfScanLogFirstEntry;

  /// No description provided for @rfScanLogStatusFree.
  ///
  /// In fr, this message translates to:
  /// **'Libre'**
  String get rfScanLogStatusFree;

  /// No description provided for @rfScanLogStatusOccupied.
  ///
  /// In fr, this message translates to:
  /// **'Occupée'**
  String get rfScanLogStatusOccupied;

  /// No description provided for @rfScanLogStatusBorderline.
  ///
  /// In fr, this message translates to:
  /// **'Borderline'**
  String get rfScanLogStatusBorderline;

  /// No description provided for @rfScanLogInstant.
  ///
  /// In fr, this message translates to:
  /// **'À l\'instant'**
  String get rfScanLogInstant;

  /// No description provided for @rfScanLogMinutesAgo.
  ///
  /// In fr, this message translates to:
  /// **'Il y a {n} min'**
  String rfScanLogMinutesAgo(int n);

  /// No description provided for @rfScanLogHoursAgo.
  ///
  /// In fr, this message translates to:
  /// **'Il y a {n} h'**
  String rfScanLogHoursAgo(int n);

  /// No description provided for @rfScanLogFreePlural.
  ///
  /// In fr, this message translates to:
  /// **'Libres'**
  String get rfScanLogFreePlural;

  /// No description provided for @rfScanLogOccupiedPlural.
  ///
  /// In fr, this message translates to:
  /// **'Occupées'**
  String get rfScanLogOccupiedPlural;

  /// No description provided for @rfScanLogBorderlinePlural.
  ///
  /// In fr, this message translates to:
  /// **'Border.'**
  String get rfScanLogBorderlinePlural;

  /// No description provided for @rfScanLogTotal.
  ///
  /// In fr, this message translates to:
  /// **'Total'**
  String get rfScanLogTotal;

  /// No description provided for @rfUhfBandsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Bandes UHF / VHF'**
  String get rfUhfBandsTitle;

  /// No description provided for @rfUhfBandsOverview.
  ///
  /// In fr, this message translates to:
  /// **'Vue d\'ensemble — France'**
  String get rfUhfBandsOverview;

  /// No description provided for @rfUhfBandsTips.
  ///
  /// In fr, this message translates to:
  /// **'Conseils pour le choix de bande'**
  String get rfUhfBandsTips;

  /// No description provided for @rfUhfBandsSource.
  ///
  /// In fr, this message translates to:
  /// **'Source : ANFR / ARCEP — Réglementation française.\nLes règles peuvent varier selon les pays.\nVérifiez toujours la conformité de votre matériel.'**
  String get rfUhfBandsSource;

  /// No description provided for @rfUhfBand1Name.
  ///
  /// In fr, this message translates to:
  /// **'VHF Bas'**
  String get rfUhfBand1Name;

  /// No description provided for @rfUhfBand1Status.
  ///
  /// In fr, this message translates to:
  /// **'Limité'**
  String get rfUhfBand1Status;

  /// No description provided for @rfUhfBand1Desc.
  ///
  /// In fr, this message translates to:
  /// **'Ancienne bande TV analogique. Quelques systèmes HF utilisent cette plage. Moins commune en événementiel.'**
  String get rfUhfBand1Desc;

  /// No description provided for @rfUhfBand1Examples.
  ///
  /// In fr, this message translates to:
  /// **'Certains anciens systèmes Sennheiser, Shure'**
  String get rfUhfBand1Examples;

  /// No description provided for @rfUhfBand2Name.
  ///
  /// In fr, this message translates to:
  /// **'UHF — Bloc TV'**
  String get rfUhfBand2Name;

  /// No description provided for @rfUhfBand2Status.
  ///
  /// In fr, this message translates to:
  /// **'Pro (autorisation)'**
  String get rfUhfBand2Status;

  /// No description provided for @rfUhfBand2Desc.
  ///
  /// In fr, this message translates to:
  /// **'Principale bande pour micros HF professionnels en France. Partage avec la TNT. Requiert une autorisation ANFR pour usage commercial. Usage libre pour la production audiovisuelle sous conditions.'**
  String get rfUhfBand2Desc;

  /// No description provided for @rfUhfBand2Examples.
  ///
  /// In fr, this message translates to:
  /// **'Shure Axient, Sennheiser 2000, Sony DWX, Audio-Technica 3000'**
  String get rfUhfBand2Examples;

  /// No description provided for @rfUhfBand3Name.
  ///
  /// In fr, this message translates to:
  /// **'Dividende numérique'**
  String get rfUhfBand3Name;

  /// No description provided for @rfUhfBand3Status.
  ///
  /// In fr, this message translates to:
  /// **'INTERDIT'**
  String get rfUhfBand3Status;

  /// No description provided for @rfUhfBand3Desc.
  ///
  /// In fr, this message translates to:
  /// **'Bande allouée aux réseaux mobiles 4G/5G en France depuis 2017. Tout matériel sans-fil audio dans cette bande est illégal depuis cette date.'**
  String get rfUhfBand3Desc;

  /// No description provided for @rfUhfBand4Name.
  ///
  /// In fr, this message translates to:
  /// **'ISM / SRD 863 MHz'**
  String get rfUhfBand4Name;

  /// No description provided for @rfUhfBand4Status.
  ///
  /// In fr, this message translates to:
  /// **'Libre (10 mW)'**
  String get rfUhfBand4Status;

  /// No description provided for @rfUhfBand4Desc.
  ///
  /// In fr, this message translates to:
  /// **'Bande libre en Europe (SRD — Short Range Device). Pas d\'autorisation requise. Limite de puissance : 10 mW ERP, 25 kHz de largeur de bande.'**
  String get rfUhfBand4Desc;

  /// No description provided for @rfUhfBand4Examples.
  ///
  /// In fr, this message translates to:
  /// **'Certains systèmes d\'entrée de gamme, télécommandes'**
  String get rfUhfBand4Examples;

  /// No description provided for @rfUhfBand5Name.
  ///
  /// In fr, this message translates to:
  /// **'DECT'**
  String get rfUhfBand5Name;

  /// No description provided for @rfUhfBand5Status.
  ///
  /// In fr, this message translates to:
  /// **'Libre (250 mW)'**
  String get rfUhfBand5Status;

  /// No description provided for @rfUhfBand5Desc.
  ///
  /// In fr, this message translates to:
  /// **'Standard dédié à la voix sans-fil. Pas d\'interférences avec WiFi/Bluetooth. Utilisé pour les systèmes de conférence, intercom et certains micros sans-fil.'**
  String get rfUhfBand5Desc;

  /// No description provided for @rfUhfBand5Examples.
  ///
  /// In fr, this message translates to:
  /// **'Bosch CCS-800 Ultro, Sennheiser SpeechLine, Beyerdynamic Quinta'**
  String get rfUhfBand5Examples;

  /// No description provided for @rfUhfBand6Name.
  ///
  /// In fr, this message translates to:
  /// **'Micro num. 2.4 GHz'**
  String get rfUhfBand6Name;

  /// No description provided for @rfUhfBand6Status.
  ///
  /// In fr, this message translates to:
  /// **'Libre (100 mW)'**
  String get rfUhfBand6Status;

  /// No description provided for @rfUhfBand6Desc.
  ///
  /// In fr, this message translates to:
  /// **'Bande ISM, libre sans autorisation. Sujette aux interférences WiFi et Bluetooth. Convient aux petites productions, éviter les grandes salles avec WiFi dense.'**
  String get rfUhfBand6Desc;

  /// No description provided for @rfUhfBand6Examples.
  ///
  /// In fr, this message translates to:
  /// **'Shure GLX-D, Line6 XD-V, Sennheiser EW-D (variante 2.4G)'**
  String get rfUhfBand6Examples;

  /// No description provided for @rfUhfBand7Name.
  ///
  /// In fr, this message translates to:
  /// **'Sans-fil 5.8 GHz'**
  String get rfUhfBand7Name;

  /// No description provided for @rfUhfBand7Status.
  ///
  /// In fr, this message translates to:
  /// **'Limité (FR)'**
  String get rfUhfBand7Status;

  /// No description provided for @rfUhfBand7Desc.
  ///
  /// In fr, this message translates to:
  /// **'Non disponible pour WiFi en France, mais certains systèmes propriétaires utilisent cette plage. Vérifier la conformité ARCEP de chaque équipement.'**
  String get rfUhfBand7Desc;

  /// No description provided for @rfUhfBand7Examples.
  ///
  /// In fr, this message translates to:
  /// **'Certains systèmes IEM haut de gamme'**
  String get rfUhfBand7Examples;

  /// No description provided for @rfUhfOverviewSublabel1.
  ///
  /// In fr, this message translates to:
  /// **'VHF / transitoire'**
  String get rfUhfOverviewSublabel1;

  /// No description provided for @rfUhfOverviewSublabel2.
  ///
  /// In fr, this message translates to:
  /// **'UHF pro (autorisation)'**
  String get rfUhfOverviewSublabel2;

  /// No description provided for @rfUhfOverviewSublabel3.
  ///
  /// In fr, this message translates to:
  /// **'4G/5G — INTERDIT'**
  String get rfUhfOverviewSublabel3;

  /// No description provided for @rfUhfOverviewSublabel4.
  ///
  /// In fr, this message translates to:
  /// **'ISM libre'**
  String get rfUhfOverviewSublabel4;

  /// No description provided for @rfUhfOverviewSublabel5.
  ///
  /// In fr, this message translates to:
  /// **'DECT libre'**
  String get rfUhfOverviewSublabel5;

  /// No description provided for @rfUhfOverviewSublabel6.
  ///
  /// In fr, this message translates to:
  /// **'ISM (WiFi + micros num.)'**
  String get rfUhfOverviewSublabel6;

  /// No description provided for @rfUhfTip1.
  ///
  /// In fr, this message translates to:
  /// **'470–694 MHz : optimal pour les productions pro. Large choix de fréquences, bon comportement RF. Déclarer l\'usage à l\'ANFR pour les événements professionnels.'**
  String get rfUhfTip1;

  /// No description provided for @rfUhfTip2.
  ///
  /// In fr, this message translates to:
  /// **'Vérifiez impérativement que votre matériel est hors bande 694–790 MHz. Les anciens systèmes non revendus post-2017 sont illégaux sur scène.'**
  String get rfUhfTip2;

  /// No description provided for @rfUhfTip3.
  ///
  /// In fr, this message translates to:
  /// **'DECT (1880–1900 MHz) est idéal pour les systèmes de conférence : bande dédiée, pas d\'interférences WiFi/BT.'**
  String get rfUhfTip3;

  /// No description provided for @rfUhfTip4.
  ///
  /// In fr, this message translates to:
  /// **'Les systèmes 2.4 GHz sont pratiques mais sensibles aux environnements WiFi denses. À éviter dans les grandes salles de congrès.'**
  String get rfUhfTip4;

  /// No description provided for @rfLegendPro.
  ///
  /// In fr, this message translates to:
  /// **'Pro (autorisation)'**
  String get rfLegendPro;

  /// No description provided for @rfLegendFree.
  ///
  /// In fr, this message translates to:
  /// **'Libre'**
  String get rfLegendFree;

  /// No description provided for @rfLegendForbidden.
  ///
  /// In fr, this message translates to:
  /// **'Interdit'**
  String get rfLegendForbidden;

  /// No description provided for @rfWifi24PageTitle.
  ///
  /// In fr, this message translates to:
  /// **'WiFi 2.4 GHz'**
  String get rfWifi24PageTitle;

  /// No description provided for @rfWifi24SpectrumTitle.
  ///
  /// In fr, this message translates to:
  /// **'Spectre 2.4 GHz — chevauchements'**
  String get rfWifi24SpectrumTitle;

  /// No description provided for @rfWifi24SimulateTitle.
  ///
  /// In fr, this message translates to:
  /// **'Simuler la coexistence'**
  String get rfWifi24SimulateTitle;

  /// No description provided for @rfWifi24SelectChannels.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionnez les canaux utilisés dans votre environnement :'**
  String get rfWifi24SelectChannels;

  /// No description provided for @rfWifi24ConflictWarning.
  ///
  /// In fr, this message translates to:
  /// **'⚠️ Les canaux sélectionnés se chevauchent — risque d\'interférences mutuelles.'**
  String get rfWifi24ConflictWarning;

  /// No description provided for @rfWifi24ChannelTableTitle.
  ///
  /// In fr, this message translates to:
  /// **'Tableau des canaux'**
  String get rfWifi24ChannelTableTitle;

  /// No description provided for @rfWifi24BestPractices.
  ///
  /// In fr, this message translates to:
  /// **'Bonnes pratiques'**
  String get rfWifi24BestPractices;

  /// No description provided for @rfWifi24LegendNonOverlap.
  ///
  /// In fr, this message translates to:
  /// **'Canal non-chevauchant'**
  String get rfWifi24LegendNonOverlap;

  /// No description provided for @rfWifi24LegendOk.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionné OK'**
  String get rfWifi24LegendOk;

  /// No description provided for @rfWifi24LegendConflict.
  ///
  /// In fr, this message translates to:
  /// **'Conflit'**
  String get rfWifi24LegendConflict;

  /// No description provided for @rfWifi24HdrChannel.
  ///
  /// In fr, this message translates to:
  /// **'Canal'**
  String get rfWifi24HdrChannel;

  /// No description provided for @rfWifi24HdrCenter.
  ///
  /// In fr, this message translates to:
  /// **'Centre'**
  String get rfWifi24HdrCenter;

  /// No description provided for @rfWifi24HdrStart.
  ///
  /// In fr, this message translates to:
  /// **'Début'**
  String get rfWifi24HdrStart;

  /// No description provided for @rfWifi24HdrEnd.
  ///
  /// In fr, this message translates to:
  /// **'Fin'**
  String get rfWifi24HdrEnd;

  /// No description provided for @rfWifi24Tip1.
  ///
  /// In fr, this message translates to:
  /// **'Utilisez toujours les canaux 1, 6 et 11 pour 3 réseaux WiFi non-chevauchants.'**
  String get rfWifi24Tip1;

  /// No description provided for @rfWifi24Tip2.
  ///
  /// In fr, this message translates to:
  /// **'Avec des canaux à 20 MHz, les canaux 1, 5, 9 et 13 sont également non-chevauchants.'**
  String get rfWifi24Tip2;

  /// No description provided for @rfWifi24Tip3.
  ///
  /// In fr, this message translates to:
  /// **'Le WiFi 2.4 GHz partage la bande avec Bluetooth, Zigbee et les micros numériques 2.4 GHz.'**
  String get rfWifi24Tip3;

  /// No description provided for @rfWifi24Tip4.
  ///
  /// In fr, this message translates to:
  /// **'En zone dense, préférez le 5 GHz (moins encombré) pour les équipements sensibles.'**
  String get rfWifi24Tip4;

  /// No description provided for @rfWifi5PageTitle.
  ///
  /// In fr, this message translates to:
  /// **'WiFi 5 GHz'**
  String get rfWifi5PageTitle;

  /// No description provided for @rfWifi5RegulationTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réglementation France (ARCEP)'**
  String get rfWifi5RegulationTitle;

  /// No description provided for @rfWifi5BandsAvailable.
  ///
  /// In fr, this message translates to:
  /// **'Bandes disponibles'**
  String get rfWifi5BandsAvailable;

  /// No description provided for @rfWifi5Unii3Forbidden.
  ///
  /// In fr, this message translates to:
  /// **'UNII-3 (5725–5850)'**
  String get rfWifi5Unii3Forbidden;

  /// No description provided for @rfWifi5ForbiddenLabel.
  ///
  /// In fr, this message translates to:
  /// **'Interdit'**
  String get rfWifi5ForbiddenLabel;

  /// No description provided for @rfWifi5DfsNote.
  ///
  /// In fr, this message translates to:
  /// **'⚠️ DFS (Dynamic Frequency Selection) : les canaux UNII-2A et 2C nécessitent la détection radar. L\'équipement peut changer automatiquement de canal si un radar est détecté.'**
  String get rfWifi5DfsNote;

  /// No description provided for @rfWifi5ChannelWidthsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Largeurs de canal'**
  String get rfWifi5ChannelWidthsTitle;

  /// No description provided for @rfWifi5Bw20.
  ///
  /// In fr, this message translates to:
  /// **'Compatibilité max, débit limité'**
  String get rfWifi5Bw20;

  /// No description provided for @rfWifi5Bw40.
  ///
  /// In fr, this message translates to:
  /// **'2 canaux liés — 802.11n'**
  String get rfWifi5Bw40;

  /// No description provided for @rfWifi5Bw80.
  ///
  /// In fr, this message translates to:
  /// **'4 canaux liés — 802.11ac/ax'**
  String get rfWifi5Bw80;

  /// No description provided for @rfWifi5Bw160.
  ///
  /// In fr, this message translates to:
  /// **'8 canaux liés — 802.11ax seulement'**
  String get rfWifi5Bw160;

  /// No description provided for @rfWifi5NonOverlapTitle.
  ///
  /// In fr, this message translates to:
  /// **'Canaux non-chevauchants à 80 MHz (France)'**
  String get rfWifi5NonOverlapTitle;

  /// No description provided for @rfWifi5NonOverlapFor3.
  ///
  /// In fr, this message translates to:
  /// **'Pour 3 réseaux 80 MHz sans chevauchement (France) :'**
  String get rfWifi5NonOverlapFor3;

  /// No description provided for @rfWifi5MaxNetworks.
  ///
  /// In fr, this message translates to:
  /// **'→ Jusqu\'à 6 réseaux 80 MHz disponibles sur UNII-2C seul.'**
  String get rfWifi5MaxNetworks;

  /// No description provided for @rfWifi5ChannelsMhz.
  ///
  /// In fr, this message translates to:
  /// **'Canaux (20 MHz)'**
  String get rfWifi5ChannelsMhz;

  /// No description provided for @rfWifi5ForbiddenFR.
  ///
  /// In fr, this message translates to:
  /// **'Interdit FR'**
  String get rfWifi5ForbiddenFR;

  /// No description provided for @rfWifi5Indoor.
  ///
  /// In fr, this message translates to:
  /// **'Indoor'**
  String get rfWifi5Indoor;

  /// No description provided for @rfWifiScanTitle.
  ///
  /// In fr, this message translates to:
  /// **'Scan WiFi'**
  String get rfWifiScanTitle;

  /// No description provided for @rfWifiScanPlatformInfo.
  ///
  /// In fr, this message translates to:
  /// **'Scan actif sur Android (permission localisation requise). Sur iOS, seul le réseau connecté est visible.'**
  String get rfWifiScanPlatformInfo;

  /// No description provided for @rfWifiScanStart.
  ///
  /// In fr, this message translates to:
  /// **'Lancer le scan'**
  String get rfWifiScanStart;

  /// No description provided for @rfWifiScanInProgress.
  ///
  /// In fr, this message translates to:
  /// **'Scan en cours…'**
  String get rfWifiScanInProgress;

  /// No description provided for @rfWifiScanGroupedTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Vue liste'**
  String get rfWifiScanGroupedTooltip;

  /// No description provided for @rfWifiScanFlatTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Vue groupée'**
  String get rfWifiScanFlatTooltip;

  /// No description provided for @rfWifiScanNoResults.
  ///
  /// In fr, this message translates to:
  /// **'Lance le scan pour voir les réseaux voisins.'**
  String get rfWifiScanNoResults;

  /// No description provided for @rfWifiScanOccupation.
  ///
  /// In fr, this message translates to:
  /// **'Occupation canaux 2.4 GHz'**
  String get rfWifiScanOccupation;

  /// No description provided for @rfWifiScanNonOverlapNote.
  ///
  /// In fr, this message translates to:
  /// **'Canaux en gras (1, 6, 11) = non-chevauchants'**
  String get rfWifiScanNonOverlapNote;

  /// No description provided for @rfWifiScanHidden.
  ///
  /// In fr, this message translates to:
  /// **'(réseau caché)'**
  String get rfWifiScanHidden;

  /// No description provided for @rfWifiScanNetworks24.
  ///
  /// In fr, this message translates to:
  /// **'{count} réseaux'**
  String rfWifiScanNetworks24(int count);

  /// No description provided for @rfWifiScanNetworks5.
  ///
  /// In fr, this message translates to:
  /// **'{count} réseaux'**
  String rfWifiScanNetworks5(int count);

  /// No description provided for @rfWifiScanTotal.
  ///
  /// In fr, this message translates to:
  /// **'{count} total'**
  String rfWifiScanTotal(int count);

  /// No description provided for @rfWifiScanSub24.
  ///
  /// In fr, this message translates to:
  /// **'2.4 GHz'**
  String get rfWifiScanSub24;

  /// No description provided for @rfWifiScanSub5.
  ///
  /// In fr, this message translates to:
  /// **'5 GHz'**
  String get rfWifiScanSub5;

  /// No description provided for @rfWifiScanSubTotal.
  ///
  /// In fr, this message translates to:
  /// **'réseaux'**
  String get rfWifiScanSubTotal;

  /// No description provided for @rfWifiRssiExcellent.
  ///
  /// In fr, this message translates to:
  /// **'Excellent'**
  String get rfWifiRssiExcellent;

  /// No description provided for @rfWifiRssiBon.
  ///
  /// In fr, this message translates to:
  /// **'Bon'**
  String get rfWifiRssiBon;

  /// No description provided for @rfWifiRssiMoyen.
  ///
  /// In fr, this message translates to:
  /// **'Moyen'**
  String get rfWifiRssiMoyen;

  /// No description provided for @rfWifiRssiFaible.
  ///
  /// In fr, this message translates to:
  /// **'Faible'**
  String get rfWifiRssiFaible;

  /// No description provided for @audioLevelInputDbu.
  ///
  /// In fr, this message translates to:
  /// **'Valeur en dBu'**
  String get audioLevelInputDbu;

  /// No description provided for @audioLevelInputDbv.
  ///
  /// In fr, this message translates to:
  /// **'Valeur en dBV'**
  String get audioLevelInputDbv;

  /// No description provided for @audioLevelInputVrms.
  ///
  /// In fr, this message translates to:
  /// **'Tension RMS'**
  String get audioLevelInputVrms;

  /// No description provided for @audioLevelDbfsNote.
  ///
  /// In fr, this message translates to:
  /// **'* dBFS relatif à +24 dBu = 0 dBFS (valeur typique — varie selon le système)'**
  String get audioLevelDbfsNote;

  /// No description provided for @audioGainStagingTip1.
  ///
  /// In fr, this message translates to:
  /// **'Visez +4 dBu en nominal sur chaque étage. Gardez ~18 dB de headroom avant le clip.'**
  String get audioGainStagingTip1;

  /// No description provided for @audioGainStagingTip2.
  ///
  /// In fr, this message translates to:
  /// **'La différence consumer/pro (+4 dBu vs −10 dBV) est de ~11.8 dB — compensez le gain à chaque interface.'**
  String get audioGainStagingTip2;

  /// No description provided for @audioGainStagingTip3.
  ///
  /// In fr, this message translates to:
  /// **'Ligne symétrique (XLR) : +4 dBu. Ligne asymétrique (Jack TS) : −10 dBV. DI box pour adapter impédance et niveau.'**
  String get audioGainStagingTip3;

  /// No description provided for @audioGainStagingTip4.
  ///
  /// In fr, this message translates to:
  /// **'dBu = dB rapporté à 0.775 V (600 Ω). dBV = dB rapporté à 1 V. dBV = dBu − 2.218.'**
  String get audioGainStagingTip4;

  /// No description provided for @audioDiffTipEqual.
  ///
  /// In fr, this message translates to:
  /// **'Sources quasi-égales : gain de ~+3 dB sur la plus forte.'**
  String get audioDiffTipEqual;

  /// No description provided for @audioDiffTipSmall.
  ///
  /// In fr, this message translates to:
  /// **'Différence de {diff} dB : la plus faible contribue peu.'**
  String audioDiffTipSmall(String diff);

  /// No description provided for @audioDiffTipMedium.
  ///
  /// In fr, this message translates to:
  /// **'Différence de {diff} dB : gain limité à ~{gain} dB sur la source dominante.'**
  String audioDiffTipMedium(String diff, String gain);

  /// No description provided for @audioDiffTipLarge.
  ///
  /// In fr, this message translates to:
  /// **'Différence > 10 dB : la source faible est négligeable. Gain ≈ +0 dB.'**
  String get audioDiffTipLarge;

  /// No description provided for @audioIncoherentShortLabel.
  ///
  /// In fr, this message translates to:
  /// **'Incoh. : '**
  String get audioIncoherentShortLabel;

  /// No description provided for @audioCoherentShortLabel.
  ///
  /// In fr, this message translates to:
  /// **'Cohér. : '**
  String get audioCoherentShortLabel;

  /// No description provided for @audioAtDistance.
  ///
  /// In fr, this message translates to:
  /// **'À {dist} m'**
  String audioAtDistance(String dist);

  /// No description provided for @rfWifiScanErrLocationRequired.
  ///
  /// In fr, this message translates to:
  /// **'Permission de localisation requise pour le scan WiFi.'**
  String get rfWifiScanErrLocationRequired;

  /// No description provided for @rfWifiScanErrLocationDenied.
  ///
  /// In fr, this message translates to:
  /// **'Permission de localisation refusée. Activez-la dans les réglages.'**
  String get rfWifiScanErrLocationDenied;

  /// No description provided for @rfWifiScanErrLocationDisabled.
  ///
  /// In fr, this message translates to:
  /// **'Service de localisation désactivé. Activez-le sur l\'appareil.'**
  String get rfWifiScanErrLocationDisabled;

  /// No description provided for @rfWifiScanErrNotSupported.
  ///
  /// In fr, this message translates to:
  /// **'Scan WiFi non supporté sur cet appareil ou cette version d\'OS.'**
  String get rfWifiScanErrNotSupported;

  /// No description provided for @rfWifiScanErrFailed.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de démarrer le scan.'**
  String get rfWifiScanErrFailed;

  /// No description provided for @rfWifiScanErrDefault.
  ///
  /// In fr, this message translates to:
  /// **'Scan impossible sur cet appareil.'**
  String get rfWifiScanErrDefault;

  /// No description provided for @rfWifiScanErrReadResults.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de lire les résultats du scan.'**
  String get rfWifiScanErrReadResults;

  /// No description provided for @rfWifiScanErrGeneric.
  ///
  /// In fr, this message translates to:
  /// **'Erreur lors du scan : {error}'**
  String rfWifiScanErrGeneric(String error);

  /// No description provided for @homeNetworkTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réseau'**
  String get homeNetworkTitle;

  /// No description provided for @homeNetworkSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Scan réseau local, Art-Net, sACN / E1.31.'**
  String get homeNetworkSubtitle;

  /// No description provided for @networkPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réseau'**
  String get networkPageTitle;

  /// No description provided for @networkScanCardTitle.
  ///
  /// In fr, this message translates to:
  /// **'Scan réseau'**
  String get networkScanCardTitle;

  /// No description provided for @networkScanCardSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Détecter les appareils actifs sur le réseau local.'**
  String get networkScanCardSubtitle;

  /// No description provided for @networkArtNetCardTitle.
  ///
  /// In fr, this message translates to:
  /// **'Visualizer Art-Net'**
  String get networkArtNetCardTitle;

  /// No description provided for @networkArtNetAddressingTitle.
  ///
  /// In fr, this message translates to:
  /// **'Adressage Art-Net'**
  String get networkArtNetAddressingTitle;

  /// No description provided for @networkArtNetToPortTitle.
  ///
  /// In fr, this message translates to:
  /// **'Net / Sub-Net / Universe → Port-Address'**
  String get networkArtNetToPortTitle;

  /// No description provided for @networkArtNetFromPortTitle.
  ///
  /// In fr, this message translates to:
  /// **'Port-Address → Net / Sub-Net / Universe'**
  String get networkArtNetFromPortTitle;

  /// No description provided for @networkArtNetNetLabel.
  ///
  /// In fr, this message translates to:
  /// **'Net'**
  String get networkArtNetNetLabel;

  /// No description provided for @networkArtNetSubNetLabel.
  ///
  /// In fr, this message translates to:
  /// **'Sub-Net'**
  String get networkArtNetSubNetLabel;

  /// No description provided for @networkArtNetUniverseLabel.
  ///
  /// In fr, this message translates to:
  /// **'Universe'**
  String get networkArtNetUniverseLabel;

  /// No description provided for @networkArtNetPortAddressLabel.
  ///
  /// In fr, this message translates to:
  /// **'Port-Address'**
  String get networkArtNetPortAddressLabel;

  /// No description provided for @networkArtNetEmptyState.
  ///
  /// In fr, this message translates to:
  /// **'Renseignez des valeurs valides pour voir le résultat.'**
  String get networkArtNetEmptyState;

  /// No description provided for @networkArtNetFormulaNote.
  ///
  /// In fr, this message translates to:
  /// **'Port-Address (15 bits) = (Net « 8) | (Sub-Net « 4) | Universe — Net 0-127, Sub-Net 0-15, Universe 0-15, Port-Address 0-32767 (spec Art-Net 4).'**
  String get networkArtNetFormulaNote;

  /// No description provided for @networkArtNetCardSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Écoute et analyse des paquets ArtDMX en temps réel.'**
  String get networkArtNetCardSubtitle;

  /// No description provided for @networkSacnCardTitle.
  ///
  /// In fr, this message translates to:
  /// **'Visualizer sACN / E1.31'**
  String get networkSacnCardTitle;

  /// No description provided for @networkSacnCardSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Écoute et analyse des paquets sACN / E1.31 en temps réel.'**
  String get networkSacnCardSubtitle;

  /// No description provided for @networkComingSoon.
  ///
  /// In fr, this message translates to:
  /// **'À venir'**
  String get networkComingSoon;

  /// No description provided for @networkFutureLuminex.
  ///
  /// In fr, this message translates to:
  /// **'Monitoring Luminex'**
  String get networkFutureLuminex;

  /// No description provided for @networkFutureMaNet.
  ///
  /// In fr, this message translates to:
  /// **'Détection MA-Net'**
  String get networkFutureMaNet;

  /// No description provided for @networkFutureAlarms.
  ///
  /// In fr, this message translates to:
  /// **'Alarmes réseau'**
  String get networkFutureAlarms;

  /// No description provided for @networkFutureSnapshots.
  ///
  /// In fr, this message translates to:
  /// **'Snapshots réseau'**
  String get networkFutureSnapshots;

  /// No description provided for @networkFutureExport.
  ///
  /// In fr, this message translates to:
  /// **'Export PDF / CSV'**
  String get networkFutureExport;

  /// No description provided for @networkScanTitle.
  ///
  /// In fr, this message translates to:
  /// **'Scan réseau'**
  String get networkScanTitle;

  /// No description provided for @networkPoeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Calculateur PoE'**
  String get networkPoeTitle;

  /// No description provided for @networkFiberTitle.
  ///
  /// In fr, this message translates to:
  /// **'Budget de Liaison Fibre'**
  String get networkFiberTitle;

  /// No description provided for @networkSubnetTitle.
  ///
  /// In fr, this message translates to:
  /// **'Calculateur de Sous-réseau'**
  String get networkSubnetTitle;

  /// No description provided for @networkSubnetIpLabel.
  ///
  /// In fr, this message translates to:
  /// **'Adresse IP'**
  String get networkSubnetIpLabel;

  /// No description provided for @networkSubnetPrefixLabel.
  ///
  /// In fr, this message translates to:
  /// **'Masque (CIDR)'**
  String get networkSubnetPrefixLabel;

  /// No description provided for @networkSubnetNetworkLabel.
  ///
  /// In fr, this message translates to:
  /// **'Adresse réseau'**
  String get networkSubnetNetworkLabel;

  /// No description provided for @networkSubnetBroadcastLabel.
  ///
  /// In fr, this message translates to:
  /// **'Adresse de broadcast'**
  String get networkSubnetBroadcastLabel;

  /// No description provided for @networkSubnetNetmaskLabel.
  ///
  /// In fr, this message translates to:
  /// **'Masque de sous-réseau'**
  String get networkSubnetNetmaskLabel;

  /// No description provided for @networkSubnetWildcardLabel.
  ///
  /// In fr, this message translates to:
  /// **'Masque générique (wildcard)'**
  String get networkSubnetWildcardLabel;

  /// No description provided for @networkSubnetFirstHostLabel.
  ///
  /// In fr, this message translates to:
  /// **'Première IP utilisable'**
  String get networkSubnetFirstHostLabel;

  /// No description provided for @networkSubnetLastHostLabel.
  ///
  /// In fr, this message translates to:
  /// **'Dernière IP utilisable'**
  String get networkSubnetLastHostLabel;

  /// No description provided for @networkSubnetHostCountLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nombre d\'hôtes utilisables'**
  String get networkSubnetHostCountLabel;

  /// No description provided for @networkSubnetInvalidIp.
  ///
  /// In fr, this message translates to:
  /// **'Adresse IP invalide (format attendu : 192.168.1.0)'**
  String get networkSubnetInvalidIp;

  /// No description provided for @networkSubnetDivideTitle.
  ///
  /// In fr, this message translates to:
  /// **'Diviser en sous-réseaux égaux'**
  String get networkSubnetDivideTitle;

  /// No description provided for @networkSubnetDivideNote.
  ///
  /// In fr, this message translates to:
  /// **'Choisis en combien de sous-réseaux diviser ce réseau.'**
  String get networkSubnetDivideNote;

  /// No description provided for @networkFiberTypeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Type de fibre'**
  String get networkFiberTypeLabel;

  /// No description provided for @networkFiberDistanceLabel.
  ///
  /// In fr, this message translates to:
  /// **'Distance'**
  String get networkFiberDistanceLabel;

  /// No description provided for @networkFiberAttenuationLabel.
  ///
  /// In fr, this message translates to:
  /// **'Atténuation (par km)'**
  String get networkFiberAttenuationLabel;

  /// No description provided for @networkFiberAdditionalLossLabel.
  ///
  /// In fr, this message translates to:
  /// **'Pertes connecteurs & épissures'**
  String get networkFiberAdditionalLossLabel;

  /// No description provided for @networkFiberBudgetLabel.
  ///
  /// In fr, this message translates to:
  /// **'Budget de liaison émetteur/récepteur (optionnel)'**
  String get networkFiberBudgetLabel;

  /// No description provided for @networkFiberTotalTitle.
  ///
  /// In fr, this message translates to:
  /// **'Perte totale de la liaison'**
  String get networkFiberTotalTitle;

  /// No description provided for @networkFiberMarginLabel.
  ///
  /// In fr, this message translates to:
  /// **'Marge restante'**
  String get networkFiberMarginLabel;

  /// No description provided for @networkFiberWarningOver.
  ///
  /// In fr, this message translates to:
  /// **'Marge dépassée : la liaison risque de ne pas fonctionner correctement sur cette distance.'**
  String get networkFiberWarningOver;

  /// No description provided for @networkFiberFormulaNote.
  ///
  /// In fr, this message translates to:
  /// **'Perte totale = atténuation × distance + pertes connecteurs/épissures'**
  String get networkFiberFormulaNote;

  /// No description provided for @networkPoeBudgetLabel.
  ///
  /// In fr, this message translates to:
  /// **'Budget de l\'injecteur / switch'**
  String get networkPoeBudgetLabel;

  /// No description provided for @networkPoeDeviceLabel.
  ///
  /// In fr, this message translates to:
  /// **'Appareil'**
  String get networkPoeDeviceLabel;

  /// No description provided for @networkPoeClassLabel.
  ///
  /// In fr, this message translates to:
  /// **'Classe PoE'**
  String get networkPoeClassLabel;

  /// No description provided for @networkPoeClassManual.
  ///
  /// In fr, this message translates to:
  /// **'Manuel (valeur libre)'**
  String get networkPoeClassManual;

  /// No description provided for @networkPoeClassWord.
  ///
  /// In fr, this message translates to:
  /// **'Classe'**
  String get networkPoeClassWord;

  /// No description provided for @networkPoeDevicePowerLabel.
  ///
  /// In fr, this message translates to:
  /// **'Puissance'**
  String get networkPoeDevicePowerLabel;

  /// No description provided for @networkPoeAddDevice.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter un appareil'**
  String get networkPoeAddDevice;

  /// No description provided for @networkPoeTotalTitle.
  ///
  /// In fr, this message translates to:
  /// **'Consommation totale'**
  String get networkPoeTotalTitle;

  /// No description provided for @networkPoeRemainingLabel.
  ///
  /// In fr, this message translates to:
  /// **'Budget restant'**
  String get networkPoeRemainingLabel;

  /// No description provided for @networkPoeEmptyState.
  ///
  /// In fr, this message translates to:
  /// **'Ajoute au moins un appareil pour calculer.'**
  String get networkPoeEmptyState;

  /// No description provided for @networkPoeWarningOver.
  ///
  /// In fr, this message translates to:
  /// **'Budget dépassé : retire des appareils ou choisis un switch/injecteur plus puissant.'**
  String get networkPoeWarningOver;

  /// No description provided for @networkPoeFormulaNote.
  ///
  /// In fr, this message translates to:
  /// **'Consommation totale = somme des appareils. Prévois une marge d\'environ 10 à 20 % sous le budget total.'**
  String get networkPoeFormulaNote;

  /// No description provided for @networkScanStartButton.
  ///
  /// In fr, this message translates to:
  /// **'Lancer le scan'**
  String get networkScanStartButton;

  /// No description provided for @networkScanStopButton.
  ///
  /// In fr, this message translates to:
  /// **'Arrêter le scan'**
  String get networkScanStopButton;

  /// No description provided for @networkScanScanning.
  ///
  /// In fr, this message translates to:
  /// **'Scan en cours…'**
  String get networkScanScanning;

  /// No description provided for @networkScanProgress.
  ///
  /// In fr, this message translates to:
  /// **'{done} / {total} IP scannées'**
  String networkScanProgress(int done, int total);

  /// No description provided for @networkScanDevicesFound.
  ///
  /// In fr, this message translates to:
  /// **'{count} appareil(s) trouvé(s)'**
  String networkScanDevicesFound(int count);

  /// No description provided for @networkScanNoDevicesFound.
  ///
  /// In fr, this message translates to:
  /// **'Aucun appareil trouvé sur ce réseau.'**
  String get networkScanNoDevicesFound;

  /// No description provided for @networkScanNoNetwork.
  ///
  /// In fr, this message translates to:
  /// **'Aucun réseau local (Wi-Fi) détecté. Connectez-vous à un réseau.'**
  String get networkScanNoNetwork;

  /// No description provided for @networkScanIosLimitation.
  ///
  /// In fr, this message translates to:
  /// **'Sur iOS, les adresses MAC et le fabricant ne sont pas accessibles par les apps (restriction Apple).'**
  String get networkScanIosLimitation;

  /// No description provided for @networkScanLocalIp.
  ///
  /// In fr, this message translates to:
  /// **'IP locale'**
  String get networkScanLocalIp;

  /// No description provided for @networkScanSubnet.
  ///
  /// In fr, this message translates to:
  /// **'Masque'**
  String get networkScanSubnet;

  /// No description provided for @networkScanStatusOnline.
  ///
  /// In fr, this message translates to:
  /// **'En ligne'**
  String get networkScanStatusOnline;

  /// No description provided for @networkScanResponseMs.
  ///
  /// In fr, this message translates to:
  /// **'{ms} ms'**
  String networkScanResponseMs(int ms);

  /// No description provided for @networkScanPermissionDenied.
  ///
  /// In fr, this message translates to:
  /// **'Permission réseau refusée. Vérifiez les autorisations.'**
  String get networkScanPermissionDenied;

  /// No description provided for @networkScanErrorGeneric.
  ///
  /// In fr, this message translates to:
  /// **'Erreur réseau. Vérifiez votre connexion.'**
  String get networkScanErrorGeneric;

  /// No description provided for @networkScanHint.
  ///
  /// In fr, this message translates to:
  /// **'Appuyez sur « Lancer le scan » pour détecter les appareils.'**
  String get networkScanHint;

  /// No description provided for @artnetTitle.
  ///
  /// In fr, this message translates to:
  /// **'Visualizer Art-Net'**
  String get artnetTitle;

  /// No description provided for @artnetStartButton.
  ///
  /// In fr, this message translates to:
  /// **'Démarrer l\'écoute'**
  String get artnetStartButton;

  /// No description provided for @artnetStopButton.
  ///
  /// In fr, this message translates to:
  /// **'Arrêter'**
  String get artnetStopButton;

  /// No description provided for @artnetListening.
  ///
  /// In fr, this message translates to:
  /// **'Écoute — Port 6454'**
  String get artnetListening;

  /// No description provided for @artnetNotListening.
  ///
  /// In fr, this message translates to:
  /// **'Inactif'**
  String get artnetNotListening;

  /// No description provided for @artnetNoPackets.
  ///
  /// In fr, this message translates to:
  /// **'En attente de paquets Art-Net…'**
  String get artnetNoPackets;

  /// No description provided for @artnetUniversesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Univers reçus'**
  String get artnetUniversesTitle;

  /// No description provided for @artnetUniverseTitle.
  ///
  /// In fr, this message translates to:
  /// **'Univers {universe}'**
  String artnetUniverseTitle(int universe);

  /// No description provided for @artnetSourceIp.
  ///
  /// In fr, this message translates to:
  /// **'Source : {ip}'**
  String artnetSourceIp(Object ip);

  /// No description provided for @artnetPackets.
  ///
  /// In fr, this message translates to:
  /// **'{count} paquets'**
  String artnetPackets(int count);

  /// No description provided for @artnetFps.
  ///
  /// In fr, this message translates to:
  /// **'{fps} fps'**
  String artnetFps(Object fps);

  /// No description provided for @artnetShowActiveOnly.
  ///
  /// In fr, this message translates to:
  /// **'Canaux actifs uniquement'**
  String get artnetShowActiveOnly;

  /// No description provided for @artnetActiveCount.
  ///
  /// In fr, this message translates to:
  /// **'{count} canaux actifs'**
  String artnetActiveCount(int count);

  /// No description provided for @artnetPlatformInfo.
  ///
  /// In fr, this message translates to:
  /// **'Art-Net — UDP port 6454. Doit être sur le même réseau que la source.'**
  String get artnetPlatformInfo;

  /// No description provided for @artnetErrorBind.
  ///
  /// In fr, this message translates to:
  /// **'Impossible d\'ouvrir le socket UDP. Vérifiez les permissions réseau.'**
  String get artnetErrorBind;

  /// No description provided for @sacnTitle.
  ///
  /// In fr, this message translates to:
  /// **'Visualizer sACN'**
  String get sacnTitle;

  /// No description provided for @sacnStartButton.
  ///
  /// In fr, this message translates to:
  /// **'Démarrer l\'écoute'**
  String get sacnStartButton;

  /// No description provided for @sacnStopButton.
  ///
  /// In fr, this message translates to:
  /// **'Arrêter'**
  String get sacnStopButton;

  /// No description provided for @sacnListening.
  ///
  /// In fr, this message translates to:
  /// **'Écoute — Port 5568'**
  String get sacnListening;

  /// No description provided for @sacnNotListening.
  ///
  /// In fr, this message translates to:
  /// **'Inactif'**
  String get sacnNotListening;

  /// No description provided for @sacnNoPackets.
  ///
  /// In fr, this message translates to:
  /// **'En attente de paquets sACN…'**
  String get sacnNoPackets;

  /// No description provided for @sacnUniversesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Univers reçus'**
  String get sacnUniversesTitle;

  /// No description provided for @sacnUniverseTitle.
  ///
  /// In fr, this message translates to:
  /// **'Univers {universe}'**
  String sacnUniverseTitle(int universe);

  /// No description provided for @sacnSource.
  ///
  /// In fr, this message translates to:
  /// **'Source : {name}'**
  String sacnSource(Object name);

  /// No description provided for @sacnPriority.
  ///
  /// In fr, this message translates to:
  /// **'Priorité : {value}'**
  String sacnPriority(int value);

  /// No description provided for @sacnCid.
  ///
  /// In fr, this message translates to:
  /// **'CID : {cid}'**
  String sacnCid(Object cid);

  /// No description provided for @sacnPackets.
  ///
  /// In fr, this message translates to:
  /// **'{count} paquets'**
  String sacnPackets(int count);

  /// No description provided for @sacnFps.
  ///
  /// In fr, this message translates to:
  /// **'{fps} fps'**
  String sacnFps(Object fps);

  /// No description provided for @sacnShowActiveOnly.
  ///
  /// In fr, this message translates to:
  /// **'Canaux actifs uniquement'**
  String get sacnShowActiveOnly;

  /// No description provided for @sacnActiveCount.
  ///
  /// In fr, this message translates to:
  /// **'{count} canaux actifs'**
  String sacnActiveCount(int count);

  /// No description provided for @sacnPlatformInfo.
  ///
  /// In fr, this message translates to:
  /// **'sACN / E1.31 — UDP port 5568. Multicast 239.255.x.x et unicast supportés.'**
  String get sacnPlatformInfo;

  /// No description provided for @sacnErrorBind.
  ///
  /// In fr, this message translates to:
  /// **'Impossible d\'ouvrir le socket UDP. Vérifiez les permissions réseau.'**
  String get sacnErrorBind;

  /// No description provided for @sacnIosMulticastNote.
  ///
  /// In fr, this message translates to:
  /// **'Sur iOS 14+, le multicast sACN peut nécessiter l\'autorisation d\'accès au réseau local.'**
  String get sacnIosMulticastNote;

  /// No description provided for @diagCardTitle.
  ///
  /// In fr, this message translates to:
  /// **'Diagnostic réseau'**
  String get diagCardTitle;

  /// No description provided for @diagCardSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Analyse automatique du réseau, Art-Net et sACN.'**
  String get diagCardSubtitle;

  /// No description provided for @diagPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Diagnostic réseau'**
  String get diagPageTitle;

  /// No description provided for @diagPlatformInfo.
  ///
  /// In fr, this message translates to:
  /// **'Lance un scan réseau + écoute Art-Net/sACN pendant quelques secondes, puis analyse les problèmes potentiels.'**
  String get diagPlatformInfo;

  /// No description provided for @diagAnalyseButton.
  ///
  /// In fr, this message translates to:
  /// **'Analyser'**
  String get diagAnalyseButton;

  /// No description provided for @diagCancelButton.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get diagCancelButton;

  /// No description provided for @diagClearButton.
  ///
  /// In fr, this message translates to:
  /// **'Effacer'**
  String get diagClearButton;

  /// No description provided for @diagSnapshotButton.
  ///
  /// In fr, this message translates to:
  /// **'Snapshot'**
  String get diagSnapshotButton;

  /// No description provided for @diagScoreLabel.
  ///
  /// In fr, this message translates to:
  /// **'Score santé réseau'**
  String get diagScoreLabel;

  /// No description provided for @diagStatusOk.
  ///
  /// In fr, this message translates to:
  /// **'Réseau OK'**
  String get diagStatusOk;

  /// No description provided for @diagStatusWarning.
  ///
  /// In fr, this message translates to:
  /// **'Attention'**
  String get diagStatusWarning;

  /// No description provided for @diagStatusCritical.
  ///
  /// In fr, this message translates to:
  /// **'Critique'**
  String get diagStatusCritical;

  /// No description provided for @diagAnalysisDate.
  ///
  /// In fr, this message translates to:
  /// **'Analysé le {date}'**
  String diagAnalysisDate(Object date);

  /// No description provided for @diagSeverityInfo.
  ///
  /// In fr, this message translates to:
  /// **'Info'**
  String get diagSeverityInfo;

  /// No description provided for @diagSeverityWarning.
  ///
  /// In fr, this message translates to:
  /// **'Avertissement'**
  String get diagSeverityWarning;

  /// No description provided for @diagSeverityCritical.
  ///
  /// In fr, this message translates to:
  /// **'Critique'**
  String get diagSeverityCritical;

  /// No description provided for @diagScanningNetwork.
  ///
  /// In fr, this message translates to:
  /// **'Scan réseau en cours…'**
  String get diagScanningNetwork;

  /// No description provided for @diagCollectingFlux.
  ///
  /// In fr, this message translates to:
  /// **'Collecte des flux Art-Net / sACN…'**
  String get diagCollectingFlux;

  /// No description provided for @diagAnalyzing.
  ///
  /// In fr, this message translates to:
  /// **'Analyse en cours…'**
  String get diagAnalyzing;

  /// No description provided for @diagScanProgress.
  ///
  /// In fr, this message translates to:
  /// **'{done} / {total} IPs scannées'**
  String diagScanProgress(int done, int total);

  /// No description provided for @diagNoResultYet.
  ///
  /// In fr, this message translates to:
  /// **'Appuyez sur « Analyser » pour lancer le diagnostic réseau.'**
  String get diagNoResultYet;

  /// No description provided for @diagAlertsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Alertes'**
  String get diagAlertsTitle;

  /// No description provided for @diagNoAlerts.
  ///
  /// In fr, this message translates to:
  /// **'Aucune alerte détectée — réseau sain.'**
  String get diagNoAlerts;

  /// No description provided for @diagSnapshotSaved.
  ///
  /// In fr, this message translates to:
  /// **'Snapshot sauvegardé.'**
  String get diagSnapshotSaved;

  /// No description provided for @diagNoLocalIp.
  ///
  /// In fr, this message translates to:
  /// **'Aucune adresse IP locale détectée ou adresse invalide.'**
  String get diagNoLocalIp;

  /// No description provided for @diagNoDevices.
  ///
  /// In fr, this message translates to:
  /// **'Aucun appareil détecté sur le réseau.'**
  String get diagNoDevices;

  /// No description provided for @diagNoArtNet.
  ///
  /// In fr, this message translates to:
  /// **'Aucun flux Art-Net reçu.'**
  String get diagNoArtNet;

  /// No description provided for @diagNoSacn.
  ///
  /// In fr, this message translates to:
  /// **'Aucun flux sACN / E1.31 reçu.'**
  String get diagNoSacn;

  /// No description provided for @diagDuplicateIp.
  ///
  /// In fr, this message translates to:
  /// **'Adresse IP en doublon détectée : {ip}.'**
  String diagDuplicateIp(Object ip);

  /// No description provided for @diagArtNetLowFps.
  ///
  /// In fr, this message translates to:
  /// **'Art-Net Univers {universe} : FPS faible ({fps} fps).'**
  String diagArtNetLowFps(int universe, Object fps);

  /// No description provided for @diagSacnLowFps.
  ///
  /// In fr, this message translates to:
  /// **'sACN Univers {universe} : FPS faible ({fps} fps).'**
  String diagSacnLowFps(int universe, Object fps);

  /// No description provided for @diagZeroDmxChannels.
  ///
  /// In fr, this message translates to:
  /// **'{protocol} Univers {universe} : flux actif mais tous les canaux DMX sont à zéro.'**
  String diagZeroDmxChannels(Object protocol, int universe);

  /// No description provided for @diagManyUnknownDevices.
  ///
  /// In fr, this message translates to:
  /// **'{count} appareil(s) sans nom détectés sur le réseau.'**
  String diagManyUnknownDevices(int count);

  /// No description provided for @ndiCardTitle.
  ///
  /// In fr, this message translates to:
  /// **'Découverte NDI'**
  String get ndiCardTitle;

  /// No description provided for @ndiCardSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Sources NDI / NewTek sur le réseau via mDNS.'**
  String get ndiCardSubtitle;

  /// No description provided for @ndiPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Découverte NDI'**
  String get ndiPageTitle;

  /// No description provided for @ndiStartButton.
  ///
  /// In fr, this message translates to:
  /// **'Démarrer'**
  String get ndiStartButton;

  /// No description provided for @ndiStopButton.
  ///
  /// In fr, this message translates to:
  /// **'Arrêter'**
  String get ndiStopButton;

  /// No description provided for @ndiDiscovering.
  ///
  /// In fr, this message translates to:
  /// **'Recherche en cours…'**
  String get ndiDiscovering;

  /// No description provided for @ndiHint.
  ///
  /// In fr, this message translates to:
  /// **'Appuyez sur « Démarrer » pour rechercher les sources NDI sur le réseau.'**
  String get ndiHint;

  /// No description provided for @ndiNoSources.
  ///
  /// In fr, this message translates to:
  /// **'Aucune source NDI détectée sur ce réseau.'**
  String get ndiNoSources;

  /// No description provided for @ndiIosNote.
  ///
  /// In fr, this message translates to:
  /// **'Sur iOS, la découverte mDNS peut être limitée selon la configuration réseau.'**
  String get ndiIosNote;

  /// No description provided for @ndiSourcesFound.
  ///
  /// In fr, this message translates to:
  /// **'{count} source(s) NDI trouvée(s)'**
  String ndiSourcesFound(int count);

  /// No description provided for @ndiLabelName.
  ///
  /// In fr, this message translates to:
  /// **'Source'**
  String get ndiLabelName;

  /// No description provided for @ndiLabelHost.
  ///
  /// In fr, this message translates to:
  /// **'Machine'**
  String get ndiLabelHost;

  /// No description provided for @ndiLabelIp.
  ///
  /// In fr, this message translates to:
  /// **'IP'**
  String get ndiLabelIp;

  /// No description provided for @ndiLabelPort.
  ///
  /// In fr, this message translates to:
  /// **'Port'**
  String get ndiLabelPort;

  /// No description provided for @ndiLabelService.
  ///
  /// In fr, this message translates to:
  /// **'Service'**
  String get ndiLabelService;

  /// No description provided for @snapshotCardTitle.
  ///
  /// In fr, this message translates to:
  /// **'Snapshots réseau'**
  String get snapshotCardTitle;

  /// No description provided for @snapshotCardSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrez et comparez l\'état du réseau à différents moments.'**
  String get snapshotCardSubtitle;

  /// No description provided for @snapshotPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Snapshots réseau'**
  String get snapshotPageTitle;

  /// No description provided for @snapshotEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucun snapshot enregistré.'**
  String get snapshotEmpty;

  /// No description provided for @snapshotDeleteConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer ce snapshot ?'**
  String get snapshotDeleteConfirm;

  /// No description provided for @snapshotDeleteButton.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer'**
  String get snapshotDeleteButton;

  /// No description provided for @snapshotCompareButton.
  ///
  /// In fr, this message translates to:
  /// **'Comparer'**
  String get snapshotCompareButton;

  /// No description provided for @snapshotComparisonTitle.
  ///
  /// In fr, this message translates to:
  /// **'Comparaison'**
  String get snapshotComparisonTitle;

  /// No description provided for @snapshotComparisonSelectTwo.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionnez deux snapshots à comparer.'**
  String get snapshotComparisonSelectTwo;

  /// No description provided for @snapshotSnapshotA.
  ///
  /// In fr, this message translates to:
  /// **'Snapshot A'**
  String get snapshotSnapshotA;

  /// No description provided for @snapshotSnapshotB.
  ///
  /// In fr, this message translates to:
  /// **'Snapshot B'**
  String get snapshotSnapshotB;

  /// No description provided for @snapshotDevices.
  ///
  /// In fr, this message translates to:
  /// **'Appareils'**
  String get snapshotDevices;

  /// No description provided for @snapshotArtnetUniverses.
  ///
  /// In fr, this message translates to:
  /// **'Univers Art-Net'**
  String get snapshotArtnetUniverses;

  /// No description provided for @snapshotSacnUniverses.
  ///
  /// In fr, this message translates to:
  /// **'Univers sACN'**
  String get snapshotSacnUniverses;

  /// No description provided for @snapshotNdiSources.
  ///
  /// In fr, this message translates to:
  /// **'Sources NDI'**
  String get snapshotNdiSources;

  /// No description provided for @snapshotAlerts.
  ///
  /// In fr, this message translates to:
  /// **'Alertes'**
  String get snapshotAlerts;

  /// No description provided for @snapshotAdded.
  ///
  /// In fr, this message translates to:
  /// **'Apparu(s)'**
  String get snapshotAdded;

  /// No description provided for @snapshotRemoved.
  ///
  /// In fr, this message translates to:
  /// **'Disparu(s)'**
  String get snapshotRemoved;

  /// No description provided for @snapshotNoChanges.
  ///
  /// In fr, this message translates to:
  /// **'Aucune différence entre les deux snapshots.'**
  String get snapshotNoChanges;

  /// No description provided for @snapshotNoScore.
  ///
  /// In fr, this message translates to:
  /// **'Score non disponible'**
  String get snapshotNoScore;

  /// No description provided for @subscriptionCategoryNetworkTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réseau Pro'**
  String get subscriptionCategoryNetworkTitle;

  /// No description provided for @subscriptionCategoryNetworkDescription.
  ///
  /// In fr, this message translates to:
  /// **'Outils réseau avancés : Art-Net, sACN, NDI, diagnostic et snapshots.'**
  String get subscriptionCategoryNetworkDescription;

  /// No description provided for @subscriptionHeadlineNetworkSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Débloque l\'Art-Net viewer, sACN viewer, NDI, le diagnostic réseau et les snapshots.'**
  String get subscriptionHeadlineNetworkSubtitle;

  /// No description provided for @networkPremiumLabel.
  ///
  /// In fr, this message translates to:
  /// **'PREMIUM'**
  String get networkPremiumLabel;

  /// No description provided for @networkPremiumUnlockButton.
  ///
  /// In fr, this message translates to:
  /// **'Débloquer'**
  String get networkPremiumUnlockButton;

  /// No description provided for @networkPremiumBannerText.
  ///
  /// In fr, this message translates to:
  /// **'Art-Net, sACN, NDI, diagnostic et snapshots nécessitent un abonnement Réseau Pro.'**
  String get networkPremiumBannerText;

  /// No description provided for @subscriptionCategoryNetworkShort.
  ///
  /// In fr, this message translates to:
  /// **'RÉSEAU'**
  String get subscriptionCategoryNetworkShort;

  /// No description provided for @dashboardPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Tableau de bord réseau'**
  String get dashboardPageTitle;

  /// No description provided for @dashboardCardTitle.
  ///
  /// In fr, this message translates to:
  /// **'Dashboard réseau'**
  String get dashboardCardTitle;

  /// No description provided for @dashboardCardSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Vue réseau en temps réel'**
  String get dashboardCardSubtitle;

  /// No description provided for @dashboardStatusIdle.
  ///
  /// In fr, this message translates to:
  /// **'En attente'**
  String get dashboardStatusIdle;

  /// No description provided for @dashboardStatusScanning.
  ///
  /// In fr, this message translates to:
  /// **'Scan en cours…'**
  String get dashboardStatusScanning;

  /// No description provided for @dashboardStatusCompleted.
  ///
  /// In fr, this message translates to:
  /// **'Scan terminé'**
  String get dashboardStatusCompleted;

  /// No description provided for @dashboardStatusError.
  ///
  /// In fr, this message translates to:
  /// **'Erreur réseau'**
  String get dashboardStatusError;

  /// No description provided for @dashboardStatusListening.
  ///
  /// In fr, this message translates to:
  /// **'Écoute active'**
  String get dashboardStatusListening;

  /// No description provided for @dashboardKpiDevices.
  ///
  /// In fr, this message translates to:
  /// **'Appareils'**
  String get dashboardKpiDevices;

  /// No description provided for @dashboardKpiArtnet.
  ///
  /// In fr, this message translates to:
  /// **'Art-Net'**
  String get dashboardKpiArtnet;

  /// No description provided for @dashboardKpiSacn.
  ///
  /// In fr, this message translates to:
  /// **'sACN'**
  String get dashboardKpiSacn;

  /// No description provided for @dashboardKpiNdi.
  ///
  /// In fr, this message translates to:
  /// **'NDI'**
  String get dashboardKpiNdi;

  /// No description provided for @dashboardKpiScore.
  ///
  /// In fr, this message translates to:
  /// **'Score'**
  String get dashboardKpiScore;

  /// No description provided for @dashboardNoScore.
  ///
  /// In fr, this message translates to:
  /// **'–'**
  String get dashboardNoScore;

  /// No description provided for @dashboardSectionAlerts.
  ///
  /// In fr, this message translates to:
  /// **'Alertes actives'**
  String get dashboardSectionAlerts;

  /// No description provided for @dashboardNoAlerts.
  ///
  /// In fr, this message translates to:
  /// **'Aucune alerte active'**
  String get dashboardNoAlerts;

  /// No description provided for @dashboardSectionSnapshot.
  ///
  /// In fr, this message translates to:
  /// **'Dernier snapshot'**
  String get dashboardSectionSnapshot;

  /// No description provided for @dashboardNoSnapshot.
  ///
  /// In fr, this message translates to:
  /// **'Aucun snapshot enregistré'**
  String get dashboardNoSnapshot;

  /// No description provided for @dashboardSectionQuickAccess.
  ///
  /// In fr, this message translates to:
  /// **'Accès rapide'**
  String get dashboardSectionQuickAccess;

  /// No description provided for @dashboardRescanButton.
  ///
  /// In fr, this message translates to:
  /// **'Rescanner'**
  String get dashboardRescanButton;

  /// No description provided for @dashboardNdiRefreshButton.
  ///
  /// In fr, this message translates to:
  /// **'Actualiser NDI'**
  String get dashboardNdiRefreshButton;

  /// No description provided for @dashboardArtnetActive.
  ///
  /// In fr, this message translates to:
  /// **'Art-Net actif'**
  String get dashboardArtnetActive;

  /// No description provided for @dashboardSacnActive.
  ///
  /// In fr, this message translates to:
  /// **'sACN actif'**
  String get dashboardSacnActive;

  /// No description provided for @dashboardNdiScanning.
  ///
  /// In fr, this message translates to:
  /// **'Découverte NDI…'**
  String get dashboardNdiScanning;

  /// No description provided for @dashboardAlertNewDevice.
  ///
  /// In fr, this message translates to:
  /// **'Nouvel appareil : {ip}'**
  String dashboardAlertNewDevice(Object ip);

  /// No description provided for @dashboardAlertLostDevice.
  ///
  /// In fr, this message translates to:
  /// **'Appareil disparu : {ip}'**
  String dashboardAlertLostDevice(Object ip);

  /// No description provided for @dashboardAlertNewArtnetUniverse.
  ///
  /// In fr, this message translates to:
  /// **'Nouvel univers Art-Net : {universe}'**
  String dashboardAlertNewArtnetUniverse(int universe);

  /// No description provided for @dashboardAlertLostArtnetUniverse.
  ///
  /// In fr, this message translates to:
  /// **'Univers Art-Net disparu : {universe}'**
  String dashboardAlertLostArtnetUniverse(int universe);

  /// No description provided for @dashboardAlertNewSacnUniverse.
  ///
  /// In fr, this message translates to:
  /// **'Nouvel univers sACN : {universe}'**
  String dashboardAlertNewSacnUniverse(int universe);

  /// No description provided for @dashboardAlertLostSacnUniverse.
  ///
  /// In fr, this message translates to:
  /// **'Univers sACN disparu : {universe}'**
  String dashboardAlertLostSacnUniverse(int universe);

  /// No description provided for @dashboardAlertNewNdiSource.
  ///
  /// In fr, this message translates to:
  /// **'Nouvelle source NDI : {name}'**
  String dashboardAlertNewNdiSource(Object name);

  /// No description provided for @dashboardAlertLostNdiSource.
  ///
  /// In fr, this message translates to:
  /// **'Source NDI disparue : {name}'**
  String dashboardAlertLostNdiSource(Object name);

  /// No description provided for @dashboardAlertArtnetLowFps.
  ///
  /// In fr, this message translates to:
  /// **'Art-Net U{universe} : FPS faible ({fps})'**
  String dashboardAlertArtnetLowFps(int universe, Object fps);

  /// No description provided for @dashboardAlertSacnLowFps.
  ///
  /// In fr, this message translates to:
  /// **'sACN U{universe} : FPS faible ({fps})'**
  String dashboardAlertSacnLowFps(int universe, Object fps);

  /// No description provided for @dashboardAlertSacnDuplicate.
  ///
  /// In fr, this message translates to:
  /// **'sACN U{universe} : {count} sources actives'**
  String dashboardAlertSacnDuplicate(int universe, int count);

  /// No description provided for @dashboardAlertSacnPriority.
  ///
  /// In fr, this message translates to:
  /// **'sACN U{universe} : conflit de priorité'**
  String dashboardAlertSacnPriority(int universe);

  /// No description provided for @dashboardScanProgress.
  ///
  /// In fr, this message translates to:
  /// **'Scan réseau : {progress}%'**
  String dashboardScanProgress(int progress);

  /// No description provided for @luminexPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Luminex Monitor'**
  String get luminexPageTitle;

  /// No description provided for @luminexMonitorCardTitle.
  ///
  /// In fr, this message translates to:
  /// **'Luminex Monitor'**
  String get luminexMonitorCardTitle;

  /// No description provided for @luminexMonitorCardSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Supervision des switches GigaCore'**
  String get luminexMonitorCardSubtitle;

  /// No description provided for @luminexAddDevice.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter un équipement'**
  String get luminexAddDevice;

  /// No description provided for @luminexAddDeviceTitle.
  ///
  /// In fr, this message translates to:
  /// **'Adresse IP du switch'**
  String get luminexAddDeviceTitle;

  /// No description provided for @luminexAddDeviceHint.
  ///
  /// In fr, this message translates to:
  /// **'192.168.x.x'**
  String get luminexAddDeviceHint;

  /// No description provided for @luminexAddDeviceConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter'**
  String get luminexAddDeviceConfirm;

  /// No description provided for @luminexAddDeviceCancel.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get luminexAddDeviceCancel;

  /// No description provided for @luminexNoDevices.
  ///
  /// In fr, this message translates to:
  /// **'Aucun switch Luminex'**
  String get luminexNoDevices;

  /// No description provided for @luminexNoDevicesHint.
  ///
  /// In fr, this message translates to:
  /// **'Ajoutez une IP manuellement ou lancez un scan réseau.'**
  String get luminexNoDevicesHint;

  /// No description provided for @luminexRefreshAll.
  ///
  /// In fr, this message translates to:
  /// **'Tout actualiser'**
  String get luminexRefreshAll;

  /// No description provided for @luminexRemoveDevice.
  ///
  /// In fr, this message translates to:
  /// **'Retirer'**
  String get luminexRemoveDevice;

  /// No description provided for @luminexScanForDevices.
  ///
  /// In fr, this message translates to:
  /// **'Chercher sur le réseau'**
  String get luminexScanForDevices;

  /// No description provided for @luminexReachable.
  ///
  /// In fr, this message translates to:
  /// **'Accessible'**
  String get luminexReachable;

  /// No description provided for @luminexUnreachable.
  ///
  /// In fr, this message translates to:
  /// **'Inaccessible'**
  String get luminexUnreachable;

  /// No description provided for @luminexPolling.
  ///
  /// In fr, this message translates to:
  /// **'Interrogation…'**
  String get luminexPolling;

  /// No description provided for @luminexNoAlarms.
  ///
  /// In fr, this message translates to:
  /// **'Aucune alarme'**
  String get luminexNoAlarms;

  /// No description provided for @luminexSectionSystem.
  ///
  /// In fr, this message translates to:
  /// **'Informations système'**
  String get luminexSectionSystem;

  /// No description provided for @luminexSectionPorts.
  ///
  /// In fr, this message translates to:
  /// **'Ports'**
  String get luminexSectionPorts;

  /// No description provided for @luminexSectionAlarms.
  ///
  /// In fr, this message translates to:
  /// **'Alarmes actives'**
  String get luminexSectionAlarms;

  /// No description provided for @luminexLabelName.
  ///
  /// In fr, this message translates to:
  /// **'Nom'**
  String get luminexLabelName;

  /// No description provided for @luminexLabelModel.
  ///
  /// In fr, this message translates to:
  /// **'Modèle'**
  String get luminexLabelModel;

  /// No description provided for @luminexLabelFirmware.
  ///
  /// In fr, this message translates to:
  /// **'Firmware'**
  String get luminexLabelFirmware;

  /// No description provided for @luminexLabelUptime.
  ///
  /// In fr, this message translates to:
  /// **'Uptime'**
  String get luminexLabelUptime;

  /// No description provided for @luminexLabelTemperature.
  ///
  /// In fr, this message translates to:
  /// **'Température'**
  String get luminexLabelTemperature;

  /// No description provided for @luminexLabelPsu.
  ///
  /// In fr, this message translates to:
  /// **'Alimentation'**
  String get luminexLabelPsu;

  /// No description provided for @luminexPsuOk.
  ///
  /// In fr, this message translates to:
  /// **'OK'**
  String get luminexPsuOk;

  /// No description provided for @luminexPsuAbsent.
  ///
  /// In fr, this message translates to:
  /// **'Absente'**
  String get luminexPsuAbsent;

  /// No description provided for @luminexLabelApi.
  ///
  /// In fr, this message translates to:
  /// **'API'**
  String get luminexLabelApi;

  /// No description provided for @luminexGen1.
  ///
  /// In fr, this message translates to:
  /// **'Gen 1 (texte)'**
  String get luminexGen1;

  /// No description provided for @luminexGen2.
  ///
  /// In fr, this message translates to:
  /// **'Gen 2 (JSON)'**
  String get luminexGen2;

  /// No description provided for @luminexGenUnknown.
  ///
  /// In fr, this message translates to:
  /// **'Inconnue'**
  String get luminexGenUnknown;

  /// No description provided for @luminexPortUp.
  ///
  /// In fr, this message translates to:
  /// **'Actif'**
  String get luminexPortUp;

  /// No description provided for @luminexPortDown.
  ///
  /// In fr, this message translates to:
  /// **'Inactif'**
  String get luminexPortDown;

  /// No description provided for @luminexPortUnknown.
  ///
  /// In fr, this message translates to:
  /// **'Inconnu'**
  String get luminexPortUnknown;

  /// No description provided for @luminexPortPoeActive.
  ///
  /// In fr, this message translates to:
  /// **'PoE actif'**
  String get luminexPortPoeActive;

  /// No description provided for @luminexPortPoeFault.
  ///
  /// In fr, this message translates to:
  /// **'PoE défaut'**
  String get luminexPortPoeFault;

  /// No description provided for @luminexPortPoeOff.
  ///
  /// In fr, this message translates to:
  /// **'PoE inactif'**
  String get luminexPortPoeOff;

  /// No description provided for @luminexPortNoPoe.
  ///
  /// In fr, this message translates to:
  /// **'Sans PoE'**
  String get luminexPortNoPoe;

  /// No description provided for @luminexDetectedScan.
  ///
  /// In fr, this message translates to:
  /// **'Scan réseau'**
  String get luminexDetectedScan;

  /// No description provided for @luminexDetectedManual.
  ///
  /// In fr, this message translates to:
  /// **'Ajout manuel'**
  String get luminexDetectedManual;

  /// No description provided for @luminexNotAvailable.
  ///
  /// In fr, this message translates to:
  /// **'N/D'**
  String get luminexNotAvailable;

  /// No description provided for @luminexAlarmInaccessible.
  ///
  /// In fr, this message translates to:
  /// **'Switch inaccessible'**
  String get luminexAlarmInaccessible;

  /// No description provided for @luminexAlarmPsuAbsent.
  ///
  /// In fr, this message translates to:
  /// **'Alimentation absente'**
  String get luminexAlarmPsuAbsent;

  /// No description provided for @luminexAlarmCount.
  ///
  /// In fr, this message translates to:
  /// **'{count} alarme(s) active(s)'**
  String luminexAlarmCount(int count);

  /// No description provided for @luminexPortSpeed.
  ///
  /// In fr, this message translates to:
  /// **'{speed} Mb/s'**
  String luminexPortSpeed(int speed);

  /// No description provided for @luminexPortRxErrors.
  ///
  /// In fr, this message translates to:
  /// **'RX : {count} err.'**
  String luminexPortRxErrors(int count);

  /// No description provided for @luminexPortTxErrors.
  ///
  /// In fr, this message translates to:
  /// **'TX : {count} err.'**
  String luminexPortTxErrors(int count);

  /// No description provided for @luminexAlarmPortDown.
  ///
  /// In fr, this message translates to:
  /// **'Port {port} hors ligne'**
  String luminexAlarmPortDown(int port);

  /// No description provided for @luminexAlarmSpeedDegraded.
  ///
  /// In fr, this message translates to:
  /// **'Port {port} : vitesse dégradée ({speed} Mb/s)'**
  String luminexAlarmSpeedDegraded(int port, int speed);

  /// No description provided for @luminexAlarmHighRxErrors.
  ///
  /// In fr, this message translates to:
  /// **'Port {port} : erreurs RX élevées ({count})'**
  String luminexAlarmHighRxErrors(int port, int count);

  /// No description provided for @luminexAlarmHighTxErrors.
  ///
  /// In fr, this message translates to:
  /// **'Port {port} : erreurs TX élevées ({count})'**
  String luminexAlarmHighTxErrors(int port, int count);

  /// No description provided for @luminexAlarmPoeFault.
  ///
  /// In fr, this message translates to:
  /// **'Port {port} : défaut PoE'**
  String luminexAlarmPoeFault(int port);

  /// No description provided for @luminexAlarmHighTemp.
  ///
  /// In fr, this message translates to:
  /// **'Température élevée : {temp}°C'**
  String luminexAlarmHighTemp(Object temp);

  /// No description provided for @manetPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'MA-Net Monitor'**
  String get manetPageTitle;

  /// No description provided for @manetMonitorCardTitle.
  ///
  /// In fr, this message translates to:
  /// **'MA-Net Monitor'**
  String get manetMonitorCardTitle;

  /// No description provided for @manetMonitorCardSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Détection des nœuds grandMA2/3'**
  String get manetMonitorCardSubtitle;

  /// No description provided for @manetNoNodes.
  ///
  /// In fr, this message translates to:
  /// **'Aucun nœud MA-Net détecté'**
  String get manetNoNodes;

  /// No description provided for @manetListening.
  ///
  /// In fr, this message translates to:
  /// **'Écoute en cours…'**
  String get manetListening;

  /// No description provided for @manetNodeType.
  ///
  /// In fr, this message translates to:
  /// **'Type'**
  String get manetNodeType;

  /// No description provided for @manetFirmware.
  ///
  /// In fr, this message translates to:
  /// **'Firmware'**
  String get manetFirmware;

  /// No description provided for @manetMac.
  ///
  /// In fr, this message translates to:
  /// **'Adresse MAC'**
  String get manetMac;

  /// No description provided for @manetLastSeen.
  ///
  /// In fr, this message translates to:
  /// **'Vu il y a'**
  String get manetLastSeen;

  /// No description provided for @manetProtocol.
  ///
  /// In fr, this message translates to:
  /// **'MA-Net'**
  String get manetProtocol;

  /// No description provided for @manetProtocolMaNet2.
  ///
  /// In fr, this message translates to:
  /// **'MA-Net2'**
  String get manetProtocolMaNet2;

  /// No description provided for @manetProtocolMaNet3.
  ///
  /// In fr, this message translates to:
  /// **'MA-Net3'**
  String get manetProtocolMaNet3;

  /// No description provided for @manetEmptyHint.
  ///
  /// In fr, this message translates to:
  /// **'Assurez-vous d’être sur le même réseau que les équipements MA Lighting'**
  String get manetEmptyHint;

  /// No description provided for @manetNodeCount.
  ///
  /// In fr, this message translates to:
  /// **'{count} nœud(s) en ligne'**
  String manetNodeCount(int count);

  /// No description provided for @manetPortListening.
  ///
  /// In fr, this message translates to:
  /// **'UDP :{port}'**
  String manetPortListening(int port);

  /// No description provided for @helpPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Guide des outils réseau'**
  String get helpPageTitle;

  /// No description provided for @helpIntro.
  ///
  /// In fr, this message translates to:
  /// **'Tous les outils fonctionnent en lecture seule sur votre réseau local. Appuyez sur un outil pour afficher le détail.'**
  String get helpIntro;

  /// No description provided for @helpSectionDoes.
  ///
  /// In fr, this message translates to:
  /// **'Ce que ça fait'**
  String get helpSectionDoes;

  /// No description provided for @helpSectionDelay.
  ///
  /// In fr, this message translates to:
  /// **'Délais'**
  String get helpSectionDelay;

  /// No description provided for @helpSectionLimits.
  ///
  /// In fr, this message translates to:
  /// **'Ce que ça ne fait pas'**
  String get helpSectionLimits;

  /// No description provided for @helpSectionTip.
  ///
  /// In fr, this message translates to:
  /// **'Conseil'**
  String get helpSectionTip;

  /// No description provided for @helpGeneralTitle.
  ///
  /// In fr, this message translates to:
  /// **'Conseils généraux'**
  String get helpGeneralTitle;

  /// No description provided for @helpGeneralSubnet.
  ///
  /// In fr, this message translates to:
  /// **'Tous les outils opèrent sur le subnet /24 local. Un équipement sur un VLAN différent ou derrière un routeur ne sera pas détecté.'**
  String get helpGeneralSubnet;

  /// No description provided for @helpGeneralFirewall.
  ///
  /// In fr, this message translates to:
  /// **'Les pare-feux logiciels peuvent bloquer certaines sondes. En cas d\'équipements manquants, vérifiez les règles de filtrage.'**
  String get helpGeneralFirewall;

  /// No description provided for @helpGeneralWifi.
  ///
  /// In fr, this message translates to:
  /// **'Les réseaux WiFi avec isolation de clients bloquent la découverte. Préférez une connexion filaire ou un WiFi en mode bridge.'**
  String get helpGeneralWifi;

  /// No description provided for @helpToolScanDoes.
  ///
  /// In fr, this message translates to:
  /// **'Balaye le subnet /24 en parallèle et identifie les équipements actifs. Affiche l\'IP, le nom d\'hôte, le fabricant (via OUI MAC) et les ports ouverts courants.'**
  String get helpToolScanDoes;

  /// No description provided for @helpToolScanDelay.
  ///
  /// In fr, this message translates to:
  /// **'15 à 30 secondes selon la taille du réseau. 50 sondes simultanées.'**
  String get helpToolScanDelay;

  /// No description provided for @helpToolScanLimits.
  ///
  /// In fr, this message translates to:
  /// **'Ne traverse pas les VLANs ni les routeurs. N\'effectue pas d\'analyse de ports complète ni de scan WAN.'**
  String get helpToolScanLimits;

  /// No description provided for @helpToolScanTip.
  ///
  /// In fr, this message translates to:
  /// **'Si des équipements n\'apparaissent pas, vérifiez que votre pare-feu n\'bloque pas les sondes TCP/ICMP entrantes.'**
  String get helpToolScanTip;

  /// No description provided for @helpToolDashboardDoes.
  ///
  /// In fr, this message translates to:
  /// **'Affiche en temps réel l\'état des équipements détectés : disponibilité, latence, alertes réseau actives.'**
  String get helpToolDashboardDoes;

  /// No description provided for @helpToolDashboardDelay.
  ///
  /// In fr, this message translates to:
  /// **'Mise à jour toutes les 30 secondes. Premier chargement immédiat après le scan.'**
  String get helpToolDashboardDelay;

  /// No description provided for @helpToolDashboardLimits.
  ///
  /// In fr, this message translates to:
  /// **'Ne conserve pas l\'historique entre les sessions. Nécessite un scan préalable pour peupler la liste d\'équipements.'**
  String get helpToolDashboardLimits;

  /// No description provided for @helpToolDashboardTip.
  ///
  /// In fr, this message translates to:
  /// **'Lancez un scan réseau avant d\'ouvrir le dashboard pour voir tous les équipements disponibles.'**
  String get helpToolDashboardTip;

  /// No description provided for @helpToolArtNetDoes.
  ///
  /// In fr, this message translates to:
  /// **'Écoute passivement les paquets Art-Net (UDP 6454) et affiche les univers DMX actifs avec leurs valeurs en temps réel.'**
  String get helpToolArtNetDoes;

  /// No description provided for @helpToolArtNetDelay.
  ///
  /// In fr, this message translates to:
  /// **'Temps réel — les données apparaissent en moins d\'une seconde dès réception du paquet.'**
  String get helpToolArtNetDelay;

  /// No description provided for @helpToolArtNetLimits.
  ///
  /// In fr, this message translates to:
  /// **'Aucune sortie DMX. Ne configure pas les nodes Art-Net et ne gère pas le protocole RDM.'**
  String get helpToolArtNetLimits;

  /// No description provided for @helpToolArtNetTip.
  ///
  /// In fr, this message translates to:
  /// **'Art-Net ne traverse pas les routeurs. Tous les équipements doivent être sur le même réseau L2 (même switch ou même segment).'**
  String get helpToolArtNetTip;

  /// No description provided for @helpToolSacnDoes.
  ///
  /// In fr, this message translates to:
  /// **'Écoute les flux sACN/E1.31 (UDP 5568) en multicast et affiche les univers actifs, les priorités de source et les valeurs DMX.'**
  String get helpToolSacnDoes;

  /// No description provided for @helpToolSacnDelay.
  ///
  /// In fr, this message translates to:
  /// **'Temps réel — latence inférieure à une seconde.'**
  String get helpToolSacnDelay;

  /// No description provided for @helpToolSacnLimits.
  ///
  /// In fr, this message translates to:
  /// **'Pas de sortie DMX. Ne modifie pas les priorités ni la configuration des sources sACN.'**
  String get helpToolSacnLimits;

  /// No description provided for @helpToolSacnTip.
  ///
  /// In fr, this message translates to:
  /// **'Le multicast sACN nécessite un switch géré avec IGMP snooping activé pour éviter les tempêtes de broadcast sur le réseau.'**
  String get helpToolSacnTip;

  /// No description provided for @helpToolNdiDoes.
  ///
  /// In fr, this message translates to:
  /// **'Détecte les sources vidéo NDI sur le LAN via le protocole de découverte NDI. Affiche le nom, l\'adresse IP et le type de chaque source.'**
  String get helpToolNdiDoes;

  /// No description provided for @helpToolNdiDelay.
  ///
  /// In fr, this message translates to:
  /// **'Les sources apparaissent entre 5 et 15 secondes après leur connexion au réseau.'**
  String get helpToolNdiDelay;

  /// No description provided for @helpToolNdiLimits.
  ///
  /// In fr, this message translates to:
  /// **'Pas de lecture vidéo ni de routing NDI. Ne détecte pas les sources NDI|HX sans découverte mDNS active.'**
  String get helpToolNdiLimits;

  /// No description provided for @helpToolNdiTip.
  ///
  /// In fr, this message translates to:
  /// **'NDI nécessite 100 Mb/s minimum par flux. Évitez le WiFi pour la production — préférez une connexion Gigabit filaire.'**
  String get helpToolNdiTip;

  /// No description provided for @helpToolDiagDoes.
  ///
  /// In fr, this message translates to:
  /// **'Exécute une série de tests de santé réseau : connectivité, résolution DNS, latence, perte de paquets et disponibilité des services.'**
  String get helpToolDiagDoes;

  /// No description provided for @helpToolDiagDelay.
  ///
  /// In fr, this message translates to:
  /// **'Diagnostic complet en 20 à 30 secondes.'**
  String get helpToolDiagDelay;

  /// No description provided for @helpToolDiagLimits.
  ///
  /// In fr, this message translates to:
  /// **'Diagnostic uniquement — aucune réparation automatique, aucune modification de configuration.'**
  String get helpToolDiagLimits;

  /// No description provided for @helpToolDiagTip.
  ///
  /// In fr, this message translates to:
  /// **'Lancez un diagnostic avant et après une intervention réseau pour comparer l\'état et isoler rapidement les régressions.'**
  String get helpToolDiagTip;

  /// No description provided for @helpToolSnapshotDoes.
  ///
  /// In fr, this message translates to:
  /// **'Capture l\'état du réseau à un instant T (équipements, services) et permet de comparer deux snapshots pour identifier les changements.'**
  String get helpToolSnapshotDoes;

  /// No description provided for @helpToolSnapshotDelay.
  ///
  /// In fr, this message translates to:
  /// **'Capture en 30 à 45 secondes selon la taille du réseau.'**
  String get helpToolSnapshotDelay;

  /// No description provided for @helpToolSnapshotLimits.
  ///
  /// In fr, this message translates to:
  /// **'Pas de monitoring continu ni d\'alertes automatiques. L\'historique est conservé uniquement sur cet appareil.'**
  String get helpToolSnapshotLimits;

  /// No description provided for @helpToolSnapshotTip.
  ///
  /// In fr, this message translates to:
  /// **'Idéal pour documenter l\'état avant/après un changement d\'infrastructure ou pour isoler une régression lors d\'un dépannage.'**
  String get helpToolSnapshotTip;

  /// No description provided for @helpToolLuminexDoes.
  ///
  /// In fr, this message translates to:
  /// **'Interroge les switches GigaCore Luminex via leur API HTTP. Affiche l\'état des ports (lien, vitesse, PoE, erreurs), la température, les alimentations et déclenche des alarmes.'**
  String get helpToolLuminexDoes;

  /// No description provided for @helpToolLuminexDelay.
  ///
  /// In fr, this message translates to:
  /// **'Sondage toutes les 30 secondes. Découverte automatique sur le subnet : 15 à 30 secondes.'**
  String get helpToolLuminexDelay;

  /// No description provided for @helpToolLuminexLimits.
  ///
  /// In fr, this message translates to:
  /// **'Lecture seule. Aucune modification de VLAN, groupe ou configuration de port. Ne supporte pas MA-Net ou la vidéo NDI.'**
  String get helpToolLuminexLimits;

  /// No description provided for @helpToolLuminexTip.
  ///
  /// In fr, this message translates to:
  /// **'Authentification par défaut : admin / mot de passe vide. Les Gen2 exposent /api/v1/, les Gen1 répondent sur /stat/ports en texte brut.'**
  String get helpToolLuminexTip;

  /// No description provided for @helpToolManetDoes.
  ///
  /// In fr, this message translates to:
  /// **'Écoute passivement le port UDP 6549 et détecte les consoles et nodes grandMA2/3 qui s\'annoncent sur le réseau. Affiche nom, type d\'équipement, version firmware et adresse MAC.'**
  String get helpToolManetDoes;

  /// No description provided for @helpToolManetDelay.
  ///
  /// In fr, this message translates to:
  /// **'Les équipements apparaissent dès leur prochain broadcast réseau, généralement en moins de 10 secondes.'**
  String get helpToolManetDelay;

  /// No description provided for @helpToolManetLimits.
  ///
  /// In fr, this message translates to:
  /// **'Lecture seule. Aucune donnée de show, aucune valeur DMX, aucune configuration. Ne traverse pas les VLANs.'**
  String get helpToolManetLimits;

  /// No description provided for @helpToolManetTip.
  ///
  /// In fr, this message translates to:
  /// **'Si aucun équipement n\'apparaît : vérifiez que la grandMA broadcaster sur le LAN et que le port UDP 6549 n\'est pas bloqué par un pare-feu.'**
  String get helpToolManetTip;

  /// No description provided for @bwCardTitle.
  ///
  /// In fr, this message translates to:
  /// **'Bande passante'**
  String get bwCardTitle;

  /// No description provided for @bwCardSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Broadcast + switch SNMP'**
  String get bwCardSubtitle;

  /// No description provided for @bwHubTitle.
  ///
  /// In fr, this message translates to:
  /// **'Bande passante'**
  String get bwHubTitle;

  /// No description provided for @bwHubSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Option 1 — trafic broadcast uniquement (sans équipement). Option 2 — bande passante réelle par port via SNMP (switch managé requis).'**
  String get bwHubSubtitle;

  /// No description provided for @bwHubTagFree.
  ///
  /// In fr, this message translates to:
  /// **'GRATUIT'**
  String get bwHubTagFree;

  /// No description provided for @bwHubCardBroadcastTitle.
  ///
  /// In fr, this message translates to:
  /// **'Broadcast réseau'**
  String get bwHubCardBroadcastTitle;

  /// No description provided for @bwHubCardBroadcastSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Art-Net · sACN · MA-Net'**
  String get bwHubCardBroadcastSubtitle;

  /// No description provided for @bwHubCardBroadcastLimit.
  ///
  /// In fr, this message translates to:
  /// **'Trafic unicast non visible (NDI, Dante…)'**
  String get bwHubCardBroadcastLimit;

  /// No description provided for @bwHubCardSnmpTitle.
  ///
  /// In fr, this message translates to:
  /// **'Ports switch'**
  String get bwHubCardSnmpTitle;

  /// No description provided for @bwHubCardSnmpSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Vue par port, tout le trafic'**
  String get bwHubCardSnmpSubtitle;

  /// No description provided for @bwHubCardSnmpRequires.
  ///
  /// In fr, this message translates to:
  /// **'Switch managé SNMP requis'**
  String get bwHubCardSnmpRequires;

  /// No description provided for @bwBroadcastPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Broadcast réseau'**
  String get bwBroadcastPageTitle;

  /// No description provided for @bwBroadcastWarning.
  ///
  /// In fr, this message translates to:
  /// **'Broadcast & multicast uniquement. Le trafic unicast (NDI, Dante…) n\'est pas visible depuis cet appareil.'**
  String get bwBroadcastWarning;

  /// No description provided for @bwBroadcastListening.
  ///
  /// In fr, this message translates to:
  /// **'En écoute'**
  String get bwBroadcastListening;

  /// No description provided for @bwBroadcastTotal.
  ///
  /// In fr, this message translates to:
  /// **'Total'**
  String get bwBroadcastTotal;

  /// No description provided for @bwSnmpPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Ports switch'**
  String get bwSnmpPageTitle;

  /// No description provided for @bwSnmpConfigTitle.
  ///
  /// In fr, this message translates to:
  /// **'Connexion SNMP'**
  String get bwSnmpConfigTitle;

  /// No description provided for @bwSnmpHost.
  ///
  /// In fr, this message translates to:
  /// **'IP du switch'**
  String get bwSnmpHost;

  /// No description provided for @bwSnmpHostHint.
  ///
  /// In fr, this message translates to:
  /// **'192.168.1.1'**
  String get bwSnmpHostHint;

  /// No description provided for @bwSnmpCommunity.
  ///
  /// In fr, this message translates to:
  /// **'Community'**
  String get bwSnmpCommunity;

  /// No description provided for @bwSnmpCommunityHint.
  ///
  /// In fr, this message translates to:
  /// **'public'**
  String get bwSnmpCommunityHint;

  /// No description provided for @bwSnmpConnect.
  ///
  /// In fr, this message translates to:
  /// **'Connecter'**
  String get bwSnmpConnect;

  /// No description provided for @bwSnmpDisconnect.
  ///
  /// In fr, this message translates to:
  /// **'Déconnecter'**
  String get bwSnmpDisconnect;

  /// No description provided for @bwSnmpConnecting.
  ///
  /// In fr, this message translates to:
  /// **'Connexion…'**
  String get bwSnmpConnecting;

  /// No description provided for @bwSnmpError.
  ///
  /// In fr, this message translates to:
  /// **'Erreur SNMP'**
  String get bwSnmpError;

  /// No description provided for @bwSnmpReqTitle.
  ///
  /// In fr, this message translates to:
  /// **'Prérequis'**
  String get bwSnmpReqTitle;

  /// No description provided for @bwSnmpReq1.
  ///
  /// In fr, this message translates to:
  /// **'Switch managé avec SNMP v2c activé'**
  String get bwSnmpReq1;

  /// No description provided for @bwSnmpReq2.
  ///
  /// In fr, this message translates to:
  /// **'Community string (par défaut : \"public\" sur Luminex GigaCore)'**
  String get bwSnmpReq2;

  /// No description provided for @bwSnmpReq3.
  ///
  /// In fr, this message translates to:
  /// **'IP du switch accessible depuis cet appareil'**
  String get bwSnmpReq3;

  /// No description provided for @bwSnmpPortUp.
  ///
  /// In fr, this message translates to:
  /// **'Actif'**
  String get bwSnmpPortUp;

  /// No description provided for @bwSnmpPortDown.
  ///
  /// In fr, this message translates to:
  /// **'Inactif'**
  String get bwSnmpPortDown;

  /// No description provided for @bwSnmpNoData.
  ///
  /// In fr, this message translates to:
  /// **'En attente de données…'**
  String get bwSnmpNoData;

  /// No description provided for @bwSnmpPortCount.
  ///
  /// In fr, this message translates to:
  /// **'{count} port{count, plural, one{} other{s}}'**
  String bwSnmpPortCount(int count);

  /// No description provided for @bwUnitKbps.
  ///
  /// In fr, this message translates to:
  /// **'kbps'**
  String get bwUnitKbps;

  /// No description provided for @bwUnitMbps.
  ///
  /// In fr, this message translates to:
  /// **'Mbps'**
  String get bwUnitMbps;

  /// No description provided for @bwUnitPkts.
  ///
  /// In fr, this message translates to:
  /// **'paq./s'**
  String get bwUnitPkts;

  /// No description provided for @bwLabelIn.
  ///
  /// In fr, this message translates to:
  /// **'↓ Entrant'**
  String get bwLabelIn;

  /// No description provided for @bwLabelOut.
  ///
  /// In fr, this message translates to:
  /// **'↑ Sortant'**
  String get bwLabelOut;

  /// No description provided for @conversionsVolumesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Volumes'**
  String get conversionsVolumesTitle;

  /// No description provided for @volumeCalcCardTitle.
  ///
  /// In fr, this message translates to:
  /// **'Volume — cube, cylindre, sphère…'**
  String get volumeCalcCardTitle;

  /// No description provided for @volumeCalcUnitLabel.
  ///
  /// In fr, this message translates to:
  /// **'Unité des dimensions'**
  String get volumeCalcUnitLabel;

  /// No description provided for @volumeCalcPlaceholder.
  ///
  /// In fr, this message translates to:
  /// **'Remplis les dimensions pour voir le volume ✨'**
  String get volumeCalcPlaceholder;

  /// No description provided for @volumeShapeCube.
  ///
  /// In fr, this message translates to:
  /// **'Cube'**
  String get volumeShapeCube;

  /// No description provided for @volumeShapeBox.
  ///
  /// In fr, this message translates to:
  /// **'Pavé droit'**
  String get volumeShapeBox;

  /// No description provided for @volumeShapeCylinder.
  ///
  /// In fr, this message translates to:
  /// **'Cylindre'**
  String get volumeShapeCylinder;

  /// No description provided for @volumeShapeSphere.
  ///
  /// In fr, this message translates to:
  /// **'Sphère'**
  String get volumeShapeSphere;

  /// No description provided for @volumeShapeCone.
  ///
  /// In fr, this message translates to:
  /// **'Cône'**
  String get volumeShapeCone;

  /// No description provided for @volumeShapeSquarePyramid.
  ///
  /// In fr, this message translates to:
  /// **'Pyramide (base carrée)'**
  String get volumeShapeSquarePyramid;

  /// No description provided for @volumeFieldSide.
  ///
  /// In fr, this message translates to:
  /// **'Côté'**
  String get volumeFieldSide;

  /// No description provided for @volumeFieldLength.
  ///
  /// In fr, this message translates to:
  /// **'Longueur'**
  String get volumeFieldLength;

  /// No description provided for @volumeFieldWidth.
  ///
  /// In fr, this message translates to:
  /// **'Largeur'**
  String get volumeFieldWidth;

  /// No description provided for @volumeFieldHeight.
  ///
  /// In fr, this message translates to:
  /// **'Hauteur'**
  String get volumeFieldHeight;

  /// No description provided for @volumeFieldRadius.
  ///
  /// In fr, this message translates to:
  /// **'Rayon'**
  String get volumeFieldRadius;

  /// No description provided for @volumeFieldRadiusBase.
  ///
  /// In fr, this message translates to:
  /// **'Rayon (base)'**
  String get volumeFieldRadiusBase;

  /// No description provided for @volumeFieldSideBase.
  ///
  /// In fr, this message translates to:
  /// **'Côté (base)'**
  String get volumeFieldSideBase;

  /// No description provided for @aboutVesaTitle.
  ///
  /// In fr, this message translates to:
  /// **'Supports VESA & tailles d\'écran'**
  String get aboutVesaTitle;

  /// No description provided for @aboutVesaSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Normes VESA, recherche de standard et calcul de diagonale'**
  String get aboutVesaSubtitle;

  /// No description provided for @vesaIntroTitle.
  ///
  /// In fr, this message translates to:
  /// **'VESA & écrans, en un coup d\'œil'**
  String get vesaIntroTitle;

  /// No description provided for @vesaIntroBody.
  ///
  /// In fr, this message translates to:
  /// **'VESA (Video Electronics Standards Association) normalise l\'entraxe des trous de fixation au dos des écrans, TV et moniteurs. Plus l\'écran est grand et lourd, plus l\'entraxe est large. Vérifie toujours le poids et le VESA indiqués par le fabricant avant de choisir un support — cette page donne des ordres de grandeur, pas des valeurs garanties.'**
  String get vesaIntroBody;

  /// No description provided for @vesaTableTitle.
  ///
  /// In fr, this message translates to:
  /// **'Standards VESA courants'**
  String get vesaTableTitle;

  /// No description provided for @vesaColEntraxe.
  ///
  /// In fr, this message translates to:
  /// **'Entraxe'**
  String get vesaColEntraxe;

  /// No description provided for @vesaColScreenSize.
  ///
  /// In fr, this message translates to:
  /// **'Taille écran'**
  String get vesaColScreenSize;

  /// No description provided for @vesaColMaxWeight.
  ///
  /// In fr, this message translates to:
  /// **'Poids max.'**
  String get vesaColMaxWeight;

  /// No description provided for @vesaTableFooterNote.
  ///
  /// In fr, this message translates to:
  /// **'Plages indicatives : un fabricant peut tout à fait proposer un VESA plus large que la moyenne pour un écran donné, notamment sur les écrans pro et les murs LED. Vérifie toujours la fiche technique.'**
  String get vesaTableFooterNote;

  /// No description provided for @vesaLargeFormat.
  ///
  /// In fr, this message translates to:
  /// **'Grands formats / murs LED'**
  String get vesaLargeFormat;

  /// No description provided for @vesaFinderTitle.
  ///
  /// In fr, this message translates to:
  /// **'Quel VESA ai-je mesuré ?'**
  String get vesaFinderTitle;

  /// No description provided for @vesaFinderHint.
  ///
  /// In fr, this message translates to:
  /// **'Mesure l\'entraxe entre deux trous (horizontal et vertical) au dos de l\'écran, en millimètres.'**
  String get vesaFinderHint;

  /// No description provided for @vesaFieldHorizontal.
  ///
  /// In fr, this message translates to:
  /// **'Entraxe horizontal (mm)'**
  String get vesaFieldHorizontal;

  /// No description provided for @vesaFieldVertical.
  ///
  /// In fr, this message translates to:
  /// **'Entraxe vertical (mm)'**
  String get vesaFieldVertical;

  /// No description provided for @vesaFinderPlaceholder.
  ///
  /// In fr, this message translates to:
  /// **'Renseigne les deux entraxes pour identifier le standard.'**
  String get vesaFinderPlaceholder;

  /// No description provided for @vesaFinderExactMatch.
  ///
  /// In fr, this message translates to:
  /// **'Standard VESA {pattern} 🎯'**
  String vesaFinderExactMatch(Object pattern);

  /// No description provided for @vesaFinderNearestMatch.
  ///
  /// In fr, this message translates to:
  /// **'Pas de correspondance exacte — le plus proche est {pattern} (écart {delta} mm cumulés). Vérifie ta mesure.'**
  String vesaFinderNearestMatch(Object pattern, Object delta);

  /// No description provided for @vesaScreenCalcTitle.
  ///
  /// In fr, this message translates to:
  /// **'Dimensions d\'un écran depuis sa diagonale'**
  String get vesaScreenCalcTitle;

  /// No description provided for @vesaFieldDiagonal.
  ///
  /// In fr, this message translates to:
  /// **'Diagonale (pouces)'**
  String get vesaFieldDiagonal;

  /// No description provided for @vesaScreenCalcPlaceholder.
  ///
  /// In fr, this message translates to:
  /// **'Indique une diagonale en pouces.'**
  String get vesaScreenCalcPlaceholder;

  /// No description provided for @vesaResultDiagonal.
  ///
  /// In fr, this message translates to:
  /// **'Diagonale'**
  String get vesaResultDiagonal;

  /// No description provided for @vesaResultWidth.
  ///
  /// In fr, this message translates to:
  /// **'Largeur'**
  String get vesaResultWidth;

  /// No description provided for @vesaResultHeight.
  ///
  /// In fr, this message translates to:
  /// **'Hauteur'**
  String get vesaResultHeight;

  /// No description provided for @vesaResultArea.
  ///
  /// In fr, this message translates to:
  /// **'Surface'**
  String get vesaResultArea;

  /// No description provided for @vesaTipsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Conseils de fixation'**
  String get vesaTipsTitle;

  /// No description provided for @vesaTip1.
  ///
  /// In fr, this message translates to:
  /// **'Utilise toujours les 4 (ou plus) vis fournies — jamais 2 en diagonale.'**
  String get vesaTip1;

  /// No description provided for @vesaTip2.
  ///
  /// In fr, this message translates to:
  /// **'Respecte le couple de serrage indiqué : trop serré peut fissurer le châssis.'**
  String get vesaTip2;

  /// No description provided for @vesaTip3.
  ///
  /// In fr, this message translates to:
  /// **'Pour un accroche en hauteur ou sur un pont, prévois une élingue ou une sécurité secondaire indépendante du support VESA.'**
  String get vesaTip3;

  /// No description provided for @vesaTip4.
  ///
  /// In fr, this message translates to:
  /// **'En charge dynamique (mouvement, vibrations, transport), réduis la charge admissible par rapport à la charge statique du fabricant.'**
  String get vesaTip4;

  /// No description provided for @vesaTip5.
  ///
  /// In fr, this message translates to:
  /// **'Vérifie la longueur des vis : trop longues, elles peuvent endommager l\'électronique interne de l\'écran.'**
  String get vesaTip5;

  /// No description provided for @vesaTip6.
  ///
  /// In fr, this message translates to:
  /// **'Un adaptateur VESA (75→100, 100→200…) doit être noté sur la fiche de charge — il ajoute du poids et un bras de levier.'**
  String get vesaTip6;

  /// No description provided for @cctFilterTitle.
  ///
  /// In fr, this message translates to:
  /// **'Filtre ↔ Température (K)'**
  String get cctFilterTitle;

  /// No description provided for @cctFilterTileDescription.
  ///
  /// In fr, this message translates to:
  /// **'Quel CTO/CTB choisir entre deux températures, et dans tous les sens'**
  String get cctFilterTileDescription;

  /// No description provided for @cctFilterIntro.
  ///
  /// In fr, this message translates to:
  /// **'Trouve en un instant le filtre CTO/CTB qu\'il te faut, ou vérifie le résultat d\'un filtre déjà en main — dans tous les sens ✨'**
  String get cctFilterIntro;

  /// No description provided for @cctModeFindFilter.
  ///
  /// In fr, this message translates to:
  /// **'Quel filtre ?'**
  String get cctModeFindFilter;

  /// No description provided for @cctModeSourcePlusFilter.
  ///
  /// In fr, this message translates to:
  /// **'K + filtre → K ?'**
  String get cctModeSourcePlusFilter;

  /// No description provided for @cctModeTargetPlusFilter.
  ///
  /// In fr, this message translates to:
  /// **'K cible + filtre → K départ ?'**
  String get cctModeTargetPlusFilter;

  /// No description provided for @cctFieldSourceK.
  ///
  /// In fr, this message translates to:
  /// **'Température de départ (K)'**
  String get cctFieldSourceK;

  /// No description provided for @cctFieldTargetK.
  ///
  /// In fr, this message translates to:
  /// **'Température souhaitée (K)'**
  String get cctFieldTargetK;

  /// No description provided for @cctFieldTargetKFinal.
  ///
  /// In fr, this message translates to:
  /// **'Température finale souhaitée (K)'**
  String get cctFieldTargetKFinal;

  /// No description provided for @cctFieldFilter.
  ///
  /// In fr, this message translates to:
  /// **'Filtre'**
  String get cctFieldFilter;

  /// No description provided for @cctDescEighthCtb.
  ///
  /// In fr, this message translates to:
  /// **'Rafraîchit très légèrement'**
  String get cctDescEighthCtb;

  /// No description provided for @cctDescQuarterCtb.
  ///
  /// In fr, this message translates to:
  /// **'Rafraîchit légèrement'**
  String get cctDescQuarterCtb;

  /// No description provided for @cctDescHalfCtb.
  ///
  /// In fr, this message translates to:
  /// **'Rafraîchit modérément'**
  String get cctDescHalfCtb;

  /// No description provided for @cctDescThreeQuarterCtb.
  ///
  /// In fr, this message translates to:
  /// **'Rafraîchit fortement'**
  String get cctDescThreeQuarterCtb;

  /// No description provided for @cctDescFullCtb.
  ///
  /// In fr, this message translates to:
  /// **'Tungstène → lumière du jour'**
  String get cctDescFullCtb;

  /// No description provided for @cctDescEighthCto.
  ///
  /// In fr, this message translates to:
  /// **'Réchauffe très légèrement'**
  String get cctDescEighthCto;

  /// No description provided for @cctDescQuarterCto.
  ///
  /// In fr, this message translates to:
  /// **'Réchauffe légèrement'**
  String get cctDescQuarterCto;

  /// No description provided for @cctDescHalfCto.
  ///
  /// In fr, this message translates to:
  /// **'Réchauffe modérément'**
  String get cctDescHalfCto;

  /// No description provided for @cctDescThreeQuarterCto.
  ///
  /// In fr, this message translates to:
  /// **'Réchauffe fortement'**
  String get cctDescThreeQuarterCto;

  /// No description provided for @cctDescFullCto.
  ///
  /// In fr, this message translates to:
  /// **'Lumière du jour → tungstène'**
  String get cctDescFullCto;

  /// No description provided for @cctFindFilterPlaceholder.
  ///
  /// In fr, this message translates to:
  /// **'Renseigne les deux températures pour trouver le filtre adapté.'**
  String get cctFindFilterPlaceholder;

  /// No description provided for @cctRequiredShiftLabel.
  ///
  /// In fr, this message translates to:
  /// **'Décalage requis'**
  String get cctRequiredShiftLabel;

  /// No description provided for @cctMiredShiftLabel.
  ///
  /// In fr, this message translates to:
  /// **'Mired shift'**
  String get cctMiredShiftLabel;

  /// No description provided for @cctBestChoice.
  ///
  /// In fr, this message translates to:
  /// **'Meilleur choix : {name} → ≈ {k} K'**
  String cctBestChoice(Object name, Object k);

  /// No description provided for @cctApproxKelvin.
  ///
  /// In fr, this message translates to:
  /// **'≈ {k} K'**
  String cctApproxKelvin(Object k);

  /// No description provided for @cctOtherFiltersNearby.
  ///
  /// In fr, this message translates to:
  /// **'Autres filtres proches'**
  String get cctOtherFiltersNearby;

  /// No description provided for @cctDisclaimer.
  ///
  /// In fr, this message translates to:
  /// **'Valeurs de décalage mired standard, approximatives — vérifie la fiche technique du fabricant pour un usage critique.'**
  String get cctDisclaimer;

  /// No description provided for @cctSourcePlaceholder.
  ///
  /// In fr, this message translates to:
  /// **'Renseigne la température de départ.'**
  String get cctSourcePlaceholder;

  /// No description provided for @cctTargetPlaceholder.
  ///
  /// In fr, this message translates to:
  /// **'Renseigne la température finale souhaitée.'**
  String get cctTargetPlaceholder;

  /// No description provided for @cctOutOfRange.
  ///
  /// In fr, this message translates to:
  /// **'Combinaison hors plage (résultat non physique) — essaie une autre température ou un autre filtre.'**
  String get cctOutOfRange;

  /// No description provided for @cctResultObtainedTemp.
  ///
  /// In fr, this message translates to:
  /// **'Température obtenue'**
  String get cctResultObtainedTemp;

  /// No description provided for @cctResultAppliedFilter.
  ///
  /// In fr, this message translates to:
  /// **'Filtre appliqué'**
  String get cctResultAppliedFilter;

  /// No description provided for @cctResultRequiredSource.
  ///
  /// In fr, this message translates to:
  /// **'Source nécessaire'**
  String get cctResultRequiredSource;

  /// No description provided for @cctResultFilterToApply.
  ///
  /// In fr, this message translates to:
  /// **'Filtre à appliquer'**
  String get cctResultFilterToApply;

  /// No description provided for @cctBrandLabel.
  ///
  /// In fr, this message translates to:
  /// **'Marque de filtre'**
  String get cctBrandLabel;

  /// No description provided for @cctAllBrands.
  ///
  /// In fr, this message translates to:
  /// **'Toutes les marques'**
  String get cctAllBrands;

  /// No description provided for @timecodeHubTitle.
  ///
  /// In fr, this message translates to:
  /// **'Timecode'**
  String get timecodeHubTitle;

  /// No description provided for @timecodeToolConverterLabel.
  ///
  /// In fr, this message translates to:
  /// **'Convertisseur\nde débit'**
  String get timecodeToolConverterLabel;

  /// No description provided for @timecodeToolMathLabel.
  ///
  /// In fr, this message translates to:
  /// **'Durée &\ndécalage'**
  String get timecodeToolMathLabel;

  /// No description provided for @timecodeToolDelayLabel.
  ///
  /// In fr, this message translates to:
  /// **'Frame ↔ ms'**
  String get timecodeToolDelayLabel;

  /// No description provided for @timecodeToolCountdownLabel.
  ///
  /// In fr, this message translates to:
  /// **'Compte à\nrebours'**
  String get timecodeToolCountdownLabel;

  /// No description provided for @timecodeBadgeFree.
  ///
  /// In fr, this message translates to:
  /// **'GRATUIT'**
  String get timecodeBadgeFree;

  /// No description provided for @timecodeBadgeNew.
  ///
  /// In fr, this message translates to:
  /// **'NOUVEAU'**
  String get timecodeBadgeNew;

  /// No description provided for @timecodeConverterTitle.
  ///
  /// In fr, this message translates to:
  /// **'Convertisseur de débit'**
  String get timecodeConverterTitle;

  /// No description provided for @timecodeConverterSourceCardTitle.
  ///
  /// In fr, this message translates to:
  /// **'Timecode source'**
  String get timecodeConverterSourceCardTitle;

  /// No description provided for @timecodeConverterFieldLabel.
  ///
  /// In fr, this message translates to:
  /// **'HH:MM:SS:FF'**
  String get timecodeConverterFieldLabel;

  /// No description provided for @timecodeConverterFieldHint.
  ///
  /// In fr, this message translates to:
  /// **'01:00:00:00'**
  String get timecodeConverterFieldHint;

  /// No description provided for @timecodeConverterSourceRateLabel.
  ///
  /// In fr, this message translates to:
  /// **'Débit source'**
  String get timecodeConverterSourceRateLabel;

  /// No description provided for @timecodeConverterSwapTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Inverser source / cible'**
  String get timecodeConverterSwapTooltip;

  /// No description provided for @timecodeConverterTargetCardTitle.
  ///
  /// In fr, this message translates to:
  /// **'Débit cible'**
  String get timecodeConverterTargetCardTitle;

  /// No description provided for @timecodeConverterTargetRateLabel.
  ///
  /// In fr, this message translates to:
  /// **'Débit cible'**
  String get timecodeConverterTargetRateLabel;

  /// No description provided for @timecodeConverterButton.
  ///
  /// In fr, this message translates to:
  /// **'Convertir'**
  String get timecodeConverterButton;

  ///
  ///
  /// In fr, this message translates to:
  /// **'❌ Timecode invalide pour {rateLabel} (attendu : HH:MM:SS:FF, FF < {frameBase}).'**
  String timecodeConverterErrorInvalid(String rateLabel, int frameBase);

  ///
  ///
  /// In fr, this message translates to:
  /// **'TC en {rateLabel} :\n{tc}\n\n(≈ {seconds} s écoulées depuis 00:00:00:00)'**
  String timecodeConverterResult(String rateLabel, String tc, String seconds);

  /// No description provided for @timecodeMathTitle.
  ///
  /// In fr, this message translates to:
  /// **'Durée & décalage'**
  String get timecodeMathTitle;

  /// No description provided for @timecodeMathModeDuration.
  ///
  /// In fr, this message translates to:
  /// **'Durée entre 2 TC'**
  String get timecodeMathModeDuration;

  /// No description provided for @timecodeMathModeOffset.
  ///
  /// In fr, this message translates to:
  /// **'Décaler un TC'**
  String get timecodeMathModeOffset;

  /// No description provided for @timecodeMathRateCardTitle.
  ///
  /// In fr, this message translates to:
  /// **'Débit'**
  String get timecodeMathRateCardTitle;

  /// No description provided for @timecodeMathDurationCardTitle.
  ///
  /// In fr, this message translates to:
  /// **'Timecode In / Out'**
  String get timecodeMathDurationCardTitle;

  /// No description provided for @timecodeMathTcInLabel.
  ///
  /// In fr, this message translates to:
  /// **'TC In (HH:MM:SS:FF)'**
  String get timecodeMathTcInLabel;

  /// No description provided for @timecodeMathTcOutLabel.
  ///
  /// In fr, this message translates to:
  /// **'TC Out (HH:MM:SS:FF)'**
  String get timecodeMathTcOutLabel;

  /// No description provided for @timecodeMathComputeDurationButton.
  ///
  /// In fr, this message translates to:
  /// **'Calculer la durée'**
  String get timecodeMathComputeDurationButton;

  ///
  ///
  /// In fr, this message translates to:
  /// **'❌ Vérifie les deux timecodes (HH:MM:SS:FF, FF < {frameBase}).'**
  String timecodeMathErrorDuration(int frameBase);

  ///
  ///
  /// In fr, this message translates to:
  /// **'Durée : {duration}\n({frames} frame(s) à {rateLabel})'**
  String timecodeMathDurationResult(
      String duration, int frames, String rateLabel);

  /// No description provided for @timecodeMathOffsetCardTitle.
  ///
  /// In fr, this message translates to:
  /// **'Timecode de départ + décalage'**
  String get timecodeMathOffsetCardTitle;

  /// No description provided for @timecodeMathBaseTcLabel.
  ///
  /// In fr, this message translates to:
  /// **'TC de départ (HH:MM:SS:FF)'**
  String get timecodeMathBaseTcLabel;

  /// No description provided for @timecodeMathAddLabel.
  ///
  /// In fr, this message translates to:
  /// **'+ Ajouter'**
  String get timecodeMathAddLabel;

  /// No description provided for @timecodeMathSubtractLabel.
  ///
  /// In fr, this message translates to:
  /// **'− Soustraire'**
  String get timecodeMathSubtractLabel;

  /// No description provided for @timecodeMathOffsetLabel.
  ///
  /// In fr, this message translates to:
  /// **'Décalage — durée (HH:MM:SS:FF)'**
  String get timecodeMathOffsetLabel;

  /// No description provided for @timecodeMathComputeOffsetButton.
  ///
  /// In fr, this message translates to:
  /// **'Calculer le nouveau TC'**
  String get timecodeMathComputeOffsetButton;

  ///
  ///
  /// In fr, this message translates to:
  /// **'❌ Vérifie le timecode de départ et le décalage (HH:MM:SS:FF, FF < {frameBase}).'**
  String timecodeMathErrorOffset(int frameBase);

  ///
  ///
  /// In fr, this message translates to:
  /// **'Nouveau timecode :\n{tc}'**
  String timecodeMathOffsetResult(String tc);

  /// No description provided for @timecodeDelayTitle.
  ///
  /// In fr, this message translates to:
  /// **'Frame ↔ ms'**
  String get timecodeDelayTitle;

  /// No description provided for @timecodeDelayCardTitle.
  ///
  /// In fr, this message translates to:
  /// **'Retard vidéo / audio'**
  String get timecodeDelayCardTitle;

  /// No description provided for @timecodeDelayIntro.
  ///
  /// In fr, this message translates to:
  /// **'Pratique pour corriger un décalage lip-sync ou un retard de processeur vidéo/LED : entre une valeur, choisis son unité, et récupère l\'équivalent.'**
  String get timecodeDelayIntro;

  /// No description provided for @timecodeDelayRateLabel.
  ///
  /// In fr, this message translates to:
  /// **'Débit'**
  String get timecodeDelayRateLabel;

  /// No description provided for @timecodeDelayUnitFrames.
  ///
  /// In fr, this message translates to:
  /// **'Frames'**
  String get timecodeDelayUnitFrames;

  /// No description provided for @timecodeDelayUnitMs.
  ///
  /// In fr, this message translates to:
  /// **'Millisecondes'**
  String get timecodeDelayUnitMs;

  /// No description provided for @timecodeDelayValueLabelFrames.
  ///
  /// In fr, this message translates to:
  /// **'Nombre de frames'**
  String get timecodeDelayValueLabelFrames;

  /// No description provided for @timecodeDelayValueLabelMs.
  ///
  /// In fr, this message translates to:
  /// **'Millisecondes'**
  String get timecodeDelayValueLabelMs;

  /// No description provided for @timecodeDelayButton.
  ///
  /// In fr, this message translates to:
  /// **'Convertir'**
  String get timecodeDelayButton;

  /// No description provided for @timecodeDelayErrorInvalid.
  ///
  /// In fr, this message translates to:
  /// **'❌ Valeur invalide.'**
  String get timecodeDelayErrorInvalid;

  ///
  ///
  /// In fr, this message translates to:
  /// **'{frames} frame(s) à {rateLabel}\n= {ms} ms\n= {duration}'**
  String timecodeDelayResultFromFrames(
      int frames, String rateLabel, String ms, String duration);

  ///
  ///
  /// In fr, this message translates to:
  /// **'{ms} ms à {rateLabel}\n= {frames} frame(s)\n= {duration}'**
  String timecodeDelayResultFromMs(
      String ms, String rateLabel, int frames, String duration);

  /// No description provided for @timecodeCountdownTitle.
  ///
  /// In fr, this message translates to:
  /// **'Compte à rebours'**
  String get timecodeCountdownTitle;

  /// No description provided for @timecodeCountdownSettingsCardTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réglages'**
  String get timecodeCountdownSettingsCardTitle;

  /// No description provided for @timecodeCountdownRateLabel.
  ///
  /// In fr, this message translates to:
  /// **'Débit'**
  String get timecodeCountdownRateLabel;

  /// No description provided for @timecodeCountdownCurrentTcLabel.
  ///
  /// In fr, this message translates to:
  /// **'TC actuel (HH:MM:SS:FF)'**
  String get timecodeCountdownCurrentTcLabel;

  /// No description provided for @timecodeCountdownFillNowTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Remplir avec l\'heure du téléphone'**
  String get timecodeCountdownFillNowTooltip;

  /// No description provided for @timecodeCountdownTargetTcLabel.
  ///
  /// In fr, this message translates to:
  /// **'TC cible (HH:MM:SS:FF)'**
  String get timecodeCountdownTargetTcLabel;

  /// No description provided for @timecodeCountdownStartButton.
  ///
  /// In fr, this message translates to:
  /// **'Démarrer'**
  String get timecodeCountdownStartButton;

  /// No description provided for @timecodeCountdownStopButton.
  ///
  /// In fr, this message translates to:
  /// **'Arrêter'**
  String get timecodeCountdownStopButton;

  ///
  ///
  /// In fr, this message translates to:
  /// **'❌ Vérifie les deux timecodes (HH:MM:SS:FF, FF < {frameBase}).'**
  String timecodeCountdownErrorInvalid(int frameBase);

  /// No description provided for @timecodeCountdownLiveCardTitle.
  ///
  /// In fr, this message translates to:
  /// **'En direct'**
  String get timecodeCountdownLiveCardTitle;

  ///
  ///
  /// In fr, this message translates to:
  /// **'TC actuel (estimé) : {tc}\nTemps restant : {remaining}'**
  String timecodeCountdownLiveText(String tc, String remaining);

  ///
  ///
  /// In fr, this message translates to:
  /// **'−{duration} (TC dépassé)'**
  String timecodeCountdownOverdue(String duration);

  /// No description provided for @homeTimecodeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Timecode'**
  String get homeTimecodeTitle;

  /// No description provided for @homeTimecodeSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Débit, durée, décalage, retard'**
  String get homeTimecodeSubtitle;

  /// No description provided for @vconsoleTitle.
  ///
  /// In fr, this message translates to:
  /// **'Console Virtuelle'**
  String get vconsoleTitle;

  /// No description provided for @vconsoleTileDescription.
  ///
  /// In fr, this message translates to:
  /// **'Envoie de l\'Art-Net/sACN en WiFi pour tester tes machines'**
  String get vconsoleTileDescription;

  /// No description provided for @vconsoleSectionConnection.
  ///
  /// In fr, this message translates to:
  /// **'Connexion réseau'**
  String get vconsoleSectionConnection;

  /// No description provided for @vconsoleUniverseLabel.
  ///
  /// In fr, this message translates to:
  /// **'Univers de départ'**
  String get vconsoleUniverseLabel;

  /// No description provided for @vconsoleUniverseCountLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nombre d\'univers'**
  String get vconsoleUniverseCountLabel;

  /// No description provided for @rdmPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'RDM'**
  String get rdmPageTitle;

  /// No description provided for @rdmScanButton.
  ///
  /// In fr, this message translates to:
  /// **'Scanner le réseau'**
  String get rdmScanButton;

  /// No description provided for @rdmScanningStatus.
  ///
  /// In fr, this message translates to:
  /// **'Recherche des fixtures RDM…'**
  String get rdmScanningStatus;

  /// No description provided for @rdmEmptyState.
  ///
  /// In fr, this message translates to:
  /// **'Aucune fixture RDM trouvée. Lancez une recherche.'**
  String get rdmEmptyState;

  /// No description provided for @rdmDeviceCountLabel.
  ///
  /// In fr, this message translates to:
  /// **'{count} fixture(s) trouvée(s)'**
  String rdmDeviceCountLabel(Object count);

  /// No description provided for @rdmUidLabel.
  ///
  /// In fr, this message translates to:
  /// **'UID'**
  String get rdmUidLabel;

  /// No description provided for @rdmManufacturerLabel.
  ///
  /// In fr, this message translates to:
  /// **'Fabricant'**
  String get rdmManufacturerLabel;

  /// No description provided for @rdmStartAddressLabel.
  ///
  /// In fr, this message translates to:
  /// **'Adresse DMX'**
  String get rdmStartAddressLabel;

  /// No description provided for @rdmFootprintLabel.
  ///
  /// In fr, this message translates to:
  /// **'Empreinte (canaux)'**
  String get rdmFootprintLabel;

  /// No description provided for @rdmPersonalityLabel.
  ///
  /// In fr, this message translates to:
  /// **'Mode (personality)'**
  String get rdmPersonalityLabel;

  /// No description provided for @rdmSoftwareVersionLabel.
  ///
  /// In fr, this message translates to:
  /// **'Version logicielle'**
  String get rdmSoftwareVersionLabel;

  /// No description provided for @rdmIdentifyButton.
  ///
  /// In fr, this message translates to:
  /// **'Identifier'**
  String get rdmIdentifyButton;

  /// No description provided for @rdmEditTitle.
  ///
  /// In fr, this message translates to:
  /// **'Modifier la fixture'**
  String get rdmEditTitle;

  /// No description provided for @rdmConfirmSetStartAddress.
  ///
  /// In fr, this message translates to:
  /// **'Changer l\'adresse DMX de {uid} en {value} ?'**
  String rdmConfirmSetStartAddress(Object uid, Object value);

  /// No description provided for @rdmConfirmSetPersonality.
  ///
  /// In fr, this message translates to:
  /// **'Changer le mode de {uid} en {value} ?'**
  String rdmConfirmSetPersonality(Object uid, Object value);

  /// No description provided for @rdmConfirmSetLabel.
  ///
  /// In fr, this message translates to:
  /// **'Renommer {uid} en « {value} » ?'**
  String rdmConfirmSetLabel(Object uid, Object value);

  /// No description provided for @rdmConfirmButton.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer'**
  String get rdmConfirmButton;

  /// No description provided for @rdmCancelButton.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get rdmCancelButton;

  /// No description provided for @rdmSetSuccess.
  ///
  /// In fr, this message translates to:
  /// **'Modifié avec succès'**
  String get rdmSetSuccess;

  /// No description provided for @rdmSetFailed.
  ///
  /// In fr, this message translates to:
  /// **'Échec de la modification'**
  String get rdmSetFailed;

  /// No description provided for @rdmNoResponse.
  ///
  /// In fr, this message translates to:
  /// **'Pas de réponse de la fixture'**
  String get rdmNoResponse;

  /// No description provided for @rdmRefreshTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Rafraîchir'**
  String get rdmRefreshTooltip;

  /// No description provided for @rdmWriteWarning.
  ///
  /// In fr, this message translates to:
  /// **'Modifier une fixture en direct peut perturber un show en cours. À utiliser avec précaution.'**
  String get rdmWriteWarning;

  /// No description provided for @vconsoleTargetBroadcast.
  ///
  /// In fr, this message translates to:
  /// **'Broadcast (auto)'**
  String get vconsoleTargetBroadcast;

  /// No description provided for @vconsoleTargetUnicast.
  ///
  /// In fr, this message translates to:
  /// **'IP précise'**
  String get vconsoleTargetUnicast;

  /// No description provided for @vconsoleManualIpLabel.
  ///
  /// In fr, this message translates to:
  /// **'IP du node (ex: 192.168.1.50)'**
  String get vconsoleManualIpLabel;

  /// No description provided for @vconsoleStop.
  ///
  /// In fr, this message translates to:
  /// **'Arrêter l\'envoi'**
  String get vconsoleStop;

  /// No description provided for @vconsoleStart.
  ///
  /// In fr, this message translates to:
  /// **'Démarrer l\'envoi'**
  String get vconsoleStart;

  /// No description provided for @vconsoleBlackout.
  ///
  /// In fr, this message translates to:
  /// **'Blackout'**
  String get vconsoleBlackout;

  /// No description provided for @vconsoleStatusLive.
  ///
  /// In fr, this message translates to:
  /// **'En direct • {fps} fps'**
  String vconsoleStatusLive(Object fps);

  /// No description provided for @vconsoleStatusStopped.
  ///
  /// In fr, this message translates to:
  /// **'Arrêté'**
  String get vconsoleStatusStopped;

  /// No description provided for @vconsoleUniversePill.
  ///
  /// In fr, this message translates to:
  /// **'Univers {universe}'**
  String vconsoleUniversePill(Object universe);

  /// No description provided for @vconsoleTargetPill.
  ///
  /// In fr, this message translates to:
  /// **'→ {target}'**
  String vconsoleTargetPill(Object target);

  /// No description provided for @vconsoleErrorLabel.
  ///
  /// In fr, this message translates to:
  /// **'Erreur : {message}'**
  String vconsoleErrorLabel(Object message);

  /// No description provided for @vconsoleStartFailed.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de démarrer : {message}'**
  String vconsoleStartFailed(Object message);

  /// No description provided for @vconsoleTabFaders.
  ///
  /// In fr, this message translates to:
  /// **'Faders simples'**
  String get vconsoleTabFaders;

  /// No description provided for @vconsoleTabGdtf.
  ///
  /// In fr, this message translates to:
  /// **'GDTF'**
  String get vconsoleTabGdtf;

  /// No description provided for @vconsoleTabPatch.
  ///
  /// In fr, this message translates to:
  /// **'Mon Patch'**
  String get vconsoleTabPatch;

  /// No description provided for @vconsoleChannelCountLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nombre de canaux'**
  String get vconsoleChannelCountLabel;

  /// No description provided for @vconsoleAllZero.
  ///
  /// In fr, this message translates to:
  /// **'Tout à 0'**
  String get vconsoleAllZero;

  /// No description provided for @vconsoleAllFull.
  ///
  /// In fr, this message translates to:
  /// **'Tout à 255'**
  String get vconsoleAllFull;

  /// No description provided for @vconsoleSearchTitle.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher sur GDTF Share'**
  String get vconsoleSearchTitle;

  /// No description provided for @vconsoleSearchHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex: MAC Viper, Spiider...'**
  String get vconsoleSearchHint;

  /// No description provided for @vconsoleImportLocal.
  ///
  /// In fr, this message translates to:
  /// **'Importer un fichier .gdtf'**
  String get vconsoleImportLocal;

  /// No description provided for @vconsoleModeDialogTitleFor.
  ///
  /// In fr, this message translates to:
  /// **'Mode DMX — {fixture}'**
  String vconsoleModeDialogTitleFor(Object fixture);

  /// No description provided for @vconsoleModeDialogOption.
  ///
  /// In fr, this message translates to:
  /// **'{mode} ({count} ch)'**
  String vconsoleModeDialogOption(Object mode, Object count);

  /// No description provided for @vconsoleModeDialogTitleGeneric.
  ///
  /// In fr, this message translates to:
  /// **'Mode DMX'**
  String get vconsoleModeDialogTitleGeneric;

  /// No description provided for @vconsoleNoModeFound.
  ///
  /// In fr, this message translates to:
  /// **'Aucun mode DMX trouvé dans ce fichier .gdtf'**
  String get vconsoleNoModeFound;

  /// No description provided for @vconsolePickFailed.
  ///
  /// In fr, this message translates to:
  /// **'Sélection impossible : {message}'**
  String vconsolePickFailed(Object message);

  /// No description provided for @vconsoleDownloadFailed.
  ///
  /// In fr, this message translates to:
  /// **'Téléchargement impossible ({code})'**
  String vconsoleDownloadFailed(Object code);

  /// No description provided for @vconsoleSearchResultSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'{count} mode(s) • {size}'**
  String vconsoleSearchResultSubtitle(Object count, Object size);

  /// No description provided for @vconsoleChooseFixtureHint.
  ///
  /// In fr, this message translates to:
  /// **'Choisis une fixture pour afficher ses faders.'**
  String get vconsoleChooseFixtureHint;

  /// No description provided for @vconsolePatchSectionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mon Patch (import MVR)'**
  String get vconsolePatchSectionTitle;

  /// No description provided for @vconsolePatchEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucune fixture patchée pour l\'instant. Importe un fichier MVR depuis l\'outil Patch pour les retrouver ici.'**
  String get vconsolePatchEmpty;

  /// No description provided for @vconsolePatchEntrySubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Univers {universe} • {start}-{end} • {count} ch'**
  String vconsolePatchEntrySubtitle(
      Object universe, Object start, Object end, Object count);

  /// No description provided for @vconsoleChoosePatchedFixtureHint.
  ///
  /// In fr, this message translates to:
  /// **'Choisis une fixture patchée pour afficher ses faders.'**
  String get vconsoleChoosePatchedFixtureHint;

  /// No description provided for @vconsoleStartAddressLabel.
  ///
  /// In fr, this message translates to:
  /// **'Adresse de départ'**
  String get vconsoleStartAddressLabel;

  /// No description provided for @vconsoleFixtureFallbackTitle.
  ///
  /// In fr, this message translates to:
  /// **'Fixture'**
  String get vconsoleFixtureFallbackTitle;

  /// No description provided for @vconsoleUniverseArrow.
  ///
  /// In fr, this message translates to:
  /// **'→ univers {universe}'**
  String vconsoleUniverseArrow(Object universe);

  /// No description provided for @vconsoleSearchError.
  ///
  /// In fr, this message translates to:
  /// **'Erreur {code}'**
  String vconsoleSearchError(Object code);

  /// No description provided for @vconsoleNetworkError.
  ///
  /// In fr, this message translates to:
  /// **'Erreur réseau : {message}'**
  String vconsoleNetworkError(Object message);

  /// No description provided for @vconsoleChannelShortLabel.
  ///
  /// In fr, this message translates to:
  /// **'Ch {n}'**
  String vconsoleChannelShortLabel(Object n);

  /// No description provided for @vconsoleContinueToSource.
  ///
  /// In fr, this message translates to:
  /// **'Choisir la source'**
  String get vconsoleContinueToSource;

  /// No description provided for @vconsoleContinueToSourceHint.
  ///
  /// In fr, this message translates to:
  /// **'Faders simples, fixture GDTF ou machine déjà patchée (MVR).'**
  String get vconsoleContinueToSourceHint;

  /// No description provided for @vconsoleControlGroupTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Piloter tout le groupe'**
  String get vconsoleControlGroupTooltip;

  /// No description provided for @vconsoleGroupInfo.
  ///
  /// In fr, this message translates to:
  /// **'{count} machine(s) • univers {universe}'**
  String vconsoleGroupInfo(Object count, Object universe);

  /// No description provided for @vconsoleGroupInfoWithExcluded.
  ///
  /// In fr, this message translates to:
  /// **'{count} machine(s) • univers {universe} • {excluded} hors groupe (autre univers)'**
  String vconsoleGroupInfoWithExcluded(
      Object count, Object universe, Object excluded);

  /// No description provided for @vconsoleGroupSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'{count} machines • univers {universes}'**
  String vconsoleGroupSubtitle(Object count, Object universes);

  /// No description provided for @vconsoleOpenFaders.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrir la console'**
  String get vconsoleOpenFaders;

  /// No description provided for @vconsolePresetsTitleFor.
  ///
  /// In fr, this message translates to:
  /// **'Presets — {channel}'**
  String vconsolePresetsTitleFor(Object channel);

  /// No description provided for @vconsolePresetsTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Presets'**
  String get vconsolePresetsTooltip;

  /// No description provided for @vconsoleSourceStepTitle.
  ///
  /// In fr, this message translates to:
  /// **'Choisir la source'**
  String get vconsoleSourceStepTitle;

  /// No description provided for @vconsoleUnit8Bit.
  ///
  /// In fr, this message translates to:
  /// **'8 bit'**
  String get vconsoleUnit8Bit;

  /// No description provided for @vconsoleUnitPercent.
  ///
  /// In fr, this message translates to:
  /// **'%'**
  String get vconsoleUnitPercent;

  /// No description provided for @vconsoleHomeTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Position Home (dimmer 100%, pan/tilt centrés, shutter ouvert)'**
  String get vconsoleHomeTooltip;

  /// No description provided for @vconsoleHomeButton.
  ///
  /// In fr, this message translates to:
  /// **'Home'**
  String get vconsoleHomeButton;

  /// No description provided for @filterCorrespondenceTitle.
  ///
  /// In fr, this message translates to:
  /// **'Correspondance filtres'**
  String get filterCorrespondenceTitle;

  /// No description provided for @filterCorrespondenceSearchHint.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher (n° ou nom)…'**
  String get filterCorrespondenceSearchHint;

  /// No description provided for @filterCorrespondenceColLeeName.
  ///
  /// In fr, this message translates to:
  /// **'Lee / Nom'**
  String get filterCorrespondenceColLeeName;

  /// No description provided for @filterCorrespondenceEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucune correspondance'**
  String get filterCorrespondenceEmpty;

  /// No description provided for @filterCorrespondenceResultsCount.
  ///
  /// In fr, this message translates to:
  /// **'{count} correspondance(s)'**
  String filterCorrespondenceResultsCount(Object count);

  /// No description provided for @filterCorrespondenceFilteredOf.
  ///
  /// In fr, this message translates to:
  /// **' (filtré sur {total})'**
  String filterCorrespondenceFilteredOf(Object total);

  /// No description provided for @lbResetDialogTitle.
  ///
  /// In fr, this message translates to:
  /// **'Tout remettre à zéro ?'**
  String get lbResetDialogTitle;

  /// No description provided for @lbResetDialogBody.
  ///
  /// In fr, this message translates to:
  /// **'La liste de fixtures sera vidée. La config du tableau sera conservée.'**
  String get lbResetDialogBody;

  /// No description provided for @lbClearAction.
  ///
  /// In fr, this message translates to:
  /// **'Vider'**
  String get lbClearAction;

  /// No description provided for @lbPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Répartition de charge'**
  String get lbPageTitle;

  /// No description provided for @lbResetTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Remettre à zéro'**
  String get lbResetTooltip;

  /// No description provided for @lbPanelConfigTitle.
  ///
  /// In fr, this message translates to:
  /// **'Configuration du tableau'**
  String get lbPanelConfigTitle;

  /// No description provided for @lbVoltageTypeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Type de réseau'**
  String get lbVoltageTypeLabel;

  /// No description provided for @lbPanelSizeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Taille du tableau'**
  String get lbPanelSizeLabel;

  /// No description provided for @lbCosPhiLabel.
  ///
  /// In fr, this message translates to:
  /// **'Facteur de puissance (cos φ)'**
  String get lbCosPhiLabel;

  /// No description provided for @lbPhaseGaugesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Ampérage par phase'**
  String get lbPhaseGaugesTitle;

  /// No description provided for @lbFixturesListTitle.
  ///
  /// In fr, this message translates to:
  /// **'Fixtures — {count} lignes · {totalW} W total'**
  String lbFixturesListTitle(Object count, Object totalW);

  /// No description provided for @lbEmptyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Aucune fixture pour l\'instant'**
  String get lbEmptyTitle;

  /// No description provided for @lbEmptyBody.
  ///
  /// In fr, this message translates to:
  /// **'Appuie sur + pour ajouter\ndepuis le catalogue.'**
  String get lbEmptyBody;

  /// No description provided for @lbAddFixtureButton.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter une fixture'**
  String get lbAddFixtureButton;

  /// No description provided for @lbSheetTitleDefault.
  ///
  /// In fr, this message translates to:
  /// **'⚡ Ajouter une fixture'**
  String get lbSheetTitleDefault;

  /// No description provided for @lbPickerSearchHint.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher fabricant ou fixture…'**
  String get lbPickerSearchHint;

  /// No description provided for @lbNoResults.
  ///
  /// In fr, this message translates to:
  /// **'Aucun résultat 🤷'**
  String get lbNoResults;

  /// No description provided for @lbProductsWithPowerCount.
  ///
  /// In fr, this message translates to:
  /// **'{count} fixture(s) avec données conso'**
  String lbProductsWithPowerCount(Object count);

  /// No description provided for @lbUnknownPower.
  ///
  /// In fr, this message translates to:
  /// **'conso inconnue'**
  String get lbUnknownPower;

  /// No description provided for @lbFixtureSectionLabel.
  ///
  /// In fr, this message translates to:
  /// **'Fixture'**
  String get lbFixtureSectionLabel;

  /// No description provided for @lbPowerLabel.
  ///
  /// In fr, this message translates to:
  /// **'Consommation (W)'**
  String get lbPowerLabel;

  /// No description provided for @lbQuantityLabel.
  ///
  /// In fr, this message translates to:
  /// **'Quantité'**
  String get lbQuantityLabel;

  /// No description provided for @lbPhaseLabel.
  ///
  /// In fr, this message translates to:
  /// **'Phase'**
  String get lbPhaseLabel;

  /// No description provided for @lbPowerHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 350'**
  String get lbPowerHint;

  /// No description provided for @lbAddToDistribution.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter à la distribution'**
  String get lbAddToDistribution;

  /// No description provided for @filterLedFiltreLabel.
  ///
  /// In fr, this message translates to:
  /// **'Filtre'**
  String get filterLedFiltreLabel;

  /// No description provided for @filterLedTransmissionLabel.
  ///
  /// In fr, this message translates to:
  /// **'Transmission'**
  String get filterLedTransmissionLabel;

  /// No description provided for @filterLedSaveProfileTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Sauvegarder le profil'**
  String get filterLedSaveProfileTooltip;

  /// No description provided for @filterLedColorComparisonTitle.
  ///
  /// In fr, this message translates to:
  /// **'Comparaison couleur'**
  String get filterLedColorComparisonTitle;

  /// No description provided for @proHeaderBody.
  ///
  /// In fr, this message translates to:
  /// **'Débloque tous les outils avancés pour les techniciens lumière, vidéo et laser.'**
  String get proHeaderBody;

  /// No description provided for @proPerYear.
  ///
  /// In fr, this message translates to:
  /// **'/ an'**
  String get proPerYear;

  /// No description provided for @proSubscribeButton.
  ///
  /// In fr, this message translates to:
  /// **'S\'abonner'**
  String get proSubscribeButton;

  /// No description provided for @proRestorePurchases.
  ///
  /// In fr, this message translates to:
  /// **'Restaurer les achats'**
  String get proRestorePurchases;

  /// No description provided for @proPrivacyPolicy.
  ///
  /// In fr, this message translates to:
  /// **'Politique de confidentialité'**
  String get proPrivacyPolicy;

  /// No description provided for @proTermsOfUse.
  ///
  /// In fr, this message translates to:
  /// **'Conditions d\'utilisation'**
  String get proTermsOfUse;

  /// No description provided for @rfIm3ConflictBadge.
  ///
  /// In fr, this message translates to:
  /// **'⚠ CONFLIT'**
  String get rfIm3ConflictBadge;

  /// No description provided for @filterLedHideCalibration.
  ///
  /// In fr, this message translates to:
  /// **'Masquer calibration'**
  String get filterLedHideCalibration;

  /// No description provided for @filterLedShowCalibration.
  ///
  /// In fr, this message translates to:
  /// **'Calibrer ma fixture'**
  String get filterLedShowCalibration;

  /// No description provided for @aboutAudioTitle.
  ///
  /// In fr, this message translates to:
  /// **'Audio — son & diffusion'**
  String get aboutAudioTitle;

  /// No description provided for @aboutAudioSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Gain staging, SPL/distance, délais, subs cardioïdes, câblage.'**
  String get aboutAudioSubtitle;

  /// No description provided for @aboutAudioPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Audio — repères terrain'**
  String get aboutAudioPageTitle;

  /// No description provided for @audioRefTocCopyText.
  ///
  /// In fr, this message translates to:
  /// **'Copier le sommaire'**
  String get audioRefTocCopyText;

  /// No description provided for @audioRefSection1Title.
  ///
  /// In fr, this message translates to:
  /// **'Chaîne du signal & gain staging'**
  String get audioRefSection1Title;

  /// No description provided for @audioRefSection1FormulasTitle.
  ///
  /// In fr, this message translates to:
  /// **'Repères de niveaux'**
  String get audioRefSection1FormulasTitle;

  /// No description provided for @audioRefSection1Formula1.
  ///
  /// In fr, this message translates to:
  /// **'0 dBu ≈ 0,775 V RMS — référence pro analogique'**
  String get audioRefSection1Formula1;

  /// No description provided for @audioRefSection1Formula2.
  ///
  /// In fr, this message translates to:
  /// **'0 dBFS = niveau numérique maximal avant écrêtage — toujours garder de la marge (headroom)'**
  String get audioRefSection1Formula2;

  /// No description provided for @audioRefSection1Formula3.
  ///
  /// In fr, this message translates to:
  /// **'Gain staging : régler chaque étage (source → console → ampli) pour un bon rapport signal/bruit, sans saturer'**
  String get audioRefSection1Formula3;

  /// No description provided for @audioRefSection1FieldMarksTitle.
  ///
  /// In fr, this message translates to:
  /// **'Repères terrain'**
  String get audioRefSection1FieldMarksTitle;

  /// No description provided for @audioRefSection1FieldMark1.
  ///
  /// In fr, this message translates to:
  /// **'Vise un niveau d\'entrée qui pulse dans le vert/jaune, jamais dans le rouge en continu'**
  String get audioRefSection1FieldMark1;

  /// No description provided for @audioRefSection1FieldMark2.
  ///
  /// In fr, this message translates to:
  /// **'Un système mal réglé sonne bruyant même à faible volume : le problème vient souvent d\'un étage saturé en amont'**
  String get audioRefSection1FieldMark2;

  /// No description provided for @audioRefSection2Title.
  ///
  /// In fr, this message translates to:
  /// **'SPL & distance'**
  String get audioRefSection2Title;

  /// No description provided for @audioRefSection2FormulaTitle.
  ///
  /// In fr, this message translates to:
  /// **'Loi de l\'inverse du carré'**
  String get audioRefSection2FormulaTitle;

  /// No description provided for @audioRefSection2Formula1.
  ///
  /// In fr, this message translates to:
  /// **'Chaque doublement de distance = -6 dB SPL en champ libre'**
  String get audioRefSection2Formula1;

  /// No description provided for @audioRefSection2Formula2.
  ///
  /// In fr, this message translates to:
  /// **'SPL(d2) = SPL(d1) - 20 × log10(d2 / d1)'**
  String get audioRefSection2Formula2;

  /// No description provided for @audioRefSection2NoteTitle.
  ///
  /// In fr, this message translates to:
  /// **'À nuancer sur le terrain'**
  String get audioRefSection2NoteTitle;

  /// No description provided for @audioRefSection2Note1.
  ///
  /// In fr, this message translates to:
  /// **'En intérieur, les réflexions (murs, plafond) réduisent la chute réelle par rapport à la théorie'**
  String get audioRefSection2Note1;

  /// No description provided for @audioRefSection2Note2.
  ///
  /// In fr, this message translates to:
  /// **'Un line array bien conçu chute moins vite qu\'une source ponctuelle sur l\'axe de couverture'**
  String get audioRefSection2Note2;

  /// No description provided for @audioRefSection3Title.
  ///
  /// In fr, this message translates to:
  /// **'Alignement de délai (time alignment)'**
  String get audioRefSection3Title;

  /// No description provided for @audioRefSection3Paragraph.
  ///
  /// In fr, this message translates to:
  /// **'Un système annexe (delay tower, rappel de façade) doit être retardé pour que son son arrive en même temps que celui du système principal, perçu comme une seule source.'**
  String get audioRefSection3Paragraph;

  /// No description provided for @audioRefSection3FormulaTitle.
  ///
  /// In fr, this message translates to:
  /// **'Formule de base'**
  String get audioRefSection3FormulaTitle;

  /// No description provided for @audioRefSection3Formula1.
  ///
  /// In fr, this message translates to:
  /// **'Délai (ms) = distance entre les systèmes (m) / 0,343 m/ms (vitesse du son ≈ 343 m/s)'**
  String get audioRefSection3Formula1;

  /// No description provided for @audioRefSection3TipsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Bonnes pratiques'**
  String get audioRefSection3TipsTitle;

  /// No description provided for @audioRefSection3Tip1.
  ///
  /// In fr, this message translates to:
  /// **'Mesure la distance réelle entre les deux sources, pas juste la distance au public'**
  String get audioRefSection3Tip1;

  /// No description provided for @audioRefSection3Tip2.
  ///
  /// In fr, this message translates to:
  /// **'Ajoute quelques ms de délai supplémentaire (2-5 ms) pour renforcer l\'effet de précédence (loi de Haas) et garder le système principal comme source perçue'**
  String get audioRefSection3Tip2;

  /// No description provided for @audioRefSection3Tip3.
  ///
  /// In fr, this message translates to:
  /// **'Vérifie à l\'oreille et/ou avec un analyseur (ex: corrélation de phase) après réglage'**
  String get audioRefSection3Tip3;

  /// No description provided for @audioRefSection4Title.
  ///
  /// In fr, this message translates to:
  /// **'Directivité de subs (cardioïde / end-fire)'**
  String get audioRefSection4Title;

  /// No description provided for @audioRefSection4Paragraph.
  ///
  /// In fr, this message translates to:
  /// **'Un arrangement cardioïde ou end-fire réduit l\'énergie basse envoyée vers la scène/régie en renforçant celle vers le public, en jouant sur le délai et la polarité entre subs.'**
  String get audioRefSection4Paragraph;

  /// No description provided for @audioRefSection4TypesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Configurations courantes'**
  String get audioRefSection4TypesTitle;

  /// No description provided for @audioRefSection4Type1.
  ///
  /// In fr, this message translates to:
  /// **'End-fire : subs alignés en ligne, celui de devant avancé et retardé électroniquement'**
  String get audioRefSection4Type1;

  /// No description provided for @audioRefSection4Type2.
  ///
  /// In fr, this message translates to:
  /// **'Cardioïde 2 subs : un sub avant (normal), un sub arrière inversé en polarité et retardé'**
  String get audioRefSection4Type2;

  /// No description provided for @audioRefSection4Type3.
  ///
  /// In fr, this message translates to:
  /// **'Cardioïde 3 subs : deux avant en phase, un arrière inversé et retardé — meilleur compromis niveau/rejet arrière'**
  String get audioRefSection4Type3;

  /// No description provided for @audioRefSection5Title.
  ///
  /// In fr, this message translates to:
  /// **'Câblage & connecteurs'**
  String get audioRefSection5Title;

  /// No description provided for @audioRefSection5XlrTitle.
  ///
  /// In fr, this message translates to:
  /// **'XLR symétrique'**
  String get audioRefSection5XlrTitle;

  /// No description provided for @audioRefSection5XlrBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Toujours préférer une liaison symétrique (XLR/TRS) sur de longues distances pour rejeter les parasites'**
  String get audioRefSection5XlrBullet1;

  /// No description provided for @audioRefSection5XlrBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Au-delà de ~50-100 m en analogique, envisage une liaison numérique (AES/EBU, Dante, etc.)'**
  String get audioRefSection5XlrBullet2;

  /// No description provided for @audioRefSection5SpeakonTitle.
  ///
  /// In fr, this message translates to:
  /// **'Speakon (haut-parleurs)'**
  String get audioRefSection5SpeakonTitle;

  /// No description provided for @audioRefSection5SpeakonBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Ne jamais utiliser de XLR pour du haut-parleur : la puissance véhiculée peut endommager du matériel prévu pour du signal ligne'**
  String get audioRefSection5SpeakonBullet1;

  /// No description provided for @audioRefSection5SpeakonBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Vérifie la section de câble adaptée à la puissance et à la distance (chute de tension) avant un tirage long'**
  String get audioRefSection5SpeakonBullet2;

  /// No description provided for @audioRefSection5GroundTitle.
  ///
  /// In fr, this message translates to:
  /// **'Masse & ronflement'**
  String get audioRefSection5GroundTitle;

  /// No description provided for @audioRefSection5GroundBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Une boucle de masse (ground loop) entre deux appareils reliés au secteur par des chemins différents peut créer un ronflement 50/60 Hz'**
  String get audioRefSection5GroundBullet1;

  /// No description provided for @audioRefSection5GroundBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Un « ground lift » ou un DI box avec isolation galvanique peut résoudre ce problème sans couper la terre de sécurité'**
  String get audioRefSection5GroundBullet2;

  /// No description provided for @audioRefSection6Title.
  ///
  /// In fr, this message translates to:
  /// **'Sécurité auditive & bonnes pratiques'**
  String get audioRefSection6Title;

  /// No description provided for @audioRefSection6DontDoTitle.
  ///
  /// In fr, this message translates to:
  /// **'À éviter'**
  String get audioRefSection6DontDoTitle;

  /// No description provided for @audioRefSection6DontDoBullet1.
  ///
  /// In fr, this message translates to:
  /// **'Exposer le public ou l\'équipe à plus de 100 dB SPL en continu sans limitation de durée'**
  String get audioRefSection6DontDoBullet1;

  /// No description provided for @audioRefSection6DontDoBullet2.
  ///
  /// In fr, this message translates to:
  /// **'Pousser un système au-delà de sa puissance nominale pour compenser un mauvais placement'**
  String get audioRefSection6DontDoBullet2;

  /// No description provided for @audioRefSection6WarningTitle.
  ///
  /// In fr, this message translates to:
  /// **'Repères d\'exposition'**
  String get audioRefSection6WarningTitle;

  /// No description provided for @audioRefSection6WarningBullet1.
  ///
  /// In fr, this message translates to:
  /// **'85 dB SPL : limite recommandée pour une exposition prolongée (8h) sans protection'**
  String get audioRefSection6WarningBullet1;

  /// No description provided for @audioRefSection6WarningBullet2.
  ///
  /// In fr, this message translates to:
  /// **'100 dB SPL : quelques minutes seulement avant risque, la plupart des concerts dépassent ce seuil'**
  String get audioRefSection6WarningBullet2;

  /// No description provided for @audioRefSection6WarningBullet3.
  ///
  /// In fr, this message translates to:
  /// **'Utilise systématiquement un limiteur système en sortie pour protéger le matériel et le public'**
  String get audioRefSection6WarningBullet3;

  /// No description provided for @audioRefSection7Title.
  ///
  /// In fr, this message translates to:
  /// **'Checklist rapide'**
  String get audioRefSection7Title;

  /// No description provided for @audioRefSection7QuickTitle.
  ///
  /// In fr, this message translates to:
  /// **'Avant le show'**
  String get audioRefSection7QuickTitle;

  /// No description provided for @audioRefSection7Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Gain staging vérifié de la source à l\'ampli, aucune saturation'**
  String get audioRefSection7Bullet1;

  /// No description provided for @audioRefSection7Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Délais des systèmes annexes calculés et appliqués'**
  String get audioRefSection7Bullet2;

  /// No description provided for @audioRefSection7Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Limiteur système actif et réglé'**
  String get audioRefSection7Bullet3;

  /// No description provided for @audioRefSection7Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Polarité vérifiée entre subs et top (pas d\'annulation)'**
  String get audioRefSection7Bullet4;

  /// No description provided for @audioRefSection7Bullet5.
  ///
  /// In fr, this message translates to:
  /// **'Niveau SPL mesuré en régie et en fond de salle'**
  String get audioRefSection7Bullet5;

  /// No description provided for @audioRefFooterNote.
  ///
  /// In fr, this message translates to:
  /// **'Ces repères sont généraux — vérifie toujours les préconisations du fabricant et la réglementation locale sur les niveaux sonores.'**
  String get audioRefFooterNote;

  /// No description provided for @aboutRfTitle.
  ///
  /// In fr, this message translates to:
  /// **'RF — HF & Wi-Fi'**
  String get aboutRfTitle;

  /// No description provided for @aboutRfSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Bandes UHF, Wi-Fi, coexistence IM3, antennes, scan RF.'**
  String get aboutRfSubtitle;

  /// No description provided for @aboutRfPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'RF — repères terrain'**
  String get aboutRfPageTitle;

  /// No description provided for @rfRefTocCopyText.
  ///
  /// In fr, this message translates to:
  /// **'Copier le sommaire'**
  String get rfRefTocCopyText;

  /// No description provided for @rfRefSection1Title.
  ///
  /// In fr, this message translates to:
  /// **'Bases du spectre RF'**
  String get rfRefSection1Title;

  /// No description provided for @rfRefSection1FormulasTitle.
  ///
  /// In fr, this message translates to:
  /// **'Repères fréquence / longueur d\'onde'**
  String get rfRefSection1FormulasTitle;

  /// No description provided for @rfRefSection1Formula1.
  ///
  /// In fr, this message translates to:
  /// **'λ (m) = 300 / f (MHz) — longueur d\'onde approximative'**
  String get rfRefSection1Formula1;

  /// No description provided for @rfRefSection1Formula2.
  ///
  /// In fr, this message translates to:
  /// **'Plus la fréquence est haute, plus la longueur d\'onde est courte et plus la portée en espace dégagé diminue'**
  String get rfRefSection1Formula2;

  /// No description provided for @rfRefSection1FieldMarksTitle.
  ///
  /// In fr, this message translates to:
  /// **'Repères terrain'**
  String get rfRefSection1FieldMarksTitle;

  /// No description provided for @rfRefSection1FieldMark1.
  ///
  /// In fr, this message translates to:
  /// **'Le corps humain absorbe et réfléchit les ondes RF — la position d\'un récepteur HF sur le corps influence la réception'**
  String get rfRefSection1FieldMark1;

  /// No description provided for @rfRefSection1FieldMark2.
  ///
  /// In fr, this message translates to:
  /// **'Privilégie toujours une ligne de vue directe (line of sight) entre émetteur et récepteur'**
  String get rfRefSection1FieldMark2;

  /// No description provided for @rfRefSection2Title.
  ///
  /// In fr, this message translates to:
  /// **'Bandes UHF pour micros HF'**
  String get rfRefSection2Title;

  /// No description provided for @rfRefSection2Paragraph.
  ///
  /// In fr, this message translates to:
  /// **'Les micros et in-ears HF utilisent principalement la bande UHF (470-694 MHz en Europe selon les pays), partagée avec la diffusion TV — la disponibilité réelle dépend de la réglementation locale.'**
  String get rfRefSection2Paragraph;

  /// No description provided for @rfRefSection2NoteTitle.
  ///
  /// In fr, this message translates to:
  /// **'À vérifier avant chaque date'**
  String get rfRefSection2NoteTitle;

  /// No description provided for @rfRefSection2Note1.
  ///
  /// In fr, this message translates to:
  /// **'Les bandes disponibles varient selon le pays — vérifie la réglementation locale (ANFR en France, Ofcom au Royaume-Uni, etc.)'**
  String get rfRefSection2Note1;

  /// No description provided for @rfRefSection2Note2.
  ///
  /// In fr, this message translates to:
  /// **'Une bande libre à un endroit peut être occupée par un émetteur TV ou un autre prestataire ailleurs'**
  String get rfRefSection2Note2;

  /// No description provided for @rfRefSection3Title.
  ///
  /// In fr, this message translates to:
  /// **'Wi-Fi 2,4 GHz vs 5 GHz'**
  String get rfRefSection3Title;

  /// No description provided for @rfRefSection3TableTitle.
  ///
  /// In fr, this message translates to:
  /// **'Différences clés'**
  String get rfRefSection3TableTitle;

  /// No description provided for @rfRefSection3Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'2,4 GHz : 3 canaux non-chevauchants (1, 6, 11), meilleure portée, plus encombré (Bluetooth, micros HF haut de bande, autres réseaux)'**
  String get rfRefSection3Bullet1;

  /// No description provided for @rfRefSection3Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'5 GHz : beaucoup plus de canaux non-chevauchants, débit supérieur, portée plus courte, moins d\'interférences en général'**
  String get rfRefSection3Bullet2;

  /// No description provided for @rfRefSection3Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Pour la régie/contrôle (consoles, visualisation), privilégier le 5 GHz quand c\'est possible'**
  String get rfRefSection3Bullet3;

  /// No description provided for @rfRefSection4Title.
  ///
  /// In fr, this message translates to:
  /// **'Coexistence & intermodulation (IM3)'**
  String get rfRefSection4Title;

  /// No description provided for @rfRefSection4Paragraph.
  ///
  /// In fr, this message translates to:
  /// **'Quand plusieurs émetteurs HF fonctionnent ensemble, leurs fréquences peuvent créer des produits d\'intermodulation (IM3) qui tombent sur d\'autres fréquences utilisées et provoquent des interférences.'**
  String get rfRefSection4Paragraph;

  /// No description provided for @rfRefSection4FormulaTitle.
  ///
  /// In fr, this message translates to:
  /// **'Formule IM3 (3ᵉ ordre)'**
  String get rfRefSection4FormulaTitle;

  /// No description provided for @rfRefSection4Formula1.
  ///
  /// In fr, this message translates to:
  /// **'IM3 = 2×f1 − f2 et 2×f2 − f1'**
  String get rfRefSection4Formula1;

  /// No description provided for @rfRefSection4Tip1.
  ///
  /// In fr, this message translates to:
  /// **'Plus le nombre de canaux HF augmente, plus le risque de produits IM3 tombant sur une fréquence utilisée augmente — d\'où l\'intérêt d\'un plan de fréquences calculé en amont'**
  String get rfRefSection4Tip1;

  /// No description provided for @rfRefSection5Title.
  ///
  /// In fr, this message translates to:
  /// **'Antennes & diversity'**
  String get rfRefSection5Title;

  /// No description provided for @rfRefSection5Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'La réception « diversity » utilise deux antennes légèrement décalées pour éviter les zones d\'annulation (trous RF)'**
  String get rfRefSection5Bullet1;

  /// No description provided for @rfRefSection5Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Espace les antennes d\'au moins un quart de longueur d\'onde, sans les positionner en ligne droite avec l\'émetteur'**
  String get rfRefSection5Bullet2;

  /// No description provided for @rfRefSection5Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Évite de poser les antennes à même le sol ou collées à une structure métallique qui peut désaccorder ou masquer le signal'**
  String get rfRefSection5Bullet3;

  /// No description provided for @rfRefSection6Title.
  ///
  /// In fr, this message translates to:
  /// **'Scan RF avant un show'**
  String get rfRefSection6Title;

  /// No description provided for @rfRefSection6Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Toujours scanner la bande sur place, à l\'heure du show — l\'environnement RF change entre le jour et le soir (autres prestataires, public avec hotspots, etc.)'**
  String get rfRefSection6Bullet1;

  /// No description provided for @rfRefSection6Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Note les fréquences occupées et documente-les pour la prochaine date au même lieu si possible'**
  String get rfRefSection6Bullet2;

  /// No description provided for @rfRefSection6Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Prévois une marge de fréquences libres pour un remplacement de dernière minute (matériel HS, interférence imprévue)'**
  String get rfRefSection6Bullet3;

  /// No description provided for @rfRefSection7Title.
  ///
  /// In fr, this message translates to:
  /// **'Checklist rapide'**
  String get rfRefSection7Title;

  /// No description provided for @rfRefSection7Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Scan RF effectué à l\'heure du show'**
  String get rfRefSection7Bullet1;

  /// No description provided for @rfRefSection7Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Plan de fréquences calculé (IM3 vérifié)'**
  String get rfRefSection7Bullet2;

  /// No description provided for @rfRefSection7Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Antennes en ligne de vue, espacées correctement'**
  String get rfRefSection7Bullet3;

  /// No description provided for @rfRefSection7Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Bandes UHF utilisées conformes à la réglementation locale'**
  String get rfRefSection7Bullet4;

  /// No description provided for @rfRefFooterNote.
  ///
  /// In fr, this message translates to:
  /// **'La réglementation RF varie fortement selon le pays — vérifie toujours les fréquences autorisées localement avant un show.'**
  String get rfRefFooterNote;

  /// No description provided for @aboutLaserTitle.
  ///
  /// In fr, this message translates to:
  /// **'Laser — physique & sécurité'**
  String get aboutLaserTitle;

  /// No description provided for @aboutLaserSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Comment ça marche, scanners, classes, normes, NOHD/SZED/CZED.'**
  String get aboutLaserSubtitle;

  /// No description provided for @aboutLaserPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Laser — référence de terrain'**
  String get aboutLaserPageTitle;

  /// No description provided for @laserRefTocCopyText.
  ///
  /// In fr, this message translates to:
  /// **'Copier le sommaire'**
  String get laserRefTocCopyText;

  /// No description provided for @laserRefSection1Title.
  ///
  /// In fr, this message translates to:
  /// **'Qu\'est-ce qu\'un laser ?'**
  String get laserRefSection1Title;

  /// No description provided for @laserRefSection1AcronymTitle.
  ///
  /// In fr, this message translates to:
  /// **'L\'acronyme LASER'**
  String get laserRefSection1AcronymTitle;

  /// No description provided for @laserRefSection1AcronymBody.
  ///
  /// In fr, this message translates to:
  /// **'LASER signifie « Light Amplification by Stimulated Emission of Radiation » (amplification de lumière par émission stimulée de rayonnement).'**
  String get laserRefSection1AcronymBody;

  /// No description provided for @laserRefSection1HowTitle.
  ///
  /// In fr, this message translates to:
  /// **'Le principe physique'**
  String get laserRefSection1HowTitle;

  /// No description provided for @laserRefSection1HowBody.
  ///
  /// In fr, this message translates to:
  /// **'Un milieu actif (diode, cristal DPSS...) est « pompé » électriquement ou optiquement, ce qui provoque une émission stimulée de photons. Une cavité résonante (deux miroirs, dont un semi-réfléchissant) amplifie cette lumière, qui ressort cohérente, monochromatique et très collimatée — contrairement à une source lumineuse classique.'**
  String get laserRefSection1HowBody;

  /// No description provided for @laserRefSection1TypesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Types courants en spectacle'**
  String get laserRefSection1TypesTitle;

  /// No description provided for @laserRefSection1Type1.
  ///
  /// In fr, this message translates to:
  /// **'Diode directe : compacte, souvent utilisée en RGB pour mélanger les couleurs'**
  String get laserRefSection1Type1;

  /// No description provided for @laserRefSection1Type2.
  ///
  /// In fr, this message translates to:
  /// **'DPSS (Diode Pumped Solid State) : diode qui pompe un cristal, historiquement utilisée pour le vert et d\'autres longueurs d\'onde spécifiques'**
  String get laserRefSection1Type2;

  /// No description provided for @laserRefSection2Title.
  ///
  /// In fr, this message translates to:
  /// **'Comment on dessine : scanners et vitesse'**
  String get laserRefSection2Title;

  /// No description provided for @laserRefSection2Paragraph.
  ///
  /// In fr, this message translates to:
  /// **'Le faisceau est dirigé par deux miroirs galvanométriques (« galvos »), un pour l\'axe X et un pour l\'axe Y, qui pivotent très rapidement. Contrairement à la vidéo (balayage ligne par ligne), un show laser dessine des formes vectorielles, point par point, en suivant les contours de l\'image.'**
  String get laserRefSection2Paragraph;

  /// No description provided for @laserRefSection2SpeedTitle.
  ///
  /// In fr, this message translates to:
  /// **'Vitesse de scan'**
  String get laserRefSection2SpeedTitle;

  /// No description provided for @laserRefSection2Speed1.
  ///
  /// In fr, this message translates to:
  /// **'La vitesse se mesure en points par seconde (pps) ou en kilopoints par seconde (kpps)'**
  String get laserRefSection2Speed1;

  /// No description provided for @laserRefSection2Speed2.
  ///
  /// In fr, this message translates to:
  /// **'ILDA (International Laser Display Association) standardise le connecteur, le format de fichier .ild et un motif de test utilisé pour évaluer objectivement un scanner'**
  String get laserRefSection2Speed2;

  /// No description provided for @laserRefSection2FieldTitle.
  ///
  /// In fr, this message translates to:
  /// **'Repères de terrain'**
  String get laserRefSection2FieldTitle;

  /// No description provided for @laserRefSection2Field1.
  ///
  /// In fr, this message translates to:
  /// **'Plus l\'image contient de points, plus il faut de pps pour éviter le scintillement (flicker) — un show fluide tourne généralement autour de 20 à 30 kpps'**
  String get laserRefSection2Field1;

  /// No description provided for @laserRefSection2Field2.
  ///
  /// In fr, this message translates to:
  /// **'Le motif de test ILDA permet de comparer deux scanners sur des critères objectifs (vitesse, précision, amortissement)'**
  String get laserRefSection2Field2;

  /// No description provided for @laserRefSection3Title.
  ///
  /// In fr, this message translates to:
  /// **'Classes de laser & normes'**
  String get laserRefSection3Title;

  /// No description provided for @laserRefSection3ClassesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Classes IEC 60825-1'**
  String get laserRefSection3ClassesTitle;

  /// No description provided for @laserRefSection3Class1.
  ///
  /// In fr, this message translates to:
  /// **'Classe 1 : sûre en usage normal, aucune précaution particulière'**
  String get laserRefSection3Class1;

  /// No description provided for @laserRefSection3Class2.
  ///
  /// In fr, this message translates to:
  /// **'Classe 1M / 2M : sûres à l\'œil nu, mais dangereuses avec des instruments optiques (jumelles, loupe)'**
  String get laserRefSection3Class2;

  /// No description provided for @laserRefSection3Class3.
  ///
  /// In fr, this message translates to:
  /// **'Classe 2 : visible, protégée par le réflexe de clignement (< 1 mW)'**
  String get laserRefSection3Class3;

  /// No description provided for @laserRefSection3Class4.
  ///
  /// In fr, this message translates to:
  /// **'Classe 3R : risque modéré, danger direct limité'**
  String get laserRefSection3Class4;

  /// No description provided for @laserRefSection3Class5.
  ///
  /// In fr, this message translates to:
  /// **'Classe 3B : dangereuse pour l\'œil en vision directe — la majorité des lasers de spectacle se situent ici ou en classe 4'**
  String get laserRefSection3Class5;

  /// No description provided for @laserRefSection3Class6.
  ///
  /// In fr, this message translates to:
  /// **'Classe 4 : dangereuse pour l\'œil et la peau, risque d\'incendie — précautions maximales'**
  String get laserRefSection3Class6;

  /// No description provided for @laserRefSection3StandardsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Normes de référence'**
  String get laserRefSection3StandardsTitle;

  /// No description provided for @laserRefSection3Standard1.
  ///
  /// In fr, this message translates to:
  /// **'IEC 60825-1 : sécurité produit et classification des lasers'**
  String get laserRefSection3Standard1;

  /// No description provided for @laserRefSection3Standard2.
  ///
  /// In fr, this message translates to:
  /// **'IEC 60825-3 : lignes directrices spécifiques aux shows et vitrines laser (notion de MPE variable selon la durée d\'exposition)'**
  String get laserRefSection3Standard2;

  /// No description provided for @laserRefSection3Standard3.
  ///
  /// In fr, this message translates to:
  /// **'Réglementations locales : déclaration/autorisation selon la puissance et le pays (ex. FDA/CDRH 21 CFR 1040.10 aux États-Unis avec procédure de variance pour les shows)'**
  String get laserRefSection3Standard3;

  /// No description provided for @laserRefSection3FieldNote.
  ///
  /// In fr, this message translates to:
  /// **'Vérifie toujours la réglementation locale avant un show, en particulier pour l\'audience scanning et à proximité d\'un aéroport.'**
  String get laserRefSection3FieldNote;

  /// No description provided for @laserRefSection4Title.
  ///
  /// In fr, this message translates to:
  /// **'Mesures de sécurité'**
  String get laserRefSection4Title;

  /// No description provided for @laserRefSection4Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Un Laser Safety Officer (LSO) formé est désigné et responsable du show'**
  String get laserRefSection4Bullet1;

  /// No description provided for @laserRefSection4Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Interrupteur à clé et arrêt d\'urgence facilement accessibles'**
  String get laserRefSection4Bullet2;

  /// No description provided for @laserRefSection4Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Verrouillage (interlock) qui coupe l\'émission si un capot ou un boîtier est ouvert'**
  String get laserRefSection4Bullet3;

  /// No description provided for @laserRefSection4Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Détection de panne de scan (scan-fail) qui coupe le faisceau si les galvos s\'arrêtent — indispensable pour l\'audience scanning'**
  String get laserRefSection4Bullet4;

  /// No description provided for @laserRefSection4Bullet5.
  ///
  /// In fr, this message translates to:
  /// **'Aucun faisceau fixe pointé vers le public — uniquement de l\'audience scanning avec les protections et calculs d\'exposition dédiés'**
  String get laserRefSection4Bullet5;

  /// No description provided for @laserRefSection4Bullet6.
  ///
  /// In fr, this message translates to:
  /// **'Jamais de visée vers une zone aérienne, un avion, ou une surface réfléchissante non contrôlée (verre, miroir, écran)'**
  String get laserRefSection4Bullet6;

  /// No description provided for @laserRefSection5Title.
  ///
  /// In fr, this message translates to:
  /// **'NOHD, SZED, CZED expliqués'**
  String get laserRefSection5Title;

  /// No description provided for @laserRefSection5Paragraph.
  ///
  /// In fr, this message translates to:
  /// **'Ces distances de sécurité sont calculées par l\'outil « Zones de sécurité » de l\'app à partir de la puissance, la divergence et le diamètre de sortie du faisceau.'**
  String get laserRefSection5Paragraph;

  /// No description provided for @laserRefSection5NohdTitle.
  ///
  /// In fr, this message translates to:
  /// **'NOHD — Nominal Ocular Hazard Distance'**
  String get laserRefSection5NohdTitle;

  /// No description provided for @laserRefSection5NohdBody.
  ///
  /// In fr, this message translates to:
  /// **'Distance oculaire de danger nominal : au-delà de cette distance, l\'irradiance directe du faisceau descend sous la limite d\'exposition maximale (MPE) admise pour une exposition accidentelle et brève. C\'est la référence de base définie par l\'IEC 60825-1.'**
  String get laserRefSection5NohdBody;

  /// No description provided for @laserRefSection5SzedTitle.
  ///
  /// In fr, this message translates to:
  /// **'SZED — Show Zone Exposure Distance'**
  String get laserRefSection5SzedTitle;

  /// No description provided for @laserRefSection5SzedBody.
  ///
  /// In fr, this message translates to:
  /// **'Distance d\'exposition de la zone de spectacle : délimite la zone où le public peut se trouver pendant un show avec balayage (audience scanning), avec un seuil MPE plus prudent que le NOHD.'**
  String get laserRefSection5SzedBody;

  /// No description provided for @laserRefSection5CzedTitle.
  ///
  /// In fr, this message translates to:
  /// **'CZED — Controlled Zone Exposure Distance'**
  String get laserRefSection5CzedTitle;

  /// No description provided for @laserRefSection5CzedBody.
  ///
  /// In fr, this message translates to:
  /// **'Distance d\'exposition de la zone contrôlée : la plus prudente des trois, réservée à la zone où seul le personnel formé (opérateurs, techniciens) peut se trouver, en tenant compte d\'une exposition potentiellement plus longue.'**
  String get laserRefSection5CzedBody;

  /// No description provided for @laserRefSection5FieldNote.
  ///
  /// In fr, this message translates to:
  /// **'Dans l\'app, plus le seuil MPE utilisé est bas, plus la distance calculée est grande — d\'où l\'ordre CZED > SZED > NOHD. Ces distances restent indicatives : elles ne remplacent pas une étude réalisée par un Laser Safety Officer qualifié, ni la réglementation locale en vigueur.'**
  String get laserRefSection5FieldNote;

  /// No description provided for @laserRefSection6Title.
  ///
  /// In fr, this message translates to:
  /// **'Checklist rapide'**
  String get laserRefSection6Title;

  /// No description provided for @laserRefSection6Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Classe du laser identifiée, déclarée si nécessaire'**
  String get laserRefSection6Bullet1;

  /// No description provided for @laserRefSection6Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'LSO désigné et présent pendant tout le show'**
  String get laserRefSection6Bullet2;

  /// No description provided for @laserRefSection6Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Zones NOHD/SZED/CZED calculées et matérialisées'**
  String get laserRefSection6Bullet3;

  /// No description provided for @laserRefSection6Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Détection de panne de scan active si audience scanning'**
  String get laserRefSection6Bullet4;

  /// No description provided for @laserRefSection6Bullet5.
  ///
  /// In fr, this message translates to:
  /// **'Arrêt d\'urgence testé et accessible'**
  String get laserRefSection6Bullet5;

  /// No description provided for @laserRefSection6Bullet6.
  ///
  /// In fr, this message translates to:
  /// **'Aucune visée vers une zone aérienne ou une surface réfléchissante non contrôlée'**
  String get laserRefSection6Bullet6;

  /// No description provided for @laserRefFooterNote.
  ///
  /// In fr, this message translates to:
  /// **'Ces informations sont générales et pédagogiques — elles ne remplacent pas une formation de Laser Safety Officer ni la réglementation locale (IEC 60825, FDA/CDRH, autorités aéronautiques...).'**
  String get laserRefFooterNote;

  /// No description provided for @aboutRiggingTitle.
  ///
  /// In fr, this message translates to:
  /// **'Rigging'**
  String get aboutRiggingTitle;

  /// No description provided for @aboutRiggingSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Bases, élingage et facteur d\'angle'**
  String get aboutRiggingSubtitle;

  /// No description provided for @aboutRiggingPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Rigging — cours rapide'**
  String get aboutRiggingPageTitle;

  /// No description provided for @riggingRefTocCopyText.
  ///
  /// In fr, this message translates to:
  /// **'Copier le sommaire'**
  String get riggingRefTocCopyText;

  /// No description provided for @riggingRefSection1Title.
  ///
  /// In fr, this message translates to:
  /// **'Bases du rigging'**
  String get riggingRefSection1Title;

  /// No description provided for @riggingRefSection2Title.
  ///
  /// In fr, this message translates to:
  /// **'Élingage à 2 points (bridle)'**
  String get riggingRefSection2Title;

  /// No description provided for @riggingRefSection3Title.
  ///
  /// In fr, this message translates to:
  /// **'Facteur d\'angle'**
  String get riggingRefSection3Title;

  /// No description provided for @riggingRefSection4Title.
  ///
  /// In fr, this message translates to:
  /// **'Checklist'**
  String get riggingRefSection4Title;

  /// No description provided for @riggingRefSection1Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'WLL (Working Load Limit) : charge maximale d\'utilisation autorisée pour un accessoire, indiquée par le fabricant.'**
  String get riggingRefSection1Bullet1;

  /// No description provided for @riggingRefSection1Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Coefficient de sécurité : rapport entre la charge de rupture et la WLL, généralement 5:1 ou 10:1 selon le matériel et la réglementation.'**
  String get riggingRefSection1Bullet2;

  /// No description provided for @riggingRefSection1Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Chaîne de charge : chaque maillon (point d\'accroche, élingue, manille, structure) doit être dimensionné pour la charge totale — le maillon le plus faible fixe la limite de l\'ensemble.'**
  String get riggingRefSection1Bullet3;

  /// No description provided for @riggingRefSection2Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Un bridage à 2 points répartit la charge entre deux élingues formant un angle par rapport à la verticale.'**
  String get riggingRefSection2Bullet1;

  /// No description provided for @riggingRefSection2Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Plus l\'angle par rapport à la verticale augmente, plus la tension dans chaque élingue augmente.'**
  String get riggingRefSection2Bullet2;

  /// No description provided for @riggingRefSection2Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Recommandation courante : rester sous 90° d\'angle inclus entre les deux brins pour limiter la tension supplémentaire.'**
  String get riggingRefSection2Bullet3;

  /// No description provided for @riggingRefSection3FormulaTitle.
  ///
  /// In fr, this message translates to:
  /// **'Formule'**
  String get riggingRefSection3FormulaTitle;

  /// No description provided for @riggingRefSection3Formula1.
  ///
  /// In fr, this message translates to:
  /// **'Tension par élingue = (Charge / nombre d\'élingues) × facteur d\'angle, avec facteur d\'angle = 1 / cos(angle par rapport à la verticale).'**
  String get riggingRefSection3Formula1;

  /// No description provided for @riggingRefSection3Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Exemples : 0° → facteur 1.0 ; 45° → facteur environ 1.41 ; 60° → facteur 2.0.'**
  String get riggingRefSection3Bullet1;

  /// No description provided for @riggingRefSection3Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Plus l\'angle par rapport à la verticale est grand, plus le facteur — et donc la tension — augmente rapidement.'**
  String get riggingRefSection3Bullet2;

  /// No description provided for @riggingRefSection4Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Vérifier la WLL de chaque accessoire (élingue, manille, mousqueton, structure) avant l\'accroche.'**
  String get riggingRefSection4Bullet1;

  /// No description provided for @riggingRefSection4Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Calculer la tension réelle par élingue en tenant compte du facteur d\'angle, pas seulement de la charge totale divisée par le nombre de brins.'**
  String get riggingRefSection4Bullet2;

  /// No description provided for @riggingRefSection4Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Inspecter visuellement les accessoires (déformation, corrosion, usure) avant chaque utilisation.'**
  String get riggingRefSection4Bullet3;

  /// No description provided for @riggingRefSection4Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Faire vérifier l\'ensemble par une personne compétente ou un rigger qualifié pour les charges importantes ou les configurations complexes.'**
  String get riggingRefSection4Bullet4;

  /// No description provided for @riggingRefFooterNote.
  ///
  /// In fr, this message translates to:
  /// **'Ce contenu est un rappel pédagogique général et ne remplace pas les normes locales, la formation rigger, ni la vérification par une personne compétente.'**
  String get riggingRefFooterNote;

  /// No description provided for @aboutConsoleTitle.
  ///
  /// In fr, this message translates to:
  /// **'Console & patch'**
  String get aboutConsoleTitle;

  /// No description provided for @aboutConsoleSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Console virtuelle, GDTF et patch DMX'**
  String get aboutConsoleSubtitle;

  /// No description provided for @aboutConsolePageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Console — cours rapide'**
  String get aboutConsolePageTitle;

  /// No description provided for @consoleRefTocCopyText.
  ///
  /// In fr, this message translates to:
  /// **'Copier le sommaire'**
  String get consoleRefTocCopyText;

  /// No description provided for @consoleRefSection1Title.
  ///
  /// In fr, this message translates to:
  /// **'Console virtuelle & DMX sans fil'**
  String get consoleRefSection1Title;

  /// No description provided for @consoleRefSection2Title.
  ///
  /// In fr, this message translates to:
  /// **'GDTF & GDTF Share'**
  String get consoleRefSection2Title;

  /// No description provided for @consoleRefSection3Title.
  ///
  /// In fr, this message translates to:
  /// **'Patch & univers'**
  String get consoleRefSection3Title;

  /// No description provided for @consoleRefSection4Title.
  ///
  /// In fr, this message translates to:
  /// **'Checklist'**
  String get consoleRefSection4Title;

  /// No description provided for @consoleRefSection1Paragraph.
  ///
  /// In fr, this message translates to:
  /// **'Une console virtuelle permet de piloter un show depuis une tablette ou un smartphone, en envoyant du DMX via le réseau (Art-Net ou sACN) plutôt que par câble DMX direct.'**
  String get consoleRefSection1Paragraph;

  /// No description provided for @consoleRefSection1Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Le Wi-Fi introduit de la latence et des risques de coupure : à réserver aux réglages, pas au live critique sans solution de secours filaire.'**
  String get consoleRefSection1Bullet1;

  /// No description provided for @consoleRefSection1Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Vérifier que le node/interface DMX-sur-IP reçoit bien le bon univers Art-Net ou sACN configuré sur la console virtuelle.'**
  String get consoleRefSection1Bullet2;

  /// No description provided for @consoleRefSection1Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Prévoir un accès filaire de secours (DMX direct ou Ethernet) pour les moments critiques du show.'**
  String get consoleRefSection1Bullet3;

  /// No description provided for @consoleRefSection2GdtfTitle.
  ///
  /// In fr, this message translates to:
  /// **'GDTF (General Device Type Format)'**
  String get consoleRefSection2GdtfTitle;

  /// No description provided for @consoleRefSection2GdtfBody.
  ///
  /// In fr, this message translates to:
  /// **'Format de fichier standardisé qui décrit les caractéristiques d\'un projecteur (modes DMX, roues de couleur, géométrie 3D) pour un import fiable dans n\'importe quelle console compatible.'**
  String get consoleRefSection2GdtfBody;

  /// No description provided for @consoleRefSection2ShareTitle.
  ///
  /// In fr, this message translates to:
  /// **'GDTF Share'**
  String get consoleRefSection2ShareTitle;

  /// No description provided for @consoleRefSection2ShareBody.
  ///
  /// In fr, this message translates to:
  /// **'Base de données en ligne officielle où les fabricants publient les fichiers GDTF de leurs appareils, téléchargeables gratuitement pour le patch.'**
  String get consoleRefSection2ShareBody;

  /// No description provided for @consoleRefSection3Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Un univers DMX contient 512 canaux ; chaque appareil occupe un ou plusieurs canaux selon son mode DMX choisi.'**
  String get consoleRefSection3Bullet1;

  /// No description provided for @consoleRefSection3Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Toujours vérifier le mode DMX réellement réglé sur l\'appareil physique — il doit correspondre à celui sélectionné dans le patch de la console.'**
  String get consoleRefSection3Bullet2;

  /// No description provided for @consoleRefSection3Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Documenter le patch (adresses, univers, modes) facilite le dépannage et la reprise du show par une autre personne.'**
  String get consoleRefSection3Bullet3;

  /// No description provided for @consoleRefSection4Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Vérifier la connexion réseau (Wi-Fi ou filaire) entre la console virtuelle et le node DMX avant le show.'**
  String get consoleRefSection4Bullet1;

  /// No description provided for @consoleRefSection4Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer que chaque appareil est patché dans le bon univers et à la bonne adresse de départ.'**
  String get consoleRefSection4Bullet2;

  /// No description provided for @consoleRefSection4Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Utiliser un fichier GDTF à jour depuis GDTF Share plutôt qu\'un profil générique.'**
  String get consoleRefSection4Bullet3;

  /// No description provided for @consoleRefSection4Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Prévoir un plan de secours en cas de coupure réseau ou Wi-Fi pendant le show.'**
  String get consoleRefSection4Bullet4;

  /// No description provided for @consoleRefFooterNote.
  ///
  /// In fr, this message translates to:
  /// **'Ce contenu est un rappel général ; se référer à la documentation du fabricant pour les modes DMX et procédures spécifiques.'**
  String get consoleRefFooterNote;

  /// No description provided for @aboutCinemaTitle.
  ///
  /// In fr, this message translates to:
  /// **'Cinéma'**
  String get aboutCinemaTitle;

  /// No description provided for @aboutCinemaSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Caméra, profondeur de champ et cadence'**
  String get aboutCinemaSubtitle;

  /// No description provided for @aboutCinemaPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Cinéma — cours rapide'**
  String get aboutCinemaPageTitle;

  /// No description provided for @cinemaRefTocCopyText.
  ///
  /// In fr, this message translates to:
  /// **'Copier le sommaire'**
  String get cinemaRefTocCopyText;

  /// No description provided for @cinemaRefSection1Title.
  ///
  /// In fr, this message translates to:
  /// **'Notions de base caméra'**
  String get cinemaRefSection1Title;

  /// No description provided for @cinemaRefSection2Title.
  ///
  /// In fr, this message translates to:
  /// **'Profondeur de champ & mise au point'**
  String get cinemaRefSection2Title;

  /// No description provided for @cinemaRefSection3Title.
  ///
  /// In fr, this message translates to:
  /// **'Cadence & obturateur'**
  String get cinemaRefSection3Title;

  /// No description provided for @cinemaRefSection4Title.
  ///
  /// In fr, this message translates to:
  /// **'Checklist'**
  String get cinemaRefSection4Title;

  /// No description provided for @cinemaRefSection1Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Capteur : surface photosensible qui capture l\'image ; sa taille influence le champ de vision et la profondeur de champ pour une focale donnée.'**
  String get cinemaRefSection1Bullet1;

  /// No description provided for @cinemaRefSection1Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Focale : distance (en mm) qui détermine l\'angle de champ — une focale courte est grand-angle, une focale longue est un téléobjectif.'**
  String get cinemaRefSection1Bullet2;

  /// No description provided for @cinemaRefSection1Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Ouverture (f/) : taille du diaphragme, qui contrôle la quantité de lumière entrante et la profondeur de champ.'**
  String get cinemaRefSection1Bullet3;

  /// No description provided for @cinemaRefSection2Paragraph.
  ///
  /// In fr, this message translates to:
  /// **'La profondeur de champ est la zone de netteté acceptable devant et derrière le sujet mis au point.'**
  String get cinemaRefSection2Paragraph;

  /// No description provided for @cinemaRefSection2Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Une ouverture large (f/1.4, f/2) donne une profondeur de champ réduite (arrière-plan flou).'**
  String get cinemaRefSection2Bullet1;

  /// No description provided for @cinemaRefSection2Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Une ouverture fermée (f/11, f/16) donne une profondeur de champ étendue (tout net).'**
  String get cinemaRefSection2Bullet2;

  /// No description provided for @cinemaRefSection3FormulaTitle.
  ///
  /// In fr, this message translates to:
  /// **'Formule shutter angle'**
  String get cinemaRefSection3FormulaTitle;

  /// No description provided for @cinemaRefSection3Formula1.
  ///
  /// In fr, this message translates to:
  /// **'Vitesse d\'obturation = 1 / (2 × cadence en images/seconde) pour un angle d\'obturation de 180°, la référence standard en cinéma.'**
  String get cinemaRefSection3Formula1;

  /// No description provided for @cinemaRefSection3Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'24 images/seconde est la cadence standard du cinéma ; 25 ou 30 i/s sont courantes en broadcast selon la norme vidéo (PAL/NTSC).'**
  String get cinemaRefSection3Bullet1;

  /// No description provided for @cinemaRefSection3Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Un angle d\'obturation plus fermé (90°, 45°) donne un rendu plus saccadé, utilisé pour les scènes d\'action stylisées.'**
  String get cinemaRefSection3Bullet2;

  /// No description provided for @cinemaRefSection4Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Vérifier que la cadence caméra correspond à la fréquence des sources lumineuses (éviter le flicker).'**
  String get cinemaRefSection4Bullet1;

  /// No description provided for @cinemaRefSection4Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Adapter l\'ouverture au rendu de profondeur de champ souhaité, pas seulement à l\'exposition.'**
  String get cinemaRefSection4Bullet2;

  /// No description provided for @cinemaRefSection4Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Garder un angle d\'obturation cohérent sur l\'ensemble du tournage pour une texture de mouvement homogène.'**
  String get cinemaRefSection4Bullet3;

  /// No description provided for @cinemaRefSection4Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Toujours tester en conditions réelles de plateau avant le tournage définitif.'**
  String get cinemaRefSection4Bullet4;

  /// No description provided for @cinemaRefFooterNote.
  ///
  /// In fr, this message translates to:
  /// **'Ce contenu est un rappel pédagogique général ; les réglages définitifs dépendent du matériel et de l\'intention artistique.'**
  String get cinemaRefFooterNote;

  /// No description provided for @aboutTimecodeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Timecode'**
  String get aboutTimecodeTitle;

  /// No description provided for @aboutTimecodeSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'SMPTE, drop-frame et cadences'**
  String get aboutTimecodeSubtitle;

  /// No description provided for @aboutTimecodePageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Timecode — cours rapide'**
  String get aboutTimecodePageTitle;

  /// No description provided for @timecodeRefTocCopyText.
  ///
  /// In fr, this message translates to:
  /// **'Copier le sommaire'**
  String get timecodeRefTocCopyText;

  /// No description provided for @timecodeRefSection1Title.
  ///
  /// In fr, this message translates to:
  /// **'Qu\'est-ce que le timecode SMPTE'**
  String get timecodeRefSection1Title;

  /// No description provided for @timecodeRefSection2Title.
  ///
  /// In fr, this message translates to:
  /// **'Drop-frame vs Non-drop-frame'**
  String get timecodeRefSection2Title;

  /// No description provided for @timecodeRefSection3Title.
  ///
  /// In fr, this message translates to:
  /// **'Cadences courantes'**
  String get timecodeRefSection3Title;

  /// No description provided for @timecodeRefSection4Title.
  ///
  /// In fr, this message translates to:
  /// **'Checklist'**
  String get timecodeRefSection4Title;

  /// No description provided for @timecodeRefSection1FormatTitle.
  ///
  /// In fr, this message translates to:
  /// **'Format'**
  String get timecodeRefSection1FormatTitle;

  /// No description provided for @timecodeRefSection1FormatBody.
  ///
  /// In fr, this message translates to:
  /// **'HH:MM:SS:FF — heures, minutes, secondes et numéro d\'image (frame), remis à zéro à chaque cadence complète.'**
  String get timecodeRefSection1FormatBody;

  /// No description provided for @timecodeRefSection1Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Le timecode SMPTE synchronise image, son et éclairage sur une référence temporelle commune.'**
  String get timecodeRefSection1Bullet1;

  /// No description provided for @timecodeRefSection1Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Chaque image porte une adresse unique, ce qui permet un référencement précis en post-production comme en régie live.'**
  String get timecodeRefSection1Bullet2;

  /// No description provided for @timecodeRefSection2Paragraph.
  ///
  /// In fr, this message translates to:
  /// **'Le drop-frame (DF) existe car certaines cadences (29.97 i/s) ne sont pas des nombres entiers d\'images par seconde, ce qui décale le timecode par rapport au temps réel s\'il n\'est pas corrigé.'**
  String get timecodeRefSection2Paragraph;

  /// No description provided for @timecodeRefSection2Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Non-drop-frame (NDF) : compte les images sans saut ; simple mais dérive légèrement par rapport au temps réel en 29.97 i/s.'**
  String get timecodeRefSection2Bullet1;

  /// No description provided for @timecodeRefSection2Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Drop-frame (DF) : saute périodiquement des numéros d\'image (pas d\'image réelle) pour recaler le timecode sur le temps réel.'**
  String get timecodeRefSection2Bullet2;

  /// No description provided for @timecodeRefSection3Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'24 i/s : cadence cinéma classique.'**
  String get timecodeRefSection3Bullet1;

  /// No description provided for @timecodeRefSection3Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'25 i/s : standard PAL (Europe) ; 30 i/s (ou 29.97 DF/NDF) : standard NTSC (Amérique du Nord, Japon).'**
  String get timecodeRefSection3Bullet2;

  /// No description provided for @timecodeRefSection3Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'50 i/s et 59.94/60 i/s : cadences haute fréquence utilisées en broadcast et pour les ralentis.'**
  String get timecodeRefSection3Bullet3;

  /// No description provided for @timecodeRefSection3Bullet4.
  ///
  /// In fr, this message translates to:
  /// **'Toujours vérifier que toutes les sources (caméra, son, éclairage, vidéo) utilisent la même cadence de référence.'**
  String get timecodeRefSection3Bullet4;

  /// No description provided for @timecodeRefSection4Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer la cadence et le mode (DF/NDF) sur toutes les sources avant le début du show ou du tournage.'**
  String get timecodeRefSection4Bullet1;

  /// No description provided for @timecodeRefSection4Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Vérifier que la source maître de timecode (master clock) est bien identifiée et distribuée à tous les appareils.'**
  String get timecodeRefSection4Bullet2;

  /// No description provided for @timecodeRefSection4Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'En cas de doute sur une dérive, comparer le timecode affiché à une horloge de référence sur une durée suffisante.'**
  String get timecodeRefSection4Bullet3;

  /// No description provided for @timecodeRefFooterNote.
  ///
  /// In fr, this message translates to:
  /// **'Ce contenu est un rappel général ; se référer aux spécifications SMPTE et à la documentation des appareils utilisés.'**
  String get timecodeRefFooterNote;

  /// No description provided for @aboutConversionsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Conversions & BPM'**
  String get aboutConversionsTitle;

  /// No description provided for @aboutConversionsSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Unités, BPM et DMX en un coup d\'œil'**
  String get aboutConversionsSubtitle;

  /// No description provided for @aboutConversionsPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Conversions & BPM — cours rapide'**
  String get aboutConversionsPageTitle;

  /// No description provided for @conversionsRefTocCopyText.
  ///
  /// In fr, this message translates to:
  /// **'Copier le sommaire'**
  String get conversionsRefTocCopyText;

  /// No description provided for @conversionsRefSection1Title.
  ///
  /// In fr, this message translates to:
  /// **'Pourquoi convertir'**
  String get conversionsRefSection1Title;

  /// No description provided for @conversionsRefSection2Title.
  ///
  /// In fr, this message translates to:
  /// **'BPM ↔ millisecondes'**
  String get conversionsRefSection2Title;

  /// No description provided for @conversionsRefSection3Title.
  ///
  /// In fr, this message translates to:
  /// **'DMX ↔ pourcentage / 8-bit ↔ 16-bit'**
  String get conversionsRefSection3Title;

  /// No description provided for @conversionsRefSection4Title.
  ///
  /// In fr, this message translates to:
  /// **'Checklist'**
  String get conversionsRefSection4Title;

  /// No description provided for @conversionsRefSection1Paragraph.
  ///
  /// In fr, this message translates to:
  /// **'En régie, les unités se mélangent souvent (BPM musicaux, millisecondes de delay, pourcentages DMX, valeurs 8/16-bit) : convertir rapidement et sans erreur évite les décalages entre effets lumière, son et vidéo.'**
  String get conversionsRefSection1Paragraph;

  /// No description provided for @conversionsRefSection2FormulaTitle.
  ///
  /// In fr, this message translates to:
  /// **'Formule'**
  String get conversionsRefSection2FormulaTitle;

  /// No description provided for @conversionsRefSection2Formula1.
  ///
  /// In fr, this message translates to:
  /// **'Durée d\'un battement (ms) = 60 000 / BPM.'**
  String get conversionsRefSection2Formula1;

  /// No description provided for @conversionsRefSection2Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Exemple : à 120 BPM, un battement dure 500 ms ; une double-croche (1/4 de battement) dure 125 ms.'**
  String get conversionsRefSection2Bullet1;

  /// No description provided for @conversionsRefSection2Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Utile pour caler un effet lumière, un delay audio ou un clip vidéo sur le tempo d\'un morceau.'**
  String get conversionsRefSection2Bullet2;

  /// No description provided for @conversionsRefSection3Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Une valeur DMX 8-bit va de 0 à 255 ; en pourcentage, 255 correspond à 100 %.'**
  String get conversionsRefSection3Bullet1;

  /// No description provided for @conversionsRefSection3Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'En 16-bit, deux canaux (fin/grossier) combinés donnent une résolution de 0 à 65 535 pour un contrôle plus fin (dimmer, pan/tilt).'**
  String get conversionsRefSection3Bullet2;

  /// No description provided for @conversionsRefSection3Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Vérifier le mode (8-bit ou 16-bit) réellement configuré sur l\'appareil avant de patcher, sous peine de décalage de valeurs.'**
  String get conversionsRefSection3Bullet3;

  /// No description provided for @conversionsRefSection4Bullet1.
  ///
  /// In fr, this message translates to:
  /// **'Toujours vérifier l\'unité affichée avant de saisir une valeur (ms, BPM, %, 8-bit, 16-bit).'**
  String get conversionsRefSection4Bullet1;

  /// No description provided for @conversionsRefSection4Bullet2.
  ///
  /// In fr, this message translates to:
  /// **'Recalculer plutôt que d\'arrondir de tête pour les valeurs critiques (synchronisation, sécurité).'**
  String get conversionsRefSection4Bullet2;

  /// No description provided for @conversionsRefSection4Bullet3.
  ///
  /// In fr, this message translates to:
  /// **'Documenter les conversions utilisées dans la fiche technique pour faciliter la reprise du show.'**
  String get conversionsRefSection4Bullet3;

  /// No description provided for @conversionsRefFooterNote.
  ///
  /// In fr, this message translates to:
  /// **'Ce contenu est un rappel général ; se référer à la documentation de l\'appareil pour ses modes de résolution exacts.'**
  String get conversionsRefFooterNote;

  /// No description provided for @aboutCategoryNetworkTitle.
  ///
  /// In fr, this message translates to:
  /// **'Réseau & protocoles'**
  String get aboutCategoryNetworkTitle;

  /// No description provided for @aboutCategoryAudioRfTitle.
  ///
  /// In fr, this message translates to:
  /// **'Audio & RF'**
  String get aboutCategoryAudioRfTitle;

  /// No description provided for @aboutCategoryVideoCinemaTitle.
  ///
  /// In fr, this message translates to:
  /// **'Vidéo & cinéma'**
  String get aboutCategoryVideoCinemaTitle;

  /// No description provided for @aboutCategoryLightingTitle.
  ///
  /// In fr, this message translates to:
  /// **'Éclairage, laser & console'**
  String get aboutCategoryLightingTitle;

  /// No description provided for @aboutCategoryRiggingElecTitle.
  ///
  /// In fr, this message translates to:
  /// **'Rigging & électricité'**
  String get aboutCategoryRiggingElecTitle;

  /// No description provided for @aboutCategoryToolsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Outils pratiques'**
  String get aboutCategoryToolsTitle;

  /// No description provided for @pinnedItemsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mes épingles'**
  String get pinnedItemsTitle;

  /// No description provided for @homePinnedItemsSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Retrouvez rapidement vos outils et références épinglés.'**
  String get homePinnedItemsSubtitle;

  /// No description provided for @pinnedItemsEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucun outil ni référence épinglé pour le moment.'**
  String get pinnedItemsEmpty;

  /// No description provided for @fixtureInfoSectionIdentification.
  ///
  /// In fr, this message translates to:
  /// **'Identification'**
  String get fixtureInfoSectionIdentification;

  /// No description provided for @fixtureInfoLabelName.
  ///
  /// In fr, this message translates to:
  /// **'Nom'**
  String get fixtureInfoLabelName;

  /// No description provided for @fixtureInfoLabelId.
  ///
  /// In fr, this message translates to:
  /// **'ID'**
  String get fixtureInfoLabelId;

  /// No description provided for @fixtureInfoSectionDmx.
  ///
  /// In fr, this message translates to:
  /// **'DMX / Réseau'**
  String get fixtureInfoSectionDmx;

  /// No description provided for @fixtureInfoLabelUniverse.
  ///
  /// In fr, this message translates to:
  /// **'Univers'**
  String get fixtureInfoLabelUniverse;

  /// No description provided for @fixtureInfoLabelAddress.
  ///
  /// In fr, this message translates to:
  /// **'Adresse'**
  String get fixtureInfoLabelAddress;

  /// No description provided for @fixtureInfoLabelMode.
  ///
  /// In fr, this message translates to:
  /// **'Mode'**
  String get fixtureInfoLabelMode;

  /// No description provided for @fixtureInfoLabelChannelCount.
  ///
  /// In fr, this message translates to:
  /// **'Canaux'**
  String get fixtureInfoLabelChannelCount;

  /// No description provided for @fixtureInfoLabelGdtfSpec.
  ///
  /// In fr, this message translates to:
  /// **'Fichier GDTF'**
  String get fixtureInfoLabelGdtfSpec;

  /// No description provided for @fixtureInfoSectionPhysical.
  ///
  /// In fr, this message translates to:
  /// **'Physique'**
  String get fixtureInfoSectionPhysical;

  /// No description provided for @fixtureInfoLabelWeight.
  ///
  /// In fr, this message translates to:
  /// **'Poids'**
  String get fixtureInfoLabelWeight;

  /// No description provided for @fixtureInfoValueKg.
  ///
  /// In fr, this message translates to:
  /// **'{kg} kg'**
  String fixtureInfoValueKg(Object kg);

  /// No description provided for @fixtureInfoLabelDimensions.
  ///
  /// In fr, this message translates to:
  /// **'Dimensions'**
  String get fixtureInfoLabelDimensions;

  /// No description provided for @fixtureInfoValueDimensionsCm.
  ///
  /// In fr, this message translates to:
  /// **'{lengthCm} × {widthCm} × {heightCm} cm'**
  String fixtureInfoValueDimensionsCm(
      Object heightCm, Object lengthCm, Object widthCm);

  /// No description provided for @fixtureInfoLabelLegHeight.
  ///
  /// In fr, this message translates to:
  /// **'Hauteur des pieds'**
  String get fixtureInfoLabelLegHeight;

  /// No description provided for @fixtureInfoValueCm.
  ///
  /// In fr, this message translates to:
  /// **'{cm} cm'**
  String fixtureInfoValueCm(Object cm);

  /// No description provided for @fixtureInfoSectionElectrical.
  ///
  /// In fr, this message translates to:
  /// **'Électrique'**
  String get fixtureInfoSectionElectrical;

  /// No description provided for @fixtureInfoLabelPower.
  ///
  /// In fr, this message translates to:
  /// **'Puissance'**
  String get fixtureInfoLabelPower;

  /// No description provided for @fixtureInfoValueWatts.
  ///
  /// In fr, this message translates to:
  /// **'{watts} W'**
  String fixtureInfoValueWatts(Object watts);

  /// No description provided for @fixtureInfoSectionEnvironment.
  ///
  /// In fr, this message translates to:
  /// **'Environnement'**
  String get fixtureInfoSectionEnvironment;

  /// No description provided for @fixtureInfoLabelOperatingTemp.
  ///
  /// In fr, this message translates to:
  /// **'Température de fonctionnement'**
  String get fixtureInfoLabelOperatingTemp;

  /// No description provided for @fixtureInfoValueTempRange.
  ///
  /// In fr, this message translates to:
  /// **'{lowC}°C – {highC}°C'**
  String fixtureInfoValueTempRange(Object highC, Object lowC);

  /// No description provided for @fixtureInfoNoGdtfData.
  ///
  /// In fr, this message translates to:
  /// **'Aucune information physique disponible (GDTF non fourni ou incomplet).'**
  String get fixtureInfoNoGdtfData;

  /// No description provided for @patch3dTitle.
  ///
  /// In fr, this message translates to:
  /// **'Visualiseur 3D'**
  String get patch3dTitle;

  /// No description provided for @patch3dOpenButton.
  ///
  /// In fr, this message translates to:
  /// **'Voir en 3D'**
  String get patch3dOpenButton;

  /// No description provided for @patch3dResetCameraTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Recentrer la caméra'**
  String get patch3dResetCameraTooltip;

  /// No description provided for @patch3dFiltersTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Filtres et couleurs'**
  String get patch3dFiltersTooltip;

  /// No description provided for @patch3dZoomToFitTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Cadrer sur tout'**
  String get patch3dZoomToFitTooltip;

  /// No description provided for @patch3dCameraViewsTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Vues caméra'**
  String get patch3dCameraViewsTooltip;

  /// No description provided for @patch3dCameraViewFront.
  ///
  /// In fr, this message translates to:
  /// **'Face'**
  String get patch3dCameraViewFront;

  /// No description provided for @patch3dCameraViewTop.
  ///
  /// In fr, this message translates to:
  /// **'Dessus'**
  String get patch3dCameraViewTop;

  /// No description provided for @patch3dCameraViewSide.
  ///
  /// In fr, this message translates to:
  /// **'Côté'**
  String get patch3dCameraViewSide;

  /// No description provided for @patch3dCameraViewIso.
  ///
  /// In fr, this message translates to:
  /// **'Isométrique'**
  String get patch3dCameraViewIso;

  /// No description provided for @patch3dBackgroundColorLabel.
  ///
  /// In fr, this message translates to:
  /// **'Couleur de fond'**
  String get patch3dBackgroundColorLabel;

  /// No description provided for @patch3dEntriesWithoutPosition.
  ///
  /// In fr, this message translates to:
  /// **'{count} fixture(s) sans position 3D (pas de Matrix dans le MVR).'**
  String patch3dEntriesWithoutPosition(Object count);

  /// No description provided for @patch3dNoPositionedFixtures.
  ///
  /// In fr, this message translates to:
  /// **'Aucune fixture positionnée à afficher. Importe un MVR contenant des positions 3D.'**
  String get patch3dNoPositionedFixtures;

  /// No description provided for @patch3dMissingModelTitle.
  ///
  /// In fr, this message translates to:
  /// **'Modèles 3D manquants'**
  String get patch3dMissingModelTitle;

  /// No description provided for @patch3dMissingModelBody.
  ///
  /// In fr, this message translates to:
  /// **'{count} type(s) de machine n’ont pas de modèle 3D dans leur GDTF. Un cube générique (30×30×30 cm) est utilisé à la place :'**
  String patch3dMissingModelBody(Object count);

  /// No description provided for @patch3dColorModeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Colorisation'**
  String get patch3dColorModeLabel;

  /// No description provided for @patch3dColorModeByType.
  ///
  /// In fr, this message translates to:
  /// **'Par type'**
  String get patch3dColorModeByType;

  /// No description provided for @patch3dColorModeByUniverse.
  ///
  /// In fr, this message translates to:
  /// **'Par univers'**
  String get patch3dColorModeByUniverse;

  /// No description provided for @patch3dFilterUniverseLabel.
  ///
  /// In fr, this message translates to:
  /// **'Univers'**
  String get patch3dFilterUniverseLabel;

  /// No description provided for @patch3dFilterTypeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Type de machine'**
  String get patch3dFilterTypeLabel;

  /// No description provided for @patch3dFilterShowAll.
  ///
  /// In fr, this message translates to:
  /// **'Tout afficher'**
  String get patch3dFilterShowAll;

  /// No description provided for @gdtfWizardSuggestionOpen.
  ///
  /// In fr, this message translates to:
  /// **'Ouvert'**
  String get gdtfWizardSuggestionOpen;

  /// No description provided for @gdtfWizardSuggestionClosed.
  ///
  /// In fr, this message translates to:
  /// **'Fermé'**
  String get gdtfWizardSuggestionClosed;

  /// No description provided for @gdtfWizardSuggestionGoboSlot.
  ///
  /// In fr, this message translates to:
  /// **'Gobo {n}'**
  String gdtfWizardSuggestionGoboSlot(int n);

  /// No description provided for @gdtfWizardSuggestionColorSlot.
  ///
  /// In fr, this message translates to:
  /// **'Couleur {n}'**
  String gdtfWizardSuggestionColorSlot(int n);

  /// No description provided for @gdtfWizardColorWhite.
  ///
  /// In fr, this message translates to:
  /// **'Blanc'**
  String get gdtfWizardColorWhite;

  /// No description provided for @gdtfWizardColorRed.
  ///
  /// In fr, this message translates to:
  /// **'Rouge'**
  String get gdtfWizardColorRed;

  /// No description provided for @gdtfWizardColorGreen.
  ///
  /// In fr, this message translates to:
  /// **'Vert'**
  String get gdtfWizardColorGreen;

  /// No description provided for @gdtfWizardColorBlue.
  ///
  /// In fr, this message translates to:
  /// **'Bleu'**
  String get gdtfWizardColorBlue;

  /// No description provided for @gdtfWizardColorYellow.
  ///
  /// In fr, this message translates to:
  /// **'Jaune'**
  String get gdtfWizardColorYellow;

  /// No description provided for @gdtfWizardColorCyan.
  ///
  /// In fr, this message translates to:
  /// **'Cyan'**
  String get gdtfWizardColorCyan;

  /// No description provided for @gdtfWizardColorMagenta.
  ///
  /// In fr, this message translates to:
  /// **'Magenta'**
  String get gdtfWizardColorMagenta;

  /// No description provided for @gdtfWizardColorRainbow.
  ///
  /// In fr, this message translates to:
  /// **'Arc-en-ciel'**
  String get gdtfWizardColorRainbow;

  /// No description provided for @gdtfWizardStrobeSlowToFast.
  ///
  /// In fr, this message translates to:
  /// **'Strobe lent → rapide'**
  String get gdtfWizardStrobeSlowToFast;

  /// No description provided for @gdtfWizardStrobeRandom.
  ///
  /// In fr, this message translates to:
  /// **'Strobe aléatoire'**
  String get gdtfWizardStrobeRandom;

  /// No description provided for @gdtfWizardAppBarTitle.
  ///
  /// In fr, this message translates to:
  /// **'Assistant manuel GDTF'**
  String get gdtfWizardAppBarTitle;

  /// No description provided for @gdtfWizardStepTitleStyle.
  ///
  /// In fr, this message translates to:
  /// **'Style de projecteur'**
  String get gdtfWizardStepTitleStyle;

  /// No description provided for @gdtfWizardStepTitleFunction.
  ///
  /// In fr, this message translates to:
  /// **'Fonction'**
  String get gdtfWizardStepTitleFunction;

  /// No description provided for @gdtfWizardStepTitleChannels.
  ///
  /// In fr, this message translates to:
  /// **'Canaux'**
  String get gdtfWizardStepTitleChannels;

  /// No description provided for @gdtfWizardStepTitlePixels.
  ///
  /// In fr, this message translates to:
  /// **'Pixels'**
  String get gdtfWizardStepTitlePixels;

  /// No description provided for @gdtfWizardStepTitleStructure.
  ///
  /// In fr, this message translates to:
  /// **'Structure'**
  String get gdtfWizardStepTitleStructure;

  /// No description provided for @gdtfWizardStepHeader.
  ///
  /// In fr, this message translates to:
  /// **'Étape {step}/5 — {title}'**
  String gdtfWizardStepHeader(int step, String title);

  /// No description provided for @gdtfWizardErrStyle.
  ///
  /// In fr, this message translates to:
  /// **'Choisis un style de projecteur pour continuer.'**
  String get gdtfWizardErrStyle;

  /// No description provided for @gdtfWizardErrFunction.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionne au moins une fonction (wash, spot ou beam).'**
  String get gdtfWizardErrFunction;

  /// No description provided for @gdtfWizardErrChannels.
  ///
  /// In fr, this message translates to:
  /// **'Coche au moins un canal — la machine doit bien piloter quelque chose !'**
  String get gdtfWizardErrChannels;

  /// No description provided for @gdtfWizardErrPixelCount.
  ///
  /// In fr, this message translates to:
  /// **'Il faut au moins 2 pixels/instances pour une structure multi-pixel.'**
  String get gdtfWizardErrPixelCount;

  /// No description provided for @gdtfWizardErrRepeatCount.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionne au moins 2 canaux répétables (ex : Red + Green, ou Pan/Tilt) pour que chaque pixel soit bien reconnu comme une instance distincte.'**
  String get gdtfWizardErrRepeatCount;

  /// No description provided for @gdtfWizardErrRowsCols.
  ///
  /// In fr, this message translates to:
  /// **'Renseigne un nombre de lignes et de colonnes valide.'**
  String get gdtfWizardErrRowsCols;

  /// No description provided for @gdtfWizardErrModeName.
  ///
  /// In fr, this message translates to:
  /// **'Donne un nom à ce mode DMX.'**
  String get gdtfWizardErrModeName;

  /// No description provided for @gdtfWizardStyleIntro.
  ///
  /// In fr, this message translates to:
  /// **'Quel type de machine crées-tu ?'**
  String get gdtfWizardStyleIntro;

  /// No description provided for @gdtfWizardStyleLyreTitle.
  ///
  /// In fr, this message translates to:
  /// **'Lyre (moving head)'**
  String get gdtfWizardStyleLyreTitle;

  /// No description provided for @gdtfWizardStyleLyreSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Tête mobile avec pan/tilt — spot, wash ou beam sur lyre.'**
  String get gdtfWizardStyleLyreSubtitle;

  /// No description provided for @gdtfWizardStyleParTitle.
  ///
  /// In fr, this message translates to:
  /// **'PAR / Fixe'**
  String get gdtfWizardStyleParTitle;

  /// No description provided for @gdtfWizardStyleParSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Projecteur statique, sans mouvement (PAR LED, découpe fixe…).'**
  String get gdtfWizardStyleParSubtitle;

  /// No description provided for @gdtfWizardStyleBarreTitle.
  ///
  /// In fr, this message translates to:
  /// **'Barre (bar)'**
  String get gdtfWizardStyleBarreTitle;

  /// No description provided for @gdtfWizardStyleBarreSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Barre linéaire, souvent à pixels (barre LED, X4 Bar…).'**
  String get gdtfWizardStyleBarreSubtitle;

  /// No description provided for @gdtfWizardPanTiltCheckTitle.
  ///
  /// In fr, this message translates to:
  /// **'Cette machine a un moteur Pan/Tilt'**
  String get gdtfWizardPanTiltCheckTitle;

  /// No description provided for @gdtfWizardPanTiltCheckSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Ajoute les canaux Pan/Tilt en 16 bits (norme GDTF).'**
  String get gdtfWizardPanTiltCheckSubtitle;

  /// No description provided for @gdtfWizardFunctionIntro.
  ///
  /// In fr, this message translates to:
  /// **'Quelle(s) fonction(s) pour cette machine ? (choix multiples)'**
  String get gdtfWizardFunctionIntro;

  /// No description provided for @gdtfWizardFunctionWash.
  ///
  /// In fr, this message translates to:
  /// **'Wash'**
  String get gdtfWizardFunctionWash;

  /// No description provided for @gdtfWizardFunctionSpot.
  ///
  /// In fr, this message translates to:
  /// **'Spot'**
  String get gdtfWizardFunctionSpot;

  /// No description provided for @gdtfWizardFunctionBeam.
  ///
  /// In fr, this message translates to:
  /// **'Beam'**
  String get gdtfWizardFunctionBeam;

  /// No description provided for @gdtfWizardFunctionHint.
  ///
  /// In fr, this message translates to:
  /// **'Sert juste à pré-cocher des canaux utiles à l\'étape suivante (Wash → Frost/Zoom, Spot → Gobo/Focus/Prisme, Beam → faisceau serré). Tu pourras tout ajuster juste après.'**
  String get gdtfWizardFunctionHint;

  /// No description provided for @gdtfWizardChannelsIntro.
  ///
  /// In fr, this message translates to:
  /// **'Coche les canaux DMX de la machine.'**
  String get gdtfWizardChannelsIntro;

  /// No description provided for @gdtfWizardSectionIntensity.
  ///
  /// In fr, this message translates to:
  /// **'INTENSITÉ'**
  String get gdtfWizardSectionIntensity;

  /// No description provided for @gdtfWizardChannelDimmer.
  ///
  /// In fr, this message translates to:
  /// **'Dimmer'**
  String get gdtfWizardChannelDimmer;

  /// No description provided for @gdtfWizardChannelStrobe.
  ///
  /// In fr, this message translates to:
  /// **'Obturateur / Strobe'**
  String get gdtfWizardChannelStrobe;

  /// No description provided for @gdtfWizardSectionColor.
  ///
  /// In fr, this message translates to:
  /// **'COULEUR'**
  String get gdtfWizardSectionColor;

  /// No description provided for @gdtfWizardChannelCto.
  ///
  /// In fr, this message translates to:
  /// **'Molette CTO (température de couleur)'**
  String get gdtfWizardChannelCto;

  /// No description provided for @gdtfWizardChannelColorMacro.
  ///
  /// In fr, this message translates to:
  /// **'Macro couleur (préréglages)'**
  String get gdtfWizardChannelColorMacro;

  /// No description provided for @gdtfWizardSectionPosition.
  ///
  /// In fr, this message translates to:
  /// **'POSITION'**
  String get gdtfWizardSectionPosition;

  /// No description provided for @gdtfWizardPanTiltNote.
  ///
  /// In fr, this message translates to:
  /// **'Pan/Tilt ajoutés automatiquement (16 bits). Pour une fixture à plusieurs têtes mobiles indépendantes, tu pourras le répartir par tête à l\'étape Pixels.'**
  String get gdtfWizardPanTiltNote;

  /// No description provided for @gdtfWizardSectionBeamShaping.
  ///
  /// In fr, this message translates to:
  /// **'FAISCEAU'**
  String get gdtfWizardSectionBeamShaping;

  /// No description provided for @gdtfWizardChannelZoom.
  ///
  /// In fr, this message translates to:
  /// **'Zoom'**
  String get gdtfWizardChannelZoom;

  /// No description provided for @gdtfWizardChannelFocus.
  ///
  /// In fr, this message translates to:
  /// **'Focus'**
  String get gdtfWizardChannelFocus;

  /// No description provided for @gdtfWizardChannelIris.
  ///
  /// In fr, this message translates to:
  /// **'Iris'**
  String get gdtfWizardChannelIris;

  /// No description provided for @gdtfWizardChannelFrost.
  ///
  /// In fr, this message translates to:
  /// **'Frost'**
  String get gdtfWizardChannelFrost;

  /// No description provided for @gdtfWizardChannelPrism.
  ///
  /// In fr, this message translates to:
  /// **'Prisme'**
  String get gdtfWizardChannelPrism;

  /// No description provided for @gdtfWizardChannelPrismRot.
  ///
  /// In fr, this message translates to:
  /// **'Rotation du prisme'**
  String get gdtfWizardChannelPrismRot;

  /// No description provided for @gdtfWizardSectionGobos.
  ///
  /// In fr, this message translates to:
  /// **'GOBOS'**
  String get gdtfWizardSectionGobos;

  /// No description provided for @gdtfWizardChannelGobo1.
  ///
  /// In fr, this message translates to:
  /// **'Roue de gobos 1'**
  String get gdtfWizardChannelGobo1;

  /// No description provided for @gdtfWizardChannelGobo1Rot.
  ///
  /// In fr, this message translates to:
  /// **'Rotation gobo 1'**
  String get gdtfWizardChannelGobo1Rot;

  /// No description provided for @gdtfWizardChannelGobo2.
  ///
  /// In fr, this message translates to:
  /// **'Roue de gobos 2'**
  String get gdtfWizardChannelGobo2;

  /// No description provided for @gdtfWizardChannelGobo2Rot.
  ///
  /// In fr, this message translates to:
  /// **'Rotation gobo 2'**
  String get gdtfWizardChannelGobo2Rot;

  /// No description provided for @gdtfWizardSectionEffectsControl.
  ///
  /// In fr, this message translates to:
  /// **'EFFETS & CONTRÔLE'**
  String get gdtfWizardSectionEffectsControl;

  /// No description provided for @gdtfWizardChannelEffects.
  ///
  /// In fr, this message translates to:
  /// **'Effets / macros'**
  String get gdtfWizardChannelEffects;

  /// No description provided for @gdtfWizardChannelReset.
  ///
  /// In fr, this message translates to:
  /// **'Reset'**
  String get gdtfWizardChannelReset;

  /// No description provided for @gdtfWizardSlotsHint.
  ///
  /// In fr, this message translates to:
  /// **'Slots (un par ligne, facultatif) — ex : Ouvert, Gobo 1…'**
  String get gdtfWizardSlotsHint;

  /// No description provided for @gdtfWizardSlotsTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Suggestion'**
  String get gdtfWizardSlotsTooltip;

  /// No description provided for @gdtfWizardChannelPanTiltPerHead.
  ///
  /// In fr, this message translates to:
  /// **'Pan/Tilt (par tête)'**
  String get gdtfWizardChannelPanTiltPerHead;

  /// No description provided for @gdtfWizardPixelsIntro.
  ///
  /// In fr, this message translates to:
  /// **'Cette machine a-t-elle plusieurs pixels/cellules pilotables séparément (matrice LED, barre à pixels…) ?'**
  String get gdtfWizardPixelsIntro;

  /// No description provided for @gdtfWizardMultiplePixelsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Plusieurs pixels / instances'**
  String get gdtfWizardMultiplePixelsTitle;

  /// No description provided for @gdtfWizardMultiplePixelsSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Sinon, tous les canaux cochés à l\'étape précédente restent uniques (une seule sortie).'**
  String get gdtfWizardMultiplePixelsSubtitle;

  /// No description provided for @gdtfWizardSectionPixelCount.
  ///
  /// In fr, this message translates to:
  /// **'NOMBRE DE PIXELS'**
  String get gdtfWizardSectionPixelCount;

  /// No description provided for @gdtfWizardSectionPixelContent.
  ///
  /// In fr, this message translates to:
  /// **'CONTENU D\'UN PIXEL'**
  String get gdtfWizardSectionPixelContent;

  /// No description provided for @gdtfWizardNoRepeatableChannels.
  ///
  /// In fr, this message translates to:
  /// **'Aucun canal répétable pour l\'instant. Retourne à l\'étape « Style » (Pan/Tilt) ou « Canaux » (Dimmer, Obturateur/Strobe, couleur…) et coche au moins un attribut à répéter par tête/pixel.'**
  String get gdtfWizardNoRepeatableChannels;

  /// No description provided for @gdtfWizardRepeatPerPixelSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Un canal par pixel (ex: {label} 1, {label} 2…)'**
  String gdtfWizardRepeatPerPixelSubtitle(String label);

  /// No description provided for @gdtfWizardRepeatGlobalSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Reste un seul canal global pour toute la machine'**
  String get gdtfWizardRepeatGlobalSubtitle;

  /// No description provided for @gdtfWizardModeNameLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nom du mode DMX'**
  String get gdtfWizardModeNameLabel;

  /// No description provided for @gdtfWizardModeNameHint.
  ///
  /// In fr, this message translates to:
  /// **'ex : Standard, 16 bits, Pixel Mode…'**
  String get gdtfWizardModeNameHint;

  /// No description provided for @gdtfWizardSingleOutputNote.
  ///
  /// In fr, this message translates to:
  /// **'Machine à une seule sortie (pas de pixels multiples) : rien à configurer ici, chaque canal coché reste unique.'**
  String get gdtfWizardSingleOutputNote;

  /// No description provided for @gdtfWizardSectionLayout.
  ///
  /// In fr, this message translates to:
  /// **'AGENCEMENT'**
  String get gdtfWizardSectionLayout;

  /// No description provided for @gdtfWizardArrangementLinearTitle.
  ///
  /// In fr, this message translates to:
  /// **'Barre linéaire'**
  String get gdtfWizardArrangementLinearTitle;

  /// No description provided for @gdtfWizardArrangementLinearSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Pixels alignés en ligne (ex : X4 Bar). Numérotés 1 à {count}.'**
  String gdtfWizardArrangementLinearSubtitle(int count);

  /// No description provided for @gdtfWizardArrangementMatrixTitle.
  ///
  /// In fr, this message translates to:
  /// **'Matrice (grille)'**
  String get gdtfWizardArrangementMatrixTitle;

  /// No description provided for @gdtfWizardArrangementMatrixSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Pixels organisés en lignes × colonnes (ex : mur LED, JDC1 pixel curve).'**
  String get gdtfWizardArrangementMatrixSubtitle;

  /// No description provided for @gdtfWizardArrangementModulesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Modules indépendants'**
  String get gdtfWizardArrangementModulesTitle;

  /// No description provided for @gdtfWizardArrangementModulesSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Plusieurs têtes/modules identiques sur un même châssis (ex : JDC1).'**
  String get gdtfWizardArrangementModulesSubtitle;

  /// No description provided for @gdtfWizardRowsLabel.
  ///
  /// In fr, this message translates to:
  /// **'Lignes'**
  String get gdtfWizardRowsLabel;

  /// No description provided for @gdtfWizardColsLabel.
  ///
  /// In fr, this message translates to:
  /// **'Colonnes'**
  String get gdtfWizardColsLabel;

  /// No description provided for @gdtfWizardMatrixTotal.
  ///
  /// In fr, this message translates to:
  /// **'Total : {count} pixels (numérotés en lecture ligne par ligne).'**
  String gdtfWizardMatrixTotal(int count);

  /// No description provided for @gdtfWizardModulesNote.
  ///
  /// In fr, this message translates to:
  /// **'Chaque module peut avoir sa propre couleur/dimmer/strobe ET son propre zoom/focus/iris/frost/prisme/gobo — retourne à l\'étape « Pixels » et coche, pour chaque canal faisceau concerné, qu\'il doit se répéter par module plutôt que rester commun à tous.'**
  String get gdtfWizardModulesNote;

  /// No description provided for @gdtfWizardCancel.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get gdtfWizardCancel;

  /// No description provided for @gdtfWizardBack.
  ///
  /// In fr, this message translates to:
  /// **'Retour'**
  String get gdtfWizardBack;

  /// No description provided for @gdtfWizardValidateAndEdit.
  ///
  /// In fr, this message translates to:
  /// **'Valider et éditer'**
  String get gdtfWizardValidateAndEdit;

  /// No description provided for @gdtfWizardNext.
  ///
  /// In fr, this message translates to:
  /// **'Suivant'**
  String get gdtfWizardNext;

  /// No description provided for @gdtfWizardDefaultModeName.
  ///
  /// In fr, this message translates to:
  /// **'Manuel'**
  String get gdtfWizardDefaultModeName;

  /// No description provided for @gdtfWizardOrDivider.
  ///
  /// In fr, this message translates to:
  /// **'OU'**
  String get gdtfWizardOrDivider;

  /// No description provided for @gdtfWizardManualButtonLabel.
  ///
  /// In fr, this message translates to:
  /// **'Assistant manuel (sans PDF) — style, canaux, pixels…'**
  String get gdtfWizardManualButtonLabel;

  /// No description provided for @gdtfWizardColorModeNone.
  ///
  /// In fr, this message translates to:
  /// **'Aucune'**
  String get gdtfWizardColorModeNone;

  /// No description provided for @gdtfWizardColorModeRgb.
  ///
  /// In fr, this message translates to:
  /// **'RVB'**
  String get gdtfWizardColorModeRgb;

  /// No description provided for @gdtfWizardColorModeRgbw.
  ///
  /// In fr, this message translates to:
  /// **'RVB + Blanc'**
  String get gdtfWizardColorModeRgbw;

  /// No description provided for @gdtfWizardColorModeRgbwaUv.
  ///
  /// In fr, this message translates to:
  /// **'RVB + Blanc + Ambre + UV'**
  String get gdtfWizardColorModeRgbwaUv;

  /// No description provided for @gdtfWizardColorModeCmy.
  ///
  /// In fr, this message translates to:
  /// **'CMJ (Cyan/Magenta/Jaune)'**
  String get gdtfWizardColorModeCmy;

  /// No description provided for @gdtfWizardColorModeWheel.
  ///
  /// In fr, this message translates to:
  /// **'Roue de couleurs'**
  String get gdtfWizardColorModeWheel;

  /// No description provided for @gdtfWizardColorAmber.
  ///
  /// In fr, this message translates to:
  /// **'Ambre'**
  String get gdtfWizardColorAmber;

  /// No description provided for @gdtfWizardColorUv.
  ///
  /// In fr, this message translates to:
  /// **'UV'**
  String get gdtfWizardColorUv;

  /// No description provided for @gdtfWizardChannelCtoShort.
  ///
  /// In fr, this message translates to:
  /// **'CTO'**
  String get gdtfWizardChannelCtoShort;

  /// No description provided for @gdtfManualTab.
  ///
  /// In fr, this message translates to:
  /// **'Assistant manuel'**
  String get gdtfManualTab;

  /// No description provided for @gdtfWizardManualTabTitle.
  ///
  /// In fr, this message translates to:
  /// **'Créer un GDTF sans PDF'**
  String get gdtfWizardManualTabTitle;

  /// No description provided for @gdtfWizardManualTabIntro.
  ///
  /// In fr, this message translates to:
  /// **'Pas de manuel PDF sous la main, ou fixture trop simple pour ça ? Décris ta machine en 5 étapes (style, fonctions, canaux, pixels, structure) et l\'app construit directement un GDTF conforme, sans IA ni upload.'**
  String get gdtfWizardManualTabIntro;

  /// No description provided for @gdtfWizardSlotsAddButton.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter'**
  String get gdtfWizardSlotsAddButton;

  /// No description provided for @gdtfWizardSlotsRowHint.
  ///
  /// In fr, this message translates to:
  /// **'Nom du slot'**
  String get gdtfWizardSlotsRowHint;

  /// No description provided for @gdtfWizardSlotsRemoveTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer'**
  String get gdtfWizardSlotsRemoveTooltip;

  /// No description provided for @gdtfWizardSlotsEmptyHint.
  ///
  /// In fr, this message translates to:
  /// **'Aucun slot nommé pour l\'instant — ajoute-en un ou utilise une suggestion.'**
  String get gdtfWizardSlotsEmptyHint;

  /// No description provided for @ma3CalcTitle.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres MA3'**
  String get ma3CalcTitle;

  /// No description provided for @ma3CalcTileDescription.
  ///
  /// In fr, this message translates to:
  /// **'Combien de paramètres pour ton show, et combien de PU ?'**
  String get ma3CalcTileDescription;

  /// No description provided for @ma3CalcTabMvr.
  ///
  /// In fr, this message translates to:
  /// **'Depuis un MVR'**
  String get ma3CalcTabMvr;

  /// No description provided for @ma3CalcTabList.
  ///
  /// In fr, this message translates to:
  /// **'Liste de machines'**
  String get ma3CalcTabList;

  /// No description provided for @ma3CalcAddFixture.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter une machine'**
  String get ma3CalcAddFixture;

  /// No description provided for @ma3CalcAddSheetTitle.
  ///
  /// In fr, this message translates to:
  /// **'Quelle machine ?'**
  String get ma3CalcAddSheetTitle;

  /// No description provided for @ma3CalcAddSheetSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Recherche dans GDTF Share, importe un .gdtf ou saisis la valeur toi-même.'**
  String get ma3CalcAddSheetSubtitle;

  /// No description provided for @ma3CalcSearchHint.
  ///
  /// In fr, this message translates to:
  /// **'ex. MAC Aura, Robe Spiider…'**
  String get ma3CalcSearchHint;

  /// No description provided for @ma3CalcSearchFailed.
  ///
  /// In fr, this message translates to:
  /// **'Recherche impossible pour le moment. Vérifie ta connexion.'**
  String get ma3CalcSearchFailed;

  /// No description provided for @ma3CalcNoResult.
  ///
  /// In fr, this message translates to:
  /// **'Aucun résultat. Essaie un autre nom, ou la saisie manuelle.'**
  String get ma3CalcNoResult;

  /// No description provided for @ma3CalcImportGdtf.
  ///
  /// In fr, this message translates to:
  /// **'Fichier .gdtf'**
  String get ma3CalcImportGdtf;

  /// No description provided for @ma3CalcManualEntry.
  ///
  /// In fr, this message translates to:
  /// **'Saisie manuelle'**
  String get ma3CalcManualEntry;

  /// No description provided for @ma3CalcManualName.
  ///
  /// In fr, this message translates to:
  /// **'Nom de la machine'**
  String get ma3CalcManualName;

  /// No description provided for @ma3CalcChooseMode.
  ///
  /// In fr, this message translates to:
  /// **'Quel mode DMX ?'**
  String get ma3CalcChooseMode;

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'{params} param. MA3 · {channels} canaux DMX'**
  String ma3CalcModeSummary(int params, int channels);

  /// No description provided for @ma3CalcModeUnknown.
  ///
  /// In fr, this message translates to:
  /// **'Mode sans canaux lisibles'**
  String get ma3CalcModeUnknown;

  /// No description provided for @ma3CalcHowMany.
  ///
  /// In fr, this message translates to:
  /// **'Combien de machines ?'**
  String get ma3CalcHowMany;

  /// No description provided for @ma3CalcDownloadFailed.
  ///
  /// In fr, this message translates to:
  /// **'Téléchargement du GDTF impossible.'**
  String get ma3CalcDownloadFailed;

  /// No description provided for @ma3CalcGdtfUnreadable.
  ///
  /// In fr, this message translates to:
  /// **'Ce GDTF est illisible (fichier abîmé ?).'**
  String get ma3CalcGdtfUnreadable;

  /// No description provided for @ma3CalcGdtfNoMode.
  ///
  /// In fr, this message translates to:
  /// **'Aucun mode DMX dans ce GDTF.'**
  String get ma3CalcGdtfNoMode;

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'« {name} » n\'est pas un fichier .gdtf.'**
  String ma3CalcNotGdtf(String name);

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'« {name} » n\'est pas un fichier .mvr.'**
  String ma3CalcNotMvr(String name);

  /// No description provided for @ma3CalcPickFailed.
  ///
  /// In fr, this message translates to:
  /// **'Impossible d\'ouvrir le fichier.'**
  String get ma3CalcPickFailed;

  /// No description provided for @ma3CalcMvrUnreadable.
  ///
  /// In fr, this message translates to:
  /// **'Ce MVR est illisible (ce n\'est pas une archive valide).'**
  String get ma3CalcMvrUnreadable;

  /// No description provided for @ma3CalcMvrNoScene.
  ///
  /// In fr, this message translates to:
  /// **'Pas de GeneralSceneDescription.xml dans ce MVR.'**
  String get ma3CalcMvrNoScene;

  /// No description provided for @ma3CalcMvrNoFixtures.
  ///
  /// In fr, this message translates to:
  /// **'Aucune machine dans ce MVR.'**
  String get ma3CalcMvrNoFixtures;

  /// No description provided for @ma3CalcMvrEmptyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Balance ton MVR 🎛️'**
  String get ma3CalcMvrEmptyTitle;

  /// No description provided for @ma3CalcMvrEmptyBody.
  ///
  /// In fr, this message translates to:
  /// **'Export Vectorworks, Capture, grandMA3, Depence… On compte les machines, on lit leurs GDTF et on te dit combien de paramètres (et de PU) il te faut.'**
  String get ma3CalcMvrEmptyBody;

  /// No description provided for @ma3CalcPickMvr.
  ///
  /// In fr, this message translates to:
  /// **'Choisir un fichier .mvr'**
  String get ma3CalcPickMvr;

  /// No description provided for @ma3CalcChangeFile.
  ///
  /// In fr, this message translates to:
  /// **'Changer'**
  String get ma3CalcChangeFile;

  /// No description provided for @ma3CalcListEmptyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Ton kit, machine par machine'**
  String get ma3CalcListEmptyTitle;

  /// No description provided for @ma3CalcListEmptyBody.
  ///
  /// In fr, this message translates to:
  /// **'Genre 6 × MAC Aura, 23 × Studio Color… Ajoute tes machines, choisis le mode, et le total s\'affiche tout seul.'**
  String get ma3CalcListEmptyBody;

  /// No description provided for @ma3CalcYourSystem.
  ///
  /// In fr, this message translates to:
  /// **'Ta console'**
  String get ma3CalcYourSystem;

  /// No description provided for @ma3CalcSafetyMargin.
  ///
  /// In fr, this message translates to:
  /// **'Marge de sécurité'**
  String get ma3CalcSafetyMargin;

  /// No description provided for @ma3CalcNoMargin.
  ///
  /// In fr, this message translates to:
  /// **'Aucune'**
  String get ma3CalcNoMargin;

  /// No description provided for @ma3CalcTotalParams.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres MA3'**
  String get ma3CalcTotalParams;

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'{fixtures} machines · ≈ {universes} univers DMX'**
  String ma3CalcFixturesAndUniverses(int fixtures, int universes);

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'Avec {percent} % de marge : {value}'**
  String ma3CalcWithMargin(int percent, String value);

  /// No description provided for @ma3CalcCopySummary.
  ///
  /// In fr, this message translates to:
  /// **'Copier le résumé'**
  String get ma3CalcCopySummary;

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'Au-delà de {max} paramètres : c\'est le maximum d\'une session grandMA3.'**
  String ma3CalcVerdictSessionMax(String max);

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'onPC plafonne à {max} paramètres'**
  String ma3CalcVerdictOnPcTooSmall(String max);

  /// No description provided for @ma3CalcVerdictOnPcTooSmallSub.
  ///
  /// In fr, this message translates to:
  /// **'Il te faut une console grandMA3 (+ PU si besoin) : choisis-la au-dessus pour voir la config.'**
  String get ma3CalcVerdictOnPcTooSmallSub;

  /// No description provided for @ma3CalcVerdictOnPcOk.
  ///
  /// In fr, this message translates to:
  /// **'onPC suffit 👌'**
  String get ma3CalcVerdictOnPcOk;

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'N\'importe quel matériel onPC (command wing, fader wing, node 4k, rack-unit…) débloque {max} paramètres.'**
  String ma3CalcVerdictOnPcOkSub(String max);

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'Ta {console} suffit, pas besoin de PU 🎉'**
  String ma3CalcVerdictBaseOk(String console);

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'Capacité totale : {capacity} paramètres.'**
  String ma3CalcVerdictCapacity(String capacity);

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'Ajoute {units}'**
  String ma3CalcVerdictAddPu(String units);

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'Ou, plus simple : {count} × PU XL.'**
  String ma3CalcVerdictXlOnly(int count);

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'{count} machine(s) sans données ne sont pas comptées : corrige-les ci-dessous.'**
  String ma3CalcUnknownNotCounted(int count);

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'Types de machines ({count})'**
  String ma3CalcFixtureTypes(int count);

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'{fixtures} machines · {unpatched} non patchées'**
  String ma3CalcMvrCounts(int fixtures, int unpatched);

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'Dont {count} multipatch, comptés par sécurité.'**
  String ma3CalcMultipatchNote(int count);

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'{params} param. par machine'**
  String ma3CalcPerUnit(int params);

  /// No description provided for @ma3CalcUnknownParams.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres inconnus'**
  String get ma3CalcUnknownParams;

  /// No description provided for @ma3CalcTapToFix.
  ///
  /// In fr, this message translates to:
  /// **'Touche pour saisir la valeur toi-même →'**
  String get ma3CalcTapToFix;

  /// No description provided for @ma3CalcSwipeHint.
  ///
  /// In fr, this message translates to:
  /// **'Glisse une ligne vers la gauche pour la supprimer · touche-la pour corriger ses paramètres.'**
  String get ma3CalcSwipeHint;

  /// No description provided for @ma3CalcClear.
  ///
  /// In fr, this message translates to:
  /// **'Vider'**
  String get ma3CalcClear;

  /// No description provided for @ma3CalcClearListTitle.
  ///
  /// In fr, this message translates to:
  /// **'Vider la liste ?'**
  String get ma3CalcClearListTitle;

  /// No description provided for @ma3CalcClearListBody.
  ///
  /// In fr, this message translates to:
  /// **'Toutes les machines de la liste seront supprimées.'**
  String get ma3CalcClearListBody;

  /// No description provided for @ma3CalcCancel.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get ma3CalcCancel;

  /// No description provided for @ma3CalcOk.
  ///
  /// In fr, this message translates to:
  /// **'OK'**
  String get ma3CalcOk;

  /// No description provided for @ma3CalcParamsPerUnitTitle.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres par machine'**
  String get ma3CalcParamsPerUnitTitle;

  /// No description provided for @ma3CalcParamsUnit.
  ///
  /// In fr, this message translates to:
  /// **'param.'**
  String get ma3CalcParamsUnit;

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'Valeur calculée depuis le GDTF : {value}'**
  String ma3CalcGdtfValue(int value);

  /// No description provided for @ma3CalcParamsHelp.
  ///
  /// In fr, this message translates to:
  /// **'Astuce : 1 paramètre = 1 canal DMX, les canaux « fine » 16 bits ne comptent pas.'**
  String get ma3CalcParamsHelp;

  /// No description provided for @ma3CalcBackToGdtf.
  ///
  /// In fr, this message translates to:
  /// **'Valeur du GDTF'**
  String get ma3CalcBackToGdtf;

  /// No description provided for @ma3CalcReliabilityOkTitle.
  ///
  /// In fr, this message translates to:
  /// **'GDTF complets à première vue ✅'**
  String get ma3CalcReliabilityOkTitle;

  /// No description provided for @ma3CalcReliabilityOkBody.
  ///
  /// In fr, this message translates to:
  /// **'Tous les modes sont trouvés et cohérents. Le calcul reste basé sur ces GDTF.'**
  String get ma3CalcReliabilityOkBody;

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'{count} type(s) de machine à vérifier'**
  String ma3CalcReliabilityWarnTitle(int count);

  /// No description provided for @ma3CalcReliabilityWarnBody.
  ///
  /// In fr, this message translates to:
  /// **'Certains GDTF semblent incomplets ou incohérents : le total peut être faux. Détails sous chaque machine.'**
  String get ma3CalcReliabilityWarnBody;

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'{count} type(s) de machine sans données'**
  String ma3CalcReliabilityBadTitle(int count);

  /// No description provided for @ma3CalcReliabilityBadBody.
  ///
  /// In fr, this message translates to:
  /// **'GDTF absent ou mode introuvable : ces machines ne sont pas comptées, donc le total est trop bas. Touche-les pour saisir la valeur.'**
  String get ma3CalcReliabilityBadBody;

  /// No description provided for @ma3CalcDisclaimer.
  ///
  /// In fr, this message translates to:
  /// **'Le calcul est basé sur les GDTF. Si un GDTF est incomplet ou faux, le résultat le sera aussi. Vérifie toujours dans la grandMA3 (fenêtre System Information ou Patch › DMX Universes, colonne Coarse Params).'**
  String get ma3CalcDisclaimer;

  /// No description provided for @ma3CalcDisclaimerShort.
  ///
  /// In fr, this message translates to:
  /// **'Calcul basé sur les GDTF : à vérifier dans la grandMA3.'**
  String get ma3CalcDisclaimerShort;

  /// No description provided for @ma3CalcHowTitle.
  ///
  /// In fr, this message translates to:
  /// **'Comment c\'est calculé ?'**
  String get ma3CalcHowTitle;

  /// No description provided for @ma3CalcHowBody.
  ///
  /// In fr, this message translates to:
  /// **'Pour grandMA3, 1 paramètre = 1 attribut piloté = 1 canal DMX « coarse ». Les canaux fine (16/24 bits) sont gratuits et les canaux virtuels (dimmer virtuel…) ne comptent pas pour la licence. Les machines multi-instance (pixels, cellules) sont dépliées instance par instance. La reco privilégie le moins de boîtiers possible.'**
  String get ma3CalcHowBody;

  /// No description provided for @ma3CalcHowHardware.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres par matériel (doc MA, v2.3)'**
  String get ma3CalcHowHardware;

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'Maximum par session : {max}'**
  String ma3CalcHowSessionMax(String max);

  /// No description provided for @ma3CalcIssueGdtfMissing.
  ///
  /// In fr, this message translates to:
  /// **'GDTF absent du MVR : paramètres inconnus.'**
  String get ma3CalcIssueGdtfMissing;

  /// No description provided for @ma3CalcIssueUnreadable.
  ///
  /// In fr, this message translates to:
  /// **'GDTF illisible.'**
  String get ma3CalcIssueUnreadable;

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'Aucun mode indiqué dans le MVR. Modes du GDTF : {modes}'**
  String ma3CalcIssueModeMissing(String modes);

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'Mode « {mode} » introuvable dans le GDTF. Modes dispo : {modes}'**
  String ma3CalcIssueModeNotFound(String mode, String modes);

  /// No description provided for @ma3CalcIssueModeGuessed.
  ///
  /// In fr, this message translates to:
  /// **'Pas de mode dans le MVR : le seul mode du GDTF a été utilisé.'**
  String get ma3CalcIssueModeGuessed;

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'Mode trouvé par nom approchant : « {mode} ».'**
  String ma3CalcIssueModePartial(String mode);

  /// No description provided for @ma3CalcIssueNoChannels.
  ///
  /// In fr, this message translates to:
  /// **'Ce mode ne contient aucun canal DMX.'**
  String get ma3CalcIssueNoChannels;

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'{count} canal(aux) sans fonction ni attribut : GDTF probablement incomplet.'**
  String ma3CalcIssueNoFunction(int count);

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'{count} canal(aux) sur une adresse DMX déjà prise : GDTF incohérent.'**
  String ma3CalcIssueOverlap(int count);

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'{count} adresse(s) DMX vide(s) dans le mode : canaux manquants ?'**
  String ma3CalcIssueGaps(int count);

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'Le nom du mode annonce {announced} canaux, le GDTF en décrit {found}.'**
  String ma3CalcIssueNameMismatch(int announced, int found);

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'{count} canal(aux) liés à une géométrie inexistante.'**
  String ma3CalcIssueUnknownGeometry(int count);

  /// No description provided for @ma3CalcIssueManual.
  ///
  /// In fr, this message translates to:
  /// **'Valeur saisie à la main.'**
  String get ma3CalcIssueManual;

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'+{percent} %'**
  String ma3CalcMarginChip(int percent);

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'{name} : {value}'**
  String ma3CalcHwLine(String name, String value);

  /// Calculateur de paramètres MA3
  ///
  /// In fr, this message translates to:
  /// **'onPC : {max} max. (avec n\'importe quel matériel onPC)'**
  String ma3CalcHowOnPcMax(String max);

  /// No description provided for @accountSignInCta.
  ///
  /// In fr, this message translates to:
  /// **'Se connecter'**
  String get accountSignInCta;

  /// No description provided for @accountSignInCtaSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Ton Pro et tes plugins, sur tous tes appareils ✨'**
  String get accountSignInCtaSubtitle;

  /// No description provided for @accountAuthTitle.
  ///
  /// In fr, this message translates to:
  /// **'Ton compte ShowTech'**
  String get accountAuthTitle;

  /// No description provided for @accountAuthSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Connecte-toi pour retrouver ton abonnement Pro\net participer à la communauté.'**
  String get accountAuthSubtitle;

  /// No description provided for @accountSignedInSnack.
  ///
  /// In fr, this message translates to:
  /// **'Connecté ! Bienvenue à bord 🎉'**
  String get accountSignedInSnack;

  /// No description provided for @accountSignedOutSnack.
  ///
  /// In fr, this message translates to:
  /// **'Déconnecté. À bientôt 👋'**
  String get accountSignedOutSnack;

  /// No description provided for @accountSignOutConfirmTitle.
  ///
  /// In fr, this message translates to:
  /// **'Se déconnecter ?'**
  String get accountSignOutConfirmTitle;

  /// No description provided for @accountSignOutConfirmBody.
  ///
  /// In fr, this message translates to:
  /// **'Ton abonnement Pro reste lié à ton compte Google : reconnecte-toi quand tu veux pour le retrouver.'**
  String get accountSignOutConfirmBody;

  /// No description provided for @videoLmCalcDistTitle.
  ///
  /// In fr, this message translates to:
  /// **'Distance de projection (Ratio × Écran)'**
  String get videoLmCalcDistTitle;

  /// No description provided for @videoLmSizeModeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Taille d\'écran connue'**
  String get videoLmSizeModeLabel;

  /// No description provided for @videoLmModeWidth.
  ///
  /// In fr, this message translates to:
  /// **'Largeur'**
  String get videoLmModeWidth;

  /// No description provided for @videoLmModeHeight.
  ///
  /// In fr, this message translates to:
  /// **'Hauteur'**
  String get videoLmModeHeight;

  /// No description provided for @videoLmModeDiagonal.
  ///
  /// In fr, this message translates to:
  /// **'Diagonale'**
  String get videoLmModeDiagonal;

  /// No description provided for @videoLmImageHeightLabel.
  ///
  /// In fr, this message translates to:
  /// **'Hauteur d\'image (m)'**
  String get videoLmImageHeightLabel;

  /// No description provided for @videoLmImageHeightHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 3.375'**
  String get videoLmImageHeightHint;

  /// No description provided for @videoLmDiagonalLabel.
  ///
  /// In fr, this message translates to:
  /// **'Diagonale (pouces)'**
  String get videoLmDiagonalLabel;

  /// No description provided for @videoLmDiagonalHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 200'**
  String get videoLmDiagonalHint;

  /// No description provided for @videoLmRatioMinLabel.
  ///
  /// In fr, this message translates to:
  /// **'Ratio de projection (ou mini si zoom)'**
  String get videoLmRatioMinLabel;

  /// No description provided for @videoLmRatioMaxLabel.
  ///
  /// In fr, this message translates to:
  /// **'Ratio maxi (optionnel, zoom)'**
  String get videoLmRatioMaxLabel;

  /// No description provided for @videoLmRatioMaxHint.
  ///
  /// In fr, this message translates to:
  /// **'ex: 2.10'**
  String get videoLmRatioMaxHint;

  /// No description provided for @videoLmErrMissingSizeRatio.
  ///
  /// In fr, this message translates to:
  /// **'❌ Données manquantes : Taille d\'écran + Ratio.'**
  String get videoLmErrMissingSizeRatio;

  /// No description provided for @videoLmErrSizeGt0.
  ///
  /// In fr, this message translates to:
  /// **'❌ La taille d\'écran doit être > 0.'**
  String get videoLmErrSizeGt0;

  /// No description provided for @videoLmResultImage.
  ///
  /// In fr, this message translates to:
  /// **'📐 Image : {width} × {height} m ({format})'**
  String videoLmResultImage(Object width, Object height, Object format);

  /// No description provided for @videoLmResultDistance.
  ///
  /// In fr, this message translates to:
  /// **'✅ Distance = {distance} m'**
  String videoLmResultDistance(Object distance);

  /// No description provided for @videoLmResultDistanceRange.
  ///
  /// In fr, this message translates to:
  /// **'✅ Distance : de {min} m à {max} m'**
  String videoLmResultDistanceRange(Object min, Object max);

  /// No description provided for @videoLmDistanceNote.
  ///
  /// In fr, this message translates to:
  /// **'ℹ️ Distance mesurée depuis l\'objectif : vérifie la référence du fabricant (avant de l\'objectif ou du boîtier).'**
  String get videoLmDistanceNote;

  /// No description provided for @menuViewModeList.
  ///
  /// In fr, this message translates to:
  /// **'Affichage en lignes'**
  String get menuViewModeList;

  /// No description provided for @menuViewModeGrid.
  ///
  /// In fr, this message translates to:
  /// **'Affichage en cases'**
  String get menuViewModeGrid;

  /// No description provided for @audioRt60Subtitle.
  ///
  /// In fr, this message translates to:
  /// **'Temps de réverbération d\'une salle'**
  String get audioRt60Subtitle;

  /// No description provided for @audioSplMeterSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Mesure le niveau sonore avec le micro du téléphone'**
  String get audioSplMeterSubtitle;

  /// No description provided for @audioImpedanceSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Haut-parleurs en série ou en parallèle'**
  String get audioImpedanceSubtitle;

  /// No description provided for @audioCrossoverSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Fréquences de coupure et filtres'**
  String get audioCrossoverSubtitle;

  /// No description provided for @audioDelayTimeSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Temps de delay calé sur le tempo'**
  String get audioDelayTimeSubtitle;

  /// No description provided for @audioNoiseDoseSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Exposition sonore et durée maximale'**
  String get audioNoiseDoseSubtitle;

  /// No description provided for @audioInputListSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Prépare et partage ta liste d\'entrées'**
  String get audioInputListSubtitle;

  /// No description provided for @networkPoeSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Budget de puissance PoE d\'un switch'**
  String get networkPoeSubtitle;

  /// No description provided for @networkFiberSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Pertes et marge d\'une liaison fibre'**
  String get networkFiberSubtitle;

  /// No description provided for @networkSubnetSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Masque, plage d\'adresses et broadcast'**
  String get networkSubnetSubtitle;

  /// No description provided for @networkArtNetAddressingSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Univers DMX ↔ Net / Sub-Net / Univers'**
  String get networkArtNetAddressingSubtitle;

  /// No description provided for @rdmPageSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Découverte et réglage des appareils RDM'**
  String get rdmPageSubtitle;

  /// No description provided for @rfSplitterSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Pertes d\'insertion des répartiteurs et combineurs'**
  String get rfSplitterSubtitle;

  /// No description provided for @rfCableAntennaSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Pertes câble et gain d\'antenne'**
  String get rfCableAntennaSubtitle;

  /// No description provided for @rfPlannerSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Plan de fréquences HF sans intermodulation'**
  String get rfPlannerSubtitle;

  /// No description provided for @timecodeToolConverterSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Convertir un timecode d\'une cadence à l\'autre'**
  String get timecodeToolConverterSubtitle;

  /// No description provided for @timecodeToolMathSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Additionner, soustraire et décaler du timecode'**
  String get timecodeToolMathSubtitle;

  /// No description provided for @timecodeToolDelaySubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Convertir frames et millisecondes'**
  String get timecodeToolDelaySubtitle;

  /// No description provided for @timecodeToolCountdownSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Compte à rebours jusqu\'à un timecode'**
  String get timecodeToolCountdownSubtitle;

  /// No description provided for @filterCorrespondenceSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Équivalences entre gammes de filtres'**
  String get filterCorrespondenceSubtitle;

  /// No description provided for @ma3CalcEditSheetTitle.
  ///
  /// In fr, this message translates to:
  /// **'MODIFIER CETTE MACHINE'**
  String get ma3CalcEditSheetTitle;

  /// No description provided for @ma3CalcActionChangeMode.
  ///
  /// In fr, this message translates to:
  /// **'Changer de mode'**
  String get ma3CalcActionChangeMode;

  /// No description provided for @ma3CalcActionChangeModeSub.
  ///
  /// In fr, this message translates to:
  /// **'Garder la machine, choisir un autre mode DMX'**
  String get ma3CalcActionChangeModeSub;

  /// No description provided for @ma3CalcActionChangeType.
  ///
  /// In fr, this message translates to:
  /// **'Changer de machine (GDTF)'**
  String get ma3CalcActionChangeType;

  /// No description provided for @ma3CalcActionChangeTypeSub.
  ///
  /// In fr, this message translates to:
  /// **'Remplacer ou ajouter le GDTF : GDTF Share ou fichier'**
  String get ma3CalcActionChangeTypeSub;

  /// No description provided for @ma3CalcActionManual.
  ///
  /// In fr, this message translates to:
  /// **'Saisir les paramètres à la main'**
  String get ma3CalcActionManual;

  /// No description provided for @ma3CalcActionManualSub.
  ///
  /// In fr, this message translates to:
  /// **'Forcer une valeur par machine'**
  String get ma3CalcActionManualSub;

  /// No description provided for @ma3CalcNeedGdtfFirst.
  ///
  /// In fr, this message translates to:
  /// **'Pas de GDTF pour cette machine : choisis-le d\'abord.'**
  String get ma3CalcNeedGdtfFirst;

  /// No description provided for @ma3CalcReplaceSheetTitle.
  ///
  /// In fr, this message translates to:
  /// **'Choisir la machine'**
  String get ma3CalcReplaceSheetTitle;

  /// No description provided for @ma3CalcLineUpdated.
  ///
  /// In fr, this message translates to:
  /// **'✅ {label} mis à jour'**
  String ma3CalcLineUpdated(Object label);

  /// No description provided for @audioPickAmplifier.
  ///
  /// In fr, this message translates to:
  /// **'Choisir un amplificateur'**
  String get audioPickAmplifier;

  /// No description provided for @audioPickSpeaker.
  ///
  /// In fr, this message translates to:
  /// **'Choisir une enceinte'**
  String get audioPickSpeaker;

  /// No description provided for @audioSearchBrandModel.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher une marque ou un modèle'**
  String get audioSearchBrandModel;

  /// No description provided for @audioCustomPreset.
  ///
  /// In fr, this message translates to:
  /// **'Personnalisé'**
  String get audioCustomPreset;

  /// No description provided for @audioCustomPresetHint.
  ///
  /// In fr, this message translates to:
  /// **'Saisir vos propres valeurs'**
  String get audioCustomPresetHint;

  /// No description provided for @audioModelsCount.
  ///
  /// In fr, this message translates to:
  /// **'{count} modèles'**
  String audioModelsCount(Object count);

  /// No description provided for @audioNoResults.
  ///
  /// In fr, this message translates to:
  /// **'Aucun résultat'**
  String get audioNoResults;

  /// No description provided for @audioChannelsCount.
  ///
  /// In fr, this message translates to:
  /// **'{count} voies'**
  String audioChannelsCount(Object count);

  /// No description provided for @audioRecommendedAmp.
  ///
  /// In fr, this message translates to:
  /// **'Ampli recommandé : {range}'**
  String audioRecommendedAmp(Object range);

  /// No description provided for @audioPowerHandling.
  ///
  /// In fr, this message translates to:
  /// **'Tenue en puissance : {watts} W'**
  String audioPowerHandling(Object watts);

  /// No description provided for @audioNoPowerData.
  ///
  /// In fr, this message translates to:
  /// **'Tenue en puissance non publiée par le fabricant : seule l’impédance est vérifiée. Utilisez ses presets / contrôleurs.'**
  String get audioNoPowerData;

  /// No description provided for @audioActiveSection.
  ///
  /// In fr, this message translates to:
  /// **'Enceinte active : une voie d’ampli par section.'**
  String get audioActiveSection;

  /// No description provided for @audioStatusZTooLow.
  ///
  /// In fr, this message translates to:
  /// **'✗  Z trop basse (−{diff} Ω)'**
  String audioStatusZTooLow(Object diff);

  /// No description provided for @audioStatusOkPct.
  ///
  /// In fr, this message translates to:
  /// **'✓  OK ({pct} % RMS)'**
  String audioStatusOkPct(Object pct);

  /// No description provided for @audioStatusUnderpowered.
  ///
  /// In fr, this message translates to:
  /// **'↓  Sous-alimenté ({pct} % RMS)'**
  String audioStatusUnderpowered(Object pct);

  /// No description provided for @audioStatusHeadroom.
  ///
  /// In fr, this message translates to:
  /// **'✓  Marge ×{ratio}'**
  String audioStatusHeadroom(Object ratio);

  /// No description provided for @audioStatusOverpowered.
  ///
  /// In fr, this message translates to:
  /// **'✗  Trop puissant ×{ratio}'**
  String audioStatusOverpowered(Object ratio);

  /// No description provided for @audioStatusInRange.
  ///
  /// In fr, this message translates to:
  /// **'✓  Dans la plage fabricant'**
  String get audioStatusInRange;

  /// No description provided for @audioStatusBelowRange.
  ///
  /// In fr, this message translates to:
  /// **'↓  Sous la plage recommandée'**
  String get audioStatusBelowRange;

  /// No description provided for @audioStatusAboveRange.
  ///
  /// In fr, this message translates to:
  /// **'⚠  Au-dessus de la plage'**
  String get audioStatusAboveRange;

  /// No description provided for @audioStatusZOkNoData.
  ///
  /// In fr, this message translates to:
  /// **'✓  Z OK — P non publiée'**
  String get audioStatusZOkNoData;

  /// No description provided for @audioStatusLimiterRequired.
  ///
  /// In fr, this message translates to:
  /// **'⚠  ×{ratio} — limiteur indispensable'**
  String audioStatusLimiterRequired(Object ratio);

  /// No description provided for @catalogSearchHint.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher une marque, un modèle, un type…'**
  String get catalogSearchHint;

  /// No description provided for @catalogSearchNoResults.
  ///
  /// In fr, this message translates to:
  /// **'Aucun résultat'**
  String get catalogSearchNoResults;

  /// No description provided for @catalogSearchResultsCount.
  ///
  /// In fr, this message translates to:
  /// **'{count} résultats'**
  String catalogSearchResultsCount(Object count);

  /// No description provided for @soundCatalogTitle.
  ///
  /// In fr, this message translates to:
  /// **'Catalogue son'**
  String get soundCatalogTitle;

  /// No description provided for @soundCatalogSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Amplis et enceintes : specs et manuels'**
  String get soundCatalogSubtitle;

  /// No description provided for @laserCatalogTitle.
  ///
  /// In fr, this message translates to:
  /// **'Catalogue laser'**
  String get laserCatalogTitle;

  /// No description provided for @laserCatalogSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Projecteurs laser : puissance, faisceau, divergence'**
  String get laserCatalogSubtitle;

  /// No description provided for @catalogAmplifiers.
  ///
  /// In fr, this message translates to:
  /// **'Amplis'**
  String get catalogAmplifiers;

  /// No description provided for @catalogSpeakers.
  ///
  /// In fr, this message translates to:
  /// **'Enceintes'**
  String get catalogSpeakers;

  /// No description provided for @catalogUseValues.
  ///
  /// In fr, this message translates to:
  /// **'Utiliser'**
  String get catalogUseValues;

  /// No description provided for @laserPickFromCatalog.
  ///
  /// In fr, this message translates to:
  /// **'Choisir dans le catalogue'**
  String get laserPickFromCatalog;

  /// No description provided for @laserCatalogDisclaimer.
  ///
  /// In fr, this message translates to:
  /// **'Valeurs annoncées par le fabricant, non mesurées.'**
  String get laserCatalogDisclaimer;

  /// No description provided for @laserCatalogMissingValues.
  ///
  /// In fr, this message translates to:
  /// **'Diamètre ou divergence non publiés pour ce laser : complétez à la main.'**
  String get laserCatalogMissingValues;

  /// No description provided for @catalogFieldChannels.
  ///
  /// In fr, this message translates to:
  /// **'Voies'**
  String get catalogFieldChannels;

  /// No description provided for @catalogFieldPowerPerChannel.
  ///
  /// In fr, this message translates to:
  /// **'Puissance par voie'**
  String get catalogFieldPowerPerChannel;

  /// No description provided for @catalogFieldType.
  ///
  /// In fr, this message translates to:
  /// **'Type'**
  String get catalogFieldType;

  /// No description provided for @catalogFieldSection.
  ///
  /// In fr, this message translates to:
  /// **'Section'**
  String get catalogFieldSection;

  /// No description provided for @catalogFieldPowerHandling.
  ///
  /// In fr, this message translates to:
  /// **'Tenue en puissance (RMS/AES)'**
  String get catalogFieldPowerHandling;

  /// No description provided for @catalogFieldRecommendedAmp.
  ///
  /// In fr, this message translates to:
  /// **'Ampli recommandé'**
  String get catalogFieldRecommendedAmp;

  /// No description provided for @catalogFieldOpticalPower.
  ///
  /// In fr, this message translates to:
  /// **'Puissance optique'**
  String get catalogFieldOpticalPower;

  /// No description provided for @catalogFieldColors.
  ///
  /// In fr, this message translates to:
  /// **'Couleurs'**
  String get catalogFieldColors;

  /// No description provided for @catalogFieldScanner.
  ///
  /// In fr, this message translates to:
  /// **'Scanners'**
  String get catalogFieldScanner;

  /// No description provided for @catalogFieldClass.
  ///
  /// In fr, this message translates to:
  /// **'Classe laser'**
  String get catalogFieldClass;

  /// No description provided for @catalogFieldConsumption.
  ///
  /// In fr, this message translates to:
  /// **'Consommation'**
  String get catalogFieldConsumption;

  /// No description provided for @homeSafetyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Sécurité'**
  String get homeSafetyTitle;

  /// No description provided for @homeSafetySubtitle.
  ///
  /// In fr, this message translates to:
  /// **'PPSPS, attestation de bon montage'**
  String get homeSafetySubtitle;

  /// No description provided for @subscriptionCategorySafetyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Sécurité'**
  String get subscriptionCategorySafetyTitle;

  /// No description provided for @subscriptionCategorySafetyDescription.
  ///
  /// In fr, this message translates to:
  /// **'PPSPS et plan de sécurité, attestation de bon montage avec photos, réserves et signature, export PDF.'**
  String get subscriptionCategorySafetyDescription;

  /// No description provided for @subscriptionHeadlineSafetySubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Rédigez vos plans de sécurité et vos attestations de bon montage sur le terrain, avec export PDF signé.'**
  String get subscriptionHeadlineSafetySubtitle;

  /// No description provided for @safetyPageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Sécurité'**
  String get safetyPageTitle;

  /// No description provided for @safetySectionDocuments.
  ///
  /// In fr, this message translates to:
  /// **'Documents'**
  String get safetySectionDocuments;

  /// No description provided for @safetyPpspsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Plans de sécurité'**
  String get safetyPpspsTitle;

  /// No description provided for @safetyPpspsSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'PPSPS (France), plan de sécurité (Belgique)'**
  String get safetyPpspsSubtitle;

  /// No description provided for @safetyAttestationTitle.
  ///
  /// In fr, this message translates to:
  /// **'Bon montage'**
  String get safetyAttestationTitle;

  /// No description provided for @safetyAttestationSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Contrôles, réserves et signature'**
  String get safetyAttestationSubtitle;

  /// No description provided for @safetyComingSoon.
  ///
  /// In fr, this message translates to:
  /// **'Disponible dans une prochaine version.'**
  String get safetyComingSoon;

  /// No description provided for @safetyLibraryTitle.
  ///
  /// In fr, this message translates to:
  /// **'Bibliothèque'**
  String get safetyLibraryTitle;

  /// No description provided for @safetyLibrarySummary.
  ///
  /// In fr, this message translates to:
  /// **'{risks} risques · {measures} mesures · {controls} points de contrôle'**
  String safetyLibrarySummary(Object risks, Object measures, Object controls);

  /// No description provided for @safetyLibraryUpdated.
  ///
  /// In fr, this message translates to:
  /// **'Mise à jour : {date}'**
  String safetyLibraryUpdated(Object date);

  /// No description provided for @safetyLibraryOffline.
  ///
  /// In fr, this message translates to:
  /// **'Copie locale, utilisable hors ligne'**
  String get safetyLibraryOffline;

  /// No description provided for @safetyDisclaimer.
  ///
  /// In fr, this message translates to:
  /// **'Outil d\'aide à la rédaction. Le contenu des documents reste sous la responsabilité de l\'entreprise signataire.'**
  String get safetyDisclaimer;

  /// No description provided for @ppspsListTitle.
  ///
  /// In fr, this message translates to:
  /// **'Plans de sécurité'**
  String get ppspsListTitle;

  /// No description provided for @ppspsNew.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau plan'**
  String get ppspsNew;

  /// No description provided for @ppspsEmptyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Aucun plan pour l\'instant'**
  String get ppspsEmptyTitle;

  /// No description provided for @ppspsEmptyBody.
  ///
  /// In fr, this message translates to:
  /// **'Créez votre premier plan de sécurité. Vous pourrez ensuite le dupliquer pour vos prochains événements.'**
  String get ppspsEmptyBody;

  /// No description provided for @ppspsChooseCountry.
  ///
  /// In fr, this message translates to:
  /// **'Pays du chantier'**
  String get ppspsChooseCountry;

  /// No description provided for @ppspsStatusDraft.
  ///
  /// In fr, this message translates to:
  /// **'Brouillon'**
  String get ppspsStatusDraft;

  /// No description provided for @ppspsStatusFinal.
  ///
  /// In fr, this message translates to:
  /// **'Finalisé'**
  String get ppspsStatusFinal;

  /// No description provided for @ppspsStepProgress.
  ///
  /// In fr, this message translates to:
  /// **'Étape {done}/{total}'**
  String ppspsStepProgress(Object done, Object total);

  /// No description provided for @ppspsUntitled.
  ///
  /// In fr, this message translates to:
  /// **'Sans titre'**
  String get ppspsUntitled;

  /// No description provided for @ppspsDuplicate.
  ///
  /// In fr, this message translates to:
  /// **'Dupliquer'**
  String get ppspsDuplicate;

  /// No description provided for @ppspsDelete.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer'**
  String get ppspsDelete;

  /// No description provided for @ppspsDeleteConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer ce plan ? Cette action est définitive.'**
  String get ppspsDeleteConfirm;

  /// No description provided for @ppspsCancel.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get ppspsCancel;

  /// No description provided for @ppspsSave.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer'**
  String get ppspsSave;

  /// No description provided for @ppspsNext.
  ///
  /// In fr, this message translates to:
  /// **'Suivant'**
  String get ppspsNext;

  /// No description provided for @ppspsPrevious.
  ///
  /// In fr, this message translates to:
  /// **'Précédent'**
  String get ppspsPrevious;

  /// No description provided for @ppspsStepProject.
  ///
  /// In fr, this message translates to:
  /// **'Projet'**
  String get ppspsStepProject;

  /// No description provided for @ppspsStepWorkers.
  ///
  /// In fr, this message translates to:
  /// **'Intervenants'**
  String get ppspsStepWorkers;

  /// No description provided for @ppspsStepRisks.
  ///
  /// In fr, this message translates to:
  /// **'Risques'**
  String get ppspsStepRisks;

  /// No description provided for @ppspsStepEmergency.
  ///
  /// In fr, this message translates to:
  /// **'Secours'**
  String get ppspsStepEmergency;

  /// No description provided for @ppspsStepExport.
  ///
  /// In fr, this message translates to:
  /// **'Export'**
  String get ppspsStepExport;

  /// No description provided for @ppspsFieldEventName.
  ///
  /// In fr, this message translates to:
  /// **'Nom de l\'événement'**
  String get ppspsFieldEventName;

  /// No description provided for @ppspsFieldVenue.
  ///
  /// In fr, this message translates to:
  /// **'Lieu'**
  String get ppspsFieldVenue;

  /// No description provided for @ppspsFieldAddress.
  ///
  /// In fr, this message translates to:
  /// **'Adresse'**
  String get ppspsFieldAddress;

  /// No description provided for @ppspsFieldOrganizer.
  ///
  /// In fr, this message translates to:
  /// **'Organisateur (maître d\'ouvrage)'**
  String get ppspsFieldOrganizer;

  /// No description provided for @ppspsFieldCoordinator.
  ///
  /// In fr, this message translates to:
  /// **'Coordinateur sécurité'**
  String get ppspsFieldCoordinator;

  /// No description provided for @ppspsSectionPhases.
  ///
  /// In fr, this message translates to:
  /// **'Phases et dates'**
  String get ppspsSectionPhases;

  /// No description provided for @ppspsPhaseMontage.
  ///
  /// In fr, this message translates to:
  /// **'Montage'**
  String get ppspsPhaseMontage;

  /// No description provided for @ppspsPhaseExploitation.
  ///
  /// In fr, this message translates to:
  /// **'Exploitation'**
  String get ppspsPhaseExploitation;

  /// No description provided for @ppspsPhaseDemontage.
  ///
  /// In fr, this message translates to:
  /// **'Démontage'**
  String get ppspsPhaseDemontage;

  /// No description provided for @ppspsPhaseNotSet.
  ///
  /// In fr, this message translates to:
  /// **'Non prévu'**
  String get ppspsPhaseNotSet;

  /// No description provided for @ppspsPhaseFilterAll.
  ///
  /// In fr, this message translates to:
  /// **'Toutes'**
  String get ppspsPhaseFilterAll;

  /// No description provided for @ppspsSectionCompany.
  ///
  /// In fr, this message translates to:
  /// **'Votre entreprise'**
  String get ppspsSectionCompany;

  /// No description provided for @ppspsFieldCompanyName.
  ///
  /// In fr, this message translates to:
  /// **'Raison sociale'**
  String get ppspsFieldCompanyName;

  /// No description provided for @ppspsFieldCompanyActivity.
  ///
  /// In fr, this message translates to:
  /// **'Activité sur le chantier'**
  String get ppspsFieldCompanyActivity;

  /// No description provided for @ppspsFieldResponsible.
  ///
  /// In fr, this message translates to:
  /// **'Responsable sur site'**
  String get ppspsFieldResponsible;

  /// No description provided for @ppspsFieldPhone.
  ///
  /// In fr, this message translates to:
  /// **'Téléphone'**
  String get ppspsFieldPhone;

  /// No description provided for @ppspsFieldCompany.
  ///
  /// In fr, this message translates to:
  /// **'Entreprise'**
  String get ppspsFieldCompany;

  /// No description provided for @ppspsFieldTrade.
  ///
  /// In fr, this message translates to:
  /// **'Métier'**
  String get ppspsFieldTrade;

  /// No description provided for @ppspsFieldContact.
  ///
  /// In fr, this message translates to:
  /// **'Contact'**
  String get ppspsFieldContact;

  /// No description provided for @ppspsFieldHeadcount.
  ///
  /// In fr, this message translates to:
  /// **'Effectif'**
  String get ppspsFieldHeadcount;

  /// No description provided for @ppspsAddWorker.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter un intervenant'**
  String get ppspsAddWorker;

  /// No description provided for @ppspsWorkersEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Ajoutez les entreprises et les équipes présentes sur le chantier.'**
  String get ppspsWorkersEmpty;

  /// No description provided for @ppspsWorkersTotal.
  ///
  /// In fr, this message translates to:
  /// **'Effectif total : {count} personnes'**
  String ppspsWorkersTotal(Object count);

  /// No description provided for @ppspsMeasuresTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mesures de prévention'**
  String get ppspsMeasuresTitle;

  /// No description provided for @ppspsMeasureCollective.
  ///
  /// In fr, this message translates to:
  /// **'Collective'**
  String get ppspsMeasureCollective;

  /// No description provided for @ppspsMeasureIndividual.
  ///
  /// In fr, this message translates to:
  /// **'Individuelle'**
  String get ppspsMeasureIndividual;

  /// No description provided for @ppspsMeasureOrganisational.
  ///
  /// In fr, this message translates to:
  /// **'Organisationnelle'**
  String get ppspsMeasureOrganisational;

  /// No description provided for @ppspsMeasureCount.
  ///
  /// In fr, this message translates to:
  /// **'{count} mesures'**
  String ppspsMeasureCount(Object count);

  /// No description provided for @ppspsAddCustomMeasure.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter une mesure'**
  String get ppspsAddCustomMeasure;

  /// No description provided for @ppspsCustomMeasureHint.
  ///
  /// In fr, this message translates to:
  /// **'Autre mesure propre à ce chantier'**
  String get ppspsCustomMeasureHint;

  /// No description provided for @ppspsRisksSummary.
  ///
  /// In fr, this message translates to:
  /// **'{risks} risques · {measures} mesures'**
  String ppspsRisksSummary(Object risks, Object measures);

  /// No description provided for @ppspsSectionNumbers.
  ///
  /// In fr, this message translates to:
  /// **'Numéros d\'urgence'**
  String get ppspsSectionNumbers;

  /// No description provided for @ppspsSectionHospital.
  ///
  /// In fr, this message translates to:
  /// **'Hôpital le plus proche'**
  String get ppspsSectionHospital;

  /// No description provided for @ppspsFieldHospitalName.
  ///
  /// In fr, this message translates to:
  /// **'Nom de l\'hôpital'**
  String get ppspsFieldHospitalName;

  /// No description provided for @ppspsSectionOnSite.
  ///
  /// In fr, this message translates to:
  /// **'Sur le site'**
  String get ppspsSectionOnSite;

  /// No description provided for @ppspsFieldFirstAiders.
  ///
  /// In fr, this message translates to:
  /// **'Secouristes présents'**
  String get ppspsFieldFirstAiders;

  /// No description provided for @ppspsFieldAssemblyPoint.
  ///
  /// In fr, this message translates to:
  /// **'Point de rassemblement'**
  String get ppspsFieldAssemblyPoint;

  /// No description provided for @ppspsFieldEquipment.
  ///
  /// In fr, this message translates to:
  /// **'Matériel de secours (extincteurs, défibrillateur…)'**
  String get ppspsFieldEquipment;

  /// No description provided for @ppspsCritical.
  ///
  /// In fr, this message translates to:
  /// **'critiques'**
  String get ppspsCritical;

  /// No description provided for @ppspsMedium.
  ///
  /// In fr, this message translates to:
  /// **'moyens'**
  String get ppspsMedium;

  /// No description provided for @ppspsLow.
  ///
  /// In fr, this message translates to:
  /// **'faibles'**
  String get ppspsLow;

  /// No description provided for @ppspsExportReady.
  ///
  /// In fr, this message translates to:
  /// **'Toutes les étapes sont complétées.'**
  String get ppspsExportReady;

  /// No description provided for @ppspsExportMissing.
  ///
  /// In fr, this message translates to:
  /// **'À compléter'**
  String get ppspsExportMissing;

  /// No description provided for @ppspsExportPdf.
  ///
  /// In fr, this message translates to:
  /// **'Exporter en PDF'**
  String get ppspsExportPdf;

  /// No description provided for @ppspsMarkFinal.
  ///
  /// In fr, this message translates to:
  /// **'Marquer comme finalisé'**
  String get ppspsMarkFinal;

  /// No description provided for @safetyCountryFR.
  ///
  /// In fr, this message translates to:
  /// **'France'**
  String get safetyCountryFR;

  /// No description provided for @safetyCountryBE.
  ///
  /// In fr, this message translates to:
  /// **'Belgique'**
  String get safetyCountryBE;

  /// No description provided for @safetyCountryUK.
  ///
  /// In fr, this message translates to:
  /// **'Royaume-Uni'**
  String get safetyCountryUK;

  /// No description provided for @safetyCountryLU.
  ///
  /// In fr, this message translates to:
  /// **'Luxembourg'**
  String get safetyCountryLU;

  /// No description provided for @safetyCountryDE.
  ///
  /// In fr, this message translates to:
  /// **'Allemagne'**
  String get safetyCountryDE;

  /// No description provided for @safetyCountryNL.
  ///
  /// In fr, this message translates to:
  /// **'Pays-Bas'**
  String get safetyCountryNL;

  /// No description provided for @ppspsExportLanguages.
  ///
  /// In fr, this message translates to:
  /// **'Langues du document'**
  String get ppspsExportLanguages;

  /// No description provided for @ppspsExportLanguagesHint.
  ///
  /// In fr, this message translates to:
  /// **'Un PDF est créé pour chaque langue cochée.'**
  String get ppspsExportLanguagesHint;

  /// No description provided for @ppspsExportPdfMulti.
  ///
  /// In fr, this message translates to:
  /// **'Exporter {count} PDF'**
  String ppspsExportPdfMulti(Object count);

  /// No description provided for @ppspsPhaseOrderError.
  ///
  /// In fr, this message translates to:
  /// **'Les dates ne se suivent pas : le montage doit précéder l'exploitation, puis le démontage.'**
  String get ppspsPhaseOrderError;
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
