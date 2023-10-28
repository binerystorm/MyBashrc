# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# imports

[ -f $HOME/.config/bash/prompt ] && source $HOME/.config/bash/prompt
[ -f $HOME/.config/bash/bash_aliases ] && source $HOME/.config/bash/bash_aliases

# If not running interactively, don't do anything
case $- in
    *i*) 
        ;;
    *)
	;;
esac

# Shell options and settings
# ==========================

# append to the history file, don't overwrite it
shopt -s histappend
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

set -o vi

# History settings
# ================

# no duplicates in history
HISTCONTROL=ignoreboth

# set size of history
HISTSIZE=1000
HISTFILESIZE=2000

# set file history location
HISTFILE="$HOME/.config/bash/.bash_history"

PATH+=":$HOME/scripts/"


# Set up PS1
# ==========

function sep {
    local p=${1:-main_prompt}
    PROMPT_COMMAND=$p
}

sep

# Complition
# ==========

# import custom complition from scripts
if ! shopt -oq posix; then
  if [ -f $HOME/scripts/gcomp ]; then
    . $HOME/scripts/gcomp
  fi
fi

neofetch
