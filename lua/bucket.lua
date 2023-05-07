-- colorizer
require 'colorizer'.setup {
  'lua';
  'css';
  'javascript';
  html = {
    mode = 'foreground';
  }
}

-- formatting

-- Formatting on keymap
vim.keymap.set("n", "<leader>pf", vim.lsp.buf.format, {desc = '[p]roject [f]ormat'})

-- Format on Save
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   pattern = { "*.ts" },
--   callback = function()
--     vim.lsp.buf.format { async = true }
--   end,
-- })

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local map = vim.keymap.set

map("n", "<leader>ha", mark.add_file, { desc = '[h]arpoon [a]dd file'})
map("n", "<leader>he", ui.toggle_quick_menu, { desc = '[h]arpoon [e]xplorer'})
-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
--
-- require("indent_blankline").setup {
--     show_end_of_line = true,
--     space_char_blankline = " ",
-- }
-- keymaps
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- Netrw ======================
map("n", "<leader>e", vim.cmd.Ex, { desc = ':[e]x' })

-- Saving, Exiting
map("n", "<C-s>", ":wa<CR>", opts)
map("n", "<leader>w", ":w<CR>", {desc ='[w]rite'}, opts)
map("n", "<leader>q", ":q!<CR>", {desc = '[q]uit'})

-- Search
map("n", "<leader>f", [[:%s/]], {desc = '[f]ind replace'})
map("n", "<leader>F", [[:,$s/]], {desc = '[F]ind replace from cursor'})

-- shifting Blocks of Text
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Cursor Placements:
-- on <C-d> <C-u> => make line the center of the screen (zz)
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
-- Search Next
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Paste over issues
map("x", "<leader>p", [["_dP]])
map({"n", "v"}, "<leader>d", [["_d]])

-- Yanking, ahem...
map({"n", "v"}, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

-- Visual Line Movement
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)

-- Copy to the System Clipboard with YY
map("n", "YY", "+y<CR>", opts)

-- Make yank Y behave like D & C
map("n", "Y", "y$", opts)

-- Tabs
-- new tab with same cursor position
map("n", "<leader>at", "mm:tabnew %<CR>`m:delm m<CR>", {desc = '[tab] [n]ew'})
-- moving between tabs
map("n", "<leader>an", ":tabn<CR>", {desc = '[n]next tab'})
map("n", "<leader>ap", ":tabp<CR>", {desc = '[p]rev tab'})

-- Splits
map("n", "<leader>av", ":vsp<CR><C-w>l", {desc = '[v]ertical split'})

-- my notes / wiki mappings
map("n", "<leader>tb", "0i- [ ] ", {desc = '[t]ick [b]ox'} )
map("n", "<leader>td", "^wlrX<Esc>", {desc = '[t]odo [d]one'})
map("n", "<leader>tu", "^fXr ", {desc = '[t]odo [u]ndone'})

-- Current Working Directory stuff
map("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>", {desc = '[c]hange [d]irectory'})

-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Search for visually selected text with //
map("v", "//", "y/\\V<C-R>=escape(@\",'/')<CR><CR>", opts)

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- quickfix window
-- map("n", "<C-k>", "<cmd>cnext<CR>zz")
-- map("n", "<C-j>", "<cmd>cprev<CR>zz")
-- map("n", "<leader>k", "<cmd>lnext<CR>zz")
-- map("n", "<leader>j", "<cmd>lprev<CR>zz")

-- lazygit in a floating window
vim.keymap.set("n", "<leader>l", [[:LazyGit<CR>]], {desc = '[l]azygit'})
vim.g.lazygit_floating_window_scaling_factor = 1
-- lsp
local lsp = require("lsp-zero")
local luaserver = 'lua_ls'
local map = vim.keymap.set

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
-- Luasnip
local map = vim.keymap.set

map("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>")
map("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>")
map("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>")
map("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>")


-- macros
vim.cmd([[
" Notice the <Esc> etc. have to be escaped with \

" CSS add !important
let @i="0f;i !important\<esc>"

" Create styled component => start anywhere in a naked word, ie. MyComponet but noe <MyComponent/>
let @s="viw\"pygg}O\<cr>const \<esc>\"ppa = styled.div`\<esc>A;\<esc>hi\<cr>\<esc>i  "

]])
-- Neural AI
vim.keymap.set("n", "<leader>n", [[:Neural ]], {desc = '[n]eural'})

-- my status line
-- https://nihilistkitten.me/nvim-lua-statusline/
function status_line()
  return table.concat {
    "%{FugitiveStatusline()} ",
    "%f",
  }
end
-- telescope
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
-- treesitter
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
-- Trouble
local map = vim.keymap.set

map("n", "<leader>tr", ":TroubleToggle<CR>", {desc = '[tr]ouble'})

-- Undotree
local map = vim.keymap.set

map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = '[u]ndotree'})


