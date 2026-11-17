import 'package:shared_preferences/shared_preferences.dart';

/// Astuces « Le saviez-vous ? » affichées sur l'accueil.
///
/// - Jamais au tout premier lancement (l'avertissement s'affiche déjà).
/// - Priorité aux astuces des sections que l'utilisateur n'a jamais ouvertes.
/// - Rotation : une astuce différente à chaque lancement.
/// - Désactivable dans les Paramètres.
class HomeTipsService {
  HomeTipsService._();

  static const _kEnabled = 'home_tips_enabled';
  static const _kLaunches = 'home_tips_launches';
  static const _kRotation = 'home_tips_rotation';
  static const _kOpenedSections = 'home_tips_opened_sections';

  static Future<bool> isEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_kEnabled) ?? true;
  }

  static Future<void> setEnabled(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kEnabled, value);
  }

  /// À appeler quand l'utilisateur ouvre une section de l'accueil.
  static Future<void> markSectionOpened(String sectionId) async {
    final prefs = await SharedPreferences.getInstance();
    final opened = prefs.getStringList(_kOpenedSections) ?? <String>[];
    if (!opened.contains(sectionId)) {
      opened.add(sectionId);
      await prefs.setStringList(_kOpenedSections, opened);
    }
  }

  /// Choisit l'astuce à montrer pour ce lancement (ou null).
  /// [tips] : liste de (id de l'astuce, id de la section concernée).
  static Future<String?> pickTipForLaunch(
    List<({String id, String section})> tips,
  ) async {
    if (tips.isEmpty) return null;
    final prefs = await SharedPreferences.getInstance();

    final launches = (prefs.getInt(_kLaunches) ?? 0) + 1;
    await prefs.setInt(_kLaunches, launches);

    if (!(prefs.getBool(_kEnabled) ?? true)) return null;
    if (launches < 2) return null;

    final opened = (prefs.getStringList(_kOpenedSections) ?? <String>[]).toSet();
    var candidates = tips.where((t) => !opened.contains(t.section)).toList();
    if (candidates.isEmpty) candidates = tips;

    final rotation = prefs.getInt(_kRotation) ?? 0;
    await prefs.setInt(_kRotation, rotation + 1);
    return candidates[rotation % candidates.length].id;
  }
}
