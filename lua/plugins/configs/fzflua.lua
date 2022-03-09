require('fzf-lua').setup {
  winopts = {
    height           = 0.90,
    width            = 0.90,
  },
  files = {
    fd_opts = "--color=never --type f --hidden --follow --no-ignore --exclude .git --exclude node_modules --exclude tmp",
  }
}
