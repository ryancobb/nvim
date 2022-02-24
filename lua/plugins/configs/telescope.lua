local telescope = require('telescope')

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<c-h>"] = "which_key"
      }
    }
  }
}

telescope.load_extension('fzf')
telescope.load_extension('file_browser')
