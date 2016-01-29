# ---------- Regular commands with options ----------
alias lla="ls -al"
alias mkdir="mkdir -p"
alias cx="chmod a+x"
alias sl="sudo !!"


# ---------- Internet aliases ----------
alias cade="ssh victorj@lab1-26.eng.utah.edu"
alias lip="ipconfig getifaddr en0"
alias exip="curl -s http://checkip.dyndns.org/ | grep -o '[0-9][0-9]*.[0-9][0-9]*.[0-9][0-9]*.[0-9]*'"


# ---------- Application aliases ----------
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"


# ---------- Compiler/Interpreter aliases ----------
alias og++="\g++"
alias ogcc="\gcc"
alias g++="g++-4.9"
alias gcc="gcc-4.9"
alias py="python"
alias serve="python -m SimpleHTTPServer"


# ---------- My quick navigation aliases ----------
alias proj="cd ~/Documents/projects"


# ---------- Fun aliases ----------
alias smallscreen="python ~/Documents/projects/displayManager/display_manager.py set -w 2880 -h 1800 -d 32 -r 0"
alias medscreen="python ~/Documents/projects/displayManager/display_manager.py set -w 2560 -h 1600 -d 32 -r 0"
alias regscreen="python ~/Documents/projects/displayManager/display_manager.py set -w 1920 -h 1200 -d 32 -r 0"
