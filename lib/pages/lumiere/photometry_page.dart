import 'package:flutter/material.dart';

import '../../app/ui/widgets.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'photometry_calculations.dart';

class PhotometryPage extends StatefulWidget {
  const PhotometryPage({super.key});

  @override
  State<PhotometryPage> createState() => _PhotometryPageState();
}

class _PhotometryPageState extends State<PhotometryPage> {
  // Outil 1 : lux <-> candela avec distance
  final _lux1 = TextEditingController();
  final _candela1 = TextEditingController();
  final _distance1 = TextEditingController();

  // Outil 2 : lumens <-> candela avec angle
  final _lumens2 = TextEditingController();
  final _candela2 = TextEditingController();
  final _angle2 = TextEditingController();

  // Outil 3 : lux depuis lumens + distance + angle
  final _lumens3 = TextEditingController();
  final _distance3 = TextEditingController();
  final _angle3 = TextEditingController();

  bool _isUpdating = false;

  String _summary1 = '';
  String _summary2 = '';
  String _summary3 = '';

  @override
  void initState() {
    super.initState();

    for (final c in [
      _lux1,
      _candela1,
      _distance1,
      _lumens2,
      _candela2,
      _angle2,
      _lumens3,
      _distance3,
      _angle3,
    ]) {
      c.addListener(_recomputeAll);
    }

    _recomputeAll();
  }

  @override
  void dispose() {
    for (final c in [
      _lux1,
      _candela1,
      _distance1,
      _lumens2,
      _candela2,
      _angle2,
      _lumens3,
      _distance3,
      _angle3,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  double? _parse(String raw) {
    final t = raw.trim().replaceAll(',', '.');
    if (t.isEmpty) return null;
    return double.tryParse(t);
  }

  bool _ok(double? v) => v != null && v > 0;

  String _fmt(double v, {int decimals = 2}) {
    if (v <= 0) return '0';
    return v.toStringAsFixed(decimals);
  }

  void _set(TextEditingController c, String value) {
    _isUpdating = true;
    c.text = value;
    _isUpdating = false;
  }

  void _resetAll() {
    _isUpdating = true;
    for (final c in [
      _lux1,
      _candela1,
      _distance1,
      _lumens2,
      _candela2,
      _angle2,
      _lumens3,
      _distance3,
      _angle3,
    ]) {
      c.clear();
    }
    _isUpdating = false;
    _recomputeAll();
  }

  void _recomputeAll() {
    if (_isUpdating) return;
    _recompute1();
    _recompute2();
    _recompute3();
  }

  void _recompute1() {
    final lux = _parse(_lux1.text);
    final cd = _parse(_candela1.text);
    final dist = _parse(_distance1.text);

    final luxOk = _ok(lux);
    final cdOk = _ok(cd);
    final distOk = _ok(dist);

    final count = (luxOk ? 1 : 0) + (cdOk ? 1 : 0) + (distOk ? 1 : 0);

    // Strict: seulement si exactement 2 valeurs valides
    if (count == 2 && distOk) {
      final d = dist;
      if (d != null && d > 0) {
        if (!luxOk && cdOk) {
          final c = cd;
          if (c != null && c > 0) {
            final computed = PhotometryCalculations.luxFromCandela(
              candela: c,
              distanceMeter: d,
            );
            _set(_lux1, computed > 0 ? _fmt(computed, decimals: 1) : '');
          }
        } else if (!cdOk && luxOk) {
          final l = lux;
          if (l != null && l > 0) {
            final computed = PhotometryCalculations.candelaFromLux(
              lux: l,
              distanceMeter: d,
            );
            _set(_candela1, computed > 0 ? _fmt(computed, decimals: 0) : '');
          }
        }
      }
    }

    final lux2 = _parse(_lux1.text) ?? 0.0;
    final cd2 = _parse(_candela1.text) ?? 0.0;
    final d2 = _parse(_distance1.text) ?? 0.0;

    final loc = AppLocalizations.of(context);
    setState(() {
      _summary1 = loc.photometrySummary1(
        _fmt(lux2, decimals: 1),
        _fmt(cd2, decimals: 0),
        _fmt(d2, decimals: 2),
      );
    });
  }

  void _recompute2() {
    final lumens = _parse(_lumens2.text);
    final cd = _parse(_candela2.text);
    final angle = _parse(_angle2.text);

    final lmOk = _ok(lumens);
    final cdOk = _ok(cd);
    final aOk = _ok(angle);

    final count = (lmOk ? 1 : 0) + (cdOk ? 1 : 0) + (aOk ? 1 : 0);

    if (count == 2 && aOk) {
      final a = angle;
      if (a != null && a > 0) {
        if (!lmOk && cdOk) {
          final c = cd;
          if (c != null && c > 0) {
            final computed =
                PhotometryCalculations.lumensFromCandelaAndBeamAngle(
              candela: c,
              beamAngleDegree: a,
            );
            _set(_lumens2, computed > 0 ? _fmt(computed, decimals: 0) : '');
          }
        } else if (!cdOk && lmOk) {
          final lm = lumens;
          if (lm != null && lm > 0) {
            final computed =
                PhotometryCalculations.candelaFromLumensAndBeamAngle(
              lumens: lm,
              beamAngleDegree: a,
            );
            _set(_candela2, computed > 0 ? _fmt(computed, decimals: 0) : '');
          }
        }
      }
    }

    final lm2 = _parse(_lumens2.text) ?? 0.0;
    final cd2 = _parse(_candela2.text) ?? 0.0;
    final a2 = _parse(_angle2.text) ?? 0.0;

    final loc = AppLocalizations.of(context);
    setState(() {
      _summary2 = loc.photometrySummary2(_fmt(lm2, decimals: 0),
          _fmt(cd2, decimals: 0), _fmt(a2, decimals: 1));
    });
  }

  void _recompute3() {
    final lumens = _parse(_lumens3.text);
    final dist = _parse(_distance3.text);
    final angle = _parse(_angle3.text);

    double lux = 0.0;
    if (_ok(lumens) && _ok(dist) && _ok(angle)) {
      final lm = lumens;
      final d = dist;
      final a = angle;
      if (lm != null && d != null && a != null && lm > 0 && d > 0 && a > 0) {
        lux = PhotometryCalculations.luxFromLumensDistanceAndBeamAngle(
          lumens: lm,
          distanceMeter: d,
          beamAngleDegree: a,
        );
      }
    }

    final lm2 = lumens ?? 0.0;
    final d2 = dist ?? 0.0;
    final a2 = angle ?? 0.0;

    final loc = AppLocalizations.of(context);
    setState(() {
      _summary3 = loc.photometrySummary3(_fmt(lm2, decimals: 0),
          _fmt(d2, decimals: 2), _fmt(a2, decimals: 1), _fmt(lux, decimals: 0));
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.lightPhotometryTitle),
        actions: [
          IconButton(
            tooltip: loc.commonReset,
            onPressed: _resetAll,
            icon: const Icon(Icons.restart_alt),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: Column(
          children: [
            ExpandSectionCard(
              title: loc.photometrySection1Title,
              icon: Icons.light_mode,
              initiallyExpanded: true,
              child: Column(
                children: [
                  TextField(
                    controller: _lux1,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [numFormatter],
                    decoration: InputDecoration(
                      labelText: loc.photometryLuxLabel,
                      hintText: loc.photometryLuxHint,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _candela1,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [numFormatter],
                    decoration: InputDecoration(
                      labelText: loc.photometryCandelaLabel,
                      hintText: loc.photometryCandelaHint1,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _distance1,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [numFormatter],
                    decoration: InputDecoration(
                      labelText: loc.photometryDistanceLabel,
                      hintText: loc.photometryDistanceHint1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ResultBox(_summary1),
                ],
              ),
            ),
            const SizedBox(height: 14),
            ExpandSectionCard(
              title: loc.photometrySection2Title,
              icon: Icons.flash_on,
              initiallyExpanded: false,
              child: Column(
                children: [
                  TextField(
                    controller: _lumens2,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [numFormatter],
                    decoration: InputDecoration(
                      labelText: loc.photometryLumensLabel,
                      hintText: loc.photometryLumensHint2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _candela2,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [numFormatter],
                    decoration: InputDecoration(
                      labelText: loc.photometryCandelaLabel,
                      hintText: loc.photometryCandelaHint2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _angle2,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [numFormatter],
                    decoration: InputDecoration(
                      labelText: loc.photometryBeamAngleLabel,
                      hintText: loc.photometryBeamAngleHint2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ResultBox(_summary2),
                ],
              ),
            ),
            const SizedBox(height: 14),
            ExpandSectionCard(
              title: loc.photometrySection3Title,
              icon: Icons.calculate,
              initiallyExpanded: false,
              child: Column(
                children: [
                  TextField(
                    controller: _lumens3,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [numFormatter],
                    decoration: InputDecoration(
                      labelText: loc.photometryLumensLabel,
                      hintText: loc.photometryLumensHint3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _distance3,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [numFormatter],
                    decoration: InputDecoration(
                      labelText: loc.photometryDistanceLabel,
                      hintText: loc.photometryDistanceHint3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _angle3,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [numFormatter],
                    decoration: InputDecoration(
                      labelText: loc.photometryBeamAngleLabel,
                      hintText: loc.photometryBeamAngleHint3,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ResultBox(_summary3),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              loc.photometryDisclaimerShort,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white38, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
