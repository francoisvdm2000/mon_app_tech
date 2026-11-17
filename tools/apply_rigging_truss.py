#!/usr/bin/env python3
"""Ajoute l'outil « Charge par moteur » au projet ShowTech Tools.

À lancer depuis la racine du projet Flutter (mon_app_tech) :
    python3 tools/apply_rigging_truss.py
puis :
    flutter gen-l10n && flutter test test/rigging_truss_engine_test.dart

- ajoute les clés de traduction manquantes dans les 6 fichiers .arb
  (sans toucher aux clés existantes, sans reformater les fichiers) ;
- ajoute la tuile dans lib/pages/rigging/rigging_page.dart ;
- ajoute l'entrée dans lib/pages/shared/tool_registry.dart.
Le script est idempotent : le relancer ne duplique rien.
"""
import json
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
L10N = ROOT / "lib" / "l10n"

# key -> (fr, en, de, es, nl, pt)
STRINGS = {
    "riggingToolTrussLoadTitle": (
        "Charge par moteur",
        "Load per hoist",
        "Last pro Kettenzug",
        "Carga por motor",
        "Belasting per takel",
        "Carga por motor",
    ),
    "riggingToolTrussLoadSubtitle": (
        "Répartition d’un truss sur 2 à 6 moteurs, avec vérification CMU et truss.",
        "Truss load split over 2 to 6 hoists, with WLL and truss checks.",
        "Lastverteilung einer Traverse auf 2 bis 6 Kettenzüge, mit WLL- und Traversenprüfung.",
        "Reparto de un truss sobre 2 a 6 motores, con verificación de CMU y del truss.",
        "Verdeling van een truss over 2 tot 6 takels, met WLL- en trusscontrole.",
        "Distribuição de uma treliça por 2 a 6 motores, com verificação de CMU e da treliça.",
    ),
    "riggingTrussSectionTruss": ("Truss", "Truss", "Traverse", "Truss", "Truss", "Treliça"),
    "riggingTrussLengthLabel": (
        "Longueur du truss", "Truss length", "Traversenlänge",
        "Longitud del truss", "Lengte van de truss", "Comprimento da treliça",
    ),
    "riggingTrussSelfWeightLabel": (
        "Poids propre du truss", "Truss self-weight", "Eigengewicht der Traverse",
        "Peso propio del truss", "Eigen gewicht van de truss", "Peso próprio da treliça",
    ),
    "riggingTrussExtraUdlLabel": (
        "Charge répartie en plus (câbles…)", "Extra distributed load (cables…)",
        "Zusätzliche Streckenlast (Kabel…)", "Carga repartida adicional (cables…)",
        "Extra verdeelde last (kabels…)", "Carga distribuída adicional (cabos…)",
    ),
    "riggingUnitKgPerMeter": ("kg/m", "kg/m", "kg/m", "kg/m", "kg/m", "kg/m"),
    "riggingUnitKn": ("kN", "kN", "kN", "kN", "kN", "kN"),
    "riggingUnitKnm": ("kN·m", "kN·m", "kN·m", "kN·m", "kN·m", "kN·m"),
    "riggingTrussSectionMotors": (
        "Moteurs", "Hoists", "Kettenzüge", "Motores", "Takels", "Motores",
    ),
    "riggingTrussMotorCountLabel": (
        "Nombre de moteurs", "Number of hoists", "Anzahl Kettenzüge",
        "Número de motores", "Aantal takels", "Número de motores",
    ),
    "riggingTrussMotorPositionLabel": (
        "Position moteur {n}", "Hoist {n} position", "Position Kettenzug {n}",
        "Posición motor {n}", "Positie takel {n}", "Posição do motor {n}",
    ),
    "riggingTrussPositionsHint": (
        "Positions mesurées depuis l’extrémité gauche du truss.",
        "Positions measured from the left end of the truss.",
        "Positionen ab dem linken Ende der Traverse gemessen.",
        "Posiciones medidas desde el extremo izquierdo del truss.",
        "Posities gemeten vanaf het linkeruiteinde van de truss.",
        "Posições medidas a partir da extremidade esquerda da treliça.",
    ),
    "riggingTrussSpreadMotors": (
        "Répartir régulièrement", "Space evenly", "Gleichmäßig verteilen",
        "Repartir uniformemente", "Gelijkmatig verdelen", "Distribuir uniformemente",
    ),
    "riggingTrussExtraPerMotorLabel": (
        "Poids ajouté par point (chaîne, élingues, manilles)",
        "Extra weight per pick point (chain, slings, shackles)",
        "Zusatzgewicht pro Anschlagpunkt (Kette, Rundschlingen, Schäkel)",
        "Peso añadido por punto (cadena, eslingas, grilletes)",
        "Extra gewicht per ophangpunt (ketting, spanbanden, sluitingen)",
        "Peso adicional por ponto (corrente, cintas, manilhas)",
    ),
    "riggingTrussMotorWllLabel": (
        "CMU / WLL du moteur", "Hoist WLL", "WLL des Kettenzugs",
        "CMU / WLL del motor", "WLL van de takel", "CMU / WLL do motor",
    ),
    "riggingTrussDynamicFactorLabel": (
        "Coefficient dynamique", "Dynamic factor", "Dynamikfaktor",
        "Coeficiente dinámico", "Dynamische factor", "Coeficiente dinâmico",
    ),
    "riggingTrussSectionLoads": (
        "Charges", "Loads", "Lasten", "Cargas", "Lasten", "Cargas",
    ),
    "riggingTrussFixtureCountLabel": (
        "Projecteurs répartis (nombre)", "Evenly spread fixtures (count)",
        "Gleichmäßig verteilte Scheinwerfer (Anzahl)", "Proyectores repartidos (número)",
        "Gelijk verdeelde armaturen (aantal)", "Projetores distribuídos (número)",
    ),
    "riggingTrussFixtureWeightLabel": (
        "Poids d’un projecteur", "Weight per fixture", "Gewicht pro Scheinwerfer",
        "Peso por proyector", "Gewicht per armatuur", "Peso por projetor",
    ),
    "riggingTrussPointLoadsLabel": (
        "Charges ponctuelles", "Point loads", "Punktlasten",
        "Cargas puntuales", "Puntlasten", "Cargas pontuais",
    ),
    "riggingTrussAddPointLoad": (
        "Ajouter une charge", "Add a load", "Last hinzufügen",
        "Añadir una carga", "Last toevoegen", "Adicionar uma carga",
    ),
    "riggingTrussPositionLabel": (
        "Position", "Position", "Position", "Posición", "Positie", "Posição",
    ),
    "riggingTrussMassLabel": ("Poids", "Weight", "Gewicht", "Peso", "Gewicht", "Peso"),
    "riggingTrussSectionCheck": (
        "Vérification truss (optionnel)", "Truss check (optional)",
        "Traversenprüfung (optional)", "Verificación del truss (opcional)",
        "Trusscontrole (optioneel)", "Verificação da treliça (opcional)",
    ),
    "riggingTrussAllowableUdl": (
        "Répartie (UDL)", "Distributed (UDL)", "Streckenlast (UDL)",
        "Repartida (UDL)", "Verdeeld (UDL)", "Distribuída (UDL)",
    ),
    "riggingTrussAllowableCpl": (
        "Centrée (CPL)", "Centre point (CPL)", "Mittige Punktlast (CPL)",
        "Puntual centrada (CPL)", "Centrale puntlast (CPL)", "Pontual centrada (CPL)",
    ),
    "riggingTrussAllowableValueLabel": (
        "Valeur admissible fabricant ({span} m)",
        "Manufacturer allowable value ({span} m)",
        "Zulässiger Herstellerwert ({span} m)",
        "Valor admisible del fabricante ({span} m)",
        "Toelaatbare waarde fabrikant ({span} m)",
        "Valor admissível do fabricante ({span} m)",
    ),
    "riggingTrussAllowableHint": (
        "Relève dans le tableau de charge du fabricant la valeur pour la plus grande portée entre deux moteurs.",
        "Read the value for the largest span between two hoists in the manufacturer's load table.",
        "Lies den Wert für die größte Spannweite zwischen zwei Kettenzügen in der Lasttabelle des Herstellers ab.",
        "Toma de la tabla de carga del fabricante el valor para el mayor vano entre dos motores.",
        "Lees in de belastingtabel van de fabrikant de waarde af voor de grootste overspanning tussen twee takels.",
        "Consulte na tabela de carga do fabricante o valor para o maior vão entre dois motores.",
    ),
    "riggingTrussMotorResultLabel": (
        "Moteur {n} · {x} m", "Hoist {n} · {x} m", "Kettenzug {n} · {x} m",
        "Motor {n} · {x} m", "Takel {n} · {x} m", "Motor {n} · {x} m",
    ),
    "riggingTrussTotalLoadLabel": (
        "Charge totale aux moteurs", "Total load on hoists", "Gesamtlast an den Kettenzügen",
        "Carga total en los motores", "Totale last op de takels", "Carga total nos motores",
    ),
    "riggingTrussMaxMomentLabel": (
        "Moment max (à {x} m)", "Max moment (at {x} m)", "Max. Moment (bei {x} m)",
        "Momento máx. (a {x} m)", "Max. moment (op {x} m)", "Momento máx. (a {x} m)",
    ),
    "riggingTrussLargestSpanLabel": (
        "Plus grande portée", "Largest span", "Größte Spannweite",
        "Mayor vano", "Grootste overspanning", "Maior vão",
    ),
    "riggingTrussUsageLabel": (
        "Utilisation truss (moment)", "Truss utilisation (moment)",
        "Traversenauslastung (Moment)", "Uso del truss (momento)",
        "Benutting truss (moment)", "Utilização da treliça (momento)",
    ),
    "riggingTrussInvalidInput": (
        "Vérifie les valeurs : longueur, CMU, positions des moteurs (dans l’ordre, sur le truss, au moins 1 cm d’écart), charges sur le truss, coefficient dynamique ≥ 1.",
        "Check the values: length, WLL, hoist positions (in order, on the truss, at least 1 cm apart), loads on the truss, dynamic factor ≥ 1.",
        "Prüfe die Werte: Länge, WLL, Kettenzugpositionen (in Reihenfolge, auf der Traverse, mind. 1 cm Abstand), Lasten auf der Traverse, Dynamikfaktor ≥ 1.",
        "Revisa los valores: longitud, CMU, posiciones de los motores (en orden, sobre el truss, al menos 1 cm de separación), cargas sobre el truss, coeficiente dinámico ≥ 1.",
        "Controleer de waarden: lengte, WLL, takelposities (op volgorde, op de truss, minstens 1 cm uit elkaar), lasten op de truss, dynamische factor ≥ 1.",
        "Verifique os valores: comprimento, CMU, posições dos motores (em ordem, na treliça, pelo menos 1 cm de distância), cargas na treliça, coeficiente dinâmico ≥ 1.",
    ),
    "riggingTrussOkDescription": (
        "Tous les moteurs sont sous 80 % de leur CMU.",
        "All hoists are below 80 % of their WLL.",
        "Alle Kettenzüge liegen unter 80 % ihrer WLL.",
        "Todos los motores están por debajo del 80 % de su CMU.",
        "Alle takels zitten onder 80 % van hun WLL.",
        "Todos os motores estão abaixo de 80 % da sua CMU.",
    ),
    "riggingTrussWatchDescription": (
        "Au moins un moteur dépasse 80 % de sa CMU.",
        "At least one hoist is above 80 % of its WLL.",
        "Mindestens ein Kettenzug liegt über 80 % seiner WLL.",
        "Al menos un motor supera el 80 % de su CMU.",
        "Minstens één takel zit boven 80 % van zijn WLL.",
        "Pelo menos um motor ultrapassa 80 % da sua CMU.",
    ),
    "riggingTrussOverloadDescription": (
        "Au moins un moteur dépasse sa CMU.",
        "At least one hoist exceeds its WLL.",
        "Mindestens ein Kettenzug überschreitet seine WLL.",
        "Al menos un motor supera su CMU.",
        "Minstens één takel overschrijdt zijn WLL.",
        "Pelo menos um motor ultrapassa a sua CMU.",
    ),
    "riggingTrussUpliftDescription": (
        "Au moins un moteur est en soulèvement (charge négative) : porte-à-faux trop chargé, configuration instable.",
        "At least one hoist is in uplift (negative load): the cantilever is overloaded, the setup is unstable.",
        "Mindestens ein Kettenzug wird angehoben (negative Last): Auskragung überlastet, Aufbau instabil.",
        "Al menos un motor está en levantamiento (carga negativa): voladizo sobrecargado, configuración inestable.",
        "Minstens één takel wordt opgetild (negatieve last): uitkraging overbelast, opstelling instabiel.",
        "Pelo menos um motor está em levantamento (carga negativa): balanço sobrecarregado, configuração instável.",
    ),
    "riggingTrussHyperstaticWarning": (
        "3 moteurs ou plus : répartition théorique, avec des moteurs parfaitement à niveau et un truss de rigidité constante. Quelques centimètres de différence de hauteur changent fortement les charges réelles. Seule une mesure (load cells) donne la réalité.",
        "3 or more hoists: theoretical distribution, with perfectly level hoists and a truss of constant stiffness. A few centimetres of height difference strongly change the real loads. Only a measurement (load cells) shows reality.",
        "3 oder mehr Kettenzüge: theoretische Verteilung bei exakt nivellierten Kettenzügen und konstanter Traversensteifigkeit. Wenige Zentimeter Höhenunterschied verändern die realen Lasten stark. Nur eine Messung (Load Cells) zeigt die Realität.",
        "3 motores o más: reparto teórico, con motores perfectamente nivelados y un truss de rigidez constante. Unos centímetros de diferencia de altura cambian mucho las cargas reales. Solo una medición (load cells) muestra la realidad.",
        "3 takels of meer: theoretische verdeling, met perfect waterpas hangende takels en een truss met constante stijfheid. Enkele centimeters hoogteverschil veranderen de echte lasten sterk. Alleen een meting (load cells) toont de werkelijkheid.",
        "3 motores ou mais: distribuição teórica, com motores perfeitamente nivelados e uma treliça de rigidez constante. Poucos centímetros de diferença de altura alteram muito as cargas reais. Só uma medição (load cells) mostra a realidade.",
    ),
    "riggingTrussCantileverNote": (
        "Porte-à-faux présent : vérifie aussi les valeurs admissibles en porte-à-faux du fabricant.",
        "Cantilever present: also check the manufacturer's allowable cantilever values.",
        "Auskragung vorhanden: prüfe auch die zulässigen Kragwerte des Herstellers.",
        "Hay voladizo: verifica también los valores admisibles en voladizo del fabricante.",
        "Uitkraging aanwezig: controleer ook de toelaatbare uitkragingswaarden van de fabrikant.",
        "Há balanço: verifique também os valores admissíveis em balanço do fabricante.",
    ),
    "riggingTrussCheckNote": (
        "Seul le moment fléchissant est comparé. L’effort tranchant, la flèche, les assemblages et les accessoires ne sont pas vérifiés.",
        "Only the bending moment is compared. Shear, deflection, connections and accessories are not checked.",
        "Nur das Biegemoment wird verglichen. Querkraft, Durchbiegung, Verbinder und Zubehör werden nicht geprüft.",
        "Solo se compara el momento flector. El esfuerzo cortante, la flecha, las uniones y los accesorios no se verifican.",
        "Alleen het buigend moment wordt vergeleken. Dwarskracht, doorbuiging, verbindingen en accessoires worden niet gecontroleerd.",
        "Apenas o momento fletor é comparado. O esforço transverso, a flecha, as ligações e os acessórios não são verificados.",
    ),
    "riggingTrussDisclaimer": (
        "Résultats théoriques fournis à titre indicatif ; ils ne remplacent pas une note de calcul. Toute installation doit être vérifiée et validée par une personne qualifiée. L’éditeur de l’application ne peut en aucun cas être tenu responsable de l’utilisation de ces résultats.",
        "Theoretical results for guidance only; they do not replace a structural calculation. Every installation must be checked and approved by a qualified person. The app publisher cannot under any circumstances be held liable for the use of these results.",
        "Theoretische Ergebnisse nur zur Orientierung; sie ersetzen keine statische Berechnung. Jede Installation muss von einer qualifizierten Person geprüft und freigegeben werden. Der Herausgeber der App haftet in keinem Fall für die Verwendung dieser Ergebnisse.",
        "Resultados teóricos solo orientativos; no sustituyen un cálculo estructural. Toda instalación debe ser verificada y validada por una persona cualificada. El editor de la aplicación no puede en ningún caso ser considerado responsable del uso de estos resultados.",
        "Theoretische resultaten, alleen ter indicatie; ze vervangen geen sterkteberekening. Elke installatie moet door een gekwalificeerde persoon worden gecontroleerd en goedgekeurd. De uitgever van de app kan in geen geval aansprakelijk worden gesteld voor het gebruik van deze resultaten.",
        "Resultados teóricos apenas indicativos; não substituem um cálculo estrutural. Qualquer instalação deve ser verificada e validada por uma pessoa qualificada. O editor da aplicação não pode, em caso algum, ser responsabilizado pela utilização destes resultados.",
    ),
    "riggingTrussModelLabel": (
        "Modèle de truss", "Truss model", "Traversenmodell",
        "Modelo de truss", "Trussmodel", "Modelo de treliça",
    ),
    "riggingTrussModelManual": (
        "Saisie manuelle", "Manual entry", "Manuelle Eingabe",
        "Entrada manual", "Handmatige invoer", "Introdução manual",
    ),
    "riggingTrussModelUnchecked": (
        "valeurs à contrôler", "values to check", "Werte zu prüfen",
        "valores por comprobar", "waarden te controleren", "valores a verificar",
    ),
    "riggingTrussTableValueLabel": (
        "Valeur du tableau fabricant ({span} m)", "Manufacturer table value ({span} m)",
        "Wert der Herstellertabelle ({span} m)", "Valor de la tabla del fabricante ({span} m)",
        "Waarde uit de fabrikantentabel ({span} m)", "Valor da tabela do fabricante ({span} m)",
    ),
    "riggingTrussTableSource": (
        "Source : {source}", "Source: {source}", "Quelle: {source}",
        "Fuente: {source}", "Bron: {source}", "Fonte: {source}",
    ),
    "riggingTrussOutOfTable": (
        "Portée hors du tableau fabricant : vérification impossible.",
        "Span outside the manufacturer table: check not possible.",
        "Spannweite außerhalb der Herstellertabelle: keine Prüfung möglich.",
        "Vano fuera de la tabla del fabricante: verificación imposible.",
        "Overspanning buiten de fabrikantentabel: controle niet mogelijk.",
        "Vão fora da tabela do fabricante: verificação impossível.",
    ),
    "riggingTrussNetNote": (
        "Le poids propre du truss est déjà déduit des valeurs du tableau ; l’outil en tient compte.",
        "The truss self-weight is already deducted from the table values; the tool accounts for it.",
        "Das Eigengewicht der Traverse ist in den Tabellenwerten bereits abgezogen; das Tool berücksichtigt dies.",
        "El peso propio del truss ya está descontado de los valores de la tabla; la herramienta lo tiene en cuenta.",
        "Het eigen gewicht van de truss is al afgetrokken van de tabelwaarden; de tool houdt daar rekening mee.",
        "O peso próprio da treliça já está descontado dos valores da tabela; a ferramenta tem isso em conta.",
    ),
    "riggingTrussUncheckedNote": (
        "Valeurs relevées dans la fiche fabricant mais pas encore contrôlées : vérifie-les sur le document source.",
        "Values taken from the manufacturer sheet but not yet checked: verify them against the source document.",
        "Werte aus dem Herstellerdatenblatt, aber noch nicht geprüft: mit dem Quelldokument abgleichen.",
        "Valores tomados de la ficha del fabricante pero aún no comprobados: verifícalos en el documento original.",
        "Waarden uit het fabrikantenblad, maar nog niet gecontroleerd: controleer ze met het brondocument.",
        "Valores retirados da ficha do fabricante, ainda não verificados: confirme-os no documento de origem.",
    ),
    "riggingBridleHeightDiffLabel": (
        "Dénivelé du point B (+ si plus haut que A)",
        "Height of point B (+ if higher than A)",
        "Höhenunterschied Punkt B (+ wenn höher als A)",
        "Desnivel del punto B (+ si está más alto que A)",
        "Hoogteverschil punt B (+ als hoger dan A)",
        "Desnível do ponto B (+ se mais alto que A)",
    ),
    "riggingBridleHeightDiffHint": (
        "Entraxe mesuré à l’horizontale, flèche mesurée sous le point A.",
        "Span measured horizontally, drop measured below point A.",
        "Abstand horizontal gemessen, Durchhang unter Punkt A gemessen.",
        "Distancia medida en horizontal, caída medida bajo el punto A.",
        "Afstand horizontaal gemeten, doorhang gemeten onder punt A.",
        "Distância medida na horizontal, queda medida abaixo do ponto A.",
    ),
}

PLACEHOLDERS = {
    "riggingTrussTableValueLabel": ["span"],
    "riggingTrussTableSource": ["source"],
    "riggingTrussMotorPositionLabel": ["n"],
    "riggingTrussAllowableValueLabel": ["span"],
    "riggingTrussMotorResultLabel": ["n", "x"],
    "riggingTrussMaxMomentLabel": ["x"],
}

LANGS = ["fr", "en", "de", "es", "nl", "pt"]


def patch_arb(lang_index, lang):
    path = L10N / f"app_{lang}.arb"
    text = path.read_text(encoding="utf-8")
    existing = json.loads(text)
    lines = []
    for key, values in STRINGS.items():
        if key in existing:
            continue
        lines.append(f"  {json.dumps(key)}: {json.dumps(values[lang_index], ensure_ascii=False)}")
        ph = PLACEHOLDERS.get(key)
        if ph and f"@{key}" not in existing:
            inner = ",\n".join(f'      "{p}": {{}}' for p in ph)
            lines.append(f'  "@{key}": {{\n    "placeholders": {{\n{inner}\n    }}\n  }}')
    if not lines:
        print(f"  {path.name}: rien à ajouter")
        return
    stripped = text.rstrip()
    assert stripped.endswith("}"), path
    body = stripped[:-1].rstrip()
    new = body + ",\n" + ",\n".join(lines) + "\n}\n"
    json.loads(new)  # sanity check
    path.write_text(new, encoding="utf-8")
    print(f"  {path.name}: {len(lines)} entrées ajoutées")


def patch_rigging_page():
    path = ROOT / "lib/pages/rigging/rigging_page.dart"
    s = path.read_text(encoding="utf-8")
    if "RiggingTrussLoadPage" in s:
        print("  rigging_page.dart: déjà fait")
        return
    s = s.replace(
        "import 'rigging_hoist_selector_page.dart';",
        "import 'rigging_hoist_selector_page.dart';\nimport 'rigging_truss_load_page.dart';",
        1,
    )
    anchor = "onTap: () => _openOrSubscribe(context, const RiggingHoistSelectorPage()),\n              ),"
    assert anchor in s, "ancre tuile palan introuvable dans rigging_page.dart"
    tile = (
        anchor
        + "\n              RiggingToolTile(\n"
        "                icon: Icons.linear_scale,\n"
        "                title: loc.riggingToolTrussLoadTitle,\n"
        "                subtitle: loc.riggingToolTrussLoadSubtitle,\n"
        "                isPro: true,\n"
        "                locked: !_isPro,\n"
        "                onTap: () => _openOrSubscribe(context, const RiggingTrussLoadPage()),\n"
        "              ),"
    )
    s = s.replace(anchor, tile, 1)
    path.write_text(s, encoding="utf-8")
    print("  rigging_page.dart: tuile ajoutée")


def patch_registry():
    path = ROOT / "lib/pages/shared/tool_registry.dart"
    s = path.read_text(encoding="utf-8")
    if "RiggingTrussLoadPage" in s:
        print("  tool_registry.dart: déjà fait")
        return
    s = s.replace(
        "import '../rigging/rigging_multi_point_page.dart';",
        "import '../rigging/rigging_multi_point_page.dart';\nimport '../rigging/rigging_truss_load_page.dart';",
        1,
    )
    m = re.search(
        r"builder: \(_\) => const RiggingHoistSelectorPage\(\),\n      \),", s
    )
    assert m, "entrée palan introuvable dans tool_registry.dart"
    entry = (
        "\n      ToolRefEntry(\n"
        "        pageId: 'tool:rigging_truss_load',\n"
        "        sectionId: 'main',\n"
        "        categoryTitle: loc.riggingTitle,\n"
        "        toolTitle: loc.riggingToolTrussLoadTitle,\n"
        "        icon: Icons.linear_scale,\n"
        "        builder: (_) => const RiggingTrussLoadPage(),\n"
        "      ),"
    )
    s = s[: m.end()] + entry + s[m.end():]
    path.write_text(s, encoding="utf-8")
    print("  tool_registry.dart: entrée ajoutée")


def main():
    if not (ROOT / "pubspec.yaml").exists():
        sys.exit("Lance ce script depuis le projet mon_app_tech.")
    print("Traductions :")
    for idx, lang in enumerate(LANGS):
        patch_arb(idx, lang)
    print("Navigation :")
    patch_rigging_page()
    patch_registry()
    print("Terminé. Lance maintenant : flutter gen-l10n")


if __name__ == "__main__":
    main()
