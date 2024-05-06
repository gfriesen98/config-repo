#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/scripts/git-prompt.sh
export BROWSER=/usr/bin/firefox
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\[\e[38;5;153m\]\u\[\e[0m\]~\[\e[38;5;215m\]\@\[\e[38;5;36m\]${PS1_CMD1}\[\e[0m\] \n\[\e[90m\]\w\[\e[0m\] > '
