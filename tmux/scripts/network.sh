#!/usr/bin/env bash

# 网络状态检测 (macOS/Linux)
if [[ "$(uname)" == "Darwin" ]]; then
    # macOS 实现
    wifi_name=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk -F: '/ SSID:/ {print $2}' | xargs)
    [ -z "$wifi_name" ] && wifi_name="Ethernet"
    echo "#[fg=#1d2021,bg=#8ec07c]#[fg=#1d2021]${wifi_name:0:10} #[fg=#8ec07c,bg=#1d2021]"
else
    # Linux 实现
    if command -v iwgetid &> /dev/null; then
        wifi_name=$(iwgetid -r)
        [ -z "$wifi_name" ] && wifi_name="Ethernet"
        echo "#[fg=#1d2021,bg=#8ec07c]#[fg=#1d2021]${wifi_name:0:10} #[fg=#8ec07c,bg=#1d2021]"
    else
        echo ""
    fi
fi
