import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  static const _key = 'app_locale';

  Locale? _locale;
  Locale? get locale => _locale;

  final List<Locale> supportedLocales = const [
    Locale('fr'),
    Locale('en'),
    Locale('nl'),
    Locale('de'),
    Locale('es'),
    Locale('pt'),
  ];

  bool isSupported(String languageCode) {
    return supportedLocales.any((l) => l.languageCode == languageCode);
  }

  Future<void> loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_key);

    if (code != null && isSupported(code)) {
      _locale = Locale(code);
      notifyListeners();
    }
  }

  Future<void> setLocale(String languageCode) async {
    if (!isSupported(languageCode)) {
      // Sécurité: ignore si non supporté
      return;
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, languageCode);
    _locale = Locale(languageCode);
    notifyListeners();
  }

  Future<void> useSystemLocale() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
    _locale = null;
    notifyListeners();
  }

  Locale resolveSystemLocale(Locale? systemLocale) {
    if (systemLocale == null) return const Locale('fr');

    final code = systemLocale.languageCode;
    if (isSupported(code)) return Locale(code);

    return const Locale('fr');
  }
}
