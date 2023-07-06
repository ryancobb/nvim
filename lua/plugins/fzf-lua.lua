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
    },
    keys = {
      {
        "<leader>fa",
        function()
          require("fzf-lua").files({
            fzf_opts = {
              ["--query"] = vim.fn.expand("%:~:."):gsub("_spec", ""):gsub("^app/", ""):gsub("^spec/", "")
                .. '\\ "!'
                .. vim.fn.expand("%:t")
                .. '"\\ ',
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
          require("fzf-lua").files({ cmd = "fd --type f --exclude spec/fixtures" })
        end,
        desc = "find files",
      },
      { "<leader>fr", "<cmd>FzfLua resume<cr>", desc = "resume" },
      { "<leader>ss", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "symbols" },
      { "<leader>st", "<cmd>FzfLua live_grep_glob<cr>", desc = "text" },
      { "<leader>sc", "<cmd>FzfLua grep_cword<cr>", desc = "cursor word" },
      { "<leader>gL", "<cmd>FzfLua git_commits<cr>", desc = "log" },
      { "<leader>gl", "<cmd>FzfLua git_bcommits<cr>", desc = "log (buffer)" },
      { "<leader>gs", "<cmd>FzfLua git_status<cr>", desc = "status" },
    },
  },
}
