import 'package:flutter/foundation.dart';

/// Transform 3D d'une fixture telle que fournie par l'élément MVR
/// `<Matrix>` : {Xaxis}{Yaxis}{Zaxis}{Translation}, où chaque groupe
/// contient 3 flottants séparés par des virgules. La translation est
/// exprimée en millimètres dans le fichier MVR (convention du standard).
///
/// Volontairement indépendant de tout package de rendu 3D (pas de
/// dépendance vers three_js ici) : la conversion vers les types du
/// moteur de rendu se fait au plus près de l'écran (page visualiseur 3D).
@immutable
class FixtureTransform {
  /// Vecteur colonne X de la matrice de rotation/échelle (3 valeurs).
  final List<double> xAxis;

  /// Vecteur colonne Y de la matrice de rotation/échelle (3 valeurs).
  final List<double> yAxis;

  /// Vecteur colonne Z de la matrice de rotation/échelle (3 valeurs).
  final List<double> zAxis;

  /// Translation en millimètres (convention MVR).
  final List<double> translationMm;

  const FixtureTransform({
    required this.xAxis,
    required this.yAxis,
    required this.zAxis,
    required this.translationMm,
  });

  /// Position en mètres (unité utilisée côté rendu 3D).
  double get positionXMeters => translationMm[0] / 1000.0;
  double get positionYMeters => translationMm[1] / 1000.0;
  double get positionZMeters => translationMm[2] / 1000.0;

  /// Les 16 valeurs d'une matrice 4x4 colonne-majeure (compatible avec la
  /// plupart des moteurs 3D type OpenGL), construite à partir des 3 axes
  /// + translation. La 4e ligne reste (0,0,0,1) : pas de perspective.
  List<double> toColumnMajorMatrix4() {
    return <double>[
      xAxis[0], xAxis[1], xAxis[2], 0,
      yAxis[0], yAxis[1], yAxis[2], 0,
      zAxis[0], zAxis[1], zAxis[2], 0,
      positionXMeters, positionYMeters, positionZMeters, 1,
    ];
  }

  /// Parse le contenu texte d'un élément MVR `<Matrix>` :
  /// "{a,b,c}{d,e,f}{g,h,i}{tx,ty,tz}". Retourne null si le format ne
  /// correspond pas (mieux vaut ignorer la position que la deviner).
  static FixtureTransform? tryParse(String raw) {
    final s = raw.trim();
    if (s.isEmpty) return null;

    final re = RegExp(
      r'\{([^}]*)\}\{([^}]*)\}\{([^}]*)\}\{([^}]*)\}',
    );
    final m = re.firstMatch(s);
    if (m == null) return null;

    List<double>? group(int index) {
      final raw = m.group(index);
      if (raw == null) return null;
      final parts = raw.split(',').map((p) => double.tryParse(p.trim()));
      if (parts.any((v) => v == null)) return null;
      final values = parts.whereType<double>().toList();
      return values.length == 3 ? values : null;
    }

    final x = group(1);
    final y = group(2);
    final z = group(3);
    final t = group(4);
    if (x == null || y == null || z == null || t == null) return null;

    return FixtureTransform(xAxis: x, yAxis: y, zAxis: z, translationMm: t);
  }
}

@immutable
class PatchEntry {
  final String id;

  /// Nom lisible (issu du catalogue ou du MVR)
  final String fixtureName;

  /// Libellé explicite (ex: "Mode 26 canaux")
  final String dmxModeName;

  /// Nombre de canaux occupés (>=1)
  final int channelCount;

  /// Univers DMX (>=1)
  final int universe;

  /// Adresse DMX de départ (1..512)
  final int startAddress;

  /// Nom de fichier GDTF (ex: "Robe_Robin_MegaPointe.gdtf"), quand connu
  /// (issu du MVR). Sert de clé pour retrouver les octets GDTF embarqués
  /// dans le cache de `patchStore`, et pour grouper les fixtures d'un même
  /// type (console virtuelle : contrôle de groupe).
  final String? gdtfSpec;

  /// Position/rotation 3D dans la scène MVR (issue de `<Matrix>`), quand
  /// disponible. Absent pour les patchs saisis manuellement (hors MVR).
  final FixtureTransform? transform;

  const PatchEntry({
    required this.id,
    required this.fixtureName,
    required this.dmxModeName,
    required this.channelCount,
    required this.universe,
    required this.startAddress,
    this.gdtfSpec,
    this.transform,
  });

  int get endAddress => startAddress + channelCount - 1;

  bool get isValidBasics =>
      universe >= 1 &&
      startAddress >= 1 &&
      startAddress <= 512 &&
      channelCount >= 1 &&
      endAddress <= 512;

  /// Clé de groupement "même type de machine" pour la console virtuelle :
  /// on préfère gdtfSpec+mode (fiable), sinon on retombe sur nom+mode+nombre
  /// de canaux (moins précis mais toujours utile sans GDTF embarqué).
  String get groupKey => gdtfSpec != null && gdtfSpec!.trim().isNotEmpty
      ? '${gdtfSpec!.trim().toLowerCase()}::${dmxModeName.trim().toLowerCase()}'
      : '${fixtureName.trim().toLowerCase()}::${dmxModeName.trim().toLowerCase()}::$channelCount';

  PatchEntry copyWith({
    String? id,
    String? fixtureName,
    String? dmxModeName,
    int? channelCount,
    int? universe,
    int? startAddress,
    String? gdtfSpec,
    FixtureTransform? transform,
  }) {
    return PatchEntry(
      id: id ?? this.id,
      fixtureName: fixtureName ?? this.fixtureName,
      dmxModeName: dmxModeName ?? this.dmxModeName,
      channelCount: channelCount ?? this.channelCount,
      universe: universe ?? this.universe,
      startAddress: startAddress ?? this.startAddress,
      gdtfSpec: gdtfSpec ?? this.gdtfSpec,
      transform: transform ?? this.transform,
    );
  }
}

enum PatchConflictType { overlap }

@immutable
class PatchConflict {
  final PatchEntry a;
  final PatchEntry b;
  final PatchConflictType type;

  const PatchConflict(
    this.a,
    this.b, {
    this.type = PatchConflictType.overlap,
  });

  /// Compat ancienne API (certaines pages appellent conflict.existing)
  PatchEntry get existing => b;

  String get message =>
      'Conflit univers ${a.universe} : '
      '${a.startAddress}–${a.endAddress} chevauche '
      '${b.startAddress}–${b.endAddress}';
}

enum PatchIssueCode {
  invalidUniverse,
  invalidStartAddress,
  invalidChannelCount,
  rangeExceedsUniverse,
}

@immutable
class PatchIssue {
  final PatchIssueCode code;
  final String message;

  const PatchIssue(this.code, this.message);
}

@immutable
class PatchValidationResult {
  final List<PatchIssue> issues;
  final List<PatchConflict> conflicts;

  const PatchValidationResult({
    required this.issues,
    required this.conflicts,
  });

  bool get isValid => issues.isEmpty && conflicts.isEmpty;
}

/// Parsing et mapping DMX utilisés par l'import MVR + UI.
class DmxAddressParser {
  static const int _maxAddress = 512;

  /// Parse des formats courants :
  /// - "1.100"
  /// - "1/100"
  /// - "U1 A100"
  /// - "Universe 1 Address 100"
  /// - "100" => address dans l'univers par défaut (1)
  static ({int universe, int address})? tryParse(
    String raw, {
    int defaultUniverse = 1,
  }) {
    final s = raw.trim();
    if (s.isEmpty) return null;

    // Format simple "u.a" ou "u/a"
    final dot = RegExp(r'^\s*(\d+)\s*[./]\s*(\d+)\s*$');
    final mDot = dot.firstMatch(s);
    if (mDot != null) {
      final u = int.tryParse(mDot.group(1) ?? '');
      final a = int.tryParse(mDot.group(2) ?? '');
      if (_isValid(u, a)) return (universe: u!, address: a!);
      return null;
    }

   // Format texte "U1 A100" / "Universe 1 Address 100"
final words = RegExp(
  r'\bU(?:niverse)?\s*(\d+)\b.*\bA(?:ddress)?\s*(\d+)\b',
  caseSensitive: false,
);
final mWords = words.firstMatch(s);
if (mWords != null) {
  final u = int.tryParse(mWords.group(1) ?? '');
  final a = int.tryParse(mWords.group(2) ?? '');
  if (_isValid(u, a)) return (universe: u!, address: a!);
  return null;
}


    // Fallback : nombre seul = address
    final onlyNumber = int.tryParse(s);
    if (onlyNumber != null) {
      final u = defaultUniverse;
      final a = onlyNumber;
      if (_isValid(u, a)) return (universe: u, address: a);
    }

    return null;
  }

  static bool _isValid(int? universe, int? address) {
    if (universe == null || address == null) return false;
    if (universe < 1) return false;
    if (address < 1 || address > _maxAddress) return false;
    return true;
  }
}

class DmxAddressMapping {
  static const int channelsPerUniverse = 512;

  /// Convertit une "absolute address" (1..∞) en (universe, address).
  /// Convention : 1..512 => universe 1, 513..1024 => universe 2, etc.
  static ({int universe, int address})? fromAbsolute(int absoluteAddress) {
    if (absoluteAddress < 1) return null;
    final zeroBased = absoluteAddress - 1;
    final universe = (zeroBased ~/ channelsPerUniverse) + 1;
    final address = (zeroBased % channelsPerUniverse) + 1;
    return (universe: universe, address: address);
  }

  /// Convertit (universe, address) en absolute address.
  static int toAbsolute({required int universe, required int address}) {
    return ((universe - 1) * channelsPerUniverse) + address;
  }
}
