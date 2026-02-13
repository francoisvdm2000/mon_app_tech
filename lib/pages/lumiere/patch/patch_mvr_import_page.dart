import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xml/xml.dart';

import '../../../app/ui/widgets.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'gdtf_reader.dart';
import 'patch_models.dart';
import 'patch_store.dart';

const String _kMvrCacheKey = 'patch_mvr_cache_v6';

enum _SortField { id, name, universe, address, channels, universeThenAddress }

class PatchMvrImportPage extends StatefulWidget {
  const PatchMvrImportPage({super.key});

  @override
  State<PatchMvrImportPage> createState() => _PatchMvrImportPageState();
}

class _PatchMvrImportPageState extends State<PatchMvrImportPage> {
  bool _isLoading = false;
  String _status = '';
  List<_MvrRow> _rows = const [];

  _SortField _sortField = _SortField.universeThenAddress;
  bool _sortAscending = true;

  int? _universeFilter;

  final GdtfReader _gdtfReader = GdtfReader();

  @override
  void initState() {
    super.initState();
    _restoreFromCache();
  }

  // ===================== PERSISTENCE =====================

  Future<void> _restoreFromCache() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_kMvrCacheKey);
    if (raw == null || raw.trim().isEmpty) return;

    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return;

      final rows = decoded.map((e) => _MvrRow.fromJson(e)).toList();

      if (!mounted) return;
      final loc = AppLocalizations.of(context);

      setState(() {
        _rows = rows;
        _status = rows.isEmpty ? '' : loc.patchMvrStatusRestored(rows.length);
      });
    } catch (_) {
      // Cache corrompu : on ignore.
    }
  }

  Future<void> _saveToCache(List<_MvrRow> rows) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = jsonEncode(rows.map((e) => e.toJson()).toList());
    await prefs.setString(_kMvrCacheKey, raw);
  }

  Future<void> _clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kMvrCacheKey);

    if (!mounted) return;
    final loc = AppLocalizations.of(context);

    setState(() {
      _rows = const [];
      _universeFilter = null;
      _status = loc.patchMvrStatusCleared;
    });
  }

  // ===================== IMPORT FICHIER =====================

  Future<void> _pickAndParse() async {
    final loc = AppLocalizations.of(context);

    setState(() {
      _isLoading = true;
      _status = loc.patchMvrStatusSelectingFile;
      _rows = const [];
      _universeFilter = null;
    });

    FilePickerResult? result;
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        withData: true,
      );
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _status = loc.patchMvrStatusFilePickFailed(e.toString());
      });
      return;
    }

    if (!mounted) return;

    if (result == null || result.files.isEmpty) {
      setState(() {
        _isLoading = false;
        _status = loc.patchMvrStatusNoFileSelected;
      });
      return;
    }

    final picked = result.files.first;
    final name = picked.name.trim();
    final nameLower = name.toLowerCase();

    if (!nameLower.endsWith('.mvr')) {
      setState(() {
        _isLoading = false;
        _status = loc.patchMvrStatusUnsupportedFile(name);
      });
      return;
    }

    final bytes = picked.bytes;
    if (bytes == null || bytes.isEmpty) {
      setState(() {
        _isLoading = false;
        _status = loc.patchMvrStatusEmptyBytes;
      });
      return;
    }

    try {
      setState(() => _status = loc.patchMvrStatusExtractingZip);

      final zip = ZipDecoder().decodeBytes(bytes, verify: true);

      final xmlString = _extractBestSceneXmlFromArchive(zip);
      if (xmlString == null || xmlString.trim().isEmpty) {
        setState(() {
          _isLoading = false;
          _status = loc.patchMvrStatusSceneXmlNotFound;
        });
        return;
      }

      setState(() => _status = loc.patchMvrStatusLoadingGdtf);
      final gdtfMap = _extractGdtfFiles(zip);

      setState(() => _status = loc.patchMvrStatusParsingContent);
      final rows = _parseMvrFixturesRobust(xmlString, gdtfMap);

      await _saveToCache(rows);

      final resolved = rows.where((r) => (r.channelCount ?? 1) > 1).length;

      setState(() {
        _isLoading = false;
        _rows = rows;
        _status = rows.isEmpty
            ? loc.patchMvrStatusNoUsableFixtures
            : loc.patchMvrStatusFixturesFound(rows.length, resolved);
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _status = loc.patchMvrStatusParseError(e.toString());
      });
    }
  }

  Map<String, Uint8List> _extractGdtfFiles(Archive archive) {
    final map = <String, Uint8List>{};

    for (final f in archive.files) {
      if (!f.isFile) continue;
      final lower = f.name.toLowerCase();
      if (!lower.endsWith('.gdtf')) continue;

      final content = f.content;
      if (content is! List<int>) continue;

      final fileName = f.name.split('/').last.split('\\').last;
      map[fileName.toLowerCase()] = Uint8List.fromList(content);
    }

    return map;
  }

  // ===================== CHARGER COMME RÉFÉRENCE PATCH =====================

  void _loadAsReference() {
    final loc = AppLocalizations.of(context);

    if (_rows.isEmpty) {
      setState(() => _status = loc.patchMvrStatusNoContentToLoad);
      return;
    }

    int loaded = 0;
    int skipped = 0;
    int footprintsFromGdtf = 0;

    final entries = <PatchEntry>[];

    for (final r in _rows) {
      final u = r.universe;
      final a = r.address;
      if (u == null || a == null) {
        skipped++;
        continue;
      }

      final id = (r.rawId != null && r.rawId!.trim().isNotEmpty)
          ? 'mvr:${r.rawId!.trim()}'
          : 'mvrh:${Object.hash(r.name, u, a)}';

      final channels = r.channelCount ?? 1;
      if (channels > 1) footprintsFromGdtf++;

      final e = PatchEntry(
        id: id,
        fixtureName: r.name,
        dmxModeName: r.dmxModeName ?? loc.patchMvrModeNotProvided,
        channelCount: channels,
        universe: u,
        startAddress: a,
      );

      entries.add(e);
      loaded++;
    }

    patchStore.loadReference(entries);

    setState(() {
      _status = loc.patchMvrStatusReferenceLoaded(loaded, skipped, footprintsFromGdtf);
    });
  }

  // ===================== TRI / FILTRE =====================

  List<_MvrRow> _sortedRows() {
    final list = List<_MvrRow>.from(_rows);

    int cmpNullLastComparable(Comparable? a, Comparable? b) {
      if (a == null && b == null) return 0;
      if (a == null) return 1;
      if (b == null) return -1;
      return a.compareTo(b);
    }

    int cmpIntNullLast(int? a, int? b) {
      if (a == null && b == null) return 0;
      if (a == null) return 1;
      if (b == null) return -1;
      return a.compareTo(b);
    }

    Comparable? key(_MvrRow r) {
      switch (_sortField) {
        case _SortField.id:
          return r.sortIdKey;
        case _SortField.name:
          return r.name.toLowerCase();
        case _SortField.universe:
          return r.universe;
        case _SortField.address:
          return r.address;
        case _SortField.channels:
          return r.channelCount;
        case _SortField.universeThenAddress:
          return null;
      }
    }

    list.sort((a, b) {
      int c;
      if (_sortField == _SortField.universeThenAddress) {
        c = cmpIntNullLast(a.universe, b.universe);
        if (c == 0) c = cmpIntNullLast(a.address, b.address);
        if (c == 0) c = a.name.toLowerCase().compareTo(b.name.toLowerCase());
      } else {
        c = cmpNullLastComparable(key(a), key(b));
      }
      return _sortAscending ? c : -c;
    });

    return list;
  }

  List<_MvrRow> _filteredRows(List<_MvrRow> rows) {
    final u = _universeFilter;
    if (u == null) return rows;
    return rows.where((r) => r.universe == u).toList();
  }

  List<int> _universesFromRows() {
    final set = <int>{};
    for (final r in _rows) {
      if (r.universe != null) set.add(r.universe!);
    }
    final list = set.toList()..sort();
    return list;
  }

  // ===================== UI =====================

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.patchMvrTitle),
        actions: [
          if (_rows.isNotEmpty)
            IconButton(
              tooltip: loc.patchMvrClearTooltip,
              onPressed: _clearCache,
              icon: const Icon(Icons.delete_outline),
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          SectionCard(
            title: loc.patchMvrFileCardTitle,
            icon: Icons.upload_file,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  loc.patchMvrFileCardHelp,
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: _isLoading ? null : _pickAndParse,
                  child: Text(
                    _isLoading
                        ? loc.patchMvrButtonAnalyzing
                        : loc.patchMvrButtonPickFile,
                  ),
                ),
                const SizedBox(height: 12),
                if (_rows.isNotEmpty)
                  ElevatedButton(
                    onPressed: _loadAsReference,
                    child: Text(loc.patchMvrButtonLoadAsReference),
                  ),
                const SizedBox(height: 12),
                ResultBox(_status),
              ],
            ),
          ),
          const SizedBox(height: 12),
          if (_rows.isNotEmpty) _buildTableCard(),
        ],
      ),
    );
  }

  Widget _buildTableCard() {
    final loc = AppLocalizations.of(context);

    final universes = _universesFromRows();
    final rows = _filteredRows(_sortedRows());

    return SectionCard(
      title: loc.patchMvrSummaryTitle,
      icon: Icons.table_chart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            loc.patchMvrColumnsHint,
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<int?>(
            initialValue: _universeFilter,
            isExpanded: true,
            decoration: InputDecoration(
              labelText: loc.patchMvrFilterUniverseLabel,
            ),
            items: [
              DropdownMenuItem<int?>(
                value: null,
                child: Text(loc.patchMvrFilterAllUniverses),
              ),
              ...universes.map(
                (u) => DropdownMenuItem<int?>(
                  value: u,
                  child: Text(loc.patchMvrUniverseItem(u)),
                ),
              ),
            ],
            onChanged: (v) => setState(() => _universeFilter = v),
          ),
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 520;

              final sortBy = DropdownButtonFormField<_SortField>(
                initialValue: _sortField,
                isExpanded: true,
                decoration: InputDecoration(labelText: loc.patchMvrSortByLabel),
                items: [
                  DropdownMenuItem(
                      value: _SortField.id, child: Text(loc.patchMvrSortId)),
                  DropdownMenuItem(
                      value: _SortField.name,
                      child: Text(loc.patchMvrSortName)),
                  DropdownMenuItem(
                      value: _SortField.universe,
                      child: Text(loc.patchMvrSortUniverse)),
                  DropdownMenuItem(
                      value: _SortField.address,
                      child: Text(loc.patchMvrSortAddress)),
                  DropdownMenuItem(
                      value: _SortField.channels,
                      child: Text(loc.patchMvrSortChannels)),
                  DropdownMenuItem(
                    value: _SortField.universeThenAddress,
                    child: Text(loc.patchMvrSortUniverseThenAddress),
                  ),
                ],
                onChanged: (v) {
                  if (v == null) return;
                  setState(() => _sortField = v);
                },
              );

              final order = DropdownButtonFormField<bool>(
                initialValue: _sortAscending,
                isExpanded: true,
                decoration: InputDecoration(labelText: loc.patchMvrOrderLabel),
                items: [
                  DropdownMenuItem(
                      value: true, child: Text(loc.patchMvrOrderAsc)),
                  DropdownMenuItem(
                      value: false, child: Text(loc.patchMvrOrderDesc)),
                ],
                onChanged: (v) {
                  if (v == null) return;
                  setState(() => _sortAscending = v);
                },
              );

              if (isNarrow) {
                return Column(
                  children: [
                    sortBy,
                    const SizedBox(height: 12),
                    order,
                  ],
                );
              }

              return Row(
                children: [
                  Expanded(child: sortBy),
                  const SizedBox(width: 12),
                  Expanded(child: order),
                ],
              );
            },
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF0B0B0B),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white12),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                dataTextStyle: const TextStyle(color: Colors.white70),
                columns: [
                  DataColumn(label: Text(loc.patchMvrColId)),
                  DataColumn(label: Text(loc.patchMvrColName)),
                  DataColumn(label: Text(loc.patchMvrColUniverse)),
                  DataColumn(label: Text(loc.patchMvrColAddress)),
                  DataColumn(label: Text(loc.patchMvrColChannels)),
                ],
                rows: List.generate(rows.length, (index) {
                  final r = rows[index];
                  final displayId = r.displayId(index + 1);
                  return DataRow(
                    cells: [
                      DataCell(Text(displayId)),
                      DataCell(
                        SizedBox(
                          width: 280,
                          child: Text(
                            r.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      DataCell(Text(r.universe?.toString() ?? '—')),
                      DataCell(Text(r.address?.toString() ?? '—')),
                      DataCell(Text((r.channelCount ?? 1).toString())),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ===================== EXTRACTION ZIP (XML) =====================

  String? _extractBestSceneXmlFromArchive(Archive archive) {
    ArchiveFile? best;

    for (final f in archive.files) {
      if (!f.isFile) continue;
      if (f.name == 'GeneralSceneDescription.xml') {
        best = f;
        break;
      }
    }

    best ??= archive.files.cast<ArchiveFile?>().firstWhere(
          (f) => f != null && f.isFile && f.name == 'Scene.mvr',
          orElse: () => null,
        );

    best ??= archive.files.cast<ArchiveFile?>().firstWhere(
      (f) {
        if (f == null || !f.isFile) return false;
        final n = f.name.toLowerCase();
        if (!n.endsWith('.xml') && !n.endsWith('.mvr')) return false;
        return n.contains('generalscenedescription') ||
            n.contains('scene') ||
            n.contains('description');
      },
      orElse: () => null,
    );

    if (best == null) return null;

    final content = best.content;
    if (content is! List<int>) return null;

    return utf8.decode(content, allowMalformed: true);
  }

  // ===================== PARSING ROBUSTE =====================

  List<_MvrRow> _parseMvrFixturesRobust(
    String xmlString,
    Map<String, Uint8List> gdtfMap,
  ) {
    final doc = XmlDocument.parse(xmlString);

    final fixtures = doc.descendants.whereType<XmlElement>().where((e) {
      final n = e.name.local.toLowerCase();
      return n == 'fixture' || n == 'device' || n == 'lightingdevice';
    }).toList();

    final rows = <_MvrRow>[];

    for (final fx in fixtures) {
      final name =
          (_readStringAttrOrChild(fx, const ['name', 'Name']) ?? 'Sans nom')
              .trim();

      final fixtureId =
          _readStringAttrOrChild(fx, const ['FixtureID', 'fixtureid']);
      final uuid = _readStringAttr(fx, const ['uuid', 'UUID', 'id', 'Id']);

      final patch = _readVectorworksOrGenericAddress(fx) ??
          _findUniverseAndAddressFallbackStrict(fx);

      final universe = patch?.$1;
      final address = patch?.$2;

      // Vectorworks : GDTFSpec + GDTFMode
      final gdtfSpec =
          _readStringAttrOrChild(fx, const ['GDTFSpec', 'GdtfSpec']);
      final gdtfMode =
          _readStringAttrOrChild(fx, const ['GDTFMode', 'GdtfMode']);

      final channels = _resolveFootprintFromGdtf(
        gdtfSpec: gdtfSpec,
        dmxModeName: gdtfMode,
        gdtfMap: gdtfMap,
      );

      rows.add(
        _MvrRow(
          rawId: (fixtureId != null && fixtureId.trim().isNotEmpty)
              ? fixtureId.trim()
              : (uuid != null && uuid.trim().isNotEmpty ? uuid.trim() : null),
          name: name.isEmpty ? 'Sans nom' : name,
          universe: universe,
          address: address,
          dmxModeName:
              gdtfMode?.trim().isEmpty ?? true ? null : gdtfMode!.trim(),
          channelCount: channels,
        ),
      );
    }

    // Dedup + tri stable
    final seen = <String>{};
    final unique = <_MvrRow>[];
    for (final r in rows) {
      final key = (r.rawId != null && r.rawId!.isNotEmpty)
          ? 'id:${r.rawId}'
          : 'k:${r.name}|${r.universe ?? 0}|${r.address ?? 0}';
      if (seen.add(key)) unique.add(r);
    }

    unique.sort((a, b) {
      final ua = a.universe ?? 9999;
      final ub = b.universe ?? 9999;
      if (ua != ub) return ua.compareTo(ub);

      final aa = a.address ?? 9999;
      final ab = b.address ?? 9999;
      if (aa != ab) return aa.compareTo(ab);

      return a.name.compareTo(b.name);
    });

    return unique;
  }

  int? _resolveFootprintFromGdtf({
    required String? gdtfSpec,
    required String? dmxModeName,
    required Map<String, Uint8List> gdtfMap,
  }) {
    if (gdtfSpec == null || dmxModeName == null) return null;

    final spec = gdtfSpec.trim();
    final mode = dmxModeName.trim();
    if (spec.isEmpty || mode.isEmpty) return null;

    final fileName = spec.split('/').last.split('\\').last;
    final bytes = gdtfMap[fileName.toLowerCase()];
    if (bytes == null) return null;

    return _gdtfReader.footprintForMode(
      gdtfBytes: bytes,
      modeName: mode,
    );
  }

  (int, int)? _readVectorworksOrGenericAddress(XmlElement fixture) {
    for (final addresses in fixture.findElements('Addresses')) {
      for (final addr in addresses.findElements('Address')) {
        final rawText = addr.innerText.trim();
        if (rawText.isEmpty) continue;

        final raw = int.tryParse(rawText);
        if (raw == null) continue;

        final breakStr = addr.getAttribute('break')?.trim();
        final breakIndex = int.tryParse(breakStr ?? '');
        if (breakIndex != null) {
          final u = breakIndex + 1;
          if (u >= 1 && raw >= 1 && raw <= 512) return (u, raw);
        }

        if (raw >= 1 && raw <= 512) return (1, raw);

        if (raw > 512) {
          final u = ((raw - 1) ~/ 512) + 1;
          final a = ((raw - 1) % 512) + 1;
          if (u >= 1 && a >= 1 && a <= 512) return (u, a);
        }
      }
    }
    return null;
  }

  (int, int)? _findUniverseAndAddressFallbackStrict(XmlElement root) {
    for (final e in root.descendants.whereType<XmlElement>()) {
      final uStr = _readStringAttr(e, const ['universe', 'Universe']);
      final aStr = _readStringAttr(e, const ['address', 'Address']);

      final u = _tryParseInt(uStr);
      final a = _tryParseInt(aStr);
      if (u != null && u >= 1 && a != null && a >= 1 && a <= 512) return (u, a);
    }
    return null;
  }

  String? _readStringAttrOrChild(XmlElement element, List<String> keys) {
    final attr = _readStringAttr(element, keys);
    if (attr != null && attr.trim().isNotEmpty) return attr;

    for (final k in keys) {
      final child = element.getElement(k);
      if (child != null) {
        final t = child.innerText.trim();
        if (t.isNotEmpty) return t;
      }
    }
    return null;
  }

  String? _readStringAttr(XmlElement element, List<String> keys) {
    for (final a in element.attributes) {
      if (keys.contains(a.name.local)) return a.value;
    }
    return null;
  }

  int? _tryParseInt(String? v) {
    if (v == null) return null;
    final s = v.trim();
    if (s.isEmpty) return null;
    return int.tryParse(s);
  }
}

class _MvrRow {
  final String? rawId;
  final String name;
  final int? universe;
  final int? address;

  final String? dmxModeName;
  final int? channelCount;

  _MvrRow({
    required this.rawId,
    required this.name,
    required this.universe,
    required this.address,
    required this.dmxModeName,
    required this.channelCount,
  });

  Comparable? get sortIdKey {
    final r = rawId;
    if (r == null || r.trim().isEmpty) return null;
    final cleaned = r.trim();
    final asInt = int.tryParse(cleaned);
    if (asInt != null) return asInt;
    return cleaned.toUpperCase();
  }

  String displayId(int fallbackIndex) {
    final r = rawId;
    if (r == null || r.trim().isEmpty) return fallbackIndex.toString();

    final cleaned = r.trim();
    final asInt = int.tryParse(cleaned);
    if (asInt != null) return cleaned;

    if (cleaned.length <= 10) return cleaned;
    return cleaned.substring(cleaned.length - 8).toUpperCase();
  }

  Map<String, dynamic> toJson() => {
        'rawId': rawId,
        'name': name,
        'universe': universe,
        'address': address,
        'dmxModeName': dmxModeName,
        'channelCount': channelCount,
      };

  factory _MvrRow.fromJson(dynamic raw) {
    final json = raw as Map<String, dynamic>;
    return _MvrRow(
      rawId: json['rawId'] as String?,
      name: (json['name'] as String?) ?? 'Sans nom',
      universe: json['universe'] as int?,
      address: json['address'] as int?,
      dmxModeName: json['dmxModeName'] as String?,
      channelCount: json['channelCount'] as int?,
    );
  }
}
