return {
  {
    'famiu/bufdelete.nvim',
    keys = {
      { '<leader>c', function() require('bufdelete').bufdelete(0, true) end, desc = 'close buffer' }
    }
  },
}
