return {
  "echasnovski/mini.nvim",
  config = function()
    local miniclue = require("mini.clue")

    miniclue.setup({
      window = {
        delay = 500,
      },
      triggers = {
        -- Leader triggers
        { mode = "n", keys = "<Leader>" },
        { mode = "x", keys = "<Leader>" },

        -- Built-in completion
        { mode = "i", keys = "<C-x>" },

        -- `g` key
        { mode = "n", keys = "g" },
        { mode = "x", keys = "g" },

        -- Marks
        { mode = "n", keys = "'" },
        { mode = "n", keys = "`" },
        { mode = "x", keys = "'" },
        { mode = "x", keys = "`" },

        -- Registers
        { mode = "n", keys = '"' },
        { mode = "x", keys = '"' },
        { mode = "i", keys = "<C-r>" },
        { mode = "c", keys = "<C-r>" },

        -- Window commands
        { mode = "n", keys = "<C-w>" },

        -- `z` key
        { mode = "n", keys = "z" },
        { mode = "x", keys = "z" },
      },
      clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
        { mode = "n", keys = "<Leader><tab>", desc = "+tabs" },
        { mode = "n", keys = "<Leader>b", desc = "+buffers" },
        { mode = "n", keys = "<Leader>c", desc = "+code" },
        { mode = "n", keys = "<Leader>f", desc = "+file/find" },
        { mode = "n", keys = "<Leader>g", desc = "+git" },
        { mode = "n", keys = "<Leader>gh", desc = "+hunks" },
        { mode = "n", keys = "<Leader>q", desc = "+quit/session" },
        { mode = "n", keys = "<Leader>s", desc = "+search" },
        { mode = "n", keys = "<Leader>u", desc = "+ui" },
        { mode = "n", keys = "<Leader>w", desc = "+windows" },
        { mode = "n", keys = "<Leader>x", desc = "+diagnostics/quickfix" },
        { mode = "n", keys = "<Leader>t", desc = "+toggle/test" },
        { mode = "n", keys = "<Leader>y", desc = "+yank" },
      },
    })
  end,
}
