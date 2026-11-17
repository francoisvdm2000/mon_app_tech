#!/usr/bin/env python3
"""Régénère les données de la bibliothèque rigging depuis le Google Sheet
« ShowTech Tools – Bibliothèque Truss ».

1. Dans Google Sheets : Fichier > Télécharger > CSV, sur les onglets
   « Modèles », « Charges » et « Moteurs ».
2. Depuis la racine du projet :
   python3 tools/export_truss_library.py Modeles.csv Charges.csv [Moteurs.csv]

Écrit lib/pages/rigging/engine/truss_library_data.dart et, si le CSV
Moteurs est donné, lib/pages/rigging/engine/hoist_library_data.dart.

Les lignes dont le statut est « Validé » sont marquées validated: true.
Les builds release n'embarquent que celles-là.
"""
import csv
import pathlib
import re
import sys

ENGINE = pathlib.Path(__file__).resolve().parent.parent / "lib/pages/rigging/engine"
OUT_TRUSS = ENGINE / "truss_library_data.dart"
OUT_HOIST = ENGINE / "hoist_library_data.dart"

PROFILES = {
    "triangle": "triangle", "triangle pliable": "triangle",
    "carré": "square", "carre": "square", "carré (spirale)": "square",
    "échelle": "ladder", "echelle": "ladder",
    "rectangle": "rectangle",
    "pre-rig": "preRig", "prerig": "preRig",
}


def num(v):
    v = (v or "").strip().replace(" ", "").replace(" ", "").replace(" ", "")
    if not v:
        return None
    return float(v.replace(",", "."))


def dart_str(s):
    return "'" + s.replace("\\", "\\\\").replace("'", "\\'").replace("$", "\\$") + "'"


def read(path):
    with open(path, encoding="utf-8-sig", newline="") as f:
        return list(csv.DictReader(f))


def self_weight_is_net(text, mid):
    """True seulement si le tableau fabricant a déjà déduit le poids propre.

    « Non déduit » (choix de sécurité) doit rester False : on ne cherche donc
    pas simplement le mot « déduit ». Toute autre valeur arrête l'export.
    """
    t = (text or "").strip().lower()
    if t.startswith("non déduit") or t.startswith("non deduit") or t.startswith("non précisé"):
        return False
    if t.startswith("déjà déduit") or t.startswith("deja déduit") or t.startswith("deja deduit"):
        return True
    sys.exit(f"Poids propre non reconnu pour {mid} : « {text} »")


def export_truss(models_csv, charges_csv):
    models = read(models_csv)
    charges = read(charges_csv)
    out = [
        "// GENERATED from the Google Sheet « ShowTech Tools – Bibliothèque Truss »",
        "// (tabs Modèles + Charges). Do not edit by hand: update the sheet, then",
        "// regenerate with tools/export_truss_library.py.",
        "",
        "import 'truss_library.dart';",
        "",
        "const List<TrussModel> kTrussLibrary = [",
    ]
    for m in models:
        mid = (m.get("ID") or "").strip()
        if not mid:
            continue
        rows = sorted(
            (r for r in charges if (r.get("Modèle (ID)") or "").strip() == mid),
            key=lambda r: num(r["Portée (m)"]),
        )
        if not rows:
            print(f"! {mid} : aucune ligne dans Charges, ignoré")
            continue
        profile = PROFILES.get((m.get("Profil") or "").strip().lower())
        if profile is None:
            sys.exit(f"Profil inconnu pour {mid} : {m.get('Profil')}")
        weight = num(m.get("Poids (kg/m)"))
        if weight is None:
            sys.exit(f"Poids manquant pour {mid}")
        weight = round(weight, 2)
        net = self_weight_is_net(m.get("Poids propre"), mid)
        validated = (m.get("Statut") or "").strip() == "Validé"
        doc = (m.get('Document source') or '').strip()
        # Notes internes à la feuille (« PDF fourni par … ») : pas dans l'app.
        doc = re.sub(r"\s*\((?:PDFs?|fiches?)[^)]*fourni[^)]*\)", "", doc).strip()
        source = f"{m['Fabricant'].strip()}, {doc}"
        out += [
            "  TrussModel(",
            f"    id: {dart_str(mid)},",
            f"    manufacturer: {dart_str(m['Fabricant'].strip())},",
            f"    model: {dart_str(m['Modèle'].strip())},",
            f"    profile: TrussProfile.{profile},",
            f"    weightKgPerM: {weight},",
            f"    allowableIsNetOfSelfWeight: {'true' if net else 'false'},",
            f"    validated: {'true' if validated else 'false'},",
            f"    source: {dart_str(source)},",
            f"    sourceUrl: {dart_str((m.get('Lien source') or '').strip())},",
            "    rows: [",
        ]
        for r in rows:
            span, udl, cpl = num(r["Portée (m)"]), num(r["UDL admissible (kg/m)"]), num(r["CPL admissible (kg)"])
            if None in (span, udl, cpl):
                sys.exit(f"Ligne incomplète pour {mid} : {r}")
            out.append(f"      TrussLoadRow(spanM: {span}, udlKgPerM: {udl}, cplKg: {cpl}),")
        out += ["    ],", "  ),"]
        print(f"  {mid} : {len(rows)} portées, poids propre {'déduit' if net else 'non déduit'}, "
              f"{'validé' if validated else 'à contrôler'}")
    out.append("];")
    OUT_TRUSS.write_text("\n".join(out) + "\n", encoding="utf-8")
    print(f"Écrit : {OUT_TRUSS}")


def export_hoists(hoists_csv):
    hoists = read(hoists_csv)
    out = [
        "// GENERATED from the Google Sheet « ShowTech Tools – Bibliothèque Truss »",
        "// (tab Moteurs). Do not edit by hand: update the sheet, then",
        "// regenerate with tools/export_truss_library.py.",
        "",
        "import 'hoist_library.dart';",
        "",
        "const List<HoistModel> kHoistLibrary = [",
    ]
    for h in hoists:
        hid = (h.get("ID") or "").strip()
        if not hid:
            continue
        wll = num(h.get("CMU (kg)"))
        if wll is None:
            sys.exit(f"CMU manquante pour {hid}")
        speed = num(h.get("Vitesse (m/min)"))
        weight = num(h.get("Poids sans chaîne (kg)"))
        chain = num(h.get("Poids chaîne (kg/m)"))
        validated = (h.get("Statut") or "").strip() == "Validé"
        out += [
            "  HoistModel(",
            f"    id: {dart_str(hid)},",
            f"    manufacturer: {dart_str(h['Fabricant'].strip())},",
            f"    model: {dart_str(h['Modèle'].strip())},",
            f"    wllKg: {wll},",
            f"    hoistClass: {dart_str((h.get('Classe') or '').strip())},",
            f"    speedMPerMin: {speed if speed is not None else 'null'},",
            f"    weightKg: {weight if weight is not None else 'null'},",
            f"    chainKgPerM: {chain if chain is not None else 'null'},",
            f"    validated: {'true' if validated else 'false'},",
            f"    sourceUrl: {dart_str((h.get('Lien source') or '').strip())},",
            "  ),",
        ]
        print(f"  {hid} : {wll:g} kg, {'validé' if validated else 'à contrôler'}")
    out.append("];")
    OUT_HOIST.write_text("\n".join(out) + "\n", encoding="utf-8")
    print(f"Écrit : {OUT_HOIST}")


if __name__ == "__main__":
    if len(sys.argv) not in (3, 4):
        sys.exit(__doc__)
    export_truss(sys.argv[1], sys.argv[2])
    if len(sys.argv) == 4:
        export_hoists(sys.argv[3])
