// Truss library: manufacturer load tables used by the truss check of the
// « Charge par moteur » tool. Data lives in truss_library_data.dart,
// generated from the Google Sheet « ShowTech Tools – Bibliothèque Truss ».

import 'package:flutter/foundation.dart' show kReleaseMode;

import 'rigging_truss_engine.dart';
import 'truss_library_data.dart';

enum TrussProfile { ladder, triangle, square, rectangle, preRig }

class TrussLoadRow {
  const TrussLoadRow({
    required this.spanM,
    required this.udlKgPerM,
    required this.cplKg,
  });

  /// Single span, supported at both ends (m).
  final double spanM;

  /// Allowable uniformly distributed load (kg/m).
  final double udlKgPerM;

  /// Allowable centre point load (kg).
  final double cplKg;
}

class TrussModel {
  const TrussModel({
    required this.id,
    required this.manufacturer,
    required this.model,
    required this.profile,
    required this.weightKgPerM,
    required this.allowableIsNetOfSelfWeight,
    required this.validated,
    required this.source,
    required this.sourceUrl,
    required this.rows,
  });

  final String id;
  final String manufacturer;
  final String model;
  final TrussProfile profile;
  final double weightKgPerM;

  /// True when the table values already have the self-weight deducted.
  final bool allowableIsNetOfSelfWeight;

  /// True once every value has been checked against [sourceUrl]
  /// (« Validé » in the sheet).
  final bool validated;

  final String source;
  final String sourceUrl;

  /// Sorted by increasing span.
  final List<TrussLoadRow> rows;

  String get displayName => '$manufacturer $model';

  double get minSpanM => rows.first.spanM;
  double get maxSpanM => rows.last.spanM;

  /// Table row to use for [spanM]: the first tabulated span ≥ [spanM].
  /// Allowable loads decrease with span, so this is on the safe side.
  /// Below the first span, the first row is used (also on the safe side).
  /// Returns null beyond the last tabulated span.
  TrussLoadRow? rowFor(double spanM) {
    if (rows.isEmpty || !(spanM > 0)) return null;
    for (final r in rows) {
      if (r.spanM >= spanM - 1e-9) return r;
    }
    return null;
  }

  /// Allowable value for [spanM] and [type] (kg/m for UDL, kg for CPL).
  double? allowableFor(double spanM, TrussAllowableType type) {
    final r = rowFor(spanM);
    if (r == null) return null;
    return type == TrussAllowableType.udl ? r.udlKgPerM : r.cplKg;
  }
}

class TrussLibrary {
  /// Models offered in the app. Release builds only ship models whose
  /// values have been validated in the sheet; debug builds show them all.
  static List<TrussModel> available({bool? includeUnvalidated}) {
    final all = includeUnvalidated ?? !kReleaseMode;
    return [
      for (final m in kTrussLibrary)
        if (all || m.validated) m,
    ];
  }

  static TrussModel? byId(String id) {
    for (final m in kTrussLibrary) {
      if (m.id == id) return m;
    }
    return null;
  }
}
