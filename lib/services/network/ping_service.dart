import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

/// Ping ICMP multiplateforme.
///
/// • iOS        : module natif (socket ICMP « datagram », seul moyen autorisé
///                par Apple — pas de commande `ping` sur iOS).
/// • Android    : commande système /system/bin/ping (autorisée aux apps).
/// • macOS / Linux / Windows : commande `ping` du système.
class PingService {
  PingService._();

  static const _channel = MethodChannel('eu.openwhite/ping');

  /// Résout un nom d'hôte en IPv4. Retourne null si introuvable.
  static Future<String?> resolve(String host) async {
    final h = host.trim();
    if (h.isEmpty) return null;
    final direct = InternetAddress.tryParse(h);
    if (direct != null) {
      return direct.type == InternetAddressType.IPv4 ? direct.address : null;
    }
    try {
      final res = await InternetAddress.lookup(h, type: InternetAddressType.IPv4)
          .timeout(const Duration(seconds: 3));
      return res.isEmpty ? null : res.first.address;
    } catch (_) {
      return null;
    }
  }

  /// Envoie un écho ICMP vers [ip] (IPv4 déjà résolue).
  /// Retourne la latence en millisecondes, ou null si pas de réponse.
  static Future<double?> pingOnce(String ip,
      {Duration timeout = const Duration(seconds: 1), int seq = 0}) async {
    try {
      if (Platform.isIOS) {
        final r = await _channel.invokeMethod<double>('ping', {
          'ip': ip,
          'timeoutMs': timeout.inMilliseconds,
          'seq': seq & 0xFFFF,
        });
        return r;
      }
      return await _pingCommand(ip, timeout);
    } catch (_) {
      return null;
    }
  }

  static final _timeRe = RegExp(r'time[=<]\s*([\d.,]+)\s*ms', caseSensitive: false);
  static final _timeWinRe = RegExp(r'[=<]\s*([\d.,]+)\s*ms', caseSensitive: false);

  static Future<double?> _pingCommand(String ip, Duration timeout) async {
    final List<String> args;
    if (Platform.isWindows) {
      args = ['-n', '1', '-w', '${timeout.inMilliseconds}', ip];
    } else if (Platform.isMacOS) {
      // macOS : -W en millisecondes
      args = ['-c', '1', '-n', '-W', '${timeout.inMilliseconds}', ip];
    } else {
      // Android (toybox) / Linux : -W en secondes (entier, min 1)
      final secs = (timeout.inMilliseconds / 1000).ceil().clamp(1, 10);
      args = ['-c', '1', '-n', '-W', '$secs', ip];
    }
    final exe = Platform.isAndroid ? '/system/bin/ping' : 'ping';
    final res = await Process.run(exe, args)
        .timeout(timeout + const Duration(seconds: 2));
    if (res.exitCode != 0) return null;
    final out = res.stdout.toString();
    final m = (Platform.isWindows ? _timeWinRe : _timeRe).firstMatch(out);
    if (m == null) return null;
    return double.tryParse(m.group(1)!.replaceAll(',', '.'));
  }
}
