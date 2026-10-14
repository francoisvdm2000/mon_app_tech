import 'luminex_device.dart';
import 'luminex_multicast.dart';

/// Anomalie repérée sur un port de l'inventaire.
enum LuminexInventoryIssue {
  /// L'appareil s'abonne en IGMP sans adresse IP (0.0.0.0).
  noIpAddress,

  /// La même IP apparaît sur un autre port du même VLAN.
  duplicateIp,
}

/// Un port actif d'un GigaCore et ce qui y est branché.
class LuminexInventoryEntry {
  final String switchName;
  final String switchIp;
  final int portNr;

  /// Légende du port (« PU 1 »), null si vide.
  final String? portName;

  /// Groupe (VLAN) du port d'accès, null pour un trunk.
  final String? groupName;
  final int? vid;
  final String? groupColorHex;

  /// Nom du trunk (« ISL ») pour un lien entre switches.
  final String? trunkName;

  final int? speedMbps;

  /// Voisin LLDP (nom et IP de management annoncés).
  final String? neighborName;
  final String? neighborIp;

  /// IP vues en IGMP sur ce port (appareils abonnés à du multicast).
  final List<String> ips;

  /// Univers sACN écoutés via ce port, triés.
  final List<int> sacnUniverses;

  /// true si un appareil de ce port a rejoint MA-Net3.
  final bool manet;

  final List<LuminexInventoryIssue> issues;

  /// IP en conflit (pour [LuminexInventoryIssue.duplicateIp]).
  final List<String> duplicateIps;

  const LuminexInventoryEntry({
    required this.switchName,
    required this.switchIp,
    required this.portNr,
    this.portName,
    this.groupName,
    this.vid,
    this.groupColorHex,
    this.trunkName,
    this.speedMbps,
    this.neighborName,
    this.neighborIp,
    this.ips = const [],
    this.sacnUniverses = const [],
    this.manet = false,
    this.issues = const [],
    this.duplicateIps = const [],
  });

  bool get isTrunk => trunkName != null;

  /// Nom le plus parlant : légende, sinon voisin LLDP, sinon première IP.
  String? get displayName =>
      portName ?? neighborName ?? (ips.isNotEmpty ? ips.first : null);

  /// Texte utilisé par la recherche.
  String get searchText => [
        switchName,
        'port $portNr',
        portName,
        groupName,
        trunkName,
        neighborName,
        neighborIp,
        ...ips,
        for (final u in sacnUniverses) 'u$u',
        if (manet) 'ma-net',
      ].whereType<String>().join(' ').toLowerCase();

  /// Inventaire de tous les ports actifs des [devices] joignables, triés par
  /// switch puis par port.
  static List<LuminexInventoryEntry> compute(Iterable<LuminexDevice> devices) {
    final reachable = devices.where((d) => d.isReachable).toList()
      ..sort((a, b) => a.displayName.compareTo(b.displayName));

    // Première passe : IP vues par (vid, switch, port) sur les ports d'accès.
    final ipLocations = <String, Set<String>>{}; // "vid|ip" → {"sw|port"}
    final perPort = <String, _PortAcc>{};

    for (final dev in reachable) {
      final portsByNr = {for (final p in dev.ports) p.portNr: p};
      for (final entry in dev.multicast) {
        final kind = classifyMulticast(entry.groupIp);
        entry.listenersByPort.forEach((portNr, ips) {
          final port = portsByNr[portNr];
          if (port == null || port.isTrunk) return;
          final key = '${dev.ip}|$portNr';
          final acc = perPort.putIfAbsent(key, _PortAcc.new);
          for (final ip in ips) {
            if (ip == '0.0.0.0' || ip.isEmpty) {
              acc.noIp = true;
              continue;
            }
            acc.ips.add(ip);
            ipLocations.putIfAbsent('${entry.vid}|$ip', () => {}).add(key);
          }
          final universe = kind.universe;
          if (kind.kind == LuminexMulticastKind.sacn && universe != null) {
            acc.universes.add(universe);
          }
          if (kind.kind == LuminexMulticastKind.manetAdmin ||
              kind.kind == LuminexMulticastKind.manetSession) {
            acc.manet = true;
          }
        });
      }
    }

    // IP présentes sur plusieurs ports du même VLAN.
    final duplicates = <String, Set<String>>{}; // "sw|port" → {ip}
    ipLocations.forEach((vidIp, locations) {
      if (locations.length < 2) return;
      final ip = vidIp.substring(vidIp.indexOf('|') + 1);
      for (final loc in locations) {
        duplicates.putIfAbsent(loc, () => {}).add(ip);
      }
    });

    final result = <LuminexInventoryEntry>[];
    for (final dev in reachable) {
      final ports = [...dev.ports]..sort((a, b) => a.portNr.compareTo(b.portNr));
      for (final port in ports) {
        if (port.linkUp != true) continue;
        final key = '${dev.ip}|${port.portNr}';
        final acc = perPort[key];
        final group = dev.groupById(port.groupId);
        final trunkId = port.trunkId;
        final dupIps = (duplicates[key]?.toList() ?? <String>[])..sort();
        final ips = (acc?.ips.toList() ?? <String>[])..sort(_compareIp);
        final universes = (acc?.universes.toList() ?? <int>[])..sort();

        result.add(LuminexInventoryEntry(
          switchName: dev.displayName,
          switchIp: dev.ip,
          portNr: port.portNr,
          portName: port.name,
          groupName: group?.name,
          vid: group?.vid,
          groupColorHex: group?.colorHex,
          trunkName: trunkId != null
              ? (dev.trunkNames[trunkId] ?? 'ISL')
              : null,
          speedMbps: port.speedMbps,
          neighborName: port.neighborName,
          neighborIp: port.neighborIp,
          ips: ips,
          sacnUniverses: universes,
          manet: acc?.manet ?? false,
          issues: [
            if (acc?.noIp == true) LuminexInventoryIssue.noIpAddress,
            if (dupIps.isNotEmpty) LuminexInventoryIssue.duplicateIp,
          ],
          duplicateIps: dupIps,
        ));
      }
    }
    return result;
  }

  static int _compareIp(String a, String b) => _ipKey(a).compareTo(_ipKey(b));

  static int _ipKey(String ip) {
    final parts = ip.split('.').map(int.tryParse).toList();
    if (parts.length != 4 || parts.any((p) => p == null)) return 0x10000000000;
    return parts.fold<int>(0, (acc, p) => acc * 256 + p!);
  }

  /// Export CSV (séparateur « ; », pour Excel / Numbers en français).
  static String toCsv(List<LuminexInventoryEntry> entries) {
    String cell(Object? v) {
      final s = v?.toString() ?? '';
      return s.contains(';') || s.contains('"') || s.contains('\n')
          ? '"${s.replaceAll('"', '""')}"'
          : s;
    }

    final rows = <List<Object?>>[
      [
        'Switch',
        'Switch IP',
        'Port',
        'Legend',
        'Group',
        'VLAN',
        'Speed (Mb/s)',
        'LLDP name',
        'LLDP IP',
        'IP',
        'sACN universes',
        'MA-Net',
        'Issues',
      ],
      for (final e in entries)
        [
          e.switchName,
          e.switchIp,
          e.portNr,
          e.portName,
          e.groupName ?? e.trunkName,
          e.vid,
          e.speedMbps,
          e.neighborName,
          e.neighborIp,
          e.ips.join(' '),
          e.sacnUniverses.join(' '),
          e.manet ? 'yes' : '',
          [
            if (e.issues.contains(LuminexInventoryIssue.noIpAddress)) 'no IP',
            if (e.issues.contains(LuminexInventoryIssue.duplicateIp))
              'duplicate IP ${e.duplicateIps.join(' ')}',
          ].join(', '),
        ],
    ];
    return rows.map((r) => r.map(cell).join(';')).join('\n');
  }
}

class _PortAcc {
  final ips = <String>{};
  final universes = <int>{};
  bool manet = false;
  bool noIp = false;
}
