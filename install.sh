#!/bin/bash

##########################################
#  _           _        _ _       _      #
# (_)_ __  ___| |_ __ _| | |  ___| |__   #
# | | '_ \/ __| __/ _` | | | / __| '_ \  #
# | | | | \__ \ || (_| | | |_\__ \ | | | #
# |_|_| |_|___/\__\__,_|_|_(_)___/_| |_| #
#                                        #
#               guanglaihe@gmail.com     #
#               use pacman in Manjaro    #
#               Create: 2018-11-29       #
#               Update: 2018-11-29       #
##########################################

common=(    'shadowsocks' \
            'yay' \
            'arc-gtk-theme' \
            'noto-fonts' \
            'noto-fonts-cjk' \
            'noto-fonts-emoji' \
            'adobe-source-code-pro-fonts'\
            'google-chrome' \
            'fzf' \
            'neovim' \
            'qtcreator' \
            'visual-studio-code-bin' \
            'dropbox' \
            'emacs' \
            'intellij-idea-community-edition' \
            'pycharm-community-edition' \
            'tldr' \
            'ristretto' \
            'flameshot' \
)

i3=(    'dunst' \
        'polybar' \
        'ttf-font-awesome' \
        'rofi' \
        'feh' \
        'xorg-xbacklight' \
        'i3-gaps' \
        'i3-wm' \
        'i3blocks' \
        'i3lock' \
        'xdo' \
        'i3-scrot'
)

pacin='sudo pacman -S'
ins=$pacin
# 'texlive-most' 'texlive-lang' \

function pacman_install {
    if pacman -Qi $package > /dev/null 2>&1; then
        echo "$package has been installed"
    else 
        yes | $ins $package
        echo "$package installation is completed"
    fi
}

read -p "Install common packages [Y/n] ? " ans

case $ans in
#Install
Y)
    for package in ${common[@]};
    do
        pacman_install
    done
;;
*)
    echo "Do nothing"
;;
esac

read -p "Install i3 packages [Y/n] ? " ans

case $ans in
#Install
Y)
    for package in ${i3[@]};
    do
        pacman_install
    done
;;
*)
    echo "Do nothing"
;;
esac

