return {
  "rgroli/other.nvim",
  name = "other-nvim",
  opts = {
    mappings = {
      "rails",
      {
        pattern = "/app/(.*)/(.*).rb",
        target = {
          { context = "test", target = "/spec/requests/%1/%2_spec.rb" },
          { context = "test", target = "/spec/requests/%2_spec.rb" },
          { context = "test", target = "/spec/requests/**/%2_spec.rb" },
        },
      },
      {
        pattern = "(.+)/spec/(.*)/(.*)/(.*)_spec.rb",
        target = {
          { target = "%1/db/%3/%4.rb" },
          { target = "%1/app/%3/%4.rb" },
          { target = "%1/%3/%4.rb" },
        },
      },
      {
        pattern = "(.+)/spec/(.*)/(.*)_spec.rb",
        target = {
          { target = "%1/db/%2/%3.rb" },
          { target = "%1/app/%2/%3.rb" },
          { target = "%1/lib/%2/%3.rb" },
        },
      },
      {
        pattern = "(.+)/spec/(.*)/(.*)_(.*)_spec.rb",
        target = {
          { target = "%1/app/%4s/%3_%4.rb" },
        },
      },
    },
    showMissingFiles = false,
    rememberBuffers = false
  },
  keys = {
    { "<leader>fa", "<cmd>Other<cr>", desc = "aternate" },
  },
}
