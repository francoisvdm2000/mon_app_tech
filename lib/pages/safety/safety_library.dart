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

/// Langues prises en charge par la bibliothèque et par les documents.
const List<String> kSafetyLanguages = ['fr', 'en', 'nl', 'de', 'es', 'pt'];

/// Texte multilingue de la bibliothèque. Une langue absente retombe sur
/// l'anglais, puis sur le français.
class SafetyText {
  final Map<String, String> values;

  const SafetyText(this.values);

  String get fr => values['fr'] ?? '';
  String get en => values['en'] ?? '';

  String forLanguage(String languageCode) {
    for (final code in [languageCode, 'en', 'fr']) {
      final v = values[code];
      if (v != null && v.isNotEmpty) return v;
    }
    return values.values.firstWhere((v) => v.isNotEmpty, orElse: () => '');
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

  SafetyRiskLevel get level => safetyRiskLevel(severity, probability);
}

// ── Cotation des risques ────────────────────────────────────────────────────
//
// Grille gravité (1–4) × probabilité (1–4), cote de 1 à 16.
// Niveau : élevé si cote ≥ 12 OU gravité 4 (un risque mortel n'est jamais
// « moyen » ni « faible », même s'il est rare) ; moyen de 6 à 11 ; faible ≤ 5.

enum SafetyRiskLevel { low, medium, high }

SafetyRiskLevel safetyRiskLevel(int severity, int probability) {
  if (severity >= 4 || severity * probability >= 12) {
    return SafetyRiskLevel.high;
  }
  if (severity * probability >= 6) return SafetyRiskLevel.medium;
  return SafetyRiskLevel.low;
}

/// Tri : niveau d'abord, puis cote, puis gravité.
int compareRiskRating(int sevA, int probA, int sevB, int probB) {
  final la = safetyRiskLevel(sevA, probA).index;
  final lb = safetyRiskLevel(sevB, probB).index;
  if (la != lb) return lb.compareTo(la);
  final ca = sevA * probA, cb = sevB * probB;
  if (ca != cb) return cb.compareTo(ca);
  return sevB.compareTo(sevA);
}

/// Définition des niveaux de gravité (index 0 = niveau 1).
const Map<String, List<String>> kSeverityLevels = {
  'fr': [
    'Bénin : soins sur place, pas d\'arrêt de travail',
    'Accident avec arrêt de travail, sans séquelles',
    'Blessure grave : séquelles ou incapacité durable',
    'Mortel ou invalidité permanente',
  ],
  'en': [
    'Minor: first aid on site, no lost time',
    'Lost-time injury, no lasting effects',
    'Serious injury: lasting effects or disability',
    'Fatal or permanent disability',
  ],
  'nl': [
    'Licht: eerste zorg ter plaatse, geen werkverlet',
    'Ongeval met werkverlet, zonder blijvende letsels',
    'Ernstig letsel: blijvende gevolgen of arbeidsongeschiktheid',
    'Dodelijk of blijvende invaliditeit',
  ],
  'de': [
    'Gering: Erste Hilfe vor Ort, keine Ausfallzeit',
    'Unfall mit Ausfallzeit, ohne bleibende Folgen',
    'Schwere Verletzung: bleibende Folgen oder Arbeitsunfähigkeit',
    'Tödlich oder dauerhafte Invalidität',
  ],
  'es': [
    'Leve: primeros auxilios in situ, sin baja',
    'Accidente con baja, sin secuelas',
    'Lesión grave: secuelas o incapacidad duradera',
    'Mortal o invalidez permanente',
  ],
  'pt': [
    'Ligeiro: primeiros socorros no local, sem baixa',
    'Acidente com baixa, sem sequelas',
    'Lesão grave: sequelas ou incapacidade duradoura',
    'Mortal ou invalidez permanente',
  ],
};

/// Définition des niveaux de probabilité (index 0 = niveau 1).
const Map<String, List<String>> kProbabilityLevels = {
  'fr': [
    'Exceptionnel : jamais vu sur un événement',
    'Rare : déjà arrivé dans le métier',
    'Occasionnel : arrive de temps en temps',
    'Fréquent : arrive sur la plupart des événements',
  ],
  'en': [
    'Exceptional: never seen at an event',
    'Rare: has happened in the industry',
    'Occasional: happens from time to time',
    'Frequent: happens at most events',
  ],
  'nl': [
    'Uitzonderlijk: nooit gezien op een evenement',
    'Zeldzaam: al voorgekomen in de sector',
    'Af en toe: gebeurt van tijd tot tijd',
    'Vaak: gebeurt op de meeste evenementen',
  ],
  'de': [
    'Außergewöhnlich: bei Veranstaltungen nie beobachtet',
    'Selten: in der Branche schon vorgekommen',
    'Gelegentlich: kommt ab und zu vor',
    'Häufig: kommt bei den meisten Veranstaltungen vor',
  ],
  'es': [
    'Excepcional: nunca visto en un evento',
    'Raro: ya ha ocurrido en el sector',
    'Ocasional: ocurre de vez en cuando',
    'Frecuente: ocurre en la mayoría de los eventos',
  ],
  'pt': [
    'Excecional: nunca visto num evento',
    'Raro: já aconteceu no setor',
    'Ocasional: acontece de vez em quando',
    'Frequente: acontece na maioria dos eventos',
  ],
};

String severityLevelLabel(int level, String lang) =>
    (kSeverityLevels[lang] ?? kSeverityLevels['en']!)[(level - 1).clamp(0, 3)];

String probabilityLevelLabel(int level, String lang) =>
    (kProbabilityLevels[lang] ?? kProbabilityLevels['en']!)[(level - 1).clamp(0, 3)];

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
    SafetyText text(Map m) => SafetyText({
          for (final l in kSafetyLanguages)
            if (jStr(m[l]).isNotEmpty) l: jStr(m[l]),
        });
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
