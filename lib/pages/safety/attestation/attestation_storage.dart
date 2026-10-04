// lib/pages/safety/attestation/attestation_storage.dart
//
// Stockage local des attestations (SharedPreferences, JSON) et de leurs
// photos (dossier de l'app). Seul le nom de fichier est enregistré dans le
// document : le chemin absolu du dossier de l'app change entre deux mises
// à jour sur iOS.

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'attestation_models.dart';

class AttestationStorage {
  static const _key = 'safety_attestations_v1';

  static Future<List<AttestationDocument>> loadAll() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_key);
      if (raw == null || raw.trim().isEmpty) return [];
      final decoded = jsonDecode(raw);
      if (decoded is! List) return [];
      final docs = [
        for (final d in decoded)
          if (d is Map<String, dynamic>) AttestationDocument.fromJson(d),
      ];
      docs.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
      return docs;
    } catch (_) {
      return [];
    }
  }

  static Future<void> _saveAll(List<AttestationDocument> docs) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        _key, jsonEncode([for (final d in docs) d.toJson()]));
  }

  static Future<void> save(AttestationDocument doc) async {
    final docs = await loadAll();
    final i = docs.indexWhere((d) => d.id == doc.id);
    if (i >= 0) {
      docs[i] = doc;
    } else {
      docs.add(doc);
    }
    await _saveAll(docs);
  }

  static Future<void> delete(String id) async {
    final docs = await loadAll();
    docs.removeWhere((d) => d.id == id);
    await _saveAll(docs);
    await AttestationPhotos.deleteAll(id);
  }
}

/// Photos d'une attestation : <documents de l'app>/attestation_photos/<id>/.
class AttestationPhotos {
  static final ImagePicker _picker = ImagePicker();

  static Future<Directory> _dir(String docId) async {
    final base = await getApplicationDocumentsDirectory();
    final dir = Directory('${base.path}/attestation_photos/$docId');
    if (!await dir.exists()) await dir.create(recursive: true);
    return dir;
  }

  /// Prend une photo (ou en choisit une dans la galerie) et la copie dans le
  /// dossier de l'attestation. Renvoie le nom du fichier, ou null si annulé.
  static Future<String?> capture(String docId, {bool fromGallery = false}) async {
    final picked = await _picker.pickImage(
      source: fromGallery ? ImageSource.gallery : ImageSource.camera,
      maxWidth: 1600,
      maxHeight: 1600,
      imageQuality: 72,
    );
    if (picked == null) return null;
    final dir = await _dir(docId);
    final name = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    await File(picked.path).copy('${dir.path}/$name');
    return name;
  }

  static Future<File> file(String docId, String name) async {
    final dir = await _dir(docId);
    return File('${dir.path}/$name');
  }

  static Future<Uint8List?> bytes(String docId, String name) async {
    try {
      final f = await file(docId, name);
      if (!await f.exists()) return null;
      return await f.readAsBytes();
    } catch (_) {
      return null;
    }
  }

  static Future<void> remove(String docId, String name) async {
    try {
      final f = await file(docId, name);
      if (await f.exists()) await f.delete();
    } catch (_) {}
  }

  static Future<void> deleteAll(String docId) async {
    try {
      final base = await getApplicationDocumentsDirectory();
      final dir = Directory('${base.path}/attestation_photos/$docId');
      if (await dir.exists()) await dir.delete(recursive: true);
    } catch (_) {}
  }
}
