#!/usr/bin/env python3

from pathlib import Path
import json
from datetime import datetime, timezone

ROOT = Path(__file__).resolve().parent.parent
OUTPUT = ROOT / "data" / "routes.generated.json"

EXCLUDE_DIRS = {
    ".git",
    "assets",
    "components",
    "data",
    "tools",
    "node_modules",
    "__pycache__"
}

def label_from_path(path: str) -> str:
    if path == "/":
        return "AQUANTA"

    parts = [p for p in path.strip("/").split("/") if p]
    labels = []

    for part in parts:
        label = part.replace("-", " ").replace("_", " ").title()
        labels.append(label)

    return "AQUANTA / " + " / ".join(labels)

def route_from_index(index_file: Path) -> str:
    rel = index_file.relative_to(ROOT)

    if rel.as_posix() == "index.html":
        return "/"

    return "/" + rel.parent.as_posix().strip("/") + "/"

def is_excluded(index_file: Path) -> bool:
    rel_parts = index_file.relative_to(ROOT).parts
    return any(part in EXCLUDE_DIRS for part in rel_parts)

def main() -> None:
    routes = {}

    for index_file in sorted(ROOT.glob("**/index.html")):
        if is_excluded(index_file):
            continue

        route = route_from_index(index_file)

        routes[route] = {
            "label": label_from_path(route),
            "file": index_file.relative_to(ROOT).as_posix()
        }

    data = {
        "generatedAt": datetime.now(timezone.utc).isoformat(),
        **routes
    }

    OUTPUT.parent.mkdir(parents=True, exist_ok=True)

    with open(OUTPUT, "w", encoding="utf-8", newline="\n") as f:
        json.dump(data, f, ensure_ascii=False, indent=2)

    print(f"ROUTES: generated {OUTPUT.relative_to(ROOT)}")
    print(f"ROUTES: {len(routes)} routes")

if __name__ == "__main__":
    main()