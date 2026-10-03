import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'package:flutter/services.dart';
import '../about/about_favorites.dart';

const _kAccent = Color(0xFF00E5FF);

final _numFmt = TextInputFormatter.withFunction((oldValue, newValue) {
  final text = newValue.text;
  if (text.isEmpty) return newValue;
  if (!RegExp(r'^[0-9.,\-]+$').hasMatch(text)) return oldValue;
  return newValue;
});

class AudioSplSumPage extends StatefulWidget {
  const AudioSplSumPage({super.key});

  @override
  State<AudioSplSumPage> createState() => _AudioSplSumPageState();
}

class _AudioSplSumPageState extends State<AudioSplSumPage> {
  // Mode N sources identiques
  final _splCtrl = TextEditingController(text: '90');
  int _nSources = 4;

  // Mode 2 sources différentes
  final _splACtrl = TextEditingController(text: '90');
  final _splBCtrl = TextEditingController(text: '85');

  @override
  void dispose() {
    _splCtrl.dispose();
    _splACtrl.dispose();
    _splBCtrl.dispose();
    super.dispose();
  }

  double? _p(TextEditingController c) =>
      double.tryParse(c.text.replaceAll(',', '.').trim());

  // Addition incohérente de N sources identiques
  double? _sumN() {
    final spl = _p(_splCtrl);
    if (spl == null) return null;
    return spl + 10 * math.log(_nSources) / math.ln10;
  }

  // Addition de 2 sources différentes
  double? _sum2() {
    final a = _p(_splACtrl);
    final b = _p(_splBCtrl);
    if (a == null || b == null) return null;
    return 10 *
        math.log(math.pow(10, a / 10) + math.pow(10, b / 10)) /
        math.ln10;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;
    final resultN = _sumN();
    final result2 = _sum2();
    final splRef = _p(_splCtrl);

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.audioSplSumTitle,
            style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: const [
          AboutPinButton(pageId: 'tool:audio_spl_sum', sectionId: 'main'),
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
            // ── Explication ───────────────────────────────────────────────────
            _Card(
              icon: Icons.info_outline_rounded,
              title: loc.audioIncoherentSources,
              child: Text(
                'Des sources incohérentes (non synchronisées, ou espacées) '
                's\'additionnent en puissance : '
                'SPL_total = SPL_1 + 10×log₁₀(N). '
                'Doubler les sources = +3 dB. '
                'Pour des sources cohérentes (alignées en phase), le gain est +6 dB par doublement.',
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white.withValues(alpha: 0.65),
                    height: 1.45),
              ),
            ),
            const SizedBox(height: 14),

            // ── N sources identiques ──────────────────────────────────────────
            _Card(
              icon: Icons.speaker_group_rounded,
              title: loc.audioIdenticalSources,
              child: Column(
                children: [
                  _NumField(
                    controller: _splCtrl,
                    label: loc.audioSingleSourceSpl,
                    unit: 'dB',
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 12),
                  // Sélecteur N
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [2, 3, 4, 6, 8, 12, 16].map((n) {
                      final sel = _nSources == n;
                      return _Chip(
                        label: '$n',
                        selected: sel,
                        onTap: () => setState(() => _nSources = n),
                      );
                    }).toList(),
                  ),
                  if (resultN != null) ...[
                    const SizedBox(height: 14),
                    _ResultBox(
                      label: loc.audioTotalSplSources(_nSources),
                      value: resultN,
                      gain: resultN - (splRef ?? 0),
                    ),
                  ],
                  if (splRef != null) ...[
                    const SizedBox(height: 14),
                    _SplTable(splRef: splRef),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── 2 sources différentes ─────────────────────────────────────────
            _Card(
              icon: Icons.call_merge_rounded,
              title: loc.audioTwoDifferentSources,
              child: Column(
                children: [
                  Row(children: [
                    Expanded(
                      child: _NumField(
                        controller: _splACtrl,
                        label: loc.audioSourceA,
                        unit: 'dB',
                        onChanged: (_) => setState(() {}),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _NumField(
                        controller: _splBCtrl,
                        label: loc.audioSourceB,
                        unit: 'dB',
                        onChanged: (_) => setState(() {}),
                      ),
                    ),
                  ]),
                  if (result2 != null) ...[
                    const SizedBox(height: 14),
                    _ResultBox(
                      label: loc.audioTotalSplAB,
                      value: result2,
                      gain: result2 -
                          ((_p(_splACtrl) ?? 0) > (_p(_splBCtrl) ?? 0)
                              ? _p(_splACtrl)!
                              : _p(_splBCtrl)!),
                    ),
                    const SizedBox(height: 10),
                    _DiffTip(
                        a: _p(_splACtrl)!, b: _p(_splBCtrl)!, sum: result2),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Table référence rapide ────────────────────────────────────────
            _Card(
              icon: Icons.table_rows_rounded,
              title: loc.audioDoublingReference,
              child: Column(
                children: [
                  _RefRow(sources: 2, gainIncoherent: 3.0, gainCoherent: 6.0),
                  _RefRow(sources: 4, gainIncoherent: 6.0, gainCoherent: 12.0),
                  _RefRow(sources: 8, gainIncoherent: 9.0, gainCoherent: 18.0),
                  _RefRow(
                      sources: 16, gainIncoherent: 12.0, gainCoherent: 24.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Table N sources ──────────────────────────────────────────────────────────
class _SplTable extends StatelessWidget {
  final double splRef;
  const _SplTable({required this.splRef});

  @override
  Widget build(BuildContext context) {
    final rows = [1, 2, 3, 4, 6, 8, 12, 16];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Row(children: [
            _Hdr('N', 40),
            _Hdr('Gain', 60),
            const Expanded(child: _Hdr('SPL total', 0)),
          ]),
        ),
        ...rows.map((n) {
          final gain = 10 * math.log(n) / math.ln10;
          final total = splRef + gain;
          return Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              decoration: BoxDecoration(
                color: n == 1
                    ? _kAccent.withValues(alpha: 0.07)
                    : const Color(0xFF0E0E18),
                borderRadius: BorderRadius.circular(9),
                border: Border.all(
                    color: n == 1
                        ? _kAccent.withValues(alpha: 0.25)
                        : Colors.white.withValues(alpha: 0.07)),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                    child: Text('$n',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: n == 1 ? _kAccent : Colors.white70)),
                  ),
                  SizedBox(
                    width: 60,
                    child: Text(
                      gain < 0.05 ? '—' : '+${gain.toStringAsFixed(1)} dB',
                      style: const TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 12,
                          color: Colors.white54),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${total.toStringAsFixed(1)} dB',
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: _kAccent.withValues(alpha: 0.90),
                      ),
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

class _Hdr extends StatelessWidget {
  final String text;
  final double width;
  const _Hdr(this.text, this.width);

  @override
  Widget build(BuildContext context) {
    final t = Text(text,
        style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: Colors.white.withValues(alpha: 0.35),
            letterSpacing: 0.3));
    if (width > 0) {
      return SizedBox(width: width, child: t);
    }
    return Expanded(child: t);
  }
}

class _DiffTip extends StatelessWidget {
  final double a;
  final double b;
  final double sum;
  const _DiffTip({required this.a, required this.b, required this.sum});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final diff = (a - b).abs();
    String tip;
    if (diff < 0.5) {
      tip = loc.audioDiffTipEqual;
    } else if (diff < 3) {
      tip = loc.audioDiffTipSmall(diff.toStringAsFixed(1));
    } else if (diff < 10) {
      tip = loc.audioDiffTipMedium(diff.toStringAsFixed(1), (sum - math.max(a, b)).toStringAsFixed(1));
    } else {
      tip = loc.audioDiffTipLarge;
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: _kAccent.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _kAccent.withValues(alpha: 0.20)),
      ),
      child: Row(
        children: [
          Icon(Icons.lightbulb_outline_rounded,
              color: _kAccent.withValues(alpha: 0.70), size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(tip,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withValues(alpha: 0.65),
                    height: 1.35)),
          ),
        ],
      ),
    );
  }
}

// ─── Widgets ──────────────────────────────────────────────────────────────────
class _ResultBox extends StatelessWidget {
  final String label;
  final double value;
  final double gain;
  const _ResultBox(
      {required this.label, required this.value, required this.gain});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _kAccent.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _kAccent.withValues(alpha: 0.30), width: 1.5),
      ),
      child: Row(
        children: [
          Icon(Icons.volume_up_rounded,
              color: _kAccent.withValues(alpha: 0.70), size: 26),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.55))),
                Text(
                  '${value.toStringAsFixed(1)} dB SPL',
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: _kAccent,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.greenAccent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: Colors.greenAccent.withValues(alpha: 0.35)),
            ),
            child: Text(
              '+${gain.toStringAsFixed(1)} dB',
              style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: Colors.greenAccent),
            ),
          ),
        ],
      ),
    );
  }
}

class _RefRow extends StatelessWidget {
  final int sources;
  final double gainIncoherent;
  final double gainCoherent;
  const _RefRow(
      {required this.sources,
      required this.gainIncoherent,
      required this.gainCoherent});

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
            SizedBox(
              width: 60,
              child: Text('×$sources',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.white70)),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text(AppLocalizations.of(context).audioIncoherentShortLabel,
                        style: const TextStyle(fontSize: 11, color: Colors.white38)),
                    Text('+${gainIncoherent.toStringAsFixed(0)} dB',
                        style: const TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: _kAccent)),
                  ]),
                  Row(children: [
                    Text(AppLocalizations.of(context).audioCoherentShortLabel,
                        style: const TextStyle(fontSize: 11, color: Colors.white38)),
                    Text('+${gainCoherent.toStringAsFixed(0)} dB',
                        style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white.withValues(alpha: 0.55))),
                  ]),
                ],
              ),
            ),
          ],
        ),
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
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
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
                fontSize: 13,
                fontWeight: FontWeight.w800,
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
      keyboardType:
          const TextInputType.numberWithOptions(decimal: true, signed: true),
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
