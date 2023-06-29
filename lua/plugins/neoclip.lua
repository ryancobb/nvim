return {
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = { { "kkharji/sqlite.lua" } },
    opts = {
      enable_persistent_history = true,
    },
    keys = {
      {
        "<leader>p",
        function()
          require("neoclip.fzf")()
        end,
        desc = "neoclip",
      },
    },
  },
}
