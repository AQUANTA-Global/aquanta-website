#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

source "$SCRIPT_DIR/config.sh"
cd "$PROJECT_ROOT"

cat > "$SITEMAP_FILE" <<XML
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
XML

for page in "${PUBLIC_PAGES[@]}"; do
  if [[ -z "$page" ]]; then
    loc="${SITE_DOMAIN}/"
    priority="1.0"
  else
    loc="${SITE_DOMAIN}/${page}/"
    case "$page" in
      about|research|technologies|applications) priority="0.9" ;;
      contact) priority="0.7" ;;
      *) priority="0.8" ;;
    esac
  fi

  cat >> "$SITEMAP_FILE" <<XML
  <url>
    <loc>${loc}</loc>
    <priority>${priority}</priority>
  </url>
XML
done

cat >> "$SITEMAP_FILE" <<XML
</urlset>
XML

echo "Updated $SITEMAP_FILE"
