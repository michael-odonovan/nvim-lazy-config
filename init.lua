
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- lazy package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)


-- note plugins cannot be renamed!!!
require('lazy').setup('plugins')

-- general sourcing
require('options')
require('keymaps')
require('autocmds')
require('macros')
require('statusline')
