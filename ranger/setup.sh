#!/usr/bin/env bash
__dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$__dirname/../pre_setup.sh"

ensure_brew_installed ranger
ensure_brew_installed trash-cli

if [ ! -z "$(brew list | grep font-hack-nerd-font)" ];
then
    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font
fi
