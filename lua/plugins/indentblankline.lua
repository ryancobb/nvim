return {
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPre',
    config = {
      char = '┊',
      show_trailing_blankline_indent = false,
      show_current_context = true,
      filetype_exclude = {
        'help',
        'terminal',
        'packer',
        'lspinfo',
        'lsp-installer',
        ''
      }
    }
  }
}
