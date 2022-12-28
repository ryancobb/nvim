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
      { '<leader>?', '<cmd>FzfLua oldfiles cwd_only=true<cr>', desc = 'old files' },
      { '<leader>f', '<cmd>FzfLua files<cr>', desc = 'find files' },
      { '<leader>st', '<cmd>FzfLua live_grep_glob<cr>', desc = 'text' },
      { '<leader>sc', '<cmd>FzfLua grep_cword<cr>', desc = 'cursor word' },
      { '<leader>sr', '<cmd>FzfLua resume<cr>', desc = 'resume' },
      { '<leader>gL', '<cmd>FzfLua git_commits<cr>', desc = 'log' },
      { '<leader>gl', '<cmd>FzfLua git_bcommits<cr>', desc = 'log (buffer)' }
    }
  }
}
