import 'dart:math' as math;

import 'package:flutter/material.dart';

class RiggingBridleDiagramData {
  const RiggingBridleDiagramData({
    required this.span,
    required this.drop,
    required this.offset,
    required this.leftLength,
    required this.rightLength,
    required this.leftTension,
    required this.rightTension,
    this.leftAngleH = 0,
    this.rightAngleH = 0,
  });

  final double span;
  final double drop;
  final double offset;
  final double leftLength;
  final double rightLength;
  final double leftTension;
  final double rightTension;
  final double leftAngleH;
  final double rightAngleH;
}

class RiggingBridleDiagramLabels {
  const RiggingBridleDiagramLabels({
    required this.pointA,
    required this.pointB,
    required this.leftLeg,
    required this.rightLeg,
    required this.drop,
    required this.span,
    required this.offset,
    required this.load,
    required this.tension,
  });

  final String pointA;
  final String pointB;
  final String leftLeg;
  final String rightLeg;
  final String drop;
  final String span;
  final String offset;
  final String load;
  final String tension;
}

class RiggingBridleDiagram extends StatelessWidget {
  const RiggingBridleDiagram({
    super.key,
    required this.data,
    required this.labels,
    this.showLoadData = true,
  });

  final RiggingBridleDiagramData? data;
  final RiggingBridleDiagramLabels labels;
  final bool showLoadData;

  static const leftColor = Color(0xFF64B5F6);
  static const rightColor = Color(0xFF81C784);
  static const dropColor = Color(0xFFBA68C8);
  static const spanColor = Color(0xFFB0BEC5);
  static const offsetColor = Color(0xFFFFB74D);
  static const loadColor = Color(0xFFE57373);
  static const angleColor = Color(0xFFFFF176);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: const Color(0xFF141418),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: CustomPaint(
              painter: _RiggingBridlePainter(
                data: data,
                labels: labels,
                showLoadData: showLoadData,
              ),
              child: const SizedBox.expand(),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _LegendChip(color: leftColor, label: labels.leftLeg),
            _LegendChip(color: rightColor, label: labels.rightLeg),
            const _LegendChip(color: angleColor, label: 'Angles'),
            _LegendChip(color: dropColor, label: labels.drop),
            _LegendChip(color: spanColor, label: labels.span),
            _LegendChip(color: offsetColor, label: labels.offset),
            if (showLoadData) _LegendChip(color: loadColor, label: labels.load),
          ],
        ),
      ],
    );
  }
}

class _LegendChip extends StatelessWidget {
  const _LegendChip({
    required this.color,
    required this.label,
  });

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.65)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _RiggingBridlePainter extends CustomPainter {
  const _RiggingBridlePainter({
    required this.data,
    required this.labels,
    required this.showLoadData,
  });

  final RiggingBridleDiagramData? data;
  final RiggingBridleDiagramLabels labels;
  final bool showLoadData;

  @override
  void paint(Canvas canvas, Size size) {
    final a = Offset(30, 68);
    final b = Offset(size.width - 30, 68);

    double ratio = 0.5;
    if (data != null && data!.span > 0) {
      ratio = (data!.offset / data!.span).clamp(0.08, 0.92);
    }

    final load = Offset(
      a.dx + (b.dx - a.dx) * ratio,
      size.height * 0.58,
    );

    final spanPaint = _paint(RiggingBridleDiagram.spanColor, 3);
    final leftPaint = _paint(RiggingBridleDiagram.leftColor, 5);
    final rightPaint = _paint(RiggingBridleDiagram.rightColor, 5);
    final dropPaint = _paint(RiggingBridleDiagram.dropColor, 3);
    final offsetPaint = _paint(RiggingBridleDiagram.offsetColor, 3);

    canvas.drawLine(a, b, spanPaint);
    canvas.drawLine(a, load, leftPaint);
    canvas.drawLine(b, load, rightPaint);
    canvas.drawLine(Offset(load.dx, a.dy), load, dropPaint);

    final loadFill = Paint()
      ..color = RiggingBridleDiagram.loadColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(load, 12, loadFill);

    _text(
      canvas,
      a + const Offset(-4, -30),
      labels.pointA,
      RiggingBridleDiagram.spanColor,
      13,
      true,
    );
    _text(
      canvas,
      b + const Offset(-10, -30),
      labels.pointB,
      RiggingBridleDiagram.spanColor,
      13,
      true,
    );

    if (data != null) {
      _centerText(
        canvas,
        Offset((a.dx + b.dx) / 2, 22),
        '${data!.span.toStringAsFixed(2)} m',
        RiggingBridleDiagram.spanColor,
      );

      _drawAngleArc(
        canvas: canvas,
        center: a + const Offset(18, 0),
        radius: 22,
        startAngle: 0,
        sweepAngle: data!.leftAngleH * math.pi / 180,
        label: '${data!.leftAngleH.toStringAsFixed(0)}°',
        labelPosition: a + const Offset(46, 22),
      );

      _drawAngleArc(
        canvas: canvas,
        center: b + const Offset(-18, 0),
        radius: 22,
        startAngle: math.pi,
        sweepAngle: -(data!.rightAngleH * math.pi / 180),
        label: '${data!.rightAngleH.toStringAsFixed(0)}°',
        labelPosition: b + const Offset(-74, 22),
      );

      final leftMid = Offset(
        (a.dx + load.dx) / 2,
        (a.dy + load.dy) / 2,
      );
      final rightMid = Offset(
        (b.dx + load.dx) / 2,
        (b.dy + load.dy) / 2,
      );

      _text(
        canvas,
        leftMid + const Offset(-72, -4),
        '${data!.leftLength.toStringAsFixed(2)} m',
        RiggingBridleDiagram.leftColor,
        12,
        true,
      );

      if (showLoadData) {
        _text(
          canvas,
          leftMid + const Offset(-58, 2),
          '${data!.leftTension.toStringAsFixed(1)} kg',
          RiggingBridleDiagram.leftColor,
          11,
          false,
        );
      }

      _text(
        canvas,
        rightMid + const Offset(26, -4),
        '${data!.rightLength.toStringAsFixed(2)} m',
        RiggingBridleDiagram.rightColor,
        12,
        true,
      );

      if (showLoadData) {
        _text(
          canvas,
          rightMid + const Offset(10, 2),
          '${data!.rightTension.toStringAsFixed(1)} kg',
          RiggingBridleDiagram.rightColor,
          11,
          false,
        );
      }

      _text(
        canvas,
        Offset(load.dx + 10, (a.dy + load.dy) / 2 - 8),
        '${data!.drop.toStringAsFixed(2)} m',
        RiggingBridleDiagram.dropColor,
        12,
        true,
      );

      final offsetY = size.height - 36;
      canvas.drawLine(
        Offset(a.dx, offsetY),
        Offset(load.dx, offsetY),
        offsetPaint,
      );
      canvas.drawLine(
        Offset(a.dx, offsetY - 7),
        Offset(a.dx, offsetY + 7),
        offsetPaint,
      );
      canvas.drawLine(
        Offset(load.dx, offsetY - 7),
        Offset(load.dx, offsetY + 7),
        offsetPaint,
      );

      _centerText(
        canvas,
        Offset((a.dx + load.dx) / 2, offsetY + 10),
        '${data!.offset.toStringAsFixed(2)} m',
        RiggingBridleDiagram.offsetColor,
      );
    }
  }

  void _drawAngleArc({
    required Canvas canvas,
    required Offset center,
    required double radius,
    required double startAngle,
    required double sweepAngle,
    required String label,
    required Offset labelPosition,
  }) {
    final arcPaint = Paint()
      ..color = RiggingBridleDiagram.angleColor
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final rect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(rect, startAngle, sweepAngle, false, arcPaint);

    _text(
      canvas,
      labelPosition,
      label,
      RiggingBridleDiagram.angleColor,
      13,
      true,
    );
  }

  Paint _paint(Color color, double width) {
    return Paint()
      ..color = color
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round;
  }

  void _text(
    Canvas canvas,
    Offset offset,
    String text,
    Color color,
    double fontSize,
    bool bold,
  ) {
    final painter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: bold ? FontWeight.w900 : FontWeight.w700,
          height: 1.0,
        ),
      ),
      textDirection: TextDirection.ltr,
      maxLines: 1,
      ellipsis: '…',
    )..layout(maxWidth: 120);

    painter.paint(canvas, offset);
  }

  void _centerText(Canvas canvas, Offset center, String text, Color color) {
    final painter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w900,
          height: 1.0,
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
      maxLines: 1,
      ellipsis: '…',
    )..layout(maxWidth: 150);

    painter.paint(canvas, Offset(center.dx - painter.width / 2, center.dy));
  }

  @override
  bool shouldRepaint(covariant _RiggingBridlePainter oldDelegate) {
    return oldDelegate.data != data ||
        oldDelegate.labels != labels ||
        oldDelegate.showLoadData != showLoadData;
  }
}
