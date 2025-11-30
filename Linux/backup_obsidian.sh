#!/usr/bin/env bash

VAULT="$HOME/Documents/The Vault Of Chaos"
BACKUP="$HOME/Backups/obsidian"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M")

mkdir -p "$BACKUP"
rsync -a --delete "$VAULT/" "$BACKUP/latest/"
cp -al "$BACKUP/latest" "$BACKUP/$TIMESTAMP"

# Git snapshot
cd "$VAULT" || exit 1
git add .
git commit -m "Auto snapshot $TIMESTAMP"
git push 2>/dev/null

