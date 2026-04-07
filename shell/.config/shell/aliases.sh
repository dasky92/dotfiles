#!/usr/bin/env sh
# Common Aliases for bash and zsh

# ============================================
# Better Defaults
# ============================================

alias mv='mv -i'
alias ping='ping -c 5'
alias cl='clear'
alias mkdir='mkdir -pv'

# ============================================
# Navigation
# ============================================

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Create directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# ============================================
# File Listing
# ============================================

alias ls="command ls ${colorflag}"
alias l="ls -lF ${colorflag}"
alias la="ls -lAF ${colorflag}"
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# ============================================
# Grep with Color
# ============================================

alias grep='grep --color=auto'

# ============================================
# Git Shortcuts
# ============================================

alias gs="git status"
alias gm="git commit -m"
alias ga="git commit --amend"

# ============================================
# Development Tools
# ============================================

# Lazy tools
alias lg="lazygit"
alias dd="lazydocker"
alias cc="claude"
alias kk="minikube kubectl --"
alias tt="itools"

# Python
alias json="python3 -m json.tool"
alias www='python3 -m http.server 8000'

# ============================================
# System Information
# ============================================

alias show-path="echo -e ${PATH//:/\\n}"

# Reload shell
alias reload="exec ${SHELL} -l"
