#!/bin/bash
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

if [ -f "/etc/arch-release" ]
then
	sudo pacman -Syyu git vim tmux python3 openssh-server openvpn easy-rsa yay
	yay -S autokey-gtk

elif [ -f "/etc/debian_version" ]
then
	sudo apt update && sudo apt upgrade
	sudo apt install git vim tmux python3 openssh-server openvpn easy-rsa

else
	echo "not an arch or debian distro"
	exit 1
fi

mkdir ~/git 
git clone https://github.com/conacts/files-to-transfer ~/git
git mv ~/git/files-to-transfer/.vimrc ~/git/files-to-transfer/.tmux.conf ~/git/files-to-transfer/.bashrc
