# JenkinsDev’s dotfiles (originally heavily influenced by [Mathias' dotfiles](https://github.com/mathiasbynens/dotfiles))

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

You can clone the repository wherever you want. The install script will pull in the latest version and copy the files to your home folder via rsync.

```bash
git clone https://github.com/JenkinsDev/dotfiles.git && cd dotfiles && source install.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source install.sh
```

## Software Specific Settings/Keybindings

### Zsh

#### Files

* `~/.zsh_profile` - Used for settings that should not be stored in source control

### tmux

* Default Shell: `zsh`
* Prefix: `C-t`
* Split Window Vertical: `C-t -`
* Split Window Horizontal: `C-t |`
* Change Pane (Left): `M-h`
* Change Pane (Right): `M-l`
* Change Pane (Down): `M-j`
* Change Pane (Up): `M-k`

### Vim

#### Plugins
* [Vundle](https://github.com/VundleVim/Vundle.vim)
* [Vim Polyglot](https://github.com/sheerun/vim-polyglot)
* [Syntastic](https://github.com/vim-syntastic/syntastic)
* [Vim Surround](https://github.com/tpope/vim-surround)
* [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
* [Base16 Vim](https://github.com/chriskempson/base16-vim)
* [Vim Airline](https://github.com/vim-airline/vim-airline)
* [Vim Airline Themes](https://github.com/vim-airline/vim-airline-themes)
* [NerdTREE](https://github.com/scrooloose/nerdtree)
* [Ag](https://github.com/rking/ag)
* [Editorconfig](https://github.com/editorconfig/editorconfig-vim)
* [JavaScript](https://github.com/vim-javascript)
* [JSX](https://github.com/mxw/vim-jsx)
* [Typescript](https://github.com/leafgarland/typescript-vim)
* [Python](https://github.com/python-mode/python-mode)


## Suggestions/improvements [welcome](https://github.com/JenkinsDev/dotfiles/issues)!

