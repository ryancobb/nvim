require('fzf-lua').setup {
  global_resume = false,
  files = {
    fd_opts = "--color=never --type f --hidden --follow --exclude .git --exclude spec/fixtures --exclude vendor --exclude qa/vendor"
  },
  old_files = {
    cwd_only = true
  }
}
