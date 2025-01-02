alias bat='bat --style=plain'

alias c='cargo'

alias rust-analyer="$HOME/.local/bin/rust-analyzer"

# Use `y` function instead of `yazi`, to provides the ability to change the current working directory.
function y --description yazi
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
