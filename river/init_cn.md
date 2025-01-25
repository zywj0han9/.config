#!/bin/sh

# 这是 River 的示例配置文件。
#
# 如果您想修改此文件，请先将其复制到 $XDG_CONFIG_HOME/river/init 或 $HOME/.config/river/init。
#
# 有关完整文档，请参阅 river(1)、riverctl(1) 和 rivertile(1) 手册页。

# 注意："Super" 键也被称为 Logo、GUI、Windows、Mod4 等。

# 使用 Alt+Shift+Return 启动 foot 终端（https://codeberg.org/dnkl/foot）
riverctl map normal Alt Return spawn konsole

# 用户快捷方式设置
## 启动 Chrome
riverctl map normal Alt C spawn google-chrome-stable
riverctl map normal Alt X spawn firefox
riverctl map normal Alt D spawn discord
riverctl map normal Alt E spawn thunderbird

# 自动启动程序
riverctl spawn "/home/j0han9/.config/river/autostart.sh"

# 使用 Alt+Q 关闭当前窗口
riverctl map normal Alt Q close

# 使用 Alt+Shift+Q 退出 River
riverctl map normal Alt+Shift Q exit

# 使用 Alt+J 和 Alt+K 在布局栈中切换到下一个/上一个窗口
riverctl map normal Alt J focus-view next
riverctl map normal Alt L focus-view previous

# 使用 Alt+Shift+J 和 Alt+Shift+K 在布局栈中交换当前窗口与下一个/上一个窗口
riverctl map normal Alt K swap next
riverctl map normal Alt I swap previous

# 使用 Super+J 和 Super+L 切换到下一个/上一个输出屏幕
#riverctl map normal Super J focus-output next
#riverctl map normal Super L focus-output previous

# 使用 Super+Shift+{J, L} 将当前窗口发送到下一个/上一个输出屏幕
riverctl map normal Super I send-to-output next
riverctl map normal Super K send-to-output previous

# 使用 Alt+Shift+Return 将当前窗口置顶
riverctl map normal Alt+Shift Return zoom

# 使用 Super+J 和 Super+L 调整 rivertile 主区域比例
riverctl map normal Super J send-layout-cmd rivertile "main-ratio -0.05"
riverctl map normal Super L send-layout-cmd rivertile "main-ratio +0.05"

# 使用 Super+Alt+Control+J 和 Super+Alt+Control+L 增加/减少 rivertile 主区域窗口数量
riverctl map normal Super+Alt+Control J send-layout-cmd rivertile "main-count +1"
riverctl map normal Super+Alt+Control L send-layout-cmd rivertile "main-count -1"

# 使用 Super+Alt+{J,K,I,L} 移动窗口
riverctl map normal Super+Control J move left 100
riverctl map normal Super+Control K move down 100
riverctl map normal Super+Control I move up 100
riverctl map normal Super+Control L move right 100

# 使用 Alt+Shift+{J,K,I,L} 将窗口对齐到屏幕边缘
riverctl map normal Alt+Shift J snap left
riverctl map normal Alt+Shift K snap down
riverctl map normal Alt+Shift I snap up
riverctl map normal Alt+Shift L snap right

# 使用 Alt+Control+{J,K,I,L} 调整窗口大小
riverctl map normal Alt+Control J resize horizontal -100
riverctl map normal Alt+Control K resize vertical 100
riverctl map normal Alt+Control I resize vertical -100
riverctl map normal Alt+Control L resize horizontal 100

# 使用 Super + 左键移动窗口
riverctl map-pointer normal Alt BTN_LEFT move-view

# 使用 Super + 右键调整窗口大小
riverctl map-pointer normal Alt BTN_RIGHT resize-view

# 使用 Super + 中键切换浮动模式
riverctl map-pointer normal Alt BTN_MIDDLE toggle-float

# 设置标签 1 至 5
riverctl tag 1
riverctl tag 2
riverctl tag 3
riverctl tag 4
riverctl tag 5

# 为每个标签设置快捷方式
for i in $(seq 1 9)
do
    tags=$((1 << ($i - 1)))

    # 使用 Alt+[1-9] 切换到对应标签
    riverctl map normal Alt $i set-focused-tags $tags

    # 使用 Alt+Shift+[1-9] 将当前窗口标记为对应标签
    riverctl map normal Alt+Shift $i set-view-tags $tags

    # 使用 Alt+Control+[1-9] 切换标签焦点
    riverctl map normal Alt+Control $i toggle-focused-tags $tags

    # 使用 Alt+Shift+Control+[1-9] 切换当前窗口的标签
    riverctl map normal Alt+Shift+Control $i toggle-view-tags $tags
done

# 使用 Alt+0 切换到所有标签
# 使用 Alt+Shift+0 将当前窗口标记为所有标签
all_tags=$(((1 << 32) - 1))
riverctl map normal Alt 0 set-focused-tags $all_tags
riverctl map normal Alt+Shift 0 set-view-tags $all_tags

# 使用 Alt+Space 切换浮动模式
riverctl map normal Alt Space toggle-float

# 使用 Alt+F 切换全屏模式
riverctl map normal Alt F toggle-fullscreen

# 使用 Alt+方向键更改布局方向
riverctl map normal Alt Up    send-layout-cmd rivertile "main-location top"
riverctl map normal Alt Right send-layout-cmd rivertile "main-location right"
riverctl map normal Alt Down  send-layout-cmd rivertile "main-location bottom"
riverctl map normal Alt Left  send-layout-cmd rivertile "main-location left"

# 声明 passthrough 模式，仅允许返回 normal 模式
riverctl declare-mode passthrough

# 使用 Alt+F11 进入 passthrough 模式
riverctl map normal Alt F11 enter-mode passthrough

# 使用 Alt+F11 返回 normal 模式
riverctl map passthrough Alt F11 enter-mode normal

# 为 normal 和 locked 模式设置媒体键映射
for mode in normal locked
do
    # 弹出光驱（如果存在）
    riverctl map $mode None XF86Eject spawn 'eject -T'

    # 使用 pamixer 调节音量（https://github.com/cdemoulins/pamixer）
    riverctl map $mode None XF86AudioRaiseVolume  spawn 'pamixer -i 5'
    riverctl map $mode None XF86AudioLowerVolume  spawn 'pamixer -d 5'
    riverctl map $mode None XF86AudioMute         spawn 'pamixer --toggle-mute'

    # 使用 playerctl 控制媒体播放器（https://github.com/altdesktop/playerctl）
    riverctl map $mode None XF86AudioMedia spawn 'playerctl play-pause'
    riverctl map $mode None XF86AudioPlay  spawn 'playerctl play-pause'
    riverctl map $mode None XF86AudioPrev  spawn 'playerctl previous'
    riverctl map $mode None XF86AudioNext  spawn 'playerctl next'

    # 使用 brightnessctl 调节屏幕亮度（https://github.com/Hummer12007/brightnessctl）
    riverctl map $mode None XF86MonBrightnessUp   spawn 'brightnessctl set +5%'
    riverctl map $mode None XF86MonBrightnessDown spawn 'brightnessctl set 5%-'
done

# 设置背景颜色和边框颜色
riverctl background-color 0x002b36
riverctl border-color-focused 0x93a1a1
riverctl border-color-unfocused 0x586e75

# 设置键盘重复速率
riverctl set-repeat 50 300

# 设置规则：使 app-id 以“float”开头且标题为“foo”的所有窗口浮动
riverctl rule-add -app-id 'float*' -title 'foo' float

# 设置规则：使 app-id 为“bar”的所有窗口使用客户端装饰
riverctl rule-add -app-id "bar" csd

# 设置默认布局生成器为 rivertile 并启动它
# 当退出时，River 将向 init 可执行文件的进程组发送 SIGTERM 信号
riverctl default-layout rivertile
rivertile -view-padding 6 -outer-padding 6 &

