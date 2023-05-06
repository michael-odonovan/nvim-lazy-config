local M = {}

-- options
local vo = vim.opt
local vg = vim.g

vg.mapleader = " "

-- vim.cmd[[colorscheme tokyonight]]
vim.cmd[[colorscheme catppuccin]]
-- vim.cmd[[colorscheme onedark]]

-- fixes gx open files functionality
vg.netrw_browsex_viewer="open"

vo.cmdheight=1

vo.statusline = "%!luaeval('status_line()')"

vo.splitbelow = true

vo.background = "dark"

vo.number = true
vo.relativenumber = true

vo.clipboard = "unnamedplus"

vo.tabstop = 2
vo.softtabstop = 2
vo.shiftwidth = 2
vo.expandtab = true -- convert tabs to spaces

vo.smartindent = true

vo.wrap = true

vo.swapfile = false
vo.backup = false
vo.undodir = os.getenv("HOME") .. "/.vim/undodir"
vo.undofile = true

vo.hlsearch = false
vo.incsearch = true

vo.termguicolors = true

-- scrolling space
vo.scrolloff = 8

vo.updatetime = 50

-- allow the mouse to be used all modes
vo.mouse = "a"

vo.clipboard = "unnamedplus"

vo.ignorecase = true
vo.smartcase = true

-- remove -- INSERT -- mode stuff from status
vo.showmode = false

-- highlight the current line
vo.cursorline = true
-- always show the sign column, otherwise it would shift the text each time
vo.signcolumn = "yes"

-- deal with @ in file names
vo.isfname:append("@-@")

vo.updatetime = 50

vo.whichwrap:append {
  ['<'] = true,
  ['>'] = true,
  ['['] = true,
  [']'] = true,
  h = true,
  l = true,
}

-- markdown
vg.markdown_fenced_languages = {
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
