# 🎨 zywj0han9 的 Linux 配置文件仓库

一个精心配置的 Linux dotfiles 仓库，包含现代化的窗口管理器、终端配置和系统美化方案。适用于 Arch Linux 和 Hyprland 窗口管理器的日常使用环境。

## 📋 目录结构

```
.
├── awesome/          # AwesomeWM 窗口管理器配置
├── btop/            # 系统监控工具配置
├── Clamav/          # 防病毒软件配置
├── dunst/           # 通知守护进程配置
├── fastfetch/       # 系统信息展示工具配置
├── fish/            # Fish Shell 配置
├── hypr/            # Hyprland 合成器配置
├── kitty/           # Kitty 终端模拟器配置
├── tmux/            # 终端复用器配置
├── waybar/          # Wayland 状态栏配置
└── yazi/            # 文件管理器配置
```

## ⭐ 主要特性

### 🪟 窗口管理器
- **Hyprland**: 现代化 Wayland 合成器，支持平滑动画和高级特效
- **AwesomeWM**: X11 平铺式窗口管理器，高度可定制

### 🖥️ 终端环境
- **Fish Shell**: 现代化 shell，内置语法高亮和智能补全
- **Kitty**: GPU 加速终端模拟器，支持图像显示
- **Tmux**: 终端多路复用器，提升工作效率

### 📊 系统监控
- **Btop**: 现代化系统资源监控器
- **Fastfetch**: 快速系统信息展示工具

### 📁 文件管理
- **Yazi**: 现代化终端文件管理器，支持预览和插件

### 🎨 界面美化
- **Waybar**: Wayland 环境下的状态栏
- **Dunst**: 轻量级通知管理器

## 🔧 安装方法

### 前置依赖
```bash
# Arch Linux
sudo pacman -S hyprland waybar kitty fish btop yazi fastfetch dunst tmux

# 可选依赖
sudo pacman -S starship neovim git nodejs npm
```

### 克隆配置
```bash
# 克隆仓库
git clone https://github.com/zywj0han9/.config.git ~/.config

# 进入配置目录
cd ~/.config

# 初始化 git 子模块（Yazi 插件）
git submodule update --init --recursive
```

### Shell 配置
```bash
# 将 Fish 设为默认 Shell
chsh -s $(which fish)

# 重新登录或重启终端
```

## 📁 详细配置说明

### Fish Shell 配置
- **位置**: `fish/`
- **主配置**: `config.fish`
- **功能特性**:
  - Starship 提示符主题
  - 自定义别名和函数
  - 环境变量配置（支持 Wayland、Nvidia、中文输入法）
  - 开发环境配置（Java、Node.js、Rust）

### Hyprland 配置
- **位置**: `hypr/`
- **模块化设计**: 配置文件分别存放在 `conf.d/` 目录
- **主要模块**:
  - `monitors.conf`: 显示器配置
  - `keymaps.conf`: 键盘快捷键
  - `look.conf`: 外观和动画效果
  - `autostart.conf`: 自启动应用程序

### Waybar 状态栏
- **位置**: `waybar/`
- **配置文件**: `config` (JSON格式)
- **样式文件**: `style.css`
- **功能模块**: 工作区、时钟、系统状态、音量控制

### Yazi 文件管理器
- **位置**: `yazi/`
- **主要配置**:
  - `yazi.toml`: 核心配置
  - `keymap.toml`: 键位映射
  - `theme.toml`: 主题设置
- **插件支持**: 
  - `yamb.yazi`: 书签管理插件
  - `compress.yazi`: 压缩文件处理插件
  - `tokyo-night.yazi`: Tokyo Night 主题

### Kitty 终端
- **位置**: `kitty/`
- **主配置**: `kitty.conf`
- **主题配置**: `theme.conf`
- **特性**: GPU 加速、字体优化、透明效果

### Fastfetch 系统信息
- **位置**: `fastfetch/`
- **配置**: `config.jsonc` (JSON with Comments)
- **自定义**: 包含 Arch Linux 徽标配置

## 🎯 使用建议

### 首次使用
1. **备份现有配置**: 在应用配置前，请备份你现有的配置文件
2. **分模块应用**: 建议逐一测试各个模块，而非一次性应用全部配置
3. **自定义调整**: 根据个人需求修改键位绑定、主题色彩等

### 硬件要求
- **显卡**: 建议使用支持 OpenGL 的显卡（配置已针对 Nvidia 优化）
- **内存**: 推荐 8GB 以上（Hyprland 对内存要求较高）
- **分辨率**: 配置适用于高分辨率显示器，可根据需要调整缩放

### 系统优化
- **输入法**: 配置已适配 Fcitx 输入法框架
- **字体**: 建议安装 Nerd Fonts 以获得最佳图标显示效果
- **主题**: 整体采用暗色主题，提供护眼的视觉体验

## 🔧 自定义配置

### 修改主题色彩
```bash
# 编辑 Waybar 样式
nvim ~/.config/waybar/style.css

# 编辑 Kitty 主题
nvim ~/.config/kitty/theme.conf
```

### 调整快捷键
```bash
# 编辑 Hyprland 快捷键
nvim ~/.config/hypr/conf.d/keymaps.conf

# 编辑 Yazi 快捷键
nvim ~/.config/yazi/keymap.toml
```

### 添加自启动程序
```bash
# 编辑 Hyprland 自启动配置
nvim ~/.config/hypr/conf.d/autostart.conf
```

## 🌐 语言支持

- **主要语言**: 简体中文
- **备用语言**: 英语
- **输入法**: Fcitx 框架
- **字符编码**: UTF-8

## 📝 维护说明

### 更新配置
```bash
cd ~/.config
git pull origin main
git submodule update --remote
```

### 提交更改
```bash
# 添加修改的文件
git add .

# 提交更改
git commit -m "update configuration"

# 推送到远程仓库
git push origin main
```

## ⚠️ 注意事项

1. **兼容性**: 主要针对 Arch Linux 和 Wayland 环境优化
2. **依赖关系**: 部分配置依赖特定软件版本，请确保依赖软件已正确安装
3. **个人定制**: 配置中包含个人偏好设置，请根据需要进行调整
4. **备份重要**: 应用配置前请务必备份现有配置

## 📄 许可证

本项目采用开源许可证，欢迎 Fork 和自定义使用。

## 🤝 贡献

欢迎提交 Issue 和 Pull Request 来改进配置！

---

**享受你的 Linux 配置之旅！** 🚀