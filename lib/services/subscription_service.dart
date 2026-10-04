import 'dart:io';

import 'entitlement_service.dart';

enum SubscriptionCategory {
  video,
  lumiere,
  laser,
  console,
  electricity,
  rigging,
  sonRf,
  network,
  safety,
  pro,
}

extension SubscriptionCategoryExt on SubscriptionCategory {
  /// Doit rester strictement synchronisé avec le nom de l'enum : c'est la
  /// clé utilisée côté serveur (functions/src/config.ts, CATEGORIES) pour
  /// écrire/lire entitlements/{uid}.categories.{key}.
  String get key => name;

  String get productId {
    if (Platform.isIOS) {
      switch (this) {
        case SubscriptionCategory.video:
          return 'ShowTechTools_Video';
        case SubscriptionCategory.lumiere:
          return 'ShowTechTools_Lumiere';
        case SubscriptionCategory.laser:
          return 'ShowTechTools_Laser';
        case SubscriptionCategory.console:
          return 'ShowTechTools_Console';
        case SubscriptionCategory.electricity:
          return 'ShowTechTools_electricicty';
        case SubscriptionCategory.rigging:
          return 'ShowTechTools_Rigging';
        case SubscriptionCategory.sonRf:
          return 'ShowTechTools_SonRF';
        case SubscriptionCategory.network:
          return 'ShowTechTools_Network';
        case SubscriptionCategory.safety:
          return 'ShowTechTools_Safety';
        case SubscriptionCategory.pro:
          return 'eu.openwhite.showtechtools.pro.year';
      }
    }

    switch (this) {
      case SubscriptionCategory.video:
        return 'showtech.video.year';
      case SubscriptionCategory.lumiere:
        return 'showtech.light.year';
      case SubscriptionCategory.laser:
        return 'showtech.laser.year';
      case SubscriptionCategory.console:
        return 'showtech.console.year';
      case SubscriptionCategory.electricity:
        return 'showtech.electricity.year';
      case SubscriptionCategory.rigging:
        return 'showtech.rigging.year';
      case SubscriptionCategory.sonRf:
        return 'showtech.sonrf.year';
      case SubscriptionCategory.network:
        return 'showtech.network.year';
      case SubscriptionCategory.safety:
        return 'showtech.safety.year';
      case SubscriptionCategory.pro:
        return 'eu.openwhite.showtechtools.pro.year';
    }
  }
}

/// Façade au-dessus d'EntitlementService : c'est ce que le reste de l'app
/// (pages video/lumiere/laser/...) continue d'appeler, sans rien changer à
/// son propre code — seule la source de vérité change (Firestore
/// server-verified au lieu de SharedPreferences local).
///
/// Il n'y a plus de méthode `activate`/`deactivate` ici : un accès ne peut
/// plus être débloqué localement par le client. Après un achat/restauration,
/// voir functions/src/verifyPurchase.ts (appelée via cloud_functions) — seule
/// une vérification serveur réussie écrit l'entitlement.
class SubscriptionService {
  static Set<String> get allProductIds {
    return SubscriptionCategory.values.map((category) {
      return category.productId;
    }).toSet();
  }

  /// true si `category` est active, ou si "pro" (qui inclut tout) l'est.
  static Future<bool> hasAccess(SubscriptionCategory category) {
    return EntitlementService.hasCategoryAccess(category.key);
  }

  /// true si `category` précisément est active (sans hériter de "pro").
  static Future<bool> hasDirectAccess(SubscriptionCategory category) {
    return EntitlementService.isCategoryDirectlyActive(category.key);
  }

  static Future<Map<SubscriptionCategory, bool>>
      getDirectSubscriptions() async {
    final result = <SubscriptionCategory, bool>{};
    for (final category in SubscriptionCategory.values) {
      result[category] =
          await EntitlementService.isCategoryDirectlyActive(category.key);
    }
    return result;
  }

  static SubscriptionCategory? categoryFromProductId(String productId) {
    for (final category in SubscriptionCategory.values) {
      if (category.productId == productId) {
        return category;
      }
    }

    return null;
  }
}
