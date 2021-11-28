
if [ -f `which thefuck` ]; then
    eval $(thefuck --alias)
    # You can use whatever you want as an alias, like for Mondays:
    alias please=fuck
fi

# Add function for combining mkdir and cd
mkcdir ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}
