// lib/pages/safety/hospital_finder.dart
//
// Recherche des hôpitaux proches d'un lieu d'événement, à partir des données
// libres OpenStreetMap :
//   1. géocodage de l'adresse (Nominatim) ;
//   2. hôpitaux dans un rayon donné (Overpass), service d'urgences en priorité.
//
// Usage ponctuel, à la demande de l'utilisateur (politique d'utilisation de
// Nominatim : identification de l'app dans le User-Agent, pas d'appels en
// rafale). Les données OSM sont sous licence ODbL : l'attribution
// « © contributeurs OpenStreetMap » doit être affichée avec les résultats.

import 'dart:convert';
import 'dart:math' as math;

import 'package:http/http.dart' as http;

class HospitalResult {
  final String name;
  final String address;
  final String phone;
  final double distanceKm;
  final bool hasEmergency;

  const HospitalResult({
    required this.name,
    required this.address,
    required this.phone,
    required this.distanceKm,
    required this.hasEmergency,
  });
}

class HospitalFinderException implements Exception {
  final String code; // 'geocode' | 'network'
  const HospitalFinderException(this.code);
}

class HospitalFinder {
  static const _userAgent =
      'ShowTechTools/1.0 (showtechtools@openwhite.eu)';
  static const Duration _timeout = Duration(seconds: 20);

  /// Hôpitaux triés par distance, ceux avec urgences d'abord.
  /// Renvoie une liste vide si rien n'est trouvé dans le rayon.
  static Future<List<HospitalResult>> search(
    String query, {
    String? countryCode,
    int radiusMeters = 30000,
    int maxResults = 5,
  }) async {
    final origin = await _geocode(query, countryCode: countryCode);
    if (origin == null) throw const HospitalFinderException('geocode');

    final lat = origin.$1, lon = origin.$2;
    final overpass = '[out:json][timeout:20];'
        '(node["amenity"="hospital"](around:$radiusMeters,$lat,$lon);'
        'way["amenity"="hospital"](around:$radiusMeters,$lat,$lon);'
        'relation["amenity"="hospital"](around:$radiusMeters,$lat,$lon););'
        'out center tags 60;';

    http.Response res;
    try {
      res = await http
          .post(
            Uri.parse('https://overpass-api.de/api/interpreter'),
            headers: const {'User-Agent': _userAgent},
            body: {'data': overpass},
          )
          .timeout(_timeout);
    } catch (_) {
      throw const HospitalFinderException('network');
    }
    if (res.statusCode != 200) throw const HospitalFinderException('network');

    final decoded = jsonDecode(utf8.decode(res.bodyBytes));
    final elements = decoded is Map ? decoded['elements'] : null;
    if (elements is! List) return const [];

    final results = <HospitalResult>[];
    final seen = <String>{};
    for (final e in elements) {
      if (e is! Map) continue;
      final tags = e['tags'];
      if (tags is! Map) continue;
      final name = (tags['name'] ?? '').toString().trim();
      if (name.isEmpty || !seen.add(name.toLowerCase())) continue;

      final elat = (e['lat'] ?? (e['center'] is Map ? e['center']['lat'] : null));
      final elon = (e['lon'] ?? (e['center'] is Map ? e['center']['lon'] : null));
      if (elat is! num || elon is! num) continue;

      final street = [tags['addr:street'], tags['addr:housenumber']]
          .where((v) => v != null && v.toString().trim().isNotEmpty)
          .join(' ');
      final city = [tags['addr:postcode'], tags['addr:city']]
          .where((v) => v != null && v.toString().trim().isNotEmpty)
          .join(' ');
      final address = [street, city].where((s) => s.isNotEmpty).join(', ');
      final phone =
          (tags['phone'] ?? tags['contact:phone'] ?? '').toString().trim();
      final emergency = tags['emergency']?.toString() == 'yes';

      results.add(HospitalResult(
        name: name,
        address: address,
        phone: phone,
        distanceKm: _distanceKm(lat, lon, elat.toDouble(), elon.toDouble()),
        hasEmergency: emergency,
      ));
    }

    results.sort((a, b) {
      if (a.hasEmergency != b.hasEmergency) return a.hasEmergency ? -1 : 1;
      return a.distanceKm.compareTo(b.distanceKm);
    });
    return results.take(maxResults).toList();
  }

  static Future<(double, double)?> _geocode(String query,
      {String? countryCode}) async {
    final params = {
      'format': 'jsonv2',
      'limit': '1',
      'q': query,
      if (countryCode != null && countryCode.length == 2)
        'countrycodes': countryCode == 'UK' ? 'gb' : countryCode.toLowerCase(),
    };
    http.Response res;
    try {
      res = await http
          .get(
            Uri.https('nominatim.openstreetmap.org', '/search', params),
            headers: const {'User-Agent': _userAgent},
          )
          .timeout(_timeout);
    } catch (_) {
      throw const HospitalFinderException('network');
    }
    if (res.statusCode != 200) throw const HospitalFinderException('network');
    final decoded = jsonDecode(utf8.decode(res.bodyBytes));
    if (decoded is! List || decoded.isEmpty) return null;
    final first = decoded.first;
    final lat = double.tryParse('${first['lat']}');
    final lon = double.tryParse('${first['lon']}');
    if (lat == null || lon == null) return null;
    return (lat, lon);
  }

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
