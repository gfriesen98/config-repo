#
# ~/.bash_profile
#

export OPENSSL_CONF=/etc/ssl/
export EDITOR=nvim
export TERMINAL=kitty
export BROWSER=/usr/bin/firefox
export PDF_VIEWER=zathura
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"

export GORTSCRIPTS_CONFIG_PATH=$HOME/.config/gortscripts
export SCRIPTS_PATH=$HOME/scripts
export CONFIG_PATH=$HOME/.config
export NOTES_PATH=$HOME/notes

[[ -f ~/.bashrc ]] && source ~/.bashrc

export PATH="$PATH:/home/gort/.local/bin"
