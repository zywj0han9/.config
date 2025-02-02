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
###         Lazy Git
###################################
alias lg lazygit

###################################
###         Clamav
###################################

###################################
###         color
###################################
set -gx MESA_GL_VERSION_OVERRIDE 4.5
set -gx WLR_RENDERER_ALLOW_SOFTWARE 1
###################################
###         Cursor
###################################
#set -gx XCURSOR_SIZE 32
###################################
###         DPI
###################################
set -gx GDK_SCALE 1.5
set -gx GDK_DPI_SCALE 1.5
set -gx QT_SCALE_FACTOR 1.5
set -gx QT_DPI_SCALE 1.5
set -gx XCURSOR_SIZE 32
set -gx XDG_SESSION_TYPE wayland

###################################
###         Local Config		###
###################################
set -x LANG zh_CN.UTF-8
set -x LANGUAGE zh_CN:en_US

###################################
###         Fcitx Config		###
###################################
set -x QT_IM_MODULE fcitx5
set -x XMODIFIERS "@im=fcitx5"
set -x INPUT_METHOD fcitx5
set -x SDL_IM_MODULE fcitx5
set -x GLFW_IM_MODULE ibus

###################################
###	         Fonts Path		    ###
###################################
set -x FONTCONFIG_PATH "/usr/share/fontcontig"

###################################
###	          QT Config		    ###
###################################
#set -x QT_LOGGING_RULES "*.debug=false;*.info=false;*.warning=true"

###################################
###	         Bash               ###
###################################
#source ~/.bashrc

###################################
###	        Gitlab Config		###
###################################

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
alias github "cd ~/Documents/Github/"
alias Application "cd ~/Application/"
alias Game "cd ~/Game/"
alias File "cd ~/Documents"

###################################
###         NPM Config		    ###
###################################
set -x NPM_PACKAGES "~/.npm-packages"
set -x NODE_PATH "$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
set -x PATH "$NPM_PACKAGES/bin:$PATH"
set -x PATH /usr/local/bin/ $PATH

###################################
###	        River Config		###
###################################
alias riverc "nvim ~/.config/river/init"
alias riverkey "nvim ~/.config/river/keymap"
alias riverauto "nvim ~/.config/river/autostart"

###################################
###         Arch Config		###
###################################
alias install "sudo pacman -S"
alias update "sudo pacman -Syyu"
alias remove "sudo pacman -Rs"
alias search "sudo pacman -Ss"
alias list "sudo pacman -Q"

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
if test -f /home/j0han9/anaconda3/bin/conda
    eval /home/j0han9/anaconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/j0han9/anaconda3/etc/fish/conf.d/conda.fish"
        . "/home/j0han9/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/j0han9/anaconda3/bin" $PATH
        end
end

