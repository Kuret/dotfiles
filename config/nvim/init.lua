--          --
-- Plugins  --
--          --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "nvim-lua/plenary.nvim",
{ "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" },
  "nvim-telescope/telescope.nvim",
{ "nvim-treesitter/nvim-treesitter", lazy = false, build = ":TSUpdate" },
  "sheerun/vim-polyglot",
  "ludovicchabant/vim-gutentags",
  "mhinz/vim-mix-format",
  "bogado/file-line",
  "inkarkat/vim-ReplaceWithRegister",
  "jghauser/mkdir.nvim",
  "numToStr/Comment.nvim",
  "https://codeberg.org/andyg/leap.nvim",
  "skywind3000/asyncrun.vim",
  "vim-test/vim-test",
  "rktjmp/lush.nvim",
  "lewis6991/gitsigns.nvim",
  "sindrets/winshift.nvim",
  "norcalli/nvim-colorizer.lua",
  "mcchrish/zenbones.nvim"
})


--          --
-- Settings --
--          --
local o = vim.opt
local fn = vim.fn
local set = vim.keymap.set
local indent = 2

o.wildmode = 'longest,list,full'
o.wildmenu = true
o.omnifunc = 'syntaxcomplete#Complete'

o.autowriteall = true -- Write all on exit
o.clipboard = 'unnamedplus' -- Native clipboard
o.completeopt = 'noinsert,menuone,noselect' -- Completion
o.mouse = 'a' -- Mouse support
o.shortmess = 'aoOTIcF' -- Disable welcome screen and other messages
o.splitbelow = true -- New splits below current window
o.splitright = true -- New splits right of current window
o.sessionoptions = 'blank,curdir,help,tabpages,winsize' -- What to save/restore from sessions
o.termguicolors = true -- Enable 24-bit RGB color support in the terminal
o.undofile = true -- Save undo history across sessions

o.tabstop = indent -- Amount of spaces to use for Tab
o.shiftwidth = indent -- Amount of spaces to use for indentation
o.expandtab = true -- Use spaces instead of tabs
o.swapfile = false -- Don't use swapfile for buffers

o.colorcolumn = '80,100' -- Show column at 80 and 100 chars
o.cursorline = true -- Highlight current line
o.fillchars = 'vert:│,eob: ' -- Full line separator for vsplits, No ~ for empty lines at end of buffer
o.number = true -- Show line numbers
o.relativenumber = true -- Show relative line numbers
o.scrolloff = 2 -- Keep at least 2 lines above/below
o.sidescrolloff = 2 -- Keep at least 2 columns left/right
o.statusline = '  %f:%l:%c  %m%=%{strlen(&ft)?&ft:"none"}  '
o.laststatus = 3 -- Global statusline
o.spell = false -- Disable global spell checking

o.backup = false -- Don't create backup files
o.writebackup = false -- Don't create backup files
o.updatetime = 300 -- Faster completion
o.signcolumn = 'yes' -- Always show signcolumn

--          --
-- Bindings --
--          --
vim.g.mapleader = " " -- Leader is space

set('n', '<leader>o', 'o<Esc>') -- Newline without insert

set('n', '<leader>cc', ':pclose<CR> <Bar> :cclose<CR>', {silent=true}) -- Close QuickFix and Preview windows
set('n', '<leader>bn', ':bn<CR>', {silent=true}) -- Next buffer
set('n', '<leader>bp', ':bp<CR>', {silent=true}) -- Previous buffer
set('n', '<leader>\\', ':vnew<CR>', {silent=true}) -- Vertical split
set('n', '<leader>-', ':new<CR>', {silent=true}) -- Horizontal split
set('n', '<C-J>', '<C-W><C-J>') -- Navigation down
set('n', '<C-K>', '<C-W><C-K>') -- Navigation up
set('n', '<C-L>', '<C-W><C-L>') -- Navigation right
set('n', '<C-H>', '<C-W><C-H>') -- Navigation left
set('n', '<leader><Right>', ':tabn<CR>') -- Next tab
set('n', '<leader><Left>', ':tabp<CR>') -- Previous tab
set('n', '<leader><Down>', ':tabc<CR>') -- Close tab
set('n', '<leader><Up>', ':tabnew<CR>') -- New tab
set('n', '<leader>nh', ':noh<CR>', {silent=true}) -- Clear highlight
set('n', '<leader>nw', [[:%s/\s\+$//<CR>]]) -- Trim trailing whitespace
set('n', '<leader>x', ':Sexplore<CR>', {silent=true}) -- Open nvim's default explorer in split
set('n', '<leader>q', ':wq<CR>', {silent=true}) -- Save and quit current buffer file
set('i', 'jj', '<Esc>') -- Quickly leave insert mode

-- Telescope --
set('n', '<leader>p', ':Telescope resume<CR>', {silent=true})
set('n', '<C-P>', ':Telescope find_files<CR>', {silent=true})
set('n', '<leader>fg', ':Telescope live_grep<CR>', {silent=true})

-- Vim-test --
set('n', '<leader>tl', ':TestLast<CR>', {silent=true})
set('n', '<leader>tt', ':TestNearest<CR>', {silent=true})
set('n', '<leader>tf', ':TestFile<CR>', {silent=true})
set('n', '<leader>ta', ':TestSuite<CR>', {silent=true})
set('n', '<leader>tv', ':TestVisit<CR>', {silent=true})

-- WinShift  --
set('n', '<leader>ws', ':WinShift<CR>', {silent=true})

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

vim.g.mix_format_on_save = 1
vim.g.mix_format_silent_errors = 1
	
require('Comment').setup()

vim.g['test#strategy'] = 'asyncrun'
vim.cmd 'au User AsyncRunStart call asyncrun#quickfix_toggle(15, 1)'

vim.g['test#elixir#exunit#options'] = {
  nearest = ' ',
  file = '--trace --stale',
  suite = '--stale'
}
	
require('gitsigns').setup()
require('winshift').setup()
require('colorizer').setup()

vim.o.background = 'light'
vim.g.seoulbones_lightness = 'dim'

vim.cmd [[
  colorscheme seoulbones
  highlight clear SignColumn
]]
	      
