return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      keys[#keys + 1] = { "gd", vim.lsp.buf.definition }
    end,
    opts = {
      servers = {
        solargraph = {
          mason = false,
          cmd = { "bundle", "exec", "solargraph", "stdio" },
        },
      },
    },
  },
}
