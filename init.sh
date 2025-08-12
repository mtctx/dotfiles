#!/bin/bash

# Recursively create symlinks from dotfiles to their target locations
# Usage: ./init-dotfiles.sh

DOTFILES_DIR="$HOME/.dotfiles"
TARGET_DIR="$HOME"

# Find all files in .dotfiles directory (excluding .git directory if present)
find "$DOTFILES_DIR" -type f -not -path "$DOTFILES_DIR/.git/*" | while read -r file; do
    # Calculate the relative path from .dotfiles directory
    rel_path="${file#$DOTFILES_DIR/}"

    # Calculate target path (in home directory)
    target_file="$TARGET_DIR/$rel_path"

    # Create target directory if it doesn't exist
    target_dir=$(dirname "$target_file")
    mkdir -p "$target_dir"

    # Create symlink (force overwrite if it exists)
    ln -sf "$file" "$target_file"
    echo "Linked: $target_file → $file"
done

echo "Dotfiles initialization complete!"
