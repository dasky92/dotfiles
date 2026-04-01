#!/usr/bin/env bash
# ~/.config/bash/bashrc
# Bash interactive shell configuration

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
# Bash-Specific Configuration
# ============================================

# History settings
shopt -s histappend
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth:erasedups

# Shell options
shopt -s checkwinsize
shopt -s cdspell
shopt -s dirspell 2>/dev/null

# ============================================
# mise activation (bash-specific)
# ============================================

if command -v mise >/dev/null 2>&1; then
    if [ -z "$MISE_SHELL" ]; then
        eval "$(mise activate bash)"
    fi
fi

# ============================================
# Auto-generated Section (for tools)
# ============================================

if [ -f "$HOME/.local.bash" ]; then
    source "$HOME/.local.bash"
fi
