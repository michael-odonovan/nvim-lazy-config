local M = {}
local opt = vim.opt


-----------------------------------
--	not sure                 --
-----------------------------------
-- deal with @ in file names
-- opt.isfname:append("@-@")

-----------------------------------
--	plugins                      --
-----------------------------------
vim.g.undotree_SetFocusWhenToggle = 1


-----------------------------------
--	general                      --
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


-- Indents
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true -- convert tabs to spaces
opt.smartindent = true


-- Wrapping
opt.wrap = true
opt.whichwrap:append {
  ['<'] = true,
  ['>'] = true,
  ['['] = true,
  [']'] = true,
  h = true,
  l = true,
}


-- Numbers
vim.wo.number = true
opt.relativenumber = false


-- Mouse
opt.mouse = 'a'


-- Clipboard
opt.clipboard = 'unnamedplus'


-- Indents
opt.breakindent = true


-- Undo History
opt.undofile = true
opt.undolevels = 10000


-- Searching
-- case insensitive searching
opt.ignorecase = true
-- unless capital in search
opt.smartcase = true
-- Set highlight on search
opt.hlsearch = false
opt.incsearch = true


-- Signcolumn
vim.wo.signcolumn = 'yes'


-- Update Time
opt.updatetime = 250
opt.timeout = true
opt.timeoutlen = 300


-- Completeopt
opt.completeopt = 'menuone,noselect'


-- Termguicolors
opt.termguicolors = true


-- Split Below
opt.splitbelow = true


-- Swap File
opt.swapfile = false
opt.backup = false


-- Scrolling Position
opt.scrolloff = 8


-- Highlight Cursor Line
opt.cursorline = true


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
