# dotfiles

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

You can clone the repository wherever you want. The install script will pull in the latest version and copy the files to your home folder via rsync.

```bash
git clone https://github.com/JenkinsDev/dotfiles.git && cd dotfiles && source install.zsh
```

To update, `cd` into your local `dotfiles` repository and then `source install.sh`.


## Software Specific Settings/Keybindings

### Zsh

#### Files

* `~/.zsh_profile` - Used for settings that should not be stored in source control. (i.e: Some Env Vars, ...)

### tmux

* Default Shell: `zsh`
* Prefix: `C-t`
* Split Window Vertical: `C-t -`
* Split Window Horizontal: `C-t |`
* Change Pane (Left): `M-h`
* Change Pane (Right): `M-l`
* Change Pane (Down): `M-j`
* Change Pane (Up): `M-k`
