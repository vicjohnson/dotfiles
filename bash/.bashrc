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

# ---------- Simple timestamp function ----------
function timestamp {
    date +"%Y-%m-%d %H:%M:%S"
}

# ---------- Instead of removing files, just move them to a trash folder ----------
function saferm {
    # Make sure ~/.mytrash exists, if it doesn't, then create it
    if [[ ! -e ~/.mytrash/ ]]; then
        mkdir ~/.mytrash/
    fi

    # remove a trailing slash if there is one
    target="${1%/}"

    # Get the current time to name the directory to hold the deleted stuff
    currentTime=$(timestamp)

    # Create the directory in the trash named with the timestamp
    mkdir "$HOME/.mytrash/$currentTime"

    # Move the stuff to the trash
    mv "$target" "$HOME/.mytrash/$currentTime"

    # Add a new file to the trash folder containing the old location of the stuff
    # Hopefully there is nothing named ".trash_old_location"
    echo "$(dirname $(myreadlink $1))" >> "$HOME/.mytrash/$currentTime/.trash_old_location"
}

# ---------- Used to restore a file/directory deleted with saferm ----------
function restr {
    # Remove a trailing slash if there is one
    target="${1%/}"

    # Make sure there is an old location file to read from
    if [[ -e "$target/.trash_old_location" ]]; then
        # Read the first line of the old location file.. aka the old location
        location=$(head -n 1 "$target/.trash_old_location")

        # Make sure the old location still exists
        if [[ -d "$location" ]]; then
            # Move everything to the old location
            mv "$target"/* "$location"

            # Remove the .trash_old_location file from the restored stuff and
            # remove the folder from the trash that used to contain the restored
            # stuff.
            \rm "$location/.trash_old_location"
            \rm -rf "$target"
        else
            echo "The containing directory no longer exists."
            return
        fi
    else
        echo "The file/directory cannot be restored."
        return
    fi
}

# ---------- Set aliases for safe removal and retrieval ----------
alias rm="saferm"
alias emtr="\rm -rf $HOME/.mytrash/*"
alias lstr="ls -al $HOME/.mytrash"


# ---------- Gets an absolute path to a file ----------
function myreadlink() {
    (
    cd $(dirname $1)
    echo $PWD/$(basename $1)
    )
}


# ---------- Other helpful stuff ----------

# Correct typoswhen cd'ing around
shopt -s cdspell
shopt -s dotglob nullglob
# Set my preferred color for grep
export GREP_COLOR="48;5;194;38;5;24"
export HISTCONTROL=ignoreboth:erasedups