require('kanagawa').setup {
  dimInactive = true,
  overrides = {
    Boolean = { link = 'Special' },
    WinSeparator = { link = 'LineNr' }
  }
}

vim.cmd('colorscheme kanagawa')
