local palette = require('nightfox.palette').load('nordfox')

local M = {
  dark_bg = palette.bg0
}

require('nightfox').setup({
  options = {
    dim_inactive = true,
    inverse = {
      match_paren = true,
    },
    modules = {
      cmp = true,
      fidget = true,
      gitsigns = true,
      illuminate = true,
      neogit = true,
      neotest = true,
      neotree = true,
      telescope = true,
      treesitter = true,
      tsrainbow = true,
      whichkey = true,
      diagnostic = {
        enable = true
      },
      native_lsp = {
        enable = true
      }
    }
  },
  groups = {
    all = {
      ['@symbol'] = { link = '@label' }
    }
  }
})

vim.cmd[[ colorscheme nordfox ]]

return M
