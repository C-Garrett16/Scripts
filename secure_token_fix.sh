#!/bin/bash

# macOS SecureToken Fix Script - Step 1 Skeleton

while true; do
    clear
    echo "==================================="
    echo "   SecureToken Fixer - macOS"
    echo "==================================="
    echo

    echo "Detected user accounts (excluding system & TAS):"
    echo

    # Get list of users, exclude system accounts + TAS
    users=$(dscl . list /Users | grep -vE '^_|daemon|nobody|root|TAS')

    echo "$users"
    echo
    echo "Enter the username to fix (or type 'q' to quit):"
    read targetUser

    if [[ "$targetUser" == "q" || "$targetUser" == "Q" ]]; then
        echo "Bailing out... probably the smartest decision you've made today."
        exit 0
    fi

    # Check if entered user exists
    if id "$targetUser" &>/dev/null; then
        echo "You selected user: $targetUser"
        echo
        # This is where the sysadminctl command will go later.
        # For now we just loop.
        echo "Pretend we're fixing $targetUser... (we're not yet)"
        sleep 2
    else
        echo "No such user exists, dumbass. Try again."
        sleep 2
    fi
done
