// lib/pages/laser/laser_catalog.dart
//
// Catalogue laser publié depuis la feuille Google « Catalogue laser »
// vers GitHub (laser.json).

import '../shared/remote_json_catalog.dart';

class LaserProduct {
  final String brand;
  final String type;
  final String name;
  final double powerMilliwatt;
  final String colors;
  final double? beamDiameterMillimeter;
  final double? divergenceMilliradian;
  final String scanKpps;
  final String laserClass;
  final bool? dmx;
  final bool? ilda;
  final double? weightKilogram;
  final double? powerWatt;
  final String note;
  final String manualUrl;

  const LaserProduct({
    required this.brand,
    required this.type,
    required this.name,
    required this.powerMilliwatt,
    this.colors = '',
    this.beamDiameterMillimeter,
    this.divergenceMilliradian,
    this.scanKpps = '',
    this.laserClass = '',
    this.dmx,
    this.ilda,
    this.weightKilogram,
    this.powerWatt,
    this.note = '',
    this.manualUrl = '',
  });

  /// Les trois valeurs nécessaires au calcul des zones de sécurité.
  bool get hasSafetyInputs =>
      beamDiameterMillimeter != null && divergenceMilliradian != null;
}

class LaserCatalog {
  final DateTime? updatedAt;
  final List<LaserProduct> products;

  const LaserCatalog({required this.updatedAt, required this.products});

  factory LaserCatalog.fromJson(Map<String, dynamic> json) {
    final out = <LaserProduct>[];
    for (final m in jList(json['manufacturers'])) {
      if (m is! Map) continue;
      final brand = jStr(m['name']);
      if (brand.isEmpty) continue;
      for (final p in jList(m['products'])) {
        if (p is! Map) continue;
        final name = jStr(p['name']);
        final power = jNum(p['powerMilliwatt']);
        if (name.isEmpty || power == null) continue;
        out.add(LaserProduct(
          brand: brand,
          type: jStr(p['type']),
          name: name,
          powerMilliwatt: power,
          colors: jStr(p['colors']),
          beamDiameterMillimeter: jNum(p['beamDiameterMillimeter']),
          divergenceMilliradian: jNum(p['divergenceMilliradian']),
          scanKpps: jStr(p['scanKpps']),
          laserClass: jStr(p['laserClass']),
          dmx: jBool(p['dmx']),
          ilda: jBool(p['ilda']),
          weightKilogram: jNum(p['weightKilogram']),
          powerWatt: jNum(p['powerWatt']),
          note: jStr(p['note']),
          manualUrl: jStr(p['manualUrl']),
        ));
      }
    }
    return LaserCatalog(updatedAt: jDate(json['updatedAt']), products: out);
  }
}

class LaserCatalogRepository {
  final RemoteJsonCatalog _source = RemoteJsonCatalog(
    cacheKey: 'laser_catalog_cache_v1',
    remoteUrl: '${kCatalogDataBaseUrl}laser.json',
    assetPath: 'assets/catalogs/laser.json',
  );

  String get lastSource => _source.lastSource;
  String get lastError => _source.lastError;

  Future<void> clearCache() => _source.clearCache();

  Future<LaserCatalog> loadInitialFast() async =>
      LaserCatalog.fromJson(await _source.loadInitialFast());

  Future<LaserCatalog?> refreshRemote() async {
    final json = await _source.refreshRemote();
    if (json == null) return null;
    final cat = LaserCatalog.fromJson(json);
    return cat.products.isEmpty ? null : cat;
  }
}
