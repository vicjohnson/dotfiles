#! /usr/bin/env bash

# Currently running bash version 4.x.x
# to return bash to it's original version run the following command:
# chsh -s /bin/bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

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
export PATH="$PATH:~/bin:"


# ---------- Automatically cd into a new dir ----------
function mkdirc {
    \mkdir "$1"
    cd "$1"
}


# ---------- Other helpful stuff ----------

# Correct typoswhen cd'ing around
shopt -s cdspell;