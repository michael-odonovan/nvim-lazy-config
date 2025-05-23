local M = {}

function my_statusline()
  local branch = vim.fn.FugitiveHead()

  if branch and #branch > 0 then
    branch = '  '..branch
  end

  -- Get the word count
  local word_count = vim.fn.wordcount().words

  return branch..' %f%m% %= %10([%l/%L:%c%)]'
end

vim.cmd[[ set statusline=%!luaeval('my_statusline()') ]]

return M



-- local M = {}
--
-- local function status_line()
--   local mode = "%-5{%v:lua.string.upper(v:lua.vim.fn.mode())%}"
--   local file_name = "%-.16t"
--   local buf_nr = "[%n]"
--   local modified = " %-m"
--   local file_type = " %y"
--   local right_align = "%="
--   local line_no = "%10([%l/%L%)]"
--   local pct_thru_file = "%5p%%"
--
--   return string.format(
--     "%s%s%s%s%s%s%s%s",
--     mode,
--     file_name,
--     buf_nr,
--     modified,
--     file_type,
--     right_align,
--     line_no,
--     pct_thru_file
--   )
-- end
--
-- vim.opt.statusline = status_line()
--
-- return M
