# ~/.profile
# Path modifications run when user is signed in.

export DOTFILES="$HOME/.dotfiles"

# Set up PATH variable
export PATH=$DOTFILES/bin:$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

[ -f "/home/maddy/.ghcup/env" ] && . "/home/maddy/.ghcup/env" # ghcup-env