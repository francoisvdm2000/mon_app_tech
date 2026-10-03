import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../l10n_gen/app_localizations.dart';
import 'widgets/electricity_form_widgets.dart';
import 'widgets/electricity_result_card.dart';
import '../about/about_favorites.dart';
import 'package:mon_app_tech/app/constants.dart';

enum _PfMode {
  kvaToKw,
  kwToKva,
}

class _PfResult {
  final double activeKw;
  final double apparentKva;
  final double reactiveKvar;
  final double cosPhi;
  final double phiDeg;
  const _PfResult({
    required this.activeKw,
    required this.apparentKva,
    required this.reactiveKvar,
    required this.cosPhi,
    required this.phiDeg,
  });
}

class ElectricityPowerFactorPage extends StatefulWidget {
  const ElectricityPowerFactorPage({super.key});

  @override
  State<ElectricityPowerFactorPage> createState() =>
      _ElectricityPowerFactorPageState();
}

class _ElectricityPowerFactorPageState
    extends State<ElectricityPowerFactorPage> {
  _PfMode _mode = _PfMode.kvaToKw;
  final _apparentCtrl = TextEditingController(text: '10');
  final _activeCtrl = TextEditingController(text: '8');
  final _cosPhiCtrl = TextEditingController(text: '0.8');

  @override
  void dispose() {
    _apparentCtrl.dispose();
    _activeCtrl.dispose();
    _cosPhiCtrl.dispose();
    super.dispose();
  }

  double? _parse(String value) =>
      double.tryParse(value.replaceAll(',', '.').trim());

  void _setMode(_PfMode value) => setState(() => _mode = value);

  _PfResult? _calculate() {
    final cosPhi = _parse(_cosPhiCtrl.text);
    if (cosPhi == null || cosPhi <= 0 || cosPhi > 1) return null;

    double activeKw;
    double apparentKva;
    if (_mode == _PfMode.kvaToKw) {
      final kva = _parse(_apparentCtrl.text);
      if (kva == null || kva <= 0) return null;
      apparentKva = kva;
      activeKw = kva * cosPhi;
    } else {
      final kw = _parse(_activeCtrl.text);
      if (kw == null || kw <= 0) return null;
      activeKw = kw;
      apparentKva = kw / cosPhi;
    }

    final reactiveSquared = (apparentKva * apparentKva) - (activeKw * activeKw);
    final reactiveKvar = reactiveSquared > 0 ? math.sqrt(reactiveSquared) : 0.0;
    final phiDeg = math.acos(cosPhi.clamp(-1.0, 1.0)) * 180 / math.pi;

    return _PfResult(
      activeKw: activeKw,
      apparentKva: apparentKva,
      reactiveKvar: reactiveKvar,
      cosPhi: cosPhi,
      phiDeg: phiDeg,
    );
  }

  String _fmt(double value, {int decimals = 2}) => value.toStringAsFixed(decimals);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final result = _calculate();

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.electricityPowerFactorToolTitle),
        actions: const [
          AboutPinButton(pageId: 'tool:electricity_power_factor', sectionId: 'main'),
          SizedBox(width: 4),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          children: [
            SectionCard(
              accentColor: kSectionElectricity,
              icon: Icons.compare_arrows_rounded,
              title: loc.electricityPowerFactorModeTitle,
              child: Row(
                children: [
                  Expanded(
                    child: _SelectorButton(
                      label: loc.electricityPowerFactorModeKvaToKw,
                      selected: _mode == _PfMode.kvaToKw,
                      onTap: () => _setMode(_PfMode.kvaToKw),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _SelectorButton(
                      label: loc.electricityPowerFactorModeKwToKva,
                      selected: _mode == _PfMode.kwToKva,
                      onTap: () => _setMode(_PfMode.kwToKva),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            SectionCard(
              accentColor: kSectionElectricity,
              icon: Icons.tune,
              title: loc.electricityPowerFactorInputsTitle,
              child: Column(
                children: [
                  if (_mode == _PfMode.kvaToKw)
                    ElectricityNumField(
                      controller: _apparentCtrl,
                      label: loc.electricityPowerFactorApparentLabel,
                      hint: loc.electricityPowerFactorApparentHint,
                      suffix: 'kVA',
                      onChanged: (_) => setState(() {}),
                    )
                  else
                    ElectricityNumField(
                      controller: _activeCtrl,
                      label: loc.electricityPowerFactorActiveLabel,
                      hint: loc.electricityPowerFactorActiveHint,
                      suffix: 'kW',
                      onChanged: (_) => setState(() {}),
                    ),
                  const SizedBox(height: 12),
                  ElectricityNumField(
                    controller: _cosPhiCtrl,
                    label: loc.electricityPowerFactorCosPhiLabel,
                    hint: loc.electricityPowerFactorCosPhiHint,
                    suffix: '',
                    onChanged: (_) => setState(() {}),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            ElectricityResultCard(
              icon: Icons.bolt,
              title: loc.electricityPowerFactorResultsTitle,
              color: Colors.lightBlueAccent,
              mainValue: result == null
                  ? '—'
                  : (_mode == _PfMode.kvaToKw
                      ? '${_fmt(result.activeKw)} kW'
                      : '${_fmt(result.apparentKva)} kVA'),
              mainLabel: _mode == _PfMode.kvaToKw
                  ? loc.electricityPowerFactorActiveLabel
                  : loc.electricityPowerFactorApparentLabel,
              children: [
                if (result == null)
                  Text(
                    loc.electricityPowerFactorEnterValues,
                    style: const TextStyle(color: Colors.white54),
                  )
                else ...[
                  ElectricityInfoRow(
                    label: loc.electricityPowerFactorReactiveLabel,
                    value: '${_fmt(result.reactiveKvar)} kVAR',
                    valueColor: Colors.orangeAccent,
                  ),
                  ElectricityInfoRow(
                    label: loc.electricityPowerFactorAngleLabel,
                    value: 'φ ≈ ${_fmt(result.phiDeg, decimals: 1)}°',
                    valueColor: Colors.greenAccent,
                  ),
                ],
              ],
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.03),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline_rounded,
                      color: Colors.white.withValues(alpha: 0.35), size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      loc.electricityPowerFactorFormulaNote,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.40),
                        fontSize: 11.5,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectorButton extends StatelessWidget {
  const _SelectorButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? Colors.amber : Colors.white54;

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 48),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected
              ? Colors.amber.withValues(alpha: 0.16)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected ? Colors.amber : Colors.white24,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
