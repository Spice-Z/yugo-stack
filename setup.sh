#!/usr/bin/env bash
# Copy yugo-stack skills into the Cursor user Agent Store so Cloud Agents
# can load them. ~/.cursor/skills symlinks are not synced to cloud.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$REPO_DIR/skills"
SKILLS=(handbook how intern japa radar restate so up-yugo)

user_store_skills() {
  local candidates=(
    "$HOME/Library/Application Support/Cursor/AgentStores/cursor_agent_stores"
    "$HOME/.config/Cursor/AgentStores/cursor_agent_stores"
  )
  local base store
  for base in "${candidates[@]}"; do
    [ -d "$base" ] || continue
    store="$(find "$base" -maxdepth 1 -type d -name 't*-u*' 2>/dev/null | head -n 1)"
    if [ -n "$store" ]; then
      echo "$store/files/skills"
      return 0
    fi
  done
  return 1
}

copy_skill() {
  local src="$1"
  local dest="$2"
  mkdir -p "$dest"
  rsync -a --delete --copy-links "$src/" "$dest/"
  find "$dest" -type d -exec chmod 700 {} \;
  find "$dest" -type f -exec chmod 600 {} \;
}

echo ""
echo "▶ Copying yugo-stack skills → Cursor user Agent Store (cloud)..."

STORE_SKILLS="$(user_store_skills)" || {
  echo "  [warn] no Cursor user Agent Store found. Sign in to Cursor once, then re-run."
  echo "         Local plugin skills still work from $SKILLS_DIR"
  echo ""
  exit 0
}

mkdir -p "$STORE_SKILLS"

for skill in "${SKILLS[@]}"; do
  src="$SKILLS_DIR/$skill"
  dest="$STORE_SKILLS/$skill"
  if [ ! -d "$src" ]; then
    echo "  [warn] missing skill folder: $src"
    continue
  fi
  copy_skill "$src" "$dest"
  echo "  [ok]   $dest"
done

echo ""
echo "✅ Cloud-visible copies are in: $STORE_SKILLS"
echo ""
