return {
  "kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  build = function()
    -- Install tries to automatically detect the install method.
    -- if it fails, try calling it with one of these parameters:
    --    "curl", "wget", "bitsadmin", "go"
    require("dbee").install()
  end,
  config = function()
    require("dbee").setup({
      require('dbee.sources').MemorySource:new({
        {
          name = 'cdot',
          type = 'postgres',
          url = 'postgres://ryancobb@localhost:5432/payment_app_development'
        }
      })
    })
  end,
  keys = {
    { '<leader>d', function() require("dbee").toggle() end, desc = 'dbee' },
  }
}
