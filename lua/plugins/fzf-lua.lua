return {
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    dependencies = {
      "echasnovski/mini.icons"
    },
    opts = {
      grep = {
        rg_glob = true,
        fzf_opts = {
          -- ctrl+n ctrl+p to cycle history
          ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-grep-history",
        },
      },
      files = {
        fzf_opts = {
          -- ctrl+n ctrl+p to cycle history
          ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-files-history",
        },
        actions = {
          ["enter"] = function(selected, opts)
            local fallback = vim.api.nvim_get_current_win()
            local window_id = require("window-picker").pick_window() or fallback
            vim.api.nvim_set_current_win(window_id)
            require("fzf-lua.actions").file_edit(selected, opts)
          end,
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
      { "<leader><space>", "<cmd>FzfLua files<cr>", desc = "files" },
      { "<leader>st", "<cmd>FzfLua live_grep<cr>", desc = "text" },
      -- { "<leader>/", "<cmd>FzfLua live_grep<cr>", desc = "text" },
      { "<leader>gL", "<cmd>FzfLua git_bcommits<cr>", desc = "log (buffer)" },
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
                :gsub("^ee/app/", "") .. " !" .. vim.fn.expand("%:t"),
            },
          })
        end,
        desc = "alternate",
      },
    },
  },
}
