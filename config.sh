#!/bin/bash

# proxychains
pc="proxychains"
if command -v proxychains >/dev/null 2>&1; then
    usePC="proxychains"
fi

# nvim

# init.vim
echo "----- Start configuring neovim -----"
nvCfgDir="$HOME/.config/nvim"
nvCfgFile="$nvCfgDir/init.vim"
nvDotfile="$(pwd)/nvim/init.vim"
if [[ -e "$nvCfgFile" && ! -L "$nvCfgFile" ]]; then
    mv $nvCfgFile $nvCfgDir/init.vim.orgi
fi
if [ ! -d "$nvCfgDir" ]; then
    mkdir -p "$nvCfgDir"
elif [ -L "$nvCfgFile" ]; then
    rm "$nvCfgFile"
fi
ln -s "$nvDotfile" "$nvCfgFile"

# plug.vim
vimplugDir="$HOME/.local/share/nvim/site/autoload/"
vimplugFile="$vimplugDir/plug.vim"
vimplugDotfile="$(pwd)/nvim/plug.vim"
if [[ -e "$vimplugFile" && ! -L "$vimplugFile" ]]; then
    mv $vimplugFile $vimplugDir/init.vim.orgi
fi
if [ ! -d "$vimplugDir" ]; then
    mkdir -p "$vimplugDir"
elif [ -L "$vimplugFile" ]; then
    rm "$vimplugFile"
fi
ln -s "$vimplugDotfile" "$vimplugFile"

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
zshCfgName=".zshrc"
zshCfgDir="$HOME"
zshCfgFile="$zshCfgDir/.zshrc"
zshDotFile="$(pwd)/zsh/.zshrc"
if [[ -e $zshCfgFile && ! -L $zshCfgFile ]]; then
    mv $zshCfgFile $zshCfgDir/$zshCfgName.orig
elif [ -L $zshCfgFile ]; then
    rm $zshCfgFile
fi
ln -s $zshDotFile $zshCfgFile

# theme

zshThemeCfgName="nametime.zsh-theme"
zshThemeCfgDir="$HOME/.oh-my-zsh/custom/themes"
zshThemeCfgFile="$zshThemeCfgDir/$zshThemeCfgName"
echo $zshThemeCfgFile
zshThemeDotfile="$(pwd)/zsh/nametime.zsh-theme"
if [[ -e $zshThemeCfgFile && ! -L $zshThemeCfgFile ]]; then
    mv $zshThemeCfgFile $zshThemeCfgFile.orig
elif [ -L $zshThemeCfgFile ]; then
    rm $zshThemeCfgFile
fi
ln -s $zshThemeDotfile $zshThemeCfgFile

echo "***** Oh-my-zsh configuration is completed *****"

# i3wm

echo "----- Start configuring i3wm -----"

# i3wm config

i3wmCfgFile="$HOME/.config/i3/config"
i3wmDotfile="$(pwd)/i3wm/i3/config"
if [[ -e $i3wmCfgFile && ! -L $i3wmCfgFile ]]; then
    mv $i3wmCfgFile $i3wmCfgFile.orig
fi
if [ -L $i3wmCfgFile ]; then
    rm $i3wmCfgFile
fi
ln -s $i3wmDotfile $i3wmCfgFile

# scripts
scrDir="$HOME/bin"
if [ ! -d $scrDir ]; then
    mkdir -p $scrDir
fi

scr01=$scrDir/i3exit.sh
dot01=$(pwd)/i3wm/i3/i3exit.sh
if [[ -e $scr01 && ! -L $scr01 ]]; then
    mv $scr01 $scr01.orig
fi
if [ -L $scr01 ]; then
    rm $scr01
fi
ln -s $dot01 $scr01

# polybar config
pbCfgFile="$HOME/.config/polybar/config"
pbDotfile="$(pwd)/i3wm/polybar/config"
if [[ -e $pbCfgFile && ! -L $pbCfgFile ]]; then
    mv $pbCfgFile $pbCfgFile.orig
fi
if [ -L $pbCfgFile ]; then
    rm $pbCfgFile
fi
ln -s $pbDotfile $pbCfgFile

# polybar launch.sh
pbLaunchCfgFile="$HOME/.config/polybar/launch.sh"
pbLaunchDotfile="$(pwd)/i3wm/polybar/launch.sh"
if [[ -e $pbLaunchCfgFile && ! -L $pbLaunchCfgFile ]]; then
    mv $pbLaunchCfgFile $pbLaunchCfgFile.orig
fi
if [ -L $pbLaunchCfgFile ]; then
    rm $pbLaunchCfgFile
fi
ln -s $pbLaunchDotfile $pbLaunchCfgFile

# .Xmodmap
xmodmapLaunchCfgFile="$HOME/.Xmodmap"
xmodmapLaunchDotfile="$(pwd)/i3wm/.Xmodmap"
if [[ -e $xmodmapLaunchCfgFile && ! -L $xmodmapLaunchCfgFile ]]; then
    mv $xmodmapLaunchCfgFile $xmodmapLaunchCfgFile.orig
fi
if [ -L $xmodmapLaunchCfgFile ]; then
    rm $xmodmapLaunchCfgFile
fi
ln -s $xmodmapLaunchDotfile $xmodmapLaunchCfgFile

echo "***** Oh-my-zsh configuration is completed *****"
