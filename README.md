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

read [here](https://github.com/gfriesen98/config-repo/blob/main/SCRIPTS.md) for more details on each script

# dotfiles

im using:
- OS:           archlinux
- terminal:     kitty
- wm:           i3wm
- compositor:   picom
- status bar:   polybar
