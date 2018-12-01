# There are some of my config files

## tmux

### tmux configure

```sh
ln ./tmux/.tmux.conf ~/
```

### tmux-powerline configure

```sh
git clone https://github.com/erikw/tmux-powerline.git ~/.config/tmux/
ln ./tmux/default.sh ~/.config/tmux/tmux-powerline/themes/
```

### install powerline

```sh
pip install --user powerline-status
```

## zsh and oh-my-zsh

### install zsh

```sh
sudo apt install zsh
```

### install oh-my-zsh

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### configure

```sh
ln ./zsh/.zshrc ~/
```

#### theme

```sh
ln ./zsh/nametime.zsh-theme ~/.oh-my-zsh/custom/themes/
```

#### plugins

- zsh-syntax-highlighting
```sh
https://github.com/zsh-users/zsh-syntax-highlighting.git
```
- zsh-autosuggestions
```sh
https://github.com/zsh-users/zsh-autosuggestions.git
```

move these folders into ~/.oh-my-zsh/custom/plugins/

## misc

### proxychains-ng

#### download

```sh
git clone https://github.com/rofl0r/proxychains-ng
```

#### build and install

``` sh
./configure --prefix=/usr --sysconfdir=/etc
make
sudo make install
sudo make install-config
```

[tips] maybe need install gcc and build-essential

#### configure

```sh
ln ./misc/proxychains4.conf /etc/
```

### shell color

```sh
ln ./misc/.dir_colors ~/
```

## i3wm

### Files

```
~/.config/polybar/launch.sh
~/.config/polybar/config
~/.profile
~/.Xmodmap
# ~/.i3status.conf
~/.config/i3/config
/etc/X11/xorg.conf.d/30-touchpad.conf
~/bin/i3exit.sh
~/.config/dunst/dunstrc
~/.config/compton.conf
```

### Install

```
dunst
flameshot
polybar
i3-manjaro
i3-gaps
compton
ttf-font-awesome
rofi
feh
ristretto
calibre
xorg-xbacklight
```

- rofi theme

```sh
rofi-theme-selector
```

## Theme

### Icon theme

Papirus-Dark

### window theme

Arc-Dark

### Cursor theme

breeze

## Packages

- pacman

```
shadowsocks
yay
arc-gtk-theme
noto-fonts
noto-fonts-cjk
noto-fonts-emoji
adobe-source-code-pro
google-chrome
fzf
tldr
texlive-most
texlive-lang
neovim
qtcreator
visual-studio-code-bin
dropbox
emacs
intellij-idea-community-edition
pycharm-community-edition
```

## Github Packages

```
https://github.com/arcticicestudio/nord-xfce-terminal.git
run ./install.sh
```

## nvm

- install

    nvm

- command

``` sh
nvm ls-remote
nvm install -v 10
```

## grub

- [link](https://www.gnome-look.org/browse/cat/109/)

- choose blur grub

```sh
./install.sh
sudo update-grub
```

## fcitx

### install

- install
    - fcitx-im
    - fcitx-rime
    - fcitx-configtool

- skin

```sh
git clone https://github.com/fcitx/fcitx-artwork
cd fcitx-artwork
cp -r skin ~/.config/fcitx/
```

## docker

```sh
sudo usermod -aG docker your_username 
```
