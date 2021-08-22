#!/bin/bash

echo -ne "Downloading repo...\r"
git clone https://github.com/JuliusDeBoer/dotfiles.git ~/dotfiles >> /dev/null
cd ~/dotfiles
echo -ne "Downloading repo... OK\r\n"

files=(".zshrc" ".p10k.zsh" ".gitconfig" ".vimrc" ".aliases")

for file in ${files[@]}
do
	echo -ne "Installing ${file}...\r"
	rm ~/${file} >> /dev/null
	ln -s ~/dotfiles/${file} ~/${file}
	echo -ne "Installing ${file}... OK\r\n"
done