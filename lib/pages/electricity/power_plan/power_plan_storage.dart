// lib/pages/electricity/power_plan/power_plan_storage.dart
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'power_plan_models.dart';

/// Sauvegarde locale des plans électriques (plusieurs projets).
class PowerPlanStorage {
  static const _key = 'electricity_power_plans_v1';
  static const _currentKey = 'electricity_power_plans_current_v1';

  static Future<List<PpPlan>> loadAll() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_key);
      if (raw == null || raw.trim().isEmpty) return [];
      final decoded = jsonDecode(raw);
      if (decoded is! List) return [];
      final plans = decoded
          .whereType<Map>()
          .map((m) => PpPlan.fromJson(Map<String, dynamic>.from(m)))
          .toList();
      plans.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
      return plans;
    } catch (_) {
      return [];
    }
  }

  static Future<void> saveAll(List<PpPlan> plans) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        _key, jsonEncode(plans.map((p) => p.toJson()).toList()));
  }

  static Future<String?> loadCurrentId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_currentKey);
  }

  static Future<void> saveCurrentId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_currentKey, id);
  }
}
