local set = vim.keymap.set

set('n', '<leader>o', 'o<Esc>') -- Newline without insert

-- Vim-test --
set('n', '<leader>tt', '<cmd>call VSCodeNotifyVisual(\'extension.elixirRunTestAtCursor\', 1)<CR>', {silent=true})
set('n', '<leader>tf', '<cmd>call VSCodeNotifyVisual(\'extension.elixirRunTestFile\', 1)<CR>', {silent=true})
set('n', '<leader>ta', '<cmd>call VSCodeNotifyVisual(\'extension.elixirRunTestSuite\', 1)<CR>', {silent=true})
set('n', '<leader>tv', '<cmd>call VSCodeNotifyVisual(\'extension.elixirJumpToTest\', 1)<CR>', {silent=true})

-- Commentary
set('x', 'gc', '<Plug>VSCodeCommentary', {silent=true})
set('n', 'gc', '<Plug>VSCodeCommentary', {silent=true})
set('o', 'gc', '<Plug>VSCodeCommentary', {silent=true})
set('n', 'gcc', '<Plug>VSCodeCommentaryLine', {silent=true})
