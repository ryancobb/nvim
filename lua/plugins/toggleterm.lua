require('toggleterm').setup {
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = false, -- close the terminal window when the process exits
}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  close_on_exit = true,
  float_opts = {
    border = "single",
  },
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

local opts = { noremap = true, silent = true } 

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", opts)
vim.api.nvim_set_keymap('n', [[<c-\>]], '<cmd>exe v:count1 . "ToggleTerm direction=vertical"<CR>', opts)
vim.api.nvim_set_keymap('i', [[<c-\>]], '<esc><cmd>exe v:count1 . "ToggleTerm direction=vertical"<CR>', opts)
vim.api.nvim_set_keymap('n', [[<c-t>]], '<cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>', opts)
vim.api.nvim_set_keymap('i', [[<c-t>]], '<esc><cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>', opts)
