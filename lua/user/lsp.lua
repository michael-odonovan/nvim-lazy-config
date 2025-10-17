local M = {}
local map = vim.keymap.set
local lsp_zero = require('lsp-zero')

-- ======================================
-- LSP on_attach keymaps
-- ======================================
lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
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

-- ======================================
-- Mason + LSPConfig setup
-- ======================================
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'ts_ls',
    'cssls',
    'html',
    'bashls',
    'pyright',
  },
  handlers = {
    -- Default setup for most servers
    function(server_name)
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require('lspconfig')[server_name].setup({
        capabilities = capabilities,
      })
    end,

    -- Custom setup for Lua
    lua_ls = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require('lspconfig').lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      })
    end,
  },
})

-- ======================================
-- Completion (nvim-cmp + luasnip)
-- ======================================
local cmp = require('cmp')
local luasnip = require('luasnip')

-- Load VSCode-style snippets if available
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),            -- Trigger completion
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  }),
})

-- ======================================
-- Diagnostics setup
-- ======================================
vim.diagnostic.config({
  virtual_text = false,
})

return M

