require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true
  },
  indent = {
    enable = true,
    disable = { 'yaml', 'lua' }
  },
  matchup = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true
  }
}
