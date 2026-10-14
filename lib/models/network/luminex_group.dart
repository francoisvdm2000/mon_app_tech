import 'luminex_device.dart';

/// Groupe (VLAN) configuré sur un switch Luminex GigaCore.
class LuminexGroup {
  final int id;
  final String name;

  /// VLAN ID (802.1Q).
  final int vid;

  /// Couleur Luminex au format « #RRGGBB », null si absente.
  final String? colorHex;

  const LuminexGroup({
    required this.id,
    required this.name,
    required this.vid,
    this.colorHex,
  });

  /// Couleur ARGB (opaque) prête pour `Color(...)`, null si invalide.
  int? get colorValue => parseLuminexColor(colorHex);
}

/// Convertit « #RRGGBB » en entier ARGB opaque, null si invalide.
int? parseLuminexColor(String? hex) {
  if (hex == null) return null;
  final clean = hex.trim().replaceFirst('#', '');
  if (clean.length != 6) return null;
  final rgb = int.tryParse(clean, radix: 16);
  if (rgb == null) return null;
  return 0xFF000000 | rgb;
}

/// Trafic cumulé d'un groupe (VLAN), sur un ou plusieurs switches.
///
/// Seuls les ports d'accès sont comptés : les liens trunk (ISL) sont exclus
/// pour ne pas compter deux fois le trafic qui passe d'un switch à l'autre.
class LuminexGroupTraffic {
  final int vid;
  final String name;
  final String? colorHex;

  /// Débit envoyé par les appareils dans le groupe (RX des ports d'accès).
  final int sentBps;

  /// Débit délivré aux appareils du groupe (TX des ports d'accès).
  final int receivedBps;

  /// Ports d'accès avec un lien actif.
  final int activePorts;

  /// Ports d'accès affectés au groupe.
  final int totalPorts;

  const LuminexGroupTraffic({
    required this.vid,
    required this.name,
    this.colorHex,
    required this.sentBps,
    required this.receivedBps,
    required this.activePorts,
    required this.totalPorts,
  });

  int? get colorValue => parseLuminexColor(colorHex);

  /// Calcule le trafic par groupe pour [devices].
  ///
  /// Les groupes de switches différents sont fusionnés par VLAN ID.
  /// Les groupes sans aucun port actif sont omis.
  /// Tri : débit total décroissant, puis VLAN ID croissant.
  static List<LuminexGroupTraffic> compute(Iterable<LuminexDevice> devices) {
    final acc = <int, _Acc>{};

    for (final dev in devices) {
      if (!dev.isReachable || dev.groups.isEmpty) continue;
      final groupsById = {for (final g in dev.groups) g.id: g};

      for (final port in dev.ports) {
        final groupId = port.groupId;
        if (groupId == null || port.isTrunk) continue;
        final group = groupsById[groupId];
        if (group == null) continue;

        final a = acc.putIfAbsent(
          group.vid,
          () => _Acc(name: group.name, colorHex: group.colorHex),
        );
        a.totalPorts++;
        if (port.linkUp == true) {
          a.activePorts++;
          a.sent += port.rxBps ?? 0;
          a.received += port.txBps ?? 0;
        }
      }
    }

    final result = [
      for (final e in acc.entries)
        if (e.value.activePorts > 0)
          LuminexGroupTraffic(
            vid: e.key,
            name: e.value.name,
            colorHex: e.value.colorHex,
            sentBps: e.value.sent,
            receivedBps: e.value.received,
            activePorts: e.value.activePorts,
            totalPorts: e.value.totalPorts,
          ),
    ];
    result.sort((a, b) {
      final byTraffic = (b.sentBps + b.receivedBps)
          .compareTo(a.sentBps + a.receivedBps);
      return byTraffic != 0 ? byTraffic : a.vid.compareTo(b.vid);
    });
    return result;
  }
}

class _Acc {
  final String name;
  final String? colorHex;
  int sent = 0;
  int received = 0;
  int activePorts = 0;
  int totalPorts = 0;

  _Acc({required this.name, this.colorHex});
}

/// Formate un débit en bit/s : « 850 b/s », « 12,4 kb/s », « 15,9 Mb/s »…
///
/// [decimalSeparator] permet d'adapter la virgule à la langue.
String formatBitRate(int bps, {String decimalSeparator = ','}) {
  String fmt(double v, String unit) {
    final s = v >= 100 ? v.toStringAsFixed(0) : v.toStringAsFixed(1);
    return '${s.replaceAll('.', decimalSeparator)} $unit';
  }

  if (bps < 1000) return '$bps b/s';
  if (bps < 1000000) return fmt(bps / 1000, 'kb/s');
  if (bps < 1000000000) return fmt(bps / 1000000, 'Mb/s');
  return fmt(bps / 1000000000, 'Gb/s');
}
