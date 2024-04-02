return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local blank = { sections = { lualine_a = {} }, filetypes = { "neo-tree", "DiffviewFiles" } }

      opts.options = {
        component_separators = "|",
        section_separators = { left = "", right = "" },
      }

      opts.extensions = { blank }

      table.remove(opts.sections.lualine_c) -- remove navic
      table.remove(opts.sections.lualine_c) -- filename
      table.remove(opts.sections.lualine_c) -- icon
    end,
  },
}
