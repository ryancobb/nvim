return {
  {
    'mrjones2014/smart-splits.nvim',
    keys = {
      { '<c-up>', function() require('smart-splits').resize_up() end },
      { '<c-down>', function() require('smart-splits').resize_down() end },
      { '<c-left>', function() require('smart-splits').resize_left() end },
      { '<c-right>', function() require('smart-splits').resize_right() end }
    }
  }
}