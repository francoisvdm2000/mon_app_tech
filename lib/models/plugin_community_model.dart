import 'package:cloud_firestore/cloud_firestore.dart';

class PluginFile {
  final String name;
  final String url;
  const PluginFile({required this.name, required this.url});

  factory PluginFile.fromMap(Map<String, dynamic> m) =>
      PluginFile(name: m['name'] as String? ?? '', url: m['url'] as String? ?? '');

  Map<String, dynamic> toMap() => {'name': name, 'url': url};
}

class PluginModel {
  final String id;
  final String title;
  final String category;
  final String description;
  final String code;
  final List<PluginFile> files;
  final String authorId;
  final String authorPseudo;
  final int likes;
  final List<String> likedBy;
  final DateTime createdAt;

  const PluginModel({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.code,
    required this.files,
    required this.authorId,
    required this.authorPseudo,
    required this.likes,
    required this.likedBy,
    required this.createdAt,
  });

  factory PluginModel.fromDoc(DocumentSnapshot doc) {
    final d = doc.data() as Map<String, dynamic>;
    final rawFiles = d['files'] as List? ?? [];
    return PluginModel(
      id: doc.id,
      title: d['title'] as String? ?? '',
      category: d['category'] as String? ?? 'custom',
      description: d['description'] as String? ?? '',
      code: d['code'] as String? ?? '',
      files: rawFiles
          .map((e) => PluginFile.fromMap(e as Map<String, dynamic>))
          .toList(),
      authorId: d['authorId'] as String? ?? '',
      authorPseudo: d['authorPseudo'] as String? ?? 'Anonyme',
      likes: d['likes'] as int? ?? 0,
      likedBy: List<String>.from(d['likedBy'] as List? ?? []),
      createdAt: (d['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() => {
        'title': title,
        'category': category,
        'description': description,
        'code': code,
        'files': files.map((f) => f.toMap()).toList(),
        'authorId': authorId,
        'authorPseudo': authorPseudo,
        'likes': likes,
        'likedBy': likedBy,
        'createdAt': FieldValue.serverTimestamp(),
      };
}

class UserProfile {
  final String uid;
  final String pseudo;
  final DateTime createdAt;

  const UserProfile({
    required this.uid,
    required this.pseudo,
    required this.createdAt,
  });

  factory UserProfile.fromDoc(DocumentSnapshot doc) {
    final d = doc.data() as Map<String, dynamic>;
    return UserProfile(
      uid: doc.id,
      pseudo: d['pseudo'] as String? ?? 'Anonyme',
      createdAt: (d['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}

// Catégories disponibles
const kPluginCategories = <String, String>{
  'color':    '🎨 Couleurs',
  'movement': '🔄 Mouvement',
  'effect':   '✨ Effets',
  'dimmer':   '💡 Intensité',
  'select':   '🎯 Sélection',
  'macro':    '⚡ Macros',
  'utility':  '🔧 Utilitaires',
  'custom':   '🛠 Autre',
};
