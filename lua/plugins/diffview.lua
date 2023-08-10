return {
  "sindrets/diffview.nvim",
  config = function()
    local actions = require("diffview.actions")

    require("diffview").setup({
      default_args = {
        DiffviewOpen = { "--imply-local" },
      },
      enhanced_diff_hl = true,
      keymaps = {
        view = {
          { "n", "q", actions.close },
        },
        file_panel = {
          { "n", "q", actions.close },
        },
        file_history_panel = {
          { "n", "q", actions.close },
        },
      },
    })
  end,
}
