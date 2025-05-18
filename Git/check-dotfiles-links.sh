#!/usr/bin/env bash

DOTFILES_DIR="$HOME/Projects/dotfiles"

echo "🔎 Checking symlinks under $HOME that point into $DOTFILES_DIR..."
echo

find "$HOME" -type l | while read -r link; do
  target=$(readlink -f "$link")
  if [[ "$target" == "$DOTFILES_DIR"* ]]; then
    if [ -e "$link" ]; then
      echo "✅ $link → $target"
    else
      echo "❌ $link → $target (broken)"
    fi
  else
    echo "🟡 $link does NOT point into dotfiles"
  fi
done

