return {
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = {
      winopts = {
        preview = { default = 'bat_native' }
      },
      files = {
        git_icons = false
      },
      git = {
        status = {
          preview_pager = 'delta --width=$FZF_PREVIEW_COLUMNS'
        },
        commits = {
          preview_pager = 'delta --width=$FZF_PREVIEW_COLUMNS'
        },
        bcommits = {
          preview_pager = 'delta --width=$FZF_PREVIEW_COLUMNS'
        },
      }
    },
    keys = {
      {
        '<leader><space>',
        function()
          require('fzf-lua').buffers({
            previewer = false,
            winopts = { height = 0.20 },
            global_resume = false
          })
        end,
        desc = 'buffers'
      },
      {
        '<leader>sa',
        function() require('fzf-lua').files({
            fzf_opts = { ['--query'] = vim.fn.expand('%:t:r'):gsub('_spec', '') .. '\\ \"!' .. vim.fn.expand('%:t') ..
                '\"\\ ' }
          })
        end,
        desc = 'alternate'
      },
      { '<leader>?', ':FzfLua oldfiles cwd_only=true<cr>', desc = 'old files' },
      { '<leader>f', ':FzfLua files<cr>', desc = 'find files' },
      { '<leader>st', ':FzfLua live_grep_glob<cr>', desc = 'text' },
      { '<leader>sc', ':FzfLua grep_cword<cr>', desc = 'cursor word' },
      { '<leader>sr', ':FzfLua resume<cr>', desc = 'resume' },
      { '<leader>gL', ':FzfLua git_commits<cr>', desc = 'log' },
      { '<leader>gl', ':FzfLua git_bcommits<cr>', desc = 'log (buffer)' }
    }
  }
}
