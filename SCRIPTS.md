## post-installer.sh
installs packages from `pkglist.txt` and launches `deploy-config-repo.sh`

i dont know how to install aur packages from a txt file, but those packages can be
found in `aurpkglist.txt`

## deploy-config-repo.sh
copies program configs to `$HOME/.config/*`

edit the script variables if you want to deploy to a different path

## update-config-repo.sh
copies in use configs from `$HOME/.config/*` to this repository folder, and
commits to github

edit the script to add more configs to copy
