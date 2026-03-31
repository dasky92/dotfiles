# Makefile for dotfiles management with stow

.PHONY: help install uninstall brew zsh test clean bootstrap backup clean-old

# Default target
help:
	@echo "Dotfiles Management Commands:"
	@echo ""
	@echo "  make bootstrap   - Install Homebrew, stow, mise (run this first)"
	@echo "  make backup      - Backup old configs"
	@echo "  make clean-old   - Move old configs to *.old"
	@echo "  make install     - Install all dotfiles using stow"
	@echo "  make uninstall   - Remove all symlinks"
	@echo "  make restow      - Reinstall dotfiles"
	@echo "  make brew        - Install packages from Brewfile"
	@echo "  make zsh         - Setup Zsh with Oh-My-Zsh and plugins"
	@echo "  make test        - Test configuration"
	@echo "  make clean       - Clean up broken symlinks"
	@echo ""

# Bootstrap - Install base tools
bootstrap:
	@./scripts/bootstrap.sh

# Install dotfiles with stow
install:
	@echo "📦 Installing dotfiles with stow..."
	@stow -v -d $(PWD) -t $(HOME) shell
	@stow -v -d $(PWD) -t $(HOME) config
	@echo "✅ Dotfiles installed"

# Uninstall dotfiles
uninstall:
	@echo "🗑️  Removing dotfiles symlinks..."
	@stow -v -D -d $(PWD) -t $(HOME) shell
	@stow -v -D -d $(PWD) -t $(HOME) config
	@echo "✅ Symlinks removed"

# Restow (reinstall)
restow:
	@echo "🔄 Restowing dotfiles..."
	@stow -v -R -d $(PWD) -t $(HOME) shell
	@stow -v -R -d $(PWD) -t $(HOME) config
	@echo "✅ Dotfiles restowed"

# Install Homebrew packages
brew:
	@echo "📦 Installing packages from Brewfile..."
	@brew bundle install
	@echo "✅ Packages installed"

# Setup Zsh
zsh:
	@echo "🦓 Setting up Zsh..."
	@./scripts/setup_zsh.sh

# Test configuration
test:
	@echo "🧪 Testing configuration..."
	@./scripts/test_config.sh

# Clean broken symlinks
clean:
	@echo "🧹 Cleaning broken symlinks in HOME..."
	@find $(HOME) -maxdepth 1 -type l ! -exec test -e {} \; -print -delete
	@echo "✅ Cleanup complete"

# Backup old configs
backup:
	@./scripts/backup_old_configs.sh

# Clean old dotfiles before stow
clean-old:
	@echo "🗑️  Moving old config files..."
	@mv ~/.bashrc ~/.bashrc.old 2>/dev/null || true
	@mv ~/.bash_profile ~/.bash_profile.old 2>/dev/null || true
	@mv ~/.zshrc ~/.zshrc.old 2>/dev/null || true
	@mv ~/.zprofile ~/.zprofile.old 2>/dev/null || true
	@mv ~/.vimrc ~/.vimrc.old 2>/dev/null || true
	@mv ~/.tmux.conf ~/.tmux.conf.old 2>/dev/null || true
	@mv ~/.config/fish/config.fish ~/.config/fish/config.fish.old 2>/dev/null || true
	@rm ~/.config/shell 2>/dev/null || true
	@echo "✅ Old configs moved to *.old"
