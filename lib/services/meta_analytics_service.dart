import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/foundation.dart';

/// Service centralisé pour les événements Meta/Facebook App Events.
///
/// L'activation d'app (app_open) et l'installation sont gérées automatiquement
/// par le SDK (AutoLogAppEventsEnabled: true).
///
/// Ce service gère uniquement les événements métier :
/// - completed_registration (création de compte)
/// - subscribe (abonnement validé)
/// - fb_mobile_purchase (achat validé)
///
/// Tous les appels sont silencieux (try/catch) : une erreur Meta
/// ne doit jamais faire crasher l'app.
class MetaAnalyticsService {
  MetaAnalyticsService._();

  static final FacebookAppEvents _fb = FacebookAppEvents();

  // ── Événements ──────────────────────────────────────────────────────────

  /// Création de compte (completed_registration).
  /// Appeler quand un nouvel utilisateur crée son profil.
  static Future<void> logCompletedRegistration() async {
    try {
      await _fb.logEvent(
        name: 'fb_mobile_complete_registration',
        parameters: {'fb_registration_method': 'google'},
      );
    } catch (e) {
      debugPrint('[Meta] logCompletedRegistration error: $e');
    }
  }

  /// Début d'essai gratuit (StartTrial).
  /// À appeler si un mécanisme d'essai est introduit dans l'app.
  static Future<void> logStartTrial({required String productId}) async {
    try {
      await _fb.logEvent(
        name: 'StartTrial',
        parameters: {'fb_content_id': productId},
      );
    } catch (e) {
      debugPrint('[Meta] logStartTrial error: $e');
    }
  }

  /// Abonnement validé — événement Subscribe (standard Meta).
  /// [productId] : identifiant du produit (ex: "eu.openwhite.showtechtools.pro.year").
  static Future<void> logSubscribe({required String productId}) async {
    try {
      await _fb.logEvent(
        name: 'Subscribe',
        parameters: {'fb_content_id': productId},
      );
    } catch (e) {
      debugPrint('[Meta] logSubscribe error: $e');
    }
  }

  /// Achat validé — événement fb_mobile_purchase (standard Meta).
  /// [productId] : identifiant du produit.
  /// [price]     : montant brut (ex: 9.99).
  /// [currency]  : code ISO 4217 (ex: "EUR", "USD").
  ///
  /// N'appeler qu'après confirmation réelle de in_app_purchase.
  static Future<void> logPurchase({
    required String productId,
    required double price,
    required String currency,
  }) async {
    try {
      await _fb.logEvent(
        name: 'fb_mobile_purchase',
        valueToSum: price,
        parameters: {
          'fb_currency': currency,
          'fb_content_id': productId,
        },
      );
    } catch (e) {
      debugPrint('[Meta] logPurchase error: $e');
    }
  }
}
