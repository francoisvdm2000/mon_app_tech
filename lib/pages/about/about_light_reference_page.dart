import 'package:flutter/material.dart';

import '../../app/ui/widgets.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

class AboutLightReferencePage extends StatefulWidget {
  const AboutLightReferencePage({super.key});

  @override
  State<AboutLightReferencePage> createState() =>
      _AboutLightReferencePageState();
}

class _AboutLightReferencePageState extends State<AboutLightReferencePage> {
  final _scroll = ScrollController();

  // Anchors (TOC)
  final _kCri = GlobalKey();
  final _kKelvin = GlobalKey();
  final _kBeamField = GlobalKey();
  final _kLux = GlobalKey();

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  void _goTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
      alignment: 0.08,
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.aboutLightReferenceTitle),
      ),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          controller: _scroll,
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
          child: Column(
            children: [
              // ===== TOC (same look as Electric) =====
              SectionCard(
                title: loc.commonTocTitle,
                icon: Icons.list_alt,
                trailing: IconButton(
                  tooltip: loc.commonCopySummaryTooltip,
                  icon: const Icon(Icons.copy, color: Colors.white70),
                  onPressed: () {
                    final txt = '${loc.aboutLightReferenceTitle}\n'
                        '• ${loc.refCriTitle}\n'
                        '• ${loc.refKelvinTitle}\n'
                        '• ${loc.refBeamFieldTitle}\n'
                        '• ${loc.refLuxTitle}';
                    copyToClipboard(context, txt);
                  },
                ),
                child: Column(
                  children: [
                    _TocItemTile(
                      label: loc.refCriTitle,
                      onTap: () => _goTo(_kCri),
                    ),
                    const SizedBox(height: 8),
                    _TocItemTile(
                      label: loc.refKelvinTitle,
                      onTap: () => _goTo(_kKelvin),
                    ),
                    const SizedBox(height: 8),
                    _TocItemTile(
                      label: loc.refBeamFieldTitle,
                      onTap: () => _goTo(_kBeamField),
                    ),
                    const SizedBox(height: 8),
                    _TocItemTile(
                      label: loc.refLuxTitle,
                      onTap: () => _goTo(_kLux),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // ===== CRI =====
              _Anchor(key: _kCri),
              SectionCard(
                title: loc.refCriTitle,
                icon: Icons.palette,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loc.refCriContent,
                      style: const TextStyle(height: 1.25),
                    ),
                    const SizedBox(height: 10),
                    const _CriScale(),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // ===== Kelvin =====
              _Anchor(key: _kKelvin),
              SectionCard(
                title: loc.refKelvinTitle,
                icon: Icons.wb_sunny,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loc.refKelvinContent,
                      style: const TextStyle(height: 1.25),
                    ),
                    const SizedBox(height: 10),
                    const _KelvinBar(),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // ===== Beam vs Field =====
              _Anchor(key: _kBeamField),
              SectionCard(
                title: loc.refBeamFieldTitle,
                icon: Icons.change_history,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loc.refBeamFieldContent,
                      style: const TextStyle(height: 1.25),
                    ),
                    const SizedBox(height: 12),
                    _BeamFieldDiagram(
                      beamLabel: loc.refBeamLegendBeam,
                      fieldLabel: loc.refBeamLegendField,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // ===== Lux recommended (info) =====
              _Anchor(key: _kLux),
              SectionCard(
                title: loc.refLuxTitle,
                icon: Icons.tune,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loc.refLuxIntro,
                      style: const TextStyle(height: 1.25),
                    ),
                    const SizedBox(height: 10),
                    _LuxTable(
                      colUse: loc.refLuxColUse,
                      colLux: loc.refLuxColLux,
                      rows: [
                        _LuxRow(loc.refLuxUseCorridor, '50–100'),
                        _LuxRow(loc.refLuxUseBackstage, '200–500'),
                        _LuxRow(loc.refLuxUseMeeting, '300–750'),
                        _LuxRow(loc.refLuxUseExpo, '500–1500'),
                        _LuxRow(loc.refLuxUseStageGeneral, '500–2000'),
                        _LuxRow(loc.refLuxUseStageTv, '1000–3000+'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      loc.refLuxNote,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.70),
                        fontSize: 12,
                        height: 1.25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),
              Text(
                loc.refLightDisclaimerShort,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white38,
                  fontSize: 12,
                  height: 1.25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Anchor extends StatelessWidget {
  const _Anchor({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox(height: 1);
}

class _TocItemTile extends StatelessWidget {
  const _TocItemTile({
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF0B0B0B),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.92),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.white.withValues(alpha: 0.55),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CriScale extends StatelessWidget {
  const _CriScale();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    Widget pill(String text) => Padding(
          padding: const EdgeInsets.only(right: 8, bottom: 8),
          child: MiniPill(text),
        );

    return Wrap(
      children: [
        pill(loc.refCri90),
        pill(loc.refCri80),
        pill(loc.refCriLow),
      ],
    );
  }
}

class _KelvinBar extends StatelessWidget {
  const _KelvinBar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: CustomPaint(
        painter: _KelvinPainter(),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _KelvinPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final r = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 16, size.width, 18),
      const Radius.circular(10),
    );

    final gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Colors.orangeAccent,
        Colors.amberAccent,
        Colors.white,
        Colors.lightBlueAccent,
        Colors.blueAccent,
      ],
    );

    final p = Paint()..shader = gradient.createShader(r.outerRect);
    canvas.drawRRect(r, p);

    final tick = Paint()
      ..color = Colors.white.withValues(alpha: 0.8)
      ..strokeWidth = 1;

    // approx positions: 2700 / 3200 / 4000 / 5600 / 6500
    final xs = [
      size.width * 0.08,
      size.width * 0.18,
      size.width * 0.35,
      size.width * 0.65,
      size.width * 0.80,
    ];

    for (final x in xs) {
      canvas.drawLine(Offset(x, 10), Offset(x, 40), tick);
    }

    final tp = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    void label(String txt, double x) {
      tp.text = TextSpan(
        text: txt,
        style: TextStyle(
          fontSize: 11,
          color: Colors.white.withValues(alpha: 0.9),
          fontWeight: FontWeight.w700,
        ),
      );
      tp.layout(minWidth: 0, maxWidth: 80);
      tp.paint(canvas, Offset(x - tp.width / 2, 44));
    }

    label('2700K', xs[0]);
    label('3200K', xs[1]);
    label('4000K', xs[2]);
    label('5600K', xs[3]);
    label('6500K', xs[4]);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _BeamFieldDiagram extends StatelessWidget {
  const _BeamFieldDiagram({
    required this.beamLabel,
    required this.fieldLabel,
  });

  final String beamLabel;
  final String fieldLabel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: CustomPaint(
        painter: _BeamFieldPainterL10n(
          beamLabel: beamLabel,
          fieldLabel: fieldLabel,
        ),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _BeamFieldPainterL10n extends CustomPainter {
  _BeamFieldPainterL10n({
    required this.beamLabel,
    required this.fieldLabel,
  });

  final String beamLabel;
  final String fieldLabel;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, 12);
    final beamR = size.width * 0.22;
    final fieldR = size.width * 0.35;

    final beamPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final fieldPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.55)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: beamR),
      0.75,
      1.65,
      false,
      beamPaint,
    );
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: fieldR),
      0.75,
      1.65,
      false,
      fieldPaint,
    );

    final dot = Paint()..color = Colors.white;
    canvas.drawCircle(center, 3, dot);

    final tp = TextPainter(
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );

    void label(String txt, Offset pos, double alpha) {
      tp.text = TextSpan(
        text: txt,
        style: TextStyle(
          fontSize: 12,
          color: Colors.white.withValues(alpha: alpha),
          fontWeight: FontWeight.w800,
        ),
      );
      tp.layout(minWidth: 0, maxWidth: size.width);
      tp.paint(canvas, pos);
    }

    label(beamLabel, const Offset(16, 78), 0.90);
    label(fieldLabel, const Offset(16, 102), 0.60);

    final l1 = Paint()
      ..color = Colors.white.withValues(alpha: 0.9)
      ..strokeWidth = 2;
    final l2 = Paint()
      ..color = Colors.white.withValues(alpha: 0.55)
      ..strokeWidth = 2;

    canvas.drawLine(const Offset(16, 96), const Offset(56, 96), l1);
    canvas.drawLine(const Offset(16, 120), const Offset(56, 120), l2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _LuxRow {
  _LuxRow(this.use, this.lux);
  final String use;
  final String lux;
}

class _LuxTable extends StatelessWidget {
  const _LuxTable({
    required this.colUse,
    required this.colLux,
    required this.rows,
  });

  final String colUse;
  final String colLux;
  final List<_LuxRow> rows;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.white24),
      columnWidths: const {
        0: FlexColumnWidth(1.6),
        1: FlexColumnWidth(1.0),
      },
      children: [
        TableRow(
          decoration:
              BoxDecoration(color: Colors.white.withValues(alpha: 0.06)),
          children: [
            _cell(colUse, bold: true, align: TextAlign.left),
            _cell(colLux, bold: true),
          ],
        ),
        for (final r in rows)
          TableRow(
            children: [
              _cell(r.use, align: TextAlign.left),
              _cell(r.lux),
            ],
          ),
      ],
    );
  }

  Widget _cell(
    String text, {
    bool bold = false,
    TextAlign align = TextAlign.center,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(
          fontWeight: bold ? FontWeight.w900 : FontWeight.w700,
          color: Colors.white.withValues(alpha: bold ? 0.95 : 0.85),
        ),
      ),
    );
  }
}
