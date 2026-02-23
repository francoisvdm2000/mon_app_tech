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
  /// **'Standard DMX sur IP orienté réseau “pro”.\nMulticast/unicast, IGMP snooping/querier, priorités multi-sources.'**
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
  /// **'ex: “RGB 5W”'**
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
  /// **'Catalogue'**
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
  /// **'Importer un fichier MVR ou créer un patch manuellement depuis la librairie.'**
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
  /// **'Section 1'**
  String get photometrySection1Title;

  /// No description provided for @photometrySection2Title.
  ///
  /// In fr, this message translates to:
  /// **'Section 2'**
  String get photometrySection2Title;

  /// No description provided for @photometrySection3Title.
  ///
  /// In fr, this message translates to:
  /// **'Section 3'**
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
  /// **'Calcul 4 — Lux / nits / ft-L + seuil'**
  String get videoBrightnessSectionTitle;

  /// No description provided for @videoBrightnessSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Lux / nits / ft-L + seuil (calcul 4).'**
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
  /// **'Calcul 1 — Ratio (Distance / Largeur)'**
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
  /// **'Calcul 2 — Largeur (Distance / Ratio)'**
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
  /// **'Calcul 3 — Hauteur (Largeur + Format)'**
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
  /// **'Calcul 4 — Luminosité (lux / nits / ft-L + seuil)'**
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
  /// **'Calcul 5 — Overlap (Largeur totale + N)'**
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
  /// **'Calcul 6 — Nb projecteurs auto + luminosité'**
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
  /// **'Calcul 5 — Largeur par projecteur'**
  String get videoMpCalc5Title;

  /// No description provided for @videoMpCalc6Title.
  ///
  /// In fr, this message translates to:
  /// **'Calcul 6 — Nombre de projecteurs (ratio min/max)'**
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
  /// **'9) Schémas terrain (DMX / IP / pinout)'**
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
  /// **'6) Plans IP “show” simples (exemples prêts à copier)'**
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
