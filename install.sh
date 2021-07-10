#!/bin/bash


echo "Downloadig repo"
git clone https://github.com/Semicolon255/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

echo "Installing .zshrc"
rm ~/.zshrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc

echo "Installing .p10k.zsh"
rm ~/.p10k.zsh
ln -s ~/.dotfiles/.p10k.zsh ~/.p10k.zsh

echo "Installing .gitconfig"
rm ~/.gitconfig
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
