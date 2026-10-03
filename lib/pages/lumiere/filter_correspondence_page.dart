// Table de correspondance Lee ↔ Roscolux ↔ e-colour+
// Source : Rosco "Lee to Rosco Equivalents" (PDF officiel)
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../about/about_favorites.dart';

const _kAccentLumiere = Color(0xFFFFB703);

class FilterCorrespondencePage extends StatefulWidget {
  const FilterCorrespondencePage({super.key});

  @override
  State<FilterCorrespondencePage> createState() =>
      _FilterCorrespondencePageState();
}

class _FilterCorrespondencePageState extends State<FilterCorrespondencePage> {
  bool _loading = true;
  List<_Equivalent> _all = [];
  String _query = '';
  final _searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final raw =
          await rootBundle.loadString('assets/lumiere/filter_equivalents.json');
      final list = (jsonDecode(raw) as List<dynamic>)
          .map((e) => _Equivalent.fromJson(e as Map<String, dynamic>))
          .toList();
      setState(() {
        _all = list;
        _loading = false;
      });
    } catch (_) {
      setState(() => _loading = false);
    }
  }

  List<_Equivalent> get _visible {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return _all;
    return _all.where((e) {
      return e.lee.toLowerCase().contains(q) ||
          (e.roscolux ?? '').toLowerCase().contains(q) ||
          (e.ecolour ?? '').toLowerCase().contains(q) ||
          e.leeName.toLowerCase().contains(q);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    if (_loading) {
      return Scaffold(
        appBar: AppBar(title: Text(loc.filterCorrespondenceTitle)),
        body: const Center(
          child: CircularProgressIndicator(color: _kAccentLumiere),
        ),
      );
    }
    final visible = _visible;
    return Scaffold(
      appBar: AppBar(
        title: Text(loc.filterCorrespondenceTitle),
        actions: const [
          AboutPinButton(pageId: 'tool:lumiere_filter_correspondence', sectionId: 'main'),
          SizedBox(width: 4),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              controller: _searchCtrl,
              decoration: InputDecoration(
                hintText: loc.filterCorrespondenceSearchHint,
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
                suffixIcon: _query.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchCtrl.clear();
                          setState(() => _query = '');
                        },
                      ),
              ),
              onChanged: (v) => setState(() => _query = v),
            ),
          ),
          // Header row
          Container(
            margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: _kAccentLumiere.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: _kAccentLumiere.withValues(alpha: 0.30)),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Text(loc.filterCorrespondenceColLeeName,
                      style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                          letterSpacing: 0.5,
                          color: _kAccentLumiere)),
                ),
                const Expanded(
                  flex: 2,
                  child: Text('Roscolux',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                          letterSpacing: 0.5,
                          color: _kAccentLumiere)),
                ),
                const Expanded(
                  flex: 2,
                  child: Text('e-colour+',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                          letterSpacing: 0.5,
                          color: _kAccentLumiere)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          // Results count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${loc.filterCorrespondenceResultsCount(visible.length)}'
                '${_query.isNotEmpty ? loc.filterCorrespondenceFilteredOf(_all.length) : ''}',
                style: const TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ),
          ),
          // List
          Expanded(
            child: visible.isEmpty
                ? Center(
                    child: Text(loc.filterCorrespondenceEmpty,
                        style: const TextStyle(color: Colors.white54)),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                    itemCount: visible.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (_, i) {
                      final e = visible[i];
                      return Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: 9),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.lee,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14,
                                      color: _kAccentLumiere,
                                    ),
                                  ),
                                  Text(
                                    e.leeName,
                                    style: TextStyle(
                                        color: Colors.white.withValues(alpha: 0.65),
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                e.roscolux ?? '—',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'monospace',
                                  fontWeight: e.roscolux != null
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                  color: e.roscolux == null
                                      ? Colors.white24
                                      : Colors.white.withValues(alpha: 0.85),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                e.ecolour ?? '—',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'monospace',
                                  fontWeight: e.ecolour != null
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                  color: e.ecolour == null
                                      ? Colors.white24
                                      : Colors.white.withValues(alpha: 0.85),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _Equivalent {
  _Equivalent({
    required this.lee,
    required this.leeName,
    required this.roscolux,
    required this.ecolour,
  });

  final String lee;
  final String leeName;
  final String? roscolux;
  final String? ecolour;

  factory _Equivalent.fromJson(Map<String, dynamic> json) {
    return _Equivalent(
      lee: (json['lee'] as String? ?? '').trim(),
      leeName: (json['leeName'] as String? ?? '').trim(),
      roscolux: (json['roscolux'] as String?)?.trim(),
      ecolour: (json['ecolour'] as String?)?.trim(),
    );
  }
}
