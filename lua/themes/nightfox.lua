local palette = require('nightfox.palette').load('nordfox')

local M = {
  dark_bg = palette.bg0
}

require('nightfox').setup({
  options = {
    dim_inactive = true
  }
})

vim.cmd[[ colorscheme nordfox ]]

return M
