return require('packer').startup({function(use)
  use {
    'wbthomason/packer.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim',
    'williamboman/nvim-lsp-installer',
    'famiu/bufdelete.nvim',
    'fladson/vim-kitty',
    'google/vim-jsonnet',
    'towolf/vim-helm',
    'lambdalisue/suda.vim',
    'rebelot/kanagawa.nvim',
    'RRethy/nvim-treesitter-endwise',
    'lewis6991/impatient.nvim',
    'mrjones2014/smart-splits.nvim',
    'gbprod/cutlass.nvim',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'sindrets/diffview.nvim',
    'ray-x/lsp_signature.nvim',
    'simrat39/symbols-outline.nvim',
  }

  use {
    'hrsh7th/nvim-cmp',
    config = function() require('plugins.configs.cmp') end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('plugins.configs.treesitter') end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function() require('plugins.configs.lualine') end
  }

  use {
    'numToStr/Comment.nvim',
    config = function() require('plugins.configs.comment') end,
  }

  use {
    'windwp/nvim-autopairs',
    config = function() require('plugins.configs.autopairs') end
  }

  use {
    'akinsho/toggleterm.nvim',
    config = function() require('plugins.configs.toggleterm') end,
  }

  use {
    'folke/which-key.nvim',
    config = function() require('which-key').setup() end
  }

  use {
    'RRethy/vim-illuminate',
    config = function() require('plugins.configs.vim-illuminate') end
  }

  use {
    'j-hui/fidget.nvim',
    config = function() require('plugins.configs.fidget') end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('plugins.configs.indent-blankline') end
  }

  use {
    'andymass/vim-matchup',
    config = function() require('plugins.configs.vim-matchup') end
  }

  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install'
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function() require('plugins.configs.gitsigns') end
  }

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      {
        -- only needed if you want to use the "open_window_picker" command
        's1n7ax/nvim-window-picker',
        tag = "1.*",
        config = function()
          require'window-picker'.setup({
            autoselect_one = true,
            include_current = false,
            filter_rules = {
              bo = {
                filetype = { 'neo-tree', "neo-tree-popup", "notify", "quickfix" },
                buftype = { 'terminal' },
              },
            },
            other_win_hl_color = '#e35e4f',
          })
        end,
      }
    },
    config = function()
      require("neo-tree").setup({
        enable_diagnostics = false,
        filesystem = {
          filtered_items = {
            visible = true,
          }
        },
      })
    end
  }

  use {
    'ibhagwan/fzf-lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('plugins.configs.fzflua') end
  }

  use {
    'kdheepak/lazygit.nvim',
    config = function() require('plugins.configs.lazygit') end
  }
end,

config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})
