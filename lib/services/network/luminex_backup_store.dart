import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../../models/network/luminex_backup.dart';

/// Rangement des sauvegardes GigaCore dans l'app
/// (dossier Documents/luminex_backups, un fichier JSON par sauvegarde).
class LuminexBackupStore {
  LuminexBackupStore._();

  static Future<Directory> _dir() async {
    final base = await getApplicationDocumentsDirectory();
    final dir = Directory('${base.path}/luminex_backups');
    if (!await dir.exists()) await dir.create(recursive: true);
    return dir;
  }

  /// Enregistre [backup] et renvoie le fichier écrit.
  static Future<File> save(LuminexBackup backup) async {
    final dir = await _dir();
    var file = File('${dir.path}/${backup.suggestedFileName}');
    var i = 2;
    while (await file.exists()) {
      final name = backup.suggestedFileName.replaceFirst('.json', ' ($i).json');
      file = File('${dir.path}/$name');
      i++;
    }
    await file.writeAsString(backup.toJsonString(), flush: true);
    return file;
  }

  /// Toutes les sauvegardes, les plus récentes d'abord.
  static Future<List<({File file, LuminexBackup backup})>> list() async {
    final dir = await _dir();
    final out = <({File file, LuminexBackup backup})>[];
    await for (final entity in dir.list()) {
      if (entity is! File || !entity.path.endsWith('.json')) continue;
      try {
        final backup = LuminexBackup.tryParse(await entity.readAsString());
        if (backup != null) out.add((file: entity, backup: backup));
      } catch (_) {
        // Fichier illisible ignoré
      }
    }
    out.sort((a, b) => b.backup.createdAt.compareTo(a.backup.createdAt));
    return out;
  }

  /// Importe une sauvegarde reçue (fichier partagé) ; null si invalide.
  static Future<LuminexBackup?> importBytes(List<int> bytes) async {
    final String text;
    try {
      text = utf8.decode(bytes);
    } catch (_) {
      return null;
    }
    final backup = LuminexBackup.tryParse(text);
    if (backup == null) return null;
    await save(backup);
    return backup;
  }

  static Future<void> delete(File file) async {
    if (await file.exists()) await file.delete();
  }
}
