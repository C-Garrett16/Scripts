#!/bin/bash

# fixsecure - macOS SecureToken Fix Tool (final production edition)

# 🔒 Check if current user is TAS
if [[ "$(whoami)" != "TAS" ]]; then
    echo "🚫 ACCESS DENIED. Only the almighty TAS account may wield this power."
    exit 1
fi

function run_sysadminctl() {
    local user="$1"
    echo
    echo "==================================="
    echo "About to run sysadminctl on $user."
    echo "You'll be prompted TWICE for the admin password"
    echo "(TAS account), then for $user's password."
    echo "==================================="
    echo
    read -p "Press Enter to proceed or CTRL+C to abort."

    sudo sysadminctl -secureTokenOn "$user" -password - -adminUser TAS -adminPassword -

    echo
    echo "==================================="
    echo "Command completed for $user."
    echo "==================================="
}

# === ARGUMENT MODE ===
if [[ -n "$1" ]]; then
    targetUser="$1"
else
    # === PROMPT MODE ===
    read -p "Enter username to fix: " targetUser
fi

# === Sanity check ===
if id "$targetUser" &>/dev/null; then
    run_sysadminctl "$targetUser"
else
    echo "❌ User '$targetUser' does not exist. Exiting."
    exit 1
fi
