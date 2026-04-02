#!/usr/bin/env bash
# Backup old dotfiles before migration

set -e

BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo "🗂️  Creating backup directory: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

# List of files to backup
FILES=(
    ".bashrc"
    ".bash_profile"
    ".zshrc"
    ".zprofile"
    ".profile"
    ".commonrc"
    ".customrc"
    ".alias"
)

echo "📦 Backing up old configuration files..."

for file in "${FILES[@]}"; do
    if [ -f "$HOME/$file" ] || [ -L "$HOME/$file" ]; then
        echo "  - $file"
        cp -L "$HOME/$file" "$BACKUP_DIR/" 2>/dev/null || true
    fi
done

echo ""
echo "✅ Backup completed: $BACKUP_DIR"
echo ""
echo "To restore:"
echo "  cp $BACKUP_DIR/.bashrc ~/.bashrc"
echo "  cp $BACKUP_DIR/.zshrc ~/.zshrc"
