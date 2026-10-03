import argparse
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

PROTECTED_WORDS = [
    "DMX",
    "Art-Net",
    "sACN",
    "MA-Net",
    "MA-Net2",
    "MA-Net3",
    "grandMA",
    "grandMA2",
    "grandMA3",
    "NDI",
    "PoE",
    "GigaCore",
    "Luminex",
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
    "GDTF",
    "MVR",
    "PDF",
    "PNG",
]

PLACEHOLDER_PATTERN = re.compile(r"\{[a-zA-Z_][a-zA-Z0-9_]*\}")

# Matches ICU plural/select expressions like {count, plural, one{} other{s}}
# Must be protected before simple placeholders to avoid translating variable
# names and ICU keywords (one, other, zero, few, many, two).
ICU_PLURAL_PATTERN = re.compile(
    r"\{[a-zA-Z_]\w*\s*,\s*(?:plural|select|selectordinal)\s*,[^{}]*(?:\{[^{}]*\}[^{}]*)*\}"
)


def protect(text):
    matches = []

    # 1. ICU plural/select expressions (protect first — they contain nested {})
    for i, m in enumerate(ICU_PLURAL_PATTERN.findall(text)):
        key = f"__ICU_{i}__"
        text = text.replace(m, key, 1)
        matches.append((key, m))

    # 2. Simple {varName} placeholders
    for i, m in enumerate(PLACEHOLDER_PATTERN.findall(text)):
        key = f"__VAR_{i}__"
        text = text.replace(m, key, 1)
        matches.append((key, m))

    # 3. Technical words
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


def should_translate(
    key,
    source_value,
    output,
    retranslate_identical=False,
    force=False,
    force_prefixes=None,
):
    # --force : retraduit tout sans exception
    if force:
        return isinstance(source_value, str)

    # --keys prefix1,prefix2 : retraduit les clés dont le nom commence par un des préfixes
    if force_prefixes and any(key.startswith(p) for p in force_prefixes):
        return isinstance(source_value, str)

    if key not in output:
        return True

    current = output[key]

    if not isinstance(current, str):
        return False

    if not current.strip():
        return True

    if retranslate_identical:
        if current.strip() == source_value.strip():
            return True

    return False


def main():
    parser = argparse.ArgumentParser()

    parser.add_argument(
        "--source",
        default="fr",
    )

    parser.add_argument(
        "--retranslate-identical",
        action="store_true",
        help="Retranslate values that are identical to the source language",
    )

    parser.add_argument(
        "--force",
        action="store_true",
        help="Force retranslation of ALL keys (overwrites existing translations)",
    )

    parser.add_argument(
        "--keys",
        default="",
        help="Comma-separated key prefixes to force-retranslate (e.g. help,manet,luminex)",
    )

    parser.add_argument(
        "--lang",
        default="",
        help="Comma-separated target languages to process (e.g. de,es). Default: all.",
    )

    args = parser.parse_args()
    force_prefixes = [p.strip() for p in args.keys.split(",") if p.strip()]
    lang_filter = [l.strip() for l in args.lang.split(",") if l.strip()]

    with open(SOURCE_FILE, "r", encoding="utf-8") as f:
        source = json.load(f)

    for file, lang in TARGETS.items():
        if lang_filter and lang not in lang_filter:
            continue
        path = OUTPUT_DIR / file

        if path.exists():
            with open(path, "r", encoding="utf-8") as f:
                output = json.load(f)
        else:
            output = {}

        print(f"\n=== {file} ({lang}) ===")

        items = []

        for k, v in source.items():
            if k == "@@locale":
                output["@@locale"] = lang
                continue

            if k.startswith("@"):
                output[k] = v
                continue

            if not isinstance(v, str):
                output[k] = v
                continue

            if not should_translate(
                k,
                v,
                output,
                retranslate_identical=args.retranslate_identical,
                force=args.force,
                force_prefixes=force_prefixes,
            ):
                continue

            p, matches = protect(v)
            items.append((k, p, matches))

        output["@@locale"] = lang

        for i in range(0, len(items), BATCH_SIZE):
            batch = items[i:i + BATCH_SIZE]
            texts = [b[1] for b in batch]

            try:
                translated = GoogleTranslator(
                    source=args.source,
                    target=lang,
                ).translate_batch(texts)

                for (k, _, matches), t in zip(batch, translated):
                    output[k] = restore(t, matches)
                    print(f"[OK] {k}")

            except Exception as e:
                print(f"[ERR] batch {i} → {e}")

            time.sleep(SLEEP)

        output["@@locale"] = lang

        with open(path, "w", encoding="utf-8") as f:
            json.dump(
                output,
                f,
                ensure_ascii=False,
                indent=2,
            )

    print("\nDONE")


if __name__ == "__main__":
    main()