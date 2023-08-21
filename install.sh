#!/bin/sh
# Install script
# Warning: this will erase any files in that location

# Bash stuff
# ln -sf ~/.dotfiles/bash_aliases      ~/.bash_aliases
ln -sf ~/.dotfiles/bashrc            ~/.bashrc
ln -sf ~/.dotfiles/inputrc           ~/.inputrc

# Zsh stuff
ln -sf ~/.dotfiles/zshrc             ~/.zshrc
ln -sf ~/.dotfiles/aliases       ~/.aliases

# RmView shortcut
mkdir -p ~/.local/share/applications/
ln -sf ~/.dotfiles/rmview/RmView.desktop ~/.local/share/applications/RmView.desktop

# Solaar config
mkdir -p ~/.config
rm -rf ~/.config/solaar
ln -sfd ~/.dotfiles/solaar ~/.config/solaar

# Obsidian
mkdir -p ~/.local/bin/
ln -sf ~/.dotfiles/obsidian/launch.py ~/.local/bin/obsidian
# Also the .desktop file
ln -sf ~/.dotfiles/obsidian/Obsidian.desktop ~/.local/share/applications/Obsidian.desktop
mkdir -p ~/.local/share/icons/hicolor/512x512/
# FIXME: This only works for Flatpak probably
ln -sf /var/lib/flatpak/app/md.obsidian.Obsidian/current/active/export/share/icons/hicolor/512x512/apps/md.obsidian.Obsidian.png ~/.local/share/icons/hicolor/512x512/md.obsidian.Obsidian.png
