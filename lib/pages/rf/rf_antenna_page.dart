import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../about/about_favorites.dart';

const _kAccent = Color(0xFF9C27B0);
const _kSpeedOfLight = 299.792458; // m/µs = m/MHz * 1e6

final _numFmt = TextInputFormatter.withFunction((oldValue, newValue) {
  final text = newValue.text;
  if (text.isEmpty) return newValue;
  if (!RegExp(r'^[0-9.,]+$').hasMatch(text)) return oldValue;
  final seps = '.'.allMatches(text).length + ','.allMatches(text).length;
  if (seps > 1) return oldValue;
  return newValue;
});

// Facteurs de vélocité typiques pour les câbles coaxiaux
class _VfPreset {
  final String name;
  final double vf;
  const _VfPreset(this.name, this.vf);
}

const _vfPresets = [
  _VfPreset('freeSpace', 1.00),
  _VfPreset('RG-58 (0.66)', 0.66),
  _VfPreset('RG-213 (0.66)', 0.66),
  _VfPreset('LMR-400 (0.85)', 0.85),
  _VfPreset('RG-8X (0.82)', 0.82),
  _VfPreset('Ecoflex 10 (0.88)', 0.88),
];

class RfAntennaPage extends StatefulWidget {
  const RfAntennaPage({super.key});

  @override
  State<RfAntennaPage> createState() => _RfAntennaPageState();
}

class _RfAntennaPageState extends State<RfAntennaPage> {
  final _freqCtrl = TextEditingController(text: '600');
  int _selectedVfIndex = 0;
  final _vfCtrl = TextEditingController(text: '1.00');

  @override
  void dispose() {
    _freqCtrl.dispose();
    _vfCtrl.dispose();
    super.dispose();
  }

  double? _p(TextEditingController c) =>
      double.tryParse(c.text.replaceAll(',', '.').trim());

  String _vfPresetLabel(AppLocalizations l10n, String presetName) {
    if (presetName == 'freeSpace') return l10n.rfPresetFreeSpace;
    return presetName;
  }

  double get _vf {
    if (_selectedVfIndex < _vfPresets.length) {
      return _vfPresets[_selectedVfIndex].vf;
    }
    return _p(_vfCtrl) ?? 1.0;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;
    final freqMhz = _p(_freqCtrl);
    final vf = _vf.clamp(0.01, 1.0);

    double? lambda;
    if (freqMhz != null && freqMhz > 0) {
      lambda = (_kSpeedOfLight / freqMhz) * vf;
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(l10n.rfAntennaTitle,
            style: const TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: const [
          AboutPinButton(pageId: 'tool:rf_antenna', sectionId: 'main'),
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
            // ── Fréquence ─────────────────────────────────────────────────────
            _Card(
              icon: Icons.radio_rounded,
              title: l10n.rfFrequency,
              child: _NumField(
                controller: _freqCtrl,
                label: l10n.rfFrequency,
                hint: '600',
                unit: 'MHz',
                onChanged: (_) => setState(() {}),
              ),
            ),
            const SizedBox(height: 14),

            // ── Facteur de vélocité ───────────────────────────────────────────
            _Card(
              icon: Icons.cable_rounded,
              title: l10n.rfVelocityFactorTitle,
              child: Column(
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(_vfPresets.length, (i) {
                      final preset = _vfPresets[i];
                      final sel = _selectedVfIndex == i;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedVfIndex = i;
                            _vfCtrl.text = preset.vf.toStringAsFixed(2);
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 140),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 7),
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
                            _vfPresetLabel(l10n, preset.name),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: sel ? _kAccent : Colors.white60,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Résultats ─────────────────────────────────────────────────────
            _Card(
              icon: Icons.calculate_outlined,
              title: l10n.rfAntennaLengths,
              child: lambda == null
                  ? _EmptyState(
                      message: l10n.rfEnterFrequencyToCalculate)
                  : Column(
                      children: [
                        _AntennaResult(
                          label: l10n.rfFullWave,
                          fraction: '1',
                          lengthM: lambda,
                          isMain: false,
                        ),
                        const SizedBox(height: 8),
                        _AntennaResult(
                          label: l10n.rfHalfWave,
                          fraction: '½',
                          lengthM: lambda / 2,
                          isMain: false,
                          note: l10n.rfStandardDipole,
                        ),
                        const SizedBox(height: 8),
                        _AntennaResult(
                          label: l10n.rfQuarterWave,
                          fraction: '¼',
                          lengthM: lambda / 4,
                          isMain: true,
                          note: l10n.rfWhipAntenna,
                        ),
                        const SizedBox(height: 8),
                        _AntennaResult(
                          label: l10n.rfFiveEighthWave,
                          fraction: '⅝',
                          lengthM: lambda * 5 / 8,
                          isMain: false,
                          note: l10n.rfFiveEighthWaveDescription,
                        ),
                      ],
                    ),
            ),
            const SizedBox(height: 14),

            // ── Fréquences rapides ────────────────────────────────────────────
            _Card(
              icon: Icons.bookmark_border_rounded,
              title: l10n.rfReferenceFrequencies,
              child: Column(
                children: [
                  _FreqRef(freq: 88, label: l10n.rfFmRadio),
                  _FreqRef(freq: 174, label: l10n.rfVhfLow),
                  _FreqRef(freq: 470, label: l10n.rfUhf470),
                  _FreqRef(freq: 600, label: l10n.rfUhf600),
                  _FreqRef(freq: 694, label: l10n.rfUhf694),
                  _FreqRef(freq: 863, label: l10n.rfIsm863),
                  _FreqRef(freq: 2400, label: l10n.rfWifi24),
                  _FreqRef(freq: 5500, label: l10n.rfWifi5),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Text(
              l10n.rfFormulaExplanation,
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

class _AntennaResult extends StatelessWidget {
  final String label;
  final String fraction;
  final double lengthM;
  final bool isMain;
  final String? note;

  const _AntennaResult({
    required this.label,
    required this.fraction,
    required this.lengthM,
    required this.isMain,
    this.note,
  });

  String _fmt(double m) {
    if (m >= 1.0) return '${m.toStringAsFixed(3)} m';
    if (m >= 0.01) return '${(m * 100).toStringAsFixed(1)} cm';
    return '${(m * 1000).toStringAsFixed(1)} mm';
  }

  @override
  Widget build(BuildContext context) {
    final color = isMain ? _kAccent : Colors.white70;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: isMain
            ? _kAccent.withValues(alpha: 0.10)
            : const Color(0xFF0E0E18),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isMain
              ? _kAccent.withValues(alpha: 0.35)
              : Colors.white.withValues(alpha: 0.07),
          width: isMain ? 1.5 : 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(fraction,
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w900, color: color)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withValues(alpha: 0.80))),
                if (note != null)
                  Text(note!,
                      style: TextStyle(
                          fontSize: 11,
                          color: Colors.white.withValues(alpha: 0.45))),
              ],
            ),
          ),
          Text(
            _fmt(lengthM),
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _FreqRef extends StatelessWidget {
  final double freq;
  final String label;
  const _FreqRef({required this.freq, required this.label});

  String _fmtLen(double m) {
    if (m >= 1.0) return '${m.toStringAsFixed(2)} m';
    return '${(m * 100).toStringAsFixed(1)} cm';
  }

  @override
  Widget build(BuildContext context) {
    final lambda = _kSpeedOfLight / freq;
    final quarter = lambda / 4;

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'λ/4 = ${_fmtLen(quarter)}',
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: _kAccent.withValues(alpha: 0.85),
                  ),
                ),
                Text(
                  'λ/2 = ${_fmtLen(lambda / 2)}',
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 11,
                    color: Colors.white.withValues(alpha: 0.40),
                  ),
                ),
              ],
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
          Text(message,
              style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.40), fontSize: 13)),
        ],
      ),
    );
  }
}
