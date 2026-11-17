import 'package:flutter_test/flutter_test.dart';
import 'package:mon_app_tech/pages/rigging/engine/rigging_truss_engine.dart';

void main() {
  group('RiggingTrussEngine — 2 hoists (exact statics)', () {
    test('symmetric truss, hoists at the ends', () {
      final r = RiggingTrussEngine.compute(const TrussLoadInput(
        lengthM: 10,
        selfWeightKgPerM: 6,
        motorPositionsM: [0, 10],
        pointLoads: [TrussPointLoad(5, 100)],
        motorWllKg: 500,
      ));
      expect(r.isValid, isTrue);
      expect(r.motors[0].staticKg, closeTo(80, 1e-6)); // (60 + 100) / 2
      expect(r.motors[1].staticKg, closeTo(80, 1e-6));
      // M max = wL²/8 + PL/4 = 75 + 250
      expect(r.maxMomentKgm, closeTo(325, 1e-6));
      expect(r.hasCantilever, isFalse);
      expect(r.isHyperstatic, isFalse);
    });

    test('off-centre point load', () {
      final r = RiggingTrussEngine.compute(const TrussLoadInput(
        lengthM: 8,
        selfWeightKgPerM: 0,
        motorPositionsM: [0, 8],
        pointLoads: [TrussPointLoad(2, 200)],
        motorWllKg: 500,
      ));
      expect(r.motors[0].staticKg, closeTo(150, 1e-6));
      expect(r.motors[1].staticKg, closeTo(50, 1e-6));
    });

    test('cantilever, extra per hoist and dynamic factor', () {
      final r = RiggingTrussEngine.compute(const TrussLoadInput(
        lengthM: 12,
        selfWeightKgPerM: 5, // 60 kg, centre at 6 m
        motorPositionsM: [1, 9],
        pointLoads: [TrussPointLoad(11, 40)],
        extraPerMotorKg: 10,
        dynamicFactor: 1.2,
        motorWllKg: 250,
      ));
      // Moments about A: 60·5 + 40·10 = 700 → RB = 87.5 ; RA = 12.5
      expect(r.motors[0].staticKg, closeTo(22.5, 1e-6));
      expect(r.motors[1].staticKg, closeTo(97.5, 1e-6));
      expect(r.motors[1].designKg, closeTo(117, 1e-6));
      expect(r.motors[1].utilisation, closeTo(117 / 250, 1e-6));
      expect(r.hasCantilever, isTrue);
    });

    test('uplift detected', () {
      final r = RiggingTrussEngine.compute(const TrussLoadInput(
        lengthM: 10,
        selfWeightKgPerM: 0,
        motorPositionsM: [0, 4],
        pointLoads: [TrussPointLoad(10, 100)],
        motorWllKg: 500,
      ));
      expect(r.uplift, isTrue);
      expect(r.motors[0].reactionKg, closeTo(-150, 1e-6));
      expect(r.motors[1].reactionKg, closeTo(250, 1e-6));
    });
  });

  group('RiggingTrussEngine — 3+ hoists (continuous beam)', () {
    test('3 hoists, 2 equal spans, UDL → 3/8, 10/8, 3/8 of wl', () {
      final r = RiggingTrussEngine.compute(const TrussLoadInput(
        lengthM: 10,
        selfWeightKgPerM: 10,
        motorPositionsM: [0, 5, 10],
        motorWllKg: 500,
      ));
      expect(r.isHyperstatic, isTrue);
      expect(r.motors[0].staticKg, closeTo(18.75, 1e-6));
      expect(r.motors[1].staticKg, closeTo(62.5, 1e-6));
      expect(r.motors[2].staticKg, closeTo(18.75, 1e-6));
      // Hogging over the middle hoist: wl²/8 = 10·25/8
      expect(r.maxMomentKgm, closeTo(31.25, 1e-6));
    });

    test('4 hoists, 3 equal spans, UDL → 0.4 / 1.1 / 1.1 / 0.4 wl', () {
      final r = RiggingTrussEngine.compute(const TrussLoadInput(
        lengthM: 12,
        selfWeightKgPerM: 10,
        motorPositionsM: [0, 4, 8, 12],
        motorWllKg: 500,
      ));
      expect(r.motors[0].staticKg, closeTo(16, 1e-6));
      expect(r.motors[1].staticKg, closeTo(44, 1e-6));
      expect(r.motors[2].staticKg, closeTo(44, 1e-6));
      expect(r.motors[3].staticKg, closeTo(16, 1e-6));
    });

    test('3 hoists, point load at mid-span of each span', () {
      final r = RiggingTrussEngine.compute(const TrussLoadInput(
        lengthM: 9,
        selfWeightKgPerM: 0,
        motorPositionsM: [0, 4.5, 9],
        pointLoads: [TrussPointLoad(2.25, 100), TrussPointLoad(6.75, 100)],
        motorWllKg: 500,
      ));
      expect(r.motors[0].staticKg, closeTo(31.25, 1e-6)); // 5P/16
      expect(r.motors[1].staticKg, closeTo(137.5, 1e-6)); // 11P/8
      expect(r.maxMomentKgm, closeTo(84.375, 1e-6)); // 3PL/16
    });

    test('equilibrium always holds', () {
      final r = RiggingTrussEngine.compute(const TrussLoadInput(
        lengthM: 14,
        selfWeightKgPerM: 7,
        extraUdlKgPerM: 1.5,
        motorPositionsM: [0.5, 4, 9.2, 13],
        pointLoads: [
          TrussPointLoad(0, 30),
          TrussPointLoad(3.3, 45),
          TrussPointLoad(7.1, 120),
          TrussPointLoad(14, 22),
        ],
        motorWllKg: 1000,
      ));
      final sum = r.motors.fold<double>(0, (s, m) => s + m.reactionKg);
      expect(sum, closeTo(8.5 * 14 + 30 + 45 + 120 + 22, 1e-6));
    });
  });

  group('RiggingTrussEngine — truss check & validation', () {
    test('UDL table value: utilisation = M max / (q·L²/8)', () {
      final r = RiggingTrussEngine.compute(const TrussLoadInput(
        lengthM: 10,
        selfWeightKgPerM: 6,
        motorPositionsM: [0, 10],
        pointLoads: [TrussPointLoad(5, 100)],
        motorWllKg: 500,
        allowableType: TrussAllowableType.udl,
        allowableValue: 52, // M allow = 52·100/8 = 650
      ));
      expect(r.trussUtilisation, closeTo(0.5, 1e-6));
    });

    test('CPL table value: utilisation = M max / (P·L/4)', () {
      final r = RiggingTrussEngine.compute(const TrussLoadInput(
        lengthM: 10,
        selfWeightKgPerM: 6,
        motorPositionsM: [0, 10],
        pointLoads: [TrussPointLoad(5, 100)],
        motorWllKg: 500,
        allowableType: TrussAllowableType.cpl,
        allowableValue: 260, // M allow = 650
      ));
      expect(r.trussUtilisation, closeTo(0.5, 1e-6));
    });

    test('invalid inputs', () {
      expect(
        RiggingTrussEngine.compute(const TrussLoadInput(
          lengthM: 10,
          selfWeightKgPerM: 5,
          motorPositionsM: [6, 4],
          motorWllKg: 500,
        )).error,
        TrussInputError.motorOrder,
      );
      expect(
        RiggingTrussEngine.compute(const TrussLoadInput(
          lengthM: 10,
          selfWeightKgPerM: 5,
          motorPositionsM: [0, 12],
          motorWllKg: 500,
        )).error,
        TrussInputError.motorOutside,
      );
      expect(
        RiggingTrussEngine.compute(const TrussLoadInput(
          lengthM: 10,
          selfWeightKgPerM: 5,
          motorPositionsM: [0, 10],
          dynamicFactor: 0.9,
          motorWllKg: 500,
        )).error,
        TrussInputError.dynamicFactor,
      );
    });
  });
}
