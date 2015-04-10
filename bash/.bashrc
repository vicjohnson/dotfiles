source ~/.git-prompt.sh

# Source global definitions if they exist
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export PS1='\e[0;36m[\w]\e[0;31m$(__git_ps1)\n\e[0;31m[\!][\#] - $: \e[m'
export CLICOLOR=1
export LSCOLORS=gxbxfxdxcxegedabagaced

alias azure='ssh victorj@uofu-cs4540-39.cloudapp.net'
alias cade='ssh victorj@lenny.eng.utah.edu'

alias ..='cd ..'

alias ll='ls -l'
alias lla='ls -al'
alias lsa='ls -a'
alias rmf='rm -rf'
alias mkdir='mkdir -p'

alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'