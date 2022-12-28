return {
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nightfox').setup({
        options = {
          dim_inactive = true,
          modules = {
            cmp = true,
            fidget = true,
            gitsigns = true,
            illuminate = true,
            neogit = true,
            neotest = true,
            neotree = true,
            telescope = true,
            treesitter = true,
            tsrainbow = true,
            whichkey = true,
            diagnostic = {
              enable = true
            },
            native_lsp = {
              enable = true
            }
          }
        },
        groups = {
          all = {
            ['@symbol'] = { link = '@label' }
          }
        }
      })

      vim.cmd [[ colorscheme nordfox ]]
    end
  },
}
