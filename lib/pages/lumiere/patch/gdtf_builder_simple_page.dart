// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:xml/xml.dart';

import '../../../app/ui/widgets.dart';
import '../../../l10n_gen/app_localizations.dart';
import '../../about/about_favorites.dart';
import 'gdtf_manual_wizard_page.dart';
import 'package:mon_app_tech/app/constants.dart';

const String _kWorkerUrl =
    'https://showtech-gdtf.francois-vandermeeren.workers.dev';

// ─────────────────────────────────────────────────────────────────────────────
// MODELS
// ─────────────────────────────────────────────────────────────────────────────

class GdtfFixture {
  const GdtfFixture({
    required this.rid,
    required this.fixture,
    required this.manufacturer,
    required this.revision,
    required this.rating,
    required this.uploader,
    required this.version,
    required this.filesize,
    required this.modes,
    required this.lastModified,
  });
  final int rid;
  final String fixture, manufacturer, revision, uploader, version, lastModified;
  final double rating;
  final int filesize;
  final List<GdtfMode> modes;

  factory GdtfFixture.fromJson(Map<String, dynamic> json) => GdtfFixture(
        rid: int.tryParse(json['rid']?.toString() ?? '') ?? (json['rid'] as num?)?.toInt() ?? 0,
        fixture: (json['fixture'] ?? '').toString(),
        manufacturer: (json['manufacturer'] ?? '').toString(),
        revision: (json['revision'] ?? '').toString(),
        rating: double.tryParse(json['rating']?.toString() ?? '') ?? 0.0,
        uploader: (json['uploader'] ?? '').toString(),
        version: (json['version'] ?? '').toString(),
        filesize: int.tryParse(json['filesize']?.toString() ?? '') ?? (json['filesize'] as num?)?.toInt() ?? 0,
        lastModified: (json['lastModified'] ?? '').toString(),
        modes: ((json['modes'] as List<dynamic>?) ?? [])
            .map((m) => GdtfMode.fromJson(m as Map<String, dynamic>))
            .toList(),
      );

  String get filesizeLabel {
    if (filesize < 1024) {
      return '$filesize B';
    }
    if (filesize < 1024 * 1024) {
      return '${(filesize / 1024).toStringAsFixed(0)} KB';
    }
    return '${(filesize / 1024 / 1024).toStringAsFixed(1)} MB';
  }
}

class GdtfMode {
  const GdtfMode({required this.name, required this.dmxFootprint});
  final String name;
  final int dmxFootprint;
  factory GdtfMode.fromJson(Map<String, dynamic> json) => GdtfMode(
        name: json['name'] as String? ?? '',
        dmxFootprint: (json['dmxfootprint'] as num?)?.toInt() ?? 0,
      );
}

class DmxChannel {
  DmxChannel({
    required this.number,
    required this.name,
    required this.function,
    this.resolution = '8bit',
    this.isExpanded = false,
    this.defaultValue = 0,
  });
  int number;
  String name;
  String function;
  String resolution;
  bool isExpanded;
  int defaultValue;
}

class DmxMode {
  DmxMode({required this.name, required this.channels});
  String name;
  List<DmxChannel> channels;
}

class _ChannelSet {
  const _ChannelSet({required this.from, required this.to, required this.name});

  final int from;
  final int to;
  final String name;
}

// Tuple : un canal master pré-résolu avec sa géométrie cible.
class _ResolvedMaster {
  const _ResolvedMaster({
    required this.channel,
    required this.geometry,
    required this.offset,
    this.attributeOverride,
  });
  final _ExportChannel channel;
  final String geometry; // nom de géométrie déjà préfixé/résolu
  final String offset;
  // Si non null, remplace l'Attribute du canal (utilisé en multi-pixel pour
  // rotater Control1 → Control2 → Control3 quand plusieurs canaux génériques
  // tombent sur la même géométrie — évite les sub-geometries dans la patch).
  final String? attributeOverride;
}

// Trace d'un <DMXChannel> réellement écrit dans un mode — capturée pendant
// _writeOneDmxChannel et réutilisée juste après pour construire <Relations>.
// Évite de recalculer (et risquer de désynchroniser) la résolution géométrie/
// attribut/nom de fonction déjà faite au moment de l'écriture.
class _WrittenChannel {
  const _WrittenChannel({
    required this.geometry,
    required this.attribute,
    required this.functionName,
    required this.isVirtualDimmer,
  });
  final String geometry;
  final String attribute;
  final String functionName;
  final bool isVirtualDimmer;
}

// Résultat de l'analyse d'un mode : a-t-il des instances répétables (multi-pixel) ?
// Si oui, on peut générer un GDTF idiomatique avec GeometryReference + Break.
// Si non, on garde la structure plate historique (Base/Yoke/Head/Beam).
class _ModeAnalysis {
  _ModeAnalysis({
    required this.mode,
    required this.exportChannels,
    required this.isMultiPixel,
    required this.instanceNumbers,
    required this.breakOffsetForInstance,
    required this.moduleTemplate,
    required this.masterChannels,
    required this.masterResolved,
    required this.extraSubGeometries,
    required this.moduleAttributes,
  });

  final DmxMode mode;
  final List<_ExportChannel> exportChannels;
  final bool isMultiPixel;
  // Numéros d'instance triés croissant (ex: [1, 2, 3] pour le X4 Bar Normal).
  final List<int> instanceNumbers;
  // DMX absolu où démarre chaque instance (basé sur le min des offsets des
  // canaux per-pixel de cette instance dans la table DMX globale).
  final Map<int, int> breakOffsetForInstance;
  // Template du module pixel : un _ExportChannel par canal du pixel, dans
  // l'ordre relatif (ex: pour X4 Bar [R, G, B, W, Dimmer]).
  final List<_ExportChannel> moduleTemplate;
  // Liste des attributs GDTF du module (mémorise l'ordre relatif).
  final List<String> moduleAttributes;
  // Canaux master bruts (utilisé pour le mode flat).
  final List<_ExportChannel> masterChannels;
  // Canaux master pré-résolus avec leur géométrie cible définitive (pour
  // multi-pixel ET flat). Évite que `_writeOneDmxChannel` reproduise la
  // logique de comptage et garantit la cohérence avec extraSubGeometries.
  final List<_ResolvedMaster> masterResolved;
  // Sous-géométries supplémentaires à émettre dans la section Geometries
  // (pour les canaux Control1 multiples qui se partageraient sinon une
  // même LogicalChannel — pattern Base_Control1_2/_3/…).
  final List<String> extraSubGeometries;

  // Préfixe unique tiré du nom du mode (ex: "Normal_Mode_34ch_").
  // Sert à rendre Base/Yoke/Head/Beam uniques par mode et éviter les
  // collisions de noms dans le GDTF — un DMXChannel.Geometry="Base" sans
  // préfixe est ambigu quand on a plusieurs modes.
  String get _geometryPrefix {
    final raw = mode.name.replaceAll(RegExp(r'[^A-Za-z0-9]+'), '_');
    final trimmed = raw.replaceAll(RegExp(r'^_+|_+$'), '');
    return trimmed.isEmpty ? 'Mode' : trimmed;
  }

  String get baseGeometryName => '${_geometryPrefix}_Base';
  String get yokeGeometryName => '${_geometryPrefix}_Yoke';
  String get headGeometryName => '${_geometryPrefix}_Head';
  String get beamGeometryName => '${_geometryPrefix}_Beam';
}

// Un mode tel que retourné par le Worker en phase "discover".
// Sert à l'écran de sélection des modes par l'utilisateur.
class _DiscoveredMode {
  const _DiscoveredMode({required this.name, required this.channels});
  final String name;
  final int channels;

  factory _DiscoveredMode.fromJson(Map<String, dynamic> json) =>
      _DiscoveredMode(
        name: (json['name'] ?? '').toString(),
        channels: (json['channels'] as num?)?.toInt() ?? 0,
      );

  Map<String, dynamic> toJson() => {'name': name, 'channels': channels};
}

class _ExportChannel {
  _ExportChannel({
    required this.source,
    required this.offset,
    required this.is16Bit,
    this.isVirtualDimmer = false,
  });

  final DmxChannel source;
  String offset;
  bool is16Bit;
  // Si true : canal Dimmer "virtuel" — pas d'adresse DMX physique (Offset="None"),
  // valeur par défaut 100%. Sert aux fixtures RGB(W…) sans master dim pour que la
  // console puisse moduler globalement l'intensité des LEDs additives.
  final bool isVirtualDimmer;
}

// ─────────────────────────────────────────────────────────────────────────────
// CONSTANTES — tokens couleurs et mots-clés d'instance pour le parseur de noms
// de canaux. Sont au niveau top-level pour rester `const` et partageables.
// Toutes les chaînes sont en minuscules, sans espaces ni ponctuation
// (puisqu'on les compare au résultat de `_compact()`).
// ─────────────────────────────────────────────────────────────────────────────

// ─────────────────────────────────────────────────────────────────────────────
// TABLE DES ATTRIBUTS GDTF STANDARDS
// ─────────────────────────────────────────────────────────────────────────────
// Définit tous les attributs GDTF qu'on veut émettre dans AttributeDefinitions.
// Format : (Name, Feature, ActivationGroup, PhysicalUnit, MainAttribute, Pretty)
//   - ActivationGroup, MainAttribute : null si pas applicable
//   - Source : spec GDTF officielle + références X4 Bar / Spiider + tableau MA3
// On émet TOUT pour que toute fixture puisse utiliser n'importe quel attribut
// sans ajout manuel. Le coût en taille XML est négligeable (~10-15 KB).
class _GdtfAttribute {
  const _GdtfAttribute(this.name, this.feature, this.physicalUnit,
      {this.activationGroup, this.mainAttribute, this.pretty});
  final String name;
  final String feature;
  final String
      physicalUnit; // None / Angle / AngularSpeed / Frequency / Length / ColorComponent / Temperature / Time / Percent / Speed
  final String? activationGroup;
  final String? mainAttribute;
  final String? pretty;
}

const List<_GdtfAttribute> _kGdtfAttributes = <_GdtfAttribute>[
  // ─── Dimmer ──────────────────────────────────────────────────────────────
  _GdtfAttribute('Dimmer', 'Dimmer.Dimmer', 'None', pretty: 'Dim'),

  // ─── Position : Pan / Tilt ───────────────────────────────────────────────
  _GdtfAttribute('Pan', 'Position.PanTilt', 'Angle',
      activationGroup: 'PanTilt', pretty: 'P'),
  _GdtfAttribute('Tilt', 'Position.PanTilt', 'Angle',
      activationGroup: 'PanTilt', pretty: 'T'),
  _GdtfAttribute('PanRotate', 'Position.PanTilt', 'AngularSpeed',
      pretty: 'P Rotate'),
  _GdtfAttribute('TiltRotate', 'Position.PanTilt', 'AngularSpeed',
      pretty: 'T Rotate'),
  _GdtfAttribute('PanTiltDistance', 'Position.PanTilt', 'Length',
      pretty: 'Dist'),
  _GdtfAttribute('PositionEffect', 'Position.PanTilt', 'None',
      pretty: 'Pos FX'),
  _GdtfAttribute('PositionEffectRate', 'Position.PanTilt', 'None',
      pretty: 'Pos FX Rate'),
  _GdtfAttribute('PositionEffectFade', 'Position.PanTilt', 'None',
      pretty: 'Pos FX Fade'),
  // Position XYZ (rare)
  _GdtfAttribute('XYZ_X', 'Position.XYZ', 'Length',
      activationGroup: 'XYZ', pretty: 'X'),
  _GdtfAttribute('XYZ_Y', 'Position.XYZ', 'Length',
      activationGroup: 'XYZ', pretty: 'Y'),
  _GdtfAttribute('XYZ_Z', 'Position.XYZ', 'Length',
      activationGroup: 'XYZ', pretty: 'Z'),
  _GdtfAttribute('Rot_X', 'Position.Rotation', 'Angle',
      activationGroup: 'XYZ_Rot', pretty: 'Rot X'),
  _GdtfAttribute('Rot_Y', 'Position.Rotation', 'Angle',
      activationGroup: 'XYZ_Rot', pretty: 'Rot Y'),
  _GdtfAttribute('Rot_Z', 'Position.Rotation', 'Angle',
      activationGroup: 'XYZ_Rot', pretty: 'Rot Z'),

  // ─── Color : RGB / additive ──────────────────────────────────────────────
  _GdtfAttribute('ColorAdd_R', 'Color.RGB', 'ColorComponent',
      activationGroup: 'ColorRGB', pretty: 'R'),
  _GdtfAttribute('ColorAdd_G', 'Color.RGB', 'ColorComponent',
      activationGroup: 'ColorRGB', pretty: 'G'),
  _GdtfAttribute('ColorAdd_B', 'Color.RGB', 'ColorComponent',
      activationGroup: 'ColorRGB', pretty: 'B'),
  _GdtfAttribute('ColorAdd_W', 'Color.RGB', 'ColorComponent',
      activationGroup: 'ColorRGB', pretty: 'W'),
  _GdtfAttribute('ColorAdd_A', 'Color.RGB', 'ColorComponent',
      activationGroup: 'ColorRGB', pretty: 'A'),
  _GdtfAttribute('ColorAdd_UV', 'Color.RGB', 'ColorComponent',
      activationGroup: 'ColorRGB', pretty: 'UV'),
  _GdtfAttribute('ColorAdd_C', 'Color.RGB', 'ColorComponent',
      activationGroup: 'ColorRGB', pretty: 'C'),
  _GdtfAttribute('ColorAdd_M', 'Color.RGB', 'ColorComponent',
      activationGroup: 'ColorRGB', pretty: 'M'),
  _GdtfAttribute('ColorAdd_Y', 'Color.RGB', 'ColorComponent',
      activationGroup: 'ColorRGB', pretty: 'Y'),
  _GdtfAttribute('ColorAdd_Lime', 'Color.RGB', 'ColorComponent',
      activationGroup: 'ColorRGB', pretty: 'Lime'),
  _GdtfAttribute('ColorAdd_Mint', 'Color.RGB', 'ColorComponent',
      activationGroup: 'ColorRGB', pretty: 'Mint'),
  _GdtfAttribute('ColorAdd_RB', 'Color.RGB', 'ColorComponent',
      activationGroup: 'ColorRGB', pretty: 'RB'),
  _GdtfAttribute('ColorAdd_WW', 'Color.RGB', 'ColorComponent',
      activationGroup: 'ColorRGB', pretty: 'WW'),
  _GdtfAttribute('ColorAdd_CW', 'Color.RGB', 'ColorComponent',
      activationGroup: 'ColorRGB', pretty: 'CW'),
  // Color subtractive (CMY systems)
  _GdtfAttribute('ColorSub_C', 'Color.RGB', 'ColorComponent', pretty: 'C-'),
  _GdtfAttribute('ColorSub_M', 'Color.RGB', 'ColorComponent', pretty: 'M-'),
  _GdtfAttribute('ColorSub_Y', 'Color.RGB', 'ColorComponent', pretty: 'Y-'),
  _GdtfAttribute('ColorMacro1', 'Color.Color', 'None', pretty: 'Color Macro 1'),
  _GdtfAttribute('ColorMacro2', 'Color.Color', 'None', pretty: 'Color Macro 2'),

  // ─── Color : wheels indirect ─────────────────────────────────────────────
  _GdtfAttribute('Color1', 'Color.Color', 'None',
      activationGroup: 'ColorIndirect', pretty: 'C1'),
  _GdtfAttribute('Color1WheelIndex', 'Color.Color', 'Angle',
      activationGroup: 'ColorIndirect', pretty: 'C1 Index'),
  _GdtfAttribute('Color1WheelSpin', 'Color.Color', 'AngularSpeed',
      activationGroup: 'ColorIndirect', pretty: 'C1 Spin'),
  _GdtfAttribute('Color1WheelRandom', 'Color.Color', 'Frequency',
      pretty: 'C1 Random'),
  _GdtfAttribute('Color2', 'Color.Color', 'None', pretty: 'C2'),
  _GdtfAttribute('Color2WheelIndex', 'Color.Color', 'Angle',
      pretty: 'C2 Index'),
  _GdtfAttribute('Color3', 'Color.Color', 'None', pretty: 'C3'),
  _GdtfAttribute('Color4', 'Color.Color', 'None', pretty: 'C4'),

  // ─── Color : temperature / tint ──────────────────────────────────────────
  _GdtfAttribute('CTO', 'Color.Color', 'Temperature', pretty: 'CTO'),
  _GdtfAttribute('CTC', 'Color.Color', 'Temperature', pretty: 'CTC'),
  _GdtfAttribute('CTB', 'Color.Color', 'Temperature', pretty: 'CTB'),
  _GdtfAttribute('Tint', 'Color.Color', 'None', pretty: 'Tint'),

  // ─── Color : HSB ─────────────────────────────────────────────────────────
  _GdtfAttribute('HSB_Hue', 'Color.HSB', 'Angle',
      activationGroup: 'HSB', pretty: 'H'),
  _GdtfAttribute('HSB_Saturation', 'Color.HSB', 'Percent',
      activationGroup: 'HSB', pretty: 'S'),
  _GdtfAttribute('HSB_Brightness', 'Color.HSB', 'Percent',
      activationGroup: 'HSB', pretty: 'B'),
  _GdtfAttribute('HSB_Quality', 'Color.HSB', 'Percent', pretty: 'Q'),

  // ─── Gobo : wheel 1 ──────────────────────────────────────────────────────
  _GdtfAttribute('Gobo1', 'Gobo.Gobo', 'None',
      activationGroup: 'Gobo1', pretty: 'G1'),
  _GdtfAttribute('Gobo1SelectSpin', 'Gobo.Gobo', 'AngularSpeed',
      pretty: 'G1 Select Spin'),
  _GdtfAttribute('Gobo1SelectShake', 'Gobo.Gobo', 'Frequency',
      pretty: 'G1 Select Shake'),
  _GdtfAttribute('Gobo1SelectEffects', 'Gobo.Gobo', 'None',
      pretty: 'G1 Select Effects'),
  _GdtfAttribute('Gobo1WheelIndex', 'Gobo.Gobo', 'Angle',
      activationGroup: 'Gobo1', pretty: 'G1 Index'),
  _GdtfAttribute('Gobo1WheelSpin', 'Gobo.Gobo', 'AngularSpeed',
      activationGroup: 'Gobo1', pretty: 'G1 Spin'),
  _GdtfAttribute('Gobo1WheelShake', 'Gobo.Gobo', 'Frequency',
      pretty: 'G1 Shake'),
  _GdtfAttribute('Gobo1WheelRandom', 'Gobo.Gobo', 'Frequency',
      pretty: 'G1 Random'),
  _GdtfAttribute('Gobo1WheelAudio', 'Gobo.Gobo', 'None', pretty: 'G1 Audio'),
  _GdtfAttribute('Gobo1Pos', 'Gobo.Gobo', 'Angle',
      activationGroup: 'Gobo1', pretty: 'G1 Pos'),
  _GdtfAttribute('Gobo1PosRotate', 'Gobo.Gobo', 'AngularSpeed',
      activationGroup: 'Gobo1', pretty: 'G1 Rotate'),
  _GdtfAttribute('Gobo1PosShake', 'Gobo.Gobo', 'Frequency',
      pretty: 'G1 Pos Shake'),
  // Gobo : wheel 2
  _GdtfAttribute('Gobo2', 'Gobo.Gobo', 'None',
      activationGroup: 'Gobo2', pretty: 'G2'),
  _GdtfAttribute('Gobo2WheelIndex', 'Gobo.Gobo', 'Angle',
      activationGroup: 'Gobo2', pretty: 'G2 Index'),
  _GdtfAttribute('Gobo2WheelSpin', 'Gobo.Gobo', 'AngularSpeed',
      activationGroup: 'Gobo2', pretty: 'G2 Spin'),
  _GdtfAttribute('Gobo2WheelShake', 'Gobo.Gobo', 'Frequency',
      pretty: 'G2 Shake'),
  _GdtfAttribute('Gobo2Pos', 'Gobo.Gobo', 'Angle',
      activationGroup: 'Gobo2', pretty: 'G2 Pos'),
  _GdtfAttribute('Gobo2PosRotate', 'Gobo.Gobo', 'AngularSpeed',
      pretty: 'G2 Rotate'),
  // Gobo : wheel 3
  _GdtfAttribute('Gobo3', 'Gobo.Gobo', 'None', pretty: 'G3'),
  _GdtfAttribute('Gobo3WheelIndex', 'Gobo.Gobo', 'Angle', pretty: 'G3 Index'),
  _GdtfAttribute('Gobo3WheelSpin', 'Gobo.Gobo', 'AngularSpeed',
      pretty: 'G3 Spin'),
  _GdtfAttribute('Gobo3Pos', 'Gobo.Gobo', 'Angle', pretty: 'G3 Pos'),
  _GdtfAttribute('Gobo3PosRotate', 'Gobo.Gobo', 'AngularSpeed',
      pretty: 'G3 Rotate'),

  // ─── Gobo : Animation wheels (rotating effect wheels) ────────────────────
  _GdtfAttribute('AnimationWheel1', 'Gobo.Gobo', 'None',
      activationGroup: 'AnimationWheel1', pretty: 'Anim1'),
  _GdtfAttribute('AnimationWheel1Pos', 'Gobo.Gobo', 'Angle',
      activationGroup: 'AnimationWheel1', pretty: 'Anim1 Pos'),
  _GdtfAttribute('AnimationWheel1PosRotate', 'Gobo.Gobo', 'AngularSpeed',
      activationGroup: 'AnimationWheel1', pretty: 'Anim1 Rotate'),
  _GdtfAttribute('AnimationWheel2', 'Gobo.Gobo', 'None',
      activationGroup: 'AnimationWheel2', pretty: 'Anim2'),
  _GdtfAttribute('AnimationWheel2Pos', 'Gobo.Gobo', 'Angle',
      activationGroup: 'AnimationWheel2', pretty: 'Anim2 Pos'),
  _GdtfAttribute('AnimationWheel3', 'Gobo.Gobo', 'None', pretty: 'Anim3'),
  _GdtfAttribute('AnimationSystem1', 'Gobo.Gobo', 'Percent',
      pretty: 'Anim Sys 1'),

  // ─── Beam : Shutter & Strobe ─────────────────────────────────────────────
  _GdtfAttribute('Shutter1', 'Beam.Beam', 'None',
      activationGroup: 'Shutter1', pretty: 'Sh1'),
  _GdtfAttribute('Shutter1Strobe', 'Beam.Beam', 'Frequency',
      activationGroup: 'Shutter1',
      mainAttribute: 'Shutter1',
      pretty: 'Strobe1'),
  _GdtfAttribute('Shutter1StrobePulse', 'Beam.Beam', 'Frequency',
      mainAttribute: 'Shutter1', pretty: 'Pulse1'),
  _GdtfAttribute('Shutter1StrobePulseClose', 'Beam.Beam', 'Frequency',
      mainAttribute: 'Shutter1', pretty: 'Pulse Close1'),
  _GdtfAttribute('Shutter1StrobePulseOpen', 'Beam.Beam', 'Frequency',
      mainAttribute: 'Shutter1', pretty: 'Pulse Open1'),
  _GdtfAttribute('Shutter1StrobeRandom', 'Beam.Beam', 'Frequency',
      mainAttribute: 'Shutter1', pretty: 'Random1'),
  _GdtfAttribute('Shutter1StrobeRandomPulse', 'Beam.Beam', 'Frequency',
      mainAttribute: 'Shutter1', pretty: 'Random Pulse1'),
  _GdtfAttribute('Shutter1StrobeEffect', 'Beam.Beam', 'Frequency',
      mainAttribute: 'Shutter1', pretty: 'Effect1'),
  _GdtfAttribute('StrobeDuration', 'Beam.Beam', 'Time', pretty: 'Strobe Dur'),
  _GdtfAttribute('Shutter2', 'Beam.Beam', 'None', pretty: 'Sh2'),
  _GdtfAttribute('Shutter2Strobe', 'Beam.Beam', 'Frequency',
      mainAttribute: 'Shutter2', pretty: 'Strobe2'),
  _GdtfAttribute('Shutter3', 'Beam.Beam', 'None', pretty: 'Sh3'),

  // ─── Beam : Iris ─────────────────────────────────────────────────────────
  _GdtfAttribute('Iris', 'Beam.Beam', 'None', pretty: 'Iris'),
  _GdtfAttribute('IrisStrobe', 'Beam.Beam', 'Frequency', pretty: 'Iris Strobe'),
  _GdtfAttribute('IrisStrobeRandom', 'Beam.Beam', 'Frequency',
      pretty: 'Iris Random'),
  _GdtfAttribute('IrisPulseClose', 'Beam.Beam', 'Frequency',
      pretty: 'Iris PulseClose'),
  _GdtfAttribute('IrisPulseOpen', 'Beam.Beam', 'Frequency',
      pretty: 'Iris PulseOpen'),
  _GdtfAttribute('IrisRandomPulseClose', 'Beam.Beam', 'Frequency',
      pretty: 'Iris Rand Close'),
  _GdtfAttribute('IrisRandomPulseOpen', 'Beam.Beam', 'Frequency',
      pretty: 'Iris Rand Open'),

  // ─── Focus : Frost (= diffusion, catégorie Focus dans MA3) ───────────────
  _GdtfAttribute('Frost1', 'Focus.Focus', 'None', pretty: 'Frost1'),
  _GdtfAttribute('Frost2', 'Focus.Focus', 'None', pretty: 'Frost2'),
  _GdtfAttribute('Frost3', 'Focus.Focus', 'None', pretty: 'Frost3'),
  _GdtfAttribute('Frost1PulseOpen', 'Focus.Focus', 'Frequency',
      pretty: 'Frost1 PulseO'),
  _GdtfAttribute('Frost1PulseClose', 'Focus.Focus', 'Frequency',
      pretty: 'Frost1 PulseC'),

  // ─── Beam : Prism ────────────────────────────────────────────────────────
  _GdtfAttribute('Prism1', 'Beam.Beam', 'None',
      activationGroup: 'Prism1', pretty: 'Prism1'),
  _GdtfAttribute('Prism1SelectSpin', 'Beam.Beam', 'AngularSpeed',
      pretty: 'Prism1 Spin'),
  _GdtfAttribute('Prism1Macro', 'Beam.Beam', 'None', pretty: 'Prism1 Macro'),
  _GdtfAttribute('Prism1Pos', 'Beam.Beam', 'Angle',
      activationGroup: 'Prism1', pretty: 'Prism1 Pos'),
  _GdtfAttribute('Prism1PosRotate', 'Beam.Beam', 'AngularSpeed',
      activationGroup: 'Prism1', pretty: 'Prism1 Rotate'),
  _GdtfAttribute('Prism2', 'Beam.Beam', 'None', pretty: 'Prism2'),
  _GdtfAttribute('Prism2Pos', 'Beam.Beam', 'Angle', pretty: 'Prism2 Pos'),
  _GdtfAttribute('Prism2PosRotate', 'Beam.Beam', 'AngularSpeed',
      pretty: 'Prism2 Rotate'),

  // ─── Beam : Effects ──────────────────────────────────────────────────────
  _GdtfAttribute('Effects1', 'Beam.Beam', 'None', pretty: 'FX1'),
  _GdtfAttribute('Effects1Rate', 'Beam.Beam', 'Frequency', pretty: 'FX1 Rate'),
  _GdtfAttribute('Effects1Fade', 'Beam.Beam', 'None', pretty: 'FX1 Fade'),
  _GdtfAttribute('Effects1Pos', 'Beam.Beam', 'Angle', pretty: 'FX1 Pos'),
  _GdtfAttribute('Effects1PosRotate', 'Beam.Beam', 'AngularSpeed',
      pretty: 'FX1 Rotate'),
  _GdtfAttribute('Effects2', 'Beam.Beam', 'None', pretty: 'FX2'),
  _GdtfAttribute('Effects2Rate', 'Beam.Beam', 'Frequency', pretty: 'FX2 Rate'),
  _GdtfAttribute('Effects3', 'Beam.Beam', 'None', pretty: 'FX3'),
  _GdtfAttribute('BeamShaper', 'Beam.Beam', 'None', pretty: 'Beam Shaper'),
  _GdtfAttribute('BeamShaperPos', 'Beam.Beam', 'Angle',
      pretty: 'Beam Shaper Pos'),
  _GdtfAttribute('BeamShaperPosRotate', 'Beam.Beam', 'AngularSpeed',
      pretty: 'Beam Shaper Rot'),

  // ─── Focus / Zoom ────────────────────────────────────────────────────────
  _GdtfAttribute('Focus1', 'Focus.Focus', 'None', pretty: 'Focus1'),
  _GdtfAttribute('Focus1Adjust', 'Focus.Focus', 'None', pretty: 'Focus1 Adj'),
  _GdtfAttribute('Focus1Distance', 'Focus.Focus', 'Length',
      pretty: 'Focus1 Dist'),
  _GdtfAttribute('Focus2', 'Focus.Focus', 'None', pretty: 'Focus2'),
  // ATTENTION : "Focus" tout court (sans suffix) reste pour compat avec
  // l'ancien code. La spec moderne préfère Focus1.
  _GdtfAttribute('Focus', 'Focus.Focus', 'None', pretty: 'Focus'),
  _GdtfAttribute('Zoom', 'Focus.Focus', 'Angle', pretty: 'Zoom'),
  _GdtfAttribute('ZoomModeBeam', 'Focus.Focus', 'Angle', pretty: 'Zoom Beam'),
  _GdtfAttribute('ZoomModeSpot', 'Focus.Focus', 'Angle', pretty: 'Zoom Spot'),

  // ─── Shapers (Profile blades + Keystone) ─────────────────────────────────
  // Blades = "couteaux" dans les fixtures profil pour découper la silhouette.
  _GdtfAttribute('Blade1A', 'Shapers.Shapers', 'None', pretty: 'Blade1A'),
  _GdtfAttribute('Blade1B', 'Shapers.Shapers', 'None', pretty: 'Blade1B'),
  _GdtfAttribute('Blade1Rot', 'Shapers.Shapers', 'Angle', pretty: 'Blade1 Rot'),
  _GdtfAttribute('Blade2A', 'Shapers.Shapers', 'None', pretty: 'Blade2A'),
  _GdtfAttribute('Blade2B', 'Shapers.Shapers', 'None', pretty: 'Blade2B'),
  _GdtfAttribute('Blade2Rot', 'Shapers.Shapers', 'Angle', pretty: 'Blade2 Rot'),
  _GdtfAttribute('Blade3A', 'Shapers.Shapers', 'None', pretty: 'Blade3A'),
  _GdtfAttribute('Blade3B', 'Shapers.Shapers', 'None', pretty: 'Blade3B'),
  _GdtfAttribute('Blade3Rot', 'Shapers.Shapers', 'Angle', pretty: 'Blade3 Rot'),
  _GdtfAttribute('Blade4A', 'Shapers.Shapers', 'None', pretty: 'Blade4A'),
  _GdtfAttribute('Blade4B', 'Shapers.Shapers', 'None', pretty: 'Blade4B'),
  _GdtfAttribute('Blade4Rot', 'Shapers.Shapers', 'Angle', pretty: 'Blade4 Rot'),
  _GdtfAttribute('ShaperRot', 'Shapers.Shapers', 'Angle', pretty: 'Shaper Rot'),
  _GdtfAttribute('ShaperMacros', 'Shapers.Shapers', 'None',
      pretty: 'Shaper Macros'),
  _GdtfAttribute('BladeSoft1A', 'Shapers.Shapers', 'None', pretty: 'BladeS 1A'),
  _GdtfAttribute('BladeSoft1B', 'Shapers.Shapers', 'None', pretty: 'BladeS 1B'),
  _GdtfAttribute('BladeSoft2A', 'Shapers.Shapers', 'None', pretty: 'BladeS 2A'),
  _GdtfAttribute('BladeSoft2B', 'Shapers.Shapers', 'None', pretty: 'BladeS 2B'),
  _GdtfAttribute('BladeSoft3A', 'Shapers.Shapers', 'None', pretty: 'BladeS 3A'),
  _GdtfAttribute('BladeSoft3B', 'Shapers.Shapers', 'None', pretty: 'BladeS 3B'),
  _GdtfAttribute('BladeSoft4A', 'Shapers.Shapers', 'None', pretty: 'BladeS 4A'),
  _GdtfAttribute('BladeSoft4B', 'Shapers.Shapers', 'None', pretty: 'BladeS 4B'),
  _GdtfAttribute('KeyStone1A', 'Shapers.Shapers', 'None', pretty: 'KS 1A'),
  _GdtfAttribute('KeyStone1B', 'Shapers.Shapers', 'None', pretty: 'KS 1B'),
  _GdtfAttribute('KeyStone2A', 'Shapers.Shapers', 'None', pretty: 'KS 2A'),
  _GdtfAttribute('KeyStone2B', 'Shapers.Shapers', 'None', pretty: 'KS 2B'),
  _GdtfAttribute('KeyStone3A', 'Shapers.Shapers', 'None', pretty: 'KS 3A'),
  _GdtfAttribute('KeyStone3B', 'Shapers.Shapers', 'None', pretty: 'KS 3B'),
  // Pattern (lié à Shapers ou Beam selon les manuels)
  _GdtfAttribute('PatternSelection', 'Shapers.Shapers', 'None',
      pretty: 'Pattern Sel'),
  _GdtfAttribute('PatternRotation', 'Shapers.Shapers', 'AngularSpeed',
      pretty: 'Pattern Rot'),
  _GdtfAttribute('PatternSize', 'Shapers.Shapers', 'None',
      pretty: 'Pattern Size'),
  _GdtfAttribute('PatternFade', 'Shapers.Shapers', 'None',
      pretty: 'Pattern Fade'),
  _GdtfAttribute('PatternCrossfade', 'Shapers.Shapers', 'None',
      pretty: 'Pattern Crossfade'),

  // ─── Control : mode / reset / speed ──────────────────────────────────────
  _GdtfAttribute('Control1', 'Control.Control', 'None', pretty: 'Ctrl1'),
  _GdtfAttribute('Control2', 'Control.Control', 'None', pretty: 'Ctrl2'),
  _GdtfAttribute('Control3', 'Control.Control', 'None', pretty: 'Ctrl3'),
  _GdtfAttribute('Control4', 'Control.Control', 'None', pretty: 'Ctrl4'),
  _GdtfAttribute('Control5', 'Control.Control', 'None', pretty: 'Ctrl5'),
  _GdtfAttribute('Control6', 'Control.Control', 'None', pretty: 'Ctrl6'),
  _GdtfAttribute('Control7', 'Control.Control', 'None', pretty: 'Ctrl7'),
  _GdtfAttribute('Control8', 'Control.Control', 'None', pretty: 'Ctrl8'),
  _GdtfAttribute('Control9', 'Control.Control', 'None', pretty: 'Ctrl9'),
  _GdtfAttribute('Control10', 'Control.Control', 'None', pretty: 'Ctrl10'),
  _GdtfAttribute('Control11', 'Control.Control', 'None', pretty: 'Ctrl11'),
  _GdtfAttribute('Control12', 'Control.Control', 'None', pretty: 'Ctrl12'),
  _GdtfAttribute('Control13', 'Control.Control', 'None', pretty: 'Ctrl13'),
  _GdtfAttribute('Control14', 'Control.Control', 'None', pretty: 'Ctrl14'),
  _GdtfAttribute('Control15', 'Control.Control', 'None', pretty: 'Ctrl15'),
  _GdtfAttribute('Control16', 'Control.Control', 'None', pretty: 'Ctrl16'),
  _GdtfAttribute('Control17', 'Control.Control', 'None', pretty: 'Ctrl17'),
  _GdtfAttribute('Control18', 'Control.Control', 'None', pretty: 'Ctrl18'),
  _GdtfAttribute('Control19', 'Control.Control', 'None', pretty: 'Ctrl19'),
  _GdtfAttribute('Control20', 'Control.Control', 'None', pretty: 'Ctrl20'),
  _GdtfAttribute('NoFeature', 'Control.Control', 'None', pretty: 'NoFeature'),
  _GdtfAttribute('Function', 'Control.Control', 'None', pretty: 'Function'),
  // Modes
  _GdtfAttribute('DimmerMode', 'Control.Control', 'None', pretty: 'Dim Mode'),
  _GdtfAttribute('DimmerCurve', 'Control.Control', 'None', pretty: 'Dim Curve'),
  _GdtfAttribute('BlackoutMode', 'Control.Control', 'None',
      pretty: 'Blackout Mode'),
  _GdtfAttribute('LEDFrequency', 'Control.Control', 'Frequency',
      pretty: 'LED Freq'),
  _GdtfAttribute('LEDZoneMode', 'Control.Control', 'None',
      pretty: 'LED Zone Mode'),
  _GdtfAttribute('PixelMode', 'Control.Control', 'None', pretty: 'Pixel Mode'),
  _GdtfAttribute('PanMode', 'Control.Control', 'None', pretty: 'Pan Mode'),
  _GdtfAttribute('TiltMode', 'Control.Control', 'None', pretty: 'Tilt Mode'),
  _GdtfAttribute('PanTiltMode', 'Control.Control', 'None',
      pretty: 'PanTilt Mode'),
  _GdtfAttribute('ColorMixMode', 'Control.Control', 'None',
      pretty: 'Color Mix Mode'),
  _GdtfAttribute('ColorWheelShortcutMode', 'Control.Control', 'None',
      pretty: 'CW Shortcut'),
  _GdtfAttribute('ColorCalibrationMode', 'Control.Control', 'None',
      pretty: 'CCalib Mode'),
  _GdtfAttribute('ColorConsistency', 'Control.Control', 'None',
      pretty: 'Color Consistency'),
  _GdtfAttribute('CyanMode', 'Control.Control', 'None', pretty: 'Cyan Mode'),
  _GdtfAttribute('YellowMode', 'Control.Control', 'None',
      pretty: 'Yellow Mode'),
  _GdtfAttribute('ChromaticMode', 'Control.Control', 'None',
      pretty: 'Chroma Mode'),
  _GdtfAttribute('IrisMode', 'Control.Control', 'None', pretty: 'Iris Mode'),
  _GdtfAttribute('ZoomMode', 'Control.Control', 'None', pretty: 'Zoom Mode'),
  _GdtfAttribute('FanMode', 'Control.Control', 'None', pretty: 'Fan Mode'),
  _GdtfAttribute('Gobo1WheelMode', 'Control.Control', 'None',
      pretty: 'G1 Mode'),
  _GdtfAttribute('Gobo2WheelMode', 'Control.Control', 'None',
      pretty: 'G2 Mode'),
  _GdtfAttribute('AnimationWheel1Mode', 'Control.Control', 'None',
      pretty: 'Anim1 Mode'),
  _GdtfAttribute('AnimationWheelShortcutMode', 'Control.Control', 'None',
      pretty: 'AnimShort Mode'),
  // Speed (MSpeed = movement speed)
  _GdtfAttribute('PositionMSpeed', 'Control.Control', 'None',
      pretty: 'Pos MSpeed'),
  _GdtfAttribute('ColorMixMSpeed', 'Control.Control', 'None',
      pretty: 'CMix MSpeed'),
  _GdtfAttribute('Color1MSpeed', 'Control.Control', 'None',
      pretty: 'C1 MSpeed'),
  _GdtfAttribute('Color2MSpeed', 'Control.Control', 'None',
      pretty: 'C2 MSpeed'),
  _GdtfAttribute('Gobo1WheelMSpeed', 'Control.Control', 'None',
      pretty: 'G1 MSpeed'),
  _GdtfAttribute('Gobo2WheelMSpeed', 'Control.Control', 'None',
      pretty: 'G2 MSpeed'),
  _GdtfAttribute('IrisMSpeed', 'Control.Control', 'None',
      pretty: 'Iris MSpeed'),
  _GdtfAttribute('Prism1MSpeed', 'Control.Control', 'None',
      pretty: 'Prism MSpeed'),
  _GdtfAttribute('FocusMSpeed', 'Control.Control', 'None',
      pretty: 'Focus MSpeed'),
  _GdtfAttribute('FrameMSpeed', 'Control.Control', 'None',
      pretty: 'Frame MSpeed'),
  _GdtfAttribute('GlobalMSpeed', 'Control.Control', 'None',
      pretty: 'Global MSpeed'),
  // Resets
  _GdtfAttribute('Reset', 'Control.Control', 'None', pretty: 'Reset'),
  _GdtfAttribute('FixtureGlobalReset', 'Control.Control', 'None',
      pretty: 'Global Reset'),
  _GdtfAttribute('ShutterReset', 'Control.Control', 'None',
      pretty: 'Shutter Rst'),
  _GdtfAttribute('PanReset', 'Control.Control', 'None', pretty: 'Pan Rst'),
  _GdtfAttribute('TiltReset', 'Control.Control', 'None', pretty: 'Tilt Rst'),
  _GdtfAttribute('PanTiltReset', 'Control.Control', 'None', pretty: 'PT Rst'),
  _GdtfAttribute('PositionReset', 'Control.Control', 'None', pretty: 'Pos Rst'),
  _GdtfAttribute('ZoomReset', 'Control.Control', 'None', pretty: 'Zoom Rst'),
  _GdtfAttribute('FocusReset', 'Control.Control', 'None', pretty: 'Focus Rst'),
  _GdtfAttribute('ColorMixReset', 'Control.Control', 'None',
      pretty: 'CMix Rst'),
  _GdtfAttribute('ColorWheelReset', 'Control.Control', 'None',
      pretty: 'CW Rst'),
  _GdtfAttribute('IntensityReset', 'Control.Control', 'None',
      pretty: 'Int Rst'),
  _GdtfAttribute('CTOReset', 'Control.Control', 'None', pretty: 'CTO Rst'),
  _GdtfAttribute('CTBReset', 'Control.Control', 'None', pretty: 'CTB Rst'),
  _GdtfAttribute('EffectReset', 'Control.Control', 'None', pretty: 'FX Rst'),
  _GdtfAttribute('NonPositionReset', 'Control.Control', 'None',
      pretty: 'NonPos Rst'),
  _GdtfAttribute('FixtureCalibrationReset', 'Control.Control', 'None',
      pretty: 'Calib Rst'),
  // Misc Control
  _GdtfAttribute('LampControl', 'Control.Control', 'None', pretty: 'Lamp'),
  _GdtfAttribute('LampPowerMode', 'Control.Control', 'None',
      pretty: 'Lamp Pwr'),
  _GdtfAttribute('DisplayIntensity', 'Control.Control', 'None',
      pretty: 'Display Int'),
  _GdtfAttribute('DMXInput', 'Control.Control', 'None', pretty: 'DMX Input'),
  _GdtfAttribute('Fans', 'Control.Control', 'None', pretty: 'Fans'),
  _GdtfAttribute('Fog1', 'Control.Control', 'None', pretty: 'Fog1'),
  _GdtfAttribute('Haze1', 'Control.Control', 'None', pretty: 'Haze1'),
  _GdtfAttribute('ReflectorAdjust', 'Control.Control', 'None',
      pretty: 'Reflector Adj'),

  // ─── Video (rare pour fixtures DMX standard) ─────────────────────────────
  _GdtfAttribute('VideoEffect1Type', 'Video.Video', 'None', pretty: 'FX1 Type'),
  _GdtfAttribute('FieldOfView', 'Video.Video', 'Angle', pretty: 'FOV'),
];

// Tokens couleurs « longs » : doivent matcher avant les abréviations courtes.
// Ordre : du plus spécifique au plus générique. Tout token plus long que sa
// version générique doit apparaître AVANT elle (warmwhite avant white,
// royalblue avant blue, hyperred avant red, etc.).
const List<(String, String)> _kColorTokensLong = <(String, String)>[
  // Blancs spécialisés (priorité absolue sur 'white' / 'blanc')
  ('warmwhite', 'ColorAdd_WW'),
  ('whitewarm', 'ColorAdd_WW'),
  ('blancchaud', 'ColorAdd_WW'),
  ('coolwhite', 'ColorAdd_CW'),
  ('coldwhite', 'ColorAdd_CW'),
  ('whitecold', 'ColorAdd_CW'),
  ('whitecool', 'ColorAdd_CW'),
  ('blancfroid', 'ColorAdd_CW'),
  // Variantes de couleurs spécifiques (priorité sur red/blue/etc)
  ('royalblue', 'ColorAdd_RB'),
  ('hyperred', 'ColorAdd_R'),
  ('deepred', 'ColorAdd_R'),
  ('farred', 'ColorAdd_R'),
  ('ultraviolet', 'ColorAdd_UV'),
  ('ultraviolette', 'ColorAdd_UV'),
  // Couleurs standard
  ('amber', 'ColorAdd_A'),
  ('ambre', 'ColorAdd_A'),
  ('cyan', 'ColorAdd_C'),
  ('magenta', 'ColorAdd_M'),
  ('yellow', 'ColorAdd_Y'),
  ('jaune', 'ColorAdd_Y'),
  ('green', 'ColorAdd_G'),
  ('vert', 'ColorAdd_G'),
  ('blue', 'ColorAdd_B'),
  ('bleu', 'ColorAdd_B'),
  ('white', 'ColorAdd_W'),
  ('blanc', 'ColorAdd_W'),
  ('red', 'ColorAdd_R'),
  ('rouge', 'ColorAdd_R'),
  ('lime', 'ColorAdd_Lime'),
  ('mint', 'ColorAdd_Mint'),
  // Couleurs proches mappées au plus proche standard GDTF
  ('indigo', 'ColorAdd_UV'),
  ('violet', 'ColorAdd_UV'),
  ('pink', 'ColorAdd_M'),
  ('rose', 'ColorAdd_M'),
  ('turquoise', 'ColorAdd_C'),
  ('orange', 'ColorAdd_A'),
];

// Tokens couleurs « courts » (abréviations à 1-2 lettres). Ne matchent que
// s'ils sont entourés d'un chiffre ou d'une frontière de chaîne, pour éviter
// les faux positifs (le 'r' dans 'reset', le 'l' dans 'pixel', etc.).
const List<(String, String)> _kColorTokensShort = <(String, String)>[
  // 2 lettres d'abord (ww/cw/rb/uv) avant les 1-lettre.
  ('uv', 'ColorAdd_UV'),
  ('ww', 'ColorAdd_WW'),
  ('cw', 'ColorAdd_CW'),
  ('rb', 'ColorAdd_RB'),
  // 1 lettre.
  ('r', 'ColorAdd_R'),
  ('g', 'ColorAdd_G'),
  ('v', 'ColorAdd_G'), // V pour "Vert" (FR) — Starway Pixkolor, etc.
  ('b', 'ColorAdd_B'),
  ('w', 'ColorAdd_W'),
  ('a', 'ColorAdd_A'),
  ('u', 'ColorAdd_UV'), // U seul (sans V) pour UV — accolé à un chiffre
  ('c', 'ColorAdd_C'),
  ('m', 'ColorAdd_M'),
  ('y', 'ColorAdd_Y'),
  ('l', 'ColorAdd_Lime'),
];

// Mots-clés qui marquent un regroupement en instance (pixel, set, section,
// cell, head, zone, segment, module, group).
const List<String> _kInstanceKeywords = <String>[
  'pixel',
  'section',
  'segment',
  'module',
  'group',
  'cell',
  'head',
  'zone',
  'set',
  'pix',
  'sec',
];

// ─────────────────────────────────────────────────────────────────────────────
// PAGE
// ─────────────────────────────────────────────────────────────────────────────

class GdtfBuilderSimplePage extends StatefulWidget {
  const GdtfBuilderSimplePage({super.key});
  @override
  State<GdtfBuilderSimplePage> createState() => _GdtfBuilderSimplePageState();
}

class _GdtfBuilderSimplePageState extends State<GdtfBuilderSimplePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  final _searchCtrl = TextEditingController();
  bool _isSearching = false;
  String _searchError = '';
  List<GdtfFixture> _results = [];
  bool _hasSearched = false;

  final _fixtureNameCtrl = TextEditingController();
  final _manufacturerCtrl = TextEditingController();
  PlatformFile? _selectedPdf;
  bool _isAnalyzing = false;
  String _analyzeError = '';

  // ─── Mode discovery → sélection → extraction ─────────────────────────────
  // Après l'analyse PDF (étape 1), le Worker renvoie la liste des modes
  // disponibles. L'utilisateur coche ceux qu'il veut, puis on lance
  // l'extraction des canaux uniquement pour ces modes-là (étape 2).
  // _cachedPdfText évite de re-extraire le PDF entre les deux requêtes.
  List<_DiscoveredMode> _discoveredModes = [];
  Set<String> _selectedModeNames = {}; // clé = name (unique)
  String _cachedPdfText = '';
  // PDF en base64, mis en cache entre discovery et extraction pour ne pas
  // re-encoder. Envoyé au worker pour que le microservice de tables puisse
  // reconstituer les sections protocole DMX.
  String _cachedPdfBase64 = '';
  bool _isExtracting = false;
  String _extractError = '';
  final _modeSearchCtrl = TextEditingController();
  List<String> _extractWarnings = [];

  List<DmxMode> _dmxModes = [];
  bool _isGenerating = false;
  String _generateError = '';
  String _generateSuccess = '';
  String _generateFilePath = '';
  // Étapes :
  //   0 = formulaire (fabricant, modèle, PDF)
  //   1 = sélection des modes (après discovery)
  //   2 = vérification des canaux (après extraction)
  //   3 = succès (GDTF généré)
  int _generateStep = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchCtrl.dispose();
    _fixtureNameCtrl.dispose();
    _manufacturerCtrl.dispose();
    _modeSearchCtrl.dispose();
    super.dispose();
  }

  Rect _sharePositionOrigin() {
    final renderObject = context.findRenderObject();
    if (renderObject is RenderBox && renderObject.hasSize) {
      final topLeft = renderObject.localToGlobal(Offset.zero);
      final size = renderObject.size;
      if (size.width > 0 && size.height > 0) {
        return topLeft & size;
      }
    }
    return const Rect.fromLTWH(0, 0, 1, 1);
  }

  Future<String> _writePersistentGdtfFile({
    required String fileName,
    required List<int> bytes,
  }) async {
    final documentsDir = await getApplicationDocumentsDirectory();
    final exportDir = Directory('${documentsDir.path}/ShowTechTools/GDTF');

    if (!await exportDir.exists()) {
      await exportDir.create(recursive: true);
    }

    final file = File('${exportDir.path}/$fileName');
    await file.writeAsBytes(bytes, flush: true);

    final exists = await file.exists();
    final length = exists ? await file.length() : 0;

    if (!exists || length <= 0) {
      throw FileSystemException('Unable to write GDTF file', file.path);
    }

    return file.path;
  }

  Future<void> _shareGdtfFile({
    required String filePath,
    required String subject,
  }) async {
    final file = File(filePath);
    final exists = await file.exists();
    final length = exists ? await file.length() : 0;

    if (!exists || length <= 0) {
      throw FileSystemException('GDTF file not found or empty', filePath);
    }
    final rawName =
        subject.toLowerCase().endsWith('.gdtf') ? subject : '$subject.gdtf';

    final fileName = rawName.replaceAll(RegExp(r'[^\w\-.]'), '_');

    await Share.shareXFiles(
      [
        XFile(
          file.path,
          mimeType: 'application/octet-stream',
          name: fileName,
        ),
      ],
      subject: fileName,
      sharePositionOrigin: _sharePositionOrigin(),
    );
  }

  // ─── Search ──────────────────────────────────────────────────────────────

  Future<void> _search() async {
    final q = _searchCtrl.text.trim();
    if (q.isEmpty) return;
    setState(() {
      _isSearching = true;
      _searchError = '';
      _results = [];
      _hasSearched = false;
    });
    try {
      final response = await http
          .get(Uri.parse(
              '$_kWorkerUrl/search?q=${Uri.encodeComponent(q)}'))
          .timeout(const Duration(seconds: 20));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        setState(() {
          _results = ((data['results'] as List<dynamic>?) ?? [])
              .map((e) => GdtfFixture.fromJson(e as Map<String, dynamic>))
              .toList();
          _hasSearched = true;
        });
      } else {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        setState(() => _searchError = data['error'] as String? ??
            AppLocalizations.of(context).gdtfErrorStatus(response.statusCode));
      }
    } catch (e) {
      setState(() => _searchError =
          AppLocalizations.of(context).gdtfNetworkError(e.toString()));
    } finally {
      setState(() => _isSearching = false);
    }
  }

  Future<void> _downloadFixture(GdtfFixture fixture) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      messenger.showSnackBar(SnackBar(
          content: Text(AppLocalizations.of(context)
              .gdtfDownloadingFixture(fixture.fixture)),
          duration: const Duration(seconds: 10)));
      final response = await http
          .get(Uri.parse(
              '$_kWorkerUrl/download?rid=${fixture.rid}'))
          .timeout(const Duration(seconds: 30));
      if (response.statusCode != 200) {
        messenger.clearSnackBars();
        messenger.showSnackBar(SnackBar(
            content: Text(AppLocalizations.of(context)
                .gdtfErrorStatusParentheses(response.statusCode)),
            backgroundColor: Colors.red.shade800));
        return;
      }
      final fileName = _gdtfFileName(
        manufacturer: fixture.manufacturer,
        fixtureName: fixture.fixture,
      );
      final filePath = await _writePersistentGdtfFile(
        fileName: fileName,
        bytes: response.bodyBytes,
      );
      messenger.clearSnackBars();
      await _shareGdtfFile(
        filePath: filePath,
        subject: fileName,
      );
    } catch (e) {
      messenger.clearSnackBars();
      messenger.showSnackBar(SnackBar(
          content:
              Text(AppLocalizations.of(context).gdtfErrorDetails(e.toString())),
          backgroundColor: Colors.red.shade800));
    }
  }

  // ─── Generate ────────────────────────────────────────────────────────────

  Future<void> _pickPdf() async {
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['pdf'], withData: true);
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _selectedPdf = result.files.first;
        _analyzeError = '';
      });
    }
  }

  // Extrait uniquement les pages DMX utiles du PDF.
  // Extrait TOUT le texte du PDF sans filtrage (pour la recherche prose des
  // comptes de canaux, qui se trouve parfois sur une page d'intro filtrée
  // par _extractDmxSections).
  Future<String> _extractFullPdfText(Uint8List pdfBytes) async {
    final document = PdfDocument(inputBytes: pdfBytes);
    final extractor = PdfTextExtractor(document);
    final buf = StringBuffer();
    for (var i = 0; i < document.pages.count; i++) {
      final text = extractor.extractText(startPageIndex: i, endPageIndex: i);
      buf.write(text);
      buf.write('\n');
    }
    return buf.toString();
  }

  Future<String> _extractDmxSections(Uint8List pdfBytes) async {
    final document = PdfDocument(inputBytes: pdfBytes);
    final extractor = PdfTextExtractor(document);

    final keptPages = <String>[];
    final keptPageIndices = <int>[];
    var forceKeepAfterStrongStart = false;
    var forceKeepRemainingDmxChart = false;
    var consecutiveWeakPagesAfterStrongStart = 0;

    final strongStartKeywords = <String>[
      'dmx protocol',
      'dmx channel index',
      'dmx channel chart',
      'dmx channelchart',
      'dmx channels',
      'dmx channel',
      'dmx chart',
      'dmx mode',
      'dmx modes',
      'dmx control mode',
      'dmx control modes',
      'channel mode',
      'channel function',
      'function dmx description',
      'mode/channel',
    ];

    final continuationKeywords = <String>[
      'channel',
      'function',
      'dmx',
      'dmx value',
      'value',
      '0..255',
      '0-255',
      '0 – 255',
      'proportional',
      'step',
      'pan',
      'tilt',
      'dimmer',
      'shutter',
      'strobe',
      'zoom',
      'focus',
      'gobo',
      'prism',
      'frost',
      'cto',
      'cyan',
      'magenta',
      'yellow',
      'red',
      'green',
      'blue',
      'white',
      'amber',
      'pixel',
      'set 1',
      'set 2',
      'set 3',
    ];

    final rejectKeywords = <String>[
      'safety',
      'warnings',
      'installation',
      'rigging',
      'power connection',
      'maintenance',
      'cleaning',
      'technical data',
      'technical specifications',
      'specifications',
      'dimension',
      'dimensional',
      'fixture overview',
      'product overview',
      'appearance',
      'transportation',
      'accessories',
      'warranty',
      'circuit diagram',
      'component order codes',
      'error messages',
      'troubleshooting',
    ];

    bool hasAny(String lower, List<String> keywords) {
      for (final keyword in keywords) {
        if (lower.contains(keyword)) return true;
      }
      return false;
    }

    int countMatches(String text, RegExp pattern) {
      return pattern.allMatches(text).length;
    }

    for (var pageIndex = 0; pageIndex < document.pages.count; pageIndex++) {
      final pageText = extractor
          .extractText(startPageIndex: pageIndex, endPageIndex: pageIndex)
          .trim();

      if (pageText.isEmpty) continue;

      final lower = pageText.toLowerCase();
      final compactLower = lower.replaceAll(RegExp(r'\s+'), ' ');

      final hasStrongStart = hasAny(lower, strongStartKeywords);

      // Cas GLP X4 Bar: le PDF est un DMX chart dès la page 1/2.
      if (lower.contains('dmx channel index') ||
          lower.contains('you can choose between 7 dmx modes') ||
          lower.contains('normal mode (norm)')) {
        forceKeepRemainingDmxChart = true;
      }

      if (hasStrongStart) {
        forceKeepAfterStrongStart = true;
        consecutiveWeakPagesAfterStrongStart = 0;
      }

      var score = 0;

      if (hasStrongStart) score += 18;
      if (forceKeepRemainingDmxChart) score += 10;
      if (forceKeepAfterStrongStart) score += 6;

      for (final keyword in continuationKeywords) {
        if (lower.contains(keyword)) score += 1;
      }

      final channelFunctionRows = countMatches(
        pageText,
        RegExp(
          r'^\s*\d{1,3}\s+([A-Za-z][A-Za-z0-9 /\-()]+)',
          caseSensitive: false,
          multiLine: true,
        ),
      );

      final valueRanges = countMatches(
        pageText,
        RegExp(
          r'\b\d{1,3}\s*(?:-|–|\.\.)\s*\d{1,3}\b',
          caseSensitive: false,
        ),
      );

      final dmxChannelMentions = countMatches(
        pageText,
        RegExp(
          r'\b\d{1,3}\s+(pan|tilt|red|green|blue|white|amber|cyan|magenta|yellow|dimmer|strobe|shutter|zoom|focus|gobo|prism|frost|cto|pixel|set)\b',
          caseSensitive: false,
        ),
      );

      score += channelFunctionRows * 2;
      score += valueRanges;
      score += dmxChannelMentions * 3;

      // Les pages type table des matières contiennent souvent "DMX" mais pas
      // assez de ranges / rows DMX. On les garde seulement si elles démarrent
      // une vraie section ou un vrai DMX chart.
      final looksLikeToc = lower.contains('table of contents') ||
          lower.contains('index') && lower.contains('safety');

      if (looksLikeToc && !forceKeepRemainingDmxChart) {
        score -= 10;
      }

      for (final keyword in rejectKeywords) {
        if (lower.contains(keyword)) score -= 3;
      }

      // Ne rejette pas une page GLP X4 / JDC1 qui contient specs textuelles mais
      // fait partie d'un tableau DMX continu.
      final keepBecauseContinuation = forceKeepAfterStrongStart &&
          (valueRanges >= 4 ||
              dmxChannelMentions >= 2 ||
              channelFunctionRows >= 4 ||
              compactLower.contains('0..255') ||
              compactLower.contains('0-255'));

      final hasDmxModeHeader = RegExp(
            r'\b\d+\s+[a-z0-9\s\-\(\)\/\.]+\b\d{1,3}\s*(dmx\s*)?(channels|channel|ch|canaux|canal)\b',
            caseSensitive: false,
          ).hasMatch(pageText) ||
          RegExp(
            r'\b[a-z0-9\s\-\(\)\/\.]+\(\s*\d{1,3}\s*(dmx\s*)?(channels|channel|ch|canaux|canal)\s*\)',
            caseSensitive: false,
          ).hasMatch(pageText) ||
          RegExp(
            r'\b\d{1,3}\s*(dmx\s*)?(channels|channel|ch|canaux|canal)\s*:',
            caseSensitive: false,
          ).hasMatch(pageText);

      final keep = score >= 10 || keepBecauseContinuation || hasDmxModeHeader;

      if (keep) {
        keptPages.add(
          '========== PDF PAGE ${pageIndex + 1} ==========\n$pageText',
        );
        keptPageIndices.add(pageIndex);
        consecutiveWeakPagesAfterStrongStart = 0;
      } else if (forceKeepAfterStrongStart) {
        consecutiveWeakPagesAfterStrongStart++;
        if (consecutiveWeakPagesAfterStrongStart >= 3 &&
            !forceKeepRemainingDmxChart) {
          forceKeepAfterStrongStart = false;
        }
      }
    }

    document.dispose();

    if (keptPages.isEmpty) {
      return '';
    }

    final result = keptPages.join('\n\n');
    // 150_000 chars laisse passer les manuels longs (Astera Titan = 143 profils
    // sur ~150 pages). Le Worker re-tronque à sa propre limite côté serveur.
    if (result.length <= 150000) return result;
    return result.substring(0, 150000);
  }

  // Étape 1/2 : appelle le Worker en mode "discover" pour récupérer la
  // liste des modes DMX présents dans le manuel. On ne lance PAS encore
  // l'extraction des canaux — c'est l'utilisateur qui choisira ensuite.
  Future<void> _analyzePdf() async {
    final fixtureName = _fixtureNameCtrl.text.trim();
    final manufacturer = _manufacturerCtrl.text.trim();
    if (fixtureName.isEmpty || manufacturer.isEmpty) {
      setState(() => _analyzeError =
          AppLocalizations.of(context).gdtfErrorFillManufacturerAndModel);
      return;
    }
    if (_selectedPdf == null) {
      setState(() =>
          _analyzeError = AppLocalizations.of(context).gdtfErrorSelectPdf);
      return;
    }
    setState(() {
      _isAnalyzing = true;
      _analyzeError = '';
    });
    // Attend que Flutter ait PEINT la frame "bouton désactivé + spinner"
    // avant de démarrer les opérations lourdes (lecture PDF + extraction
    // texte). endOfFrame est plus robuste que Future.delayed(Duration.zero)
    // qui ne yield qu'au microtask, pas forcément au rendu.
    await WidgetsBinding.instance.endOfFrame;
    try {
      final pdfBytes =
          _selectedPdf!.bytes ?? await File(_selectedPdf!.path!).readAsBytes();

      // Deux extractions du PDF :
      //   - pdfText : pages DMX uniquement, optimisé pour le worker (limite
      //     de tokens, focalisé sur les tables DMX).
      //   - fullText : tout le texte du PDF sans filtrage, utilisé par
      //     l'override prose pour trouver les phrases type "requiert N
      //     canaux DMX" qui sont souvent sur une page d'intro filtrée par
      //     _extractDmxSections.
      final pdfText = await _extractDmxSections(pdfBytes);
      final fullText = await _extractFullPdfText(pdfBytes);

      // Cas PDF scanné (images sans couche texte) : on n'a plus de texte
      // côté Dart. Mais le microservice table-extractor v1.1+ a Tesseract
      // en fallback et reconstruit le texte par OCR à partir du PDF base64.
      // On envoie donc la requête quand même, en informant l'utilisateur
      // que l'analyse va prendre plus longtemps (~1-2 min d'OCR Cloud Run).
      final bool isScannedPdf = fullText.trim().length < 100;
      if (isScannedPdf) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(AppLocalizations.of(context).gdtfScannedPdfOcrEnabled),
          duration: Duration(seconds: 6),
        ));
      } else if (pdfText.trim().isEmpty) {
        // Le PDF a du texte mais aucune page n'a passé le filtrage DMX.
        // (Pas un scan — donc l'OCR n'aiderait pas non plus.)
        setState(() => _analyzeError =
            AppLocalizations.of(context).gdtfErrorCannotExtractDmxPages);
        return;
      }

      // PDF en base64 pour le microservice de reconstitution de tables
      // (Cloud Run, appelé par le worker si TABLE_EXTRACTOR_URL configuré).
      // Sur les manuels avec de vraies tables (Cobra, Viper, 350BWS, etc.)
      // le microservice renvoie un texte tabulaire propre que l'IA lit
      // beaucoup mieux. Fallback automatique sur pdf_text si pas dispo.
      final pdfBase64 = base64Encode(pdfBytes);

      final response = await http
          .post(
            Uri.parse(_kWorkerUrl),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'fixture_name': fixtureName,
              'manufacturer': manufacturer,
              'pdf_text': pdfText,
              'pdf_base64': pdfBase64,
              'action': 'discover',
            }),
          )
          // Discovery peut prendre :
          //  - 60-120s sur des manuels avec beaucoup de modes (Astera Titan = 143)
          //  - 60-180s sur les PDF scannés (OCR Tesseract Clay Paky)
          //  + 5-30s d'appel OpenAI mode discovery
          // On laisse 4 min de marge totale pour couvrir worst case.
          .timeout(const Duration(seconds: 240));

      if (response.statusCode != 200) {
        String error =
            AppLocalizations.of(context).gdtfErrorStatus(response.statusCode);
        try {
          error =
              (jsonDecode(response.body) as Map)['error'] as String? ?? error;
        } catch (_) {}
        setState(() => _analyzeError = error);
        return;
      }

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      if (data['success'] != true) {
        setState(() => _analyzeError = data['error'] as String? ??
            AppLocalizations.of(context).gdtfUnknownError);
        return;
      }

      final rawModes = (data['modes'] as List?) ?? const [];
      final discovered = rawModes
          .map((m) => _DiscoveredMode.fromJson(m as Map<String, dynamic>))
          .where((m) => m.name.isNotEmpty && m.channels > 0)
          .toList();

      // Filet de sécurité local : si le manuel contient explicitement
      // "requiert N canaux DMX en mode <X>" (ou variante EN), on corrige
      // les comptes même si le worker s'est planté ou n'a pas été redéployé.
      // On utilise fullText (PDF complet) parce que la phrase prose est
      // souvent sur une page d'intro non gardée par _extractDmxSections.
      final corrected = _applyProseChannelOverride(fullText, discovered);

      // Si le worker a OCRé le PDF (scan Clay Paky par ex.), il renvoie le
      // texte OCR dans data['ocr_text']. On l'utilise comme pdf_text caché à
      // la place du pdfText local (vide pour un scan). Sans ça, l'étape
      // d'extraction est bloquée par "Données du manuel perdues".
      final ocrText = data['ocr_text'] as String?;
      final effectivePdfText =
          (ocrText != null && ocrText.isNotEmpty) ? ocrText : pdfText;

      // Si discover renvoie 0 mode (PDF chelou, OCR multi-colonnes Clay Paky,
      // microservice down avec texte vide, etc.), on bascule QUAND MÊME sur
      // step 1 avec une liste vide. L'utilisateur pourra alors saisir les
      // modes manuellement via le bouton "+ Ajouter un mode" — beaucoup plus
      // safe que de laisser l'IA halluciner. Pré-requis : on doit avoir du
      // texte (PDF ou OCR) pour que l'extract IA fonctionne ensuite.
      if (corrected.isEmpty && effectivePdfText.trim().isEmpty) {
        setState(() =>
            _analyzeError = AppLocalizations.of(context).gdtfNoDmxModeDetected);
        return;
      }

      // Log de debug compact : utile pour suivre la santé du pipeline OCR.
      // À garder un temps puis retirer une fois la confiance est établie.
      // ignore: avoid_print
      print('[GDTF] worker=${data['_worker_version']} '
          'ocr_used=${data['ocr_used']} '
          'modes=${rawModes.length} '
          'cached_text_len=${effectivePdfText.length}');

      setState(() {
        _discoveredModes = corrected;
        _cachedPdfText = effectivePdfText;
        _cachedPdfBase64 = pdfBase64;
        // Pré-sélection : si <= 10 modes, tout coché. Sinon rien (l'utilisateur
        // choisit explicitement pour éviter d'extraire 143 modes inutilement).
        _selectedModeNames = discovered.length <= 10
            ? discovered.map((m) => m.name).toSet()
            : <String>{};
        _extractWarnings = [];
        _extractError = '';
        _modeSearchCtrl.clear();
        _generateStep = 1;
      });
    } catch (e) {
      setState(() => _analyzeError =
          AppLocalizations.of(context).gdtfErrorDetails(e.toString()));
    } finally {
      setState(() => _isAnalyzing = false);
    }
  }

  // Cherche dans le texte du manuel des phrases prose type "requiert N
  // canaux DMX en mode <nom>" et "requires N DMX channels in <nom> mode",
  // puis corrige les comptes des modes par fuzzy match sur le nom.
  // Sert de filet de sécurité quand le worker s'est planté ou n'a pas été
  // redéployé : Flutter a le texte complet du PDF, peut faire la même
  // recherche localement et garantir le bon compte.
  List<_DiscoveredMode> _applyProseChannelOverride(
      String manualText, List<_DiscoveredMode> modes) {
    if (modes.isEmpty || manualText.isEmpty) return modes;

    // Patterns : (1) FR "requiert N canaux DMX en mode <nom>"
    //            (2) FR "et N canaux DMX en mode <nom>" (2ème mode même phrase)
    //            (3) EN "requires N DMX channels in <nom> mode"
    //            (4) EN "<nom> mode requires N DMX channels"
    const stopName = r'(?=\s+et\s+\d|\s*[.,;\n]|$)';
    final patterns = <RegExp>[
      RegExp(
          r'(?:requiert|requires?)\s+(\d{1,3})\s+canaux\s+DMX\s+en\s+mode\s+(.{2,80}?)' +
              stopName,
          caseSensitive: false),
      RegExp(
          r'\bet\s+(\d{1,3})\s+canaux\s+DMX\s+en\s+mode\s+(.{2,80}?)' +
              stopName,
          caseSensitive: false),
      RegExp(
          r'(?:requires|requiert)\s+(\d{1,3})\s+(?:DMX\s+)?channels?\s+in\s+(.{2,80}?)\s+mode' +
              stopName,
          caseSensitive: false),
      RegExp(
          r'([^\n.,]{2,80}?)\s+mode\s+(?:requires|requiert)\s+(\d{1,3})\s+(?:DMX\s+)?channels?',
          caseSensitive: false),
    ];

    // Collecte des hits {nom, channels}.
    final hits = <({String name, int channels})>[];
    for (var i = 0; i < patterns.length; i++) {
      for (final m in patterns[i].allMatches(manualText)) {
        String? frag;
        int? n;
        if (i == 3) {
          frag = m.group(1);
          n = int.tryParse(m.group(2) ?? '');
        } else {
          n = int.tryParse(m.group(1) ?? '');
          frag = m.group(2);
        }
        if (n != null && n > 0 && n < 1024 && frag != null) {
          hits.add((name: frag.trim().toLowerCase(), channels: n));
        }
      }
    }
    if (hits.isEmpty) return modes;

    // Normalise un nom de mode pour fuzzy match : minuscules, sans accents,
    // sans "mode", uniquement caractères alphanumériques.
    String normalize(String s) {
      var out = s.toLowerCase();
      const accents = {
        'à': 'a',
        'â': 'a',
        'ä': 'a',
        'á': 'a',
        'é': 'e',
        'è': 'e',
        'ê': 'e',
        'ë': 'e',
        'î': 'i',
        'ï': 'i',
        'í': 'i',
        'ì': 'i',
        'ô': 'o',
        'ö': 'o',
        'ó': 'o',
        'ò': 'o',
        'û': 'u',
        'ü': 'u',
        'ú': 'u',
        'ù': 'u',
        'ç': 'c',
        'ñ': 'n',
      };
      accents.forEach((k, v) => out = out.replaceAll(k, v));
      out = out.replaceAll(RegExp(r'\bmode\b'), '');
      out = out.replaceAll(RegExp(r'[^a-z0-9]+'), ' ').trim();
      return out;
    }

    return modes.map((mode) {
      final modeNorm = normalize(mode.name);
      ({String name, int channels})? best;
      var bestScore = 0;
      for (final hit in hits) {
        final hitNorm = normalize(hit.name);
        final modeTokens =
            modeNorm.split(' ').where((t) => t.length > 1).toSet();
        final hitTokens = hitNorm.split(' ').where((t) => t.length > 1).toSet();
        var shared = 0;
        for (final t in modeTokens) {
          if (hitTokens.contains(t)) shared++;
        }
        if (shared > bestScore) {
          bestScore = shared;
          best = hit;
        }
      }
      if (best != null && bestScore >= 1 && best.channels != mode.channels) {
        return _DiscoveredMode(name: mode.name, channels: best.channels);
      }
      return mode;
    }).toList();
  }

  // Fallback de saisie manuelle : utilisé quand /discover renvoie 0 mode
  // (PDF avec layout complexe, OCR multi-colonnes type Clay Paky B-Eye, etc.)
  // OU quand l'utilisateur veut juste ajouter un mode oublié par l'IA.
  // Ouvre une boîte de dialogue (nom + nb canaux) et ajoute l'entrée à
  // _discoveredModes. Le flow /extract derrière marche déjà sur ces modes —
  // l'IA fera l'extraction des canaux mode par mode à partir du texte caché.
  Future<void> _addManualMode() async {
    final l10n = AppLocalizations.of(context);
    final nameCtrl = TextEditingController();
    final channelsCtrl = TextEditingController();
    String? errorMsg;

    final result = await showDialog<_DiscoveredMode>(
      context: context,
      builder: (ctx) => StatefulBuilder(builder: (ctx, setStateDialog) {
        return AlertDialog(
          title: Text(l10n.gdtfAddModeDialogTitle),
          // SingleChildScrollView évite l'overflow quand le clavier s'ouvre
          // — le dialogue rétrécit en hauteur et ses TextField scrollent
          // au lieu de déborder de 100+ pixels sous l'IME.
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameCtrl,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: l10n.gdtfModeNameLabel,
                    hintText: l10n.gdtfModeNameExampleHint,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: channelsCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: l10n.gdtfDmxChannelCountLabel,
                    hintText: l10n.gdtfDmxChannelCountHint,
                    border: const OutlineInputBorder(),
                  ),
                ),
                if (errorMsg != null) ...[
                  const SizedBox(height: 8),
                  Text(errorMsg!,
                      style: const TextStyle(color: Colors.redAccent)),
                ],
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                FocusScope.of(ctx).unfocus();
                Navigator.of(ctx).pop();
              },
              child: Text(l10n.gdtfCancel),
            ),
            FilledButton(
              onPressed: () {
                final name = nameCtrl.text.trim();
                final ch = int.tryParse(channelsCtrl.text.trim());
                if (name.isEmpty) {
                  setStateDialog(
                      () => errorMsg = l10n.gdtfErrorModeNameRequired);
                  return;
                }
                if (ch == null || ch <= 0 || ch > 1000) {
                  setStateDialog(
                      () => errorMsg = l10n.gdtfErrorInvalidChannelCount);
                  return;
                }
                if (_discoveredModes
                    .any((m) => m.name.toLowerCase() == name.toLowerCase())) {
                  setStateDialog(
                      () => errorMsg = l10n.gdtfErrorModeAlreadyExists);
                  return;
                }
                // Unfocus AVANT de pop, sinon le clavier IME a encore des
                // listeners sur les TextEditingControllers au moment où
                // le dialog est démonté → crash _dependents.isEmpty.
                FocusScope.of(ctx).unfocus();
                Navigator.of(ctx)
                    .pop(_DiscoveredMode(name: name, channels: ch));
              },
              child: Text(l10n.gdtfAdd),
            ),
          ],
        );
      }),
    );

    // NB : on NE dispose PAS nameCtrl/channelsCtrl ici. Au moment où
    // showDialog résout, le widget AlertDialog est encore en cours
    // d'animation de fermeture et les TextField sont toujours abonnés aux
    // controllers — un dispose immédiat déclenche
    // "_dependents.isEmpty: is not true". Le GC s'en charge ; impact mémoire
    // négligeable (2 controllers par ajout de mode).
    if (result != null) {
      setState(() {
        _discoveredModes = [..._discoveredModes, result];
        // Auto-sélection du mode ajouté (sinon l'utilisateur doit cocher après).
        _selectedModeNames = {..._selectedModeNames, result.name};
        _extractError = '';
      });
    }
  }

  // Supprime un mode de la liste (uniquement utilisé pendant la saisie
  // manuelle : permet d'enlever une faute de frappe).
  void _removeMode(_DiscoveredMode mode) {
    setState(() {
      _discoveredModes = _discoveredModes.where((m) => m != mode).toList();
      _selectedModeNames.remove(mode.name);
    });
  }

  // Étape 2/2 : appelle le Worker en mode "extract" avec la liste des modes
  // sélectionnés par l'utilisateur. Reçoit le XML des canaux et passe à
  // l'écran de vérification (étape 2).
  Future<void> _extractSelectedModes() async {
    if (_selectedModeNames.isEmpty) {
      setState(() => _extractError =
          AppLocalizations.of(context).gdtfErrorSelectAtLeastOneMode);
      return;
    }
    if (_cachedPdfText.isEmpty) {
      setState(() =>
          _extractError = AppLocalizations.of(context).gdtfErrorManualDataLost);
      return;
    }
    setState(() {
      _isExtracting = true;
      _extractError = '';
    });
    try {
      final selectedList = _discoveredModes
          .where((m) => _selectedModeNames.contains(m.name))
          .map((m) => m.toJson())
          .toList();

      final response = await http
          .post(
            Uri.parse(_kWorkerUrl),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'fixture_name': _fixtureNameCtrl.text.trim(),
              'manufacturer': _manufacturerCtrl.text.trim(),
              'pdf_text': _cachedPdfText,
              'pdf_base64': _cachedPdfBase64,
              'action': 'extract',
              'selected_modes': selectedList,
            }),
          )
          // 10 minutes : couvre le worst-case du Worker (7 modes en parallèle,
          // chaque mode pouvant retry jusqu'à 3 fois × 180s = 9 min).
          .timeout(const Duration(seconds: 600));

      if (response.statusCode != 200) {
        String error =
            AppLocalizations.of(context).gdtfErrorStatus(response.statusCode);
        try {
          final decoded = jsonDecode(response.body) as Map;
          error = decoded['error'] as String? ?? error;
          // Si le worker retourne aussi un détail par mode, on l'ajoute.
          final errors = decoded['errors'];
          if (errors is List && errors.isNotEmpty) {
            final first = errors.first as Map;
            final modeName = first['mode'] ?? '?';
            final modeErr = first['error'] ?? '?';
            error = '$error\nDétail mode "$modeName" : $modeErr';
          }
        } catch (_) {}
        setState(() => _extractError = error);
        return;
      }

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      if (data['success'] != true) {
        setState(() => _extractError = data['error'] as String? ??
            AppLocalizations.of(context).gdtfUnknownError);
        return;
      }

      final xmlContent = data['xml'] as String;
      _dmxModes = _parseXmlToModes(xmlContent);

      // Récupère les warnings (modes qui ont échoué côté Worker malgré le retry).
      // On nettoie les messages d'erreur OpenAI verbeux (orga ID, JSON imbriqué).
      String shortenError(String raw) {
        var s = raw.trim();
        final orgIdx = s.indexOf(' in organization');
        if (orgIdx > 0) s = '${s.substring(0, orgIdx)} (rate limit)';
        final braceIdx = s.indexOf('{');
        if (braceIdx > 20) s = s.substring(0, braceIdx).trim();
        if (s.length > 140) s = '${s.substring(0, 140)}…';
        return s;
      }

      final rawWarnings = (data['warnings'] as List?) ?? const [];
      _extractWarnings = rawWarnings.map((w) {
        final m = w as Map<String, dynamic>;
        final rawErr = (m['error'] ??
                AppLocalizations.of(context).gdtfUnknownErrorLowercase)
            .toString();
        return '${m['mode']} (${m['channels']}ch) : ${shortenError(rawErr)}';
      }).toList();

      setState(() => _generateStep = 2);
    } catch (e) {
      setState(() => _extractError =
          AppLocalizations.of(context).gdtfErrorDetails(e.toString()));
    } finally {
      setState(() => _isExtracting = false);
    }
  }

  List<DmxMode> _parseXmlToModes(String xml) {
    final modes = <DmxMode>[];
    try {
      // Regex tolérant : si l'IA a tronqué (pas de </Mode>), on s'arrête au
      // prochain <Mode> ouvrant, au </Modes> de fin, ou à la fin de la chaîne.
      // Évite de tout perdre quand UN mode est tronqué — au pire ce mode-là
      // est incomplet, mais les autres modes sont parsés normalement.
      // Cas d'usage : Cobra où la discovery sous-estime le nb de canaux et
      // l'IA dépasse son budget tokens → sortie coupée mi-canal.
      final modeRegex =
          RegExp(r'<Mode>(.*?)(?=<Mode>|</Modes>|$)', dotAll: true);
      final modeNameRegex = RegExp(r'<ModeName>(.*?)</ModeName>');
      // Idem pour <Ch> : si le dernier canal n'a pas son </Ch>, on s'arrête
      // au prochain <Ch> ou à la fin du bloc.
      final chRegex =
          RegExp(r'<Ch>(.*?)(?=<Ch>|</Channels>|</Mode>|$)', dotAll: true);
      final numRegex = RegExp(r'<Num>(.*?)</Num>');
      final chanNameRegex = RegExp(r'<ChanName>(.*?)</ChanName>');
      final resRegex = RegExp(r'<Res>(.*?)</Res>');
      final funcRegex = RegExp(r'<Func>(.*?)</Func>');

      for (final modeMatch in modeRegex.allMatches(xml)) {
        final modeContent = modeMatch.group(1) ?? '';
        final modeName =
            modeNameRegex.firstMatch(modeContent)?.group(1)?.trim() ?? 'Mode';
        final channels = <DmxChannel>[];

        for (final chMatch in chRegex.allMatches(modeContent)) {
          final ch = chMatch.group(1) ?? '';
          final number =
              int.tryParse(numRegex.firstMatch(ch)?.group(1)?.trim() ?? '') ??
                  (channels.length + 1);
          final name = chanNameRegex.firstMatch(ch)?.group(1)?.trim() ??
              'Ch${channels.length + 1}';
          final resolution =
              resRegex.firstMatch(ch)?.group(1)?.trim() ?? '8bit';
          final function = funcRegex.firstMatch(ch)?.group(1)?.trim() ?? '';
          final def = _defaultForName(name);
          channels.add(DmxChannel(
              number: number,
              name: name,
              function: function,
              resolution: resolution,
              defaultValue: def));
        }

        if (channels.isNotEmpty) {
          modes.add(DmxMode(name: modeName, channels: channels));
        }
      }
    } catch (e) {
      debugPrint('Parse XML error: $e');
    }

    if (modes.isEmpty) {
      modes.add(DmxMode(name: 'Mode 1', channels: [
        DmxChannel(number: 1, name: 'Dimmer', function: 'Intensity 0-255'),
      ]));
    }
    return modes;
  }

  Future<void> _generateGdtf() async {
    setState(() {
      _isGenerating = true;
      _generateError = '';
    });
    try {
      final fixtureName = _fixtureNameCtrl.text.trim();
      final manufacturer = _manufacturerCtrl.text.trim();
      final xml = _buildXmlFromModes(manufacturer, fixtureName, _dmxModes);
      final xmlBytes = Uint8List.fromList(utf8.encode(xml));
      final gdtfBytes = _encodeStoredZip([
        _StoredZipFile('description.xml', xmlBytes),
      ]);
      final fileName = _gdtfFileName(
        manufacturer: manufacturer,
        fixtureName: fixtureName,
      );
      final filePath = await _writePersistentGdtfFile(
        fileName: fileName,
        bytes: gdtfBytes,
      );
      setState(() {
        _generateSuccess = fileName;
        _generateFilePath = filePath;
        _generateStep = 3;
      });
      await _shareGdtfFile(
        filePath: filePath,
        subject: fileName,
      );
    } catch (e) {
      setState(() => _generateError =
          AppLocalizations.of(context).gdtfErrorDetails(e.toString()));
    } finally {
      setState(() => _isGenerating = false);
    }
  }

  String _buildXmlFromModes(
      String manufacturer, String fixtureName, List<DmxMode> modes) {
    final safeManufacturer = _cleanXmlText(
        manufacturer.trim().isEmpty ? 'Generated' : manufacturer.trim());
    final safeFixtureName = _cleanXmlText(
        fixtureName.trim().isEmpty ? 'Untitled fixture' : fixtureName.trim());
    final fixtureTypeId = _generateUuid().toUpperCase();
    final builder = XmlBuilder();

    builder.processing('xml', 'version="1.0" encoding="UTF-8" standalone="no"');

    builder.element('GDTF', attributes: {'DataVersion': '1.2'}, nest: () {
      builder.element('FixtureType', attributes: {
        'CanHaveChildren': 'No',
        'Description': safeFixtureName,
        'FixtureTypeID': fixtureTypeId,
        'LongName': safeFixtureName,
        'Manufacturer': safeManufacturer,
        'Name': safeFixtureName,
        'RefFT': '',
        'ShortName': _shortNameFromFixture(safeFixtureName),
        'Thumbnail': '',
        'ThumbnailOffsetX': '0',
        'ThumbnailOffsetY': '0',
      }, nest: () {
        // On analyse chaque mode UNE FOIS : multi-pixel ou flat, breaks, etc.
        // Les analyses sont passées telles quelles aux writers Geometry et
        // DMXMode pour rester cohérents.
        final analyses = modes.map(_analyzeMode).toList();
        _writeAttributeDefinitions(builder);
        _writeWheels(builder);
        _writePhysicalDescriptions(builder);
        _writeModels(builder);
        _writeGeometries(builder, analyses);
        _writeDmxModes(builder, analyses);
        builder.element('Revisions', nest: () {
          builder.element('Revision', attributes: {
            'Text':
                'Generated by ShowTech Tools - GDTF Share Strict V12 - Stored ZIP for MA3 - MA3 filename revision',
            'Date': DateTime.now().toUtc().toIso8601String().split('.').first,
            'UserID': 'ShowTech Tools',
          });
        });
        builder.element('FTPresets', nest: () {});
        builder.element('Protocols', nest: () {});
      });
    });

    return builder.buildDocument().toXmlString(pretty: true, indent: '  ');
  }

  void _writeAttributeDefinitions(XmlBuilder builder) {
    builder.element('AttributeDefinitions', nest: () {
      // ActivationGroups : on prend les uniques rencontrés dans _kGdtfAttributes.
      final groups = <String>{};
      for (final a in _kGdtfAttributes) {
        if (a.activationGroup != null) groups.add(a.activationGroup!);
      }
      builder.element('ActivationGroups', nest: () {
        for (final name in groups.toList()..sort()) {
          builder.element('ActivationGroup', attributes: {'Name': name});
        }
      });

      // FeatureGroups : on déduit les Features uniques (ex: "Color.RGB" → groupe
      // "Color" avec feature "RGB"). Émis dans l'ordre standard MA3.
      final featurePaths = <String>{};
      for (final a in _kGdtfAttributes) {
        featurePaths.add(a.feature);
      }
      final byGroup = <String, Set<String>>{};
      for (final path in featurePaths) {
        final parts = path.split('.');
        if (parts.length == 2) {
          byGroup.putIfAbsent(parts[0], () => <String>{}).add(parts[1]);
        }
      }
      builder.element('FeatureGroups', nest: () {
        // Ordre canonique MA3.
        const order = [
          'Dimmer',
          'Position',
          'Gobo',
          'Color',
          'Beam',
          'Focus',
          'Control',
          'Shapers',
          'Video',
        ];
        for (final groupName in order) {
          final features = byGroup[groupName];
          if (features == null) continue;
          builder.element('FeatureGroup', attributes: {
            'Name': groupName,
            'Pretty': groupName,
          }, nest: () {
            for (final f in features.toList()..sort()) {
              builder.element('Feature', attributes: {'Name': f});
            }
          });
        }
      });

      // Attributes : itération sur la table _kGdtfAttributes.
      builder.element('Attributes', nest: () {
        for (final a in _kGdtfAttributes) {
          final attrs = <String, String>{
            'Name': a.name,
            'Pretty': a.pretty ?? a.name,
            'Feature': a.feature,
            'PhysicalUnit': a.physicalUnit,
          };
          if (a.activationGroup != null) {
            attrs['ActivationGroup'] = a.activationGroup!;
          }
          if (a.mainAttribute != null) {
            attrs['MainAttribute'] = a.mainAttribute!;
          }
          builder.element('Attribute', attributes: attrs);
        }
      });
    });
  }

  void _writeWheels(XmlBuilder builder) {
    builder.element('Wheels', nest: () {
      builder.element('Wheel', attributes: {'Name': 'ColorWheel1'}, nest: () {
        void slot(String name, String color) {
          builder.element('Slot', attributes: {
            'Name': name,
            'Color': color,
            'MediaFileName': '',
          });
        }

        slot('Open', '1.000000,1.000000,1.000000');
        slot('Red', '1.000000,0.000000,0.000000');
        slot('Green', '0.000000,1.000000,0.000000');
        slot('Blue', '0.000000,0.000000,1.000000');
        slot('White', '1.000000,1.000000,1.000000');
        slot('Amber', '1.000000,0.450000,0.000000');
        slot('UV', '0.400000,0.000000,1.000000');
      });
      builder.element('Wheel', attributes: {'Name': 'GoboWheel1'}, nest: () {
        builder.element('Slot', attributes: {
          'Name': 'Open',
          'MediaFileName': '',
        });
      });
    });
  }

  void _writePhysicalDescriptions(XmlBuilder builder) {
    builder.element('PhysicalDescriptions', nest: () {
      builder.element('ColorSpace', attributes: {
        'Mode': 'sRGB',
        'Name': '',
      });
      builder.element('AdditionalColorSpaces', nest: () {});
      builder.element('Gamuts', nest: () {});
      builder.element('Filters', nest: () {});
      builder.element('Emitters', nest: () {});
      builder.element('DMXProfiles', nest: () {});
      builder.element('CRIs', nest: () {});
      builder.element('Connectors', nest: () {});
      builder.element('Properties', nest: () {
        builder.element('OperatingTemperature', attributes: {
          'Low': '-20.000000',
          'High': '45.000000',
        });
        builder.element('Weight', attributes: {'Value': '0.000000'});
      });
    });
  }

  void _writeModels(XmlBuilder builder) {
    builder.element('Models', nest: () {
      void model(String name, String primitiveType, String length, String width,
          String height) {
        builder.element('Model', attributes: {
          'Name': name,
          'PrimitiveType': primitiveType,
          'Length': length,
          'Width': width,
          'Height': height,
          'File': '',
          'SVGOffsetX': '0.000000',
          'SVGOffsetY': '0.000000',
          'SVGSideOffsetX': '0.000000',
          'SVGSideOffsetY': '0.000000',
          'SVGFrontOffsetX': '0.000000',
          'SVGFrontOffsetY': '0.000000',
        });
      }

      // Noms simples ("Beam", "Yoke", "Head") pour matcher la convention du
      // X4 Bar de référence. MA3 utilise ces noms-là pour ses heuristiques
      // (reconnaissance du module multiplicateur dans GeometryReference).
      // Pas de "Base" : le mode base utilise une Geometry SANS Model attribute.
      model('Yoke', 'Yoke', '0.350000', '0.120000', '0.420000');
      model('Head', 'Cylinder', '0.300000', '0.300000', '0.220000');
      model('Beam', 'Cylinder', '0.060000', '0.060000', '0.060000');
    });
  }

  void _writeGeometries(XmlBuilder builder, List<_ModeAnalysis> analyses) {
    // On émet :
    //   - une Geometry Base PAR MODE, qui contient yoke/head + soit un Beam
    //     unique (mode flat) soit N GeometryReferences (mode multi-pixel).
    //   - une Geometry Pixel partagée à plat, qui contient le Beam du module
    //     (référencée par les GeometryReference de chaque mode multi-pixel).

    void writeBeamElement(String name) {
      builder.element('Beam', attributes: {
        'Name': name,
        'Model': 'Beam',
        'Position': _matrix(),
        'LampType': 'LED',
        'PowerConsumption': '150.000000',
        'LuminousFlux': '1500.000000',
        'ColorTemperature': '6500.000000',
        'BeamAngle': '25.000000',
        'FieldAngle': '35.000000',
        'BeamRadius': '0.050000',
        'BeamType': 'Wash',
        'ColorRenderingIndex': '80',
        'RectangleRatio': '1.000000',
        'ThrowRatio': '1.000000',
      });
    }

    builder.element('Geometries', nest: () {
      for (final analysis in analyses) {
        // Mode base : pas d'attribut Model (comme dans le X4 Bar officiel).
        builder.element('Geometry', attributes: {
          'Name': analysis.baseGeometryName,
          'Position': _matrix(),
        }, nest: () {
          // Structure classique Base > Yoke > Head, comme la référence X4 Bar.
          builder.element('Axis', attributes: {
            'Name': analysis.yokeGeometryName,
            'Model': 'Yoke',
            'Position': _matrix(),
          }, nest: () {
            builder.element('Axis', attributes: {
              'Name': analysis.headGeometryName,
              'Model': 'Head',
              'Position': _matrix(),
            }, nest: () {
              if (analysis.isMultiPixel) {
                // Émet un vrai <Beam Name="Pixel N" .../> pour chaque cellule.
                //
                // L'ancienne approche utilisait des <GeometryReference> avec
                // des Break/DMXOffset — ce que les parseurs GDTF (MA3, Capture…)
                // n'acceptent pas comme cible valide de DMXChannel.Geometry.
                // Résultat : footprint calculé = canaux master seulement,
                // cellules pixel totalement ignorées à l'import.
                //
                // Avec de vrais <Beam>, chaque "Pixel N" est une géométrie
                // adressable, et DMXChannel.Geometry="Pixel N" est reconnu
                // par tous les consommateurs GDTF.
                for (final inst in analysis.instanceNumbers) {
                  writeBeamElement('Pixel $inst');
                }
              } else {
                writeBeamElement(analysis.beamGeometryName);
              }
            });
            // Sous-géométries (Base_Control1_2/_3/…) — placées sous YOKE comme
            // dans v16. Indispensables pour différencier plusieurs LogicalChannels
            // de même Attribute (sinon MA3 ne charge pas la fixture). C'est
            // une étape intermédiaire — l'utilisateur verra ces sub-geometries
            // comme des entrées 1.2/1.3/… dans le patch, qu'on peaufinera après.
            for (final subName in analysis.extraSubGeometries) {
              final subModel = _modelForSubGeometry(subName);
              final attrs = <String, String>{
                'Name': subName,
                'Position': _matrix(),
              };
              if (subModel != null) attrs['Model'] = subModel;
              builder.element('Geometry', attributes: attrs);
            }
          });
        });
      }

      // Le Beam template top-level n'est plus nécessaire : chaque cellule
      // est maintenant un vrai <Beam Name="Pixel N"> dans l'arbre de la
      // géométrie, plus de GeometryReference + template partagé.
    });
  }

  String _ma3ModeName(String input) {
    // Avant on extrayait le premier nombre du nom et on le suffixait par "ch"
    // — sympa pour "Normal Mode (34 channels)" → "34ch", mais catastrophe pour
    // les manuels Astera type "1: RGB" / "4: DIM RGB" où le nombre est un
    // numéro de profil, pas un nombre de canaux. On affichait alors "1ch" /
    // "4ch" avec un footprint DMX qui ne correspondait pas.
    //
    // Maintenant on garde le nom complet du mode, juste nettoyé pour respecter
    // les contraintes de noms GDTF (alphanum + espace + tiret).
    var s = input
        .replaceAll(':', ' ')
        .replaceAll(RegExp(r'[^A-Za-z0-9 \-]'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
    if (s.isEmpty) return 'Mode';
    // Plafond pour rester lisible dans les colonnes de console (MA3 etc).
    if (s.length > 60) s = s.substring(0, 60).trim();
    return s;
  }

  void _writeDmxModes(XmlBuilder builder, List<_ModeAnalysis> analyses) {
    builder.element('DMXModes', nest: () {
      for (final analysis in analyses) {
        // Capture tous les DMXChannel réellement écrits pour ce mode, afin
        // de pouvoir lier ensuite chaque Dimmer virtuel (Offset="None") aux
        // canaux ColorAdd_* réels de sa géométrie via <Relations>.
        final written = <_WrittenChannel>[];
        builder.element('DMXMode', attributes: {
          'Description': '',
          'Name': _ma3ModeName(analysis.mode.name),
          'Geometry': analysis.baseGeometryName,
        }, nest: () {
          builder.element('DMXChannels', nest: () {
            // 1) Canaux master avec leur géométrie pré-résolue et leur
            //    offset absolu (commun aux deux branches : flat et multi-pixel).
            for (final m in analysis.masterResolved) {
              _writeOneDmxChannel(
                builder,
                m.channel,
                geometry: m.geometry,
                offset: m.offset,
                attributeOverride: m.attributeOverride,
                written: written,
              );
            }
            // 2) Si multi-pixel : canaux EXPLICITES pour chaque pixel,
            //    avec Geometry="Pixel N" et offset ABSOLU calculé depuis
            //    le breakOffsetForInstance de chaque instance.
            //
            //    L'ancienne approche (un seul bloc Geometry="Beam", offsets
            //    relatifs 1,2,3…) entrait en collision avec les canaux master
            //    qui occupent déjà ces offsets dans le même DMXBreak="1".
            //    MA3 et les autres consoles ne pouvaient pas résoudre les
            //    cellules → elles étaient ignorées à l'import.
            //
            //    La nouvelle approche génère des DMXChannels individuels par
            //    cellule, cohérents avec les vrais <Beam Name="Pixel N">
            //    définis dans la section Geometries, ce que tous les
            //    consommateurs GDTF (MA3, Capture, grandMA3…) reconnaissent.
            if (analysis.isMultiPixel) {
              for (final inst in analysis.instanceNumbers) {
                final pixelStart =
                    analysis.breakOffsetForInstance[inst] ?? 1;
                var relativeOffset = 0;
                for (final ec in analysis.moduleTemplate) {
                  final String off;
                  if (ec.isVirtualDimmer) {
                    off = 'None';
                  } else {
                    relativeOffset += 1;
                    off = '${pixelStart + relativeOffset - 1}';
                  }
                  _writeOneDmxChannel(
                    builder,
                    ec,
                    geometry: 'Pixel $inst',
                    offset: off,
                    written: written,
                  );
                }
              }
            }
          });
          // 3) Relations : indispensable pour tout DMXChannel Offset="None"
          //    (nos Dimmer virtuels RGB→Dim). Sans <Relation>, un logiciel
          //    comme Vectorworks n'a aucun moyen de savoir que ce canal est
          //    purement logique — il le compte comme un vrai canal DMX et le
          //    footprint / la patch réelle se retrouvent faussés.
          _writeRelations(builder, written);
        });
      }
    });
  }

  // Construit <Relations> à partir des canaux effectivement écrits pour un
  // mode : chaque Dimmer virtuel (isVirtualDimmer) devient Master d'une
  // Relation Type="Multiply" vers chaque canal ColorAdd_* réel partageant sa
  // géométrie (même Beam en mode flat, même "Pixel N" en multi-pixel).
  // Conforme à l'exemple officiel de la spec GDTF (DMX Mode Collect §Relation
  // Collect) : Master/Follower sont des Node vers, respectivement, le
  // DMXChannel ("Geometry_Attribute") et la ChannelFunction complète
  // ("Geometry_Attribute.Attribute.FunctionName").
  void _writeRelations(XmlBuilder builder, List<_WrittenChannel> written) {
    builder.element('Relations', nest: () {
      // Restreint aux Dimmer virtuels (le seul cas que l'app synthétise
      // aujourd'hui) : si un futur canal Offset="None" d'un autre attribut
      // apparaissait, on ne veut pas lui inventer une Relation Multiply.
      final virtualDimmers =
          written.where((w) => w.isVirtualDimmer && w.attribute == 'Dimmer');
      var counter = 0;
      for (final master in virtualDimmers) {
        final followers = written.where((w) =>
            !w.isVirtualDimmer &&
            w.geometry == master.geometry &&
            w.attribute.startsWith('ColorAdd_'));
        for (final follower in followers) {
          counter++;
          builder.element('Relation', attributes: {
            'Name': 'VirtualDimmer$counter',
            'Master': '${master.geometry}_${master.attribute}',
            'Follower':
                '${follower.geometry}_${follower.attribute}.${follower.attribute}.${follower.functionName}',
            'Type': 'Multiply',
          });
        }
      }
    });
  }

  // Émission d'un seul <DMXChannel> avec son LogicalChannel et ChannelFunction.
  // La géométrie cible et l'offset sont fournis directement par l'analyse —
  // plus de logique de résolution embarquée ici.
  void _writeOneDmxChannel(
    XmlBuilder builder,
    _ExportChannel ec, {
    required String geometry,
    required String offset,
    String? attributeOverride,
    List<_WrittenChannel>? written,
  }) {
    // L'attribute override permet de rotater Control1 → Control2 → Control3
    // quand plusieurs canaux génériques tombent sur la même géométrie (cf.
    // _analyzeMode pour les modes multi-pixel).
    final attribute = attributeOverride ?? _mapGdtfAttribute(ec.source.name);
    final functionName = _functionNameForChannel(ec.source, attribute);
    final logicalName = '${geometry}_$attribute';
    final offsetValue = offset;
    final isVirtual = ec.isVirtualDimmer || offsetValue == 'None';
    written?.add(_WrittenChannel(
      geometry: geometry,
      attribute: attribute,
      functionName: functionName,
      isVirtualDimmer: isVirtual,
    ));

    // Détecte la résolution effective du canal.
    //   - Canal 16-bit fusionné (ex: Offset="1,2") → résolution "/2", valeurs sur 16 bits
    //   - Canal 8-bit simple                       → résolution "/1", valeurs sur 8 bits
    //   - Canal virtuel (Offset="None")            → toujours 8-bit
    // C'est essentiel : MA3 utilise DMXFrom et Default pour déterminer la
    // taille réelle d'un canal. Si on déclare Offset="1,2" mais DMXFrom="0/1",
    // MA3 considère le canal comme 8-bit malgré l'offset, ce qui décale
    // toute la lecture de la mode et fausse le footprint final.
    final is16Bit = !isVirtual && (ec.is16Bit || offsetValue.contains(','));
    final resolutionSuffix = is16Bit ? '/2' : '/1';
    // Default value en 8-bit (0-255) ou 16-bit (0-65535). En 16-bit on cherche
    // la valeur ENTIÈRE qui correspond exactement au % désiré — sinon MA3
    // affichera 50.198% au lieu de 50%, ce qui est visible sur les encodeurs.
    //   - 50%  16-bit → 32768 (et non 128*257 = 32896)
    //   - 100% 16-bit → 65535 (et non 255*257 = 65535, OK pour le max)
    final defaultValue = isVirtual
        ? (is16Bit ? 65535 : 255)
        : _defaultDmxValue(attribute, ec.source.name, is16Bit);
    final highlightRaw = _highlightValueForAttribute(attribute);
    // Highlight 16-bit : on tape pile sur 32768 pour Pan/Tilt (50%) plutôt
    // que 128*257 = 32896 qui décalerait l'encodeur de 0.198%.
    int? highlight16(int? raw) {
      if (raw == null) return null;
      if (raw == 128) return 32768; // 50% pile
      if (raw == 255) return 65535; // 100% pile
      return raw * 257;
    }

    final highlightAttr = highlightRaw == null
        ? 'None'
        : '${is16Bit ? highlight16(highlightRaw) : highlightRaw}$resolutionSuffix';

    builder.element('DMXChannel', attributes: {
      'DMXBreak': '1',
      'Geometry': geometry,
      'Highlight': highlightAttr,
      'InitialFunction': '$logicalName.$attribute.$functionName',
      'Offset': offsetValue,
    }, nest: () {
      builder.element('LogicalChannel', attributes: {
        'Attribute': attribute,
        'Master': _masterForAttribute(attribute),
        'MibFade': '0.000000',
        'DMXChangeTimeLimit': '0.000000',
        'Snap': _snapForAttribute(attribute),
      }, nest: () {
        final wheel = _wheelForAttribute(attribute);
        final attrs = <String, String>{
          'Name': functionName,
          'Attribute': attribute,
          'CustomName': '',
          'OriginalAttribute': '',
          'DMXFrom': '0$resolutionSuffix',
          'Default': '$defaultValue$resolutionSuffix',
          'Min': '0.000000',
          'Max': '1.000000',
          'PhysicalFrom': _physicalFromForAttribute(attribute),
          'PhysicalTo': _physicalToForAttribute(attribute),
          'RealFade': '0.000000',
          'RealAcceleration': '0.000000',
          'Wheel': wheel,
          'Emitter': '',
          'Filter': '',
          'ModeMaster': '',
          'ModeFrom': '0/1',
          'ModeTo': '0/1',
        };
        builder.element('ChannelFunction', attributes: attrs, nest: () {
          _writeChannelSets(builder, ec.source, attribute, is16Bit);
        });
      });
    });
  }

  void _writeChannelSets(
      XmlBuilder builder, DmxChannel channel, String attribute, bool is16Bit) {
    // Deux politiques (cf. _shouldForceDefaultSets) :
    //   - FORCE defaults : Pan/Tilt/Dim/Color/Zoom/Focus/CTO/MSpeed/etc. —
    //     toujours Min/Max(/Home), même si le manuel a fourni des sets parasites
    //     ("Green", "Tilt Coarse", "Intensity", "0 2 Seconds Transition Time").
    //   - MANUAL or nothing : Control/Reset/LampControl/Modes/Shutter/wheels —
    //     on garde ce que le manuel a extrait. Si manuel vide → AUCUN
    //     ChannelSet émis (un canal sans set est valide GDTF, MA3 le gère).
    final bool forceDefaults = _shouldForceDefaultSets(attribute);
    final List<_ChannelSet> normalized;
    final bool fromManual;
    if (forceDefaults) {
      normalized = _defaultChannelSets(channel.name, attribute, is16Bit);
      fromManual = false;
    } else {
      final parsed = _parseChannelSets(channel.function, attribute);
      // Pour Control/Reset/Mode/Effects/etc. : un seul set est presque toujours
      // la description verbeuse du paramètre ("See Special Features Below",
      // "0 2 Seconds Transition Time"). On exige au moins 2 sets pour
      // accepter — sinon le manuel n'a vraiment fourni que du parasite.
      // Pour Shutter/wheels/gobos : 1 set suffit (peut être juste "Open"
      // ou un slot unique).
      final minRequired = _requiresMultipleSets(attribute) ? 2 : 1;
      if (parsed.length < minRequired) {
        return; // pas assez de sets utiles → rien d'émis
      }
      normalized = parsed;
      fromManual = true;
    }
    // Les sets venant du manuel sont en 8-bit (max 255), on les scale.
    // Les sets DÉFAUT sont retournés à la résolution effective — on ne les
    // re-scale pas (sinon Pan/Tilt Home 128*257=32896 ≠ 32768 = 50% pile).
    final unique = <int, _ChannelSet>{};

    for (final set in normalized) {
      final from =
          fromManual && is16Bit ? _scale8BitTo16Bit(set.from) : set.from;
      final to = fromManual && is16Bit ? _scale8BitTo16Bit(set.to) : set.to;
      // _cleanChannelSetName normalise les noms verbeux du manuel (ex:
      // "Color Mixing System Red" → "Red") ET force le nom de la couleur
      // pour les ColorAdd_*. Quand les sets viennent de nos DÉFAUTS
      // (Min/Max/Home/0%/100%/Closed/Open), ils sont déjà propres et
      // doivent passer tels quels — sinon "Min" pour ColorAdd_G se fait
      // renommer en "Green", ce qu'on ne veut surtout PAS.
      final cleanedName =
          fromManual ? _cleanChannelSetName(set.name, attribute) : set.name;
      unique[from] = _ChannelSet(
        from: from,
        to: to,
        name: cleanedName,
      );
    }

    final sorted = unique.values.toList()
      ..sort((a, b) => a.from.compareTo(b.from));

    final resSuffix = is16Bit ? '/2' : '/1';
    final maxDmx = is16Bit ? 65535 : 255;
    for (var i = 0; i < sorted.length; i++) {
      final set = sorted[i];
      // PhysicalTo doit refléter l'étendue RÉELLE du ChannelSet : la limite
      // haute est implicitement le DMX juste avant le SET SUIVANT (et le
      // dernier set va jusqu'à maxDmx).
      //
      // Sans ce calcul, un ChannelSet "0%" déclaré comme un point
      // (from=to=0) couvrait DMX 0-254 mais avec PhysicalFrom=PhysicalTo=0
      // → physique restait à 0 partout, puis sautait à 100% au DMX 255.
      // Marche d'escalier flagrante sur le dimmer.
      //
      // Avec le fix : "0%" → PhysicalFrom=0 PhysicalTo=254/255 → interpolation
      // linéaire 0 à 0.996 sur DMX 0-254, puis "100%" au DMX 255.
      final effectiveTo =
          (i + 1 < sorted.length) ? (sorted[i + 1].from - 1) : maxDmx;
      final attrs = <String, String>{
        'DMXFrom': '${set.from}$resSuffix',
        'Name': _gdtfName(set.name, fallback: _defaultSetName(attribute)),
        'PhysicalFrom': _physicalFromForSet(attribute, set.from, is16Bit),
        'PhysicalTo': _physicalToForSet(attribute, effectiveTo, is16Bit),
      };
      final slot = _wheelSlotIndexForSet(attribute, set.name);
      if (slot.isNotEmpty) {
        attrs['WheelSlotIndex'] = slot;
      }
      builder.element('ChannelSet', attributes: attrs);
    }
  }

  List<_ExportChannel> _prepareExportChannels(List<DmxChannel> channels) {
    final result = <_ExportChannel>[];

    for (var i = 0; i < channels.length; i++) {
      final current = channels[i];
      if (_isFineChannel(current) && result.isNotEmpty) {
        final previous = result.last;
        if (_sameCoarseFineAttribute(previous.source, current)) {
          previous.offset = '${previous.offset},${current.number}';
          previous.is16Bit = true;
          continue;
        }
      }

      result.add(_ExportChannel(
        source: current,
        offset: current.number.toString(),
        is16Bit: current.resolution.toLowerCase().contains('16'),
      ));
    }

    return result;
  }

  bool _isFineChannel(DmxChannel channel) {
    final compact = _compact(channel.name);
    final rawName = channel.name.toLowerCase().trim();
    // Détecte un canal "fine" (= 2nd d'une paire 16-bit) par :
    //   - son nom contient "fine", "lsb", "16bit" (mots sans ambiguïté)
    //   - son nom se termine par un séparateur + "low" (ex: "Tilt - Low",
    //     "Pan Low"). On exige le séparateur pour ne pas attraper "Slow"
    //     ou tout autre mot finissant en -low.
    //   - sa résolution est "16bit-fine"
    final hasUnambiguous = compact.contains('fine') ||
        compact.contains('lsb') ||
        compact.contains('16bit');
    final endsWithLow = RegExp(r'(?:^|[\s\-_/])low\s*$').hasMatch(rawName);
    return hasUnambiguous ||
        endsWithLow ||
        channel.resolution.toLowerCase().contains('fine');
  }

  bool _sameCoarseFineAttribute(DmxChannel coarse, DmxChannel fine) {
    // On dépouille le coarse et le fine de tous les marqueurs de précision
    // pour comparer les noms "purs". Ex: "tilthigh" vs "tiltlow" → "tilt" vs "tilt".
    String stripPrecisionWords(String c) {
      return c
          .replaceAll('fine', '')
          .replaceAll('lsb', '')
          .replaceAll('msb', '')
          .replaceAll('high', '')
          .replaceAll('low', '')
          .replaceAll('16bit', '')
          .replaceAll('8bit', '');
    }

    final coarseName = stripPrecisionWords(_compact(coarse.name));
    final fineName = stripPrecisionWords(_compact(fine.name));
    if (coarseName.isNotEmpty && coarseName == fineName) {
      return true;
    }
    return _mapGdtfAttribute(coarse.name) == _mapGdtfAttribute(fine.name);
  }

  // Parseur générique : extrait à la fois l'attribut couleur GDTF (si présent)
  // ET le numéro d'instance (pixel/section/set/cell/head/zone/segment/module/group)
  // depuis un nom de canal.
  //
  // Reconnaît au moins ces formats :
  //   - Red 1, R1, Red12, Cyan 3, Lime 5, WW 7, CW 2  (couleur+numéro collés)
  //   - 1 Red, 12 Red  (numéro+couleur)
  //   - Set 1 Red, Section 1 Red, Pixel 1 Red, Cell 1 Red, Head 1 Pan
  //   - Red Set 1, Red Section 1, Red Pixel 1, rouge (section 1)
  //   - Pixel 1 Red, Pixel 1 R, Pixel 1 Dimmer
  //   - Set 1 Intensity, Set 1 Strobe  (instance sans couleur)
  //
  // Rejette correctement :
  //   - Pixel Select 1-8  (mot non-numérique entre keyword et nombre)
  //   - Color Macro, Pan, Strobe, Dimmer global
  ({String? colorAttribute, int? instance}) _parseColorAndInstance(
      String name) {
    final compact = _compact(name);
    if (compact.isEmpty) return (colorAttribute: null, instance: null);

    // 1) Cherche d'abord un mot-couleur complet.
    //    Ordre important : tokens longs en premier (warmwhite avant white,
    //    royalblue avant blue), pour éviter qu'un token court accroche par erreur.
    String? colorAttr;
    int colorStart = -1;
    int colorEnd = -1;
    for (final entry in _kColorTokensLong) {
      final idx = compact.indexOf(entry.$1);
      if (idx >= 0) {
        colorAttr = entry.$2;
        colorStart = idx;
        colorEnd = idx + entry.$1.length;
        break;
      }
    }

    // 2) Si aucun mot-couleur complet, tente les abréviations
    //    (r/g/b/w/a/uv/ww/cw/c/m/y/l) mais uniquement si elles sont collées à
    //    un nombre ou en frontière de chaîne, pour éviter les faux positifs
    //    ('r' dans 'reset', 'l' dans 'pixel'…).
    if (colorAttr == null) {
      for (final entry in _kColorTokensShort) {
        final escaped = RegExp.escape(entry.$1);
        final pattern = RegExp('(^|\\d)$escaped(\\d|\$)');
        final m = pattern.firstMatch(compact);
        if (m != null) {
          colorAttr = entry.$2;
          final prefixLen = (m.group(1) ?? '').length;
          colorStart = m.start + prefixLen;
          colorEnd = colorStart + entry.$1.length;
          break;
        }
      }
    }

    // 3) Cherche un numéro d'instance.
    //    Stratégie A : nombre collé au token couleur (avant ou après).
    int? instance;
    if (colorAttr != null) {
      final afterColor = compact.substring(colorEnd);
      final mAfter = RegExp(r'^(\d{1,3})').firstMatch(afterColor);
      if (mAfter != null) {
        instance = int.tryParse(mAfter.group(1)!);
      } else {
        final beforeColor = compact.substring(0, colorStart);
        final mBefore = RegExp(r'(\d{1,3})$').firstMatch(beforeColor);
        if (mBefore != null) {
          instance = int.tryParse(mBefore.group(1)!);
        }
      }
    }

    // Stratégie B : mot-clé d'instance suivi immédiatement d'un nombre.
    //   "Set 1 Red"         → 'set' à 0, après 'set' = '1red' → match '1'.
    //   "rouge (section 1)" → 'section' suivi de '1'.
    //   "Pixel Select 1-8"  → après 'pixel' = 'select18' → pas de digit en tête → rejeté ✓.
    if (instance == null) {
      for (final kw in _kInstanceKeywords) {
        final idx = compact.indexOf(kw);
        if (idx < 0) continue;
        final after = compact.substring(idx + kw.length);
        final m = RegExp(r'^(\d{1,3})').firstMatch(after);
        if (m != null) {
          instance = int.tryParse(m.group(1)!);
          break;
        }
      }
    }

    if (instance != null && instance <= 0) instance = null;
    return (colorAttribute: colorAttr, instance: instance);
  }

  String _mapGdtfAttribute(String name) {
    // 1) Détection « générique » via le nouveau parseur : reconnaît n'importe
    //    quelle combinaison couleur+instance (Set 1 Red, rouge (section 1),
    //    Cyan 12, R1, etc.) sans dépendre du format exact.
    final parsed = _parseColorAndInstance(name);
    if (parsed.colorAttribute != null) {
      return parsed.colorAttribute!;
    }

    // 2) Filet de sécurité : regex historiques (au cas où le nouveau parseur
    //    raterait un format qu'on aurait oublié).
    final compact = _compact(name);

    if (RegExp(r'^(r|red|rouge)(?:pixel|pix|zone|cell|segment|led)?\d{1,3}$')
        .hasMatch(compact)) {
      return 'ColorAdd_R';
    }
    if (RegExp(r'^(v|vert|green|g)(?:pixel|pix|zone|cell|segment|led)?\d{1,3}$')
        .hasMatch(compact)) {
      return 'ColorAdd_G';
    }
    if (RegExp(r'^(b|blue|bleu)(?:pixel|pix|zone|cell|segment|led)?\d{1,3}$')
        .hasMatch(compact)) {
      return 'ColorAdd_B';
    }
    if (RegExp(r'^(w|white|blanc)(?:pixel|pix|zone|cell|segment|led)?\d{1,3}$')
        .hasMatch(compact)) {
      return 'ColorAdd_W';
    }
    if (RegExp(r'^(a|amber|ambre)(?:pixel|pix|zone|cell|segment|led)?\d{1,3}$')
        .hasMatch(compact)) {
      return 'ColorAdd_A';
    }
    if (RegExp(
            r'^(u|uv|ultraviolet)(?:pixel|pix|zone|cell|segment|led)?\d{1,3}$')
        .hasMatch(compact)) {
      return 'ColorAdd_UV';
    }

    if (compact.contains('dimmermode') ||
        compact.contains('dimmercurve') ||
        compact.contains('dimmingcurve') ||
        compact.contains('dimcurve') ||
        compact.contains('dimresponse') ||
        compact.contains('blindermode')) {
      return 'Control1';
    }
    if (compact.contains('dimmerspeed') || compact.contains('dimmerrate')) {
      return 'Effects1Rate';
    }
    if (compact.contains('dimmer') || compact.contains('intensity')) {
      return 'Dimmer';
    }
    if (compact == 'red' || compact == 'r' || compact == 'rouge') {
      return 'ColorAdd_R';
    }
    if (compact == 'green' ||
        compact == 'g' ||
        compact == 'v' ||
        compact == 'vert') {
      return 'ColorAdd_G';
    }
    if (compact == 'blue' || compact == 'b' || compact == 'bleu') {
      return 'ColorAdd_B';
    }
    if (compact == 'white' || compact == 'w' || compact == 'blanc') {
      return 'ColorAdd_W';
    }
    if (compact == 'a' ||
        compact.contains('amber') ||
        compact.contains('ambre')) {
      return 'ColorAdd_A';
    }
    if (compact == 'u' ||
        compact.contains('uv') ||
        compact.contains('ultraviolet')) {
      return 'ColorAdd_UV';
    }
    // LIME
    if (compact == 'l' || compact.contains('lime')) {
      return 'ColorAdd_Lime';
    }

// CYAN
    if (compact == 'c' || compact.contains('cyan')) {
      return 'ColorAdd_C';
    }

// MAGENTA
    if (compact == 'm' || compact.contains('magenta')) {
      return 'ColorAdd_M';
    }

// YELLOW
    if (compact == 'y' ||
        compact.contains('yellow') ||
        compact.contains('jaune')) {
      return 'ColorAdd_Y';
    }

// COLD WHITE
    if (compact.contains('coldwhite') ||
        compact.contains('coolwhite') ||
        compact.contains('cw') ||
        compact.contains('whitecold') ||
        compact.contains('froid')) {
      return 'ColorAdd_WW';
    }

// WARM WHITE
    if (compact.contains('warmwhite') ||
        compact.contains('ww') ||
        compact.contains('whitewarm') ||
        compact.contains('chaud')) {
      return 'ColorAdd_CW';
    }
    if (compact.contains('pan')) {
      return 'Pan';
    }
    if (compact.contains('tilt')) {
      return 'Tilt';
    }
    if (compact.contains('strobe') || compact.contains('strob')) {
      return 'Shutter1Strobe';
    }
    if (compact.contains('shutter')) {
      return 'Shutter1';
    }
    // ─── Gobo wheels (mapping unifié) ───────────────────────────────────
    // Détecte le numéro de roue (Gobo1/2/3) puis la fonction (select /
    // index / rotate / shake). Gère les notations type Martin :
    //   "Gobo W 1 Sel"  → gobow1sel  → Gobo1
    //   "Gobo W 1 I/r"  → gobow1ir   → Gobo1Pos      (Index/rotate combiné)
    //   "Gobo W 2 Sel"  → gobow2sel  → Gobo2
    //   "Gobo W 2 I/r"  → gobow2ir   → Gobo2Pos
    //   "Gobo 1 Spin"   → gobo1spin  → Gobo1WheelSpin
    //   "Gobo Wheel 3"  → gobowheel3 → Gobo3
    if (compact.contains('gobo')) {
      // Numéro de roue : cherche un chiffre après "gobo", "wheel" ou "w".
      var wheelNum = 1;
      final wheelMatch = RegExp(r'(?:gobo|wheel|w)(\d)').firstMatch(compact);
      if (wheelMatch != null) {
        final n = int.tryParse(wheelMatch.group(1)!) ?? 1;
        if (n >= 1 && n <= 3) wheelNum = n;
      }
      // Fonction
      if (compact.contains('shake')) return 'Gobo${wheelNum}WheelShake';
      if (compact.contains('rot') || compact.contains('spin')) {
        return 'Gobo${wheelNum}PosRotate';
      }
      if (compact.contains('index') ||
          compact.contains('pos') ||
          compact.contains('ir')) {
        // "ir" = "I/r" Martin (Index/rotate combo) → Gobo*Pos
        return 'Gobo${wheelNum}Pos';
      }
      // Défaut : sélection de slot
      return 'Gobo$wheelNum';
    }
    // ─── Prism ──────────────────────────────────────────────────────────
    if (compact.contains('prism2rot')) return 'Prism2PosRotate';
    if (compact.contains('prism2pos')) return 'Prism2Pos';
    if (compact.contains('prism2')) return 'Prism2';
    if (compact.contains('prismrot') || compact.contains('prism1rot')) {
      return 'Prism1PosRotate';
    }
    if (compact.contains('prismpos') || compact.contains('prism1pos')) {
      return 'Prism1Pos';
    }
    if (compact.contains('prism')) return 'Prism1';
    // ─── Focus / Zoom ───────────────────────────────────────────────────
    if (compact.contains('zoommodebeam') || compact.contains('zoombeam')) {
      return 'ZoomModeBeam';
    }
    if (compact.contains('zoomspot')) return 'ZoomModeSpot';
    if (compact.contains('zoommode')) return 'ZoomMode';
    if (compact.contains('zoomreset')) return 'ZoomReset';
    if (compact.contains('zoom')) return 'Zoom';
    if (compact.contains('focusdistance')) return 'Focus1Distance';
    if (compact.contains('focusadjust')) return 'Focus1Adjust';
    if (compact.contains('focusreset')) return 'FocusReset';
    if (compact.contains('focus')) return 'Focus';
    // ─── Frost / Iris ───────────────────────────────────────────────────
    if (compact.contains('frost2')) return 'Frost2';
    if (compact.contains('frost3')) return 'Frost3';
    if (compact.contains('frost')) return 'Frost1';
    if (compact.contains('irisstrobe')) return 'IrisStrobe';
    if (compact.contains('irispulse')) return 'IrisPulseClose';
    if (compact.contains('irismode')) return 'IrisMode';
    if (compact.contains('iris')) return 'Iris';
    // ─── Animation wheels (pattern) ─────────────────────────────────────
    if (compact.contains('animationwheel') ||
        compact.contains('animwheel') ||
        compact.contains('pattern')) {
      if (compact.contains('rot') || compact.contains('rotat')) {
        return 'AnimationWheel1PosRotate';
      }
      if (compact.contains('pos') || compact.contains('index')) {
        return 'AnimationWheel1Pos';
      }
      return 'AnimationWheel1';
    }
    // ─── Shapers / Blades / Keystone ────────────────────────────────────
    if (compact.contains('blade')) {
      // Tente de détecter blade1a, blade2b, etc.
      final m = RegExp(r'blade(\d)([ab])').firstMatch(compact);
      if (m != null) {
        final num = m.group(1);
        final side = m.group(2)!.toUpperCase();
        if (compact.contains('soft')) return 'BladeSoft$num$side';
        if (compact.contains('rot')) return 'Blade${num}Rot';
        return 'Blade$num$side';
      }
      if (compact.contains('shaperrot')) return 'ShaperRot';
      if (compact.contains('shapermacro')) return 'ShaperMacros';
      return 'Blade1A';
    }
    if (compact.contains('keystone')) {
      final m = RegExp(r'keystone(\d)([ab])').firstMatch(compact);
      if (m != null) {
        return 'KeyStone${m.group(1)}${m.group(2)!.toUpperCase()}';
      }
      return 'KeyStone1A';
    }
    // ─── Color wheels indirect ──────────────────────────────────────────
    if (compact.contains('color2wheel') || compact.contains('color2index')) {
      return 'Color2WheelIndex';
    }
    if (compact.contains('color2')) return 'Color2';
    if (compact.contains('color3')) return 'Color3';
    if (compact.contains('color4')) return 'Color4';
    if (compact.contains('colorwheelindex') ||
        compact.contains('color1index')) {
      return 'Color1WheelIndex';
    }
    if (compact.contains('colorwheelspin')) return 'Color1WheelSpin';
    if (compact.contains('colorwheel')) return 'Color1';
    if (compact.contains('colormacro') || compact.contains('macro')) {
      return 'ColorMacro1';
    }
    // ─── Color temperature / tint ───────────────────────────────────────
    if (compact.contains('cto')) return 'CTO';
    if (compact.contains('ctc')) return 'CTC';
    if (compact.contains('ctb')) return 'CTB';
    if (compact.contains('tint')) return 'Tint';
    // ─── HSB ────────────────────────────────────────────────────────────
    if (compact.contains('hsbhue') || compact.contains('hue')) {
      return 'HSB_Hue';
    }
    if (compact.contains('hsbsat') || compact.contains('saturation')) {
      return 'HSB_Saturation';
    }
    if (compact.contains('hsbbright') || compact.contains('brightness')) {
      return 'HSB_Brightness';
    }
    // ─── Resets ─────────────────────────────────────────────────────────
    if (compact.contains('globalreset') ||
        compact.contains('fixturereset') ||
        compact.contains('mirorreset') ||
        compact.contains('fixtureglobalreset')) {
      return 'FixtureGlobalReset';
    }
    if (compact.contains('panreset')) return 'PanReset';
    if (compact.contains('tiltreset')) return 'TiltReset';
    if (compact.contains('pantiltreset') || compact.contains('positionreset')) {
      return 'PanTiltReset';
    }
    if (compact.contains('shutterreset')) return 'ShutterReset';
    if (compact.contains('colormixreset')) return 'ColorMixReset';
    if (compact.contains('colorwheelreset')) return 'ColorWheelReset';
    if (compact.contains('intensityreset') || compact.contains('dimmerreset')) {
      return 'IntensityReset';
    }
    if (compact.contains('ctoreset')) return 'CTOReset';
    if (compact.contains('ctbreset')) return 'CTBReset';
    if (compact.contains('effectreset') || compact.contains('fxreset')) {
      return 'EffectReset';
    }
    if (compact.contains('reset')) return 'Reset';
    // ─── Speed (movement speed) ─────────────────────────────────────────
    if (compact.contains('colormixspeed') ||
        compact.contains('colormixingspeed') ||
        compact.contains('crossfade') ||
        compact.contains('cmymxspeed') ||
        compact.contains('mixspeed')) {
      return 'ColorMixMSpeed';
    }
    if (compact.contains('positionmspeed') ||
        compact.contains('posmspeed') ||
        compact.contains('panspeed') ||
        compact.contains('tiltspeed')) {
      return 'PositionMSpeed';
    }
    if (compact.contains('globalmspeed') || compact.contains('globalspeed')) {
      return 'GlobalMSpeed';
    }
    if (compact.contains('focusmspeed') || compact.contains('focusspeed')) {
      return 'FocusMSpeed';
    }
    if (compact.contains('irismspeed') || compact.contains('irisspeed')) {
      return 'IrisMSpeed';
    }
    // ─── Modes (catégorie Control) ──────────────────────────────────────
    if (compact.contains('blackoutmode') || compact.contains('blackout')) {
      return 'BlackoutMode';
    }
    if (compact.contains('dimmercurve') ||
        compact.contains('dimcurve') ||
        compact.contains('curve')) {
      return 'DimmerCurve';
    }
    if (compact.contains('dimmermode') || compact.contains('dimmode')) {
      return 'DimmerMode';
    }
    if (compact.contains('pantiltmode')) return 'PanTiltMode';
    if (compact.contains('panmode')) return 'PanMode';
    if (compact.contains('tiltmode')) return 'TiltMode';
    if (compact.contains('pixelmode')) return 'PixelMode';
    if (compact.contains('colormixmode')) return 'ColorMixMode';
    if (compact.contains('fanmode')) return 'FanMode';
    if (compact.contains('ledfreq')) return 'LEDFrequency';
    if (compact.contains('ledzone')) return 'LEDZoneMode';
    if (compact.contains('displayintensity') || compact.contains('display')) {
      return 'DisplayIntensity';
    }
    if (compact.contains('dmxinput')) return 'DMXInput';
    // ─── Atmospheric / mechanical ───────────────────────────────────────
    if (compact.contains('haze') || compact.contains('hazer')) return 'Haze1';
    if (compact.contains('fog')) return 'Fog1';
    if (compact.contains('fan')) return 'Fans';
    if (compact.contains('lamp')) return 'LampControl';
    // ─── Strobe effects (Beam catégorie) ────────────────────────────────
    if (compact.contains('strobeeffect') || compact.contains('strobepattern')) {
      return 'Shutter1StrobeEffect';
    }
    if (compact.contains('strobepulse')) return 'Shutter1StrobePulse';
    if (compact.contains('strobestop') || compact.contains('strobeopen')) {
      return 'Shutter1StrobePulseOpen';
    }
    if (compact.contains('strobeclose')) return 'Shutter1StrobePulseClose';
    if (compact.contains('strobedur')) return 'StrobeDuration';
    // ─── FX wheel (roue d'animation, Feature = Gobo) ────────────────────
    // FX / Effects sur les MH Martin et autres = roue d'animation (motifs
    // qui se superposent au gobo). En GDTF c'est AnimationWheel1 (Feature
    // Gobo.Gobo). NE PAS confondre avec Effects1 qui est dans Beam.
    if (compact.contains('fxsel') ||
        compact.contains('fxwheel') ||
        compact.contains('fxmacro') ||
        compact.contains('starfx') ||
        compact.contains('stareffect') ||
        compact == 'fx' ||
        compact.startsWith('fx ')) {
      return 'AnimationWheel1';
    }
    // FX rotation / index / shake — variantes de la roue FX, restent en Gobo
    if (compact.contains('fxrot') ||
        compact.contains('fxspin') ||
        compact.contains('fxir')) {
      return 'AnimationWheel1PosRotate';
    }
    if (compact.contains('fxindex') || compact.contains('fxpos')) {
      return 'AnimationWheel1Pos';
    }
    if (compact.contains('fxshake')) {
      return 'AnimationWheel1WheelShake';
    }
    // Vitesse d'animation FX (= AnimationSystemSpeed dans la même Feature)
    if (compact.contains('fxspeed') ||
        compact.contains('fxrate') ||
        compact.contains('effectspeed') ||
        compact.contains('animspeed') ||
        compact.contains('animationspeed') ||
        compact.contains('animationsystemspeed')) {
      return 'AnimationWheel1PosRotate';
    }
    // ─── Effects génériques (Beam catégorie : star effects, etc.) ───────
    if (compact.contains('effect1rate')) {
      return 'Effects1Rate';
    }
    if (compact.contains('effect1fade')) {
      return 'Effects1Fade';
    }
    if (compact.contains('effect1pos')) {
      return 'Effects1Pos';
    }
    if (compact.contains('effect')) {
      return 'Effects1';
    }
    if (compact.contains('speed') || compact.contains('rate')) {
      return 'Effects1Rate';
    }
    // ─── Catch-all : Control1 (sera rotaté en Control2/3/…) ─────────────
    return 'Control1';
  }

  // Pour une sous-géométrie générée (ex: "34ch_Base_Control1_2"), déduit le
  // Model approprié. On ne met pas de Model pour les sous-géométries de type
  // "Base" car la référence X4 Bar n'en a pas non plus — les Base sont juste
  // des containers logiques. Pour Head/Beam on garde un Model parce qu'ils
  // ont une représentation physique.
  String? _modelForSubGeometry(String name) {
    if (RegExp(r'_Head(_|$)').hasMatch(name)) return 'Head';
    if (RegExp(r'_Beam(_|$)').hasMatch(name)) return 'Beam';
    return null; // pas de Model pour Base et sous-types
  }

  // Détermine si un attribut GDTF est "per-pixel" — c'est-à-dire qu'il a sa
  // place dans le module Pixel répétable plutôt qu'en master sur Head/Base.
  //
  // Historiquement limité à Couleur/Dimmer/Strobe (cas des barres à pixels
  // façon X4 Bar). Étendu le 24/09/2026 pour couvrir aussi les fixtures à
  // modules indépendants façon JDC1, où chaque tête a son propre faisceau
  // (zoom, gobo, prisme, CTO…) en plus de sa couleur — l'assistant manuel
  // GDTF peut désormais construire ce genre de structure. Le seuil "≥2
  // instances riches (≥2 canaux chacune)" dans _analyzeMode limite le risque
  // de faux positif sur une fixture PDF/IA classique à une seule tête : il
  // faudrait que le manuel nomme littéralement 2 têtes distinctes avec au
  // moins 2 de ces attributs chacune pour que ça change quoi que ce soit ici.
  //
  // Pan/Tilt ajoutés le 24/09/2026 (même logique) : de plus en plus de
  // fixtures ont plusieurs têtes mobiles indépendantes (multi-head beam type
  // JDC1/Chameleon), chacune avec son propre Pan/Tilt. En mode flat, Pan/Tilt
  // sont déjà écrits avec Geometry="Head" (cf. _baseGeometryNameForAttribute)
  // — une simplification déjà en place et validée par les consoles (MA3…).
  // En multi-pixel, on suit exactement le même principe que les autres
  // attributs de module (Zoom/Gobo/…) : le canal Pan/Tilt de chaque tête
  // prend Geometry="Pixel N", qui pointe vers un vrai <Beam Name="Pixel N">
  // dans <Geometries>. Le couple coarse/fine (Pan + Pan Fine) continue de se
  // fusionner correctement par instance : _sameCoarseFineAttribute compare
  // le nom complet du canal (donc "Pixel 1 Pan" vs "Pixel 1 Pan Fine"), pas
  // juste l'attribut, donc pas de mélange entre têtes.
  bool _isPerPixelAttribute(String attribute) {
    if (attribute.startsWith('ColorAdd_')) return true;
    const perModuleCapable = {
      'Dimmer',
      'Shutter1',
      'Shutter1Strobe',
      'Zoom',
      'Focus',
      'Iris',
      'Frost1',
      'Prism1',
      'Prism1PosRotate',
      'Gobo1',
      'Gobo1PosRotate',
      'Gobo2',
      'Gobo2PosRotate',
      'CTO',
      'Pan',
      'Tilt',
    };
    return perModuleCapable.contains(attribute);
  }

  // Analyse un mode pour décider si on émet une structure multi-pixel
  // (GeometryReference + Break) ou plate (Beam unique). Retourne aussi les
  // données prêtes à l'emploi pour la génération XML.
  _ModeAnalysis _analyzeMode(DmxMode mode) {
    final exportChannels = _prepareExportChannels(mode.channels);

    // Pour chaque canal export, on regarde s'il est per-pixel ET a une instance.
    final perInstance = <int, List<_ExportChannel>>{};
    final master = <_ExportChannel>[];

    for (final ec in exportChannels) {
      final parsed = _parseColorAndInstance(ec.source.name);
      final attribute = _mapGdtfAttribute(ec.source.name);
      final isPerPixel = _isPerPixelAttribute(attribute);
      final instance = parsed.instance;

      if (instance != null && isPerPixel) {
        perInstance.putIfAbsent(instance, () => []).add(ec);
      } else {
        master.add(ec);
      }
    }

    // On déclare multi-pixel uniquement si au moins 2 instances ont chacune
    // au moins 2 canaux per-pixel.
    final richInstances = perInstance.entries
        .where((e) => e.value.length >= 2)
        .map((e) => e.key)
        .toList()
      ..sort();
    final isMultiPixel = richInstances.length >= 2;

    int firstOffset(_ExportChannel ec) =>
        int.tryParse(ec.offset.split(',').first) ?? 0;

    // Préfixe pour calculer les noms de géométrie de ce mode.
    final raw = mode.name.replaceAll(RegExp(r'[^A-Za-z0-9]+'), '_');
    final prefix = raw.replaceAll(RegExp(r'^_+|_+$'), '').isEmpty
        ? 'Mode'
        : raw.replaceAll(RegExp(r'^_+|_+$'), '');
    final baseGeom = '${prefix}_Base';
    final headGeom = '${prefix}_Head';
    final beamGeom = '${prefix}_Beam';

    // Résolution d'un nom brut Base/Head/Beam[_attr_n] vers le nom préfixé,
    // et tracking des sous-géométries supplémentaires nécessaires
    // (ex: 34ch_Base_Control1_2 pour le 2e Control1 sur Base).
    final extraSet = <String>{};
    String resolveAndTrack(String rawName) {
      // Note : le top-level <Beam Name="Beam"/> du module pixel n'est PAS
      // accédé via cette fonction — les canaux module reçoivent leur géométrie
      // directement via le paramètre `geometry: 'Beam'` dans _writeDmxModes.
      // Ici on traite uniquement les canaux master.
      final m =
          RegExp(r'^(Head|Beam|Base)(_[A-Za-z0-9]+_\d+)?$').firstMatch(rawName);
      if (m == null) return rawName;
      final root = m.group(1)!;
      final suffix = m.group(2) ?? '';
      String rootPrefixed;
      switch (root) {
        case 'Base':
          rootPrefixed = baseGeom;
          break;
        case 'Head':
          rootPrefixed = headGeom;
          break;
        default: // 'Beam'
          // En multi-pixel il n'y a pas de Beam LOCAL (le seul Beam est le
          // module partagé top-level). On retombe sur Head pour les attributs
          // qui voulaient se mettre sur Beam (Zoom, CTO, Shutter master, etc.).
          rootPrefixed = isMultiPixel ? headGeom : beamGeom;
      }
      // On émet la sub-geometry pour respecter l'unicité LogicalChannel par
      // Geometry (sinon MA3 ne charge pas la fixture).
      final resolved = '$rootPrefixed$suffix';
      if (suffix.isNotEmpty) extraSet.add(resolved);
      return resolved;
    }

    if (!isMultiPixel) {
      // Mode flat : on pré-résout les géométries en collapsant les suffixes
      // de comptage, et on rotate l'attribut en cas de duplicate — pareil
      // que la branche multi-pixel. Évite les sub-geometries Base_Control1_2
      // qui pollueraient la patch tree MA3.
      final geometryUseCount = <String, int>{};
      final masterResolved = <_ResolvedMaster>[];
      final additives = <String>{};
      bool hasDimmer = false;
      String? colorGeom;
      // Registre d'utilisation d'attributs par géométrie (pour rotation).
      final flatAttrUsage = <String, Set<String>>{};
      ({String? attribute, String? geometry}) rotateFlat(
          String geom, String attr) {
        final used = flatAttrUsage.putIfAbsent(geom, () => <String>{});
        if (!used.contains(attr)) {
          used.add(attr);
          return (attribute: null, geometry: null);
        }
        final m = RegExp(r'^([A-Za-z]+)(\d+)([A-Za-z]*)$').firstMatch(attr);
        if (m != null) {
          final baseName = m.group(1)!;
          final startNum = int.parse(m.group(2)!);
          final tailSuffix = m.group(3) ?? '';
          const maxByFamily = <String, int>{
            'AnimationWheel': 3,
            'Gobo': 3,
            'Color': 4,
            'Shutter': 4,
            'Prism': 3,
            'Frost': 3,
            'Effects': 2,
          };
          final maxNum = maxByFamily[baseName] ?? 20;
          for (var i = startNum + 1; i <= maxNum; i++) {
            final candidate = '$baseName$i$tailSuffix';
            if (!used.contains(candidate)) {
              used.add(candidate);
              return (attribute: candidate, geometry: null);
            }
          }
        }
        // Non-numéroté OU famille saturée → sub-geometry, attribut préservé
        // (Pan reste Pan, CTO reste CTO, Dimmer reste Dimmer).
        var subIdx = 2;
        final safeAttr = attr.replaceAll(RegExp(r'[^A-Za-z0-9]+'), '_');
        while (used.contains('__SUBGEO__:$safeAttr:$subIdx')) {
          subIdx++;
        }
        used.add('__SUBGEO__:$safeAttr:$subIdx');
        final subGeomName = '${geom}_${safeAttr}_$subIdx';
        extraSet.add(subGeomName);
        return (attribute: null, geometry: subGeomName);
      }

      for (final ec in exportChannels) {
        final attribute = _mapGdtfAttribute(ec.source.name);
        final rawGeom = _geometryNameForExportChannel(
            ec.source, attribute, geometryUseCount);
        // Strip le suffixe de comptage (_attr_N) — la résolution finale
        // (rotation OU sub-geometry) est gérée par rotateFlat en respectant
        // le Feature (Position/Color/Dimmer/etc.).
        String collapsedRaw = rawGeom;
        final m = RegExp(r'^(Head|Beam|Base)(_[A-Za-z0-9]+_\d+)$')
            .firstMatch(rawGeom);
        if (m != null) collapsedRaw = m.group(1)!;
        final resolved = resolveAndTrack(collapsedRaw);
        final rot = rotateFlat(resolved, attribute);
        final finalGeometry = rot.geometry ?? resolved;
        final finalAttrOverride = rot.attribute;
        masterResolved.add(_ResolvedMaster(
          channel: ec,
          geometry: finalGeometry,
          offset: ec.offset,
          attributeOverride: finalAttrOverride,
        ));
        // L'attribut effectif (pour la détection RGB→Dimmer virtuel) est
        // soit le rotaté (Control2…), soit l'original (cas sub-geometry).
        final effectiveAttr = finalAttrOverride ?? attribute;
        if (effectiveAttr.startsWith('ColorAdd_')) {
          additives.add(effectiveAttr);
          colorGeom ??= finalGeometry;
        }
        if (effectiveAttr == 'Dimmer') hasDimmer = true;
      }
      // Injection d'un Dimmer VIRTUEL si la fixture a au moins 2 couleurs
      // additives distinctes (vrai RGB/RGBW/…) sans master dim. La console
      // (MA3, etc.) l'utilisera pour scaler les sorties couleur en interne.
      if (additives.length >= 2 && !hasDimmer && colorGeom != null) {
        final synthetic = DmxChannel(
          number: 0,
          name: 'Virtual Dimmer',
          function: '',
        );
        final vEc = _ExportChannel(
          source: synthetic,
          offset: 'None',
          is16Bit: false,
          isVirtualDimmer: true,
        );
        masterResolved.add(_ResolvedMaster(
          channel: vEc,
          geometry: colorGeom,
          offset: 'None',
        ));
      }
      return _ModeAnalysis(
        mode: mode,
        exportChannels: exportChannels,
        isMultiPixel: false,
        instanceNumbers: const [],
        breakOffsetForInstance: const {},
        moduleTemplate: const [],
        moduleAttributes: const [],
        masterChannels: exportChannels,
        masterResolved: masterResolved,
        extraSubGeometries: (extraSet.toList()..sort()),
      );
    }

    // Multi-pixel : on calcule le break offset de chaque instance.
    final breakOffsetForInstance = <int, int>{};
    for (final inst in richInstances) {
      final mins = perInstance[inst]!.map(firstOffset).toList()..sort();
      breakOffsetForInstance[inst] = mins.first;
    }

    // Module template : ordre relatif de la 1re instance, + complétion si
    // d'autres instances ont des canaux non vus.
    final firstInstance = richInstances.first;
    final templateRaw = perInstance[firstInstance]!.toList()
      ..sort((a, b) => firstOffset(a).compareTo(firstOffset(b)));
    final templateAttrs =
        templateRaw.map((ec) => _mapGdtfAttribute(ec.source.name)).toList();
    for (final inst in richInstances.skip(1)) {
      for (final ec in perInstance[inst]!) {
        final attr = _mapGdtfAttribute(ec.source.name);
        if (!templateAttrs.contains(attr)) {
          templateRaw.add(ec);
          templateAttrs.add(attr);
        }
      }
    }

    // SANITY CHECK — les intervalles de pixel doivent être disjoints.
    // Si le Worker a mal assigné les instances (cas Pixkolor Mode 76 :
    // Pixel 2 à l'offset 4 et Pixel 3 à l'offset 5 → chevauchement),
    // on retombe sur le mode flat pour produire un GDTF valide.
    // Le footprint sera plus compact mais sans conflit.
    final moduleSize = templateRaw.length;
    final sortedBreaks =
        richInstances.map((i) => breakOffsetForInstance[i]!).toList()..sort();
    bool overlapDetected = false;
    for (var i = 1; i < sortedBreaks.length; i++) {
      if (sortedBreaks[i] < sortedBreaks[i - 1] + moduleSize) {
        overlapDetected = true;
        break;
      }
    }
    if (overlapDetected) {
      // Rebascule en flat. On garde l'analyse plate déjà calculée ailleurs.
      // Cette branche ré-utilise la même logique que la branche !isMultiPixel
      // sans dupliquer le code : on émet un mode flat équivalent.
      final flatGeometryUseCount = <String, int>{};
      final flatMasterResolved = <_ResolvedMaster>[];
      final flatAttrUsage = <String, Set<String>>{};
      final fallbackSubGeoms = <String>{};
      ({String? attribute, String? geometry}) rotateFlatFallback(
          String geom, String attr) {
        final used = flatAttrUsage.putIfAbsent(geom, () => <String>{});
        if (!used.contains(attr)) {
          used.add(attr);
          return (attribute: null, geometry: null);
        }
        final mm = RegExp(r'^([A-Za-z]+)(\d+)([A-Za-z]*)$').firstMatch(attr);
        if (mm != null) {
          final baseName = mm.group(1)!;
          final startNum = int.parse(mm.group(2)!);
          final tailSuffix = mm.group(3) ?? '';
          for (var i = startNum + 1; i <= 20; i++) {
            final c = '$baseName$i$tailSuffix';
            if (!used.contains(c)) {
              used.add(c);
              return (attribute: c, geometry: null);
            }
          }
        }
        // Non-numéroté OU saturé → sub-geometry, attribut préservé.
        var subIdx = 2;
        final safeAttr = attr.replaceAll(RegExp(r'[^A-Za-z0-9]+'), '_');
        while (used.contains('__SUBGEO__:$safeAttr:$subIdx')) {
          subIdx++;
        }
        used.add('__SUBGEO__:$safeAttr:$subIdx');
        final subGeomName = '${geom}_${safeAttr}_$subIdx';
        fallbackSubGeoms.add(subGeomName);
        return (attribute: null, geometry: subGeomName);
      }

      for (final ec in exportChannels) {
        final attribute = _mapGdtfAttribute(ec.source.name);
        final rawGeom = _geometryNameForExportChannel(
            ec.source, attribute, flatGeometryUseCount);
        String collapsedRaw = rawGeom;
        final mm = RegExp(r'^(Head|Beam|Base)(_[A-Za-z0-9]+_\d+)$')
            .firstMatch(rawGeom);
        if (mm != null) collapsedRaw = mm.group(1)!;
        final resolved = resolveAndTrack(collapsedRaw);
        final rot = rotateFlatFallback(resolved, attribute);
        final finalGeometry = rot.geometry ?? resolved;
        final finalAttrOverride = rot.attribute;
        flatMasterResolved.add(_ResolvedMaster(
          channel: ec,
          geometry: finalGeometry,
          offset: ec.offset,
          attributeOverride: finalAttrOverride,
        ));
      }
      return _ModeAnalysis(
        mode: mode,
        exportChannels: exportChannels,
        isMultiPixel: false,
        instanceNumbers: const [],
        breakOffsetForInstance: const {},
        moduleTemplate: const [],
        moduleAttributes: const [],
        masterChannels: exportChannels,
        masterResolved: flatMasterResolved,
        extraSubGeometries: (fallbackSubGeoms.toList()..sort()),
      );
    }

    // Injection d'un Dimmer VIRTUEL par pixel si le module a au moins 2
    // couleurs additives distinctes sans Dimmer. Chaque GeometryReference
    // va dupliquer ce canal virtuel — on obtient donc un dim virtuel par
    // sub-fixture, ce qui permet à la console de moduler chaque pixel
    // séparément.
    final moduleAdditives =
        templateAttrs.where((a) => a.startsWith('ColorAdd_')).toSet();
    final hasModuleDimmer = templateAttrs.contains('Dimmer');
    if (moduleAdditives.length >= 2 && !hasModuleDimmer) {
      final synthetic = DmxChannel(
        number: 0,
        name: 'Virtual Dimmer',
        function: '',
      );
      templateRaw.add(_ExportChannel(
        source: synthetic,
        offset: 'None',
        is16Bit: false,
        isVirtualDimmer: true,
      ));
      templateAttrs.add('Dimmer');
    }

    // Instances "pauvres" → repassent en master.
    final extraMaster = <_ExportChannel>[];
    for (final entry in perInstance.entries) {
      if (!richInstances.contains(entry.key)) {
        extraMaster.addAll(entry.value);
      }
    }
    final allMaster = [...master, ...extraMaster]
      ..sort((a, b) => firstOffset(a).compareTo(firstOffset(b)));

    // Pré-résolution des géométries des master channels en multi-pixel.
    final geometryUseCount = <String, int>{};
    final masterResolved = <_ResolvedMaster>[];
    // Counter pour rotater les attributs numérotés (Control1→2→3,
    // AnimationWheel1→2→3, etc.) par géométrie cible, en multi-pixel.
    // Évite les collisions LogicalChannel (même Geometry + même Attribute)
    // qui obligeraient à créer des sub-geometries (qui polluent la patch).
    //
    // Retourne :
    //   - null si le canal garde son attribut original (1re utilisation)
    //   - le nouvel attribut (ex: "Control2") sinon
    // Sub-geometries supplémentaires créées par la résolution des duplicates
    // d'attributs non-rotables (Dimmer, Pan, CTO…). Ces noms sont ajoutés à
    // _ModeAnalysis.extraSubGeometries pour émission dans <Geometries>.
    final dupSubGeometries = <String>{};

    final attrUsage = <String, Set<String>>{};
    // Retour : (attributeOverride, geometryOverride)
    //   - 1re occurrence : (null, null) → on garde tel quel
    //   - Rotation numérotée OK : (newAttribute, null) → ex: Control1 → Control2
    //   - Sub-geometry forcée : (null, "Head_Dimmer_2") → garde l'attribut et
    //     change la géométrie sur une sous-géo dédiée. Préserve le Feature
    //     (Position/Color/Dimmer) que la console attend.
    ({String? attribute, String? geometry}) rotateNumberedAttribute(
        String geom, String attr) {
      final used = attrUsage.putIfAbsent(geom, () => <String>{});
      if (!used.contains(attr)) {
        used.add(attr);
        return (attribute: null, geometry: null);
      }
      // Tentative de rotation pour les attributs avec un nombre.
      final m = RegExp(r'^([A-Za-z]+)(\d+)([A-Za-z]*)$').firstMatch(attr);
      if (m != null) {
        final baseName = m.group(1)!;
        final startNum = int.parse(m.group(2)!);
        final tailSuffix = m.group(3) ?? '';
        const maxByFamily = <String, int>{
          'AnimationWheel': 3,
          'Gobo': 3,
          'Color': 4,
          'Shutter': 4,
          'Prism': 3,
          'Frost': 3,
          'Effects': 2,
        };
        final maxNum = maxByFamily[baseName] ?? 10;
        for (var i = startNum + 1; i <= maxNum; i++) {
          final candidate = '$baseName$i$tailSuffix';
          if (!used.contains(candidate)) {
            used.add(candidate);
            return (attribute: candidate, geometry: null);
          }
        }
      }
      // Non-numéroté OU famille saturée → sub-geometry, attribut préservé.
      // Compte les sub-geo déjà créées pour ce (geom, attr) pour numéroter.
      var subIdx = 2;
      final safeAttr = attr.replaceAll(RegExp(r'[^A-Za-z0-9]+'), '_');
      while (used.contains('__SUBGEO__:$safeAttr:$subIdx')) {
        subIdx++;
      }
      used.add('__SUBGEO__:$safeAttr:$subIdx');
      final subGeomName = '${geom}_${safeAttr}_$subIdx';
      dupSubGeometries.add(subGeomName);
      return (attribute: null, geometry: subGeomName);
    }

    for (final ec in allMaster) {
      final attribute = _mapGdtfAttribute(ec.source.name);
      final rawGeom =
          _geometryNameForExportChannel(ec.source, attribute, geometryUseCount);
      // COLLAPSE le suffixe compteur d'origine : la rotation/sub-geometry
      // est gérée par rotateNumberedAttribute en respectant le Feature.
      String collapsedRaw = rawGeom;
      final m =
          RegExp(r'^(Head|Beam|Base)(_[A-Za-z0-9]+_\d+)$').firstMatch(rawGeom);
      if (m != null) collapsedRaw = m.group(1)!;
      final resolved = resolveAndTrack(collapsedRaw);
      final rot = rotateNumberedAttribute(resolved, attribute);
      // Si la rotation a forcé une sub-geometry, on la prend ; sinon on
      // reste sur la géométrie racine et on applique l'override d'attribut.
      final finalGeometry = rot.geometry ?? resolved;
      final finalAttrOverride = rot.attribute;
      masterResolved.add(_ResolvedMaster(
        channel: ec,
        geometry: finalGeometry,
        offset: ec.offset,
        attributeOverride: finalAttrOverride,
      ));
    }

    return _ModeAnalysis(
      mode: mode,
      exportChannels: exportChannels,
      isMultiPixel: true,
      instanceNumbers: richInstances,
      breakOffsetForInstance: breakOffsetForInstance,
      moduleTemplate: templateRaw,
      moduleAttributes: templateAttrs,
      masterChannels: allMaster,
      masterResolved: masterResolved,
      // Sub-geometries créées par les duplicates non-rotables (Dimmer, Pan,
      // CTO…) — on les émet dans <Geometries> pour rester GDTF-valide.
      extraSubGeometries: (dupSubGeometries.toList()..sort()),
    );
  }

  String _geometryNameForExportChannel(
    DmxChannel channel,
    String attribute,
    Map<String, int> geometryUseCount,
  ) {
    // Les modes multi-pixel sont entièrement gérés par _analyzeMode/_writeDmxModes
    // (Geometry forcée à "Pixel" + offsets relatifs). Cette fonction ne sert plus
    // que pour les modes flat → on retombe directement sur Base/Head/Beam.
    final baseGeometry = _baseGeometryNameForAttribute(attribute);
    final key = '$baseGeometry|$attribute';
    final count = (geometryUseCount[key] ?? 0) + 1;
    geometryUseCount[key] = count;

    if (count == 1) {
      return baseGeometry;
    }

    final safeAttribute = attribute.replaceAll(RegExp(r'[^A-Za-z0-9_]+'), '_');
    return '${baseGeometry}_${safeAttribute}_$count';
  }

  String _baseGeometryNameForAttribute(String attribute) {
    if (attribute == 'Pan' || attribute == 'Tilt') {
      return 'Head';
    }
    if (attribute == 'Control1' ||
        attribute == 'Reset' ||
        attribute == 'LampControl' ||
        attribute == 'Effects1' ||
        attribute == 'Effects1Rate') {
      return 'Base';
    }
    return 'Beam';
  }

  String _functionNameForChannel(DmxChannel channel, String attribute) {
    final name = _cleanXmlText(channel.name.trim());
    if (name.isNotEmpty) {
      return _gdtfName(_titleCase(name), fallback: attribute);
    }
    return attribute;
  }

  String _masterForAttribute(String attribute) {
    if (attribute == 'Dimmer') {
      return 'Grand';
    }
    return 'None';
  }

  String _snapForAttribute(String attribute) {
    if (attribute == 'Dimmer' ||
        attribute.startsWith('ColorAdd_') ||
        attribute == 'Pan' ||
        attribute == 'Tilt' ||
        attribute == 'Zoom' ||
        attribute == 'Focus') {
      return 'No';
    }
    return 'Yes';
  }

  // Retourne la valeur entière 8-bit de highlight (avant suffixe résolution),
  // ou null si l'attribut n'a pas de highlight ("None").
  // C'est _writeOneDmxChannel qui décide ensuite si on multiplie par 257
  // pour passer en 16-bit et qui ajoute le suffixe /1 ou /2.
  //
  // Règles :
  //   - Dimmer (réel ou virtuel) → 255 (100%) — réflexe console : Highlight
  //     allume la fixture à pleine intensité pour repérer en programmation.
  //   - ColorAdd_* (R/G/B/W/A/UV/…)  → 255 (100%)
  //   - Pan / Tilt → None : pas de Highlight pour la position. Le centrage
  //     50% est exprimé via le ChannelSet "Home" (cf. _defaultChannelSets).
  //   - Reste → None
  int? _highlightValueForAttribute(String attribute) {
    if (attribute == 'Dimmer' || attribute.startsWith('ColorAdd_')) {
      return 255;
    }
    return null;
  }

  String _wheelForAttribute(String attribute) {
    if (attribute == 'Color1' || attribute == 'Color1Pos') {
      return 'ColorWheel1';
    }
    if (attribute.startsWith('Gobo1')) {
      return 'GoboWheel1';
    }
    return '';
  }

  String _physicalFromForAttribute(String attribute) {
    if (attribute == 'Pan') {
      return '-270.000000';
    }
    if (attribute == 'Tilt') {
      return '-135.000000';
    }
    if (attribute == 'Zoom') {
      return '4.000000';
    }
    return '0.000000';
  }

  String _physicalToForAttribute(String attribute) {
    if (attribute == 'Pan') {
      return '270.000000';
    }
    if (attribute == 'Tilt') {
      return '135.000000';
    }
    if (attribute == 'Zoom') {
      return '60.000000';
    }
    return '1.000000';
  }

  List<_ChannelSet> _parseChannelSets(String raw, String attribute) {
    // Normalisation des séparateurs de plage : `..`, `...`, `…`, `–`, `—`, `~`
    // deviennent tous `-`. C'est essentiel pour les manuels GLP/Robe qui
    // utilisent `8..15` au lieu de `8-15`.
    var text = raw
        .replaceAll('\r', '\n')
        .replaceAll('…', '-')
        .replaceAll('–', '-')
        .replaceAll('—', '-')
        .replaceAll('~', '-');
    // Réduit les séquences de points (`...`, `..`) à un seul tiret de plage.
    text = text.replaceAll(RegExp(r'\.{2,}'), '-');
    text = text.replaceAll(RegExp(r'\s+'), ' ').trim();
    if (text.isEmpty) {
      return const [];
    }

    // Cas particulier : un Func qui ne décrit que la plage physique complète
    // (« 0 - 100% », « 0-255 », « 0..100% », « 0 - 255 ») n'est pas un set de
    // fonctions discrètes — c'est une simple description de l'unité. On rend
    // la main à `_defaultChannelSets` plutôt qu'extraire un faux ChannelSet
    // « 100% » à DMXFrom=0.
    final fullRangeOnly = RegExp(
      r'^(?:0\s*[-:]\s*(?:100\s*%|255|1)|0)\s*%?$',
      caseSensitive: false,
    );
    if (fullRangeOnly.hasMatch(text)) {
      return const [];
    }

    final sets = <_ChannelSet>[];
    final regex = RegExp(
      r'(?<!\d)(\d{1,3})(?:\s*-\s*|\s+)(\d{1,3})\s*(?:=|:|-)\s*([^;|\n]+?)(?=(?:\s*[;|]\s*|\s+\d{1,3}(?:\s*-\s*|\s+)\d{1,3}\s*(?:=|:|-)|\s+\d{1,3}\s*(?:=|:|-)|$))|(?<!\d)(\d{1,3})\s*(?:=|:|-)\s*([^;|\n]+?)(?=(?:\s*[;|]\s*|\s+\d{1,3}(?:\s*-\s*|\s+)\d{1,3}\s*(?:=|:|-)|\s+\d{1,3}\s*(?:=|:|-)|$))',
      caseSensitive: false,
    );

    for (final match in regex.allMatches(text)) {
      final rangeStart = match.group(1);
      final rangeEnd = match.group(2);
      final rangeLabel = match.group(3);
      final singleValue = match.group(4);
      final singleLabel = match.group(5);

      if (rangeStart != null && rangeEnd != null) {
        final from = int.tryParse(rangeStart) ?? 0;
        final to = int.tryParse(rangeEnd) ?? from;
        final label = (rangeLabel ?? '').trim();
        sets.add(_ChannelSet(
          from: from.clamp(0, 255),
          to: to.clamp(0, 255),
          name: label.isEmpty ? _defaultSetName(attribute) : label,
        ));
      } else if (singleValue != null) {
        final value = int.tryParse(singleValue) ?? 0;
        final label = (singleLabel ?? '').trim();
        sets.add(_ChannelSet(
          from: value.clamp(0, 255),
          to: value.clamp(0, 255),
          name: label.isEmpty ? _defaultSetName(attribute) : label,
        ));
      }
    }

    // Si la regex monolithique a échoué (cas Worker qui livre des Func style
    // « label N1-N2 label N3-N4… » sans séparateur `=`/`:`), tente un parseur
    // « label avant plage » : on cherche toutes les plages `N1-N2` dans le
    // texte et on prend le texte juste avant comme label.
    if (sets.isEmpty) {
      final rangeRegex = RegExp(r'(?<!\d)(\d{1,3})\s*-\s*(\d{1,3})(?!\d)');
      final matches = rangeRegex.allMatches(text).toList();
      if (matches.length >= 2) {
        for (var i = 0; i < matches.length; i++) {
          final m = matches[i];
          final from = int.tryParse(m.group(1)!) ?? 0;
          final to = int.tryParse(m.group(2)!) ?? from;
          // Le label est le texte entre la fin du précédent match et le début
          // de celui-ci (ou le début du texte pour le premier).
          final labelStart = i == 0 ? 0 : matches[i - 1].end;
          final rawLabel = text.substring(labelStart, m.start).trim();
          // Nettoie la ponctuation parasite (virgule, deux-points, tiret final)
          final label =
              rawLabel.replaceAll(RegExp(r'^[\s,:;|\-]+|[\s,:;|\-]+$'), '');
          sets.add(_ChannelSet(
            from: from.clamp(0, 255),
            to: to.clamp(0, 255),
            name: label.isEmpty ? _defaultSetName(attribute) : label,
          ));
        }
      }
    }

    return _mergeAndSortChannelSets(sets, attribute);
  }

  List<_ChannelSet> _mergeAndSortChannelSets(
      List<_ChannelSet> sets, String attribute) {
    if (sets.isEmpty) {
      return const [];
    }

    final byFrom = <int, _ChannelSet>{};
    for (final set in sets) {
      final name = _cleanChannelSetName(set.name, attribute);
      byFrom[set.from] = _ChannelSet(from: set.from, to: set.to, name: name);
    }

    final sorted = byFrom.values.toList()
      ..sort((a, b) => a.from.compareTo(b.from));

    return sorted.take(64).toList();
  }

  // Attributs où un ChannelSet UNIQUE est presque toujours la description
  // verbeuse du paramètre, pas une vraie action discrète. On exige donc
  // ≥ 2 sets pour les accepter — sinon on n'émet rien.
  //
  // Exemples de garbage filtrés ici :
  //   - Control1 "See Special Features Below"
  //   - Control1 "Values See Channel 5"
  //   - DimmerMode "0-255 Linear"
  //   - LampControl "Lamp Control" (juste le nom du canal)
  //
  // Pour Shutter, Color wheels, Gobo, AnimationWheel, ColorMacro, Prism :
  // 1 set suffit (peut être un slot unique légitime comme "Open" ou
  // "Red position").
  bool _requiresMultipleSets(String attribute) {
    if (attribute.startsWith('Control')) return true;
    if (attribute == 'Reset' ||
        attribute == 'FixtureGlobalReset' ||
        attribute.endsWith('Reset')) {
      return true;
    }
    if (attribute == 'LampControl') return true;
    if (attribute == 'BlackoutMode' ||
        attribute == 'DimmerCurve' ||
        attribute == 'DimmerMode' ||
        attribute.endsWith('Mode')) {
      return true;
    }
    if (attribute == 'LEDFrequency' ||
        attribute == 'LEDZoneMode' ||
        attribute == 'DisplayIntensity' ||
        attribute == 'DMXInput') {
      return true;
    }
    if (attribute == 'Haze1' || attribute == 'Fog1' || attribute == 'Fans') {
      return true;
    }
    if (attribute == 'Effects1' || attribute == 'Effects2') return true;
    return false;
  }

  // Décide si on doit ignorer ce que le manuel a fourni et forcer nos
  // ChannelSets par défaut Min/Max(/Home).
  //
  // Deux catégories d'attributs :
  //
  // A) FORCE DEFAULTS (encodeurs continus) → on émet Min/Max(/Home) toujours.
  //    Pan/Tilt, Dimmer, ColorAdd_*, ColorSub_*, CTO/CTC/CTB, HSB_*, Zoom,
  //    Focus, Iris, Frost, Blade, KeyStone, *MSpeed, Effects*Rate/Fade/Pos,
  //    StrobeDuration, XYZ, Rot_*, PanTiltDistance.
  //
  // B) MANUAL SETS (slots discrets ou actions) → on garde ce que le manuel
  //    a fourni. Si manuel vide → on n'émet AUCUN ChannelSet
  //    (cf. _writeChannelSets).
  //    Shutter*, Color1..4 (roues), Gobo1..3 (roues), AnimationWheel*,
  //    ColorMacro*, Prism*, Control1..10, *Reset, LampControl, *Mode,
  //    BlackoutMode, DimmerCurve, LEDFrequency/Zone, DisplayIntensity,
  //    DMXInput, Haze/Fog/Fans, Effects1/2 (macros discrets).
  bool _shouldForceDefaultSets(String attribute) {
    // — Familles "manual or nothing" → return false —

    // Wheels et slots discrets
    if (attribute.startsWith('Shutter')) return false;
    if (attribute.startsWith('Color1') ||
        attribute.startsWith('Color2') ||
        attribute.startsWith('Color3') ||
        attribute.startsWith('Color4')) {
      return false;
    }
    if (attribute.startsWith('Gobo')) return false;
    if (attribute.startsWith('AnimationWheel')) return false;
    if (attribute.startsWith('ColorMacro')) return false;
    if (attribute.startsWith('Prism')) return false;

    // Control & assimilés : reset, lamp on/off, modes, etc.
    if (attribute.startsWith('Control')) return false;
    if (attribute == 'Reset' ||
        attribute == 'FixtureGlobalReset' ||
        attribute.endsWith('Reset')) {
      return false;
    }
    if (attribute == 'LampControl') return false;
    if (attribute == 'BlackoutMode' ||
        attribute == 'DimmerCurve' ||
        attribute == 'DimmerMode' ||
        attribute.endsWith('Mode')) {
      return false;
    }
    if (attribute == 'LEDFrequency' ||
        attribute == 'LEDZoneMode' ||
        attribute == 'DisplayIntensity' ||
        attribute == 'DMXInput') {
      return false;
    }
    if (attribute == 'Haze1' || attribute == 'Fog1' || attribute == 'Fans') {
      return false;
    }
    // Effects discrets (macros), pas les variantes continues *Rate/*Fade/*Pos
    if (attribute == 'Effects1' || attribute == 'Effects2') return false;

    // — Tout le reste → force defaults Min/Max —
    return true;
  }

  List<_ChannelSet> _defaultChannelSets(
      String channelName, String attribute, bool is16Bit) {
    final max = is16Bit ? 65535 : 255;
    final mid = is16Bit ? 32768 : 128; // pile 50% (au pixel près en 16-bit)
    // Dimmer (réel ou virtuel) → "Closed" et "Open" (comme un shutter).
    // Convention demandée par l'utilisateur : DMX 0 = Closed (extincteur fermé),
    // DMX max = Open (à fond).
    if (attribute == 'Dimmer') {
      return [
        _ChannelSet(from: 0, to: 0, name: 'Closed'),
        _ChannelSet(from: max, to: max, name: 'Open'),
      ];
    }
    // Couleurs additives RGB(W/A/UV/…) → Min et Max simples.
    if (attribute.startsWith('ColorAdd_')) {
      return [
        _ChannelSet(from: 0, to: 0, name: 'Min'),
        _ChannelSet(from: max, to: max, name: 'Max'),
      ];
    }
    // Couleurs soustractives CMY → Min (filtre retiré) et Max (filtre plein).
    if (attribute.startsWith('ColorSub_')) {
      return [
        _ChannelSet(from: 0, to: 0, name: 'Min'),
        _ChannelSet(from: max, to: max, name: 'Max'),
      ];
    }
    // Pan / Tilt : 0%, Home (50% — centre fixture), 100%.
    // Le ChannelSet "Home" sert à remettre la fixture en position centrale
    // d'un clic depuis la console. Cohérent avec la nomenclature Dimmer.
    if (attribute == 'Pan' || attribute == 'Tilt') {
      return [
        _ChannelSet(from: 0, to: 0, name: '0%'),
        _ChannelSet(from: mid, to: mid, name: 'Home'),
        _ChannelSet(from: max, to: max, name: '100%'),
      ];
    }
    // Shutter : valeurs venant du manuel — fallback minimal si le parseur n'a
    // rien extrait. En pratique _parseChannelSets devrait remplir ce canal.
    if (attribute == 'Shutter1' || attribute == 'Shutter1Strobe') {
      return [
        _ChannelSet(from: 0, to: 0, name: 'Closed'),
        _ChannelSet(from: max, to: max, name: 'Open'),
      ];
    }
    // Tout autre canal sans set fourni par le manuel : Min/Max simples.
    return [
      _ChannelSet(from: 0, to: 0, name: 'Min'),
      _ChannelSet(from: max, to: max, name: 'Max'),
    ];
  }

  String _cleanChannelSetName(String name, String attribute) {
    final clean =
        name.replaceAll('&', ' and ').replaceAll(RegExp(r'\s+'), ' ').trim();
    final lower = clean.toLowerCase();

    // Pour les canaux ColorAdd_* (R/G/B/W/A/C/M/Y/UV/etc), le ChannelSet
    // devrait avoir un nom court et standard ("Red", "Green", "Blue"…) comme
    // dans le X4 Bar officiel. Si l'IA a remonté "Color Mixing System Red"
    // ou tout autre nom verbeux, on simplifie au nom de la couleur de
    // l'attribut.
    if (attribute.startsWith('ColorAdd_')) {
      const colorNames = <String, String>{
        'ColorAdd_R': 'Red',
        'ColorAdd_G': 'Green',
        'ColorAdd_B': 'Blue',
        'ColorAdd_W': 'White',
        'ColorAdd_A': 'Amber',
        'ColorAdd_C': 'Cyan',
        'ColorAdd_M': 'Magenta',
        'ColorAdd_Y': 'Yellow',
        'ColorAdd_UV': 'UV',
        'ColorAdd_WW': 'Warm White',
        'ColorAdd_CW': 'Cool White',
        'ColorAdd_Lime': 'Lime',
        'ColorAdd_Mint': 'Mint',
        'ColorAdd_RB': 'Royal Blue',
      };
      return colorNames[attribute] ?? clean;
    }

    if (lower.contains('no effect') ||
        lower.contains('no function') ||
        lower.contains('no function')) {
      return 'No Effect';
    }
    if (lower.contains('led off') ||
        lower == 'off' ||
        lower.contains('blackout') ||
        lower.contains('closed')) {
      return attribute == 'Shutter1' || attribute == 'Shutter1Strobe'
          ? 'Closed'
          : 'Off';
    }
    if (lower.contains('led on') || lower == 'on' || lower.contains('open')) {
      return attribute == 'Shutter1' || attribute == 'Shutter1Strobe'
          ? 'Open'
          : 'On';
    }
    if (lower.contains('slow') && lower.contains('fast')) {
      if (attribute == 'Shutter1' || attribute == 'Shutter1Strobe') {
        return 'Strobe slow to fast';
      }
      return 'Slow to fast';
    }
    if (lower.contains('fast') && lower.contains('slow')) {
      return 'Fast to slow';
    }
    if (lower.contains('random') && lower.contains('strobe')) {
      return 'Random strobe';
    }
    if (lower.contains('pulse')) {
      return 'Pulse';
    }
    if (lower.contains('reset')) {
      return 'Reset';
    }
    if (lower.contains('standard')) {
      return 'Standard';
    }
    if (lower.contains('stage 2')) {
      return 'Stage 2';
    }
    if (lower.contains('stage')) {
      return 'Stage';
    }
    if (lower.contains('architectural')) {
      return 'Architectural';
    }
    if (lower.contains('theatre') || lower.contains('theater')) {
      return 'Theatre';
    }
    if (RegExp(r'^\d+(?:\.\d+)?\s*s(?:ec)?\.?$').hasMatch(lower)) {
      final time = lower
          .replaceAll('sec.', 's')
          .replaceAll('sec', 's')
          .replaceAll(RegExp(r'\s+'), '')
          .replaceAll(RegExp(r'\.0+(?=s$)'), '')
          .replaceAll('.', '_');
      return time;
    }

    return _gdtfName(_titleCase(clean), fallback: _defaultSetName(attribute));
  }

  String _defaultSetName(String attribute) {
    if (attribute == 'Dimmer') {
      return 'Off';
    }
    if (attribute.startsWith('ColorAdd_')) {
      return '0 Percent';
    }
    if (attribute == 'Shutter1' || attribute == 'Shutter1Strobe') {
      return 'Closed';
    }
    return 'Default';
  }

  String _wheelSlotIndexForSet(String attribute, String name) {
    if (!(attribute == 'Color1' || attribute == 'Color1Pos')) {
      return '';
    }
    final compact = _compact(name);
    if (compact.contains('red')) {
      return '2';
    }
    if (compact.contains('green')) {
      return '3';
    }
    if (compact.contains('blue')) {
      return '4';
    }
    if (compact.contains('white')) {
      return '5';
    }
    if (compact.contains('amber')) {
      return '6';
    }
    if (compact.contains('uv')) {
      return '7';
    }
    if (compact.contains('open')) {
      return '1';
    }
    return '';
  }

  // Position physique normalisée d'un ChannelSet, exprimée comme un ratio
  // 0..1 de la plage globale du canal. MA3 utilise ce ratio pour calculer
  // la valeur physique réelle (degrés, %, etc.) à appliquer.
  // Auparavant on ne calculait le ratio que pour Dimmer/ColorAdd ; pour
  // tout le reste (Pan/Tilt/Zoom/…) on retournait 0/1, ce qui faisait que
  // le ChannelSet "Home" Pan/Tilt couvrait toute la plage au lieu du milieu.
  String _physicalFromForSet(String attribute, int from, bool is16Bit) {
    final max = is16Bit ? 65535.0 : 255.0;
    return (from / max).clamp(0.0, 1.0).toStringAsFixed(6);
  }

  String _physicalToForSet(String attribute, int to, bool is16Bit) {
    final max = is16Bit ? 65535.0 : 255.0;
    return (to / max).clamp(0.0, 1.0).toStringAsFixed(6);
  }

  int _scale8BitTo16Bit(int value) {
    return (value.clamp(0, 255) * 257).round();
  }

  int _defaultForName(String name) {
    // Conservé pour compat — utilisé par _addChannel quand un canal manque
    // une valeur par défaut explicite.
    final n = name.toLowerCase();
    if (n.contains('pan') || n.contains('tilt')) {
      return 128;
    }
    return 0;
  }

  // Valeur DMX intégrale (0-255 ou 0-65535) pour un attribut, prenant en
  // compte la résolution effective du canal. Règles :
  //   - Pan/Tilt          → 50% (128 ou 32768)
  //   - Dimmer "réel"     → 0
  //   - ColorAdd_* (LEDs additives R/G/B/W/A/UV/Lime/Mint/RB/WW/CW/C/M/Y)
  //                       → 100% (255 ou 65535)
  //   - ColorSub_*  (CMY soustractif, filtres)
  //                       → 0
  //   - Reste             → 0 (sauf si le nom du canal force 50%)
  // Le Dimmer VIRTUEL est traité à part dans _writeOneDmxChannel
  // (isVirtualDimmer == true) et force toujours 100%.
  // Calcule directement la valeur entière à la résolution voulue plutôt
  // que de multiplier ×257 (qui décale 50% à 50.198%).
  int _defaultDmxValue(String attribute, String channelName, bool is16Bit) {
    // 50% → centre exact
    if (attribute == 'Pan' || attribute == 'Tilt') {
      return is16Bit ? 32768 : 128;
    }
    // 100% → max exact (255 ou 65535)
    if (attribute.startsWith('ColorAdd_')) {
      return is16Bit ? 65535 : 255;
    }
    // 0% → toujours 0
    if (attribute == 'Dimmer' || attribute.startsWith('ColorSub_')) return 0;
    final raw = _defaultForName(channelName);
    return is16Bit ? raw * 257 : raw;
  }

  String _shortNameFromFixture(String name) {
    final cleaned = name.replaceAll(RegExp(r'[^A-Za-z0-9]+'), ' ').trim();
    if (cleaned.isEmpty) {
      return 'Fixture';
    }
    final compact = cleaned
        .split(RegExp(r'\s+'))
        .map((part) => part.isEmpty ? '' : part[0].toUpperCase())
        .join();
    if (compact.length >= 3) {
      return compact.substring(0, compact.length.clamp(0, 12));
    }
    return cleaned.length > 12 ? cleaned.substring(0, 12) : cleaned;
  }

  String _gdtfName(String value, {required String fallback}) {
    var cleaned = _cleanXmlText(value)
        .replaceAll('&', ' and ')
        .replaceAll(RegExp(r"[^A-Za-z0-9 %*=+\-<>\/'@#\(\);]+"), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();

    if (cleaned.isEmpty) {
      cleaned = fallback;
    }
    if (cleaned.length > 60) {
      cleaned = cleaned.substring(0, 60).trim();
    }
    return cleaned;
  }

  String _titleCase(String value) {
    return value
        .replaceAll('_', ' ')
        .replaceAll('-', ' ')
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .map((part) => part.length == 1
            ? part.toUpperCase()
            : '${part[0].toUpperCase()}${part.substring(1).toLowerCase()}')
        .join(' ');
  }

  String _cleanXmlText(String value) {
    return value.replaceAll(RegExp(r'[\x00-\x08\x0B\x0C\x0E-\x1F]'), '').trim();
  }

  String _gdtfFileName({
    required String manufacturer,
    required String fixtureName,
  }) {
    final safeManufacturer = _sanitizeGdtfFilePart(
      manufacturer,
      fallback: 'Manufacturer',
    );
    final safeFixture = _sanitizeGdtfFilePart(
      fixtureName,
      fallback: 'Fixture',
    );
    return '$safeManufacturer@$safeFixture@ShowTechTools.gdtf';
  }

  String _sanitizeGdtfFilePart(String value, {required String fallback}) {
    var cleaned = _cleanXmlText(value)
        .replaceAll('&', ' and ')
        .replaceAll('@', ' ')
        .replaceAll(RegExp(r'[\/:*?"<>|]'), ' ')
        .replaceAll(RegExp(r'[^A-Za-z0-9 _+.,()\-]+'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();

    if (cleaned.isEmpty) {
      cleaned = fallback;
    }

    cleaned = cleaned
        .replaceAll(RegExp(r'\s+'), '_')
        .replaceAll(RegExp(r'_+'), '_')
        .replaceAll(RegExp(r'^[_.-]+|[_.-]+$'), '');

    if (cleaned.isEmpty) {
      cleaned = fallback;
    }

    if (cleaned.length > 56) {
      cleaned = cleaned.substring(0, 56);
      cleaned = cleaned.replaceAll(RegExp(r'[_ .-]+$'), '');
    }

    return cleaned;
  }

  String _compact(String value) {
    return value.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]+'), '');
  }

  String _matrix() {
    return '{1.000000,0.000000,0.000000,0.000000}'
        '{0.000000,1.000000,0.000000,0.000000}'
        '{0.000000,0.000000,1.000000,0.000000}'
        '{0,0,0,1}';
  }

  String _generateUuid() {
    final random = Random.secure();
    final bytes = List<int>.generate(16, (_) => random.nextInt(256));
    bytes[6] = (bytes[6] & 0x0f) | 0x40;
    bytes[8] = (bytes[8] & 0x3f) | 0x80;
    String hex(int b) => b.toRadixString(16).padLeft(2, '0');
    final h = bytes.map(hex).join();
    return '${h.substring(0, 8)}-${h.substring(8, 12)}-${h.substring(12, 16)}-${h.substring(16, 20)}-${h.substring(20)}';
  }

  // ─── UI ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.gdtfTitle),
        actions: [
          const AboutPinButton(pageId: 'tool:lumiere_gdtf_builder', sectionId: 'main'),
          IconButton(
            icon: const Icon(Icons.help_outline),
            tooltip: l10n.gdtfHowToUseThisPageTooltip,
            onPressed: _showWorkflowHelp,
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          // Onglet actif : blanc + gras + barre sous-jacente bleue épaisse.
          // Onglet inactif : gris doux. Sans ça les 2 onglets sont quasi
          // identiques (les deux en bleu sur fond noir) et on ne voit pas
          // sur lequel on est.
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white54,
          labelStyle: const TextStyle(
              fontWeight: FontWeight.w700, fontSize: 14, letterSpacing: 0.3),
          unselectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
          indicatorColor: Colors.blueAccent,
          indicatorWeight: 3,
          indicatorSize: TabBarIndicatorSize.tab,
          // Léger overlay coloré sur l'onglet actif pour renforcer le contraste.
          overlayColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.focused) ||
                states.contains(WidgetState.hovered) ||
                states.contains(WidgetState.pressed)) {
              return Colors.blueAccent.withValues(alpha: 0.08);
            }
            return null;
          }),
          tabs: [
            Tab(icon: const Icon(Icons.search), text: l10n.gdtfSearchTab),
            Tab(
                icon: const Icon(Icons.auto_fix_high),
                text: l10n.gdtfGenerateFromPdfTab),
            Tab(icon: const Icon(Icons.tune), text: l10n.gdtfManualTab),
          ],
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: [_buildSearchTab(), _buildGenerateTab(), _buildManualTab()]),
    );
  }

  // Dialogue d'aide affichant le workflow conseillé pour obtenir un GDTF.
  // Stratégie en 3 étapes (recherche d'abord, IA en fallback, manuel en
  // dernier recours) — évite à l'utilisateur de gaspiller du quota OpenAI
  // sur des fixtures déjà disponibles officiellement sur gdtf-share.com.
  void _showWorkflowHelp() {
    final l10n = AppLocalizations.of(context);
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(children: [
          const Icon(Icons.help_outline, color: Colors.blueAccent),
          const SizedBox(width: 8),
          // Expanded permet au texte de wrapper / s'adapter à la largeur
          // du dialogue. Sans ça : "RIGHT OVERFLOWED BY 60 PIXELS" sur
          // les petits écrans.
          Expanded(child: Text(l10n.gdtfHowToGetGdtfTitle)),
        ]),
        // Scrollbar avec thumb toujours visible : indique à l'utilisateur
        // qu'il y a du contenu en plus en bas du dialogue (sinon on coupe
        // mi-phrase sur les petits écrans et il faut deviner qu'il faut
        // scroller). On garde le SingleChildScrollView pour le scroll lui-même.
        content: Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.gdtfWorkflowIntro,
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 16),
                _HelpStep(
                  step: '1',
                  color: Colors.green,
                  icon: Icons.search,
                  title: l10n.gdtfWorkflowSearchTitle,
                  body: l10n.gdtfWorkflowSearchBody,
                ),
                const SizedBox(height: 12),
                _HelpStep(
                  step: '2',
                  color: Colors.blue,
                  icon: Icons.auto_fix_high,
                  title: l10n.gdtfWorkflowPdfTitle,
                  body: l10n.gdtfWorkflowPdfBody,
                ),
                const SizedBox(height: 12),
                _HelpStep(
                  step: '3',
                  color: Colors.orange,
                  icon: Icons.edit,
                  title: l10n.gdtfWorkflowManualTitle,
                  body: l10n.gdtfWorkflowManualBody,
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.amber.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: Colors.amber.withValues(alpha: 0.4), width: 1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.tips_and_updates,
                          color: Colors.amber, size: 18),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          l10n.gdtfWorkflowTip,
                          style: const TextStyle(
                              color: Colors.amber, fontSize: 12.5, height: 1.4),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(l10n.gdtfUnderstood),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchTab() {
    final l10n = AppLocalizations.of(context);
    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Row(children: [
          Expanded(
            child: TextField(
              controller: _searchCtrl,
              decoration: InputDecoration(
                  hintText: l10n.gdtfSearchHint,
                  labelText: l10n.gdtfFixtureNameLabel,
                  prefixIcon: const Icon(Icons.search),
                  border: const OutlineInputBorder()),
              onSubmitted: (_) => _search(),
              textInputAction: TextInputAction.search,
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: _isSearching ? null : _search,
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 18)),
            child: _isSearching
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2))
                : const Icon(Icons.search),
          ),
        ]),
      ),
      if (_searchError.isNotEmpty)
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Text(_searchError,
                style: const TextStyle(color: Colors.redAccent))),
      Expanded(
        child: _isSearching
            ? const Center(child: CircularProgressIndicator())
            : !_hasSearched
                // Carte d'aide dans un SingleChildScrollView : scrollable
                // quand le clavier s'ouvre et réduit l'espace disponible.
                ? SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                            color: Colors.blue.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.blue.withValues(alpha: 0.3))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              const Icon(Icons.info_outline,
                                  color: Colors.blue, size: 18),
                              const SizedBox(width: 8),
                              Text(
                                l10n.gdtfHowToGetGdtfTitle,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ]),
                            const SizedBox(height: 12),
                            _HelpStep(
                              step: '1',
                              color: Colors.green,
                              icon: Icons.search,
                              title: l10n.gdtfWorkflowSearchTitle,
                              body: l10n.gdtfWorkflowSearchShortBody,
                            ),
                            const SizedBox(height: 10),
                            _HelpStep(
                              step: '2',
                              color: Colors.blue,
                              icon: Icons.auto_fix_high,
                              title: l10n.gdtfWorkflowPdfTitle,
                              body: l10n.gdtfWorkflowPdfShortBody,
                            ),
                            const SizedBox(height: 10),
                            _HelpStep(
                              step: '3',
                              color: Colors.orange,
                              icon: Icons.edit,
                              title: l10n.gdtfWorkflowManualTitle,
                              body: l10n.gdtfWorkflowManualShortBody,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : _results.isEmpty
                    ? _buildNoResults()
                    : ListView.separated(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                        itemCount: _results.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemBuilder: (_, i) => _FixtureCard(
                            fixture: _results[i],
                            onDownload: () => _downloadFixture(_results[i])),
                      ),
      ),
    ]);
  }

  Widget _buildNoResults() {
    final l10n = AppLocalizations.of(context);
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Icon(Icons.search_off, size: 64, color: Colors.white24),
        const SizedBox(height: 16),
        Text(l10n.gdtfNoFixtureFound,
            style: const TextStyle(color: Colors.white54, fontSize: 16)),
        const SizedBox(height: 8),
        Text(l10n.gdtfNoFixtureFoundHelp,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white38, fontSize: 13)),
        const SizedBox(height: 16),
        ElevatedButton.icon(
            icon: const Icon(Icons.auto_fix_high),
            label: Text(l10n.gdtfGenerateFromPdfTab),
            onPressed: () => _tabController.animateTo(1)),
      ]),
    ));
  }

  Widget _buildGenerateTab() {
    switch (_generateStep) {
      case 1:
        return _buildStepModeSelection();
      case 2:
        return _buildStepVerification();
      case 3:
        return _buildStepSuccess();
      default:
        return _buildStepForm();
    }
  }

  // Onglet "Assistant manuel" : point d'entree autonome, au meme niveau que
  // Recherche et Generation PDF (deplace ici depuis le formulaire PDF a la
  // demande de Francois pour etre visible directement, sans devoir d'abord
  // ouvrir l'onglet PDF).
  Widget _buildManualTab() {
    final l10n = AppLocalizations.of(context);
    return ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: [
          SectionCard(
            accentColor: kSectionLight,
            title: l10n.gdtfWizardManualTabTitle,
            icon: Icons.tune,
            child: Text(l10n.gdtfWizardManualTabIntro,
                style: const TextStyle(color: Colors.white70)),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () async {
              final result = await Navigator.of(context).push<List<DmxMode>>(
                MaterialPageRoute(
                    builder: (_) => const GdtfManualWizardPage()),
              );
              if (result != null && result.isNotEmpty) {
                setState(() {
                  _dmxModes = result;
                  _extractWarnings = [];
                  _generateStep = 2;
                  _tabController.animateTo(1);
                });
              }
            },
            icon: const Icon(Icons.tune),
            label: Text(l10n.gdtfWizardManualButtonLabel),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(48),
            ),
          ),
        ]);
  }

  Widget _buildStepForm() {
    final l10n = AppLocalizations.of(context);
    return ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: [
          SectionCard(
            accentColor: kSectionLight,
            title: l10n.gdtfGenerateFromPdfTitle,
            icon: Icons.auto_fix_high,
            child: Text(l10n.gdtfGenerateFromPdfIntro,
                style: const TextStyle(color: Colors.white70)),
          ),
          const SizedBox(height: 16),
          TextField(
              controller: _manufacturerCtrl,
              decoration: InputDecoration(
                  labelText: l10n.gdtfManufacturerLabel,
                  hintText: l10n.gdtfManufacturerHint,
                  prefixIcon: const Icon(Icons.business_outlined),
                  border: const OutlineInputBorder())),
          const SizedBox(height: 12),
          TextField(
              controller: _fixtureNameCtrl,
              decoration: InputDecoration(
                  labelText: l10n.gdtfModelLabel,
                  hintText: l10n.gdtfModelHint,
                  prefixIcon: const Icon(Icons.lightbulb_outline),
                  border: const OutlineInputBorder())),
          const SizedBox(height: 16),
          InkWell(
            onTap: _pickPdf,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: _selectedPdf != null
                        ? Colors.green.withValues(alpha: 0.6)
                        : Colors.white24,
                    width: 1.5),
              ),
              child: Row(children: [
                Icon(
                    _selectedPdf != null
                        ? Icons.picture_as_pdf
                        : Icons.upload_file,
                    color: _selectedPdf != null ? Colors.green : Colors.white54,
                    size: 32),
                const SizedBox(width: 12),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(
                          _selectedPdf != null
                              ? _selectedPdf!.name
                              : l10n.gdtfSelectManualPdf,
                          style: TextStyle(
                              color: _selectedPdf != null
                                  ? Colors.white
                                  : Colors.white54,
                              fontWeight: _selectedPdf != null
                                  ? FontWeight.w600
                                  : FontWeight.normal)),
                      if (_selectedPdf != null)
                        Text(
                            '${(_selectedPdf!.size / 1024).toStringAsFixed(0)} KB',
                            style: const TextStyle(
                                color: Colors.white38, fontSize: 12)),
                    ])),
                const Icon(Icons.chevron_right, color: Colors.white38),
              ]),
            ),
          ),
          const SizedBox(height: 16),
          if (_analyzeError.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.red.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: Colors.red.withValues(alpha: 0.4))),
                child: Row(children: [
                  const Icon(Icons.error_outline,
                      color: Colors.redAccent, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                      child: Text(_analyzeError,
                          style: const TextStyle(color: Colors.redAccent))),
                ]),
              ),
            ),
          SizedBox(
            height: 52,
            child: ElevatedButton.icon(
              onPressed: _isAnalyzing ? null : _analyzePdf,
              icon: _isAnalyzing
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2))
                  : const Icon(Icons.auto_fix_high),
              label: Text(
                  _isAnalyzing ? l10n.gdtfDetectingModes : l10n.gdtfAnalyzePdf),
            ),
          ),
          const SizedBox(height: 12),
          Text(l10n.gdtfAnalyzePdfHelp,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white38, fontSize: 12)),
        ]);
  }

  // ───────────────────────────────────────────────────────────────────────
  // Étape 1 — Sélection des modes à extraire.
  // Après la discovery, on affiche la liste des modes disponibles avec
  // checkboxes. L'utilisateur coche ceux qu'il veut puis lance l'extraction.
  // Pour les fixtures à beaucoup de modes (Astera Titan = 143), on offre
  // une barre de recherche et des actions "tout sélectionner / aucun".
  // ───────────────────────────────────────────────────────────────────────
  Widget _buildStepModeSelection() {
    final l10n = AppLocalizations.of(context);
    final query = _modeSearchCtrl.text.trim().toLowerCase();
    final filtered = query.isEmpty
        ? _discoveredModes
        : _discoveredModes
            .where((m) => m.name.toLowerCase().contains(query))
            .toList();

    final totalCount = _discoveredModes.length;
    final selectedCount = _selectedModeNames.length;

    return Stack(children: [
      Column(children: [
        // Header avec retour et titre.
        Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
          child: Row(children: [
            IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: l10n.gdtfBackToForm,
                onPressed: () => setState(() => _generateStep = 0)),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_fixtureNameCtrl.text} — ${_manufacturerCtrl.text}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    l10n.gdtfDetectedModesInManual(totalCount),
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
          ]),
        ),
        const Divider(height: 1),
        // Barre de recherche + actions globales.
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Row(children: [
            Expanded(
              child: TextField(
                controller: _modeSearchCtrl,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: l10n.gdtfSearchModeHint,
                  prefixIcon: const Icon(Icons.search, size: 20),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  suffixIcon: query.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.close, size: 18),
                          onPressed: () {
                            _modeSearchCtrl.clear();
                            setState(() {});
                          },
                        )
                      : null,
                ),
              ),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: filtered.isEmpty
                  ? null
                  : () => setState(() {
                        _selectedModeNames.addAll(filtered.map((m) => m.name));
                      }),
              child: Text(l10n.gdtfSelectAll),
            ),
            TextButton(
              onPressed: filtered.isEmpty
                  ? null
                  : () => setState(() {
                        for (final m in filtered) {
                          _selectedModeNames.remove(m.name);
                        }
                      }),
              child: Text(l10n.gdtfSelectNone),
            ),
          ]),
        ),
        // Bouton de saisie manuelle d'un mode. Toujours dispo — utile quand
        // l'IA a manqué un mode (rare) ou quand discover a renvoyé 0 (PDF
        // chelou type Clay Paky B-Eye DMX-Channels scanné en 4 colonnes).
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: _addManualMode,
              icon: const Icon(Icons.add, size: 18),
              label: Text(l10n.gdtfAddModeManually),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                visualDensity: VisualDensity.compact,
              ),
            ),
          ),
        ),
        // Compteur "X sélectionnés sur Y".
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              l10n.gdtfSelectedModesCount(selectedCount, totalCount),
              style: const TextStyle(color: Colors.white60, fontSize: 12),
            ),
          ),
        ),
        // Liste scrollable avec checkboxes.
        Expanded(
          child: filtered.isEmpty
              // SingleChildScrollView évite l'overflow quand le clavier du
              // dialogue d'ajout de mode rétrécit la zone disponible. Sans
              // ça, l'empty state (icône + 2 textes + bouton ≈ 280 px) ne
              // tient pas dans la place résiduelle → "BOTTOM OVERFLOWED".
              ? SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Si la liste est vide ET qu'on ne filtre pas, c'est
                      // qu'aucun mode n'a été détecté/ajouté. On guide
                      // l'utilisateur vers la saisie manuelle.
                      if (_discoveredModes.isEmpty && query.isEmpty) ...[
                        const Icon(Icons.search_off,
                            size: 48, color: Colors.white38),
                        const SizedBox(height: 12),
                        Text(
                          l10n.gdtfNoModeDetectedAutomatically,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l10n.gdtfNoModeDetectedHelp,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white54, fontSize: 13),
                        ),
                        const SizedBox(height: 16),
                        FilledButton.icon(
                          onPressed: _addManualMode,
                          icon: const Icon(Icons.add),
                          label: Text(l10n.gdtfAddMode),
                        ),
                      ] else
                        Text(l10n.gdtfNoModeMatchesSearch,
                            style: const TextStyle(color: Colors.white54)),
                    ],
                  ),
                )
              : ListView.builder(
                  // Padding bottom = bouton (52) + bandeau info (~48)
                  // + safe area (24) + container padding (8+12) + marge = ~200 px.
                  // Sans ce padding le dernier mode passe sous le CTA fixe.
                  padding: const EdgeInsets.only(bottom: 200),
                  itemCount: filtered.length,
                  itemBuilder: (context, i) {
                    final mode = filtered[i];
                    final selected = _selectedModeNames.contains(mode.name);
                    return CheckboxListTile(
                      value: selected,
                      onChanged: (v) => setState(() {
                        if (v == true) {
                          _selectedModeNames.add(mode.name);
                        } else {
                          _selectedModeNames.remove(mode.name);
                        }
                      }),
                      title: Text(mode.name,
                          style: const TextStyle(fontWeight: FontWeight.w500)),
                      subtitle: Text(l10n.gdtfDmxChannelCount(mode.channels),
                          style: const TextStyle(
                              color: Colors.white60, fontSize: 12)),
                      controlAffinity: ListTileControlAffinity.leading,
                      // Petit bouton supprimer à droite — utile pour enlever
                      // un mode ajouté manuellement par erreur, ou un mode
                      // halluciné par l'IA.
                      secondary: IconButton(
                        icon: const Icon(Icons.delete_outline,
                            color: Colors.white38, size: 20),
                        tooltip: l10n.gdtfDeleteModeTooltip,
                        onPressed: () => _removeMode(mode),
                      ),
                      dense: true,
                    );
                  },
                ),
        ),
      ]),
      // Bouton CTA en bas + erreur éventuelle. SafeArea + Container fond opaque
      // pour rester au-dessus de la nav bar Android (gesture ou bouton).
      // Caché quand la liste de modes est vide — le bandeau bleu d'info et
      // le bouton "Extraire 0" cachaient le texte d'aide à la saisie manuelle.
      if (_discoveredModes.isNotEmpty)
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: SafeArea(
            top: false,
            // minimum bottom de 24 px pour que sur Android (gesture nav ou
            // bouton physique) le bouton ne soit jamais collé à la zone système.
            minimum: const EdgeInsets.only(bottom: 24),
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border(
                  top: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_extractError.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Colors.red.withValues(alpha: 0.5), width: 1),
                      ),
                      child: Row(children: [
                        const Icon(Icons.error_outline,
                            color: Colors.red, size: 18),
                        const SizedBox(width: 8),
                        Expanded(
                            child: Text(_extractError,
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 13))),
                      ]),
                    ),
                  // Bandeau d'info : prévient que l'extraction peut être longue
                  // (jusqu'à 10 min en worst case quand un mode rate l'IA mini
                  // et passe en gpt-4o). Visible quand on est sur le point
                  // d'extraire OU pendant l'extraction.
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: Colors.blue.withValues(alpha: 0.4), width: 1),
                    ),
                    child: Row(children: [
                      const Icon(Icons.access_time,
                          color: Colors.blueAccent, size: 18),
                      const SizedBox(width: 8),
                      Expanded(
                          child: Text(
                              _isExtracting
                                  ? l10n.gdtfExtractionInProgressLong
                                  : l10n.gdtfExtractionMayTakeLong,
                              style: const TextStyle(
                                  color: Colors.blueAccent, fontSize: 12))),
                    ]),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: FilledButton.icon(
                      icon: _isExtracting
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                  strokeWidth: 2, color: Colors.white),
                            )
                          : const Icon(Icons.download),
                      label: Text(_isExtracting
                          ? l10n.gdtfExtractingChannels
                          : l10n.gdtfExtractModes(selectedCount)),
                      onPressed: (_isExtracting || selectedCount == 0)
                          ? null
                          : _extractSelectedModes,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    ]);
  }

  Widget _buildStepVerification() {
    final l10n = AppLocalizations.of(context);
    return Stack(children: [
      Column(children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
          child: Row(children: [
            IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: l10n.gdtfBackToModeSelection,
                onPressed: () => setState(() => _generateStep = 1)),
            const SizedBox(width: 8),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text('${_fixtureNameCtrl.text} — ${_manufacturerCtrl.text}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 15)),
                  Text(l10n.gdtfDetectedModesCount(_dmxModes.length),
                      style:
                          const TextStyle(color: Colors.white54, fontSize: 12)),
                ])),
          ]),
        ),
        // Bandeau warnings : certains modes ont échoué côté Worker.
        if (_extractWarnings.isNotEmpty)
          Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: Colors.orange.withValues(alpha: 0.5), width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  const Icon(Icons.warning_amber,
                      color: Colors.orange, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    l10n.gdtfUnextractedModesCount(_extractWarnings.length),
                    style: const TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w600,
                        fontSize: 13),
                  ),
                ]),
                const SizedBox(height: 6),
                ..._extractWarnings.map((w) => Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text('• $w',
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 12)),
                    )),
              ],
            ),
          ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 120),
            itemCount: _dmxModes.length,
            itemBuilder: (context, modeIndex) => _buildModeCard(modeIndex),
          ),
        ),
      ]),
      Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: SafeArea(
          top: false,
          // minimum bottom de 24 px pour que sur Android (gesture nav ou
          // bouton physique) le bouton ne soit jamais collé à la zone système.
          minimum: const EdgeInsets.only(bottom: 24),
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border(
                top: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_generateError.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      _generateError,
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 12,
                      ),
                    ),
                  ),
                SizedBox(
                  height: 52,
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _isGenerating ? null : _generateGdtf,
                    icon: _isGenerating
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.download),
                    label: Text(
                      _isGenerating
                          ? l10n.gdtfGenerating
                          : l10n.gdtfGenerateGdtfFile,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  Color _resolutionColor(String res) {
    if (res == '16bit-coarse') return Colors.orange;
    if (res == '16bit-fine') return Colors.orange.withValues(alpha: 0.5);
    return Colors.white24;
  }

  String _resolutionLabel(String res) {
    if (res == '16bit-coarse') return '16C';
    if (res == '16bit-fine') return '16F';
    return '8b';
  }

  Widget _buildModeCard(int modeIndex) {
    final l10n = AppLocalizations.of(context);
    final mode = _dmxModes[modeIndex];
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const Icon(Icons.layers_outlined, color: Colors.white54, size: 18),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                initialValue: mode.name,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: l10n.gdtfModeNameHint),
                onChanged: (v) => mode.name = v,
              ),
            ),
            Text(l10n.gdtfChannelCount(mode.channels.length),
                style: const TextStyle(color: Colors.white38, fontSize: 11)),
            IconButton(
                icon: const Icon(Icons.delete_outline,
                    color: Colors.redAccent, size: 18),
                onPressed: () => setState(() => _dmxModes.removeAt(modeIndex))),
          ]),
          const Divider(color: Colors.white12),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(children: [
              SizedBox(
                  width: 32,
                  child: Text(l10n.gdtfChannelShort,
                      style: const TextStyle(
                          color: Colors.white38, fontSize: 10))),
              SizedBox(width: 4),
              SizedBox(
                  width: 32,
                  child: Text(l10n.gdtfBits,
                      style: const TextStyle(
                          color: Colors.white38, fontSize: 10))),
              SizedBox(width: 4),
              Expanded(
                  flex: 2,
                  child: Text(l10n.gdtfName,
                      style: const TextStyle(
                          color: Colors.white38, fontSize: 10))),
              SizedBox(width: 4),
              SizedBox(width: 28),
              SizedBox(width: 28),
            ]),
          ),
          ...mode.channels.asMap().entries.map((entry) {
            final i = entry.key;
            final ch = entry.value;
            return Column(children: [
              Row(children: [
                SizedBox(
                  width: 32,
                  child: TextFormField(
                    initialValue: ch.number.toString(),
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 12, color: Colors.white54),
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 5),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4))),
                    onChanged: (v) => ch.number = int.tryParse(v) ?? ch.number,
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      final list = ['8bit', '16bit-coarse', '16bit-fine'];
                      ch.resolution =
                          list[(list.indexOf(ch.resolution) + 1) % list.length];
                    });
                  },
                  child: Container(
                    width: 32,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: _resolutionColor(ch.resolution)
                          .withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(4),
                      border:
                          Border.all(color: _resolutionColor(ch.resolution)),
                    ),
                    child: Text(_resolutionLabel(ch.resolution),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 9,
                            color: _resolutionColor(ch.resolution),
                            fontWeight: FontWeight.w700)),
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    initialValue: ch.name,
                    style: const TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 5),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4))),
                    onChanged: (v) => ch.name = v,
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () => setState(() => ch.isExpanded = !ch.isExpanded),
                  child: Container(
                    width: 28,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: ch.isExpanded
                          ? Colors.blue.withValues(alpha: 0.2)
                          : Colors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          color: ch.isExpanded
                              ? Colors.blue.withValues(alpha: 0.6)
                              : Colors.white24),
                    ),
                    child: Icon(
                        ch.isExpanded ? Icons.expand_less : Icons.expand_more,
                        size: 14,
                        color: ch.isExpanded ? Colors.blue : Colors.white54),
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () => setState(() => mode.channels.removeAt(i)),
                  child: const SizedBox(
                      width: 28,
                      child: Icon(Icons.remove_circle_outline,
                          color: Colors.redAccent, size: 16)),
                ),
              ]),
              if (ch.isExpanded)
                Container(
                  margin: const EdgeInsets.only(left: 72, top: 6, bottom: 6),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.04),
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: Colors.blue.withValues(alpha: 0.3)),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Valeur par défaut
                        Row(children: [
                          Expanded(
                              child: Text(l10n.gdtfDefaultValueLabel,
                                  style: const TextStyle(
                                      color: Colors.white38,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600))),
                          SizedBox(
                            width: 56,
                            child: TextFormField(
                              initialValue: ch.defaultValue.toString(),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.white),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 5),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                              onChanged: (v) => ch.defaultValue =
                                  int.tryParse(v)?.clamp(0, 255) ??
                                      ch.defaultValue,
                            ),
                          ),
                        ]),
                        const SizedBox(height: 8),
                        Text(l10n.gdtfValueRangesLabel,
                            style: const TextStyle(
                                color: Colors.white38,
                                fontSize: 10,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(height: 6),
                        TextFormField(
                          initialValue: ch.function,
                          maxLines: null,
                          style: const TextStyle(
                              fontSize: 11, color: Colors.white70, height: 1.5),
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.all(8),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6)),
                            hintText: l10n.gdtfValueRangesHint,
                            hintStyle: const TextStyle(
                                fontSize: 10, color: Colors.white24),
                          ),
                          onChanged: (v) => ch.function = v,
                        ),
                      ]),
                ),
              if (i < mode.channels.length - 1)
                const Divider(color: Colors.white12, height: 8),
            ]);
          }),
          const SizedBox(height: 4),
          TextButton.icon(
            icon: const Icon(Icons.add, size: 14),
            label:
                Text(l10n.gdtfAddChannel, style: const TextStyle(fontSize: 11)),
            onPressed: () => setState(() => mode.channels.add(DmxChannel(
                number: mode.channels.length + 1,
                name: 'Ch${mode.channels.length + 1}',
                function: ''))),
          ),
        ]),
      ),
    );
  }

  Widget _buildStepSuccess() {
    final l10n = AppLocalizations.of(context);
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Icon(Icons.check_circle_outline,
            size: 72, color: Colors.greenAccent),
        const SizedBox(height: 16),
        Text(l10n.gdtfFileGenerated,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        Text(_generateSuccess,
            style: const TextStyle(color: Colors.white54, fontSize: 13)),
        const SizedBox(height: 32),
        ElevatedButton.icon(
          icon: const Icon(Icons.share),
          label: Text(l10n.gdtfShareGdtfFile),
          onPressed: () => _shareGdtfFile(
            filePath: _generateFilePath,
            subject: _generateSuccess,
          ),
        ),
        const SizedBox(height: 10),
        OutlinedButton.icon(
          icon: const Icon(Icons.folder_zip_outlined),
          label: Text(l10n.gdtfShareAsZip),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.orange,
            side: const BorderSide(color: Colors.orange, width: 1),
          ),
          onPressed: () async {
            final src = File(_generateFilePath);
            if (!await src.exists()) return;
            final zipName =
                '${_generateSuccess.toLowerCase().replaceAll(RegExp(r'\.gdtf$'), '').replaceAll(RegExp(r'[^\w\-.]'), '_')}.zip';
            final tmpDir = await getTemporaryDirectory();
            final zipFile = File('${tmpDir.path}/$zipName');
            await zipFile.writeAsBytes(await src.readAsBytes());
            await Share.shareXFiles(
              [XFile(zipFile.path, mimeType: 'application/zip', name: zipName)],
              subject: zipName,
              sharePositionOrigin: _sharePositionOrigin(),
            );
          },
        ),
        const SizedBox(height: 6),
        Text(
          l10n.gdtfZipShareHelp,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.orange,
            fontSize: 11,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.orange.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: Colors.orange.withValues(alpha: 0.45), width: 1),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('📎', style: TextStyle(fontSize: 18)),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.gdtfGmailIosTitle,
                      style: const TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w700,
                          fontSize: 13),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.gdtfGmailIosWarning,
                      style: const TextStyle(
                          color: Colors.orange, fontSize: 12, height: 1.4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          icon: const Icon(Icons.add),
          label: Text(l10n.gdtfGenerateAnotherFile),
          onPressed: () => setState(() {
            _generateStep = 0;
            _selectedPdf = null;
            _dmxModes = [];
            _discoveredModes = [];
            _selectedModeNames = {};
            _cachedPdfText = '';
            _cachedPdfBase64 = '';
            _extractWarnings = [];
            _extractError = '';
            _modeSearchCtrl.clear();
            _generateSuccess = '';
            _generateFilePath = '';
            _generateError = '';
            _fixtureNameCtrl.clear();
            _manufacturerCtrl.clear();
          }),
        ),
      ]),
    ));
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// HELP STEP — petite ligne avec numéro + icône + titre + description
// Utilisée dans la dialogue d'aide et la bannière du tab Recherche pour
// expliquer le workflow en 3 étapes (recherche → IA → manuel).
// ─────────────────────────────────────────────────────────────────────────────

class _HelpStep extends StatelessWidget {
  const _HelpStep({
    required this.step,
    required this.color,
    required this.icon,
    required this.title,
    required this.body,
  });

  final String step;
  final Color color;
  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Pastille numérotée colorée selon l'étape.
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.2),
            shape: BoxShape.circle,
            border: Border.all(color: color.withValues(alpha: 0.6), width: 1),
          ),
          alignment: Alignment.center,
          child: Text(
            step,
            style: TextStyle(
                color: color, fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Icon(icon, color: color, size: 16),
                const SizedBox(width: 6),
                Text(
                  title,
                  style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.5),
                ),
              ]),
              const SizedBox(height: 3),
              Text(
                body,
                style: const TextStyle(
                    color: Colors.white70, fontSize: 12.5, height: 1.35),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// FIXTURE CARD
// ─────────────────────────────────────────────────────────────────────────────

class _FixtureCard extends StatelessWidget {
  const _FixtureCard({required this.fixture, required this.onDownload});
  final GdtfFixture fixture;
  final VoidCallback onDownload;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const Icon(Icons.dataset_outlined, color: Colors.white54, size: 20),
            const SizedBox(width: 8),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(fixture.fixture,
                      style: theme.textTheme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.w700)),
                  Text(fixture.manufacturer,
                      style:
                          const TextStyle(color: Colors.white54, fontSize: 12)),
                ])),
            if (fixture.rating > 0)
              Row(children: [
                const Icon(Icons.star, color: Colors.amber, size: 14),
                const SizedBox(width: 2),
                Text(fixture.rating.toStringAsFixed(1),
                    style: const TextStyle(color: Colors.amber, fontSize: 12)),
              ]),
          ]),
          const SizedBox(height: 8),
          if (fixture.modes.isNotEmpty)
            Wrap(
              spacing: 6,
              runSpacing: 4,
              children: fixture.modes
                  .take(6)
                  .map((m) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.07),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.white12)),
                        child: Text(
                            l10n.gdtfModeFootprint(m.name, m.dmxFootprint),
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 11)),
                      ))
                  .toList(),
            ),
          const SizedBox(height: 10),
          Row(children: [
            Text(fixture.filesizeLabel,
                style: const TextStyle(color: Colors.white38, fontSize: 11)),
            const SizedBox(width: 8),
            Text('v${fixture.version}',
                style: const TextStyle(color: Colors.white38, fontSize: 11)),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: onDownload,
              icon: const Icon(Icons.download, size: 16),
              label: Text(l10n.gdtfDownload),
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  textStyle: const TextStyle(fontSize: 12)),
            ),
          ]),
        ]),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// STORED ZIP ENCODER
// GDTF files are ZIP containers. grandMA3 is stricter than GDTF-Share Builder:
// using STORE (no deflate) makes fixture indexing reliable on USB libraries.
// ─────────────────────────────────────────────────────────────────────────────

class _StoredZipFile {
  const _StoredZipFile(this.name, this.bytes);

  final String name;
  final Uint8List bytes;
}

Uint8List _encodeStoredZip(List<_StoredZipFile> files) {
  final out = BytesBuilder(copy: false);
  final centralDirectory = BytesBuilder(copy: false);
  var offset = 0;
  final now = DateTime.now();
  final dosTime = _zipDosTime(now);
  final dosDate = _zipDosDate(now);

  for (final file in files) {
    final nameBytes = utf8.encode(file.name);
    final crc = _crc32(file.bytes);
    final size = file.bytes.length;
    final localHeader = BytesBuilder(copy: false);

    _writeUint32(localHeader, 0x04034b50); // local file header signature
    _writeUint16(localHeader, 20); // version needed to extract
    _writeUint16(localHeader, 0x0800); // UTF-8 file names
    _writeUint16(localHeader, 0); // compression method: stored
    _writeUint16(localHeader, dosTime);
    _writeUint16(localHeader, dosDate);
    _writeUint32(localHeader, crc);
    _writeUint32(localHeader, size);
    _writeUint32(localHeader, size);
    _writeUint16(localHeader, nameBytes.length);
    _writeUint16(localHeader, 0); // extra length
    localHeader.add(nameBytes);
    localHeader.add(file.bytes);

    final localBytes = localHeader.takeBytes();
    out.add(localBytes);

    _writeUint32(centralDirectory, 0x02014b50); // central file header
    _writeUint16(centralDirectory, 20); // version made by
    _writeUint16(centralDirectory, 20); // version needed
    _writeUint16(centralDirectory, 0x0800); // UTF-8 file names
    _writeUint16(centralDirectory, 0); // stored
    _writeUint16(centralDirectory, dosTime);
    _writeUint16(centralDirectory, dosDate);
    _writeUint32(centralDirectory, crc);
    _writeUint32(centralDirectory, size);
    _writeUint32(centralDirectory, size);
    _writeUint16(centralDirectory, nameBytes.length);
    _writeUint16(centralDirectory, 0); // extra length
    _writeUint16(centralDirectory, 0); // comment length
    _writeUint16(centralDirectory, 0); // disk number start
    _writeUint16(centralDirectory, 0); // internal attrs
    _writeUint32(centralDirectory, 0); // external attrs
    _writeUint32(centralDirectory, offset);
    centralDirectory.add(nameBytes);

    offset += localBytes.length;
  }

  final cdBytes = centralDirectory.takeBytes();
  final cdOffset = offset;
  out.add(cdBytes);

  _writeUint32(out, 0x06054b50); // end of central directory
  _writeUint16(out, 0); // number of this disk
  _writeUint16(out, 0); // disk where central directory starts
  _writeUint16(out, files.length);
  _writeUint16(out, files.length);
  _writeUint32(out, cdBytes.length);
  _writeUint32(out, cdOffset);
  _writeUint16(out, 0); // comment length

  return out.takeBytes();
}

void _writeUint16(BytesBuilder builder, int value) {
  builder.add(
      Uint8List(2)..buffer.asByteData().setUint16(0, value, Endian.little));
}

void _writeUint32(BytesBuilder builder, int value) {
  builder.add(
      Uint8List(4)..buffer.asByteData().setUint32(0, value, Endian.little));
}

int _zipDosTime(DateTime dateTime) {
  return (dateTime.hour << 11) |
      (dateTime.minute << 5) |
      (dateTime.second ~/ 2);
}

int _zipDosDate(DateTime dateTime) {
  final year = dateTime.year < 1980 ? 0 : dateTime.year - 1980;
  return (year << 9) | (dateTime.month << 5) | dateTime.day;
}

int _crc32(Uint8List bytes) {
  var crc = 0xffffffff;
  for (final byte in bytes) {
    crc = _kCrc32Table[(crc ^ byte) & 0xff] ^ (crc >> 8);
  }
  return (crc ^ 0xffffffff) & 0xffffffff;
}

final List<int> _kCrc32Table = List<int>.generate(256, (index) {
  var c = index;
  for (var k = 0; k < 8; k++) {
    if ((c & 1) != 0) {
      c = 0xedb88320 ^ (c >> 1);
    } else {
      c >>= 1;
    }
  }
  return c;
}, growable: false);
