// lib/pages/about/about_sun_times_page.dart
//
// NOTE:
// - This page expects your Flutter gen-l10n output class: AppLocalizations
//   from: package:mon_app_tech/l10n_gen/app_localizations.dart
//
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

String _fmtHm(DateTime dt) {
  final h = dt.hour.toString().padLeft(2, '0');
  final m = dt.minute.toString().padLeft(2, '0');
  return '$h:$m';
}

String _fmtDate(DateTime dt) {
  final d = dt.day.toString().padLeft(2, '0');
  final m = dt.month.toString().padLeft(2, '0');
  final y = dt.year.toString();
  return '$d/$m/$y';
}

class AboutSunTimesPage extends StatefulWidget {
  const AboutSunTimesPage({super.key});

  @override
  State<AboutSunTimesPage> createState() => _AboutSunTimesPageState();
}

class _AboutSunTimesPageState extends State<AboutSunTimesPage> {
  late _City _city;
  DateTime _date = DateTime.now();

  @override
  void initState() {
    super.initState();
    _city = _cities.first;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    final res = _computeAll(_city, _date);

    return Scaffold(
      appBar: AppBar(title: Text(loc.sunTimesTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _card(
            title: loc.sunTimesSectionSettings,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(loc.sunTimesIntro),
                const SizedBox(height: 12),
                _label(loc.sunTimesLabelCity),
                const SizedBox(height: 6),
                DropdownButtonFormField<_City>(
                  initialValue: _city,
                  items: _cities
                      .map(
                        (c) => DropdownMenuItem<_City>(
                          value: c,
                          child: Text(_cityDisplayName(loc, c)),
                        ),
                      )
                      .toList(),
                  onChanged: (v) {
                    if (v == null) return;
                    setState(() => _city = v);
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
                const SizedBox(height: 12),
                _label(loc.sunTimesLabelDate),
                const SizedBox(height: 6),
                _DatePickerTile(
                  date: _date,
                  onPick: (d) => setState(() => _date = d),
                ),
                const SizedBox(height: 12),
                Text(
                  loc.sunTimesNoteApprox,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _card(
            title: loc.sunTimesSectionResults,
            child: Column(
              children: [
                _kv(
                  loc.sunTimesResultAstronomicalDawn,
                  _fmtTime(
                    loc,
                    res.astroDawn,
                    _city.utcOffsetHours,
                    _city.dstRule,
                    _date,
                  ),
                ),
                _kv(
                  loc.sunTimesResultNauticalDawn,
                  _fmtTime(
                    loc,
                    res.nauticalDawn,
                    _city.utcOffsetHours,
                    _city.dstRule,
                    _date,
                  ),
                ),
                _kv(
                  loc.sunTimesResultCivilDawn,
                  _fmtTime(
                    loc,
                    res.civilDawn,
                    _city.utcOffsetHours,
                    _city.dstRule,
                    _date,
                  ),
                ),
                const Divider(height: 18),
                _kv(
                  loc.sunTimesResultSunrise,
                  _fmtTime(
                    loc,
                    res.sunrise,
                    _city.utcOffsetHours,
                    _city.dstRule,
                    _date,
                  ),
                ),
                const Divider(height: 18),
                _kv(
                  loc.sunTimesResultSunset,
                  _fmtTime(
                    loc,
                    res.sunset,
                    _city.utcOffsetHours,
                    _city.dstRule,
                    _date,
                  ),
                ),
                const Divider(height: 18),
                _kv(
                  loc.sunTimesResultCivilDusk,
                  _fmtTime(
                    loc,
                    res.civilDusk,
                    _city.utcOffsetHours,
                    _city.dstRule,
                    _date,
                  ),
                ),
                _kv(
                  loc.sunTimesResultNauticalDusk,
                  _fmtTime(
                    loc,
                    res.nauticalDusk,
                    _city.utcOffsetHours,
                    _city.dstRule,
                    _date,
                  ),
                ),
                _kv(
                  loc.sunTimesResultAstronomicalDusk,
                  _fmtTime(
                    loc,
                    res.astroDusk,
                    _city.utcOffsetHours,
                    _city.dstRule,
                    _date,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _card(
            title: loc.sunTimesSectionTimeline,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  loc.sunTimesTimelineStep30,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 12),
                _Timeline30(
                  date: _date,
                  utcOffsetHours: _city.utcOffsetHours +
                      _dstExtraOffsetHours(_city.dstRule, _date),
                  sunrise: res.sunrise,
                  sunset: res.sunset,
                  civilDawn: res.civilDawn,
                  civilDusk: res.civilDusk,
                  nauticalDawn: res.nauticalDawn,
                  nauticalDusk: res.nauticalDusk,
                  astroDawn: res.astroDawn,
                  astroDusk: res.astroDusk,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _card(
            title: loc.sunTimesSectionTwilight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(loc.sunTimesTwilightIntro),
                const SizedBox(height: 10),
                _bulletTitleBody(
                  title: loc.sunTimesTwilightCivilTitle,
                  body: loc.sunTimesTwilightCivilBody,
                ),
                const SizedBox(height: 8),
                _bulletTitleBody(
                  title: loc.sunTimesTwilightNauticalTitle,
                  body: loc.sunTimesTwilightNauticalBody,
                ),
                const SizedBox(height: 8),
                _bulletTitleBody(
                  title: loc.sunTimesTwilightAstronomicalTitle,
                  body: loc.sunTimesTwilightAstronomicalBody,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _card(
            title: loc.sunTimesSectionLux,
            child: Column(
              children: [
                _kv(loc.sunTimesLuxNight, '0–0.001 lx'),
                _kv(loc.sunTimesLuxAstro, '0.001–0.01 lx'),
                _kv(loc.sunTimesLuxNautical, '0.01–1 lx'),
                _kv(loc.sunTimesLuxCivil, '1–10 lx'),
                _kv(loc.sunTimesLuxVeryLow, '10–50 lx'),
                _kv(loc.sunTimesLuxLow, '50–200 lx'),
                _kv(loc.sunTimesLuxDay, '200–10 000 lx'),
                _kv(loc.sunTimesLuxFullDay, '10 000–100 000 lx'),
                const SizedBox(height: 10),
                Text(
                  loc.sunTimesLuxNote,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _fmtTime(
    AppLocalizations loc,
    DateTime? utcTime,
    double baseUtcOffsetHours,
    _DstRule dstRule,
    DateTime localDate,
  ) {
    if (utcTime == null) return loc.sunTimesNoData;
    final utcOffset =
        baseUtcOffsetHours + _dstExtraOffsetHours(dstRule, localDate);
    final local = utcTime.add(Duration(minutes: (utcOffset * 60).round()));
    return _fmtHm(local);
  }

  String _cityDisplayName(AppLocalizations loc, _City c) {
    return loc.localeName.startsWith('fr') ? c.nameFr : c.nameEn;
  }
}

/// ------------ UI helpers ------------

Widget _label(String text) =>
    Text(text, style: const TextStyle(fontWeight: FontWeight.w600));

Widget _card({required String title, required Widget child}) {
  return Card(
    elevation: 0,
    clipBehavior: Clip.antiAlias,
    child: Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    ),
  );
}

Widget _kv(String k, String v) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      children: [
        Expanded(child: Text(k)),
        const SizedBox(width: 12),
        Text(v, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    ),
  );
}

Widget _bulletTitleBody({required String title, required String body}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('•  '),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 2),
            Text(body),
          ],
        ),
      ),
    ],
  );
}

class _DatePickerTile extends StatelessWidget {
  const _DatePickerTile({required this.date, required this.onPick});

  final DateTime date;
  final ValueChanged<DateTime> onPick;

  @override
  Widget build(BuildContext context) {
    final text = _fmtDate(date);

    return InkWell(
      onTap: () async {
        final now = DateTime.now();
        final picked = await showDatePicker(
          context: context,
          initialDate: date,
          firstDate: DateTime(now.year - 5, 1, 1),
          lastDate: DateTime(now.year + 5, 12, 31),
        );
        if (picked != null) {
          onPick(DateTime(picked.year, picked.month, picked.day));
        }
      },
      borderRadius: BorderRadius.circular(10),
      child: InputDecorator(
        decoration:
            const InputDecoration(border: OutlineInputBorder(), isDense: true),
        child: Text(text),
      ),
    );
  }
}

class _Timeline30 extends StatelessWidget {
  const _Timeline30({
    required this.date,
    required this.utcOffsetHours,
    required this.sunrise,
    required this.sunset,
    required this.civilDawn,
    required this.civilDusk,
    required this.nauticalDawn,
    required this.nauticalDusk,
    required this.astroDawn,
    required this.astroDusk,
  });

  final DateTime date;
  final double utcOffsetHours;

  final DateTime? sunrise;
  final DateTime? sunset;
  final DateTime? civilDawn;
  final DateTime? civilDusk;
  final DateTime? nauticalDawn;
  final DateTime? nauticalDusk;
  final DateTime? astroDawn;
  final DateTime? astroDusk;

  @override
  Widget build(BuildContext context) {
    final localStart = DateTime(date.year, date.month, date.day, 0, 0);
    final localEnd = localStart.add(const Duration(days: 1));
    final utcStart =
        localStart.subtract(Duration(minutes: (utcOffsetHours * 60).round()));
    final utcEnd =
        localEnd.subtract(Duration(minutes: (utcOffsetHours * 60).round()));

    final rows = <Widget>[];
    DateTime t = utcStart;
    while (t.isBefore(utcEnd)) {
      final local = t.add(Duration(minutes: (utcOffsetHours * 60).round()));
      final hhmm = _fmtHm(local);
      final label = _slotLabel(context, t);

      rows.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              SizedBox(
                width: 64,
                child: Text(
                  hhmm,
                  style: const TextStyle(
                    fontFeatures: [FontFeature.tabularFigures()],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(child: Text(label)),
            ],
          ),
        ),
      );

      t = t.add(const Duration(minutes: 30));
    }

    return Column(children: rows);
  }

  String _slotLabel(BuildContext context, DateTime utcInstant) {
    final loc = AppLocalizations.of(context);

    bool between(DateTime? a, DateTime? b) {
      if (a == null || b == null) return false;
      return !utcInstant.isBefore(a) && utcInstant.isBefore(b);
    }

    if (sunrise != null && sunset != null) {
      if (!utcInstant.isBefore(sunrise!) && utcInstant.isBefore(sunset!)) {
        return loc.sunTimesTimelineDay;
      }
    }

    if (between(civilDawn, sunrise)) return loc.sunTimesTimelineCivil;
    if (between(nauticalDawn, civilDawn)) return loc.sunTimesTimelineNautical;
    if (between(astroDawn, nauticalDawn)) {
      return loc.sunTimesTimelineAstronomical;
    }

    if (between(sunset, civilDusk)) return loc.sunTimesTimelineCivil;
    if (between(civilDusk, nauticalDusk)) return loc.sunTimesTimelineNautical;
    if (between(nauticalDusk, astroDusk)) {
      return loc.sunTimesTimelineAstronomical;
    }

    return loc.sunTimesTimelineNight;
  }
}

/// ------------ Data + calculations ------------

class _City {
  const _City({
    required this.nameFr,
    required this.nameEn,
    required this.lat,
    required this.lon,
    required this.utcOffsetHours,
    required this.dstRule,
  });

  final String nameFr;
  final String nameEn;
  final double lat;
  final double lon;
  final double utcOffsetHours;
  final _DstRule dstRule;
}

enum _DstRule { none, eu, usCanada, ausNsw }

final List<_City> _cities = <_City>[
  const _City(
      nameFr: 'Bruxelles',
      nameEn: 'Brussels',
      lat: 50.85,
      lon: 4.35,
      utcOffsetHours: 1,
      dstRule: _DstRule.eu),
  const _City(
      nameFr: 'Paris',
      nameEn: 'Paris',
      lat: 48.86,
      lon: 2.35,
      utcOffsetHours: 1,
      dstRule: _DstRule.eu),
  const _City(
      nameFr: 'Londres',
      nameEn: 'London',
      lat: 51.51,
      lon: -0.13,
      utcOffsetHours: 0,
      dstRule: _DstRule.eu),
  const _City(
      nameFr: 'Madrid',
      nameEn: 'Madrid',
      lat: 40.42,
      lon: -3.70,
      utcOffsetHours: 1,
      dstRule: _DstRule.eu),
  const _City(
      nameFr: 'Berlin',
      nameEn: 'Berlin',
      lat: 52.52,
      lon: 13.40,
      utcOffsetHours: 1,
      dstRule: _DstRule.eu),
  const _City(
      nameFr: 'Rome',
      nameEn: 'Rome',
      lat: 41.90,
      lon: 12.50,
      utcOffsetHours: 1,
      dstRule: _DstRule.eu),
  const _City(
      nameFr: 'Stockholm',
      nameEn: 'Stockholm',
      lat: 59.33,
      lon: 18.07,
      utcOffsetHours: 1,
      dstRule: _DstRule.eu),
  const _City(
      nameFr: 'Athènes',
      nameEn: 'Athens',
      lat: 37.98,
      lon: 23.72,
      utcOffsetHours: 2,
      dstRule: _DstRule.eu),
  const _City(
      nameFr: 'New York',
      nameEn: 'New York',
      lat: 40.71,
      lon: -74.01,
      utcOffsetHours: -5,
      dstRule: _DstRule.usCanada),
  const _City(
      nameFr: 'Los Angeles',
      nameEn: 'Los Angeles',
      lat: 34.05,
      lon: -118.24,
      utcOffsetHours: -8,
      dstRule: _DstRule.usCanada),
  const _City(
      nameFr: 'Montréal',
      nameEn: 'Montreal',
      lat: 45.50,
      lon: -73.57,
      utcOffsetHours: -5,
      dstRule: _DstRule.usCanada),
  const _City(
      nameFr: 'Mexico',
      nameEn: 'Mexico City',
      lat: 19.43,
      lon: -99.13,
      utcOffsetHours: -6,
      dstRule: _DstRule.none),
  const _City(
      nameFr: 'São Paulo',
      nameEn: 'São Paulo',
      lat: -23.55,
      lon: -46.63,
      utcOffsetHours: -3,
      dstRule: _DstRule.none),
  const _City(
      nameFr: 'Casablanca',
      nameEn: 'Casablanca',
      lat: 33.57,
      lon: -7.59,
      utcOffsetHours: 0,
      dstRule: _DstRule.none),
  const _City(
      nameFr: 'Le Caire',
      nameEn: 'Cairo',
      lat: 30.04,
      lon: 31.24,
      utcOffsetHours: 2,
      dstRule: _DstRule.none),
  const _City(
      nameFr: 'Dubaï',
      nameEn: 'Dubai',
      lat: 25.20,
      lon: 55.27,
      utcOffsetHours: 4,
      dstRule: _DstRule.none),
  const _City(
      nameFr: 'Tokyo',
      nameEn: 'Tokyo',
      lat: 35.68,
      lon: 139.69,
      utcOffsetHours: 9,
      dstRule: _DstRule.none),
  const _City(
      nameFr: 'Singapour',
      nameEn: 'Singapore',
      lat: 1.35,
      lon: 103.82,
      utcOffsetHours: 8,
      dstRule: _DstRule.none),
  const _City(
      nameFr: 'Hong Kong',
      nameEn: 'Hong Kong',
      lat: 22.32,
      lon: 114.17,
      utcOffsetHours: 8,
      dstRule: _DstRule.none),
  const _City(
      nameFr: 'Sydney',
      nameEn: 'Sydney',
      lat: -33.87,
      lon: 151.21,
      utcOffsetHours: 10,
      dstRule: _DstRule.ausNsw),
];

class _SunResults {
  _SunResults({
    required this.sunrise,
    required this.sunset,
    required this.civilDawn,
    required this.civilDusk,
    required this.nauticalDawn,
    required this.nauticalDusk,
    required this.astroDawn,
    required this.astroDusk,
  });

  final DateTime? sunrise;
  final DateTime? sunset;
  final DateTime? civilDawn;
  final DateTime? civilDusk;
  final DateTime? nauticalDawn;
  final DateTime? nauticalDusk;
  final DateTime? astroDawn;
  final DateTime? astroDusk;
}

_SunResults _computeAll(_City city, DateTime localDate) {
  return _SunResults(
    sunrise: _sunEventUtc(
      city.lat,
      city.lon,
      localDate,
      _Zenith.official,
      isSunrise: true,
    ),
    sunset: _sunEventUtc(
      city.lat,
      city.lon,
      localDate,
      _Zenith.official,
      isSunrise: false,
    ),
    civilDawn: _sunEventUtc(
      city.lat,
      city.lon,
      localDate,
      _Zenith.civil,
      isSunrise: true,
    ),
    civilDusk: _sunEventUtc(
      city.lat,
      city.lon,
      localDate,
      _Zenith.civil,
      isSunrise: false,
    ),
    nauticalDawn: _sunEventUtc(
      city.lat,
      city.lon,
      localDate,
      _Zenith.nautical,
      isSunrise: true,
    ),
    nauticalDusk: _sunEventUtc(
      city.lat,
      city.lon,
      localDate,
      _Zenith.nautical,
      isSunrise: false,
    ),
    astroDawn: _sunEventUtc(
      city.lat,
      city.lon,
      localDate,
      _Zenith.astronomical,
      isSunrise: true,
    ),
    astroDusk: _sunEventUtc(
      city.lat,
      city.lon,
      localDate,
      _Zenith.astronomical,
      isSunrise: false,
    ),
  );
}

double _dstExtraOffsetHours(_DstRule rule, DateTime localDate) {
  switch (rule) {
    case _DstRule.none:
      return 0;
    case _DstRule.eu:
      final start = _lastSundayOfMonth(localDate.year, 3);
      final end = _lastSundayOfMonth(localDate.year, 10);
      final d = DateTime(localDate.year, localDate.month, localDate.day);
      return (!d.isBefore(start) && d.isBefore(end)) ? 1 : 0;
    case _DstRule.usCanada:
      final start = _nthSunday(localDate.year, 3, 2);
      final end = _nthSunday(localDate.year, 11, 1);
      final d = DateTime(localDate.year, localDate.month, localDate.day);
      return (!d.isBefore(start) && d.isBefore(end)) ? 1 : 0;
    case _DstRule.ausNsw:
      final d = DateTime(localDate.year, localDate.month, localDate.day);
      final start = _nthSunday(localDate.year, 10, 1);
      final endThisYear = _nthSunday(localDate.year, 4, 1);
      if (d.month >= 10) return d.isBefore(start) ? 0 : 1;
      if (d.month <= 3) return 1;
      if (d.month == 4) return d.isBefore(endThisYear) ? 1 : 0;
      return 0;
  }
}

DateTime _lastSundayOfMonth(int year, int month) {
  final firstNext =
      (month == 12) ? DateTime(year + 1, 1, 1) : DateTime(year, month + 1, 1);
  final lastDay = firstNext.subtract(const Duration(days: 1));
  final delta = (lastDay.weekday % 7);
  return DateTime(year, month, lastDay.day).subtract(Duration(days: delta));
}

DateTime _nthSunday(int year, int month, int n) {
  final first = DateTime(year, month, 1);
  final firstSundayOffset = (7 - (first.weekday % 7)) % 7;
  final day = 1 + firstSundayOffset + (n - 1) * 7;
  return DateTime(year, month, day);
}

enum _Zenith {
  official(90.833),
  civil(96.0),
  nautical(102.0),
  astronomical(108.0);

  const _Zenith(this.deg);
  final double deg;
}

DateTime? _sunEventUtc(
  double latDeg,
  double lonDeg,
  DateTime localDate,
  _Zenith zenith, {
  required bool isSunrise,
}) {
  final n = _dayOfYear(localDate);
  final lngHour = lonDeg / 15.0;

  final t =
      isSunrise ? n + ((6.0 - lngHour) / 24.0) : n + ((18.0 - lngHour) / 24.0);

  final m = (0.9856 * t) - 3.289;

  double l = m +
      (1.916 * math.sin(_deg2rad(m))) +
      (0.020 * math.sin(_deg2rad(2 * m))) +
      282.634;
  l = _wrap360(l);

  double ra = _rad2deg(math.atan(0.91764 * math.tan(_deg2rad(l))));
  ra = _wrap360(ra);

  final lQuadrant = (l / 90.0).floor() * 90.0;
  final raQuadrant = (ra / 90.0).floor() * 90.0;
  ra = ra + (lQuadrant - raQuadrant);
  ra = ra / 15.0;

  final sinDec = 0.39782 * math.sin(_deg2rad(l));
  final cosDec = math.cos(math.asin(sinDec));

  final cosH =
      (math.cos(_deg2rad(zenith.deg)) - (sinDec * math.sin(_deg2rad(latDeg)))) /
          (cosDec * math.cos(_deg2rad(latDeg)));

  if (cosH > 1) return null;
  if (cosH < -1) return null;

  double h =
      isSunrise ? 360.0 - _rad2deg(math.acos(cosH)) : _rad2deg(math.acos(cosH));
  h = h / 15.0;

  final tLocal = h + ra - (0.06571 * t) - 6.622;

  double ut = tLocal - lngHour;
  ut = _wrap24(ut);

  final utcMidnight =
      DateTime.utc(localDate.year, localDate.month, localDate.day);
  final minutes = (ut * 60).round();
  return utcMidnight.add(Duration(minutes: minutes));
}

int _dayOfYear(DateTime d) => d.difference(DateTime(d.year, 1, 1)).inDays + 1;

double _deg2rad(double deg) => deg * math.pi / 180.0;
double _rad2deg(double rad) => rad * 180.0 / math.pi;

double _wrap360(double x) {
  double v = x % 360.0;
  if (v < 0) v += 360.0;
  return v;
}

double _wrap24(double x) {
  double v = x % 24.0;
  if (v < 0) v += 24.0;
  return v;
}
