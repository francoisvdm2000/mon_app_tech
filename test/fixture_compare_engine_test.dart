import 'package:flutter_test/flutter_test.dart';
import 'package:mon_app_tech/pages/lumiere/fixtures/fixture_compare_engine.dart';
import 'package:mon_app_tech/pages/lumiere/fixtures/fixture_models.dart';

Product _p(
  String type,
  String name, {
  int? lm,
  int? w,
  double? kg,
  double? zMin,
  double? zMax,
  String? src,
  int? cri,
}) =>
    Product(
      type: type,
      name: name,
      modes: const [],
      dmxChannels: null,
      weightKilogram: kg,
      powerWatt: w,
      luminousFluxLumen: lm,
      manualUrl: null,
      dmxChartUrl: null,
      zoomMinDeg: zMin,
      zoomMaxDeg: zMax,
      lightSource: src,
      cri: cri,
    );

void main() {
  group('familles', () {
    test('types courants du catalogue', () {
      expect(familyOfText('Profile'), FixtureFamily.spotProfile);
      expect(familyOfText('Moving head profile (serie Maverick)'),
          FixtureFamily.spotProfile);
      expect(familyOfText('Wash FX'), FixtureFamily.wash);
      expect(familyOfText('Beam / Spot'), FixtureFamily.hybrid);
      expect(familyOfText('BSW'), FixtureFamily.hybrid);
      expect(familyOfText('Moving head beam/wash haute vitesse'),
          FixtureFamily.hybrid);
      expect(familyOfText('Linear moving head wash'), FixtureFamily.bar);
      expect(familyOfText('Fresnel / PC'), FixtureFamily.fresnelPc);
      expect(familyOfText('PAR LED IP65'), FixtureFamily.par);
      expect(familyOfText('Hazer'), FixtureFamily.atmospheric);
      expect(familyOfText('DMX'), FixtureFamily.other);
      expect(familyOfText('Moving Head'), FixtureFamily.movingHead);
      expect(familyOfText('Poursuite (followspot) LED IP65'),
          FixtureFamily.followspot);
    });

    test('familles proches', () {
      expect(familiesMatch(FixtureFamily.spotProfile, FixtureFamily.hybrid,
          FamilyScope.same), isFalse);
      expect(familiesMatch(FixtureFamily.spotProfile, FixtureFamily.hybrid,
          FamilyScope.close), isTrue);
      expect(familiesMatch(FixtureFamily.wash, FixtureFamily.atmospheric,
          FamilyScope.all), isFalse);
    });
  });

  test('source lumineuse', () {
    expect(sourceKindOf(_p('Wash', 'a', src: 'LED RGBW')), SourceKind.colorLed);
    expect(sourceKindOf(_p('Wash', 'a', src: 'LED blanc')), SourceKind.whiteLed);
    expect(sourceKindOf(_p('Beam', 'a', src: 'Lampe à décharge 470 W')),
        SourceKind.discharge);
    expect(sourceKindOf(_p('Spot', 'a', src: 'Laser-phosphore')),
        SourceKind.laserPhosphor);
    expect(sourceKindOf(_p('Spot', 'a')), isNull);
  });

  test('proximité logarithmique', () {
    expect(closeness(100, 100), 1.0);
    expect(closeness(200, 100), 0.0);
    expect(closeness(50, 100), 0.0);
    expect(closeness(110, 100), closeTo(0.86, 0.01));
  });

  group('recherche', () {
    final ref = _p('Profile', 'REF',
        lm: 20000, w: 800, kg: 30, zMin: 8, zMax: 45, cri: 90,
        src: 'LED blanc');
    final twin = _p('Profile', 'Jumeau',
        lm: 21000, w: 750, kg: 28, zMin: 7, zMax: 47, cri: 92,
        src: 'LED blanc');
    final dim = _p('Profile', 'Faible', lm: 9000, w: 400, kg: 20);
    final wash = _p('Wash', 'Wash', lm: 20000, w: 800, kg: 30);
    final noData = _p('Spot', 'Inconnu');
    final catalog = FixtureCatalog(
      version: 1,
      updatedAt: DateTime(2026),
      manufacturers: [
        Manufacturer(name: 'A', products: [ref, twin, dim]),
        Manufacturer(name: 'B', products: [wash, noData]),
      ],
    );
    final refM = catalog.manufacturers.first;

    test('classement : le jumeau d\'abord, la référence exclue', () {
      final r = findEquivalents(
          catalog: catalog, refManufacturer: refM, ref: ref);
      expect(r.map((e) => e.product.name), ['Jumeau', 'Faible', 'Inconnu']);
      expect(r.first.score, greaterThan(0.9));
      expect(r.first.coversZoom, isTrue);
      expect(r.last.incomplete, isTrue);
      expect(r.last.score, 0);
    });

    test('tolérance de flux et données incomplètes', () {
      final r = findEquivalents(
        catalog: catalog,
        refManufacturer: refM,
        ref: ref,
        filters: const CompareFilters(
            lumenTolerancePct: 20, includeIncomplete: false),
      );
      expect(r.map((e) => e.product.name), ['Jumeau']);
    });

    test('autres marques uniquement + familles toutes', () {
      final r = findEquivalents(
        catalog: catalog,
        refManufacturer: refM,
        ref: ref,
        filters: const CompareFilters(
            scope: FamilyScope.all, otherBrandsOnly: true),
      );
      expect(r.map((e) => e.product.name).toSet(), {'Wash', 'Inconnu'});
    });

    test('CRI minimum', () {
      final r = findEquivalents(
        catalog: catalog,
        refManufacturer: refM,
        ref: ref,
        filters: const CompareFilters(minCri: 95, includeIncomplete: false),
      );
      expect(r, isEmpty);
    });
  });
}
