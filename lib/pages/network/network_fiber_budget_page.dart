import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../about/about_favorites.dart';

const _kAccent = Color(0xFF00E5FF);

final _numFmt = TextInputFormatter.withFunction((oldValue, newValue) {
  final text = newValue.text;
  if (text.isEmpty) return newValue;
  if (!RegExp(r'^[0-9.,]+$').hasMatch(text)) return oldValue;
  final seps = '.'.allMatches(text).length + ','.allMatches(text).length;
  if (seps > 1) return oldValue;
  return newValue;
});

class _FiberPreset {
  final String label;
  final double dbPerKm;
  const _FiberPreset(this.label, this.dbPerKm);
}

const _fiberPresets = [
  _FiberPreset('OM3 / OM4 (850 nm)', 3.0),
  _FiberPreset('OM1 / OM2 (850 nm)', 3.5),
  _FiberPreset('OS2 (1310 nm)', 0.4),
  _FiberPreset('OS2 (1550 nm)', 0.3),
];

class NetworkFiberBudgetPage extends StatefulWidget {
  const NetworkFiberBudgetPage({super.key});

  @override
  State<NetworkFiberBudgetPage> createState() =>
      _NetworkFiberBudgetPageState();
}

class _NetworkFiberBudgetPageState extends State<NetworkFiberBudgetPage> {
  int _presetIndex = 0;
  final _attenuationCtrl = TextEditingController(text: '3.0');
  final _distanceCtrl = TextEditingController(text: '100');
  final _additionalLossCtrl = TextEditingController(text: '1.0');
  final _budgetCtrl = TextEditingController();

  @override
  void dispose() {
    _attenuationCtrl.dispose();
    _distanceCtrl.dispose();
    _additionalLossCtrl.dispose();
    _budgetCtrl.dispose();
    super.dispose();
  }

  double? _p(TextEditingController c) =>
      double.tryParse(c.text.replaceAll(',', '.').trim());

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    final attenuation = _p(_attenuationCtrl) ?? 0;
    final distanceM = _p(_distanceCtrl) ?? 0;
    final distanceKm = distanceM / 1000.0;
    final additionalLoss = _p(_additionalLossCtrl) ?? 0;
    final total = attenuation * distanceKm + additionalLoss;
    final budget = _p(_budgetCtrl);
    final margin = budget == null ? null : budget - total;
    final over = margin != null && margin < 0;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.networkFiberTitle,
            style: const TextStyle(
                fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: const [
          AboutPinButton(pageId: 'tool:network_fiber_budget', sectionId: 'main'),
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
            // ── Type de fibre ────────────────────────────────────────────────
            _Card(
              icon: Icons.cable_rounded,
              title: loc.networkFiberTypeLabel,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(_fiberPresets.length, (i) {
                  final preset = _fiberPresets[i];
                  final sel = _presetIndex == i;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _presetIndex = i;
                        _attenuationCtrl.text = preset.dbPerKm.toStringAsFixed(2);
                      });
                    },
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
                        preset.label,
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
            ),
            const SizedBox(height: 14),

            // ── Atténuation & distance ──────────────────────────────────────
            _Card(
              icon: Icons.timeline_rounded,
              title: loc.networkFiberAttenuationLabel,
              child: _NumField(
                controller: _attenuationCtrl,
                label: loc.networkFiberAttenuationLabel,
                hint: '3.0',
                unit: 'dB/km',
                onChanged: (_) => setState(() {}),
              ),
            ),
            const SizedBox(height: 14),
            _Card(
              icon: Icons.straighten_rounded,
              title: loc.networkFiberDistanceLabel,
              child: _NumField(
                controller: _distanceCtrl,
                label: loc.networkFiberDistanceLabel,
                hint: '100',
                unit: 'm',
                onChanged: (_) => setState(() {}),
              ),
            ),
            const SizedBox(height: 14),
            _Card(
              icon: Icons.settings_ethernet_rounded,
              title: loc.networkFiberAdditionalLossLabel,
              child: _NumField(
                controller: _additionalLossCtrl,
                label: loc.networkFiberAdditionalLossLabel,
                hint: '1.0',
                unit: 'dB',
                onChanged: (_) => setState(() {}),
              ),
            ),
            const SizedBox(height: 14),
            _Card(
              icon: Icons.speed_rounded,
              title: loc.networkFiberBudgetLabel,
              child: _NumField(
                controller: _budgetCtrl,
                label: loc.networkFiberBudgetLabel,
                hint: 'ex. 10',
                unit: 'dB',
                onChanged: (_) => setState(() {}),
              ),
            ),
            const SizedBox(height: 14),

            // ── Résultat ─────────────────────────────────────────────────────
            _Card(
              icon: Icons.calculate_outlined,
              title: loc.networkFiberTotalTitle,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                    decoration: BoxDecoration(
                      color: (over ? Colors.redAccent : _kAccent)
                          .withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                          color: (over ? Colors.redAccent : _kAccent)
                              .withValues(alpha: 0.35),
                          width: 1.5),
                    ),
                    child: Text(
                      '-${total.toStringAsFixed(2)} dB',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: over ? Colors.redAccent : _kAccent,
                      ),
                    ),
                  ),
                  if (margin != null) ...[
                    const SizedBox(height: 10),
                    _BreakdownRow(
                      label: loc.networkFiberMarginLabel,
                      value: '${margin.toStringAsFixed(2)} dB',
                      valueColor: over ? Colors.redAccent : Colors.greenAccent,
                    ),
                  ],
                  if (over) ...[
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Colors.redAccent.withValues(alpha: 0.35)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.warning_amber_rounded,
                              color: Colors.redAccent, size: 18),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              loc.networkFiberWarningOver,
                              style: TextStyle(
                                  fontSize: 12.5,
                                  color:
                                      Colors.redAccent.withValues(alpha: 0.90)),
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
              loc.networkFiberFormulaNote,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'monospace',
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

class _BreakdownRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  const _BreakdownRow({required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(label,
                style: TextStyle(
                    fontSize: 12.5, color: Colors.white.withValues(alpha: 0.55))),
          ),
          Text(value,
              style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 12.5,
                  fontWeight: FontWeight.w700,
                  color: valueColor ?? Colors.white.withValues(alpha: 0.80))),
        ],
      ),
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
