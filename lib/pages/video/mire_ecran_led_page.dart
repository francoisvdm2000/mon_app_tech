import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../app/ui/widgets.dart'; // intFormatter, ExpandSectionCard
import '../../app/utils/png_exporter.dart';
import '../../l10n/app_localizations.dart'; // ✅ TON AppLocalizations

import 'mire_painters.dart';
import 'mire_texts.dart'; // ✅ MireTexts unique (doit être la seule source)

class _FormDropdown<T> extends StatelessWidget {
  const _FormDropdown({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final String label;
  final T value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(labelText: label),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          isExpanded: true,
          items: items,
          onChanged: (v) {
            if (v == null) return;
            onChanged(v);
          },
        ),
      ),
    );
  }
}

class MireEcranLedPage extends StatefulWidget {
  const MireEcranLedPage({super.key});

  @override
  State<MireEcranLedPage> createState() => _MireEcranLedPageState();
}

class _MireEcranLedPageState extends State<MireEcranLedPage> {
  // Mur = tilesX/tilesY
  final _tilesXCtrl = TextEditingController(text: '15');
  final _tilesYCtrl = TextEditingController(text: '8');

  // Tile px
  final _tileWpxCtrl = TextEditingController(text: '128');
  final _tileHpxCtrl = TextEditingController(text: '128');

  // Tile cm (physique)
  final _tileWcmCtrl = TextEditingController(text: '33.28');
  final _tileHcmCtrl = TextEditingController(text: '33.28');

  LedMireType _type = LedMireType.tilesId;
  String _err = '';

  @override
  void dispose() {
    _tilesXCtrl.dispose();
    _tilesYCtrl.dispose();
    _tileWpxCtrl.dispose();
    _tileHpxCtrl.dispose();
    _tileWcmCtrl.dispose();
    _tileHcmCtrl.dispose();
    super.dispose();
  }

  int? _i(TextEditingController c) => int.tryParse(c.text.trim());
  double? _d(TextEditingController c) {
    final t = c.text.trim().replaceAll(',', '.');
    return double.tryParse(t);
  }

  int get _tilesX => _i(_tilesXCtrl) ?? 0;
  int get _tilesY => _i(_tilesYCtrl) ?? 0;

  int get _tileWpx => _i(_tileWpxCtrl) ?? 0;
  int get _tileHpx => _i(_tileHpxCtrl) ?? 0;

  double get _tileWcm => _d(_tileWcmCtrl) ?? 0;
  double get _tileHcm => _d(_tileHcmCtrl) ?? 0;

  int get _wallWpx => (_tilesX > 0 && _tileWpx > 0) ? _tilesX * _tileWpx : 0;
  int get _wallHpx => (_tilesY > 0 && _tileHpx > 0) ? _tilesY * _tileHpx : 0;

  double? get _pitchXmm {
    if (_tileWpx <= 0 || _tileWcm <= 0) return null;
    final mm = _tileWcm * 10.0;
    return mm / _tileWpx;
  }

  double? get _pitchYmm {
    if (_tileHpx <= 0 || _tileHcm <= 0) return null;
    final mm = _tileHcm * 10.0;
    return mm / _tileHpx;
  }

  String _pitchLabel(AppLocalizations loc) {
    final px = _pitchXmm;
    final py = _pitchYmm;
    if (px == null || py == null) return loc.mireDash;

    final diff = (px - py).abs();
    if (diff <= 0.05) {
      final avg = (px + py) / 2.0;
      return loc.mirePitchEqual(avg.toStringAsFixed(2));
    }
    return loc.mirePitchXY(px.toStringAsFixed(2), py.toStringAsFixed(2));
  }

  MireTexts _texts(AppLocalizations loc) => MireTexts.fromLoc(loc);

  void _validate(AppLocalizations loc) {
    final tilesX = _tilesX;
    final tilesY = _tilesY;
    final tw = _tileWpx;
    final th = _tileHpx;
    final twcm = _tileWcm;
    final thcm = _tileHcm;

    if (tilesX <= 0 || tilesY <= 0) {
      setState(() => _err = loc.mireLedErrTilesXY);
      return;
    }
    if (tw <= 0 || th <= 0) {
      setState(() => _err = loc.mireLedErrTilePx);
      return;
    }
    if (twcm <= 0 || thcm <= 0) {
      setState(() => _err = loc.mireLedErrTileCm);
      return;
    }

    final px = _pitchXmm;
    final py = _pitchYmm;
    if (px == null || py == null) {
      setState(() => _err = '');
      return;
    }

    // pitch "absurde"
    if (px < 0.5 || px > 20 || py < 0.5 || py > 20) {
      setState(() => _err = loc.mireLedWarnPitchOutOfRange);
      return;
    }

    // pitch X vs Y très différent
    if ((px - py).abs() > 0.20) {
      setState(() => _err = loc.mireLedWarnPitchXNotY);
      return;
    }

    setState(() => _err = '');
  }

  Widget _previewBox({
    required int w,
    required int h,
    required CustomPainter painter,
  }) {
    return AspectRatio(
      aspectRatio: w / h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CustomPaint(painter: painter),
        ),
      ),
    );
  }

  Future<Uint8List> _renderToPngBytes({
    required int widthPx,
    required int heightPx,
    required CustomPainter painter,
  }) async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final size = Size(widthPx.toDouble(), heightPx.toDouble());

    canvas.drawRect(Offset.zero & size, Paint()..color = Colors.black);
    painter.paint(canvas, size);

    final picture = recorder.endRecording();
    final img = await picture.toImage(widthPx, heightPx);
    final bytes = await img.toByteData(format: ui.ImageByteFormat.png);
    return bytes!.buffer.asUint8List();
  }

  Future<void> _exportLed(AppLocalizations loc) async {
    _validate(loc);
    if (_err.startsWith('❌')) return;

    final wallW = _wallWpx;
    final wallH = _wallHpx;

    final painter = LedMirePainter(
      widthPx: wallW,
      heightPx: wallH,
      type: _type,
      texts: _texts(loc),
      tileWpx: (_type == LedMireType.tilesId) ? _tileWpx : null,
      tileHpx: (_type == LedMireType.tilesId) ? _tileHpx : null,
      tileWcm: (_type == LedMireType.tilesId) ? _tileWcm : null,
      tileHcm: (_type == LedMireType.tilesId) ? _tileHcm : null,
      tilesX: _tilesX,
      tilesY: _tilesY,
    );

    final png = await _renderToPngBytes(
        widthPx: wallW, heightPx: wallH, painter: painter);

    final typeName = _type.name;
    final filename = 'mire_led_${wallW}x$wallH'
        '_tiles${_tilesX}x$_tilesY'
        '_tile${_tileWpx}x${_tileHpx}px'
        '_tile${_tileWcm.toStringAsFixed(2)}x${_tileHcm.toStringAsFixed(2)}cm'
        '_$typeName.png';

    await exportPngBytes(png, filename);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    final wallW = _wallWpx > 0 ? _wallWpx : 1920;
    final wallH = _wallHpx > 0 ? _wallHpx : 1080;

    final painter = LedMirePainter(
      widthPx: wallW,
      heightPx: wallH,
      type: _type,
      texts: _texts(loc),
      tileWpx: (_type == LedMireType.tilesId)
          ? (_tileWpx > 0 ? _tileWpx : 128)
          : null,
      tileHpx: (_type == LedMireType.tilesId)
          ? (_tileHpx > 0 ? _tileHpx : 128)
          : null,
      tileWcm: (_type == LedMireType.tilesId)
          ? (_tileWcm > 0 ? _tileWcm : 33.28)
          : null,
      tileHcm: (_type == LedMireType.tilesId)
          ? (_tileHcm > 0 ? _tileHcm : 33.28)
          : null,
      tilesX: _tilesX > 0 ? _tilesX : null,
      tilesY: _tilesY > 0 ? _tilesY : null,
    );

    final isError = _err.startsWith('❌');

    return Scaffold(
      appBar: AppBar(title: Text(loc.videoMireScreenLedTitle)),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
          child: Column(
            children: [
              ExpandSectionCard(
                title: loc.mireLedParamsTitle,
                icon: Icons.view_quilt,
                initiallyExpanded: true,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _tilesXCtrl,
                            keyboardType: TextInputType.number,
                            inputFormatters: [intFormatter],
                            decoration: InputDecoration(
                                labelText: loc.mireLedTilesXLabel),
                            onChanged: (_) => _validate(loc),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            controller: _tilesYCtrl,
                            keyboardType: TextInputType.number,
                            inputFormatters: [intFormatter],
                            decoration: InputDecoration(
                                labelText: loc.mireLedTilesYLabel),
                            onChanged: (_) => _validate(loc),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _tileWpxCtrl,
                            keyboardType: TextInputType.number,
                            inputFormatters: [intFormatter],
                            decoration: InputDecoration(
                                labelText: loc.mireLedTileWpxLabel),
                            onChanged: (_) => _validate(loc),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            controller: _tileHpxCtrl,
                            keyboardType: TextInputType.number,
                            inputFormatters: [intFormatter],
                            decoration: InputDecoration(
                                labelText: loc.mireLedTileHpxLabel),
                            onChanged: (_) => _validate(loc),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _tileWcmCtrl,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            decoration: InputDecoration(
                                labelText: loc.mireLedTileWcmLabel),
                            onChanged: (_) => _validate(loc),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            controller: _tileHcmCtrl,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            decoration: InputDecoration(
                                labelText: loc.mireLedTileHcmLabel),
                            onChanged: (_) => _validate(loc),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _FormDropdown<LedMireType>(
                      label: loc.mireTypeLabel,
                      value: _type,
                      items: [
                        DropdownMenuItem(
                            value: LedMireType.tilesId,
                            child: Text(loc.mireLedTypeTilesId)),
                        DropdownMenuItem(
                            value: LedMireType.pixelPerfect,
                            child: Text(loc.mireLedTypePixelPerfect)),
                        DropdownMenuItem(
                            value: LedMireType.gridLabels,
                            child: Text(loc.mireLedTypeGridLabels)),
                        DropdownMenuItem(
                            value: LedMireType.colorBars,
                            child: Text(loc.mireLedTypeColorBars)),
                        DropdownMenuItem(
                            value: LedMireType.uniformity,
                            child: Text(loc.mireLedTypeUniformity)),
                      ],
                      onChanged: (v) {
                        setState(() => _type = v);
                        _validate(loc);
                      },
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        loc.mireLedWallResolution(
                          _wallWpx > 0 ? _wallWpx.toString() : loc.mireDash,
                          _wallHpx > 0 ? _wallHpx.toString() : loc.mireDash,
                        ),
                        style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.80)),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        loc.mireLedPitchComputed(_pitchLabel(loc)),
                        style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.70)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => _exportLed(loc),
                            icon: const Icon(Icons.image_outlined),
                            label: Text(loc.mireExportPng),
                          ),
                        ),
                      ],
                    ),
                    if (_err.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _err,
                          style: TextStyle(
                            color: isError
                                ? Colors.redAccent
                                : Colors.orangeAccent,
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 12),
                    _previewBox(w: wallW, h: wallH, painter: painter),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
