-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("disable_indent_scope", { clear = true }),
  pattern = { "Fzf", "DiffviewFiles", "dropbar_menu" },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.hurl" },
  callback = function()
    vim.cmd("set filetype=hurl")
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.envrc" },
  callback = function()
    vim.cmd("set filetype=sh")
  end,
})

local palette = require('nightfox.palette').load("nordfox")

vim.api.nvim_create_autocmd({ "FocusLost" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd("hi clear Normal")
    vim.cmd("hi Normal guibg=" .. palette.bg0)
  end,
})

vim.api.nvim_create_autocmd({ "FocusGained" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd("hi clear Normal")
    vim.cmd("hi Normal guibg=" .. palette.bg1)
  end,
})
