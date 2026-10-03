import 'package:flutter/material.dart';

import '../../app/ui/widgets.dart'; // SectionCard, copyToClipboard
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'about_favorites.dart';

class AboutConversionsPage extends StatefulWidget {
  const AboutConversionsPage({super.key});

  @override
  State<AboutConversionsPage> createState() => _AboutConversionsPageState();
}

class _AboutConversionsPageState extends State<AboutConversionsPage> {
  final _scroll = ScrollController();

  final _kWhy = GlobalKey();
  final _kBpm = GlobalKey();
  final _kDmx = GlobalKey();
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
      appBar: AppBar(title: Text(loc.aboutConversionsPageTitle)),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          controller: _scroll,
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
          child: Column(
            children: [
              _TocCard(
                pageId: 'conversions_about',
                onCopy: () {
                  copyToClipboard(context, loc.conversionsRefTocCopyText);
                },
                items: [
                  _TocItem('why', loc.conversionsRefSection1Title, onTap: () => _goTo(_kWhy)),
                  _TocItem('bpm', loc.conversionsRefSection2Title, onTap: () => _goTo(_kBpm)),
                  _TocItem('dmx', loc.conversionsRefSection3Title, onTap: () => _goTo(_kDmx)),
                  _TocItem('checklist', loc.conversionsRefSection4Title, onTap: () => _goTo(_kChecklist)),
                ],
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kWhy),
              AboutSectionPin(
                pageId: 'conversions_about',
                sectionId: 'why',
                child: const _Section1Why(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kBpm),
              AboutSectionPin(
                pageId: 'conversions_about',
                sectionId: 'bpm',
                child: const _Section2Bpm(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kDmx),
              AboutSectionPin(
                pageId: 'conversions_about',
                sectionId: 'dmx',
                child: const _Section3Dmx(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kChecklist),
              AboutSectionPin(
                pageId: 'conversions_about',
                sectionId: 'checklist',
                child: _Section4Checklist(
                  onCopy: () {
                    copyToClipboard(context, loc.conversionsRefTocCopyText);
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
      icon: Icons.swap_horiz,
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

class _Section1Why extends StatelessWidget {
  const _Section1Why();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.conversionsRefSection1Title,
      icon: Icons.rule_folder_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Paragraph(loc.conversionsRefSection1Paragraph),
        ],
      ),
    );
  }
}

class _Section2Bpm extends StatelessWidget {
  const _Section2Bpm();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.conversionsRefSection2Title,
      icon: Icons.music_note_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.conversionsRefSection2FormulaTitle,
            bullet: [loc.conversionsRefSection2Formula1],
          ),
          const SizedBox(height: 10),
          _BulletList([
            loc.conversionsRefSection2Bullet1,
            loc.conversionsRefSection2Bullet2,
          ]),
        ],
      ),
    );
  }
}

class _Section3Dmx extends StatelessWidget {
  const _Section3Dmx();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.conversionsRefSection3Title,
      icon: Icons.percent_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _BulletList([
            loc.conversionsRefSection3Bullet1,
            loc.conversionsRefSection3Bullet2,
            loc.conversionsRefSection3Bullet3,
          ]),
        ],
      ),
    );
  }
}

class _Section4Checklist extends StatelessWidget {
  const _Section4Checklist({required this.onCopy});
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.conversionsRefSection4Title,
      icon: Icons.checklist,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _BulletList([
            loc.conversionsRefSection4Bullet1,
            loc.conversionsRefSection4Bullet2,
            loc.conversionsRefSection4Bullet3,
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
      loc.conversionsRefFooterNote,
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
