require('kanagawa').setup {
  overrides = {
    Boolean = { link = 'Special' },
    NormalFloat = { link = 'Pmenu' },
    WinSeparator = { link = 'LineNr' }
  }
}

vim.cmd('colorscheme kanagawa')
