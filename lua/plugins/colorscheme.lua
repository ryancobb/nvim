return {
  {
    "EdenEast/nightfox.nvim",
    enabled = false,
    config = function()
      require("nightfox").setup({
        options = {
          dim_inactive = true,
        },
        groups = {
          all = {
            NeoTreeNormal = { link = "Normal" },
            NeoTreeNormalNC = { link = "NormalNC" },
          },
        },
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = {
      dim_inactive = {
        enabled = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
    },
  },
}
