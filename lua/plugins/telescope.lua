local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-l>"] = actions.cycle_history_next,
        ["<C-h>"] = actions.cycle_history_prev,
      }
    }
  },
  pickers = {
    find_files = {
      find_command = { 
        "fd",
        "--type=file", 
        "--hidden", 
        "--no-ignore",
        "--exclude=vendor",
        "--exclude=node_modules",
        "--exclude=tmp",
        "--exclude=.git",
        "--exclude=publics/packs",
        "--exclude=publics/packs-test",
        "--exclude=spec/fixtures"
      }
    },
    live_grep = {
      only_sort_text = true,
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    }
  }
}

telescope.load_extension('fzf')
