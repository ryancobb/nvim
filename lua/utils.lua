local M = {}

function M.set_keymaps(keymaps)
  local opts = {
    noremap = true,
    silent = true
  }

  for mode, keymappings in pairs(keymaps) do
    for _, keymap in ipairs(keymappings) do
      vim.api.nvim_set_keymap(mode, keymap[1], keymap[2], opts)
    end
  end
end

return M
