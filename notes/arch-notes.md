# ISO

1. create bootable usb or boot arch iso for vm's
2. run `archinstall`
3. select 'Desktop' or 'Minimal' profile
4. change network settings
	- either copy ISO settings or use NetworkManager

5. install, enter chroot environment (can reboot immediately if you want to configure later)

# Post install

after installing arch using archinstall

- install from pkglist.txt:
    - `pacman -S --needed - < pkglist.txt`
    - for aurpkglist.txt, install individually with `paru`

- install `paru` (aur helper):
	- `git clone https://aur.archlinx.org/paru.git`
	- `cd paru && makepkg -si`
		- on vm's with 4gb/lower ram, it sometimes struggles to compile

##### minimal install notes:

1. add packages (stuff i want for headless play)
	- `sudo pacman -S neovim openssh git`
2. add user
	- `useradd -m -G wheel [myusername]`
	- `passwd [myusername]`
3. add user to sudoers (replace nvim with any other editor you installed)
	- `EDITOR=nvim visudo`
	- scroll to where root user permissions are set, and add:
		- `[myusername]   ALL=(ALL:ALL) ALL`
4. set up sshd
	- configure sshd config if configuring keypair auth in `/etc/ssh/sshd_config`
5. run `sudo systemctl enable --now sshd.service`
6. install `paru` (aur helper)
	- `git clone https://aur.archlinx.org/paru.git`
	- `cd paru && makepkg -si`
		- on vm's with 4gb/lower ram, it sometimes struggles to compile (?)

##### GUI (if not using archinstall desktop variant)

setting up xorg x11 for graphical environments

1. check which video driver to install:
	- `lspci`
	- if you have amd: xf86-video-amdgpu
2. install necessary xorg packages and video related stuffs
	- xorg: x11 main package
	- xorg-xinit: configuration to launch wm/de's without a gui logon manager
	- i3-wm: tiling window manager
	- `sudo pacman -S xf86-video-amdgpu xorg xorg-xinit i3-wm`
3. copy default X11 .xinitrc config to $HOME
	- `cp /etc/X11/xinit/xinitrc /home/$USERNAME/.xinitrc`
	- open with `nvim .xinitrc`
	- scroll to bottom and delete the lines where it starts with `twm &`
		- xorg comes with `twm` installed, we dont want to boot into that
	- the end of the `.xinitrc` file you can place commands to do stuff when `startx` is started:
		- ex. launch i3wm and compositor:
		- ```
			picom &
			exec i3
		  ```
4. reboot
5. login as your user, run `startx`

# fairly important post-post install notes

## X configs

### /etc/X11/xorg.conf.d/20-amdgpu.conf

amdgpu multiple monitor + freesync support

https://wiki.archlinux.org/title/Variable_refresh_rate

fixes issues when playing games on a high refresh rate
monitor with a lower refresh rate other monitor

add this to 20-amdgpu.conf, and reboot

```
Section "OutputClass"
	Identifier "AMD"
	MatchDriver "amdgpu"
	Driver "amdgpu"
	Option "TearFree" "true"
	Option "VariableRefresh" "true"
	Option "AsyncFlipSecondaries" "true"
EndSection
```

### /usr/share/X11/xorg.conf.d/40-libinput.conf

disable mouse accel

https://wiki.archlinux.org/title/Mouse_acceleration

replace the pointer InputClass section

```
Section "InputClass"
        Identifier "libinput pointer catchall"
        MatchIsPointer "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
	    Option "AccelProfile" "flat"
EndSection
```


