require('fzf-lua').setup {
  global_resume = false,
  winopts = {
    hl = {
      normal = 'NormalSB',
      border = 'NormalSB'
    }
  },
  files = {
    fd_opts = "--color=never --type f --hidden --follow --exclude .git --exclude spec/fixtures --exclude vendor --exclude qa/vendor"
  }
}
