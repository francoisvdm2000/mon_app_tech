// lib/pages/electricity/load_balancer/load_balancer_storage.dart
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'load_balancer_models.dart';

class LoadBalancerStorage {
  static const _key = 'electricity_load_balancer_v1';

  static Future<LoadDistribution> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_key);
      if (raw == null || raw.trim().isEmpty) return LoadDistribution.empty;
      final decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) return LoadDistribution.empty;
      return LoadDistribution.fromJson(decoded);
    } catch (_) {
      return LoadDistribution.empty;
    }
  }

  static Future<void> save(LoadDistribution distribution) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, jsonEncode(distribution.toJson()));
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }

  static String makeId() =>
      DateTime.now().microsecondsSinceEpoch.toString();
}
