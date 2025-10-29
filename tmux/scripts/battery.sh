#!/usr/bin/env bash

# 跨平台电池状态检测 (macOS/Linux)
if [[ "$(uname)" == "Darwin" ]]; then
    battery_info=$(pmset -g batt)
    if [[ $battery_info =~ ([0-9]+)% ]]; then
        percent=${BASH_REMATCH[1]}
        if [[ $battery_info == *"discharging"* ]]; then
            status="↓"
            [ "$percent" -lt 20 ] && color="#[fg=#cc241d]"
        else
            status="↑"
            color="#[fg=#689d6a]"
        fi
        echo "#[fg=#1d2021,bg=#b16286]#[fg=#1d2021]${color}${status}${percent}% #[fg=#b16286,bg=#1d2021]"
    else
        echo ""
    fi
else
    # Linux sysfs检测
    if [ -d /sys/class/power_supply/BAT0 ]; then
        capacity=$(cat /sys/class/power_supply/BAT0/capacity)
        status=$(cat /sys/class/power_supply/BAT0/status)

        if [ "$status" = "Discharging" ]; then
            status="↓"
            [ "$capacity" -lt 20 ] && color="#[fg=#cc241d]"
        else
            status="↑"
            color="#[fg=#689d6a]"
        fi

        echo "#[fg=#1d2021,bg=#b16286]#[fg=#1d2021]${color}${status}${capacity}% #[fg=#b16286,bg=#1d2021]"
    else
        echo ""
    fi
fi
