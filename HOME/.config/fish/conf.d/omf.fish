set -gx OMF_PATH "$HOME/.local/share/omf"
if set -q XDG_DATA_HOME; and test -n "$XDG_DATA_HOME"
    set -gx OMF_PATH "$XDG_DATA_HOME/omf"
end
if test -f "$OMF_PATH/init.fish"
    source "$OMF_PATH/init.fish"
end
