#!/usr/bin/env bash
# Bootstrap script - Install基础环境
# Only installs: Homebrew, mise, and stow

set -e

echo "🚀 Bootstrap基础环境"
echo "================================="
echo ""

# Check macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "⚠️  This script is for macOS only"
    exit 1
fi

# 1. Install Homebrew
if ! command -v brew &>/dev/null; then
    echo "📦 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "✅ Homebrew installed"
else
    echo "✅ Homebrew already installed"
fi

# 2. Install stow
if ! command -v stow &>/dev/null; then
    echo ""
    echo "📦 Installing GNU stow..."
    brew install stow
    echo "✅ stow installed"
else
    echo "✅ stow already installed"
fi

# 3. Install mise
if ! command -v mise &>/dev/null; then
    echo ""
    echo "📦 Installing mise..."
    brew install mise
    echo "✅ mise installed"
else
    echo "✅ mise already installed"
fi

echo ""
echo "================================="
echo "✨ Bootstrap complete!"
echo ""
echo "📋 Next steps:"
echo "  1. make install    # Install dotfiles with stow"
echo "  2. make brew       # Install packages from Brewfile"
echo "  3. make zsh        # Setup Zsh with Oh-My-Zsh"
echo "  4. make test       # Test configuration"
