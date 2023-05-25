local M = {}

-- example:
-- vim.api.nvim_create_user_command('Test', 'echo "It works!"', {})
-- vim.cmd.Test()

vim.api.nvim_create_user_command('Tickets', 'edit ~/repos/tickets/', {})
vim.api.nvim_create_user_command('Errors', 'edit ~/Desktop/errors.md', {})

return M
