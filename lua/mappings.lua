local keymaps = {
  ['n'] = {
    {'q', '<Nop>'},

    {'<leader>e', ':Neotree<CR>'},
    {'<leader>b', ':Neotree buffers<CR>'},
    {'<leader>r', ':Neotree reveal<CR>'},

    {'<c-\\>', '<Cmd>exe v:count . "ToggleTerm direction=" . g:terminal_direction<CR>'},
    {'<leader>tv', ':let g:terminal_direction="vertical"<CR>'},
    {'<leader>th', ':let g:terminal_direction="horizontal"<CR>'},
    {'<leader>tf', ':let g:terminal_direction="float"<CR>'},

    {'<C-h>', ':SmartCursorMoveLeft<CR>'},
    {'<C-j>', ':SmartCursorMoveDown<CR>'},
    {'<C-k>', ':SmartCursorMoveUp<CR>'},
    {'<C-l>', ':SmartCursorMoveRight<CR>'},

    {'<leader>f', ':FzfLua files<CR>'},
    {'<leader>st', ':FzfLua live_grep_glob<CR>'},
    {'<leader>sc', ':FzfLua grep_cword<CR>'},
    {'<leader>sr', ':FzfLua resume<CR>'},

    {'<leader>gg', ':LazyGit<CR>'},
    {'<leader>gf', ':DiffviewFileHistory<CR>'},
    {'<leader>gs', ':Neotree git_status<CR>'},
    {'<leader>gr', ':Gitsigns reset_hunk<CR>'},

    {'<leader>yf', ':let @+=fnamemodify(expand("%"), ":~:.")<CR>'}, -- yank file path
    {'<leader>yl', ':let @+=fnamemodify(expand("%"), ":~:.") . ":" . line(".")<CR>'}, -- yank file path with line number

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
    {'<c-n>', '<c-\\><c-n>'}
  }
}

vim.keymap.set('n', '<leader><space>', function()
  require('fzf-lua').buffers({ fzf_opts = { ['--keep-right'] = '' } })
end)

vim.keymap.set('n', '<leader>?', function()
  require('fzf-lua').oldfiles({ fzf_opts = { ['--keep-right'] = '' } })
end)

require('utils').set_keymaps(keymaps)
