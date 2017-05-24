syntax on       " Turn on syntaix highlight, y'all!
filetype on     " Allow vim to figure out the filetype we're opening

set nocompatible	" No Vi compatibility mode.
set splitright		" Force vim to open files to the right
set number		" Show line numbers when editing a file
set expandtab		" Use spaces instead of tabs

" Timeout for listening to maps and key-strokes for commands.
" mapping timeout: 1 second
" key stroke timeout: 0.1 seconds
set timeoutlen=1000 ttimeoutlen=100	


"""""" Filetype settings - indention, etc.
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript " Open .ts as typescript

autocmd Filetype css setlocal tabstop=2 shiftwidth=2
autocmd Filetype html setlocal tabstop=2 shiftwidth=2
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2
autocmd Filetype typescript setlocal tabstop=4 shiftwidth=4
autocmd Filetype json setlocal tabstop=2 shiftwidth=2
autocmd Filetype python setlocal tabstop=4 shiftwidth=4


"""""" Setup Vundle and load its plugins!
set rtp+=~/.vim/bundle/Vundle.vim       
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'			" Vundle Plugin - let vundle update itself
Plugin 'sheerun/vim-polyglot.git'		" A seriously fast, and vast, language pack
Plugin 'vim-syntastic/syntastic.git'		" Syntax Checking
Plugin 'tpope/vim-surround.git'			" For Easy Editing Of HTML, XML, Changing Surrounding Quotes, etc.
Plugin 'Valloric/YouCompleteMe.git'		" Gnarly completion engine!

Plugin 'chriskempson/base16-vim.git'		" Add the base16-vim color schemes
Plugin 'vim-airline/vim-airline.git'		" Lean & Mean Status Bar
Plugin 'vim-airline/vim-airline-themes.git'	" Themes for the vim airline plugin

Plugin 'scrooloose/nerdtree.git'                " Tree explorer for vim; a lot of people are giving it flak, I want to try it.
Plugin 'rking/ag.vim'				" The Silver Searcher vim plugin

Plugin 'editorconfig/editorconfig-vim'          " Editorconfig Vim Plugins (use .editorconfig files)

Plugin 'pangloss/vim-javascript'                " VIM JavaScript - Used By Vim JSX
Plugin 'mxw/vim-jsx'                            " React/JSX Plugin For Vim
Plugin 'leafgarland/typescript-vim'             " Typescript Plugin

Plugin 'python-mode/python-mode.git'		" Python Mode, DUH
call vundle#end()


"""""" PLUGIN CONFIGURATION
""" Syntastic Configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


""" NERDTree Configuration
let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
autocmd vimenter * NERDTree

""" YouCompleteMe Configuration
let g:ycm_python_binary_path = '/usr/bin/python3'

""" Colorscheme Configuration
let base16colorspace=256
source ~/.vimrc_background

""" Airline Configuration
let g:airline_theme = 'bubblegum'
let g:airline_section_a = airline#section#create(['mode', '', 'branch'])
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'


"""""" Abbreviations
iabbrev hmtl html
iabbrev waht what
iabbrev tehn then
iabbrev adn and
iabbrev sjx jsx
iabbrev teh the


"""""" Auto Indent On Save
autocmd BufWritePre *.html :normal gg=G``
autocmd BufWritePre *.js :normal gg=G``
autocmd BufWritePre *.ts :normal gg=G``
autocmd BufWritePre *.jsx :normal gg=G``
autocmd BufWritePre *.css :normal gg=G``
autocmd BufWritePre *.json :normal gg=G``
autocmd BufWritePre *.go :normal gg=G``
autocmd BufWritePre *.py :normal gg=G``


"""""" FINALIZATION
filetype plugin indent on
