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
  return newValue;
});

// ─── Niveaux de référence ─────────────────────────────────────────────────────
class _LevelRef {
  final String name;
  final double dBu;
  final String context;
  final Color color;

  const _LevelRef(this.name, this.dBu, this.context, this.color);

  double get dBV => dBu - 2.218; // dBV = dBu - 20*log10(0.775)
  double get vrms => 0.7746 * math.pow(10, dBu / 20);
}

const _refs = [
  _LevelRef('-10 dBV', -7.78, 'Consumer (hi-fi, semi-pro)', Colors.white38),
  _LevelRef('0 dBu', 0, 'Niveau de référence (0.775 V)', Color(0xFF00E5FF)),
  _LevelRef(
      '+4 dBu', 4, 'Pro line level (standard studio)', Colors.greenAccent),
  _LevelRef('+18 dBu', 18, 'Headroom typique consoles', Colors.orangeAccent),
  _LevelRef('+24 dBu', 24, 'Headroom haut de gamme', Colors.deepOrangeAccent),
];

// ─── Mode de saisie ───────────────────────────────────────────────────────────
enum _InputMode { dbu, dbv, vrms }

class AudioLevelsPage extends StatefulWidget {
  const AudioLevelsPage({super.key});

  @override
  State<AudioLevelsPage> createState() => _AudioLevelsPageState();
}

class _AudioLevelsPageState extends State<AudioLevelsPage> {
  _InputMode _mode = _InputMode.dbu;
  final _inputCtrl = TextEditingController(text: '4');

  @override
  void dispose() {
    _inputCtrl.dispose();
    super.dispose();
  }

  double? _parsedInput() =>
      double.tryParse(_inputCtrl.text.replaceAll(',', '.').trim());

  // Tout convertir en dBu
  double? get _dbu {
    final v = _parsedInput();
    if (v == null) return null;
    switch (_mode) {
      case _InputMode.dbu:
        return v;
      case _InputMode.dbv:
        return v + 2.218;
      case _InputMode.vrms:
        if (v <= 0) return null;
        return 20 * math.log(v / 0.7746) / math.ln10;
    }
  }

  double? get _dbv => _dbu != null ? _dbu! - 2.218 : null;
  double? get _vrms => _dbu != null ? 0.7746 * math.pow(10, _dbu! / 20) : null;

  String _fmtV(double v) {
    if (v >= 100) return '${v.toStringAsFixed(1)} V';
    if (v >= 1) return '${v.toStringAsFixed(3)} V';
    if (v >= 0.001) return '${(v * 1000).toStringAsFixed(2)} mV';
    return '${(v * 1000000).toStringAsFixed(0)} µV';
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;
    final dbu = _dbu;
    final dbv = _dbv;
    final vrms = _vrms;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.audioLevelsTitle,
            style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: const [
          AboutPinButton(pageId: 'tool:audio_levels', sectionId: 'main'),
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
            // ── Convertisseur ─────────────────────────────────────────────────
            _Card(
              icon: Icons.swap_horiz_rounded,
              title: loc.audioLevelConverter,
              child: Column(
                children: [
                  // Sélecteur unité
                  Row(children: [
                    ..._InputMode.values.map((m) {
                      final sel = _mode == m;
                      final label = switch (m) {
                        _InputMode.dbu => 'dBu',
                        _InputMode.dbv => 'dBV',
                        _InputMode.vrms => 'V rms',
                      };
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: _Chip(
                          label: label,
                          selected: sel,
                          onTap: () => setState(() {
                            _mode = m;
                            _inputCtrl.clear();
                          }),
                        ),
                      );
                    }),
                  ]),
                  const SizedBox(height: 12),
                  _NumField(
                    controller: _inputCtrl,
                    label: switch (_mode) {
                      _InputMode.dbu => loc.audioLevelInputDbu,
                      _InputMode.dbv => loc.audioLevelInputDbv,
                      _InputMode.vrms => loc.audioLevelInputVrms,
                    },
                    unit: switch (_mode) {
                      _InputMode.dbu => 'dBu',
                      _InputMode.dbv => 'dBV',
                      _InputMode.vrms => 'V',
                    },
                    onChanged: (_) => setState(() {}),
                  ),
                  if (dbu != null) ...[
                    const SizedBox(height: 14),
                    _ConvResult(
                      rows: [
                        ('dBu', '${dbu.toStringAsFixed(2)} dBu', _kAccent),
                        (
                          'dBV',
                          '${dbv!.toStringAsFixed(2)} dBV',
                          Colors.white70
                        ),
                        ('V rms', _fmtV(vrms!), Colors.white54),
                        ('V peak', _fmtV(vrms * math.sqrt2), Colors.white38),
                        (
                          'dBFS*',
                          '≈ ${(dbu - 24).toStringAsFixed(1)} dBFS',
                          Colors.orangeAccent
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      loc.audioLevelDbfsNote,
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white.withValues(alpha: 0.30),
                          height: 1.4),
                    ),
                    const SizedBox(height: 10),
                    // Position dans l'échelle
                    _LevelBar(dbu: dbu),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Niveaux de référence ──────────────────────────────────────────
            _Card(
              icon: Icons.tune_rounded,
              title: loc.audioReferenceLevels,
              child: Column(
                children: _refs
                    .map((r) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: _RefTile(ref: r),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 14),

            // ── Gain staging ─────────────────────────────────────────────────
            _Card(
              icon: Icons.stacked_line_chart_rounded,
              title: loc.audioGainStagingRules,
              child: Column(
                children: [
                  _TipRow(
                    icon: Icons.check_circle_outline_rounded,
                    color: Colors.greenAccent,
                    text: loc.audioGainStagingTip1,
                  ),
                  _TipRow(
                    icon: Icons.warning_amber_rounded,
                    color: Colors.orangeAccent,
                    text: loc.audioGainStagingTip2,
                  ),
                  _TipRow(
                    icon: Icons.cable_rounded,
                    color: _kAccent,
                    text: loc.audioGainStagingTip3,
                  ),
                  _TipRow(
                    icon: Icons.info_outline_rounded,
                    color: Colors.white54,
                    text: loc.audioGainStagingTip4,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Text(
              '0 dBu = 0.7746 V rms    |    0 dBV = 1.000 V rms\n'
              'dBV = dBu − 2.218    |    V_peak = V_rms × √2',
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

// ─── Barre de niveau visuelle ─────────────────────────────────────────────────
class _LevelBar extends StatelessWidget {
  final double dbu;
  const _LevelBar({required this.dbu});

  @override
  Widget build(BuildContext context) {
    // Échelle -20 à +24 dBu
    const min = -20.0;
    const max = 24.0;
    final clamped = dbu.clamp(min, max);
    final frac = (clamped - min) / (max - min);

    Color barColor;
    if (dbu < 0) {
      barColor = Colors.white38;
    } else if (dbu < 4) {
      barColor = _kAccent;
    } else if (dbu < 18) {
      barColor = Colors.greenAccent;
    } else if (dbu < 24) {
      barColor = Colors.orangeAccent;
    } else {
      barColor = Colors.redAccent;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('−20 dBu',
                style: TextStyle(
                    fontSize: 9, color: Colors.white.withValues(alpha: 0.30))),
            Text('0',
                style: TextStyle(
                    fontSize: 9, color: Colors.white.withValues(alpha: 0.30))),
            Text('+4',
                style: TextStyle(
                    fontSize: 9,
                    color: Colors.greenAccent.withValues(alpha: 0.60))),
            Text('+18',
                style: TextStyle(
                    fontSize: 9,
                    color: Colors.orangeAccent.withValues(alpha: 0.60))),
            Text('+24 dBu',
                style: TextStyle(
                    fontSize: 9, color: Colors.white.withValues(alpha: 0.30))),
          ],
        ),
        const SizedBox(height: 4),
        LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              FractionallySizedBox(
                widthFactor: frac.clamp(0.0, 1.0),
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: barColor.withValues(alpha: 0.70),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}

// ─── Résultat conversion ──────────────────────────────────────────────────────
class _ConvResult extends StatelessWidget {
  final List<(String, String, Color)> rows;
  const _ConvResult({required this.rows});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0E0E18),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        children: rows.asMap().entries.map((e) {
          final (label, value, color) = e.value;
          final isLast = e.key == rows.length - 1;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
            decoration: BoxDecoration(
              border: isLast
                  ? null
                  : Border(
                      bottom: BorderSide(
                          color: Colors.white.withValues(alpha: 0.05))),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 60,
                  child: Text(label,
                      style: TextStyle(
                          fontSize: 11,
                          color: Colors.white.withValues(alpha: 0.40),
                          fontWeight: FontWeight.w600)),
                ),
                Expanded(
                  child: Text(
                    value,
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: color,
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

// ─── Tile niveau de référence ─────────────────────────────────────────────────
class _RefTile extends StatelessWidget {
  final _LevelRef ref;
  const _RefTile({required this.ref});

  String _fmtV(double v) {
    if (v >= 1) return '${v.toStringAsFixed(3)} V';
    return '${(v * 1000).toStringAsFixed(2)} mV';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: ref.color.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ref.color.withValues(alpha: 0.20)),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 36,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
                color: ref.color, borderRadius: BorderRadius.circular(2)),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(ref.name,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: ref.color)),
                Text(ref.context,
                    style: TextStyle(
                        fontSize: 11,
                        color: Colors.white.withValues(alpha: 0.45))),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${ref.dBu >= 0 ? '+' : ''}${ref.dBu.toStringAsFixed(1)} dBu',
                style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: ref.color),
              ),
              Text(
                _fmtV(ref.vrms),
                style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 11,
                    color: Colors.white.withValues(alpha: 0.40)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Widgets partagés ─────────────────────────────────────────────────────────
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
