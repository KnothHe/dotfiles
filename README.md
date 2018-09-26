# This is some of my config files

## tmux

### tmux configure

```sh
ln ./tmux/.tmux.conf ~/
```

### tmux-powerline configure

```sh
ln ./tmux/default.sh ~/.config/tmux/tmux-powerline/themes/
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
