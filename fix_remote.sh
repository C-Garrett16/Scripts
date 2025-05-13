#!/bin/bash
# Bulk convert all GitHub remotes from HTTPS to SSH
# Place this in the parent folder of all your repos and run it

for dir in */.git; do
    repo_dir=$(dirname "$dir")
    echo "Checking repo: $repo_dir"
    cd "$repo_dir" || continue

    current_url=$(git remote get-url origin 2>/dev/null)

    if [[ $current_url == https://github.com/* ]]; then
        ssh_url=$(echo "$current_url" | sed -E 's|https://github.com/|git@github.com:|;s|\.git$||').git
        echo "Updating $repo_dir from HTTPS to SSH:"
        echo "  Old: $current_url"
        echo "  New: $ssh_url"
        git remote set-url origin "$ssh_url"
    else
        echo "  Skipping $repo_dir (already SSH or not a GitHub repo)"
    fi

    cd - >/dev/null || exit
done

echo "All done. Buy me a beer."
