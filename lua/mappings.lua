local keymaps = {
  ['n'] = {
    {'<leader>e', ':SidebarNvimToggle<CR>'},

    {'<leader>f', ':Telescope find_files<CR>'},
    {'<leader>st', ':Telescope live_grep<CR>'},
    {'<leader>sc', ':Telescope grep_string<CR>'},
    {'<leader>sr', ':Telescope oldfiles<CR>'},
    {'<leader>sl', ':Telescope resume<CR>'},
    {'<leader>gd', ':DiffviewOpen<CR>'},
    {'<leader>gb', ':Telescope git_branches<CR>'},
    {'<leader>gs', ':Telescope git_status<CR>'},
    {'<leader>t', ':Telescope termfinder find<CR>'},

    {'tn', ":TestNearest<CR>"},
    {'tf', ":TestFile<CR>"},
    {'tl', ":TestLast<CR>"},
    {'tv', ":TestVisit<CR>"},

    {'gb', ':BufferLinePick<CR>'},
    {'<tab>', ':BufferLineCycleNext<CR>'},
    {'<s-tab>', ':BufferLineCyclePrev<CR>'},
    {'<s-l>', ':BufferLineCycleNext<CR>'},
    {'<s-h>', ':BufferLineCyclePrev<CR>'},
    {'<leader>c', ':Bdelete!<CR>'},
    {'<leader>q', ':bdelete!<CR>'},

    {'<c-up>', ':resize -2<CR>'},
    {'<c-down>', ':resize +2<CR>'},
    {'<c-left>', ':vertical resize -2<CR>'},
    {'<c-right>', ':vertical resize +2<CR>'},

    {'<leader>xx', ':TroubleToggle<CR>'},
    {'<leader>xw', ':TroubleToggle workspace_diagnostics<CR>'},
    {'<leader>xd', ':TroubleToggle document_diagnostics<CR>'},
    {'<leader>xq', ':TroubleToggle quickfix<CR>'},
    {'<leader>xl', ':TroubleToggle loclist<CR>'},

    {'<leader>h', ':noh<CR>'},
    {'n', "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>"},
    {'N', "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>"},
    {'*', "*<Cmd>lua require('hlslens').start()<CR>"},
    {'#', "#<Cmd>lua require('hlslens').start()<CR>"},
    {'g*', "g*<Cmd>lua require('hlslens').start()<CR>"},
    {'g#', "g#<Cmd>lua require('hlslens').start()<CR>"},
  },

  ['v'] = {
    {'<s-j>', ":m '>+1<CR>gv=gv"},
    {'<s-k>', ":m '<-2<CR>gv=gv"},
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
