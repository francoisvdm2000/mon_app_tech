// lib/pages/lumiere/diaph/diaph_page.dart
//
// « Diaph d'une machine » : en télé on éclaire en diaph, pas en lux.
// Machine (catalogue, lumens + angle, ou lux constructeur) + distance +
// caméra (broadcast « F à 2000 lx » ou ISO / vitesse) → diaph au centre.

import 'package:flutter/material.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../../about/about_favorites.dart';
import '../../shared/result_reveal.dart';
import '../fixtures/fixture_compare_engine.dart' show zoomRangeOf;
import '../fixtures/fixture_hybrid_repository.dart';
import '../fixtures/fixture_models.dart';
import 'diaph_engine.dart';

const _kAccent = Color(0xFFFFB703);
const _kCard = Color(0xFF161622);
const _kWarn = Color(0xFFFF6B6B);

/// Sensibilités constructeur vérifiées (fiches techniques, 2000 lx, 89,9 %).
const _kBroadcastPresets = <(String, double)>[
  ('Sony HDC-3500 · 50 Hz', 11),
  ('Sony HDC-3500 · 59.94 Hz', 10),
  ('Grass Valley LDX 135 / 150', 11),
];

const _kGains = <double>[-3, 0, 3, 6, 9, 12];
const _kNds = <(double, String?)>[
  (0, null), // Clear (traduit)
  (2, '1/4'),
  (4, '1/16'),
  (6, '1/64'),
];

enum _CamMode { broadcast, iso }

class DiaphPage extends StatefulWidget {
  const DiaphPage({super.key});

  @override
  State<DiaphPage> createState() => _DiaphPageState();
}

class _DiaphPageState extends State<DiaphPage> {
  final FixtureHybridRepository _repo = FixtureHybridRepository();
  FixtureCatalog? _catalog;

  final _search = TextEditingController();
  final _lumens = TextEditingController();
  final _angle = TextEditingController();
  final _makerLux = TextEditingController();
  final _makerDist = TextEditingController(text: '5');
  final _distance = TextEditingController(text: '8');
  final _refF = TextEditingController(text: '11');
  final _iso = TextEditingController(text: '800');
  final _fps = TextEditingController(text: '25');
  final _shutter = TextEditingController(text: '180');
  final _targetF = TextEditingController(text: '5.6');

  (Manufacturer, Product)? _picked;
  bool _useMakerLux = false;
  double _dimmer = 100;
  _CamMode _cam = _CamMode.broadcast;
  int? _preset = 0;
  double _gain = 0;
  double _nd = 0;

  @override
  void initState() {
    super.initState();
    _loadCatalog();
  }

  Future<void> _loadCatalog() async {
    try {
      final c = await _repo.loadInitialFast();
      if (mounted) setState(() => _catalog = c);
      final r = await _repo.refreshRemote();
      if (mounted && r != null) setState(() => _catalog = r);
    } catch (_) {
      // Le catalogue est facultatif : la saisie manuelle reste possible.
    }
  }

  @override
  void dispose() {
    for (final c in [
      _search, _lumens, _angle, _makerLux, _makerDist, _distance, _refF,
      _iso, _fps, _shutter, _targetF,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  static double? _p(TextEditingController c) {
    final v = double.tryParse(c.text.trim().replaceAll(',', '.'));
    return (v == null || !v.isFinite || v <= 0) ? null : v;
  }

  static String _fmt(double v, {int decimals = 1}) {
    if (v >= 100) return _group(v.round());
    final s = v.toStringAsFixed(decimals);
    return s.contains('.') ? s.replaceFirst(RegExp(r'\.?0+$'), '') : s;
  }

  static String _group(int v) {
    final s = v.toString();
    final b = StringBuffer();
    for (var i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) b.write(' ');
      b.write(s[i]);
    }
    return b.toString();
  }

  List<(Manufacturer, Product)> _hits() {
    final tokens = _search.text
        .toLowerCase()
        .split(RegExp(r'\s+'))
        .where((t) => t.isNotEmpty)
        .toList();
    if (tokens.isEmpty || _catalog == null) return const [];
    final out = <(Manufacturer, Product)>[];
    final seen = <String>{};
    for (final m in _catalog!.manufacturers) {
      for (final p in m.products) {
        final hay = '${m.name} ${p.name} ${p.type}'.toLowerCase();
        if (!tokens.every(hay.contains)) continue;
        if (!seen.add('${m.name}|${p.name}'.toLowerCase())) continue;
        out.add((m, p));
        if (out.length >= 8) return out;
      }
    }
    return out;
  }

  void _pick(Manufacturer m, Product p) {
    FocusScope.of(context).unfocus();
    setState(() {
      _picked = (m, p);
      _search.clear();
      _useMakerLux = false;
      final lm = p.luminousFluxLumen;
      _lumens.text = (lm != null && lm > 0) ? lm.toString() : '';
      final z = zoomRangeOf(p);
      // Optique fixe : on pré-remplit l'angle ; zoom : l'utilisateur choisit.
      if (z != null && z.$1 == z.$2) _angle.text = _fmt(z.$1);
    });
  }

  CameraSettings? _camera() {
    if (_cam == _CamMode.broadcast) {
      final f = _p(_refF);
      if (f == null) return null;
      return BroadcastCamera(refF: f, gainDb: _gain, ndStops: _nd);
    }
    final iso = _p(_iso), fps = _p(_fps), sh = _p(_shutter);
    if (iso == null || fps == null || sh == null) return null;
    return IsoCamera(
        iso: iso, exposureSeconds: exposureTime(fps, sh), ndStops: _nd);
  }

  double? _candela() {
    final double cd;
    if (_useMakerLux) {
      final lux = _p(_makerLux), d = _p(_makerDist);
      if (lux == null || d == null) return null;
      cd = candelaFromLuxAt(lux, d);
    } else {
      final lm = _p(_lumens), a = _p(_angle);
      if (lm == null || a == null || a >= 180) return null;
      cd = centerCandelaFromLumens(lm, a);
    }
    return cd <= 0 ? null : cd * _dimmer / 100;
  }

  // ── UI ───────────────────────────────────────────────────────────────

  InputDecoration _dec(String label, {String? hint, String? suffix}) =>
      InputDecoration(
        labelText: label,
        helperText: hint,
        suffixText: suffix,
        filled: true,
        fillColor: _kCard,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      );

  Widget _num(TextEditingController c, String label,
      {String? hint, String? suffix, VoidCallback? onEdit}) {
    return TextField(
      controller: c,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      onChanged: (_) {
        onEdit?.call();
        setState(() {});
      },
      decoration: _dec(label, hint: hint, suffix: suffix),
    );
  }

  Widget _section(String title, IconData icon) => Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        child: Row(
          children: [
            Icon(icon, size: 18, color: _kAccent),
            const SizedBox(width: 8),
            Text(title.toUpperCase(),
                style: const TextStyle(
                    fontSize: 12,
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.w800,
                    color: _kAccent)),
          ],
        ),
      );

  Widget _chips<T>(List<(T, String)> options, T value, ValueChanged<T> on) =>
      Wrap(
        spacing: 6,
        runSpacing: 6,
        children: [
          for (final o in options)
            ChoiceChip(
              label: Text(o.$2),
              selected: o.$1 == value,
              selectedColor: _kAccent.withValues(alpha: 0.28),
              onSelected: (_) => setState(() => on(o.$1)),
            ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final cd = _candela();
    final d = _p(_distance);
    final cam = _camera();
    final lux = (cd != null && d != null) ? luxAt(cd, d) : null;
    final n = (lux != null && cam != null) ? cam.fNumberFor(lux) : null;
    final angle = _useMakerLux ? null : _p(_angle);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.diaphTitle),
        actions: const [
          AboutPinButton(pageId: 'tool:lumiere_diaph', sectionId: 'main'),
        ],
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: ListView(
          padding: EdgeInsets.fromLTRB(
              16, 16, 16, 24 + MediaQuery.paddingOf(context).bottom),
          children: [
            _intro(loc),
            _resultCard(loc, n, lux, angle, d),
            ..._machineSection(loc),
            _section(loc.diaphDistanceSection, Icons.straighten_rounded),
            _num(_distance, loc.diaphDistance, suffix: 'm'),
            ..._cameraSection(loc),
            ..._targetSection(loc, cd, cam),
            const SizedBox(height: 18),
            Text(
              loc.diaphDisclaimer,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white38, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _intro(AppLocalizations loc) => Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              _kAccent.withValues(alpha: 0.22),
              const Color(0xFF22D3EE).withValues(alpha: 0.10),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: _kAccent.withValues(alpha: 0.35)),
        ),
        child: Row(
          children: [
            const Text('🎥', style: TextStyle(fontSize: 32)),
            const SizedBox(width: 12),
            Expanded(
              child: Text(loc.diaphIntro,
                  style: const TextStyle(fontSize: 14, height: 1.35)),
            ),
          ],
        ),
      );

  Widget _resultCard(AppLocalizations loc, double? n, double? lux,
      double? angle, double? d) {
    final f = n ?? 0.0;
    final lx = lux ?? 0.0;
    final ok = f > 0 && lux != null;
    return ResultReveal(
      show: true,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: _kCard,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
              color: ok
                  ? _kAccent.withValues(alpha: 0.5)
                  : Colors.white.withValues(alpha: 0.08)),
          boxShadow: ok
              ? [
                  BoxShadow(
                      color: _kAccent.withValues(alpha: 0.18), blurRadius: 18)
                ]
              : null,
        ),
        child: !ok
            ? Row(
                children: [
                  const Icon(Icons.camera_rounded, color: Colors.white38),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(loc.diaphMissingInput,
                        style: const TextStyle(color: Colors.white60)),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(loc.diaphResultTitle,
                      style: const TextStyle(
                          color: Colors.white60, fontSize: 13)),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Petit « pop » à chaque changement de diaph.
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 260),
                        switchInCurve: Curves.easeOutBack,
                        transitionBuilder: (child, anim) =>
                            ScaleTransition(scale: anim, child: child),
                        child: Text(
                          'f/${formatFNumber(nearestThirdStop(f))}',
                          key: ValueKey(nearestThirdStop(f)),
                          style: const TextStyle(
                              fontSize: 46,
                              fontWeight: FontWeight.w900,
                              color: _kAccent,
                              height: 1),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text(loc.diaphExact(f.toStringAsFixed(1)),
                            style: const TextStyle(color: Colors.white60)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _stat(Icons.wb_sunny_rounded, loc.diaphLux,
                          '${_fmt(lx, decimals: 0)} lx'),
                      if (angle != null && d != null)
                        _stat(Icons.circle_outlined, loc.diaphBeamDiameter,
                            '${_fmt(beamDiameter(angle, d))} m'),
                    ],
                  ),
                  if (f < 1.4) ...[
                    const SizedBox(height: 12),
                    _warn(loc.diaphTooDark),
                  ],
                  if (f > 22) ...[
                    const SizedBox(height: 12),
                    _warn(loc.diaphTooBright),
                  ],
                ],
              ),
      ),
    );
  }

  Widget _stat(IconData icon, String label, String value) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 15, color: Colors.white60),
            const SizedBox(width: 6),
            Text('$label  ',
                style: const TextStyle(color: Colors.white60, fontSize: 12.5)),
            Text(value,
                style: const TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 13.5)),
          ],
        ),
      );

  Widget _warn(String text) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.warning_amber_rounded, size: 18, color: _kWarn),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text,
                style: const TextStyle(color: _kWarn, fontSize: 12.5)),
          ),
        ],
      );

  List<Widget> _machineSection(AppLocalizations loc) {
    final picked = _picked;
    final hits = _hits();
    final zoom = picked == null ? null : zoomRangeOf(picked.$2);
    return [
      _section(loc.diaphMachineSection, Icons.highlight_rounded),
      if (picked != null)
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.fromLTRB(14, 8, 4, 8),
          decoration: BoxDecoration(
            color: _kAccent.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: _kAccent.withValues(alpha: 0.35)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(picked.$1.name,
                        style: const TextStyle(
                            color: Colors.white60, fontSize: 12.5)),
                    Text(picked.$2.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16)),
                    if (zoom != null && zoom.$1 != zoom.$2)
                      Text(
                          loc.diaphZoomRange(
                              '${_fmt(zoom.$1)}–${_fmt(zoom.$2)}°'),
                          style: const TextStyle(
                              color: _kAccent, fontSize: 12.5)),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close_rounded),
                onPressed: () => setState(() => _picked = null),
              ),
            ],
          ),
        )
      else ...[
        TextField(
          controller: _search,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(
            hintText: loc.diaphSearchHint,
            prefixIcon: const Icon(Icons.search_rounded),
            filled: true,
            fillColor: _kCard,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        for (final h in hits)
          ListTile(
            dense: true,
            title: Text(h.$2.name),
            subtitle: Text(h.$1.name),
            trailing: (h.$2.luminousFluxLumen ?? 0) > 0
                ? Text('${_group(h.$2.luminousFluxLumen!)} lm',
                    style: const TextStyle(color: Colors.white70))
                : null,
            onTap: () => _pick(h.$1, h.$2),
          ),
        const SizedBox(height: 10),
      ],
      _chips<bool>([
        (false, loc.diaphSourceLumens),
        (true, loc.diaphSourceMaker),
      ], _useMakerLux, (v) => _useMakerLux = v),
      const SizedBox(height: 12),
      if (!_useMakerLux)
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _num(_lumens, loc.diaphLumens, suffix: 'lm')),
            const SizedBox(width: 10),
            Expanded(
              child: _num(_angle, loc.diaphBeamAngle,
                  hint: loc.diaphBeamAngleHint, suffix: '°'),
            ),
          ],
        )
      else
        Row(
          children: [
            Expanded(child: _num(_makerLux, loc.diaphMakerLux, suffix: 'lx')),
            const SizedBox(width: 10),
            Expanded(
                child: _num(_makerDist, loc.diaphMakerDistance, suffix: 'm')),
          ],
        ),
      const SizedBox(height: 10),
      Row(
        children: [
          Text(loc.diaphDimmer,
              style: const TextStyle(fontWeight: FontWeight.w600)),
          Expanded(
            child: Slider(
              value: _dimmer,
              min: 5,
              max: 100,
              divisions: 19,
              activeColor: _kAccent,
              label: '${_dimmer.round()} %',
              onChanged: (v) => setState(() => _dimmer = v),
            ),
          ),
          SizedBox(
            width: 48,
            child: Text('${_dimmer.round()} %',
                textAlign: TextAlign.right,
                style: const TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    ];
  }

  List<Widget> _cameraSection(AppLocalizations loc) {
    final iso = _cam == _CamMode.iso;
    final fps = _p(_fps), sh = _p(_shutter);
    final t = (fps != null && sh != null) ? exposureTime(fps, sh) : null;
    return [
      _section(loc.diaphCameraSection, Icons.videocam_rounded),
      _chips<_CamMode>([
        (_CamMode.broadcast, loc.diaphCamBroadcast),
        (_CamMode.iso, loc.diaphCamIso),
      ], _cam, (v) => _cam = v),
      const SizedBox(height: 12),
      if (!iso) ...[
        _chips<int?>([
          for (var i = 0; i < _kBroadcastPresets.length; i++)
            (i, _kBroadcastPresets[i].$1),
          (null, loc.diaphCustom),
        ], _preset, (v) {
          _preset = v;
          if (v != null) {
            _refF.text = formatFNumber(_kBroadcastPresets[v].$2);
          }
        }),
        const SizedBox(height: 10),
        _num(_refF, loc.diaphSensitivity,
            hint: loc.diaphSensitivityHint,
            onEdit: () => _preset = null),
        const SizedBox(height: 10),
        Text(loc.diaphGain,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        _chips<double>([
          for (final g in _kGains)
            (g, '${g > 0 ? '+' : ''}${g.round()} dB'),
        ], _gain, (v) => _gain = v),
      ] else ...[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _num(_iso, loc.diaphIso)),
            const SizedBox(width: 8),
            Expanded(child: _num(_fps, loc.diaphFps)),
            const SizedBox(width: 8),
            Expanded(child: _num(_shutter, loc.diaphShutter, suffix: '°')),
          ],
        ),
        if (t != null && t > 0)
          Padding(
            padding: const EdgeInsets.only(top: 6, left: 4),
            child: Text(loc.diaphExposure('1/${_fmt(1 / t, decimals: 0)} s'),
                style: const TextStyle(color: Colors.white60, fontSize: 12.5)),
          ),
      ],
      const SizedBox(height: 12),
      Text(loc.diaphNd, style: const TextStyle(fontWeight: FontWeight.w600)),
      const SizedBox(height: 6),
      _chips<double>([
        for (final nd in _kNds) (nd.$1, nd.$2 ?? loc.diaphNdClear),
      ], _nd, (v) => _nd = v),
    ];
  }

  List<Widget> _targetSection(
      AppLocalizations loc, double? cd, CameraSettings? cam) {
    final f = _p(_targetF);
    final dist = (cd != null && cam != null && f != null)
        ? distanceForFNumber(cd, f, cam)
        : null;
    final needLux = (cam != null && f != null) ? cam.luxFor(f) : null;
    return [
      _section(loc.diaphTargetSection, Icons.my_location_rounded),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
            child: _num(_targetF, loc.diaphTargetF),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              (dist != null && dist > 0 && needLux != null)
                  ? loc.diaphTargetResult(
                      _fmt(dist), _fmt(needLux, decimals: 0))
                  : '—',
              style: const TextStyle(fontSize: 14, height: 1.3),
            ),
          ),
        ],
      ),
    ];
  }
}
