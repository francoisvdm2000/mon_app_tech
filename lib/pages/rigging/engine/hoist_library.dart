// Hoist library: chain hoist data (WLL, class, weights) used by the
// « Charge par moteur » tool. Data lives in hoist_library_data.dart,
// generated from the Google Sheet « ShowTech Tools – Bibliothèque Truss »
// (tab Moteurs).

import 'package:flutter/foundation.dart' show kReleaseMode;

import 'hoist_library_data.dart';

class HoistModel {
  const HoistModel({
    required this.id,
    required this.manufacturer,
    required this.model,
    required this.wllKg,
    required this.hoistClass,
    required this.speedMPerMin,
    required this.weightKg,
    required this.chainKgPerM,
    required this.validated,
    required this.sourceUrl,
  });

  final String id;
  final String manufacturer;
  final String model;

  /// Working load limit given by the manufacturer (kg).
  final double wllKg;

  /// Class as published (D8, D8+, C1…). The class actually in force is the
  /// one on the hoist's own plate.
  final String hoistClass;

  final double? speedMPerMin;

  /// Hoist body without chain, hook or suspension (kg).
  final double? weightKg;

  /// Chain weight per metre (kg/m).
  final double? chainKgPerM;

  /// True once checked against [sourceUrl] (« Validé » in the sheet).
  final bool validated;

  final String sourceUrl;

  String get displayName {
    final speed = speedMPerMin;
    final s = speed == null
        ? ''
        : ' · ${speed == speed.roundToDouble() ? speed.toStringAsFixed(0) : speed} m/min';
    return '$manufacturer $model$s';
  }
}

class HoistLibrary {
  /// Hoists offered in the app. Release builds only ship validated ones;
  /// debug builds show them all.
  static List<HoistModel> available({bool? includeUnvalidated}) {
    final all = includeUnvalidated ?? !kReleaseMode;
    return [
      for (final h in kHoistLibrary)
        if (all || h.validated) h,
    ];
  }

  static HoistModel? byId(String id) {
    for (final h in kHoistLibrary) {
      if (h.id == id) return h;
    }
    return null;
  }
}
