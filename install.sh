#!/bin/bash

set -e

echo "========================================"
echo "  Dotfiles OneKey Install & Restore"
echo "========================================"

# 配置源目录
SRC_DIR="./configs"

# 备份旧配置
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d%H%M%S)"
mkdir -p "$BACKUP_DIR"
echo "📦 Old configs will be backed up to: $BACKUP_DIR"
echo

# 复制文件
copy_if_exists() {
  local src="$1"
  local dest="$2"

  if [ -f "$src" ]; then
    echo "🔹 Installing: $(basename "$dest")"

    # 先备份旧文件
    if [ -f "$dest" ] || [ -L "$dest" ]; then
      mv "$dest" "$BACKUP_DIR/"
    fi

    cp "$src" "$dest"
  fi
}

# 复制目录
copy_dir_if_exists() {
  local src="$1"
  local dest="$2"

  if [ -d "$src" ]; then
    echo "📂 Installing directory: $(basename "$dest")"

    # 备份旧目录
    if [ -d "$dest" ] || [ -L "$dest" ]; then
      mv "$dest" "$BACKUP_DIR/"
    fi

    cp -r "$src" "$dest"
  fi
}

# 开始安装
copy_if_exists "$SRC_DIR/.zshrc"          "$HOME/.zshrc"
copy_if_exists "$SRC_DIR/.bashrc"         "$HOME/.bashrc"
copy_if_exists "$SRC_DIR/.bash_profile"   "$HOME/.bash_profile"
copy_if_exists "$SRC_DIR/.gitconfig"      "$HOME/.gitconfig"
copy_if_exists "$SRC_DIR/.gitignore_global" "$HOME/.gitignore_global"
copy_if_exists "$SRC_DIR/.vimrc"          "$HOME/.vimrc"
copy_if_exists "$SRC_DIR/.tmux.conf"      "$HOME/.tmux.conf"
copy_if_exists "$SRC_DIR/.profile"        "$HOME/.profile"

copy_dir_if_exists "$SRC_DIR/.ssh"        "$HOME/.ssh"
copy_dir_if_exists "$SRC_DIR/nvim"        "$HOME/.config/nvim"
copy_dir_if_exists "$SRC_DIR/fish"        "$HOME/.config/fish"

echo
echo "✅ All dotfiles installed successfully!"
echo "📁 Old files backup at: $BACKUP_DIR"
echo
echo "🔄 Please restart your shell or run: source ~/.zshrc"
echo
