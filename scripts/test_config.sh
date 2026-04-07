#!/usr/bin/env bash
# Test the dotfiles configuration (Stow version)

echo "🔍 Testing Dotfiles Configuration"
echo "=================================="
echo ""

# Source shell config to test aliases (in current shell session)
# 检测当前 shell 并加载对应配置
if [ -n "$ZSH_VERSION" ]; then
    # Running in zsh
    [ -f ~/.zshrc ] && source ~/.zshrc >/dev/null 2>&1
elif [ -n "$BASH_VERSION" ]; then
    # Running in bash - need to enable alias expansion
    shopt -s expand_aliases
    [ -f ~/.bashrc ] && source ~/.bashrc >/dev/null 2>&1
fi
echo ""

# Test 1: Check symlinks (stow creates relative links)
echo "1️⃣  Checking symlinks..."
check_link() {
    local link=$1
    local expected=$2
    if [ -L "$link" ]; then
        local target=$(readlink "$link")
        if [[ "$target" == *"$expected"* ]]; then
            echo "  ✅ $link → $target"
        else
            echo "  ❌ $link → $target (expected: $expected)"
        fi
    elif [ -f "$link" ]; then
        echo "  ⚠️  $link exists but is not a symlink"
    else
        echo "  ❌ $link does not exist"
    fi
}

# Stow creates relative symlinks like: ../.dotfiles/shell/.bashrc
check_link ~/.bashrc ".dotfiles/shell/.bashrc"
check_link ~/.zshrc ".dotfiles/shell/.zshrc"
check_link ~/.bash_profile ".dotfiles/shell/.bash_profile"
check_link ~/.zprofile ".dotfiles/shell/.zprofile"
check_link ~/.vimrc ".dotfiles/config/.vimrc"
check_link ~/.tmux.conf ".dotfiles/config/.tmux.conf"
echo ""

# Test 2: Check config files exist
echo "2️⃣  Checking config files in .dotfiles..."
check_file() {
    local file=$1
    if [ -f "$file" ]; then
        echo "  ✅ $file"
    else
        echo "  ❌ $file (missing)"
    fi
}

check_file ~/.dotfiles/shell/.bashrc
check_file ~/.dotfiles/shell/.zshrc
check_file ~/.dotfiles/shell/.config/shell/env.sh
check_file ~/.dotfiles/shell/.config/shell/aliases.sh
check_file ~/.dotfiles/config/.vimrc
echo ""

# Test 3: Check ~/.config/shell is linked
echo "3️⃣  Checking ~/.config/shell..."
if [ -L ~/.config/shell ]; then
    target=$(readlink ~/.config/shell)
    echo "  ✅ ~/.config/shell → $target"
elif [ -d ~/.config/shell ]; then
    echo "  ⚠️  ~/.config/shell is a directory, not a symlink"
else
    echo "  ❌ ~/.config/shell does not exist"
fi
echo ""

# Test 4: Check PATH
echo "4️⃣  Checking PATH..."
check_path() {
    local path=$1
    if [[ ":$PATH:" == *":$path:"* ]]; then
        echo "  ✅ $path in PATH"
    else
        echo "  ⚠️  $path not in PATH"
    fi
}

check_path "$HOME/.local/bin"
check_path "/usr/local/bin"
check_path "$HOME/Library/pnpm"
echo ""

# Test 5: Check environment variables
echo "5️⃣  Checking environment variables..."
check_var() {
    local var=$1
    if [ -n "${!var}" ]; then
        echo "  ✅ $var=${!var}"
    else
        echo "  ⚠️  $var not set"
    fi
}

check_var EDITOR
check_var PNPM_HOME
echo ""

# Test 6: Check aliases (after sourcing config)
echo "6️⃣  Checking aliases..."
check_alias() {
    local alias_name=$1
    # Try alias command first
    if alias "$alias_name" &>/dev/null 2>&1; then
        local alias_def=$(alias "$alias_name" 2>/dev/null | cut -d= -f2-)
        echo "  ✅ $alias_name → $alias_def"
        return 0
    fi

    # Fallback: check if defined in config files
    if grep -q "alias $alias_name=" ~/.config/shell/aliases.sh 2>/dev/null || \
       grep -q "alias $alias_name=" ~/.dotfiles/shell/.config/shell/aliases.sh 2>/dev/null; then
        echo "  ✅ $alias_name (defined in aliases.sh)"
        return 0
    fi

    echo "  ❌ $alias_name not found"
    return 1
}

check_alias l
check_alias la
check_alias gs
check_alias ..
echo ""

# Test 7: Check mise
echo "7️⃣  Checking mise..."
if command -v mise &>/dev/null; then
    echo "  ✅ mise installed: $(mise --version 2>&1 | head -1)"
    if [ -n "$MISE_SHELL" ]; then
        echo "  ✅ mise activated in shell: $MISE_SHELL"
    else
        echo "  ⚠️  mise not activated (restart shell)"
    fi
else
    echo "  ⚠️  mise not found"
fi
echo ""

# Test 8: Check stow
echo "8️⃣  Checking stow..."
if command -v stow &>/dev/null; then
    echo "  ✅ stow installed: $(stow --version | head -1)"
else
    echo "  ❌ stow not found (run: make bootstrap)"
fi
echo ""

# Summary
echo "=================================="
echo "✨ Configuration test complete!"
echo ""
echo "If you see any ❌ or ⚠️  above:"
echo "  1. Run: make install        # Install/reinstall dotfiles"
echo "  2. Run: exec \$SHELL -l      # Restart shell"
echo "  3. Check: make help         # See all commands"
echo "  4. Debug: zsh -xl or bash -xl"
