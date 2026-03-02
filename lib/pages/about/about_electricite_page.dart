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
      appBar: AppBar(title: const Text('Électrique — repères terrain')),
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
                  _TocItem(loc.elecToc1, onTap: () => _goTo(_kBasics)),
                  _TocItem(loc.elecToc2, onTap: () => _goTo(_kConnectors)),
                  _TocItem(loc.elecToc3, onTap: () => _goTo(_kMonoTri)),
                  _TocItem(loc.elecToc4, onTap: () => _goTo(_kPowerTable)),
                  _TocItem(loc.elecToc5, onTap: () => _goTo(_kKvaConversion)),
                  _TocItem(loc.elecToc6, onTap: () => _goTo(_kSafety)),
                  _TocItem(loc.elecToc7, onTap: () => _goTo(_kChecklist)),
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


class _SectionKvaConversion extends StatelessWidget {
  const _SectionKvaConversion();

  static const _rows = <int>[
    16, 20, 25, 32, 40, 50, 63, 80, 100, 125, 160, 200, 250, 315, 400, 500, 630, 800,
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
                decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.06)),
                children: [
                  _cell(colKva, bold: true),
                  _cell(colPf08, bold: true),
                  _cell(colPf10, bold: true),
                ],
              ),
              for (final kva in _rows)
                TableRow(
                  children: [
                    _cell('$kva'),
                    _cell(_kw(kva * 0.8)),
                    _cell(_kw(kva * 1.0)),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            note,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.70),
              fontSize: 12,
              height: 1.25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _cell(String text, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: bold ? FontWeight.w900 : FontWeight.w700,
          color: Colors.white.withValues(alpha: bold ? 0.95 : 0.85),
        ),
      ),
    );
  }
}

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
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                          Icon(Icons.chevron_right, color: Colors.white.withValues(alpha: 0.55)),
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
/// SECTION 1 — BASICS
/// =======================

class _Section1Basics extends StatelessWidget {
  const _Section1Basics();

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: '1) Bases (W, A, V, kW)',
      icon: Icons.calculate,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: '3 formules utiles',
            bullets: [
              'Mono : P ≈ U × I  (ex: 230V × 16A ≈ 3680W ≈ 3,7kW)',
              'Tri : P ≈ √3 × U × I  (ex: 1,732 × 400V × 32A ≈ 22kW)',
              'kW = 1000W (ordre de grandeur).',
            ],
          ),
          SizedBox(height: 10),
          _Callout(
            title: 'Repères terrain',
            bullets: [
              'Ce qui “fait tomber” : surcharge, court-circuit, défaut d’isolement (diff).',
              'Chauffe câble = danger : longueur + section + courant.',
              'Toujours penser “marge” : éviter d’être à 100% en continu.',
            ],
          ),
        ],
      ),
    );
  }
}

/// =======================
/// SECTION 2 — CONNECTORS
/// =======================

class _Section2Connectors extends StatelessWidget {
  const _Section2Connectors();

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: '2) Connecteurs (Schuko / P17 / PowerCON)',
      icon: Icons.power,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: 'Schuko (prises domestiques)',
            bullets: [
              'Courant pour petites charges / backstage.',
              'Limite typique 16A (et parfois moins selon l’installation).',
              'Attention aux multiprises et rallonges de mauvaise qualité.',
            ],
          ),
          SizedBox(height: 10),
          _Callout(
            title: 'P17 / CEE (bleu/rouge)',
            bullets: [
              'P17 bleu (mono 230V) : 16A/32A…',
              'P17 rouge (tri 400V) : 16A/32A/63A/125A…',
              'Connectique “pro” : plus robuste, plus fiable.',
            ],
          ),
          SizedBox(height: 10),
          _Callout(
            title: 'PowerCON (audio/éclairage)',
            bullets: [
              'Connecteurs verrouillables (souvent sur matériel).',
              'Ne remplace pas une protection électrique.',
              'Respecter la chaîne : câble + section + protection.',
            ],
          ),
        ],
      ),
    );
  }
}

/// =======================
/// SECTION 3 — MONO / TRI
/// =======================

class _Section3MonoTri extends StatelessWidget {
  const _Section3MonoTri();

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: '3) Mono / Tri (ce que ça change)',
      icon: Icons.device_hub,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Paragraph(
            "Mono = une phase + neutre (230V). Tri = 3 phases (400V entre phases, 230V phase-neutre).\n"
            "En tri, l’objectif terrain est de répartir les charges sur les phases pour éviter d’en saturer une.",
          ),
          SizedBox(height: 10),
          _Callout(
            title: 'Pièges fréquents',
            bullets: [
              'Tout brancher “au hasard” sur la même phase → ça disjoncte.',
              'Neutre surchargé (si charges non réparties).',
              'Mauvaise identification des prises / adaptateurs dangereux.',
            ],
          ),
          SizedBox(height: 10),
          _Callout(
            title: 'Méthode simple',
            bullets: [
              'Lister les grosses charges (LED wall, amplis, dimmers, vidéo).',
              'Répartir par phase (A/B/C) et garder une marge.',
              'Allumer progressivement et surveiller.',
            ],
          ),
        ],
      ),
    );
  }
}

/// =======================
/// SECTION 4 — POWER TABLE
/// =======================

class _Section4PowerTable extends StatelessWidget {
  const _Section4PowerTable();

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: '4) Table rapide (16A → 400A)',
      icon: Icons.table_chart,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Subtitle('Mono 230V (≈ U×I)'),
          _CodeBox(text: '''
16A  ≈ 3,7 kW
32A  ≈ 7,4 kW
63A  ≈ 14,5 kW
'''),
          SizedBox(height: 10),
          _Subtitle('Tri 400V (≈ √3×U×I)'),
          _CodeBox(text: '''
16A  ≈ 11 kW
32A  ≈ 22 kW
63A  ≈ 44 kW
125A ≈ 87 kW
200A ≈ 139 kW
400A ≈ 277 kW
'''),
          SizedBox(height: 10),
          _Callout(
            title: 'Important',
            bullets: [
              'Ce sont des ordres de grandeur (PF/efficacité peuvent changer).',
              'Toujours vérifier la protection/disjoncteur en amont.',
              'Si tu es limite → réduire / répartir / demander plus de puissance.',
            ],
          ),
        ],
      ),
    );
  }
}

/// =======================
/// SECTION 5 — SAFETY
/// =======================

class _Section5Safety extends StatelessWidget {
  const _Section5Safety();

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: '6) Sécurité & pièges terrain',
      icon: Icons.health_and_safety,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: 'À ne pas faire',
            bullets: [
              'Adaptateurs “maison” / shunt / terre coupée.',
              'Câbles enroulés sous forte charge (chauffe).',
              'Multiprises en cascade sur grosses puissances.',
            ],
          ),
          SizedBox(height: 10),
          _Callout(
            title: 'Signaux d’alerte',
            bullets: [
              'Odeur de chaud, câble tiède/chaud.',
              'Disjonctions répétées.',
              'Éclairage/vidéo qui “pompe” (chute tension).',
            ],
          ),
          SizedBox(height: 10),
          _Paragraph(
            "En cas de doute : arrêter, simplifier, mesurer (si tu sais), et faire valider par quelqu’un qualifié.\n"
            "Le but ici est de te donner des repères, pas de remplacer un électricien.",
          ),
        ],
      ),
    );
  }
}

/// =======================
/// SECTION 6 — CHECKLIST
/// =======================

class _Section6Checklist extends StatelessWidget {
  const _Section6Checklist({required this.onCopy});
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: '6) Checklist',
      icon: Icons.checklist,
      trailing: IconButton(
        tooltip: 'Copier',
        icon: const Icon(Icons.copy, color: Colors.white70),
        onPressed: onCopy,
      ),
      child: const _Callout(
        title: 'Rapide',
        bullets: [
          'Identifier source + intensité dispo.',
          'Protections OK (disj + diff).',
          'Câbles dimensionnés, pas enroulés sous charge.',
          'Répartir par phase (tri).',
          'Allumage progressif.',
        ],
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
          Text('•  ', style: TextStyle(color: Colors.white.withValues(alpha: 0.80), height: 1.35)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.white.withValues(alpha: 0.80), height: 1.35, fontSize: 13.5),
            ),
          ),
        ],
      ),
    );
  }
}

/// Petit bloc monospaced “technique”
class _CodeBox extends StatelessWidget {
  const _CodeBox({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0B0B0B),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white12),
      ),
      padding: const EdgeInsets.all(12),
      child: Text(
        text.trimRight(),
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.88),
          fontFamily: 'monospace',
          height: 1.25,
          fontSize: 12.8,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _FooterNote extends StatelessWidget {
  const _FooterNote();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Info indicative (terrain). Selon l’installation, les protections et câbles peuvent limiter.\n"
      "Objectif : repères simples + méthode fiable.",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white38, fontSize: 12, height: 1.35),
    );
  }
}
