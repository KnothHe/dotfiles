#!/bin/bash

function hardlink {
    local cfgFile="$cfgDir/$cfgName"
    if [ -e $cfgFile ]; then
        rm $cfgFile
    fi

    ln $dotFile $cfgFile
}

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
}

# proxychains
pc="proxychains"
if command -v proxychains >/dev/null 2>&1; then
    usePC="proxychains"
fi

# nvim

# init.vim
echo "----- Start configuring neovim -----"
cfgDir="$HOME/.config/nvim"
cfgName="init.vim"
dotFile="$(pwd)/nvim/init.vim"
$(softlink)

# plug.vim
cfgDir="$HOME/.local/share/nvim/site/autoload/"
cfgName="plug.vim"
dotFile="$(pwd)/nvim/plug.vim"
$(hardlink)

echo "***** Neovim configuration is completed *****"

# tmux

echo "----- Start configuring tmux -----"

# tmux.conf
tmuxCfgFile="$HOME/.tmux.conf"
if [ -e tmuxCfgFile ]; then
    rm $tmuxCfgFile
    ln -s $(pwd)/tmux/.tmux.conf $tmuxCfgFile
fi

# tmux-powerline
tmuxPlThemeCfgDir="$HOME/.config/tmux/tmux-powerline/themes"
tmuxPlThemeCfgFile=$tmuxPlThemeCfgDir/default.sh
tmuxPlThemeDotfile=$(pwd)/tmux/default.sh
if command -v git >/dev/null 2>&1; then
    if [ ! -e $tmuxPlThemeCfgFile ]; then
        $usePC git clone https://github.com/erikw/tmux-powerline.git \
            ~/.config/tmux/tmux-powerline
    fi
    if [ -e $tmuxPlThemeCfgFile ]; then
        rm $tmuxPlThemeCfgFile
    fi
    ln -s $tmuxPlThemeDotfile $tmuxPlThemeCfgFile
fi

echo "***** Tmux configuration is completed *****"

# oh-my-zsh

echo "----- Start configuring oh-my-zsh -----"

# .zshrc
cfgName=".zshrc"
cfgDir="$HOME"
dotFile="$(pwd)/zsh/.zshrc"
$(softlink)

# theme

cfgName="nametime.zsh-theme"
cfgDir="$HOME/.oh-my-zsh/custom/themes"
dotFile="$(pwd)/zsh/nametime.zsh-theme"
$(softlink)

echo "***** Oh-my-zsh configuration is completed *****"

# i3wm

echo "----- Start configuring i3wm -----"

# i3wm config

cfgName="config"
cfgDir="$HOME/.config/i3"
dotFile="$(pwd)/i3wm/i3/config"
$(softlink)

# scripts
cfgDir="$HOME/bin"
cfgName=i3exit.sh
dotFile=$(pwd)/i3wm/i3/i3exit.sh
$(softlink)

# polybar config
cfgDir="$HOME/.config/polybar"
cfgName="config"
dotFile="$(pwd)/i3wm/polybar/config"
$(softlink)

# polybar launch.sh
cfgDir="$HOME/.config/polybar"
cfgName="launch.sh"
dotFile="$(pwd)/i3wm/polybar/launch.sh"
$(softlink)

# .Xmodmap
cfgDir="$HOME"
cfgName="$.Xmodmap"
dotFile="$(pwd)/i3wm/.Xmodmap"
$(softlink)

# compton.conf
cfgDir="$HOME/.config"
cfgName="compton.conf"
dotFile="$(pwd)/i3wm/compton.conf"
$(softlink)

# dunstrc
cfgDir="$HOME/.config/dunst"
cfgName="dunstrc"
dotFile="$(pwd)/i3wm/dunstrc"
$(softlink)

# .profile
cfgDir="$HOME"
cfgName=".profile"
dotFile="$(pwd)/i3wm/.profile"
$(softlink)

echo "***** i3wm configuration is completed *****"

# misc

# .dir_colors
cfgDir="$HOME"
cfgName=".dir_colors"
dotFile="$(pwd)/misc/.dir_colors"
$(softlink)
