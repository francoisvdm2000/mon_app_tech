// lib/pages/electricity/power_plan/power_plan_catalog.dart
//
// Catalogue électricité (connecteurs + modèles de tableaux), même circuit que
// le son / le laser / la sécurité :
//   Google Sheet « Catalogue électricité » → Apps Script
//   → electricity.json (GitHub francoisvdm2000/mon-app-tech-data)
//   → cache local → app.
// Script : tools/apps_script/electricity_catalog.gs

import '../../shared/remote_json_catalog.dart';
import 'power_plan_models.dart';

class PpCatalogRepository {
  final RemoteJsonCatalog _source = RemoteJsonCatalog(
    cacheKey: 'electricity_catalog_cache_v1',
    remoteUrl: '${kCatalogDataBaseUrl}electricity.json',
    assetPath: 'assets/catalogs/electricity.json',
  );

  String get lastSource => _source.lastSource;

  /// Cache, sinon copie embarquée, sinon liste de base du code.
  Future<PpCatalog> loadInitialFast({String? lang}) async {
    final json = await _source.loadInitialFast();
    return PpCatalog.fromJson(json, lang: lang) ?? PpCatalog.builtIn;
  }

  /// Dernière version en ligne, ou null si hors ligne / fichier invalide.
  Future<PpCatalog?> refreshRemote({String? lang}) async {
    final json = await _source.refreshRemote();
    if (json == null) return null;
    return PpCatalog.fromJson(json, lang: lang);
  }
}
