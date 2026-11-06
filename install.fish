#!/usr/bin/env fish
set -l root (path resolve (dirname (status filename)))
set -l config_home "$HOME/.config"
if set -q XDG_CONFIG_HOME; and test -n "$XDG_CONFIG_HOME"
    set config_home "$XDG_CONFIG_HOME"
end
mkdir -p "$config_home"
for item in .tmux.conf .config/fish .config/nvim .config/kitty
    set -l dest "$HOME/$item"
    if string match -q '.config/*' -- "$item"
        set dest "$config_home/"(string replace '.config/' '' -- "$item")
    end
    if test -e "$dest"; or test -L "$dest"
        echo "Skipping existing $dest"
    else
        cp -R "$root/HOME/$item" "$dest"; or exit 1
        echo "Installed $dest"
    end
end
