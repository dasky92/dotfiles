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

# VSCode CLI
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# LLVM
export PATH="/usr/local/opt/llvm/bin:$PATH"

# MySQL
export PATH="/usr/local/opt/mysql@8.0/bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Coursier (Scala)
export PATH="$PATH:$HOME/Library/Application Support/Coursier/bin"

# ============================================
# Development Tools
# ============================================

# Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_261.jdk/Contents/Home"

# Homebrew (China mirror)
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

# mise (version manager)
export MISE_DATA_DIR="$HOME/.local/share/mise"
export MISE_CONFIG_DIR="$HOME/.config/mise"

# ============================================
# Compiler Flags (for building from source)
# ============================================

# OpenSSL
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"
export LDFLAGS="-L/usr/local/opt/openssl@3/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@3/include"

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
