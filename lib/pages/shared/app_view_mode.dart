import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

/// Mode d'affichage des menus de catégories : "cases" (grille, par défaut)
/// ou "lignes" (liste avec description). Choix global, mémorisé entre
/// les sessions et partagé par l'accueil et tous les menus de section.
class AppViewMode {
  AppViewMode._();

  static const String _prefKey = 'menuViewModeList';

  /// `true` = affichage en lignes, `false` = affichage en cases.
  static final ValueNotifier<bool> isList = ValueNotifier<bool>(false);

  static bool _loaded = false;

  /// Charge la préférence sauvegardée (appelé une fois au démarrage).
  static Future<void> load() async {
    if (_loaded) return;
    _loaded = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      isList.value = prefs.getBool(_prefKey) ?? false;
    } catch (_) {
      // Préférence illisible : on garde l'affichage en cases.
    }
  }

  static Future<void> toggle() async {
    isList.value = !isList.value;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_prefKey, isList.value);
    } catch (_) {}
  }
}

/// Bouton de barre d'app pour basculer entre affichage en cases et en lignes.
/// Placé une seule fois, dans la barre de l'accueil.
class AppViewModeButton extends StatelessWidget {
  const AppViewModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return ValueListenableBuilder<bool>(
      valueListenable: AppViewMode.isList,
      builder: (context, isList, _) {
        return IconButton(
          tooltip: isList ? loc.menuViewModeGrid : loc.menuViewModeList,
          onPressed: AppViewMode.toggle,
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 220),
            transitionBuilder: (child, anim) => RotationTransition(
              turns: Tween<double>(begin: 0.75, end: 1).animate(anim),
              child: FadeTransition(opacity: anim, child: child),
            ),
            child: Icon(
              isList ? Icons.grid_view_rounded : Icons.view_agenda_rounded,
              key: ValueKey(isList),
              size: 22,
              color: Colors.white.withValues(alpha: 0.85),
            ),
          ),
        );
      },
    );
  }
}
