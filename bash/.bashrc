# Currently running bash version 4.x.x
# to return bash to it's original version run the following command:
# chsh -s /bin/bash


# ---------- Source other files if they exist ----------
files=(
    /etc/bashrc
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
else
    source ~/.bash_ubuntu
fi


# ---------- Load nvm when the shell starts up ----------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


# ---------- Any time I cd into a directory, add that directory to $PATH ----------
export PATH="$PATH:~/bin:"


# ---------- Automatically cd into a new dir ----------
function mkdirc {
    mkdir "$1"
    cd "$1"
}


# Extracts any archive(s) (if unp isn't installed)
extract () {
    for archive in $*; do
        if [ -f "$archive" ] ; then
            case "$archive" in
                *.tar.bz2)   tar xvjf "$archive"    ;;
                *.tar.gz)    tar xvzf "$archive"    ;;
                *.bz2)       bunzip2 "$archive"     ;;
                *.rar)       rar x "$archive"       ;;
                *.gz)        gunzip "$archive"      ;;
                *.tar)       tar xvf "$archive"     ;;
                *.tbz2)      tar xvjf "$archive"    ;;
                *.tgz)       tar xvzf "$archive"    ;;
                *.zip)       unzip "$archive"       ;;
                *.Z)         uncompress "$archive"  ;;
                *.7z)        7z x "$archive"        ;;
                *)           echo "This is not an archive: ${Red}'$archive'${No_Color}" ;;
            esac
        else
            echo "'$archive' is not a valid file!"
        fi
    done
}


# ---------- Other helpful stuff ----------
shopt -s cdspell;