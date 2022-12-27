vim.keymap.set({ 'n', 'v' }, 'q', '<nop>', { silent = true })

vim.keymap.set('n', '<leader>q', '<c-w>q', { desc = 'quit window' })
vim.keymap.set('n', '<leader>yf', ':let @+ = expand("%")<cr>', { desc = 'filename' })

vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev({ float = { border = 'single' } }) end,
  { desc = 'previous diagnostic' })
vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next({ float = { border = 'single' } }) end,
  { desc = 'next diagnostic' })

vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')

vim.keymap.set('n', '<Esc>', '<cmd>:noh<cr>', { silent = true })
vim.keymap.set('n', 'gx', ':!open <c-r><c-a><cr>', { desc = 'open file' })
vim.keymap.set('n', 'gx', [[:silent execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>]], { silent = true })

vim.keymap.set({ 'n', 'x' }, 'd', '"_d')
vim.keymap.set('x', 'p', '"_dP')

vim.keymap.set('v', '<s-j>', ":m'>+<CR>gv=gv")
vim.keymap.set('v', '<s-k>', ":m-2<CR>gv=gv")

vim.keymap.set('t', '<c-h>', '<c-\\><c-n><c-w>h')
vim.keymap.set('t', '<c-j>', '<c-\\><c-n><c-w>j')
vim.keymap.set('t', '<c-k>', '<c-\\><c-n><c-w>k')
vim.keymap.set('t', '<c-l>', '<c-\\><c-n><c-w>l')
vim.keymap.set('t', '<c-n>', '<c-\\><c-n>')

vim.keymap.set({ 'i', 'c' }, '<c-a>', '<home>')
vim.keymap.set({ 'i', 'c' }, '<c-e>', '<end>')
