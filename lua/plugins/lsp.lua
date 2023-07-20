return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      keys[#keys + 1] = { "gd", "<cmd>Glance definitions<cr>" }
      keys[#keys + 1] = { "gr", "<cmd>Glance references<cr>" }
      keys[#keys + 1] = { "ss", "<cmd>FzfLua lsp_document_symbols<cr>" }
      keys[#keys + 1] = { "<leader>cf", vim.lsp.buf.format }
    end,
    opts = {
      inlay_hints = { enabled = true },
      servers = {
        solargraph = {
          mason = false,
          cmd = { "bundle", "exec", "solargraph", "stdio" },
        },
      },
    },
  },
}
