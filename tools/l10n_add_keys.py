#!/usr/bin/env python3
"""Ajoute / met à jour des clés l10n dans les ARB et les fichiers générés.

Usage : python3 tools/l10n_add_keys.py <racine_projet> <keys.json>

keys.json : {"maCle": {"placeholders": ["x"], "fr": "...", "en": "...", ...}, ...}
Langues : fr en de es nl pt. Idempotent.
"""
import json, re, sys, os
from collections import OrderedDict

ROOT, KEYS_FILE = sys.argv[1], sys.argv[2]
LANGS = ['fr', 'en', 'de', 'es', 'nl', 'pt']
with open(KEYS_FILE, encoding='utf-8') as f:
    raw = json.load(f, object_pairs_hook=OrderedDict)
K = OrderedDict((k, (v.get('placeholders', []), {l: v[l] for l in LANGS}))
                for k, v in raw.items())


def dart_str(text, ph):
    s = text.replace('\\', '\\\\').replace("'", "\\'").replace('$', '\\$')
    for p in ph:
        s = s.replace('{' + p + '}', '$' + p)
    return "'" + s + "'"


def sig(key, ph):
    return f"String {key}({', '.join('Object ' + p for p in ph)})" if ph \
        else f'String get {key}'


def patch_arb(lang):
    path = os.path.join(ROOT, 'lib', 'l10n', f'app_{lang}.arb')
    with open(path, encoding='utf-8') as f:
        data = json.load(f, object_pairs_hook=OrderedDict)
    for key, (ph, tr) in K.items():
        data[key] = tr[lang]
        if ph:
            data['@' + key] = OrderedDict(
                placeholders=OrderedDict((p, OrderedDict()) for p in ph))
    with open(path, 'w', encoding='utf-8') as f:
        f.write(json.dumps(data, ensure_ascii=False, indent=2) + '\n')


def patch_impl(lang):
    path = os.path.join(ROOT, 'lib', 'l10n_gen', f'app_localizations_{lang}.dart')
    with open(path, encoding='utf-8') as f:
        src = f.read()
    add = ''
    for key, (ph, tr) in K.items():
        src = re.sub(r"\n  @override\n  String get " + key + r" =>[\s\S]*?;\n", '\n', src)
        src = re.sub(r"\n  @override\n  String " + key + r"\([^)]*\) \{[\s\S]*?\n  \}\n", '\n', src)
        if ph:
            add += f"\n  @override\n  {sig(key, ph)} {{\n    return {dart_str(tr[lang], ph)};\n  }}\n"
        else:
            add += f"\n  @override\n  String get {key} =>\n      {dart_str(tr[lang], ph)};\n"
    idx = src.rstrip().rfind('}')
    src = src[:idx].rstrip('\n') + '\n' + add + '}\n'
    with open(path, 'w', encoding='utf-8') as f:
        f.write(src)


def patch_abstract():
    path = os.path.join(ROOT, 'lib', 'l10n_gen', 'app_localizations.dart')
    with open(path, encoding='utf-8') as f:
        src = f.read()
    cut = src.index('\nclass _AppLocalizationsDelegate')
    head, tail = src[:cut], src[cut:]
    body = head[:head.rstrip().rfind('}')]
    for key, (ph, tr) in K.items():
        if re.search(r'\n  ' + re.escape(sig(key, ph)) + r';', body):
            continue
        body = body.rstrip('\n') + (
            f"\n\n  /// No description provided for @{key}.\n  ///\n"
            f"  /// In fr, this message translates to:\n  /// **'{tr['fr']}'**\n"
            f"  {sig(key, ph)};\n")
    with open(path, 'w', encoding='utf-8') as f:
        f.write(body + '}\n' + tail)


for l in LANGS:
    patch_arb(l)
    patch_impl(l)
patch_abstract()
print('ok', len(K), 'keys')
