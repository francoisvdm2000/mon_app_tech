#!/usr/bin/env python3
import json
from pathlib import Path

arb_path = Path("lib/l10n/app_fr.arb")
fragment_path = Path("app_fr_missing_keys_full.json")

if not arb_path.exists():
    raise SystemExit(f"Fichier introuvable: {arb_path}")

if not fragment_path.exists():
    raise SystemExit(f"Fichier introuvable: {fragment_path}. Place-le à la racine du projet.")

data = json.loads(arb_path.read_text(encoding="utf-8"))
fragment = json.loads(fragment_path.read_text(encoding="utf-8"))

data.update(fragment)

arb_path.write_text(
    json.dumps(data, ensure_ascii=False, indent=2) + "\n",
    encoding="utf-8",
)

print(f"OK: {len(fragment)} clés fusionnées dans {arb_path}")
