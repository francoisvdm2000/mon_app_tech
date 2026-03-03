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
  /// **'Section 1'**
  String get elecToc1;

  /// No description provided for @elecToc2.
  ///
  /// In fr, this message translates to:
  /// **'Section 2'**
  String get elecToc2;

  /// No description provided for @elecToc3.
  ///
  /// In fr, this message translates to:
  /// **'Section 3'**
  String get elecToc3;

  /// No description provided for @elecToc4.
  ///
  /// In fr, this message translates to:
  /// **'Section 4'**
  String get elecToc4;

  /// No description provided for @elecToc5.
  ///
  /// In fr, this message translates to:
  /// **'Section 5'**
  String get elecToc5;

  /// No description provided for @elecToc6.
  ///
  /// In fr, this message translates to:
  /// **'Section 6'**
  String get elecToc6;

  /// No description provided for @elecToc7.
  ///
  /// In fr, this message translates to:
  /// **'Section 7'**
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
  /// **'Pratique pour “re-driver” un signal sur de longues distances.'**
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
  /// **'Cherche un “Y” caché, un splitter non adapté, ou un mauvais adaptateur XLR.'**
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
  /// **'Multicast : un univers est un “groupe” réseau (les nodes s’abonnent).'**
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
  /// **'sACN : plus “pro grands systèmes”, multicast + priorités, demande un réseau bien configuré.'**
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
  /// **'Astuce : pour un repérage “utilisable sans éclairage”, on vise souvent > 100–300 lx. Pour un travail fin, plutôt 500 lx et +.'**
  String get sunTimesThresholdNote;

  /// No description provided for @sunTimesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Lever / coucher du soleil'**
  String get sunTimesTitle;

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

  /// No description provided for @sunTimesTwilightIntro.
  ///
  /// In fr, this message translates to:
  /// **'Les crépuscules sont définis par la hauteur du Soleil sous l’horizon. Ces définitions sont standardisées.'**
  String get sunTimesTwilightIntro;

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
  /// **'Astronomique (-18°) : le ciel est considéré comme “noir” (hors pollution lumineise).'**
  String get sunTimesTwilightAstronomical;

  /// No description provided for @sunTimesTwilightAnglesNote.
  ///
  /// In fr, this message translates to:
  /// **'Angles exprimés en degrés sous l’horizon (Soleil négatif).'**
  String get sunTimesTwilightAnglesNote;

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

  /// No description provided for @sunTimesSectionSettings.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres'**
  String get sunTimesSectionSettings;

  /// No description provided for @sunTimesIntro.
  ///
  /// In fr, this message translates to:
  /// **'Choisis une ville et une date. Les horaires sont indicatifs (arrondis).'**
  String get sunTimesIntro;

  /// No description provided for @sunTimesSectionResults.
  ///
  /// In fr, this message translates to:
  /// **'Résultats'**
  String get sunTimesSectionResults;

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

  /// No description provided for @sunTimesNoData.
  ///
  /// In fr, this message translates to:
  /// **'—'**
  String get sunTimesNoData;

  /// No description provided for @sunTimesSectionTimeline.
  ///
  /// In fr, this message translates to:
  /// **'Timeline (pas de 30 min)'**
  String get sunTimesSectionTimeline;

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

  /// No description provided for @sunTimesSectionTwilight.
  ///
  /// In fr, this message translates to:
  /// **'À quoi correspondent les crépuscules ?'**
  String get sunTimesSectionTwilight;

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

  /// No description provided for @sunTimesSectionLux.
  ///
  /// In fr, this message translates to:
  /// **'Seuils de luminosité (repères)'**
  String get sunTimesSectionLux;

  /// No description provided for @sunTimesLuxNote.
  ///
  /// In fr, this message translates to:
  /// **'Ces valeurs sont des repères typiques (météo, saison, environnement → variations).'**
  String get sunTimesLuxNote;

  /// En-tête de colonne : subnet Art-Net (0–15).
  ///
  /// In fr, this message translates to:
  /// **'Subnet'**
  String get aboutUniverseToArtnetColSubnet;

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
