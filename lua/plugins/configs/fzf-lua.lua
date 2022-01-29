require('fzf-lua').setup {
  files = {
    fd_opts = "--color=never --type f --hidden --follow --exclude .git --exclude spec/fixtures --exclude vendor --exclude qa/vendor"
  }
}
