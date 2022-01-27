local nightfox = require('nightfox')
local colors = require('nightfox.colors').load()

nightfox.setup {
  styles = {
    comments = 'italic',
    keywords = 'bold',
    functions = 'italic,bold'
  },
  hlgroups = {
    TelescopeBorder = { fg = "${bg_alt}", bg = "${bg_alt}" },
  }
}
nightfox.load("nightfox")

vim.cmd("hi TelescopePromptBorder guibg=" .. colors.bg_alt .. " guifg=" .. colors.bg)
vim.cmd("hi TelescopePromptNormal guibg=" .. colors.bg_alt .. " guifg=" .. colors.fg_alt)

vim.cmd("hi TelescopePreviewTitle guibg=" .. colors.bg_alt .. " guifg=" .. colors.fg_alt)
vim.cmd("hi TelescopePromptTitle guibg=" .. colors.bg_alt .. " guifg=" .. colors.fg_alt)
vim.cmd("hi TelescopeResultsTitle guibg=" .. colors.bg_alt .. " guifg=" .. colors.fg_alt)

vim.cmd("hi TelescopeNormal guibg=" .. colors.bg_alt .. " guifg=" .. colors.fg_alt)
