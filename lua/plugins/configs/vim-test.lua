vim.cmd [[
  function! ToggleTermStrategy(cmd) abort
  call luaeval("require('toggleterm').exec(_A[1], _A[2])", [a:cmd, 0])
  endfunction

  let g:test#custom_strategies = {'toggleterm': function('ToggleTermStrategy')}
]]

vim.g['test#strategy'] = 'toggleterm'
