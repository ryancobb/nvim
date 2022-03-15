require('nvim-tree').setup {
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
