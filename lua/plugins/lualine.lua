return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local icons = require("lazyvim.config").icons
      local blank = { sections = { lualine_a = {} }, filetypes = { "neo-tree", "DiffviewFiles" } }

      return {
        options = {
          component_separators = "|",
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
            },
          },
          lualine_x = {},
          lualine_y = { "filetype", "encoding" },
          lualine_z = {},
        },
        inactive_sections = {
          lualine_c = {},
          lualine_x = {},
        },
        extensions = { blank },
      }
    end,
  },
}
