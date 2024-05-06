# config-repo
automated backup/deployment of my arch linux dotfiles/configs

- to install everything, run `./post-install.sh`.
- to install only dotfiles, run `./deploy-config-repo.sh`
- to update the repository, run `./update-config.repo.sh`

read further for more details on each script

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

