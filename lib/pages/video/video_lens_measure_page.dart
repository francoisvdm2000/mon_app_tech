import 'package:flutter/material.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../../app/ui/widgets.dart'; // numFormatter, ExpandSectionCard, ResultBox, copyToClipboard

class VideoLensMeasurePage extends StatefulWidget {
  const VideoLensMeasurePage({super.key});

  @override
  State<VideoLensMeasurePage> createState() => _VideoLensMeasurePageState();
}

class _VideoLensMeasurePageState extends State<VideoLensMeasurePage> {
  // ---- CALC 1 (Ratio = Distance / Largeur)
  String _format1 = '16:9';
  final _c1DistanceCtrl = TextEditingController();
  final _c1WidthCtrl = TextEditingController();
  String _r1 = '';

  // ---- CALC 2 (Largeur = Distance / Ratio)
  final _c2DistanceCtrl = TextEditingController();
  final _c2RatioCtrl = TextEditingController();
  String _r2 = '';

  // ---- CALC 3 (Hauteur = Largeur / ratioWH)
  String _format3 = '16:9';
  final _c3WidthCtrl = TextEditingController();
  String _r3 = '';

  @override
  void dispose() {
    _c1DistanceCtrl.dispose();
    _c1WidthCtrl.dispose();
    _c2DistanceCtrl.dispose();
    _c2RatioCtrl.dispose();
    _c3WidthCtrl.dispose();
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

  Widget _formatDropdown({
    required String value,
    required ValueChanged<String> onChanged,
  }) {
    final loc = AppLocalizations.of(context);

    return DropdownButtonFormField<String>(
      initialValue: value,
      decoration: InputDecoration(labelText: loc.videoLmFormatLabel),
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
  }) {
    final loc = AppLocalizations.of(context);

    return ExpandSectionCard(
      title: title,
      icon: icon,
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

  // ---------- CALCS
  void _calc1() {
    final loc = AppLocalizations.of(context);

    final d = _d(_c1DistanceCtrl);
    final w = _d(_c1WidthCtrl);

    if (d == null || w == null) {
      setState(() => _r1 = loc.videoLmErrMissingDistanceWidth);
      return;
    }
    if (w <= 0) {
      setState(() => _r1 = loc.videoLmErrWidthGt0);
      return;
    }

    final ratio = d / w;
    setState(() {
      // ✅ FIX: appel positionnel (pas named)
      _r1 = loc.videoLmResultRatio(ratio.toStringAsFixed(3));
    });
  }

  void _calc2() {
    final loc = AppLocalizations.of(context);

    final d = _d(_c2DistanceCtrl);
    final ratio = _d(_c2RatioCtrl);

    if (d == null || ratio == null) {
      setState(() => _r2 = loc.videoLmErrMissingDistanceRatio);
      return;
    }
    if (ratio <= 0) {
      setState(() => _r2 = loc.videoLmErrRatioGt0);
      return;
    }

    final w = d / ratio;
    // ✅ FIX: appel positionnel (pas named)
    setState(() => _r2 = loc.videoLmResultWidth(w.toStringAsFixed(3)));
  }

  void _calc3() {
    final loc = AppLocalizations.of(context);

    final w = _d(_c3WidthCtrl);

    if (w == null) {
      setState(() => _r3 = loc.videoLmErrMissingWidthOnly);
      return;
    }
    if (w <= 0) {
      setState(() => _r3 = loc.videoLmErrWidthGt0);
      return;
    }

    final ratioWH = _ratioWHFromFormat(_format3);
    final h = w / ratioWH;

    // ✅ FIX: appel positionnel (pas named)
    setState(() => _r3 = loc.videoLmResultHeight(
          h.toStringAsFixed(3),
          _format3,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      appBar: AppBar(title: Text(loc.videoLensMeasureTitle)),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
          child: Column(
            children: [
              _calcSection(
                title: loc.videoLmCalc1Title,
                icon: Icons.straighten,
                inputs: [
                  _formatDropdown(
                    value: _format1,
                    onChanged: (v) => setState(() => _format1 = v),
                  ),
                  const SizedBox(height: 12),
                  _numField(
                    controller: _c1DistanceCtrl,
                    label: loc.videoLmDistanceLabel,
                    hint: loc.videoLmDistanceHint,
                    action: TextInputAction.next,
                  ),
                  const SizedBox(height: 12),
                  _numField(
                    controller: _c1WidthCtrl,
                    label: loc.videoLmImageWidthLabel,
                    hint: loc.videoLmImageWidthHint,
                    action: TextInputAction.done,
                    onDone: _calc1,
                  ),
                ],
                onCalc: _calc1,
                result: _r1,
              ),
              const SizedBox(height: 12),
              _calcSection(
                title: loc.videoLmCalc2Title,
                icon: Icons.swap_horiz,
                inputs: [
                  _numField(
                    controller: _c2DistanceCtrl,
                    label: loc.videoLmDistanceLabel,
                    hint: loc.videoLmDistanceHint,
                    action: TextInputAction.next,
                  ),
                  const SizedBox(height: 12),
                  _numField(
                    controller: _c2RatioCtrl,
                    label: loc.videoLmThrowRatioLabel,
                    hint: loc.videoLmThrowRatioHint,
                    action: TextInputAction.done,
                    onDone: _calc2,
                  ),
                ],
                onCalc: _calc2,
                result: _r2,
              ),
              const SizedBox(height: 12),
              _calcSection(
                title: loc.videoLmCalc3Title,
                icon: Icons.height,
                inputs: [
                  _formatDropdown(
                    value: _format3,
                    onChanged: (v) => setState(() => _format3 = v),
                  ),
                  const SizedBox(height: 12),
                  _numField(
                    controller: _c3WidthCtrl,
                    label: loc.videoLmImageWidthLabel,
                    hint: loc.videoLmImageWidthHint,
                    action: TextInputAction.done,
                    onDone: _calc3,
                  ),
                ],
                onCalc: _calc3,
                result: _r3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
