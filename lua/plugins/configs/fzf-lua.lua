local set_keymap = function(lhs, rhs) vim.api.nvim_buf_set_keymap(0, 't', lhs, rhs, { silent = true, noremap = true}) end

require('fzf-lua').setup {
  winopts = {
    hl = {
      -- for nightfox
      normal = 'NormalSB',
      border = 'NormalSB'
    },
    window_on_create = function()
      set_keymap('<c-j>', '<down>')
      set_keymap('<c-k>', '<up>')
    end
  },
  files = {
    fd_opts = "--color=never --type f --hidden --follow --exclude .git --exclude spec/fixtures --exclude vendor --exclude qa/vendor"
  },
  grep = {
    rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=512 --hidden --glob=!.git",
  }
}
