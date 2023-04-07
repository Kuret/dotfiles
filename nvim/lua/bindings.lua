local set = vim.keymap.set

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

-- Copilot --
set('i', '<C-j>', 'copilot#Accept("\\<CR>")', {silent=true, expr=true}) -- Copilot accept suggestion
set('i', ']]', 'copilot#Next()', {silent=true, expr=true}) -- Copilot accept suggestion
set('i', '[[', 'copilot#Previous()', {silent=true, expr=true}) -- Copilot accept suggestion

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
