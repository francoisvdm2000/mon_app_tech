import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../l10n_gen/app_localizations.dart';
import 'widgets/electricity_form_widgets.dart';
import 'widgets/electricity_result_card.dart';

enum _CircuitType {
  singlePhase,
  threePhase,
}

enum _InputMode {
  current,
  power,
}

enum _ConductorMaterial {
  copper,
  aluminium,
}

enum _InstallationMethod {
  conduit,
  freeAir,
}

enum _InsulationType {
  pvc70,
  xlpe90,
}

class ElectricityCableSectionPage extends StatefulWidget {
  const ElectricityCableSectionPage({super.key});

  @override
  State<ElectricityCableSectionPage> createState() =>
      _ElectricityCableSectionPageState();
}

class _ElectricityCableSectionPageState
    extends State<ElectricityCableSectionPage> {
  final _currentCtrl = TextEditingController(text: '32');
  final _powerCtrl = TextEditingController(text: '7360');
  final _lengthCtrl = TextEditingController(text: '30');
  final _voltageCtrl = TextEditingController(text: '230');
  final _voltageDropCtrl = TextEditingController(text: '3');
  final _cosPhiCtrl = TextEditingController(text: '1.0');

  _CircuitType _circuitType = _CircuitType.singlePhase;
  _InputMode _inputMode = _InputMode.current;
  _ConductorMaterial _material = _ConductorMaterial.copper;
  _InstallationMethod _installationMethod = _InstallationMethod.freeAir;
  _InsulationType _insulationType = _InsulationType.pvc70;

  @override
  void dispose() {
    _currentCtrl.dispose();
    _powerCtrl.dispose();
    _lengthCtrl.dispose();
    _voltageCtrl.dispose();
    _voltageDropCtrl.dispose();
    _cosPhiCtrl.dispose();
    super.dispose();
  }

  double? _parse(String value) {
    return double.tryParse(value.replaceAll(',', '.').trim());
  }

  String _formatNumber(double value, {int decimals = 1}) {
    return value.toStringAsFixed(decimals);
  }

  String _formatSection(double value) {
    if (value == value.roundToDouble()) {
      return value.toStringAsFixed(0);
    }
    return value.toStringAsFixed(1);
  }

  double get _suggestedVoltage {
    if (_circuitType == _CircuitType.threePhase) {
      return 400;
    }
    return 230;
  }

  bool get _isThreePhase => _circuitType == _CircuitType.threePhase;

  void _setCircuitType(_CircuitType value) {
    setState(() {
      _circuitType = value;
      _voltageCtrl.text = _suggestedVoltage.toStringAsFixed(0);
    });
  }

  _CableSectionResult? _calculate() {
    final length = _parse(_lengthCtrl.text);
    final voltage = _parse(_voltageCtrl.text);
    final allowedDropPercent = _parse(_voltageDropCtrl.text);
    final cosPhi = (_parse(_cosPhiCtrl.text) ?? 1).clamp(0.1, 1.0);

    if (length == null ||
        voltage == null ||
        allowedDropPercent == null ||
        length <= 0 ||
        voltage <= 0 ||
        allowedDropPercent <= 0) {
      return null;
    }

    final current = _inputMode == _InputMode.current
        ? _parse(_currentCtrl.text)
        : _currentFromPower(
            power: _parse(_powerCtrl.text),
            voltage: voltage,
            cosPhi: cosPhi,
          );

    if (current == null || current <= 0) {
      return null;
    }

    final candidates = _CableSectionTable.sectionsFor(
      material: _material,
      insulation: _insulationType,
      installation: _installationMethod,
      loadedConductors: _isThreePhase ? 3 : 2,
    );

    _CableSectionRow? selected;
    double selectedDrop = 0;

    for (final row in candidates) {
      final voltageDropPercent = _voltageDropPercent(
        current: current,
        length: length,
        voltage: voltage,
        section: row.sectionMm2,
        cosPhi: cosPhi,
      );

      final currentOk = row.maxCurrentA >= current;
      final dropOk = voltageDropPercent <= allowedDropPercent;

      if (currentOk && dropOk) {
        selected = row;
        selectedDrop = voltageDropPercent;
        break;
      }
    }

    if (selected == null) {
      final last = candidates.last;
      return _CableSectionResult(
        currentA: current,
        selectedSectionMm2: last.sectionMm2,
        maxCurrentA: last.maxCurrentA,
        voltageDropPercent: _voltageDropPercent(
          current: current,
          length: length,
          voltage: voltage,
          section: last.sectionMm2,
          cosPhi: cosPhi,
        ),
        voltageDropV: voltage *
            _voltageDropPercent(
              current: current,
              length: length,
              voltage: voltage,
              section: last.sectionMm2,
              cosPhi: cosPhi,
            ) /
            100,
        recommendedBreakerA: null,
        isWithinTable: false,
        currentOk: false,
        voltageDropOk: false,
      );
    }

    final breaker = _recommendedBreaker(
      current: current,
      maxCableCurrent: selected.maxCurrentA,
    );

    return _CableSectionResult(
      currentA: current,
      selectedSectionMm2: selected.sectionMm2,
      maxCurrentA: selected.maxCurrentA,
      voltageDropPercent: selectedDrop,
      voltageDropV: voltage * selectedDrop / 100,
      recommendedBreakerA: breaker,
      isWithinTable: true,
      currentOk: selected.maxCurrentA >= current,
      voltageDropOk: selectedDrop <= allowedDropPercent,
    );
  }

  double? _currentFromPower({
    required double? power,
    required double voltage,
    required double cosPhi,
  }) {
    if (power == null || power <= 0) {
      return null;
    }

    if (_isThreePhase) {
      return power / (math.sqrt(3) * voltage * cosPhi);
    }

    return power / (voltage * cosPhi);
  }

  double _voltageDropPercent({
    required double current,
    required double length,
    required double voltage,
    required double section,
    required double cosPhi,
  }) {
    final resistivity = _material == _ConductorMaterial.copper ? 0.0225 : 0.036;
    final factor = _isThreePhase ? math.sqrt(3) : 2.0;
    final dropV = factor * current * length * resistivity * cosPhi / section;
    return dropV / voltage * 100;
  }

  double? _recommendedBreaker({
    required double current,
    required double maxCableCurrent,
  }) {
    const breakers = <double>[6, 10, 16, 20, 25, 32, 40, 50, 63, 80, 100, 125];

    for (final breaker in breakers) {
      if (breaker >= current && breaker <= maxCableCurrent) {
        return breaker;
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final result = _calculate();

    return Scaffold(
      appBar: AppBar(title: Text(loc.electricityToolCableSectionTitle)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          children: [
            _CardSection(
              icon: Icons.power,
              title: loc.electricityCircuitTypeTitle,
              child: _TwoWaySelector<_CircuitType>(
                leftLabel: loc.electricitySinglePhase,
                rightLabel: loc.electricityThreePhase,
                value: _circuitType,
                leftValue: _CircuitType.singlePhase,
                rightValue: _CircuitType.threePhase,
                onChanged: _setCircuitType,
              ),
            ),
            const SizedBox(height: 14),
            _CardSection(
              icon: Icons.input,
              title: loc.electricityConsumptionInputTypeTitle,
              child: _TwoWaySelector<_InputMode>(
                leftLabel: loc.electricityInputCurrent,
                rightLabel: loc.electricityInputPower,
                value: _inputMode,
                leftValue: _InputMode.current,
                rightValue: _InputMode.power,
                onChanged: (value) => setState(() => _inputMode = value),
              ),
            ),
            const SizedBox(height: 14),
            _CardSection(
              icon: Icons.tune,
              title: loc.electricityInputsTitle,
              child: Column(
                children: [
                  if (_inputMode == _InputMode.current)
                    ElectricityNumField(
                      controller: _currentCtrl,
                      label: loc.electricityConsumptionCurrentLabel,
                      hint: loc.electricityConsumptionCurrentHint,
                      suffix: 'A',
                      onChanged: (_) => setState(() {}),
                    )
                  else
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
                  if (_inputMode == _InputMode.power) ...[
                    ElectricityNumField(
                      controller: _cosPhiCtrl,
                      label: loc.electricityPowerFactorLabel,
                      hint: loc.electricityPowerFactorHint,
                      suffix: '',
                      onChanged: (_) => setState(() {}),
                    ),
                    const SizedBox(height: 12),
                  ],
                  ElectricityNumField(
                    controller: _lengthCtrl,
                    label: loc.electricityCableLengthLabel,
                    hint: loc.electricityCableLengthHint,
                    suffix: 'm',
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 12),
                  ElectricityNumField(
                    controller: _voltageDropCtrl,
                    label: loc.electricityAllowedVoltageDropLabel,
                    hint: loc.electricityAllowedVoltageDropHint,
                    suffix: '%',
                    onChanged: (_) => setState(() {}),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            _CardSection(
              icon: Icons.settings_input_component,
              title: loc.electricityCableReferenceTitle,
              child: Column(
                children: [
                  _TwoWaySelector<_ConductorMaterial>(
                    leftLabel: loc.electricityCopper,
                    rightLabel: loc.electricityAluminium,
                    value: _material,
                    leftValue: _ConductorMaterial.copper,
                    rightValue: _ConductorMaterial.aluminium,
                    onChanged: (value) => setState(() => _material = value),
                  ),
                  const SizedBox(height: 12),
                  _TwoWaySelector<_InsulationType>(
                    leftLabel: loc.electricityInsulationPvc,
                    rightLabel: loc.electricityInsulationXlpe,
                    value: _insulationType,
                    leftValue: _InsulationType.pvc70,
                    rightValue: _InsulationType.xlpe90,
                    onChanged: (value) =>
                        setState(() => _insulationType = value),
                  ),
                  const SizedBox(height: 12),
                  _TwoWaySelector<_InstallationMethod>(
                    leftLabel: loc.electricityInstallConduit,
                    rightLabel: loc.electricityInstallFreeAir,
                    value: _installationMethod,
                    leftValue: _InstallationMethod.conduit,
                    rightValue: _InstallationMethod.freeAir,
                    onChanged: (value) =>
                        setState(() => _installationMethod = value),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            ElectricityResultCard(
              icon: Icons.cable,
              title: loc.electricityResultsTitle,
              color: result == null
                  ? Colors.white54
                  : result.isSafe
                      ? Colors.greenAccent
                      : Colors.orangeAccent,
              mainValue: result == null
                  ? '—'
                  : '${_formatSection(result.selectedSectionMm2)} mm²',
              mainLabel: loc.electricityRecommendedCableSectionLabel,
              children: [
                if (result == null)
                  Text(
                    loc.electricityEnterValuesToCalculate,
                    style: const TextStyle(color: Colors.white54),
                  )
                else ...[
                  ElectricityInfoRow(
                    label: loc.electricityCalculatedCurrentLabel,
                    value: '${_formatNumber(result.currentA)} A',
                  ),
                  ElectricityInfoRow(
                    label: loc.electricityMaxCurrentForSectionLabel,
                    value: '${_formatNumber(result.maxCurrentA)} A',
                  ),
                  ElectricityInfoRow(
                    label: loc.electricityVoltageDropLabel,
                    value:
                        '${_formatNumber(result.voltageDropV, decimals: 2)} V · ${_formatNumber(result.voltageDropPercent, decimals: 2)} %',
                    valueColor: result.voltageDropOk
                        ? Colors.greenAccent
                        : Colors.orangeAccent,
                  ),
                  ElectricityInfoRow(
                    label: loc.electricityRecommendedBreakerLabel,
                    value: result.recommendedBreakerA == null
                        ? loc.electricityNoStandardBreaker
                        : '${result.recommendedBreakerA!.toStringAsFixed(0)} A',
                    valueColor: result.recommendedBreakerA == null
                        ? Colors.orangeAccent
                        : Colors.greenAccent,
                  ),
                  ElectricityInfoRow(
                    label: loc.electricityStatusLabel,
                    value: result.isSafe
                        ? loc.electricityStatusOk
                        : loc.electricityStatusWarning,
                    valueColor:
                        result.isSafe ? Colors.greenAccent : Colors.orangeAccent,
                  ),
                ],
              ],
            ),
            const SizedBox(height: 14),
            _CardSection(
              icon: Icons.info_outline,
              title: loc.electricityImportantNoteTitle,
              child: Text(
                loc.electricityCableSectionDisclaimer,
                style: const TextStyle(color: Colors.white70, height: 1.35),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CableSectionResult {
  const _CableSectionResult({
    required this.currentA,
    required this.selectedSectionMm2,
    required this.maxCurrentA,
    required this.voltageDropPercent,
    required this.voltageDropV,
    required this.recommendedBreakerA,
    required this.isWithinTable,
    required this.currentOk,
    required this.voltageDropOk,
  });

  final double currentA;
  final double selectedSectionMm2;
  final double maxCurrentA;
  final double voltageDropPercent;
  final double voltageDropV;
  final double? recommendedBreakerA;
  final bool isWithinTable;
  final bool currentOk;
  final bool voltageDropOk;

  bool get isSafe =>
      isWithinTable && currentOk && voltageDropOk && recommendedBreakerA != null;
}

class _CableSectionRow {
  const _CableSectionRow({
    required this.sectionMm2,
    required this.maxCurrentA,
  });

  final double sectionMm2;
  final double maxCurrentA;
}

class _CableSectionTable {
  static List<_CableSectionRow> sectionsFor({
    required _ConductorMaterial material,
    required _InsulationType insulation,
    required _InstallationMethod installation,
    required int loadedConductors,
  }) {
    final base = loadedConductors == 3 ? _cuPvcFreeAir3 : _cuPvcFreeAir2;

    final materialFactor =
        material == _ConductorMaterial.copper ? 1.0 : 0.78;
    final insulationFactor = insulation == _InsulationType.pvc70 ? 1.0 : 1.17;
    final installationFactor =
        installation == _InstallationMethod.freeAir ? 1.0 : 0.78;

    return base
        .map(
          (row) => _CableSectionRow(
            sectionMm2: row.sectionMm2,
            maxCurrentA: row.maxCurrentA *
                materialFactor *
                insulationFactor *
                installationFactor,
          ),
        )
        .toList();
  }

  static const List<_CableSectionRow> _cuPvcFreeAir2 = [
    _CableSectionRow(sectionMm2: 1.5, maxCurrentA: 19.5),
    _CableSectionRow(sectionMm2: 2.5, maxCurrentA: 27),
    _CableSectionRow(sectionMm2: 4, maxCurrentA: 36),
    _CableSectionRow(sectionMm2: 6, maxCurrentA: 46),
    _CableSectionRow(sectionMm2: 10, maxCurrentA: 63),
    _CableSectionRow(sectionMm2: 16, maxCurrentA: 85),
    _CableSectionRow(sectionMm2: 25, maxCurrentA: 112),
    _CableSectionRow(sectionMm2: 35, maxCurrentA: 138),
    _CableSectionRow(sectionMm2: 50, maxCurrentA: 168),
    _CableSectionRow(sectionMm2: 70, maxCurrentA: 213),
    _CableSectionRow(sectionMm2: 95, maxCurrentA: 258),
    _CableSectionRow(sectionMm2: 120, maxCurrentA: 299),
    _CableSectionRow(sectionMm2: 150, maxCurrentA: 344),
    _CableSectionRow(sectionMm2: 185, maxCurrentA: 392),
    _CableSectionRow(sectionMm2: 240, maxCurrentA: 461),
  ];

  static const List<_CableSectionRow> _cuPvcFreeAir3 = [
    _CableSectionRow(sectionMm2: 1.5, maxCurrentA: 17.5),
    _CableSectionRow(sectionMm2: 2.5, maxCurrentA: 24),
    _CableSectionRow(sectionMm2: 4, maxCurrentA: 32),
    _CableSectionRow(sectionMm2: 6, maxCurrentA: 41),
    _CableSectionRow(sectionMm2: 10, maxCurrentA: 57),
    _CableSectionRow(sectionMm2: 16, maxCurrentA: 76),
    _CableSectionRow(sectionMm2: 25, maxCurrentA: 96),
    _CableSectionRow(sectionMm2: 35, maxCurrentA: 119),
    _CableSectionRow(sectionMm2: 50, maxCurrentA: 144),
    _CableSectionRow(sectionMm2: 70, maxCurrentA: 184),
    _CableSectionRow(sectionMm2: 95, maxCurrentA: 223),
    _CableSectionRow(sectionMm2: 120, maxCurrentA: 259),
    _CableSectionRow(sectionMm2: 150, maxCurrentA: 299),
    _CableSectionRow(sectionMm2: 185, maxCurrentA: 341),
    _CableSectionRow(sectionMm2: 240, maxCurrentA: 403),
  ];
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

class _TwoWaySelector<T> extends StatelessWidget {
  const _TwoWaySelector({
    required this.leftLabel,
    required this.rightLabel,
    required this.value,
    required this.leftValue,
    required this.rightValue,
    required this.onChanged,
  });

  final String leftLabel;
  final String rightLabel;
  final T value;
  final T leftValue;
  final T rightValue;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _SelectorButton(
            label: leftLabel,
            selected: value == leftValue,
            onTap: () => onChanged(leftValue),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _SelectorButton(
            label: rightLabel,
            selected: value == rightValue,
            onTap: () => onChanged(rightValue),
          ),
        ),
      ],
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
