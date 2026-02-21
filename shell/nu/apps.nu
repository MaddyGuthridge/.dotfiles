# Available text editors
const editor_preferences = {
    "zed": ["zed" "-w"]
    "vscode": ["code" "-w"]
    "nano": ["nano"]
}

export module editor {
    # Determine the default editor for the current scenario
    export def default [] {
        # If terminal program is also an editor, set it
        if $env.TERM_PROGRAM in ($editor_preferences | columns) {
            return ($editor_preferences | get $env.TERM_PROGRAM)
        } else { # Otherwise, pick the first available option
            for editor in ($editor_preferences | columns) {
                if (which $editor | length) > 0 {
                    return ($editor_preferences | get $editor)
                }
            }
            error make { msg: "Unable to find a valid editor" }
        }
    }

    # Configure the preferred browser
    # This updates the setting for both `nu` and for other applications
    export def --env configure [preference?: string] {
        $env.config.buffer_editor = match $preference {
            null => (default)
            _ => ($editor_preferences | get $preference)
        }
        $env.EDITOR = $env.config.buffer_editor | str join " "
    }
}
