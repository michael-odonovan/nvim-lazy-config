local M = {}


-----------------------------------
--	not sure                 --
-----------------------------------

-- indents
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true -- convert tabs to spaces
vim.o.smartindent = true

-- deal with @ in file names
-- vim.o.isfname:append("@-@")

-- vim.o.whichwrap:append {
--   ['<'] = true,
--   ['>'] = true,
--   ['['] = true,
--   [']'] = true,
--   h = true,
--   l = true,
-- }

-----------------------------------
--	settled                  --
-----------------------------------
-- netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- fixes gx open files functionality in netrw
vim.g.netrw_browsex_viewer="open"

-- vim.cmd[[colorscheme tokyonight]]
vim.cmd[[colorscheme catppuccin]]
-- vim.cmd[[colorscheme onedark]]

-- Make line numbers default
vim.wo.number = true

-- Make relative line numbers default
vim.o.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Searching 
-- case insensitive searching
vim.o.ignorecase = true
-- unless capital in search
vim.o.smartcase = true
-- Set highlight on search
vim.o.hlsearch = false
vim.o.incsearch = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

vim.o.splitbelow = true

vim.o.wrap = true

vim.o.swapfile = false
vim.o.backup = false

-- scrolling space
vim.o.scrolloff = 8

-- highlight the current line
vim.o.cursorline = true

-- markdown
vim.g.markdown_fenced_languages = {
	"html",
	"xml",
	"python",
	"bash=sh",
	"css",
	"sass",
	"javascript",
	"js=javascript",
	"json=javascript",
	"jsx=javascript.jsx",
	"typescript",
	"tsx=typescript.tsx",
}

return M
