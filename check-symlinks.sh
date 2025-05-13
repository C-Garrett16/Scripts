#!/usr/bin/env bash

DOTFILES_DIR="$HOME/Projects/dotfiles"  # Change this if needed

echo "🔗 Scanning for symlinks in $DOTFILES_DIR..."

find "$DOTFILES_DIR" -type l | while read -r link; do
  if [ ! -e "$link" ]; then
    echo "❌ Broken symlink: $link → $(readlink "$link")"
  else
    echo "✅ Valid symlink:  $link → $(readlink "$link")"
  fi
done
