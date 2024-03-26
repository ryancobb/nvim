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
        },
      },
    },
  },
}
