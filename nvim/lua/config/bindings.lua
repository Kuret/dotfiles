local map = require'helpers'.map
local m = vim.keymap

--                --
-- General Config --
--                --
-- Reload init - restart LSP client
map('n', '<leader>r', ':source $MYVIMRC<CR>:lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>:edit<CR>')
map('n', '<leader>o', 'o<Esc>') -- Newline without insert
map('n', '<leader>cc', ':pclose<CR> <Bar> :cclose<CR>', {silent=true}) -- Close QuickFix and Preview windows
map('n', '<leader>bn', ':bn<CR>', {silent=true}) -- Next buffer
map('n', '<leader>bp', ':bp<CR>', {silent=true}) -- Previous buffer
map('n', '<leader>\\', ':vnew<CR>', {silent=true}) -- Vertical split
map('n', '<leader>-', ':new<CR>', {silent=true}) -- Horizontal split
map('n', '<C-J>', '<C-W><C-J>') -- Navigation down
map('n', '<C-K>', '<C-W><C-K>') -- Navigation up
map('n', '<C-L>', '<C-W><C-L>') -- Navigation right
map('n', '<C-H>', '<C-W><C-H>') -- Navigation left
map('n', '<leader><Right>', ':tabn<CR>') -- Next tab
map('n', '<leader><Left>', ':tabp<CR>') -- Previous tab
map('n', '<leader><Down>', ':tabc<CR>') -- Close tab
map('n', '<leader><Up>', ':tabnew<CR>') -- New tab
map('n', '<leader>nh', ':noh<CR>', {silent=true}) -- Clear highlight
map('n', '<leader>nw', [[:%s/\s\+$//<CR>]]) -- Trim trailing whitespace
map('n', '<leader>x', ':Sexplore<CR>', {silent=true}) -- Open nvim's default explorer in split
map('n', '<leader>q', ':wq<CR>', {silent=true}) -- Save and quit current buffer file

map('i', 'jj', '<Esc>') -- Quickly leave insert mode
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr=true}) -- Next completion item
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr=true}) -- Previous completion item
map('i', '<CR>', 'pumvisible() ? "\\<C-y>" : "\\<CR>"', {expr=true}) -- Confirm completion item


--     --
-- LSP --
--     --
map('n', '<leader>gd', ':sp<CR><cmd>lua vim.lsp.buf.definition()<CR>', {silent=true}) -- Go to definition in horizontal split
map('n', '<leader>gD', ':vsp<CR><cmd>lua vim.lsp.buf.definition()<CR>', {silent=true}) -- Go to definition in vertical split
map('n', '<leader>gg', ':lua PeekDefinition()<CR>', {silent=true}) -- Go to definition in hover popup
map('n', '<leader>lr', ':lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>:edit<CR>', {silent=true}) -- Restart LSP Client

-- Telescope LSP Bindings
map('n', '<leader>gr', '<cmd>lua require\'telescope.builtin\'.lsp_references()<CR>', {silent=true}) -- Find references
map('n', '<leader>gs', '<cmd>lua require\'telescope.builtin\'.lsp_document_symbols()<CR>', {silent=true}) -- Find symbols in document
map('n', '<leader>gS', '<cmd>lua require\'telescope.builtin\'.lsp_workspace_symbols()<CR>', {silent=true}) -- Find symbols in entire workspace


--           --
-- Telescope --
--           --
map('n', '<C-L>', ':Telescope resume<CR>', {silent=true})
map('n', '<C-P>', ':Telescope find_files<CR>', {silent=true})
map('n', '<leader>fg', ':Telescope live_grep<CR>', {silent=true})


--          --
-- Vim-test --
--          --
map('n', '<leader>tl', ':TestLast<CR>', {silent=true})
map('n', '<leader>tt', ':TestNearest<CR>', {silent=true})
map('n', '<leader>tf', ':TestFile<CR>', {silent=true})
map('n', '<leader>ta', ':TestSuite<CR>', {silent=true})
map('n', '<leader>tv', ':TestVisit<CR>', {silent=true})


--           --
-- WinShift  --
--           --
map('n', '<leader>ww', ':WinShift<CR>', {silent=true})
map('n', '<leader>ws', ':WinShift swap<CR>', {silent=true})
