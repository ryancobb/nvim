return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.mapping = cmp.mapping.preset.insert(vim.tbl_deep_extend("force", opts.mapping, {
        ["<cr>"] = cmp.config.disable,
        ["<Right>"] = cmp.mapping.confirm({ select = true }),
      }))
    end,
  },
}
