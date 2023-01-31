
if [ `which thefuck 2> /dev/null` ]; then
    eval $(thefuck --alias)
    # You can use whatever you want as an alias, like for Mondays:
    alias FUCK=fuck
    alias please=fuck
    alias oops=fuck
fi

if [ `which dolphin 2> /dev/null` ]; then
    dolphin () {
        /usr/bin/dolphin "$@" 2> /dev/null &
    }
fi

if [ `which swi-prolog.swipl 2> /dev/null` ]; then
    alias prolog=swi-prolog.swipl
fi

# Environment variable pointing to CSE Servers
export CSE="z5312085@login.cse.unsw.edu.au"

# Quick alias for SSH-ing into CSE
alias cse="ssh $CSE"
# Quick function for grabbing files from CSE
cse-get()
{
    if [ $# -eq 1 ]; then
        echo "CSE: Downloading $1 -> ${1##*/}"
        rsync "$CSE":"$1" ${1##*/}
    elif [ $# -eq 2 ]; then
        echo "Downloading $1 -> $2"
        rsync "$CSE":"$1" $2
    else
        echo "Wrong number of arguments"
    fi
}

# Add function for combining mkdir and cd
mkcdir ()
{
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}

# Add function for combining cd and ls
cdl ()
{
      cd -P -- "$1"
}

# VC Compiler
alias vc="java -jar ~/Tweaks/VC.jar"
alias vcc="java -jar /home/migue/.local/bin/vcc.jar"
