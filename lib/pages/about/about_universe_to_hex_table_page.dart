import 'package:flutter/material.dart';

import '../../app/ui/widgets.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

class AboutUniverseToHexTablePage extends StatelessWidget {
  const AboutUniverseToHexTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.aboutUniverseToHexTitle),
      ),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
          child: Column(
            children: [
              SectionCard(
                title: loc.aboutUniverseToHexPrincipleTitle,
                icon: Icons.info_outline,
                child: Text(
                  loc.aboutUniverseToHexPrincipleBody,
                  style: TextStyle(
                    height: 1.25,
                    color: Colors.white.withValues(alpha: 0.86),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              SectionCard(
                title: loc.aboutUniverseToHexTableTitle,
                icon: Icons.table_chart,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      loc.aboutUniverseToHexTableIntro,
                      style: TextStyle(
                        height: 1.25,
                        color: Colors.white.withValues(alpha: 0.86),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    for (int block = 0; block < 16; block++) ...[
                      Text(
                        loc.aboutUniverseToHexBlockTitle(
                          (block * 16 + 1).toString(),
                          (block * 16 + 16).toString(),
                        ),
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
                          2: FlexColumnWidth(1.2),
                        },
                        children: [
                          TableRow(
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.06),
                            ),
                            children: [
                              _Cell(loc.aboutUniverseToHexColDmx, bold: true),
                              _Cell(loc.aboutUniverseToHexColIndex, bold: true),
                              _Cell(loc.aboutUniverseToHexColHex, bold: true),
                            ],
                          ),
                          for (int i = 0; i < 16; i++)
                            TableRow(
                              children: () {
                                final dmx = block * 16 + 1 + i;
                                final idx = dmx - 1;
                                final hex = idx.toRadixString(16).toUpperCase().padLeft(3, '0');
                                return [
                                  _Cell(dmx.toString()),
                                  _Cell(idx.toString()),
                                  _Cell('0x$hex'),
                                ];
                              }(),
                            ),
                        ],
                      ),
                      const SizedBox(height: 12),
                    ],
                    Text(
                      loc.aboutUniverseToHexNote,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.70),
                        fontSize: 12,
                        height: 1.25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
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
