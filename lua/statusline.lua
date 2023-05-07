function my_statusline()
  local branch = vim.fn.FugitiveHead()

  if branch and #branch > 0 then
    branch = '  '..branch
  end

  return branch..' %f%m%'
end

vim.cmd[[ set statusline=%!luaeval('my_statusline()') ]]
