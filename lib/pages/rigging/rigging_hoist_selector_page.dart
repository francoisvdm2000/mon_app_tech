import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../l10n_gen/app_localizations.dart';
import 'widgets/rigging_result_card.dart';
import '../about/about_favorites.dart';

/// Tailles standard de palans à chaîne commercialisés (kg) — repères
/// indicatifs (0,125 à 10 t) ; la disponibilité réelle dépend du fabricant
/// et du loueur (voir [riggingHoistAvailabilityNote]).
const List<double> _kStandardHoistSizesKg = [
  125, 250, 500, 1000, 2000, 3000, 5000, 10000,
];

class RiggingHoistSelectorPage extends StatefulWidget {
  const RiggingHoistSelectorPage({super.key});

  @override
  State<RiggingHoistSelectorPage> createState() =>
      _RiggingHoistSelectorPageState();
}

class _RiggingHoistSelectorPageState extends State<RiggingHoistSelectorPage> {
  final _loadController = TextEditingController(text: '400');
  final _safetyFactorController = TextEditingController(text: '1.25');

  @override
  void dispose() {
    _loadController.dispose();
    _safetyFactorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    final load = _parseNumber(_loadController.text);
    final safetyFactor = (_parseNumber(_safetyFactorController.text) ?? 1).clamp(1.0, 5.0);
    final requiredLoad = load == null ? null : load * safetyFactor;

    double? recommended;
    if (requiredLoad != null) {
      for (final size in _kStandardHoistSizesKg) {
        if (size >= requiredLoad) {
          recommended = size;
          break;
        }
      }
    }

    final percent = requiredLoad == null || recommended == null
        ? null
        : (requiredLoad / recommended) * 100;
    final margin = requiredLoad == null || recommended == null
        ? null
        : recommended - requiredLoad;

    final overMax = requiredLoad != null && recommended == null;
    final color = requiredLoad == null
        ? Colors.orangeAccent
        : overMax
            ? Colors.redAccent
            : Colors.greenAccent;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.riggingToolHoistTitle),
        actions: const [
          AboutPinButton(pageId: 'tool:rigging_hoist_selector', sectionId: 'main'),
          SizedBox(width: 4),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          RiggingResultCard(
            title: loc.riggingInputsTitle,
            icon: Icons.tune,
            children: [
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
              if (requiredLoad == null)
                Text(
                  loc.riggingInvalidInputsMessage,
                  style: const TextStyle(color: Colors.orangeAccent),
                )
              else ...[
                RiggingStatusBanner(
                  label: overMax
                      ? loc.riggingStatusDanger
                      : loc.riggingHoistRecommendedLabel,
                  description: _recommendationText(loc, recommended, overMax),
                  color: color,
                  icon: overMax
                      ? Icons.warning_amber_rounded
                      : Icons.check_circle_outline,
                ),
                const SizedBox(height: 12),
                RiggingValueRow(
                  label: loc.riggingRequiredLoadLabel,
                  value:
                      '${_formatNumber(requiredLoad, decimals: 1)} ${loc.riggingUnitKg}',
                  color: color,
                ),
                if (percent != null && margin != null) ...[
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
                ],
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
                    color: Colors.white.withValues(alpha: 0.35), size: 15),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    loc.riggingHoistAvailabilityNote,
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
    );
  }

  String _recommendationText(
      AppLocalizations loc, double? recommended, bool overMax) {
    if (overMax || recommended == null) {
      return loc.riggingHoistOverMaxLabel;
    }
    final tonnes = recommended / 1000;
    final tonnesStr = tonnes.toStringAsFixed(tonnes >= 1 ? 1 : 3);
    return '${recommended.toStringAsFixed(0)} ${loc.riggingUnitKg} ($tonnesStr t)';
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
