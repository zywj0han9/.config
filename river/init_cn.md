# 这是 River 窗口管理器的示例配置文件
#
# 如果要修改配置，建议先复制到以下目录：
# $XDG_CONFIG_HOME/river/init 或 $HOME/.config/river/init
#
# 详细文档请参考 `man river(1)`、`man riverctl(1)` 和 `man rivertile(1)`
# Alt + Return 启动 kitty 终端
riverctl map normal Alt Return spawn kitty

# 用户自定义应用启动快捷键
riverctl map normal Alt C spawn google-chrome-stable  # 启动 Google Chrome
riverctl map normal Alt X spawn firefox               # 启动 Firefox
riverctl map normal Alt D spawn discord               # 启动 Discord
riverctl map normal Alt M spawn thunderbird           # 启动 Thunderbird（邮件客户端）
riverctl map normal Alt E spawn dde-file-manager      # 启动文件管理器
riverctl map normal Alt O spawn code                  # 启动 VSCode
riverctl map normal Alt W spawn follow                # 启动 Follow（未明确应用）
riverctl map normal Alt S spawn steam                 # 启动 Steam（游戏平台）
riverctl map normal Alt T spawn telegram-desktop      # 启动 Telegram（桌面版）
riverctl map normal Alt V spawn vlc                   # 启动 VLC 播放器
riverctl map normal Alt B spawn WinBox                # 启动 WinBox（MikroTik 管理工具）
riverctl map normal Alt R spawn fluent-reader         # 启动 Fluent Reader（RSS 阅读器）
riverctl map normal Alt Y spawn '/home/j0han9/Application/siyuan-3.1.20-linux.AppImage'  # 启动思源笔记
riverctl map normal Alt P spawn okular                # 启动 Okular（PDF 阅读器）
# 设定特定应用在特定标签页（tag）启动
riverctl rule-add -app-id "firefox" tags 2  # Firefox 归类到标签 2
riverctl rule-add -app-id "fluent-reader" tags 256 # Fluent Reader 归类到标签 9
riverctl rule-add -app-id "thunderbird" tags 256 # Thunderbird 归类到标签 9
riverctl rule-add -app-id "discord" tags 256    # Discord 归类到标签 9
riverctl rule-add -app-id "google-chrome" tags 2   # Chrome 归类到标签 2
riverctl rule-add -app-id "Chromium" tags 2 # Chromium 归类到标签 2
riverctl rule-add -app-id "Code" tags 16 # VSCode 归类到标签 4
riverctl rule-add -app-id "org.telegram.desktop" tags 64 # Telegram 归类到标签 6
riverctl rule-add -app-id "Follow" tags 256 # Follow 归类到标签 9
riverctl rule-add -app-id "steam" tags 32 # Steam 归类到标签 9
# 禁用鼠标加速度
riverctl input "pointer-*" accel-profile flat
riverctl input "pointer-*" pointer-accel 0

# 启用 Keychron Q0 键盘事件
riverctl input "*Keychron_Q0*" events enabled

# 禁用 Keychron Q0/Q10 在输入时的 trackpoint 功能
riverctl input keyboard-13364-417-Keychron_Keychron_Q0 disable-while-trackpointing enabled
riverctl input keyboard-13364-417-Keychron_Keychron_Q0 disable-while-typing enabled
riverctl input keyboard-13364-417-Keychron_Keychron_Q10 disable-while-trackpointing enabled
riverctl input keyboard-13364-417-Keychron_Keychron_Q10 disable-while-typing enabled
# 设置光标主题为 Bibata-Modern-Ice，大小为 64
riverctl xcursor-theme Bibata-Modern-Ice 64
# Alt + Q 关闭当前窗口
riverctl map normal Alt Q close

# Alt + Shift + Q 退出 RiverWM
riverctl map normal Alt+Shift Q exit

# Alt + N/I 切换聚焦到下一个/上一个窗口
riverctl map normal Alt N focus-view next
riverctl map normal Alt I focus-view previous

# Alt + U/E 交换当前窗口和下一个/上一个窗口
riverctl map normal Alt U swap next
riverctl map normal Alt E swap previous
# Super + N/I 切换到下一个/上一个显示器
riverctl map normal Super N focus-output next
riverctl map normal Super I focus-output previous

# Super + Shift + N/I 将当前窗口发送到下一个/上一个显示器
riverctl map normal Super+Shift N send-to-output next
riverctl map normal Super+Shift I send-to-output previous
# 使用 Alt + 方向键 移动窗口 100 像素
riverctl map normal Super+Control N move left 100
riverctl map normal Super+Control E move down 100
riverctl map normal Super+Control U move up 100
riverctl map normal Super+Control I move right 100

# 使用 Alt + Shift + 方向键 将窗口对齐到屏幕边缘
riverctl map normal Alt+Shift N snap left
riverctl map normal Alt+Shift E snap down
riverctl map normal Alt+Shift U snap up
riverctl map normal Alt+Shift I snap right
# Alt + 左键拖拽窗口
riverctl map-pointer normal Alt BTN_LEFT move-view

# Alt + 右键调整窗口大小
riverctl map-pointer normal Alt BTN_RIGHT resize-view

# Alt + 中键切换窗口浮动状态
riverctl map-pointer normal Alt BTN_MIDDLE toggle-float
# Alt + [1-9] 切换标签（tag）
# Alt + Shift + [1-9] 将窗口分配到某个标签
# Alt + Control + [1-9] 切换当前聚焦标签
# Alt + Shift + Control + [1-9] 切换窗口的标签
for i in $(seq 1 9)
do
    tags=$((1 << ($i - 1)))
    riverctl map normal Alt $i set-focused-tags $tags
    riverctl map normal Alt+Shift $i set-view-tags $tags
    riverctl map normal Alt+Control $i toggle-focused-tags $tags
    riverctl map normal Alt+Shift+Control $i toggle-view-tags $tags
done

# XF86 音量和亮度键的功能绑定
for mode in normal locked
do
    riverctl map $mode None XF86AudioRaiseVolume spawn 'pamixer -i 5'
    riverctl map $mode None XF86AudioLowerVolume spawn 'pamixer -d 5'
    riverctl map $mode None XF86AudioMute spawn 'pamixer --toggle-mute'
    riverctl map $mode None XF86MonBrightnessUp spawn 'brightnessctl set +5%'
    riverctl map $mode None XF86MonBrightnessDown spawn 'brightnessctl set 5%-'
done

# 设置窗口背景色、边框颜色
riverctl background-color 0x002b36
riverctl border-color-focused 0x00FF00FF
riverctl border-color-unfocused 0x586e75
# 设置默认布局为 rivertile 并启动
riverctl default-layout rivertile
rivertile -view-padding 6 -outer-padding 6 &

