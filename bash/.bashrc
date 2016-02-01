# Currently running bash version 4.x.x
# to return bash to it's original version run the following command:
# chsh -s /bin/bash


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


# ---------- Load nvm when the shell starts up ----------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


# ---------- Any time I cd into a directory, add that directory to $PATH ----------
export PATH="$PATH:~/bin:"


# ---------- Don't echo the current dir when I cd to $OLDPWD ----------
alias cd="cdp"
cdp () {
    if [[ "$1" == "-" ]]; then
        \cd "$OLDPWD"
    else
        \cd "$1"
    fi
}


# ---------- Automatically cd into a new dir ----------
alias mkdir="mkdirc"
function mkdirc {
    \mkdir "$1"
    cd "$1"
}


# ---------- Other helpful stuff ----------
shopt -s cdspell;