local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false
      },
      width = 0.95,
      height = 0.95,
      preview_cutoff = 120
    },
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-l>"] = actions.cycle_history_next,
        ["<C-h>"] = actions.cycle_history_prev,
        ["<esc>"] = actions.close,
      }
    }
  },
  vimgrep_arguments = {
    "--color=never",
    "rg",
    "--no-heading",
    "--with-filename",
    "--line-number",
    "--column",
    "--smart-case",
    "--trim",
    "--hidden",
    "--no-ignore",
    "--glob=!vendor/**",
    "--glob=!node_modules/**",
    "--glob=!tmp/**",
    "--glob=!.git/**",
    "--glob=!public/packs/**",
    "--glob=!public/packs-test/**",
    "--glob=!spec/fixtures/**",
    "--glob=!db/postgresql/**",
    "--glob=!.terraform/**"
  },
  pickers = {
    find_files = {
      find_command = {
        "fd",
        "--type=file",
        "--strip-cwd-prefix",
        "--hidden",
        "--no-ignore",
        "--exclude=vendor",
        "--exclude=node_modules",
        "--exclude=tmp",
        "--exclude=.git",
        "--exclude=public/packs",
        "--exclude=public/packs-test",
        "--exclude=spec/fixtures",
        "--exclude=db/postgresql",
        "--exclude=.terraform",
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
telescope.load_extension("termfinder")
telescope.load_extension('projects')
