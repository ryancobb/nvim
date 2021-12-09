vim.api.nvim_command('let g:nvim_tree_window_picker_exclude = { "buftype": [ "terminal" ] }')
vim.g.nvim_tree_respect_buf_cwd = 1

require('nvim-tree').setup {
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  auto_close = true,
  update_cwd = true,
  update_focused_file = {
    enable = false,
    update_cwd = false
  },
  filters = {
    dotfiles = false,
    custom = { '.git', '.DS_Store', '.bundle', '.vscode', '.theia', '.jest', '.optic', '.storybook' }
  },
  git = {
    enable = true,
    ignore = false
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = true,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false
  },
}
