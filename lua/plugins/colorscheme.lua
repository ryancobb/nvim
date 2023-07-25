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
        },
      },
    },
  },
  {
    "neanias/everforest-nvim",
    name = "everforest",
    lazy = false,
    opts = function()
      vim.opt.fillchars = { eob = " " }

      require("everforest").setup({
        italics = true,
        dim_inactive_windows = true,
        on_highlights = function(hl, palette)
          hl.Directory = { link = "Blue" }
          hl.EndOfBuffer = { bg = palette.none }
          hl.NeoTreeEndOfBuffer = { bg = palette.none }
          hl.NeoTreeGitModified = { link = "Yellow" }
          hl.NeoTreeNormal = { link = "Normal" }
          hl.NeoTreeNormalNC = { link = "NormalNC" }
          hl.TSFunction = { link = "Blue" }
          hl.TSFunctionCall = { link = "Blue" }
          hl.TSString = { link = "Green" }
        end,
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      dim_inactive = {
        enabled = true,
      },
      custom_highlights = function(_colors)
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
      colorscheme = "nordfox",
    },
  },
}
