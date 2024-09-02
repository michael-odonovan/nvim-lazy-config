local M = {}

-- example:
-- vim.api.nvim_create_user_command('Test', 'echo "It works!"', {})
-- vim.cmd.Test()

vim.api.nvim_create_user_command('Tickets', 'edit ~/Desktop/tickets.md', {})
vim.api.nvim_create_user_command('Errors', 'edit ~/Desktop/errors.md', {})
vim.api.nvim_create_user_command('Tmux', 'edit ~/.tmux.conf', {})

-- using arguments in a string / user command
vim.api.nvim_create_user_command('New', 'cd %:p:h | e <args>', { nargs = 1 })
vim.api.nvim_create_user_command('Sav', 'cd %:p:h | sav <args>', { nargs = 1 })

vim.api.nvim_create_user_command('Notes', 'edit ~/repos/notes/', {})

vim.api.nvim_create_user_command('Car', 'edit ~/repos/notes/car/', {})

vim.api.nvim_create_user_command('Scratch', 'edit ~/Desktop/scratch.md', {})
vim.api.nvim_create_user_command('Scratch2', 'edit ~/Desktop/scratch2.md', {})

vim.api.nvim_create_user_command('Work', 'edit ~/Desktop/work-notes.md', {})

vim.api.nvim_create_user_command('Pwd', "put =expand('%:p')", {})

vim.api.nvim_create_user_command('Desk', 'edit ~/Desktop/', {})

vim.api.nvim_create_user_command('Todo', 'edit ~/repos/notes/planning/1.today-todo.md', {})

vim.api.nvim_create_user_command('Dig', 'edit ~/repos/notes/planning/3.digital-standup.md', {})

vim.api.nvim_create_user_command('Diy', 'edit ~/repos/notes/diy/', {})

vim.api.nvim_create_user_command('Storage', 'edit ~/repos/storage/', {})

return M
