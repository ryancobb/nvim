return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        follow_current_file = {
          enabled = false,
        },
      },
      window = {
        mappings = {
          ["<enter>"] = "open_with_window_picker",
        },
      },
    },
    keys = {
      {
        "<leader>r",
        "<cmd>Neotree reveal<cr>",
        desc = "Reveal in file tree",
      },
    },
  },
}
