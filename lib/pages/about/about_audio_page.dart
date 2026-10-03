import 'package:flutter/material.dart';

import '../../app/ui/widgets.dart'; // SectionCard, copyToClipboard
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'about_favorites.dart';

class AboutAudioPage extends StatefulWidget {
  const AboutAudioPage({super.key});

  @override
  State<AboutAudioPage> createState() => _AboutAudioPageState();
}

class _AboutAudioPageState extends State<AboutAudioPage> {
  final _scroll = ScrollController();

  final _kBasics = GlobalKey();
  final _kSplDistance = GlobalKey();
  final _kDelayAlignment = GlobalKey();
  final _kSubsDirectivity = GlobalKey();
  final _kCabling = GlobalKey();
  final _kSafety = GlobalKey();
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
      appBar: AppBar(title: Text(loc.aboutAudioPageTitle)),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          controller: _scroll,
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
          child: Column(
            children: [
              _TocCard(
                pageId: 'audio_about',
                onCopy: () {
                  copyToClipboard(context, loc.audioRefTocCopyText);
                },
                items: [
                  _TocItem('basics', loc.audioRefSection1Title, onTap: () => _goTo(_kBasics)),
                  _TocItem('spl_distance', loc.audioRefSection2Title, onTap: () => _goTo(_kSplDistance)),
                  _TocItem('delay_alignment', loc.audioRefSection3Title, onTap: () => _goTo(_kDelayAlignment)),
                  _TocItem('subs_directivity', loc.audioRefSection4Title, onTap: () => _goTo(_kSubsDirectivity)),
                  _TocItem('cabling', loc.audioRefSection5Title, onTap: () => _goTo(_kCabling)),
                  _TocItem('safety', loc.audioRefSection6Title, onTap: () => _goTo(_kSafety)),
                  _TocItem('checklist', loc.audioRefSection7Title, onTap: () => _goTo(_kChecklist)),
                ],
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kBasics),
              AboutSectionPin(
                pageId: 'audio_about',
                sectionId: 'basics',
                child: const _Section1Basics(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kSplDistance),
              AboutSectionPin(
                pageId: 'audio_about',
                sectionId: 'spl_distance',
                child: const _Section2SplDistance(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kDelayAlignment),
              AboutSectionPin(
                pageId: 'audio_about',
                sectionId: 'delay_alignment',
                child: const _Section3DelayAlignment(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kSubsDirectivity),
              AboutSectionPin(
                pageId: 'audio_about',
                sectionId: 'subs_directivity',
                child: const _Section4SubsDirectivity(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kCabling),
              AboutSectionPin(
                pageId: 'audio_about',
                sectionId: 'cabling',
                child: const _Section5Cabling(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kSafety),
              AboutSectionPin(
                pageId: 'audio_about',
                sectionId: 'safety',
                child: const _Section6Safety(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kChecklist),
              AboutSectionPin(
                pageId: 'audio_about',
                sectionId: 'checklist',
                child: _Section7Checklist(
                  onCopy: () {
                    copyToClipboard(context, loc.audioRefTocCopyText);
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
      icon: Icons.speaker,
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
      title: loc.audioRefSection1Title,
      icon: Icons.graphic_eq,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.audioRefSection1FormulasTitle,
            bullet: [
              loc.audioRefSection1Formula1,
              loc.audioRefSection1Formula2,
              loc.audioRefSection1Formula3,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.audioRefSection1FieldMarksTitle,
            bullet: [
              loc.audioRefSection1FieldMark1,
              loc.audioRefSection1FieldMark2,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section2SplDistance extends StatelessWidget {
  const _Section2SplDistance();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.audioRefSection2Title,
      icon: Icons.social_distance,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.audioRefSection2FormulaTitle,
            bullet: [
              loc.audioRefSection2Formula1,
              loc.audioRefSection2Formula2,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.audioRefSection2NoteTitle,
            bullet: [
              loc.audioRefSection2Note1,
              loc.audioRefSection2Note2,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section3DelayAlignment extends StatelessWidget {
  const _Section3DelayAlignment();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.audioRefSection3Title,
      icon: Icons.timer_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Paragraph(loc.audioRefSection3Paragraph),
          const SizedBox(height: 10),
          _Callout(
            title: loc.audioRefSection3FormulaTitle,
            bullet: [loc.audioRefSection3Formula1],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.audioRefSection3TipsTitle,
            bullet: [
              loc.audioRefSection3Tip1,
              loc.audioRefSection3Tip2,
              loc.audioRefSection3Tip3,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section4SubsDirectivity extends StatelessWidget {
  const _Section4SubsDirectivity();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.audioRefSection4Title,
      icon: Icons.speaker_group,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Paragraph(loc.audioRefSection4Paragraph),
          const SizedBox(height: 10),
          _Callout(
            title: loc.audioRefSection4TypesTitle,
            bullet: [
              loc.audioRefSection4Type1,
              loc.audioRefSection4Type2,
              loc.audioRefSection4Type3,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section5Cabling extends StatelessWidget {
  const _Section5Cabling();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.audioRefSection5Title,
      icon: Icons.cable,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.audioRefSection5XlrTitle,
            bullet: [
              loc.audioRefSection5XlrBullet1,
              loc.audioRefSection5XlrBullet2,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.audioRefSection5SpeakonTitle,
            bullet: [
              loc.audioRefSection5SpeakonBullet1,
              loc.audioRefSection5SpeakonBullet2,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.audioRefSection5GroundTitle,
            bullet: [
              loc.audioRefSection5GroundBullet1,
              loc.audioRefSection5GroundBullet2,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section6Safety extends StatelessWidget {
  const _Section6Safety();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.audioRefSection6Title,
      icon: Icons.health_and_safety,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.audioRefSection6DontDoTitle,
            bullet: [
              loc.audioRefSection6DontDoBullet1,
              loc.audioRefSection6DontDoBullet2,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.audioRefSection6WarningTitle,
            bullet: [
              loc.audioRefSection6WarningBullet1,
              loc.audioRefSection6WarningBullet2,
              loc.audioRefSection6WarningBullet3,
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
      title: loc.audioRefSection7Title,
      icon: Icons.checklist,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Subtitle(loc.audioRefSection7QuickTitle),
          _BulletList(
            [
              loc.audioRefSection7Bullet1,
              loc.audioRefSection7Bullet2,
              loc.audioRefSection7Bullet3,
              loc.audioRefSection7Bullet4,
              loc.audioRefSection7Bullet5,
            ],
          ),
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
      loc.audioRefFooterNote,
      style:
          TextStyle(color: Colors.white.withValues(alpha: 0.55), height: 1.25),
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
      style: const TextStyle(fontWeight: FontWeight.w900),
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
