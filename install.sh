#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGINS_SOURCE="$SCRIPT_DIR/plugins"
PLUGINS_DEST="$HOME/.claude/plugins"

mkdir -p "$PLUGINS_DEST"

count=0
for plugin_dir in "$PLUGINS_SOURCE"/*/; do
  plugin_name=$(basename "$plugin_dir")
  dest="$PLUGINS_DEST/$plugin_name"
  echo "Installing $plugin_name → $dest"
  rm -rf "$dest"
  cp -r "$plugin_dir" "$dest"
  count=$((count + 1))
done

echo ""
echo "Done. $count skill(s) installed to $PLUGINS_DEST"
echo "Restart Claude Code to load new skills."
