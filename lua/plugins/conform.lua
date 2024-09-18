return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      ruby = { "rubocop" },
      vue = { "prettier" },
      markdown = { "markdownlint-cli2" }
    },
  },
}
