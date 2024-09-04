#!/usr/bin/env bash
# Install script
# Warning: this will erase any files in that location

# If we're running on Windows, do it with CMD instead
if [ "$OS" = "Windows_NT" ]; then
    # Requires gsudo to be installed (for now)
    # For some reason, cmd won't run the script directly, so I need to use
    # start, which conflicts with https://stackoverflow.com/a/48303613/6335363
    # God, Windows is horribly confusing sometimes
    sudo start install.bat
    exit $?
fi

# Bash stuff
ln -sf ~/.dotfiles/bashrc            ~/.bashrc
ln -sf ~/.dotfiles/inputrc           ~/.inputrc

# Zsh stuff
ln -sf ~/.dotfiles/zshrc             ~/.zshrc

# SSH config
mkdir -p ~/.ssh
ln -sf ~/.dotfiles/ssh-config        ~/.ssh/config

# Git config
ln -sf ~/.dotfiles/dot.gitconfig     ~/.gitconfig

# Only on linux
if [[ $OSTYPE == 'linux'* ]]; then
    # RmView shortcut
    mkdir -p ~/.local/share/applications/
    ln -sf ~/.dotfiles/rmview/RmView.desktop ~/.local/share/applications/RmView.desktop
fi
