#!/bin/bash

pathtonotes="$HOME/notes"
pathtoscript="$HOME/scripts/mdtopdf-zathura.sh";

chosen=$(ls $pathtonotes | dmenu -p "Open which notes?" -i -l 10)
bash $HOME/scripts/mdtopdf-zathura.sh $pathtonotes/$chosen &
