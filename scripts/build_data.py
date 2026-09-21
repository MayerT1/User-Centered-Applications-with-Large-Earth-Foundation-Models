#!/usr/bin/env python3
"""Convert registry/*.yaml -> docs/data/*.json for the static site.

Usage: python3 scripts/build_data.py
Requires: pyyaml (pip install pyyaml --break-system-packages)
"""
import json
import pathlib
import sys

try:
    import yaml
except ImportError:
    sys.exit("Missing dependency: pip install pyyaml --break-system-packages")

ROOT = pathlib.Path(__file__).resolve().parent.parent
REGISTRY = ROOT / "registry"
OUT = ROOT / "docs" / "data"
OUT.mkdir(parents=True, exist_ok=True)


def load(name):
    path = REGISTRY / f"{name}.yaml"
    data = yaml.safe_load(path.read_text()) or []
    return data


def write(name, data):
    out_path = OUT / f"{name}.json"
    out_path.write_text(json.dumps(data, indent=2, ensure_ascii=False) + "\n")
    print(f"wrote {out_path.relative_to(ROOT)} ({len(data)} entries)")


def main():
    write("submissions", load("submissions"))
    write("people", load("people"))
    write("resources", load("resources"))


if __name__ == "__main__":
    main()
