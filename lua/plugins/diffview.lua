return {
  {
    'sindrets/diffview.nvim',
    config = function()
      local actions = require('diffview.actions')

      require('diffview').setup {
        enhanced_diff_hl = true,
        keymaps = {
          view = {
            ['gf'] = actions.goto_file_edit,
            ['s'] = actions.toggle_stage_entry
          },
          file_panel = {
            ['gf'] = actions.goto_file_edit,
            ['s'] = actions.toggle_stage_entry
          }
        }
      }
    end
  }
}
