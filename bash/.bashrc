source ~/.git-prompt.sh

# ---------- Source global definitions if they exist ----------
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi


# ---------- Load nvm when the shell starts up ----------
export NVM_DIR="/Users/victorjohnson/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


# ---------- Set up custom prompt ----------
export PS1='\e[0;36m[\w][\u]\e[0;31m$(__git_ps1)\n\e[0;31m[\!][\#] - $: \e[m'
export CLICOLOR=1
export LSCOLORS=gxbxfxdxcxegedabagaced


# ---------- Create aliases for common commands ----------
alias cade='ssh victorj@lab1-26.eng.utah.edu'
alias lla='ls -al'
alias rmf='rm -rf'
alias mkdir='mkdir -p'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias fuck='eval $(thefuck $(fc -ln -1)); history -r'

alias og++='\g++'
alias ogcc='\gcc'

alias g++='g++-4.9'
alias gcc='gcc-4.9'

alias nt='npm test'
alias tk='kelp test.klp'
alias mochaw='mocha --recursive -w -R dot'
alias lc="find . -type d \\( -name node_modules -o -name coverage -o -name .git \\) -prune -o -type f | xargs wc -l"


# ---------- My quick navigation aliases ----------
alias proj='cd ~/Documents/projects'
alias gist='cd ~/Documents/projects/gist'


# ---------- Fun aliases ----------
alias smallscreen='python ~/Documents/projects/displayManager/display_manager.py set -w 2880 -h 1800 -d 32 -r 0'
alias medscreen='python ~/Documents/projects/displayManager/display_manager.py set -w 2560 -h 1600 -d 32 -r 0'
alias regscreen='python ~/Documents/projects/displayManager/display_manager.py set -w 1920 -h 1200 -d 32 -r 0'


# ---------- Any time I cd into a directory, add that directory to $PATH ----------
alias cd='cdp'

export PATH="$PATH:~/bin"
export OLD_PATH=$PATH
export PATH=$OLD_PATH:$PWD

cdp() {
    \cd $1
    export PATH=$OLD_PATH:$PWD
}
