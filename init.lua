
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.lspconfig_deprecation_warnings = false
vim.g.skip_ts_context_commentstring_module = true

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
require('lazy').setup('user.plugins')

-- general sourcing
require('user.options')
require('user.keymaps')
require('user.lsp')
require('user.autocmds')
require('user.macros')
require('user.my-statusline')
require('user.user-commands')
