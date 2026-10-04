// lib/pages/audio/sound_catalog.dart
//
// Catalogue son (amplis + enceintes) publié depuis la feuille Google
// « Catalogue son » vers GitHub (sound.json).

import '../shared/remote_json_catalog.dart';
import 'amp_speaker_presets.dart';

class SoundCatalog {
  final DateTime? updatedAt;
  final List<AmpPreset> amps;
  final List<SpkPreset> speakers;

  const SoundCatalog({
    required this.updatedAt,
    required this.amps,
    required this.speakers,
  });

  bool get isEmpty => amps.isEmpty && speakers.isEmpty;

  /// Liste intégrée au code : filet de sécurité si aucun JSON n'est lisible.
  static const SoundCatalog builtIn = SoundCatalog(
    updatedAt: null,
    amps: kAmpPresets,
    speakers: kSpkPresets,
  );

  factory SoundCatalog.fromJson(Map<String, dynamic> json) {
    final amps = <AmpPreset>[];
    final speakers = <SpkPreset>[];

    for (final m in jList(json['manufacturers'])) {
      if (m is! Map) continue;
      final brand = jStr(m['name']);
      if (brand.isEmpty) continue;

      for (final a in jList(m['amps'])) {
        if (a is! Map) continue;
        final name = jStr(a['name']);
        final zMin = jNum(a['zMinOhm']);
        if (name.isEmpty || zMin == null) continue;

        final ratings = <R>[];
        for (final r in jList(a['ratings'])) {
          if (r is! Map) continue;
          final ohm = jNum(r['ohm']);
          final watt = jNum(r['watt']);
          if (ohm != null && watt != null) ratings.add(R(ohm, watt));
        }
        if (ratings.isEmpty) continue;

        final note = jStr(a['note']);
        final url = jStr(a['manualUrl']);
        amps.add(AmpPreset(
          brand: brand,
          model: name,
          channels: (jNum(a['channels']) ?? 1).round(),
          zMin: zMin,
          ratings: ratings,
          note: note.isEmpty ? null : note,
          manualUrl: url.isEmpty ? null : url,
        ));
      }

      for (final s in jList(m['speakers'])) {
        if (s is! Map) continue;
        final name = jStr(s['name']);
        final zNom = jNum(s['zNomOhm']);
        if (name.isEmpty || zNom == null) continue;

        final section = jStr(s['section']);
        final note = jStr(s['note']);
        final type = jStr(s['type']);
        final url = jStr(s['manualUrl']);
        speakers.add(SpkPreset(
          brand: brand,
          model: name,
          section: section.isEmpty ? null : section,
          zNom: zNom,
          pRms: jNum(s['rmsWatt']),
          ampMin: jNum(s['ampMinWatt']),
          ampMax: jNum(s['ampMaxWatt']),
          note: note.isEmpty ? null : note,
          type: type.isEmpty ? null : type,
          manualUrl: url.isEmpty ? null : url,
        ));
      }
    }

    return SoundCatalog(
      updatedAt: jDate(json['updatedAt']),
      amps: amps,
      speakers: speakers,
    );
  }
}

class SoundCatalogRepository {
  final RemoteJsonCatalog _source = RemoteJsonCatalog(
    cacheKey: 'sound_catalog_cache_v1',
    remoteUrl: '${kCatalogDataBaseUrl}sound.json',
    assetPath: 'assets/catalogs/sound.json',
  );

  String get lastSource => _source.lastSource;
  String get lastError => _source.lastError;

  Future<void> clearCache() => _source.clearCache();

  Future<SoundCatalog> loadInitialFast() async {
    final json = await _source.loadInitialFast();
    final cat = SoundCatalog.fromJson(json);
    return cat.isEmpty ? SoundCatalog.builtIn : cat;
  }

  Future<SoundCatalog?> refreshRemote() async {
    final json = await _source.refreshRemote();
    if (json == null) return null;
    final cat = SoundCatalog.fromJson(json);
    return cat.isEmpty ? null : cat;
  }
}
