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

/// Risque retenu dans le plan, avec ses mesures cochées et ajoutées.
class PpspsRiskSelection {
  final Set<String> measureIds;
  final List<String> customMeasures;

  const PpspsRiskSelection({
    this.measureIds = const {},
    this.customMeasures = const [],
  });

  int get measureCount => measureIds.length + customMeasures.length;

  PpspsRiskSelection copyWith({
    Set<String>? measureIds,
    List<String>? customMeasures,
  }) =>
      PpspsRiskSelection(
        measureIds: measureIds ?? this.measureIds,
        customMeasures: customMeasures ?? this.customMeasures,
      );

  Map<String, dynamic> toJson() => {
        'measures': measureIds.toList(),
        'custom': customMeasures,
      };

  factory PpspsRiskSelection.fromJson(Map<String, dynamic> json) =>
      PpspsRiskSelection(
        measureIds: {
          for (final m in (json['measures'] as List? ?? const [])) _s(m)
        },
        customMeasures: [
          for (final m in (json['custom'] as List? ?? const [])) _s(m)
        ],
      );
}

/// Organisation des secours sur le site.
class PpspsEmergency {
  final String hospitalName;
  final String hospitalAddress;
  final String hospitalPhone;
  final String firstAiders; // noms des secouristes présents
  final String assemblyPoint; // point de rassemblement
  final String equipment; // extincteurs, défibrillateur, trousse

  const PpspsEmergency({
    this.hospitalName = '',
    this.hospitalAddress = '',
    this.hospitalPhone = '',
    this.firstAiders = '',
    this.assemblyPoint = '',
    this.equipment = '',
  });

  PpspsEmergency copyWith({
    String? hospitalName,
    String? hospitalAddress,
    String? hospitalPhone,
    String? firstAiders,
    String? assemblyPoint,
    String? equipment,
  }) =>
      PpspsEmergency(
        hospitalName: hospitalName ?? this.hospitalName,
        hospitalAddress: hospitalAddress ?? this.hospitalAddress,
        hospitalPhone: hospitalPhone ?? this.hospitalPhone,
        firstAiders: firstAiders ?? this.firstAiders,
        assemblyPoint: assemblyPoint ?? this.assemblyPoint,
        equipment: equipment ?? this.equipment,
      );

  Map<String, dynamic> toJson() => {
        'hospitalName': hospitalName,
        'hospitalAddress': hospitalAddress,
        'hospitalPhone': hospitalPhone,
        'firstAiders': firstAiders,
        'assemblyPoint': assemblyPoint,
        'equipment': equipment,
      };

  factory PpspsEmergency.fromJson(Map<String, dynamic>? json) =>
      PpspsEmergency(
        hospitalName: _s(json?['hospitalName']),
        hospitalAddress: _s(json?['hospitalAddress']),
        hospitalPhone: _s(json?['hospitalPhone']),
        firstAiders: _s(json?['firstAiders']),
        assemblyPoint: _s(json?['assemblyPoint']),
        equipment: _s(json?['equipment']),
      );
}

/// Numéro d'urgence affiché dans le plan.
class EmergencyNumber {
  final String label;
  final String number;
  const EmergencyNumber(this.label, this.number);
}

/// Numéros d'urgence par pays (libellés dans la langue du document).
List<EmergencyNumber> emergencyNumbersFor(String country) {
  switch (country) {
    case 'FR':
      return const [
        EmergencyNumber('Numéro d\'urgence européen', '112'),
        EmergencyNumber('SAMU', '15'),
        EmergencyNumber('Pompiers', '18'),
        EmergencyNumber('Police', '17'),
      ];
    case 'BE':
      return const [
        EmergencyNumber('Pompiers et ambulance', '112'),
        EmergencyNumber('Police', '101'),
        EmergencyNumber('Centre Antipoisons', '070 245 245'),
      ];
    default:
      return const [EmergencyNumber('Emergency', '112')];
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
    );
  }
}
