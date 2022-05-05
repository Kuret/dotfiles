local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end


require('packer').startup({function(use, use_rocks)
  use 'wbthomason/packer.nvim'

  -- LSP --
  use 'neovim/nvim-lspconfig' -- LSP Configs for built-in LSP client

  -- Completion --
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'

  -- Finders --
  use 'nvim-lua/popup.nvim' -- Popup support for telescope
  use 'nvim-lua/plenary.nvim' -- Required for telescope popup/telescope - Helper functions for lua
  use 'nvim-telescope/telescope.nvim' -- FZF Finder
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- FZF Finding

  -- Languages --
  use 'sheerun/vim-polyglot' -- Syntax highlighting for common languages
  use 'mhinz/vim-mix-format' -- Format Elixir files on save

  -- Editing --
  use 'b3nj5m1n/kommentary' -- Comment lines
  use 'vim-scripts/ReplaceWithRegister' -- Replace lines with register
  use 'bogado/file-line' -- Open vim with filename:fileline arguments

  -- Git --
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  } -- Git signs in the gutter

  -- Testing / runners --
  use 'janko-m/vim-test' -- Test runners
  use 'skywind3000/asyncrun.vim' -- Async runner
  use 'tpope/vim-dispatch' -- Dispatch commands

  -- Misc --
  use 'gelguy/wilder.nvim' -- Wildmenu
  use 'sindrets/winshift.nvim' -- Move windows

  -- WakaTime --
  use 'wakatime/vim-wakatime' -- Track programming activity

  -- Colors --
  use 'norcalli/nvim-colorizer.lua' -- Colorize color strings/codes
  use 'rktjmp/lush.nvim'
  use 'npxbr/gruvbox.nvim' -- Gruvbox theme
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  },
  luarocks = {
    python_cmd = 'python3'
  }
}})


--                       --
-- Plugins configuration --
--                       --

-- LSP Config --
require'config.lsp'

-- Completion --
local cmp = require'cmp'
cmp.setup({
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      end
    end, { "i", "s" }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})

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

-- Wilder --
vim.cmd [[
  call wilder#setup({'modes': [':', '/', '?']})
  call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
      \ 'highlights': {
      \   'border': 'Normal',
      \   'default': 'Normal',
      \ },
      \ 'border': 'rounded',
      \ })))
]]

-- WinShift --
require("winshift").setup({
  highlight_moving_win = true,  -- Highlight the window being moved
  focused_hl_group = "Visual",  -- The highlight group used for the moving window
  moving_win_options = {
    -- These are local options applied to the moving window while it's
    -- being moved. They are unset when you leave Win-Move mode.
    wrap = false,
    cursorline = false,
    cursorcolumn = false,
    colorcolumn = "",
  },
  -- The window picker is used to select a window while swapping windows with
  -- ':WinShift swap'.
  -- A string of chars used as identifiers by the window picker.
  window_picker_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
  window_picker_ignore = {
    -- This table allows you to indicate to the window picker that a window
    -- should be ignored if its buffer matches any of the following criteria.
    filetype = {  -- List of ignored file types
      "NvimTree",
    },
    buftype = {   -- List of ignored buftypes
      "terminal",
      "quickfix",
    },
    bufname = {   -- List of regex patterns matching ignored buffer names
      [[.*foo/bar/baz\.qux]]
    },
  },
})

-- Colorscheme --
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_italic = '1'
vim.g.gruvbox_improved_warnings = '1'
vim.o.background = 'dark'
vim.cmd [[
  colorscheme gruvbox
  highlight clear SignColumn
]]
