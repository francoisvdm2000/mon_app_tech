// lib/pages/lumiere/diaph/diaph_engine.dart
//
// Calcul du diaph caméra obtenu avec une machine à une distance donnée.
// Aucune dépendance Flutter (testable avec `flutter test`).
//
// 1. Intensité au centre du faisceau (candela) :
//    - depuis le flux (lumens) et l'angle de faisceau : on suppose une
//      répartition « en cloche » (gaussienne) dont l'angle de faisceau est la
//      largeur à 50 % de l'intensité centrale (définition usuelle du « beam
//      angle »). Le flux total est intégré numériquement sur la demi-sphère
//      avant. C'est une estimation (± 1/2 diaph selon l'optique).
//    - ou directement depuis une valeur constructeur (lux à une distance).
// 2. Éclairement au centre : E = I / d² (lux).
// 3. Diaph :
//    - caméra broadcast, sensibilité constructeur « F_ref à E_ref lux »
//      (gain 0 dB) : N = F_ref · √(E / E_ref) · 2^(gain/12)
//    - ISO / vitesse (formule du posemètre à lumière incidente, C = 250,
//      comme le Posemètre de l'app) : N = √(E · t · ISO / C)
//    Un filtre ND de n diaphs divise N par 2^(n/2).

import 'dart:math' as math;

/// Constante d'étalonnage du posemètre incident (identique au Posemètre).
const double kIncidentMeterC = 250;

/// Éclairement de référence des sensibilités broadcast (lux).
const double kBroadcastRefLux = 2000;

/// Intensité au centre (cd) d'un faisceau gaussien de flux [lumens] et
/// d'angle de faisceau (largeur à 50 %) [beamAngleDeg].
double centerCandelaFromLumens(double lumens, double beamAngleDeg) {
  if (lumens <= 0 || beamAngleDeg <= 0 || beamAngleDeg >= 180) return 0;
  final half = beamAngleDeg / 2 * math.pi / 180;
  const ln2 = math.ln2;
  // ∫₀^{π/2} exp(-ln2·(θ/θh)²)·sinθ dθ  (Simpson)
  const n = 2000; // pair
  const a = 0.0, b = math.pi / 2;
  const h = (b - a) / n;
  double f(double t) => math.exp(-ln2 * (t / half) * (t / half)) * math.sin(t);
  var s = f(a) + f(b);
  for (var i = 1; i < n; i++) {
    s += f(a + i * h) * (i.isOdd ? 4 : 2);
  }
  final integral = s * h / 3;
  if (integral <= 0) return 0;
  return lumens / (2 * math.pi * integral);
}

/// Intensité (cd) déduite d'une mesure constructeur « [lux] à [distanceM] ».
double candelaFromLuxAt(double lux, double distanceM) =>
    (lux <= 0 || distanceM <= 0) ? 0 : lux * distanceM * distanceM;

double luxAt(double candela, double distanceM) =>
    (candela <= 0 || distanceM <= 0) ? 0 : candela / (distanceM * distanceM);

/// Diamètre du faisceau (à 50 %) à la distance donnée.
double beamDiameter(double beamAngleDeg, double distanceM) =>
    2 * distanceM * math.tan(beamAngleDeg / 2 * math.pi / 180);

/// Temps de pose (s) d'une caméra à [fps] images/s, obturateur [shutterDeg].
double exposureTime(double fps, double shutterDeg) =>
    (fps <= 0 || shutterDeg <= 0) ? 0 : (shutterDeg / 360) / fps;

/// Réglages caméra.
sealed class CameraSettings {
  const CameraSettings({this.ndStops = 0});

  /// Filtre ND en diaphs (1/4 = 2, 1/16 = 4, 1/64 = 6).
  final double ndStops;

  /// Diaph exact pour un éclairement [lux].
  double fNumberFor(double lux);

  /// Éclairement nécessaire pour travailler à [fNumber].
  double luxFor(double fNumber);
}

/// Caméra broadcast : sensibilité « [refF] à [refLux] lx », [gainDb] de gain.
class BroadcastCamera extends CameraSettings {
  const BroadcastCamera({
    required this.refF,
    this.refLux = kBroadcastRefLux,
    this.gainDb = 0,
    super.ndStops,
  });

  final double refF;
  final double refLux;
  final double gainDb;

  double get _k =>
      refF * math.pow(2, gainDb / 12) * math.pow(2, -ndStops / 2) /
      math.sqrt(refLux);

  @override
  double fNumberFor(double lux) => lux <= 0 ? 0 : _k * math.sqrt(lux);

  @override
  double luxFor(double fNumber) =>
      fNumber <= 0 ? 0 : math.pow(fNumber / _k, 2).toDouble();
}

/// Caméra réglée en ISO / temps de pose (cinéma, photo).
class IsoCamera extends CameraSettings {
  const IsoCamera({
    required this.iso,
    required this.exposureSeconds,
    super.ndStops,
  });

  final double iso;
  final double exposureSeconds;

  double get _k =>
      math.sqrt(exposureSeconds * iso / kIncidentMeterC) *
      math.pow(2, -ndStops / 2);

  @override
  double fNumberFor(double lux) =>
      (lux <= 0 || iso <= 0 || exposureSeconds <= 0) ? 0 : _k * math.sqrt(lux);

  @override
  double luxFor(double fNumber) =>
      (fNumber <= 0 || iso <= 0 || exposureSeconds <= 0)
          ? 0
          : math.pow(fNumber / _k, 2).toDouble();
}

/// Distance (m) à laquelle placer une machine d'intensité [candela] pour
/// travailler à [fNumber].
double distanceForFNumber(
    double candela, double fNumber, CameraSettings camera) {
  final lux = camera.luxFor(fNumber);
  if (candela <= 0 || lux <= 0) return 0;
  return math.sqrt(candela / lux);
}

/// Diaphs nominaux au tiers.
const List<double> kThirdStops = [
  1.0, 1.1, 1.2, 1.4, 1.6, 1.8, 2.0, 2.2, 2.5, 2.8, 3.2, 3.5, 4.0, 4.5, 5.0,
  5.6, 6.3, 7.1, 8.0, 9.0, 10, 11, 13, 14, 16, 18, 20, 22, 25, 29, 32,
];

/// Diaph nominal le plus proche (au tiers).
double nearestThirdStop(double n) {
  if (n <= 0) return 0;
  var best = kThirdStops.first;
  var bestD = double.infinity;
  for (final s in kThirdStops) {
    final d = (math.log(n / s)).abs();
    if (d < bestD) {
      bestD = d;
      best = s;
    }
  }
  return best;
}

/// Écart en diaphs entre deux ouvertures (+ = [n] plus fermé que [ref]).
double stopsBetween(double n, double ref) =>
    (n <= 0 || ref <= 0) ? 0 : 2 * math.log(n / ref) / math.ln2;

/// Affichage d'un diaph : « 2.8 », « 11 ».
String formatFNumber(double n) {
  if (n >= 10) return n.round().toString();
  final s = n.toStringAsFixed(1);
  return s.endsWith('.0') ? s.substring(0, s.length - 2) : s;
}
