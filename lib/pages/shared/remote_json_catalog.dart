// lib/pages/shared/remote_json_catalog.dart
//
// Chargement générique d'un catalogue JSON publié sur GitHub
// (même logique que le catalogue lumière) :
//   1. cache local (SharedPreferences)  → affichage immédiat
//   2. sinon copie embarquée dans l'app (assets/)
//   3. puis mise à jour en arrière-plan depuis GitHub (raw).

import 'dart:convert';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// Implémentation fetch pour le Web uniquement (stub sur mobile/desktop).
import '../lumiere/fixtures/fixture_hybrid_repository_web.dart'
    if (dart.library.io) '../lumiere/fixtures/fixture_hybrid_repository_web_noop.dart';

const String kCatalogDataBaseUrl =
    'https://raw.githubusercontent.com/francoisvdm2000/mon-app-tech-data/main/';

class RemoteJsonCatalog {
  final String cacheKey;
  final String remoteUrl;
  final String assetPath;

  RemoteJsonCatalog({
    required this.cacheKey,
    required this.remoteUrl,
    required this.assetPath,
  });

  /// remote | cache | assets | remote_error
  String lastSource = 'unknown';
  String lastError = '';

  Future<void> clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(cacheKey);
  }

  /// Cache, sinon assets. Ne lève pas d'exception : renvoie `{}` en dernier recours.
  Future<Map<String, dynamic>> loadInitialFast() async {
    lastError = '';
    try {
      final prefs = await SharedPreferences.getInstance();
      final cached = prefs.getString(cacheKey);
      if (cached != null && cached.trim().isNotEmpty) {
        final decoded = json.decode(cached);
        if (decoded is Map<String, dynamic>) {
          lastSource = 'cache';
          return decoded;
        }
      }
    } catch (_) {
      // On retombe sur les assets.
    }

    try {
      final raw = await rootBundle.loadString(assetPath);
      final decoded = json.decode(raw);
      if (decoded is Map<String, dynamic>) {
        lastSource = 'assets';
        return decoded;
      }
    } catch (e) {
      lastError = e.toString();
    }
    lastSource = 'assets';
    return <String, dynamic>{};
  }

  /// Télécharge la dernière version. Renvoie null en cas d'échec.
  Future<Map<String, dynamic>?> refreshRemote() async {
    lastError = '';
    try {
      final body =
          kIsWeb ? await fetchTextWeb(remoteUrl) : await _fetchTextIo(remoteUrl);
      final decoded = json.decode(body);
      if (decoded is! Map<String, dynamic>) {
        lastSource = 'remote_error';
        lastError = 'Invalid JSON (expected object root).';
        return null;
      }
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(cacheKey, body);
      lastSource = 'remote';
      return decoded;
    } catch (e) {
      lastSource = 'remote_error';
      lastError = e.toString();
      return null;
    }
  }

  Future<String> _fetchTextIo(String url) async {
    final res = await http.get(
      Uri.parse(url),
      headers: const {'Cache-Control': 'no-cache'},
    );
    if (res.statusCode != 200) {
      throw Exception('HTTP error: ${res.statusCode}');
    }
    final body = res.body;
    if (body.trim().isEmpty) throw Exception('Empty response');
    return body;
  }
}

// ── Petits helpers de lecture JSON tolérants ─────────────────────────────────

String jStr(dynamic v) => v == null ? '' : v.toString().trim();

double? jNum(dynamic v) {
  if (v == null) return null;
  if (v is num) return v > 0 ? v.toDouble() : null;
  final n = double.tryParse(v.toString().trim().replaceAll(',', '.'));
  return (n != null && n > 0) ? n : null;
}

bool? jBool(dynamic v) {
  if (v == null) return null;
  if (v is bool) return v;
  final s = v.toString().trim().toLowerCase();
  if (s.isEmpty) return null;
  return const ['oui', 'yes', 'true', '1', 'x'].contains(s);
}

List<dynamic> jList(dynamic v) => v is List ? v : const [];

DateTime? jDate(dynamic v) {
  if (v == null) return null;
  return DateTime.tryParse(v.toString());
}
