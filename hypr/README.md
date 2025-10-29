# Hyprland 配置说明

本目录存放了 Hyprland 的主配置文件以及按功能拆分的子配置，方便在不同设备上复用并做最小化的本地覆盖。入口文件 `hyprland.conf` 会依次 `source` `conf.d/` 中的模块，最后加载 `local.conf` 以承载主机特有的设定。

## 快速开始

```sh
# 修改配置后热重载（无需退出 Hyprland）
hyprctl reload

# 查看当前输入/显示器信息，便于编写 local 覆盖
hyprctl devices
hyprctl monitors
```

> 提示：每个模块都尽量保持单一职责，需要按个人喜好调整时只修改对应文件即可。

## 目录结构

```
hypr/
├── hyprland.conf        # 主入口，顺序 source 子配置
├── conf.d/
│   ├── autostart.conf   # 开机自动启动的后台程序
│   ├── env.conf         # Wayland / 输入法 / 工具所需环境变量
│   ├── input.conf       # 预留输入设备设置（键盘、触控板等）
│   ├── look.conf        # 间距、圆角、阴影、模糊、动画等视觉风格
│   ├── keymaps.conf     # 快捷键与窗口管理逻辑
│   ├── monitors.conf    # 显示器拓扑；默认走自动模式，可在此固定分辨率/缩放
│   ├── windows-rules.conf # 应用窗口规则及工作区分配
│   ├── workspace.conf   # 持久化工作区以及可选的 gaps / 名称 / special workspace
│   ├── local.conf       # 设备特有的覆盖项，默认示例为 4K 屏缩放 1.5
│   └── apps/
│       ├── browsers.conf
│       ├── chat.conf
│       ├── dev.conf
│       └── media.conf   # 分类存放针对特定应用的额外规则（暂为空模板）
└── README.md            # 当前说明文件
```

## 模块要点

### `autostart.conf`
使用 `exec-once` 启动输入法、状态栏、通知等桌面常驻程序。部分条目（如 Steam、WeChat）通过注释保留，可按需启用。

### `env.conf`
统一设置 Wayland、输入法（fcitx5）以及 SDL/Qt/Gtk 所需环境变量，确保应用以原生 Wayland 模式运行且输入法生效。

### `look.conf`
专注于视觉：
- `general` 控制窗口间距、边框宽度与默认布局（dwindle）。
- `decoration` 定义圆角、阴影、模糊与透明度。
- `animations` 设置动画曲线及窗口/工作区动画。
- `dwindle`、`master`、`misc`、`xwayland` 等段落提供布局细节与兼容性开关。

### `keymaps.conf`
建立两个基础修饰键变量：`$mainMod = ALT`、`$suprMod = SUPER`，并按功能分组管理：
- 会话控制、窗口管理、应用启动、焦点切换等（基于 ALT）。
- 布局调整、窗口移动/缩放（基于 SUPER）。
- 方向键位采用 `n/i/u/e` 方案，适合 Colemak 键位习惯。

### `windows-rules.conf`
通过 `windowrulev2` 将常用应用分配到固定工作区（如浏览器到 workspace 2、聊天应用到 workspace 3），同时包含窗口行为修正，例如禁止 maximize 请求或修复 XWayland 拖拽问题。

### `workspace.conf`
让工作区 1..5 持久化存在，并提供模板注释以便：
- 为特定工作区定制 gaps、边框或阴影。
- 设置友好的默认名称。
- 定义 special workspace 及首次创建时自动执行命令。

### `monitors.conf`
默认启用全自动的显示器匹配：未指定的屏幕均使用 `preferred` 分辨率、自动位置与自动缩放。上方示例演示如何手动固定 HDMI-A-1 为 4K@60Hz 且缩放 1.5 倍，可根据设备需要复制到 `local.conf`。

### `local.conf`
专门留给当前设备的覆盖配置，示例同样设置了 4K 显示器缩放。通过 `hyprctl reload` 即可即时生效，建议在修改前先查看 `hyprctl monitors` / `hyprctl devices` 的输出以确认名称。

### `apps/*.conf`
为不同类别的应用预留的扩展文件，可用于后续追加 `windowrulev2`、`bind` 或脚本逻辑。当前为空模板，方便在多人协作时按类别拆分。

## 常见操作

- 调整完键位或外观后立即生效：`hyprctl reload`
- 排查配置语法错误：查看 `~/.local/share/hypr/hyprland.log`
- 临时禁用动画/模糊：在 `look.conf` 中将对应段落的 `enabled` 设为 `false`

如需额外模块，只需在 `conf.d/` 中新增文件并在 `hyprland.conf` 里 `source` 对应路径即可。
