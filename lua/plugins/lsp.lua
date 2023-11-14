return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      local fzflua = require("fzf-lua")

      keys[#keys + 1] = {
        "<c-w>d",
        function()
          fzflua.lsp_definitions({
            jump_to_single_result = true,
            jump_to_single_result_action = require("fzf-lua.actions").file_vsplit,
          })
        end,
      }
      keys[#keys + 1] = {
        "gd",
        function()
          fzflua.lsp_definitions({
            jump_to_single_result = true,
          })
        end,
      }
      keys[#keys + 1] = {
        "gr",
        function()
          fzflua.lsp_references({ ignore_current_line = true })
        end,
      }
      keys[#keys + 1] = { "<leader>fs", "<cmd>FzfLua lsp_document_symbols<cr>", desc = 'symbols' }
    end,
    opts = {
      diagnostics = {
        virtual_text = false,
      },
      inlay_hints = { enabled = true },
      servers = {
        -- solargraph = {
        --   mason = false,
        --   cmd = { "bundle", "exec", "solargraph", "stdio" },
        -- },
        ruby_ls = {
          mason = false,
        }
      },
    },
  },
}
