-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>yf", '<cmd>let @+ = expand("%")<cr>', { desc = "filename" })
vim.keymap.del({ "t" }, "<esc><esc>")
