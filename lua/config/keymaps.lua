-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>yf", '<cmd>let @+ = expand("%")<cr>', { desc = "filename" })
vim.keymap.set("n", "<leader>yg", "<cmd>GetCurrentBranchLink<cr>", { desc = "git repo link" })
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen origin/main...HEAD<cr>", { desc = "DiffviewOpen" })

vim.keymap.del({ "t" }, "<esc><esc>")

local smartsplits = require("smart-splits")
vim.keymap.set("n", "<c-h>", function()
  smartsplits.move_cursor_left()
end)
vim.keymap.set("n", "<c-j>", function()
  smartsplits.move_cursor_down()
end)
vim.keymap.set("n", "<c-k>", function()
  smartsplits.move_cursor_up()
end)
vim.keymap.set("n", "<c-l>", function()
  smartsplits.move_cursor_right()
end)
