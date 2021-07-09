#!/bin/bash


git clone https://github.com/Semicolon255/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git pull

rm ~/.zshrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc
