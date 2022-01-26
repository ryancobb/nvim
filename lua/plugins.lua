return require('packer').startup({function(use)
  use {
    'EdenEast/nightfox.nvim',
    config = function() require('plugins.theme') end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('plugins.treesitter') end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function() require('plugins.lualine') end
  }

  use {
    'numToStr/Comment.nvim',
    config = function() require('plugins.comment') end,
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('plugins.gitsigns') end
  }

  use {
    'hrsh7th/nvim-cmp',
    config = function() require('plugins.cmp') end
  }

  use {
    'windwp/nvim-autopairs',
    config = function() require('plugins.autopairs') end
  }

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('plugins.telescope') end
  }

  use {
    'akinsho/toggleterm.nvim',
    config = function() require('plugins.toggleterm') end,
  }

  use {
    'akinsho/bufferline.nvim',
    config = function() require('plugins.bufferline') end
  }

  use {
    'vim-test/vim-test',
    config = function() require('plugins.vim-test') end
  }

  use {
    'ahmedkhalf/project.nvim',
    config = function() require('plugins.project') end
  }

  use {
    'folke/which-key.nvim',
    config = function() require('which-key').setup() end
  }

  use {
    'kevinhwang91/nvim-hlslens',
    config = function() require('plugins.hlslens') end
  }

  use {
    'RRethy/vim-illuminate',
    config = function() require('plugins.vim-illuminate') end
  }

  use {
    "sidebar-nvim/sidebar.nvim",
    config = function() require('plugins.sidebar') end
  }

  use {
    'windwp/nvim-spectre',
    config = function() require('plugins.spectre') end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function() require('plugins.nvim-tree') end
  }

  use {
    'j-hui/fidget.nvim',
    config = function() require('plugins.fidget') end
  }

  use {
    'wbthomason/packer.nvim',
    'neovim/nvim-lspconfig',
    'antoinemadec/FixCursorHold.nvim',
    'williamboman/nvim-lsp-installer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim',
    'famiu/bufdelete.nvim',
    'fladson/vim-kitty',
    'tknightz/telescope-termfinder.nvim',
    'lewis6991/impatient.nvim',
    'andymass/vim-matchup',
    'p00f/nvim-ts-rainbow',
    'google/vim-jsonnet',
    'towolf/vim-helm',
    'lambdalisue/suda.vim',
    'kdheepak/lazygit.nvim',
  }
end,

config = {
  compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua',
  display = {
    open_fn = require('packer.util').float,
  }
}})
