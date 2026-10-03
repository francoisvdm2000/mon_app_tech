#!/usr/bin/env python3
"""Ajoute les clés l10n de l'outil Charge Ampli / Enceintes (ARB + fichiers générés).

Usage : python3 add_l10n.py <racine_projet>
Idempotent : une clé déjà présente est mise à jour, pas dupliquée.
"""
import json, re, sys, os
from collections import OrderedDict

ROOT = sys.argv[1]
LANGS = ['fr', 'en', 'de', 'es', 'nl', 'pt']

# key -> (placeholders, {lang: text})
K = OrderedDict()

def k(key, ph, fr, en, de, es, nl, pt):
    K[key] = (ph, dict(fr=fr, en=en, de=de, es=es, nl=nl, pt=pt))

k('audioPickAmplifier', [],
  'Choisir un amplificateur', 'Choose an amplifier', 'Verstärker wählen',
  'Elegir un amplificador', 'Kies een versterker', 'Escolher um amplificador')
k('audioPickSpeaker', [],
  'Choisir une enceinte', 'Choose a loudspeaker', 'Lautsprecher wählen',
  'Elegir un altavoz', 'Kies een luidspreker', 'Escolher uma coluna')
k('audioSearchBrandModel', [],
  'Rechercher une marque ou un modèle', 'Search brand or model',
  'Marke oder Modell suchen', 'Buscar marca o modelo', 'Zoek merk of model',
  'Pesquisar marca ou modelo')
k('audioCustomPreset', [],
  'Personnalisé', 'Custom', 'Benutzerdefiniert', 'Personalizado', 'Aangepast',
  'Personalizado')
k('audioCustomPresetHint', [],
  'Saisir vos propres valeurs', 'Enter your own values', 'Eigene Werte eingeben',
  'Introducir sus propios valores', 'Eigen waarden invoeren',
  'Introduzir os seus próprios valores')
k('audioModelsCount', ['count'],
  '{count} modèles', '{count} models', '{count} Modelle', '{count} modelos',
  '{count} modellen', '{count} modelos')
k('audioNoResults', [],
  'Aucun résultat', 'No results', 'Keine Ergebnisse', 'Sin resultados',
  'Geen resultaten', 'Sem resultados')
k('audioChannelsCount', ['count'],
  '{count} voies', '{count} channels', '{count} Kanäle', '{count} canales',
  '{count} kanalen', '{count} canais')
k('audioRecommendedAmp', ['range'],
  'Ampli recommandé : {range}', 'Recommended amp: {range}',
  'Empfohlener Verstärker: {range}', 'Amplificador recomendado: {range}',
  'Aanbevolen versterker: {range}', 'Amplificador recomendado: {range}')
k('audioPowerHandling', ['watts'],
  'Tenue en puissance : {watts} W', 'Power handling: {watts} W',
  'Belastbarkeit: {watts} W', 'Potencia admisible: {watts} W',
  'Belastbaarheid: {watts} W', 'Potência admissível: {watts} W')
k('audioNoPowerData', [],
  'Tenue en puissance non publiée par le fabricant : seule l’impédance est vérifiée. Utilisez ses presets / contrôleurs.',
  'Power handling not published by the manufacturer: only impedance is checked. Use its presets / controllers.',
  'Belastbarkeit vom Hersteller nicht veröffentlicht: nur die Impedanz wird geprüft. Herstellerpresets / Controller verwenden.',
  'Potencia admisible no publicada por el fabricante: solo se comprueba la impedancia. Use sus presets / controladores.',
  'Belastbaarheid niet gepubliceerd door de fabrikant: alleen de impedantie wordt gecontroleerd. Gebruik de presets / controllers van de fabrikant.',
  'Potência admissível não publicada pelo fabricante: só a impedância é verificada. Use os presets / controladores do fabricante.')
k('audioActiveSection', [],
  'Enceinte active : une voie d’ampli par section.',
  'Actively driven cabinet: one amp channel per section.',
  'Aktiv betriebener Lautsprecher: ein Verstärkerkanal pro Sektion.',
  'Recinto activo: un canal de amplificador por sección.',
  'Actief aangestuurde kast: één versterkerkanaal per sectie.',
  'Coluna ativa: um canal de amplificador por secção.')
k('audioStatusZTooLow', ['diff'],
  '✗  Z trop basse (−{diff} Ω)', '✗  Z too low (−{diff} Ω)',
  '✗  Z zu niedrig (−{diff} Ω)', '✗  Z demasiado baja (−{diff} Ω)',
  '✗  Z te laag (−{diff} Ω)', '✗  Z demasiado baixa (−{diff} Ω)')
k('audioStatusOkPct', ['pct'],
  '✓  OK ({pct} % RMS)', '✓  OK ({pct}% RMS)', '✓  OK ({pct} % RMS)',
  '✓  OK ({pct} % RMS)', '✓  OK ({pct}% RMS)', '✓  OK ({pct}% RMS)')
k('audioStatusUnderpowered', ['pct'],
  '↓  Sous-alimenté ({pct} % RMS)', '↓  Underpowered ({pct}% RMS)',
  '↓  Unterversorgt ({pct} % RMS)', '↓  Poca potencia ({pct} % RMS)',
  '↓  Te weinig vermogen ({pct}% RMS)', '↓  Pouca potência ({pct}% RMS)')
k('audioStatusHeadroom', ['ratio'],
  '✓  Marge ×{ratio}', '✓  Headroom ×{ratio}', '✓  Reserve ×{ratio}',
  '✓  Margen ×{ratio}', '✓  Reserve ×{ratio}', '✓  Margem ×{ratio}')
k('audioStatusLimiterRequired', ['ratio'],
  '⚠  ×{ratio} — limiteur indispensable', '⚠  ×{ratio} — limiter required',
  '⚠  ×{ratio} — Limiter erforderlich', '⚠  ×{ratio} — limitador obligatorio',
  '⚠  ×{ratio} — limiter vereist', '⚠  ×{ratio} — limitador obrigatório')
k('audioStatusOverpowered', ['ratio'],
  '✗  Trop puissant ×{ratio}', '✗  Overpowered ×{ratio}', '✗  Zu stark ×{ratio}',
  '✗  Demasiada potencia ×{ratio}', '✗  Te veel vermogen ×{ratio}',
  '✗  Potência excessiva ×{ratio}')
k('audioStatusInRange', [],
  '✓  Dans la plage fabricant', '✓  Within manufacturer range',
  '✓  Im Herstellerbereich', '✓  En el rango del fabricante',
  '✓  Binnen fabrieksbereik', '✓  Dentro da gama do fabricante')
k('audioStatusBelowRange', [],
  '↓  Sous la plage recommandée', '↓  Below recommended range',
  '↓  Unter empfohlenem Bereich', '↓  Bajo el rango recomendado',
  '↓  Onder aanbevolen bereik', '↓  Abaixo da gama recomendada')
k('audioStatusAboveRange', [],
  '⚠  Au-dessus de la plage', '⚠  Above recommended range',
  '⚠  Über empfohlenem Bereich', '⚠  Por encima del rango',
  '⚠  Boven aanbevolen bereik', '⚠  Acima da gama recomendada')
k('audioStatusZOkNoData', [],
  '✓  Z OK — P non publiée', '✓  Z OK — P not published',
  '✓  Z OK — P nicht veröffentlicht', '✓  Z OK — P no publicada',
  '✓  Z OK — P niet gepubliceerd', '✓  Z OK — P não publicada')
k('audioAmpLoadNote', [],
  'Calcul basé sur les puissances publiées par le fabricant de l’ampli à chaque impédance (interpolées). La puissance de la voie est partagée entre les N enceintes en parallèle. Une marge ×1,5 à ×2 sur la tenue RMS/AES est courante si un limiteur est réglé. Valeurs issues des fiches techniques : vérifiez toujours avec les presets et recommandations du fabricant.',
  'Based on the amplifier’s published power at each impedance (interpolated). The channel’s power is shared between the N speakers in parallel. 1.5× to 2× headroom over RMS/AES power handling is common when a limiter is set. Values come from manufacturer data sheets: always check against the manufacturer’s presets and recommendations.',
  'Berechnung auf Basis der vom Hersteller angegebenen Verstärkerleistung je Impedanz (interpoliert). Die Kanalleistung wird auf die N parallel geschalteten Lautsprecher aufgeteilt. 1,5- bis 2-fache Reserve gegenüber der RMS/AES-Belastbarkeit ist mit eingestelltem Limiter üblich. Werte aus Herstellerdatenblättern: immer mit Herstellerpresets und -empfehlungen abgleichen.',
  'Cálculo basado en la potencia publicada por el fabricante del amplificador para cada impedancia (interpolada). La potencia del canal se reparte entre los N altavoces en paralelo. Un margen de ×1,5 a ×2 sobre la potencia RMS/AES es habitual con un limitador ajustado. Valores de las fichas técnicas: verifique siempre con los presets y recomendaciones del fabricante.',
  'Berekening op basis van het opgegeven vermogen van de versterker per impedantie (geïnterpoleerd). Het kanaalvermogen wordt verdeeld over de N parallelle luidsprekers. 1,5× tot 2× reserve boven de RMS/AES-belastbaarheid is gebruikelijk met een ingestelde limiter. Waarden uit datasheets: controleer altijd met de presets en aanbevelingen van de fabrikant.',
  'Cálculo baseado na potência publicada pelo fabricante do amplificador para cada impedância (interpolada). A potência do canal é repartida pelas N colunas em paralelo. Uma margem de ×1,5 a ×2 sobre a potência RMS/AES é comum com um limitador ajustado. Valores das fichas técnicas: confirme sempre com os presets e recomendações do fabricante.')


def dart_str(text, ph):
    s = text.replace('\\', '\\\\').replace("'", "\\'").replace('$', '\\$')
    for p in ph:
        s = s.replace('{' + p + '}', '$' + p)
    return "'" + s + "'"


def patch_arb(lang):
    path = os.path.join(ROOT, 'lib', 'l10n', f'app_{lang}.arb')
    with open(path, encoding='utf-8') as f:
        raw = f.read()
    data = json.loads(raw, object_pairs_hook=OrderedDict)
    for key, (ph, tr) in K.items():
        data[key] = tr[lang]
        if ph:
            data['@' + key] = OrderedDict(
                placeholders=OrderedDict((p, OrderedDict()) for p in ph))
    out = json.dumps(data, ensure_ascii=False, indent=2) + '\n'
    with open(path, 'w', encoding='utf-8') as f:
        f.write(out)


def method_sig(key, ph):
    if ph:
        args = ', '.join(f'Object {p}' for p in ph)
        return f'String {key}({args})'
    return f'String get {key}'


def remove_existing(src, key):
    # supprime une implémentation existante (getter ou méthode) de [key]
    src = re.sub(r"\n  @override\n  String get " + key + r" =>[\s\S]*?;\n", '\n', src)
    src = re.sub(r"\n  @override\n  String " + key + r"\([^)]*\) \{[\s\S]*?\n  \}\n", '\n', src)
    return src


def patch_impl(lang):
    path = os.path.join(ROOT, 'lib', 'l10n_gen', f'app_localizations_{lang}.dart')
    with open(path, encoding='utf-8') as f:
        src = f.read()
    for key in K:
        src = remove_existing(src, key)
    add = ''
    for key, (ph, tr) in K.items():
        if ph:
            add += f"\n  @override\n  {method_sig(key, ph)} {{\n    return {dart_str(tr[lang], ph)};\n  }}\n"
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
    marker = '\nclass _AppLocalizationsDelegate'
    cut = src.index(marker)
    head, tail = src[:cut], src[cut:]
    end = head.rstrip().rfind('}')
    body = head[:end]
    for key, (ph, tr) in K.items():
        if re.search(r'\n  ' + re.escape(method_sig(key, ph)) + r';', body):
            continue
        fr = tr['fr'].replace('\n', ' ')
        body = body.rstrip('\n') + (
            f"\n\n  /// No description provided for @{key}.\n  ///\n"
            f"  /// In fr, this message translates to:\n  /// **'{fr}'**\n"
            f"  {method_sig(key, ph)};\n")
    src = body + '}\n' + tail
    with open(path, 'w', encoding='utf-8') as f:
        f.write(src)


for l in LANGS:
    patch_arb(l)
    patch_impl(l)
patch_abstract()
print('ok', len(K), 'keys')
