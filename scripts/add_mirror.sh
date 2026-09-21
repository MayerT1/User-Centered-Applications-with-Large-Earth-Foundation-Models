#!/usr/bin/env bash
# Add or update a git submodule mirror of an attendee's repo.
# Usage: scripts/add_mirror.sh <team-slug> <https-url-to-their-repo> [branch]
set -euo pipefail

SLUG="${1:?usage: add_mirror.sh <team-slug> <repo-url> [branch]}"
URL="${2:?usage: add_mirror.sh <team-slug> <repo-url> [branch]}"
BRANCH="${3:-main}"

cd "$(git rev-parse --show-toplevel)"

DEST="mirrors/${SLUG}"

if [ -e "$DEST/.git" ] || git config -f .gitmodules --get "submodule.${DEST}.url" >/dev/null 2>&1; then
  echo "Updating existing mirror ${DEST} ..."
  git submodule sync -- "$DEST"
  git submodule update --remote --init "$DEST"
else
  echo "Adding new mirror ${DEST} <- ${URL} (${BRANCH}) ..."
  git submodule add -b "$BRANCH" "$URL" "$DEST"
fi

echo "Done. Review with 'git status', then commit:"
echo "  git add .gitmodules ${DEST}"
echo "  git commit -m \"mirror: add/update ${SLUG}\""
