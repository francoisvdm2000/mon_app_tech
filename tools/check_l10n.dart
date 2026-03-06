// ignore_for_file: avoid_print

import 'dart:io';

/// ====== CONFIG ======

/// Dossiers scannés
const _rootDirs = <String>['lib'];

/// Fichiers/dossiers à ignorer (chemins partiels)
final _ignorePathContains = <String>[
  '/.dart_tool/',
  '/build/',
  '/generated/',
  '/l10n_gen/',
  '/gen/',
  '/out/',
  '/backup/',
  'main_backup.dart',
  '_backup.dart',
];

/// Strings "tech" acceptées (non traduites volontairement)
final _allowedExactStrings = <String>{
  '•',
  '•  ',
  '—',
  '-',
  'OK',
  'N/A',
  '16:9',
  '16:10',
  '4:3',
  '21:9',
};

/// Patterns acceptés (regex simples, sur la ligne)
final _allowedLineContains = <String>[
  "loc.",
  "AppLocalizations.of(context)",
  "S.of(context)", // si jamais tu utilises intl_utils ailleurs
];

/// Widgets / props qu’on veut surveiller.
final _watchTokens = <String>[
  "Text(",
  "SelectableText(",
  "Tooltip(",
  "SnackBar(",
  "AlertDialog(",
  "SimpleDialog(",
  "InputDecoration(",
  "labelText:",
  "hintText:",
  "helperText:",
  "errorText:",
  "title:",
  "subtitle:",
  "content:",
  "message:",
  "semanticsLabel:",
];

/// Si true, on ignore les lignes avec interpolation '$var' (souvent OK)
/// Exemple: Text('$label : $value')
const bool _ignoreInterpolatedStrings = true;

/// ====== LOGIC ======

bool _shouldIgnoreFile(String path) {
  for (final s in _ignorePathContains) {
    if (path.contains(s)) return true;
  }
  return false;
}

bool _lineMentionsWatchToken(String line) {
  return _watchTokens.any(line.contains);
}

bool _lineHasLocalization(String line) {
  return _allowedLineContains.any(line.contains);
}

Iterable<String> _extractQuotedStrings(String line) sync* {
  // Extraction simple des segments entre '...' ou "..."
  // Gère les quotes échappées de manière basique.
  final patterns = <RegExp>[
    RegExp(r"'([^'\\]*(?:\\.[^'\\]*)*)'"),
    RegExp(r'"([^"\\]*(?:\\.[^"\\]*)*)"'),
  ];

  for (final re in patterns) {
    for (final m in re.allMatches(line)) {
      final raw = m.group(1) ?? '';
      yield raw;
    }
  }
}

bool _isAllowedStringLiteral(String s) {
  final trimmed = s.trim();

  if (trimmed.isEmpty) return true;

  // Tokens purement techniques / symboles
  if (_allowedExactStrings.contains(trimmed)) return true;

  // Ratios d’aspect type 16:9 etc (au cas où)
  if (RegExp(r'^\d{1,2}:\d{1,2}$').hasMatch(trimmed)) return true;

  // Unité seule (ex: "m", "%") : on préfère L10n, mais on peut tolérer si besoin.
  // Ici: on NE tolère PAS par défaut. Décommente si tu veux autoriser.
  // if (RegExp(r'^(m|%|mm|cm|kg|W|kW|lm|lux)$').hasMatch(trimmed)) return true;

  return false;
}

bool _looksLikeHardcodedUiText(String line) {
  if (!_lineMentionsWatchToken(line)) return false;

  // Si la ligne utilise déjà loc/AppLocalizations => OK
  if (_lineHasLocalization(line)) return false;

  // S’il n’y a pas de guillemets => OK
  if (!line.contains("'") && !line.contains('"')) return false;

  // Optionnel: ignorer les interpolations
  if (_ignoreInterpolatedStrings && line.contains(r"$")) {
    // Mais on ne veut pas ignorer les cas du type "Erreur: $x" -> c’est du texte.
    // On ignore uniquement si la chaîne est *quasi entièrement* interpolée.
    // Exemple: '$label : $value' -> ok ignoré
    final quoted = _extractQuotedStrings(line).toList();
    if (quoted.isNotEmpty) {
      final s = quoted.join(' ');
      final letters = RegExp(r'[A-Za-zÀ-ÿ]').allMatches(s).length;
      final dollars = RegExp(r'\$').allMatches(s).length;
      // si peu de lettres et au moins un $ => probable string technique/interpolée
      if (dollars >= 1 && letters <= 2) return false;
    }
  }

  // Analyse des littéraux trouvés : si au moins un littéral non autorisé => flag
  for (final s in _extractQuotedStrings(line)) {
    if (_isAllowedStringLiteral(s)) continue;
    // Si la string ressemble à une clé (ex: "homeTitle") dans un map => pas UI
    // Mais ici on check surtout UI tokens, donc on flag.
    return true;
  }

  return false;
}

void main() {
  int issues = 0;

  final roots = _rootDirs.map(Directory.new).where((d) => d.existsSync());

  for (final root in roots) {
    for (final entity in root.listSync(recursive: true)) {
      if (entity is! File) continue;
      if (!entity.path.endsWith('.dart')) continue;

      final path = entity.path.replaceAll('\\', '/');
      if (_shouldIgnoreFile(path)) continue;

      final lines = entity.readAsLinesSync();

      for (int i = 0; i < lines.length; i++) {
        final line = lines[i];

        if (_looksLikeHardcodedUiText(line)) {
          issues++;
          print("⚠️ Hardcoded UI text: $path:${i + 1}");
          print("   ${line.trim()}");
        }
      }
    }
  }

  if (issues == 0) {
    print("✅ No hardcoded UI text detected.");
    exit(0);
  } else {
    print("\n❌ $issues hardcoded UI text issues found.");
    exit(1);
  }
}
