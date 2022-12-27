return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'olimorris/neotest-rspec',
      'haydenmeade/neotest-jest'
    },
    config = function()
      require('neotest').setup({
        discovery = {
          enabled = false
        },
        adapters = {
          require('neotest-rspec'),
          require('neotest-jest')
        },
        diagnostic = {
          enabled = false
        },
        output_panel = {
          enabled = true,
          open = 'botright split | resize 15'
        }
      })
    end,
    keys = {
      { '<leader>ta', function() require('neotest').run.attach({ interactive = true }) end, desc = 'attach (test)' },
      { '<leader>tn', function() require('neotest').run.run() end, desc = 'nearest (test)' },
      { '<leader>tf', function() require('neotest').run.run(vim.fn.expand('%')) end, 'file (test)' },
      { '<leader>ts', function() require('neotest').summary.toggle() end, 'summary (test)' },
      { '<leader>to', function() require('neotest').output.open() end, 'output (test) ' }
    }
  }
}
