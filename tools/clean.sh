#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

cd "$PROJECT_ROOT"

echo "Cleaning temporary files..."

find . -path "./.git" -prune -o   \( -name ".DS_Store" -o -name "Thumbs.db" -o -name "*~" -o -name "*.tmp" -o -name "*.bak" \)   -type f -print -delete

echo "Clean complete."
