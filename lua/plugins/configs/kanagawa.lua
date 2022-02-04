require('kanagawa').setup {
  override = {
    Boolean = { link = 'Special' },
    NormalFloat = { link = 'Pmenu' }
  }
}

vim.cmd('colorscheme kanagawa')
