return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      keys[#keys + 1] = { "gd", vim.lsp.buf.definition }
      keys[#keys + 1] = { "gr", require("fzf-lua").lsp_references }
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
