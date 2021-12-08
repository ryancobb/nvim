local keymaps = {
  ['n'] = {
    {'<leader>e', ':NvimTreeToggle<CR>'},

    {'<leader>f', ':Telescope find_files<CR>'},
    {'<leader>st', ':Telescope live_grep<CR>'},
    {'<leader>sr', ':Telescope oldfiles<CR>'},
    {'<leader>sl', ':Telescope resume<CR>'},
    {'<leader>gd', ':DiffviewOpen<CR>'},
    {'<leader>gb', ':Telescope git_branches<CR>'},
    {'<leader>gs', ':Telescope git_status<CR>'},

    {[[<c-\>]], '<cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>'},
    {'<c-t>', '<cmd>exe v:count1 . "ToggleTerm direction=float"<CR>'},
    {[[<c-]>]], '<cmd>exe v:count1 . "ToggleTerm direction=vertical"<CR>'},

    {'<leader>h', ':noh<CR>'},

    {'<leader>tn', ":TestNearest<CR>"},
    {'<leader>tf', ":TestFile<CR>"},
    {'<leader>tl', ":TestLast<CR>"},
    {'<leader>tv', ":TestVisit<CR>"},

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
  },

  ['i'] = {
    {[[<c-\>]], '<esc><cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>'},
    {'<c-t>', '<esc><cmd>exe v:count1 . "ToggleTerm direction=float"<CR>'},
    {[[<c-]>]], '<cmd>exe v:count1 . "ToggleTerm direction=vertical"<CR>'},
  },

  ['x'] = {
    {'<s-k>', ":move '<-2<CR>gv-gv"},
    {'<s-j>', ":move '>+1<CR>gv-gv"}
  },

  ['t'] = {
    {'<c-h>', '<c-\\><c-n><c-w>h'},
    {'<c-j>', '<c-\\><c-n><c-w>j'},
    {'<c-k>', '<c-\\><c-n><c-w>k'},
    {'<c-l>', '<c-\\><c-n><c-w>l'},
    {'jk', '<C-\\><C-n>'}
  }
}

require('utils').set_keymaps(keymaps)
