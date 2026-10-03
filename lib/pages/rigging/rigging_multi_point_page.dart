import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../l10n_gen/app_localizations.dart';
import 'widgets/rigging_result_card.dart';
import '../about/about_favorites.dart';

/// Tension par brin pour un bridage SYMÉTRIQUE à N points (brins de même
/// longueur, charge centrée, tension répartie également) — généralisation
/// de la page "facteur d'angle" (2 brins) à 2-8 brins.
///
/// Volontairement limité au cas symétrique : un bridage asymétrique ou une
/// géométrie complexe est statiquement indéterminé pour un rigging rigide
/// à plus de 2-3 points et nécessite un rigger qualifié ou un logiciel
/// certifié — voir [riggingMultiPointSymmetricNote].
class RiggingMultiPointPage extends StatefulWidget {
  const RiggingMultiPointPage({super.key});

  @override
  State<RiggingMultiPointPage> createState() => _RiggingMultiPointPageState();
}

class _RiggingMultiPointPageState extends State<RiggingMultiPointPage> {
  final _angleController = TextEditingController(text: '60');
  final _weightController = TextEditingController(text: '200');
  final _wllPerLegController = TextEditingController(text: '500');

  int _legCount = 4;

  static const List<int> _legOptions = [2, 3, 4, 5, 6, 8];

  @override
  void dispose() {
    _angleController.dispose();
    _weightController.dispose();
    _wllPerLegController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final angle = _parseNumber(_angleController.text);
    final weight = _parseNumber(_weightController.text) ?? 0;
    final wllPerLeg = _parseNumber(_wllPerLegController.text);

    final factor = angle == null || angle <= 0 || angle >= 90
        ? null
        : 1 / (_legCount * math.sin(_radians(angle)));
    final tensionPerLeg = factor == null ? null : weight * factor;
    final percent = tensionPerLeg == null || wllPerLeg == null || wllPerLeg <= 0
        ? null
        : (tensionPerLeg / wllPerLeg) * 100;
    final margin = tensionPerLeg == null || wllPerLeg == null
        ? null
        : wllPerLeg - tensionPerLeg;

    final angleColor = angle == null ? Colors.orangeAccent : _angleStatusColor(angle);
    final wllOk = percent != null && percent <= 100;
    final wllWarning = percent != null && percent > 80 && percent <= 100;
    final wllColor = percent == null
        ? Colors.orangeAccent
        : wllOk
            ? (wllWarning ? Colors.orangeAccent : Colors.greenAccent)
            : Colors.redAccent;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.riggingToolMultiPointTitle),
        actions: const [
          AboutPinButton(pageId: 'tool:rigging_multi_point', sectionId: 'main'),
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
              Text(
                loc.riggingLegCountLabel,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.72),
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _legOptions.map((n) {
                  final selected = _legCount == n;
                  return GestureDetector(
                    onTap: () => setState(() => _legCount = n),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 140),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: selected
                            ? Colors.amber.withValues(alpha: 0.16)
                            : const Color(0xFF141418),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selected ? Colors.amber : Colors.white24,
                          width: selected ? 1.5 : 1,
                        ),
                      ),
                      child: Text(
                        '$n',
                        style: TextStyle(
                          color: selected ? Colors.amber : Colors.white54,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 12),
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
              const SizedBox(height: 12),
              _numberField(
                controller: _wllPerLegController,
                label: loc.riggingWllPerLegLabel,
                suffix: loc.riggingUnitKg,
              ),
            ],
          ),
          const SizedBox(height: 14),
          RiggingResultCard(
            title: loc.riggingResultsTitle,
            icon: Icons.fact_check_outlined,
            children: [
              if (factor == null || tensionPerLeg == null)
                Text(
                  loc.riggingInvalidAngle,
                  style: const TextStyle(color: Colors.orangeAccent),
                )
              else ...[
                RiggingStatusBanner(
                  label: percent == null
                      ? _angleStatusLabel(loc, angle!)
                      : (wllOk
                          ? (wllWarning ? loc.riggingStatusWatch : loc.riggingStatusOk)
                          : loc.riggingStatusDanger),
                  description: percent == null
                      ? _angleStatusDescription(loc, angle!)
                      : (wllOk
                          ? (wllWarning
                              ? loc.riggingWllStatusWatchDescription
                              : loc.riggingWllStatusOkDescription)
                          : loc.riggingWllStatusDangerDescription),
                  color: percent == null ? angleColor : wllColor,
                  icon: (percent == null ? angle! >= 30 : wllOk)
                      ? Icons.check_circle_outline
                      : Icons.warning_amber_rounded,
                ),
                const SizedBox(height: 12),
                RiggingValueRow(
                  label: loc.riggingAngleFactorLabel,
                  value: _formatNumber(factor, decimals: 3),
                  color: angleColor,
                ),
                RiggingValueRow(
                  label: loc.riggingTensionPerLegLabel,
                  value:
                      '${_formatNumber(tensionPerLeg, decimals: 1)} ${loc.riggingUnitKg}',
                  color: angleColor,
                ),
                if (percent != null && margin != null) ...[
                  RiggingValueRow(
                    label: loc.riggingWllUsageLabel,
                    value: '${_formatNumber(percent, decimals: 1)} %',
                    color: wllColor,
                  ),
                  RiggingValueRow(
                    label: loc.riggingMarginLabel,
                    value:
                        '${_formatNumber(margin, decimals: 1)} ${loc.riggingUnitKg}',
                    color: wllColor,
                  ),
                ],
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
                    loc.riggingMultiPointSymmetricNote,
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

  String _angleStatusLabel(AppLocalizations loc, double angle) {
    if (angle >= 45) return loc.riggingStatusOk;
    if (angle >= 30) return loc.riggingStatusWatch;
    if (angle >= 15) return loc.riggingStatusHigh;
    return loc.riggingStatusDanger;
  }

  String _angleStatusDescription(AppLocalizations loc, double angle) {
    if (angle >= 45) return loc.riggingStatusOkDescription;
    if (angle >= 30) return loc.riggingStatusWatchDescription;
    if (angle >= 15) return loc.riggingStatusHighDescription;
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
  if (angleFromHorizontal >= 45) return Colors.greenAccent;
  if (angleFromHorizontal >= 30) return Colors.lightBlueAccent;
  if (angleFromHorizontal >= 15) return Colors.orangeAccent;
  return Colors.redAccent;
}
