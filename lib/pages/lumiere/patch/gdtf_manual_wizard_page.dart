// Assistant manuel de création GDTF — option complémentaire au flux PDF/IA.
//
// Principe : au lieu de faire lire un PDF par l'IA du Worker, l'utilisateur
// décrit sa machine en 5 étapes (style, fonction, canaux, pixels, structure),
// et cet écran construit directement une liste de DmxMode/DmxChannel avec des
// NOMS DE CANAUX CANONIQUES (Pan, Tilt, Dimmer, Red, Green 1, Pixel 1 Red…)
// déjà reconnus par le moteur d'analyse existant de gdtf_builder_simple_page
// (_mapGdtfAttribute / _parseColorAndInstance / _analyzeMode). Ce moteur
// construit ensuite tout seul la structure Geometry (Base/Yoke/Head/Beam,
// multi-pixel, Wheels, DMXChannels…) EXACTEMENT comme pour un mode extrait
// d'un PDF — donc 100% local, déterministe, sans appel réseau/IA, et déjà
// conforme aux normes GDTF puisqu'on réutilise le moteur existant tel quel.
//
// Résultat : Navigator.pop(List<DmxMode>) — à charger dans _dmxModes puis
// _generateStep = 2 (l'éditeur tableur existant) côté gdtf_builder_simple_page.
//
// IMPORTANT — l10n (24/09/2026) : les libellés AFFICHÉS à l'utilisateur
// (titres, cases à cocher, messages…) passent par AppLocalizations
// (loc.gdtfWizardXxx), dans les 6 langues de l'app. Les noms de canaux
// ENVOYÉS au moteur GDTF (addChannel('Pan'), 'Red', 'Zoom'…) restent en
// revanche volontairement en anglais/canonique, MÊME quand l'app est en
// français ou une autre langue : c'est ce texte précis que
// _mapGdtfAttribute / _parseColorAndInstance (gdtf_builder_simple_page.dart)
// reconnaissent pour construire la structure GDTF. Ne jamais remplacer un de
// ces noms de canal par du texte localisé — seul l'AFFICHAGE doit changer,
// via _displayLabelFor ci-dessous, jamais la valeur envoyée à _buildMode().

import 'package:flutter/material.dart';

import '../../../l10n_gen/app_localizations.dart';
import 'gdtf_builder_simple_page.dart' show DmxChannel, DmxMode;

enum _FixtureStyle { lyre, par, barre }

enum _FixtureFunction { wash, spot, beam }

enum _ColorMode { none, rgb, rgbw, rgbwaUv, cmy, wheel }

enum _Arrangement { linear, matrix, modules }

List<String> _goboSuggestion(AppLocalizations loc) => [
      loc.gdtfWizardSuggestionOpen,
      for (var i = 1; i <= 6; i++) loc.gdtfWizardSuggestionGoboSlot(i),
    ];

List<String> _colorWheelSuggestion(AppLocalizations loc) => [
      loc.gdtfWizardSuggestionOpen,
      for (var i = 1; i <= 5; i++) loc.gdtfWizardSuggestionColorSlot(i),
    ];

List<String> _colorMacroSuggestion(AppLocalizations loc) => [
      loc.gdtfWizardColorWhite,
      loc.gdtfWizardColorRed,
      loc.gdtfWizardColorGreen,
      loc.gdtfWizardColorBlue,
      loc.gdtfWizardColorYellow,
      loc.gdtfWizardColorCyan,
      loc.gdtfWizardColorMagenta,
      loc.gdtfWizardColorRainbow,
    ];

List<String> _shutterSuggestion(AppLocalizations loc) => [
      loc.gdtfWizardSuggestionClosed,
      loc.gdtfWizardSuggestionOpen,
      loc.gdtfWizardStrobeSlowToFast,
      loc.gdtfWizardStrobeRandom,
    ];

// Libellé AFFICHÉ (localisé) pour une clé de canal répétable interne. La
// clé ('red', 'zoom', 'pantilt'…) et `fallback` (c.value, ex : 'Red') sont
// eux le nom canonique envoyé au moteur GDTF — jamais localisés, jamais
// modifiés ici. Cette fonction ne pilote que ce que l'utilisateur VOIT.
String _displayLabelFor(AppLocalizations loc, String key, String fallback) {
  switch (key) {
    case 'dimmer':
      return loc.gdtfWizardChannelDimmer;
    case 'strobe':
      return loc.gdtfWizardChannelStrobe;
    case 'red':
      return loc.gdtfWizardColorRed;
    case 'green':
      return loc.gdtfWizardColorGreen;
    case 'blue':
      return loc.gdtfWizardColorBlue;
    case 'white':
      return loc.gdtfWizardColorWhite;
    case 'amber':
      return loc.gdtfWizardColorAmber;
    case 'uv':
      return loc.gdtfWizardColorUv;
    case 'cyan':
      return loc.gdtfWizardColorCyan;
    case 'magenta':
      return loc.gdtfWizardColorMagenta;
    case 'yellow':
      return loc.gdtfWizardColorYellow;
    case 'pantilt':
      return loc.gdtfWizardChannelPanTiltPerHead;
    case 'zoom':
      return loc.gdtfWizardChannelZoom;
    case 'focus':
      return loc.gdtfWizardChannelFocus;
    case 'iris':
      return loc.gdtfWizardChannelIris;
    case 'frost':
      return loc.gdtfWizardChannelFrost;
    case 'prism':
      return loc.gdtfWizardChannelPrism;
    case 'prismrot':
      return loc.gdtfWizardChannelPrismRot;
    case 'gobo1':
      return loc.gdtfWizardChannelGobo1;
    case 'gobo1rot':
      return loc.gdtfWizardChannelGobo1Rot;
    case 'gobo2':
      return loc.gdtfWizardChannelGobo2;
    case 'gobo2rot':
      return loc.gdtfWizardChannelGobo2Rot;
    case 'cto':
      return loc.gdtfWizardChannelCtoShort;
    default:
      return fallback;
  }
}

// Petite liste de contrôleurs de texte pour l'éditeur de slots visuel : un
// champ par slot (avec sa plage DMX affichée en direct) plutôt qu'une seule
// zone de texte multi-lignes — plus simple à lire/modifier. Le format
// "FROM-TO=Nom;..." envoyé au moteur (_buildFunctionSets) est inchangé.
class _SlotList {
  final List<TextEditingController> controllers = [];

  void setFrom(List<String> names) {
    for (final c in controllers) {
      c.dispose();
    }
    controllers
      ..clear()
      ..addAll(names.map((n) => TextEditingController(text: n)));
  }

  void add() => controllers.add(TextEditingController());

  void removeAt(int i) => controllers.removeAt(i).dispose();

  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
  }

  bool get isEmpty => controllers.isEmpty;

  /// Texte joint (un slot non vide par ligne), au format attendu par
  /// _buildFunctionSets.
  String get text => controllers
      .map((c) => c.text.trim())
      .where((s) => s.isNotEmpty)
      .join('\n');
}

class GdtfManualWizardPage extends StatefulWidget {
  const GdtfManualWizardPage({super.key});

  @override
  State<GdtfManualWizardPage> createState() => _GdtfManualWizardPageState();
}

class _GdtfManualWizardPageState extends State<GdtfManualWizardPage> {
  int _step = 0; // 0..4 = les 5 étapes
  final _pageController = PageController();

  // ── Étape 1 : style ────────────────────────────────────────────────────
  _FixtureStyle? _style;
  bool _hasPanTilt = false;

  // ── Étape 2 : fonction ─────────────────────────────────────────────────
  final Set<_FixtureFunction> _functions = {};

  // ── Étape 3 : canaux ───────────────────────────────────────────────────
  bool _dimmerChecked = true;
  bool _shutterStrobeChecked = false;
  _ColorMode _colorMode = _ColorMode.none;
  bool _ctoChecked = false;
  bool _colorMacroChecked = false;
  bool _gobo1Checked = false;
  bool _gobo1RotChecked = false;
  bool _gobo2Checked = false;
  bool _gobo2RotChecked = false;
  bool _zoomChecked = false;
  bool _focusChecked = false;
  bool _irisChecked = false;
  bool _frostChecked = false;
  bool _prismChecked = false;
  bool _prismRotChecked = false;
  bool _effectsChecked = false;
  bool _resetChecked = true;

  // ── Étape 4 : pixels ───────────────────────────────────────────────────
  bool _hasMultiplePixels = false;
  int _pixelCount = 8;
  // Sous-ensemble des canaux "répétables" (couleur/dimmer/strobe) qui
  // doivent se répéter par pixel plutôt que rester un canal global unique.
  final Set<String> _perPixelRepeat = {
    'dimmer',
    'red',
    'green',
    'blue',
    'white',
    'amber',
    'uv',
    'cyan',
    'magenta',
    'yellow',
    'strobe',
  };

  // ── Étape 5 : structure ────────────────────────────────────────────────
  _Arrangement _arrangement = _Arrangement.linear;
  int _rows = 1;
  int _cols = 8;
  final _modeNameCtrl = TextEditingController();
  bool _modeNameInitialized = false;
  final _gobo1Slots = _SlotList();
  final _gobo2Slots = _SlotList();
  final _colorWheelSlots = _SlotList();
  final _colorMacroSlots = _SlotList();
  final _shutterSlots = _SlotList();

  String? _validationError;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Pré-remplit le nom de mode par défaut une seule fois, dès que
    // AppLocalizations est disponible (pas encore le cas dans initState).
    if (!_modeNameInitialized) {
      _modeNameInitialized = true;
      _modeNameCtrl.text = AppLocalizations.of(context).gdtfWizardDefaultModeName;
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _modeNameCtrl.dispose();
    _gobo1Slots.dispose();
    _gobo2Slots.dispose();
    _colorWheelSlots.dispose();
    _colorMacroSlots.dispose();
    _shutterSlots.dispose();
    super.dispose();
  }

  // Construit un texte "FROM-TO=Nom;FROM-TO=Nom;..." reconnu par le
  // moteur existant (_parseChannelSets) à partir d'une liste de noms de
  // slots (un par ligne dans le champ), répartis uniformément sur la
  // plage DMX 0-255. Vide si l'utilisateur n'a rien renseigné (le canal
  // reste alors valide GDTF, juste sans slots nommés).
  String _buildFunctionSets(String raw) {
    final lines = raw
        .split('\n')
        .map((l) => l.trim())
        .where((l) => l.isNotEmpty)
        .toList();
    if (lines.isEmpty) {
      return '';
    }
    final n = lines.length;
    final parts = <String>[];
    for (var i = 0; i < n; i++) {
      final from = (i * 256 / n).floor();
      final to = (((i + 1) * 256 / n).floor() - 1).clamp(from, 255);
      parts.add('$from-$to=${lines[i]}');
    }
    return parts.join(';');
  }

  // ─────────────────────────────────────────────────────────────────────
  // Couleurs disponibles pour le mode couleur choisi à l'étape 3.
  // clé interne → (Nom canonique GDTF, libellé affiché)
  // NOTE l10n : le 2e élément (Red/Green/Blue…) est le nom canonique envoyé
  // au moteur GDTF — jamais localisé. L'affichage passe par
  // _displayLabelFor, pas par cette valeur directement.
  // ─────────────────────────────────────────────────────────────────────
  List<MapEntry<String, String>> get _activeColorChannels {
    switch (_colorMode) {
      case _ColorMode.none:
        return const [];
      case _ColorMode.rgb:
        return const [
          MapEntry('red', 'Red'),
          MapEntry('green', 'Green'),
          MapEntry('blue', 'Blue'),
        ];
      case _ColorMode.rgbw:
        return const [
          MapEntry('red', 'Red'),
          MapEntry('green', 'Green'),
          MapEntry('blue', 'Blue'),
          MapEntry('white', 'White'),
        ];
      case _ColorMode.rgbwaUv:
        return const [
          MapEntry('red', 'Red'),
          MapEntry('green', 'Green'),
          MapEntry('blue', 'Blue'),
          MapEntry('white', 'White'),
          MapEntry('amber', 'Amber'),
          MapEntry('uv', 'UV'),
        ];
      case _ColorMode.cmy:
        return const [
          MapEntry('cyan', 'Cyan'),
          MapEntry('magenta', 'Magenta'),
          MapEntry('yellow', 'Yellow'),
        ];
      case _ColorMode.wheel:
        // La roue de couleurs n'est jamais "par pixel" : un seul mécanisme
        // pour toute la machine.
        return const [];
    }
  }

  bool get _colorIsPerPixelCapable =>
      _colorMode != _ColorMode.none && _colorMode != _ColorMode.wheel;

  // Canaux "répétables par pixel" actuellement disponibles (cochés à
  // l'étape 3) : dimmer, strobe, + les couleurs additives/soustractives.
  // NOTE l10n : la valeur (2e élément du MapEntry) est le nom canonique
  // envoyé au moteur GDTF — jamais localisée. L'affichage passe par
  // _displayLabelFor(loc, key, value).
  List<MapEntry<String, String>> get _repeatableChannels {
    final list = <MapEntry<String, String>>[];
    if (_dimmerChecked) list.add(const MapEntry('dimmer', 'Dimmer'));
    if (_shutterStrobeChecked) {
      list.add(const MapEntry('strobe', 'Obturateur / Strobe'));
    }
    if (_colorIsPerPixelCapable) list.addAll(_activeColorChannels);
    // Position : utile pour une fixture à plusieurs têtes mobiles
    // indépendantes (multi-head beam type JDC1/Chameleon), chacune avec
    // son propre Pan/Tilt 16 bits.
    if (_hasPanTilt) {
      list.add(const MapEntry('pantilt', 'Pan/Tilt (par tête)'));
    }
    // Faisceau/gobos : utile pour un module indépendant complet
    // (type JDC1) où chaque tête a son propre zoom/gobo/etc.
    if (_zoomChecked) list.add(const MapEntry('zoom', 'Zoom'));
    if (_focusChecked) list.add(const MapEntry('focus', 'Focus'));
    if (_irisChecked) list.add(const MapEntry('iris', 'Iris'));
    if (_frostChecked) list.add(const MapEntry('frost', 'Frost'));
    if (_prismChecked) list.add(const MapEntry('prism', 'Prism'));
    if (_prismRotChecked) {
      list.add(const MapEntry('prismrot', 'Prism Rotation'));
    }
    if (_gobo1Checked) list.add(const MapEntry('gobo1', 'Gobo Wheel 1'));
    if (_gobo1RotChecked) {
      list.add(const MapEntry('gobo1rot', 'Gobo Wheel 1 Rotation'));
    }
    if (_gobo2Checked) list.add(const MapEntry('gobo2', 'Gobo Wheel 2'));
    if (_gobo2RotChecked) {
      list.add(const MapEntry('gobo2rot', 'Gobo Wheel 2 Rotation'));
    }
    if (_ctoChecked) list.add(const MapEntry('cto', 'CTO'));
    return list;
  }

  int get _effectivePixelCount {
    if (!_hasMultiplePixels) {
      return 1;
    }
    if (_arrangement == _Arrangement.matrix) {
      final n = _rows * _cols;
      return n > 0 ? n : _pixelCount;
    }
    return _pixelCount;
  }

  void _goNext() {
    final loc = AppLocalizations.of(context);
    final error = _validateStep(_step, loc);
    if (error != null) {
      setState(() => _validationError = error);
      return;
    }
    setState(() => _validationError = null);
    if (_step == 4) {
      _finish();
      return;
    }
    setState(() => _step += 1);
    _pageController.animateToPage(_step,
        duration: const Duration(milliseconds: 260), curve: Curves.easeOut);
  }

  void _goBack() {
    if (_step == 0) {
      Navigator.of(context).pop();
      return;
    }
    setState(() {
      _step -= 1;
      _validationError = null;
    });
    _pageController.animateToPage(_step,
        duration: const Duration(milliseconds: 260), curve: Curves.easeOut);
  }

  String? _validateStep(int step, AppLocalizations loc) {
    switch (step) {
      case 0:
        if (_style == null) {
          return loc.gdtfWizardErrStyle;
        }
        return null;
      case 1:
        if (_functions.isEmpty) {
          return loc.gdtfWizardErrFunction;
        }
        return null;
      case 2:
        final anyChecked = _dimmerChecked ||
            _shutterStrobeChecked ||
            _colorMode != _ColorMode.none ||
            _ctoChecked ||
            _colorMacroChecked ||
            _gobo1Checked ||
            _gobo2Checked ||
            _zoomChecked ||
            _focusChecked ||
            _irisChecked ||
            _frostChecked ||
            _prismChecked ||
            _effectsChecked;
        if (!anyChecked) {
          return loc.gdtfWizardErrChannels;
        }
        return null;
      case 3:
        if (_hasMultiplePixels) {
          if (_pixelCount < 2 && _arrangement != _Arrangement.matrix) {
            return loc.gdtfWizardErrPixelCount;
          }
          // "pantilt" compte double : il génère 2 vrais canaux DMX par tête
          // (Pan + Tilt, chacun fusionné avec son Fine) — donc une fixture
          // multi-head qui n'a QUE Pan/Tilt par tête (pas de couleur/dimmer
          // par tête, ex : plusieurs miroirs motorisés) doit rester valide.
          final channelCount = _repeatableChannels.fold<int>(
              0, (sum, c) => sum + (c.key == 'pantilt' ? 2 : 1));
          if (channelCount < 2) {
            return loc.gdtfWizardErrRepeatCount;
          }
        }
        return null;
      case 4:
        if (_arrangement == _Arrangement.matrix && (_rows < 1 || _cols < 1)) {
          return loc.gdtfWizardErrRowsCols;
        }
        if (_modeNameCtrl.text.trim().isEmpty) {
          return loc.gdtfWizardErrModeName;
        }
        return null;
    }
    return null;
  }

  // ─────────────────────────────────────────────────────────────────────
  // Construction de la liste de canaux à partir des réponses du wizard.
  // NOTE l10n : tous les noms passés à addChannel() ci-dessous sont des
  // noms de canaux CANONIQUES reconnus par le moteur GDTF partagé
  // (_mapGdtfAttribute / _parseColorAndInstance dans
  // gdtf_builder_simple_page.dart) — ils restent en anglais quelle que
  // soit la langue de l'app, et ne doivent JAMAIS être remplacés par du
  // texte localisé (loc.xxx). Seul l'affichage (les widgets plus bas dans
  // ce fichier) est localisé.
  // ─────────────────────────────────────────────────────────────────────
  DmxMode _buildMode() {
    final channels = <DmxChannel>[];
    var n = 1;

    void addChannel(String name,
        {String resolution = '8bit', String function = ''}) {
      channels.add(DmxChannel(
        number: n++,
        name: name,
        function: function,
        resolution: resolution,
      ));
    }

    final repeatKeys = _hasMultiplePixels
        ? _repeatableChannels
            .map((e) => e.key)
            .where(_perPixelRepeat.contains)
            .toSet()
        : <String>{};

    // 1) Dimmer global (si pas répété par pixel).
    if (_dimmerChecked && !repeatKeys.contains('dimmer')) {
      addChannel('Dimmer');
    }

    // 2) Position (Pan/Tilt en 16 bits — norme GDTF pour un moteur de lyre),
    //    sauf si répété par tête (fixture multi-head, cf. repeatKeys ci-dessous).
    if (_hasPanTilt && !repeatKeys.contains('pantilt')) {
      addChannel('Pan', resolution: '16bit-coarse');
      addChannel('Pan Fine', resolution: '16bit-fine');
      addChannel('Tilt', resolution: '16bit-coarse');
      addChannel('Tilt Fine', resolution: '16bit-fine');
    }

    // 3) Obturateur / Strobe global (si pas répété par pixel).
    if (_shutterStrobeChecked && !repeatKeys.contains('strobe')) {
      addChannel('Shutter Strobe',
          function: _buildFunctionSets(_shutterSlots.text));
    }

    // 4) Couleur — roue de couleurs (jamais par pixel), ou couleurs
    //    additives/soustractives globales si non réparties par pixel.
    if (_colorMode == _ColorMode.wheel) {
      addChannel('Color Wheel 1',
          function: _buildFunctionSets(_colorWheelSlots.text));
    } else if (_colorIsPerPixelCapable) {
      for (final c in _activeColorChannels) {
        if (!repeatKeys.contains(c.key)) addChannel(c.value);
      }
    }
    if (_ctoChecked && !repeatKeys.contains('cto')) addChannel('CTO');
    if (_colorMacroChecked) {
      addChannel('Color Macro',
          function: _buildFunctionSets(_colorMacroSlots.text));
    }

    // 5) Faisceau (global, sauf si répété par pixel/module).
    if (_zoomChecked && !repeatKeys.contains('zoom')) addChannel('Zoom');
    if (_focusChecked && !repeatKeys.contains('focus')) addChannel('Focus');
    if (_irisChecked && !repeatKeys.contains('iris')) addChannel('Iris');
    if (_frostChecked && !repeatKeys.contains('frost')) addChannel('Frost');
    if (_prismChecked && !repeatKeys.contains('prism')) addChannel('Prism');
    if (_prismRotChecked && !repeatKeys.contains('prismrot')) {
      addChannel('Prism Rotation');
    }

    // 6) Gobos (globaux, sauf si répétés par pixel/module).
    if (_gobo1Checked && !repeatKeys.contains('gobo1')) {
      addChannel('Gobo Wheel 1',
          function: _buildFunctionSets(_gobo1Slots.text));
    }
    if (_gobo1RotChecked && !repeatKeys.contains('gobo1rot')) {
      addChannel('Gobo Wheel 1 Rotation');
    }
    if (_gobo2Checked && !repeatKeys.contains('gobo2')) {
      addChannel('Gobo Wheel 2',
          function: _buildFunctionSets(_gobo2Slots.text));
    }
    if (_gobo2RotChecked && !repeatKeys.contains('gobo2rot')) {
      addChannel('Gobo Wheel 2 Rotation');
    }

    // 7) Effets / macros.
    if (_effectsChecked) addChannel('Effects');

    // 8) Reset.
    if (_resetChecked) addChannel('Reset');

    // 9) Canaux répétés par pixel — préfixe "Pixel N " reconnu par le
    //    parseur de noms (_parseColorAndInstance) pour TOUS les attributs,
    //    couleur ou non (Dimmer, Strobe compris).
    if (_hasMultiplePixels) {
      final count = _effectivePixelCount;
      final repeatables =
          _repeatableChannels.where((c) => _perPixelRepeat.contains(c.key)).toList();
      for (var i = 1; i <= count; i++) {
        for (final c in repeatables) {
          // Pan/Tilt par tête : 4 canaux 16 bits (coarse+fine), pas un
          // simple canal 8 bits comme les autres attributs répétables.
          if (c.key == 'pantilt') {
            addChannel('Pixel $i Pan', resolution: '16bit-coarse');
            addChannel('Pixel $i Pan Fine', resolution: '16bit-fine');
            addChannel('Pixel $i Tilt', resolution: '16bit-coarse');
            addChannel('Pixel $i Tilt Fine', resolution: '16bit-fine');
            continue;
          }
          final label = c.key == 'dimmer'
              ? 'Dimmer'
              : c.key == 'strobe'
                  ? 'Strobe'
                  : c.value;
          final fn = c.key == 'gobo1'
              ? _buildFunctionSets(_gobo1Slots.text)
              : c.key == 'gobo2'
                  ? _buildFunctionSets(_gobo2Slots.text)
                  : '';
          addChannel('Pixel $i $label', function: fn);
        }
      }
    }

    return DmxMode(name: _modeNameCtrl.text.trim(), channels: channels);
  }

  void _finish() {
    final mode = _buildMode();
    Navigator.of(context).pop<List<DmxMode>>([mode]);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final titles = [
      loc.gdtfWizardStepTitleStyle,
      loc.gdtfWizardStepTitleFunction,
      loc.gdtfWizardStepTitleChannels,
      loc.gdtfWizardStepTitlePixels,
      loc.gdtfWizardStepTitleStructure,
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(loc.gdtfWizardAppBarTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _goBack,
        ),
      ),
      body: Column(
        children: [
          _buildStepHeader(titles, loc),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildStepStyle(loc),
                _buildStepFunction(loc),
                _buildStepChannels(loc),
                _buildStepPixels(loc),
                _buildStepStructure(loc),
              ],
            ),
          ),
          _buildBottomBar(loc),
        ],
      ),
    );
  }

  Widget _buildStepHeader(List<String> titles, AppLocalizations loc) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(titles.length, (i) {
              final active = i <= _step;
              return Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: i == titles.length - 1 ? 0 : 4),
                  height: 4,
                  decoration: BoxDecoration(
                    color: active
                        ? _stepColor(_step)
                        : Colors.white.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 10),
          Text(
            loc.gdtfWizardStepHeader(_step + 1, titles[_step]),
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Color _stepColor(int step) {
    const colors = [
      Color(0xFF4FC3F7), // style — bleu
      Color(0xFFBA68C8), // fonction — violet
      Color(0xFF4DB6AC), // canaux — teal
      Color(0xFFFFB74D), // pixels — orange
      Color(0xFFF06292), // structure — rose
    ];
    return colors[step];
  }

  Widget _sectionTitle(String text, {IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 4),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, size: 18, color: _stepColor(_step)),
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 13,
              color: Colors.white70,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }

  // ── Étape 1 : Style de projecteur ──────────────────────────────────────
  Widget _buildStepStyle(AppLocalizations loc) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
      children: [
        Text(
          loc.gdtfWizardStyleIntro,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
        const SizedBox(height: 16),
        _styleCard(
          _FixtureStyle.lyre,
          loc.gdtfWizardStyleLyreTitle,
          loc.gdtfWizardStyleLyreSubtitle,
          Icons.settings_input_antenna,
        ),
        const SizedBox(height: 12),
        _styleCard(
          _FixtureStyle.par,
          loc.gdtfWizardStyleParTitle,
          loc.gdtfWizardStyleParSubtitle,
          Icons.wb_incandescent_outlined,
        ),
        const SizedBox(height: 12),
        _styleCard(
          _FixtureStyle.barre,
          loc.gdtfWizardStyleBarreTitle,
          loc.gdtfWizardStyleBarreSubtitle,
          Icons.view_week_outlined,
        ),
        const SizedBox(height: 20),
        if (_style != null)
          CheckboxListTile(
            value: _hasPanTilt,
            onChanged: (v) => setState(() => _hasPanTilt = v ?? false),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            title: Text(loc.gdtfWizardPanTiltCheckTitle,
                style: const TextStyle(color: Colors.white, fontSize: 14)),
            subtitle: Text(
              loc.gdtfWizardPanTiltCheckSubtitle,
              style: const TextStyle(color: Colors.white54, fontSize: 12),
            ),
          ),
      ],
    );
  }

  Widget _styleCard(
      _FixtureStyle style, String title, String subtitle, IconData icon) {
    final selected = _style == style;
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => setState(() {
        _style = style;
        _hasPanTilt = style == _FixtureStyle.lyre;
      }),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF161622),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected
                ? _stepColor(0)
                : Colors.white.withValues(alpha: 0.08),
            width: selected ? 1.6 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: (selected ? _stepColor(0) : Colors.white)
                    .withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon,
                  color: selected ? _stepColor(0) : Colors.white70, size: 24),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 14)),
                  const SizedBox(height: 2),
                  Text(subtitle,
                      style:
                          const TextStyle(color: Colors.white54, fontSize: 12)),
                ],
              ),
            ),
            if (selected)
              Icon(Icons.check_circle, color: _stepColor(0), size: 22),
          ],
        ),
      ),
    );
  }

  // ── Étape 2 : Fonction ─────────────────────────────────────────────────
  Widget _buildStepFunction(AppLocalizations loc) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
      children: [
        Text(
          loc.gdtfWizardFunctionIntro,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _functionChip(_FixtureFunction.wash, loc.gdtfWizardFunctionWash,
                Icons.gradient),
            _functionChip(_FixtureFunction.spot, loc.gdtfWizardFunctionSpot,
                Icons.center_focus_strong),
            _functionChip(
                _FixtureFunction.beam, loc.gdtfWizardFunctionBeam, Icons.flare),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            loc.gdtfWizardFunctionHint,
            style: const TextStyle(color: Colors.white54, fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _functionChip(_FixtureFunction f, String label, IconData icon) {
    final selected = _functions.contains(f);
    return FilterChip(
      selected: selected,
      showCheckmark: false,
      avatar: Icon(icon,
          size: 18, color: selected ? Colors.black : Colors.white70),
      label: Text(label),
      labelStyle: TextStyle(
        color: selected ? Colors.black : Colors.white70,
        fontWeight: FontWeight.w600,
      ),
      backgroundColor: const Color(0xFF161622),
      selectedColor: _stepColor(1),
      onSelected: (v) {
        setState(() {
          if (v) {
            _functions.add(f);
            _applyFunctionPresets();
          } else {
            _functions.remove(f);
          }
        });
      },
    );
  }

  void _applyFunctionPresets() {
    if (_functions.contains(_FixtureFunction.wash)) {
      _zoomChecked = true;
      _frostChecked = true;
      if (_colorMode == _ColorMode.none) _colorMode = _ColorMode.rgbw;
    }
    if (_functions.contains(_FixtureFunction.spot)) {
      _gobo1Checked = true;
      _focusChecked = true;
      _prismChecked = true;
      _zoomChecked = true;
    }
    if (_functions.contains(_FixtureFunction.beam)) {
      _shutterStrobeChecked = true;
      if (_colorMode == _ColorMode.none) _colorMode = _ColorMode.wheel;
    }
  }

  // ── Étape 3 : Canaux ───────────────────────────────────────────────────
  Widget _buildStepChannels(AppLocalizations loc) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
      children: [
        Text(
          loc.gdtfWizardChannelsIntro,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
        const SizedBox(height: 12),
        _sectionTitle(loc.gdtfWizardSectionIntensity,
            icon: Icons.brightness_6_outlined),
        _channelCheck(loc.gdtfWizardChannelDimmer, _dimmerChecked,
            (v) => setState(() => _dimmerChecked = v)),
        _channelCheck(loc.gdtfWizardChannelStrobe, _shutterStrobeChecked,
            (v) => setState(() => _shutterStrobeChecked = v)),
        if (_shutterStrobeChecked)
          _slotsEditor(loc, _shutterSlots, _shutterSuggestion(loc)),
        _sectionTitle(loc.gdtfWizardSectionColor, icon: Icons.palette_outlined),
        _colorModeSelector(loc),
        if (_colorMode == _ColorMode.wheel)
          _slotsEditor(loc, _colorWheelSlots, _colorWheelSuggestion(loc)),
        const SizedBox(height: 4),
        _channelCheck(loc.gdtfWizardChannelCto, _ctoChecked,
            (v) => setState(() => _ctoChecked = v)),
        _channelCheck(loc.gdtfWizardChannelColorMacro, _colorMacroChecked,
            (v) => setState(() => _colorMacroChecked = v)),
        if (_colorMacroChecked)
          _slotsEditor(loc, _colorMacroSlots, _colorMacroSuggestion(loc)),
        if (_hasPanTilt) ...[
          _sectionTitle(loc.gdtfWizardSectionPosition, icon: Icons.open_with),
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              loc.gdtfWizardPanTiltNote,
              style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.45), fontSize: 12),
            ),
          ),
        ],
        _sectionTitle(loc.gdtfWizardSectionBeamShaping,
            icon: Icons.wb_iridescent_outlined),
        _channelCheck(loc.gdtfWizardChannelZoom, _zoomChecked,
            (v) => setState(() => _zoomChecked = v)),
        _channelCheck(loc.gdtfWizardChannelFocus, _focusChecked,
            (v) => setState(() => _focusChecked = v)),
        _channelCheck(loc.gdtfWizardChannelIris, _irisChecked,
            (v) => setState(() => _irisChecked = v)),
        _channelCheck(loc.gdtfWizardChannelFrost, _frostChecked,
            (v) => setState(() => _frostChecked = v)),
        _channelCheck(loc.gdtfWizardChannelPrism, _prismChecked,
            (v) => setState(() => _prismChecked = v)),
        _channelCheck(loc.gdtfWizardChannelPrismRot, _prismRotChecked,
            (v) => setState(() => _prismRotChecked = v)),
        _sectionTitle(loc.gdtfWizardSectionGobos, icon: Icons.blur_circular),
        _channelCheck(loc.gdtfWizardChannelGobo1, _gobo1Checked,
            (v) => setState(() => _gobo1Checked = v)),
        if (_gobo1Checked) _slotsEditor(loc, _gobo1Slots, _goboSuggestion(loc)),
        _channelCheck(loc.gdtfWizardChannelGobo1Rot, _gobo1RotChecked,
            (v) => setState(() => _gobo1RotChecked = v)),
        _channelCheck(loc.gdtfWizardChannelGobo2, _gobo2Checked,
            (v) => setState(() => _gobo2Checked = v)),
        if (_gobo2Checked) _slotsEditor(loc, _gobo2Slots, _goboSuggestion(loc)),
        _channelCheck(loc.gdtfWizardChannelGobo2Rot, _gobo2RotChecked,
            (v) => setState(() => _gobo2RotChecked = v)),
        _sectionTitle(loc.gdtfWizardSectionEffectsControl, icon: Icons.tune),
        _channelCheck(loc.gdtfWizardChannelEffects, _effectsChecked,
            (v) => setState(() => _effectsChecked = v)),
        _channelCheck(loc.gdtfWizardChannelReset, _resetChecked,
            (v) => setState(() => _resetChecked = v)),
      ],
    );
  }

  Widget _slotsEditor(
      AppLocalizations loc, _SlotList slots, List<String> suggestion) {
    final n = slots.controllers.length;
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 4, bottom: 10, top: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (n == 0)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(loc.gdtfWizardSlotsEmptyHint,
                  style: const TextStyle(color: Colors.white24, fontSize: 11.5)),
            ),
          for (var i = 0; i < n; i++) _slotRow(loc, slots, i, n),
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: [
              ActionChip(
                avatar: const Icon(Icons.add, size: 15, color: Colors.white70),
                label: Text(loc.gdtfWizardSlotsAddButton,
                    style: const TextStyle(fontSize: 11.5, color: Colors.white70)),
                backgroundColor: const Color(0xFF161622),
                visualDensity: VisualDensity.compact,
                onPressed: () => setState(slots.add),
              ),
              ActionChip(
                avatar: const Icon(Icons.auto_awesome,
                    size: 14, color: Colors.white70),
                label: Text(loc.gdtfWizardSlotsTooltip,
                    style: const TextStyle(fontSize: 11.5, color: Colors.white70)),
                backgroundColor: const Color(0xFF161622),
                visualDensity: VisualDensity.compact,
                onPressed: () => setState(() => slots.setFrom(suggestion)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Une ligne de l'éditeur de slots visuel : index, champ de nom, plage DMX
  // calculée en direct (même répartition uniforme que _buildFunctionSets),
  // bouton de suppression.
  Widget _slotRow(AppLocalizations loc, _SlotList slots, int i, int n) {
    final from = (i * 256 / n).floor();
    final to = (((i + 1) * 256 / n).floor() - 1).clamp(from, 255);
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Container(
            width: 22,
            height: 22,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              shape: BoxShape.circle,
            ),
            child: Text('${i + 1}',
                style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 11,
                    fontWeight: FontWeight.w600)),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: slots.controllers[i],
              style: const TextStyle(color: Colors.white, fontSize: 12.5),
              decoration: InputDecoration(
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                hintText: loc.gdtfWizardSlotsRowHint,
                hintStyle: const TextStyle(color: Colors.white24, fontSize: 11.5),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text('$from-$to',
                style: const TextStyle(color: Colors.white38, fontSize: 10.5)),
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 16, color: Colors.white38),
            tooltip: loc.gdtfWizardSlotsRemoveTooltip,
            onPressed: () => setState(() => slots.removeAt(i)),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
          ),
        ],
      ),
    );
  }

  Widget _channelCheck(String label, bool value, ValueChanged<bool> onChanged) {
    return CheckboxListTile(
      value: value,
      onChanged: (v) => onChanged(v ?? false),
      controlAffinity: ListTileControlAffinity.leading,
      dense: true,
      contentPadding: EdgeInsets.zero,
      activeColor: _stepColor(2),
      title: Text(label, style: const TextStyle(color: Colors.white, fontSize: 14)),
    );
  }

  Widget _colorModeSelector(AppLocalizations loc) {
    final options = <(_ColorMode, String)>[
      (_ColorMode.none, loc.gdtfWizardColorModeNone),
      (_ColorMode.rgb, loc.gdtfWizardColorModeRgb),
      (_ColorMode.rgbw, loc.gdtfWizardColorModeRgbw),
      (_ColorMode.rgbwaUv, loc.gdtfWizardColorModeRgbwaUv),
      (_ColorMode.cmy, loc.gdtfWizardColorModeCmy),
      (_ColorMode.wheel, loc.gdtfWizardColorModeWheel),
    ];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options.map((o) {
        final selected = _colorMode == o.$1;
        return ChoiceChip(
          label: Text(o.$2),
          selected: selected,
          labelStyle: TextStyle(
            color: selected ? Colors.black : Colors.white70,
            fontSize: 12.5,
            fontWeight: FontWeight.w600,
          ),
          backgroundColor: const Color(0xFF161622),
          selectedColor: _stepColor(2),
          onSelected: (_) => setState(() => _colorMode = o.$1),
        );
      }).toList(),
    );
  }

  // ── Étape 4 : Pixels ───────────────────────────────────────────────────
  Widget _buildStepPixels(AppLocalizations loc) {
    final repeatables = _repeatableChannels;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
      children: [
        Text(
          loc.gdtfWizardPixelsIntro,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
        const SizedBox(height: 12),
        SwitchListTile(
          value: _hasMultiplePixels,
          onChanged: (v) => setState(() => _hasMultiplePixels = v),
          activeThumbColor: _stepColor(3),
          contentPadding: EdgeInsets.zero,
          title: Text(loc.gdtfWizardMultiplePixelsTitle,
              style: const TextStyle(color: Colors.white, fontSize: 14)),
          subtitle: Text(
            loc.gdtfWizardMultiplePixelsSubtitle,
            style: const TextStyle(color: Colors.white54, fontSize: 12),
          ),
        ),
        if (_hasMultiplePixels) ...[
          const SizedBox(height: 16),
          _sectionTitle(loc.gdtfWizardSectionPixelCount,
              icon: Icons.grid_view_rounded),
          Row(
            children: [
              Expanded(
                child: Slider(
                  value: _pixelCount.toDouble().clamp(2, 96).toDouble(),
                  min: 2,
                  max: 96,
                  divisions: 94,
                  activeColor: _stepColor(3),
                  label: '$_pixelCount',
                  onChanged: (v) => setState(() => _pixelCount = v.round()),
                ),
              ),
              SizedBox(
                width: 48,
                child: Text('$_pixelCount',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _sectionTitle(loc.gdtfWizardSectionPixelContent,
              icon: Icons.dashboard_customize_outlined),
          if (repeatables.isEmpty)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                loc.gdtfWizardNoRepeatableChannels,
                style: const TextStyle(color: Colors.orange, fontSize: 12.5),
              ),
            )
          else
            Column(
              children: repeatables.map((c) {
                final checked = _perPixelRepeat.contains(c.key);
                final displayLabel = _displayLabelFor(loc, c.key, c.value);
                return CheckboxListTile(
                  value: checked,
                  onChanged: (v) => setState(() {
                    if (v == true) {
                      _perPixelRepeat.add(c.key);
                    } else {
                      _perPixelRepeat.remove(c.key);
                    }
                  }),
                  controlAffinity: ListTileControlAffinity.leading,
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  activeColor: _stepColor(3),
                  title: Text(displayLabel,
                      style: const TextStyle(color: Colors.white, fontSize: 14)),
                  subtitle: Text(
                    checked
                        ? loc.gdtfWizardRepeatPerPixelSubtitle(displayLabel)
                        : loc.gdtfWizardRepeatGlobalSubtitle,
                    style: const TextStyle(color: Colors.white38, fontSize: 11.5),
                  ),
                );
              }).toList(),
            ),
        ],
      ],
    );
  }

  // ── Étape 5 : Structure multi-instance ─────────────────────────────────
  Widget _buildStepStructure(AppLocalizations loc) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
      children: [
        TextField(
          controller: _modeNameCtrl,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: loc.gdtfWizardModeNameLabel,
            hintText: loc.gdtfWizardModeNameHint,
            border: const OutlineInputBorder(),
            labelStyle: const TextStyle(color: Colors.white54),
          ),
        ),
        const SizedBox(height: 20),
        if (!_hasMultiplePixels)
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              loc.gdtfWizardSingleOutputNote,
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          )
        else ...[
          _sectionTitle(loc.gdtfWizardSectionLayout, icon: Icons.dashboard_outlined),
          _arrangementCard(
            _Arrangement.linear,
            loc.gdtfWizardArrangementLinearTitle,
            loc.gdtfWizardArrangementLinearSubtitle(_pixelCount),
            Icons.view_week_outlined,
          ),
          const SizedBox(height: 10),
          _arrangementCard(
            _Arrangement.matrix,
            loc.gdtfWizardArrangementMatrixTitle,
            loc.gdtfWizardArrangementMatrixSubtitle,
            Icons.grid_on_outlined,
          ),
          const SizedBox(height: 10),
          _arrangementCard(
            _Arrangement.modules,
            loc.gdtfWizardArrangementModulesTitle,
            loc.gdtfWizardArrangementModulesSubtitle,
            Icons.hub_outlined,
          ),
          if (_arrangement == _Arrangement.matrix) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: _numberField(loc.gdtfWizardRowsLabel, _rows,
                        (v) => setState(() => _rows = v))),
                const SizedBox(width: 12),
                Expanded(
                    child: _numberField(loc.gdtfWizardColsLabel, _cols,
                        (v) => setState(() => _cols = v))),
              ],
            ),
            const SizedBox(height: 8),
            Text(loc.gdtfWizardMatrixTotal(_rows * _cols),
                style: const TextStyle(color: Colors.white54, fontSize: 12)),
          ],
          if (_arrangement == _Arrangement.modules) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _stepColor(4).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: _stepColor(4).withValues(alpha: 0.4)),
              ),
              child: Text(
                loc.gdtfWizardModulesNote,
                style: TextStyle(color: _stepColor(4), fontSize: 12.5),
              ),
            ),
          ],
        ],
      ],
    );
  }

  Widget _numberField(String label, int value, ValueChanged<int> onChanged) {
    return TextFormField(
      initialValue: value.toString(),
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white54),
        border: const OutlineInputBorder(),
      ),
      onChanged: (v) => onChanged(int.tryParse(v) ?? value),
    );
  }

  Widget _arrangementCard(
      _Arrangement arrangement, String title, String subtitle, IconData icon) {
    final selected = _arrangement == arrangement;
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () => setState(() => _arrangement = arrangement),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF161622),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? _stepColor(4) : Colors.white.withValues(alpha: 0.08),
            width: selected ? 1.6 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: selected ? _stepColor(4) : Colors.white70, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13.5)),
                  Text(subtitle,
                      style: const TextStyle(color: Colors.white54, fontSize: 11.5)),
                ],
              ),
            ),
            if (selected) Icon(Icons.check_circle, color: _stepColor(4), size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar(AppLocalizations loc) {
    return SafeArea(
      top: false,
      minimum: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 8),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border(top: BorderSide(color: Colors.white.withValues(alpha: 0.08))),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_validationError != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(_validationError!,
                    style: const TextStyle(color: Colors.redAccent, fontSize: 12.5)),
              ),
            Row(
              children: [
                OutlinedButton(
                  onPressed: _goBack,
                  child: Text(_step == 0 ? loc.gdtfWizardCancel : loc.gdtfWizardBack),
                ),
                const Spacer(),
                FilledButton.icon(
                  onPressed: _goNext,
                  icon: Icon(_step == 4 ? Icons.check : Icons.arrow_forward),
                  label: Text(_step == 4
                      ? loc.gdtfWizardValidateAndEdit
                      : loc.gdtfWizardNext),
                  style: FilledButton.styleFrom(backgroundColor: _stepColor(_step)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
