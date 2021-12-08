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
    },
    file_ignore_patterns ={
      'vendor',
      'node_modules',
      'tmp',
      '.git',
      'public/packs',
      'public/packs-test',
      'spec/fixtures',
      'db/postgresql'
    }
  },
  vimgrep_arguments = {
    "rg",
    "--no-heading",
    "--with-filename",
    "--column",
    "--smart-case",
    "--hidden",
    "--no-ignore",
  },
  pickers = {
    find_files = {
      find_command = {
        "fd",
        "--type=file",
        "--hidden",
        "--no-ignore",
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
