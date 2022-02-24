require('diffview').setup {
  enhanced_diff_hl = true,
  key_bindings = {
    view = {
      ["q"] = "<cmd>DiffviewClose<CR>",
    },
    file_panel = {
      ["q"] = "<cmd>DiffviewClose<CR>",
    },
  }
}
