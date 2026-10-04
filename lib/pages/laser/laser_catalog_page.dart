// lib/pages/laser/laser_catalog_page.dart
import 'package:flutter/material.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'package:mon_app_tech/app/constants.dart';
import '../shared/catalog_browser.dart';
import 'laser_catalog.dart';

String _n(double v) {
  if (v == v.roundToDouble()) return '${v.round()}';
  final s = v.toStringAsFixed(2);
  return s.replaceFirst(RegExp(r'0+$'), '').replaceFirst(RegExp(r'\.$'), '');
}

String _power(double mw) =>
    mw >= 1000 ? '${_n(mw / 1000)} W' : '${mw.round()} mW';

/// Catalogue laser. Avec [pick] = true, la fiche propose « Utiliser ces
/// valeurs » et la page renvoie le [LaserProduct] choisi.
class LaserCatalogPage extends StatefulWidget {
  final bool pick;
  const LaserCatalogPage({super.key, this.pick = false});

  @override
  State<LaserCatalogPage> createState() => _LaserCatalogPageState();
}

class _LaserCatalogPageState extends State<LaserCatalogPage> {
  final _repo = LaserCatalogRepository();

  CatalogData<LaserProduct> _toData(AppLocalizations loc, LaserCatalog c) {
    String yesNo(bool? b) => b == null ? '—' : (b ? '✓' : '✗');

    final entries = c.products.map((p) {
      final sub = <String>[
        if (p.type.isNotEmpty) p.type,
        _power(p.powerMilliwatt),
        if (p.divergenceMilliradian != null)
          '${_n(p.divergenceMilliradian!)} mrad',
      ].join(' · ');
      return CatalogEntry<LaserProduct>(
        brand: p.brand,
        title: p.name,
        subtitle: sub,
        badge: p.laserClass.isEmpty ? null : 'Cl. ${p.laserClass}',
        payload: p,
        manualUrl: p.manualUrl,
        note: p.note,
        fields: [
          CatalogField(loc.catalogFieldOpticalPower,
              '${p.powerMilliwatt.round()} mW'),
          if (p.colors.isNotEmpty)
            CatalogField(loc.catalogFieldColors, p.colors.replaceAll(' · ', '\n')),
          CatalogField(
              loc.laserDiameterLabel,
              p.beamDiameterMillimeter != null
                  ? _n(p.beamDiameterMillimeter!)
                  : loc.catalogNotProvided),
          CatalogField(
              loc.laserDivergenceLabel,
              p.divergenceMilliradian != null
                  ? _n(p.divergenceMilliradian!)
                  : loc.catalogNotProvided),
          if (p.scanKpps.isNotEmpty)
            CatalogField(loc.catalogFieldScanner, '${p.scanKpps} kpps'),
          if (p.laserClass.isNotEmpty)
            CatalogField(loc.catalogFieldClass, p.laserClass),
          CatalogField('DMX / ILDA', '${yesNo(p.dmx)} / ${yesNo(p.ilda)}'),
          if (p.weightKilogram != null)
            CatalogField(loc.catalogInfoWeight, '${_n(p.weightKilogram!)} kg'),
          if (p.powerWatt != null)
            CatalogField(
                loc.catalogFieldConsumption, '${p.powerWatt!.round()} W'),
        ],
      );
    }).toList();

    return CatalogData<LaserProduct>(entries, c.updatedAt);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return CatalogBrowserPage<LaserProduct>(
      title: loc.laserCatalogTitle,
      accent: kSectionLaser,
      aboutPageId: widget.pick ? null : 'tool:laser_catalog',
      pickLabel: widget.pick ? loc.catalogUseValues : null,
      detailFooter: loc.laserCatalogDisclaimer,
      loadInitial: () async => _toData(loc, await _repo.loadInitialFast()),
      refreshRemote: () async {
        final c = await _repo.refreshRemote();
        return c == null ? null : _toData(loc, c);
      },
      clearCache: _repo.clearCache,
      lastError: () => _repo.lastError,
    );
  }
}
