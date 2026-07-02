#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

source "$SCRIPT_DIR/config.sh"
cd "$PROJECT_ROOT"

COMMIT_MESSAGE="${1:-Update AQUANTA production site}"

"$SCRIPT_DIR/build.sh"

echo "===================================="
echo "Git status"
echo "===================================="
git status --short

if [[ -z "$(git status --porcelain)" ]]; then
  echo "Nothing to commit."
  exit 0
fi

git add -A
git commit -m "$COMMIT_MESSAGE"
git push origin "$GIT_BRANCH"

echo "Published to origin/$GIT_BRANCH"
echo "Check: $SITE_DOMAIN"
