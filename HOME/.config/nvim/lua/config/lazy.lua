-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
      "folke/snacks.nvim",
      priority = 1000,
      lazy = false,
      --type snacks.Config
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        picker = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        --scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
      },
    },
    {"rust-lang/rust.vim"},
    {"peitalin/vim-jsx-typescript"},
    {"nvim-lua/plenary.nvim"},
    {"BurntSushi/ripgrep"},
    {"scrooloose/nerdtree"},
    {"nvim-treesitter/nvim-treesitter"},
    {"rebelot/kanagawa.nvim", opts = {undercurl = true}},
    {"neovim/nvim-lspconfig"},
    {"hrsh7th/cmp-nvim-lsp"},
    {"L3MON4D3/LuaSnip"},
    {"folke/trouble.nvim", opts = {}, cmd = "Trouble", keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    }},
    {"zbirenbaum/copilot.lua", opts = {}, config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          hide_during_completion = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>"
          }
        }
      })
    end},
    {"zbirenbaum/copilot-cmp", config = function ()
      require("copilot_cmp").setup()
    end},
    {"hrsh7th/nvim-cmp", config = function()
      local cmp = require'cmp'
      local luasnip = require'luasnip'

      -- used as a means to fix Tab selection with copilot-cmp + nvim-cmp
      -- https://github.com/zbirenbaum/copilot-cmp?tab=readme-ov-file#tab-completion-configuration-highly-recommended
      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
      end

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          {name = "copilot"},
          {name = "nvim_lsp"},
          {name = "luasnip"},
        }, {name = "buffer"}),
        mapping = cmp.mapping.preset.insert({
          ['<C-e>'] = cmp.mapping.abort(),
          ['<M-l>'] = cmp.mapping.confirm({select=true}),
          ["<Tab>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end),
        }),
        window = {
          completion = {
            border = { '', '', '', '', '', '', '', '' },
            winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
            winblend = vim.o.pumblend,
            scrolloff = 0,
            col_offset = 0,
            side_padding = 1,
            scrollbar = true,
            max_width = vim.api.nvim_win_get_width(0),
          }
        },
      })

      cmp.event:on("menu_opened", function()
        vim.b.copilot_suggestion_hidden = true
      end)

      cmp.event:on("menu_closed", function()
        vim.b.copilot_suggestion_hidden = false
      end)
    end},
    {"windwp/nvim-autopairs"},
    {"nvim-telescope/telescope.nvim"},
    {"salkin-mada/openscad.nvim", dependencies = {"L3MON4D3/LuaSnip"}, config = function()
      require('openscad')
      vim.g.openscad_load_snippets = true
    end},
  },

  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "kanagawa" } },

  -- automatically check for plugin updates
  checker = { enabled = true },
})

vim.cmd("colorscheme kanagawa-wave")
