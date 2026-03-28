#!/usr/bin/env sh
# XDG Shell Environment Configuration
# Compatible with bash and zsh (POSIX sh syntax)
# This file is sourced by both bash and zsh

# ============================================
# PATH Configuration
# ============================================

# User local binaries (highest priority)
export PATH="$HOME/.local/bin:$PATH"

# Homebrew
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# ============================================
# Development Tools
# ============================================

# Homebrew (China mirror)
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

# mise (version manager)
export MISE_DATA_DIR="$HOME/.local/share/mise"
export MISE_CONFIG_DIR="$HOME/.config/mise"

# ============================================
# Editor & Terminal
# ============================================

export EDITOR="vim"
export VISUAL="vim"
export TERM=xterm-256color

# ============================================
# NVM (Node Version Manager)
# ============================================

export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
    . "$NVM_DIR/nvm.sh"
fi
if [ -s "$NVM_DIR/bash_completion" ]; then
    . "$NVM_DIR/bash_completion"
fi
