#!/bin/bash

set -e

# 备份目录
BACKUP_DIR="./configs"
mkdir -p "$BACKUP_DIR"

echo "==================================="
echo "  Dotfiles Backup Tool"
echo "==================================="

# 需要备份的文件列表
files=(
  ~/.zshrc
  ~/.bashrc
  ~/.bash_profile
  ~/.gitconfig
  ~/.gitignore_global
  ~/.vimrc
  ~/.tmux.conf
  ~/.profile
)

for file in "${files[@]}"; do
  if [ -f "$file" ]; then
    filename=$(basename "$file")
    echo "✅ Backing up: $filename"
    cp "$file" "$BACKUP_DIR/"
  else
    echo "⏭️  Skip: $file"
  fi
done

# 备份目录
dirs=(
  ~/.ssh
  ~/.config/nvim
  ~/.config/fish
)

for dir in "${dirs[@]}"; do
  if [ -d "$dir" ]; then
    dirname=$(basename "$dir")
    echo "✅ Backing up directory: $dirname"
    cp -r "$dir" "$BACKUP_DIR/"
  fi
done

echo ""
echo "🎉 Backup finished! All files saved to ./configs"
echo ""
