import 'package:flutter_test/flutter_test.dart';
import 'package:mon_app_tech/pages/lumiere/diaph/diaph_engine.dart';

void main() {
  test('intensité au centre depuis lumens + angle (faisceau gaussien)', () {
    // Valeurs recoupées par un calcul indépendant (Python).
    expect(centerCandelaFromLumens(20000, 20), closeTo(145925, 150));
    expect(centerCandelaFromLumens(10000, 40), closeTo(18644, 30));
    expect(centerCandelaFromLumens(0, 20), 0);
  });

  test('lux à distance et mesure constructeur', () {
    expect(luxAt(145925, 10), closeTo(1459.25, 0.01));
    expect(candelaFromLuxAt(1000, 5), 25000);
  });

  test('caméra broadcast F11 à 2000 lx', () {
    const cam = BroadcastCamera(refF: 11);
    expect(cam.fNumberFor(2000), closeTo(11, 1e-9));
    // 4 fois moins de lumière = 2 diaphs = f/5.5
    expect(cam.fNumberFor(500), closeTo(5.5, 1e-9));
    // +6 dB de gain = 1 diaph de plus
    const gain = BroadcastCamera(refF: 11, gainDb: 6);
    expect(stopsBetween(gain.fNumberFor(500), cam.fNumberFor(500)),
        closeTo(1, 1e-9));
    // ND 1/4 = 2 diaphs de moins
    const nd = BroadcastCamera(refF: 11, ndStops: 2);
    expect(nd.fNumberFor(2000), closeTo(5.5, 1e-9));
    expect(cam.luxFor(11), closeTo(2000, 1e-6));
  });

  test('ISO / vitesse cohérent avec le posemètre', () {
    // Posemètre : Lux = N² × 250 / (t × ISO)
    final cam = IsoCamera(iso: 800, exposureSeconds: exposureTime(25, 180));
    const n = 5.6;
    final lux = n * n * 250 / ((1 / 50) * 800);
    expect(cam.fNumberFor(lux), closeTo(n, 1e-9));
  });

  test('distance pour un diaph visé', () {
    const cam = BroadcastCamera(refF: 11);
    // 2000 lx nécessaires à f/11 ; 200 000 cd → √100 = 10 m
    expect(distanceForFNumber(200000, 11, cam), closeTo(10, 1e-9));
  });

  test('diaph au tiers et affichage', () {
    expect(nearestThirdStop(9.4), 9.0);
    expect(nearestThirdStop(5.5), 5.6);
    expect(formatFNumber(2.8), '2.8');
    expect(formatFNumber(4.0), '4');
    expect(formatFNumber(11), '11');
  });
}
