// lib/pages/lumiere/fixtures/fixture_compare_engine.dart
//
// Moteur du comparateur de projecteurs : trouve des machines équivalentes à
// une machine de référence dans le catalogue lumière.
// Aucune dépendance Flutter (testable avec `flutter test`).
//
// Critères, par ordre d'importance : luminosité (lumens), zoom (angle mini et
// maxi), CRI, source lumineuse, puissance, poids.
// Une valeur absente du catalogue n'est jamais devinée : le critère est
// simplement compté comme « non comparable » (la machine perd ces points et
// est marquée « données incomplètes »).

import 'dart:math' as math;

import 'fixture_models.dart';

/// Famille de machine, déduite du champ « type » du catalogue (texte libre).
enum FixtureFamily {
  spotProfile,
  beam,
  hybrid,
  wash,
  movingHead, // « Moving Head » sans précision
  par,
  fresnelPc,
  bar,
  strobe,
  followspot,
  softPanel,
  cyclo,
  effect,
  laser,
  atmospheric,
  other,
}

/// Lyre (motorisée) ou fixe. `unknown` quand le type ne le dit pas.
enum FixtureMotion { moving, fixed, unknown }

/// Source lumineuse, normalisée depuis le texte libre du catalogue.
enum SourceKind { whiteLed, colorLed, discharge, laserPhosphor, halogen, other }

/// Portée de la recherche par famille.
enum FamilyScope { same, close, all }

enum CompareCriterion { lumen, zoom, cri, source, power, weight }

/// Poids de chaque critère dans le score (somme = 1).
const Map<CompareCriterion, double> kCriterionWeights = {
  CompareCriterion.lumen: 0.45,
  CompareCriterion.zoom: 0.30,
  CompareCriterion.cri: 0.10,
  CompareCriterion.source: 0.05,
  CompareCriterion.power: 0.05,
  CompareCriterion.weight: 0.05,
};

String _norm(String s) {
  const from = 'àâäáãéèêëíìîïóòôöõúùûüçñ';
  const to = 'aaaaaeeeeiiiiooooouuuucn';
  final b = StringBuffer();
  for (final ch in s.toLowerCase().split('')) {
    final i = from.indexOf(ch);
    b.write(i >= 0 ? to[i] : ch);
  }
  return b.toString();
}

bool _hasAny(String s, List<String> words) => words.any(s.contains);

bool _hasWord(String s, String word) =>
    RegExp('(^|[^a-z])${RegExp.escape(word)}([^a-z]|\$)').hasMatch(s);

/// Classe une machine dans une famille à partir de son type (et, à défaut,
/// de son nom). Les règles vont du plus spécifique au plus général.
FixtureFamily familyOf(Product p) {
  final f = familyOfText(p.type);
  if (f != FixtureFamily.other) return f;
  return familyOfText(p.name);
}

FixtureFamily familyOfText(String raw) {
  final t = _norm(raw);
  if (t.trim().isEmpty) return FixtureFamily.other;

  if (_hasAny(t, const [
    'smoke', 'haze', 'fog', 'co2', 'snow', 'confetti', 'spark', 'etincelle',
    'sfx', 'fumee', 'brouillard',
  ])) {
    return FixtureFamily.atmospheric;
  }
  if (_hasAny(t, const [
    'dimmer', 'node', 'network', 'software', 'serveur', 'server',
    'controller', 'accessory', 'enclosure', 'pixel driver', 'driver',
    'ecran', 'display', 'galerie', 'simulator', 'tracking',
  ]) ||
      _hasWord(t, 'dmx') ||
      _hasWord(t, 'power') ||
      _hasWord(t, 'rail') ||
      _hasWord(t, 'pole')) {
    return FixtureFamily.other;
  }
  if (_hasAny(t, const ['follow', 'poursuite'])) return FixtureFamily.followspot;

  final hasBeam = t.contains('beam') || t.contains('searchlight') ||
      t.contains('skytracer') || t.contains('long throw');
  final hasSpot = t.contains('profile') || _hasWord(t, 'spot') ||
      t.contains('leko') || t.contains('decoupe') || t.contains('ellipso');
  final hasWash = t.contains('wash');

  if (_hasAny(t, const ['hybrid', 'hybride', 'bsw', 'bws', 'multi-effet']) ||
      (hasBeam && (hasSpot || hasWash))) {
    return FixtureFamily.hybrid;
  }
  if (t.contains('laser') && !hasBeam && !t.contains('dlp')) {
    return FixtureFamily.laser;
  }
  if (_hasAny(t, const ['strobe', 'stroboscope', 'blinder'])) {
    return FixtureFamily.strobe;
  }
  if (hasBeam) return FixtureFamily.beam;
  if (hasSpot) return FixtureFamily.spotProfile;
  if (_hasAny(t, const [
    'bar', 'batten', 'linear', 'lineaire', 'tube', 'strip', 'footlight',
    'corniche', 'barre',
  ])) {
    return FixtureFamily.bar;
  }
  if (_hasAny(t, const ['cyclo', 'wall washer', 'wallwasher', 'grazing',
    'uplighter'])) {
    return FixtureFamily.cyclo;
  }
  if (t.contains('fresnel') || _hasWord(t, 'pc')) return FixtureFamily.fresnelPc;
  if (_hasWord(t, 'par') || t.contains('pinspot')) return FixtureFamily.par;
  if (hasWash) return FixtureFamily.wash;
  if (_hasAny(t, const [
    'panel', 'soft', 'flood', 'daylight', 'bi-color', 'bicolor', 'film',
    'studio', 'downlight', 'ceiling',
  ])) {
    return FixtureFamily.softPanel;
  }
  if (_hasAny(t, const [
    'matri', 'pixel', 'dots', 'kinetic', 'kaleido', 'scan', 'mirror',
    'effect', 'effet', 'deco', 'retro', 'vintage', 'bulb', 'ampoule', 'gobo',
    'cube', 'flex',
  ]) ||
      _hasWord(t, 'fx') ||
      _hasWord(t, 'uv')) {
    return FixtureFamily.effect;
  }
  if (_hasAny(t, const ['moving head', 'moving yoke', 'lyre'])) {
    return FixtureFamily.movingHead;
  }
  return FixtureFamily.other;
}

FixtureMotion motionOf(Product p) {
  final t = _norm('${p.type} ${p.name}');
  if (_hasAny(t, const ['static', 'statique', 'fixe'])) return FixtureMotion.fixed;
  if (_hasAny(t, const ['moving', 'lyre', 'motoris'])) return FixtureMotion.moving;
  switch (familyOf(p)) {
    case FixtureFamily.par:
    case FixtureFamily.fresnelPc:
    case FixtureFamily.softPanel:
    case FixtureFamily.cyclo:
    case FixtureFamily.followspot:
      return FixtureMotion.fixed;
    case FixtureFamily.movingHead:
      return FixtureMotion.moving;
    default:
      return FixtureMotion.unknown;
  }
}

/// Familles considérées comme « proches » (remplacement possible avec
/// compromis).
const Map<FixtureFamily, Set<FixtureFamily>> _closeFamilies = {
  FixtureFamily.spotProfile: {FixtureFamily.hybrid, FixtureFamily.movingHead},
  FixtureFamily.beam: {FixtureFamily.hybrid, FixtureFamily.movingHead},
  FixtureFamily.hybrid: {
    FixtureFamily.spotProfile,
    FixtureFamily.beam,
    FixtureFamily.movingHead,
  },
  FixtureFamily.wash: {
    FixtureFamily.movingHead,
    FixtureFamily.par,
    FixtureFamily.cyclo,
  },
  FixtureFamily.movingHead: {
    FixtureFamily.spotProfile,
    FixtureFamily.beam,
    FixtureFamily.hybrid,
    FixtureFamily.wash,
  },
  FixtureFamily.par: {FixtureFamily.wash, FixtureFamily.fresnelPc},
  FixtureFamily.fresnelPc: {FixtureFamily.par, FixtureFamily.softPanel},
  FixtureFamily.bar: {FixtureFamily.cyclo},
  FixtureFamily.softPanel: {FixtureFamily.fresnelPc, FixtureFamily.cyclo},
  FixtureFamily.cyclo: {
    FixtureFamily.wash,
    FixtureFamily.bar,
    FixtureFamily.softPanel,
  },
};

bool familiesMatch(FixtureFamily ref, FixtureFamily cand, FamilyScope scope) {
  if (cand == FixtureFamily.atmospheric ||
      (cand == FixtureFamily.other && ref != FixtureFamily.other)) {
    return false;
  }
  switch (scope) {
    case FamilyScope.same:
      return ref == cand;
    case FamilyScope.close:
      return ref == cand || (_closeFamilies[ref]?.contains(cand) ?? false);
    case FamilyScope.all:
      return true;
  }
}

SourceKind? sourceKindOf(Product p) {
  final raw = p.lightSource;
  if (raw == null || raw.trim().isEmpty) return null;
  final t = _norm(raw);
  if (t.contains('laser')) return SourceKind.laserPhosphor;
  if (_hasAny(t, const [
    'decharge', 'discharge', 'msr', 'hmi', 'hid', 'arc', 'sirius', 'platinum',
    'lampe a ', 'metal',
  ])) {
    return SourceKind.discharge;
  }
  if (_hasAny(t, const ['halogen', 'tungst', 'incandesc', 'quartz'])) {
    return SourceKind.halogen;
  }
  if (t.contains('led') || t.contains('cob')) {
    if (_hasAny(t, const ['rgb', 'rgba', 'rgbw', 'rgbl', 'rgbal', 'couleur',
      'color', 'multi'])) {
      return SourceKind.colorLed;
    }
    return SourceKind.whiteLed;
  }
  return SourceKind.other;
}

/// Plage de zoom (min, max) en degrés ; une optique fixe donne min == max.
(double, double)? zoomRangeOf(Product p) {
  final a = p.zoomMinDeg;
  final b = p.zoomMaxDeg;
  if (a == null && b == null) return null;
  final lo = math.min(a ?? b!, b ?? a!);
  final hi = math.max(a ?? b!, b ?? a!);
  return (lo, hi);
}

int? _lumen(Product p) {
  final v = p.luminousFluxLumen;
  return (v == null || v <= 0) ? null : v;
}

int? _power(Product p) {
  final v = p.powerWatt;
  return (v == null || v <= 0) ? null : v;
}

double? _weight(Product p) {
  final v = p.weightKilogram;
  return (v == null || v <= 0) ? null : v;
}

/// Proximité de deux valeurs positives : 1 si égales, 0 à partir d'un
/// facteur 2 d'écart (échelle logarithmique, symétrique).
double closeness(double a, double b) {
  if (a <= 0 || b <= 0) return 0;
  final d = (math.log(a / b)).abs() / math.ln2;
  return (1 - d).clamp(0.0, 1.0);
}

class CompareFilters {
  const CompareFilters({
    this.scope = FamilyScope.same,
    this.sameMotion = true,
    this.lumenTolerancePct,
    this.mustCoverZoom = false,
    this.sources = const {},
    this.minCri,
    this.otherBrandsOnly = false,
    this.lighterOrEqual = false,
    this.lowerPowerOrEqual = false,
    this.includeIncomplete = true,
  });

  final FamilyScope scope;
  final bool sameMotion;

  /// Écart maximum sur le flux, en % (null = pas de limite).
  final int? lumenTolerancePct;
  final bool mustCoverZoom;

  /// Sources acceptées (vide = toutes).
  final Set<SourceKind> sources;
  final int? minCri;
  final bool otherBrandsOnly;
  final bool lighterOrEqual;
  final bool lowerPowerOrEqual;

  /// Garder les machines dont une donnée filtrée n'est pas renseignée.
  final bool includeIncomplete;

  static const defaults = CompareFilters();

  /// Nombre de filtres différents des réglages par défaut (pastille).
  int get activeCount {
    var n = 0;
    if (scope != defaults.scope) n++;
    if (sameMotion != defaults.sameMotion) n++;
    if (lumenTolerancePct != null) n++;
    if (mustCoverZoom) n++;
    if (sources.isNotEmpty) n++;
    if (minCri != null) n++;
    if (otherBrandsOnly) n++;
    if (lighterOrEqual) n++;
    if (lowerPowerOrEqual) n++;
    if (!includeIncomplete) n++;
    return n;
  }

  CompareFilters copyWith({
    FamilyScope? scope,
    bool? sameMotion,
    int? Function()? lumenTolerancePct,
    bool? mustCoverZoom,
    Set<SourceKind>? sources,
    int? Function()? minCri,
    bool? otherBrandsOnly,
    bool? lighterOrEqual,
    bool? lowerPowerOrEqual,
    bool? includeIncomplete,
  }) {
    return CompareFilters(
      scope: scope ?? this.scope,
      sameMotion: sameMotion ?? this.sameMotion,
      lumenTolerancePct:
          lumenTolerancePct != null ? lumenTolerancePct() : this.lumenTolerancePct,
      mustCoverZoom: mustCoverZoom ?? this.mustCoverZoom,
      sources: sources ?? this.sources,
      minCri: minCri != null ? minCri() : this.minCri,
      otherBrandsOnly: otherBrandsOnly ?? this.otherBrandsOnly,
      lighterOrEqual: lighterOrEqual ?? this.lighterOrEqual,
      lowerPowerOrEqual: lowerPowerOrEqual ?? this.lowerPowerOrEqual,
      includeIncomplete: includeIncomplete ?? this.includeIncomplete,
    );
  }
}

class CompareResult {
  CompareResult({
    required this.manufacturer,
    required this.product,
    required this.family,
    required this.score,
    required this.parts,
    required this.missing,
    required this.lumenDeltaPct,
    required this.coversZoom,
  });

  final Manufacturer manufacturer;
  final Product product;
  final FixtureFamily family;

  /// Score 0..1 (null si la référence n'a aucune donnée comparable).
  final double? score;

  /// Score de chaque critère comparé (0..1).
  final Map<CompareCriterion, double> parts;

  /// Critères renseignés pour la référence mais pas pour cette machine.
  final Set<CompareCriterion> missing;

  /// Écart de flux en % par rapport à la référence (+ = plus lumineux).
  final double? lumenDeltaPct;

  /// La plage de zoom couvre-t-elle celle de la référence ? (null = inconnu)
  final bool? coversZoom;

  bool get incomplete => missing.isNotEmpty;
}

/// Qualificatif d'un score.
enum MatchLevel { equivalent, close, far }

MatchLevel matchLevelOf(double score) {
  if (score >= 0.8) return MatchLevel.equivalent;
  if (score >= 0.55) return MatchLevel.close;
  return MatchLevel.far;
}

/// Critères pour lesquels la référence a une donnée.
Set<CompareCriterion> availableCriteria(Product ref) => {
      if (_lumen(ref) != null) CompareCriterion.lumen,
      if (zoomRangeOf(ref) != null) CompareCriterion.zoom,
      if (ref.cri != null) CompareCriterion.cri,
      if (sourceKindOf(ref) != null) CompareCriterion.source,
      if (_power(ref) != null) CompareCriterion.power,
      if (_weight(ref) != null) CompareCriterion.weight,
    };

/// Score d'un critère (null = pas comparable faute de donnée côté candidat).
double? criterionScore(CompareCriterion c, Product ref, Product cand) {
  switch (c) {
    case CompareCriterion.lumen: {
      final r = _lumen(ref), k = _lumen(cand);
      if (r == null || k == null) return null;
      return closeness(k.toDouble(), r.toDouble());
    }
    case CompareCriterion.zoom: {
      final r = zoomRangeOf(ref), k = zoomRangeOf(cand);
      if (r == null || k == null) return null;
      return 0.5 * closeness(k.$1, r.$1) + 0.5 * closeness(k.$2, r.$2);
    }
    case CompareCriterion.cri: {
      final r = ref.cri, k = cand.cri;
      if (r == null || k == null) return null;
      // Un CRI plus élevé n'est jamais pénalisé ; -15 points = 0.
      return (1 - math.max(0, r - k) / 15).clamp(0.0, 1.0);
    }
    case CompareCriterion.source: {
      final r = sourceKindOf(ref), k = sourceKindOf(cand);
      if (r == null || k == null) return null;
      return r == k ? 1.0 : 0.0;
    }
    case CompareCriterion.power: {
      final r = _power(ref), k = _power(cand);
      if (r == null || k == null) return null;
      // Consommer moins n'est pas pénalisé.
      return k <= r ? 1.0 : closeness(k.toDouble(), r.toDouble());
    }
    case CompareCriterion.weight: {
      final r = _weight(ref), k = _weight(cand);
      if (r == null || k == null) return null;
      return k <= r ? 1.0 : closeness(k, r);
    }
  }
}

bool? coversZoomOf(Product ref, Product cand) {
  final r = zoomRangeOf(ref), k = zoomRangeOf(cand);
  if (r == null || k == null) return null;
  // 5 % de tolérance sur les angles annoncés.
  return k.$1 <= r.$1 * 1.05 && k.$2 >= r.$2 * 0.95;
}

/// Applique un filtre « dur » : true = garder, false = exclure.
/// `known == false` → la donnée manque : on suit [includeIncomplete].
bool _keep(bool? passes, bool includeIncomplete) =>
    passes ?? includeIncomplete;

/// Cherche les équivalents de [ref] (fabricant [refManufacturer]) dans
/// [catalog], triés du plus proche au plus éloigné.
List<CompareResult> findEquivalents({
  required FixtureCatalog catalog,
  required Manufacturer refManufacturer,
  required Product ref,
  CompareFilters filters = CompareFilters.defaults,
  int limit = 60,
}) {
  final refFamily = familyOf(ref);
  final refMotion = motionOf(ref);
  final crit = availableCriteria(ref);
  final totalWeight =
      crit.fold<double>(0, (s, c) => s + kCriterionWeights[c]!);
  final refLumen = _lumen(ref);
  final seen = <String>{};
  final out = <CompareResult>[];

  for (final m in catalog.manufacturers) {
    for (final p in m.products) {
      final sameAsRef = _norm(m.name) == _norm(refManufacturer.name) &&
          _norm(p.name) == _norm(ref.name);
      if (sameAsRef) continue;
      final key = '${_norm(m.name)}|${_norm(p.name)}';
      if (!seen.add(key)) continue;

      final fam = familyOf(p);
      if (!familiesMatch(refFamily, fam, filters.scope)) continue;

      if (filters.sameMotion && refMotion != FixtureMotion.unknown) {
        final mo = motionOf(p);
        if (mo != FixtureMotion.unknown && mo != refMotion) continue;
      }
      if (filters.otherBrandsOnly &&
          _norm(m.name) == _norm(refManufacturer.name)) {
        continue;
      }

      final lum = _lumen(p);
      if (filters.lumenTolerancePct != null && refLumen != null) {
        final ok = lum == null
            ? null
            : ((lum - refLumen).abs() / refLumen * 100) <=
                filters.lumenTolerancePct!;
        if (!_keep(ok, filters.includeIncomplete)) continue;
      }

      final covers = coversZoomOf(ref, p);
      if (filters.mustCoverZoom && zoomRangeOf(ref) != null) {
        if (!_keep(covers, filters.includeIncomplete)) continue;
      }

      if (filters.sources.isNotEmpty) {
        final sk = sourceKindOf(p);
        final ok = sk == null ? null : filters.sources.contains(sk);
        if (!_keep(ok, filters.includeIncomplete)) continue;
      }

      if (filters.minCri != null) {
        final ok = p.cri == null ? null : p.cri! >= filters.minCri!;
        if (!_keep(ok, filters.includeIncomplete)) continue;
      }

      if (filters.lighterOrEqual && _weight(ref) != null) {
        final w = _weight(p);
        final ok = w == null ? null : w <= _weight(ref)!;
        if (!_keep(ok, filters.includeIncomplete)) continue;
      }

      if (filters.lowerPowerOrEqual && _power(ref) != null) {
        final w = _power(p);
        final ok = w == null ? null : w <= _power(ref)!;
        if (!_keep(ok, filters.includeIncomplete)) continue;
      }

      final parts = <CompareCriterion, double>{};
      final missing = <CompareCriterion>{};
      var sum = 0.0;
      for (final c in crit) {
        final s = criterionScore(c, ref, p);
        if (s == null) {
          missing.add(c);
        } else {
          parts[c] = s;
          sum += kCriterionWeights[c]! * s;
        }
      }
      // Sans aucune donnée comparable, la machine n'apporte rien : on ne la
      // garde que si l'utilisateur veut voir les données incomplètes.
      if (parts.isEmpty && !filters.includeIncomplete) continue;

      out.add(CompareResult(
        manufacturer: m,
        product: p,
        family: fam,
        score: totalWeight > 0 ? sum / totalWeight : null,
        parts: parts,
        missing: missing,
        lumenDeltaPct: (lum != null && refLumen != null)
            ? (lum - refLumen) / refLumen * 100
            : null,
        coversZoom: covers,
      ));
    }
  }

  out.sort((a, b) {
    final c = (b.score ?? -1).compareTo(a.score ?? -1);
    if (c != 0) return c;
    // À score égal : machines complètes d'abord, puis par nom.
    final i = a.missing.length.compareTo(b.missing.length);
    if (i != 0) return i;
    return '${a.manufacturer.name} ${a.product.name}'
        .toLowerCase()
        .compareTo('${b.manufacturer.name} ${b.product.name}'.toLowerCase());
  });
  return out.length > limit ? out.sublist(0, limit) : out;
}
