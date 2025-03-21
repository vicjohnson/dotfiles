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
alias fl="flutter"
alias serve="python -m SimpleHTTPServer"
alias jek="bundle exec jekyll serve"
alias rh='runhaskell'
alias s="npm start"
alias dr="dotnet run"

# ---------- Image metadata updates ----------

alias jpginfo="exiftool -time:all -G -a -s"

function jpgsetdate {
    exiftool -overwrite_original -AllDates="$1 00:00:00" $2
}

# ---------- Git related functions ----------

# Deletes any git branches that no longer exist on origin.
function gclean {
    git fetch -p && git br -d $(git branch -vv | grep ': gone]' | awk '{print $1}')
}

# Push the the current branch to origin even if it doesn't exist already.
function gpo {
    git push -u origin $(git rev-parse --abbrev-ref HEAD)
}

function glines {
    git log --author="$1" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -
}

# ---------- Automatically cd into a new dir ----------
function mkdirc {
    \mkdir -p "$1" && cd "$1"
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

function killport {
    kill -9 $(lsof -ti:"$1")
}
