return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      keys[#keys + 1] = { "gd", "<cmd>FzfLua lsp_definitions<cr>" }
      keys[#keys + 1] = { "gr", "<cmd>FzfLua lsp_references<cr>" }
      keys[#keys + 1] = { "fs", "<cmd>FzfLua lsp_document_symbols<cr>" }
      keys[#keys + 1] = { "<leader>cf", vim.lsp.buf.format }
    end,
    opts = {
      diagnostics = {
        virtual_text = false,
      },
      inlay_hints = { enabled = true },
      servers = {
        solargraph = {
          mason = false,
          cmd = { "bundle", "exec", "solargraph", "stdio" },
          capabilities = { textDocument = { definition = { dynamicRegistration = false } } },
        },
      },
    },
  },
}
