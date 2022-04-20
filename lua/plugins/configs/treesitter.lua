require('nvim-treesitter.configs').setup {
  ensure_installed = {},
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = { 'ruby' }
  },
  matchup = {
    enable = true
  },
  endwise = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      node_decremental = "grm",
      scope_incremental = "grc"
    }
  }
}
