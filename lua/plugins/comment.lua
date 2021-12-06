require('Comment').setup() 

require('utils').set_keymaps({['v'] = {{'<leader>/', '<esc><cmd>lua require("Comment.api").gc(vim.fn.visualmode())<CR>'}}})
