// lib/pages/shared/catalog_browser.dart
//
// Navigateur de catalogue générique (son, laser…) :
//   marques → produits, recherche plein texte, fiche détaillée,
//   lien manuel, mise à jour depuis GitHub, mode « sélection ».

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../about/about_favorites.dart';

const _kBg = Color(0xFF0D0D14);
const _kCard = Color(0xFF161622);
const _kField = Color(0xFF0E0E18);
const _kSheet = Color(0xFF12121E);

class CatalogField {
  final String label;
  final String value;
  const CatalogField(this.label, this.value);
}

class CatalogEntry<T> {
  final String brand;
  final String title;
  final String subtitle;
  final String? badge;
  final int group;
  final List<CatalogField> fields;
  final String? note;
  final String? manualUrl;
  final T payload;

  const CatalogEntry({
    required this.brand,
    required this.title,
    required this.subtitle,
    required this.payload,
    this.badge,
    this.group = 0,
    this.fields = const [],
    this.note,
    this.manualUrl,
  });
}

class CatalogData<T> {
  final List<CatalogEntry<T>> entries;
  final DateTime? updatedAt;
  const CatalogData(this.entries, this.updatedAt);
}

class CatalogBrowserPage<T> extends StatefulWidget {
  final String title;
  final Color accent;
  final String? aboutPageId;

  /// Libellés des groupes (ex. Amplis / Enceintes). null = pas de filtre.
  final List<String>? groupLabels;

  final Future<CatalogData<T>> Function() loadInitial;
  final Future<CatalogData<T>?> Function() refreshRemote;
  final Future<void> Function() clearCache;
  final String Function() lastError;

  /// Si non null : la fiche affiche un bouton qui renvoie le produit
  /// (Navigator.pop(context, payload)).
  final String? pickLabel;

  /// Message affiché en bas de chaque fiche (ex. avertissement laser).
  final String? detailFooter;

  const CatalogBrowserPage({
    super.key,
    required this.title,
    required this.accent,
    required this.loadInitial,
    required this.refreshRemote,
    required this.clearCache,
    required this.lastError,
    this.aboutPageId,
    this.groupLabels,
    this.pickLabel,
    this.detailFooter,
  });

  @override
  State<CatalogBrowserPage<T>> createState() => _CatalogBrowserPageState<T>();
}

class _CatalogBrowserPageState<T> extends State<CatalogBrowserPage<T>> {
  final _searchCtrl = TextEditingController();
  CatalogData<T>? _data;
  bool _loading = true;
  bool _refreshing = false;
  String? _brand;
  int _group = 0;

  @override
  void initState() {
    super.initState();
    _boot();
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _boot() async {
    try {
      final initial = await widget.loadInitial();
      if (!mounted) return;
      setState(() {
        _data = initial;
        _loading = false;
      });
      final remote = await widget.refreshRemote();
      if (!mounted || remote == null) return;
      setState(() => _data = remote);
    } catch (_) {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  Future<void> _forceRefresh() async {
    final loc = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    setState(() => _refreshing = true);
    try {
      await widget.clearCache();
      final remote = await widget.refreshRemote();
      if (!mounted) return;
      if (remote == null) {
        final err = widget.lastError().trim();
        messenger.showSnackBar(SnackBar(
          content: Text(err.isEmpty
              ? loc.catalogSyncFailedUnknown
              : loc.catalogSyncFailed(err)),
        ));
      } else {
        setState(() => _data = remote);
        messenger.showSnackBar(SnackBar(content: Text(loc.catalogUpdated)));
      }
    } catch (e) {
      if (!mounted) return;
      messenger.showSnackBar(
          SnackBar(content: Text(loc.catalogSyncError(e.toString()))));
    } finally {
      if (mounted) setState(() => _refreshing = false);
    }
  }

  List<CatalogEntry<T>> get _groupEntries {
    final all = _data?.entries ?? const [];
    if (widget.groupLabels == null) return all;
    return all.where((e) => e.group == _group).toList();
  }

  List<MapEntry<String, int>> get _brands {
    final counts = <String, int>{};
    for (final e in _groupEntries) {
      counts[e.brand] = (counts[e.brand] ?? 0) + 1;
    }
    final list = counts.entries.toList()
      ..sort((a, b) => a.key.toLowerCase().compareTo(b.key.toLowerCase()));
    return list;
  }

  List<CatalogEntry<T>> _search(String q) {
    final tokens = q
        .toLowerCase()
        .split(RegExp(r'\s+'))
        .where((t) => t.isNotEmpty)
        .toList();
    if (tokens.isEmpty) return const [];
    return _groupEntries.where((e) {
      final hay = '${e.brand} ${e.title} ${e.subtitle} ${e.badge ?? ''}'
          .toLowerCase();
      return tokens.every(hay.contains);
    }).toList();
  }

  String _fmtDate(DateTime d) {
    String two(int v) => v.toString().padLeft(2, '0');
    final l = d.toLocal();
    return '${two(l.day)}/${two(l.month)}/${l.year}';
  }

  Future<void> _openDetail(CatalogEntry<T> e) async {
    final picked = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _DetailSheet<T>(
        entry: e,
        accent: widget.accent,
        pickLabel: widget.pickLabel,
        footer: widget.detailFooter,
      ),
    );
    if (picked == true && mounted) {
      Navigator.of(context).pop(e.payload);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final searching = _searchCtrl.text.trim().isNotEmpty;
    final updatedAt = _data?.updatedAt;

    Widget body;
    if (_loading) {
      body = const Center(child: CircularProgressIndicator());
    } else {
      final children = <Widget>[];
      if (updatedAt != null) {
        children.add(Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 4),
          child: Text(
            loc.catalogLastUpdate(_fmtDate(updatedAt)),
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 12,
              color: Colors.white.withValues(alpha: 0.5),
            ),
          ),
        ));
      }
      final groups = widget.groupLabels;
      if (groups != null) {
        children.add(Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Wrap(
            spacing: 8,
            children: [
              for (var i = 0; i < groups.length; i++)
                ChoiceChip(
                  label: Text(groups[i]),
                  selected: _group == i,
                  selectedColor: widget.accent.withValues(alpha: 0.25),
                  onSelected: (_) => setState(() {
                    _group = i;
                    _brand = null;
                  }),
                ),
            ],
          ),
        ));
      }
      children.add(Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: TextField(
          controller: _searchCtrl,
          onChanged: (_) => setState(() {}),
          textInputAction: TextInputAction.search,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: loc.catalogSearchHint,
            prefixIcon: Icon(Icons.search_rounded,
                color: widget.accent.withValues(alpha: 0.8)),
            suffixIcon: searching
                ? IconButton(
                    icon: const Icon(Icons.clear_rounded),
                    onPressed: () => setState(_searchCtrl.clear),
                  )
                : null,
            filled: true,
            fillColor: _kCard,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ));

      if (searching) {
        final res = _search(_searchCtrl.text);
        if (res.isEmpty) {
          children.add(Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Text(loc.catalogSearchNoResults,
                  style: const TextStyle(color: Colors.white54)),
            ),
          ));
        } else {
          children.add(Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 4),
            child: Text(loc.catalogSearchResultsCount(res.length),
                style: const TextStyle(color: Colors.white54, fontSize: 12)),
          ));
          for (final e in res.take(120)) {
            children.add(_EntryTile<T>(
              entry: e,
              accent: widget.accent,
              showBrand: true,
              onTap: () => _openDetail(e),
            ));
          }
        }
      } else if (_brand == null) {
        for (final b in _brands) {
          children.add(_BrandTile(
            brand: b.key,
            count: b.value,
            accent: widget.accent,
            onTap: () => setState(() => _brand = b.key),
          ));
        }
      } else {
        children.add(Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => setState(() => _brand = null),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios_new_rounded,
                      size: 16, color: widget.accent),
                  const SizedBox(width: 8),
                  Text(
                    _brand!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
        for (final e in _groupEntries.where((x) => x.brand == _brand)) {
          children.add(_EntryTile<T>(
            entry: e,
            accent: widget.accent,
            showBrand: false,
            onTap: () => _openDetail(e),
          ));
        }
      }

      body = ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
        children: children,
      );
    }

    return PopScope(
      canPop: _brand == null || _searchCtrl.text.trim().isNotEmpty,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop && _brand != null) setState(() => _brand = null);
      },
      child: Scaffold(
        backgroundColor: _kBg,
        appBar: AppBar(
          backgroundColor: _kBg,
          surfaceTintColor: Colors.transparent,
          title: Text(widget.title,
              style: const TextStyle(fontWeight: FontWeight.w800)),
          actions: [
            if (widget.aboutPageId != null)
              AboutPinButton(pageId: widget.aboutPageId!, sectionId: 'main'),
            if (_refreshing)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              )
            else
              IconButton(
                tooltip: loc.catalogUpdateTooltip,
                icon: const Icon(Icons.cloud_download_rounded),
                onPressed: _forceRefresh,
              ),
          ],
        ),
        body: body,
      ),
    );
  }
}

// ── Tuiles ────────────────────────────────────────────────────────────────────

class _BrandTile extends StatelessWidget {
  final String brand;
  final int count;
  final Color accent;
  final VoidCallback onTap;
  const _BrandTile({
    required this.brand,
    required this.count,
    required this.accent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final initials = brand
        .replaceAll(RegExp(r'[^A-Za-z0-9 ]'), ' ')
        .trim()
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty)
        .take(2)
        .map((w) => w[0].toUpperCase())
        .join();
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Material(
        color: _kCard,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: accent.withValues(alpha: 0.15),
                    border: Border.all(color: accent.withValues(alpha: 0.45)),
                  ),
                  child: Text(
                    initials.isEmpty ? '?' : initials,
                    style: TextStyle(
                        color: accent,
                        fontWeight: FontWeight.w800,
                        fontSize: 12),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(brand,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                      Text(loc.audioModelsCount(count),
                          style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.5),
                              fontSize: 12)),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right_rounded,
                    color: Colors.white.withValues(alpha: 0.35)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EntryTile<T> extends StatelessWidget {
  final CatalogEntry<T> entry;
  final Color accent;
  final bool showBrand;
  final VoidCallback onTap;
  const _EntryTile({
    required this.entry,
    required this.accent,
    required this.showBrand,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Material(
        color: _kCard,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (showBrand)
                        Text(
                          entry.brand.toUpperCase(),
                          style: TextStyle(
                            fontSize: 9.5,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.0,
                            color: accent,
                          ),
                        ),
                      Text(entry.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 2),
                      Text(entry.subtitle,
                          style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.5),
                              fontSize: 12)),
                    ],
                  ),
                ),
                if (entry.badge != null && entry.badge!.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: accent.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(entry.badge!,
                        style: TextStyle(
                            color: accent,
                            fontSize: 11,
                            fontWeight: FontWeight.w700)),
                  ),
                Icon(Icons.chevron_right_rounded,
                    color: Colors.white.withValues(alpha: 0.3)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Fiche produit ────────────────────────────────────────────────────────────

class _DetailSheet<T> extends StatelessWidget {
  final CatalogEntry<T> entry;
  final Color accent;
  final String? pickLabel;
  final String? footer;
  const _DetailSheet({
    required this.entry,
    required this.accent,
    required this.pickLabel,
    required this.footer,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final maxH = MediaQuery.of(context).size.height * 0.85;
    final url = (entry.manualUrl ?? '').trim();
    final hasUrl = url.isNotEmpty;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxH),
      child: Container(
        decoration: const BoxDecoration(
          color: _kSheet,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 14),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                Text(entry.brand.toUpperCase(),
                    style: TextStyle(
                        color: accent,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2)),
                const SizedBox(height: 2),
                Text(entry.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w800)),
                if (entry.subtitle.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(entry.subtitle,
                      style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.55))),
                ],
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: _kField,
                    borderRadius: BorderRadius.circular(14),
                    border:
                        Border.all(color: Colors.white.withValues(alpha: 0.08)),
                  ),
                  child: Column(
                    children: [
                      for (var i = 0; i < entry.fields.length; i++)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            border: i == 0
                                ? null
                                : Border(
                                    top: BorderSide(
                                        color: Colors.white
                                            .withValues(alpha: 0.06))),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Text(entry.fields[i].label,
                                    style: TextStyle(
                                        color: Colors.white
                                            .withValues(alpha: 0.6))),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  entry.fields[i].value,
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                if (entry.note != null && entry.note!.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Text(entry.note!,
                      style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.55),
                          fontSize: 12.5,
                          height: 1.4)),
                ],
                if (footer != null) ...[
                  const SizedBox(height: 10),
                  Text(footer!,
                      style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.4),
                          fontSize: 11.5,
                          height: 1.4)),
                ],
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        icon: const Icon(Icons.menu_book_rounded),
                        label: Text(loc.catalogOpenManual),
                        onPressed: hasUrl
                            ? () => launchUrl(Uri.parse(url),
                                mode: LaunchMode.externalApplication)
                            : null,
                      ),
                    ),
                    if (pickLabel != null) ...[
                      const SizedBox(width: 10),
                      Expanded(
                        child: FilledButton.icon(
                          style: FilledButton.styleFrom(
                              backgroundColor: accent,
                              foregroundColor: Colors.black),
                          icon: const Icon(Icons.check_rounded),
                          label: Text(pickLabel!),
                          onPressed: () => Navigator.of(context).pop(true),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
