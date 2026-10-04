// lib/pages/safety/ppsps/ppsps_storage.dart
//
// Stockage local des plans de sécurité (SharedPreferences, JSON), même
// principe que LoadBalancerStorage. Les documents restent sur l'appareil.

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'ppsps_models.dart';

class PpspsStorage {
  static const _key = 'safety_ppsps_documents_v1';

  /// Tous les documents, du plus récemment modifié au plus ancien.
  static Future<List<PpspsDocument>> loadAll() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_key);
      if (raw == null || raw.trim().isEmpty) return [];
      final decoded = jsonDecode(raw);
      if (decoded is! List) return [];
      final docs = [
        for (final d in decoded)
          if (d is Map<String, dynamic>) PpspsDocument.fromJson(d),
      ];
      docs.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
      return docs;
    } catch (_) {
      return [];
    }
  }

  static Future<void> _saveAll(List<PpspsDocument> docs) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        _key, jsonEncode([for (final d in docs) d.toJson()]));
  }

  /// Crée ou remplace le document portant le même id.
  static Future<void> save(PpspsDocument doc) async {
    final docs = await loadAll();
    final i = docs.indexWhere((d) => d.id == doc.id);
    if (i >= 0) {
      docs[i] = doc;
    } else {
      docs.add(doc);
    }
    await _saveAll(docs);
  }

  static Future<void> delete(String id) async {
    final docs = await loadAll();
    docs.removeWhere((d) => d.id == id);
    await _saveAll(docs);
  }
}
