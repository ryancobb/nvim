require('indent_blankline').setup {
  char = "",
  context_char = "│",
  show_current_context = true,
  filetype_exclude = {
    'help',
    'terminal',
    'packer',
    'lspinfo',
    'TelescopePrompt',
    'TelescopeResults',
    'lsp-installer',
    'toggleterm',
    ''
  },
  use_treesitter = true
}
