# Common aliases for fish.

set -l _ls_color_flag
if command ls --color=auto >/dev/null 2>&1
    set _ls_color_flag --color=auto
end

alias mv 'mv -i'
alias ping 'ping -c 5'
alias cl 'clear'
alias mkdir 'mkdir -pv'

alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'

function mkcd
    mkdir -p "$argv[1]" && cd "$argv[1]"
end

alias ls "command ls $_ls_color_flag"
alias l "command ls -lF $_ls_color_flag"
alias la "command ls -lAF $_ls_color_flag"
alias lsd "command ls -lF $_ls_color_flag | grep --color=never '^d'"

alias grep 'grep --color=auto'

alias now 'date +"%Y-%m-%d %H:%M:%S"'
alias nowtime 'date +"%T"'
alias nowdate 'date +"%Y-%m-%d"'

alias gs 'git status'
alias gp 'git pull'
alias gP 'git push'
alias gc 'git commit'
alias gm 'git commit -m'
alias ga 'git commit --amend'

alias lg 'lazygit'
alias dd 'lazydocker'
alias cc 'claude'
alias kk 'minikube kubectl --'
alias tt 'itools'

alias json 'python3 -m json.tool'
alias www 'python3 -m http.server 8000'

function path
    printf '%s\n' $PATH
end

function reload
    exec fish -l
end
