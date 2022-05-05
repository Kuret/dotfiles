vim.lsp.set_log_level("debug") -- So I can actually see what's wrong when LSP decides to not work again

-- Format on save
-- Doing *.ex,*.exs with vim-mix-format for now
vim.cmd 'au BufWritePre *.rb,*.erb lua vim.lsp.buf.formatting_sync(nil, 2000)'

-- Add options upon attaching to buffers (Completion, capabilities)
local enhance_attach = function(client,bufnr)
  local has_completion,completion = pcall(require,'completion')
  if not has_completion then
    print('Does not load completion-nvim')
    return
  end
  completion.on_attach({
    chain_complete_list = {
      default = {
        {complete_items = {'lsp', 'snippet', 'buffer'}},
        {complete_items = {'path'}, triggered_only = {'/'}}
      }
    }
  })

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

-- Initialize LSP for Elixir, disable Dialyzer because it's slow
-- https://github.com/elixir-lsp/elixir-ls
require'lspconfig'.elixirls.setup{
  cmd = { "elixir-ls" },
  on_attach = enhance_attach,
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      suggestSpecs = false,
      mixEnv = "test"
    }
  }
}

-- LSP for Ruby
-- gem install --user-install solargraph
require'lspconfig'.solargraph.setup{}

-- LSP for JSON files
-- npm install -g vscode-json-languageserver
require'lspconfig'.jsonls.setup{
  on_attach = enhance_attach,
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0}) -- Format entire range, not supported out of the box
      end
    }
  }
}

-- LSP for CSS (Doesn't work right with Elixir + Cells)
-- npm install -g vscode-css-languageserver-bin
require'lspconfig'.cssls.setup{
  on_attach = enhance_attach,
  settings = {
    css = {
      validate = true,
      lint = {
        emptyRules = "ignore",
        unknownAtRules = "ignore"
      }
    }
  }
}

-- LSP for JS (Doesn't work right with Elixir + Cells)
-- npm install -g typescript typescript-language-server
require'lspconfig'.tsserver.setup{on_attach = enhance_attach}


--               --
-- Mis functions --
--               --
local function preview_location_callback(_, _, result)
  if result == nil or vim.tbl_isempty(result) then
    return nil
  end
  local height = vim.api.nvim_get_option("lines")
  local start = result["range"]["start"]["line"]
  result["range"]["end"]["line"] = start + math.ceil(height * 0.5)

  vim.lsp.util.preview_location(result)
end

function PeekDefinition()
  local params = vim.lsp.util.make_position_params()
  return vim.lsp.buf_request(0, 'textDocument/definition', params, preview_location_callback)
end
