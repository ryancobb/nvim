require('kanagawa').setup {
  dimInactive = false,
  globalStatus = false,
  overrides = {
    Boolean = { link = 'Special' },
  }
}

vim.cmd('colorscheme kanagawa')
