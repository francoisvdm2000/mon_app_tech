import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../app/ui/widgets.dart'; // SectionCard, ExpandSectionCard, MiniPill, copyToClipboard
import 'about_universe_to_artnet_table_page.dart';
import 'about_favorites.dart';

class AboutArtNetPage extends StatefulWidget {
  const AboutArtNetPage({super.key});

  @override
  State<AboutArtNetPage> createState() => _AboutArtNetPageState();
}

class _AboutArtNetPageState extends State<AboutArtNetPage> {
  final _scrollCtrl = ScrollController();

  final _k1Basics = GlobalKey();
  final _k2Addressing = GlobalKey();
  final _k3Limits = GlobalKey();
  final _k4NodesRdm = GlobalKey();
  final _k5Troubleshooting = GlobalKey();
  final _k6Diagrams = GlobalKey();
  final _k6bAssets = GlobalKey();
  final _k7Checklist = GlobalKey();

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
        title: Text(loc.aboutArtnetPageTitle),
      ),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          controller: _scrollCtrl,
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
          child: Column(
            children: [
              _TocCard(
                pageId: 'artnet',
                title: loc.aboutArtnetTocTitle,
                copyTooltip: loc.aboutArtnetTocCopyTooltip,
                onCopy: () {
                  final txt = [
                    loc.aboutArtnetCopyLine1,
                    loc.aboutArtnetCopyLine2,
                    loc.aboutArtnetCopyLine3,
                    loc.aboutArtnetCopyLine4,
                    loc.aboutArtnetCopyLine5,
                  ].join('\n');
                  copyToClipboard(context, txt);
                },
                items: [
                  _TocItem('basics', loc.aboutArtnetSection1Title,
                      onTap: () => _goTo(_k1Basics)),
                  _TocItem('addressing', loc.aboutArtnetSection2Title,
                      onTap: () => _goTo(_k2Addressing)),
                  _TocItem('limits', loc.aboutArtnetSection3Title,
                      onTap: () => _goTo(_k3Limits)),
                  _TocItem('nodes_rdm', loc.aboutArtnetSection4Title,
                      onTap: () => _goTo(_k4NodesRdm)),
                  _TocItem('troubleshooting', loc.aboutArtnetSection5Title,
                      onTap: () => _goTo(_k5Troubleshooting)),
                  _TocItem('diagrams', loc.aboutArtnetSection6Title,
                      onTap: () => _goTo(_k6Diagrams)),
                  _TocItem('assets', loc.aboutArtnetSection6bTitle,
                      onTap: () => _goTo(_k6bAssets)),
                  _TocItem('checklist', loc.aboutArtnetSection7Title,
                      onTap: () => _goTo(_k7Checklist)),
                  _TocItem(
                    'conversion_tables',
                    loc.aboutArtnetConversionTablesTitle,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) =>
                                const AboutUniverseToArtNetTablePage()),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _Anchor(key: _k1Basics),
              AboutSectionPin(
                pageId: 'artnet',
                sectionId: 'basics',
                child: const _Section1Basics(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _k2Addressing),
              AboutSectionPin(
                pageId: 'artnet',
                sectionId: 'addressing',
                child: const _Section2Addressing(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _k3Limits),
              AboutSectionPin(
                pageId: 'artnet',
                sectionId: 'limits',
                child: const _Section3Limits(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _k4NodesRdm),
              AboutSectionPin(
                pageId: 'artnet',
                sectionId: 'nodes_rdm',
                child: const _Section4NodesRdm(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _k5Troubleshooting),
              AboutSectionPin(
                pageId: 'artnet',
                sectionId: 'troubleshooting',
                child: const _Section5Troubleshooting(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _k6Diagrams),
              AboutSectionPin(
                pageId: 'artnet',
                sectionId: 'diagrams',
                child: const _Section6Diagrams(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _k6bAssets),
              AboutSectionPin(
                pageId: 'artnet',
                sectionId: 'assets',
                child: _Section6bAssets(
                onCopy: () {
                  final txt = '''
${loc.aboutArtnetAssetsCopyTitle}
- assets/images/connectors/rj45.png
- assets/images/network/switch.png
- assets/images/cables/ethernet_cat5e_cat6.png
- assets/images/cables/ethernet_short_patch.png

pubspec.yaml (${loc.aboutArtnetExampleLabel})
flutter:
  assets:
    - assets/images/connectors/
    - assets/images/network/
    - assets/images/cables/
'''
                      .trim();
                  copyToClipboard(context, txt);
                },
              ),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _k7Checklist),
              AboutSectionPin(
                pageId: 'artnet',
                sectionId: 'checklist',
                child: _Section7Checklist(
                onCopy: () {
                  final txt = '''
${loc.aboutArtnetChecklistCopyTitle}
☐ ${loc.aboutArtnetChecklistBullet1}
☐ ${loc.aboutArtnetChecklistBullet2}
☐ ${loc.aboutArtnetChecklistBullet3}
☐ ${loc.aboutArtnetChecklistBullet4}
☐ ${loc.aboutArtnetChecklistBullet5}
☐ ${loc.aboutArtnetChecklistBullet6}
'''
                      .trim();
                  copyToClipboard(context, txt);
                },
              ),
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
/// SECTIONS
/// =======================

class _Section1Basics extends StatelessWidget {
  const _Section1Basics();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.aboutArtnetSection1Title,
      icon: Icons.router,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              MiniPill(loc.aboutArtnetPillUdp),
              MiniPill(loc.aboutArtnetPillUniversIp),
              MiniPill(loc.aboutArtnetPillNodesDmxOut),
            ],
          ),
          const SizedBox(height: 10),
          _Paragraph(loc.aboutArtnetSection1Paragraph),
          const SizedBox(height: 10),
          _Callout(
            title: loc.aboutArtnetSection1CalloutTitle,
            bullets: [
              loc.aboutArtnetSection1Bullet1,
              loc.aboutArtnetSection1Bullet2,
              loc.aboutArtnetSection1Bullet3,
            ],
          ),
          const SizedBox(height: 10),
          _Subtitle(loc.aboutArtnetSection1Subtitle),
          _BulletList(
            items: [
              loc.aboutArtnetSection1SubBullet1,
              loc.aboutArtnetSection1SubBullet2,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section2Addressing extends StatelessWidget {
  const _Section2Addressing();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.aboutArtnetSection2Title,
      icon: Icons.map,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              MiniPill(loc.aboutArtnetSection2PillUniverse),
              MiniPill(loc.aboutArtnetSection2PillNodePort),
              MiniPill(loc.aboutArtnetSection2PillMapping),
            ],
          ),
          const SizedBox(height: 10),
          _Paragraph(loc.aboutArtnetSection2Paragraph),
          const SizedBox(height: 10),
          _Callout(
            title: loc.aboutArtnetSection2CalloutTitle,
            bullets: [
              loc.aboutArtnetSection2Bullet1,
              loc.aboutArtnetSection2Bullet2,
              loc.aboutArtnetSection2Bullet3,
            ],
          ),
          const SizedBox(height: 10),
          _Subtitle(loc.aboutArtnetSection2Subtitle1),
          _BulletList(
            items: [
              loc.aboutArtnetSection2SubBullet1,
              loc.aboutArtnetSection2SubBullet2,
              loc.aboutArtnetSection2SubBullet3,
            ],
          ),
          const SizedBox(height: 10),
          _Subtitle(loc.aboutArtnetSection2Subtitle2),
          _BulletList(
            items: [
              loc.aboutArtnetSection2SubBullet4,
              loc.aboutArtnetSection2SubBullet5,
              loc.aboutArtnetSection2SubBullet6,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section3Limits extends StatelessWidget {
  const _Section3Limits();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.aboutArtnetSection3Title,
      icon: Icons.speed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.aboutArtnetSection3CalloutTitle,
            bullets: [
              loc.aboutArtnetSection3Bullet1,
              loc.aboutArtnetSection3Bullet2,
              loc.aboutArtnetSection3Bullet3,
              loc.aboutArtnetSection3Bullet4,
              loc.aboutArtnetSection3Bullet5,
            ],
          ),
          const SizedBox(height: 10),
          _Subtitle(loc.aboutArtnetSection3Subtitle1),
          _BulletList(
            items: [
              loc.aboutArtnetSection3SubBullet1,
              loc.aboutArtnetSection3SubBullet2,
              loc.aboutArtnetSection3SubBullet3,
            ],
          ),
          const SizedBox(height: 10),
          _Subtitle(loc.aboutArtnetSection3Subtitle2),
          _BulletList(
            items: [
              loc.aboutArtnetSection3SubBullet4,
              loc.aboutArtnetSection3SubBullet5,
              loc.aboutArtnetSection3SubBullet6,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section4NodesRdm extends StatelessWidget {
  const _Section4NodesRdm();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.aboutArtnetSection4Title,
      icon: Icons.device_hub,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Paragraph(loc.aboutArtnetSection4Paragraph),
          const SizedBox(height: 10),
          _Subtitle(loc.aboutArtnetSection4Subtitle1),
          _BulletList(
            items: [
              loc.aboutArtnetSection4SubBullet1,
              loc.aboutArtnetSection4SubBullet2,
              loc.aboutArtnetSection4SubBullet3,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.aboutArtnetSection4CalloutTitle,
            bullets: [
              loc.aboutArtnetSection4Bullet1,
              loc.aboutArtnetSection4Bullet2,
              loc.aboutArtnetSection4Bullet3,
              loc.aboutArtnetSection4Bullet4,
            ],
          ),
          const SizedBox(height: 10),
          _Subtitle(loc.aboutArtnetSection4Subtitle2),
          _BulletList(
            items: [
              loc.aboutArtnetSection4SubBullet4,
              loc.aboutArtnetSection4SubBullet5,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section5Troubleshooting extends StatelessWidget {
  const _Section5Troubleshooting();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.aboutArtnetSection5Title,
      icon: Icons.bug_report,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.aboutArtnetSection5CalloutTitle,
            bullets: [
              loc.aboutArtnetSection5Bullet1,
              loc.aboutArtnetSection5Bullet2,
              loc.aboutArtnetSection5Bullet3,
              loc.aboutArtnetSection5Bullet4,
              loc.aboutArtnetSection5Bullet5,
            ],
          ),
          const SizedBox(height: 10),
          _Subtitle(loc.aboutArtnetSection5Subtitle),
          _BulletList(
            items: [
              loc.aboutArtnetSection5SubBullet1,
              loc.aboutArtnetSection5SubBullet2,
              loc.aboutArtnetSection5SubBullet3,
              loc.aboutArtnetSection5SubBullet4,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section6Diagrams extends StatelessWidget {
  const _Section6Diagrams();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.aboutArtnetSection6Title,
      icon: Icons.schema,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Subtitle(loc.aboutArtnetSection6Subtitle1),
          const SizedBox(height: 10),
          _DiagramBox(
            painter: _ArtNetTopologyPainter(
              sourceLabel: loc.aboutArtnetDiagramSourceLabel,
              switchLabel: loc.aboutArtnetDiagramSwitchLabel,
              node1Label: loc.aboutArtnetDiagramNode1Label,
              node2Label: loc.aboutArtnetDiagramNode2Label,
              fixLabel: loc.aboutArtnetDiagramFixLabel,
              infoLabel: loc.aboutArtnetDiagramInfoLabel,
            ),
          ),
          const SizedBox(height: 14),
          _Subtitle(loc.aboutArtnetSection6Subtitle2),
          const SizedBox(height: 10),
          _DiagramBox(
            aspect: 16 / 6.8,
            painter: _UnicastBroadcastPainter(
              sourceLabel: loc.aboutArtnetDiagramSourceShortLabel,
              switchLabel: loc.aboutArtnetDiagramSwitchLabel,
              nodeALabel: loc.aboutArtnetDiagramNodeALabel,
              nodeBLabel: loc.aboutArtnetDiagramNodeBLabel,
              nodeCLabel: loc.aboutArtnetDiagramNodeCLabel,
              unicastLabel: loc.aboutArtnetDiagramUnicastLabel,
              broadcastLabel: loc.aboutArtnetDiagramBroadcastLabel,
            ),
          ),
        ],
      ),
    );
  }
}

class _Section6bAssets extends StatelessWidget {
  const _Section6bAssets({required this.onCopy});
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return ExpandSectionCard(
      title: loc.aboutArtnetSection6bTitle,
      icon: Icons.image_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Paragraph(loc.aboutArtnetAssetsParagraph),
          const SizedBox(height: 10),
          _Subtitle(loc.aboutArtnetAssetsExamplesTitle),
          const SizedBox(height: 10),
          _AssetRow(
            items: [
              _AssetSpec(
                label: loc.aboutArtnetAssetsRj45Label,
                assetPath: 'assets/images/connectors/rj45.png',
                hint: loc.aboutArtnetAssetsRj45Hint,
              ),
              _AssetSpec(
                label: loc.aboutArtnetAssetsSwitchLabel,
                assetPath: 'assets/images/network/switch.png',
                hint: loc.aboutArtnetAssetsSwitchHint,
              ),
              _AssetSpec(
                label: loc.aboutArtnetAssetsCableLabel,
                assetPath: 'assets/images/cables/ethernet_cat5e_cat6.png',
                hint: loc.aboutArtnetAssetsCableHint,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Section7Checklist extends StatelessWidget {
  const _Section7Checklist({required this.onCopy});
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.aboutArtnetSection7Title,
      icon: Icons.checklist,
      child: _Callout(
        title: loc.aboutArtnetChecklistTitle,
        bullets: [
          loc.aboutArtnetChecklistBullet1,
          loc.aboutArtnetChecklistBullet2,
          loc.aboutArtnetChecklistBullet3,
          loc.aboutArtnetChecklistBullet4,
          loc.aboutArtnetChecklistBullet5,
        ],
      ),
    );
  }
}

/// =======================
/// TOC + SMALL UI
/// =======================

class _TocCard extends StatelessWidget {
  const _TocCard({
    required this.pageId,
    required this.title,
    required this.copyTooltip,
    required this.items,
    required this.onCopy,
  });

  final String title;
  final String copyTooltip;
  final String pageId;
final List<_TocItem> items;
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: title,
      icon: Icons.list_alt,
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
                          AboutPinButton(
                            pageId: pageId,
                            sectionId: it.sectionId,
                            dense: true,
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
  _TocItem(this.sectionId, this.label, {required this.onTap});
  final String sectionId;
  final String label;
  final VoidCallback onTap;
}

class _Anchor extends StatelessWidget {
  const _Anchor({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox(height: 0);
}

class _FooterNote extends StatelessWidget {
  const _FooterNote();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Text(
      loc.aboutArtnetFooterNote,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white38, fontSize: 12, height: 1.35),
    );
  }
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
                        fontSize: 13.5,
                      ),
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

/// =======================
/// DIAGRAMS
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

class _ArtNetTopologyPainter extends CustomPainter {
  const _ArtNetTopologyPainter({
    required this.sourceLabel,
    required this.switchLabel,
    required this.node1Label,
    required this.node2Label,
    required this.fixLabel,
    required this.infoLabel,
  });

  final String sourceLabel;
  final String switchLabel;
  final String node1Label;
  final String node2Label;
  final String fixLabel;
  final String infoLabel;

  @override
  void paint(Canvas canvas, Size size) {
    _Grid.paint(canvas, size);

    final stroke = Paint()
      ..color = Colors.white.withValues(alpha: 0.88)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final console = Offset(size.width * 0.16, size.height * 0.32);
    final sw = Offset(size.width * 0.42, size.height * 0.32);
    final node1 = Offset(size.width * 0.70, size.height * 0.22);
    final node2 = Offset(size.width * 0.70, size.height * 0.52);

    canvas.drawLine(console, sw, stroke);
    canvas.drawLine(sw, node1, stroke);
    canvas.drawLine(sw, node2, stroke);

    final dmxStroke = Paint()
      ..color = Colors.white.withValues(alpha: 0.45)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final fix1 = Offset(size.width * 0.88, size.height * 0.16);
    final fix2 = Offset(size.width * 0.88, size.height * 0.28);
    final fix3 = Offset(size.width * 0.88, size.height * 0.46);
    final fix4 = Offset(size.width * 0.88, size.height * 0.58);

    canvas.drawLine(node1, fix1, dmxStroke);
    canvas.drawLine(node1, fix2, dmxStroke);
    canvas.drawLine(node2, fix3, dmxStroke);
    canvas.drawLine(node2, fix4, dmxStroke);

    _Box.draw(canvas, size, console, sourceLabel, accent: false);
    _Box.draw(canvas, size, sw, switchLabel, accent: true);
    _Box.draw(canvas, size, node1, node1Label, accent: false);
    _Box.draw(canvas, size, node2, node2Label, accent: false);

    _Box.small(canvas, size, fix1, fixLabel);
    _Box.small(canvas, size, fix2, fixLabel);
    _Box.small(canvas, size, fix3, fixLabel);
    _Box.small(canvas, size, fix4, fixLabel);

    _Text.paintLabel(
      canvas,
      Offset(size.width * 0.08, size.height * 0.70),
      _Text.tp(
        infoLabel,
        fontSize: size.shortestSide * 0.065,
        color: Colors.white.withValues(alpha: 0.90),
        weight: FontWeight.w900,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _UnicastBroadcastPainter extends CustomPainter {
  const _UnicastBroadcastPainter({
    required this.sourceLabel,
    required this.switchLabel,
    required this.nodeALabel,
    required this.nodeBLabel,
    required this.nodeCLabel,
    required this.unicastLabel,
    required this.broadcastLabel,
  });

  final String sourceLabel;
  final String switchLabel;
  final String nodeALabel;
  final String nodeBLabel;
  final String nodeCLabel;
  final String unicastLabel;
  final String broadcastLabel;

  @override
  void paint(Canvas canvas, Size size) {
    _Grid.paint(canvas, size);

    final stroke = Paint()
      ..color = Colors.white.withValues(alpha: 0.88)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final faintStroke = Paint()
      ..color = Colors.white.withValues(alpha: 0.35)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final src = Offset(size.width * 0.14, size.height * 0.50);
    final sw = Offset(size.width * 0.40, size.height * 0.50);

    final n1 = Offset(size.width * 0.70, size.height * 0.25);
    final n2 = Offset(size.width * 0.70, size.height * 0.50);
    final n3 = Offset(size.width * 0.70, size.height * 0.75);

    canvas.drawLine(src, sw, stroke);
    canvas.drawLine(sw, n1, faintStroke);
    canvas.drawLine(sw, n2, stroke);
    canvas.drawLine(sw, n3, faintStroke);

    _Box.draw(canvas, size, src, sourceLabel, accent: false);
    _Box.draw(canvas, size, sw, switchLabel, accent: true);
    _Box.draw(canvas, size, n1, nodeALabel, accent: false);
    _Box.draw(canvas, size, n2, nodeBLabel, accent: false);
    _Box.draw(canvas, size, n3, nodeCLabel, accent: false);

    _Text.paintLabel(
      canvas,
      Offset(size.width * 0.06, size.height * 0.10),
      _Text.tp(
        unicastLabel,
        fontSize: size.shortestSide * 0.055,
        color: Colors.white.withValues(alpha: 0.90),
        weight: FontWeight.w900,
      ),
    );
    _Text.paintLabel(
      canvas,
      Offset(size.width * 0.06, size.height * 0.80),
      _Text.tp(
        broadcastLabel,
        fontSize: size.shortestSide * 0.055,
        color: Colors.white.withValues(alpha: 0.85),
        weight: FontWeight.w900,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// =======================
/// ASSETS UI (fallback)
/// =======================

class _AssetSpec {
  const _AssetSpec(
      {required this.label, required this.assetPath, required this.hint});
  final String label;
  final String assetPath;
  final String hint;
}

class _AssetRow extends StatelessWidget {
  const _AssetRow({required this.items});
  final List<_AssetSpec> items;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, c) {
        final isNarrow = c.maxWidth < 520;
        if (isNarrow) {
          return Column(
            children: items
                .map(
                  (it) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _AssetTile(spec: it),
                  ),
                )
                .toList(),
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < items.length; i++) ...[
              Expanded(child: _AssetTile(spec: items[i])),
              if (i != items.length - 1) const SizedBox(width: 10),
            ],
          ],
        );
      },
    );
  }
}

class _AssetTile extends StatelessWidget {
  const _AssetTile({required this.spec});
  final _AssetSpec spec;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

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
            spec.label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.92),
              fontWeight: FontWeight.w900,
              fontSize: 13.5,
            ),
          ),
          const SizedBox(height: 8),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white12),
                ),
                child: Image.asset(
                  spec.assetPath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stack) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.image_not_supported,
                              color: Colors.white.withValues(alpha: 0.45)),
                          const SizedBox(height: 6),
                          Text(
                            loc.aboutArtnetMissingAssetLabel,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.65),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            spec.hint,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.78),
              height: 1.25,
              fontSize: 12.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            spec.assetPath,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 11.8,
              color: Colors.white.withValues(alpha: 0.55),
            ),
          ),
        ],
      ),
    );
  }
}

/// =======================
/// PAINTER HELPERS
/// =======================

class _Grid {
  static void paint(Canvas canvas, Size size) {
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
}

class _Box {
  static void draw(Canvas canvas, Size size, Offset center, String label,
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
      fontSize: size.shortestSide * 0.055,
      color: Colors.white.withValues(alpha: 0.95),
      weight: FontWeight.w900,
    );
    _Text.center(canvas, rect, tp);
  }

  static void small(Canvas canvas, Size size, Offset center, String label) {
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
    );
    t.layout();
    return t;
  }

  static void center(Canvas canvas, Rect rect, TextPainter tp) {
    tp.paint(
      canvas,
      Offset(rect.left + (rect.width - tp.width) / 2,
          rect.top + (rect.height - tp.height) / 2),
    );
  }

  static void paintLabel(Canvas canvas, Offset pos, TextPainter tp) {
    const pad = 10.0;
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
