import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/network/network_snapshot.dart';

/// Persistance locale des snapshots réseau (SharedPreferences, JSON).
///
/// Limite : [_kMaxSnapshots] snapshots conservés (FIFO).
/// Future : comparaison entre deux snapshots, export CSV/PDF.
class NetworkSnapshotService {
  static const String _kPrefsKey = 'network_snapshots_v1';
  static const int _kMaxSnapshots = 20;

  /// Charge tous les snapshots sauvegardés, du plus récent au plus ancien.
  Future<List<NetworkSnapshot>> loadAll() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_kPrefsKey) ?? [];
    final result = <NetworkSnapshot>[];
    for (final s in raw) {
      try {
        result.add(
            NetworkSnapshot.fromJson(jsonDecode(s) as Map<String, dynamic>));
      } catch (_) {
        // Ignore les entrées corrompues
      }
    }
    return result;
  }

  /// Sauvegarde un snapshot. Les plus anciens sont supprimés si la limite est atteinte.
  Future<void> save(NetworkSnapshot snapshot) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_kPrefsKey) ?? [];
    raw.insert(0, jsonEncode(snapshot.toJson()));
    if (raw.length > _kMaxSnapshots) {
      raw.removeRange(_kMaxSnapshots, raw.length);
    }
    await prefs.setStringList(_kPrefsKey, raw);
  }

  /// Supprime un snapshot par son [id].
  Future<void> delete(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_kPrefsKey) ?? [];
    raw.removeWhere((s) {
      try {
        return (jsonDecode(s) as Map<String, dynamic>)['id'] == id;
      } catch (_) {
        return false;
      }
    });
    await prefs.setStringList(_kPrefsKey, raw);
  }

  /// Supprime tous les snapshots.
  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kPrefsKey);
  }
}
