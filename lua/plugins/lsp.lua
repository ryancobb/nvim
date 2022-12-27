return {
  { 'williamboman/mason-lspconfig.nvim' },
  { 'williamboman/mason.nvim', config = true },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'folke/neodev.nvim'
    },
    config = function()
      vim.diagnostic.config({
        virtual_text = false,
      })

      local signs = {
        Error = " ",
        Warn = " ",
        Hint = " ",
        Info = " "
      }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr }

        if client.server_capabilities.documentSymbolProvider then
          require('nvim-navic').attach(client, bufnr)
        end

        require('which-key').register({
          ['gd'] = { ':FzfLua lsp_definitions jump_to_single_result=true<cr>', 'definition' },
          ['gr'] = { ':FzfLua lsp_references jump_to_single_result=true<cr>', 'references' },
          K = { vim.lsp.buf.hover, 'hover' },
          ['<leader>rn'] = { vim.lsp.buf.rename, 'rename' },
          ['<leader>so'] = { ':FzfLua lsp_document_symbols<cr>', 'document symbols' },
          ['<leader>l'] = { name = 'lsp', f = { function() vim.lsp.buf.format({ async = true }) end, 'format' } }
        }, opts)
      end

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require 'lspconfig'
      lspconfig.solargraph.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { '/Users/ryancobb/.asdf/shims/solargraph', 'stdio' }
      }

      require('mason-lspconfig').setup()
      require('mason-lspconfig').setup_handlers {
        function(server_name)
          lspconfig[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities
          }
        end
      }
    end
  }
}
