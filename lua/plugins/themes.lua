return {
  {
    'EdenEast/nightfox.nvim', config = {
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
    }
  },
}
