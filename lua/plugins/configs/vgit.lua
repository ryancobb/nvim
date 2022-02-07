require('vgit').setup {
  keymaps = {
    ['n [c'] = 'hunk_up',
    ['n ]c'] = 'hunk_down',
    ['n <leader>hs'] = 'buffer_hunk_stage',
    ['n <leader>hr'] = 'buffer_hunk_reset',
    ['n <leader>hp'] = 'buffer_hunk_preview',
    ['n <leader>gb'] = 'buffer_blame_preview',
    ['n <leader>gf'] = 'buffer_diff_preview',
    ['n <leader>gh'] = 'buffer_history_preview',
    ['n <leader>gr'] = 'buffer_reset',
    ['n <leader>gg'] = 'project_diff_preview',
    ['n <leader>gx'] = 'toggle_diff_preference',
  }
}
