#! /usr/bin/env bash

# Currently running bash version 4.x.x
# to return bash to it's original version run the following command:
# chsh -s /bin/bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# This will set the dircolors file to pull ls colors from.  Now it's easy to switch
# between different themes.
export DIRCOLORS_FILE="$HOME/.dircolors_dark"

# ---------- Source other files if they exist ----------
files=(
    /etc/bashrc
    ~/.gitprompt
    ~/.bash_styles
    ~/.bash_prompt
    ~/.bash_aliases
    ~/.bash_welcome
)

for f in ${files[@]}; do
    if [ -a $f ]; then
        source $f
    fi
done


# ---------- Source platform specific config ----------
if [[ $(uname) == "Darwin" ]]; then
    source ~/.bash_osx
elif [[ $(uname) == "Linux" ]]; then
    source ~/.bash_ubuntu
fi


# ---------- Any time I cd into a directory, add that directory to $PATH ----------
export PATH="$PATH:$HOME/bin:"


# ---------- Automatically cd into a new dir ----------
function mkdirc {
    \mkdir "$1"
    cd "$1"
}

# ---------- Simple timestamp function ----------
function timestamp {
    date +"%Y-%m-%d %H:%M:%S"
}

function words {
    wordsFile="/usr/share/dict/words"

    if [[ ! -f "$wordsFile" ]]; then
        echo "You have no words file at $wordsFile"
    else
        cat $wordsFile
    fi
}


# ---------- Other helpful stuff ----------

# Set my preferred color for grep
export GREP_COLOR="48;5;194;38;5;24"
export HISTCONTROL=ignoreboth:erasedups