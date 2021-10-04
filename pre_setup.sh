#!/usr/bin/env bash

function ensure_brew_installed() {
    if [ -z $(brew list | grep $1) ]
    then
        echo "starting install $1"
        brew install $1
    fi
}
