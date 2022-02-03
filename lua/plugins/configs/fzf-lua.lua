require('fzf-lua').setup {
  winopts = {
    hl = {
      -- for nightfox
      normal = 'NormalSB',
      border = 'NormalSB'
    }
  },
  files = {
    fd_opts = "--color=never --type f --hidden --follow --exclude .git --exclude spec/fixtures --exclude vendor --exclude qa/vendor"
  }
}
