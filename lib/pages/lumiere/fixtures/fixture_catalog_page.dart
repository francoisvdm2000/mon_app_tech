// lib/pages/lumiere/fixtures/fixture_catalog_page.dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../../app/ui/widgets.dart';

class FixtureCatalogPage extends StatefulWidget {
  const FixtureCatalogPage({super.key});

  @override
  State<FixtureCatalogPage> createState() => _FixtureCatalogPageState();
}

class _FixtureCatalogPageState extends State<FixtureCatalogPage> {
  late Future<Map<String, dynamic>> _catalogFuture;

  @override
  void initState() {
    super.initState();
    _catalogFuture = _loadCatalog();
  }

  Future<Map<String, dynamic>> _loadCatalog() async {
    // Chargement du catalogue depuis assets (inchangé)
    final raw =
        await rootBundle.loadString('assets/fixtures/fixtures_catalog.json');
    return json.decode(raw) as Map<String, dynamic>;
  }

  void _reload() {
    setState(() {
      _catalogFuture = _loadCatalog();
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.fixtureCatalog_catalogue),
        actions: [
          IconButton(
            tooltip: loc.fixtureCatalog_mettre_a_jour,
            icon: const Icon(Icons.refresh),
            onPressed: _reload,
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _catalogFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;
          final manufacturers =
              (data['manufacturers'] as List<dynamic>? ?? const <dynamic>[]);
          final types = (data['types'] as List<dynamic>? ?? const <dynamic>[]);
          final products =
              (data['products'] as List<dynamic>? ?? const <dynamic>[]);

          // Collecte des modes DMX uniques (inchangé)
          final modeNames = <String>{};
          for (final p in products) {
            final modes =
                (p as Map<String, dynamic>)['dmxModes'] as List<dynamic>?;
            if (modes == null) continue;
            for (final m in modes) {
              final name = (m as Map<String, dynamic>)['name']?.toString();
              if (name != null && name.trim().isNotEmpty) {
                modeNames.add(name.trim());
              }
            }
          }
          final modeNamesSorted = modeNames.toList()..sort();

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              SectionCard(
                icon: Icons.lightbulb,
                title: loc.fixtureCatalog_constructeur_manufacturers_length(
                    manufacturers.length),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final m in manufacturers)
                      Chip(label: Text(m.toString())),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SectionCard(
                icon: Icons.settings,
                title: loc.fixtureCatalog_type_de_projecteur_types_length(
                    types.length),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final t in types) Chip(label: Text(t.toString())),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SectionCard(
                icon: Icons.list,
                title:
                    loc.fixtureCatalog_modele_products_length(products.length),
                child: Column(
                  children: [
                    for (final p in products)
                      _ProductTile(product: p as Map<String, dynamic>),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SectionCard(
                icon: Icons.info,
                title: loc.fixtureCatalog_mode_dmx_modenames_length(
                    modeNamesSorted.length),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final name in modeNamesSorted) Chip(label: Text(name)),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ProductTile extends StatelessWidget {
  const _ProductTile({required this.product});

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    final manufacturer = product['manufacturer']?.toString() ?? '';
    final model = product['model']?.toString() ?? '';
    final type = product['type']?.toString() ?? '';

    final manualUrl = product['manualUrl']?.toString();
    final dmxChartUrl = product['dmxChartUrl']?.toString();

    final dmxModes =
        (product['dmxModes'] as List<dynamic>? ?? const <dynamic>[])
            .cast<Map<String, dynamic>>();

    String? formatValue(dynamic v) {
      if (v == null) return null;
      final s = v.toString().trim();
      if (s.isEmpty) return null;
      return s;
    }

    // Infos simples (inchangé, juste labels localisés)
    final channels = formatValue(product['dmxChannels']);
    final weight = formatValue(product['weightKg']);
    final power = formatValue(product['powerW']);
    final lumens = formatValue(product['lumens']);

    Widget infoLine(String label, String? value) {
      final v = value ?? loc.common_non_renseigne;
      return Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Text(loc.common_label_value(label, v),
            style: Theme.of(context).textTheme.bodySmall),
      );
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$manufacturer — $model',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (type.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(type, style: Theme.of(context).textTheme.bodySmall),
              ),
            const SizedBox(height: 8),
            infoLine(loc.fixtureCatalog_canaux_dmx, channels),
            infoLine(
                loc.fixtureCatalog_poids, weight == null ? null : '$weight kg'),
            infoLine(loc.fixtureCatalog_puissance,
                power == null ? null : '$power W'),
            infoLine(loc.fixtureCatalog_flux_lumineux,
                lumens == null ? null : '$lumens lm'),
            if (dmxModes.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                loc.fixtureCatalog_dmx_section,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 4),
              for (final m in dmxModes)
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    loc.fixtureCatalog_mode_label(
                      m['name']?.toString() ?? '',
                      (m['dmxChannels'] is int)
                          ? m['dmxChannels'] as int
                          : int.tryParse(m['dmxChannels']?.toString() ?? '') ??
                              0,
                    ),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
            ],
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (manualUrl != null && manualUrl.trim().isNotEmpty)
                  OutlinedButton.icon(
                    onPressed: () => openUrl(context, manualUrl),
                    icon: const Icon(Icons.menu_book),
                    label: Text(loc.fixtureCatalog_ouvrir_le_manuel),
                  ),
                if (dmxChartUrl != null && dmxChartUrl.trim().isNotEmpty)
                  OutlinedButton.icon(
                    onPressed: () => openUrl(context, dmxChartUrl),
                    icon: const Icon(Icons.table_chart),
                    label: Text(loc.fixtureCatalog_ouvrir_la_charte_dmx),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
