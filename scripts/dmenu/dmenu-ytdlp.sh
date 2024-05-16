#!/bin/bash

source $HOME/.config/gortscripts/gortrc

lockfile="/tmp/dmenu_ytdlp.lock"
urlsFile="/tmp/ytdlp_urls.txt"
waitingUrlsFile="/tmp/waiting_ytdlp_urls.txt"
ytdlpIcon="/tmp/yt-dlp-thumbnail.jpg"
pattern="(http:|https:)?\/\/(www\.)?(youtube.com|youtu.be)\/(watch)?(\?v=)?(\S+)?"
ytdlpFormat="bestvideo+bestaudio[ext=m4a]"
dlFolder="$HOME/downloads/"
urls=()
waitingUrls=()

# get yt url from dmenu input (ctrl+shift+y to paste), exit if empty
dmenuInput=$(dmenu -p "input yt url " < /dev/null)
[ -z "$dmenuInput" ] && exit

downloadFormat=$(echo -e "mp4\nmp3" | dmenu -p "download format")
echo $downloadFormat

if [[ -e $lockfile ]]; then
	title=$(yt-dlp --get-title "$dmenuInput")
	notify-send -t 2000 "Adding $title to queue..."
	echo "$dmenuInput" >> $waitingUrlsFile
	exit 1
else
	echo "$dmenuInput" >> $urlsFile
fi

if [[ -f $urlsFile ]]; then
	mapfile -t urls < $urlsFile
fi

while [[ ${#urls[@]} -gt 0 ]];
	for url in "${urls[@]}"; do
		touch $lockfile
		yt-dlp --skip-download --write-thumbnail --convert-thumbnails jpg --output "/tmp/yt-dlp-thumbnail" $url
		name=$(yt-dlp --get-title "$url")
		notify-send -t 2000 -i $ytdlpIcon "Downloading" "$name"
		yt-dlp -w --no-mtime -f $ytdlpFormat -o "$dlFolder%(title)s.%(ext)s" -i "$url"
		notify-send -t 2000 -i $ytdlpIcon "Download Complete" "$name"
	done

	> $urlsFile
	unset urls[@]

	if [[ -f $waitingUrlsFile ]]; then
		mapfile -t urlsWaiting < $urlsWaitingFile

		if [[ ${#urlsWaiting[@]} -gt 0 ]]; then
			sort $urlsWaitingFile | uniq >$urlsFile
			mapfile -t urls < $urlsFile
			> $urlsWaitingFile
		fi
	else
		rm -f $lockfile
		exit 1
	fi
done

rm -f $urlsFile
rm -f $lockfile
