return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      indent = { enable = false },
      endwise = { enable = true },
      matchup = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "ruby",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      textobjects = {
        move = {
          enable = false,
        },
      },
    },
  },
  { "RRethy/nvim-treesitter-endwise" },
  {
    "nvim-treesitter/nvim-treesitter-context",
    branch = "rc/ruby_do_block",
    opts = {
      max_lines = 0,
    },
    keys = {
      {
        "[c",
        function()
          require("treesitter-context").go_to_context(vim.v.count1)
        end,
        "jump to context",
      },
    },
  },
}
