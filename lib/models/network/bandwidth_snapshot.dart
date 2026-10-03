import 'package:flutter/foundation.dart';

/// Snapshot instantané de bande passante broadcast/multicast.
/// Émis toutes les secondes par [BroadcastBandwidthService].
@immutable
class BandwidthSnapshot {
  final DateTime timestamp;

  /// bytes reçus pendant la dernière seconde, par protocole.
  final Map<String, int> bytesPerSec;

  /// paquets reçus pendant la dernière seconde, par protocole.
  final Map<String, int> pktsPerSec;

  const BandwidthSnapshot({
    required this.timestamp,
    required this.bytesPerSec,
    required this.pktsPerSec,
  });

  double kbpsFor(String proto) => (bytesPerSec[proto] ?? 0) * 8 / 1000;
  double mbpsFor(String proto) => kbpsFor(proto) / 1000;
  int pktsFor(String proto) => pktsPerSec[proto] ?? 0;

  double get totalKbps =>
      bytesPerSec.values.fold(0, (a, b) => a + b) * 8 / 1000;

  double get totalMbps => totalKbps / 1000;

  static BandwidthSnapshot empty() => BandwidthSnapshot(
        timestamp: DateTime.now(),
        bytesPerSec: const {},
        pktsPerSec: const {},
      );
}
