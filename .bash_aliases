
if [ `which thefuck` ]; then
    eval $(thefuck --alias)
    # You can use whatever you want as an alias, like for Mondays:
    alias please=fuck
fi

# Quick alias for SSH-ing into CSE
alias cse="ssh z5312085@login.cse.unsw.edu.au"

# Add function for combining mkdir and cd
mkcdir ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}
