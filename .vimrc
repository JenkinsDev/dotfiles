syntax on       " Turn on syntaix highlight, y'all!
filetype on     " Allow vim to figure out the filetype we're opening

set autoindent          " Allow for that beautiful autoindent
set nocompatible	" No Vi compatibility mode.
set splitright		" Force vim to open files to the right
set number		" Show line numbers when editing a file
set expandtab		" Use spaces instead of tabs 
" Timeout for listening to maps and key-strokes for commands.
" mapping timeout: 1 second
" key stroke timeout: 0.1 seconds
set timeoutlen=1000 ttimeoutlen=100	


"""""" Filetype settings - indention, etc.
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript            " Open .ts as typescript
autocmd BufNewFile,BufRead *.js setlocal filetype=javascript.jsx        " Default to JSX
autocmd BufNewFile,BufRead *.jsx setlocal filetype=javascript.jsx       " Bugged for some reason, so hard-code fix

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

""" Polyglot Configuration
let g:polyglot_disabled = ['python']    " Use Python Mode over Polyglot's python package
let g:jsx_ext_required = 0              " Parse .js files as possible JSX as well

""" NERDTree Configuration
let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
autocmd vimenter * NERDTree

""" YouCompleteMe Configuration
let g:ycm_python_binary_path = '/usr/bin/python3'

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


"""""" FINALIZATION
filetype plugin indent on
