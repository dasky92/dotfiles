# Quick Start Guide

## 🚀 全新安装

```bash
cd ~/.dotfiles
./install
exec $SHELL -l  # 重启 shell
```

## 📂 目录结构

```
~/.config/shell/        # ← 这里是核心配置！
├── env.sh             # 环境变量、PATH
├── env.private.sh     # 私有 tokens (gitignored)
├── aliases.sh         # 通用别名
└── aliases.work.sh    # 工作别名 (gitignored)
```

## ✏️ 常见修改

### 添加环境变量

```bash
# 编辑公共环境变量
vim ~/.config/shell/env.sh

# 或使用 local 文件（不会提交到 git）
echo 'export MY_VAR="value"' >> ~/.zshrc.local
```

### 添加别名

```bash
# 编辑公共别名
vim ~/.config/shell/aliases.sh

# 或添加到 shell 特定的 rc 文件
echo 'alias myalias="command"' >> ~/.zshrc
```

### 添加私有配置（tokens, 密码）

```bash
# 编辑私有环境变量（不会提交到 git）
vim ~/.config/shell/env.private.sh
```

## 🔧 安装新工具

### 方式 1: 使用 mise（推荐）

```bash
# 全局安装
mise use -g node@20
mise use -g python@3.12
mise use -g go@latest

# 项目级别
cd ~/my-project
mise use node@18
```

**优势:** bash 和 zsh 自动同步，无需手动配置

### 方式 2: 手动添加到 PATH

```bash
# 编辑
vim ~/.config/shell/env.sh

# 添加
export PATH="$HOME/.new-tool/bin:$PATH"

# 重新加载
source ~/.zshrc  # or ~/.bashrc
```

## 🐛 故障排查

### 配置没生效？

```bash
# 1. 重新安装
cd ~/.dotfiles && ./install

# 2. 重启 shell
exec $SHELL -l

# 3. 查看加载日志
zsh -xl  # 或 bash -xl
```

### 检查配置

```bash
# 运行测试脚本
~/.dotfiles/scripts/test_config.sh
```

### PATH 不对？

```bash
# 查看 PATH
echo $PATH | tr ':' '\n'

# 检查加载顺序
grep -n "export PATH" ~/.config/shell/env.sh
```

## 📝 文件说明

| 文件 | 用途 | 提交到 Git |
|------|------|-----------|
| `env.sh` | 公共环境变量 | ✅ Yes |
| `env.private.sh` | 私有 tokens | ❌ No (gitignored) |
| `aliases.sh` | 公共别名 | ✅ Yes |
| `aliases.work.sh` | 工作别名（可能含密码）| ❌ No (gitignored) |
| `~/.zshrc.local` | 自动生成/机器特定 | ❌ No (gitignored) |

## 🔄 Shell 加载流程

### Bash
```
~/.bash_profile
  └─> ~/.bashrc
       ├─> ~/.config/shell/env.sh
       ├─> ~/.config/shell/env.private.sh
       ├─> ~/.config/shell/aliases.sh
       ├─> ~/.config/shell/aliases.work.sh
       └─> ~/.bashrc.local (如果存在)
```

### Zsh
```
~/.zprofile (minimal)
~/.zshrc
  ├─> Oh-My-Zsh
  ├─> ~/.config/shell/env.sh
  ├─> ~/.config/shell/env.private.sh
  ├─> ~/.config/shell/aliases.sh
  ├─> ~/.config/shell/aliases.work.sh
  └─> ~/.zshrc.local (如果存在)
```

## 💡 实用技巧

### 测试配置不破坏当前环境

```bash
# 在新 shell 中测试
bash -l -c 'echo $PATH'
zsh -l -c 'echo $PATH'
```

### 查看某个工具从哪里来

```bash
which node
type node
command -v node
```

### 只重新加载环境变量

```bash
source ~/.config/shell/env.sh
```

### 查看所有别名

```bash
alias
```

## 📚 更多文档

- [完整迁移指南](MIGRATION.md)
- [详细说明](README.md)
- [dotbot 文档](https://github.com/anishathalye/dotbot)
