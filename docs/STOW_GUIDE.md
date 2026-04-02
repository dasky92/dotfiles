# Stow 使用指南

使用 GNU Stow 管理 dotfiles 的完整说明。

## 📁 目录结构

```
.dotfiles/
├── shell/              # Shell 配置（stow 包）
│   ├── .bashrc
│   ├── .bash_profile
│   ├── .zshrc
│   ├── .zprofile
│   └── .config/
│       └── shell/
│           ├── env.sh
│           ├── env.private.sh
│           ├── aliases.sh
│           └── aliases.work.sh
├── config/             # 其他应用配置（stow 包）
│   ├── .vimrc
│   ├── .tmux.conf
│   ├── .ideavimrc
│   ├── .npmrc
│   └── z.lua
├── Brewfile           # Homebrew 包管理
├── Makefile           # 自动化命令
└── scripts/           # 辅助脚本
```

## 🚀 快速开始

### 新机器初始化

```bash
# 1. Clone 仓库
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# 2. Bootstrap（安装 Homebrew, stow, mise）
make bootstrap

# 3. 备份旧配置（如果有）
make backup

# 4. 清理旧配置文件
make clean-old

# 5. 安装 dotfiles
make install

# 6. 安装软件包
make brew

# 7. 配置 Zsh
make zsh

# 8. 测试配置
make test
```

### 已有环境更新

```bash
cd ~/.dotfiles
git pull
make restow  # 重新安装
```

## 📋 Makefile 命令

| 命令 | 说明 |
|------|------|
| `make help` | 显示帮助信息 |
| `make bootstrap` | 安装 Homebrew, stow, mise |
| `make backup` | 备份现有配置 |
| `make clean-old` | 移动旧配置到 *.old |
| `make install` | 使用 stow 安装 dotfiles |
| `make uninstall` | 删除所有 symlink |
| `make restow` | 重新安装（先删后装）|
| `make brew` | 从 Brewfile 安装包 |
| `make zsh` | 配置 Zsh + Oh-My-Zsh |
| `make test` | 测试配置 |
| `make clean` | 清理损坏的 symlink |

## 🔧 Stow 工作原理

### 基本概念

```
stow -d ~/.dotfiles -t ~ shell
     ↓
     从 ~/.dotfiles/ (stow dir)
     将 shell/ (package)
     链接到 ~ (target dir)
```

### 实际效果

```
shell/.bashrc        → ~/.bashrc
shell/.config/shell/ → ~/.config/shell/
```

### 常用命令

```bash
# 安装（创建 symlink）
stow shell
stow config

# 删除（移除 symlink）
stow -D shell

# 重新安装
stow -R shell

# 预览（不实际执行）
stow -n -v shell
```

## 🎯 添加新配置

### 添加新的配置文件

```bash
# 1. 移动文件到对应的 stow 包
mv ~/.myrc ~/.dotfiles/shell/.myrc

# 2. 重新 stow
make restow
```

### 添加新的 stow 包

```bash
# 1. 创建新包目录
mkdir -p ~/.dotfiles/myapp

# 2. 添加文件（文件名要带点）
echo "config" > ~/.dotfiles/myapp/.myapprc

# 3. 在 Makefile 中添加
# 修改 install target:
stow -v -d $(PWD) -t $(HOME) myapp

# 4. 安装
make install
```

## ⚠️ 常见问题

### 冲突：文件已存在

```bash
# 错误信息
WARNING! stowing shell would cause conflicts:
  * existing target is neither a link nor a directory: .bashrc

# 解决方法
mv ~/.bashrc ~/.bashrc.old  # 手动移走
# 或
make clean-old              # 批量移走
```

### 删除配置后 stow 不工作

```bash
# 如果你删除了 ~/.bashrc，stow 认为 symlink 还在
# 解决方法：先 uninstall 再 install
make uninstall
make install
```

### 查看哪些文件被 stow 管理

```bash
cd ~
ls -la | grep "\.dotfiles"
```

## 🔄 迁移到 Stow 的步骤

### 从 dotbot 迁移

1. **备份**
```bash
make backup
```

2. **重组目录结构**
```
之前: config/vimrc
现在: config/.vimrc  (文件名要带点)

之前: shell/bash/bashrc
现在: shell/.bashrc  (扁平化)
```

3. **移除旧 symlink**
```bash
# 删除 dotbot 创建的链接
rm ~/.bashrc ~/.zshrc ...
```

4. **安装新配置**
```bash
make install
```

## 📚 延伸阅读

- [GNU Stow 官方文档](https://www.gnu.org/software/stow/)
- [Stow 使用技巧](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)
