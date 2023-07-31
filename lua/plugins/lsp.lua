return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      local fzflua = require("fzf-lua")

      keys[#keys + 1] = {
        "gd",
        function()
          fzflua.lsp_definitions({
            jump_to_single_result = true,
            jump_to_single_result_action = require("fzf-lua.actions").file_vsplit,
          })
        end,
      }
      keys[#keys + 1] = {
        "gr",
        function()
          fzflua.lsp_references({ ignore_current_line = true })
        end,
      }
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
