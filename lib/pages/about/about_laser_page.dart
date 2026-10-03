import 'package:flutter/material.dart';

import '../../app/ui/widgets.dart'; // SectionCard, copyToClipboard
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'about_favorites.dart';

class AboutLaserPage extends StatefulWidget {
  const AboutLaserPage({super.key});

  @override
  State<AboutLaserPage> createState() => _AboutLaserPageState();
}

class _AboutLaserPageState extends State<AboutLaserPage> {
  final _scroll = ScrollController();

  final _kBasics = GlobalKey();
  final _kDrawing = GlobalKey();
  final _kClasses = GlobalKey();
  final _kSafety = GlobalKey();
  final _kZones = GlobalKey();
  final _kChecklist = GlobalKey();

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
      alignment: 0.06,
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      appBar: AppBar(title: Text(loc.aboutLaserPageTitle)),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          controller: _scroll,
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
          child: Column(
            children: [
              _TocCard(
                pageId: 'laser_about',
                onCopy: () {
                  copyToClipboard(context, loc.laserRefTocCopyText);
                },
                items: [
                  _TocItem('basics', loc.laserRefSection1Title, onTap: () => _goTo(_kBasics)),
                  _TocItem('drawing', loc.laserRefSection2Title, onTap: () => _goTo(_kDrawing)),
                  _TocItem('classes', loc.laserRefSection3Title, onTap: () => _goTo(_kClasses)),
                  _TocItem('safety', loc.laserRefSection4Title, onTap: () => _goTo(_kSafety)),
                  _TocItem('zones', loc.laserRefSection5Title, onTap: () => _goTo(_kZones)),
                  _TocItem('checklist', loc.laserRefSection6Title, onTap: () => _goTo(_kChecklist)),
                ],
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kBasics),
              AboutSectionPin(
                pageId: 'laser_about',
                sectionId: 'basics',
                child: const _Section1Basics(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kDrawing),
              AboutSectionPin(
                pageId: 'laser_about',
                sectionId: 'drawing',
                child: const _Section2Drawing(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kClasses),
              AboutSectionPin(
                pageId: 'laser_about',
                sectionId: 'classes',
                child: const _Section3Classes(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kSafety),
              AboutSectionPin(
                pageId: 'laser_about',
                sectionId: 'safety',
                child: const _Section4Safety(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kZones),
              AboutSectionPin(
                pageId: 'laser_about',
                sectionId: 'zones',
                child: const _Section5Zones(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kChecklist),
              AboutSectionPin(
                pageId: 'laser_about',
                sectionId: 'checklist',
                child: _Section6Checklist(
                  onCopy: () {
                    copyToClipboard(context, loc.laserRefTocCopyText);
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
/// TOC
/// =======================

class _TocCard extends StatelessWidget {
  const _TocCard({
    required this.pageId,
    required this.items,
    required this.onCopy,
  });

  final String pageId;
  final List<_TocItem> items;
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: AppLocalizations.of(context).commonTocTitle,
      icon: Icons.bolt,
      child: Column(
        children: items
            .map(
              (it) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Material(
                  color: const Color(0xFF0E0E18),
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

/// =======================
/// SECTIONS
/// =======================

class _Section1Basics extends StatelessWidget {
  const _Section1Basics();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.laserRefSection1Title,
      icon: Icons.auto_awesome,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.laserRefSection1AcronymTitle,
            bullet: [loc.laserRefSection1AcronymBody],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.laserRefSection1HowTitle,
            bullet: [loc.laserRefSection1HowBody],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.laserRefSection1TypesTitle,
            bullet: [
              loc.laserRefSection1Type1,
              loc.laserRefSection1Type2,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section2Drawing extends StatelessWidget {
  const _Section2Drawing();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.laserRefSection2Title,
      icon: Icons.gesture,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Paragraph(loc.laserRefSection2Paragraph),
          const SizedBox(height: 10),
          _Callout(
            title: loc.laserRefSection2SpeedTitle,
            bullet: [
              loc.laserRefSection2Speed1,
              loc.laserRefSection2Speed2,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.laserRefSection2FieldTitle,
            bullet: [
              loc.laserRefSection2Field1,
              loc.laserRefSection2Field2,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section3Classes extends StatelessWidget {
  const _Section3Classes();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.laserRefSection3Title,
      icon: Icons.shield_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.laserRefSection3ClassesTitle,
            bullet: [
              loc.laserRefSection3Class1,
              loc.laserRefSection3Class2,
              loc.laserRefSection3Class3,
              loc.laserRefSection3Class4,
              loc.laserRefSection3Class5,
              loc.laserRefSection3Class6,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.laserRefSection3StandardsTitle,
            bullet: [
              loc.laserRefSection3Standard1,
              loc.laserRefSection3Standard2,
              loc.laserRefSection3Standard3,
            ],
          ),
          const SizedBox(height: 10),
          _Paragraph(loc.laserRefSection3FieldNote),
        ],
      ),
    );
  }
}

class _Section4Safety extends StatelessWidget {
  const _Section4Safety();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.laserRefSection4Title,
      icon: Icons.health_and_safety_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _BulletList([
            loc.laserRefSection4Bullet1,
            loc.laserRefSection4Bullet2,
            loc.laserRefSection4Bullet3,
            loc.laserRefSection4Bullet4,
            loc.laserRefSection4Bullet5,
            loc.laserRefSection4Bullet6,
          ]),
        ],
      ),
    );
  }
}

class _Section5Zones extends StatelessWidget {
  const _Section5Zones();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.laserRefSection5Title,
      icon: Icons.radar,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Paragraph(loc.laserRefSection5Paragraph),
          const SizedBox(height: 10),
          _Callout(
            title: loc.laserRefSection5NohdTitle,
            bullet: [loc.laserRefSection5NohdBody],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.laserRefSection5SzedTitle,
            bullet: [loc.laserRefSection5SzedBody],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.laserRefSection5CzedTitle,
            bullet: [loc.laserRefSection5CzedBody],
          ),
          const SizedBox(height: 10),
          _Paragraph(loc.laserRefSection5FieldNote),
        ],
      ),
    );
  }
}

class _Section6Checklist extends StatelessWidget {
  const _Section6Checklist({required this.onCopy});
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.laserRefSection6Title,
      icon: Icons.checklist,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _BulletList([
            loc.laserRefSection6Bullet1,
            loc.laserRefSection6Bullet2,
            loc.laserRefSection6Bullet3,
            loc.laserRefSection6Bullet4,
            loc.laserRefSection6Bullet5,
            loc.laserRefSection6Bullet6,
          ]),
        ],
      ),
    );
  }
}

/// =======================
/// UI bits
/// =======================

class _Anchor extends StatelessWidget {
  const _Anchor({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox(height: 1);
}

class _FooterNote extends StatelessWidget {
  const _FooterNote();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Text(
      loc.laserRefFooterNote,
      style:
          TextStyle(color: Colors.white.withValues(alpha: 0.55), height: 1.25),
    );
  }
}

class _Paragraph extends StatelessWidget {
  const _Paragraph(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(height: 1.25));
  }
}

class _Callout extends StatelessWidget {
  const _Callout({required this.title, required this.bullet});

  final String title;
  final List<String> bullet;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
          const SizedBox(height: 8),
          _BulletList(bullet),
        ],
      ),
    );
  }
}

class _BulletList extends StatelessWidget {
  const _BulletList(this.items);
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (t) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('•  ',
                      style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.85))),
                  Expanded(
                      child: Text(t, style: const TextStyle(height: 1.25))),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
