// lib/pages/video/mire_texts.dart
import '../../l10n/app_localizations.dart';

/// Orientation utilisée par les mires "mapping"
enum MappingOrientation { horizontal, vertical }

/// ⚠️ IMPORTANT
/// Il ne doit exister QU’UNE SEULE classe MireTexts dans tout le projet.
/// Les painters et les pages doivent importer CE fichier.
class MireTexts {
  const MireTexts({
    required this.videoSimpleTitle,
    required this.videoComboTitle,
    required this.videoMappingTitle,
    required this.ledTitle,
    required this.ledTilesIdTitle,
    required this.simpleSubtitleGridSafe,
    required this.simpleSubtitleCheckerboard,
    required this.simpleSubtitleColorBars,
    required this.simpleSubtitleUniformity,
    required this.simpleSubtitleComboAll,
    required this.ledSubtitlePixelPerfect,
    required this.ledSubtitleGridLabels,
    required this.ledSubtitleColorBars,
    required this.ledSubtitleUniformity,
    required this.mappingSubtitlePattern,
    required this.orientationHorizontal,
    required this.orientationVertical,
    required this.projectorLabelPattern,
    required this.blendLabel,
    required this.tileMissingPx,
    required this.wallNotMultipleOfTiles,
    required this.tilesSubtitleBase,
    required this.tilesSubtitleTilePhys,
    required this.tilesSubtitlePitchEq,
    required this.tilesSubtitlePitchXY,
    required this.tilesSubtitleWallPhys,
  });

  /// On force ici les strings “pattern” avec placeholders,
  /// parce que les getters Flutter gen sont des fonctions (avec args).
  factory MireTexts.fromLoc(AppLocalizations loc) {
    return MireTexts(
      videoSimpleTitle: loc.mireVideoSimpleTitle,
      videoComboTitle: loc.mireVideoComboTitle,
      videoMappingTitle: loc.mireVideoMappingTitle,
      ledTitle: loc.mireLedTitle,
      ledTilesIdTitle: loc.mireLedTilesIdTitle,

      simpleSubtitleGridSafe: loc.mireSimpleSubtitleGridSafe,
      simpleSubtitleCheckerboard: loc.mireSimpleSubtitleCheckerboard,
      simpleSubtitleColorBars: loc.mireSimpleSubtitleColorBars,
      simpleSubtitleUniformity: loc.mireSimpleSubtitleUniformity,
      simpleSubtitleComboAll: loc.mireSimpleSubtitleComboAll,

      ledSubtitlePixelPerfect: loc.mireLedSubtitlePixelPerfect,
      ledSubtitleGridLabels: loc.mireLedSubtitleGridLabels,
      ledSubtitleColorBars: loc.mireLedSubtitleColorBars,
      ledSubtitleUniformity: loc.mireLedSubtitleUniformity,

      // ✅ Convertit les fonctions générées en "patterns String"
      mappingSubtitlePattern:
          loc.mireMappingSubtitlePattern('{n}', '{percent}', '{orient}'),
      orientationHorizontal: loc.mireOrientationHorizontal,
      orientationVertical: loc.mireOrientationVertical,
      projectorLabelPattern: loc.mireProjectorLabelPattern('{index}'),
      blendLabel: loc.mireBlendLabel,

      tileMissingPx: loc.mireTileMissingPx,
      wallNotMultipleOfTiles: loc.mireWallNotMultipleOfTiles,

      tilesSubtitleBase:
          loc.mireTilesSubtitleBase('{tw}', '{th}', '{nx}', '{ny}'),
      tilesSubtitleTilePhys: loc.mireTilesSubtitleTilePhys('{wcm}', '{hcm}'),
      tilesSubtitlePitchEq: loc.mireTilesSubtitlePitchEq('{pitch}'),
      tilesSubtitlePitchXY: loc.mireTilesSubtitlePitchXY('{px}', '{py}'),
      tilesSubtitleWallPhys: loc.mireTilesSubtitleWallPhys('{wm}', '{hm}'),
    );
  }

  final String videoSimpleTitle;
  final String videoComboTitle;
  final String videoMappingTitle;
  final String ledTitle;
  final String ledTilesIdTitle;

  final String simpleSubtitleGridSafe;
  final String simpleSubtitleCheckerboard;
  final String simpleSubtitleColorBars;
  final String simpleSubtitleUniformity;
  final String simpleSubtitleComboAll;

  final String ledSubtitlePixelPerfect;
  final String ledSubtitleGridLabels;
  final String ledSubtitleColorBars;
  final String ledSubtitleUniformity;

  /// Ex: "N={n} • Overlap {percent}% • {orient}"
  final String mappingSubtitlePattern;

  final String orientationHorizontal;
  final String orientationVertical;

  /// Ex: "PROJO {index}"
  final String projectorLabelPattern;

  final String blendLabel;

  final String tileMissingPx;
  final String wallNotMultipleOfTiles;

  /// Ex: "Tile {tw}x{th} px • Grille {nx} x {ny}"
  final String tilesSubtitleBase;

  /// Ex: "Tile {wcm}×{hcm} cm"
  final String tilesSubtitleTilePhys;

  /// Ex: "Pitch ~ {pitch} mm"
  final String tilesSubtitlePitchEq;

  /// Ex: "Pitch X {px} • Y {py} mm"
  final String tilesSubtitlePitchXY;

  /// Ex: "Mur ~ {wm}×{hm} m"
  final String tilesSubtitleWallPhys;

  String projectorLabel(int index) =>
      projectorLabelPattern.replaceAll('{index}', '$index');

  String mappingSubtitle({
    required int n,
    required double percent,
    required MappingOrientation orientation,
  }) {
    final orient = orientation == MappingOrientation.horizontal
        ? orientationHorizontal
        : orientationVertical;

    return mappingSubtitlePattern
        .replaceAll('{n}', '$n')
        .replaceAll('{percent}', percent.toStringAsFixed(1))
        .replaceAll('{orient}', orient);
  }

  String pitchEq(String pitch) =>
      tilesSubtitlePitchEq.replaceAll('{pitch}', pitch);

  String pitchXY(String px, String py) =>
      tilesSubtitlePitchXY.replaceAll('{px}', px).replaceAll('{py}', py);

  String tilePhys(String wcm, String hcm) =>
      tilesSubtitleTilePhys.replaceAll('{wcm}', wcm).replaceAll('{hcm}', hcm);

  String wallPhys(String wm, String hm) =>
      tilesSubtitleWallPhys.replaceAll('{wm}', wm).replaceAll('{hm}', hm);

  String tilesBase({
    required int tw,
    required int th,
    required int nx,
    required int ny,
  }) {
    return tilesSubtitleBase
        .replaceAll('{tw}', '$tw')
        .replaceAll('{th}', '$th')
        .replaceAll('{nx}', '$nx')
        .replaceAll('{ny}', '$ny');
  }
}
