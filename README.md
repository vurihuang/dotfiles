
# Setup

<!-- TOC Marked -->

* [font](#font)
    * [Install](#install)
* [nvim](#nvim)
    * [Install](#install)
    * [Alias](#alias)
* [tmux](#tmux)
    * [Install](#install)

<!-- /TOC -->

``` shell
cd ~ && git clone https://github.com/upeoe/dotfiles.git
```

## font

### Install

Ref: [nerd-fonts](https://github.com/ryanoasis/nerd-fonts)

``` bash
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# you should restart the terminal/iTerm2 to activate your nerd font at the Preferences > Profiles > Text.
```

## nvim

### Install

``` bash
mkdir ~/.config && ln -s ~/dotfiles/.nvim ~/.config/nvim
```

### Alias

Put these into your `.zshrc/.bash_profile/etc..` file:

``` bash
if type nvim > /dev/null 2>&1; then
  alias nvim="nvim"
  alias vi='nvim'
fi
```

## tmux

### Install

``` bash
ln -s ~/dotfiles/.tmux/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.tmux/.tmux.conf.local ~/.tmux.conf.local
```

