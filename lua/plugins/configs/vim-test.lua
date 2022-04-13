vim.g['test#custom_strategies'] = {
  toggleterm = function(cmd)
    require('toggleterm').exec(cmd)
  end
}

vim.g['test#strategy'] = 'toggleterm'
