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
        "<leader>r",
        "<cmd>Neotree reveal<cr>",
        desc = "Reveal in file tree",
      },
    },
  },
}
