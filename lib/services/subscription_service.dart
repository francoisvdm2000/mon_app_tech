import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

enum SubscriptionCategory {
  video,
  lumiere,
  laser,
  console,
  electricity,
  rigging,
  pro,
}

extension SubscriptionCategoryExt on SubscriptionCategory {
  String get key {
    switch (this) {
      case SubscriptionCategory.video:
        return 'sub_video';
      case SubscriptionCategory.lumiere:
        return 'sub_lumiere';
      case SubscriptionCategory.laser:
        return 'sub_laser';
      case SubscriptionCategory.console:
        return 'sub_console';
      case SubscriptionCategory.electricity:
        return 'sub_electricity';
      case SubscriptionCategory.rigging:
        return 'sub_rigging';
      case SubscriptionCategory.pro:
        return 'sub_pro';
    }
  }

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
          return 'ShowTechTools_Electricity';
        case SubscriptionCategory.rigging:
          return 'ShowTechTools_Rigging';
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
      case SubscriptionCategory.pro:
        return 'eu.openwhite.showtechtools.pro.year';
    }
  }
}

class SubscriptionService {
  static Set<String> get allProductIds {
    return SubscriptionCategory.values.map((category) {
      return category.productId;
    }).toSet();
  }

  static Future<bool> hasAccess(SubscriptionCategory category) async {
    final prefs = await SharedPreferences.getInstance();

    final hasPro = prefs.getBool(SubscriptionCategory.pro.key) ?? false;
    if (hasPro) {
      return true;
    }

    return prefs.getBool(category.key) ?? false;
  }

  static Future<bool> hasDirectAccess(SubscriptionCategory category) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(category.key) ?? false;
  }

  static Future<void> activate(SubscriptionCategory category) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(category.key, true);
  }

  static Future<void> deactivate(SubscriptionCategory category) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(category.key, false);
  }

  static Future<Map<SubscriptionCategory, bool>>
      getDirectSubscriptions() async {
    final prefs = await SharedPreferences.getInstance();

    return {
      for (final category in SubscriptionCategory.values)
        category: prefs.getBool(category.key) ?? false,
    };
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
