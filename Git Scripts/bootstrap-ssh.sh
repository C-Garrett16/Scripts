#!/usr/bin/env bash

# ── SSH KEY SETUP ────────────────────────────────────────────────────
echo "[*] Generating SSH key for GitHub..."

read -p "Enter your GitHub email: " gh_email

# Generate key if it doesn't already exist
if [[ ! -f ~/.ssh/id_ed25519 ]]; then
    ssh-keygen -t ed25519 -C "$gh_email" -f ~/.ssh/id_ed25519 -N ""
else
    echo "SSH key already exists at ~/.ssh/id_ed25519"
fi

# Start agent and add key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Show the public key
echo "[*] Here's your public SSH key (copy this into GitHub > Settings > SSH Keys):"
echo "-----------------------------------------------------------------------"
cat ~/.ssh/id_ed25519.pub
echo "-----------------------------------------------------------------------"
echo "Paste it at: https://github.com/settings/ssh/new"

