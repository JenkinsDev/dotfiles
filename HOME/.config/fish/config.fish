if status is-interactive
    # Commands to run in interactive sessions can go here
end

# local-system specific configuration, if it exists
if test -f "$HOME/.fishrc"
    source "$HOME/.fishrc"
end

# initialize rvm if it is installed
if type -q rvm
    rvm default
end
