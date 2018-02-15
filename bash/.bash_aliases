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

# ---------- Git related aliases ----------
function gclean {
    git fetch -p && git br -d $(git branch -vv | grep ': gone]' | awk '{print $1}')
}

function gpo {
    git push -u origin $(git rev-parse --abbrev-ref HEAD)
}
