#!/bin/bash

set -e

REPO_PATH="$HOME/dev/nvim"
BACKUP_PATH="$REPO_PATH/backup"
CFG_PATH="$HOME/.config/nvim"

# Check if repo directory exists
if [ ! -d "$REPO_PATH" ]; then
    echo "Error: Repository directory $REPO_PATH does not exist"
    exit 1
fi

# Check if backup directory exists
if [ ! -d "$BACKUP_PATH" ]; then
    mkdir "$BACKUP_PATH"
fi

create_symlinks() {
    # Handle existing directory
    if [ -d "$CFG_PATH" ] && [ ! -L "$CFG_PATH" ]; then
        echo "Backing up existing config"
        cp -r "$CFG_PATH" "$BACKUP_PATH/nvim.backup.$(date +%Y%m%d_%H%M%S)"
    fi

    # Remove existing symlink
    [ -L "$CFG_PATH" ] && rm "$CFG_PATH"

    # Create new symlink
    ln -s "$REPO_PATH" "$CFG_PATH"

    echo "✓ Symlink created successfully"
    ls -la "$CFG_PATH"
}

create_symlinks

