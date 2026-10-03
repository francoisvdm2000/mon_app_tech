import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'entitlement_service.dart';

/// Accorde automatiquement un accès complet, sans achat, aux comptes Google
/// listés côté serveur (collection Firestore `testers`, gérée à la main
/// via la console — voir functions/src/testerAccess.ts pour la logique qui
/// fait autorité, ce service côté client ne fait que la déclencher).
///
/// Confort pour le développeur/les testeurs internes : contrairement à un
/// entitlement lié à un achat, celui-ci n'est jamais revérifié/expiré
/// automatiquement, et survit aux réinstallations tant que le même compte
/// Google est utilisé (on rappelle cette fonction à chaque connexion).
class TesterAccessService {
  static final FirebaseFunctions _functions =
      FirebaseFunctions.instanceFor(region: 'europe-west1');

  /// uid pour lequel l'accès a déjà été accordé pendant cette session.
  /// Par uid (et non un simple booléen) : après une déconnexion puis une
  /// connexion avec l'AUTRE compte testeur, il faut refaire la demande pour
  /// le nouvel uid — un booléen global la sautait jusqu'au redémarrage.
  static String? _claimedUid;
  static bool _initialized = false;
  static StreamSubscription<User?>? _authSub;

  /// À appeler une fois au démarrage (main.dart). S'abonne à
  /// authStateChanges plutôt que de lire currentUser une seule fois : au
  /// lancement de l'app, Firebase Auth restaure une session Google déjà
  /// connectée de façon asynchrone, donc currentUser peut encore être null
  /// juste après l'init même si l'utilisateur est en réalité déjà
  /// connecté — un simple appel ponctuel au démarrage rate ce cas.
  static void init() {
    if (_initialized) return;
    _initialized = true;

    _authSub = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null && !user.isAnonymous && user.email != null) {
        unawaited(claimIfEligible());
      }
    });
  }

  /// À appeler après toute connexion Google explicite (en plus du listener
  /// ci-dessus, pour débloquer l'accès sans attendre un éventuel délai de
  /// propagation de l'event authStateChanges). Ne fait rien pour un compte
  /// anonyme. Toujours silencieux en cas d'échec (hors-ligne, compte non
  /// testeur, etc.) : ce n'est jamais bloquant pour le reste de l'app.
  static Future<void> claimIfEligible() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null || user.isAnonymous || user.email == null) return;
    if (_claimedUid == user.uid) return;

    try {
      final callable = _functions.httpsCallable('claimTesterAccess');
      final result = await callable.call<Map<String, dynamic>>();
      final data = Map<String, dynamic>.from(result.data as Map);

      if (data['granted'] == true) {
        _claimedUid = user.uid;
        await EntitlementService.refreshNow();
      }
    } catch (e, stack) {
      debugPrint('TesterAccessService.claimIfEligible a échoué: $e');
      debugPrint('$stack');
    }
  }

  /// Non utilisé en usage normal (le service vit pour toute la durée de vie
  /// de l'app) — utile pour les tests ou un hot restart propre.
  static Future<void> dispose() async {
    await _authSub?.cancel();
    _authSub = null;
    _initialized = false;
    _claimedUid = null;
  }
}
