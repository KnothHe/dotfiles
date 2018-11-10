# Install neovim

## [Ubuntu](https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu)

```sh
# install latest stable neovim
sudo apt-add-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install neovim
```

## [Others](https://github.com/neovim/neovim/wiki/Installing-Neovim)

# Configure

```sh
# init.vim
ln ./.init.vim ~/.config/nvim/init.vim
```

# Install [vim-plug](https://github.com/junegunn/vim-plug)

## Neovim (*nix)

```sh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Install other plugins

open nvim and run `:PlugInstall`.

# Add python and python3 support

```sh
# ubuntu
sudo apt install python-neovim
sudo apt install python3-neovim
# others
sudo pip install neovim
sudo pip3 install neovim
```

# Misc

open nvim and run `checkhealth` to get help.

# ~~Install [dein.vim](https://github.com/Shougo/dein.vim)~~

```sh
# I just found that dein.vim has no description for install on windows,
# and surly I don't use vim on windows, while I use window. I use wsl.
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
```

## ~~Install other plugins~~

open nvim and run `:call dein#install()`.
