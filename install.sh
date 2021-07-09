#!/bin/bash


git clone https://github.com/Semicolon255/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git pull

rm ~/.zshrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc

rm ~/.gitconfig
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

rm ~/.p10k.zsh
ls -s ~/.dotfiles/.p10k.zsh ~/.p10k.zsh
