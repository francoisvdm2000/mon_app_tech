import 'package:flutter/material.dart';

import 'gdtf_reader.dart';
import 'patch_models.dart';
import 'patch_store.dart';

/// Vue 3D d'une fixture patchée : fusionne un [PatchEntry] (position issue
/// du MVR, univers, adresse, groupKey) avec les informations physiques de
/// son GDTF (poids, dimensions, watt, présence d'un vrai modèle 3D), quand
/// ces dernières sont disponibles.
///
/// Toujours construit avec un [transform] non nul : les entrées sans
/// position 3D (patch saisi à la main, MVR sans `<Matrix>`) sont exclues de
/// [Fixture3dStore.allFixtures] et comptées dans
/// [Fixture3dStore.entriesWithoutTransform] à la place.
@immutable
class Fixture3d {
  final PatchEntry entry;
  final FixtureTransform transform;
  final GdtfPhysicalInfo physicalInfo;

  const Fixture3d({
    required this.entry,
    required this.transform,
    required this.physicalInfo,
  });

  String get id => entry.id;
  String get groupKey => entry.groupKey;
  int get universe => entry.universe;
  bool get hasReal3dModelFile => physicalInfo.hasReal3dModelFile;
}

enum Fixture3dColorMode { byUniverse, byType }

/// State store du visualiseur 3D : dérive sa liste de fixtures de
/// [patchStore] (source de vérité pour le patch) + [GdtfReader] pour les
/// infos physiques, et porte l'état propre à la vue 3D (filtres, mode de
/// colorisation, sélection courante). Même pattern `ChangeNotifier` que
/// [PatchStore], pour rester cohérent avec le reste de l'app.
class Fixture3dStore extends ChangeNotifier {
  Fixture3dStore() {
    patchStore.addListener(_onPatchStoreChanged);
    _rebuild();
  }

  final GdtfReader _gdtfReader = GdtfReader();

  List<Fixture3d> _fixtures = const [];
  int _entriesWithoutTransform = 0;

  /// null = pas de filtre (tout est visible).
  Set<int>? _universeFilter;
  Set<String>? _groupKeyFilter;

  Fixture3dColorMode _colorMode = Fixture3dColorMode.byType;
  final Set<String> _selectedIds = <String>{};

  /// Couleur de fond de la scène 3D (nuancier choisi dans la feuille de
  /// filtres). Portée par le store (plutôt que par l'État de la page) pour
  /// que la feuille de filtres — qui écoute déjà ce store via
  /// `AnimatedBuilder` — se redessine immédiatement quand elle change, comme
  /// [colorMode] et les filtres.
  int _backgroundColorHex = 0x000000;

  // ───────────────────── lecture ─────────────────────

  List<Fixture3d> get allFixtures => List.unmodifiable(_fixtures);

  /// Entrées du patch ignorées par le viewer 3D faute de position connue
  /// (pas de `<Matrix>` dans le MVR, ou patch saisi manuellement).
  int get entriesWithoutTransform => _entriesWithoutTransform;

  List<Fixture3d> get visibleFixtures {
    return _fixtures.where((f) {
      if (_universeFilter != null && !_universeFilter!.contains(f.universe)) {
        return false;
      }
      if (_groupKeyFilter != null && !_groupKeyFilter!.contains(f.groupKey)) {
        return false;
      }
      return true;
    }).toList(growable: false);
  }

  List<int> get universes {
    final set = _fixtures.map((f) => f.universe).toSet().toList()..sort();
    return set;
  }

  List<String> get groupKeys {
    final set = _fixtures.map((f) => f.groupKey).toSet().toList()..sort();
    return set;
  }

  /// Libellé lisible pour un groupKey (nom de la première fixture du
  /// groupe) — le groupKey lui-même est une clé technique normalisée.
  String labelForGroupKey(String groupKey) {
    for (final f in _fixtures) {
      if (f.groupKey == groupKey) return f.entry.fixtureName;
    }
    return groupKey;
  }

  /// GroupKeys dont aucune fixture n'a de vrai modèle 3D dans son GDTF —
  /// ces types sont rendus avec un cube générique 30x30x30cm dans le
  /// viewer, et signalés une fois au chargement via un popup récapitulatif.
  List<String> get groupKeysWithoutRealModel {
    final withReal = <String>{};
    final all = <String>{};
    for (final f in _fixtures) {
      all.add(f.groupKey);
      if (f.hasReal3dModelFile) withReal.add(f.groupKey);
    }
    final missing = all.difference(withReal).toList()..sort();
    return missing;
  }

  Fixture3dColorMode get colorMode => _colorMode;
  int get backgroundColorHex => _backgroundColorHex;
  Set<int>? get universeFilter => _universeFilter;
  Set<String>? get groupKeyFilter => _groupKeyFilter;
  Set<String> get selectedIds => Set.unmodifiable(_selectedIds);

  List<Fixture3d> get selectedFixtures =>
      _fixtures.where((f) => _selectedIds.contains(f.id)).toList();

  /// Couleur déterministe (palette HSL équirépartie) selon le mode de
  /// colorisation actif. Stable tant que la liste triée de clés ne change
  /// pas (même univers/type => toujours la même couleur dans la session).
  Color colorFor(Fixture3d fixture) {
    final keys =
        _colorMode == Fixture3dColorMode.byUniverse
            ? universes.map((u) => u.toString()).toList()
            : groupKeys;
    final key = _colorMode == Fixture3dColorMode.byUniverse
        ? fixture.universe.toString()
        : fixture.groupKey;

    if (keys.isEmpty) return const Color(0xFFB0B0B0);
    final index = keys.indexOf(key);
    if (index < 0) return const Color(0xFFB0B0B0);

    final hue = (index * 360 / keys.length) % 360;
    return HSLColor.fromAHSL(1, hue, 0.65, 0.55).toColor();
  }

  // ───────────────────── mutations ─────────────────────

  void setColorMode(Fixture3dColorMode mode) {
    if (_colorMode == mode) return;
    _colorMode = mode;
    notifyListeners();
  }

  void setBackgroundColor(int hex) {
    if (_backgroundColorHex == hex) return;
    _backgroundColorHex = hex;
    notifyListeners();
  }

  /// null => retire le filtre (tous les univers visibles).
  void setUniverseFilter(Set<int>? universes) {
    _universeFilter = (universes != null && universes.isEmpty)
        ? null
        : universes;
    notifyListeners();
  }

  /// null => retire le filtre (tous les types visibles).
  void setGroupKeyFilter(Set<String>? keys) {
    _groupKeyFilter = (keys != null && keys.isEmpty) ? null : keys;
    notifyListeners();
  }

  void selectOnly(String id) {
    _selectedIds
      ..clear()
      ..add(id);
    notifyListeners();
  }

  void toggleSelection(String id) {
    if (!_selectedIds.add(id)) _selectedIds.remove(id);
    notifyListeners();
  }

  void clearSelection() {
    if (_selectedIds.isEmpty) return;
    _selectedIds.clear();
    notifyListeners();
  }

  // ───────────────────── construction interne ─────────────────────

  void _onPatchStoreChanged() => _rebuild();

  void _rebuild() {
    final built = <Fixture3d>[];
    var withoutTransform = 0;

    for (final entry in patchStore.entries) {
      final transform = entry.transform;
      if (transform == null) {
        withoutTransform++;
        continue;
      }

      final gdtfBytes = patchStore.gdtfBytesFor(entry);
      final physicalInfo = gdtfBytes != null
          ? _gdtfReader.physicalInfo(gdtfBytes: gdtfBytes)
          : const GdtfPhysicalInfo();

      built.add(
        Fixture3d(entry: entry, transform: transform, physicalInfo: physicalInfo),
      );
    }

    _fixtures = built;
    _entriesWithoutTransform = withoutTransform;

    final validIds = _fixtures.map((f) => f.id).toSet();
    _selectedIds.removeWhere((id) => !validIds.contains(id));

    notifyListeners();
  }

  @override
  void dispose() {
    patchStore.removeListener(_onPatchStoreChanged);
    super.dispose();
  }
}

/// Instance app-wide, même pattern que [patchStore].
final Fixture3dStore fixture3dStore = Fixture3dStore();
