import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'package:share_plus/share_plus.dart';

import '../../models/network/luminex_device.dart';
import '../../models/network/luminex_group.dart';
import '../../models/network/luminex_inventory.dart';
import '../../services/network/luminex_service.dart';
import 'luminex_multicast_page.dart' show compactUniverseList;

const _kAccent = Color(0xFF00E5FF);
const _kWarn = Color(0xFFFFB300);
const _kCard = Color(0xFF161622);
const _kBg = Color(0xFF0D0D14);

/// Texte d'une anomalie d'inventaire.
String luminexInventoryIssueText(
  LuminexInventoryEntry e,
  LuminexInventoryIssue issue,
  AppLocalizations loc,
) =>
    switch (issue) {
      LuminexInventoryIssue.noIpAddress => loc.luminexInvIssueNoIp,
      LuminexInventoryIssue.duplicateIp =>
        loc.luminexInvIssueDuplicateIp(e.duplicateIps.join(', ')),
    };

// ─── Carte résumé (page Luminex) ──────────────────────────────────────────────

class LuminexInventorySummaryCard extends StatelessWidget {
  final List<LuminexInventoryEntry> entries;
  final AppLocalizations loc;
  final VoidCallback onTap;

  const LuminexInventorySummaryCard({
    super.key,
    required this.entries,
    required this.loc,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final devices = entries.where((e) => !e.isTrunk).length;
    final issues = entries.where((e) => e.issues.isNotEmpty).length;

    return Material(
      color: _kCard,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.fromLTRB(14, 14, 10, 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: issues > 0
                  ? _kWarn.withValues(alpha: 0.35)
                  : Colors.white.withValues(alpha: 0.07),
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.lan_rounded, color: _kAccent.withValues(alpha: 0.9)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loc.luminexInvSummary(devices),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      issues > 0
                          ? loc.luminexInvIssuesCount(issues)
                          : loc.luminexInvNoIssue,
                      style: TextStyle(
                        fontSize: 12,
                        color: issues > 0
                            ? _kWarn
                            : Colors.white.withValues(alpha: 0.45),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded,
                  color: _kAccent.withValues(alpha: 0.55)),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Page ─────────────────────────────────────────────────────────────────────

/// Inventaire : chaque port actif de chaque GigaCore, ce qui y est branché
/// (LLDP, IP vues en IGMP), le groupe, les univers sACN écoutés, et les
/// anomalies.
class LuminexInventoryPage extends StatefulWidget {
  final LuminexService service;

  const LuminexInventoryPage({super.key, required this.service});

  @override
  State<LuminexInventoryPage> createState() => _LuminexInventoryPageState();
}

class _LuminexInventoryPageState extends State<LuminexInventoryPage> {
  late List<LuminexDevice> _devices;
  StreamSubscription<List<LuminexDevice>>? _subscription;
  final _search = TextEditingController();
  bool _issuesOnly = false;
  bool _showLinks = false;

  @override
  void initState() {
    super.initState();
    _devices = widget.service.devices;
    _subscription = widget.service.stream.listen((devices) {
      if (mounted) setState(() => _devices = devices);
    });
    _search.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _search.dispose();
    super.dispose();
  }

  Future<void> _exportCsv(
    List<LuminexInventoryEntry> entries,
    BuildContext buttonContext,
  ) async {
    final box = buttonContext.findRenderObject() as RenderBox?;
    Rect? origin;
    if (box != null && box.hasSize) {
      origin = box.localToGlobal(Offset.zero) & box.size;
    }
    // BOM UTF-8 pour qu'Excel lise correctement les accents.
    final bytes = Uint8List.fromList(
        [0xEF, 0xBB, 0xBF, ...utf8.encode(LuminexInventoryEntry.toCsv(entries))]);
    final now = DateTime.now();
    String two(int v) => v.toString().padLeft(2, '0');
    final name = 'Inventaire GigaCore ${now.year}-${two(now.month)}-'
        '${two(now.day)} ${two(now.hour)}${two(now.minute)}.csv';
    await Share.shareXFiles(
      [XFile.fromData(bytes, name: name, mimeType: 'text/csv')],
      sharePositionOrigin: origin,
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final all = LuminexInventoryEntry.compute(_devices);
    final query = _search.text.trim().toLowerCase();
    final visible = all.where((e) {
      if (!_showLinks && e.isTrunk) return false;
      if (_issuesOnly && e.issues.isEmpty) return false;
      if (query.isEmpty) return true;
      return query.split(RegExp(r'\s+')).every(e.searchText.contains);
    }).toList();

    // Regroupement par switch, dans l'ordre de l'inventaire.
    final bySwitch = <String, List<LuminexInventoryEntry>>{};
    for (final e in visible) {
      bySwitch.putIfAbsent('${e.switchName}  ·  ${e.switchIp}', () => []).add(e);
    }
    final issueCount = all.where((e) => e.issues.isNotEmpty).length;

    return Scaffold(
      backgroundColor: _kBg,
      appBar: AppBar(
        backgroundColor: _kBg,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.luminexInvTitle,
            style: const TextStyle(fontWeight: FontWeight.w800)),
        actions: [
          Builder(
            builder: (btn) => IconButton(
              icon: Icon(Icons.ios_share_rounded,
                  color: _kAccent.withValues(alpha: 0.8)),
              tooltip: loc.luminexInvExport,
              onPressed: all.isEmpty ? null : () => _exportCsv(all, btn),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
            16, 8, 16, 24 + MediaQuery.paddingOf(context).bottom),
        children: [
          Text(
            loc.luminexInvHint,
            style: TextStyle(
              fontSize: 12,
              height: 1.4,
              color: Colors.white.withValues(alpha: 0.45),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _search,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              isDense: true,
              prefixIcon: Icon(Icons.search_rounded,
                  color: Colors.white.withValues(alpha: 0.4)),
              hintText: loc.luminexInvSearchHint,
              hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.3)),
              filled: true,
              fillColor: Colors.white.withValues(alpha: 0.05),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              FilterChip(
                label: Text(loc.luminexInvIssuesCount(issueCount)),
                selected: _issuesOnly,
                onSelected: (v) => setState(() => _issuesOnly = v),
                selectedColor: _kWarn.withValues(alpha: 0.25),
                checkmarkColor: _kWarn,
              ),
              FilterChip(
                label: Text(loc.luminexInvShowLinks),
                selected: _showLinks,
                onSelected: (v) => setState(() => _showLinks = v),
                selectedColor: _kAccent.withValues(alpha: 0.2),
                checkmarkColor: _kAccent,
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (visible.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Text(
                loc.luminexInvEmpty,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white.withValues(alpha: 0.35)),
              ),
            ),
          for (final entry in bySwitch.entries) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 14, 4, 8),
              child: Text(
                entry.key.toUpperCase(),
                style: const TextStyle(
                  color: _kAccent,
                  fontSize: 10.5,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: _kCard,
                borderRadius: BorderRadius.circular(18),
                border:
                    Border.all(color: Colors.white.withValues(alpha: 0.07)),
              ),
              child: Column(
                children: [
                  for (var i = 0; i < entry.value.length; i++)
                    _InventoryRow(
                      entry: entry.value[i],
                      loc: loc,
                      showDivider: i > 0,
                    ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _InventoryRow extends StatelessWidget {
  final LuminexInventoryEntry entry;
  final AppLocalizations loc;
  final bool showDivider;

  const _InventoryRow({
    required this.entry,
    required this.loc,
    required this.showDivider,
  });

  @override
  Widget build(BuildContext context) {
    final e = entry;
    final colorValue = parseLuminexColor(e.groupColorHex);
    final color = colorValue != null
        ? Color(colorValue)
        : e.isTrunk
            ? const Color(0xFF999999)
            : _kAccent;

    final speed = e.speedMbps;
    final line2 = <String>[
      if (e.groupName != null) e.groupName! else if (e.trunkName != null) e.trunkName!,
      if (speed != null)
        speed >= 1000 ? '${speed ~/ 1000} Gb/s' : '$speed Mb/s',
      if (e.portName != null && e.neighborName != null) e.neighborName!,
      ...e.ips,
    ];
    final line3 = <String>[
      if (e.sacnUniverses.isNotEmpty)
        loc.luminexMulticastSacnUniverses(
            compactUniverseList(e.sacnUniverses)),
      if (e.manet) 'MA-Net3',
    ];

    return Container(
      decoration: BoxDecoration(
        border: showDivider
            ? Border(
                top: BorderSide(color: Colors.white.withValues(alpha: 0.05)))
            : null,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34,
            height: 34,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(9),
              border: Border.all(color: color.withValues(alpha: 0.55)),
            ),
            child: Text(
              '${e.portNr}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12.5,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  e.displayName ?? '—',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.92),
                    fontSize: 13.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  line2.join('  ·  '),
                  style: TextStyle(
                    fontSize: 11.5,
                    color: Colors.white.withValues(alpha: 0.45),
                  ),
                ),
                if (line3.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    line3.join('  ·  '),
                    style: TextStyle(
                      fontSize: 11.5,
                      color: color.withValues(alpha: 0.9),
                    ),
                  ),
                ],
                for (final issue in e.issues) ...[
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      const Icon(Icons.warning_rounded,
                          size: 13, color: _kWarn),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          luminexInventoryIssueText(e, issue, loc),
                          style:
                              const TextStyle(fontSize: 11.5, color: _kWarn),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
