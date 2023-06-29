return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      dim_inactive = {
        enabled = true,
      },
      custom_highlights = function(colors)
        return {
          NeoTreeNormal = { link = "Normal" },
          NeoTreeNormalNC = { link = "NormalNC" },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
    },
  },
}
