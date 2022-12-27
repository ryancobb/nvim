return {
  'lewis6991/gitsigns.nvim',
  lazy = false,
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      require('which-key').register({
        ['<leader>g'] = {
          name = 'git',
          S = { gs.stage_buffer, 'stage buffer' },
          R = { gs.reset_buffer, 'reset buffer' },
          b = { function() gs.blame_line { full = true } end, 'blame line' },
        },
        ['<leader>h'] = {
          name = 'hunk',
          s = { ':Gitsigns stage_hunk<CR>', 'stage hunk' },
          r = { ':Gitsigns reset_hunk<CR>', 'reset hunk' },
          u = { gs.undo_stage_hunk, 'undo stage hunk' },
          p = { gs.preview_hunk, 'preview hunk' },
        },
      })

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end, { expr = true })

      map('n', '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, { expr = true })

      -- Text object
      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')

      require("scrollbar.handlers.gitsigns").setup()
    end
  },
  keys = {
    { '<leader>gD', ':Gitsigns diffthis<cr>', desc = 'diff this' }
  }
}
