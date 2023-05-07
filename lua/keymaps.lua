
local M = {}
local opts = { noremap = true, silent = true }
local map = vim.keymap.set


--------------------------------------
--          Plugin Keymaps          --
--------------------------------------

-- TELESCOPE
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

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


-- LAZYGIT
vim.keymap.set("n", "<leader>l", [[:LazyGit<CR>]], {desc = '[l]azygit'})
vim.g.lazygit_floating_window_scaling_factor = 1


-- UNDOTREE
map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = '[u]ndotree'})


-- TROUBLE
map("n", "<leader>tr", ":TroubleToggle<CR>", {desc = '[tr]ouble'})


-- HARPOON
map("n", "<leader>ha", require('harpoon.mark').add_file, { desc = '[h]arpoon [a]dd file'})
map("n", "<leader>he", require("harpoon.ui").toggle_quick_menu, { desc = '[h]arpoon [e]xplorer'})


-- NEURAL AI
vim.keymap.set("n", "<leader>n", [[:Neural ]], {desc = '[n]eural'})




---------------------------------------
--          General Keymaps          --
---------------------------------------

-- Formatting
vim.keymap.set("n", "<leader>pf", vim.lsp.buf.format, {desc = '[p]roject [f]ormat'})


-- Netrw
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


return M
