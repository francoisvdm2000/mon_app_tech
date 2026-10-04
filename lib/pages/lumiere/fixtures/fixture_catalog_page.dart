import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'fixture_hybrid_repository.dart';
import 'fixture_models.dart';
import '../../about/about_favorites.dart';

class FixtureCatalogPage extends StatefulWidget {
  const FixtureCatalogPage({super.key});

  @override
  State<FixtureCatalogPage> createState() => _FixtureCatalogPageState();
}

class _FixtureCatalogPageState extends State<FixtureCatalogPage>
    with SingleTickerProviderStateMixin {
  final FixtureHybridRepository _repo = FixtureHybridRepository();

  FixtureCatalog? _catalog;
  bool _loading = true;
  bool _refreshing = false;

  String? _manufacturerName;
  String? _type;
  String? _productName;
  String? _dmxModeName;

  late final AnimationController _spinController;

  final TextEditingController _searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _spinController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _boot();
  }

  @override
  void dispose() {
    _spinController.dispose();
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _boot() async {
    try {
      final initial = await _repo.loadInitialFast();
      if (!mounted) return;
      setState(() {
        _catalog = initial;
        _loading = false;
      });

      final remote = await _repo.refreshRemote();
      if (!mounted) return;
      if (remote != null) {
        setState(() => _catalog = remote);
      }
    } catch (_) {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  Future<void> _forceRefreshRemote() async {
    final loc = AppLocalizations.of(context);

    setState(() => _refreshing = true);
    _spinController.repeat();

    try {
      await _repo.clearCache();
      final remote = await _repo.refreshRemote();
      if (!mounted) return;

      if (remote == null) {
        final err = _repo.lastError.trim();
        final msg = err.isEmpty
            ? loc.catalogSyncFailedUnknown
            : loc.catalogSyncFailed(err);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(msg)));
      } else {
        setState(() => _catalog = remote);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(loc.catalogUpdated)),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.catalogSyncError(e.toString()))),
      );
    } finally {
      if (mounted) {
        setState(() {
          _refreshing = false;
          _spinController.stop();
        });
      }
    }
  }

  String _formatDate(DateTime d) {
    String two(int v) => v.toString().padLeft(2, '0');
    return '${two(d.day)}/${two(d.month)}/${d.year}';
  }

  String _formatIntOrNA(AppLocalizations loc, int? value, String unit) {
    if (value == null || value <= 0) return loc.catalogNotProvided;
    return '$value $unit';
  }

  String _formatDoubleOrNA(AppLocalizations loc, double? value, String unit) {
    if (value == null || value <= 0) return loc.catalogNotProvided;
    final s =
        (value % 1 == 0) ? value.toStringAsFixed(0) : value.toStringAsFixed(1);
    return '$s $unit';
  }

  /// Recherche plein texte : tous les mots doivent apparaître dans
  /// « marque modèle type » (insensible à la casse).
  List<(Manufacturer, Product)> _search(String query) {
    final tokens = query
        .toLowerCase()
        .split(RegExp(r'\s+'))
        .where((t) => t.isNotEmpty)
        .toList();
    if (tokens.isEmpty || _catalog == null) return const [];
    final out = <(Manufacturer, Product)>[];
    for (final m in _catalog!.manufacturers) {
      for (final p in m.products) {
        final hay = '${m.name} ${p.name} ${p.type}'.toLowerCase();
        if (tokens.every(hay.contains)) out.add((m, p));
      }
    }
    out.sort((a, b) {
      final c = a.$1.name.toLowerCase().compareTo(b.$1.name.toLowerCase());
      return c != 0 ? c : a.$2.name.toLowerCase().compareTo(b.$2.name.toLowerCase());
    });
    return out;
  }

  void _selectFromSearch(Manufacturer m, Product p) {
    FocusScope.of(context).unfocus();
    setState(() {
      _manufacturerName = m.name;
      _type = p.type;
      _productName = p.name;
      _dmxModeName = null;
      _searchCtrl.clear();
    });
  }

  Widget _searchField(AppLocalizations loc) {
    final searching = _searchCtrl.text.trim().isNotEmpty;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: _searchCtrl,
        onChanged: (_) => setState(() {}),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: loc.catalogSearchHint,
          prefixIcon: const Icon(Icons.search_rounded),
          suffixIcon: searching
              ? IconButton(
                  icon: const Icon(Icons.clear_rounded),
                  onPressed: () => setState(_searchCtrl.clear),
                )
              : null,
          filled: true,
          fillColor: const Color(0xFF161622),
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  List<Widget> _searchResults(AppLocalizations loc) {
    final all = _search(_searchCtrl.text);
    if (all.isEmpty) {
      return [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Text(loc.catalogSearchNoResults,
                style: const TextStyle(color: Colors.white54)),
          ),
        ),
      ];
    }
    const maxShown = 80;
    final shown = all.take(maxShown);
    return [
      Padding(
        padding: const EdgeInsets.only(bottom: 8, left: 4),
        child: Text(
          loc.catalogSearchResultsCount(all.length),
          style: const TextStyle(color: Colors.white54, fontSize: 12),
        ),
      ),
      for (final (m, p) in shown)
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Material(
            color: const Color(0xFF161622),
            borderRadius: BorderRadius.circular(14),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              title: Text(p.name,
                  style: const TextStyle(fontWeight: FontWeight.w700)),
              subtitle: Text('${m.name} · ${p.type}'),
              trailing: _dmxSummary(p) == null
                  ? const Icon(Icons.chevron_right_rounded)
                  : Text(_dmxSummary(p)!,
                      style: const TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.w600)),
              onTap: () => _selectFromSearch(m, p),
            ),
          ),
        ),
    ];
  }

  /// « 12–38 ch » d'après les modes DMX, ou le nombre de canaux simple.
  String? _dmxSummary(Product p) {
    final chans = p.modes.map((m) => m.dmxChannels).where((c) => c > 0).toList();
    if (chans.isEmpty) {
      final c = p.dmxChannels;
      return (c == null || c <= 0) ? null : '$c ch';
    }
    chans.sort();
    return chans.first == chans.last
        ? '${chans.first} ch'
        : '${chans.first}–${chans.last} ch';
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    if (_loading || _catalog == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final manufacturers = _catalog!.manufacturers;

    final selectedManufacturer = manufacturers
        .where((m) => m.name == _manufacturerName)
        .cast<Manufacturer?>()
        .firstWhere((m) => true, orElse: () => null);

    final types = selectedManufacturer == null
        ? <String>[]
        : selectedManufacturer.products.map((p) => p.type).toSet().toList()
      ..sort();

    final products = (selectedManufacturer == null || _type == null)
        ? <Product>[]
        : selectedManufacturer.products.where((p) => p.type == _type).toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    final selectedProduct = products
        .where((p) => p.name == _productName)
        .cast<Product?>()
        .firstWhere((p) => true, orElse: () => null);

    final modes = selectedProduct?.modes ?? <DmxMode>[];
    final modeNames = modes.map((m) => m.name).toList();

    final effectiveModeName = modeNames.isEmpty
        ? null
        : (modeNames.contains(_dmxModeName) ? _dmxModeName : modeNames.first);

    final effectiveMode = (effectiveModeName == null)
        ? null
        : modes.firstWhere((m) => m.name == effectiveModeName);

    final dmxValue = selectedProduct == null
        ? null
        : modes.isNotEmpty
            ? effectiveMode?.dmxChannels
            : selectedProduct.dmxChannels;

    final lastUpdate = _formatDate(_catalog!.updatedAt);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.lightCatalogTitle),
        actions: [
          const AboutPinButton(pageId: 'tool:lumiere_fixture_catalog', sectionId: 'main'),
          if (_refreshing)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RotationTransition(
                turns: _spinController,
                child: const Icon(Icons.sync),
              ),
            )
          else
            IconButton(
              tooltip: loc.catalogUpdateTooltip,
              icon: const Icon(Icons.cloud_download),
              onPressed: _forceRefreshRemote,
            ),
          IconButton(
            tooltip: loc.catalogResetTooltip,
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _manufacturerName = null;
                _type = null;
                _productName = null;
                _dmxModeName = null;
              });
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              loc.catalogLastUpdate(lastUpdate),
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          _searchField(loc),
          if (_searchCtrl.text.trim().isNotEmpty)
            ..._searchResults(loc)
          else ...[
          _dropdown<String>(
            title: loc.catalogManufacturerTitle(manufacturers.length),
            value: _manufacturerName,
            items: manufacturers.map((m) => m.name).toList(),
            onChanged: (v) {
              setState(() {
                _manufacturerName = v;
                _type = null;
                _productName = null;
                _dmxModeName = null;
              });
            },
          ),
          _dropdown<String>(
            title: loc.catalogTypeTitle(types.length),
            value: _type,
            items: types,
            onChanged: (v) {
              setState(() {
                _type = v;
                _productName = null;
                _dmxModeName = null;
              });
            },
          ),
          _dropdown<String>(
            title: loc.catalogModelTitle(products.length),
            value: _productName,
            items: products.map((p) => p.name).toList(),
            onChanged: (v) {
              setState(() {
                _productName = v;
                _dmxModeName = null;
              });
            },
          ),
          _dropdown<String>(
            title: loc.catalogDmxModeTitle(modeNames.length),
            value: effectiveModeName,
            items: modeNames,
            labelBuilder: (name) {
              final m = modes.firstWhere((x) => x.name == name);
              return loc.catalogDmxModeItem(m.name, m.dmxChannels);
            },
            onChanged: modeNames.isEmpty
                ? null
                : (v) {
                    setState(() => _dmxModeName = v);
                  },
          ),
          const SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF161622),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _info(
                    loc.catalogInfoDmxChannels,
                    dmxValue?.toString() ?? loc.catalogNotProvided,
                  ),
                  _info(
                    loc.catalogInfoWeight,
                    _formatDoubleOrNA(
                        loc, selectedProduct?.weightKilogram, 'kg'),
                  ),
                  _info(
                    loc.catalogInfoPower,
                    _formatIntOrNA(loc, selectedProduct?.powerWatt, 'W'),
                  ),
                  _info(
                    loc.catalogInfoLuminousFlux,
                    _formatIntOrNA(
                        loc, selectedProduct?.luminousFluxLumen, 'lm'),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.menu_book),
                          label: Text(loc.catalogOpenManual),
                          onPressed: selectedProduct?.manualUrl == null
                              ? null
                              : () => launchUrl(
                                  Uri.parse(selectedProduct!.manualUrl!)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.schema),
                          label: Text(loc.catalogOpenDmxChart),
                          onPressed: selectedProduct?.dmxChartUrl == null
                              ? null
                              : () => launchUrl(
                                  Uri.parse(selectedProduct!.dmxChartUrl!)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ],
        ],
      ),
    );
  }

  Widget _dropdown<T>({
    required String title,
    required T? value,
    required List<T> items,
    required ValueChanged<T?>? onChanged,
    String Function(T)? labelBuilder,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          DropdownButtonFormField<T>(
            isExpanded: true,
            initialValue: value,
            items: items
                .map(
                  (e) => DropdownMenuItem<T>(
                    value: e,
                    child: Text(labelBuilder?.call(e) ?? e.toString()),
                  ),
                )
                .toList(),
            onChanged: items.isEmpty ? null : onChanged,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _info(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
