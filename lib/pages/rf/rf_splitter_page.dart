import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../about/about_favorites.dart';

const _kAccent = Color(0xFF9C27B0);

const _kWaysPresets = [2, 3, 4, 6, 8];
const _kReferenceWays = [2, 3, 4, 6, 8, 16];

final _numFmt = TextInputFormatter.withFunction((oldValue, newValue) {
  final text = newValue.text;
  if (text.isEmpty) return newValue;
  if (!RegExp(r'^[0-9.,]+$').hasMatch(text)) return oldValue;
  final seps = '.'.allMatches(text).length + ','.allMatches(text).length;
  if (seps > 1) return oldValue;
  return newValue;
});

class RfSplitterPage extends StatefulWidget {
  const RfSplitterPage({super.key});

  @override
  State<RfSplitterPage> createState() => _RfSplitterPageState();
}

class _RfSplitterPageState extends State<RfSplitterPage> {
  int _ways = 4;
  final _excessCtrl = TextEditingController(text: '1.0');
  final _additionalCtrl = TextEditingController(text: '0.5');

  @override
  void dispose() {
    _excessCtrl.dispose();
    _additionalCtrl.dispose();
    super.dispose();
  }

  double? _p(TextEditingController c) =>
      double.tryParse(c.text.replaceAll(',', '.').trim());

  double _theoreticalLoss(int ways) => 10 * math.log(ways) / math.ln10;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    final theoretical = _theoreticalLoss(_ways);
    final excess = _p(_excessCtrl) ?? 0;
    final additional = _p(_additionalCtrl) ?? 0;
    final total = theoretical + excess + additional;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.rfSplitterTitle,
            style: const TextStyle(
                fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: const [
          AboutPinButton(pageId: 'tool:rf_splitter', sectionId: 'main'),
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
            // ── Nombre de voies ──────────────────────────────────────────────
            _Card(
              icon: Icons.call_split_rounded,
              title: loc.rfSplitterWaysLabel,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _kWaysPresets.map((n) {
                  final sel = _ways == n;
                  return GestureDetector(
                    onTap: () => setState(() => _ways = n),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 140),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 9),
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
                        '$n',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: sel ? _kAccent : Colors.white60,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 14),

            // ── Pertes ───────────────────────────────────────────────────────
            _Card(
              icon: Icons.tune_rounded,
              title: loc.rfSplitterExcessLossLabel,
              child: _NumField(
                controller: _excessCtrl,
                label: loc.rfSplitterExcessLossLabel,
                hint: '1.0',
                unit: 'dB',
                onChanged: (_) => setState(() {}),
              ),
            ),
            const SizedBox(height: 14),
            _Card(
              icon: Icons.cable_rounded,
              title: loc.rfSplitterAdditionalLossLabel,
              child: _NumField(
                controller: _additionalCtrl,
                label: loc.rfSplitterAdditionalLossLabel,
                hint: '0.5',
                unit: 'dB',
                onChanged: (_) => setState(() {}),
              ),
            ),
            const SizedBox(height: 14),

            // ── Résultat ─────────────────────────────────────────────────────
            _Card(
              icon: Icons.calculate_outlined,
              title: loc.rfSplitterTotalTitle,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                    decoration: BoxDecoration(
                      color: _kAccent.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                          color: _kAccent.withValues(alpha: 0.35), width: 1.5),
                    ),
                    child: Text(
                      '-${total.toStringAsFixed(1)} dB',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: _kAccent,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _BreakdownRow(
                    label: loc.rfSplitterTheoreticalLabel,
                    value: '-${theoretical.toStringAsFixed(2)} dB',
                  ),
                  _BreakdownRow(
                    label: loc.rfSplitterExcessLossLabel,
                    value: '-${excess.toStringAsFixed(2)} dB',
                  ),
                  _BreakdownRow(
                    label: loc.rfSplitterAdditionalLossLabel,
                    value: '-${additional.toStringAsFixed(2)} dB',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Repères ──────────────────────────────────────────────────────
            _Card(
              icon: Icons.bookmark_border_rounded,
              title: loc.rfSplitterReferenceTitle,
              child: Column(
                children: _kReferenceWays.map((n) {
                  final loss = _theoreticalLoss(n);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0E0E18),
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.white.withValues(alpha: 0.07)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text('$n-way',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white.withValues(alpha: 0.70))),
                          ),
                          Text(
                            '-${loss.toStringAsFixed(2)} dB',
                            style: TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: _kAccent.withValues(alpha: 0.85),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              loc.rfSplitterFormulaNote,
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
  const _BreakdownRow({required this.label, required this.value});

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
                  color: Colors.white.withValues(alpha: 0.80))),
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
