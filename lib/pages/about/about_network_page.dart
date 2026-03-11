import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../app/ui/widgets.dart'; // SectionCard, ExpandSectionCard, MiniPill, copyToClipboard
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

class AboutNetworkPage extends StatefulWidget {
  const AboutNetworkPage({super.key});

  @override
  State<AboutNetworkPage> createState() => _AboutNetworkPageState();
}

class _AboutNetworkPageState extends State<AboutNetworkPage> {
  final _scrollCtrl = ScrollController();

  final _k1Basics = GlobalKey();
  final _k2PlanIp = GlobalKey();
  final _k3Vlan = GlobalKey();
  final _k4Igmp = GlobalKey();
  final _k5Wifi = GlobalKey();
  final _k6Switch = GlobalKey();
  final _k7Diagrams = GlobalKey();
  final _k8Checklist = GlobalKey();

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
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.aboutNetworkPageTitle),
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
                    loc.aboutNetworkCopy1,
                    loc.aboutNetworkCopy2,
                    loc.aboutNetworkCopy3,
                    loc.aboutNetworkCopy4,
                  ].join('\n');
                  copyToClipboard(context, txt);
                },
                items: [
                  _TocItem(loc.aboutNetworkToc1, onTap: () => _goTo(_k1Basics)),
                  _TocItem(loc.aboutNetworkToc2, onTap: () => _goTo(_k2PlanIp)),
                  _TocItem(loc.aboutNetworkToc3, onTap: () => _goTo(_k3Vlan)),
                  _TocItem(loc.aboutNetworkToc4, onTap: () => _goTo(_k4Igmp)),
                  _TocItem(loc.aboutNetworkToc5, onTap: () => _goTo(_k5Wifi)),
                  _TocItem(loc.aboutNetworkToc6, onTap: () => _goTo(_k6Switch)),
                  _TocItem(loc.aboutNetworkToc7,
                      onTap: () => _goTo(_k7Diagrams)),
                  _TocItem(loc.aboutNetworkToc8,
                      onTap: () => _goTo(_k8Checklist)),
                ],
              ),
              const SizedBox(height: 12),
              _Anchor(key: _k1Basics),
              const _Section1Basics(),
              const SizedBox(height: 12),
              _Anchor(key: _k2PlanIp),
              const _Section2PlanIp(),
              const SizedBox(height: 12),
              _Anchor(key: _k3Vlan),
              const _Section3Vlan(),
              const SizedBox(height: 12),
              _Anchor(key: _k4Igmp),
              const _Section4Igmp(),
              const SizedBox(height: 12),
              _Anchor(key: _k5Wifi),
              const _Section5Wifi(),
              const SizedBox(height: 12),
              _Anchor(key: _k6Switch),
              const _Section6Switch(),
              const SizedBox(height: 12),
              _Anchor(key: _k7Diagrams),
              const _Section7Diagrams(),
              const SizedBox(height: 12),
              _Anchor(key: _k8Checklist),
              _Section8Checklist(
                onCopy: () {
                  final txt = loc.aboutNetworkChecklistCopy.trim();
                  copyToClipboard(context, txt);
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
      title: loc.aboutNetworkToc1,
      icon: Icons.lan,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              MiniPill(loc.aboutNetworkBasicsPill1),
              MiniPill(loc.aboutNetworkBasicsPill2),
              MiniPill(loc.aboutNetworkBasicsPill3),
            ],
          ),
          const SizedBox(height: 10),
          _Paragraph(
            loc.aboutNetworkBasicsParagraph,
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.aboutNetworkBasicsCalloutTitle,
            bullets: [
              loc.aboutNetworkBasicsBullet1,
              loc.aboutNetworkBasicsBullet2,
              loc.aboutNetworkBasicsBullet3,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section2PlanIp extends StatelessWidget {
  const _Section2PlanIp();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.aboutNetworkToc2,
      icon: Icons.alt_route,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Paragraph(
            loc.aboutNetworkPlanIpParagraph,
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.aboutNetworkPlanIpCalloutTitle,
            bullets: [
              loc.aboutNetworkPlanIpBullet1,
              loc.aboutNetworkPlanIpBullet2,
              loc.aboutNetworkPlanIpBullet3,
              loc.aboutNetworkPlanIpBullet4,
            ],
          ),
          const SizedBox(height: 10),
          _Subtitle(loc.aboutNetworkPlanIpSubtitle),
          _BulletList(items: [
            loc.aboutNetworkPlanIpSubBullet1,
            loc.aboutNetworkPlanIpSubBullet2,
            loc.aboutNetworkPlanIpSubBullet3,
          ]),
        ],
      ),
    );
  }
}

class _Section3Vlan extends StatelessWidget {
  const _Section3Vlan();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.aboutNetworkToc3,
      icon: Icons.layers,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Paragraph(
            loc.aboutNetworkVlanParagraph,
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.aboutNetworkVlanCalloutTitle,
            bullets: [
              loc.aboutNetworkVlanBullet1,
              loc.aboutNetworkVlanBullet2,
              loc.aboutNetworkVlanBullet3,
            ],
          ),
          const SizedBox(height: 10),
          _Subtitle(loc.aboutNetworkVlanSubtitle),
          _BulletList(items: [
            loc.aboutNetworkVlanSubBullet1,
            loc.aboutNetworkVlanSubBullet2,
          ]),
        ],
      ),
    );
  }
}

class _Section4Igmp extends StatelessWidget {
  const _Section4Igmp();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.aboutNetworkToc4,
      icon: Icons.hub,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              MiniPill(loc.aboutNetworkIgmpPill1),
              MiniPill(loc.aboutNetworkIgmpPill2),
              MiniPill(loc.aboutNetworkIgmpPill3),
            ],
          ),
          const SizedBox(height: 10),
          _Paragraph(
            loc.aboutNetworkIgmpParagraph,
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.aboutNetworkIgmpCalloutTitle,
            bullets: [
              loc.aboutNetworkIgmpBullet1,
              loc.aboutNetworkIgmpBullet2,
              loc.aboutNetworkIgmpBullet3,
            ],
          ),
          const SizedBox(height: 12),
          _Subtitle(loc.aboutNetworkIgmpSubtitle),
          const SizedBox(height: 10),
          _DiagramBox(aspect: 16 / 6.8, painter: _IgmpPainter()),
        ],
      ),
    );
  }
}

class _Section5Wifi extends StatelessWidget {
  const _Section5Wifi();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.aboutNetworkToc5,
      icon: Icons.wifi,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Subtitle(loc.aboutNetworkWifiSubtitle1),
          _BulletList(items: [
            loc.aboutNetworkWifiSubBullet1,
            loc.aboutNetworkWifiSubBullet2,
          ]),
          const SizedBox(height: 10),
          _Subtitle(loc.aboutNetworkWifiSubtitle2),
          _BulletList(items: [
            loc.aboutNetworkWifiSubBullet3,
            loc.aboutNetworkWifiSubBullet4,
            loc.aboutNetworkWifiSubBullet5,
            loc.aboutNetworkWifiSubBullet6,
          ]),
          const SizedBox(height: 10),
          _Callout(
            title: loc.aboutNetworkWifiCalloutTitle,
            bullets: [
              loc.aboutNetworkWifiBullet1,
              loc.aboutNetworkWifiBullet2,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section6Switch extends StatelessWidget {
  const _Section6Switch();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.aboutNetworkToc6,
      icon: Icons.settings_ethernet,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.aboutNetworkSwitchCalloutTitle,
            bullets: [
              loc.aboutNetworkSwitchBullet1,
              loc.aboutNetworkSwitchBullet2,
              loc.aboutNetworkSwitchBullet3,
              loc.aboutNetworkSwitchBullet4,
            ],
          ),
          const SizedBox(height: 10),
          _Subtitle(loc.aboutNetworkSwitchSubtitle),
          _BulletList(items: [
            loc.aboutNetworkSwitchSubBullet1,
            loc.aboutNetworkSwitchSubBullet2,
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
      title: loc.aboutNetworkToc7,
      icon: Icons.schema,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Subtitle(loc.aboutNetworkDiagramsSubtitle1),
          const SizedBox(height: 10),
          const _DiagramBox(aspect: 16 / 6.8, painter: _VlanPainter()),
          const SizedBox(height: 14),
          _Subtitle(loc.aboutNetworkDiagramsSubtitle2),
          const SizedBox(height: 10),
          const _DiagramBox(aspect: 16 / 6.8, painter: _WifiVsWiredPainter()),
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
      title: loc.aboutNetworkToc8,
      icon: Icons.checklist,
      trailing: IconButton(
        tooltip: loc.aboutNetworkChecklistCopyTooltip,
        icon: const Icon(Icons.copy, color: Colors.white70),
        onPressed: onCopy,
      ),
      child: _Callout(
        title: loc.aboutNetworkChecklistTitle,
        bullets: [
          loc.aboutNetworkChecklistBullet1,
          loc.aboutNetworkChecklistBullet2,
          loc.aboutNetworkChecklistBullet3,
          loc.aboutNetworkChecklistBullet4,
          loc.aboutNetworkChecklistBullet5,
        ],
      ),
    );
  }
}

/// =======================
/// DIAGRAM BOX + ASSETS + PAINTERS + HELPERS
/// (inchangés depuis ton code)
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

class _VlanPainter extends CustomPainter {
  const _VlanPainter();

  @override
  void paint(Canvas canvas, Size size) {
    _grid(canvas, size);

    final stroke = Paint()
      ..color = Colors.white.withValues(alpha: 0.88)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final core = Offset(size.width * 0.35, size.height * 0.50);
    final light = Offset(size.width * 0.70, size.height * 0.35);
    final other = Offset(size.width * 0.70, size.height * 0.65);

    canvas.drawLine(core, light, stroke);
    canvas.drawLine(core, other, stroke);

    _box(canvas, size, core, 'Switch core\n(trunk)', accent: true);
    _box(canvas, size, light, 'VLAN lumière\n(Art-Net/sACN)', accent: true);
    _box(canvas, size, other, 'VLAN autre\n(internet/vidéo)', accent: false);

    final tp = _Text.tp(
      'Séparer le trafic = moins de surprises',
      fontSize: size.shortestSide * 0.060,
      color: Colors.white.withValues(alpha: 0.90),
      weight: FontWeight.w900,
    );
    _Text.paintLabel(canvas, Offset(size.width * 0.06, size.height * 0.80), tp);
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
    final w = size.width * 0.28;
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

class _IgmpPainter extends CustomPainter {
  const _IgmpPainter();

  @override
  void paint(Canvas canvas, Size size) {
    _grid(canvas, size);

    final stroke = Paint()
      ..color = Colors.white.withValues(alpha: 0.88)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final src = Offset(size.width * 0.14, size.height * 0.46);
    final sw = Offset(size.width * 0.40, size.height * 0.46);
    final rx1 = Offset(size.width * 0.86, size.height * 0.30);
    final rx2 = Offset(size.width * 0.86, size.height * 0.62);

    canvas.drawLine(src, sw, stroke);
    canvas.drawLine(sw, rx1, stroke);
    canvas.drawLine(sw, rx2, stroke);

    _box(canvas, size, src, 'Source\nmulticast', accent: false);
    _box(canvas, size, sw, 'Switch\nIGMP', accent: true);
    _box(canvas, size, rx1, 'Node RX\n(abonné)', accent: true);
    _box(canvas, size, rx2, 'Port inutile\n(non abonné)', accent: false);

    final tp = _Text.tp(
      'Avec IGMP: le port inutile ne reçoit pas',
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
    final w = size.width * 0.26;
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

class _WifiVsWiredPainter extends CustomPainter {
  const _WifiVsWiredPainter();

  @override
  void paint(Canvas canvas, Size size) {
    _grid(canvas, size);

    final stroke = Paint()
      ..color = Colors.white.withValues(alpha: 0.88)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final console = Offset(size.width * 0.18, size.height * 0.50);
    final sw = Offset(size.width * 0.45, size.height * 0.32);
    final ap = Offset(size.width * 0.45, size.height * 0.68);
    final node = Offset(size.width * 0.78, size.height * 0.50);

    canvas.drawLine(console, sw, stroke);
    canvas.drawLine(sw, node, stroke);

    final wifi = Paint()
      ..color = Colors.white.withValues(alpha: 0.45)
      ..strokeWidth = 2;
    _dashedLine(canvas, console, ap, wifi, dash: 8, gap: 6);
    _dashedLine(canvas, ap, node, wifi, dash: 8, gap: 6);

    _box(canvas, size, console, 'Console', accent: false);
    _box(canvas, size, sw, 'Filaire\nstable', accent: true);
    _box(canvas, size, ap, 'Wi-Fi\njitter', accent: false);
    _box(canvas, size, node, 'Node', accent: false);

    final tp = _Text.tp(
      'Filaire = stable\nWi-Fi = variable',
      fontSize: size.shortestSide * 0.060,
      color: Colors.white.withValues(alpha: 0.90),
      weight: FontWeight.w900,
    );
    _Text.paintLabel(canvas, Offset(size.width * 0.06, size.height * 0.80), tp);
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

  void _dashedLine(Canvas canvas, Offset a, Offset b, Paint paint,
      {double dash = 8, double gap = 6}) {
    final dx = b.dx - a.dx;
    final dy = b.dy - a.dy;
    final dist = math.sqrt(dx * dx + dy * dy);
    if (dist <= 0.001) return;
    final dir = Offset(dx / dist, dy / dist);

    double t = 0;
    while (t < dist) {
      final p1 = a + dir * t;
      final p2 = a + dir * (t + dash).clamp(0, dist);
      canvas.drawLine(p1, p2, paint);
      t += dash + gap;
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
      fontSize: size.shortestSide * 0.050,
      color: Colors.white.withValues(alpha: 0.95),
      weight: FontWeight.w900,
    );
    _Text.center(canvas, rect, tp);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

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
        fontSize: 14.5,
      ),
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
        fontSize: 13.5,
      ),
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
                  Text(
                    '•  ',
                    style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.80),
                        height: 1.35),
                  ),
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
              fontSize: 13.5,
            ),
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
      loc.aboutNetworkFooterNote,
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
          height: 1.15,
        ),
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
/// TOC
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
        tooltip: loc.aboutNetworkCopyTooltip,
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
                                fontWeight: FontWeight.w800,
                              ),
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
