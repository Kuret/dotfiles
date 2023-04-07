local execute = vim.api.nvim_command
local fn = vim.fn

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

-- Completions
Plug 'github/copilot.vim'

Plug 'quangnguyen30192/cmp-nvim-tags'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'

-- Finding
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug('nvim-telescope/telescope-fzf-native.nvim', {['do'] = 'make'})

-- Language support
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-mix-format'

-- Editing
Plug 'numToStr/Comment.nvim'
Plug 'bogado/file-line'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'ggandor/leap.nvim'
Plug 'arp242/auto_mkdir2.vim'

-- Testing
Plug 'janko-m/vim-test'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-dispatch'

-- UI
Plug 'lewis6991/gitsigns.nvim'
Plug 'sindrets/winshift.nvim'
Plug 'norcalli/nvim-colorizer.lua'


-- Themes
Plug 'rktjmp/lush.nvim'
Plug 'npxbr/gruvbox.nvim'
Plug 'pgdouyon/vim-yin-yang'

-- Meta
Plug 'wakatime/vim-wakatime'

vim.call('plug#end')

--                       --
-- Plugins configuration --
--                       --

require('leap').set_default_keymaps()

local cmp = require'cmp'
cmp.setup {
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        buffer = "[Buffer]",
        path = "[Path]",
        tags = "[Tags]"
      })[entry.source.name]
      return vim_item
    end
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.SelectBehavior.Replace, select = false }),
    ["<Esc>"] = cmp.mapping.abort()
  }),
  sources = cmp.config.sources({
    { name = 'tags' },
    { name = 'buffer' },
    { name = 'path' }
  })
}

require('gitsigns').setup()

-- Comment --
require('Comment').setup()

-- Copilot --
vim.g.copilot_node_command = fn.expand("~/.fnm/node-versions/v18.14.2/installation/bin/node")
vim.g.copilot_no_tab_map = true

-- Telescope --
local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

require('telescope').load_extension('fzf')

-- Elixir format --
vim.g.mix_format_on_save = 1
vim.g.mix_format_silent_errors = 1

-- Colorizer --
require'colorizer'.setup()

-- Vim-test --
vim.g['test#strategy'] = 'asyncrun'
vim.cmd 'au User AsyncRunStart call asyncrun#quickfix_toggle(15, 1)'

vim.g['test#elixir#exunit#options'] = {
  nearest = '',
  file = '--trace --stale',
  suite = '--stale'
}

-- WinShift --
require'winshift'.setup()

-- Colorscheme --
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_italic_comments = '1'
vim.g.gruvbox_improved_warnings = '1'
-- vim.o.background = 'dark'
vim.o.background = 'light'
vim.cmd [[
  " colorscheme gruvbox
  colorscheme yang
  highlight clear SignColumn
]]
