#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

source "$SCRIPT_DIR/config.sh"
source "$SCRIPT_DIR/version.sh"

cd "$PROJECT_ROOT"

echo "===================================="
echo "AQUANTA Build"
echo "Version: $AQUANTA_VERSION"
echo "===================================="

find . -path "./.git" -prune -o -name "*.html" -type f -print |
while IFS= read -r file; do
sed -i \
  -e "s|/assets/css/aquanta-theme.css[^\"']*|/assets/css/aquanta-theme.css?v=${AQUANTA_VERSION}|g" \
  -e "s|/assets/js/aquanta-core.js[^\"']*|/assets/js/aquanta-core.js?v=${AQUANTA_VERSION}|g" \
  "$file"
  
done

printf "%s\n" "$AQUANTA_VERSION" > "$BUILD_VERSION_FILE"

"$SCRIPT_DIR/sitemap.sh"
"$SCRIPT_DIR/check.sh"

echo "Build complete: $AQUANTA_VERSION"
