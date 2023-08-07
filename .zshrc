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

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
    eval "$("$BASE16_SHELL/profile_helper.sh")"


#### Aliases
alias vim=nvim;
alias Unity="Unity.exe";
alias unity="Unity";


#### Base16 Shell Setup
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$($BASE16_SHELL/profile_helper.sh)"


#### PATH Additions
[ -z $GOPATH ] && [ -d "$GOPATH/bin" ] && PATH+=":$GOPATH/bin"
[ -d "/usr/local/android-studio/bin" ] && PATH+=":/usr/local/android-studio/bin/"
[ -d "$HOME/Android/Sdk/tools" ] && PATH+=":$HOME/Android/Sdk/tools"
[ -d "/usr/local/mysql/bin" ] && PATH+=":/usr/local/mysql/bin"
[ -d "$HOME/.deno/bin" ] && PATH+=":$HOME/.deno/bin"
[ -d "$HOME/.fly/bin" ] && PATH+=":$HOME/.fly/bin"
[ -d "$HOME/.rbenv/bin" ] && PATH+=":$HOME/.rbenv/bin"
[ -d "/mnt/c/Program Files/Unity/Hub/Editor/2021.3.9f1/Editor" ] && PATH+=":/mnt/c/Program Files/Unity/Hub/Editor/2021.3.9f1/Editor"
[ -d "/usr/local/chromedriver" ] && PATH+=":/usr/local/chromedriver"
[ -d "$HOME/nvim/bin" ] && PATH+=":/$HOME/nvim/bin"


[ -f "$HOME/.zsh_profile" ] && source "$HOME/.zsh_profile"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(rbenv init - zsh)";
. $HOME/.asdf/asdf.sh # asdf version manager
. $HOME/.asdf/completions/asdf.bash # asdf version manager completions

source $HOME/.profile
