import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// Type de source pour une ligne de la liste d'inputs.
enum AudioInputType { mic, di, line, wireless, other }

class AudioInputItem {
  final String id;
  final String name;
  final AudioInputType type;
  final String position;
  final String notes;

  const AudioInputItem({
    required this.id,
    required this.name,
    required this.type,
    required this.position,
    required this.notes,
  });

  AudioInputItem copyWith({
    String? name,
    AudioInputType? type,
    String? position,
    String? notes,
  }) {
    return AudioInputItem(
      id: id,
      name: name ?? this.name,
      type: type ?? this.type,
      position: position ?? this.position,
      notes: notes ?? this.notes,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type.name,
        'position': position,
        'notes': notes,
      };

  static AudioInputItem fromJson(Map<String, dynamic> json) {
    return AudioInputItem(
      id: (json['id'] ?? '').toString(),
      name: (json['name'] ?? '').toString(),
      type: AudioInputType.values.firstWhere(
        (t) => t.name == (json['type'] ?? '').toString(),
        orElse: () => AudioInputType.mic,
      ),
      position: (json['position'] ?? '').toString(),
      notes: (json['notes'] ?? '').toString(),
    );
  }

  static AudioInputItem empty() => AudioInputItem(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        name: '',
        type: AudioInputType.mic,
        position: '',
        notes: '',
      );
}

/// Persistance locale (SharedPreferences) de la liste d'inputs — un seul
/// document de travail par appareil, sur le modèle de LaserStorage.
class AudioInputListStorage {
  static const String _key = 'audio_input_list_v1';

  static Future<List<AudioInputItem>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null || raw.trim().isEmpty) return [];

    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return [];
      return decoded
          .whereType<Map>()
          .map((m) => AudioInputItem.fromJson(Map<String, dynamic>.from(m)))
          .toList();
    } catch (_) {
      return [];
    }
  }

  static Future<void> save(List<AudioInputItem> items) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        _key, jsonEncode(items.map((i) => i.toJson()).toList()));
  }
}
