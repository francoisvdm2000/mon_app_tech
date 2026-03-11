import 'package:flutter/material.dart';

import '../../app/ui/widgets.dart'; // SectionCard, copyToClipboard
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

class AboutReseauPage extends StatefulWidget {
  const AboutReseauPage({super.key});

  @override
  State<AboutReseauPage> createState() => _AboutReseauPageState();
}

class _AboutReseauPageState extends State<AboutReseauPage> {
  final _scroll = ScrollController();

  final _kBasics = GlobalKey();
  final _kRj45 = GlobalKey();
  final _kPoE = GlobalKey();
  final _kFiber = GlobalKey();
  final _kSfp = GlobalKey();
  final _kSwitch = GlobalKey();
  final _kArtNetSacn = GlobalKey();
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
      appBar: AppBar(title: Text(loc.aboutReseauPageTitle)),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          controller: _scroll,
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
          child: Column(
            children: [
              _TocCard(
                onCopy: () {
                  final txt = loc.aboutReseauSummaryCopy.trim();
                  copyToClipboard(context, txt);
                },
                items: [
                  _TocItem(loc.aboutReseauToc1, onTap: () => _goTo(_kBasics)),
                  _TocItem(loc.aboutReseauToc2, onTap: () => _goTo(_kRj45)),
                  _TocItem(loc.aboutReseauToc3, onTap: () => _goTo(_kPoE)),
                  _TocItem(loc.aboutReseauToc4, onTap: () => _goTo(_kFiber)),
                  _TocItem(loc.aboutReseauToc5, onTap: () => _goTo(_kSfp)),
                  _TocItem(loc.aboutReseauToc6, onTap: () => _goTo(_kSwitch)),
                  _TocItem(loc.aboutReseauToc7,
                      onTap: () => _goTo(_kArtNetSacn)),
                  _TocItem(loc.aboutReseauToc8,
                      onTap: () => _goTo(_kChecklist)),
                ],
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kBasics),
              const _Section1Basics(),
              const SizedBox(height: 12),
              _Anchor(key: _kRj45),
              const _Section2Rj45(),
              const SizedBox(height: 12),
              _Anchor(key: _kPoE),
              const _Section3Poe(),
              const SizedBox(height: 12),
              _Anchor(key: _kFiber),
              const _Section4Fiber(),
              const SizedBox(height: 12),
              _Anchor(key: _kSfp),
              const _Section5Sfp(),
              const SizedBox(height: 12),
              _Anchor(key: _kSwitch),
              const _Section6Switch(),
              const SizedBox(height: 12),
              _Anchor(key: _kArtNetSacn),
              const _Section7ArtNetSacn(),
              const SizedBox(height: 12),
              _Anchor(key: _kChecklist),
              _Section8Checklist(
                onCopy: () {
                  final txt = loc.aboutReseauChecklistCopy.trim();
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
/// TOC (style DMX)
/// =======================

class _TocCard extends StatelessWidget {
  const _TocCard({
    required this.items,
    required this.onCopy,
  });

  final List<_TocItem> items;
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.commonTocTitle,
      icon: Icons.router,
      trailing: IconButton(
        tooltip: loc.commonCopySummaryTooltip,
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

/// =======================
/// SECTIONS (tuiles ouvertes) — inchangées
/// =======================

class _Section1Basics extends StatelessWidget {
  const _Section1Basics();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.aboutReseauToc1,
      icon: Icons.lan,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.aboutReseauSection1Title,
            bullets: [
              loc.aboutReseauSection1Bullet1,
              loc.aboutReseauSection1Bullet2,
              loc.aboutReseauSection1Bullet3,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.aboutReseauSection1Title2,
            bullets: [
              loc.aboutReseauSection1Bullet4,
              loc.aboutReseauSection1Bullet5,
              loc.aboutReseauSection1Bullet6,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section2Rj45 extends StatelessWidget {
  const _Section2Rj45();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.aboutReseauToc2,
      icon: Icons.settings_ethernet,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.aboutReseauSection2Title,
            bullets: [
              loc.aboutReseauSection2Bullet1,
              loc.aboutReseauSection2Bullet2,
              loc.aboutReseauSection2Bullet3,
              loc.aboutReseauSection2Bullet4,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.aboutReseauSection2Title2,
            bullets: [
              loc.aboutReseauSection2Bullet5,
              loc.aboutReseauSection2Bullet6,
              loc.aboutReseauSection2Bullet7,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section3Poe extends StatelessWidget {
  const _Section3Poe();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.aboutReseauToc3,
      icon: Icons.power,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Paragraph(loc.aboutReseauSection3Paragraph),
          const SizedBox(height: 10),
          _Callout(
            title: loc.aboutReseauSection3Title,
            bullets: [
              loc.aboutReseauSection3Bullet1,
              loc.aboutReseauSection3Bullet2,
              loc.aboutReseauSection3Bullet3,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section4Fiber extends StatelessWidget {
  const _Section4Fiber();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.aboutReseauToc4,
      icon: Icons.cable,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.aboutReseauSection4Title,
            bullets: [
              loc.aboutReseauSection4Bullet1,
              loc.aboutReseauSection4Bullet2,
              loc.aboutReseauSection4Bullet3,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.aboutReseauSection4Title2,
            bullets: [
              loc.aboutReseauSection4Bullet4,
              loc.aboutReseauSection4Bullet5,
              loc.aboutReseauSection4Bullet6,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.aboutReseauSection4Title3,
            bullets: [
              loc.aboutReseauSection4Bullet7,
              loc.aboutReseauSection4Bullet8,
              loc.aboutReseauSection4Bullet9,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section5Sfp extends StatelessWidget {
  const _Section5Sfp();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.aboutReseauToc5,
      icon: Icons.memory,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.aboutReseauSection5Title,
            bullets: [
              loc.aboutReseauSection5Bullet1,
              loc.aboutReseauSection5Bullet2,
              loc.aboutReseauSection5Bullet3,
              loc.aboutReseauSection5Bullet4,
            ],
          ),
          const SizedBox(height: 10),
          _Paragraph(loc.aboutReseauSection5Paragraph),
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
      title: loc.aboutReseauToc6,
      icon: Icons.hub,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.aboutReseauSection6Title,
            bullets: [
              loc.aboutReseauSection6Bullet1,
              loc.aboutReseauSection6Bullet2,
              loc.aboutReseauSection6Bullet3,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.aboutReseauSection6Title2,
            bullets: [
              loc.aboutReseauSection6Bullet4,
              loc.aboutReseauSection6Bullet5,
              loc.aboutReseauSection6Bullet6,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section7ArtNetSacn extends StatelessWidget {
  const _Section7ArtNetSacn();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.aboutReseauToc7,
      icon: Icons.lightbulb_outline,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.aboutReseauSection7Title,
            bullets: [
              loc.aboutReseauSection7Bullet1,
              loc.aboutReseauSection7Bullet2,
              loc.aboutReseauSection7Bullet3,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.aboutReseauSection7Title2,
            bullets: [
              loc.aboutReseauSection7Bullet4,
              loc.aboutReseauSection7Bullet5,
              loc.aboutReseauSection7Bullet6,
            ],
          ),
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
      title: loc.aboutReseauToc8,
      icon: Icons.checklist,
      trailing: IconButton(
        tooltip: loc.aboutReseauChecklistCopyTooltip,
        icon: const Icon(Icons.copy, color: Colors.white70),
        onPressed: onCopy,
      ),
      child: _Callout(
        title: loc.aboutReseauChecklistTitle,
        bullets: [
          loc.aboutReseauChecklistBullet1,
          loc.aboutReseauChecklistBullet2,
          loc.aboutReseauChecklistBullet3,
        ],
      ),
    );
  }
}

/// =======================
/// SMALL UI HELPERS
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
        fontSize: 13.5,
      ),
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
          ...bullets.map((s) => _Bullet(s)),
        ],
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  const _Bullet(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('•  ',
              style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.80), height: 1.35)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.80),
                  height: 1.35,
                  fontSize: 13.5),
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
      loc.aboutReseauFooterNote,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white38, fontSize: 12, height: 1.35),
    );
  }
}
