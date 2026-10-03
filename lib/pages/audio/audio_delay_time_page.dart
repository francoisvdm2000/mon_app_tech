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

/// Divisions rythmiques standard, exprimées en fraction de noire (1 = noire).
class _NoteDivision {
  final String label;
  final double fraction;
  const _NoteDivision(this.label, this.fraction);
}

const _kDivisions = <_NoteDivision>[
  _NoteDivision('1/1', 4.0),
  _NoteDivision('1/2', 2.0),
  _NoteDivision('1/4', 1.0),
  _NoteDivision('1/8', 0.5),
  _NoteDivision('1/16', 0.25),
  _NoteDivision('1/32', 0.125),
];

class AudioDelayTimePage extends StatefulWidget {
  const AudioDelayTimePage({super.key});

  @override
  State<AudioDelayTimePage> createState() => _AudioDelayTimePageState();
}

class _AudioDelayTimePageState extends State<AudioDelayTimePage> {
  final _bpmCtrl = TextEditingController(text: '120');

  @override
  void dispose() {
    _bpmCtrl.dispose();
    super.dispose();
  }

  double? get _bpm => double.tryParse(_bpmCtrl.text.replaceAll(',', '.').trim());

  String _fmtMs(double ms) {
    if (ms >= 1000) return '${(ms / 1000).toStringAsFixed(2)} s';
    if (ms == ms.roundToDouble()) return '${ms.toStringAsFixed(0)} ms';
    return '${ms.toStringAsFixed(1)} ms';
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;
    final bpm = _bpm;
    final quarterMs = (bpm != null && bpm > 0) ? 60000.0 / bpm : null;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.audioDelayTimeTitle,
            style: const TextStyle(
                fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: const [
          AboutPinButton(pageId: 'tool:audio_delay_time', sectionId: 'main'),
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
            _Card(
              icon: Icons.speed_rounded,
              title: loc.audioDelayTimeBpmLabel,
              child: _NumField(
                controller: _bpmCtrl,
                label: loc.audioDelayTimeBpmLabel,
                hint: '120',
                unit: 'BPM',
                onChanged: (_) => setState(() {}),
              ),
            ),
            const SizedBox(height: 14),
            _Card(
              icon: Icons.calculate_outlined,
              title: loc.audioDelayTimeResultsTitle,
              child: quarterMs == null
                  ? _EmptyState(message: loc.audioDelayTimeEmptyState)
                  : Column(
                      children: [
                        _DivisionHeaderRow(loc: loc),
                        const SizedBox(height: 4),
                        for (final d in _kDivisions)
                          _DivisionRow(
                            label: d.label,
                            normal: _fmtMs(quarterMs * d.fraction),
                            dotted: _fmtMs(quarterMs * d.fraction * 1.5),
                            triplet: _fmtMs(quarterMs * d.fraction * 2 / 3),
                          ),
                      ],
                    ),
            ),
            const SizedBox(height: 14),
            Text(
              loc.audioDelayTimeFormulaNote,
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

class _DivisionHeaderRow extends StatelessWidget {
  final AppLocalizations loc;
  const _DivisionHeaderRow({required this.loc});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w700,
      color: Colors.white.withValues(alpha: 0.40),
      letterSpacing: 0.3,
    );
    return Row(
      children: [
        const SizedBox(width: 44),
        Expanded(child: Text(loc.audioDelayTimeNormalLabel, style: style)),
        Expanded(child: Text(loc.audioDelayTimeDottedLabel, style: style)),
        Expanded(child: Text(loc.audioDelayTimeTripletLabel, style: style)),
      ],
    );
  }
}

class _DivisionRow extends StatelessWidget {
  final String label;
  final String normal;
  final String dotted;
  final String triplet;
  const _DivisionRow({
    required this.label,
    required this.normal,
    required this.dotted,
    required this.triplet,
  });

  @override
  Widget build(BuildContext context) {
    final valueStyle = TextStyle(
      fontFamily: 'monospace',
      fontSize: 13,
      fontWeight: FontWeight.w700,
      color: Colors.white.withValues(alpha: 0.85),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 44,
            child: Text(label,
                style: const TextStyle(
                    fontWeight: FontWeight.w800, color: _kAccent, fontSize: 13)),
          ),
          Expanded(child: Text(normal, style: valueStyle)),
          Expanded(child: Text(dotted, style: valueStyle)),
          Expanded(child: Text(triplet, style: valueStyle)),
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
