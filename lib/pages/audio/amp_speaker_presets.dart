// lib/pages/audio/amp_speaker_presets.dart
//
// Base de données amplis / enceintes pour l'outil « Charge Ampli / Enceintes ».
//
// Sources : fiches techniques et pages produit des fabricants (vérifiées en
// octobre 2026). Conventions :
//   • Amplis   : puissance PAR VOIE, tous canaux en service, aux impédances
//                publiées. d&b : valeurs à CF 6 dB quand elles sont publiées.
//   • Enceintes : `pRms` = tenue en puissance continue / RMS / AES publiée.
//                 Nexo publie une plage d'ampli recommandée (`ampMin`–`ampMax`)
//                 plutôt qu'une tenue en puissance.
//                 L-Acoustics ne publie (presque) jamais de tenue en puissance :
//                 `pRms` = null → seule l'impédance est vérifiée.
//   • Enceintes actives (multi-amplifiées) : une entrée par section
//     (LF, HF, Front, Rear…) car chaque section a sa propre voie d'ampli.
//     Pour l'affichage, [groupSpeakerModels] regroupe ces sections en UNE
//     enceinte ([SpkModel]) : on choisit l'enceinte, puis la section.
//   • Pas d'enceintes auto-amplifiées (Meyer, RCF actives, L-Acoustics 108P…) :
//     elles n'ont pas de sens dans cet outil.

import 'dart:math' as math;

/// Un point de la courbe de puissance d'un ampli : [w] watts sous [z] ohms.
class R {
  final double z;
  final double w;
  const R(this.z, this.w);
}

class AmpPreset {
  final String brand;
  final String model;
  final int channels;

  /// Impédance minimale supportée par voie (Ω).
  final double zMin;

  /// Puissance par voie (W) aux impédances publiées.
  final List<R> ratings;

  /// Remarque technique courte (neutre en langue : chiffres, sigles).
  final String? note;

  /// Lien vers le manuel / la page produit.
  final String? manualUrl;

  const AmpPreset({
    required this.brand,
    required this.model,
    required this.channels,
    required this.zMin,
    required this.ratings,
    this.note,
    this.manualUrl,
  });

  /// Clé stable pour retrouver un même produit d'une version du catalogue à l'autre.
  String get key => '$brand|$model';

  String get fullName => '$brand $model';

  /// Points (Z, P) triés par impédance croissante.
  List<R> get sortedRatings => [...ratings]..sort((a, b) => a.z.compareTo(b.z));

  /// Puissance disponible sur une voie chargée par [z] Ω.
  ///  • entre deux points publiés : interpolation log-log ;
  ///  • au-dessus du point le plus haut : limitation en tension (P ∝ 1/Z) ;
  ///  • sous le point le plus bas (mais ≥ zMin) : limitation en courant,
  ///    estimation prudente (P ∝ Z).
  double powerAt(double z) {
    final pts = sortedRatings;
    if (pts.isEmpty || z <= 0) return 0;
    final lo = pts.first;
    final hi = pts.last;
    if (z <= lo.z) return lo.w * z / lo.z;
    if (z >= hi.z) return hi.w * hi.z / z;
    for (var i = 0; i < pts.length - 1; i++) {
      final a = pts[i], b = pts[i + 1];
      if (z >= a.z && z <= b.z) {
        if (a.w <= 0 || b.w <= 0) return a.w;
        final t = (_ln(z) - _ln(a.z)) / (_ln(b.z) - _ln(a.z));
        return _exp(_ln(a.w) + t * (_ln(b.w) - _ln(a.w)));
      }
    }
    return hi.w;
  }
}

class SpkPreset {
  final String brand;
  final String model;

  /// Section pilotée par une voie d'ampli (enceintes actives). null = large bande.
  final String? section;

  /// Impédance nominale de la charge vue par la voie (Ω).
  final double zNom;

  /// Tenue en puissance RMS / AES / continue (W). null = non publiée.
  final double? pRms;

  /// Plage d'ampli recommandée par le fabricant (W à zNom), ex. Nexo.
  final double? ampMin;
  final double? ampMax;

  final String? note;

  /// Type (Line array, Point source, Subwoofer…) et lien manuel (catalogue).
  final String? type;
  final String? manualUrl;

  const SpkPreset({
    required this.brand,
    required this.model,
    this.section,
    required this.zNom,
    this.pRms,
    this.ampMin,
    this.ampMax,
    this.note,
    this.type,
    this.manualUrl,
  });

  String get key => '$brand|$model|${section ?? ''}';

  String get label => section == null ? model : '$model — $section';
  String get fullName => '$brand $label';
  bool get isSection => section != null;
  bool get hasRange => ampMin != null || ampMax != null;
}

/// Une enceinte (un modèle physique) avec ses sections pilotées séparément.
/// Ex. K2 = LF (×2 ch) + MF + HF. Une enceinte passive n'a qu'une section
/// (section == null). Certains modèles existent en passif ET en actif
/// (Nexo P12 : passif, LF, HF) : toutes ces variantes sont regroupées ici.
class SpkModel {
  final String brand;
  final String model;
  final List<SpkPreset> sections;

  const SpkModel({
    required this.brand,
    required this.model,
    required this.sections,
  });

  String get key => '$brand|$model';
  String get fullName => '$brand $model';
  bool get hasSections => sections.length > 1 || sections.first.isSection;

  String? get type {
    for (final s in sections) {
      if (s.type != null) return s.type;
    }
    return null;
  }

  String? get manualUrl {
    for (final s in sections) {
      if (s.manualUrl != null) return s.manualUrl;
    }
    return null;
  }

  String? get note {
    for (final s in sections) {
      if (s.note != null) return s.note;
    }
    return null;
  }

  bool get hasPowerData => sections.any((s) => s.pRms != null || s.hasRange);
}

/// Regroupe les entrées par enceinte (marque + modèle), dans l'ordre
/// d'apparition du catalogue.
List<SpkModel> groupSpeakerModels(List<SpkPreset> presets) {
  final map = <String, List<SpkPreset>>{};
  for (final p in presets) {
    map.putIfAbsent('${p.brand}|${p.model}', () => []).add(p);
  }
  return [
    for (final list in map.values)
      SpkModel(brand: list.first.brand, model: list.first.model, sections: list),
  ];
}

double _ln(double x) => math.log(x);
double _exp(double x) => math.exp(x);

// ═════════════════════════════════════════════════════════════════════════════
// AMPLIS
// ═════════════════════════════════════════════════════════════════════════════

const kAmpPresets = <AmpPreset>[
  // ── L-Acoustics ──
  AmpPreset(brand: 'L-Acoustics', model: 'LA2Xi', channels: 4, zMin: 4,
      ratings: [R(16, 190), R(8, 360), R(4, 640)], note: 'SE · BTL 2×1260 W @ 8 Ω'),
  AmpPreset(brand: 'L-Acoustics', model: 'LA4X', channels: 4, zMin: 4,
      ratings: [R(8, 1000), R(4, 1000)]),
  AmpPreset(brand: 'L-Acoustics', model: 'LA7.16i', channels: 16, zMin: 4,
      ratings: [R(16, 700), R(8, 1300), R(4, 1100)]),
  AmpPreset(brand: 'L-Acoustics', model: 'LA8', channels: 4, zMin: 2.7,
      ratings: [R(8, 1100), R(4, 1800), R(2.7, 1800)]),
  AmpPreset(brand: 'L-Acoustics', model: 'LA12X', channels: 4, zMin: 2.7,
      ratings: [R(8, 1400), R(4, 2600), R(2.7, 3300)]),

  // ── d&b audiotechnik ──
  AmpPreset(brand: 'd&b audiotechnik', model: 'D6', channels: 2, zMin: 4,
      ratings: [R(8, 350), R(4, 600)]),
  AmpPreset(brand: 'd&b audiotechnik', model: '10D', channels: 4, zMin: 4,
      ratings: [R(8, 350), R(4, 700)]),
  AmpPreset(brand: 'd&b audiotechnik', model: '30D', channels: 4, zMin: 4,
      ratings: [R(8, 800), R(4, 1000)], note: 'CF 6 dB · 1600 W @ 4 Ω (CF 12 dB)'),
  AmpPreset(brand: 'd&b audiotechnik', model: 'D20', channels: 4, zMin: 4,
      ratings: [R(8, 800), R(4, 1600)]),
  AmpPreset(brand: 'd&b audiotechnik', model: 'D40', channels: 4, zMin: 4,
      ratings: [R(8, 2000), R(4, 2400)]),
  AmpPreset(brand: 'd&b audiotechnik', model: '40D', channels: 4, zMin: 4,
      ratings: [R(8, 2000), R(4, 2400)]),
  AmpPreset(brand: 'd&b audiotechnik', model: 'D80', channels: 4, zMin: 3,
      ratings: [R(8, 2000), R(4, 2600)],
      note: 'CF 6 dB · 4000 W @ 4 Ω (CF 12 dB) · SL-SUB / J-INFRA 3 Ω'),
  AmpPreset(brand: 'd&b audiotechnik', model: 'D90', channels: 4, zMin: 4,
      ratings: [R(8, 2700), R(4, 5400)]),

  // ── Lab.gruppen ──
  AmpPreset(brand: 'Lab.gruppen', model: 'D 20:4L', channels: 4, zMin: 2,
      ratings: [R(8, 500), R(4, 500), R(2, 500)],
      note: 'RPM · 1 ch : 1600 W @ 4 Ω'),
  AmpPreset(brand: 'Lab.gruppen', model: 'FP 10000Q', channels: 4, zMin: 2,
      ratings: [R(8, 1300), R(4, 2100)]),
  AmpPreset(brand: 'Lab.gruppen', model: 'FP 14000', channels: 2, zMin: 2,
      ratings: [R(8, 2350), R(4, 4400)]),
  AmpPreset(brand: 'Lab.gruppen', model: 'PLM 12K44', channels: 4, zMin: 2,
      ratings: [R(8, 1900), R(4, 3000), R(2, 3000)]),
  AmpPreset(brand: 'Lab.gruppen', model: 'PLM 20K44', channels: 4, zMin: 2,
      ratings: [R(8, 2300), R(4, 4400), R(2, 4400)]),

  // ── Powersoft ──
  AmpPreset(brand: 'Powersoft', model: 'T302', channels: 2, zMin: 2,
      ratings: [R(8, 1200), R(4, 1500), R(2, 1500)]),
  AmpPreset(brand: 'Powersoft', model: 'T602', channels: 2, zMin: 2,
      ratings: [R(8, 1300), R(4, 2500), R(2, 3000)]),
  AmpPreset(brand: 'Powersoft', model: 'T902', channels: 2, zMin: 2,
      ratings: [R(8, 1800), R(4, 3200), R(2, 4000)]),
  AmpPreset(brand: 'Powersoft', model: 'T304', channels: 4, zMin: 2,
      ratings: [R(8, 750), R(4, 750), R(2, 750)]),
  AmpPreset(brand: 'Powersoft', model: 'T604', channels: 4, zMin: 2,
      ratings: [R(8, 1250), R(4, 1500), R(2, 1500)]),
  AmpPreset(brand: 'Powersoft', model: 'T904', channels: 4, zMin: 2,
      ratings: [R(8, 1600), R(4, 2000), R(2, 1800)]),
  AmpPreset(brand: 'Powersoft', model: 'X4', channels: 4, zMin: 2,
      ratings: [R(8, 1600), R(4, 3000), R(2, 5200)]),
  AmpPreset(brand: 'Powersoft', model: 'X8', channels: 8, zMin: 2,
      ratings: [R(8, 1600), R(4, 3000), R(2, 5200)]),
  AmpPreset(brand: 'Powersoft', model: 'X4L', channels: 4, zMin: 2,
      ratings: [R(8, 4800), R(4, 6800), R(2, 8200)]),
  AmpPreset(brand: 'Powersoft', model: 'K10', channels: 2, zMin: 2,
      ratings: [R(8, 2000), R(4, 4000), R(2, 6000)]),
  AmpPreset(brand: 'Powersoft', model: 'Quattrocanali 8804', channels: 4,
      zMin: 2, ratings: [R(8, 1600), R(4, 2400), R(2, 1800)]),
  AmpPreset(brand: 'Powersoft', model: 'Ottocanali 12K4', channels: 8,
      zMin: 2, ratings: [R(8, 850), R(4, 1500), R(2, 1000)]),

  // ── Crown ──
  AmpPreset(brand: 'Crown', model: 'XLS 1502', channels: 2, zMin: 2,
      ratings: [R(8, 300), R(4, 525), R(2, 775)]),
  AmpPreset(brand: 'Crown', model: 'XLS 2502', channels: 2, zMin: 2,
      ratings: [R(8, 440), R(4, 775), R(2, 1200)]),
  AmpPreset(brand: 'Crown', model: 'XTi 4002', channels: 2, zMin: 2,
      ratings: [R(8, 650), R(4, 1200), R(2, 1600)]),
  AmpPreset(brand: 'Crown', model: 'I-Tech 4x3500HD', channels: 4, zMin: 2,
      ratings: [R(8, 1900), R(4, 2400), R(2, 2100)], note: '1 kHz burst'),

  // ── QSC ──
  AmpPreset(brand: 'QSC', model: 'PLD4.2', channels: 4, zMin: 2,
      ratings: [R(8, 400), R(4, 400), R(2, 325)], note: 'FAST'),
  AmpPreset(brand: 'QSC', model: 'PLD4.5', channels: 4, zMin: 2,
      ratings: [R(8, 1150), R(4, 1250), R(2, 625)], note: 'FAST'),

  // ── Nexo ──
  AmpPreset(brand: 'Nexo', model: 'NXAMP4x1mk2', channels: 4, zMin: 2,
      ratings: [R(8, 600), R(4, 900), R(2, 1300)]),
  AmpPreset(brand: 'Nexo', model: 'NXAMP4x4mk2', channels: 4, zMin: 2,
      ratings: [R(8, 1900), R(4, 3300), R(2, 4500)]),

  // ── Martin Audio ──
  AmpPreset(brand: 'Martin Audio', model: 'iK41', channels: 4, zMin: 2,
      ratings: [R(8, 750), R(4, 1500), R(2, 1500)]),
  AmpPreset(brand: 'Martin Audio', model: 'iK42', channels: 4, zMin: 2,
      ratings: [R(8, 1500), R(4, 3000), R(2, 5000)]),
  AmpPreset(brand: 'Martin Audio', model: 'iK81', channels: 8, zMin: 2,
      ratings: [R(8, 1250), R(4, 1250), R(2, 1250)]),

  // ── Yamaha ──
  AmpPreset(brand: 'Yamaha', model: 'PX8', channels: 2, zMin: 2,
      ratings: [R(8, 800), R(4, 1050), R(2, 600)]),
  AmpPreset(brand: 'Yamaha', model: 'PX10', channels: 2, zMin: 2,
      ratings: [R(8, 1000), R(4, 1200), R(2, 700)]),
];

// ═════════════════════════════════════════════════════════════════════════════
// ENCEINTES
// ═════════════════════════════════════════════════════════════════════════════

const _la = 'L-Acoustics';
const _db = 'd&b audiotechnik';
const _ad = 'Adamson';
const _nx = 'Nexo';
const _jbl = 'JBL';
const _ev = 'Electro-Voice';
const _ma = 'Martin Audio';

const kSpkPresets = <SpkPreset>[
  // ── L-Acoustics (tenue en puissance non publiée sauf mention) ──
  SpkPreset(brand: _la, model: 'X4i', zNom: 16),
  SpkPreset(brand: _la, model: '5XT', zNom: 16),
  SpkPreset(brand: _la, model: 'X8', zNom: 8),
  SpkPreset(brand: _la, model: 'X12', zNom: 8),
  SpkPreset(brand: _la, model: 'X15 HiQ', section: 'LF', zNom: 8),
  SpkPreset(brand: _la, model: 'X15 HiQ', section: 'HF', zNom: 8),
  SpkPreset(brand: _la, model: 'A10 / A10i (Focus · Wide)', zNom: 8),
  SpkPreset(brand: _la, model: 'Syva', zNom: 8),
  SpkPreset(brand: _la, model: 'Kiva II', zNom: 16),
  SpkPreset(brand: _la, model: 'ARCS II', section: 'LF', zNom: 8, pRms: 600),
  SpkPreset(brand: _la, model: 'ARCS II', section: 'HF', zNom: 8, pRms: 100),
  SpkPreset(brand: _la, model: 'Kara II / Kara IIi', section: 'LF', zNom: 8),
  SpkPreset(brand: _la, model: 'Kara II / Kara IIi', section: 'HF', zNom: 8),
  SpkPreset(brand: _la, model: 'K3', section: 'LF', zNom: 8),
  SpkPreset(brand: _la, model: 'K3', section: 'HF', zNom: 8),
  SpkPreset(brand: _la, model: 'K2', section: 'LF (×2 ch)', zNom: 8),
  SpkPreset(brand: _la, model: 'K2', section: 'MF', zNom: 8),
  SpkPreset(brand: _la, model: 'K2', section: 'HF', zNom: 16),
  SpkPreset(brand: _la, model: 'SB15m', zNom: 8),
  SpkPreset(brand: _la, model: 'SB18', zNom: 8),
  SpkPreset(brand: _la, model: 'KS21', zNom: 8),
  SpkPreset(brand: _la, model: 'SB28', zNom: 4, pRms: 655),
  SpkPreset(brand: _la, model: 'KS28', zNom: 4),

  // ── d&b audiotechnik (RMS, crête 10 ms ×4) ──
  SpkPreset(brand: _db, model: '5S', zNom: 16, pRms: 60),
  SpkPreset(brand: _db, model: '44S', zNom: 16, pRms: 150),
  SpkPreset(brand: _db, model: '8S', zNom: 12, pRms: 150),
  SpkPreset(brand: _db, model: '10S', zNom: 12, pRms: 200),
  SpkPreset(brand: _db, model: '24S', zNom: 4, pRms: 500),
  SpkPreset(brand: _db, model: 'E8', zNom: 12, pRms: 150),
  SpkPreset(brand: _db, model: 'E12', zNom: 8, pRms: 300),
  SpkPreset(brand: _db, model: 'T10', zNom: 16, pRms: 200),
  SpkPreset(brand: _db, model: 'M4', zNom: 8, pRms: 400),
  SpkPreset(brand: _db, model: 'M6', zNom: 8, pRms: 400),
  SpkPreset(brand: _db, model: 'Q1', zNom: 8, pRms: 400),
  SpkPreset(brand: _db, model: 'Q7', zNom: 8, pRms: 400),
  SpkPreset(brand: _db, model: 'Q-SUB', zNom: 8, pRms: 400),
  SpkPreset(brand: _db, model: 'Y7P', zNom: 8, pRms: 400),
  SpkPreset(brand: _db, model: 'Y10P', zNom: 8, pRms: 400),
  SpkPreset(brand: _db, model: 'Y8', zNom: 8, pRms: 400),
  SpkPreset(brand: _db, model: 'Y12', zNom: 8, pRms: 400),
  SpkPreset(brand: _db, model: 'Y-SUB', zNom: 8, pRms: 600),
  SpkPreset(brand: _db, model: 'V7P', zNom: 8, pRms: 500),
  SpkPreset(brand: _db, model: 'V10P', zNom: 8, pRms: 500),
  SpkPreset(brand: _db, model: 'V8', zNom: 8, pRms: 500),
  SpkPreset(brand: _db, model: 'V12', zNom: 8, pRms: 500),
  SpkPreset(brand: _db, model: 'V-SUB', zNom: 8, pRms: 800),
  SpkPreset(brand: _db, model: 'V-GSUB', zNom: 8, pRms: 800),
  SpkPreset(brand: _db, model: '18S-SUB', zNom: 8, pRms: 400),
  SpkPreset(brand: _db, model: '21S-SUB', zNom: 4, pRms: 650),
  SpkPreset(brand: _db, model: 'J8 / J12', section: 'LF', zNom: 6, pRms: 500),
  SpkPreset(brand: _db, model: 'J8 / J12', section: 'MHF', zNom: 12, pRms: 200),
  SpkPreset(brand: _db, model: 'J-SUB', section: 'Front', zNom: 4, pRms: 800),
  SpkPreset(brand: _db, model: 'J-SUB', section: 'Rear', zNom: 8, pRms: 400),
  SpkPreset(brand: _db, model: 'J-INFRA', section: 'Front', zNom: 3, pRms: 1200),
  SpkPreset(brand: _db, model: 'J-INFRA', section: 'Rear', zNom: 6, pRms: 600),
  SpkPreset(brand: _db, model: 'KSL8 / KSL12', section: 'Front LF', zNom: 8, pRms: 450),
  SpkPreset(brand: _db, model: 'KSL8 / KSL12', section: 'Side LF/MF/HF', zNom: 8, pRms: 250),
  SpkPreset(brand: _db, model: 'KSL-SUB', section: 'Front', zNom: 4, pRms: 900),
  SpkPreset(brand: _db, model: 'KSL-SUB', section: 'Rear', zNom: 8, pRms: 500),
  SpkPreset(brand: _db, model: 'GSL8 / GSL12', section: 'Front LF', zNom: 4, pRms: 800),
  SpkPreset(brand: _db, model: 'GSL8 / GSL12', section: 'Side LF/MF/HF', zNom: 4, pRms: 800),
  SpkPreset(brand: _db, model: 'SL-SUB', section: 'Front', zNom: 3, pRms: 1000),
  SpkPreset(brand: _db, model: 'SL-SUB', section: 'Rear', zNom: 6, pRms: 500),

  // ── Adamson (AES) ──
  SpkPreset(brand: _ad, model: 'PC8', zNom: 4, pRms: 300),
  SpkPreset(brand: _ad, model: 'PC10', zNom: 4, pRms: 330),
  SpkPreset(brand: _ad, model: 'PC12', zNom: 4, pRms: 430),
  SpkPreset(brand: _ad, model: 'IS7', section: 'LF', zNom: 16, pRms: 500),
  SpkPreset(brand: _ad, model: 'IS7', section: 'HF', zNom: 16, pRms: 110),
  SpkPreset(brand: _ad, model: 'S7', section: 'LF', zNom: 8, pRms: 500),
  SpkPreset(brand: _ad, model: 'S7', section: 'HF', zNom: 8, pRms: 110),
  SpkPreset(brand: _ad, model: 'S10', section: 'LF', zNom: 8, pRms: 700),
  SpkPreset(brand: _ad, model: 'S10', section: 'HF', zNom: 8, pRms: 160),
  SpkPreset(brand: _ad, model: 'S118', zNom: 8, pRms: 500),
  SpkPreset(brand: _ad, model: 'S119', zNom: 8, pRms: 1200),
  SpkPreset(brand: _ad, model: 'E12', section: 'LF (×2 ch)', zNom: 8, pRms: 800),
  SpkPreset(brand: _ad, model: 'E12', section: 'MF', zNom: 8, pRms: 350),
  SpkPreset(brand: _ad, model: 'E12', section: 'HF', zNom: 8, pRms: 160),
  SpkPreset(brand: _ad, model: 'E15', section: 'LF (×2 ch)', zNom: 8, pRms: 800),
  SpkPreset(brand: _ad, model: 'E15', section: 'MF', zNom: 16, pRms: 700),
  SpkPreset(brand: _ad, model: 'E15', section: 'HF', zNom: 16, pRms: 320),
  SpkPreset(brand: _ad, model: 'E119', zNom: 8, pRms: 1600),
  SpkPreset(brand: _ad, model: 'E219', section: 'LF (×2 ch)', zNom: 8, pRms: 1600),

  // ── Nexo (plage d'ampli recommandée) ──
  SpkPreset(brand: _nx, model: 'ID24', zNom: 16, ampMin: 200, ampMax: 500),
  SpkPreset(brand: _nx, model: 'PS8', zNom: 8, ampMin: 200, ampMax: 500),
  SpkPreset(brand: _nx, model: 'PS10 R2', zNom: 8, ampMin: 500, ampMax: 1250),
  SpkPreset(brand: _nx, model: 'PS15 R2', zNom: 8, ampMin: 1000, ampMax: 2000),
  SpkPreset(brand: _nx, model: 'PS15 R2', section: 'LF', zNom: 8, ampMin: 1000, ampMax: 2000),
  SpkPreset(brand: _nx, model: 'PS15 R2', section: 'HF', zNom: 16, ampMin: 250, ampMax: 500),
  SpkPreset(brand: _nx, model: 'P8', zNom: 8, ampMin: 350, ampMax: 550),
  SpkPreset(brand: _nx, model: 'P10', zNom: 8, ampMin: 550, ampMax: 870),
  SpkPreset(brand: _nx, model: 'P12', zNom: 8, ampMin: 800, ampMax: 1270),
  SpkPreset(brand: _nx, model: 'P12', section: 'LF', zNom: 8, ampMin: 800, ampMax: 1270),
  SpkPreset(brand: _nx, model: 'P12', section: 'HF', zNom: 8, ampMin: 400, ampMax: 630),
  SpkPreset(brand: _nx, model: 'P15', zNom: 8, ampMin: 800, ampMax: 1350),
  SpkPreset(brand: _nx, model: 'P15', section: 'LF', zNom: 8, ampMin: 800, ampMax: 1350),
  SpkPreset(brand: _nx, model: 'P15', section: 'HF', zNom: 8, ampMin: 400, ampMax: 630),
  SpkPreset(brand: _nx, model: 'P18', zNom: 8, ampMin: 1200, ampMax: 1900),
  SpkPreset(brand: _nx, model: 'P18', section: 'LF', zNom: 8, ampMin: 1200, ampMax: 1900),
  SpkPreset(brand: _nx, model: 'P18', section: 'HF', zNom: 8, ampMin: 600, ampMax: 950),
  SpkPreset(brand: _nx, model: 'GEO M6 (M620)', zNom: 8, ampMax: 450),
  SpkPreset(brand: _nx, model: 'GEO M10 (M1012)', zNom: 8, ampMax: 750),
  SpkPreset(brand: _nx, model: 'GEO S12 (S1210)', section: 'LF', zNom: 16, ampMin: 500, ampMax: 900),
  SpkPreset(brand: _nx, model: 'GEO S12 (S1210)', section: 'HF', zNom: 16, ampMin: 250, ampMax: 450),
  SpkPreset(brand: _nx, model: 'LS18', zNom: 8),
  SpkPreset(brand: _nx, model: 'L18', zNom: 4, ampMin: 1550, ampMax: 2450),
  SpkPreset(brand: _nx, model: 'RS18', section: 'Omni', zNom: 4, ampMin: 2000, ampMax: 4000),
  SpkPreset(brand: _nx, model: 'RS18', section: 'Cardio (×2 ch)', zNom: 8, ampMin: 1000, ampMax: 2000),

  // ── JBL (puissance continue) ──
  SpkPreset(brand: _jbl, model: 'JRX212', zNom: 8, pRms: 250),
  SpkPreset(brand: _jbl, model: 'JRX215', zNom: 8, pRms: 250),
  SpkPreset(brand: _jbl, model: 'JRX225', zNom: 4, pRms: 500),
  SpkPreset(brand: _jbl, model: 'JRX218S', zNom: 4, pRms: 350),
  SpkPreset(brand: _jbl, model: 'SRX812', zNom: 8, pRms: 800),
  SpkPreset(brand: _jbl, model: 'SRX815', zNom: 8, pRms: 800),
  SpkPreset(brand: _jbl, model: 'SRX835', zNom: 8, pRms: 800),
  SpkPreset(brand: _jbl, model: 'SRX818S', zNom: 8, pRms: 600),
  SpkPreset(brand: _jbl, model: 'SRX828S', zNom: 4, pRms: 1200),
  SpkPreset(brand: _jbl, model: 'VRX928LA', zNom: 8, pRms: 400),
  SpkPreset(brand: _jbl, model: 'VRX932LA-1', zNom: 8, pRms: 800),
  SpkPreset(brand: _jbl, model: 'VRX915M', zNom: 8, pRms: 800),
  SpkPreset(brand: _jbl, model: 'VRX918S', zNom: 8, pRms: 800),

  // ── Electro-Voice (puissance continue / long terme) ──
  SpkPreset(brand: _ev, model: 'ZLX-12', zNom: 8, pRms: 250),
  SpkPreset(brand: _ev, model: 'ZLX-15', zNom: 8, pRms: 250),
  SpkPreset(brand: _ev, model: 'ELX200-10', zNom: 8, pRms: 300),
  SpkPreset(brand: _ev, model: 'ELX200-12', zNom: 8, pRms: 300),
  SpkPreset(brand: _ev, model: 'ELX200-15', zNom: 8, pRms: 300),
  SpkPreset(brand: _ev, model: 'ELX200-12S', zNom: 8, pRms: 400),
  SpkPreset(brand: _ev, model: 'ELX200-18S', zNom: 8, pRms: 400),
  SpkPreset(brand: _ev, model: 'EKX-12', zNom: 8, pRms: 350),
  SpkPreset(brand: _ev, model: 'EKX-15', zNom: 8, pRms: 400),
  SpkPreset(brand: _ev, model: 'EKX-18S', zNom: 8, pRms: 400),
  SpkPreset(brand: _ev, model: 'QRx 115/75', zNom: 8, pRms: 400),
  SpkPreset(brand: _ev, model: 'QRx 212/75', zNom: 4, pRms: 600),
  SpkPreset(brand: _ev, model: 'QRx 153/75', section: 'LF', zNom: 8, pRms: 400),
  SpkPreset(brand: _ev, model: 'QRx 153/75', section: 'MF/HF', zNom: 12, pRms: 150),
  SpkPreset(brand: _ev, model: 'EVF-1122S/96', zNom: 8, pRms: 500),
  SpkPreset(brand: _ev, model: 'XLC127DVX', section: 'LF', zNom: 8, pRms: 500),
  SpkPreset(brand: _ev, model: 'XLC127DVX', section: 'MB', zNom: 8, pRms: 300),
  SpkPreset(brand: _ev, model: 'XLC127DVX', section: 'HF', zNom: 8, pRms: 150),

  // ── Martin Audio (AES) ──
  SpkPreset(brand: _ma, model: 'Blackline X8', zNom: 8, pRms: 200),
  SpkPreset(brand: _ma, model: 'Blackline X10', zNom: 8, pRms: 250),
  SpkPreset(brand: _ma, model: 'Blackline X12', zNom: 8, pRms: 300),
  SpkPreset(brand: _ma, model: 'Blackline X15', zNom: 8, pRms: 400),
  SpkPreset(brand: _ma, model: 'Blackline X115', zNom: 8, pRms: 500),
  SpkPreset(brand: _ma, model: 'Blackline X118', zNom: 8, pRms: 800),
  SpkPreset(brand: _ma, model: 'Blackline X218', zNom: 4, pRms: 1600),
  SpkPreset(brand: _ma, model: 'SX218', section: 'LF (×2 ch)', zNom: 8, pRms: 1000),
  SpkPreset(brand: _ma, model: 'SXH218', zNom: 4, pRms: 3400),

  // ── Génériques (contrôle d'impédance seul) ──
  SpkPreset(brand: 'Generic', model: '16 Ω', zNom: 16),
  SpkPreset(brand: 'Generic', model: '8 Ω', zNom: 8),
  SpkPreset(brand: 'Generic', model: '4 Ω', zNom: 4),
];
