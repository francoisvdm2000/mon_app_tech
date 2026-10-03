import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../about/about_favorites.dart';

const _kAccent = Color(0xFF00E5FF);

final _numFmt = TextInputFormatter.withFunction((oldValue, newValue) {
  final text = newValue.text;
  if (text.isEmpty) return newValue;
  if (!RegExp(r'^[0-9.,\-]+$').hasMatch(text)) return oldValue;
  return newValue;
});

/// Temps admissible avant d'atteindre la dose sonore réglementaire
/// (règle d'échange 3 dB — Code du travail FR, art. R.4431-2), et rappel
/// des seuils réglementaires "lieux de diffusion" (décret spectacles
/// n°2017-1244). Outil indicatif : ne remplace pas un sonomètre/dosimètre
/// certifié ni une mesure réglementaire sur site.
class AudioNoiseDosePage extends StatefulWidget {
  const AudioNoiseDosePage({super.key});

  @override
  State<AudioNoiseDosePage> createState() => _AudioNoiseDosePageState();
}

class _AudioNoiseDosePageState extends State<AudioNoiseDosePage> {
  final _levelCtrl = TextEditingController(text: '95');

  static const double _vai = 80; // Valeur d'action inférieure
  static const double _vas = 85; // Valeur d'action supérieure
  static const double _vle = 87; // Valeur limite d'exposition

  static const List<double> _refLevels = [
    80,
    82,
    85,
    88,
    91,
    94,
    97,
    100,
    103,
    106,
    109
  ];

  @override
  void dispose() {
    _levelCtrl.dispose();
    super.dispose();
  }

  double? _p(TextEditingController c) =>
      double.tryParse(c.text.replaceAll(',', '.').trim());

  /// Règle d'échange 3 dB : chaque +3 dB divise par deux le temps
  /// admissible. T(L) = T0 × 2^((L0 − L) / 3), avec T0 = 8h pour L0.
  static double _allowedHours(double level, double refLevel,
      {double refHours = 8}) {
    final exponent = (refLevel - level) / 3.0;
    return refHours * math.pow(2, exponent);
  }

  String _formatHours(double hours) {
    if (hours >= 8) return AppLocalizations.of(context).audioNoiseDoseUnlimited;
    final totalSeconds = (hours * 3600).round();
    if (totalSeconds >= 3600) {
      final h = totalSeconds ~/ 3600;
      final m = (totalSeconds % 3600) ~/ 60;
      return m > 0 ? '$h h $m min' : '$h h';
    }
    if (totalSeconds >= 60) {
      final m = totalSeconds ~/ 60;
      return '$m min';
    }
    return '$totalSeconds s';
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;
    final level = _p(_levelCtrl);

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.audioNoiseDoseTitle,
            style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: const [
          AboutPinButton(pageId: 'tool:audio_noise_dose', sectionId: 'main'),
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
            // ── Saisie niveau ─────────────────────────────────────────────
            _Card(
              icon: Icons.graphic_eq_rounded,
              title: loc.audioNoiseDoseLevelCardTitle,
              child: Column(
                children: [
                  Text(
                    loc.audioNoiseDoseIntro,
                    style: TextStyle(
                        fontSize: 12.5,
                        color: Colors.white.withValues(alpha: 0.55),
                        height: 1.4),
                  ),
                  const SizedBox(height: 14),
                  _NumField(
                    controller: _levelCtrl,
                    label: loc.audioNoiseDoseLevelLabel,
                    unit: 'dB(A)',
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [85, 88, 91, 94, 97, 100, 103, 106].map((n) {
                      return _Chip(
                        label: '$n dB',
                        selected: level == n.toDouble(),
                        onTap: () =>
                            setState(() => _levelCtrl.text = n.toString()),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Temps admissible ──────────────────────────────────────────
            if (level != null) ...[
              _Card(
                icon: Icons.hourglass_bottom_rounded,
                title: loc.audioNoiseDoseAllowedTimeTitle,
                child: Column(
                  children: [
                    _DoseRow(
                      label: loc.audioNoiseDoseVaiLabel,
                      refDb: _vai,
                      time: _formatHours(_allowedHours(level, _vai)),
                      color: Colors.greenAccent,
                    ),
                    const SizedBox(height: 8),
                    _DoseRow(
                      label: loc.audioNoiseDoseVasLabel,
                      refDb: _vas,
                      time: _formatHours(_allowedHours(level, _vas)),
                      color: Colors.orangeAccent,
                    ),
                    const SizedBox(height: 8),
                    _DoseRow(
                      label: loc.audioNoiseDoseVleLabel,
                      refDb: _vle,
                      time: _formatHours(_allowedHours(level, _vle)),
                      color: Colors.redAccent,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
            ],

            // ── Table de référence ────────────────────────────────────────
            _Card(
              icon: Icons.table_rows_rounded,
              title: loc.audioNoiseDoseTableTitle,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: Row(children: [
                      _Hdr(loc.audioNoiseDoseTableLevelHeader, 70),
                      Expanded(
                          child: _Hdr(loc.audioNoiseDoseTableTimeHeader, 0)),
                    ]),
                  ),
                  ..._refLevels.map((l) {
                    final t = _formatHours(_allowedHours(l, _vle));
                    final isCurrent = level != null && (level - l).abs() < 1.0;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 7),
                        decoration: BoxDecoration(
                          color: isCurrent
                              ? _kAccent.withValues(alpha: 0.07)
                              : const Color(0xFF0E0E18),
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(
                              color: isCurrent
                                  ? _kAccent.withValues(alpha: 0.25)
                                  : Colors.white.withValues(alpha: 0.07)),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 70,
                              child: Text('${l.toStringAsFixed(0)} dB',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w800,
                                      color: isCurrent
                                          ? _kAccent
                                          : Colors.white70)),
                            ),
                            Expanded(
                              child: Text(
                                t,
                                style: TextStyle(
                                  fontFamily: 'monospace',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
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
              ),
            ),
            const SizedBox(height: 14),

            // ── Seuils lieux de diffusion ─────────────────────────────────
            _Card(
              icon: Icons.campaign_rounded,
              title: loc.audioNoiseDoseVenueTitle,
              child: Text(
                loc.audioNoiseDoseVenueText,
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white.withValues(alpha: 0.65),
                    height: 1.45),
              ),
            ),
            const SizedBox(height: 14),

            // ── Disclaimer ────────────────────────────────────────────────
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.03),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.shield_outlined,
                      color: Colors.white.withValues(alpha: 0.35), size: 15),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      loc.audioNoiseDoseDisclaimer,
                      style: TextStyle(
                          fontSize: 11.5,
                          color: Colors.white.withValues(alpha: 0.45),
                          height: 1.4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Widgets ────────────────────────────────────────────────────────────────
class _DoseRow extends StatelessWidget {
  final String label;
  final double refDb;
  final String time;
  final Color color;

  const _DoseRow({
    required this.label,
    required this.refDb,
    required this.time,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withValues(alpha: 0.85))),
                Text('${refDb.toStringAsFixed(0)} dB(A) / 8 h',
                    style: TextStyle(
                        fontSize: 10.5,
                        color: Colors.white.withValues(alpha: 0.40))),
              ],
            ),
          ),
          Text(
            time,
            style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: color),
          ),
        ],
      ),
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
