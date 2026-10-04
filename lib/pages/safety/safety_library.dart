// lib/pages/safety/safety_library.dart
//
// Bibliothèque sécurité (risques, mesures, points de contrôle, pays) publiée
// depuis la feuille Google « ShowTech Tools – Bibliothèque PPSPS » vers GitHub
// (safety.json) par tools/apps_script/safety_library.gs.
//
// Chargement via RemoteJsonCatalog : cache local → copie embarquée
// (assets/catalogs/safety.json) → mise à jour GitHub en arrière-plan.
// Le module reste donc utilisable hors ligne sur chantier.

import '../shared/remote_json_catalog.dart';

/// Phases d'un chantier événementiel.
enum SafetyPhase { montage, exploitation, demontage }

SafetyPhase? safetyPhaseFromCode(String code) {
  switch (code.trim().toUpperCase()) {
    case 'M':
      return SafetyPhase.montage;
    case 'E':
      return SafetyPhase.exploitation;
    case 'D':
      return SafetyPhase.demontage;
  }
  return null;
}

/// Type de mesure de prévention.
enum SafetyMeasureType { collective, individuelle, organisationnelle }

SafetyMeasureType safetyMeasureTypeFrom(String raw) {
  final s = raw.trim().toLowerCase();
  if (s.startsWith('coll')) return SafetyMeasureType.collective;
  if (s.startsWith('ind')) return SafetyMeasureType.individuelle;
  return SafetyMeasureType.organisationnelle;
}

/// Texte bilingue de la bibliothèque. Les autres langues de l'app retombent
/// sur l'anglais en attendant des colonnes dédiées dans la feuille.
class SafetyText {
  final String fr;
  final String en;

  const SafetyText(this.fr, this.en);

  String forLanguage(String languageCode) {
    if (languageCode == 'fr') return fr.isNotEmpty ? fr : en;
    return en.isNotEmpty ? en : fr;
  }
}

class SafetyCategory {
  final String id;
  final SafetyText label;
  final String icon; // nom d'icône Material (ex. "height")

  const SafetyCategory({required this.id, required this.label, required this.icon});
}

class SafetyRisk {
  final String id;
  final String categoryId;
  final SafetyText label;
  final Set<SafetyPhase> phases;
  final int severity; // 1 à 4
  final int probability; // 1 à 4
  final String country; // "ALL" ou code pays

  const SafetyRisk({
    required this.id,
    required this.categoryId,
    required this.label,
    required this.phases,
    required this.severity,
    required this.probability,
    required this.country,
  });

  /// Gravité × probabilité, de 1 à 16.
  int get criticality => severity * probability;
}

class SafetyMeasure {
  final String id;
  final String riskId;
  final SafetyMeasureType type;
  final SafetyText label;
  final String country;
  final bool mandatory;

  const SafetyMeasure({
    required this.id,
    required this.riskId,
    required this.type,
    required this.label,
    required this.country,
    required this.mandatory,
  });
}

class SafetyControl {
  final String id;
  final String family;
  final SafetyText label;
  final String country;
  final bool photoRequired;

  const SafetyControl({
    required this.id,
    required this.family,
    required this.label,
    required this.country,
    required this.photoRequired,
  });
}

class SafetyCountry {
  final String code;
  final String name;
  final String document;
  final List<String> languages;
  final String references;
  final String status;

  const SafetyCountry({
    required this.code,
    required this.name,
    required this.document,
    required this.languages,
    required this.references,
    required this.status,
  });

  /// Pays proposé à la création d'un document (statut « Lancement »).
  bool get isAvailable => status.toLowerCase().startsWith('lanc');
}

bool _appliesTo(String itemCountry, String countryCode) =>
    itemCountry == 'ALL' || itemCountry == countryCode;

class SafetyLibrary {
  final DateTime? updatedAt;
  final List<SafetyCategory> categories;
  final List<SafetyRisk> risks;
  final List<SafetyMeasure> measures;
  final List<SafetyControl> controls;
  final List<SafetyCountry> countries;

  const SafetyLibrary({
    required this.updatedAt,
    required this.categories,
    required this.risks,
    required this.measures,
    required this.controls,
    required this.countries,
  });

  static const SafetyLibrary empty = SafetyLibrary(
    updatedAt: null,
    categories: [],
    risks: [],
    measures: [],
    controls: [],
    countries: [],
  );

  bool get isEmpty => risks.isEmpty && controls.isEmpty;

  List<SafetyCountry> get availableCountries =>
      countries.where((c) => c.isAvailable).toList();

  List<SafetyRisk> risksFor(String countryCode, {String? categoryId}) => risks
      .where((r) =>
          _appliesTo(r.country, countryCode) &&
          (categoryId == null || r.categoryId == categoryId))
      .toList();

  List<SafetyMeasure> measuresFor(String riskId, String countryCode) => measures
      .where((m) => m.riskId == riskId && _appliesTo(m.country, countryCode))
      .toList();

  List<SafetyControl> controlsFor(String countryCode, {String? family}) =>
      controls
          .where((c) =>
              _appliesTo(c.country, countryCode) &&
              (family == null || c.family == family))
          .toList();

  /// Familles de contrôles, dans l'ordre de la feuille.
  List<String> get controlFamilies {
    final seen = <String>{};
    return [for (final c in controls) if (seen.add(c.family)) c.family];
  }

  factory SafetyLibrary.fromJson(Map<String, dynamic> json) {
    SafetyText text(Map m) => SafetyText(jStr(m['fr']), jStr(m['en']));
    String country(dynamic v) {
      final s = jStr(v).toUpperCase();
      return s.isEmpty ? 'ALL' : s;
    }

    int level(dynamic v) {
      final n = v is num ? v.toInt() : int.tryParse(jStr(v)) ?? 1;
      return n.clamp(1, 4);
    }

    final categories = <SafetyCategory>[];
    for (final c in jList(json['categories'])) {
      if (c is! Map) continue;
      final id = jStr(c['id']);
      if (id.isEmpty) continue;
      categories.add(SafetyCategory(id: id, label: text(c), icon: jStr(c['icon'])));
    }

    final risks = <SafetyRisk>[];
    for (final r in jList(json['risks'])) {
      if (r is! Map) continue;
      final id = jStr(r['id']);
      if (id.isEmpty) continue;
      final phases = <SafetyPhase>{
        for (final p in jList(r['phases']))
          if (safetyPhaseFromCode(jStr(p)) != null) safetyPhaseFromCode(jStr(p))!,
      };
      risks.add(SafetyRisk(
        id: id,
        categoryId: jStr(r['category']),
        label: text(r),
        phases: phases.isEmpty ? SafetyPhase.values.toSet() : phases,
        severity: level(r['severity']),
        probability: level(r['probability']),
        country: country(r['country']),
      ));
    }

    final measures = <SafetyMeasure>[];
    for (final m in jList(json['measures'])) {
      if (m is! Map) continue;
      final id = jStr(m['id']);
      final riskId = jStr(m['risk']);
      if (id.isEmpty || riskId.isEmpty) continue;
      measures.add(SafetyMeasure(
        id: id,
        riskId: riskId,
        type: safetyMeasureTypeFrom(jStr(m['type'])),
        label: text(m),
        country: country(m['country']),
        mandatory: jBool(m['mandatory']) ?? false,
      ));
    }

    final controls = <SafetyControl>[];
    for (final c in jList(json['controls'])) {
      if (c is! Map) continue;
      final id = jStr(c['id']);
      if (id.isEmpty) continue;
      controls.add(SafetyControl(
        id: id,
        family: jStr(c['family']),
        label: text(c),
        country: country(c['country']),
        photoRequired: jBool(c['photoRequired']) ?? false,
      ));
    }

    final countries = <SafetyCountry>[];
    for (final c in jList(json['countries'])) {
      if (c is! Map) continue;
      final code = jStr(c['code']).toUpperCase();
      if (code.isEmpty) continue;
      countries.add(SafetyCountry(
        code: code,
        name: jStr(c['name']),
        document: jStr(c['document']),
        languages: [for (final l in jList(c['languages'])) jStr(l)],
        references: jStr(c['references']),
        status: jStr(c['status']),
      ));
    }

    return SafetyLibrary(
      updatedAt: jDate(json['updatedAt']),
      categories: categories,
      risks: risks,
      measures: measures,
      controls: controls,
      countries: countries,
    );
  }
}

class SafetyLibraryRepository {
  final RemoteJsonCatalog _source = RemoteJsonCatalog(
    cacheKey: 'safety_library_cache_v1',
    remoteUrl: '${kCatalogDataBaseUrl}safety.json',
    assetPath: 'assets/catalogs/safety.json',
  );

  String get lastSource => _source.lastSource;
  String get lastError => _source.lastError;

  Future<void> clearCache() => _source.clearCache();

  Future<SafetyLibrary> loadInitialFast() async {
    final json = await _source.loadInitialFast();
    return SafetyLibrary.fromJson(json);
  }

  Future<SafetyLibrary?> refreshRemote() async {
    final json = await _source.refreshRemote();
    if (json == null) return null;
    final lib = SafetyLibrary.fromJson(json);
    return lib.isEmpty ? null : lib;
  }
}
