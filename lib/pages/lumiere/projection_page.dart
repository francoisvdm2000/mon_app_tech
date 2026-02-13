import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../app/ui/widgets.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'projection_calculations.dart';

enum _Field { angle, distance, diameter }

class ProjectionPage extends StatefulWidget {
  const ProjectionPage({super.key});

  @override
  State<ProjectionPage> createState() => _ProjectionPageState();
}

class _ProjectionPageState extends State<ProjectionPage> {
  final _angleController = TextEditingController();
  final _distanceController = TextEditingController();
  final _diameterController = TextEditingController();

  _Field? _lastEdited;
  bool _isUpdating = false;

  String _headerLine = '';
  String _detailText = '';

  @override
  void initState() {
    super.initState();
    _angleController.addListener(() => _onEdit(_Field.angle));
    _distanceController.addListener(() => _onEdit(_Field.distance));
    _diameterController.addListener(() => _onEdit(_Field.diameter));
    _recompute();
  }

  @override
  void dispose() {
    _angleController.dispose();
    _distanceController.dispose();
    _diameterController.dispose();
    super.dispose();
  }

  double? _parse(String raw) {
    final t = raw.trim().replaceAll(',', '.');
    if (t.isEmpty) return null;
    return double.tryParse(t);
  }

  bool _isValidPositive(double? v) => v != null && v > 0;

  String _fmt(double v, {int decimals = 2}) {
    if (v <= 0) return '0';
    return v.toStringAsFixed(decimals);
  }

  void _onEdit(_Field edited) {
    if (_isUpdating) return;
    _lastEdited = edited;
    _recompute();
  }

  void _setText(TextEditingController c, String text) {
    _isUpdating = true;
    c.text = text;
    _isUpdating = false;
  }

  void _resetAll() {
    _isUpdating = true;
    _angleController.clear();
    _distanceController.clear();
    _diameterController.clear();
    _isUpdating = false;

    _lastEdited = null;
    _recompute();
  }

  void _recompute() {
    final angleRaw = _parse(_angleController.text);
    final distanceRaw = _parse(_distanceController.text);
    final diameterRaw = _parse(_diameterController.text);

    final angleOk = _isValidPositive(angleRaw);
    final distanceOk = _isValidPositive(distanceRaw);
    final diameterOk = _isValidPositive(diameterRaw);

    // Recalcul automatique basé sur le dernier champ édité.
    // Règle : quand 2 valeurs nécessaires existent, on recalcule la 3e
    // même si elle était déjà renseignée (évite les valeurs intermédiaires bloquées).
    if (_lastEdited == _Field.angle || _lastEdited == _Field.distance) {
      if (angleOk && distanceOk) {
        final computed = ProjectionCalculations.spotDiameterMeter(
          distanceMeter: distanceRaw!,
          beamAngleDegree: angleRaw!,
        );
        _setText(
          _diameterController,
          computed > 0 ? _fmt(computed, decimals: 3) : '',
        );
      }
    } else if (_lastEdited == _Field.diameter ||
        _lastEdited == _Field.distance) {
      if (distanceOk && diameterOk) {
        final computed = ProjectionCalculations.beamAngleDegree(
          distanceMeter: distanceRaw!,
          spotDiameterMeter: diameterRaw!,
        );
        _setText(
            _angleController, computed > 0 ? _fmt(computed, decimals: 2) : '');
      }
    } else if (_lastEdited == _Field.diameter || _lastEdited == _Field.angle) {
      if (angleOk && diameterOk) {
        final computed = ProjectionCalculations.distanceMeter(
          beamAngleDegree: angleRaw!,
          spotDiameterMeter: diameterRaw!,
        );
        _setText(
          _distanceController,
          computed > 0 ? _fmt(computed, decimals: 3) : '',
        );
      }
    }

    // Relecture après auto-remplissage
    final angle2 = _parse(_angleController.text) ?? 0.0;
    final distance2 = _parse(_distanceController.text) ?? 0.0;
    final diameter2 = _parse(_diameterController.text) ?? 0.0;

    final validCount = (angle2 > 0 ? 1 : 0) +
        (distance2 > 0 ? 1 : 0) +
        (diameter2 > 0 ? 1 : 0);

    // ⚠️ ici on ne met pas de texte "FR en dur" : c’est assigné dans build()
    // (car besoin de loc)
    final headerKey = validCount < 2 ? 'needTwo' : 'auto';

    setState(() {
      _headerLine = headerKey;
      _detailText = _detailText; // sera reconstruit dans build() avec loc
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    final angleVal = _parse(_angleController.text) ?? 0.0;
    final distanceVal = _parse(_distanceController.text) ?? 0.0;
    final diameterVal = _parse(_diameterController.text) ?? 0.0;

    // Header
    final header = (_headerLine == 'needTwo')
        ? loc.projectionHeaderNeedTwoValues
        : loc.projectionHeaderAutoActive;

    // Details (avec loc)
    final angleStr = _fmt(angleVal, decimals: 2);
    final distanceStr = _fmt(distanceVal, decimals: 3);
    final diameterStr = _fmt(diameterVal, decimals: 3);

    final detailLines = <String>[
      loc.projectionDetailAngle(angleStr),
      loc.projectionDetailDistance(distanceStr),
      loc.projectionDetailDiameter(diameterStr),
    ];
    final detailText = detailLines.join('\n');

    // Labels pour le cône (CustomPainter sans context)
    final coneAngleLabel = loc.projectionConeAngle(angleStr);
    final coneDistanceLabel = loc.projectionConeDistance(distanceStr);
    final coneDiameterLabel = (diameterVal > 0)
        ? loc.projectionConeDiameter(diameterStr)
        : loc.commonDash;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.lightProjectionTitle),
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
              title: loc.projectionInputsTitle,
              icon: Icons.edit,
              initiallyExpanded: true,
              child: Column(
                children: [
                  TextField(
                    controller: _angleController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [numFormatter],
                    decoration: InputDecoration(
                      labelText: loc.projectionAngleLabel,
                      hintText: loc.projectionAngleHint,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _distanceController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [numFormatter],
                    decoration: InputDecoration(
                      labelText: loc.projectionDistanceLabel,
                      hintText: loc.projectionDistanceHint,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _diameterController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [numFormatter],
                    decoration: InputDecoration(
                      labelText: loc.projectionDiameterLabel,
                      hintText: loc.projectionDiameterHint,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    loc.projectionAutoHelp,
                    style: const TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            ExpandSectionCard(
              title: loc.projectionResultsTitle,
              icon: Icons.calculate,
              initiallyExpanded: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    header,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ResultBox(detailText),
                  const SizedBox(height: 12),
                  ConePreview(
                    angleDeg: angleVal,
                    distanceM: distanceVal,
                    diameterM: diameterVal,
                    angleLabel: coneAngleLabel,
                    distanceLabel: coneDistanceLabel,
                    diameterLabel: coneDiameterLabel,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// =======================
/// VISUALISATION DU CÔNE
/// =======================

class ConePreview extends StatelessWidget {
  final double angleDeg;
  final double distanceM;
  final double diameterM;

  final String angleLabel;
  final String distanceLabel;
  final String diameterLabel;

  const ConePreview({
    super.key,
    required this.angleDeg,
    required this.distanceM,
    required this.diameterM,
    required this.angleLabel,
    required this.distanceLabel,
    required this.diameterLabel,
  });

  @override
  Widget build(BuildContext context) {
    if (angleDeg <= 0 || distanceM <= 0) return const SizedBox.shrink();

    return AspectRatio(
      aspectRatio: 2.0,
      child: CustomPaint(
        painter: _ConePainter(
          angleDeg: angleDeg,
          distanceM: distanceM,
          diameterM: diameterM,
          angleLabel: angleLabel,
          distanceLabel: distanceLabel,
          diameterLabel: diameterLabel,
        ),
      ),
    );
  }
}

class _ConePainter extends CustomPainter {
  final double angleDeg;
  final double distanceM;
  final double diameterM;

  final String angleLabel;
  final String distanceLabel;
  final String diameterLabel;

  _ConePainter({
    required this.angleDeg,
    required this.distanceM,
    required this.diameterM,
    required this.angleLabel,
    required this.distanceLabel,
    required this.diameterLabel,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xFF0B0B0B);

    final border = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = Colors.white12;

    final coneStroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.white70;

    final coneFill = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white10;

    final spotStroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.white70;

    final axisStroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = Colors.white54;

    // Fond arrondi
    final rrect = RRect.fromRectAndRadius(
      Offset.zero & size,
      const Radius.circular(14),
    );
    canvas.drawRRect(rrect, bg);
    canvas.drawRRect(rrect, border);

    // Géométrie
    final origin = Offset(size.width * 0.12, size.height * 0.55);
    final coneLen = size.width * 0.78;

    final halfRad = (angleDeg * math.pi / 180.0) / 2.0;
    final radius = (coneLen * math.tan(halfRad)).clamp(0.0, size.height * 0.42);

    final endTop = Offset(origin.dx + coneLen, origin.dy - radius);
    final endBot = Offset(origin.dx + coneLen, origin.dy + radius);
    final endMid = Offset(origin.dx + coneLen, origin.dy);

    // Cône (rempli + contour)
    final path = Path()
      ..moveTo(origin.dx, origin.dy)
      ..lineTo(endTop.dx, endTop.dy)
      ..lineTo(endBot.dx, endBot.dy)
      ..close();

    canvas.drawPath(path, coneFill);
    canvas.drawLine(origin, endTop, coneStroke);
    canvas.drawLine(origin, endBot, coneStroke);

    // Spot
    canvas.drawLine(endTop, endBot, spotStroke);

    // Axe (distance)
    canvas.drawLine(origin, endMid, axisStroke);

    // Origine
    canvas.drawCircle(origin, 3, coneStroke);

    // Texte
    final labelStyle = const TextStyle(
      color: Colors.white70,
      fontSize: 12,
      fontFamily: 'monospace',
      fontWeight: FontWeight.w600,
    );

    TextPainter tp(String text) {
      return TextPainter(
        text: TextSpan(text: text, style: labelStyle),
        textDirection: TextDirection.ltr,
        maxLines: 1,
        ellipsis: '…',
      );
    }

    // --- ANGLE
    final anglePainter = tp(angleLabel)..layout(maxWidth: size.width * 0.55);
    anglePainter.paint(canvas, Offset(origin.dx - 6, origin.dy - 42));

    // Petit arc d’angle
    final arcR = 18.0;
    final arcRect = Rect.fromCircle(center: origin, radius: arcR);
    canvas.drawArc(arcRect, -halfRad, 2 * halfRad, false, axisStroke);

    // --- DISTANCE : cotation horizontale
    final distPainter = tp(distanceLabel)..layout(maxWidth: size.width * 0.4);

    final y = origin.dy + radius + 18; // sous le cône
    final start = Offset(origin.dx, y);
    final end = Offset(endMid.dx, y);

    canvas.drawLine(start, end, axisStroke);

    const arrow = 6.0;
    canvas.drawLine(
        start, Offset(start.dx + arrow, start.dy - arrow), axisStroke);
    canvas.drawLine(
        start, Offset(start.dx + arrow, start.dy + arrow), axisStroke);
    canvas.drawLine(end, Offset(end.dx - arrow, end.dy - arrow), axisStroke);
    canvas.drawLine(end, Offset(end.dx - arrow, end.dy + arrow), axisStroke);

    distPainter.paint(
      canvas,
      Offset(
        (start.dx + end.dx) / 2 - distPainter.width / 2,
        y - distPainter.height - 6,
      ),
    );

    // --- DIAMÈTRE : vertical à droite
    final outsideX = endTop.dx + 10;
    canvas.drawLine(
      Offset(outsideX, endTop.dy),
      Offset(outsideX, endBot.dy),
      axisStroke,
    );

    final diaPainter = tp(diameterLabel)..layout(maxWidth: size.height);

    final midY = (endTop.dy + endBot.dy) / 2;
    canvas.save();
    canvas.translate(outsideX + 14, midY + diaPainter.width / 2);
    canvas.rotate(-math.pi / 2);
    diaPainter.paint(canvas, Offset(0, -diaPainter.height / 2));
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _ConePainter oldDelegate) {
    return oldDelegate.angleDeg != angleDeg ||
        oldDelegate.distanceM != distanceM ||
        oldDelegate.diameterM != diameterM ||
        oldDelegate.angleLabel != angleLabel ||
        oldDelegate.distanceLabel != distanceLabel ||
        oldDelegate.diameterLabel != diameterLabel;
  }
}
