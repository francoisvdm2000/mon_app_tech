import 'package:flutter/material.dart';

import '../../app/ui/widgets.dart'; // SectionCard, copyToClipboard
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'about_favorites.dart';

class AboutRfPage extends StatefulWidget {
  const AboutRfPage({super.key});

  @override
  State<AboutRfPage> createState() => _AboutRfPageState();
}

class _AboutRfPageState extends State<AboutRfPage> {
  final _scroll = ScrollController();

  final _kBasics = GlobalKey();
  final _kUhfBands = GlobalKey();
  final _kWifi = GlobalKey();
  final _kCoexistence = GlobalKey();
  final _kAntennas = GlobalKey();
  final _kScanPrep = GlobalKey();
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
      appBar: AppBar(title: Text(loc.aboutRfPageTitle)),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          controller: _scroll,
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
          child: Column(
            children: [
              _TocCard(
                pageId: 'rf_about',
                onCopy: () {
                  copyToClipboard(context, loc.rfRefTocCopyText);
                },
                items: [
                  _TocItem('basics', loc.rfRefSection1Title, onTap: () => _goTo(_kBasics)),
                  _TocItem('uhf_bands', loc.rfRefSection2Title, onTap: () => _goTo(_kUhfBands)),
                  _TocItem('wifi', loc.rfRefSection3Title, onTap: () => _goTo(_kWifi)),
                  _TocItem('coexistence', loc.rfRefSection4Title, onTap: () => _goTo(_kCoexistence)),
                  _TocItem('antennas', loc.rfRefSection5Title, onTap: () => _goTo(_kAntennas)),
                  _TocItem('scan_prep', loc.rfRefSection6Title, onTap: () => _goTo(_kScanPrep)),
                  _TocItem('checklist', loc.rfRefSection7Title, onTap: () => _goTo(_kChecklist)),
                ],
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kBasics),
              AboutSectionPin(
                pageId: 'rf_about',
                sectionId: 'basics',
                child: const _Section1Basics(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kUhfBands),
              AboutSectionPin(
                pageId: 'rf_about',
                sectionId: 'uhf_bands',
                child: const _Section2UhfBands(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kWifi),
              AboutSectionPin(
                pageId: 'rf_about',
                sectionId: 'wifi',
                child: const _Section3Wifi(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kCoexistence),
              AboutSectionPin(
                pageId: 'rf_about',
                sectionId: 'coexistence',
                child: const _Section4Coexistence(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kAntennas),
              AboutSectionPin(
                pageId: 'rf_about',
                sectionId: 'antennas',
                child: const _Section5Antennas(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kScanPrep),
              AboutSectionPin(
                pageId: 'rf_about',
                sectionId: 'scan_prep',
                child: const _Section6ScanPrep(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kChecklist),
              AboutSectionPin(
                pageId: 'rf_about',
                sectionId: 'checklist',
                child: _Section7Checklist(
                  onCopy: () {
                    copyToClipboard(context, loc.rfRefTocCopyText);
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
      icon: Icons.settings_input_antenna,
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
      title: loc.rfRefSection1Title,
      icon: Icons.graphic_eq,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.rfRefSection1FormulasTitle,
            bullet: [
              loc.rfRefSection1Formula1,
              loc.rfRefSection1Formula2,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.rfRefSection1FieldMarksTitle,
            bullet: [
              loc.rfRefSection1FieldMark1,
              loc.rfRefSection1FieldMark2,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section2UhfBands extends StatelessWidget {
  const _Section2UhfBands();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.rfRefSection2Title,
      icon: Icons.mic_external_on,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Paragraph(loc.rfRefSection2Paragraph),
          const SizedBox(height: 10),
          _Callout(
            title: loc.rfRefSection2NoteTitle,
            bullet: [
              loc.rfRefSection2Note1,
              loc.rfRefSection2Note2,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section3Wifi extends StatelessWidget {
  const _Section3Wifi();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.rfRefSection3Title,
      icon: Icons.wifi,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.rfRefSection3TableTitle,
            bullet: [
              loc.rfRefSection3Bullet1,
              loc.rfRefSection3Bullet2,
              loc.rfRefSection3Bullet3,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section4Coexistence extends StatelessWidget {
  const _Section4Coexistence();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.rfRefSection4Title,
      icon: Icons.compare_arrows,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Paragraph(loc.rfRefSection4Paragraph),
          const SizedBox(height: 10),
          _Callout(
            title: loc.rfRefSection4FormulaTitle,
            bullet: [
              loc.rfRefSection4Formula1,
              loc.rfRefSection4Tip1,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section5Antennas extends StatelessWidget {
  const _Section5Antennas();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.rfRefSection5Title,
      icon: Icons.settings_input_antenna,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _BulletList([
            loc.rfRefSection5Bullet1,
            loc.rfRefSection5Bullet2,
            loc.rfRefSection5Bullet3,
          ]),
        ],
      ),
    );
  }
}

class _Section6ScanPrep extends StatelessWidget {
  const _Section6ScanPrep();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.rfRefSection6Title,
      icon: Icons.radar,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _BulletList([
            loc.rfRefSection6Bullet1,
            loc.rfRefSection6Bullet2,
            loc.rfRefSection6Bullet3,
          ]),
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
      title: loc.rfRefSection7Title,
      icon: Icons.checklist,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _BulletList([
            loc.rfRefSection7Bullet1,
            loc.rfRefSection7Bullet2,
            loc.rfRefSection7Bullet3,
            loc.rfRefSection7Bullet4,
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
      loc.rfRefFooterNote,
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
