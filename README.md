# config-repo
automated backup/deployment of my arch linux dotfiles/configs

these scripts are assuming [arch-notes](https://github.com/gfriesen98/config-repo/blob/main/arch-notes.md) were used when installing

1. installed using `archinstall`
2. selected `Desktop` when selecting a Profile with archinstall
3. selected `i3` when selecting a graphical environment
4. followed [arch-notes](https://github.com/gfriesen98/config-repo/blob/main/arch-notes.md#minimal-install-notes) to install things manually

i dont think selecting a different graphics driver or greeter/displaymanager should make a difference (aside from some graphics drivers stuffs, read the wiki)

- to install all packages + dotfiles, run `./post-install.sh`.
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

