export GIT_AUTHOR_NAME="Victor Johnson"
export GIT_COMMITTER_NAME="Victor Johnson"
export GIT_COMMITTER_EMAIL="vicjohnson1213@gmail.com"
export GIT_AUTHOR_EMAIL="vicjohnson1213@gmail.com"

# ---------- Update the $PATH to contain a couple extra directories ----------
export PATH="$PATH:$HOME/bin:"

# ---------- Other helpful stuff ----------

# Set my preferred color for grep
export GREP_COLOR="48;5;194;38;5;24"

# History: ignore duplicates and commands starting with a space
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

# ---------- Source other files if they exist ----------
files=(
    ~/.gitprompt
    ~/.zsh_styles
    ~/.zsh_prompt
    ~/.zsh_aliases
    ~/.zsh_welcome
)

for f in ${files[@]}; do
    if [ -f $f ]; then
        source $f
    fi
done

# ---------- Source platform specific config ----------
if [[ $(uname) == "Darwin" ]]; then
    source ~/.zsh_osx
elif [[ $(uname) == "Linux" ]]; then
    source ~/.zsh_nix
elif [[ $(uname) == *"MINGW64"* ]]; then
    source ~/.zsh_windows
fi
