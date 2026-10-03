import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'package:flutter/services.dart';
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

enum _WaveMode { freqToLambda, lambdaToFreq }

class AudioWavelengthPage extends StatefulWidget {
  const AudioWavelengthPage({super.key});

  @override
  State<AudioWavelengthPage> createState() => _AudioWavelengthPageState();
}

class _AudioWavelengthPageState extends State<AudioWavelengthPage> {
  _WaveMode _mode = _WaveMode.freqToLambda;

  final _tempCtrl = TextEditingController(text: '20');
  final _freqCtrl = TextEditingController(text: '100');
  final _lambdaCtrl = TextEditingController(text: '3.43');

  @override
  void dispose() {
    _tempCtrl.dispose();
    _freqCtrl.dispose();
    _lambdaCtrl.dispose();
    super.dispose();
  }

  double? _p(TextEditingController c) =>
      double.tryParse(c.text.replaceAll(',', '.').trim());

  double _speed(double tempC) => 331.3 + 0.606 * tempC;

  String _fmt(double v, {int d = 2}) {
    if (v >= 1000) return v.toStringAsFixed(0);
    if (v >= 10) return v.toStringAsFixed(d > 1 ? 1 : d);
    return v.toStringAsFixed(d);
  }

  String _fmtFreq(double hz) {
    if (hz >= 1000) {
      return '${(hz / 1000).toStringAsFixed(2).replaceFirst(RegExp(r'\.?0+$'), '')} kHz';
    }
    return '${hz.toStringAsFixed(0)} Hz';
  }

  Color _bandColor(double hz) {
    if (hz < 60) return const Color(0xFF7B5EA7); // sub-bass
    if (hz < 250) return const Color(0xFF4361EE); // basses
    if (hz < 500) return const Color(0xFF4CC9F0); // bas-médiums
    if (hz < 2000) return const Color(0xFF06D6A0); // médiums
    if (hz < 6000) return const Color(0xFFFFB703); // hauts-médiums
    return const Color(0xFFFF6B6B); // aigus
  }

  String? _musicalRef(double hz) {
    // Quelques références musicales utiles
    if (hz >= 38 && hz <= 42) return '≈ Mi grave (guitare basse)';
    if (hz >= 80 && hz <= 85) return '≈ Mi grave (guitare standard)';
    if (hz >= 125 && hz <= 135) return '≈ Do2 (basse de piano)';
    if (hz >= 260 && hz <= 270) return '≈ Do3 (do médium)';
    if (hz >= 440 && hz <= 440) return '= La3 (diapason standard)';
    if (hz >= 1000 && hz <= 1000) return '= 1 kHz (référence EQ)';
    if (hz >= 3400 && hz <= 3600) return '≈ Plage de l\'intelligibilité vocale';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;
    final temp = _p(_tempCtrl) ?? 20.0;
    final speed = _speed(temp);

    double? freq;
    double? lambda;

    if (_mode == _WaveMode.freqToLambda) {
      freq = _p(_freqCtrl);
      if (freq != null && freq > 0) lambda = speed / freq;
    } else {
      lambda = _p(_lambdaCtrl);
      if (lambda != null && lambda > 0) freq = speed / lambda;
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          loc.audioWavelengthTitle,
          style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2),
        ),
        actions: const [
          AboutPinButton(pageId: 'tool:audio_wavelength', sectionId: 'main'),
          SizedBox(width: 4),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child:
              Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      body: SafeArea(
        bottom: true,
        child: ListView(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 24 + bottom),
          children: [
            // ── Mode ─────────────────────────────────────────────────────────
            _Card(
              icon: Icons.swap_horiz_rounded,
              title: loc.audioConversion,
              child: _ModeSelector(
                value: _mode,
                onChanged: (v) => setState(() => _mode = v),
              ),
            ),
            const SizedBox(height: 14),

            // ── Température & Paramètre ───────────────────────────────────────
            _Card(
              icon: Icons.tune_rounded,
              title: loc.audioParameters,
              child: Column(
                children: [
                  _NumField(
                    controller: _tempCtrl,
                    label: loc.audioAmbientTemperature,
                    hint: '20',
                    unit: '°C',
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 12),
                  if (_mode == _WaveMode.freqToLambda)
                    _NumField(
                      controller: _freqCtrl,
                      label: loc.audioFrequency,
                      hint: '100',
                      unit: 'Hz',
                      onChanged: (_) => setState(() {}),
                    )
                  else
                    _NumField(
                      controller: _lambdaCtrl,
                      label: loc.audioWavelength,
                      hint: '3.43',
                      unit: 'm',
                      onChanged: (_) => setState(() {}),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Résultat ──────────────────────────────────────────────────────
            _Card(
              icon: Icons.calculate_outlined,
              title: loc.audioResult,
              child: (freq == null || lambda == null)
                  ? _EmptyState(message: loc.audioEnterValueToCalculate)
                  : Column(
                      children: [
                        _InfoRow(
                          label: loc.audioSpeedOfSound,
                          value: speed.toStringAsFixed(1),
                          unit: 'm/s',
                          accent: Colors.white54,
                        ),
                        const SizedBox(height: 10),
                        if (_mode == _WaveMode.freqToLambda) ...[
                          _ResultBanner(
                            label: loc.audioWavelengthAt(_fmtFreq(freq)),
                            value: lambda < 0.01
                                ? '${(lambda * 100).toStringAsFixed(1)} cm'
                                : '${_fmt(lambda)} m',
                            color: _bandColor(freq),
                          ),
                        ] else ...[
                          _ResultBanner(
                            label: loc.audioFrequencyForLambda(_fmt(lambda)),
                            value: _fmtFreq(freq),
                            color: _bandColor(freq),
                          ),
                        ],
                        const SizedBox(height: 10),
                        _BandBadge(freq: freq),
                        const SizedBox(height: 10),
                        _InfoRow(
                          label: loc.audioHalfWave,
                          value: _fmt(lambda / 2),
                          unit: 'm',
                          accent: _kAccent.withValues(alpha: 0.70),
                        ),
                        const SizedBox(height: 8),
                        _InfoRow(
                          label: loc.audioQuarterWave,
                          value: _fmt(lambda / 4),
                          unit: 'm',
                          accent: _kAccent.withValues(alpha: 0.70),
                        ),
                        if (_musicalRef(freq) != null) ...[
                          const SizedBox(height: 10),
                          _TipBox(text: _musicalRef(freq)!),
                        ],
                      ],
                    ),
            ),
            const SizedBox(height: 14),

            // ── Tableau du spectre ────────────────────────────────────────────
            _Card(
              icon: Icons.equalizer_rounded,
              title: loc.audioSpectrumMarkers,
              child: const _SpectrumTable(),
            ),
            const SizedBox(height: 14),
            Text(
              loc.audioWavelengthFormula,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 11,
                color: Colors.white.withValues(alpha: 0.30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Tableau du spectre ────────────────────────────────────────────────────────
class _SpectrumTable extends StatelessWidget {
  const _SpectrumTable();

  static const _bands = [
    (
      '20 – 60 Hz',
      'Sub-basses',
      'Kick profond, infra. Énergie physique, peu directionnel.',
      Color(0xFF7B5EA7),
    ),
    (
      '60 – 250 Hz',
      'Basses',
      'Corps de la basse, grosse caisse. Chaud ou boueux.',
      Color(0xFF4361EE),
    ),
    (
      '250 – 500 Hz',
      'Bas-médiums',
      'Corps des instruments, voix male. Peut sonner "nasal".',
      Color(0xFF4CC9F0),
    ),
    (
      '500 Hz – 2 kHz',
      'Médiums',
      'Intelligibilité vocale, attaque des cordes, présence.',
      Color(0xFF06D6A0),
    ),
    (
      '2 – 6 kHz',
      'Hauts-médiums',
      'Présence, articulation. Fatigant en excès.',
      Color(0xFFFFB703),
    ),
    (
      '6 – 20 kHz',
      'Aigus',
      'Air, brillance, cymbales, sibilance. Sensible à l\'âge.',
      Color(0xFFFF6B6B),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _bands.map((b) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 6,
                height: 6,
                margin: const EdgeInsets.only(top: 5, right: 10),
                decoration: BoxDecoration(
                  color: b.$4,
                  shape: BoxShape.circle,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          b.$2,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: b.$4,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          b.$1,
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'monospace',
                            color: Colors.white.withValues(alpha: 0.40),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      b.$3,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.55),
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _BandBadge extends StatelessWidget {
  final double freq;
  const _BandBadge({required this.freq});

  Color _color(double hz) {
    if (hz < 60) return const Color(0xFF7B5EA7);
    if (hz < 250) return const Color(0xFF4361EE);
    if (hz < 500) return const Color(0xFF4CC9F0);
    if (hz < 2000) return const Color(0xFF06D6A0);
    if (hz < 6000) return const Color(0xFFFFB703);
    return const Color(0xFFFF6B6B);
  }

  String _name(double hz) {
    if (hz < 60) return 'Sub-basses';
    if (hz < 250) return 'Basses';
    if (hz < 500) return 'Bas-médiums';
    if (hz < 2000) return 'Médiums';
    if (hz < 6000) return 'Hauts-médiums';
    return 'Aigus';
  }

  @override
  Widget build(BuildContext context) {
    final color = _color(freq);
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color.withValues(alpha: 0.40)),
          ),
          child: Text(
            _name(freq),
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class _TipBox extends StatelessWidget {
  final String text;
  const _TipBox({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: _kAccent.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _kAccent.withValues(alpha: 0.20)),
      ),
      child: Row(
        children: [
          const Icon(Icons.music_note_rounded, color: _kAccent, size: 14),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withValues(alpha: 0.65),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Mode selector ────────────────────────────────────────────────────────────
class _ModeSelector extends StatelessWidget {
  final _WaveMode value;
  final ValueChanged<_WaveMode> onChanged;

  const _ModeSelector({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Row(
      children: [
        Expanded(
          child: _ModeBtn(
            label: loc.audioHzToLambda,
            icon: Icons.arrow_forward_rounded,
            selected: value == _WaveMode.freqToLambda,
            onTap: () => onChanged(_WaveMode.freqToLambda),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _ModeBtn(
            label: loc.audioLambdaToHz,
            icon: Icons.arrow_back_rounded,
            selected: value == _WaveMode.lambdaToFreq,
            onTap: () => onChanged(_WaveMode.lambdaToFreq),
          ),
        ),
      ],
    );
  }
}

class _ModeBtn extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _ModeBtn(
      {required this.label,
      required this.icon,
      required this.selected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: selected
              ? _kAccent.withValues(alpha: 0.12)
              : const Color(0xFF0D0D14),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? _kAccent : Colors.white.withValues(alpha: 0.12),
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: selected ? _kAccent : Colors.white54, size: 16),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: selected ? _kAccent : Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Widgets partagés ─────────────────────────────────────────────────────────
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

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final Color accent;

  const _InfoRow(
      {required this.label,
      required this.value,
      required this.unit,
      required this.accent});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF0E0E18),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Row(
        children: [
          Expanded(
              child: Text(label,
                  style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.65),
                      fontWeight: FontWeight.w600,
                      fontSize: 13.5))),
          Text(value,
              style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  color: accent)),
          const SizedBox(width: 6),
          Text(unit,
              style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.45),
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _ResultBanner extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _ResultBanner(
      {required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withValues(alpha: 0.18),
            color.withValues(alpha: 0.06),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: 12,
                color: color.withValues(alpha: 0.70),
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
        ],
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
      padding: const EdgeInsets.symmetric(vertical: 12),
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
