#!/usr/bin/env python3

from datetime import datetime
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
OUT = ROOT / "data" / "version.generated.json"

version = datetime.now().strftime("2.0.0-%Y%m%d%H%M%S")

OUT.write_text(
    '{\n'
    f'  "version": "{version}"\n'
    '}\n',
    encoding="utf-8"
)

print(f"VERSION: {version}")