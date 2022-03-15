require('fzf-lua').setup {
  winopts = {
    height           = 0.90,
    width            = 0.90,
  },
  files = {
    fd_opts = "--color=never --type f --hidden --follow --no-ignore --exclude .git --exclude node_modules --exclude tmp",
  },
  on_create = function()
    vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", "<Down>",
      { silent = true, noremap = true }
    )

    vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", "<Up>",
      { silent = true, noremap = true }
    )
  end
}
