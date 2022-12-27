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
    }
  }
}
