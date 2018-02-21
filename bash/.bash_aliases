#! /usr/bin/env bash

# ---------- Regular commands with options ----------
alias mkdir="mkdir -p"
alias grep="grep --color=auto"
alias cx="chmod +x"

# When I cd into the previous directory using `cd -`, pipe the ouput into the abyss
alias cd="cd $1 >> /dev/null"

# ---------- Compiler/Interpreter aliases ----------
alias py="python"
alias pyy="python3"
alias serve="python -m SimpleHTTPServer"
alias rh='runhaskell'

# ---------- Git related functions ----------
function gclean {
    git fetch -p && git br -d $(git branch -vv | grep ': gone]' | awk '{print $1}')
}

function gpo {
    git push -u origin $(git rev-parse --abbrev-ref HEAD)
}


# ---------- Automatically cd into a new dir ----------
function mkdirc {
    \mkdir "$1"
    cd "$1"
}


# ---------- Simple timestamp function ----------
function timestamp {
    date +"%Y-%m-%d %H:%M:%S"
}


# ---------- Words list of available on this OS ----------
function words {
    wordsFile="/usr/share/dict/words"

    if [[ ! -f "$wordsFile" ]]; then
        echo "You have no words file at $wordsFile"
    else
        cat $wordsFile
    fi
}

# ---------- Convert a string to lowercase ----------
function lowercase {
    echo "$1" | tr '[:upper:]' '[:lower:]'
}
