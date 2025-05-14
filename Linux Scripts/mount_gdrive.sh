#!/bin/bash
mkdir -p "$HOME/gdrive"
rclone mount gdrive: "$HOME/gdrive" --vfs-cache-mode writes
