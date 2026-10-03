import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../about/about_favorites.dart';

const _kAccent = Color(0xFF9C27B0);

// Tolérance pour détecter un conflit IM3 (MHz)
const _kTolerance = 0.200; // ±200 kHz

// ─── Formatteur numérique ─────────────────────────────────────────────────────
final _numFmt = TextInputFormatter.withFunction((oldValue, newValue) {
  final text = newValue.text;
  if (text.isEmpty) return newValue;
  if (!RegExp(r'^[0-9.,]+$').hasMatch(text)) return oldValue;
  final seps = '.'.allMatches(text).length + ','.allMatches(text).length;
  if (seps > 1) return oldValue;
  return newValue;
});

// ─── Data model ───────────────────────────────────────────────────────────────
class _Im3Result {
  final String formula;
  final double freqMhz;
  final List<double> allFreqs;

  const _Im3Result({
    required this.formula,
    required this.freqMhz,
    required this.allFreqs,
  });

  bool get isPositive => freqMhz > 0;

  bool get hasConflict {
    if (!isPositive) return false;
    for (final f in allFreqs) {
      if ((freqMhz - f).abs() < _kTolerance) return true;
    }
    return false;
  }
}

// ─── Page principale ──────────────────────────────────────────────────────────
class RfIm3Page extends StatefulWidget {
  const RfIm3Page({super.key});

  @override
  State<RfIm3Page> createState() => _RfIm3PageState();
}

class _RfIm3PageState extends State<RfIm3Page> {
  // Mode rapide
  final _f1Ctrl = TextEditingController(text: '600.000');
  final _f2Ctrl = TextEditingController(text: '610.000');

  // Mode avancé
  final List<TextEditingController> _freqCtrls = [
    TextEditingController(text: '600.000'),
    TextEditingController(text: '610.000'),
    TextEditingController(text: '620.000'),
  ];

  @override
  void dispose() {
    _f1Ctrl.dispose();
    _f2Ctrl.dispose();
    for (final c in _freqCtrls) {
      c.dispose();
    }
    super.dispose();
  }

  double? _parse(TextEditingController c) =>
      double.tryParse(c.text.replaceAll(',', '.').trim());

  List<_Im3Result> _quickResults() {
    final f1 = _parse(_f1Ctrl);
    final f2 = _parse(_f2Ctrl);
    if (f1 == null || f2 == null || f1 <= 0 || f2 <= 0) return [];
    final freqs = [f1, f2];
    return [
      _Im3Result(formula: '2×F1 − F2', freqMhz: 2 * f1 - f2, allFreqs: freqs),
      _Im3Result(formula: '2×F2 − F1', freqMhz: 2 * f2 - f1, allFreqs: freqs),
    ];
  }

  List<_Im3Result> _multiResults() {
    final freqs = _freqCtrls
        .map(_parse)
        .where((f) => f != null && f > 0)
        .cast<double>()
        .toList();
    if (freqs.length < 2) return [];

    final results = <_Im3Result>[];
    for (int i = 0; i < freqs.length; i++) {
      for (int j = 0; j < freqs.length; j++) {
        if (i == j) continue;
        final im3 = 2 * freqs[i] - freqs[j];
        results.add(_Im3Result(
          formula: '2×F${i + 1}−F${j + 1}',
          freqMhz: im3,
          allFreqs: freqs,
        ));
      }
    }
    results.sort((a, b) => a.freqMhz.compareTo(b.freqMhz));
    return results;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;
    final quickResults = _quickResults();
    final multiResults = _multiResults();
    final conflictCount = multiResults.where((r) => r.hasConflict).length;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.rfIm3PageTitle,
            style: const TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: const [
          AboutPinButton(pageId: 'tool:rf_im3', sectionId: 'main'),
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
              title: loc.rfIm3WhatIs,
              child: Text(
                loc.rfIm3WhatIsBody,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white.withValues(alpha: 0.65),
                  height: 1.45,
                ),
              ),
            ),
            const SizedBox(height: 14),

            // ── Mode rapide ───────────────────────────────────────────────────
            _Card(
              icon: Icons.flash_on_rounded,
              title: loc.rfIm3QuickMode,
              child: Column(
                children: [
                  Row(children: [
                    Expanded(
                        child: _NumField(
                            controller: _f1Ctrl,
                            label: 'F1',
                            onChanged: (_) => setState(() {}))),
                    const SizedBox(width: 12),
                    Expanded(
                        child: _NumField(
                            controller: _f2Ctrl,
                            label: 'F2',
                            onChanged: (_) => setState(() {}))),
                  ]),
                  if (quickResults.isNotEmpty) ...[
                    const SizedBox(height: 14),
                    ...quickResults.map((r) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: _Im3TileFull(result: r),
                        )),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Mode avancé ───────────────────────────────────────────────────
            _Card(
              icon: Icons.grid_view_rounded,
              title: loc.rfIm3AdvancedMode,
              trailing: _freqCtrls.length >= 2
                  ? (conflictCount > 0
                      ? _Badge(
                          label: loc.rfIm3Conflicts(conflictCount),
                          color: Colors.redAccent)
                      : _Badge(label: 'OK', color: Colors.greenAccent))
                  : null,
              child: Column(
                children: [
                  // Champs fréquences
                  ...List.generate(_freqCtrls.length, (i) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(children: [
                        Container(
                          width: 30,
                          alignment: Alignment.center,
                          child: Text('F${i + 1}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color: _kAccent.withValues(alpha: 0.80),
                              )),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _NumField(
                            controller: _freqCtrls[i],
                            label: loc.rfIm3FrequencyN(i + 1),
                            onChanged: (_) => setState(() {}),
                          ),
                        ),
                        if (_freqCtrls.length > 2) ...[
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () => setState(() {
                              _freqCtrls[i].dispose();
                              _freqCtrls.removeAt(i);
                            }),
                            child: Container(
                              width: 34,
                              height: 34,
                              decoration: BoxDecoration(
                                color:
                                    Colors.redAccent.withValues(alpha: 0.10),
                                borderRadius: BorderRadius.circular(9),
                                border: Border.all(
                                    color: Colors.redAccent
                                        .withValues(alpha: 0.30)),
                              ),
                              alignment: Alignment.center,
                              child: const Icon(Icons.remove_rounded,
                                  color: Colors.redAccent, size: 18),
                            ),
                          ),
                        ],
                      ]),
                    );
                  }),

                  // Bouton ajouter
                  if (_freqCtrls.length < 16)
                    Padding(
                      padding: const EdgeInsets.only(top: 2, bottom: 12),
                      child: GestureDetector(
                        onTap: () => setState(
                            () => _freqCtrls.add(TextEditingController())),
                        child: Container(
                          height: 38,
                          decoration: BoxDecoration(
                            color: _kAccent.withValues(alpha: 0.07),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: _kAccent.withValues(alpha: 0.25)),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_rounded,
                                  color: _kAccent.withValues(alpha: 0.80),
                                  size: 18),
                              const SizedBox(width: 6),
                              Text(loc.rfIm3AddFrequency,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: _kAccent.withValues(alpha: 0.80),
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ),
                    ),

                  // Résultats multi
                  if (multiResults.isNotEmpty) ...[
                    Divider(color: Colors.white.withValues(alpha: 0.08)),
                    const SizedBox(height: 8),
                    const _MultiTableHeader(),
                    const SizedBox(height: 6),
                    ...multiResults.map((r) => Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: _Im3TileCompact(result: r),
                        )),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Conseils ──────────────────────────────────────────────────────
            _Card(
              icon: Icons.tips_and_updates_rounded,
              title: loc.rfIm3Tips,
              child: Column(
                children: [
                  _TipRow(
                    icon: Icons.shuffle_rounded,
                    color: Colors.greenAccent,
                    text: loc.rfIm3Tip1,
                  ),
                  _TipRow(
                    icon: Icons.warning_amber_rounded,
                    color: Colors.orangeAccent,
                    text: loc.rfIm3Tip2,
                  ),
                  _TipRow(
                    icon: Icons.business_rounded,
                    color: const Color(0xFF9C27B0),
                    text: loc.rfIm3Tip3,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Text(
              loc.rfIm3Footnote,
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

// ─── Tile mode rapide (grand) ─────────────────────────────────────────────────
class _Im3TileFull extends StatelessWidget {
  final _Im3Result result;
  const _Im3TileFull({required this.result});

  @override
  Widget build(BuildContext context) {
    final color = !result.isPositive
        ? Colors.white38
        : result.hasConflict
            ? Colors.redAccent
            : Colors.greenAccent;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: color.withValues(alpha: 0.30),
          width: result.hasConflict ? 1.5 : 1.0,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(
              result.hasConflict
                  ? Icons.warning_rounded
                  : (result.isPositive
                      ? Icons.check_circle_rounded
                      : Icons.remove_circle_outline_rounded),
              color: color,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  result.formula,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 12,
                    color: Colors.white54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  result.isPositive
                      ? '${result.freqMhz.toStringAsFixed(3)} MHz'
                      : AppLocalizations.of(context).rfIm3OutOfBand,
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: color,
                  ),
                ),
                if (result.hasConflict)
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      AppLocalizations.of(context).rfIm3ConflictOnFreq,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.redAccent.withValues(alpha: 0.85),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Tile mode avancé (compact) ───────────────────────────────────────────────
class _Im3TileCompact extends StatelessWidget {
  final _Im3Result result;
  const _Im3TileCompact({required this.result});

  @override
  Widget build(BuildContext context) {
    final color = !result.isPositive
        ? Colors.white24
        : result.hasConflict
            ? Colors.redAccent
            : Colors.greenAccent;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: color.withValues(alpha: result.hasConflict ? 0.08 : 0.04),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: color.withValues(
                alpha: result.hasConflict ? 0.30 : 0.12)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 86,
            child: Text(
              result.formula,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 11,
                color: Colors.white60,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              result.isPositive
                  ? '${result.freqMhz.toStringAsFixed(3)} MHz'
                  : '< 0 MHz',
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
          ),
          if (result.hasConflict)
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.redAccent.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    color: Colors.redAccent.withValues(alpha: 0.40)),
              ),
              child: Text(AppLocalizations.of(context).rfIm3ConflictBadge,
                  style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w800,
                      color: Colors.redAccent)),
            )
          else if (result.isPositive)
            Icon(Icons.check_rounded,
                color: Colors.greenAccent.withValues(alpha: 0.50), size: 15),
        ],
      ),
    );
  }
}

// ─── Widgets partagés ─────────────────────────────────────────────────────────
class _MultiTableHeader extends StatelessWidget {
  const _MultiTableHeader();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          SizedBox(
              width: 86,
              child: Text(loc.rfIm3TableFormula,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withValues(alpha: 0.35),
                      letterSpacing: 0.3))),
          Expanded(
              child: Text(loc.rfIm3TableFreqIm3,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withValues(alpha: 0.35),
                      letterSpacing: 0.3))),
          Text(loc.rfIm3TableStatus,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Colors.white.withValues(alpha: 0.35),
                  letterSpacing: 0.3)),
        ],
      ),
    );
  }
}

class _NumField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final ValueChanged<String> onChanged;

  const _NumField({
    required this.controller,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [_numFmt],
      style: const TextStyle(
          color: Colors.white, fontFamily: 'monospace', fontSize: 14),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        suffixText: 'MHz',
        isDense: true,
        filled: true,
        fillColor: const Color(0xFF0E0E18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: Colors.white.withValues(alpha: 0.12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: Colors.white.withValues(alpha: 0.12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _kAccent, width: 1.5),
        ),
        labelStyle:
            TextStyle(color: Colors.white.withValues(alpha: 0.50)),
        suffixStyle:
            TextStyle(color: Colors.white.withValues(alpha: 0.40)),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final Color color;
  const _Badge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.45)),
      ),
      child: Text(label,
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.w800, color: color)),
    );
  }
}

class _TipRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  const _TipRow(
      {required this.icon, required this.color, required this.text});

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

class _Card extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;
  final Widget? trailing;

  const _Card({
    required this.icon,
    required this.title,
    required this.child,
    this.trailing,
  });

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
            if (trailing != null) trailing!,
          ]),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}
