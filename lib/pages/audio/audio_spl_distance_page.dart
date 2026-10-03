import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'package:flutter/services.dart';
import '../about/about_favorites.dart';

const _kAccent = Color(0xFF00E5FF);

final _numFmt = TextInputFormatter.withFunction((oldValue, newValue) {
  final text = newValue.text;
  if (text.isEmpty) return newValue;
  if (!RegExp(r'^-?[0-9.,]+$').hasMatch(text)) return oldValue;
  final seps = '.'.allMatches(text).length + ','.allMatches(text).length;
  if (seps > 1) return oldValue;
  return newValue;
});

// ─── Mode de calcul ───────────────────────────────────────────────────────────
enum _SplMode { distance, power }

class AudioSplDistancePage extends StatefulWidget {
  const AudioSplDistancePage({super.key});

  @override
  State<AudioSplDistancePage> createState() => _AudioSplDistancePageState();
}

class _AudioSplDistancePageState extends State<AudioSplDistancePage> {
  _SplMode _mode = _SplMode.distance;

  // Mode Distance
  final _splRefCtrl = TextEditingController(text: '100');
  final _distRefCtrl = TextEditingController(text: '1');
  final _distTgtCtrl = TextEditingController(text: '10');

  // Mode Puissance
  final _powerCtrl = TextEditingController(text: '1000');
  final _sensitivityCtrl = TextEditingController(text: '98');
  final _distPwrCtrl = TextEditingController(text: '20');

  @override
  void dispose() {
    _splRefCtrl.dispose();
    _distRefCtrl.dispose();
    _distTgtCtrl.dispose();
    _powerCtrl.dispose();
    _sensitivityCtrl.dispose();
    _distPwrCtrl.dispose();
    super.dispose();
  }

  double? _p(TextEditingController c) =>
      double.tryParse(c.text.replaceAll(',', '.').trim());

  String _fmt(double v, {int d = 1}) => v.toStringAsFixed(d);

  // Loi du carré inverse : SPL2 = SPL1 - 20×log10(d2/d1)
  double? _splAtDistance({
    required double splRef,
    required double distRef,
    required double distTarget,
  }) {
    if (distRef <= 0 || distTarget <= 0) return null;
    return splRef - 20.0 * math.log(distTarget / distRef) / math.ln10;
  }

  Color _splColor(double spl) {
    if (spl >= 110) return Colors.redAccent;
    if (spl >= 94) return Colors.orangeAccent;
    return Colors.greenAccent;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          loc.audioSplDistanceTitle,
          style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2),
        ),
        actions: const [
          AboutPinButton(pageId: 'tool:audio_spl_distance', sectionId: 'main'),
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
            // ── Mode selector ────────────────────────────────────────────────
            _Card(
              icon: Icons.tune_rounded,
              title: loc.audioCalculationMode,
              child: _ModeSelector(
                value: _mode,
                onChanged: (v) => setState(() => _mode = v),
              ),
            ),
            const SizedBox(height: 14),

            if (_mode == _SplMode.distance) ...[
              _buildDistanceMode(),
            ] else ...[
              _buildPowerMode(),
            ],

            const SizedBox(height: 14),
            const _SplReferenceCard(),
            const SizedBox(height: 14),
            Text(
              'Calcul en champ libre (pas de réflexions de salle).\n'
              'En intérieur, le SPL réel sera souvent plus élevé.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                color: Colors.white.withValues(alpha: 0.30),
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Mode Distance ──────────────────────────────────────────────────────────
  Widget _buildDistanceMode() {
    final loc = AppLocalizations.of(context);
    final splRef = _p(_splRefCtrl);
    final distRef = _p(_distRefCtrl);
    final distTgt = _p(_distTgtCtrl);

    double? result;
    double? dbDiff;
    if (splRef != null && distRef != null && distTgt != null) {
      result =
          _splAtDistance(splRef: splRef, distRef: distRef, distTarget: distTgt);
      if (result != null) dbDiff = result - splRef;
    }

    return Column(
      children: [
        _Card(
          icon: Icons.social_distance_rounded,
          title: loc.audioParameters,
          child: Column(
            children: [
              _NumField(
                controller: _splRefCtrl,
                label: loc.audioReferenceSpl,
                hint: '100',
                unit: 'dB SPL',
                fmt: _numFmt,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 12),
              _NumField(
                controller: _distRefCtrl,
                label: loc.audioReferenceDistance,
                hint: '1',
                unit: 'm',
                fmt: _numFmt,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 12),
              _NumField(
                controller: _distTgtCtrl,
                label: loc.audioTargetDistance,
                hint: '10',
                unit: 'm',
                fmt: _numFmt,
                onChanged: (_) => setState(() {}),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        _Card(
          icon: Icons.calculate_outlined,
          title: loc.audioResult,
          child: result == null
              ? _EmptyState(message: loc.audioEnterValuesToCalculate)
              : Column(
                  children: [
                    _ResultBanner(
                      label: loc.audioSplAtDistance(_fmt(distTgt!, d: 1)),
                      value: _fmt(result, d: 1),
                      unit: 'dB',
                      color: _splColor(result),
                    ),
                    const SizedBox(height: 10),
                    _InfoRow(
                      label: loc.audioVariation,
                      value: '${dbDiff! >= 0 ? '+' : ''}${_fmt(dbDiff, d: 1)}',
                      unit: 'dB',
                      accent: dbDiff >= 0
                          ? Colors.greenAccent
                          : Colors.orangeAccent,
                    ),
                    const SizedBox(height: 10),
                    _distanceTable(splRef: splRef!, distRef: distRef!),
                  ],
                ),
        ),
      ],
    );
  }

  // ─── Mode Puissance ─────────────────────────────────────────────────────────
  Widget _buildPowerMode() {
    final loc = AppLocalizations.of(context);
    final powerW = _p(_powerCtrl);
    final sens = _p(_sensitivityCtrl);
    final dist = _p(_distPwrCtrl);

    double? splAt1m;
    double? splAtDist;
    if (powerW != null && sens != null) {
      splAt1m = sens + 10.0 * math.log(powerW) / math.ln10;
    }
    if (splAt1m != null && dist != null) {
      splAtDist = _splAtDistance(splRef: splAt1m, distRef: 1, distTarget: dist);
    }

    return Column(
      children: [
        _Card(
          icon: Icons.power_rounded,
          title: loc.audioParameters,
          child: Column(
            children: [
              _NumField(
                controller: _powerCtrl,
                label: loc.audioAmpPower,
                hint: '1000',
                unit: 'W',
                fmt: _numFmt,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 12),
              _NumField(
                controller: _sensitivityCtrl,
                label: loc.audioSensitivity,
                hint: '98',
                unit: 'dB/W/m',
                fmt: _numFmt,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 12),
              _NumField(
                controller: _distPwrCtrl,
                label: loc.audioListeningDistance,
                hint: '20',
                unit: 'm',
                fmt: _numFmt,
                onChanged: (_) => setState(() {}),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        _Card(
          icon: Icons.calculate_outlined,
          title: loc.audioResult,
          child: (splAt1m == null)
              ? _EmptyState(message: loc.audioEnterValuesToCalculate)
              : Column(
                  children: [
                    _InfoRow(
                      label: loc.audioMaxSplAt1m,
                      value: _fmt(splAt1m, d: 1),
                      unit: 'dB',
                      accent: _splColor(splAt1m),
                    ),
                    if (splAtDist != null) ...[
                      const SizedBox(height: 10),
                      _ResultBanner(
                        label: loc.audioSplAtDistance(_fmt(dist!, d: 1)),
                        value: _fmt(splAtDist, d: 1),
                        unit: 'dB',
                        color: _splColor(splAtDist),
                      ),
                      const SizedBox(height: 10),
                      _distanceTable(splRef: splAt1m, distRef: 1),
                    ],
                  ],
                ),
        ),
      ],
    );
  }

  // Tableau des SPL à différentes distances
  Widget _distanceTable({required double splRef, required double distRef}) {
    final distances = [1.0, 2.0, 5.0, 10.0, 20.0, 50.0, 100.0];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            'SPL selon la distance',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Colors.white.withValues(alpha: 0.50),
              letterSpacing: 0.3,
            ),
          ),
        ),
        ...distances.map((d) {
          final spl =
              _splAtDistance(splRef: splRef, distRef: distRef, distTarget: d);
          if (spl == null) return const SizedBox.shrink();
          return Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: _TableRow(dist: d, spl: spl, color: _splColor(spl)),
          );
        }),
      ],
    );
  }
}

class _TableRow extends StatelessWidget {
  final double dist;
  final double spl;
  final Color color;

  const _TableRow({required this.dist, required this.spl, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF0E0E18),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 56,
            child: Text(
              '${dist >= 10 ? dist.toStringAsFixed(0) : dist.toStringAsFixed(1)} m',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.55),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: _SplBar(spl: spl),
          ),
          const SizedBox(width: 10),
          Text(
            '${spl.toStringAsFixed(1)} dB',
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 13,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _SplBar extends StatelessWidget {
  final double spl;
  const _SplBar({required this.spl});

  @override
  Widget build(BuildContext context) {
    final ratio = ((spl - 50) / 80).clamp(0.0, 1.0);
    Color barColor;
    if (spl >= 110) {
      barColor = Colors.redAccent;
    } else if (spl >= 94) {
      barColor = Colors.orangeAccent;
    } else {
      barColor = Colors.greenAccent;
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: 6,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: ratio,
            child: Container(
              decoration: BoxDecoration(
                color: barColor,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
      );
    });
  }
}

// ─── Mode selector ────────────────────────────────────────────────────────────
class _ModeSelector extends StatelessWidget {
  final _SplMode value;
  final ValueChanged<_SplMode> onChanged;

  const _ModeSelector({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Row(
      children: [
        Expanded(
          child: _ModeBtn(
            label: loc.audioSplModeDistance,
            icon: Icons.social_distance_rounded,
            selected: value == _SplMode.distance,
            onTap: () => onChanged(_SplMode.distance),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _ModeBtn(
            label: loc.audioSplModePower,
            icon: Icons.power_rounded,
            selected: value == _SplMode.power,
            onTap: () => onChanged(_SplMode.power),
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

  const _ModeBtn({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

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
        child: Column(
          children: [
            Icon(icon, color: selected ? _kAccent : Colors.white54, size: 20),
            const SizedBox(height: 6),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
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

// ─── Carte de référence SPL ───────────────────────────────────────────────────
class _SplReferenceCard extends StatelessWidget {
  const _SplReferenceCard();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    const refs = [
      ('30 dB', 'Bibliothèque calme'),
      ('60 dB', 'Conversation normale'),
      ('85 dB', 'Seuil recommandé (8h)'),
      ('94 dB', 'Seuil risque auditif (4h)'),
      ('105 dB', 'Concert rock (seuil légal FR)'),
      ('120 dB', 'Seuil de douleur'),
    ];

    return _Card(
      icon: Icons.info_outline_rounded,
      title: loc.audioSoundLevelReference,
      child: Column(
        children: refs.map((r) {
          Color c = Colors.white70;
          if (double.tryParse(r.$1.split(' ')[0])! >= 110) {
            c = Colors.redAccent;
          } else if (double.tryParse(r.$1.split(' ')[0])! >= 94) {
            c = Colors.orangeAccent;
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                SizedBox(
                  width: 64,
                  child: Text(
                    r.$1,
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                      color: c,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    r.$2,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withValues(alpha: 0.60),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
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
            Text(title,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 0.1)),
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
  final TextInputFormatter fmt;
  final ValueChanged<String> onChanged;

  const _NumField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.unit,
    required this.fmt,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType:
          const TextInputType.numberWithOptions(decimal: true, signed: true),
      inputFormatters: [fmt],
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
                    fontSize: 13.5)),
          ),
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
  final String unit;
  final Color color;

  const _ResultBanner(
      {required this.label,
      required this.value,
      required this.unit,
      required this.color});

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 13,
                  color: color.withValues(alpha: 0.80),
                  fontWeight: FontWeight.w700),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(value,
                  style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: color)),
              const SizedBox(width: 6),
              Text(unit,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: color.withValues(alpha: 0.70))),
            ],
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
