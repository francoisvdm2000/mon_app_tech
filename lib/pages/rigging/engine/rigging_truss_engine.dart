// ShowTech Tools — Truss load per hoist (2 to N hoists).
//
// Pure Dart (no Flutter import) so it can be unit-tested.
//
// Model: Euler–Bernoulli beam with constant stiffness, hung from N vertical
// supports (hoists) assumed perfectly level and rigid. Loads: uniform load
// (self-weight + extra) and point loads. Solved with the direct stiffness
// method; nodes are placed at every support and point load, so nodal results
// are exact for this model.
//
// - 2 hoists: statically determinate, the result is exact statics.
// - 3+ hoists: statically indeterminate. The result is the ideal theoretical
//   distribution; real loads depend heavily on hoist heights and truss
//   stiffness. The UI must say so.
//
// Units: lengths in m, masses in kg, moments in kg·m (× g/1000 → kN·m).

import 'dart:math' as math;

const double kRiggingGravity = 9.81;

double riggingKgToKn(double kg) => kg * kRiggingGravity / 1000.0;

class TrussPointLoad {
  const TrussPointLoad(this.positionM, this.massKg);

  /// Distance from the left end of the truss (m).
  final double positionM;
  final double massKg;
}

/// Type of value read in the manufacturer's load table.
enum TrussAllowableType {
  /// Uniformly distributed load (kg/m) for a simple span.
  udl,

  /// Centre point load (kg) for a simple span.
  cpl,
}

enum TrussInputError {
  length,
  motorCount,
  motorOutside,
  motorOrder,
  negativeValue,
  loadOutside,
  dynamicFactor,
  wll,
}

class TrussLoadInput {
  const TrussLoadInput({
    required this.lengthM,
    required this.selfWeightKgPerM,
    this.extraUdlKgPerM = 0,
    required this.motorPositionsM,
    this.pointLoads = const [],
    this.extraPerMotorKg = 0,
    this.dynamicFactor = 1.0,
    required this.motorWllKg,
    this.allowableType = TrussAllowableType.udl,
    this.allowableValue,
    this.allowableIsNetOfSelfWeight = false,
  });

  final double lengthM;
  final double selfWeightKgPerM;

  /// Cables, tape, etc. spread over the whole truss (kg/m).
  final double extraUdlKgPerM;

  /// Hoist positions from the left end (m), in increasing order.
  final List<double> motorPositionsM;

  final List<TrussPointLoad> pointLoads;

  /// Weight added at each pick point and carried by the hoist: chain below
  /// the hook, slings, shackles, steel… (kg).
  final double extraPerMotorKg;

  /// Dynamic factor applied to hoist loads (≥ 1).
  final double dynamicFactor;

  /// Working Load Limit of each hoist (kg).
  final double motorWllKg;

  final TrussAllowableType allowableType;

  /// Value read in the manufacturer's table for the largest span:
  /// kg/m for [TrussAllowableType.udl], kg for [TrussAllowableType.cpl].
  /// Null = no truss check.
  final double? allowableValue;

  /// True when [allowableValue] is a net (useful) load with the truss
  /// self-weight already deducted, as in Prolyte tables. The self-weight
  /// moment is then added back to the allowable moment.
  final bool allowableIsNetOfSelfWeight;
}

class TrussMotorResult {
  const TrussMotorResult({
    required this.positionM,
    required this.reactionKg,
    required this.staticKg,
    required this.designKg,
    required this.utilisation,
  });

  final double positionM;

  /// Share of the truss + loads carried by this hoist (kg).
  final double reactionKg;

  /// reactionKg + extra at the pick point (kg).
  final double staticKg;

  /// staticKg × dynamic factor (kg).
  final double designKg;

  /// designKg / WLL (1.0 = 100 %).
  final double utilisation;

  double get designKn => riggingKgToKn(designKg);
}

class TrussLoadResult {
  const TrussLoadResult._({
    this.error,
    this.motors = const [],
    this.totalStaticKg = 0,
    this.totalDesignKg = 0,
    this.maxMomentKgm = 0,
    this.maxMomentPositionM = 0,
    this.largestSpanM = 0,
    this.hasCantilever = false,
    this.uplift = false,
    this.trussUtilisation,
  });

  factory TrussLoadResult.invalid(TrussInputError error) =>
      TrussLoadResult._(error: error);

  final TrussInputError? error;
  final List<TrussMotorResult> motors;

  /// Sum of static hoist loads (truss + loads + extras), kg.
  final double totalStaticKg;
  final double totalDesignKg;

  /// Largest absolute bending moment along the truss (kg·m).
  final double maxMomentKgm;
  final double maxMomentPositionM;

  /// Largest distance between two adjacent hoists (m).
  final double largestSpanM;

  /// True if the truss extends beyond the first or last hoist.
  final bool hasCantilever;

  /// True if a hoist has a negative reaction (would be lifted).
  final bool uplift;

  /// maxMoment / allowable moment derived from the manufacturer value.
  final double? trussUtilisation;

  bool get isValid => error == null;
  bool get isHyperstatic => motors.length >= 3;
  double get maxMomentKnm => riggingKgToKn(maxMomentKgm);

  double get maxMotorUtilisation =>
      motors.fold<double>(0, (m, r) => math.max(m, r.utilisation));
}

class RiggingTrussEngine {
  static const double _eps = 1e-9;

  static TrussLoadResult compute(TrussLoadInput i) {
    final len = i.lengthM;
    final motors = i.motorPositionsM;

    // ── Validation ──────────────────────────────────────────────────────
    if (!(len > 0)) return TrussLoadResult.invalid(TrussInputError.length);
    if (motors.length < 2) {
      return TrussLoadResult.invalid(TrussInputError.motorCount);
    }
    for (final x in motors) {
      if (x < -_eps || x > len + _eps) {
        return TrussLoadResult.invalid(TrussInputError.motorOutside);
      }
    }
    for (var k = 1; k < motors.length; k++) {
      if (motors[k] - motors[k - 1] < 0.01) {
        return TrussLoadResult.invalid(TrussInputError.motorOrder);
      }
    }
    final allowable = i.allowableValue;
    if (i.selfWeightKgPerM < 0 ||
        i.extraUdlKgPerM < 0 ||
        i.extraPerMotorKg < 0 ||
        (allowable != null && allowable < 0)) {
      return TrussLoadResult.invalid(TrussInputError.negativeValue);
    }
    for (final p in i.pointLoads) {
      if (p.massKg < 0) {
        return TrussLoadResult.invalid(TrussInputError.negativeValue);
      }
      if (p.positionM < -_eps || p.positionM > len + _eps) {
        return TrussLoadResult.invalid(TrussInputError.loadOutside);
      }
    }
    if (!(i.dynamicFactor >= 1.0)) {
      return TrussLoadResult.invalid(TrussInputError.dynamicFactor);
    }
    if (!(i.motorWllKg > 0)) {
      return TrussLoadResult.invalid(TrussInputError.wll);
    }

    final w = i.selfWeightKgPerM + i.extraUdlKgPerM;

    // ── Nodes ───────────────────────────────────────────────────────────
    final raw = <double>[
      0,
      len,
      ...motors,
      ...i.pointLoads.map((p) => p.positionM),
    ]..sort();
    final nodes = <double>[];
    for (final x in raw) {
      final xc = x.clamp(0.0, len).toDouble();
      if (nodes.isEmpty || xc - nodes.last > 1e-6) nodes.add(xc);
    }
    int nodeIndex(double x) {
      var best = 0;
      var bestD = double.infinity;
      for (var k = 0; k < nodes.length; k++) {
        final d = (nodes[k] - x).abs();
        if (d < bestD) {
          bestD = d;
          best = k;
        }
      }
      return best;
    }

    // ── Assembly (EI = 1: reactions do not depend on EI for level supports)
    final nDof = nodes.length * 2;
    final kMat = List.generate(nDof, (_) => List<double>.filled(nDof, 0));
    final f = List<double>.filled(nDof, 0);

    for (var e = 0; e < nodes.length - 1; e++) {
      final h = nodes[e + 1] - nodes[e];
      final h2 = h * h;
      final h3 = h2 * h;
      final ke = <List<double>>[
        [12 / h3, 6 / h2, -12 / h3, 6 / h2],
        [6 / h2, 4 / h, -6 / h2, 2 / h],
        [-12 / h3, -6 / h2, 12 / h3, -6 / h2],
        [6 / h2, 2 / h, -6 / h2, 4 / h],
      ];
      final dofs = [2 * e, 2 * e + 1, 2 * e + 2, 2 * e + 3];
      for (var r = 0; r < 4; r++) {
        for (var c = 0; c < 4; c++) {
          kMat[dofs[r]][dofs[c]] += ke[r][c];
        }
      }
      // Consistent nodal loads for a downward UDL (upward = positive).
      f[dofs[0]] += -w * h / 2;
      f[dofs[1]] += -w * h2 / 12;
      f[dofs[2]] += -w * h / 2;
      f[dofs[3]] += w * h2 / 12;
    }
    for (final p in i.pointLoads) {
      f[2 * nodeIndex(p.positionM)] -= p.massKg;
    }

    final supportDofs = motors.map((x) => 2 * nodeIndex(x)).toList();
    final supportSet = supportDofs.toSet();
    final free = <int>[
      for (var d = 0; d < nDof; d++)
        if (!supportSet.contains(d)) d,
    ];

    final kff = <List<double>>[
      for (final r in free) [for (final c in free) kMat[r][c]],
    ];
    final ff = <double>[for (final r in free) f[r]];
    final uf = _solve(kff, ff);

    final u = List<double>.filled(nDof, 0);
    for (var k = 0; k < free.length; k++) {
      u[free[k]] = uf[k];
    }

    // Reactions: R = K·u − F (upward positive).
    final reactions = <double>[];
    for (final d in supportDofs) {
      var s = 0.0;
      for (var c = 0; c < nDof; c++) {
        s += kMat[d][c] * u[c];
      }
      reactions.add(s - f[d]);
    }

    // ── Bending moment by statics (sagging positive) ────────────────────
    double momentAt(double x) {
      var m = -w * x * x / 2;
      for (var k = 0; k < motors.length; k++) {
        if (motors[k] < x) m += reactions[k] * (x - motors[k]);
      }
      for (final p in i.pointLoads) {
        if (p.positionM < x) m -= p.massKg * (x - p.positionM);
      }
      return m;
    }

    final xs = <double>{...nodes};
    const steps = 800;
    for (var k = 0; k <= steps; k++) {
      xs.add(len * k / steps);
    }
    var mMax = 0.0;
    var xMax = 0.0;
    for (final x in xs) {
      final m = momentAt(x).abs();
      if (m > mMax) {
        mMax = m;
        xMax = x;
      }
    }

    // ── Hoists ──────────────────────────────────────────────────────────
    final motorResults = <TrussMotorResult>[];
    var totalStatic = 0.0;
    var totalDesign = 0.0;
    var uplift = false;
    for (var k = 0; k < motors.length; k++) {
      final r = reactions[k];
      if (r < -1e-6) uplift = true;
      final st = r + i.extraPerMotorKg;
      final design = st * i.dynamicFactor;
      totalStatic += st;
      totalDesign += design;
      motorResults.add(TrussMotorResult(
        positionM: motors[k],
        reactionKg: r,
        staticKg: st,
        designKg: design,
        utilisation: design / i.motorWllKg,
      ));
    }

    var largestSpan = 0.0;
    for (var k = 1; k < motors.length; k++) {
      largestSpan = math.max(largestSpan, motors[k] - motors[k - 1]);
    }
    final hasCantilever = motors.first > 0.01 || motors.last < len - 0.01;

    // ── Truss check (moment only) ───────────────────────────────────────
    double? trussUtil;
    if (allowable != null && allowable > 0 && largestSpan > 0) {
      var mAllow = i.allowableType == TrussAllowableType.udl
          ? allowable * largestSpan * largestSpan / 8
          : allowable * largestSpan / 4;
      if (i.allowableIsNetOfSelfWeight) {
        mAllow += i.selfWeightKgPerM * largestSpan * largestSpan / 8;
      }
      trussUtil = mMax / mAllow;
    }

    return TrussLoadResult._(
      motors: motorResults,
      totalStaticKg: totalStatic,
      totalDesignKg: totalDesign,
      maxMomentKgm: mMax,
      maxMomentPositionM: xMax,
      largestSpanM: largestSpan,
      hasCantilever: hasCantilever,
      uplift: uplift,
      trussUtilisation: trussUtil,
    );
  }

  /// Gaussian elimination with partial pivoting.
  static List<double> _solve(List<List<double>> a, List<double> b) {
    final n = b.length;
    final m = <List<double>>[for (final row in a) [...row]];
    final x = <double>[...b];
    for (var col = 0; col < n; col++) {
      var piv = col;
      for (var r = col + 1; r < n; r++) {
        if (m[r][col].abs() > m[piv][col].abs()) piv = r;
      }
      if (piv != col) {
        final t = m[col];
        m[col] = m[piv];
        m[piv] = t;
        final tb = x[col];
        x[col] = x[piv];
        x[piv] = tb;
      }
      final p = m[col][col];
      for (var r = col + 1; r < n; r++) {
        final factor = m[r][col] / p;
        if (factor == 0) continue;
        for (var c = col; c < n; c++) {
          m[r][c] -= factor * m[col][c];
        }
        x[r] -= factor * x[col];
      }
    }
    final out = List<double>.filled(n, 0);
    for (var r = n - 1; r >= 0; r--) {
      var s = x[r];
      for (var c = r + 1; c < n; c++) {
        s -= m[r][c] * out[c];
      }
      out[r] = s / m[r][r];
    }
    return out;
  }
}
