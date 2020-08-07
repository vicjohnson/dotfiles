#! /usr/bin/env bash

if [ -a ~/.bash_env ]; then
    source ~/.bash_env
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# This will set the dircolors file to pull ls colors from.  Now it's easy to switch
# between different themes.
export DIRCOLORS_FILE="$HOME/.dircolors_dark"
# export DIRCOLORS_FILE="$HOME/.dircolors_light"

# ---------- Update the $PATH to conatin a couple extra directories ----------
export PATH="$PATH:$HOME/bin:"

# ---------- Other helpful stuff ----------

# Set my preferred color for grep
export GREP_COLOR="48;5;194;38;5;24"
export HISTCONTROL=ignoreboth:erasedups

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
    source ~/.bash_nix
elif [[ $(uname) == *"MINGW64"* ]]; then
    source ~/.bash_windows
fi
