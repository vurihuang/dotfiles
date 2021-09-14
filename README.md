# Setup

``` shell
cd ~ && git clone git@github.com:upeoe/dotfiles.git
```

Putting the configuration into your `.zshrc`, `.bashrc`, etc.

## nvim

### Install

```
$ ln -s ~/dotfiles/.nvim ~/.nvim
```

### Configure

``` shell
alias nvim="nvim -u $HOME/.nvim/init.vim"
if type nvim > /dev/null 2>&1; then
  alias vi='nvim'
fi
```

## tmux

### Install

``` shell
ln -s ~/dotfiles/.tmux/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.tmux/.tmux.conf.local ~/.tmux.conf.local
```
