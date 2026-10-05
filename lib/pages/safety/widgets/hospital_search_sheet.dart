// lib/pages/safety/widgets/hospital_search_sheet.dart
//
// Feuille « Hôpital le plus proche » du PPSPS :
//   1. on tape un lieu, une adresse, une ville… (même incomplet ou approximatif) ;
//   2. si plusieurs lieux correspondent, on choisit le bon ;
//   3. on choisit l'hôpital dans la liste (urgences en premier).

import 'package:flutter/material.dart';

import '../../../l10n_gen/app_localizations.dart';
import '../hospital_finder.dart';
import '../safety_theme.dart';

class HospitalPick {
  final HospitalResult hospital;
  final PlaceCandidate place;
  const HospitalPick(this.hospital, this.place);
}

Future<HospitalPick?> showHospitalSearchSheet(
  BuildContext context, {
  required String initialQuery,
  String? countryCode,
}) {
  return showModalBottomSheet<HospitalPick>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: kSafetySheetBg,
    showDragHandle: true,
    builder: (_) => _HospitalSearchSheet(
      initialQuery: initialQuery,
      countryCode: countryCode,
    ),
  );
}

enum _Stage { idle, searchingPlaces, places, searchingHospitals, hospitals }

class _HospitalSearchSheet extends StatefulWidget {
  final String initialQuery;
  final String? countryCode;
  const _HospitalSearchSheet({required this.initialQuery, this.countryCode});

  @override
  State<_HospitalSearchSheet> createState() => _HospitalSearchSheetState();
}

class _HospitalSearchSheetState extends State<_HospitalSearchSheet> {
  late final TextEditingController _ctrl =
      TextEditingController(text: widget.initialQuery);
  _Stage _stage = _Stage.idle;
  String? _message;
  List<PlaceCandidate> _places = const [];
  PlaceCandidate? _place;
  HospitalSearchResult? _result;
  bool _picking = false;
  int _searchId = 0;

  String get _lang => Localizations.localeOf(context).languageCode;

  @override
  void initState() {
    super.initState();
    if (widget.initialQuery.trim().isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _searchPlaces());
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Future<void> _searchPlaces() async {
    final loc = AppLocalizations.of(context);
    final q = _ctrl.text.trim();
    if (q.isEmpty) return;
    FocusScope.of(context).unfocus();
    final id = ++_searchId;
    setState(() {
      _stage = _Stage.searchingPlaces;
      _message = null;
      _places = const [];
      _place = null;
      _result = null;
    });
    try {
      final places = await HospitalFinder.findPlaces(q,
          countryCode: widget.countryCode, language: _lang);
      if (!mounted || id != _searchId) return;
      if (places.isEmpty) {
        setState(() {
          _stage = _Stage.idle;
          _message = loc.hospitalSearchNoPlace;
        });
      } else if (places.length == 1) {
        _places = places;
        await _searchHospitals(places.first);
      } else {
        setState(() {
          _places = places;
          _stage = _Stage.places;
        });
      }
    } on HospitalFinderException {
      if (!mounted || id != _searchId) return;
      setState(() {
        _stage = _Stage.idle;
        _message = loc.ppspsFindHospitalError;
      });
    }
  }

  Future<void> _searchHospitals(PlaceCandidate place) async {
    final loc = AppLocalizations.of(context);
    final id = ++_searchId;
    setState(() {
      _place = place;
      _stage = _Stage.searchingHospitals;
      _message = null;
    });
    try {
      final r = await HospitalFinder.hospitalsAround(place.lat, place.lon);
      if (!mounted || id != _searchId) return;
      setState(() {
        _result = r;
        _stage = _Stage.hospitals;
        if (r.hospitals.isEmpty) {
          _message = loc.hospitalSearchNoneRadius('${r.radiusKm}');
        }
      });
    } on HospitalFinderException {
      if (!mounted || id != _searchId) return;
      setState(() {
        _stage = _places.length > 1 ? _Stage.places : _Stage.idle;
        _message = loc.ppspsFindHospitalError;
      });
    }
  }

  Future<void> _pick(HospitalResult h) async {
    if (_picking) return;
    var chosen = h;
    if (h.address.isEmpty) {
      // Adresse absente dans OSM : on la retrouve à partir des coordonnées.
      setState(() => _picking = true);
      final a = await HospitalFinder.reverseAddress(h.lat, h.lon,
          language: _lang);
      if (!mounted) return;
      if (a.isNotEmpty) chosen = h.withAddress(a);
    }
    if (!mounted) return;
    Navigator.pop(context, HospitalPick(chosen, _place!));
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final muted = Colors.white.withValues(alpha: 0.6);

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * 0.85),
        child: SafeArea(
          top: false,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            children: [
              Text(loc.hospitalSearchPlaceTitle,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
              const SizedBox(height: 4),
              Text(loc.hospitalSearchPlaceHelp,
                  style: TextStyle(fontSize: 12, color: muted)),
              const SizedBox(height: 12),
              TextField(
                controller: _ctrl,
                autofocus: widget.initialQuery.trim().isEmpty,
                textInputAction: TextInputAction.search,
                textCapitalization: TextCapitalization.words,
                style: const TextStyle(color: Colors.white),
                onSubmitted: (_) => _searchPlaces(),
                decoration: InputDecoration(
                  hintText: loc.hospitalSearchPlaceHint,
                  hintStyle:
                      TextStyle(color: Colors.white.withValues(alpha: 0.35)),
                  prefixIcon: const Icon(Icons.place_rounded,
                      color: kSafetyAccent),
                  suffixIcon: IconButton(
                    tooltip: loc.hospitalSearchButton,
                    icon: const Icon(Icons.search_rounded),
                    color: kSafetyAccent,
                    onPressed: _searchPlaces,
                  ),
                  filled: true,
                  fillColor: Colors.white.withValues(alpha: 0.05),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              if (_stage == _Stage.searchingPlaces ||
                  _stage == _Stage.searchingHospitals)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    children: [
                      const CircularProgressIndicator(color: kSafetyAccent),
                      const SizedBox(height: 12),
                      Text(loc.ppspsFindHospitalSearching,
                          style: TextStyle(color: muted)),
                    ],
                  ),
                ),
              if (_message != null)
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: kSafetyAccent.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.info_outline_rounded,
                          color: kSafetyAccent, size: 20),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(_message!,
                            style: const TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              if (_stage == _Stage.places) ..._placeList(loc, muted),
              if (_stage == _Stage.hospitals) ..._hospitalList(loc, muted),
              const SizedBox(height: 8),
              Text(loc.ppspsOsmAttribution,
                  style: TextStyle(
                      fontSize: 11,
                      color: Colors.white.withValues(alpha: 0.45))),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _placeList(AppLocalizations loc, Color muted) => [
        Text(loc.hospitalSearchPlaceChoose,
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white)),
        const SizedBox(height: 4),
        for (final p in _places)
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.place_outlined, color: kSafetyAccent),
            title: Text(p.label, style: const TextStyle(color: Colors.white)),
            subtitle: p.detail.isEmpty
                ? null
                : Text(p.detail, style: TextStyle(color: muted)),
            trailing: Icon(Icons.chevron_right_rounded,
                color: Colors.white.withValues(alpha: 0.35)),
            onTap: () => _searchHospitals(p),
          ),
      ];

  List<Widget> _hospitalList(AppLocalizations loc, Color muted) {
    final place = _place!;
    final hospitals = _result?.hospitals ?? const <HospitalResult>[];
    return [
      Row(
        children: [
          const Icon(Icons.place_rounded, color: kSafetyAccent, size: 18),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              loc.hospitalSearchAround(place.label),
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
          if (_places.length > 1)
            TextButton(
              onPressed: () => setState(() {
                _stage = _Stage.places;
                _message = null;
              }),
              child: Text(loc.hospitalSearchChangePlace,
                  style: const TextStyle(color: kSafetyAccent)),
            ),
        ],
      ),
      if (hospitals.isNotEmpty) ...[
        const SizedBox(height: 4),
        Text(loc.ppspsFindHospitalVerify,
            style: TextStyle(fontSize: 12, color: muted)),
        const SizedBox(height: 4),
        for (final h in hospitals)
          ListTile(
            contentPadding: EdgeInsets.zero,
            enabled: !_picking,
            leading: Icon(Icons.local_hospital_rounded,
                color: h.hasEmergency
                    ? kSafetyCritHigh
                    : Colors.white.withValues(alpha: 0.5)),
            title: Text(h.name, style: const TextStyle(color: Colors.white)),
            subtitle: Text(
              [
                loc.ppspsDistanceKm(h.distanceKm.toStringAsFixed(1)),
                if (h.hasEmergency) loc.ppspsHospitalEmergency,
                if (h.address.isNotEmpty) h.address,
              ].join(' · '),
              style: TextStyle(color: muted),
            ),
            onTap: () => _pick(h),
          ),
      ],
    ];
  }
}
