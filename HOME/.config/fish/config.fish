# Keep machine-specific settings and secrets in ~/.fishrc.
if test -f "$HOME/.fishrc"
    source "$HOME/.fishrc"
end
for dir in "$HOME/.opencode/bin" "$HOME/.bun/bin" "$HOME/.lmstudio/bin" "$HOME/.grok/bin"
    if test -d "$dir"
        fish_add_path "$dir"
    end
end
