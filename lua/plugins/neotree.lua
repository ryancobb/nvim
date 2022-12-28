return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    cmd = 'Neotree',
    branch = 'v2.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      {
        's1n7ax/nvim-window-picker',
        tag = 'v1.5',
        dependencies = {
          'rebelot/heirline.nvim'
        },
        config = function()
          require('window-picker').setup({
            autoselect_one = true,
            include_current = false,
            other_win_hl_color = 'grey',
            filter_rules = {
              bo = {
                filetype = { 'neo-tree', 'neo-tree-popup', 'notify', 'quickfix' },
                buftype = { 'nofile' }
              }
            }
          })
        end
      }
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
      { '<leader>e', '<cmd>NeoTreeShowToggle<cr>', desc = 'neotree' },
      { '<leader>r', '<cmd>Neotree reveal<cr>', desc = 'reveal file' },
      { '<leader>gs', '<cmd>Neotree git_status<cr>', desc = 'status' },
      { '<leader>b', '<cmd>Neotree buffers toggle<cr>', desc = 'buffers' }
    }
  },
}
