return {
  {
    "EdenEast/nightfox.nvim",
    opts = {
      options = {
        dim_inactive = true,
        styles = {
          comments = "italic",
        },
      },
      groups = {
        all = {
          NeoTreeNormal = { link = "Normal" },
          NeoTreeNormalNC = { link = "NormalNC" },
          ["@text.Todo"] = { bg = "none" },
          WindowPickerStatusLine = { link = "@text.warning" },
          WindowPickerStatusLineNC = { link = "@text.warning" },
        },
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
