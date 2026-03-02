import 'package:flutter/material.dart';

import '../../app/ui/widgets.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

class AboutUniverseToArtNetTablePage extends StatelessWidget {
  const AboutUniverseToArtNetTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.aboutUniverseToArtnetTitle),
      ),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
          child: Column(
            children: [
              SectionCard(
                title: loc.aboutUniverseToArtnetImportantTitle,
                icon: Icons.info_outline,
                child: Text(
                  loc.aboutUniverseToArtnetImportantBody,
                  style: TextStyle(
                    height: 1.25,
                    color: Colors.white.withValues(alpha: 0.86),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              SectionCard(
                title: loc.aboutUniverseToArtnetTableTitle,
                icon: Icons.table_chart,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      loc.aboutUniverseToArtnetTableIntro,
                      style: TextStyle(
                        height: 1.25,
                        color: Colors.white.withValues(alpha: 0.86),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    for (int sub = 0; sub < 16; sub++) ...[
                      _SubTable(
                        title: loc.aboutUniverseToArtnetSubnetTitle(
                          sub.toString(),
                          '0x${sub.toRadixString(16).toUpperCase()}',
                          (sub * 16 + 1).toString(),
                          (sub * 16 + 16).toString(),
                        ),
                        startUniverse: sub * 16 + 1,
                      ),
                      const SizedBox(height: 12),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 12),

              Text(
                loc.aboutUniverseTablesDisclaimer,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white38,
                  fontSize: 12,
                  height: 1.25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SubTable extends StatelessWidget {
  const _SubTable({
    required this.title,
    required this.startUniverse,
  });

  final String title;
  final int startUniverse; // 1-based DMX universe

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final rows = <_Row>[];
    for (int i = 0; i < 16; i++) {
      final dmx = startUniverse + i; // 1..256
      final uni = i; // 0..15
      rows.add(_Row(dmx.toString(), uni.toRadixString(16).toUpperCase()));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.white.withValues(alpha: 0.92),
          ),
        ),
        const SizedBox(height: 8),
        Table(
          border: TableBorder.all(color: Colors.white24),
          columnWidths: const {
            0: FlexColumnWidth(1.0),
            1: FlexColumnWidth(1.0),
          },
          children: [
            TableRow(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.06),
              ),
              children: [
                _Cell(loc.aboutUniverseToArtnetColDmx, bold: true),
                _Cell(loc.aboutUniverseToArtnetColUniHex, bold: true),
              ],
            ),
            for (final r in rows)
              TableRow(
                children: [
                  _Cell(r.dmx),
                  _Cell(r.uniHex),
                ],
              ),
          ],
        ),
      ],
    );
  }
}

class _Row {
  _Row(this.dmx, this.uniHex);
  final String dmx;
  final String uniHex;
}

class _Cell extends StatelessWidget {
  const _Cell(this.text, {this.bold = false});
  final String text;
  final bool bold;

  @override
  Widget build(BuildContext context) {
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
