lua << EOF
  require'lspconfig'.ts_ls.setup{}
  require("config.lazy")
EOF

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
