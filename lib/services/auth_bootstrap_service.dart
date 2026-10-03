import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'community_service.dart';

/// Garantit que chaque installation de l'app dispose d'un identifiant
/// Firebase (`uid`) stable, sans friction pour l'utilisateur : connexion
/// anonyme automatique si personne n'est déjà connecté.
///
/// Cet uid sert de clé pour les entitlements (achats vérifiés côté serveur,
/// voir EntitlementService) : sans compte, impossible d'attacher un achat
/// vérifié à un utilisateur de façon fiable.
///
/// Si l'utilisateur se connecte plus tard avec Google (fonctionnalité
/// communauté), voir CommunityService.signInWithGoogle qui *lie* le compte
/// Google au compte anonyme existant (linkWithCredential) au lieu de basculer
/// sur un nouvel uid — sinon un éventuel achat Pro déjà vérifié se
/// retrouverait orphelin.
class AuthBootstrapService {
  static final _auth = FirebaseAuth.instance;

  /// Mémorise (sur l'appareil) qu'une session Firebase a déjà été établie
  /// avec succès au moins une fois. Sert uniquement à décider, au prochain
  /// démarrage, s'il vaut la peine d'attendre plus longtemps une session
  /// existante avant de créer un compte anonyme (voir ensureSignedIn) — pas
  /// à identifier qui que ce soit.
  static const _kHasHadSessionKey = 'auth_bootstrap_has_had_session_v1';

  static Future<void>? _ready;

  /// Lance la connexion en arrière-plan (une seule fois) SANS bloquer le
  /// démarrage : l'app s'affiche tout de suite, et ce qui a besoin d'un uid
  /// (entitlements, vérification d'achat, connexion Google) attend [ready].
  static void start() {
    _ready ??= ensureSignedIn();
  }

  /// Se termine quand la session Firebase est prête (ou a échoué).
  static Future<void> get ready {
    start();
    return _ready!;
  }

  static Future<void> ensureSignedIn({
    Duration timeout = const Duration(seconds: 8),
  }) async {
    try {
      // `currentUser` peut encore être null juste après Firebase.initializeApp()
      // même si une session (anonyme OU Google, via linkWithCredential) est
      // déjà persistée sur l'appareil : sa restauration est asynchrone. Un
      // simple `if (_auth.currentUser != null) return;` la rate quasi
      // systématiquement au cold start, et on écrase alors la session
      // restaurée par une TOUTE NOUVELLE session anonyme — perdant au passage
      // la connexion Google et tout entitlement qui y était rattaché.
      if (_auth.currentUser != null) {
        await _rememberSession();
        return;
      }

      final hadSessionBefore = await _hadSessionBefore();

      // Restauration native (Keychain iOS / Keystore Android, via
      // authStateChanges + sondage — voir _waitForNativeRestore) ET
      // restauration Google Sign-In silencieuse EN PARALLÈLE plutôt qu'en
      // cascade : sur les appareils où la restauration native est lente ou
      // échoue systématiquement, on ne paie plus la totalité du délai natif
      // avant de tenter Google — la première des deux qui aboutit fait
      // démarrer l'app. Sans ça, un appareil où seule la voie Google marche
      // attend inutilement plusieurs secondes à chaque lancement avant de
      // s'y essayer.
      final nativeRestore = _waitForNativeRestore(timeout, hadSessionBefore);
      final restored = hadSessionBefore
          ? await _firstSuccess([
              nativeRestore,
              CommunityService.trySilentGoogleRestore(),
            ])
          : await nativeRestore; // 1er lancement : rien à restaurer côté
      // Google, pas la peine de le tenter — juste la fenêtre courte native.

      if (restored && _auth.currentUser != null) {
        await _rememberSession();
        return;
      }

      if (hadSessionBefore) {
        debugPrint(
          '⚠️ AuthBootstrapService: une session existait déjà sur cet '
          'appareil mais n\'a pas pu être restaurée (ni nativement, ni via '
          'Google Sign-In silencieux) — création d\'un nouvel uid anonyme. '
          'Tout entitlement (achat vérifié, accès testeur) lié à '
          'l\'ancienne session Google devient inaccessible tant qu\'une '
          'reconnexion manuelle ne le rattache pas à nouveau à ce uid.',
        );
      }

      await _auth.signInAnonymously().timeout(timeout);
      await _rememberSession();
    } catch (e, stack) {
      // Non bloquant : hors-ligne au premier lancement, par exemple.
      // EntitlementService retentera plus tard (authStateChanges / prochain
      // accès à une catégorie payante).
      debugPrint('⚠️ AuthBootstrapService.ensureSignedIn a échoué: $e');
      debugPrint('$stack');
    }
  }

  /// Attend qu'une session Firebase native (Keychain iOS / Keystore Android)
  /// apparaisse, sans jamais en créer une : `authStateChanges()` n'est PAS
  /// fiable à 100 % au tout premier événement — c'est un bug connu de
  /// firebase_auth (Android/web) que ce premier événement émette `null`
  /// avant de se corriger un instant plus tard, même quand une session
  /// existe réellement sur l'appareil. Voir
  /// https://github.com/firebase/flutterfire/issues/9395
  /// On combine donc premier événement du stream + un sondage de
  /// `currentUser` réparti sur une fenêtre plus large avant de conclure à
  /// l'échec. La fenêtre de sondage est plus généreuse si on sait qu'une
  /// session a déjà existé sur cet appareil par le passé (voir
  /// _hadSessionBefore) ; sinon (tout premier lancement, rien à restaurer),
  /// on ne rallonge pas inutilement le démarrage.
  static Future<bool> _waitForNativeRestore(
    Duration streamTimeout,
    bool hadSessionBefore,
  ) async {
    final fromStream = await _auth.authStateChanges().first.timeout(
          streamTimeout,
          onTimeout: () => null,
        );
    if (fromStream != null) return true;

    final pollWindow = hadSessionBefore
        ? const Duration(milliseconds: 5000)
        : const Duration(milliseconds: 800);
    const pollStep = Duration(milliseconds: 250);

    var waited = Duration.zero;
    while (waited < pollWindow) {
      await Future.delayed(pollStep);
      waited += pollStep;
      if (_auth.currentUser != null) return true;
    }
    return false;
  }

  /// Course entre plusieurs tentatives de restauration : retourne `true` dès
  /// que L'UNE d'elles réussit, sans attendre les autres. Ne retourne
  /// `false` qu'une fois TOUTES échouées — jamais avant, pour ne pas
  /// abandonner une tentative encore en cours au profit d'une autre déjà
  /// terminée en échec.
  static Future<bool> _firstSuccess(List<Future<bool>> futures) {
    final completer = Completer<bool>();
    var remaining = futures.length;
    for (final future in futures) {
      future.then((ok) {
        if (completer.isCompleted) return;
        if (ok) {
          completer.complete(true);
        } else {
          remaining--;
          if (remaining == 0) completer.complete(false);
        }
      }, onError: (Object _, StackTrace __) {
        if (completer.isCompleted) return;
        remaining--;
        if (remaining == 0) completer.complete(false);
      });
    }
    return completer.future;
  }

  static Future<bool> _hadSessionBefore() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_kHasHadSessionKey) ?? false;
    } catch (_) {
      return false;
    }
  }

  static Future<void> _rememberSession() async {
    final user = _auth.currentUser;
    debugPrint(
      '✅ AuthBootstrapService: session prête — uid=${user?.uid}, '
      'anonyme=${user?.isAnonymous}, email=${user?.email}',
    );
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_kHasHadSessionKey, true);
    } catch (_) {
      // Non bloquant : au pire on retentera un sondage court au prochain
      // démarrage au lieu du long, sans casser quoi que ce soit.
    }
  }
}
