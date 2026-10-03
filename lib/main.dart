import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'pages/shared/app_view_mode.dart';
import 'providers/locale_provider.dart';
import 'services/auth_bootstrap_service.dart';
import 'services/entitlement_service.dart';
import 'services/tester_access_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Meta App Events : app_open et install sont auto-loggés par le SDK.

  // Identité stable (anonyme si besoin) pour les entitlements serveur.
  // Lancée en ARRIÈRE-PLAN : avant, l'app attendait cette connexion
  // (jusqu'à plusieurs secondes, réseau / restauration de session) avant
  // d'afficher le moindre écran. Ce qui a besoin de l'uid attend
  // AuthBootstrapService.ready.
  AuthBootstrapService.start();
  EntitlementService.init();
  TesterAccessService.init();

  // Préférences locales (rapides) chargées en parallèle.
  final localeProvider = LocaleProvider();
  await Future.wait([
    localeProvider.loadSavedLocale(),
    AppViewMode.load(),
  ]);

  runApp(
    ChangeNotifierProvider(
      create: (_) => localeProvider,
      child: const MonApp(),
    ),
  );
}
