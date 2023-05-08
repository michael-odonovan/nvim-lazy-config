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



-- Luasnip -------------------------------------------------

map("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>")
map("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>")
map("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>")
map("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>")


-- telescope -------------------------------------------------
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local map = vim.keymap.set

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

map('n', '<leader>sg', builtin.live_grep, { desc = '[g]rep search' })
map('n', '<leader>sf', builtin.find_files, { desc = '[f]ile search' })
map('n', '<leader>sw', builtin.grep_string, { desc = '[w]ord search' })
map('n', '<leader>sr', builtin.resume, { desc = '[r]esume search' })

map('n', '<leader>s?', builtin.oldfiles, { desc = '[?] recent files search' })
map('n', '<leader>sb', builtin.buffers, { desc = '[b] Find existing buffers search' })
map('n', '<leader>sh', builtin.help_tags, { desc = '[h]elp search' })
map('n', '<leader>sd', builtin.diagnostics, { desc = '[d]iagnostic search' })


require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-p>'] = actions.cycle_history_prev,
        ['<C-n>'] = actions.cycle_history_next,
      },
    },
  },
}



-- treesitter ------------------------------------------
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the first four listed parsers should always be installed)
  ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}


