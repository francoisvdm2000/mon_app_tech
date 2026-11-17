import 'package:flutter/material.dart';

/// Simple schematic of a truss hung from N hoists, with point loads.
/// Hoists are coloured by WLL utilisation.
class RiggingTrussDiagram extends StatelessWidget {
  const RiggingTrussDiagram({
    super.key,
    required this.lengthM,
    required this.motorPositionsM,
    required this.motorColors,
    required this.motorLabels,
    required this.loadPositionsM,
  });

  final double lengthM;
  final List<double> motorPositionsM;
  final List<Color> motorColors;
  final List<String> motorLabels;
  final List<double> loadPositionsM;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: CustomPaint(
        painter: _TrussPainter(
          lengthM: lengthM,
          motorPositionsM: motorPositionsM,
          motorColors: motorColors,
          motorLabels: motorLabels,
          loadPositionsM: loadPositionsM,
        ),
      ),
    );
  }
}

class _TrussPainter extends CustomPainter {
  _TrussPainter({
    required this.lengthM,
    required this.motorPositionsM,
    required this.motorColors,
    required this.motorLabels,
    required this.loadPositionsM,
  });

  final double lengthM;
  final List<double> motorPositionsM;
  final List<Color> motorColors;
  final List<String> motorLabels;
  final List<double> loadPositionsM;

  static const double _pad = 18;
  static const double _trussTop = 62;
  static const double _trussH = 12;

  @override
  void paint(Canvas canvas, Size size) {
    if (lengthM <= 0) return;
    final usable = size.width - 2 * _pad;
    double sx(double x) => _pad + (x.clamp(0, lengthM) / lengthM) * usable;

    // ── Truss: two chords + lattice ──────────────────────────────────────
    final chord = Paint()
      ..color = Colors.white70
      ..strokeWidth = 2;
    final lattice = Paint()
      ..color = Colors.white30
      ..strokeWidth = 1;
    final left = sx(0), right = sx(lengthM);
    const top = _trussTop, bottom = _trussTop + _trussH;
    canvas.drawLine(Offset(left, top), Offset(right, top), chord);
    canvas.drawLine(Offset(left, bottom), Offset(right, bottom), chord);
    canvas.drawLine(Offset(left, top), Offset(left, bottom), chord);
    canvas.drawLine(Offset(right, top), Offset(right, bottom), chord);
    final bays = (usable / 14).floor().clamp(1, 200);
    for (var k = 0; k < bays; k++) {
      final x0 = left + usable * k / bays;
      final x1 = left + usable * (k + 1) / bays;
      canvas.drawLine(
        Offset(x0, k.isEven ? top : bottom),
        Offset(x1, k.isEven ? bottom : top),
        lattice,
      );
    }

    // ── Point loads (fixtures) below the truss ──────────────────────────
    final loadPaint = Paint()..color = Colors.amber.withValues(alpha: 0.85);
    for (final x in loadPositionsM) {
      final cx = sx(x);
      final path = Path()
        ..moveTo(cx - 5, bottom + 4)
        ..lineTo(cx + 5, bottom + 4)
        ..lineTo(cx, bottom + 14)
        ..close();
      canvas.drawPath(path, loadPaint);
    }

    // ── Hoists ──────────────────────────────────────────────────────────
    for (var k = 0; k < motorPositionsM.length; k++) {
      final cx = sx(motorPositionsM[k]);
      final color = k < motorColors.length ? motorColors[k] : Colors.white70;
      final chain = Paint()
        ..color = color
        ..strokeWidth = 2;
      canvas.drawLine(Offset(cx, 40), Offset(cx, top), chain);
      final body = RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset(cx, 32), width: 18, height: 16),
        const Radius.circular(4),
      );
      canvas.drawRRect(body, Paint()..color = color.withValues(alpha: 0.25));
      canvas.drawRRect(
        body,
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5,
      );
      if (k < motorLabels.length) {
        final tp = TextPainter(
          text: TextSpan(
            text: motorLabels[k],
            style: TextStyle(
              color: color,
              fontSize: 10.5,
              fontWeight: FontWeight.w800,
            ),
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        final maxDx = size.width - tp.width;
        final dx = maxDx <= 0 ? 0.0 : (cx - tp.width / 2).clamp(0.0, maxDx);
        tp.paint(canvas, Offset(dx, 6));
      }
    }

    // ── Length dimension ────────────────────────────────────────────────
    final dim = TextPainter(
      text: TextSpan(
        text: '${lengthM.toStringAsFixed(2)} m',
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.5),
          fontSize: 10.5,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    canvas.drawLine(
      Offset(left, size.height - 8),
      Offset(right, size.height - 8),
      Paint()
        ..color = Colors.white24
        ..strokeWidth = 1,
    );
    dim.paint(
      canvas,
      Offset((left + right) / 2 - dim.width / 2, size.height - 22),
    );
  }

  @override
  bool shouldRepaint(covariant _TrussPainter old) => true;
}
