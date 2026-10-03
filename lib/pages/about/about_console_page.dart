import 'package:flutter/material.dart';

import '../../app/ui/widgets.dart'; // SectionCard, copyToClipboard
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'about_favorites.dart';

class AboutConsolePage extends StatefulWidget {
  const AboutConsolePage({super.key});

  @override
  State<AboutConsolePage> createState() => _AboutConsolePageState();
}

class _AboutConsolePageState extends State<AboutConsolePage> {
  final _scroll = ScrollController();

  final _kWireless = GlobalKey();
  final _kGdtf = GlobalKey();
  final _kPatch = GlobalKey();
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
      appBar: AppBar(title: Text(loc.aboutConsolePageTitle)),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          controller: _scroll,
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
          child: Column(
            children: [
              _TocCard(
                pageId: 'console_about',
                onCopy: () {
                  copyToClipboard(context, loc.consoleRefTocCopyText);
                },
                items: [
                  _TocItem('wireless', loc.consoleRefSection1Title, onTap: () => _goTo(_kWireless)),
                  _TocItem('gdtf', loc.consoleRefSection2Title, onTap: () => _goTo(_kGdtf)),
                  _TocItem('patch', loc.consoleRefSection3Title, onTap: () => _goTo(_kPatch)),
                  _TocItem('checklist', loc.consoleRefSection4Title, onTap: () => _goTo(_kChecklist)),
                ],
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kWireless),
              AboutSectionPin(
                pageId: 'console_about',
                sectionId: 'wireless',
                child: const _Section1Wireless(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kGdtf),
              AboutSectionPin(
                pageId: 'console_about',
                sectionId: 'gdtf',
                child: const _Section2Gdtf(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kPatch),
              AboutSectionPin(
                pageId: 'console_about',
                sectionId: 'patch',
                child: const _Section3Patch(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kChecklist),
              AboutSectionPin(
                pageId: 'console_about',
                sectionId: 'checklist',
                child: _Section4Checklist(
                  onCopy: () {
                    copyToClipboard(context, loc.consoleRefTocCopyText);
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
      icon: Icons.dashboard_customize_outlined,
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

class _Section1Wireless extends StatelessWidget {
  const _Section1Wireless();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.consoleRefSection1Title,
      icon: Icons.wifi_tethering,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Paragraph(loc.consoleRefSection1Paragraph),
          const SizedBox(height: 10),
          _BulletList([
            loc.consoleRefSection1Bullet1,
            loc.consoleRefSection1Bullet2,
            loc.consoleRefSection1Bullet3,
          ]),
        ],
      ),
    );
  }
}

class _Section2Gdtf extends StatelessWidget {
  const _Section2Gdtf();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.consoleRefSection2Title,
      icon: Icons.description_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.consoleRefSection2GdtfTitle,
            bullet: [loc.consoleRefSection2GdtfBody],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.consoleRefSection2ShareTitle,
            bullet: [loc.consoleRefSection2ShareBody],
          ),
        ],
      ),
    );
  }
}

class _Section3Patch extends StatelessWidget {
  const _Section3Patch();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.consoleRefSection3Title,
      icon: Icons.settings_input_component_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _BulletList([
            loc.consoleRefSection3Bullet1,
            loc.consoleRefSection3Bullet2,
            loc.consoleRefSection3Bullet3,
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
      title: loc.consoleRefSection4Title,
      icon: Icons.checklist,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _BulletList([
            loc.consoleRefSection4Bullet1,
            loc.consoleRefSection4Bullet2,
            loc.consoleRefSection4Bullet3,
            loc.consoleRefSection4Bullet4,
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
      loc.consoleRefFooterNote,
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
