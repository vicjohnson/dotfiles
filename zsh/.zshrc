export GIT_AUTHOR_NAME="Victor Johnson"
export GIT_COMMITTER_NAME="Victor Johnson"
export GIT_COMMITTER_EMAIL="vicjohnson1213@gmail.com"
export GIT_AUTHOR_EMAIL="vicjohnson1213@gmail.com"

# ---------- Update the $PATH to contain a couple extra directories ----------
export PATH="$PATH:$HOME/bin:"

# ---------- Other helpful stuff ----------

autoload -Uz add-zsh-hook

# Set my preferred color for grep
export GREP_COLOR="48;5;194;38;5;24"

# This will set the dircolors file to pull ls colors from.  Now it's easy to switch
# between different themes.
export DIRCOLORS_FILE="$HOME/.dircolors_dark"
# export DIRCOLORS_FILE="$HOME/.dircolors_light"

# Init autocompletion
autoload -Uz compinit && compinit

# ---------- History ----------

# History: ignore duplicates and commands starting with a space
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST 
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
SAVEHIST=500
HISTSIZE=500

setopt GLOB_DOTS
setopt GLOB_COMPLETE

setopt CD_SILENT

# ---------- Source other files if they exist ----------

function safesource {
    if [ -f "$1" ]; then
        source "$1"
    fi
}

files=(
    ~/.zsh_styles
    ~/.zsh_prompt
    ~/.zsh_aliases
    ~/.zsh_welcome
)

for f in ${files[@]}; do
    safesource $f
done

# ---------- Source platform specific config ----------

if [[ $(uname) == "Darwin" ]]; then
    safesource ~/.zsh_osx
elif [[ $(uname) == "Linux" ]]; then
    safesource ~/.zsh_nix
elif [[ $(uname) == *"MINGW64"* ]]; then
    safesource ~/.zsh_windows
fi

# ---------- Source local stuff last ----------

safesource ~/.zsh_local
