import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../about/about_favorites.dart';

const _kAccent = Color(0xFF00E5FF);
const _kMaxSpeakers = 8;
const _kLowImpedanceThreshold = 2.0;

final _numFmt = TextInputFormatter.withFunction((oldValue, newValue) {
  final text = newValue.text;
  if (text.isEmpty) return newValue;
  if (!RegExp(r'^[0-9.,]+$').hasMatch(text)) return oldValue;
  final seps = '.'.allMatches(text).length + ','.allMatches(text).length;
  if (seps > 1) return oldValue;
  return newValue;
});

enum _WiringMode { series, parallel }

class AudioImpedancePage extends StatefulWidget {
  const AudioImpedancePage({super.key});

  @override
  State<AudioImpedancePage> createState() => _AudioImpedancePageState();
}

class _AudioImpedancePageState extends State<AudioImpedancePage> {
  _WiringMode _mode = _WiringMode.parallel;
  final List<TextEditingController> _controllers = [
    TextEditingController(text: '8'),
    TextEditingController(text: '8'),
  ];

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  double? _p(TextEditingController c) =>
      double.tryParse(c.text.replaceAll(',', '.').trim());

  void _addSpeaker() {
    if (_controllers.length >= _kMaxSpeakers) return;
    setState(() {
      _controllers.add(TextEditingController(text: '8'));
    });
  }

  void _removeSpeaker(int index) {
    if (_controllers.length <= 1) return;
    setState(() {
      _controllers.removeAt(index).dispose();
    });
  }

  double? get _total {
    final values = _controllers
        .map(_p)
        .where((v) => v != null && v > 0)
        .cast<double>()
        .toList();
    if (values.isEmpty) return null;
    if (_mode == _WiringMode.series) {
      return values.reduce((a, b) => a + b);
    }
    final sumInverse = values.fold<double>(0, (acc, v) => acc + (1 / v));
    if (sumInverse <= 0) return null;
    return 1 / sumInverse;
  }

  String _fmtOhm(double v) {
    if (v == v.roundToDouble()) return '${v.toStringAsFixed(0)} Ω';
    return '${v.toStringAsFixed(2)} Ω';
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;
    final total = _total;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.audioImpedanceTitle,
            style: const TextStyle(
                fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: const [
          AboutPinButton(pageId: 'tool:audio_impedance', sectionId: 'main'),
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
            // ── Mode de câblage ──────────────────────────────────────────────
            _Card(
              icon: Icons.cable_rounded,
              title: loc.audioImpedanceModeLabel,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _WiringMode.values.map((mode) {
                  final sel = _mode == mode;
                  final label = mode == _WiringMode.series
                      ? loc.audioImpedanceModeSeries
                      : loc.audioImpedanceModeParallel;
                  return GestureDetector(
                    onTap: () => setState(() => _mode = mode),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 140),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 9),
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
                        label,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: sel ? _kAccent : Colors.white60,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 14),

            // ── Enceintes ────────────────────────────────────────────────────
            _Card(
              icon: Icons.speaker_rounded,
              title: loc.audioImpedanceSpeakerLabel,
              child: Column(
                children: [
                  for (var i = 0; i < _controllers.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: _NumField(
                              controller: _controllers[i],
                              label: '${loc.audioImpedanceSpeakerLabel} ${i + 1}',
                              hint: '8',
                              unit: 'Ω',
                              onChanged: (_) => setState(() {}),
                            ),
                          ),
                          if (_controllers.length > 1) ...[
                            const SizedBox(width: 8),
                            IconButton(
                              onPressed: () => _removeSpeaker(i),
                              icon: Icon(Icons.close_rounded,
                                  color: Colors.white.withValues(alpha: 0.45)),
                            ),
                          ],
                        ],
                      ),
                    ),
                  if (_controllers.length < _kMaxSpeakers)
                    OutlinedButton.icon(
                      onPressed: _addSpeaker,
                      icon: const Icon(Icons.add_rounded, size: 18),
                      label: Text(loc.audioImpedanceAddSpeaker),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: _kAccent,
                        side: BorderSide(color: _kAccent.withValues(alpha: 0.45)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Résultat ─────────────────────────────────────────────────────
            _Card(
              icon: Icons.calculate_outlined,
              title: loc.audioImpedanceTotalTitle,
              child: total == null
                  ? _EmptyState(message: loc.audioImpedanceEmptyState)
                  : Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 16),
                          decoration: BoxDecoration(
                            color: _kAccent.withValues(alpha: 0.10),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                                color: _kAccent.withValues(alpha: 0.35),
                                width: 1.5),
                          ),
                          child: Column(
                            children: [
                              Text(
                                _fmtOhm(total),
                                style: const TextStyle(
                                  fontFamily: 'monospace',
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  color: _kAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (total < _kLowImpedanceThreshold) ...[
                          const SizedBox(height: 10),
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
                                    loc.audioImpedanceWarningLow,
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
              loc.audioImpedanceFormulaNote,
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
