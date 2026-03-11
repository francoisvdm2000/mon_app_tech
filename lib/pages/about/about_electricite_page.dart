import 'package:flutter/material.dart';

import '../../app/ui/widgets.dart'; // SectionCard, copyToClipboard
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

class AboutElectricitePage extends StatefulWidget {
  const AboutElectricitePage({super.key});

  @override
  State<AboutElectricitePage> createState() => _AboutElectricitePageState();
}

class _AboutElectricitePageState extends State<AboutElectricitePage> {
  final _scroll = ScrollController();

  final _kBasics = GlobalKey();
  final _kConnectors = GlobalKey();
  final _kMonoTri = GlobalKey();
  final _kPowerTable = GlobalKey();
  final _kSafety = GlobalKey();
  final _kChecklist = GlobalKey();

  final _kKvaConversion = GlobalKey();

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
      appBar: AppBar(title: Text(loc.aboutElectricitePageTitle)),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          controller: _scroll,
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
          child: Column(
            children: [
              _TocCard(
                onCopy: () {
                  copyToClipboard(context, loc.elecTocCopyText);
                },
                items: [
                  _TocItem(loc.elecSection1Title, onTap: () => _goTo(_kBasics)),
                  _TocItem(loc.elecSection2Title,
                      onTap: () => _goTo(_kConnectors)),
                  _TocItem(loc.elecSection3Title,
                      onTap: () => _goTo(_kMonoTri)),
                  _TocItem(loc.elecSection4Title,
                      onTap: () => _goTo(_kPowerTable)),
                  _TocItem(loc.elecKvaTitle,
                      onTap: () => _goTo(_kKvaConversion)),
                  _TocItem(loc.elecSection5Title, onTap: () => _goTo(_kSafety)),
                  _TocItem(loc.elecSection6Title,
                      onTap: () => _goTo(_kChecklist)),
                ],
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kBasics),
              const _Section1Basics(),
              const SizedBox(height: 12),
              _Anchor(key: _kConnectors),
              const _Section2Connectors(),
              const SizedBox(height: 12),
              _Anchor(key: _kMonoTri),
              const _Section3MonoTri(),
              const SizedBox(height: 12),
              _Anchor(key: _kPowerTable),
              const _Section4PowerTable(),
              const SizedBox(height: 12),
              _Anchor(key: _kKvaConversion),
              const _SectionKvaConversion(),
              const SizedBox(height: 12),
              _Anchor(key: _kSafety),
              const _Section5Safety(),
              const SizedBox(height: 12),
              _Anchor(key: _kChecklist),
              _Section6Checklist(
                onCopy: () {
                  copyToClipboard(context, loc.elecTocCopyText);
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
/// TOC
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
    return SectionCard(
      title: AppLocalizations.of(context).commonTocTitle,
      icon: Icons.electrical_services,
      trailing: IconButton(
        tooltip: AppLocalizations.of(context).commonCopySummaryTooltip,
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
/// SECTIONS
/// =======================

class _SectionKvaConversion extends StatelessWidget {
  const _SectionKvaConversion();

  static const _rows = <int>[
    16,
    20,
    25,
    32,
    40,
    50,
    63,
    80,
    100,
    125,
    160,
    200,
    250,
    315,
    400,
    500,
    630,
    800,
  ];

  String _kw(double v) {
    final s = v.toStringAsFixed(1);
    return s.endsWith('.0') ? s.substring(0, s.length - 2) : s;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final title = loc.elecKvaTitle;
    final formula = loc.elecKvaFormula;
    final intro = loc.elecKvaIntro;
    final note = loc.elecKvaNote;

    final colKva = loc.elecKvaColKva;
    final colPf08 = loc.elecKvaColPf08;
    final colPf10 = loc.elecKvaColPf10;

    return SectionCard(
      title: title,
      icon: Icons.bolt,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$formula\n\n$intro',
            style: const TextStyle(height: 1.25),
          ),
          const SizedBox(height: 10),
          Table(
            border: TableBorder.all(color: Colors.white24),
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
            },
            children: [
              TableRow(
                decoration:
                    BoxDecoration(color: Colors.white.withValues(alpha: 0.06)),
                children: [
                  _cellHead(colKva),
                  _cellHead(colPf08),
                  _cellHead(colPf10),
                ],
              ),
              ..._rows.map((a) {
                final kva = a.toDouble();
                final kw08 = kva * 0.8;
                final kw10 = kva * 1.0;
                return TableRow(
                  children: [
                    _cell('$a'),
                    _cell(_kw(kw08)),
                    _cell(_kw(kw10)),
                  ],
                );
              }),
            ],
          ),
          const SizedBox(height: 10),
          Text(note,
              style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7), height: 1.25)),
        ],
      ),
    );
  }

  static Widget _cellHead(String t) => Padding(
        padding: const EdgeInsets.all(8),
        child: Text(t, style: const TextStyle(fontWeight: FontWeight.w900)),
      );

  static Widget _cell(String t) => Padding(
        padding: const EdgeInsets.all(8),
        child: Text(t),
      );
}

class _Section1Basics extends StatelessWidget {
  const _Section1Basics();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.elecSection1Title,
      icon: Icons.calculate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.elecSection1FormulasTitle,
            bullet: [
              loc.elecSection1Formula1,
              loc.elecSection1Formula2,
              loc.elecSection1Formula3,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.elecSection1FieldMarksTitle,
            bullet: [
              loc.elecSection1FieldMark1,
              loc.elecSection1FieldMark2,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section2Connectors extends StatelessWidget {
  const _Section2Connectors();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.elecSection2Title,
      icon: Icons.power,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.elecSection2SchukoTitle,
            bullet: [
              loc.elecSection2SchukoBullet1,
              loc.elecSection2SchukoBullet2,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.elecSection2P17Title,
            bullet: [
              loc.elecSection2P17Bullet1,
              loc.elecSection2P17Bullet2,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.elecSection2PowerconTitle,
            bullet: [
              loc.elecSection2PowerconBullet1,
              loc.elecSection2PowerconBullet2,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section3MonoTri extends StatelessWidget {
  const _Section3MonoTri();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.elecSection3Title,
      icon: Icons.device_hub,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Paragraph(loc.elecSection3Paragraph),
          const SizedBox(height: 10),
          _Callout(
            title: loc.elecSection3PitfallsTitle,
            bullet: [
              loc.elecSection3Pitfall1,
              loc.elecSection3Pitfall2,
              loc.elecSection3Pitfall3,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.elecSection3MethodTitle,
            bullet: [
              loc.elecSection3MethodBullet1,
              loc.elecSection3MethodBullet2,
              loc.elecSection3MethodBullet3,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section4PowerTable extends StatelessWidget {
  const _Section4PowerTable();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.elecSection4Title,
      icon: Icons.table_chart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Subtitle(loc.elecSection4MonoTitle),
          _CodeBox(
            loc.elecSection4MonoCode,
          ),
          const SizedBox(height: 10),
          _Subtitle(loc.elecSection4TriTitle),
          _CodeBox(
            loc.elecSection4TriCode,
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.elecSection4ImportantTitle,
            bullet: [
              loc.elecSection4ImportantBullet1,
              loc.elecSection4ImportantBullet2,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section5Safety extends StatelessWidget {
  const _Section5Safety();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.elecSection5Title,
      icon: Icons.health_and_safety,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.elecSection5DontDoTitle,
            bullet: [
              loc.elecSection5DontDoBullet1,
              loc.elecSection5DontDoBullet2,
              loc.elecSection5DontDoBullet3,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.elecSection5WarningTitle,
            bullet: [
              loc.elecSection5WarningBullet1,
              loc.elecSection5WarningBullet2,
              loc.elecSection5WarningBullet3,
            ],
          ),
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
      title: loc.elecSection6Title,
      icon: Icons.checklist,
      trailing: IconButton(
        tooltip: loc.commonCopySummaryTooltip,
        icon: const Icon(Icons.copy, color: Colors.white70),
        onPressed: onCopy,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Subtitle(loc.elecSection6QuickTitle),
          _BulletList(
            [
              loc.elecSection6Bullet1,
              loc.elecSection6Bullet2,
              loc.elecSection6Bullet3,
              loc.elecSection6Bullet4,
              loc.elecSection6Bullet5,
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
      loc.elecFooterNote,
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

class _CodeBox extends StatelessWidget {
  const _CodeBox(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0B0B0B),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'monospace',
          height: 1.25,
        ),
      ),
    );
  }
}
