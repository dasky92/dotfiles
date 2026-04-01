# Fish-native shared environment variables migrated from `env.sh`.

set -gx HOMEBREW_BOTTLE_DOMAIN "https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
set -gx MISE_DATA_DIR "$HOME/.local/share/mise"
set -gx MISE_CONFIG_DIR "$HOME/.config/mise"

set -gx EDITOR "vim"
set -gx VISUAL "vim"
set -gx TERM "xterm-256color"

set -gx NVM_DIR "$HOME/.nvm"
set -gx PYENV_ROOT "$HOME/.pyenv"
set -gx PYENV_VIRTUALENV_DISABLE_PROMPT 1
