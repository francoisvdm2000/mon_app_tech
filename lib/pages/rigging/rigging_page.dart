// lib/pages/rigging/rigging_page.dart
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../l10n_gen/app_localizations.dart';

class RiggingPage extends StatefulWidget {
  const RiggingPage({super.key});

  @override
  State<RiggingPage> createState() => _RiggingPageState();
}

class _RiggingPageState extends State<RiggingPage> {
  // ===== CALC 1 : Span + Drop -> Legs + Angles =====
  final _c1SpanCtrl = TextEditingController(text: '5');
  final _c1DropCtrl = TextEditingController(text: '4');
  final _c1WeightCtrl = TextEditingController(text: '0');
  bool _c1OffCenter = false;
  final _c1OffsetCtrl = TextEditingController(text: '2.5'); // A->Load

  // ===== CALC 2 : Span + Angle(H left) -> Drop + Legs + Angles =====
  final _c2SpanCtrl = TextEditingController(text: '5');
  final _c2AngleHLeftCtrl = TextEditingController(text: '58');
  final _c2WeightCtrl = TextEditingController(text: '0');
  bool _c2OffCenter = false;
  final _c2OffsetCtrl = TextEditingController(text: '2.5'); // A->Load

  // ===== CALC 3 : Span + Left leg length -> Drop + Legs + Angles =====
  final _c3SpanCtrl = TextEditingController(text: '5');
  final _c3LegLeftCtrl = TextEditingController(text: '4.72');
  final _c3WeightCtrl = TextEditingController(text: '0');
  bool _c3OffCenter = false;
  final _c3OffsetCtrl = TextEditingController(text: '2.5'); // A->Load

  @override
  void dispose() {
    _c1SpanCtrl.dispose();
    _c1DropCtrl.dispose();
    _c1WeightCtrl.dispose();
    _c1OffsetCtrl.dispose();

    _c2SpanCtrl.dispose();
    _c2AngleHLeftCtrl.dispose();
    _c2WeightCtrl.dispose();
    _c2OffsetCtrl.dispose();

    _c3SpanCtrl.dispose();
    _c3LegLeftCtrl.dispose();
    _c3WeightCtrl.dispose();
    _c3OffsetCtrl.dispose();

    super.dispose();
  }

  double? _parse(String s) => double.tryParse(s.replaceAll(',', '.').trim());

  double _deg(double rad) => rad * 180.0 / math.pi;
  double _rad(double deg) => deg * math.pi / 180.0;

  double _clampAngleDeg(double deg) {
    if (!deg.isFinite) return 0;
    return deg.clamp(0.0, 90.0);
  }

  String _fmt(double v, {int decimals = 3}) => v.toStringAsFixed(decimals);

  Widget _gap([double h = 12]) => SizedBox(height: h);

  InputDecoration _dec(String label, {String? suffix}) {
    return InputDecoration(
      labelText: label,
      suffixText: suffix,
      filled: true,
      fillColor: const Color(0xFF141418),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.28)),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    );
  }

  Widget _numField({
    required TextEditingController ctrl,
    required String label,
    required String suffix,
  }) {
    return TextField(
      controller: ctrl,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9\.,]'))],
      onChanged: (_) => setState(() {}),
      style: const TextStyle(fontSize: 16),
      decoration: _dec(label, suffix: suffix),
    );
  }

  Widget _switchRow({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white.withValues(alpha: 0.85),
                fontWeight: FontWeight.w600),
          ),
        ),
        Switch(value: value, onChanged: onChanged),
      ],
    );
  }

  Widget _calcCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget child,
  }) {
    return Card(
      elevation: 0,
      color: const Color(0xFF1C1C21),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          collapsedIconColor: Colors.white70,
          iconColor: Colors.white70,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          title: Row(
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(
                child: Text(title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w800)),
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              subtitle,
              style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.75), height: 1.25),
            ),
          ),
          children: [child],
        ),
      ),
    );
  }

  Widget _sectionTitle(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 10),
          Text(text,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
        ],
      ),
    );
  }

  Widget _resultRow(String left, String right) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
              child: Text(left,
                  style:
                      TextStyle(color: Colors.white.withValues(alpha: 0.85)))),
          const SizedBox(width: 10),
          Text(right, style: const TextStyle(fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }

  _RiggingSolved? _solve({
    required double span,
    required double drop,
    required double offsetA,
  }) {
    if (span <= 0 || drop <= 0) return null;
    if (offsetA <= 0 || offsetA >= span) return null;

    final xL = offsetA;
    final xR = span - offsetA;

    final legL = math.sqrt(xL * xL + drop * drop);
    final legR = math.sqrt(xR * xR + drop * drop);

    final angHL = _clampAngleDeg(_deg(math.atan2(drop, xL))); // vs horizontal
    final angHR = _clampAngleDeg(_deg(math.atan2(drop, xR)));

    final angVL = _clampAngleDeg(90.0 - angHL); // vs vertical
    final angVR = _clampAngleDeg(90.0 - angHR);

    final v1x = -xL, v1y = -drop;
    final v2x = xR, v2y = -drop;
    final dot = v1x * v2x + v1y * v2y;
    final n1 = math.sqrt(v1x * v1x + v1y * v1y);
    final n2 = math.sqrt(v2x * v2x + v2y * v2y);
    final cosang = (dot / (n1 * n2)).clamp(-1.0, 1.0);
    final included = _deg(math.acos(cosang));

    return _RiggingSolved(
      legLeft: legL,
      legRight: legR,
      angleHLeft: angHL,
      angleHRight: angHR,
      angleVLeft: angVL,
      angleVRight: angVR,
      includedAngle: included,
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    // ===== CALC 1 inputs =====
    final c1Span = _parse(_c1SpanCtrl.text);
    final c1Drop = _parse(_c1DropCtrl.text);
    final c1Weight = _parse(_c1WeightCtrl.text) ?? 0;
    final c1OffsetRaw = _parse(_c1OffsetCtrl.text);

    final c1Offset = (() {
      if (c1Span == null || c1Span <= 0) return null;
      if (!_c1OffCenter) return c1Span / 2.0;
      return c1OffsetRaw;
    })();

    _RiggingSolved? c1Solved;
    String? c1Err;
    if (c1Span == null || c1Drop == null || c1Offset == null) {
      c1Err = loc.riggingNeedPositiveValues;
    } else {
      c1Solved = _solve(span: c1Span, drop: c1Drop, offsetA: c1Offset);
      if (c1Solved == null) c1Err = loc.riggingInvalidOffset;
    }

    // ===== CALC 2 inputs =====
    final c2Span = _parse(_c2SpanCtrl.text);
    final c2AngHLeftIn = _parse(_c2AngleHLeftCtrl.text);
    final c2Weight = _parse(_c2WeightCtrl.text) ?? 0;
    final c2OffsetRaw = _parse(_c2OffsetCtrl.text);

    final c2Offset = (() {
      if (c2Span == null || c2Span <= 0) return null;
      if (!_c2OffCenter) return c2Span / 2.0;
      return c2OffsetRaw;
    })();

    double? c2Drop;
    _RiggingSolved? c2Solved;
    String? c2Err;

    if (c2Span == null ||
        c2AngHLeftIn == null ||
        c2Offset == null ||
        c2Span <= 0) {
      c2Err = loc.riggingNeedPositiveValues;
    } else {
      final ang = _clampAngleDeg(c2AngHLeftIn);
      if (ang <= 0 || ang >= 90) {
        c2Err = loc.riggingNeedPositiveValues;
      } else {
        final drop = math.tan(_rad(ang)) * c2Offset;
        c2Drop = drop;
        c2Solved = _solve(span: c2Span, drop: drop, offsetA: c2Offset);
        if (c2Solved == null) c2Err = loc.riggingInvalidOffset;
      }
    }

    // ===== CALC 3 inputs =====
    final c3Span = _parse(_c3SpanCtrl.text);
    final c3LegLeftIn = _parse(_c3LegLeftCtrl.text);
    final c3Weight = _parse(_c3WeightCtrl.text) ?? 0;
    final c3OffsetRaw = _parse(_c3OffsetCtrl.text);

    final c3Offset = (() {
      if (c3Span == null || c3Span <= 0) return null;
      if (!_c3OffCenter) return c3Span / 2.0;
      return c3OffsetRaw;
    })();

    double? c3Drop;
    _RiggingSolved? c3Solved;
    String? c3Err;

    if (c3Span == null ||
        c3LegLeftIn == null ||
        c3Offset == null ||
        c3Span <= 0 ||
        c3LegLeftIn <= 0) {
      c3Err = loc.riggingNeedPositiveValues;
    } else {
      if (c3Offset <= 0 || c3Offset >= c3Span) {
        c3Err = loc.riggingInvalidOffset;
      } else if (c3LegLeftIn <= c3Offset) {
        c3Err = loc.riggingImpossibleGeometry;
      } else {
        final drop =
            math.sqrt((c3LegLeftIn * c3LegLeftIn) - (c3Offset * c3Offset));
        c3Drop = drop;
        c3Solved = _solve(span: c3Span, drop: drop, offsetA: c3Offset);
        if (c3Solved == null) c3Err = loc.riggingInvalidOffset;
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(loc.riggingTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _calcCard(
            icon: Icons.construction,
            title: loc.riggingCalc1Title,
            subtitle: loc.riggingCalcCommonSubtitle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _sectionTitle(Icons.schema, loc.riggingSchemaTitle),
                _RiggingDiagram(
                  span: c1Span ?? 0,
                  drop: c1Drop ?? 0,
                  offsetA: c1Offset ?? 0,
                  solved: c1Solved,
                  weightKg: c1Weight,
                ),
                _gap(14),
                _sectionTitle(Icons.tune, loc.riggingInputsTitle),
                _numField(
                    ctrl: _c1SpanCtrl,
                    label: loc.riggingSpanLabel,
                    suffix: loc.riggingUnitMeters),
                _gap(),
                _numField(
                    ctrl: _c1DropCtrl,
                    label: loc.riggingDropLabel,
                    suffix: loc.riggingUnitMeters),
                _gap(),
                _switchRow(
                  title: loc.riggingOffCenterToggle,
                  value: _c1OffCenter,
                  onChanged: (v) => setState(() => _c1OffCenter = v),
                ),
                if (_c1OffCenter) ...[
                  _gap(),
                  _numField(
                      ctrl: _c1OffsetCtrl,
                      label: loc.riggingOffsetLabel,
                      suffix: loc.riggingUnitMeters),
                ],
                _gap(),
                _numField(
                    ctrl: _c1WeightCtrl,
                    label: loc.riggingWeightLabel,
                    suffix: loc.riggingUnitKg),
                _gap(16),
                _sectionTitle(Icons.fact_check, loc.riggingResultsTitle),
                Builder(builder: (context) {
                  final s1 = c1Solved;
                  final msg = c1Err;
                  if (msg != null || s1 == null) {
                    return Text(msg ?? loc.riggingNeedPositiveValues,
                        style: const TextStyle(color: Colors.orangeAccent));
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _resultRow(loc.riggingLegLeftLabel,
                          '${_fmt(s1.legLeft, decimals: 3)} ${loc.riggingUnitMeters}'),
                      _resultRow(loc.riggingLegRightLabel,
                          '${_fmt(s1.legRight, decimals: 3)} ${loc.riggingUnitMeters}'),
                      _resultRow(loc.riggingAngleHLeftLabel,
                          '${_fmt(s1.angleHLeft, decimals: 2)}°'),
                      _resultRow(loc.riggingAngleHRightLabel,
                          '${_fmt(s1.angleHRight, decimals: 2)}°'),
                      _resultRow(loc.riggingAngleVLeftLabel,
                          '${_fmt(s1.angleVLeft, decimals: 2)}°'),
                      _resultRow(loc.riggingAngleVRightLabel,
                          '${_fmt(s1.angleVRight, decimals: 2)}°'),
                      _resultRow(loc.riggingIncludedAngleLabel,
                          '${_fmt(s1.includedAngle, decimals: 2)}°'),
                      _resultRow(loc.riggingWeightLabel,
                          '${_fmt(c1Weight, decimals: 1)} ${loc.riggingUnitKg}'),
                      _gap(6),
                      Text(loc.riggingDisclaimerNoLoad,
                          style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.70))),
                    ],
                  );
                }),
              ],
            ),
          ),
          _gap(14),
          _calcCard(
            icon: Icons.calculate,
            title: loc.riggingCalc2Title,
            subtitle: loc.riggingCalc2Subtitle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _sectionTitle(Icons.schema, loc.riggingSchemaTitle),
                _RiggingDiagram(
                  span: c2Span ?? 0,
                  drop: c2Drop ?? 0,
                  offsetA: c2Offset ?? 0,
                  solved: c2Solved,
                  weightKg: c2Weight,
                ),
                _gap(14),
                _sectionTitle(Icons.tune, loc.riggingInputsTitle),
                _numField(
                    ctrl: _c2SpanCtrl,
                    label: loc.riggingSpanLabel,
                    suffix: loc.riggingUnitMeters),
                _gap(),
                _numField(
                    ctrl: _c2AngleHLeftCtrl,
                    label: loc.riggingAngleHLeftInputLabel,
                    suffix: '°'),
                _gap(),
                _switchRow(
                  title: loc.riggingOffCenterToggle,
                  value: _c2OffCenter,
                  onChanged: (v) => setState(() => _c2OffCenter = v),
                ),
                if (_c2OffCenter) ...[
                  _gap(),
                  _numField(
                      ctrl: _c2OffsetCtrl,
                      label: loc.riggingOffsetLabel,
                      suffix: loc.riggingUnitMeters),
                ],
                _gap(),
                _numField(
                    ctrl: _c2WeightCtrl,
                    label: loc.riggingWeightLabel,
                    suffix: loc.riggingUnitKg),
                _gap(16),
                _sectionTitle(Icons.fact_check, loc.riggingResultsTitle),
                Builder(builder: (context) {
                  final s2 = c2Solved;
                  final msg = c2Err;
                  if (msg != null || s2 == null || c2Drop == null) {
                    return Text(msg ?? loc.riggingNeedPositiveValues,
                        style: const TextStyle(color: Colors.orangeAccent));
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _resultRow(loc.riggingDropLabel,
                          '${_fmt(c2Drop, decimals: 3)} ${loc.riggingUnitMeters}'),
                      _resultRow(loc.riggingLegLeftLabel,
                          '${_fmt(s2.legLeft, decimals: 3)} ${loc.riggingUnitMeters}'),
                      _resultRow(loc.riggingLegRightLabel,
                          '${_fmt(s2.legRight, decimals: 3)} ${loc.riggingUnitMeters}'),
                      _resultRow(loc.riggingAngleHLeftLabel,
                          '${_fmt(s2.angleHLeft, decimals: 2)}°'),
                      _resultRow(loc.riggingAngleHRightLabel,
                          '${_fmt(s2.angleHRight, decimals: 2)}°'),
                      _resultRow(loc.riggingAngleVLeftLabel,
                          '${_fmt(s2.angleVLeft, decimals: 2)}°'),
                      _resultRow(loc.riggingAngleVRightLabel,
                          '${_fmt(s2.angleVRight, decimals: 2)}°'),
                      _resultRow(loc.riggingIncludedAngleLabel,
                          '${_fmt(s2.includedAngle, decimals: 2)}°'),
                      _resultRow(loc.riggingWeightLabel,
                          '${_fmt(c2Weight, decimals: 1)} ${loc.riggingUnitKg}'),
                      _gap(6),
                      Text(loc.riggingDisclaimerNoLoad,
                          style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.70))),
                    ],
                  );
                }),
              ],
            ),
          ),
          _gap(14),
          _calcCard(
            icon: Icons.square_foot,
            title: loc.riggingCalc3Title,
            subtitle: loc.riggingCalc3Subtitle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _sectionTitle(Icons.schema, loc.riggingSchemaTitle),
                _RiggingDiagram(
                  span: c3Span ?? 0,
                  drop: c3Drop ?? 0,
                  offsetA: c3Offset ?? 0,
                  solved: c3Solved,
                  weightKg: c3Weight,
                ),
                _gap(14),
                _sectionTitle(Icons.tune, loc.riggingInputsTitle),
                _numField(
                    ctrl: _c3SpanCtrl,
                    label: loc.riggingSpanLabel,
                    suffix: loc.riggingUnitMeters),
                _gap(),
                _numField(
                    ctrl: _c3LegLeftCtrl,
                    label: loc.riggingLegLeftInputLabel,
                    suffix: loc.riggingUnitMeters),
                _gap(),
                _switchRow(
                  title: loc.riggingOffCenterToggle,
                  value: _c3OffCenter,
                  onChanged: (v) => setState(() => _c3OffCenter = v),
                ),
                if (_c3OffCenter) ...[
                  _gap(),
                  _numField(
                      ctrl: _c3OffsetCtrl,
                      label: loc.riggingOffsetLabel,
                      suffix: loc.riggingUnitMeters),
                ],
                _gap(),
                _numField(
                    ctrl: _c3WeightCtrl,
                    label: loc.riggingWeightLabel,
                    suffix: loc.riggingUnitKg),
                _gap(16),
                _sectionTitle(Icons.fact_check, loc.riggingResultsTitle),
                Builder(builder: (context) {
                  final s3 = c3Solved;
                  final msg = c3Err;
                  if (msg != null || s3 == null || c3Drop == null) {
                    return Text(msg ?? loc.riggingNeedPositiveValues,
                        style: const TextStyle(color: Colors.orangeAccent));
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _resultRow(loc.riggingDropLabel,
                          '${_fmt(c3Drop, decimals: 3)} ${loc.riggingUnitMeters}'),
                      _resultRow(loc.riggingLegLeftLabel,
                          '${_fmt(s3.legLeft, decimals: 3)} ${loc.riggingUnitMeters}'),
                      _resultRow(loc.riggingLegRightLabel,
                          '${_fmt(s3.legRight, decimals: 3)} ${loc.riggingUnitMeters}'),
                      _resultRow(loc.riggingAngleHLeftLabel,
                          '${_fmt(s3.angleHLeft, decimals: 2)}°'),
                      _resultRow(loc.riggingAngleHRightLabel,
                          '${_fmt(s3.angleHRight, decimals: 2)}°'),
                      _resultRow(loc.riggingAngleVLeftLabel,
                          '${_fmt(s3.angleVLeft, decimals: 2)}°'),
                      _resultRow(loc.riggingAngleVRightLabel,
                          '${_fmt(s3.angleVRight, decimals: 2)}°'),
                      _resultRow(loc.riggingIncludedAngleLabel,
                          '${_fmt(s3.includedAngle, decimals: 2)}°'),
                      _resultRow(loc.riggingWeightLabel,
                          '${_fmt(c3Weight, decimals: 1)} ${loc.riggingUnitKg}'),
                      _gap(6),
                      Text(loc.riggingDisclaimerNoLoad,
                          style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.70))),
                    ],
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RiggingSolved {
  const _RiggingSolved({
    required this.legLeft,
    required this.legRight,
    required this.angleHLeft,
    required this.angleHRight,
    required this.angleVLeft,
    required this.angleVRight,
    required this.includedAngle,
  });

  final double legLeft;
  final double legRight;
  final double angleHLeft;
  final double angleHRight;
  final double angleVLeft;
  final double angleVRight;
  final double includedAngle;
}

class _RiggingDiagram extends StatelessWidget {
  const _RiggingDiagram({
    required this.span,
    required this.drop,
    required this.offsetA,
    required this.solved,
    required this.weightKg,
  });

  final double span;
  final double drop;
  final double offsetA;
  final _RiggingSolved? solved;
  final double weightKg;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230, // un peu plus haut -> zone cotes bas garantie visible
      decoration: BoxDecoration(
        color: const Color(0xFF141418),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: CustomPaint(
          painter: _RiggingPainter(
            theme: Theme.of(context),
            span: span,
            drop: drop,
            offsetA: offsetA,
            solved: solved,
            weightKg: weightKg,
          ),
        ),
      ),
    );
  }
}

class _RiggingPainter extends CustomPainter {
  _RiggingPainter({
    required this.theme,
    required this.span,
    required this.drop,
    required this.offsetA,
    required this.solved,
    required this.weightKg,
  });

  final ThemeData theme;
  final double span;
  final double drop;
  final double offsetA;
  final _RiggingSolved? solved;
  final double weightKg;

  @override
  void paint(Canvas canvas, Size size) {
    final line = Paint()
      ..color = Colors.white.withValues(alpha: 0.85)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final thin = Paint()
      ..color = Colors.white.withValues(alpha: 0.45)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final textColor = Colors.white.withValues(alpha: 0.80);

    final pad = 16.0;
    final w = size.width;
    final h = size.height;

    // Reserve area at bottom for dimensions (span/offset)
    final dimZoneH = 54.0;
    final topY = pad + 10;
    final bottomY = h - pad - dimZoneH;

    // A and B points (top line)
    final a = Offset(pad + 6, topY);
    final b = Offset(w - pad - 6, topY);

    // Load point X
    double ratioX = 0.5;
    if (span.isFinite && span > 0 && offsetA.isFinite && offsetA > 0) {
      ratioX = (offsetA / span).clamp(0.08, 0.92);
    }
    final loadX = a.dx + (b.dx - a.dx) * ratioX;

    // Load point Y based on drop ratio -> but constrained
    final maxDropPx = (bottomY - topY - 22).clamp(40.0, 140.0);
    final dropPx = (drop.isFinite && drop > 0 && span.isFinite && span > 0)
        ? (maxDropPx * (drop / (drop + span)).clamp(0.30, 0.95))
        : (maxDropPx * 0.60);

    final load = Offset(loadX, topY + 18 + dropPx);

    // Top reference line
    canvas.drawLine(Offset(a.dx, a.dy - 10), Offset(b.dx, b.dy - 10), thin);
    _tp(canvas, a + const Offset(-2, -28), 'A', textColor, 12, bold: true);
    _tp(canvas, b + const Offset(-2, -28), 'B', textColor, 12, bold: true);

    // Bridle legs
    canvas.drawLine(a, load, line);
    canvas.drawLine(b, load, line);

    // Ring
    final ring = Paint()
      ..color = Colors.white.withValues(alpha: 0.95)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(load, 6, ring);

    // Drop vertical (for readability)
    canvas.drawLine(Offset(load.dx, a.dy), Offset(load.dx, load.dy), thin);

    // CHARGE arrow
    final arrow = Paint()
      ..color = Colors.white.withValues(alpha: 0.90)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    final at = Offset(load.dx, load.dy + 10);
    final ab = Offset(load.dx, load.dy + 44);
    canvas.drawLine(at, ab, arrow);
    canvas.drawLine(ab, ab + const Offset(-6, -8), arrow);
    canvas.drawLine(ab, ab + const Offset(6, -8), arrow);

    // ===== Bottom dimensions (ALWAYS inside reserved zone) =====
    final dimBaseY = h - pad - 18; // moved up -> always visible
    // Span
    canvas.drawLine(Offset(a.dx, dimBaseY), Offset(b.dx, dimBaseY), thin);
    canvas.drawLine(
        Offset(a.dx, dimBaseY - 6), Offset(a.dx, dimBaseY + 6), thin);
    canvas.drawLine(
        Offset(b.dx, dimBaseY - 6), Offset(b.dx, dimBaseY + 6), thin);
    _tp(canvas, Offset((a.dx + b.dx) / 2 - 28, dimBaseY + 8), 'Entraxe',
        textColor, 12);
    if (span.isFinite && span > 0) {
      _tp(canvas, Offset((a.dx + b.dx) / 2 - 22, dimBaseY + 24),
          '${span.toStringAsFixed(2)} m', textColor, 12);
    }

    // Offset A -> Load (above span line)
    canvas.drawLine(
        Offset(a.dx, dimBaseY - 26), Offset(load.dx, dimBaseY - 26), thin);
    canvas.drawLine(
        Offset(a.dx, dimBaseY - 32), Offset(a.dx, dimBaseY - 20), thin);
    canvas.drawLine(
        Offset(load.dx, dimBaseY - 32), Offset(load.dx, dimBaseY - 20), thin);
    _tp(canvas, Offset((a.dx + load.dx) / 2 - 42, dimBaseY - 44),
        'Offset A→Charge', textColor, 12);
    if (span.isFinite && span > 0 && offsetA.isFinite && offsetA > 0) {
      _tp(canvas, Offset((a.dx + load.dx) / 2 - 18, dimBaseY - 28),
          '${offsetA.toStringAsFixed(2)} m', textColor, 12);
    }

    // Drop label near the vertical
    _tp(canvas, Offset(load.dx + 10, (a.dy + load.dy) / 2 - 10), 'Flèche',
        textColor, 12,
        bold: true);
    if (drop.isFinite && drop > 0) {
      _tp(canvas, Offset(load.dx + 10, (a.dy + load.dy) / 2 + 6),
          '${drop.toStringAsFixed(2)} m', textColor, 12);
    }

    // ===== Info panels to avoid overlap (professional layout) =====
    // Left panel
    final panelFill = Paint()..color = Colors.black.withValues(alpha: 0.28);
    final panelStroke = Paint()
      ..color = Colors.white.withValues(alpha: 0.12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final leftRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(pad, topY + 22, 132, 86),
      const Radius.circular(12),
    );
    canvas.drawRRect(leftRect, panelFill);
    canvas.drawRRect(leftRect, panelStroke);

    final rightRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(w - pad - 132, topY + 22, 132, 86),
      const Radius.circular(12),
    );
    canvas.drawRRect(rightRect, panelFill);
    canvas.drawRRect(rightRect, panelStroke);

    final centerRect = RRect.fromRectAndRadius(
      Rect.fromLTWH((w - 150) / 2, topY + 22, 150, 86),
      const Radius.circular(12),
    );
    canvas.drawRRect(centerRect, panelFill);
    canvas.drawRRect(centerRect, panelStroke);

    // Titles in panels
    _tp(canvas, Offset(leftRect.left + 10, leftRect.top + 10), 'Brin G',
        textColor, 12,
        bold: true);
    _tp(canvas, Offset(rightRect.left + 10, rightRect.top + 10), 'Brin D',
        textColor, 12,
        bold: true);
    _tp(canvas, Offset(centerRect.left + 10, centerRect.top + 10), 'Charge',
        textColor, 12,
        bold: true);

    // Values
    if (solved != null) {
      final s = solved!;
      _tp(canvas, Offset(leftRect.left + 10, leftRect.top + 28),
          '${s.legLeft.toStringAsFixed(2)} m', textColor, 12);
      _tp(canvas, Offset(leftRect.left + 10, leftRect.top + 46),
          '∠H ${s.angleHLeft.toStringAsFixed(1)}°', textColor, 12);
      _tp(canvas, Offset(leftRect.left + 10, leftRect.top + 64),
          '∠V ${s.angleVLeft.toStringAsFixed(1)}°', textColor, 12);

      _tp(canvas, Offset(rightRect.left + 10, rightRect.top + 28),
          '${s.legRight.toStringAsFixed(2)} m', textColor, 12);
      _tp(canvas, Offset(rightRect.left + 10, rightRect.top + 46),
          '∠H ${s.angleHRight.toStringAsFixed(1)}°', textColor, 12);
      _tp(canvas, Offset(rightRect.left + 10, rightRect.top + 64),
          '∠V ${s.angleVRight.toStringAsFixed(1)}°', textColor, 12);

      _tp(canvas, Offset(centerRect.left + 10, centerRect.top + 28),
          '${weightKg.toStringAsFixed(1)} kg', textColor, 12);
      _tp(canvas, Offset(centerRect.left + 10, centerRect.top + 46),
          'Angle brins', textColor, 12);
      _tp(canvas, Offset(centerRect.left + 10, centerRect.top + 64),
          '${s.includedAngle.toStringAsFixed(1)}°', textColor, 12,
          bold: true);
    } else {
      _tp(canvas, Offset(centerRect.left + 10, centerRect.top + 28),
          '${weightKg.toStringAsFixed(1)} kg', textColor, 12);
    }

    // CHARGE label near arrow but kept minimal (no overlap)
    _tp(canvas, load + const Offset(14, 16), 'CHARGE', textColor, 12,
        bold: true);
  }

  void _tp(Canvas canvas, Offset pos, String text, Color color, double size,
      {bool bold = false}) {
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: bold ? FontWeight.w800 : FontWeight.w500,
          height: 1.0,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: 999);
    tp.paint(canvas, pos);
  }

  @override
  bool shouldRepaint(covariant _RiggingPainter old) {
    return old.span != span ||
        old.drop != drop ||
        old.offsetA != offsetA ||
        old.weightKg != weightKg ||
        old.solved != solved;
  }
}