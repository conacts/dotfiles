#!/bin/bash
read -p 'do you have git installed? [y/n] ' yn
if [[ $yn =~ ^[Yy]$ ]]
then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir ~/.vim/undodir
	mkdir ~/git 
	git clone https://github.com/conacts/files-to-transfer ~/git
	mv files-to-transfer/config/.vimrc files-to-transfer/config/.tmux.conf files-to-transfer/config/.bashrc ~
	git config --global credential.helper store
	sudo "$0" "$@"

	if [ -f "/etc/arch-release" ]
	then
		sudo pacman -Syyu git vim tmux python3 openssh-server openvpn easy-rsa yay python-pip
		exit 1
	elif [ -f "/etc/debian_version" ]
	then
		sudo apt update && sudo apt upgrade
		sudo apt install git vim tmux python3 openssh-server openvpn easy-rsa python-pip
		exit 1
	else
		echo "not an arch or debian distro"
		exit 1
	fi
else
	echo "install git"
	exit 1
fi
