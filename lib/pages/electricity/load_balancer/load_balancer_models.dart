// lib/pages/electricity/load_balancer/load_balancer_models.dart
import 'dart:math' as math;

// ─── Enums ───────────────────────────────────────────────────────────────────

enum PanelVoltageType {
  mono110,
  mono230,
  tri220, // Triangle / Delta — pas de neutre, 220 V ligne à ligne
  tri380; // Étoile / Star — 3 phases + neutre, 380 V L-L / 220 V L-N

  bool get isThreePhase => this == tri220 || this == tri380;

  /// Triangle (delta) : charges entre deux conducteurs, pas de neutre
  bool get isDelta => this == tri220;

  /// Tension de calcul du courant :
  ///   Mono / étoile → tension phase-neutre
  ///   Triangle      → tension ligne à ligne (220 V direct, pas /√3)
  double get calcVoltage => switch (this) {
        mono110 => 110.0,
        mono230 => 230.0,
        tri220 => 220.0,
        tri380 => 380.0 / math.sqrt(3), // ≈ 220 V
      };

  String get label => switch (this) {
        mono110 => 'Mono 110 V',
        mono230 => 'Mono 230 V',
        tri220 => 'Tri 220 V △',
        tri380 => 'Tri 380 V Y',
      };

  String get key => name;

  static PanelVoltageType fromKey(String key) => PanelVoltageType.values
      .firstWhere((e) => e.key == key, orElse: () => PanelVoltageType.tri380);
}

enum PanelSize {
  a32,
  a63,
  a125,
  a250;

  int get ampere => switch (this) {
        a32 => 32,
        a63 => 63,
        a125 => 125,
        a250 => 250,
      };

  String get label => '$ampere A';
  String get key => name;

  static PanelSize fromKey(String key) => PanelSize.values
      .firstWhere((e) => e.key == key, orElse: () => PanelSize.a63);
}

/// Étoile (mono & tri 380 V) : L1, L2, L3 (charge phase → neutre)
/// Triangle (tri 220 V)       : L1-L2, L2-L3, L3-L1 (charge entre deux conducteurs)
enum PhaseAssignment {
  l1, l2, l3,         // étoile / monophasé
  l1l2, l2l3, l3l1;  // triangle

  String get label => switch (this) {
        l1 => 'L1',
        l2 => 'L2',
        l3 => 'L3',
        l1l2 => 'L1-L2',
        l2l3 => 'L2-L3',
        l3l1 => 'L3-L1',
      };

  String get key => name;
  bool get isDelta => this == l1l2 || this == l2l3 || this == l3l1;

  static PhaseAssignment fromKey(String key) => PhaseAssignment.values
      .firstWhere((e) => e.key == key, orElse: () => PhaseAssignment.l1);
}

// ─── Models ──────────────────────────────────────────────────────────────────

class LoadItem {
  final String id;
  final String manufacturer;
  final String name;
  final int powerWatt;
  final int quantity;
  final PhaseAssignment phase;

  const LoadItem({
    required this.id,
    required this.manufacturer,
    required this.name,
    required this.powerWatt,
    required this.quantity,
    required this.phase,
  });

  int get totalPowerWatt => powerWatt * quantity;

  LoadItem copyWith({
    String? id,
    String? manufacturer,
    String? name,
    int? powerWatt,
    int? quantity,
    PhaseAssignment? phase,
  }) =>
      LoadItem(
        id: id ?? this.id,
        manufacturer: manufacturer ?? this.manufacturer,
        name: name ?? this.name,
        powerWatt: powerWatt ?? this.powerWatt,
        quantity: quantity ?? this.quantity,
        phase: phase ?? this.phase,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'manufacturer': manufacturer,
        'name': name,
        'powerWatt': powerWatt,
        'quantity': quantity,
        'phase': phase.key,
      };

  factory LoadItem.fromJson(Map<String, dynamic> json) => LoadItem(
        id: (json['id'] ?? '').toString(),
        manufacturer: (json['manufacturer'] ?? '').toString(),
        name: (json['name'] ?? '').toString(),
        powerWatt: _asInt(json['powerWatt'], fallback: 0),
        quantity: _asInt(json['quantity'], fallback: 1),
        phase: PhaseAssignment.fromKey((json['phase'] ?? '').toString()),
      );
}

class LoadDistribution {
  final PanelVoltageType voltageType;
  final PanelSize panelSize;
  final double cosPhi;
  final List<LoadItem> items;

  const LoadDistribution({
    required this.voltageType,
    required this.panelSize,
    required this.cosPhi,
    required this.items,
  });

  static LoadDistribution get empty => const LoadDistribution(
        voltageType: PanelVoltageType.tri380,
        panelSize: PanelSize.a63,
        cosPhi: 0.9,
        items: [],
      );

  LoadDistribution copyWith({
    PanelVoltageType? voltageType,
    PanelSize? panelSize,
    double? cosPhi,
    List<LoadItem>? items,
  }) =>
      LoadDistribution(
        voltageType: voltageType ?? this.voltageType,
        panelSize: panelSize ?? this.panelSize,
        cosPhi: cosPhi ?? this.cosPhi,
        items: items ?? this.items,
      );

  // ── Phases disponibles ────────────────────────────────────────────────────

  List<PhaseAssignment> get availablePhases => switch (voltageType) {
        PanelVoltageType.mono110 => [PhaseAssignment.l1],
        PanelVoltageType.mono230 => [PhaseAssignment.l1],
        PanelVoltageType.tri220 => [
            PhaseAssignment.l1l2,
            PhaseAssignment.l2l3,
            PhaseAssignment.l3l1,
          ],
        PanelVoltageType.tri380 => [
            PhaseAssignment.l1,
            PhaseAssignment.l2,
            PhaseAssignment.l3,
          ],
      };

  PhaseAssignment get defaultPhase => availablePhases.first;

  // ── Calculs ───────────────────────────────────────────────────────────────

  int totalWattForPhase(PhaseAssignment phase) => items
      .where((i) => i.phase == phase)
      .fold(0, (s, i) => s + i.totalPowerWatt);

  double _branchCurrent(PhaseAssignment p) {
    final watts = totalWattForPhase(p).toDouble();
    if (watts <= 0) return 0;
    return watts / (voltageType.calcVoltage * cosPhi);
  }

  /// Courant dans un conducteur (L1, L2 ou L3) — ce que voit le disjoncteur.
  /// Triangle : chaque conducteur est partagé par deux branches.
  double conductorCurrent(PhaseAssignment conductor) {
    assert(!conductor.isDelta);
    if (!voltageType.isDelta) return _branchCurrent(conductor);
    return switch (conductor) {
      PhaseAssignment.l1 =>
        _branchCurrent(PhaseAssignment.l1l2) + _branchCurrent(PhaseAssignment.l3l1),
      PhaseAssignment.l2 =>
        _branchCurrent(PhaseAssignment.l1l2) + _branchCurrent(PhaseAssignment.l2l3),
      PhaseAssignment.l3 =>
        _branchCurrent(PhaseAssignment.l2l3) + _branchCurrent(PhaseAssignment.l3l1),
      _ => 0,
    };
  }

  /// Courant affiché dans les jauges (branche pour △, conducteur pour Y).
  double currentForDisplay(PhaseAssignment p) =>
      voltageType.isDelta ? _branchCurrent(p) : conductorCurrent(p);

  double get maxConductorCurrent {
    if (voltageType.isDelta) {
      return [
        conductorCurrent(PhaseAssignment.l1),
        conductorCurrent(PhaseAssignment.l2),
        conductorCurrent(PhaseAssignment.l3),
      ].fold(0.0, math.max);
    }
    return availablePhases.map(conductorCurrent).fold(0.0, math.max);
  }

  double get maxLoadRatio => maxConductorCurrent / panelSize.ampere;

  // ── Sérialisation ─────────────────────────────────────────────────────────

  Map<String, dynamic> toJson() => {
        'voltageType': voltageType.key,
        'panelSize': panelSize.key,
        'cosPhi': cosPhi,
        'items': items.map((i) => i.toJson()).toList(),
      };

  factory LoadDistribution.fromJson(Map<String, dynamic> json) =>
      LoadDistribution(
        voltageType:
            PanelVoltageType.fromKey((json['voltageType'] ?? '').toString()),
        panelSize: PanelSize.fromKey((json['panelSize'] ?? '').toString()),
        cosPhi: _asDouble(json['cosPhi'], fallback: 0.9),
        items: (json['items'] is List)
            ? (json['items'] as List)
                .whereType<Map>()
                .map((m) => LoadItem.fromJson(Map<String, dynamic>.from(m)))
                .toList()
            : [],
      );
}

// ─── Helpers ─────────────────────────────────────────────────────────────────

int _asInt(dynamic v, {required int fallback}) {
  if (v is int) return v;
  if (v is num) return v.toInt();
  return int.tryParse(v?.toString() ?? '') ?? fallback;
}

double _asDouble(dynamic v, {required double fallback}) {
  if (v is double) return v;
  if (v is num) return v.toDouble();
  return double.tryParse((v?.toString() ?? '').replaceAll(',', '.')) ?? fallback;
}
