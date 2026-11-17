import 'package:flutter_test/flutter_test.dart';
import 'package:mon_app_tech/pages/rigging/engine/hoist_library.dart';
import 'package:mon_app_tech/pages/rigging/engine/hoist_library_data.dart';
import 'package:mon_app_tech/pages/rigging/engine/rigging_truss_engine.dart';
import 'package:mon_app_tech/pages/rigging/engine/truss_library.dart';
import 'package:mon_app_tech/pages/rigging/engine/truss_library_data.dart';

void main() {
  group('TrussLibrary data', () {
    test('ids are unique and rows are sorted by span', () {
      final ids = <String>{};
      for (final m in kTrussLibrary) {
        expect(ids.add(m.id), isTrue, reason: 'duplicate id ${m.id}');
        expect(m.rows, isNotEmpty);
        for (var k = 1; k < m.rows.length; k++) {
          expect(m.rows[k].spanM, greaterThan(m.rows[k - 1].spanM));
        }
      }
    });

    test('allowable loads never increase with span', () {
      for (final m in kTrussLibrary) {
        for (var k = 1; k < m.rows.length; k++) {
          expect(m.rows[k].udlKgPerM, lessThanOrEqualTo(m.rows[k - 1].udlKgPerM),
              reason: '${m.id} UDL at ${m.rows[k].spanM} m');
          expect(m.rows[k].cplKg, lessThanOrEqualTo(m.rows[k - 1].cplKg),
              reason: '${m.id} CPL at ${m.rows[k].spanM} m');
        }
      }
    });

    test('release builds hide unvalidated models', () {
      final shipped = TrussLibrary.available(includeUnvalidated: false);
      expect(shipped.every((m) => m.validated), isTrue);
    });
  });

  group('TrussModel lookup', () {
    final h30v = TrussLibrary.byId('PRO-H30V')!;

    test('exact span', () {
      expect(h30v.allowableFor(8, TrussAllowableType.udl), 194.4);
      expect(h30v.allowableFor(8, TrussAllowableType.cpl), 700.6);
    });

    test('between spans uses the next longer span (safe side)', () {
      expect(h30v.rowFor(8.4)!.spanM, 9);
      expect(h30v.allowableFor(8.4, TrussAllowableType.udl), 152.4);
    });

    test('below the table uses the first row, beyond returns null', () {
      expect(h30v.rowFor(2)!.spanM, 3);
      expect(h30v.allowableFor(25, TrussAllowableType.udl), isNull);
    });
  });

  group('Engine — values net of self-weight', () {
    test('self-weight moment is added back to the allowable moment', () {
      // M max = 6·10²/8 + 100·10/4 = 325 kg·m.
      // Net UDL 46 kg/m: M allow = 46·100/8 + 6·100/8 = 650 → 50 %.
      final r = RiggingTrussEngine.compute(const TrussLoadInput(
        lengthM: 10,
        selfWeightKgPerM: 6,
        motorPositionsM: [0, 10],
        pointLoads: [TrussPointLoad(5, 100)],
        motorWllKg: 500,
        allowableType: TrussAllowableType.udl,
        allowableValue: 46,
        allowableIsNetOfSelfWeight: true,
      ));
      expect(r.trussUtilisation, closeTo(0.5, 1e-6));
    });
  });

  group('Self-weight flag', () {
    test('Eurotruss tables are treated as gross (safety choice)', () {
      for (final id in ['EUR-FD33', 'EUR-HD33', 'EUR-FD34', 'EUR-HD34', 'EUR-XD', 'EUR-ST']) {
        expect(TrussLibrary.byId(id)!.allowableIsNetOfSelfWeight, isFalse,
            reason: id);
      }
      expect(TrussLibrary.byId('EUR-PRT')!.allowableIsNetOfSelfWeight, isTrue);
      expect(TrussLibrary.byId('PRO-H30V')!.allowableIsNetOfSelfWeight, isTrue);
    });

    test('gross values: self-weight moment is not added back', () {
      // Same case as above, but the 46 kg/m table value is gross:
      // M allow = 46·100/8 = 575 → 325 / 575.
      final r = RiggingTrussEngine.compute(const TrussLoadInput(
        lengthM: 10,
        selfWeightKgPerM: 6,
        motorPositionsM: [0, 10],
        pointLoads: [TrussPointLoad(5, 100)],
        motorWllKg: 500,
        allowableType: TrussAllowableType.udl,
        allowableValue: 46,
        allowableIsNetOfSelfWeight: false,
      ));
      expect(r.trussUtilisation, closeTo(325 / 575, 1e-6));
    });
  });

  group('HoistLibrary data', () {
    test('ids are unique and values are positive', () {
      final ids = <String>{};
      for (final h in kHoistLibrary) {
        expect(ids.add(h.id), isTrue, reason: 'duplicate id ${h.id}');
        expect(h.wllKg, greaterThan(0));
        if (h.weightKg != null) expect(h.weightKg!, greaterThan(0));
        if (h.chainKgPerM != null) expect(h.chainKgPerM!, greaterThan(0));
      }
    });

    test('release builds hide unvalidated hoists', () {
      final shipped = HoistLibrary.available(includeUnvalidated: false);
      expect(shipped.every((h) => h.validated), isTrue);
    });
  });
}
