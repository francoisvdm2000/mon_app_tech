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

class AudioDelayDistancePage extends StatefulWidget {
  const AudioDelayDistancePage({super.key});

  @override
  State<AudioDelayDistancePage> createState() => _AudioDelayDistancePageState();
}

class _AudioDelayDistancePageState extends State<AudioDelayDistancePage> {
  final _tempCtrl = TextEditingController(text: '20');

  // Points de mesure (distance en m)
  final List<TextEditingController> _pointCtrls = [
    TextEditingController(text: '10'),
    TextEditingController(text: '20'),
    TextEditingController(text: '30'),
  ];

  @override
  void dispose() {
    _tempCtrl.dispose();
    for (final c in _pointCtrls) {
      c.dispose();
    }
    super.dispose();
  }

  double? _p(TextEditingController c) =>
      double.tryParse(c.text.replaceAll(',', '.').trim());

  double _speedOfSound(double tempC) => 331.3 + 0.606 * tempC;

  String _fmt(double v, {int d = 2}) => v.toStringAsFixed(d);

  void _addPoint() {
    if (_pointCtrls.length >= 8) return;
    setState(() {
      _pointCtrls.add(TextEditingController(text: ''));
    });
  }

  void _removePoint(int index) {
    if (_pointCtrls.length <= 1) return;
    setState(() {
      _pointCtrls[index].dispose();
      _pointCtrls.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;
    final temp = _p(_tempCtrl) ?? 20.0;
    final speed = _speedOfSound(temp);

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          loc.audioDelayDistanceTitle,
          style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2),
        ),
        actions: const [
          AboutPinButton(pageId: 'tool:audio_delay_distance', sectionId: 'main'),
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
            // ── Température ──────────────────────────────────────────────────
            _Card(
              icon: Icons.thermostat_rounded,
              title: loc.audioConditions,
              child: Column(
                children: [
                  _NumField(
                    controller: _tempCtrl,
                    label: loc.audioAmbientTemperature,
                    hint: '20',
                    unit: '°C',
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 10),
                  _InfoRow(
                    label: loc.audioSpeedOfSound,
                    value: _fmt(speed, d: 1),
                    unit: 'm/s',
                    accent: _kAccent,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Points de distance ───────────────────────────────────────────
            _Card(
              icon: Icons.place_outlined,
              title: loc.audioListeningPoints,
              child: Column(
                children: [
                  ...List.generate(_pointCtrls.length, (i) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 28,
                            height: 28,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: _kAccent.withValues(alpha: 0.15),
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '${i + 1}',
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                  color: _kAccent),
                            ),
                          ),
                          Expanded(
                            child: _NumField(
                              controller: _pointCtrls[i],
                              label: loc.audioDistancePoint(i + 1),
                              hint: '${(i + 1) * 10}',
                              unit: 'm',
                              onChanged: (_) => setState(() {}),
                            ),
                          ),
                          if (_pointCtrls.length > 1) ...[
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () => _removePoint(i),
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color:
                                      Colors.redAccent.withValues(alpha: 0.12),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.remove_rounded,
                                    color: Colors.redAccent, size: 16),
                              ),
                            ),
                          ],
                        ],
                      ),
                    );
                  }),
                  if (_pointCtrls.length < 8)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: _addPoint,
                        icon: const Icon(Icons.add_circle_outline_rounded,
                            size: 18),
                        label: Text(loc.audioAddPoint),
                        style: TextButton.styleFrom(
                          foregroundColor: _kAccent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Résultats ────────────────────────────────────────────────────
            _Card(
              icon: Icons.timer_outlined,
              title: loc.audioCalculatedDelays,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        const SizedBox(width: 38),
                        Expanded(
                          flex: 2,
                          child: Text(
                            loc.audioDistance,
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: Colors.white.withValues(alpha: 0.40),
                                letterSpacing: 0.5),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            loc.audioDelayToApply,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: Colors.white.withValues(alpha: 0.40),
                                letterSpacing: 0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ...List.generate(_pointCtrls.length, (i) {
                    final dist = _p(_pointCtrls[i]);
                    final delayMs =
                        dist != null && dist > 0 ? (dist / speed) * 1000 : null;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: _DelayResultRow(
                        index: i + 1,
                        dist: dist,
                        delayMs: delayMs,
                      ),
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Cas d'usage ──────────────────────────────────────────────────
            _Card(
              icon: Icons.tips_and_updates_rounded,
              title: loc.audioTypicalUseCases,
              child: Column(
                children: [
                  _UseCase(
                    icon: Icons.speaker_outlined,
                    title: loc.audioDelayStackFillsTitle,
                    desc: loc.audioDelayStackFillsText,
                  ),
                  _UseCase(
                    icon: Icons.grid_view_rounded,
                    title: loc.audioDistributedSoundTitle,
                    desc: loc.audioDistributedSoundText,
                  ),
                  _UseCase(
                    icon: Icons.table_rows_rounded,
                    title: loc.audioRoomFillTitle,
                    desc: loc.audioRoomFillText,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Text(
              loc.audioDelayNote,
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

class _DelayResultRow extends StatelessWidget {
  final int index;
  final double? dist;
  final double? delayMs;

  const _DelayResultRow(
      {required this.index, required this.dist, required this.delayMs});

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
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: _kAccent.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              '$index',
              style: const TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w900, color: _kAccent),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              dist != null
                  ? '${dist! >= 100 ? dist!.toStringAsFixed(0) : dist!.toStringAsFixed(1)} m'
                  : '—',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withValues(alpha: 0.65),
                  fontWeight: FontWeight.w600),
            ),
          ),
          if (delayMs != null) ...[
            Text(
              delayMs!.toStringAsFixed(2),
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: _kAccent,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              'ms',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: _kAccent.withValues(alpha: 0.60)),
            ),
          ] else
            Text(
              '—',
              style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.30), fontSize: 16),
            ),
        ],
      ),
    );
  }
}

class _UseCase extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;

  const _UseCase({required this.icon, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            margin: const EdgeInsets.only(right: 12, top: 2),
            decoration: BoxDecoration(
              color: _kAccent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: _kAccent, size: 16),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                const SizedBox(height: 3),
                Text(
                  desc,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withValues(alpha: 0.55),
                      height: 1.4),
                ),
              ],
            ),
          ),
        ],
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
