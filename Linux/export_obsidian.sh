#!/usr/bin/env bash

VAULT="$HOME/Documents/The Vault Of Chaos"
EXPORT="$HOME/Backups/obsidian/exports"

mkdir -p "$EXPORT"

tar -czf "$EXPORT/obsidian-$(date +%F).tar.gz" -C "$VAULT" .

