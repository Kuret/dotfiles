require'settings'

if not vim.g.vscode then
  require'plugins'
  require'bindings'
else
  require'vscode'
end
