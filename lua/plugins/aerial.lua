return {
  "stevearc/aerial.nvim",
  opts = {
    backends = {
      ["_"] = { "treesitter", "lsp", "markdown", "man" },
      ruby = { "treesitter" },
    },
  },
}
