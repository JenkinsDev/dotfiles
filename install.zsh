#!/usr/bin/env zsh

git pull origin master

function installOhMyZsh() {
        read "REPLY?It looks like Oh My Zsh isn't installed to your home directory. May I install it for you? (y/n) "

        if [[ "$REPLY" =~ ^[Yy]$ ]]; then
                echo "Installing Oh My Zsh. You will need to rerun this script due to current limitations of their install script."
                sh -c "$( curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh )"
        else
                echo "Halting the install process. I need Oh My Zsh installed in order to function properly."
                sleep 2
                exit 0
        fi
}

function backupFile() {
        [ -f "$1" ] && echo "Backing up $1..." && mv "$1" ~/dotfiles.backup
}

function doIt() {
        echo "\nBacking Up Dotfiles..."
        [ ! -d ~/dotfiles.backup/ ] && echo "Making backup directory..." && mkdir ~/dotfiles.backup/
        backupFile ~/.tmux.conf
        backupFile ~/.vimrc
        backupFile ~/.vimrc_background
        backupFile ~/.zshrc
        echo "\n"

        if [ ! -d ~/.vim/bundle/ ]; then
                echo "\nInstalling Vundle..."
                git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        fi

        if [ ! -d ~/.config/base16-shell ]; then
                echo "Installing Base16 Shell..."
                git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
        fi

        echo "Installing Spaceship ZSH Theme..."
        curl https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/spaceship.zsh \
                -o ./.oh-my-zsh/custom/themes/spaceship.zsh-theme

        rsync --exclude ".git/" \
                --exclude ".gitignore" \
                --exclude "install.zsh" \
                --exclude "README.md" \
                --exclude "LICENSE.txt" \
                -avh --no-perms . ~

        echo "Installing vim plugins with Vundle... You may see errors, just press ENTER."
        vim +PluginInstall +qall

        ycmInstall=( ~/.vim/bundle/YouCompleteMe/install.py )
        (( $+commands[go] )) && ycmInstall+=( --gocode-completer )
        (( $+commands[xbuild] )) && ycmInstall+=( --omnisharp-completer )
        (( $+commands[node] )) && (( $+commands[npm] )) && ycmInstall+=( --tern-completer )
        (( $+commands[rustc] )) && (( $+commands[cargo] )) && ycmInstall+=( --racer-completer )
        echo "Installing YouCompleteMe... Command: ${ycmInstall}"
        "${ycmInstall[@]}" # Run installer with all options set
        
        echo "Sourcing new .zshrc file..."
        source ~/.zshrc
}

[ ! -d ~/.oh-my-zsh/ ] && installOhMyZsh

echo "Installing dotfiles...\n"
if [[ "$1" == "--force" || "$1" == "-f" ]]; then
        doIt
else
        read "REPLY?We don't want to overwrite your files. If I find a file that I need to replace, I'll put it in a dotfiles.backup folder. Is this okay with you? (y/n) "

        if [[ "$REPLY" =~ ^[Yy]$ ]]; then
                doIt
        fi
fi

unset installOhMyZsh
unset backupFile
unset doIt
