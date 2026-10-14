import 'luminex_alarm.dart';
import 'luminex_group.dart';
import 'luminex_multicast.dart';
import 'luminex_port.dart';
import 'network_diagnostic_alert.dart';

/// Génération de l'API Luminex GigaCore détectée.
enum LuminexApiGen {
  /// API texte pipe-délimitée (anciennes versions)
  gen1,

  /// API JSON REST (versions récentes)
  gen2,

  /// Non encore déterminée
  unknown,
}

/// Message d'état remonté par le switch lui-même (ex. redondance alim).
class LuminexDeviceNotice {
  /// « info », « warning » ou « error ».
  final String level;
  final String text;

  const LuminexDeviceNotice({required this.level, required this.text});
}

/// Représente un switch Luminex GigaCore supervisé.
///
/// Lecture seule — aucune modification de configuration.
class LuminexDevice {
  final String ip;
  final String? name;
  final String? model;
  final String? firmware;
  final String? serial;
  final String? mac;

  /// Uptime en secondes, null si non disponible.
  final int? uptimeSeconds;

  /// Température interne en °C, null si non disponible (Gen1 limité).
  final double? temperatureCelsius;

  /// true = le switch signale une température hors plage,
  /// null = pas d'information de seuil (on retombe sur un seuil fixe).
  final bool? temperatureAlarm;

  /// Alimentation principale OK, null si information indisponible.
  final bool? psuOk;

  /// Ventilateurs OK, null si information indisponible.
  final bool? fansOk;

  final List<LuminexPort> ports;
  final List<LuminexGroup> groups;

  /// Noms des trunks (ISL) : id → nom.
  final Map<int, String> trunkNames;

  /// Messages d'avertissement remontés par le switch.
  final List<LuminexDeviceNotice> notices;

  /// Abonnements multicast IGMP (IGMP snooping), tous VLAN confondus.
  final List<LuminexMulticastEntry> multicast;

  final LuminexApiGen apiGen;

  /// true = switch répond aux requêtes HTTP.
  final bool isReachable;

  /// true = IP ajoutée manuellement (vs. découverte auto par scan).
  final bool isManual;

  /// true = interrogation HTTP en cours.
  final bool isPolling;

  final DateTime? lastFetch;
  final List<LuminexAlarm> alarms;

  /// Seuil utilisé quand le switch ne fournit pas ses propres seuils.
  static const fallbackHighTempCelsius = 70.0;

  const LuminexDevice({
    required this.ip,
    this.name,
    this.model,
    this.firmware,
    this.serial,
    this.mac,
    this.uptimeSeconds,
    this.temperatureCelsius,
    this.temperatureAlarm,
    this.psuOk,
    this.fansOk,
    this.ports = const [],
    this.groups = const [],
    this.trunkNames = const {},
    this.notices = const [],
    this.multicast = const [],
    this.apiGen = LuminexApiGen.unknown,
    this.isReachable = false,
    this.isManual = false,
    this.isPolling = false,
    this.lastFetch,
    this.alarms = const [],
  });

  // ─── Accesseurs utilitaires ────────────────────────────────────────────────

  int get alarmCount => alarms.length;

  String get displayName => name ?? ip;

  /// Température à signaler : seuils du switch s'il les fournit,
  /// sinon seuil fixe [fallbackHighTempCelsius].
  bool get isTemperatureHigh {
    final alarm = temperatureAlarm;
    if (alarm != null) return alarm;
    final t = temperatureCelsius;
    return t != null && t > fallbackHighTempCelsius;
  }

  LuminexGroup? groupById(int? id) {
    if (id == null) return null;
    for (final g in groups) {
      if (g.id == id) return g;
    }
    return null;
  }

  DiagnosticSeverity get maxSeverity {
    if (alarms.isEmpty) return DiagnosticSeverity.info;
    final order = DiagnosticSeverity.values;
    return alarms
        .map((a) => a.severity)
        .reduce((a, b) => order.indexOf(a) > order.indexOf(b) ? a : b);
  }

  // ─── copyWith ──────────────────────────────────────────────────────────────

  LuminexDevice copyWith({
    String? name,
    String? model,
    String? firmware,
    String? serial,
    String? mac,
    int? uptimeSeconds,
    double? temperatureCelsius,
    bool? temperatureAlarm,
    bool? psuOk,
    bool? fansOk,
    List<LuminexPort>? ports,
    List<LuminexGroup>? groups,
    Map<int, String>? trunkNames,
    List<LuminexDeviceNotice>? notices,
    List<LuminexMulticastEntry>? multicast,
    LuminexApiGen? apiGen,
    bool? isReachable,
    bool? isPolling,
    DateTime? lastFetch,
    List<LuminexAlarm>? alarms,
  }) {
    return LuminexDevice(
      ip: ip,
      name: name ?? this.name,
      model: model ?? this.model,
      firmware: firmware ?? this.firmware,
      serial: serial ?? this.serial,
      mac: mac ?? this.mac,
      uptimeSeconds: uptimeSeconds ?? this.uptimeSeconds,
      temperatureCelsius: temperatureCelsius ?? this.temperatureCelsius,
      temperatureAlarm: temperatureAlarm ?? this.temperatureAlarm,
      psuOk: psuOk ?? this.psuOk,
      fansOk: fansOk ?? this.fansOk,
      ports: ports ?? this.ports,
      groups: groups ?? this.groups,
      trunkNames: trunkNames ?? this.trunkNames,
      notices: notices ?? this.notices,
      multicast: multicast ?? this.multicast,
      apiGen: apiGen ?? this.apiGen,
      isReachable: isReachable ?? this.isReachable,
      isManual: isManual,
      isPolling: isPolling ?? this.isPolling,
      lastFetch: lastFetch ?? this.lastFetch,
      alarms: alarms ?? this.alarms,
    );
  }
}
