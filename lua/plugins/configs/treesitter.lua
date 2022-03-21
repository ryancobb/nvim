require('orgmode').setup_ts_grammar()

require('nvim-treesitter.configs').setup {
  ensure_installed = {'org'},
  highlight = {
    enable = true,
    disable = {'org'},
    additional_vim_regex_highlighting = {'org'}
  },
  indent = {
    enable = true,
    disable = { 'yaml', 'ruby' }
  },
  matchup = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true
  },
  endwise = {
    enable = true
  }
}
