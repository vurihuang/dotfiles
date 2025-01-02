if status is-interactive
    # Commands to run in interactive sessions can go here
end

source $XDG_CONFIG_HOME/fish/aliases.fish

set privaterc_path "$XDG_CONFIG_HOME/fish/privaterc.fish"
if test -e "$privaterc_path"
    source "$privaterc_path"
end

starship init fish | source
