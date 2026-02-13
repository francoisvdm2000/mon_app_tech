import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../../app/ui/widgets.dart'; // numFormatter, intFormatter, ExpandSectionCard, ResultBox, copyToClipboard

class VideoMultiprojecteurPage extends StatefulWidget {
  const VideoMultiprojecteurPage({super.key});

  @override
  State<VideoMultiprojecteurPage> createState() =>
      _VideoMultiprojecteurPageState();
}

class _VideoMultiprojecteurPageState extends State<VideoMultiprojecteurPage> {
  // CALC 5
  String _format5 = '16:9';
  final _c5WtotCtrl = TextEditingController();
  final _c5OverlapCtrl = TextEditingController(text: '10');
  final _c5NCtrl = TextEditingController(text: '2');
  String _r5 = '';

  // CALC 6
  String _format6 = '16:9';
  final _c6WtotCtrl = TextEditingController();
  final _c6DistanceCtrl = TextEditingController();
  final _c6OverlapCtrl = TextEditingController(text: '10');
  final _c6RatioMinCtrl = TextEditingController();
  final _c6RatioMaxCtrl = TextEditingController();
  final _c6LumensPerCtrl = TextEditingController(); // optionnel
  final _c6GainCtrl = TextEditingController(text: '1.0'); // optionnel
  String _r6 = '';

  @override
  void dispose() {
    _c5WtotCtrl.dispose();
    _c5OverlapCtrl.dispose();
    _c5NCtrl.dispose();

    _c6WtotCtrl.dispose();
    _c6DistanceCtrl.dispose();
    _c6OverlapCtrl.dispose();
    _c6RatioMinCtrl.dispose();
    _c6RatioMaxCtrl.dispose();
    _c6LumensPerCtrl.dispose();
    _c6GainCtrl.dispose();
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

  Widget _intField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputAction? action,
    VoidCallback? onDone,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [intFormatter],
      textInputAction: action,
      onSubmitted: (_) => onDone?.call(),
      decoration: _dec(label, hint),
    );
  }

  Widget _formatDropdown({
    required String value,
    required ValueChanged<String> onChanged,
  }) {
    final loc = AppLocalizations.of(context);

    return DropdownButtonFormField<String>(
      initialValue: value,
      decoration: InputDecoration(labelText: loc.videoMpFormatLabel),
      items: const [
        DropdownMenuItem(value: '16:9', child: Text('16:9')),
        DropdownMenuItem(value: '16:10', child: Text('16:10')),
        DropdownMenuItem(value: '4:3', child: Text('4:3')),
        DropdownMenuItem(value: '21:9', child: Text('21:9')),
      ],
      onChanged: (v) => onChanged(v ?? '16:9'),
    );
  }

  Widget _calcSection({
    required String title,
    required IconData icon,
    required List<Widget> inputs,
    required VoidCallback onCalc,
    required String result,
    bool initiallyExpanded = false,
  }) {
    final loc = AppLocalizations.of(context);

    return ExpandSectionCard(
      title: title,
      icon: icon,
      initiallyExpanded: initiallyExpanded,
      child: Column(
        children: [
          ...inputs,
          const SizedBox(height: 12),
          Row(
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
                onPressed: () => copyToClipboard(context, result),
                icon: const Icon(Icons.copy),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ResultBox(result),
        ],
      ),
    );
  }

  void _calc5() {
    final loc = AppLocalizations.of(context);

    final wTot = _d(_c5WtotCtrl);
    final pPercent = _d(_c5OverlapCtrl);
    final n = _i(_c5NCtrl);

    if (wTot == null || pPercent == null || n == null) {
      setState(() => _r5 = loc.videoMpErrMissing5);
      return;
    }
    if (wTot <= 0) {
      setState(() => _r5 = loc.videoMpErrWidthGt0);
      return;
    }
    if (n < 2) {
      setState(() => _r5 = loc.videoMpErrNGte2);
      return;
    }
    if (pPercent < 0 || pPercent >= 100) {
      setState(() => _r5 = loc.videoMpErrOverlapRange);
      return;
    }

    final p = pPercent / 100.0;
    final denom = (n - (n - 1) * p);
    if (denom <= 0) {
      setState(() => _r5 = loc.videoMpErrImpossibleDenom);
      return;
    }

    final wParProj = wTot / denom;
    final overlapM = p * wParProj;

    final ratioWH = _ratioWHFromFormat(_format5);
    final hTot = wTot / ratioWH;

    setState(() {
      _r5 = 'Format: $_format5\n'
          'Largeur totale: ${wTot.toStringAsFixed(3)} ${loc.commonUnitMeter}\n'
          'N: $n | Overlap: ${pPercent.toStringAsFixed(1)}%\n\n'
          '- Largeur / projecteur: ${wParProj.toStringAsFixed(3)} ${loc.commonUnitMeter}\n'
          '- Overlap entre projos: ${overlapM.toStringAsFixed(3)} ${loc.commonUnitMeter}\n'
          '- Hauteur totale: ${hTot.toStringAsFixed(3)} ${loc.commonUnitMeter}';
    });
  }

  void _calc6() {
    final loc = AppLocalizations.of(context);

    final wTot = _d(_c6WtotCtrl);
    final distance = _d(_c6DistanceCtrl);
    final pPercent = _d(_c6OverlapCtrl);
    final ratioMin = _d(_c6RatioMinCtrl);
    final ratioMax = _d(_c6RatioMaxCtrl);

    final lumensPerProj = _d(_c6LumensPerCtrl); // optional
    final gain = _d(_c6GainCtrl); // optional

    if (wTot == null || distance == null || pPercent == null) {
      setState(() => _r6 = loc.videoMpErrMissing6Main);
      return;
    }
    if (wTot <= 0 || distance <= 0) {
      setState(() => _r6 = loc.videoMpErrWidthDistanceGt0);
      return;
    }
    if (pPercent < 0 || pPercent >= 100) {
      setState(() => _r6 = loc.videoMpErrOverlapRange);
      return;
    }

    double? a = ratioMin;
    double? b = ratioMax;

    if (a == null && b == null) {
      setState(() => _r6 = loc.videoMpErrMissingRatios);
      return;
    }
    a ??= b;
    b ??= a;

    if (a == null || b == null || a <= 0 || b <= 0) {
      setState(() => _r6 = loc.videoMpErrInvalidRatio);
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

    final ratioWH = _ratioWHFromFormat(_format6);
    final hTot = wTot / ratioWH;
    final area = wTot * hTot;

    String lumiForN(int n) {
      if (lumensPerProj == null || gain == null) {
        return loc.videoMpLumiOptionalHint;
      }
      if (lumensPerProj <= 0 || gain <= 0) {
        return loc.videoMpLumiErrLumensGainGt0;
      }

      final totalLumensUseful = n * lumensPerProj * gain;
      final lux = totalLumensUseful / area;
      final nits = totalLumensUseful / (math.pi * area);
      final fl = nits / 3.426;

      // ✅ 5 arguments POSITIONNELS (corrige tes erreurs “5 positional arguments expected…”)
      return loc.videoMpLumiEstimated(
        n.toString(),
        area.toStringAsFixed(2),
        lux.toStringAsFixed(0),
        nits.toStringAsFixed(1),
        fl.toStringAsFixed(1),
      );
    }

    setState(() {
      _r6 = 'Format: $_format6\n'
          'Largeur totale=${wTot.toStringAsFixed(3)} ${loc.commonUnitMeter} | '
          'Distance=${distance.toStringAsFixed(3)} ${loc.commonUnitMeter} | '
          'Overlap=${pPercent.toStringAsFixed(1)}%\n'
          'Hauteur totale=${hTot.toStringAsFixed(3)} ${loc.commonUnitMeter} | '
          'Surface=${area.toStringAsFixed(2)} m²\n'
          'Ratio min→max: ${ratioMinOk.toStringAsFixed(3)} → ${ratioMaxOk.toStringAsFixed(3)}\n\n'
          '${loc.videoMpCaseOpenMin(nAtMin.toString(), covAtMin.toStringAsFixed(3))}\n'
          '${lumiForN(nAtMin)}\n\n'
          '${loc.videoMpCaseTightMax(nAtMax.toString(), covAtMax.toStringAsFixed(3))}\n'
          '${lumiForN(nAtMax)}\n\n'
          '${loc.videoMpNoteIndicative}';
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      appBar: AppBar(title: Text(loc.videoMultiprojectorTitle)),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
          child: Column(
            children: [
              _calcSection(
                title: loc.videoMpCalc5Title,
                icon: Icons.grid_on,
                initiallyExpanded: true,
                inputs: [
                  _formatDropdown(
                      value: _format5,
                      onChanged: (v) => setState(() => _format5 = v)),
                  const SizedBox(height: 12),
                  _numField(
                    controller: _c5WtotCtrl,
                    label: loc.videoMpTotalWidthLabel,
                    hint: loc.videoMpTotalWidthHint,
                    action: TextInputAction.next,
                  ),
                  const SizedBox(height: 12),
                  _numField(
                    controller: _c5OverlapCtrl,
                    label: loc.videoMpOverlapLabel,
                    hint: loc.videoMpOverlapHint,
                    action: TextInputAction.next,
                  ),
                  const SizedBox(height: 12),
                  _intField(
                    controller: _c5NCtrl,
                    label: loc.videoMpProjectorCountLabel,
                    hint: loc.videoMpProjectorCountHint,
                    action: TextInputAction.done,
                    onDone: _calc5,
                  ),
                ],
                onCalc: _calc5,
                result: _r5,
              ),
              const SizedBox(height: 12),
              _calcSection(
                title: loc.videoMpCalc6Title,
                icon: Icons.auto_fix_high,
                inputs: [
                  _formatDropdown(
                      value: _format6,
                      onChanged: (v) => setState(() => _format6 = v)),
                  const SizedBox(height: 12),
                  _numField(
                    controller: _c6WtotCtrl,
                    label: loc.videoMpTotalWidthLabel,
                    hint: loc.videoMpTotalWidthHint,
                    action: TextInputAction.next,
                  ),
                  const SizedBox(height: 12),
                  _numField(
                    controller: _c6DistanceCtrl,
                    label: loc.videoMpDistanceLabel,
                    hint: loc.videoMpDistanceHint,
                    action: TextInputAction.next,
                  ),
                  const SizedBox(height: 12),
                  _numField(
                    controller: _c6OverlapCtrl,
                    label: loc.videoMpOverlapLabel,
                    hint: loc.videoMpOverlapHint,
                    action: TextInputAction.next,
                  ),
                  const SizedBox(height: 12),
                  _numField(
                    controller: _c6RatioMinCtrl,
                    label: loc.videoMpRatioMinLabel,
                    hint: loc.videoMpRatioMinHint,
                    action: TextInputAction.next,
                  ),
                  const SizedBox(height: 12),
                  _numField(
                    controller: _c6RatioMaxCtrl,
                    label: loc.videoMpRatioMaxLabel,
                    hint: loc.videoMpRatioMaxHint,
                    action: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      loc.videoMpOptionalLuminanceTitle,
                      style: const TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _numField(
                    controller: _c6LumensPerCtrl,
                    label: loc.videoMpLumensPerProjectorLabel,
                    hint: loc.videoMpLumensPerProjectorHint,
                    action: TextInputAction.next,
                  ),
                  const SizedBox(height: 12),
                  _numField(
                    controller: _c6GainCtrl,
                    label: loc.videoMpGainLabel,
                    hint: loc.videoMpGainHint,
                    action: TextInputAction.done,
                    onDone: _calc6,
                  ),
                ],
                onCalc: _calc6,
                result: _r6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
