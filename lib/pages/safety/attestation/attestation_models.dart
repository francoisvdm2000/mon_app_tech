// lib/pages/safety/attestation/attestation_models.dart
//
// Attestation de bon montage : éléments montés (structures, ponts, palans,
// scène…), points de contrôle par élément, réserves et signature.

import '../ppsps/ppsps_models.dart' show PpspsSignature;

String _s(dynamic v) => v == null ? '' : v.toString();

DateTime? _date(dynamic v) =>
    v == null ? null : DateTime.tryParse(v.toString());

double? _num(dynamic v) {
  if (v is num) return v.toDouble();
  return double.tryParse(_s(v).replaceAll(',', '.'));
}

/// Libellés des familles de contrôles (la feuille les nomme en français).
const Map<String, Map<String, String>> kControlFamilyLabels = {
  'Structure': {
    'fr': 'Structure',
    'en': 'Structure',
    'nl': 'Structuur',
    'de': 'Konstruktion',
    'es': 'Estructura',
    'pt': 'Estrutura',
  },
  'Levage': {
    'fr': 'Levage',
    'en': 'Lifting',
    'nl': 'Hijsen',
    'de': 'Heben',
    'es': 'Elevación',
    'pt': 'Elevação',
  },
  'Électricité': {
    'fr': 'Électricité',
    'en': 'Electrical',
    'nl': 'Elektriciteit',
    'de': 'Elektrik',
    'es': 'Electricidad',
    'pt': 'Eletricidade',
  },
  'Scène': {
    'fr': 'Scène',
    'en': 'Stage',
    'nl': 'Podium',
    'de': 'Bühne',
    'es': 'Escenario',
    'pt': 'Palco',
  },
  'Général': {
    'fr': 'Général',
    'en': 'General',
    'nl': 'Algemeen',
    'de': 'Allgemein',
    'es': 'General',
    'pt': 'Geral',
  },
};

String controlFamilyLabel(String family, String lang) =>
    kControlFamilyLabels[family]?[lang] ??
    kControlFamilyLabels[family]?['en'] ??
    family;

enum CheckStatus { ok, nc, na }

CheckStatus? _status(dynamic v) {
  for (final s in CheckStatus.values) {
    if (s.name == v) return s;
  }
  return null;
}

/// Résultat d'un point de contrôle sur un élément.
class ControlCheck {
  final CheckStatus status;
  final String reserve; // constat + action prévue (obligatoire si NC)
  final List<String> photos; // noms de fichiers (voir AttestationPhotos)

  const ControlCheck({
    required this.status,
    this.reserve = '',
    this.photos = const [],
  });

  bool get needsReserve => status == CheckStatus.nc && reserve.trim().isEmpty;

  ControlCheck copyWith({
    CheckStatus? status,
    String? reserve,
    List<String>? photos,
  }) =>
      ControlCheck(
        status: status ?? this.status,
        reserve: reserve ?? this.reserve,
        photos: photos ?? this.photos,
      );

  Map<String, dynamic> toJson() => {
        'status': status.name,
        'reserve': reserve,
        'photos': photos,
      };

  static ControlCheck? fromJson(dynamic json) {
    if (json is! Map) return null;
    final status = _status(json['status']);
    if (status == null) return null;
    return ControlCheck(
      status: status,
      reserve: _s(json['reserve']),
      photos: [for (final p in (json['photos'] as List? ?? const [])) _s(p)],
    );
  }
}

/// Élément monté et contrôlé (pont, grill, tour, scène, écran…).
class MountedElement {
  final String id;
  final String name;
  final String description;
  final Set<String> families; // familles de contrôles applicables
  final double? appliedLoadKg;
  final double? ratedLoadKg;
  final Map<String, ControlCheck> checks; // clé = ID de contrôle (C001…)

  const MountedElement({
    required this.id,
    this.name = '',
    this.description = '',
    this.families = const {},
    this.appliedLoadKg,
    this.ratedLoadKg,
    this.checks = const {},
  });

  factory MountedElement.create() => MountedElement(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        families: const {'Structure', 'Levage', 'Général'},
      );

  bool get overloaded =>
      appliedLoadKg != null &&
      ratedLoadKg != null &&
      ratedLoadKg! > 0 &&
      appliedLoadKg! > ratedLoadKg!;

  /// Taux de charge (0 à 1+), ou null si les charges ne sont pas saisies.
  double? get loadRatio =>
      appliedLoadKg != null && ratedLoadKg != null && ratedLoadKg! > 0
          ? appliedLoadKg! / ratedLoadKg!
          : null;

  int get ncCount => checks.values.where((c) => c.status == CheckStatus.nc).length;
  int get photoCount => checks.values.fold(0, (s, c) => s + c.photos.length);

  MountedElement copyWith({
    String? name,
    String? description,
    Set<String>? families,
    double? appliedLoadKg,
    double? ratedLoadKg,
    bool clearLoads = false,
    Map<String, ControlCheck>? checks,
  }) =>
      MountedElement(
        id: id,
        name: name ?? this.name,
        description: description ?? this.description,
        families: families ?? this.families,
        appliedLoadKg: clearLoads ? null : (appliedLoadKg ?? this.appliedLoadKg),
        ratedLoadKg: clearLoads ? null : (ratedLoadKg ?? this.ratedLoadKg),
        checks: checks ?? this.checks,
      );

  /// Charges saisies (null = non renseignée).
  MountedElement withLoads(double? applied, double? rated) => MountedElement(
        id: id,
        name: name,
        description: description,
        families: families,
        appliedLoadKg: applied,
        ratedLoadKg: rated,
        checks: checks,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'families': families.toList(),
        'appliedLoadKg': appliedLoadKg,
        'ratedLoadKg': ratedLoadKg,
        'checks': {for (final e in checks.entries) e.key: e.value.toJson()},
      };

  factory MountedElement.fromJson(Map<String, dynamic> json) => MountedElement(
        id: _s(json['id']),
        name: _s(json['name']),
        description: _s(json['description']),
        families: {for (final f in (json['families'] as List? ?? const [])) _s(f)},
        appliedLoadKg: _num(json['appliedLoadKg']),
        ratedLoadKg: _num(json['ratedLoadKg']),
        checks: {
          if (json['checks'] is Map)
            for (final e in (json['checks'] as Map).entries)
              if (ControlCheck.fromJson(e.value) != null)
                e.key.toString(): ControlCheck.fromJson(e.value)!,
        },
      );
}

enum AttestationStatus { draft, signed }

class AttestationDocument {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final AttestationStatus status;
  final String country;
  final String? ppspsId; // plan de sécurité d'origine, si importé

  final String eventName;
  final String venue;
  final String address;
  final String organizer;
  final String companyName;
  final String signerName;
  final String signerRole; // fonction : chef rigger, régisseur…

  final List<MountedElement> elements;
  final PpspsSignature? signature;
  final List<String> pdfLanguages;

  const AttestationDocument({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.status = AttestationStatus.draft,
    required this.country,
    this.ppspsId,
    this.eventName = '',
    this.venue = '',
    this.address = '',
    this.organizer = '',
    this.companyName = '',
    this.signerName = '',
    this.signerRole = '',
    this.elements = const [],
    this.signature,
    this.pdfLanguages = const [],
  });

  factory AttestationDocument.create(String country) {
    final now = DateTime.now();
    return AttestationDocument(
      id: now.microsecondsSinceEpoch.toString(),
      createdAt: now,
      updatedAt: now,
      country: country,
    );
  }

  int get ncCount => elements.fold(0, (s, e) => s + e.ncCount);
  int get photoCount => elements.fold(0, (s, e) => s + e.photoCount);
  bool get hasReserves => ncCount > 0;

  /// Non-conformités sans réserve écrite : la signature est bloquée.
  int get missingReserves => elements.fold(
      0, (s, e) => s + e.checks.values.where((c) => c.needsReserve).length);

  AttestationDocument copyWith({
    AttestationStatus? status,
    String? eventName,
    String? venue,
    String? address,
    String? organizer,
    String? companyName,
    String? signerName,
    String? signerRole,
    List<MountedElement>? elements,
    PpspsSignature? signature,
    bool clearSignature = false,
    List<String>? pdfLanguages,
  }) =>
      AttestationDocument(
        id: id,
        createdAt: createdAt,
        updatedAt: DateTime.now(),
        status: status ?? this.status,
        country: country,
        ppspsId: ppspsId,
        eventName: eventName ?? this.eventName,
        venue: venue ?? this.venue,
        address: address ?? this.address,
        organizer: organizer ?? this.organizer,
        companyName: companyName ?? this.companyName,
        signerName: signerName ?? this.signerName,
        signerRole: signerRole ?? this.signerRole,
        elements: elements ?? this.elements,
        signature: clearSignature ? null : (signature ?? this.signature),
        pdfLanguages: pdfLanguages ?? this.pdfLanguages,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'status': status.name,
        'country': country,
        'ppspsId': ppspsId,
        'eventName': eventName,
        'venue': venue,
        'address': address,
        'organizer': organizer,
        'companyName': companyName,
        'signerName': signerName,
        'signerRole': signerRole,
        'elements': [for (final e in elements) e.toJson()],
        'signature': signature?.toJson(),
        'pdfLanguages': pdfLanguages,
      };

  factory AttestationDocument.fromJson(Map<String, dynamic> json) {
    final now = DateTime.now();
    final country = _s(json['country']);
    final ppspsId = _s(json['ppspsId']);
    return AttestationDocument(
      id: _s(json['id']),
      createdAt: _date(json['createdAt']) ?? now,
      updatedAt: _date(json['updatedAt']) ?? now,
      status: json['status'] == AttestationStatus.signed.name
          ? AttestationStatus.signed
          : AttestationStatus.draft,
      country: country.isEmpty ? 'FR' : country,
      ppspsId: ppspsId.isEmpty ? null : ppspsId,
      eventName: _s(json['eventName']),
      venue: _s(json['venue']),
      address: _s(json['address']),
      organizer: _s(json['organizer']),
      companyName: _s(json['companyName']),
      signerName: _s(json['signerName']),
      signerRole: _s(json['signerRole']),
      elements: [
        for (final e in (json['elements'] as List? ?? const []))
          if (e is Map<String, dynamic>) MountedElement.fromJson(e),
      ],
      signature: PpspsSignature.fromJson(json['signature']),
      pdfLanguages: [
        for (final l in (json['pdfLanguages'] as List? ?? const [])) _s(l)
      ],
    );
  }
}
