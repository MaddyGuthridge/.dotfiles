use ~/.dotfiles/shell/nu/nutil.nu [is-executable]

# Show the message of the day
export def show [] {
    let file = "~/.motd" | path expand
    if ($file | path type) not-in ["file", "symlink"] {
        print "Hello, Maddy!"
        return
    }
    if (is-executable $file | get user) {
        run-external $file
    } else {
        open $file | print
    }
}
