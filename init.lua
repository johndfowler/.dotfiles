-- Declare vim as global
---@diagnostic disable: undefined-global
local vim = vim

-- Auto-reload on save
-- This autocommand group will automatically reload the init.lua file and run PackerSync whenever the init.lua file is saved.
local packer_user_config_group = vim.api.nvim_create_augroup('packer_user_config', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  group = packer_user_config_group,
  pattern = 'init.lua',
  command = 'source <afile> | PackerSync',
})

-- Configure vim-doge
-- Enable default mappings for vim-doge
vim.g.doge_enable_mappings = 1
-- Set the docstring standard for Python (e.g., 'google', 'numpy', 'pep257')
vim.g.doge_doc_standard_python = 'google'
-- Set the docstring standard for JavaScript (e.g., 'jsdoc', 'closure')
vim.g.doge_doc_standard_javascript = 'jsdoc'
-- Set the docstring standard for TypeScript (e.g., 'tsdoc', 'jsdoc')
vim.g.doge_doc_standard_typescript = 'tsdoc'

-- Require plugin configuration
-- This will load the plugin configuration from the 'plugins' module.
require('plugins')

-- Require LSP configuration
-- This will load the LSP configuration from the 'lsp' module.
require('lsp')

-- Set up Mason
-- This will set up Mason and ensure that the 'lua_ls' language server is installed.
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'spectral' },
})