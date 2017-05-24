#### Oh My ZSH Configuration
export ZSH=~/.oh-my-zsh

## ZSH Options
setopt CORRECT       # Spell check of commands
setopt MULTIOS       # Can pipe to multiple outputs
setopt GLOB_COMPLETE # Expand any large globs
setopt PUSHD_MINUS   # ^

KEYTIMEOUT=1
ZSH_THEME="spaceship"
plugins=(git python docker)

## Load ZSH
source $ZSH/oh-my-zsh.sh


#### Base16 Shell Setup
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"


#### PATH Additions
[ -z $GOPATH ] && [ -d "$GOPATH/bin" ] && PATH+=":$GOPATH/bin"
[ -d "/usr/local/android-studio/bin" ] && PATH+=":/usr/local/android-studio/bin/"
[ -d "$HOME/Android/Sdk/tools" ] && PATH+=":$HOME/Android/Sdk/tools"
[ -d "/usr/local/mysql/bin" ] && PATH+=":/usr/local/mysql/bin"

#### Sourcing Some Files
[ -f "/usr/bin/virtualenvwrapper.sh" ] && source /usr/bin/virtualenvwrapper.sh
[ -f "$HOME/.zsh_profile" ] && source $HOME/.zsh_profile
