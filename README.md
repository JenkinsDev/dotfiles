# Dotfiles

Fish, tmux, Neovim and kitty configuration for macOS and Linux. On Arch, install fish, tmux, neovim, kitty, git and ripgrep with pacman. Neovim bootstraps its plugins on first launch; language servers and Copilot authentication require separate setup. A recent Neovim supporting vim.lsp.enable is required.

Run `fish install.fish` from this checkout. Existing destinations are skipped; back them up or merge them manually. XDG_CONFIG_HOME is respected. Set fish as your login shell if desired.

Oh My Fish is optional. Keep machine-specific settings and secrets in ~/.fishrc, which is sourced by fish and not tracked here.
