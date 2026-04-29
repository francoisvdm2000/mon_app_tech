import json
import re
import time
from pathlib import Path
from deep_translator import GoogleTranslator

TARGETS = {
    "app_en.arb": "en",
    "app_de.arb": "de",
    "app_es.arb": "es",
    "app_nl.arb": "nl",
    "app_pt.arb": "pt",
}

SOURCE_FILE = Path("lib/l10n/app_fr.arb")
OUTPUT_DIR = Path("lib/l10n")

BATCH_SIZE = 5
SLEEP = 0.5

# 🔥 mots métier à NE PAS traduire
PROTECTED_WORDS = [
    "DMX",
    "Art-Net",
    "sACN",
    "Lux",
    "Lumen",
    "Candela",
    "WLL",
    "CMU",
    "Rigging",
    "Drop",
    "Span",
    "Load",
    "Leg",
    "Offset",
]

PLACEHOLDER_PATTERN = re.compile(r"\{[a-zA-Z_][a-zA-Z0-9_]*\}")


def protect(text):
    matches = []

    # protéger variables Flutter {value}
    ph = PLACEHOLDER_PATTERN.findall(text)
    for i, m in enumerate(ph):
        text = text.replace(m, f"__VAR_{i}__", 1)
        matches.append((f"__VAR_{i}__", m))

    # protéger mots métier
    for i, word in enumerate(PROTECTED_WORDS):
        if word in text:
            key = f"__TECH_{i}__"
            text = text.replace(word, key)
            matches.append((key, word))

    return text, matches


def restore(text, matches):
    for key, value in matches:
        text = text.replace(key, value)
    return text


def main():
    with open(SOURCE_FILE, "r", encoding="utf-8") as f:
        source = json.load(f)

    for file, lang in TARGETS.items():
        path = OUTPUT_DIR / file

        if path.exists():
            with open(path, "r", encoding="utf-8") as f:
                output = json.load(f)
        else:
            output = {}

        output["@@locale"] = lang

        print(f"\n=== {file} ({lang}) ===")

        items = []

        for k, v in source.items():
            if k.startswith("@"):
                output[k] = v
                continue

            if not isinstance(v, str):
                output[k] = v
                continue

            # 🔥 déjà traduit → on skip
            if k in output and output[k].strip():
                continue

            p, matches = protect(v)
            items.append((k, p, matches))

        for i in range(0, len(items), BATCH_SIZE):
            batch = items[i:i+BATCH_SIZE]

            texts = [b[1] for b in batch]

            try:
                translated = GoogleTranslator(source='fr', target=lang).translate_batch(texts)

                for (k, _, matches), t in zip(batch, translated):
                    output[k] = restore(t, matches)
                    print(f"[OK] {k}")

            except Exception as e:
                print(f"[ERR] batch {i} → {e}")

            time.sleep(SLEEP)

        with open(path, "w", encoding="utf-8") as f:
            json.dump(output, f, ensure_ascii=False, indent=2)

    print("\nDONE")


if __name__ == "__main__":
    main()