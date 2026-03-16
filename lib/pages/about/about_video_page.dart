import 'package:flutter/material.dart';

import '../../app/ui/widgets.dart'; // SectionCard, copyToClipboard
import '../../l10n_gen/app_localizations.dart';
import 'about_favorites.dart';

class AboutVideoPage extends StatefulWidget {
  const AboutVideoPage({super.key});

  @override
  State<AboutVideoPage> createState() => _AboutVideoPageState();
}

class _AboutVideoPageState extends State<AboutVideoPage> {
  final _scroll = ScrollController();

  final _kBasics = GlobalKey();
  final _kResFps = GlobalKey();
  final _kColor = GlobalKey();
  final _kSync = GlobalKey();
  final _kCables = GlobalKey();
  final _kSdi = GlobalKey();
  final _kHdmi = GlobalKey();
  final _kNdi = GlobalKey();
  final _kMappingLed = GlobalKey();
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
      appBar: AppBar(title: Text(loc.aboutVideoPageTitle)),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          controller: _scroll,
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
          child: Column(
            children: [
              _TocCard(
                pageId: 'video_about',
                onCopy: () {
                  copyToClipboard(context, loc.aboutVideoSummaryCopy.trim());
                },
                items: [
                  _TocItem('basics', loc.aboutVideoToc1, onTap: () => _goTo(_kBasics)),
                  _TocItem('res_fps', loc.aboutVideoToc2, onTap: () => _goTo(_kResFps)),
                  _TocItem('color', loc.aboutVideoToc3, onTap: () => _goTo(_kColor)),
                  _TocItem('sync', loc.aboutVideoToc4, onTap: () => _goTo(_kSync)),
                  _TocItem('cables', loc.aboutVideoToc5, onTap: () => _goTo(_kCables)),
                  _TocItem('sdi', loc.aboutVideoToc6, onTap: () => _goTo(_kSdi)),
                  _TocItem('hdmi', loc.aboutVideoToc7, onTap: () => _goTo(_kHdmi)),
                  _TocItem('ndi', loc.aboutVideoToc8, onTap: () => _goTo(_kNdi)),
                  _TocItem('mapping_led', loc.aboutVideoToc9,
                      onTap: () => _goTo(_kMappingLed)),
                  _TocItem('checklist', loc.aboutVideoToc10,
                      onTap: () => _goTo(_kChecklist)),
                ],
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kBasics),
              const _Section1Basics(),
              const SizedBox(height: 12),
              _Anchor(key: _kResFps),
              const _Section2ResFps(),
              const SizedBox(height: 12),
              _Anchor(key: _kColor),
              const _Section3Color(),
              const SizedBox(height: 12),
              _Anchor(key: _kSync),
              const _Section4Sync(),
              const SizedBox(height: 12),
              _Anchor(key: _kCables),
              const _Section5Cables(),
              const SizedBox(height: 12),
              _Anchor(key: _kSdi),
              const _Section6Sdi(),
              const SizedBox(height: 12),
              _Anchor(key: _kHdmi),
              const _Section7Hdmi(),
              const SizedBox(height: 12),
              _Anchor(key: _kNdi),
              const _Section8Ndi(),
              const SizedBox(height: 12),
              _Anchor(key: _kMappingLed),
              const _Section9Mapping(),
              const SizedBox(height: 12),
              _Anchor(key: _kChecklist),
              _Section10Checklist(
                onCopy: () {
                  copyToClipboard(context, loc.aboutVideoChecklistCopy.trim());
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
/// TOC (identique DMX)
/// =======================

class _TocCard extends StatelessWidget {
  const _TocCard({
    required this.pageId,required this.items, required this.onCopy});

  final String pageId;
  final List<_TocItem> items;
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.commonTocTitle,
      icon: Icons.menu_book,
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

/// =======================
/// SECTIONS (ouvertes) — inchangées
/// =======================

class _Section1Basics extends StatelessWidget {
  const _Section1Basics();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return AboutSectionPin(
      pageId: 'video_about',
      sectionId: 'basics',
      child: SectionCard(
      title: loc.aboutVideoToc1,
      icon: Icons.video_library,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Paragraph(loc.aboutVideoSection1Paragraph),
          const SizedBox(height: 10),
          _Callout(
            title: loc.aboutVideoSection1Title,
            bullets: [
              loc.aboutVideoSection1Bullet1,
              loc.aboutVideoSection1Bullet2,
              loc.aboutVideoSection1Bullet3,
              loc.aboutVideoSection1Bullet4,
              loc.aboutVideoSection1Bullet5,
            ],
          ),
        ],
      ),
    ),
    );
  }
}

class _Section2ResFps extends StatelessWidget {
  const _Section2ResFps();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return AboutSectionPin(
      pageId: 'video_about',
      sectionId: 'res_fps',
      child: SectionCard(
      title: loc.aboutVideoToc2,
      icon: Icons.aspect_ratio,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.aboutVideoSection2Title,
            bullets: [
              loc.aboutVideoSection2Bullet1,
              loc.aboutVideoSection2Bullet2,
              loc.aboutVideoSection2Bullet3,
              loc.aboutVideoSection2Bullet4,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.aboutVideoSection2Title2,
            bullets: [
              loc.aboutVideoSection2Bullet5,
              loc.aboutVideoSection2Bullet6,
              loc.aboutVideoSection2Bullet7,
            ],
          ),
        ],
      ),
    ),
    );
  }
}

class _Section3Color extends StatelessWidget {
  const _Section3Color();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return AboutSectionPin(
      pageId: 'video_about',
      sectionId: 'color',
      child: SectionCard(
      title: loc.aboutVideoToc3,
      icon: Icons.palette,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.aboutVideoSection3Title,
            bullets: [
              loc.aboutVideoSection3Bullet1,
              loc.aboutVideoSection3Bullet2,
              loc.aboutVideoSection3Bullet3,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.aboutVideoSection3Title2,
            bullets: [
              loc.aboutVideoSection3Bullet4,
              loc.aboutVideoSection3Bullet5,
            ],
          ),
        ],
      ),
    ),
    );
  }
}

class _Section4Sync extends StatelessWidget {
  const _Section4Sync();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return AboutSectionPin(
      pageId: 'video_about',
      sectionId: 'sync',
      child: SectionCard(
      title: loc.aboutVideoToc4,
      icon: Icons.sync,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.aboutVideoSection4Title,
            bullets: [
              loc.aboutVideoSection4Bullet1,
              loc.aboutVideoSection4Bullet2,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.aboutVideoSection4Title2,
            bullets: [
              loc.aboutVideoSection4Bullet3,
              loc.aboutVideoSection4Bullet4,
            ],
          ),
        ],
      ),
    ),
    );
  }
}

class _Section5Cables extends StatelessWidget {
  const _Section5Cables();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return AboutSectionPin(
      pageId: 'video_about',
      sectionId: 'cables',
      child: SectionCard(
      title: loc.aboutVideoToc5,
      icon: Icons.cable,
      child: _Callout(
        title: loc.aboutVideoSection5Title,
        bullets: [
          loc.aboutVideoSection5Bullet1,
          loc.aboutVideoSection5Bullet2,
          loc.aboutVideoSection5Bullet3,
        ],
      ),
    ),
    );
  }
}

class _Section6Sdi extends StatelessWidget {
  const _Section6Sdi();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return AboutSectionPin(
      pageId: 'video_about',
      sectionId: 'sdi',
      child: SectionCard(
      title: loc.aboutVideoToc6,
      icon: Icons.settings_input_hdmi,
      child: _Callout(
        title: loc.aboutVideoSection6Title,
        bullets: [
          loc.aboutVideoSection6Bullet1,
          loc.aboutVideoSection6Bullet2,
          loc.aboutVideoSection6Bullet3,
        ],
      ),
    ),
    );
  }
}

class _Section7Hdmi extends StatelessWidget {
  const _Section7Hdmi();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return AboutSectionPin(
      pageId: 'video_about',
      sectionId: 'hdmi',
      child: SectionCard(
      title: loc.aboutVideoToc7,
      icon: Icons.tv,
      child: _Callout(
        title: loc.aboutVideoSection7Title,
        bullets: [
          loc.aboutVideoSection7Bullet1,
          loc.aboutVideoSection7Bullet2,
          loc.aboutVideoSection7Bullet3,
        ],
      ),
    ),
    );
  }
}

class _Section8Ndi extends StatelessWidget {
  const _Section8Ndi();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return AboutSectionPin(
      pageId: 'video_about',
      sectionId: 'ndi',
      child: SectionCard(
      title: loc.aboutVideoToc8,
      icon: Icons.lan,
      child: _Callout(
        title: loc.aboutVideoSection8Title,
        bullets: [
          loc.aboutVideoSection8Bullet1,
          loc.aboutVideoSection8Bullet2,
          loc.aboutVideoSection8Bullet3,
        ],
      ),
    ),
    );
  }
}

class _Section9Mapping extends StatelessWidget {
  const _Section9Mapping();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return AboutSectionPin(
      pageId: 'video_about',
      sectionId: 'mapping_led',
      child: SectionCard(
      title: loc.aboutVideoToc9,
      icon: Icons.grid_view,
      child: _Callout(
        title: loc.aboutVideoSection9Title,
        bullets: [
          loc.aboutVideoSection9Bullet1,
          loc.aboutVideoSection9Bullet2,
          loc.aboutVideoSection9Bullet3,
        ],
      ),
    ),
    );
  }
}

class _Section10Checklist extends StatelessWidget {
  const _Section10Checklist({required this.onCopy});
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return AboutSectionPin(
      pageId: 'video_about',
      sectionId: 'checklist',
      child: SectionCard(
      title: loc.aboutVideoToc10,
      icon: Icons.checklist,
      child: _Callout(
        title: loc.aboutVideoChecklistTitle,
        bullets: [
          loc.aboutVideoChecklistBullet1,
          loc.aboutVideoChecklistBullet2,
          loc.aboutVideoChecklistBullet3,
        ],
      ),
    ),
    );
  }
}

/// =======================
/// HELPERS
/// =======================

class _Anchor extends StatelessWidget {
  const _Anchor({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox(height: 0);
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
                fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 8),
          ...bullets.map(
            (b) => Text(
              '• $b',
              style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.80), height: 1.35),
            ),
          ),
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
      loc.aboutVideoFooterNote,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white38, fontSize: 12),
    );
  }
}
