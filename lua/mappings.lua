local keymaps = {
  ['n'] = {
    {'q', '<Nop>'},

    {'<leader>e', ':NvimTreeToggle<CR>'},

    {'<c-\\>', '<Cmd>exe v:count . "ToggleTerm direction=" . g:terminal_direction<CR>'},
    {'<c-t>v', ':let g:terminal_direction="vertical"<CR>'},
    {'<c-t>h', ':let g:terminal_direction="horizontal"<CR>'},
    {'<c-t>f', ':let g:terminal_direction="float"<CR>'},

    {'<C-h>', '<C-w>h'},
    {'<C-j>', '<C-w>j'},
    {'<C-k>', '<C-w>k'},
    {'<C-l>', '<C-w>l'},

    {'<leader>f', ':FzfLua files<CR>'},
    {'<leader>st', ':lua require("fzf-lua").live_grep_glob<CR>'},
    {'<leader>ss', ':lua require("spectre").open()<CR>'},
    {'<leader>sc', ':FzfLua grep_cword<CR>'},
    {'<leader>sC', ':FzfLua grep_cWORD<CR>'},
    {'<leader>sr', ':FzfLua oldfiles<CR>'},
    {'<leader>sl', ':FzfLua resume<CR>'},
    {'<leader>sv', ':FzfLua grep_visual<CR>'},
    {'<leader>sb', ':FzfLua buffers<CR>'},

    {'<leader>tn', ":TestNearest<CR>"},
    {'<leader>tf', ":TestFile<CR>"},
    {'<leader>tl', ":TestLast<CR>"},

    {'<s-l>', ':BufferLineCycleNext<CR>'},
    {'<s-h>', ':BufferLineCyclePrev<CR>'},
    {'<leader>c', ':Bdelete<CR>'},
    {'<leader>q', '<C-w>q'},

    {'<c-up>', ':resize +2<CR>'},
    {'<c-down>', ':resize -2<CR>'},
    {'<c-left>', ':vertical resize -2<CR>'},
    {'<c-right>', ':vertical resize +2<CR>'},

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
