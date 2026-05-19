# Scripts

实用脚本集合，用于 dotfiles 的安装、配置和测试。

## 📋 脚本列表

### 🚀 bootstrap.sh - 全新机器初始化

**用途:** 在新 Mac 上一键安装所有环境

**包含:**
- 安装 Homebrew
- 从 Brewfile 安装软件
- 安装 mise
- 配置 Zsh (Oh-My-Zsh + 插件)
- 安装 dotfiles

**使用:**
```bash
cd ~/.dotfiles
./scripts/bootstrap.sh
```

**适用场景:** 新机器首次设置

---

### 🦓 setup_zsh.sh - Zsh 环境配置

**用途:** 安装和配置 Oh-My-Zsh 及常用插件

**包含:**
- Oh-My-Zsh
- zsh-autosuggestions (自动建议)
- zsh-syntax-highlighting (语法高亮)
- 设置 zsh 为默认 shell

**使用:**
```bash
./scripts/setup_zsh.sh
```

**适用场景:** 单独配置 Zsh 环境

---

### 💾 backup_old_configs.sh - 备份旧配置

**用途:** 迁移到新配置前备份现有配置文件

**备份文件:**
- .bashrc, .zshrc
- .bash_profile, .zprofile
- .commonrc, .customrc, .alias

**使用:**
```bash
./scripts/backup_old_configs.sh
```

**适用场景:** 重构前备份，防止数据丢失

---

### 🧪 test_config.sh - 配置测试

**用途:** 验证 dotfiles 配置是否正确

**检查项:**
- 符号链接是否正确
- 配置文件是否存在
- PATH 是否包含必要目录
- 环境变量是否设置
- 别名是否生效
- mise 是否正常工作

**使用:**
```bash
./scripts/test_config.sh
```

**适用场景:**
- 安装后验证
- 故障排查
- 更新后检查

---

## 🎯 常见使用场景

### 场景 1: 新 Mac 初始化

```bash
# 1. Clone dotfiles
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles

# 2. 运行 bootstrap
cd ~/.dotfiles
./scripts/bootstrap.sh

# 3. 重启终端
```

### 场景 2: 更新现有配置

```bash
# 1. 备份（可选）
./scripts/backup_old_configs.sh

# 2. 拉取最新代码
git pull

# 3. 重新安装
./install

# 4. 测试
./scripts/test_config.sh
```

### 场景 3: 只配置 Zsh

```bash
./scripts/setup_zsh.sh
```

### 场景 4: 验证配置

```bash
./scripts/test_config.sh
```

---

## 🗑️ 已删除的旧脚本

以下脚本已被删除（过时或被更好的工具替代）：

- ❌ `install.sh` - 被 dotbot 替代
- ❌ `backup.sh` - 被 backup_old_configs.sh 替代
- ❌ `brew_install.sh` - 被 Brewfile + `brew bundle` 替代
- ❌ `brew_app`, `brew_cask_app` - 被 Brewfile 替代
- ❌ `powerline-fonts-install.sh` - 字体已内置在现代终端
- ❌ `ohmyzsh_install.sh` - 被 setup_zsh.sh 替代

---

## 📚 延伸阅读

- [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle)
- [Oh-My-Zsh](https://ohmyz.sh/)
- [mise](https://mise.jdx.dev/)
