-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("fzf", { clear = true }),
  pattern = { "Fzf" },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})
