return {
  "cbochs/grapple.nvim",
  opts = {
    scope = "git_branch",
    icons = true,
    quick_select = "123456789",
  },
  keys = {
    { ";", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },

    { "<c-s>", "<cmd>Grapple tag<cr>", desc = "Toggle tag" },
    { "H", "<cmd>Grapple cycle forward<cr>", desc = "Go to next tag" },
    { "L", "<cmd>Grapple cycle backward<cr>", desc = "Go to previous tag" },
  },
}
