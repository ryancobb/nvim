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
      grep = {
        rg_glob = true,
        rg_opts = "--hidden --column --line-number --no-heading --color=always --smart-case --max-columns=4096 \z
          -g !.git \z
          -g !spec/fixtures \z
          -g !package-lock.json \z
          -g !yarn.lock \z
          -g !locale \z
          -g !Gemfile.lock \z
          -e",
        fzf_opts = {
          -- ctrl+n ctrl+p to cycle history
          ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-grep-history",
        },
      },
      files = {
        fd_opts = "--color=never --type f --hidden --follow --exclude .git --exclude node_modules --exclude spec/fixtures",
        fzf_opts = {
          -- ctrl+n ctrl+p to cycle history
          ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-files-history",
        },
      },
      keymap = {
        builtin = {
          ["<c-d>"] = "preview-page-down",
          ["<c-u>"] = "preview-page-up",
        },
        fzf = {
          ["ctrl-d"] = "preview-page-down",
          ["ctrl-u"] = "preview-page-up",
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
      { "<leader><space>", "<cmd>FzfLua files<cr>", desc = "files" },
      { "<leader>st", "<cmd>FzfLua live_grep<cr>", desc = "text" },
      { "<leader>sc", "<cmd>FzfLua grep_cword<cr>", desc = "cursor word" },
      {
        "<leader>gl",
        function()
          require("fzf-lua").git_commits({ winopts = { fullscreen = true } })
        end,
        desc = "log",
      },
      { "<leader>gL", "<cmd>FzfLua git_bcommits<cr>", desc = "log (buffer)" },
      {
        "<leader>gs",
        function()
          require("fzf-lua").git_status({ winopts = { fullscreen = true, preview = { horizontal = "right:80%" } } })
        end,
        desc = "status",
      },
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
