# Setup

``` shell
cd ~ && git clone https://github.com/upeoe/dotfiles.git
```

Putting the configuration into your `.zshrc`, `.bashrc`, etc.

## font

Ref: [nerd-fonts](https://github.com/ryanoasis/nerd-fonts)

```
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# you should restart the terminal/iTerm2 to activate your nerd font at the Preferences > Profiles > Text.
```

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
