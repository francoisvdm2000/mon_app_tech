// lib/pages/electricity/power_plan/power_plan_widgets.dart
//
// Petites briques visuelles partagées par le plan électrique.

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import 'power_plan_models.dart';

const Color kPpAccent = Color(0xFFFF9F1C);
const Color kPpCardBg = Color(0xFF161622);
const Color kPpFieldBg = Color(0xFF1A1A26);

Color ppPhaseColor(PpPhase p) => switch (p) {
      PpPhase.l1 => const Color(0xFF64B5F6),
      PpPhase.l2 => const Color(0xFF69F0AE),
      PpPhase.l3 => const Color(0xFFFFAB40),
    };

Color ppRatioColor(double ratio) {
  if (ratio > 1.0) return const Color(0xFFFF5252);
  if (ratio > kPpWarnRatio) return const Color(0xFFFFAB40);
  return const Color(0xFF69F0AE);
}

Color ppLevelColor(PpAlertLevel? l) => switch (l) {
      PpAlertLevel.error => const Color(0xFFFF5252),
      PpAlertLevel.warning => const Color(0xFFFFAB40),
      PpAlertLevel.info => const Color(0xFF64B5F6),
      null => Colors.white24,
    };

/// Message lisible d'une alerte.
String ppAlertText(AppLocalizations loc, PpAlert a) {
  final v = ppFormatAmps(a.value);
  final l = ppFormatAmps(a.limit);
  final pct = a.limit > 0 ? (a.value / a.limit * 100).round().toString() : '0';
  return switch (a.kind) {
    PpAlertKind.noSource => loc.ppAlertNoSource,
    PpAlertKind.sourceOverload => loc.ppAlertSourceOverload(v, l),
    PpAlertKind.sourceNearLimit => loc.ppAlertNearLimit(pct, v, l),
    PpAlertKind.panelOverload => loc.ppAlertPanelOverload(v, l),
    PpAlertKind.outputOverload => loc.ppAlertOutputOverload(v, l),
    PpAlertKind.outputNearLimit => loc.ppAlertNearLimit(pct, v, l),
    PpAlertKind.cableUndersized =>
      loc.ppAlertCableUndersized(a.extra, a.value.round().toString(), l),
    PpAlertKind.voltageDrop => loc.ppAlertVoltageDrop(
        a.value.toStringAsFixed(1), a.limit.toStringAsFixed(0)),
    PpAlertKind.imbalance =>
      loc.ppAlertImbalance(a.value.round().toString()),
    PpAlertKind.adapter => loc.ppAlertAdapter(a.extra),
  };
}

String ppCategoryName(AppLocalizations loc, PpLoadCategory c) => switch (c) {
      PpLoadCategory.lighting => loc.ppCatLighting,
      PpLoadCategory.sound => loc.ppCatSound,
      PpLoadCategory.video => loc.ppCatVideo,
      PpLoadCategory.stage => loc.ppCatStage,
      PpLoadCategory.catering => loc.ppCatCatering,
      PpLoadCategory.toilets => loc.ppCatToilets,
      PpLoadCategory.production => loc.ppCatProduction,
      PpLoadCategory.hvac => loc.ppCatHvac,
      PpLoadCategory.other => loc.ppCatOther,
    };

String ppSourceKindName(AppLocalizations loc, PpSourceKind k) => switch (k) {
      PpSourceKind.generator => loc.ppSourceGenerator,
      PpSourceKind.mains => loc.ppSourceMains,
      PpSourceKind.outlet => loc.ppSourceOutlet,
    };

String ppSourceDetail(AppLocalizations loc, PpSource s) => switch (s.kind) {
      PpSourceKind.generator =>
        '${s.kva} kVA · ${ppFormatAmps(s.capacityAmps)} A / ${loc.ppPhaseWord}',
      PpSourceKind.mains =>
        '${s.amps} A · ${s.capacityKva.toStringAsFixed(0)} kVA',
      PpSourceKind.outlet =>
        '${s.outletConnector.label} · ${s.capacityKva.toStringAsFixed(1)} kVA',
    };

String ppTemplateName(AppLocalizations loc, PpPanelTemplate t) =>
    t.name ??
    switch (t.key) {
      'strip' => loc.ppTemplateStrip,
      'custom3' => loc.ppTemplateCustomTri,
      _ => loc.ppTemplateCustomMono,
    };

// ─── Carte ───────────────────────────────────────────────────────────────────

BoxDecoration ppCardDecoration({Color? accent, Color? border}) => BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.lerp(kPpCardBg, accent ?? kPpAccent, 0.08)!,
          const Color(0xFF13131D),
        ],
      ),
      borderRadius: BorderRadius.circular(18),
      border: Border.all(
        color: border ?? (accent ?? Colors.white).withValues(alpha: 0.16),
        width: border != null ? 1.4 : 1,
      ),
    );

// ─── Pastille connecteur ─────────────────────────────────────────────────────

class PpConnectorChip extends StatelessWidget {
  const PpConnectorChip(this.connector, {super.key, this.dense = false});
  final PpConnector connector;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final c = Color(connector.colorValue);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: dense ? 6 : 8, vertical: dense ? 2 : 3),
      decoration: BoxDecoration(
        color: c.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: c.withValues(alpha: 0.7)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(color: c, shape: BoxShape.circle),
          ),
          const SizedBox(width: 5),
          Text(
            connector.shortLabel,
            style: TextStyle(
              color: c,
              fontSize: dense ? 11 : 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class PpPhaseBadge extends StatelessWidget {
  const PpPhaseBadge(this.phase, {super.key, this.onTap, this.locked = false});
  final PpPhase phase;
  final VoidCallback? onTap;
  final bool locked;

  @override
  Widget build(BuildContext context) {
    final c = ppPhaseColor(phase);
    return GestureDetector(
      onTap: locked ? null : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
        decoration: BoxDecoration(
          color: c.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: c.withValues(alpha: locked ? 0.3 : 0.8)),
        ),
        child: Text(
          phase.label,
          style: TextStyle(
            color: c,
            fontSize: 11,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}

// ─── Jauges par phase ────────────────────────────────────────────────────────

class PpPhaseBars extends StatelessWidget {
  const PpPhaseBars({
    super.key,
    required this.currents,
    required this.limit,
    this.threePhase = true,
    this.monoPhase,
  });

  final PpCurrents currents;
  final double limit;
  final bool threePhase;
  final PpPhase? monoPhase;

  @override
  Widget build(BuildContext context) {
    final phases = threePhase
        ? PpPhase.values
        : [monoPhase ?? PpPhase.l1];
    return Column(
      children: [
        for (final p in phases)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: _bar(p, currents.of(p)),
          ),
      ],
    );
  }

  Widget _bar(PpPhase p, double amps) {
    final ratio = limit <= 0 ? 0.0 : amps / limit;
    final color = ppRatioColor(ratio);
    return Row(
      children: [
        SizedBox(
          width: 22,
          child: Text(
            p.label,
            style: TextStyle(
              color: ppPhaseColor(p),
              fontSize: 10,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Stack(
              children: [
                Container(height: 7, color: Colors.white10),
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: ratio.clamp(0.0, 1.0)),
                  duration: const Duration(milliseconds: 450),
                  curve: Curves.easeOutCubic,
                  builder: (_, v, __) => FractionallySizedBox(
                    widthFactor: v,
                    child: Container(
                      height: 7,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          color.withValues(alpha: 0.6),
                          color,
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 74,
          child: Text(
            '${ppFormatAmps(amps)} / ${limit.round()} A',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: ratio > 1 ? const Color(0xFFFF5252) : Colors.white60,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Case « + » en pointillés ────────────────────────────────────────────────

class PpDashedAddButton extends StatelessWidget {
  const PpDashedAddButton({
    super.key,
    required this.label,
    required this.onTap,
    this.big = false,
    this.subtitle,
  });

  final String label;
  final String? subtitle;
  final VoidCallback onTap;
  final bool big;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: CustomPaint(
        painter: _DashedRRectPainter(
          color: kPpAccent.withValues(alpha: 0.55),
          radius: 16,
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: 14, vertical: big ? 28 : 10),
          child: big
              ? Column(
                  children: [
                    Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPpAccent.withValues(alpha: 0.15),
                        border: Border.all(color: kPpAccent),
                      ),
                      child: const Icon(Icons.add_rounded,
                          color: kPpAccent, size: 32),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      label,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white54, fontSize: 13),
                      ),
                    ],
                  ],
                )
              : Row(
                  children: [
                    const Icon(Icons.add_circle_outline_rounded,
                        color: kPpAccent, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        label,
                        style: TextStyle(
                          color: kPpAccent.withValues(alpha: 0.9),
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _DashedRRectPainter extends CustomPainter {
  _DashedRRectPainter({required this.color, required this.radius});
  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4;
    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Offset.zero & size, Radius.circular(radius)));
    for (final metric in path.computeMetrics()) {
      double d = 0;
      while (d < metric.length) {
        final len = math.min(6.0, metric.length - d);
        canvas.drawPath(metric.extractPath(d, d + len), paint);
        d += 11;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedRRectPainter old) =>
      old.color != color || old.radius != radius;
}

// ─── Bottom sheet ────────────────────────────────────────────────────────────

Future<T?> showPpSheet<T>(
  BuildContext context, {
  required Widget Function(BuildContext) builder,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: const Color(0xFF12121B),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (ctx) => Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(ctx).bottom),
      child: builder(ctx),
    ),
  );
}

class PpSheetScaffold extends StatelessWidget {
  const PpSheetScaffold({
    super.key,
    required this.title,
    required this.children,
    this.footer,
    this.emoji,
  });

  final String title;
  final String? emoji;
  final List<Widget> children;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.88,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 10),
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
            child: Text(
              emoji == null ? title : '$emoji  $title',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Flexible(
            child: ListView(
              shrinkWrap: true,
              // Sans pied de feuille, la liste doit elle-même éviter la barre
              // de navigation / l'indicateur d'accueil.
              padding: EdgeInsets.fromLTRB(20, 4, 20,
                  12 + (footer == null ? MediaQuery.paddingOf(context).bottom : 0.0)),
              children: children,
            ),
          ),
          if (footer != null)
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 14),
                child: footer,
              ),
            ),
        ],
      ),
    );
  }
}

class PpLabel extends StatelessWidget {
  const PpLabel(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 14, bottom: 8),
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(
            color: Colors.white38,
            fontSize: 10.5,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
          ),
        ),
      );
}

class PpChoiceChip extends StatelessWidget {
  const PpChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.color = kPpAccent,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? color.withValues(alpha: 0.18) : kPpFieldBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? color : Colors.white12,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? color : Colors.white60,
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}

InputDecoration ppInputDecoration(String label, {String? suffix, String? hint}) =>
    InputDecoration(
      labelText: label,
      hintText: hint,
      suffixText: suffix,
      filled: true,
      fillColor: kPpFieldBg,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.10)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: kPpAccent),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    );

class PpPrimaryButton extends StatelessWidget {
  const PpPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon = Icons.check_rounded,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: FilledButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
        style: FilledButton.styleFrom(
          backgroundColor: kPpAccent,
          foregroundColor: Colors.black,
          disabledBackgroundColor: Colors.white12,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14)),
        ),
      ),
    );
  }
}

double? ppParseNum(String s) =>
    double.tryParse(s.trim().replaceAll(',', '.'));
