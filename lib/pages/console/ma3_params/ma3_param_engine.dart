import 'dart:convert';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:xml/xml.dart';

/// ─────────────────────────────────────────────────────────────────────────────
/// Calculateur de paramètres grandMA3 — moteur (sans UI).
///
/// Règle de comptage MA3 (help.malighting.com → System → Parameters) :
///   • 1 paramètre = 1 attribut piloté = 1 canal DMX "coarse" ;
///   • les canaux fine (16/24 bits) sont gratuits ;
///   • les canaux virtuels (Offset="None" dans le GDTF, ex. dimmer virtuel)
///     ne comptent pas pour la licence.
/// Dans un GDTF, ça revient à compter les éléments DMXChannel qui ont une adresse
/// (Offset), en dépliant les géométries multi-instance (GeometryReference :
/// pixels, cellules…) qui ne sont décrites qu'une fois dans le mode.
///
/// Le résultat n'est donc JAMAIS meilleur que les GDTF : chaque analyse
/// remonte une liste de [Ma3Issue] pour signaler ce qui paraît douteux.
/// ─────────────────────────────────────────────────────────────────────────────

// ═════════════════════════════════════════════════════════════════════════════
// Matériel grandMA3 (valeurs doc MA grandMA3 v2.3 — à tenir à jour ici SEUL)
// ═════════════════════════════════════════════════════════════════════════════

/// Plafond absolu de paramètres dans une session grandMA3 (consoles + PU).
const int kMa3SessionMaxParams = 262144;

/// Plafond d'un système onPC, quel que soit le matériel onPC ajouté.
const int kMa3OnPcMaxParams = 4096;

enum Ma3System {
  onPc(4096),
  compact(4096),
  compactXt(8192),
  light(16384),
  fullSize(20480);

  const Ma3System(this.params);

  /// Paramètres apportés par le poste principal (pour onPC : avec au moins
  /// un matériel onPC — command wing, fader wing, node 4k, rack-unit…).
  final int params;

  String get displayName {
    switch (this) {
      case Ma3System.onPc:
        return 'grandMA3 onPC';
      case Ma3System.compact:
        return 'grandMA3 compact';
      case Ma3System.compactXt:
        return 'grandMA3 compact XT';
      case Ma3System.light:
        return 'grandMA3 light';
      case Ma3System.fullSize:
        return 'grandMA3 full-size';
    }
  }

  String get shortName {
    switch (this) {
      case Ma3System.onPc:
        return 'onPC';
      case Ma3System.compact:
        return 'compact';
      case Ma3System.compactXt:
        return 'compact XT';
      case Ma3System.light:
        return 'light';
      case Ma3System.fullSize:
        return 'full-size';
    }
  }
}

enum Ma3ProcessingUnit {
  m(4096, 'PU M'),
  l(8192, 'PU L'),
  xl(16384, 'PU XL');

  const Ma3ProcessingUnit(this.params, this.label);
  final int params;
  final String label;
}

class Ma3Recommendation {
  const Ma3Recommendation({
    required this.system,
    required this.rawParams,
    required this.neededParams,
    required this.processingUnits,
    required this.capacity,
    required this.exceedsOnPc,
    required this.exceedsSessionMax,
  });

  final Ma3System system;

  /// Paramètres calculés (sans marge).
  final int rawParams;

  /// Paramètres calculés + marge de sécurité.
  final int neededParams;

  /// PU à ajouter (vide = le poste principal suffit).
  final List<Ma3ProcessingUnit> processingUnits;

  /// Capacité totale du système recommandé.
  final int capacity;

  /// onPC choisi mais besoin > 4 096 : il faut passer sur une console.
  final bool exceedsOnPc;

  /// Besoin > 262 144 : au-delà de ce que grandMA3 sait gérer en session.
  final bool exceedsSessionMax;

  bool get baseIsEnough =>
      processingUnits.isEmpty && !exceedsOnPc && !exceedsSessionMax;

  double get usageRatio =>
      capacity <= 0 ? 0 : (neededParams / capacity).clamp(0.0, 1.0);

  /// "2 × PU XL + 1 × PU M"
  String get processingUnitsLabel {
    final counts = <Ma3ProcessingUnit, int>{};
    for (final pu in processingUnits) {
      counts[pu] = (counts[pu] ?? 0) + 1;
    }
    final order = [
      Ma3ProcessingUnit.xl,
      Ma3ProcessingUnit.l,
      Ma3ProcessingUnit.m,
    ];
    return order
        .where((pu) => counts.containsKey(pu))
        .map((pu) => '${counts[pu]} × ${pu.label}')
        .join(' + ');
  }

  /// Nombre de PU si on ne prend QUE des XL (alternative simple à afficher).
  int get xlOnlyCount {
    final deficit = neededParams - system.params;
    if (deficit <= 0) {
      return 0;
    }
    return (deficit / Ma3ProcessingUnit.xl.params).ceil();
  }
}

/// Calcule la configuration conseillée pour [rawParams] paramètres.
///
/// Stratégie volontairement lisible : le moins de boîtiers possible (PU XL
/// d'abord), puis la plus petite PU qui couvre le reste.
Ma3Recommendation recommendMa3({
  required Ma3System system,
  required int rawParams,
  double marginRatio = 0.10,
}) {
  // -1e-6 : évite qu'un arrondi flottant (40000 × 1.1 = 44000.000…01)
  // ne rajoute un paramètre fantôme.
  final needed = math.max(0, (rawParams * (1 + marginRatio) - 1e-6).ceil());

  if (system == Ma3System.onPc) {
    return Ma3Recommendation(
      system: system,
      rawParams: rawParams,
      neededParams: needed,
      processingUnits: const [],
      capacity: kMa3OnPcMaxParams,
      exceedsOnPc: needed > kMa3OnPcMaxParams,
      exceedsSessionMax: needed > kMa3SessionMaxParams,
    );
  }

  final pus = <Ma3ProcessingUnit>[];
  final deficit = needed - system.params;
  if (deficit > 0) {
    final fullXl = deficit ~/ Ma3ProcessingUnit.xl.params;
    for (var i = 0; i < fullXl; i++) {
      pus.add(Ma3ProcessingUnit.xl);
    }
    final rest = deficit - fullXl * Ma3ProcessingUnit.xl.params;
    if (rest > 0) {
      if (rest <= Ma3ProcessingUnit.m.params) {
        pus.add(Ma3ProcessingUnit.m);
      } else if (rest <= Ma3ProcessingUnit.l.params) {
        pus.add(Ma3ProcessingUnit.l);
      } else {
        pus.add(Ma3ProcessingUnit.xl);
      }
    }
  }

  final capacity = math.min(
    kMa3SessionMaxParams,
    system.params + pus.fold<int>(0, (s, pu) => s + pu.params),
  );

  return Ma3Recommendation(
    system: system,
    rawParams: rawParams,
    neededParams: needed,
    processingUnits: pus,
    capacity: capacity,
    exceedsOnPc: false,
    exceedsSessionMax: needed > kMa3SessionMaxParams,
  );
}

// ═════════════════════════════════════════════════════════════════════════════
// Contrôles qualité GDTF
// ═════════════════════════════════════════════════════════════════════════════

enum Ma3IssueSeverity { info, warning, error }

enum Ma3IssueKind {
  /// Le MVR référence un GDTF qui n'est pas embarqué dans le fichier.
  gdtfMissing,

  /// Le GDTF est illisible (zip ou description.xml corrompu).
  unreadable,

  /// Aucun mode DMX demandé dans le MVR et le GDTF en a plusieurs.
  modeMissing,

  /// Le mode demandé n'existe pas dans le GDTF.
  modeNotFound,

  /// Pas de mode dans le MVR, mais le GDTF n'en a qu'un : on l'a pris.
  modeGuessedSingle,

  /// Le mode a été trouvé par correspondance partielle du nom.
  modePartialMatch,

  /// Mode sans aucun canal DMX adressé.
  noChannels,

  /// Canaux sans fonction ni attribut (GDTF probablement incomplet).
  channelsWithoutFunction,

  /// Plusieurs canaux sur la même adresse DMX (GDTF incohérent).
  overlappingOffsets,

  /// Trous dans les adresses DMX du mode (canaux manquants ?).
  offsetGaps,

  /// Le nom du mode annonce N canaux, le GDTF en décrit un autre nombre.
  modeNameMismatch,

  /// Canaux rattachés à une géométrie inexistante.
  unknownGeometry,

  /// Valeur saisie ou corrigée à la main par l'utilisateur.
  manualValue,
}

class Ma3Issue {
  const Ma3Issue(this.kind, {this.a, this.b, this.text, this.text2});

  final Ma3IssueKind kind;

  /// Arguments numériques éventuels (nombre de canaux, etc.).
  final int? a;
  final int? b;

  /// Argument texte éventuel (nom du mode, liste de modes…).
  final String? text;

  /// Second argument texte (ex. liste des modes disponibles).
  final String? text2;

  Ma3IssueSeverity get severity {
    switch (kind) {
      case Ma3IssueKind.gdtfMissing:
      case Ma3IssueKind.unreadable:
      case Ma3IssueKind.modeMissing:
      case Ma3IssueKind.modeNotFound:
      case Ma3IssueKind.noChannels:
        return Ma3IssueSeverity.error;
      case Ma3IssueKind.channelsWithoutFunction:
      case Ma3IssueKind.overlappingOffsets:
      case Ma3IssueKind.offsetGaps:
      case Ma3IssueKind.modeNameMismatch:
      case Ma3IssueKind.unknownGeometry:
      case Ma3IssueKind.modeGuessedSingle:
        return Ma3IssueSeverity.warning;
      case Ma3IssueKind.modePartialMatch:
      case Ma3IssueKind.manualValue:
        return Ma3IssueSeverity.info;
    }
  }

  Map<String, dynamic> toJson() => {
        'k': kind.name,
        if (a != null) 'a': a,
        if (b != null) 'b': b,
        if (text != null) 't': text,
        if (text2 != null) 't2': text2,
      };

  static Ma3Issue? fromJson(Map<String, dynamic> json) {
    final name = json['k'] as String?;
    final kind = Ma3IssueKind.values.where((k) => k.name == name);
    if (kind.isEmpty) {
      return null;
    }
    return Ma3Issue(
      kind.first,
      a: (json['a'] as num?)?.toInt(),
      b: (json['b'] as num?)?.toInt(),
      text: json['t'] as String?,
      text2: json['t2'] as String?,
    );
  }
}

Ma3IssueSeverity worstSeverity(Iterable<Ma3Issue> issues) {
  var worst = Ma3IssueSeverity.info;
  for (final i in issues) {
    if (i.severity.index > worst.index) {
      worst = i.severity;
    }
  }
  return worst;
}

// ═════════════════════════════════════════════════════════════════════════════
// Analyse d'un GDTF
// ═════════════════════════════════════════════════════════════════════════════

class Ma3ModeAnalysis {
  const Ma3ModeAnalysis({
    required this.fixtureLabel,
    required this.availableModes,
    required this.issues,
    this.modeUsed,
    this.params,
    this.footprint,
    this.virtualChannels = 0,
    this.instances = 1,
  });

  /// "Fabricant Modèle" lu dans le GDTF (vide si illisible).
  final String fixtureLabel;

  final List<String> availableModes;
  final String? modeUsed;

  /// Paramètres MA3 (canaux coarse) pour UNE machine. Null = inconnu.
  final int? params;

  /// Empreinte DMX (tous canaux, fine compris) pour UNE machine.
  final int? footprint;

  /// Canaux virtuels (non comptés) — pour info.
  final int virtualChannels;

  /// Nombre d'instances (pixels/cellules) détectées via GeometryReference.
  final int instances;

  final List<Ma3Issue> issues;
}

/// Résumé d'un mode pour le sélecteur ("Extended — 18 param. / 21 ch").
class Ma3ModeSummary {
  const Ma3ModeSummary(this.name, this.params, this.footprint);
  final String name;
  final int? params;
  final int? footprint;
}

class Ma3GdtfAnalyzer {
  Ma3GdtfAnalyzer(Uint8List gdtfBytes) {
    _doc = _parse(gdtfBytes);
  }

  XmlDocument? _doc;

  bool get isReadable => _doc != null;

  static XmlDocument? _parse(Uint8List bytes) {
    try {
      final archive = ZipDecoder().decodeBytes(bytes);
      ArchiveFile? best;
      for (final f in archive.files) {
        if (!f.isFile) {
          continue;
        }
        final n = f.name.toLowerCase();
        if (n == 'description.xml' || n.endsWith('/description.xml')) {
          best = f;
          break;
        }
      }
      if (best == null) {
        return null;
      }
      final content = best.readBytes();
      if (content == null) {
        return null;
      }
      return XmlDocument.parse(utf8.decode(content, allowMalformed: true));
    } catch (_) {
      return null;
    }
  }

  Iterable<XmlElement> _all(String localLower) =>
      _doc!.descendants.whereType<XmlElement>().where(
            (e) => e.name.local.toLowerCase() == localLower,
          );

  String get fixtureLabel {
    if (_doc == null) {
      return '';
    }
    final ft = _all('fixturetype');
    if (ft.isEmpty) {
      return '';
    }
    final e = ft.first;
    final manu = (e.getAttribute('Manufacturer') ?? '').trim();
    final name = (e.getAttribute('LongName') ?? '').trim().isNotEmpty
        ? e.getAttribute('LongName')!.trim()
        : (e.getAttribute('Name') ?? '').trim();
    return [manu, name].where((s) => s.isNotEmpty).join(' ');
  }

  List<XmlElement> get _modes =>
      _doc == null ? const [] : _all('dmxmode').toList();

  List<String> get modeNames => _modes
      .map((m) => (m.getAttribute('Name') ?? '').trim())
      .where((n) => n.isNotEmpty)
      .toList();

  /// Résumé de tous les modes (pour le choix du mode dans la liste).
  List<Ma3ModeSummary> modeSummaries() {
    return modeNames.map((n) {
      final a = analyze(n);
      return Ma3ModeSummary(n, a.params, a.footprint);
    }).toList();
  }

  /// Analyse complète d'un mode. [requestedMode] peut être null (MVR sans
  /// GDTFMode) : on prend alors le seul mode s'il n'y en a qu'un.
  Ma3ModeAnalysis analyze(String? requestedMode) {
    final label = fixtureLabel;
    if (_doc == null) {
      return Ma3ModeAnalysis(
        fixtureLabel: label,
        availableModes: const [],
        issues: const [Ma3Issue(Ma3IssueKind.unreadable)],
      );
    }

    final modes = _modes;
    final names = modeNames;
    final issues = <Ma3Issue>[];

    if (modes.isEmpty) {
      return Ma3ModeAnalysis(
        fixtureLabel: label,
        availableModes: names,
        issues: const [Ma3Issue(Ma3IssueKind.noChannels)],
      );
    }

    XmlElement? selected;
    final wanted = (requestedMode ?? '').trim().toLowerCase();

    if (wanted.isEmpty) {
      if (modes.length == 1) {
        selected = modes.first;
        issues.add(const Ma3Issue(Ma3IssueKind.modeGuessedSingle));
      } else {
        return Ma3ModeAnalysis(
          fixtureLabel: label,
          availableModes: names,
          issues: [
            Ma3Issue(Ma3IssueKind.modeMissing,
                a: modes.length, text2: names.join(' · ')),
          ],
        );
      }
    } else {
      for (final m in modes) {
        if ((m.getAttribute('Name') ?? '').trim().toLowerCase() == wanted) {
          selected = m;
          break;
        }
      }
      if (selected == null) {
        for (final m in modes) {
          final n = (m.getAttribute('Name') ?? '').trim().toLowerCase();
          if (n.isEmpty) {
            continue;
          }
          if (n.contains(wanted) || wanted.contains(n)) {
            selected = m;
            issues.add(Ma3Issue(
              Ma3IssueKind.modePartialMatch,
              text: (m.getAttribute('Name') ?? '').trim(),
            ));
            break;
          }
        }
      }
      if (selected == null) {
        return Ma3ModeAnalysis(
          fixtureLabel: label,
          availableModes: names,
          issues: [
            Ma3Issue(Ma3IssueKind.modeNotFound,
                text: requestedMode?.trim(), text2: names.join(' · ')),
          ],
        );
      }
    }

    final sel = selected;
    final modeName = (sel.getAttribute('Name') ?? '').trim();
    final counted = _countMode(sel, issues);

    // Le nom du mode annonce souvent son nombre de canaux ("… 62ch") : un
    // écart avec l'empreinte réelle du GDTF est un très bon indice d'erreur.
    final announced = _announcedChannels(modeName);
    if (announced != null &&
        counted.footprint != null &&
        announced != counted.footprint) {
      issues.add(Ma3Issue(
        Ma3IssueKind.modeNameMismatch,
        a: announced,
        b: counted.footprint,
      ));
    }

    return Ma3ModeAnalysis(
      fixtureLabel: label,
      availableModes: names,
      modeUsed: modeName,
      params: counted.params,
      footprint: counted.footprint,
      virtualChannels: counted.virtualChannels,
      instances: counted.instances,
      issues: issues,
    );
  }

  static int? _announcedChannels(String modeName) {
    final m = RegExp(
      r'(\d{1,4})\s*-?\s*(ch|chs|chan|channels?|canaux|kan[aä]le?|dmx)\b',
      caseSensitive: false,
    ).firstMatch(modeName);
    if (m == null) {
      return null;
    }
    final v = int.tryParse(m.group(1)!);
    if (v == null || v < 1 || v > 4096) {
      return null;
    }
    return v;
  }

  _ModeCount _countMode(XmlElement mode, List<Ma3Issue> issues) {
    // ── Géométries : noms connus + GeometryReference sous la racine du mode
    final geometriesRoot = _all('geometries');
    final knownGeometryNames = <String>{};
    XmlElement? modeRoot;
    final rootName = (mode.getAttribute('Geometry') ?? '').trim();

    if (geometriesRoot.isNotEmpty) {
      final g = geometriesRoot.first;
      for (final e in g.descendants.whereType<XmlElement>()) {
        final n = (e.getAttribute('Name') ?? '').trim();
        if (n.isNotEmpty) {
          knownGeometryNames.add(n);
        }
      }
      for (final top in g.childElements) {
        if ((top.getAttribute('Name') ?? '').trim() == rootName) {
          modeRoot = top;
          break;
        }
      }
    }

    // Géométrie "modèle" → liste des références (instances) dans ce mode.
    final refsByGeometry = <String, List<XmlElement>>{};
    if (modeRoot != null) {
      final refs = [
        if (modeRoot.name.local.toLowerCase() == 'geometryreference') modeRoot,
        ...modeRoot.descendants.whereType<XmlElement>().where(
              (e) => e.name.local.toLowerCase() == 'geometryreference',
            ),
      ];
      for (final r in refs) {
        final target = (r.getAttribute('Geometry') ?? '').trim();
        if (target.isEmpty) {
          continue;
        }
        refsByGeometry.putIfAbsent(target, () => []).add(r);
      }
    }

    // ── Canaux
    final channels = mode.descendants.whereType<XmlElement>().where(
          (e) => e.name.local.toLowerCase() == 'dmxchannel',
        );

    var params = 0;
    var virtualChannels = 0;
    var withoutFunction = 0;
    var unknownGeometry = 0;
    var maxInstances = 1;

    // break → adresses occupées (pour empreinte, doublons et trous)
    final used = <int, List<int>>{};

    void occupy(int dmxBreak, int address) {
      used.putIfAbsent(dmxBreak, () => []).add(address);
    }

    for (final ch in channels) {
      final offsetRaw = (ch.getAttribute('Offset') ?? '').trim();
      final offsets = offsetRaw.toLowerCase() == 'none'
          ? const <int>[]
          : offsetRaw
              .split(',')
              .map((s) => int.tryParse(s.trim()))
              .whereType<int>()
              .where((v) => v > 0)
              .toList();

      if (offsets.isEmpty) {
        virtualChannels++;
        continue;
      }

      if (!_hasFunction(ch)) {
        withoutFunction++;
      }

      final geometry = (ch.getAttribute('Geometry') ?? '').trim();
      if (geometry.isNotEmpty &&
          knownGeometryNames.isNotEmpty &&
          !knownGeometryNames.contains(geometry)) {
        unknownGeometry++;
      }

      final breakRaw = (ch.getAttribute('DMXBreak') ?? '1').trim();
      final isOverwrite = breakRaw.toLowerCase() == 'overwrite';
      final channelBreak = int.tryParse(breakRaw) ?? 1;

      final refs = refsByGeometry[geometry];
      if (refs == null || refs.isEmpty) {
        // Canal "normal" : une seule occurrence.
        params++;
        for (final o in offsets) {
          occupy(channelBreak, o);
        }
        continue;
      }

      // Canal "modèle" : dupliqué pour chaque instance (pixel, cellule…).
      maxInstances = math.max(maxInstances, refs.length);
      for (final ref in refs) {
        params++;
        final breaks = ref.childElements
            .where((e) => e.name.local.toLowerCase() == 'break')
            .toList();
        XmlElement? brk;
        if (isOverwrite) {
          brk = breaks.isNotEmpty ? breaks.last : null;
        } else {
          for (final b in breaks) {
            final db = int.tryParse((b.getAttribute('DMXBreak') ?? '1').trim());
            if (db == channelBreak) {
              brk = b;
              break;
            }
          }
          brk ??= breaks.isNotEmpty ? breaks.first : null;
        }
        final base =
            int.tryParse((brk?.getAttribute('DMXOffset') ?? '1').trim()) ?? 1;
        final targetBreak = isOverwrite
            ? (int.tryParse((brk?.getAttribute('DMXBreak') ?? '1').trim()) ?? 1)
            : channelBreak;
        for (final o in offsets) {
          occupy(targetBreak, base + o - 1);
        }
      }
    }

    if (params == 0) {
      issues.add(const Ma3Issue(Ma3IssueKind.noChannels));
      return _ModeCount(null, null, virtualChannels, 1);
    }

    var footprint = 0;
    var overlaps = 0;
    var gaps = 0;
    for (final addresses in used.values) {
      final distinct = addresses.toSet();
      final maxAddr = distinct.reduce(math.max);
      footprint += maxAddr;
      overlaps += addresses.length - distinct.length;
      gaps += maxAddr - distinct.length;
    }

    if (withoutFunction > 0) {
      issues.add(
          Ma3Issue(Ma3IssueKind.channelsWithoutFunction, a: withoutFunction));
    }
    if (overlaps > 0) {
      issues.add(Ma3Issue(Ma3IssueKind.overlappingOffsets, a: overlaps));
    }
    if (gaps > 0) {
      issues.add(Ma3Issue(Ma3IssueKind.offsetGaps, a: gaps));
    }
    if (unknownGeometry > 0) {
      issues.add(Ma3Issue(Ma3IssueKind.unknownGeometry, a: unknownGeometry));
    }

    return _ModeCount(params, footprint, virtualChannels, maxInstances);
  }

  static bool _hasFunction(XmlElement ch) {
    final initial = (ch.getAttribute('InitialFunction') ?? '').trim();
    if (initial.isNotEmpty) {
      return true;
    }
    for (final lc in ch.descendants.whereType<XmlElement>()) {
      if (lc.name.local.toLowerCase() != 'logicalchannel') {
        continue;
      }
      if ((lc.getAttribute('Attribute') ?? '').trim().isNotEmpty) {
        return true;
      }
    }
    return false;
  }
}

class _ModeCount {
  const _ModeCount(
      this.params, this.footprint, this.virtualChannels, this.instances);
  final int? params;
  final int? footprint;
  final int virtualChannels;
  final int instances;
}

// ═════════════════════════════════════════════════════════════════════════════
// Ligne de calcul (commune MVR / liste manuelle)
// ═════════════════════════════════════════════════════════════════════════════

enum Ma3LineSource { mvr, gdtfShare, gdtfFile, manual }

class Ma3CalcLine {
  Ma3CalcLine({
    required this.label,
    required this.quantity,
    required this.source,
    this.mode,
    this.gdtfParams,
    this.footprint,
    this.overrideParams,
    this.issues = const [],
    this.gdtfBytes,
    this.gdtfRid,
  });

  String label;
  String? mode;
  int quantity;
  final Ma3LineSource source;

  /// Paramètres par machine tels que calculés depuis le GDTF.
  int? gdtfParams;

  /// Empreinte DMX par machine (info univers).
  int? footprint;

  /// Valeur saisie/corrigée à la main (prioritaire sur [gdtfParams]).
  int? overrideParams;

  List<Ma3Issue> issues;

  /// GDTF source gardé en mémoire (non sauvegardé) pour pouvoir changer de
  /// mode sans tout refaire. Null si inconnu ou après redémarrage.
  Uint8List? gdtfBytes;

  /// Identifiant GDTF Share (sauvegardé) : permet de re-télécharger le GDTF
  /// après un redémarrage pour changer de mode.
  int? gdtfRid;

  /// Applique l'analyse d'un GDTF (nouveau type et/ou nouveau mode).
  /// Efface une éventuelle valeur manuelle : on repart des données GDTF.
  void applyAnalysis(
    Ma3ModeAnalysis analysis, {
    required Uint8List bytes,
    String? fallbackLabel,
    int? rid,
    String? requestedMode,
  }) {
    if (analysis.fixtureLabel.isNotEmpty) {
      label = analysis.fixtureLabel;
    } else if (fallbackLabel != null && fallbackLabel.trim().isNotEmpty) {
      label = fallbackLabel;
    }
    mode = analysis.modeUsed ?? requestedMode ?? mode;
    gdtfParams = analysis.params;
    footprint = analysis.footprint;
    issues = analysis.issues;
    overrideParams = null;
    gdtfBytes = bytes;
    gdtfRid = rid;
  }

  int? get paramsPerUnit => overrideParams ?? gdtfParams;

  int get totalParams => (paramsPerUnit ?? 0) * quantity;

  int get totalDmx => (footprint ?? paramsPerUnit ?? 0) * quantity;

  bool get isUnknown => paramsPerUnit == null;

  /// Problèmes affichés : une valeur manuelle "neutralise" les erreurs de
  /// données (l'utilisateur a pris la main), mais on garde la trace.
  List<Ma3Issue> get visibleIssues {
    if (overrideParams == null) {
      return issues;
    }
    return [
      const Ma3Issue(Ma3IssueKind.manualValue),
      ...issues.where((i) => i.severity != Ma3IssueSeverity.error),
    ];
  }

  Ma3IssueSeverity get severity =>
      isUnknown ? Ma3IssueSeverity.error : worstSeverity(visibleIssues);

  Map<String, dynamic> toJson() => {
        'label': label,
        'mode': mode,
        'qty': quantity,
        'src': source.name,
        'gp': gdtfParams,
        'fp': footprint,
        'op': overrideParams,
        if (gdtfRid != null) 'rid': gdtfRid,
        'issues': issues.map((i) => i.toJson()).toList(),
      };

  static Ma3CalcLine? fromJson(Map<String, dynamic> json) {
    try {
      final src = Ma3LineSource.values.firstWhere(
        (s) => s.name == json['src'],
        orElse: () => Ma3LineSource.manual,
      );
      return Ma3CalcLine(
        label: (json['label'] ?? '').toString(),
        mode: json['mode'] as String?,
        quantity: (json['qty'] as num?)?.toInt() ?? 1,
        source: src,
        gdtfParams: (json['gp'] as num?)?.toInt(),
        footprint: (json['fp'] as num?)?.toInt(),
        overrideParams: (json['op'] as num?)?.toInt(),
        gdtfRid: (json['rid'] as num?)?.toInt(),
        issues: ((json['issues'] as List<dynamic>?) ?? [])
            .map((e) => Ma3Issue.fromJson(e as Map<String, dynamic>))
            .whereType<Ma3Issue>()
            .toList(),
      );
    } catch (_) {
      return null;
    }
  }
}

class Ma3Totals {
  const Ma3Totals({
    required this.params,
    required this.fixtures,
    required this.dmxChannels,
    required this.unknownFixtures,
    required this.linesWithWarnings,
    required this.linesWithErrors,
  });

  final int params;
  final int fixtures;
  final int dmxChannels;
  final int unknownFixtures;
  final int linesWithWarnings;
  final int linesWithErrors;

  /// Estimation basse du nombre d'univers DMX.
  int get universes => dmxChannels <= 0 ? 0 : (dmxChannels / 512).ceil();

  static Ma3Totals of(List<Ma3CalcLine> lines) {
    var params = 0, fixtures = 0, dmx = 0, unknown = 0, warn = 0, err = 0;
    for (final l in lines) {
      params += l.totalParams;
      fixtures += l.quantity;
      dmx += l.totalDmx;
      if (l.isUnknown) {
        unknown += l.quantity;
      }
      switch (l.severity) {
        case Ma3IssueSeverity.error:
          err++;
          break;
        case Ma3IssueSeverity.warning:
          warn++;
          break;
        case Ma3IssueSeverity.info:
          break;
      }
    }
    return Ma3Totals(
      params: params,
      fixtures: fixtures,
      dmxChannels: dmx,
      unknownFixtures: unknown,
      linesWithWarnings: warn,
      linesWithErrors: err,
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// Lecture d'un MVR
// ═════════════════════════════════════════════════════════════════════════════

class Ma3MvrResult {
  const Ma3MvrResult({
    required this.lines,
    required this.fixtureCount,
    required this.unpatchedCount,
    required this.multipatchCount,
    this.error,
  });

  final List<Ma3CalcLine> lines;
  final int fixtureCount;
  final int unpatchedCount;
  final int multipatchCount;

  /// Erreur bloquante (fichier illisible, pas de scène…).
  final Ma3MvrError? error;
}

enum Ma3MvrError { unreadable, noScene, noFixtures }

/// À appeler via `compute(parseMvrForMa3, bytes)` pour ne pas figer l'UI
/// sur les gros MVR.
Ma3MvrResult parseMvrForMa3(Uint8List bytes) {
  Archive archive;
  try {
    archive = ZipDecoder().decodeBytes(bytes);
  } catch (_) {
    return const Ma3MvrResult(
      lines: [],
      fixtureCount: 0,
      unpatchedCount: 0,
      multipatchCount: 0,
      error: Ma3MvrError.unreadable,
    );
  }

  String? sceneXml;
  final gdtfFiles = <String, Uint8List>{};
  for (final f in archive.files) {
    if (!f.isFile) {
      continue;
    }
    final lower = f.name.toLowerCase();
    final base = lower.split('/').last.split('\\').last;
    if (base == 'generalscenedescription.xml') {
      final c = f.readBytes();
      if (c != null) {
        sceneXml = utf8.decode(c, allowMalformed: true);
      }
    } else if (base.endsWith('.gdtf')) {
      final c = f.readBytes();
      if (c != null) {
        gdtfFiles[base] = c;
      }
    }
  }

  if (sceneXml == null || sceneXml.trim().isEmpty) {
    return const Ma3MvrResult(
      lines: [],
      fixtureCount: 0,
      unpatchedCount: 0,
      multipatchCount: 0,
      error: Ma3MvrError.noScene,
    );
  }

  XmlDocument doc;
  try {
    doc = XmlDocument.parse(sceneXml);
  } catch (_) {
    return const Ma3MvrResult(
      lines: [],
      fixtureCount: 0,
      unpatchedCount: 0,
      multipatchCount: 0,
      error: Ma3MvrError.noScene,
    );
  }

  String? read(XmlElement e, String key) {
    for (final a in e.attributes) {
      if (a.name.local.toLowerCase() == key.toLowerCase()) {
        final v = a.value.trim();
        if (v.isNotEmpty) {
          return v;
        }
      }
    }
    for (final c in e.childElements) {
      if (c.name.local.toLowerCase() == key.toLowerCase()) {
        final v = c.innerText.trim();
        if (v.isNotEmpty) {
          return v;
        }
      }
    }
    return null;
  }

  final fixtures = doc.descendants
      .whereType<XmlElement>()
      .where((e) => e.name.local.toLowerCase() == 'fixture')
      .toList();

  if (fixtures.isEmpty) {
    return const Ma3MvrResult(
      lines: [],
      fixtureCount: 0,
      unpatchedCount: 0,
      multipatchCount: 0,
      error: Ma3MvrError.noFixtures,
    );
  }

  // Regroupement par (GDTF, mode) → quantité.
  final groups = <String, _MvrGroup>{};
  var unpatched = 0;
  var multipatch = 0;

  for (final fx in fixtures) {
    final spec = read(fx, 'GDTFSpec') ?? '';
    final mode = read(fx, 'GDTFMode');
    if ((read(fx, 'multipatch') ?? '').isNotEmpty) {
      multipatch++;
    }

    var hasAddress = false;
    for (final addrs in fx.childElements
        .where((e) => e.name.local.toLowerCase() == 'addresses')) {
      for (final a in addrs.childElements) {
        final v = int.tryParse(a.innerText.trim());
        if (v != null && v > 0) {
          hasAddress = true;
        }
      }
    }
    if (!hasAddress) {
      unpatched++;
    }

    final key = '${spec.toLowerCase()}||${(mode ?? '').toLowerCase()}';
    final g = groups.putIfAbsent(key, () => _MvrGroup(spec, mode));
    g.count++;
    if (g.sampleName == null) {
      final n = read(fx, 'name');
      if (n != null) {
        g.sampleName = n;
      }
    }
  }

  final analyzers = <String, Ma3GdtfAnalyzer?>{};
  final lines = <Ma3CalcLine>[];

  for (final g in groups.values) {
    final specBase = g.spec.split('/').last.split('\\').last.toLowerCase();
    final candidates = <String>{
      specBase,
      specBase.endsWith('.gdtf') ? specBase : '$specBase.gdtf',
    };
    Uint8List? gdtf;
    for (final c in candidates) {
      gdtf = gdtfFiles[c];
      if (gdtf != null) {
        break;
      }
    }

    final prettySpec = _prettySpec(g.spec, g.sampleName);

    if (gdtf == null) {
      lines.add(Ma3CalcLine(
        label: prettySpec,
        mode: g.mode,
        quantity: g.count,
        source: Ma3LineSource.mvr,
        issues: [Ma3Issue(Ma3IssueKind.gdtfMissing, text: g.spec)],
      ));
      continue;
    }

    final analyzer = analyzers.putIfAbsent(specBase, () {
      final a = Ma3GdtfAnalyzer(gdtf!);
      return a.isReadable ? a : null;
    });

    if (analyzer == null) {
      lines.add(Ma3CalcLine(
        label: prettySpec,
        mode: g.mode,
        quantity: g.count,
        source: Ma3LineSource.mvr,
        issues: const [Ma3Issue(Ma3IssueKind.unreadable)],
        gdtfBytes: gdtf,
      ));
      continue;
    }

    final analysis = analyzer.analyze(g.mode);
    lines.add(Ma3CalcLine(
      label:
          analysis.fixtureLabel.isNotEmpty ? analysis.fixtureLabel : prettySpec,
      mode: analysis.modeUsed ?? g.mode,
      quantity: g.count,
      source: Ma3LineSource.mvr,
      gdtfParams: analysis.params,
      footprint: analysis.footprint,
      issues: analysis.issues,
      gdtfBytes: gdtf,
    ));
  }

  // Les lignes problématiques d'abord, puis les plus gros consommateurs.
  lines.sort((a, b) {
    final s = b.severity.index.compareTo(a.severity.index);
    if (s != 0) {
      return s;
    }
    return b.totalParams.compareTo(a.totalParams);
  });

  return Ma3MvrResult(
    lines: lines,
    fixtureCount: fixtures.length,
    unpatchedCount: unpatched,
    multipatchCount: multipatch,
  );
}

String _prettySpec(String spec, String? sampleName) {
  var s = spec.split('/').last.split('\\').last;
  if (s.toLowerCase().endsWith('.gdtf')) {
    s = s.substring(0, s.length - 5);
  }
  // Convention GDTF Share : "Fabricant@Modèle@Révision"
  final parts = s.split('@').where((p) => p.trim().isNotEmpty).toList();
  if (parts.length >= 2) {
    s = '${parts[0]} ${parts[1]}';
  }
  s = s.replaceAll('_', ' ').trim();
  if (s.isEmpty) {
    return sampleName ?? '?';
  }
  return s;
}

class _MvrGroup {
  _MvrGroup(this.spec, this.mode);
  final String spec;
  final String? mode;
  int count = 0;
  String? sampleName;
}
