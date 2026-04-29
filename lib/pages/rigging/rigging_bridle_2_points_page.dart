import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../l10n_gen/app_localizations.dart';
import 'widgets/rigging_bridle_diagram.dart';
import 'widgets/rigging_result_card.dart';

enum _BridleKnownInput {
  drop,
  angle,
  legLength,
}

enum _BridleCalculationMode {
  geometry,
  load,
}

class RiggingBridle2PointsPage extends StatefulWidget {
  const RiggingBridle2PointsPage({super.key});

  @override
  State<RiggingBridle2PointsPage> createState() =>
      _RiggingBridle2PointsPageState();
}

class _RiggingBridle2PointsPageState extends State<RiggingBridle2PointsPage> {
  final _spanController = TextEditingController(text: '5');
  final _dropController = TextEditingController(text: '4');
  final _angleController = TextEditingController(text: '58');
  final _legLengthController = TextEditingController(text: '4.72');
  final _weightController = TextEditingController(text: '100');
  final _offsetController = TextEditingController(text: '2.5');

  _BridleKnownInput _knownInput = _BridleKnownInput.drop;
  _BridleCalculationMode _calculationMode = _BridleCalculationMode.geometry;
  bool _offCenter = false;

  bool get _withLoad => _calculationMode == _BridleCalculationMode.load;

  @override
  void dispose() {
    _spanController.dispose();
    _dropController.dispose();
    _angleController.dispose();
    _legLengthController.dispose();
    _weightController.dispose();
    _offsetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final result = _calculate();

    return Scaffold(
      appBar: AppBar(title: Text(loc.riggingToolBridleTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          RiggingResultCard(
            title: loc.riggingInputsTitle,
            icon: Icons.tune,
            children: [
              _calculationModeSelector(loc),
              const SizedBox(height: 12),
              _inputModeSelector(loc),
              const SizedBox(height: 12),
              _numberField(
                controller: _spanController,
                label: loc.riggingSpanLabel,
                suffix: loc.riggingUnitMeters,
              ),
              const SizedBox(height: 12),
              if (_knownInput == _BridleKnownInput.drop)
                _numberField(
                  controller: _dropController,
                  label: loc.riggingDropLabel,
                  suffix: loc.riggingUnitMeters,
                ),
              if (_knownInput == _BridleKnownInput.angle)
                _numberField(
                  controller: _angleController,
                  label: loc.riggingAngleFromHorizontalLabel,
                  suffix: loc.riggingUnitDegrees,
                ),
              if (_knownInput == _BridleKnownInput.legLength)
                _numberField(
                  controller: _legLengthController,
                  label: loc.riggingLegLengthKnownLabel,
                  suffix: loc.riggingUnitMeters,
                ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: Text(loc.riggingOffCenterToggle)),
                  Switch(
                    value: _offCenter,
                    onChanged: (value) => setState(() => _offCenter = value),
                  ),
                ],
              ),
              if (_offCenter) ...[
                const SizedBox(height: 12),
                _numberField(
                  controller: _offsetController,
                  label: loc.riggingOffsetLabel,
                  suffix: loc.riggingUnitMeters,
                ),
              ],
              if (_withLoad) ...[
                const SizedBox(height: 12),
                _numberField(
                  controller: _weightController,
                  label: loc.riggingLoadWeightLabel,
                  suffix: loc.riggingUnitKg,
                ),
              ] else ...[
                const SizedBox(height: 12),
                _infoBox(
                  icon: Icons.straighten_outlined,
                  text: loc.riggingGeometryOnlyDescription,
                ),
              ],
            ],
          ),
          const SizedBox(height: 14),
          RiggingResultCard(
            title: loc.riggingSchemaTitle,
            icon: Icons.schema_outlined,
            children: [
              RiggingBridleDiagram(
                showLoadData: _withLoad,
                data: result == null
                    ? null
                    : RiggingBridleDiagramData(
                        span: result.span,
                        drop: result.drop,
                        offset: result.offset,
                        leftLength: result.leftLength,
                        rightLength: result.rightLength,
                        leftTension: result.leftTension,
                        rightTension: result.rightTension,
                        leftAngleH: result.leftAngleFromHorizontal,
                        rightAngleH: result.rightAngleFromHorizontal,
                      ),
                labels: RiggingBridleDiagramLabels(
                  pointA: loc.riggingPointALabel,
                  pointB: loc.riggingPointBLabel,
                  leftLeg: loc.riggingLegLeftLabel,
                  rightLeg: loc.riggingLegRightLabel,
                  drop: loc.riggingDropLabel,
                  span: loc.riggingSpanLabel,
                  offset: loc.riggingOffsetLabel,
                  load: loc.riggingLoadShortLabel,
                  tension: loc.riggingTensionLabel,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          RiggingResultCard(
            title: loc.riggingResultsTitle,
            icon: Icons.fact_check_outlined,
            children: [
              if (result == null)
                Text(
                  loc.riggingInvalidInputsMessage,
                  style: const TextStyle(color: Colors.orangeAccent),
                )
              else ...[
                if (_withLoad) ...[
                  RiggingStatusBanner(
                    label: result.statusLabel(loc),
                    description: result.statusDescription(loc),
                    color: result.statusColor,
                    icon: result.statusIcon,
                  ),
                  const SizedBox(height: 12),
                ] else ...[
                  _infoBox(
                    icon: Icons.info_outline,
                    text: loc.riggingGeometryOnlyDescription,
                  ),
                  const SizedBox(height: 12),
                ],
                RiggingValueRow(
                  label: loc.riggingLegLeftLabel,
                  value:
                      '${_formatNumber(result.leftLength)} ${loc.riggingUnitMeters}',
                  color: RiggingBridleDiagram.leftColor,
                ),
                RiggingValueRow(
                  label: loc.riggingLegRightLabel,
                  value:
                      '${_formatNumber(result.rightLength)} ${loc.riggingUnitMeters}',
                  color: RiggingBridleDiagram.rightColor,
                ),
                RiggingValueRow(
                  label: loc.riggingDropLabel,
                  value:
                      '${_formatNumber(result.drop)} ${loc.riggingUnitMeters}',
                  color: RiggingBridleDiagram.dropColor,
                ),
                RiggingValueRow(
                  label: loc.riggingAngleHLeftLabel,
                  value:
                      '${_formatNumber(result.leftAngleFromHorizontal)}${loc.riggingUnitDegrees}',
                  color: _angleStatusColor(result.leftAngleFromHorizontal),
                ),
                RiggingValueRow(
                  label: loc.riggingAngleHRightLabel,
                  value:
                      '${_formatNumber(result.rightAngleFromHorizontal)}${loc.riggingUnitDegrees}',
                  color: _angleStatusColor(result.rightAngleFromHorizontal),
                ),
                if (_withLoad) ...[
                  RiggingValueRow(
                    label: loc.riggingTensionLeftLabel,
                    value:
                        '${_formatNumber(result.leftTension, decimals: 1)} ${loc.riggingUnitKg}',
                    color: RiggingBridleDiagram.leftColor,
                  ),
                  RiggingValueRow(
                    label: loc.riggingTensionRightLabel,
                    value:
                        '${_formatNumber(result.rightTension, decimals: 1)} ${loc.riggingUnitKg}',
                    color: RiggingBridleDiagram.rightColor,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    loc.riggingSafetyDisclaimer,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.58),
                      height: 1.25,
                    ),
                  ),
                ],
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _calculationModeSelector(AppLocalizations loc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          loc.riggingCalculationModeLabel,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.72),
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        SegmentedButton<_BridleCalculationMode>(
          segments: [
            ButtonSegment(
              value: _BridleCalculationMode.geometry,
              label: Text(loc.riggingGeometryOnlyLabel),
              icon: const Icon(Icons.straighten),
            ),
            ButtonSegment(
              value: _BridleCalculationMode.load,
              label: Text(loc.riggingWithLoadLabel),
              icon: const Icon(Icons.balance),
            ),
          ],
          selected: {_calculationMode},
          onSelectionChanged: (value) {
            setState(() => _calculationMode = value.first);
          },
          showSelectedIcon: false,
        ),
      ],
    );
  }

  Widget _inputModeSelector(AppLocalizations loc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          loc.riggingKnownInputLabel,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.72),
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        SegmentedButton<_BridleKnownInput>(
          segments: [
            ButtonSegment(
              value: _BridleKnownInput.drop,
              label: Text(loc.riggingKnownDrop),
              icon: const Icon(Icons.height),
            ),
            ButtonSegment(
              value: _BridleKnownInput.angle,
              label: Text(loc.riggingKnownAngle),
              icon: const Icon(Icons.architecture),
            ),
            ButtonSegment(
              value: _BridleKnownInput.legLength,
              label: Text(loc.riggingKnownLength),
              icon: const Icon(Icons.straighten),
            ),
          ],
          selected: {_knownInput},
          onSelectionChanged: (value) {
            setState(() => _knownInput = value.first);
          },
          showSelectedIcon: false,
        ),
      ],
    );
  }

  Widget _numberField({
    required TextEditingController controller,
    required String label,
    required String suffix,
  }) {
    return TextField(
      controller: controller,
      onChanged: (_) => setState(() {}),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9\.,]')),
      ],
      decoration: InputDecoration(
        labelText: label,
        suffixText: suffix,
        filled: true,
        fillColor: const Color(0xFF141418),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  Widget _infoBox({required IconData icon, required String text}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white.withValues(alpha: 0.72), size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.72),
                height: 1.25,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _BridleResult? _calculate() {
    final span = _parseNumber(_spanController.text);
    final weight =
        _withLoad ? (_parseNumber(_weightController.text) ?? 0) : 0.0;

    if (span == null || span <= 0 || weight < 0) {
      return null;
    }

    final offset = _offCenter ? _parseNumber(_offsetController.text) : span / 2;
    if (offset == null || offset <= 0 || offset >= span) {
      return null;
    }

    double? drop;

    switch (_knownInput) {
      case _BridleKnownInput.drop:
        drop = _parseNumber(_dropController.text);
        break;
      case _BridleKnownInput.angle:
        final angle = _parseNumber(_angleController.text);
        if (angle == null || angle <= 0 || angle >= 90) {
          return null;
        }
        drop = math.tan(_radians(angle)) * offset;
        break;
      case _BridleKnownInput.legLength:
        final leftLength = _parseNumber(_legLengthController.text);
        if (leftLength == null || leftLength <= offset) {
          return null;
        }
        drop = math.sqrt((leftLength * leftLength) - (offset * offset));
        break;
    }

    if (drop == null || drop <= 0) {
      return null;
    }

    final leftHorizontal = offset;
    final rightHorizontal = span - offset;

    final leftLength = math.sqrt(
      (leftHorizontal * leftHorizontal) + (drop * drop),
    );
    final rightLength = math.sqrt(
      (rightHorizontal * rightHorizontal) + (drop * drop),
    );

    final leftAngle = _degrees(math.atan2(drop, leftHorizontal));
    final rightAngle = _degrees(math.atan2(drop, rightHorizontal));

    final leftTension = _withLoad ? _legTension(weight, leftAngle) : 0.0;
    final rightTension = _withLoad ? _legTension(weight, rightAngle) : 0.0;

    return _BridleResult(
      span: span,
      drop: drop,
      offset: offset,
      leftLength: leftLength,
      rightLength: rightLength,
      leftAngleFromHorizontal: leftAngle,
      rightAngleFromHorizontal: rightAngle,
      leftTension: leftTension,
      rightTension: rightTension,
    );
  }

  double _legTension(double weight, double angleFromHorizontal) {
    if (weight <= 0) {
      return 0;
    }
    final sine = math.sin(_radians(angleFromHorizontal));
    if (sine <= 0) {
      return double.infinity;
    }
    return weight / (2 * sine);
  }

  double _degrees(double radians) => radians * 180 / math.pi;

  double _radians(double degrees) => degrees * math.pi / 180;
}

class _BridleResult {
  const _BridleResult({
    required this.span,
    required this.drop,
    required this.offset,
    required this.leftLength,
    required this.rightLength,
    required this.leftAngleFromHorizontal,
    required this.rightAngleFromHorizontal,
    required this.leftTension,
    required this.rightTension,
  });

  final double span;
  final double drop;
  final double offset;
  final double leftLength;
  final double rightLength;
  final double leftAngleFromHorizontal;
  final double rightAngleFromHorizontal;
  final double leftTension;
  final double rightTension;

  double get worstAngle => math.min(
        leftAngleFromHorizontal,
        rightAngleFromHorizontal,
      );

  Color get statusColor {
    if (worstAngle >= 45) {
      return Colors.greenAccent;
    }
    if (worstAngle >= 30) {
      return Colors.lightBlueAccent;
    }
    if (worstAngle >= 15) {
      return Colors.orangeAccent;
    }
    return Colors.redAccent;
  }

  IconData get statusIcon {
    if (worstAngle >= 45) {
      return Icons.check_circle_outline;
    }
    if (worstAngle >= 30) {
      return Icons.info_outline;
    }
    return Icons.warning_amber_rounded;
  }

  String statusLabel(AppLocalizations loc) {
    if (worstAngle >= 45) {
      return loc.riggingStatusOk;
    }
    if (worstAngle >= 30) {
      return loc.riggingStatusWatch;
    }
    if (worstAngle >= 15) {
      return loc.riggingStatusHigh;
    }
    return loc.riggingStatusDanger;
  }

  String statusDescription(AppLocalizations loc) {
    if (worstAngle >= 45) {
      return loc.riggingStatusOkDescription;
    }
    if (worstAngle >= 30) {
      return loc.riggingStatusWatchDescription;
    }
    if (worstAngle >= 15) {
      return loc.riggingStatusHighDescription;
    }
    return loc.riggingStatusDangerDescription;
  }
}

double? _parseNumber(String value) {
  return double.tryParse(value.trim().replaceAll(',', '.'));
}

String _formatNumber(double value, {int decimals = 2}) {
  return value.toStringAsFixed(decimals);
}

Color _angleStatusColor(double angleFromHorizontal) {
  if (angleFromHorizontal >= 45) {
    return Colors.greenAccent;
  }
  if (angleFromHorizontal >= 30) {
    return Colors.lightBlueAccent;
  }
  if (angleFromHorizontal >= 15) {
    return Colors.orangeAccent;
  }
  return Colors.redAccent;
}
