import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../about/about_favorites.dart';

const _kAccent = Color(0xFF9C27B0);

// Tolérance pour détecter un conflit IM3 (MHz) — cohérent avec rf_im3_page.dart
const _kTolerance = 0.200;
// Pas de la grille de recherche (MHz) — granularité de syntonisation typique
const _kGridStep = 0.025;
const _kMaxChannels = 24;
// Garde-fou : nombre max de points de grille évalués, pour rester rapide
// même avec une bande personnalisée très large (évite tout gel de l'UI).
const _kMaxGridIterations = 8000;

final _numFmt = TextInputFormatter.withFunction((oldValue, newValue) {
  final text = newValue.text;
  if (text.isEmpty) return newValue;
  if (!RegExp(r'^[0-9.,]+$').hasMatch(text)) return oldValue;
  final seps = '.'.allMatches(text).length + ','.allMatches(text).length;
  if (seps > 1) return oldValue;
  return newValue;
});

class _BandPreset {
  final String Function(AppLocalizations) labelBuilder;
  final double? min;
  final double? max;
  const _BandPreset(this.labelBuilder, this.min, this.max);
}

final _bandPresets = <_BandPreset>[
  _BandPreset((loc) => loc.rfUhfBand2Name, 470, 694),
  _BandPreset((loc) => loc.rfUhfBand3Name, 694, 790),
  _BandPreset((loc) => loc.rfUhfBand4Name, 863, 865),
  _BandPreset((loc) => loc.rfPlannerCustomBand, null, null),
];

/// Recherche gloutonne de fréquences dans [min, max] espacées d'au moins
/// [minSpacing] MHz et sans produit d'intermodulation du 3e ordre
/// (2fA−fB, fA+fB−fC) entre elles, à ±[_kTolerance] MHz près.
List<double> _planFrequencies({
  required double min,
  required double max,
  required int count,
  required double minSpacing,
}) {
  final selected = <double>[];
  if (min >= max || count <= 0) return selected;

  bool causesConflict(double candidate) {
    // Espacement minimum simple.
    for (final s in selected) {
      if ((candidate - s).abs() < minSpacing) return true;
    }
    // Produits d'intermodulation du 3e ordre impliquant le candidat.
    final all = [...selected, candidate];
    bool nearAny(double product) {
      for (final f in all) {
        if ((product - f).abs() < _kTolerance) return true;
      }
      return false;
    }

    for (var i = 0; i < all.length; i++) {
      for (var j = 0; j < all.length; j++) {
        if (i == j) continue;
        // 2fi - fj
        final p1 = 2 * all[i] - all[j];
        if (p1 != all[i] && p1 != all[j] && nearAny(p1)) return true;
        for (var k = 0; k < all.length; k++) {
          if (k == i || k == j) continue;
          final p2 = all[i] + all[j] - all[k];
          if (p2 != all[i] && p2 != all[j] && p2 != all[k] && nearAny(p2)) {
            return true;
          }
        }
      }
    }
    return false;
  }

  var f = min;
  var iterations = 0;
  while (f <= max &&
      selected.length < count &&
      iterations < _kMaxGridIterations) {
    iterations++;
    if (!causesConflict(f)) {
      selected.add(f);
      f += minSpacing;
    } else {
      f += _kGridStep;
    }
  }
  return selected;
}

class RfPlannerPage extends StatefulWidget {
  const RfPlannerPage({super.key});

  @override
  State<RfPlannerPage> createState() => _RfPlannerPageState();
}

class _RfPlannerPageState extends State<RfPlannerPage> {
  int _bandIndex = 0;
  final _minCtrl = TextEditingController(text: '470');
  final _maxCtrl = TextEditingController(text: '694');
  final _countCtrl = TextEditingController(text: '8');
  final _spacingCtrl = TextEditingController(text: '0.3');

  @override
  void dispose() {
    _minCtrl.dispose();
    _maxCtrl.dispose();
    _countCtrl.dispose();
    _spacingCtrl.dispose();
    super.dispose();
  }

  double? _p(TextEditingController c) =>
      double.tryParse(c.text.replaceAll(',', '.').trim());

  void _selectBand(int i) {
    setState(() {
      _bandIndex = i;
      final preset = _bandPresets[i];
      if (preset.min != null && preset.max != null) {
        _minCtrl.text = preset.min!.toStringAsFixed(0);
        _maxCtrl.text = preset.max!.toStringAsFixed(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    final min = _p(_minCtrl);
    final max = _p(_maxCtrl);
    final requestedCount =
        (int.tryParse(_countCtrl.text.trim()) ?? 0).clamp(0, _kMaxChannels);
    final spacing = _p(_spacingCtrl) ?? 0.3;

    List<double> results = [];
    if (min != null && max != null && min < max && requestedCount > 0) {
      results = _planFrequencies(
        min: min,
        max: max,
        count: requestedCount,
        minSpacing: spacing <= 0 ? 0.1 : spacing,
      );
    }
    final isCustom = _bandIndex == _bandPresets.length - 1;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.rfPlannerTitle,
            style: const TextStyle(
                fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: const [
          AboutPinButton(pageId: 'tool:rf_planner', sectionId: 'main'),
          SizedBox(width: 4),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      body: SafeArea(
        bottom: true,
        child: ListView(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 24 + bottom),
          children: [
            // ── Bande ────────────────────────────────────────────────────────
            _Card(
              icon: Icons.settings_input_antenna_rounded,
              title: loc.rfPlannerBandLabel,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(_bandPresets.length, (i) {
                      final preset = _bandPresets[i];
                      final sel = _bandIndex == i;
                      return GestureDetector(
                        onTap: () => _selectBand(i),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 140),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 9),
                          decoration: BoxDecoration(
                            color: sel
                                ? _kAccent.withValues(alpha: 0.16)
                                : const Color(0xFF0E0E18),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: sel
                                  ? _kAccent
                                  : Colors.white.withValues(alpha: 0.12),
                              width: sel ? 1.5 : 1,
                            ),
                          ),
                          child: Text(
                            preset.labelBuilder(loc),
                            style: TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w700,
                              color: sel ? _kAccent : Colors.white60,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  if (isCustom) ...[
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _NumField(
                            controller: _minCtrl,
                            label: loc.rfPlannerMinFreqLabel,
                            hint: '470',
                            unit: 'MHz',
                            onChanged: (_) => setState(() {}),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _NumField(
                            controller: _maxCtrl,
                            label: loc.rfPlannerMaxFreqLabel,
                            hint: '694',
                            unit: 'MHz',
                            onChanged: (_) => setState(() {}),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Paramètres ───────────────────────────────────────────────────
            _Card(
              icon: Icons.tune_rounded,
              title: loc.rfPlannerChannelCountLabel,
              child: TextField(
                controller: _countCtrl,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: const TextStyle(color: Colors.white),
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  labelText: loc.rfPlannerChannelCountLabel,
                  hintText: '8',
                  filled: true,
                  fillColor: const Color(0xFF0E0E18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: Colors.white.withValues(alpha: 0.12)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: Colors.white.withValues(alpha: 0.12)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: _kAccent, width: 1.5),
                  ),
                  labelStyle: TextStyle(color: Colors.white.withValues(alpha: 0.55)),
                ),
              ),
            ),
            const SizedBox(height: 14),
            _Card(
              icon: Icons.social_distance_rounded,
              title: loc.rfPlannerMinSpacingLabel,
              child: _NumField(
                controller: _spacingCtrl,
                label: loc.rfPlannerMinSpacingLabel,
                hint: '0.3',
                unit: 'MHz',
                onChanged: (_) => setState(() {}),
              ),
            ),
            const SizedBox(height: 14),

            // ── Résultats ─────────────────────────────────────────────────────
            _Card(
              icon: Icons.calculate_outlined,
              title: loc.rfPlannerResultTitle,
              child: results.isEmpty
                  ? _EmptyState(message: loc.rfPlannerResultTitle)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _InfoRow(
                          label: loc.rfPlannerFoundLabel,
                          value: '${results.length} / $requestedCount',
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: results
                              .map((f) => Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: _kAccent.withValues(alpha: 0.10),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color:
                                              _kAccent.withValues(alpha: 0.35)),
                                    ),
                                    child: Text(
                                      '${f.toStringAsFixed(3)} MHz',
                                      style: const TextStyle(
                                        fontFamily: 'monospace',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w800,
                                        color: _kAccent,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                        if (results.length < requestedCount) ...[
                          const SizedBox(height: 12),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.amber.withValues(alpha: 0.10),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Colors.amber.withValues(alpha: 0.35)),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.warning_amber_rounded,
                                    color: Colors.amber, size: 18),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    loc.rfPlannerNotEnoughWarning,
                                    style: TextStyle(
                                        fontSize: 12.5,
                                        color: Colors.amber.withValues(alpha: 0.90)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
            ),
            const SizedBox(height: 14),
            Text(
              loc.rfPlannerFormulaNote,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                color: Colors.white.withValues(alpha: 0.28),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(label,
              style: TextStyle(
                  fontSize: 12.5, color: Colors.white.withValues(alpha: 0.55))),
        ),
        Text(value,
            style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: _kAccent)),
      ],
    );
  }
}

// ─── Widgets partagés (locaux à cette page) ────────────────────────────────
class _Card extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;

  const _Card({required this.icon, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(children: [
            Icon(icon, color: Colors.white70, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(title,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.1)),
            ),
          ]),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}

class _NumField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final String unit;
  final ValueChanged<String> onChanged;

  const _NumField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.unit,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [_numFmt],
      style: const TextStyle(color: Colors.white),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        suffixText: unit,
        filled: true,
        fillColor: const Color(0xFF0E0E18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _kAccent, width: 1.5),
        ),
        labelStyle: TextStyle(color: Colors.white.withValues(alpha: 0.55)),
        suffixStyle: TextStyle(color: Colors.white.withValues(alpha: 0.45)),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String message;
  const _EmptyState({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(Icons.info_outline_rounded,
              color: Colors.white.withValues(alpha: 0.30), size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(message,
                style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.40), fontSize: 13)),
          ),
        ],
      ),
    );
  }
}
