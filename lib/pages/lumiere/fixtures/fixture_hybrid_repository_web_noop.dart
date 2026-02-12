/// Stub IO : ce fichier est utilisé sur mobile/desktop.
/// La fonction Web n'est jamais appelée si kIsWeb == false.
Future<String> fetchTextWeb(String url) {
  // Ne pas mettre de texte "UI" ici : c'est un message technique.
  throw UnsupportedError(
      'fetchTextWeb is only available on Web (kIsWeb=true).');
}
