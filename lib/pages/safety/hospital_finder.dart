// lib/pages/safety/hospital_finder.dart
//
// Recherche des hôpitaux proches d'un lieu d'événement, à partir des données
// libres OpenStreetMap :
//   1. recherche du lieu (Nominatim + Photon, tolérant aux fautes et aux
//      adresses incomplètes) : renvoie une liste de lieux candidats ;
//   2. hôpitaux autour du lieu choisi (Overpass, avec serveurs de secours),
//      service d'urgences en priorité, rayon élargi si rien n'est trouvé.
//
// Usage ponctuel, à la demande de l'utilisateur (politique d'utilisation de
// Nominatim : identification de l'app dans le User-Agent, pas d'appels en
// rafale). Les données OSM sont sous licence ODbL : l'attribution
// « © contributeurs OpenStreetMap » doit être affichée avec les résultats.

import 'dart:convert';
import 'dart:math' as math;

import 'package:http/http.dart' as http;

/// Un lieu trouvé pour le texte saisi (salle, adresse, ville…).
class PlaceCandidate {
  /// Libellé principal (nom de la salle, rue + numéro, ou ville).
  final String label;

  /// Complément lisible (code postal, ville, pays…).
  final String detail;

  /// Adresse complète sur une ligne, pour remplir le PPSPS.
  final String fullAddress;
  final double lat;
  final double lon;

  /// Code pays ISO en majuscules (« BE », « FR »…), vide si inconnu.
  final String countryCode;

  const PlaceCandidate({
    required this.label,
    required this.detail,
    required this.fullAddress,
    required this.lat,
    required this.lon,
    required this.countryCode,
  });
}

class HospitalResult {
  final String name;
  final String address;
  final String phone;
  final double distanceKm;
  final bool hasEmergency;
  final double lat;
  final double lon;

  const HospitalResult({
    required this.name,
    required this.address,
    required this.phone,
    required this.distanceKm,
    required this.hasEmergency,
    required this.lat,
    required this.lon,
  });

  HospitalResult withAddress(String a) => HospitalResult(
        name: name,
        address: a,
        phone: phone,
        distanceKm: distanceKm,
        hasEmergency: hasEmergency,
        lat: lat,
        lon: lon,
      );
}

/// Résultat d'une recherche d'hôpitaux autour d'un lieu.
class HospitalSearchResult {
  final List<HospitalResult> hospitals;

  /// Rayon finalement utilisé (élargi si rien n'a été trouvé au départ).
  final int radiusKm;

  const HospitalSearchResult(this.hospitals, this.radiusKm);
}

class HospitalFinderException implements Exception {
  final String code; // 'network'
  const HospitalFinderException(this.code);
}

class HospitalFinder {
  static const _userAgent = 'ShowTechTools/1.0 (showtechtools@openwhite.eu)';
  static const Duration _timeout = Duration(seconds: 15);

  static const _overpassServers = [
    'https://overpass-api.de/api/interpreter',
    'https://overpass.kumi.systems/api/interpreter',
    'https://maps.mail.ru/osm/tools/overpass/api/interpreter',
  ];

  // ── 1. Recherche du lieu ────────────────────────────────────────────────

  /// Lieux correspondant au texte saisi, du plus probable au moins probable.
  ///
  /// Tolère les adresses fausses ou incomplètes : on essaie la saisie telle
  /// quelle, puis chaque morceau séparément (nom de salle, rue, ville), puis
  /// une version simplifiée (sans numéros), avec une recherche floue en
  /// complément. Les lieux du pays du document passent en premier.
  ///
  /// Lève [HospitalFinderException] seulement si aucun service n'a répondu.
  static Future<List<PlaceCandidate>> findPlaces(
    String query, {
    String? countryCode,
    String? language,
    int max = 8,
  }) async {
    final q = query.trim();
    if (q.isEmpty) return const [];
    final cc = _iso(countryCode);
    final parts = _splitParts(q);

    var anyResponse = false;
    final found = <PlaceCandidate>[];

    void addAll(Iterable<PlaceCandidate>? list) {
      if (list == null) return;
      anyResponse = true;
      for (final c in list) {
        final dup = found.any((f) =>
            _distanceKm(f.lat, f.lon, c.lat, c.lon) < 0.15 ||
            (f.label.toLowerCase() == c.label.toLowerCase() &&
                f.detail.toLowerCase() == c.detail.toLowerCase()));
        if (!dup) found.add(c);
      }
    }

    // Étape A : saisie complète (précise + floue) et morceaux en recherche floue.
    final stageA = await Future.wait([
      _nominatim(q, countryCode: cc, language: language),
      _photon(q, language: language),
      for (final p in parts) _photon(p, language: language),
    ]);
    for (final r in stageA) {
      addAll(r);
    }

    // Étape B : rien ? On simplifie (sans numéros, morceaux un à un, sans
    // restriction de pays).
    if (found.isEmpty) {
      final simplified = _simplify(q);
      final stageB = await Future.wait([
        if (simplified.isNotEmpty && simplified != q)
          _photon(simplified, language: language),
        for (final p in parts.reversed)
          if (_simplify(p).isNotEmpty) _photon(_simplify(p), language: language),
      ]);
      for (final r in stageB) {
        addAll(r);
      }
      if (found.isEmpty) {
        // Nominatim : un seul appel de plus (politique d'usage).
        addAll(await _nominatim(parts.isNotEmpty ? parts.last : q,
            countryCode: null, language: language));
      }
    }

    if (!anyResponse) throw const HospitalFinderException('network');

    // Pays du document d'abord, en gardant l'ordre de pertinence sinon.
    if (cc != null) {
      final upper = cc.toUpperCase();
      final inCountry = found.where((c) => c.countryCode == upper).toList();
      final others = found.where((c) => c.countryCode != upper).toList();
      return [...inCountry, ...others].take(max).toList();
    }
    return found.take(max).toList();
  }

  /// Nominatim (géocodage précis). `null` = service injoignable.
  static Future<List<PlaceCandidate>?> _nominatim(
    String q, {
    String? countryCode,
    String? language,
  }) async {
    final params = {
      'format': 'jsonv2',
      'limit': '5',
      'addressdetails': '1',
      'q': q,
      if (countryCode != null) 'countrycodes': countryCode,
      if (language != null) 'accept-language': language,
    };
    try {
      final res = await http
          .get(Uri.https('nominatim.openstreetmap.org', '/search', params),
              headers: const {'User-Agent': _userAgent})
          .timeout(_timeout);
      if (res.statusCode != 200) return null;
      final decoded = jsonDecode(utf8.decode(res.bodyBytes));
      if (decoded is! List) return const [];
      final out = <PlaceCandidate>[];
      for (final e in decoded) {
        if (e is! Map) continue;
        final lat = double.tryParse('${e['lat']}');
        final lon = double.tryParse('${e['lon']}');
        if (lat == null || lon == null) continue;
        final a = e['address'] is Map ? e['address'] as Map : const {};
        final name = (e['name'] ?? '').toString().trim();
        final street = _join(' ', [a['road'], a['house_number']]);
        final city = _join(' ', [
          a['postcode'],
          a['city'] ?? a['town'] ?? a['village'] ?? a['municipality'],
        ]);
        final display = (e['display_name'] ?? '').toString();
        final label = name.isNotEmpty
            ? name
            : street.isNotEmpty
                ? street
                : display.split(',').first.trim();
        final detail = _join(', ', [
          if (street.isNotEmpty && street != label) street,
          city,
          a['country'],
        ]);
        out.add(PlaceCandidate(
          label: label,
          detail: detail.isNotEmpty ? detail : display,
          fullAddress: _join(', ', [
            if (name.isNotEmpty && name != street) name,
            street,
            city,
          ]).ifEmpty(display),
          lat: lat,
          lon: lon,
          countryCode: (a['country_code'] ?? '').toString().toUpperCase(),
        ));
      }
      return out;
    } catch (_) {
      return null;
    }
  }

  /// Photon (recherche floue, tolère fautes de frappe et saisies partielles).
  /// `null` = service injoignable.
  static Future<List<PlaceCandidate>?> _photon(String q,
      {String? language}) async {
    final lang = const {'fr', 'en', 'de', 'it'}.contains(language)
        ? language!
        : 'default';
    try {
      final res = await http
          .get(
              Uri.https('photon.komoot.io', '/api/',
                  {'q': q, 'limit': '5', 'lang': lang}),
              headers: const {'User-Agent': _userAgent})
          .timeout(_timeout);
      if (res.statusCode != 200) return null;
      final decoded = jsonDecode(utf8.decode(res.bodyBytes));
      final features = decoded is Map ? decoded['features'] : null;
      if (features is! List) return const [];
      final out = <PlaceCandidate>[];
      for (final f in features) {
        final c = _photonFeature(f);
        if (c != null) out.add(c);
      }
      return out;
    } catch (_) {
      return null;
    }
  }

  static PlaceCandidate? _photonFeature(dynamic f) {
    if (f is! Map) return null;
    final geom = f['geometry'];
    final p = f['properties'];
    if (geom is! Map || p is! Map) return null;
    final coords = geom['coordinates'];
    if (coords is! List || coords.length < 2) return null;
    final lon = (coords[0] as num?)?.toDouble();
    final lat = (coords[1] as num?)?.toDouble();
    if (lat == null || lon == null) return null;

    final name = (p['name'] ?? '').toString().trim();
    final street = _join(' ', [p['street'], p['housenumber']]);
    final city = _join(' ', [p['postcode'], p['city'] ?? p['district']]);
    final label = name.isNotEmpty
        ? name
        : street.isNotEmpty
            ? street
            : city;
    if (label.isEmpty) return null;
    final detail = _join(', ', [
      if (street.isNotEmpty && street != label) street,
      if (city != label) city,
      if (p['country'] != null && p['country'] != label) p['country'],
    ]);
    return PlaceCandidate(
      label: label,
      detail: detail,
      fullAddress: _join(', ', [
        if (name.isNotEmpty && name != street && name != city) name,
        street,
        city,
      ]),
      lat: lat,
      lon: lon,
      countryCode: (p['countrycode'] ?? '').toString().toUpperCase(),
    );
  }

  /// Adresse lisible d'un point (pour un hôpital sans adresse dans OSM).
  /// Chaîne vide si rien n'est trouvé ou en cas d'erreur.
  static Future<String> reverseAddress(double lat, double lon,
      {String? language}) async {
    final lang = const {'fr', 'en', 'de', 'it'}.contains(language)
        ? language!
        : 'default';
    try {
      final res = await http
          .get(
              Uri.https('photon.komoot.io', '/reverse',
                  {'lat': '$lat', 'lon': '$lon', 'limit': '1', 'lang': lang}),
              headers: const {'User-Agent': _userAgent})
          .timeout(_timeout);
      if (res.statusCode != 200) return '';
      final decoded = jsonDecode(utf8.decode(res.bodyBytes));
      final features = decoded is Map ? decoded['features'] : null;
      if (features is! List || features.isEmpty) return '';
      final p = features.first['properties'];
      if (p is! Map) return '';
      return _join(', ', [
        _join(' ', [p['street'], p['housenumber']]),
        _join(' ', [p['postcode'], p['city'] ?? p['district']]),
      ]);
    } catch (_) {
      return '';
    }
  }

  // ── 2. Hôpitaux autour d'un lieu ────────────────────────────────────────

  /// Hôpitaux autour du point, urgences d'abord puis par distance.
  /// Commence à [radiusKm] et élargit jusqu'à 80 km si rien n'est trouvé.
  static Future<HospitalSearchResult> hospitalsAround(
    double lat,
    double lon, {
    int radiusKm = 30,
    int maxResults = 8,
  }) async {
    for (final r in {radiusKm, 50, 80}) {
      if (r < radiusKm) continue;
      final list = await _overpass(lat, lon, r * 1000);
      if (list.isNotEmpty) {
        list.sort((a, b) {
          if (a.hasEmergency != b.hasEmergency) return a.hasEmergency ? -1 : 1;
          return a.distanceKm.compareTo(b.distanceKm);
        });
        return HospitalSearchResult(list.take(maxResults).toList(), r);
      }
    }
    return HospitalSearchResult(const [], math.max(radiusKm, 80));
  }

  static Future<List<HospitalResult>> _overpass(
      double lat, double lon, int radiusMeters) async {
    final query = '[out:json][timeout:25];'
        '(nwr["amenity"="hospital"](around:$radiusMeters,$lat,$lon);'
        'nwr["healthcare"="hospital"](around:$radiusMeters,$lat,$lon););'
        'out center tags 80;';

    http.Response? res;
    for (final server in _overpassServers) {
      try {
        final r = await http
            .post(Uri.parse(server),
                headers: const {'User-Agent': _userAgent},
                body: {'data': query})
            .timeout(const Duration(seconds: 30));
        if (r.statusCode == 200) {
          res = r;
          break;
        }
      } catch (_) {
        // serveur suivant
      }
    }
    if (res == null) throw const HospitalFinderException('network');

    final decoded = jsonDecode(utf8.decode(res.bodyBytes));
    final elements = decoded is Map ? decoded['elements'] : null;
    if (elements is! List) return [];

    final results = <HospitalResult>[];
    final seen = <String>{};
    for (final e in elements) {
      if (e is! Map) continue;
      final tags = e['tags'];
      if (tags is! Map) continue;
      final name =
          (tags['name'] ?? tags['official_name'] ?? '').toString().trim();
      if (name.isEmpty || !seen.add(name.toLowerCase())) continue;

      final center = e['center'] is Map ? e['center'] as Map : const {};
      final elat = e['lat'] ?? center['lat'];
      final elon = e['lon'] ?? center['lon'];
      if (elat is! num || elon is! num) continue;

      final address = _join(', ', [
        _join(' ', [tags['addr:street'], tags['addr:housenumber']]),
        _join(' ', [tags['addr:postcode'], tags['addr:city']]),
      ]);
      final phone = (tags['phone'] ??
              tags['contact:phone'] ??
              tags['emergency:phone'] ??
              '')
          .toString()
          .split(';')
          .first
          .trim();
      final emergency = tags['emergency']?.toString() == 'yes' ||
          tags['healthcare:speciality']?.toString().contains('emergency') ==
              true;

      results.add(HospitalResult(
        name: name,
        address: address,
        phone: phone,
        distanceKm: _distanceKm(lat, lon, elat.toDouble(), elon.toDouble()),
        hasEmergency: emergency,
        lat: elat.toDouble(),
        lon: elon.toDouble(),
      ));
    }
    return results;
  }

  // ── Outils ──────────────────────────────────────────────────────────────

  static String? _iso(String? code) {
    if (code == null || code.length != 2) return null;
    return code.toUpperCase() == 'UK' ? 'gb' : code.toLowerCase();
  }

  /// Morceaux significatifs de la saisie (séparés par virgule, tiret, retour
  /// à la ligne…), sans doublon, au plus 3.
  static List<String> _splitParts(String q) {
    final parts = q
        .split(RegExp(r'[,;\n/]| - | – '))
        .map((s) => s.trim())
        .where((s) => s.length >= 3)
        .toList();
    if (parts.length < 2) return const [];
    final seen = <String>{};
    return parts.where((p) => seen.add(p.toLowerCase())).take(3).toList();
  }

  /// Version simplifiée : sans numéros de rue, boîtes, étages, mots vides.
  static String _simplify(String q) {
    var s = q
        .replaceAll(
            RegExp(r'\b(bte|boite|boîte|bus|bp|cs|apt|étage|etage)\b\.?\s*\w*',
                caseSensitive: false),
            ' ')
        // Numéros isolés (mais pas les codes postaux à 4–5 chiffres).
        .replaceAll(RegExp(r'\b\d{1,3}[a-zA-Z]?\b'), ' ')
        .replaceAll(RegExp(r'[,;]+'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
    if (s.length < 3) s = '';
    return s;
  }

  static String _join(String sep, List<dynamic> parts) => parts
      .where((v) => v != null && v.toString().trim().isNotEmpty)
      .map((v) => v.toString().trim())
      .join(sep);

  static double _distanceKm(double lat1, double lon1, double lat2, double lon2) {
    const r = 6371.0;
    double rad(double d) => d * math.pi / 180;
    final dLat = rad(lat2 - lat1);
    final dLon = rad(lon2 - lon1);
    final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(rad(lat1)) *
            math.cos(rad(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    return 2 * r * math.asin(math.sqrt(a));
  }
}

extension on String {
  String ifEmpty(String other) => isEmpty ? other : this;
}
