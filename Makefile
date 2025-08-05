# Makefile for managing dotfiles installation and related configurations

.PHONY: install.dobot install install.ohmyzsh install.fonts install.macapp

# Define variables
DOTFILES_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
CONFIG_DIR := $(DOTFILES_DIR)/config
CONFIG := "conf.yaml"
DOTBOT_DIR := "dotbot"
DOTBOT_BIN := "bin/dotbot"
BASEDIR := "$$(cd "$$(dirname "${BASH_SOURCE[0]}")" && pwd)"

install.dotbot:
	@cd "${BASEDIR}"
	@git -C "${DOTBOT_DIR}" submodule sync --quiet --recursive
	@git submodule update --init --recursive "${DOTBOT_DIR}"

install:
	@"${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${CONFIG}"

install.ohmyzsh:
	@echo "Installing Oh My Zsh..."
	@bash ./scripts/ohmyzsh_install.sh

install.fonts:
	@echo "Installing Powerline fonts..."
	@bash ./scripts/powerline-fonts-install.sh

install.macapp:
	@echo "Installing Homebrew packages..."
	@bash ./scripts/brew_install.sh
