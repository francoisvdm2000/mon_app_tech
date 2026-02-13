import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../app/ui/widgets.dart'; // numFormatter, ExpandSectionCard, ResultBox, copyToClipboard
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

class VideoBrightnessPage extends StatefulWidget {
  const VideoBrightnessPage({super.key});

  @override
  State<VideoBrightnessPage> createState() => _VideoBrightnessPageState();
}

class _VideoBrightnessPageState extends State<VideoBrightnessPage> {
  String _format = '16:9';

  final _widthCtrl = TextEditingController();
  final _lumensCtrl = TextEditingController();
  final _gainCtrl = TextEditingController(text: '1.0');

  String _screenPresetKey = 'videoPresetFrontWhite'; // stockage “clé” pour i18n
  double _minFl = 16.0;

  String _r = '';

  @override
  void dispose() {
    _widthCtrl.dispose();
    _lumensCtrl.dispose();
    _gainCtrl.dispose();
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

  String _presetLabel(AppLocalizations loc, String key) {
    switch (key) {
      case 'videoPresetFrontWhite':
        return loc.videoPresetFrontWhiteShort;
      case 'videoPresetFrontGrey':
        return loc.videoPresetFrontGreyShort;
      case 'videoPresetFrontHighGain':
        return loc.videoPresetFrontHighGainShort;
      case 'videoPresetRearDiffusion':
        return loc.videoPresetRearDiffusionShort;
      case 'videoPresetRearClear':
        return loc.videoPresetRearClearShort;
      case 'videoPresetMappingMatte':
        return loc.videoPresetMappingMatteShort;
      case 'videoPresetMappingSatin':
        return loc.videoPresetMappingSatinShort;
      case 'videoPresetMappingLightStone':
        return loc.videoPresetMappingLightStoneShort;
      case 'videoPresetMappingDarkStone':
        return loc.videoPresetMappingDarkStoneShort;
      case 'videoPresetMappingGlass':
        return loc.videoPresetMappingGlassShort;
      default:
        return loc.videoPresetFrontWhiteShort;
    }
  }

  void _applyPresetByKey(String key) {
    double gain;
    double minFl;

    switch (key) {
      // Front
      case 'videoPresetFrontWhite':
        gain = 1.0;
        minFl = 16.0;
        break;
      case 'videoPresetFrontGrey':
        gain = 0.8;
        minFl = 16.0;
        break;
      case 'videoPresetFrontHighGain':
        gain = 1.3;
        minFl = 16.0;
        break;

      // Rear
      case 'videoPresetRearDiffusion':
        gain = 0.7;
        minFl = 10.0;
        break;
      case 'videoPresetRearClear':
        gain = 0.9;
        minFl = 10.0;
        break;

      // Mapping
      case 'videoPresetMappingMatte':
        gain = 0.75;
        minFl = 30.0;
        break;
      case 'videoPresetMappingSatin':
        gain = 0.9;
        minFl = 30.0;
        break;
      case 'videoPresetMappingLightStone':
        gain = 0.6;
        minFl = 35.0;
        break;
      case 'videoPresetMappingDarkStone':
        gain = 0.35;
        minFl = 45.0;
        break;
      case 'videoPresetMappingGlass':
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

  Widget _calcSection({
    required String title,
    required IconData icon,
    required List<Widget> inputs,
    required VoidCallback onCalc,
    required String result,
    required String copyTooltip,
    required String calcLabel,
  }) {
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
                  label: Text(calcLabel),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                tooltip: copyTooltip,
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

  void _calcBrightness(AppLocalizations loc) {
    final lumens = _d(_lumensCtrl);
    final gain = _d(_gainCtrl);
    final w = _d(_widthCtrl);

    if (lumens == null || gain == null || w == null) {
      setState(() => _r = loc.videoCalc4ErrMissingSimple);
      return;
    }
    if (lumens <= 0 || gain <= 0 || w <= 0) {
      setState(() => _r = loc.videoCalc4ErrGt0);
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
    final status = ok ? loc.commonOkWithCheck : loc.commonTooLowWithCross;

    final areaStr = area.toStringAsFixed(3);
    final luxStr = lux.toStringAsFixed(0);
    final luxEqStr = luxEq.toStringAsFixed(0);
    final nitsStr = nits.toStringAsFixed(1);
    final flStr = fl.toStringAsFixed(1);
    final presetStr = _presetLabel(loc, _screenPresetKey);
    final minFlStr = _minFl.toStringAsFixed(0);

    setState(() {
      // ✅ IMPORTANT : 9 arguments POSITIONNELS (pas de paramètres nommés)
      _r = loc.videoBrightnessResult(
        _format,
        areaStr,
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

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      appBar: AppBar(title: Text(loc.videoBrightnessTitle)),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
          child: Column(
            children: [
              _calcSection(
                title: loc.videoBrightnessSectionTitle,
                icon: Icons.brightness_6,
                onCalc: () => _calcBrightness(loc),
                result: _r,
                copyTooltip: loc.commonCopyResultTooltip,
                calcLabel: loc.commonCalculate,
                inputs: [
                  DropdownButtonFormField<String>(
                    initialValue: _format,
                    decoration:
                        InputDecoration(labelText: loc.videoFormatLabel),
                    items: const [
                      DropdownMenuItem(value: '16:9', child: Text('16:9')),
                      DropdownMenuItem(value: '16:10', child: Text('16:10')),
                      DropdownMenuItem(value: '4:3', child: Text('4:3')),
                      DropdownMenuItem(value: '21:9', child: Text('21:9')),
                    ],
                    onChanged: (v) => setState(() => _format = v ?? '16:9'),
                  ),
                  const SizedBox(height: 12),
                  _numField(
                    controller: _widthCtrl,
                    label: loc.videoImageWidthLabel,
                    hint: loc.videoImageWidthHint,
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
                    decoration:
                        InputDecoration(labelText: loc.videoScreenPresetLabel),
                    items: [
                      DropdownMenuItem(
                        value: 'videoPresetFrontWhite',
                        child: Text(loc.videoPresetFrontWhite),
                      ),
                      DropdownMenuItem(
                        value: 'videoPresetFrontGrey',
                        child: Text(loc.videoPresetFrontGrey),
                      ),
                      DropdownMenuItem(
                        value: 'videoPresetFrontHighGain',
                        child: Text(loc.videoPresetFrontHighGain),
                      ),
                      DropdownMenuItem(
                        value: 'videoPresetRearDiffusion',
                        child: Text(loc.videoPresetRearDiffusion),
                      ),
                      DropdownMenuItem(
                        value: 'videoPresetRearClear',
                        child: Text(loc.videoPresetRearClear),
                      ),
                      DropdownMenuItem(
                        value: 'videoPresetMappingMatte',
                        child: Text(loc.videoPresetMappingMatte),
                      ),
                      DropdownMenuItem(
                        value: 'videoPresetMappingSatin',
                        child: Text(loc.videoPresetMappingSatin),
                      ),
                      DropdownMenuItem(
                        value: 'videoPresetMappingLightStone',
                        child: Text(loc.videoPresetMappingLightStone),
                      ),
                      DropdownMenuItem(
                        value: 'videoPresetMappingDarkStone',
                        child: Text(loc.videoPresetMappingDarkStone),
                      ),
                      DropdownMenuItem(
                        value: 'videoPresetMappingGlass',
                        child: Text(loc.videoPresetMappingGlass),
                      ),
                    ],
                    onChanged: (v) {
                      if (v == null) return;
                      _applyPresetByKey(v);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
