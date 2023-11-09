#!/bin/bash
##############
# install.sh #
##############

check() {
	cmd=$1
	printf "	\e[1;37m${cmd}\e[0m..."
	if ! command -v ${cmd} >/dev/null 2>&1; then
		printf "\e[1;31m✖\e[0\n"
		printf "\e[1;37m$cmd\e[0m is not installed.\n"
		exit 1
	fi

	printf "\e[1;32m✔\e[0m\n"
}

clone() {
	repo=$1
	destination=$2

	repo_title=$(echo "${repo}" | awk -F/ '{print $NF}' | sed 's/.git$//')

	printf "\t\e[1;33mCloning \e[1;37m${repo_title}\e[0m..."
	if [ ! -d "$destination" ]; then
		git clone --depth 1 "$repo" "$destination" &> /dev/null
	fi

	printf "\e[1;32m✔\e[0m\n"
}

link() {
	src=$1
	dest=$2

	printf "\t\e[1;33mLinking \e[1;37m${src}\e[0m → \e[1;37m${dest}\e[0m\n"

	ln -sfn "${src}" "${dest}"
}

install_cargo() {
	package=$1

	printf "\t\e[1;33mInstalling \e[1;37m${package}\e[0m with \e[1;37mcargo\e[0m..."
	cargo install "${package}" &> /dev/null
	printf "\e[1;32m✔\e[0m\n"
}

echo "Checking dependencies"
check git
check awk
check sed
check printf
check cargo
echo

echo "Linking files"
link $(pwd)/zshrc ${HOME}/.zshrc
link $(pwd)/gitconfig ${HOME}/.gitconfig
link $(pwd)/aliases ${HOME}/.aliases
link $(pwd)/nvim ${HOME}/.config/nvim
link $(pwd)/starship.toml ${HOME}/.config/starship.toml
link $(pwd)/tmux.conf ${HOME}/.tmux.conf
echo

echo "Cloning repos"
# ZSH
clone https://github.com/zsh-users/zsh-syntax-highlighting.git  ${HOME}/.zsh/zsh-syntax-highlighting
clone https://github.com/catppuccin/zsh-syntax-highlighting.git ${HOME}/.zsh/zsh-syntax-highlighting-catppuccin
# TPM
clone https://github.com/tmux-plugins/tpm                       ${HOME}/.tmux/plugins/tpm
echo

echo "Installing aditional packages (this might take a while)"
install_cargo starship

# Remove functions
unset -f check
unset -f link
unset -f clone
unset -f install_cargo
