import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'package:flutter/services.dart';
import '../about/about_favorites.dart';

// ─── Couleur accent Son ───────────────────────────────────────────────────────
const _kAccent = Color(0xFF00E5FF);

// ─── Formatter décimal ────────────────────────────────────────────────────────
final _numFmt = TextInputFormatter.withFunction((oldValue, newValue) {
  final text = newValue.text;
  if (text.isEmpty) return newValue;
  if (!RegExp(r'^[0-9.,]+$').hasMatch(text)) return oldValue;
  final dots = '.'.allMatches(text).length + ','.allMatches(text).length;
  if (dots > 1) return oldValue;
  return newValue;
});

final _intFmt = FilteringTextInputFormatter.digitsOnly;

// ─── Configurations ───────────────────────────────────────────────────────────
enum _SubConfig { cardioid, endfire }

class AudioSubCardioidPage extends StatefulWidget {
  const AudioSubCardioidPage({super.key});

  @override
  State<AudioSubCardioidPage> createState() => _AudioSubCardioidPageState();
}

class _AudioSubCardioidPageState extends State<AudioSubCardioidPage> {
  _SubConfig _config = _SubConfig.cardioid;

  final _tempCtrl = TextEditingController(text: '20');
  final _distCtrl = TextEditingController(text: '0.9');
  final _countCtrl = TextEditingController(text: '3');

  @override
  void dispose() {
    _tempCtrl.dispose();
    _distCtrl.dispose();
    _countCtrl.dispose();
    super.dispose();
  }

  double? _parse(TextEditingController c) =>
      double.tryParse(c.text.replaceAll(',', '.').trim());

  // Vitesse du son selon température (Celsius)
  double _speedOfSound(double tempC) => 331.3 + 0.606 * tempC;

  String _fmt(double v, {int d = 1}) => v.toStringAsFixed(d);

  // ─────────────────────── BUILD ──────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    final temp = _parse(_tempCtrl) ?? 20.0;
    final dist = _parse(_distCtrl);
    final count = int.tryParse(_countCtrl.text.trim()) ?? 3;
    final speed = _speedOfSound(temp);

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          loc.audioSubCardioidTitle,
          style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2),
        ),
        actions: const [
          AboutPinButton(pageId: 'tool:audio_sub_cardioid', sectionId: 'main'),
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
            // ── Config selector ─────────────────────────────────────────────
            _Card(
              icon: Icons.settings_input_antenna_rounded,
              title: loc.audioConfiguration,
              child: _ConfigSelector(
                value: _config,
                onChanged: (v) => setState(() => _config = v),
              ),
            ),
            const SizedBox(height: 14),

            // ── Paramètres ──────────────────────────────────────────────────
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
                    fmt: _numFmt,
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 12),
                  _NumField(
                    controller: _distCtrl,
                    label: loc.audioSubDistance,
                    hint: '0.9',
                    unit: 'm',
                    fmt: _numFmt,
                    onChanged: (_) => setState(() {}),
                  ),
                  if (_config == _SubConfig.endfire) ...[
                    const SizedBox(height: 12),
                    _NumField(
                      controller: _countCtrl,
                      label: loc.audioSubCount,
                      hint: '3',
                      unit: 'subs',
                      fmt: _intFmt,
                      keyboardType: TextInputType.number,
                      onChanged: (_) => setState(() {}),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Vitesse du son ───────────────────────────────────────────────
            _Card(
              icon: Icons.air_rounded,
              title: loc.audioSpeedOfSound,
              child: _InfoRow(
                label: 'À ${_fmt(temp, d: 1)} °C',
                value: _fmt(speed, d: 1),
                unit: 'm/s',
                accent: _kAccent,
              ),
            ),
            const SizedBox(height: 14),

            // ── Résultats ────────────────────────────────────────────────────
            if (_config == _SubConfig.cardioid)
              _CardioidResults(speed: speed, dist: dist)
            else
              _EndFireResults(
                  speed: speed, dist: dist, count: count.clamp(2, 8)),

            const SizedBox(height: 14),

            // ── Explications ─────────────────────────────────────────────────
            if (_config == _SubConfig.cardioid)
              const _CardioidHowTo()
            else
              const _EndFireHowTo(),

            const SizedBox(height: 14),

            // ── Disclaimer ───────────────────────────────────────────────────
            Text(
              'Calcul en champ libre idéal. Les réflexions de salle et les\n'
              'caractéristiques mécaniques de chaque sub affectent le résultat réel.',
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
}

// ─── Config selector ──────────────────────────────────────────────────────────
class _ConfigSelector extends StatelessWidget {
  final _SubConfig value;
  final ValueChanged<_SubConfig> onChanged;

  const _ConfigSelector({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Column(
      children: [
        _ConfigTile(
          selected: value == _SubConfig.cardioid,
          icon: Icons.speaker_outlined,
          label: loc.audioCardioid2Subs,
          description: loc.audioCardioid2SubsDescription,
          onTap: () => onChanged(_SubConfig.cardioid),
        ),
        const SizedBox(height: 10),
        _ConfigTile(
          selected: value == _SubConfig.endfire,
          icon: Icons.arrow_forward_rounded,
          label: loc.audioEndFireNSubs,
          description: loc.audioEndFireNSubsDescription,
          onTap: () => onChanged(_SubConfig.endfire),
        ),
      ],
    );
  }
}

class _ConfigTile extends StatelessWidget {
  final bool selected;
  final IconData icon;
  final String label;
  final String description;
  final VoidCallback onTap;

  const _ConfigTile({
    required this.selected,
    required this.icon,
    required this.label,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: selected
              ? _kAccent.withValues(alpha: 0.10)
              : const Color(0xFF0D0D14),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? _kAccent : Colors.white.withValues(alpha: 0.12),
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: selected ? _kAccent : Colors.white54, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13.5,
                      color: selected ? _kAccent : Colors.white,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withValues(alpha: 0.50),
                    ),
                  ),
                ],
              ),
            ),
            if (selected)
              Icon(Icons.check_circle_rounded, color: _kAccent, size: 18),
          ],
        ),
      ),
    );
  }
}

// ─── Résultats Cardioïde ──────────────────────────────────────────────────────
class _CardioidResults extends StatelessWidget {
  final double speed;
  final double? dist;

  const _CardioidResults({required this.speed, required this.dist});

  String _fmt(double v, {int d = 1}) => v.toStringAsFixed(d);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final d = dist;

    if (d == null || d <= 0) {
      return _Card(
        icon: Icons.calculate_outlined,
        title: loc.audioResults,
        child: _EmptyState(message: loc.audioEnterDistanceToCalculate),
      );
    }

    final delayMs = (d / speed) * 1000.0;
    final freqOptHz = speed / (4.0 * d);

    return _Card(
      icon: Icons.calculate_outlined,
      title: loc.audioResults,
      child: Column(
        children: [
          _ResultBanner(
            label: loc.audioDelayToApply,
            value: _fmt(delayMs, d: 2),
            unit: 'ms',
            sublabel: loc.audioRearSubDelaySublabel,
          ),
          const SizedBox(height: 10),
          _InfoRow(
            label: loc.audioOptimalFrequency,
            value: _fmt(freqOptHz, d: 0),
            unit: 'Hz',
            accent: Colors.orangeAccent,
          ),
          const SizedBox(height: 10),
          _SubRow(
            index: 'A',
            label: loc.audioFrontSub,
            polarity: loc.audioNormalPolarity,
            polarityColor: Colors.greenAccent,
            delay: '0 ms',
            delayColor: Colors.white70,
          ),
          const SizedBox(height: 8),
          _SubRow(
            index: 'B',
            label: loc.audioRearSubReversed,
            polarity: loc.audioInvertedPolarity,
            polarityColor: Colors.orangeAccent,
            delay: '${_fmt(delayMs, d: 2)} ms',
            delayColor: _kAccent,
          ),
        ],
      ),
    );
  }
}

// ─── Résultats End-fire ───────────────────────────────────────────────────────
class _EndFireResults extends StatelessWidget {
  final double speed;
  final double? dist;
  final int count;

  const _EndFireResults(
      {required this.speed, required this.dist, required this.count});

  String _fmt(double v, {int d = 1}) => v.toStringAsFixed(d);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final d = dist;

    if (d == null || d <= 0) {
      return _Card(
        icon: Icons.calculate_outlined,
        title: loc.audioResults,
        child: _EmptyState(message: loc.audioEnterDistanceToCalculate),
      );
    }

    final stepMs = (d / speed) * 1000.0;
    final totalMs = stepMs * (count - 1);

    return _Card(
      icon: Icons.calculate_outlined,
      title: loc.audioResults,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _InfoRow(
            label: loc.audioDelayBetweenRows,
            value: _fmt(stepMs, d: 2),
            unit: 'ms',
            accent: _kAccent,
          ),
          const SizedBox(height: 8),
          _InfoRow(
            label: loc.audioMaxDelayRearSub,
            value: _fmt(totalMs, d: 2),
            unit: 'ms',
            accent: Colors.orangeAccent,
          ),
          const SizedBox(height: 14),
          ...List.generate(count, (i) {
            final delayMs = stepMs * i;
            final isFirst = i == 0;
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _SubRow(
                index: '${i + 1}',
                label: isFirst
                    ? loc.audioFrontReferenceSub
                    : loc.audioSubNumber(i + 1),
                polarity: loc.audioNormalPolarity,
                polarityColor: Colors.greenAccent,
                delay: isFirst ? '0 ms (réf.)' : '${_fmt(delayMs, d: 2)} ms',
                delayColor: isFirst ? Colors.white54 : _kAccent,
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              loc.audioEndFireReferenceNote,
              style: TextStyle(
                fontSize: 11.5,
                color: Colors.white.withValues(alpha: 0.45),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── How-to Cardioïde ─────────────────────────────────────────────────────────
class _CardioidHowTo extends StatelessWidget {
  const _CardioidHowTo();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return _Card(
      icon: Icons.tips_and_updates_rounded,
      title: loc.audioHowTo,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Step(n: '1', text: loc.audioCardioidStep1),
          _Step(n: '2', text: loc.audioCardioidStep2),
          _Step(n: '3', text: loc.audioCardioidStep3),
          _Step(n: '4', text: loc.audioCardioidStep4),
          _Step(n: '5', text: loc.audioCardioidStep5),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _kAccent.withValues(alpha: 0.07),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: _kAccent.withValues(alpha: 0.20)),
            ),
            child: Text(
              loc.audioCardioidTip,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withValues(alpha: 0.65),
                height: 1.45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── How-to End-fire ──────────────────────────────────────────────────────────
class _EndFireHowTo extends StatelessWidget {
  const _EndFireHowTo();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return _Card(
      icon: Icons.tips_and_updates_rounded,
      title: loc.audioHowTo,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Step(n: '1', text: loc.audioEndFireStep1),
          _Step(n: '2', text: loc.audioEndFireStep2),
          _Step(n: '3', text: loc.audioEndFireStep3),
          _Step(n: '4', text: loc.audioEndFireStep4),
          _Step(n: '5', text: loc.audioEndFireStep5),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _kAccent.withValues(alpha: 0.07),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: _kAccent.withValues(alpha: 0.20)),
            ),
            child: Text(
              loc.audioEndFireTip,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withValues(alpha: 0.65),
                height: 1.45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Widgets réutilisables ────────────────────────────────────────────────────

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
          Row(
            children: [
              Icon(icon, color: Colors.white70, size: 20),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 0.1,
                ),
              ),
            ],
          ),
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
  final TextInputType? keyboardType;
  final ValueChanged<String> onChanged;

  const _NumField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.unit,
    required this.fmt,
    required this.onChanged,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType:
          keyboardType ?? const TextInputType.numberWithOptions(decimal: true),
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

  const _InfoRow({
    required this.label,
    required this.value,
    required this.unit,
    required this.accent,
  });

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
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.65),
                fontWeight: FontWeight.w600,
                fontSize: 13.5,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 17,
              fontWeight: FontWeight.w900,
              color: accent,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            unit,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.45),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ResultBanner extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final String sublabel;

  const _ResultBanner({
    required this.label,
    required this.value,
    required this.unit,
    required this.sublabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            _kAccent.withValues(alpha: 0.18),
            _kAccent.withValues(alpha: 0.06),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _kAccent.withValues(alpha: 0.35)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withValues(alpha: 0.55),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  sublabel,
                  style: TextStyle(
                    fontSize: 12,
                    color: _kAccent.withValues(alpha: 0.70),
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: _kAccent,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                unit,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: _kAccent.withValues(alpha: 0.70),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SubRow extends StatelessWidget {
  final String index;
  final String label;
  final String polarity;
  final Color polarityColor;
  final String delay;
  final Color delayColor;

  const _SubRow({
    required this.index,
    required this.label,
    required this.polarity,
    required this.polarityColor,
    required this.delay,
    required this.delayColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF0E0E18),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: Row(
        children: [
          // Badge numéro
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: _kAccent.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              index,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                color: _kAccent,
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Label
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: Colors.white.withValues(alpha: 0.80),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Polarité
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                polarity,
                style: TextStyle(
                  fontSize: 11,
                  color: polarityColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                delay,
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                  color: delayColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Step extends StatelessWidget {
  final String n;
  final String text;

  const _Step({required this.n, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 22,
            height: 22,
            margin: const EdgeInsets.only(top: 1, right: 10),
            decoration: BoxDecoration(
              color: _kAccent.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              n,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w900,
                color: _kAccent,
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                color: Colors.white.withValues(alpha: 0.72),
                height: 1.4,
              ),
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
          Text(
            message,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.40),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
