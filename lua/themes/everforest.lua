local M = {
  dark_bg = '#252c31'
}
vim.g.everforest_show_eob = 0
vim.cmd [[set background=dark]]

vim.cmd [[colorscheme everforest]]

vim.cmd('highlight NormalNC guibg=' .. M.dark_bg)
vim.cmd('highlight WinbarNC guibg=' .. M.dark_bg)
vim.cmd('highlight EndOfBuffer guibg=NONE')

return M

