#### Oh My ZSH Configuration
export ZSH=~/.oh-my-zsh

## ZSH Options
setopt CORRECT       # Spell check of commands
setopt MULTIOS       # Can pipe to multiple outputs
setopt GLOB_COMPLETE # Expand any large globs
setopt PUSHD_MINUS   # ^

KEYTIMEOUT=1
plugins=(git python docker)

## Load ZSH
source $ZSH/oh-my-zsh.sh

# custom theme
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[014]%}🌳"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$FG[129]%}x"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$FG[082]%}o"

PROMPT="%{$FG[069]%}┌─[%{$reset_color%}\
%{$FG[061]%}%n %{$FG[135]%}📂%~%{$reset_color%}\
%{$FG[069]%}] -> %{$reset_color%}\
%{$FG[069]%}[%{$reset_color%}\
${git_info}\
%{$FG[069]%}]%{$reset_color%}\

%{$FG[069]%}└─$% %{$reset_color%} "

RPROMPT="%{$FG[069]%}[\
%{$reset_color%}%*\
%{$FG[069]%}]\
%{$reset_color%}"

PS2=' ... '
# end custom theme

#### Aliases
alias vim=nvim;
alias Unity="Unity.exe";
alias unity="Unity";
alias arduino="arduino-cli";


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
[ -d "$HOME/bin" ] && PATH+=":/$HOME/bin"

[ -f "$HOME/.zsh_profile" ] && source "$HOME/.zsh_profile"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(rbenv init - zsh)";
. $HOME/.asdf/asdf.sh # asdf version manager
. $HOME/.asdf/completions/asdf.bash # asdf version manager completions

source $HOME/.profile

if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi


# Load Angular CLI autocompletion.
source <(ng completion script)

alias amd_docker_run='docker run -it --group-add=video'

# bun completions
[ -s "/home/jenkinsdev/.bun/_bun" ] && source "/home/jenkinsdev/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
