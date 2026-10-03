// Aide sur les supports VESA et la taille des écrans.
// Référence des standards VESA + petits outils pratiques (identification du
// standard depuis un entraxe mesuré, calcul des dimensions d'un écran depuis
// sa diagonale).
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../l10n_gen/app_localizations.dart';

const _kAccentVesa = Color(0xFF00B4D8);

class AboutVesaScreensPage extends StatelessWidget {
  const AboutVesaScreensPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(loc.aboutVesaTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
        children: const [
          _IntroCard(),
          SizedBox(height: 12),
          _VesaTableCard(),
          SizedBox(height: 12),
          _VesaFinderCard(),
          SizedBox(height: 12),
          _ScreenSizeCalculatorCard(),
          SizedBox(height: 12),
          _MountingTipsCard(),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SHARED UI
// ─────────────────────────────────────────────────────────────────────────────

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.icon,
    required this.title,
    required this.child,
  });

  final IconData icon;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: _kAccentVesa.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Icon(icon, color: _kAccentVesa, size: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                    color: Colors.white,
                  ),
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

// ─────────────────────────────────────────────────────────────────────────────
// INTRO
// ─────────────────────────────────────────────────────────────────────────────

class _IntroCard extends StatelessWidget {
  const _IntroCard();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return _SectionCard(
      icon: Icons.aspect_ratio,
      title: loc.vesaIntroTitle,
      child: Text(
        loc.vesaIntroBody,
        style: TextStyle(color: Colors.white.withValues(alpha: 0.75), height: 1.45),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// TABLEAU DES STANDARDS VESA
// ─────────────────────────────────────────────────────────────────────────────

class _VesaSpec {
  const _VesaSpec(this.pattern, this.widthMm, this.heightMm, this.sizeRange,
      this.maxWeightKg);
  final String pattern;
  final double widthMm;
  final double heightMm;
  // null => plage "grands formats / murs LED" (texte localisé à l'affichage)
  final String? sizeRange;
  final String maxWeightKg;
}

const List<_VesaSpec> _vesaSpecs = [
  _VesaSpec('75 × 75 mm', 75, 75, '12″ – 23″', '≈ 8 kg'),
  _VesaSpec('100 × 100 mm', 100, 100, '13″ – 27″', '≈ 14–18 kg'),
  _VesaSpec('100 × 200 mm', 100, 200, '23″ – 32″', '≈ 20–23 kg'),
  _VesaSpec('200 × 100 mm', 200, 100, '23″ – 32″', '≈ 20–23 kg'),
  _VesaSpec('200 × 200 mm', 200, 200, '26″ – 40″', '≈ 30 kg'),
  _VesaSpec('300 × 300 mm', 300, 300, '32″ – 55″', '≈ 50 kg'),
  _VesaSpec('400 × 400 mm', 400, 400, '40″ – 70″+', '≈ 75–100 kg'),
  _VesaSpec('600 × 400 mm', 600, 400, '55″ – 90″+', '> 100 kg'),
  _VesaSpec('800 × 400 mm', 800, 400, null, '> 100 kg'),
  _VesaSpec('800 × 600 mm', 800, 600, null, '> 100 kg'),
];

class _VesaTableCard extends StatelessWidget {
  const _VesaTableCard();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return _SectionCard(
      icon: Icons.grid_4x4,
      title: loc.vesaTableTitle,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: _kAccentVesa.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: _kAccentVesa.withValues(alpha: 0.28)),
            ),
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Text(loc.vesaColEntraxe,
                        style: const TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w800,
                            color: _kAccentVesa))),
                Expanded(
                    flex: 3,
                    child: Text(loc.vesaColScreenSize,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w800,
                            color: _kAccentVesa))),
                Expanded(
                    flex: 2,
                    child: Text(loc.vesaColMaxWeight,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w800,
                            color: _kAccentVesa))),
              ],
            ),
          ),
          ..._vesaSpecs.map((s) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        s.pattern,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            fontFamily: 'monospace'),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        s.sizeRange ?? loc.vesaLargeFormat,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.70),
                            fontSize: 12.5),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        s.maxWeightKg,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.70),
                            fontSize: 12.5),
                      ),
                    ),
                  ],
                ),
              )),
          const Divider(height: 20, color: Colors.white12),
          Text(
            loc.vesaTableFooterNote,
            style: TextStyle(
                color: Colors.white.withValues(alpha: 0.45), fontSize: 12),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// TROUVER MON VESA À PARTIR D'UN ENTRAXE MESURÉ
// ─────────────────────────────────────────────────────────────────────────────

class _VesaFinderCard extends StatefulWidget {
  const _VesaFinderCard();

  @override
  State<_VesaFinderCard> createState() => _VesaFinderCardState();
}

class _VesaFinderCardState extends State<_VesaFinderCard> {
  final _widthCtrl = TextEditingController();
  final _heightCtrl = TextEditingController();

  @override
  void dispose() {
    _widthCtrl.dispose();
    _heightCtrl.dispose();
    super.dispose();
  }

  double? _parse(String v) {
    final s = v.replaceAll(',', '.').trim();
    if (s.isEmpty) return null;
    return double.tryParse(s);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final w = _parse(_widthCtrl.text);
    final h = _parse(_heightCtrl.text);

    _VesaSpec? exact;
    _VesaSpec? nearest;
    double bestDelta = double.infinity;

    if (w != null && h != null) {
      for (final s in _vesaSpecs) {
        final matchesDirect = (s.widthMm - w).abs() < 1.5 &&
            (s.heightMm - h).abs() < 1.5;
        final matchesSwapped = (s.widthMm - h).abs() < 1.5 &&
            (s.heightMm - w).abs() < 1.5;
        if (matchesDirect || matchesSwapped) {
          exact = s;
        }
        final delta = math.min(
          (s.widthMm - w).abs() + (s.heightMm - h).abs(),
          (s.widthMm - h).abs() + (s.heightMm - w).abs(),
        );
        if (delta < bestDelta) {
          bestDelta = delta;
          nearest = s;
        }
      }
    }

    return _SectionCard(
      icon: Icons.straighten,
      title: loc.vesaFinderTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            loc.vesaFinderHint,
            style: TextStyle(
                color: Colors.white.withValues(alpha: 0.55), fontSize: 12.5),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _widthCtrl,
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true),
                  onChanged: (_) => setState(() {}),
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: loc.vesaFieldHorizontal,
                    border: const OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _heightCtrl,
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true),
                  onChanged: (_) => setState(() {}),
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: loc.vesaFieldVertical,
                    border: const OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (w == null || h == null)
            Text(
              loc.vesaFinderPlaceholder,
              style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.40),
                  fontSize: 12.5,
                  fontStyle: FontStyle.italic),
            )
          else if (exact != null)
            _ResultBanner(
              icon: Icons.check_circle,
              color: const Color(0xFF00C853),
              text: loc.vesaFinderExactMatch(exact.pattern),
            )
          else if (nearest != null)
            _ResultBanner(
              icon: Icons.help_outline,
              color: const Color(0xFFFFB703),
              text: loc.vesaFinderNearestMatch(
                  nearest.pattern, bestDelta.toStringAsFixed(0)),
            ),
        ],
      ),
    );
  }
}

class _ResultBanner extends StatelessWidget {
  const _ResultBanner(
      {required this.icon, required this.color, required this.text});
  final IconData icon;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  color: color, fontWeight: FontWeight.w700, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// CALCUL DE TAILLE D'ÉCRAN (DIAGONALE → DIMENSIONS)
// ─────────────────────────────────────────────────────────────────────────────

class _AspectRatio {
  const _AspectRatio(this.label, this.w, this.h);
  final String label;
  final double w;
  final double h;
}

const List<_AspectRatio> _aspectRatios = [
  _AspectRatio('16:9', 16, 9),
  _AspectRatio('16:10', 16, 10),
  _AspectRatio('4:3', 4, 3),
  _AspectRatio('21:9', 21, 9),
  _AspectRatio('1:1', 1, 1),
];

class _ScreenSizeCalculatorCard extends StatefulWidget {
  const _ScreenSizeCalculatorCard();

  @override
  State<_ScreenSizeCalculatorCard> createState() =>
      _ScreenSizeCalculatorCardState();
}

class _ScreenSizeCalculatorCardState
    extends State<_ScreenSizeCalculatorCard> {
  final _diagonalCtrl = TextEditingController(text: '55');
  _AspectRatio _ratio = _aspectRatios.first;

  @override
  void dispose() {
    _diagonalCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final diagInch =
        double.tryParse(_diagonalCtrl.text.replaceAll(',', '.').trim());

    Widget result = Text(
      loc.vesaScreenCalcPlaceholder,
      style: TextStyle(
          color: Colors.white.withValues(alpha: 0.40),
          fontSize: 12.5,
          fontStyle: FontStyle.italic),
    );

    if (diagInch != null && diagInch > 0) {
      final ratioNorm =
          math.sqrt(_ratio.w * _ratio.w + _ratio.h * _ratio.h);
      final widthIn = diagInch * _ratio.w / ratioNorm;
      final heightIn = diagInch * _ratio.h / ratioNorm;
      final diagCm = diagInch * 2.54;
      final widthCm = widthIn * 2.54;
      final heightCm = heightIn * 2.54;
      final areaM2 = (widthCm / 100) * (heightCm / 100);

      String f(double v) => v.toStringAsFixed(1).replaceAll('.', ',');

      result = Column(
        children: [
          _VesaResultRow(label: loc.vesaResultDiagonal, value: '${f(diagCm)} cm'),
          const SizedBox(height: 6),
          _VesaResultRow(
              label: loc.vesaResultWidth,
              value: '${f(widthCm)} cm  ·  ${f(widthIn)}″'),
          const SizedBox(height: 6),
          _VesaResultRow(
              label: loc.vesaResultHeight,
              value: '${f(heightCm)} cm  ·  ${f(heightIn)}″'),
          const SizedBox(height: 6),
          _VesaResultRow(
              label: loc.vesaResultArea,
              value: '${areaM2.toStringAsFixed(2)} m²'),
        ],
      );
    }

    return _SectionCard(
      icon: Icons.tv,
      title: loc.vesaScreenCalcTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _diagonalCtrl,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  onChanged: (_) => setState(() {}),
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: loc.vesaFieldDiagonal,
                    border: const OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 110,
                child: DropdownButtonFormField<_AspectRatio>(
                  initialValue: _ratio,
                  isExpanded: true,
                  dropdownColor: Theme.of(context).cardColor,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  ),
                  items: _aspectRatios
                      .map((r) => DropdownMenuItem(
                            value: r,
                            child: Text(r.label,
                                style: const TextStyle(color: Colors.white)),
                          ))
                      .toList(),
                  onChanged: (v) {
                    if (v == null) return;
                    setState(() => _ratio = v);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          result,
        ],
      ),
    );
  }
}

class _VesaResultRow extends StatelessWidget {
  const _VesaResultRow({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: _kAccentVesa.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _kAccentVesa.withValues(alpha: 0.25)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.70),
                  fontWeight: FontWeight.w600,
                  fontSize: 13),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'monospace',
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: _kAccentVesa,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// CONSEILS DE FIXATION
// ─────────────────────────────────────────────────────────────────────────────

class _MountingTipsCard extends StatelessWidget {
  const _MountingTipsCard();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final tips = [
      loc.vesaTip1,
      loc.vesaTip2,
      loc.vesaTip3,
      loc.vesaTip4,
      loc.vesaTip5,
      loc.vesaTip6,
    ];

    return _SectionCard(
      icon: Icons.checklist_rtl,
      title: loc.vesaTipsTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: tips
            .map((t) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.check_circle_outline,
                          color: _kAccentVesa, size: 16),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          t,
                          style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.75),
                              fontSize: 13,
                              height: 1.35),
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
