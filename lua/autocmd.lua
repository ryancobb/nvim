vim.api.nvim_command('autocmd TextYankPost * lua require("vim.highlight").on_yank({higroup = "Search", timeout = 200})')
vim.api.nvim_command('autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete')
