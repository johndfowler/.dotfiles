-- Declare vim as global
---@diagnostic disable: undefined-global
local vim = vim

-- LSP Configuration
local lspconfig = require('lspconfig')

-- List of LSP servers to configure
local servers = {
  'lua_ls', 'pyright', 'rust_analyzer', 'powershell_es', 'html', 'cssls', 'terraformls', 'clangd', 'ts_ls', 'gopls',
  'bashls', 'jsonls', 'yamlls', 'dockerls', 'vuels', 'svelte', 'phpactor', 'jdtls', 'omnisharp', 'r_language_server'
}

-- Function to run when the LSP server attaches to a buffer
---@param client table
---@param bufnr number
local function on_attach(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Create an autocommand group for LSP-related commands
  local augroup = vim.api.nvim_create_augroup('LspAutocommands', { clear = true })
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = augroup,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ async = true })
    end,
  })
end

-- Configure each LSP server
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end