import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../l10n_gen/app_localizations.dart';
import 'widgets/rigging_result_card.dart';

class RiggingWllCheckPage extends StatefulWidget {
  const RiggingWllCheckPage({super.key});

  @override
  State<RiggingWllCheckPage> createState() => _RiggingWllCheckPageState();
}

class _RiggingWllCheckPageState extends State<RiggingWllCheckPage> {
  final _wllController = TextEditingController(text: '250');
  final _loadController = TextEditingController(text: '100');
  final _safetyFactorController = TextEditingController(text: '1');

  @override
  void dispose() {
    _wllController.dispose();
    _loadController.dispose();
    _safetyFactorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    final wll = _parseNumber(_wllController.text);
    final load = _parseNumber(_loadController.text);
    final safetyFactor = _parseNumber(_safetyFactorController.text) ?? 1;

    final requiredLoad = load == null ? null : load * safetyFactor;
    final percent = wll == null || requiredLoad == null || wll <= 0
        ? null
        : (requiredLoad / wll) * 100;
    final margin =
        wll == null || requiredLoad == null ? null : wll - requiredLoad;

    final ok = percent != null && percent <= 100;
    final warning = percent != null && percent > 80 && percent <= 100;
    final color = percent == null
        ? Colors.orangeAccent
        : ok
            ? warning
                ? Colors.orangeAccent
                : Colors.greenAccent
            : Colors.redAccent;

    return Scaffold(
      appBar: AppBar(title: Text(loc.riggingToolWllTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          RiggingResultCard(
            title: loc.riggingInputsTitle,
            icon: Icons.tune,
            children: [
              _numberField(
                controller: _wllController,
                label: loc.riggingWllLabel,
                suffix: loc.riggingUnitKg,
              ),
              const SizedBox(height: 12),
              _numberField(
                controller: _loadController,
                label: loc.riggingAppliedLoadLabel,
                suffix: loc.riggingUnitKg,
              ),
              const SizedBox(height: 12),
              _numberField(
                controller: _safetyFactorController,
                label: loc.riggingSafetyFactorLabel,
                suffix: '×',
              ),
            ],
          ),
          const SizedBox(height: 14),
          RiggingResultCard(
            title: loc.riggingResultsTitle,
            icon: Icons.fact_check_outlined,
            children: [
              if (percent == null || margin == null || requiredLoad == null)
                Text(
                  loc.riggingInvalidInputsMessage,
                  style: const TextStyle(color: Colors.orangeAccent),
                )
              else ...[
                RiggingStatusBanner(
                  label: ok
                      ? warning
                          ? loc.riggingStatusWatch
                          : loc.riggingStatusOk
                      : loc.riggingStatusDanger,
                  description: ok
                      ? warning
                          ? loc.riggingWllStatusWatchDescription
                          : loc.riggingWllStatusOkDescription
                      : loc.riggingWllStatusDangerDescription,
                  color: color,
                  icon: ok
                      ? Icons.check_circle_outline
                      : Icons.warning_amber_rounded,
                ),
                const SizedBox(height: 12),
                RiggingValueRow(
                  label: loc.riggingRequiredLoadLabel,
                  value:
                      '${_formatNumber(requiredLoad, decimals: 1)} ${loc.riggingUnitKg}',
                  color: color,
                ),
                RiggingValueRow(
                  label: loc.riggingWllUsageLabel,
                  value: '${_formatNumber(percent, decimals: 1)} %',
                  color: color,
                ),
                RiggingValueRow(
                  label: loc.riggingMarginLabel,
                  value:
                      '${_formatNumber(margin, decimals: 1)} ${loc.riggingUnitKg}',
                  color: color,
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
}

double? _parseNumber(String value) {
  return double.tryParse(value.trim().replaceAll(',', '.'));
}

String _formatNumber(double value, {int decimals = 2}) {
  return value.toStringAsFixed(decimals);
}
