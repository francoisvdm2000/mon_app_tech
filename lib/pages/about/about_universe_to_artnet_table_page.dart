// lib/pages/about/about_universe_to_artnet_table_page.dart

import 'package:flutter/material.dart';

import '../../app/ui/widgets.dart';
import '../../l10n_gen/app_localizations.dart';

class AboutUniverseToArtNetTablePage extends StatefulWidget {
  const AboutUniverseToArtNetTablePage({super.key});

  @override
  State<AboutUniverseToArtNetTablePage> createState() =>
      _AboutUniverseToArtNetTablePageState();
}

class _AboutUniverseToArtNetTablePageState
    extends State<AboutUniverseToArtNetTablePage> {
  final ScrollController _hCtrl = ScrollController();
  final TextEditingController _searchCtrl = TextEditingController();

  String _query = '';

  @override
  void dispose() {
    _hCtrl.dispose();
    _searchCtrl.dispose();
    super.dispose();
  }

  List<_Row> _buildRows() {
    final rows = <_Row>[];
    for (int dmx = 1; dmx <= 256; dmx++) {
      final int index0 = dmx - 1; // 0..255
      final int subnet = index0 ~/ 16; // 0..15
      final int uni = index0 % 16; // 0..15
      final String uniHex =
          index0.toRadixString(16).toUpperCase().padLeft(2, '0');

      rows.add(_Row(
        dmx: dmx,
        subnet: subnet,
        uni: uni,
        uniHex: uniHex,
      ));
    }
    return rows;
  }

  List<_Row> _filteredRows(List<_Row> all) {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return all;

    bool match(_Row r) {
      final tokens = q
          .replaceAll('0x', '')
          .replaceAll(',', ' ')
          .replaceAll(';', ' ')
          .split(RegExp(r'\s+'))
          .where((e) => e.isNotEmpty)
          .toList();

      final dmxStr = r.dmx.toString();
      final subnetStr = r.subnet.toString();
      final uniStr = r.uni.toString();
      final uniHexStr = r.uniHex.toLowerCase();

      final aggregate =
          'dmx $dmxStr subnet $subnetStr uni $uniStr hex $uniHexStr';

      // Support "subnet/uni" ex: "3/12"
      if (q.contains('/')) {
        final parts = q.split('/');
        if (parts.length == 2) {
          final a = parts[0].trim();
          final b = parts[1].trim();
          return (a == subnetStr || a == 'subnet$subnetStr') &&
              (b == uniStr || b == uniHexStr);
        }
      }

      // Quick hex match
      if (q.length <= 2 && RegExp(r'^[0-9a-f]+$').hasMatch(q)) {
        if (uniHexStr == q) return true;
      }

      // All tokens must match
      for (final t in tokens) {
        if (!aggregate.contains(t)) {
          // allow "A" meaning uni 10
          if (t.length == 1 && RegExp(r'^[0-9a-f]$').hasMatch(t)) {
            final asHex = int.tryParse(t, radix: 16);
            if (asHex != null && asHex == r.uni) continue;
          }
          return false;
        }
      }
      return true;
    }

    return all.where(match).toList();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final all = _buildRows();
    final rows = _filteredRows(all);

    // Largeurs un peu réduites pour gagner en lisibilité sur mobile
    const double colW = 95;

    final columns = <_Col>[
      _Col(l10n.aboutUniverseToArtnetColDmx, width: colW),
      _Col(l10n.aboutUniverseToArtnetColSubnet, width: colW),
      _Col(l10n.aboutUniverseToArtnetColUniverse, width: colW),
      _Col(l10n.aboutUniverseToArtnetColUniHex, width: colW),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.aboutUniverseToArtnetTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Intro
            SectionCard(
              title: l10n.aboutUniverseToArtnetTableTitle,
              icon: Icons.table_chart,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.aboutUniverseToArtnetTableIntro,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.aboutUniverseTablesDisclaimer,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Search
            SectionCard(
              title: l10n.commonSearch,
              icon: Icons.search,
              child: TextField(
                controller: _searchCtrl,
                onChanged: (v) => setState(() => _query = v),
                decoration: InputDecoration(
                  hintText: l10n.commonSearch,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _query.trim().isEmpty
                      ? null
                      : IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchCtrl.clear();
                            setState(() => _query = '');
                          },
                        ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Table (header sticky vertical + suit le slide horizontal)
            Expanded(
              child: _StickyHeaderTable(
                controller: _hCtrl,
                columns: columns,
                rows: rows,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Row {
  final int dmx;
  final int subnet;
  final int uni;
  final String uniHex;
  const _Row({
    required this.dmx,
    required this.subnet,
    required this.uni,
    required this.uniHex,
  });
}

class _Col {
  final String label;
  final double width;
  const _Col(this.label, {required this.width});
}

class _StickyHeaderTable extends StatelessWidget {
  final ScrollController controller;
  final List<_Col> columns;
  final List<_Row> rows;

  const _StickyHeaderTable({
    required this.controller,
    required this.columns,
    required this.rows,
  });

  double get _totalWidth => columns.fold<double>(0, (sum, c) => sum + c.width);

  @override
  Widget build(BuildContext context) {
    final borderColor = Colors.white.withValues(alpha: 0.10);
    final headerStyle = Theme.of(context).textTheme.titleSmall;

    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Scrollbar(
              controller: controller,
              child: SingleChildScrollView(
                controller: controller,
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: _totalWidth,
                  height: constraints.maxHeight,
                  child: Column(
                    children: [
                      // Header (toujours visible verticalement, et suit le scroll horizontal)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.04),
                          border: Border(
                            bottom: BorderSide(color: borderColor, width: 1),
                          ),
                        ),
                        child: Row(
                          children: [
                            for (final c in columns)
                              Container(
                                width: c.width,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Text(
                                  c.label,
                                  style: headerStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                          ],
                        ),
                      ),

                      // Body
                      Expanded(
                        child: ListView.separated(
                          itemCount: rows.length,
                          separatorBuilder: (_, __) => Divider(
                            height: 1,
                            thickness: 1,
                            color: borderColor,
                          ),
                          itemBuilder: (context, i) {
                            final r = rows[i];
                            final isEven = i.isEven;
                            final bg = isEven
                                ? Colors.white.withValues(alpha: 0.02)
                                : Colors.transparent;

                            return Container(
                              color: bg,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  _cell(r.dmx.toString(),
                                      width: columns[0].width),
                                  _cell(r.subnet.toString(),
                                      width: columns[1].width),
                                  _cell(r.uni.toString(),
                                      width: columns[2].width),
                                  _cell(r.uniHex,
                                      width: columns[3].width, mono: true),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _cell(String text, {required double width, bool mono = false}) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: mono
              ? const TextStyle(fontFeatures: [FontFeature.tabularFigures()])
              : null,
        ),
      ),
    );
  }
}
