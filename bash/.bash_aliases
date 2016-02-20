#! /usr/bin/env bash

# ---------- Regular commands with options ----------
alias mkdir="mkdir -p"
alias grep="grep --color=auto"
alias cx="chmod +x"

# When I cd into the previous directory using `cd -`, pipe the ouput into the abyss
alias cd="cd $1 >> /dev/null"
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'


# ---------- Internet aliases ----------
alias exip="curl -s http://checkip.dyndns.org/ | grep -o '[0-9][0-9]*.[0-9][0-9]*.[0-9][0-9]*.[0-9]*'"


# ---------- Compiler/Interpreter aliases ----------
alias py="python"
alias serve="python -m SimpleHTTPServer"


# ---------- My quick navigation aliases ----------
alias proj="cd ~/Documents/projects"
