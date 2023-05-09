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

-- Colorscheme
vim.cmd.colorscheme 'catppuccin'
-- vim.cmd.colorscheme 'tokyonight'


-- Netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
-- fixes gx open files functionality in netrw
vim.g.netrw_browsex_viewer="open"


-- Numbers
vim.wo.number = true
vim.o.relativenumber = false


-- Mouse
vim.o.mouse = 'a'


-- Clipboard
vim.o.clipboard = 'unnamedplus'


-- Indents
vim.o.breakindent = true


-- Undo History
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


-- Signcolumn
vim.wo.signcolumn = 'yes'


-- Update Time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300


-- Completeopt
vim.o.completeopt = 'menuone,noselect'


-- Termguicolors
vim.o.termguicolors = true


-- Split Below
vim.o.splitbelow = true


-- Wrap
vim.o.wrap = true


-- Swap File
vim.o.swapfile = false
vim.o.backup = false


-- Scrolling Position
vim.o.scrolloff = 8


-- Highlight Cursor Line
vim.o.cursorline = true


-- Markdown Code Highlighting
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
