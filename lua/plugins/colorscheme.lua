return {
  {
    "EdenEast/nightfox.nvim",
    opts = function()
      local spec = require("nightfox.spec").load("nordfox")
      local palette = require("nightfox.palette").load("nightfox")
      local C = require("nightfox.lib.color")

      return {
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
            WindowPickerStatusLine = { link = "@text.warning" },
            WindowPickerStatusLineNC = { link = "@text.warning" },
            ["@comment.todo"] = { link = "@comment" },
            ["@lsp.type.namespace.ruby"] = { link = "@type.ruby" },
            ["@lsp.type.parameter.ruby"] = { link = "@variable.ruby" },
            DiffAdd = { bg = C(spec.bg1):blend(C(palette.green.dim), 0.25):to_css() },
            DiffChange = { bg = C(spec.bg1):blend(C(palette.yellow.dim), 0.15):to_css() },
            DiffDelete = { bg = C(spec.bg1):blend(C(palette.red.dim), 0.25):to_css() },
            DiffText = { bg = C(spec.bg1):blend(C(palette.yellow.dim), 0.3):to_css() },
            Folded = { bg = "none" },
            RainbowDelimiterRed = { link = "TSRainbowRed" },
            RainbowDelimiterBlue = { link = "TSRainbowBlue" },
            RainbowDelimiterCyan = { link = "TSRainbowCyan" },
            RainbowDelimiterGreen = { link = "TSRainbowGreen" },
            RainbowDelimiterOrange = { link = "TSRainbowOrange" },
            RainbowDelimiterViolet = { link = "TSRainbowViolet" },
            RainbowDelimiterYellow = { link = "TSRainbowYellow" },
          },
        },
      }
    end,
  },
}
