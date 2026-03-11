import 'package:flutter/material.dart';

import '../../app/ui/widgets.dart'; // SectionCard, ExpandSectionCard, MiniPill, copyToClipboard
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

class AboutSacnPage extends StatefulWidget {
  const AboutSacnPage({super.key});

  @override
  State<AboutSacnPage> createState() => _AboutSacnPageState();
}

class _AboutSacnPageState extends State<AboutSacnPage> {
  final _scrollCtrl = ScrollController();

  final _k1Basics = GlobalKey();
  final _k2Universe = GlobalKey();
  final _k3Multicast = GlobalKey();
  final _k4Priorities = GlobalKey();
  final _k5Perf = GlobalKey();
  final _k6Rdm = GlobalKey();
  final _k7Diagrams = GlobalKey();
  final _k8Checklist = GlobalKey();

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  void _goTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
      alignment: 0.02,
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.aboutSacnPageTitle),
      ),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          controller: _scrollCtrl,
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
          child: Column(
            children: [
              _TocCard(
                onCopy: () {
                  final txt = [
                    loc.aboutSacnCopy1,
                    loc.aboutSacnCopy2,
                    loc.aboutSacnCopy3,
                    loc.aboutSacnCopy4,
                  ].join('\n');
                  copyToClipboard(context, txt);
                },
                items: [
                  _TocItem(loc.aboutSacnToc1, onTap: () => _goTo(_k1Basics)),
                  _TocItem(loc.aboutSacnToc2, onTap: () => _goTo(_k2Universe)),
                  _TocItem(loc.aboutSacnToc3, onTap: () => _goTo(_k3Multicast)),
                  _TocItem(loc.aboutSacnToc4,
                      onTap: () => _goTo(_k4Priorities)),
                  _TocItem(loc.aboutSacnToc5, onTap: () => _goTo(_k5Perf)),
                  _TocItem(loc.aboutSacnToc6, onTap: () => _goTo(_k6Rdm)),
                  _TocItem(loc.aboutSacnToc7, onTap: () => _goTo(_k7Diagrams)),
                  _TocItem(loc.aboutSacnToc8, onTap: () => _goTo(_k8Checklist)),
                ],
              ),
              const SizedBox(height: 12),
              _Anchor(key: _k1Basics),
              const _Section1Basics(),
              const SizedBox(height: 12),
              _Anchor(key: _k2Universe),
              const _Section2Universe(),
              const SizedBox(height: 12),
              _Anchor(key: _k3Multicast),
              const _Section3Multicast(),
              const SizedBox(height: 12),
              _Anchor(key: _k4Priorities),
              const _Section4Priorities(),
              const SizedBox(height: 12),
              _Anchor(key: _k5Perf),
              const _Section5Perf(),
              const SizedBox(height: 12),
              _Anchor(key: _k6Rdm),
              const _Section6Rdm(),
              const SizedBox(height: 12),
              _Anchor(key: _k7Diagrams),
              const _Section7Diagrams(),
              const SizedBox(height: 12),
              const SizedBox(height: 12),
              _Anchor(key: _k8Checklist),
              _Section8Checklist(
                onCopy: () {
                  copyToClipboard(context, loc.aboutSacnChecklistCopy.trim());
                },
              ),
              const SizedBox(height: 18),
              const _FooterNote(),
            ],
          ),
        ),
      ),
    );
  }
}

/// =======================
/// SECTIONS (inchangées)
/// =======================

class _Section1Basics extends StatelessWidget {
  const _Section1Basics();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.aboutSacnToc1,
      icon: Icons.wifi_tethering,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              MiniPill(loc.aboutSacnSection1Pill1),
              MiniPill(loc.aboutSacnSection1Pill2),
              MiniPill(loc.aboutSacnSection1Pill3),
            ],
          ),
          const SizedBox(height: 10),
          _Paragraph(loc.aboutSacnSection1Paragraph),
          const SizedBox(height: 10),
          _Callout(
            title: loc.aboutSacnSection1Title,
            bullets: [
              loc.aboutSacnSection1Bullet1,
              loc.aboutSacnSection1Bullet2,
              loc.aboutSacnSection1Bullet3,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section2Universe extends StatelessWidget {
  const _Section2Universe();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.aboutSacnToc2,
      icon: Icons.confirmation_number,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              MiniPill(loc.aboutSacnSection2Pill1),
              MiniPill(loc.aboutSacnSection2Pill2),
            ],
          ),
          const SizedBox(height: 10),
          _Paragraph(loc.aboutSacnSection2Paragraph),
          const SizedBox(height: 10),
          _Callout(
            title: loc.aboutSacnSection2Title,
            bullets: [
              loc.aboutSacnSection2Bullet1,
              loc.aboutSacnSection2Bullet2,
              loc.aboutSacnSection2Bullet3,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section3Multicast extends StatelessWidget {
  const _Section3Multicast();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.aboutSacnToc3,
      icon: Icons.hub,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Paragraph(loc.aboutSacnSection3Paragraph),
          const SizedBox(height: 10),
          _Callout(
            title: loc.aboutSacnSection3Title,
            bullets: [
              loc.aboutSacnSection3Bullet1,
              loc.aboutSacnSection3Bullet2,
              loc.aboutSacnSection3Bullet3,
            ],
          ),
          const SizedBox(height: 12),
          _Subtitle(loc.aboutSacnSection3Subtitle),
          const SizedBox(height: 10),
          const _DiagramBox(aspect: 16 / 6.8, painter: _SacnMulticastPainter()),
          const SizedBox(height: 10),
          _Subtitle(loc.aboutSacnSection3Subtitle2),
          _BulletList(items: [
            loc.aboutSacnSection3SubBullet1,
            loc.aboutSacnSection3SubBullet2,
            loc.aboutSacnSection3SubBullet3,
          ]),
        ],
      ),
    );
  }
}

class _Section4Priorities extends StatelessWidget {
  const _Section4Priorities();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.aboutSacnToc4,
      icon: Icons.priority_high,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              MiniPill(loc.aboutSacnSection4Pill1),
              MiniPill(loc.aboutSacnSection4Pill2),
            ],
          ),
          const SizedBox(height: 10),
          _Paragraph(loc.aboutSacnSection4Paragraph),
          const SizedBox(height: 10),
          _Callout(
            title: loc.aboutSacnSection4Title,
            bullets: [
              loc.aboutSacnSection4Bullet1,
              loc.aboutSacnSection4Bullet2,
              loc.aboutSacnSection4Bullet3,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section5Perf extends StatelessWidget {
  const _Section5Perf();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.aboutSacnToc5,
      icon: Icons.speed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              MiniPill(loc.aboutSacnSection5Pill1),
              MiniPill(loc.aboutSacnSection5Pill2),
              MiniPill(loc.aboutSacnSection5Pill3),
              MiniPill(loc.aboutSacnSection5Pill4),
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.aboutSacnSection5Title,
            bullets: [
              loc.aboutSacnSection5Bullet1,
              loc.aboutSacnSection5Bullet2,
              loc.aboutSacnSection5Bullet3,
              loc.aboutSacnSection5Bullet4,
            ],
          ),
          const SizedBox(height: 10),
          _Subtitle(loc.aboutSacnSection5Subtitle),
          _BulletList(items: [
            loc.aboutSacnSection5SubBullet1,
            loc.aboutSacnSection5SubBullet2,
            loc.aboutSacnSection5SubBullet3,
          ]),
        ],
      ),
    );
  }
}

class _Section6Rdm extends StatelessWidget {
  const _Section6Rdm();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return ExpandSectionCard(
      title: loc.aboutSacnToc6,
      icon: Icons.settings_input_component,
      initiallyExpanded: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Paragraph(loc.aboutSacnSection6Paragraph),
          const SizedBox(height: 10),
          _Callout(
            title: loc.aboutSacnSection6Title,
            bullets: [
              loc.aboutSacnSection6Bullet1,
              loc.aboutSacnSection6Bullet2,
              loc.aboutSacnSection6Bullet3,
            ],
          ),
          const SizedBox(height: 10),
          _Subtitle(loc.aboutSacnSection6Subtitle),
          _BulletList(items: [
            loc.aboutSacnSection6SubBullet1,
            loc.aboutSacnSection6SubBullet2,
            loc.aboutSacnSection6SubBullet3,
          ]),
        ],
      ),
    );
  }
}

class _Section7Diagrams extends StatelessWidget {
  const _Section7Diagrams();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.aboutSacnToc7,
      icon: Icons.schema,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Subtitle(loc.aboutSacnSection7Subtitle1),
          const SizedBox(height: 10),
          const _DiagramBox(aspect: 16 / 6.8, painter: _SacnMulticastPainter()),
          const SizedBox(height: 14),
          _Subtitle(loc.aboutSacnSection7Subtitle2),
          const SizedBox(height: 10),
          const _DiagramBox(aspect: 16 / 6.8, painter: _SacnPriorityPainter()),
        ],
      ),
    );
  }
}

class _Section8Checklist extends StatelessWidget {
  const _Section8Checklist({required this.onCopy});
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.aboutSacnToc8,
      icon: Icons.checklist,
      trailing: IconButton(
        tooltip: loc.aboutSacnChecklistCopyTooltip,
        icon: const Icon(Icons.copy, color: Colors.white70),
        onPressed: onCopy,
      ),
      child: _Callout(
        title: loc.aboutSacnChecklistTitle,
        bullets: [
          loc.aboutSacnChecklistBullet1,
          loc.aboutSacnChecklistBullet2,
          loc.aboutSacnChecklistBullet3,
          loc.aboutSacnChecklistBullet4,
          loc.aboutSacnChecklistBullet5,
        ],
      ),
    );
  }
}

/// =======================
/// DIAGRAM BOX + ASSETS (inchangés)
/// =======================

class _DiagramBox extends StatelessWidget {
  const _DiagramBox({required this.painter, this.aspect = 16 / 7});
  final CustomPainter painter;
  final double aspect;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspect,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFF0B0B0B),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: CustomPaint(painter: painter),
        ),
      ),
    );
  }
}

/// =======================
/// DIAGRAMS (inchangés)
/// =======================

class _SacnMulticastPainter extends CustomPainter {
  const _SacnMulticastPainter();

  @override
  void paint(Canvas canvas, Size size) {
    _grid(canvas, size);

    final stroke = Paint()
      ..color = Colors.white.withValues(alpha: 0.88)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final src = Offset(size.width * 0.14, size.height * 0.46);
    final sw = Offset(size.width * 0.40, size.height * 0.46);
    final group = Offset(size.width * 0.60, size.height * 0.46);

    final r1 = Offset(size.width * 0.86, size.height * 0.22);
    final r2 = Offset(size.width * 0.86, size.height * 0.46);
    final r3 = Offset(size.width * 0.86, size.height * 0.70);

    canvas.drawLine(src, sw, stroke);
    canvas.drawLine(sw, group, stroke);
    canvas.drawLine(group, r1, stroke);
    canvas.drawLine(group, r2, stroke);
    canvas.drawLine(group, r3, stroke);

    _box(canvas, size, src, 'Source\nsACN', accent: false);
    _box(canvas, size, sw, 'Switch\nIGMP snooping', accent: true);
    _box(canvas, size, group, 'Multicast\nUniverse U', accent: true);

    _small(canvas, size, r1, 'RX');
    _small(canvas, size, r2, 'RX');
    _small(canvas, size, r3, 'RX');

    final tp = _Text.tp(
      'Sans IGMP: flood\nAvec IGMP: seulement abonnés',
      fontSize: size.shortestSide * 0.060,
      color: Colors.white.withValues(alpha: 0.90),
      weight: FontWeight.w900,
    );
    _Text.paintLabel(canvas, Offset(size.width * 0.06, size.height * 0.75), tp);
  }

  void _grid(Canvas canvas, Size size) {
    canvas.drawRect(
        Offset.zero & size, Paint()..color = const Color(0xFF0B0B0B));
    final faint = Paint()
      ..color = Colors.white.withValues(alpha: 0.16)
      ..strokeWidth = 1;
    final step = size.shortestSide / 10;
    for (double x = 0; x <= size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), faint);
    }
    for (double y = 0; y <= size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), faint);
    }
  }

  void _box(Canvas canvas, Size size, Offset center, String label,
      {required bool accent}) {
    final w = size.width * 0.22;
    final h = size.height * 0.22;
    final rect = Rect.fromCenter(center: center, width: w, height: h);
    final rr = RRect.fromRectAndRadius(
        rect, Radius.circular(size.shortestSide * 0.05));

    final fill = Paint()
      ..color = accent
          ? const Color(0xFF1E88E5).withValues(alpha: 0.18)
          : Colors.white.withValues(alpha: 0.08);
    final border = Paint()
      ..color = accent
          ? const Color(0xFF1E88E5).withValues(alpha: 0.60)
          : Colors.white.withValues(alpha: 0.30)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawRRect(rr, fill);
    canvas.drawRRect(rr, border);

    final tp = _Text.tp(
      label,
      fontSize: size.shortestSide * 0.052,
      color: Colors.white.withValues(alpha: 0.95),
      weight: FontWeight.w900,
    );
    _Text.center(canvas, rect, tp);
  }

  void _small(Canvas canvas, Size size, Offset center, String label) {
    final w = size.width * 0.08;
    final h = size.height * 0.12;
    final rect = Rect.fromCenter(center: center, width: w, height: h);
    final rr = RRect.fromRectAndRadius(
        rect, Radius.circular(size.shortestSide * 0.04));

    canvas.drawRRect(rr, Paint()..color = Colors.white.withValues(alpha: 0.07));
    canvas.drawRRect(
      rr,
      Paint()
        ..color = Colors.white.withValues(alpha: 0.20)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );

    final tp = _Text.tp(
      label,
      fontSize: size.shortestSide * 0.05,
      color: Colors.white.withValues(alpha: 0.90),
      weight: FontWeight.w900,
    );
    _Text.center(canvas, rect, tp);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _SacnPriorityPainter extends CustomPainter {
  const _SacnPriorityPainter();

  @override
  void paint(Canvas canvas, Size size) {
    _grid(canvas, size);

    final stroke = Paint()
      ..color = Colors.white.withValues(alpha: 0.88)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final a = Offset(size.width * 0.14, size.height * 0.30);
    final b = Offset(size.width * 0.14, size.height * 0.62);
    final sw = Offset(size.width * 0.40, size.height * 0.46);
    final rx = Offset(size.width * 0.80, size.height * 0.46);

    canvas.drawLine(a, sw, stroke);
    canvas.drawLine(b, sw, stroke);
    canvas.drawLine(sw, rx, stroke);

    _box(canvas, size, a, 'Source A\nprio 100', accent: true);
    _box(canvas, size, b, 'Source B\nprio 90', accent: false);
    _box(canvas, size, sw, 'Switch', accent: false);
    _box(canvas, size, rx, 'Récepteur\n(prend A)', accent: true);

    final tp = _Text.tp(
      'Le récepteur choisit la source la plus prioritaire',
      fontSize: size.shortestSide * 0.060,
      color: Colors.white.withValues(alpha: 0.90),
      weight: FontWeight.w900,
    );
    _Text.paintLabel(canvas, Offset(size.width * 0.06, size.height * 0.78), tp);
  }

  void _grid(Canvas canvas, Size size) {
    canvas.drawRect(
        Offset.zero & size, Paint()..color = const Color(0xFF0B0B0B));
    final faint = Paint()
      ..color = Colors.white.withValues(alpha: 0.16)
      ..strokeWidth = 1;
    final step = size.shortestSide / 10;
    for (double x = 0; x <= size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), faint);
    }
    for (double y = 0; y <= size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), faint);
    }
  }

  void _box(Canvas canvas, Size size, Offset center, String label,
      {required bool accent}) {
    final w = size.width * 0.24;
    final h = size.height * 0.22;
    final rect = Rect.fromCenter(center: center, width: w, height: h);
    final rr = RRect.fromRectAndRadius(
        rect, Radius.circular(size.shortestSide * 0.05));

    final fill = Paint()
      ..color = accent
          ? const Color(0xFF1E88E5).withValues(alpha: 0.18)
          : Colors.white.withValues(alpha: 0.08);
    final border = Paint()
      ..color = accent
          ? const Color(0xFF1E88E5).withValues(alpha: 0.60)
          : Colors.white.withValues(alpha: 0.30)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawRRect(rr, fill);
    canvas.drawRRect(rr, border);

    final tp = _Text.tp(
      label,
      fontSize: size.shortestSide * 0.050,
      color: Colors.white.withValues(alpha: 0.95),
      weight: FontWeight.w900,
    );
    _Text.center(canvas, rect, tp);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// =======================
/// SMALL UI HELPERS (inchangés)
/// =======================

class _Anchor extends StatelessWidget {
  const _Anchor({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox(height: 0);
}

class _Subtitle extends StatelessWidget {
  const _Subtitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.white.withValues(alpha: 0.92),
          fontWeight: FontWeight.w900,
          fontSize: 14.5),
    );
  }
}

class _Paragraph extends StatelessWidget {
  const _Paragraph(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.white.withValues(alpha: 0.80),
          height: 1.35,
          fontSize: 13.5),
    );
  }
}

class _BulletList extends StatelessWidget {
  const _BulletList({required this.items});
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items
          .map(
            (s) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('•  ',
                      style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.80),
                          height: 1.35)),
                  Expanded(
                    child: Text(
                      s,
                      style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.80),
                          height: 1.35,
                          fontSize: 13.5),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _Callout extends StatelessWidget {
  const _Callout({required this.title, required this.bullets});
  final String title;
  final List<String> bullets;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0B0B0B),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.white.withValues(alpha: 0.92),
                fontWeight: FontWeight.w900,
                fontSize: 13.5),
          ),
          const SizedBox(height: 8),
          _BulletList(items: bullets),
        ],
      ),
    );
  }
}

class _FooterNote extends StatelessWidget {
  const _FooterNote();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Text(
      loc.aboutSacnFooterNote,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white38, fontSize: 12, height: 1.35),
    );
  }
}

class _Text {
  static TextPainter tp(String s,
      {required double fontSize,
      required Color color,
      required FontWeight weight}) {
    final t = TextPainter(
      text: TextSpan(
        text: s,
        style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: weight,
            fontFamily: 'monospace',
            height: 1.15),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    );
    t.layout();
    return t;
  }

  static void center(Canvas canvas, Rect rect, TextPainter tp) {
    final dx = rect.left + (rect.width - tp.width) / 2;
    final dy = rect.top + (rect.height - tp.height) / 2;
    tp.paint(canvas, Offset(dx, dy));
  }

  static void paintLabel(Canvas canvas, Offset pos, TextPainter tp) {
    final pad = 10.0;
    final r = RRect.fromRectAndRadius(
      Rect.fromLTWH(pos.dx, pos.dy, tp.width + pad * 2, tp.height + pad * 2),
      const Radius.circular(12),
    );
    canvas.drawRRect(r, Paint()..color = Colors.black.withValues(alpha: 0.45));
    canvas.drawRRect(
      r,
      Paint()
        ..color = Colors.white.withValues(alpha: 0.14)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );
    tp.paint(canvas, Offset(pos.dx + pad, pos.dy + pad));
  }
}

/// =======================
/// TOC (inchangé)
/// =======================

class _TocCard extends StatelessWidget {
  const _TocCard({required this.items, required this.onCopy});

  final List<_TocItem> items;
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.commonTocTitle,
      icon: Icons.list_alt,
      trailing: IconButton(
        tooltip: loc.aboutSacnCopyTooltip,
        icon: const Icon(Icons.copy, color: Colors.white70),
        onPressed: onCopy,
      ),
      child: Column(
        children: items
            .map(
              (it) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Material(
                  color: const Color(0xFF0B0B0B),
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: it.onTap,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              it.label,
                              style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.92),
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          Icon(Icons.chevron_right,
                              color: Colors.white.withValues(alpha: 0.55)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _TocItem {
  _TocItem(this.label, {required this.onTap});
  final String label;
  final VoidCallback onTap;
}
