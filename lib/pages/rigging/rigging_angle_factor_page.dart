import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../l10n_gen/app_localizations.dart';
import 'widgets/rigging_result_card.dart';

class RiggingAngleFactorPage extends StatefulWidget {
  const RiggingAngleFactorPage({super.key});

  @override
  State<RiggingAngleFactorPage> createState() => _RiggingAngleFactorPageState();
}

class _RiggingAngleFactorPageState extends State<RiggingAngleFactorPage> {
  final _angleController = TextEditingController(text: '60');
  final _weightController = TextEditingController(text: '100');

  @override
  void dispose() {
    _angleController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final angle = _parseNumber(_angleController.text);
    final weight = _parseNumber(_weightController.text) ?? 0;
    final factor = angle == null || angle <= 0 || angle >= 90
        ? null
        : 1 / (2 * math.sin(_radians(angle)));
    final tension = factor == null ? null : weight * factor;
    final color = angle == null ? Colors.orangeAccent : _angleStatusColor(angle);

    return Scaffold(
      appBar: AppBar(title: Text(loc.riggingToolAngleFactorTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          RiggingResultCard(
            title: loc.riggingInputsTitle,
            icon: Icons.tune,
            children: [
              _numberField(
                controller: _angleController,
                label: loc.riggingAngleFromHorizontalLabel,
                suffix: loc.riggingUnitDegrees,
              ),
              const SizedBox(height: 12),
              _numberField(
                controller: _weightController,
                label: loc.riggingLoadWeightLabel,
                suffix: loc.riggingUnitKg,
              ),
            ],
          ),
          const SizedBox(height: 14),
          RiggingResultCard(
            title: loc.riggingResultsTitle,
            icon: Icons.fact_check_outlined,
            children: [
              if (factor == null)
                Text(
                  loc.riggingInvalidAngle,
                  style: const TextStyle(color: Colors.orangeAccent),
                )
              else ...[
                RiggingStatusBanner(
                  label: _statusLabel(loc, angle!),
                  description: _statusDescription(loc, angle),
                  color: color,
                  icon: angle >= 30
                      ? Icons.check_circle_outline
                      : Icons.warning_amber_rounded,
                ),
                const SizedBox(height: 12),
                RiggingValueRow(
                  label: loc.riggingAngleFactorLabel,
                  value: _formatNumber(factor, decimals: 3),
                  color: color,
                ),
                RiggingValueRow(
                  label: loc.riggingTensionPerLegLabel,
                  value:
                      '${_formatNumber(tension!, decimals: 1)} ${loc.riggingUnitKg}',
                  color: color,
                ),
                const SizedBox(height: 10),
                Text(
                  loc.riggingAngleFactorExplanation,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.62),
                    height: 1.25,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
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

  String _statusLabel(AppLocalizations loc, double angle) {
    if (angle >= 45) {
      return loc.riggingStatusOk;
    }
    if (angle >= 30) {
      return loc.riggingStatusWatch;
    }
    if (angle >= 15) {
      return loc.riggingStatusHigh;
    }
    return loc.riggingStatusDanger;
  }

  String _statusDescription(AppLocalizations loc, double angle) {
    if (angle >= 45) {
      return loc.riggingStatusOkDescription;
    }
    if (angle >= 30) {
      return loc.riggingStatusWatchDescription;
    }
    if (angle >= 15) {
      return loc.riggingStatusHighDescription;
    }
    return loc.riggingStatusDangerDescription;
  }

  double _radians(double degrees) => degrees * math.pi / 180;
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
