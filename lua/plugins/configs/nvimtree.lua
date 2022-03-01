require('nvim-tree').setup {
  update_focused_file = {
    enable = true
  },
  actions = {
    open_file = {
      window_picker = {
        exclude ={
          filetype = { 'toggleterm' }
        }
      }
    }
  }
}
