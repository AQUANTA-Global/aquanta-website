#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

RUN_HEAD=false
RUN_SITEMAP=false
RUN_CHECK=false
RUN_ASSETS=false
RUN_VERSION=false

show_help() {
cat << EOF
AQUANTA Build System

Usage:
  ./AQUANTA_BUILD.sh build [options]

Options:
  --head        Generate <head> sections
  --sitemap     Generate sitemap.xml
  --check       Run production checks
  --assets      Check/create asset directories
  --version     Show version information
  --all         Run all modules
  --help        Show this help

Examples:
  ./AQUANTA_BUILD.sh build
  ./AQUANTA_BUILD.sh build --check
  ./AQUANTA_BUILD.sh build --head --sitemap --check
  ./AQUANTA_BUILD.sh build --all
EOF
}

run_head() {
  echo "== HEAD =="
  python ./tools/head.py
}

run_sitemap() {
  echo "== SITEMAP =="
  ./tools/sitemap.sh
}

run_check() {
  echo "== CHECK =="
  ./tools/check.sh
}

run_assets() {
  echo "== ASSETS =="
  mkdir -p assets/css assets/js assets/images assets/videos assets/icons assets/fonts
  echo "Asset directories verified."
}

run_version() {
  echo "== VERSION =="
  ./tools/version.sh
}

if [ "$#" -eq 0 ]; then
  echo "AQUANTA quick build: no modules selected."
  echo "Use --help to see options."
  exit 0
fi

for arg in "$@"; do
  case "$arg" in
    --head)
      RUN_HEAD=true
      ;;
    --sitemap)
      RUN_SITEMAP=true
      ;;
    --check)
      RUN_CHECK=true
      ;;
    --assets)
      RUN_ASSETS=true
      ;;
    --version)
      RUN_VERSION=true
      ;;
    --all)
      RUN_HEAD=true
      RUN_SITEMAP=true
      RUN_CHECK=true
      RUN_ASSETS=true
      RUN_VERSION=true
      ;;
    --help|-h)
      show_help
      exit 0
      ;;
    *)
      echo "Unknown option: $arg"
      echo
      show_help
      exit 1
      ;;
  esac
done

echo
echo "======================================"
echo "AQUANTA Build"
echo "======================================"

$RUN_VERSION && run_version
$RUN_ASSETS && run_assets
$RUN_HEAD && run_head
$RUN_SITEMAP && run_sitemap
$RUN_CHECK && run_check

echo
echo "Build completed."