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
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false
  },
}
