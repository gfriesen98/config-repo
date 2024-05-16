#!/bin/bash

lockfile="/tmp/dmenu_ytdlp.lock"
urlsFile="/tmp/ytdlp_urls.txt"
waitingUrlsFile="/tmp/waiting_ytdlp_urls.txt"
ytdlpIcon="/tmp/yt-dlp-thumbnail.jpg"
pattern="(http:|https:)?\/\/(www\.)?(youtube.com|youtu.be)\/(watch)?(\?v=)?(\S+)?"
ytdlpFormat="bestvideo[ext=mp4]+bestaudio[ext=m4a]"
dlFolder="$HOME/downloads/"
urls=()
waitingUrls=()

# get yt url from dmenu input (ctrl+shift+y to paste), exit if empty
dmenuInput=$(dmenu -p "input yt url " < /dev/null)
[ -z "$dmenuInput" ] && exit

notify-send -t 3000 "Starting yt-dlp" --app-name "yt-dlp"
if [[ -e $lockfile ]]; then
	title=$(yt-dlp --get-title "$dmenuInput")
	notify-send -t 2000 "Adding $title to queue..." --app-name "yt-dlp"
	echo "$dmenuInput" >> $waitingUrlsFile
	exit 1
else
	echo "$dmenuInput" >> $urlsFile
fi

if [[ -f $urlsFile ]]; then
	mapfile -t urls < $urlsFile
fi

while [[ ${#urls[@]} -gt 0 ]]; do
	for url in "${urls[@]}"; do
		touch $lockfile
		yt-dlp --skip-download --write-thumbnail --convert-thumbnails jpg --output "/tmp/yt-dlp-thumbnail" $url
		name=$(yt-dlp --get-title "$url")
		notify-send -t 3000 -i $ytdlpIcon "Downloading $name..." --app-name "yt-dlp"
		yt-dlp -w --no-mtime -f $ytdlpFormat -o "$dlFolder%(title)s.%(ext)s" -i "$url"
		notify-send -t 3000 -i $ytdlpIcon "Finished Downloading $name!" --app-name "yt-dlp"
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
