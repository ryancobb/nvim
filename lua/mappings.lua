utils = require('utils')

local keymaps = {
  ['n'] = {
    {'<leader>e', ':NvimTreeToggle<CR>'},

    {'<leader>f', ':Telescope find_files<CR>'},
    {'<leader>t', ':Telescope live_grep<CR>'},
    {'<leader>sr', ':Telescope oldfiles<CR>'},
    {'<leader>sl', ':Telescope resume<CR>'},
    {'<leader>gb', ':Telescope git_branches<CR>'},
    {'<leader>gs', ':Telescope git_status<CR>'},

    {'<leader>h', ':noh<CR>'},
    {'<leader>tl', ":let @*=join([expand('%'), line('.')], ':')<CR>"},
    {'<leader>tf', ":let @*=expand('%')<CR>"},

    {'<tab>', ':BufferLineCycleNext<CR>'},
    {'<s-tab>', ':BufferLineCyclePrev<CR>'},
    {'<s-l>', ':BufferLineCycleNext<CR>'},
    {'<s-h>', ':BufferLineCyclePrev<CR>'},
    {'<s-left>', ':BufferLineMovePrev<CR>'},
    {'<s-right>', ':BufferLineMoveNext<CR>'},
    {'<leader>c', ':Bdelete<CR>'},
    {'<leader>q', ':bdelete<CR>'},

    {'<c-h>', '<c-w>h'},
    {'<c-j>', '<c-w>j'},
    {'<c-k>', '<c-w>k'},
    {'<c-l>', '<c-w>l'},

    {'<c-up>', ':resize -2<CR>'},
    {'<c-down>', ':resize +2<CR>'},
    {'<c-left>', ':vertical resize -2<CR>'},
    {'<c-right>', ':vertical resize +2<CR>'},

    {'<leader>/', '<esc><cmd>lua require("Comment.api").gc(vim.fn.visualmode())<CR>'}
  },

  ['v'] = {
    {'<leader>/', '<esc><cmd>lua require("Comment.api").gc(vim.fn.visualmode())<CR>'}
  },

  ['x'] = {
    {'<s-k>', ":move '<-2<CR>gv-gv"},
    {'<s-j>', ":move '>+1+<CR>gv-gv"}
  },

  ['t'] = {
    {'<c-h>', '<c-\\><c-n><c-w>h'},
    {'<c-j>', '<c-\\><c-n><c-w>j'},
    {'<c-k>', '<c-\\><c-n><c-w>k'},
    {'<c-l>', '<c-\\><c-n><c-w>l'},
    {'jk', '<C-\\><C-n>'}
  }
}

utils.set_keymaps(keymaps)
