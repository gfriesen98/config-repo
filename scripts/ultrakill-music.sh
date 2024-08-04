#!/bin/bash

if [[ -z $(which fzf) ]]; then
	echo "fzf isnt installed!!"
	echo "plz install 'fzf' https://github.com/junegunn/fzf"
	exit
fi

if [[ -z $(which ffmpeg) ]]; then
	echo "ffmpeg isnt installed!!"
	echo "pls install 'ffmpeg'"
	exit
fi

ultrakillMusicDir="$HOME/.local/share/Steam/steamapps/common/ULTRAKILL/Cybergrind/Music"
myMusicDir="/mnt/gserver/Media/Music/plex_music/"

# copy from music dir to ULTRAKILL
# cybergrind music folder. logic needs to
# convert flac to mp3 because gaem no handle it
function copyULTRAKILLsong {
	selectedFile=$(find $myMusicDir -type f | fzf)
	[[ -z $selectedFile ]] && exit

	selectedFilename=$(basename "$selectedFile")

	echo "Preview Song?"
	previewSong=$(echo -e "Yes\nNo" | fzf)

	if [[ $previewSong == "Yes" ]]; then
		xdg-open "$selectedFile"
		echo "Continue to copy?"
		skipCopy=$(echo -e "Yes\nNo" | fzf)
		[[ $skipCopy == "No" ]] && return 0
	fi

	if [[ $selectedFilename == *.flac ]]; then
		echo "Converting $selectedFilename to mp3 and copying..."
		ffmpeg -i "$selectedFile" -ab 320k "$ultrakillMusicDir/$selectedFilename.mp3"
		echo "Done"
		read -p "Press any key to continue"
		return 1
	fi

	if [[ $selectedFilename == *.mp3 || $selectedFilename == *.ogg ]]; then
		echo "Copying $selectedFilename..."
		cp "$selectedFile" "$ultrakillMusicDir/$selectedFilename"
		echo "Done"
		read -p "Press any key to continue"
		return 1
	fi

	echo "File $selectedFile is not flac, mp3 or ogg... Disregarding copy."
	read -p "Press any key to continue"
	return 0
}

# main
while :
do
	clear
	cat<<EOF
	==========================
	ULTRAKILL MUSIC COPIER
	--------------------------
	Select a song...
		(ctrl+c to exit)
EOF

	copyULTRAKILLsong
done	
