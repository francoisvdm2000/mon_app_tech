import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../app/ui/widgets.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

/// =======================
/// SOUS-PAGE : CALCULATEUR VIDÉO
/// =======================
class VideoCalculationsPage extends StatefulWidget {
  const VideoCalculationsPage({super.key});

  @override
  State<VideoCalculationsPage> createState() => _VideoCalculationsPageState();
}

class _VideoCalculationsPageState extends State<VideoCalculationsPage> {
  String _format = '16:9';

  final _distanceCtrl = TextEditingController();
  final _largeurCtrl = TextEditingController();
  final _ratioCtrl = TextEditingController();
  final _lumensCtrl = TextEditingController();
  final _gainCtrl = TextEditingController(text: '1.0');
  final _overlapPercentCtrl = TextEditingController(text: '10');
  final _largeurTotaleCtrl = TextEditingController();

  String _screenPresetKey = 'front_white_1_0';
  double _minFl = 16.0;

  final _calc5NCtrl = TextEditingController(text: '2');

  final _calc6RatioMinCtrl = TextEditingController();
  final _calc6RatioMaxCtrl = TextEditingController();
  final _calc6LumensPerProjCtrl = TextEditingController();
  final _calc6GainCtrl = TextEditingController(text: '1.0');

  String r1 = '';
  String r2 = '';
  String r3 = '';
  String r4 = '';
  String r5 = '';
  String r6 = '';

  void _unfocus() => FocusManager.instance.primaryFocus?.unfocus();

  @override
  void dispose() {
    _distanceCtrl.dispose();
    _largeurCtrl.dispose();
    _ratioCtrl.dispose();
    _lumensCtrl.dispose();
    _gainCtrl.dispose();
    _overlapPercentCtrl.dispose();
    _largeurTotaleCtrl.dispose();

    _calc5NCtrl.dispose();

    _calc6RatioMinCtrl.dispose();
    _calc6RatioMaxCtrl.dispose();
    _calc6LumensPerProjCtrl.dispose();
    _calc6GainCtrl.dispose();
    super.dispose();
  }

  double _ratioWHFromFormat(String fmt) {
    switch (fmt) {
      case '16:10':
        return 16 / 10;
      case '4:3':
        return 4 / 3;
      case '21:9':
        return 21 / 9;
      case '16:9':
      default:
        return 16 / 9;
    }
  }

  double? _d(TextEditingController c) {
    final t = c.text.trim().replaceAll(',', '.');
    return double.tryParse(t);
  }

  int? _i(TextEditingController c) {
    final t = c.text.trim();
    return int.tryParse(t);
  }

  void _applyScreenPreset(String key) {
    double gain;
    double minFl;

    switch (key) {
      case 'front_white_1_0':
        gain = 1.0;
        minFl = 16.0;
        break;
      case 'front_grey_0_8':
        gain = 0.8;
        minFl = 16.0;
        break;
      case 'front_highgain_1_3':
        gain = 1.3;
        minFl = 16.0;
        break;

      case 'rear_diffusion_0_7':
        gain = 0.7;
        minFl = 10.0;
        break;
      case 'rear_clear_0_9':
        gain = 0.9;
        minFl = 10.0;
        break;

      case 'mapping_matte_0_75':
        gain = 0.75;
        minFl = 30.0;
        break;
      case 'mapping_satin_0_9':
        gain = 0.9;
        minFl = 30.0;
        break;
      case 'mapping_lightstone_0_6':
        gain = 0.6;
        minFl = 35.0;
        break;
      case 'mapping_darkstone_0_35':
        gain = 0.35;
        minFl = 45.0;
        break;
      case 'mapping_glass_0_15':
        gain = 0.15;
        minFl = 60.0;
        break;

      default:
        gain = 1.0;
        minFl = 16.0;
    }

    setState(() {
      _screenPresetKey = key;
      _minFl = minFl;
      _gainCtrl.text = gain.toStringAsFixed(2);
    });
  }

  List<Widget> _summaryPills() {
    final loc = AppLocalizations.of(context);

    final d = _d(_distanceCtrl);
    final w = _d(_largeurCtrl);
    final ratio = _d(_ratioCtrl);
    final wTot = _d(_largeurTotaleCtrl);
    final overlap = _d(_overlapPercentCtrl);

    double? h;
    double? area;

    if (w != null && w > 0) {
      final ratioWH = _ratioWHFromFormat(_format);
      h = w / ratioWH;
      area = w * h;
    }

    String fmt(double? v, {int dec = 2, String unit = ''}) =>
        v == null ? '-' : '${v.toStringAsFixed(dec)}$unit';

    return [
      MiniPill(loc.videoCommonPillFormat(_format)),
      MiniPill(loc.videoCommonPillDistance(fmt(d, dec: 2, unit: ' m'))),
      MiniPill(loc.videoCommonPillWidth(fmt(w, dec: 2, unit: ' m'))),
      MiniPill(loc.videoCommonPillRatio(fmt(ratio, dec: 3))),
      MiniPill(loc.videoCommonPillHeight(fmt(h, dec: 2, unit: ' m'))),
      MiniPill(loc.videoCommonPillArea(fmt(area, dec: 2, unit: ' m²'))),
      MiniPill(loc.videoCommonPillTotalWidth(fmt(wTot, dec: 2, unit: ' m'))),
      MiniPill(loc.videoCommonPillOverlap(fmt(overlap, dec: 1, unit: ' %'))),
    ];
  }

  InputDecoration _dec(String label, String hint) =>
      InputDecoration(labelText: label, hintText: hint);

  Widget _numField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputAction? action,
    VoidCallback? onDone,
  }) {
    return TextField(
      controller: controller,
      keyboardType:
          const TextInputType.numberWithOptions(decimal: true, signed: false),
      inputFormatters: [numFormatter],
      textInputAction: action,
      onSubmitted: (_) => onDone?.call(),
      decoration: _dec(label, hint),
    );
  }

  // =======================
  // CALCULS
  // =======================
  void calc1() {
    final loc = AppLocalizations.of(context);

    final d = _d(_distanceCtrl);
    final w = _d(_largeurCtrl);

    if (d == null || w == null) {
      setState(() => r1 = loc.videoCalc1ErrMissing);
      return;
    }
    if (w <= 0) {
      setState(() => r1 = loc.videoErrWidthGt0);
      return;
    }

    final ratio = d / w;
    setState(() {
      r1 = loc.videoCalc1Ok(ratio.toStringAsFixed(3));
      if (_ratioCtrl.text.trim().isEmpty) {
        _ratioCtrl.text = ratio.toStringAsFixed(3);
      }
    });
  }

  void calc2() {
    final loc = AppLocalizations.of(context);

    final d = _d(_distanceCtrl);
    final ratio = _d(_ratioCtrl);

    if (d == null || ratio == null) {
      setState(() => r2 = loc.videoCalc2ErrMissing);
      return;
    }
    if (ratio <= 0) {
      setState(() => r2 = loc.videoErrRatioGt0);
      return;
    }

    final w = d / ratio;
    setState(() => r2 = loc.videoCalc2Ok(w.toStringAsFixed(3)));
  }

  void calc3() {
    final loc = AppLocalizations.of(context);

    final w = _d(_largeurCtrl);
    if (w == null) {
      setState(() => r3 = loc.videoCalc3ErrMissingWidth);
      return;
    }
    if (w <= 0) {
      setState(() => r3 = loc.videoErrWidthGt0);
      return;
    }

    final ratioWH = _ratioWHFromFormat(_format);
    final h = w / ratioWH;
    setState(() => r3 = loc.videoCalc3Ok(h.toStringAsFixed(3), _format));
  }

  void calc4() {
    final loc = AppLocalizations.of(context);

    final lumens = _d(_lumensCtrl);
    final gain = _d(_gainCtrl);
    final w = _d(_largeurCtrl);

    if (lumens == null || gain == null || w == null) {
      setState(() => r4 = loc.videoCalc4ErrMissing);
      return;
    }
    if (lumens <= 0 || gain <= 0 || w <= 0) {
      setState(() => r4 = loc.videoCalc4ErrGt0);
      return;
    }

    final ratioWH = _ratioWHFromFormat(_format);
    final h = w / ratioWH;
    final area = w * h;

    final lux = lumens / area;
    final luxEq = (lumens * gain) / area;

    final nits = (lumens * gain) / (math.pi * area);
    final fl = nits / 3.426;

    final ok = fl >= _minFl;

    final areaStr = area.toStringAsFixed(3);
    final luxStr = lux.toStringAsFixed(0);
    final luxEqStr = luxEq.toStringAsFixed(0);
    final nitsStr = nits.toStringAsFixed(1);
    final flStr = fl.toStringAsFixed(1);
    final presetStr = _presetLabel(_screenPresetKey);
    final minFlStr = _minFl.toStringAsFixed(0);
    final status = ok ? loc.commonOkWithCheck : loc.commonTooLowWithCross;

    setState(() {
      // ✅ 9 arguments positionnels
      r4 = loc.videoCalc4Result(
        areaStr,
        _format,
        luxStr,
        luxEqStr,
        nitsStr,
        flStr,
        presetStr,
        minFlStr,
        status,
      );
    });
  }

  void calc5() {
    final loc = AppLocalizations.of(context);

    final wTot = _d(_largeurTotaleCtrl);
    final pPercent = _d(_overlapPercentCtrl);
    final n = _i(_calc5NCtrl);

    if (wTot == null || pPercent == null || n == null) {
      setState(() => r5 = loc.videoCalc5ErrMissing);
      return;
    }
    if (wTot <= 0) {
      setState(() => r5 = loc.videoErrTotalWidthGt0);
      return;
    }
    if (n < 2) {
      setState(() => r5 = loc.videoCalc5ErrNMin2);
      return;
    }
    if (pPercent < 0 || pPercent >= 100) {
      setState(() => r5 = loc.videoErrOverlapRange);
      return;
    }

    final p = pPercent / 100.0;

    final denom = (n - (n - 1) * p);
    if (denom <= 0) {
      setState(() => r5 = loc.videoErrImpossibleDenom);
      return;
    }

    final wParProj = wTot / denom;
    final overlapM = p * wParProj;

    final ratioWH = _ratioWHFromFormat(_format);
    final hTot = wTot / ratioWH;

    // ✅ 7 arguments positionnels
    setState(() {
      r5 = loc.videoCalc5Result(
        wTot.toStringAsFixed(3),
        n.toString(),
        pPercent.toStringAsFixed(1),
        wParProj.toStringAsFixed(3),
        overlapM.toStringAsFixed(3),
        _format,
        hTot.toStringAsFixed(3),
      );
    });
  }

  void calc6() {
    final loc = AppLocalizations.of(context);

    final wTot = _d(_largeurTotaleCtrl);
    final distance = _d(_distanceCtrl);
    final pPercent = _d(_overlapPercentCtrl);

    final ratioMin = _d(_calc6RatioMinCtrl);
    final ratioMax = _d(_calc6RatioMaxCtrl);

    final lumensPerProj = _d(_calc6LumensPerProjCtrl);
    final gain = _d(_calc6GainCtrl);

    if (wTot == null || distance == null || pPercent == null) {
      setState(() => r6 = loc.videoCalc6ErrMissingBasics);
      return;
    }
    if (wTot <= 0 || distance <= 0) {
      setState(() => r6 = loc.videoErrTotalWidthAndDistanceGt0);
      return;
    }
    if (pPercent < 0 || pPercent >= 100) {
      setState(() => r6 = loc.videoErrOverlapRange);
      return;
    }

    double? a = ratioMin;
    double? b = ratioMax;

    if (a == null && b == null) {
      setState(() => r6 = loc.videoCalc6ErrMissingRatio);
      return;
    }
    a ??= b;
    b ??= a;

    if (a == null || b == null || a <= 0 || b <= 0) {
      setState(() => r6 = loc.videoErrRatioGt0);
      return;
    }

    final ratioMinOk = math.min(a, b);
    final ratioMaxOk = math.max(a, b);
    final p = pPercent / 100.0;

    double widthPerProj(double ratio) => distance / ratio;

    int computeN(double wPerProj) {
      final step = wPerProj * (1 - p);
      if (step <= 0) return 999999;
      final nDouble = 1 + ((wTot / wPerProj) - 1) / (1 - p);
      return nDouble.ceil().clamp(1, 999999);
    }

    double coverage(double wPerProj, int n) =>
        wPerProj * (1 + (n - 1) * (1 - p));

    final wAtMin = widthPerProj(ratioMinOk);
    final nAtMin = computeN(wAtMin);
    final covAtMin = coverage(wAtMin, nAtMin);

    final wAtMax = widthPerProj(ratioMaxOk);
    final nAtMax = computeN(wAtMax);
    final covAtMax = coverage(wAtMax, nAtMax);

    final ratioWH = _ratioWHFromFormat(_format);
    final hTot = wTot / ratioWH;
    final area = wTot * hTot;

    String lumiForN(int n) {
      if (lumensPerProj == null || gain == null) {
        return loc.videoCalc6LumiOptional;
      }
      if (lumensPerProj <= 0 || gain <= 0) return loc.videoCalc6LumiErrGt0;

      final totalLumensUseful = n * lumensPerProj * gain;
      final lux = totalLumensUseful / area;
      final nits = totalLumensUseful / (math.pi * area);
      final fl = nits / 3.426;

      // ✅ 5 arguments positionnels
      return loc.videoCalc6LumiForN(
        n.toString(),
        area.toStringAsFixed(2),
        lux.toStringAsFixed(0),
        nits.toStringAsFixed(1),
        fl.toStringAsFixed(1),
      );
    }

    // ✅ 15 arguments positionnels (ordre basé sur tes noms initiaux)
    setState(() {
      r6 = loc.videoCalc6Result(
        wTot.toStringAsFixed(3), // wTot
        distance.toStringAsFixed(3), // distance
        pPercent.toStringAsFixed(1), // overlapPct
        _format, // format
        hTot.toStringAsFixed(3), // hTot
        area.toStringAsFixed(2), // area
        ratioMinOk.toStringAsFixed(3), // ratioMin
        ratioMaxOk.toStringAsFixed(3), // ratioMax
        nAtMin.toString(), // nMin
        covAtMin.toStringAsFixed(3), // covMin
        lumiForN(nAtMin), // lumiMin
        nAtMax.toString(), // nMax
        covAtMax.toStringAsFixed(3), // covMax
        lumiForN(nAtMax), // lumiMax
        loc.videoCalc6NoteIndicative, // note
      );
    });
  }

  void calculerTout() {
    _unfocus();
    calc1();
    calc2();
    calc3();
    calc4();
    calc5();
    calc6();
  }

  void resetAll() {
    _unfocus();

    _distanceCtrl.clear();
    _largeurCtrl.clear();
    _ratioCtrl.clear();
    _lumensCtrl.clear();
    _gainCtrl.text = '1.0';
    _overlapPercentCtrl.text = '10';
    _largeurTotaleCtrl.clear();

    _calc5NCtrl.text = '2';

    _calc6RatioMinCtrl.clear();
    _calc6RatioMaxCtrl.clear();
    _calc6LumensPerProjCtrl.clear();
    _calc6GainCtrl.text = '1.0';

    setState(() {
      _format = '16:9';
      _screenPresetKey = 'front_white_1_0';
      _minFl = 16.0;

      r1 = '';
      r2 = '';
      r3 = '';
      r4 = '';
      r5 = '';
      r6 = '';
    });
  }

  String _presetLabel(String key) {
    final loc = AppLocalizations.of(context);
    switch (key) {
      case 'front_white_1_0':
        return loc.videoPresetFrontWhite;
      case 'front_grey_0_8':
        return loc.videoPresetFrontGrey;
      case 'front_highgain_1_3':
        return loc.videoPresetFrontHighGain;
      case 'rear_diffusion_0_7':
        return loc.videoPresetRearDiffusion;
      case 'rear_clear_0_9':
        return loc.videoPresetRearClear;
      case 'mapping_matte_0_75':
        return loc.videoPresetMappingMatte;
      case 'mapping_satin_0_9':
        return loc.videoPresetMappingSatin;
      case 'mapping_lightstone_0_6':
        return loc.videoPresetMappingLightStone;
      case 'mapping_darkstone_0_35':
        return loc.videoPresetMappingDarkStone;
      case 'mapping_glass_0_15':
        return loc.videoPresetMappingGlass;
      default:
        return loc.videoPresetFrontWhite;
    }
  }

  Future<void> exportVideoPdf() async {
    final loc = AppLocalizations.of(context);

    final doc = pw.Document();
    final now = DateTime.now();
    final dateStr =
        "${now.year.toString().padLeft(4, '0')}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} "
        "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";

    String safe(String s) => s.trim().isEmpty ? "-" : s.trim();

    final inputs = <String>[
      "${loc.videoPdfDate}: $dateStr",
      "${loc.videoPdfFormat}: $_format",
      "${loc.videoPdfDistance}: ${safe(_distanceCtrl.text)}",
      "${loc.videoPdfImageWidth}: ${safe(_largeurCtrl.text)}",
      "${loc.videoPdfRatio}: ${safe(_ratioCtrl.text)}",
      "${loc.videoPdfLumens}: ${safe(_lumensCtrl.text)}",
      "${loc.videoPdfGain}: ${safe(_gainCtrl.text)}",
      "${loc.videoPdfScreenPreset}: ${_presetLabel(_screenPresetKey)}",
      "${loc.videoPdfOverlap}: ${safe(_overlapPercentCtrl.text)}",
      "${loc.videoPdfTotalWidth}: ${safe(_largeurTotaleCtrl.text)}",
      "${loc.videoPdfCalc5N}: ${safe(_calc5NCtrl.text)}",
      "${loc.videoPdfCalc6RatioMin}: ${safe(_calc6RatioMinCtrl.text)}",
      "${loc.videoPdfCalc6RatioMax}: ${safe(_calc6RatioMaxCtrl.text)}",
      "${loc.videoPdfCalc6LumensPerProj}: ${safe(_calc6LumensPerProjCtrl.text)}",
      "${loc.videoPdfCalc6Gain}: ${safe(_calc6GainCtrl.text)}",
    ].join("\n");

    final results = <String>[
      "${loc.videoPdfCalc1}:\n${safe(r1)}",
      "${loc.videoPdfCalc2}:\n${safe(r2)}",
      "${loc.videoPdfCalc3}:\n${safe(r3)}",
      "${loc.videoPdfCalc4}:\n${safe(r4)}",
      "${loc.videoPdfCalc5}:\n${safe(r5)}",
      "${loc.videoPdfCalc6}:\n${safe(r6)}",
    ].join("\n\n");

    doc.addPage(
      pw.MultiPage(
        build: (context) => [
          pw.Text(
            loc.videoPdfTitle,
            style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 8),
          pw.Text(
            loc.disclaimerTitle,
            style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 4),
          pw.Text(loc.disclaimerText, style: const pw.TextStyle(fontSize: 9)),
          pw.Divider(),
          pw.Text(
            loc.videoPdfParams,
            style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 4),
          pw.Text(inputs, style: const pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 10),
          pw.Text(
            loc.videoPdfResults,
            style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 4),
          pw.Text(results, style: const pw.TextStyle(fontSize: 10)),
        ],
      ),
    );

    await Printing.layoutPdf(
      onLayout: (format) async => doc.save(),
      name: "export_video.pdf",
    );
  }

  Widget _calcActionsRow({
    required VoidCallback onCalc,
    required String resultText,
  }) {
    final loc = AppLocalizations.of(context);

    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: onCalc,
            icon: const Icon(Icons.calculate),
            label: Text(loc.commonCalculate),
          ),
        ),
        const SizedBox(width: 10),
        IconButton(
          tooltip: loc.commonCopyResultTooltip,
          onPressed: () => copyToClipboard(context, resultText),
          icon: const Icon(Icons.copy),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.videoCalculationsTitle),
        actions: [
          IconButton(
            tooltip: loc.videoCopyAllTooltip,
            onPressed: () {
              final all = [
                if (r1.trim().isNotEmpty) "${loc.videoCalcLabel(1)}:\n$r1",
                if (r2.trim().isNotEmpty) "${loc.videoCalcLabel(2)}:\n$r2",
                if (r3.trim().isNotEmpty) "${loc.videoCalcLabel(3)}:\n$r3",
                if (r4.trim().isNotEmpty) "${loc.videoCalcLabel(4)}:\n$r4",
                if (r5.trim().isNotEmpty) "${loc.videoCalcLabel(5)}:\n$r5",
                if (r6.trim().isNotEmpty) "${loc.videoCalcLabel(6)}:\n$r6",
              ].join("\n\n");
              copyToClipboard(context, all);
            },
            icon: const Icon(Icons.copy_all),
          ),
          IconButton(
            tooltip: loc.videoExportPdfTooltip,
            onPressed: exportVideoPdf,
            icon: const Icon(Icons.picture_as_pdf),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border(top: BorderSide(color: Colors.white.withAlpha(128))),
          ),
          child: LayoutBuilder(
            builder: (context, c) {
              final narrow = c.maxWidth < 520;

              final calcBtn = ElevatedButton.icon(
                onPressed: calculerTout,
                icon: const Icon(Icons.calculate),
                label: Text(
                  loc.videoCalculateAll,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              );

              final resetBtn = ElevatedButton.icon(
                onPressed: resetAll,
                icon: const Icon(Icons.refresh),
                label: Text(
                  loc.commonReset,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              );

              if (narrow) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: double.infinity, child: calcBtn),
                    const SizedBox(height: 10),
                    SizedBox(width: double.infinity, child: resetBtn),
                  ],
                );
              }

              return Row(
                children: [
                  Expanded(child: calcBtn),
                  const SizedBox(width: 10),
                  Expanded(child: resetBtn),
                ],
              );
            },
          ),
        ),
      ),
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(
            builder: (context, c) {
              final isWide = c.maxWidth >= 900;
              final cardWidth = isWide ? (c.maxWidth - 12) / 2 : c.maxWidth;

              Widget sized(Widget child) =>
                  SizedBox(width: cardWidth, child: child);

              final cards = <Widget>[
                sized(
                  SectionCard(
                    title: loc.videoSummaryPillsTitle,
                    icon: Icons.dashboard,
                    trailing: IconButton(
                      tooltip: loc.videoCopySummaryTooltip,
                      onPressed: () {
                        final t = _summaryPills()
                            .whereType<MiniPill>()
                            .map((p) => p.label)
                            .join(" | ");
                        copyToClipboard(context, t);
                      },
                      icon: const Icon(Icons.copy, color: Colors.white70),
                    ),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _summaryPills(),
                    ),
                  ),
                ),
                sized(
                  ExpandSectionCard(
                    title: loc.videoCommonParamsTitle,
                    icon: Icons.tune,
                    initiallyExpanded: true,
                    child: Column(
                      children: [
                        DropdownButtonFormField<String>(
                          initialValue: _format,
                          decoration:
                              InputDecoration(labelText: loc.videoFormatLabel),
                          items: const [
                            DropdownMenuItem(
                                value: '16:9', child: Text('16:9')),
                            DropdownMenuItem(
                                value: '16:10', child: Text('16:10')),
                            DropdownMenuItem(value: '4:3', child: Text('4:3')),
                            DropdownMenuItem(
                                value: '21:9', child: Text('21:9')),
                          ],
                          onChanged: (v) =>
                              setState(() => _format = v ?? '16:9'),
                        ),
                        const SizedBox(height: 12),
                        _numField(
                          controller: _distanceCtrl,
                          label: loc.videoDistanceLabel,
                          hint: loc.videoDistanceHint,
                          action: TextInputAction.next,
                        ),
                        const SizedBox(height: 12),
                        _numField(
                          controller: _largeurCtrl,
                          label: loc.videoImageWidthLabel,
                          hint: loc.videoImageWidthHint,
                          action: TextInputAction.next,
                        ),
                        const SizedBox(height: 12),
                        _numField(
                          controller: _ratioCtrl,
                          label: loc.videoThrowRatioLabel,
                          hint: loc.videoThrowRatioHint,
                          action: TextInputAction.next,
                        ),
                        const SizedBox(height: 12),
                        _numField(
                          controller: _lumensCtrl,
                          label: loc.videoLumensLabel,
                          hint: loc.videoLumensHint,
                          action: TextInputAction.next,
                        ),
                        const SizedBox(height: 12),
                        _numField(
                          controller: _gainCtrl,
                          label: loc.videoGainLabel,
                          hint: loc.videoGainHint,
                          action: TextInputAction.next,
                        ),
                        const SizedBox(height: 12),
                        DropdownButtonFormField<String>(
                          initialValue: _screenPresetKey,
                          decoration: InputDecoration(
                              labelText: loc.videoScreenPresetLabel),
                          items: [
                            DropdownMenuItem(
                                value: 'front_white_1_0',
                                child: Text(loc.videoPresetFrontWhiteShort)),
                            DropdownMenuItem(
                                value: 'front_grey_0_8',
                                child: Text(loc.videoPresetFrontGreyShort)),
                            DropdownMenuItem(
                                value: 'front_highgain_1_3',
                                child: Text(loc.videoPresetFrontHighGainShort)),
                            DropdownMenuItem(
                                value: 'rear_diffusion_0_7',
                                child: Text(loc.videoPresetRearDiffusionShort)),
                            DropdownMenuItem(
                                value: 'rear_clear_0_9',
                                child: Text(loc.videoPresetRearClearShort)),
                            DropdownMenuItem(
                                value: 'mapping_matte_0_75',
                                child: Text(loc.videoPresetMappingMatteShort)),
                            DropdownMenuItem(
                                value: 'mapping_satin_0_9',
                                child: Text(loc.videoPresetMappingSatinShort)),
                            DropdownMenuItem(
                                value: 'mapping_lightstone_0_6',
                                child: Text(
                                    loc.videoPresetMappingLightStoneShort)),
                            DropdownMenuItem(
                                value: 'mapping_darkstone_0_35',
                                child:
                                    Text(loc.videoPresetMappingDarkStoneShort)),
                            DropdownMenuItem(
                                value: 'mapping_glass_0_15',
                                child: Text(loc.videoPresetMappingGlassShort)),
                          ],
                          onChanged: (v) {
                            if (v == null) return;
                            _applyScreenPreset(v);
                          },
                        ),
                        const SizedBox(height: 12),
                        _numField(
                          controller: _overlapPercentCtrl,
                          label: loc.videoOverlapLabel,
                          hint: loc.videoOverlapHint,
                          action: TextInputAction.next,
                        ),
                        const SizedBox(height: 12),
                        _numField(
                          controller: _largeurTotaleCtrl,
                          label: loc.videoTotalWidthLabel,
                          hint: loc.videoTotalWidthHint,
                          action: TextInputAction.done,
                          onDone: calculerTout,
                        ),
                      ],
                    ),
                  ),
                ),
                sized(
                  ExpandSectionCard(
                    title: loc.videoCalc1Title,
                    icon: Icons.straighten,
                    child: Column(
                      children: [
                        _calcActionsRow(onCalc: calc1, resultText: r1),
                        const SizedBox(height: 10),
                        ResultBox(r1),
                      ],
                    ),
                  ),
                ),
                sized(
                  ExpandSectionCard(
                    title: loc.videoCalc2Title,
                    icon: Icons.swap_horiz,
                    child: Column(
                      children: [
                        _calcActionsRow(onCalc: calc2, resultText: r2),
                        const SizedBox(height: 10),
                        ResultBox(r2),
                      ],
                    ),
                  ),
                ),
                sized(
                  ExpandSectionCard(
                    title: loc.videoCalc3Title,
                    icon: Icons.height,
                    child: Column(
                      children: [
                        _calcActionsRow(onCalc: calc3, resultText: r3),
                        const SizedBox(height: 10),
                        ResultBox(r3),
                      ],
                    ),
                  ),
                ),
                sized(
                  ExpandSectionCard(
                    title: loc.videoCalc4Title,
                    icon: Icons.brightness_6,
                    child: Column(
                      children: [
                        _calcActionsRow(onCalc: calc4, resultText: r4),
                        const SizedBox(height: 10),
                        ResultBox(r4),
                      ],
                    ),
                  ),
                ),
                sized(
                  ExpandSectionCard(
                    title: loc.videoCalc5Title,
                    icon: Icons.grid_on,
                    child: Column(
                      children: [
                        _numField(
                          controller: _calc5NCtrl,
                          label: loc.videoCalc5NLabel,
                          hint: loc.videoCalc5NHint,
                          action: TextInputAction.done,
                          onDone: calc5,
                        ),
                        const SizedBox(height: 12),
                        _calcActionsRow(onCalc: calc5, resultText: r5),
                        const SizedBox(height: 10),
                        ResultBox(r5),
                      ],
                    ),
                  ),
                ),
                sized(
                  ExpandSectionCard(
                    title: loc.videoCalc6Title,
                    icon: Icons.auto_fix_high,
                    child: Column(
                      children: [
                        _numField(
                          controller: _calc6RatioMinCtrl,
                          label: loc.videoCalc6RatioMinLabel,
                          hint: loc.videoCalc6RatioMinHint,
                          action: TextInputAction.next,
                        ),
                        const SizedBox(height: 12),
                        _numField(
                          controller: _calc6RatioMaxCtrl,
                          label: loc.videoCalc6RatioMaxLabel,
                          hint: loc.videoCalc6RatioMaxHint,
                          action: TextInputAction.next,
                        ),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            loc.videoOptionalBrightnessTitle,
                            style: const TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10),
                        _numField(
                          controller: _calc6LumensPerProjCtrl,
                          label: loc.videoCalc6LumensPerProjectorLabel,
                          hint: loc.videoCalc6LumensPerProjectorHint,
                          action: TextInputAction.next,
                        ),
                        const SizedBox(height: 12),
                        _numField(
                          controller: _calc6GainCtrl,
                          label: loc.videoCalc6GainLabel,
                          hint: loc.videoCalc6GainHint,
                          action: TextInputAction.done,
                          onDone: calc6,
                        ),
                        const SizedBox(height: 12),
                        _calcActionsRow(onCalc: calc6, resultText: r6),
                        const SizedBox(height: 10),
                        ResultBox(r6),
                      ],
                    ),
                  ),
                ),
              ];

              return SingleChildScrollView(
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: cards,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
