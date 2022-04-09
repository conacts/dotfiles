#!/bin/bash
echo "sudo (y) non-sudo (n) [y/n]?"
read sVar


if [ $sVar == y] 
then
	sudo "$0" "$@"
	if [ -f "/etc/arch-release" ]
	then
		sudo pacman -Syyu git vim tmux python3 openssh-server openvpn easy-rsa yay

	elif [ -f "/etc/debian_version" ]
	then
		sudo apt update && sudo apt upgrade
		sudo apt install git vim tmux python3 openssh-server openvpn easy-rsa

	else
		echo "not an arch or debian distro"
		exit 1
	fi
else
	mkdir ~/git 
	cd git
	git clone https://github.com/conacts/files-to-transfer 
	mv files-to-transfer/config/.vimrc files-to-transfer/config/.tmux.conf files-to-transfer/config/.bashrc ~
fi 
exit 1
