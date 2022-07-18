#!/bin/sh

ln -s ~/.dotfiles/.bash_aliases      ~/.bash_aliases
ln -s ~/.dotfiles/.bashrc            ~/.bashrc
ln -s ~/.dotfiles/.zshrc             ~/.zshrc
ln -s ~/.dotfiles/.inputrc           ~/.inputrc

mkdir -p ~/.config/cloc
ln -s ~/.dotfiles/cloc_options.txt   ~/.config/cloc/options.txt
