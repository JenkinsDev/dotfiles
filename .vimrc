syntax on       " Turn on syntax highlight, y'all!
filetype on     " Allow vim to figure out the filetype we're opening

filetype indent plugin on

set autoindent    " Allow for that beautiful autoindent
set nocompatible  " No Vi compatibility mode.
set splitright    " Force vim to open files to the right
set number	  " Show line numbers when editing a file
set expandtab	  " Use spaces instead of tabs 

" Timeout for listening to maps and key-strokes for commands.
" mapping timeout: 1 second
" key stroke timeout: 0.1 seconds
" set timeoutlen=1000 ttimeoutlen=100	


"""""" Filetype settings - indention, etc.
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript            " Open .ts as typescript
autocmd BufNewFile,BufRead *.js setlocal filetype=javascript.jsx        " Default to JSX
autocmd BufNewFile,BufRead *.jsx setlocal filetype=javascript.jsx       " Bugged for some reason, so hard-code fix
autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.jsx       " Bugged for some reason, so hard-code fix

autocmd Filetype css setlocal tabstop=2 shiftwidth=2
autocmd Filetype html setlocal tabstop=2 shiftwidth=2
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2
autocmd Filetype javascriptreact setlocal tabstop=2 shiftwidth=2
autocmd Filetype typescript setlocal tabstop=2 shiftwidth=2
autocmd Filetype typescriptreact setlocal tabstop=2 shiftwidth=2
autocmd Filetype json setlocal tabstop=2 shiftwidth=2
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2
autocmd Filetype python setlocal tabstop=4 shiftwidth=4
autocmd Filetype rust setlocal tabstop=4 shiftwidth=4
autocmd Filetype markdown setlocal tabstop=2 shiftwidth=2
autocmd Filetype ruby setlocal tabstop=2 shiftwidth=2
autocmd Filetype bash setlocal tabstop=2 shiftwidth=2
autocmd Filetype shell setlocal tabstop=2 shiftwidth=2
autocmd Filetype zsh setlocal tabstop=2 shiftwidth=2


"""""" Setup Vundle and load its plugins!
set rtp+=~/.vim/bundle/Vundle.vim       
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'           " Vundle Plugin - let vundle update itself
Plugin 'ThePrimeagen/vim-be-good'

" Language Packs
Plugin 'rust-lang/rust.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'

" Find / Grepping (ff, fg, fb, fh)
Plugin 'nvim-lua/plenary.nvim'           " Plenary - a lua library for neovim (used by telescope)
Plugin 'nvim-telescope/telescope.nvim'   " Telescope - fuzzy finder
Plugin 'BurntSushi/ripgrep.git'          " Ripgrep - a fast grep alternative

" Editor Enhancements
Plugin 'scrooloose/nerdtree.git'        " tree explorer
Plugin 'iamcco/markdown-preview.nvim'   " markdown preview
Plugin 'editorconfig/editorconfig-vim'  " .editorconfig plugin
"Plugin 'github/copilot.vim'             " OpenAI Codex Copilot Plugin
Plugin 'nvim-treesitter/nvim-treesitter' " Treesitter
Plugin 'EdenEast/nightfox.nvim'

Plugin 'neovim/nvim-lspconfig'
Plugin 'hrsh7th/nvim-cmp'
Plugin 'hrsh7th/cmp-nvim-lsp'
Plugin 'supermaven-inc/supermaven-nvim'

Plugin 'L3MON4D3/LuaSnip'
Plugin 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}
Plugin 'windwp/nvim-autopairs'
call vundle#end()


"""""" PLUGIN CONFIGURATION
""" Vim/Neovim
let mapleader = " " " Set <leader> to space

""" Polyglot Configuration
let g:polyglot_disabled = ['python']    " Use Python Mode over Polyglot's python package
let g:jsx_ext_required = 0              " Parse .js files as possible JSX as well

""" NERDTree Configuration
let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'

""" Telescope Configuration
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"""""" FINALIZATION
filetype plugin indent on
colorscheme nightfox
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi NormalNC guibg=NONE ctermbg=NONE
autocmd vimenter * hi NormalSB guibg=NONE ctermbg=NONE
