/// Cœur de calcul Timecode SMPTE : parsing, formatage horloge (avec
/// réinsertion Drop-Frame), formatage de durée, et conversions
/// frames <-> ms <-> autre débit.
///
/// Les formules Drop-Frame utilisées ici sont l'algorithme SMPTE standard
/// (drop 2 frames/minute en 29.97 fps, 4 frames/minute en 59.94 fps, sauf
/// toutes les 10 minutes) — un algorithme public, indépendant de tout
/// logiciel tiers.
library;

class TimecodeRate {
  final String id;
  final String label;

  /// Nombre de frames "entières" par seconde utilisé pour le comptage
  /// (24, 25, 30, 50, 60...).
  final int frameBase;

  /// Débit réel (ex: 30000/1001 ≈ 29.97) utilisé pour tous les calculs de
  /// temps réel (ms, secondes, conversion vers un autre débit).
  final double realFps;

  final bool dropFrame;

  const TimecodeRate({
    required this.id,
    required this.label,
    required this.frameBase,
    required this.realFps,
    required this.dropFrame,
  });
}

const List<TimecodeRate> kTimecodeRates = [
  TimecodeRate(id: '24', label: '24 fps (Film)', frameBase: 24, realFps: 24.0, dropFrame: false),
  TimecodeRate(id: '23976', label: '23.976 fps', frameBase: 24, realFps: 24000 / 1001, dropFrame: false),
  TimecodeRate(id: '25', label: '25 fps (PAL)', frameBase: 25, realFps: 25.0, dropFrame: false),
  TimecodeRate(id: '2997ndf', label: '29.97 fps NDF', frameBase: 30, realFps: 30000 / 1001, dropFrame: false),
  TimecodeRate(id: '2997df', label: '29.97 fps DF', frameBase: 30, realFps: 30000 / 1001, dropFrame: true),
  TimecodeRate(id: '30', label: '30 fps', frameBase: 30, realFps: 30.0, dropFrame: false),
  TimecodeRate(id: '50', label: '50 fps', frameBase: 50, realFps: 50.0, dropFrame: false),
  TimecodeRate(id: '5994ndf', label: '59.94 fps NDF', frameBase: 60, realFps: 60000 / 1001, dropFrame: false),
  TimecodeRate(id: '5994df', label: '59.94 fps DF', frameBase: 60, realFps: 60000 / 1001, dropFrame: true),
  TimecodeRate(id: '60', label: '60 fps', frameBase: 60, realFps: 60.0, dropFrame: false),
];

class TimecodeMath {
  TimecodeMath._();

  static int _dropFramesPerMinute(TimecodeRate rate) {
    if (!rate.dropFrame) return 0;
    return rate.frameBase == 60 ? 4 : 2;
  }

  static int framesPerDay(TimecodeRate rate) => rate.frameBase * 3600 * 24;

  static List<int>? _splitParts(String raw) {
    final cleaned = raw.trim().replaceAll(RegExp(r'[;.,]'), ':');
    final parts =
        cleaned.split(':').where((p) => p.trim().isNotEmpty).toList();
    if (parts.length != 4) return null;

    final nums = <int>[];
    for (final p in parts) {
      final n = int.tryParse(p.trim());
      if (n == null) return null;
      nums.add(n);
    }
    return nums;
  }

  /// Parse un timecode "horloge" HH:MM:SS:FF (séparateurs ':' ';' '.' ','
  /// tous acceptés) en nombre total de frames depuis 00:00:00:00, en
  /// appliquant la soustraction Drop-Frame si le débit l'exige.
  /// Retourne `null` si le format ou les valeurs sont invalides.
  static int? parse(String raw, TimecodeRate rate) {
    final parts = _splitParts(raw);
    if (parts == null) return null;

    final hh = parts[0];
    final mm = parts[1];
    final ss = parts[2];
    final ff = parts[3];

    if (hh < 0 || mm < 0 || mm > 59 || ss < 0 || ss > 59) return null;
    if (ff < 0 || ff >= rate.frameBase) return null;

    final fb = rate.frameBase;
    var frameNumber = fb * 3600 * hh + fb * 60 * mm + fb * ss + ff;

    final dropPerMin = _dropFramesPerMinute(rate);
    if (dropPerMin > 0) {
      final totalMinutes = 60 * hh + mm;
      frameNumber -= dropPerMin * (totalMinutes - (totalMinutes ~/ 10));
    }

    return frameNumber;
  }

  /// Parse une DURÉE HH:MM:SS:FF (pas une heure d'horloge) en nombre de
  /// frames, sans logique Drop-Frame : une durée n'est pas alignée sur une
  /// minute d'horloge, donc pas de frames à "sauter".
  static int? parseDuration(String raw, TimecodeRate rate) {
    final parts = _splitParts(raw);
    if (parts == null) return null;

    final hh = parts[0];
    final mm = parts[1];
    final ss = parts[2];
    final ff = parts[3];

    if (mm < 0 || mm > 59 || ss < 0 || ss > 59) return null;
    if (ff < 0 || ff >= rate.frameBase) return null;

    final fb = rate.frameBase;
    return fb * 3600 * hh + fb * 60 * mm + fb * ss + ff;
  }

  /// Formate un nombre total de frames en timecode "horloge" HH:MM:SS:FF,
  /// en réinsérant les frames droppées si le débit est Drop-Frame. Boucle
  /// sur 24h comme un vrai timecode.
  static String formatClock(int totalFrames, TimecodeRate rate) {
    final fb = rate.frameBase;
    final perDay = framesPerDay(rate);

    var frameNumber = totalFrames % perDay;
    if (frameNumber < 0) frameNumber += perDay;

    final dropPerMin = _dropFramesPerMinute(rate);
    if (dropPerMin > 0) {
      final framesPer10Minutes = fb * 600 + 9 * dropPerMin;
      final framesPerMinute = fb * 60 - dropPerMin;

      final d = frameNumber ~/ framesPer10Minutes;
      final m = frameNumber % framesPer10Minutes;

      if (m > dropPerMin) {
        frameNumber += dropPerMin * 9 * d +
            dropPerMin * ((m - dropPerMin) ~/ framesPerMinute);
      } else {
        frameNumber += dropPerMin * 9 * d;
      }
    }

    final ff = frameNumber % fb;
    final totalSeconds = frameNumber ~/ fb;
    final ss = totalSeconds % 60;
    final totalMinutes = totalSeconds ~/ 60;
    final mm = totalMinutes % 60;
    final hh = (totalMinutes ~/ 60) % 24;

    final sep = rate.dropFrame ? ';' : ':';
    return '${_p2(hh)}:${_p2(mm)}:${_p2(ss)}$sep${_p2(ff)}';
  }

  /// Formate une DURÉE (delta de frames) en HH:MM:SS:FF simple, sans
  /// réinsertion Drop-Frame — convention pro pour exprimer une durée.
  static String formatDuration(int totalFrames, TimecodeRate rate) {
    final negative = totalFrames < 0;
    final frames = totalFrames.abs();

    final fb = rate.frameBase;
    final ff = frames % fb;
    final totalSeconds = frames ~/ fb;
    final ss = totalSeconds % 60;
    final totalMinutes = totalSeconds ~/ 60;
    final mm = totalMinutes % 60;
    final hh = totalMinutes ~/ 60;

    final sign = negative ? '-' : '';
    return '$sign${_p2(hh)}:${_p2(mm)}:${_p2(ss)}:${_p2(ff)}';
  }

  static double framesToMs(int frames, TimecodeRate rate) =>
      frames / rate.realFps * 1000.0;

  static int msToFrames(double ms, TimecodeRate rate) =>
      (ms / 1000.0 * rate.realFps).round();

  static double framesToSeconds(int frames, TimecodeRate rate) =>
      frames / rate.realFps;

  /// Convertit un nombre de frames exprimé à un débit vers le nombre de
  /// frames équivalent (même durée réelle écoulée) à un autre débit.
  static int convertFrameCount(int frames, TimecodeRate from, TimecodeRate to) {
    final seconds = framesToSeconds(frames, from);
    return (seconds * to.realFps).round();
  }

  static String _p2(int v) => v.toString().padLeft(2, '0');
}
