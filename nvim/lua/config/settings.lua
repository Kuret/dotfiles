local o = vim.opt
local fn = vim.fn
local indent = 2

o.autowriteall = true -- Write all on exit
o.clipboard = 'unnamedplus' -- Native clipboard
o.completeopt = 'noinsert,menuone,noselect' -- Completion
o.mouse = 'a' -- Mouse support
o.shortmess = 'aoOTIcF' -- Disable welcome screen and other messages
o.splitbelow = true -- New splits below current window
o.splitright = true -- New splits right of current window
o.sessionoptions = 'blank,curdir,help,tabpages,winsize' -- What to save/restore from sessions
o.termguicolors = true -- Enable 24-bit RGB color support in the terminal
o.undodir = fn.expand('~/.config/nvim/undodir') -- Location for undo file
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
o.spell = true -- Enable spell checking
o.statusline = '  %f:%l:%c  %m%=%{strlen(&ft)?&ft:"none"}  '
o.laststatus = 3 -- Global statusline

vim.cmd 'au TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false, timeout=1000}' -- Highlight text on yank
vim.cmd 'au FocusGained,BufEnter,CursorHold,CursorHoldI * checktime' -- Reload file when it changes on disk
vim.cmd 'au FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None' -- Reload file when it changes on disk
vim.cmd [[au BufWritePre * :%s/\s\+$//e]] -- Trim whitespace on save

-- Leader is space
vim.g.mapleader = " "
