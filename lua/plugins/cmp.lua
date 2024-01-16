return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
        ["<CR>"] = cmp.config.disable,
        ["<Right>"] = cmp.mapping.confirm({ select = false }),
      })
      opts.preselect = cmp.PreselectMode.None
      opts.completion = {
        completeopt = "menu,menuone,noinsert,noselect",
      }
    end,
  },
}
