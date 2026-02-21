# Return whether a file is executable
#
# https://github.com/nushell/nushell/discussions/10525#discussioncomment-7136462
export def is-executable [file: path] {
    let abs_file = $file | path expand
    if ($abs_file | path type) != "file" {
        error make --unspanned { msg: "not a file" }
    }

    ls -l $abs_file
        | get mode.0
        | split chars
        | chunks 3
        | each { ($in | last) == "x" }
        | wrap v
        | merge ([user group other] | wrap k)
        | select k v
        | transpose --header-row
        | into record
}
