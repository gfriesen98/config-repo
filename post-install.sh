#!/bin/bash

# ▄▖    ▗     ▄   ▗ ▐▘▘▜     ▄▖    ▜ 
# ▌ ▛▌▛▘▜▘▛▘  ▌▌▛▌▜▘▜▘▌▐ █▌  ▐ ▛▌▛▌▐ 
# ▙▌▙▌▌ ▐▖▄▌  ▙▘▙▌▐▖▐ ▌▐▖▙▖  ▐ ▙▌▙▌▐▖                                 

aurhelper="paru"

echo
cat ./fig.txt
echo installing packages from pkglist.txt...
#sudo pacman -S --needed - < ./pkglist.txt

echo listing aur packages...
cat ./aurpkglist.txt
echo ^^^ please install these via aurhelper ^^^
echo
#read -r -p "Attempt to install via aur helper? [y/n] " attemptinstall

# install ble.sh
git clone --recursive https://github.com/akinomyoga/ble.sh.git
cd ble.sh
make

read -r -p "Continue to dotfile deployment? [y/n] " deploydotfiles

if [[ "$deploydotfiles" == "y" || "$deploydotfiles" == "Y" ]]; then
	#bash ./deploy-config-repo.sh
	echo launch deploy-config-repo.sh
else
	echo exiting...
	exit
fi

