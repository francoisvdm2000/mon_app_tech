// lib/pages/safety/widgets/signature_pad.dart
//
// Zone de signature au doigt, sans dépendance externe. Le tracé est exporté
// en PNG (trait noir sur fond transparent) pour être intégré aux PDF.
// Réutilisé par le plan de sécurité et par l'attestation de bon montage.

import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../../l10n_gen/app_localizations.dart';
import '../safety_theme.dart';

class SignaturePadController extends ChangeNotifier {
  final List<List<Offset>> _strokes = [];

  List<List<Offset>> get strokes => _strokes;
  bool get isEmpty => _strokes.every((s) => s.isEmpty);

  void _start(Offset p) {
    _strokes.add([p]);
    notifyListeners();
  }

  void _extend(Offset p) {
    if (_strokes.isEmpty) return;
    _strokes.last.add(p);
    notifyListeners();
  }

  void clear() {
    _strokes.clear();
    notifyListeners();
  }

  /// Rendu PNG du tracé, recadré sur la signature.
  Future<Uint8List?> toPng({double pixelRatio = 3}) async {
    final points = [for (final s in _strokes) ...s];
    if (points.isEmpty) return null;

    var minX = points.first.dx, maxX = points.first.dx;
    var minY = points.first.dy, maxY = points.first.dy;
    for (final p in points) {
      if (p.dx < minX) minX = p.dx;
      if (p.dx > maxX) maxX = p.dx;
      if (p.dy < minY) minY = p.dy;
      if (p.dy > maxY) maxY = p.dy;
    }
    const margin = 8.0;
    final origin = Offset(minX - margin, minY - margin);
    final size = Size(maxX - minX + 2 * margin, maxY - minY + 2 * margin);

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    canvas.scale(pixelRatio);
    canvas.translate(-origin.dx, -origin.dy);
    _SignaturePainter.paintStrokes(canvas, _strokes, Colors.black);
    final picture = recorder.endRecording();
    final image = await picture.toImage(
      (size.width * pixelRatio).ceil(),
      (size.height * pixelRatio).ceil(),
    );
    final data = await image.toByteData(format: ui.ImageByteFormat.png);
    return data?.buffer.asUint8List();
  }
}

class SignaturePad extends StatelessWidget {
  final SignaturePadController controller;
  final double height;

  const SignaturePad({super.key, required this.controller, this.height = 200});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      clipBehavior: Clip.antiAlias,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanStart: (d) => controller._start(d.localPosition),
        onPanUpdate: (d) => controller._extend(d.localPosition),
        child: AnimatedBuilder(
          animation: controller,
          builder: (_, __) => CustomPaint(
            painter: _SignaturePainter(controller.strokes),
            size: Size.infinite,
          ),
        ),
      ),
    );
  }
}

class _SignaturePainter extends CustomPainter {
  final List<List<Offset>> strokes;
  _SignaturePainter(this.strokes);

  static void paintStrokes(
      Canvas canvas, List<List<Offset>> strokes, Color color) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.6
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;
    for (final s in strokes) {
      if (s.isEmpty) continue;
      if (s.length == 1) {
        canvas.drawCircle(s.first, 1.4, paint..style = PaintingStyle.fill);
        paint.style = PaintingStyle.stroke;
        continue;
      }
      final path = Path()..moveTo(s.first.dx, s.first.dy);
      for (var i = 1; i < s.length; i++) {
        path.lineTo(s[i].dx, s[i].dy);
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  void paint(Canvas canvas, Size size) =>
      paintStrokes(canvas, strokes, const Color(0xFF1A1C20));

  @override
  bool shouldRepaint(covariant _SignaturePainter old) => true;
}

/// Résultat d'une signature : nom du signataire et image PNG.
class SignatureResult {
  final String name;
  final Uint8List png;
  const SignatureResult(this.name, this.png);
}

/// Feuille de signature : nom du signataire + zone de signature.
Future<SignatureResult?> showSignatureSheet(
  BuildContext context, {
  required String title,
  String initialName = '',
}) {
  final loc = AppLocalizations.of(context);
  final controller = SignaturePadController();
  final nameCtrl = TextEditingController(text: initialName);

  return showModalBottomSheet<SignatureResult>(
    context: context,
    isScrollControlled: true,
    enableDrag: false, // sinon le tracé vers le bas ferme la feuille
    backgroundColor: kSafetySheetBg,
    showDragHandle: true,
    builder: (ctx) => Padding(
      padding: EdgeInsets.fromLTRB(
          20, 0, 20, 20 + MediaQuery.viewInsetsOf(ctx).bottom +
                MediaQuery.paddingOf(ctx).bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.white)),
          const SizedBox(height: 12),
          TextField(
            controller: nameCtrl,
            textCapitalization: TextCapitalization.words,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(labelText: loc.ppspsSignName),
          ),
          const SizedBox(height: 12),
          Text(loc.ppspsSignHint,
              style: TextStyle(color: Colors.white.withValues(alpha: 0.6))),
          const SizedBox(height: 8),
          SignaturePad(controller: controller),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(50),
                    side:
                        BorderSide(color: Colors.white.withValues(alpha: 0.2)),
                  ),
                  onPressed: controller.clear,
                  child: Text(loc.ppspsSignClear),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: kSafetyAccent,
                    foregroundColor: kSafetyOnAccent,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () async {
                    if (controller.isEmpty) return;
                    final png = await controller.toPng();
                    if (png == null || !ctx.mounted) return;
                    Navigator.pop(
                        ctx, SignatureResult(nameCtrl.text.trim(), png));
                  },
                  child: Text(loc.ppspsSignValidate,
                      style: const TextStyle(fontWeight: FontWeight.w700)),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ).whenComplete(() {
    // Libération après l'animation de fermeture de la feuille, pour ne pas
    // retirer les contrôleurs à des widgets encore affichés.
    Future.delayed(const Duration(milliseconds: 500), () {
      controller.dispose();
      nameCtrl.dispose();
    });
  });
}
