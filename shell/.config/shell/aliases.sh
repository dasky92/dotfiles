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
# Date & Time
# ============================================

alias now='date +"%Y-%m-%d %H:%M:%S"'
alias nowtime='date +"%T"'
alias nowdate='date +"%Y-%m-%d"'

# ============================================
# Git Shortcuts
# ============================================

alias gs="git status"
alias gS="git stash"
alias gp="git pull"
alias gP="git push"
alias gc="git commit"
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
alias json="python -m json.tool"
alias www='python3 -m http.server 8000'

# Typo fixes
alias falsk="flask"

# ============================================
# System Information
# ============================================

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"
alias path='echo -e ${PATH//:/\\n}'

# Reload shell
alias reload="exec ${SHELL} -l"
