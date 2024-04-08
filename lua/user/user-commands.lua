local M = {}

-- example:
-- vim.api.nvim_create_user_command('Test', 'echo "It works!"', {})
-- vim.cmd.Test()

vim.api.nvim_create_user_command('Tickets', 'edit ~/repos/tickets/', {})
vim.api.nvim_create_user_command('Errors', 'edit ~/Desktop/errors.md', {})
vim.api.nvim_create_user_command('Tmux', 'edit ~/.tmux.conf', {})

-- using arguments in a string / user command
vim.api.nvim_create_user_command('New', 'cd %:p:h | e <args>', { nargs = 1 })
vim.api.nvim_create_user_command('Sav', 'cd %:p:h | sav <args>', { nargs = 1 })

vim.api.nvim_create_user_command('Notes', 'edit ~/repos/notes/', {})

vim.api.nvim_create_user_command('Scratch', 'edit ~/Desktop/scratch.md', {})

vim.api.nvim_create_user_command('Path', "put =expand('%:p')", {})

vim.api.nvim_create_user_command('Desk', 'edit ~/Desktop/', {})

vim.api.nvim_create_user_command('Todo', 'edit ~/repos/planning/1.today-todo.md', {})

vim.api.nvim_create_user_command('Dig', 'edit ~/repos/planning/3.digital-standup.md', {})

return M
