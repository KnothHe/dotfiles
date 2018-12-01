#!/bin/bash

# if config directory is not exist, creat this directory.
# if config file has already exist, rename it as origName.orgi.
# finally create softlink of config file.
function softlink {
    local cfgFile="$cfgDir/$cfgName"
    if [ -e $cfgFile -a ! -L $cfgFile ]; then
        mv $cfgFile $cfgFile.orgi
    fi
    if [ ! -d $cfgDir ]; then
        mkdir -p $cfgDir
    elif [ -L $cfgFile ]; then
        rm $cfgFile
    fi

    ln -s $dotFile $cfgFile

    return 0
}

cfgDirs=(   "$HOME/.config/nvim" \
            "$HOME/.local/share/nvim/site/autoload" \
            "$HOME" \
            "$HOME/.config/tmux/tmux-powerline/themes" \
            "$HOME" \
            "$HOME/.oh-my-zsh/custom/themes" \
            "$HOME/.config/i3" \
            "$HOME/bin" \
            "$HOME/.config/polybar" \
            "$HOME/.config/polybar" \
            "$HOME/bin" \
            "$HOME" \
            "$HOME/.config" \
            "$HOME/.config/dunst" \
            "$HOME" \
            "$HOME/.config" \
            "$HOME" \
)

cfgNames=(  "init.vim" \
            "plug.vim" \
            ".tmux.conf" \
            "default.sh" \
            ".zshrc" \
            "nametime.zsh-theme" \
            "config" \
            "i3exit" \
            "config" \
            "launch.sh" \
            "toggle_polybar.sh" \
            ".Xmodmap" \
            "compton.conf" \
            "dunstrc" \
            ".profile" \
            "i3-scrot.conf" \
            ".dir_colors" \
)

dotFiles=(  "nvim/init.vim" \
            "nvim/plug.vim" \
            "tmux/tmux.conf" \
            "tmux/default.sh" \
            "zsh/zshrc" \
            "zsh/nametime.zsh-theme" \
            "i3wm/i3/config" \
            "i3wm/i3/i3exit.sh" \
            "i3wm/polybar/config" \
            "i3wm/polybar/launch.sh" \
            "i3wm/polybar/toggle_polybar.sh"
            "i3wm/Xmodmap" \
            "i3wm/compton.conf" \
            "i3wm/dunstrc" \
            "i3wm/profile" \
            "i3wm/i3-scrot.conf" \
            "dir_colors" \
)

for i in "${!cfgDirs[@]}";
do
    cfgDir="${cfgDirs[$i]}"
    cfgName="${cfgNames[$i]}"
    dotFile="$(pwd)/${dotFiles[$i]}"

    softlink

    echo -en "\E[41m\E[37m$cfgDir/$cfgName\E(B\E[m"
    echo -en "\E[32m and \E(B\E[m"
    echo -en "\E[43m\E[30m$dotFile\E(B\E[m"
    echo ""
done
