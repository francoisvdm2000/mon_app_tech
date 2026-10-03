import 'dart:io';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mon_app_tech/pages/console/ma3_params/ma3_param_engine.dart';

/// GDTF synthétique : barre 4 cellules RGB (GeometryReference) + dimmer
/// global + dimmer virtuel, et un 2e mode avec Pan/Tilt 16 bits.
const _bar4Xml = '''<?xml version="1.0" encoding="UTF-8"?>
<GDTF DataVersion="1.2">
  <FixtureType Manufacturer="Test" Name="Bar4" LongName="Bar4">
    <Geometries>
      <Geometry Name="Base">
        <GeometryReference Name="Cell1" Geometry="Cell"><Break DMXBreak="1" DMXOffset="2"/></GeometryReference>
        <GeometryReference Name="Cell2" Geometry="Cell"><Break DMXBreak="1" DMXOffset="5"/></GeometryReference>
        <GeometryReference Name="Cell3" Geometry="Cell"><Break DMXBreak="1" DMXOffset="8"/></GeometryReference>
        <GeometryReference Name="Cell4" Geometry="Cell"><Break DMXBreak="1" DMXOffset="11"/></GeometryReference>
      </Geometry>
      <Geometry Name="Cell"/>
    </Geometries>
    <DMXModes>
      <DMXMode Name="Mode 13ch" Geometry="Base">
        <DMXChannels>
          <DMXChannel DMXBreak="1" Offset="1" Geometry="Base"><LogicalChannel Attribute="Dimmer"/></DMXChannel>
          <DMXChannel DMXBreak="1" Offset="1" Geometry="Cell"><LogicalChannel Attribute="ColorAdd_R"/></DMXChannel>
          <DMXChannel DMXBreak="1" Offset="2" Geometry="Cell"><LogicalChannel Attribute="ColorAdd_G"/></DMXChannel>
          <DMXChannel DMXBreak="1" Offset="3" Geometry="Cell"><LogicalChannel Attribute="ColorAdd_B"/></DMXChannel>
          <DMXChannel DMXBreak="1" Offset="None" Geometry="Base"><LogicalChannel Attribute="Dimmer"/></DMXChannel>
        </DMXChannels>
      </DMXMode>
      <DMXMode Name="Mode 16bit 10ch" Geometry="Base">
        <DMXChannels>
          <DMXChannel DMXBreak="1" Offset="1,2" Geometry="Base"><LogicalChannel Attribute="Pan"/></DMXChannel>
          <DMXChannel DMXBreak="1" Offset="3,4" Geometry="Base"><LogicalChannel Attribute="Tilt"/></DMXChannel>
          <DMXChannel DMXBreak="1" Offset="6" Geometry="Base"></DMXChannel>
        </DMXChannels>
      </DMXMode>
    </DMXModes>
  </FixtureType>
</GDTF>''';

Uint8List _zip(Map<String, List<int>> files) {
  final a = Archive();
  files.forEach((name, data) => a.addFile(ArchiveFile.bytes(name, data)));
  return ZipEncoder().encodeBytes(a);
}

Uint8List _bar4Gdtf() =>
    _zip({'description.xml': _bar4Xml.codeUnits});

void main() {
  group('Ma3GdtfAnalyzer', () {
    test('déplie les GeometryReference et ignore les canaux virtuels', () {
      final a = Ma3GdtfAnalyzer(_bar4Gdtf()).analyze('Mode 13ch');
      expect(a.params, 13); // 1 dimmer + 4 × RGB
      expect(a.footprint, 13);
      expect(a.virtualChannels, 1);
      expect(a.instances, 4);
      expect(a.issues, isEmpty);
    });

    test('16 bits = 1 paramètre, trous et canaux vides signalés', () {
      final a = Ma3GdtfAnalyzer(_bar4Gdtf()).analyze('Mode 16bit 10ch');
      expect(a.params, 3);
      expect(a.footprint, 6);
      final kinds = a.issues.map((i) => i.kind).toSet();
      expect(kinds, contains(Ma3IssueKind.offsetGaps)); // adresse 5 vide
      expect(kinds, contains(Ma3IssueKind.channelsWithoutFunction));
      expect(kinds, contains(Ma3IssueKind.modeNameMismatch)); // 10ch ≠ 6
    });

    test('mode introuvable → erreur, params inconnus', () {
      final a = Ma3GdtfAnalyzer(_bar4Gdtf()).analyze('Mode inexistant');
      expect(a.params, isNull);
      expect(a.issues.single.kind, Ma3IssueKind.modeNotFound);
    });

    test('GDTF réel du projet (GLP burst) si présent', () {
      final f = File('glp@burst@ShowTechTools_fixed.gdtf');
      if (!f.existsSync()) {
        return;
      }
      final a = Ma3GdtfAnalyzer(f.readAsBytesSync())
          .analyze('Mode 10 - Legacy Spix Pro 62ch');
      expect(a.params, 61); // 62 canaux dont 1 fine
      expect(a.footprint, 62);
    });
  });

  group('recommendMa3', () {
    test('la console suffit', () {
      final r = recommendMa3(
          system: Ma3System.light, rawParams: 10000, marginRatio: 0);
      expect(r.baseIsEnough, isTrue);
      expect(r.capacity, 16384);
    });

    test('light + PU M', () {
      final r = recommendMa3(
          system: Ma3System.light, rawParams: 20000, marginRatio: 0);
      expect(r.processingUnits, [Ma3ProcessingUnit.m]);
      expect(r.capacity, 20480);
    });

    test('full-size + XL + L avec 10 % de marge', () {
      final r = recommendMa3(
          system: Ma3System.fullSize, rawParams: 40000, marginRatio: 0.10);
      expect(r.neededParams, 44000);
      expect(r.processingUnits, [Ma3ProcessingUnit.xl, Ma3ProcessingUnit.l]);
      expect(r.processingUnitsLabel, '1 × PU XL + 1 × PU L');
      expect(r.xlOnlyCount, 2);
    });

    test('onPC dépassé', () {
      final r =
          recommendMa3(system: Ma3System.onPc, rawParams: 5000, marginRatio: 0);
      expect(r.exceedsOnPc, isTrue);
    });
  });

  test('parseMvrForMa3 : regroupe, compte et signale le GDTF absent', () {
    const scene = '''<?xml version="1.0" encoding="UTF-8"?>
<GeneralSceneDescription verMajor="1" verMinor="6">
  <Scene><Layers><Layer name="L"><ChildList>
    <Fixture name="A" uuid="1"><GDTFSpec>Test@Bar4.gdtf</GDTFSpec><GDTFMode>Mode 13ch</GDTFMode><Addresses><Address break="0">1</Address></Addresses></Fixture>
    <Fixture name="B" uuid="2"><GDTFSpec>Test@Bar4.gdtf</GDTFSpec><GDTFMode>Mode 13ch</GDTFMode><Addresses><Address break="0">14</Address></Addresses></Fixture>
    <Fixture name="C" uuid="3"><GDTFSpec>Test@Bar4.gdtf</GDTFSpec><GDTFMode>Mode 13ch</GDTFMode></Fixture>
    <Fixture name="D" uuid="4"><GDTFSpec>Absent@Spot.gdtf</GDTFSpec><GDTFMode>Std</GDTFMode><Addresses><Address break="0">40</Address></Addresses></Fixture>
  </ChildList></Layer></Layers></Scene>
</GeneralSceneDescription>''';
    final mvr = _zip({
      'GeneralSceneDescription.xml': scene.codeUnits,
      'Test@Bar4.gdtf': _bar4Gdtf(),
    });
    final r = parseMvrForMa3(mvr);
    expect(r.error, isNull);
    expect(r.fixtureCount, 4);
    expect(r.unpatchedCount, 1);
    expect(r.lines.length, 2);
    final totals = Ma3Totals.of(r.lines);
    expect(totals.params, 39); // 3 × 13, le spot absent n'est pas compté
    expect(totals.unknownFixtures, 1);
    expect(r.lines.first.issues.single.kind, Ma3IssueKind.gdtfMissing);
  });
}
