#### Oh My ZSH Configuration
export ZSH=~/.oh-my-zsh

## ZSH Options
setopt CORRECT       # Spell check of commands
setopt MULTIOS       # Can pipe to multiple outputs
setopt GLOB_COMPLETE # Expand any large globs
setopt PUSHD_MINUS   # ^

KEYTIMEOUT=1
plugins=(git python docker)
SPACESHIP_ROOT="$HOME/.oh-my-zsh/custom/themes/spaceship-prompt"
ZSH_THEME="spaceship"

## Load ZSH
source $ZSH/oh-my-zsh.sh


#### Aliases
(( $+commands[npm5] )) && alias npm='npm5'


#### Base16 Shell Setup
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$($BASE16_SHELL/profile_helper.sh)"


#### PATH Additions
[ -z $GOPATH ] && [ -d "$GOPATH/bin" ] && PATH+=":$GOPATH/bin"
[ -d "/usr/local/android-studio/bin" ] && PATH+=":/usr/local/android-studio/bin/"
[ -d "$HOME/Android/Sdk/tools" ] && PATH+=":$HOME/Android/Sdk/tools"
[ -d "/usr/local/mysql/bin" ] && PATH+=":/usr/local/mysql/bin"


#### Sourcing Some Files
[ -f "/usr/bin/virtualenvwrapper.sh" ] && source "/usr/bin/virtualenvwrapper.sh"
[ -f "$HOME/.zsh_profile" ] && source "$HOME/.zsh_profile"
