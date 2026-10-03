import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../l10n_gen/app_localizations.dart';
import 'widgets/electricity_form_widgets.dart';
import 'widgets/electricity_result_card.dart';
import '../about/about_favorites.dart';
import 'package:mon_app_tech/app/constants.dart';

enum _GeneratorCircuitType {
  singlePhase,
  threePhase,
}

/// Tailles standard de groupes électrogènes commercialisées (kVA) — sert à
/// arrondir la puissance calculée à la taille louable/achetable la plus
/// proche au-dessus du besoin réel.
const List<double> _kStandardGeneratorSizesKva = [
  10, 15, 20, 30, 45, 60, 75, 100, 125, 150, 175, 200, 250, 300, 400, 500,
  630, 800,
];

class ElectricityGeneratorPage extends StatefulWidget {
  const ElectricityGeneratorPage({super.key});

  @override
  State<ElectricityGeneratorPage> createState() =>
      _ElectricityGeneratorPageState();
}

class _ElectricityGeneratorPageState extends State<ElectricityGeneratorPage> {
  final _activePowerCtrl = TextEditingController(text: '30');
  final _cosPhiCtrl = TextEditingController(text: '0.9');
  final _diversityCtrl = TextEditingController(text: '80');
  final _marginCtrl = TextEditingController(text: '20');
  final _fuelRateCtrl = TextEditingController(text: '0.25');
  final _voltageCtrl = TextEditingController(text: '400');

  _GeneratorCircuitType _circuitType = _GeneratorCircuitType.threePhase;

  @override
  void dispose() {
    _activePowerCtrl.dispose();
    _cosPhiCtrl.dispose();
    _diversityCtrl.dispose();
    _marginCtrl.dispose();
    _fuelRateCtrl.dispose();
    _voltageCtrl.dispose();
    super.dispose();
  }

  double? _parse(String value) {
    return double.tryParse(value.replaceAll(',', '.').trim());
  }

  void _setCircuitType(_GeneratorCircuitType value) {
    setState(() {
      _circuitType = value;
      _voltageCtrl.text =
          value == _GeneratorCircuitType.threePhase ? '400' : '230';
    });
  }

  _GeneratorResult? _calculate() {
    final activePowerKw = _parse(_activePowerCtrl.text);
    if (activePowerKw == null || activePowerKw <= 0) return null;

    final cosPhi = (_parse(_cosPhiCtrl.text) ?? 0.9).clamp(0.5, 1.0);
    final diversity =
        ((_parse(_diversityCtrl.text) ?? 80) / 100).clamp(0.3, 1.0);
    final margin = ((_parse(_marginCtrl.text) ?? 20) / 100).clamp(0.0, 1.0);
    final fuelRate = (_parse(_fuelRateCtrl.text) ?? 0.25).clamp(0.05, 1.0);
    final voltage = (_parse(_voltageCtrl.text) ??
            (_circuitType == _GeneratorCircuitType.threePhase ? 400 : 230))
        .clamp(1.0, 1000.0);

    final apparentNeededKva = (activePowerKw / cosPhi) * diversity;
    final sizedKva = apparentNeededKva * (1 + margin);

    double? recommendedKva;
    for (final size in _kStandardGeneratorSizesKva) {
      if (size >= sizedKva) {
        recommendedKva = size;
        break;
      }
    }

    final isThreePhase = _circuitType == _GeneratorCircuitType.threePhase;
    final currentA = isThreePhase
        ? (sizedKva * 1000) / (math.sqrt(3) * voltage)
        : (sizedKva * 1000) / voltage;

    final fuelLPerHour = activePowerKw * fuelRate;

    return _GeneratorResult(
      apparentNeededKva: apparentNeededKva,
      sizedKva: sizedKva,
      recommendedKva: recommendedKva,
      currentA: currentA,
      fuelLPerHour: fuelLPerHour,
    );
  }

  String _fmt(double value, {int decimals = 1}) => value.toStringAsFixed(decimals);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final result = _calculate();

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.electricityToolGeneratorTitle),
        actions: const [
          AboutPinButton(pageId: 'tool:electricity_generator', sectionId: 'main'),
          SizedBox(width: 4),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          children: [
            SectionCard(
              accentColor: kSectionElectricity,
              icon: Icons.power,
              title: loc.electricityCircuitTypeTitle,
              child: Row(
                children: [
                  Expanded(
                    child: _SelectorButton(
                      label: loc.electricitySinglePhase,
                      selected: _circuitType == _GeneratorCircuitType.singlePhase,
                      onTap: () =>
                          _setCircuitType(_GeneratorCircuitType.singlePhase),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _SelectorButton(
                      label: loc.electricityThreePhase,
                      selected: _circuitType == _GeneratorCircuitType.threePhase,
                      onTap: () =>
                          _setCircuitType(_GeneratorCircuitType.threePhase),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            SectionCard(
              accentColor: kSectionElectricity,
              icon: Icons.tune,
              title: loc.electricityGeneratorInputsTitle,
              child: Column(
                children: [
                  ElectricityNumField(
                    controller: _activePowerCtrl,
                    label: loc.electricityGeneratorActivePowerLabel,
                    hint: loc.electricityGeneratorActivePowerHint,
                    suffix: 'kW',
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 12),
                  ElectricityNumField(
                    controller: _voltageCtrl,
                    label: loc.electricityVoltageLabel,
                    hint: loc.electricityVoltageHint,
                    suffix: 'V',
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 12),
                  ElectricityNumField(
                    controller: _cosPhiCtrl,
                    label: loc.electricityGeneratorCosPhiLabel,
                    hint: loc.electricityGeneratorCosPhiHint,
                    suffix: '',
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 12),
                  ElectricityNumField(
                    controller: _diversityCtrl,
                    label: loc.electricityGeneratorDiversityLabel,
                    hint: loc.electricityGeneratorDiversityHint,
                    suffix: '%',
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 12),
                  ElectricityNumField(
                    controller: _marginCtrl,
                    label: loc.electricityGeneratorMarginLabel,
                    hint: loc.electricityGeneratorMarginHint,
                    suffix: '%',
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 12),
                  ElectricityNumField(
                    controller: _fuelRateCtrl,
                    label: loc.electricityGeneratorFuelRateLabel,
                    hint: loc.electricityGeneratorFuelRateHint,
                    suffix: 'L/kWh',
                    onChanged: (_) => setState(() {}),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            ElectricityResultCard(
              icon: Icons.electric_bolt,
              title: loc.electricityGeneratorResultsTitle,
              color: Colors.orangeAccent,
              mainValue: result == null
                  ? '—'
                  : (result.recommendedKva != null
                      ? '${result.recommendedKva!.toStringAsFixed(0)} kVA'
                      : '> 800 kVA'),
              mainLabel: loc.electricityGeneratorRecommendedLabel,
              children: [
                if (result == null)
                  Text(
                    loc.electricityGeneratorEnterValues,
                    style: const TextStyle(color: Colors.white54),
                  )
                else ...[
                  if (result.recommendedKva == null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        loc.electricityGeneratorRecommendedOverMax,
                        style: const TextStyle(
                            color: Colors.orangeAccent, fontSize: 12.5),
                      ),
                    ),
                  ElectricityInfoRow(
                    label: loc.electricityGeneratorApparentNeededLabel,
                    value: '${_fmt(result.sizedKva)} kVA',
                    valueColor: Colors.greenAccent,
                  ),
                  ElectricityInfoRow(
                    label: loc.electricityGeneratorCurrentLabel,
                    value: '${_fmt(result.currentA)} A',
                    valueColor: Colors.lightBlueAccent,
                  ),
                  ElectricityInfoRow(
                    label: loc.electricityGeneratorFuelPerHourLabel,
                    value: '${_fmt(result.fuelLPerHour)} L/h',
                  ),
                  ElectricityInfoRow(
                    label: loc.electricityGeneratorFuelPerShowLabel,
                    value: '${_fmt(result.fuelLPerHour * 8)} L',
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
                  Icon(Icons.shield_outlined,
                      color: Colors.white.withValues(alpha: 0.35), size: 15),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      loc.electricityGeneratorDisclaimer,
                      style: TextStyle(
                          fontSize: 11.5,
                          color: Colors.white.withValues(alpha: 0.45),
                          height: 1.4),
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

class _GeneratorResult {
  const _GeneratorResult({
    required this.apparentNeededKva,
    required this.sizedKva,
    required this.recommendedKva,
    required this.currentA,
    required this.fuelLPerHour,
  });

  final double apparentNeededKva;
  final double sizedKva;
  final double? recommendedKva;
  final double currentA;
  final double fuelLPerHour;
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
