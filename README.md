# This is some of my config files

## shell color

```sh
ln dir_colors ~/
```

## proxychains-ng

### download

```sh
git clone https://github.com/rofl0r/proxychains-ng
```

### build and install

``` sh
./configure --prefix=/usr --sysconfdir=/etc
make 
sudo make install
sudo make install-config
```

[tips] maybe need install gcc and build-essential

### configure

```sh
ln proxychains4.conf /etc/
```

## tmux

```sh
ln .tmux.conf ~/
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
ln .zshrc ~/
```

#### theme

```sh
ln wedisagree.zsh-theme ~/.oh-my-zsh/custom/themes/
```

#### plugins

- zsh-completions 
```sh
git clone https://github.com/zsh-users/zsh-completions.git
```
- zsh-syntax-highlighting
```sh
https://github.com/zsh-users/zsh-syntax-highlighting.git
```
- zsh-autosuggestions
```sh
https://github.com/zsh-users/zsh-autosuggestions.git
```

move these folders into ~/.oh-my-zsh/custom/plugins/

## nvim

### configure

```sh
ln .vimrc ~/
ln .init.vim ~/.config/nvim/
```

### themes

```sh
ln molokai.vim ~/.vim/colors/
```

### install dein.vim

```sh
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
```

### install other plugins

open nvim and `:call dein#install()`

