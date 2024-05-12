#!/bin/bash

installerdir=$(pwd)

function installpkgs {
	echo installing packages from pkglist.txt...
	sudo pacman -S --needed - < ./pkglists/pkglist.txt

	echo "installing paru..."
	git clone https://aur.archlinux.org/paru.git
	cd $HOME/paru
	makepkg -si

	echo "installing ble.sh..."
	cd $HOME
	git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
	make -C ble.sh
	echo "ble.sh is installed, script will be sourced in .bashrc"

	cd $installerdir
	echo "listing aurpkglist.txt"
	cat ./pkglists/aurpkglist.txt
	echo ^^^ please install these via aurhelper ^^^

	read -r -p "Deploy dotfiles now? [y/n]: " deploychoice
	if [[ "$deploychoice" == "y" ]]; then
		./deploy-config-repo.sh
	else
		exit
	fi
}

echo "1) install everything"
echo "2) deploy dotfiles only"
echo "q) quit"
read -r -p "Choice [1/2/q]: " menuchoice

if [[ "$menuchoice" == "1" ]]; then
	echo "install everything"
	installpkgs
	exit

elif [[ "$menuchoice" == "2" ]]; then
	echo "deploy dotfiles only"
	./deploy-config-repo.sh
	exit

elif [[ "$menuchoice" == "q" ]]; then
	echo "exit"
	exit

else
	echo "unsupported selection $menuchoice"
	exit

fi
