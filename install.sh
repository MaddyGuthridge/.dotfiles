#!/bin/sh

ln -si ~/.dotfiles/bash_aliases      ~/.bash_aliases
ln -si ~/.dotfiles/bashrc            ~/.bashrc
ln -si ~/.dotfiles/zshrc             ~/.zshrc
ln -si ~/.dotfiles/zsh_aliases       ~/.zsh_aliases
ln -si ~/.dotfiles/inputrc           ~/.inputrc

mkdir -p ~/.config/cloc
ln -si ~/.dotfiles/cloc_options.txt   ~/.config/cloc/options.txt
