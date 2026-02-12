import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/locale_provider.dart';
import '../l10n/app_localizations.dart';
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
        scaffoldBackgroundColor: Colors.black,
        cardColor: const Color(0xFF111111),
        dividerColor: Colors.white24,

        colorScheme: dark.colorScheme.copyWith(
          primary: kAccent,
          secondary: kAccent,
          onSurface: Colors.white,
          onPrimary: Colors.white,
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
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
          fillColor: const Color(0xFF111111),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Colors.white24),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Colors.white, width: 1.2),
          ),
          labelStyle: const TextStyle(color: Colors.white70),
          hintStyle: const TextStyle(color: Colors.white38),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kAccent,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.white70),
        ),
      ),

      home: const PageAccueil(),
    );
  }
}
