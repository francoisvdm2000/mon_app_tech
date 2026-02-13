import 'package:flutter/material.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../../app/ui/widgets.dart'; // numFormatter, intFormatter, ExpandSectionCard, ResultBox, copyToClipboard

class VideoLedPage extends StatefulWidget {
  const VideoLedPage({super.key});

  @override
  State<VideoLedPage> createState() => _VideoLedPageState();
}

class _VideoLedPageState extends State<VideoLedPage> {
  final _tilesXCtrl = TextEditingController();
  final _tilesYCtrl = TextEditingController();

  final _tileWpxCtrl = TextEditingController();
  final _tileHpxCtrl = TextEditingController();

  final _tileWcmCtrl = TextEditingController();
  final _tileHcmCtrl = TextEditingController();

  String _r = '';

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

  Widget _intField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputAction? action,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [intFormatter],
      textInputAction: action,
      decoration: InputDecoration(labelText: label, hintText: hint),
    );
  }

  Widget _numField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputAction? action,
  }) {
    return TextField(
      controller: controller,
      keyboardType:
          const TextInputType.numberWithOptions(decimal: true, signed: false),
      inputFormatters: [numFormatter],
      textInputAction: action,
      decoration: InputDecoration(labelText: label, hintText: hint),
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
      initiallyExpanded: true,
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

  void _calcLed() {
    final loc = AppLocalizations.of(context);

    final tilesX = _i(_tilesXCtrl);
    final tilesY = _i(_tilesYCtrl);

    final tileWpx = _i(_tileWpxCtrl);
    final tileHpx = _i(_tileHpxCtrl);

    final tileWcm = _d(_tileWcmCtrl);
    final tileHcm = _d(_tileHcmCtrl);

    if (tilesX == null ||
        tilesY == null ||
        tileWpx == null ||
        tileHpx == null ||
        tileWcm == null ||
        tileHcm == null) {
      setState(() => _r = loc.videoLedErrMissingInputs);
      return;
    }
    if (tilesX <= 0 ||
        tilesY <= 0 ||
        tileWpx <= 0 ||
        tileHpx <= 0 ||
        tileWcm <= 0 ||
        tileHcm <= 0) {
      setState(() => _r = loc.videoLedErrAllGt0);
      return;
    }

    final wallWpx = tilesX * tileWpx;
    final wallHpx = tilesY * tileHpx;

    final wallWm = (tilesX * tileWcm) / 100.0;
    final wallHm = (tilesY * tileHcm) / 100.0;

    final pitchXmm = (tileWcm * 10.0) / tileWpx;
    final pitchYmm = (tileHcm * 10.0) / tileHpx;

    String pitchLabel;
    if ((pitchXmm - pitchYmm).abs() <= 0.05) {
      // ✅ 1 argument POSITIONNEL
      pitchLabel = loc.videoLedPitchUniform(
        ((pitchXmm + pitchYmm) / 2.0).toStringAsFixed(2),
      );
    } else {
      // ✅ 2 arguments POSITIONNELS
      pitchLabel = loc.videoLedPitchXY(
        pitchXmm.toStringAsFixed(2),
        pitchYmm.toStringAsFixed(2),
      );
    }

    setState(() {
      // ✅ 9 arguments POSITIONNELS (d’après tes erreurs “9 positional arguments expected…”)
      _r = loc.videoLedResult(
        wallWpx.toString(),
        wallHpx.toString(),
        wallWm.toStringAsFixed(2),
        wallHm.toStringAsFixed(2),
        tileWpx.toString(),
        tileHpx.toString(),
        tileWcm.toStringAsFixed(2),
        tileHcm.toStringAsFixed(2),
        pitchLabel,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      appBar: AppBar(title: Text(loc.videoLedTitle)),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
          child: Column(
            children: [
              _calcSection(
                title: loc.videoLedCalcTitle,
                icon: Icons.grid_4x4,
                inputs: [
                  Row(
                    children: [
                      Expanded(
                        child: _intField(
                          controller: _tilesXCtrl,
                          label: loc.videoLedTilesXLabel,
                          hint: loc.videoLedTilesXHint,
                          action: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _intField(
                          controller: _tilesYCtrl,
                          label: loc.videoLedTilesYLabel,
                          hint: loc.videoLedTilesYHint,
                          action: TextInputAction.next,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _intField(
                          controller: _tileWpxCtrl,
                          label: loc.videoLedTileWpxLabel,
                          hint: loc.videoLedTileWpxHint,
                          action: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _intField(
                          controller: _tileHpxCtrl,
                          label: loc.videoLedTileHpxLabel,
                          hint: loc.videoLedTileHpxHint,
                          action: TextInputAction.next,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _numField(
                          controller: _tileWcmCtrl,
                          label: loc.videoLedTileWcmLabel,
                          hint: loc.videoLedTileWcmHint,
                          action: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _numField(
                          controller: _tileHcmCtrl,
                          label: loc.videoLedTileHcmLabel,
                          hint: loc.videoLedTileHcmHint,
                          action: TextInputAction.done,
                        ),
                      ),
                    ],
                  ),
                ],
                onCalc: _calcLed,
                result: _r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
