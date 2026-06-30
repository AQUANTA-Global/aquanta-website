from pathlib import Path
from datetime import datetime
import re

ROOT = Path(__file__).parent
VERSION = datetime.now().strftime("%Y%m%d%H%M")

FILES = [
    ROOT / "index.html",
    ROOT / "about" / "index.html",
    ROOT / "research" / "index.html",
    ROOT / "technologies" / "index.html",
    ROOT / "applications" / "index.html",
    ROOT / "publications" / "index.html",
    ROOT / "education" / "index.html",
    ROOT / "consortium" / "index.html",
    ROOT / "events" / "index.html",
    ROOT / "news" / "index.html",
    ROOT / "contact" / "index.html",
    ROOT / "404.html",
]

patterns = [
    (r'/assets/css/aquanta-theme\.css(\?v=[^"]*)?', f'/assets/css/aquanta-theme.css?v={VERSION}'),
    (r'/assets/js/aquanta-core\.js(\?v=[^"]*)?', f'/assets/js/aquanta-core.js?v={VERSION}'),
]

for file in FILES:
    if not file.exists():
        continue

    text = file.read_text(encoding="utf-8")

    for pattern, replacement in patterns:
        text = re.sub(pattern, replacement, text)

    file.write_text(text, encoding="utf-8")

(ROOT / "build-version.txt").write_text(VERSION + "\n", encoding="utf-8")

print(f"AQUANTA build version: {VERSION}")