#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[[ $- == *i* ]] && source $HOME/ble.sh/out/ble.sh --noattach

source ~/scripts/git-prompt.sh
source $HOME/.config/gortscripts/gortrc #common paths and variables

# Aliaseses
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ssh='kitty +kitten ssh'	#kitty ssh fix
alias shh='ssh'
fs() { du -a $HOME/scripts/* | awk '{print $2}' | fzf | xargs -r $EDITOR; }
fc() { du -a $HOME/.config/* | awk '{print $2}' | fzf | xargs -r $EDITOR; }

PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\[\e[38;5;153m\]\u\[\e[0m\]~\[\e[38;5;215m\]\@\[\e[38;5;36m\]${PS1_CMD1}\[\e[0m\] \n\[\e[90m\]\w\[\e[0m\] > '

[[ ${BLE_VERSION-} ]] && ble-attach

# Created by `pipx` on 2024-06-28 08:39:56
export PATH="$PATH:/home/gort/.local/bin"
