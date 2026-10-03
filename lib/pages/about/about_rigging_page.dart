import 'package:flutter/material.dart';

import '../../app/ui/widgets.dart'; // SectionCard, copyToClipboard
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'about_favorites.dart';

class AboutRiggingPage extends StatefulWidget {
  const AboutRiggingPage({super.key});

  @override
  State<AboutRiggingPage> createState() => _AboutRiggingPageState();
}

class _AboutRiggingPageState extends State<AboutRiggingPage> {
  final _scroll = ScrollController();

  final _kBasics = GlobalKey();
  final _kBridle = GlobalKey();
  final _kAngleFactor = GlobalKey();
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
      appBar: AppBar(title: Text(loc.aboutRiggingPageTitle)),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          controller: _scroll,
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
          child: Column(
            children: [
              _TocCard(
                pageId: 'rigging_about',
                onCopy: () {
                  copyToClipboard(context, loc.riggingRefTocCopyText);
                },
                items: [
                  _TocItem('basics', loc.riggingRefSection1Title, onTap: () => _goTo(_kBasics)),
                  _TocItem('bridle', loc.riggingRefSection2Title, onTap: () => _goTo(_kBridle)),
                  _TocItem('angle_factor', loc.riggingRefSection3Title, onTap: () => _goTo(_kAngleFactor)),
                  _TocItem('checklist', loc.riggingRefSection4Title, onTap: () => _goTo(_kChecklist)),
                ],
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kBasics),
              AboutSectionPin(
                pageId: 'rigging_about',
                sectionId: 'basics',
                child: const _Section1Basics(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kBridle),
              AboutSectionPin(
                pageId: 'rigging_about',
                sectionId: 'bridle',
                child: const _Section2Bridle(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kAngleFactor),
              AboutSectionPin(
                pageId: 'rigging_about',
                sectionId: 'angle_factor',
                child: const _Section3AngleFactor(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kChecklist),
              AboutSectionPin(
                pageId: 'rigging_about',
                sectionId: 'checklist',
                child: _Section4Checklist(
                  onCopy: () {
                    copyToClipboard(context, loc.riggingRefTocCopyText);
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
      icon: Icons.hardware_rounded,
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
      title: loc.riggingRefSection1Title,
      icon: Icons.verified_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _BulletList([
            loc.riggingRefSection1Bullet1,
            loc.riggingRefSection1Bullet2,
            loc.riggingRefSection1Bullet3,
          ]),
        ],
      ),
    );
  }
}

class _Section2Bridle extends StatelessWidget {
  const _Section2Bridle();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.riggingRefSection2Title,
      icon: Icons.account_tree_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _BulletList([
            loc.riggingRefSection2Bullet1,
            loc.riggingRefSection2Bullet2,
            loc.riggingRefSection2Bullet3,
          ]),
        ],
      ),
    );
  }
}

class _Section3AngleFactor extends StatelessWidget {
  const _Section3AngleFactor();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.riggingRefSection3Title,
      icon: Icons.call_split_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.riggingRefSection3FormulaTitle,
            bullet: [loc.riggingRefSection3Formula1],
          ),
          const SizedBox(height: 10),
          _BulletList([
            loc.riggingRefSection3Bullet1,
            loc.riggingRefSection3Bullet2,
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
      title: loc.riggingRefSection4Title,
      icon: Icons.checklist,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _BulletList([
            loc.riggingRefSection4Bullet1,
            loc.riggingRefSection4Bullet2,
            loc.riggingRefSection4Bullet3,
            loc.riggingRefSection4Bullet4,
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
      loc.riggingRefFooterNote,
      style:
          TextStyle(color: Colors.white.withValues(alpha: 0.55), height: 1.25),
    );
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
