import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:three_js/three_js.dart' as three;
import 'package:three_js_controls/three_js_controls.dart' as three_controls;

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../../about/about_favorites.dart';
import 'fixture_3d_store.dart';
import 'fixture_info_panel.dart';
import 'gdtf_reader.dart';
import 'patch_store.dart';

/// Nuancier de couleurs de fond proposées dans la feuille de filtres.
/// Le premier élément est la couleur par défaut à l'ouverture de la page.
const List<int> _kBackgroundSwatches = [
  0x000000, // Noir
  0x14141e, // Gris très foncé (teinte du sol)
  0x4a4a52, // Gris moyen
  0xd0d0d8, // Gris clair
  0xffffff, // Blanc
  0x0a1128, // Bleu nuit
];

/// Vues caméra prédéfinies proposées dans le menu "vues caméra".
enum _CameraViewPreset { front, top, side, iso }

/// Visualiseur 3D du patch MVR : positionne chaque fixture dans l'espace
/// selon le `<Matrix>` lu dans le MVR (via [fixture3dStore]), avec sélection
/// (tap + centrage caméra), filtres univers/type et colorisation.
///
/// Chaque type de machine (groupKey) tente de charger le modèle 3D "principal"
/// embarqué dans son GDTF (le `<Model>` le plus volumineux référençant un
/// fichier .glb — voir [GdtfReader.extractGlbBytes]) : chargement async,
/// mis en cache par groupKey, cloné par instance. Tant que le chargement
/// n'a pas abouti (ou si le GDTF n'a pas de modèle exploitable), la fixture
/// s'affiche comme un cube générique 30x30x30cm — voir [_maybeShowMissingModelDialog].
///
/// Note : seule la position est reprise du `<Matrix>` MVR pour l'instant.
/// La rotation (orientation pan/tilt) n'est pas encore appliquée aux
/// modèles réels — la conversion de chiralité Z-up (MVR) → Y-up (three_js)
/// pour une rotation complète doit être vérifiée sur un vrai fichier avant
/// d'être activée (un mauvais signe donnerait des fixtures orientées en
/// miroir, plus trompeur qu'utile).
class PatchMvr3dPage extends StatefulWidget {
  const PatchMvr3dPage({super.key});

  @override
  State<PatchMvr3dPage> createState() => _PatchMvr3dPageState();
}

class _PatchMvr3dPageState extends State<PatchMvr3dPage> {
  late final three.ThreeJS threeJs;
  three_controls.OrbitControls? _orbitControls;
  three.BufferGeometry? _cubeGeometry;
  three.BufferGeometry? _markerGeometry;

  final GdtfReader _gdtfReader = GdtfReader();

  /// Modèle "gabarit" chargé pour un groupKey donné (cloné par instance).
  /// Une clé présente avec valeur null = chargement tenté et confirmé sans
  /// modèle exploitable (cube définitif). Clé absente = pas encore tenté.
  final Map<String, three.Object3D?> _modelTemplateByGroupKey = <String, three.Object3D?>{};
  final Map<String, Future<void>> _loadFuturesByGroupKey = <String, Future<void>>{};

  /// GroupKeys confirmés sans modèle réel (calculé à chaque reconstruction
  /// de la scène) — alimente le popup récapitulatif.
  final Set<String> _groupKeysRenderedAsCube = <String>{};

  final Map<String, three.Object3D> _objectsById = <String, three.Object3D>{};

  bool _setupDone = false;
  bool _missingModelDialogShown = false;

  /// Vrai une fois que la caméra a été cadrée sur au moins un jeu de
  /// fixtures réel. Tant que c'est faux, on retente le cadrage à chaque
  /// mise à jour du store : au premier lancement, `patchStore`/`fixture3dStore`
  /// peuvent se peupler juste après `_setup()` (course entre le chargement du
  /// patch et l'init de la scène) — sans ce recadrage différé, la caméra
  /// restait sur sa position par défaut, qui ne regarde jamais le sol ni les
  /// fixtures (écran noir permanent malgré un rendu qui tourne).
  bool _hasFramedInitialContent = false;

  // Animation de centrage caméra ("zoom actif" sur la sélection).
  three.Vector3? _camAnimFrom;
  three.Vector3? _camAnimTo;
  three.Vector3? _targetAnimFrom;
  three.Vector3? _targetAnimTo;
  double _camAnimT = 1;
  static const double _camAnimDurationSeconds = 0.4;

  @override
  void initState() {
    super.initState();
    threeJs = three.ThreeJS(
      onSetupComplete: () => setState(() {}),
      setup: _setup,
    );
    fixture3dStore.addListener(_onStoreChanged);
  }

  @override
  void dispose() {
    fixture3dStore.removeListener(_onStoreChanged);
    threeJs.dispose();
    super.dispose();
  }

  void _onStoreChanged() {
    if (!_setupDone) return;
    threeJs.scene.background = three.Color.fromHex32(fixture3dStore.backgroundColorHex);
    _syncSceneWithStore();
  }

  Future<void> _setup() async {
    threeJs.camera = three.PerspectiveCamera(
      50,
      threeJs.width / threeJs.height,
      0.05,
      500,
    );
    threeJs.camera.position.setValues(6, 6, 6);
    // Sans lookAt, la caméra regarde par défaut le long de -Z monde depuis
    // (6,6,6) : ce rayon est parallèle au sol (plan Y=0) et ne le croise
    // jamais, donc rien n'apparaît tant qu'aucune fixture n'a recadré la
    // caméra. On vise l'origine dès le départ pour toujours voir le sol.
    threeJs.camera.lookAt(three.Vector3.zero());

    threeJs.scene = three.Scene();
    threeJs.scene.background = three.Color.fromHex32(fixture3dStore.backgroundColorHex);
    threeJs.scene.add(three.AmbientLight(0xffffff, 0.65));

    final pointLight = three.PointLight(0xffffff, 0.7);
    pointLight.position.setValues(6, 9, 6);
    threeJs.scene.add(pointLight);

    final groundMesh = three.Mesh(
      three.PlaneGeometry(60, 60),
      three.MeshPhongMaterial.fromMap({'color': 0x14141e}),
    );
    groundMesh.rotation.x = -math.pi / 2;
    threeJs.scene.add(groundMesh);

    _cubeGeometry = three.BoxGeometry(0.3, 0.3, 0.3);
    _markerGeometry = three.BoxGeometry(0.12, 0.12, 0.12);

    _orbitControls = three_controls.OrbitControls(
      threeJs.camera,
      threeJs.globalKey,
    );
    _orbitControls!.enableDamping = true;
    _orbitControls!.dampingFactor = 0.08;

    threeJs.addAnimationEvent((dt) {
      _stepCameraAnimation(dt);
      _orbitControls?.update();
    });

    _setupDone = true;
    _rebuildSceneObjects();

    // Cadrage initial sur l'ensemble du MVR (pas seulement ce qui est
    // "visible" selon un éventuel filtre) : à l'ouverture, on veut voir tout
    // le patch positionné.
    final all = fixture3dStore.allFixtures;
    if (all.isNotEmpty) {
      _focusCameraOn(all, animate: false);
      _hasFramedInitialContent = true;
    }

    final visible = fixture3dStore.visibleFixtures;
    // On attend la fin des tentatives de chargement initiales avant le
    // popup récapitulatif, sinon il listerait "tout" le temps que les
    // modèles réels n'ont pas fini de charger (faux positifs).
    await _ensureModelsLoadedFor(visible.map((f) => f.groupKey));
    if (mounted) _maybeShowMissingModelDialog();
  }

  // ─────────────────────── Scène ⇄ store ───────────────────────

  void _syncSceneWithStore() {
    _rebuildSceneObjects();

    // Le patch peut finir de se charger juste après _setup() : dès que des
    // fixtures apparaissent pour la première fois, on cadre la caméra dessus
    // (une seule fois — les mises à jour suivantes, ex. changement de filtre,
    // ne doivent pas faire sauter la vue toute seule).
    if (!_hasFramedInitialContent) {
      final all = fixture3dStore.allFixtures;
      if (all.isNotEmpty) {
        _focusCameraOn(all, animate: false);
        _hasFramedInitialContent = true;
      }
    }

    // Déclenche (sans attendre) le chargement des modèles pour les
    // groupKeys visibles pas encore résolus — la scène se met à jour
    // toute seule (progressivement, type par type) via le callback de
    // _doLoadModelForGroupKey.
    unawaited(_ensureModelsLoadedFor(fixture3dStore.visibleFixtures.map((f) => f.groupKey)));
  }

  void _rebuildSceneObjects() {
    for (final obj in _objectsById.values) {
      threeJs.scene.remove(obj);
    }
    _objectsById.clear();
    _groupKeysRenderedAsCube.clear();

    final cubeGeometry = _cubeGeometry;
    final markerGeometry = _markerGeometry;
    if (cubeGeometry == null || markerGeometry == null) return;

    for (final fixture in fixture3dStore.visibleFixtures) {
      final isSelected = fixture3dStore.selectedIds.contains(fixture.id);
      final hex = isSelected ? 0xFFFFFF : _colorToHex(fixture3dStore.colorFor(fixture));

      final template = _modelTemplateByGroupKey[fixture.groupKey];

      three.Object3D root;
      if (template != null) {
        // Modèle réel : maillage authentique + petit marqueur coloré posé
        // au-dessus (hauteur GDTF connue), plutôt que de retoucher les
        // matériaux PBR importés pour la colorisation univers/type.
        final clone = template.clone();
        final marker = three.Mesh(markerGeometry, three.MeshPhongMaterial.fromMap({'color': hex}));
        final heightM = fixture.physicalInfo.approxHeightM ?? 0.3;
        marker.position.setValues(0, heightM + 0.12, 0);

        final group = three.Object3D();
        group.add(clone);
        group.add(marker);
        root = group;
      } else {
        if (_modelTemplateByGroupKey.containsKey(fixture.groupKey)) {
          // Chargement déjà tenté et confirmé sans modèle exploitable.
          _groupKeysRenderedAsCube.add(fixture.groupKey);
        }
        root = three.Mesh(cubeGeometry, three.MeshPhongMaterial.fromMap({'color': hex}));
      }

      root.position.setValues(
        fixture.transform.positionXMeters,
        // MVR/GDTF utilisent une convention Z-up (hauteur = Z), three_js
        // est Y-up : on permute Y et Z pour la position. La rotation n'est
        // volontairement pas appliquée pour l'instant (voir doc de la classe).
        fixture.transform.positionZMeters,
        fixture.transform.positionYMeters,
      );
      root.userData['fixtureId'] = fixture.id;

      threeJs.scene.add(root);
      _objectsById[fixture.id] = root;
    }

    if (mounted) setState(() {});
  }

  int _colorToHex(Color c) {
    final r = (c.r * 255).round().clamp(0, 255);
    final g = (c.g * 255).round().clamp(0, 255);
    final b = (c.b * 255).round().clamp(0, 255);
    return (r << 16) | (g << 8) | b;
  }

  // ─────────────────────── Chargement des modèles GDTF ───────────────────────

  Future<void> _ensureModelsLoadedFor(Iterable<String> groupKeys) async {
    final futures = <Future<void>>[];
    for (final key in groupKeys.toSet()) {
      if (_modelTemplateByGroupKey.containsKey(key)) continue;
      futures.add(_loadModelForGroupKey(key));
    }
    if (futures.isNotEmpty) await Future.wait(futures);
  }

  Future<void> _loadModelForGroupKey(String groupKey) {
    final existing = _loadFuturesByGroupKey[groupKey];
    if (existing != null) return existing;

    final future = _doLoadModelForGroupKey(groupKey);
    _loadFuturesByGroupKey[groupKey] = future;
    return future;
  }

  Future<void> _doLoadModelForGroupKey(String groupKey) async {
    try {
      Fixture3d? fixture;
      for (final f in fixture3dStore.allFixtures) {
        if (f.groupKey == groupKey) {
          fixture = f;
          break;
        }
      }
      if (fixture == null) {
        _modelTemplateByGroupKey[groupKey] = null;
        return;
      }

      final gdtfBytes = patchStore.gdtfBytesFor(fixture.entry);
      final modelName = fixture.physicalInfo.primaryModelName;
      if (gdtfBytes == null || modelName == null) {
        _modelTemplateByGroupKey[groupKey] = null;
        return;
      }

      final glbBytes = _gdtfReader.extractGlbBytes(
        gdtfBytes: gdtfBytes,
        modelBaseName: modelName,
      );
      if (glbBytes == null) {
        _modelTemplateByGroupKey[groupKey] = null;
        return;
      }

      final gltfData = await three.GLTFLoader().fromBytes(glbBytes);
      _modelTemplateByGroupKey[groupKey] = gltfData?.scene;
    } catch (_) {
      _modelTemplateByGroupKey[groupKey] = null;
    } finally {
      if (mounted && _setupDone) _rebuildSceneObjects();
    }
  }

  // ─────────────────────── Sélection / picking ───────────────────────

  void _handleTap(Offset local, Size viewportSize) {
    if (!_setupDone || viewportSize.width == 0 || viewportSize.height == 0) {
      return;
    }

    final ndcX = (local.dx / viewportSize.width) * 2 - 1;
    final ndcY = -(local.dy / viewportSize.height) * 2 + 1;

    final raycaster = three.Raycaster();
    raycaster.setFromCamera(three.Vector2(ndcX, ndcY), threeJs.camera);
    // recursive=true : les fixtures avec modèle réel sont des groupes
    // (clone du gltf + marqueur), il faut descendre dans leurs enfants
    // pour toucher une géométrie concrète.
    final hits = raycaster.intersectObjects(_objectsById.values.toList(), true);

    if (hits.isEmpty) {
      fixture3dStore.clearSelection();
      return;
    }

    // Le nœud touché est potentiellement un enfant profond (mesh du glTF) :
    // on remonte la hiérarchie jusqu'au groupe racine qui porte le
    // fixtureId (posé une seule fois, sur la racine, dans _rebuildSceneObjects).
    three.Object3D? node = hits.first.object;
    String? fixtureId;
    while (node != null) {
      final id = node.userData['fixtureId'] as String?;
      if (id != null) {
        fixtureId = id;
        break;
      }
      node = node.parent;
    }
    if (fixtureId == null) return;

    fixture3dStore.selectOnly(fixtureId);

    final fixture = fixture3dStore.selectedFixtures.isEmpty
        ? null
        : fixture3dStore.selectedFixtures.first;
    if (fixture == null) return;

    _focusCameraOn([fixture]);

    FixtureInfoPanel.show(
      context,
      entry: fixture.entry,
      physicalInfo: fixture.physicalInfo,
    );
  }

  // ─────────────────────── Caméra : zoom actif / centrage ───────────────────────

  /// Calcule le centre et la distance de cadrage pour englober [fixtures]
  /// (avec une marge), partagé par le centrage sur sélection et les vues
  /// caméra prédéfinies.
  ({three.Vector3 center, double distance}) _computeFrame(List<Fixture3d> fixtures) {
    double minX = double.infinity, maxX = -double.infinity;
    double minY = double.infinity, maxY = -double.infinity;
    double minZ = double.infinity, maxZ = -double.infinity;

    for (final f in fixtures) {
      final x = f.transform.positionXMeters;
      final y = f.transform.positionZMeters;
      final z = f.transform.positionYMeters;
      if (x < minX) minX = x;
      if (x > maxX) maxX = x;
      if (y < minY) minY = y;
      if (y > maxY) maxY = y;
      if (z < minZ) minZ = z;
      if (z > maxZ) maxZ = z;
    }

    const pad = 0.5;
    minX -= pad;
    maxX += pad;
    minY -= pad;
    maxY += pad;
    minZ -= pad;
    maxZ += pad;

    final center = three.Vector3((minX + maxX) / 2, (minY + maxY) / 2, (minZ + maxZ) / 2);
    final size = math.max(maxX - minX, math.max(maxY - minY, maxZ - minZ));
    final distance = math.max(size * 1.6, 1.5);
    return (center: center, distance: distance);
  }

  /// Déplace la caméra vers [newPosition] en la faisant regarder [target],
  /// soit immédiatement, soit animé (voir [_stepCameraAnimation]).
  void _moveCameraTo(three.Vector3 newPosition, three.Vector3 target, {bool animate = true}) {
    final currentTarget = _orbitControls?.target.clone() ?? three.Vector3.zero();

    if (!animate) {
      threeJs.camera.position.setValues(newPosition.x, newPosition.y, newPosition.z);
      _orbitControls?.target.setValues(target.x, target.y, target.z);
      threeJs.camera.lookAt(target);
      return;
    }

    _camAnimFrom = threeJs.camera.position.clone();
    _camAnimTo = newPosition;
    _targetAnimFrom = currentTarget;
    _targetAnimTo = target;
    _camAnimT = 0;
  }

  /// Centre/zoome la caméra sur [fixtures] en conservant l'angle de vue
  /// actuel (bouton "recentrer sur la sélection").
  void _focusCameraOn(List<Fixture3d> fixtures, {bool animate = true}) {
    if (fixtures.isEmpty || !_setupDone) return;

    final frame = _computeFrame(fixtures);
    final currentTarget = _orbitControls?.target.clone() ?? three.Vector3.zero();
    final dir = threeJs.camera.position.clone().sub(currentTarget);
    final dirLength = dir.length;
    final normalizedDir = dirLength > 0.0001
        ? dir.normalize()
        : three.Vector3(1, 1, 1).normalize();

    final newCameraPosition = frame.center.clone().add(normalizedDir.scale(frame.distance));
    _moveCameraTo(newCameraPosition, frame.center, animate: animate);
  }

  /// Applique une vue caméra prédéfinie (face/dessus/côté/iso), cadrée sur
  /// les fixtures actuellement visibles (tout le MVR si aucun filtre actif).
  void _applyCameraPreset(_CameraViewPreset preset) {
    if (!_setupDone) return;

    final fixtures = fixture3dStore.visibleFixtures.isNotEmpty
        ? fixture3dStore.visibleFixtures
        : fixture3dStore.allFixtures;

    final three.Vector3 center;
    final double distance;
    if (fixtures.isEmpty) {
      center = three.Vector3.zero();
      distance = 6;
    } else {
      final frame = _computeFrame(fixtures);
      center = frame.center;
      distance = frame.distance;
    }

    // Un angle de vue "dessus" parfaitement vertical rend le lookAt()
    // instable (l'axe "up" de la caméra devient parallèle à la direction de
    // vue) : léger décalage pour rester une vue de dessus stable.
    final dir = switch (preset) {
      _CameraViewPreset.front => three.Vector3(0, 0, 1),
      _CameraViewPreset.top => three.Vector3(0, 1, 0.0001).normalize(),
      _CameraViewPreset.side => three.Vector3(1, 0, 0),
      _CameraViewPreset.iso => three.Vector3(1, 1, 1).normalize(),
    };

    _moveCameraTo(center.clone().add(dir.scale(distance)), center);
  }

  void _stepCameraAnimation(double dt) {
    if (_camAnimT >= 1 || _camAnimFrom == null || _camAnimTo == null) return;

    _camAnimT = math.min(1, _camAnimT + dt / _camAnimDurationSeconds);
    final t = Curves.easeOutCubic.transform(_camAnimT);

    final camPos = _camAnimFrom!.clone().lerp(_camAnimTo!, t);
    threeJs.camera.position.setValues(camPos.x, camPos.y, camPos.z);

    if (_targetAnimFrom != null && _targetAnimTo != null) {
      final target = _targetAnimFrom!.clone().lerp(_targetAnimTo!, t);
      _orbitControls?.target.setValues(target.x, target.y, target.z);
      threeJs.camera.lookAt(target);
    }
  }

  // ─────────────────────── Popup "pas de modèle 3D" ───────────────────────

  void _maybeShowMissingModelDialog() {
    if (_missingModelDialogShown || !mounted) return;
    // Basé sur les tentatives de chargement réellement effectuées (pas sur
    // la seule présence d'un attribut File dans le GDTF) : un type peut
    // déclarer un fichier mais être un .3ds ou un .gltf+.bin non supporté,
    // auquel cas il finit quand même en cube et doit apparaître ici.
    final missing = _groupKeysRenderedAsCube.toList()..sort();
    if (missing.isEmpty) return;

    _missingModelDialogShown = true;
    final loc = AppLocalizations.of(context);

    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(loc.patch3dMissingModelTitle),
        content: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(loc.patch3dMissingModelBody(missing.length)),
                const SizedBox(height: 12),
                ...missing.take(20).map(
                      (key) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          '• ${fixture3dStore.labelForGroupKey(key)}',
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                if (missing.length > 20)
                  Text(loc.patchUniversePopupMore(missing.length - 20)),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(loc.commonOk),
          ),
        ],
      ),
    );
  }

  // ─────────────────────── UI ───────────────────────

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.patch3dTitle),
        actions: [
          const AboutPinButton(pageId: 'tool:lumiere_patch_mvr_3d', sectionId: 'main'),
          IconButton(
            tooltip: loc.patch3dResetCameraTooltip,
            icon: const Icon(Icons.center_focus_strong_outlined),
            // Recentre/zoome sur la sélection active uniquement (zoom actif
            // "classique"). Pour cadrer tout le patch, voir le bouton
            // "zoom to fit" ci-dessous.
            onPressed: fixture3dStore.selectedFixtures.isEmpty
                ? null
                : () => _focusCameraOn(fixture3dStore.selectedFixtures),
          ),
          IconButton(
            tooltip: loc.patch3dZoomToFitTooltip,
            icon: const Icon(Icons.fit_screen_outlined),
            onPressed: fixture3dStore.allFixtures.isEmpty
                ? null
                : () => _focusCameraOn(fixture3dStore.allFixtures),
          ),
          PopupMenuButton<_CameraViewPreset>(
            tooltip: loc.patch3dCameraViewsTooltip,
            icon: const Icon(Icons.videocam_outlined),
            onSelected: _applyCameraPreset,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: _CameraViewPreset.front,
                child: Text(loc.patch3dCameraViewFront),
              ),
              PopupMenuItem(
                value: _CameraViewPreset.top,
                child: Text(loc.patch3dCameraViewTop),
              ),
              PopupMenuItem(
                value: _CameraViewPreset.side,
                child: Text(loc.patch3dCameraViewSide),
              ),
              PopupMenuItem(
                value: _CameraViewPreset.iso,
                child: Text(loc.patch3dCameraViewIso),
              ),
            ],
          ),
          IconButton(
            tooltip: loc.patch3dFiltersTooltip,
            icon: const Icon(Icons.tune),
            onPressed: () => _openFiltersSheet(context),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: fixture3dStore,
        builder: (context, _) {
          return Stack(
            children: [
              Positioned.fill(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return GestureDetector(
                      onTapUp: (details) => _handleTap(details.localPosition, constraints.biggest),
                      child: threeJs.build(),
                    );
                  },
                ),
              ),
              if (fixture3dStore.entriesWithoutTransform > 0)
                Positioned(
                  left: 12,
                  right: 12,
                  bottom: 12,
                  child: _Banner(
                    text: loc.patch3dEntriesWithoutPosition(
                      fixture3dStore.entriesWithoutTransform,
                    ),
                  ),
                ),
              if (fixture3dStore.allFixtures.isEmpty)
                Center(
                  child: _Banner(text: loc.patch3dNoPositionedFixtures),
                ),
            ],
          );
        },
      ),
    );
  }

  void _openFiltersSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const _FiltersSheet(),
    );
  }
}

class _Banner extends StatelessWidget {
  final String text;
  const _Banner({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF161622).withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white12),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white70),
      ),
    );
  }
}

/// Filtres univers/type + mode de colorisation. Chaque puce sert aussi de
/// légende (pastille de la couleur effectivement utilisée dans la scène).
class _FiltersSheet extends StatelessWidget {
  const _FiltersSheet();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SafeArea(
      child: AnimatedBuilder(
        animation: fixture3dStore,
        builder: (context, _) {
          final universes = fixture3dStore.universes;
          final groupKeys = fixture3dStore.groupKeys;

          return Container(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
            decoration: const BoxDecoration(
              color: Color(0xFF0E0E18),
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    loc.patch3dColorModeLabel,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 8),
                  SegmentedButton<Fixture3dColorMode>(
                    segments: [
                      ButtonSegment(
                        value: Fixture3dColorMode.byType,
                        label: Text(loc.patch3dColorModeByType),
                      ),
                      ButtonSegment(
                        value: Fixture3dColorMode.byUniverse,
                        label: Text(loc.patch3dColorModeByUniverse),
                      ),
                    ],
                    selected: {fixture3dStore.colorMode},
                    onSelectionChanged: (s) => fixture3dStore.setColorMode(s.first),
                  ),
                  const SizedBox(height: 20),

                  Text(
                    loc.patch3dBackgroundColorLabel,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _kBackgroundSwatches.map((hex) {
                      final selected = hex == fixture3dStore.backgroundColorHex;
                      return InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () => fixture3dStore.setBackgroundColor(hex),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Color(0xFF000000 | hex),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: selected ? Colors.white : Colors.white24,
                              width: selected ? 2.5 : 1,
                            ),
                          ),
                          child: selected
                              ? Icon(
                                  Icons.check,
                                  size: 18,
                                  // Coche foncée sur fond clair, claire sur fond foncé.
                                  color: Color(0xFF000000 | hex).computeLuminance() > 0.5
                                      ? Colors.black87
                                      : Colors.white,
                                )
                              : null,
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          loc.patch3dFilterUniverseLabel,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                      TextButton(
                        onPressed: () => fixture3dStore.setUniverseFilter(null),
                        child: Text(loc.patch3dFilterShowAll),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: universes.map((u) {
                      final selected = fixture3dStore.universeFilter == null ||
                          fixture3dStore.universeFilter!.contains(u);
                      final color = fixture3dStore.colorMode == Fixture3dColorMode.byUniverse
                          ? fixture3dStore.colorFor(
                              fixture3dStore.allFixtures.firstWhere((f) => f.universe == u),
                            )
                          : null;
                      return FilterChip(
                        label: Text(loc.patchUniverseItem(u)),
                        avatar: color != null
                            ? CircleAvatar(backgroundColor: color, radius: 6)
                            : null,
                        selected: selected,
                        onSelected: (isSelected) {
                          final current = fixture3dStore.universeFilter?.toSet() ??
                              universes.toSet();
                          if (isSelected) {
                            current.add(u);
                          } else {
                            current.remove(u);
                          }
                          fixture3dStore.setUniverseFilter(current);
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          loc.patch3dFilterTypeLabel,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                      TextButton(
                        onPressed: () => fixture3dStore.setGroupKeyFilter(null),
                        child: Text(loc.patch3dFilterShowAll),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: groupKeys.map((key) {
                      final selected = fixture3dStore.groupKeyFilter == null ||
                          fixture3dStore.groupKeyFilter!.contains(key);
                      final color = fixture3dStore.colorMode == Fixture3dColorMode.byType
                          ? fixture3dStore.colorFor(
                              fixture3dStore.allFixtures.firstWhere((f) => f.groupKey == key),
                            )
                          : null;
                      return FilterChip(
                        label: Text(fixture3dStore.labelForGroupKey(key)),
                        avatar: color != null
                            ? CircleAvatar(backgroundColor: color, radius: 6)
                            : null,
                        selected: selected,
                        onSelected: (isSelected) {
                          final current = fixture3dStore.groupKeyFilter?.toSet() ??
                              groupKeys.toSet();
                          if (isSelected) {
                            current.add(key);
                          } else {
                            current.remove(key);
                          }
                          fixture3dStore.setGroupKeyFilter(current);
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
