require('kanagawa').setup {
  dimInactive = true,
  globalStatus = true,
  overrides = {
    Boolean = { link = 'Special' },
  }
}

vim.cmd('colorscheme kanagawa')
