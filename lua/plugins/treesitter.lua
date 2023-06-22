return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = "all",
      endwise = {
        enable = true,
      },
      matchup = {
        enable = true,
      },
    },
  },
  { "RRethy/nvim-treesitter-endwise" },
}
