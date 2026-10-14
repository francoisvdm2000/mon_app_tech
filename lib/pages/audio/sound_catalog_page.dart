// lib/pages/audio/sound_catalog_page.dart
import 'package:flutter/material.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'package:mon_app_tech/app/constants.dart';
import '../shared/catalog_browser.dart';
import 'amp_speaker_presets.dart';
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

    String? rangeOf(SpkPreset s) {
      if (s.ampMin != null && s.ampMax != null) {
        return '${s.ampMin!.round()}–${s.ampMax!.round()} W';
      } else if (s.ampMax != null) {
        return '≤ ${s.ampMax!.round()} W';
      } else if (s.ampMin != null) {
        return '≥ ${s.ampMin!.round()} W';
      }
      return null;
    }

    String specsOf(SpkPreset s) {
      final range = rangeOf(s);
      return [
        '${_n(s.zNom)} Ω',
        if (s.pRms != null) '${s.pRms!.round()} W',
        if (range != null) 'amp $range',
      ].join(' · ');
    }

    // Une fiche par enceinte : les sections (LF, HF…) d'une enceinte active
    // sont regroupées dans la même fiche.
    for (final m in groupSpeakerModels(c.speakers)) {
      String secName(SpkPreset s) => s.section ?? loc.audioSectionPassive;

      if (!m.hasSections) {
        final s = m.sections.first;
        final range = rangeOf(s);
        entries.add(CatalogEntry<Object>(
          brand: m.brand,
          title: m.model,
          subtitle: [
            if (m.type != null) m.type!,
            '${_n(s.zNom)} Ω',
            if (s.pRms != null) '${s.pRms!.round()} W',
          ].join(' · '),
          group: 1,
          payload: m,
          manualUrl: m.manualUrl,
          note: m.note ?? (m.hasPowerData ? null : loc.audioNoPowerData),
          fields: [
            if (m.type != null) CatalogField(loc.catalogFieldType, m.type!),
            CatalogField(loc.audioNominalImpedance, _n(s.zNom)),
            CatalogField(
              loc.catalogFieldPowerHandling,
              s.pRms != null ? '${s.pRms!.round()} W' : loc.catalogNotProvided,
            ),
            if (range != null) CatalogField(loc.catalogFieldRecommendedAmp, range),
          ],
        ));
        continue;
      }

      entries.add(CatalogEntry<Object>(
        brand: m.brand,
        title: m.model,
        subtitle: [
          if (m.type != null) m.type!,
          m.sections.map((s) => '${secName(s)} ${_n(s.zNom)} Ω').join(' · '),
        ].join(' · '),
        badge: m.sections.map(secName).join(' · '),
        group: 1,
        payload: m,
        manualUrl: m.manualUrl,
        note: m.note ?? (m.hasPowerData ? null : loc.audioNoPowerData),
        fields: [
          if (m.type != null) CatalogField(loc.catalogFieldType, m.type!),
          for (final s in m.sections)
            CatalogField('${loc.catalogFieldSection} ${secName(s)}', specsOf(s)),
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
