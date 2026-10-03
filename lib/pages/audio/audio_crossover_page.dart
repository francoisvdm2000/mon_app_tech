import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../about/about_favorites.dart';
import '../shared/result_reveal.dart';

const _kAccent = Color(0xFF00E5FF);

final _numFmt = TextInputFormatter.withFunction((oldValue, newValue) {
  final text = newValue.text;
  if (text.isEmpty) return newValue;
  if (!RegExp(r'^[0-9.,]+$').hasMatch(text)) return oldValue;
  final seps = '.'.allMatches(text).length + ','.allMatches(text).length;
  if (seps > 1) return oldValue;
  return newValue;
});

class AudioCrossoverPage extends StatefulWidget {
  const AudioCrossoverPage({super.key});

  @override
  State<AudioCrossoverPage> createState() => _AudioCrossoverPageState();
}

class _AudioCrossoverPageState extends State<AudioCrossoverPage> {
  final _freqCtrl = TextEditingController(text: '100');
  final _impedanceCtrl = TextEditingController(text: '8');

  @override
  void dispose() {
    _freqCtrl.dispose();
    _impedanceCtrl.dispose();
    super.dispose();
  }

  double? _p(TextEditingController c) =>
      double.tryParse(c.text.replaceAll(',', '.').trim());

  String _fmt(double v) {
    if (v >= 100) return v.toStringAsFixed(0);
    if (v >= 10) return v.toStringAsFixed(1);
    return v.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    final freq = _p(_freqCtrl);
    final impedance = _p(_impedanceCtrl);

    double? capacitorUf;
    double? inductorMh;
    if (freq != null && freq > 0 && impedance != null && impedance > 0) {
      capacitorUf = 1e6 / (2 * math.pi * freq * impedance);
      inductorMh = 1000 * impedance / (2 * math.pi * freq);
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.audioCrossoverTitle,
            style: const TextStyle(
                fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: const [
          AboutPinButton(pageId: 'tool:audio_crossover', sectionId: 'main'),
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
            // ── Entrées ──────────────────────────────────────────────────────
            _Card(
              icon: Icons.graphic_eq_rounded,
              title: loc.audioCrossoverFreqLabel,
              child: _NumField(
                controller: _freqCtrl,
                label: loc.audioCrossoverFreqLabel,
                hint: '100',
                unit: 'Hz',
                onChanged: (_) => setState(() {}),
              ),
            ),
            const SizedBox(height: 14),
            _Card(
              icon: Icons.speaker_rounded,
              title: loc.audioCrossoverImpedanceLabel,
              child: _NumField(
                controller: _impedanceCtrl,
                label: loc.audioCrossoverImpedanceLabel,
                hint: '8',
                unit: 'Ω',
                onChanged: (_) => setState(() {}),
              ),
            ),
            const SizedBox(height: 14),

            // ── Résultats ─────────────────────────────────────────────────────
            _Card(
              icon: Icons.calculate_outlined,
              title: loc.audioCrossoverOrderNote,
              child: ResultReveal(
                show: capacitorUf != null && inductorMh != null,
                child: (capacitorUf == null || inductorMh == null)
                    ? _EmptyState(message: loc.audioCrossoverOrderNote)
                    : Column(
                        children: [
                          _ComponentResult(
                            label: loc.audioCrossoverCapacitorLabel,
                            value: '${_fmt(capacitorUf)} µF',
                          ),
                          const SizedBox(height: 8),
                          _ComponentResult(
                            label: loc.audioCrossoverInductorLabel,
                            value: '${_fmt(inductorMh)} mH',
                          ),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 14),

            // ── Repères ──────────────────────────────────────────────────────
            _Card(
              icon: Icons.bookmark_border_rounded,
              title: loc.audioCrossoverReferenceTitle,
              child: Column(
                children: [
                  _RefRow(label: loc.audioCrossoverRefSubTop, value: '80–120 Hz'),
                  _RefRow(label: loc.audioCrossoverRef2Way, value: '1.5–3 kHz'),
                  _RefRow(
                      label: loc.audioCrossoverRef3WayLow, value: '300–500 Hz'),
                  _RefRow(
                      label: loc.audioCrossoverRef3WayHigh, value: '2–4 kHz'),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Text(
              loc.audioCrossoverFormulaNote,
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

class _ComponentResult extends StatelessWidget {
  final String label;
  final String value;
  const _ComponentResult({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: _kAccent.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _kAccent.withValues(alpha: 0.35)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(label,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.white.withValues(alpha: 0.80))),
          ),
          Text(value,
              style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  color: _kAccent)),
        ],
      ),
    );
  }
}

class _RefRow extends StatelessWidget {
  final String label;
  final String value;
  const _RefRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF0E0E18),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(label,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withValues(alpha: 0.70))),
            ),
            Text(value,
                style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: _kAccent.withValues(alpha: 0.85))),
          ],
        ),
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
