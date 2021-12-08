local npairs = require('nvim-autopairs')

npairs.setup {
  check_ts = true,
  ignored_next_char = "[%w%.]"
}

npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
