import 'luminex_device.dart';
import 'luminex_port.dart';

/// Abonnement IGMP relevé sur un switch (`/api/snooping`) : un groupe
/// multicast dans un VLAN, et les IP abonnées vues sur chaque port.
class LuminexMulticastEntry {
  final int vid;
  final String groupIp;

  /// Port → IP des appareils qui ont rejoint le groupe via ce port.
  final Map<int, List<String>> listenersByPort;

  const LuminexMulticastEntry({
    required this.vid,
    required this.groupIp,
    required this.listenersByPort,
  });
}

/// Nature d'un groupe multicast, déduite de son adresse.
enum LuminexMulticastKind {
  /// MA-Net3 : groupe d'administration (236.4.1.0 ou 239.4.1.0)
  manetAdmin,

  /// MA-Net3 : données de session (236.4.1.1, .2, .3…)
  manetSession,

  /// sACN (E1.31) : 239.255.hi.lo → univers hi × 256 + lo (1 à 63999)
  sacn,

  /// sACN : univers de découverte 64214 (239.255.250.214)
  sacnDiscovery,

  /// SSDP / UPnP (239.255.255.250)
  ssdp,

  /// mDNS (224.0.0.251)
  mdns,

  /// PTP (224.0.1.129 à .132)
  ptp,

  /// SAP / annonces AES67 (239.255.255.255)
  sap,

  /// Autre groupe
  other,
}

/// Classe une adresse de groupe multicast.
({LuminexMulticastKind kind, int? universe}) classifyMulticast(String ip) {
  final parts = ip.split('.').map(int.tryParse).toList();
  if (parts.length != 4 || parts.any((p) => p == null || p < 0 || p > 255)) {
    return (kind: LuminexMulticastKind.other, universe: null);
  }
  final a = parts[0]!, b = parts[1]!, c = parts[2]!, d = parts[3]!;

  if ((a == 236 || a == 239) && b == 4 && c == 1) {
    return (
      kind: d == 0
          ? LuminexMulticastKind.manetAdmin
          : LuminexMulticastKind.manetSession,
      universe: null,
    );
  }
  if (a == 224 && b == 0 && c == 0 && d == 251) {
    return (kind: LuminexMulticastKind.mdns, universe: null);
  }
  if (a == 224 && b == 0 && c == 1 && d >= 129 && d <= 132) {
    return (kind: LuminexMulticastKind.ptp, universe: null);
  }
  if (a == 239 && b == 255) {
    if (c == 255 && d == 250) {
      return (kind: LuminexMulticastKind.ssdp, universe: null);
    }
    if (c == 255 && d == 255) {
      return (kind: LuminexMulticastKind.sap, universe: null);
    }
    final universe = c * 256 + d;
    if (universe == 64214) {
      return (kind: LuminexMulticastKind.sacnDiscovery, universe: universe);
    }
    if (universe >= 1 && universe <= 63999) {
      return (kind: LuminexMulticastKind.sacn, universe: universe);
    }
  }
  return (kind: LuminexMulticastKind.other, universe: null);
}

/// Un appareil abonné à un groupe, et où il est branché si on le sait.
class LuminexMulticastListener {
  final String ip;

  /// Switch et port d'accès où l'abonné est branché ; null si on ne le voit
  /// qu'à travers un lien ISL (switch non supervisé, par exemple).
  final String? switchName;
  final int? portNr;
  final String? portName;

  const LuminexMulticastListener({
    required this.ip,
    this.switchName,
    this.portNr,
    this.portName,
  });

  bool get isLocated => switchName != null && portNr != null;
}

/// Un groupe multicast d'un VLAN, avec tous ses abonnés sur le réseau.
class LuminexMulticastGroup {
  final String groupIp;
  final LuminexMulticastKind kind;

  /// Univers sACN, null si ce n'est pas du sACN.
  final int? universe;
  final List<LuminexMulticastListener> listeners;

  const LuminexMulticastGroup({
    required this.groupIp,
    required this.kind,
    this.universe,
    required this.listeners,
  });
}

/// Abonnements multicast d'un VLAN, tous switches confondus.
class LuminexMulticastVlan {
  final int vid;
  final String name;
  final String? colorHex;
  final List<LuminexMulticastGroup> groups;

  const LuminexMulticastVlan({
    required this.vid,
    required this.name,
    this.colorHex,
    required this.groups,
  });

  int get listenerCount =>
      groups.expand((g) => g.listeners.map((l) => l.ip)).toSet().length;

  /// Univers sACN joints, triés.
  List<int> get sacnUniverses => [
        for (final g in groups)
          if (g.kind == LuminexMulticastKind.sacn && g.universe != null)
            g.universe!,
      ]..sort();

  /// Fusionne les abonnements de tous les [devices], par VLAN puis par
  /// groupe. Un abonné est localisé sur le port d'accès où il est vu ; les
  /// observations à travers un trunk (ISL) servent seulement à ne pas le
  /// perdre si son switch n'est pas supervisé.
  static List<LuminexMulticastVlan> compute(Iterable<LuminexDevice> devices) {
    // vid → groupIp → ip → abonné
    final acc = <int, Map<String, Map<String, LuminexMulticastListener>>>{};
    final vlanInfo = <int, ({String name, String? color})>{};

    for (final dev in devices) {
      if (!dev.isReachable) continue;
      final portsByNr = <int, LuminexPort>{
        for (final p in dev.ports) p.portNr: p,
      };
      for (final g in dev.groups) {
        vlanInfo.putIfAbsent(g.vid, () => (name: g.name, color: g.colorHex));
      }

      for (final entry in dev.multicast) {
        final byIp = acc
            .putIfAbsent(entry.vid, () => {})
            .putIfAbsent(entry.groupIp, () => {});

        entry.listenersByPort.forEach((portNr, ips) {
          final port = portsByNr[portNr];
          for (final ip in ips) {
            if (ip.isEmpty || ip == '0.0.0.0') continue;
            final existing = byIp[ip];
            if (port != null &&
                !port.isTrunk &&
                (existing == null || !existing.isLocated)) {
              byIp[ip] = LuminexMulticastListener(
                ip: ip,
                switchName: dev.displayName,
                portNr: portNr,
                portName: port.name,
              );
            } else if (existing == null) {
              byIp[ip] = LuminexMulticastListener(ip: ip);
            }
          }
        });
      }
    }

    final result = <LuminexMulticastVlan>[];
    final vids = acc.keys.toList()..sort();
    for (final vid in vids) {
      final groups = <LuminexMulticastGroup>[];
      acc[vid]!.forEach((groupIp, byIp) {
        if (byIp.isEmpty) return;
        final c = classifyMulticast(groupIp);
        final listeners = byIp.values.toList()
          ..sort((a, b) => _ipKey(a.ip).compareTo(_ipKey(b.ip)));
        groups.add(LuminexMulticastGroup(
          groupIp: groupIp,
          kind: c.kind,
          universe: c.universe,
          listeners: listeners,
        ));
      });
      if (groups.isEmpty) continue;
      groups.sort(_compareGroups);
      final info = vlanInfo[vid];
      result.add(LuminexMulticastVlan(
        vid: vid,
        name: info?.name ?? 'VLAN $vid',
        colorHex: info?.color,
        groups: groups,
      ));
    }
    return result;
  }

  /// MA-Net, puis sACN par univers, puis le reste par adresse.
  static int _compareGroups(LuminexMulticastGroup a, LuminexMulticastGroup b) {
    final byKind = a.kind.index.compareTo(b.kind.index);
    if (byKind != 0) return byKind;
    final ua = a.universe, ub = b.universe;
    if (ua != null && ub != null && ua != ub) return ua.compareTo(ub);
    return _ipKey(a.groupIp).compareTo(_ipKey(b.groupIp));
  }

  /// Clé de tri numérique d'une IPv4 (les adresses invalides en dernier).
  static int _ipKey(String ip) {
    final parts = ip.split('.').map(int.tryParse).toList();
    if (parts.length != 4 || parts.any((p) => p == null)) return 0x10000000000;
    return parts.fold<int>(0, (acc, p) => acc * 256 + p!);
  }
}
