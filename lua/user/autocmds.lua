
local M = {}

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Format on Save
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   pattern = { "*.ts" },
--   callback = function()
--     vim.lsp.buf.format { async = true }
--   end,
-- })

-- remove whitespace on save
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "Jaq",
    "qf",
    "help",
    "man",
    "lspinfo",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      nnoremap <silent> <buffer> <esc> :close<CR>
      set nobuflisted
    ]]
  end,
})

-- quit out of empty buffers
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "" },
  callback = function()
    local buf_ft = vim.bo.filetype
    if buf_ft == "" or buf_ft == nil then
      vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      " nnoremap <silent> <buffer> <c-j> j<CR>
      " nnoremap <silent> <buffer> <c-k> k<CR>
      set nobuflisted
    ]]
    end
  end,
})

-- stop comments starting on the next line
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

-- keep split windows equal when resizing
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  pattern = '*',
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
	callback = function()
		vim.fn.timer_start(5000, function()
			print(" ")
		end)
	end
})

vim.api.nvim_create_user_command('WordCount', function()
  local words = vim.fn.wordcount().words
  print("Word count: " .. words)
end, {})

-- vim.api.nvim_create_autocmd("Root", {
--   callback = function()
--     vim.cmd "cd `git rev-parse --show-toplevel`"
--   end,
-- })

return M
