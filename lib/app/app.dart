import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/locale_provider.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../pages/home_page.dart';
import 'constants.dart';

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LocaleProvider>();
    final dark = ThemeData.dark();

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // =======================
      // Localisation
      // =======================
      locale: provider.locale,
      supportedLocales: provider.supportedLocales,

      localeResolutionCallback: (deviceLocale, supportedLocales) {
        // Langue forcée par l'utilisateur
        if (provider.locale != null) return provider.locale;

        // Sinon langue système (fallback FR si non supportée)
        return provider.resolveSystemLocale(deviceLocale);
      },

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,

      // =======================
      // Theme sombre global
      // =======================
      themeMode: ThemeMode.dark,
      darkTheme: dark.copyWith(
        scaffoldBackgroundColor: const Color(0xFF0D0D14),
        cardColor: const Color(0xFF161622),
        dividerColor: Colors.white12,

        colorScheme: dark.colorScheme.copyWith(
          primary: kAccent,
          secondary: kAccent,
          surface: const Color(0xFF161622),
          onSurface: Colors.white,
          onPrimary: Colors.white,
          surfaceContainerHighest: const Color(0xFF1E1E2A),
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0D0D14),
          foregroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
        ),

        // Curseur / sélection texte
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.white,
          selectionColor: Color(0x40FFFFFF),
          selectionHandleColor: Colors.white,
        ),

        // Radios
        radioTheme: const RadioThemeData(
          fillColor: WidgetStatePropertyAll(Colors.white),
        ),

        // Checkbox
        checkboxTheme: const CheckboxThemeData(
          fillColor: WidgetStatePropertyAll(Colors.white),
          checkColor: WidgetStatePropertyAll(Colors.black),
        ),

        // Switch
        switchTheme: const SwitchThemeData(
          thumbColor: WidgetStatePropertyAll(Colors.white),
          trackColor: WidgetStatePropertyAll(Color(0x59FFFFFF)),
        ),

        listTileTheme: const ListTileThemeData(
          iconColor: Colors.white,
          textColor: Colors.white,
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF1A1A27),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: kActionBlue, width: 1.6),
          ),
          floatingLabelStyle: const TextStyle(
            color: Color(0xFF8EA2FF),
            fontWeight: FontWeight.w600,
          ),
          labelStyle: const TextStyle(color: Colors.white70),
          hintStyle: const TextStyle(color: Colors.white38),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kActionBlue,
            foregroundColor: Colors.white,
            disabledBackgroundColor: Colors.white.withValues(alpha: 0.08),
            disabledForegroundColor: Colors.white38,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),

        // Sélecteurs segmentés (ex: Largeur / Hauteur / Diagonale)
        segmentedButtonTheme: SegmentedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith(
              (states) => states.contains(WidgetState.selected)
                  ? kActionBlue.withValues(alpha: 0.28)
                  : const Color(0xFF1A1A27),
            ),
            foregroundColor: WidgetStateProperty.resolveWith(
              (states) => states.contains(WidgetState.selected)
                  ? Colors.white
                  : Colors.white70,
            ),
            side: WidgetStatePropertyAll(
              BorderSide(color: Colors.white.withValues(alpha: 0.14)),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),

        // Messages "copié", etc. : bulle flottante arrondie
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: const Color(0xFF26263A),
          contentTextStyle: const TextStyle(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.white70),
        ),

        // Sans ce réglage, un OutlinedButton sans style explicite hérite
        // de colorScheme.primary (kAccent = bleu marine très sombre) comme
        // couleur de texte : illisible sur fond sombre. On force un blanc
        // légèrement atténué + une bordure visible, cohérent partout.
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: const BorderSide(color: Colors.white24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
      ),

      home: const PageAccueil(),
    );
  }
}
