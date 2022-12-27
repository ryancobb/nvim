local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function() vim.cmd [[ setlocal nonumber signcolumn=no ]] end
})

vim.api.nvim_create_autocmd('VimResized', {
  pattern = '*',
  callback = function() vim.cmd [[ wincmd = ]] end
})

vim.api.nvim_create_autocmd('FocusGained', {
  pattern = '*',
  callback = function() vim.cmd [[ checktime ]] end
})
