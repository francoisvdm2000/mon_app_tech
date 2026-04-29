import 'subscription_service.dart';

enum ElectricityToolAccess {
  powerCurrent,
  phasePower,
  cableSection,
  upsAutonomy,
}

enum RiggingToolAccess {
  bridle2Points,
  angleFactor,
  wllCheck,
}

class ProService {
  static Future<bool> isPro() {
    return SubscriptionService.hasDirectAccess(SubscriptionCategory.pro);
  }

  static Future<void> activatePro() {
    return SubscriptionService.activate(SubscriptionCategory.pro);
  }

  static Future<void> deactivatePro() {
    return SubscriptionService.deactivate(SubscriptionCategory.pro);
  }

  static Future<bool> canAccessCategory(SubscriptionCategory category) async {
    return SubscriptionService.hasAccess(category);
  }

  static Future<bool> canAccessElectricityTool(
    ElectricityToolAccess tool,
  ) async {
    switch (tool) {
      case ElectricityToolAccess.cableSection:
      case ElectricityToolAccess.upsAutonomy:
        return true;

      case ElectricityToolAccess.powerCurrent:
      case ElectricityToolAccess.phasePower:
        return SubscriptionService.hasAccess(SubscriptionCategory.electricity);
    }
  }

  static Future<bool> canAccessRiggingTool(RiggingToolAccess tool) async {
    switch (tool) {
      case RiggingToolAccess.wllCheck:
        return true;

      case RiggingToolAccess.bridle2Points:
      case RiggingToolAccess.angleFactor:
        return SubscriptionService.hasAccess(SubscriptionCategory.rigging);
    }
  }
}
