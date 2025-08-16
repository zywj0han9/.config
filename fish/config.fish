alias sudo "sudo -E"
alias c clear
alias l "ls -la"
alias q exit
alias pf poweroff
alias rb reboot
alias yz yazi
alias nf neofetch
alias gc "git clone"
alias nas "cd /mnt/NAS"
alias find "sudo find / -name "

###################################
###         Gaming Mode
###################################
alias gamemode "riverctl set-repeat 75 200"
alias normalmode "riverctl set-repeat 45 200"

###################################
###         Greet Config		###
###################################
function fish_greeting
	fastfetch
end

###################################
###         EDITOR
###################################
set -gx EDITOR nvim
set -gx VISUAL nvim

###################################
###         obs
###################################
#set -x XDG_CURRENT_DESKTOP river
#set -x XDG_CURRENT_DESKTOP hyprland
#set -x XDG_SESSION_DESKTOP sway
set -x XDG_SESSION_DESKTOP hyprland
set -x QT_QPA_PLATFORM wayland
set -x SDL_VIDEODRIVER wayland
set -x SDL_VIDEODRIVER hyprland
set -x MOZ_ENABLE_WAYLAND 1
set -x QT_QPA_PLATFORM "wayland;xcb"

###################################
###         Nvidia
###################################
set -gx GBM_BACKEND nvidia-drm
set -gx __GLX_VENDOR_LIBRARY_NAME nvidia

###################################
###         Clamav
###################################

###################################
###         color
###################################
set -gx MESA_GL_VERSION_OVERRIDE 4.5
set -gx WLR_RENDERER_ALLOW_SOFTWARE 1

###################################
###         DPI
###################################
#set -gx GDK_SCALE 1.5
#set -gx GDK_DPI_SCALE 1.5
#set -gx QT_SCALE_FACTOR 1.5
#set -gx QT_DPI_SCALE 1.5
#set -gx XDG_SESSION_TYPE wayland
#set -x WLR_NO_HARDWARE_CURSORS 1

###################################
###         Local Config		###
###################################
set -x LANG zh_CN.UTF-8
#set -x LANG en_US.UTF-8
set -x LANGUAGE zh_CN:en_US

###################################
###         Fcitx Config		###
###################################
set -x QT_IM_MODULE fcitx
set -x XMODIFIERS "@im=fcitx"
set -x INPUT_METHOD fcitx
set -x SDL_IM_MODULE fcitx
set -x GLFW_IM_MODULE fcitx
#set -x GTK_IM_MODULE fcitx

###################################
###	         Fonts Path		    ###
###################################
set -x FONTCONFIG_PATH "/usr/share/fontcontig"

###################################
###	        Lazygit Config		###
###################################
alias lg lazygit
###################################
###         JAVA Config		    ###
###################################
set -x java17 "/usr/lib/jvm/java-17-openjdk/bin/java"

###################################
###         File Config		    ###
###################################
alias fishc "nvim ~/.config/fish/config.fish"
alias fishs "source ~/.config/fish/config.fish"
alias nvimc "nvim ~/.config/nvim/lua/config/core/init.lua"
alias i3c "nvim ~/.i3/config"
alias github "cd ~/Documents/Github/ && c && l"
alias gitlab "cd ~/Documents/Github/j0han9/lab/ && c && l"
alias Application "cd ~/Application/"
alias Game "cd ~/Game/"
alias File "cd ~/Documents"

###################################
###         NPM Config		    ###
###################################
set -x NPM_PACKAGES "$HOME/.npm-packages"
set -x NODE_PATH "$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
set -x N_PREFIX "$NPM_PACKAGES"
set -x PATH "$NPM_PACKAGES/lib/node_modules/n/bin" \
            "$NPM_PACKAGES/bin" \
            /usr/local/bin \
            $PATH
###################################
###	        River Config		###
###################################
alias riverc "nvim ~/.config/river/init"
alias riverkey "nvim ~/.config/river/keymap"
alias riverauto "nvim ~/.config/river/autostart"

###################################
###         Rust
###################################
set -U fish_user_paths $HOME/.local/share/gem/ruby/3.3.0/bin $fish_user_paths

###################################
###         Arch Config		###
###################################
alias install "sudo pacman -S"
alias update "sudo pacman -Sy"
alias remove "sudo pacman -Rnc"
alias upgrade "sudo pacman -Syyu"
alias search "sudo pacman -Ss"
alias list "sudo pacman -Q"

###################################
###         Hyprland            ###
###################################
set -gx AQ_DRM_DEVICES /dev/dri/card1:/dev/dri/card0

###################################
###	        Ubuntu Config		###
###################################
# alias install "sudo apt-get install -y"
# alias update "sudo apt-get update -y && sudo apt-get upgrade -y"
# alias remove "sudo apt-get remove"

###################################
###         StarShip Config		###
###################################
set -x STARSHIP_CONFIG ~/.config/fish/theme/starship.toml

starship init fish | source


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f $HOME/anaconda3/bin/conda
    eval $HOME/anaconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "$HOME/anaconda3/etc/fish/conf.d/conda.fish"
        . "$HOME/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "$HOME/anaconda3/bin" $PATH
        end
end

