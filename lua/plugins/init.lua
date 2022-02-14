return require('packer').startup({function(use)
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
    'hrsh7th/nvim-cmp',
    config = function() require('plugins.configs.cmp') end
  }

  use {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim',
    'L3MON4D3/LuaSnip',
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
    'akinsho/bufferline.nvim',
    config = function() require('plugins.configs.bufferline') end
  }

  use {
    'vim-test/vim-test',
    config = function() require('plugins.configs.vim-test') end
  }

  use {
    'ahmedkhalf/project.nvim',
    config = function() require('plugins.configs.project') end
  }

  use {
    'folke/which-key.nvim',
    config = function() require('which-key').setup() end
  }

  use {
    'kevinhwang91/nvim-hlslens',
    config = function() require('plugins.configs.hlslens') end
  }

  use {
    'RRethy/vim-illuminate',
    config = function() require('plugins.configs.vim-illuminate') end
  }

  use {
    "sidebar-nvim/sidebar.nvim",
    config = function() require('plugins.configs.sidebar') end
  }

  use {
    'windwp/nvim-spectre',
    config = function() require('plugins.configs.spectre') end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function() require('plugins.configs.nvim-tree') end
  }

  use {
    'j-hui/fidget.nvim',
    config = function() require('plugins.configs.fidget') end
  }

  use {
    'ibhagwan/fzf-lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('plugins.configs.fzf-lua') end
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
    'tanvirtin/vgit.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function() require('plugins.configs.vgit') end
  }

  use {
    'anuvyklack/pretty-fold.nvim',
    config = function() require('plugins.configs.pretty-fold') end
  }

  use {
    'wbthomason/packer.nvim',
    'neovim/nvim-lspconfig',
    'antoinemadec/FixCursorHold.nvim',
    'williamboman/nvim-lsp-installer',
    'famiu/bufdelete.nvim',
    'fladson/vim-kitty',
    'p00f/nvim-ts-rainbow',
    'google/vim-jsonnet',
    'towolf/vim-helm',
    'lambdalisue/suda.vim',
    'kdheepak/lazygit.nvim',
    'rebelot/kanagawa.nvim',
    'EdenEast/nightfox.nvim',
    'RRethy/nvim-treesitter-endwise',
    'lewis6991/impatient.nvim'
  }
end,

config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})
