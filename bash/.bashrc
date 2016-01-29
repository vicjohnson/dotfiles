# ---------- Color variables for coloring output ----------
Black='\[\e[0;30m\]'        # Black
Red='\[\e[0;31m\]'          # Red
Green='\[\e[0;32m\]'        # Green
Yellow='\[\e[0;33m\]'       # Yellow
Blue='\[\e[0;34m\]'         # Blue
Purple='\[\e[0;35m\]'       # Purple
Cyan='\[\e[0;36m\]'         # Cyan
White='\[\e[0;37m\]'        # White
No_Color='\[\e[m\]'         # No Color

BBlack='\[\e[1;30m\]'       # Black
BRed='\[\e[1;31m\]'         # Red
BGreen='\[\e[1;32m\]'       # Green
BYellow='\[\e[1;33m\]'      # Yellow
BBlue='\[\e[1;34m\]'        # Blue
BPurple='\[\e[1;35m\]'      # Purple
BCyan='\[\e[1;36m\]'        # Cyan
BWhite='\[\e[1;37m\]'       # White

Normal='\[\e[0m\]'          # Normal
Bold='\[\e[1m\]'            # Bold
Dim='\[\e[2m\]'             # Dim
Underline='\[\e[4m\]'       # Underline
Blink='\[\e[5m\]'           # Blink

# ---------- Source other files if they exist ----------
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f ~/.git-prompt.sh ]; then
    . ~/.git-prompt.sh
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# ---------- Load nvm when the shell starts up ----------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


# ---------- Any time I cd into a directory, add that directory to $PATH ----------
alias cd="cdp"

export PATH="$PATH:~/bin"
export OLD_PATH=$PATH
export PATH=$OLD_PATH:$PWD

function cdp() {
    \cd $1
    export PATH=$OLD_PATH:$PWD
}


# ---------- Automatically cd into a new dir ----------
function mkdirc() {
    mkdir $1
    cd $1
}


# ---------- Set up custom prompt ----------
function makePS1() {
    # This must be done first to preserve the last exit status
    local last_exit_status=$?

    local start="${No_Color}${Dim}[${Normal}"
    local end="${No_Color}${Dim}]${Normal}"
    local delim="${No_Color}${Dim}][${Normal}"
    local directory="${Cyan}\w${No_Color}"
    local user="${Cyan}\u${No_Color}"
    local host="${Purple}\h${No_Color}"
    local cmd_num="${Purple}\#${No_Color}"
    local prompt="${Dim}- $: ${Normal}"


    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] || [ -n "$SSH_CONNECTION" ]; then
        my_host="${start} ${host} ${end}"
    else
        my_host=""
    fi

    if [[ ${last_exit_status} -eq "0" ]]; then
        exit_status="${Green}${last_exit_status}${No_Color}"
    else
        exit_status="${Red}${Bold}${last_exit_status}${Normal}${No_Color}"
    fi

    export PS1="\n${Cyan}${start} ${directory} ${delim} ${user} ${end}${my_host}\n"
    export PS1+="${start}${exit_status}${delim}${cmd_num}${end} ${prompt}"
}

export PROMPT_COMMAND=makePS1
export CLICOLOR=1
export LSCOLORS=gxbxfxdxcxegedabagaced

# ---------- Other helopful stuff ----------
shopt -s cdspell;

