-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.fillchars:append({ diff = "╱" })
opt.relativenumber = false
opt.title = true
opt.titlestring = '%{substitute(getcwd(), $HOME, "~", "g")} - nvim'
opt.wrap = false

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h12"
end
