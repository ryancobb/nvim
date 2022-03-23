require('fzf-lua').setup {
  keymap = {
    fzf = {
      ['tab'] = 'down',
      ['btab'] = 'up'
    }
  },
  winopts = {
    height           = 0.90,
    width            = 0.90,
    preview = { default = 'bat_native' }
  },
  files = {
    fd_opts = "--color=never --type f --hidden --follow --no-ignore --exclude .git --exclude node_modules --exclude tmp --exclude spec/fixtures/vcr_cassettes",
    git_icons = false
  },
}
