require('kanagawa').setup {
  dimInactive = true,
  globalStatus = false,
  overrides = {
    Boolean = { link = 'Special' },
  }
}

vim.cmd('colorscheme kanagawa')
