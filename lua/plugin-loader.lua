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
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('plugins.nvim-tree') end
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
    config = function() require('gitsigns').setup() end
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
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('plugins.indent-blankline') end
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
    config = function() require('project_nvim').setup() end
  }

  use {
    'folke/which-key.nvim',
    config = function() require('which-key').setup() end
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
    'andymass/vim-matchup',
    'famiu/bufdelete.nvim',
    'sindrets/diffview.nvim',
    'fladson/vim-kitty',
    'tknightz/telescope-termfinder.nvim'
  }
end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})
