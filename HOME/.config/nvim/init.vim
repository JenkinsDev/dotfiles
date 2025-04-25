lua << EOF
  require'lspconfig'.ts_ls.setup{}
  require("config.lazy")

vim.cmd('syntax on') -- Turn on syntax highlight, y'all!
vim.cmd('filetype on') -- Allow vim to figure out the filetype we're opening

vim.opt.autoindent = true -- Allow for that beautiful autoindent
vim.opt.compatible = false -- No Vi compatibility mode.
vim.opt.splitright = true -- Force vim to open files to the right
vim.opt.number = true -- Show line numbers when editing a file
vim.opt.expandtab = true -- Use spaces instead of tabs

-- Filetype settings - indention, etc.
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.ts",
    command = "setlocal filetype=typescript"
})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.js",
    command = "setlocal filetype=javascript.jsx"
})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.jsx",
    command = "setlocal filetype=javascript.jsx"
})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.tsx",
    command = "setlocal filetype=typescript.jsx"
})

local filetypes = {
    css = 2,
    html = 2,
    javascript = 2,
    javascriptreact = 2,
    typescript = 2,
    typescriptreact = 2,
    json = 2,
    yaml = 2,
    python = 4,
    rust = 4,
    markdown = 2,
    ruby = 2,
    bash = 2,
    shell = 2,
    zsh = 2
}

for ft, sw in pairs(filetypes) do
    vim.api.nvim_create_autocmd("FileType", {
        pattern = ft,
        command = "setlocal tabstop=" .. sw .. " shiftwidth=" .. sw
    })
end

vim.g.mapleader = " " -- Set <leader> to space

-- NERDTree Configuration
vim.g.NERDTreeDirArrowExpandable = '▶'
vim.g.NERDTreeDirArrowCollapsible = '▼'

-- Telescope Configuration
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true, silent = true })

-- FINALIZATION
vim.cmd('filetype plugin indent on')
vim.api.nvim_create_autocmd("VimEnter", {
    command = "hi Normal guibg=NONE ctermbg=NONE"
})
vim.api.nvim_create_autocmd("VimEnter", {
    command = "hi NormalNC guibg=NONE ctermbg=NONE"
})
vim.api.nvim_create_autocmd("VimEnter", {
    command = "hi NormalSB guibg=NONE ctermbg=NONE"
})

EOF

" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath=&runtimepath
" source ~/.vimrc
