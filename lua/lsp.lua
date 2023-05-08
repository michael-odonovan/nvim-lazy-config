local M = {}

local map = vim.keymap.set

-- lsp ---------------------------------------------
local lsp = require("lsp-zero")
local luaserver = 'lua_ls'

lsp.preset("recommended")

lsp.ensure_installed({
  -- note these server names can't include hyphens
  luaserver,
  'tsserver',
  'cssls',
  'html',
  'bashls',
  'pyright'
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  map("n", "gd", function() vim.lsp.buf.definition() end, opts)
  map("n", "gl", function() vim.diagnostic.open_float() end, opts)
  map("n", "K", function() vim.lsp.buf.hover() end, opts)
  map("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  map("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  map("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  map("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  map("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  map("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  map("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

end)

lsp.setup()

vim.diagnostic.config({
  -- don't show errors inline
  virtual_text = false
})


return M
