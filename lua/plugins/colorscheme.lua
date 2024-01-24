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
          WindowPickerStatusLine = { link = "@text.warning" },
          WindowPickerStatusLineNC = { link = "@text.warning" },
          LspReferenceText = { bg = "none" },
          LspReferenceRead = { bg = "none" },
          LspReferenceWrite = { bg = "none" },
          ["@comment.todo"] = { link = "@comment" },
          ["@lsp.type.namespace.ruby"] = { link = "@type.ruby" },
          ["@lsp.type.parameter.ruby"] = { link = "@variable.ruby" },
          ["@lsp.type."] = { link = "@variable.ruby" },
        },
      },
    },
  },
}
