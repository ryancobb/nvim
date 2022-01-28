vim.g.nvim_tree_window_picker_exclude = {
  filetype = {'toggleterm'}
}

require'nvim-tree'.setup {
  auto_close = true,
  update_focused_file = {
    enable = true
  },
  view = {
    auto_resize = true
  }
}
