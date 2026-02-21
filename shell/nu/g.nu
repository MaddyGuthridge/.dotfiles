# Git status
export def gst [] {
    git status --short
}

# Git add
export def ga [...files: string] {
    git add ...$files
}

# Git commit
export def gcm [message: string] {
    git commit -m $message
}

# Git commit all
export def gcam [message: string] {
    git commit -am $message
}

# Git commit all and push
export def gcamp [message: string] {
    git commit -am $message
    git push
}

# Git commit and push
export def gcmp [message: string] {
    git commit -m $message
    git push
}

export def git-main-branch-name [] {
    # https://stackoverflow.com/a/55448881/6335363
    let head = (git branch -rl '*/HEAD' | grep -o '[^ ]\+$')
    git branch -vv | grep -Po --color=never $"^[\\s\\*]*\\K[^\\s]*\(?=.*($head)\)"
}

export def git-to [ref: string] {
    
}