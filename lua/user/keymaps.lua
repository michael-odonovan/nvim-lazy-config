
local M = {}
local opts = { noremap = true, silent = true }
local map = vim.keymap.set


-----------------------------------------------------
----------------- PLUGIN KEYMAPS --------------------
-----------------------------------------------------

-- BUFFERS
-- Close Buffers
map('n', '<leader>bn', ':bnext<cr>', { desc = '[b]uffer [n]ext' })
map('n', '<leader>bp', ':bprevious<cr>', { desc = '[b]uffer [p]revious' })
map('n', '<leader>bd', "<cmd>lua require('close_buffers').delete({ type = 'hidden', force = true }) <CR>", { desc = '[b]uffer [d]elete hidden'})

-- TROUBLE
map('n', '<leader>tr', ':TroubleToggle<CR>', {desc = '[tr]ouble'})


-- LUASNIP
map("i", "<C-j>", "<cmd>lua require'luasnip'.jump(1)<CR>")
map("s", "<C-j>", "<cmd>lua require'luasnip'.jump(1)<CR>")
map("i", "<C-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>")
map("s", "<C-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>")


-- TELESCOPE
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
map('n', '<leader>sg', builtin.live_grep, { desc = '[g]rep search' })
map('n', '<leader>sf', builtin.find_files, { desc = '[f]ile search' })
map('n', '<leader>sw', builtin.grep_string, { desc = '[w]ord search' })
map('n', '<leader>sr', builtin.resume, { desc = '[r]esume search' })
map('n', '<leader>s?', builtin.oldfiles, { desc = '[?] recent files search' })
map('n', '<leader>sb', builtin.buffers, { desc = '[b] Find existing buffers search' })
map('n', '<leader>sh', builtin.help_tags, { desc = '[h]elp search' })
map('n', '<leader>sd', builtin.diagnostics, { desc = '[d]iagnostic search' })
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')


-- UNDOTREE
map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = '[u]ndotree'})


-- HARPOON
map("n", "<leader>ha", require('harpoon.mark').add_file, { desc = '[h]arpoon [a]dd file'})
map("n", "<leader>he", require("harpoon.ui").toggle_quick_menu, { desc = '[h]arpoon [e]xplorer'})


-- NEURAL AI
vim.keymap.set("n", "<leader>n", [[:Neural ]], {desc = '[n]eural'}, opts)




------------------------------------------------------
----------------- General Keymaps --------------------
------------------------------------------------------

-- NUMBERS
vim.keymap.set("n", "<leader>r", ":set rnu!<CR>", {desc = '[r]elative numbers'}, opts)


-- FORMATTING
vim.keymap.set("n", "<leader>pf", vim.lsp.buf.format, {desc = '[p]roject [f]ormat'})


-- NETRW
-- open netrw shortcut
map("n", "<leader>e", vim.cmd.Ex, { desc = ':[e]x' })


-- OPENING IMAGES AND LINKS WITH GX COMMAND

-- Older Function that works for:
-- opening markdown links
-- opening netrw images
-- vim.keymap.set('n', 'gx', function()
--   local cfile = vim.fn.expand("<cfile>")
--   local full_path = vim.fn.expand("%:p:h") .. "/" .. cfile
--
--   -- Check if it looks like a URL
--   if cfile:match("^https?://") then
--     vim.fn.system("open " .. vim.fn.shellescape(cfile))
--   else
--     -- Assume it's a local file
--     vim.fn.system("/usr/bin/open " .. vim.fn.shellescape(full_path))
--   end
-- end)

-- Newer Function that works for:
-- opening markdown links
-- opening markdown images
-- opening netrw images
function _G.smart_open()
  local cfile = vim.fn.expand('<cfile>')
  local line = vim.fn.getline('.')

  -- Special handling for netrw
  if vim.bo.filetype == 'netrw' then
    -- Get the current directory in netrw
    local dir = vim.b.netrw_curdir or vim.fn.getcwd()
    -- Combine with the filename under cursor
    local full_path = dir .. '/' .. cfile

    -- Check if the file exists
    if vim.fn.filereadable(full_path) == 1 then
      vim.fn.jobstart({'open', full_path})
      return
    elseif vim.fn.isdirectory(full_path) == 1 then
      -- Let netrw handle directories
      vim.cmd.normal {'g', 'x', bang = true}
      return
    end
  end

  -- Check if it's a URL
  if cfile:match('^https?://') then
    vim.fn.jobstart({'open', cfile})
    return
  end

  -- Check if cfile is a readable file
  if vim.fn.filereadable(cfile) == 1 then
    vim.fn.jobstart({'open', cfile})
    return
  end

  -- Look for a full file path in the current line
  local path = line:match('(/[^%s]+%.%w+)')
  if path and vim.fn.filereadable(path) == 1 then
    vim.fn.jobstart({'open', path})
    return
  end

  -- Fall back to default gx behavior
  vim.cmd.normal {'g', 'x', bang = true}
end

-- Map gx to our custom function above
vim.api.nvim_set_keymap('n', 'gx', ':lua smart_open()<CR>', {noremap = true, silent = true})



-- SAVING
-- quitting is with tabs or buffers
map("n", "<C-s>", ":wa<CR>", opts)
map("n", "<leader>w", ":w<CR>", {desc ='[w]rite'}, opts)


-- SEARCH
map("n", "<leader>f", [[:%s/]], {desc = '[f]ind replace'})
map("n", "<leader>F", [[:,$s/]], {desc = '[F]ind replace from cursor'})
map("n", "<leader>x", [[/\<]], {desc = '[x]act word'})


-- SHIFTING BLOCKS OF TEXT
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")


-- CURSOR PLACEMENTS
-- on <C-d> <C-u> => make line the center of the screen (zz)
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
-- Search Next
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")


-- PASTE OVER ISSUES
map("x", "<leader>p", [["_dP]])
map({"n", "v"}, "<leader>d", [["_d]])


-- YANKING
map({"n", "v"}, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])


-- YANK CURRENT PATH
map('n', '<leader>y', [[:lua vim.fn.setreg('+', vim.fn.expand('%:p'))<CR>]], { noremap = true, silent = true })


-- VISUAL LINE MOVEMENT
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)


-- COPY TO THE SYSTEM CLIPBOARD WITH YY
map("n", "YY", "+y<CR>", opts)


-- MAKE YANK Y BEHAVE LIKE D & C
map("n", "Y", "y$", opts)


-- TABS
-- new tab with same cursor position
map("n", "<leader>at", "mm:tabnew %<CR>`m:delm m<CR>", {desc = '[tab] [n]ew'})
-- moving between tabs
-- map("n", "<leader>an", ":tabn<CR>", {desc = '[n]next tab'})
-- map("n", "<leader>ap", ":tabp<CR>", {desc = '[p]rev tab'})
map("n", "<S-l>", ":tabn<CR>", {desc = '[n]next tab'})
map("n", "<S-h>", ":tabp<CR>", {desc = '[p]rev tab'})
-- quitting windows / tabs
map("n", "<leader>q", ":q!<CR>", {desc = '[q]uit'})


-- SPLITS
map("n", "<leader>av", ":vsp<CR><C-w>l", {desc = '[v]ertical split'})


-- MY NOTES / WIKI MAPPINGS
map("n", "<leader>tb", "0i- [ ] ", {desc = '[t]ick [b]ox'} )
map("n", "<leader>td", "^wlrX<Esc>", {desc = '[t]odo [d]one'})
map("n", "<leader>tu", "^wlr <Esc>", {desc = '[t]odo [u]ndone'})


-- MOVE TO CURRENT WORKING DIRECTORY
map("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>", {desc = '[c]hange [d]irectory'})


-- STAY IN INDENT MODE
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)


-- SEARCH FOR VISUALLY SELECTED TEXT WITH //
map("v", "//", "y/\\V<C-r>=escape(@\",'/')<CR><CR>", opts)


-- BETTER WINDOW NAVIGATION
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)


-- QUICKFIX WINDOW
-- map("n", "<C-k>", "<cmd>cnext<CR>zz")
-- map("n", "<C-j>", "<cmd>cprev<CR>zz")
-- map("n", "<leader>k", "<cmd>lnext<CR>zz")
-- map("n", "<leader>j", "<cmd>lprev<CR>zz")


return M
