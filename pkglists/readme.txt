Install packages from a list

To install packages from a previously saved list of packages, while not reinstalling previously installed packages that are already up-to-date, run:

# pacman -S --needed - < pkglist.txt

However, it is likely foreign packages such as from the AUR or installed locally are present in the list. To filter out from the list the foreign packages, the previous command line can be enriched as follows:

# pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort pkglist.txt))

Eventually, to make sure the installed packages of your system match the list and remove all the packages that are not mentioned in it:

# pacman -Rsu $(comm -23 <(pacman -Qq | sort) <(sort pkglist.txt))

