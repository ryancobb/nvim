local keymaps = {
  ['n'] = {
    {'q', '<Nop>'},

    {'<leader>e', ':NvimTreeFocus<CR>'},

    {'<c-\\>', '<Cmd>exe v:count . "ToggleTerm direction=" . g:terminal_direction<CR>'},
    {'<c-t>v', ':let g:terminal_direction="vertical"<CR>'},
    {'<c-t>h', ':let g:terminal_direction="horizontal"<CR>'},
    {'<c-t>f', ':let g:terminal_direction="float"<CR>'},

    {'<C-h>', ':SmartCursorMoveLeft<CR>'},
    {'<C-j>', ':SmartCursorMoveDown<CR>'},
    {'<C-k>', ':SmartCursorMoveUp<CR>'},
    {'<C-l>', ':SmartCursorMoveRight<CR>'},

    {'<leader>f', ':FzfLua files<CR>'},
    {'<leader>st', ':FzfLua live_grep_glob<CR>'},
    {'<leader>sc', ':FzfLua grep_string<CR>'},
    {'<leader>so', ':FzfLua oldfiles<CR>'},
    {'<leader>sr', ':FzfLua resume<CR>'},
    {'<leader>sb', ':FzfLua buffers<CR>'},

    {'<leader>nf', ':NvimTreeFindFile<CR>'},

    {'<leader>b', ':BufferLinePick<CR>'},

    {'<leader>gg', ':Neogit<CR>'},
    {'<leader>gf', ':DiffviewFileHistory<CR>'},

    {'<leader>tn', ":TestNearest<CR>"},
    {'<leader>tf', ":TestFile<CR>"},
    {'<leader>tl', ":TestLast<CR>"},

    {'<s-l>', ':BufferLineCycleNext<CR>'},
    {'<s-h>', ':BufferLineCyclePrev<CR>'},
    {'<leader>c', ':Bdelete<CR>'},
    {'<leader>q', '<C-w>q'},

    {'<c-up>', ':SmartResizeUp<CR>'},
    {'<c-down>', ':SmartResizeDown<CR>'},
    {'<c-left>', ':SmartResizeLeft<CR>'},
    {'<c-right>', ':SmartResizeRight<CR>'},

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
