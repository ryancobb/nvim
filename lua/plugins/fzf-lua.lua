local fzf_buffers = function()
  require("fzf-lua").buffers({
    previewer = false,
    winopts = { height = 0.20 },
    global_resume = false,
  })
end

return {
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    opts = {
      files = {
        cwd_prompt = false,
      },
      keymap = {
        builtin = {
          ["<c-d>"] = "preview-page-down",
          ["<c-u>"] = "preview-page-up",
        },
      },
      winopts = {
        preview = {
          layout = "flex",
          flip_columns = 230,
        },
      },
    },
    keys = {
      {
        "<leader>fa",
        function()
          require("fzf-lua").files({
            fzf_opts = {
              ["--query"] = vim.fn
                .expand("%:~:.")
                :gsub("_spec", "")
                :gsub("^app/", "")
                :gsub("^spec/", "")
                :gsub("^ee/app/", "") .. '\\ "!' .. vim.fn.expand("%:t") .. '"\\ ',
            },
          })
        end,
        desc = "alternate",
      },
      { "<leader>,", fzf_buffers, desc = "buffers" },
      { "<leader>fr", "<cmd>FzfLua oldfiles cwd_only=true<cr>", desc = "recent files" },
      {
        "<leader><space>",
        function()
          require("fzf-lua").files({ cmd = "fd -t file --exclude spec/fixtures" })
        end,
        desc = "files",
      },
      {
        "<leader>fh",
        function()
          require("fzf-lua").files({ cmd = "fd --no-ignore --hidden --exclude spec/fixtures --exclude node_modules" })
        end,
        desc = "hidden",
      },
      { "<leader>st", "<cmd>FzfLua live_grep_glob<cr>", desc = "text" },
      { "<leader>sc", "<cmd>FzfLua grep_cword<cr>", desc = "cursor word" },
      { "<leader>gL", "<cmd>FzfLua git_commits<cr>", desc = "log" },
      { "<leader>gl", "<cmd>FzfLua git_bcommits<cr>", desc = "log (buffer)" },
      { "<leader>gs", "<cmd>FzfLua git_status<cr>", desc = "status" },
      {
        "<leader>gd",
        function()
          local lib = require("diffview.lib")
          local view = lib.get_current_view()
          if view then
            vim.cmd.DiffviewClose()
          else
            require("fzf-lua").fzf_exec("git branch -a", {
              prompt = "diff:",
              actions = {
                ["default"] = function(selected)
                  vim.cmd.DiffviewOpen({ args = { selected[1] } })
                end,
              },
            })
          end
        end,
        desc = "diff",
      },
    },
  },
}
