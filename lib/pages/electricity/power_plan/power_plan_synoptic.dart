// lib/pages/electricity/power_plan/power_plan_synoptic.dart
//
// Synoptique : l'arbre de distribution dessiné de haut en bas
// (source → tableaux → charges), avec les câbles annotés.
// Le même peintre sert à l'écran (thème sombre) et à l'export (fond blanc).

import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'power_plan_models.dart';
import 'power_plan_widgets.dart';

const double _kNodeW = 172;
const double _kNodeH = 74;
const double _kHGap = 18;
const double _kVGap = 78;
const double _kPad = 28;
const double _kHeader = 46;

enum PpSynKind { source, panel, load }

class PpSynNode {
  PpSynNode({
    required this.kind,
    required this.title,
    required this.line2,
    required this.line3,
    required this.accent,
    this.level,
    this.emoji,
    this.edgeLabel,
    this.edgeColor,
  });

  final PpSynKind kind;
  final String title;
  final String line2;
  final String line3;
  final Color accent;
  final PpAlertLevel? level;
  final String? emoji;
  final String? edgeLabel; // câble qui arrive sur ce nœud
  final Color? edgeColor;
  final List<PpSynNode> children = [];
  Rect rect = Rect.zero;
  double _width = _kNodeW;
}

class PpSynLayout {
  PpSynLayout._(this.root, this.size, this.title, this.subtitle);

  final PpSynNode? root;
  final Size size;
  final String title;
  final String subtitle;

  static PpSynLayout build(
    PpPlan plan,
    PpCalc calc, {
    required String Function(PpLoadCategory) categoryName,
    required String sourceDetail,
    required String subtitle,
  }) {
    final s = plan.source;
    if (s == null) {
      return PpSynLayout._(null, const Size(400, 200), plan.name, subtitle);
    }

    String currentsLine(PpCurrents c, PpPhase? mono) {
      if (mono != null) return '${mono.label} · ${ppFormatAmps(c.of(mono))} A';
      return 'L1 ${c.l1.round()} · L2 ${c.l2.round()} · L3 ${c.l3.round()} A';
    }

    PpSynNode? nodeFor(PpOutput o) {
      final child = o.child;
      if (child == null) return null;
      final phase = calc.outputPhase[o.id];
      final cur = calc.outputCurrents[o.id] ?? PpCurrents();
      final drop = calc.outputDrop[o.id] ?? 0;
      final edge =
          '${o.connector.shortLabel} · ${ppFormatLength(o.cableLength)} m · '
          '${o.connector.cableName(o.cableSection)}\n'
          '${o.connector.breakerLabel(o.breakerA)}${o.rcd ? ' · 30 mA' : ''} · ΔU ${drop.toStringAsFixed(1)} %';
      final edgeLevel = calc.worstLevelFor(o.id);

      if (child is PpLoad) {
        return PpSynNode(
          kind: PpSynKind.load,
          emoji: child.category.emoji,
          title: child.name,
          line2: '${ppFormatKw(child.powerW)} kW · ${categoryName(child.category)}',
          line3: currentsLine(cur, phase),
          accent: Color(child.category.colorValue),
          level: edgeLevel,
          edgeLabel: edge,
          edgeColor: Color(o.connector.colorValue),
        );
      }
      final p = child as PpPanel;
      final pc = calc.panelCurrents[p.id] ?? PpCurrents();
      final lvl = _worst(calc.worstLevelFor(p.id), edgeLevel);
      final n = PpSynNode(
        kind: PpSynKind.panel,
        title: p.name,
        line2: '${p.input.shortLabel} · ${p.mainBreakerA} A · ${ppFormatKw(pc.watts)} kW',
        line3: currentsLine(pc, phase),
        accent: const Color(0xFF4CC9F0),
        level: lvl,
        edgeLabel: edge,
        edgeColor: Color(o.connector.colorValue),
      );
      for (final co in p.outputs) {
        final c = nodeFor(co);
        if (c != null) n.children.add(c);
      }
      return n;
    }

    final root = PpSynNode(
      kind: PpSynKind.source,
      emoji: switch (s.kind) {
        PpSourceKind.generator => '⛽',
        PpSourceKind.mains => '🏢',
        PpSourceKind.outlet => '🔌',
      },
      title: s.name,
      line2: sourceDetail,
      line3: currentsLine(calc.sourceCurrents, s.isThreePhase ? null : PpPhase.l1),
      accent: kPpAccent,
      level: calc.worstLevelFor('source'),
    );
    for (final o in s.outputs) {
      final c = nodeFor(o);
      if (c != null) root.children.add(c);
    }

    // Largeur des sous-arbres puis positionnement.
    double measure(PpSynNode n) {
      if (n.children.isEmpty) return n._width = _kNodeW;
      final sum = n.children.fold<double>(0, (a, c) => a + measure(c)) +
          _kHGap * (n.children.length - 1);
      return n._width = math.max(_kNodeW, sum);
    }

    var maxDepth = 0;
    void place(PpSynNode n, double left, int depth) {
      maxDepth = math.max(maxDepth, depth);
      final top = _kPad + _kHeader + depth * (_kNodeH + _kVGap);
      final cx = left + n._width / 2;
      n.rect = Rect.fromLTWH(cx - _kNodeW / 2, top, _kNodeW, _kNodeH);
      final childrenW = n.children.fold<double>(0, (a, c) => a + c._width) +
          _kHGap * math.max(0, n.children.length - 1);
      var x = left + (n._width - childrenW) / 2;
      for (final c in n.children) {
        place(c, x, depth + 1);
        x += c._width + _kHGap;
      }
    }

    final w = measure(root);
    place(root, _kPad, 0);
    final size = Size(
      math.max(w + _kPad * 2, 420),
      _kPad * 2 + _kHeader + (maxDepth + 1) * _kNodeH + maxDepth * _kVGap,
    );
    return PpSynLayout._(root, size, plan.name, subtitle);
  }

  static PpAlertLevel? _worst(PpAlertLevel? a, PpAlertLevel? b) {
    if (a == null) return b;
    if (b == null) return a;
    return a.index >= b.index ? a : b;
  }
}

class PpSynopticPainter extends CustomPainter {
  PpSynopticPainter(this.layout, {this.printMode = false});

  final PpSynLayout layout;
  final bool printMode;

  Color get _bg => printMode ? Colors.white : Colors.transparent;
  Color get _text => printMode ? const Color(0xFF15151F) : Colors.white;
  Color get _muted => printMode ? const Color(0xFF5A5A6A) : Colors.white60;
  Color get _nodeBg => printMode ? const Color(0xFFF7F7FA) : const Color(0xFF181826);

  @override
  void paint(Canvas canvas, Size size) {
    if (printMode) {
      canvas.drawRect(Offset.zero & layout.size, Paint()..color = _bg);
    }
    _drawText(
      canvas,
      layout.title,
      Offset(_kPad, _kPad - 8),
      maxWidth: layout.size.width - _kPad * 2,
      style: TextStyle(color: _text, fontSize: 18, fontWeight: FontWeight.w800),
    );
    _drawText(
      canvas,
      layout.subtitle,
      Offset(_kPad, _kPad + 16),
      maxWidth: layout.size.width - _kPad * 2,
      style: TextStyle(color: _muted, fontSize: 11),
    );

    final root = layout.root;
    if (root == null) return;
    _drawEdges(canvas, root);
    _drawNodes(canvas, root);
  }

  void _drawEdges(Canvas canvas, PpSynNode n) {
    for (final c in n.children) {
      final color = (c.edgeColor ?? Colors.grey)
          .withValues(alpha: printMode ? 0.9 : 0.75);
      final paint = Paint()
        ..color = color
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke;
      final from = n.rect.bottomCenter;
      final to = c.rect.topCenter;
      final midY = from.dy + _kVGap * 0.28;
      final path = Path()
        ..moveTo(from.dx, from.dy)
        ..lineTo(from.dx, midY)
        ..lineTo(to.dx, midY)
        ..lineTo(to.dx, to.dy);
      canvas.drawPath(path, paint);

      if (c.edgeLabel != null) {
        final tp = TextPainter(
          text: TextSpan(
            text: c.edgeLabel,
            style: TextStyle(
              color: _text,
              fontSize: 9.5,
              height: 1.25,
              fontWeight: FontWeight.w600,
            ),
          ),
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
          maxLines: 2,
          ellipsis: '…',
        )..layout(maxWidth: _kNodeW + _kHGap - 4);
        final boxW = tp.width + 10;
        final boxH = tp.height + 6;
        final top = midY + (to.dy - midY - boxH) / 2;
        final box = Rect.fromLTWH(to.dx - boxW / 2, top, boxW, boxH);
        canvas.drawRRect(
          RRect.fromRectAndRadius(box, const Radius.circular(6)),
          Paint()..color = printMode ? Colors.white : const Color(0xFF0F0F17),
        );
        canvas.drawRRect(
          RRect.fromRectAndRadius(box, const Radius.circular(6)),
          Paint()
            ..color = color.withValues(alpha: 0.6)
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1,
        );
        tp.paint(canvas, Offset(box.left + 5, box.top + 3));
      }
      _drawEdges(canvas, c);
    }
  }

  void _drawNodes(Canvas canvas, PpSynNode n) {
    final r = RRect.fromRectAndRadius(n.rect, const Radius.circular(12));
    final levelColor = switch (n.level) {
      PpAlertLevel.error => const Color(0xFFE53935),
      PpAlertLevel.warning => const Color(0xFFFB8C00),
      _ => null,
    };
    canvas.drawRRect(r, Paint()..color = _nodeBg);
    // Bandeau de couleur à gauche.
    canvas.save();
    canvas.clipRRect(r);
    canvas.drawRect(
      Rect.fromLTWH(n.rect.left, n.rect.top, 6, n.rect.height),
      Paint()..color = n.accent,
    );
    canvas.restore();
    canvas.drawRRect(
      r,
      Paint()
        ..color = levelColor ?? n.accent.withValues(alpha: printMode ? 0.8 : 0.55)
        ..style = PaintingStyle.stroke
        ..strokeWidth = levelColor != null ? 2.4 : 1.4,
    );

    final left = n.rect.left + 14;
    final maxW = n.rect.width - 22;
    final title = n.emoji != null ? '${n.emoji} ${n.title}' : n.title;
    _drawText(canvas, title, Offset(left, n.rect.top + 9),
        maxWidth: maxW,
        style: TextStyle(
            color: _text, fontSize: 12.5, fontWeight: FontWeight.w800));
    _drawText(canvas, n.line2, Offset(left, n.rect.top + 30),
        maxWidth: maxW, style: TextStyle(color: _muted, fontSize: 10.5));
    _drawText(canvas, n.line3, Offset(left, n.rect.top + 48),
        maxWidth: maxW,
        style: TextStyle(
            color: levelColor ?? _text,
            fontSize: 10.5,
            fontWeight: FontWeight.w700));

    for (final c in n.children) {
      _drawNodes(canvas, c);
    }
  }

  void _drawText(Canvas canvas, String text, Offset at,
      {required double maxWidth, required TextStyle style}) {
    final tp = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      maxLines: 1,
      ellipsis: '…',
    )..layout(maxWidth: math.max(10, maxWidth));
    tp.paint(canvas, at);
  }

  @override
  bool shouldRepaint(covariant PpSynopticPainter old) =>
      old.layout != layout || old.printMode != printMode;
}

/// Rend le synoptique en PNG (fond blanc, prêt à imprimer).
Future<Uint8List> ppRenderSynopticPng(PpSynLayout layout,
    {double pixelRatio = 2.5}) async {
  final maxSide = math.max(layout.size.width, layout.size.height);
  final pr = math.min(pixelRatio, 7000 / maxSide);
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);
  canvas.scale(pr);
  PpSynopticPainter(layout, printMode: true).paint(canvas, layout.size);
  final picture = recorder.endRecording();
  final img = await picture.toImage(
    (layout.size.width * pr).ceil(),
    (layout.size.height * pr).ceil(),
  );
  final data = await img.toByteData(format: ui.ImageByteFormat.png);
  img.dispose();
  picture.dispose();
  return data!.buffer.asUint8List();
}

/// Vue interactive (zoom / déplacement) du synoptique.
class PpSynopticView extends StatefulWidget {
  const PpSynopticView({super.key, required this.layout});
  final PpSynLayout layout;

  @override
  State<PpSynopticView> createState() => _PpSynopticViewState();
}

class _PpSynopticViewState extends State<PpSynopticView> {
  final _ctrl = TransformationController();
  double? _fittedFor;

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _fit(double viewportW) {
    final w = widget.layout.size.width;
    final scale = math.min(1.0, viewportW / w);
    _fittedFor = viewportW;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _ctrl.value = Matrix4.diagonal3Values(scale, scale, 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, box) {
      if (_fittedFor != box.maxWidth) _fit(box.maxWidth);
      return InteractiveViewer(
        transformationController: _ctrl,
        constrained: false,
        minScale: 0.1,
        maxScale: 3,
        boundaryMargin: const EdgeInsets.all(600),
        child: SizedBox(
          width: widget.layout.size.width,
          height: widget.layout.size.height,
          child: CustomPaint(painter: PpSynopticPainter(widget.layout)),
        ),
      );
    });
  }
}
