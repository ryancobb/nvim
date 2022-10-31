
local colors = require("catppuccin.palettes").get_palette()
local color_utils = require('catppuccin.utils.colors')

local M = {
  dark_bg = color_utils.darken(colors.base, 0.8, nil)
}

vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha

require("catppuccin").setup {
  dim_inactive = {
    enabled = true,
    shade = 'dark',
    percentage = 0.20
  },
  integrations = {
    cmp = true,
    fidget = true,
    gitsigns = true,
    markdown = true,
    neogit = true,
    notify = true,
    telescope = true,
    treesitter = true,
    ts_rainbow = true,
    which_key = true,
    neotest = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    neotree = {
      enabled = true,
      show_root = true,
      transparent_panel = false,
    },
  },
}

vim.cmd [[colorscheme catppuccin]]

return M
