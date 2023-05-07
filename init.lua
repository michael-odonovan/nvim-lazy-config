
-- plugin manager setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- mapleader etc.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.termguicolors = true

-- imports
require('lazy').setup('plugins')
require('options')
require('keymaps')
require('autocmds')
require('status-line')
