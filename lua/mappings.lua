utils = require('utils')

local opts = {
  noremap = true,
  silent = true
}

local keymaps = {
  ['n'] = {
    {'<leader>e', ':lua require("nvimtree").toggle()<CR>'},

    {'<leader>f', ':Telescope find_files<CR>'},
    {'<leader>t', ':Telescope live_grep<CR>'},
    {'<leader>sr', ':Telescope oldfiles<CR>'},
    {'<leader>sl', ':Telescope resume<CR>'},

    {'<leader>h', ':noh<CR>'},
    {'<leader>tl', ":let @*=join([expand('%'), line('.')], ':')<CR>"},
    {'<leader>tf', ":let @*=expand('%')<CR>"},

  }
}

utils.set_keymaps(keymaps)

vim.api.nvim_set_keymap('n', '<tab>', ':BufferNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<s-tab>', ':BufferPrevious<CR>', opts)
vim.api.nvim_set_keymap('n', '<s-l>', ':BufferNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<s-h>', ':BufferPrevious<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>c', ':BufferClose<CR>', opts)

vim.api.nvim_set_keymap('n', '<c-h>', '<c-w>h', opts)
vim.api.nvim_set_keymap('n', '<c-j>', '<c-w>j', opts)
vim.api.nvim_set_keymap('n', '<c-k>', '<c-w>k', opts)
vim.api.nvim_set_keymap('n', '<c-l>', '<c-w>l', opts)

vim.api.nvim_set_keymap('n', '<c-up>', ':resize -2<CR>', opts)
vim.api.nvim_set_keymap('n', '<c-down>', ':resize +2<CR>', opts)
vim.api.nvim_set_keymap('n', '<c-left>', ':vertical resize -2<CR>', opts)
vim.api.nvim_set_keymap('n', '<c-right>', ':vertical resize +2<CR>', opts)

vim.api.nvim_set_keymap('x', '<s-k>', ":move '<-2<CR>gv-gv", opts)
vim.api.nvim_set_keymap('x', '<s-j>', ":move '>+1+<CR>gv-gv", opts)

-- Terminal
vim.api.nvim_set_keymap('t', '<c-h>', '<c-\\><c-n><c-w>h', opts)
vim.api.nvim_set_keymap('t', '<c-j>', '<c-\\><c-n><c-w>j', opts)
vim.api.nvim_set_keymap('t', '<c-k>', '<c-\\><c-n><c-w>k', opts)
vim.api.nvim_set_keymap('t', '<c-l>', '<c-\\><c-n><c-w>l', opts)
vim.api.nvim_set_keymap('t', 'jk', '<C-\\><C-n>', opts)
