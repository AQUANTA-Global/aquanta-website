#!/usr/bin/env python3
from pathlib import Path
import json
import html
import re
import sys

ROOT = Path(__file__).resolve().parent.parent
SITE_JSON = ROOT / "data" / "site.json"
HEAD_TEMPLATE = ROOT / "components" / "head.html"

if not SITE_JSON.exists():
    print("ERROR: data/site.json not found.")
    sys.exit(1)

with open(SITE_JSON, encoding="utf-8") as f:
    data = json.load(f)

site = data["site"]
assets = data.get("assets", {})
pages = data.get("pages", [])

page_map = {page["path"]: page for page in pages}

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

def render_head(page: dict, site: dict, assets: dict) -> str:
    domain = site["domain"].rstrip("/")
    path = page["path"]

    title = html.escape(page.get("title", site["defaultTitle"]), quote=True)

    description = html.escape(
        page.get("description", site["defaultDescription"]),
        quote=True
    )

    canonical_value = page.get("canonical")

    if not canonical_value:
        if path == "/":
            canonical_value = domain + "/"
        else:
            canonical_value = domain + path

    canonical = html.escape(canonical_value, quote=True)

    favicon = html.escape(site.get("favicon", "/assets/icons/logo.png"), quote=True)

    css_links = "\n".join(
        f'<link rel="stylesheet" href="{html.escape(css, quote=True)}">'
        for css in assets.get("css", [])
    )

    js_links = "\n".join(
        f'<script defer src="{html.escape(js, quote=True)}"></script>'
        for js in assets.get("javascript", [])
    )

    return f'''<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>{title}</title>
<meta name="description" content="{description}">
<link rel="canonical" href="{canonical}">

<link rel="icon" type="image/png" href="{favicon}">

{css_links}
{js_links}'''

def main() -> None:
    if not HEAD_TEMPLATE.exists():
        raise FileNotFoundError("Missing components/head.html")

    if not SITE_JSON.exists():
        raise FileNotFoundError("Missing data/site.json")

    template = load_text(HEAD_TEMPLATE)
    data = json.loads(load_text(SITE_JSON))

    site = data["site"]
    assets = data.get("assets", {})
    pages_list = data.get("pages", [])

    pages = {page["path"]: page for page in pages_list}

    html_files = sorted(ROOT.glob("**/index.html"))

    updated = 0
    skipped = 0

    for file in html_files:
        if ".git" in file.parts:
            continue

        url = page_url_from_file(file)

        if url not in pages:
            print(f"SKIP: {file} — no entry in data/site.json for {url}")
            skipped += 1
            continue

        source = load_text(file)

        if PLACEHOLDER not in source:
            print(f"SKIP: {file} — no {PLACEHOLDER}")
            skipped += 1
            continue

        head = render_head(template, pages[url], site, assets)
        output = source.replace(PLACEHOLDER, head)

        save_text(file, output)
        print(f"HEAD: {file} ← {url}")
        updated += 1

    print(f"HEAD generation complete: {updated} updated, {skipped} skipped")
    
if __name__ == "__main__":
    main()