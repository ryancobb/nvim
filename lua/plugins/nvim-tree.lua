vim.api.nvim_command('let g:nvim_tree_window_picker_exclude = { "buftype": [ "terminal" ] }')

require('nvim-tree').setup {
  disable_netrw = true,
  hijack_netrw = true,
  auto_close = true,
  filters = {
    dotfiles = false,
    custom = { '.git' }
  },
  git = {
    enable = false,
    ignore = false
  }
}
