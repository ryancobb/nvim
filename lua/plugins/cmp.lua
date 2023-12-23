return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.mapping = cmp.mapping.preset.insert(vim.tbl_deep_extend("force", opts.mapping, {
        ["<CR>"] = cmp.config.disable,
      }))
    end,
  },
}
