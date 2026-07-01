#!/usr/bin/env python3
from pathlib import Path
import json
import html

ROOT = Path(".")
HEAD_TEMPLATE = ROOT / "components" / "head.html"
PAGES_JSON = ROOT / "data" / "pages.json"

PLACEHOLDER = "<!-- BUILD:HEAD -->"

def page_url_from_file(path: Path) -> str:
    rel = path.relative_to(ROOT).as_posix()

    if rel == "index.html":
        return "/"

    if rel.endswith("/index.html"):
        return "/" + rel[:-len("index.html")]

    return "/" + rel

def load_text(path: Path) -> str:
    return path.read_text(encoding="utf-8")

def save_text(path: Path, text: str) -> None:
    path.write_text(text, encoding="utf-8", newline="\n")

def render_head(template: str, meta: dict) -> str:
    title = html.escape(meta["title"], quote=True)
    description = html.escape(meta["description"], quote=True)
    canonical = html.escape(meta["canonical"], quote=True)

    return (
        template
        .replace("{{TITLE}}", title)
        .replace("{{DESCRIPTION}}", description)
        .replace("{{CANONICAL}}", canonical)
    )

def main() -> None:
    if not HEAD_TEMPLATE.exists():
        raise FileNotFoundError("Missing components/head.html")

    if not PAGES_JSON.exists():
        raise FileNotFoundError("Missing data/pages.json")

    template = load_text(HEAD_TEMPLATE)
    pages = json.loads(load_text(PAGES_JSON))

    html_files = sorted(ROOT.glob("**/index.html"))

    updated = 0
    skipped = 0

    for file in html_files:
        if ".git" in file.parts:
            continue

        url = page_url_from_file(file)

        if url not in pages:
            print(f"SKIP: {file} — no entry in data/pages.json for {url}")
            skipped += 1
            continue

        source = load_text(file)

        if PLACEHOLDER not in source:
            print(f"SKIP: {file} — no {PLACEHOLDER}")
            skipped += 1
            continue

        head = render_head(template, pages[url])
        output = source.replace(PLACEHOLDER, head)

        save_text(file, output)
        print(f"HEAD: {file} ← {url}")
        updated += 1

    print(f"HEAD generation complete: {updated} updated, {skipped} skipped")

if __name__ == "__main__":
    main()