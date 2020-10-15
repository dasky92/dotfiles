#! /usr/bin/sh


# remove outdated versions
brew cleanup

# update & upgrade
brew update
brew upgrade

# enhance default shell
brew install zsh

# replace readlink, readlink is not available in MacOS.
# greadlink
brew install coreutils

# Editor
brew install vim

# build, find, index tools
brew install ack cmake ctags fzf global ripgrep

# Enhance default commandline
# htop -> top
# trash-cli -> rm
# tldr -> man
brew install bat htop trash-cli tree tldr

# Development tools
brew install pyenv httpie git tmux

# Other enhance
# record shell command history as svg
brew install asciinema

# Language
brew install go node

# shell check
brew install shellcheck

# ################### brew cask install ####################

# applictions
brew cask install iterm2 postman wireshark
# media player
brew cask install vls
