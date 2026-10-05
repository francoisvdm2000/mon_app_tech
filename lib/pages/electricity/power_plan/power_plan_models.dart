// lib/pages/electricity/power_plan/power_plan_models.dart
//
// Plan de distribution électrique de spectacle : un arbre
//   Source (groupe / réseau / prise) → départs → tableaux → départs → charges.
//
// Réseau européen 230 / 400 V, connecteurs européens (Powerlock, CEE, Schuko).
// Toutes les valeurs de câble sont indicatives (H07RN-F cuivre, posé à l'air
// libre, 30 °C) : l'outil aide à préparer un plan, il ne remplace pas la
// vérification par une personne qualifiée.

import 'dart:math' as math;

const double kPpVoltPhase = 230.0; // L-N
const double kPpVoltLine = 400.0; // L-L
const double kPpCopperRho = 0.0225; // Ω·mm²/m (cuivre en service)
const double kPpMaxDropPercent = 5.0;
const double kPpWarnRatio = 0.8; // au-delà de 80 % : on prévient

String ppMakeId() =>
    '${DateTime.now().microsecondsSinceEpoch}${_rand.nextInt(1 << 20)}';
final _rand = math.Random();

// ─── Phases ──────────────────────────────────────────────────────────────────

enum PpPhase {
  l1,
  l2,
  l3;

  String get label => switch (this) { l1 => 'L1', l2 => 'L2', l3 => 'L3' };

  static PpPhase fromKey(String? k) =>
      PpPhase.values.firstWhere((e) => e.name == k, orElse: () => PpPhase.l1);
}

// ─── Connecteurs (catalogue) ─────────────────────────────────────────────────
//
// Les connecteurs et les modèles de tableaux viennent du catalogue
// électricité (Google Sheet → electricity.json sur GitHub). Une liste
// européenne de base est embarquée pour fonctionner hors ligne.

class PpConnector {
  const PpConnector({
    required this.id,
    required this.label,
    required this.shortLabel,
    required this.ampere,
    required this.isThreePhase,
    required this.colorValue,
    required this.defaultSection,
    this.isSingleCore = false,
    this.circuits = 1,
  });

  final String id;

  /// Nombre de circuits mono transportés (Socapex, Harting… = 6). 1 = prise simple.
  final int circuits;

  bool get isMulti => circuits > 1;

  /// Calibre total par phase d'un départ multi (6 circuits de 16 A → 32 A par phase).
  double phaseLimit(int breakerA) =>
      isMulti ? breakerA * math.max(1.0, circuits / 3) : breakerA.toDouble();

  /// Disjoncteur affiché : « 6×16 A » pour un multi.
  String breakerLabel(int breakerA) =>
      isMulti ? '$circuits×$breakerA A' : '$breakerA A';
  final String label;
  final String shortLabel;
  final int ampere;
  final bool isThreePhase;

  /// Câble à conducteurs séparés (Powerlock…).
  final bool isSingleCore;

  /// Couleur ARGB (rouge = 400 V, bleu = 230 V…).
  final int colorValue;

  /// Section par défaut du câble qui part de cette prise (mm²).
  final double defaultSection;

  /// Nom courant du câble (ex. « 5G16 »).
  String cableName(double section) {
    final s = ppFormatSection(section);
    if (isMulti) return 'Multi $circuits×$s';
    if (isSingleCore) return '${isThreePhase ? 5 : 3}×1×$s';
    return isThreePhase ? '5G$s' : '3G$s';
  }

  @override
  bool operator ==(Object other) => other is PpConnector && other.id == id;

  @override
  int get hashCode => id.hashCode;

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'short': shortLabel,
        'amps': ampere,
        'phases': isThreePhase ? 3 : 1,
        'singleCore': isSingleCore,
        'color': colorValue,
        'section': defaultSection,
        'circuits': circuits,
      };

  /// Lecture tolérante (catalogue JSON ou copie stockée dans un plan).
  /// [lang] : langue de l'app, pour les libellés traduits du catalogue
  /// (`i18n: {en: {label, short}}`), avec repli sur le libellé de base.
  static PpConnector? fromJson(dynamic raw, {String? lang}) {
    if (raw is! Map) return null;
    final m = Map<String, dynamic>.from(raw);
    final tr = ppTranslations(m, lang);
    final id = (m['id'] ?? '').toString().trim();
    final amps = _i(m['amps'], 0);
    if (id.isEmpty || amps <= 0) return null;
    final phases = _i(m['phases'], 3);
    final label = (tr['label'] ?? m['label'] ?? '').toString().trim();
    final short = (tr['short'] ?? m['short'] ?? '').toString().trim();
    final sec = _d(m['section'], 0);
    return PpConnector(
      id: id,
      label: label.isEmpty ? id : label,
      shortLabel: short.isEmpty ? (label.isEmpty ? id : label) : short,
      ampere: amps,
      isThreePhase: phases != 1,
      isSingleCore: _b(m['singleCore']),
      colorValue: _color(m['color'], phases != 1 ? 0xFFE5484D : 0xFF2F80ED),
      defaultSection: kPpSections.contains(sec) ? sec : _sectionFor(amps),
      circuits: math.max(1, _i(m['circuits'], 1)),
    );
  }

  /// Retrouve un connecteur par son id : catalogue courant, puis liste de
  /// base, puis la copie stockée dans le plan, sinon CEE 32A.
  static PpConnector byId(String? id, {dynamic spec}) {
    final k = (id ?? '').trim();
    for (final c in PpCatalog.current.connectors) {
      if (c.id == k) return c;
    }
    for (final c in kPpBuiltinConnectors) {
      if (c.id == k) return c;
    }
    return fromJson(spec) ?? kPpCee32;
  }

  /// Prise du catalogue la plus adaptée pour un calibre donné.
  static PpConnector forAmps(double amps, {bool threePhase = true}) {
    final list = PpCatalog.current.connectors
        .where((c) => c.isThreePhase == threePhase && !c.isMulti)
        .toList()
      ..sort((a, b) => a.ampere.compareTo(b.ampere));
    if (list.isEmpty) return threePhase ? kPpCee32 : kPpCee16Mono;
    for (final c in list) {
      if (c.ampere >= amps) return c;
    }
    return list.last;
  }
}

const kPpPowerlock400 = PpConnector(
  id: 'powerlock400', label: 'Powerlock 400A', shortLabel: 'PL 400',
  ampere: 400, isThreePhase: true, isSingleCore: true,
  colorValue: 0xFFB0BEC5, defaultSection: 150,
);
const kPpCee125 = PpConnector(
  id: 'cee125', label: 'CEE 125A 5P', shortLabel: '125A',
  ampere: 125, isThreePhase: true, colorValue: 0xFFE5484D, defaultSection: 35,
);
const kPpCee63 = PpConnector(
  id: 'cee63', label: 'CEE 63A 5P', shortLabel: '63A',
  ampere: 63, isThreePhase: true, colorValue: 0xFFE5484D, defaultSection: 16,
);
const kPpCee32 = PpConnector(
  id: 'cee32', label: 'CEE 32A 5P', shortLabel: '32A',
  ampere: 32, isThreePhase: true, colorValue: 0xFFE5484D, defaultSection: 6,
);
const kPpCee16 = PpConnector(
  id: 'cee16', label: 'CEE 16A 5P', shortLabel: '16A',
  ampere: 16, isThreePhase: true, colorValue: 0xFFE5484D, defaultSection: 2.5,
);
const kPpCee32Mono = PpConnector(
  id: 'cee32mono', label: 'CEE 32A 3P', shortLabel: '32A mono',
  ampere: 32, isThreePhase: false, colorValue: 0xFF2F80ED, defaultSection: 6,
);
const kPpCee16Mono = PpConnector(
  id: 'cee16mono', label: 'CEE 16A 3P', shortLabel: '16A mono',
  ampere: 16, isThreePhase: false, colorValue: 0xFF2F80ED, defaultSection: 2.5,
);
const kPpSchuko = PpConnector(
  id: 'schuko', label: 'Schuko 16A', shortLabel: 'Schuko',
  ampere: 16, isThreePhase: false, colorValue: 0xFF9E9E9E, defaultSection: 2.5,
);

const kPpSocapex = PpConnector(
  id: 'socapex', label: 'Socapex 19P', shortLabel: 'Socapex',
  ampere: 16, isThreePhase: true, circuits: 6,
  colorValue: 0xFFF2C94C, defaultSection: 2.5,
);
const kPpHarting16 = PpConnector(
  id: 'harting16', label: 'Harting 16P', shortLabel: 'Harting 16',
  ampere: 16, isThreePhase: true, circuits: 6,
  colorValue: 0xFFB794F4, defaultSection: 2.5,
);

const List<PpConnector> kPpBuiltinConnectors = [
  kPpPowerlock400, kPpCee125, kPpCee63, kPpCee32, kPpCee16,
  kPpCee32Mono, kPpCee16Mono, kPpSchuko, kPpSocapex, kPpHarting16,
];

/// Traductions d'une entrée du catalogue pour une langue donnée
/// (champ `i18n: {"en": {"name": "...", "note": "..."}}`). Cases vides ignorées.
Map<String, String> ppTranslations(Map<String, dynamic> m, String? lang) {
  final all = m['i18n'];
  if (lang == null || all is! Map) return const {};
  final t = all[lang];
  if (t is! Map) return const {};
  return {
    for (final e in t.entries)
      if ((e.value ?? '').toString().trim().isNotEmpty)
        e.key.toString(): e.value.toString().trim(),
  };
}

double _sectionFor(int amps) {
  if (amps > 250) return 150;
  if (amps > 125) return 95;
  if (amps > 63) return 35;
  if (amps > 32) return 16;
  if (amps > 16) return 6;
  return 2.5;
}

int _color(dynamic v, int fallback) {
  if (v is int) return v;
  var s = (v ?? '').toString().trim().replaceAll('#', '');
  if (s.isEmpty) return fallback;
  if (s.length == 6) s = 'FF$s';
  return int.tryParse(s, radix: 16) ?? fallback;
}

bool _b(dynamic v) {
  if (v is bool) return v;
  final s = (v ?? '').toString().trim().toLowerCase();
  return const ['oui', 'yes', 'true', '1', 'x'].contains(s);
}

const List<double> kPpSections = [
  1.5, 2.5, 4, 6, 10, 16, 25, 35, 50, 70, 95, 120, 150, 185, 240,
];

String ppFormatSection(double s) =>
    s == s.roundToDouble() ? s.toInt().toString() : s.toString();

/// Courant admissible d'un câble selon sa prise. Multi-circuits : câble
/// multiconducteur fortement chargé → coefficient de réduction 0,7.
double ppConnectorAmpacity(PpConnector c, double section) =>
    ppCableAmpacity(section, singleCore: c.isSingleCore) *
    (c.isMulti ? 0.7 : 1.0);

/// Courant admissible indicatif (A) — H07RN-F cuivre, air libre, 30 °C.
double ppCableAmpacity(double section, {required bool singleCore}) {
  final multi = <double, double>{
    1.5: 18, 2.5: 26, 4: 34, 6: 44, 10: 61, 16: 82, 25: 108, 35: 135,
    50: 168, 70: 207, 95: 250, 120: 292, 150: 335, 185: 382, 240: 453,
  };
  final single = <double, double>{
    1.5: 23, 2.5: 32, 4: 42, 6: 54, 10: 73, 16: 98, 25: 129, 35: 158,
    50: 198, 70: 245, 95: 292, 120: 344, 150: 400, 185: 459, 240: 543,
  };
  final table = singleCore ? single : multi;
  return table[section] ?? 0;
}

// ─── Catégories de charges ───────────────────────────────────────────────────

enum PpLoadCategory {
  lighting,
  sound,
  video,
  stage,
  catering,
  toilets,
  production,
  hvac,
  other;

  String get emoji => switch (this) {
        lighting => '💡',
        sound => '🔊',
        video => '📺',
        stage => '⚙️',
        catering => '🍔',
        toilets => '🚻',
        production => '💻',
        hvac => '❄️',
        other => '🔌',
      };

  int get colorValue => switch (this) {
        lighting => 0xFFFFB703,
        sound => 0xFF00E5FF,
        video => 0xFF00B4D8,
        stage => 0xFF2DC653,
        catering => 0xFFFF6B6B,
        toilets => 0xFF7B8CDE,
        production => 0xFFDA77FF,
        hvac => 0xFF4CC9F0,
        other => 0xFFB0BEC5,
      };

  /// cos φ typique de la catégorie.
  double get defaultCosPhi => switch (this) {
        lighting => 0.95,
        sound => 0.9,
        video => 0.95,
        stage => 0.8,
        catering => 1.0,
        toilets => 0.9,
        production => 0.9,
        hvac => 0.85,
        other => 0.9,
      };

  static PpLoadCategory fromKey(String? k) => PpLoadCategory.values
      .firstWhere((e) => e.name == k, orElse: () => PpLoadCategory.other);
}

// ─── Arbre ───────────────────────────────────────────────────────────────────

/// Ce qu'on branche au bout d'un départ : un tableau ou une charge.
sealed class PpNode {
  PpNode(this.id);
  final String id;
  String get name;

  Map<String, dynamic> toJson();

  static PpNode? fromJson(dynamic raw) {
    if (raw is! Map) return null;
    final m = Map<String, dynamic>.from(raw);
    return switch (m['type']) {
      'panel' => PpPanel.fromJson(m),
      'load' => PpLoad.fromJson(m),
      _ => null,
    };
  }

  /// Copie profonde avec de nouveaux identifiants (copier / coller).
  PpNode cloneFresh();
}

class PpLoad extends PpNode {
  PpLoad({
    required String id,
    required this.name,
    required this.powerW,
    required this.category,
    required this.cosPhi,
  }) : super(id);

  @override
  String name;
  double powerW;
  PpLoadCategory category;
  double cosPhi;

  @override
  Map<String, dynamic> toJson() => {
        'type': 'load',
        'id': id,
        'name': name,
        'powerW': powerW,
        'category': category.name,
        'cosPhi': cosPhi,
      };

  factory PpLoad.fromJson(Map<String, dynamic> m) => PpLoad(
        id: (m['id'] ?? ppMakeId()).toString(),
        name: (m['name'] ?? '').toString(),
        powerW: _d(m['powerW'], 0),
        category: PpLoadCategory.fromKey(m['category']?.toString()),
        cosPhi: _d(m['cosPhi'], 0.9).clamp(0.5, 1.0).toDouble(),
      );

  @override
  PpLoad cloneFresh() => PpLoad(
        id: ppMakeId(),
        name: name,
        powerW: powerW,
        category: category,
        cosPhi: cosPhi,
      );
}

class PpPanel extends PpNode {
  PpPanel({
    required String id,
    required this.name,
    required this.input,
    required this.mainBreakerA,
    required this.outputs,
    this.collapsed = false,
  }) : super(id);

  @override
  String name;
  PpConnector input;
  int mainBreakerA;
  List<PpOutput> outputs;
  bool collapsed;

  bool get isThreePhase => input.isThreePhase;

  /// Réattribue L1 → L2 → L3 aux départs mono (tableau triphasé).
  void autoAssignPhases() {
    var i = 0;
    for (final o in outputs) {
      if (!o.connector.isThreePhase) {
        o.phase = PpPhase.values[i % 3];
        i++;
      }
    }
  }

  @override
  Map<String, dynamic> toJson() => {
        'type': 'panel',
        'id': id,
        'name': name,
        'input': input.id,
        'inputSpec': input.toJson(),
        'mainBreakerA': mainBreakerA,
        'collapsed': collapsed,
        'outputs': outputs.map((o) => o.toJson()).toList(),
      };

  factory PpPanel.fromJson(Map<String, dynamic> m) => PpPanel(
        id: (m['id'] ?? ppMakeId()).toString(),
        name: (m['name'] ?? '').toString(),
        input: PpConnector.byId(m['input']?.toString(), spec: m['inputSpec']),
        mainBreakerA: _i(m['mainBreakerA'], 32),
        collapsed: m['collapsed'] == true,
        outputs: _outputs(m['outputs']),
      );

  @override
  PpPanel cloneFresh() => PpPanel(
        id: ppMakeId(),
        name: name,
        input: input,
        mainBreakerA: mainBreakerA,
        collapsed: collapsed,
        outputs: outputs.map((o) => o.cloneFresh()).toList(),
      );
}

/// Un départ (une prise) d'un tableau ou de la source, avec son câble et ce
/// qui est branché au bout.
class PpOutput {
  PpOutput({
    required this.id,
    required this.connector,
    required this.breakerA,
    this.phase = PpPhase.l1,
    this.rcd = false,
    this.cableLength = 10,
    double? cableSection,
    this.child,
  }) : cableSection = cableSection ?? connector.defaultSection;

  final String id;
  PpConnector connector;
  int breakerA;
  PpPhase phase;
  bool rcd;
  double cableLength;
  double cableSection;
  PpNode? child;

  factory PpOutput.fresh(PpConnector c, {PpPhase phase = PpPhase.l1}) =>
      PpOutput(
        id: ppMakeId(),
        connector: c,
        breakerA: c.ampere,
        phase: phase,
        rcd: c.ampere <= 32,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'connector': connector.id,
        'connectorSpec': connector.toJson(),
        'breakerA': breakerA,
        'phase': phase.name,
        'rcd': rcd,
        'cableLength': cableLength,
        'cableSection': cableSection,
        if (child != null) 'child': child!.toJson(),
      };

  factory PpOutput.fromJson(Map<String, dynamic> m) {
    final c = PpConnector.byId(m['connector']?.toString(),
        spec: m['connectorSpec']);
    return PpOutput(
      id: (m['id'] ?? ppMakeId()).toString(),
      connector: c,
      breakerA: _i(m['breakerA'], c.ampere),
      phase: PpPhase.fromKey(m['phase']?.toString()),
      rcd: m['rcd'] == true,
      cableLength: _d(m['cableLength'], 10),
      cableSection: _d(m['cableSection'], c.defaultSection),
      child: PpNode.fromJson(m['child']),
    );
  }

  PpOutput cloneFresh() => PpOutput(
        id: ppMakeId(),
        connector: connector,
        breakerA: breakerA,
        phase: phase,
        rcd: rcd,
        cableLength: cableLength,
        cableSection: cableSection,
        child: child?.cloneFresh(),
      );
}

// ─── Source ──────────────────────────────────────────────────────────────────

enum PpSourceKind { generator, mains, outlet }

const List<int> kPpGeneratorSizes = [
  10, 20, 30, 45, 60, 80, 100, 150, 200, 250, 300, 400, 500, 630, 800, 1000,
];
const List<int> kPpMainsSizes = [32, 63, 125, 160, 250, 400, 630];

class PpSource {
  PpSource({
    required this.kind,
    required this.name,
    this.kva = 100,
    this.amps = 125,
    this.outletConnector = kPpCee63,
    required this.outputs,
  });

  PpSourceKind kind;
  String name;
  int kva; // groupe
  int amps; // réseau
  PpConnector outletConnector; // prise existante
  List<PpOutput> outputs;

  bool get isThreePhase =>
      kind == PpSourceKind.outlet ? outletConnector.isThreePhase : true;

  /// Courant disponible par phase.
  double get capacityAmps => switch (kind) {
        PpSourceKind.generator => kva * 1000 / (math.sqrt(3) * kPpVoltLine),
        PpSourceKind.mains => amps.toDouble(),
        PpSourceKind.outlet => outletConnector.ampere.toDouble(),
      };

  /// Puissance apparente disponible (kVA).
  double get capacityKva => switch (kind) {
        PpSourceKind.generator => kva.toDouble(),
        _ => isThreePhase
            ? math.sqrt(3) * kPpVoltLine * capacityAmps / 1000
            : kPpVoltPhase * capacityAmps / 1000,
      };

  /// Remet un départ par défaut adapté à la capacité de la source.
  void resetOutputs() {
    final keepChild = outputs.isNotEmpty ? outputs.first.child : null;
    final c = kind == PpSourceKind.outlet
        ? outletConnector
        : PpConnector.forAmps(capacityAmps);
    final o = PpOutput.fresh(c);
    o.breakerA = math.min(c.ampere, capacityAmps.floor());
    o.rcd = false;
    o.child = keepChild;
    outputs = [o, ...outputs.skip(1)];
  }

  Map<String, dynamic> toJson() => {
        'kind': kind.name,
        'name': name,
        'kva': kva,
        'amps': amps,
        'outletConnector': outletConnector.id,
        'outletSpec': outletConnector.toJson(),
        'outputs': outputs.map((o) => o.toJson()).toList(),
      };

  factory PpSource.fromJson(Map<String, dynamic> m) => PpSource(
        kind: PpSourceKind.values.firstWhere((e) => e.name == m['kind'],
            orElse: () => PpSourceKind.generator),
        name: (m['name'] ?? '').toString(),
        kva: _i(m['kva'], 100),
        amps: _i(m['amps'], 125),
        outletConnector: PpConnector.byId(m['outletConnector']?.toString(),
            spec: m['outletSpec']),
        outputs: _outputs(m['outputs']),
      );
}

// ─── Projet ──────────────────────────────────────────────────────────────────

class PpPlan {
  PpPlan({
    required this.id,
    required this.name,
    this.source,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  final String id;
  String name;
  PpSource? source;
  DateTime updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'updatedAt': updatedAt.toIso8601String(),
        if (source != null) 'source': source!.toJson(),
      };

  factory PpPlan.fromJson(Map<String, dynamic> m) => PpPlan(
        id: (m['id'] ?? ppMakeId()).toString(),
        name: (m['name'] ?? '').toString(),
        updatedAt: DateTime.tryParse((m['updatedAt'] ?? '').toString()),
        source: m['source'] is Map
            ? PpSource.fromJson(Map<String, dynamic>.from(m['source']))
            : null,
      );

  /// Parcourt tous les tableaux (ordre d'affichage).
  List<PpPanel> get allPanels {
    final out = <PpPanel>[];
    void walk(List<PpOutput> outputs) {
      for (final o in outputs) {
        final c = o.child;
        if (c is PpPanel) {
          out.add(c);
          walk(c.outputs);
        }
      }
    }

    if (source != null) walk(source!.outputs);
    return out;
  }

  List<PpLoad> get allLoads {
    final out = <PpLoad>[];
    void walk(List<PpOutput> outputs) {
      for (final o in outputs) {
        final c = o.child;
        if (c is PpLoad) out.add(c);
        if (c is PpPanel) walk(c.outputs);
      }
    }

    if (source != null) walk(source!.outputs);
    return out;
  }
}

// ─── Modèles de tableaux ─────────────────────────────────────────────────────

class PpPanelTemplate {
  const PpPanelTemplate({
    required this.key,
    required this.input,
    required this.mainBreakerA,
    required this.outputs,
    this.name,
    this.note = '',
  });

  final String key;
  final String note;

  /// null → nom traduit (multiprise, tableau personnalisé).
  final String? name;
  final PpConnector input;
  final int mainBreakerA;
  final List<(PpConnector, int)> outputs;

  bool get isCustom => key.startsWith('custom');

  String get outputsSummary => outputs.isEmpty
      ? '—'
      : outputs.map((e) => '${e.$2}× ${e.$1.shortLabel}').join(' · ');

  PpPanel build(String resolvedName) {
    final p = PpPanel(
      id: ppMakeId(),
      name: resolvedName,
      input: input,
      mainBreakerA: mainBreakerA,
      outputs: [
        for (final (c, n) in outputs)
          for (var i = 0; i < n; i++) PpOutput.fresh(c),
      ],
    );
    p.autoAssignPhases();
    return p;
  }
}

/// Modèles de base (hors ligne). Le catalogue en ligne les remplace.
const List<PpPanelTemplate> kPpBuiltinTemplates = [
  PpPanelTemplate(
    key: 'd400',
    name: 'Distro 400A',
    input: kPpPowerlock400,
    mainBreakerA: 400,
    outputs: [(kPpCee125, 3), (kPpCee63, 2)],
  ),
  PpPanelTemplate(
    key: 'd250',
    name: 'Distro 250A',
    input: kPpPowerlock400,
    mainBreakerA: 250,
    outputs: [(kPpCee125, 1), (kPpCee63, 2), (kPpCee32, 2)],
  ),
  PpPanelTemplate(
    key: 'd125',
    name: 'Distro 125A',
    input: kPpCee125,
    mainBreakerA: 125,
    outputs: [(kPpCee63, 1), (kPpCee32, 3), (kPpSchuko, 6)],
  ),
  PpPanelTemplate(
    key: 'd63',
    name: 'Distro 63A',
    input: kPpCee63,
    mainBreakerA: 63,
    outputs: [(kPpCee32, 2), (kPpCee16, 1), (kPpSchuko, 6)],
  ),
  PpPanelTemplate(
    key: 'd32',
    name: 'Distro 32A',
    input: kPpCee32,
    mainBreakerA: 32,
    outputs: [(kPpCee16, 1), (kPpSchuko, 6)],
  ),
  PpPanelTemplate(
    key: 'd16',
    name: 'Distro 16A',
    input: kPpCee16,
    mainBreakerA: 16,
    outputs: [(kPpSchuko, 6)],
  ),
  PpPanelTemplate(
    key: 'm32',
    name: 'Distro 32A mono',
    input: kPpCee32Mono,
    mainBreakerA: 32,
    outputs: [(kPpCee16Mono, 1), (kPpSchuko, 6)],
  ),
  PpPanelTemplate(
    key: 'strip',
    input: kPpSchuko,
    mainBreakerA: 16,
    outputs: [(kPpSchuko, 6)],
  ),
];

/// Tableaux vides, toujours proposés en fin de liste.
const List<PpPanelTemplate> kPpCustomTemplates = [
  PpPanelTemplate(
    key: 'custom3',
    input: kPpCee32,
    mainBreakerA: 32,
    outputs: [],
  ),
  PpPanelTemplate(
    key: 'custom1',
    input: kPpCee16Mono,
    mainBreakerA: 16,
    outputs: [],
  ),
];

/// Catalogue électricité : connecteurs + modèles de tableaux.
class PpCatalog {
  const PpCatalog({
    required this.connectors,
    required this.templates,
    this.updatedAt,
  });

  final List<PpConnector> connectors;
  final List<PpPanelTemplate> templates;
  final DateTime? updatedAt;

  static const PpCatalog builtIn = PpCatalog(
    connectors: kPpBuiltinConnectors,
    templates: kPpBuiltinTemplates,
  );

  /// Catalogue utilisé par l'outil (mis à jour au chargement).
  static PpCatalog current = builtIn;

  List<PpPanelTemplate> get allTemplates => [...templates, ...kPpCustomTemplates];

  /// Format attendu (electricity.json) :
  /// { connectors: [{id, label, short, amps, phases, singleCore, color, section}],
  ///   distros: [{id, name, input, mainBreaker, note,
  ///              outputs: [{connector, count}]}] }
  static PpCatalog? fromJson(Map<String, dynamic> json, {String? lang}) {
    final connectors = <PpConnector>[];
    final rawC = json['connectors'];
    if (rawC is List) {
      for (final r in rawC) {
        final c = PpConnector.fromJson(r, lang: lang);
        if (c != null && !connectors.contains(c)) connectors.add(c);
      }
    }
    if (connectors.isEmpty) return null;

    PpConnector? find(dynamic id) {
      final k = (id ?? '').toString().trim();
      for (final c in connectors) {
        if (c.id == k) return c;
      }
      return null;
    }

    final templates = <PpPanelTemplate>[];
    final rawD = json['distros'];
    if (rawD is List) {
      for (final r in rawD.whereType<Map>()) {
        final m = Map<String, dynamic>.from(r);
        final tr = ppTranslations(m, lang);
        final name = (tr['name'] ?? m['name'] ?? '').toString().trim();
        final input = find(m['input']);
        if (name.isEmpty || input == null) continue;
        final outs = <(PpConnector, int)>[];
        final rawO = m['outputs'];
        if (rawO is List) {
          for (final o in rawO.whereType<Map>()) {
            final c = find(o['connector']);
            final n = _i(o['count'], 0);
            if (c != null && n > 0) outs.add((c, n));
          }
        }
        final main = _i(m['mainBreaker'], 0);
        templates.add(PpPanelTemplate(
          key: (m['id'] ?? name).toString(),
          name: name,
          input: input,
          mainBreakerA: main > 0 ? main : input.ampere,
          outputs: outs,
          note: (tr['note'] ?? m['note'] ?? '').toString().trim(),
        ));
      }
    }

    return PpCatalog(
      connectors: connectors,
      templates: templates.isEmpty ? kPpBuiltinTemplates : templates,
      updatedAt: DateTime.tryParse((json['updatedAt'] ?? '').toString()),
    );
  }
}

// ─── Calculs ─────────────────────────────────────────────────────────────────

class PpCurrents {
  double l1 = 0, l2 = 0, l3 = 0;
  double watts = 0;
  double va = 0;

  void addPhase(PpPhase p, double amps) {
    switch (p) {
      case PpPhase.l1:
        l1 += amps;
      case PpPhase.l2:
        l2 += amps;
      case PpPhase.l3:
        l3 += amps;
    }
  }

  void add(PpCurrents o) {
    l1 += o.l1;
    l2 += o.l2;
    l3 += o.l3;
    watts += o.watts;
    va += o.va;
  }

  double of(PpPhase p) => switch (p) {
        PpPhase.l1 => l1,
        PpPhase.l2 => l2,
        PpPhase.l3 => l3,
      };

  double get max => math.max(l1, math.max(l2, l3));
  double get min => math.min(l1, math.min(l2, l3));

  /// Déséquilibre (max − min) / max, en %.
  double get imbalancePercent => max <= 0 ? 0 : (max - min) / max * 100;
}

enum PpAlertLevel { info, warning, error }

enum PpAlertKind {
  noSource,
  sourceOverload,
  sourceNearLimit,
  panelOverload,
  outputOverload,
  outputNearLimit,
  cableUndersized,
  voltageDrop,
  imbalance,
  adapter,
}

class PpAlert {
  const PpAlert({
    required this.level,
    required this.kind,
    required this.targetId,
    required this.where,
    this.value = 0,
    this.limit = 0,
    this.extra = '',
  });

  final PpAlertLevel level;
  final PpAlertKind kind;

  /// Id du départ ou du tableau concerné.
  final String targetId;

  /// Emplacement lisible (« Distro 63A › 32A #2 »).
  final String where;
  final double value;
  final double limit;
  final String extra;
}

/// Une ligne du tableau de charge (un départ).
class PpLoadRow {
  PpLoadRow({
    required this.ownerName,
    required this.output,
    required this.index,
    required this.phase,
    required this.currents,
    required this.dropPercent,
    required this.ampacity,
  });

  final String ownerName;
  final PpOutput output;
  final int index; // 1-based dans le tableau
  final PpPhase? phase; // null = triphasé
  final PpCurrents currents;
  final double dropPercent; // cumulé au bout du câble
  final double ampacity;

  String get outputLabel => '${output.connector.shortLabel} #$index';
}

class PpCalc {
  PpCalc._(this.plan);

  final PpPlan plan;

  final Map<String, PpCurrents> outputCurrents = {};
  final Map<String, PpCurrents> panelCurrents = {};
  final Map<String, double> outputDrop = {}; // % cumulé au bout du câble
  final Map<String, double> segmentDrop = {}; // % du seul câble
  final Map<String, PpPhase?> outputPhase = {}; // null = tri
  final Map<String, int> outputIndex = {};
  final Map<String, double> panelDropIn = {}; // % à l'arrivée du tableau
  final List<PpLoadRow> rows = [];
  final List<PpAlert> alerts = [];
  final Map<PpLoadCategory, double> categoryWatts = {};
  PpCurrents sourceCurrents = PpCurrents();

  int get errorCount =>
      alerts.where((a) => a.level == PpAlertLevel.error).length;
  int get warningCount =>
      alerts.where((a) => a.level == PpAlertLevel.warning).length;

  double get worstDrop =>
      outputDrop.values.fold(0.0, (a, b) => math.max(a, b));

  double get sourceLoadRatio {
    final s = plan.source;
    if (s == null || s.capacityAmps <= 0) return 0;
    return sourceCurrents.max / s.capacityAmps;
  }

  /// kVA de groupe conseillé : phase la plus chargée × 3, + 20 % de marge,
  /// arrondi à la taille standard supérieure.
  int? get recommendedGeneratorKva {
    final imax = sourceCurrents.max;
    if (imax <= 0) return null;
    final needed = 3 * kPpVoltPhase * imax / 1000 * 1.2;
    for (final k in kPpGeneratorSizes) {
      if (k >= needed) return k;
    }
    return kPpGeneratorSizes.last;
  }

  List<PpAlert> alertsFor(String id) =>
      alerts.where((a) => a.targetId == id).toList();

  PpAlertLevel? worstLevelFor(String id) {
    PpAlertLevel? worst;
    for (final a in alerts) {
      if (a.targetId != id) continue;
      if (worst == null || a.level.index > worst.index) worst = a.level;
    }
    return worst;
  }

  static PpCalc run(PpPlan plan) {
    final c = PpCalc._(plan);
    c._compute();
    return c;
  }

  void _compute() {
    final s = plan.source;
    if (s == null) {
      alerts.add(const PpAlert(
        level: PpAlertLevel.info,
        kind: PpAlertKind.noSource,
        targetId: '',
        where: '',
      ));
      return;
    }
    final feed = s.isThreePhase ? null : PpPhase.l1;
    final total = PpCurrents();
    final name = s.name;
    _indexOutputs(s.outputs);
    for (final o in s.outputs) {
      total.add(_output(o, ownerName: name, feedPhase: feed, dropIn: 0));
    }
    sourceCurrents = total;

    final cap = s.capacityAmps;
    if (total.max > cap) {
      alerts.add(PpAlert(
        level: PpAlertLevel.error,
        kind: PpAlertKind.sourceOverload,
        targetId: 'source',
        where: name,
        value: total.max,
        limit: cap,
      ));
    } else if (total.max > cap * kPpWarnRatio) {
      alerts.add(PpAlert(
        level: PpAlertLevel.warning,
        kind: PpAlertKind.sourceNearLimit,
        targetId: 'source',
        where: name,
        value: total.max,
        limit: cap,
      ));
    }
    if (s.isThreePhase) _checkImbalance('source', name, total);
  }

  void _indexOutputs(List<PpOutput> outputs) {
    final counters = <PpConnector, int>{};
    for (final o in outputs) {
      final n = (counters[o.connector] ?? 0) + 1;
      counters[o.connector] = n;
      outputIndex[o.id] = n;
    }
  }

  String _outLabel(PpOutput o) =>
      '${o.connector.shortLabel} #${outputIndex[o.id] ?? 1}';

  PpCurrents _output(
    PpOutput o, {
    required String ownerName,
    required PpPhase? feedPhase,
    required double dropIn,
  }) {
    // Phase effective du départ.
    final PpPhase? phase = o.connector.isThreePhase
        ? feedPhase // tri (null) — ou incohérent sur une source mono
        : (feedPhase ?? o.phase);
    outputPhase[o.id] = phase;

    final cur = PpCurrents();
    final child = o.child;
    double childDropIn = dropIn;

    // Courant traversant le câble : calculé d'abord sur la charge seule
    // pour connaître la chute de tension avant de descendre.
    if (child is PpLoad) {
      _addLoad(cur, child, phase);
    } else if (child is PpPanel) {
      // Pré-calcul du courant du tableau pour la chute de tension.
      final pre = _panelCurrentsOnly(child, phase);
      final drop = _segmentDrop(o, pre, phase);
      segmentDrop[o.id] = drop;
      childDropIn = dropIn + drop;
      panelDropIn[child.id] = childDropIn;
      cur.add(_panel(child, feedPhase: phase, dropIn: childDropIn));
    }

    if (child is PpLoad || child == null) {
      final drop = _segmentDrop(o, cur, phase);
      segmentDrop[o.id] = drop;
      childDropIn = dropIn + drop;
    }
    outputCurrents[o.id] = cur;
    outputDrop[o.id] = childDropIn;

    final where = '$ownerName › ${_outLabel(o)}';
    final amp = ppConnectorAmpacity(o.connector, o.cableSection);
    final limitA = o.connector.phaseLimit(o.breakerA);

    rows.add(PpLoadRow(
      ownerName: ownerName,
      output: o,
      index: outputIndex[o.id] ?? 1,
      phase: phase,
      currents: cur,
      dropPercent: childDropIn,
      ampacity: amp,
    ));

    if (child == null) return cur;

    // Surcharge du départ.
    if (cur.max > limitA) {
      alerts.add(PpAlert(
        level: PpAlertLevel.error,
        kind: PpAlertKind.outputOverload,
        targetId: o.id,
        where: where,
        value: cur.max,
        limit: limitA,
      ));
    } else if (cur.max > limitA * kPpWarnRatio) {
      alerts.add(PpAlert(
        level: PpAlertLevel.warning,
        kind: PpAlertKind.outputNearLimit,
        targetId: o.id,
        where: where,
        value: cur.max,
        limit: limitA,
      ));
    }

    // Câble protégé par un disjoncteur plus gros que ce qu'il supporte.
    if (amp > 0 && amp < o.breakerA) {
      alerts.add(PpAlert(
        level: PpAlertLevel.warning,
        kind: PpAlertKind.cableUndersized,
        targetId: o.id,
        where: where,
        value: amp,
        limit: o.breakerA.toDouble(),
        extra: o.connector.cableName(o.cableSection),
      ));
    }

    if (childDropIn > kPpMaxDropPercent) {
      alerts.add(PpAlert(
        level: PpAlertLevel.warning,
        kind: PpAlertKind.voltageDrop,
        targetId: o.id,
        where: where,
        value: childDropIn,
        limit: kPpMaxDropPercent,
      ));
    }

    if (child is PpPanel && child.input != o.connector) {
      alerts.add(PpAlert(
        level: PpAlertLevel.info,
        kind: PpAlertKind.adapter,
        targetId: o.id,
        where: '$where → ${child.name}',
        extra: '${o.connector.label} → ${child.input.label}',
      ));
    }
    return cur;
  }

  PpCurrents _panel(PpPanel p,
      {required PpPhase? feedPhase, required double dropIn}) {
    final cur = PpCurrents();
    _indexOutputs(p.outputs);
    for (final o in p.outputs) {
      cur.add(_output(o, ownerName: p.name, feedPhase: feedPhase, dropIn: dropIn));
    }
    panelCurrents[p.id] = cur;

    if (cur.max > p.mainBreakerA) {
      alerts.add(PpAlert(
        level: PpAlertLevel.error,
        kind: PpAlertKind.panelOverload,
        targetId: p.id,
        where: p.name,
        value: cur.max,
        limit: p.mainBreakerA.toDouble(),
      ));
    }
    if (feedPhase == null) _checkImbalance(p.id, p.name, cur);
    return cur;
  }

  /// Courant d'un tableau sans enregistrer d'alerte ni de ligne.
  PpCurrents _panelCurrentsOnly(PpPanel p, PpPhase? feedPhase) {
    final cur = PpCurrents();
    for (final o in p.outputs) {
      final PpPhase? ph = o.connector.isThreePhase
          ? feedPhase
          : (feedPhase ?? o.phase);
      final c = o.child;
      if (c is PpLoad) {
        _addLoad(cur, c, ph, record: false);
      } else if (c is PpPanel) {
        cur.add(_panelCurrentsOnly(c, ph));
      }
    }
    return cur;
  }

  void _addLoad(PpCurrents cur, PpLoad l, PpPhase? phase,
      {bool record = true}) {
    final w = l.powerW;
    if (w <= 0) return;
    final cos = l.cosPhi <= 0 ? 0.9 : l.cosPhi;
    cur.watts += w;
    cur.va += w / cos;
    if (phase == null) {
      final perPhase = w / (3 * kPpVoltPhase * cos);
      for (final p in PpPhase.values) {
        cur.addPhase(p, perPhase);
      }
    } else {
      cur.addPhase(phase, w / (kPpVoltPhase * cos));
    }
    if (record) {
      categoryWatts[l.category] = (categoryWatts[l.category] ?? 0) + w;
    }
  }

  /// Chute de tension du seul câble du départ (%).
  double _segmentDrop(PpOutput o, PpCurrents cur, PpPhase? phase) {
    if (o.cableSection <= 0 || o.cableLength <= 0) return 0;
    final cos = cur.va > 0 ? (cur.watts / cur.va).clamp(0.5, 1.0) : 0.9;
    if (phase == null && o.connector.isMulti) {
      // Multi : chaque circuit est un aller-retour mono.
      final perCircuit = cur.max / math.max(1.0, o.connector.circuits / 3);
      final du = 2 * perCircuit * o.cableLength * kPpCopperRho * cos /
          o.cableSection;
      return du / kPpVoltPhase * 100;
    }
    if (phase == null) {
      final i = cur.max;
      final du = math.sqrt(3) * i * o.cableLength * kPpCopperRho * cos /
          o.cableSection;
      return du / kPpVoltLine * 100;
    }
    final i = cur.of(phase);
    final du = 2 * i * o.cableLength * kPpCopperRho * cos / o.cableSection;
    return du / kPpVoltPhase * 100;
  }

  void _checkImbalance(String id, String where, PpCurrents cur) {
    if (cur.max < 10) return; // négligeable
    final pct = cur.imbalancePercent;
    if (pct > 25) {
      alerts.add(PpAlert(
        level: PpAlertLevel.info,
        kind: PpAlertKind.imbalance,
        targetId: id,
        where: where,
        value: pct,
      ));
    }
  }
}

// ─── Format ──────────────────────────────────────────────────────────────────

String ppFormatKw(double watts) {
  final kw = watts / 1000;
  if (kw >= 100) return kw.toStringAsFixed(0);
  if (kw >= 10) return kw.toStringAsFixed(1);
  return kw.toStringAsFixed(2);
}

String ppFormatAmps(double a) =>
    a >= 100 ? a.toStringAsFixed(0) : a.toStringAsFixed(1);

String ppFormatLength(double m) =>
    m == m.roundToDouble() ? m.toInt().toString() : m.toStringAsFixed(1);

// ─── Helpers ─────────────────────────────────────────────────────────────────

List<PpOutput> _outputs(dynamic raw) => raw is List
    ? raw
        .whereType<Map>()
        .map((m) => PpOutput.fromJson(Map<String, dynamic>.from(m)))
        .toList()
    : <PpOutput>[];

int _i(dynamic v, int fallback) {
  if (v is int) return v;
  if (v is num) return v.toInt();
  return int.tryParse(v?.toString() ?? '') ?? fallback;
}

double _d(dynamic v, double fallback) {
  if (v is num) return v.toDouble();
  return double.tryParse((v?.toString() ?? '').replaceAll(',', '.')) ??
      fallback;
}
