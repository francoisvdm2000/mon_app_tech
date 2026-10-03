import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../app/ui/widgets.dart'; // intFormatter, numFormatter, ExpandSectionCard
import '../../app/utils/png_exporter.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import 'mire_painters.dart' as mp;
import 'mire_texts.dart';
import '../about/about_favorites.dart';
import 'package:mon_app_tech/app/constants.dart';

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

class MireEcranVideoPage extends StatefulWidget {
  const MireEcranVideoPage({super.key});

  @override
  State<MireEcranVideoPage> createState() => _MireEcranVideoPageState();
}

class _MireEcranVideoPageState extends State<MireEcranVideoPage> {
  // --- Mire simple
  final _wSimpleCtrl = TextEditingController(text: '1920');
  final _hSimpleCtrl = TextEditingController(text: '1080');
  mp.VideoSimpleMireType _simpleType = mp.VideoSimpleMireType.comboAll;

  // --- Mire mapping
  final _wMapCtrl = TextEditingController(text: '3840');
  final _hMapCtrl = TextEditingController(text: '2160');
  final _nProjCtrl = TextEditingController(text: '2');
  final _overlapCtrl = TextEditingController(text: '10.0');
  MappingOrientation _orientation = MappingOrientation.horizontal;
  mp.VideoMappingMireType _mapType = mp.VideoMappingMireType.combo;

  String _errSimple = '';
  String _errMap = '';

  @override
  void dispose() {
    _wSimpleCtrl.dispose();
    _hSimpleCtrl.dispose();
    _wMapCtrl.dispose();
    _hMapCtrl.dispose();
    _nProjCtrl.dispose();
    _overlapCtrl.dispose();
    super.dispose();
  }

  int? _i(TextEditingController c) => int.tryParse(c.text.trim());
  double? _d(TextEditingController c) =>
      double.tryParse(c.text.trim().replaceAll(',', '.'));

  MireTexts _texts(AppLocalizations loc) => MireTexts.fromLoc(loc);

  void _validateSimple() {
    final w = _i(_wSimpleCtrl);
    final h = _i(_hSimpleCtrl);

    if (w == null || h == null || w <= 0 || h <= 0) {
      setState(() => _errSimple =
          AppLocalizations.of(context).mireVideoErrorInvalidWidthHeight);
      return;
    }
    setState(() => _errSimple = '');
  }

  void _validateMapping() {
    final w = _i(_wMapCtrl);
    final h = _i(_hMapCtrl);
    final n = _i(_nProjCtrl);
    final ov = _d(_overlapCtrl);

    if (w == null || h == null || w <= 0 || h <= 0) {
      setState(() => _errMap =
          AppLocalizations.of(context).mireVideoErrorInvalidWidthHeight);
      return;
    }
    if (n == null || n <= 0) {
      setState(() => _errMap =
          AppLocalizations.of(context).mireVideoErrorInvalidProjectorCount);
      return;
    }
    if (ov == null || ov < 0 || ov >= 100) {
      setState(() =>
          _errMap = AppLocalizations.of(context).mireVideoErrorInvalidOverlap);
      return;
    }
    setState(() => _errMap = '');
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

  Future<void> _exportSimple() async {
    _validateSimple();
    if (_errSimple.isNotEmpty) return;

    final loc = AppLocalizations.of(context);
    final texts = _texts(loc);

    final w = _i(_wSimpleCtrl)!;
    final h = _i(_hSimpleCtrl)!;

    final painter = mp.VideoSimpleMirePainter(
      texts: texts,
      widthPx: w,
      heightPx: h,
      type: _simpleType,
    );

    final png =
        await _renderToPngBytes(widthPx: w, heightPx: h, painter: painter);
    final filename = 'mire_video_simple_${w}x${h}_${_simpleType.name}.png';
    if (!mounted) return;
    await exportPngBytes(context, png, filename);
  }

  Future<void> _exportMapping() async {
    _validateMapping();
    if (_errMap.isNotEmpty) return;

    final loc = AppLocalizations.of(context);
    final texts = _texts(loc);

    final w = _i(_wMapCtrl)!;
    final h = _i(_hMapCtrl)!;
    final n = _i(_nProjCtrl)!;
    final ov = _d(_overlapCtrl)!;

    final painter = mp.VideoMappingMirePainter(
      texts: texts,
      widthPx: w,
      heightPx: h,
      nProjectors: n,
      overlapPercent: ov,
      orientation: _orientation,
      type: _mapType,
    );

    final png =
        await _renderToPngBytes(widthPx: w, heightPx: h, painter: painter);

    final oriTag = _orientation == MappingOrientation.horizontal ? 'H' : 'V';
    final ovTag = ov.toStringAsFixed(1).replaceAll('.', '_');
    final filename =
        'mire_video_mapping_${w}x${h}_N${n}_ov${ovTag}_${oriTag}_${_mapType.name}.png';

    if (!mounted) return;
    await exportPngBytes(context, png, filename);
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    final loc = AppLocalizations.of(context);
    final texts = _texts(loc);

    final wSimple = _i(_wSimpleCtrl) ?? 1920;
    final hSimple = _i(_hSimpleCtrl) ?? 1080;

    final wMap = _i(_wMapCtrl) ?? 3840;
    final hMap = _i(_hMapCtrl) ?? 2160;
    final nMap = _i(_nProjCtrl) ?? 2;
    final ovMap = _d(_overlapCtrl) ?? 10.0;

    final simplePainter = mp.VideoSimpleMirePainter(
      texts: texts,
      widthPx: wSimple,
      heightPx: hSimple,
      type: _simpleType,
    );

    final mapPainter = mp.VideoMappingMirePainter(
      texts: texts,
      widthPx: wMap,
      heightPx: hMap,
      nProjectors: nMap,
      overlapPercent: ovMap,
      orientation: _orientation,
      type: _mapType,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.mireVideoPageTitle),
        actions: const [
          AboutPinButton(pageId: 'tool:video_mire_ecran_video', sectionId: 'main'),
          SizedBox(width: 4),
        ],
      ),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
          child: Column(
            children: [
              ExpandSectionCard(
                accentColor: kSectionVideo,
                title: loc.mireVideoSimpleSectionTitle,
                icon: Icons.tv,
                initiallyExpanded: true,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _wSimpleCtrl,
                            keyboardType: TextInputType.number,
                            inputFormatters: [intFormatter],
                            decoration: InputDecoration(
                              labelText: loc.mireVideoWidthPxLabel,
                              hintText: loc.mireVideoHint1920,
                            ),
                            onChanged: (_) => _validateSimple(),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            controller: _hSimpleCtrl,
                            keyboardType: TextInputType.number,
                            inputFormatters: [intFormatter],
                            decoration: InputDecoration(
                              labelText: loc.mireVideoHeightPxLabel,
                              hintText: loc.mireVideoHint1080,
                            ),
                            onChanged: (_) => _validateSimple(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _FormDropdown<mp.VideoSimpleMireType>(
                      label: loc.mireVideoTestPatternTypeLabel,
                      value: _simpleType,
                      items: [
                        DropdownMenuItem(
                          value: mp.VideoSimpleMireType.comboAll,
                          child: Text(loc.mireVideoSimpleTypeComboAll),
                        ),
                        DropdownMenuItem(
                          value: mp.VideoSimpleMireType.gridSafe,
                          child: Text(loc.mireVideoSimpleTypeGridSafe),
                        ),
                        DropdownMenuItem(
                          value: mp.VideoSimpleMireType.colorBars,
                          child: Text(loc.mireVideoSimpleTypeColorBars),
                        ),
                        DropdownMenuItem(
                          value: mp.VideoSimpleMireType.uniformity,
                          child: Text(loc.mireVideoSimpleTypeUniformity),
                        ),
                        DropdownMenuItem(
                          value: mp.VideoSimpleMireType.checkerboard,
                          child: Text(loc.mireVideoSimpleTypeCheckerboard),
                        ),
                      ],
                      onChanged: (v) {
                        setState(() => _simpleType = v);
                        _validateSimple();
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _exportSimple,
                            icon: const Icon(Icons.image_outlined),
                            label: Text(loc.mireVideoExportPngButton),
                          ),
                        ),
                      ],
                    ),
                    if (_errSimple.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _errSimple,
                          style: const TextStyle(color: Colors.redAccent),
                        ),
                      ),
                    ],
                    const SizedBox(height: 12),
                    _previewBox(w: wSimple, h: hSimple, painter: simplePainter),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              ExpandSectionCard(
                accentColor: kSectionVideo,
                title: loc.mireVideoMappingSectionTitle,
                icon: Icons.auto_awesome_mosaic,
                initiallyExpanded: true,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _wMapCtrl,
                            keyboardType: TextInputType.number,
                            inputFormatters: [intFormatter],
                            decoration: InputDecoration(
                              labelText: loc.mireVideoWidthPxLabel,
                              hintText: loc.mireVideoHint3840,
                            ),
                            onChanged: (_) => _validateMapping(),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            controller: _hMapCtrl,
                            keyboardType: TextInputType.number,
                            inputFormatters: [intFormatter],
                            decoration: InputDecoration(
                              labelText: loc.mireVideoHeightPxLabel,
                              hintText: loc.mireVideoHint2160,
                            ),
                            onChanged: (_) => _validateMapping(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _nProjCtrl,
                            keyboardType: TextInputType.number,
                            inputFormatters: [intFormatter],
                            decoration: InputDecoration(
                              labelText: loc.mireVideoProjectorCountLabel,
                              hintText: loc.mireVideoHint2,
                            ),
                            onChanged: (_) => _validateMapping(),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            controller: _overlapCtrl,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                              signed: false,
                            ),
                            inputFormatters: [numFormatter],
                            decoration: InputDecoration(
                              labelText: loc.mireVideoOverlapPercentLabel,
                              hintText: loc.mireVideoHint10Percent,
                            ),
                            onChanged: (_) => _validateMapping(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _FormDropdown<MappingOrientation>(
                      label: loc.mireVideoOrientationLabel,
                      value: _orientation,
                      items: [
                        DropdownMenuItem(
                          value: MappingOrientation.horizontal,
                          child: Text(loc.mireVideoOrientationHorizontal),
                        ),
                        DropdownMenuItem(
                          value: MappingOrientation.vertical,
                          child: Text(loc.mireVideoOrientationVertical),
                        ),
                      ],
                      onChanged: (v) {
                        setState(() => _orientation = v);
                        _validateMapping();
                      },
                    ),
                    const SizedBox(height: 12),
                    _FormDropdown<mp.VideoMappingMireType>(
                      label: loc.mireVideoMappingTypeLabel,
                      value: _mapType,
                      items: [
                        DropdownMenuItem(
                          value: mp.VideoMappingMireType.combo,
                          child: Text(loc.mireVideoMappingTypeCombo),
                        ),
                        DropdownMenuItem(
                          value: mp.VideoMappingMireType.zonesAndOverlap,
                          child: Text(loc.mireVideoMappingTypeZonesAndOverlap),
                        ),
                        DropdownMenuItem(
                          value: mp.VideoMappingMireType.blendRamps,
                          child: Text(loc.mireVideoMappingTypeBlendRamps),
                        ),
                      ],
                      onChanged: (v) {
                        setState(() => _mapType = v);
                        _validateMapping();
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _exportMapping,
                            icon: const Icon(Icons.image_outlined),
                            label: Text(loc.mireVideoExportPngButton),
                          ),
                        ),
                      ],
                    ),
                    if (_errMap.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _errMap,
                          style: const TextStyle(color: Colors.redAccent),
                        ),
                      ),
                    ],
                    const SizedBox(height: 12),
                    _previewBox(w: wMap, h: hMap, painter: mapPainter),
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
