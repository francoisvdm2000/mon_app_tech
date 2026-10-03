import 'network_device.dart';
import 'ndi_source.dart';
import 'network_diagnostic_alert.dart';
import 'network_snapshot.dart';

/// Résultat de la comparaison entre deux snapshots réseau.
class NetworkSnapshotDiff {
  final NetworkSnapshot snapshotA;
  final NetworkSnapshot snapshotB;

  // ── Appareils ────────────────────────────────────────────────────────────────
  final List<NetworkDevice> addedDevices;    // présents dans B, absents dans A
  final List<NetworkDevice> removedDevices;  // présents dans A, absents dans B

  // ── Univers Art-Net ──────────────────────────────────────────────────────────
  final List<int> addedArtnetUniverses;
  final List<int> removedArtnetUniverses;

  // ── Univers sACN ─────────────────────────────────────────────────────────────
  final List<int> addedSacnUniverses;
  final List<int> removedSacnUniverses;

  // ── Sources NDI ──────────────────────────────────────────────────────────────
  final List<NdiSource> addedNdiSources;
  final List<NdiSource> removedNdiSources;

  // ── Alertes ──────────────────────────────────────────────────────────────────
  final List<NetworkDiagnosticAlert> newAlerts;      // apparues dans B
  final List<NetworkDiagnosticAlert> resolvedAlerts; // disparues depuis A

  const NetworkSnapshotDiff({
    required this.snapshotA,
    required this.snapshotB,
    required this.addedDevices,
    required this.removedDevices,
    required this.addedArtnetUniverses,
    required this.removedArtnetUniverses,
    required this.addedSacnUniverses,
    required this.removedSacnUniverses,
    required this.addedNdiSources,
    required this.removedNdiSources,
    required this.newAlerts,
    required this.resolvedAlerts,
  });

  bool get hasChanges =>
      addedDevices.isNotEmpty ||
      removedDevices.isNotEmpty ||
      addedArtnetUniverses.isNotEmpty ||
      removedArtnetUniverses.isNotEmpty ||
      addedSacnUniverses.isNotEmpty ||
      removedSacnUniverses.isNotEmpty ||
      addedNdiSources.isNotEmpty ||
      removedNdiSources.isNotEmpty ||
      newAlerts.isNotEmpty ||
      resolvedAlerts.isNotEmpty;

  // ── Calcul ───────────────────────────────────────────────────────────────────

  static NetworkSnapshotDiff compare(
      NetworkSnapshot a, NetworkSnapshot b) {
    // Appareils (comparaison par IP)
    final aIps = {for (final d in a.devices) d.ip: d};
    final bIps = {for (final d in b.devices) d.ip: d};
    final added = b.devices.where((d) => !aIps.containsKey(d.ip)).toList();
    final removed = a.devices.where((d) => !bIps.containsKey(d.ip)).toList();

    // Univers Art-Net
    final aArtnet = a.artnetUniverses.keys.toSet();
    final bArtnet = b.artnetUniverses.keys.toSet();
    final addedArtnet =
        bArtnet.difference(aArtnet).toList()..sort();
    final removedArtnet =
        aArtnet.difference(bArtnet).toList()..sort();

    // Univers sACN
    final aSacn = a.sacnUniverses.keys.toSet();
    final bSacn = b.sacnUniverses.keys.toSet();
    final addedSacn = bSacn.difference(aSacn).toList()..sort();
    final removedSacn = aSacn.difference(bSacn).toList()..sort();

    // Sources NDI (comparaison par nom)
    final aNdiNames = {for (final s in a.ndiSources) s.name: s};
    final bNdiNames = {for (final s in b.ndiSources) s.name: s};
    final addedNdi =
        b.ndiSources.where((s) => !aNdiNames.containsKey(s.name)).toList();
    final removedNdi =
        a.ndiSources.where((s) => !bNdiNames.containsKey(s.name)).toList();

    // Alertes (comparaison par code)
    final aCodes =
        (a.diagnostic?.alerts ?? []).map((al) => al.code).toSet();
    final bCodes =
        (b.diagnostic?.alerts ?? []).map((al) => al.code).toSet();
    final newAlerts = (b.diagnostic?.alerts ?? [])
        .where((al) => !aCodes.contains(al.code))
        .toList();
    final resolvedAlerts = (a.diagnostic?.alerts ?? [])
        .where((al) => !bCodes.contains(al.code))
        .toList();

    return NetworkSnapshotDiff(
      snapshotA: a,
      snapshotB: b,
      addedDevices: added,
      removedDevices: removed,
      addedArtnetUniverses: addedArtnet,
      removedArtnetUniverses: removedArtnet,
      addedSacnUniverses: addedSacn,
      removedSacnUniverses: removedSacn,
      addedNdiSources: addedNdi,
      removedNdiSources: removedNdi,
      newAlerts: newAlerts,
      resolvedAlerts: resolvedAlerts,
    );
  }
}
