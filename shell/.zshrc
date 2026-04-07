#!/usr/bin/env zsh
# ~/.config/zsh/zshrc
# Zsh interactive shell configuration

# ============================================
# Load Common Configuration
# ============================================

# Environment variables (POSIX compatible)
if [ -f "$HOME/.config/shell/env.sh" ]; then
    source "$HOME/.config/shell/env.sh"
fi

# Private environment (tokens, secrets)
if [ -f "$HOME/.config/shell/env.private.sh" ]; then
    source "$HOME/.config/shell/env.private.sh"
fi

# Common aliases
if [ -f "$HOME/.config/shell/aliases.sh" ]; then
    source "$HOME/.config/shell/aliases.sh"
fi

# Work-specific aliases (optional)
if [ -f "$HOME/.config/shell/aliases.work.sh" ]; then
    source "$HOME/.config/shell/aliases.work.sh"
fi

# ============================================
# mise early activation (before Oh-My-Zsh)
# ============================================

if command -v mise >/dev/null 2>&1; then
    if [[ -z "$MISE_SHELL" && -z "$MISE_ACTIVATED" ]]; then
        eval "$(mise activate zsh)"
        export MISE_ACTIVATED="1"
    fi
fi

# ============================================
# Oh-My-Zsh Configuration
# ============================================

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

# Disable auto-update
DISABLE_AUTO_UPDATE="true"

# Disable auto-title
DISABLE_AUTO_TITLE="true"

# Disable correction
ENABLE_CORRECTION="false"

# Plugins
plugins=(
    git
    aliases
    zsh-syntax-highlighting
    zsh-autosuggestions
    fzf
)

source $ZSH/oh-my-zsh.sh

# fzf settings
DISABLE_FZF_AUTO_COMPLETION="true"
DISABLE_FZF_KEY_BINDINGS="true"

# ============================================
# Zsh-Specific Tools
# ============================================

# z.lua navigation
if [ -f "$HOME/z.lua" ]; then
    eval "$(lua $HOME/z.lua --init zsh)"
fi

# ============================================
# Auto-generated Section (for tools)
# ============================================

if [ -f "$HOME/.local.zsh" ]; then
    source "$HOME/.local.zsh"
fi
