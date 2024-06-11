return {
  {
    "ibhagwan/fzf-lua",
    opts = {
      winopts = {
        preview = {
          layout = "flex",
          flip_columns = 230,
        },
      },
    },
    keys = {
      { "<leader>gL", "<cmd>FzfLua git_bcommits<cr>", desc = "log (buffer)" },
      {
        "<leader>gl",
        function()
          require("fzf-lua").git_commits({ winopts = { fullscreen = true } })
        end,
        desc = "log",
      },
      {
        "<leader>gs",
        function()
          require("fzf-lua").git_status({ winopts = { fullscreen = true, preview = { horizontal = "right:80%" } } })
        end,
        desc = "status",
      },
      {
        "<leader>gB",
        function()
          require("fzf-lua").git_branches({
            cmd = "git branch -l --sort=-committerdate --color",
            preview = "git log --decorate --graph --color --date=relative {1}",
            winopts = { preview = { vertical = "down:70%" } },
          })
        end,
        desc = "checkout",
      },
      {
        "<leader>fa",
        function()
          require("fzf-lua").files({
            fzf_opts = {
              ["--query"] = vim.fn
                .expand("%:~:.:r")
                :gsub("_spec", "")
                :gsub("^app/", "")
                :gsub("^spec/", "")
                :gsub("^ee/app/", "") .. ' !' .. vim.fn.expand("%:t"),
            },
          })
        end,
        desc = "alternate",
      },
    },
  },
}
