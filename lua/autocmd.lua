vim.api.nvim_command('autocmd TextYankPost * lua require("vim.highlight").on_yank({higroup = "Search", timeout = 200})')

vim.api.nvim_command('autocmd TermEnter term://*toggleterm#* tnoremap <silent><c-\\> <cmd>exe v:count1 . "ToggleTerm"<CR>')
vim.api.nvim_command('autocmd TermEnter term://*toggleterm#* tnoremap <silent><c-t> <cmd>exe v:count1 . "ToggleTerm"<CR>')
