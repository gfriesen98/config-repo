#!/bin/bash

proton_path="$HOME/.local/share/Steam/steamapps/common"
homecoming_path="$HOME/Games/Homecoming"

ge_proton_path="$HOME/.local/share/Steam/compatibilitytools.d"
ge_proton_url="https://github.com/GloriousEggroll/proton-ge-custom/releases/download/GE-Proton7-43/GE-Proton7-43.tar.gz"
ge_proton_file="GE-Proton7-43.tar.gz"

function get_proton_rt () {
	echo "get_proton_rt top"

	if [ ! -f "$homecoming_path/hc-proton.cfg" ]; then
		echo "not file hc-proton.cfg"
		find "$ge_proton_path" -iname "proton" > "$homecoming_path/hc-list.tmp"
		find "$proton_path" -iname "proton" >> "$homecoming_path/hc-list.tmp"

		if [ -s "$homecoming_path/hc-list.tmp" ]; then
			echo "not empty hc-list.tmp"
			#IFS=$'[\n]';
			proton_rt=$(cat "$homecoming_path/hc-list.tmp" | dmenu -p "CoH - Select Proton Runtime:")
#			proton_rt=$(zenity --list --title="Homecoming Installer" --text="Select Proton Runtime:" --width 640 --height 480 --column="Path" $(cat "$homecoming_path/hc-list.tmp"))
			#unset IFS;
			echo "Selected $proton_rt"

			rm "$homecoming_path/hc-list.tmp"

			if [ ! -f "$proton_rt" ]; then
				notify-send "Exiting Homecoming Installer" --app-name "Homecoming Installer (exit 1)"
				exit 1;
			fi

		else
			rm "$homecoming_path/hc-list.tmp"
			if [ "$1" = "required" ]; then
				notify-send -u critical "Unable to find any Proton runtimes!" "Ensure a version of Proton is installed in $proton_path" --app-name "Homecoming Installer"
				# zenity --error --title="Homecoming Installer" --text="Unable to find any Proton runtimes!\n\nMake sure at least one version of Proton is installed in\n$proton_path" --width=480
				exit 101;

			else
				notify-send -u critical "Unable to find any Proton runtimes!" "Try to install $ge_proton_file?" --app-name "Homecoming Installer"
				dmenu_prompt=$(echo -e "Yes\nNo" | dmenu -p "Install $ge_proton_file?")
				#zenity --question --title="Homecoming Launcher" --text="Unable to find any Proton runtimes!\n\nDo you want me to try to install $ge_proton_file?" --width=480
				if [ "$dmenu_prompt" = "No" ]; then
					notify-send "Exiting Homecoming Installer" --app-name "Homecoming Installer (exit 201)"
					exit 201;
				fi
				#if [ "$?" = 1 ]; then
				#	exit 201;
				#fi

				mkdir -p "$ge_proton_path"
				curl -o "$homecoming_path/$ge_proton_file" -L "$ge_proton_url"
				tar -xvzf "$homecoming_path/$ge_proton_file" -C "$ge_proton_path"
				rm "$homecoming_path/$ge_proton_file"
				return 0;
			fi
		fi
		echo "proton_rt $proton_rt"
		echo $proton_rt > "$homecoming_path/hc-proton.cfg"
	fi
	echo "get_proton_rt end proton_rt $proton_rt"
	cat "$homecoming_path/hc-proton.cfg"
	proton_rt=$(cat "$homecoming_path/hc-proton.cfg")
}

function get_hc_launcher () {
	if [ ! -f "$homecoming_path/hc-launcher.cfg" ]; then
		find "$homecoming_path" -iname "launcher.exe" > "$homecoming_path/hc-list.tmp"

		if [ -s "$homecoming_path/hc-list.tmp" ]; then
			#IFS=$'[\n]';
			hc_launcher=$(cat "$homecoming_path/hc-list.tmp" | dmenu -p "Select Homecoming Launcher:")
			#hc_launcher=$(zenity --list --title="Homecoming Installer" --text="Select Homecoming Launcher:" --width 640 --height 480 --column="Path" $(cat "$homecoming_path/hc-list.tmp"))
			#unset IFS;
			rm "$hoemcoming_path/hc-list.tmp"

			if [ ! -f "$hc_launcher" ]; then
				notify-send "Exiting Homecoming Installer" --app-name "Homecoming Installer"
				exit 2;
			fi

		else
			rm "$homecoming_path/hc-list.tmp"
			if [ "$1" = "required" ]; then
				notify-send -u critical "Unable to find the Homecoming Launcher!" "Did you cancel the installation before selecting a path?" --app-name "Homecoming Launcher"
				#zenity --error --title="Homecoming Installer" --text="Unable to find the Homecoming Launcher\n\nDid you cancel the installation before selecting a path?" --width=480
				exit 102;
			else
				return 0
			fi
		fi

		echo $hc_launcher > "$homecoming_path/hc-launcher.cfg"
	fi

	hc_launcher=$(cat "$homecoming_path/hc-launcher.cfg")
}

function run_hc_installer () {
	if [ ! -f "$homecoming_path/hcinstall.exe" ]; then
		curl -o "$homecoming_path/hcinstall.exe" https://manifest.cohhc.gg/launcher/hcinstall.exe
	fi
	echo "run proton on $homecoming_path/hcinstall.exe"
	"$proton_rt" run "$homecoming_path/hcinstall.exe"
}

# start script
notify-send "Starting Homecoming Installer..." --app-name "Homecoming Installer"

# create Homecoming dir
mkdir -p "$homecoming_path"

if [ "$1" == "clear" ]; then
	rm "$homecoming_path/hc-launcher.sh"
	rm "$homecoming_path/hc-proton.cfg"
	rm "$homecoming_path/hc-launcher.cfg"
	rm "$homecoming_path/hcinstall.exe"
	rm "$homecoming_path/launcher.ico"
fi

if [ ! "$2" = "" ]; then
	proton_path=$2
fi

export STEAM_COMPAT_DATA_PATH=$homecoming_path
export STEAM_COMPAT_CLIENT_INSTALL_PATH=$homecoming_path

# get_proton_rt function call
if [ "$proton_rt" = "" ]; then
	echo "proton_rt is EMPTY"
	get_proton_rt required
fi

get_hc_launcher
if [ "$hc_launcher" = "" ]; then
	echo "hc_launcher is EMPTY"
	run_hc_installer
	get_hc_launcher required
else
	echo "running $proton_rt"
	echo "$proton_rt"
	echo "$hc_launcher"
#	"$proton_rt" run "$hc_launcher"
fi
