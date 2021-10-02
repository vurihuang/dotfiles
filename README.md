# Setup

``` shell
cd ~ && git clone https://github.com/upeoe/dotfiles.git
```

Putting the configuration into your `.zshrc`, `.bashrc`, etc.

## nvim

### Install

```
$ mkdir ~/.config && ln -s ~/dotfiles/.nvim ~/.config/nvim
```

### Configure

``` shell
if type nvim > /dev/null 2>&1; then
  alias nvim="nvim -u $HOME/.config/nvim/init.vim"
  alias vi='nvim'
fi
```

## tmux

### Install

``` shell
ln -s ~/dotfiles/.tmux/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.tmux/.tmux.conf.local ~/.tmux.conf.local
```
