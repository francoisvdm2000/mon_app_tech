import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../l10n_gen/app_localizations.dart';
import 'widgets/electricity_form_widgets.dart';
import 'widgets/electricity_result_card.dart';

enum _PhaseCircuitType {
  singlePhase,
  threePhase,
}

class ElectricityPhasePowerPage extends StatefulWidget {
  const ElectricityPhasePowerPage({super.key});

  @override
  State<ElectricityPhasePowerPage> createState() =>
      _ElectricityPhasePowerPageState();
}

class _ElectricityPhasePowerPageState extends State<ElectricityPhasePowerPage> {
  final _powerCtrl = TextEditingController(text: '22000');
  final _voltageCtrl = TextEditingController(text: '400');
  final _cosPhiCtrl = TextEditingController(text: '1.0');

  _PhaseCircuitType _circuitType = _PhaseCircuitType.threePhase;

  @override
  void dispose() {
    _powerCtrl.dispose();
    _voltageCtrl.dispose();
    _cosPhiCtrl.dispose();
    super.dispose();
  }

  double? _parse(String value) {
    return double.tryParse(value.replaceAll(',', '.').trim());
  }

  void _setCircuitType(_PhaseCircuitType value) {
    setState(() {
      _circuitType = value;
      _voltageCtrl.text = value == _PhaseCircuitType.threePhase ? '400' : '230';
    });
  }

  _PhasePowerResult? _calculate() {
    final power = _parse(_powerCtrl.text);
    final voltage = _parse(_voltageCtrl.text);
    final cosPhi = (_parse(_cosPhiCtrl.text) ?? 1).clamp(0.1, 1.0);

    if (power == null || voltage == null || power <= 0 || voltage <= 0) {
      return null;
    }

    final isThreePhase = _circuitType == _PhaseCircuitType.threePhase;
    final phaseCount = isThreePhase ? 3 : 1;
    final powerPerPhase = power / phaseCount;
    final current = isThreePhase
        ? power / (math.sqrt(3) * voltage * cosPhi)
        : power / (voltage * cosPhi);

    return _PhasePowerResult(
      totalPowerW: power,
      powerPerPhaseW: powerPerPhase,
      currentA: current,
      phaseCount: phaseCount,
      voltageV: voltage,
      cosPhi: cosPhi,
    );
  }

  String _formatKw(double watts) {
    return (watts / 1000).toStringAsFixed(2);
  }

  String _formatNumber(double value, {int decimals = 1}) {
    return value.toStringAsFixed(decimals);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final result = _calculate();

    return Scaffold(
      appBar: AppBar(title: Text(loc.electricityToolPhasePowerTitle)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          children: [
            _CardSection(
              icon: Icons.power,
              title: loc.electricityCircuitTypeTitle,
              child: Row(
                children: [
                  Expanded(
                    child: _SelectorButton(
                      label: loc.electricitySinglePhase,
                      selected: _circuitType == _PhaseCircuitType.singlePhase,
                      onTap: () => _setCircuitType(
                        _PhaseCircuitType.singlePhase,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _SelectorButton(
                      label: loc.electricityThreePhase,
                      selected: _circuitType == _PhaseCircuitType.threePhase,
                      onTap: () => _setCircuitType(
                        _PhaseCircuitType.threePhase,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            _CardSection(
              icon: Icons.tune,
              title: loc.electricityInputsTitle,
              child: Column(
                children: [
                  ElectricityNumField(
                    controller: _powerCtrl,
                    label: loc.electricityTotalPowerLabel,
                    hint: loc.electricityTotalPowerHint,
                    suffix: 'W',
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
                    label: loc.electricityPowerFactorLabel,
                    hint: loc.electricityPowerFactorHint,
                    suffix: '',
                    onChanged: (_) => setState(() {}),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            ElectricityResultCard(
              icon: Icons.bolt,
              title: loc.electricityResultsTitle,
              color: Colors.lightBlueAccent,
              mainValue: result == null
                  ? '—'
                  : '${_formatNumber(result.currentA)} A',
              mainLabel: loc.electricityCurrentPerPhaseLabel,
              children: [
                if (result == null)
                  Text(
                    loc.electricityEnterValuesToCalculate,
                    style: const TextStyle(color: Colors.white54),
                  )
                else ...[
                  ElectricityInfoRow(
                    label: loc.electricityTotalPowerLabel,
                    value: '${_formatKw(result.totalPowerW)} kW',
                  ),
                  ElectricityInfoRow(
                    label: loc.electricityPowerPerPhaseLabel,
                    value: '${_formatKw(result.powerPerPhaseW)} kW',
                    valueColor: Colors.greenAccent,
                  ),
                  ElectricityInfoRow(
                    label: loc.electricityCurrentLabel,
                    value: '${_formatNumber(result.currentA)} A',
                    valueColor: Colors.lightBlueAccent,
                  ),
                  ElectricityInfoRow(
                    label: loc.electricityPhaseCountLabel,
                    value: result.phaseCount.toString(),
                  ),
                  ElectricityInfoRow(
                    label: loc.electricityVoltageLabel,
                    value: '${_formatNumber(result.voltageV, decimals: 0)} V',
                  ),
                  ElectricityInfoRow(
                    label: loc.electricityPowerFactorLabel,
                    value: result.cosPhi.toStringAsFixed(2),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PhasePowerResult {
  const _PhasePowerResult({
    required this.totalPowerW,
    required this.powerPerPhaseW,
    required this.currentA,
    required this.phaseCount,
    required this.voltageV,
    required this.cosPhi,
  });

  final double totalPowerW;
  final double powerPerPhaseW;
  final double currentA;
  final int phaseCount;
  final double voltageV;
  final double cosPhi;
}

class _CardSection extends StatelessWidget {
  const _CardSection({
    required this.icon,
    required this.title,
    required this.child,
  });

  final IconData icon;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color(0xFF1C1C21),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.white),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            child,
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
