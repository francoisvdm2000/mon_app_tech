import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../l10n/app_localizations.dart';
import 'fixture_hybrid_repository.dart';
import 'fixture_models.dart';

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
          Card(
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
      padding: const EdgeInsets.only(bottom: 8),
      child: Text('$label : $value'),
    );
  }
}
