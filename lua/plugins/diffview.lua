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
      hooks = {
        diff_buf_win_enter = function(bufnr, winid, ctx)
          if ctx.layout_name:match("^diff2") then
            if ctx.symbol == "a" then
              vim.opt_local.winhl = table.concat({
                "DiffAdd:DiffviewDiffAddAsDelete",
                "DiffDelete:DiffviewDiffDelete",
              }, ",")
            elseif ctx.symbol == "b" then
              vim.opt_local.winhl = table.concat({
                "DiffDelete:DiffviewDiffDelete",
              }, ",")
            end
          end
        end,
      },
    })
  end,
}
