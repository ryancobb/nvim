return {
  "sindrets/diffview.nvim",
  opts = {
    default_args = {
      DiffviewOpen = { "--imply-local" },
    },
    enhanced_diff_hl = true,
  },
  keys = {
    {
      "<leader>gd",
      function()
        local lib = require("diffview.lib")
        local view = lib.get_current_view()

        if view then
          vim.cmd.DiffviewClose()
        else
          vim.cmd.DiffviewOpen()
        end
      end,
      desc = "DiffView",
    },
  },
  -- config = function()
  --   require("diffview").setup({
  --     default_args = {
  --       DiffviewOpen = { "--imply-local" },
  --     },
  --     enhanced_diff_hl = true,
  --     hooks = {
  --       diff_buf_win_enter = function(bufnr, winid, ctx)
  --         if ctx.layout_name:match("^diff2") then
  --           if ctx.symbol == "a" then
  --             vim.opt_local.winhl = table.concat({
  --               "DiffAdd:DiffviewDiffAddAsDelete",
  --               "DiffDelete:DiffviewDiffDelete",
  --             }, ",")
  --           elseif ctx.symbol == "b" then
  --             vim.opt_local.winhl = table.concat({
  --               "DiffDelete:DiffviewDiffDelete",
  --             }, ",")
  --           end
  --         end
  --       end,
  --     },
  --   })
  -- end,
}
