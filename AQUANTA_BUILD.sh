#!/usr/bin/env bash
set -euo pipefail

COMMAND="${1:-build}"
shift || true

case "$COMMAND" in
  build) ./tools/build.sh ;;
  check) ./tools/check.sh ;;
  sitemap) ./tools/sitemap.sh ;;
  clean) ./tools/clean.sh ;;
  publish) ./tools/publish.sh "${1:-Update AQUANTA production site}" ;;
  *)
    echo "Unknown command: $COMMAND"
    echo "Available: build | check | sitemap | clean | publish"
    exit 1
    ;;
esac
