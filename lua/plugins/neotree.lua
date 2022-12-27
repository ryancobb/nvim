return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim'
    },
    config = {
      enable_diagnostics = false,
      close_if_last_window = true,
      filesystem = {
        filtered_items = {
          visible = true
        },
        never_show = { '.DS_Store', '.git' }
      },
      window = {
        mappings = {
          ['<cr>'] = 'open_with_window_picker',
          ['<c-v>'] = 'open_vsplit'
        }
      }
    },
    keys = {
      { '<leader>e', ':NeoTreeShowToggle<CR>', desc = 'neotree' },
      { '<leader>r', ':Neotree reveal<CR>', desc = 'reveal file' },
      { '<leader>gs', ':Neotree git_status<cr>', desc = 'status'  },
      { '<leader>b', ':Neotree buffers toggle<cr>', desc = 'buffers'  }
    }
  },
  {
    's1n7ax/nvim-window-picker',
    tag = 'v1.5',
    config = {
      autoselect_one = true,
      include_current = false,
      filter_rules = {
        bo = {
          filetype = { 'neo-tree', 'neo-tree-popup', 'notify', 'quickfix' },
          buftype = { 'nofile' }
        }
      },
    }
  }
}
