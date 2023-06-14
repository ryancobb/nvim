return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        follow_current_file = false,
      },
    },
    keys = {
      {
        "<leader>fe",
        "<cmd>Neotree reveal<cr>",
        desc = "Explorer NeoTree (root dir)",
      },
    },
  },
}
