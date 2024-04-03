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
            LspReferenceRead = { bg = "none" },
            LspReferenceText = { bg = "none" },
            LspReferenceWrite = { bg = "none" },
            NeoTreeNormal = { link = "Normal" },
            NeoTreeNormalNC = { link = "NormalNC" },
            WindowPickerStatusLine = { link = "@text.warning" },
            WindowPickerStatusLineNC = { link = "@text.warning" },
            ["@comment.todo"] = { link = "@comment" },
            ["@lsp.type.namespace.ruby"] = { link = "@type.ruby" },
            ["@lsp.type.parameter.ruby"] = { link = "@variable.ruby" },
            DiffAdd = { bg = C(spec.bg1):blend(C(palette.green.dim), 0.3):to_css() },
            DiffChange = { bg = C(spec.bg1):blend(C(palette.yellow.dim), 0.1):to_css() },
            DiffDelete = { bg = C(spec.bg1):blend(C(palette.red.dim), 0.2):to_css() },
            DiffText = { bg = C(spec.bg1):blend(C(palette.yellow.dim), 0.3):to_css() },
            Folded = { bg = "none" },
          },
        },
      }
    end,
  },
}
