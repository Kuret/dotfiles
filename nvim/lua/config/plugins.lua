local execute = vim.api.nvim_command
local fn = vim.fn

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

if not vim.g.vscode then
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'github/copilot.vim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug('nvim-telescope/telescope-fzf-native.nvim', {['do'] = 'make'})
  Plug 'sheerun/vim-polyglot'
  Plug 'mhinz/vim-mix-format'
  Plug 'b3nj5m1n/kommentary'
  Plug 'bogado/file-line'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'janko-m/vim-test'
  Plug 'skywind3000/asyncrun.vim'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-heroku'
  Plug 'tpope/vim-dadbod'
  Plug 'kristijanhusak/vim-dadbod-ui'
  Plug 'sindrets/winshift.nvim'
  Plug 'wakatime/vim-wakatime'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'rktjmp/lush.nvim'
  Plug 'npxbr/gruvbox.nvim'
end

Plug 'vim-scripts/ReplaceWithRegister'
Plug 'ggandor/leap.nvim'

vim.call('plug#end')

--                       --
-- Plugins configuration --
--                       --

require('leap').set_default_keymaps()

if not vim.g.vscode then
  -- LSP Config --
  require('config.lsp')

  -- Gitsigns --
  require('gitsigns').setup()

  -- Copilot --
  vim.g.copilot_node_command = fn.expand("~/.asdf/installs/nodejs/16.16.0/bin/node")
  vim.g.copilot_no_tab_map = true

  -- Completion --
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

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

  -- WinShift --
  require'winshift'.setup()

  -- Colorscheme --
  vim.g.gruvbox_contrast_dark = 'hard'
  vim.g.gruvbox_italic_comments = '1'
  vim.g.gruvbox_improved_warnings = '1'
  vim.o.background = 'dark'
  vim.cmd [[
    colorscheme gruvbox
    highlight clear SignColumn
  ]]
end
