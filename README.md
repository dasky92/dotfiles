# Dotfiles

Personal development environment configuration managed with [dotbot](https://github.com/anishathalye/dotbot).

## 📁 Structure

```
.dotfiles/
├── shell/                    # Shell configurations (XDG standard)
│   ├── common/              # Shared between bash/zsh
│   │   ├── env.sh          # Environment variables
│   │   ├── env.private.sh  # Private tokens/secrets (gitignored)
│   │   ├── aliases.sh      # Common aliases
│   │   └── aliases.work.sh # Work-specific aliases (gitignored)
│   ├── bash/
│   │   ├── bashrc          # Bash configuration
│   │   └── bash_profile    # Bash login shell
│   └── zsh/
│       ├── zshrc           # Zsh configuration
│       └── zprofile        # Zsh login shell
├── config/                  # Application configs
│   ├── vimrc
│   ├── tmux.conf
│   └── ...
└── install.conf.yaml        # Dotbot configuration
```

## 🚀 Installation

### Quick Install (Existing Machine)

```bash
cd ~/.dotfiles
./install
```

### New Machine Bootstrap

```bash
# Clone and run bootstrap
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./scripts/bootstrap.sh
```

## ✨ Features

- ✅ **XDG Standard**: Config files in `~/.config/shell/`
- ✅ **Shell Agnostic**: Shared config between bash/zsh (POSIX sh syntax)
- ✅ **Clean Separation**: Environment, aliases, private data are separated
- ✅ **Tool-friendly**: Auto-generated configs go to `*.local` files
- ✅ **Version Control**: Private data excluded via `.gitignore`

## 📝 Configuration Files

### Shell Loading Order

**Bash:**
```
~/.bash_profile → ~/.bashrc → common configs
```

**Zsh:**
```
~/.zprofile (minimal)
~/.zshrc → Oh-My-Zsh + common configs
```

### Common Config Files

| File | Purpose |
|------|---------|
| `env.sh` | PATH, environment variables, tool configs |
| `env.private.sh` | API tokens, secrets (gitignored) |
| `aliases.sh` | Common shell aliases |
| `aliases.work.sh` | Work-specific aliases (gitignored) |

### Auto-generated Configs

Tools that auto-write to rc files should write to:
- `~/.bashrc.local` for bash
- `~/.zshrc.local` for zsh

These files are gitignored and sourced automatically.

## 🔧 Adding New Tools

### Option 1: Use mise (recommended)

```bash
mise use -g node@20
mise use -g python@3.12
```

All shells will automatically have access to these tools.

### Option 1.5: Install system packages with Homebrew

```bash
# Add to Brewfile
echo 'brew "package-name"' >> Brewfile

# Install
brew bundle install
```

### Option 2: Manual PATH

Add to `~/.config/shell/env.sh`:

```bash
export PATH="$HOME/.new-tool/bin:$PATH"
```

### Option 3: Local Override

For machine-specific configs:

```bash
echo 'export CUSTOM_VAR="value"' >> ~/.zshrc.local
```

## 🔄 Updating

```bash
cd ~/.dotfiles
git pull
./install
```
