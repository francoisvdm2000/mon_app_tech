// lib/pages/audio/sound_catalog_page.dart
import 'package:flutter/material.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'package:mon_app_tech/app/constants.dart';
import '../shared/catalog_browser.dart';
import 'sound_catalog.dart';

String _n(double v) =>
    v == v.roundToDouble() ? '${v.round()}' : v.toStringAsFixed(1);

class SoundCatalogPage extends StatefulWidget {
  const SoundCatalogPage({super.key});

  @override
  State<SoundCatalogPage> createState() => _SoundCatalogPageState();
}

class _SoundCatalogPageState extends State<SoundCatalogPage> {
  final _repo = SoundCatalogRepository();

  CatalogData<Object> _toData(AppLocalizations loc, SoundCatalog c) {
    final entries = <CatalogEntry<Object>>[];

    for (final a in c.amps) {
      final ratings = a.sortedRatings.reversed
          .map((r) => '${_n(r.z)} Ω : ${r.w.round()} W')
          .join('\n');
      entries.add(CatalogEntry<Object>(
        brand: a.brand,
        title: a.model,
        subtitle:
            '${loc.audioChannelsCount(a.channels)} · Z min ${_n(a.zMin)} Ω',
        group: 0,
        payload: a,
        manualUrl: a.manualUrl,
        note: a.note,
        fields: [
          CatalogField(loc.catalogFieldChannels, '${a.channels}'),
          CatalogField(loc.audioMinimumImpedance, _n(a.zMin)),
          CatalogField(loc.catalogFieldPowerPerChannel, ratings),
        ],
      ));
    }

    for (final s in c.speakers) {
      final sub = <String>[
        if (s.type != null) s.type!,
        '${_n(s.zNom)} Ω',
        if (s.pRms != null) '${s.pRms!.round()} W',
      ].join(' · ');
      String? range;
      if (s.ampMin != null && s.ampMax != null) {
        range = '${s.ampMin!.round()}–${s.ampMax!.round()} W';
      } else if (s.ampMax != null) {
        range = '≤ ${s.ampMax!.round()} W';
      } else if (s.ampMin != null) {
        range = '≥ ${s.ampMin!.round()} W';
      }
      entries.add(CatalogEntry<Object>(
        brand: s.brand,
        title: s.label,
        subtitle: sub,
        badge: s.section,
        group: 1,
        payload: s,
        manualUrl: s.manualUrl,
        note: s.note ?? (s.pRms == null && range == null
            ? loc.audioNoPowerData
            : null),
        fields: [
          if (s.type != null) CatalogField(loc.catalogFieldType, s.type!),
          if (s.section != null)
            CatalogField(loc.catalogFieldSection, s.section!),
          CatalogField(loc.audioNominalImpedance, _n(s.zNom)),
          CatalogField(
            loc.catalogFieldPowerHandling,
            s.pRms != null ? '${s.pRms!.round()} W' : loc.catalogNotProvided,
          ),
          if (range != null) CatalogField(loc.catalogFieldRecommendedAmp, range),
        ],
      ));
    }

    return CatalogData<Object>(entries, c.updatedAt);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return CatalogBrowserPage<Object>(
      title: loc.soundCatalogTitle,
      accent: kSectionAudio,
      aboutPageId: 'tool:audio_sound_catalog',
      groupLabels: [loc.catalogAmplifiers, loc.catalogSpeakers],
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
