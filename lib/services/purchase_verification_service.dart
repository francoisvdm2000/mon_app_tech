import 'dart:io';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import 'auth_bootstrap_service.dart';
import 'entitlement_service.dart';

/// Point de passage unique entre le SDK in_app_purchase (client, non fiable
/// à lui seul) et la vérification réelle côté serveur
/// (functions/src/verifyPurchase.ts, qui interroge Apple/Google directement).
///
/// Avant ce correctif, un événement `purchased`/`restored` du SDK suffisait
/// à débloquer l'accès en local — sans aucune confirmation indépendante.
/// C'est ce qui permettait un accès Pro gratuit non voulu (transaction
/// résiduelle, achat annulé/remboursé jamais revérifié...).
class PurchaseVerificationService {
  static final FirebaseFunctions _functions =
      FirebaseFunctions.instanceFor(region: 'europe-west1');

  /// Vérifie un achat auprès du serveur. Retourne true seulement si le
  /// serveur confirme l'accès actif ; en cas d'échec réseau/serveur, retourne
  /// false plutôt que de débloquer l'accès par défaut.
  static Future<bool> verify(PurchaseDetails purchase) async {
    final platform = Platform.isIOS ? 'ios' : 'android';

    // iOS : identifiant de transaction (App Store Server API). Android : le
    // purchase token attendu par l'API Google Play Developer.
    final token = Platform.isIOS
        ? purchase.purchaseID
        : purchase.verificationData.serverVerificationData;

    if (token == null || token.isEmpty) {
      debugPrint(
        'PurchaseVerificationService: token de vérification manquant '
        'pour ${purchase.productID} ($platform)',
      );
      return false;
    }

    // L'achat doit être rattaché à un uid : on attend la session Firebase
    // (établie en arrière-plan au démarrage).
    await AuthBootstrapService.ready;

    try {
      final callable = _functions.httpsCallable('verifyPurchase');
      final result = await callable.call(<String, dynamic>{
        'platform': platform,
        'productId': purchase.productID,
        'token': token,
      });

      final data = Map<String, dynamic>.from(result.data as Map);
      final active = data['active'] == true;

      // Reflète immédiatement le nouvel état dans l'UI (le listener Firestore
      // finira par recevoir le même changement, mais pas forcément avant
      // que l'écran de vérification passer à autre chose).
      await EntitlementService.refreshNow();

      return active;
    } on FirebaseFunctionsException catch (e, stack) {
      debugPrint(
        'PurchaseVerificationService: verifyPurchase a échoué '
        '(${e.code}): ${e.message}',
      );
      debugPrint('$stack');
      return false;
    } catch (e, stack) {
      debugPrint('PurchaseVerificationService: erreur inattendue: $e');
      debugPrint('$stack');
      return false;
    }
  }
}
