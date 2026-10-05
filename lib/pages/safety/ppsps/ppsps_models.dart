// lib/pages/safety/ppsps/ppsps_models.dart
//
// Modèle d'un plan de sécurité (PPSPS en France, plan de sécurité et de santé
// en Belgique). Sérialisé en JSON pour le stockage local (PpspsStorage).

import '../safety_library.dart';

String _s(dynamic v) => v == null ? '' : v.toString();

DateTime? _date(dynamic v) =>
    v == null ? null : DateTime.tryParse(v.toString());

enum PpspsStatus { draft, finalized }

/// Dates d'une phase (montage, exploitation, démontage).
class PpspsPhaseDates {
  final DateTime? start;
  final DateTime? end;

  const PpspsPhaseDates({this.start, this.end});

  bool get isSet => start != null;

  Map<String, dynamic> toJson() => {
        'start': start?.toIso8601String(),
        'end': end?.toIso8601String(),
      };

  factory PpspsPhaseDates.fromJson(Map<String, dynamic>? json) =>
      PpspsPhaseDates(start: _date(json?['start']), end: _date(json?['end']));
}

/// Entreprise ou équipe intervenant sur le chantier.
class PpspsWorker {
  final String company;
  final String trade; // ex. « Lumière », « Son », « Structure »
  final String contact;
  final String phone;
  final int headcount;

  const PpspsWorker({
    this.company = '',
    this.trade = '',
    this.contact = '',
    this.phone = '',
    this.headcount = 0,
  });

  Map<String, dynamic> toJson() => {
        'company': company,
        'trade': trade,
        'contact': contact,
        'phone': phone,
        'headcount': headcount,
      };

  factory PpspsWorker.fromJson(Map<String, dynamic> json) => PpspsWorker(
        company: _s(json['company']),
        trade: _s(json['trade']),
        contact: _s(json['contact']),
        phone: _s(json['phone']),
        headcount: (json['headcount'] as num?)?.toInt() ?? 0,
      );
}

int? _level(dynamic v) {
  final n = v is num ? v.toInt() : int.tryParse(_s(v));
  return n == null || n < 1 || n > 4 ? null : n;
}

/// Risque retenu dans le plan, avec ses mesures cochées et ajoutées.
///
/// La gravité et la probabilité viennent de la bibliothèque ; elles peuvent
/// être ajustées pour ce plan (ex. vent en salle), avec un motif.
class PpspsRiskSelection {
  final Set<String> measureIds;
  final List<String> customMeasures;
  final int? severity; // null = valeur de la bibliothèque
  final int? probability; // null = valeur de la bibliothèque
  final String ratingNote; // motif de l'ajustement

  const PpspsRiskSelection({
    this.measureIds = const {},
    this.customMeasures = const [],
    this.severity,
    this.probability,
    this.ratingNote = '',
  });

  int get measureCount => measureIds.length + customMeasures.length;

  bool get isAdjusted => severity != null || probability != null;

  int severityFor(SafetyRisk r) => severity ?? r.severity;
  int probabilityFor(SafetyRisk r) => probability ?? r.probability;
  int criticalityFor(SafetyRisk r) => severityFor(r) * probabilityFor(r);
  SafetyRiskLevel levelFor(SafetyRisk r) =>
      safetyRiskLevel(severityFor(r), probabilityFor(r));

  PpspsRiskSelection copyWith({
    Set<String>? measureIds,
    List<String>? customMeasures,
    String? ratingNote,
  }) =>
      PpspsRiskSelection(
        measureIds: measureIds ?? this.measureIds,
        customMeasures: customMeasures ?? this.customMeasures,
        severity: severity,
        probability: probability,
        ratingNote: ratingNote ?? this.ratingNote,
      );

  /// Nouvelle cotation pour ce plan. Une valeur égale à celle de la
  /// bibliothèque est enregistrée comme « non ajustée ».
  PpspsRiskSelection withRating(SafetyRisk r, int severity, int probability) =>
      PpspsRiskSelection(
        measureIds: measureIds,
        customMeasures: customMeasures,
        severity: severity == r.severity ? null : severity,
        probability: probability == r.probability ? null : probability,
        ratingNote: severity == r.severity && probability == r.probability
            ? ''
            : ratingNote,
      );

  Map<String, dynamic> toJson() => {
        'measures': measureIds.toList(),
        'custom': customMeasures,
        if (severity != null) 'severity': severity,
        if (probability != null) 'probability': probability,
        if (ratingNote.isNotEmpty) 'ratingNote': ratingNote,
      };

  factory PpspsRiskSelection.fromJson(Map<String, dynamic> json) =>
      PpspsRiskSelection(
        measureIds: {
          for (final m in (json['measures'] as List? ?? const [])) _s(m)
        },
        customMeasures: [
          for (final m in (json['custom'] as List? ?? const [])) _s(m)
        ],
        severity: _level(json['severity']),
        probability: _level(json['probability']),
        ratingNote: _s(json['ratingNote']),
      );
}

/// Organisation des secours sur le site.
class PpspsEmergency {
  final String hospitalName;
  final String hospitalAddress;
  final String hospitalPhone;
  final String firstAiders; // noms des secouristes présents
  final String assemblyPoint; // point de rassemblement
  final Set<String> equipmentItems; // IDs de kEmergencyEquipment cochés
  final String equipment; // précisions : emplacements, quantités, autre

  const PpspsEmergency({
    this.hospitalName = '',
    this.hospitalAddress = '',
    this.hospitalPhone = '',
    this.firstAiders = '',
    this.assemblyPoint = '',
    this.equipmentItems = const {},
    this.equipment = '',
  });

  PpspsEmergency copyWith({
    String? hospitalName,
    String? hospitalAddress,
    String? hospitalPhone,
    String? firstAiders,
    String? assemblyPoint,
    Set<String>? equipmentItems,
    String? equipment,
  }) =>
      PpspsEmergency(
        hospitalName: hospitalName ?? this.hospitalName,
        hospitalAddress: hospitalAddress ?? this.hospitalAddress,
        hospitalPhone: hospitalPhone ?? this.hospitalPhone,
        firstAiders: firstAiders ?? this.firstAiders,
        assemblyPoint: assemblyPoint ?? this.assemblyPoint,
        equipmentItems: equipmentItems ?? this.equipmentItems,
        equipment: equipment ?? this.equipment,
      );

  Map<String, dynamic> toJson() => {
        'hospitalName': hospitalName,
        'hospitalAddress': hospitalAddress,
        'hospitalPhone': hospitalPhone,
        'firstAiders': firstAiders,
        'assemblyPoint': assemblyPoint,
        'equipmentItems': equipmentItems.toList(),
        'equipment': equipment,
      };

  factory PpspsEmergency.fromJson(Map<String, dynamic>? json) =>
      PpspsEmergency(
        hospitalName: _s(json?['hospitalName']),
        hospitalAddress: _s(json?['hospitalAddress']),
        hospitalPhone: _s(json?['hospitalPhone']),
        firstAiders: _s(json?['firstAiders']),
        assemblyPoint: _s(json?['assemblyPoint']),
        equipmentItems: {
          for (final i in (json?['equipmentItems'] as List? ?? const [])) _s(i)
        },
        equipment: _s(json?['equipment']),
      );
}

/// Matériel de secours proposé à cocher (libellés dans chaque langue de
/// document, utilisés à l'écran et dans le PDF).
class EmergencyEquipment {
  final String id;
  final Map<String, String> labels;
  const EmergencyEquipment(this.id, this.labels);

  String labelFor(String lang) => labels[lang] ?? labels['en'] ?? id;
}

const List<EmergencyEquipment> kEmergencyEquipment = [
  EmergencyEquipment('extinguisher', {
    'fr': 'Extincteurs (eau / poudre)',
    'en': 'Fire extinguishers (water / powder)',
    'nl': 'Blustoestellen (water / poeder)',
    'de': 'Feuerlöscher (Wasser / Pulver)',
    'es': 'Extintores (agua / polvo)',
    'pt': 'Extintores (água / pó)',
  }),
  EmergencyEquipment('extinguisherCo2', {
    'fr': 'Extincteurs CO2 (feux électriques)',
    'en': 'CO2 extinguishers (electrical fires)',
    'nl': 'CO2-blustoestellen (elektrische branden)',
    'de': 'CO2-Feuerlöscher (Elektrobrände)',
    'es': 'Extintores de CO2 (fuegos eléctricos)',
    'pt': 'Extintores de CO2 (fogos elétricos)',
  }),
  EmergencyEquipment('fireBlanket', {
    'fr': 'Couverture anti-feu',
    'en': 'Fire blanket',
    'nl': 'Blusdeken',
    'de': 'Löschdecke',
    'es': 'Manta ignífuga',
    'pt': 'Manta ignífuga',
  }),
  EmergencyEquipment('aed', {
    'fr': 'Défibrillateur (DAE)',
    'en': 'Defibrillator (AED)',
    'nl': 'Defibrillator (AED)',
    'de': 'Defibrillator (AED)',
    'es': 'Desfibrilador (DEA)',
    'pt': 'Desfibrilhador (DAE)',
  }),
  EmergencyEquipment('firstAidKit', {
    'fr': 'Trousse de premiers secours',
    'en': 'First aid kit',
    'nl': 'EHBO-koffer',
    'de': 'Erste-Hilfe-Kasten',
    'es': 'Botiquín de primeros auxilios',
    'pt': 'Kit de primeiros socorros',
  }),
  EmergencyEquipment('eyeWash', {
    'fr': 'Rince-œil',
    'en': 'Eye wash',
    'nl': 'Oogspoeling',
    'de': 'Augenspülung',
    'es': 'Lavaojos',
    'pt': 'Lava-olhos',
  }),
  EmergencyEquipment('stretcher', {
    'fr': 'Brancard',
    'en': 'Stretcher',
    'nl': 'Brancard',
    'de': 'Krankentrage',
    'es': 'Camilla',
    'pt': 'Maca',
  }),
  EmergencyEquipment('emergencyLighting', {
    'fr': 'Éclairage de secours et lampes',
    'en': 'Emergency lighting and torches',
    'nl': 'Noodverlichting en zaklampen',
    'de': 'Notbeleuchtung und Taschenlampen',
    'es': 'Iluminación de emergencia y linternas',
    'pt': 'Iluminação de emergência e lanternas',
  }),
  EmergencyEquipment('radios', {
    'fr': 'Radios (talkies-walkies)',
    'en': 'Two-way radios',
    'nl': 'Portofoons',
    'de': 'Funkgeräte',
    'es': 'Radios (walkie-talkies)',
    'pt': 'Rádios (walkie-talkies)',
  }),
];

/// Signature apposée dans l'app (image PNG encodée en base64).
class PpspsSignature {
  final String name;
  final String pngBase64;
  final DateTime signedAt;

  const PpspsSignature({
    required this.name,
    required this.pngBase64,
    required this.signedAt,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'png': pngBase64,
        'signedAt': signedAt.toIso8601String(),
      };

  static PpspsSignature? fromJson(dynamic json) {
    if (json is! Map) return null;
    final png = _s(json['png']);
    if (png.isEmpty) return null;
    return PpspsSignature(
      name: _s(json['name']),
      pngBase64: png,
      signedAt: _date(json['signedAt']) ?? DateTime.now(),
    );
  }
}

/// Numéro d'urgence affiché dans le plan, avec son libellé dans chaque
/// langue de document.
class EmergencyNumber {
  final String number;
  final Map<String, String> labels;
  const EmergencyNumber(this.number, this.labels);

  String labelFor(String lang) => labels[lang] ?? labels['en'] ?? number;
}

const Map<String, String> _kEu112 = {
  'fr': 'Numéro d\'urgence européen',
  'en': 'European emergency number',
  'nl': 'Europees noodnummer',
  'de': 'Europäischer Notruf',
  'es': 'Número de emergencia europeo',
  'pt': 'Número de emergência europeu',
};
const Map<String, String> _kSamu = {
  'fr': 'SAMU (urgences médicales)',
  'en': 'SAMU (medical emergencies)',
  'nl': 'SAMU (medische spoed)',
  'de': 'SAMU (medizinischer Notruf)',
  'es': 'SAMU (urgencias médicas)',
  'pt': 'SAMU (emergência médica)',
};
const Map<String, String> _kFire = {
  'fr': 'Pompiers',
  'en': 'Fire brigade',
  'nl': 'Brandweer',
  'de': 'Feuerwehr',
  'es': 'Bomberos',
  'pt': 'Bombeiros',
};
const Map<String, String> _kPolice = {
  'fr': 'Police',
  'en': 'Police',
  'nl': 'Politie',
  'de': 'Polizei',
  'es': 'Policía',
  'pt': 'Polícia',
};
const Map<String, String> _kFireAmbulance = {
  'fr': 'Pompiers et ambulance',
  'en': 'Fire and ambulance',
  'nl': 'Brandweer en ziekenwagen',
  'de': 'Feuerwehr und Rettungsdienst',
  'es': 'Bomberos y ambulancia',
  'pt': 'Bombeiros e ambulância',
};
const Map<String, String> _kPoison = {
  'fr': 'Centre Antipoisons',
  'en': 'Poison Centre',
  'nl': 'Antigifcentrum',
  'de': 'Giftnotruf',
  'es': 'Centro Antivenenos',
  'pt': 'Centro Antivenenos',
};

/// Numéros d'urgence du pays du chantier.
List<EmergencyNumber> emergencyNumbersFor(String country) {
  switch (country) {
    case 'FR':
      return const [
        EmergencyNumber('112', _kEu112),
        EmergencyNumber('15', _kSamu),
        EmergencyNumber('18', _kFire),
        EmergencyNumber('17', _kPolice),
      ];
    case 'BE':
      return const [
        EmergencyNumber('112', _kFireAmbulance),
        EmergencyNumber('101', _kPolice),
        EmergencyNumber('070 245 245', _kPoison),
      ];
    default:
      return const [EmergencyNumber('112', _kEu112)];
  }
}

class PpspsDocument {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final PpspsStatus status;
  final String country; // FR, BE…

  // ── Projet ──
  final String eventName;
  final String venue;
  final String address;
  final String organizer; // maître d'ouvrage / organisateur
  final String coordinator; // coordinateur sécurité-santé
  final Map<SafetyPhase, PpspsPhaseDates> phases;

  // ── Entreprise rédactrice ──
  final String companyName;
  final String companyAddress;
  final String companyActivity;
  final String responsibleName;
  final String responsiblePhone;

  // ── Intervenants ──
  final List<PpspsWorker> workers;

  // ── Risques retenus (clé = ID de risque de la bibliothèque) ──
  final Map<String, PpspsRiskSelection> risks;

  // ── Secours ──
  final PpspsEmergency emergency;

  /// Langues choisies au dernier export PDF (codes fr, nl, en…).
  final List<String> pdfLanguages;

  /// Signatures : « author » (rédacteur) et « coordinator » (visa).
  final Map<String, PpspsSignature> signatures;

  const PpspsDocument({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.status = PpspsStatus.draft,
    required this.country,
    this.eventName = '',
    this.venue = '',
    this.address = '',
    this.organizer = '',
    this.coordinator = '',
    this.phases = const {},
    this.companyName = '',
    this.companyAddress = '',
    this.companyActivity = '',
    this.responsibleName = '',
    this.responsiblePhone = '',
    this.workers = const [],
    this.risks = const {},
    this.emergency = const PpspsEmergency(),
    this.pdfLanguages = const [],
    this.signatures = const {},
  });

  factory PpspsDocument.create(String country) {
    final now = DateTime.now();
    return PpspsDocument(
      id: now.microsecondsSinceEpoch.toString(),
      createdAt: now,
      updatedAt: now,
      country: country,
    );
  }

  /// Phases du chantier pour lesquelles des dates sont renseignées.
  Set<SafetyPhase> get activePhases =>
      {for (final e in phases.entries) if (e.value.isSet) e.key};

  int get totalHeadcount => workers.fold(0, (s, w) => s + w.headcount);

  int get measureCount => risks.values.fold(0, (s, r) => s + r.measureCount);

  // Étapes complétées (pour la barre d'avancement de la liste).
  bool get projectDone =>
      eventName.trim().isNotEmpty && venue.trim().isNotEmpty;
  bool get workersDone => workers.isNotEmpty;
  bool get risksDone => risks.isNotEmpty;
  bool get emergencyDone => emergency.hospitalName.trim().isNotEmpty;

  int get completedSteps => [projectDone, workersDone, risksDone, emergencyDone]
      .where((b) => b)
      .length;

  PpspsDocument copyWith({
    PpspsStatus? status,
    String? country,
    String? eventName,
    String? venue,
    String? address,
    String? organizer,
    String? coordinator,
    Map<SafetyPhase, PpspsPhaseDates>? phases,
    String? companyName,
    String? companyAddress,
    String? companyActivity,
    String? responsibleName,
    String? responsiblePhone,
    List<PpspsWorker>? workers,
    Map<String, PpspsRiskSelection>? risks,
    PpspsEmergency? emergency,
    List<String>? pdfLanguages,
    Map<String, PpspsSignature>? signatures,
  }) =>
      PpspsDocument(
        id: id,
        createdAt: createdAt,
        updatedAt: DateTime.now(),
        status: status ?? this.status,
        country: country ?? this.country,
        eventName: eventName ?? this.eventName,
        venue: venue ?? this.venue,
        address: address ?? this.address,
        organizer: organizer ?? this.organizer,
        coordinator: coordinator ?? this.coordinator,
        phases: phases ?? this.phases,
        companyName: companyName ?? this.companyName,
        companyAddress: companyAddress ?? this.companyAddress,
        companyActivity: companyActivity ?? this.companyActivity,
        responsibleName: responsibleName ?? this.responsibleName,
        responsiblePhone: responsiblePhone ?? this.responsiblePhone,
        workers: workers ?? this.workers,
        risks: risks ?? this.risks,
        emergency: emergency ?? this.emergency,
        pdfLanguages: pdfLanguages ?? this.pdfLanguages,
        signatures: signatures ?? this.signatures,
      );

  /// Copie pour un nouvel événement : garde l'entreprise, les intervenants,
  /// les risques et les secours, vide les dates et repasse en brouillon.
  PpspsDocument duplicate() {
    final now = DateTime.now();
    return PpspsDocument(
      id: now.microsecondsSinceEpoch.toString(),
      createdAt: now,
      updatedAt: now,
      country: country,
      eventName: eventName,
      venue: venue,
      address: address,
      organizer: organizer,
      coordinator: coordinator,
      companyName: companyName,
      companyAddress: companyAddress,
      companyActivity: companyActivity,
      responsibleName: responsibleName,
      responsiblePhone: responsiblePhone,
      workers: workers,
      risks: risks,
      emergency: emergency,
      pdfLanguages: pdfLanguages,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'status': status.name,
        'country': country,
        'eventName': eventName,
        'venue': venue,
        'address': address,
        'organizer': organizer,
        'coordinator': coordinator,
        'phases': {
          for (final e in phases.entries) e.key.name: e.value.toJson()
        },
        'companyName': companyName,
        'companyAddress': companyAddress,
        'companyActivity': companyActivity,
        'responsibleName': responsibleName,
        'responsiblePhone': responsiblePhone,
        'workers': [for (final w in workers) w.toJson()],
        'risks': {for (final e in risks.entries) e.key: e.value.toJson()},
        'emergency': emergency.toJson(),
        'pdfLanguages': pdfLanguages,
        'signatures': {
          for (final e in signatures.entries) e.key: e.value.toJson()
        },
      };

  factory PpspsDocument.fromJson(Map<String, dynamic> json) {
    final phasesJson = json['phases'] is Map<String, dynamic>
        ? json['phases'] as Map<String, dynamic>
        : const <String, dynamic>{};
    final risksJson = json['risks'] is Map<String, dynamic>
        ? json['risks'] as Map<String, dynamic>
        : const <String, dynamic>{};
    final now = DateTime.now();
    final country = _s(json['country']);
    return PpspsDocument(
      id: _s(json['id']),
      createdAt: _date(json['createdAt']) ?? now,
      updatedAt: _date(json['updatedAt']) ?? now,
      status: json['status'] == PpspsStatus.finalized.name
          ? PpspsStatus.finalized
          : PpspsStatus.draft,
      country: country.isEmpty ? 'FR' : country,
      eventName: _s(json['eventName']),
      venue: _s(json['venue']),
      address: _s(json['address']),
      organizer: _s(json['organizer']),
      coordinator: _s(json['coordinator']),
      phases: {
        for (final p in SafetyPhase.values)
          if (phasesJson[p.name] is Map<String, dynamic>)
            p: PpspsPhaseDates.fromJson(
                phasesJson[p.name] as Map<String, dynamic>),
      },
      companyName: _s(json['companyName']),
      companyAddress: _s(json['companyAddress']),
      companyActivity: _s(json['companyActivity']),
      responsibleName: _s(json['responsibleName']),
      responsiblePhone: _s(json['responsiblePhone']),
      workers: [
        for (final w in (json['workers'] as List? ?? const []))
          if (w is Map<String, dynamic>) PpspsWorker.fromJson(w),
      ],
      risks: {
        for (final e in risksJson.entries)
          if (e.value is Map<String, dynamic>)
            e.key: PpspsRiskSelection.fromJson(
                e.value as Map<String, dynamic>),
      },
      emergency: PpspsEmergency.fromJson(
          json['emergency'] is Map<String, dynamic>
              ? json['emergency'] as Map<String, dynamic>
              : null),
      pdfLanguages: [
        for (final l in (json['pdfLanguages'] as List? ?? const [])) _s(l)
      ],
      signatures: {
        if (json['signatures'] is Map)
          for (final e in (json['signatures'] as Map).entries)
            if (PpspsSignature.fromJson(e.value) != null)
              e.key.toString(): PpspsSignature.fromJson(e.value)!,
      },
    );
  }
}
