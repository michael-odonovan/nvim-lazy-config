local M = {}

-- my status line
-- https://nihilistkitten.me/nvim-lua-statusline/
function status_line()
  return table.concat {
    "%{FugitiveStatusline()} ",
    "%f",
  }
end

return M
