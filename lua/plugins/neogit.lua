return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration
    "ibhagwan/fzf-lua", -- optional
  },
  opts = {
    graph_style = "unicode",
  },
  keys = {
    {
      "<leader>gg",
      function()
        require("neogit").open()
      end,
      desc = "neogit",
    },
    {
      "<leader>gp",
      function()
        require("neogit").open({ "pull" })
      end,
      desc = "pull",
    },
    {
      "<leader>gP",
      function()
        require("neogit").open({ "push" })
      end,
      desc = "push",
    },
  },
}
