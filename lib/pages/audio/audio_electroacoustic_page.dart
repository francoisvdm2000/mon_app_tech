import 'dart:math' as math;
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

// ─── Page ─────────────────────────────────────────────────────────────────────
class AudioElectroacousticPage extends StatefulWidget {
  const AudioElectroacousticPage({super.key});

  @override
  State<AudioElectroacousticPage> createState() =>
      _AudioElectroacousticPageState();
}

class _AudioElectroacousticPageState extends State<AudioElectroacousticPage> {
  // ── Calculateur SPL depuis sensibilité ──────────────────────────────────────
  final _sensCtrl = TextEditingController(text: '96'); // dB SPL / 1W / 1m
  final _powerCtrl = TextEditingController(text: '1000'); // W
  final _distCtrl = TextEditingController(text: '10'); // m

  // ── Couplage de sources ─────────────────────────────────────────────────────
  int _nCouple = 2;

  @override
  void dispose() {
    _sensCtrl.dispose();
    _powerCtrl.dispose();
    _distCtrl.dispose();
    super.dispose();
  }

  double? _p(TextEditingController c) =>
      double.tryParse(c.text.replaceAll(',', '.').trim());

  // SPL = Sensitivity + 10*log10(Power) - 20*log10(Distance)
  double? _splAt(double dist) {
    final sens = _p(_sensCtrl);
    final pw = _p(_powerCtrl);
    if (sens == null || pw == null || pw <= 0 || dist <= 0) return null;
    return sens +
        10 * math.log(pw) / math.ln10 -
        20 * math.log(dist) / math.ln10;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;
    final splAtDist = _splAt(_p(_distCtrl) ?? 10);
    final sens = _p(_sensCtrl);
    final pw = _p(_powerCtrl);

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.audioElectroacousticTitle,
            style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: const [
          AboutPinButton(pageId: 'tool:audio_electroacoustic', sectionId: 'main'),
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
            // ── SPL depuis sensibilité ────────────────────────────────────────
            _Card(
              icon: Icons.speaker_rounded,
              title: loc.audioFromSpeakerSensitivity,
              child: Column(
                children: [
                  Row(children: [
                    Expanded(
                      child: _NumField(
                        controller: _sensCtrl,
                        label: loc.audioSensitivity,
                        unit: 'dB/W/m',
                        onChanged: (_) => setState(() {}),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _NumField(
                        controller: _powerCtrl,
                        label: loc.audioAmpPower,
                        unit: 'W',
                        onChanged: (_) => setState(() {}),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 10),
                  _NumField(
                    controller: _distCtrl,
                    label: loc.audioMeasurementDistance,
                    unit: 'm',
                    onChanged: (_) => setState(() {}),
                  ),
                  if (splAtDist != null) ...[
                    const SizedBox(height: 14),
                    _SplResult(spl: splAtDist, dist: _p(_distCtrl)!),
                    const SizedBox(height: 14),
                    if (sens != null && pw != null && pw > 0)
                      _SplDistTable(sens: sens, powerW: pw),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Sensibilités typiques ─────────────────────────────────────────
            _Card(
              icon: Icons.info_outline_rounded,
              title: loc.audioTypicalSensitivities,
              child: Column(
                children: [
                  _SensRow('Console passive 8" (hi-fi)', '85–88 dB'),
                  _SensRow('Enceinte passive scène 12"', '97–100 dB'),
                  _SensRow('Enceinte active pro 10"+comp.', '101–104 dB'),
                  _SensRow('Sub grave 18"', '98–102 dB'),
                  _SensRow('Line array module', '103–108 dB'),
                  _SensRow('Sub haute pression (pro)', '108–114 dB'),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Couplage de sources ───────────────────────────────────────────
            _Card(
              icon: Icons.join_inner_rounded,
              title: loc.audioSourceCoupling,
              child: Column(
                children: [
                  Text(
                    loc.audioSourceCouplingIntro,
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.60),
                        height: 1.4),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [2, 3, 4, 6, 8].map((n) {
                      final sel = _nCouple == n;
                      return _Chip(
                        label: loc.audioSourcesCount(n),
                        selected: sel,
                        onTap: () => setState(() => _nCouple = n),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 14),
                  _CouplingResult(n: _nCouple),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Règles pratiques ──────────────────────────────────────────────
            _Card(
              icon: Icons.tips_and_updates_rounded,
              title: loc.audioPracticalRules,
              child: Column(
                children: [
                  _TipRow(
                    icon: Icons.straighten_rounded,
                    color: _kAccent,
                    text: loc.audioRuleDoubleDistance,
                  ),
                  _TipRow(
                    icon: Icons.bolt_rounded,
                    color: Colors.orangeAccent,
                    text: loc.audioRuleDoublePower,
                  ),
                  _TipRow(
                    icon: Icons.speaker_group_rounded,
                    color: Colors.greenAccent,
                    text: loc.audioRuleCoupling,
                  ),
                  _TipRow(
                    icon: Icons.hearing_rounded,
                    color: Colors.white54,
                    text: loc.audioRuleSafety,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'SPL = Sens. + 10·log₁₀(P) − 20·log₁₀(d)\n'
              'Couplage cohérent : +20·log₁₀(N) dB    |    Incohérent : +10·log₁₀(N) dB',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 10,
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

// ─── Résultat SPL ─────────────────────────────────────────────────────────────
class _SplResult extends StatelessWidget {
  final double spl;
  final double dist;
  const _SplResult({required this.spl, required this.dist});

  @override
  Widget build(BuildContext context) {
    Color color;
    if (spl < 85) {
      color = Colors.white54;
    } else if (spl < 100) {
      color = Colors.greenAccent;
    } else if (spl < 110) {
      color = Colors.orangeAccent;
    } else {
      color = Colors.redAccent;
    }

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.30), width: 1.5),
      ),
      child: Row(
        children: [
          Icon(Icons.volume_up_rounded,
              color: color.withValues(alpha: 0.80), size: 28),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context).audioAtDistance(dist.toStringAsFixed(0)),
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.50))),
                Text(
                  '${spl.toStringAsFixed(1)} dB SPL',
                  style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: color),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Table SPL par distance ───────────────────────────────────────────────────
class _SplDistTable extends StatelessWidget {
  final double sens;
  final double powerW;
  const _SplDistTable({required this.sens, required this.powerW});

  double _spl(double d) =>
      sens + 10 * math.log(powerW) / math.ln10 - 20 * math.log(d) / math.ln10;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    const dists = [1.0, 2.0, 5.0, 10.0, 20.0, 50.0, 100.0];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Row(children: [
            SizedBox(
                width: 60,
                child: Text(loc.audioDistance,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withValues(alpha: 0.35)))),
            Expanded(
              child: Text(loc.audioSpl,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Colors.white38)),
            ),
          ]),
        ),
        ...dists.map((d) {
          final spl = _spl(d);
          Color color;
          if (spl >= 110) {
            color = Colors.redAccent;
          } else if (spl >= 100) {
            color = Colors.orangeAccent;
          } else if (spl >= 85) {
            color = Colors.greenAccent;
          } else {
            color = Colors.white54;
          }

          final barFrac = (spl.clamp(50.0, 130.0) - 50) / 80;

          return Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              decoration: BoxDecoration(
                color: const Color(0xFF0E0E18),
                borderRadius: BorderRadius.circular(9),
                border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: Text(
                      d < 10
                          ? '${d.toStringAsFixed(0)} m'
                          : '${d.toStringAsFixed(0)} m',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.white.withValues(alpha: 0.65)),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${spl.toStringAsFixed(1)} dB',
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: color,
                          ),
                        ),
                        const SizedBox(height: 3),
                        FractionallySizedBox(
                          widthFactor: barFrac.clamp(0.01, 1.0),
                          child: Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: color.withValues(alpha: 0.50),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}

// ─── Couplage ─────────────────────────────────────────────────────────────────
class _CouplingResult extends StatelessWidget {
  final int n;
  const _CouplingResult({required this.n});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final gainIncoherent = 10 * math.log(n) / math.ln10;
    final gainCoherent = 20 * math.log(n) / math.ln10;

    return Row(
      children: [
        Expanded(
          child: _CoupleBox(
            label: loc.audioIncoherent,
            subtitle: loc.audioIncoherentSubtitle,
            gain: gainIncoherent,
            color: _kAccent,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _CoupleBox(
            label: loc.audioCoherent,
            subtitle: loc.audioCoherentSubtitle,
            gain: gainCoherent,
            color: Colors.greenAccent,
          ),
        ),
      ],
    );
  }
}

class _CoupleBox extends StatelessWidget {
  final String label;
  final String subtitle;
  final double gain;
  final Color color;
  const _CoupleBox({
    required this.label,
    required this.subtitle,
    required this.gain,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Column(
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w700, color: color)),
          const SizedBox(height: 2),
          Text(subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.white.withValues(alpha: 0.40),
                  height: 1.3)),
          const SizedBox(height: 8),
          Text(
            '+${gain.toStringAsFixed(1)} dB',
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Widgets partagés ─────────────────────────────────────────────────────────
class _SensRow extends StatelessWidget {
  final String label;
  final String value;
  const _SensRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Row(
        children: [
          Expanded(
            child: Text(label,
                style: TextStyle(
                    fontSize: 12.5,
                    color: Colors.white.withValues(alpha: 0.60))),
          ),
          Text(value,
              style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: _kAccent.withValues(alpha: 0.85))),
        ],
      ),
    );
  }
}

class _TipRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  const _TipRow({required this.icon, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text,
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white.withValues(alpha: 0.70),
                    height: 1.4)),
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _Chip(
      {required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 140),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: selected
              ? _kAccent.withValues(alpha: 0.16)
              : const Color(0xFF0E0E18),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected ? _kAccent : Colors.white.withValues(alpha: 0.12),
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Text(label,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: selected ? _kAccent : Colors.white54)),
      ),
    );
  }
}

class _NumField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String unit;
  final ValueChanged<String> onChanged;

  const _NumField({
    required this.controller,
    required this.label,
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
        suffixText: unit,
        isDense: true,
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
        labelStyle: TextStyle(color: Colors.white.withValues(alpha: 0.50)),
        suffixStyle: TextStyle(color: Colors.white.withValues(alpha: 0.40)),
      ),
    );
  }
}

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
