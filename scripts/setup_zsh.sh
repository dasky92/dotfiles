#!/usr/bin/env bash
# Setup Zsh with Oh-My-Zsh and plugins

set -e

echo "🦓 Setting up Zsh..."

# Install Oh-My-Zsh if not installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "📦 Installing Oh-My-Zsh..."
    RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "✅ Oh-My-Zsh already installed"
fi

# Install zsh-autosuggestions
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "📦 Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
    echo "✅ zsh-autosuggestions already installed"
fi

# Install zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo "📦 Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
    echo "✅ zsh-syntax-highlighting already installed"
fi

# Change default shell to zsh (if not already)
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "🔄 Changing default shell to zsh..."
    chsh -s "$(which zsh)"
    echo "⚠️  Please log out and log back in for shell change to take effect"
else
    echo "✅ Default shell is already zsh"
fi

echo ""
echo "✨ Zsh setup complete!"
echo "📝 Plugins installed: zsh-autosuggestions, zsh-syntax-highlighting"
