local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

require('packer').startup({function(use)
  use {
    'wbthomason/packer.nvim',
    'neovim/nvim-lspconfig',
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
    'onsails/lspkind.nvim',
  }

  use {
    'kevinhwang91/nvim-hlslens',
    config = function()
      local kopts = {noremap = true, silent = true}

      vim.api.nvim_set_keymap('n', 'n',
        [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts)
      vim.api.nvim_set_keymap('n', 'N',
        [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts)
      vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

      require('hlslens').setup({
        calm_down = true,
        nearest_only = true
      })
    end

  }

  use {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    config = function()
      vim.g.coq_settings = {
        keymap = {
          recommended = false,
          jump_to_mark = "null"
        },
        auto_start = 'shut-up',
        display = {
          icons = {
            mode = 'short'
          },
          pum = {
            fast_close = false
          }
        }
      }

      require('coq')

      local remap = vim.api.nvim_set_keymap
      local npairs = require('nvim-autopairs')

      npairs.setup({ map_bs = false, map_cr = false })

      -- these mappings are coq recommended mappings unrelated to nvim-autopairs
      remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
      remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
      remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
      remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

      -- skip it, if you use another global object
      _G.MUtils= {}

      MUtils.CR = function()
        if vim.fn.pumvisible() ~= 0 then
          if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
            return npairs.esc('<c-y>')
          else
            return npairs.esc('<c-e>') .. npairs.autopairs_cr()
          end
        else
          return npairs.autopairs_cr()
        end
      end
      remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

      MUtils.BS = function()
        if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
          return npairs.esc('<c-e>') .. npairs.autopairs_bs()
        else
          return npairs.autopairs_bs()
        end
      end
      remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
    end
  }

  use {
    'ms-jpq/coq.artifacts',
    branch = 'artifacts'
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
