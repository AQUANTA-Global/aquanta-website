#!/usr/bin/env bash
set -euo pipefail

PROJECT_NAME="AQUANTA"
SITE_DOMAIN="https://aquanta.co.jp"
GIT_BRANCH="main"

PUBLIC_PAGES=(
  ""
  "about"
  "research"
  "technologies"
  "applications"
  "publications"
  "education"
  "consortium"
  "events"
  "news"
  "contact"
)

CSS_FILE="/assets/css/aquanta-theme.css"
JS_FILE="/assets/js/aquanta-core.js"

BUILD_VERSION_FILE="build-version.txt"
SITEMAP_FILE="sitemap.xml"
ROBOTS_FILE="robots.txt"
CNAME_FILE="CNAME"

ENABLE_CLOUDFLARE_PURGE=0
