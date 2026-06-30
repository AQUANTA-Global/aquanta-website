#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

source "$SCRIPT_DIR/config.sh"
cd "$PROJECT_ROOT"

errors=0
ok() { echo "✔ $1"; }
fail() { echo "✘ $1"; errors=$((errors+1)); }

echo "===================================="
echo "AQUANTA Production Check"
echo "===================================="

required_files=(
  "index.html"
  "$CNAME_FILE"
  "$ROBOTS_FILE"
  "$SITEMAP_FILE"
  "assets/css/aquanta-theme.css"
  "assets/js/aquanta-core.js"
  "components/header.html"
  "components/footer.html"
  "data/content.json"
  "data/navigation.json"
)

for f in "${required_files[@]}"; do
  if [[ -f "$f" ]]; then ok "$f"; else fail "Missing: $f"; fi
done

for page in "${PUBLIC_PAGES[@]}"; do
  if [[ -z "$page" ]]; then
    file="index.html"
    label="/"
  else
    file="$page/index.html"
    label="/$page/"
  fi

  if [[ -f "$file" ]]; then
    ok "$label exists"
    grep -q '<meta name="description"' "$file" || fail "$file missing meta description"
    grep -q 'rel="canonical"' "$file" || fail "$file missing canonical link"
    grep -q 'aquanta-theme.css?v=' "$file" || fail "$file missing versioned CSS"
    grep -q 'aquanta-core.js?v=' "$file" || fail "$file missing versioned JS"
  else
    fail "Missing page: $file"
  fi
done

if [[ -f "$CNAME_FILE" ]]; then
  cname="$(tr -d '\r\n ' < "$CNAME_FILE")"
  [[ "$cname" == "aquanta.co.jp" ]] && ok "CNAME aquanta.co.jp" || fail "CNAME must be aquanta.co.jp"
fi

echo "===================================="
if [[ "$errors" -eq 0 ]]; then
  echo "Result: Production READY"
else
  echo "Result: $errors problem(s) found"
  exit 1
fi
