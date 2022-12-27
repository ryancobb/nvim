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
    end
  }
}
