// lib/pages/electricity/electricity_power_current_page.dart
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import 'widgets/electricity_form_widgets.dart';
import 'widgets/electricity_result_card.dart';

class ElectricityPowerCurrentPage extends StatefulWidget {
  const ElectricityPowerCurrentPage({super.key});

  @override
  State<ElectricityPowerCurrentPage> createState() =>
      _ElectricityPowerCurrentPageState();
}

class _ElectricityPowerCurrentPageState
    extends State<ElectricityPowerCurrentPage> {
  int _solveFor = 0;
  bool _isThreePhase = false;

  final _pCtrl = TextEditingController();
  final _iCtrl = TextEditingController();
  final _uCtrl = TextEditingController(text: '230');
  final _pfCtrl = TextEditingController(text: '1.0');
  final _hCtrl = TextEditingController();

  String _result = '';
  String _resultLabel = '';
  String _resultUnit = '';
  Color _resultColor = Colors.greenAccent;

  @override
  void dispose() {
    _pCtrl.dispose();
    _iCtrl.dispose();
    _uCtrl.dispose();
    _pfCtrl.dispose();
    _hCtrl.dispose();
    super.dispose();
  }

  double? _parse(String value) {
    return double.tryParse(value.trim().replaceAll(',', '.'));
  }

  void _calculate() {
    final loc = AppLocalizations.of(context);
    final pf = _parse(_pfCtrl.text) ?? 1.0;
    final factor = _isThreePhase ? math.sqrt(3) : 1.0;

    switch (_solveFor) {
      case 0:
        final i = _parse(_iCtrl.text);
        final u = _parse(_uCtrl.text);
        if (i == null || u == null) {
          _setError(loc);
          return;
        }
        final p = _isThreePhase ? factor * u * i * pf : u * i * pf;
        setState(() {
          _resultLabel = loc.electricityResultActivePower;
          _result = _fmt(p);
          _resultUnit = 'W';
          _resultColor = Colors.greenAccent;
        });
        break;

      case 1:
        final p = _parse(_pCtrl.text);
        final u = _parse(_uCtrl.text);
        if (p == null || u == null || u == 0) {
          _setError(loc);
          return;
        }
        final i = _isThreePhase ? p / (factor * u * pf) : p / (u * pf);
        setState(() {
          _resultLabel = loc.electricityResultCurrent;
          _result = _fmt(i);
          _resultUnit = 'A';
          _resultColor = Colors.orangeAccent;
        });
        break;

      case 2:
        final p = _parse(_pCtrl.text);
        final i = _parse(_iCtrl.text);
        if (p == null || i == null || i == 0) {
          _setError(loc);
          return;
        }
        final u = _isThreePhase ? p / (factor * i * pf) : p / (i * pf);
        setState(() {
          _resultLabel = loc.electricityResultVoltage;
          _result = _fmt(u);
          _resultUnit = 'V';
          _resultColor = Colors.lightBlueAccent;
        });
        break;

      case 3:
        final p = _parse(_pCtrl.text);
        final h = _parse(_hCtrl.text);
        if (p == null || h == null) {
          _setError(loc);
          return;
        }
        final kwh = p * h / 1000;
        setState(() {
          _resultLabel = loc.electricityResultEnergy;
          _result = kwh.toStringAsFixed(3);
          _resultUnit = 'kWh';
          _resultColor = Colors.purpleAccent;
        });
        break;
    }
  }

  void _setError(AppLocalizations loc) {
    setState(() {
      _resultLabel = loc.electricityInsufficient;
      _result = '—';
      _resultUnit = '';
      _resultColor = Colors.redAccent;
    });
  }

  String _fmt(double value) {
    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(2)} k';
    }
    if (value < 0.01) {
      return value.toStringAsExponential(2);
    }
    return value.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    final solverItems = [
      (0, loc.electricityCalcPower, 'W'),
      (1, loc.electricityCalcCurrent, 'A'),
      (2, loc.electricityCalcVoltage, 'V'),
      (3, loc.electricityCalcEnergy, 'kWh'),
    ];

    final refItems = [
      (loc.electricityRef16AMono, '3 680 W'),
      (loc.electricityRef32AMono, '7 360 W'),
      (loc.electricityRef32ATri, '22 000 W'),
      (loc.electricityRef63ATri, '43 000 W'),
      (loc.electricityRef125ATri, '86 000 W'),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(loc.electricityToolPowerCurrentTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white12),
            ),
            child: Column(
              children: [
                Text(
                  _isThreePhase
                      ? loc.electricityFormulaTri
                      : loc.electricityFormulaMono,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'monospace',
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  _isThreePhase
                      ? loc.electricityFormulaTriDesc
                      : loc.electricityFormulaMonoDesc,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white38, fontSize: 11),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SectionCard(
            title: loc.electricityCircuitType,
            icon: Icons.electrical_services,
            child: Row(
              children: [
                _PhaseButton(
                  label: loc.electricityMono,
                  subtitle: loc.electricityMonoDesc,
                  selected: !_isThreePhase,
                  onTap: () => setState(() {
                    _isThreePhase = false;
                    _uCtrl.text = '230';
                  }),
                ),
                const SizedBox(width: 8),
                _PhaseButton(
                  label: loc.electricityThreePhase,
                  subtitle: loc.electricityThreePhaseDesc,
                  selected: _isThreePhase,
                  onTap: () => setState(() {
                    _isThreePhase = true;
                    _uCtrl.text = '400';
                  }),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SectionCard(
            title: loc.electricityCalcFor,
            icon: Icons.calculate,
            child: Column(
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: solverItems.map((item) {
                    final selected = _solveFor == item.$1;
                    return GestureDetector(
                      onTap: () => setState(() => _solveFor = item.$1),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: selected
                              ? Colors.lightBlueAccent.withValues(alpha: 0.20)
                              : Colors.white.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: selected
                                ? Colors.lightBlueAccent
                                : Colors.white24,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              item.$2,
                              style: TextStyle(
                                color: selected
                                    ? Colors.lightBlueAccent
                                    : Colors.white70,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              item.$3,
                              style: TextStyle(
                                color: selected
                                    ? Colors.lightBlueAccent
                                        .withValues(alpha: 0.70)
                                    : Colors.white38,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                if (_solveFor != 0) ...[
                  ElectricityNumField(
                    controller: _pCtrl,
                    label: loc.electricityFieldPower,
                    hint: loc.electricityFieldPowerHint,
                    suffix: 'W',
                  ),
                  const SizedBox(height: 10),
                ],
                if (_solveFor != 1) ...[
                  ElectricityNumField(
                    controller: _iCtrl,
                    label: loc.electricityFieldCurrent,
                    hint: loc.electricityFieldCurrentHint,
                    suffix: 'A',
                  ),
                  const SizedBox(height: 10),
                ],
                if (_solveFor != 2) ...[
                  ElectricityNumField(
                    controller: _uCtrl,
                    label: loc.electricityFieldVoltage,
                    hint: loc.electricityFieldVoltageHint,
                    suffix: 'V',
                  ),
                  const SizedBox(height: 10),
                ],
                if (_solveFor == 3) ...[
                  ElectricityNumField(
                    controller: _hCtrl,
                    label: loc.electricityFieldDuration,
                    hint: loc.electricityFieldDurationHint,
                    suffix: 'h',
                  ),
                  const SizedBox(height: 10),
                ],
                ElectricityNumField(
                  controller: _pfCtrl,
                  label: loc.electricityFieldPf,
                  hint: loc.electricityFieldPfHint,
                  suffix: '',
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _calculate,
                    icon: const Icon(Icons.bolt),
                    label: Text(loc.electricityCalculate),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          if (_result.isNotEmpty)
            ElectricityResultCard(
              label: _resultLabel,
              value: '$_result $_resultUnit',
              color: _resultColor,
            ),
          const SizedBox(height: 16),
          SectionCard(
            title: loc.electricityRefTitle,
            icon: Icons.info_outline,
            child: Column(
              children: refItems.map((row) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Text(
                        row.$1,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        row.$2,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _PhaseButton extends StatelessWidget {
  const _PhaseButton({
    required this.label,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color: selected
                ? Colors.amber.withValues(alpha: 0.15)
                : Colors.white.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: selected ? Colors.amber : Colors.white24,
              width: selected ? 1.5 : 1,
            ),
          ),
          child: Column(
            children: [
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: selected ? Colors.amber : Colors.white70,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: selected
                      ? Colors.amber.withValues(alpha: 0.70)
                      : Colors.white38,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
