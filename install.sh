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

	printf "\e[1;32m✓\e[0m\n"
}

clone() {
	repo=$1
	destination=$2

	repo_title=$(echo "${repo}" | awk -F/ '{print $NF}' | sed 's/.git$//')

	printf "\t\e[1;33mCloning \e[1;37m${repo_title}\e[0m..."
	if [ ! -d "$destination" ]; then
		git clone --depth 1 "$repo" "$destination" &> /dev/null
	fi

	printf "\e[1;32m✓\e[0m\n"
}

link() {
	src=$1
	dest=$2

	printf "\t\e[1;33mLinking \e[1;37m${src}\e[0m  \e[1;37m${dest}\e[0m\n"

	ln -s -f "${src}" "${dest}"
}

echo "Checking dependencies"
check git
check awk
check sed
check printf
echo

echo "Linking files"
link $(pwd)/zshrc ${HOME}/.zshrc
link $(pwd)/gitconfig ${HOME}/.gitconfig
link $(pwd)/aliases ${HOME}/.aliases
link $(pwd)/nvim ${HOME}/.config/nvim
echo

echo "Cloning repos"
clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.zsh/zsh-syntax-highlighting
clone https://github.com/spaceship-prompt/spaceship-prompt.git ${HOME}/.zsh/spaceship-prompt

# Remove functions
unset -f check
unset -f link
unset -f clone
