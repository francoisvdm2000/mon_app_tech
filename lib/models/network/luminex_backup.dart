import 'dart:convert';

import 'luminex_device.dart';

/// Sauvegarde de la configuration d'un switch GigaCore.
///
/// Contient :
/// - le profil officiel Luminex (fichier exporté par le switch, gzip), qui
///   permet une restauration complète, y compris sur un switch neuf ;
/// - son contenu lisible (ports, groupes, trunks, IP), pour comparer ;
/// - les légendes des ports, que le profil Luminex ne contient pas.
class LuminexBackup {
  static const formatId = 'showtech-gigacore-backup';
  static const formatVersion = 1;

  final DateTime createdAt;
  final String sourceIp;
  final String? switchName;
  final String? model;
  final String? serial;
  final String? firmware;

  /// Contenu du profil (`content` de `/api/config/profiles/{slot}`).
  final Map<String, dynamic> profileContent;

  /// Fichier profil exporté par le switch (gzip), en base64.
  final String profileFileBase64;

  /// Légendes des ports : port → légende (vide = pas de légende).
  final Map<int, String> legends;

  const LuminexBackup({
    required this.createdAt,
    required this.sourceIp,
    this.switchName,
    this.model,
    this.serial,
    this.firmware,
    required this.profileContent,
    required this.profileFileBase64,
    required this.legends,
  });

  List<int> get profileFileBytes => base64Decode(profileFileBase64);

  /// Nom de fichier proposé : « GigaCore SW Dimcity 2026-10-14 1755.json ».
  String get suggestedFileName {
    String two(int v) => v.toString().padLeft(2, '0');
    final d = createdAt;
    final date = '${d.year}-${two(d.month)}-${two(d.day)} '
        '${two(d.hour)}${two(d.minute)}';
    final name = (switchName ?? sourceIp).replaceAll(RegExp(r'[^\w\- ]'), '_');
    return 'GigaCore $name $date.json';
  }

  // ─── Contenu du profil ─────────────────────────────────────────────────────

  List<Map<String, dynamic>> get profilePorts =>
      _maps((profileContent['ports'] as Map?)?['port']);

  List<Map<String, dynamic>> get profileGroups =>
      _maps((profileContent['groups'] as Map?)?['group']);

  String? get profileIp =>
      (profileContent['ip_settings'] as Map?)?['ip_address'] as String?;

  String? get profileDeviceName =>
      (profileContent['device'] as Map?)?['name'] as String?;

  static List<Map<String, dynamic>> _maps(Object? v) => v is List
      ? v.whereType<Map>().map((m) => Map<String, dynamic>.from(m)).toList()
      : const [];

  // ─── JSON ──────────────────────────────────────────────────────────────────

  Map<String, dynamic> toJson() => {
        'format': formatId,
        'version': formatVersion,
        'created_at': createdAt.toIso8601String(),
        'source_ip': sourceIp,
        'switch_name': switchName,
        'model': model,
        'serial': serial,
        'firmware': firmware,
        'legends': {
          for (final e in legends.entries) e.key.toString(): e.value,
        },
        'profile_content': profileContent,
        'profile_file': profileFileBase64,
      };

  String toJsonString() => const JsonEncoder.withIndent('  ').convert(toJson());

  /// Lit une sauvegarde ; renvoie null si le fichier n'en est pas une.
  static LuminexBackup? tryParse(String text) {
    try {
      final json = jsonDecode(text);
      if (json is! Map || json['format'] != formatId) return null;
      final content = json['profile_content'];
      final file = json['profile_file'];
      final created = DateTime.tryParse(json['created_at'] as String? ?? '');
      if (content is! Map || file is! String || created == null) return null;
      base64Decode(file); // valide le contenu
      final legends = <int, String>{};
      final rawLegends = json['legends'];
      if (rawLegends is Map) {
        rawLegends.forEach((k, v) {
          final port = int.tryParse(k.toString());
          if (port != null && v is String) legends[port] = v;
        });
      }
      return LuminexBackup(
        createdAt: created,
        sourceIp: json['source_ip'] as String? ?? '',
        switchName: json['switch_name'] as String?,
        model: json['model'] as String?,
        serial: json['serial'] as String?,
        firmware: json['firmware'] as String?,
        profileContent: Map<String, dynamic>.from(content),
        profileFileBase64: file,
        legends: legends,
      );
    } catch (_) {
      return null;
    }
  }

  // ─── Comparaison avec un switch en service ─────────────────────────────────

  /// Différences entre cette sauvegarde et l'état actuel de [live].
  List<LuminexBackupDiff> diff(LuminexDevice live) {
    final out = <LuminexBackupDiff>[];

    if (model != null && live.model != null && model != live.model) {
      out.add(LuminexBackupDiff(
        kind: LuminexBackupDiffKind.model,
        backupValue: model!,
        liveValue: live.model!,
      ));
    }

    final backupName = profileDeviceName ?? switchName;
    if (backupName != null &&
        live.name != null &&
        backupName.isNotEmpty &&
        backupName != live.name) {
      out.add(LuminexBackupDiff(
        kind: LuminexBackupDiffKind.switchName,
        backupValue: backupName,
        liveValue: live.name!,
      ));
    }

    // Noms des groupes (par id), pour afficher des noms et non des numéros.
    final backupGroupNames = <int, String>{
      for (final g in profileGroups)
        if (g['group_id'] is num && g['name'] is String)
          (g['group_id'] as num).toInt(): g['name'] as String,
    };
    String backupGroupName(int id) => backupGroupNames[id] ?? 'Group $id';
    String liveGroupName(int id) => live.groupById(id)?.name ?? 'Group $id';

    for (final entry in backupGroupNames.entries) {
      final liveGroup = live.groupById(entry.key);
      if (liveGroup != null && liveGroup.name != entry.value) {
        out.add(LuminexBackupDiff(
          kind: LuminexBackupDiffKind.groupName,
          groupId: entry.key,
          backupValue: entry.value,
          liveValue: liveGroup.name,
        ));
      }
    }

    final livePorts = {for (final p in live.ports) p.portNr: p};
    for (final bp in profilePorts) {
      final nr = (bp['port_number'] as num?)?.toInt();
      if (nr == null) continue;
      final lp = livePorts[nr];
      if (lp == null) continue;

      // Appartenance (groupe / trunk)
      final member = bp['member_of'];
      if (member is Map) {
        final type = member['type'];
        final id = (member['id'] as num?)?.toInt();
        if (type == 'group' && id != null && lp.groupId != id) {
          out.add(LuminexBackupDiff(
            kind: LuminexBackupDiffKind.portGroup,
            portNr: nr,
            backupValue: backupGroupName(id),
            liveValue: lp.groupId != null
                ? liveGroupName(lp.groupId!)
                : 'ISL ${lp.trunkId ?? ''}'.trim(),
          ));
        } else if (type == 'trunk' && id != null && lp.trunkId != id) {
          out.add(LuminexBackupDiff(
            kind: LuminexBackupDiffKind.portTrunk,
            portNr: nr,
            backupValue: 'ISL $id',
            liveValue: lp.groupId != null
                ? liveGroupName(lp.groupId!)
                : 'ISL ${lp.trunkId ?? ''}'.trim(),
          ));
        }
      }

      // Activation
      final enabled = bp['enabled'];
      if (enabled is bool && lp.enabled != null && lp.enabled != enabled) {
        out.add(LuminexBackupDiff(
          kind: LuminexBackupDiffKind.portEnabled,
          portNr: nr,
          backupValue: enabled.toString(),
          liveValue: lp.enabled.toString(),
        ));
      }
    }

    // Légendes
    for (final e in legends.entries) {
      final lp = livePorts[e.key];
      if (lp == null) continue;
      final liveLegend = lp.name ?? '';
      if (liveLegend != e.value) {
        out.add(LuminexBackupDiff(
          kind: LuminexBackupDiffKind.portLegend,
          portNr: e.key,
          backupValue: e.value,
          liveValue: liveLegend,
        ));
      }
    }

    out.sort((a, b) {
      final byKind = a.kind.index.compareTo(b.kind.index);
      if (byKind != 0) return byKind;
      final byPort = (a.portNr ?? 0).compareTo(b.portNr ?? 0);
      return byPort != 0 ? byPort : (a.groupId ?? 0).compareTo(b.groupId ?? 0);
    });
    return out;
  }

  /// Réglages de port à renvoyer au switch pour revenir à la sauvegarde
  /// (légende, activation, groupe). Les ports trunk ne sont pas touchés :
  /// les remettre demande une restauration complète du profil.
  List<Map<String, dynamic>> portRestorePayload(LuminexDevice live) {
    final livePorts = {for (final p in live.ports) p.portNr: p};
    final byPort = <int, Map<String, dynamic>>{};

    for (final bp in profilePorts) {
      final nr = (bp['port_number'] as num?)?.toInt();
      if (nr == null) continue;
      final lp = livePorts[nr];
      if (lp == null || lp.isTrunk) continue;
      final member = bp['member_of'];
      if (member is! Map || member['type'] != 'group') continue;
      final id = (member['id'] as num?)?.toInt();
      final change = <String, dynamic>{};
      if (id != null && lp.groupId != id) {
        change['member_of'] = {'type': 'group', 'id': id};
      }
      final enabled = bp['enabled'];
      if (enabled is bool && lp.enabled != null && lp.enabled != enabled) {
        change['enabled'] = enabled;
      }
      if (change.isNotEmpty) byPort[nr] = change;
    }

    for (final e in legends.entries) {
      final lp = livePorts[e.key];
      if (lp == null) continue;
      if ((lp.name ?? '') != e.value) {
        byPort.putIfAbsent(e.key, () => {})['legend'] = e.value;
      }
    }

    final ports = byPort.keys.toList()..sort();
    return [
      for (final nr in ports) {'port_number': nr, ...byPort[nr]!},
    ];
  }
}

enum LuminexBackupDiffKind {
  model,
  switchName,
  groupName,
  portTrunk,
  portGroup,
  portEnabled,
  portLegend,
}

/// Une différence entre la sauvegarde et le switch.
class LuminexBackupDiff {
  final LuminexBackupDiffKind kind;
  final int? portNr;
  final int? groupId;
  final String backupValue;
  final String liveValue;

  const LuminexBackupDiff({
    required this.kind,
    this.portNr,
    this.groupId,
    required this.backupValue,
    required this.liveValue,
  });
}
